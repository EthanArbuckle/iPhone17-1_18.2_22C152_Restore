@interface AVVideoComposition
+ (AVVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier;
+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset;
+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4;
+ (id)_mutableVideoCompositionWithAsset:(id)a3 applyingCIFiltersWithHandler:(id)a4;
+ (void)initialize;
+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler;
+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler;
- (AVVideoComposition)init;
- (AVVideoCompositionCoreAnimationTool)animationTool;
- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy;
- (BOOL)_copyFigVideoCompositor:(const void *)a3 andSession:(id *)a4 recyclingSession:(id)a5 forFigRemaker:(BOOL)a6 error:(id *)a7;
- (BOOL)_hasLayerAsAuxiliaryTrack;
- (BOOL)_hasPostProcessingLayers;
- (BOOL)_isValidReturningExceptionReason:(id *)a3;
- (BOOL)isValidForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate;
- (BOOL)isValidForTracks:(id)a3 assetDuration:(id *)a4 timeRange:(id *)a5 validationDelegate:(id)a6;
- (CGSize)renderSize;
- (CMPersistentTrackID)sourceTrackIDForFrameTiming;
- (CMTime)frameDuration;
- (NSArray)instructions;
- (NSArray)sourceSampleDataTrackIDs;
- (NSString)colorPrimaries;
- (NSString)colorTransferFunction;
- (NSString)colorYCbCrMatrix;
- (float)renderScale;
- (id)_auxiliaryTrackLayer;
- (id)_deepCopy;
- (id)_postProcessingRootLayer;
- (id)_postProcessingVideoLayer;
- (id)_postProcessingVideoLayers;
- (id)_serializableInstructions;
- (id)_trackWithTrackID:(int)a3 inTracks:(id)a4;
- (id)builtInCompositorName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)customVideoCompositorClass;
- (id)instructionForFigInstruction:(void *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)sourceSampleDataTrackWindowsForTrackIDs;
- (id)sourceVideoTrackWindowsForTrackIDs;
- (int)_auxiliaryTrackID;
- (unint64_t)_changeSeed;
- (void)_bumpChangeSeed;
- (void)_setFrameDurationForFrameRate:(float)a3 sourceTrackIDForFrameTiming:(int)a4;
- (void)dealloc;
- (void)determineValidityForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate completionHandler:(void *)completionHandler;
- (void)setAnimationTool:(id)a3;
- (void)setBuiltInCompositorName:(id)a3;
- (void)setColorPrimaries:(id)a3;
- (void)setColorTransferFunction:(id)a3;
- (void)setColorYCbCrMatrix:(id)a3;
- (void)setCustomVideoCompositorClass:(Class)a3;
- (void)setFrameDuration:(id *)a3;
- (void)setInstructions:(id)a3;
- (void)setPerFrameHDRDisplayMetadataPolicy:(id)a3;
- (void)setRenderScale:(float)a3;
- (void)setRenderSize:(CGSize)a3;
- (void)setSourceSampleDataTrackIDs:(id)a3;
- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3;
- (void)setSourceTrackIDForFrameTiming:(int)a3;
- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3;
- (void)videoCompositionOutputColorPropertiesWithCustomCompositor:(id)a3 formatDescriptions:(id)a4 colorPrimaries:(id *)a5 transferFunction:(id *)a6 yCbCrMatrix:(id *)a7 perFrameHDRDisplayMetadataPolicy:(id *)a8;
@end

@implementation AVVideoComposition

+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset
{
  v3 = (void *)[+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:asset] copy];
  return (AVVideoComposition *)v3;
}

+ (void)videoCompositionWithPropertiesOfAsset:(AVAsset *)asset completionHandler:(void *)completionHandler
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __78__AVVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke;
  v4[3] = &unk_1E57B3180;
  v4[4] = a1;
  v4[5] = asset;
  v4[6] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1EE5E1A70, (uint64_t)v4);
}

uint64_t __78__AVVideoComposition_videoCompositionWithPropertiesOfAsset_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) videoCompositionWithPropertiesOfAsset:*(void *)(a1 + 40)];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

+ (AVVideoComposition)videoCompositionWithPropertiesOfAsset:(id)a3 videoGravity:(id)a4
{
  v4 = (void *)[+[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:a3 videoGravity:a4] copy];
  return (AVVideoComposition *)v4;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    sPreferredBuiltInVideoCompositor = @"VideoCompositor_DeviceSpecific";
  }
}

