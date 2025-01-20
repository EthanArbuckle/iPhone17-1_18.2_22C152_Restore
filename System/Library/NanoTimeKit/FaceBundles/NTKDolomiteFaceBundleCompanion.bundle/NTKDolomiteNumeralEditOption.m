@interface NTKDolomiteNumeralEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)optionWithNumeral:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)numeral;
@end

@implementation NTKDolomiteNumeralEditOption

- (unint64_t)numeral
{
  return (unint64_t)[(NTKDolomiteNumeralEditOption *)self _value];
}

+ (id)optionWithNumeral:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)defaultOptionForDevice:(id)a3
{
  id v3 = a3;
  uint64_t v4 = CLKLocaleCurrentNumberSystem();
  if (v4 == 1) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = 2 * (v4 == 2);
  }
  v6 = +[NTKDolomiteNumeralEditOption optionWithNumeral:v5 forDevice:v3];

  return v6;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D5E7E8);
  id WeakRetained = objc_loadWeakRetained(&qword_D5E7F0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  uint64_t v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_D5E7F0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_D5E7F0, v3);
    qword_D5E7F8 = (uint64_t)[v3 version];

    sub_8110();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_D5E7F8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D5E7E8);
  id v10 = (id)qword_D5E7E0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_D58558 + a3);
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_D5E808 != -1) {
    dispatch_once(&qword_D5E808, &stru_D58538);
  }
  v2 = (void *)qword_D5E800;

  return v2;
}

- (id)localizedName
{
  if (_os_feature_enabled_impl())
  {
    id v3 = [(NTKDolomiteNumeralEditOption *)self device];
    id v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"10262875-CE7F-4736-BEE0-2233E4EAA468"];
    unsigned int v5 = [v3 supportsCapability:v4];
  }
  else
  {
    unsigned int v5 = 0;
  }
  unint64_t v6 = [(NTKDolomiteNumeralEditOption *)self numeral];
  CFStringRef v7 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC_COMPATIBILITY";
  if (v5) {
    CFStringRef v7 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC_INDIC";
  }
  CFStringRef v8 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC_COMPATIBILITY";
  if (v5) {
    CFStringRef v8 = @"EDIT_OPTION_LABEL_NUMERAL_ARABIC";
  }
  if (v6) {
    CFStringRef v8 = 0;
  }
  if (v6 != 1) {
    CFStringRef v7 = v8;
  }
  if (v6 == 2) {
    CFStringRef v9 = @"EDIT_OPTION_LABEL_NUMERAL_DEVANAGARI";
  }
  else {
    CFStringRef v9 = v7;
  }

  return +[NTKDolomiteFaceBundle localizedStringForKey:v9 comment:@"numeral"];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end