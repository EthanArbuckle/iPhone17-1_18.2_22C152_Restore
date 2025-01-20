@interface SOProfile
+ (BOOL)supportsSecureCoding;
+ (id)stringWithAuthenticationMethod:(int64_t)a3;
+ (id)stringWithProfileType:(int64_t)a3;
+ (id)stringWithScreenLockedBehavior:(int64_t)a3;
- (BOOL)matchesURL:(id)a3;
- (NSArray)URLPrefix;
- (NSArray)deniedBundleIdentifiers;
- (NSArray)hosts;
- (NSString)extensionBundleIdentifier;
- (NSString)realm;
- (SOProfile)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)pssoAuthenticationMethod;
- (int64_t)screenLockedBehavior;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)preLoadURLData;
- (void)setDeniedBundleIdentifiers:(id)a3;
- (void)setExtensionBundleIdentifier:(id)a3;
- (void)setHosts:(id)a3;
- (void)setPssoAuthenticationMethod:(int64_t)a3;
- (void)setRealm:(id)a3;
- (void)setScreenLockedBehavior:(int64_t)a3;
- (void)setType:(int64_t)a3;
- (void)setURLPrefix:(id)a3;
@end

@implementation SOProfile

- (void)encodeWithCoder:(id)a3
{
  v4 = NSNumber;
  int64_t type = self->_type;
  id v6 = a3;
  v7 = [v4 numberWithInteger:type];
  v8 = NSStringFromSelector(sel_type);
  [v6 encodeObject:v7 forKey:v8];

  URLPrefix = self->_URLPrefix;
  v10 = NSStringFromSelector(sel_URLPrefix);
  [v6 encodeObject:URLPrefix forKey:v10];

  hosts = self->_hosts;
  v12 = NSStringFromSelector(sel_hosts);
  [v6 encodeObject:hosts forKey:v12];

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v14 = NSStringFromSelector(sel_extensionBundleIdentifier);
  [v6 encodeObject:extensionBundleIdentifier forKey:v14];

  realm = self->_realm;
  v16 = NSStringFromSelector(sel_realm);
  [v6 encodeObject:realm forKey:v16];

  deniedBundleIdentifiers = self->_deniedBundleIdentifiers;
  v18 = NSStringFromSelector(sel_deniedBundleIdentifiers);
  [v6 encodeObject:deniedBundleIdentifiers forKey:v18];

  v19 = [NSNumber numberWithInteger:self->_screenLockedBehavior];
  v20 = NSStringFromSelector(sel_screenLockedBehavior);
  [v6 encodeObject:v19 forKey:v20];

  id v22 = [NSNumber numberWithInteger:self->_pssoAuthenticationMethod];
  v21 = NSStringFromSelector(sel_pssoAuthenticationMethod);
  [v6 encodeObject:v22 forKey:v21];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deniedBundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_realm, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_hosts, 0);
  objc_storeStrong((id *)&self->_URLPrefix, 0);
  objc_storeStrong((id *)&self->_urlNoWildCards, 0);
  objc_storeStrong((id *)&self->_urlPredicates, 0);
}

- (void)preLoadURLData
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  urlPredicates = self->_urlPredicates;
  self->_urlPredicates = v3;

  v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  urlNoWildCards = self->_urlNoWildCards;
  self->_urlNoWildCards = v5;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v7 = self->_URLPrefix;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 containsString:@"*"])
        {
          v13 = (void *)MEMORY[0x1E4F28F60];
          v14 = [v12 stringByAppendingString:@"*"];
          v15 = [v13 predicateWithFormat:@"SELF LIKE[c] %@", v14];

          [(NSMutableDictionary *)self->_urlPredicates setObject:v15 forKeyedSubscript:v12];
        }
        else
        {
          [(NSMutableDictionary *)self->_urlNoWildCards setObject:&unk_1F2EB1D50 forKeyedSubscript:v12];
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = objc_opt_new();
  v4[3] = self->_type;
  uint64_t v5 = [(NSArray *)self->_URLPrefix copy];
  id v6 = (void *)v4[4];
  v4[4] = v5;

  uint64_t v7 = [(NSArray *)self->_hosts copy];
  uint64_t v8 = (void *)v4[5];
  v4[5] = v7;

  uint64_t v9 = [(NSString *)self->_extensionBundleIdentifier copy];
  uint64_t v10 = (void *)v4[6];
  v4[6] = v9;

  uint64_t v11 = [(NSString *)self->_realm copy];
  v12 = (void *)v4[7];
  v4[7] = v11;

  uint64_t v13 = [(NSArray *)self->_deniedBundleIdentifiers copy];
  v14 = (void *)v4[8];
  v4[8] = v13;

  v4[9] = self->_screenLockedBehavior;
  v4[10] = self->_pssoAuthenticationMethod;
  return v4;
}

