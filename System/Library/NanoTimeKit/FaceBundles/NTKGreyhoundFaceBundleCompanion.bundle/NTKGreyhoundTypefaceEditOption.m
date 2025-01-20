@interface NTKGreyhoundTypefaceEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKGreyhoundTypefaceEditOption

- (unint64_t)typeface
{
  return (unint64_t)[(NTKGreyhoundTypefaceEditOption *)self _value];
}

+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_193A8);
  id WeakRetained = objc_loadWeakRetained(&qword_193B0);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_193B0);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_193B0, v3);
    qword_193B8 = (uint64_t)[v3 version];

    sub_4628();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_193B8;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_193A8);
  id v10 = (id)qword_193A0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_143B8 + a3);
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_193C8 != -1) {
    dispatch_once(&qword_193C8, &stru_14398);
  }
  v2 = (void *)qword_193C0;

  return v2;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKGreyhoundTypefaceEditOption *)self typeface];
  if (v2 > 2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_143D0 + v2);
  }

  return +[NTKGreyhoundFaceBundle localizedStringForKey:v3 comment:@"typeface"];
}

- (int64_t)swatchStyle
{
  return 3;
}

@end