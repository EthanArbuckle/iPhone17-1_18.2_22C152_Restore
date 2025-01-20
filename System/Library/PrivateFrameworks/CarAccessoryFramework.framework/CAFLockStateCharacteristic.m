@interface CAFLockStateCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (id)formattedValue;
@end

@implementation CAFLockStateCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFLockStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  unsigned int v2 = [(CAFLockStateCharacteristic *)self lockStateValue];
  return NSStringFromLockState(v2);
}

+ (id)primaryCharacteristicFormat
{
  return @"LockState";
}

+ (id)secondaryCharacteristicFormats
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000060000002";
  v4[1] = @"0x0000000042000009";
  unsigned int v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end