@interface GEOConfigStorageClient
+ (GEOConfigStorageClient)shared;
- (id)_init;
- (id)getAllKeysAndValuesForOptions:(unint64_t)a3;
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
- (void)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 result:(id)a6;
- (void)getExpiringKeys:(unint64_t)a3 result:(id)a4;
- (void)migrateEntitledKey:(id)a3 options:(unint64_t)a4;
- (void)setConfigKeyExpiry:(id)a3 options:(unint64_t)a4 date:(id)a5 osVersion:(id)a6;
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageClient

+ (GEOConfigStorageClient)shared
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__GEOConfigStorageClient_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB29FC70 != -1) {
    dispatch_once(&qword_1EB29FC70, block);
  }
  v2 = (void *)_MergedGlobals_245;

  return (GEOConfigStorageClient *)v2;
}

- (id)getAllKeysAndValuesForOptions:(unint64_t)a3
{
  return _GEOGetAllValuesInStore(a3);
}

- (void)getExpiringKeys:(unint64_t)a3 result:(id)a4
{
  id v5 = a4;
  v6 = [[GEOConfigGetExpiringKeysRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigGetExpiringKeysRequest *)v6 setKeyOptions:a3];
  v7 = _GEODefaultsServerConnection();
  global_queue = (void *)geo_get_global_queue();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__GEOConfigStorageClient_getExpiringKeys_result___block_invoke;
  v10[3] = &unk_1E53E4798;
  id v11 = v5;
  id v9 = v5;
  [(GEOXPCRequest *)v6 send:v7 withReply:global_queue handler:v10];
}

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  id v9 = a4;
  id v10 = a3;
  v13 = [[GEOConfigStorageSetValueForKeyRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigStorageSetValueForKeyRequest *)v13 setKeyOptions:a5];
  [(GEOConfigStorageSetValueForKeyRequest *)v13 setKeyString:v9];

  [(GEOConfigStorageSetValueForKeyRequest *)v13 setKeyValue:v10];
  id v11 = _GEODefaultsServerConnection();
  if (v6) {
    id v12 = [(GEOXPCRequest *)v13 sendSync:v11 error:0];
  }
  else {
    [(GEOXPCRequest *)v13 send:v11];
  }
}

void __32__GEOConfigStorageClient_shared__block_invoke(uint64_t a1)
{
  uint64_t v1 = [objc_alloc(*(Class *)(a1 + 32)) _init];
  v2 = (void *)_MergedGlobals_245;
  _MergedGlobals_245 = v1;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)GEOConfigStorageClient;
  return [(GEOConfigStorageClient *)&v3 init];
}

void __49__GEOConfigStorageClient_getExpiringKeys_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [a2 expiringKeys];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (void)migrateEntitledKey:(id)a3 options:(unint64_t)a4
{
  id v5 = a3;
  v7 = [[GEOConfigMigrateEntitledKeyRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigMigrateEntitledKeyRequest *)v7 setKeyString:v5];

  [(GEOConfigMigrateEntitledKeyRequest *)v7 setKeyOptions:a4];
  BOOL v6 = _GEODefaultsServerConnection();
  [(GEOXPCRequest *)v7 send:v6];
}

- (void)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 result:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  id v12 = [[GEOConfigStorageGetValueForKeyRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigStorageGetValueForKeyRequest *)v12 setKeyOptions:a5];
  [(GEOConfigStorageGetValueForKeyRequest *)v12 setKeyString:v11];

  [(GEOConfigStorageGetValueForKeyRequest *)v12 setCountryCode:v10];
  v13 = _GEODefaultsServerConnection();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __74__GEOConfigStorageClient_getConfigValueForKey_countryCode_options_result___block_invoke;
  v15[3] = &unk_1E53E4770;
  id v16 = v9;
  id v14 = v9;
  [(GEOXPCRequest *)v12 send:v13 withReply:MEMORY[0x1E4F14428] handler:v15];
}

void __74__GEOConfigStorageClient_getConfigValueForKey_countryCode_options_result___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 keySource];
  id v5 = [v3 keyValue];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)setConfigKeyExpiry:(id)a3 options:(unint64_t)a4 date:(id)a5 osVersion:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  v13 = [[GEOConfigSetExpiringKeyRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigSetExpiringKeyRequest *)v13 setKeyString:v11];

  [(GEOConfigSetExpiringKeyRequest *)v13 setKeyOptions:a4];
  [(GEOConfigSetExpiringKeyRequest *)v13 setExpireTime:v10];

  [(GEOConfigSetExpiringKeyRequest *)v13 setExpireOSVersion:v9];
  id v12 = _GEODefaultsServerConnection();
  [(GEOXPCRequest *)v13 send:v12];
}

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v9 = a4;
  id v10 = a3;
  id v11 = [[GEOConfigStorageGetValueForKeyRequest alloc] initWithTraits:0 auditToken:0 throttleToken:0];
  [(GEOConfigStorageGetValueForKeyRequest *)v11 setKeyOptions:a5];
  [(GEOConfigStorageGetValueForKeyRequest *)v11 setKeyString:v10];

  [(GEOConfigStorageGetValueForKeyRequest *)v11 setCountryCode:v9];
  id v12 = _GEODefaultsServerConnection();
  v13 = [(GEOXPCRequest *)v11 sendSync:v12 error:0];

  id v14 = [v13 keyValue];

  if (a6 && v14) {
    *a6 = [v13 keySource];
  }
  v15 = [v13 keyValue];

  return v15;
}

@end