@interface PHAlertHandleConfiguration
+ (id)carPlayAlertActivationOptionsWithReason:(id)a3;
+ (id)carPlayAlertConfiguration;
@end

@implementation PHAlertHandleConfiguration

+ (id)carPlayAlertConfiguration
{
  id v2 = objc_alloc((Class)SBSRemoteAlertConfiguration);
  id v3 = [v2 initWithServiceName:TUBundleIdentifierInCallServiceApplication viewControllerClassName:@"PHCarPlayInCallViewController"];
  [v3 setForCarPlay:1];
  [v3 setImpersonatedCarPlayAppIdentifier:TUBundleIdentifierMobilePhoneApplication];

  return v3;
}

+ (id)carPlayAlertActivationOptionsWithReason:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)SBSRemoteAlertActivationOptions);
  [v4 setReason:v3];

  return v4;
}

@end