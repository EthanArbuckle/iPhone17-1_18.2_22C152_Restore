@interface DKSystemEventStreamsClass
@end

@implementation DKSystemEventStreamsClass

Class __get_DKSystemEventStreamsClass_block_invoke(uint64_t a1)
{
  v3 = 0;
  if (!CoreDuetLibraryCore()) {
    __get_DKSystemEventStreamsClass_block_invoke_cold_1(&v3);
  }
  Class result = objc_getClass("_DKSystemEventStreams");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKSystemEventStreamsClass_block_invoke_cold_2();
  }
  get_DKSystemEventStreamsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_1(void *a1)
{
  v2 = [MEMORY[0x263F08690] currentHandler];
  v3 = [NSString stringWithUTF8String:"void *CoreDuetLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AFUISiriSession.m", 69, @"%s", *a1);

  __break(1u);
}

void __get_DKSystemEventStreamsClass_block_invoke_cold_2()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKSystemEventStreamsClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AFUISiriSession.m", 70, @"Unable to find class %s", "_DKSystemEventStreams");

  __break(1u);
}

@end