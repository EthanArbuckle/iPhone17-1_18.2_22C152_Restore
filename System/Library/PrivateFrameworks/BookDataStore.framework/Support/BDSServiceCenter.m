@interface BDSServiceCenter
+ (void)_nextSortOrderForCollectionMemberManager:(id)a3 collectionID:(id)a4 completion:(id)a5;
+ (void)addStoreID:(id)a3 toCollectionID:(id)a4 completion:(id)a5;
+ (void)fetchIsAssetID:(id)a3 inCollectionID:(id)a4 completion:(id)a5;
+ (void)setFinishedState:(BOOL)a3 assetIDs:(id)a4 completion:(id)a5;
@end

@implementation BDSServiceCenter

+ (void)addStoreID:(id)a3 toCollectionID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [[BCMutableStoreItem alloc] initWithStoreID:v8];
  v12 = +[BCCloudAssetManager sharedManager];
  v13 = [v12 storeAssetManager];

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10007BCD0;
  v17[3] = &unk_100262030;
  id v20 = v10;
  id v21 = a1;
  id v18 = v8;
  id v19 = v9;
  id v14 = v9;
  id v15 = v10;
  id v16 = v8;
  [v13 addStoreItem:v11 completion:v17];
}

+ (void)fetchIsAssetID:(id)a3 inCollectionID:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = +[BCCollectionMember collectionMemberIDWithCollectionID:a4 assetID:a3];
  id v9 = +[BCCloudCollectionsManager sharedManager];
  id v10 = [v9 collectionMemberManager];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10007C094;
  v12[3] = &unk_100262058;
  id v13 = v7;
  id v11 = v7;
  [v10 collectionMemberForCollectionMemberID:v8 completion:v12];
}

+ (void)setFinishedState:(BOOL)a3 assetIDs:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v30;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v15 longLongValue]) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 1;
        }
        if (!v16)
        {
          id v17 = v15;
          id v18 = [[BCMutableStoreItem alloc] initWithStoreID:v17];
          [v9 setObject:v18 forKeyedSubscript:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v12);
  }

  id v19 = +[BCCloudAssetManager sharedManager];
  id v20 = [v19 storeAssetManager];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10007C378;
  v24[3] = &unk_1002620A8;
  id v26 = v10;
  id v27 = v8;
  id v25 = v9;
  BOOL v28 = a3;
  id v21 = v10;
  id v22 = v8;
  id v23 = v9;
  [v20 addStoreItems:v23 completion:v24];
}

+ (void)_nextSortOrderForCollectionMemberManager:(id)a3 collectionID:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (v9)
  {
    if (v7 && v8)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10007C954;
      v11[3] = &unk_1002620D0;
      id v12 = v9;
      [v7 fetchMaxSortOrderInCollectionID:v8 completion:v11];
    }
    else
    {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

@end