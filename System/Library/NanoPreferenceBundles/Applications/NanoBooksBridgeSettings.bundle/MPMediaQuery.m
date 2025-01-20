@interface MPMediaQuery
+ (id)nb_storeOnlyAudiobooksQuery;
- (id)nb_existingSearchPredicate;
@end

@implementation MPMediaQuery

+ (id)nb_storeOnlyAudiobooksQuery
{
  v2 = +[BLMediaQuery audiobooksNonPreordersQuery];
  [v2 setIgnoreSystemFilterPredicates:1];
  [v2 setGroupingType:1];
  v3 = +[MPMediaPropertyPredicate predicateWithValue:&off_21A48 forProperty:MPMediaItemPropertyPurchaseHistoryID comparisonType:100];
  [v2 addFilterPredicate:v3];
  if (!+[NBBridgeUtilities isExplicitMaterialAllowed])
  {
    v4 = +[MPMediaPropertyPredicate predicateWithValue:&__kCFBooleanFalse forProperty:MPMediaItemPropertyIsExplicit comparisonType:0];
    [v2 addFilterPredicate:v4];
  }
  [v2 setSortItems:1];
  uint64_t v7 = MPMediaItemPropertySortTitle;
  v5 = +[NSArray arrayWithObjects:&v7 count:1];
  [v2 _setOrderingProperties:v5];

  return v2;
}

- (id)nb_existingSearchPredicate
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(MPMediaQuery *)self filterPredicates];
  id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

@end