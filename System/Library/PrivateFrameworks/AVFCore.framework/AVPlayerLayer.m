@interface AVPlayerLayer
+ (AVPlayerLayer)playerLayerWithPlayer:(AVPlayer *)player;
+ (id)keyPathsForValuesAffectingVideoRect;
+ (id)makeClosedCaptionLayer;
+ (void)_swapSublayersBetweenPlayerLayer:(id)a3 andPlayerLayer:(id)a4;
- (AVLayerVideoGravity)videoGravity;
- (AVPlayer)player;
- (AVPlayerLayer)init;
- (AVPlayerLayer)initWithLayer:(id)a3;
- (BOOL)_currentWindowSceneIsForeground;
- (BOOL)_currentWindowSceneIsForegroundDefault;
- (BOOL)_isConnectedToSecondScreen;
- (BOOL)_isPartOfForegroundScene;
- (BOOL)_preventsChangesToSublayerHierarchy;
- (BOOL)_showInterstitialInstead;
- (BOOL)_willManageSublayersAsSwappedLayers;
- (BOOL)isForScrubbingOnly;
- (BOOL)isLanczosFilterDownscalingEnabled;
- (BOOL)isLegibleDisplayEnabled;
- (BOOL)isOverscanSubtitleSupportEnabled;
- (BOOL)isPIPModeEnabled;
- (BOOL)isReadyForDisplay;
- (CGRect)_videoRectForBounds:(CGRect)a3;
- (CGRect)videoRect;
- (CGSize)_displaySize;
- (CGSize)_playerCurrentItemPresentationSize;
- (CVPixelBufferRef)copyDisplayedPixelBuffer;
- (NSDictionary)pixelBufferAttributes;
- (NSEdgeInsets)legibleContentInsets;
- (float)_percentCoverageRelativeToRootLayer;
- (id)_STSLabel;
- (id)_associatedRemoteModeLayer;
- (id)_closedCaptionLayer;
- (id)_interstitialLayer;
- (id)_maskLayer;
- (id)_sublayersForPIP;
- (id)_subtitleLayer;
- (id)_videoLayer;
- (id)placeholderContentLayerDuringPIPMode;
- (id)playerPublisher;
- (id)videoPerformanceMetrics;
- (int64_t)_activeMode;
- (int64_t)lanczosFilterDownscaleFactor;
- (void)_addAnimationsForClosedCaptionLayer:(id)a3 gravity:(id)a4 forKey:(id)a5;
- (void)_addAnimationsForMaskLayer:(id)a3 forKey:(id)a4;
- (void)_addAnimationsForPIPPlaceholderLayer:(id)a3 forKey:(id)a4;
- (void)_addAnimationsForVideoLayer:(id)a3 size:(CGSize)a4 gravity:(id)a5 forKey:(id)a6;
- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5;
- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5;
- (void)_addSublayerTransformAnimationToLayer:(id)a3 fromTransform:(CATransform3D *)a4 usingAnimation:(id)a5 gravity:(id)a6 presentationSize:(CGSize)a7 forKey:(id)a8;
- (void)_applyCurrentItemPresentationSizeChangeAndForceUpdate:(BOOL)a3;
- (void)_associateWithLayer:(id)a3 forMode:(int64_t)a4;
- (void)_configurePlayerWhenEnteringPIP;
- (void)_configurePlayerWhenLeavingPIP;
- (void)_disassociateWithLayerForMode:(int64_t)a3;
- (void)_enterPIPModeRedirectingVideoToLayer:(id)a3;
- (void)_enterSecondScreenModeRedirectingVideoToLayer:(id)a3;
- (void)_forBoundsAnimations:(id)a3 applyBlock:(id)a4;
- (void)_forceLayout;
- (void)_forceWindowSceneEvent:(BOOL)a3;
- (void)_getMaskLayer:(id *)a3 videoLayer:(id *)a4 subtitleLayer:(id *)a5 closedCaptionLayer:(id *)a6 interstitialLayer:(id *)a7;
- (void)_handleIsDisplayingClosedCaptionsDidChange:(BOOL)a3 player:(id)a4;
- (void)_handleNonForcedSubtitleDisplayDidChange:(BOOL)a3 player:(id)a4;
- (void)_handlePlayerCurrentItemDidChangeForPlayer:(id)a3;
- (void)_leavePIPModeForLayer:(id)a3;
- (void)_leaveSecondScreenModeForLayer:(id)a3;
- (void)_mergeClientLayersIntoMaskLayer:(id)a3;
- (void)_notifyPlayerOfDisplaySize;
- (void)_notifyPlayerOfLayerForegroundStateChange;
- (void)_restoreClientLayers:(id)a3 intoMaskLayer:(id)a4;
- (void)_setIsConnectedToSecondScreen:(BOOL)a3;
- (void)_setIsPartOfForegroundScene:(BOOL)a3;
- (void)_setPlayer:(id)a3 forPIP:(BOOL)a4;
- (void)_setPreventsChangesToSublayerHierarchy:(BOOL)a3;
- (void)_setShowInterstitialInstead:(BOOL)a3;
- (void)_setShowInterstitialInstead:(BOOL)a3 afterDelay:(double)a4;
- (void)_setSublayersForPIP:(id)a3;
- (void)_setSublayersPreventChangesToSublayerHierarchy:(BOOL)a3;
- (void)_setWillManageSublayersAsSwappedLayers:(BOOL)a3;
- (void)_startObservingPlayer:(id)a3;
- (void)_stashClientLayers;
- (void)_stopObservingPlayer:(id)a3;
- (void)_unstashClientLayers;
- (void)_updateIsPartOfForegroundScene;
- (void)_updateReadyForDisplayForPlayerCurrentItem;
- (void)_windowSceneDidEnterBackground;
- (void)_windowSceneDidEnterBackground:(id)a3;
- (void)_windowSceneWillEnterForeground;
- (void)_windowSceneWillEnterForeground:(id)a3;
- (void)addAnimation:(id)a3 forKey:(id)a4;
- (void)addCallbackToCancelDuringDeallocation:(id)a3;
- (void)addSublayer:(id)a3;
- (void)dealloc;
- (void)declareKeyPathDependenciesWithRegistry:(id)a3;
- (void)enterPIPModeRedirectingVideoToLayer:(id)a3;
- (void)hasEnqueuedVideoFrameChanged:(id)a3;
- (void)insertSublayer:(id)a3 above:(id)a4;
- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4;
- (void)insertSublayer:(id)a3 below:(id)a4;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)layoutSublayers;
- (void)leavePIPMode;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeAllAnimations;
- (void)removeAnimationForKey:(id)a3;
- (void)removeFromSuperlayer;
- (void)replaceSublayer:(id)a3 with:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentsScale:(double)a3;
- (void)setForScrubbingOnly:(BOOL)a3;
- (void)setLanczosFilterDownscaleFactor:(int64_t)a3;
- (void)setLanczosFilterDownscalingEnabled:(BOOL)a3;
- (void)setLegibleContentInsets:(NSEdgeInsets)a3;
- (void)setLegibleDisplayEnabled:(BOOL)a3;
- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3;
- (void)setPIPModeEnabled:(BOOL)a3;
- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes;
- (void)setPlaceholderContentLayerDuringPIPMode:(id)a3;
- (void)setPlayer:(AVPlayer *)player;
- (void)setSublayers:(id)a3;
- (void)setToneMapToStandardDynamicRange:(BOOL)a3;
- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity;
- (void)startRedirectingVideoToLayer:(id)a3 forMode:(int64_t)a4;
- (void)stopRedirectingVideoToLayer:(id)a3;
@end

@implementation AVPlayerLayer

id __23__AVPlayerLayer_player__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 80);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

id __29__AVPlayerLayer_videoGravity__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 88);
  if (result)
  {
    id result = (id)[result copyWithZone:0];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

+ (id)keyPathsForValuesAffectingVideoRect
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"bounds", @"videoGravity", @"playerCurrentItemPresentationSize", 0);
}

id __93__AVPlayerLayer__getMaskLayer_videoLayer_subtitleLayer_closedCaptionLayer_interstitialLayer___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = *(id *)(*(void *)(a1[4] + 32) + 120);
  *(void *)(*(void *)(a1[6] + 8) + 40) = *(id *)(*(void *)(a1[4] + 32) + 128);
  *(void *)(*(void *)(a1[7] + 8) + 40) = *(id *)(*(void *)(a1[4] + 32) + 136);
  *(void *)(*(void *)(a1[8] + 8) + 40) = *(id *)(*(void *)(a1[4] + 32) + 144);
  id result = *(id *)(*(void *)(a1[4] + 32) + 152);
  *(void *)(*(void *)(a1[9] + 8) + 40) = result;
  return result;
}

uint64_t __41__AVPlayerLayer__isPartOfForegroundScene__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 192);
  return result;
}

- (void)setPlayer:(AVPlayer *)player
{
}

uint64_t __50__AVPlayerLayer_isLanczosFilterDownscalingEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 104);
  return result;
}

uint64_t __52__AVPlayerLayer__willManageSublayersAsSwappedLayers__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 176);
  return result;
}

id __43__AVPlayerLayer__associatedRemoteModeLayer__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 168);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setLegibleContentInsets:(NSEdgeInsets)a3
{
  *(CGFloat *)&long long v18 = a3.top;
  *((void *)&v18 + 1) = *(void *)&a3.left;
  *(CGFloat *)&long long v19 = a3.bottom;
  *((void *)&v19 + 1) = *(void *)&a3.right;
  uint64_t v17 = 0;
  id v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v17 videoLayer:&v16 subtitleLayer:&v15 closedCaptionLayer:&v14 interstitialLayer:0];
  playerLayer = self->_playerLayer;
  if (playerLayer) {
    BOOL v5 = v16 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    p_top = (_OWORD *)&playerLayer->legibleContentInsets.top;
    long long v7 = v19;
    _OWORD *p_top = v18;
    p_top[1] = v7;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryDimensionMake();
    FigGeometryMarginsMake();
    if (v15)
    {
      v9[0] = v10;
      v9[1] = v11;
      v9[2] = v12;
      v9[3] = v13;
      [v15 setCaptionsAvoidanceMargins:v9];
    }
    v8 = [(AVPlayerLayer *)self player];
    [(AVPlayer *)v8 _updateClosedCaptionLayerBounds:v14 videoRelativeToViewport:0 captionsAvoidanceMargins:&v18];
  }
}

- (void)layoutSublayers
{
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  uint64_t v50 = 0;
  uint64_t v51 = 0;
  uint64_t v49 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v53 videoLayer:&v52 subtitleLayer:&v51 closedCaptionLayer:&v50 interstitialLayer:&v49];
  if (self->_playerLayer) {
    BOOL v3 = v52 == 0;
  }
  else {
    BOOL v3 = 1;
  }
  if (!v3)
  {
    [(AVPlayerLayer *)self bounds];
    double x = v54.origin.x;
    double y = v54.origin.y;
    double width = v54.size.width;
    double height = v54.size.height;
    double v8 = fabs(CGRectGetMidX(v54));
    v55.origin.double x = x;
    v55.origin.double y = y;
    v55.size.double width = width;
    v55.size.double height = height;
    double v9 = fabs(CGRectGetMidY(v55));
    [(AVPlayerLayer *)self _playerCurrentItemPresentationSize];
    double v11 = v10;
    double v13 = v12;
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    long long v45 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    long long v46 = v14;
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
    long long v47 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
    long long v48 = v15;
    long long v16 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
    long long v41 = *MEMORY[0x1E4F39B10];
    long long v42 = v16;
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
    long long v43 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
    long long v44 = v17;
    long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    long long v39 = *MEMORY[0x1E4F1DB28];
    long long v40 = v18;
    AVLayerTransformForPlacement([(AVPlayerLayer *)self videoGravity], 0, (uint64_t)&v41, v10, v13, width, height);
    BOOL v19 = *(double *)(MEMORY[0x1E4F1DB30] + 8) != v13 || *MEMORY[0x1E4F1DB30] != v11;
    if (v19)
    {
      *(void *)&long long v39 = getVideoPresentationBounds([(AVPlayerLayer *)self videoGravity], v11, v13, x, y, width, height);
      *((void *)&v39 + 1) = v20;
      *(void *)&long long v40 = v21;
      *((void *)&v40 + 1) = v22;
    }
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __32__AVPlayerLayer_layoutSublayers__block_invoke;
    v25[3] = &unk_1E57B1EF0;
    *(double *)&v25[10] = x;
    *(double *)&v25[11] = y;
    *(double *)&v25[12] = width;
    *(double *)&v25[13] = height;
    v25[4] = self;
    v25[5] = v53;
    v25[6] = v49;
    v25[7] = v51;
    BOOL v38 = v19;
    *(double *)&v25[14] = v11;
    *(double *)&v25[15] = v13;
    long long v27 = v40;
    long long v26 = v39;
    v25[8] = v52;
    v25[9] = v50;
    double v28 = v8;
    double v29 = v9;
    long long v33 = v44;
    long long v32 = v43;
    long long v31 = v42;
    long long v30 = v41;
    long long v37 = v48;
    long long v36 = v47;
    long long v35 = v46;
    long long v34 = v45;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v25);
    v23 = [(AVPlayerLayer *)self player];
    [(AVPlayer *)v23 _updateClosedCaptionLayerBounds:v50 videoRelativeToViewport:&v39 captionsAvoidanceMargins:&self->_playerLayer->legibleContentInsets];
  }
  v24.receiver = self;
  v24.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v24 layoutSublayers];
}

