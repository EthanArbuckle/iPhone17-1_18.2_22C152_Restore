@interface ASDLaunchableAppsResponse
+ (BOOL)supportsSecureCoding;
- (ASDLaunchableAppsResponse)initWithBundleIDs:(id)a3;
- (ASDLaunchableAppsResponse)initWithCoder:(id)a3;
- (NSArray)bundleIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDLaunchableAppsResponse

- (ASDLaunchableAppsResponse)initWithBundleIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDLaunchableAppsResponse;
  v5 = [(ASDRequestResponse *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:v4 copyItems:1];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ASDLaunchableAppsResponse allocWithZone:a3];
  bundleIDs = self->_bundleIDs;
  return [(ASDLaunchableAppsResponse *)v4 initWithBundleIDs:bundleIDs];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ASDLaunchableAppsResponse)initWithCoder:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  v7 = objc_msgSend(v4, "setWithObjects:", v6, objc_opt_class(), 0);
  v8 = [v5 decodeObjectOfClasses:v7 forKey:@"bundleIDs"];

  objc_super v9 = [(ASDLaunchableAppsResponse *)self initWithBundleIDs:v8];
  return v9;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void).cxx_destruct
{
}

@end