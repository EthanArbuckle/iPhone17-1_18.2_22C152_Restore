@interface NSUserDefaults(MFUtilities)
+ (CFPropertyListRef)mf_copyCompositionServicesPreferenceValueForKey:()MFUtilities;
+ (void)mf_setCompositionServicesPreferenceValue:()MFUtilities forKey:;
@end

@implementation NSUserDefaults(MFUtilities)

+ (void)mf_setCompositionServicesPreferenceValue:()MFUtilities forKey:
{
  id value = a3;
  v5 = a4;
  CFStringRef v6 = (const __CFString *)_CopyCompositionServicesDomain();
  if (v6)
  {
    CFPreferencesSetAppValue(v5, value, v6);
    CFPreferencesAppSynchronize(v6);
    CFRelease(v6);
  }
}

+ (CFPropertyListRef)mf_copyCompositionServicesPreferenceValueForKey:()MFUtilities
{
  v3 = a3;
  CFStringRef v4 = (const __CFString *)_CopyCompositionServicesDomain();
  if (v4)
  {
    CFPropertyListRef v5 = CFPreferencesCopyAppValue(v3, v4);
    CFRelease(v4);
  }
  else
  {
    CFPropertyListRef v5 = 0;
  }

  return v5;
}

@end