- (AVVideoComposition)init
{
  FigNote_AllowInternalDefaultLogs();
  fig_note_initialize_category_with_default_work();
  fig_note_initialize_category_with_default_work();
  v9.receiver = self;
  v9.super_class = (Class)AVVideoComposition;
  v3 = [(AVVideoComposition *)&v9 init];
  if (v3)
  {
    v4 = objc_alloc_init(AVVideoCompositionInternal);
    v3->_videoComposition = v4;
    if (v4)
    {
      CFRetain(v4);
      [(AVVideoComposition *)v3 setBuiltInCompositorName:sPreferredBuiltInVideoCompositor];
      videoComposition = v3->_videoComposition;
      uint64_t v6 = MEMORY[0x1E4F1F9F8];
      *(_OWORD *)&videoComposition->frameDuration.value = *MEMORY[0x1E4F1F9F8];
      videoComposition->frameDuration.epoch = *(void *)(v6 + 16);
      v3->_videoComposition->sourceTrackIDForFrameTiming = 0;
      v7 = v3->_videoComposition;
      v7->renderSize.width = 0.0;
      v7->renderSize.height = 0.0;
      v3->_videoComposition->renderScale = 1.0;
      if (getPerFrameHDRDisplayMetadataDefault_onceToken != -1) {
        dispatch_once(&getPerFrameHDRDisplayMetadataDefault_onceToken, &__block_literal_global_694);
      }
      v3->_videoComposition->perFrameHDRDisplayMetadataPolicy = (NSString *)getPerFrameHDRDisplayMetadataDefault_sDefaultPerFrameHDRDisplayMetadataPolicy;
    }
    else
    {

      return 0;
    }
  }
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  if ([(AVVideoComposition *)self isMemberOfClass:objc_opt_class()])
  {
    return self;
  }
  else
  {
    v5 = [+[AVVideoComposition allocWithZone:a3] init];
    if (v5)
    {
      [(AVVideoComposition *)v5 setBuiltInCompositorName:[(AVVideoComposition *)self builtInCompositorName]];
      [(AVVideoComposition *)v5 setCustomVideoCompositorClass:[(AVVideoComposition *)self customVideoCompositorClass]];
      if (self) {
        [(AVVideoComposition *)self frameDuration];
      }
      else {
        memset(v8, 0, sizeof(v8));
      }
      -[AVVideoComposition setFrameDuration:](v5, "setFrameDuration:", v8, self);
      -[AVVideoComposition setSourceTrackIDForFrameTiming:](v5, "setSourceTrackIDForFrameTiming:", [v7 sourceTrackIDForFrameTiming]);
      [v7 renderSize];
      -[AVVideoComposition setRenderSize:](v5, "setRenderSize:");
      [v7 renderScale];
      -[AVVideoComposition setRenderScale:](v5, "setRenderScale:");
      -[AVVideoComposition setColorPrimaries:](v5, "setColorPrimaries:", [v7 colorPrimaries]);
      -[AVVideoComposition setColorYCbCrMatrix:](v5, "setColorYCbCrMatrix:", [v7 colorYCbCrMatrix]);
      -[AVVideoComposition setColorTransferFunction:](v5, "setColorTransferFunction:", [v7 colorTransferFunction]);
      -[AVVideoComposition setPerFrameHDRDisplayMetadataPolicy:](v5, "setPerFrameHDRDisplayMetadataPolicy:", [v7 perFrameHDRDisplayMetadataPolicy]);
      -[AVVideoComposition setInstructions:](v5, "setInstructions:", [v7 instructions]);
      -[AVVideoComposition setAnimationTool:](v5, "setAnimationTool:", [v7 animationTool]);
      -[AVVideoComposition setSourceSampleDataTrackIDs:](v5, "setSourceSampleDataTrackIDs:", [v7 sourceSampleDataTrackIDs]);
      -[AVVideoComposition setSourceVideoTrackWindowsForTrackIDs:](v5, "setSourceVideoTrackWindowsForTrackIDs:", [v7 sourceVideoTrackWindowsForTrackIDs]);
      -[AVVideoComposition setSourceSampleDataTrackWindowsForTrackIDs:](v5, "setSourceSampleDataTrackWindowsForTrackIDs:", [v7 sourceSampleDataTrackWindowsForTrackIDs]);
    }
    return v5;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v4 = [(AVVideoComposition *)+[AVMutableVideoComposition allocWithZone:a3] init];
  if (v4)
  {
    [(AVMutableVideoComposition *)v4 setBuiltInCompositorName:[(AVVideoComposition *)self builtInCompositorName]];
    [(AVMutableVideoComposition *)v4 setCustomVideoCompositorClass:[(AVVideoComposition *)self customVideoCompositorClass]];
    if (self) {
      [(AVVideoComposition *)self frameDuration];
    }
    else {
      memset(v6, 0, sizeof(v6));
    }
    [(AVMutableVideoComposition *)v4 setFrameDuration:v6];
    [(AVMutableVideoComposition *)v4 setSourceTrackIDForFrameTiming:[(AVVideoComposition *)self sourceTrackIDForFrameTiming]];
    [(AVVideoComposition *)self renderSize];
    -[AVMutableVideoComposition setRenderSize:](v4, "setRenderSize:");
    [(AVVideoComposition *)self renderScale];
    -[AVMutableVideoComposition setRenderScale:](v4, "setRenderScale:");
    [(AVMutableVideoComposition *)v4 setColorPrimaries:[(AVVideoComposition *)self colorPrimaries]];
    [(AVMutableVideoComposition *)v4 setColorYCbCrMatrix:[(AVVideoComposition *)self colorYCbCrMatrix]];
    [(AVMutableVideoComposition *)v4 setColorTransferFunction:[(AVVideoComposition *)self colorTransferFunction]];
    [(AVMutableVideoComposition *)v4 setPerFrameHDRDisplayMetadataPolicy:[(AVVideoComposition *)self perFrameHDRDisplayMetadataPolicy]];
    [(AVMutableVideoComposition *)v4 setInstructions:[(AVVideoComposition *)self instructions]];
    [(AVMutableVideoComposition *)v4 setAnimationTool:[(AVVideoComposition *)self animationTool]];
    [(AVMutableVideoComposition *)v4 setSourceSampleDataTrackIDs:[(AVVideoComposition *)self sourceSampleDataTrackIDs]];
    [(AVMutableVideoComposition *)v4 setSourceVideoTrackWindowsForTrackIDs:[(AVVideoComposition *)self sourceVideoTrackWindowsForTrackIDs]];
    [(AVMutableVideoComposition *)v4 setSourceSampleDataTrackWindowsForTrackIDs:[(AVVideoComposition *)self sourceSampleDataTrackWindowsForTrackIDs]];
  }
  return v4;
}

- (id)_deepCopy
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (id)[(AVVideoComposition *)self mutableCopy];
  v4 = [(AVVideoComposition *)self instructions];
  v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSArray count](v4, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(id *)(*((void *)&v12 + 1) + 8 * v9);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v10 = (id)[v10 _deepCopy];
        }
        [v5 addObject:v10];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  [v3 setInstructions:v5];
  return (id)[v3 copy];
}

