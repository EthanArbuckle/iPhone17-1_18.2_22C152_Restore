@interface CNInstantMessageAddress
+ (BOOL)supportsSecureCoding;
+ (CNInstantMessageAddress)instantMessageAddressWithDictionaryRepresentation:(id)a3;
+ (NSString)localizedStringForKey:(NSString *)key;
+ (NSString)localizedStringForService:(NSString *)service;
+ (id)Username;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid:(id *)a3;
- (CNInstantMessageAddress)init;
- (CNInstantMessageAddress)initWithCoder:(id)a3;
- (CNInstantMessageAddress)initWithUsername:(NSString *)username service:(NSString *)service;
- (CNInstantMessageAddress)initWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 teamIdentifier:(id)a6 bundleIdentifiers:(id)a7;
- (NSArray)bundleIdentifiers;
- (NSString)description;
- (NSString)service;
- (NSString)teamIdentifier;
- (NSString)userIdentifier;
- (NSString)username;
- (id)dictionaryRepresentation;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleIdentifiers:(id)a3;
- (void)setService:(id)a3;
- (void)setTeamIdentifier:(id)a3;
- (void)setUserIdentifier:(id)a3;
- (void)setUsername:(id)a3;
@end

@implementation CNInstantMessageAddress

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
  v8 = [v4 localizedStringForString:v6 bundle:v7 table:@"MessagingServices" returningNilIfNotFound:0];

  return (NSString *)v8;
}

+ (CNInstantMessageAddress)instantMessageAddressWithDictionaryRepresentation:(id)a3
{
  id v3 = a3;
  v4 = +[CN instantMessageAddressFromDictionaryTransform];
  v5 = ((void (**)(void, id))v4)[2](v4, v3);

  return (CNInstantMessageAddress *)v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[CN instantMessageAddressToDictionaryTransform];
  v4 = ((void (**)(void, CNInstantMessageAddress *))v3)[2](v3, self);

  return v4;
}

- (CNInstantMessageAddress)init
{
  return [(CNInstantMessageAddress *)self initWithUsername:&stru_1EE052B80 service:&stru_1EE052B80];
}

- (CNInstantMessageAddress)initWithUsername:(NSString *)username service:(NSString *)service
{
  return [(CNInstantMessageAddress *)self initWithUsername:username userIdentifier:0 service:service teamIdentifier:0 bundleIdentifiers:0];
}

