@interface AKCAAuthPromptReporter
+ (void)reportPromptByClient:(id)a3 withContext:(id)a4;
@end

@implementation AKCAAuthPromptReporter

+ (void)reportPromptByClient:(id)a3 withContext:(id)a4
{
  id v24 = a3;
  id v5 = a4;
  if (!getenv("__OSINSTALL_ENVIRONMENT")
    && !getenv("__AKSYNCBUBBLE")
    && ([v5 isFirstTimeLogin] & 1) == 0)
  {
    v6 = +[AKAccountManager sharedInstance];
    v7 = [v5 authKitAccount:0];
    id v8 = [v6 securityLevelForAccount:v7];

    v9 = +[NSMutableDictionary dictionary];
    uint64_t v10 = [v24 bundleID];
    v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = @"No Bundle ID";
    }
    [v9 setObject:v12 forKeyedSubscript:@"clientId"];

    uint64_t v13 = [v5 _proxiedAppBundleID];
    v14 = (void *)v13;
    if (v13) {
      CFStringRef v15 = (const __CFString *)v13;
    }
    else {
      CFStringRef v15 = @"No Proxied Client ID";
    }
    [v9 setObject:v15 forKeyedSubscript:@"proxiedClientId"];

    v16 = [v5 username];
    if (v16) {
      v17 = &__kCFBooleanTrue;
    }
    else {
      v17 = &__kCFBooleanFalse;
    }
    [v9 setObject:v17 forKeyedSubscript:@"hasUsername"];

    v18 = [v5 proxiedDevice];
    if (v18) {
      v19 = &__kCFBooleanTrue;
    }
    else {
      v19 = &__kCFBooleanFalse;
    }
    [v9 setObject:v19 forKeyedSubscript:@"proxyingForPairedDevice"];

    v20 = +[NSNumber numberWithUnsignedInteger:v8];
    [v9 setObject:v20 forKeyedSubscript:@"accountSecurityLevel"];

    v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 authenticationType]);
    [v9 setObject:v21 forKeyedSubscript:@"authenticationType"];

    v22 = [v5 reason];
    [v9 setObject:v22 forKeyedSubscript:@"authReason"];

    v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 _capabilityForUIDisplay]);
    [v9 setObject:v23 forKeyedSubscript:@"capabilityForUIDisplay"];

    if (&_AnalyticsSendEvent) {
      AnalyticsSendEvent();
    }
  }
}

@end