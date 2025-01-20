@interface CLVehicleHeading
+ (BOOL)supportsSecureCoding;
- (CLVehicleHeading)initWithClientVehicleHeading:(id)a3;
- (CLVehicleHeading)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (double)trueHeading;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLVehicleHeading

- (CLVehicleHeading)initWithClientVehicleHeading:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  v7.receiver = self;
  v7.super_class = (Class)CLVehicleHeading;
  v5 = [(CLVehicleHeading *)&v7 init];
  if (v5) {
    v5->_internal = -[CLVehicleHeadingInternal initWithClientVehicleHeading:]([CLVehicleHeadingInternal alloc], "initWithClientVehicleHeading:", var0, var1);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVehicleHeading)initWithCoder:(id)a3
{
  double v10 = 0.0;
  double v11 = 0.0;
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"kCLVehicleHeadingCodingKeyTrueHeading"];
    double v6 = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", @"kCLVehicleHeadingCodingKeyTimestamp", *(void *)&v5);
    double v8 = v7;
    double v11 = v7;
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&v10];
    [a3 decodeValueOfObjCType:"d" at:&v11];
    double v6 = v10;
    double v8 = v11;
  }
  return -[CLVehicleHeading initWithClientVehicleHeading:](self, "initWithClientVehicleHeading:", v6, v8);
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLVehicleHeadingCodingKeyTrueHeading" forKey:internal[1]];
    double v5 = internal[2];
    [a3 encodeDouble:@"kCLVehicleHeadingCodingKeyTimestamp" forKey:v5];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:internal + 1];
    [a3 encodeValueOfObjCType:"d" at:internal + 2];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLVehicleHeading;
  [(CLVehicleHeading *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [self->_internal copyWithZone:a3];
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"trueHeading %.2f @ %@", *((void *)self->_internal + 1), objc_msgSend(MEMORY[0x1E4F28C10], "localizedStringFromDate:dateStyle:timeStyle:", -[CLVehicleHeading timestamp](self, "timestamp"), 1, 4)];
}

- (id)shortDescription
{
  return (id)[NSString stringWithFormat:@"%.2f", *((void *)self->_internal + 1)];
}

- (double)trueHeading
{
  return *((double *)self->_internal + 1);
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)self->_internal + 2)];
}

@end