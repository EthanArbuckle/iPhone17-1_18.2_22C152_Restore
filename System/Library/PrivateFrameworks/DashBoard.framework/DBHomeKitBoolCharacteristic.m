@interface DBHomeKitBoolCharacteristic
+ (id)characteristicFormat;
+ (void)load;
- (BOOL)BOOLValue;
- (id)formatedValue;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation DBHomeKitBoolCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___DBHomeKitBoolCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)characteristicFormat
{
  return (id)*MEMORY[0x263F0BE38];
}

- (id)formatedValue
{
  if ([(DBHomeKitBoolCharacteristic *)self BOOLValue]) {
    objc_super v2 = @"YES";
  }
  else {
    objc_super v2 = @"NO";
  }
  return v2;
}

- (BOOL)BOOLValue
{
  objc_super v2 = [(DBHomeKitCharacteristic *)self value];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (void)setBoolValue:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(DBHomeKitCharacteristic *)self setValue:v4];
}

@end