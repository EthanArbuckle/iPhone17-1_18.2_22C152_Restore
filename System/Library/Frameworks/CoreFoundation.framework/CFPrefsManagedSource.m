@interface CFPrefsManagedSource
- (BOOL)managed;
- (id)initWithDomain:(uint64_t)a3 user:(uint64_t)a4 byHost:(uint64_t)a5 containingPreferences:;
- (uint64_t)sendMessageSettingValue:forKey:;
- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6;
@end

@implementation CFPrefsManagedSource

- (BOOL)managed
{
  return 1;
}

- (id)initWithDomain:(uint64_t)a3 user:(uint64_t)a4 byHost:(uint64_t)a5 containingPreferences:
{
  uint64_t v6 = *(void *)off_1ECE0A5B0;
  if (result)
  {
    v5.receiver = result;
    v5.super_class = (Class)CFPrefsManagedSource;
    return objc_msgSendSuper2(&v5, sel_initWithDomain_user_byHost_containerPath_containingPreferences_, a2, a3, a4, 0, a5);
  }
  return result;
}

- (uint64_t)sendMessageSettingValue:forKey:
{
  return 0;
}

- (void)alreadylocked_setPrecopiedValues:(const void *)a3 forKeys:(const __CFString *)a4 count:(int64_t)a5 from:(id)a6
{
  uint64_t v19 = *(void *)off_1ECE0A5B0;
  if (a5 >= 1)
  {
    int64_t v7 = a5;
    do
    {
      CFStringRef v10 = *a4;
      v11 = *a3;
      v12 = [(CFPrefsPlistSource *)self alreadylocked_copyDictionary];
      if (v12)
      {
        v13 = v12;
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, v12);
        if (!MutableCopy) {
          MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        }
        CFRelease(v13);
      }
      else
      {
        MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)&__kCFAllocatorSystemDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      }
      if (v11) {
        CFDictionarySetValue(MutableCopy, v10, v11);
      }
      else {
        CFDictionaryRemoveValue(MutableCopy, v10);
      }
      bzero(v18, 0x400uLL);
      v15 = [(CFPrefsPlistSource *)self userIdentifier];
      if (CFEqual(v15, @"kCFPreferencesCurrentUser")) {
        v15 = (__CFString *)CFCopyUserName();
      }
      else {
        CFRetain(v15);
      }
      if (_CFPrefsGetPathForManagedBundleID([(CFPrefsPlistSource *)self domainIdentifier], v15, 0, v18))
      {
        CFStringRef v16 = CFStringCreateWithFileSystemRepresentation((CFAllocatorRef)&__kCFAllocatorSystemDefault, (const char *)v18);
        if (v16)
        {
          CFStringRef v17 = v16;
          _CFPreferencesWriteDomainDictionaryToPath((unint64_t)MutableCopy, (uint64_t)v16, [(CFPrefsPlistSource *)self domainIdentifier]);
          CFRelease(v17);
        }
      }
      CFRelease(v15);
      CFRelease(MutableCopy);
      ++a3;
      ++a4;
      --v7;
    }
    while (v7);
  }
  atomic_fetch_add(&self->super.super._generationCount, 1uLL);
}

@end