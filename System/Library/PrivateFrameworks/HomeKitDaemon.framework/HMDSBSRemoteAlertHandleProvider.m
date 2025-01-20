@interface HMDSBSRemoteAlertHandleProvider
- (id)createRemoteAlertHandleWithServiceName:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5;
@end

@implementation HMDSBSRemoteAlertHandleProvider

- (id)createRemoteAlertHandleWithServiceName:(id)a3 viewControllerClassName:(id)a4 userInfo:(id)a5
{
  v7 = (objc_class *)MEMORY[0x263F79410];
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v7 alloc] initWithServiceName:v10 viewControllerClassName:v9];

  id v12 = objc_alloc_init(MEMORY[0x263F79408]);
  [v12 setUserInfo:v8];

  v13 = (void *)[MEMORY[0x263F79428] newHandleWithDefinition:v11 configurationContext:v12];
  return v13;
}

@end