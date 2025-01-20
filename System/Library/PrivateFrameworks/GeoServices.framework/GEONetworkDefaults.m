@interface GEONetworkDefaults
+ (BOOL)useLocalProxy;
+ (GEONetworkDefaults)sharedNetworkDefaults;
+ (void)setUseLocalProxy:(BOOL)a3;
- (GEONetworkDefaults)init;
- (id)allKeys;
- (id)valueForKey:(id)a3;
- (void)allKeysAndValues:(id)a3;
- (void)serverProxy:(id)a3 networkDefaultsDidChange:(id)a4;
- (void)updateIfNecessary:(id)a3;
- (void)updateNetworkDefaults:(id)a3;
- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4;
@end

@implementation GEONetworkDefaults

+ (GEONetworkDefaults)sharedNetworkDefaults
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__GEONetworkDefaults_sharedNetworkDefaults__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FC50 != -1) {
    dispatch_once(&qword_1EB29FC50, block);
  }
  v2 = (void *)qword_1EB29FC48;

  return (GEONetworkDefaults *)v2;
}

- (void)allKeysAndValues:(id)a3
{
  id v4 = a3;
  v5 = GEODefaultsDomain();
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  id v6 = v5;
  v9 = v6;
  id v7 = v4;
  v10 = v7;
  geo_isolate_sync_data();
  if (!*((unsigned char *)v12 + 24)) {
    -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 5, 0, v8, 3221225472, __39__GEONetworkDefaults_allKeysAndValues___block_invoke, &unk_1E53DC378, self, v6, v7, &v11);
  }

  _Block_object_dispose(&v11, 8);
}

void __39__GEONetworkDefaults_allKeysAndValues___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24) != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 24);
    v3 = [*(id *)(a1 + 40) lastPathComponent];
    id v4 = [v2 objectForKey:v3];
  }
  else
  {
    id v4 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __26__GEONetworkDefaults_init__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) _updateReason];
  if (!v2)
  {
    uint64_t result = GEOConfigGetBOOL(GeoServicesConfig_ShouldAlwaysUpdateNetworkDefaultsAtLaunch, (uint64_t)off_1E9114088);
    if (!result) {
      return result;
    }
    uint64_t v2 = 1;
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 updateNetworkDefaultsWithReason:v2 completionHandler:0];
}

void __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke(uint64_t a1)
{
}

- (void)updateNetworkDefaultsWithReason:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(id, void))a4;
  serverProxy = self->_serverProxy;
  if (serverProxy)
  {
    -[_GEONetworkDefaultsServerProxy updateNetworkDefaultsWithReason:completionHandler:](serverProxy, "updateNetworkDefaultsWithReason:completionHandler:", a3);
  }
  else if (v6)
  {
    v6[2](v6, 0);
  }

  MEMORY[0x1F4181870]();
}

void __43__GEONetworkDefaults_sharedNetworkDefaults__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = (void *)qword_1EB29FC48;
  qword_1EB29FC48 = (uint64_t)v1;
}

- (GEONetworkDefaults)init
{
  v15.receiver = self;
  v15.super_class = (Class)GEONetworkDefaults;
  uint64_t v2 = [(GEONetworkDefaults *)&v15 init];
  if (v2)
  {
    id v14 = 0;
    uint64_t v3 = readNetworkDefaultsFromFile((uint64_t *)&v14);
    id v4 = v14;
    networkDefaults = v2->_networkDefaults;
    v2->_networkDefaults = (NSDictionary *)v3;

    uint64_t v6 = geo_isolater_create();
    networkDefaultsIsolation = v2->_networkDefaultsIsolation;
    v2->_networkDefaultsIsolation = (geo_isolater *)v6;

    if ((byte_1EB29FC41 & 1) == 0)
    {
      if (_MergedGlobals_244) {
        uint64_t v8 = off_1E53D6D40;
      }
      else {
        uint64_t v8 = off_1E53D6D48;
      }
      v9 = (_GEONetworkDefaultsServerProxy *)objc_alloc_init(*v8);
      serverProxy = v2->_serverProxy;
      v2->_serverProxy = v9;
    }
    [(_GEONetworkDefaultsServerProxy *)v2->_serverProxy setDelegate:v2];
    uint64_t v13 = v2;
    geo_dispatch_async_qos();
    uint64_t v11 = v13;
  }
  return v2;
}

