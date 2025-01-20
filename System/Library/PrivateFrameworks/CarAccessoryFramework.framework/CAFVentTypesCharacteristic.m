@interface CAFVentTypesCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (BOOL)hasLower;
- (BOOL)hasMiddle;
- (BOOL)hasNeck;
- (BOOL)hasUpper;
- (BOOL)hasWindow;
- (id)formattedValue;
- (void)setHasLower:(BOOL)a3;
- (void)setHasMiddle:(BOOL)a3;
- (void)setHasNeck:(BOOL)a3;
- (void)setHasUpper:(BOOL)a3;
- (void)setHasWindow:(BOOL)a3;
@end

@implementation CAFVentTypesCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFVentTypesCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasWindow
{
  unint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:1];
}

- (void)setHasWindow:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFVentTypesCharacteristic *)self ventTypesValue] setOption:1 on:a3];
  [(CAFVentTypesCharacteristic *)self setVentTypesValue:v4];
}

- (BOOL)hasUpper
{
  unint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:2];
}

- (void)setHasUpper:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFVentTypesCharacteristic *)self ventTypesValue] setOption:2 on:a3];
  [(CAFVentTypesCharacteristic *)self setVentTypesValue:v4];
}

- (BOOL)hasLower
{
  unint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:4];
}

- (void)setHasLower:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFVentTypesCharacteristic *)self ventTypesValue] setOption:4 on:a3];
  [(CAFVentTypesCharacteristic *)self setVentTypesValue:v4];
}

- (BOOL)hasNeck
{
  unint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:8];
}

- (void)setHasNeck:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFVentTypesCharacteristic *)self ventTypesValue] setOption:8 on:a3];
  [(CAFVentTypesCharacteristic *)self setVentTypesValue:v4];
}

- (BOOL)hasMiddle
{
  unint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:16];
}

- (void)setHasMiddle:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFVentTypesCharacteristic *)self ventTypesValue] setOption:16 on:a3];
  [(CAFVentTypesCharacteristic *)self setVentTypesValue:v4];
}

- (id)formattedValue
{
  uint64_t v2 = [(CAFVentTypesCharacteristic *)self ventTypesValue];
  return NSStringFromVentTypes(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000031000015";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end