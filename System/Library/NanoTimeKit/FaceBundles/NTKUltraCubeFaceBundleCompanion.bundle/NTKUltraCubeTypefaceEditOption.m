@interface NTKUltraCubeTypefaceEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)typeface;
@end

@implementation NTKUltraCubeTypefaceEditOption

- (unint64_t)typeface
{
  return (unint64_t)[(NTKUltraCubeTypefaceEditOption *)self _value];
}

+ (id)optionWithTypeface:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_4B4E8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"new-york";
  if (a3 == 1) {
    CFStringRef v4 = @"san-francisco";
  }
  if (a3 == 2) {
    return @"tokyo";
  }
  else {
    return (id)v4;
  }
}

- (id)_valueToFaceBundleStringDict
{
  v4[0] = &off_4B6E0;
  v4[1] = &off_4B6F8;
  v5[0] = NTKFaceBundleStyle1;
  v5[1] = NTKFaceBundleStyle2;
  v4[2] = &off_4B710;
  v5[2] = NTKFaceBundleStyle3;
  v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:3];

  return v2;
}

- (id)localizedName
{
  unint64_t v2 = [(NTKUltraCubeTypefaceEditOption *)self typeface];
  CFStringRef v3 = @"EDIT_OPTION_LABEL_TYPEFACE_NEW_YORK";
  if (v2 == 1) {
    CFStringRef v3 = @"EDIT_OPTION_LABEL_TYPEFACE_SAN_FRANCISCO";
  }
  if (v2 == 2) {
    CFStringRef v4 = @"EDIT_OPTION_LABEL_TYPEFACE_TOKYO";
  }
  else {
    CFStringRef v4 = (__CFString *)v3;
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKUltraCubeFaceBundle localizedStringForKey:v5 comment:@"typeface"];

  return v6;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end