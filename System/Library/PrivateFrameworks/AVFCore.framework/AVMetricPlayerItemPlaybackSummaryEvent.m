@interface AVMetricPlayerItemPlaybackSummaryEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricErrorEvent)errorEvent;
- (AVMetricPlayerItemPlaybackSummaryEvent)initWithCoder:(id)a3;
- (AVMetricPlayerItemPlaybackSummaryEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 errorEvent:(id)a6 recoverableErrorCount:(int64_t)a7 stallCount:(int64_t)a8 variantSwitchCount:(int64_t)a9 playbackDuration:(int64_t)a10 mediaResourceRequestCount:(int64_t)a11 timeSpentRecoveringFromStall:(double)a12 timeSpentInInitialStartup:(double)a13 timeWeightedAverageBitrate:(int64_t)a14 timeWeightedPeakBitrate:(int64_t)a15;
- (double)timeSpentInInitialStartup;
- (double)timeSpentRecoveringFromStall;
- (id)debugDescription;
- (int64_t)mediaResourceRequestCount;
- (int64_t)playbackDuration;
- (int64_t)recoverableErrorCount;
- (int64_t)stallCount;
- (int64_t)timeWeightedAverageBitrate;
- (int64_t)timeWeightedPeakBitrate;
- (int64_t)variantSwitchCount;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricPlayerItemPlaybackSummaryEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<AVMetricPlayerItemPlaybackSummaryEvent:%p %@ recoverableErrorCount:%ld error:%@ stallCount:%ld variantSwitchCount:%ld playbackDuration:%ld mediaResourceRequestCount:%ld timeSpentRecoveringFromStall:%f timeSpentInInitialStartup:%f timeWeightedAverageBitrate:%ld timeWeightedPeakBitrate:%ld>", self, -[AVMetricEvent debugDescriptionForAttr](self, "debugDescriptionForAttr"), self->_recoverableErrorCount, -[AVMetricErrorEvent debugDescription](self->_errorEvent, "debugDescription"), self->_stallCount, self->_variantSwitchCount, self->_playbackDuration, self->_mediaResourceRequestCount, *(void *)&self->_timeSpentRecoveringFromStall, *(void *)&self->_timeSpentInInitialStartup, self->_timeWeightedAverageBitrate, self->_timeWeightedPeakBitrate];
}

- (AVMetricPlayerItemPlaybackSummaryEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 errorEvent:(id)a6 recoverableErrorCount:(int64_t)a7 stallCount:(int64_t)a8 variantSwitchCount:(int64_t)a9 playbackDuration:(int64_t)a10 mediaResourceRequestCount:(int64_t)a11 timeSpentRecoveringFromStall:(double)a12 timeSpentInInitialStartup:(double)a13 timeWeightedAverageBitrate:(int64_t)a14 timeWeightedPeakBitrate:(int64_t)a15
{
  v23.receiver = self;
  v23.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22 = *a4;
  v20 = [(AVMetricEvent *)&v23 initWithDate:a3 mediaTime:&v22 sessionID:a5];
  if (v20)
  {
    v20->_errorEvent = (AVMetricErrorEvent *)a6;
    v20->_recoverableErrorCount = a7;
    v20->_stallCount = a8;
    v20->_variantSwitchCount = a9;
    v20->_playbackDuration = a10;
    v20->_mediaResourceRequestCount = a11;
    v20->_timeSpentRecoveringFromStall = a12;
    v20->_timeSpentInInitialStartup = a13;
    v20->_timeWeightedAverageBitrate = a14;
    v20->_timeWeightedPeakBitrate = a15;
  }
  return v20;
}

- (AVMetricErrorEvent)errorEvent
{
  return self->_errorEvent;
}

- (int64_t)recoverableErrorCount
{
  return self->_recoverableErrorCount;
}

- (int64_t)stallCount
{
  return self->_stallCount;
}

- (int64_t)variantSwitchCount
{
  return self->_variantSwitchCount;
}

- (int64_t)playbackDuration
{
  return self->_playbackDuration;
}

- (int64_t)mediaResourceRequestCount
{
  return self->_mediaResourceRequestCount;
}

- (double)timeSpentRecoveringFromStall
{
  return self->_timeSpentRecoveringFromStall;
}

- (double)timeSpentInInitialStartup
{
  return self->_timeSpentInInitialStartup;
}

- (int64_t)timeWeightedAverageBitrate
{
  return self->_timeWeightedAverageBitrate;
}

- (int64_t)timeWeightedPeakBitrate
{
  return self->_timeWeightedPeakBitrate;
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
  v12.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_errorEvent forKey:@"errorEvent"];
  [a3 encodeInteger:self->_recoverableErrorCount forKey:@"recoverableErrorCount"];
  [a3 encodeInteger:self->_stallCount forKey:@"stallCount"];
  [a3 encodeInteger:self->_variantSwitchCount forKey:@"variantSwitchCount"];
  [a3 encodeInteger:self->_playbackDuration forKey:@"playbackDuration"];
  [a3 encodeInteger:self->_mediaResourceRequestCount forKey:@"mediaResourceRequestCount"];
  [a3 encodeDouble:@"timeSpentRecoveringFromStall" forKey:self->_timeSpentRecoveringFromStall];
  [a3 encodeDouble:@"timeSpentInInitialStartup" forKey:self->_timeSpentInInitialStartup];
  [a3 encodeInteger:self->_timeWeightedAverageBitrate forKey:@"timeWeightedAverageBitrate"];
  [a3 encodeInteger:self->_timeWeightedPeakBitrate forKey:@"timeWeightedPeakBitrate"];
}

- (AVMetricPlayerItemPlaybackSummaryEvent)initWithCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_errorEvent = (AVMetricErrorEvent *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"errorEvent"];
    v4->_recoverableErrorCount = [a3 decodeIntegerForKey:@"recoverableErrorCount"];
    v4->_stallCount = [a3 decodeIntegerForKey:@"stallCount"];
    v4->_variantSwitchCount = [a3 decodeIntegerForKey:@"variantSwitchCount"];
    v4->_playbackDuration = [a3 decodeIntegerForKey:@"playbackDuration"];
    v4->_mediaResourceRequestCount = [a3 decodeIntegerForKey:@"mediaResourceRequestCount"];
    [a3 decodeDoubleForKey:@"timeSpentRecoveringFromStall"];
    v4->_timeSpentRecoveringFromStall = v5;
    [a3 decodeDoubleForKey:@"timeSpentInInitialStartup"];
    v4->_timeSpentInInitialStartup = v6;
    v4->_timeWeightedAverageBitrate = [a3 decodeIntegerForKey:@"timeWeightedAverageBitrate"];
    v4->_timeWeightedPeakBitrate = [a3 decodeIntegerForKey:@"timeWeightedPeakBitrate"];
  }
  return v4;
}

@end