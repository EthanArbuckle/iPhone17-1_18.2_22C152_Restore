@interface CFHTTPServerRequestCopyBodyStream
@end

@implementation CFHTTPServerRequestCopyBodyStream

void *___CFHTTPServerRequestCopyBodyStream_block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(const void **)(a2 + 128);
  if (v3) {
    result = (void *)CFRetain(v3);
  }
  else {
    result = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const UInt8 *)"", 0, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0]);
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end