@interface NTKCharacterColorEditOption
+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4;
+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4;
+ (id)optionAtIndex:(unint64_t)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5;
+ (id)optionByValidatingValueOfInvalidOption:(id)a3;
+ (id)optionWithFaceColor:(unint64_t)a3 forDevice:(id)a4;
+ (id)optionWithOption:(id)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5;
+ (unint64_t)indexOfOption:(id)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5;
+ (unint64_t)numberOfOptionsForCharacter:(unint64_t)a3 forDevice:(id)a4;
- (BOOL)isValidOption;
- (UIColor)colorValue;
- (double)desaturation;
- (id)_valueToFaceBundleStringDict;
- (id)localizedName;
- (id)pigmentEditOption;
- (int64_t)swatchStyle;
@end

@implementation NTKCharacterColorEditOption

+ (id)optionWithFaceColor:(unint64_t)a3 forDevice:(id)a4
{
  return [a1 _optionWithValue:a3 forDevice:a4];
}

+ (id)optionWithOption:(id)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  id v9 = [a3 color];
  v10 = sub_6224(a4, v8);
  v11 = +[NSNumber numberWithUnsignedInteger:v9];
  unsigned __int8 v12 = [v10 containsObject:v11];

  if ((v12 & 1) == 0)
  {
    v13 = [v10 objectAtIndex:1];
    id v9 = [v13 unsignedIntegerValue];
  }
  v14 = [a1 optionWithFaceColor:v9 forDevice:v8];

  return v14;
}

+ (unint64_t)numberOfOptionsForCharacter:(unint64_t)a3 forDevice:(id)a4
{
  v4 = sub_6224(a3, a4);
  id v5 = [v4 count];

  return (unint64_t)v5;
}

+ (id)optionAtIndex:(unint64_t)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5
{
  id v8 = a5;
  if ((unint64_t)[a1 numberOfOptionsForCharacter:a4 forDevice:v8] <= a3) {
    a3 = 0;
  }
  id v9 = sub_6224(a4, v8);
  v10 = [v9 objectAtIndex:a3];
  id v11 = [v10 unsignedIntegerValue];

  unsigned __int8 v12 = [a1 optionWithFaceColor:v11 forDevice:v8];

  return v12;
}

+ (unint64_t)indexOfOption:(id)a3 forCharacter:(unint64_t)a4 forDevice:(id)a5
{
  id v7 = a5;
  id v8 = [a3 color];
  id v9 = sub_6224(a4, v7);

  v10 = +[NSNumber numberWithUnsignedInteger:v8];
  id v11 = [v9 indexOfObject:v10];

  return (unint64_t)v11;
}

+ (id)optionByValidatingValueOfInvalidOption:(id)a3
{
  return +[NTKFaceColorEditOption _optionByValidatingValueOfInvalidOption:a3];
}

- (BOOL)isValidOption
{
  unint64_t v3 = 0;
  BOOL v4 = 1;
  while (1)
  {
    id v5 = [(NTKCharacterColorEditOption *)self device];
    v6 = sub_6224(v3, v5);
    id v7 = +[NSNumber numberWithUnsignedInteger:[(NTKCharacterColorEditOption *)self _value]];
    unsigned __int8 v8 = [v6 containsObject:v7];

    if (v8) {
      break;
    }
    BOOL v4 = v3++ < 2;
    if (v3 == 3)
    {
      id v9 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100FC(self, v9);
      }

      return 0;
    }
  }
  return v4;
}

- (id)_valueToFaceBundleStringDict
{
  if (qword_26288 != -1) {
    dispatch_once(&qword_26288, &stru_1C8F0);
  }
  v2 = (void *)qword_26280;

  return v2;
}

