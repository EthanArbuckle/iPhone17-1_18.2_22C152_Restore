@interface STStorageOtherFakeApp
- (STStorageOtherFakeApp)init;
- (id)vendorName;
- (id)versionString;
@end

@implementation STStorageOtherFakeApp

- (STStorageOtherFakeApp)init
{
  v10.receiver = self;
  v10.super_class = (Class)STStorageOtherFakeApp;
  v2 = [(STStorageOtherFakeApp *)&v10 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = comApplePrefs;
    [(STStorageOtherFakeApp *)v2 setBundleIdentifier:comApplePrefs];
    [(STStorageOtherFakeApp *)v3 setAppIdentifier:v4];
    id v5 = objc_alloc((Class)LSApplicationRecord);
    v6 = [(STStorageOtherFakeApp *)v3 bundleIdentifier];
    id v7 = [v5 initWithBundleIdentifier:v6 allowPlaceholder:1 error:0];
    [(STStorageOtherFakeApp *)v3 setAppRecord:v7];

    v8 = STStorageLocStr(@"OTHER");
    [(STStorageOtherFakeApp *)v3 setName:v8];
  }
  return v3;
}

- (id)vendorName
{
  return 0;
}

- (id)versionString
{
  return vendorAppleInc;
}

@end