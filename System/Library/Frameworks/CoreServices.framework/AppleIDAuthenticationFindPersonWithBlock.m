@interface AppleIDAuthenticationFindPersonWithBlock
@end

@implementation AppleIDAuthenticationFindPersonWithBlock

void ___AppleIDAuthenticationFindPersonWithBlock_block_invoke(uint64_t a1, const __CFArray *a2, int a3)
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v6 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v11[0]) = 67109120;
      HIDWORD(v11[0]) = a3;
      _os_log_impl(&dword_182959000, v6, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyPersonInfo failed with error %d\n", (uint8_t *)v11, 8u);
    }
    CFAllocatorRef v7 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  }
  else
  {
    CFAllocatorRef v9 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
    if (Mutable)
    {
      CFErrorRef v8 = Mutable;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 0x40000000;
      v11[2] = ___ZL41handleSFAppleIDClientCopyPersonInfoResultPK9__CFArrayiU13block_pointerFvS1_hP9__CFErrorE_block_invoke;
      v11[3] = &__block_descriptor_tmp_74;
      v11[4] = Mutable;
      CFArrayApplyBlock(a2, (uint64_t)v11);
      (*(void (**)(uint64_t, CFErrorRef, uint64_t, void))(v4 + 16))(v4, v8, 1, 0);
      goto LABEL_11;
    }
    CFAllocatorRef v7 = v9;
  }
  CFErrorRef v8 = CFErrorCreate(v7, @"CSIdentityErrorDomain", -11, 0);
  (*(void (**)(uint64_t, void, uint64_t, CFErrorRef))(v4 + 16))(v4, 0, 1, v8);
  if (!v8)
  {
    if (!a2) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  CFRelease(v8);
  if (a2) {
LABEL_7:
  }
    CFRelease(a2);
}

@end