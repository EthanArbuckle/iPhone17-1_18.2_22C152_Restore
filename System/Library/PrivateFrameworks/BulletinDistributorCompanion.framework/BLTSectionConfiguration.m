@interface BLTSectionConfiguration
- (BLTSectionConfiguration)initWithWatchKitAppList:(id)a3;
- (BLTSectionConfigurationDelegate)delegate;
- (BOOL)override:(id)a3 appliesToConfigurationForSectionID:(id)a4;
- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3;
- (void)_waitForWatchKitAppListLoaded;
- (void)setDelegate:(id)a3;
- (void)watchKitAppList:(id)a3 added:(id)a4 removed:(id)a5;
@end

@implementation BLTSectionConfiguration

- (BLTSectionConfiguration)initWithWatchKitAppList:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)BLTSectionConfiguration;
  v6 = [(BLTSectionConfigurationInternal *)&v15 init];
  v7 = v6;
  if (v6)
  {
    p_watchKitAppList = (id *)&v6->_watchKitAppList;
    objc_storeStrong((id *)&v6->_watchKitAppList, a3);
    [*p_watchKitAppList setDelegate:v7];
    v9 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    watchKitAppListLoadedCondition = v7->_watchKitAppListLoadedCondition;
    v7->_watchKitAppListLoadedCondition = v9;

    if (([*p_watchKitAppList isLoaded] & 1) == 0)
    {
      id v11 = *p_watchKitAppList;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __51__BLTSectionConfiguration_initWithWatchKitAppList___block_invoke;
      v13[3] = &unk_264683BD8;
      v14 = v7;
      [v11 fetchWatchKitInfoWithCompletion:v13];
    }
  }

  return v7;
}

uint64_t __51__BLTSectionConfiguration_initWithWatchKitAppList___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) lock];
  *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
  [*(id *)(*(void *)(a1 + 32) + 24) signal];
  v2 = *(void **)(*(void *)(a1 + 32) + 24);
  return [v2 unlock];
}

- (void)_waitForWatchKitAppListLoaded
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_222F4C000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for watchkit app list to load", buf, 2u);
}

- (void)watchKitAppList:(id)a3 added:(id)a4 removed:(id)a5
{
  p_delegate = &self->_delegate;
  id v8 = a5;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained sectionConfiguration:self addedSectionIDs:v9 removedSectionIDs:v8];
}

- (BOOL)shouldSectionIDSettingsAlwaysSync:(id)a3
{
  id v4 = a3;
  [(BLTSectionConfiguration *)self _waitForWatchKitAppListLoaded];
  id v5 = [(BLTWatchKitAppList *)self->_watchKitAppList watchKitAppDefinitionWithBundleID:v4];
  if ([v5 isInstalled])
  {
    BOOL v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BLTSectionConfiguration;
    BOOL v6 = [(BLTSectionConfigurationInternal *)&v8 shouldSectionIDSettingsAlwaysSync:v4];
  }

  return v6;
}

- (BOOL)override:(id)a3 appliesToConfigurationForSectionID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2BB58]];
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    v10 = [v6 objectForKeyedSubscript:*MEMORY[0x263F2BB50]];
    int v11 = [v10 BOOLValue];

    if (v11) {
      uint64_t v12 = 0;
    }
    else {
      uint64_t v12 = 2;
    }
    BOOL v13 = [(BLTSectionConfigurationInternal *)self setCoordinationType:v12 sectionID:v7];
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BLTSectionConfigurationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSectionConfigurationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchKitAppListLoadedCondition, 0);
  objc_storeStrong((id *)&self->_watchKitAppList, 0);
}

@end