@interface CLSensorRecorderSensorSampleRate
+ (BOOL)supportsSecureCoding;
- (CLSensorRecorderSensorSampleRate)initWithCoder:(id)a3;
- (int)dataType;
- (unsigned)rate;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
- (void)setRate:(unsigned int)a3;
@end

@implementation CLSensorRecorderSensorSampleRate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorSampleRate)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSensorRecorderSensorSampleRate;
  v5 = [(CLSensorRecorderSensorSampleRate *)&v8 init];
  if (v5)
  {
    v5->_rate = objc_msgSend_decodeInt32ForKey_(a3, v4, @"rate");
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v6, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt32_forKey_(a3, a2, self->_rate, @"rate");
  uint64_t dataType = self->_dataType;

  objc_msgSend_encodeInt32_forKey_(a3, v5, dataType, @"dataType");
}

- (unsigned)rate
{
  return self->_rate;
}

- (void)setRate:(unsigned int)a3
{
  self->_rate = a3;
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_uint64_t dataType = a3;
}

@end