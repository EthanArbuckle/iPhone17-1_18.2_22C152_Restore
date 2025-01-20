@interface HKCorrelation(HDDataEntity)
- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:;
- (id)hd_relatedJournalEntriesWithProfile:()HDDataEntity;
@end

@implementation HKCorrelation(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12 = a5;
  id v13 = a6;
  v18.receiver = a1;
  v18.super_class = (Class)&off_1F187BE48;
  if (objc_msgSendSuper2(&v18, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, a3, a4, v12, v13, a7))
  {
    v14 = [a1 objects];
    v15 = [v14 allObjects];
    BOOL v16 = +[HDAssociationEntity insertEntriesWithAssociation:a1 objects:v15 type:0 destinationSubObject:0 enforceSameSource:1 profile:v12 transaction:v13 error:a7];
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)hd_relatedJournalEntriesWithProfile:()HDDataEntity
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [a1 objects];
  v6 = [v5 allObjects];
  v7 = +[HDAssociationEntity journalEntryForAssociation:a1 objects:v6 profile:v4];

  v10[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

@end