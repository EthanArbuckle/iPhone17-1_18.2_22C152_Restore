@interface NTKCaliforniaStyleEditOption
+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4;
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedIndicNumeralsEditOptionsForDevice:(id)a3;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
+ (unint64_t)resolvedAutomaticStyleForCurrentLocale;
+ (unint64_t)resolvedNumeralSystemOfFirstLanguage;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKCaliforniaStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (unint64_t)resolvedNumeralSystemOfFirstLanguage
{
  uint64_t Language = CLKLocaleNumberSystemForFirstLanguage();
  if ((unint64_t)(Language - 1) > 0xD) {
    return 3;
  }
  else {
    return qword_17360[Language - 1];
  }
}

+ (unint64_t)resolvedAutomaticStyleForCurrentLocale
{
  uint64_t v2 = CLKLocaleCurrentNumberSystem();
  unint64_t v3 = 3;
  if (v2 == 2) {
    unint64_t v3 = 5;
  }
  if (v2 == 1) {
    return 4;
  }
  else {
    return v3;
  }
}

- (unint64_t)style
{
  return (unint64_t)[(NTKCaliforniaStyleEditOption *)self _value];
}

+ (BOOL)_valueIsValid:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 == -1) {
    return 1;
  }
  uint64_t v8 = v4;
  uint64_t v9 = v5;
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___NTKCaliforniaStyleEditOption;
  return objc_msgSendSuper2(&v7, "_valueIsValid:forDevice:", a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1F088);
  id WeakRetained = objc_loadWeakRetained(&qword_1F090);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_1F090);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_1F090, v3);
    qword_1F098 = (uint64_t)[v3 version];

    sub_1A34(v10, v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_1F098;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1F088);
  id v11 = (id)qword_1F080;

  return v11;
}

+ (id)_orderedIndicNumeralsEditOptionsForDevice:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v5 = _EnumValueRange();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v28;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        id v11 = +[NTKCaliforniaStyleEditOption _localizedNameForValue:forDevice:](NTKCaliforniaStyleEditOption, "_localizedNameForValue:forDevice:", [v10 unsignedIntegerValue], v3);
        [v4 setObject:v10 forKey:v11];
      }
      id v7 = [v5 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v7);
  }
  v12 = [v4 allKeys];
  v13 = [v12 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];

  id v14 = objc_alloc_init((Class)NSMutableArray);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v15 = v13;
  id v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v24;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v24 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v23 + 1) + 8 * (void)j), (void)v23);
        if (v20) {
          [v14 addObject:v20];
        }
      }
      id v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v17);
  }

  id v21 = [v14 copy];

  return v21;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 + 1 > 0x13) {
    return 0;
  }
  else {
    return *(&off_18560 + a3 + 1);
  }
}

- (id)localizedName
{
  unint64_t v3 = [(NTKCaliforniaStyleEditOption *)self style];
  id v4 = [(NTKCaliforniaStyleEditOption *)self device];
  uint64_t v5 = +[NTKCaliforniaStyleEditOption _localizedNameForValue:v3 forDevice:v4];

  return v5;
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
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
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_PILLS";
      break;
    case 1uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_ROMAN";
      break;
    case 2uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_CALIFORNIA";
      break;
    case 3uLL:
      CFStringRef v9 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_NUMERALS_COMPATIBILITY";
      CFStringRef v10 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_NUMERALS";
      goto LABEL_11;
    case 4uLL:
      CFStringRef v9 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_ARABIC_COMPATIBILITY";
      CFStringRef v10 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_ARABIC";
LABEL_11:
      if (v7) {
        uint64_t v8 = (__CFString *)v10;
      }
      else {
        uint64_t v8 = (__CFString *)v9;
      }
      break;
    case 5uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_HINDI";
      break;
    case 6uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_CHINESE";
      break;
    case 7uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_BENGALI";
      break;
    case 8uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_GURMUKHI";
      break;
    case 9uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_GUJARATI";
      break;
    case 0xAuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_TELUGU";
      break;
    case 0xBuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_MALAYALAM";
      break;
    case 0xCuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_KANNADA";
      break;
    case 0xDuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_ODIA";
      break;
    case 0xEuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_OL_CHIKI";
      break;
    case 0xFuLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_URDU";
      break;
    case 0x10uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_MEITEI";
      break;
    case 0x11uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_BURMESE";
      break;
    case 0x12uLL:
      uint64_t v8 = @"EDIT_OPTION_LABEL_CALIFORNIA_STYLE_KHMER";
      break;
    default:
      uint64_t v8 = 0;
      break;
  }
  id v11 = [(__CFString *)v8 stringByAppendingString:@"_COMPANION"];
  if (v11)
  {
    v12 = +[NTKCaliforniaFaceBundle localizedStringForKey:v11 comment:@"style"];
  }
  else
  {
    v12 = &stru_18F68;
  }

  return v12;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_1F0A8 != -1) {
    dispatch_once(&qword_1F0A8, &stru_18540);
  }
  uint64_t v2 = (void *)qword_1F0A0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end