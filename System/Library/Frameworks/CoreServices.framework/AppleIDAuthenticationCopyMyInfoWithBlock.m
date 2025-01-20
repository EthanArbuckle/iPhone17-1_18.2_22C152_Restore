@interface AppleIDAuthenticationCopyMyInfoWithBlock
@end

@implementation AppleIDAuthenticationCopyMyInfoWithBlock

void ___AppleIDAuthenticationCopyMyInfoWithBlock_block_invoke(uint64_t a1)
{
  CFErrorRef v2 = CFErrorCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], @"CSIdentityErrorDomain", -114, 0);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2)
  {
    CFRelease(v2);
  }
}

@end