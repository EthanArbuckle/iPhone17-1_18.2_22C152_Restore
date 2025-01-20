@interface CAFInt32Characteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFInt32Range)range;
- (id)descriptionExtras;
- (id)formattedValue;
- (int)int32Value;
- (void)setInt32Value:(int)a3;
@end

@implementation CAFInt32Characteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFInt32Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (int)int32Value
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int v5 = [v4 intValue];
  return v5;
}

- (void)setInt32Value:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  int v5 = [(CAFInt32Characteristic *)self range];
  char v6 = [v5 valueIsInRange:v3];

  if (v6)
  {
    v7 = NSNumber;
    id v14 = [(CAFInt32Characteristic *)self range];
    v8 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", v3));
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSNumber numberWithInt:v3];
    v11 = [(CAFInt32Characteristic *)self range];
    v12 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    [(CAFCharacteristic *)self setError:v12];

    v13 = CAFGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CAFInt32Characteristic *)(uint64_t)self setInt32Value:v13];
    }
  }
}

- (CAFInt32Range)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFInt32Range alloc];
    int v5 = [(CAFCharacteristic *)self metaData];
    char v6 = [(CAFRange *)v4 initWithMetaData:v5];
    v7 = self->_range;
    self->_range = v6;

    range = self->_range;
  }
  return range;
}

- (id)formattedValue
{
  uint64_t v3 = [(CAFCharacteristic *)self value];
  if (v3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", -[CAFInt32Characteristic int32Value](self, "int32Value"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  int v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"int32";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  uint64_t v3 = [(CAFInt32Characteristic *)self range];
  id v4 = [v3 description];
  int v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setInt32Value:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ int32Value out of range %{public}d", (uint8_t *)&v3, 0x12u);
}

@end