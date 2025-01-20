@interface PDClient
+ (BOOL)isSchoolworkAppVersionGreaterThanOrEqualTo:(id)a3;
- (void)setConnection:(id)a3;
- (void)setEntitlements:(id)a3;
@end

@implementation PDClient

+ (BOOL)isSchoolworkAppVersionGreaterThanOrEqualTo:(id)a3
{
  id v3 = a3;
  id v5 = [objc_alloc((Class)LSApplicationRecord) initWithBundleIdentifier:@"com.apple.schoolwork.ClassKitApp" allowPlaceholder:0 error:0];
  v6 = [v5 applicationState];
  unsigned int v7 = [v6 isInstalled];

  unsigned __int8 v8 = 0;
  if (v7)
  {
    v9 = [v5 shortVersionString];
    v10 = +[LSApplicationWorkspace defaultWorkspace];
    unsigned __int8 v8 = [v10 isVersion:v9 greaterThanOrEqualToVersion:v3];
  }

  return v8;
}

- (void)setConnection:(id)a3
{
}

- (void)setEntitlements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entitlements, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);

  objc_storeStrong((id *)&self->_overrideBundleIdentifier, 0);
}

@end