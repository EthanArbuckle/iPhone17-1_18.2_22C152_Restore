@interface CNCountryInformation
- (BOOL)isEqual:(id)a3;
- (CNCountryInformation)initWithISOCountryCode:(id)a3 name:(id)a4 phoneticName:(id)a5;
- (NSString)isoCountryCode;
- (NSString)name;
- (NSString)phoneticName;
- (id)description;
- (unint64_t)hash;
@end

@implementation CNCountryInformation

- (CNCountryInformation)initWithISOCountryCode:(id)a3 name:(id)a4 phoneticName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)CNCountryInformation;
  v11 = [(CNCountryInformation *)&v20 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    isoCountryCode = v11->_isoCountryCode;
    v11->_isoCountryCode = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    name = v11->_name;
    v11->_name = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    phoneticName = v11->_phoneticName;
    v11->_phoneticName = (NSString *)v16;

    v18 = v11;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __32__CNCountryInformation_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CNCountryInformation_isEqual___block_invoke_2;
  aBlock[3] = &unk_1E56B3E18;
  aBlock[4] = self;
  id v7 = v17;
  id v15 = v7;
  id v8 = _Block_copy(aBlock);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __32__CNCountryInformation_isEqual___block_invoke_3;
  v12[3] = &unk_1E56B3E18;
  v12[4] = self;
  id v13 = v7;
  id v9 = v7;
  id v10 = _Block_copy(v12);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v9, v6, self, v16, v8, v10, 0);

  return (char)self;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) isoCountryCode];
  id v4 = [*(id *)(a1 + 40) isoCountryCode];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __32__CNCountryInformation_isEqual___block_invoke_3(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) phoneticName];
  id v4 = [*(id *)(a1 + 40) phoneticName];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __28__CNCountryInformation_hash__block_invoke;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __28__CNCountryInformation_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __28__CNCountryInformation_hash__block_invoke_3;
  v8[3] = &unk_1E56B3E40;
  v8[4] = self;
  uint64_t v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __28__CNCountryInformation_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) isoCountryCode];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __28__CNCountryInformation_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __28__CNCountryInformation_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) phoneticName];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (id)description
{
  uint64_t v3 = (void *)MEMORY[0x1E4F5A3A8];
  id v4 = [(CNCountryInformation *)self isoCountryCode];
  uint64_t v5 = [(CNCountryInformation *)self name];
  unint64_t v6 = [(CNCountryInformation *)self phoneticName];
  id v7 = objc_msgSend(v3, "descriptionForObject:withNamesAndObjects:", self, @"country code", v4, @"name", v5, @"phonetic name", v6, 0);

  return v7;
}

- (NSString)isoCountryCode
{
  return self->_isoCountryCode;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)phoneticName
{
  return self->_phoneticName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_phoneticName, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_isoCountryCode, 0);
}

@end