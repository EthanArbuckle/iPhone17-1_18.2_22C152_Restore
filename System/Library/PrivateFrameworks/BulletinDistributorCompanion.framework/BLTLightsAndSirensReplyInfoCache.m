@interface BLTLightsAndSirensReplyInfoCache
+ (id)sharedReplyCache;
- (BLTLightsAndSirensReplyInfoCache)init;
- (BOOL)_isTimeToCheck;
- (NSDate)timeToCheck;
- (NSMutableDictionary)localReplyInfo;
- (OS_dispatch_queue)queue;
- (id)_firstReplyInfoWithNoDidPlayStateWithReplyToken:(id)a3;
- (id)_firstReplyInfoWithNoReplyWithReplyToken:(id)a3;
- (id)cacheDidPlayLightsAndSirens:(unint64_t)a3 withReplyToken:(id)a4;
- (void)_addReplyInfo:(id)a3 forReplyToken:(id)a4;
- (void)_checkCache;
- (void)_setNextTimeToCheck;
- (void)cacheReply:(id)a3 withSectionID:(id)a4 bulletinID:(id)a5 publicationDate:(id)a6 replyToken:(id)a7;
- (void)purgeReplyInfo:(id)a3 withReplyToken:(id)a4;
- (void)setLocalReplyInfo:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeToCheck:(id)a3;
@end

@implementation BLTLightsAndSirensReplyInfoCache

+ (id)sharedReplyCache
{
  if (sharedReplyCache_onceToken != -1) {
    dispatch_once(&sharedReplyCache_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)sharedReplyCache__sharedInstance;
  return v2;
}

uint64_t __52__BLTLightsAndSirensReplyInfoCache_sharedReplyCache__block_invoke()
{
  v0 = objc_alloc_init(BLTLightsAndSirensReplyInfoCache);
  uint64_t v1 = sharedReplyCache__sharedInstance;
  sharedReplyCache__sharedInstance = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (BLTLightsAndSirensReplyInfoCache)init
{
  v8.receiver = self;
  v8.super_class = (Class)BLTLightsAndSirensReplyInfoCache;
  v2 = [(BLTLightsAndSirensReplyInfoCache *)&v8 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.bulletindistributor.replyInfoCache", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    [(BLTLightsAndSirensReplyInfoCache *)v2 setLocalReplyInfo:v6];

    [(BLTLightsAndSirensReplyInfoCache *)v2 _setNextTimeToCheck];
  }
  return v2;
}

- (void)cacheReply:(id)a3 withSectionID:(id)a4 bulletinID:(id)a5 publicationDate:(id)a6 replyToken:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __99__BLTLightsAndSirensReplyInfoCache_cacheReply_withSectionID_bulletinID_publicationDate_replyToken___block_invoke;
  v23[3] = &unk_264685148;
  v23[4] = self;
  id v24 = v16;
  id v25 = v15;
  id v26 = v13;
  id v27 = v14;
  id v28 = v12;
  id v18 = v14;
  id v19 = v13;
  id v20 = v15;
  id v21 = v12;
  id v22 = v16;
  dispatch_async(queue, v23);
}

void __99__BLTLightsAndSirensReplyInfoCache_cacheReply_withSectionID_bulletinID_publicationDate_replyToken___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _firstReplyInfoWithNoReplyWithReplyToken:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v3 = (id)objc_opt_new();
    [*(id *)(a1 + 32) _addReplyInfo:v3 forReplyToken:*(void *)(a1 + 40)];
    v2 = v3;
  }
  id v4 = v2;
  [v2 setReply:*(void *)(a1 + 72)];
  [v4 setBulletinPublicationDate:*(void *)(a1 + 48)];
  [v4 setSectionID:*(void *)(a1 + 56)];
  [v4 setPublisherMatchID:*(void *)(a1 + 64)];
}

