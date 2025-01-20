@interface CESRSpeechItemRanker_Media
+ (BOOL)_isArtistItem:(id)a3;
+ (BOOL)_isPlayableItem:(id)a3;
+ (id)_itemIdsFromMediaEntities:(id)a3;
+ (id)_performMediaCollectionsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6;
+ (id)_performMediaItemsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6;
+ (id)_rankedItemIdsFromTopPlayables:(id)a3 topArtists:(id)a4 playableLimit:(unint64_t)a5 artistLimit:(unint64_t)a6;
+ (id)queryRecentMediaEntities;
+ (id)queryTopPlayableIds;
- (BOOL)_loadRankedItemCache;
- (BOOL)addSet:(id)a3;
- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4;
- (BOOL)refreshRankedItemCache:(id *)a3;
- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5;
- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 playableLimit:(unint64_t)a6 artistLimit:(unint64_t)a7 itemIdToRank:(id)a8;
- (id)_queryAndRankMediaItems;
- (id)_rankedItemCacheFile;
- (id)getActivatedCodepathIds;
- (id)getAllCodepathIds;
- (int)_dataProtectionClass;
- (void)_activateEnrolledTrialExperiments;
@end

@implementation CESRSpeechItemRanker_Media

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_codepathIds, 0);
  objc_storeStrong((id *)&self->_itemIdToRank, 0);

  objc_storeStrong((id *)&self->_trialMediaRankingStrategy, 0);
}

- (int)_dataProtectionClass
{
  v2 = [(CESRSpeechItemRanker *)self speechProfileSite];
  int v3 = [v2 dataProtectionClass];

  return v3;
}

- (id)_rankedItemCacheFile
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CB10]);
  v4 = [(CESRSpeechItemRanker *)self speechProfileSite];
  v5 = [v4 speechProfileSiteURL];
  v6 = (void *)[v3 initWithString:@"ranked_item_cache-media.plist" relativeToURL:v5];

  return v6;
}

- (BOOL)_loadRankedItemCache
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (!self->_itemIdToRank)
  {
    v4 = [(CESRSpeechItemRanker_Media *)self _rankedItemCacheFile];
    v5 = SFReadPropertyList();
    id v6 = 0;

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = v5;
      if ([(NSDictionary *)v7 count])
      {
        itemIdToRank = self->_itemIdToRank;
        self->_itemIdToRank = v7;
        v9 = v7;

        BOOL v2 = 1;
LABEL_12:

        return v2;
      }
      v11 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v14 = "-[CESRSpeechItemRanker_Media _loadRankedItemCache]";
        _os_log_error_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_ERROR, "%s Ranked media item cache is empty.", buf, 0xCu);
      }
    }
    else
    {
      v10 = *MEMORY[0x1E4F4E380];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v14 = "-[CESRSpeechItemRanker_Media _loadRankedItemCache]";
        __int16 v15 = 2112;
        id v16 = v6;
        _os_log_error_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_ERROR, "%s Couldn't read ranked media item cache from disk: %@", buf, 0x16u);
      }
    }
    BOOL v2 = 0;
    goto LABEL_12;
  }
  return 1;
}

- (id)_queryAndRankMediaItems
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Querying the media library for songs and playlists.", buf, 0xCu);
  }
  v5 = +[CESRSpeechItemRanker_Media queryTopPlayableIds];
  id v6 = [MEMORY[0x1E4F1CA60] dictionary];
  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Enumerating the SV media set to find album and artist IDs for songs found from the media library.", buf, 0xCu);
  }
  id v42 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __53__CESRSpeechItemRanker_Media__queryAndRankMediaItems__block_invoke;
  v37[3] = &unk_1E61C2D60;
  id v10 = v5;
  id v38 = v10;
  id v31 = v7;
  id v39 = v31;
  id v11 = v8;
  id v40 = v11;
  id v30 = v6;
  id v41 = v30;
  v36.receiver = self;
  v36.super_class = (Class)CESRSpeechItemRanker_Media;
  [(CESRSpeechItemRanker *)&v36 enumerateRankedItemsWithError:&v42 usingBlock:v37];
  id v29 = v42;
  v12 = [MEMORY[0x1E4F1CA70] orderedSet];
  v13 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v14 = v10;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v49 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v32 + 1) + 8 * i);
        [v12 addObject:v19];
        v20 = [v30 objectForKey:v19];
        if (v20) {
          [v12 addObject:v20];
        }
        v21 = [v31 objectForKey:v19];
        if (v21) {
          [v13 addObject:v21];
        }
        v22 = [v11 objectForKey:v19];
        if (v22) {
          [v13 addObject:v22];
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v49 count:16];
    }
    while (v16);
  }

  v23 = (void *)*MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_DEBUG))
  {
    v26 = v23;
    uint64_t v27 = [v12 count];
    uint64_t v28 = [v13 count];
    *(_DWORD *)buf = 136315650;
    v44 = "-[CESRSpeechItemRanker_Media _queryAndRankMediaItems]";
    __int16 v45 = 2048;
    uint64_t v46 = v27;
    __int16 v47 = 2048;
    uint64_t v48 = v28;
    _os_log_debug_impl(&dword_1B8CCB000, v26, OS_LOG_TYPE_DEBUG, "%s topPlayableIds=%tu, topAristIds=%tu", buf, 0x20u);
  }
  v24 = +[CESRSpeechItemRanker_Media _rankedItemIdsFromTopPlayables:v12 topArtists:v13 playableLimit:1500 artistLimit:1500];

  return v24;
}

