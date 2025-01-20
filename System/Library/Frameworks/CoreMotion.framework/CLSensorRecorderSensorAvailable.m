@interface CLSensorRecorderSensorAvailable
+ (BOOL)supportsSecureCoding;
- (CLSensorRecorderSensorAvailable)initWithCoder:(id)a3;
- (int)dataType;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
@end

@implementation CLSensorRecorderSensorAvailable

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLSensorRecorderSensorAvailable)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CLSensorRecorderSensorAvailable;
  v5 = [(CLSensorRecorderSensorAvailable *)&v7 init];
  if (v5) {
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v4, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (int)dataType
{
  return self->_dataType;
}

- (void)setDataType:(int)a3
{
  self->_dataType = a3;
}

@end