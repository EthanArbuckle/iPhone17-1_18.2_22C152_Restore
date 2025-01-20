@interface AVMetricPlayerItemLikelyToKeepUpEvent
+ (BOOL)supportsSecureCoding;
- (AVAssetVariant)variant;
- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8;
- (NSArray)loadedTimeRanges;
- (double)timeTaken;
- (id)debugDescription;
- (id)debugDescriptionForAttr;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemLikelyToKeepUpEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescriptionForAttr
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  return (id)[NSString stringWithFormat:@"%@ variant:%@ timeTaken:%f loadedTimeRanges:%@>", -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_variant, *(void *)&self->_timeTaken, self->_loadedTimeRanges];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemLikelyToKeepUpEvent:%p %@>", self, -[AVMetricPlayerItemLikelyToKeepUpEvent debugDescriptionForAttr](self, "debugDescriptionForAttr")];
}

- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8
{
  v14.receiver = self;
  v14.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13 = *a4;
  v11 = [(AVMetricEvent *)&v14 initWithDate:a3 mediaTime:&v13 sessionID:a5];
  if (v11)
  {
    v11->_variant = (AVAssetVariant *)a6;
    v11->_timeTaken = a7;
    v11->_loadedTimeRanges = (NSArray *)a8;
  }
  return v11;
}

- (AVAssetVariant)variant
{
  return self->_variant;
}

- (double)timeTaken
{
  return self->_timeTaken;
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
  v12.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_variant forKey:@"variant"];
  [a3 encodeInteger:(uint64_t)self->_timeTaken forKey:@"timeTaken"];
  [a3 encodeObject:self->_loadedTimeRanges forKey:@"loadedTimeRanges"];
}

- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    v4->_variant = (AVAssetVariant *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"variant"];
    v4->_timeTaken = (double)[a3 decodeIntegerForKey:@"timeTaken"];
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v4->_loadedTimeRanges = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), @"loadedTimeRanges");
  }
  return v4;
}

@end