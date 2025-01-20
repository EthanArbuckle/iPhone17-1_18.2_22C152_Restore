@interface CNTestSmartFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNTestSmartFetcher)initWithCoder:(id)a3;
- (CNTestSmartFetcher)initWithRequiredKeys:(id)a3 optionalKeys:(id)a4;
- (NSArray)optionalKeys;
- (NSArray)requiredKeys;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)_cn_requiredKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_cn_executeGetterForRepresentedKeys:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNTestSmartFetcher

- (CNTestSmartFetcher)initWithRequiredKeys:(id)a3 optionalKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNTestSmartFetcher;
  v8 = [(CNTestSmartFetcher *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    requiredKeys = v8->_requiredKeys;
    v8->_requiredKeys = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    optionalKeys = v8->_optionalKeys;
    v8->_optionalKeys = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNTestSmartFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNTestSmartFetcher;
  v5 = [(CNTestSmartFetcher *)&v18 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"requiredKeys"];
    requiredKeys = v5->_requiredKeys;
    v5->_requiredKeys = (NSArray *)v9;

    uint64_t v11 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v12 = objc_opt_class();
    v13 = objc_msgSend(v11, "setWithObjects:", v12, objc_opt_class(), 0);
    uint64_t v14 = [v4 decodeObjectOfClasses:v13 forKey:@"optionalKeys"];
    optionalKeys = v5->_optionalKeys;
    v5->_optionalKeys = (NSArray *)v14;

    v16 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  requiredKeys = self->_requiredKeys;
  id v5 = a3;
  [v5 encodeObject:requiredKeys forKey:@"requiredKeys"];
  [v5 encodeObject:self->_optionalKeys forKey:@"optionalKeys"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [CNTestSmartFetcher alloc];
  id v5 = [(CNTestSmartFetcher *)self requiredKeys];
  id v6 = [(CNTestSmartFetcher *)self optionalKeys];
  uint64_t v7 = [(CNTestSmartFetcher *)v4 initWithRequiredKeys:v5 optionalKeys:v6];

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __30__CNTestSmartFetcher_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __30__CNTestSmartFetcher_isEqual___block_invoke_2;
  v13 = &unk_1E56B3E18;
  uint64_t v14 = self;
  id v15 = v4;
  id v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

uint64_t __30__CNTestSmartFetcher_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) requiredKeys];
  id v4 = [*(id *)(a1 + 40) requiredKeys];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __30__CNTestSmartFetcher_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) optionalKeys];
  id v4 = [*(id *)(a1 + 40) optionalKeys];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __26__CNTestSmartFetcher_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __26__CNTestSmartFetcher_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __26__CNTestSmartFetcher_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) requiredKeys];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __26__CNTestSmartFetcher_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) optionalKeys];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (uint64_t (**)(id, void))a3;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v5 = [(CNTestSmartFetcher *)self requiredKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (id)v4[2](v4, *(void *)(*((void *)&v21 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = [(CNTestSmartFetcher *)self optionalKeys];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = (id)v4[2](v4, *(void *)(*((void *)&v17 + 1) + 8 * v15++));
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
}

- (id)_cn_requiredKeys
{
  v2 = [(CNTestSmartFetcher *)self requiredKeys];
  uint64_t v3 = +[CNContactKeyVector keyVectorWithKeys:v2];

  return v3;
}

- (id)_cn_optionalKeys
{
  v2 = [(CNTestSmartFetcher *)self optionalKeys];
  uint64_t v3 = +[CNContactKeyVector keyVectorWithKeys:v2];

  return v3;
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

- (NSArray)requiredKeys
{
  return self->_requiredKeys;
}

- (NSArray)optionalKeys
{
  return self->_optionalKeys;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_optionalKeys, 0);

  objc_storeStrong((id *)&self->_requiredKeys, 0);
}

@end