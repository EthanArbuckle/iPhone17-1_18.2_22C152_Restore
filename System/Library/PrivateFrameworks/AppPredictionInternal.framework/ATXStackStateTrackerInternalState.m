@interface ATXStackStateTrackerInternalState
+ (BOOL)supportsSecureCoding;
- (ATXBMBookmark)bookmark;
- (ATXStackStateTrackerInternalState)init;
- (ATXStackStateTrackerInternalState)initWithCoder:(id)a3;
- (NSMutableArray)blendingCacheUpdateUUIDs;
- (NSMutableDictionary)cachedStackLayoutsByBlendingUpdateUUID;
- (NSMutableDictionary)lastThreeUserVisitDatesOfPages;
- (NSMutableDictionary)stackStateByStackId;
- (void)encodeWithCoder:(id)a3;
- (void)setBlendingCacheUpdateUUIDs:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setCachedStackLayoutsByBlendingUpdateUUID:(id)a3;
- (void)setLastThreeUserVisitDatesOfPages:(id)a3;
- (void)setStackStateByStackId:(id)a3;
- (void)updateLastThreeUserVisitDatesIfNecessaryForPage:(id)a3 date:(id)a4;
@end

@implementation ATXStackStateTrackerInternalState

- (ATXStackStateTrackerInternalState)init
{
  v13.receiver = self;
  v13.super_class = (Class)ATXStackStateTrackerInternalState;
  v2 = [(ATXStackStateTrackerInternalState *)&v13 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    lastThreeUserVisitDatesOfPages = v2->_lastThreeUserVisitDatesOfPages;
    v2->_lastThreeUserVisitDatesOfPages = (NSMutableDictionary *)v3;

    uint64_t v5 = objc_opt_new();
    stackStateByStackId = v2->_stackStateByStackId;
    v2->_stackStateByStackId = (NSMutableDictionary *)v5;

    uint64_t v7 = objc_opt_new();
    cachedStackLayoutsByBlendingUpdateUUID = v2->_cachedStackLayoutsByBlendingUpdateUUID;
    v2->_cachedStackLayoutsByBlendingUpdateUUID = (NSMutableDictionary *)v7;

    uint64_t v9 = objc_opt_new();
    blendingCacheUpdateUUIDs = v2->_blendingCacheUpdateUUIDs;
    v2->_blendingCacheUpdateUUIDs = (NSMutableArray *)v9;

    bookmark = v2->_bookmark;
    v2->_bookmark = 0;
  }
  return v2;
}

- (void)updateLastThreeUserVisitDatesIfNecessaryForPage:(id)a3 date:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9 && v6)
  {
    uint64_t v7 = [(NSMutableDictionary *)self->_lastThreeUserVisitDatesOfPages objectForKeyedSubscript:v9];
    if (v7)
    {
      v8 = v7;
      if (([v7 containsObject:v6] & 1) == 0)
      {
        [v8 addObject:v6];
        [v8 sortUsingComparator:&__block_literal_global_116];
        if ((unint64_t)[v8 count] >= 4)
        {
          do
            [v8 removeLastObject];
          while ((unint64_t)[v8 count] > 3);
        }
      }
    }
    else
    {
      v8 = objc_opt_new();
      [v8 addObject:v6];
      [(NSMutableDictionary *)self->_lastThreeUserVisitDatesOfPages setObject:v8 forKeyedSubscript:v9];
    }
  }
}

