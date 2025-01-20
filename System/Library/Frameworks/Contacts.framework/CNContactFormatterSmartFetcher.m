@interface CNContactFormatterSmartFetcher
+ (BOOL)supportsSecureCoding;
- (BOOL)ignoresNickname;
- (BOOL)ignoresOrganization;
- (BOOL)isEqual:(id)a3;
- (CNContactFormatterSmartFetcher)init;
- (CNContactFormatterSmartFetcher)initWithCoder:(id)a3;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)_cn_requiredKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_cn_executeGetterForRepresentedKeys:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setIgnoresNickname:(BOOL)a3;
- (void)setIgnoresOrganization:(BOOL)a3;
- (void)setupNameKeys;
@end

@implementation CNContactFormatterSmartFetcher

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__CNContactFormatterSmartFetcher_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__CNContactFormatterSmartFetcher_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __42__CNContactFormatterSmartFetcher_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __42__CNContactFormatterSmartFetcher_isEqual___block_invoke_2;
  v13 = &unk_1E56B3E18;
  v14 = self;
  id v15 = v4;
  id v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

void __50__CNContactFormatterSmartFetcher__cn_requiredKeys__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addKey:v3];
}

uint64_t __38__CNContactFormatterSmartFetcher_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) ignoresOrganization];

  return [v1 BOOLHash:v2];
}

uint64_t __38__CNContactFormatterSmartFetcher_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) ignoresNickname];

  return [v1 BOOLHash:v2];
}

- (id)_cn_optionalKeys
{
  v17[3] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if (self) {
    fallBackNamePropertyByNameKey = self->_fallBackNamePropertyByNameKey;
  }
  else {
    fallBackNamePropertyByNameKey = 0;
  }
  v5 = fallBackNamePropertyByNameKey;
  uint64_t v6 = [(NSDictionary *)v5 allValues];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke;
  v13[3] = &unk_1E56B8408;
  id v7 = v3;

  id v14 = v7;
  objc_msgSend(v6, "_cn_each:", v13);

  v17[0] = @"contactType";
  v17[1] = @"emailAddresses";
  v17[2] = @"phoneNumbers";
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:3];
  [v7 addObjectsFromArray:v8];

  if (![(CNContactFormatterSmartFetcher *)self ignoresNickname])
  {
    v16 = @"nickname";
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    [v7 addObjectsFromArray:v9];
  }
  if (![(CNContactFormatterSmartFetcher *)self ignoresOrganization])
  {
    id v15 = @"organizationName";
    v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
    [v7 addObjectsFromArray:v10];
  }
  uint64_t v11 = +[CNContactKeyVector keyVectorWithKeys:v7];

  return v11;
}

- (BOOL)ignoresOrganization
{
  return self->_ignoresOrganization;
}

- (BOOL)ignoresNickname
{
  return self->_ignoresNickname;
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 nameProperties];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_3;
  v4[3] = &unk_1E56B8340;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  objc_msgSend(v3, "_cn_each:", v4);
}

- (void)setIgnoresOrganization:(BOOL)a3
{
  self->_ignoresOrganization = a3;
}

- (void)setIgnoresNickname:(BOOL)a3
{
  self->_ignoresNickname = a3;
}

- (CNContactFormatterSmartFetcher)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNContactFormatterSmartFetcher;
  uint64_t v2 = [(CNContactFormatterSmartFetcher *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    -[CNContactFormatterSmartFetcher setupNameKeys](v2);
    id v4 = v3;
  }

  return v3;
}

- (void)setupNameKeys
{
  v19[2] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
    id v3 = [MEMORY[0x1E4F1CA60] dictionary];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke;
    aBlock[3] = &unk_1E56B8318;
    id v18 = v3;
    id v4 = v3;
    id v5 = _Block_copy(aBlock);
    objc_super v6 = +[CN requiredPropertiesForNameScriptDetection];
    [v2 addObjectsFromArray:v6];

    id v7 = +[CNContactNameOrderImpl givenNameFirstOrder];
    v19[0] = v7;
    v8 = +[CNContactNameOrderImpl familyNameFirstOrder];
    v19[1] = v8;
    v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_2;
    v14[3] = &unk_1E56B8368;
    id v15 = v2;
    id v16 = v5;
    id v10 = v5;
    id v11 = v2;
    objc_msgSend(v9, "_cn_each:", v14);

    objc_setProperty_nonatomic_copy(a1, v12, v11, 16);
    objc_setProperty_nonatomic_copy(a1, v13, v4, 24);
  }
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [*(id *)(a1 + 32) addObject:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 count])
    {
      id v3 = [v6 objectAtIndexedSubscript:0];
      [*(id *)(a1 + 32) addObject:v3];
      if ((unint64_t)[v6 count] >= 2)
      {
        uint64_t v4 = *(void *)(a1 + 40);
        id v5 = objc_msgSend(v6, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 1);
        (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);
      }
    }
  }
}

