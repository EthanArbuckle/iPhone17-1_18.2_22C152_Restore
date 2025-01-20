@interface NTKAegirTypefaceEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionsDescription;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKAegirTypefaceEditOption

- (unint64_t)typeface
{
  return MEMORY[0x1F4181798](self, sel__value);
}

+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__optionWithValue_forDevice_);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_1F3527960;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"new-york";
  if (a3 == 1) {
    v4 = @"san-francisco";
  }
  if (a3 == 2) {
    return @"tokyo";
  }
  else {
    return v4;
  }
}

- (id)_valueToFaceBundleStringDict
{
  v7[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F79F80];
  v6[0] = &unk_1F3527528;
  v6[1] = &unk_1F3527540;
  uint64_t v3 = *MEMORY[0x1E4F79F88];
  v7[0] = v2;
  v7[1] = v3;
  v6[2] = &unk_1F3527558;
  v7[2] = *MEMORY[0x1E4F79F90];
  v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:3];

  return v4;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKAegirTypefaceEditOption *)self typeface];
  uint64_t v3 = @"EDIT_OPTION_LABEL_TYPEFACE_NEW_YORK";
  if (v2 == 1) {
    uint64_t v3 = @"EDIT_OPTION_LABEL_TYPEFACE_SAN_FRANCISCO";
  }
  if (v2 == 2) {
    v4 = @"EDIT_OPTION_LABEL_TYPEFACE_TOKYO";
  }
  else {
    v4 = v3;
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKFaceBundle localizedStringForKey:v5 comment:@"typeface"];

  return v6;
}

- (int64_t)swatchStyle
{
  return 3;
}

+ (id)optionsDescription
{
  return +[NTKFaceBundle localizedStringForKey:@"AEGIR_TYPEFACE_EDIT_OPTION_DESCRIPTION" comment:@"Typeface Edit Option Description"];
}

@end