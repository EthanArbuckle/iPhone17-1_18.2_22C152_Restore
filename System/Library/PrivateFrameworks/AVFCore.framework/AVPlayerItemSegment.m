@interface AVPlayerItemSegment
- ($4C6D1E162277694FB76656457146213A)timeMapping;
- (AVPlayerInterstitialEvent)interstitialEvent;
- (NSArray)loadedTimeRanges;
- (NSDate)startDate;
- (OpaqueFigPlaybackItemSegment)_figSegment;
- (id)_initWithFigSegment:(OpaqueFigPlaybackItemSegment *)a3;
- (id)debugDescription;
- (id)description;
- (int64_t)segmentType;
- (void)dealloc;
@end

@implementation AVPlayerItemSegment

- (id)_initWithFigSegment:(OpaqueFigPlaybackItemSegment *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerItemSegment;
  v4 = [(AVPlayerItemSegment *)&v7 init];
  if (v4)
  {
    if (a3) {
      v5 = (OpaqueFigPlaybackItemSegment *)CFRetain(a3);
    }
    else {
      v5 = 0;
    }
    v4->_figSegment = v5;
  }
  return v4;
}

- (void)dealloc
{
  figSegment = self->_figSegment;
  if (figSegment) {
    CFRelease(figSegment);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerItemSegment;
  [(AVPlayerItemSegment *)&v4 dealloc];
}

- (id)debugDescription
{
  v2 = (__CFString *)CFCopyDescription(self->_figSegment);
  return v2;
}

- (id)description
{
  v2 = (__CFString *)CFCopyDescription(self->_figSegment);
  return v2;
}

- (int64_t)segmentType
{
  return FigPlaybackItemSegmentGetType();
}

- ($4C6D1E162277694FB76656457146213A)timeMapping
{
  return ($4C6D1E162277694FB76656457146213A *)MEMORY[0x1F40ED910](self->_figSegment, a3);
}

- (NSArray)loadedTimeRanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  LoadedTimeRanges = (void *)FigPlaybackItemSegmentGetLoadedTimeRanges();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [LoadedTimeRanges countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(LoadedTimeRanges);
        }
        CFDictionaryRef v8 = *(const __CFDictionary **)(*((void *)&v12 + 1) + 8 * v7);
        memset(&v11, 0, sizeof(v11));
        CMTimeRangeMakeFromDictionary(&v11, v8);
        CMTimeRange v10 = v11;
        -[NSArray addObject:](v2, "addObject:", [MEMORY[0x1E4F29238] valueWithCMTimeRange:&v10]);
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [LoadedTimeRanges countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  return v2;
}

- (NSDate)startDate
{
  v2 = (void *)[(id)FigPlaybackItemSegmentGetStartDate() copy];
  return (NSDate *)v2;
}

- (AVPlayerInterstitialEvent)interstitialEvent
{
  id v2 = (id)FigPlaybackItemSegmentGetInterstitialEvent();
  return (AVPlayerInterstitialEvent *)v2;
}

- (OpaqueFigPlaybackItemSegment)_figSegment
{
  return self->_figSegment;
}

@end