@interface CAFUInt16Characteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFUInt16Range)range;
- (id)descriptionExtras;
- (id)formattedValue;
- (unsigned)uint16Value;
- (void)setUint16Value:(unsigned __int16)a3;
@end

@implementation CAFUInt16Characteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUInt16Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (unsigned)uint16Value
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int16 v5 = [v4 unsignedShortValue];
  return v5;
}

- (void)setUint16Value:(unsigned __int16)a3
{
  uint64_t v3 = a3;
  unsigned __int16 v5 = [(CAFUInt16Characteristic *)self range];
  char v6 = [v5 valueIsInRange:v3];

  if (v6)
  {
    v7 = NSNumber;
    id v14 = [(CAFUInt16Characteristic *)self range];
    v8 = objc_msgSend(v7, "numberWithUnsignedShort:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", v3));
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSNumber numberWithUnsignedShort:v3];
    v11 = [(CAFUInt16Characteristic *)self range];
    v12 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    [(CAFCharacteristic *)self setError:v12];

    v13 = CAFGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CAFUInt16Characteristic *)(uint64_t)self setUint16Value:v13];
    }
  }
}

- (CAFUInt16Range)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFUInt16Range alloc];
    unsigned __int16 v5 = [(CAFCharacteristic *)self metaData];
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
    objc_msgSend(NSString, "stringWithFormat:", @"%hu", -[CAFUInt16Characteristic uint16Value](self, "uint16Value"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  unsigned __int16 v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"uint16";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  uint64_t v3 = [(CAFUInt16Characteristic *)self range];
  id v4 = [v3 description];
  unsigned __int16 v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setUint16Value:(os_log_t)log .cold.1(uint64_t a1, unsigned __int16 a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ uint16Value out of range %{public}hu", (uint8_t *)&v3, 0x12u);
}

@end