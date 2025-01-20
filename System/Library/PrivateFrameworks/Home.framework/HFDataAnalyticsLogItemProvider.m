@interface HFDataAnalyticsLogItemProvider
+ (BOOL)prefersNonBlockingReloads;
- (HFDataAnalyticsLogItemProvider)init;
- (HFDataAnalyticsLogItemProvider)initWithMediaProfileContainer:(id)a3;
- (HFMediaProfileContainer)mediaProfileContainer;
- (NAFuture)logFetchFuture;
- (NSMapTable)logEntryUniqueIdentifierToLogItemMap;
- (NSMutableSet)logItems;
- (id)copyWithZone:(_NSZone *)a3;
- (id)invalidationReasons;
- (id)reloadItems;
- (void)setLogFetchFuture:(id)a3;
@end

@implementation HFDataAnalyticsLogItemProvider

+ (BOOL)prefersNonBlockingReloads
{
  return 1;
}

- (HFDataAnalyticsLogItemProvider)initWithMediaProfileContainer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"HFDataAnalyticsLogItemProvider.m", 32, @"Invalid parameter not satisfying: %@", @"mediaProfileContainer" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)HFDataAnalyticsLogItemProvider;
  v7 = [(HFItemProvider *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_mediaProfileContainer, a3);
    uint64_t v9 = objc_opt_new();
    logItems = v8->_logItems;
    v8->_logItems = (NSMutableSet *)v9;

    uint64_t v11 = [MEMORY[0x263F08968] strongToWeakObjectsMapTable];
    logEntryUniqueIdentifierToLogItemMap = v8->_logEntryUniqueIdentifierToLogItemMap;
    v8->_logEntryUniqueIdentifierToLogItemMap = (NSMapTable *)v11;
  }
  return v8;
}

- (HFDataAnalyticsLogItemProvider)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithMediaProfileContainer_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFDataAnalyticsLogItemProvider.m", 45, @"%s is unavailable; use %@ instead",
    "-[HFDataAnalyticsLogItemProvider init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HFDataAnalyticsLogItemProvider *)self mediaProfileContainer];
  id v6 = (void *)[v4 initWithMediaProfileContainer:v5];

  return v6;
}

- (NAFuture)logFetchFuture
{
  logFetchFuture = self->_logFetchFuture;
  if (!logFetchFuture)
  {
    id v4 = [(HFDataAnalyticsLogItemProvider *)self mediaProfileContainer];
    objc_msgSend(v4, "hf_fetchLogListWithTimeout:", *(double *)&kHFDataAnalyticsFetchLogListTimeout);
    v5 = (NAFuture *)objc_claimAutoreleasedReturnValue();
    id v6 = self->_logFetchFuture;
    self->_logFetchFuture = v5;

    logFetchFuture = self->_logFetchFuture;
  }
  v7 = logFetchFuture;
  return v7;
}

- (id)reloadItems
{
  objc_initWeak(&location, self);
  v3 = [(HFDataAnalyticsLogItemProvider *)self logFetchFuture];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke;
  v6[3] = &unk_264098C30;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  id v4 = [v3 flatMap:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
  return v4;
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_2;
  aBlock[3] = &unk_264098BE8;
  id v4 = (id *)(a1 + 40);
  objc_copyWeak(&v12, (id *)(a1 + 40));
  v5 = _Block_copy(aBlock);
  id v6 = [*(id *)(a1 + 32) reloadItemsWithObjects:v3 keyAdaptor:&__block_literal_global_172 itemAdaptor:&__block_literal_global_19_9 filter:0 itemMap:v5];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_5;
  v9[3] = &unk_26408D198;
  objc_copyWeak(&v10, v4);
  id v7 = [v6 flatMap:v9];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&v12);
  return v7;
}

HFDataAnalyticsLogItem *__45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = [WeakRetained logEntryUniqueIdentifierToLogItemMap];
  id v6 = [v5 objectForKey:v3];

  if (!v6)
  {
    id v7 = [HFDataAnalyticsLogItem alloc];
    v8 = [WeakRetained mediaProfileContainer];
    id v6 = [(HFDataAnalyticsLogItem *)v7 initWithMediaProfileContainer:v8 name:v3];
  }
  return v6;
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  return v2;
}

uint64_t __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 name];
}

id __45__HFDataAnalyticsLogItemProvider_reloadItems__block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v5 = [WeakRetained logItems];
  id v6 = [v3 addedItems];
  [v5 unionSet:v6];

  id v7 = [WeakRetained logItems];
  v8 = [v3 removedItems];
  [v7 minusSet:v8];

  [WeakRetained setLogFetchFuture:0];
  uint64_t v9 = [MEMORY[0x263F58190] futureWithResult:v3];

  return v9;
}

- (id)invalidationReasons
{
  v5.receiver = self;
  v5.super_class = (Class)HFDataAnalyticsLogItemProvider;
  id v2 = [(HFItemProvider *)&v5 invalidationReasons];
  id v3 = [v2 setByAddingObject:@"accessory"];

  return v3;
}

- (HFMediaProfileContainer)mediaProfileContainer
{
  return self->_mediaProfileContainer;
}

- (void)setLogFetchFuture:(id)a3
{
}

- (NSMutableSet)logItems
{
  return self->_logItems;
}

- (NSMapTable)logEntryUniqueIdentifierToLogItemMap
{
  return self->_logEntryUniqueIdentifierToLogItemMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEntryUniqueIdentifierToLogItemMap, 0);
  objc_storeStrong((id *)&self->_logItems, 0);
  objc_storeStrong((id *)&self->_logFetchFuture, 0);
  objc_storeStrong((id *)&self->_mediaProfileContainer, 0);
}

@end