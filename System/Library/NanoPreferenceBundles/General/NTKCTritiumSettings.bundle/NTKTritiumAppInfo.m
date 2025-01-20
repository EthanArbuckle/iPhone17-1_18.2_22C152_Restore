@interface NTKTritiumAppInfo
- (NSString)appBundleID;
- (NSString)localizedName;
- (NSString)watchkitExtensionID;
- (void)setAppBundleID:(id)a3;
- (void)setLocalizedName:(id)a3;
- (void)setWatchkitExtensionID:(id)a3;
@end

@implementation NTKTritiumAppInfo

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
}

- (NSString)appBundleID
{
  return self->_appBundleID;
}

- (void)setAppBundleID:(id)a3
{
}

- (NSString)watchkitExtensionID
{
  return self->_watchkitExtensionID;
}

- (void)setWatchkitExtensionID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchkitExtensionID, 0);
  objc_storeStrong((id *)&self->_appBundleID, 0);

  objc_storeStrong((id *)&self->_localizedName, 0);
}

@end