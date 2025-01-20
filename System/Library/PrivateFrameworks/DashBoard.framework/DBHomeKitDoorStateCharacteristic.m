@interface DBHomeKitDoorStateCharacteristic
+ (id)characteristicFormat;
+ (id)characteristicFormats;
+ (id)stringForDoorState:(int64_t)a3;
+ (void)load;
- (id)formatedValue;
- (int64_t)doorStateValue;
- (void)setDoorStateValue:(int64_t)a3;
@end

@implementation DBHomeKitDoorStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___DBHomeKitDoorStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)characteristicFormat
{
  return @"DoorState";
}

+ (id)characteristicFormats
{
  return &unk_26E17F020;
}

- (id)formatedValue
{
  int64_t v2 = [(DBHomeKitDoorStateCharacteristic *)self doorStateValue];
  return +[DBHomeKitDoorStateCharacteristic stringForDoorState:v2];
}

- (int64_t)doorStateValue
{
  int64_t v2 = [(DBHomeKitCharacteristic *)self value];
  int64_t v3 = [v2 integerValue];

  return v3;
}

- (void)setDoorStateValue:(int64_t)a3
{
  id v4 = [NSNumber numberWithInteger:a3];
  [(DBHomeKitCharacteristic *)self setValue:v4];
}

+ (id)stringForDoorState:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 3) {
    return @"Open";
  }
  else {
    return off_2649B6D80[a3 - 1];
  }
}

@end