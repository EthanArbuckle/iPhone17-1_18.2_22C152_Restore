@interface CFNIsInDevelopmentEnvironment
@end

@implementation CFNIsInDevelopmentEnvironment

void ____CFNIsInDevelopmentEnvironment_block_invoke()
{
  __CFNIsInDevelopmentEnvironment::ok = os_variant_allows_internal_security_policies();
  if (__CFNIsInDevelopmentEnvironment::ok) {
    return;
  }
  v0 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  if (!v0) {
    return;
  }
  v1 = v0;
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(v0, @"get-task-allow", 0);
  if (v2)
  {
    __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
LABEL_7:
    CFRelease(v2);
    goto LABEL_8;
  }
  CFTypeRef v2 = SecTaskCopyValueForEntitlement(v1, @"com.apple.security.get-task-allow", 0);
  __CFNIsInDevelopmentEnvironment::ok = v2 == (CFTypeRef)*MEMORY[0x1E4F1CFD0];
  if (v2) {
    goto LABEL_7;
  }
LABEL_8:

  CFRelease(v1);
}

@end