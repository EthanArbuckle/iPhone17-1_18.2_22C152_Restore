@interface DKKnowledgeStoreClass
@end

@implementation DKKnowledgeStoreClass

Class __get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKKnowledgeStoreClass_block_invoke_cold_1();
  }
  get_DKKnowledgeStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BBServer.m", 112, @"Unable to find class %s", "_DKKnowledgeStore");

  __break(1u);
}

@end