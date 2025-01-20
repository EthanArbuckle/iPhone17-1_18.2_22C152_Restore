@interface PNGSymbolLoc
@end

@implementation PNGSymbolLoc

void *__getkCMMetadataBaseDataType_PNGSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreMediaLibrary();
  result = dlsym(v2, "kCMMetadataBaseDataType_PNG");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMMetadataBaseDataType_PNGSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end