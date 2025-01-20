@interface IXSInstallProgressServer
- (void)_setIsPaused:(BOOL)a3 forIdentity:(id)a4;
- (void)progressServer:(id)a3 requestCancelForIdentity:(id)a4 withReason:(id)a5 fromClient:(unint64_t)a6;
- (void)progressServer:(id)a3 requestPauseForIdentity:(id)a4;
- (void)progressServer:(id)a3 requestResumeForIdentity:(id)a4;
@end

@implementation IXSInstallProgressServer

- (void)_setIsPaused:(BOOL)a3 forIdentity:(id)a4
{
  BOOL v4 = a3;
  id v5 = a4;
  v6 = [v5 personaUniqueString];
  v7 = [IXApplicationIdentity alloc];
  v8 = [v5 bundleIdentifier];

  if (v6) {
    v9 = [(IXApplicationIdentity *)v7 initWithBundleID:v8 persona:v6];
  }
  else {
    v9 = [(IXApplicationIdentity *)v7 initWithBundleIdentifier:v8];
  }
  v10 = v9;

  v11 = +[IXSCoordinatorManager sharedInstance];
  v12 = [v11 coordinatorForIdentity:v10];

  if (v12)
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003D2C0;
    v14[3] = &unk_1000EA358;
    BOOL v15 = v4;
    [v12 externalSetIsPaused:v4 completion:v14];
  }
  else
  {
    v13 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v17 = "-[IXSInstallProgressServer _setIsPaused:forIdentity:]";
      __int16 v18 = 2112;
      v19 = v10;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch the coordinator for %@", buf, 0x16u);
    }
  }
}

- (void)progressServer:(id)a3 requestPauseForIdentity:(id)a4
{
}

- (void)progressServer:(id)a3 requestResumeForIdentity:(id)a4
{
}

- (void)progressServer:(id)a3 requestCancelForIdentity:(id)a4 withReason:(id)a5 fromClient:(unint64_t)a6
{
  id v8 = a5;
  id v9 = a4;
  v10 = [v9 personaUniqueString];
  v11 = [IXApplicationIdentity alloc];
  v12 = [v9 bundleIdentifier];

  if (v10) {
    v13 = [(IXApplicationIdentity *)v11 initWithBundleID:v12 persona:v10];
  }
  else {
    v13 = [(IXApplicationIdentity *)v11 initWithBundleIdentifier:v12];
  }
  v14 = v13;

  BOOL v15 = +[IXSCoordinatorManager sharedInstance];
  v16 = [v15 coordinatorForIdentity:v14];

  if (v16)
  {
    [v16 cancelForReason:v8 client:a6 error:0];
  }
  else
  {
    v17 = sub_100004B28((uint64_t)off_100109BB8);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315394;
      v19 = "-[IXSInstallProgressServer progressServer:requestCancelForIdentity:withReason:fromClient:]";
      __int16 v20 = 2112;
      v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s: Failed to fetch the coordinator for %@", (uint8_t *)&v18, 0x16u);
    }
  }
}

@end