@interface DKAnyStringIdentifierClass
@end

@implementation DKAnyStringIdentifierClass

Class __get_DKAnyStringIdentifierClass_block_invoke(uint64_t a1)
{
  CoreDuetLibrary();
  Class result = objc_getClass("_DKAnyStringIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_DKAnyStringIdentifierClass_block_invoke_cold_1();
  }
  get_DKAnyStringIdentifierClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_DKAnyStringIdentifierClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_DKAnyStringIdentifierClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"BBServer.m", 106, @"Unable to find class %s", "_DKAnyStringIdentifier");

  __break(1u);
}

@end