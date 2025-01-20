@interface HKMedicalRecord(HDDataEntity)
- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:;
@end

@implementation HKMedicalRecord(HDDataEntity)

- (uint64_t)hd_insertRelatedDataWithPersistentID:()HDDataEntity insertionContext:profile:transaction:error:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v24.receiver = a1;
  v24.super_class = (Class)&off_1F186E580;
  uint64_t v16 = (uint64_t)objc_msgSendSuper2(&v24, sel_hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error_, v12, v13, v14, v15, a7);
  v17 = [v14 daemon];
  v18 = [v17 behavior];

  if ([v18 supportsOntology])
  {
    id v20 = v12;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    uint64_t v16 = HKWithAutoreleasePool();
  }
  return v16;
}

@end