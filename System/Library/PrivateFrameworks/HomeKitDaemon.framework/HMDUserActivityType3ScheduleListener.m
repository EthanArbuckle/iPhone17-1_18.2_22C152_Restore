@interface HMDUserActivityType3ScheduleListener
- (BOOL)isConfigured;
- (HKSPSleepStore)store;
- (HMDHomeActivityStateManagerDataSource)dataSource;
- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber;
- (HMDUserActivityType3Schedule)schedule;
- (HMDUserActivityType3ScheduleFactory)factory;
- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4;
- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4 biomeStreamSubscriber:(id)a5 factory:(id)a6;
- (HMDUserActivityType3ScheduleListenerDelegate)delegate;
- (OS_dispatch_queue)queue;
- (void)biomeEventDidUpdate;
- (void)configureWithCompletion:(id)a3;
- (void)setConfigured:(BOOL)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStore:(id)a3;
- (void)unconfigure;
@end

@implementation HMDUserActivityType3ScheduleListener

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_factory, 0);
  objc_storeStrong((id *)&self->_biomeSubscriber, 0);
  objc_destroyWeak((id *)&self->_queue);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_store, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (HMDUserActivityType3ScheduleFactory)factory
{
  return self->_factory;
}

- (HMDUserActivityType3BiomeStreamSubscriber)biomeSubscriber
{
  return self->_biomeSubscriber;
}

- (OS_dispatch_queue)queue
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue);
  return (OS_dispatch_queue *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (HMDHomeActivityStateManagerDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (HMDHomeActivityStateManagerDataSource *)WeakRetained;
}

- (void)setStore:(id)a3
{
}

- (HKSPSleepStore)store
{
  return self->_store;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (void)setDelegate:(id)a3
{
}

- (HMDUserActivityType3ScheduleListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HMDUserActivityType3ScheduleListenerDelegate *)WeakRetained;
}

- (void)biomeEventDidUpdate
{
  v3 = [(HMDUserActivityType3ScheduleListener *)self dataSource];
  v4 = [v3 queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__HMDUserActivityType3ScheduleListener_biomeEventDidUpdate__block_invoke;
  block[3] = &unk_264A2F7F8;
  block[4] = self;
  dispatch_async(v4, block);
}

void __59__HMDUserActivityType3ScheduleListener_biomeEventDidUpdate__block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) delegate];
  v2 = [*(id *)(a1 + 32) biomeSubscriber];
  v3 = [v2 mostRecentEvent];

  v4 = [*(id *)(a1 + 32) factory];
  v5 = [v4 scheduleFromBiomeEvent:v3];

  if (v5)
  {
    uint64_t v6 = [v5 stateChangedReason];
    if (v6 == 2)
    {
      [v7 userDidUpdateSchedule];
    }
    else if (v6 == 1)
    {
      [v7 scheduleStateDidAutomaticallyUpdate];
    }
  }
}

- (HMDUserActivityType3Schedule)schedule
{
  if ([(HMDUserActivityType3ScheduleListener *)self isConfigured])
  {
    v3 = [(HMDUserActivityType3ScheduleListener *)self biomeSubscriber];
    v4 = [v3 mostRecentEvent];

    v5 = [(HMDUserActivityType3ScheduleListener *)self factory];
    uint64_t v6 = [v5 scheduleFromBiomeEvent:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (HMDUserActivityType3Schedule *)v6;
}

- (BOOL)isConfigured
{
  v3 = [(HMDUserActivityType3ScheduleListener *)self store];
  if (v3)
  {
    v4 = [(HMDUserActivityType3ScheduleListener *)self biomeSubscriber];
    char v5 = [v4 isConfigured];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)unconfigure
{
  v3 = [(HMDUserActivityType3ScheduleListener *)self biomeSubscriber];
  [v3 unconfigure];

  id v4 = [(HMDUserActivityType3ScheduleListener *)self store];
  [v4 removeObserver:self];
}

- (void)configureWithCompletion:(id)a3
{
  id v4 = a3;
  char v5 = [(HMDUserActivityType3ScheduleListener *)self biomeSubscriber];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__HMDUserActivityType3ScheduleListener_configureWithCompletion___block_invoke;
  v7[3] = &unk_264A2F870;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 configureWithCompletion:v7];
}

uint64_t __64__HMDUserActivityType3ScheduleListener_configureWithCompletion___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [v2 biomeSubscriber];
  [v3 setDelegate:v2];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4 biomeStreamSubscriber:(id)a5 factory:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)HMDUserActivityType3ScheduleListener;
  v14 = [(HMDUserActivityType3ScheduleListener *)&v21 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_dataSource, v11);
    objc_storeStrong((id *)&v15->_biomeSubscriber, a5);
    objc_storeStrong((id *)&v15->_factory, a6);
    id v16 = objc_alloc(MEMORY[0x263F75EA8]);
    v17 = HKSPGenerateSleepStoreIdentifier();
    uint64_t v18 = [v16 initWithIdentifier:v17];
    store = v15->_store;
    v15->_store = (HKSPSleepStore *)v18;
  }
  return v15;
}

- (HMDUserActivityType3ScheduleListener)initWithIdentifier:(id)a3 dataSource:(id)a4
{
  id v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 stringWithFormat:@"HAS.T3.S.%@", v8];
  id v10 = [HMDUserActivityType3BiomeStreamSubscriber alloc];
  id v11 = BiomeLibrary();
  id v12 = [v11 Sleep];
  id v13 = [v12 ScheduleState];
  v14 = [(HMDUserActivityType3BiomeStreamSubscriber *)v10 initWithIdentifier:v9 stream:v13 filterEventBlock:0];

  v15 = objc_alloc_init(HMDUserActivityType3ScheduleFactory);
  id v16 = [(HMDUserActivityType3ScheduleListener *)self initWithIdentifier:v8 dataSource:v7 biomeStreamSubscriber:v14 factory:v15];

  return v16;
}

@end