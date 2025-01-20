@interface NTKAegirStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKAegirStyleEditOption

- (unint64_t)style
{
  return MEMORY[0x1F4181798](self, sel__value);
}

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__optionWithValue_forDevice_);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EA8FC8F8);
  id WeakRetained = objc_loadWeakRetained(&qword_1EA8FC900);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_1EA8FC900);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_1EA8FC900, v3);
    qword_1EA8FC908 = [v3 version];

    sub_1DAFD7704();
    goto LABEL_6;
  }
  uint64_t v7 = [v3 version];
  uint64_t v8 = qword_1EA8FC908;

  if (v7 != v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EA8FC8F8);
  id v10 = (id)qword_1EA8FC8F0;

  return v10;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 7) {
    return 0;
  }
  else {
    return off_1E6BE3C50[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_1EA8FC918 != -1) {
    dispatch_once(&qword_1EA8FC918, &unk_1F3524F38);
  }
  v2 = (void *)qword_1EA8FC910;

  return v2;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKAegirStyleEditOption *)self style];
  if (v2 > 7)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [(__CFString *)off_1E6BE3C90[v2] stringByAppendingString:@"_COMPANION"];
  }
  v4 = +[NTKFaceBundle localizedStringForKey:v3 comment:@"style"];

  return v4;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end