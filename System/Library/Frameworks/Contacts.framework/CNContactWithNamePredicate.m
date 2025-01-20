@interface CNContactWithNamePredicate
+ (BOOL)doesPerson:(id)a3 matchName:(id)a4;
+ (BOOL)supportsSecureCoding;
+ (id)descriptionForOptions:(unint64_t)a3;
- (BOOL)isEqual:(id)a3;
- (CNContactWithNamePredicate)initWithCoder:(id)a3;
- (CNContactWithNamePredicate)initWithName:(id)a3;
- (CNContactWithNamePredicate)initWithName:(id)a3 options:(unint64_t)a4;
- (NSString)description;
- (NSString)name;
- (id)contactsFromCLSDataStore:(id)a3;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (unint64_t)hash;
- (unint64_t)options;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactWithNamePredicate

- (id)contactsFromCLSDataStore:(id)a3
{
  id v4 = a3;
  v5 = [(CNContactWithNamePredicate *)self name];
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F19618]) initWithOptions:1 behaviors:1 searchString:v5];
    v7 = +[CNClassKitServices objectsMatching:v6 fromStore:v4];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke;
    v10[3] = &unk_1E56B5030;
    v10[4] = self;
    v8 = [v7 map:v10];
  }
  else
  {
    v8 = [MEMORY[0x1E4F5A4E0] successWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v8;
}

id __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke(uint64_t a1, void *a2)
{
  v3 = objc_msgSend(a2, "_cn_filter:", CLSObjectIsPerson);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke_2;
  v7[3] = &unk_1E56B5008;
  v7[4] = *(void *)(a1 + 32);
  id v4 = objc_msgSend(v3, "_cn_filter:", v7);

  v5 = objc_msgSend(v4, "_cn_map:", CLSPersonToCNContactTransform);

  return v5;
}

uint64_t __61__CNContactWithNamePredicate_MAID__contactsFromCLSDataStore___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = objc_opt_class();
  v5 = [*(id *)(a1 + 32) name];
  uint64_t v6 = [v4 doesPerson:v3 matchName:v5];

  return v6;
}

+ (BOOL)doesPerson:(id)a3 matchName:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_msgSend(a4, "_cn_tokens");
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__CNContactWithNamePredicate_MAID__doesPerson_matchName___block_invoke;
  v10[3] = &unk_1E56B4F68;
  id v11 = v5;
  id v7 = v5;
  char v8 = objc_msgSend(v6, "_cn_all:", v10);

  return v8;
}

uint64_t __57__CNContactWithNamePredicate_MAID__doesPerson_matchName___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) givenName];
  if (objc_msgSend(v4, "_cn_hasPrefix:", v3))
  {
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) middleName];
    if (objc_msgSend(v6, "_cn_hasPrefix:", v3))
    {
      uint64_t v5 = 1;
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) familyName];
      uint64_t v5 = objc_msgSend(v7, "_cn_hasPrefix:", v3);
    }
  }

  return v5;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  id v8 = a5;
  v9 = [(CNContactWithNamePredicate *)self name];
  v10 = [v8 suggestContactMatchesWithMessagingPrefix:v9 limitTo:-1 error:a6];

  return v10;
}

- (CNContactWithNamePredicate)initWithName:(id)a3
{
  return [(CNContactWithNamePredicate *)self initWithName:a3 options:3];
}

- (CNContactWithNamePredicate)initWithName:(id)a3 options:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactWithNamePredicate;
  id v7 = [(CNPredicate *)&v12 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    name = v7->_name;
    v7->_name = (NSString *)v8;

    v7->_options = a4;
    v10 = v7;
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNContactWithNamePredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNContactWithNamePredicate;
  uint64_t v5 = [(CNPredicate *)&v11 init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_name"];
    uint64_t v7 = [v6 copy];
    name = v5->_name;
    v5->_name = (NSString *)v7;

    v9 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactWithNamePredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_name, @"_name", v5.receiver, v5.super_class);
}

- (NSString)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingName:]"];
  objc_super v5 = [(CNContactWithNamePredicate *)self name];
  id v6 = (id)[v3 appendName:@"name" object:v5];

  uint64_t v7 = objc_msgSend((id)objc_opt_class(), "descriptionForOptions:", -[CNContactWithNamePredicate options](self, "options"));
  id v8 = (id)[v3 appendName:@"options" object:v7];

  v9 = [v3 build];

  return (NSString *)v9;
}

+ (id)descriptionForOptions:(unint64_t)a3
{
  char v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  objc_super v5 = v4;
  if ((v3 & 2) != 0) {
    [v4 addObject:@"prefix"];
  }
  if (v3) {
    [v5 addObject:@"cd-insensitive"];
  }
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v6 = @"none";
  }
  else
  {
    id v6 = [v5 componentsJoinedByString:@","];
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_super v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__CNContactWithNamePredicate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  v15[4] = self;
  id v16 = v4;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  objc_super v11 = __38__CNContactWithNamePredicate_isEqual___block_invoke_2;
  objc_super v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  uint64_t v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

uint64_t __38__CNContactWithNamePredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  char v3 = [*(id *)(a1 + 32) name];
  id v4 = [*(id *)(a1 + 40) name];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

uint64_t __38__CNContactWithNamePredicate_isEqual___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  uint64_t v3 = [*(id *)(a1 + 32) options];
  uint64_t v4 = [*(id *)(a1 + 40) options];

  return [v2 isInteger:v3 equalToOther:v4];
}

- (unint64_t)hash
{
  v2 = (void *)MEMORY[0x1E4F5A418];
  aBlock[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CNContactWithNamePredicate_hash__block_invoke;
  v7[3] = &unk_1E56B3E40;
  v7[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__CNContactWithNamePredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  uint64_t v3 = _Block_copy(aBlock);
  unint64_t v4 = objc_msgSend(v2, "hashWithBlocks:", v7, v3, 0);

  return v4;
}

uint64_t __34__CNContactWithNamePredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) name];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

uint64_t __34__CNContactWithNamePredicate_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) options];

  return [v1 unsignedIntegerHash:v2];
}

- (NSString)name
{
  return self->_name;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
}

@end