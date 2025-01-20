@interface SFSavedAccountTouchIconRequestClass
@end

@implementation SFSavedAccountTouchIconRequestClass

Class __get_SFSavedAccountTouchIconRequestClass_block_invoke(uint64_t a1)
{
  MobileSafariLibrary();
  Class result = objc_getClass("_SFSavedAccountTouchIconRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_SFSavedAccountTouchIconRequestClass_block_invoke_cold_1();
  }
  get_SFSavedAccountTouchIconRequestClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFSavedAccountTouchIconRequestClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_SFSavedAccountTouchIconRequestClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_ASPasswordManagerIconController_iOS.m", 40, @"Unable to find class %s", "_SFSavedAccountTouchIconRequest");

  __break(1u);
}

@end