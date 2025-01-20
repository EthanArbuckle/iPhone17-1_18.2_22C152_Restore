@interface SFReaderExtractorClass
@end

@implementation SFReaderExtractorClass

void __get_SFReaderExtractorClass_block_invoke(uint64_t a1)
{
  SafariServicesLibrary();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("_SFReaderExtractor");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    get_SFReaderExtractorClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = [MEMORY[0x263F08690] currentHandler];
    v3 = [NSString stringWithUTF8String:"Class get_SFReaderExtractorClass(void)_block_invoke"];
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"WFArticle.m", 59, @"Unable to find class %s", "_SFReaderExtractor");

    __break(1u);
  }
}

@end