- (SOProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)SOProfile;
  uint64_t v5 = [(SOProfile *)&v42 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = NSStringFromSelector(sel_type);
    uint64_t v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    v5->_int64_t type = [v8 integerValue];

    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = NSStringFromSelector(sel_URLPrefix);
    uint64_t v13 = [v4 decodeObjectOfClasses:v11 forKey:v12];
    URLPrefix = v5->_URLPrefix;
    v5->_URLPrefix = (NSArray *)v13;

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    long long v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    long long v18 = NSStringFromSelector(sel_hosts);
    uint64_t v19 = [v4 decodeObjectOfClasses:v17 forKey:v18];
    hosts = v5->_hosts;
    v5->_hosts = (NSArray *)v19;

    uint64_t v21 = objc_opt_class();
    id v22 = NSStringFromSelector(sel_extensionBundleIdentifier);
    uint64_t v23 = [v4 decodeObjectOfClass:v21 forKey:v22];
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    v26 = NSStringFromSelector(sel_realm);
    uint64_t v27 = [v4 decodeObjectOfClass:v25 forKey:v26];
    realm = v5->_realm;
    v5->_realm = (NSString *)v27;

    v29 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v30 = objc_opt_class();
    v31 = objc_msgSend(v29, "setWithObjects:", v30, objc_opt_class(), 0);
    v32 = NSStringFromSelector(sel_deniedBundleIdentifiers);
    uint64_t v33 = [v4 decodeObjectOfClasses:v31 forKey:v32];
    deniedBundleIdentifiers = v5->_deniedBundleIdentifiers;
    v5->_deniedBundleIdentifiers = (NSArray *)v33;

    uint64_t v35 = objc_opt_class();
    v36 = NSStringFromSelector(sel_screenLockedBehavior);
    v37 = [v4 decodeObjectOfClass:v35 forKey:v36];
    v5->_screenLockedBehavior = [v37 integerValue];

    uint64_t v38 = objc_opt_class();
    v39 = NSStringFromSelector(sel_pssoAuthenticationMethod);
    v40 = [v4 decodeObjectOfClass:v38 forKey:v39];
    v5->_pssoAuthenticationMethod = [v40 integerValue];
  }
  return v5;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)matchesURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v5 = self->_URLPrefix;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v11 = -[NSMutableDictionary valueForKey:](self->_urlNoWildCards, "valueForKey:", v10, (void)v19);

        if (v11)
        {
          v12 = [v4 lowercaseString];
          uint64_t v13 = [v10 lowercaseString];
          char v14 = [v12 hasPrefix:v13];

          if (v14) {
            goto LABEL_16;
          }
        }
        else
        {
          v15 = [(NSMutableDictionary *)self->_urlPredicates valueForKey:v10];
          uint64_t v16 = v15;
          if (v15 && ([v15 evaluateWithObject:v4] & 1) != 0)
          {

LABEL_16:
            BOOL v17 = 1;
            goto LABEL_17;
          }
        }
      }
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_17:

  return v17;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringWithProfileType:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %d>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6A6EFF8[a3];
  }
  return v3;
}

+ (id)stringWithScreenLockedBehavior:(int64_t)a3
{
  if ((unint64_t)a3 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %d>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6A6F010[a3];
  }
  return v3;
}

+ (id)stringWithAuthenticationMethod:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"<unknown: %d>", a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6A6F028[a3 - 1];
  }
  return v3;
}

- (id)description
{
  v20[8] = *MEMORY[0x1E4F143B8];
  v19[0] = @"Type";
  uint64_t v3 = [(id)objc_opt_class() stringWithProfileType:self->_type];
  id v4 = (void *)v3;
  URLPrefix = self->_URLPrefix;
  hosts = self->_hosts;
  if (!URLPrefix) {
    URLPrefix = (NSArray *)@"<null>";
  }
  v20[0] = v3;
  v20[1] = URLPrefix;
  v19[1] = @"URLPrefix";
  v19[2] = @"Hosts";
  if (hosts) {
    uint64_t v7 = (__CFString *)hosts;
  }
  else {
    uint64_t v7 = @"<null>";
  }
  v20[2] = v7;
  v19[3] = @"BundleIdentifier";
  uint64_t v8 = [(SOProfile *)self extensionBundleIdentifier];
  uint64_t v9 = (void *)v8;
  if (v8) {
    uint64_t v10 = (__CFString *)v8;
  }
  else {
    uint64_t v10 = @"<null>";
  }
  realm = (__CFString *)self->_realm;
  deniedBundleIdentifiers = self->_deniedBundleIdentifiers;
  if (!realm) {
    realm = @"<null>";
  }
  v20[3] = v10;
  v20[4] = realm;
  v19[4] = @"Realm";
  v19[5] = @"DeniedBundleIdentifiers";
  if (deniedBundleIdentifiers) {
    uint64_t v13 = (__CFString *)deniedBundleIdentifiers;
  }
  else {
    uint64_t v13 = @"<null>";
  }
  v20[5] = v13;
  v19[6] = @"ScreenLockedBehavior";
  char v14 = [(id)objc_opt_class() stringWithScreenLockedBehavior:self->_screenLockedBehavior];
  v20[6] = v14;
  v19[7] = @"AuthenticationMethod";
  v15 = [(id)objc_opt_class() stringWithAuthenticationMethod:self->_pssoAuthenticationMethod];
  v20[7] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:8];
  BOOL v17 = [v16 description];

  return v17;
}

- (void)setType:(int64_t)a3
{
  self->_int64_t type = a3;
}

- (NSArray)URLPrefix
{
  return self->_URLPrefix;
}

- (void)setURLPrefix:(id)a3
{
}

- (NSArray)hosts
{
  return self->_hosts;
}

- (void)setHosts:(id)a3
{
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (void)setExtensionBundleIdentifier:(id)a3
{
}

- (NSString)realm
{
  return self->_realm;
}

- (void)setRealm:(id)a3
{
}

- (NSArray)deniedBundleIdentifiers
{
  return self->_deniedBundleIdentifiers;
}

- (void)setDeniedBundleIdentifiers:(id)a3
{
}

- (int64_t)screenLockedBehavior
{
  return self->_screenLockedBehavior;
}

- (void)setScreenLockedBehavior:(int64_t)a3
{
  self->_screenLockedBehavior = a3;
}

- (int64_t)pssoAuthenticationMethod
{
  return self->_pssoAuthenticationMethod;
}

- (void)setPssoAuthenticationMethod:(int64_t)a3
{
  self->_pssoAuthenticationMethod = a3;
}

@end