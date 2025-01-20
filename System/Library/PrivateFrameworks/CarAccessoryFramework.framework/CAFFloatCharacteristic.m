@interface CAFFloatCharacteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFFloatRange)range;
- (float)floatValue;
- (id)descriptionExtras;
- (id)formattedValue;
- (void)setFloatValue:(float)a3;
@end

@implementation CAFFloatCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFFloatCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (float)floatValue
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [v4 floatValue];
  float v6 = v5;

  return v6;
}

- (void)setFloatValue:(float)a3
{
  float v5 = [(CAFFloatCharacteristic *)self range];
  *(float *)&double v6 = a3;
  char v7 = [v5 valueIsInRange:v6];

  if (v7)
  {
    v9 = NSNumber;
    id v17 = [(CAFFloatCharacteristic *)self range];
    *(float *)&double v10 = a3;
    [v17 valueRoundedToNearestStepValue:v10];
    v11 = objc_msgSend(v9, "numberWithFloat:");
    [(CAFCharacteristic *)self setValue:v11];
  }
  else
  {
    v12 = (void *)MEMORY[0x263F087E8];
    *(float *)&double v8 = a3;
    v13 = [NSNumber numberWithFloat:v8];
    v14 = [(CAFFloatCharacteristic *)self range];
    v15 = objc_msgSend(v12, "CAF_outOfRangeErrorForValue:range:", v13, v14);
    [(CAFCharacteristic *)self setError:v15];

    v16 = CAFGeneralLogging();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      [(CAFFloatCharacteristic *)(uint64_t)self setFloatValue:a3];
    }
  }
}

- (CAFFloatRange)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFFloatRange alloc];
    float v5 = [(CAFCharacteristic *)self metaData];
    double v6 = [(CAFRange *)v4 initWithMetaData:v5];
    char v7 = self->_range;
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
    [(CAFFloatCharacteristic *)self floatValue];
    objc_msgSend(v4, "stringWithFormat:", @"%g", v5);
    double v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v6 = @"(null)";
  }
  char v7 = v6;

  return v7;
}

+ (id)primaryCharacteristicFormat
{
  return @"float";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  id v3 = [(CAFFloatCharacteristic *)self range];
  id v4 = [v3 description];
  float v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setFloatValue:(float)a3 .cold.1(uint64_t a1, NSObject *a2, float a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2050;
  double v6 = a3;
  _os_log_error_impl(&dword_249710000, a2, OS_LOG_TYPE_ERROR, "%{public}@ floatValue out of range %{public}g", (uint8_t *)&v3, 0x16u);
}

@end