uint64_t __90__ATXStackStateTrackerInternalState_updateLastThreeUserVisitDatesIfNecessaryForPage_date___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 compare:a2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ATXStackStateTrackerInternalState *)self lastThreeUserVisitDatesOfPages];
  [v4 encodeObject:v5 forKey:@"codingKeyForLastThreeUserVisitDatesOfPages"];

  id v6 = [(ATXStackStateTrackerInternalState *)self stackStateByStackId];
  [v4 encodeObject:v6 forKey:@"codingKeyForStackStateByStackId"];

  uint64_t v7 = [(ATXStackStateTrackerInternalState *)self cachedStackLayoutsByBlendingUpdateUUID];
  [v4 encodeObject:v7 forKey:@"codingKeyForBlendingCacheUpdateByBlendingUpdateUUID"];

  v8 = [(ATXStackStateTrackerInternalState *)self blendingCacheUpdateUUIDs];
  [v4 encodeObject:v8 forKey:@"codingKeyForBlendingCacheUpdateUUIDs"];

  id v9 = [(ATXStackStateTrackerInternalState *)self bookmark];
  id v15 = 0;
  v10 = [v9 serializeBookmark:&v15];
  id v11 = v15;

  if (v11)
  {
    v12 = __atxlog_handle_blending();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      objc_super v13 = (objc_class *)objc_opt_class();
      v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      v17 = v14;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      v21 = v10;
      _os_log_error_impl(&dword_1D0FA3000, v12, OS_LOG_TYPE_ERROR, "%@ - bookmark serialization failed with err: %@, data: %@", buf, 0x20u);
    }
  }
  else
  {
    [v4 encodeObject:v10 forKey:@"codingKeyForBookmark"];
  }
}

- (ATXStackStateTrackerInternalState)initWithCoder:(id)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F93B90];
  id v6 = (void *)MEMORY[0x1D25F6CC0]();
  id v7 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  id v11 = objc_msgSend(v7, "initWithObjects:", v8, v9, v10, objc_opt_class(), 0);
  v12 = __atxlog_handle_blending();
  objc_super v13 = [v5 robustDecodeObjectOfClasses:v11 forKey:@"codingKeyForLastThreeUserVisitDatesOfPages" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXStackStateTracker" errorCode:-1 logHandle:v12];

  v14 = [v4 error];

  if (!v14)
  {
    v16 = (void *)MEMORY[0x1E4F93B90];
    v17 = (void *)MEMORY[0x1D25F6CC0]();
    id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v18, "initWithObjects:", v19, v20, objc_opt_class(), 0);
    uint64_t v22 = __atxlog_handle_blending();
    v23 = [v16 robustDecodeObjectOfClasses:v21 forKey:@"codingKeyForStackStateByStackId" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXStackStateTracker" errorCode:-1 logHandle:v22];

    v24 = [v4 error];

    if (v24)
    {
      id v15 = [(ATXStackStateTrackerInternalState *)self init];
LABEL_23:

      goto LABEL_24;
    }
    v25 = (void *)MEMORY[0x1E4F93B90];
    v26 = (void *)MEMORY[0x1D25F6CC0]();
    id v27 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v28 = objc_opt_class();
    v29 = objc_msgSend(v27, "initWithObjects:", v28, objc_opt_class(), 0);
    v30 = __atxlog_handle_blending();
    v31 = [v25 robustDecodeObjectOfClasses:v29 forKey:@"codingKeyForBlendingCacheUpdateByBlendingUpdateUUID" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXStackStateTracker" errorCode:-1 logHandle:v30];

    v32 = [v4 error];

    if (v32)
    {
      id v15 = [(ATXStackStateTrackerInternalState *)self init];
LABEL_22:

      goto LABEL_23;
    }
    v33 = (void *)MEMORY[0x1E4F93B90];
    v34 = (void *)MEMORY[0x1D25F6CC0]();
    id v35 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v36 = objc_opt_class();
    v37 = objc_msgSend(v35, "initWithObjects:", v36, objc_opt_class(), 0);
    v38 = __atxlog_handle_blending();
    v39 = [v33 robustDecodeObjectOfClasses:v37 forKey:@"codingKeyForBlendingCacheUpdateUUIDs" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXStackStateTracker" errorCode:-1 logHandle:v38];

    v40 = [v4 error];

    if (v40)
    {
      id v15 = [(ATXStackStateTrackerInternalState *)self init];
LABEL_21:

      goto LABEL_22;
    }
    v41 = (void *)MEMORY[0x1E4F93B90];
    uint64_t v42 = objc_opt_class();
    v43 = __atxlog_handle_blending();
    v44 = [v41 robustDecodeObjectOfClass:v42 forKey:@"codingKeyForBookmark" withCoder:v4 expectNonNull:0 errorDomain:@"com.apple.duetexpertd.ATXStackStateTracker" errorCode:-1 logHandle:v43];

    v45 = [v4 error];

    if (v45) {
      goto LABEL_10;
    }
    if (v44)
    {
      v46 = [MEMORY[0x1E4F4B618] bookmarkFromData:v44 bookmarkLocation:0 versionNumber:&unk_1F27F17A0];
      if (!v46)
      {
        v47 = __atxlog_handle_blending();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR)) {
          -[ATXStackStateTrackerInternalState initWithCoder:](v47, v48, v49, v50, v51, v52, v53, v54);
        }

LABEL_10:
        id v15 = [(ATXStackStateTrackerInternalState *)self init];
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      v46 = 0;
    }
    v55 = [(ATXStackStateTrackerInternalState *)self init];
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __51__ATXStackStateTrackerInternalState_initWithCoder___block_invoke;
    v61[3] = &unk_1E68B1D48;
    id v15 = v55;
    v62 = v15;
    [v13 enumerateKeysAndObjectsUsingBlock:v61];
    v56 = (void *)[v23 mutableCopy];
    [(ATXStackStateTrackerInternalState *)v15 setStackStateByStackId:v56];

    v57 = (void *)[v31 mutableCopy];
    [(ATXStackStateTrackerInternalState *)v15 setCachedStackLayoutsByBlendingUpdateUUID:v57];

    v58 = (void *)[v39 mutableCopy];
    [(ATXStackStateTrackerInternalState *)v15 setBlendingCacheUpdateUUIDs:v58];

    [(ATXStackStateTrackerInternalState *)v15 setBookmark:v46];
    v59 = __atxlog_handle_blending();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v64 = "-[ATXStackStateTrackerInternalState initWithCoder:]";
      _os_log_impl(&dword_1D0FA3000, v59, OS_LOG_TYPE_DEFAULT, "%s: Successfully deserialized ATXStackStateTrackerInternalState from disk", buf, 0xCu);
    }

    goto LABEL_20;
  }
  id v15 = [(ATXStackStateTrackerInternalState *)self init];
LABEL_24:

  return v15;
}

