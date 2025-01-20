@interface DMFFetchProvisioningProfilesResultObject
+ (BOOL)supportsSecureCoding;
- (DMFFetchProvisioningProfilesResultObject)initWithCoder:(id)a3;
- (DMFFetchProvisioningProfilesResultObject)initWithProfiles:(id)a3;
- (NSArray)profiles;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DMFFetchProvisioningProfilesResultObject

- (DMFFetchProvisioningProfilesResultObject)initWithProfiles:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DMFFetchProvisioningProfilesResultObject;
  v5 = [(CATTaskResultObject *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DMFFetchProvisioningProfilesResultObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)DMFFetchProvisioningProfilesResultObject;
  v5 = [(CATTaskResultObject *)&v12 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"profiles"];
    profiles = v5->_profiles;
    v5->_profiles = (NSArray *)v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)DMFFetchProvisioningProfilesResultObject;
  id v4 = a3;
  [(CATTaskResultObject *)&v6 encodeWithCoder:v4];
  v5 = [(DMFFetchProvisioningProfilesResultObject *)self profiles];
  [v4 encodeObject:v5 forKey:@"profiles"];
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(DMFFetchProvisioningProfilesResultObject *)self profiles];
  v3 = [v2 sortedArrayUsingComparator:&__block_literal_global_13];

  id v4 = [MEMORY[0x1E4F28E78] stringWithString:@"["];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    uint64_t v9 = &stru_1F18939E8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 appendFormat:@"%@\n%@", v9, *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12];
        uint64_t v9 = @",";
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      uint64_t v9 = @",";
    }
    while (v7);
  }

  [v4 appendString:@"\n]"];
  return v4;
}

uint64_t __55__DMFFetchProvisioningProfilesResultObject_description__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

- (NSArray)profiles
{
  return self->_profiles;
}

- (void).cxx_destruct
{
}

@end