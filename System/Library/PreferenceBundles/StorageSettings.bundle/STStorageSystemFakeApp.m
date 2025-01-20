@interface STStorageSystemFakeApp
- (STStorageSystemFakeApp)init;
- (id)vendorName;
- (id)versionString;
@end

@implementation STStorageSystemFakeApp

- (STStorageSystemFakeApp)init
{
  v10.receiver = self;
  v10.super_class = (Class)STStorageSystemFakeApp;
  v2 = [(STStorageSystemFakeApp *)&v10 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = comApplePrefs;
    [(STStorageSystemFakeApp *)v2 setBundleIdentifier:comApplePrefs];
    [(STStorageSystemFakeApp *)v3 setAppIdentifier:v4];
    id v5 = objc_alloc((Class)LSApplicationRecord);
    v6 = [(STStorageSystemFakeApp *)v3 bundleIdentifier];
    id v7 = [v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
    [(STStorageSystemFakeApp *)v3 setAppRecord:v7];

    v8 = STNameForCategoryKey();
    [(STStorageSystemFakeApp *)v3 setName:v8];
  }
  return v3;
}

- (id)vendorName
{
  return vendorAppleInc;
}

- (id)versionString
{
  v2 = STStorageLocStr(@"VERSION_FMT");
  v3 = +[UIDevice currentDevice];
  uint64_t v4 = [v3 systemVersion];
  id v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v4);

  return v5;
}

@end