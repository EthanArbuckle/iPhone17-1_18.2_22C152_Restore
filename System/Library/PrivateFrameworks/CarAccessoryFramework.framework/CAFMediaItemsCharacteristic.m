@interface CAFMediaItemsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFMediaItems)mediaItemsValue;
- (id)formattedValue;
- (void)setMediaItemsValue:(id)a3;
@end

@implementation CAFMediaItemsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFMediaItems)mediaItemsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFMediaItems mediaItemsWithArray:v2];

  return (CAFMediaItems *)v3;
}

- (void)setMediaItemsValue:(id)a3
{
  id v4 = [a3 mediaItems];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFMediaItemsCharacteristic *)self mediaItemsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"MediaItems";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000032000012";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end