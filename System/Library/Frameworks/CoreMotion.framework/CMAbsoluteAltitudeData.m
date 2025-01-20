@interface CMAbsoluteAltitudeData
+ (BOOL)supportsSecureCoding;
- (CMAbsoluteAltitudeData)initWithAltitude:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6 timestamp:(double)a7;
- (CMAbsoluteAltitudeData)initWithCoder:(id)a3;
- (NSNumber)absoluteAltitude;
- (double)absoluteAltitudeAccuracy;
- (double)absoluteAltitudePrecision;
- (double)accuracy;
- (double)altitude;
- (double)precision;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)absoluteAltitudeStatusInfo;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setAltitudeData:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6;
@end

@implementation CMAbsoluteAltitudeData

- (CMAbsoluteAltitudeData)initWithAltitude:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6 timestamp:(double)a7
{
  v12.receiver = self;
  v12.super_class = (Class)CMAbsoluteAltitudeData;
  result = [(CMLogItem *)&v12 initWithTimestamp:a7];
  if (result)
  {
    result->_altitudePrivate = a3;
    result->_absoluteAltitudeAccuracy = a4;
    result->_absoluteAltitudePrecision = a5;
    result->_absoluteAltitudeStatusInfo = a6;
    result->_altitude = a3;
    result->_precision = a5;
    result->_accuracy = a4;
  }
  return result;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMAbsoluteAltitudeData;
  [(CMLogItem *)&v2 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAbsoluteAltitudeData)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMAbsoluteAltitudeData;
  v5 = -[CMLogItem initWithCoder:](&v18, sel_initWithCoder_);
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"kCMAbsoluteAltitudeCodingKeyAltitude");
    double v7 = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v8, @"kCMAbsoluteAltitudeCodingKeyAccuracy");
    double v10 = v9;
    objc_msgSend_decodeDoubleForKey_(a3, v11, @"kCMAbsoluteAltitudeCodingKeyPrecision");
    double v13 = v12;
    uint64_t v15 = objc_msgSend_decodeIntegerForKey_(a3, v14, @"kCMAbsoluteAltitudeCodingKeyStatusInfo");
    objc_msgSend_setAltitudeData_accuracy_precision_status_(v5, v16, v15, v7, v10, v13);
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)CMAbsoluteAltitudeData;
  -[CMLogItem encodeWithCoder:](&v12, sel_encodeWithCoder_);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"kCMAbsoluteAltitudeCodingKeyAltitude", self->_altitudePrivate);
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMAbsoluteAltitudeCodingKeyAccuracy", self->_absoluteAltitudeAccuracy);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMAbsoluteAltitudeCodingKeyPrecision", self->_absoluteAltitudePrecision);
  objc_msgSend_encodeInteger_forKey_(a3, v8, self->_absoluteAltitudeStatusInfo, @"kCMAbsoluteAltitudeCodingKeyStatusInfo");
  objc_msgSend_encodeDouble_forKey_(a3, v9, @"altitude", self->_altitude);
  objc_msgSend_encodeDouble_forKey_(a3, v10, @"accuracy", self->_accuracy);
  objc_msgSend_encodeDouble_forKey_(a3, v11, @"precision", self->_precision);
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMAbsoluteAltitudeData;
  id v4 = [(CMLogItem *)&v8 copyWithZone:a3];
  double v6 = v4;
  if (v4) {
    objc_msgSend_setAltitudeData_accuracy_precision_status_(v4, v5, self->_absoluteAltitudeStatusInfo, self->_altitudePrivate, self->_absoluteAltitudeAccuracy, self->_absoluteAltitudePrecision);
  }
  return v6;
}

- (id)description
{
  double altitudePrivate = self->_altitudePrivate;
  v3 = NSString;
  double absoluteAltitudeAccuracy = self->_absoluteAltitudeAccuracy;
  double absoluteAltitudePrecision = self->_absoluteAltitudePrecision;
  int64_t absoluteAltitudeStatusInfo = self->_absoluteAltitudeStatusInfo;
  v10.receiver = self;
  v10.super_class = (Class)CMAbsoluteAltitudeData;
  [(CMLogItem *)&v10 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v7, @"AbsoluteAltitude: %f, Accuracy: %f, Precision %f, statusInfo: %ld, timestamp :%f", *(void *)&altitudePrivate, *(void *)&absoluteAltitudeAccuracy, *(void *)&absoluteAltitudePrecision, absoluteAltitudeStatusInfo, v8);
}

- (NSNumber)absoluteAltitude
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, self->_altitudePrivate);
}

- (void)setAltitudeData:(double)a3 accuracy:(double)a4 precision:(double)a5 status:(int64_t)a6
{
  self->_double altitudePrivate = a3;
  self->_double absoluteAltitudeAccuracy = a4;
  self->_double absoluteAltitudePrecision = a5;
  self->_int64_t absoluteAltitudeStatusInfo = a6;
  self->_altitude = a3;
  self->_accuracy = a4;
  self->_precision = a5;
}

- (double)altitude
{
  return self->_altitude;
}

- (double)accuracy
{
  return self->_accuracy;
}

- (double)precision
{
  return self->_precision;
}

- (double)absoluteAltitudeAccuracy
{
  return self->_absoluteAltitudeAccuracy;
}

- (double)absoluteAltitudePrecision
{
  return self->_absoluteAltitudePrecision;
}

- (int64_t)absoluteAltitudeStatusInfo
{
  return self->_absoluteAltitudeStatusInfo;
}

@end