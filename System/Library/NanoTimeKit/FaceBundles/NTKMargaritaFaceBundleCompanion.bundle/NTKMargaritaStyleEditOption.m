@interface NTKMargaritaStyleEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithMargaritaStyle:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (int64_t)swatchStyle;
@end

@implementation NTKMargaritaStyleEditOption

+ (id)optionWithMargaritaStyle:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_121F8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 3) {
    return 0;
  }
  else {
    return off_104E8[a3];
  }
}

- (id)localizedName
{
  unint64_t v2 = [(NTKMargaritaStyleEditOption *)self style];
  if (v2 > 3) {
    v3 = 0;
  }
  else {
    v3 = off_10508[v2];
  }
  v4 = [(__CFString *)v3 stringByAppendingString:@"_COMPANION"];
  v5 = +[NTKMargaritaFaceBundle localizedStringForKey:v4 comment:&stru_10A08];

  return v5;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_17318 != -1) {
    dispatch_once(&qword_17318, &stru_104C8);
  }
  unint64_t v2 = (void *)qword_17310;

  return v2;
}

- (int64_t)swatchStyle
{
  return 3;
}

@end