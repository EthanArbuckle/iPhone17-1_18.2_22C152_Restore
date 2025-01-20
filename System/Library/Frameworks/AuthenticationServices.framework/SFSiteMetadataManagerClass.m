@interface SFSiteMetadataManagerClass
@end

@implementation SFSiteMetadataManagerClass

Class __get_SFSiteMetadataManagerClass_block_invoke(uint64_t a1)
{
  MobileSafariLibrary();
  Class result = objc_getClass("_SFSiteMetadataManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __get_SFSiteMetadataManagerClass_block_invoke_cold_1();
  }
  get_SFSiteMetadataManagerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __get_SFSiteMetadataManagerClass_block_invoke_cold_1()
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class get_SFSiteMetadataManagerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"_ASPasswordManagerIconController_iOS.m", 39, @"Unable to find class %s", "_SFSiteMetadataManager");

  __break(1u);
}

@end