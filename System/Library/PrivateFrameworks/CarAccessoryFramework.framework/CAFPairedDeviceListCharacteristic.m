@interface CAFPairedDeviceListCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFPairedDeviceList)pairedDeviceListValue;
- (id)formattedValue;
- (void)setPairedDeviceListValue:(id)a3;
@end

@implementation CAFPairedDeviceListCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDeviceListCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFPairedDeviceList)pairedDeviceListValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFPairedDeviceList pairedDeviceListWithArray:v2];

  return (CAFPairedDeviceList *)v3;
}

- (void)setPairedDeviceListValue:(id)a3
{
  id v4 = [a3 pairedDevices];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFPairedDeviceListCharacteristic *)self pairedDeviceListValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"PairedDeviceList";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000036000013";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end