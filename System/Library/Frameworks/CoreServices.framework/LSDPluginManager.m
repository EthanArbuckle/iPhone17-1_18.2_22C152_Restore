@interface LSDPluginManager
+ (id)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSDictionary)pluginsByBundleIentifier;
- (NSXPCListener)listener;
- (void)endpointForServiceIdentifier:(id)a3 reply:(id)a4;
- (void)loadPluginsAtURL:(id)a3;
- (void)setListener:(id)a3;
- (void)setPluginsByBundleIentifier:(id)a3;
- (void)startPlugins;
@end

@implementation LSDPluginManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_35);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

void __34__LSDPluginManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(LSDPluginManager);
  v1 = (void *)sharedInstance_sharedInstance_1;
  sharedInstance_sharedInstance_1 = (uint64_t)v0;
}

- (void)loadPluginsAtURL:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  context = (void *)MEMORY[0x18530F680]();
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  v30 = v4;
  v6 = [v5 enumeratorAtURL:v4 includingPropertiesForKeys:0 options:7 errorHandler:&__block_literal_global_5_0];

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v35;
    v11 = @"lsdplugin";
    uint64_t v31 = *(void *)v35;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v35 != v10) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v34 + 1) + 8 * v12);
        v14 = [v13 pathExtension];
        int v15 = [v14 isEqualToString:v11];

        if (!v15)
        {
          v20 = 0;
          v17 = 0;
          goto LABEL_22;
        }
        v16 = [MEMORY[0x1E4F28B50] bundleWithURL:v13];
        v17 = v16;
        if (!v16)
        {
          v20 = 0;
          goto LABEL_22;
        }
        v18 = v7;
        v19 = v11;
        v20 = [v16 bundleIdentifier];
        if (!v20)
        {
          id v22 = 0;
LABEL_16:
          v25 = _LSDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v39 = v13;
            __int16 v40 = 2112;
            v41 = v20;
            __int16 v42 = 2112;
            id v43 = v22;
            _os_log_impl(&dword_182959000, v25, OS_LOG_TYPE_DEFAULT, "Failed to load plugin with URL: %@ bundle identifier %@ error: %@", buf, 0x20u);
          }

LABEL_19:
          v11 = v19;
          v7 = v18;
          goto LABEL_20;
        }
        id v33 = 0;
        char v21 = [v17 loadAndReturnError:&v33];
        id v22 = v33;
        if ((v21 & 1) == 0) {
          goto LABEL_16;
        }
        v23 = (void *)[v17 principalClass];
        if (![v23 conformsToProtocol:&unk_1ECB64330]) {
          goto LABEL_19;
        }
        id v24 = objc_alloc_init((Class)v23);

        v11 = v19;
        if (!v24)
        {
          v7 = v18;
          goto LABEL_21;
        }
        v7 = v18;
        [v18 setObject:v24 forKey:v20];
        id v22 = v24;
LABEL_20:

LABEL_21:
        uint64_t v10 = v31;
LABEL_22:
        v26 = (NSDictionary *)[v7 copy];
        pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
        self->_pluginsByBundleIentifier = v26;

        ++v12;
      }
      while (v9 != v12);
      uint64_t v28 = [obj countByEnumeratingWithState:&v34 objects:v44 count:16];
      uint64_t v9 = v28;
    }
    while (v28);
  }
}

uint64_t __37__LSDPluginManager_loadPluginsAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  v6 = _LSDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v4;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_DEFAULT, "Error enumerating URL: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (void)startPlugins
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = self->_pluginsByBundleIentifier;
  uint64_t v4 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = -[NSDictionary objectForKey:](self->_pluginsByBundleIentifier, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v7), (void)v12);
        [v8 start];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSDictionary *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  id v9 = [(id)__LSDefaultsGetSharedInstance() serviceNameForConnectionType:4];
  __int16 v10 = (NSXPCListener *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:v9];
  listener = self->_listener;
  self->_listener = v10;

  [(NSXPCListener *)self->_listener setDelegate:self];
  [(NSXPCListener *)self->_listener resume];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F29280];
  id v6 = a4;
  uint64_t v7 = [v5 interfaceWithProtocol:&unk_1ECB582E8];
  [v6 setExportedInterface:v7];
  [v6 setExportedObject:self];
  [v6 resume];

  return 1;
}

- (void)endpointForServiceIdentifier:(id)a3 reply:(id)a4
{
  pluginsByBundleIentifier = self->_pluginsByBundleIentifier;
  id v6 = (void (**)(id, void *))a4;
  id v8 = [(NSDictionary *)pluginsByBundleIentifier objectForKey:a3];
  uint64_t v7 = [v8 XPCListenerEndpoint];
  v6[2](v6, v7);
}

- (NSDictionary)pluginsByBundleIentifier
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPluginsByBundleIentifier:(id)a3
{
}

- (NSXPCListener)listener
{
  return (NSXPCListener *)objc_getProperty(self, a2, 16, 1);
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);

  objc_storeStrong((id *)&self->_pluginsByBundleIentifier, 0);
}

@end