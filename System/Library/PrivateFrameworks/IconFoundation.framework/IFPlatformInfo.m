@interface IFPlatformInfo
+ (id)sharedInstance;
- (unint64_t)nativePlatform;
- (unint64_t)platformFromPlatformStrings:(id)a3;
@end

@implementation IFPlatformInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, &__block_literal_global_9);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;

  return v2;
}

uint64_t __32__IFPlatformInfo_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(IFPlatformInfo);

  return MEMORY[0x1F41817F8]();
}

- (unint64_t)nativePlatform
{
  return 4;
}

- (unint64_t)platformFromPlatformStrings:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "compare:", @"MacOSX", (void)v13))
        {
          if ([v10 compare:@"iPhoneOS"])
          {
            if ([v10 compare:@"WatchOS"])
            {
              if ([v10 compare:@"XROS"]) {
                uint64_t v11 = 32 * ([v10 compare:@"AppleTVOS"] == 0);
              }
              else {
                uint64_t v11 = 16;
              }
            }
            else
            {
              uint64_t v11 = 8;
            }
          }
          else
          {
            uint64_t v11 = 4;
          }
        }
        else
        {
          uint64_t v11 = 1;
        }
        if (v11 == [(IFPlatformInfo *)self nativePlatform])
        {
          unint64_t v7 = v11;
          goto LABEL_23;
        }
        if (!v7) {
          unint64_t v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  else
  {
    unint64_t v7 = 0;
  }
LABEL_23:

  return v7;
}

@end