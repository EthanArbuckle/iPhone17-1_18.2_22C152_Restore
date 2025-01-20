@interface DKDigitalHealthMetadataKeyClass
@end

@implementation DKDigitalHealthMetadataKeyClass

Class __get_DKDigitalHealthMetadataKeyClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKDigitalHealthMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1();
  }
  get_DKDigitalHealthMetadataKeyClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKDigitalHealthMetadataKeyClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKDigitalHealthMetadataKey");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1_0();
  }
  get_DKDigitalHealthMetadataKeyClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKDigitalHealthMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMKnowledgeContextMapping.m", 21, @"Unable to find class %s", "_DKDigitalHealthMetadataKey");

  __break(1u);
}

void __get_DKDigitalHealthMetadataKeyClass_block_invoke_cold_1_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKDigitalHealthMetadataKeyClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 35, @"Unable to find class %s", "_DKDigitalHealthMetadataKey");

  __break(1u);
}

@end