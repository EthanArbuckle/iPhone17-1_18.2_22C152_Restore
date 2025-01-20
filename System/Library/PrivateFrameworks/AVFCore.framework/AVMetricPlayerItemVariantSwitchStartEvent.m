@interface AVMetricPlayerItemVariantSwitchStartEvent
+ (BOOL)supportsSecureCoding;
- (AVAssetVariant)fromVariant;
- (AVAssetVariant)toVariant;
- (AVMetricPlayerItemVariantSwitchStartEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemVariantSwitchStartEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 fromVariant:(id)a6 toVariant:(id)a7 loadedTimeRanges:(id)a8;
- (NSArray)loadedTimeRanges;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemVariantSwitchStartEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchStartEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchStartEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemVariantSwitchStartEvent:%p %@ fromVariant:%@ toVariant:%@ loadedTimeRanges:%@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_fromVariant, self->_toVariant, self->_loadedTimeRanges];
}

- (AVMetricPlayerItemVariantSwitchStartEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 fromVariant:(id)a6 toVariant:(id)a7 loadedTimeRanges:(id)a8
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetricPlayerItemVariantSwitchStartEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  v11 = [(AVMetricEvent *)&v14 initWithDate:a3 mediaTime:&v13 sessionID:a5];
  if (v11)
  {
    v11->_fromVariant = (AVAssetVariant *)a6;
    v11->_toVariant = (AVAssetVariant *)a7;
    v11->_loadedTimeRanges = (NSArray *)a8;
  }
  return v11;
}

- (AVAssetVariant)fromVariant
{
  return self->_fromVariant;
}

- (AVAssetVariant)toVariant
{
  return self->_toVariant;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)getLoadedTimeRangesFromTimeIntervals(self->_loadedTimeRanges);
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
  v12.super_class = (Class)AVMetricPlayerItemVariantSwitchStartEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_fromVariant forKey:@"fromVariant"];
  [a3 encodeObject:self->_toVariant forKey:@"toVariant"];
  [a3 encodeObject:self->_loadedTimeRanges forKey:@"loadedTimeRanges"];
}

- (AVMetricPlayerItemVariantSwitchStartEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricPlayerItemVariantSwitchStartEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_fromVariant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fromVariant"];
    v4->_toVariant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"toVariant"];
    v4->_loadedTimeRanges = (NSArray *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"loadedTimeRange"];
  }
  return v4;
}

@end