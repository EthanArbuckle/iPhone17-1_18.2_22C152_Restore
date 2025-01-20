@interface NTKBigNumeralsDigitalTypefaceEditOption
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

@implementation NTKBigNumeralsDigitalTypefaceEditOption

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
    +[NSLocale localeWithLocaleIdentifier:](NSLocale, "localeWithLocaleIdentifier:", *(&off_C568 + a3), v3);
    a1 = (id)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (unint64_t)typeface
{
  return (unint64_t)[(NTKBigNumeralsDigitalTypefaceEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11ED0);
  id WeakRetained = objc_loadWeakRetained(&qword_11ED8);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v6 = WeakRetained;
  id v7 = objc_loadWeakRetained(&qword_11ED8);
  if (v7 != v4)
  {

LABEL_5:
    id v10 = objc_storeWeak(&qword_11ED8, v4);
    qword_11EE0 = (uint64_t)[v4 version];

    uint64_t v11 = objc_msgSend(a1, "__orderedValuesForDevice:", v4);
    v12 = (void *)qword_11EC8;
    qword_11EC8 = v11;

    goto LABEL_6;
  }
  id v8 = [v4 version];
  uint64_t v9 = qword_11EE0;

  if (v8 != (id)v9) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11ED0);
  id v13 = (id)qword_11EC8;

  return v13;
}

+ (id)__orderedValuesForDevice:(id)a3
{
  uint64_t v3 = _EnumValueRange();
  id v4 = [v3 arrayByExcludingObjectsInArray:&off_D580];

  return v4;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_C588 + a3);
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_C5A8 + a3);
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_11EF0 != -1) {
    dispatch_once(&qword_11EF0, &stru_C548);
  }
  v2 = (void *)qword_11EE8;

  return v2;
}

- (NSLocale)locale
{
  unint64_t v2 = [(NTKBigNumeralsDigitalTypefaceEditOption *)self typeface];

  return (NSLocale *)+[NTKBigNumeralsDigitalTypefaceEditOption localeForTypeface:v2];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end