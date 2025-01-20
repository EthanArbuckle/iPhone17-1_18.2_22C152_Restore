@interface CAFMeasurementCharacteristic
+ (id)_sharedStringFromMeasurement:(id)a3;
+ (id)primaryCharacteristicFormat;
+ (id)secondaryCharacteristicFormats;
+ (void)load;
- (CAFMeasurementRange)range;
- (NSMeasurement)measurementValue;
- (NSNumber)numberValue;
- (NSUnit)unit;
- (id)formattedValue;
- (void)_setNumberValue:(id)a3;
- (void)setMeasurementValue:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)unit;
@end

@implementation CAFMeasurementCharacteristic

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFMeasurementCharacteristic;
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
  id v4 = (objc_class *)MEMORY[0x263F08980];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 doubleValue];
  double v8 = v7;

  v9 = [(CAFMeasurementCharacteristic *)self unit];
  id v12 = (id)[v6 initWithDoubleValue:v9 unit:v8];

  v10 = [(CAFMeasurementCharacteristic *)self unit];
  v11 = [v12 measurementByConvertingToUnit:v10];
  [(CAFMeasurementCharacteristic *)self _setNumberValue:v11];
}

- (NSMeasurement)measurementValue
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  id v4 = [(CAFMeasurementCharacteristic *)self numberValue];
  [v4 doubleValue];
  double v6 = v5;
  double v7 = [(CAFMeasurementCharacteristic *)self unit];
  double v8 = (void *)[v3 initWithDoubleValue:v7 unit:v6];

  return (NSMeasurement *)v8;
}

- (void)setMeasurementValue:(id)a3
{
  id v4 = a3;
  id v6 = [(CAFMeasurementCharacteristic *)self unit];
  double v5 = [v4 measurementByConvertingToUnit:v6];

  [(CAFMeasurementCharacteristic *)self _setNumberValue:v5];
}

- (void)_setNumberValue:(id)a3
{
  id v4 = NSNumber;
  id v5 = a3;
  [v5 doubleValue];
  id v6 = objc_msgSend(v4, "numberWithDouble:");
  double v7 = [(CAFMeasurementCharacteristic *)self range];
  char v8 = [v7 valueIsInRange:v5];

  if (v8)
  {
    v9 = [(CAFMeasurementCharacteristic *)self range];
    v10 = [v9 valueRoundedToNearestStepValue:v6];
    [(CAFCharacteristic *)self setValue:v10];
  }
  else
  {
    v11 = (void *)MEMORY[0x263F087E8];
    id v12 = [(CAFMeasurementCharacteristic *)self range];
    v13 = objc_msgSend(v11, "CAF_outOfRangeErrorForValue:range:", v6, v12);
    [(CAFCharacteristic *)self setError:v13];

    v9 = CAFGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(CAFNumberCharacteristic *)(uint64_t)self setNumberValue:v9];
    }
  }
}

- (NSUnit)unit
{
  id v3 = [(CAFCharacteristic *)self metaData];
  id v4 = [v3 units];

  if (v4) {
    unsigned __int16 v5 = [v4 unsignedIntValue];
  }
  else {
    unsigned __int16 v5 = 0;
  }
  int v6 = v5;
  double v7 = NSUnitFromCAFUnitType(v5);
  if (!v7)
  {
    char v8 = CAFGeneralLogging();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (v6)
    {
      if (v9) {
        [(CAFMeasurementCharacteristic *)self unit];
      }
    }
    else if (v9)
    {
      [(CAFMeasurementCharacteristic *)self unit];
    }

    double v7 = (void *)[objc_alloc(MEMORY[0x263F08C60]) initWithSymbol:&stru_26FD46EB0];
  }

  return (NSUnit *)v7;
}

- (CAFMeasurementRange)range
{
  range = self->_range;
  if (!range)
  {
    id v4 = [CAFMeasurementRange alloc];
    unsigned __int16 v5 = [(CAFCharacteristic *)self metaData];
    int v6 = [(CAFMeasurementCharacteristic *)self unit];
    double v7 = [(CAFMeasurementRange *)v4 initWithMetaData:v5 unit:v6];
    char v8 = self->_range;
    self->_range = v7;

    range = self->_range;
  }
  return range;
}

