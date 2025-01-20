@interface NTKAegirVistaEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithVista:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)vista;
@end

@implementation NTKAegirVistaEditOption

+ (id)optionWithVista:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__optionWithValue_forDevice_);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA8FC928);
  id WeakRetained = objc_loadWeakRetained(&qword_1EA8FC930);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_1EA8FC930);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_1EA8FC930, v3);
    qword_1EA8FC938 = [v3 version];

    sub_1DAFD7A64();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = qword_1EA8FC938;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA8FC928);
  id v10 = (id)qword_1EA8FC920;

  return v10;
}

- (unint64_t)vista
{
  return MEMORY[0x1F4181798](self, sel__value);
}

- (id)localizedName
{
  unint64_t v2 = [(NTKAegirVistaEditOption *)self vista] - 1;
  if (v2 > 9) {
    id v3 = @"EDIT_OPTION_LABEL_CONTENT_EARTH";
  }
  else {
    id v3 = off_1E6BE3CD0[v2];
  }
  v4 = [(__CFString *)v3 stringByAppendingString:@"_COMPANION"];
  v5 = +[NTKFaceBundle localizedStringForKey:v4 comment:v4];

  return v5;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 0xA) {
    return 0;
  }
  else {
    return off_1E6BE3D20[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_1EA8FC948 != -1) {
    dispatch_once(&qword_1EA8FC948, &unk_1F3524F58);
  }
  unint64_t v2 = (void *)qword_1EA8FC940;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end