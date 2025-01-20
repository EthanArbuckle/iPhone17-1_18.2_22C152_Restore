@interface SecTrustGetCertificateCount
@end

@implementation SecTrustGetCertificateCount

CFArrayRef __SecTrustGetCertificateCount_block_invoke(uint64_t a1)
{
  CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 40) + 72);
  if (result)
  {
    CFArrayRef result = (const __CFArray *)CFArrayGetCount(result);
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end