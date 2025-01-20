@interface CMAltitudeData
+ (BOOL)supportsSecureCoding;
- (CMAltitudeData)initWithAltitude:(float)a3 andTimestamp:(double)a4 atBaseAltitude:(float)a5;
- (CMAltitudeData)initWithCoder:(id)a3;
- (CMAltitudeData)initWithTimestamp:(double)a3 pressure:(float)a4 relativeAltitude:(float)a5;
- (NSNumber)pressure;
- (NSNumber)relativeAltitude;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMAltitudeData

- (CMAltitudeData)initWithAltitude:(float)a3 andTimestamp:(double)a4 atBaseAltitude:(float)a5
{
  v15.receiver = self;
  v15.super_class = (Class)CMAltitudeData;
  v7 = [(CMLogItem *)&v15 initWithTimestamp:a4];
  if (v7)
  {
    float v8 = (float)(1.0 - powf(a3 / 101320.0, 0.19026)) * 44331.0;
    v9 = [CMAltitudeDataInternal alloc];
    *(float *)&double v10 = v8 - a5;
    *(float *)&double v11 = a3;
    v7->_internal = (id)objc_msgSend_initWithAltitude_andPressure_(v9, v12, v13, v10, v11);
  }
  return v7;
}

- (CMAltitudeData)initWithTimestamp:(double)a3 pressure:(float)a4 relativeAltitude:(float)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CMAltitudeData;
  v7 = [(CMLogItem *)&v14 initWithTimestamp:a3];
  if (v7)
  {
    float v8 = [CMAltitudeDataInternal alloc];
    *(float *)&double v9 = a5;
    *(float *)&double v10 = a4;
    v7->_internal = (id)objc_msgSend_initWithAltitude_andPressure_(v8, v11, v12, v9, v10);
  }
  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMAltitudeData)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CMAltitudeData;
  v4 = -[CMLogItem initWithCoder:](&v15, sel_initWithCoder_);
  if (v4)
  {
    v5 = [CMAltitudeDataInternal alloc];
    v4->_internal = v5;
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"kCMAltitudeCodingKeyAltitude");
    float v8 = v7;
    objc_msgSend_decodeDoubleForKey_(a3, v9, @"kCMAltitudeCodingKeyPressure");
    *(float *)&double v11 = v10;
    *(float *)&double v10 = v8;
    objc_msgSend_setAltitude_andPressure_(v5, v12, v13, v10, v11);
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMAltitudeData;
  -[CMLogItem encodeWithCoder:](&v8, sel_encodeWithCoder_);
  internal = (float *)self->_internal;
  objc_msgSend_encodeDouble_forKey_(a3, v6, @"kCMAltitudeCodingKeyAltitude", internal[2]);
  objc_msgSend_encodeDouble_forKey_(a3, v7, @"kCMAltitudeCodingKeyPressure", internal[3]);
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMAltitudeData;
  [(CMLogItem *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CMAltitudeData;
  v6 = -[CMLogItem copyWithZone:](&v8, sel_copyWithZone_);
  if (v6) {
    v6[2] = objc_msgSend_copyWithZone_(self->_internal, v5, (uint64_t)a3);
  }
  return v6;
}

- (id)description
{
  internal = (float *)self->_internal;
  objc_super v3 = NSString;
  double v4 = internal[2];
  double v5 = internal[3];
  v9.receiver = self;
  v9.super_class = (Class)CMAltitudeData;
  [(CMLogItem *)&v9 timestamp];
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"Altitude %f Pressure %f @ %f", *(void *)&v4, *(void *)&v5, v7);
}

- (NSNumber)relativeAltitude
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, *((float *)self->_internal + 2));
}

- (NSNumber)pressure
{
  return (NSNumber *)objc_msgSend_numberWithDouble_(NSNumber, a2, v2, (float)(*((float *)self->_internal + 3) / 1000.0));
}

@end