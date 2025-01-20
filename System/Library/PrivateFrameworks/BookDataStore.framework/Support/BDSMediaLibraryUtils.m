@interface BDSMediaLibraryUtils
+ (id)_storeRepresentativeItem:(id)a3;
+ (id)representativeDAAPMediaItemsWithAssetId:(id)a3;
@end

@implementation BDSMediaLibraryUtils

+ (id)representativeDAAPMediaItemsWithAssetId:(id)a3
{
  id v4 = a3;
  v6 = +[MPMediaQuery audiobooksQuery];
  [v6 setIgnoreSystemFilterPredicates:1];
  if (v6)
  {
    v7 = +[MPMediaPropertyPredicate predicateWithValue:v4 forProperty:MPMediaItemPropertyStoreID];
    [v6 addFilterPredicate:v7];
    v8 = [v6 collections];
    if ([v8 count])
    {
      v9 = [v8 lastObject];
      v10 = [a1 _storeRepresentativeItem:v9];

      if (v10)
      {
LABEL_12:

        goto LABEL_13;
      }
      v11 = sub_10000CEB0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001E8F18((uint64_t)v4, v11);
      }
    }
    else
    {
      v11 = sub_10000CEB0();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1001E8EA0((uint64_t)v4, v11);
      }
    }

    v10 = 0;
    goto LABEL_12;
  }
  v7 = sub_10000CEB0();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1001E8E5C(v7);
  }
  v10 = 0;
LABEL_13:

  return v10;
}

+ (id)_storeRepresentativeItem:(id)a3
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(a3, "items", 0);
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = MPMediaItemPropertyPurchaseHistoryID;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 valueForProperty:v7];
        if ([v9 mediaType] == (id)4 && objc_msgSend(v10, "longLongValue"))
        {
          id v11 = v9;

          goto LABEL_12;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v11 = 0;
LABEL_12:

  return v11;
}

@end