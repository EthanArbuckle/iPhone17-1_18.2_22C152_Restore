@interface IXSRemoteReverter
- (IXSRemoteReverter)initWithBundleID:(id)a3;
- (IXSRemoteReverterDelegate)delegate;
- (NSString)bundleID;
- (unsigned)remoteAction;
- (void)beginRevert;
- (void)setBundleID:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation IXSRemoteReverter

- (IXSRemoteReverter)initWithBundleID:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)IXSRemoteReverter;
  v5 = [(IXSRemoteReverter *)&v8 init];
  v6 = v5;
  if (v5) {
    [(IXSRemoteReverter *)v5 setBundleID:v4];
  }

  return v6;
}

- (void)beginRevert
{
  [(IXSRemoteReverter *)self bundleID];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000D2C8;
  v4[3] = &unk_100020820;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = self;
  id v3 = v5;
  +[IXAppInstallCoordinator revertAppWithBundleID:v3 completionWithApplicationRecord:v4];
}

- (unsigned)remoteAction
{
  return 2;
}

- (IXSRemoteReverterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (IXSRemoteReverterDelegate *)WeakRetained;
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