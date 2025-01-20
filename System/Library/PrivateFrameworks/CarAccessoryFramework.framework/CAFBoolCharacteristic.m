@interface CAFBoolCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (BOOL)BOOLValue;
- (id)formattedValue;
- (void)setBoolValue:(BOOL)a3;
@end

@implementation CAFBoolCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFBoolCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)BOOLValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  char v5 = [v4 BOOLValue];
  return v5;
}

- (void)setBoolValue:(BOOL)a3
{
  id v4 = [NSNumber numberWithBool:a3];
  [(CAFCharacteristic *)self setValue:v4];
}

- (id)formattedValue
{
  id v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    if ([(CAFBoolCharacteristic *)self BOOLValue]) {
      id v4 = @"YES";
    }
    else {
      id v4 = @"NO";
    }
  }
  else
  {
    id v4 = @"(null)";
  }
  char v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"BOOL";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

@end