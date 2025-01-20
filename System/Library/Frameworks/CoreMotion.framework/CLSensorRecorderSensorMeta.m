@interface CLSensorRecorderSensorMeta
+ (BOOL)supportsSecureCoding;
- (BOOL)movement;
- (CLSensorRecorderSensorMeta)initWithCoder:(id)a3;
- (CLSensorRecorderSensorMeta)initWithDataType:(int)a3;
- (double)startTime;
- (id)description;
- (int)dataType;
- (unint64_t)dataIdentifier;
- (unint64_t)identifier;
- (unint64_t)timestamp;
- (unsigned)dataSize;
- (unsigned)offset;
- (void)encodeWithCoder:(id)a3;
- (void)setDataIdentifier:(unint64_t)a3;
- (void)setDataSize:(unsigned int)a3;
- (void)setDataType:(int)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setMovement:(BOOL)a3;
- (void)setOffset:(unsigned int)a3;
- (void)setStartTime:(double)a3;
- (void)setTimestamp:(unint64_t)a3;
@end

@implementation CLSensorRecorderSensorMeta

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorMeta)initWithDataType:(int)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CLSensorRecorderSensorMeta;
  result = [(CLSensorRecorderSensorMeta *)&v5 init];
  if (result) {
    result->_dataType = a3;
  }
  return result;
}

- (CLSensorRecorderSensorMeta)initWithCoder:(id)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CLSensorRecorderSensorMeta;
  objc_super v5 = [(CLSensorRecorderSensorMeta *)&v15 init];
  if (v5)
  {
    v5->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, @"identifier");
    objc_msgSend_decodeDoubleForKey_(a3, v6, @"startTime");
    v5->_startTime = v7;
    v5->_timestamp = objc_msgSend_decodeInt64ForKey_(a3, v8, @"timestamp");
    v5->_dataIdentifier = objc_msgSend_decodeInt64ForKey_(a3, v9, @"dataIdentifier");
    v5->_offset = objc_msgSend_decodeInt32ForKey_(a3, v10, @"offset");
    v5->_dataSize = objc_msgSend_decodeInt32ForKey_(a3, v11, @"dataSize");
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v12, @"dataType");
    v5->_movement = objc_msgSend_decodeBoolForKey_(a3, v13, @"movement");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, @"identifier");
  objc_msgSend_encodeDouble_forKey_(a3, v5, @"startTime", self->_startTime);
  objc_msgSend_encodeInt64_forKey_(a3, v6, self->_timestamp, @"timestamp");
  objc_msgSend_encodeInt64_forKey_(a3, v7, self->_dataIdentifier, @"dataIdentifier");
  objc_msgSend_encodeInt32_forKey_(a3, v8, self->_offset, @"offset");
  objc_msgSend_encodeInt32_forKey_(a3, v9, self->_dataSize, @"dataSize");
  objc_msgSend_encodeInt32_forKey_(a3, v10, self->_dataType, @"dataType");
  BOOL movement = self->_movement;

  objc_msgSend_encodeBool_forKey_(a3, v11, movement, @"movement");
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  objc_super v5 = NSStringFromClass(v4);
  return (id)objc_msgSend_stringWithFormat_(v3, v6, @"%@,<identifier, %llu, startTime, %f, timestamp, %llu, dataIdentifier, %llu, offset, %u, dataSize, %u, dataType, %d, movement, %d>", v5, self->_identifier, *(void *)&self->_startTime, self->_timestamp, self->_dataIdentifier, self->_offset, self->_dataSize, self->_dataType, self->_movement);
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (unint64_t)dataIdentifier
{
  return self->_dataIdentifier;
}

- (void)setDataIdentifier:(unint64_t)a3
{
  self->_dataIdentifier = a3;
}

- (unsigned)offset
{
  return self->_offset;
}

- (void)setOffset:(unsigned int)a3
{
  self->_offset = a3;
}

- (unsigned)dataSize
{
  return self->_dataSize;
}

- (void)setDataSize:(unsigned int)a3
{
  self->_dataSize = a3;
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

- (BOOL)movement
{
  return self->_movement;
}

- (void)setMovement:(BOOL)a3
{
  self->_BOOL movement = a3;
}

@end