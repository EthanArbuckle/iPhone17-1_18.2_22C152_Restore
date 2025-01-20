@interface CAFMediaItemImagesCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFMediaItemImages)mediaItemImagesValue;
- (id)formattedValue;
- (void)setMediaItemImagesValue:(id)a3;
@end

@implementation CAFMediaItemImagesCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMediaItemImagesCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFMediaItemImages)mediaItemImagesValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFMediaItemImages mediaItemImagesWithArray:v2];

  return (CAFMediaItemImages *)v3;
}

- (void)setMediaItemImagesValue:(id)a3
{
  id v4 = [a3 mediaItemImages];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFMediaItemImagesCharacteristic *)self mediaItemImagesValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"MediaItemImages";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000032000031";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end