@interface NTKGalleonBezelEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithGalleonBezelStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)bezelStyle;
@end

@implementation NTKGalleonBezelEditOption

+ (id)optionWithGalleonBezelStyle:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

- (unint64_t)bezelStyle
{
  if (NTKHasRegionalGeoRestrictions() && !objc_msgSend__value(self, v3, v4, v5)) {
    return 1;
  }

  return objc_msgSend__value(self, v3, v4, v5);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  if (NTKHasRegionalGeoRestrictions()) {
    return &unk_26FB197B8;
  }
  else {
    return &unk_26FB197D0;
  }
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_2651F8D78[a3];
  }
}

- (id)localizedName
{
  uint64_t v5 = objc_msgSend_bezelStyle(self, a2, v2, v3);
  if (v5)
  {
    if (v5 == 2)
    {
      objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_GALLEON_BEZEL_STYLE_EMPTY", v6, @"_COMPANION", v8);
    }
    else if (v5 == 1)
    {
      v9 = objc_msgSend_device(self, v6, v7, v8);
      id v10 = objc_alloc(MEMORY[0x263F08C38]);
      v13 = objc_msgSend_initWithUUIDString_(v10, v11, @"DAB81146-4105-445B-94AD-14033A199AC4", v12);
      int v16 = objc_msgSend_supportsCapability_(v9, v14, (uint64_t)v13, v15);

      if (v16) {
        objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_GALLEON_BEZEL_STYLE_ELEVATION", v17, @"_COMPANION", v18);
      }
      else {
        objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_GALLEON_BEZEL_STYLE_ELEV_INCL", v17, @"_COMPANION", v18);
      }
    }
    else
    {
      objc_msgSend_stringByAppendingString_(0, v6, @"_COMPANION", v8);
    }
  }
  else
  {
    objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_GALLEON_BEZEL_STYLE_LAT_LONG", v6, @"_COMPANION", v8);
  v19 = };
  v21 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v20, (uint64_t)v19, (uint64_t)&stru_26FB12890);

  return v21;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D5768 != -1) {
    dispatch_once(&qword_2691D5768, &unk_26FB125F0);
  }
  uint64_t v2 = (void *)qword_2691D5760;

  return v2;
}

- (int64_t)swatchStyle
{
  return 1;
}

@end