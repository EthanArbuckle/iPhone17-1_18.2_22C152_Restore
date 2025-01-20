@interface AppleIDUpdateLinkedIdentityProvisioningWithBlock
@end

@implementation AppleIDUpdateLinkedIdentityProvisioningWithBlock

void ___AppleIDUpdateLinkedIdentityProvisioningWithBlock_block_invoke(uint64_t a1)
{
  CFTypeRef cf = 0;
  _CSIdentityUpdateLinkedIdentityProvisioning(*(void *)(a1 + 40), (CFErrorRef *)&cf);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (cf) {
    CFRelease(cf);
  }
}

@end