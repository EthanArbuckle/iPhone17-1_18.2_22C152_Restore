@interface CNContactHandleStringIndexer
+ (id)indexByMatchingIndexWithRawHandles:(id)a3 toTargetHandleStrings:(id)a4;
- (CNCache)indexImpl;
- (CNContactHandleStringIndexer)init;
- (CNContactHandleStringIndexer)initWithTargetHandleStrings:(id)a3;
- (NSArray)targetHandleStrings;
- (NSDictionary)index;
- (id)description;
- (id)indexWithRawHandles;
- (void)indexContact:(id)a3;
- (void)indexContacts:(id)a3;
- (void)indexEmailAddressesOnContact:(id)a3;
- (void)indexPhoneNumbersOnContact:(id)a3;
@end

@implementation CNContactHandleStringIndexer

- (CNContactHandleStringIndexer)initWithTargetHandleStrings:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNContactHandleStringIndexer;
  v5 = [(CNContactHandleStringIndexer *)&v12 init];
  if (v5)
  {
    v6 = (CNCache *)objc_alloc_init(MEMORY[0x1E4F5A360]);
    indexImpl = v5->_indexImpl;
    v5->_indexImpl = v6;

    if (((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))() & 1) == 0)
    {
      uint64_t v8 = [v4 copy];
      targetHandleStrings = v5->_targetHandleStrings;
      v5->_targetHandleStrings = (NSArray *)v8;
    }
    v10 = v5;
  }

  return v5;
}

- (NSDictionary)index
{
  if (self->_targetHandleStrings) {
    [(id)objc_opt_class() indexByMatchingIndexWithRawHandles:self->_indexImpl toTargetHandleStrings:self->_targetHandleStrings];
  }
  else {
  v2 = [(CNContactHandleStringIndexer *)self indexWithRawHandles];
  }

  return (NSDictionary *)v2;
}

- (void)indexContacts:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(CNContactHandleStringIndexer *)self indexContact:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

+ (id)indexByMatchingIndexWithRawHandles:(id)a3 toTargetHandleStrings:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v5 = a4;
  id v23 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count"));
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v5;
  uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v37;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v37 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v29 = v6;
        uint64_t v27 = *(void *)(*((void *)&v36 + 1) + 8 * v6);
        uint64_t v7 = [[CNContactHandleIndexableString alloc] initWithString:v27];
        v28 = [(CNContactHandleIndexableString *)v7 indexKey];
        uint64_t v8 = objc_msgSend(v25, "objectForKeyedSubscript:");
        id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v9 = v8;
        uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (v10)
        {
          uint64_t v11 = v10;
          long long v12 = 0;
          uint64_t v13 = *(void *)v33;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v33 != v13) {
                objc_enumerationMutation(v9);
              }
              v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
              char v31 = 1;
              v16 = [v15 first];
              BOOL v17 = [(CNContactHandleIndexableString *)v7 isEquivalentToString:v16 strict:&v31];

              if (v17)
              {
                v18 = [v15 second];
                if (v31)
                {
                  id v19 = v30;
                }
                else
                {
                  id v19 = v12;
                  if (!v12)
                  {
                    id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                    long long v12 = v19;
                  }
                }
                [v19 addObject:v18];
              }
            }
            uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v40 count:16];
          }
          while (v11);
        }
        else
        {
          long long v12 = 0;
        }

        id v20 = v30;
        if ([v30 count] || (id v20 = v12, objc_msgSend(v12, "count"))) {
          [v23 setObject:v20 forKeyedSubscript:v27];
        }

        uint64_t v6 = v29 + 1;
      }
      while (v29 + 1 != v26);
      uint64_t v26 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v26);
  }

  return v23;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetHandleStrings, 0);

  objc_storeStrong((id *)&self->_indexImpl, 0);
}

- (CNContactHandleStringIndexer)init
{
  return [(CNContactHandleStringIndexer *)self initWithTargetHandleStrings:MEMORY[0x1E4F1CBF0]];
}

- (id)description
{
  v2 = [MEMORY[0x1E4F5A3A8] descriptionBuilderWithObject:self];
  v3 = [v2 build];

  return v3;
}

- (id)indexWithRawHandles
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = [(CNCache *)self->_indexImpl allObjects];
  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = v5;
        uint64_t v6 = *(void **)(*((void *)&v28 + 1) + 8 * v5);
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v7 = v6;
        uint64_t v8 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v25 != v10) {
                objc_enumerationMutation(v7);
              }
              long long v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v13 = [v12 first];
              uint64_t v14 = [v3 objectForKeyedSubscript:v13];

              if (v14) {
                v15 = (void *)v14;
              }
              else {
                v15 = v4;
              }
              v16 = [v12 second];
              BOOL v17 = [v15 arrayByAddingObject:v16];

              v18 = [v12 first];
              [v3 setObject:v17 forKeyedSubscript:v18];
            }
            uint64_t v9 = [v7 countByEnumeratingWithState:&v24 objects:v32 count:16];
          }
          while (v9);
        }

        uint64_t v5 = v23 + 1;
      }
      while (v23 + 1 != v22);
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

  return v3;
}

- (void)indexContact:(id)a3
{
  id v4 = a3;
  [(CNContactHandleStringIndexer *)self indexEmailAddressesOnContact:v4];
  [(CNContactHandleStringIndexer *)self indexPhoneNumbersOnContact:v4];
}

- (void)indexEmailAddressesOnContact:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isKeyAvailable:@"emailAddresses"])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id obj = [v4 emailAddresses];
    uint64_t v5 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * v8) value];
          uint64_t v10 = +[CNContactHandleIndexableString emailIndexKey:v9];
          uint64_t v11 = [(CNCache *)self->_indexImpl objectForKey:v10 onCacheMiss:*MEMORY[0x1E4F5A1A0]];
          long long v12 = [MEMORY[0x1E4F5A490] pairWithFirst:v9 second:v4];
          [v11 addObject:v12];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }
  }
}

- (void)indexPhoneNumbersOnContact:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isKeyAvailable:@"phoneNumbers"])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id obj = [v4 phoneNumbers];
    uint64_t v5 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = [*(id *)(*((void *)&v15 + 1) + 8 * v8) value];
          uint64_t v10 = [v9 stringValue];

          uint64_t v11 = +[CNContactHandleIndexableString phoneNumberIndexKey:v10];
          long long v12 = [(CNCache *)self->_indexImpl objectForKey:v11 onCacheMiss:*MEMORY[0x1E4F5A1A0]];
          uint64_t v13 = [MEMORY[0x1E4F5A490] pairWithFirst:v10 second:v4];
          [v12 addObject:v13];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

- (CNCache)indexImpl
{
  return self->_indexImpl;
}

- (NSArray)targetHandleStrings
{
  return self->_targetHandleStrings;
}

@end