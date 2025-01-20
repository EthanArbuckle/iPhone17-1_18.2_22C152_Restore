@interface InstallCoordinationUninstaller
- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5;
@end

@implementation InstallCoordinationUninstaller

- (void)uninstallApp:(id)a3 requestUserConfirmation:(BOOL)a4 withResultHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = [v7 bundleID];
  if (v9)
  {
    v10 = [v7 bundleID];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10026FB40;
    v14[3] = &unk_100521898;
    id v15 = v8;
    +[IXAppInstallCoordinator uninstallAppWithBundleID:v10 requestUserConfirmation:v6 completion:v14];

    v11 = v15;
  }
  else
  {
    uint64_t v12 = ASDErrorDomain;
    NSErrorUserInfoKey v16 = NSDebugDescriptionErrorKey;
    CFStringRef v17 = @"No bundle ID was specified";
    v11 = +[NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    v13 = +[NSError errorWithDomain:v12 code:650 userInfo:v11];
    (*((void (**)(id, void *))v8 + 2))(v8, v13);
  }
}

@end