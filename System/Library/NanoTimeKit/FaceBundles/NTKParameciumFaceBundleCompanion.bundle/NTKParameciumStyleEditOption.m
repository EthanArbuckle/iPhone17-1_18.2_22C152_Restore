@interface NTKParameciumStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithParameciumStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKParameciumStyleEditOption

+ (id)optionWithParameciumStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKParameciumStyleEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_11000;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return *(&off_106D8 + a3);
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKParameciumStyleEditOption *)self style];
  if (v2 > 2) {
    v3 = 0;
  }
  else {
    v3 = *(&off_106F0 + v2);
  }
  v4 = [v3 stringByAppendingString:@"_COMPANION"];
  v5 = +[NTKParameciumFaceBundle localizedStringForKey:v4 comment:&stru_10B68];

  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16590 != -1) {
    dispatch_once(&qword_16590, &stru_106B8);
  }
  unint64_t v2 = (void *)qword_16588;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end