@interface DKKnowledgeStoreClass
@end

@implementation DKKnowledgeStoreClass

void __get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_DKKnowledgeStore");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_DKKnowledgeStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (CHProtectedAppProvider *)__get_DKKnowledgeStoreClass_block_invoke_cold_1();
    [(CHProtectedAppProvider *)v2 appProtectionSubjectsChanged:v4 forSubscription:v5];
  }
}

uint64_t __get_DKKnowledgeStoreClass_block_invoke_cold_1()
{
  v0 = abort_report_np();
  return -[CallDBMetaInfo writeDatabaseVersion:isTemp:](v0);
}

@end