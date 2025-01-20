@interface _CNChangeHistoryContactRefillStrategy
- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4;
- (id)initWithKeysToFetch:(char)a3 unifyResults:(void *)a4 contactStore:;
- (id)objectsRepresentedByBatch:(id)a3;
- (id)updateChanges:(void *)a3 withFetchedContacts:;
- (void)fetchContactsWithIdentifiers:(void *)a1;
@end

@implementation _CNChangeHistoryContactRefillStrategy

- (id)initWithKeysToFetch:(char)a3 unifyResults:(void *)a4 contactStore:
{
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)_CNChangeHistoryContactRefillStrategy;
    a1 = (id *)objc_msgSendSuper2(&v12, sel_init);
    if (a1)
    {
      uint64_t v9 = [v7 copy];
      id v10 = a1[2];
      a1[2] = (id)v9;

      *((unsigned char *)a1 + 8) = a3;
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4
{
  return (id)objc_msgSend(a3, "_cn_balancedSlicesWithMaximumCount:", a4);
}

- (id)objectsRepresentedByBatch:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_40_1);
  v6 = objc_msgSend(v5, "_cn_filter:", *MEMORY[0x1E4F5A2A0]);
  id v7 = objc_msgSend(v6, "_cn_distinctObjects");

  id v8 = -[_CNChangeHistoryContactRefillStrategy fetchContactsWithIdentifiers:](self, v7);
  uint64_t v9 = -[_CNChangeHistoryContactRefillStrategy updateChanges:withFetchedContacts:](self, v4, v8);

  return v9;
}

- (void)fetchContactsWithIdentifiers:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
    {
      a1 = (void *)MEMORY[0x1E4F1CC08];
    }
    else
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __70___CNChangeHistoryContactRefillStrategy_fetchContactsWithIdentifiers___block_invoke;
      aBlock[3] = &unk_1E56B6498;
      id v5 = v4;
      id v16 = v5;
      v6 = _Block_copy(aBlock);
      id v7 = [[CNContactFetchRequest alloc] initWithKeysToFetch:a1[2]];
      id v8 = +[CNContact predicateForContactsWithIdentifiers:v3];
      [(CNContactFetchRequest *)v7 setPredicate:v8];

      [(CNContactFetchRequest *)v7 setUnifyResults:*((unsigned __int8 *)a1 + 8)];
      uint64_t v9 = (void *)a1[3];
      id v14 = 0;
      id v10 = v9;
      char v11 = [v10 enumerateContactsWithFetchRequest:v7 error:&v14 usingBlock:v6];
      id v12 = v14;

      if (v11)
      {
        a1 = v5;
      }
      else
      {
        NSLog(&cfstr_FailedToFetchC.isa, v12);
        a1 = 0;
      }
    }
  }

  return a1;
}

- (id)updateChanges:(void *)a3 withFetchedContacts:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      uint64_t v10 = *MEMORY[0x1E4F5A2A0];
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v5);
          }
          id v12 = *(void **)(*((void *)&v21 + 1) + 8 * v11);
          LOBYTE(v7) = sIsChangeDelete_block_invoke(v7, v12);
          if ((v7 & 1) == 0)
          {
            v13 = [v12 contactIdentifier];
            int v14 = (*(uint64_t (**)(uint64_t, void *))(v10 + 16))(v10, v13);

            if (v14)
            {
              v15 = [v12 contactIdentifier];
              id v16 = [v6 objectForKeyedSubscript:v15];
              [v12 setContact:v16];

              v17 = [v12 contact];

              if (!v17)
              {
                v18 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "changeType"));
                v19 = [v12 contactIdentifier];
                NSLog(&cfstr_CouldNotFetchC.isa, v18, v19);

                uint64_t v7 = [v12 setChangeType:2];
              }
            }
          }
          ++v11;
        }
        while (v8 != v11);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
        uint64_t v8 = v7;
      }
      while (v7);
    }
    a1 = v5;
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactStore, 0);

  objc_storeStrong((id *)&self->_keys, 0);
}

@end