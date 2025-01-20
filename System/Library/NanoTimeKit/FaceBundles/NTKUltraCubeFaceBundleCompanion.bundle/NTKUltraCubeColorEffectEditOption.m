@interface NTKUltraCubeColorEffectEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithColorEffect:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)colorEffect;
@end

@implementation NTKUltraCubeColorEffectEditOption

- (unint64_t)colorEffect
{
  return (unint64_t)[(NTKUltraCubeColorEffectEditOption *)self _value];
}

+ (id)optionWithColorEffect:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_4B4D0;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"none";
  if (a3 == 1) {
    CFStringRef v4 = @"background";
  }
  if (a3 == 2) {
    return @"duotone";
  }
  else {
    return (id)v4;
  }
}

- (id)_valueToFaceBundleStringDict
{
  v4[0] = &off_4B698;
  v4[1] = &off_4B6B0;
  v5[0] = NTKFaceBundleUltraCubeColorEffectNone;
  v5[1] = NTKFaceBundleUltraCubeColorEffectBackground;
  v4[2] = &off_4B6C8;
  v5[2] = NTKFaceBundleUltraCubeColorEffectDuotone;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKUltraCubeColorEffectEditOption *)self colorEffect];
  CFStringRef v3 = @"EDIT_OPTION_LABEL_EFFECT_NONE";
  if (v2 == 1) {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_EFFECT_BACKGROUND";
  }
  if (v2 == 2) {
    CFStringRef v4 = @"EDIT_OPTION_LABEL_EFFECT_DUOTONE";
  }
  else {
    CFStringRef v4 = (__CFString *)v3;
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKUltraCubeFaceBundle localizedStringForKey:v5 comment:@"effect"];

  return v6;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end