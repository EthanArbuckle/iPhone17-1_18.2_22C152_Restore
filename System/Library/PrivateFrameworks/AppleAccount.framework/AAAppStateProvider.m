@interface AAAppStateProvider
+ (id)appStateForBundleID:(id)a3;
@end

@implementation AAAppStateProvider

+ (id)appStateForBundleID:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v10 = 0;
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F223C8]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
    uint64_t v5 = (uint64_t)v4;
    if (v4)
    {
      v6 = [v4 applicationState];
      uint64_t v7 = [v6 isRestricted];

      uint64_t v5 = 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v5 = 0;
  }
  v8 = [[AAAppState alloc] initWithInstalled:v5 isRestricted:v7];

  return v8;
}

@end