- (void)_applyCurrentItemPresentationSizeChangeAndForceUpdate:(BOOL)a3
{
  [(AVPlayerLayer *)self _playerCurrentItemPresentationSize];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v11 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:&v13 subtitleLayer:&v12 closedCaptionLayer:&v11 interstitialLayer:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__AVPlayerLayer__applyCurrentItemPresentationSizeChangeAndForceUpdate___block_invoke;
  v9[3] = &unk_1E57B1FB0;
  v9[6] = v6;
  v9[7] = v8;
  BOOL v10 = a3;
  _OWORD v9[4] = v13;
  v9[5] = self;
  AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v9);
  [(AVPlayerLayer *)self _notifyPlayerOfDisplaySize];
}

- (void)_getMaskLayer:(id *)a3 videoLayer:(id *)a4 subtitleLayer:(id *)a5 closedCaptionLayer:(id *)a6 interstitialLayer:(id *)a7
{
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3052000000;
  long long v41 = __Block_byref_object_copy_;
  long long v42 = __Block_byref_object_dispose_;
  uint64_t v43 = 0;
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x3052000000;
  long long v35 = __Block_byref_object_copy_;
  long long v36 = __Block_byref_object_dispose_;
  uint64_t v37 = 0;
  uint64_t v26 = 0;
  long long v27 = &v26;
  uint64_t v28 = 0x3052000000;
  double v29 = __Block_byref_object_copy_;
  long long v30 = __Block_byref_object_dispose_;
  uint64_t v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  v23 = __Block_byref_object_copy_;
  objc_super v24 = __Block_byref_object_dispose_;
  uint64_t v25 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3052000000;
  long long v17 = __Block_byref_object_copy_;
  long long v18 = __Block_byref_object_dispose_;
  uint64_t v19 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__AVPlayerLayer__getMaskLayer_videoLayer_subtitleLayer_closedCaptionLayer_interstitialLayer___block_invoke;
  v13[3] = &unk_1E57B21D8;
  v13[4] = self;
  v13[5] = &v38;
  v13[6] = &v32;
  v13[7] = &v26;
  v13[8] = &v20;
  v13[9] = &v14;
  dispatch_sync(serialQueue, v13);
  if (a3) {
    *a3 = (id)v39[5];
  }
  if (a4) {
    *a4 = (id)v33[5];
  }
  if (a5) {
    *a5 = (id)v27[5];
  }
  if (a6) {
    *a6 = (id)v21[5];
  }
  if (a7) {
    *a7 = (id)v15[5];
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v38, 8);
}

- (void)_notifyPlayerOfDisplaySize
{
  v2 = [(AVPlayerLayer *)self player];
  [(AVPlayer *)v2 _evaluateDisplaySizeOfAllAttachedLayers];
}

- (CGSize)_playerCurrentItemPresentationSize
{
  v2 = [(AVPlayerLayer *)self player];
  [(AVPlayer *)v2 _cachedPresentationSizeOfCurrentItem];
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (AVPlayer)player
{
  uint64_t v8 = 0;
  double v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  uint64_t v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    double v3 = playerLayer->player;
    v9[5] = (uint64_t)v3;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __23__AVPlayerLayer_player__block_invoke;
    v7[3] = &unk_1E57B2110;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(serialQueue, v7);
    double v3 = (AVPlayer *)v9[5];
  }
  uint64_t v5 = v3;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (CGSize)_displaySize
{
  playerLayer = self->_playerLayer;
  if (playerLayer->honorContentScale)
  {
    [(AVPlayerLayer *)self contentsScale];
    double screenScale = v4;
  }
  else
  {
    double screenScale = playerLayer->screenScale;
  }
  if ([(AVPlayerLayer *)self context])
  {
    double v6 = 1.0;
    if (screenScale >= 1.0) {
      double v6 = screenScale;
    }
    CGAffineTransformMakeScale(&v21, v6, v6);
    double a = v21.a;
    double b = v21.b;
    double c = v21.c;
    double d = v21.d;
    [(AVPlayerLayer *)self bounds];
    -[AVPlayerLayer convertRect:toLayer:](self, "convertRect:toLayer:", 0);
  }
  else
  {
    double a = *MEMORY[0x1E4F1DAB8];
    double b = *(double *)(MEMORY[0x1E4F1DAB8] + 8);
    double c = *(double *)(MEMORY[0x1E4F1DAB8] + 16);
    double d = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
    [(AVPlayerLayer *)self bounds];
  }
  double v13 = c * v12 + a * v11;
  double v14 = d * v12 + b * v11;
  [(AVPlayerLayer *)self _playerCurrentItemPresentationSize];
  BOOL v17 = v14 > v13 && v16 < v15;
  if (!v17 && (v14 < v13 ? (BOOL v18 = v16 <= v15) : (BOOL v18 = 1), v18))
  {
    double v19 = v14;
    double v14 = v13;
  }
  else
  {
    double v19 = v13;
  }
  double v20 = v14;
  result.double height = v19;
  result.double width = v20;
  return result;
}

void *__71__AVPlayerLayer__applyCurrentItemPresentationSizeChangeAndForceUpdate___block_invoke(uint64_t a1)
{
  v2 = (_OWORD *)(a1 + 48);
  double v4 = *MEMORY[0x1E4F1DB30];
  double v3 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (*(double *)(a1 + 48) == *MEMORY[0x1E4F1DB30] && *(double *)(a1 + 56) == v3)
  {
    [*(id *)(a1 + 32) bounds];
    BOOL v6 = v8 == v3 && v7 == v4;
  }
  else
  {
    BOOL v6 = 0;
  }
  CGSize result = *(void **)(a1 + 40);
  uint64_t v10 = result[4];
  if (!*(unsigned char *)(a1 + 64)
    && (*(double *)(v10 + 208) == *(double *)(a1 + 48)
      ? (BOOL v11 = *(double *)(v10 + 216) == *(double *)(a1 + 56))
      : (BOOL v11 = 0),
        v11))
  {
    if (!v6) {
      return result;
    }
  }
  else
  {
    *(_OWORD *)(v10 + 208) = *v2;
    CGSize result = *(void **)(a1 + 40);
  }
  return (void *)[result setNeedsLayout];
}

- (CGRect)videoRect
{
  if (self->_playerLayer->showInterstitialInstead)
  {
    id v17 = 0;
    [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v17];
    [v17 videoRect];
  }
  else
  {
    [(AVPlayerLayer *)self bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    [(AVPlayerLayer *)self _playerCurrentItemPresentationSize];
    AVLayerVideoRectForPlayerLayerBoundsPresentationSizeAndVideoGravity([(AVPlayerLayer *)self videoGravity], v8, v10, v12, v14, v15, v16);
  }
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (AVLayerVideoGravity)videoGravity
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x3052000000;
  double v10 = __Block_byref_object_copy_;
  double v11 = __Block_byref_object_dispose_;
  double v12 = @"AVLayerVideoGravityResizeAspect";
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    videoGravitdouble y = playerLayer->videoGravity;
    double v12 = (__CFString *)videoGravity;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __29__AVPlayerLayer_videoGravity__block_invoke;
    v6[3] = &unk_1E57B2160;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(serialQueue, v6);
    videoGravitdouble y = (NSString *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  return videoGravity;
}

uint64_t __32__AVPlayerLayer_layoutSublayers__block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  v2 = (double *)(a1 + 96);
  double v3 = (double *)(a1 + 104);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 248), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  double v4 = *(void **)(a1 + 56);
  if (v4)
  {
    if (*(unsigned char *)(a1 + 304))
    {
      objc_msgSend(v4, "setVideosize:", *(double *)(a1 + 112), *(double *)(a1 + 120));
      objc_msgSend(*(id *)(a1 + 56), "setVideoRelativeToViewport:", *(double *)(a1 + 128), *(double *)(a1 + 136), *(double *)(a1 + 144), *(double *)(a1 + 152));
      double v4 = *(void **)(a1 + 56);
    }
    objc_msgSend(v4, "setViewport:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  }
  int v5 = *(unsigned __int8 *)(a1 + 304);
  if (*(unsigned char *)(a1 + 304))
  {
    v2 = (double *)(a1 + 112);
    double v3 = (double *)(a1 + 120);
    double VideoPresentationBounds = getVideoPresentationBounds(@"AVLayerVideoGravityResizeAspect", *(double *)(a1 + 112), *(double *)(a1 + 120), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double VideoPresentationBounds = *(double *)(a1 + 80);
    double v8 = *(double *)(a1 + 88);
    double v10 = *(double *)(a1 + 96);
    double v12 = *(double *)(a1 + 104);
  }
  BOOL v13 = v5 == 0;
  BOOL v14 = v5 != 0;
  uint64_t v15 = v13;
  [*(id *)(a1 + 64) setHidden:v15];
  [*(id *)(a1 + 64) setShouldResizeVideoLayer:v14];
  objc_msgSend(*(id *)(a1 + 64), "setBounds:", 0.0, 0.0, *v2, *v3);
  [*(id *)(a1 + 64) setNeedsLayout];
  double v16 = *(void **)(a1 + 72);
  v26.origin.double x = VideoPresentationBounds;
  v26.origin.double y = v8;
  v26.size.double width = v10;
  v26.size.double height = v12;
  double MidX = CGRectGetMidX(v26);
  v27.origin.double x = VideoPresentationBounds;
  v27.origin.double y = v8;
  v27.size.double width = v10;
  v27.size.double height = v12;
  objc_msgSend(v16, "setPosition:", MidX, CGRectGetMidY(v27));
  objc_msgSend(*(id *)(a1 + 72), "setBounds:", VideoPresentationBounds, v8, v10, v12);
  objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 8), "setBounds:", *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 64), "setPosition:", *(double *)(a1 + 160), *(double *)(a1 + 168));
  BOOL v18 = *(void **)(a1 + 64);
  long long v19 = *(_OWORD *)(a1 + 256);
  v25[4] = *(_OWORD *)(a1 + 240);
  v25[5] = v19;
  long long v20 = *(_OWORD *)(a1 + 288);
  v25[6] = *(_OWORD *)(a1 + 272);
  v25[7] = v20;
  long long v21 = *(_OWORD *)(a1 + 192);
  v25[0] = *(_OWORD *)(a1 + 176);
  v25[1] = v21;
  long long v22 = *(_OWORD *)(a1 + 224);
  v25[2] = *(_OWORD *)(a1 + 208);
  v25[3] = v22;
  [v18 setSublayerTransform:v25];
  if ([*(id *)(a1 + 32) isLanczosFilterDownscalingEnabled])
  {
    v23 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_videoLayer"), "sublayers"), "firstObject");
    [v23 setMinificationFilter:*MEMORY[0x1E4F39FE0]];
  }
  return [MEMORY[0x1E4F39CF8] commit];
}

- (BOOL)isLanczosFilterDownscalingEnabled
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  char v10 = 0;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__AVPlayerLayer_isLanczosFilterDownscalingEnabled__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __60__AVPlayerLayer__handlePlayerCurrentItemDidChangeForPlayer___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [*(id *)(a1 + 32) clear];
  v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

uint64_t __64__AVPlayerLayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  objc_msgSend(*(id *)(a1 + 40), "setGeometryFlipped:", objc_msgSend(*(id *)(a1 + 32), "contentsAreFlipped") ^ 1);
  v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

void __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _closedCaptionLayer];
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 200))
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke_2;
    v3[3] = &unk_1E57B20E8;
    v3[4] = v2;
    char v4 = *(unsigned char *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], v3);
  }
}

void *__39__AVPlayerLayer__startObservingPlayer___block_invoke_5(uint64_t a1)
{
  CGRect result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    uint64_t v2 = *(void **)(result[4] + 8);
    return (void *)[v2 currentItemTracksChanged];
  }
  return result;
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_7(uint64_t a1, void *a2)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    int v5 = result;
    uint64_t v6 = [a2 BOOLValue];
    uint64_t v7 = *(void *)(a1 + 32);
    return (id)[v5 _handleNonForcedSubtitleDisplayDidChange:v6 player:v7];
  }
  return result;
}

- (void)_handleNonForcedSubtitleDisplayDidChange:(BOOL)a3 player:(id)a4
{
  configurationQueue = self->_playerLayer->configurationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __65__AVPlayerLayer__handleNonForcedSubtitleDisplayDidChange_player___block_invoke;
  v5[3] = &unk_1E57B20C0;
  v5[4] = self;
  v5[5] = a4;
  BOOL v6 = a3;
  AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v5);
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_2(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 32));
  if (result)
  {
    return (id)[result _applyCurrentItemPresentationSizeChangeAndForceUpdate:0];
  }
  return result;
}

- (void)_updateReadyForDisplayForPlayerCurrentItem
{
  if (!self->_playerLayer->isPresentationLayer)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__AVPlayerLayer__updateReadyForDisplayForPlayerCurrentItem__block_invoke;
    v3[3] = &unk_1E57B1E80;
    v3[4] = self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v3);
  }
  [(AVPlayerLayer *)self _applyCurrentItemPresentationSizeChangeAndForceUpdate:1];
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke_6(uint64_t a1, void *a2)
{
  return [a2 nonForcedSubtitleDisplayEnabledPublisher];
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 tracksPublisher];
}

