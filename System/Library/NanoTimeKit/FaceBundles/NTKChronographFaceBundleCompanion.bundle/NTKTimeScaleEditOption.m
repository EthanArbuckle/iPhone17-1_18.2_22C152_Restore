@interface NTKTimeScaleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTimeScale:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionsDescription;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKTimeScaleEditOption

+ (id)optionWithTimeScale:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_23918);
  id WeakRetained = objc_loadWeakRetained(&qword_23920);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_23920);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_23920, v3);
    qword_23928 = (uint64_t)[v3 version];

    sub_48A0();
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_23928;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_23918);
  id v10 = (id)qword_23910;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return *(&off_1C668 + a3);
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKTimeScaleEditOption *)self timeScale];
  if (v2 > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_1C688 + v2);
  }

  return +[NTKChronographFaceBundle localizedStringForKey:v3 comment:@"timescale"];
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_23938 != -1) {
    dispatch_once(&qword_23938, &stru_1C648);
  }
  unint64_t v2 = (void *)qword_23930;

  return v2;
}

- (int64_t)swatchStyle
{
  return 1;
}

+ (id)optionsDescription
{
  return +[NTKChronographFaceBundle localizedStringForKey:@"EDIT_MODE_CHRONO_DENSITY_DESCRIPTION" comment:@"options description"];
}

@end