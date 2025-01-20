@interface NTKHadesRotationEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithRotation:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
@end

@implementation NTKHadesRotationEditOption

+ (id)optionWithRotation:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  if (qword_4CEE8 != -1) {
    dispatch_once(&qword_4CEE8, &stru_3D1A8);
  }
  v3 = (void *)qword_4CEE0;

  return v3;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"rotation2";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    return (id)v4;
  }
  else {
    return @"rotation1";
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  CFStringRef v4 = @"EDIT_OPTION_LABEL_HADES_ROTATION_2";
  if (a3 != 1) {
    CFStringRef v4 = 0;
  }
  if (a3) {
    v5 = (__CFString *)v4;
  }
  else {
    v5 = @"EDIT_OPTION_LABEL_HADES_ROTATION_1";
  }
  v6 = [(__CFString *)v5 stringByAppendingString:@"_COMPANION", a4];
  if (v6)
  {
    v7 = +[NTKHadesFaceBundle localizedStringForKey:v6 comment:&stru_3D3C0];
  }
  else
  {
    v7 = &stru_3D3C0;
  }

  return v7;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_4CEF8 != -1) {
    dispatch_once(&qword_4CEF8, &stru_3D1C8);
  }
  v2 = (void *)qword_4CEF0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end