- (CNInstantMessageAddress)initWithUsername:(id)a3 userIdentifier:(id)a4 service:(id)a5 teamIdentifier:(id)a6 bundleIdentifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  v14 = (__CFString *)a5;
  id v15 = a6;
  id v16 = a7;
  v31.receiver = self;
  v31.super_class = (Class)CNInstantMessageAddress;
  v17 = [(CNInstantMessageAddress *)&v31 init];
  v18 = v17;
  if (v17)
  {
    if (!v14) {
      v14 = &stru_1EE052B80;
    }
    if (v12)
    {
      uint64_t v19 = [v12 copy];
      username = v18->_username;
      v18->_username = (NSString *)v19;
    }
    else
    {
      username = v17->_username;
      v17->_username = (NSString *)&stru_1EE052B80;
    }

    uint64_t v21 = [v13 copy];
    userIdentifier = v18->_userIdentifier;
    v18->_userIdentifier = (NSString *)v21;

    uint64_t v23 = [(__CFString *)v14 copy];
    service = v18->_service;
    v18->_service = (NSString *)v23;

    uint64_t v25 = [v15 copy];
    teamIdentifier = v18->_teamIdentifier;
    v18->_teamIdentifier = (NSString *)v25;

    uint64_t v27 = [v16 copy];
    bundleIdentifiers = v18->_bundleIdentifiers;
    v18->_bundleIdentifiers = (NSArray *)v27;

    v29 = v18;
  }

  return v18;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [CNMutableInstantMessageAddress alloc];
  v5 = [(CNInstantMessageAddress *)self username];
  v6 = [(CNInstantMessageAddress *)self userIdentifier];
  v7 = [(CNInstantMessageAddress *)self service];
  v8 = [(CNInstantMessageAddress *)self teamIdentifier];
  v9 = [(CNInstantMessageAddress *)self bundleIdentifiers];
  v10 = [(CNInstantMessageAddress *)v4 initWithUsername:v5 userIdentifier:v6 service:v7 teamIdentifier:v8 bundleIdentifiers:v9];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNInstantMessageAddress)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CNInstantMessageAddress;
  v5 = [(CNInstantMessageAddress *)&v26 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_username"];
    uint64_t v7 = [v6 copy];
    username = v5->_username;
    v5->_username = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_userIdentifier"];
    uint64_t v10 = [v9 copy];
    userIdentifier = v5->_userIdentifier;
    v5->_userIdentifier = (NSString *)v10;

    id v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_service"];
    uint64_t v13 = [v12 copy];
    service = v5->_service;
    v5->_service = (NSString *)v13;

    id v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_teamIdentifier"];
    uint64_t v16 = [v15 copy];
    teamIdentifier = v5->_teamIdentifier;
    v5->_teamIdentifier = (NSString *)v16;

    v18 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v19 = objc_opt_class();
    v20 = objc_msgSend(v18, "setWithObjects:", v19, objc_opt_class(), 0);
    uint64_t v21 = [v4 decodeObjectOfClasses:v20 forKey:@"_bundleIdentifiers"];
    uint64_t v22 = [v21 copy];
    bundleIdentifiers = v5->_bundleIdentifiers;
    v5->_bundleIdentifiers = (NSArray *)v22;

    v24 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  username = self->_username;
  id v5 = a3;
  [v5 encodeObject:username forKey:@"_username"];
  [v5 encodeObject:self->_userIdentifier forKey:@"_userIdentifier"];
  [v5 encodeObject:self->_service forKey:@"_service"];
  [v5 encodeObject:self->_teamIdentifier forKey:@"_teamIdentifier"];
  [v5 encodeObject:self->_bundleIdentifiers forKey:@"_bundleIdentifiers"];
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"username" object:self->_username];
  id v5 = (id)[v3 appendName:@"userIdentifier" object:self->_userIdentifier];
  id v6 = (id)[v3 appendName:@"service" object:self->_service];
  id v7 = (id)[v3 appendName:@"teamIdentifier" object:self->_teamIdentifier];
  id v8 = (id)[v3 appendName:@"bundleIdentifiers" object:self->_bundleIdentifiers];
  v9 = [v3 build];

  return (NSString *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __35__CNInstantMessageAddress_isEqual___block_invoke;
  v24[3] = &unk_1E56B3E18;
  v24[4] = self;
  id v25 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v25;
  id v23 = v7;
  id v8 = _Block_copy(aBlock);
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_3;
  v20[3] = &unk_1E56B3E18;
  v20[4] = self;
  id v9 = v7;
  id v21 = v9;
  uint64_t v10 = _Block_copy(v20);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_4;
  v18[3] = &unk_1E56B3E18;
  v18[4] = self;
  id v11 = v9;
  id v19 = v11;
  id v12 = _Block_copy(v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__CNInstantMessageAddress_isEqual___block_invoke_5;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v11;
  id v13 = v11;
  v14 = _Block_copy(v16);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v13, v6, self, v24, v8, v10, v12, v14, 0);

  return (char)self;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) username];
  id v4 = [*(id *)(a1 + 40) username];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) userIdentifier];
  id v4 = [*(id *)(a1 + 40) userIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) service];
  id v4 = [*(id *)(a1 + 40) service];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) teamIdentifier];
  id v4 = [*(id *)(a1 + 40) teamIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __35__CNInstantMessageAddress_isEqual___block_invoke_5(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) bundleIdentifiers];
  id v4 = [*(id *)(a1 + 40) bundleIdentifiers];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  id v3 = (void *)MEMORY[0x1E4F5A418];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __31__CNInstantMessageAddress_hash__block_invoke;
  v14[3] = &unk_1E56B3E40;
  v14[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CNInstantMessageAddress_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __31__CNInstantMessageAddress_hash__block_invoke_3;
  v12[3] = &unk_1E56B3E40;
  v12[4] = self;
  uint64_t v5 = _Block_copy(v12);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __31__CNInstantMessageAddress_hash__block_invoke_4;
  v11[3] = &unk_1E56B3E40;
  v11[4] = self;
  uint64_t v6 = _Block_copy(v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __31__CNInstantMessageAddress_hash__block_invoke_5;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  id v7 = _Block_copy(v10);
  unint64_t v8 = objc_msgSend(v3, "hashWithBlocks:", v14, v4, v5, v6, v7, 0);

  return v8;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) username];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) userIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) service];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_4(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) teamIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __31__CNInstantMessageAddress_hash__block_invoke_5(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) bundleIdentifiers];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (BOOL)isValid:(id *)a3
{
  if (isValid__cn_once_token_0_0 != -1) {
    dispatch_once(&isValid__cn_once_token_0_0, &__block_literal_global_52);
  }
  id v5 = (id)isValid__cn_once_object_0_0;
  if (isValid__cn_once_token_1_0 != -1) {
    dispatch_once(&isValid__cn_once_token_1_0, &__block_literal_global_48_0);
  }
  uint64_t v6 = isValid__cn_once_token_2_0;
  id v7 = (id)isValid__cn_once_object_1_0;
  if (v6 != -1) {
    dispatch_once(&isValid__cn_once_token_2_0, &__block_literal_global_50_0);
  }
  BOOL v8 = +[CN areValidKeyPaths:v5 forObject:self expectedClasses:v7 allowNil:isValid__cn_once_object_2_0 error:a3];

  return v8;
}

uint64_t __35__CNInstantMessageAddress_isValid___block_invoke()
{
  isValid__cn_once_object_0_0 = [&unk_1EE0896E0 copy];

  return MEMORY[0x1F41817F8]();
}

void __35__CNInstantMessageAddress_isValid___block_invoke_2()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v3 count:5];
  uint64_t v1 = objc_msgSend(v0, "copy", v3, v4, v5, v6);
  v2 = (void *)isValid__cn_once_object_1_0;
  isValid__cn_once_object_1_0 = v1;
}

uint64_t __35__CNInstantMessageAddress_isValid___block_invoke_3()
{
  isValid__cn_once_object_2_0 = [&unk_1EE0896F8 copy];

  return MEMORY[0x1F41817F8]();
}

+ (id)Username
{
  return &__block_literal_global_56_0;
}

- (NSString)username
{
  return self->_username;
}

- (void)setUsername:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (NSString)userIdentifier
{
  return self->_userIdentifier;
}

- (void)setUserIdentifier:(id)a3
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
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);

  objc_storeStrong((id *)&self->_username, 0);
}

@end