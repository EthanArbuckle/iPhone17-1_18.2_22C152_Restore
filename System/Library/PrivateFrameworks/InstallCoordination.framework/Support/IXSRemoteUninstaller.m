@interface IXSRemoteUninstaller
+ (BOOL)isUninstallProhibited;
- (IXSRemoteUninstaller)initWithBundleID:(id)a3;
- (IXSRemoteUninstallerDelegate)delegate;
- (NSString)bundleID;
- (unsigned)remoteAction;
- (void)beginUninstall;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IXSRemoteUninstaller

- (IXSRemoteUninstaller)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IXSRemoteUninstaller;
  v5 = [(IXSRemoteUninstaller *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IXSRemoteUninstaller *)v5 setBundleID:v4];
  }

  return v6;
}

- (void)beginUninstall
{
  if ([(id)objc_opt_class() isUninstallProhibited])
  {
    v3 = [(IXSRemoteUninstaller *)self delegate];
    if (v3)
    {
      id v13 = v3;
      id v4 = [(IXSRemoteUninstaller *)self bundleID];
      v6 = sub_100008A20((uint64_t)"-[IXSRemoteUninstaller beginUninstall]", 77, @"IXRemoteErrorDomain", 10, 0, 0, @"Cannot uninstall %@ because it's prohibited by ManagedConfiguration", v5, (uint64_t)v4);

      [v13 remoteUninstaller:self completedWithError:v6];
      v3 = v13;
    }
  }
  else
  {
    v7 = +[UMUserManager sharedManager];
    unsigned int v8 = [v7 isMultiUser];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000129D8;
    v16[3] = &unk_100020AC0;
    v16[4] = self;
    char v18 = v8;
    id v9 = v7;
    id v17 = v9;
    v10 = objc_retainBlock(v16);
    v11 = v10;
    if (v8)
    {
      v12 = sub_10000E748((uint64_t)off_100026DB0);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100015730(self, v12);
      }

      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100012C0C;
      v14[3] = &unk_100020918;
      id v15 = v11;
      [v9 terminateSyncWithCompletionHandler:v14];
    }
    else
    {
      ((void (*)(void *))v10[2])(v10);
    }
  }
}

- (unsigned)remoteAction
{
  return 3;
}

+ (BOOL)isUninstallProhibited
{
  v2 = +[MCProfileConnection sharedConnection];
  BOOL v3 = [v2 effectiveBoolValueForSetting:MCFeatureAppRemovalAllowed] == 2;

  return v3;
}

- (IXSRemoteUninstallerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXSRemoteUninstallerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleID, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end