uint64_t __39__AVPlayerLayer__startObservingPlayer___block_invoke(uint64_t a1, void *a2)
{
  return [a2 presentationSizePublisher];
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_3(uint64_t a1)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    return (id)[result _handlePlayerCurrentItemDidChangeForPlayer:v3];
  }
  return result;
}

id __39__AVPlayerLayer__startObservingPlayer___block_invoke_8(uint64_t a1, void *a2)
{
  id result = objc_loadWeak((id *)(a1 + 40));
  if (result)
  {
    int v5 = result;
    uint64_t v6 = [a2 BOOLValue];
    uint64_t v7 = *(void *)(a1 + 32);
    return (id)[v5 _handleIsDisplayingClosedCaptionsDidChange:v6 player:v7];
  }
  return result;
}

- (void)_startObservingPlayer:(id)a3
{
  if (a3)
  {
    if (!self->_playerLayer->playerBeingObserved)
    {
      self->_playerLayer->playerBeingObservedouble d = (AVPlayer *)a3;
      objc_initWeak(location, self);
      int v5 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", [a3 currentItemPublisher], &__block_literal_global_199));
      uint64_t v6 = [AVSinkSubscriber alloc];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_2;
      v23[3] = &unk_1E57B1FF8;
      objc_copyWeak(&v24, location);
      self->_playerLayer->currentItemPresentationSizeSink = [(AVSinkSubscriber *)v6 initWithPublisher:v5 requestingInitialValue:0 sink:v23];
      [(AVPlayerLayer *)self _applyCurrentItemPresentationSizeChangeAndForceUpdate:0];
      LODWORD(v5) = [(AVPlayerLayer *)self _willManageSublayersAsSwappedLayers];
      uint64_t v7 = [AVSinkSubscriber alloc];
      uint64_t v8 = [a3 currentItemPublisher];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_3;
      v21[3] = &unk_1E57B2020;
      objc_copyWeak(&v22, location);
      v21[4] = a3;
      self->_playerLayer->playerCurrentItemSink = [(AVSinkSubscriber *)v7 initWithPublisher:v8 requestingInitialValue:v5 ^ 1 sink:v21];
      uint64_t v9 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", [a3 currentItemPublisher], &__block_literal_global_205));
      char v10 = [AVSinkSubscriber alloc];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_5;
      v19[3] = &unk_1E57B2048;
      objc_copyWeak(&v20, location);
      self->_playerLayer->currentItemTracksSink = [(AVSinkSubscriber *)v10 initWithPublisher:v9 requestingInitialValue:1 sink:v19];
      double v11 = +[AVSwitchToLatestPublisher switchToLatestPublisherWithUpstream:](AVSwitchToLatestPublisher, "switchToLatestPublisherWithUpstream:", +[AVMapPublisher mapPublisherWithUpstream:transform:](AVMapPublisher, "mapPublisherWithUpstream:transform:", [a3 currentItemPublisher], &__block_literal_global_208));
      double v12 = [AVSinkSubscriber alloc];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_7;
      v17[3] = &unk_1E57B2070;
      objc_copyWeak(&v18, location);
      v17[4] = a3;
      self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink = [(AVSinkSubscriber *)v12 initWithPublisher:v11 requestingInitialValue:1 sink:v17];
      uint64_t v13 = [a3 closedCaptionsDisplayPublisher];
      BOOL v14 = [AVSinkSubscriber alloc];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __39__AVPlayerLayer__startObservingPlayer___block_invoke_8;
      v15[3] = &unk_1E57B2070;
      objc_copyWeak(&v16, location);
      v15[4] = a3;
      self->_playerLayer->playerIsDisplayingClosedCaptionsSink = [(AVSinkSubscriber *)v14 initWithPublisher:v13 requestingInitialValue:1 sink:v15];
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&v22);
      objc_destroyWeak(&v24);
      objc_destroyWeak(location);
    }
  }
}

- (void)_handleIsDisplayingClosedCaptionsDidChange:(BOOL)a3 player:(id)a4
{
  configurationQueue = self->_playerLayer->configurationQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke;
  v5[3] = &unk_1E57B20C0;
  v5[4] = self;
  v5[5] = a4;
  BOOL v6 = a3;
  AVSerializeOnQueueAsyncIfNecessary(configurationQueue, v5);
}

uint64_t __41__AVPlayerLayer__showInterstitialInstead__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 193);
  return result;
}

uint64_t __21__AVPlayerLayer_init__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 8) hudEnabled];
  if (result)
  {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 8), "setPlayerLayer:");
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 8) startDispatchTimer];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 8) currentItemChanged];
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 8);
    return [v3 currentItemTracksChanged];
  }
  return result;
}

+ (AVPlayerLayer)playerLayerWithPlayer:(AVPlayer *)player
{
  char v4 = objc_alloc_init(AVPlayerLayer);
  [(AVPlayerLayer *)v4 setPlayer:player];
  return v4;
}

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v16 videoLayer:&v15 subtitleLayer:&v14 closedCaptionLayer:&v13 interstitialLayer:0];
  playerLayer = self->_playerLayer;
  if (playerLayer) {
    BOOL v6 = v15 == 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (v6) {
    goto LABEL_16;
  }
  playerLayer->isVisible = v3;
  if (v3)
  {
    uint64_t v7 = [(AVPlayerLayer *)self context];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
LABEL_12:
        [(AVPlayerLayer *)self _applyCurrentItemPresentationSizeChangeAndForceUpdate:0];
        goto LABEL_13;
      }
      objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend(v8, "contextId")), "screen"), "scale");
    }
    else
    {
      double v9 = 1.0;
    }
    self->_playerLayer->double screenScale = v9;
    goto LABEL_12;
  }
  self->_playerLayer->double screenScale = 1.0;
LABEL_13:
  [(AVPlayerLayer *)self _updateIsPartOfForegroundScene];
  char v10 = self->_playerLayer;
  if (v10->screenScale < 1.0) {
    v10->double screenScale = 1.0;
  }
  uint64_t v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerLayerVisibilityDidChangeNotification" object:self userInfo:0];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v11);
LABEL_16:
  v12.receiver = self;
  v12.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v12 layerDidBecomeVisible:v3];
}

- (void)_updateIsPartOfForegroundScene
{
  BOOL v3 = [(AVPlayerLayer *)self _currentWindowSceneIsForeground];
  [(AVPlayerLayer *)self _setIsPartOfForegroundScene:v3];
}

- (void)_setIsPartOfForegroundScene:(BOOL)a3
{
  serialQueue = self->_playerLayer->serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__AVPlayerLayer__setIsPartOfForegroundScene___block_invoke;
  v5[3] = &unk_1E57B20E8;
  v5[4] = self;
  BOOL v6 = a3;
  dispatch_sync(serialQueue, v5);
  [(AVPlayerLayer *)self _notifyPlayerOfLayerForegroundStateChange];
}

- (void)_notifyPlayerOfLayerForegroundStateChange
{
  BOOL v3 = [(AVPlayerLayer *)self _isPartOfForegroundScene];
  playerLayer = self->_playerLayer;
  BOOL v5 = v3 || playerLayer->lastWindowSceneEvent == 0;
  if (playerLayer->isVisible)
  {
    BOOL v6 = [(AVPlayerLayer *)self _isPartOfForegroundScene];
    if (self->_playerLayer->isVisible) {
      BOOL v5 = 1;
    }
    if (!v5) {
      goto LABEL_11;
    }
LABEL_10:
    if (!v6) {
      return;
    }
    goto LABEL_11;
  }
  BOOL v6 = 0;
  if (v5) {
    goto LABEL_10;
  }
LABEL_11:
  uint64_t v7 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerLayerIsPartOfForegroundSceneDidChangeNotification" object:self userInfo:0];
  uint64_t v8 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotification:v7];
}

- (BOOL)_isPartOfForegroundScene
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  char v10 = 1;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__AVPlayerLayer__isPartOfForegroundScene__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_currentWindowSceneIsForeground
{
  BOOL v3 = [(AVPlayerLayer *)self _currentWindowSceneIsForegroundDefault];
  char v4 = objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene");
  if (v4)
  {
    BOOL v5 = v4;
    return ![v4 activationState] || objc_msgSend(v5, "activationState") == 1;
  }
  return v3;
}

uint64_t __59__AVPlayerLayer__updateReadyForDisplayForPlayerCurrentItem__block_invoke(uint64_t a1)
{
  int v2 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "player"), "currentItem"), "_hasEnqueuedVideoFrame");
  MEMORY[0x199715030](*(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
  int v4 = *(unsigned __int8 *)(v3 + 194);
  uint64_t result = MEMORY[0x199715040](*(void *)(v3 + 32));
  if (v4 != v2)
  {
    uint64_t v6 = [*(id *)(a1 + 32) superlayer];
    uint64_t v7 = *(void **)(a1 + 32);
    if (v6
      && ([v7 superlayer],
          objc_opt_class(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          uint64_t v7 = *(void **)(a1 + 32),
          (isKindOfClass & 1) != 0))
    {
      uint64_t v9 = (void *)[v7 superlayer];
      uint64_t v11 = 0;
      [v9 _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v11];
      uint64_t v7 = *(void **)(a1 + 32);
      BOOL v10 = v11 == v7;
      if (v11 == v7)
      {
        [v9 willChangeValueForKey:@"readyForDisplay"];
        uint64_t v7 = *(void **)(a1 + 32);
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    [v7 willChangeValueForKey:@"readyForDisplay"];
    MEMORY[0x199715030](*(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 32) + 194) = v2;
    MEMORY[0x199715040](*(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 32));
    uint64_t result = [*(id *)(a1 + 32) didChangeValueForKey:@"readyForDisplay"];
    if (v10) {
      return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "superlayer"), "didChangeValueForKey:", @"readyForDisplay");
    }
  }
  return result;
}

- (void)hasEnqueuedVideoFrameChanged:(id)a3
{
  if (objc_msgSend((id)objc_msgSend(a3, "object"), "isEqual:", -[AVPlayer currentItem](-[AVPlayerLayer player](self, "player"), "currentItem")))
  {
    [(AVPlayerLayer *)self _updateReadyForDisplayForPlayerCurrentItem];
  }
}

- (NSDictionary)pixelBufferAttributes
{
  int v2 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  BOOL v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  uint64_t v12 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    serialQueue = playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__AVPlayerLayer_pixelBufferAttributes__block_invoke;
    v6[3] = &unk_1E57B2160;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(serialQueue, v6);
    int v2 = (NSDictionary *)v8[5];
  }
  _Block_object_dispose(&v7, 8);
  return v2;
}

- (AVPlayerLayer)init
{
  v21.receiver = self;
  v21.super_class = (Class)AVPlayerLayer;
  int v2 = [(AVPlayerLayer *)&v21 init];
  if (v2)
  {
    uint64_t v3 = objc_alloc_init(AVPlayerLayerInternal);
    v2->_playerLayer = v3;
    if (v3)
    {
      CFRetain(v3);
      int v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_playerLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerLayerQueue", v4);
      BOOL v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v2->_playerLayer->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.playerlayer.configuration", v5);
      v2->_playerLayer->maskLayer = (FigBaseCALayer *)objc_alloc_init(AVPlayerLayerIntermediateLayer);
      [(FigBaseCALayer *)v2->_playerLayer->maskLayer setEdgeAntialiasingMask:0];
      [(FigBaseCALayer *)v2->_playerLayer->maskLayer setMasksToBounds:1];
      [(AVPlayerLayer *)v2 addSublayer:v2->_playerLayer->maskLayer];
      v2->_playerLayer->videoLayer = (FigVideoContainerLayer *)objc_alloc_init(MEMORY[0x1E4F31B18]);
      [(FigBaseCALayer *)v2->_playerLayer->maskLayer addSublayer:v2->_playerLayer->videoLayer];
      [(FigVideoContainerLayer *)v2->_playerLayer->videoLayer setEdgeAntialiasingMask:0];
      [(AVPlayerLayer *)v2 setVideoGravity:@"AVLayerVideoGravityResizeAspect"];
      v2->_playerLayer->subtitleLayer = (FigSubtitleCALayer *)objc_alloc_init(MEMORY[0x1E4F31B10]);
      [(FigBaseCALayer *)v2->_playerLayer->maskLayer addSublayer:v2->_playerLayer->subtitleLayer];
      [(FigSubtitleCALayer *)v2->_playerLayer->subtitleLayer setEdgeAntialiasingMask:0];
      v2->_playerLayer->closedCaptionLayer = (FigBaseCALayer *)(id)[(id)objc_opt_class() makeClosedCaptionLayer];
      [(FigBaseCALayer *)v2->_playerLayer->closedCaptionLayer setHidden:1];
      [(FigBaseCALayer *)v2->_playerLayer->maskLayer addSublayer:v2->_playerLayer->closedCaptionLayer];
      [(FigBaseCALayer *)v2->_playerLayer->closedCaptionLayer setEdgeAntialiasingMask:0];
      v2->_playerLayer->hudLayer = objc_alloc_init(AVNetworkPlaybackPerfHUDLayer);
      hudLayer = v2->_playerLayer->hudLayer;
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __21__AVPlayerLayer_init__block_invoke;
      v20[3] = &unk_1E57B1E80;
      v20[4] = v2;
      [(AVNetworkPlaybackPerfHUDLayer *)hudLayer readHudSettingsAndCallCompletionHandler:v20];
      [(FigSubtitleCALayer *)v2->_playerLayer->subtitleLayer setSubtitleGravityNonObscuring:1];
      v2->_playerLayer->isReadyForDisplayMutedouble x = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
      v2->_playerLayer->isReadyForDispladouble y = 0;
      v2->_playerLayer->latestAppliedPresentationSize = (CGSize)*MEMORY[0x1E4F1DB30];
      v2->_playerLayer->lanczosDownscalingEnabledouble d = 0;
      v2->_playerLayer->lanczosDownscalingFactor = 2;
      p_top = (_OWORD *)&v2->_playerLayer->legibleContentInsets.top;
      long long v8 = *(_OWORD *)(MEMORY[0x1E4F28250] + 16);
      _OWORD *p_top = *MEMORY[0x1E4F28250];
      p_top[1] = v8;
      *(_WORD *)&v2->_playerLayer->isLegibleDisplayEnabledouble d = 1;
      [(FigVideoContainerLayer *)v2->_playerLayer->videoLayer setHidden:1];
      [(AVPlayerLayer *)v2 addObserver:v2 forKeyPath:@"contentsAreFlipped" options:4 context:@"AVPlayerLayerContentsAreFlippedObservationContext"];
      objc_initWeak(&location, v2);
      uint64_t v9 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __21__AVPlayerLayer_init__block_invoke_2;
      v17[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v18, &location);
      v2->_playerLayer->playerItemHasEnqueuedVideoFrameListener = (id)[v9 addObserverForName:@"AVPlayerItemHasEnqueuedVideoFrameDidChangeNotification" object:0 queue:0 usingBlock:v17];
      BOOL v10 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __21__AVPlayerLayer_init__block_invoke_3;
      v15[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v16, &location);
      v2->_playerLayer->windowSceneDidEnterBackgroundListener = (id)[v10 addObserverForName:@"UISceneDidEnterBackgroundNotification" object:0 queue:0 usingBlock:v15];
      uint64_t v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __21__AVPlayerLayer_init__block_invoke_4;
      v13[3] = &unk_1E57B1EA8;
      objc_copyWeak(&v14, &location);
      v2->_playerLayer->windowSceneWillEnterForegroundListener = (id)[v11 addObserverForName:@"UISceneWillEnterForegroundNotification" object:0 queue:0 usingBlock:v13];
      v2->_playerLayer->isPartOfForegroundScene = [(AVPlayerLayer *)v2 _currentWindowSceneIsForegroundDefault];
      v2->_playerLayer->dependencyManager = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:v2];
      [(AVKeyPathDependencyManager *)v2->_playerLayer->dependencyManager dependencyHostIsFullyInitialized];
      v2->_playerLayer->double screenScale = 1.0;
      v2->_playerLayer->honorContentScale = 0;
      if (sniffUIWindowOnce != -1) {
        dispatch_once(&sniffUIWindowOnce, &__block_literal_global);
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
    else
    {

      return 0;
    }
  }
  return v2;
}

- (void)setVideoGravity:(AVLayerVideoGravity)videoGravity
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    id v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x3052000000;
    uint64_t v11 = __Block_byref_object_copy_;
    uint64_t v12 = __Block_byref_object_dispose_;
    uint64_t v13 = 0;
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__AVPlayerLayer_setVideoGravity___block_invoke;
    v7[3] = &unk_1E57B2188;
    v7[4] = self;
    v7[5] = videoGravity;
    void v7[6] = &v14;
    v7[7] = &v8;
    dispatch_sync(serialQueue, v7);
    if (*((unsigned char *)v15 + 24))
    {
      if (([MEMORY[0x1E4F39CF8] disableActions] & 1) == 0) {
        objc_msgSend(v9[5], "addAnimation:forKey:", objc_msgSend(MEMORY[0x1E4F39B48], "animation"), @"sublayerTransform");
      }
      [(AVPlayerLayer *)self setNeedsLayout];
    }

    _Block_object_dispose(&v8, 8);
  }
  objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "setVideoGravity:", videoGravity);
  id v8 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v8];
  if (v8) {
    [v8 setVideoGravity:videoGravity];
  }
  _Block_object_dispose(&v14, 8);
}

