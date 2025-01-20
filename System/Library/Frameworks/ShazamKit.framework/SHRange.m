@interface SHRange
+ (BOOL)supportsSecureCoding;
+ (SHRange)rangeWithLowerBound:(double)lowerBound upperBound:(double)upperBound;
- (BOOL)contains:(double)a3;
- (BOOL)isEqualToRange:(id)a3 withTolerance:(double)a4;
- (SHRange)initWithCoder:(id)a3;
- (SHRange)initWithLowerBound:(double)lowerBound upperBound:(double)upperBound;
- (SHRange)initWithRange:(_NSRange)a3;
- (SHRange)initWithSerializedRepresentation:(id)a3;
- (SHRange)initWithStart:(double)a3 duration:(double)a4;
- (double)duration;
- (double)lowerBound;
- (double)upperBound;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)serializedRepresentation;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SHRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SHRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SHRange;
  v5 = [(SHRange *)&v9 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"lowerBound"];
    v5->_lowerBound = v6;
    [v4 decodeDoubleForKey:@"upperBound"];
    v5->_upperBound = v7;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(SHRange *)self lowerBound];
  objc_msgSend(v4, "encodeDouble:forKey:", @"lowerBound");
  [(SHRange *)self upperBound];
  objc_msgSend(v4, "encodeDouble:forKey:", @"upperBound");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  [(SHRange *)self lowerBound];
  double v6 = v5;
  [(SHRange *)self upperBound];

  return (id)[v4 initWithLowerBound:v6 upperBound:v7];
}

+ (SHRange)rangeWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  id v4 = (void *)[objc_alloc((Class)a1) initWithLowerBound:lowerBound upperBound:upperBound];

  return (SHRange *)v4;
}

- (SHRange)initWithRange:(_NSRange)a3
{
  return [(SHRange *)self initWithStart:(double)a3.location duration:(double)(a3.length - 1)];
}

- (SHRange)initWithStart:(double)a3 duration:(double)a4
{
  return [(SHRange *)self initWithLowerBound:a3 upperBound:a3 + a4];
}

- (SHRange)initWithLowerBound:(double)lowerBound upperBound:(double)upperBound
{
  v11.receiver = self;
  v11.super_class = (Class)SHRange;
  result = [(SHRange *)&v11 init];
  if (result)
  {
    if (upperBound < lowerBound)
    {
      double v7 = (void *)MEMORY[0x263EFF940];
      uint64_t v8 = *MEMORY[0x263EFF498];
      objc_super v9 = objc_msgSend(NSString, "stringWithFormat:", @"A time range start %f must come before the end %f", *(void *)&lowerBound, *(void *)&upperBound);
      id v10 = [v7 exceptionWithName:v8 reason:v9 userInfo:0];

      objc_exception_throw(v10);
    }
    result->_lowerBound = lowerBound;
    result->_upperBound = upperBound;
  }
  return result;
}

- (SHRange)initWithSerializedRepresentation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  double v6 = (void *)MEMORY[0x263EFF4A0];
  if (v5 != 2) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF4A0], @"A range must have a start and end not %@", v4 format];
  }
  double v7 = [v4 objectAtIndexedSubscript:0];
  uint64_t v8 = [v4 objectAtIndexedSubscript:1];
  objc_super v9 = (void *)v8;
  if (!v7 || !v8) {
    [MEMORY[0x263EFF940] raise:*v6, @"%@ %@ is not a valid start and end", v7, v8 format];
  }
  [v7 doubleValue];
  double v11 = v10;
  [v9 doubleValue];
  v13 = [(SHRange *)self initWithLowerBound:v11 upperBound:v12];

  return v13;
}

- (BOOL)isEqualToRange:(id)a3 withTolerance:(double)a4
{
  id v6 = a3;
  [(SHRange *)self lowerBound];
  double v8 = v7;
  [v6 lowerBound];
  if (vabdd_f64(v8, v9) >= a4)
  {
    BOOL v13 = 0;
  }
  else
  {
    [(SHRange *)self upperBound];
    double v11 = v10;
    [v6 upperBound];
    BOOL v13 = vabdd_f64(v11, v12) < a4;
  }

  return v13;
}

- (id)serializedRepresentation
{
  v9[2] = *MEMORY[0x263EF8340];
  v3 = NSNumber;
  [(SHRange *)self lowerBound];
  id v4 = objc_msgSend(v3, "numberWithDouble:");
  v9[0] = v4;
  uint64_t v5 = NSNumber;
  [(SHRange *)self upperBound];
  id v6 = objc_msgSend(v5, "numberWithDouble:");
  v9[1] = v6;
  double v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:2];

  return v7;
}

- (BOOL)contains:(double)a3
{
  [(SHRange *)self lowerBound];
  if (v5 > a3) {
    return 0;
  }
  [(SHRange *)self upperBound];
  return v7 > a3;
}

- (double)duration
{
  [(SHRange *)self upperBound];
  double v4 = v3;
  [(SHRange *)self lowerBound];
  return v4 - v5;
}

- (id)description
{
  double v3 = NSString;
  [(SHRange *)self lowerBound];
  uint64_t v5 = v4;
  [(SHRange *)self upperBound];
  return (id)objc_msgSend(v3, "stringWithFormat:", @"(%2.f - %2.f)", v5, v6);
}

- (double)lowerBound
{
  return self->_lowerBound;
}

- (double)upperBound
{
  return self->_upperBound;
}

@end