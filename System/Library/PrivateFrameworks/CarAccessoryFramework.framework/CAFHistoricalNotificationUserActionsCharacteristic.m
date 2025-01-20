@interface CAFHistoricalNotificationUserActionsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFHistoricalNotificationUserActions)historicalNotificationUserActionsValue;
- (id)formattedValue;
- (void)setHistoricalNotificationUserActionsValue:(id)a3;
@end

@implementation CAFHistoricalNotificationUserActionsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFHistoricalNotificationUserActionsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFHistoricalNotificationUserActions)historicalNotificationUserActionsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFHistoricalNotificationUserActions historicalNotificationUserActionsWithArray:v2];

  return (CAFHistoricalNotificationUserActions *)v3;
}

- (void)setHistoricalNotificationUserActionsValue:(id)a3
{
  id v4 = [a3 historicalNotificationUserActions];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFHistoricalNotificationUserActionsCharacteristic *)self historicalNotificationUserActionsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"HistoricalNotificationUserActions";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000049000005";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end