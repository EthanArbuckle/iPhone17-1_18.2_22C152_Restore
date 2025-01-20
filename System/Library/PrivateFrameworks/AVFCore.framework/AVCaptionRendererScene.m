@interface AVCaptionRendererScene
- (AVCaptionRendererScene)init;
- (AVCaptionRendererScene)initWithTimeRange:(id *)a3 hasActiveCaptions:(BOOL)a4 needsPeriodicRefresh:(BOOL)a5;
- (BOOL)hasActiveCaptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)needsPeriodicRefresh;
- (CMTimeRange)timeRange;
- (id)description;
- (unint64_t)hash;
- (void)dealloc;
@end

@implementation AVCaptionRendererScene

- (AVCaptionRendererScene)init
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3C8];
  v6 = NSStringFromSelector(sel_initWithText_timeRange_);
  v12 = (void *)[v4 exceptionWithName:v5, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Use %@ instead.", v7, v8, v9, v10, v11, (uint64_t)v6), 0 reason userInfo];
  objc_exception_throw(v12);
}

- (AVCaptionRendererScene)initWithTimeRange:(id *)a3 hasActiveCaptions:(BOOL)a4 needsPeriodicRefresh:(BOOL)a5
{
  if ((a3->var0.var2 & 0x1D) != 1 || (a3->var1.var2 & 0x1D) != 1)
  {
    v15 = self;
    v21 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v16, v17, v18, v19, v20, (uint64_t)"CMTIME_IS_NUMERIC(timeRange.start) && CMTIME_IS_NUMERIC(timeRange.duration)"), 0 reason userInfo];
    objc_exception_throw(v21);
  }
  v22.receiver = self;
  v22.super_class = (Class)AVCaptionRendererScene;
  uint64_t v9 = [(AVCaptionRendererScene *)&v22 init];
  if (v9)
  {
    uint64_t v10 = objc_alloc_init(AVCaptionRendererSceneInternal);
    v9->_internal = v10;
    if (v10)
    {
      long long v11 = *(_OWORD *)&a3->var0.var0;
      long long v12 = *(_OWORD *)&a3->var0.var3;
      *(_OWORD *)&v10->_timeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
      *(_OWORD *)&v10->_timeRange.start.epoch = v12;
      *(_OWORD *)&v10->_timeRange.start.value = v11;
      v9->_internal->_hasActiveCaptions = a4;
      v9->_internal->_needsPeriodicRefresh = a5;
    }
    else
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptionRendererScene;
  [(AVCaptionRendererScene *)&v3 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  uint64_t v10 = v3;
  uint64_t v11 = v4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  if (!self)
  {
    memset(&range1, 0, sizeof(range1));
    if (a3) {
      goto LABEL_5;
    }
LABEL_9:
    memset(&v8, 0, sizeof(v8));
    return CMTimeRangeEqual(&range1, &v8) != 0;
  }
  [(AVCaptionRendererScene *)self timeRange];
  if (!a3) {
    goto LABEL_9;
  }
LABEL_5:
  [a3 timeRange];
  return CMTimeRangeEqual(&range1, &v8) != 0;
}

- (unint64_t)hash
{
  memset(v6, 0, sizeof(v6));
  long long v5 = 0u;
  if (self) {
    [(AVCaptionRendererScene *)self timeRange];
  }
  *(_OWORD *)&v4.value = v5;
  v4.epoch = *(void *)&v6[0];
  CMTimeEpoch v2 = CMTimeHash(&v4);
  CMTime v4 = *(CMTime *)((char *)v6 + 8);
  return CMTimeHash(&v4) ^ v2;
}

- (CMTimeRange)timeRange
{
  uint64_t v3 = *(void *)&self->start.timescale;
  long long v4 = *(_OWORD *)(v3 + 24);
  *(_OWORD *)&retstr->start.value = *(_OWORD *)(v3 + 8);
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = *(_OWORD *)(v3 + 40);
  return self;
}

- (BOOL)hasActiveCaptions
{
  return self->_internal->_hasActiveCaptions;
}

- (BOOL)needsPeriodicRefresh
{
  return self->_internal->_needsPeriodicRefresh;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self) {
    [(AVCaptionRendererScene *)self timeRange];
  }
  else {
    memset(&range, 0, sizeof(range));
  }
  CFStringRef v4 = (id)CMTimeRangeCopyDescription(v3, &range);
  long long v5 = NSString;
  v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  if ([(AVCaptionRendererScene *)self hasActiveCaptions]) {
    CMTimeRange v8 = @"YES";
  }
  else {
    CMTimeRange v8 = @"NO";
  }
  BOOL v9 = [(AVCaptionRendererScene *)self needsPeriodicRefresh];
  uint64_t v10 = &stru_1EE5953B8;
  if (v9) {
    uint64_t v10 = @", periodic-refresh";
  }
  return (id)[v5 stringWithFormat:@"<%@: %p, timeRange = %@ anyCaptions = %@%@>", v7, self, v4, v8, v10];
}

@end