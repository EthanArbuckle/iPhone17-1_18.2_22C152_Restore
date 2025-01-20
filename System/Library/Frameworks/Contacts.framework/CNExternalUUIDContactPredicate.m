@interface CNExternalUUIDContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNExternalUUIDContactPredicate)initWithCoder:(id)a3;
- (CNExternalUUIDContactPredicate)initWithExternalUUIDs:(id)a3;
- (NSArray)externalUUIDs;
- (id)description;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNExternalUUIDContactPredicate

- (CNExternalUUIDContactPredicate)initWithExternalUUIDs:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNExternalUUIDContactPredicate;
  v5 = [(CNPredicate *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    externalUUIDs = v5->_externalUUIDs;
    v5->_externalUUIDs = (NSArray *)v6;

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingExternalUUIDs:]"];
  v5 = [(CNExternalUUIDContactPredicate *)self externalUUIDs];
  id v6 = (id)[v3 appendName:@"externalUUIDs" object:v5];

  v7 = [v3 build];

  return v7;
}

- (id)shortDebugDescription
{
  return @"ExternalUUIDPredicate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  id v16 = v4;
  v17 = self;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_2;
  v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

BOOL __42__CNExternalUUIDContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) externalUUIDs];
  uint64_t v3 = [v2 count];
  id v4 = [*(id *)(a1 + 40) externalUUIDs];
  BOOL v5 = v3 == [v4 count];

  return v5;
}

uint64_t __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v2 = [*(id *)(a1 + 32) externalUUIDs];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_3;
  v5[3] = &unk_1E56B4FE0;
  id v6 = *(id *)(a1 + 40);
  v7 = &v8;
  [v2 enumerateObjectsUsingBlock:v5];

  uint64_t v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __42__CNExternalUUIDContactPredicate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  v9 = [v7 externalUUIDs];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  LOBYTE(a3) = [MEMORY[0x1E4F5A3E0] isString:v8 localizedCaseInsensitiveEqualToOther:v10];
  if ((a3 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __38__CNExternalUUIDContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __38__CNExternalUUIDContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) externalUUIDs];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNExternalUUIDContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNExternalUUIDContactPredicate;
  BOOL v5 = [(CNPredicate *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_externalUUIDs"];
    uint64_t v10 = [v9 copy];
    externalUUIDs = v5->_externalUUIDs;
    v5->_externalUUIDs = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNExternalUUIDContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_externalUUIDs, @"_externalUUIDs", v5.receiver, v5.super_class);
}

- (NSArray)externalUUIDs
{
  return self->_externalUUIDs;
}

- (void).cxx_destruct
{
}

@end