- (id)_associatedRemoteModeLayer
{
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3052000000;
  uint64_t v16 = __Block_byref_object_copy_;
  playerLayer = self->_playerLayer;
  char v17 = __Block_byref_object_dispose_;
  uint64_t v18 = 0;
  serialQueue = playerLayer->serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__AVPlayerLayer__associatedRemoteModeLayer__block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v13;
  dispatch_sync(serialQueue, block);
  if (!v14[5])
  {
    if ([(AVPlayerLayer *)self superlayer])
    {
      uint64_t v7 = objc_opt_class();
      [(AVPlayerLayer *)self superlayer];
      if (v7 == objc_opt_class())
      {
        id v8 = (void *)[(AVPlayerLayer *)self superlayer];
        uint64_t v11 = 0;
        [v8 _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v11];
        if (v11 == self)
        {
          uint64_t v9 = (void *)[v8 _associatedRemoteModeLayer];
          if (v9)
          {
            id v10 = (id)[v9 _interstitialLayer];
            v14[5] = (uint64_t)v10;
          }
        }
      }
    }
  }
  id v5 = (id)v14[5];
  _Block_object_dispose(&v13, 8);
  return v5;
}

- (BOOL)_currentWindowSceneIsForegroundDefault
{
  int lastWindowSceneEvent = self->_playerLayer->lastWindowSceneEvent;
  if (lastWindowSceneEvent) {
    return lastWindowSceneEvent == 2;
  }
  else {
    return [(AVPlayerLayer *)self context] != 0;
  }
}

- (void)addSublayer:(id)a3
{
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v5 addSublayer:a3];
  }
}

- (BOOL)_preventsChangesToSublayerHierarchy
{
  return self->_playerLayer->preventsChangesToSublayerHierarchy;
}

+ (id)makeClosedCaptionLayer
{
  int v2 = objc_alloc_init(AVPlayerLayerIntermediateLayer);
  return v2;
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  int v4 = AVTwoPartKeyPathMake(@"player", @"cachedPresentationSizeOfCurrentItem");
  [a3 valueForKey:@"playerCurrentItemPresentationSize" dependsOnValueAtKeyPath:v4];
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
}

id __33__AVPlayerLayer_setVideoGravity___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 88);
  if ((v3 != 0) == (v2 == 0)) {
    goto LABEL_4;
  }
  if ((objc_msgSend(v3, "isEqualToString:") & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 88);
LABEL_4:

    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 88) = [*(id *)(a1 + 40) copyWithZone:0];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 128);
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) = result;
  return result;
}

id __38__AVPlayerLayer_pixelBufferAttributes__block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 96);
  if (result)
  {
    id result = (id)[result copy];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

uint64_t __21__AVPlayerLayer_init__block_invoke_4(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _windowSceneWillEnterForeground:a2];
}

- (void)setPixelBufferAttributes:(NSDictionary *)pixelBufferAttributes
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer)
  {
    serialQueue = playerLayer->serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__AVPlayerLayer_setPixelBufferAttributes___block_invoke;
    block[3] = &unk_1E57B21B0;
    block[4] = self;
    block[5] = pixelBufferAttributes;
    void block[6] = &v7;
    dispatch_sync(serialQueue, block);
    if (*((unsigned char *)v8 + 24)) {
      [[(AVPlayerLayer *)self player] _pixelBufferAttributesDidChangeForLayer:self];
    }
  }
  _Block_object_dispose(&v7, 8);
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(AVPlayerLayer *)self bounds];
  v10.origin.double x = x;
  v10.origin.double y = y;
  v10.size.double width = width;
  v10.size.double height = height;
  if (!CGRectEqualToRect(v9, v10))
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer setBounds:](&v8, sel_setBounds_, x, y, width, height);
    [(AVPlayerLayer *)self setNeedsLayout];
    [(AVPlayerLayer *)self _notifyPlayerOfDisplaySize];
  }
}

- (void)_setPlayer:(id)a3 forPIP:(BOOL)a4
{
  playerLayer = self->_playerLayer;
  if (!playerLayer->isPresentationLayer && playerLayer->player != a3)
  {
    if (!a4 && [(AVPlayerLayer *)self _showInterstitialInstead]) {
      [(AVPlayerLayer *)self _setShowInterstitialInstead:0];
    }
    id v8 = [(AVPlayerLayer *)self _associatedRemoteModeLayer];
    if (v8)
    {
      if (![(AVPlayerLayer *)self _activeMode]) {
        [(AVPlayerLayer *)self _configurePlayerWhenLeavingPIP];
      }
      +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:self andPlayerLayer:v8];
    }
    CGRect v9 = self->_playerLayer;
    if (v9->player)
    {
      [(AVPlayerLayer *)self willChangeValueForKey:@"readyForDisplay"];
      MEMORY[0x199715030](self->_playerLayer->isReadyForDisplayMutex);
      self->_playerLayer->isReadyForDispladouble y = 0;
      MEMORY[0x199715040](self->_playerLayer->isReadyForDisplayMutex);
      [(AVPlayerLayer *)self didChangeValueForKey:@"readyForDisplay"];
      CGRect v9 = self->_playerLayer;
    }
    [(AVNetworkPlaybackPerfHUDLayer *)v9->hudLayer setPlayer:a3];
    if (!a4) {
      [(AVPlayer *)self->_playerLayer->player _removeLayer:self];
    }
    [(AVPlayer *)self->_playerLayer->player _updateConnectionToSecondScreen];
    serialQueue = self->_playerLayer->serialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke;
    block[3] = &unk_1E57B2098;
    block[4] = self;
    block[5] = a3;
    dispatch_sync(serialQueue, block);
    uint64_t v11 = [MEMORY[0x1E4F28EA0] notificationWithName:@"AVPlayerLayerPlayerDidChangeNotification" object:self];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "postNotification:", v11);
    if (![(AVPlayerLayer *)self _willManageSublayersAsSwappedLayers])
    {
      [(AVPlayerLayer *)self _applyCurrentItemPresentationSizeChangeAndForceUpdate:0];
      configurationQueue = self->_playerLayer->configurationQueue;
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_3;
      v13[3] = &unk_1E57B1E80;
      void v13[4] = self;
      dispatch_async(configurationQueue, v13);
    }
    if (!a4) {
      [(AVPlayer *)self->_playerLayer->player _addLayer:self];
    }
    [(AVPlayer *)self->_playerLayer->player _updateConnectionToSecondScreen];
    [(AVPlayerLayer *)self _notifyPlayerOfDisplaySize];
    if (v8)
    {
      +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:self andPlayerLayer:v8];
      [v8 _setPlayer:a3 forPIP:1];
      if (![(AVPlayerLayer *)self _activeMode]) {
        [(AVPlayerLayer *)self _configurePlayerWhenEnteringPIP];
      }
    }
  }
}

- (BOOL)_willManageSublayersAsSwappedLayers
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  char v10 = 0;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__AVPlayerLayer__willManageSublayersAsSwappedLayers__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (BOOL)_showInterstitialInstead
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer)
  {
    showInterstitialInsteadouble d = playerLayer->showInterstitialInstead;
    char v11 = showInterstitialInstead;
  }
  else
  {
    serialQueue = playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__AVPlayerLayer__showInterstitialInstead__block_invoke;
    v7[3] = &unk_1E57B2110;
    v7[4] = self;
    v7[5] = &v8;
    dispatch_sync(serialQueue, v7);
    showInterstitialInsteadouble d = *((unsigned __int8 *)v9 + 24);
  }
  BOOL v5 = showInterstitialInstead != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (BOOL)_isConnectedToSecondScreen
{
  return self->_playerLayer->isConnectedToSecondScreen;
}

- (BOOL)isPIPModeEnabled
{
  return self->_playerLayer->isPIPModeEnabled;
}

- (id)_closedCaptionLayer
{
  uint64_t v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:&v3 interstitialLayer:0];
  return v3;
}

- (void)_handlePlayerCurrentItemDidChangeForPlayer:(id)a3
{
  id v4 = [(AVPlayerLayer *)self _subtitleLayer];
  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __60__AVPlayerLayer__handlePlayerCurrentItemDidChangeForPlayer___block_invoke;
    v5[3] = &unk_1E57B1E80;
    v5[4] = v4;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v5);
  }
  [(AVPlayerLayer *)self _updateReadyForDisplayForPlayerCurrentItem];
  [(AVNetworkPlaybackPerfHUDLayer *)self->_playerLayer->hudLayer currentItemChanged];
}

void *__65__AVPlayerLayer__handleNonForcedSubtitleDisplayDidChange_player___block_invoke(uint64_t a1)
{
  id result = (void *)[*(id *)(a1 + 32) _subtitleLayer];
  if (*(void *)(a1 + 40) == *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 200) && result != 0)
  {
    uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
    return (void *)[result updateNonForcedSubtitleDisplayEnabled:v4];
  }
  return result;
}

- (id)_subtitleLayer
{
  uint64_t v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:&v3 closedCaptionLayer:0 interstitialLayer:0];
  return v3;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (a6 == @"AVPlayerLayerContentsAreFlippedObservationContext")
  {
    id v7 = [(AVPlayerLayer *)self _videoLayer];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64__AVPlayerLayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v9[3] = &unk_1E57B2098;
    _OWORD v9[4] = self;
    v9[5] = v7;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v9);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPlayerLayer;
    -[AVPlayerLayer observeValueForKeyPath:ofObject:change:context:](&v8, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (id)_videoLayer
{
  uint64_t v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:&v3 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:0];
  return v3;
}

