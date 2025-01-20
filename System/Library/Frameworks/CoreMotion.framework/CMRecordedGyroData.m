@interface CMRecordedGyroData
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- (CMRecordedGyroData)initWithCoder:(id)a3;
- (CMRecordedGyroData)initWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
- (NSDate)startDate;
- (double)startTime;
- (double)timestamp;
- (float)temperature;
- (id)description;
- (unint64_t)identifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
@end

@implementation CMRecordedGyroData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedGyroData)initWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CMRecordedGyroData;
  v10 = [(CMRecordedGyroData *)&v14 init];
  v12 = v10;
  if (v10) {
    objc_msgSend_resetWithData_timestamp_walltime_identifier_(v10, v11, (uint64_t)a3, a4, a6, a5);
  }
  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedGyroData)initWithCoder:(id)a3
{
  v18.receiver = self;
  v18.super_class = (Class)CMRecordedGyroData;
  v5 = [(CMRecordedGyroData *)&v18 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"timestamp");
    v5->_timestampValue = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"startDate");
    v5->_startDateValue = v8;
    objc_msgSend_decodeFloatForKey_(a3, v9, @"rotation_x");
    v5->_rotationRate.x = v10;
    objc_msgSend_decodeFloatForKey_(a3, v11, @"rotation_y");
    v5->_rotationRate.y = v12;
    objc_msgSend_decodeFloatForKey_(a3, v13, @"rotation_z");
    v5->_rotationRate.z = v14;
    objc_msgSend_decodeFloatForKey_(a3, v15, @"temperature");
    v5->_temperatureValue = v16;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"timestamp", self->_timestampValue);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"startDate", self->_startDateValue);
  double x = self->_rotationRate.x;
  *(float *)&double x = x;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"rotation_x", x);
  double y = self->_rotationRate.y;
  *(float *)&double y = y;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"rotation_y", y);
  double z = self->_rotationRate.z;
  *(float *)&double z = z;
  objc_msgSend_encodeFloat_forKey_(a3, v11, @"rotation_z", z);
  *(float *)&double v13 = self->_temperatureValue;

  objc_msgSend_encodeFloat_forKey_(a3, v12, @"temperature", v13);
}

- (void)resetWithData:(CMGyro50 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  *(float64x2_t *)&self->_rotationRate.double x = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  float var3 = a3->var3;
  self->_rotationRate.double z = a3->var2;
  self->_temperatureValue = var3;
  unint64_t var4 = a3->var4;
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - var4) / 1000000.0;
  self->_timestampValue = (double)var4 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMRecordedGyroData;
  [(CMGyroData *)&v2 dealloc];
}

- ($1AB5FA073B851C12C2339EC22442E995)rotationRate
{
  double x = self->_rotationRate.x;
  double y = self->_rotationRate.y;
  double z = self->_rotationRate.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
}

- (float)temperature
{
  return self->_temperatureValue;
}

- (double)timestamp
{
  return self->_timestampValue;
}

- (NSDate)startDate
{
  return (NSDate *)objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], a2, v2, self->_startDateValue);
}

- (id)description
{
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%llu, %f, %f, (%f, %f, %f), %f", self->_identifier, *(void *)&self->_timestampValue, *(void *)&self->_startDateValue, *(void *)&self->_rotationRate.x, *(void *)&self->_rotationRate.y, *(void *)&self->_rotationRate.z, self->_temperatureValue);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

@end