@interface DKBundleIdentifierClass
@end

@implementation DKBundleIdentifierClass

Class __get_DKBundleIdentifierClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKBundleIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKBundleIdentifierClass_block_invoke_cold_1();
  }
  get_DKBundleIdentifierClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKBundleIdentifierClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKBundleIdentifierClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMKnowledgeContextMapping.m", 20, @"Unable to find class %s", "_DKBundleIdentifier");

  __break(1u);
}

@end