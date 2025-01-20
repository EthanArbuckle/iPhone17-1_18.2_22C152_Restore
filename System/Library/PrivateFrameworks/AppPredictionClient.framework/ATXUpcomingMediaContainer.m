@interface ATXUpcomingMediaContainer
+ (void)addToDictionary:(id)a3 key:(id)a4 value:(id)a5;
- (ATXUpcomingMediaContainer)init;
- (BOOL)appSupportsUpcomingMedia;
- (BOOL)isInternalApplication;
- (BOOL)preferUpcomingMediaForPredictions;
- (BOOL)preferenceForUpcomingMediaIsSet;
- (NSArray)sortedUpcomingMedia;
- (NSMutableDictionary)bucketExpiredUpcomingMedia;
- (NSMutableDictionary)bucketValidUpcomingMedia;
- (NSMutableDictionary)containerExpiredUpcomingMedia;
- (NSMutableDictionary)containerValidUpcomingMedia;
- (NSMutableDictionary)itemExpiredUpcomingMedia;
- (NSMutableDictionary)itemValidUpcomingMedia;
- (void)addUpcomingMediaIntent:(id)a3 withRank:(id)a4;
- (void)setIsInternalApplication:(BOOL)a3;
- (void)setPreferUpcomingMediaForPredictions:(BOOL)a3;
- (void)setPreferenceForUpcomingMediaIsSet:(BOOL)a3;
@end

@implementation ATXUpcomingMediaContainer

- (ATXUpcomingMediaContainer)init
{
  v18.receiver = self;
  v18.super_class = (Class)ATXUpcomingMediaContainer;
  v2 = [(ATXUpcomingMediaContainer *)&v18 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    v4 = (void *)*((void *)v2 + 4);
    *((void *)v2 + 4) = v3;

    uint64_t v5 = objc_opt_new();
    v6 = (void *)*((void *)v2 + 3);
    *((void *)v2 + 3) = v5;

    uint64_t v7 = objc_opt_new();
    v8 = (void *)*((void *)v2 + 5);
    *((void *)v2 + 5) = v7;

    uint64_t v9 = objc_opt_new();
    v10 = (void *)*((void *)v2 + 6);
    *((void *)v2 + 6) = v9;

    uint64_t v11 = objc_opt_new();
    v12 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v11;

    uint64_t v13 = objc_opt_new();
    v14 = (void *)*((void *)v2 + 8);
    *((void *)v2 + 8) = v13;

    v2[16] = 0;
    uint64_t v15 = objc_opt_new();
    v16 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v15;

    *(_WORD *)(v2 + 17) = 0;
    v2[19] = 0;
  }
  return (ATXUpcomingMediaContainer *)v2;
}

+ (void)addToDictionary:(id)a3 key:(id)a4 value:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = v8;
  if (v7 && v8)
  {
    v10 = [v11 objectForKeyedSubscript:v7];
    if (!v10)
    {
      v10 = objc_opt_new();
      [v11 setObject:v10 forKeyedSubscript:v7];
    }
    [v10 addObject:v9];
  }
}

