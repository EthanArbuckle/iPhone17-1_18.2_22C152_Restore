@interface MPCloudControllerItemIDList
+ (id)cloudItemIDListForPlaylist:(id)a3;
- (ICCloudItemIDList)cloudItemIDList;
- (MPCloudControllerItemIDList)init;
- (id)ICCloudItemIDList;
- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4;
- (void)addPlaylistID:(id)a3;
- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5;
- (void)setCloudItemIDList:(id)a3;
@end

@implementation MPCloudControllerItemIDList

- (void).cxx_destruct
{
}

- (void)setCloudItemIDList:(id)a3
{
}

- (ICCloudItemIDList)cloudItemIDList
{
  return self->_cloudItemIDList;
}

- (id)ICCloudItemIDList
{
  return self->_cloudItemIDList;
}

- (void)addPlaylistID:(id)a3
{
}

- (void)insertCloudItemID:(unint64_t)a3 idType:(int64_t)a4 atIndex:(unint64_t)a5
{
}

- (void)addCloudItemID:(unint64_t)a3 idType:(int64_t)a4
{
}

- (MPCloudControllerItemIDList)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPCloudControllerItemIDList;
  v2 = [(MPCloudControllerItemIDList *)&v6 init];
  if (v2)
  {
    v3 = (ICCloudItemIDList *)objc_alloc_init(MEMORY[0x1E4FB85E0]);
    cloudItemIDList = v2->_cloudItemIDList;
    v2->_cloudItemIDList = v3;
  }
  return v2;
}

+ (id)cloudItemIDListForPlaylist:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v24 = objc_alloc_init(MPCloudControllerItemIDList);
  v22 = v3;
  v4 = [v3 itemsQuery];
  v5 = (void *)[v4 copy];

  [v5 setIgnoreRestrictionsPredicates:1];
  [v5 setIgnoreSystemFilterPredicates:1];
  v21 = v5;
  objc_super v6 = [v5 items];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"storeSagaID", @"subscriptionStoreItemAdamID", @"cloudIsInMyLibrary", 0);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v25 + 1) + 8 * i) valuesForProperties:v7];
        v13 = [v12 objectForKey:@"storeSagaID"];
        uint64_t v14 = [v13 longLongValue];

        v15 = [v12 objectForKey:@"subscriptionStoreItemAdamID"];
        uint64_t v16 = [v15 longLongValue];

        if (v14 < 1)
        {
          if (v16 < 1) {
            goto LABEL_11;
          }
          v17 = v24;
          uint64_t v18 = v16;
          uint64_t v19 = 1;
        }
        else
        {
          v17 = v24;
          uint64_t v18 = v14;
          uint64_t v19 = 0;
        }
        [(MPCloudControllerItemIDList *)v17 addCloudItemID:v18 idType:v19];
LABEL_11:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  return v24;
}

@end