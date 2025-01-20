@interface GEOSearchAttributionManifestManager
+ (id)sharedManager;
+ (void)setUseLocalProxy:(BOOL)a3;
+ (void)useLocalProxy;
+ (void)useProxy:(Class)a3;
+ (void)useRemoteProxy;
- (GEOSearchAttributionManifestManager)init;
- (GEOSearchAttributionServerProxy)serverProxy;
- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4;
@end

@implementation GEOSearchAttributionManifestManager

- (void)loadAttributionInfoForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  serverProxy = self->_serverProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__GEOSearchAttributionManifestManager_loadAttributionInfoForIdentifiers_completionHandler___block_invoke;
  v9[3] = &unk_1E53E4E48;
  id v10 = v6;
  id v8 = v6;
  [(GEOSearchAttributionServerProxy *)serverProxy loadAttributionInfoForIdentifiers:a3 completionHandler:v9];
}

+ (id)sharedManager
{
  if (qword_1EB2A0218 != -1) {
    dispatch_once(&qword_1EB2A0218, &__block_literal_global_154);
  }
  v2 = (void *)_MergedGlobals_294;

  return v2;
}

uint64_t __91__GEOSearchAttributionManifestManager_loadAttributionInfoForIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __52__GEOSearchAttributionManifestManager_sharedManager__block_invoke()
{
  v0 = objc_alloc_init(GEOSearchAttributionManifestManager);
  v1 = (void *)_MergedGlobals_294;
  _MergedGlobals_294 = (uint64_t)v0;
}

- (GEOSearchAttributionManifestManager)init
{
  v8.receiver = self;
  v8.super_class = (Class)GEOSearchAttributionManifestManager;
  v2 = [(GEOSearchAttributionManifestManager *)&v8 init];
  if (v2)
  {
    v3 = (objc_class *)_proxyClass_1;
    if (!_proxyClass_1)
    {
      [(id)objc_opt_class() useRemoteProxy];
      v3 = (objc_class *)_proxyClass_1;
    }
    v4 = (GEOSearchAttributionServerProxy *)objc_alloc_init(v3);
    serverProxy = v2->_serverProxy;
    v2->_serverProxy = v4;

    id v6 = v2;
  }

  return v2;
}

+ (void)useRemoteProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 useProxy:v3];
}

+ (void)useProxy:(Class)a3
{
  _proxyClass_1 = (uint64_t)a3;
}

+ (void)useLocalProxy
{
  uint64_t v3 = objc_opt_class();

  [a1 useProxy:v3];
}

+ (void)setUseLocalProxy:(BOOL)a3
{
  if (a3) {
    [a1 useLocalProxy];
  }
  else {
    [a1 useRemoteProxy];
  }
}

- (GEOSearchAttributionServerProxy)serverProxy
{
  return self->_serverProxy;
}

- (void).cxx_destruct
{
}

@end