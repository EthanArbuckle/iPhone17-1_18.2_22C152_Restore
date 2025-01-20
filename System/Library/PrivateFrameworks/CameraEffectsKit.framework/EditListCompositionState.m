@interface EditListCompositionState
- ($70930193D4F448A53BB9343C0237EB5F)audioCompTimeRange;
- ($70930193D4F448A53BB9343C0237EB5F)videoCompTimeRange;
- (BOOL)clipRequiresCA;
- (BOOL)isLastClip;
- (JFXCompositionTrackGroup)alternateTrackGroup;
- (JFXCompositionTrackGroup)currentTrackGroup;
- (JFXPlayableElement)clip;
- (id)description;
- (int)audioEndOffset;
- (int)audioStartOffset;
- (int)overlapLeft;
- (int)overlapRight;
- (void)setAlternateTrackGroup:(id)a3;
- (void)setAudioCompTimeRange:(id *)a3;
- (void)setAudioEndOffset:(int)a3;
- (void)setAudioStartOffset:(int)a3;
- (void)setClip:(id)a3;
- (void)setClipRequiresCA:(BOOL)a3;
- (void)setCurrentTrackGroup:(id)a3;
- (void)setIsLastClip:(BOOL)a3;
- (void)setOverlapLeft:(int)a3;
- (void)setOverlapRight:(int)a3;
- (void)setVideoCompTimeRange:(id *)a3;
- (void)swapTrackGroup;
@end

@implementation EditListCompositionState

- (void)swapTrackGroup
{
  id v4 = [(EditListCompositionState *)self currentTrackGroup];
  v3 = [(EditListCompositionState *)self alternateTrackGroup];
  [(EditListCompositionState *)self setCurrentTrackGroup:v3];

  [(EditListCompositionState *)self setAlternateTrackGroup:v4];
}

- (id)description
{
  v3 = (void *)MEMORY[0x263F089D8];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p>\n", v5, self];

  [v6 appendFormat:@"  currentTrackGroup: %@\n", self->_currentTrackGroup];
  [v6 appendFormat:@"  alternateTrackGroup: %@\n", self->_alternateTrackGroup];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clip);
  [v6 appendFormat:@"  clip: %@\n", WeakRetained];

  objc_msgSend(v6, "appendFormat:", @"  overlapLeft: %d\n", self->_overlapLeft);
  objc_msgSend(v6, "appendFormat:", @"  overlapRight: %d\n", self->_overlapRight);
  if (self->_isLastClip) {
    v8 = @"YES";
  }
  else {
    v8 = @"NO";
  }
  [v6 appendFormat:@"  isLastClip: %@\n", v8];
  if (self->_clipRequiresCA) {
    v9 = @"YES";
  }
  else {
    v9 = @"NO";
  }
  [v6 appendFormat:@"  clipRequiresCA: %@\n", v9];
  long long v10 = *(_OWORD *)&self->_videoCompTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_videoCompTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v10;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_videoCompTimeRange.duration.timescale;
  CFStringRef v11 = CMTimeRangeCopyDescription(0, &range);
  [v6 appendFormat:@"  videoCompTimeRange: %@\n", v11];
  CFRelease(v11);
  long long v12 = *(_OWORD *)&self->_audioCompTimeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_audioCompTimeRange.start.value;
  *(_OWORD *)&range.start.epoch = v12;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_audioCompTimeRange.duration.timescale;
  CFStringRef v13 = CMTimeRangeCopyDescription(0, &range);
  [v6 appendFormat:@"  audioCompTimeRange: %@\n", v13];
  CFRelease(v13);
  objc_msgSend(v6, "appendFormat:", @"  audioStartOffset: %d\n", self->_audioStartOffset);
  objc_msgSend(v6, "appendFormat:", @"  audioEndOffset: %d\n", self->_audioEndOffset);
  return v6;
}

- (JFXCompositionTrackGroup)currentTrackGroup
{
  return self->_currentTrackGroup;
}

- (void)setCurrentTrackGroup:(id)a3
{
}

- (JFXCompositionTrackGroup)alternateTrackGroup
{
  return self->_alternateTrackGroup;
}

- (void)setAlternateTrackGroup:(id)a3
{
}

- (JFXPlayableElement)clip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clip);
  return (JFXPlayableElement *)WeakRetained;
}

- (void)setClip:(id)a3
{
}

- (int)overlapLeft
{
  return self->_overlapLeft;
}

- (void)setOverlapLeft:(int)a3
{
  self->_overlapLeft = a3;
}

- (int)overlapRight
{
  return self->_overlapRight;
}

- (void)setOverlapRight:(int)a3
{
  self->_overlapRight = a3;
}

- (BOOL)isLastClip
{
  return self->_isLastClip;
}

- (void)setIsLastClip:(BOOL)a3
{
  self->_isLastClip = a3;
}

- (BOOL)clipRequiresCA
{
  return self->_clipRequiresCA;
}

- (void)setClipRequiresCA:(BOOL)a3
{
  self->_clipRequiresCA = a3;
}

- ($70930193D4F448A53BB9343C0237EB5F)videoCompTimeRange
{
  long long v3 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[1].var1.var3;
  return self;
}

- (void)setVideoCompTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_videoCompTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_videoCompTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_videoCompTimeRange.start.value = v3;
}

- ($70930193D4F448A53BB9343C0237EB5F)audioCompTimeRange
{
  long long v3 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var1.var3;
  return self;
}

- (void)setAudioCompTimeRange:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0.var0;
  long long v4 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)&self->_audioCompTimeRange.duration.timescale = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&self->_audioCompTimeRange.start.epoch = v4;
  *(_OWORD *)&self->_audioCompTimeRange.start.value = v3;
}

- (int)audioStartOffset
{
  return self->_audioStartOffset;
}

- (void)setAudioStartOffset:(int)a3
{
  self->_audioStartOffset = a3;
}

- (int)audioEndOffset
{
  return self->_audioEndOffset;
}

- (void)setAudioEndOffset:(int)a3
{
  self->_audioEndOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clip);
  objc_storeStrong((id *)&self->_alternateTrackGroup, 0);
  objc_storeStrong((id *)&self->_currentTrackGroup, 0);
}

@end