+ (id)_snapshotKeyForValue:(unint64_t)a3 forDevice:(id)a4
{
  id result = 0;
  if ((uint64_t)a3 > 999)
  {
    CFStringRef v5 = @"gold-generic-3";
    CFStringRef v6 = @"vintage";
    if (a3 != 3000) {
      CFStringRef v6 = 0;
    }
    if (a3 != 1002) {
      CFStringRef v5 = v6;
    }
    CFStringRef v7 = @"gold-generic-1";
    CFStringRef v8 = @"gold-generic-2";
    if (a3 != 1001) {
      CFStringRef v8 = 0;
    }
    if (a3 != 1000) {
      CFStringRef v7 = v8;
    }
    if ((uint64_t)a3 <= 1001) {
      return (id)v7;
    }
    else {
      return (id)v5;
    }
  }
  else
  {
    switch(a3)
    {
      case 0uLL:
        id result = @"pink";
        break;
      case 1uLL:
        id result = @"purple";
        break;
      case 2uLL:
        id result = @"blue";
        break;
      case 3uLL:
        id result = @"green";
        break;
      case 4uLL:
        id result = @"yellow";
        break;
      case 5uLL:
        id result = @"orange";
        break;
      case 6uLL:
        id result = @"red";
        break;
      case 7uLL:
        id result = @"white";
        break;
      case 8uLL:
        id result = @"dark-orange";
        break;
      case 9uLL:
        id result = @"turquoise";
        break;
      case 0xAuLL:
        id result = @"midnight-blue";
        break;
      case 0xBuLL:
        id result = @"lavender";
        break;
      case 0xCuLL:
        id result = @"vintage-rose";
        break;
      case 0xDuLL:
        id result = @"walnut";
        break;
      case 0xEuLL:
        id result = @"stone";
        break;
      case 0xFuLL:
        id result = @"antique-white";
        break;
      case 0x10uLL:
        id result = @"light-blue";
        break;
      case 0x11uLL:
        id result = @"mint";
        break;
      case 0x12uLL:
        id result = @"lilac";
        break;
      case 0x13uLL:
        id result = @"royal-blue";
        break;
      case 0x14uLL:
        id result = @"light-pink";
        break;
      case 0x15uLL:
        id result = @"apricot";
        break;
      case 0x16uLL:
        id result = @"ocean-blue";
        break;
      case 0x17uLL:
        id result = @"cocoa";
        break;
      case 0x18uLL:
        id result = @"ice-white";
        break;
      case 0x19uLL:
        id result = @"pink-sand";
        break;
      case 0x1AuLL:
        id result = @"gray";
        break;
      case 0x1BuLL:
        id result = @"pebble";
        break;
      case 0x1CuLL:
        id result = @"azure";
        break;
      case 0x1DuLL:
        id result = @"camellia";
        break;
      case 0x1EuLL:
        id result = @"mist-blue";
        break;
      case 0x1FuLL:
        id result = @"flamingo";
        break;
      case 0x20uLL:
        id result = @"pollen";
        break;
      case 0x21uLL:
        id result = @"soft-white";
        break;
      case 0x22uLL:
        id result = @"blue-cobalt";
        break;
      case 0x23uLL:
        id result = @"dark-olive";
        break;
      case 0x24uLL:
        id result = @"violet";
        break;
      case 0x25uLL:
        id result = @"rose-red";
        break;
      case 0x27uLL:
        id result = @"flash";
        break;
      case 0x28uLL:
        id result = @"dark-teal";
        break;
      case 0x29uLL:
        id result = @"electric-pink";
        break;
      case 0x2AuLL:
        id result = @"peach";
        break;
      case 0x2BuLL:
        id result = @"denim-blue";
        break;
      case 0x2CuLL:
        id result = @"flash-light";
        break;
      case 0x2DuLL:
        id result = @"nectarine";
        break;
      case 0x2EuLL:
        id result = @"mellow-yellow";
        break;
      case 0x2FuLL:
        id result = @"storm-gray";
        break;
      case 0x30uLL:
        id result = @"pacific-green";
        break;
      case 0x31uLL:
        id result = @"blue-horizon";
        break;
      case 0x32uLL:
        id result = @"indigo";
        break;
      case 0x33uLL:
        id result = @"lavender-gray";
        break;
      case 0x34uLL:
        id result = @"hibiscus";
        break;
      case 0x36uLL:
        id result = @"papaya";
        break;
      case 0x37uLL:
        id result = @"canary-yellow";
        break;
      case 0x38uLL:
        id result = @"spearmint";
        break;
      case 0x39uLL:
        id result = @"cerulean";
        break;
      case 0x3AuLL:
        id result = @"delft-blue";
        break;
      case 0x3BuLL:
        id result = @"dragon-fruit";
        break;
      case 0x3CuLL:
        id result = @"pine-green";
        break;
      case 0x3DuLL:
        id result = @"lemon-cream";
        break;
      case 0x3EuLL:
        id result = @"alaskan-blue";
        break;
      case 0x3FuLL:
        id result = @"pomegranate";
        break;
      case 0x40uLL:
        id result = @"khaki";
        break;
      case 0x41uLL:
        id result = @"beryl";
        break;
      case 0x42uLL:
        id result = @"camel";
        break;
      case 0x43uLL:
        id result = @"sea-foam";
        break;
      case 0x44uLL:
        id result = @"surf-blue";
        break;
      case 0x45uLL:
        id result = @"cactus";
        break;
      case 0x46uLL:
        id result = @"linen-blue";
        break;
      case 0x47uLL:
        id result = @"grapefruit";
        break;
      case 0x48uLL:
        id result = @"neon-pink";
        break;
      case 0x49uLL:
        id result = @"coastal-gray";
        break;
      case 0x4AuLL:
        id result = @"PinkCitrus";
        break;
      case 0x4BuLL:
        id result = @"DeepNavy";
        break;
      case 0x4CuLL:
        id result = @"CyprusGreen";
        break;
      case 0x4DuLL:
        id result = @"Cream";
        break;
      case 0x4EuLL:
        id result = @"Kumquat";
        break;
      case 0x4FuLL:
        id result = @"NorthernBlue";
        break;
      case 0x50uLL:
        id result = @"Plum";
        break;
      case 0x51uLL:
        id result = @"ElectricOrange";
        break;
      case 0x52uLL:
        id result = @"Sunflower";
        break;
      case 0x53uLL:
        id result = @"Pistachio";
        break;
      case 0x54uLL:
        id result = @"CloudBlue";
        break;
      case 0x55uLL:
        id result = @"Abyss";
        break;
      case 0x56uLL:
        id result = @"SeaSalt";
        break;
      case 0x57uLL:
        id result = @"Olive";
        break;
      case 0x58uLL:
        id result = @"MallardGreen";
        break;
      case 0x64uLL:
        id result = @"edition";
        break;
      case 0x65uLL:
        id result = @"sport+";
        break;
      case 0x66uLL:
        id result = @"zeus";
        break;
      case 0x67uLL:
        id result = @"victory";
        break;
      case 0x68uLL:
        id result = @"explorer";
        break;
      case 0xC8uLL:
        id result = @"multi";
        break;
      default:
        return result;
    }
  }
  return result;
}

