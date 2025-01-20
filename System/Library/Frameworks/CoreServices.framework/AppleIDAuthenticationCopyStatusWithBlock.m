@interface AppleIDAuthenticationCopyStatusWithBlock
@end

@implementation AppleIDAuthenticationCopyStatusWithBlock

void ___AppleIDAuthenticationCopyStatusWithBlock_block_invoke(uint64_t a1, const __CFDictionary *a2, int a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = *(void *)(a1 + 32);
  if (a3)
  {
    v19 = AppleIDGetLogHandle();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v21[0] = 67109120;
      v21[1] = a3;
      _os_log_impl(&dword_182959000, v19, OS_LOG_TYPE_ERROR, "SFAppleIDClientCopyAccountInfo failed with error %d\n", (uint8_t *)v21, 8u);
    }
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    goto LABEL_27;
  }
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (!a2)
  {
    CFAllocatorRef v20 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
LABEL_27:
    CFErrorRef v15 = CFErrorCreate(v20, @"CSIdentityErrorDomain", -11, 0);
    (*(void (**)(uint64_t, void, void, CFErrorRef))(v4 + 16))(v4, 0, 0, v15);
    Mutable = 0;
    goto LABEL_16;
  }
  v6 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E4F1D530];
  v7 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E4F1D540];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFMutableDictionaryRef v9 = CFDictionaryCreateMutable(v5, 0, v6, v7);
  v10 = v9;
  if (Mutable) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v12 = (const void *)getkSFAppleIDClientAccountInfoAppleIDCFKey();
    if (v12)
    {
      Value = CFDictionaryGetValue(a2, v12);
      CFTypeID TypeID = CFStringGetTypeID();
      if (Value && (!TypeID || CFGetTypeID(Value) == TypeID))
      {
        CFDictionaryAddValue(v10, Value, a2);
        CFDictionaryAddValue(Mutable, @"AccountStatuses", v10);
        CFErrorRef v15 = 0;
        uint64_t v16 = 1;
        v17 = Mutable;
LABEL_14:
        (*(void (**)(uint64_t, uint64_t, __CFDictionary *, CFErrorRef))(v4 + 16))(v4, v16, v17, v15);
LABEL_15:
        CFRelease(v10);
        goto LABEL_16;
      }
    }
    else
    {
      CFStringGetTypeID();
    }
    CFErrorRef v15 = CFErrorCreate(v5, @"CSIdentityErrorDomain", -11, 0);
    v17 = 0;
    uint64_t v16 = 0;
    goto LABEL_14;
  }
  CFErrorRef v15 = CFErrorCreate(v5, @"CSIdentityErrorDomain", -11, 0);
  (*(void (**)(uint64_t, void, void, CFErrorRef))(v4 + 16))(v4, 0, 0, v15);
  if (v10) {
    goto LABEL_15;
  }
LABEL_16:
  if (v15) {
    CFRelease(v15);
  }
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (a2) {
    CFRelease(a2);
  }
}

@end