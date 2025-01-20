@interface NTKKuiperDensityEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithKuiperDensity:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)density;
@end

@implementation NTKKuiperDensityEditOption

+ (id)optionWithKuiperDensity:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)density
{
  return (unint64_t)[(NTKKuiperDensityEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_11070;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  return +[NSString stringWithFormat:@"density-%lu", a4, a3];
}

- (id)localizedName
{
  v2 = +[NSString stringWithFormat:@"EDIT_MODE_LABEL_KUIPER_STYLE_%lu", [(NTKKuiperDensityEditOption *)self density]];
  v3 = +[NTKKuiperFaceBundle localizedStringForKey:v2 comment:@"style"];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_171C8 != -1) {
    dispatch_once(&qword_171C8, &stru_10638);
  }
  v2 = (void *)qword_171C0;

  return v2;
}

- (int64_t)swatchStyle
{
  return 1;
}

@end