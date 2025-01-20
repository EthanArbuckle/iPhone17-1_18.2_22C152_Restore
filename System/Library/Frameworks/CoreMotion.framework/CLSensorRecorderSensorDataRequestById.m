@interface CLSensorRecorderSensorDataRequestById
+ (BOOL)supportsSecureCoding;
- (CLSensorRecorderSensorDataRequestById)initWithCoder:(id)a3;
- (int)dataType;
- (unint64_t)identifier;
- (unint64_t)metaIdentifier;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setMetaIdentifier:(unint64_t)a3;
@end

@implementation CLSensorRecorderSensorDataRequestById

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorDataRequestById)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLSensorRecorderSensorDataRequestById;
  v5 = [(CLSensorRecorderSensorDataRequestById *)&v9 init];
  if (v5)
  {
    v5->_identifier = objc_msgSend_decodeInt64ForKey_(a3, v4, @"identifier");
    v5->_metaIdentifier = objc_msgSend_decodeInt64ForKey_(a3, v6, @"metaIdentifier");
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v7, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt64_forKey_(a3, a2, self->_identifier, @"identifier");
  objc_msgSend_encodeInt64_forKey_(a3, v5, self->_metaIdentifier, @"metaIdentifier");
  uint64_t dataType = self->_dataType;

  objc_msgSend_encodeInt32_forKey_(a3, v6, dataType, @"dataType");
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_identifier = a3;
}

- (unint64_t)metaIdentifier
{
  return self->_metaIdentifier;
}

- (void)setMetaIdentifier:(unint64_t)a3
{
  self->_metaIdentifier = a3;
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