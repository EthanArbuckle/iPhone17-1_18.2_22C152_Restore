@interface JFXComposition
+ (Class)instructionBuilderClass;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration;
- ($70930193D4F448A53BB9343C0237EB5F)compositionItemsForState:(SEL)a3 compositionItem:(id)a4 backfillCompositionItem:(id *)a5;
- ($70930193D4F448A53BB9343C0237EB5F)timeRangeForClip:(SEL)a3;
- (AVMutableAudioMix)audioMix;
- (AVMutableComposition)avComposition;
- (AVMutableVideoComposition)videoComposition;
- (AVPlayerItem)avPlayerItem;
- (AVPlayerItem)playerItem;
- (BOOL)CARenderingRequiredForClip:(id)a3;
- (BOOL)JFX_hasEffectThatRequiresCustomRendering;
- (BOOL)JFX_isContigousSplitClip:(id)a3 nextClip:(id)a4;
- (BOOL)emptySegments:(id)a3;
- (BOOL)needsUpdate;
- (BOOL)removeTrackIfEmpty:(id)a3;
- (BOOL)validate;
- (CGAffineTransform)clipTransform:(SEL)a3;
- (CGSize)previousRenderSize;
- (CGSize)viewSize;
- (JFXComposition)initWithClipsDataSource:(id)a3;
- (JFXCompositionPlayableElementsDataSource)clipsDataSource;
- (JFXCompositionTrackGroup)trackGroupA;
- (JFXCompositionTrackGroup)trackGroupB;
- (JFXPlayableElement)liveTransformClip;
- (NSMapTable)clipCustomRendererMap;
- (NSMapTable)clipFaceTrackingPlaybackDelegates;
- (NSMutableArray)audioMixParameters;
- (NSMutableArray)videoCompositionInstructions;
- (NSMutableDictionary)assetsUsed;
- (PVColorSpace)compositionOutputColorSpace;
- (PVTransformAnimationInfo)liveCompositionTransform;
- (float)JFX_preferredRenderScale;
- (float)globalAudioVolume;
- (float)volumeForClip:(id)a3;
- (id)AVComposition;
- (id)animojiCustomRendererPropsForClip:(id)a3 currentCustomProperties:(id)a4 sharedMediaDataReaderManager:(id)a5;
- (id)buildClipList;
- (id)dissolveGraphNode:(id *)a3 from:(id)a4 to:(id)a5;
- (id)instructionToHideTrackID:(int)a3 whileHidingTrackID:(int)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6;
- (id)instructionToShowClip:(id)a3 withTrackID:(int)a4 withTransform:(CGAffineTransform *)a5 timeRange:(id *)a6 requiresCARendering:(BOOL)a7;
- (id)instructionToShowImageWithClip:(id)a3 withTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6;
- (id)newInstructionGraphNodeForClip:(id)a3 clipTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 requiresTweening:(BOOL *)a6 isContainedClip:(BOOL)a7;
- (id)updateVideoAndAudioInstructionForState:(id)a3 previousInstructions:(id)a4 waitingForResource:(BOOL)a5;
- (int)outputFrameRate;
- (int64_t)backgroundAudioTrackCount;
- (int64_t)foregroundAudioTrackCount;
- (unsigned)parentCode;
- (void)CFX_updateFaceTrackingPlaybackDelegateForClip:(id)a3 sharedMediaDataReaderManager:(id)a4;
- (void)JFX_applyPropertiesForCustomVideoCompositor:(id)a3;
- (void)JFX_finalizeVideoComposition;
- (void)JFX_setScrubbingModeForPlaybackDelegates:(BOOL)a3;
- (void)JFX_updateFaceTrackPropertiesForEffectsAtTime:(id *)a3;
- (void)JFX_updatePlaybackDelegatesForClip:(id)a3;
- (void)addBackTracksIfRemoved;
- (void)applyExportProperties;
- (void)applyPlayerItemProperties;
- (void)assetUsed:(id)a3;
- (void)burnInPlaybackSettings:(id)a3;
- (void)clearPlayerItemProperties;
- (void)dealloc;
- (void)markDirty;
- (void)noteEffectChangeForClip:(id)a3;
- (void)notifyNeedsEffectPropertiesUpdatedForPlaybackTime:(id *)a3;
- (void)notifyPlaybackDidStopAtTime:(id *)a3;
- (void)notifyPlaybackWillBegin;
- (void)playerItemDidReachEnd:(id)a3;
- (void)rebuildCompositionInstructionsForVideoStillTitleCard:(id)a3;
- (void)refreshAVComposition;
- (void)removeEmptyTracks;
- (void)removeTrackFromAudioMix:(int)a3;
- (void)setAssetsUsed:(id)a3;
- (void)setAudioMix:(id)a3;
- (void)setAudioMixParameters:(id)a3;
- (void)setAvComposition:(id)a3;
- (void)setAvPlayerItem:(id)a3;
- (void)setBackgroundAudioTrackCount:(int64_t)a3;
- (void)setClipCustomRendererMap:(id)a3;
- (void)setClipFaceTrackingPlaybackDelegates:(id)a3;
- (void)setClipsDataSource:(id)a3;
- (void)setDuration:(id *)a3;
- (void)setForegroundAudioTrackCount:(int64_t)a3;
- (void)setGlobalAudioVolume:(float)a3;
- (void)setLiveCompositionTransform:(PVTransformAnimationInfo *)a3;
- (void)setLiveTransformClip:(id)a3;
- (void)setNeedsUpdate:(BOOL)a3;
- (void)setParentCode:(unsigned int)a3;
- (void)setPlayerItem:(id)a3;
- (void)setPreviousRenderSize:(CGSize)a3;
- (void)setRenderScale;
- (void)setTrackGroupA:(id)a3;
- (void)setTrackGroupB:(id)a3;
- (void)setVideoComposition:(id)a3;
- (void)setVideoCompositionInstructions:(id)a3;
- (void)setViewSize:(CGSize)a3;
- (void)update;
- (void)updateRenderSizeIfNeeded;
- (void)validate;
@end

@implementation JFXComposition

- (float)JFX_preferredRenderScale
{
  v3 = [(JFXComposition *)self clipsDataSource];
  char v4 = [v3 isExporting];

  BOOL v5 = [(JFXComposition *)self JFX_hasEffectThatRequiresCustomRendering];
  float v6 = 1.0;
  if ((v4 & 1) == 0 && !v5)
  {
    v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v8 = [v7 integerForKey:@"VideoScaling"];

    if ((unint64_t)(v8 - 1) <= 3) {
      float v6 = flt_234D61050[v8 - 1];
    }
    v9 = [MEMORY[0x263EFFA40] standardUserDefaults];
    uint64_t v10 = [v9 integerForKey:@"PVVideoCompositingContextProxyModeKey"];

    if (!v10)
    {
      [(JFXComposition *)self viewSize];
      double v12 = v11;
      double v14 = v13;
      v15 = [(JFXComposition *)self clipsDataSource];
      [v15 imageScale];
      double v17 = v12 * v16;
      [(JFXComposition *)self previousRenderSize];
      double v19 = v17 / v18;

      v20 = [(JFXComposition *)self clipsDataSource];
      [v20 imageScale];
      double v22 = v14 * v21;
      [(JFXComposition *)self previousRenderSize];
      double v24 = v22 / v23;

      if (v19 >= v24) {
        double v19 = v24;
      }
      if (v19 > 1.0)
      {
        v25 = [(JFXComposition *)self clipsDataSource];
        if ([v25 screenCanShow2160P])
        {
          v26 = [(JFXComposition *)self clipsDataSource];
          int v27 = [v26 use2160Pcontent:0];

          double v28 = fmin(v19, 2.0);
          if (v27) {
            double v19 = v28;
          }
          else {
            double v19 = 1.0;
          }
        }
        else
        {

          double v19 = 1.0;
        }
      }
      double v29 = 0.35;
      if (v19 > 0.35) {
        double v29 = v19;
      }
      return v29 * v6;
    }
  }
  return v6;
}

- (void)setRenderScale
{
  [(JFXComposition *)self JFX_preferredRenderScale];
  int v4 = v3;
  id v6 = [(JFXComposition *)self videoComposition];
  LODWORD(v5) = v4;
  [v6 setRenderScale:v5];
}

- (BOOL)JFX_hasEffectThatRequiresCustomRendering
{
  int v3 = [(JFXComposition *)self clipsDataSource];
  unint64_t v4 = [v3 count];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(JFXComposition *)self clipsDataSource];
  id v6 = [(id)v5 playableElementAtIndex:0];

  LOBYTE(v5) = [v6 hasPlayableEffectOfType:7];
  if (v5) {
    return 1;
  }
  uint64_t v8 = 1;
  do
  {
    unint64_t v9 = v8;
    if (v4 == v8) {
      break;
    }
    uint64_t v10 = [(JFXComposition *)self clipsDataSource];
    double v11 = [v10 playableElementAtIndex:v9];

    LODWORD(v10) = [v11 hasPlayableEffectOfType:7];
    uint64_t v8 = v9 + 1;
  }
  while (!v10);
  return v9 < v4;
}

