@interface NTKFoghornNightModeEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithFoghornNightMode:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)analyticsKey;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKFoghornNightModeEditOption

+ (id)optionWithFoghornNightMode:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_26FB11FD0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_2651F6A50[a3];
  }
}

- (id)localizedName
{
  unint64_t v4 = objc_msgSend_nightMode(self, a2, v2, v3);
  if (v4 > 2) {
    objc_msgSend_stringByAppendingString_(0, v5, @"_COMPANION", v6);
  }
  else {
  v7 = objc_msgSend_stringByAppendingString_(off_2651F6A38[v4], v5, @"_COMPANION", v6);
  }
  v8 = NTKCompanionClockFaceLocalizedString();

  return v8;
}

- (id)analyticsKey
{
  unint64_t v4 = objc_msgSend_nightMode(self, a2, v2, v3);
  if (v4 > 2) {
    return 0;
  }
  else {
    return off_2651F6A50[v4];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D4C88 != -1) {
    dispatch_once(&qword_2691D4C88, &unk_26FB0CA28);
  }
  uint64_t v2 = (void *)qword_2691D4C80;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end