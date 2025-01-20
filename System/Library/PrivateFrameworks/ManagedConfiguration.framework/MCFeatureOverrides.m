@interface MCFeatureOverrides
+ (BOOL)BOOLForDefaultsKey:(id)a3;
+ (BOOL)BOOLForDefaultsKey:(id)a3 isPresent:(BOOL *)a4;
+ (BOOL)allowUnsupervisedWatchEnrollment;
+ (BOOL)allowVPNInUserEnrollment;
+ (BOOL)isAppleInternal;
+ (BOOL)isDevFused;
+ (BOOL)shouldDisablePlatformPayloadFilter;
+ (BOOL)shouldSimulatorSupportMDM;
+ (double)accountRemovalTimeoutWithDefaultValue:(double)a3;
+ (id)_numberForDefaultsKey:(id)a3 isPresent:(BOOL *)a4;
+ (int)profileEventsExpirationInterval;
+ (unint64_t)profileEventsMaxLength;
@end

@implementation MCFeatureOverrides

+ (BOOL)isDevFused
{
  return MEMORY[0x1F40CD630]("com.apple.ManagedConfiguration", a2);
}

+ (BOOL)isAppleInternal
{
  return os_variant_has_internal_ui();
}

+ (id)_numberForDefaultsKey:(id)a3 isPresent:(BOOL *)a4
{
  id v6 = a3;
  if (![a1 isAppleInternal])
  {
    v8 = 0;
    BOOL v9 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  v7 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v8 = [v7 objectForKey:v6];

  BOOL v9 = v8 != 0;
  if (v8) {
    id v10 = v8;
  }

  if (a4) {
LABEL_7:
  }
    *a4 = v9;
LABEL_8:

  return v8;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3 isPresent:(BOOL *)a4
{
  v4 = [a1 _numberForDefaultsKey:a3 isPresent:a4];
  v5 = v4;
  if (v4) {
    char v6 = [v4 BOOLValue];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

+ (BOOL)BOOLForDefaultsKey:(id)a3
{
  return [a1 BOOLForDefaultsKey:a3 isPresent:0];
}

+ (BOOL)allowVPNInUserEnrollment
{
  char v3 = [a1 isAppleInternal];
  if ([a1 isAppleInternal])
  {
    char v6 = 0;
    char v4 = [a1 BOOLForDefaultsKey:@"MCAllowFullVPNInUserEnrollments" isPresent:&v6];
    if (v6) {
      return v4;
    }
  }
  return v3;
}

+ (BOOL)allowUnsupervisedWatchEnrollment
{
  char v3 = [a1 isAppleInternal];
  if ([a1 isAppleInternal])
  {
    char v6 = 0;
    char v4 = [a1 BOOLForDefaultsKey:@"MCAllowUnsupervisedWatchEnrollment" isPresent:&v6];
    if (v6) {
      return v4;
    }
  }
  return v3;
}

+ (BOOL)shouldDisablePlatformPayloadFilter
{
  return [a1 BOOLForDefaultsKey:@"MCDisablePlatformPayloadFilter"];
}

+ (BOOL)shouldSimulatorSupportMDM
{
  return [a1 BOOLForDefaultsKey:@"MCEnableMDMOnSimulator"];
}

+ (unint64_t)profileEventsMaxLength
{
  v2 = [a1 _numberForDefaultsKey:@"MCProfileEventsMaxLength" isPresent:0];
  char v3 = v2;
  if (v2) {
    unint64_t v4 = [v2 unsignedIntValue];
  }
  else {
    unint64_t v4 = 20;
  }

  return v4;
}

+ (int)profileEventsExpirationInterval
{
  v2 = [a1 _numberForDefaultsKey:@"MCProfileEventsExpirationInterval" isPresent:0];
  char v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 1209600;
  }

  return v4;
}

+ (double)accountRemovalTimeoutWithDefaultValue:(double)a3
{
  int v4 = [a1 _numberForDefaultsKey:@"MCAccountRemovalTimeout" isPresent:0];
  v5 = v4;
  if (v4)
  {
    [v4 doubleValue];
    a3 = v6;
  }

  return a3;
}

@end