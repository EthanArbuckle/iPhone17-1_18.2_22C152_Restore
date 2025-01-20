@interface ASCloudKitServerChangeTokenCache
+ (id)changeTokenCacheFromUserDefaultsWithSerialQueue:(id)a3;
+ (id)changeTokenCacheFromUserDefaultsWithSerialQueue:(id)a3 cloudType:(unint64_t)a4;
+ (id)databaseDefaultsKeyForCloudType:(unint64_t)a3;
+ (id)timestampDefaultsKeyForCloudType:(unint64_t)a3;
+ (id)zoneDefaultsKeyForCloudType:(unint64_t)a3;
- (ASCloudKitServerChangeTokenCache)initWithSerialQueue:(id)a3;
- (ASCloudKitServerChangeTokenCache)initWithSerialQueue:(id)a3 cloudType:(unint64_t)a4;
- (BOOL)isExpired;
- (id)copyWithZone:(_NSZone *)a3;
- (id)emptyCopy;
- (id)fetchDateForRecordZoneID:(id)a3;
- (id)serverChangeTokenForDatabase:(id)a3;
- (id)serverChangeTokenForRecordZoneID:(id)a3;
- (void)persistToUserDefaults;
- (void)setExpired:(BOOL)a3;
- (void)setFetchDate:(id)a3 forRecordZoneID:(id)a4;
- (void)setServerChangeToken:(id)a3 forDatabase:(id)a4;
- (void)setServerChangeToken:(id)a3 forRecordZoneID:(id)a4;
@end

@implementation ASCloudKitServerChangeTokenCache

+ (id)changeTokenCacheFromUserDefaultsWithSerialQueue:(id)a3
{
  return +[ASCloudKitServerChangeTokenCache changeTokenCacheFromUserDefaultsWithSerialQueue:a3 cloudType:0];
}

+ (id)changeTokenCacheFromUserDefaultsWithSerialQueue:(id)a3 cloudType:(unint64_t)a4
{
  id v5 = a3;
  v6 = (void *)[objc_alloc((Class)objc_opt_class()) initWithSerialQueue:v5 cloudType:a4];

  id v7 = objc_alloc(MEMORY[0x263EFFA40]);
  v8 = (void *)[v7 initWithSuiteName:*MEMORY[0x263F23CC8]];
  v9 = +[ASCloudKitServerChangeTokenCache databaseDefaultsKeyForCloudType:a4];
  v10 = [v8 dictionaryForKey:v9];

  v11 = +[ASCloudKitServerChangeTokenCache zoneDefaultsKeyForCloudType:a4];
  v12 = [v8 dictionaryForKey:v11];

  v13 = [v8 dictionaryForKey:*MEMORY[0x263F23CD0]];
  uint64_t v14 = _MapDataToChangeTokens(v10);
  v15 = (void *)v6[1];
  v6[1] = v14;

  uint64_t v16 = _MapDataToChangeTokens(v12);
  v17 = (void *)v6[2];
  v6[2] = v16;

  v18 = (void *)[v13 mutableCopy];
  v19 = v18;
  if (v18) {
    id v20 = v18;
  }
  else {
    id v20 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  v21 = (void *)v6[5];
  v6[5] = v20;

  v22 = +[ASCloudKitServerChangeTokenCache timestampDefaultsKeyForCloudType:a4];
  [v8 doubleForKey:v22];
  v6[3] = v23;

  return v6;
}

+ (id)databaseDefaultsKeyForCloudType:(unint64_t)a3
{
  v3 = (id *)MEMORY[0x263F23CB0];
  if (a3 == 1) {
    v3 = (id *)MEMORY[0x263F23DB8];
  }
  return *v3;
}

+ (id)zoneDefaultsKeyForCloudType:(unint64_t)a3
{
  v3 = (id *)MEMORY[0x263F23E00];
  if (a3 == 1) {
    v3 = (id *)MEMORY[0x263F23DE8];
  }
  return *v3;
}

+ (id)timestampDefaultsKeyForCloudType:(unint64_t)a3
{
  v3 = (id *)MEMORY[0x263F23C88];
  if (a3 == 1) {
    v3 = (id *)MEMORY[0x263F23DB0];
  }
  return *v3;
}

- (ASCloudKitServerChangeTokenCache)initWithSerialQueue:(id)a3
{
  return [(ASCloudKitServerChangeTokenCache *)self initWithSerialQueue:a3 cloudType:0];
}

- (ASCloudKitServerChangeTokenCache)initWithSerialQueue:(id)a3 cloudType:(unint64_t)a4
{
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)ASCloudKitServerChangeTokenCache;
  v8 = [(ASCloudKitServerChangeTokenCache *)&v17 init];
  if (v8)
  {
    uint64_t v9 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:2];
    databaseChangeTokensByDatabaseScope = v8->_databaseChangeTokensByDatabaseScope;
    v8->_databaseChangeTokensByDatabaseScope = (NSMutableDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    zoneChangeTokensByZoneID = v8->_zoneChangeTokensByZoneID;
    v8->_zoneChangeTokensByZoneID = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    zoneFetchDateByZoneID = v8->_zoneFetchDateByZoneID;
    v8->_zoneFetchDateByZoneID = (NSMutableDictionary *)v13;

    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    v8->_timestamp = v15;
    objc_storeStrong((id *)&v8->_serialQueue, a3);
    v8->_cloudType = a4;
  }

  return v8;
}

