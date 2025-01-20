@interface DKSystemEventStreamsClass
@end

@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1();
  }
  get_DKSystemEventStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_0(uint64_t a1)
{
  CoreDuetLibrary_0();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_0();
  }
  get_DKSystemEventStreamsClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __get_DKSystemEventStreamsClass_block_invoke_1(uint64_t a1)
{
  CoreDuetLibrary_2();
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1_1();
  }
  get_DKSystemEventStreamsClass_softClass_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKSystemEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMKnowledgeContextMapping.m", 17, @"Unable to find class %s", "_DKSystemEventStreams");

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1_0()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKSystemEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMAppStreams.m", 37, @"Unable to find class %s", "_DKSystemEventStreams");

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKSystemEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMTipsStreams.m", 29, @"Unable to find class %s", "_DKSystemEventStreams");

  __break(1u);
}

@end