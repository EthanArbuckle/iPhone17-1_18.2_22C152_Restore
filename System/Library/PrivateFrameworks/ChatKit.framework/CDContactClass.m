@interface CDContactClass
@end

@implementation CDContactClass

Class __get_CDContactClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_CDContact");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_CDContactClass_block_invoke_cold_1();
  }
  get_CDContactClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_CDContactClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x1E4F28B00] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_CDContactClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CKSMSComposeViewServiceController.m", 92, @"Unable to find class %s", "_CDContact");

  __break(1u);
}

@end