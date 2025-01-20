@interface PRSettingsProvider
+ (BOOL)getAlwaysPlaySoundForBundleID:(id)a3;
+ (BOOL)getPINPrivacyLockForBundleID:(id)a3;
+ (BOOL)hasEntitlement:(id)a3;
+ (BOOL)isProximityReaderSupported:(id)a3;
+ (BOOL)shouldDisablePINPrivacyLockForBundleID:(id)a3;
+ (BOOL)shouldShowPINPrivacyLockForBundleID:(id)a3;
+ (void)removeMDMAppAttribute:(int64_t)a3 forBundleID:(id)a4;
+ (void)setAlwaysPlaySound:(BOOL)a3 forBundleID:(id)a4;
+ (void)setMDMAppAttribute:(int64_t)a3 withValue:(BOOL)a4 forBundleID:(id)a5;
+ (void)setPINPrivacyLock:(BOOL)a3 forBundleID:(id)a4;
@end

@implementation PRSettingsProvider

+ (BOOL)shouldShowPINPrivacyLockForBundleID:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_Prsettingsprov.isa);
  BOOL v4 = +[PRSettingsProvider isProximityReaderSupported:v3];

  return v4;
}

+ (BOOL)isProximityReaderSupported:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_Prsettingsprov_0.isa);
  if ([v3 length])
  {
    BOOL v4 = (void *)MGCopyAnswer();
    NSLog(&cfstr_Prsettingsprov_2.isa, v4);
    if ([v4 hasPrefix:@"iPhone"]
      && (unint64_t)[v4 length] >= 7)
    {
      v5 = [v4 substringFromIndex:6];
      v6 = [v5 componentsSeparatedByString:@","];
      if ([v6 count] == 2)
      {
        v7 = [v6 objectAtIndex:0];
        v8 = [v6 objectAtIndex:1];
        if ((int)[v7 intValue] > 11)
        {

          NSLog(&cfstr_Prsettingsprov_3.isa, 1);
LABEL_10:
          BOOL v9 = +[PRSettingsProvider hasEntitlement:v3];
LABEL_15:
          NSLog(&cfstr_Prsettingsprov_4.isa, v9);

          goto LABEL_16;
        }
        if ([v7 intValue] == 11)
        {
          int v10 = [v8 intValue];

          NSLog(&cfstr_Prsettingsprov_3.isa, v10 > 1);
          if (v10 > 1) {
            goto LABEL_10;
          }
LABEL_14:
          BOOL v9 = 0;
          goto LABEL_15;
        }
      }
    }
    NSLog(&cfstr_Prsettingsprov_3.isa, 0);
    goto LABEL_14;
  }
  NSLog(&cfstr_Prsettingsprov_1.isa);
  LOBYTE(v9) = 0;
LABEL_16:

  return v9;
}

+ (BOOL)hasEntitlement:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  BOOL v4 = (void *)[objc_alloc(MEMORY[0x263F01878]) initWithBundleIdentifier:v3 allowPlaceholder:1 error:&v10];
  id v5 = v10;
  v6 = v5;
  if (!v4) {
    NSLog(&cfstr_Prsettingsprov_5.isa, v3, v5);
  }
  v7 = [v4 entitlements];
  v8 = [v7 objectForKey:@"com.apple.developer.proximity-reader.payment.acceptance" ofClass:objc_opt_class()];

  LOBYTE(v7) = [v8 BOOLValue];
  return (char)v7;
}

+ (BOOL)shouldDisablePINPrivacyLockForBundleID:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_Prsettingsprov_6.isa);
  if ([v3 length])
  {
    BOOL v4 = [NSString stringWithFormat:@"%@-%@", @"PRMDMAttrPrivacyLock", v3];
    id v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.merchantd");
    v6 = v5;
    if (v5)
    {
      NSLog(&cfstr_Prsettingsprov_9.isa, [v5 BOOLValue]);
      char v7 = [v6 BOOLValue];
    }
    else
    {
      NSLog(&cfstr_Prsettingsprov_8.isa);
      char v7 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_7.isa);
    char v7 = 0;
  }

  return v7;
}

+ (BOOL)getPINPrivacyLockForBundleID:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_Prsettingsprov_10.isa);
  if ([v3 length])
  {
    BOOL v4 = [NSString stringWithFormat:@"%@-%@", @"PREnablePrivacyLockKey", v3];
    id v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.merchantd");
    v6 = v5;
    if (v5)
    {
      NSLog(&cfstr_Prsettingsprov_13.isa, [v5 BOOLValue]);
      char v7 = [v6 BOOLValue];
    }
    else
    {
      NSLog(&cfstr_Prsettingsprov_12.isa);
      char v7 = 0;
    }
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_11.isa);
    char v7 = 0;
  }

  return v7;
}

