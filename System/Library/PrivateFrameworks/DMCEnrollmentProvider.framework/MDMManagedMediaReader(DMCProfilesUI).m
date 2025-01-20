@interface MDMManagedMediaReader(DMCProfilesUI)
+ (id)managedAppsUninstalledOnMDMRemoval;
@end

@implementation MDMManagedMediaReader(DMCProfilesUI)

+ (id)managedAppsUninstalledOnMDMRemoval
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v0 = objc_opt_new();
  v1 = [MEMORY[0x263F01880] defaultWorkspace];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = objc_msgSend(MEMORY[0x263F52840], "managedAppIDsWithFlags:excludeDDMApps:", 1, 1, 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        if ([v1 applicationIsInstalled:v7]) {
          [v0 addObject:v7];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }

  v8 = objc_opt_new();
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v0, "count"));
  [v8 setObject:v9 forKeyedSubscript:@"MDMManagedMediaCountKey"];

  if ([v0 count] == 1)
  {
    v10 = [DMCApplicationProxy alloc];
    v11 = [v0 firstObject];
    v12 = [(DMCApplicationProxy *)v10 initWithBundleID:v11 dataSource:0];

    v13 = [(DMCApplicationProxy *)v12 name];
    [v8 setObject:v13 forKeyedSubscript:@"MDMManagedMediaNameKey"];
  }
  return v8;
}

@end