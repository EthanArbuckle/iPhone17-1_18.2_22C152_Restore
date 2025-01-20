@interface NanoNewsSettingsManager
+ (BOOL)_validDateArray:(id)a3;
+ (id)articleIdentifiersOnGizmo;
+ (id)gizmoSavedHeadlineIdentifiers;
+ (id)preferredRefreshDates;
+ (id)savedHeadlineIdentifiers;
+ (id)seenHeadlineIdentifiers;
+ (void)addSavedIdentifier:(id)a3;
+ (void)addSeenIdentifier:(id)a3;
+ (void)removeSavedIdentifier:(id)a3;
+ (void)removeSeenIdentifier:(id)a3;
+ (void)resetSaved;
+ (void)resetSeen;
+ (void)setPreferredRefreshDates:(id)a3;
+ (void)setSavedIdentifiers:(id)a3;
+ (void)synchronizeSeenHeadlineIdentifiers;
@end

@implementation NanoNewsSettingsManager

+ (void)synchronizeSeenHeadlineIdentifiers
{
  id v2 = +[NNArticleIdentifierSyncManager seenManager];
  [v2 synchronize];
}

+ (id)seenHeadlineIdentifiers
{
  id v2 = +[NNArticleIdentifierSyncManager seenManager];
  v3 = [v2 articleIdentifiers];

  return v3;
}

+ (id)savedHeadlineIdentifiers
{
  id v2 = +[NNArticleIdentifierSyncManager savedManager];
  v3 = [v2 articleIdentifiers];

  return v3;
}

+ (id)articleIdentifiersOnGizmo
{
  id v2 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v2 synchronize];
  v3 = [v2 arrayForKey:@"gizmoArticleIdentifiers"];
  v4 = +[NSSet setWithArray:v3];

  return v4;
}

+ (id)gizmoSavedHeadlineIdentifiers
{
  id v2 = +[NNArticleIdentifierSyncManager savedManager];
  v3 = [v2 readonlyArticleIdentifiers];

  return v3;
}

+ (void)addSeenIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NNArticleIdentifierSyncManager seenManager];
  [v4 addIdentifier:v3];
}

+ (void)addSavedIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NNArticleIdentifierSyncManager savedManager];
  [v4 addIdentifier:v3];

  [v4 synchronize];
}

+ (void)removeSavedIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NNArticleIdentifierSyncManager savedManager];
  [v4 removeIdentifier:v3];

  [v4 synchronize];
}

+ (void)removeSeenIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[NNArticleIdentifierSyncManager seenManager];
  [v4 removeIdentifier:v3];
}

+ (BOOL)_validDateArray:(id)a3
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a3;
  id v4 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          BOOL v8 = 0;
          goto LABEL_11;
        }
      }
      v5 = (char *)[v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_11:

  return v8;
}

+ (id)preferredRefreshDates
{
  id v3 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v3 synchronize];
  id v4 = [v3 objectForKey:@"preferredRefreshDates"];
  unsigned __int8 v5 = [a1 _validDateArray:v4];
  if (v4 && (v5 & 1) != 0)
  {
    id v6 = v4;
  }
  else
  {
    uint64_t v7 = +[NSDate date];
    BOOL v8 = +[NSCalendar currentCalendar];
    v9 = +[NSMutableArray array];
    long long v10 = +[NSTimeZone localTimeZone];
    v18 = (void *)v7;
    long long v11 = [v8 componentsInTimeZone:v10 fromDate:v7];

    [v11 setMinute:0];
    [v11 setSecond:0];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v12 = [&off_100008790 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v20;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v20 != v14) {
            objc_enumerationMutation(&off_100008790);
          }
          objc_msgSend(v11, "setHour:", objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "integerValue"));
          v16 = [v8 dateFromComponents:v11];
          [v9 addObject:v16];
        }
        id v13 = [&off_100008790 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v13);
    }
    id v6 = [v9 copy];
  }
  return v6;
}

+ (void)setPreferredRefreshDates:(id)a3
{
  id v6 = a3;
  id v4 = +[NSUserDefaults nanoNewsSyncDefaults];
  [v4 synchronize];
  if ([a1 _validDateArray:v6])
  {
    [v4 setObject:v6 forKey:@"preferredRefreshDates"];
    [v4 synchronize];
    unsigned __int8 v5 = +[NSSet setWithObject:@"preferredRefreshDates"];
    objc_msgSend(v4, "nn_synchronizeKeys:", v5);
  }
}

+ (void)setSavedIdentifiers:(id)a3
{
  id v4 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v35;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(v4);
        }
        [a1 addSavedIdentifier:*(void *)(*((void *)&v34 + 1) + 8 * i)];
      }
      id v6 = [v4 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v6);
  }
  v9 = +[NNArticleIdentifierSyncManager savedManager];
  long long v10 = [v9 articleIdentifiers];

  long long v11 = +[NSMutableSet set];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v12 = v10;
  id v13 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      for (j = 0; j != v14; j = (char *)j + 1)
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * (void)j);
        if (([v4 containsObject:v17] & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v30 objects:v39 count:16];
    }
    while (v14);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v18 = v11;
  id v19 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (k = 0; k != v20; k = (char *)k + 1)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v26 + 1) + 8 * (void)k);
        v24 = +[NNArticleIdentifierSyncManager savedManager];
        [v24 removeIdentifier:v23];
      }
      id v20 = [v18 countByEnumeratingWithState:&v26 objects:v38 count:16];
    }
    while (v20);
  }

  v25 = +[NNArticleIdentifierSyncManager savedManager];
  [v25 synchronize];
}

+ (void)resetSeen
{
  id v2 = +[NNArticleIdentifierSyncManager seenManager];
  [v2 clearAllIdentifiers];
}

+ (void)resetSaved
{
  id v2 = +[NNArticleIdentifierSyncManager savedManager];
  [v2 clearAllIdentifiers];
}

@end