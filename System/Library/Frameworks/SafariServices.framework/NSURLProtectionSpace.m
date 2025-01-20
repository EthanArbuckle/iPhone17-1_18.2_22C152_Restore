@interface NSURLProtectionSpace
@end

@implementation NSURLProtectionSpace

uint64_t __60__NSURLProtectionSpace_SafariServicesExtras___sf_identities__block_invoke(uint64_t a1, void *a2)
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  CFTypeID v4 = CFGetTypeID(v3);
  if (v4 == SecIdentityGetTypeID())
  {
    SecCertificateRef certificateRef = 0;
    uint64_t v5 = 0;
    if (!SecIdentityCopyCertificate((SecIdentityRef)v3, &certificateRef))
    {
      if (certificateRef)
      {
        CFTypeRef result = 0;
        uint64_t v6 = *MEMORY[0x1E4F3BB70];
        v13[0] = *MEMORY[0x1E4F3BD48];
        v13[1] = v6;
        uint64_t v7 = *(void *)(a1 + 32);
        v14[0] = certificateRef;
        v14[1] = v7;
        v13[2] = *MEMORY[0x1E4F3BC80];
        v14[2] = MEMORY[0x1E4F1CC38];
        OSStatus v8 = SecItemCopyMatching((CFDictionaryRef)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3], &result);
        char IsValid = SecCertificateIsValid();
        CFRelease(certificateRef);
        uint64_t v5 = 0;
        if (!v8)
        {
          if (result)
          {
            CFRelease(result);
            if (IsValid)
            {
              uint64_t v5 = 1;
            }
            else
            {
              uint64_t v5 = 0;
              ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
            }
          }
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end