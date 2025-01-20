@interface CAFNumberCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFRange)range;
- (NSNumber)numberValue;
- (id)descriptionExtras;
- (id)formattedValue;
- (void)setNumberValue:(id)a3;
@end

@implementation CAFNumberCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFNumberCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSNumber)numberValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSNumber *)v4;
}

- (void)setNumberValue:(id)a3
{
  id v4 = a3;
  v5 = [(CAFNumberCharacteristic *)self range];
  char v6 = [v5 isInRange:v4];

  if (v6)
  {
    v7 = [(CAFNumberCharacteristic *)self range];
    v8 = [v7 valueRoundedToNearestStepValue:v4];
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [(CAFNumberCharacteristic *)self range];
    v11 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v4, v10);
    [(CAFCharacteristic *)self setError:v11];

    v7 = CAFGeneralLogging();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      [(CAFNumberCharacteristic *)(uint64_t)self setNumberValue:v7];
    }
  }
}

- (CAFRange)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFRange alloc];
    v5 = [(CAFCharacteristic *)self metaData];
    char v6 = [(CAFRange *)v4 initWithMetaData:v5];
    v7 = self->_range;
    self->_range = v6;

    range = self->_range;
  }
  return range;
}

- (id)formattedValue
{
  id v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    id v4 = NSString;
    v5 = [(CAFNumberCharacteristic *)self numberValue];
    char v6 = [v4 stringWithFormat:@"%@", v5];
  }
  else
  {
    char v6 = @"(null)";
  }

  return v6;
}

+ (id)primaryCharacteristicFormat
{
  return @"int8";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  id v3 = [(CAFNumberCharacteristic *)self range];
  id v4 = [v3 description];
  v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setNumberValue:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ numberValue out of range %{public}@", (uint8_t *)&v3, 0x16u);
}

@end