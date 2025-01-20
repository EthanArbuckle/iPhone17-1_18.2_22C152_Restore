@interface DKDiscoverabilitySignalsMetadataKeyClass
@end

@implementation DKDiscoverabilitySignalsMetadataKeyClass

Class __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKDiscoverabilitySignalsMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke_cold_1();
  }
  get_DKDiscoverabilitySignalsMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKDiscoverabilitySignalsMetadataKeyClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKDiscoverabilitySignalsMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMTipsStreams.m", 26, @"Unable to find class %s", "_DKDiscoverabilitySignalsMetadataKey");

  __break(1u);
}

@end