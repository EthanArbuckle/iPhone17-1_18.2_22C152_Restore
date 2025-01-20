@interface AVMetricPlayerItemInitialLikelyToKeepUpEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8 playlistRequestEvents:(id)a9 mediaSegmentRequestEvents:(id)a10 contentKeyRequestEvents:(id)a11;
- (NSArray)contentKeyRequestEvents;
- (NSArray)mediaSegmentRequestEvents;
- (NSArray)playlistRequestEvents;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemInitialLikelyToKeepUpEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  [(AVMetricPlayerItemLikelyToKeepUpEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemInitialLikelyToKeepUpEvent:%p %@ playlistRequestEvents:%@ mediaSegmentRequestEvents:%@ contentKeyRequestEvents:%@>", self, -[AVMetricPlayerItemLikelyToKeepUpEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_playlistRequestEvents, self->_mediaSegmentRequestEvents, self->_contentKeyRequestEvents];
}

- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8 playlistRequestEvents:(id)a9 mediaSegmentRequestEvents:(id)a10 contentKeyRequestEvents:(id)a11
{
  v15.receiver = self;
  v15.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  v12 = [(AVMetricPlayerItemLikelyToKeepUpEvent *)&v15 initWithDate:a3 mediaTime:&v14 sessionID:a5 variant:a6 timeTaken:a8 loadedTimeRanges:a7];
  if (v12)
  {
    v12->_playlistRequestEvents = (NSArray *)a9;
    v12->_mediaSegmentRequestEvents = (NSArray *)a10;
    v12->_contentKeyRequestEvents = (NSArray *)a11;
  }
  return v12;
}

- (NSArray)playlistRequestEvents
{
  return self->_playlistRequestEvents;
}

- (NSArray)mediaSegmentRequestEvents
{
  return self->_mediaSegmentRequestEvents;
}

- (NSArray)contentKeyRequestEvents
{
  return self->_contentKeyRequestEvents;
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
  v12.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  [(AVMetricPlayerItemLikelyToKeepUpEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_playlistRequestEvents forKey:@"playlistRequestEvents"];
  [a3 encodeObject:self->_mediaSegmentRequestEvents forKey:@"mediaSegmentRequestEvents"];
  [a3 encodeObject:self->_contentKeyRequestEvents forKey:@"contentKeyRequestEvents"];
}

- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithCoder:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  v4 = -[AVMetricPlayerItemLikelyToKeepUpEvent initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v6 = objc_opt_class();
    v4->_playlistRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), @"playlistRequestEvents");
    uint64_t v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    v4->_mediaSegmentRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), @"mediaSegmentRequestEvents");
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v10 = objc_opt_class();
    v4->_contentKeyRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), @"contentKeyRequestEvents");
  }
  return v4;
}

@end