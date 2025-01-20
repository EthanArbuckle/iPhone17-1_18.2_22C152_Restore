@interface CAFMeasurementRange
+ (id)maximum;
+ (id)minimum;
+ (id)step;
- (BOOL)valueIsInRange:(id)a3;
- (CAFMeasurementRange)initWithMetaData:(id)a3 unit:(id)a4;
- (NSMeasurement)maximumValue;
- (NSMeasurement)minimumValue;
- (NSMeasurement)stepValue;
- (NSUnit)unit;
- (id)rangeDescription;
@end

@implementation CAFMeasurementRange

- (CAFMeasurementRange)initWithMetaData:(id)a3 unit:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CAFMeasurementRange;
  v8 = [(CAFRange *)&v11 initWithMetaData:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_unit, a4);
  }

  return v9;
}

- (NSMeasurement)minimumValue
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  v4 = [(CAFRange *)self minimum];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [(CAFMeasurementRange *)self unit];
  v8 = (void *)[v3 initWithDoubleValue:v7 unit:v6];

  return (NSMeasurement *)v8;
}

- (NSMeasurement)maximumValue
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  v4 = [(CAFRange *)self maximum];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [(CAFMeasurementRange *)self unit];
  v8 = (void *)[v3 initWithDoubleValue:v7 unit:v6];

  return (NSMeasurement *)v8;
}

- (NSMeasurement)stepValue
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  v4 = [(CAFRange *)self step];
  [v4 doubleValue];
  double v6 = v5;
  id v7 = [(CAFMeasurementRange *)self unit];
  v8 = (void *)[v3 initWithDoubleValue:v7 unit:v6];

  return (NSMeasurement *)v8;
}

- (id)rangeDescription
{
  id v3 = [(CAFMeasurementRange *)self minimumValue];
  v4 = +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:v3];

  double v5 = [(CAFMeasurementRange *)self maximumValue];
  double v6 = +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:v5];

  id v7 = [(CAFMeasurementRange *)self stepValue];
  v8 = +[CAFMeasurementCharacteristic _sharedStringFromMeasurement:v7];

  v9 = [NSString stringWithFormat:@"[%@..%@]x%@", v4, v6, v8];

  return v9;
}

- (BOOL)valueIsInRange:(id)a3
{
  v4 = NSNumber;
  id v5 = a3;
  double v6 = [(CAFMeasurementRange *)self unit];
  id v7 = [v5 measurementByConvertingToUnit:v6];

  [v7 doubleValue];
  v8 = objc_msgSend(v4, "numberWithDouble:");
  LOBYTE(self) = [(CAFRange *)self isInRange:v8];

  return (char)self;
}

+ (id)minimum
{
  return &unk_26FD94CC0;
}

+ (id)maximum
{
  return &unk_26FD94CD0;
}

+ (id)step
{
  return &unk_26FD94CE0;
}

- (NSUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
}

@end