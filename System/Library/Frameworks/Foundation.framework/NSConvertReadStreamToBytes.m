@interface NSConvertReadStreamToBytes
@end

@implementation NSConvertReadStreamToBytes

void ___NSConvertReadStreamToBytes_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  if (a2) {
    CFAllocatorDeallocate((CFAllocatorRef)*MEMORY[0x1E4F1CFB0], a2);
  }
  *a3 = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
}

@end