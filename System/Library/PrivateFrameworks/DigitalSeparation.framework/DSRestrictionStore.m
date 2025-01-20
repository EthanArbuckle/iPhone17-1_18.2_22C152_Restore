@interface DSRestrictionStore
+ (BOOL)hasRestriction;
+ (BOOL)isAppRemovalRestricted;
+ (BOOL)isFingerprintModificationRestricted;
+ (BOOL)isPasscodeModificationRestricted;
+ (BOOL)isPermissionRestricted:(id)a3;
+ (BOOL)isPrivateRelayRestricted;
+ (BOOL)isSourceRestricted:(id)a3;
+ (void)initialize;
@end

@implementation DSRestrictionStore

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    DSLog_1 = (uint64_t)os_log_create("com.apple.DigitalSeparation", "DSRestrictionStore");
    MEMORY[0x270F9A758]();
  }
}

+ (BOOL)isAppRemovalRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isAppRemovalAllowed] ^ 1;

  return v3;
}

+ (BOOL)isPermissionRestricted:(id)a3
{
  char v3 = (__CFString *)a3;
  v4 = (void *)CFPreferencesCopyAppValue(@"SBParentalControlsCapabilities", @"com.apple.springboard");
  if (([(__CFString *)v3 isEqualToString:@"DSLocationAlways"] & 1) != 0
    || [(__CFString *)v3 isEqualToString:@"DSLocationWhenInUse"])
  {
    v5 = @"location";
  }
  else
  {
    if (![(__CFString *)v3 isEqualToString:@"DSContacts"])
    {
      v6 = v4;
      v5 = v3;
      goto LABEL_5;
    }
    v5 = (__CFString *)*MEMORY[0x263F7C4F8];
  }
  v6 = v4;
LABEL_5:
  char v7 = [v6 containsObject:v5];

  return v7;
}

+ (BOOL)isSourceRestricted:(id)a3
{
  char v3 = (__CFString *)a3;
  if (@"com.apple.DigitalSeparation.Photos" == v3
    && ([MEMORY[0x263F53C50] sharedConnection],
        v4 = objc_claimAutoreleasedReturnValue(),
        int v5 = [v4 effectiveBoolValueForSetting:*MEMORY[0x263F53A50]],
        v4,
        v5 == 2))
  {
    BOOL v6 = 1;
  }
  else if (@"com.apple.DigitalSeparation.FindMy" == v3)
  {
    char v7 = [MEMORY[0x263F53C50] sharedConnection];
    if ([v7 effectiveBoolValueForSetting:*MEMORY[0x263F538C8]] == 2)
    {
      BOOL v6 = 1;
    }
    else
    {
      v8 = [MEMORY[0x263F53C50] sharedConnection];
      BOOL v6 = [v8 effectiveBoolValueForSetting:*MEMORY[0x263F538D0]] == 2;
    }
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (BOOL)isPasscodeModificationRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isPasscodeModificationAllowed] ^ 1;

  return v3;
}

+ (BOOL)isFingerprintModificationRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isFingerprintModificationAllowed] ^ 1;

  return v3;
}

+ (BOOL)isPrivateRelayRestricted
{
  v2 = [MEMORY[0x263F53C50] sharedConnection];
  char v3 = [v2 isCloudPrivateRelayAllowed] ^ 1;

  return v3;
}

+ (BOOL)hasRestriction
{
  if (([a1 isSourceRestricted:@"com.apple.DigitalSeparation.FindMy"] & 1) != 0
    || +[DSRestrictionStore isSourceRestricted:](DSRestrictionStore, "isSourceRestricted:", @"com.apple.DigitalSeparation.Photos")|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", @"location")|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C4F8])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C508])|| +[DSRestrictionStore isPermissionRestricted:*MEMORY[0x263F7C5C8]]
    || +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C5B8])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C500])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C598])|| +[DSRestrictionStore isPermissionRestricted:](DSRestrictionStore, "isPermissionRestricted:", *MEMORY[0x263F7C590])|| +[DSRestrictionStore isPasscodeModificationRestricted](DSRestrictionStore, "isPasscodeModificationRestricted")|| +[DSRestrictionStore isFingerprintModificationRestricted](
         DSRestrictionStore,
         "isFingerprintModificationRestricted")
    || +[DSRestrictionStore isAppRemovalRestricted])
  {
    return 1;
  }
  return +[DSRestrictionStore isPrivateRelayRestricted];
}

@end