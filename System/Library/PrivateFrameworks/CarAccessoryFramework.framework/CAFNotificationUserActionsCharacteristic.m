@interface CAFNotificationUserActionsCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFNotificationUserActions)notificationUserActionsValue;
- (id)formattedValue;
- (void)setNotificationUserActionsValue:(id)a3;
@end

@implementation CAFNotificationUserActionsCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNotificationUserActionsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFNotificationUserActions)notificationUserActionsValue
{
  objc_super v2 = [(CAFArrayCharacteristic *)self arrayValue];
  v3 = +[CAFNotificationUserActions notificationUserActionsWithArray:v2];

  return (CAFNotificationUserActions *)v3;
}

- (void)setNotificationUserActionsValue:(id)a3
{
  id v4 = [a3 notificationUserActions];
  [(CAFArrayCharacteristic *)self setArrayValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFNotificationUserActionsCharacteristic *)self notificationUserActionsValue];
  v3 = [v2 formattedValue];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"NotificationUserActions";
}

+ (id)secondaryCharacteristicFormats
{
  v4[1] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000037000002";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  return v2;
}

@end