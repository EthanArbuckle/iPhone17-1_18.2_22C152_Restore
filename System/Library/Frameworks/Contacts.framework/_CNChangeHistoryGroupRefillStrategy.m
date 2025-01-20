@interface _CNChangeHistoryGroupRefillStrategy
- (CNContactStore)contactStore;
- (_CNChangeHistoryGroupRefillStrategy)initWithContactStore:(id)a3;
- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4;
- (id)fetchGroupsWithIdentifiers:(id)a3;
- (id)objectsRepresentedByBatch:(id)a3;
- (id)updateChanges:(id)a3 withFetchedGroups:(id)a4;
@end

@implementation _CNChangeHistoryGroupRefillStrategy

- (_CNChangeHistoryGroupRefillStrategy)initWithContactStore:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)_CNChangeHistoryGroupRefillStrategy;
  v6 = [(_CNChangeHistoryGroupRefillStrategy *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contactStore, a3);
    v8 = v7;
  }

  return v7;
}

- (id)batchesToRepresentObjects:(id)a3 suggestedBatchSize:(unint64_t)a4
{
  return (id)objc_msgSend(a3, "_cn_balancedSlicesWithMaximumCount:", a4);
}

- (id)objectsRepresentedByBatch:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(v4, "_cn_filter:", &__block_literal_global_68_0);
  v6 = objc_msgSend(v5, "_cn_map:", &__block_literal_global_71_1);

  v7 = [(_CNChangeHistoryGroupRefillStrategy *)self fetchGroupsWithIdentifiers:v6];
  v8 = [(_CNChangeHistoryGroupRefillStrategy *)self updateChanges:v4 withFetchedGroups:v7];

  return v8;
}

- (id)fetchGroupsWithIdentifiers:(id)a3
{
  id v4 = a3;
  if ((*(uint64_t (**)(void))(*MEMORY[0x1E4F5A258] + 16))())
  {
    id v5 = (void *)MEMORY[0x1E4F1CC08];
  }
  else
  {
    v6 = +[CNGroup predicateForGroupsWithIdentifiers:v4];
    v7 = [(_CNChangeHistoryGroupRefillStrategy *)self contactStore];
    id v11 = 0;
    v8 = [v7 groupsMatchingPredicate:v6 error:&v11];
    id v9 = v11;

    if (v8)
    {
      id v5 = objc_msgSend(v8, "_cn_indexBy:", &__block_literal_global_74);
    }
    else
    {
      NSLog(&cfstr_FailedToFetchG.isa, v9);
      id v5 = 0;
    }
  }

  return v5;
}

- (id)updateChanges:(id)a3 withFetchedGroups:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 groupIdentifier];
        v13 = [v6 objectForKeyedSubscript:v12];
        [v11 setGroup:v13];

        v14 = [v11 group];
        if (v14)
        {
        }
        else if ([v11 changeType] != 2)
        {
          v15 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v11, "changeType"));
          v16 = [v11 groupIdentifier];
          NSLog(&cfstr_CouldNotFetchG.isa, v15, v16);

          [v11 setChangeType:2];
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (CNContactStore)contactStore
{
  return self->_contactStore;
}

- (void).cxx_destruct
{
}

@end