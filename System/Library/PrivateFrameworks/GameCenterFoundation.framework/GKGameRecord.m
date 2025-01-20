@interface GKGameRecord
+ (BOOL)supportsSecureCoding;
+ (id)cacheKeyForPlayer:(id)a3 bundleIdentifier:(id)a4;
+ (id)cacheKeyForPlayer:(id)a3 game:(id)a4;
+ (id)cacheKeyForPlayer:(id)a3 internal:(id)a4;
+ (id)gameRecordForPlayer:(id)a3 game:(id)a4;
+ (id)internalRepresentationCache;
+ (id)internalRepresentationForPlayer:(id)a3 game:(id)a4;
+ (void)invalidateCacheForPlayer:(id)a3 game:(id)a4;
+ (void)invalidateCaches;
+ (void)loadGameRecordForPlayer:(id)a3 game:(id)a4 withCompletionHandler:(id)a5;
+ (void)loadGameRecordsForPlayer:(id)a3 bundleIDs:(id)a4 withCompletionHandler:(id)a5;
+ (void)loadGameRecordsForPlayer:(id)a3 games:(id)a4 withCompletionHandler:(id)a5;
+ (void)partitionGameRecords:(id)a3 returniOS:(id *)a4 returnMac:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (BOOL)played;
- (GKGameRecord)init;
- (GKGameRecord)initWithCoder:(id)a3;
- (GKGameRecord)initWithInternalRepresentation:(id)a3;
- (GKGameRecord)initWithInternalRepresentation:(id)a3 player:(id)a4;
- (GKPlayer)player;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setPlayer:(id)a3;
@end

@implementation GKGameRecord

+ (void)partitionGameRecords:(id)a3 returniOS:(id *)a4 returnMac:(id *)a5
{
  id v7 = a3;
  uint64_t v8 = [v7 count];
  v9 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  v10 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__GKGameRecord_partitionGameRecords_returniOS_returnMac___block_invoke;
  v15[3] = &unk_1E646DCC8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  [v7 enumerateObjectsUsingBlock:v15];

  id v13 = v12;
  *a5 = v13;
  id v14 = v11;
  *a4 = v14;
}

void __57__GKGameRecord_partitionGameRecords_returniOS_returnMac___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  uint64_t v3 = [v5 platform];
  uint64_t v4 = 40;
  if (v3 == 2) {
    uint64_t v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

- (GKGameRecord)initWithInternalRepresentation:(id)a3 player:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    id v6 = +[GKInternalRepresentation internalRepresentation];
  }
  v11.receiver = self;
  v11.super_class = (Class)GKGameRecord;
  uint64_t v8 = [(GKGame *)&v11 initWithInternalRepresentation:v6];
  v9 = v8;
  if (v8) {
    [(GKGameRecord *)v8 setPlayer:v7];
  }

  return v9;
}

- (GKGameRecord)initWithInternalRepresentation:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = +[GKInternalRepresentation internalRepresentation];
  }
  v8.receiver = self;
  v8.super_class = (Class)GKGameRecord;
  id v5 = [(GKGame *)&v8 initWithInternalRepresentation:v4];
  if (v5)
  {
    id v6 = +[GKLocalPlayer localPlayer];
    [(GKGameRecord *)v5 setPlayer:v6];
  }
  return v5;
}

- (GKGameRecord)init
{
  uint64_t v3 = +[GKInternalRepresentation internalRepresentation];
  id v4 = [(GKGameRecord *)self initWithInternalRepresentation:v3];

  return v4;
}

