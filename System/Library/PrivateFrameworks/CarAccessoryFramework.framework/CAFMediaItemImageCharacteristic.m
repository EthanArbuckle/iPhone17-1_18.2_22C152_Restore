@interface CAFMediaItemImageCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFMediaItemImage)mediaItemImageValue;
- (id)formattedValue;
- (void)setMediaItemImageValue:(id)a3;
@end

@implementation CAFMediaItemImageCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaItemImageCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFMediaItemImage)mediaItemImageValue
{
  v3 = [CAFMediaItemImage alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFMediaItemImage *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setMediaItemImageValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFMediaItemImageCharacteristic *)self mediaItemImageValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"MediaItemImage";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end