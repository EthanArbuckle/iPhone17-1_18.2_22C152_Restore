@interface NTKFoghornFaceLayoutStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithLayoutStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKFoghornFaceLayoutStyleEditOption

+ (id)optionWithLayoutStyle:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_26FB12060;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 5) {
    return 0;
  }
  else {
    return off_2651F6C68[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 5)
  {
    v5 = 0;
  }
  else
  {
    v5 = objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_FOGHORN_STYLE_", a2, (uint64_t)off_2651F6C98[a3], (uint64_t)a4);
  }
  return v5;
}

- (id)localizedName
{
  v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend__value(self, v4, v5, v6);
  v11 = objc_msgSend_device(self, v8, v9, v10);
  v13 = objc_msgSend__nameLocalizationKeyForValue_forDevice_(v3, v12, v7, (uint64_t)v11);

  v16 = objc_msgSend_stringByAppendingString_(v13, v14, @"_COMPANION", v15);

  if (v16)
  {
    v18 = objc_msgSend_localizedStringForKey_comment_(NTKFoghornFaceBundle, v17, (uint64_t)v16, (uint64_t)&stru_26FB0CCF0);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D51F0 != -1) {
    dispatch_once(&qword_2691D51F0, &unk_26FB0CAE8);
  }
  v2 = (void *)qword_2691D51E8;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end