- (GKGameRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKGameRecord;
  id v5 = [(GKGame *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"player"];
    player = v5->_player;
    v5->_player = (GKPlayer *)v6;

    objc_super v8 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GKGameRecord;
  id v4 = a3;
  [(GKGame *)&v6 encodeWithCoder:v4];
  id v5 = [(GKGameRecord *)self player];
  [v4 encodeObject:v5 forKey:@"player"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)played
{
  v2 = [(GKGameRecord *)self lastPlayedDate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (unint64_t)hash
{
  v7.receiver = self;
  v7.super_class = (Class)GKGameRecord;
  unint64_t v3 = [(GKGame *)&v7 hash];
  id v4 = [(GKGameRecord *)self player];
  unint64_t v5 = [v4 hash] ^ v3;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v10.receiver = self;
    v10.super_class = (Class)GKGameRecord;
    if ([(GKGame *)&v10 isEqual:v5])
    {
      objc_super v6 = [(GKGameRecord *)self player];
      objc_super v7 = [v5 player];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = [(GKGameRecord *)self player];
  id v4 = NSString;
  uint64_t v5 = objc_opt_class();
  objc_super v6 = [(GKGameRecord *)self name];
  objc_super v7 = [(GKGameRecord *)self bundleIdentifier];
  char v8 = [v3 internal];
  v9 = [v8 conciseDescription];
  objc_super v10 = [v4 stringWithFormat:@"<%@ %p> name:%@ bundleID:%@ player:<%@>", v5, self, v6, v7, v9];

  return v10;
}

+ (id)cacheKeyForPlayer:(id)a3 bundleIdentifier:(id)a4
{
  uint64_t v5 = NSString;
  id v6 = a4;
  objc_super v7 = [a3 cacheKey];
  char v8 = [v5 stringWithFormat:@"%@-%@", v7, v6];

  return v8;
}

+ (id)cacheKeyForPlayer:(id)a3 game:(id)a4
{
  id v6 = a3;
  objc_super v7 = [a4 bundleIdentifier];
  char v8 = [a1 cacheKeyForPlayer:v6 bundleIdentifier:v7];

  return v8;
}

+ (id)cacheKeyForPlayer:(id)a3 internal:(id)a4
{
  id v6 = a3;
  objc_super v7 = [a4 bundleIdentifier];
  char v8 = [a1 cacheKeyForPlayer:v6 bundleIdentifier:v7];

  return v8;
}

+ (id)internalRepresentationCache
{
  if (internalRepresentationCache_onceToken != -1) {
    dispatch_once(&internalRepresentationCache_onceToken, &__block_literal_global_6);
  }
  v2 = (void *)sInternalRepresentationCache;

  return v2;
}

uint64_t __43__GKGameRecord_internalRepresentationCache__block_invoke()
{
  sInternalRepresentationCache = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1C998]);

  return MEMORY[0x1F41817F8]();
}

+ (void)invalidateCaches
{
}

+ (void)invalidateCacheForPlayer:(id)a3 game:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [a1 internalRepresentationCache];
  char v8 = [a1 cacheKeyForPlayer:v7 game:v6];

  [v9 removeObjectForKey:v8];
}

+ (id)internalRepresentationForPlayer:(id)a3 game:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  char v8 = [a1 internalRepresentationCache];
  id v9 = [a1 cacheKeyForPlayer:v7 game:v6];

  objc_super v10 = [v8 objectForKey:v9];
  if (!v10)
  {
    objc_super v11 = [v6 internal];
    objc_super v10 = +[GKGameRecordInternal gameRecordForGame:v11];

    [v8 setObject:v10 forKey:v9];
  }

  return v10;
}

+ (id)gameRecordForPlayer:(id)a3 game:(id)a4
{
  id v6 = a3;
  id v7 = [a1 internalRepresentationForPlayer:v6 game:a4];
  char v8 = [[GKGameRecord alloc] initWithInternalRepresentation:v7 player:v6];

  return v8;
}

+ (void)loadGameRecordForPlayer:(id)a3 game:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4F1C978];
  id v10 = a3;
  objc_super v11 = [v9 arrayWithObject:a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke;
  v13[3] = &unk_1E646DCF0;
  id v14 = v8;
  id v12 = v8;
  [a1 loadGameRecordsForPlayer:v10 games:v11 withCompletionHandler:v13];
}

void __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 count];
  if (v6 || v7 != 1)
  {
    id v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = GKOSLoggers();
      id v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke_cold_1(v8, v5);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  objc_super v11 = [v5 objectAtIndex:0];
  (*(void (**)(uint64_t, void *, id))(v10 + 16))(v10, v11, v6);
}

