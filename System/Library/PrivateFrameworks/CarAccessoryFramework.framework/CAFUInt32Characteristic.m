@interface CAFUInt32Characteristic
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFUInt32Range)range;
- (id)descriptionExtras;
- (id)formattedValue;
- (unsigned)uint32Value;
- (void)setUint32Value:(unsigned int)a3;
@end

@implementation CAFUInt32Characteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUInt32Characteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (unsigned)uint32Value
{
  objc_opt_class();
  id v3 = [(CAFCharacteristic *)self value];
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned int v5 = [v4 unsignedIntValue];
  return v5;
}

- (void)setUint32Value:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  unsigned int v5 = [(CAFUInt32Characteristic *)self range];
  char v6 = [v5 valueIsInRange:v3];

  if (v6)
  {
    v7 = NSNumber;
    id v14 = [(CAFUInt32Characteristic *)self range];
    v8 = objc_msgSend(v7, "numberWithUnsignedInt:", objc_msgSend(v14, "valueRoundedToNearestStepValue:", v3));
    [(CAFCharacteristic *)self setValue:v8];
  }
  else
  {
    v9 = (void *)MEMORY[0x263F087E8];
    v10 = [NSNumber numberWithUnsignedInt:v3];
    v11 = [(CAFUInt32Characteristic *)self range];
    v12 = objc_msgSend(v9, "CAF_outOfRangeErrorForValue:range:", v10, v11);
    [(CAFCharacteristic *)self setError:v12];

    v13 = CAFGeneralLogging();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      [(CAFUInt32Characteristic *)(uint64_t)self setUint32Value:v13];
    }
  }
}

- (CAFUInt32Range)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFUInt32Range alloc];
    unsigned int v5 = [(CAFCharacteristic *)self metaData];
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
    objc_msgSend(NSString, "stringWithFormat:", @"%u", -[CAFUInt32Characteristic uint32Value](self, "uint32Value"));
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v4 = @"(null)";
  }
  unsigned int v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return @"uint32";
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x263EFFA68];
}

- (id)descriptionExtras
{
  objc_super v2 = NSString;
  uint64_t v3 = [(CAFUInt32Characteristic *)self range];
  id v4 = [v3 description];
  unsigned int v5 = [v2 stringWithFormat:@"range=%@", v4];

  return v5;
}

- (void).cxx_destruct
{
}

- (void)setUint32Value:(os_log_t)log .cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1026;
  int v6 = a2;
  _os_log_error_impl(&dword_249710000, log, OS_LOG_TYPE_ERROR, "%{public}@ uint32Value out of range %{public}u", (uint8_t *)&v3, 0x12u);
}

@end