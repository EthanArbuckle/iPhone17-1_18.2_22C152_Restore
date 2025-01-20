@interface CAFPairedDeviceCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFPairedDevice)pairedDeviceValue;
- (id)formattedValue;
- (void)setPairedDeviceValue:(id)a3;
@end

@implementation CAFPairedDeviceCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPairedDeviceCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFPairedDevice)pairedDeviceValue
{
  v3 = [CAFPairedDevice alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFPairedDevice *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setPairedDeviceValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFPairedDeviceCharacteristic *)self pairedDeviceValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"PairedDevice";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end