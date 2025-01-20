@interface CNValueOrigin
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNValueOrigin)init;
- (CNValueOrigin)initWithCoder:(id)a3;
- (CNValueOrigin)initWithLocalizedApplicationName:(id)a3 donationIdentifier:(id)a4;
- (NSString)donationIdentifier;
- (NSString)localizedApplicationName;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNValueOrigin

- (CNValueOrigin)init
{
  v2 = self;
  CNInitializerUnavailableException();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

- (CNValueOrigin)initWithLocalizedApplicationName:(id)a3 donationIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNValueOrigin;
  v8 = [(CNValueOrigin *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    localizedApplicationName = v8->_localizedApplicationName;
    v8->_localizedApplicationName = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    donationIdentifier = v8->_donationIdentifier;
    v8->_donationIdentifier = (NSString *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v4 = [(CNValueOrigin *)self localizedApplicationName];
  id v5 = (id)[v3 appendName:@"localizedApplicationName" object:v4];

  id v6 = [(CNValueOrigin *)self donationIdentifier];
  id v7 = (id)[v3 appendName:@"donationIdentifier" object:v6];

  v8 = [v3 build];

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __25__CNValueOrigin_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  uint64_t v11 = __25__CNValueOrigin_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __25__CNValueOrigin_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) donationIdentifier];
  id v4 = [*(id *)(a1 + 40) donationIdentifier];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __25__CNValueOrigin_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) localizedApplicationName];
  id v4 = [*(id *)(a1 + 40) localizedApplicationName];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __21__CNValueOrigin_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __21__CNValueOrigin_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  id v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __21__CNValueOrigin_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) donationIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __21__CNValueOrigin_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) localizedApplicationName];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNValueOrigin)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"localizedApplicationName"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"donationIdentifier"];

  id v7 = [(CNValueOrigin *)self initWithLocalizedApplicationName:v5 donationIdentifier:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNValueOrigin *)self localizedApplicationName];
  [v4 encodeObject:v5 forKey:@"localizedApplicationName"];

  id v6 = [(CNValueOrigin *)self donationIdentifier];
  [v4 encodeObject:v6 forKey:@"donationIdentifier"];
}

- (NSString)localizedApplicationName
{
  return self->_localizedApplicationName;
}

- (NSString)donationIdentifier
{
  return self->_donationIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationIdentifier, 0);

  objc_storeStrong((id *)&self->_localizedApplicationName, 0);
}

@end