- (id)cacheDidPlayLightsAndSirens:(unint64_t)a3 withReplyToken:(id)a4
{
  id v6 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__7;
  id v19 = __Block_byref_object_dispose__7;
  id v20 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BLTLightsAndSirensReplyInfoCache_cacheDidPlayLightsAndSirens_withReplyToken___block_invoke;
  v11[3] = &unk_264685170;
  v11[4] = self;
  id v12 = v6;
  id v13 = &v15;
  unint64_t v14 = a3;
  id v8 = v6;
  dispatch_sync(queue, v11);
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

uint64_t __79__BLTLightsAndSirensReplyInfoCache_cacheDidPlayLightsAndSirens_withReplyToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _firstReplyInfoWithNoDidPlayStateWithReplyToken:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setDidPlayLightsAndSirens:*(void *)(a1 + 56)];
  v5 = *(void **)(a1 + 32);
  return [v5 _checkCache];
}

- (void)purgeReplyInfo:(id)a3 withReplyToken:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__BLTLightsAndSirensReplyInfoCache_purgeReplyInfo_withReplyToken___block_invoke;
  block[3] = &unk_264683E78;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(queue, block);
}

void __66__BLTLightsAndSirensReplyInfoCache_purgeReplyInfo_withReplyToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) localReplyInfo];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  [v3 removeObject:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _checkCache];
}

- (id)_firstReplyInfoWithNoDidPlayStateWithReplyToken:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BLTLightsAndSirensReplyInfoCache *)self localReplyInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v11, "didPlayLightsAndSirens", (void)v13))
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)_firstReplyInfoWithNoReplyWithReplyToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(BLTLightsAndSirensReplyInfoCache *)self localReplyInfo];
  id v6 = [v5 objectForKeyedSubscript:v4];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "reply", (void)v14);

        if (!v12)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)_addReplyInfo:(id)a3 forReplyToken:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(BLTLightsAndSirensReplyInfoCache *)self _checkCache];
  id v7 = [(BLTLightsAndSirensReplyInfoCache *)self localReplyInfo];
  id v8 = [v7 objectForKeyedSubscript:v6];

  if (!v8)
  {
    id v8 = objc_opt_new();
    uint64_t v9 = [(BLTLightsAndSirensReplyInfoCache *)self localReplyInfo];
    [v9 setObject:v8 forKeyedSubscript:v6];
  }
  [v8 addObject:v10];
}

- (void)_setNextTimeToCheck
{
  id v3 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:1800.0];
  [(BLTLightsAndSirensReplyInfoCache *)self setTimeToCheck:v3];
}

- (BOOL)_isTimeToCheck
{
  id v3 = [MEMORY[0x263EFF910] date];
  id v4 = [(BLTLightsAndSirensReplyInfoCache *)self timeToCheck];
  [v3 timeIntervalSinceDate:v4];
  BOOL v6 = v5 >= 0.0;

  return v6;
}

- (void)_checkCache
{
  uint64_t v2 = self;
  uint64_t v31 = *MEMORY[0x263EF8340];
  if ([(BLTLightsAndSirensReplyInfoCache *)self _isTimeToCheck])
  {
    uint64_t v18 = objc_opt_new();
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = [(BLTLightsAndSirensReplyInfoCache *)v2 localReplyInfo];
    uint64_t v3 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          id v7 = objc_opt_new();
          id v8 = v2;
          uint64_t v9 = [(BLTLightsAndSirensReplyInfoCache *)v2 localReplyInfo];
          id v10 = [v9 objectForKeyedSubscript:v6];

          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v11 = v10;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v22;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v21 + 1) + 8 * j);
                if ([v16 hasExpired])
                {
                  [v7 addObject:v16];
                  [v16 sendReply];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v29 count:16];
            }
            while (v13);
          }

          [v11 removeObjectsInArray:v7];
          if (![v11 count]) {
            [v18 addObject:v6];
          }

          uint64_t v2 = v8;
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v4);
    }

    long long v17 = [(BLTLightsAndSirensReplyInfoCache *)v2 localReplyInfo];
    [v17 removeObjectsForKeys:v18];

    [(BLTLightsAndSirensReplyInfoCache *)v2 _setNextTimeToCheck];
  }
}

- (NSMutableDictionary)localReplyInfo
{
  return self->_localReplyInfo;
}

- (void)setLocalReplyInfo:(id)a3
{
}

- (NSDate)timeToCheck
{
  return self->_timeToCheck;
}

- (void)setTimeToCheck:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeToCheck, 0);
  objc_storeStrong((id *)&self->_localReplyInfo, 0);
}

@end