@interface AVInterstitialTimeRange
+ (AVInterstitialTimeRange)interstitialTimeRangeWithPlayerInterstitialEvent:(id)a3;
+ (BOOL)supportsSecureCoding;
- (AVInterstitialTimeRange)init;
- (AVInterstitialTimeRange)initWithCoder:(id)a3;
- (AVInterstitialTimeRange)initWithHiddenTimeRange:(id *)a3;
- (AVInterstitialTimeRange)initWithTimeRange:(CMTimeRange *)timeRange;
- (BOOL)isActive;
- (BOOL)isCollapsedInTimeLine;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToInterstitialTimeRange:(id)a3;
- (BOOL)isHidden;
- (BOOL)isUnmarked;
- (CMTimeRange)timeRange;
- (double)linearPlaybackRequirementDuration;
- (double)playingDuration;
- (id)_initWithTimeRange:(id *)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)playerInterstitialEvent;
- (int64_t)requiredViewingPolicy;
- (unint64_t)_watchCount;
- (unint64_t)hash;
- (void)_setActive:(BOOL)a3;
- (void)_setCollapsedInTimeLine:(BOOL)a3;
- (void)_setDurationTimeInterval:(double)a3;
- (void)_setPlayerInterstitialEvent:(id)a3;
- (void)_setPlayingDuration:(double)a3;
- (void)_setUnmarked:(BOOL)a3;
- (void)_setWatchCount:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setLinearPlaybackRequirementDuration:(double)a3;
- (void)setRequiredViewingPolicy:(int64_t)a3;
@end

@implementation AVInterstitialTimeRange

+ (AVInterstitialTimeRange)interstitialTimeRangeWithPlayerInterstitialEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 date];

  if (v4)
  {
    v5 = [AVInterstitialDateRange alloc];
    v6 = [v3 date];
    v7 = [(AVInterstitialDateRange *)v5 initWithStart:v6 end:0];

    p_super = &v7->super;
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    *(_OWORD *)buf = 0u;
    if (v3)
    {
      [v3 time];
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      *(void *)&v16[0] = 0;
    }
    *(_OWORD *)((char *)v16 + 8) = *MEMORY[0x1E4F1FA48];
    *((void *)&v16[1] + 1) = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    v9 = [AVInterstitialTimeRange alloc];
    v14[0] = *(_OWORD *)buf;
    v14[1] = v16[0];
    v14[2] = v16[1];
    p_super = [(AVInterstitialTimeRange *)v9 initWithTimeRange:v14];
    v7 = 0;
  }
  [(AVInterstitialTimeRange *)p_super _setPlayerInterstitialEvent:v3];
  char v10 = [v3 restrictions];
  double v11 = INFINITY;
  if ((v10 & 4) == 0) {
    double v11 = 0.0;
  }
  [(AVInterstitialTimeRange *)p_super setLinearPlaybackRequirementDuration:v11];
  -[AVInterstitialTimeRange setRequiredViewingPolicy:](p_super, "setRequiredViewingPolicy:", ~(2 * [v3 restrictions]) & 2);
  if ([v3 timelineOccupancy] == 1)
  {
    [(AVInterstitialTimeRange *)p_super _setCollapsedInTimeLine:0];
    if ([v3 supplementsPrimaryContent]) {
      [(AVInterstitialTimeRange *)p_super _setUnmarked:1];
    }
  }
  else if ([v3 supplementsPrimaryContent])
  {
    v12 = _AVLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(void *)&buf[4] = "+[AVInterstitialTimeRange(AVPlayerInterstitialSupport) interstitialTimeRangeWithPlayerInterstitialEvent:]";
      _os_log_impl(&dword_1B05B7000, v12, OS_LOG_TYPE_DEFAULT, "%s Interstitial has invalid combination of supplementsPrimaryContent without fillOccupancy -- overriding primary content designation!", buf, 0xCu);
    }
  }

  return p_super;
}

- (void).cxx_destruct
{
}

- (void)_setUnmarked:(BOOL)a3
{
  self->_unmarked = a3;
}

- (BOOL)isUnmarked
{
  return self->_unmarked;
}

- (void)setRequiredViewingPolicy:(int64_t)a3
{
  self->_requiredViewingPolicy = a3;
}

- (int64_t)requiredViewingPolicy
{
  return self->_requiredViewingPolicy;
}

- (void)setLinearPlaybackRequirementDuration:(double)a3
{
  self->_linearPlaybackRequirementDuration = a3;
}

- (double)linearPlaybackRequirementDuration
{
  return self->_linearPlaybackRequirementDuration;
}

- (void)_setWatchCount:(unint64_t)a3
{
  self->__watchCount = a3;
}

- (unint64_t)_watchCount
{
  return self->__watchCount;
}