- (JFXComposition)initWithClipsDataSource:(id)a3
{
  id v5 = a3;
  v67.receiver = self;
  v67.super_class = (Class)JFXComposition;
  id v6 = [(JFXComposition *)&v67 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_clipsDataSource, a3);
    [(JFXComposition *)v7 markDirty];
    id v8 = objc_alloc_init(MEMORY[0x263EFA788]);
    [(JFXComposition *)v7 setAvComposition:v8];

    id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(JFXComposition *)v7 setVideoCompositionInstructions:v9];

    id v10 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(JFXComposition *)v7 setAudioMixParameters:v10];

    double v11 = [JFXCompositionTrackGroup alloc];
    double v12 = [(JFXComposition *)v7 clipsDataSource];
    double v13 = -[JFXCompositionTrackGroup initWithLabel:timeScale:](v11, "initWithLabel:timeScale:", @"A", [v12 timeScale]);
    [(JFXComposition *)v7 setTrackGroupA:v13];

    double v14 = [(JFXComposition *)v7 avComposition];
    uint64_t v15 = *MEMORY[0x263EF9D48];
    double v16 = [v14 addMutableTrackWithMediaType:*MEMORY[0x263EF9D48] preferredTrackID:1];
    double v17 = [(JFXComposition *)v7 trackGroupA];
    [v17 setVideoTrack:v16];

    double v18 = [(JFXComposition *)v7 avComposition];
    uint64_t v19 = *MEMORY[0x263EF9CE8];
    v20 = [v18 addMutableTrackWithMediaType:*MEMORY[0x263EF9CE8] preferredTrackID:2];
    double v21 = [(JFXComposition *)v7 trackGroupA];
    [v21 setAudioTrack:v20];

    double v22 = [(JFXComposition *)v7 avComposition];
    double v23 = [(JFXComposition *)v7 trackGroupA];
    [v23 setComposition:v22];

    double v24 = [(JFXComposition *)v7 trackGroupA];
    long long v65 = *MEMORY[0x263F010E0];
    long long v51 = v65;
    uint64_t v66 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v25 = v66;
    [v24 setFadeOutStart:&v65];

    v26 = [(JFXComposition *)v7 trackGroupA];
    long long v63 = v51;
    uint64_t v64 = v25;
    [v26 setFadeOutDuration:&v63];

    int v27 = [JFXCompositionTrackGroup alloc];
    double v28 = [(JFXComposition *)v7 clipsDataSource];
    double v29 = -[JFXCompositionTrackGroup initWithLabel:timeScale:](v27, "initWithLabel:timeScale:", @"B", [v28 timeScale]);
    [(JFXComposition *)v7 setTrackGroupB:v29];

    v30 = [(JFXComposition *)v7 avComposition];
    v31 = [v30 addMutableTrackWithMediaType:v15 preferredTrackID:3];
    v32 = [(JFXComposition *)v7 trackGroupB];
    [v32 setVideoTrack:v31];

    v33 = [(JFXComposition *)v7 avComposition];
    v34 = [v33 addMutableTrackWithMediaType:v19 preferredTrackID:4];
    v35 = [(JFXComposition *)v7 trackGroupB];
    [v35 setAudioTrack:v34];

    v36 = [(JFXComposition *)v7 avComposition];
    v37 = [(JFXComposition *)v7 trackGroupB];
    [v37 setComposition:v36];

    v38 = [(JFXComposition *)v7 trackGroupB];
    long long v61 = v51;
    uint64_t v62 = v25;
    [v38 setFadeOutStart:&v61];

    v39 = [(JFXComposition *)v7 trackGroupB];
    long long v59 = v51;
    uint64_t v60 = v25;
    [v39 setFadeOutDuration:&v59];

    id v40 = objc_alloc_init(MEMORY[0x263EFA7A0]);
    [(JFXComposition *)v7 setVideoComposition:v40];

    id v41 = objc_alloc_init(MEMORY[0x263EFA778]);
    [(JFXComposition *)v7 setAudioMix:v41];

    LODWORD(v42) = 1.0;
    [(JFXComposition *)v7 setGlobalAudioVolume:v42];
    id v43 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(JFXComposition *)v7 setAssetsUsed:v43];

    v44 = [(JFXComposition *)v7 videoComposition];
    v45 = [(JFXComposition *)v7 clipsDataSource];
    CMTimeMake(&v58, 1, [v45 timeScale]);
    [v44 setFrameDuration:&v58];

    v7->_viewSize = (CGSize)*MEMORY[0x263F001B0];
    -[JFXComposition setPreviousRenderSize:](v7, "setPreviousRenderSize:", v7->_viewSize.width, v7->_viewSize.height);
    [(JFXComposition *)v7 markDirty];
    [(JFXComposition *)v7 setLiveTransformClip:0];
    PVTransformAnimationInfoIdentity();
    v52[0] = v54;
    v52[1] = v55;
    v52[2] = v56;
    uint64_t v53 = v57;
    [(JFXComposition *)v7 setLiveCompositionTransform:v52];
    uint64_t v46 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:2];
    clipCustomRendererMap = v7->_clipCustomRendererMap;
    v7->_clipCustomRendererMap = (NSMapTable *)v46;

    uint64_t v48 = [objc_alloc(MEMORY[0x263F08968]) initWithKeyOptions:0 valueOptions:0 capacity:2];
    clipFaceTrackingPlaybackDelegates = v7->_clipFaceTrackingPlaybackDelegates;
    v7->_clipFaceTrackingPlaybackDelegates = (NSMapTable *)v48;

    v7->_parentCode = -1;
  }

  return v7;
}

- (void)dealloc
{
  [(JFXComposition *)self setAudioMix:0];
  int v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFA050];
  id v5 = [(JFXComposition *)self avPlayerItem];
  [v3 removeObserver:self name:v4 object:v5];

  [(JFXComposition *)self setAvPlayerItem:0];
  [(JFXComposition *)self setAssetsUsed:0];
  v6.receiver = self;
  v6.super_class = (Class)JFXComposition;
  [(JFXComposition *)&v6 dealloc];
}

- (void)markDirty
{
  if (![(JFXComposition *)self needsUpdate])
  {
    int v3 = (void *)MEMORY[0x237DD1350]();
    [(JFXComposition *)self setNeedsUpdate:1];
    uint64_t v4 = [(JFXComposition *)self audioMixParameters];
    [v4 removeAllObjects];

    id v5 = [(JFXComposition *)self videoCompositionInstructions];
    [v5 removeAllObjects];

    objc_super v6 = [(JFXComposition *)self assetsUsed];
    [v6 removeAllObjects];

    v7 = [(JFXComposition *)self trackGroupA];
    [v7 markDirty];

    id v8 = [(JFXComposition *)self trackGroupB];
    [v8 markDirty];

    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v10 = *MEMORY[0x263EFA050];
    double v11 = [(JFXComposition *)self avPlayerItem];
    [v9 removeObserver:self name:v10 object:v11];

    [(JFXComposition *)self setAvPlayerItem:0];
    double v12 = [(JFXComposition *)self clipCustomRendererMap];
    [v12 removeAllObjects];

    double v13 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
    [v13 removeAllObjects];
  }
}

- (BOOL)CARenderingRequiredForClip:(id)a3
{
  return 0;
}

- (float)volumeForClip:(id)a3
{
  uint64_t v4 = [a3 mediaItem];
  int v5 = [v4 hasAudibleCharacteristic];

  if (!v5) {
    return 0.0;
  }
  [(JFXComposition *)self globalAudioVolume];
  return result;
}

- ($70930193D4F448A53BB9343C0237EB5F)compositionItemsForState:(SEL)a3 compositionItem:(id)a4 backfillCompositionItem:(id *)a5
{
  id v8 = a4;
  id v9 = [v8 clip];
  uint64_t v10 = [(JFXComposition *)self clipsDataSource];
  double v11 = +[JFXCompositionItem compositionItemWithClip:timeScale:](JFXCompositionItem, "compositionItemWithClip:timeScale:", v9, [v10 timeScale]);

  double v12 = [JFXCompositionItem alloc];
  double v13 = [(JFXComposition *)self clipsDataSource];
  double v14 = -[JFXCompositionItem initWithClip:timeScale:](v12, "initWithClip:timeScale:", v9, [v13 timeScale]);

  uint64_t v15 = [v8 isLastClip];
  [(JFXCompositionItem *)v14 setIsFinalClip:v15];
  [v11 setIsFinalClip:v15];
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  memset(&v44, 0, sizeof(v44));
  LODWORD(v15) = [v9 duration];
  double v16 = [(JFXComposition *)self clipsDataSource];
  DurationCMTimeFromFrameTime(v15, [v16 timeScale], (CMTime *)&v44);

  double v29 = v9;
  LODWORD(v15) = [v9 mediaStartOffset];
  double v17 = [(JFXComposition *)self clipsDataSource];
  DurationCMTimeFromFrameTime(v15, [v17 timeScale], (CMTime *)&v42);
  memset(&v43[8], 0, 24);

  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v43[8] = v44;
  v41[0] = v42;
  v41[1] = *(_OWORD *)v43;
  v41[2] = *(_OWORD *)&v44.var1;
  [v11 setSourceTimeRange:v41];
  *($3CC8671D27C23BF42ADDB32F2B5E48AE *)&v43[8] = v44;
  v40[0] = v42;
  v40[1] = *(_OWORD *)v43;
  v40[2] = *(_OWORD *)&v44.var1;
  [(JFXCompositionItem *)v14 setSourceTimeRange:v40];
  if ((int)[v8 overlapLeft] > 0 || (int)objc_msgSend(v8, "overlapRight") >= 1)
  {
    memset(&v39, 0, sizeof(v39));
    int v18 = [v8 overlapLeft];
    uint64_t v19 = [(JFXComposition *)self clipsDataSource];
    CMTimeFromFrameTime(v18, [v19 timeScale], &v39);

    memset(&v38, 0, sizeof(v38));
    int v20 = [v8 overlapRight];
    double v21 = [(JFXComposition *)self clipsDataSource];
    CMTimeFromFrameTime(v20, [v21 timeScale], &v38);

    memset(&v37, 0, sizeof(v37));
    *(_OWORD *)&lhs.value = v42;
    lhs.epoch = *(void *)v43;
    CMTime rhs = v39;
    CMTimeAdd(&v37, &lhs, &rhs);
    memset(&lhs, 0, sizeof(lhs));
    CMTime rhs = *(CMTime *)&v43[8];
    CMTime duration = v39;
    CMTimeSubtract(&lhs, &rhs, &duration);
    CMTime duration = lhs;
    CMTime v33 = v38;
    CMTimeSubtract(&rhs, &duration, &v33);
    CMTime lhs = rhs;
    CMTime rhs = v37;
    CMTime duration = lhs;
    CMTimeRangeMake(&v32, &rhs, &duration);
    CMTimeRange v31 = v32;
    [(JFXCompositionItem *)v14 setSourceTimeRange:&v31];
    CMTime v30 = lhs;
    [(JFXCompositionItem *)v14 setDestinationDuration:&v30];
  }
  id v22 = v11;
  *a5 = v22;
  double v23 = v14;
  *a6 = v23;
  double v24 = [v8 currentTrackGroup];
  uint64_t v25 = v24;
  if (v24) {
    [v24 cursor];
  }
  else {
    memset(&v39, 0, sizeof(v39));
  }
  retstr->var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v39;

  retstr->var1 = v44;
  return result;
}

- (id)instructionToHideTrackID:(int)a3 whileHidingTrackID:(int)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6
{
  BOOL v6 = a6;
  id v8 = objc_alloc_init(MEMORY[0x263F61318]);
  long long v9 = *(_OWORD *)&a5->var0.var3;
  v11[0] = *(_OWORD *)&a5->var0.var0;
  v11[1] = v9;
  v11[2] = *(_OWORD *)&a5->var1.var1;
  [v8 setTimeRange:v11];
  [v8 setEnablePostProcessing:v6];
  return v8;
}

- (id)instructionToShowClip:(id)a3 withTrackID:(int)a4 withTransform:(CGAffineTransform *)a5 timeRange:(id *)a6 requiresCARendering:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v10 = *(void *)&a4;
  double v12 = (objc_class *)MEMORY[0x263F61318];
  id v13 = a3;
  id v14 = objc_alloc_init(v12);
  unsigned __int8 v22 = 0;
  long long v15 = *(_OWORD *)&a5->c;
  long long v19 = *(_OWORD *)&a5->a;
  long long v20 = v15;
  long long v21 = *(_OWORD *)&a5->tx;
  id v16 = [(JFXComposition *)self newInstructionGraphNodeForClip:v13 clipTransform:&v19 compositionTrackID:v10 requiresTweening:&v22 isContainedClip:0];

  [v14 setOutputNode:v16];
  [v14 setContainsTweening:v22];
  [v14 setIsFreezeFrame:0];
  long long v17 = *(_OWORD *)&a6->var0.var3;
  long long v19 = *(_OWORD *)&a6->var0.var0;
  long long v20 = v17;
  long long v21 = *(_OWORD *)&a6->var1.var1;
  [v14 setTimeRange:&v19];
  [v14 setEnablePostProcessing:v7];

  return v14;
}

