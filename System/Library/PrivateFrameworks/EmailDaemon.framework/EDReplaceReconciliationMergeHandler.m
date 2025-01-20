@interface EDReplaceReconciliationMergeHandler
@end

@implementation EDReplaceReconciliationMergeHandler

void __54___EDReplaceReconciliationMergeHandler_sharedInstance__block_invoke(uint64_t a1)
{
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)&OBJC_METACLASS____EDReplaceReconciliationMergeHandler;
  uint64_t v1 = objc_msgSend(objc_msgSendSuper2(&v3, sel_allocWithZone_, 0), "init");
  v2 = (void *)sharedInstance_sharedInstance_321;
  sharedInstance_sharedInstance_321 = v1;
}

@end