uint64_t __42__AVPlayerLayer_setPixelBufferAttributes___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 96);
  if ((v3 != 0) != (v2 == 0))
  {
    uint64_t result = objc_msgSend(v3, "isEqual:");
    if (result) {
      return result;
    }
    uint64_t v3 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 96);
  }

  uint64_t result = [*(id *)(a1 + 40) copyWithZone:0];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 96) = result;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  return result;
}

- (BOOL)isReadyForDisplay
{
  playerLayer = self->_playerLayer;
  if (playerLayer->isPresentationLayer) {
    return 0;
  }
  if (playerLayer->showInterstitialInstead)
  {
    id v7 = 0;
    [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v7];
    return [v7 isReadyForDisplay];
  }
  else
  {
    MEMORY[0x199715030](playerLayer->isReadyForDisplayMutex, a2);
    BOOL v5 = self->_playerLayer;
    isReadyForDispladouble y = v5->isReadyForDisplay;
    MEMORY[0x199715040](v5->isReadyForDisplayMutex);
    return isReadyForDisplay;
  }
}

void __35__AVPlayerLayer__setPlayer_forPIP___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 80);

  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 80) = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 32);
  uint64_t v5 = *(void *)(v4 + 80);
  uint64_t v6 = *(NSObject **)(v4 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_2;
  block[3] = &unk_1E57B2138;
  block[4] = v3;
  block[5] = v2;
  void block[6] = v5;
  dispatch_async(v6, block);
}

uint64_t __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopObservingPlayer:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  return [v2 _startObservingPlayer:v3];
}

- (void)_stopObservingPlayer:(id)a3
{
  if (a3)
  {
    playerBeingObservedouble d = self->_playerLayer->playerBeingObserved;
    if (playerBeingObserved)
    {

      self->_playerLayer->playerBeingObservedouble d = 0;
      [(AVSinkSubscriber *)self->_playerLayer->playerCurrentItemSink cancel];

      self->_playerLayer->playerCurrentItemSink = 0;
      [(AVSinkSubscriber *)self->_playerLayer->currentItemPresentationSizeSink cancel];

      self->_playerLayer->currentItemPresentationSizeSink = 0;
      [(AVSinkSubscriber *)self->_playerLayer->currentItemTracksSink cancel];

      self->_playerLayer->currentItemTracksSink = 0;
      [(AVSinkSubscriber *)self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink cancel];

      self->_playerLayer->currentItemNonForcedSubtitlesEnabledSink = 0;
      [(AVSinkSubscriber *)self->_playerLayer->playerIsDisplayingClosedCaptionsSink cancel];

      self->_playerLayer->playerIsDisplayingClosedCaptionsSink = 0;
    }
  }
}

void __35__AVPlayerLayer__interstitialLayer__block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(a1[4] + 32);
  uint64_t v3 = *(void **)(v2 + 152);
  if (v3)
  {
    [v3 removeFromSuperlayer];

    uint64_t v2 = *(void *)(a1[4] + 32);
  }
  *(void *)(v2 + 152) = a1[5];
  uint64_t v4 = *(void *)(a1[4] + 32);
  if (*(unsigned char *)(v4 + 193))
  {
    *(unsigned char *)(v4 + 193) = 0;
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

uint64_t __45__AVPlayerLayer__setIsPartOfForegroundScene___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(*(void *)(result + 32) + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 192) != v2) {
    *(unsigned char *)(v1 + 192) = v2;
  }
  return result;
}

- (id)_interstitialLayer
{
  uint64_t v12 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v12];
  if (!v12)
  {
    uint64_t v3 = objc_alloc_init(AVPlayerLayer);
    [(AVPlayerLayer *)self bounds];
    -[AVPlayerLayer setFrame:](v3, "setFrame:");
    [(AVPlayerLayer *)v3 setHidden:1];
    serialQueue = self->_playerLayer->serialQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__AVPlayerLayer__interstitialLayer__block_invoke;
    v7[3] = &unk_1E57B21B0;
    v7[4] = self;
    v7[5] = v3;
    void v7[6] = &v8;
    dispatch_sync(serialQueue, v7);
    [(AVPlayerLayer *)self addSublayer:v3];
    if (*((unsigned char *)v9 + 24)) {
      [(AVPlayerLayer *)self _setShowInterstitialInstead:1];
    }
  }
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v12];
  uint64_t v5 = v12;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)removeFromSuperlayer
{
  v2.receiver = self;
  v2.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v2 removeFromSuperlayer];
}

uint64_t __21__AVPlayerLayer_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak hasEnqueuedVideoFrameChanged:a2];
}

uint64_t __21__AVPlayerLayer_init__block_invoke_3(uint64_t a1, uint64_t a2)
{
  id Weak = objc_loadWeak((id *)(a1 + 32));
  return [Weak _windowSceneDidEnterBackground:a2];
}

Class __21__AVPlayerLayer_init__block_invoke_5()
{
  Class result = NSClassFromString(&cfstr_Uiwindow.isa);
  uiWindowClass = (uint64_t)result;
  return result;
}

- (AVPlayerLayer)initWithLayer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_5;
  }
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerLayer;
  self = [(AVPlayerLayer *)&v9 initWithLayer:a3];
  if (self)
  {
    uint64_t v5 = objc_alloc_init(AVPlayerLayerInternal);
    self->_playerLayer = v5;
    if (v5)
    {
      CFRetain(v5);
      uint64_t v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_playerLayer->serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVPlayerLayerQueue", v6);
      id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      self->_playerLayer->configurationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.playerlayer.configuration", v7);
      self->_playerLayer->isPresentationLayer = 1;
      self->_playerLayer->videoGravitdouble y = (NSString *)(id)[a3 videoGravity];
      self->_playerLayer->player = (AVPlayer *)(id)[a3 player];
      self->_playerLayer->dependencyManager = [[AVKeyPathDependencyManager alloc] initWithDependencyHost:self];
      [(AVKeyPathDependencyManager *)self->_playerLayer->dependencyManager dependencyHostIsFullyInitialized];
      return self;
    }
LABEL_5:

    return 0;
  }
  return self;
}

- (void)setContentsScale:(double)a3
{
  self->_playerLayer->honorContentScale = 1;
  v4.receiver = self;
  v4.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v4 setContentsScale:a3];
  [(AVPlayerLayer *)self _notifyPlayerOfDisplaySize];
}

- (void)_addBoundsAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  id v8 = _animationByTransformingValues(a4, (uint64_t)&__block_literal_global_107);
  if ([a4 isAdditive]) {
    objc_super v9 = @"bounds.size";
  }
  else {
    objc_super v9 = @"bounds";
  }
  [v8 setKeyPath:v9];
  [v8 setDelegate:0];
  [a3 addAnimation:v8 forKey:a5];
}

uint64_t __66__AVPlayerLayer__addBoundsAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  return a2;
}

- (void)_addPositionAnimationToLayer:(id)a3 usingAnimation:(id)a4 forKey:(id)a5
{
  if ([a4 isAdditive]) {
    id v8 = &__block_literal_global_115;
  }
  else {
    id v8 = &__block_literal_global_118;
  }
  id v9 = _animationByTransformingValues(a4, (uint64_t)v8);
  [v9 setKeyPath:@"position"];
  [v9 setDelegate:0];
  [a3 addAnimation:v9 forKey:a5];
}

uint64_t __68__AVPlayerLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke(uint64_t a1, void *a2)
{
  [a2 sizeValue];
  objc_super v2 = (void *)MEMORY[0x1E4F29238];
  double v4 = v3 * 0.5;
  double v6 = v5 * 0.5;
  return objc_msgSend(v2, "valueWithPoint:", v4, v6);
}

uint64_t __68__AVPlayerLayer__addPositionAnimationToLayer_usingAnimation_forKey___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 rectValue];
  objc_super v2 = (void *)MEMORY[0x1E4F29238];
  double v5 = v3 + v4 * 0.5;
  double v8 = v6 + v7 * 0.5;
  return objc_msgSend(v2, "valueWithPoint:", v5, v8);
}

- (void)_addSublayerTransformAnimationToLayer:(id)a3 fromTransform:(CATransform3D *)a4 usingAnimation:(id)a5 gravity:(id)a6 presentationSize:(CGSize)a7 forKey:(id)a8
{
  double height = a7.height;
  double width = a7.width;
  if ([a5 isAdditive])
  {
    id v16 = (id)[a5 copy];
    id v17 = (id)[a5 copy];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v28 = 0u;
    memset(v27, 0, sizeof(v27));
    [(AVPlayerLayer *)self bounds];
    AVLayerTransformForPlacement(a6, 0, (uint64_t)v27, width, height, v18, v19);
    double v20 = *((double *)&v28 + 1);
    double m22 = a4->m22;
    objc_msgSend(v16, "setFromValue:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", a4->m11 - *(double *)v27));
    [v16 setToValue:&unk_1EE5E1728];
    [v16 setDelegate:0];
    [v16 setKeyPath:@"sublayerTransform.scale.x"];
    objc_msgSend(v17, "setFromValue:", objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithDouble:", m22 - v20));
    [v16 setToValue:&unk_1EE5E1728];
    [v16 setDelegate:0];
    [v17 setKeyPath:@"sublayerTransform.scale.y"];
    [a3 addAnimation:v16, objc_msgSend(NSString, "stringWithFormat:", @"%@_x", a8) forKey];
    id v22 = (id)[NSString stringWithFormat:@"%@_y", a8];
    id v23 = a3;
    id v24 = v17;
  }
  else
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __116__AVPlayerLayer__addSublayerTransformAnimationToLayer_fromTransform_usingAnimation_gravity_presentationSize_forKey___block_invoke;
    v26[3] = &unk_1E57B1F38;
    v26[4] = a6;
    *(double *)&v26[5] = width;
    *(double *)&v26[6] = height;
    id v25 = _animationByTransformingValues(a5, (uint64_t)v26);
    [v25 setKeyPath:@"sublayerTransform"];
    [v25 setDelegate:0];
    id v23 = a3;
    id v24 = v25;
    id v22 = a8;
  }
  [v23 addAnimation:v24 forKey:v22];
}

uint64_t __116__AVPlayerLayer__addSublayerTransformAnimationToLayer_fromTransform_usingAnimation_gravity_presentationSize_forKey___block_invoke(uint64_t a1, void *a2)
{
  [a2 rectValue];
  double v3 = (void *)MEMORY[0x1E4F29238];
  AVLayerTransformForPlacement(*(void **)(a1 + 32), 0, (uint64_t)v7, *(double *)(a1 + 40), *(double *)(a1 + 48), v4, v5);
  return [v3 valueWithCATransform3D:v7];
}

- (void)_addAnimationsForPIPPlaceholderLayer:(id)a3 forKey:(id)a4
{
  placeholderContentLayerDuringPIPMode = self->_playerLayer->placeholderContentLayerDuringPIPMode;
  if (placeholderContentLayerDuringPIPMode)
  {
    -[AVPlayerLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", placeholderContentLayerDuringPIPMode, a3, [NSString stringWithFormat:@"AVPlayerLayer_PIPPlaceholderLayer_Bounds_%@", a4]);
    double v8 = self->_playerLayer->placeholderContentLayerDuringPIPMode;
    uint64_t v9 = [NSString stringWithFormat:@"AVPlayerLayer_PIPPlaceholderLayer_Position_%@", a4];
    [(AVPlayerLayer *)self _addPositionAnimationToLayer:v8 usingAnimation:a3 forKey:v9];
  }
}

- (void)_addAnimationsForMaskLayer:(id)a3 forKey:(id)a4
{
  id v7 = [(AVPlayerLayer *)self _maskLayer];
  -[AVPlayerLayer _addBoundsAnimationToLayer:usingAnimation:forKey:](self, "_addBoundsAnimationToLayer:usingAnimation:forKey:", v7, a3, [NSString stringWithFormat:@"AVPlayerLayer_MaskLayer_Bounds_%@", a4]);
  uint64_t v8 = [NSString stringWithFormat:@"AVPlayerLayer_MaskLayer_Position_%@", a4];
  [(AVPlayerLayer *)self _addPositionAnimationToLayer:v7 usingAnimation:a3 forKey:v8];
}

- (void)_addAnimationsForClosedCaptionLayer:(id)a3 gravity:(id)a4 forKey:(id)a5
{
  id v9 = [(AVPlayerLayer *)self _closedCaptionLayer];
  -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", v9, a3, [NSString stringWithFormat:@"AVPlayerLayer_ClosedCaptionLayer_Position_%@", a5]);
  if (v9) {
    [v9 sublayerTransform];
  }
  else {
    memset(v12, 0, sizeof(v12));
  }
  [v9 bounds];
  -[AVPlayerLayer _addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:](self, "_addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:", v9, v12, a3, a4, [NSString stringWithFormat:@"AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@", a5], v10, v11);
}

- (void)_addAnimationsForVideoLayer:(id)a3 size:(CGSize)a4 gravity:(id)a5 forKey:(id)a6
{
  double height = a4.height;
  double width = a4.width;
  id v12 = [(AVPlayerLayer *)self _videoLayer];
  -[AVPlayerLayer _addPositionAnimationToLayer:usingAnimation:forKey:](self, "_addPositionAnimationToLayer:usingAnimation:forKey:", v12, a3, [NSString stringWithFormat:@"AVPlayerLayer_VideoLayer_Position_%@", a6]);
  if (v12) {
    [v12 sublayerTransform];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  -[AVPlayerLayer _addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:](self, "_addSublayerTransformAnimationToLayer:fromTransform:usingAnimation:gravity:presentationSize:forKey:", v12, v13, a3, a5, [NSString stringWithFormat:@"AVPlayerLayer_VideoLayer_SublayerTransform_%@", a6], width, height);
}

- (void)_forBoundsAnimations:(id)a3 applyBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ((objc_msgSend(@"bounds.size", "isEqualToString:", objc_msgSend(a3, "keyPath")) & 1) != 0
      || objc_msgSend(@"bounds", "isEqualToString:", objc_msgSend(a3, "keyPath")))
    {
      id v7 = (void (*)(id, id))*((void *)a4 + 2);
      v7(a4, a3);
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      uint64_t v8 = objc_msgSend(a3, "animations", 0);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v14;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v14 != v11) {
              objc_enumerationMutation(v8);
            }
            [(AVPlayerLayer *)self _forBoundsAnimations:*(void *)(*((void *)&v13 + 1) + 8 * i) applyBlock:a4];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v10 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:&v12 subtitleLayer:&v11 closedCaptionLayer:0 interstitialLayer:&v10];
  if (self->_playerLayer) {
    BOOL v7 = v12 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __37__AVPlayerLayer_addAnimation_forKey___block_invoke;
    v9[3] = &unk_1E57B1F60;
    _OWORD v9[4] = self;
    v9[5] = a4;
    void v9[6] = v11;
    v9[7] = v10;
    [(AVPlayerLayer *)self _forBoundsAnimations:a3 applyBlock:v9];
  }
  v8.receiver = self;
  v8.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v8 addAnimation:a3 forKey:a4];
}

