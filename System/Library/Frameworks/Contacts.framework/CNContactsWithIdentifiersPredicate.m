@interface CNContactsWithIdentifiersPredicate
+ (BOOL)supportsSecureCoding;
- (BOOL)cn_hasHighSpecificity;
- (BOOL)cn_supportsNativeSorting;
- (BOOL)isEqual:(id)a3;
- (CNContactsWithIdentifiersPredicate)initWithCoder:(id)a3;
- (CNContactsWithIdentifiersPredicate)initWithIdentifiers:(id)a3;
- (NSArray)identifiers;
- (NSString)description;
- (id)contactsFromDonationStore:(id)a3;
- (id)internalIdentifiersForStoreWithIdentifier:(id)a3;
- (id)suggestionsWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CNContactsWithIdentifiersPredicate

- (BOOL)cn_hasHighSpecificity
{
  return 1;
}

- (id)internalIdentifiersForStoreWithIdentifier:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = (unint64_t)v4;
  if (self->_identifiers)
  {
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F1CA98] null];
    }
    v7 = v6;
    id v24 = [(NSMutableDictionary *)self->_internalIdentifiers objectForKeyedSubscript:v6];
    if (!v24)
    {
      v23 = v7;
      id v24 = [MEMORY[0x1E4F1CA80] set];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      v8 = [(CNContactsWithIdentifiersPredicate *)self identifiers];
      uint64_t v9 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            uint64_t v14 = +[CNContactStore storeIdentifierFromContactIdentifier:v13];
            if (v5 | v14)
            {
              v15 = (void *)v14;
              v16 = +[CNContactStore storeIdentifierFromContactIdentifier:v13];
              int v17 = [v16 isEqual:v5];

              if (!v17) {
                continue;
              }
            }
            v18 = +[CNContactStore internalIdentifierFromContactIdentifier:v13];
            [v24 addObject:v18];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v10);
      }

      internalIdentifiers = self->_internalIdentifiers;
      if (!internalIdentifiers)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v21 = self->_internalIdentifiers;
        self->_internalIdentifiers = v20;

        internalIdentifiers = self->_internalIdentifiers;
      }
      v7 = v23;
      [(NSMutableDictionary *)internalIdentifiers setObject:v24 forKeyedSubscript:v23];
    }
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (NSArray)identifiers
{
  return self->_identifiers;
}

- (CNContactsWithIdentifiersPredicate)initWithIdentifiers:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", v4];
  v11.receiver = self;
  v11.super_class = (Class)CNContactsWithIdentifiersPredicate;
  id v6 = [(CNPredicate *)&v11 initWithPredicate:v5];
  if (v6)
  {
    uint64_t v7 = [v4 copy];
    identifiers = v6->_identifiers;
    v6->_identifiers = (NSArray *)v7;

    uint64_t v9 = v6;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifiers, 0);

  objc_storeStrong((id *)&self->_internalIdentifiers, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  unint64_t v5 = (void *)MEMORY[0x1E4F5A3E0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__CNContactsWithIdentifiersPredicate_isEqual___block_invoke;
  v8[3] = &unk_1E56B3E18;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  LOBYTE(self) = objc_msgSend(v5, "isObject:memberOfSameClassAndEqualTo:withBlocks:", v6, self, v8, 0);

  return (char)self;
}

- (CNContactsWithIdentifiersPredicate)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNContactsWithIdentifiersPredicate;
  unint64_t v5 = [(CNPredicate *)&v13 init];
  if (v5)
  {
    id v6 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v7 = objc_opt_class();
    v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"_identifiers"];
    identifiers = v5->_identifiers;
    v5->_identifiers = (NSArray *)v9;

    objc_super v11 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNContactsWithIdentifiersPredicate;
  id v4 = a3;
  [(CNPredicate *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_identifiers, @"_identifiers", v5.receiver, v5.super_class);
}

- (BOOL)cn_supportsNativeSorting
{
  return 0;
}

- (id)suggestionsWithSortOrder:(int64_t)a3 mutableObjects:(BOOL)a4 service:(id)a5 error:(id *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = +[CNSuggestedContactStore storeIdentifier];
  uint64_t v10 = [(CNContactsWithIdentifiersPredicate *)self internalIdentifiersForStoreWithIdentifier:v9];

  id v24 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        SGRecordIDFromIdentifier();
        int v17 = (void (**)(void, void))objc_claimAutoreleasedReturnValue();
        v18 = v17[2](v17, v16);

        if (v18)
        {
          v19 = [v8 contactFromRecordID:v18 error:a6];
          if (v19)
          {
            id v20 = objc_alloc(MEMORY[0x1E4F5D9B8]);
            v21 = (void *)[v20 initWithContact:v19 matchTokens:MEMORY[0x1E4F1CBF0] matchInfo:MEMORY[0x1E4F1CBF0]];
            v22 = +[CNContactSuggestionMatch suggestionFromContactMatch:v21];
            [v24 addObject:v22];
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v13);
  }

  +[CNContactSuggestionMatch fetchLinkedIdentifiersForContactSuggestionMatches:v24 fromSuggestionService:v8];

  return v24;
}

- (id)contactsFromDonationStore:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(CNContactsWithIdentifiersPredicate *)self identifiers];
  char v6 = [v5 containsObject:@"2D0447ED-BB88-45F9-909B-EB36C6920675"];

  if (v6)
  {
    uint64_t v7 = [v4 donatedMeCardEither];
    int v8 = [v7 isLeft];
    uint64_t v9 = (void *)MEMORY[0x1E4F5A3B8];
    if (v8)
    {
      uint64_t v10 = [v7 left];
      v14[0] = v10;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      uint64_t v12 = [v9 eitherWithLeft:v11];
    }
    else
    {
      uint64_t v10 = [v7 right];
      uint64_t v12 = [v9 eitherWithRight:v10];
    }
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F5A3B8] eitherWithLeft:MEMORY[0x1E4F1CBF0]];
  }

  return v12;
}

- (NSString)description
{
  v3 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  id v4 = (id)[v3 appendName:@"kind" object:@"-[CNContact predicateForContactsWithIdentifiers:]"];
  objc_super v5 = [(CNContactsWithIdentifiersPredicate *)self identifiers];
  id v6 = (id)objc_msgSend(v3, "appendName:unsignedInteger:", @"identifiers (count)", objc_msgSend(v5, "count"));

  uint64_t v7 = [(CNContactsWithIdentifiersPredicate *)self identifiers];
  id v8 = (id)[v3 appendName:@"identifiers" object:v7];

  uint64_t v9 = [v3 build];

  return (NSString *)v9;
}

uint64_t __46__CNContactsWithIdentifiersPredicate_isEqual___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F5A3E0];
  v3 = [*(id *)(a1 + 32) identifiers];
  id v4 = [*(id *)(a1 + 40) identifiers];
  uint64_t v5 = [v2 isObject:v3 equalToOther:v4];

  return v5;
}

- (unint64_t)hash
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__CNContactsWithIdentifiersPredicate_hash__block_invoke;
  v3[3] = &unk_1E56B3E40;
  v3[4] = self;
  return objc_msgSend(MEMORY[0x1E4F5A418], "hashWithBlocks:", v3, 0);
}

uint64_t __42__CNContactsWithIdentifiersPredicate_hash__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F5A418];
  v2 = [*(id *)(a1 + 32) identifiers];
  uint64_t v3 = [v1 objectHash:v2];

  return v3;
}

@end