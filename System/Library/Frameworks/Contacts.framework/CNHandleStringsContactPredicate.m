@interface CNHandleStringsContactPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CNHandleStringsContactPredicate)init;
- (CNHandleStringsContactPredicate)initWithCoder:(id)a3;
- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3;
- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3 containerIdentifiers:(id)a4;
- (NSArray)containerIdentifiers;
- (NSArray)handleStrings;
- (id)cn_resultTransformWithMatchInfos:(id)a3;
- (id)description;
- (id)shortDebugDescription;
- (unint64_t)hash;
- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNHandleStringsContactPredicate

id __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [[CNContactHandleStringIndexer alloc] initWithTargetHandleStrings:*(void *)(a1 + 32)];
  [(CNContactHandleStringIndexer *)v4 indexContacts:v3];

  v5 = [(CNContactHandleStringIndexer *)v4 index];

  return v5;
}

- (id)cn_resultTransformWithMatchInfos:(id)a3
{
  id v4 = a3;
  v5 = [v4 allValues];
  int v6 = objc_msgSend(v5, "_cn_any:", &__block_literal_global_50);

  uint64_t v7 = [(CNHandleStringsContactPredicate *)self handleStrings];
  v8 = (void *)v7;
  if (v6)
  {
    v9 = v15;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v10 = __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_2;
    v11 = v4;
  }
  else
  {
    v9 = v14;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v10 = __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_3;
    v11 = (void *)v7;
  }
  v9[2] = v10;
  v9[3] = &unk_1E56B5690;
  v9[4] = v11;
  v12 = _Block_copy(v9);

  return v12;
}

- (NSArray)handleStrings
{
  return self->_handleStrings;
}

- (NSArray)containerIdentifiers
{
  return self->_containerIdentifiers;
}

- (void)cn_triageWithLog:(id)a3 serialNumber:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled((os_log_t)a3, OS_LOG_TYPE_INFO))
  {
    int v6 = (void *)MEMORY[0x1E4F5A3D8];
    uint64_t v7 = a3;
    v8 = [v6 currentEnvironment];
    v9 = [v8 defaultCountryCode];
    int v10 = 134218242;
    unint64_t v11 = a4;
    __int16 v12 = 2114;
    v13 = v9;
    _os_log_impl(&dword_1909E3000, v7, OS_LOG_TYPE_INFO, "%04llx Default country code: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3 containerIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CNHandleStringsContactPredicate;
  v8 = [(CNPredicate *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    handleStrings = v8->_handleStrings;
    v8->_handleStrings = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    containerIdentifiers = v8->_containerIdentifiers;
    v8->_containerIdentifiers = (NSArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerIdentifiers, 0);

  objc_storeStrong((id *)&self->_handleStrings, 0);
}

- (CNHandleStringsContactPredicate)init
{
  return [(CNHandleStringsContactPredicate *)self initWithHandleStrings:MEMORY[0x1E4F1CBF0]];
}

- (CNHandleStringsContactPredicate)initWithHandleStrings:(id)a3
{
  return [(CNHandleStringsContactPredicate *)self initWithHandleStrings:a3 containerIdentifiers:0];
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = [(CNHandleStringsContactPredicate *)self containerIdentifiers];

  if (v4)
  {
    id v5 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingHandleStrings:inContainersWithIdentifiers:]"];
    id v6 = [(CNHandleStringsContactPredicate *)self handleStrings];
    id v7 = (id)[v3 appendName:@"handleStrings" object:v6];

    v8 = [(CNHandleStringsContactPredicate *)self containerIdentifiers];
    uint64_t v9 = @"containerIdentifiers";
  }
  else
  {
    id v10 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsMatchingHandleStrings:]"];
    v8 = [(CNHandleStringsContactPredicate *)self handleStrings];
    uint64_t v9 = @"handleStrings";
  }
  id v11 = (id)[v3 appendName:v9 object:v8];

  __int16 v12 = [v3 build];

  return v12;
}

- (id)shortDebugDescription
{
  return @"HandleStringsPredicate";
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__CNHandleStringsContactPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

uint64_t __43__CNHandleStringsContactPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  id v3 = [*(id *)(a1 + 32) handleStrings];
  id v4 = [*(id *)(a1 + 40) handleStrings];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __39__CNHandleStringsContactPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __39__CNHandleStringsContactPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) handleStrings];
  uint64_t v3 = [v1 arrayHash:v2];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNHandleStringsContactPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNHandleStringsContactPredicate;
  uint64_t v5 = [(CNPredicate *)&v14 initWithCoder:v4];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_handleStrings"];
    uint64_t v10 = [v9 copy];
    handleStrings = v5->_handleStrings;
    v5->_handleStrings = (NSArray *)v10;

    __int16 v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNHandleStringsContactPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_handleStrings, @"_handleStrings", v5.receiver, v5.super_class);
}

BOOL __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 matchedTerms];
  BOOL v3 = v2 != 0;

  return v3;
}

id __68__CNHandleStringsContactPredicate_cn_resultTransformWithMatchInfos___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obuint64_t j = v2;
  uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v22)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        objc_super v5 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v6 = *(void **)(a1 + 32);
        uint64_t v7 = [v5 identifier];
        v8 = [v6 objectForKeyedSubscript:v7];
        id v9 = [v8 matchedTerms];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v10 = v9;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v24;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v24 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void *)(*((void *)&v23 + 1) + 8 * j);
              v16 = [v3 objectForKey:v15];
              if (v16)
              {
                v17 = v16;
                [v16 addObject:v5];
              }
              else
              {
                v17 = [MEMORY[0x1E4F1CA48] arrayWithObject:v5];
                [v3 setObject:v17 forKey:v15];
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v12);
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v22);
  }

  return v3;
}

@end