@interface HKObject(HDDataEntity)
- (uint64_t)entityType;
- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:;
- (uint64_t)hd_relatedJournalEntriesWithProfile:()HDDataEntity;
@end

@implementation HKObject(HDDataEntity)

- (uint64_t)entityType
{
  return 0;
}

- (uint64_t)hd_relatedJournalEntriesWithProfile:()HDDataEntity
{
  return MEMORY[0x1E4F1CBF0];
}

- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [a1 metadata];
  if (v16)
  {
    v17 = [v14 metadataManager];
    v18 = [v13 provenance];
    v19 = [v18 sourceID];
    uint64_t v20 = objc_msgSend(v17, "insertMetadata:forObjectID:sourceID:externalSyncObjectCode:objectDeleted:transaction:error:", v16, v12, v19, objc_msgSend(a1, "_externalSyncObjectCode"), 0, v15, a7);
  }
  else
  {
    uint64_t v20 = 1;
  }

  return v20;
}

@end