void __51__ATXStackStateTrackerInternalState_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v7 = (id)[a3 mutableCopy];
  id v6 = [*(id *)(a1 + 32) lastThreeUserVisitDatesOfPages];
  [v6 setObject:v7 forKeyedSubscript:v5];
}

- (NSMutableDictionary)lastThreeUserVisitDatesOfPages
{
  return self->_lastThreeUserVisitDatesOfPages;
}

- (void)setLastThreeUserVisitDatesOfPages:(id)a3
{
}

- (NSMutableDictionary)stackStateByStackId
{
  return self->_stackStateByStackId;
}

- (void)setStackStateByStackId:(id)a3
{
}

- (NSMutableDictionary)cachedStackLayoutsByBlendingUpdateUUID
{
  return self->_cachedStackLayoutsByBlendingUpdateUUID;
}

- (void)setCachedStackLayoutsByBlendingUpdateUUID:(id)a3
{
}

- (NSMutableArray)blendingCacheUpdateUUIDs
{
  return self->_blendingCacheUpdateUUIDs;
}

- (void)setBlendingCacheUpdateUUIDs:(id)a3
{
}

- (ATXBMBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_blendingCacheUpdateUUIDs, 0);
  objc_storeStrong((id *)&self->_cachedStackLayoutsByBlendingUpdateUUID, 0);
  objc_storeStrong((id *)&self->_stackStateByStackId, 0);
  objc_storeStrong((id *)&self->_lastThreeUserVisitDatesOfPages, 0);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end