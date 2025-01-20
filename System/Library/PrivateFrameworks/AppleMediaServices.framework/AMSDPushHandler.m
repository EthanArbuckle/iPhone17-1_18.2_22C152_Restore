@interface AMSDPushHandler
- (id)enabledParsables;
@end

@implementation AMSDPushHandler

- (id)enabledParsables
{
  v23[0] = @"24";
  v24[0] = objc_opt_class();
  v23[1] = @"26";
  v24[1] = objc_opt_class();
  v23[2] = AMSPushActionTypeFetchDataCache;
  v24[2] = objc_opt_class();
  v23[3] = AMSPushActionTypeDismissQRDialog;
  v24[3] = objc_opt_class();
  v3 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
  id v4 = [v3 mutableCopy];

  [v4 setObject:objc_opt_class() forKeyedSubscript:@"27"];
  v5 = [(AMSDPushHandler *)self configuration];
  v6 = [v5 enabledActionTypes];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          if ([v4 objectForKeyedSubscript:v13]) {
            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(v4, "objectForKeyedSubscript:", v13), v13);
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
  }
  else
  {
    id v7 = [v4 mutableCopy];
  }
  v17.receiver = self;
  v17.super_class = (Class)AMSDPushHandler;
  v14 = [(AMSDPushHandler *)&v17 enabledParsables];
  v15 = objc_msgSend(v14, "ams_dictionaryByAddingEntriesFromDictionary:", v7);

  return v15;
}

@end