+ (id)_sharedStringFromMeasurement:(id)a3
{
  uint64_t v3 = _sharedStringFromMeasurement__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_sharedStringFromMeasurement__onceToken, &__block_literal_global_13);
  }
  os_unfair_lock_lock((os_unfair_lock_t)&_sharedStringFromMeasurement__sharedFormatterLock);
  unsigned __int16 v5 = [(id)_sharedStringFromMeasurement__sharedFormatter stringFromMeasurement:v4];

  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedStringFromMeasurement__sharedFormatterLock);
  return v5;
}

uint64_t __61__CAFMeasurementCharacteristic__sharedStringFromMeasurement___block_invoke()
{
  _sharedStringFromMeasurement__sharedFormatterLock = 0;
  id v0 = objc_alloc_init(MEMORY[0x263F08988]);
  v1 = (void *)_sharedStringFromMeasurement__sharedFormatter;
  _sharedStringFromMeasurement__sharedFormatter = (uint64_t)v0;

  objc_super v2 = (void *)_sharedStringFromMeasurement__sharedFormatter;
  return [v2 setUnitOptions:1];
}

- (id)formattedValue
{
  objc_super v2 = [(CAFMeasurementCharacteristic *)self measurementValue];
  uint64_t v3 = +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:v2];

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return @"Measurement";
}

+ (id)secondaryCharacteristicFormats
{
  v4[41] = *MEMORY[0x263EF8340];
  v4[0] = @"0x0000000031000010";
  v4[1] = @"0x0000000030000045";
  v4[2] = @"0x0000000030000031";
  v4[3] = @"0x000000003000004D";
  v4[4] = @"0x000000003000004C";
  v4[5] = @"0x0000000040000001";
  v4[6] = @"0x000000004000000A";
  v4[7] = @"0x0000000031000019";
  v4[8] = @"0x0000000030000022";
  v4[9] = @"0x000000003000004A";
  v4[10] = @"0x000000003000004B";
  v4[11] = @"0x0000000030000023";
  v4[12] = @"0x0000000030000025";
  v4[13] = @"0x0000000035000012";
  v4[14] = @"0x0000000035000013";
  v4[15] = @"0x0000000041000002";
  v4[16] = @"0x000000004100001A";
  v4[17] = @"0x0000000032000032";
  v4[18] = @"0x0000000032000033";
  v4[19] = @"0x0000000030000028";
  v4[20] = @"0x0000000030000053";
  v4[21] = @"0x0000000030000052";
  v4[22] = @"0x0000000030000051";
  v4[23] = @"0x0000000030000050";
  v4[24] = @"0x000000003000001B";
  v4[25] = @"0x0000000030000030";
  v4[26] = @"0x0000000030000024";
  v4[27] = @"0x000000003000004F";
  v4[28] = @"0x000000003000004E";
  v4[29] = @"0x0000000030000021";
  v4[30] = @"0x0000000030000046";
  v4[31] = @"0x0000000030000047";
  v4[32] = @"0x0000000030000048";
  v4[33] = @"0x0000000030000049";
  v4[34] = @"0x0000000031000017";
  v4[35] = @"0x000000003000001D";
  v4[36] = @"0x0000000030000056";
  v4[37] = @"0x0000000030000057";
  v4[38] = @"0x0000000030000055";
  v4[39] = @"0x0000000030000054";
  v4[40] = @"0x0000000049000003";
  objc_super v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:41];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)unit
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v6 = [a1 typeName];
  double v7 = [a1 characteristicType];
  v8[0] = 67109634;
  v8[1] = a2;
  __int16 v9 = 2112;
  v10 = v6;
  __int16 v11 = 2112;
  id v12 = v7;
  _os_log_error_impl(&dword_249710000, a3, OS_LOG_TYPE_ERROR, "UnitType %d is unknown for %@(%@)", (uint8_t *)v8, 0x1Cu);
}

@end