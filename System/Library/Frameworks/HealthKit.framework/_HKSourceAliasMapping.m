@interface _HKSourceAliasMapping
- (NSString)aliasName;
- (NSString)bundleIdentifierForIcon;
- (NSString)bundleIdentifierForInstallationStatus;
- (void)setAliasName:(id)a3;
- (void)setBundleIdentifierForIcon:(id)a3;
- (void)setBundleIdentifierForInstallationStatus:(id)a3;
@end

@implementation _HKSourceAliasMapping

- (NSString)aliasName
{
  return self->_aliasName;
}

- (void)setAliasName:(id)a3
{
}

- (NSString)bundleIdentifierForInstallationStatus
{
  return self->_bundleIdentifierForInstallationStatus;
}

- (void)setBundleIdentifierForInstallationStatus:(id)a3
{
}

- (NSString)bundleIdentifierForIcon
{
  return self->_bundleIdentifierForIcon;
}

- (void)setBundleIdentifierForIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierForIcon, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierForInstallationStatus, 0);

  objc_storeStrong((id *)&self->_aliasName, 0);
}

@end