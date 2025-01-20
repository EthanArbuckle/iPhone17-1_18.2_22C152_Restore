@interface UTType
@end

@implementation UTType

uint64_t __70__UTType_FPCaching__fp_cachedTypeWithIdentifier_alreadyAvailableType___block_invoke()
{
  CFAllocatorRef Default = CFAllocatorGetDefault();
  v1 = SecTaskCreateFromSelf(Default);
  CFBooleanRef v2 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v1, @"com.apple.private.coreservices.canmaplsdatabase", 0);
  if (v2)
  {
    CFBooleanRef v3 = v2;
    CFTypeID v4 = CFGetTypeID(v2);
    if (v4 == CFBooleanGetTypeID()) {
      fp_cachedTypeWithIdentifier_alreadyAvailableType__hasFastSequenceNumber = CFBooleanGetValue(v3) != 0;
    }
    CFRelease(v3);
  }
  CFRelease(v1);
  fp_cachedTypeWithIdentifier_alreadyAvailableType__cache = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

@end