- (id)emptyCopy
{
  v2 = [[ASCloudKitServerChangeTokenCache alloc] initWithSerialQueue:self->_serialQueue cloudType:self->_cloudType];
  return v2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithSerialQueue:", self->_serialQueue);
  serialQueue = self->_serialQueue;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __49__ASCloudKitServerChangeTokenCache_copyWithZone___block_invoke;
  v9[3] = &unk_2652157C8;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = self;
  dispatch_sync(serialQueue, v9);
  id v7 = v6;

  return v7;
}

void __49__ASCloudKitServerChangeTokenCache_copyWithZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 8) mutableCopy];
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  uint64_t v5 = [*(id *)(*(void *)(a1 + 40) + 16) mutableCopy];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(*(void *)(a1 + 40) + 24);
  uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 40) mutableCopy];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;

  *(void *)(*(void *)(a1 + 32) + 48) = *(void *)(*(void *)(a1 + 40) + 48);
}

- (BOOL)isExpired
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  ASLoggingInitialize();
  uint64_t v3 = (void *)*MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    double timestamp = self->_timestamp;
    uint64_t v5 = (void *)MEMORY[0x263EFF910];
    uint64_t v6 = v3;
    [v5 timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    *(double *)&buf[4] = timestamp;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_2474C9000, v6, OS_LOG_TYPE_DEFAULT, "Checking for change token expiration, timestamp=%f, now=%f", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x2020000000;
  char v13 = 0;
  serialQueue = self->_serialQueue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __45__ASCloudKitServerChangeTokenCache_isExpired__block_invoke;
  v11[3] = &unk_265215FF8;
  v11[4] = self;
  v11[5] = buf;
  dispatch_sync(serialQueue, v11);
  char v9 = *(unsigned char *)(*(void *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v9;
}

uint64_t __45__ASCloudKitServerChangeTokenCache_isExpired__block_invoke(uint64_t a1)
{
  uint64_t result = [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3 - *(double *)(*(void *)(a1 + 32) + 24) > (double)(unint64_t)*MEMORY[0x263F23C80];
  return result;
}

- (void)setExpired:(BOOL)a3
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __47__ASCloudKitServerChangeTokenCache_setExpired___block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

double __47__ASCloudKitServerChangeTokenCache_setExpired___block_invoke(uint64_t a1)
{
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  double result = v2 - (double)(unint64_t)*MEMORY[0x263F23C80];
  *(double *)(*(void *)(a1 + 32) + 24) = result;
  return result;
}

- (void)persistToUserDefaults
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__ASCloudKitServerChangeTokenCache_persistToUserDefaults__block_invoke;
  block[3] = &unk_2652157F0;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

void __57__ASCloudKitServerChangeTokenCache_persistToUserDefaults__block_invoke(uint64_t a1)
{
  ASLoggingInitialize();
  double v2 = *MEMORY[0x263F23AA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_2474C9000, v2, OS_LOG_TYPE_DEFAULT, "Persisting change tokens to disk", v12, 2u);
  }
  double v3 = _MapChangeTokensToData(*(void **)(*(void *)(a1 + 32) + 8));
  v4 = _MapChangeTokensToData(*(void **)(*(void *)(a1 + 32) + 16));
  id v5 = objc_alloc(MEMORY[0x263EFFA40]);
  uint64_t v6 = (void *)[v5 initWithSuiteName:*MEMORY[0x263F23CC8]];
  uint64_t v7 = +[ASCloudKitServerChangeTokenCache databaseDefaultsKeyForCloudType:*(void *)(*(void *)(a1 + 32) + 48)];
  [v6 setObject:v3 forKey:v7];

  uint64_t v8 = +[ASCloudKitServerChangeTokenCache zoneDefaultsKeyForCloudType:*(void *)(*(void *)(a1 + 32) + 48)];
  [v6 setObject:v4 forKey:v8];

  [v6 setObject:*(void *)(*(void *)(a1 + 32) + 40) forKey:*MEMORY[0x263F23CD0]];
  uint64_t v9 = *(void *)(a1 + 32);
  double v10 = *(double *)(v9 + 24);
  uint64_t v11 = +[ASCloudKitServerChangeTokenCache timestampDefaultsKeyForCloudType:*(void *)(v9 + 48)];
  [v6 setDouble:v11 forKey:v10];

  [v6 synchronize];
}

- (id)serverChangeTokenForDatabase:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    char v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__3;
    uint64_t v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__ASCloudKitServerChangeTokenCache_serverChangeTokenForDatabase___block_invoke;
    block[3] = &unk_265216070;
    uint64_t v11 = &v12;
    block[4] = self;
    id v10 = v4;
    dispatch_sync(serialQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __65__ASCloudKitServerChangeTokenCache_serverChangeTokenForDatabase___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  _DictionaryKeyForDatabase(*(void **)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setServerChangeToken:(id)a3 forDatabase:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__ASCloudKitServerChangeTokenCache_setServerChangeToken_forDatabase___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __69__ASCloudKitServerChangeTokenCache_setServerChangeToken_forDatabase___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = _DictionaryKeyForDatabase(*(void **)(a1 + 48));
  id v4 = (id)v3;
  if (v1) {
    [v2 setObject:v1 forKeyedSubscript:v3];
  }
  else {
    [v2 removeObjectForKey:v3];
  }
}

- (id)serverChangeTokenForRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    char v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__3;
    uint64_t v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__ASCloudKitServerChangeTokenCache_serverChangeTokenForRecordZoneID___block_invoke;
    block[3] = &unk_265216070;
    uint64_t v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(serialQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __69__ASCloudKitServerChangeTokenCache_serverChangeTokenForRecordZoneID___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 16);
  _DictionaryKeyForRecordZoneID(*(void **)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setServerChangeToken:(id)a3 forRecordZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __73__ASCloudKitServerChangeTokenCache_setServerChangeToken_forRecordZoneID___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __73__ASCloudKitServerChangeTokenCache_setServerChangeToken_forRecordZoneID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(*(void *)(a1 + 40) + 16);
  uint64_t v3 = _DictionaryKeyForRecordZoneID(*(void **)(a1 + 48));
  id v4 = (id)v3;
  if (v1) {
    [v2 setObject:v1 forKeyedSubscript:v3];
  }
  else {
    [v2 removeObjectForKey:v3];
  }
}

- (id)fetchDateForRecordZoneID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    char v13 = &v12;
    uint64_t v14 = 0x3032000000;
    double v15 = __Block_byref_object_copy__3;
    uint64_t v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __61__ASCloudKitServerChangeTokenCache_fetchDateForRecordZoneID___block_invoke;
    block[3] = &unk_265216070;
    uint64_t v11 = &v12;
    void block[4] = self;
    id v10 = v4;
    dispatch_sync(serialQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __61__ASCloudKitServerChangeTokenCache_fetchDateForRecordZoneID___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 40);
  _DictionaryKeyForRecordZoneID(*(void **)(a1 + 40));
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v3 = [v2 objectForKeyedSubscript:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)setFetchDate:(id)a3 forRecordZoneID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__ASCloudKitServerChangeTokenCache_setFetchDate_forRecordZoneID___block_invoke;
  block[3] = &unk_265216138;
  id v12 = v6;
  char v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(serialQueue, block);
}

void __65__ASCloudKitServerChangeTokenCache_setFetchDate_forRecordZoneID___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(*(void *)(a1 + 40) + 40);
  uint64_t v3 = _DictionaryKeyForRecordZoneID(*(void **)(a1 + 48));
  id v4 = (id)v3;
  if (v1) {
    [v2 setObject:v1 forKeyedSubscript:v3];
  }
  else {
    [v2 removeObjectForKey:v3];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneFetchDateByZoneID, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_zoneChangeTokensByZoneID, 0);
  objc_storeStrong((id *)&self->_databaseChangeTokensByDatabaseScope, 0);
}

@end