- (id)instructionToShowImageWithClip:(id)a3 withTransform:(CGAffineTransform *)a4 timeRange:(id *)a5 requiresCARendering:(BOOL)a6
{
  BOOL v6 = a6;
  unsigned __int8 v16 = 0;
  long long v8 = *(_OWORD *)&a4->c;
  long long v13 = *(_OWORD *)&a4->a;
  long long v14 = v8;
  long long v15 = *(_OWORD *)&a4->tx;
  id v9 = [(JFXComposition *)self newInstructionGraphNodeForClip:a3 clipTransform:&v13 compositionTrackID:0 requiresTweening:&v16 isContainedClip:0];
  id v10 = objc_alloc_init(MEMORY[0x263F61318]);
  [v10 setOutputNode:v9];
  long long v11 = *(_OWORD *)&a5->var0.var3;
  long long v13 = *(_OWORD *)&a5->var0.var0;
  long long v14 = v11;
  long long v15 = *(_OWORD *)&a5->var1.var1;
  [v10 setTimeRange:&v13];
  [v10 setEnablePostProcessing:v6];
  [v10 setContainsTweening:v16];

  return v10;
}

- (id)updateVideoAndAudioInstructionForState:(id)a3 previousInstructions:(id)a4 waitingForResource:(BOOL)a5
{
  id v6 = a3;
  BOOL v7 = [v6 clip];
  uint64_t v8 = [v7 mediaType];
  memset(&v60[3], 0, 48);
  id v9 = [v6 clip];
  [(JFXComposition *)self clipTransform:v9];

  switch(v8)
  {
    case 9:
      goto LABEL_4;
    case 2:
      if (v6) {
        [v6 videoCompTimeRange];
      }
      else {
        memset(v37, 0, sizeof(v37));
      }
      uint64_t v20 = [v6 clipRequiresCA];
      CMTimeRange v59 = *(CMTimeRange *)&v60[3];
      long long v13 = [(JFXComposition *)self instructionToShowImageWithClip:v7 withTransform:&v59 timeRange:v37 requiresCARendering:v20];
      long long v21 = [v6 currentTrackGroup];
      if (v6)
      {
        [v6 videoCompTimeRange];
      }
      else
      {
        long long v33 = 0u;
        long long v34 = 0u;
        long long v32 = 0u;
      }
      long long v35 = v32;
      uint64_t v36 = v33;
      [v21 requestVolume:&v35 atTime:0.0];

      uint64_t v25 = [v6 alternateTrackGroup];
      if (v6)
      {
        [v6 videoCompTimeRange];
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v27 = 0u;
      }
      long long v30 = v27;
      uint64_t v31 = v28;
      objc_msgSend(v25, "requestVolume:atTime:", &v30, 0.0, v27, v28, v29);
      goto LABEL_32;
    case 1:
LABEL_4:
      id v10 = [v6 currentTrackGroup];
      uint64_t v11 = [v10 actualVideoTrackID];
      if (v6) {
        [v6 videoCompTimeRange];
      }
      else {
        memset(v60, 0, 48);
      }
      uint64_t v14 = [v6 clipRequiresCA];
      CMTimeRange v59 = *(CMTimeRange *)&v60[3];
      long long v13 = [(JFXComposition *)self instructionToShowClip:v7 withTrackID:v11 withTransform:&v59 timeRange:v60 requiresCARendering:v14];

      [(JFXComposition *)self volumeForClip:v7];
      float v16 = v15;
      if (v15 <= 0.0)
      {
        long long v17 = [v6 currentTrackGroup];
        if (v6)
        {
LABEL_17:
          [v6 audioCompTimeRange];
          goto LABEL_23;
        }
      }
      else
      {
        if (v6)
        {
          [v6 audioCompTimeRange];
          long long v17 = [v6 currentTrackGroup];
          if (*((uint64_t *)&v57 + 1) >= 3)
          {
            [v6 audioCompTimeRange];
            CMTime start = v53;
            int v18 = [(JFXComposition *)self clipsDataSource];
            CMTimeMake(&duration, 1, [v18 timeScale]);
            CMTimeRangeMake(&v55, &start, &duration);
            *(float *)&double v19 = v16;
            [v17 requestVolumeRampFromStartVolume:&v55 toEndVolume:0.0 timeRange:v19];

            memset(&v59, 0, sizeof(v59));
            goto LABEL_24;
          }
          goto LABEL_17;
        }
        long long v57 = 0u;
        long long v58 = 0u;
        long long v56 = 0u;
        long long v17 = [0 currentTrackGroup];
      }
      long long v48 = 0u;
      long long v49 = 0u;
      long long v47 = 0u;
LABEL_23:
      long long v50 = v47;
      uint64_t v51 = v48;
      objc_msgSend(v17, "requestVolume:atTime:", &v50, COERCE_DOUBLE(__PAIR64__(DWORD1(v47), LODWORD(v16))));

      memset(&v59, 0, sizeof(v59));
      if (!v6)
      {
        long long v44 = 0uLL;
        long long v45 = 0uLL;
        long long v42 = 0uLL;
        long long v43 = 0uLL;
        long long v40 = 0uLL;
        long long v41 = 0uLL;
        int64_t v22 = -1;
        goto LABEL_26;
      }
LABEL_24:
      [v6 audioCompTimeRange];
      [v6 audioCompTimeRange];
      int64_t v22 = v43 + *((void *)&v41 + 1) - 1;
LABEL_26:
      double v23 = [(JFXComposition *)self clipsDataSource];
      CMTimeMake(&v46, v22, [v23 timeScale]);
      double v24 = [(JFXComposition *)self clipsDataSource];
      CMTimeMake(&v39, 1, [v24 timeScale]);
      CMTimeRangeMake(&v59, &v46, &v39);

      v59.start.value = v59.duration.value + v59.start.value - 1;
      uint64_t v25 = [v6 currentTrackGroup];
      CMTimeRange v38 = v59;
      objc_msgSend(v25, "requestVolumeRampFromStartVolume:toEndVolume:timeRange:", &v38, COERCE_DOUBLE(__PAIR64__(v59.duration.flags, LODWORD(v16))), 0.0);
LABEL_32:

      goto LABEL_33;
  }
  double v12 = JFXLog_playback();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:]();
  }

  long long v13 = 0;
LABEL_33:

  return v13;
}

- (void)assetUsed:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 asset];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      id v6 = [v5 URL];
      if (v6)
      {
        BOOL v7 = [(JFXComposition *)self assetsUsed];
        uint64_t v8 = [v7 objectForKey:v6];

        if (!v8)
        {
          id v9 = [(JFXComposition *)self assetsUsed];
          [v9 setObject:v5 forKey:v6];
        }
      }
      id v10 = [v17 audioAssetOverwrite];

      if (v10)
      {
        uint64_t v11 = [v17 audioAssetOverwrite];

        double v12 = [v11 URL];

        if (v12)
        {
          long long v13 = [(JFXComposition *)self assetsUsed];
          uint64_t v14 = [v13 objectForKey:v12];

          if (!v14)
          {
            float v15 = [(JFXComposition *)self assetsUsed];
            float v16 = [v17 audioAssetOverwrite];
            [v15 setObject:v16 forKey:v12];
          }
        }
      }
      else
      {
        uint64_t v11 = v5;
        double v12 = v6;
      }
    }
  }
}

- (BOOL)emptySegments:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "sourceURL", (void)v11);

        if (v8)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)removeTrackFromAudioMix:(int)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(JFXComposition *)self audioMixParameters];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v11 trackID] == a3) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if ([v5 count])
  {
    long long v12 = [(JFXComposition *)self audioMixParameters];
    [v12 removeObjectsInArray:v5];
  }
}

- (BOOL)removeTrackIfEmpty:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 segments];
  BOOL v6 = [(JFXComposition *)self emptySegments:v5];

  if (v6)
  {
    uint64_t v7 = [(JFXComposition *)self avComposition];
    [v7 removeTrack:v4];

    [v4 setSegments:0];
    uint64_t v8 = [v4 mediaType];
    int v9 = [v8 isEqualToString:*MEMORY[0x263EF9CE8]];

    if (v9) {
      -[JFXComposition removeTrackFromAudioMix:](self, "removeTrackFromAudioMix:", [v4 trackID]);
    }
  }

  return v6;
}

- (void)removeEmptyTracks
{
  id v3 = [(JFXComposition *)self trackGroupA];
  id v4 = [v3 audioTrack];
  BOOL v5 = [(JFXComposition *)self removeTrackIfEmpty:v4];

  if (v5)
  {
    BOOL v6 = [(JFXComposition *)self trackGroupA];
    uint64_t v7 = [v6 audioTrack];
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", @"movie A audio", [v7 trackID]);

    uint64_t v8 = [(JFXComposition *)self trackGroupA];
    [v8 setAudioTrack:0];
  }
  int v9 = [(JFXComposition *)self trackGroupB];
  id v10 = [v9 videoTrack];
  BOOL v11 = [(JFXComposition *)self removeTrackIfEmpty:v10];

  if (v11)
  {
    long long v12 = [(JFXComposition *)self trackGroupB];
    long long v13 = [v12 audioTrack];
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", @"movie B video", [v13 trackID]);

    long long v14 = [(JFXComposition *)self trackGroupB];
    [v14 setVideoTrack:0];
  }
  long long v15 = [(JFXComposition *)self trackGroupB];
  long long v16 = [v15 audioTrack];
  BOOL v17 = [(JFXComposition *)self removeTrackIfEmpty:v16];

  if (v17)
  {
    uint64_t v18 = [(JFXComposition *)self trackGroupB];
    double v19 = [v18 audioTrack];
    -[JFXComposition logRemovedTrack:trackID:](self, "logRemovedTrack:trackID:", @"movie B audio", [v19 trackID]);

    id v20 = [(JFXComposition *)self trackGroupB];
    [v20 setAudioTrack:0];
  }
}

- (void)setViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v35 = *MEMORY[0x263EF8340];
  if (self->_viewSize.width != a3.width || self->_viewSize.height != a3.height)
  {
    self->_viewSize = a3;
    uint64_t v7 = [(JFXComposition *)self videoComposition];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      int v9 = [(JFXComposition *)self avPlayerItem];

      if (v9)
      {
        id v10 = [(JFXComposition *)self videoComposition];
        BOOL v11 = [v10 instructions];

        long long v12 = [MEMORY[0x263EFF980] array];
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v13 = v11;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v31 != v16) {
                objc_enumerationMutation(v13);
              }
              uint64_t v18 = objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * i), "copy", (void)v30);
              [v12 addObject:v18];
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
          }
          while (v15);
        }

        double v19 = [(JFXComposition *)self avPlayerItem];
        id v20 = [v19 videoComposition];
        long long v21 = (void *)[v20 mutableCopy];
        [(JFXComposition *)self setVideoComposition:v21];

        int64_t v22 = [(JFXComposition *)self videoComposition];
        [v22 setInstructions:v12];

        double v23 = [(JFXComposition *)self avPlayerItem];
        double v24 = [(JFXComposition *)self videoComposition];
        [v23 setVideoComposition:v24];
      }
    }
    [(JFXComposition *)self previousRenderSize];
    double v26 = *(double *)(MEMORY[0x263F001B0] + 8);
    if ((v27 != *MEMORY[0x263F001B0] || v25 != v26) && (width != *MEMORY[0x263F001B0] || height != v26)) {
      [(JFXComposition *)self setRenderScale];
    }
  }
}

