@interface CAFNotificationSeverityCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFNotificationSeverityCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNotificationSeverityCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFNotificationSeverityCharacteristic *)self notificationSeverityValue];
  return NSStringFromNotificationSeverity(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"0x0000000049000002";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end