- (BOOL)isActive
{
  return self->_active;
}

- (CMTimeRange)timeRange
{
  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (void)_setPlayerInterstitialEvent:(id)a3
{
  v5 = (AVPlayerInterstitialEvent *)a3;
  p_playerInterstitialEvent = &self->_playerInterstitialEvent;
  if (self->_playerInterstitialEvent != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_playerInterstitialEvent, a3);
    v5 = v8;
    if (v8)
    {
      if ((~self->_timeRange.duration.flags & 0x11) == 0)
      {
        uint64_t v7 = MEMORY[0x1E4F1FA48];
        *(_OWORD *)&self->_timeRange.duration.value = *MEMORY[0x1E4F1FA48];
        self->_timeRange.duration.epoch = *(void *)(v7 + 16);
      }
    }
  }

  MEMORY[0x1F41817F8](p_playerInterstitialEvent, v5);
}

- (id)playerInterstitialEvent
{
  return self->_playerInterstitialEvent;
}

- (void)_setPlayingDuration:(double)a3
{
  self->_playingDuration = a3;
}

- (double)playingDuration
{
  double result = self->_playingDuration;
  if (result == -1.0)
  {
    $95D729B680665BEAEFA1D6FCA8238556 duration = self->_timeRange.duration;
    return CMTimeGetSeconds((CMTime *)&duration);
  }
  return result;
}

- (void)_setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3)
    {
      unint64_t v4 = [(AVInterstitialTimeRange *)self _watchCount] + 1;
      [(AVInterstitialTimeRange *)self _setWatchCount:v4];
    }
  }
}

- (void)_setCollapsedInTimeLine:(BOOL)a3
{
  self->_collapsedInTimeLine = a3;
}