- (void)dealloc
{
  videoComposition = self->_videoComposition;
  if (videoComposition)
  {

    CFRelease(self->_videoComposition);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVVideoComposition;
  [(AVVideoComposition *)&v4 dealloc];
}

- (unint64_t)_changeSeed
{
  return self->_videoComposition->changeSeed;
}

- (void)_bumpChangeSeed
{
}

- (id)builtInCompositorName
{
  return self->_videoComposition->builtInCompositorName;
}

- (void)setBuiltInCompositorName:(id)a3
{
  builtInCompositorName = self->_videoComposition->builtInCompositorName;
  if (builtInCompositorName != a3)
  {

    self->_videoComposition->builtInCompositorName = (NSString *)[a3 copy];
  }
}

- (id)customVideoCompositorClass
{
  return self->_videoComposition->customCompositorClass;
}

- (void)setCustomVideoCompositorClass:(Class)a3
{
  self->_videoComposition->customCompositorClass = a3;
}

- (BOOL)_copyFigVideoCompositor:(const void *)a3 andSession:(id *)a4 recyclingSession:(id)a5 forFigRemaker:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  if ([(AVVideoComposition *)self customVideoCompositorClass])
  {
    long long v13 = +[AVCustomVideoCompositorSession sessionWithVideoComposition:self recyclingSession:a5];
    long long v14 = [(AVCustomVideoCompositorSession *)v13 _copyFigVideoCompositor];
    if (!a7) {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  long long v15 = [(AVVideoComposition *)self builtInCompositorName];
  long long v14 = v15;
  if (!v8)
  {
    if (!v15) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if ([(OpaqueFigVideoCompositor *)v15 isEqualToString:@"VideoCompositor_DeviceSpecific"])
  {
    v16 = (id *)MEMORY[0x1E4F34508];
LABEL_13:
    long long v15 = (OpaqueFigVideoCompositor *)*v16;
LABEL_14:
    long long v14 = (OpaqueFigVideoCompositor *)CFRetain(v15);
    goto LABEL_15;
  }
  if ([(OpaqueFigVideoCompositor *)v14 isEqualToString:@"VideoCompositor_Basic"])
  {
    v16 = (id *)MEMORY[0x1E4F34500];
    goto LABEL_13;
  }
  if ([(OpaqueFigVideoCompositor *)v14 isEqualToString:@"VideoCompositor_OpenGL"])
  {
    v16 = (id *)MEMORY[0x1E4F34510];
    goto LABEL_13;
  }
  long long v14 = 0;
LABEL_15:
  long long v13 = 0;
  if (!a7) {
    goto LABEL_18;
  }
LABEL_16:
  if (!v14) {
    *a7 = (id)AVLocalizedError(@"AVFoundationErrorDomain", -11841, 0);
  }
LABEL_18:
  if (a4) {
    *a4 = v13;
  }
  if (a3)
  {
    if (v14) {
      CFTypeRef v17 = CFRetain(v14);
    }
    else {
      CFTypeRef v17 = 0;
    }
    *a3 = v17;
  }

  if (v14) {
    CFRelease(v14);
  }
  return v14 != 0;
}

- (CMTime)frameDuration
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(void *)&self->timescale
                                                                                      + 32);
  return self;
}

- (void)setFrameDuration:(id *)a3
{
  videoComposition = self->_videoComposition;
  long long v4 = *(_OWORD *)&a3->var0;
  videoComposition->frameDuration.epoch = a3->var3;
  *(_OWORD *)&videoComposition->frameDuration.value = v4;
}

- (CMPersistentTrackID)sourceTrackIDForFrameTiming
{
  return self->_videoComposition->sourceTrackIDForFrameTiming;
}

- (void)setSourceTrackIDForFrameTiming:(int)a3
{
  self->_videoComposition->sourceTrackIDForFrameTiming = a3;
}

- (CGSize)renderSize
{
  videoComposition = self->_videoComposition;
  double width = videoComposition->renderSize.width;
  double height = videoComposition->renderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setRenderSize:(CGSize)a3
{
  self->_videoComposition->renderSize = a3;
}

- (float)renderScale
{
  return self->_videoComposition->renderScale;
}

- (void)setRenderScale:(float)a3
{
  self->_videoComposition->renderScale = a3;
}

- (NSArray)instructions
{
  return self->_videoComposition->instructions;
}

- (void)setInstructions:(id)a3
{
  instructions = self->_videoComposition->instructions;
  if (instructions != a3)
  {

    self->_videoComposition->instructions = (NSArray *)[a3 copy];
  }
}

- (BOOL)_hasLayerAsAuxiliaryTrack
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _hasLayerAsAuxiliaryTrack];
}

- (id)_auxiliaryTrackLayer
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _auxiliaryTrackLayer];
}

- (int)_auxiliaryTrackID
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _auxiliaryTrackID];
}

- (BOOL)_hasPostProcessingLayers
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _hasPostProcessingLayers];
}

- (id)_postProcessingVideoLayer
{
  id v2 = [(AVVideoComposition *)self _postProcessingVideoLayers];
  return (id)[v2 firstObject];
}

- (id)_postProcessingVideoLayers
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _postProcessingVideoLayers];
}

- (id)_postProcessingRootLayer
{
  return [(AVVideoCompositionCoreAnimationTool *)self->_videoComposition->animationTool _postProcessingRootLayer];
}

- (AVVideoCompositionCoreAnimationTool)animationTool
{
  return self->_videoComposition->animationTool;
}

- (void)setAnimationTool:(id)a3
{
  id v5 = a3;

  self->_videoComposition->animationTool = (AVVideoCompositionCoreAnimationTool *)a3;
}

- (NSArray)sourceSampleDataTrackIDs
{
  return self->_videoComposition->sourceSampleDataTracks;
}

- (void)setSourceSampleDataTrackIDs:(id)a3
{
  self->_videoComposition->sourceSampleDataTracks = (NSArray *)[a3 copy];
}

- (id)sourceVideoTrackWindowsForTrackIDs
{
  return self->_videoComposition->sourceVideoTrackWindowsForTrackIDs;
}

