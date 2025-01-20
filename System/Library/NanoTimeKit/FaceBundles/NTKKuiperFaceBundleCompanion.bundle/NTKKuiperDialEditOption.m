@interface NTKKuiperDialEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithKuiperDial:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)dial;
@end

@implementation NTKKuiperDialEditOption

+ (id)optionWithKuiperDial:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)dial
{
  return (unint64_t)[(NTKKuiperDialEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_11088;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"dial-%lu", a4, a3];
}

- (id)localizedName
{
  v2 = +[NSString stringWithFormat:@"EDIT_MODE_LABEL_KUIPER_DIAL_%lu", [(NTKKuiperDialEditOption *)self dial]];
  v3 = +[NTKKuiperFaceBundle localizedStringForKey:v2 comment:@"dial"];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_171D8 != -1) {
    dispatch_once(&qword_171D8, &stru_10658);
  }
  v2 = (void *)qword_171D0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end