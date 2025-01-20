@interface NTKBigNumeralsDigitalStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKBigNumeralsDigitalStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKBigNumeralsDigitalStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_11F00);
  id WeakRetained = objc_loadWeakRetained(&qword_11F08);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_11F08);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_11F08, v3);
    qword_11F10 = (uint64_t)[v3 version];

    sub_73B0();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_11F10;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_11F00);
  id v10 = (id)qword_11EF8;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_C600 + a3);
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_C618 + a3);
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_11F20 != -1) {
    dispatch_once(&qword_11F20, &stru_C5E0);
  }
  v2 = (void *)qword_11F18;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end