- (void)setSourceVideoTrackWindowsForTrackIDs:(id)a3
{
  sourceVideoTrackWindowsForTrackIDs = self->_videoComposition->sourceVideoTrackWindowsForTrackIDs;
  if (sourceVideoTrackWindowsForTrackIDs != a3)
  {

    self->_videoComposition->sourceVideoTrackWindowsForTrackIDs = (NSDictionary *)[a3 copy];
  }
}

- (id)sourceSampleDataTrackWindowsForTrackIDs
{
  return self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs;
}

- (void)setSourceSampleDataTrackWindowsForTrackIDs:(id)a3
{
  sourceSampleDataTrackWindowsForTrackIDs = self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs;
  if (sourceSampleDataTrackWindowsForTrackIDs != a3)
  {

    self->_videoComposition->sourceSampleDataTrackWindowsForTrackIDs = (NSDictionary *)[a3 copy];
  }
}

- (id)_serializableInstructions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSArray *)self->_videoComposition->instructions count];
  v22 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:v3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  obj = self->_videoComposition->instructions;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    int v6 = 1;
    uint64_t v21 = *(void *)v27;
    do
    {
      uint64_t v7 = 0;
      uint64_t v20 = v6;
      do
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v26 + 1) + 8 * v7);
        if ([(AVVideoComposition *)self customVideoCompositorClass])
        {
          memset(&v25, 0, sizeof(v25));
          if (v8) {
            [v8 timeRange];
          }
          uint64_t v9 = (void *)MEMORY[0x1E4F1CA60];
          *(_OWORD *)&range.start.value = *(_OWORD *)&v25.start.value;
          range.start.epoch = v25.start.epoch;
          CFDictionaryRef v10 = NSDictionaryFromCMTime(&range.start);
          CMTimeRange range = v25;
          CMTimeRangeGetEnd(&v24, &range);
          CFDictionaryRef v11 = NSDictionaryFromCMTime(&v24);
          uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v8, "enablePostProcessing"));
          uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v8, "containsTweening"));
          long long v14 = objc_msgSend(v9, "dictionaryWithObjectsAndKeys:", v10, @"StartTime", v11, @"EndTime", v12, @"EnablePostProcessing", v13, @"ContainsTweening", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:", v20 + v7), @"InstructionIdentifier", 0);
          uint64_t v15 = [v8 requiredSourceTrackIDs];
          if (v15) {
            [v14 setObject:v15 forKey:@"RequiredVideoTrackIDArray"];
          }
          uint64_t v16 = [v8 passthroughTrackID];
          if (v16) {
            objc_msgSend(v14, "setObject:forKey:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", v16), @"PassthroughSourceVideoTrackID");
          }
          if (objc_opt_respondsToSelector())
          {
            uint64_t v17 = [v8 requiredSourceSampleDataTrackIDs];
            if (v17) {
              [v14 setObject:v17 forKey:@"RequiredSampleDataTrackIDArray"];
            }
          }
        }
        else
        {
          long long v14 = (void *)[v8 dictionaryRepresentation];
        }
        [v22 addObject:v14];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      int v6 = v20 + v7;
    }
    while (v5);
  }
  return v22;
}

- (id)instructionForFigInstruction:(void *)a3
{
  if (![(NSArray *)self->_videoComposition->instructions count]) {
    return 0;
  }
  int v5 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"InstructionIdentifier"), "intValue") - 1;
  if ([(NSArray *)self->_videoComposition->instructions count] <= v5) {
    return 0;
  }
  instructions = self->_videoComposition->instructions;
  return [(NSArray *)instructions objectAtIndex:v5];
}

- (BOOL)_isValidReturningExceptionReason:(id *)a3
{
  videoComposition = self->_videoComposition;
  if (videoComposition->renderSize.width <= 0.0 || videoComposition->renderSize.height <= 0.0)
  {
    BOOL result = 0;
    BOOL v8 = @"video composition must have a positive renderSize";
  }
  else if (videoComposition->renderScale <= 0.0)
  {
    BOOL result = 0;
    BOOL v8 = @"video composition must have a positive renderScale";
  }
  else if ((videoComposition->frameDuration.flags & 1) != 0 {
         && (CMTime time1 = (CMTime)videoComposition->frameDuration,
  }
             CMTime v9 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48],
             CMTimeCompare(&time1, &v9) >= 1))
  {
    int sourceTrackIDForFrameTiming = self->_videoComposition->sourceTrackIDForFrameTiming;
    BOOL result = sourceTrackIDForFrameTiming >= 0;
    if (sourceTrackIDForFrameTiming < 0) {
      BOOL v8 = @"video composition must have a positive sourceTrackIDForFrameTiming";
    }
    else {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL result = 0;
    BOOL v8 = @"video composition must have a positive frameDuration";
  }
  if (a3) {
    *a3 = v8;
  }
  return result;
}

- (BOOL)isValidForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate
{
  CMTime v9 = [(AVAsset *)asset tracks];
  if (asset) {
    [(AVAsset *)asset duration];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  long long v10 = *(_OWORD *)&timeRange->start.epoch;
  v12[0] = *(_OWORD *)&timeRange->start.value;
  v12[1] = v10;
  v12[2] = *(_OWORD *)&timeRange->duration.timescale;
  return [(AVVideoComposition *)self isValidForTracks:v9 assetDuration:v13 timeRange:v12 validationDelegate:validationDelegate];
}

- (id)_trackWithTrackID:(int)a3 inTracks:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v6 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (!v6) {
    return 0;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v13;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v13 != v8) {
      objc_enumerationMutation(a4);
    }
    long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
    if ([v10 trackID] == a3) {
      return v10;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [a4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        goto LABEL_3;
      }
      return 0;
    }
  }
}

