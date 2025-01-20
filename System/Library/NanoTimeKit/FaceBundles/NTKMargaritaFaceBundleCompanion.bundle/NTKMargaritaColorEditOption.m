@interface NTKMargaritaColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithMargaritaColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKMargaritaColorEditOption

+ (id)optionWithMargaritaColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_122E8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 0x29) {
    return 0;
  }
  else {
    return *(&off_10720 + a3);
  }
}

- (id)localizedName
{
  v2 = [(NTKMargaritaColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_17380 != -1) {
    dispatch_once(&qword_17380, &stru_10700);
  }
  v2 = (void *)qword_17378;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  unint64_t v2 = [(NTKMargaritaColorEditOption *)self color];
  if (v2 > 0x2A) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = (uint64_t)*(&off_10870 + v2);
  }
  id v4 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v3 collectionName:@"margarita"];

  return v4;
}

@end