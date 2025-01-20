@interface CAFDefrostTypesCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (BOOL)hasBlownAir;
- (BOOL)hasFilament;
- (id)formattedValue;
- (void)setHasBlownAir:(BOOL)a3;
- (void)setHasFilament:(BOOL)a3;
@end

@implementation CAFDefrostTypesCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDefrostTypesCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasBlownAir
{
  unint64_t v2 = [(CAFDefrostTypesCharacteristic *)self defrostTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:1];
}

- (void)setHasBlownAir:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFDefrostTypesCharacteristic *)self defrostTypesValue] setOption:1 on:a3];
  [(CAFDefrostTypesCharacteristic *)self setDefrostTypesValue:v4];
}

- (BOOL)hasFilament
{
  unint64_t v2 = [(CAFDefrostTypesCharacteristic *)self defrostTypesValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:2];
}

- (void)setHasFilament:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFDefrostTypesCharacteristic *)self defrostTypesValue] setOption:2 on:a3];
  [(CAFDefrostTypesCharacteristic *)self setDefrostTypesValue:v4];
}

- (id)formattedValue
{
  uint64_t v2 = [(CAFDefrostTypesCharacteristic *)self defrostTypesValue];
  return NSStringFromDefrostTypes(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000031000014";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end