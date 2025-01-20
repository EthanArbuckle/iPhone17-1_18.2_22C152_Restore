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

void __get_DKSystemEventStreamsClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKSystemEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSUtilities.m", 27, @"Unable to find class %s", "_DKSystemEventStreams");

  __break(1u);
}

@end