@interface NTKParameciumBackgroundEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithParameciumBackground:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)background;
@end

@implementation NTKParameciumBackgroundEditOption

+ (id)optionWithParameciumBackground:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)background
{
  return (unint64_t)[(NTKParameciumBackgroundEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_10FE8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"off";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"on";
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKParameciumBackgroundEditOption *)self background];
  CFStringRef v3 = @"EDIT_OPTION_LABEL_PARAMECIUM_BACKGROUND_OFF";
  if (v2 != 1) {
    CFStringRef v3 = 0;
  }
  if (v2) {
    CFStringRef v4 = (__CFString *)v3;
  }
  else {
    CFStringRef v4 = @"EDIT_OPTION_LABEL_PARAMECIUM_BACKGROUND_ON";
  }
  v5 = [(__CFString *)v4 stringByAppendingString:@"_COMPANION"];
  v6 = +[NTKParameciumFaceBundle localizedStringForKey:v5 comment:&stru_10B68];

  return v6;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16580 != -1) {
    dispatch_once(&qword_16580, &stru_10680);
  }
  unint64_t v2 = (void *)qword_16578;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end