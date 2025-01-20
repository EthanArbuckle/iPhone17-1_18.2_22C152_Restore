@interface HMDUserActivityType3FocusListener
- (BOOL)isConfigured;
- (HMDHomeActivityStateManagerDataSource)dataSource;
- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber;
- (HMDUserActivityType3FocusListener)initWithIdentifier:(id)a3 dataSource:(id)a4;
- (HMDUserActivityType3FocusListenerDelegate)delegate;
- (HMDUserType3Focus)focus;
- (void)biomeEventDidUpdate;
- (void)configureWithCompletion:(id)a3;
- (void)setDelegate:(id)a3;
- (void)unconfigure;
@end

@implementation HMDUserActivityType3FocusListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_biomeSubscriber, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber
{
  return self->_biomeSubscriber;
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserActivityType3FocusListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserActivityType3FocusListenerDelegate *)WeakRetained;
}

- (void)biomeEventDidUpdate
{
  v3 = [(HMDUserActivityType3FocusListener *)self dataSource];
  v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__HMDUserActivityType3FocusListener_biomeEventDidUpdate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __56__HMDUserActivityType3FocusListener_biomeEventDidUpdate__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) biomeSubscriber];
  id v4 = [v2 mostRecentEvent];

  if (v4)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    [v3 focusDidTrigger];
  }
}

- (HMDUserType3Focus)focus
{
  v3 = [(HMDUserActivityType3FocusListener *)self dataSource];
  id v4 = [v3 queue];
  dispatch_assert_queue_V2(v4);

  if ([(HMDUserActivityType3FocusListener *)self isConfigured])
  {
    v5 = [(HMDUserActivityType3FocusListener *)self biomeSubscriber];
    v6 = [v5 mostRecentEvent];

    if (v6)
    {
      v7 = [v6 eventBody];
      id v8 = objc_alloc(MEMORY[0x263EFF910]);
      [v6 timestamp];
      v9 = objc_msgSend(v8, "initWithTimeIntervalSinceReferenceDate:");
      v10 = -[HMDUserType3Focus initWithEnabled:updatedTime:userActionTriggered:]([HMDUserType3Focus alloc], "initWithEnabled:updatedTime:userActionTriggered:", [v7 starting], v9, objc_msgSend(v7, "updateReason") == 1);
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)isConfigured
{
  v2 = [(HMDUserActivityType3FocusListener *)self biomeSubscriber];
  char v3 = [v2 isConfigured];

  return v3;
}

- (void)unconfigure
{
  id v2 = [(HMDUserActivityType3FocusListener *)self biomeSubscriber];
  [v2 unconfigure];
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(HMDUserActivityType3FocusListener *)self biomeSubscriber];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__HMDUserActivityType3FocusListener_configureWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureWithCompletion:v7];
}

uint64_t __61__HMDUserActivityType3FocusListener_configureWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  char v3 = [v2 biomeSubscriber];
  [v3 setDelegate:v2];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (HMDUserActivityType3FocusListener)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HMDUserActivityType3FocusListener;
  id v8 = [(HMDUserActivityType3FocusListener *)&v17 init];
  if (v8)
  {
    v9 = [NSString stringWithFormat:@"HAS.T3.F.%@", v6];
    objc_storeStrong((id *)&v8->_dataSource, a4);
    v10 = [HMDUserActivityType3BiomeStreamSubscriber alloc];
    v11 = BiomeLibrary();
    v12 = [v11 UserFocus];
    v13 = [v12 ComputedMode];
    uint64_t v14 = [(HMDUserActivityType3BiomeStreamSubscriber *)v10 initWithIdentifier:v9 stream:v13 filterEventBlock:&__block_literal_global_114317];
    biomeSubscriber = v8->_biomeSubscriber;
    v8->_biomeSubscriber = (HMDUserActivityType3BiomeStreamSubscriber *)v14;
  }
  return v8;
}

BOOL __67__HMDUserActivityType3FocusListener_initWithIdentifier_dataSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 eventBody];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v3 = v2;
  }
  else {
    char v3 = 0;
  }
  id v4 = v3;

  int v5 = [v4 semanticType];
  return v5 == 3;
}

@end