void __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:@"GEONetworkDefaultsDidChangeNotification" object:*(void *)(a1 + 32)];
}

- (void)serverProxy:(id)a3 networkDefaultsDidChange:(id)a4
{
  id v5 = a4;
  void block[5] = MEMORY[0x1E4F143A8];
  block[6] = 3221225472;
  block[7] = __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke;
  block[8] = &unk_1E53D8998;
  block[9] = self;
  id v8 = v5;
  id v6 = v5;
  geo_isolate_sync_data();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__GEONetworkDefaults_serverProxy_networkDefaultsDidChange___block_invoke_2;
  block[3] = &unk_1E53D79D8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  _MergedGlobals_244 = a3;
}

+ (BOOL)useLocalProxy
{
  return _MergedGlobals_244;
}

- (void)updateIfNecessary:(id)a3
{
  id v5 = (void (**)(id, void))a3;
  uint64_t v4 = [(_GEONetworkDefaultsServerProxy *)self->_serverProxy _updateReason];
  if (v4)
  {
    [(GEONetworkDefaults *)self updateNetworkDefaultsWithReason:v4 completionHandler:v5];
  }
  else if (v5)
  {
    v5[2](v5, 0);
  }
}

- (void)updateNetworkDefaults:(id)a3
{
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    GEODefaultsDomain();
    uint64_t v15 = 0;
    v16 = &v15;
    uint64_t v17 = 0x2020000000;
    char v18 = 0;
    uint64_t v9 = 0;
    v10 = &v9;
    uint64_t v11 = 0x3032000000;
    v12 = __Block_byref_object_copy__48;
    uint64_t v13 = __Block_byref_object_dispose__48;
    id v14 = 0;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v8 = v4;
    geo_isolate_sync_data();
    if (!*((unsigned char *)v16 + 24)) {
      [(GEONetworkDefaults *)self updateNetworkDefaultsWithReason:5 completionHandler:0];
    }
    id v6 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
    _Block_object_dispose(&v15, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __34__GEONetworkDefaults_valueForKey___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24) != 0;
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  int v4 = *(unsigned __int8 *)(v3 + 24);
  if (*(unsigned char *)(v3 + 24))
  {
    id v5 = *(void **)(*(void *)(a1 + 32) + 24);
    id v7 = [*(id *)(a1 + 40) lastPathComponent];
    id v1 = objc_msgSend(v5, "objectForKey:");
    id v6 = [v1 objectForKeyedSubscript:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v6);
  if (v4)
  {
  }
}

- (id)allKeys
{
  uint64_t v3 = GEODefaultsDomain();
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__48;
  uint64_t v13 = __Block_byref_object_dispose__48;
  id v14 = 0;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  id v4 = v3;
  id v8 = v4;
  geo_isolate_sync_data();
  if (!*((unsigned char *)v16 + 24)) {
    -[GEONetworkDefaults updateNetworkDefaultsWithReason:completionHandler:](self, "updateNetworkDefaultsWithReason:completionHandler:", 5, 0, v7, 3221225472, __29__GEONetworkDefaults_allKeys__block_invoke, &unk_1E53DBF38, self, v4, &v15, &v9);
  }
  id v5 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

void __29__GEONetworkDefaults_allKeys__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 24) != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = *(void **)(*(void *)(a1 + 32) + 24);
    uint64_t v3 = [*(id *)(a1 + 40) lastPathComponent];
    id v8 = [v2 objectForKey:v3];

    id v4 = [v8 allKeys];
    uint64_t v5 = [v4 copy];
    uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_networkDefaultsIsolation, 0);
  objc_storeStrong((id *)&self->_networkDefaults, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);

  objc_storeStrong((id *)&self->_serverProxy, 0);
}

@end