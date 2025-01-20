@interface CNSocialProfile
+ (BOOL)supportsSecureCoding;
+ (CNSocialProfile)socialProfileWithDictionaryRepresentation:(id)a3;
+ (NSString)localizedStringForKey:(NSString *)key;
+ (NSString)localizedStringForService:(NSString *)service;
+ (id)Username;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqual:(id)a3 ignoreURLs:(BOOL)a4;
- (BOOL)isValid:(id *)a3;
- (CNSocialProfile)initWithCoder:(id)a3;
- (CNSocialProfile)initWithUrlString:(NSString *)urlString username:(NSString *)username userIdentifier:(NSString *)userIdentifier service:(NSString *)service;
- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7;
- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7 teamIdentifier:(id)a8 bundleIdentifiers:(id)a9;
- (NSArray)bundleIdentifiers;
- (NSString)description;
- (NSString)displayname;
- (NSString)service;
- (NSString)teamIdentifier;
- (NSString)urlString;
- (NSString)userIdentifier;
- (NSString)username;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setDisplayname:(id)a3;
- (void)setService:(id)a3;
- (void)setTeamIdentifier:(id)a3;
- (void)setUrlString:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation CNSocialProfile

+ (NSString)localizedStringForKey:(NSString *)key
{
  return (NSString *)[MEMORY[0x1E4F5A430] localizedStringForString:key class:a1 returningNilIfNotFound:0];
}

+ (NSString)localizedStringForService:(NSString *)service
{
  v4 = (void *)MEMORY[0x1E4F5A430];
  v5 = (void *)MEMORY[0x1E4F28B50];
  v6 = service;
  v7 = [v5 bundleForClass:a1];
  v8 = [v4 localizedStringForString:v6 bundle:v7 table:@"SocialServices" returningNilIfNotFound:0];

  return (NSString *)v8;
}

+ (CNSocialProfile)socialProfileWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[CN socialProfileFromDictionaryTransform];
  v5 = ((void (**)(void, id))v4)[2](v4, v3);

  return (CNSocialProfile *)v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[CN socialProfileToDictionaryTransform];
  v4 = ((void (**)(void, CNSocialProfile *))v3)[2](v3, self);

  return v4;
}

- (CNSocialProfile)initWithUrlString:(NSString *)urlString username:(NSString *)username userIdentifier:(NSString *)userIdentifier service:(NSString *)service
{
  return [(CNSocialProfile *)self initWithUrlString:urlString username:username userIdentifier:userIdentifier service:service displayname:0 teamIdentifier:0 bundleIdentifiers:0];
}

- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7
{
  return [(CNSocialProfile *)self initWithUrlString:a3 username:a4 userIdentifier:a5 service:a6 displayname:a7 teamIdentifier:0 bundleIdentifiers:0];
}

