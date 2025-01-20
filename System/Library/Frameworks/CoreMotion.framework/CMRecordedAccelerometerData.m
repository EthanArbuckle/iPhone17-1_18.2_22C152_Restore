@interface CMRecordedAccelerometerData
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)acceleration;
- (CMRecordedAccelerometerData)initWithCoder:(id)a3;
- (CMRecordedAccelerometerData)initWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
- (NSDate)startDate;
- (double)startTime;
- (double)timestamp;
- (id)description;
- (uint64_t)identifier;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)resetWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6;
@end

@implementation CMRecordedAccelerometerData

- (double)startTime
{
  return self->_startDateValue;
}

- (CMRecordedAccelerometerData)initWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  v14.receiver = self;
  v14.super_class = (Class)CMRecordedAccelerometerData;
  v10 = [(CMRecordedAccelerometerData *)&v14 init];
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

- (CMRecordedAccelerometerData)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMRecordedAccelerometerData;
  v5 = [(CMRecordedAccelerometerData *)&v16 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"timestamp");
    v5->_timestampValue = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"startDate");
    v5->_startDateValue = v8;
    objc_msgSend_decodeFloatForKey_(a3, v9, @"accel_x");
    v5->_accelerationValue.x = v10;
    objc_msgSend_decodeFloatForKey_(a3, v11, @"accel_y");
    v5->_accelerationValue.y = v12;
    objc_msgSend_decodeFloatForKey_(a3, v13, @"accel_z");
    v5->_accelerationValue.z = v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = self;
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"timestamp", self->_timestampValue);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"startDate", v4->_startDateValue);
  v4 = (CMRecordedAccelerometerData *)((char *)v4 + 32);
  double v6 = *(double *)&v4->super.super.super.isa;
  *(float *)&double v6 = *(double *)&v4->super.super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"accel_x", v6);
  double v8 = *(double *)&v4->super.super._internalLogItem;
  *(float *)&double v8 = v8;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"accel_y", v8);
  double v11 = *(double *)&v4->super._internal;
  *(float *)&double v11 = v11;

  objc_msgSend_encodeFloat_forKey_(a3, v10, @"accel_z", v11);
}

- (void)resetWithData:(CMAccel100 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5 identifier:(unint64_t)a6
{
  *(float64x2_t *)&self->_accelerationValue.x = vcvtq_f64_f32(*(float32x2_t *)&a3->var0);
  self->_accelerationValue.z = a3->var2;
  unint64_t v6 = *(void *)(&a3->var2 + 1);
  self->_startDateValue = a5 - (double)(uint64_t)(a4 - v6) / 1000000.0;
  self->_timestampValue = (double)v6 / 1000000.0;
  self->_identifier = a6;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMRecordedAccelerometerData;
  [(CMAccelerometerData *)&v2 dealloc];
}

- ($1AB5FA073B851C12C2339EC22442E995)acceleration
{
  double x = self->_accelerationValue.x;
  double y = self->_accelerationValue.y;
  double z = self->_accelerationValue.z;
  result.var2 = z;
  result.var1 = y;
  result.var0 = x;
  return result;
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
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%llu, %f, %f, (%f, %f, %f)", self->_identifier, *(void *)&self->_timestampValue, *(void *)&self->_startDateValue, *(void *)&self->_accelerationValue.x, *(void *)&self->_accelerationValue.y, *(void *)&self->_accelerationValue.z);
}

- (uint64_t)identifier
{
  return self->_identifier;
}

@end