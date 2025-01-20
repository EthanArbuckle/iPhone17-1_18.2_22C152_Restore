@interface NSCoderGetTrustRestrictions
@end

@implementation NSCoderGetTrustRestrictions

void ___NSCoderGetTrustRestrictions_block_invoke()
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v0 = dlopen("/System/Library/Frameworks/Security.framework/Security", 256);
  if (v0
    && (v1 = v0,
        v2 = (uint64_t (*)(void))dlsym(v0, "SecTaskCreateFromSelf"),
        v3 = (unsigned int (*)(void))dlsym(v1, "SecTaskGetCodeSignStatus"),
        v4 = (uint64_t (*)(const void *, void))dlsym(v1, "SecTaskCopySigningIdentifier"),
        v2)
    && v3
    && (v5 = v4) != 0)
  {
    v6 = (const void *)v2(*MEMORY[0x1E4F1CF80]);
    if ((~v3() & 0x4000001) != 0)
    {
      v8 = (void *)v5(v6, 0);
      if (v8)
      {
        v9 = v8;
        if (_NSCoderIsAppleSigningIdentifier(v8)) {
          int v10 = 1;
        }
        else {
          int v10 = 2;
        }
        dword_1EB1ED194 = v10;
        CFRelease(v9);
      }
    }
    else
    {
      dword_1EB1ED194 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v7 = _NSOSLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_181795000, v7, OS_LOG_TYPE_ERROR, "NSCoder couldn't load a Security symbol.", v11, 2u);
    }
  }
}

@end