@interface CLSensorRecorderSensorMetaRequestById
+ (BOOL)supportsSecureCoding;
- (CLSensorRecorderSensorMetaRequestById)initWithCoder:(id)a3;
- (int)dataType;
- (unint64_t)identifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
- (void)setIdentifier:(unint64_t)a3;
@end

@implementation CLSensorRecorderSensorMetaRequestById

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorMetaRequestById)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLSensorRecorderSensorMetaRequestById;
  v5 = [(CLSensorRecorderSensorMetaRequestById *)&v8 init];
  if (v5)
  {
    v5->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, @"identifier");
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v6, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, @"identifier");
  uint64_t dataType = self->_dataType;

  objc_msgSend_encodeInt32_forKey_(a3, v5, dataType, @"dataType");
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
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