- (CNSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayname:(id)a7 teamIdentifier:(id)a8 bundleIdentifiers:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  v39.receiver = self;
  v39.super_class = (Class)CNSocialProfile;
  v22 = [(CNSocialProfile *)&v39 init];
  if (v22)
  {
    uint64_t v23 = [v15 copy];
    urlString = v22->_urlString;
    v22->_urlString = (NSString *)v23;

    uint64_t v25 = [v16 copy];
    username = v22->_username;
    v22->_username = (NSString *)v25;

    uint64_t v27 = [v17 copy];
    userIdentifier = v22->_userIdentifier;
    v22->_userIdentifier = (NSString *)v27;

    uint64_t v29 = [v18 copy];
    service = v22->_service;
    v22->_service = (NSString *)v29;

    uint64_t v31 = [v19 copy];
    displayname = v22->_displayname;
    v22->_displayname = (NSString *)v31;

    uint64_t v33 = [v20 copy];
    teamIdentifier = v22->_teamIdentifier;
    v22->_teamIdentifier = (NSString *)v33;

    uint64_t v35 = [v21 copy];
    bundleIdentifiers = v22->_bundleIdentifiers;
    v22->_bundleIdentifiers = (NSArray *)v35;

    v37 = v22;
  }

  return v22;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNMutableSocialProfile alloc];
  v5 = [(CNSocialProfile *)self urlString];
  v6 = [(CNSocialProfile *)self username];
  v7 = [(CNSocialProfile *)self userIdentifier];
  v8 = [(CNSocialProfile *)self service];
  v9 = [(CNSocialProfile *)self displayname];
  v10 = [(CNSocialProfile *)self teamIdentifier];
  v11 = [(CNSocialProfile *)self bundleIdentifiers];
  v12 = [(CNSocialProfile *)v4 initWithUrlString:v5 username:v6 userIdentifier:v7 service:v8 displayname:v9 teamIdentifier:v10 bundleIdentifiers:v11];

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNSocialProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)CNSocialProfile;
  v5 = [(CNSocialProfile *)&v32 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_urlString"];
    uint64_t v7 = [v6 copy];
    urlString = v5->_urlString;
    v5->_urlString = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_username"];
    uint64_t v10 = [v9 copy];
    username = v5->_username;
    v5->_username = (NSString *)v10;

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIdentifier"];
    uint64_t v13 = [v12 copy];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_service"];
    uint64_t v16 = [v15 copy];
    service = v5->_service;
    v5->_service = (NSString *)v16;

    id v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_displayname"];
    uint64_t v19 = [v18 copy];
    displayname = v5->_displayname;
    v5->_displayname = (NSString *)v19;

    id v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamIdentifier"];
    uint64_t v22 = [v21 copy];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v22;

    v24 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v25 = objc_opt_class();
    v26 = objc_msgSend(v24, "setWithObjects:", v25, objc_opt_class(), 0);
    uint64_t v27 = [v4 decodeObjectOfClasses:v26 forKey:@"_bundleIdentifiers"];
    uint64_t v28 = [v27 copy];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v28;

    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  urlString = self->_urlString;
  id v5 = a3;
  [v5 encodeObject:urlString forKey:@"_urlString"];
  [v5 encodeObject:self->_username forKey:@"_username"];
  [v5 encodeObject:self->_userIdentifier forKey:@"_userIdentifier"];
  [v5 encodeObject:self->_service forKey:@"_service"];
  [v5 encodeObject:self->_displayname forKey:@"_displayname"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"_teamIdentifier"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"_bundleIdentifiers"];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"urlString", self->_urlString, @"username", self->_username, @"userIdentifier", self->_userIdentifier, @"service", self->_service, @"displayname", self->_displayname, @"teamIdentifier", self->_teamIdentifier, @"bundleIdentifiers", self->_bundleIdentifiers, 0);
  id v5 = [v3 build];

  return (NSString *)v5;
}

- (BOOL)isEqual:(id)a3
{
  return [(CNSocialProfile *)self isEqual:a3 ignoreURLs:0];
}

