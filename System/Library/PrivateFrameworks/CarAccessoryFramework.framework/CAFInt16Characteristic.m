@interface CAFInt16Characteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFInt16Range)range;
- (id)descriptionExtras;
- (id)formattedValue;
- (signed)int16Value;
- (void)setInt16Value:(signed __int16)a3;
@end

@implementation CAFInt16Characteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFInt16Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (signed)int16Value
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  signed __int16 v5 = [v4 shortValue];
  return v5;
}

- (void)setInt16Value:(signed __int16)a3
{
  uint64_t v3 = a3;
  signed __int16 v5 = [(CAFInt16Characteristic *)self range];
  char v6 = [v5 valueIsInRange:v3];

  if (v6)
  {
    v7 = NSNumber;
    id v14 = [(CAFInt16Characteristic *)self range];
    v8 = objc_msgSend(v7, "numberWithShort:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", v3));
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSNumber numberWithShort:v3];
    v11 = [(CAFInt16Characteristic *)self range];
    v12 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    [(CAFCharacteristic *)self setError:v12];

    v13 = CAFGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CAFInt16Characteristic *)(uint64_t)self setInt16Value:v13];
    }
  }
}

- (CAFInt16Range)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFInt16Range alloc];
    signed __int16 v5 = [(CAFCharacteristic *)self metaData];
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
    objc_msgSend(NSString, "stringWithFormat:", @"%hd", -[CAFInt16Characteristic int16Value](self, "int16Value"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  signed __int16 v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"int16";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  uint64_t v3 = [(CAFInt16Characteristic *)self range];
  id v4 = [v3 description];
  signed __int16 v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setInt16Value:(os_log_t)log .cold.1(uint64_t a1, __int16 a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ int16Value out of range %{public}hd", (uint8_t *)&v3, 0x12u);
}

@end