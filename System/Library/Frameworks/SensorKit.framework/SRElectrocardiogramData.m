@interface SRElectrocardiogramData
+ (BOOL)supportsSecureCoding;
+ (id)new;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToECGData:(id)a3;
- (NSMeasurement)value;
- (SRElectrocardiogramData)init;
- (SRElectrocardiogramData)initWithCoder:(id)a3;
- (SRElectrocardiogramData)initWithFlags:(unint64_t)a3 value:(double)a4;
- (id)description;
- (unint64_t)flags;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SRElectrocardiogramData

- (SRElectrocardiogramData)init
{
  return 0;
}

+ (id)new
{
  return 0;
}

- (SRElectrocardiogramData)initWithFlags:(unint64_t)a3 value:(double)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SRElectrocardiogramData;
  result = [(SRElectrocardiogramData *)&v7 init];
  if (result)
  {
    result->_val = a4;
    result->_flags = a3;
  }
  return result;
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

  return [(SRElectrocardiogramData *)self isEqualToECGData:a3];
}

- (BOOL)isEqualToECGData:(id)a3
{
  int v5 = -[NSMeasurement isEqual:](-[SRElectrocardiogramData value](self, "value"), "isEqual:", [a3 value]);
  if (v5)
  {
    unint64_t flags = self->_flags;
    LOBYTE(v5) = flags == [a3 flags];
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMeasurement *)[(SRElectrocardiogramData *)self value] hash];
  return objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInteger:", self->_flags), "hash") ^ v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@ (%p): flags: %lu, value: %@", NSStringFromClass(v4), self, self->_flags, -[SRElectrocardiogramData value](self, "value")];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSample.m", 95, @"Invalid parameter not satisfying: %@", @"[encoder allowsKeyedCoding]");
  }
  [a3 encodeDouble:@"value" forKey:self->_val];
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:self->_flags];

  [a3 encodeObject:v6 forKey:@"flags"];
}

- (SRElectrocardiogramData)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SRElectrocardiogramSample.m", 102, @"Invalid parameter not satisfying: %@", @"[decoder allowsKeyedCoding]");
  }
  [a3 decodeDoubleForKey:@"value"];
  double v7 = v6;
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"flags"), "unsignedIntegerValue");

  return [(SRElectrocardiogramData *)self initWithFlags:v8 value:v7];
}

- (NSMeasurement)value
{
  id v3 = objc_alloc(MEMORY[0x263F08980]);
  v4 = objc_msgSend(v3, "initWithDoubleValue:unit:", objc_msgSend(MEMORY[0x263F08CB0], "microvolts"), self->_val);

  return (NSMeasurement *)v4;
}

- (unint64_t)flags
{
  return self->_flags;
}

@end