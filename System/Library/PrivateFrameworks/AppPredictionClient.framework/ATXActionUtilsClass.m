@interface ATXActionUtilsClass
@end

@implementation ATXActionUtilsClass

Class __get_ATXActionUtilsClass_block_invoke(uint64_t a1)
{
  AppPredictionInternalLibrary();
  Class result = objc_getClass("_ATXActionUtils");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_ATXActionUtilsClass_block_invoke_cold_1();
  }
  get_ATXActionUtilsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_ATXActionUtilsClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_ATXActionUtilsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"ATXActionSearchResult.m", 395, @"Unable to find class %s", "_ATXActionUtils");

  __break(1u);
}

@end