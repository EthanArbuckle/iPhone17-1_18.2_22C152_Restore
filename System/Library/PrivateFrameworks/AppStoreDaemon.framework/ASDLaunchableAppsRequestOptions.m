@interface ASDLaunchableAppsRequestOptions
+ (BOOL)supportsSecureCoding;
- (ASDLaunchableAppsRequestOptions)initWithBundleIDs:(id)a3;
- (ASDLaunchableAppsRequestOptions)initWithCoder:(id)a3;
- (NSArray)bundleIDs;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ASDLaunchableAppsRequestOptions

- (ASDLaunchableAppsRequestOptions)initWithBundleIDs:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASDLaunchableAppsRequestOptions;
  v5 = [(ASDLaunchableAppsRequestOptions *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v6;
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[ASDLaunchableAppsRequestOptions allocWithZone:a3];
  bundleIDs = self->_bundleIDs;
  return [(ASDLaunchableAppsRequestOptions *)v4 initWithBundleIDs:bundleIDs];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ASDLaunchableAppsRequestOptions)initWithCoder:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASDLaunchableAppsRequestOptions;
  v5 = [(ASDLaunchableAppsRequestOptions *)&v12 init];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    v8 = [v6 setWithArray:v7];
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"bundleIDs"];
    bundleIDs = v5->_bundleIDs;
    v5->_bundleIDs = (NSArray *)v9;
  }
  return v5;
}

- (NSArray)bundleIDs
{
  return self->_bundleIDs;
}

- (void).cxx_destruct
{
}

@end