uint64_t __37__AVPlayerLayer_addAnimation_forKey___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) videoGravity];
  [*(id *)(a1 + 32) _playerCurrentItemPresentationSize];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) _addAnimationsForPIPPlaceholderLayer:a2 forKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _addAnimationsForMaskLayer:a2 forKey:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 32), "_addAnimationsForVideoLayer:size:gravity:forKey:", a2, v4, *(void *)(a1 + 40), v6, v8);
  [*(id *)(a1 + 32) _addAnimationsForClosedCaptionLayer:a2 gravity:v4 forKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) addAnimations:a2 forKey:*(void *)(a1 + 40)];
  uint64_t v9 = *(void **)(a1 + 56);
  uint64_t v10 = *(void *)(a1 + 40);
  return [v9 addAnimation:a2 forKey:v10];
}

- (void)removeAnimationForKey:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  uint64_t v9 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v13 videoLayer:&v12 subtitleLayer:&v11 closedCaptionLayer:&v10 interstitialLayer:&v9];
  if (self->_playerLayer) {
    BOOL v5 = v12 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (!v5)
  {
    uint64_t v6 = [(AVPlayerLayer *)self animationForKey:a3];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39__AVPlayerLayer_removeAnimationForKey___block_invoke;
    v8[3] = &unk_1E57B1F88;
    v8[4] = self;
    v8[5] = a3;
    v8[6] = v13;
    v8[7] = v12;
    v8[8] = v10;
    v8[9] = v11;
    v8[10] = v9;
    [(AVPlayerLayer *)self _forBoundsAnimations:v6 applyBlock:v8];
  }
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v7 removeAnimationForKey:a3];
}

uint64_t __39__AVPlayerLayer_removeAnimationForKey___block_invoke(uint64_t a1)
{
  objc_super v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 248);
  if (v2)
  {
    [v2 removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_PIPPlaceholderLayer_Bounds_%@", *(void *)(a1 + 40))];
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 248) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_PIPPlaceholderLayer_Position_%@", *(void *)(a1 + 40))];
  }
  [*(id *)(a1 + 48) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_MaskLayer_Bounds_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 48) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_MaskLayer_Position_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 56) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_VideoLayer_SublayerTransform_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 56) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_VideoLayer_SublayerTransform_%@_x", *(void *)(a1 + 40))];
  [*(id *)(a1 + 56) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_VideoLayer_SublayerTransform_%@_y", *(void *)(a1 + 40))];
  [*(id *)(a1 + 56) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_VideoLayer_Position_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 64) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 64) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@_x", *(void *)(a1 + 40))];
  [*(id *)(a1 + 64) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_ClosedCaptionLayer_SublayerTransform_%@_y", *(void *)(a1 + 40))];
  [*(id *)(a1 + 64) removeAnimationForKey:objc_msgSend(NSString, "stringWithFormat:", @"AVPlayerLayer_ClosedCaptionLayer_Position_%@", *(void *)(a1 + 40))];
  [*(id *)(a1 + 72) removeAnimationsForKey:*(void *)(a1 + 40)];
  double v3 = *(void **)(a1 + 80);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v3 removeAnimationForKey:v4];
}

- (void)removeAllAnimations
{
  id v9 = 0;
  id v10 = 0;
  id v7 = 0;
  id v8 = 0;
  id v6 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v10 videoLayer:&v9 subtitleLayer:&v8 closedCaptionLayer:&v7 interstitialLayer:&v6];
  playerLayer = self->_playerLayer;
  if (playerLayer) {
    BOOL v4 = v9 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4)
  {
    [(CALayer *)playerLayer->placeholderContentLayerDuringPIPMode removeAllAnimations];
    [v10 removeAllAnimations];
    [v9 removeAllAnimations];
    [v7 removeAllAnimations];
    [v8 removeAllAnimations];
    [v6 removeAllAnimations];
  }
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v5 removeAllAnimations];
}

- (void)dealloc
{
  playerLayer = self->_playerLayer;
  if (playerLayer)
  {

    BOOL v4 = self->_playerLayer;
    if (v4->playerBeingObserved)
    {
      -[AVPlayerLayer _stopObservingPlayer:](self, "_stopObservingPlayer:");
      BOOL v4 = self->_playerLayer;
    }
    if (v4->playerItemHasEnqueuedVideoFrameListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_playerLayer->playerItemHasEnqueuedVideoFrameListener);

      BOOL v4 = self->_playerLayer;
    }
    if (v4->windowSceneDidEnterBackgroundListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_playerLayer->windowSceneDidEnterBackgroundListener);

      BOOL v4 = self->_playerLayer;
    }
    if (v4->windowSceneWillEnterForegroundListener)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self->_playerLayer->windowSceneWillEnterForegroundListener);

      BOOL v4 = self->_playerLayer;
    }
    [(AVKeyPathDependencyManager *)v4->dependencyManager cancelAllCallbacks];

    objc_super v5 = self->_playerLayer;
    if (!v5->isPresentationLayer)
    {
      [(AVPlayer *)v5->player _removeLayer:0 videoLayer:v5->videoLayer closedCaptionLayer:v5->closedCaptionLayer subtitleLayer:v5->subtitleLayer interstitialLayer:v5->interstitialLayer];
      [(AVPlayer *)self->_playerLayer->player _updateConnectionToSecondScreen];
      objc_super v5 = self->_playerLayer;
    }

    id v6 = self->_playerLayer;
    if (!v6->isPresentationLayer)
    {
      [(AVPlayerLayer *)self removeObserver:self forKeyPath:@"contentsAreFlipped"];
      id v6 = self->_playerLayer;
    }
    serialQueue = v6->serialQueue;
    if (serialQueue)
    {
      dispatch_release(serialQueue);
      id v6 = self->_playerLayer;
    }
    if (v6->isReadyForDisplayMutex)
    {
      FigSimpleMutexDestroy();
      id v6 = self->_playerLayer;
    }
    configurationQueue = v6->configurationQueue;
    if (configurationQueue)
    {
      dispatch_release(configurationQueue);
      id v6 = self->_playerLayer;
    }

    CFRelease(self->_playerLayer);
  }
  v9.receiver = self;
  v9.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v9 dealloc];
}

- (float)_percentCoverageRelativeToRootLayer
{
  double v3 = (void *)[(AVPlayerLayer *)self context];
  float v4 = 0.0;
  if (v3)
  {
    objc_super v5 = v3;
    if ([v3 layer])
    {
      [(AVPlayerLayer *)self bounds];
      -[AVPlayerLayer convertRect:toLayer:](self, "convertRect:toLayer:", 0);
      double v7 = v6;
      double v9 = v8;
      objc_msgSend((id)objc_msgSend(v5, "layer"), "bounds");
      return v7 * v9 / (v10 * v11);
    }
  }
  return v4;
}

void *__67__AVPlayerLayer__handleIsDisplayingClosedCaptionsDidChange_player___block_invoke_2(uint64_t a1)
{
  Class result = *(void **)(a1 + 32);
  if (result) {
    return (void *)[result setHidden:*(unsigned __int8 *)(a1 + 40) == 0];
  }
  return result;
}

- (id)playerPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:self key:@"player" notificationName:@"AVPlayerLayerPlayerDidChangeNotification"];
}

uint64_t __35__AVPlayerLayer__setPlayer_forPIP___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) player];
  objc_super v2 = *(void **)(a1 + 32);
  return [v2 _applyCurrentItemPresentationSizeChangeAndForceUpdate:0];
}

- (id)_maskLayer
{
  double v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v3 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:0];
  return v3;
}

- (void)_setShowInterstitialInstead:(BOOL)a3
{
}

- (void)_setShowInterstitialInstead:(BOOL)a3 afterDelay:(double)a4
{
  if (!self->_playerLayer->isPresentationLayer)
  {
    BOOL v5 = a3;
    if ([(AVPlayerLayer *)self _showInterstitialInstead] != a3)
    {
      uint64_t v19 = 0;
      uint64_t v20 = 0;
      uint64_t v13 = 0;
      long long v14 = &v13;
      uint64_t v15 = 0x3052000000;
      long long v16 = __Block_byref_object_copy_;
      playerLayer = self->_playerLayer;
      id v17 = __Block_byref_object_dispose_;
      uint64_t v18 = 0;
      serialQueue = playerLayer->serialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke;
      block[3] = &unk_1E57B2110;
      block[4] = self;
      block[5] = &v13;
      dispatch_sync(serialQueue, block);
      [(id)v14[5] _setShowInterstitialInstead:v5 afterDelay:a4];

      [(AVPlayerLayer *)self _getMaskLayer:&v19 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v20];
      if (v20)
      {
        CFTimeInterval v9 = CACurrentMediaTime();
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_2;
        v10[3] = &unk_1E57B2200;
        BOOL v11 = v5;
        v10[4] = self;
        v10[5] = v19;
        v10[6] = v20;
        *(double *)&v10[7] = a4;
        *(double *)&v10[8] = v9 + a4;
        AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v10);
      }
      _Block_object_dispose(&v13, 8);
    }
  }
}

id __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke(uint64_t a1)
{
  id result = *(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 168);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

uint64_t __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) willChangeValueForKey:@"videoRect"];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(*(void *)(v2 + 32) + 16);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_3;
  v5[3] = &unk_1E57B20E8;
  v5[4] = v2;
  char v6 = *(unsigned char *)(a1 + 72);
  dispatch_sync(v3, v5);
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 40) setHidden:*(unsigned __int8 *)(a1 + 72)];
  [*(id *)(a1 + 48) setHidden:*(unsigned char *)(a1 + 72) == 0];
  [*(id *)(a1 + 32) setNeedsLayout];
  [MEMORY[0x1E4F39CF8] setCommitTime:*(double *)(a1 + 64)];
  [MEMORY[0x1E4F39CF8] commit];
  return [*(id *)(a1 + 32) didChangeValueForKey:@"videoRect"];
}

uint64_t __56__AVPlayerLayer__setShowInterstitialInstead_afterDelay___block_invoke_3(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32) + 193) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isOverscanSubtitleSupportEnabled
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  char v10 = 0;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AVPlayerLayer_isOverscanSubtitleSupportEnabled__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  char v4 = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __49__AVPlayerLayer_isOverscanSubtitleSupportEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 136) isOverscanSubtitleSupportEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setOverscanSubtitleSupportEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(AVPlayerLayer *)self _subtitleLayer];
  [v4 setOverscanSubtitleSupportEnabled:v3];
}

- (id)videoPerformanceMetrics
{
  uint64_t v2 = [[AVVideoPerformanceMetrics alloc] initWithDictionary:[[(AVPlayerLayer *)self player] _performanceDictionary]];
  return v2;
}

- (void)_setIsConnectedToSecondScreen:(BOOL)a3
{
  BOOL v3 = a3;
  playerLayer = self->_playerLayer;
  if (playerLayer->isConnectedToSecondScreen != a3)
  {
    playerLayer->isConnectedToSecondScreen = a3;
    [(AVPlayer *)self->_playerLayer->player _updateConnectionToSecondScreen];
  }
  id v6 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v6];
  [v6 _setIsConnectedToSecondScreen:v3];
}

- (void)setLanczosFilterDownscalingEnabled:(BOOL)a3
{
  serialQueue = self->_playerLayer->serialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__AVPlayerLayer_setLanczosFilterDownscalingEnabled___block_invoke;
  v4[3] = &unk_1E57B20E8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __52__AVPlayerLayer_setLanczosFilterDownscalingEnabled___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32) + 104) = *(unsigned char *)(result + 40);
  return result;
}

- (int64_t)lanczosFilterDownscaleFactor
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  uint64_t v10 = 0;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __45__AVPlayerLayer_lanczosFilterDownscaleFactor__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __45__AVPlayerLayer_lanczosFilterDownscaleFactor__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 32)
                                                                              + 112);
  return result;
}

