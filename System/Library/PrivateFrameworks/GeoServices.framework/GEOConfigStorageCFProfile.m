@interface GEOConfigStorageCFProfile
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
@end

@implementation GEOConfigStorageCFProfile

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  GEOConfig_stripEntitlement(a3);
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringRef v8 = (const __CFString *)GEODefaultsDomain();
  if (CFPreferencesAppValueIsForced(v7, v8))
  {
    CFStringRef v9 = (const __CFString *)_GEOFullDefaultsDomain();
    v10 = (void *)CFPreferencesCopyAppValue(v7, v9);
    v11 = v10;
    if (a6) {
      *a6 = 1;
    }
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1CA98] null];
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void ___GEOConfigStorageCFProfile_block_invoke()
{
  v0 = objc_alloc_init(GEOConfigStorageCFProfile);
  v1 = (void *)qword_1EB2A0230;
  qword_1EB2A0230 = (uint64_t)v0;
}

@end