- (BOOL)isValidForTracks:(id)a3 assetDuration:(id *)a4 timeRange:(id *)a5 validationDelegate:(id)a6
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  uint64_t v11 = [a3 countByEnumeratingWithState:&v93 objects:v100 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v94;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v94 != v14) {
          objc_enumerationMutation(a3);
        }
        uint64_t v16 = [*(id *)(*((void *)&v93 + 1) + 8 * i) asset];
        if (v13)
        {
          if (v16 != v13)
          {
            v51 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"Tracks must be from the same asset", v17, v18, v19, v20, v21, v52), 0 reason userInfo];
            objc_exception_throw(v51);
          }
        }
        else
        {
          uint64_t v13 = v16;
        }
      }
      uint64_t v12 = [a3 countByEnumeratingWithState:&v93 objects:v100 count:16];
    }
    while (v12);
  }
  else
  {
    uint64_t v13 = 0;
  }
  char v22 = objc_opt_respondsToSelector();
  id v23 = [(AVVideoComposition *)self customVideoCompositorClass];
  if (v23 && ([v23 conformsToProtocol:&unk_1EE618508] & 1) == 0)
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      BOOL v24 = 0;
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"customVideoCompositorClass"])return v24; {
    }
      }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 1;
  }
  videoComposition = self->_videoComposition;
  if (videoComposition->renderSize.width <= 0.0 || videoComposition->renderSize.height <= 0.0)
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"renderSize"])return 0; {
      BOOL v24 = 0;
      }
      videoComposition = self->_videoComposition;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  if (videoComposition->renderScale <= 0.0)
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"renderScale"])return 0; {
      BOOL v24 = 0;
      }
      videoComposition = self->_videoComposition;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  if ((videoComposition->frameDuration.flags & 1) == 0
    || (*(_OWORD *)&time1.start.value = *(_OWORD *)&videoComposition->frameDuration.value,
        time1.start.epoch = videoComposition->frameDuration.epoch,
        *(_OWORD *)&time2.start.value = *MEMORY[0x1E4F1FA48],
        time2.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
        CMTimeCompare(&time1.start, &time2.start) <= 0))
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      BOOL v24 = 0;
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"frameDuration"])return v24; {
    }
      }
    else
    {
      BOOL v24 = 0;
    }
  }
  uint64_t sourceTrackIDForFrameTiming = self->_videoComposition->sourceTrackIDForFrameTiming;
  if (sourceTrackIDForFrameTiming
    && ![(AVVideoComposition *)self _trackWithTrackID:sourceTrackIDForFrameTiming inTracks:a3])
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      BOOL v24 = 0;
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"sourceTrackIDForFrameTiming"])return v24; {
    }
      }
    else
    {
      BOOL v24 = 0;
    }
  }
  if (![(NSArray *)self->_videoComposition->instructions count])
  {
    if (!a6) {
      return 0;
    }
    if (v22)
    {
      BOOL v24 = 0;
      if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"instructions"])return v24; {
    }
      }
    else
    {
      BOOL v24 = 0;
    }
  }
  if ((a5->var0.var2 & 1) != 0
    && (a5->var1.var2 & 1) != 0
    && !a5->var1.var3
    && (a5->var1.var0 & 0x8000000000000000) == 0)
  {
    long long v27 = *(_OWORD *)&a5->var0.var3;
    CMTime var0 = (CMTime)a5->var0;
    memset(&v91, 0, sizeof(v91));
    long long v28 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&time1.start.value = *(_OWORD *)&a5->var0.var0;
    *(_OWORD *)&time1.start.epoch = v27;
    *(_OWORD *)&time1.duration.timescale = v28;
    CMTimeRangeGetEnd(&v91, &time1);
    unsigned __int8 v56 = objc_opt_respondsToSelector();
    char v29 = objc_opt_respondsToSelector();
    char v62 = objc_opt_respondsToSelector();
    CMTime start = var0;
    long long v85 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    long long v88 = 0u;
    obuint64_t j = self->_videoComposition->instructions;
    uint64_t v60 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v99 count:16];
    if (!v60) {
      goto LABEL_121;
    }
    uint64_t v57 = 0;
    uint64_t v61 = *(void *)v86;
    p_CMTime duration = &time2.duration;
    char v54 = v29;
    char v55 = v22;
    while (1)
    {
      uint64_t v30 = 0;
      do
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(obj);
        }
        uint64_t v63 = v30;
        uint64_t v31 = *(void **)(*((void *)&v85 + 1) + 8 * v30);
        memset(&time1, 0, sizeof(time1));
        if (v31)
        {
          [v31 timeRange];
          if ((time1.start.flags & 1) != 0
            && (time1.duration.flags & 1) != 0
            && !time1.duration.epoch
            && (time1.duration.value & 0x8000000000000000) == 0)
          {
            CMTimeRange range = time1;
            memset(&time2, 0, sizeof(time2));
            long long v32 = *(_OWORD *)&a5->var0.var3;
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)&a5->var0.var0;
            *(_OWORD *)&otherRange.start.epoch = v32;
            *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&a5->var1.var1;
            CMTimeRangeGetIntersection(&time2, &range, &otherRange);
            if ((time2.start.flags & 1) == 0
              || (time2.duration.flags & 1) == 0
              || time2.duration.epoch
              || time2.duration.value < 0
              || (*(_OWORD *)&range.start.value = *(_OWORD *)&p_duration->value,
                  range.start.epoch = p_duration->epoch,
                  *(_OWORD *)&otherRange.start.value = *MEMORY[0x1E4F1FA48],
                  otherRange.start.epoch = *(void *)(MEMORY[0x1E4F1FA48] + 16),
                  CMTimeCompare(&range.start, &otherRange.start) <= 0))
            {
              CMTimeRange range = time1;
              otherRange.CMTime start = var0;
              if (!CMTimeRangeContainsTime(&range, &otherRange.start))
              {
                *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
                range.start.epoch = time1.start.epoch;
                otherRange.CMTime start = v91;
                if (CMTimeCompare(&range.start, &otherRange.start)) {
                  goto LABEL_109;
                }
              }
            }
            *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
            range.start.epoch = time1.start.epoch;
            otherRange.CMTime start = start;
            if (CMTimeCompare(&range.start, &otherRange.start) >= 1)
            {
              memset(&range, 0, sizeof(range));
              *(_OWORD *)&otherRange.start.value = *(_OWORD *)&time1.start.value;
              otherRange.start.epoch = time1.start.epoch;
              CMTime rhs = start;
              CMTimeSubtract(&duration, &otherRange.start, &rhs);
              otherRange.CMTime start = start;
              CMTimeRangeMake(&range, &otherRange.start, &duration);
              if (!a6) {
                return 0;
              }
              if (v56)
              {
                CMTimeRange otherRange = range;
                if (([a6 videoComposition:self shouldContinueValidatingAfterFindingEmptyTimeRange:&otherRange] & 1) == 0)return 0; {
              }
                }
              goto LABEL_69;
            }
            if (v57 >= 1)
            {
              *(_OWORD *)&range.start.value = *(_OWORD *)&time1.start.value;
              range.start.epoch = time1.start.epoch;
              otherRange.CMTime start = start;
              if (CMTimeCompare(&range.start, &otherRange.start) < 0)
              {
                if (!a6
                  || (v29 & 1) != 0
                  && ![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:v31])
                {
                  return 0;
                }
LABEL_69:
                BOOL v24 = 0;
              }
            }
            memset(&range, 0, 24);
            objc_msgSend(v31, "timeRange", p_duration);
            CMTimeRangeGetEnd(&range.start, &v79);
            *(_OWORD *)&otherRange.start.value = *(_OWORD *)&range.start.value;
            otherRange.start.epoch = range.start.epoch;
            CMTime rhs = start;
            if (CMTimeCompare(&otherRange.start, &rhs) >= 1) {
              CMTime start = range.start;
            }
            if (v13)
            {
              v33 = (void *)[v31 requiredSourceTrackIDs];
              long long v75 = 0u;
              long long v76 = 0u;
              long long v77 = 0u;
              long long v78 = 0u;
              id v64 = v33;
              uint64_t v68 = [v33 countByEnumeratingWithState:&v75 objects:v98 count:16];
              if (v68)
              {
                v59 = v31;
                v66 = a4;
                uint64_t v67 = *(void *)v76;
                do
                {
                  for (uint64_t j = 0; j != v68; ++j)
                  {
                    if (*(void *)v76 != v67) {
                      objc_enumerationMutation(v64);
                    }
                    uint64_t v35 = [*(id *)(*((void *)&v75 + 1) + 8 * j) intValue];
                    animationTool = self->_videoComposition->animationTool;
                    if (!animationTool
                      || ((int v37 = [(AVVideoCompositionCoreAnimationTool *)animationTool _auxiliaryTrackID]) != 0? (v38 = v35 == v37): (v38 = 0), !v38))
                    {
                      id v39 = [(AVVideoComposition *)self _trackWithTrackID:v35 inTracks:a3];
                      v40 = (void *)[v39 mediaType];
                      if (!v39
                        || (v41 = v40, ([v40 isEqualToString:@"vide"] & 1) == 0)
                        && ([v41 isEqualToString:@"auxv"] & 1) == 0
                        && ([v41 isEqualToString:@"scen"] & 1) == 0)
                      {
                        if (!a6) {
                          return 0;
                        }
                        if (v62)
                        {
                          objc_opt_class();
                          if (objc_opt_isKindOfClass())
                          {
                            v42 = (void *)[v59 layerInstructions];
                            long long v71 = 0u;
                            long long v72 = 0u;
                            long long v73 = 0u;
                            long long v74 = 0u;
                            id v65 = v42;
                            uint64_t v43 = [v42 countByEnumeratingWithState:&v71 objects:v97 count:16];
                            if (v43)
                            {
                              uint64_t v44 = v43;
                              uint64_t v45 = *(void *)v72;
LABEL_92:
                              uint64_t v46 = 0;
                              while (1)
                              {
                                if (*(void *)v72 != v45) {
                                  objc_enumerationMutation(v65);
                                }
                                v47 = *(void **)(*((void *)&v71 + 1) + 8 * v46);
                                if (v35 == [v47 trackID]) {
                                  break;
                                }
                                if (v44 == ++v46)
                                {
                                  uint64_t v44 = [v65 countByEnumeratingWithState:&v71 objects:v97 count:16];
                                  BOOL v24 = 0;
                                  if (v44) {
                                    goto LABEL_92;
                                  }
                                  goto LABEL_102;
                                }
                              }
                              if (v47
                                && ![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidTrackIDInInstruction:v59 layerInstruction:v47 asset:v13])
                              {
                                return 0;
                              }
                            }
                          }
                        }
                        BOOL v24 = 0;
                      }
                    }
LABEL_102:
                    a4 = v66;
                  }
                  uint64_t v68 = [v64 countByEnumeratingWithState:&v75 objects:v98 count:16];
                }
                while (v68);
              }
            }
            ++v57;
            char v29 = v54;
            char v22 = v55;
            goto LABEL_109;
          }
        }
        if (!a6
          || (v29 & 1) != 0
          && ([a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidTimeRangeInInstruction:v31] & 1) == 0)
        {
          return 0;
        }
        BOOL v24 = 0;