- (BOOL)refreshRankedItemCache:(id *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!+[CESRUtilities isSiriMuxSupported]
    && ([(CESRSpeechItemRanker *)self instance],
        v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 options],
        v4,
        (v5 & 1) != 0))
  {
    v8 = (os_log_t *)MEMORY[0x1E4F4E380];
    v9 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315138;
      uint64_t v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
      _os_log_impl(&dword_1B8CCB000, v9, OS_LOG_TYPE_INFO, "%s Starting refresh of ranked item cache.", (uint8_t *)&v18, 0xCu);
    }
    id v10 = [(CESRSpeechItemRanker_Media *)self _queryAndRankMediaItems];
    itemIdToRank = self->_itemIdToRank;
    self->_itemIdToRank = v10;

    if ([(NSDictionary *)self->_itemIdToRank count])
    {
      v12 = [(CESRSpeechItemRanker_Media *)self _rankedItemCacheFile];
      [(CESRSpeechItemRanker_Media *)self _dataProtectionClass];
      int v6 = SFWritePropertyList();

      if (v6)
      {
        os_log_t v13 = *v8;
        LOBYTE(v6) = 1;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
        {
          id v14 = self->_itemIdToRank;
          uint64_t v15 = v13;
          uint64_t v16 = [(NSDictionary *)v14 count];
          int v18 = 136315394;
          uint64_t v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
          __int16 v20 = 2048;
          uint64_t v21 = v16;
          _os_log_impl(&dword_1B8CCB000, v15, OS_LOG_TYPE_INFO, "%s Wrote ranked item cache with numIds=%tu", (uint8_t *)&v18, 0x16u);
        }
      }
    }
    else
    {
      uint64_t v17 = *v8;
      LOBYTE(v6) = 1;
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_INFO))
      {
        int v18 = 136315138;
        uint64_t v19 = "-[CESRSpeechItemRanker_Media refreshRankedItemCache:]";
        _os_log_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_INFO, "%s No ranked items found.", (uint8_t *)&v18, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (BOOL)enumerateRankedItemsWithError:(id *)a3 usingBlock:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([(NSString *)self->_trialMediaRankingStrategy isEqualToString:@"PlayCountSongTitleSelection"])
  {
    [(CESRSpeechItemRanker_Media *)self _loadRankedItemCache];
    v7 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    id v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
    __int16 v40 = 2112;
    id v41 = @"PlayCountSongTitleSelection";
LABEL_7:
    _os_log_impl(&dword_1B8CCB000, v7, OS_LOG_TYPE_INFO, "%s Active ASR A/B trial experiment for Media Ranking. Treatment = %@", buf, 0x16u);
    goto LABEL_9;
  }
  if ([(NSString *)self->_trialMediaRankingStrategy isEqualToString:@"RandomSongTitleSelection"])
  {
    itemIdToRank = self->_itemIdToRank;
    self->_itemIdToRank = 0;

    v7 = *MEMORY[0x1E4F4E380];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO)) {
      goto LABEL_9;
    }
    *(_DWORD *)buf = 136315394;
    id v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
    __int16 v40 = 2112;
    id v41 = @"RandomSongTitleSelection";
    goto LABEL_7;
  }
  [(CESRSpeechItemRanker_Media *)self _loadRankedItemCache];
