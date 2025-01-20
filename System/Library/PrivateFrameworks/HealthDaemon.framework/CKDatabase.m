@interface CKDatabase
@end

@implementation CKDatabase

void __64__CKDatabase_OperationAnalytics__hd_addOperationObserver_queue___block_invoke()
{
  _HKInitializeLogging();
  id v0 = objc_alloc(MEMORY[0x1E4F2B2D0]);
  uint64_t v1 = [v0 initWithName:@"CloudSyncOperationObservation" loggingCategory:*MEMORY[0x1E4F29FA8]];
  v2 = (void *)qword_1EBA18BF8;
  qword_1EBA18BF8 = v1;
}

uint64_t __50__CKDatabase_OperationAnalytics__hd_addOperation___block_invoke(uint64_t a1, void *a2)
{
  return [a2 database:*(void *)(a1 + 32) didAddOperation:*(void *)(a1 + 40)];
}

@end