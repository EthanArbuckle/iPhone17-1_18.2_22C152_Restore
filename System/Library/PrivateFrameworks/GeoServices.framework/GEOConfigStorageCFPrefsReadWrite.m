@interface GEOConfigStorageCFPrefsReadWrite
- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6;
@end

@implementation GEOConfigStorageCFPrefsReadWrite

- (void)setConfigValue:(id)a3 forKey:(id)a4 options:(unint64_t)a5 synchronous:(BOOL)a6
{
  BOOL v6 = a6;
  id value = a3;
  v8 = (__CFString *)a4;
  if (![(__CFString *)v8 length]
    || [(__CFString *)v8 length] == 1
    && [(__CFString *)v8 isEqualToString:@"/"])
  {
    _GEOResetAllDefaults(v6);
  }
  else
  {
    CFStringRef v9 = (const __CFString *)_GEOFullDefaultsDomain();
    CFPreferencesSetAppValue(v8, value, v9);
    CFStringRef v10 = (const __CFString *)_GEOFullDefaultsDomain();
    CFPreferencesSynchronize(v10, (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  }
}

@end