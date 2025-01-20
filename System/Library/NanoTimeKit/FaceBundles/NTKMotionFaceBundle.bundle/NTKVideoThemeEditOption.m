@interface NTKVideoThemeEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithVideoTheme:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)videoTheme;
@end

@implementation NTKVideoThemeEditOption

+ (id)optionWithVideoTheme:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)videoTheme
{
  return (unint64_t)[(NTKVideoThemeEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_CA00);
  id WeakRetained = objc_loadWeakRetained(&qword_CA08);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_CA08);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_CA08, v3);
    qword_CA10 = (uint64_t)[v3 version];

    v10 = (void *)qword_C9F8;
    qword_C9F8 = (uint64_t)&off_8978;

    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_CA10;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_CA00);
  id v11 = (id)qword_C9F8;

  return v11;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_82D0[a3];
  }
}

+ (id)localizedNameForValidValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2)
  {
    id v7 = 0;
  }
  else
  {
    v4 = off_82E8[a3];
    v5 = objc_msgSend(@"Motion", "stringByAppendingString:", @"-Companion", a4);
    id v6 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
    id v7 = +[NTKMotionFaceBundle localizedStringForKey:v6 table:v5 comment:@"Motion Style"];
  }

  return v7;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_CA20 != -1) {
    dispatch_once(&qword_CA20, &stru_82B0);
  }
  v2 = (void *)qword_CA18;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end