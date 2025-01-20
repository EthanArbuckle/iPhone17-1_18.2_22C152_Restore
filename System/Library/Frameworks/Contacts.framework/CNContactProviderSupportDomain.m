@interface CNContactProviderSupportDomain
+ (BOOL)supportsSecureCoding;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRegistered;
- (CNContactProviderSupportDomain)initWithCoder:(id)a3;
- (CNContactProviderSupportDomain)initWithDomainIdentifer:(id)a3 displayName:(id)a4 userInfo:(id)a5 bundleIdentifier:(id)a6 registered:(BOOL)a7 enabled:(BOOL)a8;
- (NSDictionary)userInfo;
- (NSString)bundleIdentifier;
- (NSString)displayName;
- (NSString)domainIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setRegistered:(BOOL)a3;
@end

@implementation CNContactProviderSupportDomain

- (CNContactProviderSupportDomain)initWithDomainIdentifer:(id)a3 displayName:(id)a4 userInfo:(id)a5 bundleIdentifier:(id)a6 registered:(BOOL)a7 enabled:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v23.receiver = self;
  v23.super_class = (Class)CNContactProviderSupportDomain;
  v18 = [(CNContactProviderSupportDomain *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_domainIdentifier, a3);
    objc_storeStrong((id *)&v19->_displayName, a4);
    objc_storeStrong((id *)&v19->_userInfo, a5);
    objc_storeStrong((id *)&v19->_bundleIdentifier, a6);
    v19->_registered = a7;
    v19->_enabled = a8;
    v20 = v19;
  }

  return v19;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactProviderSupportDomain)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"domainIdentifier"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
  v7 = [MEMORY[0x1E4F1CAD0] setWithObject:objc_opt_class()];
  v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v12 = objc_msgSend(v8, "setWithObjects:", v9, v10, v11, objc_opt_class(), 0);
  v13 = [v4 decodeDictionaryWithKeysOfClasses:v7 objectsOfClasses:v12 forKey:@"userInfo"];
  id v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
  uint64_t v15 = [v4 decodeBoolForKey:@"isRegistered"];
  uint64_t v16 = [v4 decodeBoolForKey:@"isEnabled"];

  id v17 = [[CNContactProviderSupportDomain alloc] initWithDomainIdentifer:v5 displayName:v6 userInfo:v13 bundleIdentifier:v14 registered:v15 enabled:v16];
  return v17;
}

- (void)encodeWithCoder:(id)a3
{
  domainIdentifier = self->_domainIdentifier;
  id v5 = a3;
  [v5 encodeObject:domainIdentifier forKey:@"domainIdentifier"];
  [v5 encodeObject:self->_displayName forKey:@"displayName"];
  [v5 encodeObject:self->_userInfo forKey:@"userInfo"];
  [v5 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v5 encodeBool:self->_enabled forKey:@"isRegistered"];
  [v5 encodeBool:self->_enabled forKey:@"isEnabled"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNContactProviderSupportDomain alloc];
  id v5 = [(CNContactProviderSupportDomain *)self domainIdentifier];
  v6 = [(CNContactProviderSupportDomain *)self displayName];
  v7 = [(CNContactProviderSupportDomain *)self userInfo];
  v8 = [(CNContactProviderSupportDomain *)self bundleIdentifier];
  uint64_t v9 = [(CNContactProviderSupportDomain *)v4 initWithDomainIdentifer:v5 displayName:v6 userInfo:v7 bundleIdentifier:v8 registered:[(CNContactProviderSupportDomain *)self isRegistered] enabled:[(CNContactProviderSupportDomain *)self isEnabled]];

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (CNContactProviderSupportDomain *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_12;
    }
    unint64_t v5 = (unint64_t)[(CNContactProviderSupportDomain *)self domainIdentifier];
    unint64_t v6 = (unint64_t)[(CNContactProviderSupportDomain *)v4 domainIdentifier];
    if (v5 | v6)
    {
      if (![(id)v5 isEqual:v6]) {
        goto LABEL_12;
      }
    }
    if (((unint64_t v7 = (unint64_t)[(CNContactProviderSupportDomain *)self displayName],
           unint64_t v8 = (unint64_t)[(CNContactProviderSupportDomain *)v4 displayName],
           !(v7 | v8))
       || [(id)v7 isEqual:v8])
      && ((unint64_t v9 = (unint64_t)[(CNContactProviderSupportDomain *)self userInfo],
           unint64_t v10 = (unint64_t)[(CNContactProviderSupportDomain *)v4 userInfo],
           !(v9 | v10))
       || [(id)v9 isEqual:v10])
      && ((unint64_t v11 = (unint64_t)[(CNContactProviderSupportDomain *)self bundleIdentifier],
           unint64_t v12 = (unint64_t)[(CNContactProviderSupportDomain *)v4 bundleIdentifier],
           !(v11 | v12))
       || [(id)v11 isEqual:v12])
      && (BOOL v13 = [(CNContactProviderSupportDomain *)self isRegistered],
          v13 == [(CNContactProviderSupportDomain *)v4 isRegistered]))
    {
      BOOL v16 = [(CNContactProviderSupportDomain *)self isEnabled];
      BOOL v14 = v16 ^ [(CNContactProviderSupportDomain *)v4 isEnabled] ^ 1;
    }
    else
    {
LABEL_12:
      LOBYTE(v14) = 0;
    }
  }

  return v14;
}

- (NSString)domainIdentifier
{
  return self->_domainIdentifier;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSDictionary)userInfo
{
  return self->_userInfo;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_displayName, 0);

  objc_storeStrong((id *)&self->_domainIdentifier, 0);
}

@end