@interface CNEmailAddressContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_hasHighSpecificity;
- (BOOL)isEqual:(id)a3;
- (BOOL)returnsMultipleResults;
- (CNEmailAddressContactPredicate)initWithCoder:(id)a3;
- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 groupIdentifiers:(id)a4 returnMultipleResults:(BOOL)a5;
- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 returnMultipleResults:(BOOL)a4;
- (NSArray)emailAddresses;
- (NSArray)groupIdentifiers;
- (NSString)description;
- (id)contactsFromCLSDataStore:(id)a3;
- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNEmailAddressContactPredicate

- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 returnMultipleResults:(BOOL)a4
{
  return [(CNEmailAddressContactPredicate *)self initWithEmailAddress:a3 groupIdentifiers:0 returnMultipleResults:a4];
}

- (CNEmailAddressContactPredicate)initWithEmailAddress:(id)a3 groupIdentifiers:(id)a4 returnMultipleResults:(BOOL)a5
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)CNEmailAddressContactPredicate;
  v10 = [(CNPredicate *)&v16 init];
  if (v10)
  {
    if (v8)
    {
      v17[0] = v8;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    }
    else
    {
      v11 = 0;
    }
    objc_storeStrong((id *)&v10->_emailAddresses, v11);
    if (v8) {

    }
    uint64_t v12 = [v9 copy];
    groupIdentifiers = v10->_groupIdentifiers;
    v10->_groupIdentifiers = (NSArray *)v12;

    v10->_returnsMultipleResults = a5;
    v14 = v10;
  }

  return v10;
}

- (BOOL)cn_hasHighSpecificity
{
  v2 = [(CNEmailAddressContactPredicate *)self emailAddresses];
  v3 = [v2 firstObject];
  char v4 = [v3 containsString:@"@"];

  return v4;
}

- (NSArray)emailAddresses
{
  return self->_emailAddresses;
}

- (NSArray)groupIdentifiers
{
  return self->_groupIdentifiers;
}

- (BOOL)returnsMultipleResults
{
  return self->_returnsMultipleResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifiers, 0);

  objc_storeStrong((id *)&self->_emailAddresses, 0);
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingEmailAddresses:]"];
  v5 = [(CNEmailAddressContactPredicate *)self emailAddresses];
  id v6 = (id)[v3 appendName:@"emailAddresses" object:v5];

  v7 = [v3 build];

  return (NSString *)v7;
}

- (id)shortDebugDescription
{
  return @"EmailPredicate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F5A3E0];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __42__CNEmailAddressContactPredicate_isEqual___block_invoke;
  v15[3] = &unk_1E56B3E18;
  id v16 = v4;
  v17 = self;
  uint64_t aBlock = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __42__CNEmailAddressContactPredicate_isEqual___block_invoke_2;
  uint64_t v12 = &unk_1E56B3E18;
  v13 = self;
  id v14 = v16;
  id v6 = v16;
  v7 = _Block_copy(&aBlock);
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v15, v7, 0, aBlock, v10, v11, v12, v13);

  return (char)self;
}

BOOL __42__CNEmailAddressContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) emailAddresses];
  uint64_t v3 = [v2 count];
  id v4 = [*(id *)(a1 + 40) emailAddresses];
  BOOL v5 = v3 == [v4 count];

  return v5;
}

uint64_t __42__CNEmailAddressContactPredicate_isEqual___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 1;
  v2 = [*(id *)(a1 + 32) emailAddresses];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__CNEmailAddressContactPredicate_isEqual___block_invoke_3;
  v5[3] = &unk_1E56B4FE0;
  id v6 = *(id *)(a1 + 40);
  v7 = &v8;
  [v2 enumerateObjectsUsingBlock:v5];

  uint64_t v3 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v3;
}

void __42__CNEmailAddressContactPredicate_isEqual___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 emailAddresses];
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
  uint64_t v3 = (void *)MEMORY[0x1E4F5A418];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke;
  v10[3] = &unk_1E56B3E40;
  v10[4] = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke_2;
  aBlock[3] = &unk_1E56B3E40;
  aBlock[4] = self;
  id v4 = _Block_copy(aBlock);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__CNEmailAddressContactPredicate_hash__block_invoke_3;
  v8[3] = &unk_1E56B3E40;
  v8[4] = self;
  BOOL v5 = _Block_copy(v8);
  unint64_t v6 = objc_msgSend(v3, "hashWithBlocks:", v10, v4, v5, 0);

  return v6;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) emailAddresses];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke_2(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) groupIdentifiers];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

uint64_t __38__CNEmailAddressContactPredicate_hash__block_invoke_3(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  uint64_t v2 = [*(id *)(a1 + 32) returnsMultipleResults];

  return [v1 BOOLHash:v2];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNEmailAddressContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CNEmailAddressContactPredicate;
  BOOL v5 = [(CNPredicate *)&v20 initWithCoder:v4];
  if (v5)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    id v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_emailAddresses"];
    uint64_t v10 = [v9 copy];
    emailAddresses = v5->_emailAddresses;
    v5->_emailAddresses = (NSArray *)v10;

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    id v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    v15 = [v4 decodeObjectOfClasses:v14 forKey:@"_groupIdentifiers"];
    uint64_t v16 = [v15 copy];
    groupIdentifiers = v5->_groupIdentifiers;
    v5->_groupIdentifiers = (NSArray *)v16;

    v5->_returnsMultipleResults = [v4 decodeBoolForKey:@"_returnsMultipleResults"];
    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNEmailAddressContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_emailAddresses, @"_emailAddresses", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_groupIdentifiers forKey:@"_groupIdentifiers"];
  [v4 encodeBool:self->_returnsMultipleResults forKey:@"_returnsMultipleResults"];
}

- (id)contactsFromCLSDataStore:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(CNEmailAddressContactPredicate *)self emailAddresses];
  unint64_t v6 = [v5 firstObject];

  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F19618]) initWithOptions:1 behaviors:1 searchString:v6];
    id v8 = +[CNClassKitServices objectsMatching:v7 fromStore:v4];
    id v9 = [v8 map:&__block_literal_global_45];
  }
  else
  {
    id v9 = [MEMORY[0x1E4F5A4E0] successWithValue:MEMORY[0x1E4F1CBF0]];
  }

  return v9;
}

id __65__CNEmailAddressContactPredicate_MAID__contactsFromCLSDataStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = objc_msgSend(a2, "_cn_filter:", CLSObjectIsPerson);
  uint64_t v3 = objc_msgSend(v2, "_cn_map:", CLSPersonToCNContactTransform);

  return v3;
}

- (id)sgContactMatchesWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v9 = [(CNEmailAddressContactPredicate *)self emailAddresses];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v9);
        }
        v15 = [v8 contactMatchesByEmailAddress:*(void *)(*((void *)&v17 + 1) + 8 * i) error:a6];
        if (v15)
        {
          if (v12)
          {
            [v12 addObjectsFromArray:v15];
          }
          else
          {
            uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithArray:v15];
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

@end