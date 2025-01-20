@interface DKAppClipUsageMetadataKeyClass
@end

@implementation DKAppClipUsageMetadataKeyClass

Class __get_DKAppClipUsageMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKAppClipUsageMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKAppClipUsageMetadataKeyClass_block_invoke_cold_1();
  }
  get_DKAppClipUsageMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKAppClipUsageMetadataKeyClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKAppClipUsageMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 33, @"Unable to find class %s", "_DKAppClipUsageMetadataKey");

  __break(1u);
}

@end