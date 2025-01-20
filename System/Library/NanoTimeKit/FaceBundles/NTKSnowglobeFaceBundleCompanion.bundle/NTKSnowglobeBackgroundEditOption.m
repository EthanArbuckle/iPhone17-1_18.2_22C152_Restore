@interface NTKSnowglobeBackgroundEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithSnowglobeBackground:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)background;
@end

@implementation NTKSnowglobeBackgroundEditOption

+ (id)optionWithSnowglobeBackground:(unint64_t)a3 forDevice:(id)a4
{
  return (id)MEMORY[0x1F4181798](a1, sel__optionWithValue_forDevice_);
}

- (unint64_t)background
{
  return MEMORY[0x1F4181798](self, sel__value);
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &unk_1F352BF90;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = @"off";
  if (a3 != 1) {
    v4 = 0;
  }
  if (a3) {
    return v4;
  }
  else {
    return @"on";
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKSnowglobeBackgroundEditOption *)self background];
  v3 = @"EDIT_OPTION_LABEL_SNOWGLOBE_BACKGROUND_OFF";
  if (v2 != 1) {
    v3 = 0;
  }
  if (v2) {
    v4 = v3;
  }
  else {
    v4 = @"EDIT_OPTION_LABEL_SNOWGLOBE_BACKGROUND_ON";
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKFaceBundle localizedStringForKey:v5 comment:&stru_1F35285D8];

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_1EA8FCF10 != -1) {
    dispatch_once(&qword_1EA8FCF10, &unk_1F3527F78);
  }
  unint64_t v2 = (void *)qword_1EA8FCF08;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end