- (CNContactFormatterSmartFetcher)initWithCoder:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)CNContactFormatterSmartFetcher;
  id v5 = [(CNSmartPropertyFetcher *)&v24 initWithCoder:v4];
  if (v5)
  {
    v5->_ignoresNickname = [v4 decodeBoolForKey:@"ignoresNickname"];
    v5->_ignoresOrganization = [v4 decodeBoolForKey:@"ignoresOrganization"];
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    v9 = objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    id v10 = [v4 decodeObjectOfClasses:v9 forKey:@"mandatoryNameProperties"];
    uint64_t v11 = [v10 copy];
    mandatoryNameProperties = v5->_mandatoryNameProperties;
    v5->_mandatoryNameProperties = (NSSet *)v11;

    SEL v13 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    id v18 = objc_msgSend(v13, "setWithObjects:", v14, v15, v16, v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v18 forKey:@"fallBackNamePropertyByNameKey"];
    uint64_t v20 = [v19 copy];
    fallBackNamePropertyByNameKey = v5->_fallBackNamePropertyByNameKey;
    v5->_fallBackNamePropertyByNameKey = (NSDictionary *)v20;

    v22 = v5;
  }

  return v5;
}

- (id)_cn_requiredKeys
{
  id v3 = +[CNContactKeyVector keyVectorWithKey:@"contactType"];
  if (self) {
    self = (CNContactFormatterSmartFetcher *)self->_mandatoryNameProperties;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __50__CNContactFormatterSmartFetcher__cn_requiredKeys__block_invoke;
  v7[3] = &unk_1E56B5988;
  id v8 = v3;
  id v4 = v3;
  [(CNContactFormatterSmartFetcher *)self enumerateObjectsUsingBlock:v7];
  id v5 = (void *)[v4 copy];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fallBackNamePropertyByNameKey, 0);

  objc_storeStrong((id *)&self->_mandatoryNameProperties, 0);
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactFormatterSmartFetcher;
  id v4 = a3;
  [(CNSmartPropertyFetcher *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_ignoresNickname, @"ignoresNickname", v5.receiver, v5.super_class);
  [v4 encodeBool:self->_ignoresOrganization forKey:@"ignoresOrganization"];
  [v4 encodeObject:self->_mandatoryNameProperties forKey:@"mandatoryNameProperties"];
  [v4 encodeObject:self->_fallBackNamePropertyByNameKey forKey:@"fallBackNamePropertyByNameKey"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNContactFormatterSmartFetcher;
  id v4 = [(CNSmartPropertyFetcher *)&v9 copyWithZone:a3];
  objc_msgSend(v4, "setIgnoresNickname:", -[CNContactFormatterSmartFetcher ignoresNickname](self, "ignoresNickname"));
  objc_msgSend(v4, "setIgnoresOrganization:", -[CNContactFormatterSmartFetcher ignoresOrganization](self, "ignoresOrganization"));
  if (self)
  {
    mandatoryNameProperties = self->_mandatoryNameProperties;
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  mandatoryNameProperties = 0;
  if (v4) {
LABEL_3:
  }
    objc_setProperty_nonatomic_copy(v4, v5, mandatoryNameProperties, 16);
LABEL_4:
  if (!self)
  {
    fallBackNamePropertyByNameKey = 0;
    if (!v4) {
      return v4;
    }
    goto LABEL_6;
  }
  fallBackNamePropertyByNameKey = self->_fallBackNamePropertyByNameKey;
  if (v4) {
LABEL_6:
  }
    objc_setProperty_nonatomic_copy(v4, v5, fallBackNamePropertyByNameKey, 24);
  return v4;
}

uint64_t __42__CNContactFormatterSmartFetcher_isEqual___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) ignoresNickname];
  return v2 ^ [*(id *)(a1 + 40) ignoresNickname] ^ 1;
}

