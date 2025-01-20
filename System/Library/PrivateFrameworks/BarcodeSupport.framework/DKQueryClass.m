@interface DKQueryClass
@end

@implementation DKQueryClass

Class __get_DKQueryClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKQueryClass_block_invoke_cold_1();
  }
  get_DKQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKQueryClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BCSUtilities.m", 28, @"Unable to find class %s", "_DKQuery");

  __break(1u);
}

@end