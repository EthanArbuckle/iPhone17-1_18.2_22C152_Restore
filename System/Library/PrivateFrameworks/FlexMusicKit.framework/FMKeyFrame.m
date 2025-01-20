@interface FMKeyFrame
- (FMKeyFrame)initWithValue:(float)a3 atTime:(int64_t)a4;
- (float)value;
- (id)description;
- (int64_t)sampleTime;
- (void)setSampleTime:(int64_t)a3;
- (void)setValue:(float)a3;
@end

@implementation FMKeyFrame

- (FMKeyFrame)initWithValue:(float)a3 atTime:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FMKeyFrame;
  result = [(FMKeyFrame *)&v7 init];
  if (result)
  {
    result->_value = a3;
    result->_sampleTime = a4;
  }
  return result;
}

- (id)description
{
  v6 = NSString;
  uint64_t v7 = objc_msgSend_sampleTime(self, a2, v2, v3, v4);
  objc_msgSend_value(self, v8, v9, v10, v11);
  return (id)objc_msgSend_stringWithFormat_(v6, v13, @"t = %d value = %f", v14, v15, v7, v12);
}

- (int64_t)sampleTime
{
  return self->_sampleTime;
}

- (void)setSampleTime:(int64_t)a3
{
  self->_sampleTime = a3;
}

- (float)value
{
  return self->_value;
}

- (void)setValue:(float)a3
{
  self->_value = a3;
}

@end