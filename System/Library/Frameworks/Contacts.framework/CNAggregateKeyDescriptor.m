@interface CNAggregateKeyDescriptor
+ (BOOL)supportsSecureCoding;
+ (id)keyDescriptorWithKeyDescriptors:(id)a3 description:(id)a4;
- (BOOL)isEqual:(id)a3;
- (CNAggregateKeyDescriptor)initWithCoder:(id)a3;
- (CNAggregateKeyDescriptor)initWithKeyDescriptors:(id)a3 description:(id)a4;
- (CNContactKeyVector)unauthorizedKeys;
- (NSArray)keyDescriptors;
- (NSString)description;
- (NSString)privateDescription;
- (id)_cn_ignorableKeys;
- (id)_cn_optionalKeys;
- (id)_cn_recursiveDescriptionWithPrefix:(id)a3;
- (id)_cn_requiredKeys;
- (id)_recursiveDescription;
- (unint64_t)hash;
- (void)_cn_executeGetterForRepresentedKeys:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setKeyDescriptors:(id)a3;
- (void)setPrivateDescription:(id)a3;
- (void)setUnauthorizedKeys:(id)a3;
@end

@implementation CNAggregateKeyDescriptor

- (id)_cn_requiredKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(CNAggregateKeyDescriptor *)self keyDescriptors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_cn_requiredKeys");
        [v3 unionKeyVector:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return v10;
}

- (NSArray)keyDescriptors
{
  return self->_keyDescriptors;
}

uint64_t __32__CNAggregateKeyDescriptor_hash__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) privateDescription];
  uint64_t v2 = [v1 hash];

  return v2;
}

- (NSString)privateDescription
{
  return self->_privateDescription;
}

- (unint64_t)hash
{
  uint64_t v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CNAggregateKeyDescriptor_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __32__CNAggregateKeyDescriptor_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __32__CNAggregateKeyDescriptor_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) keyDescriptors];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

- (id)_cn_ignorableKeys
{
  return +[CNAccessAuthorization allAuthorizationKeysVector];
}

- (id)_cn_optionalKeys
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v4 = [(CNAggregateKeyDescriptor *)self keyDescriptors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_cn_optionalKeys");
        [v3 unionKeyVector:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  v10 = (void *)[v3 copy];

  return v10;
}

- (CNContactKeyVector)unauthorizedKeys
{
  return self->_unauthorizedKeys;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v6 = objc_opt_class();
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __36__CNAggregateKeyDescriptor_isEqual___block_invoke;
  v16[3] = &unk_1E56B3E18;
  v16[4] = self;
  id v17 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __36__CNAggregateKeyDescriptor_isEqual___block_invoke_2;
  long long v13 = &unk_1E56B3E18;
  long long v14 = self;
  id v15 = v4;
  id v7 = v4;
  v8 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:kindOfClass:andEqualToObject:withBlocks:", v7, v6, self, v16, v8, 0, aBlock, v11, v12, v13, v14);

  return (char)self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unauthorizedKeys, 0);
  objc_storeStrong((id *)&self->_privateDescription, 0);

  objc_storeStrong((id *)&self->_keyDescriptors, 0);
}

- (void)encodeWithCoder:(id)a3
{
  keyDescriptors = self->_keyDescriptors;
  id v5 = a3;
  [v5 encodeObject:keyDescriptors forKey:@"_keyDescriptors"];
  [v5 encodeObject:self->_privateDescription forKey:@"_privateDescription"];
}

+ (id)keyDescriptorWithKeyDescriptors:(id)a3 description:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[objc_alloc((Class)a1) initWithKeyDescriptors:v7 description:v6];

  return v8;
}

- (CNAggregateKeyDescriptor)initWithKeyDescriptors:(id)a3 description:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CNAggregateKeyDescriptor;
  v8 = [(CNAggregateKeyDescriptor *)&v12 init];
  v9 = v8;
  if (v8)
  {
    [(CNAggregateKeyDescriptor *)v8 setKeyDescriptors:v6];
    [(CNAggregateKeyDescriptor *)v9 setPrivateDescription:v7];
    v10 = v9;
  }

  return v9;
}

- (void)setPrivateDescription:(id)a3
{
}

- (void)setKeyDescriptors:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNAggregateKeyDescriptor)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CNAggregateKeyDescriptor;
  id v5 = [(CNAggregateKeyDescriptor *)&v15 init];
  if (v5)
  {
    id v6 = +[CNSecureCodingClassSets keyDescriptorClasses];
    id v7 = [v4 decodeObjectOfClasses:v6 forKey:@"_keyDescriptors"];
    uint64_t v8 = [v7 copy];
    keyDescriptors = v5->_keyDescriptors;
    v5->_keyDescriptors = (NSArray *)v8;

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_privateDescription"];
    uint64_t v11 = [v10 copy];
    privateDescription = v5->_privateDescription;
    v5->_privateDescription = (NSString *)v11;

    long long v13 = v5;
  }

  return v5;
}

- (void)setUnauthorizedKeys:(id)a3
{
}

uint64_t __36__CNAggregateKeyDescriptor_isEqual___block_invoke(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) keyDescriptors];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) keyDescriptors];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) keyDescriptors];
  id v5 = [*(id *)(a1 + 40) keyDescriptors];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

uint64_t __36__CNAggregateKeyDescriptor_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = [*(id *)(a1 + 32) privateDescription];
  if (!v3)
  {
    v1 = [*(id *)(a1 + 40) privateDescription];
    if (!v1)
    {
      uint64_t v6 = 1;
LABEL_6:

      goto LABEL_7;
    }
  }
  id v4 = [*(id *)(a1 + 32) privateDescription];
  id v5 = [*(id *)(a1 + 40) privateDescription];
  uint64_t v6 = [v4 isEqual:v5];

  if (!v3) {
    goto LABEL_6;
  }
LABEL_7:

  return v6;
}

- (NSString)description
{
  uint64_t v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNAggregateKeyDescriptor *)self privateDescription];
  id v5 = (id)[v3 appendName:@"kind" object:v4];

  uint64_t v6 = [(CNAggregateKeyDescriptor *)self unauthorizedKeys];

  if (v6)
  {
    id v7 = [(CNAggregateKeyDescriptor *)self unauthorizedKeys];
    id v8 = (id)[v3 appendName:@"unauthorized keys" object:v7];
  }
  v9 = [v3 build];

  return (NSString *)v9;
}

- (id)_recursiveDescription
{
  return [(CNAggregateKeyDescriptor *)self _cn_recursiveDescriptionWithPrefix:&stru_1EE052B80];
}

- (id)_cn_recursiveDescriptionWithPrefix:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F28E78] string];
  [v5 appendString:v4];
  uint64_t v6 = [(CNAggregateKeyDescriptor *)self description];
  [v5 appendString:v6];

  [v5 appendString:@"\n"];
  v18 = v4;
  id v7 = [v4 stringByAppendingString:@"\t"];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [(CNAggregateKeyDescriptor *)self keyDescriptors];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          long long v14 = objc_msgSend(v13, "_cn_recursiveDescriptionWithPrefix:", v7);
        }
        else
        {
          objc_super v15 = [v13 description];
          long long v14 = [v7 stringByAppendingString:v15];
        }
        [v5 appendString:v14];
        [v5 appendString:@"\n"];
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  v16 = (void *)[v5 copy];

  return v16;
}

- (void)_cn_executeGetterForRepresentedKeys:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(CNAggregateKeyDescriptor *)self keyDescriptors];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "_cn_executeGetterForRepresentedKeys:", v4);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end