- (void)addBackTracksIfRemoved
{
  objc_initWeak(&location, self);
  id v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = [(JFXComposition *)self avComposition];
  BOOL v5 = [(JFXComposition *)self trackGroupA];
  BOOL v6 = [v5 audioTrack];
  uint64_t v7 = [v6 trackID];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke;
  v25[3] = &unk_264C0A200;
  objc_copyWeak(&v27, &location);
  uint64_t v8 = v3;
  double v26 = v8;
  [v4 loadTrackWithTrackID:v7 completionHandler:v25];

  dispatch_group_enter(v8);
  int v9 = [(JFXComposition *)self avComposition];
  id v10 = [(JFXComposition *)self trackGroupB];
  BOOL v11 = [v10 videoTrack];
  uint64_t v12 = [v11 trackID];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke_2;
  v22[3] = &unk_264C0A200;
  objc_copyWeak(&v24, &location);
  id v13 = v8;
  double v23 = v13;
  [v9 loadTrackWithTrackID:v12 completionHandler:v22];

  dispatch_group_enter(v13);
  uint64_t v14 = [(JFXComposition *)self avComposition];
  uint64_t v15 = [(JFXComposition *)self trackGroupB];
  uint64_t v16 = [v15 audioTrack];
  uint64_t v17 = [v16 trackID];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __40__JFXComposition_addBackTracksIfRemoved__block_invoke_3;
  v19[3] = &unk_264C0A200;
  objc_copyWeak(&v21, &location);
  uint64_t v18 = v13;
  id v20 = v18;
  [v14 loadTrackWithTrackID:v17 completionHandler:v19];

  dispatch_group_wait(v18, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v24);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&location);
}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    id v4 = [WeakRetained avComposition];
    BOOL v5 = [v4 addMutableTrackWithMediaType:*MEMORY[0x263EF9CE8] preferredTrackID:2];
    BOOL v6 = [WeakRetained trackGroupA];
    [v6 setAudioTrack:v5];

    [WeakRetained logAddedTrack:@"movie A audio" trackID:2];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    id v4 = [WeakRetained avComposition];
    BOOL v5 = [v4 addMutableTrackWithMediaType:*MEMORY[0x263EF9D48] preferredTrackID:3];
    BOOL v6 = [WeakRetained trackGroupB];
    [v6 setVideoTrack:v5];

    [WeakRetained logAddedTrack:@"movie B video" trackID:3];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __40__JFXComposition_addBackTracksIfRemoved__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (!a2)
  {
    id v4 = [WeakRetained avComposition];
    BOOL v5 = [v4 addMutableTrackWithMediaType:*MEMORY[0x263EF9CE8] preferredTrackID:4];
    BOOL v6 = [WeakRetained trackGroupB];
    [v6 setAudioTrack:v5];

    [WeakRetained logAddedTrack:@"movie B audio" trackID:4];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (CGAffineTransform)clipTransform:(SEL)a3
{
  id v5 = a4;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  if ([v5 mediaType] == 1 || objc_msgSend(v5, "mediaType") == 9)
  {
    BOOL v6 = [v5 mediaItem];
    uint64_t v7 = v6;
    if (v6)
    {
      [v6 transform];
    }
    else
    {
      long long v12 = 0u;
      long long v13 = 0u;
      long long v11 = 0u;
    }
    *(_OWORD *)&retstr->a = v11;
    *(_OWORD *)&retstr->c = v12;
    *(_OWORD *)&retstr->tx = v13;
  }
  else
  {
    uint64_t v8 = MEMORY[0x263F000D0];
    long long v9 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  }

  return result;
}

- (id)buildClipList
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v4 = [(JFXComposition *)self clipsDataSource];
  uint64_t v5 = [v4 count];

  if (v5 >= 1)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v7 = [(JFXComposition *)self clipsDataSource];
      uint64_t v8 = [v7 playableElementAtIndex:i];

      [v3 addObject:v8];
    }
  }
  return v3;
}

- (id)dissolveGraphNode:(id *)a3 from:(id)a4 to:(id)a5
{
  uint64_t v7 = *MEMORY[0x263F61620];
  uint64_t v8 = (void *)MEMORY[0x263F61248];
  id v9 = a5;
  id v10 = a4;
  long long v11 = (void *)[v8 newEffectWithID:v7];
  long long v12 = *(_OWORD *)&a3->var0.var3;
  v17[0] = *(_OWORD *)&a3->var0.var0;
  v17[1] = v12;
  v17[2] = *(_OWORD *)&a3->var1.var1;
  [v11 setEffectRange:v17];
  long long v13 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:0];
  v19.x = 0.0;
  v19.y = 1.0;
  uint64_t v14 = NSStringFromCGPoint(v19);
  [v13 setObject:v14 forKeyedSubscript:*MEMORY[0x263F61668]];

  [v11 setInspectableProperties:v13];
  uint64_t v15 = (void *)[MEMORY[0x263F61270] newEffectNodeToTransitionFrom:v10 to:v9 effect:v11];

  return v15;
}

