@interface MKRAPCheckEntitlements
@end

@implementation MKRAPCheckEntitlements

void ___MKRAPCheckEntitlements_block_invoke()
{
  v0 = [MEMORY[0x1E4F64860] sharedPlatform];
  int v1 = [v0 isInternalInstall];

  if (v1)
  {
    _MKRAPCheckEntitlements_entitlementCheckPassed = 0;
    uint64_t v17 = 0;
    v18 = &v17;
    uint64_t v19 = 0x2020000000;
    v2 = (uint64_t (*)(void))getSecTaskCreateFromSelfSymbolLoc_ptr;
    v20 = getSecTaskCreateFromSelfSymbolLoc_ptr;
    if (!getSecTaskCreateFromSelfSymbolLoc_ptr)
    {
      cf[0] = (CFTypeRef)MEMORY[0x1E4F143A8];
      cf[1] = (CFTypeRef)3221225472;
      cf[2] = __getSecTaskCreateFromSelfSymbolLoc_block_invoke;
      cf[3] = &unk_1E54B8448;
      v16 = &v17;
      v3 = (void *)SecurityLibrary();
      v18[3] = (uint64_t)dlsym(v3, "SecTaskCreateFromSelf");
      getSecTaskCreateFromSelfSymbolLoc_ptr = *(_UNKNOWN **)(v16[1] + 24);
      v2 = (uint64_t (*)(void))v18[3];
    }
    _Block_object_dispose(&v17, 8);
    if (!v2)
    {
      dlerror();
      v14 = (_Unwind_Exception *)abort_report_np();
      _Block_object_dispose(&v17, 8);
      _Unwind_Resume(v14);
    }
    uint64_t v4 = v2(0);
    if (v4)
    {
      v5 = (const void *)v4;
      cf[0] = 0;
      CFBooleanRef v6 = (const __CFBoolean *)mk_SecTaskCopyValueForEntitlement(v4, @"com.apple.accounts.appleaccount.fullaccess", (uint64_t)cf);
      if (v6)
      {
        CFBooleanRef v7 = v6;
        CFTypeID v8 = CFGetTypeID(v6);
        BOOL v9 = v8 == CFBooleanGetTypeID() && CFBooleanGetValue(v7) != 0;
        _MKRAPCheckEntitlements_entitlementCheckPassed = v9;
        CFRelease(v7);
      }
      if (!_MKRAPCheckEntitlements_entitlementCheckPassed)
      {
        CFBooleanRef v10 = (const __CFBoolean *)mk_SecTaskCopyValueForEntitlement((uint64_t)v5, @"com.apple.private.accounts.allaccounts", (uint64_t)cf);
        if (v10)
        {
          CFBooleanRef v11 = v10;
          CFTypeID v12 = CFGetTypeID(v10);
          BOOL v13 = v12 == CFBooleanGetTypeID() && CFBooleanGetValue(v11) != 0;
          _MKRAPCheckEntitlements_entitlementCheckPassed = v13;
          CFRelease(v11);
        }
      }
      CFRelease(v5);
      if (cf[0]) {
        CFRelease(cf[0]);
      }
    }
    if (!_MKRAPCheckEntitlements_entitlementCheckPassed) {
      NSLog(&cfstr_MapsPlaceViewC.isa, @"com.apple.accounts.appleaccount.fullaccess", @"com.apple.private.accounts.allaccounts");
    }
  }
}

@end