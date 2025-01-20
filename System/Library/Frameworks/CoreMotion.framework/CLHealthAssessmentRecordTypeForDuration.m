@interface CLHealthAssessmentRecordTypeForDuration
+ (BOOL)supportsSecureCoding;
- (CLHealthAssessmentRecordTypeForDuration)initWithCoder:(id)a3;
- (double)duration;
- (int)dataType;
- (void)encodeWithCoder:(id)a3;
- (void)setDataType:(int)a3;
- (void)setDuration:(double)a3;
@end

@implementation CLHealthAssessmentRecordTypeForDuration

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CLHealthAssessmentRecordTypeForDuration)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CLHealthAssessmentRecordTypeForDuration;
  v5 = [(CLHealthAssessmentRecordTypeForDuration *)&v8 init];
  if (v5)
  {
    v5->_duration = (double)objc_msgSend_decodeInt64ForKey_(a3, v4, @"duration");
    v5->_dataType = objc_msgSend_decodeInt32ForKey_(a3, v6, @"dataType");
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend_encodeInt64_forKey_(a3, a2, (uint64_t)self->_duration, @"duration");
  uint64_t dataType = self->_dataType;

  objc_msgSend_encodeInt32_forKey_(a3, v5, dataType, @"dataType");
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
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