@interface SecTrustCopyKey
@end

@implementation SecTrustCopyKey

CFArrayRef __SecTrustCopyKey_block_invoke_2(uint64_t a1)
{
  CFArrayRef result = *(const __CFArray **)(*(void *)(a1 + 40) + 72);
  if (result)
  {
    ValueAtIndex = (__SecCertificate *)CFArrayGetValueAtIndex(result, 0);
    CFArrayRef result = SecCertificateCopyKey(ValueAtIndex);
    *(void *)(*(void *)(a1 + 40) + 80) = result;
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(v4 + 80);
    if (v5) {
      CFArrayRef result = (const __CFArray *)CFRetain(*(CFTypeRef *)(v4 + 80));
    }
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  }
  return result;
}

@end