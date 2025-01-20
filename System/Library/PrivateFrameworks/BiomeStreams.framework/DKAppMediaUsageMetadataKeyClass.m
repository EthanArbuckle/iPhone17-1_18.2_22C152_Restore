@interface DKAppMediaUsageMetadataKeyClass
@end

@implementation DKAppMediaUsageMetadataKeyClass

Class __get_DKAppMediaUsageMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKAppMediaUsageMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKAppMediaUsageMetadataKeyClass_block_invoke_cold_1();
  }
  get_DKAppMediaUsageMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKAppMediaUsageMetadataKeyClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKAppMediaUsageMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 34, @"Unable to find class %s", "_DKAppMediaUsageMetadataKey");

  __break(1u);
}

@end