LABEL_109:
        uint64_t v30 = v63 + 1;
      }
      while (v63 + 1 != v60);
      uint64_t v48 = [(NSArray *)obj countByEnumeratingWithState:&v85 objects:v99 count:16];
      uint64_t v60 = v48;
      if (!v48)
      {
        if (v57) {
          goto LABEL_136;
        }
LABEL_121:
        if (!a6) {
          return 0;
        }
        if (v22)
        {
          BOOL v24 = 0;
          if (![a6 videoComposition:self shouldContinueValidatingAfterFindingInvalidValueForKey:@"instructions"])return v24; {
        }
          }
        else
        {
          BOOL v24 = 0;
        }
LABEL_136:
        char flags = v91.flags;
        if ((v91.flags & 0x1D) != 1)
        {
          CMTime v91 = (CMTime)*a4;
          char flags = v91.flags;
        }
        if ((flags & 0x1D) == 1)
        {
          time1.CMTime start = start;
          time2.CMTime start = v91;
          if (CMTimeCompare(&time1.start, &time2.start) < 0)
          {
            memset(&time1, 0, sizeof(time1));
            time2.CMTime start = v91;
            range.CMTime start = start;
            CMTimeSubtract(&v70, &time2.start, &range.start);
            time2.CMTime start = start;
            CMTimeRangeMake(&time1, &time2.start, &v70);
            if (((a6 != 0) & v56) == 1)
            {
              CMTimeRange time2 = time1;
              [a6 videoComposition:self shouldContinueValidatingAfterFindingEmptyTimeRange:&time2];
            }
            return 0;
          }
        }
        return v24;
      }
    }
  }
  return v24;
}

