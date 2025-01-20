@interface CNFoundationSocialProfile
+ (id)emptySocialProfile;
- (BOOL)isEmpty;
- (BOOL)isEqual:(id)a3;
- (CNFoundationSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayName:(id)a7;
- (NSString)displayName;
- (NSString)service;
- (NSString)urlString;
- (NSString)userIdentifier;
- (NSString)username;
- (id)description;
- (unint64_t)hash;
@end

@implementation CNFoundationSocialProfile

- (CNFoundationSocialProfile)initWithUrlString:(id)a3 username:(id)a4 userIdentifier:(id)a5 service:(id)a6 displayName:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v30.receiver = self;
  v30.super_class = (Class)CNFoundationSocialProfile;
  v17 = [(CNFoundationSocialProfile *)&v30 init];
  if (v17)
  {
    uint64_t v18 = [v12 copy];
    urlString = v17->_urlString;
    v17->_urlString = (NSString *)v18;

    uint64_t v20 = [v13 copy];
    username = v17->_username;
    v17->_username = (NSString *)v20;

    uint64_t v22 = [v14 copy];
    userIdentifier = v17->_userIdentifier;
    v17->_userIdentifier = (NSString *)v22;

    uint64_t v24 = [v15 copy];
    service = v17->_service;
    v17->_service = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    displayName = v17->_displayName;
    v17->_displayName = (NSString *)v26;

    v28 = v17;
  }

  return v17;
}

+ (id)emptySocialProfile
{
  v2 = (void *)[objc_alloc((Class)a1) initWithUrlString:0 username:0 userIdentifier:0 service:0 displayName:0];

  return v2;
}

- (BOOL)isEmpty
{
  return !self->_urlString && !self->_username && !self->_userIdentifier && !self->_service && self->_displayName == 0;
}

- (id)description
{
  v3 = +[CNDescriptionBuilder descriptionBuilderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendNamesAndObjects:", @"urlString", self->_urlString, @"username", self->_username, @"userIdentifier", self->_userIdentifier, @"service", self->_service, @"displayName", self->_displayName, 0);
  v5 = [v3 build];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke;
  v22[3] = &unk_1E56A0218;
  v22[4] = self;
  id v23 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56A0218;
  aBlock[4] = self;
  id v5 = v23;
  id v21 = v5;
  v6 = _Block_copy(aBlock);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_3;
  v18[3] = &unk_1E56A0218;
  v18[4] = self;
  id v7 = v5;
  id v19 = v7;
  v8 = _Block_copy(v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_4;
  v16[3] = &unk_1E56A0218;
  v16[4] = self;
  id v9 = v7;
  id v17 = v9;
  v10 = _Block_copy(v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__CNFoundationSocialProfile_isEqual___block_invoke_5;
  v14[3] = &unk_1E56A0218;
  v14[4] = self;
  id v15 = v9;
  id v11 = v9;
  id v12 = _Block_copy(v14);
  LOBYTE(self) = +[CNEqualsBuilder isObject:equalToOther:withBlocks:](CNEqualsBuilder, "isObject:equalToOther:withBlocks:", self, v11, v22, v6, v8, v10, v12, 0);

  return (char)self;
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 8) equalToOther:*(void *)(*(void *)(a1 + 40) + 8)];
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_2(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 16) equalToOther:*(void *)(*(void *)(a1 + 40) + 16)];
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_3(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 24) equalToOther:*(void *)(*(void *)(a1 + 40) + 24)];
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_4(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 32) equalToOther:*(void *)(*(void *)(a1 + 40) + 32)];
}

BOOL __37__CNFoundationSocialProfile_isEqual___block_invoke_5(uint64_t a1)
{
  return +[CNEqualsBuilder isObject:*(void *)(*(void *)(a1 + 32) + 40) equalToOther:*(void *)(*(void *)(a1 + 40) + 40)];
}

- (unint64_t)hash
{
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __33__CNFoundationSocialProfile_hash__block_invoke;
  v13[3] = &unk_1E56A0070;
  v13[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __33__CNFoundationSocialProfile_hash__block_invoke_2;
  aBlock[3] = &unk_1E56A0070;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__CNFoundationSocialProfile_hash__block_invoke_3;
  v11[3] = &unk_1E56A0070;
  v11[4] = self;
  id v4 = _Block_copy(v11);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __33__CNFoundationSocialProfile_hash__block_invoke_4;
  v10[3] = &unk_1E56A0070;
  v10[4] = self;
  id v5 = _Block_copy(v10);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __33__CNFoundationSocialProfile_hash__block_invoke_5;
  v9[3] = &unk_1E56A0070;
  v9[4] = self;
  v6 = _Block_copy(v9);
  unint64_t v7 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v13, v3, v4, v5, v6, 0);

  return v7;
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 8)];
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_2(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 16)];
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_3(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 24)];
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_4(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 32)];
}

unint64_t __33__CNFoundationSocialProfile_hash__block_invoke_5(uint64_t a1)
{
  return +[CNHashBuilder objectHash:*(void *)(*(void *)(a1 + 32) + 40)];
}

- (NSString)urlString
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)username
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)userIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)service
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_userIdentifier, 0);
  objc_storeStrong((id *)&self->_username, 0);

  objc_storeStrong((id *)&self->_urlString, 0);
}

@end