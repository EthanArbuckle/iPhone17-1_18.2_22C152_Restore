@interface CAFHistoricalNotificationUserActionCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFHistoricalNotificationUserAction)historicalNotificationUserActionValue;
- (id)formattedValue;
- (void)setHistoricalNotificationUserActionValue:(id)a3;
@end

@implementation CAFHistoricalNotificationUserActionCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotificationUserActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFHistoricalNotificationUserAction)historicalNotificationUserActionValue
{
  v3 = [CAFHistoricalNotificationUserAction alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFHistoricalNotificationUserAction *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setHistoricalNotificationUserActionValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFHistoricalNotificationUserActionCharacteristic *)self historicalNotificationUserActionValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"HistoricalNotificationUserAction";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end