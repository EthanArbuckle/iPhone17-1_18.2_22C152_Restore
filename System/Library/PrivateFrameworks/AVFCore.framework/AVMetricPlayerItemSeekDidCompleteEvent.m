@interface AVMetricPlayerItemSeekDidCompleteEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricPlayerItemSeekDidCompleteEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemSeekDidCompleteEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 didSeekInBuffer:(BOOL)a7 rate:(double)a8 previousRate:(double)a9;
- (BOOL)didSeekInBuffer;
- (id)debugDescription;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemSeekDidCompleteEvent

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemSeekDidCompleteEvent:%p %@ didSeekInBuffer:%d>", self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_didSeekInBuffer];
}

- (AVMetricPlayerItemSeekDidCompleteEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 didSeekInBuffer:(BOOL)a7 rate:(double)a8 previousRate:(double)a9
{
  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = *a4;
  result = [(AVMetricPlayerItemRateChangeEvent *)&v12 initWithDate:a3 mediaTime:&v11 sessionID:a5 variant:a6 rate:a8 previousRate:a9];
  if (result) {
    result->_didSeekInBuffer = a7;
  }
  return result;
}

- (BOOL)didSeekInBuffer
{
  return self->_didSeekInBuffer;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    $3CC8671D27C23BF42ADDB32F2B5E48AE v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  [(AVMetricPlayerItemRateChangeEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeBool:self->_didSeekInBuffer forKey:@"didSeekInBuffer"];
}

- (AVMetricPlayerItemSeekDidCompleteEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  v4 = -[AVMetricPlayerItemRateChangeEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4) {
    v4->_didSeekInBuffer = [a3 decodeBoolForKey:@"didSeekInBuffer"];
  }
  return v4;
}

@end