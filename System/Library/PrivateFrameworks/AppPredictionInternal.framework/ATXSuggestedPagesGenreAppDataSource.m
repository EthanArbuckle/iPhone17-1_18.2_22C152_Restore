@interface ATXSuggestedPagesGenreAppDataSource
- (BOOL)_appLaunchDataPassesThreshold:(id)a3 forPageType:(int64_t)a4 bundleId:(id)a5;
- (BOOL)_pageType:(int64_t)a3 matchesGenreId:(unint64_t)a4 forBundleId:(id)a5;
- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4;
@end

@implementation ATXSuggestedPagesGenreAppDataSource

- (id)provideAppsForSuggestedPageType:(int64_t)a3 environment:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v30 = a4;
  v6 = +[_ATXAppIconState sharedInstance];
  v7 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v8 = [v6 allAppsKnownToSpringBoard];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        if (-[ATXSuggestedPagesGenreAppDataSource _pageType:matchesGenreId:forBundleId:](self, "_pageType:matchesGenreId:forBundleId:", a3, [MEMORY[0x1E4F4AF00] genreIdForBundle:v13], v13))
        {
          [v7 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v35 objects:v40 count:16];
    }
    while (v10);
  }

  if ([v7 count])
  {
    v27 = v6;
    id v14 = objc_alloc(MEMORY[0x1E4F1CB18]);
    v15 = (void *)[v14 initWithSuiteName:*MEMORY[0x1E4F4B688]];
    char v16 = [v15 BOOLForKey:*MEMORY[0x1E4F4B5D0]];

    id v29 = (id)objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    v26 = v7;
    obuint64_t j = v7;
    uint64_t v17 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v32 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = *(void *)(*((void *)&v31 + 1) + 8 * j);
          v22 = [v30 appLaunchCounts];
          v23 = [v22 objectForKeyedSubscript:v21];

          if ((v16 & 1) != 0
            || [(ATXSuggestedPagesGenreAppDataSource *)self _appLaunchDataPassesThreshold:v23 forPageType:a3 bundleId:v21])
          {
            v24 = objc_msgSend(objc_alloc(MEMORY[0x1E4F4B070]), "initWithBundleId:predictionSource:score:uniqueDaysLaunched:rawLaunchCount:", v21, @"App Category", objc_msgSend(v23, "uniqueDaysLaunched"), objc_msgSend(v23, "rawLaunchCount"), 0.0);
            [v29 addObject:v24];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v18);
    }

    v7 = v26;
    v6 = v27;
  }
  else
  {
    id v29 = 0;
  }

  return v29;
}

- (BOOL)_appLaunchDataPassesThreshold:(id)a3 forPageType:(int64_t)a4 bundleId:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  switch(a4)
  {
    case 5:
    case 9:
      goto LABEL_8;
    case 6:
      if ([MEMORY[0x1E4F4AF00] genreIdForBundle:v8] == 6011)
      {
        BOOL v9 = (unint64_t)[v7 uniqueDaysLaunched] > 6;
LABEL_5:
        BOOL v10 = v9;
      }
      else
      {
LABEL_8:
        BOOL v10 = [v7 rawLaunchCount] != 0;
      }
LABEL_11:

      return v10;
    case 7:
    case 8:
      BOOL v9 = (unint64_t)[v7 uniqueDaysLaunched] > 1;
      goto LABEL_5;
    case 10:
      BOOL v10 = 1;
      goto LABEL_11;
    default:
      BOOL v10 = 0;
      goto LABEL_11;
  }
}

- (BOOL)_pageType:(int64_t)a3 matchesGenreId:(unint64_t)a4 forBundleId:(id)a5
{
  id v7 = a5;
  switch(a3)
  {
    case 5:
      uint64_t v8 = 6010;
      goto LABEL_17;
    case 6:
      if (a4 == 6011 && ([MEMORY[0x1E4F4AF00] isBackgroundAudioSupportedForBundle:v7] & 1) != 0)
      {
        BOOL v14 = 1;
      }
      else
      {
        uint64_t v8 = 6013;
LABEL_17:
        BOOL v9 = a4 == v8;
LABEL_18:
        BOOL v14 = v9;
      }
LABEL_21:

      return v14;
    case 7:
      BOOL v9 = a4 == 6000 || a4 == 6007;
      goto LABEL_18;
    case 8:
      char v10 = a4 - 116;
      BOOL v11 = a4 - 6004 >= 0xD;
      unsigned int v12 = 4241;
      goto LABEL_8;
    case 9:
      char v10 = a4 - 121;
      BOOL v11 = a4 - 6009 >= 0xD;
      unsigned int v12 = 4609;
LABEL_8:
      int v13 = (v12 >> v10) & 1;
      if (v11) {
        BOOL v14 = 0;
      }
      else {
        BOOL v14 = v13;
      }
      goto LABEL_21;
    case 10:
      uint64_t v8 = 6014;
      goto LABEL_17;
    default:
      BOOL v14 = 0;
      goto LABEL_21;
  }
}

@end