@interface CSAddAppleIDAccount
@end

@implementation CSAddAppleIDAccount

void ___CSAddAppleIDAccount_block_invoke(uint64_t a1)
{
  _AppleIDAuthenticationAddAppleID(*(void *)(a1 + 32), *(void *)(a1 + 40), 0, 0);
  v2 = *(const void **)(a1 + 32);
  if (v2) {
    CFRelease(v2);
  }
  v3 = *(const void **)(a1 + 40);
  if (v3)
  {
    CFRelease(v3);
  }
}

@end