- (void)setLanczosFilterDownscaleFactor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) <= 6)
  {
    void v6[6] = v3;
    v6[7] = v4;
    serialQueue = self->_playerLayer->serialQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __49__AVPlayerLayer_setLanczosFilterDownscaleFactor___block_invoke;
    v6[3] = &unk_1E57B2228;
    v6[4] = self;
    v6[5] = a3;
    dispatch_sync(serialQueue, v6);
  }
}

uint64_t __49__AVPlayerLayer_setLanczosFilterDownscaleFactor___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 32) + 112) = *(void *)(result + 40);
  return result;
}

- (CGRect)_videoRectForBounds:(CGRect)a3
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (NSEdgeInsets)legibleContentInsets
{
  playerLayer = self->_playerLayer;
  double top = playerLayer->legibleContentInsets.top;
  double left = playerLayer->legibleContentInsets.left;
  double bottom = playerLayer->legibleContentInsets.bottom;
  double right = playerLayer->legibleContentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)isLegibleDisplayEnabled
{
  return self->_playerLayer->isLegibleDisplayEnabled;
}

- (void)setLegibleDisplayEnabled:(BOOL)a3
{
  playerLayer = self->_playerLayer;
  if (playerLayer->isLegibleDisplayEnabled != a3)
  {
    playerLayer->isLegibleDisplayEnabledouble d = a3;
    if (a3)
    {
      objc_msgSend(-[AVPlayerLayer _maskLayer](self, "_maskLayer"), "addSublayer:", -[AVPlayerLayer _subtitleLayer](self, "_subtitleLayer"));
      id v5 = [(AVPlayerLayer *)self _maskLayer];
      id v6 = [(AVPlayerLayer *)self _closedCaptionLayer];
      [v5 addSublayer:v6];
    }
    else
    {
      objc_msgSend(-[AVPlayerLayer _closedCaptionLayer](self, "_closedCaptionLayer"), "removeFromSuperlayer");
      id v7 = [(AVPlayerLayer *)self _subtitleLayer];
      [v7 removeFromSuperlayer];
    }
  }
}

- (BOOL)isForScrubbingOnly
{
  return self->_playerLayer->isForScrubbingOnly;
}

- (void)setForScrubbingOnly:(BOOL)a3
{
  playerLayer = self->_playerLayer;
  if (playerLayer->isForScrubbingOnly != a3)
  {
    playerLayer->isForScrubbingOnldouble y = a3;
    -[FigVideoContainerLayer setForScrubbingOnly:](self->_playerLayer->videoLayer, "setForScrubbingOnly:");
  }
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(-[AVPlayerLayer _videoLayer](self, "_videoLayer"), "setToneMapToStandardDynamicRange:", a3);
  v5.receiver = self;
  v5.super_class = (Class)AVPlayerLayer;
  [(AVPlayerLayer *)&v5 setToneMapToStandardDynamicRange:v3];
}

- (CVPixelBufferRef)copyDisplayedPixelBuffer
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__AVPlayerLayer_copyDisplayedPixelBuffer__block_invoke;
  block[3] = &unk_1E57B2110;
  block[5] = &v9;
  id v8 = 0;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  if (*((unsigned char *)v10 + 24))
  {
    [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v8];
    double v4 = (__CVBuffer *)[v8 copyDisplayedPixelBuffer];
  }
  else
  {
    double v4 = [[(AVPlayerLayer *)self player] _copyDisplayedPixelBuffer:[(AVPlayerLayer *)self _videoLayer]];
  }
  objc_super v5 = v4;
  _Block_object_dispose(&v9, 8);
  return v5;
}

uint64_t __41__AVPlayerLayer_copyDisplayedPixelBuffer__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32)
                                                                            + 193);
  return result;
}

- (void)_configurePlayerWhenEnteringPIP
{
  [[(AVPlayerLayer *)self player] setPlayerRole:@"PIP" synchronously:0];
  [[(AVPlayerLayer *)self player] setShouldReduceResourceUsage:1];
  id v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v3];
  [v3 _configurePlayerWhenEnteringPIP];
}

- (void)_configurePlayerWhenLeavingPIP
{
  [[(AVPlayerLayer *)self player] setPlayerRole:0 synchronously:0];
  [[(AVPlayerLayer *)self player] setShouldReduceResourceUsage:0];
  id v3 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v3];
  [v3 _configurePlayerWhenLeavingPIP];
}

+ (void)_swapSublayersBetweenPlayerLayer:(id)a3 andPlayerLayer:(id)a4
{
  if (a3 != a4)
  {
    uint64_t v7 = [a3 _sublayersForPIP];
    uint64_t v8 = [a4 _sublayersForPIP];
    [a3 _setSublayersForPIP:0];
    [a4 _setSublayersForPIP:0];
    [a3 _setSublayersForPIP:v8];
    [a4 _setSublayersForPIP:v7];
  }
}

- (void)_stashClientLayers
{
  id v3 = [(AVPlayerLayer *)self _maskLayer];
  uint64_t v4 = (NSDictionary *)AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(v3, (void *)[MEMORY[0x1E4F28D58] indexPathWithIndex:0]);
  clientLayers = self->_playerLayer->clientLayers;
  if (clientLayers != v4)
  {

    self->_playerLayer->clientLayers = v4;
    uint64_t v4 = self->_playerLayer->clientLayers;
  }
  [(NSDictionary *)v4 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_238];
}

uint64_t __35__AVPlayerLayer__stashClientLayers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSLog(&cfstr_LayerIsNotAPer.isa, a3);
  return [a3 removeFromSuperlayer];
}

- (void)_unstashClientLayers
{
  self->_playerLayer->clientLayers = 0;
}

- (void)_associateWithLayer:(id)a3 forMode:(int64_t)a4
{
  id v10 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v10];
  serialQueue = self->_playerLayer->serialQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __45__AVPlayerLayer__associateWithLayer_forMode___block_invoke;
  v9[3] = &unk_1E57B2270;
  _OWORD v9[4] = self;
  v9[5] = a3;
  void v9[6] = a4;
  dispatch_sync(serialQueue, v9);
  if (a4)
  {
    +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:self andPlayerLayer:a3];
  }
  else
  {
    [[(AVPlayerLayer *)self player] _ensureVideoLayersAreAttached];
    objc_msgSend((id)objc_msgSend(v10, "player"), "_ensureVideoLayersAreAttached");
    [(AVPlayerLayer *)self _setSublayersPreventChangesToSublayerHierarchy:1];
    [(AVPlayerLayer *)self _stashClientLayers];
    [v10 _stashClientLayers];
    +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:self andPlayerLayer:a3];
    [a3 _setPreventsChangesToSublayerHierarchy:1];
  }
  [a3 _setWillManageSublayersAsSwappedLayers:1];
  objc_msgSend(a3, "_setPlayer:forPIP:", -[AVPlayerLayer player](self, "player"), 1);
  uint64_t v8 = (void *)[a3 _interstitialLayer];
  objc_msgSend(v8, "_setPlayer:forPIP:", objc_msgSend(v10, "player"), 1);
  objc_msgSend(a3, "_setShowInterstitialInstead:", -[AVPlayerLayer _showInterstitialInstead](self, "_showInterstitialInstead"));
}

id __45__AVPlayerLayer__associateWithLayer_forMode___block_invoke(uint64_t a1)
{
  id result = *(id *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 168) = result;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 184) = *(void *)(a1 + 48);
  return result;
}

- (int64_t)_activeMode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  playerLayer = self->_playerLayer;
  uint64_t v10 = -1;
  serialQueue = playerLayer->serialQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __28__AVPlayerLayer__activeMode__block_invoke;
  v6[3] = &unk_1E57B2110;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(serialQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __28__AVPlayerLayer__activeMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(result + 32)
                                                                                          + 32)
                                                                              + 184);
  return result;
}

- (void)_disassociateWithLayerForMode:(int64_t)a3
{
  id v14 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v14];
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = __Block_byref_object_copy_;
  playerLayer = self->_playerLayer;
  char v12 = __Block_byref_object_dispose_;
  uint64_t v13 = 0;
  serialQueue = playerLayer->serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47__AVPlayerLayer__disassociateWithLayerForMode___block_invoke;
  block[3] = &unk_1E57B2110;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(serialQueue, block);
  [(id)v9[5] _setPlayer:0 forPIP:1];
  objc_msgSend((id)objc_msgSend((id)v9[5], "_interstitialLayer"), "_setPlayer:forPIP:", 0, 1);
  [(id)v9[5] removeAllAnimations];
  if (!a3)
  {
    [(id)v9[5] _setPreventsChangesToSublayerHierarchy:0];
    [(id)v9[5] _setSublayersPreventChangesToSublayerHierarchy:0];
  }
  +[AVPlayerLayer _swapSublayersBetweenPlayerLayer:self andPlayerLayer:v9[5]];
  [(id)v9[5] _setWillManageSublayersAsSwappedLayers:0];
  if (!a3)
  {
    objc_msgSend((id)v9[5], "_mergeClientLayersIntoMaskLayer:", -[AVPlayerLayer _maskLayer](self, "_maskLayer"));
    [(AVPlayerLayer *)self _unstashClientLayers];
    [v14 _unstashClientLayers];
  }

  _Block_object_dispose(&v8, 8);
}

void __47__AVPlayerLayer__disassociateWithLayerForMode___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_retain(*(id *)(*(void *)(*(void *)(a1 + 32)
                                                                                              + 32)
                                                                                  + 168));

  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 168) = 0;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 184) = -1;
}

- (void)startRedirectingVideoToLayer:(id)a3 forMode:(int64_t)a4
{
  if (!a3)
  {
    char v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v14 = "targetLayer != nil";
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    char v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v14 = "[targetLayer isKindOfClass:[AVPlayerLayer class]]";
    goto LABEL_16;
  }
  if ([a3 player])
  {
    char v12 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v13 = *MEMORY[0x1E4F1C3C8];
    id v14 = "[targetLayer player] == nil";
LABEL_16:
    uint64_t v15 = (void *)[v12 exceptionWithName:v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", a4, v4, v5, v6, v7, (uint64_t)v14), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  if ([(AVPlayerLayer *)self _activeMode] != a4) {
    [(AVPlayerLayer *)self stopRedirectingVideoToLayer:[(AVPlayerLayer *)self _associatedRemoteModeLayer]];
  }
  if (a4)
  {
    [(AVPlayerLayer *)self _enterSecondScreenModeRedirectingVideoToLayer:a3];
  }
  else
  {
    [(AVPlayerLayer *)self _enterPIPModeRedirectingVideoToLayer:a3];
  }
}

- (void)stopRedirectingVideoToLayer:(id)a3
{
  if ([(AVPlayerLayer *)self _activeMode])
  {
    [(AVPlayerLayer *)self _leaveSecondScreenModeForLayer:a3];
  }
  else
  {
    [(AVPlayerLayer *)self _leavePIPModeForLayer:a3];
  }
}

- (void)_enterSecondScreenModeRedirectingVideoToLayer:(id)a3
{
  if (![(AVPlayerLayer *)self _isConnectedToSecondScreen])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__AVPlayerLayer__enterSecondScreenModeRedirectingVideoToLayer___block_invoke;
    v5[3] = &unk_1E57B2098;
    v5[4] = self;
    void v5[5] = a3;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __63__AVPlayerLayer__enterSecondScreenModeRedirectingVideoToLayer___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) _associateWithLayer:*(void *)(a1 + 40) forMode:1];
  objc_msgSend(*(id *)(a1 + 40), "setVideoGravity:", objc_msgSend(*(id *)(a1 + 32), "videoGravity"));
  [*(id *)(a1 + 32) _setIsConnectedToSecondScreen:1];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

- (void)_leaveSecondScreenModeForLayer:(id)a3
{
  if (objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "isEqual:", a3))
  {
    if ([(AVPlayerLayer *)self _isConnectedToSecondScreen])
    {
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __48__AVPlayerLayer__leaveSecondScreenModeForLayer___block_invoke;
      v4[3] = &unk_1E57B1E80;
      v4[4] = self;
      AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v4);
    }
  }
}

uint64_t __48__AVPlayerLayer__leaveSecondScreenModeForLayer___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(a1 + 32) _disassociateWithLayerForMode:1];
  [*(id *)(a1 + 32) _setIsConnectedToSecondScreen:0];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

- (void)enterPIPModeRedirectingVideoToLayer:(id)a3
{
  if (!a3)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "newPlayerLayerForPIP != nil";
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "[newPlayerLayerForPIP isKindOfClass:[AVPlayerLayer class]]";
    goto LABEL_10;
  }
  if ([a3 player])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v12 = *MEMORY[0x1E4F1C3C8];
    uint64_t v13 = "[newPlayerLayerForPIP player] == nil";
LABEL_10:
    id v14 = (void *)[v11 exceptionWithName:v12, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v3, v4, v5, v6, v7, (uint64_t)v13), 0 reason userInfo];
    objc_exception_throw(v14);
  }
  [(AVPlayerLayer *)self _enterPIPModeRedirectingVideoToLayer:a3];
}

