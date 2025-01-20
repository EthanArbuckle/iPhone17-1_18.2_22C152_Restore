@interface GIFSymbolLoc
@end

@implementation GIFSymbolLoc

void *__getkCMMetadataBaseDataType_GIFSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = CoreMediaLibrary();
  result = dlsym(v2, "kCMMetadataBaseDataType_GIF");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkCMMetadataBaseDataType_GIFSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end