@interface NTKBigNumeralsAnalogTypefaceEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForLocale:(id)a3 device:(id)a4;
+ (id)localeForTypeface:(unint64_t)a3;
+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4;
- (NSLocale)locale;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKBigNumeralsAnalogTypefaceEditOption

+ (id)defaultOptionForLocale:(id)a3 device:(id)a4
{
  id v5 = a4;
  v6 = +[NSLocale currentLocale];
  v7 = [v6 localeIdentifier];
  v8 = +[IntlUtility numberingSystemForLocaleID:v7];

  if ([v8 isEqualToString:@"latn"])
  {
    uint64_t v9 = 0;
  }
  else if ([v8 isEqualToString:@"arab"])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:@"deva"])
  {
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  v10 = [a1 optionWithTypeface:v9 forDevice:v5];

  return v10;
}

+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)localeForTypeface:(unint64_t)a3
{
  if (a3 <= 3)
  {
    +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", *(&off_C458 + a3), v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (unint64_t)typeface
{
  return (unint64_t)[(NTKBigNumeralsAnalogTypefaceEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_115C0);
  id WeakRetained = objc_loadWeakRetained(&qword_115C8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_115C8);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_115C8, v4);
    qword_115D0 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_115B8;
    qword_115B8 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_115D0;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_115C0);
  id v13 = (id)qword_115B8;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  return (id)_EnumValueRange();
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_C478 + a3);
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id v5 = a4;
  if (_os_feature_enabled_impl())
  {
    id v6 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"10262875-CE7F-4736-BEE0-2233E4EAA468"];
    unsigned int v7 = [v5 supportsCapability:v6];
  }
  else
  {
    unsigned int v7 = 0;
  }
  switch(a3)
  {
    case 0uLL:
      CFStringRef v8 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_WESTERN_ARABIC_COMPATIBILITY";
      CFStringRef v9 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_WESTERN_ARABIC";
      goto LABEL_8;
    case 1uLL:
      CFStringRef v8 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_EASTERN_ARABIC_COMPATIBILITY";
      CFStringRef v9 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_EASTERN_ARABIC";
LABEL_8:
      if (v7) {
        CFStringRef v10 = v9;
      }
      else {
        CFStringRef v10 = v8;
      }
      break;
    case 2uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_DEVANAGARI";
      break;
    case 3uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_TYPEFACE_ROMAN";
      break;
    default:
      CFStringRef v10 = 0;
      break;
  }

  return (id)v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_115E0 != -1) {
    dispatch_once(&qword_115E0, &stru_C438);
  }
  v2 = (void *)qword_115D8;

  return v2;
}

- (NSLocale)locale
{
  unint64_t v2 = [(NTKBigNumeralsAnalogTypefaceEditOption *)self typeface];

  return (NSLocale *)+[NTKBigNumeralsAnalogTypefaceEditOption localeForTypeface:v2];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end