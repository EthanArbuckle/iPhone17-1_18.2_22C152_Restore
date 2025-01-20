@interface DKBiomeQueryClass
@end

@implementation DKBiomeQueryClass

Class __get_DKBiomeQueryClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary_3();
  Class result = objc_getClass("_DKBiomeQuery");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKBiomeQueryClass_block_invoke_cold_1();
  }
  get_DKBiomeQueryClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKBiomeQueryClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKBiomeQueryClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BMCoreDuetStream.m", 24, @"Unable to find class %s", "_DKBiomeQuery");

  __break(1u);
}

@end