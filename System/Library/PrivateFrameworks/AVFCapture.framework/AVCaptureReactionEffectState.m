@interface AVCaptureReactionEffectState
- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4;
- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4 endTime:(id *)a5;
- (AVCaptureReactionType)reactionType;
- (CMTime)endTime;
- (CMTime)startTime;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (void)dealloc;
- (void)setEndTime:(id *)a3;
@end

@implementation AVCaptureReactionEffectState

- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a4;
  long long v5 = *MEMORY[0x1E4F1F9F8];
  uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
  return [(AVCaptureReactionEffectState *)self initWithReactionType:a3 startTime:&v7 endTime:&v5];
}

- (AVCaptureReactionEffectState)initWithReactionType:(id)a3 startTime:(id *)a4 endTime:(id *)a5
{
  v12.receiver = self;
  v12.super_class = (Class)AVCaptureReactionEffectState;
  v8 = [(AVCaptureReactionEffectState *)&v12 init];
  if (v8)
  {
    *((void *)v8 + 1) = a3;
    int64_t var3 = a4->var3;
    *((_OWORD *)v8 + 1) = *(_OWORD *)&a4->var0;
    *((void *)v8 + 4) = var3;
    long long v10 = *(_OWORD *)&a5->var0;
    *((void *)v8 + 7) = a5->var3;
    *(_OWORD *)(v8 + 40) = v10;
  }
  return (AVCaptureReactionEffectState *)v8;
}

- (id)initFromDictionary:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)AVCaptureReactionEffectState;
  v4 = [(AVCaptureReactionEffectState *)&v14 init];
  if (v4)
  {
    id v5 = (id)[a3 objectForKeyedSubscript:@"ReactionType"];
    *((void *)v4 + 1) = v5;
    if (!v5) {
      goto LABEL_6;
    }
    objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"StartTime"), "doubleValue");
    CMTimeMakeWithSeconds(&v13, v6, 1000000000);
    CMTimeEpoch epoch = v13.epoch;
    *((_OWORD *)v4 + 1) = *(_OWORD *)&v13.value;
    *((void *)v4 + 4) = epoch;
    if ((v4[28] & 1) == 0) {
      goto LABEL_6;
    }
    v8 = (void *)[a3 objectForKeyedSubscript:@"EndTime"];
    v9 = v4 + 40;
    if (!v8)
    {
      uint64_t v11 = MEMORY[0x1E4F1F9F8];
      _OWORD *v9 = *MEMORY[0x1E4F1F9F8];
      *((void *)v4 + 7) = *(void *)(v11 + 16);
      return v4;
    }
    [v8 doubleValue];
    CMTimeMakeWithSeconds(&v13, v10, 1000000000);
    _OWORD *v9 = *(_OWORD *)&v13.value;
    *((void *)v4 + 7) = v13.epoch;
    if ((v4[52] & 1) == 0)
    {
LABEL_6:

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureReactionEffectState;
  [(AVCaptureReactionEffectState *)&v3 dealloc];
}

- (id)dictionaryRepresentation
{
  v13[3] = *MEMORY[0x1E4F143B8];
  if (self->_endTime.flags)
  {
    v13[0] = self->_reactionType;
    v12[0] = @"ReactionType";
    v12[1] = @"StartTime";
    $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_startTime;
    v13[1] = [NSNumber numberWithDouble:CMTimeGetSeconds((CMTime *)&startTime)];
    v12[2] = @"EndTime";
    $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_endTime;
    v13[2] = [NSNumber numberWithDouble:CMTimeGetSeconds((CMTime *)&startTime)];
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = v13;
    Float64 v6 = v12;
    uint64_t v7 = 3;
  }
  else
  {
    reactionType = self->_reactionType;
    v10[1] = @"StartTime";
    v11[0] = reactionType;
    $95D729B680665BEAEFA1D6FCA8238556 startTime = self->_startTime;
    v10[0] = @"ReactionType";
    v11[1] = [NSNumber numberWithDouble:CMTimeGetSeconds((CMTime *)&startTime)];
    v4 = (void *)MEMORY[0x1E4F1C9E8];
    id v5 = v11;
    Float64 v6 = v10;
    uint64_t v7 = 2;
  }
  return (id)[v4 dictionaryWithObjects:v5 forKeys:v6 count:v7];
}

- (id)description
{
  if (self->_endTime.flags)
  {
    CMTime time = (CMTime)self->_endTime;
    objc_super v3 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"%.4f", CMTimeGetSeconds(&time));
  }
  else
  {
    objc_super v3 = @"...";
  }
  reactionType = self->_reactionType;
  CMTime time = (CMTime)self->_startTime;
  return (id)[NSString stringWithFormat:@"[AVCaptureReactionEffectState(%p): %@ %.4f - %@]", self, reactionType, CMTimeGetSeconds(&time), v3];
}

- (AVCaptureReactionType)reactionType
{
  return self->_reactionType;
}

- (CMTime)startTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->epoch;
  return self;
}

- (CMTime)endTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 40);
  return self;
}

- (void)setEndTime:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_endTime.CMTimeEpoch epoch = a3->var3;
  *(_OWORD *)&self->_endTime.value = v3;
}

@end