@interface CLCircularGeographicCondition
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (CLCircularGeographicCondition)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius;
- (CLCircularGeographicCondition)initWithCoder:(id)a3;
- (CLLocationCoordinate2D)center;
- (CLLocationDistance)radius;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CLCircularGeographicCondition

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLCircularGeographicCondition)initWithCenter:(CLLocationCoordinate2D)center radius:(CLLocationDistance)radius
{
  CLLocationDegrees longitude = center.longitude;
  CLLocationDegrees latitude = center.latitude;
  v8.receiver = self;
  v8.super_class = (Class)CLCircularGeographicCondition;
  result = [(CLCondition *)&v8 initCondition];
  if (result)
  {
    result->_center.CLLocationDegrees latitude = latitude;
    result->_center.CLLocationDegrees longitude = longitude;
    result->_radius = radius;
  }
  return result;
}

- (id)description
{
  v3 = NSString;
  [(CLCircularGeographicCondition *)self center];
  uint64_t v5 = v4;
  [(CLCircularGeographicCondition *)self center];
  uint64_t v7 = v6;
  [(CLCircularGeographicCondition *)self radius];
  return (id)[v3 stringWithFormat:@"CLCircularGeographicCondition(center:<%+.8f, %+.8f>, radius: %.2fm)", v5, v7, v8];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  [a3 center];
  double v6 = round(v5 * 1000000.0);
  [(CLCircularGeographicCondition *)self center];
  if (vabdd_f64(v6, round(v7 * 1000000.0)) > 2.22044605e-16) {
    return 0;
  }
  [a3 center];
  double v9 = round(v8 * 1000000.0);
  [(CLCircularGeographicCondition *)self center];
  if (vabdd_f64(v9, round(v10 * 1000000.0)) > 2.22044605e-16) {
    return 0;
  }
  [a3 radius];
  double v13 = round(v12 * 1000000.0);
  [(CLCircularGeographicCondition *)self radius];
  return vabdd_f64(v13, round(v14 * 1000000.0)) <= 2.22044605e-16;
}

- (unint64_t)hash
{
  [(CLCircularGeographicCondition *)self center];
  unint64_t v4 = vcvtad_u64_f64(v3 * 1000000.0);
  [(CLCircularGeographicCondition *)self center];
  unint64_t v6 = vcvtad_u64_f64(v5 * 1000000.0) ^ v4;
  [(CLCircularGeographicCondition *)self radius];
  return v6 ^ vcvtad_u64_f64(v7 * 1000000.0);
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLCircularGeographicCondition.mm", 64, @"Invalid parameter not satisfying: %@", @"coder.allowsKeyedCoding");
  }
  [(CLCircularGeographicCondition *)self center];
  objc_msgSend(a3, "encodeDouble:forKey:", @"kCircularGeographicConditionCodingKeyCenterLatitude");
  [(CLCircularGeographicCondition *)self center];
  [a3 encodeDouble:@"kCircularGeographicConditionCodingKeyCenterLongitude" forKey:v6];
  [(CLCircularGeographicCondition *)self radius];

  objc_msgSend(a3, "encodeDouble:forKey:", @"kCircularGeographicConditionCodingKeyRadius");
}

- (CLCircularGeographicCondition)initWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CLCircularGeographicCondition.mm", 72, @"Invalid parameter not satisfying: %@", @"decoder.allowsKeyedCoding");
  }
  [a3 decodeDoubleForKey:@"kCircularGeographicConditionCodingKeyCenterLatitude"];
  [a3 decodeDoubleForKey:@"kCircularGeographicConditionCodingKeyCenterLongitude"];
  [a3 decodeDoubleForKey:@"kCircularGeographicConditionCodingKeyRadius"];

  return (CLCircularGeographicCondition *)MEMORY[0x1F4181798](self, sel_initWithCenter_radius_);
}

- (CLLocationCoordinate2D)center
{
  objc_copyStruct(v4, &self->_center, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.CLLocationDegrees longitude = v3;
  result.CLLocationDegrees latitude = v2;
  return result;
}

- (CLLocationDistance)radius
{
  return self->_radius;
}

@end