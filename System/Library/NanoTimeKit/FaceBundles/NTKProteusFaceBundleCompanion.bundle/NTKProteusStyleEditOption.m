@interface NTKProteusStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithProteusStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKProteusStyleEditOption

+ (id)optionWithProteusStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKProteusStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_10C38;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"soft";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"sharp";
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKProteusStyleEditOption *)self style];
  CFStringRef v3 = @"EDIT_OPTION_LABEL_PROTEUS_STYLE_SOFT";
  if (v2 != 1) {
    CFStringRef v3 = 0;
  }
  if (v2) {
    CFStringRef v4 = (__CFString *)v3;
  }
  else {
    CFStringRef v4 = @"EDIT_OPTION_LABEL_PROTEUS_STYLE_SHARP";
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKProteusFaceBundle localizedStringForKey:v5 comment:&stru_10688];

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_164E8 != -1) {
    dispatch_once(&qword_164E8, &stru_103E0);
  }
  unint64_t v2 = (void *)qword_164E0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end