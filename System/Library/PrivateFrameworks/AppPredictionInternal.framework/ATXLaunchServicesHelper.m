@interface ATXLaunchServicesHelper
+ (BOOL)bundleIsExtension:(id)a3;
+ (id)getGenreIdsForBundleId:(id)a3;
+ (id)getGenreIdsForRecord:(id)a3;
@end

@implementation ATXLaunchServicesHelper

+ (BOOL)bundleIsExtension:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F223A0];
  id v4 = a3;
  v5 = (void *)[[v3 alloc] initWithBundleIdentifier:v4 error:0];

  return v5 != 0;
}

+ (id)getGenreIdsForBundleId:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F223C8];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 allowPlaceholder:1 error:0];

  v7 = 0;
  if (([v6 isLaunchProhibited] & 1) == 0)
  {
    v7 = [a1 getGenreIdsForRecord:v6];
  }

  return v7;
}

+ (id)getGenreIdsForRecord:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = NSNumber;
  id v5 = [v3 iTunesMetadata];
  v17 = objc_msgSend(v4, "numberWithUnsignedLongLong:", objc_msgSend(v5, "genreIdentifier"));

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v18 = v3;
  v6 = [v3 iTunesMetadata];
  v7 = [v6 subgenres];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    v10 = 0;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v7);
        }
        v13 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "objectForKeyedSubscript:", @"genreId", v17);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v13;
          if (!v10) {
            v10 = objc_opt_new();
          }
          [v10 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v9);
  }
  else
  {
    v10 = 0;
  }

  v15 = [MEMORY[0x1E4F93BB8] tupleWithFirst:v17 second:v10];

  return v15;
}

@end