- (void)update
{
  id v3 = (void *)MEMORY[0x237DD1350](self, a2);
  id v4 = [(JFXComposition *)self buildClipList];
  [(JFXComposition *)self addBackTracksIfRemoved];
  uint64_t v5 = *MEMORY[0x263EF95F0];
  BOOL v6 = [(JFXComposition *)self trackGroupB];
  [v6 setPreferredAudioTimePitchAlgorithm:v5];

  uint64_t v7 = [(JFXComposition *)self clipsDataSource];
  uint64_t v8 = [v7 isExporting];
  id v9 = [(JFXComposition *)self trackGroupA];
  [v9 setIsExporting:v8];

  id v10 = [(JFXComposition *)self clipsDataSource];
  uint64_t v11 = [v10 isExporting];
  long long v12 = [(JFXComposition *)self trackGroupB];
  [v12 setIsExporting:v11];

  long long v13 = objc_alloc_init(EditListCompositionState);
  uint64_t v14 = [(JFXComposition *)self trackGroupA];
  [(EditListCompositionState *)v13 setCurrentTrackGroup:v14];

  uint64_t v15 = [(JFXComposition *)self trackGroupB];
  [(EditListCompositionState *)v13 setAlternateTrackGroup:v15];

  memset(&v120, 0, sizeof(v120));
  uint64_t v16 = [(JFXComposition *)self clipsDataSource];
  LODWORD(v11) = [v16 duration];
  uint64_t v17 = [(JFXComposition *)self clipsDataSource];
  CMTimeFromFrameTime(v11, [v17 timeScale], &v120);

  uint64_t v18 = [v4 count];
  [v4 lastObject];
  v83 = uint64_t v82 = v18;
  if (!v18) {
    goto LABEL_45;
  }
  v80 = v3;
  v81 = v4;
  uint64_t v19 = 0;
  id v20 = 0;
  do
  {
    id v21 = objc_msgSend(v4, "objectAtIndex:", v19, v80);
    [(EditListCompositionState *)v13 setClip:v21];

    int64_t v22 = [(EditListCompositionState *)v13 clip];
    [(JFXComposition *)self JFX_updatePlaybackDelegatesForClip:v22];

    double v23 = [(EditListCompositionState *)v13 clip];
    [(EditListCompositionState *)v13 setClipRequiresCA:[(JFXComposition *)self CARenderingRequiredForClip:v23]];

    id v24 = [(EditListCompositionState *)v13 clip];
    [(EditListCompositionState *)v13 setIsLastClip:v24 == v83];

    if (v19
      && ([v4 objectAtIndex:v19 - 1], (double v25 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      double v26 = v25;
      int v27 = [v25 presentationTime];
      v85 = v26;
      LODWORD(v26) = [v26 duration] + v27;
      long long v28 = [(EditListCompositionState *)v13 clip];
      -[EditListCompositionState setOverlapLeft:](v13, "setOverlapLeft:", v26 - [v28 presentationTime]);
    }
    else
    {
      [(EditListCompositionState *)v13 setOverlapLeft:0];
      v85 = 0;
    }
    if ([(EditListCompositionState *)v13 isLastClip]
      || ([v4 objectAtIndex:v19 + 1], (uint64_t v29 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      [(EditListCompositionState *)v13 setOverlapRight:0];
    }
    else
    {
      long long v30 = (void *)v29;
      long long v31 = [(EditListCompositionState *)v13 clip];
      int v32 = [v31 presentationTime];
      long long v33 = [(EditListCompositionState *)v13 clip];
      -[EditListCompositionState setOverlapRight:](v13, "setOverlapRight:", [v33 duration] + v32 - objc_msgSend(v30, "presentationTime"));
    }
    id v115 = 0;
    id v116 = 0;
    [(JFXComposition *)self compositionItemsForState:v13 compositionItem:&v116 backfillCompositionItem:&v115];
    id v34 = v116;
    id v35 = v115;
    v114[0] = v117;
    v114[1] = v118;
    v114[2] = v119;
    [(EditListCompositionState *)v13 setVideoCompTimeRange:v114];
    memset(&v113, 0, sizeof(v113));
    if (v13) {
      [(EditListCompositionState *)v13 videoCompTimeRange];
    }
    [(EditListCompositionState *)v13 setAudioStartOffset:0];
    [(EditListCompositionState *)v13 setAudioEndOffset:0];
    uint64_t v36 = [(JFXComposition *)self clipsDataSource];
    CMTimeMake(&v112, 0, [v36 timeScale]);
    CMTime v111 = v112;
    [v34 setAudioStartOffset:&v111];

    CMTime v37 = [(JFXComposition *)self clipsDataSource];
    CMTimeMake(&v110, 0, [v37 timeScale]);
    CMTime v109 = v110;
    [v34 setAudioEndOffset:&v109];

    CMTimeRange v108 = v113;
    [(EditListCompositionState *)v13 setAudioCompTimeRange:&v108];
    CMTimeRange v38 = [(EditListCompositionState *)v13 clip];
    BOOL v39 = [v38 mediaType] == 2;

    long long v40 = [(EditListCompositionState *)v13 currentTrackGroup];
    [v40 applyCompositionItem:v34 skipAudio:v39];

    long long v41 = [(EditListCompositionState *)v13 alternateTrackGroup];
    [v41 applyCompositionItem:v35 skipAudio:1];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(JFXComposition *)self assetUsed:v34];
    }
    long long v42 = [(JFXComposition *)self clipsDataSource];
    v84 = v35;
    if ([v42 isExporting])
    {

LABEL_19:
      uint64_t v44 = 0;
      goto LABEL_20;
    }
    int v43 = [v34 hasVideoContent];

    if (!v43) {
      goto LABEL_19;
    }
    uint64_t v44 = [v34 isWaitingForResource];
LABEL_20:
    memset(&v107, 0, sizeof(v107));
    int v45 = [(EditListCompositionState *)v13 overlapLeft];
    CMTime v46 = [(JFXComposition *)self clipsDataSource];
    CMTimeFromFrameTime(v45, [v46 timeScale], &v107);

    if ([(EditListCompositionState *)v13 overlapLeft] > 0
      || [(EditListCompositionState *)v13 overlapRight] >= 1)
    {
      memset(&v89, 0, 24);
      int v47 = [(EditListCompositionState *)v13 overlapRight];
      long long v48 = [(JFXComposition *)self clipsDataSource];
      CMTimeFromFrameTime(v47, [v48 timeScale], &v89.start);

      memset(&v87, 0, 24);
      if (v13)
      {
        [(EditListCompositionState *)v13 videoCompTimeRange];
      }
      else
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v103 = 0u;
      }
      *(_OWORD *)&lhs.value = v103;
      lhs.epoch = v104;
      CMTime rhs = v107;
      CMTimeAdd(&v87.start, &lhs, &rhs);
      memset(&rhs, 0, sizeof(rhs));
      if (v13)
      {
        [(EditListCompositionState *)v13 videoCompTimeRange];
      }
      else
      {
        memset(v100, 0, sizeof(v100));
        long long v99 = 0u;
      }
      CMTime v101 = *(CMTime *)((char *)v100 + 8);
      CMTime start = v107;
      CMTime duration = v89.start;
      CMTimeAdd(&v98, &start, &duration);
      CMTimeSubtract(&rhs, &v101, &v98);
      CMTime start = v87.start;
      CMTime duration = rhs;
      CMTimeRangeMake(&v95, &start, &duration);
      CMTimeRange v94 = v95;
      [(EditListCompositionState *)v13 setVideoCompTimeRange:&v94];
      if (v13)
      {
        [(EditListCompositionState *)v13 videoCompTimeRange];
      }
      else
      {
        long long v92 = 0u;
        long long v93 = 0u;
        long long v91 = 0u;
      }
      v90[0] = v91;
      v90[1] = v92;
      v90[2] = v93;
      [(EditListCompositionState *)v13 setAudioCompTimeRange:v90];
    }
    v86 = v20;
    long long v49 = [(JFXComposition *)self updateVideoAndAudioInstructionForState:v13 previousInstructions:v20 waitingForResource:v44];
    if ([(EditListCompositionState *)v13 overlapLeft] >= 1)
    {
      id v50 = objc_alloc_init(MEMORY[0x263F61318]);
      memset(&v89, 0, sizeof(v89));
      uint64_t v51 = [(EditListCompositionState *)v13 clip];
      int v52 = [v51 presentationTime];
      CMTime v53 = [(JFXComposition *)self clipsDataSource];
      CMTimeFromFrameTime(v52, [v53 timeScale], &v88);
      v87.CMTime start = v107;
      CMTimeRangeMake(&v89, &v88, &v87.start);

      CMTimeRange v87 = v89;
      [v50 setTimeRange:&v87];
      long long v54 = [v86 outputNode];
      CMTimeRange v55 = [v49 outputNode];
      CMTimeRange v87 = v89;
      long long v56 = [(JFXComposition *)self dissolveGraphNode:&v87 from:v54 to:v55];

      [v50 setOutputNode:v56];
      BOOL v57 = [(EditListCompositionState *)v13 clipRequiresCA]
         || [(JFXComposition *)self CARenderingRequiredForClip:v85];
      [v50 setContainsTweening:v57];
      [v50 setIsFreezeFrame:0];
      long long v58 = [(JFXComposition *)self videoCompositionInstructions];
      [v58 addObject:v50];

      id v4 = v81;
    }
    if (v49)
    {
      CMTimeRange v59 = [(JFXComposition *)self videoCompositionInstructions];
      [v59 addObject:v49];
    }
    uint64_t v60 = [(JFXComposition *)self videoCompositionInstructions];
    if ([v60 count] == 1)
    {
      long long v61 = [MEMORY[0x263EFFA40] standardUserDefaults];
      int v62 = [v61 BOOLForKey:@"burnInExportSettings"];

      if (!v62) {
        goto LABEL_43;
      }
      uint64_t v60 = [(JFXComposition *)self videoCompositionInstructions];
      long long v63 = [v60 objectAtIndexedSubscript:0];
      [(JFXComposition *)self burnInPlaybackSettings:v63];
    }
LABEL_43:

    [(EditListCompositionState *)v13 swapTrackGroup];
    ++v19;
    id v20 = v49;
  }
  while (v82 != v19);

  id v3 = v80;
LABEL_45:
  memset(&v87, 0, 24);
  uint64_t v64 = [(EditListCompositionState *)v13 currentTrackGroup];
  long long v65 = v64;
  if (v64) {
    [v64 cursor];
  }
  else {
    memset(&v87, 0, 24);
  }

  memset(&v107, 0, sizeof(v107));
  v113.CMTime start = v120;
  *(_OWORD *)&v89.start.value = *(_OWORD *)&v87.start.value;
  v89.start.epoch = v87.start.epoch;
  CMTimeSubtract(&v107, &v113.start, &v89.start);
  if (v107.value >= 1)
  {
    memset(&v113, 0, sizeof(v113));
    *(_OWORD *)&v89.start.value = *(_OWORD *)&v87.start.value;
    v89.start.epoch = v87.start.epoch;
    CMTime rhs = v120;
    CMTimeRangeMake(&v113, &v89.start, &rhs);
    uint64_t v66 = [(EditListCompositionState *)v13 currentTrackGroup];
    v89.CMTime start = v120;
    [v66 applyPaddingToTime:&v89];

    objc_super v67 = [(EditListCompositionState *)v13 alternateTrackGroup];
    v89.CMTime start = v120;
    [v67 applyPaddingToTime:&v89];

    v68 = [(JFXComposition *)self videoCompositionInstructions];
    v69 = [(EditListCompositionState *)v13 currentTrackGroup];
    uint64_t v70 = [v69 usableVideoTrackID];
    v71 = [(EditListCompositionState *)v13 alternateTrackGroup];
    uint64_t v72 = [v71 usableVideoTrackID];
    CMTimeRange v89 = v113;
    v73 = [(JFXComposition *)self instructionToHideTrackID:v70 whileHidingTrackID:v72 timeRange:&v89 requiresCARendering:1];
    [v68 addObject:v73];
  }
  v74 = [(EditListCompositionState *)v13 currentTrackGroup];
  v113.CMTime start = v120;
  [v74 commitPendingVolumeToTime:&v113];

  v75 = [(EditListCompositionState *)v13 alternateTrackGroup];
  v113.CMTime start = v120;
  [v75 commitPendingVolumeToTime:&v113];

  v76 = [(EditListCompositionState *)v13 currentTrackGroup];
  v77 = [(JFXComposition *)self audioMixParameters];
  [v76 applyAudioMixParameters:v77];

  v78 = [(EditListCompositionState *)v13 alternateTrackGroup];
  v79 = [(JFXComposition *)self audioMixParameters];
  [v78 applyAudioMixParameters:v79];

  [(JFXComposition *)self setNeedsUpdate:0];
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:(id)a3
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(JFXComposition *)self clipsDataSource];
  int32_t v6 = [v5 timeScale];

  uint64_t v7 = [(JFXComposition *)self avPlayerItem];

  if (v7)
  {
    uint64_t v8 = objc_alloc_init(MEMORY[0x263EFF980]);
    memset(&v56, 0, sizeof(v56));
    CMTimeMake(&start, (int)[v4 presentationTime], v6);
    CMTimeMake(&duration, (int)[v4 duration], v6);
    CMTimeRangeMake(&v56, &start, &duration);
    unint64_t v9 = [v4 mediaType];
    [(JFXComposition *)self JFX_updatePlaybackDelegatesForClip:v4];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v10 = [(JFXComposition *)self avPlayerItem];
    uint64_t v11 = [v10 videoComposition];
    long long v12 = [v11 instructions];

    id obj = v12;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v50 objects:v57 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v51;
      BOOL v39 = v44;
      uint64_t v16 = 0xFFFFFFFFLL;
      long long v41 = v8;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v51 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void **)(*((void *)&v50 + 1) + 8 * v17);
          if (v18) {
            [*(id *)(*((void *)&v50 + 1) + 8 * v17) timeRange];
          }
          else {
            memset(&otherRange, 0, sizeof(otherRange));
          }
          CMTimeRange range = v56;
          if (CMTimeRangeContainsTimeRange(&range, &otherRange))
          {
            if (v16 == -1 && v9 <= 9 && ((1 << v9) & 0x20A) != 0)
            {
              uint64_t v19 = [v18 requiredSourceTrackIDs];
              id v20 = [v19 firstObject];
              unsigned int v21 = [v20 intValue];

              if (v21) {
                uint64_t v16 = v21;
              }
              else {
                uint64_t v16 = 3;
              }
              uint64_t v8 = v41;
            }
            memset(&range, 0, sizeof(range));
            -[JFXComposition clipTransform:](self, "clipTransform:", v4, v39);
            switch(v9)
            {
              case 1uLL:
              case 3uLL:
              case 9uLL:
                if (v18) {
                  [v18 timeRange];
                }
                else {
                  memset(v47, 0, sizeof(v47));
                }
                BOOL v22 = [(JFXComposition *)self CARenderingRequiredForClip:v4];
                CMTimeRange v46 = range;
                double v23 = [(JFXComposition *)self instructionToShowClip:v4 withTrackID:v16 withTransform:&v46 timeRange:v47 requiresCARendering:v22];
                id v24 = v23;
                if (v9 == 3) {
                  [v23 setContainsTweening:1];
                }
                if (!v24) {
                  goto LABEL_35;
                }
                goto LABEL_26;
              case 2uLL:
                if (v18) {
                  [v18 timeRange];
                }
                else {
                  memset(v45, 0, sizeof(v45));
                }
                BOOL v30 = [(JFXComposition *)self CARenderingRequiredForClip:v4];
                CMTimeRange v46 = range;
                id v24 = [(JFXComposition *)self instructionToShowImageWithClip:v4 withTransform:&v46 timeRange:v45 requiresCARendering:v30];
                if (!v24) {
                  goto LABEL_35;
                }
LABEL_26:
                unint64_t v25 = v9;
                id v26 = v4;
                if (![v4 presentationTime])
                {
                  uint64_t v27 = [v24 outputNode];
                  if (v27)
                  {
                    long long v28 = (void *)v27;
                    uint64_t v29 = [MEMORY[0x263EFFA40] standardUserDefaults];
                    int v40 = [v29 BOOLForKey:@"burnInExportSettings"];

                    uint64_t v8 = v41;
                    if (v40) {
                      [(JFXComposition *)self burnInPlaybackSettings:v24];
                    }
                  }
                }
                [v8 addObject:v24];
                id v4 = v26;
                unint64_t v9 = v25;
                break;
              default:
LABEL_35:
                id v24 = JFXLog_playback();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                  [(JFXComposition *)&buf rebuildCompositionInstructionsForVideoStillTitleCard:v24];
                }
                break;
            }
          }
          else
          {
            [v8 addObject:v18];
          }
          ++v17;
        }
        while (v14 != v17);
        uint64_t v14 = [obj countByEnumeratingWithState:&v50 objects:v57 count:16];
      }
      while (v14);
    }

    long long v31 = [(JFXComposition *)self avPlayerItem];
    int v32 = [v31 videoComposition];
    long long v33 = (void *)[v32 mutableCopy];

    [v33 setInstructions:v8];
    [(JFXComposition *)self JFX_preferredRenderScale];
    float v35 = v34;
    [v33 renderScale];
    if (vabds_f32(v35, *(float *)&v36) >= 0.0001)
    {
      *(float *)&double v36 = v35;
      [v33 setRenderScale:v36];
    }
    CMTime v37 = [(JFXComposition *)self avPlayerItem];
    [v37 setVideoComposition:v33];

    [(JFXComposition *)self setVideoComposition:v33];
    [(JFXComposition *)self setVideoCompositionInstructions:v8];
    CMTimeRange v38 = [(JFXComposition *)self videoComposition];
    [v38 setInstructions:v8];
  }
  else
  {
    uint64_t v8 = JFXLog_playback();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[JFXComposition rebuildCompositionInstructionsForVideoStillTitleCard:]();
    }
  }
}

