@interface DKPREventClass
@end

@implementation DKPREventClass

Class __get_DKPREventClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_1();
  Class result = objc_getClass("_DKPREvent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKPREventClass_block_invoke_cold_1();
  }
  get_DKPREventClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKPREventClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKPREventClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_BMDKEventCodec_DKPREvent.m", 21, @"Unable to find class %s", "_DKPREvent");

  __break(1u);
}

@end