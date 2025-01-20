@interface AVMetricErrorEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricErrorEvent)initWithCoder:(id)a3;
- (AVMetricErrorEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 didRecover:(BOOL)a6 error:(id)a7;
- (BOOL)didRecover;
- (NSError)error;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricErrorEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricErrorEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricErrorEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricErrorEvent:%p %@, didRecover:%d error:%@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_didRecover, self->_error];
}

- (AVMetricErrorEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 didRecover:(BOOL)a6 error:(id)a7
{
  v13.receiver = self;
  v13.super_class = (Class)AVMetricErrorEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12 = *a4;
  v9 = [(AVMetricEvent *)&v13 initWithDate:a3 mediaTime:&v12 sessionID:a5];
  v10 = v9;
  if (v9)
  {
    v9->_didRecover = a6;
    v9->_error = (NSError *)a7;
  }
  return v10;
}

- (BOOL)didRecover
{
  return self->_didRecover;
}

- (NSError)error
{
  return self->_error;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricErrorEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeBool:self->_didRecover forKey:@"didRecover"];
  [a3 encodeObject:self->_error forKey:@"error"];
}

- (AVMetricErrorEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricErrorEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_didRecover = [a3 decodeBoolForKey:@"didRecover"];
    v4->_error = (NSError *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"error"];
  }
  return v4;
}

@end