- (void)_enterPIPModeRedirectingVideoToLayer:(id)a3
{
  id v5 = [(AVPlayerLayer *)self _associatedRemoteModeLayer];
  if (v5 != a3)
  {
    id v6 = v5;
    BOOL v7 = [(AVPlayerLayer *)self isPIPModeEnabled];
    if (!v7) {
      [(AVPlayerLayer *)self willChangeValueForKey:@"PIPModeEnabled"];
    }
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __54__AVPlayerLayer__enterPIPModeRedirectingVideoToLayer___block_invoke;
    v8[3] = &unk_1E57B2138;
    v8[4] = v6;
    v8[5] = self;
    v8[6] = a3;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v8);
    [(AVPlayerLayer *)self setPIPModeEnabled:1];
    if (!v7) {
      [(AVPlayerLayer *)self didChangeValueForKey:@"PIPModeEnabled"];
    }
  }
}

uint64_t __54__AVPlayerLayer__enterPIPModeRedirectingVideoToLayer___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  if (*(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) _disassociateWithLayerForMode:0];
  }
  [*(id *)(a1 + 40) _associateWithLayer:*(void *)(a1 + 48) forMode:0];
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(v2[4] + 248);
  if (v3)
  {
    objc_msgSend(v2, "insertSublayer:above:", v3, objc_msgSend(*(id *)(a1 + 40), "_maskLayer"));
    uint64_t v4 = *(void **)(a1 + 40);
    id v5 = *(void **)(v4[4] + 248);
    [v4 bounds];
    objc_msgSend(v5, "setFrame:");
    uint64_t v2 = *(void **)(a1 + 40);
  }
  objc_msgSend(*(id *)(a1 + 48), "setVideoGravity:", objc_msgSend(v2, "videoGravity"));
  id v6 = (void *)MEMORY[0x1E4F39CF8];
  return [v6 commit];
}

- (void)leavePIPMode
{
  id v3 = [(AVPlayerLayer *)self _associatedRemoteModeLayer];
  [(AVPlayerLayer *)self _leavePIPModeForLayer:v3];
}

- (void)_leavePIPModeForLayer:(id)a3
{
  if (objc_msgSend(-[AVPlayerLayer _associatedRemoteModeLayer](self, "_associatedRemoteModeLayer"), "isEqual:", a3))
  {
    if ([(AVPlayerLayer *)self isPIPModeEnabled])
    {
      [(AVPlayerLayer *)self willChangeValueForKey:@"PIPModeEnabled"];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __39__AVPlayerLayer__leavePIPModeForLayer___block_invoke;
      v4[3] = &unk_1E57B1E80;
      v4[4] = self;
      AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E4F14428], v4);
      [(AVPlayerLayer *)self setPIPModeEnabled:0];
      [(AVPlayerLayer *)self didChangeValueForKey:@"PIPModeEnabled"];
    }
  }
}

uint64_t __39__AVPlayerLayer__leavePIPModeForLayer___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 32) + 248) removeFromSuperlayer];
  [*(id *)(a1 + 32) _disassociateWithLayerForMode:0];
  uint64_t v2 = (void *)MEMORY[0x1E4F39CF8];
  return [v2 commit];
}

- (void)setPIPModeEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  playerLayer = self->_playerLayer;
  if (playerLayer->isPIPModeEnabled != a3)
  {
    playerLayer->isPIPModeEnabledouble d = a3;
    if (self->_playerLayer->isPIPModeEnabled) {
      [(AVPlayerLayer *)self _configurePlayerWhenEnteringPIP];
    }
    else {
      [(AVPlayerLayer *)self _configurePlayerWhenLeavingPIP];
    }
  }
  id v6 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v6];
  [v6 setPIPModeEnabled:v3];
}

- (void)_forceLayout
{
}

- (id)_sublayersForPIP
{
  v11[5] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  id v5 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v9 videoLayer:&v8 subtitleLayer:&v7 closedCaptionLayer:&v6 interstitialLayer:&v5];
  uint64_t v2 = [v5 _sublayersForPIP];
  if (!v9) {
    return 0;
  }
  uint64_t v3 = MEMORY[0x1E4F1CC08];
  v10[0] = @"maskLayer";
  v10[1] = @"videoLayer";
  if (v2) {
    uint64_t v3 = v2;
  }
  v11[0] = v9;
  v11[1] = v8;
  v10[2] = @"subtitleLayer";
  v10[3] = @"closedCaptionLayer";
  v11[2] = v7;
  v11[3] = v6;
  v10[4] = @"interstitialLayers";
  v11[4] = v3;
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:5];
}

- (void)_mergeClientLayersIntoMaskLayer:(id)a3
{
  id v5 = [(AVPlayerLayer *)self _maskLayer];
  uint64_t v6 = AVPlayerLayerFilterClientLayersFromLayerWithIndexPath(v5, (void *)[MEMORY[0x1E4F28D58] indexPathWithIndex:0]);
  [(AVPlayerLayer *)self _restoreClientLayers:v6 intoMaskLayer:a3];
}

- (void)_restoreClientLayers:(id)a3 intoMaskLayer:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([a3 count])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id obj = (id)objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingComparator:", &__block_literal_global_475);
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
LABEL_4:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * v9);
        uint64_t v11 = [a3 objectForKey:v10];
        if ((unint64_t)[v10 length] < 2) {
          break;
        }
        id v12 = a4;
        if ((unint64_t)([v10 length] - 3) > 0xFFFFFFFFFFFFFFFDLL)
        {
LABEL_12:
          if (v12) {
            objc_msgSend(v12, "insertSublayer:atIndex:", v11, objc_msgSend(v10, "indexAtPosition:", objc_msgSend(v10, "length") - 1));
          }
        }
        else
        {
          uint64_t v13 = 1;
          id v12 = a4;
          while (1)
          {
            uint64_t v14 = [v10 indexAtPosition:v13];
            if (!objc_msgSend((id)objc_msgSend(v12, "sublayers"), "count")) {
              break;
            }
            id v12 = (id)objc_msgSend((id)objc_msgSend(v12, "sublayers"), "objectAtIndex:", v14);
            if ([v10 length] - 1 <= (unint64_t)++v13) {
              goto LABEL_12;
            }
          }
        }
        if (++v9 == v7)
        {
          uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v7) {
            goto LABEL_4;
          }
          return;
        }
      }
    }
  }
}

- (void)_setSublayersPreventChangesToSublayerHierarchy:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = 0;
  id v6 = 0;
  id v7 = 0;
  id v4 = 0;
  id v5 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:&v8 videoLayer:&v7 subtitleLayer:&v6 closedCaptionLayer:&v5 interstitialLayer:&v4];
  [v7 setPreventsChangesToSublayerHierarchy:v3];
  [v6 setPreventsChangesToSublayerHierarchy:v3];
  [v5 setPreventsChangesToSublayerHierarchy:v3];
  [v8 setPreventsChangesToSublayerHierarchy:v3];
  [v4 _setSublayersPreventChangesToSublayerHierarchy:v3];
}

- (void)_setSublayersForPIP:(id)a3
{
  id v3 = a3;
  if (a3)
  {
    uint64_t v5 = [a3 objectForKeyedSubscript:@"videoLayer"];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"subtitleLayer"];
    uint64_t v7 = [v3 objectForKeyedSubscript:@"closedCaptionLayer"];
    uint64_t v8 = [v3 objectForKeyedSubscript:@"maskLayer"];
    id v3 = (id)[v3 objectForKeyedSubscript:@"interstitialLayers"];
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v6 = 0;
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3052000000;
  uint64_t v15 = __Block_byref_object_copy_;
  long long v16 = __Block_byref_object_dispose_;
  uint64_t v17 = 0;
  if ([v3 count]) {
    [(AVPlayerLayer *)self _interstitialLayer];
  }
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__AVPlayerLayer__setSublayersForPIP___block_invoke;
  block[3] = &unk_1E57B2298;
  block[4] = self;
  block[5] = v5;
  void block[6] = v6;
  void block[7] = v7;
  block[9] = v3;
  block[10] = &v12;
  block[8] = v8;
  dispatch_sync(serialQueue, block);
  uint64_t v10 = (void *)v13[5];
  if (v10 != (void *)v8)
  {
    [v10 removeFromSuperlayer];
    if (v8)
    {
      [(AVPlayerLayer *)self addSublayer:v8];
      [(AVPlayerLayer *)self _forceLayout];
    }
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __37__AVPlayerLayer__setSublayersForPIP___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  id v3 = *(void **)(v2 + 128);
  if (v3 != *(void **)(a1 + 40))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 128) = *(id *)(a1 + 40);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  id v4 = *(void **)(v2 + 136);
  if (v4 != *(void **)(a1 + 48))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 136) = *(id *)(a1 + 48);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  uint64_t v5 = *(void **)(v2 + 144);
  if (v5 != *(void **)(a1 + 56))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 144) = *(id *)(a1 + 56);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  }
  *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) = *(id *)(v2 + 120);
  if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40) != *(void *)(a1 + 64))
  {

    *(void *)(*(void *)(*(void *)(a1 + 32) + 32) + 120) = *(id *)(a1 + 64);
  }
  uint64_t v6 = *(void **)(*(void *)(*(void *)(a1 + 32) + 32) + 152);
  uint64_t v7 = *(void *)(a1 + 72);
  return [v6 _setSublayersForPIP:v7];
}

- (void)_setWillManageSublayersAsSwappedLayers:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v8];
  [v8 _setWillManageSublayersAsSwappedLayers:v3];
  serialQueue = self->_playerLayer->serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__AVPlayerLayer__setWillManageSublayersAsSwappedLayers___block_invoke;
  block[3] = &unk_1E57B20E8;
  block[4] = self;
  BOOL v7 = v3;
  dispatch_sync(serialQueue, block);
}

uint64_t __56__AVPlayerLayer__setWillManageSublayersAsSwappedLayers___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 32) + 176) = *(unsigned char *)(result + 40);
  return result;
}

- (void)_setPreventsChangesToSublayerHierarchy:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = 0;
  [(AVPlayerLayer *)self _getMaskLayer:0 videoLayer:0 subtitleLayer:0 closedCaptionLayer:0 interstitialLayer:&v5];
  [v5 _setPreventsChangesToSublayerHierarchy:v3];
  self->_playerLayer->preventsChangesToSublayerHierarchdouble y = v3;
}

- (id)placeholderContentLayerDuringPIPMode
{
  return self->_playerLayer->placeholderContentLayerDuringPIPMode;
}

- (void)setPlaceholderContentLayerDuringPIPMode:(id)a3
{
  placeholderContentLayerDuringPIPMode = self->_playerLayer->placeholderContentLayerDuringPIPMode;
  if (placeholderContentLayerDuringPIPMode != a3)
  {
    [(CALayer *)placeholderContentLayerDuringPIPMode removeFromSuperlayer];

    self->_playerLayer->placeholderContentLayerDuringPIPMode = (CALayer *)a3;
    if (self->_playerLayer->placeholderContentLayerDuringPIPMode)
    {
      if ([(AVPlayerLayer *)self isPIPModeEnabled])
      {
        [(AVPlayerLayer *)self insertSublayer:self->_playerLayer->placeholderContentLayerDuringPIPMode above:[(AVPlayerLayer *)self _maskLayer]];
        uint64_t v6 = self->_playerLayer->placeholderContentLayerDuringPIPMode;
        [(AVPlayerLayer *)self bounds];
        -[CALayer setFrame:](v6, "setFrame:");
      }
    }
  }
}

- (void)setSublayers:(id)a3
{
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy])
  {
    v5.receiver = self;
    v5.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v5 setSublayers:a3];
  }
}

- (void)insertSublayer:(id)a3 atIndex:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy])
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v7 insertSublayer:a3 atIndex:v4];
  }
}

- (void)insertSublayer:(id)a3 below:(id)a4
{
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy])
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v7 insertSublayer:a3 below:a4];
  }
}

- (void)insertSublayer:(id)a3 above:(id)a4
{
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy])
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v7 insertSublayer:a3 above:a4];
  }
}

- (void)replaceSublayer:(id)a3 with:(id)a4
{
  if (![(AVPlayerLayer *)self _preventsChangesToSublayerHierarchy])
  {
    v7.receiver = self;
    v7.super_class = (Class)AVPlayerLayer;
    [(AVPlayerLayer *)&v7 replaceSublayer:a3 with:a4];
  }
}

- (void)_windowSceneDidEnterBackground
{
  self->_playerLayer->int lastWindowSceneEvent = 1;
  [(AVPlayerLayer *)self _updateIsPartOfForegroundScene];
}

- (void)_windowSceneDidEnterBackground:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene"), "isEqual:", objc_msgSend(a3, "object")))
  {
    [(AVPlayerLayer *)self _windowSceneDidEnterBackground];
  }
}

- (void)_windowSceneWillEnterForeground
{
  self->_playerLayer->int lastWindowSceneEvent = 2;
  [(AVPlayerLayer *)self _setIsPartOfForegroundScene:1];
}

- (void)_windowSceneWillEnterForeground:(id)a3
{
  if (objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)uiWindowClass, "_windowWithContextId:", objc_msgSend((id)-[AVPlayerLayer context](self, "context"), "contextId")), "windowScene"), "isEqual:", objc_msgSend(a3, "object")))
  {
    [(AVPlayerLayer *)self _windowSceneWillEnterForeground];
  }
}

- (void)_forceWindowSceneEvent:(BOOL)a3
{
  if (a3) {
    [(AVPlayerLayer *)self _windowSceneWillEnterForeground];
  }
  else {
    [(AVPlayerLayer *)self _windowSceneDidEnterBackground];
  }
}

- (id)_STSLabel
{
  id result = [(AVPlayerLayer *)self _videoLayer];
  if (result)
  {
    return (id)[result STSLabel];
  }
  return result;
}

@end