LABEL_9:
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  uint64_t v37 = 0;
  uint64_t v30 = 0;
  id v31 = &v30;
  uint64_t v32 = 0x2020000000;
  uint64_t v33 = 0;
  if ([(NSDictionary *)self->_itemIdToRank count])
  {
    v9 = +[CESRSpeechItemRanker_Media queryRecentMediaEntities];
    unint64_t v10 = self->_artistLimit + self->_playableLimit;
    id v11 = (id)*MEMORY[0x1E4F4E380];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSUInteger v12 = [(NSDictionary *)self->_itemIdToRank count];
      uint64_t v13 = [v9 count];
      *(_DWORD *)buf = 136315906;
      id v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
      __int16 v40 = 2048;
      id v41 = (__CFString *)v12;
      __int16 v42 = 2048;
      unint64_t v43 = v13;
      __int16 v44 = 2048;
      unint64_t v45 = v10;
      _os_log_impl(&dword_1B8CCB000, v11, OS_LOG_TYPE_INFO, "%s Ranked media items available. rankedItemCount=%tu, recentItemCount=%tu, limit=%tu", buf, 0x2Au);
    }
  }
  else
  {
    id v14 = self->_itemIdToRank;
    self->_itemIdToRank = 0;

    uint64_t v15 = v35;
    v35[3] = self->_playableLimit;
    unint64_t artistLimit = self->_artistLimit;
    v31[3] = artistLimit;
    uint64_t v17 = *MEMORY[0x1E4F4E380];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
    {
      int v18 = (__CFString *)v15[3];
      *(_DWORD *)buf = 136315650;
      id v39 = "-[CESRSpeechItemRanker_Media enumerateRankedItemsWithError:usingBlock:]";
      __int16 v40 = 2048;
      id v41 = v18;
      __int16 v42 = 2048;
      unint64_t v43 = artistLimit;
      _os_log_impl(&dword_1B8CCB000, v17, OS_LOG_TYPE_INFO, "%s No ranked media items available. Limiting to %tu playable entities and %tu artist entities.", buf, 0x20u);
    }
    unint64_t v10 = 0;
    v9 = 0;
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__CESRSpeechItemRanker_Media_enumerateRankedItemsWithError_usingBlock___block_invoke;
  v24[3] = &unk_1E61C2D38;
  v24[4] = self;
  unint64_t v29 = v10;
  id v19 = v9;
  id v25 = v19;
  id v20 = v6;
  id v26 = v20;
  uint64_t v27 = &v34;
  uint64_t v28 = &v30;
  v23.receiver = self;
  v23.super_class = (Class)CESRSpeechItemRanker_Media;
  BOOL v21 = [(CESRSpeechItemRanker *)&v23 enumerateRankedItemsWithError:a3 usingBlock:v24];

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v21;
}

- (BOOL)addSet:(id)a3
{
  id v4 = a3;
  if ([v4 itemType] == 18540)
  {
    v7.receiver = self;
    v7.super_class = (Class)CESRSpeechItemRanker_Media;
    BOOL v5 = [(CESRSpeechItemRanker *)&v7 addSet:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)getActivatedCodepathIds
{
  v6.receiver = self;
  v6.super_class = (Class)CESRSpeechItemRanker_Media;
  if ([(CESRSpeechItemRanker *)&v6 enumeratedItemCount] >= 1) {
    [(NSMutableSet *)self->_codepathIds addObject:@"eb18055e-87c4-44c2-ab94-9275bec61c52"];
  }
  v5.receiver = self;
  v5.super_class = (Class)CESRSpeechItemRanker_Media;
  if ([(CESRSpeechItemRanker *)&v5 enumeratedItemCount] >= (int64_t)(self->_artistLimit + self->_playableLimit)) {
    [(NSMutableSet *)self->_codepathIds addObject:@"c852375e-0091-4dbd-b2f7-792507612de5"];
  }
  codepathIds = self->_codepathIds;

  return codepathIds;
}

- (id)getAllCodepathIds
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"eb18055e-87c4-44c2-ab94-9275bec61c52", @"c852375e-0091-4dbd-b2f7-792507612de5", 0);
}

- (void)_activateEnrolledTrialExperiments
{
  id v6 = [MEMORY[0x1E4FB0098] clientWithIdentifier:111];
  id v3 = [v6 levelForFactor:@"music_ranking_strategy" withNamespaceName:@"SIRI_SPEECH_SV_SPEECH_PROFILE"];
  id v4 = [v3 stringValue];
  trialMediaRankingStrategy = self->_trialMediaRankingStrategy;
  self->_trialMediaRankingStrategy = v4;
}

- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5 playableLimit:(unint64_t)a6 artistLimit:(unint64_t)a7 itemIdToRank:(id)a8
{
  id v15 = a8;
  v22.receiver = self;
  v22.super_class = (Class)CESRSpeechItemRanker_Media;
  uint64_t v16 = [(CESRSpeechItemRanker *)&v22 initWithInstance:a3 speechProfileSite:a4 categoryGroup:a5];
  uint64_t v17 = v16;
  if (v16)
  {
    trialMediaRankingStrategy = v16->_trialMediaRankingStrategy;
    v16->_trialMediaRankingStrategy = 0;

    v17->_playableLimit = a6;
    v17->_unint64_t artistLimit = a7;
    objc_storeStrong((id *)&v17->_itemIdToRank, a8);
    uint64_t v19 = [MEMORY[0x1E4F1CA80] set];
    codepathIds = v17->_codepathIds;
    v17->_codepathIds = (NSMutableSet *)v19;

    [(CESRSpeechItemRanker_Media *)v17 _activateEnrolledTrialExperiments];
  }

  return v17;
}

- (CESRSpeechItemRanker_Media)initWithInstance:(id)a3 speechProfileSite:(id)a4 categoryGroup:(id)a5
{
  return [(CESRSpeechItemRanker_Media *)self initWithInstance:a3 speechProfileSite:a4 categoryGroup:a5 playableLimit:1500 artistLimit:1500 itemIdToRank:0];
}

+ (id)_performMediaItemsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  [v11 setEntityLimit:a4];
  [v11 _setOrderingProperties:v10];

  [v11 _setOrderingDirectionMappings:v9];
  NSUInteger v12 = [v11 items];

  return v12;
}

+ (id)_performMediaCollectionsQuery:(id)a3 limit:(unint64_t)a4 orderingProperties:(id)a5 orderingDirectionMappings:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a3;
  [v11 setEntityLimit:a4];
  [v11 _setOrderingProperties:v10];

  [v11 _setOrderingDirectionMappings:v9];
  NSUInteger v12 = [v11 collections];

  return v12;
}

+ (id)queryRecentMediaEntities
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "+[CESRSpeechItemRanker_Media queryRecentMediaEntities]";
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Playlists query.", buf, 0xCu);
  }
  objc_super v5 = [MEMORY[0x1E4F31970] playlistsQuery];
  uint64_t v23 = *MEMORY[0x1E4F31570];
  uint64_t v6 = v23;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  uint64_t v21 = v6;
  objc_super v22 = &unk_1F129E2D8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v22 forKeys:&v21 count:1];
  id v9 = +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:v5 limit:15 orderingProperties:v7 orderingDirectionMappings:v8];

  if ([v9 count]) {
    [v2 addObject:v9];
  }
  id v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v25 = "+[CESRSpeechItemRanker_Media queryRecentMediaEntities]";
    _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Songs query.", buf, 0xCu);
  }
  id v11 = [MEMORY[0x1E4F31970] songsQuery];
  uint64_t v20 = *MEMORY[0x1E4F31340];
  uint64_t v12 = v20;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  uint64_t v18 = v12;
  uint64_t v19 = &unk_1F129E2D8;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
  id v15 = +[CESRSpeechItemRanker_Media _performMediaItemsQuery:v11 limit:25 orderingProperties:v13 orderingDirectionMappings:v14];

  if ([v15 count]) {
    [v2 addObject:v15];
  }
  uint64_t v16 = +[CESRSpeechItemRanker_Media _itemIdsFromMediaEntities:v2];

  return v16;
}

