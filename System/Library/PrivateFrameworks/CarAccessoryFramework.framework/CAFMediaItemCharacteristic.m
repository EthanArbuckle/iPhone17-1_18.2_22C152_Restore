@interface CAFMediaItemCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFMediaItem)mediaItemValue;
- (id)formattedValue;
- (void)setMediaItemValue:(id)a3;
@end

@implementation CAFMediaItemCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFMediaItem)mediaItemValue
{
  v3 = [CAFMediaItem alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFMediaItem *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setMediaItemValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFMediaItemCharacteristic *)self mediaItemValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"MediaItem";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end