- (BOOL)isCollapsedInTimeLine
{
  return self->_collapsedInTimeLine;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  [(AVInterstitialTimeRange *)self timeRange];
  unint64_t v4 = (__CFString *)CMTimeRangeCopyDescription(v3, &range);
  v5 = v4;
  if (!self->_playerInterstitialEvent)
  {
    v12 = v4;
    goto LABEL_25;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = self->_playerInterstitialEvent;
  v8 = NSString;
  v9 = (objc_class *)objc_opt_class();
  char v10 = NSStringFromClass(v9);
  double v11 = [v8 stringWithFormat:@"%@ %p", v10, v7];
  [v6 addObject:v11];

  if (v7) {
    [(AVPlayerInterstitialEvent *)v7 time];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  v13 = objc_msgSend(NSString, "stringWithFormat:", @"%0.1f sec", CMTimeGetSeconds(&time));
  [v6 addObject:v13];
  if (!v7)
  {
    memset(&v25, 0, sizeof(v25));
LABEL_10:
    CMTime v28 = v25;
    double Seconds = CMTimeGetSeconds(&v28);
    if (Seconds == 0.0)
    {
      v14 = &stru_1F09185C8;
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"resume %+0.1f sec", *(void *)&Seconds);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  [(AVPlayerInterstitialEvent *)v7 resumptionOffset];
  if ((~v25.flags & 0x11) != 0) {
    goto LABEL_10;
  }
  v14 = @"resume live stream";
LABEL_13:
  if ([(__CFString *)v14 length]) {
    [v6 addObject:v14];
  }
  uint64_t v16 = [(AVPlayerInterstitialEvent *)v7 restrictions];
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v18 = v17;
  if (v16) {
    [v17 addObject:@"ConstrainsSeekingForwardInPrimaryContent"];
  }
  if ((v16 & 4) != 0) {
    [v18 addObject:@"RequiresPlaybackAtPreferredRateForAdvancement"];
  }
  if ((v16 & 0xFFFFFFFFFFFFFFFALL) != 0)
  {
    v19 = objc_msgSend(NSString, "stringWithFormat:", @"Unrecognized restrictions 0x%lx", v16 & 0xFFFFFFFFFFFFFFFALL);
    [v18 addObject:v19];
  }
  if ([v18 count])
  {
    v20 = [v18 componentsJoinedByString:@", "];
  }
  else
  {
    v20 = @"no restrictions";
  }

  [v6 addObject:v20];
  v21 = NSString;
  v22 = [v6 componentsJoinedByString:@", "];
  v23 = [v21 stringWithFormat:@"<%@>", v22];

  v12 = [NSString stringWithFormat:@"%@ {%@}", v5, v23];

LABEL_25:

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (AVInterstitialTimeRange *)a3;
  v5 = v4;
  if (self == v4) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = v4
  }
      && (uint64_t v6 = objc_opt_class(), v6 == objc_opt_class())
      && [(AVInterstitialTimeRange *)self isEqualToInterstitialTimeRange:v5];

  return v7;
}

- (BOOL)isEqualToInterstitialTimeRange:(id)a3
{
  id v4 = a3;
  memset(v12, 0, sizeof(v12));
  long long v11 = 0u;
  [(AVInterstitialTimeRange *)self timeRange];
  if (v4
    && (memset(v10, 0, sizeof(v10)),
        long long v9 = 0u,
        [v4 timeRange],
        *(_OWORD *)&time1.value = v11,
        time1.epoch = *(void *)&v12[0],
        *(_OWORD *)&v7.value = v9,
        v7.epoch = *(void *)&v10[0],
        !CMTimeCompare(&time1, &v7)))
  {
    CMTime time1 = *(CMTime *)((char *)v12 + 8);
    CMTime v7 = *(CMTime *)((char *)v10 + 8);
    BOOL v5 = CMTimeCompare(&time1, &v7) == 0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  memset(v9, 0, sizeof(v9));
  long long v8 = 0u;
  [(AVInterstitialTimeRange *)self timeRange];
  *(_OWORD *)&v7.value = v8;
  v7.epoch = *(void *)&v9[0];
  v2 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v7)];
  uint64_t v3 = [v2 hash];

  CMTime v7 = *(CMTime *)((char *)v9 + 8);
  id v4 = [NSNumber numberWithDouble:CMTimeGetSeconds(&v7)];
  uint64_t v5 = [v4 hash];

  return v5 ^ __ROR8__(v3, 61);
}

- (void)_setDurationTimeInterval:(double)a3
{
  [(AVInterstitialTimeRange *)self willChangeValueForKey:@"timeRange"];
  CMTimeMakeWithSeconds(&v5, a3, 1000);
  self->_timeRange.$95D729B680665BEAEFA1D6FCA8238556 duration = ($95D729B680665BEAEFA1D6FCA8238556)v5;
  [(AVInterstitialTimeRange *)self didChangeValueForKey:@"timeRange"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = +[AVInterstitialTimeRange allocWithZone:a3];
  [(AVInterstitialTimeRange *)self timeRange];
  CMTime v5 = [(AVInterstitialTimeRange *)v4 initWithTimeRange:&v7];
  v5->_hidden = [(AVInterstitialTimeRange *)self isHidden];
  v5->_collapsedInTimeLine = [(AVInterstitialTimeRange *)self isCollapsedInTimeLine];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [(AVInterstitialTimeRange *)self timeRange];
  CFDictionaryRef v5 = CMTimeRangeCopyAsDictionary(&v6, (CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  [v4 encodeObject:v5 forKey:@"AVTimeRange"];
}

- (AVInterstitialTimeRange)initWithCoder:(id)a3
{
  CFDictionaryRef v4 = [a3 decodeObjectForKey:@"AVTimeRange"];
  CFDictionaryRef v5 = v4;
  long long v6 = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 16);
  *(_OWORD *)&v10.start.value = *MEMORY[0x1E4F1FA30];
  *(_OWORD *)&v10.start.epoch = v6;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)(MEMORY[0x1E4F1FA30] + 32);
  if (v4) {
    CMTimeRangeMakeFromDictionary(&v10, v4);
  }
  CMTimeRange v9 = v10;
  uint64_t v7 = [(AVInterstitialTimeRange *)self initWithTimeRange:&v9];

  return v7;
}

- (AVInterstitialTimeRange)initWithHiddenTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  double result = [(AVInterstitialTimeRange *)self initWithTimeRange:v5];
  if (result) {
    result->_hidden = 1;
  }
  return result;
}

- (AVInterstitialTimeRange)initWithTimeRange:(CMTimeRange *)timeRange
{
  v9.receiver = self;
  v9.super_class = (Class)AVInterstitialTimeRange;
  CFDictionaryRef v4 = [(AVInterstitialTimeRange *)&v9 init];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&timeRange->start.epoch;
    v8[0] = *(_OWORD *)&timeRange->start.value;
    v8[1] = v6;
    v8[2] = *(_OWORD *)&timeRange->duration.timescale;
    _CommonInit(v4, v8);
  }
  return v5;
}

- (id)_initWithTimeRange:(id *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVInterstitialTimeRange;
  CFDictionaryRef v4 = [(AVInterstitialTimeRange *)&v9 init];
  CFDictionaryRef v5 = v4;
  if (v4)
  {
    long long v6 = *(_OWORD *)&a3->var0.var3;
    v8[0] = *(_OWORD *)&a3->var0.var0;
    v8[1] = v6;
    v8[2] = *(_OWORD *)&a3->var1.var1;
    _CommonInit(v4, v8);
  }
  return v5;
}

- (AVInterstitialTimeRange)init
{
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTime v4 = start;
  CMTimeRangeMake(&v6, &start, &v4);
  return [(AVInterstitialTimeRange *)self initWithTimeRange:&v6];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end