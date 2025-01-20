@interface NTKFoghornFaceBezelStyleEditOption
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithBezelStyle:(int64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKFoghornFaceBezelStyleEditOption

+ (id)optionWithBezelStyle:(int64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F08C38];
  id v4 = a3;
  id v5 = [v3 alloc];
  v8 = objc_msgSend_initWithUUIDString_(v5, v6, @"210C1233-537B-4A1E-8EE0-253962851B43", v7);
  int v11 = objc_msgSend_supportsCapability_(v4, v9, (uint64_t)v8, v10);

  v14 = &unk_26FB11FB8;
  if (v11)
  {
    v14 = objc_msgSend_arrayByAddingObject_(&unk_26FB11FB8, v12, (uint64_t)&unk_26FB11C70, v13);
  }

  return v14;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 4) {
    return 0;
  }
  else {
    return off_2651F69A8[a3];
  }
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 4)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_FOGHORN_BEZEL_", a2, (uint64_t)off_2651F69D0[a3], (uint64_t)a4);
  }
  return v5;
}

- (id)localizedName
{
  v3 = objc_opt_class();
  uint64_t v7 = objc_msgSend__value(self, v4, v5, v6);
  int v11 = objc_msgSend_device(self, v8, v9, v10);
  uint64_t v13 = objc_msgSend__nameLocalizationKeyForValue_forDevice_(v3, v12, v7, (uint64_t)v11);

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
  if (qword_2691D4C68 != -1) {
    dispatch_once(&qword_2691D4C68, &unk_26FB0C9E8);
  }
  v2 = (void *)qword_2691D4C60;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end