+ (void)setPINPrivacyLock:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  NSLog(&cfstr_Prsettingsprov_14.isa);
  if ([v9 length])
  {
    NSLog(&cfstr_Prsettingsprov_16.isa, v4);
    id v5 = [NSString stringWithFormat:@"%@-%@", @"PREnablePrivacyLockKey", v9];
    v6 = (const void *)[NSNumber numberWithBool:v4];
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(v5, v6, @"com.apple.merchantd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    CFPreferencesSynchronize(@"com.apple.merchantd", v7, v8);
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_15.isa);
  }
}

+ (void)setMDMAppAttribute:(int64_t)a3 withValue:(BOOL)a4 forBundleID:(id)a5
{
  BOOL v5 = a4;
  id v14 = a5;
  if ([v14 length])
  {
    if (a3)
    {
      NSLog(&cfstr_Prsettingsprov_21.isa);
    }
    else
    {
      NSLog(&cfstr_Prsettingsprov_18.isa, v5, v14);
      CFStringRef v7 = [NSString stringWithFormat:@"%@-%@", @"PRMDMAttrPrivacyLock", v14];
      CFStringRef v8 = (void *)CFPreferencesCopyAppValue(v7, @"com.apple.merchantd");
      id v9 = v8;
      if (!v8 || [v8 BOOLValue] != v5)
      {
        NSLog(&cfstr_Prsettingsprov_19.isa, v5, v7);
        id v10 = (const void *)[NSNumber numberWithBool:v5];
        CFStringRef v11 = (const __CFString *)*MEMORY[0x263EFFE70];
        CFStringRef v12 = (const __CFString *)*MEMORY[0x263EFFE50];
        CFPreferencesSetValue(v7, v10, @"com.apple.merchantd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
        v13 = [NSString stringWithFormat:@"%@-%@", @"PREnablePrivacyLockKey", v14];
        NSLog(&cfstr_Prsettingsprov_20.isa, v5, v13);
        CFPreferencesSetValue(v13, (CFPropertyListRef)[NSNumber numberWithBool:v5], @"com.apple.merchantd", v11, v12);
        CFPreferencesSynchronize(@"com.apple.merchantd", v11, v12);
      }
    }
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_17.isa);
  }
}

+ (void)removeMDMAppAttribute:(int64_t)a3 forBundleID:(id)a4
{
  id v10 = a4;
  if ([v10 length])
  {
    if (a3)
    {
      NSLog(&cfstr_Prsettingsprov_24.isa);
    }
    else
    {
      NSLog(&cfstr_Prsettingsprov_23.isa, v10);
      BOOL v5 = [NSString stringWithFormat:@"%@-%@", @"PRMDMAttrPrivacyLock", v10];
      v6 = (void *)CFPreferencesCopyAppValue(v5, @"com.apple.merchantd");
      CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
      CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
      CFPreferencesSetValue(v5, 0, @"com.apple.merchantd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
      if (v6 && [v6 BOOLValue])
      {
        id v9 = [NSString stringWithFormat:@"%@-%@", @"PREnablePrivacyLockKey", v10];
        CFPreferencesSetValue(v9, 0, @"com.apple.merchantd", v7, v8);
      }
      CFPreferencesSynchronize(@"com.apple.merchantd", v7, v8);
    }
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_22.isa);
  }
}

+ (BOOL)getAlwaysPlaySoundForBundleID:(id)a3
{
  id v3 = a3;
  NSLog(&cfstr_Prsettingsprov_25.isa);
  if ([v3 length])
  {
    BOOL v4 = [NSString stringWithFormat:@"%@-%@", @"PREnableAlwaysPlaySound", v3];
    BOOL v5 = (void *)CFPreferencesCopyAppValue(v4, @"com.apple.merchantd");
    v6 = v5;
    if (v5)
    {
      NSLog(&cfstr_Prsettingsprov_27.isa, [v5 BOOLValue]);
      char v7 = [v6 BOOLValue];
    }
    else
    {
      NSLog(&cfstr_Prsettingsprov_26.isa);
      char v7 = 1;
    }
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_11.isa);
    char v7 = 0;
  }

  return v7;
}

+ (void)setAlwaysPlaySound:(BOOL)a3 forBundleID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  NSLog(&cfstr_Prsettingsprov_28.isa);
  if ([v9 length])
  {
    NSLog(&cfstr_Prsettingsprov_29.isa, v4);
    BOOL v5 = [NSString stringWithFormat:@"%@-%@", @"PREnableAlwaysPlaySound", v9];
    v6 = (const void *)[NSNumber numberWithBool:v4];
    CFStringRef v7 = (const __CFString *)*MEMORY[0x263EFFE70];
    CFStringRef v8 = (const __CFString *)*MEMORY[0x263EFFE50];
    CFPreferencesSetValue(v5, v6, @"com.apple.merchantd", (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE50]);
    CFPreferencesSynchronize(@"com.apple.merchantd", v7, v8);
  }
  else
  {
    NSLog(&cfstr_Prsettingsprov_15.isa);
  }
}

@end