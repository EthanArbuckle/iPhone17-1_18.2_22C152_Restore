@interface NTKRenegadeColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithRenegadeColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
- (unint64_t)color;
@end

@implementation NTKRenegadeColorEditOption

+ (id)optionWithRenegadeColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKRenegadeColorEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_10C00;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_104F0[a3];
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKRenegadeColorEditOption *)self color];
  if (v2 > 2) {
    v3 = 0;
  }
  else {
    v3 = off_10508[v2];
  }
  v4 = [(__CFString *)v3 stringByAppendingString:@"_COMPANION"];
  if (v4)
  {
    v5 = +[NTKRenegadeFaceBundle localizedStringForKey:v4 comment:&stru_10818];
  }
  else
  {
    v5 = &stru_10818;
  }

  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_17258 != -1) {
    dispatch_once(&qword_17258, &stru_104D0);
  }
  unint64_t v2 = (void *)qword_17250;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

@end