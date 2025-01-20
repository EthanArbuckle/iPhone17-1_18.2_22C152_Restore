@interface NTKPoodleColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)colorNameForColorValue:(unint64_t)a3;
+ (id)domain;
+ (id)optionWithPoodleColor:(unint64_t)a3 forDevice:(id)a4;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKPoodleColorEditOption

+ (id)optionWithPoodleColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  return &off_3F9A8;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  if (a3 > 9) {
    return 0;
  }
  else {
    return off_3C998[a3];
  }
}

- (id)localizedName
{
  v2 = [(NTKPoodleColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_4C900 != -1) {
    dispatch_once(&qword_4C900, &stru_3C978);
  }
  v2 = (void *)qword_4C8F8;

  return v2;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  v2 = objc_msgSend((id)objc_opt_class(), "colorNameForColorValue:", -[NTKPoodleColorEditOption color](self, "color"));
  id v3 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v2 collectionName:@"zeus"];

  return v3;
}

+ (id)colorNameForColorValue:(unint64_t)a3
{
  if (a3 > 9) {
    return 0;
  }
  else {
    return off_3C9E8[a3];
  }
}

+ (id)domain
{
  return NTKColorPaletteDomainZeusCirculaire;
}

@end