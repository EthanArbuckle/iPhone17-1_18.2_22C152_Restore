@interface SSUSystemState
- (SSUCacheDirectoryProvider)cacheDirectoryProvider;
- (SSUInstalledAppProvider)installedAppProvider;
- (SSUSystemState)initWithCacheDirectoryProvider:(id)a3 installedAppProvider:(id)a4;
@end

@implementation SSUSystemState

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedAppProvider, 0);
  objc_storeStrong((id *)&self->_cacheDirectoryProvider, 0);
}

- (SSUInstalledAppProvider)installedAppProvider
{
  return self->_installedAppProvider;
}

- (SSUCacheDirectoryProvider)cacheDirectoryProvider
{
  return self->_cacheDirectoryProvider;
}

- (SSUSystemState)initWithCacheDirectoryProvider:(id)a3 installedAppProvider:(id)a4
{
  v6 = (SSUCacheDirectoryProvider *)a3;
  v7 = (SSUInstalledAppProvider *)a4;
  v13.receiver = self;
  v13.super_class = (Class)SSUSystemState;
  v8 = [(SSUSystemState *)&v13 init];
  cacheDirectoryProvider = v8->_cacheDirectoryProvider;
  v8->_cacheDirectoryProvider = v6;
  v10 = v6;

  installedAppProvider = v8->_installedAppProvider;
  v8->_installedAppProvider = v7;

  return v8;
}

@end