@interface CAFInt64Characteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFInt64Range)range;
- (id)descriptionExtras;
- (id)formattedValue;
- (int64_t)int64Value;
- (void)setInt64Value:(int64_t)a3;
@end

@implementation CAFInt64Characteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFInt64Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (int64_t)int64Value
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  int64_t v5 = [v4 longLongValue];
  return v5;
}

- (void)setInt64Value:(int64_t)a3
{
  int64_t v5 = [(CAFInt64Characteristic *)self range];
  char v6 = [v5 valueIsInRange:a3];

  if (v6)
  {
    v7 = NSNumber;
    id v14 = [(CAFInt64Characteristic *)self range];
    v8 = objc_msgSend(v7, "numberWithLongLong:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", a3));
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSNumber numberWithLongLong:a3];
    v11 = [(CAFInt64Characteristic *)self range];
    v12 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    [(CAFCharacteristic *)self setError:v12];

    v13 = CAFGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CAFInt64Characteristic *)(uint64_t)self setInt64Value:v13];
    }
  }
}

- (CAFInt64Range)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFInt64Range alloc];
    int64_t v5 = [(CAFCharacteristic *)self metaData];
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
    objc_msgSend(NSString, "stringWithFormat:", @"%lld", -[CAFInt64Characteristic int64Value](self, "int64Value"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  int64_t v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"int64";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  id v3 = [(CAFInt64Characteristic *)self range];
  id v4 = [v3 description];
  int64_t v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setInt64Value:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2050;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ int64Value out of range %{public}lld", (uint8_t *)&v3, 0x16u);
}

@end