@interface ARWorldTrackingErrorData
+ (BOOL)supportsSecureCoding;
- (ARWorldTrackingErrorData)initWithCoder:(id)a3;
- (ARWorldTrackingErrorData)initWithTimestamp:(double)a3;
- (BOOL)isEqual:(id)a3;
- (double)timestamp;
- (int64_t)errorCode;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setErrorCode:(int64_t)a3;
@end

@implementation ARWorldTrackingErrorData

- (ARWorldTrackingErrorData)initWithTimestamp:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARWorldTrackingErrorData;
  result = [(ARWorldTrackingErrorData *)&v5 init];
  if (result) {
    result->_timestamp = a3;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  double timestamp = self->_timestamp;
  id v5 = a3;
  [v5 encodeDouble:@"timestamp" forKey:timestamp];
  [v5 encodeInteger:self->_errorCode forKey:@"errorCode"];
}

- (ARWorldTrackingErrorData)initWithCoder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARWorldTrackingErrorData;
  id v5 = [(ARWorldTrackingErrorData *)&v8 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"timestamp"];
    v5->_double timestamp = v6;
    v5->_errorCode = [v4 decodeIntegerForKey:@"errorCode"];
  }

  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)(self->_timestamp * 1000.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (double *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
    && vabdd_f64(self->_timestamp, v4[1]) < 2.22044605e-16
    && self->_errorCode == *((void *)v4 + 2);

  return v5;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  self->_errorCode = a3;
}

@end