- (id)localizedName
{
  v2 = [(NTKCharacterColorEditOption *)self pigmentEditOption];
  unint64_t v3 = [v2 localizedName];

  return v3;
}

- (UIColor)colorValue
{
  unint64_t v3 = [(NTKCharacterColorEditOption *)self color];
  if (v3 == 3000 || v3 == 6)
  {
    BOOL v4 = +[UIColor colorWithRed:0.862745098 green:0.129411765 blue:0.152941176 alpha:1.0];
  }
  else
  {
    CFStringRef v5 = [(NTKCharacterColorEditOption *)self device];
    BOOL v4 = NTKForegroundColor();
  }

  return (UIColor *)v4;
}

- (double)desaturation
{
  unint64_t v2 = [(NTKCharacterColorEditOption *)self color];
  double result = 0.0;
  if (v2 == 3000) {
    return 1.0;
  }
  return result;
}

- (int64_t)swatchStyle
{
  return 0;
}

- (id)pigmentEditOption
{
  unint64_t v3 = [(NTKCharacterColorEditOption *)self color];
  if (v3 == 6)
  {
    id v4 = NTKColorPaletteDomainMickey;
    NTKFaceColorName();
    CFStringRef v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 3000)
  {
    id v4 = NTKColorPaletteDomainMickey;
    CFStringRef v5 = @"vintage";
  }
  else
  {
    [(NTKCharacterColorEditOption *)self color];
    NTKFaceColorNameAndCollection();
    CFStringRef v5 = (__CFString *)0;
    id v4 = 0;
  }
  id v6 = [objc_alloc((Class)NTKPigmentEditOption) initWithOptionName:v5 collectionName:v4];

  return v6;
}

+ (id)legacyOptionWithPigmentEditOption:(id)a3 forDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v8 = [v6 optionName];
  unsigned int v9 = [v8 isEqualToString:@"vintage"];

  if (v9)
  {
    id v10 = a1;
    uint64_t v11 = 3000;
  }
  else
  {
    unsigned __int8 v12 = [v6 optionName];
    v13 = NTKFaceColorName();
    unsigned int v14 = [v12 isEqualToString:v13];

    if (!v14)
    {
      v16 = +[NTKFaceColorEditOption legacyOptionWithPigmentEditOption:v6 forDevice:v7];
      v17 = v16;
      if (v16)
      {
        v15 = objc_msgSend(a1, "optionWithFaceColor:forDevice:", objc_msgSend(v16, "faceColor"), v7);
      }
      else
      {
        v15 = 0;
      }

      goto LABEL_10;
    }
    id v10 = a1;
    uint64_t v11 = 6;
  }
  v15 = [v10 optionWithFaceColor:v11 forDevice:v7];
LABEL_10:

  return v15;
}

@end