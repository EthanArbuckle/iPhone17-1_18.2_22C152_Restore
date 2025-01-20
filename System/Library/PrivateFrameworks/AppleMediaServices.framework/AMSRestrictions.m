@interface AMSRestrictions
+ (BOOL)allowAccountModifications;
+ (BOOL)allowActiveAccountModifications;
+ (BOOL)eroticaAllowed;
+ (BOOL)explicitContentAllowed;
+ (BOOL)inAppPurchaseAllowed;
+ (BOOL)isParentalControlEnabled;
+ (BOOL)onDeviceDiagnosticsAllowed;
+ (BOOL)requirePasswordImmediately;
+ (id)_featureNameForMediaType:(unint64_t)a3;
+ (id)rankForMediaType:(unint64_t)a3;
+ (int64_t)explicitContentSettingForBundleID:(id)a3;
+ (int64_t)maximumMediaRank;
@end

@implementation AMSRestrictions

+ (BOOL)onDeviceDiagnosticsAllowed
{
  v2 = [MEMORY[0x1E4F74230] sharedConnection];
  char v3 = [v2 isDiagnosticSubmissionAllowed];

  return v3;
}

+ (BOOL)allowAccountModifications
{
  int v2 = [a1 allowActiveAccountModifications];
  if (v2) {
    LOBYTE(v2) = !+[AMSDevice isRunningInStoreDemoMode];
  }
  return v2;
}

+ (BOOL)allowActiveAccountModifications
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73ED0]] != 2;

  return v3;
}

+ (BOOL)eroticaAllowed
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73F78]] != 2;

  return v3;
}

+ (BOOL)explicitContentAllowed
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F73FE8]] != 2;

  return v3;
}

+ (BOOL)inAppPurchaseAllowed
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74098]] != 2;

  return v3;
}

+ (BOOL)isParentalControlEnabled
{
  return CFPreferencesGetAppBooleanValue(@"SBParentalControlsEnabled", @"com.apple.springboard", 0) != 0;
}

+ (int64_t)maximumMediaRank
{
  return 1000;
}

+ (BOOL)requirePasswordImmediately
{
  int v2 = [MEMORY[0x1E4F74230] sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:*MEMORY[0x1E4F74080]] == 1;

  return v3;
}

+ (int64_t)explicitContentSettingForBundleID:(id)a3
{
  BOOL v3 = [a3 lowercaseString];
  if (([v3 isEqualToString:@"com.apple.music"] & 1) != 0
    || ([v3 isEqualToString:@"com.apple.news"] & 1) != 0
    || [v3 isEqualToString:@"com.apple.podcasts"])
  {
    BOOL v4 = +[AMSRestrictions explicitContentAllowed];
  }
  else
  {
    if (![v3 isEqualToString:@"com.apple.ibooks"])
    {
      int64_t v5 = -1;
      goto LABEL_6;
    }
    BOOL v4 = +[AMSRestrictions eroticaAllowed];
  }
  int64_t v5 = v4;
LABEL_6:

  return v5;
}

+ (id)rankForMediaType:(unint64_t)a3
{
  BOOL v4 = [a1 _featureNameForMediaType:a3];
  if (!v4
    || ([MEMORY[0x1E4F74230] sharedConnection],
        int64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 effectiveValueForSetting:v4],
        v6 = objc_claimAutoreleasedReturnValue(),
        v5,
        !v6))
  {
    v6 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", objc_msgSend(a1, "maximumMediaRank"));
  }

  return v6;
}

+ (id)_featureNameForMediaType:(unint64_t)a3
{
  if (a3 > 2)
  {
    id v4 = 0;
  }
  else
  {
    id v4 = **((id **)&unk_1E55A6300 + a3);
  }
  return v4;
}

@end