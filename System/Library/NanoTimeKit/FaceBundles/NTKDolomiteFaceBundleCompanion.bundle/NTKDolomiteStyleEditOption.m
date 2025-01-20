@interface NTKDolomiteStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)defaultOptionForDevice:(id)a3;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKDolomiteStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)defaultOptionForDevice:(id)a3
{
  return +[NTKDolomiteStyleEditOption optionWithStyle:0 forDevice:a3];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKDolomiteStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_D5E818);
  id WeakRetained = objc_loadWeakRetained(&qword_D5E820);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_D5E820);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_D5E820, v3);
    qword_D5E828 = (uint64_t)[v3 version];

    sub_8484();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_D5E828;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_D5E818);
  id v10 = (id)qword_D5E810;

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
    return @"filled";
  }
}

- (id)localizedName
{
  if ((char *)[(NTKDolomiteStyleEditOption *)self style] == (char *)&dword_0 + 1) {
    v2 = @"EDIT_OPTION_LABEL_STYLE_OUTLINE";
  }
  else {
    v2 = @"EDIT_OPTION_LABEL_STYLE_FILLED";
  }
  id v3 = [(__CFString *)v2 stringByAppendingString:@"_COMPANION"];
  CFStringRef v4 = +[NTKDolomiteFaceBundle localizedStringForKey:v3 comment:@"style"];

  return v4;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_D5E838 != -1) {
    dispatch_once(&qword_D5E838, &stru_D58570);
  }
  v2 = (void *)qword_D5E830;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end