- (void)JFX_updatePlaybackDelegatesForClip:(id)a3
{
  id v11 = a3;
  id v4 = [[JFXSharedMediaDataReaderManager alloc] initWithPlayableElement:v11];
  uint64_t v5 = [(JFXComposition *)self clipCustomRendererMap];
  int32_t v6 = [v5 objectForKey:v11];

  id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v8 = [v6 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];
  unint64_t v9 = [(JFXComposition *)self animojiCustomRendererPropsForClip:v11 currentCustomProperties:v8 sharedMediaDataReaderManager:v4];

  if (v9) {
    [v7 setObject:v9 forKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];
  }
  [(JFXComposition *)self CFX_updateFaceTrackingPlaybackDelegateForClip:v11 sharedMediaDataReaderManager:v4];
  id v10 = [(JFXComposition *)self clipCustomRendererMap];
  [v10 setObject:v7 forKey:v11];
}

- (id)animojiCustomRendererPropsForClip:(id)a3 currentCustomProperties:(id)a4 sharedMediaDataReaderManager:(id)a5
{
  v31[3] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 playableEffectsOfType:7];
  if ([v11 count])
  {
    [v8 playableMediaSizeWithTransform];
    double v13 = v12;
    double v15 = v14;
    uint64_t v16 = [(JFXComposition *)self clipsDataSource];
    [v16 renderSize];
    double v18 = v17;
    double v20 = v19;

    if (v18 < v20) {
      double v18 = v20;
    }
    if (!CGSizeCouldContainSize(v18, v18, v13, v15))
    {
      double v13 = CGSizeFitToAspectInSize(v18, v18, v13, v15);
      double v15 = v21;
    }
    BOOL v22 = [v11 objectAtIndexedSubscript:0];
    v31[0] = v22;
    v30[0] = @"JFXAnimojiRendererMetadata_Effect";
    v30[1] = @"JFXAnimojiRendererMetadata_UIInterfaceOrientation";
    double v23 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v22, "captureInterfaceOrientation"));
    v31[1] = v23;
    v30[2] = @"JFXAnimojiRendererMetadata_RenderSize";
    *(double *)uint64_t v29 = v13;
    *(double *)&v29[1] = v15;
    id v24 = [MEMORY[0x263F08D40] valueWithBytes:v29 objCType:"{CGSize=dd}"];
    v31[2] = v24;
    unint64_t v25 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:3];

    if (v9
      && ([v9 renderingDelegate],
          (id v26 = (JFXAnimojiPlaybackDelegate *)objc_claimAutoreleasedReturnValue()) != 0)
      || (([v8 isVideo] & 1) != 0 || objc_msgSend(v8, "isStill"))
      && (id v26 = [[JFXAnimojiPlaybackDelegate alloc] initWithPlayableElement:v8 sharedMediaDataReaderManager:v10]) != 0)
    {
      id v27 = +[JFXCustomRenderProperties newCustomRenderProperties:v26 metadata:v25];
    }
    else
    {
      id v27 = 0;
    }
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)CFX_updateFaceTrackingPlaybackDelegateForClip:(id)a3 sharedMediaDataReaderManager:(id)a4
{
  uint64_t v62 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  int v45 = v6;
  [v6 playableEffectsOfType:2];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v51;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v51 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = [*(id *)(*((void *)&v50 + 1) + 8 * i) trackingProps];
        uint64_t v14 = [v13 currentTrackingType];

        if (v14)
        {
          int v15 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v50 objects:v61 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  int v15 = 0;
LABEL_11:

  uint64_t v16 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
  double v17 = v45;
  uint64_t v18 = [v16 objectForKey:v45];

  if (v15)
  {
    if (v18) {
      goto LABEL_20;
    }
    if (([v45 isVideo] & 1) != 0 || objc_msgSend(v45, "isStill"))
    {
      double v19 = [JFXFaceTrackingPlaybackDelegate alloc];
      double v20 = [(JFXComposition *)self clipsDataSource];
      [v20 renderSize];
      double v21 = v19;
      double v17 = v45;
      uint64_t v18 = -[JFXFaceTrackingPlaybackDelegate initWithPlayableElement:sharedMediaDataReaderManager:outputSize:](v21, "initWithPlayableElement:sharedMediaDataReaderManager:outputSize:", v45, v7);
    }
    else
    {
      uint64_t v18 = 0;
    }
    BOOL v22 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
    [v22 setObject:v18 forKey:v17];
  }
  else
  {
    BOOL v22 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
    [v22 removeObjectForKey:v45];
  }

LABEL_20:
  uint64_t v44 = (void *)v18;
  int v43 = v7;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v23 = v8;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v47;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v47 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = *(id *)(*((void *)&v46 + 1) + 8 * v27);
        uint64_t v29 = [v28 trackingProps];
        BOOL v30 = [v28 renderEffect];
        [v30 removeAllTimedPropertiesDelegates];

        long long v31 = JFXLog_DebugFaceTrackingPlayback();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          BOOL v39 = [v28 renderEffect];
          int v40 = [v45 uuid];
          *(_DWORD *)uint8_t buf = 134218242;
          CMTimeRange v55 = v39;
          __int16 v56 = 2112;
          BOOL v57 = v40;
          _os_log_debug_impl(&dword_234C41000, v31, OS_LOG_TYPE_DEBUG, "remove timedProperties delegate for PVEffect %p on clip %@", buf, 0x16u);
        }
        if ([v29 currentTrackingType] && (objc_msgSend(v28, "isEditingFaceTrackingTransforms") & 1) == 0)
        {
          int v32 = objc_opt_new();
          long long v33 = NSNumber;
          float v34 = [v45 mediaItem];
          float v35 = objc_msgSend(v33, "numberWithInteger:", objc_msgSend(v34, "interfaceOrientationForDisplay"));
          [v32 setObject:v35 forKeyedSubscript:@"JFXFaceTrackingKey_InterfaceOrientation"];

          double v36 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v29, "currentTrackingType"));
          [v32 setObject:v36 forKeyedSubscript:@"JFXFaceTrackingKey_TrackingType"];

          CMTime v37 = JFXLog_DebugFaceTrackingPlayback();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
          {
            long long v41 = [v28 renderEffect];
            long long v42 = [v45 uuid];
            *(_DWORD *)uint8_t buf = 134218498;
            CMTimeRange v55 = v44;
            __int16 v56 = 2048;
            BOOL v57 = v41;
            __int16 v58 = 2112;
            CMTimeRange v59 = v42;
            _os_log_debug_impl(&dword_234C41000, v37, OS_LOG_TYPE_DEBUG, "add timedProperties delegate %p for PVEffect %p on clip %@", buf, 0x20u);
          }
          CMTimeRange v38 = [v28 renderEffect];
          [v38 addTimedPropertiesDelegate:v44 userContext:v32];
        }
        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v46 objects:v60 count:16];
    }
    while (v25);
  }
}

- (void)noteEffectChangeForClip:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 mediaType];
  if (v5 > 9 || ((1 << v5) & 0x20E) == 0)
  {
    id v7 = JFXLog_playback();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[JFXComposition noteEffectChangeForClip:]();
    }
  }
  else
  {
    [(JFXComposition *)self rebuildCompositionInstructionsForVideoStillTitleCard:v4];
  }
}

- (void)notifyPlaybackWillBegin
{
}

- (void)notifyPlaybackDidStopAtTime:(id *)a3
{
  [(JFXComposition *)self JFX_setScrubbingModeForPlaybackDelegates:1];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = *a3;
  [(JFXComposition *)self notifyNeedsEffectPropertiesUpdatedForPlaybackTime:&v5];
}

- (void)notifyNeedsEffectPropertiesUpdatedForPlaybackTime:(id *)a3
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v3 = *a3;
  [(JFXComposition *)self JFX_updateFaceTrackPropertiesForEffectsAtTime:&v3];
}

- (void)JFX_updateFaceTrackPropertiesForEffectsAtTime:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(JFXComposition *)self clipsDataSource];
  uint64_t v6 = [v5 count];

  if (v6 >= 1)
  {
    uint64_t v7 = 0;
    while (1)
    {
      id v8 = [(JFXComposition *)self clipsDataSource];
      uint64_t v9 = [v8 playableElementAtIndex:v7];

      [(JFXComposition *)self timeRangeForClip:v9];
      CMTime time = (CMTime)*a3;
      if (CMTimeRangeContainsTime(&range, &time)) {
        break;
      }

      if (v6 == ++v7) {
        return;
      }
    }
    uint64_t v10 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
    uint64_t v11 = [v10 objectForKey:v9];

    if (v11)
    {
      double v12 = [v9 mediaItem];
      uint64_t v13 = [v12 interfaceOrientationForDisplay];

      uint64_t v14 = [v9 playableEffectsOfType:2];
      CMTime time = (CMTime)*a3;
      uint64_t v32 = v13;
      long long v33 = v11;
      int v15 = [v11 faceTrackingTransformAtTime:&time forDisplayingMediaAtInterfaceOrientation:v13];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      id v16 = v14;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v36;
        float v34 = v15;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v36 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = *(id *)(*((void *)&v35 + 1) + 8 * v20);
            BOOL v22 = JFXLog_DebugFaceTrackingPlayback();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              CMTime time = (CMTime)*a3;
              Float64 Seconds = CMTimeGetSeconds(&time);
              uint64_t v24 = [v21 renderEffect];
              [v9 uuid];
              uint64_t v25 = v9;
              uint64_t v27 = v26 = a3;
              LODWORD(time.value) = 134218498;
              *(Float64 *)((char *)&time.value + 4) = Seconds;
              LOWORD(time.flags) = 2048;
              *(void *)((char *)&time.flags + 2) = v24;
              HIWORD(time.epoch) = 2112;
              long long v41 = v27;
              _os_log_debug_impl(&dword_234C41000, v22, OS_LOG_TYPE_DEBUG, "update face tracking properties at time %f for PVEffect %p on clip %@", (uint8_t *)&time, 0x20u);

              a3 = v26;
              uint64_t v9 = v25;

              int v15 = v34;
            }

            if (([v21 isEditingFaceTrackingTransforms] & 1) == 0) {
              [v21 setFaceTrackingTransform:v15];
            }

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v16 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v18);
      }

      CMTime time = (CMTime)*a3;
      uint64_t v11 = v33;
      id v28 = [v33 arDataAtTime:&time forDisplayingMediaAtInterfaceOrientation:v32];
    }
    else
    {
      id v28 = 0;
    }
    uint64_t v29 = +[JFXVideoCameraController sharedInstance];
    [v29 setMostRecentARMetadata:v28];

    BOOL v30 = [v28 faceAnchor];
    long long v31 = +[JFXVideoCameraController sharedInstance];
    [v31 setHasValidFaceData:v30 != 0];
  }
}

