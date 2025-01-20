@interface CLSensorRecorderSensorMetaRequestByDateRange
+ (BOOL)supportsSecureCoding;
- (CLSensorRecorderSensorMetaRequestByDateRange)initWithCoder:(id)a3;
- (double)endTime;
- (double)startTime;
- (int)dataType;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
- (void)setEndTime:(double)a3;
- (void)setStartTime:(double)a3;
@end

@implementation CLSensorRecorderSensorMetaRequestByDateRange

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorMetaRequestByDateRange)initWithCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CLSensorRecorderSensorMetaRequestByDateRange;
  v5 = [(CLSensorRecorderSensorMetaRequestByDateRange *)&v11 init];
  if (v5)
  {
    objc_msgSend_decodeDoubleForKey_(a3, v4, @"startTime");
    v5->_startTime = v6;
    objc_msgSend_decodeDoubleForKey_(a3, v7, @"endTime");
    v5->_endTime = v8;
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v9, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeDouble_forKey_(a3, a2, @"startTime", self->_startTime);
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"endTime", self->_endTime);
  uint64_t dataType = self->_dataType;

  objc_msgSend_encodeInt32_forKey_(a3, v6, dataType, @"dataType");
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (double)endTime
{
  return self->_endTime;
}

- (void)setEndTime:(double)a3
{
  self->_endTime = a3;
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