- (void)addUpcomingMediaIntent:(id)a3 withRank:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mediaContainer];
  v42 = [v8 identifier];

  uint64_t v9 = [v6 mediaItems];
  v10 = [v9 firstObject];
  id v11 = [v10 identifier];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F93BB8]) initWithFirst:v6 second:v7];
  uint64_t v13 = [v6 launchId];
  int v14 = [v13 isEqualToString:@"com.apple.tv"];

  if (v14) {
    [v6 setExpirationDate:0];
  }
  uint64_t v15 = [v6 expirationDate];
  if (v15)
  {
  }
  else
  {
    v16 = [v6 buckets];

    if (!v16)
    {
      +[ATXUpcomingMediaContainer addToDictionary:self->_containerValidUpcomingMedia key:v42 value:v12];
      +[ATXUpcomingMediaContainer addToDictionary:self->_itemValidUpcomingMedia key:v11 value:v12];
      [(NSMutableArray *)self->_maybeSortedUpcomingMedia addObject:v12];
      goto LABEL_32;
    }
  }
  id v40 = v7;
  v41 = [MEMORY[0x1E4F1C9C8] date];
  v17 = objc_opt_new();
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  objc_super v18 = [v6 buckets];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v51 objects:v57 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v52;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v52 != v21) {
          objc_enumerationMutation(v18);
        }
        v23 = [*(id *)(*((void *)&v51 + 1) + 8 * v22) vocabularyIdentifier];
        [v17 addObject:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v51 objects:v57 count:16];
    }
    while (v20);
  }

  uint64_t v24 = [v6 expirationDate];
  if (!v24) {
    goto LABEL_23;
  }
  v25 = (void *)v24;
  v26 = [v6 expirationDate];
  v27 = [v26 earlierDate:v41];
  v28 = [v6 expirationDate];
  int v29 = [v27 isEqualToDate:v28];

  if (v29)
  {
    +[ATXUpcomingMediaContainer addToDictionary:self->_containerExpiredUpcomingMedia key:v42 value:v12];
    +[ATXUpcomingMediaContainer addToDictionary:self->_itemExpiredUpcomingMedia key:v11 value:v12];
    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v30 = v17;
    uint64_t v31 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v48;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v48 != v33) {
            objc_enumerationMutation(v30);
          }
          +[ATXUpcomingMediaContainer addToDictionary:self->_bucketExpiredUpcomingMedia key:*(void *)(*((void *)&v47 + 1) + 8 * v34++) value:v12];
        }
        while (v32 != v34);
        uint64_t v32 = [v30 countByEnumeratingWithState:&v47 objects:v56 count:16];
      }
      while (v32);
    }
  }
  else
  {
LABEL_23:
    +[ATXUpcomingMediaContainer addToDictionary:self->_containerValidUpcomingMedia key:v42 value:v12];
    +[ATXUpcomingMediaContainer addToDictionary:self->_itemValidUpcomingMedia key:v11 value:v12];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v35 = v17;
    uint64_t v36 = [v35 countByEnumeratingWithState:&v43 objects:v55 count:16];
    if (v36)
    {
      uint64_t v37 = v36;
      uint64_t v38 = *(void *)v44;
      do
      {
        uint64_t v39 = 0;
        do
        {
          if (*(void *)v44 != v38) {
            objc_enumerationMutation(v35);
          }
          +[ATXUpcomingMediaContainer addToDictionary:self->_bucketValidUpcomingMedia key:*(void *)(*((void *)&v43 + 1) + 8 * v39++) value:v12];
        }
        while (v37 != v39);
        uint64_t v37 = [v35 countByEnumeratingWithState:&v43 objects:v55 count:16];
      }
      while (v37);
    }

    [(NSMutableArray *)self->_maybeSortedUpcomingMedia addObject:v12];
  }

  id v7 = v40;
LABEL_32:
  self->_sorted = 0;
}

- (NSArray)sortedUpcomingMedia
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (!self->_sorted)
  {
    maybeSortedUpcomingMedia = self->_maybeSortedUpcomingMedia;
    v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"second" ascending:0];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(NSMutableArray *)maybeSortedUpcomingMedia sortUsingDescriptors:v5];

    self->_sorted = 1;
  }
  id v6 = (void *)[(NSMutableArray *)self->_maybeSortedUpcomingMedia copy];

  return (NSArray *)v6;
}

- (BOOL)appSupportsUpcomingMedia
{
  return [(NSMutableArray *)self->_maybeSortedUpcomingMedia count] != 0;
}

- (NSMutableDictionary)itemExpiredUpcomingMedia
{
  return self->_itemExpiredUpcomingMedia;
}

- (NSMutableDictionary)itemValidUpcomingMedia
{
  return self->_itemValidUpcomingMedia;
}

- (NSMutableDictionary)containerExpiredUpcomingMedia
{
  return self->_containerExpiredUpcomingMedia;
}

- (NSMutableDictionary)containerValidUpcomingMedia
{
  return self->_containerValidUpcomingMedia;
}

- (NSMutableDictionary)bucketExpiredUpcomingMedia
{
  return self->_bucketExpiredUpcomingMedia;
}

- (NSMutableDictionary)bucketValidUpcomingMedia
{
  return self->_bucketValidUpcomingMedia;
}

- (BOOL)preferUpcomingMediaForPredictions
{
  return self->_preferUpcomingMediaForPredictions;
}

- (void)setPreferUpcomingMediaForPredictions:(BOOL)a3
{
  self->_preferUpcomingMediaForPredictions = a3;
}

- (BOOL)preferenceForUpcomingMediaIsSet
{
  return self->_preferenceForUpcomingMediaIsSet;
}

- (void)setPreferenceForUpcomingMediaIsSet:(BOOL)a3
{
  self->_preferenceForUpcomingMediaIsSet = a3;
}

- (BOOL)isInternalApplication
{
  return self->_isInternalApplication;
}

- (void)setIsInternalApplication:(BOOL)a3
{
  self->_isInternalApplication = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_bucketExpiredUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_containerValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_containerExpiredUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_itemValidUpcomingMedia, 0);
  objc_storeStrong((id *)&self->_itemExpiredUpcomingMedia, 0);

  objc_storeStrong((id *)&self->_maybeSortedUpcomingMedia, 0);
}

@end