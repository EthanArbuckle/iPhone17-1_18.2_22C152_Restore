@interface SLRemoteServicePlistLoader
+ (id)allServices;
+ (id)loadRemoteServicesFromPlistResourceName:(id)a3 inBundle:(id)a4;
@end

@implementation SLRemoteServicePlistLoader

+ (id)allServices
{
  v2 = objc_opt_class();
  v3 = SLSocialFrameworkBundle();
  v4 = [v2 loadRemoteServicesFromPlistResourceName:@"SystemRemoteServices-iOS" inBundle:v3];

  return v4;
}

+ (id)loadRemoteServicesFromPlistResourceName:(id)a3 inBundle:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [v6 pathForResource:a3 ofType:@"plist"];
  v8 = [MEMORY[0x1E4F1C978] arrayWithContentsOfFile:v7];
  if (v8)
  {
    id v17 = (id)objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v15 = [[SLRemoteService alloc] initWithServiceBundle:v6 socialInfoDictionary:v14];
            if (v15) {
              [v17 addObject:v15];
            }
          }
          else
          {
            _SLLog(v4, 3, @"Incorrect type for service info dict, service entries must be dictionaries");
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v11);
    }
  }
  else
  {
    _SLLog(v4, 3, @"Unable to load remote service info dicts from %@");
    id v17 = 0;
  }

  return v17;
}

@end