@interface JPEGSymbolLoc
@end

@implementation JPEGSymbolLoc

void *__getkCMMetadataBaseDataType_JPEGSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreMediaLibrary();
  result = dlsym(v2, "kCMMetadataBaseDataType_JPEG");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMMetadataBaseDataType_JPEGSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end