- (void)determineValidityForAsset:(AVAsset *)asset timeRange:(CMTimeRange *)timeRange validationDelegate:(id)validationDelegate completionHandler:(void *)completionHandler
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __95__AVVideoComposition_determineValidityForAsset_timeRange_validationDelegate_completionHandler___block_invoke;
  v7[3] = &unk_1E57B47B8;
  v7[4] = self;
  v7[5] = asset;
  long long v6 = *(_OWORD *)&timeRange->start.epoch;
  long long v8 = *(_OWORD *)&timeRange->start.value;
  long long v9 = v6;
  long long v10 = *(_OWORD *)&timeRange->duration.timescale;
  v7[6] = validationDelegate;
  v7[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1EE5E1A88, (uint64_t)v7);
}

uint64_t __95__AVVideoComposition_determineValidityForAsset_timeRange_validationDelegate_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    NSUInteger v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    long long v6 = *(_OWORD *)(a1 + 80);
    v8[0] = *(_OWORD *)(a1 + 64);
    v8[1] = v6;
    v8[2] = *(_OWORD *)(a1 + 96);
    [v3 isValidForAsset:v4 timeRange:v8 validationDelegate:v5];
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (void)_setFrameDurationForFrameRate:(float)a3 sourceTrackIDForFrameTiming:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (a3 == 0.0)
  {
    CMTimeMake(&v10, 1, 30);
    CMTime v9 = v10;
    long long v6 = &v9;
  }
  else
  {
    CMTimeMakeWithSeconds(&v8, 1.0 / a3, 90000);
    CMTime v7 = v8;
    long long v6 = &v7;
  }
  -[AVVideoComposition setFrameDuration:](self, "setFrameDuration:", v6, *(_OWORD *)&v7.value, v7.epoch);
  if (dyld_program_sdk_at_least()) {
    [(AVVideoComposition *)self setSourceTrackIDForFrameTiming:v4];
  }
}

- (void)setColorPrimaries:(id)a3
{
  colorPrimaries = self->_videoComposition->colorPrimaries;
  if (colorPrimaries != a3)
  {

    self->_videoComposition->colorPrimaries = (NSString *)[a3 copy];
  }
}

- (void)setColorYCbCrMatrix:(id)a3
{
  colorYCbCrMatrix = self->_videoComposition->colorYCbCrMatrix;
  if (colorYCbCrMatrix != a3)
  {

    self->_videoComposition->colorYCbCrMatrix = (NSString *)[a3 copy];
  }
}

- (void)setColorTransferFunction:(id)a3
{
  colorTransferFunction = self->_videoComposition->colorTransferFunction;
  if (colorTransferFunction != a3)
  {

    self->_videoComposition->colorTransferFunction = (NSString *)[a3 copy];
  }
}

- (void)setPerFrameHDRDisplayMetadataPolicy:(id)a3
{
  perFrameHDRDisplayMetadataPolicy = self->_videoComposition->perFrameHDRDisplayMetadataPolicy;
  if (perFrameHDRDisplayMetadataPolicy != a3)
  {

    self->_videoComposition->perFrameHDRDisplayMetadataPolicy = (NSString *)[a3 copy];
  }
}

- (NSString)colorPrimaries
{
  return self->_videoComposition->colorPrimaries;
}

- (NSString)colorYCbCrMatrix
{
  return self->_videoComposition->colorYCbCrMatrix;
}

- (NSString)colorTransferFunction
{
  return self->_videoComposition->colorTransferFunction;
}

- (AVVideoCompositionPerFrameHDRDisplayMetadataPolicy)perFrameHDRDisplayMetadataPolicy
{
  return self->_videoComposition->perFrameHDRDisplayMetadataPolicy;
}

- (void)videoCompositionOutputColorPropertiesWithCustomCompositor:(id)a3 formatDescriptions:(id)a4 colorPrimaries:(id *)a5 transferFunction:(id *)a6 yCbCrMatrix:(id *)a7 perFrameHDRDisplayMetadataPolicy:(id *)a8
{
  uint64_t v13 = [(AVVideoComposition *)self colorPrimaries];
  uint64_t v14 = [(AVVideoComposition *)self colorTransferFunction];
  long long v15 = [(AVVideoComposition *)self colorYCbCrMatrix];
  uint64_t v20 = [(AVVideoComposition *)self perFrameHDRDisplayMetadataPolicy];
  if (a3)
  {
    [a3 supportsWideColorSourceFrames];
    [a3 supportsHDRSourceFrames];
  }
  CMFormatDescriptionGetWidestGamutAndLargestDynamicRangeColorPropertiesFromFormatDescriptions();
  if (v13) {
    uint64_t v16 = (__CFString *)v13;
  }
  else {
    uint64_t v16 = 0;
  }
  if (v14) {
    uint64_t v17 = (__CFString *)v14;
  }
  else {
    uint64_t v17 = 0;
  }
  if (v15) {
    uint64_t v18 = (__CFString *)v15;
  }
  else {
    uint64_t v18 = 0;
  }
  if ([(AVVideoComposition *)self animationTool]
    && ![(AVVideoCompositionCoreAnimationTool *)[(AVVideoComposition *)self animationTool] _auxiliaryTrackID])
  {
    uint64_t v19 = a5;
    if (([(__CFString *)v17 isEqualToString:@"ITU_R_2100_HLG"] & 1) != 0
      || ([(__CFString *)v17 isEqualToString:@"SMPTE_ST_2084_PQ"] & 1) != 0
      || [(__CFString *)v17 isEqualToString:@"Linear"])
    {
      uint64_t v16 = @"ITU_R_709_2";
      uint64_t v17 = @"ITU_R_709_2";
      uint64_t v18 = @"ITU_R_709_2";
    }
  }
  else
  {
    uint64_t v19 = a5;
  }
  if (v19) {
    *uint64_t v19 = v16;
  }
  if (a6) {
    *a6 = v17;
  }
  if (a7) {
    *a7 = v18;
  }
  if (a8) {
    *a8 = v20;
  }
}

