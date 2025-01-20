@interface CMRecordedRotationRateData
+ (BOOL)supportsSecureCoding;
- ($1AB5FA073B851C12C2339EC22442E995)rotationRate;
- (CMRecordedRotationRateData)initWithCoder:(id)a3;
- (CMRecordedRotationRateData)initWithData:(CMGyro200 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5;
- (NSDate)startDate;
- (double)timestamp;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMRecordedRotationRateData

- (CMRecordedRotationRateData)initWithData:(CMGyro200 *)a3 timestamp:(unint64_t)a4 walltime:(double)a5
{
  v10.receiver = self;
  v10.super_class = (Class)CMRecordedRotationRateData;
  result = [(CMRecordedRotationRateData *)&v10 init];
  if (result)
  {
    *(float64x2_t *)&result->_rotationRate.x = vcvtq_f64_f32(vmul_f32(*(float32x2_t *)&a3->var0, (float32x2_t)vdup_n_s32(0x3C8EFA35u)));
    result->_rotationRate.z = (float)(a3->var2 * 0.017453);
    unint64_t var4 = a3->var4;
    result->_startDateValue = a5 - (double)(uint64_t)(a4 - var4) / 1000000.0;
    result->_timestampValue = (double)var4 / 1000000.0;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMRecordedRotationRateData)initWithCoder:(id)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CMRecordedRotationRateData;
  v5 = [(CMRecordedRotationRateData *)&v16 init];
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
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v4 = self;
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"timestamp", self->_timestampValue);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"startDate", v4->_startDateValue);
  v4 = (CMRecordedRotationRateData *)((char *)v4 + 32);
  double v6 = *(double *)&v4->super.super.super.isa;
  *(float *)&double v6 = *(double *)&v4->super.super.super.isa;
  objc_msgSend_encodeFloat_forKey_(a3, v7, @"rotation_x", v6);
  double v8 = *(double *)&v4->super.super._internalLogItem;
  *(float *)&double v8 = v8;
  objc_msgSend_encodeFloat_forKey_(a3, v9, @"rotation_y", v8);
  double v11 = *(double *)&v4->super._internal;
  *(float *)&double v11 = v11;

  objc_msgSend_encodeFloat_forKey_(a3, v10, @"rotation_z", v11);
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)CMRecordedRotationRateData;
  [(CMRotationRateData *)&v2 dealloc];
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
  return (id)objc_msgSend_stringWithFormat_(NSString, a2, @"%f %f, (%f, %f, %f)", *(void *)&self->_timestampValue, *(void *)&self->_startDateValue, *(void *)&self->_rotationRate.x, *(void *)&self->_rotationRate.y, *(void *)&self->_rotationRate.z);
}

@end