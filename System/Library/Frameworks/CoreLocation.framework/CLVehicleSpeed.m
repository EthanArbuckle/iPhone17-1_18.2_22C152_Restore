@interface CLVehicleSpeed
+ (BOOL)supportsSecureCoding;
- (CLVehicleSpeed)initWithClientVehicleSpeed:(id)a3;
- (CLVehicleSpeed)initWithCoder:(id)a3;
- (NSDate)timestamp;
- (double)speed;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLVehicleSpeed

- (CLVehicleSpeed)initWithClientVehicleSpeed:(id)a3
{
  double var3 = a3.var3;
  double var2 = a3.var2;
  double var1 = a3.var1;
  double var0 = a3.var0;
  v9.receiver = self;
  v9.super_class = (Class)CLVehicleSpeed;
  v7 = [(CLVehicleSpeed *)&v9 init];
  if (v7) {
    v7->_internal = -[CLVehicleSpeedInternal initWithClientVehicleSpeed:]([CLVehicleSpeedInternal alloc], "initWithClientVehicleSpeed:", var0, var1, var2, var3);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLVehicleSpeed)initWithCoder:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"kCLVehicleSpeedCodingKeySpeed"];
    double v6 = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", @"kCLVehicleSpeedCodingKeyTimestamp", *(void *)&v5);
    double v8 = v7;
    *((double *)&v12 + 1) = v7;
    double v9 = 0.0;
    double v10 = 0.0;
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:&v12];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v12 + 8];
    double v8 = *((double *)&v12 + 1);
    double v6 = *(double *)&v12;
    double v9 = *((double *)&v13 + 1);
    double v10 = *(double *)&v13;
  }
  return -[CLVehicleSpeed initWithClientVehicleSpeed:](self, "initWithClientVehicleSpeed:", v6, v8, v10, v9);
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLVehicleSpeedCodingKeySpeed" forKey:internal[1]];
    double v5 = internal[2];
    [a3 encodeDouble:@"kCLVehicleSpeedCodingKeyTimestamp" forKey:v5];
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
  v3.super_class = (Class)CLVehicleSpeed;
  [(CLVehicleSpeed *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [self->_internal copyWithZone:a3];
  return v5;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"speed %.2f mps @ %@", *((void *)self->_internal + 1), objc_msgSend(MEMORY[0x1E4F28C10], "localizedStringFromDate:dateStyle:timeStyle:", -[CLVehicleSpeed timestamp](self, "timestamp"), 1, 4)];
}

- (id)shortDescription
{
  double v2 = *((double *)self->_internal + 1);
  double v3 = v2 * 2.23693629;
  BOOL v4 = v2 < 0.0;
  double v5 = -1.0;
  if (!v4) {
    double v5 = v3;
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%.0fmph", *(void *)&v5);
}

- (double)speed
{
  return *((double *)self->_internal + 1);
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)self->_internal + 2)];
}

@end