+ (void)loadGameRecordsForPlayer:(id)a3 games:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  id v9 = a5;
  id v10 = a3;
  id v12 = [v8 setWithArray:a4];
  objc_super v11 = [v12 _gkValuesForKeyPath:@"bundleIdentifier"];
  [a1 loadGameRecordsForPlayer:v10 bundleIDs:v11 withCompletionHandler:v9];
}

+ (void)loadGameRecordsForPlayer:(id)a3 bundleIDs:(id)a4 withCompletionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 count];
  id v12 = [a1 internalRepresentationCache];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke;
  v26 = &unk_1E646DD68;
  id v13 = v10;
  id v30 = v13;
  uint64_t v31 = v11;
  id v14 = v9;
  id v27 = v14;
  id v32 = a1;
  id v15 = v8;
  id v28 = v15;
  id v16 = v12;
  id v29 = v16;
  id v17 = _Block_copy(&v23);
  v18 = v17;
  if (v11)
  {
    v19 = +[GKLocalPlayer localPlayer];
    v20 = +[GKDaemonProxy proxyForPlayer:v19];
    v21 = [v20 gameServicePrivate];
    v22 = [v15 internal];
    [v21 getGameStatsForPlayer:v22 bundleIDs:v14 handler:v18];
  }
  else
  {
    (*((void (**)(void *, void, void))v17 + 2))(v17, 0, 0);
  }
}

void __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (*(void *)(a1 + 56))
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_2;
    v12[3] = &unk_1E646DD40;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 64);
    id v13 = v8;
    uint64_t v19 = v9;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 72);
    id v14 = v10;
    uint64_t v20 = v11;
    id v15 = *(id *)(a1 + 40);
    id v16 = *(id *)(a1 + 48);
    id v18 = *(id *)(a1 + 56);
    id v17 = v6;
    dispatch_async(v7, v12);
  }
}

void __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__2;
  v36 = __Block_byref_object_dispose__2;
  id v37 = 0;
  if (v2)
  {
    unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v2];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    long long v28 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v29 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v9 = [v8 bundleIdentifier];
          if (v9) {
            [v3 setObject:v8 forKey:v9];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v5);
    }

    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(void *)(a1 + 80)];
    uint64_t v11 = (void *)v33[5];
    v33[5] = v10;

    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v12 = *(id *)(a1 + 40);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v25;
      do
      {
        for (uint64_t j = 0; j != v13; ++j)
        {
          if (*(void *)v25 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v24 + 1) + 8 * j);
          id v17 = [*(id *)(a1 + 88) cacheKeyForPlayer:*(void *)(a1 + 48) bundleIdentifier:v16];
          id v18 = [v3 objectForKey:v16];
          if (v18)
          {
            [*(id *)(a1 + 56) setObject:v18 forKey:v17];
          }
          else
          {
            id v18 = +[GKInternalRepresentation internalRepresentation];
          }
          uint64_t v19 = [[GKGameRecord alloc] initWithInternalRepresentation:v18 player:*(void *)(a1 + 48)];
          [(id)v33[5] addObject:v19];
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v24 objects:v38 count:16];
      }
      while (v13);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_30;
  block[3] = &unk_1E646DD18;
  id v22 = *(id *)(a1 + 72);
  uint64_t v23 = &v32;
  id v21 = *(id *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(&v32, 8);
}

uint64_t __73__GKGameRecord_loadGameRecordsForPlayer_bundleIDs_withCompletionHandler___block_invoke_30(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[5] + 16))(a1[5], *(void *)(*(void *)(a1[6] + 8) + 40), a1[4]);
}

- (GKPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (void).cxx_destruct
{
}

void __67__GKGameRecord_loadGameRecordForPlayer_game_withCompletionHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = a1;
  int v4 = 134218242;
  uint64_t v5 = [a2 count];
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1C2D22000, v3, OS_LOG_TYPE_DEBUG, "passed in 1 game and got %lu records: %@, will only use the first one", (uint8_t *)&v4, 0x16u);
}

@end