@interface GEOConfigStorageCFPrefsReadOnly
- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6;
@end

@implementation GEOConfigStorageCFPrefsReadOnly

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v8 = a4;
  GEOConfig_stripEntitlement(a3);
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (![(__CFString *)v9 length])
  {
    CFStringRef v14 = (const __CFString *)_GEOFullDefaultsDomain();
    v15 = CFPreferencesCopyMultiple(0, v14, (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
LABEL_11:
    v13 = v15;
    goto LABEL_12;
  }
  if (![v8 length])
  {
LABEL_10:
    CFStringRef v16 = (const __CFString *)_GEOFullDefaultsDomain();
    v15 = (void *)CFPreferencesCopyAppValue(v9, v16);
    goto LABEL_11;
  }
  CFStringRef v10 = (const __CFString *)_GEOFullDefaultsDomain();
  v11 = (void *)CFPreferencesCopyAppValue(@"CountryProviders", v10);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  v12 = [v11 objectForKeyedSubscript:v8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_9;
  }
  v13 = [v12 objectForKeyedSubscript:v9];

  if (!v13) {
    goto LABEL_10;
  }
LABEL_12:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![v13 length])
  {
    id v17 = 0;
  }
  else
  {
    if (a6 && v13) {
      *a6 = 2;
    }
    id v17 = v13;
  }

  return v17;
}

@end