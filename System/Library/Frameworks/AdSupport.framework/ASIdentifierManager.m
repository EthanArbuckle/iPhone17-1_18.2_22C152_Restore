@interface ASIdentifierManager
+ (ASIdentifierManager)sharedManager;
- (BOOL)isAdvertisingTrackingEnabled;
- (BOOL)isUserOptedIn;
- (NSUUID)advertisingIdentifier;
@end

@implementation ASIdentifierManager

+ (ASIdentifierManager)sharedManager
{
  v2 = objc_alloc_init(ASIdentifierManager);

  return v2;
}

- (BOOL)isAdvertisingTrackingEnabled
{
  v3 = [MEMORY[0x263EFF910] date];
  v4 = (void *)[objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.AdSupport"];
  v5 = [v4 objectForKey:@"LastRegionalEnforcementCheck"];
  v6 = [v4 objectForKey:@"ShouldEnforceATP"];
  if (v6) {
    int v7 = [v4 BOOLForKey:@"ShouldEnforceATP"] ^ 1;
  }
  else {
    int v7 = 0;
  }

  if (!v5 || ([v3 timeIntervalSinceDate:v5], v8 > 300.0))
  {
    [v4 setObject:v3 forKey:@"LastRegionalEnforcementCheck"];
    [v4 synchronize];
    v9 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __51__ASIdentifierManager_isAdvertisingTrackingEnabled__block_invoke;
    block[3] = &unk_2645E7A18;
    id v13 = v4;
    dispatch_async(v9, block);
  }
  if (v7) {
    BOOL v10 = [(ASIdentifierManager *)self isUserOptedIn];
  }
  else {
    BOOL v10 = 0;
  }

  return v10;
}

- (NSUUID)advertisingIdentifier
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 isBoolSettingLockedDownByRestrictions:*MEMORY[0x263F53940]];

  if (v3
    || ([MEMORY[0x263F841B0] sharedManager],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 isSharedIPad],
        v4,
        v5))
  {
    v6 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:@"00000000-0000-0000-0000-000000000000"];
  }
  else
  {
    int v7 = [MEMORY[0x263F01880] defaultWorkspace];
    v6 = [v7 deviceIdentifierForAdvertising];
  }

  return (NSUUID *)v6;
}

uint64_t __51__ASIdentifierManager_isAdvertisingTrackingEnabled__block_invoke(uint64_t a1)
{
  uint64_t v3 = 0;
  objc_msgSend(*(id *)(a1 + 32), "setBool:forKey:", objc_msgSend(MEMORY[0x263EFC090], "shouldEnforceTrackingWithReasonCode:", &v3), @"ShouldEnforceATP");
  return [*(id *)(a1 + 32) synchronize];
}

- (BOOL)isUserOptedIn
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  int v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x263F53920]];

  v4 = [MEMORY[0x263F53C50] sharedConnection];
  int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x263F53940]];

  return v3 == 1 && v5 != 1;
}

@end