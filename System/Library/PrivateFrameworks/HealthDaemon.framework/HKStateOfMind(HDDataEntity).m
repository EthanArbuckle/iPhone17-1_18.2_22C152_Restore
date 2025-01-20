@interface HKStateOfMind(HDDataEntity)
- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:;
@end

@implementation HKStateOfMind(HDDataEntity)

- (BOOL)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12 = a3;
  id v13 = a6;
  v25.receiver = a1;
  v25.super_class = (Class)&off_1F187D1C0;
  if (!objc_msgSendSuper2(&v25, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, a4, a5, v13, a7))goto LABEL_7; {
  v14 = [a1 labels];
  }
  uint64_t v15 = [v14 count];

  if (!v15
    || (uint64_t v16 = [v12 longLongValue],
        [a1 labels],
        v17 = objc_claimAutoreleasedReturnValue(),
        BOOL v18 = +[HDStateOfMindLabelEntity insertLabelsForObjectID:v16 labels:v17 transaction:v13 error:a7], v17, v18))
  {
    v19 = [a1 domains];
    uint64_t v20 = [v19 count];

    if (!v20
      || (uint64_t v21 = [v12 longLongValue],
          [a1 domains],
          v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = +[HDStateOfMindDomainEntity insertDomainsForObjectID:v21 domains:v22 transaction:v13 error:a7], v22, v23))
    {
      BOOL v23 = 1;
    }
  }
  else
  {
LABEL_7:
    BOOL v23 = 0;
  }

  return v23;
}

@end