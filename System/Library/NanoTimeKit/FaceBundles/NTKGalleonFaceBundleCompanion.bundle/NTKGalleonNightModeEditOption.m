@interface NTKGalleonNightModeEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithGalleonNightMode:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)analyticsKey;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKGalleonNightModeEditOption

+ (id)optionWithGalleonNightMode:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x270F9A6D0](a1, sel__optionWithValue_forDevice_, a3, a4);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_26FB19920;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_2651F8F70[a3];
  }
}

- (id)localizedName
{
  unint64_t v4 = objc_msgSend_nightMode(self, a2, v2, v3);
  if (v4 > 2) {
    objc_msgSend_stringByAppendingString_(0, v5, @"_COMPANION", v6);
  }
  else {
  v7 = objc_msgSend_stringByAppendingString_(off_2651F8F58[v4], v5, @"_COMPANION", v6);
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
    return off_2651F8F70[v4];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_2691D5A78 != -1) {
    dispatch_once(&qword_2691D5A78, &unk_26FB12730);
  }
  uint64_t v2 = (void *)qword_2691D5A70;

  return v2;
}

- (int64_t)swatchStyle
{
  return 1;
}

@end