@interface _DKAppInstallMonitor
+ (id)_dateFromProxy:(id)a3;
+ (id)_eventWithAppProxy:(id)a3 didInstall:(BOOL)a4;
+ (id)_identifierFromProxy:(id)a3;
+ (id)_metadataFromProxy:(id)a3 didInstall:(BOOL)a4;
+ (id)entitlements;
+ (id)eventStream;
- (BMSource)source;
- (LSApplicationWorkspace)appWorkspace;
- (_DKAppInstallMonitor)init;
- (id)historicalDeletingHandler;
- (void)_applicationsDidChange:(id)a3 didInstall:(BOOL)a4;
- (void)applicationsDidInstall:(id)a3;
- (void)applicationsDidUninstall:(id)a3;
- (void)init;
- (void)setAppWorkspace:(id)a3;
- (void)setHistoricalDeletingHandler:(id)a3;
- (void)setSource:(id)a3;
@end

@implementation _DKAppInstallMonitor

- (_DKAppInstallMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)_DKAppInstallMonitor;
  v2 = [(_DKMonitor *)&v12 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 App];
    v5 = [v4 Install];
    uint64_t v6 = [v5 source];
    source = v2->_source;
    v2->_source = (BMSource *)v6;

    uint64_t v8 = [MEMORY[0x263F01880] defaultWorkspace];
    appWorkspace = v2->_appWorkspace;
    v2->_appWorkspace = (LSApplicationWorkspace *)v8;

    [(LSApplicationWorkspace *)v2->_appWorkspace addObserver:v2];
    v10 = [MEMORY[0x263F34FB8] knowledgeChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[_DKAppInstallMonitor init](v10);
    }
  }
  return v2;
}

+ (id)eventStream
{
  return @"AppInstall";
}

+ (id)entitlements
{
  return 0;
}

+ (id)_metadataFromProxy:(id)a3 didInstall:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x263EFF9A0] dictionary];
  v7 = [v5 itemName];
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F35010] title];
    [v6 setObject:v7 forKeyedSubscript:v8];
  }
  v9 = [v5 genre];
  if (v9)
  {
    v10 = [MEMORY[0x263F35010] primaryCategory];
    [v6 setObject:v9 forKeyedSubscript:v10];
  }
  v11 = [v5 subgenres];
  objc_super v12 = [MEMORY[0x263EFF980] array];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v24 = v11;
    v25 = v9;
    v26 = v7;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v19 = [v18 objectForKeyedSubscript:@"genre"];
            if (v19) {
              [v12 addObject:v19];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v15);
    }

    v7 = v26;
    uint64_t v4 = v4;
    v9 = v25;
  }
  if (objc_msgSend(v12, "count", v24, v25))
  {
    v20 = [MEMORY[0x263F35010] subCategories];
    [v6 setObject:v12 forKeyedSubscript:v20];
  }
  v21 = [NSNumber numberWithBool:v4];
  v22 = [MEMORY[0x263F35010] isInstall];
  [v6 setObject:v21 forKeyedSubscript:v22];

  return v6;
}

+ (id)_identifierFromProxy:(id)a3
{
  return (id)[a3 bundleIdentifier];
}

+ (id)_dateFromProxy:(id)a3
{
  return (id)[a3 registeredDate];
}

+ (id)_eventWithAppProxy:(id)a3 didInstall:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = [a1 _metadataFromProxy:v6 didInstall:v4];
  uint64_t v8 = [a1 _identifierFromProxy:v6];
  v9 = [a1 _dateFromProxy:v6];

  v10 = (void *)MEMORY[0x263F35088];
  v11 = [MEMORY[0x263F35148] appInstallStream];
  objc_super v12 = [MEMORY[0x263F35058] withBundle:v8];
  id v13 = [v10 eventWithStream:v11 startDate:v9 endDate:v9 value:v12 metadata:v7];

  return v13;
}

- (void)_applicationsDidChange:(id)a3 didInstall:(BOOL)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v7 = [(_DKMonitor *)self queue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __58___DKAppInstallMonitor__applicationsDidChange_didInstall___block_invoke;
  v13[3] = &unk_264714D80;
  id v8 = v6;
  id v14 = v8;
  objc_copyWeak(&v15, &location);
  BOOL v16 = a4;
  v9 = v13;
  v10 = v7;
  v11 = (void *)os_transaction_create();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __cd_dispatch_async_capture_tx_block_invoke_5;
  block[3] = &unk_2647148A0;
  id v19 = v11;
  id v20 = v9;
  id v12 = v11;
  dispatch_async(v10, block);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

- (void)applicationsDidInstall:(id)a3
{
}

- (void)applicationsDidUninstall:(id)a3
{
}

- (id)historicalDeletingHandler
{
  return self->historicalDeletingHandler;
}

- (void)setHistoricalDeletingHandler:(id)a3
{
}

- (LSApplicationWorkspace)appWorkspace
{
  return self->_appWorkspace;
}

- (void)setAppWorkspace:(id)a3
{
}

- (BMSource)source
{
  return self->_source;
}

- (void)setSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_appWorkspace, 0);
  objc_storeStrong(&self->historicalDeletingHandler, 0);
}

- (void)init
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_225002000, log, OS_LOG_TYPE_DEBUG, "_DKAppInstallMonitor added LSApplicationWorkspace observer.", v1, 2u);
}

@end