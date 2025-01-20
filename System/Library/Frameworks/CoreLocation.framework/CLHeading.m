@interface CLHeading
+ (BOOL)supportsSecureCoding;
- (CLHeading)initWithClientHeading:(id *)a3;
- (CLHeading)initWithCoder:(id)a3;
- (CLHeadingComponentValue)x;
- (CLHeadingComponentValue)y;
- (CLHeadingComponentValue)z;
- (CLLocationDirection)headingAccuracy;
- (CLLocationDirection)magneticHeading;
- (CLLocationDirection)trueHeading;
- (NSDate)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)shortDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLHeading

- (CLHeading)initWithClientHeading:(id *)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLHeading;
  v4 = [(CLHeading *)&v11 init];
  if (v4)
  {
    v5 = [CLHeadingInternal alloc];
    long long v6 = *(_OWORD *)&a3->var6;
    v9[2] = *(_OWORD *)&a3->var4;
    v9[3] = v6;
    v9[4] = *(_OWORD *)&a3->var8;
    uint64_t v10 = *(void *)&a3->var10;
    long long v7 = *(_OWORD *)&a3->var2;
    v9[0] = *(_OWORD *)&a3->var0;
    v9[1] = v7;
    v4->_internal = [(CLHeadingInternal *)v5 initWithClientHeading:v9];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHeading)initWithCoder:(id)a3
{
  uint64_t v20 = 0;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v15 = 0u;
  if ([a3 allowsKeyedCoding])
  {
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyMagneticHeading"];
    *((void *)&v16 + 1) = v5;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyTrueHeading"];
    *(void *)&long long v17 = v6;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyAccuracy"];
    *((void *)&v17 + 1) = v7;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyX"];
    *(void *)&long long v15 = v8;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyY"];
    *((void *)&v15 + 1) = v9;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyZ"];
    *(void *)&long long v16 = v10;
    [a3 decodeDoubleForKey:@"kCLHeadingCodingKeyTimestamp"];
    *(void *)&long long v18 = v11;
  }
  else
  {
    [a3 decodeValueOfObjCType:"d" at:(char *)&v16 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v17];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v17 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v15];
    [a3 decodeValueOfObjCType:"d" at:(char *)&v15 + 8];
    [a3 decodeValueOfObjCType:"d" at:&v16];
    [a3 decodeValueOfObjCType:"d" at:&v18];
  }
  v13[2] = v17;
  v13[3] = v18;
  v13[4] = v19;
  uint64_t v14 = v20;
  v13[0] = v15;
  v13[1] = v16;
  return [(CLHeading *)self initWithClientHeading:v13];
}

- (void)encodeWithCoder:(id)a3
{
  internal = (double *)self->_internal;
  if ([a3 allowsKeyedCoding])
  {
    [a3 encodeDouble:@"kCLHeadingCodingKeyMagneticHeading" forKey:internal[4]];
    [a3 encodeDouble:@"kCLHeadingCodingKeyTrueHeading" forKey:internal[5]];
    [a3 encodeDouble:@"kCLHeadingCodingKeyAccuracy" forKey:internal[6]];
    [a3 encodeDouble:@"kCLHeadingCodingKeyX" forKey:internal[1]];
    [a3 encodeDouble:@"kCLHeadingCodingKeyY" forKey:internal[2]];
    [a3 encodeDouble:@"kCLHeadingCodingKeyZ" forKey:internal[3]];
    double v5 = internal[7];
    [a3 encodeDouble:@"kCLHeadingCodingKeyTimestamp" forKey:v5];
  }
  else
  {
    [a3 encodeValueOfObjCType:"d" at:internal + 4];
    [a3 encodeValueOfObjCType:"d" at:internal + 5];
    [a3 encodeValueOfObjCType:"d" at:internal + 6];
    [a3 encodeValueOfObjCType:"d" at:internal + 1];
    [a3 encodeValueOfObjCType:"d" at:internal + 2];
    [a3 encodeValueOfObjCType:"d" at:internal + 3];
    [a3 encodeValueOfObjCType:"d" at:internal + 7];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHeading;
  [(CLHeading *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  v5[1] = [self->_internal copyWithZone:a3];
  return v5;
}

- (id)description
{
  internal = self->_internal;
  return (id)[NSString stringWithFormat:@"magneticHeading %.2f trueHeading %.2f accuracy %.2f x %+.3f y %+.3f z %+.3f @ %@", internal[4], internal[5], internal[6], internal[1], internal[2], internal[3], -[CLHeading timestamp](self, "timestamp")];
}

- (id)shortDescription
{
  internal = (double *)self->_internal;
  double v3 = internal[5];
  if (v3 >= 0.0)
  {
    uint64_t v4 = 116;
  }
  else
  {
    double v3 = internal[4];
    uint64_t v4 = 109;
  }
  double v5 = internal[6];
  uint64_t v6 = @"±";
  if (v5 < 0.0) {
    uint64_t v6 = &stru_1EE006720;
  }
  return (id)[NSString stringWithFormat:@"%.2f%c %@%.2f° %d (%.1f,%.1f,%.1f) %.1fµT %.1f°", *(void *)&v3, v4, v6, *(void *)&v5, *((unsigned int *)internal + 22), *((void *)internal + 1), *((void *)internal + 2), *((void *)internal + 3), *((void *)internal + 9), *((void *)internal + 10)];
}

- (CLLocationDirection)magneticHeading
{
  return *((double *)self->_internal + 4);
}

- (CLLocationDirection)trueHeading
{
  return *((double *)self->_internal + 5);
}

- (CLLocationDirection)headingAccuracy
{
  return *((double *)self->_internal + 6);
}

- (CLHeadingComponentValue)x
{
  return *((double *)self->_internal + 1);
}

- (CLHeadingComponentValue)y
{
  return *((double *)self->_internal + 2);
}

- (CLHeadingComponentValue)z
{
  return *((double *)self->_internal + 3);
}

- (NSDate)timestamp
{
  return (NSDate *)[MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:*((double *)self->_internal + 7)];
}

@end