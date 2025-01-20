@interface SSUSandboxDirectories
- (NSURL)cacheDirectoryURL;
- (NSURL)installedAppsDirectoryURL;
- (void)setCacheDirectoryURL:(id)a3;
- (void)setInstalledAppsDirectoryURL:(id)a3;
@end

@implementation SSUSandboxDirectories

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheDirectoryURL, 0);
  objc_storeStrong((id *)&self->_installedAppsDirectoryURL, 0);
}

- (void)setCacheDirectoryURL:(id)a3
{
}

- (NSURL)cacheDirectoryURL
{
  return self->_cacheDirectoryURL;
}

- (void)setInstalledAppsDirectoryURL:(id)a3
{
}

- (NSURL)installedAppsDirectoryURL
{
  return self->_installedAppsDirectoryURL;
}

@end