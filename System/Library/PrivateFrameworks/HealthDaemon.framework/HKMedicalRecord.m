@interface HKMedicalRecord
@end

@implementation HKMedicalRecord

BOOL __113__HKMedicalRecord_HDDataEntity__hd_insertRelatedDataWithPersistentID_insertionContext_profile_transaction_error___block_invoke(void *a1, uint64_t a2)
{
  return +[HDMedicalUserDomainConceptGenerator generateUserDomainConceptForMedicalRecord:a1[4] entityPersistentID:a1[5] insertionContext:a1[6] profile:a1[7] transaction:a1[8] error:a2];
}

@end