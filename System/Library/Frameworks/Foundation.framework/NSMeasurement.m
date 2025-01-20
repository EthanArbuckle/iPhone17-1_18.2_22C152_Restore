@interface NSMeasurement
+ (BOOL)supportsSecureCoding;
- (BOOL)canBeConvertedToUnit:(NSUnit *)unit;
- (BOOL)isEqual:(id)a3;
- (NSMeasurement)initWithCoder:(id)a3;
- (NSMeasurement)initWithDoubleValue:(double)doubleValue unit:(id)unit;
- (NSMeasurement)measurementByAddingMeasurement:(NSMeasurement *)measurement;
- (NSMeasurement)measurementByConvertingToUnit:(NSUnit *)unit;
- (NSMeasurement)measurementBySubtractingMeasurement:(NSMeasurement *)measurement;
- (double)doubleValue;
- (id)_performOperation:(int64_t)a3 withMeasurement:(id)a4;
- (id)description;
- (id)unit;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation NSMeasurement

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)NSMeasurement;
  [(NSMeasurement *)&v3 dealloc];
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (id)unit
{
  v2 = self->_unit;

  return v2;
}

- (NSMeasurement)measurementByConvertingToUnit:(NSUnit *)unit
{
  if (!-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:"))
  {
    uint64_t v12 = objc_opt_class();
    v13 = +[NSString stringWithFormat:@"Cannot convert measurements of differing unit types! self: %@ unit: %@", v12, objc_opt_class()];
    goto LABEL_14;
  }
  if ([(NSUnit *)self->_unit isEqual:unit])
  {
    v5 = [NSMeasurement alloc];
    double doubleValue = self->_doubleValue;
    goto LABEL_9;
  }
  if (!isDimensional() || !isDimensional())
  {
    uint64_t v14 = objc_opt_class();
    v13 = +[NSString stringWithFormat:@"Cannot convert differing units that are non-dimensional! lhs: %@ rhs: %@", v14, objc_opt_class()];
LABEL_14:
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v13 userInfo:0]);
  }
  objc_msgSend((id)-[NSUnit converter](self->_unit, "converter"), "baseUnitValueFromValue:", self->_doubleValue);
  double v8 = v7;
  [(NSUnit *)unit dimension];
  if (!-[NSUnit isEqual:](unit, "isEqual:", [(id)objc_opt_class() baseUnit]))
  {
    objc_msgSend((id)-[NSUnit converter](unit, "converter"), "valueFromBaseUnitValue:", v8);
    double v8 = v9;
  }
  v5 = [NSMeasurement alloc];
  double doubleValue = v8;
LABEL_9:
  v10 = [(NSMeasurement *)v5 initWithDoubleValue:unit unit:doubleValue];

  return v10;
}

- (NSMeasurement)initWithDoubleValue:(double)doubleValue unit:(id)unit
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Must pass in an NSUnit object!" userInfo:0]);
  }
  v10.receiver = self;
  v10.super_class = (Class)NSMeasurement;
  double v7 = [(NSMeasurement *)&v10 init];
  double v8 = v7;
  if (v7)
  {
    v7->_double doubleValue = doubleValue;
    v7->_unit = (NSUnit *)[unit copy];
  }
  return v8;
}

