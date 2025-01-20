@interface BMPSymbolLoc
@end

@implementation BMPSymbolLoc

void *__getkCMMetadataBaseDataType_BMPSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreMediaLibrary();
  result = dlsym(v2, "kCMMetadataBaseDataType_BMP");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMMetadataBaseDataType_BMPSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end