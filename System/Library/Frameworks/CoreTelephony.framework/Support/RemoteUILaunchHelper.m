@interface RemoteUILaunchHelper
+ (id)launchRemoteUI:(id)a3 viewController:(id)a4 reason:(id)a5 userInfo:(id)a6 observer:(id)a7;
@end

@implementation RemoteUILaunchHelper

+ (id)launchRemoteUI:(id)a3 viewController:(id)a4 reason:(id)a5 userInfo:(id)a6 observer:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [objc_alloc((Class)SBSRemoteAlertDefinition) initWithServiceName:v11 viewControllerClassName:v12];
  id v17 = objc_alloc_init((Class)SBSRemoteAlertConfigurationContext);
  [v17 setUserInfo:v14];
  id v18 = +[SBSRemoteAlertHandle newHandleWithDefinition:v16 configurationContext:v17];
  v19 = v18;
  if (v15) {
    [v18 registerObserver:v15];
  }
  id v20 = objc_alloc_init((Class)SBSRemoteAlertActivationContext);
  [v20 setReason:v13];
  [v19 activateWithContext:v20];

  return v19;
}

@end