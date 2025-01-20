@interface CKRecord
@end

@implementation CKRecord

uint64_t __48__CKRecord_HealthDaemon__hd_setValuesIfChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "hd_setValue:ifChangedForKey:", a3, a2);
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __57__CKRecord_HealthDaemon__hd_setEncryptedValuesIfChanged___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "hd_setEncryptedValue:ifChangedForKey:", a3, a2);
  if (result) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

NSString *__56__CKRecord_HealthDaemon__hd_recordWithSystemData_error___block_invoke(int a1, Class aClass)
{
  return NSStringFromClass(aClass);
}

@end