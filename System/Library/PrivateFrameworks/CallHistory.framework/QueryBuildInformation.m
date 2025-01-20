@interface QueryBuildInformation
@end

@implementation QueryBuildInformation

void ___QueryBuildInformation_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v10 = xmmword_1E61C81F0;
  v11 = @"ReleaseType";
  CFArrayRef v0 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&v10, 3, MEMORY[0x1E4F1D510]);
  if (v0)
  {
    CFArrayRef v1 = v0;
    CFDictionaryRef v2 = (const __CFDictionary *)MGCopyMultipleAnswers();
    if (v2)
    {
      CFDictionaryRef v3 = v2;
      Value = CFDictionaryGetValue(v2, @"CarrierInstallCapability");
      v5 = (const void *)*MEMORY[0x1E4F1CFD0];
      _IsCarrierBuildCached = Value == (const void *)*MEMORY[0x1E4F1CFD0];
      v6 = CFDictionaryGetValue(v3, @"InternalBuild");
      _IsInternalBuildCached = v6 == v5;
      if (v6 != v5)
      {
        CFStringRef v7 = (const __CFString *)CFDictionaryGetValue(v3, @"ReleaseType");
        if (v7)
        {
          CFStringRef v8 = v7;
          CFTypeID v9 = CFGetTypeID(v7);
          if (v9 == CFStringGetTypeID() && CFEqual(v8, @"Desense")) {
            _IsInternalBuildCached = 1;
          }
        }
      }
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

@end