- (BOOL)isEqual:(id)a3 ignoreURLs:(BOOL)a4
{
  if (self == a3)
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    uint64_t v29 = v7;
    uint64_t v30 = v6;
    uint64_t v31 = v5;
    uint64_t v32 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t v13 = (unint64_t)[(CNSocialProfile *)self teamIdentifier];
      unint64_t v14 = (unint64_t)(id)[a3 teamIdentifier];
      if (!(v13 | v14) || (int v15 = [(id)v13 isEqual:v14]) != 0)
      {
        unint64_t v16 = (unint64_t)[(CNSocialProfile *)self bundleIdentifiers];
        unint64_t v17 = (unint64_t)(id)[a3 bundleIdentifiers];
        if (!(v16 | v17) || (int v15 = [(id)v16 isEqual:v17]) != 0)
        {
          if (a4
            || (unint64_t v18 = (unint64_t)[(CNSocialProfile *)self urlString],
                unint64_t v19 = (unint64_t)(id)[a3 urlString],
                !(v18 | v19))
            || (int v15 = [(id)v18 isEqual:v19]) != 0)
          {
            unint64_t v20 = (unint64_t)[(CNSocialProfile *)self username];
            unint64_t v21 = (unint64_t)(id)[a3 username];
            if (!(v20 | v21) || (int v15 = [(id)v20 isEqual:v21]) != 0)
            {
              unint64_t v22 = (unint64_t)[(CNSocialProfile *)self userIdentifier];
              unint64_t v23 = (unint64_t)(id)[a3 userIdentifier];
              if (!(v22 | v23) || (int v15 = [(id)v22 isEqual:v23]) != 0)
              {
                unint64_t v24 = (unint64_t)[(CNSocialProfile *)self service];
                unint64_t v25 = (unint64_t)(id)[a3 service];
                if (!(v24 | v25) || (int v15 = [(id)v24 isEqual:v25]) != 0)
                {
                  unint64_t v26 = (unint64_t)[(CNSocialProfile *)self displayname];
                  unint64_t v27 = (unint64_t)(id)[a3 displayname];
                  if (!(v26 | v27) || (int v15 = [(id)v26 isEqual:v27]) != 0) {
                    LOBYTE(v15) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
    else
    {
      LOBYTE(v15) = 0;
    }
  }
  return v15;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v4 = [(CNSocialProfile *)self urlString];
  uint64_t v5 = [v3 objectHash:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v7 = [(CNSocialProfile *)self username];
  uint64_t v8 = [v6 objectHash:v7] - v5 + 32 * v5;

  uint64_t v9 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v10 = [(CNSocialProfile *)self userIdentifier];
  uint64_t v11 = [v9 objectHash:v10] - v8 + 32 * v8;

  v12 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v13 = [(CNSocialProfile *)self service];
  uint64_t v14 = [v12 objectHash:v13] - v11 + 32 * v11;

  int v15 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v16 = [(CNSocialProfile *)self displayname];
  uint64_t v17 = [v15 objectHash:v16] - v14 + 32 * v14;

  unint64_t v18 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v19 = [(CNSocialProfile *)self teamIdentifier];
  uint64_t v20 = [v18 objectHash:v19] - v17 + 32 * v17;

  unint64_t v21 = (void *)MEMORY[0x1E4F5A418];
  unint64_t v22 = [(CNSocialProfile *)self bundleIdentifiers];
  unint64_t v23 = [v21 objectHash:v22] - v20 + 32 * v20 + 0x6CE5F3FACFLL;

  return v23;
}

- (BOOL)isValid:(id *)a3
{
  if (isValid__cn_once_token_0_2 != -1) {
    dispatch_once(&isValid__cn_once_token_0_2, &__block_literal_global_101);
  }
  id v5 = (id)isValid__cn_once_object_0_2;
  if (isValid__cn_once_token_1_2 != -1) {
    dispatch_once(&isValid__cn_once_token_1_2, &__block_literal_global_53_0);
  }
  uint64_t v6 = isValid__cn_once_token_2_2;
  id v7 = (id)isValid__cn_once_object_1_2;
  if (v6 != -1) {
    dispatch_once(&isValid__cn_once_token_2_2, &__block_literal_global_55_0);
  }
  BOOL v8 = +[CN areValidKeyPaths:v5 forObject:self expectedClasses:v7 allowNil:isValid__cn_once_object_2_2 error:a3];

  return v8;
}

uint64_t __27__CNSocialProfile_isValid___block_invoke()
{
  isValid__cn_once_object_0_2 = [&unk_1EE089728 copy];

  return MEMORY[0x1F41817F8]();
}

void __27__CNSocialProfile_isValid___block_invoke_2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:7];
  uint64_t v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6, v7, v8);
  v2 = (void *)isValid__cn_once_object_1_2;
  isValid__cn_once_object_1_2 = v1;
}

uint64_t __27__CNSocialProfile_isValid___block_invoke_3()
{
  isValid__cn_once_object_2_2 = [&unk_1EE089740 copy];

  return MEMORY[0x1F41817F8]();
}

+ (id)Username
{
  return &__block_literal_global_61;
}

- (NSString)urlString
{
  return self->_urlString;
}

- (void)setUrlString:(id)a3
{
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)displayname
{
  return self->_displayname;
}

- (void)setDisplayname:(id)a3
{
}

- (NSString)teamIdentifier
{
  return self->_teamIdentifier;
}

- (void)setTeamIdentifier:(id)a3
{
}

- (NSArray)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_teamIdentifier, 0);
  objc_storeStrong((id *)&self->_displayname, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_urlString, 0);
}

@end