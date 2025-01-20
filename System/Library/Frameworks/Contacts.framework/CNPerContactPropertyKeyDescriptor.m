@interface CNPerContactPropertyKeyDescriptor
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNPerContactPropertyKeyDescriptor)init;
- (CNPerContactPropertyKeyDescriptor)initWithCoder:(id)a3;
- (NSMutableDictionary)propertiesByIdentifier;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)_cn_requiredKeys;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)_cn_executeGetterForRepresentedKeys:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeysToFetch:(id)a3 forContactIdentifier:(id)a4;
- (void)setPropertiesByIdentifier:(id)a3;
@end

@implementation CNPerContactPropertyKeyDescriptor

- (CNPerContactPropertyKeyDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)CNPerContactPropertyKeyDescriptor;
  v2 = [(CNPerContactPropertyKeyDescriptor *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    propertiesByIdentifier = v2->_propertiesByIdentifier;
    v2->_propertiesByIdentifier = v3;
  }
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNPerContactPropertyKeyDescriptor)initWithCoder:(id)a3
{
  if (self)
  {
    v4 = (void *)MEMORY[0x1E4F1CAD0];
    id v5 = a3;
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v4, "setWithObjects:", v6, v7, objc_opt_class(), 0);
    v9 = [v5 decodeObjectOfClasses:v8 forKey:@"propertiesByIdentifier"];

    propertiesByIdentifier = self->_propertiesByIdentifier;
    self->_propertiesByIdentifier = v9;
  }
  return self;
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__CNPerContactPropertyKeyDescriptor_isEqual___block_invoke;
  v9[3] = &unk_1E56B3E18;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v9, 0);

  return (char)self;
}

uint64_t __45__CNPerContactPropertyKeyDescriptor_isEqual___block_invoke(uint64_t a1)
{
  v3 = [*(id *)(a1 + 32) propertiesByIdentifier];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) propertiesByIdentifier];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) propertiesByIdentifier];
  id v5 = [*(id *)(a1 + 40) propertiesByIdentifier];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__CNPerContactPropertyKeyDescriptor_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __41__CNPerContactPropertyKeyDescriptor_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) propertiesByIdentifier];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

- (void)setKeysToFetch:(id)a3 forContactIdentifier:(id)a4
{
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, __CFString *))a3;
  id v5 = v4[2](v4, @"identifier");
  uint64_t v6 = [(NSMutableDictionary *)self->_propertiesByIdentifier objectForKey:v5];
  if (!v6)
  {
    id v7 = v4[2](v4, @"linkIdentifier");
    uint64_t v6 = [(NSMutableDictionary *)self->_propertiesByIdentifier objectForKey:v7];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = (id)((uint64_t (*)(id, void))v4[2])(v4, *(void *)(*((void *)&v14 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (id)_cn_requiredKeys
{
  return +[CNContactKeyVector keyVectorWithKey:@"identifier"];
}

- (id)_cn_optionalKeys
{
  v2 = [(NSMutableDictionary *)self->_propertiesByIdentifier allValues];
  uint64_t v3 = objc_msgSend(v2, "_cn_flatten");
  id v4 = +[CNContactKeyVector keyVectorWithKeys:v3];

  return v4;
}

- (id)_cn_ignorableKeys
{
  return +[CNContactKeyVector keyVector];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(CNPerContactPropertyKeyDescriptor);
  id v5 = (void *)[(NSMutableDictionary *)self->_propertiesByIdentifier mutableCopy];
  [(CNPerContactPropertyKeyDescriptor *)v4 setPropertiesByIdentifier:v5];

  return v4;
}

- (NSMutableDictionary)propertiesByIdentifier
{
  return self->_propertiesByIdentifier;
}

- (void)setPropertiesByIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end