- (void)JFX_setScrubbingModeForPlaybackDelegates:(BOOL)a3
{
  BOOL v3 = a3;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5 = [(JFXComposition *)self clipsDataSource];
  uint64_t v6 = [v5 count];

  if (v6 >= 1)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      id v8 = [(JFXComposition *)self clipsDataSource];
      uint64_t v9 = [v8 playableElementAtIndex:i];

      uint64_t v10 = [(JFXComposition *)self clipCustomRendererMap];
      uint64_t v11 = [v10 objectForKey:v9];

      double v12 = [(JFXComposition *)self clipFaceTrackingPlaybackDelegates];
      uint64_t v13 = [v12 objectForKey:v9];

      [v13 setIsScrubbing:v3];
      uint64_t v14 = [v11 objectForKeyedSubscript:@"JFXCustomRenderingPropertiesKey_Animoji"];
      int v15 = v14;
      if (v14)
      {
        id v16 = [v14 renderingDelegate];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v16 setIsScrubbing:v3];
        }
      }
    }
  }
}

- (id)AVComposition
{
  uint64_t v3 = [(JFXComposition *)self avComposition];
  if (!v3 || (id v4 = (void *)v3, v5 = [(JFXComposition *)self needsUpdate], v4, v5)) {
    [(JFXComposition *)self update];
  }
  return [(JFXComposition *)self avComposition];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)duration
{
  if ([(JFXComposition *)self needsUpdate]) {
    [(JFXComposition *)self update];
  }
  BOOL v5 = [(JFXComposition *)self avComposition];
  if (v5)
  {
    uint64_t v7 = v5;
    [v5 duration];
    BOOL v5 = v7;
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (BOOL)validate
{
  if ([(JFXComposition *)self needsUpdate]) {
    [(JFXComposition *)self update];
  }
  uint64_t v3 = [(JFXComposition *)self trackGroupA];
  char v4 = [v3 validate];

  BOOL v5 = [(JFXComposition *)self trackGroupB];
  char v6 = [v5 validate];

  uint64_t v7 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate].cold.6();
  }

  id v8 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate].cold.5();
  }

  uint64_t v9 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate].cold.4(self);
  }

  uint64_t v10 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate](self);
  }

  uint64_t v11 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate]();
  }

  double v12 = JFXLog_DebugComposition();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    -[JFXComposition validate](self);
  }

  return v6 & v4;
}

- (void)updateRenderSizeIfNeeded
{
  uint64_t v3 = [(JFXComposition *)self clipsDataSource];
  [v3 renderSize];
  double v5 = v4;
  double v7 = v6;

  [(JFXComposition *)self previousRenderSize];
  if (v9 != v5 || v8 != v7)
  {
    uint64_t v11 = [(JFXComposition *)self videoComposition];
    objc_msgSend(v11, "setRenderSize:", v5, v7);

    -[JFXComposition setPreviousRenderSize:](self, "setPreviousRenderSize:", v5, v7);
  }
}

- (void)refreshAVComposition
{
  uint64_t v3 = (void *)MEMORY[0x237DD1350](self, a2);
  double v4 = [(JFXComposition *)self trackGroupA];
  double v5 = [(JFXComposition *)self assetsUsed];
  [v4 apply:v5];

  double v6 = [(JFXComposition *)self trackGroupB];
  double v7 = [(JFXComposition *)self assetsUsed];
  [v6 apply:v7];

  [(JFXComposition *)self removeEmptyTracks];
  double v8 = [(JFXComposition *)self videoComposition];
  double v9 = [(JFXComposition *)self videoCompositionInstructions];
  [v8 setInstructions:v9];

  [(JFXComposition *)self updateRenderSizeIfNeeded];
  [(JFXComposition *)self setRenderScale];
}

- (AVPlayerItem)playerItem
{
  if ([(JFXComposition *)self needsUpdate])
  {
    [(JFXComposition *)self updateRenderSizeIfNeeded];
    [(JFXComposition *)self update];
  }
  uint64_t v3 = [(JFXComposition *)self avPlayerItem];

  if (!v3)
  {
    [(JFXComposition *)self refreshAVComposition];
    double v4 = (void *)MEMORY[0x263EFA800];
    uint64_t v5 = [(JFXComposition *)self avComposition];
    double v6 = (void *)[(id)v5 copy];
    double v7 = [v4 playerItemWithAsset:v6];
    [(JFXComposition *)self setAvPlayerItem:v7];

    double v8 = [(JFXComposition *)self avPlayerItem];
    [v8 setSeekingWaitsForVideoCompositionRendering:1];

    double v9 = [(JFXComposition *)self avPlayerItem];
    LOBYTE(v5) = objc_opt_respondsToSelector();

    if (v5)
    {
      uint64_t v10 = [(JFXComposition *)self avPlayerItem];
      [v10 setAppliesPerFrameHDRDisplayMetadata:0];
    }
    uint64_t v11 = *MEMORY[0x263EF95E8];
    double v12 = [(JFXComposition *)self avPlayerItem];
    [v12 setAudioTimePitchAlgorithm:v11];
  }
  return [(JFXComposition *)self avPlayerItem];
}

- (void)JFX_applyPropertiesForCustomVideoCompositor:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    if ([(JFXComposition *)self parentCode] != -1) {
      objc_msgSend(v4, "setParentCode:", -[JFXComposition parentCode](self, "parentCode"));
    }
    uint64_t v5 = [(JFXComposition *)self clipsDataSource];
    int v6 = [v5 isExporting];

    if (v6) {
      [v4 setImmediatelyCancelPendingRequests:1];
    }
    double v7 = [v4 videoCompositingContext];
    double v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
    double v9 = [v8 dictionaryRepresentation];
    [v7 setContext:v9];

    uint64_t v10 = [(JFXComposition *)self compositionOutputColorSpace];
    [v4 setOutputColorSpace:v10];
  }
  else
  {
    uint64_t v11 = JFXLog_playback();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[JFXComposition JFX_applyPropertiesForCustomVideoCompositor:]();
    }
  }
}

- (void)applyExportProperties
{
  [(JFXComposition *)self updateRenderSizeIfNeeded];
  [(JFXComposition *)self update];
  [(JFXComposition *)self refreshAVComposition];
  [(JFXComposition *)self JFX_finalizeVideoComposition];
}

- (void)applyPlayerItemProperties
{
  [(JFXComposition *)self JFX_finalizeVideoComposition];
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFA050];
  uint64_t v5 = [(JFXComposition *)self avPlayerItem];
  [v3 addObserver:self selector:sel_playerItemDidReachEnd_ name:v4 object:v5];

  int v6 = [(JFXComposition *)self avPlayerItem];
  double v7 = [(JFXComposition *)self videoComposition];
  [v6 setVideoComposition:v7];

  double v8 = [(JFXComposition *)self avPlayerItem];
  id v9 = [v8 customVideoCompositor];

  [(JFXComposition *)self JFX_applyPropertiesForCustomVideoCompositor:v9];
}

- (void)clearPlayerItemProperties
{
  uint64_t v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263EFA050];
  uint64_t v5 = [(JFXComposition *)self avPlayerItem];
  [v3 removeObserver:self name:v4 object:v5];

  [(JFXComposition *)self markDirty];
  int v6 = [(JFXComposition *)self videoComposition];
  [v6 setCustomVideoCompositorClass:0];

  id v7 = objc_alloc_init(MEMORY[0x263EFA7A0]);
  [(JFXComposition *)self setVideoComposition:v7];

  id v9 = [(JFXComposition *)self avPlayerItem];
  double v8 = [(JFXComposition *)self videoComposition];
  [v9 setVideoComposition:v8];
}

- (PVColorSpace)compositionOutputColorSpace
{
  uint64_t v3 = [MEMORY[0x263F1C5C0] currentDevice];
  if (objc_msgSend(v3, "jfx_supportsHDR"))
  {
    uint64_t v4 = [(JFXComposition *)self clipsDataSource];
    uint64_t v5 = [v4 count];

    if (v5 >= 1)
    {
      int v6 = [(JFXComposition *)self clipsDataSource];
      id v7 = [v6 colorSpace];

      double v8 = [(JFXComposition *)self clipsDataSource];
      LODWORD(v6) = [v8 isExporting];

      if (v6)
      {
        id v9 = v7;
      }
      else
      {
        uint64_t v10 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v11 = objc_msgSend(v10, "jfx_displayColorSpace");

        double v12 = [MEMORY[0x263F1C5C0] currentDevice];
        uint64_t v13 = objc_msgSend(v12, "jfx_recommendedDisplayColorSpaceForColorSpace:", v7);

        uint64_t v14 = objc_msgSend(MEMORY[0x263F61230], "jfx_compareAndChooseLesserColorSpace:right:", v11, v13);
        int v15 = [MEMORY[0x263F1C5C0] currentDevice];
        objc_msgSend(v15, "jfx_recommendedDisplayColorSpaceForColorSpace:", v14);
        id v9 = (id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_9;
    }
  }
  else
  {
  }
  id v9 = [MEMORY[0x263F61230] rec709GammaColorSpace];
LABEL_9:
  return (PVColorSpace *)v9;
}

- (void)JFX_finalizeVideoComposition
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "WARNING: Composition (%p) does not have parentCode which will make it difficult to see rendering associated with composition in Ariadne traces", v2, v3, v4, v5, v6);
}

- (void)playerItemDidReachEnd:(id)a3
{
  uint64_t v3 = [(JFXComposition *)self avPlayerItem];
  id v4 = [v3 customVideoCompositor];

  [v4 printAndClearStats];
}

- ($70930193D4F448A53BB9343C0237EB5F)timeRangeForClip:(SEL)a3
{
  id v6 = a4;
  int v7 = [v6 presentationTime];
  int v8 = [v6 duration];

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  int64_t v9 = v7;
  uint64_t v10 = [(JFXComposition *)self clipsDataSource];
  CMTimeMake(&start, v9, [v10 timeScale]);
  uint64_t v11 = [(JFXComposition *)self clipsDataSource];
  CMTimeMake(&v13, v8, [v11 timeScale]);
  CMTimeRangeMake((CMTimeRange *)retstr, &start, &v13);

  return result;
}

- (int)outputFrameRate
{
  uint64_t v2 = [(JFXComposition *)self clipsDataSource];
  int v3 = [v2 frameRate];

  return v3;
}

- (void)burnInPlaybackSettings:(id)a3
{
  int v3 = [a3 outputNode];
}

