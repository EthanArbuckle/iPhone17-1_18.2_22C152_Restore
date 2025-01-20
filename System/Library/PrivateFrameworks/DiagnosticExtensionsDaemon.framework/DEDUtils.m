@interface DEDUtils
+ (BOOL)isDataClassBAvailable;
+ (BOOL)isDebugRequestsEnabled;
+ (BOOL)isInternalInstall;
+ (id)checkDefaultsForOverride:(id)a3;
+ (id)deriveMacDeviceClassForProductType:(id)a3;
+ (id)deviceClass;
+ (id)deviceClassForProductType:(id)a3;
+ (id)deviceColor;
+ (id)deviceEnclosureColor;
+ (id)deviceHardwareCodename;
+ (id)deviceModel;
+ (id)deviceName;
+ (id)deviceProductType;
+ (id)deviceSerialNumber;
+ (id)deviceUniformTypeIdentifier;
+ (id)modelForProductType:(id)a3;
+ (id)osBuild;
+ (id)platform;
+ (id)sharedLog;
+ (id)uniqueDeviceSpecifier;
+ (int)deviceHomeButtonType;
@end

@implementation DEDUtils

+ (id)deviceClassForProductType:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = @"AppleTV";
    if (([v4 containsString:@"AppleTV"] & 1) == 0)
    {
      v6 = @"iPhone";
      if (([v5 containsString:@"iPhone"] & 1) == 0)
      {
        v6 = @"iPad";
        if (([v5 containsString:@"iPad"] & 1) == 0)
        {
          v6 = @"Watch";
          if (([v5 containsString:@"Watch"] & 1) == 0)
          {
            if ([v5 containsString:@"AudioAccessory"])
            {
              v6 = @"HomePod";
            }
            else if ([v5 containsString:@"Mac"])
            {
              v6 = [a1 deriveMacDeviceClassForProductType:v5];
            }
            else
            {
              v8 = +[DEDUtils sharedLog];
              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                int v10 = 138543362;
                v11 = v5;
                _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_INFO, "No deviceClass for product [%{public}@]", (uint8_t *)&v10, 0xCu);
              }

              v6 = &stru_26D197018;
            }
          }
        }
      }
    }
    v7 = v6;
  }
  else
  {
    v7 = &stru_26D197018;
  }

  return v7;
}

+ (id)deriveMacDeviceClassForProductType:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263F1D920] _typeWithDeviceModelCode:a3];
  id v4 = [v3 identifier];
  v5 = [v4 stringByReplacingOccurrencesOfString:@"com.apple." withString:&stru_26D197018];
  v6 = [v5 lowercaseString];

  if ([v6 containsString:@"macbookpro"])
  {
    v7 = @"MacBookPro";
  }
  else if ([v6 containsString:@"macbookair"])
  {
    v7 = @"MacBookAir";
  }
  else if ([v6 containsString:@"macbook"])
  {
    v7 = @"MacBook";
  }
  else if ([v6 containsString:@"imac"])
  {
    v7 = @"iMac";
  }
  else if ([v6 containsString:@"macmini"])
  {
    v7 = @"Macmini";
  }
  else if ([v6 containsString:@"macpro"])
  {
    v7 = @"MacPro";
  }
  else if ([v6 containsString:@"macstudio"])
  {
    v7 = @"MacStudio";
  }
  else
  {
    v8 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      v11 = v6;
      _os_log_impl(&dword_21FE04000, v8, OS_LOG_TYPE_DEFAULT, "No Mac product mapping for [%{public}@]", (uint8_t *)&v10, 0xCu);
    }

    v7 = &stru_26D197018;
  }

  return v7;
}

+ (id)modelForProductType:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_21;
  }
  if ([v3 containsString:@"AppleTV"])
  {
    v5 = @"Apple TV";
    goto LABEL_22;
  }
  v5 = @"iPhone";
  if (([v4 containsString:@"iPhone"] & 1) == 0)
  {
    v5 = @"iPad";
    if (([v4 containsString:@"iPad"] & 1) == 0)
    {
      v5 = @"Watch";
      if (([v4 containsString:@"Watch"] & 1) == 0)
      {
        if ([v4 containsString:@"AudioAccessory"])
        {
          v5 = @"HomePod";
          goto LABEL_22;
        }
        if ([v4 containsString:@"MacBookPro"])
        {
          v5 = @"MacBook Pro";
          goto LABEL_22;
        }
        if ([v4 containsString:@"MacBookAir"])
        {
          v5 = @"MacBook Air";
          goto LABEL_22;
        }
        v5 = @"MacBook";
        if (([v4 containsString:@"MacBook"] & 1) == 0)
        {
          v5 = @"iMac";
          if (([v4 containsString:@"iMac"] & 1) == 0)
          {
            if ([v4 containsString:@"Macmini"])
            {
              v5 = @"Mac mini";
              goto LABEL_22;
            }
            v5 = @"MacPro";
            if ([v4 containsString:@"MacPro"]) {
              goto LABEL_22;
            }
            v6 = +[DEDUtils sharedLog];
            if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
              +[DEDUtils modelForProductType:]((uint64_t)v4, v6);
            }

LABEL_21:
            v5 = &stru_26D197018;
          }
        }
      }
    }
  }
LABEL_22:

  return v5;
}

+ (id)sharedLog
{
  if (sharedLog_onceToken != -1) {
    dispatch_once(&sharedLog_onceToken, &__block_literal_global_139_0);
  }
  v2 = (void *)sharedLog_handle;
  return v2;
}

