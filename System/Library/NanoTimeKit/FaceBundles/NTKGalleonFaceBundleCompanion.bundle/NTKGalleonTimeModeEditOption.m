@interface NTKGalleonTimeModeEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithGalleonTimeMode:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKGalleonTimeModeEditOption

+ (id)optionWithGalleonTimeMode:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_26FB197E8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"minute";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"hour";
  }
}

- (id)localizedName
{
  uint64_t v4 = objc_msgSend_timeMode(self, a2, v2, v3);
  v7 = @"EDIT_OPTION_LABEL_GALLEON_TIME_MODE_MINUTE";
  if (v4 != 1) {
    v7 = 0;
  }
  if (v4) {
    objc_msgSend_stringByAppendingString_(v7, v5, @"_COMPANION", v6);
  }
  else {
  v8 = objc_msgSend_stringByAppendingString_(@"EDIT_OPTION_LABEL_GALLEON_TIME_MODE_HOUR", v5, @"_COMPANION", v6);
  }
  v10 = objc_msgSend_localizedStringForKey_comment_(NTKGalleonFaceBundle, v9, (uint64_t)v8, (uint64_t)&stru_26FB12890);

  return v10;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D57E8 != -1) {
    dispatch_once(&qword_2691D57E8, &unk_26FB12630);
  }
  uint64_t v2 = (void *)qword_2691D57E0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 1;
}

@end