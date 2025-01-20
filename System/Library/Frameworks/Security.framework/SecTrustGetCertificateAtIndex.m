@interface SecTrustGetCertificateAtIndex
@end

@implementation SecTrustGetCertificateAtIndex

CFArrayRef __SecTrustGetCertificateAtIndex_block_invoke_2(void *a1)
{
  CFArrayRef result = *(const __CFArray **)(a1[5] + 72);
  if (result)
  {
    CFArrayRef result = (const __CFArray *)CFArrayGetValueAtIndex(result, a1[6]);
    *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  }
  return result;
}

@end