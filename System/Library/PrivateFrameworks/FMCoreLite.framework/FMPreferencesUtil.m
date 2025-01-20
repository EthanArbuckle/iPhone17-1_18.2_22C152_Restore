@interface FMPreferencesUtil
+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4;
+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)arrayForKey:(id)a3 inDomain:(id)a4;
+ (id)arrayForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)dataForKey:(id)a3 inDomain:(id)a4;
+ (id)dataForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)dateForKey:(id)a3 inDomain:(id)a4;
+ (id)dateForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4;
+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)objectForKey:(id)a3 inDomain:(id)a4;
+ (id)objectForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (id)stringForKey:(id)a3 inDomain:(id)a4;
+ (id)stringForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4;
+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4 user:(id)a5;
+ (void)removeKey:(id)a3 inDomain:(id)a4;
+ (void)setArray:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setBool:(BOOL)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setData:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setDate:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setDictionary:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setObject:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)setString:(id)a3 forKey:(id)a4 inDomain:(id)a5;
+ (void)synchronizeDomain:(id)a3;
+ (void)synchronizeDomain:(id)a3 user:(id)a4;
@end

@implementation FMPreferencesUtil

+ (void)synchronizeDomain:(id)a3
{
}

+ (void)synchronizeDomain:(id)a3 user:(id)a4
{
}

+ (void)removeKey:(id)a3 inDomain:(id)a4
{
  applicationID = (__CFString *)a4;
  CFPreferencesSetAppValue((CFStringRef)a3, 0, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue((CFStringRef)a3, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v5 = AppBooleanValue == 0;
  }
  else {
    BOOL v5 = 1;
  }
  return !v5;
}

+ (BOOL)BOOLForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFBooleanRef v5 = (const __CFBoolean *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (!v5) {
    return 0;
  }
  CFBooleanRef v6 = v5;
  CFTypeID v7 = CFGetTypeID(v5);
  BOOL v8 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) == 1;
  CFRelease(v6);
  return v8;
}

+ (void)setBool:(BOOL)a3 forKey:(id)a4 inDomain:(id)a5
{
  CFBooleanRef v6 = (const void **)MEMORY[0x1E4F1CFD0];
  if (!a3) {
    CFBooleanRef v6 = (const void **)MEMORY[0x1E4F1CFC8];
  }
  CFTypeID v7 = *v6;
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, v7, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4
{
  Boolean keyExistsAndHasValidFormat = 0;
  int64_t result = CFPreferencesGetAppIntegerValue((CFStringRef)a3, (CFStringRef)a4, &keyExistsAndHasValidFormat);
  if (!keyExistsAndHasValidFormat) {
    return 0;
  }
  return result;
}

+ (int64_t)integerForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  int64_t result = (int64_t)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  int64_t valuePtr = 0;
  if (result)
  {
    CFNumberRef v6 = (const __CFNumber *)result;
    CFTypeID v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFNumberGetTypeID() && !CFNumberGetValue(v6, kCFNumberNSIntegerType, &valuePtr)) {
      int64_t valuePtr = 0;
    }
    CFRelease(v6);
    return valuePtr;
  }
  return result;
}

+ (void)setInteger:(int64_t)a3 forKey:(id)a4 inDomain:(id)a5
{
  CFTypeID v7 = NSNumber;
  applicationID = (__CFString *)a5;
  BOOL v8 = (__CFString *)a4;
  CFPreferencesSetAppValue(v8, (CFPropertyListRef)[v7 numberWithInteger:a3], applicationID);

  CFPreferencesAppSynchronize(applicationID);
}

+ (id)stringForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  CFBooleanRef v5 = (void *)v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFStringGetTypeID())
    {
      CFRelease(v5);
      CFBooleanRef v5 = 0;
    }
  }
  return v5;
}

+ (id)stringForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFTypeID v6 = (void *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFStringGetTypeID())
    {
      CFRelease(v6);
      CFTypeID v6 = 0;
    }
  }
  return v6;
}

+ (void)setString:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (id)dateForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  CFPropertyListRef v5 = (void *)v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDateGetTypeID())
    {
      CFRelease(v5);
      CFPropertyListRef v5 = 0;
    }
  }
  return v5;
}

+ (id)dateForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFTypeID v6 = (void *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFDateGetTypeID())
    {
      CFRelease(v6);
      CFTypeID v6 = 0;
    }
  }
  return v6;
}

+ (void)setDate:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  CFPropertyListRef v5 = (void *)v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDictionaryGetTypeID())
    {
      CFRelease(v5);
      CFPropertyListRef v5 = 0;
    }
  }
  return v5;
}

+ (id)dictionaryForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFTypeID v6 = (void *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFDictionaryGetTypeID())
    {
      CFRelease(v6);
      CFTypeID v6 = 0;
    }
  }
  return v6;
}

+ (void)setDictionary:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (id)arrayForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  CFPropertyListRef v5 = (void *)v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFArrayGetTypeID())
    {
      CFRelease(v5);
      CFPropertyListRef v5 = 0;
    }
  }
  return v5;
}

+ (id)arrayForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFTypeID v6 = (void *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFArrayGetTypeID())
    {
      CFRelease(v6);
      CFTypeID v6 = 0;
    }
  }
  return v6;
}

+ (void)setArray:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (id)dataForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  CFPropertyListRef v5 = (void *)v4;
  if (v4)
  {
    CFTypeID v6 = CFGetTypeID(v4);
    if (v6 != CFDataGetTypeID())
    {
      CFRelease(v5);
      CFPropertyListRef v5 = 0;
    }
  }
  return v5;
}

+ (id)dataForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  CFTypeID v6 = (void *)v5;
  if (v5)
  {
    CFTypeID v7 = CFGetTypeID(v5);
    if (v7 != CFDataGetTypeID())
    {
      CFRelease(v6);
      CFTypeID v6 = 0;
    }
  }
  return v6;
}

+ (void)setData:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

+ (id)objectForKey:(id)a3 inDomain:(id)a4
{
  CFPropertyListRef v4 = (void *)CFPreferencesCopyAppValue((CFStringRef)a3, (CFStringRef)a4);
  return v4;
}

+ (id)objectForKey:(id)a3 inDomain:(id)a4 user:(id)a5
{
  CFPropertyListRef v5 = (void *)CFPreferencesCopyValue((CFStringRef)a3, (CFStringRef)a4, (CFStringRef)a5, (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  return v5;
}

+ (void)setObject:(id)a3 forKey:(id)a4 inDomain:(id)a5
{
  applicationID = (__CFString *)a5;
  CFPreferencesSetAppValue((CFStringRef)a4, a3, applicationID);
  CFPreferencesAppSynchronize(applicationID);
}

@end