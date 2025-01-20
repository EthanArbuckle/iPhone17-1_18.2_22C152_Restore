@interface AVMetricPlayerItemRateChangeEvent
+ (BOOL)supportsSecureCoding;
- (AVAssetVariant)variant;
- (AVMetricPlayerItemRateChangeEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemRateChangeEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 rate:(double)a7 previousRate:(double)a8;
- (double)previousRate;
- (double)rate;
- (id)debugDescription;
- (id)debugDescriptionForAttr;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemRateChangeEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescriptionForAttr
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  return (id)[NSString stringWithFormat:@"%@ rate:%f previousRate:%f variant:%@", -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), *(void *)&self->_rate, *(void *)&self->_previousRate, self->_variant];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemRateChangeEvent:%p %@>", self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](self, "debugDescriptionForAttr")];
}

- (AVMetricPlayerItemRateChangeEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 rate:(double)a7 previousRate:(double)a8
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  v11 = [(AVMetricEvent *)&v14 initWithDate:a3 mediaTime:&v13 sessionID:a5];
  if (v11)
  {
    v11->_variant = (AVAssetVariant *)a6;
    v11->_rate = a7;
    v11->_previousRate = a8;
  }
  return v11;
}

- (double)rate
{
  return self->_rate;
}

- (double)previousRate
{
  return self->_previousRate;
}

- (AVAssetVariant)variant
{
  return self->_variant;
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
  v12.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeDouble:@"rate" forKey:self->_rate];
  [a3 encodeDouble:@"previousRate" forKey:self->_previousRate];
  [a3 encodeObject:self->_variant forKey:@"variant"];
}

- (AVMetricPlayerItemRateChangeEvent)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    [a3 decodeDoubleForKey:@"rate"];
    v4->_rate = v5;
    [a3 decodeDoubleForKey:@"previousRate"];
    v4->_previousRate = v6;
    v4->_variant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"variant"];
  }
  return v4;
}

@end