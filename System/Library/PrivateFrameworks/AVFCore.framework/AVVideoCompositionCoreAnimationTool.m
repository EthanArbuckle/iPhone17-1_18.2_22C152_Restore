@interface AVVideoCompositionCoreAnimationTool
+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithAdditionalLayer:(CALayer *)layer asTrackID:(CMPersistentTrackID)trackID;
+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:(CALayer *)videoLayer inLayer:(CALayer *)animationLayer;
+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers:(NSArray *)videoLayers inLayer:(CALayer *)animationLayer;
- (AVVideoCompositionCoreAnimationTool)initWithMagicTrackID:(int)a3 animationLayer:(id)a4 videoLayers:(id)a5;
- (BOOL)_hasLayerAsAuxiliaryTrack;
- (BOOL)_hasPostProcessingLayers;
- (id)_auxiliaryTrackLayer;
- (id)_postProcessingRootLayer;
- (id)_postProcessingVideoLayers;
- (int)_auxiliaryTrackID;
- (void)dealloc;
@end

@implementation AVVideoCompositionCoreAnimationTool

- (AVVideoCompositionCoreAnimationTool)initWithMagicTrackID:(int)a3 animationLayer:(id)a4 videoLayers:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVVideoCompositionCoreAnimationTool;
  v8 = [(AVVideoCompositionCoreAnimationTool *)&v11 init];
  if (v8)
  {
    v9 = objc_alloc_init(AVVideoCompositionCoreAnimationToolInternal);
    v8->_videoCompositionTool = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_videoCompositionTool->way = a3 == 0;
      v8->_videoCompositionTool->animationLayer = (CALayer *)a4;
      v8->_videoCompositionTool->auxiliaryTrackID = a3;
      v8->_videoCompositionTool->postProcessingVideoLayers = (NSArray *)[a5 copy];
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithAdditionalLayer:(CALayer *)layer asTrackID:(CMPersistentTrackID)trackID
{
  v4 = (void *)[objc_alloc((Class)a1) initWithMagicTrackID:*(void *)&trackID animationLayer:layer videoLayers:0];
  return (AVVideoCompositionCoreAnimationTool *)v4;
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayer:(CALayer *)videoLayer inLayer:(CALayer *)animationLayer
{
  id v6 = objc_alloc((Class)a1);
  v7 = objc_msgSend(v6, "initWithMagicTrackID:animationLayer:videoLayers:", 0, animationLayer, objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObject:", videoLayer));
  return (AVVideoCompositionCoreAnimationTool *)v7;
}

+ (AVVideoCompositionCoreAnimationTool)videoCompositionCoreAnimationToolWithPostProcessingAsVideoLayers:(NSArray *)videoLayers inLayer:(CALayer *)animationLayer
{
  v4 = (void *)[objc_alloc((Class)a1) initWithMagicTrackID:0 animationLayer:animationLayer videoLayers:videoLayers];
  return (AVVideoCompositionCoreAnimationTool *)v4;
}

- (void)dealloc
{
  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool)
  {

    CFRelease(self->_videoCompositionTool);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoCompositionCoreAnimationTool;
  [(AVVideoCompositionCoreAnimationTool *)&v4 dealloc];
}

- (BOOL)_hasLayerAsAuxiliaryTrack
{
  videoCompositionTool = self->_videoCompositionTool;
  return !videoCompositionTool->way && videoCompositionTool->animationLayer != 0;
}

- (id)_auxiliaryTrackLayer
{
  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way) {
    return 0;
  }
  else {
    return videoCompositionTool->animationLayer;
  }
}

- (int)_auxiliaryTrackID
{
  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way) {
    return 0;
  }
  else {
    return videoCompositionTool->auxiliaryTrackID;
  }
}

- (BOOL)_hasPostProcessingLayers
{
  videoCompositionTool = self->_videoCompositionTool;
  return videoCompositionTool->way == 1 && videoCompositionTool->animationLayer != 0;
}

- (id)_postProcessingRootLayer
{
  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way == 1) {
    return videoCompositionTool->animationLayer;
  }
  else {
    return 0;
  }
}

- (id)_postProcessingVideoLayers
{
  videoCompositionTool = self->_videoCompositionTool;
  if (videoCompositionTool->way == 1) {
    return videoCompositionTool->postProcessingVideoLayers;
  }
  else {
    return 0;
  }
}

@end