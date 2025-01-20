@interface CNContactKeyValueUpdate
- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6;
- (BOOL)isEqual:(id)a3;
- (CNContactKeyValueUpdate)initWithProperty:(id)a3 value:(id)a4;
- (CNPropertyDescription)property;
- (id)description;
- (id)value;
- (unint64_t)hash;
- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4;
@end

@implementation CNContactKeyValueUpdate

- (BOOL)applyToABPerson:(void *)a3 withPropertiesContext:(id)a4 logger:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id value = self->_value;
  property = self->_property;
  id v13 = a4;
  v14 = [(CNPropertyDescription *)property key];
  [v10 applyContactUpdateOfKind:"single value" value:value property:v14];

  v15 = [(CNContactKeyValueUpdate *)self property];
  v16 = [(CNContactKeyValueUpdate *)self value];
  int v17 = [v15 setCNValue:v16 onABPerson:a3 withDependentPropertiesContext:v13 error:a6];

  if (!v17 || a6 && *a6)
  {
    id v18 = self->_value;
    v19 = [(CNPropertyDescription *)self->_property key];
    if (a6) {
      id v20 = *a6;
    }
    else {
      id v20 = 0;
    }
    [v10 failedToApplyContactUpdateOfKind:"single value" value:v18 property:v19 error:v20];
  }
  return v17;
}

- (CNContactKeyValueUpdate)initWithProperty:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNContactKeyValueUpdate;
  v9 = [(CNContactKeyValueUpdate *)&v13 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_property, a3);
    objc_storeStrong(&v10->_value, a4);
    v11 = v10;
  }

  return v10;
}

- (void)applyToMutableContact:(id)a3 withIdentifierMap:(id)a4
{
  id value = self->_value;
  property = self->_property;
  id v6 = a3;
  id v7 = [(CNPropertyDescription *)property key];
  [v6 setValue:value forKey:v7];
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E4F5A3A8], "descriptionForObject:withNamesAndObjects:", self->_property, @"value", self->_value, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __35__CNContactKeyValueUpdate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __35__CNContactKeyValueUpdate_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  objc_super v13 = self;
  id v14 = v4;
  id v6 = v4;
  id v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:equalToOther:withBlocks:", self, v6, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __35__CNContactKeyValueUpdate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) property];
  id v4 = [*(id *)(a1 + 40) property];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __35__CNContactKeyValueUpdate_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) value];
  id v4 = [*(id *)(a1 + 40) value];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __31__CNContactKeyValueUpdate_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__CNContactKeyValueUpdate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __31__CNContactKeyValueUpdate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) property];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __31__CNContactKeyValueUpdate_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) value];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (CNPropertyDescription)property
{
  return (CNPropertyDescription *)objc_getProperty(self, a2, 8, 1);
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);

  objc_storeStrong((id *)&self->_property, 0);
}

@end