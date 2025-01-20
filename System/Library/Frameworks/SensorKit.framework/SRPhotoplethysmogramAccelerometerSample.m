@interface SRPhotoplethysmogramAccelerometerSample
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAccelSample:(id)a3;
- (NSMeasurement)samplingFrequency;
- (NSMeasurement)x;
- (NSMeasurement)y;
- (NSMeasurement)z;
- (SRPhotoplethysmogramAccelerometerSample)initWithCoder:(id)a3;
- (SRPhotoplethysmogramAccelerometerSample)initWithHAPPGAccelSample:(id)a3;
- (SRPhotoplethysmogramAccelerometerSample)initWithTimestamp:(int64_t)a3 frequency:(double)a4 x:(double)a5 y:(double)a6 z:(double)a7;
- (id)description;
- (int64_t)nanosecondsSinceStart;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRPhotoplethysmogramAccelerometerSample

- (SRPhotoplethysmogramAccelerometerSample)initWithTimestamp:(int64_t)a3 frequency:(double)a4 x:(double)a5 y:(double)a6 z:(double)a7
{
  v13.receiver = self;
  v13.super_class = (Class)SRPhotoplethysmogramAccelerometerSample;
  result = [(SRPhotoplethysmogramAccelerometerSample *)&v13 init];
  if (result)
  {
    result->_nanosecondsSinceStart = a3;
    result->_rawFrequency = a4;
    result->_rawX = a5;
    result->_rawY = a6;
    result->_rawZ = a7;
  }
  return result;
}

- (SRPhotoplethysmogramAccelerometerSample)initWithHAPPGAccelSample:(id)a3
{
  uint64_t v5 = [a3 timestamp];
  double v6 = (double)[a3 samplingFrequency];
  [a3 x];
  double v8 = v7;
  [a3 y];
  double v10 = v9;
  [a3 z];

  return [(SRPhotoplethysmogramAccelerometerSample *)self initWithTimestamp:v5 frequency:v6 x:v8 y:v10 z:v11];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }

  return [(SRPhotoplethysmogramAccelerometerSample *)self isEqualToAccelSample:a3];
}

- (BOOL)isEqualToAccelSample:(id)a3
{
  int64_t v5 = [(SRPhotoplethysmogramAccelerometerSample *)self nanosecondsSinceStart];
  if (v5 != [a3 nanosecondsSinceStart]
    || !-[NSMeasurement isEqual:](-[SRPhotoplethysmogramAccelerometerSample samplingFrequency](self, "samplingFrequency"), "isEqual:", [a3 samplingFrequency])|| !-[NSMeasurement isEqual:](-[SRPhotoplethysmogramAccelerometerSample x](self, "x"), "isEqual:", objc_msgSend(a3, "x"))|| !-[NSMeasurement isEqual:](-[SRPhotoplethysmogramAccelerometerSample y](self, "y"), "isEqual:", objc_msgSend(a3, "y")))
  {
    return 0;
  }
  double v6 = [(SRPhotoplethysmogramAccelerometerSample *)self z];
  uint64_t v7 = [a3 z];

  return [(NSMeasurement *)v6 isEqual:v7];
}

- (unint64_t)hash
{
  uint64_t v3 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithLongLong:", self->_nanosecondsSinceStart), "hash");
  uint64_t v4 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawFrequency), "hash") ^ v3;
  uint64_t v5 = objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawX), "hash");
  uint64_t v6 = v4 ^ v5 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawY), "hash");
  return v6 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_rawZ), "hash");
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): nanosecondsSinceStart: %lld, frequency: %f, x: %f, y: %f, z: %f", NSStringFromClass(v4), self, -[SRPhotoplethysmogramAccelerometerSample nanosecondsSinceStart](self, "nanosecondsSinceStart"), *(void *)&self->_rawFrequency, *(void *)&self->_rawX, *(void *)&self->_rawY, *(void *)&self->_rawZ];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 388, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeInt64:self->_nanosecondsSinceStart forKey:@"nanosecondsSinceStart"];
  [a3 encodeDouble:@"frequency" forKey:self->_rawFrequency];
  [a3 encodeDouble:@"x" forKey:self->_rawX];
  [a3 encodeDouble:@"y" forKey:self->_rawY];
  double rawZ = self->_rawZ;

  [a3 encodeDouble:@"z" forKey:rawZ];
}

- (SRPhotoplethysmogramAccelerometerSample)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRPhotoplethysmogramSample.m", 398, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  uint64_t v6 = [a3 decodeInt64ForKey:@"nanosecondsSinceStart"];
  [a3 decodeDoubleForKey:@"frequency"];
  double v8 = v7;
  [a3 decodeDoubleForKey:@"x"];
  double v10 = v9;
  [a3 decodeDoubleForKey:@"y"];
  double v12 = v11;
  [a3 decodeDoubleForKey:@"z"];

  return [(SRPhotoplethysmogramAccelerometerSample *)self initWithTimestamp:v6 frequency:v8 x:v10 y:v12 z:v13];
}

- (NSMeasurement)samplingFrequency
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CC8], "hertz"), self->_rawFrequency);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)x
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08C68], "gravity"), self->_rawX);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)y
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08C68], "gravity"), self->_rawY);

  return (NSMeasurement *)v4;
}

- (NSMeasurement)z
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  uint64_t v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08C68], "gravity"), self->_rawZ);

  return (NSMeasurement *)v4;
}

- (int64_t)nanosecondsSinceStart
{
  return self->_nanosecondsSinceStart;
}

@end