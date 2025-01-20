@interface CopyIsDirectoryKeyArray
@end

@implementation CopyIsDirectoryKeyArray

CFArrayRef ___CopyIsDirectoryKeyArray_block_invoke(uint64_t a1)
{
  CFArrayRef result = CFArrayCreate(0, (const void **)&kCFURLIsDirectoryKey, 1, &kCFTypeArrayCallBacks);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end