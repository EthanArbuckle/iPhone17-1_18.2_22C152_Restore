@interface NTKNumeralsAnalogStyleEditOption
+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)availableOrderedValuesForDevice:(id)a3;
+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4;
+ (int64_t)indexForNumeralsStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (int64_t)swatchStyle;
- (unint64_t)style;
@end

@implementation NTKNumeralsAnalogStyleEditOption

+ (id)optionWithStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)style
{
  return (unint64_t)[(NTKNumeralsAnalogStyleEditOption *)self _value];
}

+ (id)availableOrderedValuesForDevice:(id)a3
{
  return +[NTKNumeralsAnalogStyleEditOption _orderedValuesForDevice:a3];
}

+ (int64_t)indexForNumeralsStyle:(unint64_t)a3 forDevice:(id)a4
{
  v5 = +[NTKNumeralsAnalogStyleEditOption availableOrderedValuesForDevice:a4];
  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  id v7 = [v5 indexOfObject:v6];

  return (int64_t)v7;
}

+ (id)_orderedValuesForDevice:(id)a3
{
  unint64_t v3 = CLKLocaleCurrentNumberSystem();
  if (v3 > 2) {
    return 0;
  }
  else {
    return off_10440[v3];
  }
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_10458[a3];
  }
}

+ (id)_localizedNameForValue:(unint64_t)a3 forDevice:(id)a4
{
  v4 = +[NTKNumeralsAnalogStyleEditOption _nameLocalizationKeyForValue:a3 forDevice:a4];
  v5 = [v4 stringByAppendingString:@"_COMPANION"];

  v6 = +[NTKNumeralsAnalogFaceBundle localizedStringForKey:v5 comment:@"style"];

  return v6;
}

+ (id)_nameLocalizationKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 8) {
    return 0;
  }
  else {
    return off_104A0[a3];
  }
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_16B78 != -1) {
    dispatch_once(&qword_16B78, &stru_10420);
  }
  v2 = (void *)qword_16B70;

  return v2;
}

- (int64_t)swatchStyle
{
  return 2;
}

@end