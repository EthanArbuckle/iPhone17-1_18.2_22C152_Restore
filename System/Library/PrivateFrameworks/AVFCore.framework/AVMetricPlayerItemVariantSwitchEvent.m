@interface AVMetricPlayerItemVariantSwitchEvent
+ (BOOL)supportsSecureCoding;
- (AVAssetVariant)fromVariant;
- (AVAssetVariant)toVariant;
- (AVMetricPlayerItemVariantSwitchEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemVariantSwitchEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 fromVariant:(id)a6 toVariant:(id)a7 loadedTimeRanges:(id)a8 didSucceed:(BOOL)a9;
- (BOOL)didSucceed;
- (NSArray)loadedTimeRanges;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemVariantSwitchEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemVariantSwitchEvent:%p %@ fromVariant:%@ toVariant:%@ loadedTimeRanges:%@ didSucceed:%d>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_fromVariant, self->_toVariant, self->_loadedTimeRanges, self->_didSucceed];
}

- (AVMetricPlayerItemVariantSwitchEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 fromVariant:(id)a6 toVariant:(id)a7 loadedTimeRanges:(id)a8 didSucceed:(BOOL)a9
{
  v15.receiver = self;
  v15.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  v12 = [(AVMetricEvent *)&v15 initWithDate:a3 mediaTime:&v14 sessionID:a5];
  if (v12)
  {
    v12->_fromVariant = (AVAssetVariant *)a6;
    v12->_toVariant = (AVAssetVariant *)a7;
    v12->_loadedTimeRanges = (NSArray *)a8;
    v12->_didSucceed = a9;
  }
  return v12;
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

- (BOOL)didSucceed
{
  return self->_didSucceed;
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
  v12.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_fromVariant forKey:@"fromVariant"];
  [a3 encodeObject:self->_toVariant forKey:@"toVariant"];
  [a3 encodeBool:self->_didSucceed forKey:@"didSucceed"];
  [a3 encodeObject:self->_loadedTimeRanges forKey:@"loadedTimeRange"];
}

- (AVMetricPlayerItemVariantSwitchEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_fromVariant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"fromVariant"];
    v4->_toVariant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"toVariant"];
    v4->_didSucceed = [a3 decodeBoolForKey:@"didSucceed"];
    v4->_loadedTimeRanges = (NSArray *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"loadedTimeRange"];
  }
  return v4;
}

@end