@interface AVMutableVideoCompositionLayerInstruction
+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstruction;
+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstructionWithAssetTrack:(AVAssetTrack *)track;
- (CMPersistentTrackID)trackID;
- (void)setCropRectangle:(CGRect)cropRectangle atTime:(CMTime *)time;
- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)startCropRectangle toEndCropRectangle:(CGRect)endCropRectangle timeRange:(CMTimeRange *)timeRange;
- (void)setOpacity:(float)opacity atTime:(CMTime *)time;
- (void)setOpacityRampFromStartOpacity:(float)startOpacity toEndOpacity:(float)endOpacity timeRange:(CMTimeRange *)timeRange;
- (void)setTrackID:(CMPersistentTrackID)trackID;
- (void)setTransform:(CGAffineTransform *)transform atTime:(CMTime *)time;
- (void)setTransformRampFromStartTransform:(CGAffineTransform *)startTransform toEndTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange;
@end

@implementation AVMutableVideoCompositionLayerInstruction

+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstructionWithAssetTrack:(AVAssetTrack *)track
{
  v4 = (AVMutableVideoCompositionLayerInstruction *)objc_alloc_init((Class)a1);
  if (track) {
    [(AVMutableVideoCompositionLayerInstruction *)v4 setTrackID:[(AVAssetTrack *)track trackID]];
  }
  return v4;
}

+ (AVMutableVideoCompositionLayerInstruction)videoCompositionLayerInstruction
{
  id v2 = objc_alloc_init((Class)a1);
  return (AVMutableVideoCompositionLayerInstruction *)v2;
}

- (CMPersistentTrackID)trackID
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  return [(AVVideoCompositionLayerInstruction *)&v3 trackID];
}

- (void)setTrackID:(CMPersistentTrackID)trackID
{
  v3.receiver = self;
  v3.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  [(AVVideoCompositionLayerInstruction *)&v3 setTrackID:*(void *)&trackID];
}

- (void)setTransform:(CGAffineTransform *)transform atTime:(CMTime *)time
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  long long v4 = *(_OWORD *)&transform->c;
  v6[0] = *(_OWORD *)&transform->a;
  v6[1] = v4;
  v6[2] = *(_OWORD *)&transform->tx;
  CMTime v5 = *time;
  [(AVVideoCompositionLayerInstruction *)&v7 setTransform:v6 atTime:&v5];
}

- (void)setTransformRampFromStartTransform:(CGAffineTransform *)startTransform toEndTransform:(CGAffineTransform *)endTransform timeRange:(CMTimeRange *)timeRange
{
  v11.receiver = self;
  v11.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  long long v5 = *(_OWORD *)&startTransform->c;
  v10[0] = *(_OWORD *)&startTransform->a;
  v10[1] = v5;
  v10[2] = *(_OWORD *)&startTransform->tx;
  long long v6 = *(_OWORD *)&endTransform->c;
  v9[0] = *(_OWORD *)&endTransform->a;
  v9[1] = v6;
  v9[2] = *(_OWORD *)&endTransform->tx;
  long long v7 = *(_OWORD *)&timeRange->start.epoch;
  v8[0] = *(_OWORD *)&timeRange->start.value;
  v8[1] = v7;
  v8[2] = *(_OWORD *)&timeRange->duration.timescale;
  [(AVVideoCompositionLayerInstruction *)&v11 setTransformRampFromStartTransform:v10 toEndTransform:v9 timeRange:v8];
}

- (void)setOpacity:(float)opacity atTime:(CMTime *)time
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  CMTime v4 = *time;
  -[AVVideoCompositionLayerInstruction setOpacity:atTime:](&v5, sel_setOpacity_atTime_, &v4);
}

- (void)setOpacityRampFromStartOpacity:(float)startOpacity toEndOpacity:(float)endOpacity timeRange:(CMTimeRange *)timeRange
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionLayerInstruction setOpacityRampFromStartOpacity:toEndOpacity:timeRange:](&v7, sel_setOpacityRampFromStartOpacity_toEndOpacity_timeRange_, v6);
}

- (void)setCropRectangle:(CGRect)cropRectangle atTime:(CMTime *)time
{
  v5.receiver = self;
  v5.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  CMTime v4 = *time;
  -[AVVideoCompositionLayerInstruction setCropRectangle:atTime:](&v5, sel_setCropRectangle_atTime_, &v4, cropRectangle.origin.x, cropRectangle.origin.y, cropRectangle.size.width, cropRectangle.size.height);
}

- (void)setCropRectangleRampFromStartCropRectangle:(CGRect)startCropRectangle toEndCropRectangle:(CGRect)endCropRectangle timeRange:(CMTimeRange *)timeRange
{
  v7.receiver = self;
  v7.super_class = (Class)AVMutableVideoCompositionLayerInstruction;
  long long v5 = *(_OWORD *)&timeRange->start.epoch;
  v6[0] = *(_OWORD *)&timeRange->start.value;
  v6[1] = v5;
  v6[2] = *(_OWORD *)&timeRange->duration.timescale;
  -[AVVideoCompositionLayerInstruction setCropRectangleRampFromStartCropRectangle:toEndCropRectangle:timeRange:](&v7, sel_setCropRectangleRampFromStartCropRectangle_toEndCropRectangle_timeRange_, v6, startCropRectangle.origin.x, startCropRectangle.origin.y, startCropRectangle.size.width, startCropRectangle.size.height, endCropRectangle.origin.x, endCropRectangle.origin.y, endCropRectangle.size.width, endCropRectangle.size.height);
}

@end