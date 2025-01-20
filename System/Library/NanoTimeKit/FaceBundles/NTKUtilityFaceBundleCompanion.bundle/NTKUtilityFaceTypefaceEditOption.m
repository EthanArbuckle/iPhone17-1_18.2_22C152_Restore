@interface NTKUtilityFaceTypefaceEditOption
+ (id)__orderedValuesForDevice:(id)a3;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedIndicNumeralsEditOptionsForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForLocale:(id)a3 device:(id)a4;
+ (id)localeForTypeface:(unint64_t)a3;
+ (id)localizedStringForKey:(id)a3;
+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)locale;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKUtilityFaceTypefaceEditOption

+ (id)defaultOptionForLocale:(id)a3 device:(id)a4
{
  id v5 = a4;
  uint64_t v6 = CLKLocaleCurrentNumberSystem();
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6 == 1;
  }
  v8 = [a1 optionWithTypeface:v7 forDevice:v5];

  return v8;
}

+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)localizedStringForKey:(id)a3
{
  return +[NTKUtilityFaceBundle localizedStringForKey:a3 comment:@"typeface"];
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = +[NTKUtilityFaceTypefaceEditOption _nameLocalizationKeyForValue:a3 forDevice:a4];
  id v5 = +[NTKUtilityFaceTypefaceEditOption localizedStringForKey:v4];

  return v5;
}

+ (id)localeForTypeface:(unint64_t)a3
{
  if (a3 <= 0xE)
  {
    +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", *(&off_10760 + a3), v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16BB8);
  id WeakRetained = objc_loadWeakRetained(&qword_16BC0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_16BC0);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_16BC0, v4);
    qword_16BC8 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_16BB0;
    qword_16BB0 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_16BC8;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16BB8);
  id v13 = (id)qword_16BB0;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  id v4 = _EnumValueRange();
  if (NTKShowIndicScriptNumerals())
  {
    id v5 = +[NTKUtilityFaceTypefaceEditOption _orderedIndicNumeralsEditOptionsForDevice:v3];
    uint64_t v6 = [v4 arrayByAddingObjectsFromArray:v5];

    id v4 = (void *)v6;
  }

  return v4;
}

+ (id)_orderedIndicNumeralsEditOptionsForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_16BD8);
  id WeakRetained = objc_loadWeakRetained(&qword_16BE0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  id v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_16BE0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_16BE0, v3);
    qword_16BE8 = (uint64_t)[v3 version];

    sub_A204(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_16BE8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_16BD8);
  id v11 = (id)qword_16BD0;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 0xE) {
    return 0;
  }
  else {
    return *(&off_107D8 + a3);
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
      CFStringRef v8 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_WESTERN_ARABIC_COMPATIBILITY";
      CFStringRef v9 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_WESTERN_ARABIC";
      goto LABEL_8;
    case 1uLL:
      CFStringRef v8 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_EASTERN_ARABIC_COMPATIBILITY";
      CFStringRef v9 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_EASTERN_ARABIC";
LABEL_8:
      if (v7) {
        CFStringRef v10 = v9;
      }
      else {
        CFStringRef v10 = v8;
      }
      break;
    case 2uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_DEVANAGARI";
      break;
    case 3uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_BENGALI";
      break;
    case 4uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_GURMUKHI";
      break;
    case 5uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_GUJARATI";
      break;
    case 6uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_TELUGU";
      break;
    case 7uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_MALAYALAM";
      break;
    case 8uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_KANNADA";
      break;
    case 9uLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_ODIA";
      break;
    case 0xAuLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_OL_CHIKI";
      break;
    case 0xBuLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_URDU";
      break;
    case 0xCuLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_MEITEI";
      break;
    case 0xDuLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_BURMESE";
      break;
    case 0xEuLL:
      CFStringRef v10 = @"EDIT_OPTION_LABEL_UTILITY_TYPEFACE_KHMER";
      break;
    default:
      CFStringRef v10 = 0;
      break;
  }

  return (id)v10;
}

- (unint64_t)typeface
{
  return (unint64_t)[(NTKUtilityFaceTypefaceEditOption *)self _value];
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16BF8 != -1) {
    dispatch_once(&qword_16BF8, &stru_10740);
  }
  v2 = (void *)qword_16BF0;

  return v2;
}

- (id)locale
{
  unint64_t v2 = [(NTKUtilityFaceTypefaceEditOption *)self typeface];

  return +[NTKUtilityFaceTypefaceEditOption localeForTypeface:v2];
}

- (int64_t)swatchStyle
{
  return 1;
}

@end