+ (id)queryTopPlayableIds
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (os_log_t *)MEMORY[0x1E4F4E380];
  id v4 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B8CCB000, v4, OS_LOG_TYPE_INFO, "%s Executing Most Recently Played Playlists query.", buf, 0xCu);
  }
  objc_super v5 = [MEMORY[0x1E4F31970] playlistsQuery];
  uint64_t v50 = *MEMORY[0x1E4F31578];
  uint64_t v6 = v50;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
  uint64_t v48 = v6;
  v49 = &unk_1F129E2D8;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
  id v9 = +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:v5 limit:100 orderingProperties:v7 orderingDirectionMappings:v8];

  if ([v9 count]) {
    [v2 addObject:v9];
  }
  id v10 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B8CCB000, v10, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Playlists query.", buf, 0xCu);
  }
  id v11 = [MEMORY[0x1E4F31970] playlistsQuery];
  uint64_t v47 = *MEMORY[0x1E4F31570];
  uint64_t v12 = v47;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  uint64_t v45 = v12;
  uint64_t v46 = &unk_1F129E2D8;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  id v15 = +[CESRSpeechItemRanker_Media _performMediaCollectionsQuery:v11 limit:100 orderingProperties:v13 orderingDirectionMappings:v14];

  if ([v15 count]) {
    [v2 addObject:v15];
  }
  uint64_t v16 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B8CCB000, v16, OS_LOG_TYPE_INFO, "%s Executing Most Recently Played Songs query.", buf, 0xCu);
  }
  uint64_t v17 = [MEMORY[0x1E4F31970] songsQuery];
  uint64_t v44 = *MEMORY[0x1E4F31418];
  uint64_t v18 = v44;
  uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v44 count:1];
  uint64_t v42 = v18;
  unint64_t v43 = &unk_1F129E2D8;
  uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
  uint64_t v21 = +[CESRSpeechItemRanker_Media _performMediaItemsQuery:v17 limit:250 orderingProperties:v19 orderingDirectionMappings:v20];

  if ([v21 count]) {
    [v2 addObject:v21];
  }
  objc_super v22 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B8CCB000, v22, OS_LOG_TYPE_INFO, "%s Executing Most Recently Added Songs query.", buf, 0xCu);
  }
  uint64_t v23 = [MEMORY[0x1E4F31970] songsQuery];
  uint64_t v41 = *MEMORY[0x1E4F31340];
  uint64_t v24 = v41;
  id v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
  uint64_t v39 = v24;
  __int16 v40 = &unk_1F129E2D8;
  uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
  uint64_t v27 = +[CESRSpeechItemRanker_Media _performMediaItemsQuery:v23 limit:150 orderingProperties:v25 orderingDirectionMappings:v26];

  if ([v27 count]) {
    [v2 addObject:v27];
  }
  uint64_t v28 = *MEMORY[0x1E4F4E380];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E380], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v52 = "+[CESRSpeechItemRanker_Media queryTopPlayableIds]";
    _os_log_impl(&dword_1B8CCB000, v28, OS_LOG_TYPE_INFO, "%s Executing Most Played Songs query.", buf, 0xCu);
  }
  unint64_t v29 = [MEMORY[0x1E4F31970] songsQuery];
  uint64_t v38 = *MEMORY[0x1E4F31438];
  uint64_t v30 = v38;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
  uint64_t v36 = v30;
  uint64_t v37 = &unk_1F129E2D8;
  uint64_t v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
  uint64_t v33 = +[CESRSpeechItemRanker_Media _performMediaItemsQuery:v29 limit:3000 orderingProperties:v31 orderingDirectionMappings:v32];

  if ([v33 count]) {
    [v2 addObject:v33];
  }
  uint64_t v34 = +[CESRSpeechItemRanker_Media _itemIdsFromMediaEntities:v2];

  return v34;
}

+ (id)_rankedItemIdsFromTopPlayables:(id)a3 topArtists:(id)a4 playableLimit:(unint64_t)a5 artistLimit:(unint64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = [MEMORY[0x1E4F1CA60] dictionary];
  unint64_t v12 = [v9 count];
  if (v12 >= a5) {
    unint64_t v13 = a5;
  }
  else {
    unint64_t v13 = v12;
  }
  if (v13)
  {
    uint64_t v14 = 0;
    do
    {
      uint64_t v15 = v14 + 1;
      uint64_t v16 = [NSNumber numberWithUnsignedInteger:v14];
      uint64_t v17 = [v9 objectAtIndex:v14];
      [v11 setObject:v16 forKey:v17];

      uint64_t v14 = v15;
    }
    while (v13 != v15);
  }
  unint64_t v18 = [v10 count];
  if (v18 >= a6) {
    unint64_t v19 = a6;
  }
  else {
    unint64_t v19 = v18;
  }
  if (v19)
  {
    for (uint64_t i = 0; i != v19; ++i)
    {
      uint64_t v21 = [NSNumber numberWithUnsignedInteger:v13 + i];
      objc_super v22 = [v10 objectAtIndex:i];
      [v11 setObject:v21 forKey:v22];
    }
  }

  return v11;
}

+ (id)_itemIdsFromMediaEntities:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obuint64_t j = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v20 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = *(void *)v22;
          do
          {
            for (uint64_t j = 0; j != v11; ++j)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * j);
              uint64_t v15 = [v14 _tokenBinaryIdentifierAsString];
              uint64_t v16 = [v15 length];

              if (v16)
              {
                uint64_t v17 = [v14 _tokenBinaryIdentifierAsString];
                [v4 addObject:v17];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v11);
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v6);
  }

  return v4;
}

+ (BOOL)_isArtistItem:(id)a3
{
  id v3 = [a3 content];
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 entityType] - 1 < 2;

  return v4;
}

+ (BOOL)_isPlayableItem:(id)a3
{
  id v3 = [a3 content];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unsigned int v4 = [v3 entityType];
    if (v4 <= 6) {
      unsigned int v5 = (0x68u >> v4) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

@end