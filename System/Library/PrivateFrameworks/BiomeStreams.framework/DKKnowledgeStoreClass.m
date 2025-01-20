@interface DKKnowledgeStoreClass
@end

@implementation DKKnowledgeStoreClass

Class __get_DKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKKnowledgeStoreClass_block_invoke_cold_1();
  }
  get_DKKnowledgeStoreClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKKnowledgeStoreClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKKnowledgeStoreClass_block_invoke_cold_1_0();
  }
  get_DKKnowledgeStoreClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKKnowledgeStoreClass_block_invoke_1(uint64_t a1)
{
  CoreDuetLibrary_3();
  Class result = objc_getClass("_DKKnowledgeStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKKnowledgeStoreClass_block_invoke_cold_1_1();
  }
  get_DKKnowledgeStoreClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 32, @"Unable to find class %s", "_DKKnowledgeStore");

  __break(1u);
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMTipsStreams.m", 25, @"Unable to find class %s", "_DKKnowledgeStore");

  __break(1u);
}

void __get_DKKnowledgeStoreClass_block_invoke_cold_1_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKKnowledgeStoreClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMCoreDuetStream.m", 23, @"Unable to find class %s", "_DKKnowledgeStore");

  __break(1u);
}

@end