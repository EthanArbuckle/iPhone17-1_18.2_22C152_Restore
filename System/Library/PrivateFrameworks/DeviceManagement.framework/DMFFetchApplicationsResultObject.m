@interface DMFFetchApplicationsResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchApplicationsResultObject)initWithApplicationsByIdentifier:(id)a3;
- (DMFFetchApplicationsResultObject)initWithCoder:(id)a3;
- (NSDictionary)applicationsByIdentifier;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchApplicationsResultObject

- (DMFFetchApplicationsResultObject)initWithApplicationsByIdentifier:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchApplicationsResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    applicationsByIdentifier = v5->_applicationsByIdentifier;
    v5->_applicationsByIdentifier = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchApplicationsResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DMFFetchApplicationsResultObject;
  v5 = [(CATTaskResultObject *)&v13 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    objc_super v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    uint64_t v10 = [v4 decodeObjectOfClasses:v9 forKey:@"applicationsByIdentifier"];
    applicationsByIdentifier = v5->_applicationsByIdentifier;
    v5->_applicationsByIdentifier = (NSDictionary *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchApplicationsResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchApplicationsResultObject *)self applicationsByIdentifier];
  [v4 encodeObject:v5 forKey:@"applicationsByIdentifier"];
}

- (id)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(DMFFetchApplicationsResultObject *)self applicationsByIdentifier];
  v3 = [v2 allValues];
  id v4 = [v3 sortedArrayUsingComparator:&__block_literal_global_8];

  v5 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    uint64_t v10 = &stru_1F18939E8;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 appendFormat:@"%@\n%@", v10, *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13];
        uint64_t v10 = @",";
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      uint64_t v10 = @",";
    }
    while (v8);
  }

  [v5 appendString:@"\n]"];
  return v5;
}

uint64_t __47__DMFFetchApplicationsResultObject_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 bundleIdentifier];
  id v6 = [v4 bundleIdentifier];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSDictionary)applicationsByIdentifier
{
  return self->_applicationsByIdentifier;
}

- (void).cxx_destruct
{
}

@end