+ (id)_mutableVideoCompositionWithAsset:(id)a3 applyingCIFiltersWithHandler:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v6 = (void *)[a3 tracksWithMediaType:@"vide"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:&start count:16];
  if (!v7) {
    return 0;
  }
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)v31;
LABEL_3:
  uint64_t v10 = 0;
  while (1)
  {
    if (*(void *)v31 != v9) {
      objc_enumerationMutation(v6);
    }
    uint64_t v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
    if ([v11 isEnabled]) {
      break;
    }
    if (v8 == ++v10)
    {
      uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:&start count:16];
      if (v8) {
        goto LABEL_3;
      }
      return 0;
    }
  }
  if (!v11) {
    return 0;
  }
  uint64_t v13 = [AVCoreImageFilterVideoCompositionInstruction alloc];
  if (a3) {
    [a3 duration];
  }
  else {
    memset(&duration, 0, sizeof(duration));
  }
  CMTime start = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CMTimeRangeMake(&v29, &start, &duration);
  uint64_t v35 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInt:", objc_msgSend(v11, "trackID"));
  uint64_t v14 = -[AVCoreImageFilterVideoCompositionInstruction initWithTimeRange:sourceTrackIDs:handler:](v13, "initWithTimeRange:sourceTrackIDs:handler:", &v29, [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1], a4);
  [v11 preferredTransform];
  *(_OWORD *)long long v27 = *(_OWORD *)&v27[7];
  *(_OWORD *)&v27[2] = *(_OWORD *)&v27[9];
  *(_OWORD *)&v27[4] = *(_OWORD *)&v27[11];
  [(AVCoreImageFilterVideoCompositionInstruction *)v14 setSourceTrackPreferredTransform:v27];
  uint64_t v12 = +[AVMutableVideoComposition videoCompositionWithPropertiesOfAsset:a3];
  [(AVMutableVideoComposition *)v12 setCustomVideoCompositorClass:objc_opt_class()];
  v34 = v14;
  -[AVMutableVideoComposition setInstructions:](v12, "setInstructions:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1]);
  [v11 naturalSize];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  [v11 preferredTransform];
  v38.origin.x = 0.0;
  v38.origin.y = 0.0;
  v38.size.double width = v16;
  v38.size.double height = v18;
  CGRect v39 = CGRectApplyAffineTransform(v38, &v26);
  double width = v39.size.width;
  double height = v39.size.height;
  objc_msgSend(v11, "nominalFrameRate", v39.origin.x, v39.origin.y);
  int v22 = v21;
  uint64_t v23 = [v11 trackID];
  LODWORD(v24) = v22;
  [(AVVideoComposition *)v12 _setFrameDurationForFrameRate:v23 sourceTrackIDForFrameTiming:v24];
  -[AVMutableVideoComposition setRenderSize:](v12, "setRenderSize:", width, height);
  return v12;
}

+ (AVVideoComposition)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier
{
  if (!asset)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = "asset";
    goto LABEL_8;
  }
  if (!applier)
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v11 = *MEMORY[0x1E4F1C3C8];
    uint64_t v12 = "handler";
LABEL_8:
    uint64_t v13 = (void *)[v10 exceptionWithName:v11, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)applier, v4, v5, v6, v7, (uint64_t)v12), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(a1, "_mutableVideoCompositionWithAsset:applyingCIFiltersWithHandler:"), "copy");
  return (AVVideoComposition *)v8;
}

+ (void)videoCompositionWithAsset:(AVAsset *)asset applyingCIFiltersWithHandler:(void *)applier completionHandler:(void *)completionHandler
{
  if (!asset)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "asset != nil";
    goto LABEL_8;
  }
  if (!applier)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "applier != nil";
    goto LABEL_8;
  }
  if (!completionHandler)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v9 = *MEMORY[0x1E4F1C3C8];
    uint64_t v10 = "completionHandler != nil";
LABEL_8:
    uint64_t v11 = (void *)[v8 exceptionWithName:v9, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)a1, a2, @"invalid parameter not satisfying: %s", (uint64_t)applier, (uint64_t)completionHandler, v5, v6, v7, (uint64_t)v10), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __124__AVVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke;
  _OWORD v12[3] = &unk_1E57B47E0;
  v12[4] = a1;
  v12[5] = asset;
  v12[6] = applier;
  v12[7] = completionHandler;
  AVLoadValuesAsynchronously(asset, (uint64_t)&unk_1EE5E1AA0, (uint64_t)v12);
}

uint64_t __124__AVVideoComposition_AVVideoCompositionFiltering__videoCompositionWithAsset_applyingCIFiltersWithHandler_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (!a2) {
    [*(id *)(a1 + 32) videoCompositionWithAsset:*(void *)(a1 + 40) applyingCIFiltersWithHandler:*(void *)(a1 + 48)];
  }
  NSUInteger v3 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v3();
}

@end