void __21__DEDUtils_sharedLog__block_invoke()
{
  id v2 = +[DEDConfiguration sharedInstance];
  os_log_t v0 = os_log_create((const char *)[v2 loggingSubsystem], "fmw");
  v1 = (void *)sharedLog_handle;
  sharedLog_handle = (uint64_t)v0;
}

+ (id)deviceColor
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceColor"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MGCopyAnswer();
  }
  v5 = v4;

  return v5;
}

+ (id)deviceClass
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceClass"];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    if (DEDCurrentDeviceIsHomePod())
    {
      v5 = @"HomePod";
      goto LABEL_7;
    }
    id v4 = (__CFString *)MGCopyAnswer();
  }
  v5 = v4;
LABEL_7:

  return v5;
}

+ (id)deviceEnclosureColor
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceEnclosureColor"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MGCopyAnswer();
  }
  v5 = v4;

  return v5;
}

+ (id)platform
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDevicePlatform"];
  id v3 = v2;
  if (!v2)
  {
    if (DEDCurrentDeviceIsHomePod()) {
      id v4 = DEDDevicePlatformHomePod;
    }
    else {
      id v4 = DEDDevicePlatformiOS;
    }
    id v3 = *v4;
  }
  v5 = v3;

  return v5;
}

+ (id)uniqueDeviceSpecifier
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceSpecifier"];
  if (!v2) {
    id v2 = (void *)MGCopyAnswer();
  }
  id v3 = v2;

  return v3;
}

+ (id)deviceProductType
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceProductType"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MGCopyAnswer();
  }
  v5 = v4;

  return v5;
}

+ (id)deviceModel
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceModel"];
  if (!v2) {
    id v2 = (void *)MGCopyAnswer();
  }
  id v3 = v2;

  return v3;
}

+ (id)deviceName
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceName"];
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }
  else {
    id v4 = (id)MGCopyAnswer();
  }
  v5 = v4;

  return v5;
}

+ (id)osBuild
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceOSBuild"];
  id v3 = v2;
  if (!v2)
  {
    id v2 = (__CFString *)MGCopyAnswer();
    id v3 = v2;
    if (!v2) {
      id v2 = @"Unknown";
    }
  }
  id v4 = v2;

  return v4;
}

+ (id)deviceHardwareCodename
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceHardwareCodename"];
  if (!v2)
  {
    id v2 = (void *)MGCopyAnswer();
    if ([v2 hasSuffix:@"AP"])
    {
      uint64_t v3 = -2;
    }
    else
    {
      if (![v2 hasSuffix:@"dev"]) {
        goto LABEL_7;
      }
      uint64_t v3 = -3;
    }
    uint64_t v4 = objc_msgSend(v2, "substringToIndex:", objc_msgSend(v2, "length") + v3);

    id v2 = (void *)v4;
  }
LABEL_7:
  id v5 = v2;

  return v5;
}

+ (int)deviceHomeButtonType
{
  return MGGetSInt32Answer();
}

+ (id)deviceSerialNumber
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceSerialNumber"];
  if (!v2) {
    id v2 = (void *)MGCopyAnswer();
  }
  id v3 = v2;

  return v3;
}

+ (id)deviceUniformTypeIdentifier
{
  id v2 = +[DEDUtils checkDefaultsForOverride:@"overrideDeviceUniformTypeIdentifier"];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v5 = [MEMORY[0x263F1D920] _typeOfCurrentDevice];
    id v4 = [v5 identifier];
  }
  return v4;
}

+ (BOOL)isInternalInstall
{
  if (isInternalInstall_onceToken != -1) {
    dispatch_once(&isInternalInstall_onceToken, &__block_literal_global_220);
  }
  return isInternalInstall__isInternal;
}

void __29__DEDUtils_isInternalInstall__block_invoke()
{
  os_log_t v0 = [MEMORY[0x263F086E0] mainBundle];
  id v1 = [v0 bundleIdentifier];
  [v1 cStringUsingEncoding:4];
  isInternalInstall__isInternal = os_variant_has_internal_ui();

  if (isInternalInstall__isInternal)
  {
    id v2 = +[DEDUtils sharedLog];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_21FE04000, v2, OS_LOG_TYPE_DEFAULT, "DED internal install", v3, 2u);
    }
  }
}

+ (BOOL)isDebugRequestsEnabled
{
  int v2 = [a1 isInternalInstall];
  if (v2)
  {
    id v3 = [MEMORY[0x263EFFA40] standardUserDefaults];
    char v4 = [v3 BOOLForKey:@"showDebugRequests"];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isDataClassBAvailable
{
  int v2 = MKBGetDeviceLockState();
  return !v2 || v2 == 3;
}

+ (id)checkDefaultsForOverride:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!+[DEDUtils isInternalInstall]) {
    goto LABEL_5;
  }
  char v4 = [MEMORY[0x263EFFA40] standardUserDefaults];
  id v5 = [v4 stringForKey:v3];

  if (!v5 || ([v5 isEqualToString:&stru_26D197018] & 1) != 0)
  {

LABEL_5:
    id v5 = 0;
    goto LABEL_6;
  }
  v7 = +[DEDUtils sharedLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_21FE04000, v7, OS_LOG_TYPE_DEFAULT, "DED overriding platform value for %@", (uint8_t *)&v8, 0xCu);
  }

LABEL_6:
  return v5;
}

+ (void)modelForProductType:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21FE04000, a2, OS_LOG_TYPE_ERROR, "No model for product [%{public}@]", (uint8_t *)&v2, 0xCu);
}

@end