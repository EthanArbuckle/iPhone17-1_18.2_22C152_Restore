@interface NTKAlaskanColorEditOption
+ (id)_orderedValuesForDevice:(id)a3;
+ (id)curatedColorLocalizationKeyPrefix;
+ (id)curatedColorValuesForDevice:(id)a3;
+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4;
- (id)localizedName;
- (id)pigmentEditOption;
- (unint64_t)color;
@end

@implementation NTKAlaskanColorEditOption

+ (id)optionWithColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

- (unint64_t)color
{
  return (unint64_t)[(NTKAlaskanColorEditOption *)self _value];
}

+ (id)_orderedValuesForDevice:(id)a3
{
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___NTKAlaskanColorEditOption;
  v3 = objc_msgSendSuper2(&v6, "_orderedValuesForDevice:", a3);
  id v4 = [v3 mutableCopy];

  [v4 removeObject:&off_3A3C0];

  return v4;
}

+ (id)curatedColorValuesForDevice:(id)a3
{
  return (id)_EnumValueRange();
}

+ (id)curatedColorLocalizationKeyPrefix
{
  return @"EDIT_OPTION_LABEL_ALASKAN_COLOR_SET_";
}

- (id)localizedName
{
  v2 = [(NTKAlaskanColorEditOption *)self pigmentEditOption];
  v3 = [v2 localizedName];

  return v3;
}

- (id)pigmentEditOption
{
  unint64_t v3 = [(NTKAlaskanColorEditOption *)self color];
  id v4 = @"slate2";
  switch(v3)
  {
    case 0xBB8uLL:
    case 0xBB9uLL:
    case 0xBBAuLL:
      goto LABEL_8;
    case 0xBBBuLL:
      unint64_t v3 = 3004;
      goto LABEL_8;
    case 0xBBCuLL:
      unint64_t v3 = 3010;
      goto LABEL_8;
    case 0xBBDuLL:
      unint64_t v3 = 3011;
      goto LABEL_8;
    case 0xBBEuLL:
      unint64_t v3 = 3012;
      goto LABEL_8;
    case 0xBBFuLL:
      goto LABEL_9;
    case 0xBC0uLL:
      unint64_t v3 = 3013;
      goto LABEL_8;
    case 0xBC1uLL:
      unint64_t v3 = 3014;
LABEL_8:
      id v4 = +[NTKCaliforniaColorEditOption colorNameForColor:v3];
      if (!v4) {
        goto LABEL_10;
      }
LABEL_9:
      id v5 = objc_alloc((Class)NTKPigmentEditOption);
      id v6 = [v5 initWithOptionName:v4 collectionName:ntk_evergreen];

      break;
    default:
LABEL_10:
      v8.receiver = self;
      v8.super_class = (Class)NTKAlaskanColorEditOption;
      id v6 = [(NTKAlaskanColorEditOption *)&v8 pigmentEditOption];
      break;
  }

  return v6;
}

@end