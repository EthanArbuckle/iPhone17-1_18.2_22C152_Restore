@interface APPerAppManagedProtectability
+ (BOOL)supportsSecureCoding;
- (APPerAppManagedProtectability)initWithCoder:(id)a3;
- (APPerAppManagedProtectability)initWithPerAppProtectability:(id)a3;
- (id)description;
- (id)managedBundleIdentifiers;
- (id)protectabilityForBundleIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation APPerAppManagedProtectability

- (APPerAppManagedProtectability)initWithPerAppProtectability:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)APPerAppManagedProtectability;
  v5 = [(APPerAppManagedProtectability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    map = v5->_map;
    v5->_map = (NSDictionary *)v6;
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (APPerAppManagedProtectability)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x263EFFA08];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  objc_super v9 = [v4 decodeObjectOfClasses:v8 forKey:@"map"];

  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __47__APPerAppManagedProtectability_initWithCoder___block_invoke;
  v13[3] = &unk_26522C158;
  v13[4] = &v14;
  [v9 enumerateKeysAndObjectsUsingBlock:v13];
  if (v9)
  {
    if (!*((unsigned char *)v15 + 24))
    {
      v12.receiver = self;
      v12.super_class = (Class)APPerAppManagedProtectability;
      v10 = [(APPerAppManagedProtectability *)&v12 init];
      self = v10;
      if (v10) {
        objc_storeStrong((id *)&v10->_map, v9);
      }
    }
  }
  _Block_object_dispose(&v14, 8);

  return self;
}

void __47__APPerAppManagedProtectability_initWithCoder___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v9 = a3;
  id v7 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (id)protectabilityForBundleIdentifier:(id)a3
{
  return [(NSDictionary *)self->_map objectForKey:a3];
}

- (id)managedBundleIdentifiers
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = [(NSDictionary *)self->_map allKeys];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithFormat:@"<%@", objc_opt_class()];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_map;
  uint64_t v5 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v10 = [(NSDictionary *)self->_map objectForKey:v9];
        [v3 appendFormat:@" %@: %@", v9, v10, (void)v12];
      }
      uint64_t v6 = [(NSDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendString:@">"];
  return v3;
}

- (void).cxx_destruct
{
}

@end