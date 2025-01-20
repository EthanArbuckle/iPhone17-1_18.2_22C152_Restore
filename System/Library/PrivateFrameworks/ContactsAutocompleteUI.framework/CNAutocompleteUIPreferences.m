@interface CNAutocompleteUIPreferences
+ (id)copyCompositionServicesPreferenceValueForKey:(id)a3;
+ (void)setCompositionServicesPreferenceValue:(id)a3 forKey:(id)a4;
@end

@implementation CNAutocompleteUIPreferences

+ (void)setCompositionServicesPreferenceValue:(id)a3 forKey:(id)a4
{
  id value = a3;
  v5 = (__CFString *)a4;
  CFStringRef v6 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v6)
  {
    CFStringRef v7 = v6;
    CFPreferencesSetAppValue(v5, value, v6);
    CFPreferencesAppSynchronize(v7);
    CFRelease(v7);
  }
}

+ (id)copyCompositionServicesPreferenceValueForKey:(id)a3
{
  v3 = (__CFString *)a3;
  CFStringRef v4 = (const __CFString *)CPCopySharedResourcesPreferencesDomainForDomain();
  if (v4)
  {
    CFStringRef v5 = v4;
    CFPropertyListRef v6 = CFPreferencesCopyAppValue(v3, v4);
    CFRelease(v5);
  }
  else
  {
    CFPropertyListRef v6 = 0;
  }

  return (id)v6;
}

@end