@interface CAFNotificationUserActionCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFNotificationUserAction)notificationUserActionValue;
- (id)formattedValue;
- (void)setNotificationUserActionValue:(id)a3;
@end

@implementation CAFNotificationUserActionCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNotificationUserActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFNotificationUserAction)notificationUserActionValue
{
  v3 = [CAFNotificationUserAction alloc];
  v4 = [(CAFDictionaryCharacteristic *)self dictionaryValue];
  v5 = [(CAFNotificationUserAction *)v3 initWithDictionary:v4];

  return v5;
}

- (void)setNotificationUserActionValue:(id)a3
{
  id v4 = [a3 dictionaryRepresentation];
  [(CAFDictionaryCharacteristic *)self setDictionaryValue:v4];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFNotificationUserActionCharacteristic *)self notificationUserActionValue];
  v3 = [v2 description];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"NotificationUserAction";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end