@interface SFReaderExtractorErrorDomainSymbolLoc
@end

@implementation SFReaderExtractorErrorDomainSymbolLoc

void *__get_SFReaderExtractorErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = SafariServicesLibrary();
  result = dlsym(v2, "_SFReaderExtractorErrorDomain");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_SFReaderExtractorErrorDomainSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end