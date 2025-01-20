@interface CAFSettingProminenceLevelCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (BOOL)hasAppHomeTile;
- (id)formattedValue;
- (void)setHasAppHomeTile:(BOOL)a3;
@end

@implementation CAFSettingProminenceLevelCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSettingProminenceLevelCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasAppHomeTile
{
  unint64_t v2 = [(CAFSettingProminenceLevelCharacteristic *)self settingProminenceLevelValue];
  return +[CAFBitMaskUtilities bitmask:v2 hasOption:1];
}

- (void)setHasAppHomeTile:(BOOL)a3
{
  unint64_t v4 = +[CAFBitMaskUtilities bitmask:[(CAFSettingProminenceLevelCharacteristic *)self settingProminenceLevelValue] setOption:1 on:a3];
  [(CAFSettingProminenceLevelCharacteristic *)self setSettingProminenceLevelValue:v4];
}

- (id)formattedValue
{
  uint64_t v2 = [(CAFSettingProminenceLevelCharacteristic *)self settingProminenceLevelValue];
  return NSStringFromSettingProminenceLevel(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000036000019";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end