- (BOOL)canBeConvertedToUnit:(NSUnit *)unit
{
  if (objc_opt_isKindOfClass())
  {
    [(NSUnit *)self->_unit _effectiveUnitClass];
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (id)_performOperation:(int64_t)a3 withMeasurement:(id)a4
{
  if (!-[NSMeasurement canBeConvertedToUnit:](self, "canBeConvertedToUnit:", [a4 unit]))
  {
    uint64_t v13 = objc_opt_class();
    [a4 unit];
    uint64_t v14 = objc_opt_class();
    if (a3 == 1)
    {
      v15 = +[NSString stringWithFormat:@"Cannot subtract measurements of differing unit types! lhs: %@ rhs: %@", v13, v14];
    }
    else
    {
      if (a3) {
        goto LABEL_23;
      }
      v15 = +[NSString stringWithFormat:@"Cannot add measurements of differing unit types! lhs: %@ rhs: %@", v13, v14];
    }
    goto LABEL_33;
  }
  if (-[NSUnit isEqual:](self->_unit, "isEqual:", [a4 unit]))
  {
    double doubleValue = self->_doubleValue;
    [a4 doubleValue];
    double v9 = doubleValue - v8;
    double v10 = doubleValue + v8;
    if (a3) {
      double v10 = 0.0;
    }
    if (a3 == 1) {
      double v11 = v9;
    }
    else {
      double v11 = v10;
    }
    unit = self->_unit;
    goto LABEL_24;
  }
  [a4 unit];
  if (!isDimensional() || !isDimensional())
  {
    uint64_t v23 = objc_opt_class();
    [a4 unit];
    uint64_t v24 = objc_opt_class();
    if (a3 == 1)
    {
      v15 = +[NSString stringWithFormat:@"Cannot subtract differing units that are non-dimensional! lhs: %@ rhs: %@", v23, v24];
    }
    else
    {
      if (a3) {
        goto LABEL_23;
      }
      v15 = +[NSString stringWithFormat:@"Cannot add differing units that are non-dimensional! lhs: %@ rhs: %@", v23, v24];
    }
LABEL_33:
    v29 = (__CFString *)v15;
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    goto LABEL_34;
  }
  objc_msgSend((id)objc_msgSend(a4, "unit"), "dimension");
  [(NSUnit *)self->_unit dimension];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3 != 1)
    {
      if (!a3)
      {
        v27 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v28 = *MEMORY[0x1E4F1C3C8];
        v29 = @"Cannot add measurements of differing unit types!";
        goto LABEL_34;
      }
LABEL_23:
      unit = 0;
      double v11 = 0.0;
      goto LABEL_24;
    }
    v27 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v28 = *MEMORY[0x1E4F1C3C8];
    v29 = @"Cannot subtract measurements of differing unit types!";
LABEL_34:
    objc_exception_throw((id)[v27 exceptionWithName:v28 reason:v29 userInfo:0]);
  }
  [(NSUnit *)self->_unit dimension];
  v16 = -[NSMeasurement measurementByConvertingToUnit:](self, "measurementByConvertingToUnit:", [(id)objc_opt_class() baseUnit]);
  [(NSUnit *)self->_unit dimension];
  v17 = objc_msgSend(a4, "measurementByConvertingToUnit:", objc_msgSend((id)objc_opt_class(), "baseUnit"));
  [(NSMeasurement *)v16 doubleValue];
  double v19 = v18;
  [v17 doubleValue];
  double v21 = v19 - v20;
  double v22 = v19 + v20;
  if (a3) {
    double v22 = 0.0;
  }
  if (a3 == 1) {
    double v11 = v21;
  }
  else {
    double v11 = v22;
  }
  unit = [(NSMeasurement *)v16 unit];
LABEL_24:
  v25 = [[NSMeasurement alloc] initWithDoubleValue:unit unit:v11];

  return v25;
}

- (NSMeasurement)measurementByAddingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)[(NSMeasurement *)self _performOperation:0 withMeasurement:measurement];
}

- (NSMeasurement)measurementBySubtractingMeasurement:(NSMeasurement *)measurement
{
  return (NSMeasurement *)[(NSMeasurement *)self _performOperation:1 withMeasurement:measurement];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  double doubleValue = self->_doubleValue;
  [a3 doubleValue];
  if (doubleValue != v6) {
    return 0;
  }
  unit = self->_unit;
  uint64_t v9 = [a3 unit];

  return [(NSUnit *)unit isEqual:v9];
}

- (unint64_t)hash
{
  double doubleValue = self->_doubleValue;
  double v3 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v3 = self->_doubleValue;
  }
  long double v4 = floor(v3 + 0.5);
  double v5 = (v3 - v4) * 1.84467441e19;
  double v6 = fmod(v4, 1.84467441e19);
  unint64_t v7 = 2654435761u * (unint64_t)v6;
  unint64_t v8 = v7 + (unint64_t)v5;
  if (v5 <= 0.0) {
    unint64_t v8 = 2654435761u * (unint64_t)v6;
  }
  unint64_t v9 = v7 - (unint64_t)fabs(v5);
  if (v5 < 0.0) {
    return v9;
  }
  else {
    return v8;
  }
}

- (id)description
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)NSMeasurement;
  return (id)objc_msgSend(-[NSMeasurement description](&v3, sel_description), "stringByAppendingString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @" value: %f unit: %@", *(void *)&self->_doubleValue, -[NSUnit symbol](self->_unit, "symbol")));
}

- (NSMeasurement)initWithCoder:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSMeasurement cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  [a3 decodeDoubleForKey:@"NS.value"];
  double v6 = v5;
  uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.unit"];
  if (v7)
  {
    return [(NSMeasurement *)self initWithDoubleValue:v7 unit:v6];
  }
  else
  {

    unint64_t v9 = @"NSLocalizedDescription";
    v10[0] = @"Unit class object has been corrupted!";
    objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1)));
    return 0;
  }
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSMeasurement cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  [a3 encodeDouble:@"NS.value" forKey:self->_doubleValue];
  unit = self->_unit;

  [a3 encodeObject:unit forKey:@"NS.unit"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end