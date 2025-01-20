@interface AppleIDAuthenticationCopyAppleIDsWithBlock
@end

@implementation AppleIDAuthenticationCopyAppleIDsWithBlock

void ___AppleIDAuthenticationCopyAppleIDsWithBlock_block_invoke(uint64_t a1, const void *a2, int a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v6 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v11[0] = 67109120;
      v11[1] = a3;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyMyAppleID failed with error %d\n", (uint8_t *)v11, 8u);
    }
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  }
  else
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      CFErrorRef v8 = Mutable;
      if (a2) {
        CFArrayAppendValue(Mutable, a2);
      }
      (*(void (**)(uint64_t, CFErrorRef, void))(v4 + 16))(v4, v8, 0);
      goto LABEL_13;
    }
    CFAllocatorRef v7 = v9;
  }
  CFErrorRef v8 = CFErrorCreate(v7, @"CSIdentityErrorDomain", -11, 0);
  (*(void (**)(uint64_t, void, CFErrorRef))(v4 + 16))(v4, 0, v8);
  if (!v8)
  {
    if (!a2) {
      return;
    }
    goto LABEL_7;
  }
LABEL_13:
  CFRelease(v8);
  if (a2) {
LABEL_7:
  }
    CFRelease(a2);
}

@end