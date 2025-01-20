@interface DMFFetchAppsResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchAppsResultObject)initWithAppsByBundleIdentifier:(id)a3;
- (DMFFetchAppsResultObject)initWithCoder:(id)a3;
- (NSDictionary)appsByBundleIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchAppsResultObject

- (DMFFetchAppsResultObject)initWithAppsByBundleIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchAppsResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    appsByBundleIdentifier = v5->_appsByBundleIdentifier;
    v5->_appsByBundleIdentifier = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchAppsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchAppsResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"appsByBundleIdentifier"];
    appsByBundleIdentifier = v5->_appsByBundleIdentifier;
    v5->_appsByBundleIdentifier = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchAppsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchAppsResultObject *)self appsByBundleIdentifier];
  [v4 encodeObject:v5 forKey:@"appsByBundleIdentifier"];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(DMFFetchAppsResultObject *)self appsByBundleIdentifier];
  v3 = [MEMORY[0x1E4F28E78] stringWithString:@"{"];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        [v3 appendFormat:@"\n%@: %@", v9, v10, (void)v12];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"\n}"];
  return v3;
}

- (NSDictionary)appsByBundleIdentifier
{
  return self->_appsByBundleIdentifier;
}

- (void).cxx_destruct
{
}

@end