- (BOOL)JFX_isContigousSplitClip:(id)a3 nextClip:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 mediaStartOffset];
  int v8 = [v5 mediaStartOffset];
  if (v7 == [v5 duration] + v8)
  {
    int64_t v9 = [v5 mediaItem];
    uint64_t v10 = [v6 mediaItem];
    char v11 = [v9 isEqual:v10];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

+ (Class)instructionBuilderClass
{
  return (Class)objc_opt_class();
}

- (id)newInstructionGraphNodeForClip:(id)a3 clipTransform:(CGAffineTransform *)a4 compositionTrackID:(int)a5 requiresTweening:(BOOL *)a6 isContainedClip:(BOOL)a7
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  char v11 = [(JFXComposition *)self clipsDataSource];
  [v11 renderSize];
  double v13 = v12;
  double v15 = v14;

  id v16 = [(JFXComposition *)self clipsDataSource];
  [v16 frameSize];
  double v18 = v17;
  double v20 = v19;

  id v21 = [(JFXComposition *)self compositionOutputColorSpace];
  BOOL v22 = objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "instructionBuilderClass")), "initWithOutputSize:frameSize:outputColorSpace:", v21, v13, v15, v18, v20);
  id v23 = [(JFXComposition *)self clipsDataSource];
  uint64_t v24 = [v23 isExporting];

  [v22 setRenderingIntent:v24];
  uint64_t v25 = [v10 playableEffectStack];
  v47[0] = MEMORY[0x263EF8330];
  v47[1] = 3221225472;
  v47[2] = __115__JFXComposition_newInstructionGraphNodeForClip_clipTransform_compositionTrackID_requiresTweening_isContainedClip___block_invoke;
  _OWORD v47[3] = &unk_264C0A228;
  double v49 = v13;
  double v50 = v15;
  uint64_t v26 = (JFXPlayableElement *)v10;
  long long v48 = v26;
  [v25 enumerateObjectsUsingBlock:v47];

  uint64_t v27 = [(JFXComposition *)self liveTransformClip];

  if (v27 && self->_liveTransformClip != v26)
  {
    id v28 = JFXLog_playback();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
      -[JFXComposition newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:]();
    }
  }
  [(JFXComposition *)self timeRangeForClip:v26];
  uint64_t v29 = [(JFXComposition *)self liveTransformClip];
  if (v29) {
    p_liveCompositionTransform = &self->_liveCompositionTransform;
  }
  else {
    p_liveCompositionTransform = 0;
  }
  long long v31 = [(JFXComposition *)self clipCustomRendererMap];
  uint64_t v32 = [v31 objectForKey:v26];
  long long v33 = *(_OWORD *)&a4->c;
  v45[0] = *(_OWORD *)&a4->a;
  v45[1] = v33;
  v45[2] = *(_OWORD *)&a4->tx;
  float v34 = [v22 instructionGraphForPlayableElement:v26 presentationTimeRange:v46 sourceTransform:v45 compositionTrackID:v7 liveTransform:p_liveCompositionTransform excludingEffectType:0 customRendererProperties:v32];

  if (a6)
  {
    if ([(JFXPlayableElement *)v26 mediaType] == 2)
    {
      BOOL v35 = 1;
      goto LABEL_22;
    }
    if ([(JFXPlayableElement *)v26 mediaType] == 1)
    {
      if ((int)v7 < 1)
      {
        BOOL v35 = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v36 = [(JFXPlayableElement *)v26 mediaType];
      BOOL v35 = 0;
      if ((int)v7 < 1 || v36 != 9)
      {
LABEL_22:
        int v40 = [(JFXPlayableElement *)v26 playableEffectStack];
        uint64_t v41 = [v40 count];

        if (v41) {
          BOOL v42 = 1;
        }
        else {
          BOOL v42 = v35;
        }
        *a6 = v42;
        goto LABEL_26;
      }
    }
    long long v37 = [(JFXPlayableElement *)v26 mediaItem];
    [v37 frameRate];
    float v39 = v38 * 1.1;
    BOOL v35 = v39 > 0.0 && v39 < (float)[(JFXComposition *)self outputFrameRate];

    goto LABEL_22;
  }
LABEL_26:

  return v34;
}

void __115__JFXComposition_newInstructionGraphNodeForClip_clipTransform_compositionTrackID_requiresTweening_isContainedClip___block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 48);
  id v5 = a2;
  objc_msgSend(v5, "setRenderSize:", v3, v4);
  objc_msgSend(v5, "setPlayableAspectRatio:", objc_msgSend(*(id *)(a1 + 32), "playableAspectRatio"));
  objc_msgSend(v5, "setPlayableAspectRatioPreservationMode:", objc_msgSend(*(id *)(a1 + 32), "playableAspectRatioPreservationMode"));
}

- (void)setPlayerItem:(id)a3
{
}

- (AVMutableComposition)avComposition
{
  return self->_avComposition;
}

- (void)setAvComposition:(id)a3
{
}

- (AVMutableVideoComposition)videoComposition
{
  return self->_videoComposition;
}

- (void)setVideoComposition:(id)a3
{
}

- (AVMutableAudioMix)audioMix
{
  return self->_audioMix;
}

- (void)setAudioMix:(id)a3
{
}

- (float)globalAudioVolume
{
  return self->_globalAudioVolume;
}

- (void)setGlobalAudioVolume:(float)a3
{
  self->_globalAudioVolume = a3;
}

- (void)setDuration:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  self->_duration.epoch = a3->var3;
  *(_OWORD *)&self->_duration.value = v3;
}

- (CGSize)viewSize
{
  double width = self->_viewSize.width;
  double height = self->_viewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unsigned)parentCode
{
  return self->_parentCode;
}

- (void)setParentCode:(unsigned int)a3
{
  self->_parentCode = a3;
}

- (NSMapTable)clipCustomRendererMap
{
  return self->_clipCustomRendererMap;
}

- (void)setClipCustomRendererMap:(id)a3
{
}

- (NSMapTable)clipFaceTrackingPlaybackDelegates
{
  return self->_clipFaceTrackingPlaybackDelegates;
}

- (void)setClipFaceTrackingPlaybackDelegates:(id)a3
{
}

- (AVPlayerItem)avPlayerItem
{
  return self->_avPlayerItem;
}

- (void)setAvPlayerItem:(id)a3
{
}

- (JFXCompositionTrackGroup)trackGroupA
{
  return self->_trackGroupA;
}

- (void)setTrackGroupA:(id)a3
{
}

- (JFXCompositionTrackGroup)trackGroupB
{
  return self->_trackGroupB;
}

- (void)setTrackGroupB:(id)a3
{
}

- (NSMutableArray)audioMixParameters
{
  return self->_audioMixParameters;
}

- (void)setAudioMixParameters:(id)a3
{
}

- (JFXCompositionPlayableElementsDataSource)clipsDataSource
{
  return self->_clipsDataSource;
}

- (void)setClipsDataSource:(id)a3
{
}

- (NSMutableArray)videoCompositionInstructions
{
  return self->_videoCompositionInstructions;
}

- (void)setVideoCompositionInstructions:(id)a3
{
}

- (CGSize)previousRenderSize
{
  double width = self->_previousRenderSize.width;
  double height = self->_previousRenderSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setPreviousRenderSize:(CGSize)a3
{
  self->_previousRenderSize = a3;
}

- (int64_t)backgroundAudioTrackCount
{
  return self->_backgroundAudioTrackCount;
}

- (void)setBackgroundAudioTrackCount:(int64_t)a3
{
  self->_backgroundAudioTrackCount = a3;
}

- (int64_t)foregroundAudioTrackCount
{
  return self->_foregroundAudioTrackCount;
}

- (void)setForegroundAudioTrackCount:(int64_t)a3
{
  self->_foregroundAudioTrackCount = a3;
}

- (BOOL)needsUpdate
{
  return self->_needsUpdate;
}

- (void)setNeedsUpdate:(BOOL)a3
{
  self->_needsUpdate = a3;
}

- (JFXPlayableElement)liveTransformClip
{
  return self->_liveTransformClip;
}

- (void)setLiveTransformClip:(id)a3
{
}

- (PVTransformAnimationInfo)liveCompositionTransform
{
  long long v3 = *(_OWORD *)&self[4].time.value;
  *(_OWORD *)&retstr->time.value = *(_OWORD *)&self[3].scale;
  *(_OWORD *)&retstr->time.epoch = v3;
  *(_OWORD *)&retstr->translation.y = *(_OWORD *)&self[4].time.epoch;
  retstr->rotation = self[4].translation.y;
  return self;
}

- (void)setLiveCompositionTransform:(PVTransformAnimationInfo *)a3
{
  long long v3 = *(_OWORD *)&a3->time.value;
  long long v4 = *(_OWORD *)&a3->time.epoch;
  long long v5 = *(_OWORD *)&a3->translation.y;
  self->_liveCompositionTransform.rotation = a3->rotation;
  *(_OWORD *)&self->_liveCompositionTransform.time.epoch = v4;
  *(_OWORD *)&self->_liveCompositionTransform.translation.y = v5;
  *(_OWORD *)&self->_liveCompositionTransform.time.value = v3;
}

- (NSMutableDictionary)assetsUsed
{
  return self->_assetsUsed;
}

- (void)setAssetsUsed:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetsUsed, 0);
  objc_storeStrong((id *)&self->_liveTransformClip, 0);
  objc_storeStrong((id *)&self->_videoCompositionInstructions, 0);
  objc_storeStrong((id *)&self->_clipsDataSource, 0);
  objc_storeStrong((id *)&self->_audioMixParameters, 0);
  objc_storeStrong((id *)&self->_trackGroupB, 0);
  objc_storeStrong((id *)&self->_trackGroupA, 0);
  objc_storeStrong((id *)&self->_avPlayerItem, 0);
  objc_storeStrong((id *)&self->_clipFaceTrackingPlaybackDelegates, 0);
  objc_storeStrong((id *)&self->_clipCustomRendererMap, 0);
  objc_storeStrong((id *)&self->_audioMix, 0);
  objc_storeStrong((id *)&self->_videoComposition, 0);
  objc_storeStrong((id *)&self->_avComposition, 0);
  objc_storeStrong((id *)&self->_playerItem, 0);
}

- (void)updateVideoAndAudioInstructionForState:previousInstructions:waitingForResource:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "clip mediaType %ld not implemented...", v2, v3, v4, v5, v6);
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "noteEffectChangeForClip called with nil avPlayerItem !", v1, 2u);
}

- (void)rebuildCompositionInstructionsForVideoStillTitleCard:(os_log_t)log .cold.2(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *uint8_t buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_234C41000, log, OS_LOG_TYPE_ERROR, "noteEffectChangeForClip: unsuported clipType...", buf, 2u);
}

- (void)noteEffectChangeForClip:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_234C41000, v0, v1, "noteEffectChangeForClip does not understand that clip type: %@", v2, v3, v4, v5, v6);
}

- (void)validate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Composition:\n", v2, v3, v4, v5, v6);
}

- (void)JFX_applyPropertiesForCustomVideoCompositor:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_234C41000, v0, OS_LOG_TYPE_ERROR, "WARNING!!! Trying to update nonexistent customVideoCompositor instance", v1, 2u);
}

- (void)newInstructionGraphNodeForClip:clipTransform:compositionTrackID:requiresTweening:isContainedClip:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_234C41000, v0, v1, "Oops, liveTransformClip mismatch !", v2, v3, v4, v5, v6);
}

@end