uint64_t __42__CNContactFormatterSmartFetcher_isEqual___block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) ignoresOrganization];
  return v2 ^ [*(id *)(a1 + 40) ignoresOrganization] ^ 1;
}

void __47__CNContactFormatterSmartFetcher_setupNameKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a3;
  objc_super v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v6 key];
  id v8 = [v5 objectForKeyedSubscript:v7];

  objc_super v9 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v10 = v9;
  if (v8) {
    [v9 unionOrderedSet:v8];
  }
  [v10 addObjectsFromArray:v14];
  uint64_t v11 = (void *)[v10 copy];
  SEL v12 = *(void **)(a1 + 32);
  SEL v13 = [v6 key];

  [v12 setObject:v11 forKeyedSubscript:v13];
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  id v4 = a3;
  uint64_t v23 = 0;
  objc_super v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  if (self) {
    mandatoryNameProperties = self->_mandatoryNameProperties;
  }
  else {
    mandatoryNameProperties = 0;
  }
  id v6 = mandatoryNameProperties;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke;
  v20[3] = &unk_1E56B83B8;
  id v7 = v4;
  v20[4] = self;
  id v21 = v7;
  v22 = &v23;
  [(NSSet *)v6 enumerateObjectsUsingBlock:v20];

  id v8 = (*((void (**)(id, __CFString *))v7 + 2))(v7, @"contactType");
  uint64_t v9 = [v8 integerValue];

  BOOL v10 = [(CNContactFormatterSmartFetcher *)self ignoresOrganization];
  int v11 = v9 != 1 || v10;
  if ((v11 & 1) != 0
    || ((*((void (**)(id, __CFString *))v7 + 2))(v7, @"organizationName"),
        SEL v12 = objc_claimAutoreleasedReturnValue(),
        char v13 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))(),
        v12,
        (v13 & 1) != 0))
  {
    if (!*((unsigned char *)v24 + 24))
    {
      if ([(CNContactFormatterSmartFetcher *)self ignoresNickname]
        || ((*((void (**)(id, __CFString *))v7 + 2))(v7, @"nickname"),
            id v14 = objc_claimAutoreleasedReturnValue(),
            int v15 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))(),
            v14,
            v15))
      {
        if (!v11
          || [(CNContactFormatterSmartFetcher *)self ignoresOrganization]
          || ((*((void (**)(id, __CFString *))v7 + 2))(v7, @"organizationName"),
              uint64_t v16 = objc_claimAutoreleasedReturnValue(),
              int v17 = (*(uint64_t (**)(void))(*MEMORY[0x1E4F5A298] + 16))(),
              v16,
              v17))
        {
          id v18 = (*((void (**)(id, __CFString *))v7 + 2))(v7, @"emailAddresses");
          if (![v18 count]) {
            id v19 = (id)(*((uint64_t (**)(id, __CFString *))v7 + 2))(v7, @"phoneNumbers");
          }
        }
      }
    }
  }

  _Block_object_dispose(&v23, 8);
}

void __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 key];
  uint64_t v4 = *MEMORY[0x1E4F5A298];
  objc_super v5 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  LODWORD(v4) = (*(uint64_t (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id v7 = *(void **)(v6 + 24);
    }
    else {
      id v7 = 0;
    }
    id v8 = [v7 objectForKeyedSubscript:v3];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke_2;
    v11[3] = &unk_1E56B8390;
    id v9 = *(id *)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v12 = v9;
    uint64_t v13 = v10;
    [v8 enumerateObjectsUsingBlock:v11];
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __70__CNContactFormatterSmartFetcher__cn_executeGetterForRepresentedKeys___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *MEMORY[0x1E4F5A298];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = [a2 key];
  id v9 = (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v8);
  LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *))(v6 + 16))(v6, v9);

  if ((v6 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

void __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke_2;
  v3[3] = &unk_1E56B83E0;
  id v4 = *(id *)(a1 + 32);
  [a2 enumerateObjectsUsingBlock:v3];
}

void __50__CNContactFormatterSmartFetcher__cn_optionalKeys__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = *(void **)(a1 + 32);
  id v3 = [a2 key];
  [v2 addObject:v3];
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

@end