@interface NTKBigNumeralsAnalogStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKBigNumeralsAnalogStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKBigNumeralsAnalogStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11590);
  id WeakRetained = objc_loadWeakRetained(&qword_11598);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_11598);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_11598, v3);
    qword_115A0 = (uint64_t)[v3 version];

    sub_7798();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_115A0;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11590);
  id v10 = (id)qword_11588;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"outline";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"fill";
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"EDIT_OPTION_LABEL_BIG_NUMERALS_STYLE_OUTLINE";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"EDIT_OPTION_LABEL_BIG_NUMERALS_STYLE_FILL";
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_115B0 != -1) {
    dispatch_once(&qword_115B0, &stru_C418);
  }
  v2 = (void *)qword_115A8;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end