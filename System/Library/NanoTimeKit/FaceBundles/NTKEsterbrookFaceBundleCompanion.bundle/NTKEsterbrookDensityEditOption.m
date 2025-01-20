@interface NTKEsterbrookDensityEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithDensity:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)density;
@end

@implementation NTKEsterbrookDensityEditOption

+ (id)optionWithDensity:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

- (unint64_t)density
{
  return ((uint64_t (*)(NTKEsterbrookDensityEditOption *, char *))MEMORY[0x270F9A6D0])(self, sel__value);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2691C1F28);
  id WeakRetained = objc_loadWeakRetained(&qword_2691C1F30);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_2691C1F30);
  if (v6 != v3)
  {

LABEL_5:
    id v12 = objc_storeWeak(&qword_2691C1F30, v3);
    qword_2691C1F38 = objc_msgSend_version(v3, v13, v14, v15);

    sub_246A83238();
    goto LABEL_6;
  }
  uint64_t v10 = objc_msgSend_version(v3, v7, v8, v9);
  uint64_t v11 = qword_2691C1F38;

  if (v10 != v11) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2691C1F28);
  id v16 = (id)qword_2691C1F20;

  return v16;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_2651F4C78[a3];
  }
}

- (id)localizedName
{
  unint64_t v4 = objc_msgSend_density(self, a2, v2, v3);
  if (v4 > 3) {
    objc_msgSend_stringByAppendingString_(0, v5, @"_COMPANION", v6);
  }
  else {
  v7 = objc_msgSend_stringByAppendingString_(off_2651F4C98[v4], v5, @"_COMPANION", v6);
  }
  uint64_t v9 = objc_msgSend_localizedStringForKey_comment_(NTKEsterbrookFaceBundle, v8, (uint64_t)v7, (uint64_t)&stru_26FB06168);

  return v9;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691C1F48 != -1) {
    dispatch_once(&qword_2691C1F48, &unk_26FB01818);
  }
  uint64_t v2 = (void *)qword_2691C1F40;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end