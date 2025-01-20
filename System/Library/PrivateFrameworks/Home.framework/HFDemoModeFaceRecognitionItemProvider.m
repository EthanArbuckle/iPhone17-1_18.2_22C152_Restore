@interface HFDemoModeFaceRecognitionItemProvider
- (HFDemoModeFaceRecognitionDataSource)dataSource;
- (HFDemoModeFaceRecognitionItemProvider)init;
- (HMHome)home;
- (NSMutableSet)personItems;
- (id)initForMode:(int64_t)a3 home:(id)a4;
- (id)reloadItems;
- (int64_t)mode;
- (void)setDataSource:(id)a3;
- (void)setHome:(id)a3;
- (void)setMode:(int64_t)a3;
- (void)setPersonItems:(id)a3;
@end

@implementation HFDemoModeFaceRecognitionItemProvider

- (id)initForMode:(int64_t)a3 home:(id)a4
{
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HFDemoModeFaceRecognitionItemProvider;
  v8 = [(HFItemProvider *)&v15 init];
  v9 = v8;
  if (v8)
  {
    v8->_mode = a3;
    uint64_t v10 = [MEMORY[0x263EFF9C0] set];
    personItems = v9->_personItems;
    v9->_personItems = (NSMutableSet *)v10;

    v12 = objc_alloc_init(HFDemoModeFaceRecognitionDataSource);
    dataSource = v9->_dataSource;
    v9->_dataSource = v12;

    objc_storeStrong((id *)&v9->_home, a4);
  }

  return v9;
}

- (HFDemoModeFaceRecognitionItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initForMode_home_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDemoModeFaceRecognitionItemProvider.m", 36, @"%s is unavailable; use %@ instead",
    "-[HFDemoModeFaceRecognitionItemProvider init]",
    v5);

  return 0;
}

- (id)reloadItems
{
  int64_t v3 = [(HFDemoModeFaceRecognitionItemProvider *)self mode];
  v4 = [(HFDemoModeFaceRecognitionItemProvider *)self dataSource];
  v5 = v4;
  if (v3) {
    [v4 knownToHouseholdEntries];
  }
  else {
  v6 = [v4 recentsEntries];
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_3;
  v11[3] = &unk_26409A380;
  v11[4] = self;
  id v7 = [(HFItemProvider *)self reloadItemsWithObjects:v6 keyAdaptor:&__block_literal_global_193 itemAdaptor:&__block_literal_global_12_8 filter:0 itemMap:v11];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_4;
  v10[3] = &unk_264090AC8;
  v10[4] = self;
  v8 = [v7 flatMap:v10];

  return v8;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  id v3 = v2;
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  v6 = [v5 uuid];

  return v6;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 demoRecentsEntry];
  id v3 = [v2 uuid];

  return v3;
}

HFDemoModeFaceRecognitionItem *__52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = [HFDemoModeFaceRecognitionItem alloc];
  v8 = [*(id *)(a1 + 32) home];
  v9 = [(HFDemoModeFaceRecognitionItem *)v7 initWithRecentsData:v6 home:v8];

  return v9;
}

id __52__HFDemoModeFaceRecognitionItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 personItems];
  id v6 = [v4 addedItems];
  [v5 unionSet:v6];

  id v7 = [*(id *)(a1 + 32) personItems];
  v8 = [v4 removedItems];
  [v7 minusSet:v8];

  v9 = [MEMORY[0x263F58190] futureWithResult:v4];

  return v9;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (HFDemoModeFaceRecognitionDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (NSMutableSet)personItems
{
  return self->_personItems;
}

- (void)setPersonItems:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_personItems, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
}

@end