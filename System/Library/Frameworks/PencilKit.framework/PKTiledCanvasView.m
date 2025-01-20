@interface PKTiledCanvasView
+ (void)initialize;
+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(BOOL)a3 prewarmSharedResourceHandler:(BOOL)a4;
+ (void)setupDefaults;
- (BOOL)_hasStrokeTransformChanged;
- (BOOL)_isCombiningStrokes;
- (BOOL)_isDisplayLinkPaused;
- (BOOL)_isLiveAnimating;
- (BOOL)_isShapeRecognitionEnabled;
- (BOOL)captureLiveData;
- (BOOL)disableAXDrawingAnnouncements;
- (BOOL)drawBitmapEraserMask;
- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5;
- (BOOL)drawingGestureRecognizer:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4;
- (BOOL)enableCanvasOffsetSupport;
- (BOOL)eraserBegan:(id)a3;
- (BOOL)generateLiveDrawing;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasSnapshot;
- (BOOL)hasVisibleStrokes;
- (BOOL)isDrawing;
- (BOOL)isErasingObjects;
- (BOOL)isPDFCanvasForAnalytics;
- (BOOL)isPreviewing;
- (BOOL)isScratchOutPending;
- (BOOL)isUnderBlendedContent;
- (BOOL)liveStrokeMode;
- (BOOL)predictionDisabled;
- (BOOL)shapeDrawingController:(id)a3 scratchOutStrokesCoveredByStroke:(id)a4;
- (BOOL)shouldPause;
- (BOOL)singleComponent;
- (BOOL)useLuminanceColorFilter;
- (BOOL)usePrivateResourceHandler;
- (BOOL)wantsCanvasVisible;
- (CADisplayLink)displayLink;
- (CAMetalLayer)metalLayer;
- (CGAffineTransform)_replayCoordinateSystemTransform;
- (CGAffineTransform)_strokeTransformForAttachment:(SEL)a3;
- (CGAffineTransform)paperTransform;
- (CGAffineTransform)scaledStrokeTransform;
- (CGAffineTransform)strokeTransform;
- (CGPoint)_oldEraseLocation;
- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3;
- (CGPoint)canvasOffset;
- (CGRect)renderedStrokesBounds;
- (CGRect)viewScissor;
- (CGRect)visibleStrokesBounds;
- (CGSize)_fixedPixelSize;
- (CGSize)_metalViewDrawableSize;
- (CGSize)_rendererControllerPixelSize;
- (CGSize)liveStrokeMaxSize;
- (NSMutableArray)fadeOutStrokeAnimations;
- (NSMutableArray)particlesToDestinationAnimations;
- (NSMutableArray)strokeRenderCachesToPurge;
- (NSMutableArray)strokesToErase;
- (NSMutableArray)transformStrokesAnimations;
- (NSMutableSet)strokeIDsToErase;
- (NSMutableSet)strokeUUIDsAboutToBeRemoved;
- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation;
- (PKController)_drawingController;
- (PKDrawing)activeDrawing;
- (PKDrawing)currentDrawingBeingCopiedToCanvas;
- (PKDrawing)drawing;
- (PKDrawingGestureRecognizerProtocol)drawingGestureRecognizer;
- (PKDrawingPowerSavingController)powerSavingController;
- (PKInk)ink;
- (PKInk)sixChannelInk;
- (PKInterpolateColorAnimation)liveRenderingOverrideColorAnimation;
- (PKLinedPaper)linedPaper;
- (PKMetalConfig)metalConfig;
- (PKMetalFramebuffer)snapshotFramebuffer;
- (PKMetalRendererController)_rendererController;
- (PKMetalView)metalView;
- (PKRulerController)rulerController;
- (PKScratchOutController)scratchOutController;
- (PKSelectionController)selectionController;
- (PKShapeDrawingController)shapeDrawingController;
- (PKStrokeGenerator)strokeGenerator;
- (PKTiledCanvasView)initWithFrame:(CGRect)a3;
- (PKTiledCanvasView)initWithFrame:(CGRect)a3 usePrivateResourceHandler:(BOOL)a4 singleComponent:(BOOL)a5 sixChannelBlending:(BOOL)a6;
- (PKTiledCanvasViewDelegate)delegate;
- (UIColor)liveRenderingOverrideColor;
- (UIGestureRecognizer)allowSimultaneousGR;
- (UIImage)paperTexture;
- (double)_fixedDrawingScale;
- (double)_inputScale;
- (double)drawingStartTimestamp;
- (double)latestRenderTimestamp;
- (double)layerContentsScale;
- (double)liveAnimationStartTime;
- (double)metalLayerContentsScaleOverride;
- (id).cxx_construct;
- (id)_combineStrokesDrawingUUID;
- (id)_inkForNewStroke;
- (id)_strokeUUIDsForStrokes:(id)a3;
- (id)_touchView;
- (id)currentStroke;
- (id)currentStrokeWithStrokeDataCopy;
- (id)liveDrawing;
- (id)purgeResourcesBlock;
- (id)shapeDrawingControllerRendererController:(id)a3;
- (id)snapshotFramebufferWithSize:(CGSize)a3;
- (int64_t)maxNumPredictionPoints;
- (int64_t)shapeDrawingControllerMaximumSupportedContentVersion:(id)a3;
- (int64_t)sixChannelBlendingMode;
- (unint64_t)metalLayerPixelFormat;
- (unint64_t)resourceCacheSize;
- (void)_callOptionalDrawingEndedCompletion:(id)a3 withStroke:(id)a4 shapeStrokes:(id)a5;
- (void)_didFinishErasingStrokes:(BOOL)a3;
- (void)_didFinishHideCanvasTransaction;
- (void)_drawingBegan:(id)a3 inputPoint:(id *)a4 locationInView:(CGPoint)a5 forPreview:(BOOL)a6 disableDetachedRendering:(BOOL)a7 activeInputProperties:(unint64_t)a8 inputType:(int64_t)a9;
- (void)_drawingDisplay:(double)a3;
- (void)_drawingEnded:(id)a3 estimatesTimeout:(double)a4 completion:(id)a5;
- (void)_endAlternativeStrokeIfNecessaryAccepted:(BOOL)a3;
- (void)_finishCombiningStrokesIfNecessary;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handleEndOfStroke:(id)a3 shapeStrokes:(id)a4 groupedUndoCommands:(id)a5 invalidateTiles:(BOOL)a6;
- (void)_notifyEraserMoved:(id)a3 location:(CGPoint)a4;
- (void)_postAXAnnouncement:(id)a3;
- (void)_postBeganErasingAXAnnouncement;
- (void)_postBeganSketchingAXAnnouncement;
- (void)_postEndedErasingAXAnnouncement;
- (void)_postEndedSketchingAXAnnouncement;
- (void)_previewDrawingBegan:(id *)a3 tiledViewLocation:(CGPoint)a4 disableDetachedRendering:(BOOL)a5;
- (void)_previewDrawingEnded;
- (void)_previewDrawingMoved:(id *)a3 tiledViewLocation:(CGPoint)a4;
- (void)_purgeResources;
- (void)_reduceMemoryFootprint;
- (void)_replayDrawingBegan:(id *)a3;
- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6;
- (void)_replayDrawingCancelled;
- (void)_replayDrawingEnded;
- (void)_replayDrawingEndedEstimatesTimeout:(double)a3 withBackgroundQueueCompletion:(id)a4;
- (void)_replayDrawingEndedWithBackgroundQueueCompletion:(id)a3;
- (void)_replayDrawingMoved:(id *)a3;
- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4;
- (void)_replayEstimatedPropertiesUpdated:(id *)a3;
- (void)_setDrawing:(id)a3 tiles:(id)a4 image:(CGImage *)a5 tileTransform:(CGAffineTransform *)a6 completionBlock:(id)a7;
- (void)_setDrawing:(id)a3 tiles:(id)a4 tileTransform:(CGAffineTransform *)a5 snapshotTexture:(id)a6 snapshotTextureTransform:(CGAffineTransform *)a7 completionBlock:(id)a8;
- (void)_setFixedPointSize:(CGSize)a3 drawingScale:(double)a4;
- (void)_startDisplayLinkShouldPause:(BOOL)a3;
- (void)_stopDisplayLink;
- (void)_updateMetalLayerOpacity;
- (void)_updateMetalLayerOpacityForceNonOpaqueSixChannel:(BOOL)a3;
- (void)_updateSequenceVSync:(double)a3;
- (void)adjustedPixelSize:(CGSize *)a3 drawingSize:(CGSize *)a4;
- (void)animateStrokes:(id)a3 destinationFrame:(CGRect)a4 duration:(double)a5 particles:(BOOL)a6;
- (void)cancelCurrentStroke;
- (void)cancelPurgeResourcesBlock;
- (void)checkAnimationsDidEndAtTime:(double)a3;
- (void)clearHiddenStrokes;
- (void)dealloc;
- (void)delayCompletionBlockUntilPresentation:(id)a3;
- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5;
- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5 forPreview:(BOOL)a6;
- (void)didMoveToWindow;
- (void)drawingBegan:(id)a3;
- (void)drawingCancelled;
- (void)drawingCancelledForPreview:(BOOL)a3;
- (void)drawingChanged:(id)a3;
- (void)drawingEnded:(id)a3;
- (void)drawingEstimatedPropertiesUpdated:(id)a3;
- (void)drawingGestureRecognizer:(id)a3 touchesEndedWithDrawingTouch:(id)a4;
- (void)drawingMoved:(id)a3 withEvent:(id)a4;
- (void)enumerateRenderedStrokesBounds:(id)a3;
- (void)eraseStrokes:(id)a3;
- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4;
- (void)eraserCancelled;
- (void)eraserEnded:(id)a3;
- (void)eraserMoved:(id)a3;
- (void)fadeOutAndHideStrokes:(id)a3 duration:(double)a4;
- (void)handleDrawingShouldPause:(BOOL)a3;
- (void)layoutSubviews;
- (void)liveStrokeParticlesToDestinationFrame:(CGRect)a3;
- (void)removeStuckStrokesAndSimulateCrashIfNecessary;
- (void)resizeBackingBuffersForPixelSize:(CGSize)a3 drawingScale:(double)a4;
- (void)schedulePurgeResourcesBlock;
- (void)setAllowSimultaneousGR:(id)a3;
- (void)setAlternativeStrokesAnimation:(id)a3;
- (void)setCanvasBackgroundColor:(id)a3;
- (void)setCanvasOffset:(CGPoint)a3;
- (void)setCaptureLiveData:(BOOL)a3;
- (void)setCurrentDrawingBeingCopiedToCanvas:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableAXDrawingAnnouncements:(BOOL)a3;
- (void)setDisplayLink:(id)a3;
- (void)setDrawBitmapEraserMask:(BOOL)a3;
- (void)setDrawing:(id)a3;
- (void)setDrawingGestureRecognizer:(id)a3;
- (void)setDrawingStartTimestamp:(double)a3;
- (void)setEnableCanvasOffsetSupport:(BOOL)a3;
- (void)setFadeOutStrokeAnimations:(id)a3;
- (void)setGenerateLiveDrawing:(BOOL)a3;
- (void)setHasSnapshot:(BOOL)a3;
- (void)setHidden:(BOOL)a3;
- (void)setInk:(id)a3;
- (void)setIsDrawing:(BOOL)a3;
- (void)setIsDrawing:(BOOL)a3 forPreview:(BOOL)a4;
- (void)setIsErasingObjects:(BOOL)a3;
- (void)setIsPDFCanvasForAnalytics:(BOOL)a3;
- (void)setIsPreviewing:(BOOL)a3;
- (void)setIsScratchOutPending:(BOOL)a3;
- (void)setIsUnderBlendedContent:(BOOL)a3;
- (void)setLinedPaper:(id)a3;
- (void)setLiveAnimationStartTime:(double)a3;
- (void)setLiveRenderingOverrideColor:(id)a3;
- (void)setLiveRenderingOverrideColor:(id)a3 animated:(BOOL)a4;
- (void)setLiveRenderingOverrideColorAnimation:(id)a3;
- (void)setLiveStrokeMaxSize:(CGSize)a3;
- (void)setLiveStrokeMode:(BOOL)a3;
- (void)setMaxNumPredictionPoints:(int64_t)a3;
- (void)setMetalLayerContentsScaleOverride:(double)a3;
- (void)setMetalView:(id)a3;
- (void)setNeedsDrawingDisplay;
- (void)setOpaque:(BOOL)a3;
- (void)setPaperTexture:(id)a3;
- (void)setPaperTransform:(CGAffineTransform *)a3;
- (void)setParticlesToDestinationAnimations:(id)a3;
- (void)setPowerSavingController:(id)a3;
- (void)setPredictionDisabled:(BOOL)a3;
- (void)setPurgeResourcesBlock:(id)a3;
- (void)setResourceCacheSize:(unint64_t)a3;
- (void)setRulerController:(id)a3;
- (void)setScratchOutController:(id)a3;
- (void)setSelectionController:(id)a3;
- (void)setShapeDrawingController:(id)a3;
- (void)setShouldPause:(BOOL)a3;
- (void)setSingleComponent:(BOOL)a3;
- (void)setSixChannelBlendingMode:(int64_t)a3;
- (void)setSixChannelInk:(id)a3;
- (void)setSnapshotFramebuffer:(id)a3;
- (void)setStrokeIDsToErase:(id)a3;
- (void)setStrokeRenderCachesToPurge:(id)a3;
- (void)setStrokeUUIDsAboutToBeRemoved:(id)a3;
- (void)setStrokesToErase:(id)a3;
- (void)setTransformStrokesAnimations:(id)a3;
- (void)setUseLuminanceColorFilter:(BOOL)a3;
- (void)setUsePrivateResourceHandler:(BOOL)a3;
- (void)setViewScissor:(CGRect)a3;
- (void)set_fixedDrawingScale:(double)a3;
- (void)set_fixedPixelSize:(CGSize)a3;
- (void)set_oldEraseLocation:(CGPoint)a3;
- (void)setupDisplayLink;
- (void)setupDrawing;
- (void)setupGestures;
- (void)setupMetalViewForPixelFormat:(unint64_t)a3 withPixelSize:(CGSize)a4;
- (void)setupMetalViewIfNecessary;
- (void)setupViewWithPixelSize:(CGSize)a3 drawingSize:(CGSize)a4;
- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3;
- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4;
- (void)strokeGeneratorDidSnapToRuler:(id)a3;
- (void)testHideOldestStroke;
- (void)updateHasVisibleStrokes;
- (void)willBeginLiveInteractionWithTouch:(id)a3;
@end

@implementation PKTiledCanvasView

- (PKDrawingGestureRecognizerProtocol)drawingGestureRecognizer
{
  return self->_drawingGestureRecognizer;
}

- (PKInk)ink
{
  return self->_ink;
}

- (BOOL)isDrawing
{
  return self->_isDrawing;
}

- (void)_finishCombiningStrokesIfNecessary
{
  self->_isCombiningStrokes = 0;
  self->_combiningStrokesCount = 0;
  combineStrokesRenderGroupID = self->_combineStrokesRenderGroupID;
  self->_combineStrokesRenderGroupID = 0;

  combineStrokesDrawingID = self->_combineStrokesDrawingID;
  self->_combineStrokesDrawingID = 0;

  if (self->_combineTimeoutBlock)
  {
    v5 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v8 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Finish combining manually triggered", v8, 2u);
    }

    dispatch_block_cancel(self->_combineTimeoutBlock);
    id combineTimeoutBlock = self->_combineTimeoutBlock;
    self->_id combineTimeoutBlock = 0;

    v7 = [(PKTiledCanvasView *)self drawing];
    [(PKTiledCanvasView *)self didEndLiveInteractionWithStrokes:MEMORY[0x1E4F1CBF0] drawing:v7 cancelled:0];
  }
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PKTiledCanvasView *)self isHidden];
  if (v5 != v3) {
    [(PKTiledCanvasView *)self cancelPurgeResourcesBlock];
  }
  v7.receiver = self;
  v7.super_class = (Class)PKTiledCanvasView;
  [(PKTiledCanvasView *)&v7 setHidden:v3];
  if (!(v5 | !v3))
  {
    [(PKTiledCanvasView *)self schedulePurgeResourcesBlock];
    v6 = [(PKTiledCanvasView *)self strokeGenerator];
    [v6 resetFilters];
  }
}

- (void)setCurrentDrawingBeingCopiedToCanvas:(id)a3
{
}

- (void)resizeBackingBuffersForPixelSize:(CGSize)a3 drawingScale:(double)a4
{
  CGSize v15 = a3;
  if (self->_metalView)
  {
    if (a4 <= 0.0)
    {
      CGSize v14 = v15;
    }
    else
    {
      double v5 = 1.0 / a4;
      v14.width = a3.width * v5;
      v14.height = a3.height * v5;
    }
    [(PKTiledCanvasView *)self adjustedPixelSize:&v15 drawingSize:&v14];
    uint64_t v6 = [(PKTiledCanvasView *)self _drawingController];
    objc_super v7 = (void *)v6;
    if (v6) {
      v8 = *(void **)(v6 + 64);
    }
    else {
      v8 = 0;
    }
    id v9 = v8;
    -[PKMetalRendererController setPixelSize:actualSize:]((uint64_t)v9, v15.width, v15.height, v14.width, v14.height);

    metalView = self->_metalView;
    [(PKTiledCanvasView *)self bounds];
    -[PKMetalView setFrame:](metalView, "setFrame:");
    v11 = self->_metalView;
    if (v11)
    {
      CGSize v12 = v15;
      if (v15.width == *MEMORY[0x1E4F1DB30] && v15.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
      {
        v11->_isFixedPixelSize = 0;
      }
      else
      {
        v11->_isFixedPixelSize = 1;
        v11->_fixedPixelSize = v12;
      }
    }
    -[PKMetalView resizeDrawableIfNecessary]((uint64_t)self->_metalView);
  }
}

void __34__PKTiledCanvasView_setupDefaults__block_invoke()
{
  v3[3] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v2[0] = @"internalSettings.drawing.apt.minimumMovementDistancePencil";
  v2[1] = @"internalSettings.drawing.apt.minimumMovementDistanceFinger";
  v3[0] = &unk_1F200F0C0;
  v3[1] = &unk_1F200E2B0;
  v2[2] = @"internalSettings.drawing.apt.minimumMovementDistanceTimeout";
  v3[2] = &unk_1F200F0D0;
  v1 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:3];
  [v0 registerDefaults:v1];
}

- (void)schedulePurgeResourcesBlock
{
  [(PKTiledCanvasView *)self cancelPurgeResourcesBlock];
  objc_initWeak(&location, self);
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  CGSize v12 = __48__PKTiledCanvasView_schedulePurgeResourcesBlock__block_invoke;
  v13 = &unk_1E64C5E70;
  objc_copyWeak(&v14, &location);
  dispatch_block_t v3 = dispatch_block_create((dispatch_block_flags_t)0, &v10);
  -[PKTiledCanvasView setPurgeResourcesBlock:](self, "setPurgeResourcesBlock:", v3, v10, v11, v12, v13);

  v4 = [MEMORY[0x1E4F28B50] mainBundle];
  double v5 = [v4 bundleIdentifier];
  int v6 = [v5 isEqualToString:@"com.apple.mobilenotes"];

  if (v6) {
    int64_t v7 = 10000000000;
  }
  else {
    int64_t v7 = 2000000000;
  }
  dispatch_time_t v8 = dispatch_time(0, v7);
  id v9 = [(PKTiledCanvasView *)self purgeResourcesBlock];
  dispatch_after(v8, MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

- (void)cancelPurgeResourcesBlock
{
  dispatch_block_t v3 = [(PKTiledCanvasView *)self purgeResourcesBlock];

  if (v3)
  {
    v4 = [(PKTiledCanvasView *)self purgeResourcesBlock];
    dispatch_block_cancel(v4);

    [(PKTiledCanvasView *)self setPurgeResourcesBlock:0];
  }
}

- (id)purgeResourcesBlock
{
  return self->_purgeResourcesBlock;
}

- (void)setPurgeResourcesBlock:(id)a3
{
}

- (void)_setFixedPointSize:(CGSize)a3 drawingScale:(double)a4
{
  double v6 = fmax(a3.width, 1.0);
  double v7 = fmax(a3.height, 1.0);
  +[PKMetalUtility layerContentsScale];
  +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v6 * v8, v7 * v8);
  double v10 = v9;
  double v12 = v11;
  double v13 = v9 / v6 * a4;
  [(PKTiledCanvasView *)self _fixedPixelSize];
  BOOL v16 = v15 == v10 && v14 == v12;
  if (!v16
    || ([(PKTiledCanvasView *)self _fixedDrawingScale], vabdd_f64(v17, v13) >= 0.00999999978))
  {
    -[PKTiledCanvasView set_fixedPixelSize:](self, "set_fixedPixelSize:", v10, v12);
    [(PKTiledCanvasView *)self set_fixedDrawingScale:v13];
    [(PKTiledCanvasView *)self _fixedPixelSize];
    double v19 = v18;
    double v21 = v20;
    [(PKTiledCanvasView *)self _fixedDrawingScale];
    -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v19, v21, v22);
  }
}

- (CGSize)_fixedPixelSize
{
  double width = self->__fixedPixelSize.width;
  double height = self->__fixedPixelSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)set_fixedPixelSize:(CGSize)a3
{
  self->__fixedPixelSize = a3;
}

- (void)set_fixedDrawingScale:(double)a3
{
  self->__fixedDrawingScale = a3;
}

- (double)layerContentsScale
{
  double result = self->_metalLayerContentsScaleOverride;
  if (result <= 0.0) {
    +[PKMetalUtility layerContentsScale];
  }
  return result;
}

- (double)_fixedDrawingScale
{
  return self->__fixedDrawingScale;
}

- (void)setOpaque:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKTiledCanvasView;
  [(PKTiledCanvasView *)&v4 setOpaque:a3];
  [(PKTiledCanvasView *)self _updateMetalLayerOpacity];
}

- (UIImage)paperTexture
{
  return self->_paperTexture;
}

- (void)_updateMetalLayerOpacity
{
  id v4 = [(PKTiledCanvasView *)self ink];
  if ([v4 _isEraserInk]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [(PKTiledCanvasView *)self hasSnapshot] ^ 1;
  }
  [(PKTiledCanvasView *)self _updateMetalLayerOpacityForceNonOpaqueSixChannel:v3];
}

- (BOOL)hasSnapshot
{
  return self->_hasSnapshot;
}

- (PKStrokeGenerator)strokeGenerator
{
  uint64_t v3 = [(PKTiledCanvasView *)self _rendererController];
  id v4 = (void *)v3;
  if (v3) {
    double v5 = *(void **)(v3 + 544);
  }
  else {
    double v5 = 0;
  }
  double v6 = v5;

  if (!v6)
  {
    fallbackStrokeGenerator = self->_fallbackStrokeGenerator;
    if (!fallbackStrokeGenerator)
    {
      double v8 = objc_alloc_init(PKStrokeGenerator);
      double v9 = self->_fallbackStrokeGenerator;
      self->_fallbackStrokeGenerator = v8;

      fallbackStrokeGenerator = self->_fallbackStrokeGenerator;
    }
    double v6 = fallbackStrokeGenerator;
  }
  double v10 = [(PKStrokeGenerator *)v6 delegate];

  if (!v10) {
    [(PKStrokeGenerator *)v6 setDelegate:self];
  }

  return v6;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)PKTiledCanvasView;
  [(PKTiledCanvasView *)&v24 layoutSubviews];
  if (self->_metalView)
  {
    [(PKTiledCanvasView *)self bounds];
    double v4 = v3;
    double v6 = v5;
    [(PKMetalView *)self->_metalView frame];
    if (v4 != v8 || v6 != v7)
    {
      [(PKTiledCanvasView *)self _fixedPixelSize];
      double v11 = v10;
      double v13 = v12;
      [(PKTiledCanvasView *)self _fixedDrawingScale];
      -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v11, v13, v14);
      double v15 = [(PKTiledCanvasView *)self powerSavingController];
      if (v15) {
        v15[72] = 0;
      }

      BOOL v16 = [(PKTiledCanvasView *)self _rendererController];
      -[PKMetalRendererController changeRenderSize]((uint64_t)v16);
    }
  }
  double v17 = [(PKTiledCanvasView *)self traitCollection];
  uint64_t v18 = [v17 userInterfaceStyle];
  double v19 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setInvertColors:]((uint64_t)v19, v18 == 2);

  int64_t v20 = [(PKTiledCanvasView *)self sixChannelBlendingMode];
  double v21 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setSixChannelBlendingMode:]((uint64_t)v21, v20);

  LODWORD(v20) = [(PKTiledCanvasView *)self drawBitmapEraserMask];
  double v22 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v22, v20);

  v23 = [(PKTiledCanvasView *)self rulerController];
  -[PKRulerController ensureRulerIsFullyOnscreen]((uint64_t)v23);
}

- (PKMetalRendererController)_rendererController
{
  v2 = [(PKTiledCanvasView *)self _drawingController];
  double v3 = v2;
  if (v2) {
    v2 = (void *)v2[8];
  }
  double v4 = v2;

  return v4;
}

- (PKController)_drawingController
{
  return self->_drawingController;
}

- (void)setSixChannelBlendingMode:(int64_t)a3
{
  if (self->_sixChannelBlendingMode != a3)
  {
    self->_sixChannelBlendingMode = a3;
    double v5 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setSixChannelBlendingMode:]((uint64_t)v5, a3);

    uint64_t v6 = [(PKTiledCanvasView *)self metalLayerPixelFormat];
    id v13 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setPixelFormat:]((uint64_t)v13, v6);

    id v14 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setSixChannelBlending:]((uint64_t)v14, a3 == 2);

    [(PKTiledCanvasView *)self _updateMetalLayerOpacity];
    int64_t v7 = [(PKTiledCanvasView *)self sixChannelBlendingMode];
    uint64_t v8 = [(PKTiledCanvasView *)self _rendererController];
    id v15 = (id)v8;
    if (v7 == 2)
    {
      double v9 = [(PKTiledCanvasView *)self metalView];
      double v10 = -[PKMetalView metalMultiplyLayer](v9);
      -[PKMetalRendererController setMultiplyPresentationLayer:]((uint64_t)v15, v10);
    }
    else
    {
      -[PKMetalRendererController setMultiplyPresentationLayer:](v8, 0);
    }

    id v16 = [(PKTiledCanvasView *)self _rendererController];
    double v11 = [(PKTiledCanvasView *)self metalView];
    double v12 = -[PKMetalView metalLayer](v11);
    -[PKMetalRendererController setPresentationLayer:]((uint64_t)v16, v12);
  }
}

- (void)setDrawBitmapEraserMask:(BOOL)a3
{
  if (self->_drawBitmapEraserMask != a3)
  {
    BOOL v3 = a3;
    self->_drawBitmapEraserMask = a3;
    id v4 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v4, v3);
  }
}

- (PKRulerController)rulerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rulerController);

  return (PKRulerController *)WeakRetained;
}

- (BOOL)drawBitmapEraserMask
{
  return self->_drawBitmapEraserMask;
}

- (void)_updateMetalLayerOpacityForceNonOpaqueSixChannel:(BOOL)a3
{
  BOOL v3 = a3;
  int64_t v5 = [(PKTiledCanvasView *)self sixChannelBlendingMode];
  unsigned int v6 = [(PKTiledCanvasView *)self isOpaque];
  BOOL v7 = v5 == 1 && v3;
  if (v5 == 1) {
    uint64_t v8 = !v3;
  }
  else {
    uint64_t v8 = v6;
  }
  v35 = [(PKTiledCanvasView *)self metalView];
  double v9 = -[PKMetalView metalLayer](v35);
  [v9 setOpaque:v8];

  if ((v8 & 1) == 0)
  {
    id v36 = [(PKTiledCanvasView *)self ink];
    double v10 = [v36 behavior];
    double v11 = [v10 renderingDescriptor];
    if ([v11 blendMode] != 1) {
      BOOL v7 = 0;
    }

    if (v7)
    {
      id v37 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2A0]];
      double v12 = [(PKTiledCanvasView *)self metalView];
      id v13 = -[PKMetalView metalLayer](v12);
      [v13 setCompositingFilter:v37];

      v38 = [(PKTiledCanvasView *)self metalView];
      id v14 = -[PKMetalView metalLayer](v38);
      [v14 setAllowsGroupOpacity:0];

      v39 = [(PKTiledCanvasView *)self metalView];
      id v15 = -[PKMetalView metalLayer](v39);
      [v15 setAllowsGroupBlending:0];

      id v40 = [(PKTiledCanvasView *)self metalView];
      id v16 = [v40 layer];
      [v16 setAllowsGroupOpacity:0];

      id v41 = [(PKTiledCanvasView *)self metalView];
      double v17 = [v41 layer];
      [v17 setAllowsGroupBlending:0];

LABEL_21:
      DeviceRGB = DKUCGColorCreateDeviceRGB(0.0, 0.0, 0.0, 0.0);
      uint64_t v32 = [(PKTiledCanvasView *)self _drawingController];
      id v51 = (id)v32;
      if (v32) {
        v33 = *(void **)(v32 + 64);
      }
      else {
        v33 = 0;
      }
      id v34 = v33;
      -[PKMetalRendererController setBackgroundColor:]((uint64_t)v34, DeviceRGB);

      CGColorRelease(DeviceRGB);
      return;
    }
  }
  int64_t v18 = [(PKTiledCanvasView *)self sixChannelBlendingMode];
  v42 = [(PKTiledCanvasView *)self metalView];
  double v19 = -[PKMetalView metalLayer](v42);
  int64_t v20 = v19;
  if (v18 == 2)
  {
    [v19 setAllowsGroupOpacity:0];

    v43 = [(PKTiledCanvasView *)self metalView];
    double v21 = -[PKMetalView metalLayer](v43);
    [v21 setAllowsGroupBlending:0];

    id v44 = [(PKTiledCanvasView *)self metalView];
    double v22 = [v44 layer];
    [v22 setAllowsGroupOpacity:0];

    id v45 = [(PKTiledCanvasView *)self metalView];
    v23 = [v45 layer];
    [v23 setAllowsGroupBlending:0];
  }
  else
  {
    [v19 setCompositingFilter:0];

    v46 = [(PKTiledCanvasView *)self metalView];
    objc_super v24 = -[PKMetalView metalLayer](v46);
    [v24 setAllowsGroupOpacity:1];

    v47 = [(PKTiledCanvasView *)self metalView];
    v25 = -[PKMetalView metalLayer](v47);
    [v25 setAllowsGroupBlending:1];

    id v48 = [(PKTiledCanvasView *)self metalView];
    v26 = [v48 layer];
    [v26 setAllowsGroupOpacity:1];

    id v45 = [(PKTiledCanvasView *)self metalView];
    v23 = [v45 layer];
    [v23 setAllowsGroupBlending:1];
  }

  if ((v8 & 1) == 0) {
    goto LABEL_21;
  }
  v49 = self->_canvasBackgroundColor;
  uint64_t v27 = [(PKTiledCanvasView *)self _drawingController];
  v28 = (void *)v27;
  if (v27) {
    v29 = *(void **)(v27 + 64);
  }
  else {
    v29 = 0;
  }
  id v30 = v29;
  v50 = v49;
  -[PKMetalRendererController setBackgroundColor:]((uint64_t)v30, [(UIColor *)v50 CGColor]);
}

- (PKMetalView)metalView
{
  return self->_metalView;
}

- (int64_t)sixChannelBlendingMode
{
  return self->_sixChannelBlendingMode;
}

- (void)didMoveToWindow
{
  BOOL v3 = [(PKTiledCanvasView *)self window];

  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v4 = [(PKTiledCanvasView *)self superview];
      if (v4)
      {
        os_log_t v5 = (os_log_t)v4;
        while (([v5 isUserInteractionEnabled] & 1) == 0)
        {
          uint64_t v6 = [v5 superview];

          os_log_t v5 = (os_log_t)v6;
          if (!v6) {
            goto LABEL_7;
          }
        }
        double v10 = (_UICanvasFeedbackGenerator *)[objc_alloc(MEMORY[0x1E4FB2020]) initWithView:v5];
        feedbackGenerator = self->_feedbackGenerator;
        self->_feedbackGenerator = v10;
      }
      else
      {
LABEL_7:
        os_log_t v5 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v12 = 0;
          _os_log_error_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_ERROR, "Could not find view with user interaction enabled for canvas feedback.", v12, 2u);
        }
      }
    }
  }
  else
  {
    BOOL v7 = self->_feedbackGenerator;
    if (v7)
    {
      uint64_t v8 = [(_UICanvasFeedbackGenerator *)v7 view];
      [v8 removeInteraction:self->_feedbackGenerator];

      double v9 = self->_feedbackGenerator;
      self->_feedbackGenerator = 0;
    }
  }
}

+ (void)prewarmFutureCanvasesIfNecessarySecureRendering:(BOOL)a3 prewarmSharedResourceHandler:(BOOL)a4
{
  if (!a3)
  {
    BOOL v5 = a4;
    uint64_t v6 = +[PKMetalUtility defaultDevice];
    if (v6) {
      BOOL v7 = !v5;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7) {
      id v8 = +[PKMetalResourceHandler sharedResourceHandlerWithDevice:]((uint64_t)PKMetalResourceHandler, v6);
    }
  }
  double v9 = _PencilKitBundle();
  id v10 = (id)[v9 localizedStringForKey:@"Began sketching" value:@"Began sketching" table:@"Localizable"];

  [a1 setupDefaults];
  double v11 = MEMORY[0x1E4F14428];

  dispatch_async(v11, &__block_literal_global_94_0);
}

+ (void)initialize
{
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___PKTiledCanvasView;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1) {
    +[PKTiledCanvasView setupDefaults];
  }
}

+ (void)setupDefaults
{
  if (+[PKTiledCanvasView setupDefaults]::onceToken != -1) {
    dispatch_once(&+[PKTiledCanvasView setupDefaults]::onceToken, &__block_literal_global_10);
  }
}

- (id).cxx_construct
{
  *((void *)self + 52) = 0;
  *((void *)self + 53) = 0;
  *((void *)self + 51) = 0;
  return self;
}

- (void)setSelectionController:(id)a3
{
}

- (void)setRulerController:(id)a3
{
}

- (void)setDrawing:(id)a3
{
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  BOOL v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_canvasViewFlags = &self->_canvasViewFlags;
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 2;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFD | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 4;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFFB | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 8;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFF7 | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 16;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFEF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 32;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFDF | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 64;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFFBF | v12;
    if (objc_opt_respondsToSelector()) {
      __int16 v13 = 128;
    }
    else {
      __int16 v13 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFF7F | v13;
    if (objc_opt_respondsToSelector()) {
      __int16 v14 = 256;
    }
    else {
      __int16 v14 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFEFF | v14;
    if (objc_opt_respondsToSelector()) {
      __int16 v15 = 512;
    }
    else {
      __int16 v15 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFDFF | v15;
    if (objc_opt_respondsToSelector()) {
      __int16 v16 = 1024;
    }
    else {
      __int16 v16 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xFBFF | v16;
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = 2048;
    }
    else {
      __int16 v17 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xF7FF | v17;
    if (objc_opt_respondsToSelector()) {
      __int16 v18 = 4096;
    }
    else {
      __int16 v18 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xEFFF | v18;
    if (objc_opt_respondsToSelector()) {
      __int16 v19 = 0x2000;
    }
    else {
      __int16 v19 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xDFFF | v19;
    if (objc_opt_respondsToSelector()) {
      __int16 v20 = 0x4000;
    }
    else {
      __int16 v20 = 0;
    }
    *(_WORD *)p_canvasViewFlags = *(_WORD *)p_canvasViewFlags & 0xBFFF | v20;
    if (objc_opt_respondsToSelector()) {
      __int16 v21 = 0x8000;
    }
    else {
      __int16 v21 = 0;
    }
    *(_WORD *)p_canvasViewFlags = v21 & 0x8000 | *(_WORD *)p_canvasViewFlags & 0x7FFF;
    p_canvasViewFlags->delegateSupportsTouchView = objc_opt_respondsToSelector() & 1;
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v22 = 2;
    }
    else {
      __int16 v22 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFD | v22;
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = 4;
    }
    else {
      __int16 v23 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFFB | v23;
    if (objc_opt_respondsToSelector()) {
      __int16 v24 = 8;
    }
    else {
      __int16 v24 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFF7 | v24;
    if (objc_opt_respondsToSelector()) {
      __int16 v25 = 16;
    }
    else {
      __int16 v25 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFEF | v25;
    if (objc_opt_respondsToSelector()) {
      __int16 v26 = 32;
    }
    else {
      __int16 v26 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFDF | v26;
    if (objc_opt_respondsToSelector()) {
      __int16 v27 = 64;
    }
    else {
      __int16 v27 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFFBF | v27;
    if (objc_opt_respondsToSelector()) {
      __int16 v28 = 128;
    }
    else {
      __int16 v28 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFF7F | v28;
    if (objc_opt_respondsToSelector()) {
      __int16 v29 = 256;
    }
    else {
      __int16 v29 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFEFF | v29;
    if (objc_opt_respondsToSelector()) {
      __int16 v30 = 512;
    }
    else {
      __int16 v30 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFDFF | v30;
    if (objc_opt_respondsToSelector()) {
      __int16 v31 = 1024;
    }
    else {
      __int16 v31 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xFBFF | v31;
    if (objc_opt_respondsToSelector()) {
      __int16 v32 = 2048;
    }
    else {
      __int16 v32 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xF7FF | v32;
    if (objc_opt_respondsToSelector()) {
      __int16 v33 = 4096;
    }
    else {
      __int16 v33 = 0;
    }
    *((_WORD *)p_canvasViewFlags + 8) = *((_WORD *)p_canvasViewFlags + 8) & 0xEFFF | v33;
    BOOL v5 = obj;
  }
}

- (void)setAllowSimultaneousGR:(id)a3
{
}

- (PKTiledCanvasView)initWithFrame:(CGRect)a3 usePrivateResourceHandler:(BOOL)a4 singleComponent:(BOOL)a5 sixChannelBlending:(BOOL)a6
{
  BOOL v6 = a6;
  v31.receiver = self;
  v31.super_class = (Class)PKTiledCanvasView;
  __int16 v9 = -[PKTiledCanvasView initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  __int16 v10 = v9;
  __int16 v11 = v9;
  if (v9)
  {
    v9->_usePrivateResourceHandler = a4;
    __int16 v12 = (PKMetalConfig *)-[PKMetalConfig initWithPrivateResourceHandler:]([PKMetalConfig alloc], a4);
    metalConfig = v11->_metalConfig;
    v11->_metalConfig = v12;

    v11->_singleComponent = a5;
    v11->_sixChannelBlendingMode = v6;
    [(PKTiledCanvasView *)v11 setupDrawing];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    particlesToDestinationAnimations = v11->_particlesToDestinationAnimations;
    v11->_particlesToDestinationAnimations = (NSMutableArray *)v14;

    uint64_t v16 = [MEMORY[0x1E4F1CA48] array];
    transformStrokesAnimations = v11->_transformStrokesAnimations;
    v11->_transformStrokesAnimations = (NSMutableArray *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
    strokeUUIDsAboutToBeRemoved = v11->_strokeUUIDsAboutToBeRemoved;
    v11->_strokeUUIDsAboutToBeRemoved = (NSMutableSet *)v18;

    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.c = v21;
    *(_OWORD *)&v10->__replayCoordinateSystemTransform.tx = v20;
    v11->_maxNumPredictionPoints = -1;
    __int16 v22 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    __int16 v23 = [v22 objectForKey:@"internalSettings.drawing.touchPredictionPointsOverride"];

    if (v23)
    {
      __int16 v24 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v11->_maxNumPredictionPoints = [v24 integerForKey:@"internalSettings.drawing.touchPredictionPointsOverride"];
    }
    __int16 v25 = (PKShapeDrawingController *)-[PKShapeDrawingController initWithDelegate:]([PKShapeDrawingController alloc], v11);
    shapeDrawingController = v11->_shapeDrawingController;
    v11->_shapeDrawingController = v25;

    __int16 v27 = v11->_shapeDrawingController;
    if (v27) {
      v27->_fastDetectionEnabled = 1;
    }
    __int16 v28 = objc_alloc_init(PKScratchOutController);
    scratchOutController = v11->_scratchOutController;
    v11->_scratchOutController = v28;
  }
  return v11;
}

- (void)setupGestures
{
  objc_super v3 = objc_alloc_init(PKDrawingGestureRecognizer);
  [(PKDrawingGestureRecognizer *)v3 setDelegate:self];
  [(PKDrawingGestureRecognizer *)v3 setDrawingTarget:self];
  [(PKTiledCanvasView *)self addGestureRecognizer:v3];
  [(PKTiledCanvasView *)self setDrawingGestureRecognizer:v3];
  [(PKTiledCanvasView *)self setMultipleTouchEnabled:1];
}

- (void)setupDrawing
{
  objc_super v3 = objc_opt_new();
  [(PKTiledCanvasView *)self setInk:v3];

  uint64_t v4 = objc_alloc_init(PKDrawing);
  drawing = self->_drawing;
  self->_drawing = v4;

  [(PKTiledCanvasView *)self setupGestures];
}

- (void)setInk:(id)a3
{
  id obj = a3;
  [(PKTiledCanvasView *)self _finishCombiningStrokesIfNecessary];
  uint64_t v4 = [obj identifier];
  int v5 = [v4 isEqualToString:@"com.apple.ink.marker"];

  if (v5)
  {
    uint64_t v6 = [obj _copyWithVariant:@"linear"];

    __int16 v7 = (void *)v6;
  }
  else
  {
    __int16 v7 = obj;
  }
  id obja = v7;
  objc_storeStrong((id *)&self->_ink, v7);
  __int16 v8 = [obja _sixChannelVersion];
  sixChannelInk = self->_sixChannelInk;
  self->_sixChannelInk = v8;
}

- (void)setDrawingGestureRecognizer:(id)a3
{
  int v5 = (PKDrawingGestureRecognizerProtocol *)a3;
  p_drawingGestureRecognizer = &self->_drawingGestureRecognizer;
  drawingGestureRecognizer = self->_drawingGestureRecognizer;
  if (drawingGestureRecognizer != v5)
  {
    __int16 v10 = v5;
    if (drawingGestureRecognizer)
    {
      __int16 v8 = [(PKDrawingGestureRecognizerProtocol *)drawingGestureRecognizer delegate];

      if (v8 == self) {
        [(PKDrawingGestureRecognizerProtocol *)*p_drawingGestureRecognizer setDelegate:0];
      }
      __int16 v9 = [(PKDrawingGestureRecognizerProtocol *)*p_drawingGestureRecognizer drawingTarget];

      if (v9 == self) {
        [(PKDrawingGestureRecognizerProtocol *)*p_drawingGestureRecognizer setDrawingTarget:0];
      }
      [(PKTiledCanvasView *)self removeGestureRecognizer:*p_drawingGestureRecognizer];
    }
    objc_storeStrong((id *)&self->_drawingGestureRecognizer, a3);
    int v5 = v10;
  }
}

uint64_t __98__PKTiledCanvasView_prewarmFutureCanvasesIfNecessarySecureRendering_prewarmSharedResourceHandler___block_invoke()
{
  id v0 = (id)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = (void *)MEMORY[0x1E4FB1A80];

  return [v1 prefersPencilOnlyDrawing];
}

- (PKTiledCanvasView)initWithFrame:(CGRect)a3
{
  return -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:](self, "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  [(PKTiledCanvasView *)self cancelPurgeResourcesBlock];
  uint64_t v3 = [(PKTiledCanvasView *)self _drawingController];
  uint64_t v4 = (void *)v3;
  if (v3) {
    -[PKMetalRendererController cancelLongRunningRenders](*(void *)(v3 + 64));
  }

  [(PKTiledCanvasView *)self _stopDisplayLink];
  [(CADisplayLink *)self->_displayLink invalidate];
  displayLink = self->_displayLink;
  self->_displayLink = 0;

  uint64_t v6 = [(PKTiledCanvasView *)self _drawingController];
  -[PKController teardown](v6);

  v7.receiver = self;
  v7.super_class = (Class)PKTiledCanvasView;
  [(PKTiledCanvasView *)&v7 dealloc];
}

- (id)snapshotFramebufferWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(PKTiledCanvasView *)self _rendererController];
  objc_super v7 = (void *)v6;
  if (v6 && *(unsigned char *)(v6 + 505))
  {
    uint64_t v8 = 554;
  }
  else
  {
    __int16 v9 = [(PKTiledCanvasView *)self _rendererController];
    if (v9) {
      uint64_t v8 = v9[65];
    }
    else {
      uint64_t v8 = 0;
    }
  }
  p_snapshotFramebuffer = &self->_snapshotFramebuffer;
  __int16 v11 = self->_snapshotFramebuffer;
  __int16 v12 = v11;
  if (!v11
    || (-[PKMetalFramebuffer size]((uint64_t)v11) == width ? (BOOL v14 = v13 == height) : (BOOL v14 = 0),
        !v14 || v12->_pixelFormat != v8))
  {
    __int16 v15 = [PKMetalFramebuffer alloc];
    uint64_t v16 = [(PKTiledCanvasView *)self _rendererController];
    __int16 v17 = -[PKMetalRendererController device](v16);
    uint64_t v18 = [(PKMetalFramebuffer *)(id *)&v15->super.isa initWithSize:v17 pixelFormat:0 device:1 memoryless:(void *)1 backedByIOSurface:0 sampleCount:width purgeable:height];

    objc_storeStrong((id *)p_snapshotFramebuffer, v18);
    __int16 v12 = (PKMetalFramebuffer *)v18;
  }

  return v12;
}

- (void)setupMetalViewIfNecessary
{
  if (!self->_metalView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __46__PKTiledCanvasView_setupMetalViewIfNecessary__block_invoke;
    void v2[3] = &unk_1E64C5368;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

uint64_t __46__PKTiledCanvasView_setupMetalViewIfNecessary__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  [v2 _fixedPixelSize];
  double v4 = v3;
  double v6 = v5;
  [*(id *)(a1 + 32) _fixedPixelSize];
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 32) _fixedDrawingScale];
  double v12 = 1.0 / v11;

  return objc_msgSend(v2, "setupViewWithPixelSize:drawingSize:", v4, v6, v8 * v12, v10 * v12);
}

- (void)setLinedPaper:(id)a3
{
  id v6 = a3;
  objc_storeStrong((id *)&self->_linedPaper, a3);
  double v5 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setLinedPaper:]((uint64_t)v5, v6);
}

- (void)setPaperTexture:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_paperTexture != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_paperTexture, a3);
    id v6 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setPaperTextureImage:]((uint64_t)v6, [(UIImage *)v7 CGImage]);

    double v5 = v7;
  }
}

- (void)setLiveRenderingOverrideColor:(id)a3
{
}

- (void)setLiveRenderingOverrideColor:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  p_liveRenderingOverrideColor = (id *)&self->_liveRenderingOverrideColor;
  liveRenderingOverrideColor = self->_liveRenderingOverrideColor;
  unint64_t v26 = (unint64_t)v7;
  id v10 = liveRenderingOverrideColor;
  double v11 = (void *)v26;
  if (v26 | (unint64_t)v10)
  {
    if (v26 && v10)
    {
      char v12 = [(id)v26 isEqual:v10];

      double v11 = (void *)v26;
      if (v12) {
        goto LABEL_23;
      }
      if (v4)
      {
LABEL_6:
        liveRenderingOverrideColorAnimation = (char *)self->_liveRenderingOverrideColorAnimation;
        if (liveRenderingOverrideColorAnimation)
        {
          double v14 = CACurrentMediaTime();
          -[PKInterpolateColorAnimation colorAtTime:](liveRenderingOverrideColorAnimation, v14);
          id v15 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!*p_liveRenderingOverrideColor)
          {
            __int16 v25 = [(PKTiledCanvasView *)self ink];
            uint64_t v16 = [v25 color];

            goto LABEL_13;
          }
          id v15 = *p_liveRenderingOverrideColor;
        }
        uint64_t v16 = v15;
LABEL_13:
        if (v26)
        {
          id v17 = (id)v26;
        }
        else
        {
          uint64_t v18 = [(PKTiledCanvasView *)self ink];
          id v17 = [v18 color];
        }
        objc_storeStrong((id *)&self->_liveRenderingOverrideColor, a3);
        if (v16 && v17)
        {
          double v19 = CACurrentMediaTime();
          long long v20 = (PKInterpolateColorAnimation *)-[PKInterpolateColorAnimation initWithStartColor:endColor:startTime:duration:]((uint64_t)[PKInterpolateColorAnimation alloc], v16, v17, v19, 0.15);
          long long v21 = self->_liveRenderingOverrideColorAnimation;
          self->_liveRenderingOverrideColorAnimation = v20;

          [(PKTiledCanvasView *)self liveAnimationStartTime];
          if (v22 == 0.0) {
            [(PKTiledCanvasView *)self setLiveAnimationStartTime:v19];
          }
        }
        else
        {
          __int16 v23 = self->_liveRenderingOverrideColorAnimation;
          self->_liveRenderingOverrideColorAnimation = 0;

          __int16 v24 = [(PKTiledCanvasView *)self _rendererController];
          -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v24, (CGColorRef)[*p_liveRenderingOverrideColor CGColor]);
        }
        goto LABEL_22;
      }
    }
    else
    {

      if (v4) {
        goto LABEL_6;
      }
    }
    objc_storeStrong((id *)&self->_liveRenderingOverrideColor, a3);
    uint64_t v16 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v16, (CGColorRef)[ (id) v26 CGColor]);
LABEL_22:

    double v11 = (void *)v26;
  }
LABEL_23:
}

- (void)setUseLuminanceColorFilter:(BOOL)a3
{
  BOOL v3 = a3;
  self->_useLuminanceColorFilter = a3;
  id v4 = [(PKTiledCanvasView *)self metalView];
  -[PKMetalView setUseLuminanceColorFilter:]((uint64_t)v4, v3);
}

- (unint64_t)metalLayerPixelFormat
{
  v2 = self;
  switch([(PKTiledCanvasView *)self sixChannelBlendingMode])
  {
    case 0:
    case 2:
    case 3:
      BOOL v3 = [(PKTiledCanvasView *)v2 _rendererController];
      if (!v3) {
        goto LABEL_9;
      }
      id v4 = v3 + 65;
      goto LABEL_6;
    case 1:
      BOOL v3 = [(PKTiledCanvasView *)v2 _rendererController];
      if (v3)
      {
        id v4 = v3 + 66;
LABEL_6:
        v2 = *v4;
      }
      else
      {
LABEL_9:
        v2 = 0;
      }

      break;
    default:
      return (unint64_t)v2;
  }
  return (unint64_t)v2;
}

- (void)setHasSnapshot:(BOOL)a3
{
  if (self->_hasSnapshot != a3)
  {
    self->_hasSnapshot = a3;
    [(PKTiledCanvasView *)self _updateMetalLayerOpacity];
  }
}

- (void)updateHasVisibleStrokes
{
  id v5 = [(PKTiledCanvasView *)self _drawingController];
  BOOL v3 = -[PKController renderedStrokes](v5);
  BOOL v4 = [v3 count]
    || self->_liveInteractionCount > 0
    || [(PKTiledCanvasView *)self _isLiveAnimating];

  if (self->_hasVisibleStrokes != v4)
  {
    self->_hasVisibleStrokes = v4;
    if ((*((unsigned char *)&self->_canvasViewFlags + 16) & 4) != 0)
    {
      id v6 = [(PKTiledCanvasView *)self delegate];
      [v6 canvasViewHasVisibleStrokesChanged:self];
    }
  }
}

- (void)setLiveStrokeMode:(BOOL)a3
{
  if (self->_liveStrokeMode != a3)
  {
    BOOL v3 = a3;
    self->_liveStrokeMode = a3;
    id v5 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setFadeOutStrokesMode:]((uint64_t)v5, v3);

    id v6 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setLiveStrokeMode:]((uint64_t)v6, v3);
  }
}

- (void)setLiveStrokeMaxSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (self->_liveStrokeMaxSize.width != a3.width || self->_liveStrokeMaxSize.height != a3.height)
  {
    self->_liveStrokeMaxSize = a3;
    id v6 = [(PKTiledCanvasView *)self _rendererController];
    [(PKMetalRendererController *)(uint64_t)v6 setLiveStrokeMaxSize:height];
  }
}

- (void)enumerateRenderedStrokesBounds:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(void))a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(PKTiledCanvasView *)self _drawingController];
  id v6 = -[PKController renderedStrokes](v5);

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9) _bounds];
        v4[2](v4);
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (CGRect)renderedStrokesBounds
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  CGFloat x = *MEMORY[0x1E4F1DB20];
  CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = [(PKTiledCanvasView *)self _drawingController];
  uint64_t v7 = -[PKController renderedStrokes](v6);

  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v19 + 1) + 8 * v10) _bounds];
        v28.origin.CGFloat x = v11;
        v28.origin.CGFloat y = v12;
        v28.size.CGFloat width = v13;
        v28.size.CGFloat height = v14;
        v25.origin.CGFloat x = x;
        v25.origin.CGFloat y = y;
        v25.size.CGFloat width = width;
        v25.size.CGFloat height = height;
        CGRect v26 = CGRectUnion(v25, v28);
        CGFloat x = v26.origin.x;
        CGFloat y = v26.origin.y;
        CGFloat width = v26.size.width;
        CGFloat height = v26.size.height;
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  double v15 = x;
  double v16 = y;
  double v17 = width;
  double v18 = height;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (CGRect)visibleStrokesBounds
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  [(PKTiledCanvasView *)self renderedStrokesBounds];
  CGFloat x = v3;
  CGFloat y = v5;
  CGFloat width = v7;
  CGFloat height = v9;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  CGFloat v11 = self->_fadeOutStrokeAnimations;
  uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v51;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v51 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = [*(id *)(*((void *)&v50 + 1) + 8 * v14) stroke];
        [v15 _bounds];
        v65.origin.CGFloat x = v16;
        v65.origin.CGFloat y = v17;
        v65.size.CGFloat width = v18;
        v65.size.CGFloat height = v19;
        v58.origin.CGFloat x = x;
        v58.origin.CGFloat y = y;
        v58.size.CGFloat width = width;
        v58.size.CGFloat height = height;
        CGRect v59 = CGRectUnion(v58, v65);
        CGFloat x = v59.origin.x;
        CGFloat y = v59.origin.y;
        CGFloat width = v59.size.width;
        CGFloat height = v59.size.height;

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v50 objects:v56 count:16];
    }
    while (v12);
  }

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v20 = self->_particlesToDestinationAnimations;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v47;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v20);
        }
        [*(id *)(*((void *)&v46 + 1) + 8 * v23) bounds];
        v66.origin.CGFloat x = v24;
        v66.origin.CGFloat y = v25;
        v66.size.CGFloat width = v26;
        v66.size.CGFloat height = v27;
        v60.origin.CGFloat x = x;
        v60.origin.CGFloat y = y;
        v60.size.CGFloat width = width;
        v60.size.CGFloat height = height;
        CGRect v61 = CGRectUnion(v60, v66);
        CGFloat x = v61.origin.x;
        CGFloat y = v61.origin.y;
        CGFloat width = v61.size.width;
        CGFloat height = v61.size.height;
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v46 objects:v55 count:16];
    }
    while (v21);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  CGRect v28 = self->_transformStrokesAnimations;
  uint64_t v29 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v43;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v43 != v30) {
          objc_enumerationMutation(v28);
        }
        __int16 v32 = *(void **)(*((void *)&v42 + 1) + 8 * v31);
        if (v32)
        {
          uint64_t v33 = v32[13];
          uint64_t v34 = v32[14];
          uint64_t v35 = v32[15];
          uint64_t v36 = v32[16];
        }
        else
        {
          uint64_t v34 = 0;
          uint64_t v35 = 0;
          uint64_t v36 = 0;
          uint64_t v33 = 0;
        }
        v62.origin.CGFloat x = x;
        v62.origin.CGFloat y = y;
        v62.size.CGFloat width = width;
        v62.size.CGFloat height = height;
        CGRect v63 = CGRectUnion(v62, *(CGRect *)&v33);
        CGFloat x = v63.origin.x;
        CGFloat y = v63.origin.y;
        CGFloat width = v63.size.width;
        CGFloat height = v63.size.height;
        ++v31;
      }
      while (v29 != v31);
      uint64_t v37 = [(NSMutableArray *)v28 countByEnumeratingWithState:&v42 objects:v54 count:16];
      uint64_t v29 = v37;
    }
    while (v37);
  }

  double v38 = x;
  double v39 = y;
  double v40 = width;
  double v41 = height;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)setCanvasBackgroundColor:(id)a3
{
  id v6 = a3;
  if ((-[UIColor isEqual:](self->_canvasBackgroundColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_canvasBackgroundColor, a3);
    double v5 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setBackgroundColor:]((uint64_t)v5, (CGColorRef)[v6 CGColor]);
  }
}

- (void)setResourceCacheSize:(unint64_t)a3
{
  self->_resourceCacheSize = a3;
  id v4 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setResourceCacheSize:]((uint64_t)v4, a3);
}

- (void)adjustedPixelSize:(CGSize *)a3 drawingSize:(CGSize *)a4
{
  double height = a3->height;
  if (a3->width == *MEMORY[0x1E4F1DB30] && height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [(PKTiledCanvasView *)self bounds];
    double v10 = fmax(v9, 1.0);
    double v12 = fmax(v11, 1.0);
    double metalLayerContentsScaleOverride = self->_metalLayerContentsScaleOverride;
    if (metalLayerContentsScaleOverride <= 0.0) {
      +[PKMetalUtility layerContentsScale];
    }
    +[PKMetalUtility clampedPixelSize:](PKMetalUtility, "clampedPixelSize:", v10 * metalLayerContentsScaleOverride, v12 * metalLayerContentsScaleOverride);
    a3->CGFloat width = v14;
    a3->double height = v15;
    a4->CGFloat width = v10;
    a4->double height = v12;
  }
}

- (void)setupViewWithPixelSize:(CGSize)a3 drawingSize:(CGSize)a4
{
  CGSize v36 = a3;
  CGSize v35 = a4;
  if (!self->_drawingController)
  {
    [(PKTiledCanvasView *)self adjustedPixelSize:&v36 drawingSize:&v35];
    double v5 = [PKController alloc];
    id v6 = (PKController *)-[PKController initWithPixelSize:actualSize:singleComponent:sixChannelBlendingMode:metalConfig:](v5, self->_singleComponent, [(PKTiledCanvasView *)self sixChannelBlendingMode], self->_metalConfig, v36.width, v36.height, v35.width, v35.height);
    drawingController = self->_drawingController;
    self->_drawingController = v6;

    uint64_t v8 = self->_drawingController;
    if (v8)
    {
      BOOL drawBitmapEraserMask = self->_drawBitmapEraserMask;
      if (v8->_drawBitmapEraserMask != drawBitmapEraserMask)
      {
        v8->_BOOL drawBitmapEraserMask = drawBitmapEraserMask;
        -[PKMetalRendererController setDrawBitmapEraserMask:]((uint64_t)v8->_rendererController, drawBitmapEraserMask);
      }
    }
    BOOL v10 = [(PKTiledCanvasView *)self captureLiveData];
    double v11 = [(PKTiledCanvasView *)self strokeGenerator];
    [v11 setCaptureLiveData:v10];

    double v12 = self->_drawingController;
    if (v12) {
      objc_storeWeak((id *)&v12->_delegate, self);
    }
    uint64_t v13 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setBackboardPaperMultiply:]((uint64_t)v13, 1.0);

    if (self->_resourceCacheSize)
    {
      CGFloat v14 = [(PKTiledCanvasView *)self _rendererController];
      -[PKMetalRendererController setResourceCacheSize:]((uint64_t)v14, self->_resourceCacheSize);
    }
    int v15 = [(PKTiledCanvasView *)self liveStrokeMode];
    CGFloat v16 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setFadeOutStrokesMode:]((uint64_t)v16, v15);

    BOOL v17 = [(PKTiledCanvasView *)self liveStrokeMode];
    CGFloat v18 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setLiveStrokeMode:]((uint64_t)v18, v17);

    LOBYTE(v17) = [(PKTiledCanvasView *)self isPDFCanvasForAnalytics];
    CGFloat v19 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setIsPDFCanvasForAnalytics:]((uint64_t)v19, v17);
  }
  unint64_t v20 = [(PKTiledCanvasView *)self metalLayerPixelFormat];
  -[PKTiledCanvasView setupMetalViewForPixelFormat:withPixelSize:](self, "setupMetalViewForPixelFormat:withPixelSize:", v20, v36.width, v36.height);
  metalView = self->_metalView;
  if (metalView)
  {
    CGFloat width = v36.width;
    CGFloat height = v36.height;
    if (v36.width == *MEMORY[0x1E4F1DB30] && v36.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      metalView->_isFixedPixelSize = 0;
    }
    else
    {
      metalView->_isFixedPixelSize = 1;
      p_CGFloat width = &metalView->_fixedPixelSize.width;
      *p_CGFloat width = width;
      p_width[1] = height;
    }
  }
  -[PKMetalView resizeDrawableIfNecessary]((uint64_t)self->_metalView);
  CGFloat v26 = [(PKTiledCanvasView *)self _rendererController];
  CGFloat v27 = -[PKMetalView metalLayer]((id *)&self->_metalView->super.super.super.isa);
  -[PKMetalRendererController setPresentationLayer:]((uint64_t)v26, v27);

  if ([(PKTiledCanvasView *)self sixChannelBlendingMode] == 2)
  {
    CGRect v28 = [(PKTiledCanvasView *)self _rendererController];
    uint64_t v29 = -[PKMetalView metalMultiplyLayer]((id *)&self->_metalView->super.super.super.isa);
    -[PKMetalRendererController setMultiplyPresentationLayer:]((uint64_t)v28, v29);
  }
  canvasBackgroundColor = self->_canvasBackgroundColor;
  uint64_t v31 = canvasBackgroundColor;
  if (!canvasBackgroundColor)
  {
    uint64_t v31 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  [(PKTiledCanvasView *)self setCanvasBackgroundColor:v31];
  if (!canvasBackgroundColor) {

  }
  __int16 v32 = [(PKTiledCanvasView *)self linedPaper];

  if (v32)
  {
    uint64_t v33 = [(PKTiledCanvasView *)self linedPaper];
    uint64_t v34 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setLinedPaper:]((uint64_t)v34, v33);
  }
}

- (void)setupMetalViewForPixelFormat:(unint64_t)a3 withPixelSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  if (a3) {
    unint64_t v7 = a3;
  }
  else {
    unint64_t v7 = 80;
  }
  uint64_t v8 = [PKMetalView alloc];
  [(PKTiledCanvasView *)self bounds];
  uint64_t v13 = (PKMetalView *)-[PKMetalView initWithFrame:andPixelSize:pixelFormat:](v8, v7, v9, v10, v11, v12, width, height);
  metalView = self->_metalView;
  self->_metalView = v13;

  [(PKMetalView *)self->_metalView setOpaque:1];
  [(PKMetalView *)self->_metalView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[PKMetalView setUseLuminanceColorFilter:]((uint64_t)self->_metalView, [(PKTiledCanvasView *)self useLuminanceColorFilter]);
  -[PKMetalView setSixChannelBlending:]((uint64_t)self->_metalView, [(PKTiledCanvasView *)self sixChannelBlendingMode] == 2);
  [(PKTiledCanvasView *)self _updateMetalLayerOpacity];
  [(PKTiledCanvasView *)self addSubview:self->_metalView];

  [(PKTiledCanvasView *)self setupDisplayLink];
}

- (void)setMetalLayerContentsScaleOverride:(double)a3
{
  if (self->_metalLayerContentsScaleOverride != a3)
  {
    self->_double metalLayerContentsScaleOverride = a3;
    [(PKTiledCanvasView *)self _fixedPixelSize];
    double v5 = v4;
    double v7 = v6;
    [(PKTiledCanvasView *)self _fixedDrawingScale];
    -[PKTiledCanvasView resizeBackingBuffersForPixelSize:drawingScale:](self, "resizeBackingBuffersForPixelSize:drawingScale:", v5, v7, v8);
  }
}

- (void)setupDisplayLink
{
  if (!self->_displayLink)
  {
    double v7 = objc_alloc_init(PKTiledCanvasViewDisplayLinkDelegate);
    [(PKTiledCanvasViewDisplayLinkDelegate *)v7 setView:self];
    double v3 = [MEMORY[0x1E4F39B68] displayLinkWithTarget:v7 selector:sel_display_];
    displayLink = self->_displayLink;
    self->_displayLink = v3;

    CAFrameRateRange v9 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
    -[CADisplayLink setPreferredFrameRateRange:](self->_displayLink, "setPreferredFrameRateRange:", *(double *)&v9.minimum, *(double *)&v9.maximum, *(double *)&v9.preferred);
    [(CADisplayLink *)self->_displayLink setHighFrameRateReason:1507329];
    double v5 = self->_displayLink;
    double v6 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:*MEMORY[0x1E4F1C4B0]];

    [(CADisplayLink *)self->_displayLink setPaused:1];
  }
}

- (BOOL)_isDisplayLinkPaused
{
  if (_UIUpdateCycleEnabled()) {
    return self->_updateSequenceVSyncItem == 0;
  }
  displayLink = self->_displayLink;

  return [(CADisplayLink *)displayLink isPaused];
}

- (void)_startDisplayLinkShouldPause:(BOOL)a3
{
  self->_shouldPause = a3;
  char v4 = _UIUpdateCycleEnabled();
  if (_UIUpdateCycleEnabled() && !self->_updateSequenceItem)
  {
    objc_initWeak(&location, self);
    _UIUpdateRequestActivate();
    v9[1] = (id)MEMORY[0x1E4F143A8];
    v9[2] = (id)3221225472;
    v9[3] = __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke;
    v9[4] = &unk_1E64C6348;
    objc_copyWeak(&v10, &location);
    v9[5] = self;
    self->_updateSequenceItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    uint64_t v5 = MEMORY[0x1E4F143A8];
    uint64_t v6 = 3221225472;
    double v7 = __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke_2;
    double v8 = &unk_1E64C6370;
    objc_copyWeak(v9, &location);
    self->_updateSequenceVSyncItem = (_UIUpdateSequenceItemInternal *)_UIUpdateSequenceInsertItem();
    objc_destroyWeak(v9);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    if (v4) {
      return;
    }
  }
  else if (v4)
  {
    return;
  }
  -[CADisplayLink setPaused:](self->_displayLink, "setPaused:", 0, v5, v6, v7, v8);
}

void __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    double v3 = [WeakRetained _rendererController];
    -[PKMetalRendererController updateCyclePreCACommit:isDrawing:]((uint64_t)v3, [*(id *)(a1 + 32) isDrawing]);

    id WeakRetained = v4;
  }
}

void __50__PKTiledCanvasView__startDisplayLinkShouldPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  _UIMediaTimeForMachTime();
  objc_msgSend(WeakRetained, "_updateSequenceVSync:");
}

- (void)_stopDisplayLink
{
  if (_UIUpdateCycleEnabled() && self->_updateSequenceItem)
  {
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceItem = 0;
    _UIUpdateSequenceRemoveItem();
    self->_updateSequenceVSyncItem = 0;
    _UIUpdateRequestDeactivate();
  }
  [(CADisplayLink *)self->_displayLink setPaused:1];
  self->_shouldPause = 0;
}

- (BOOL)_isShapeRecognitionEnabled
{
  if (PKDisableShapeRecognition()) {
    return 0;
  }
  id v4 = [(PKTiledCanvasView *)self delegate];
  char v3 = [v4 canvasViewAllowSnapToShape:self];

  return v3;
}

- (void)setNeedsDrawingDisplay
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKTiledCanvasView_setNeedsDrawingDisplay__block_invoke;
  block[3] = &unk_1E64C5368;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__PKTiledCanvasView_setNeedsDrawingDisplay__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) _isDisplayLinkPaused];
  if (result)
  {
    char v3 = *(void **)(a1 + 32);
    return [v3 _startDisplayLinkShouldPause:1];
  }
  return result;
}

- (BOOL)_isLiveAnimating
{
  if (self->_alternativeStrokesAnimation) {
    return 1;
  }
  [(PKTiledCanvasView *)self liveAnimationStartTime];
  if (v3 > 0.0) {
    return 1;
  }
  if (![(PKTiledCanvasView *)self liveStrokeMode]) {
    return 0;
  }
  uint64_t v6 = [(PKTiledCanvasView *)self _drawingController];
  double v7 = -[PKController renderedStrokes](v6);
  BOOL v4 = [v7 count] != 0;

  return v4;
}

- (BOOL)_isCombiningStrokes
{
  return self->_isCombiningStrokes;
}

- (id)_combineStrokesDrawingUUID
{
  return self->_combineStrokesDrawingID;
}

- (void)handleDrawingShouldPause:(BOOL)a3
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke;
  aBlock[3] = &unk_1E64C6618;
  BOOL v7 = a3;
  aBlock[4] = self;
  double v3 = (void (**)(void))_Block_copy(aBlock);
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    v3[2](v3);
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke_2;
    block[3] = &unk_1E64C5390;
    uint64_t v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  double v3 = *(unsigned char **)(a1 + 32);
  if (v2)
  {
    BOOL v4 = [v3 _drawingController];
    BOOL v5 = !v4 || (v4[48] & 1) == 0 || *(unsigned char *)(*(void *)(a1 + 32) + 606) != 0;

    double v3 = *(unsigned char **)(a1 + 32);
  }
  else
  {
    BOOL v5 = v3[606] != 0;
  }
  uint64_t result = [v3 _isLiveAnimating];
  if ((result & 1) == 0 && v5)
  {
    BOOL v7 = *(void **)(a1 + 32);
    return [v7 _stopDisplayLink];
  }
  return result;
}

uint64_t __46__PKTiledCanvasView_handleDrawingShouldPause___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_reduceMemoryFootprint
{
  [(PKTiledCanvasView *)self cancelCurrentStroke];
  [(PKTiledCanvasView *)self _stopDisplayLink];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKTiledCanvasView__reduceMemoryFootprint__block_invoke;
  block[3] = &unk_1E64C5368;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __43__PKTiledCanvasView__reduceMemoryFootprint__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _purgeResources];
}

- (void)_purgeResources
{
  if ([(PKTiledCanvasView *)self isHidden])
  {
    snapshotFramebuffer = self->_snapshotFramebuffer;
    self->_snapshotFramebuffer = 0;

    -[PKMetalView flushDrawables]((uint64_t)self->_metalView);
    BOOL v4 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController purgeOriginalBackFramebuffer]((uint64_t)v4);

    if ([(NSMutableArray *)self->_strokeRenderCachesToPurge count])
    {
      BOOL v5 = [(PKTiledCanvasView *)self _rendererController];
      -[PKMetalRendererController purgeRenderCachesForStrokes:]((uint64_t)v5, self->_strokeRenderCachesToPurge);

      strokeRenderCachesToPurge = self->_strokeRenderCachesToPurge;
      [(NSMutableArray *)strokeRenderCachesToPurge removeAllObjects];
    }
  }
}

void __48__PKTiledCanvasView_schedulePurgeResourcesBlock__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if ([WeakRetained isHidden])
    {
      if (([WeakRetained isDrawing] & 1) == 0)
      {
        v1 = [WeakRetained _drawingController];
        if (!v1 || (char v2 = v1[48], v1, (v2 & 1) == 0)) {
          [WeakRetained _purgeResources];
        }
      }
    }
    [WeakRetained setPurgeResourcesBlock:0];
  }
}

- (void)_didFinishHideCanvasTransaction
{
  id v2 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setCombineStrokesAllowed:]((uint64_t)v2, 0);
}

- (void)_drawingDisplay:(double)a3
{
  if (!_UIUpdateCycleEnabled() || !self->_updateSequenceVSyncItem)
  {
    [(PKTiledCanvasView *)self _updateSequenceVSync:a3];
  }
}

- (void)_updateSequenceVSync:(double)a3
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  double v5 = CACurrentMediaTime();
  BOOL v6 = [(PKTiledCanvasView *)self _isLiveAnimating];
  int v7 = [(PKDrawingGestureRecognizerProtocol *)self->_drawingGestureRecognizer isReplaying];
  BOOL v104 = v6;
  val = self;
  if (v6)
  {
    [(PKTiledCanvasView *)self liveAnimationStartTime];
    double v9 = v8;
    id v10 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setLiveStrokeElapsedTime:]((uint64_t)v10, v5 - v9);

    [(PKTiledCanvasView *)self isHidden];
  }
  else if ([(PKTiledCanvasView *)self isHidden])
  {
    double v11 = [(PKTiledCanvasView *)self _drawingController];
    double v12 = v11;
    if (v11 && (v11[48] & 1) != 0 || val->_isErasingObjects)
    {

      self = val;
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)&val->_currentDrawingBeingCopiedToCanvas);

      self = val;
      if (!WeakRetained)
      {
        [(PKTiledCanvasView *)val handleDrawingShouldPause:1];
        return;
      }
    }
  }
  metalView = self->_metalView;
  if (metalView && metalView->_doubleBuffered && (-[PKMetalView isDrawableAvailable]((uint64_t)metalView) & 1) == 0)
  {
    unint64_t v14 = self->_numSkippedDoubleBufferedFrames + 1;
    self->_numSkippedDoubleBufferedFrames = v14;
    if (v14 < 8) {
      return;
    }
    int v15 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setDoubleBuffered:]((uint64_t)v15, 0);

    self = val;
  }
  uint64_t v16 = [(PKTiledCanvasView *)self shapeDrawingController];
  BOOL v17 = (void *)v16;
  if (v16) {
    -[PKShapeDrawingController _checkDetectedStroke](v16);
  }

  CGFloat v18 = [MEMORY[0x1E4F28F80] processInfo];
  [v18 systemUptime];
  double v20 = v19;

  uint64_t v21 = (uint64_t *)val;
  [(PKTiledCanvasView *)val drawingStartTimestamp];
  double v23 = v22;
  [(CADisplayLink *)val->_displayLink maximumRefreshRate];
  if (v24 >= 0.00833333333) {
    double v25 = v24;
  }
  else {
    double v25 = 0.00833333333;
  }
  if ([(PKTiledCanvasView *)val isDrawing])
  {
    CGFloat v26 = [(PKTiledCanvasView *)val powerSavingController];
    if (v26)
    {
      int v27 = v26[72];

      uint64_t v21 = (uint64_t *)val;
      if (v27)
      {
        CGRect v28 = [(PKTiledCanvasView *)val powerSavingController];
        [(PKDrawingPowerSavingController *)(uint64_t)v28 accumulateMovementForCurrentFrame];

        uint64_t v21 = (uint64_t *)val;
        int v30 = v104;
        if (!val->_metalView) {
          int v30 = 1;
        }
        if (((v30 | v7) & 1) == 0 && ![(PKTiledCanvasView *)val isPreviewing])
        {
          uint64_t v31 = [(PKTiledCanvasView *)val powerSavingController];
          BOOL v32 = -[PKDrawingPowerSavingController shouldSkipFrameWithFrameStartTimestamp:framesAfterStart:]((BOOL)v31, (unint64_t)((v20 - v23) / v25), v20);

          uint64_t v21 = (uint64_t *)val;
          if (v32)
          {
            kdebug_trace();
            return;
          }
        }
      }
    }
    else
    {
      uint64_t v21 = (uint64_t *)val;
    }
  }
  if ([v21 isDrawing])
  {
    uint64_t v34 = [v21 powerSavingController];
    if (v34)
    {
      *(unsigned char *)(v34 + 72) = 1;
      *(void *)(v34 + 48) = 0;
      *(void *)(v34 + 56) = 0;
      *(double *)(v34 + 64) = v20;
    }

    uint64_t v21 = (uint64_t *)val;
  }
  -[PKMetalView resizeDrawableIfNecessary](v21[94]);
  if ([v21 liveStrokeMode])
  {
    double x = *MEMORY[0x1E4F1DB20];
    double y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    double v39 = [MEMORY[0x1E4F1CA80] setWithCapacity:100];
    double v40 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:100];
    long long v141 = 0u;
    long long v142 = 0u;
    long long v139 = 0u;
    long long v140 = 0u;
    double v41 = val->_fadeOutStrokeAnimations;
    uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v139 objects:v148 count:16];
    if (v42)
    {
      uint64_t v43 = *(void *)v140;
      do
      {
        for (uint64_t i = 0; i != v42; ++i)
        {
          if (*(void *)v140 != v43) {
            objc_enumerationMutation(v41);
          }
          long long v45 = *(void **)(*((void *)&v139 + 1) + 8 * i);
          long long v46 = (void *)[v45 newStrokeAtTime:v5];
          [v40 addObject:v46];

          long long v47 = [v45 stroke];
          long long v48 = [v47 _strokeUUID];
          [v39 addObject:v48];
        }
        uint64_t v42 = [(NSMutableArray *)v41 countByEnumeratingWithState:&v139 objects:v148 count:16];
      }
      while (v42);
    }

    long long v137 = 0u;
    long long v138 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    long long v49 = [(PKTiledCanvasView *)val particlesToDestinationAnimations];
    id obj = v49;
    uint64_t v50 = [v49 countByEnumeratingWithState:&v135 objects:v147 count:16];
    if (v50)
    {
      uint64_t v108 = *(void *)v136;
      do
      {
        uint64_t v110 = v50;
        for (uint64_t j = 0; j != v110; ++j)
        {
          if (*(void *)v136 != v108) {
            objc_enumerationMutation(obj);
          }
          long long v52 = *(void **)(*((void *)&v135 + 1) + 8 * j);
          long long v131 = 0u;
          long long v132 = 0u;
          long long v133 = 0u;
          long long v134 = 0u;
          v112 = v52;
          long long v53 = [v52 strokes];
          uint64_t v54 = [v53 countByEnumeratingWithState:&v131 objects:v146 count:16];
          if (v54)
          {
            uint64_t v55 = *(void *)v132;
            do
            {
              for (uint64_t k = 0; k != v54; ++k)
              {
                if (*(void *)v132 != v55) {
                  objc_enumerationMutation(v53);
                }
                uint64_t v57 = *(void **)(*((void *)&v131 + 1) + 8 * k);
                CGRect v58 = [v57 _strokeUUID];
                char v59 = [v39 containsObject:v58];

                if ((v59 & 1) == 0)
                {
                  [v40 addObject:v57];
                  [v39 addObject:v57];
                }
              }
              uint64_t v54 = [v53 countByEnumeratingWithState:&v131 objects:v146 count:16];
            }
            while (v54);
          }

          [v112 bounds];
          v155.origin.double x = v60;
          v155.origin.double y = v61;
          v155.size.double width = v62;
          v155.size.double height = v63;
          v151.origin.double x = x;
          v151.origin.double y = y;
          v151.size.double width = width;
          v151.size.double height = height;
          CGRect v152 = CGRectUnion(v151, v155);
          double x = v152.origin.x;
          double y = v152.origin.y;
          double width = v152.size.width;
          double height = v152.size.height;
        }
        long long v49 = obj;
        uint64_t v50 = [obj countByEnumeratingWithState:&v135 objects:v147 count:16];
      }
      while (v50);
    }

    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    v64 = [(PKTiledCanvasView *)val transformStrokesAnimations];
    v109 = v64;
    uint64_t v65 = [v64 countByEnumeratingWithState:&v127 objects:v145 count:16];
    if (v65)
    {
      id obja = *(id *)v128;
      do
      {
        uint64_t v66 = 0;
        uint64_t v111 = v65;
        do
        {
          if (*(id *)v128 != obja) {
            objc_enumerationMutation(v64);
          }
          uint64_t v113 = v66;
          v67 = *(void **)(*((void *)&v127 + 1) + 8 * v66);
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          v68 = -[PKTransformStrokesAnimation newStrokesAtTime:]((uint64_t)v67, v5);
          uint64_t v69 = [v68 countByEnumeratingWithState:&v123 objects:v144 count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v124;
            do
            {
              for (uint64_t m = 0; m != v69; ++m)
              {
                if (*(void *)v124 != v70) {
                  objc_enumerationMutation(v68);
                }
                v72 = *(void **)(*((void *)&v123 + 1) + 8 * m);
                v73 = [v72 _strokeUUID];
                char v74 = [v39 containsObject:v73];

                if ((v74 & 1) == 0)
                {
                  [v40 addObject:v72];
                  [v39 addObject:v72];
                }
              }
              uint64_t v69 = [v68 countByEnumeratingWithState:&v123 objects:v144 count:16];
            }
            while (v69);
          }

          if (v67)
          {
            uint64_t v75 = v67[13];
            uint64_t v76 = v67[14];
            uint64_t v77 = v67[15];
            uint64_t v78 = v67[16];
          }
          else
          {
            uint64_t v76 = 0;
            uint64_t v77 = 0;
            uint64_t v78 = 0;
            uint64_t v75 = 0;
          }
          v64 = v109;
          v153.origin.double x = x;
          v153.origin.double y = y;
          v153.size.double width = width;
          v153.size.double height = height;
          CGRect v154 = CGRectUnion(v153, *(CGRect *)&v75);
          double x = v154.origin.x;
          double y = v154.origin.y;
          double width = v154.size.width;
          double height = v154.size.height;
          uint64_t v66 = v113 + 1;
        }
        while (v113 + 1 != v111);
        uint64_t v65 = [v109 countByEnumeratingWithState:&v127 objects:v145 count:16];
      }
      while (v65);
    }

    v79 = [(PKTiledCanvasView *)val strokeUUIDsAboutToBeRemoved];
    [v39 unionSet:v79];

    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    v80 = [(PKTiledCanvasView *)val _drawingController];
    v81 = -[PKController renderedStrokes](v80);

    uint64_t v82 = [v81 countByEnumeratingWithState:&v119 objects:v143 count:16];
    if (v82)
    {
      uint64_t v83 = *(void *)v120;
      do
      {
        for (uint64_t n = 0; n != v82; ++n)
        {
          if (*(void *)v120 != v83) {
            objc_enumerationMutation(v81);
          }
          v85 = *(void **)(*((void *)&v119 + 1) + 8 * n);
          v86 = [v85 _strokeUUID];
          char v87 = [v39 containsObject:v86];

          if ((v87 & 1) == 0) {
            [v40 addObject:v85];
          }
        }
        uint64_t v82 = [v81 countByEnumeratingWithState:&v119 objects:v143 count:16];
      }
      while (v82);
    }

    +[PKDrawing sortStrokes:v40];
    v88 = [(PKTiledCanvasView *)val _rendererController];
    -[PKMetalRendererController setLiveStrokeStrokes:animationBounds:]((uint64_t)v88, v40, x, y, width, height);

    uint64_t v21 = (uint64_t *)val;
  }
  if (v21[106])
  {
    v89 = [v21 _rendererController];
    alternativeStrokesAnimatiouint64_t n = val->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation) {
      alternativeStrokesAnimatiouint64_t n = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_strokes;
    }
    v91 = alternativeStrokesAnimation;
    uint64_t v92 = (uint64_t)val->_alternativeStrokesAnimation;
    double v93 = -[PKAlternativeStrokesAnimation alphaAtTime:](v92, v5);
    double v94 = -[PKAlternativeStrokesAnimation originalStrokeAlphaAtTime:](v92, v5);
    -[PKMetalRendererController setAlternativeStrokes:alpha:originalStrokeAlpha:]((uint64_t)v89, v91, v93, v94);

    uint64_t v21 = (uint64_t *)val;
  }
  v95 = (char *)v21[109];
  if (v95)
  {
    v96 = -[PKInterpolateColorAnimation colorAtTime:](v95, v5);
    v97 = [(PKTiledCanvasView *)val _rendererController];
    id v98 = v96;
    -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v97, (CGColorRef)[v98 CGColor]);

    uint64_t v21 = (uint64_t *)val;
  }
  if (v104)
  {
    [v21 checkAnimationsDidEndAtTime:v5];
    uint64_t v21 = (uint64_t *)val;
  }
  v99 = [v21 _rendererController];
  memset(v118, 0, sizeof(v118));
  -[PKMetalRendererController prerenderWithTransform:inputScale:at:]((uint64_t)v99, v118, val->_inputScale, a3);

  v116[0] = 0;
  v116[1] = v116;
  v116[2] = 0x3042000000;
  v116[3] = __Block_byref_object_copy__3;
  v116[4] = __Block_byref_object_dispose__3;
  objc_initWeak(&v117, val);
  val->_latestRenderTimestamp = CACurrentMediaTime();
  uint64_t v100 = [(PKTiledCanvasView *)val _drawingController];
  v101 = (void *)v100;
  if (v100) {
    v102 = *(void **)(v100 + 64);
  }
  else {
    v102 = 0;
  }
  id v103 = v102;
  v114[0] = MEMORY[0x1E4F143A8];
  v114[1] = 3221225472;
  v114[2] = __42__PKTiledCanvasView__updateSequenceVSync___block_invoke;
  v114[3] = &unk_1E64C6398;
  v114[4] = v116;
  BOOL v115 = v104;
  -[PKMetalRendererController didFinishRendering:]((uint64_t)v103, v114);

  _Block_object_dispose(v116, 8);
  objc_destroyWeak(&v117);
}

void __42__PKTiledCanvasView__updateSequenceVSync___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40));
  if (a2) {
    BOOL v5 = *(unsigned char *)(a1 + 40) == 0;
  }
  else {
    BOOL v5 = 0;
  }
  id v6 = WeakRetained;
  [WeakRetained handleDrawingShouldPause:v5];
}

- (void)setIsUnderBlendedContent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isUnderBlendedContent = a3;
  BOOL v5 = [(PKTiledCanvasView *)self metalView];
  BOOL v4 = -[PKMetalView metalLayer](v5);
  [v4 setAllowsDisplayCompositing:!v3];
}

- (void)setCaptureLiveData:(BOOL)a3
{
  BOOL v3 = a3;
  self->_captureLiveData = a3;
  id v4 = [(PKTiledCanvasView *)self strokeGenerator];
  [v4 setCaptureLiveData:v3];
}

- (void)delayCompletionBlockUntilPresentation:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    BOOL v5 = [(PKTiledCanvasView *)self _rendererController];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke;
    aBlock[3] = &unk_1E64C5390;
    id v8 = v4;
    -[PKMetalRendererController callBlockAfterPresenting:]((uint64_t)v5, aBlock);
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke_2;
  v6[3] = &unk_1E64C5368;
  v6[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

uint64_t __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __59__PKTiledCanvasView_delayCompletionBlockUntilPresentation___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _drawingDisplay:0.0];
}

- (void)_setDrawing:(id)a3 tiles:(id)a4 image:(CGImage *)a5 tileTransform:(CGAffineTransform *)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  if (a5)
  {
    int v15 = [(PKTiledCanvasView *)self _rendererController];
    uint64_t v16 = -[PKMetalRendererController device](v15);
    a5 = +[PKMetalUtility textureFromImage:a5 device:v16];

    long long v17 = *(_OWORD *)&a6->c;
    long long v23 = *(_OWORD *)&a6->a;
    long long v24 = v17;
    long long v25 = *(_OWORD *)&a6->tx;
    if (a5) {
      CGFloat v18 = (void *)*((void *)a5 + 3);
    }
    else {
      CGFloat v18 = 0;
    }
  }
  else
  {
    CGFloat v18 = 0;
    long long v19 = *(_OWORD *)&a6->c;
    long long v23 = *(_OWORD *)&a6->a;
    long long v24 = v19;
    long long v25 = *(_OWORD *)&a6->tx;
  }
  id v20 = v18;
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v22[0] = *MEMORY[0x1E4F1DAB8];
  v22[1] = v21;
  v22[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(PKTiledCanvasView *)self _setDrawing:v12 tiles:v13 tileTransform:&v23 snapshotTexture:v20 snapshotTextureTransform:v22 completionBlock:v14];
}

- (void)_setDrawing:(id)a3 tiles:(id)a4 tileTransform:(CGAffineTransform *)a5 snapshotTexture:(id)a6 snapshotTextureTransform:(CGAffineTransform *)a7 completionBlock:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  CGFloat v18 = (void (**)(void))a8;
  if (!v15)
  {
LABEL_5:
    if (v18) {
      v18[2](v18);
    }
    goto LABEL_12;
  }
  [(PKTiledCanvasView *)self setupMetalViewIfNecessary];
  [(PKTiledCanvasView *)self setHasSnapshot:v17 != 0];
  if (self->_liveInteractionCount >= 1 && [v15 _isEmpty])
  {
    long long v19 = [(PKTiledCanvasView *)self _drawingController];
    -[PKController setLiveInteractionDrawing:]((uint64_t)v19, v15);

    objc_storeStrong((id *)&self->_drawing, a3);
    goto LABEL_5;
  }
  objc_initWeak(location, self);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  [(PKTiledCanvasView *)self scaledStrokeTransform];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke;
  aBlock[3] = &unk_1E64C63C0;
  objc_copyWeak(&v39, location);
  long long v40 = v43;
  long long v41 = v44;
  long long v42 = v45;
  double v38 = v18;
  id v20 = _Block_copy(aBlock);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_2;
  v33[3] = &unk_1E64C63E8;
  objc_copyWeak(&v36, location);
  id v21 = v15;
  id v34 = v21;
  id v22 = v20;
  id v35 = v22;
  long long v23 = _Block_copy(v33);
  if (v16 || !v17)
  {
    long long v25 = [(PKTiledCanvasView *)self _drawingController];
    long long v26 = *(_OWORD *)&a5->c;
    v30[0] = *(_OWORD *)&a5->a;
    v30[1] = v26;
    v30[2] = *(_OWORD *)&a5->tx;
    long long v27 = *(_OWORD *)&a7->c;
    v29[0] = *(_OWORD *)&a7->a;
    v29[1] = v27;
    v29[2] = *(_OWORD *)&a7->tx;
    -[PKController setDrawing:tiles:tileTransform:contentImageTexture:contentImageTextureTransform:completionBlock:](v25, v21, v16, v30, v17, v29, v23);
  }
  else
  {
    long long v24 = [(PKTiledCanvasView *)self _drawingController];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_4;
    v31[3] = &unk_1E64C5390;
    BOOL v32 = v23;
    -[PKController setDrawing:imageTexture:completion:]((uint64_t)v24, v21, v17, v31);

    long long v25 = v32;
  }

  objc_destroyWeak(&v36);
  objc_destroyWeak(v28);
  objc_destroyWeak(location);
LABEL_12:
}

uint64_t __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v2;
  long long v10 = *(_OWORD *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained _rendererController];
  v7[0] = v8;
  v7[1] = v9;
  v7[2] = v10;
  -[PKMetalRendererController setStrokeTransform:]((uint64_t)v4, v7);

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = MEMORY[0x1E4F143A8];
  uint64_t v5 = 3221225472;
  id v6 = __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_3;
  int v7 = &unk_1E64C5870;
  id v3 = WeakRetained;
  id v8 = v3;
  id v9 = *(id *)(a1 + 32);
  dispatch_sync(MEMORY[0x1E4F14428], &v4);
  objc_msgSend(v3, "delayCompletionBlockUntilPresentation:", *(void *)(a1 + 40), v4, v5, v6, v7);
}

void *__110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void **)(a1 + 32);
  if (result)
  {
    id v3 = [result drawing];
    uint64_t v4 = [v3 uuid];
    uint64_t v5 = [*(id *)(a1 + 40) uuid];
    int v6 = [v4 isEqual:v5];

    if (v6)
    {
      int v7 = [*(id *)(a1 + 32) drawing];
      [v7 mergeWithDrawing:*(void *)(a1 + 40)];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 32);
      id v9 = *(id *)(a1 + 40);
      int v7 = *(void **)(v8 + 648);
      *(void *)(v8 + 648) = v9;
    }

    long long v10 = *(void **)(a1 + 32);
    return (void *)[v10 setupDisplayLink];
  }
  return result;
}

uint64_t __110__PKTiledCanvasView__setDrawing_tiles_tileTransform_snapshotTexture_snapshotTextureTransform_completionBlock___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PKDrawing)activeDrawing
{
  id v3 = [(PKTiledCanvasView *)self currentDrawingBeingCopiedToCanvas];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(PKTiledCanvasView *)self drawing];
  }
  int v6 = v5;

  return (PKDrawing *)v6;
}

- (void)drawingChanged:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[v4 copy];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  long long v10 = __36__PKTiledCanvasView_drawingChanged___block_invoke;
  double v11 = &unk_1E64C5870;
  id v12 = self;
  id v6 = v5;
  id v13 = v6;
  int v7 = (void (**)(void))_Block_copy(&v8);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v8, v9, v10, v11, v12)) {
    v7[2](v7);
  }
  else {
    dispatch_async(MEMORY[0x1E4F14428], v7);
  }
}

uint64_t __36__PKTiledCanvasView_drawingChanged___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v2 = [*(id *)(a1 + 32) drawing];
  id v3 = [v2 uuid];
  id v4 = [*(id *)(a1 + 40) uuid];
  int v5 = [v3 isEqual:v4];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) drawing];
    [v6 mergeWithDrawing:*(void *)(a1 + 40)];
  }
  int v7 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    double v11 = [*(id *)(a1 + 32) drawing];
    id v12 = [*(id *)(a1 + 32) _drawingController];
    id v13 = -[PKController renderedStrokes](v12);
    int v14 = 138412546;
    id v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = [v13 count];
    _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "Drawing changed %@, renderedStrokes: %lu", (uint8_t *)&v14, 0x16u);
  }
  uint64_t v8 = *(_WORD **)(a1 + 32);
  if (v8[224])
  {
    uint64_t v9 = [v8 delegate];
    [v9 canvasView:*(void *)(a1 + 32) drawingDidChange:*(void *)(a1 + 40)];

    uint64_t v8 = *(_WORD **)(a1 + 32);
  }
  return [v8 updateHasVisibleStrokes];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKTiledCanvasView *)self allowSimultaneousGR];
  if (v8)
  {
    id v9 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
    if (v9 == v6)
    {
      BOOL v11 = 1;
    }
    else
    {
      id v10 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
      BOOL v11 = v10 == v7;
    }
    BOOL v12 = (v8 == v6 || v8 == v7) && v11;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
  if (v8 != v6)
  {

LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  NSClassFromString(&cfstr_Uitextselectio.isa);
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    goto LABEL_5;
  }
  BOOL v10 = 1;
LABEL_6:

  return v10;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  if ((*(_WORD *)&self->_canvasViewFlags & 0x1000) != 0)
  {
    id v7 = [(PKTiledCanvasView *)self delegate];
    char v6 = [v7 canvasView:self shouldBeginDrawingWithTouch:v5];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTiledCanvasView *)self drawingGestureRecognizer];

  if (v5 == v4)
  {
    char v6 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_DEFAULT, "_gestureRecognizerFailed called for drawing gesture recognizer", v7, 2u);
    }

    [v4 cancel];
  }
}

- (id)_touchView
{
  long long v2 = self;
  id v3 = v2;
  if (v2->_canvasViewFlags.delegateSupportsTouchView)
  {
    id v4 = [(PKTiledCanvasView *)v2 delegate];
    id v5 = [v4 canvasViewTouchView:v3];
  }
  else
  {
    id v5 = v2;
  }
  if (v5) {
    char v6 = v5;
  }
  else {
    char v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)currentStroke
{
  long long v2 = [(PKTiledCanvasView *)self strokeGenerator];
  id v3 = (void *)[v2 newStrokeWithCurrentData];

  return v3;
}

- (id)currentStrokeWithStrokeDataCopy
{
  long long v2 = [(PKTiledCanvasView *)self strokeGenerator];
  id v3 = (void *)[v2 newStrokeWithCurrentDataCopy];

  return v3;
}

- (void)cancelCurrentStroke
{
  id v3 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "cancelCurrentStroke called", v5, 2u);
  }

  id v4 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
  [v4 cancel];
}

- (id)liveDrawing
{
  id v3 = [(PKTiledCanvasView *)self currentStrokeWithStrokeDataCopy];
  if (v3) {
    [(PKDrawing *)self->_drawing updateStroke:v3 indexHint:[(PKDrawing *)self->_drawing _rootStrokesCount] - 1];
  }
  id v4 = self->_drawing;

  return v4;
}

- (double)_inputScale
{
  [(PKTiledCanvasView *)self strokeTransform];
  CGAffineTransformInvert(&v12, &v11);
  double a = v12.a;
  double b = v12.b;
  id v5 = [(PKTiledCanvasView *)self window];
  -[PKTiledCanvasView convertSize:toView:](self, "convertSize:toView:", v5, 1.0, 1.0);
  double v7 = v6;
  double v8 = sqrt(b * b + a * a);

  if (v7 <= 0.0) {
    double v9 = 1.0;
  }
  else {
    double v9 = v7;
  }
  return v8 / v9;
}

- (CGAffineTransform)strokeTransform
{
  id v7 = [(PKTiledCanvasView *)self _touchView];
  uint64_t v4 = objc_opt_class();
  id v5 = PKDynamicCast(v4, v7);
  [(PKTiledCanvasView *)self strokeTransformForAttachment:v5];

  return result;
}

- (CGAffineTransform)_strokeTransformForAttachment:(SEL)a3
{
  id v6 = a4;
  memset(&v21, 0, sizeof(v21));
  [(PKTiledCanvasView *)self _replayCoordinateSystemTransform];
  CGAffineTransform v20 = v21;
  if (!CGAffineTransformIsIdentity(&v20))
  {
    long long v9 = *(_OWORD *)&v21.c;
    *(_OWORD *)&retstr->double a = *(_OWORD *)&v21.a;
    *(_OWORD *)&retstr->c = v9;
    long long v10 = *(_OWORD *)&v21.tx;
LABEL_9:
    *(_OWORD *)&retstr->tdouble x = v10;
    goto LABEL_10;
  }
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x80) == 0
    || ([(PKTiledCanvasView *)self delegate],
        id v7 = objc_claimAutoreleasedReturnValue(),
        [v7 canvasViewContentCoordinateSpace:self],
        double v8 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
    if (v6)
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->double a = 0u;
      CGAffineTransform v11 = [v6 tileContainerView];
      PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v11, self, retstr);

      [v6 drawingTransform];
      long long v12 = *(_OWORD *)&retstr->c;
      *(_OWORD *)&v17.double a = *(_OWORD *)&retstr->a;
      *(_OWORD *)&v17.c = v12;
      *(_OWORD *)&v17.tdouble x = *(_OWORD *)&retstr->tx;
      CGAffineTransformConcat(&v19, &t1, &v17);
      long long v13 = *(_OWORD *)&v19.c;
      *(_OWORD *)&retstr->double a = *(_OWORD *)&v19.a;
      *(_OWORD *)&retstr->c = v13;
      long long v10 = *(_OWORD *)&v19.tx;
    }
    else
    {
      uint64_t v14 = MEMORY[0x1E4F1DAB8];
      long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&retstr->double a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&retstr->c = v15;
      long long v10 = *(_OWORD *)(v14 + 32);
    }
    goto LABEL_9;
  }
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v8, self, retstr);

LABEL_10:
  return result;
}

- (CGAffineTransform)scaledStrokeTransform
{
  [(PKTiledCanvasView *)self strokeTransform];
  [(PKTiledCanvasView *)self layerContentsScale];
  CGFloat v6 = v5;
  [(PKTiledCanvasView *)self layerContentsScale];
  CGAffineTransformMakeScale(&v9, v6, v7);
  return CGAffineTransformConcat(retstr, &t1, &v9);
}

- (void)willBeginLiveInteractionWithTouch:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_currentStrokeTouch, a3);
  int64_t liveInteractionCount = self->_liveInteractionCount;
  self->_int64_t liveInteractionCount = liveInteractionCount + 1;
  if (liveInteractionCount)
  {
    if (self->_combineTimeoutBlock)
    {
      self->_int64_t liveInteractionCount = liveInteractionCount;
      dispatch_block_cancel(self->_combineTimeoutBlock);
      id combineTimeoutBlock = self->_combineTimeoutBlock;
      self->_id combineTimeoutBlock = 0;
    }
  }
  else
  {
    double v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)CGAffineTransform v21 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "Canvas live interaction did begin", v21, 2u);
    }

    CGAffineTransform v9 = [(PKTiledCanvasView *)self ink];
    int v10 = [v9 _supportsCombiningStrokes];

    if (v10
      && ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x40) == 0
       || ([(PKTiledCanvasView *)self delegate],
           CGAffineTransform v11 = objc_claimAutoreleasedReturnValue(),
           int v12 = [v11 canvasViewShouldCombineStrokes:self],
           v11,
           v12)))
    {
      BOOL isCombiningStrokes = 1;
      if (!self->_isCombiningStrokes)
      {
        self->_BOOL isCombiningStrokes = 1;
        self->_combiningStrokesCount = 0;
        uint64_t v14 = [MEMORY[0x1E4F29128] UUID];
        combineStrokesRenderGroupID = self->_combineStrokesRenderGroupID;
        self->_combineStrokesRenderGroupID = v14;

        __int16 v16 = [(PKTiledCanvasView *)self activeDrawing];
        CGAffineTransform v17 = [v16 uuid];
        combineStrokesDrawingID = self->_combineStrokesDrawingID;
        self->_combineStrokesDrawingID = v17;

        BOOL isCombiningStrokes = self->_isCombiningStrokes;
      }
    }
    else
    {
      BOOL isCombiningStrokes = 0;
      self->_BOOL isCombiningStrokes = 0;
    }
    CGAffineTransform v19 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setCombineStrokesAllowed:]((uint64_t)v19, isCombiningStrokes);

    CGAffineTransform v20 = [(PKTiledCanvasView *)self _drawingController];
    -[PKController didStartLiveInteraction]((uint64_t)v20);

    [(PKTiledCanvasView *)self updateHasVisibleStrokes];
  }
}

- (BOOL)wantsCanvasVisible
{
  return self->_liveInteractionCount > 0;
}

- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5
{
}

- (void)didEndLiveInteractionWithStrokes:(id)a3 drawing:(id)a4 cancelled:(BOOL)a5 forPreview:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  int64_t liveInteractionCount = self->_liveInteractionCount;
  int64_t v13 = liveInteractionCount - 1;
  self->_int64_t liveInteractionCount = liveInteractionCount - 1;
  if (self->_isCombiningStrokes && liveInteractionCount == 1)
  {
    self->_int64_t liveInteractionCount = liveInteractionCount;
    objc_initWeak(location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PKTiledCanvasView_didEndLiveInteractionWithStrokes_drawing_cancelled_forPreview___block_invoke;
    block[3] = &unk_1E64C5E98;
    objc_copyWeak(&v47, location);
    id v46 = v11;
    dispatch_block_t v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id combineTimeoutBlock = self->_combineTimeoutBlock;
    self->_id combineTimeoutBlock = v15;

    dispatch_time_t v17 = dispatch_time(0, 1000000000);
    dispatch_after(v17, MEMORY[0x1E4F14428], self->_combineTimeoutBlock);

    objc_destroyWeak(&v47);
    objc_destroyWeak(location);
    int64_t v13 = self->_liveInteractionCount;
  }
  if (v13)
  {
    if (v13 >= 1 && [v10 count] && !v7)
    {
      finishedStrokes = self->_finishedStrokes;
      if (!finishedStrokes)
      {
        CGAffineTransform v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
        CGAffineTransform v20 = self->_finishedStrokes;
        self->_finishedStrokes = v19;

        finishedStrokes = self->_finishedStrokes;
      }
      [(NSMutableArray *)finishedStrokes addObjectsFromArray:v10];
    }
  }
  else
  {
    CGAffineTransform v21 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(location[0]) = 0;
      _os_log_debug_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEBUG, "Canvas live interaction will end", (uint8_t *)location, 2u);
    }

    id v22 = (void *)MEMORY[0x1E4F1CBF0];
    if (v10 && !v7) {
      id v22 = (void *)[v10 copy];
    }
    if ([(NSMutableArray *)self->_finishedStrokes count])
    {
      [(NSMutableArray *)self->_finishedStrokes addObjectsFromArray:v22];
      uint64_t v23 = [(NSMutableArray *)self->_finishedStrokes copy];

      id v22 = (void *)v23;
      [(NSMutableArray *)self->_finishedStrokes removeAllObjects];
    }
    if ((*(_WORD *)&self->_canvasViewFlags & 0x800) != 0)
    {
      long long v24 = [(PKTiledCanvasView *)self delegate];
      [v24 _canvasView:self didFinishRenderingNewStrokes:v22 inDrawing:v11 forPreview:v6];
    }
    currentStrokeTouch = self->_currentStrokeTouch;
    self->_currentStrokeTouch = 0;

    uint64_t v26 = [(PKTiledCanvasView *)self _drawingController];
    long long v27 = (void *)v26;
    if (v26) {
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v26 + 80));
    }

    [(PKTiledCanvasView *)self updateHasVisibleStrokes];
  }
  if ([v10 count] && v7 && (*(_WORD *)&self->_canvasViewFlags & 8) != 0 && !v6)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v28 = v10;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v42;
      do
      {
        uint64_t v31 = 0;
        do
        {
          if (*(void *)v42 != v30) {
            objc_enumerationMutation(v28);
          }
          uint64_t v32 = *(void *)(*((void *)&v41 + 1) + 8 * v31);
          uint64_t v33 = [(PKTiledCanvasView *)self delegate];
          [v33 canvasView:self cancelledStroke:v32];

          ++v31;
        }
        while (v29 != v31);
        uint64_t v29 = [v28 countByEnumeratingWithState:&v41 objects:v49 count:16];
      }
      while (v29);
    }

    id v34 = [(PKTiledCanvasView *)self _drawingController];
    id v35 = -[PKController renderedStrokes](v34);
    if ([v35 count])
    {
      id v36 = [(PKTiledCanvasView *)self drawing];
      uint64_t v37 = [v36 strokes];
      BOOL v38 = [v37 count] == 0;

      if (!v38) {
        goto LABEL_41;
      }
      id v34 = [(PKTiledCanvasView *)self _drawingController];
      id v35 = [(PKTiledCanvasView *)self _drawingController];
      id v39 = -[PKController renderedStrokes](v35);
      -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v34, v39, 0);
    }
  }
LABEL_41:
  if (self->_liveInteractionCount < 0)
  {
    long long v40 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_fault_impl(&dword_1C44F8000, v40, OS_LOG_TYPE_FAULT, "Drawing count mismatch!", (uint8_t *)location, 2u);
    }

    self->_int64_t liveInteractionCount = 0;
  }
}

void __83__PKTiledCanvasView_didEndLiveInteractionWithStrokes_drawing_cancelled_forPreview___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    long long v2 = (void *)WeakRetained[64];
    WeakRetained[64] = 0;

    *((unsigned char *)WeakRetained + 528) = 0;
    [WeakRetained didEndLiveInteractionWithStrokes:MEMORY[0x1E4F1CBF0] drawing:*(void *)(a1 + 32) cancelled:0];
  }
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldBeginDrawingWithTouches:(id)a4 event:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  alternativeStrokesAnimatiouint64_t n = self->_alternativeStrokesAnimation;
  if (alternativeStrokesAnimation)
  {
    alternativeStrokesAnimation->_forceDone = 1;
    [(PKTiledCanvasView *)self _drawingDisplay:0.0];
  }
  int v12 = [(PKTiledCanvasView *)self ink];
  char v13 = [v12 _isHandwritingInk];

  return v13 ^ 1;
}

- (BOOL)drawingGestureRecognizer:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4
{
  id v5 = a4;
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x20) != 0)
  {
    BOOL v7 = [(PKTiledCanvasView *)self delegate];
    char v6 = [v7 canvasView:self shouldDelayDrawingBeganWithTouch:v5];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_inkForNewStroke
{
  if ([(PKTiledCanvasView *)self sixChannelBlendingMode]) {
    [(PKTiledCanvasView *)self sixChannelInk];
  }
  else {
  id v3 = [(PKTiledCanvasView *)self ink];
  }
  if (!v3)
  {
    uint64_t v4 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)char v6 = 0;
      _os_log_fault_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_FAULT, "Started a new stroke without an ink", v6, 2u);
    }

    id v3 = objc_opt_new();
    [(PKTiledCanvasView *)self setInk:v3];
  }

  return v3;
}

- (void)drawingBegan:(id)a3
{
  uint64_t v4 = (UITouch *)a3;
  LogTouchIfEnabled(v4, 0);
  id v5 = [(PKTiledCanvasView *)self _touchView];
  [(UITouch *)v4 PK_preciseLocationInView:v5];
  double v7 = v6;
  double v9 = v8;

  BOOL v10 = [(UITouch *)v4 type] == UITouchTypePencil;
  id v11 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", v4, &v12, 0, 0, [v11 activeInputProperties], v10, v7, v9);
}

- (void)_drawingBegan:(id)a3 inputPoint:(id *)a4 locationInView:(CGPoint)a5 forPreview:(BOOL)a6 disableDetachedRendering:(BOOL)a7 activeInputProperties:(unint64_t)a8 inputType:(int64_t)a9
{
  unint64_t v94 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  double y = a5.y;
  double x = a5.x;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v98 = a3;
  std::vector<PKInputPoint>::resize((uint64_t)&self->_rollPointsToUpdate, 0);
  [(PKTiledCanvasView *)self setupMetalViewIfNecessary];
  __int16 v16 = [(PKTiledCanvasView *)self strokeGenerator];
  [v16 setIsPreviewing:v11];

  p_canvasViewFlags = &self->_canvasViewFlags;
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 1) != 0
    && [(PKTiledCanvasView *)self enableCanvasOffsetSupport])
  {
    uint64_t v18 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setPresentsWithTransaction:]((uint64_t)v18, 1);

    objc_initWeak(location, self);
    CGAffineTransform v19 = [(PKTiledCanvasView *)self _rendererController];
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke;
    v120[3] = &unk_1E64C6410;
    objc_copyWeak(&v121, location);
    -[PKMetalRendererController setCanvasOffsetPresentationOffsetBlock:]((uint64_t)v19, v120);

    objc_destroyWeak(&v121);
    objc_destroyWeak(location);
  }
  else
  {
    CGAffineTransform v20 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setPresentsWithTransaction:]((uint64_t)v20, 0);

    CGAffineTransform v21 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController setCanvasOffsetPresentationOffsetBlock:]((uint64_t)v21, 0);
  }
  id v22 = [(PKTiledCanvasView *)self metalView];
  uint64_t v23 = -[PKMetalView metalLayer](v22);
  [(id)v23 setAllowsDisplayCompositing:!v10];

  long long v24 = [(PKTiledCanvasView *)self shapeDrawingController];
  LOBYTE(v23) = v24 == 0;

  if ((v23 & 1) == 0)
  {
    BOOL v25 = [(PKTiledCanvasView *)self _isShapeRecognitionEnabled];
    uint64_t v26 = [(PKTiledCanvasView *)self shapeDrawingController];
    if (v26) {
      v26[193] = v25 && !v11;
    }
  }
  [(PKTiledCanvasView *)self cancelPurgeResourcesBlock];
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x200) != 0)
  {
    long long v27 = [(PKTiledCanvasView *)self delegate];
    long long v28 = *(_OWORD *)&a4->var9;
    v119[4] = *(_OWORD *)&a4->var7;
    v119[5] = v28;
    long long v29 = *(_OWORD *)&a4->var13;
    v119[6] = *(_OWORD *)&a4->var11;
    v119[7] = v29;
    long long v30 = *(_OWORD *)&a4->var1;
    v119[0] = a4->var0;
    v119[1] = v30;
    long long v31 = *(_OWORD *)&a4->var5;
    v119[2] = *(_OWORD *)&a4->var3;
    v119[3] = v31;
    [v27 _canvasViewWillBeginDrawing:self startPoint:v119 forPreview:v11];
    goto LABEL_14;
  }
  if ((*(_WORD *)p_canvasViewFlags & 0x40) != 0 && !v11)
  {
    long long v27 = [(PKTiledCanvasView *)self delegate];
    [v27 _canvasViewWillBeginDrawing:self];
LABEL_14:
  }
  if (a9 == 1)
  {
    uint64_t v32 = +[PKPencilDevice activePencil];
    [v32 tagAsUsed];
  }
  if (!v98 || ![(PKTiledCanvasView *)self eraserBegan:v98])
  {
    uint64_t v33 = [(PKTiledCanvasView *)self ink];
    if ([v33 _isEraserInk]) {
      uint64_t v34 = 1;
    }
    else {
      uint64_t v34 = [(PKTiledCanvasView *)self hasSnapshot] ^ 1;
    }
    [(PKTiledCanvasView *)self _updateMetalLayerOpacityForceNonOpaqueSixChannel:v34];

    if ((*(_WORD *)p_canvasViewFlags & 2) != 0)
    {
      id v35 = [(PKTiledCanvasView *)self delegate];
      objc_msgSend(v35, "canvasViewWillBeginNewStroke:withTouch:location:", self, v98, x, y);
    }
    if (v98)
    {
      id v36 = [(PKTiledCanvasView *)self _touchView];
      objc_msgSend(v98, "PK_preciseLocationInView:", v36);
      double x = v37;
      double y = v38;

      -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", x, y);
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v98, 0, v95);
      long long v39 = v116;
      *(_OWORD *)&a4->var7 = v115;
      *(_OWORD *)&a4->var9 = v39;
      long long v40 = v118;
      *(_OWORD *)&a4->var11 = v117;
      *(_OWORD *)&a4->var13 = v40;
      long long v41 = v112;
      a4->var0 = *($047367E7237D93BB26E796C35D3A0ACE *)location;
      *(_OWORD *)&a4->var1 = v41;
      long long v42 = v114;
      *(_OWORD *)&a4->var3 = v113;
      *(_OWORD *)&a4->var5 = v42;
    }
    long long v112 = 0u;
    long long v113 = 0u;
    *(_OWORD *)id location = 0u;
    [(PKTiledCanvasView *)self scaledStrokeTransform];
    long long v108 = *(_OWORD *)location;
    long long v109 = v112;
    long long v110 = v113;
    long long v43 = [(PKTiledCanvasView *)self _rendererController];
    v107[0] = v108;
    v107[1] = v109;
    v107[2] = v110;
    -[PKMetalRendererController setStrokeTransform:]((uint64_t)v43, v107);

    self->_inputScale = sqrt(*(double *)&location[1] * *(double *)&location[1] + *(double *)location
                                                                               * *(double *)location);
    kdebug_trace();
    kdebug_trace();
    long long v44 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      long long v45 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
      *(_DWORD *)buf = 138412290;
      long long v123 = v45;
      _os_log_impl(&dword_1C44F8000, v44, OS_LOG_TYPE_DEFAULT, "Began drawing: %@", buf, 0xCu);
    }
    [(PKTiledCanvasView *)self willBeginLiveInteractionWithTouch:v98];
    [(PKTiledCanvasView *)self setIsDrawing:1 forPreview:v11];
    uint64_t v46 = [MEMORY[0x1E4F28F80] processInfo];
    [(id)v46 systemUptime];
    -[PKTiledCanvasView setDrawingStartTimestamp:](self, "setDrawingStartTimestamp:");

    [(PKTiledCanvasView *)self _inputScale];
    double v48 = v47;
    long long v49 = [(PKTiledCanvasView *)self activeDrawing];
    v96 = (void *)[v49 newStroke];

    uint64_t v50 = [(PKTiledCanvasView *)self _inkForNewStroke];
    [v96 _setInk:v50];

    if ([(PKTiledCanvasView *)self generateLiveDrawing])
    {
      objc_initWeak((id *)buf, self);
      uint64_t v46 = [(PKTiledCanvasView *)self _drawingController];
      v105[0] = MEMORY[0x1E4F143A8];
      v105[1] = 3221225472;
      v105[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_138;
      v105[3] = &unk_1E64C6438;
      objc_copyWeak(&v106, (id *)buf);
      -[PKController addLiveStrokeEarly:completionBlock:](v46, v96, v105);

      objc_destroyWeak(&v106);
      objc_destroyWeak((id *)buf);
    }
    if (self->_isCombiningStrokes) {
      [v96 _setRenderGroupID:self->_combineStrokesRenderGroupID];
    }
    long long v51 = [(PKTiledCanvasView *)self ink];
    if ([v51 _isStrokeGeneratingInk])
    {
      long long v52 = [(PKTiledCanvasView *)self ink];
      if (([v52 _isHandwritingInk] & 1) != 0
        || ([(PKTiledCanvasView *)self shapeDrawingController],
            (long long v53 = (unsigned char *)objc_claimAutoreleasedReturnValue()) == 0))
      {
      }
      else
      {
        if (v53[192])
        {
        }
        else
        {
          BOOL v54 = v53[193] == 0;

          if (v54) {
            goto LABEL_41;
          }
        }
        uint64_t v55 = [(PKTiledCanvasView *)self _touchView];
        uint64_t v46 = [(PKTiledCanvasView *)self _touchView];
        v56 = [(id)v46 window];
        objc_msgSend(v55, "convertPoint:toView:", v56, x, y);
        CGFloat v58 = v57;
        CGFloat v60 = v59;

        long long v51 = [(PKTiledCanvasView *)self shapeDrawingController];
        [(PKShapeDrawingController *)(uint64_t)v51 beginStrokeAtPoint:v60];
      }
    }

LABEL_41:
    if (!a9)
    {
      CGFloat v61 = [(PKTiledCanvasView *)self traitCollection];
      uint64_t v46 = [v61 forceTouchCapability] == 1;

      if (v46) {
        a4->var1 = -1.0;
      }
    }
    if (!v11)
    {
      char v62 = 1;
    }
    else if (os_variant_has_internal_diagnostics())
    {
      if (qword_1EA3C6B40 != -1) {
        dispatch_once(&qword_1EA3C6B40, &__block_literal_global_850);
      }
      if (byte_1EA3C6B31) {
        char v62 = 1;
      }
      else {
        char v62 = !v11;
      }
    }
    else
    {
      char v62 = 0;
    }
    CGFloat v63 = [(PKTiledCanvasView *)self powerSavingController];
    BOOL v64 = v63 == 0;

    if (v64)
    {
      uint64_t v65 = objc_alloc_init(PKDrawingPowerSavingController);
      [(PKTiledCanvasView *)self setPowerSavingController:v65];
    }
    uint64_t v66 = [(PKTiledCanvasView *)self powerSavingController];
    if (v66) {
      v66[104] = a9 == 1;
    }

    v67 = [v96 ink];
    v68 = [v67 identifier];
    char v69 = [v68 isEqual:@"com.apple.ink.marker"];
    if (v69)
    {
      char v70 = 1;
    }
    else
    {
      double v9 = [v96 ink];
      uint64_t v46 = [v9 identifier];
      char v70 = [(id)v46 isEqual:@"com.apple.ink.eraser"];
    }
    v71 = [(PKTiledCanvasView *)self powerSavingController];
    if (v71) {
      v71[105] = v70;
    }

    if ((v69 & 1) == 0)
    {
    }
    uint64_t v72 = [(PKTiledCanvasView *)self powerSavingController];
    if (v72)
    {
      *(unsigned char *)(v72 + 72) = 0;
      *(double *)(v72 + 32) = x;
      *(double *)(v72 + 40) = y;
      *(void *)(v72 + 48) = 0;
      *(void *)(v72 + 56) = 0;
      *(void *)(v72 + 16) = *(void *)(v72 + 8);
    }

    [(PKTiledCanvasView *)self _postBeganSketchingAXAnnouncement];
    v73 = [(PKTiledCanvasView *)self _rendererController];
    long long v74 = *(_OWORD *)&a4->var9;
    v104[4] = *(_OWORD *)&a4->var7;
    v104[5] = v74;
    long long v75 = *(_OWORD *)&a4->var13;
    v104[6] = *(_OWORD *)&a4->var11;
    v104[7] = v75;
    long long v76 = *(_OWORD *)&a4->var1;
    v104[0] = (__int128)a4->var0;
    v104[1] = v76;
    long long v77 = *(_OWORD *)&a4->var5;
    v104[2] = *(_OWORD *)&a4->var3;
    v104[3] = v77;
    -[PKMetalRendererController addInputPoint:]((uint64_t)v73, v104);

    uint64_t v78 = +[PKPencilDevice activePencil];
    [v78 baseRollAngle];
    uint64_t v80 = v79;
    v81 = [(PKTiledCanvasView *)self strokeGenerator];
    uint64_t v82 = v81;
    if (v81)
    {
      os_unfair_lock_lock(v81 + 76);
      *(void *)&v82[90]._os_unfair_lock_opaque = v80;
      os_unfair_lock_unlock(v82 + 76);
    }

    uint64_t v83 = [(PKTiledCanvasView *)self strokeGenerator];
    v100[0] = MEMORY[0x1E4F143A8];
    v100[1] = 3221225472;
    v100[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_3;
    v100[3] = &unk_1E64C6460;
    v100[4] = self;
    id v84 = v96;
    id v101 = v84;
    char v102 = v62;
    BOOL v103 = v11;
    [v83 drawingBeganWithStroke:v84 inputType:a9 activeInputProperties:v95 inputScale:v100 start:v48];

    v85 = [(PKTiledCanvasView *)self strokeGenerator];
    long long v86 = *(_OWORD *)&a4->var9;
    v99[4] = *(_OWORD *)&a4->var7;
    v99[5] = v86;
    long long v87 = *(_OWORD *)&a4->var13;
    v99[6] = *(_OWORD *)&a4->var11;
    v99[7] = v87;
    long long v88 = *(_OWORD *)&a4->var1;
    v99[0] = a4->var0;
    v99[1] = v88;
    long long v89 = *(_OWORD *)&a4->var5;
    v99[2] = *(_OWORD *)&a4->var3;
    v99[3] = v89;
    [v85 addPoint:v99];

    v90 = [(PKTiledCanvasView *)self metalView];
    -[PKMetalView setDoubleBuffered:]((uint64_t)v90, 1);

    self->_numSkippedDoubleBufferedFrames = 0;
    v91 = [(PKTiledCanvasView *)self rulerController];
    LODWORD(v85) = -[PKRulerController rulerSelected]((uint64_t)v91);

    if (v85)
    {
      uint64_t v92 = [(PKTiledCanvasView *)self rulerController];
      double v93 = [(PKTiledCanvasView *)self _touchView];
      [(PKRulerController *)(uint64_t)v92 drawingBegan:x coordinateSystem:y];
    }
    kdebug_trace();
  }
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    double v6 = [WeakRetained delegate];
    objc_msgSend(v6, "canvasView:didPresentWithCanvasOffset:", v7, a2, a3);

    id WeakRetained = v7;
  }
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_138(uint64_t a1, void *a2)
{
  id v3 = (void *)[a2 copy];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_2;
  v5[3] = &unk_1E64C5E98;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_2(uint64_t a1)
{
  long long v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained drawing];
  id v4 = [v3 uuid];
  id v5 = [*(id *)(a1 + 32) uuid];
  int v6 = [v4 isEqual:v5];

  if (v6)
  {
    id v10 = objc_loadWeakRetained(v2);
    id v7 = [v10 drawing];
    [v7 mergeWithDrawing:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = objc_loadWeakRetained(v2);
    [v10 setDrawing:v8];
  }
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _drawingController];
  id v3 = (void *)v2;
  if (v2) {
    id v4 = *(void **)(v2 + 64);
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  -[PKMetalRendererController drawingBeganWithStroke:forPreview:]((uint64_t)v5, *(void **)(a1 + 40), *(unsigned char *)(a1 + 48) == 0);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_4;
  block[3] = &unk_1E64C6640;
  int v6 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  char v9 = *(unsigned char *)(a1 + 49);
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __129__PKTiledCanvasView__drawingBegan_inputPoint_locationInView_forPreview_disableDetachedRendering_activeInputProperties_inputType___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _startDisplayLinkShouldPause:0];
  if (!*(unsigned char *)(a1 + 48))
  {
    uint64_t v2 = *(_WORD **)(a1 + 32);
    if ((v2[224] & 4) != 0)
    {
      id v3 = [v2 delegate];
      [v3 canvasView:*(void *)(a1 + 32) beganStroke:*(void *)(a1 + 40)];
    }
  }
}

- (void)_notifyEraserMoved:(id)a3 location:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v19 = a3;
  if ((*(_WORD *)&self->_canvasViewFlags & 0x4000) != 0)
  {
    uint64_t v7 = [(PKTiledCanvasView *)self selectionController];
    id v8 = (void *)v7;
    if (v7) {
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 120));
    }
    else {
      id WeakRetained = 0;
    }
    id v10 = [WeakRetained liveAttachment];

    if (v10)
    {
      if (v19)
      {
        BOOL v11 = [(PKTiledCanvasView *)self _touchView];
        objc_msgSend(v19, "PK_preciseLocationInView:", v11);
        double v13 = v12;
        double v15 = v14;

        -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v13, v15);
        double x = v16;
        double y = v17;
      }
      uint64_t v18 = [(PKTiledCanvasView *)self delegate];
      objc_msgSend(v18, "_canvasView:eraserMoved:attachment:", self, v10, x, y);
    }
  }
}

- (void)drawingMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  id v196 = a3;
  id v194 = a4;
  int v6 = [(PKTiledCanvasView *)self ink];
  char v7 = [v6 _isEraserInk];

  char v8 = v7 ^ 1;
  if (!v196) {
    char v8 = 1;
  }
  if ((v8 & 1) == 0) {
    -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", v196, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  }
  if (self->_isErasingObjects)
  {
    [(PKTiledCanvasView *)self eraserMoved:v196];
    goto LABEL_126;
  }
  char v9 = [(PKTiledCanvasView *)self strokeGenerator];
  uint64_t v10 = [v9 inputType];

  if (v10 == 1)
  {
    BOOL v11 = +[PKPencilDevice activePencil];
    [v11 tagAsUsed];
  }
  double v12 = [(PKTiledCanvasView *)self rulerController];
  char v13 = -[PKRulerController rulerSelected]((uint64_t)v12);

  char v14 = v13 ^ 1;
  if (!v196) {
    char v14 = 1;
  }
  if ((v14 & 1) == 0)
  {
    double v15 = [(PKTiledCanvasView *)self _touchView];
    objc_msgSend(v196, "PK_preciseLocationInView:", v15);
    double v17 = v16;
    double v19 = v18;

    CGAffineTransform v20 = [(PKTiledCanvasView *)self rulerController];
    CGAffineTransform v21 = [(PKTiledCanvasView *)self _touchView];
    [(PKRulerController *)(uint64_t)v20 drawingMoved:v17 coordinateSystem:v19];
  }
  if (qword_1EA3C6B48 != -1) {
    dispatch_once(&qword_1EA3C6B48, &__block_literal_global_855);
  }
  if (byte_1EA3C6B32)
  {
    long long v224 = 0u;
    long long v225 = 0u;
    long long v222 = 0u;
    long long v223 = 0u;
    id v22 = [v194 coalescedTouchesForTouch:v196];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v222 objects:v228 count:16];
    if (!v23) {
      goto LABEL_125;
    }
    uint64_t v24 = *(void *)v223;
    while (1)
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v223 != v24) {
          objc_enumerationMutation(v22);
        }
        uint64_t v26 = *(void **)(*((void *)&v222 + 1) + 8 * v25);
        long long v27 = [v26 estimationUpdateIndex];
        if (v27)
        {
          BOOL v28 = ([v26 estimatedPropertiesExpectingUpdates] & 0x10) == 0;

          if (!v28)
          {
            long long v29 = [(PKTiledCanvasView *)self _touchView];
            objc_msgSend(v26, "PK_preciseLocationInView:", v29);
            double v31 = v30;
            double v33 = v32;

            uint64_t v34 = [(PKTiledCanvasView *)self powerSavingController];
            if (v34)
            {
              double v35 = v34[6] + sqrt((v34[5] - v33) * (v34[5] - v33) + (v34[4] - v31) * (v34[4] - v31));
              v34[5] = v33;
              v34[6] = v35;
              v34[4] = v31;
            }

            -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v31, v33);
            double v37 = v36;
            double v39 = v38;
            long long v220 = 0u;
            long long v221 = 0u;
            long long v218 = 0u;
            long long v219 = 0u;
            long long v216 = 0u;
            long long v217 = 0u;
            long long v214 = 0u;
            long long v215 = 0u;
            long long v40 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
            +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v26, 0, [v40 activeInputProperties], v37, v39);

            p_rollPointsToUpdate = &self->_rollPointsToUpdate;
            end = self->_rollPointsToUpdate.__end_;
            value = self->_rollPointsToUpdate.__end_cap_.__value_;
            if (end >= value)
            {
              uint64_t v51 = (end - p_rollPointsToUpdate->__begin_) >> 7;
              unint64_t v52 = v51 + 1;
              if ((unint64_t)(v51 + 1) >> 57) {
                std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
              }
              uint64_t v53 = value - p_rollPointsToUpdate->__begin_;
              if (v53 >> 6 > v52) {
                unint64_t v52 = v53 >> 6;
              }
              if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFF80) {
                unint64_t v54 = 0x1FFFFFFFFFFFFFFLL;
              }
              else {
                unint64_t v54 = v52;
              }
              if (v54) {
                uint64_t v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&self->_rollPointsToUpdate.__end_cap_, v54);
              }
              else {
                uint64_t v55 = 0;
              }
              v56 = &v55[128 * v51];
              long long v57 = v214;
              long long v58 = v215;
              long long v59 = v217;
              *((_OWORD *)v56 + 2) = v216;
              *((_OWORD *)v56 + 3) = v59;
              *(_OWORD *)v56 = v57;
              *((_OWORD *)v56 + 1) = v58;
              long long v60 = v218;
              long long v61 = v219;
              long long v62 = v221;
              *((_OWORD *)v56 + 6) = v220;
              *((_OWORD *)v56 + 7) = v62;
              *((_OWORD *)v56 + 4) = v60;
              *((_OWORD *)v56 + 5) = v61;
              begiuint64_t n = p_rollPointsToUpdate->__begin_;
              CGFloat v63 = self->_rollPointsToUpdate.__end_;
              uint64_t v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v56;
              if (v63 != p_rollPointsToUpdate->__begin_)
              {
                do
                {
                  long long v66 = *((_OWORD *)v63 - 8);
                  long long v67 = *((_OWORD *)v63 - 7);
                  long long v68 = *((_OWORD *)v63 - 5);
                  *((_OWORD *)v65 - 6) = *((_OWORD *)v63 - 6);
                  *((_OWORD *)v65 - 5) = v68;
                  *((_OWORD *)v65 - 8) = v66;
                  *((_OWORD *)v65 - 7) = v67;
                  long long v69 = *((_OWORD *)v63 - 4);
                  long long v70 = *((_OWORD *)v63 - 3);
                  long long v71 = *((_OWORD *)v63 - 1);
                  *((_OWORD *)v65 - 2) = *((_OWORD *)v63 - 2);
                  *((_OWORD *)v65 - 1) = v71;
                  *((_OWORD *)v65 - 4) = v69;
                  *((_OWORD *)v65 - 3) = v70;
                  uint64_t v65 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v65 - 128);
                  CGFloat v63 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)v63 - 128);
                }
                while (v63 != begin);
                CGFloat v63 = p_rollPointsToUpdate->__begin_;
              }
              uint64_t v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v56 + 128);
              p_rollPointsToUpdate->__begin_ = v65;
              self->_rollPointsToUpdate.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)(v56 + 128);
              self->_rollPointsToUpdate.__end_cap_.__value_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v55[128 * v54];
              if (v63) {
                operator delete(v63);
              }
            }
            else
            {
              long long v44 = v214;
              long long v45 = v215;
              long long v46 = v217;
              *((_OWORD *)end + 2) = v216;
              *((_OWORD *)end + 3) = v46;
              *(_OWORD *)end = v44;
              *((_OWORD *)end + 1) = v45;
              long long v47 = v218;
              long long v48 = v219;
              long long v49 = v221;
              *((_OWORD *)end + 6) = v220;
              *((_OWORD *)end + 7) = v49;
              *((_OWORD *)end + 4) = v47;
              *((_OWORD *)end + 5) = v48;
              uint64_t v50 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)((char *)end + 128);
            }
            self->_rollPointsToUpdate.__end_ = v50;
            uint64_t v72 = [(PKTiledCanvasView *)self shapeDrawingController];
            if (v72)
            {
              BOOL v73 = v72[2] == v72[1];

              if (v73) {
                goto LABEL_45;
              }
              long long v74 = [(PKTiledCanvasView *)self window];
              [v196 locationInView:v74];
              CGFloat v76 = v75;
              CGFloat v78 = v77;

              uint64_t v79 = [(PKTiledCanvasView *)self shapeDrawingController];
              v213[4] = v218;
              v213[5] = v219;
              v213[6] = v220;
              v213[7] = v221;
              v213[0] = v214;
              v213[1] = v215;
              v213[2] = v216;
              v213[3] = v217;
              [(PKShapeDrawingController *)(uint64_t)v79 addStrokePoint:v76 inputPoint:v78];
            }
            else
            {
              uint64_t v79 = 0;
            }
          }
        }
LABEL_45:
        ++v25;
      }
      while (v25 != v23);
      uint64_t v80 = [v22 countByEnumeratingWithState:&v222 objects:v228 count:16];
      uint64_t v23 = v80;
      if (!v80) {
        goto LABEL_125;
      }
    }
  }
  [v196 timestamp];
  kdebug_trace();
  v81 = [v194 coalescedTouchesForTouch:v196];
  unint64_t v82 = [v81 count];

  if (self->_maxNumPredictionPoints && ![(PKTiledCanvasView *)self predictionDisabled])
  {
    uint64_t v83 = [v194 predictedTouchesForTouch:v196];
    id v84 = v83;
    if (self->_maxNumPredictionPoints < 1
      || (unint64_t)[v83 count] <= self->_maxNumPredictionPoints)
    {
      long long v86 = v84;
    }
    else
    {
      uint64_t v85 = [v84 subarrayWithRange:0];

      long long v86 = (void *)v85;
    }
    v193 = v86;
    v82 += [v86 count];
  }
  else
  {
    v193 = 0;
  }
  long long v87 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v82];
  __p = 0;
  v211 = 0;
  unint64_t v212 = 0;
  std::vector<PKInputPoint>::reserve(&__p, v82);
  long long v208 = 0u;
  long long v209 = 0u;
  long long v206 = 0u;
  long long v207 = 0u;
  long long v88 = [v194 coalescedTouchesForTouch:v196];
  uint64_t v89 = [v88 countByEnumeratingWithState:&v206 objects:v227 count:16];
  if (!v89) {
    goto LABEL_91;
  }
  uint64_t v90 = *(void *)v207;
  uint64_t v195 = 0;
  do
  {
    uint64_t v91 = 0;
    v195 += v89;
    do
    {
      if (*(void *)v207 != v90) {
        objc_enumerationMutation(v88);
      }
      uint64_t v92 = *(UITouch **)(*((void *)&v206 + 1) + 8 * v91);
      LogTouchIfEnabled(v92, 0);
      double v93 = [(PKTiledCanvasView *)self _touchView];
      [(UITouch *)v92 PK_preciseLocationInView:v93];
      double v95 = v94;
      double v97 = v96;

      id v98 = [(PKTiledCanvasView *)self powerSavingController];
      if (v98)
      {
        double v99 = v98[6] + sqrt((v98[5] - v97) * (v98[5] - v97) + (v98[4] - v95) * (v98[4] - v95));
        v98[5] = v97;
        v98[6] = v99;
        v98[4] = v95;
      }

      -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v95, v97);
      double v101 = v100;
      double v103 = v102;
      long long v220 = 0u;
      long long v221 = 0u;
      long long v218 = 0u;
      long long v219 = 0u;
      long long v216 = 0u;
      long long v217 = 0u;
      long long v214 = 0u;
      long long v215 = 0u;
      BOOL v104 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
      +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v92, 0, [v104 activeInputProperties], v101, v103);

      v105 = v211;
      if ((unint64_t)v211 >= v212)
      {
        long long v113 = __p;
        uint64_t v114 = ((char *)v211 - (unsigned char *)__p) >> 7;
        unint64_t v115 = v114 + 1;
        if ((unint64_t)(v114 + 1) >> 57) {
          std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
        }
        uint64_t v116 = v212 - (void)__p;
        if ((uint64_t)(v212 - (void)__p) >> 6 > v115) {
          unint64_t v115 = v116 >> 6;
        }
        if ((unint64_t)v116 >= 0x7FFFFFFFFFFFFF80) {
          unint64_t v117 = 0x1FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v117 = v115;
        }
        if (v117)
        {
          long long v118 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v212, v117);
          long long v113 = __p;
          v105 = v211;
        }
        else
        {
          long long v118 = 0;
        }
        long long v119 = &v118[128 * v114];
        long long v120 = v214;
        long long v121 = v215;
        long long v122 = v217;
        *((_OWORD *)v119 + 2) = v216;
        *((_OWORD *)v119 + 3) = v122;
        *(_OWORD *)long long v119 = v120;
        *((_OWORD *)v119 + 1) = v121;
        long long v123 = v218;
        long long v124 = v219;
        long long v125 = v221;
        *((_OWORD *)v119 + 6) = v220;
        *((_OWORD *)v119 + 7) = v125;
        *((_OWORD *)v119 + 4) = v123;
        *((_OWORD *)v119 + 5) = v124;
        if (v105 == v113)
        {
          long long v133 = &v118[128 * v114];
        }
        else
        {
          long long v126 = &v118[128 * v114];
          do
          {
            long long v127 = *(v105 - 8);
            long long v128 = *(v105 - 7);
            long long v129 = *(v105 - 5);
            *((_OWORD *)v126 - 6) = *(v105 - 6);
            *((_OWORD *)v126 - 5) = v129;
            *((_OWORD *)v126 - 8) = v127;
            *((_OWORD *)v126 - 7) = v128;
            long long v130 = *(v105 - 4);
            long long v131 = *(v105 - 3);
            long long v132 = *(v105 - 1);
            long long v133 = v126 - 128;
            *((_OWORD *)v126 - 2) = *(v105 - 2);
            *((_OWORD *)v126 - 1) = v132;
            *((_OWORD *)v126 - 4) = v130;
            *((_OWORD *)v126 - 3) = v131;
            v105 -= 8;
            v126 -= 128;
          }
          while (v105 != v113);
        }
        long long v112 = v119 + 128;
        __p = v133;
        v211 = v119 + 128;
        unint64_t v212 = (unint64_t)&v118[128 * v117];
        if (v113) {
          operator delete(v113);
        }
      }
      else
      {
        long long v106 = v214;
        long long v107 = v215;
        long long v108 = v217;
        v211[2] = v216;
        v105[3] = v108;
        _OWORD *v105 = v106;
        v105[1] = v107;
        long long v109 = v218;
        long long v110 = v219;
        long long v111 = v221;
        v105[6] = v220;
        v105[7] = v111;
        void v105[4] = v109;
        v105[5] = v110;
        long long v112 = v105 + 8;
      }
      v211 = v112;
      [v87 addObject:v92];
      long long v134 = [(PKTiledCanvasView *)self shapeDrawingController];
      if (v134)
      {
        BOOL v135 = v134[2] == v134[1];

        if (v135) {
          goto LABEL_87;
        }
        long long v136 = [(PKTiledCanvasView *)self window];
        [v196 locationInView:v136];
        CGFloat v138 = v137;
        CGFloat v140 = v139;

        long long v141 = [(PKTiledCanvasView *)self shapeDrawingController];
        v205[4] = v218;
        v205[5] = v219;
        v205[6] = v220;
        v205[7] = v221;
        v205[0] = v214;
        v205[1] = v215;
        v205[2] = v216;
        v205[3] = v217;
        [(PKShapeDrawingController *)(uint64_t)v141 addStrokePoint:v138 inputPoint:v140];
      }
      else
      {
        long long v141 = 0;
      }

LABEL_87:
      ++v91;
    }
    while (v91 != v89);
    uint64_t v142 = [v88 countByEnumeratingWithState:&v206 objects:v227 count:16];
    uint64_t v89 = v142;
  }
  while (v142);
LABEL_91:

  long long v203 = 0u;
  long long v204 = 0u;
  long long v201 = 0u;
  long long v202 = 0u;
  id v22 = v193;
  uint64_t v143 = [v22 countByEnumeratingWithState:&v201 objects:v226 count:16];
  if (v143)
  {
    uint64_t v144 = *(void *)v202;
    do
    {
      for (uint64_t i = 0; i != v143; ++i)
      {
        if (*(void *)v202 != v144) {
          objc_enumerationMutation(v22);
        }
        v146 = *(void **)(*((void *)&v201 + 1) + 8 * i);
        v147 = [(PKTiledCanvasView *)self _touchView];
        objc_msgSend(v146, "PK_preciseLocationInView:", v147);
        double v149 = v148;
        double v151 = v150;

        -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v149, v151);
        double v153 = v152;
        double v155 = v154;
        long long v220 = 0u;
        long long v221 = 0u;
        long long v218 = 0u;
        long long v219 = 0u;
        long long v216 = 0u;
        long long v217 = 0u;
        long long v214 = 0u;
        long long v215 = 0u;
        v156 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
        +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v146, 1, [v156 activeInputProperties], v153, v155);

        v157 = v211;
        if ((unint64_t)v211 >= v212)
        {
          v165 = __p;
          uint64_t v166 = ((char *)v211 - (unsigned char *)__p) >> 7;
          unint64_t v167 = v166 + 1;
          if ((unint64_t)(v166 + 1) >> 57) {
            std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
          }
          uint64_t v168 = v212 - (void)__p;
          if ((uint64_t)(v212 - (void)__p) >> 6 > v167) {
            unint64_t v167 = v168 >> 6;
          }
          if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFF80) {
            unint64_t v169 = 0x1FFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v169 = v167;
          }
          if (v169)
          {
            v170 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<PKInputPoint>>((uint64_t)&v212, v169);
            v165 = __p;
            v157 = v211;
          }
          else
          {
            v170 = 0;
          }
          v171 = &v170[128 * v166];
          long long v172 = v214;
          long long v173 = v215;
          long long v174 = v217;
          *((_OWORD *)v171 + 2) = v216;
          *((_OWORD *)v171 + 3) = v174;
          *(_OWORD *)v171 = v172;
          *((_OWORD *)v171 + 1) = v173;
          long long v175 = v218;
          long long v176 = v219;
          long long v177 = v221;
          *((_OWORD *)v171 + 6) = v220;
          *((_OWORD *)v171 + 7) = v177;
          *((_OWORD *)v171 + 4) = v175;
          *((_OWORD *)v171 + 5) = v176;
          if (v157 == v165)
          {
            v185 = &v170[128 * v166];
          }
          else
          {
            v178 = &v170[128 * v166];
            do
            {
              long long v179 = *(v157 - 8);
              long long v180 = *(v157 - 7);
              long long v181 = *(v157 - 5);
              *((_OWORD *)v178 - 6) = *(v157 - 6);
              *((_OWORD *)v178 - 5) = v181;
              *((_OWORD *)v178 - 8) = v179;
              *((_OWORD *)v178 - 7) = v180;
              long long v182 = *(v157 - 4);
              long long v183 = *(v157 - 3);
              long long v184 = *(v157 - 1);
              v185 = v178 - 128;
              *((_OWORD *)v178 - 2) = *(v157 - 2);
              *((_OWORD *)v178 - 1) = v184;
              *((_OWORD *)v178 - 4) = v182;
              *((_OWORD *)v178 - 3) = v183;
              v157 -= 8;
              v178 -= 128;
            }
            while (v157 != v165);
          }
          v164 = v171 + 128;
          __p = v185;
          v211 = v171 + 128;
          unint64_t v212 = (unint64_t)&v170[128 * v169];
          if (v165) {
            operator delete(v165);
          }
        }
        else
        {
          long long v158 = v214;
          long long v159 = v215;
          long long v160 = v217;
          v211[2] = v216;
          v157[3] = v160;
          _OWORD *v157 = v158;
          v157[1] = v159;
          long long v161 = v218;
          long long v162 = v219;
          long long v163 = v221;
          v157[6] = v220;
          v157[7] = v163;
          v157[4] = v161;
          v157[5] = v162;
          v164 = v157 + 8;
        }
        v211 = v164;
        [v87 addObject:v146];
      }
      uint64_t v143 = [v22 countByEnumeratingWithState:&v201 objects:v226 count:16];
    }
    while (v143);
  }

  v186 = [(PKTiledCanvasView *)self strokeGenerator];
  v198 = 0;
  v199 = 0;
  uint64_t v200 = 0;
  std::vector<PKInputPoint>::__init_with_size[abi:ne180100]<PKInputPoint*,PKInputPoint*>(&v198, __p, (uint64_t)v211, ((char *)v211 - (unsigned char *)__p) >> 7);
  [v186 addPoints:&v198];
  if (v198)
  {
    v199 = v198;
    operator delete(v198);
  }

  if (v211 != __p)
  {
    v187 = [(PKTiledCanvasView *)self _rendererController];
    long long v188 = *(v211 - 3);
    v197[4] = *(v211 - 4);
    v197[5] = v188;
    long long v189 = *(v211 - 1);
    v197[6] = *(v211 - 2);
    v197[7] = v189;
    long long v190 = *(v211 - 7);
    v197[0] = *(v211 - 8);
    v197[1] = v190;
    long long v191 = *(v211 - 5);
    v197[2] = *(v211 - 6);
    v197[3] = v191;
    -[PKMetalRendererController addInputPoint:]((uint64_t)v187, v197);
  }
  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
  {
    v192 = [(PKTiledCanvasView *)self delegate];
    [v192 canvasViewDrawingMoved:self withTouch:v196];
  }
  [v196 timestamp];
  [v22 count];
  kdebug_trace();
  if (__p)
  {
    v211 = __p;
    operator delete(__p);
  }

LABEL_125:
LABEL_126:
}

- (void)drawingEstimatedPropertiesUpdated:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  kdebug_trace();
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v4 = v40;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v63;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(v4);
        }
        char v8 = *(UITouch **)(*((void *)&v62 + 1) + 8 * v7);
        if (v8 == self->_currentStrokeTouch)
        {
          LogTouchIfEnabled(*(UITouch **)(*((void *)&v62 + 1) + 8 * v7), 1);
          char v9 = [(PKTiledCanvasView *)self _touchView];
          [(UITouch *)v8 PK_preciseLocationInView:v9];
          double v11 = v10;
          double v13 = v12;

          -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v11, v13);
          double v15 = v14;
          double v17 = v16;
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          double v18 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
          +[PKInputPointUtility drawingInputPoint:view:touch:predicted:activeInputProperties:](PKInputPointUtility, "drawingInputPoint:view:touch:predicted:activeInputProperties:", self, v8, 0, [v18 activeInputProperties], v15, v17);

          if (qword_1EA3C6B48 != -1) {
            dispatch_once(&qword_1EA3C6B48, &__block_literal_global_855);
          }
          if (byte_1EA3C6B32)
          {
            CGAffineTransform v20 = [(UITouch *)v8 estimationUpdateIndex];
            if (v20)
            {
              BOOL v21 = ([(UITouch *)v8 estimatedProperties] & 0x10) == 0;

              if (v21)
              {
                id v22 = [(UITouch *)v8 estimationUpdateIndex];
                uint64_t v23 = [v22 integerValue];

                p_rollPointsToUpdate = &self->_rollPointsToUpdate;
                begiuint64_t n = self->_rollPointsToUpdate.__begin_;
                uint64_t v26 = self->_rollPointsToUpdate.__end_ - begin;
                if (v26 >= 1)
                {
                  uint64_t v27 = 0;
                  uint64_t v28 = (unint64_t)v26 >> 7;
                  if (v28 <= 1) {
                    uint64_t v28 = 1;
                  }
                  while (1)
                  {
                    long long v29 = (long long *)((char *)begin + v27);
                    if (*(void *)((char *)begin + v27 + 80) == v23) {
                      break;
                    }
                    v27 += 128;
                    if (!--v28) {
                      goto LABEL_26;
                    }
                  }
                  long long v30 = v29[3];
                  long long v51 = v29[2];
                  long long v52 = v30;
                  long long v53 = v29[4];
                  long long v31 = v29[1];
                  long long v49 = *v29;
                  long long v50 = v31;
                  long long v48 = *(long long *)((char *)v29 + 88);
                  [(UITouch *)v8 PK_rollAngle];
                  uint64_t v33 = v32;
                  end = self->_rollPointsToUpdate.__end_;
                  double v35 = (char *)p_rollPointsToUpdate->__begin_ + v27;
                  uint64_t v36 = end - p_rollPointsToUpdate->__begin_ - v27;
                  uint64_t v37 = v36 - 128;
                  if (v35 + 128 != (char *)end) {
                    memmove(v35, v35 + 128, v36 - 128);
                  }
                  self->_rollPointsToUpdate.__end_ = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)&v35[v37 & 0xFFFFFFFFFFFFFF80];
                  double v38 = [(PKTiledCanvasView *)self strokeGenerator];
                  v42[2] = v51;
                  v42[3] = v52;
                  v42[4] = v53;
                  v42[0] = v49;
                  v42[1] = v50;
                  uint64_t v43 = -1;
                  long long v44 = v48;
                  uint64_t v45 = v33;
                  uint64_t v46 = 0;
                  uint64_t v47 = 0;
                  [v38 addPoint:v42];

                  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
                  {
                    double v39 = [(PKTiledCanvasView *)self delegate];
                    [v39 canvasViewDrawingMoved:self withTouch:v8];
                  }
                }
              }
            }
            goto LABEL_26;
          }
          double v19 = [(PKTiledCanvasView *)self strokeGenerator];
          v41[4] = v58;
          v41[5] = v59;
          v41[6] = v60;
          v41[7] = v61;
          v41[0] = v54;
          v41[1] = v55;
          v41[2] = v56;
          v41[3] = v57;
          [v19 drawingUpdatePoint:v41];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_26:
}

- (void)_handleEndOfStroke:(id)a3 shapeStrokes:(id)a4 groupedUndoCommands:(id)a5 invalidateTiles:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __89__PKTiledCanvasView__handleEndOfStroke_shapeStrokes_groupedUndoCommands_invalidateTiles___block_invoke;
  v16[3] = &unk_1E64C6488;
  objc_copyWeak(&v20, &location);
  BOOL v21 = a6;
  id v17 = v12;
  id v18 = v10;
  id v19 = v11;
  id v13 = v11;
  id v14 = v10;
  id v15 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v16);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __89__PKTiledCanvasView__handleEndOfStroke_shapeStrokes_groupedUndoCommands_invalidateTiles___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained + 224;
    char v9 = WeakRetained;
    if ((__int16)WeakRetained[224] < 0)
    {
      uint64_t v5 = [*(id *)(a1 + 32) count];
      id v3 = v9;
      if (v5)
      {
        uint64_t v6 = [v9 delegate];
        [v6 canvasView:v9 registerMultiStepUndoCommands:*(void *)(a1 + 32)];

        id v3 = v9;
      }
    }
    if (*(unsigned char *)(a1 + 64) && (v4[8] & 2) != 0)
    {
      uint64_t v7 = [v3 delegate];
      [v7 canvasViewInvalidateTiles:v9];

      id v3 = v9;
    }
    if (*(void *)(a1 + 40))
    {
      if ((*v4 & 0x20) != 0)
      {
        char v8 = [v3 delegate];
        [v8 canvasView:v9 endedStroke:*(void *)(a1 + 40) shapeStrokes:*(void *)(a1 + 48)];
      }
      else
      {
        if ((*v4 & 0x10) == 0) {
          goto LABEL_14;
        }
        char v8 = [v3 delegate];
        [v8 canvasView:v9 endedStroke:*(void *)(a1 + 40)];
      }

      id v3 = v9;
    }
  }
LABEL_14:
}

- (void)drawingGestureRecognizer:(id)a3 touchesEndedWithDrawingTouch:(id)a4
{
  id v4 = [(PKTiledCanvasView *)self shapeDrawingController];
  if (v4) {
    v4[67] = 0;
  }
}

- (void)drawingEnded:(id)a3
{
}

- (void)_drawingEnded:(id)a3 estimatesTimeout:(double)a4 completion:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v62 = a5;
  char v9 = [(PKTiledCanvasView *)self strokeGenerator];
  if (v9) {
    double v10 = v9[41] - v9[40];
  }
  else {
    double v10 = 0.0;
  }

  if (self->_isCombiningStrokes) {
    ++self->_combiningStrokesCount;
  }
  id v11 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
    *(_DWORD *)buf = 138412290;
    long long v74 = v12;
    _os_log_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEFAULT, "Ended drawing: %@", buf, 0xCu);
  }
  id v13 = [(PKTiledCanvasView *)self powerSavingController];
  if (v13) {
    v13[72] = 0;
  }

  uint64_t v14 = [(PKTiledCanvasView *)self shapeDrawingController];
  id v15 = (void *)v14;
  if (v14) {
    double v16 = *(void **)(v14 + 208);
  }
  else {
    double v16 = 0;
  }
  id v17 = v16;

  if (!v17)
  {
    alternativeStrokesAnimatiouint64_t n = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation) {
      alternativeStrokesAnimatiouint64_t n = (PKAlternativeStrokesAnimation *)alternativeStrokesAnimation->_shape;
    }
    id v19 = alternativeStrokesAnimation;
    BOOL v20 = v19 == 0;

    if (v20
      || (double v21 = CACurrentMediaTime(),
          id v22 = self->_alternativeStrokesAnimation,
          -[PKAlternativeStrokesAnimation alphaAtTime:]((uint64_t)v22, v21) <= 0.01))
    {
      id v17 = 0;
    }
    else
    {
      if (v22) {
        shape = v22->_shape;
      }
      else {
        shape = 0;
      }
      id v17 = shape;
    }
  }
  if ([(PKTiledCanvasView *)self isScratchOutPending])
  {
    if ([(PKShape *)v17 type] == 13) {
      [(PKTiledCanvasView *)self _didFinishErasingStrokes:1];
    }
    else {
      [(PKTiledCanvasView *)self clearHiddenStrokes];
    }
    [(PKTiledCanvasView *)self setIsScratchOutPending:0];
  }
  uint64_t v24 = [(PKTiledCanvasView *)self shapeDrawingController];
  -[PKShapeDrawingController resetStroke]((uint64_t)v24);

  [(PKTiledCanvasView *)self _endAlternativeStrokeIfNecessaryAccepted:v17 != 0];
  if (v8 && self->_isErasingObjects)
  {
    [(PKTiledCanvasView *)self eraserEnded:v8];
    [(PKTiledCanvasView *)self _callOptionalDrawingEndedCompletion:v62 withStroke:0 shapeStrokes:0];
    goto LABEL_63;
  }
  uint64_t v25 = [(PKTiledCanvasView *)self rulerController];
  int v26 = -[PKRulerController rulerSelected]((uint64_t)v25);

  if (v26)
  {
    uint64_t v27 = [(PKTiledCanvasView *)self rulerController];
    -[PKRulerController drawingEnded]((uint64_t)v27);
  }
  [(PKTiledCanvasView *)self setIsDrawing:0];
  if (v8)
  {
    [v8 timestamp];
    kdebug_trace();
  }
  long long v60 = [(PKTiledCanvasView *)self drawing];
  uint64_t v28 = [(PKTiledCanvasView *)self strokeGenerator];
  long long v61 = (void *)v28;
  if (!v28) {
    [(PKTiledCanvasView *)self _callOptionalDrawingEndedCompletion:v62 withStroke:0 shapeStrokes:0];
  }
  if (qword_1EA3C6B50 != -1) {
    dispatch_once(&qword_1EA3C6B50, &__block_literal_global_860);
  }
  if (byte_1EA3C6B33 || [(PKShape *)v17 type] == 13)
  {
    char v29 = 1;
  }
  else if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x100) != 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke;
    aBlock[3] = &unk_1E64C64B0;
    void aBlock[4] = v28;
    long long v50 = _Block_copy(aBlock);
    long long v51 = [(PKTiledCanvasView *)self delegate];
    char v29 = [v51 canvasView:self shouldDiscardEndedStroke:v50 drawing:v60];
  }
  else
  {
    char v29 = 0;
  }
  uint64_t v30 = objc_opt_class();
  long long v31 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
  uint64_t v32 = PKDynamicCast(v30, v31);

  if (v32) {
    char v33 = v29;
  }
  else {
    char v33 = 1;
  }
  if ((v33 & 1) == 0)
  {
    if ([v32 isReplaying])
    {
      char v29 = 0;
      goto LABEL_59;
    }
    double v34 = CACurrentMediaTime();
    [v32 startTimeInterval];
    double v36 = v35;
    [v32 currentBoundingBoxInWindow];
    CGFloat v38 = v37;
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    BOOL v45 = v41 <= 7.0;
    if (v43 > 7.0) {
      BOOL v45 = 0;
    }
    BOOL v46 = v34 - v36 <= 0.15 && v45;
    uint64_t v47 = [(PKTiledCanvasView *)self window];
    long long v48 = [v47 windowScene];
    long long v49 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v48];

    if (v46)
    {
      if ([v49 _tiledCanvasViewShouldDiscardTapStroke:self])
      {
        char v29 = 1;
LABEL_58:

        goto LABEL_59;
      }
      if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x800) != 0)
      {
        [(PKTiledCanvasView *)self convertPoint:0 fromView:DKDCenterOfRect(v38, v40, v42, v44)];
        double v56 = v55;
        double v58 = v57;
        long long v59 = [(PKTiledCanvasView *)self delegate];
        char v29 = objc_msgSend(v59, "canvasView:shouldDiscardTapStrokeAt:drawing:", self, v60, v56, v58);

        goto LABEL_58;
      }
    }
    char v29 = 0;
    goto LABEL_58;
  }
LABEL_59:
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x1000) != 0)
  {
    long long v53 = [(PKTiledCanvasView *)self delegate];
    char v52 = [v53 canvasView:self drawingIsShared:v60];
  }
  else
  {
    char v52 = 0;
  }
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2;
  v63[3] = &unk_1E64C6550;
  double v69 = v10;
  id v64 = v8;
  long long v65 = self;
  long long v66 = v17;
  char v70 = v52;
  char v71 = v29;
  id v54 = v60;
  id v67 = v54;
  id v68 = v62;
  [v61 drawingEndedEstimatesTimeout:v63 completion:a4];
  kdebug_trace();
  kdebug_trace();

LABEL_63:
}

id __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) newStrokeWithCurrentData];

  return v1;
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 ink];
  uint64_t v5 = [v4 behavior];
  if ([v5 isEraser])
  {
    uint64_t v6 = *(void *)(a1 + 32);

    if (!v6) {
      goto LABEL_6;
    }
    id v4 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordBitmapEraseWithInputType:]((uint64_t)v4, [*(id *)(a1 + 32) type]);
  }
  else
  {
  }
LABEL_6:
  long long v50 = [v3 ink];
  if (v50)
  {
    uint64_t v7 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordStrokeWithInk:rollAngleDelta:]((uint64_t)v7, v50, *(double *)(a1 + 72));
  }
  if (v3)
  {
    id v8 = *(_WORD **)(a1 + 40);
    if ((v8[232] & 8) != 0)
    {
      char v9 = [v8 delegate];
      double v10 = [v9 canvasView:*(void *)(a1 + 40) inkForStroke:v3];

      id v11 = [v3 ink];

      if (v10 != v11)
      {
        id v12 = (void *)[v3 mutableCopy];
        [v12 setInk:v10];
        uint64_t v13 = [v12 copy];

        id v3 = (id)v13;
      }
    }
  }
  long long v49 = [*(id *)(a1 + 48) strokes];
  if (v3)
  {
    uint64_t v14 = *(_WORD **)(a1 + 40);
    if ((v14[232] & 0x10) == 0) {
      goto LABEL_20;
    }
    memset(&location, 0, sizeof(location));
    id v15 = [v14 delegate];
    double v16 = v15;
    if (v15) {
      [v15 canvasView:*(void *)(a1 + 40) transformForStroke:v3];
    }
    else {
      memset(&location, 0, sizeof(location));
    }

    CGAffineTransform v80 = location;
    if (!CGAffineTransformIsIdentity(&v80))
    {
      uint64_t v47 = (void *)[v3 mutableCopy];
      [v3 transform];
      CGAffineTransform t2 = location;
      CGAffineTransformConcat(&v79, &t1, &t2);
      CGAffineTransform v76 = v79;
      [v47 _setTransform:&v76];
      id v17 = (void *)[v47 copy];

      id v18 = v47;
      if ([v49 count])
      {
        id v19 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v49, "count"));
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id v20 = v49;
        uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v84 count:16];
        if (v21)
        {
          uint64_t v22 = *(void *)v73;
          do
          {
            for (uint64_t i = 0; i != v21; ++i)
            {
              if (*(void *)v73 != v22) {
                objc_enumerationMutation(v20);
              }
              uint64_t v24 = *(void **)(*((void *)&v72 + 1) + 8 * i);
              uint64_t v25 = (void *)[v24 mutableCopy];
              if (v24) {
                [v24 transform];
              }
              else {
                memset(&v70, 0, sizeof(v70));
              }
              CGAffineTransform v69 = location;
              CGAffineTransformConcat(&v71, &v70, &v69);
              CGAffineTransform v68 = v71;
              [v25 _setTransform:&v68];
              int v26 = (void *)[v25 copy];
              [v19 addObject:v26];
            }
            uint64_t v21 = [v20 countByEnumeratingWithState:&v72 objects:v84 count:16];
          }
          while (v21);
        }

        uint64_t v27 = [v19 copy];
        long long v49 = (void *)v27;
        id v18 = v47;
      }
    }
    else
    {
LABEL_20:
      id v17 = v3;
    }
  }
  else
  {
    id v17 = 0;
  }
  [v17 _setIsSharedStroke:*(unsigned __int8 *)(a1 + 80)];
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v28 = v49;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v83 count:16];
  if (v29)
  {
    uint64_t v30 = *(void *)v65;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v65 != v30) {
          objc_enumerationMutation(v28);
        }
        [*(id *)(*((void *)&v64 + 1) + 8 * j) _setIsSharedStroke:*(unsigned __int8 *)(a1 + 80)];
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v64 objects:v83 count:16];
    }
    while (v29);
  }

  if (v17 && !*(unsigned char *)(a1 + 81))
  {
    unint64_t v82 = v17;
    long long v48 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v82 count:1];
    uint64_t v32 = [*(id *)(a1 + 40) _drawingController];
    if (v32 && (BOOL v33 = (v32[48] & 1) == 0, v32, !v33))
    {
      char v35 = 1;
    }
    else
    {
      double v34 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location.a) = 0;
        _os_log_error_impl(&dword_1C44F8000, v34, OS_LOG_TYPE_ERROR, "Did not have live interaction lock at end of stroke", (uint8_t *)&location, 2u);
      }

      char v35 = 0;
    }
    double v36 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordDrawStroke:]((uint64_t)v36, v17);

    objc_initWeak((id *)&location, *(id *)(a1 + 40));
    double v37 = [*(id *)(a1 + 40) _drawingController];
    int v38 = [*(id *)(a1 + 40) generateLiveDrawing];
    double v39 = *(void **)(a1 + 48);
    BOOL v40 = v39 != 0;
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_146;
    v58[3] = &unk_1E64C6500;
    id v59 = v39;
    id v60 = v28;
    objc_copyWeak(&v62, (id *)&location);
    id v61 = v17;
    char v63 = v35;
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:]((uint64_t)v37, v48, v38, v40, v58);

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)&location);
  }
  double v41 = [*(id *)(a1 + 40) _rendererController];
  CGFloat v42 = [*(id *)(a1 + 40) strokeGenerator];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_3;
  v52[3] = &unk_1E64C6528;
  id v43 = v17;
  id v53 = v43;
  id v44 = v28;
  uint64_t v45 = *(void *)(a1 + 40);
  id v46 = v44;
  id v54 = v44;
  uint64_t v55 = v45;
  id v56 = *(id *)(a1 + 56);
  char v57 = *(unsigned char *)(a1 + 81);
  -[PKMetalRendererController drawingEnded:finishStrokeBlock:]((uint64_t)v41, v42, v52);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_5;
  block[3] = &unk_1E64C5368;
  void block[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);
  [*(id *)(a1 + 40) _callOptionalDrawingEndedCompletion:*(void *)(a1 + 64) withStroke:v43 shapeStrokes:v46];
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_146(uint64_t a1, void *a2, void *a3, char a4)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (*(void *)(a1 + 32) && (uint64_t v9 = [*(id *)(a1 + 40) count], v8) && v7 && v9)
  {
    double v10 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordCreateShapeWithType:fromMenu:multiple:]((uint64_t)v10, [*(id *)(a1 + 32) type], 0, 0);

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    id v12 = [WeakRetained _drawingController];
    uint64_t v13 = *(void **)(a1 + 40);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2_147;
    v19[3] = &unk_1E64C64D8;
    objc_copyWeak(&v24, (id *)(a1 + 56));
    id v20 = *(id *)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v22 = v7;
    id v23 = v8;
    char v25 = *(unsigned char *)(a1 + 64);
    -[PKController addNewRenderedStrokes:wasAddedEarly:hidden:preDrawingChangedBlock:]((uint64_t)v12, v13, 0, 0, v19);

    objc_destroyWeak(&v24);
  }
  else
  {
    if (v7)
    {
      id v26 = v7;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      v27[0] = v14;
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:1];
    }
    else
    {
      id v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v16 = objc_loadWeakRetained((id *)(a1 + 56));
    id v17 = v16;
    if (a4) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = *(void *)(a1 + 48);
    }
    [v16 _handleEndOfStroke:v18 shapeStrokes:0 groupedUndoCommands:v15 invalidateTiles:*(unsigned char *)(a1 + 64) == 0];
  }
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_2_147(uint64_t a1, void *a2)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = +[PKShape snapToShapeActionNameForNumShapes:1];
  [v5 setActionName:v6];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 40);
  if (v5)
  {
    uint64_t v12 = *(void *)(a1 + 48);
    uint64_t v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v12 count:1];
    v13[0] = v2;
    v11[0] = *(void *)(a1 + 56);
    v11[1] = v5;
    id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
    v13[1] = v3;
    double v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    double v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [WeakRetained _handleEndOfStroke:v8 shapeStrokes:v9 groupedUndoCommands:v10 invalidateTiles:*(unsigned char *)(a1 + 72) == 0];
  if (v5)
  {
  }
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_4;
  block[3] = &unk_1E64C6528;
  id v6 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = *(void **)(a1 + 56);
  id v7 = v2;
  uint64_t v8 = v3;
  id v9 = v4;
  char v10 = *(unsigned char *)(a1 + 64);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_4(uint64_t a1)
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v4[0] = *(void *)(a1 + 32);
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  if ([*(id *)(a1 + 40) count])
  {
    id v3 = *(id *)(a1 + 40);

    id v2 = v3;
  }
  [*(id *)(a1 + 48) didEndLiveInteractionWithStrokes:v2 drawing:*(void *)(a1 + 56) cancelled:*(unsigned __int8 *)(a1 + 64)];
}

uint64_t __63__PKTiledCanvasView__drawingEnded_estimatesTimeout_completion___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _postEndedSketchingAXAnnouncement];
}

- (void)_callOptionalDrawingEndedCompletion:(id)a3 withStroke:(id)a4 shapeStrokes:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7)
  {
    char v10 = dispatch_get_global_queue(33, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__PKTiledCanvasView__callOptionalDrawingEndedCompletion_withStroke_shapeStrokes___block_invoke;
    block[3] = &unk_1E64C6578;
    id v14 = v7;
    id v12 = v8;
    id v13 = v9;
    dispatch_async(v10, block);
  }
}

uint64_t __81__PKTiledCanvasView__callOptionalDrawingEndedCompletion_withStroke_shapeStrokes___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_endAlternativeStrokeIfNecessaryAccepted:(BOOL)a3
{
  alternativeStrokesAnimatiouint64_t n = self->_alternativeStrokesAnimation;
  if (alternativeStrokesAnimation)
  {
    if (alternativeStrokesAnimation->_crossFadeStartTime == 0.0)
    {
      alternativeStrokesAnimation->_crossFadeStartTime = CACurrentMediaTime();
      alternativeStrokesAnimation->_accepted = a3;
    }
  }
}

- (void)drawingCancelled
{
}

- (void)drawingCancelledForPreview:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    id v5 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [(PKTiledCanvasView *)self drawingGestureRecognizer];
      *(_DWORD *)buf = 138412290;
      id v21 = v6;
      _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEFAULT, "Cancelled drawing: %@", buf, 0xCu);
    }
  }
  id v7 = [(PKTiledCanvasView *)self shapeDrawingController];
  -[PKShapeDrawingController resetStroke]((uint64_t)v7);

  [(PKTiledCanvasView *)self _endAlternativeStrokeIfNecessaryAccepted:0];
  if (self->_isErasingObjects)
  {
    [(PKTiledCanvasView *)self eraserCancelled];
  }
  else
  {
    [(PKTiledCanvasView *)self setIsDrawing:0 forPreview:v3];
    id v8 = [(PKTiledCanvasView *)self rulerController];
    int v9 = -[PKRulerController rulerSelected]((uint64_t)v8);

    if (v9)
    {
      char v10 = [(PKTiledCanvasView *)self rulerController];
      -[PKRulerController drawingCancelled:]((uint64_t)v10);
    }
    id v11 = [(PKTiledCanvasView *)self powerSavingController];
    if (v11) {
      v11[72] = 0;
    }

    if ([(PKTiledCanvasView *)self isHidden])
    {
      id v12 = [(PKTiledCanvasView *)self metalView];
      -[PKMetalView flushDrawables]((uint64_t)v12);

      [(PKTiledCanvasView *)self schedulePurgeResourcesBlock];
    }
    id v13 = [(PKTiledCanvasView *)self _drawingController];
    -[PKController cancelLiveStroke]((uint64_t)v13);

    id v14 = [(PKTiledCanvasView *)self drawing];
    id v15 = [(PKTiledCanvasView *)self strokeGenerator];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke;
    v17[3] = &unk_1E64C65A0;
    v17[4] = self;
    BOOL v19 = v3;
    id v16 = v14;
    id v18 = v16;
    [v15 drawingCancelledWithCompletion:v17];

    kdebug_trace();
  }
}

void __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _rendererController];
  -[PKMetalRendererController drawingCancelledForPreview:]((uint64_t)v4, *(unsigned char *)(a1 + 48));

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke_2;
  v8[3] = &unk_1E64C5EC0;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  char v12 = *(unsigned char *)(a1 + 48);
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v8);
}

void __48__PKTiledCanvasView_drawingCancelledForPreview___block_invoke_2(uint64_t a1)
{
  v3[1] = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    v3[0] = *(void *)(a1 + 32);
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  [*(id *)(a1 + 40) didEndLiveInteractionWithStrokes:v2 drawing:*(void *)(a1 + 48) cancelled:1 forPreview:*(unsigned __int8 *)(a1 + 56)];
}

- (void)setViewScissor:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_viewScissor = a3;
  id v7 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setViewScissor:]((uint64_t)v7, x, y, width, height);
}

- (void)setPaperTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_paperTransform.double a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_paperTransform.c = v4;
  *(_OWORD *)&self->_paperTransform.tdouble x = v3;
  long long v5 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v5;
  v7[2] = *(_OWORD *)&a3->tx;
  id v6 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setPaperTransform:]((uint64_t)v6, v7);
}

- (void)setIsDrawing:(BOOL)a3
{
}

- (void)setIsDrawing:(BOOL)a3 forPreview:(BOOL)a4
{
  if (self->_isDrawing != a3)
  {
    BOOL v5 = a3;
    id v7 = [(PKTiledCanvasView *)self _drawingController];
    -[PKController inputController](v7);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

    if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x400) != 0)
    {
      id v9 = [(PKTiledCanvasView *)self delegate];
      uint64_t v8 = [v9 canvasViewMaximumSupportedContentVersion:self];
    }
    else
    {
      uint64_t v8 = 3;
    }
    uint64_t v10 = [(PKTiledCanvasView *)self ink];
    [v15 setupForInk:v10 maximumSupportedContentVersion:v8];

    self->_isDrawing = v5;
    if (!a4)
    {
      id v11 = [(PKTiledCanvasView *)self window];
      char v12 = +[PKToolPicker activeToolPickerForWindow:v11];

      if (v5)
      {
        if ((*(_WORD *)&self->_canvasViewFlags & 0x80) != 0)
        {
          id v13 = [(PKTiledCanvasView *)self delegate];
          [v13 canvasViewDidBeginDrawing:self];
        }
      }
      else
      {
        if ((*(_WORD *)&self->_canvasViewFlags & 0x400) != 0)
        {
          id v14 = [(PKTiledCanvasView *)self delegate];
          [v14 canvasViewDidEndDrawing:self];
        }
        [v12 _saveStateIfNecessary];
      }
      [(PKTiledCanvasView *)self updateHasVisibleStrokes];
    }
  }
}

- (CGPoint)applyTransformToTouchLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = objc_opt_class();
  id v7 = [(PKTiledCanvasView *)self _touchView];
  uint64_t v8 = PKDynamicCast(v6, v7);

  if (v8)
  {
    memset(&v16, 0, sizeof(v16));
    id v9 = [v8 tileContainerView];
    PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v8, v9, &v16);

    memset(&v15, 0, sizeof(v15));
    [v8 drawingTransform];
    CGAffineTransformInvert(&v14, &v13);
    CGAffineTransform t1 = v16;
    CGAffineTransform t2 = v14;
    CGAffineTransformConcat(&v15, &t1, &t2);
    double v10 = y * v15.d + v15.b * x;
    double x = v15.tx + y * v15.c + v15.a * x;
    double y = v15.ty + v10;
  }

  double v11 = x;
  double v12 = y;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)eraseStrokesForPoint:(CGPoint)a3 prevPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = [(PKTiledCanvasView *)self selectionController];
  double v10 = (void *)v9;
  if (v9) {
    id WeakRetained = objc_loadWeakRetained((id *)(v9 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  double v12 = [WeakRetained liveAttachment];

  char v52 = v12;
  CGAffineTransform v13 = [v12 recognitionController];
  char v14 = [v13 shouldCancelForAutoRefineCompletion];

  if ((v14 & 1) == 0)
  {
    if (!self->_strokesToErase)
    {
      CGAffineTransform v15 = [MEMORY[0x1E4F1CA48] array];
      strokesToErase = self->_strokesToErase;
      self->_strokesToErase = v15;

      id v17 = [MEMORY[0x1E4F1CA80] set];
      strokeIDsToErase = self->_strokeIDsToErase;
      self->_strokeIDsToErase = v17;
    }
    kdebug_trace();
    uint64_t v19 = [v12 strokeSpatialCache];
    id v20 = (void *)v19;
    if (v19 && *(unsigned char *)(v19 + 8))
    {
      uint64_t v21 = [v12 strokeSpatialCache];
      uint64_t v22 = (void *)v21;
      if (v21) {
        id v23 = *(void **)(v21 + 24);
      }
      else {
        id v23 = 0;
      }
      id v50 = v23;
    }
    else
    {
      id v50 = 0;
    }

    id v24 = os_log_create("com.apple.pencilkit", "Erase");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v41 = [v12 strokeSpatialCache];
      CGFloat v42 = (void *)v41;
      if (v41) {
        id v43 = *(void **)(v41 + 24);
      }
      else {
        id v43 = 0;
      }
      id v44 = v43;
      uint64_t v45 = [v44 count];
      uint64_t v46 = [v12 strokeSpatialCache];
      uint64_t v47 = (void *)v46;
      long long v48 = @"NO";
      if (v46 && *(unsigned char *)(v46 + 8)) {
        long long v48 = @"YES";
      }
      *(_DWORD *)buf = 134218242;
      uint64_t v59 = v45;
      __int16 v60 = 2112;
      id v61 = v48;
      _os_log_debug_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEBUG, "Used cached %lu strokes: %@", buf, 0x16u);
    }
    char v25 = [(PKTiledCanvasView *)self drawing];
    long long v51 = objc_msgSend(v25, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v50, v7, v6, x, y);

    kdebug_trace();
    if ([v51 count])
    {
      uint64_t v49 = [(NSMutableArray *)self->_strokesToErase count];
      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v26 = [v51 array];
      id v27 = +[PKStroke copyStrokes:v26 hidden:1];

      uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v57 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v54 != v29) {
              objc_enumerationMutation(v27);
            }
            long long v31 = *(void **)(*((void *)&v53 + 1) + 8 * i);
            uint64_t v32 = self->_strokeIDsToErase;
            BOOL v33 = [v31 _strokeUUID];
            LOBYTE(v32) = [(NSMutableSet *)v32 containsObject:v33];

            if ((v32 & 1) == 0)
            {
              [(NSMutableArray *)self->_strokesToErase addObject:v31];
              double v34 = self->_strokeIDsToErase;
              char v35 = [v31 _strokeUUID];
              [(NSMutableSet *)v34 addObject:v35];
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v53 objects:v57 count:16];
        }
        while (v28);
      }

      if ([(NSMutableArray *)self->_strokesToErase count] != v49)
      {
        id v36 = objc_loadWeakRetained((id *)&self->_selectionController);
        double v37 = self->_strokesToErase;
        int v38 = [(PKTiledCanvasView *)self drawing];
        -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)v36, v37, v38, 0);
      }
      if ((*(_WORD *)&self->_canvasViewFlags & 0x2000) != 0)
      {
        double v39 = [(PKTiledCanvasView *)self delegate];
        BOOL v40 = [v51 array];
        [v39 _canvasViewDidEraseStrokes:v40];
      }
    }
  }
}

- (void)eraseStrokes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v25 = v4;
  if (!self->_strokesToErase)
  {
    BOOL v5 = [MEMORY[0x1E4F1CA48] array];
    strokesToErase = self->_strokesToErase;
    self->_strokesToErase = v5;

    double v7 = [MEMORY[0x1E4F1CA80] set];
    strokeIDsToErase = self->_strokeIDsToErase;
    self->_strokeIDsToErase = v7;

    id v4 = v25;
  }
  if ([v4 count])
  {
    uint64_t v24 = [(NSMutableArray *)self->_strokesToErase count];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v9 = [v25 array];
    id v10 = +[PKStroke copyStrokes:v9 hidden:1];

    uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v27 != v12) {
            objc_enumerationMutation(v10);
          }
          char v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          CGAffineTransform v15 = self->_strokeIDsToErase;
          CGAffineTransform v16 = [v14 _strokeUUID];
          LOBYTE(v15) = [(NSMutableSet *)v15 containsObject:v16];

          if ((v15 & 1) == 0)
          {
            [(NSMutableArray *)self->_strokesToErase addObject:v14];
            id v17 = self->_strokeIDsToErase;
            id v18 = [v14 _strokeUUID];
            [(NSMutableSet *)v17 addObject:v18];
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v11);
    }

    if ([(NSMutableArray *)self->_strokesToErase count] != v24)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
      id v20 = self->_strokesToErase;
      uint64_t v21 = [(PKTiledCanvasView *)self drawing];
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, v20, v21, 0);
    }
    if ((*(_WORD *)&self->_canvasViewFlags & 0x2000) != 0)
    {
      uint64_t v22 = [(PKTiledCanvasView *)self delegate];
      id v23 = [v25 array];
      [v22 _canvasViewDidEraseStrokes:v23];
    }
  }
}

- (void)clearHiddenStrokes
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)WeakRetained);

  strokesToErase = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;
}

- (void)_didFinishErasingStrokes:(BOOL)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  strokesToErase = self->_strokesToErase;
  if (strokesToErase)
  {
    BOOL v5 = a3;
    if ([(NSMutableArray *)strokesToErase count])
    {
      if (v5)
      {
        double v6 = [(PKTiledCanvasView *)self drawing];
        double v7 = [v6 undoableDeleteStrokes:self->_strokesToErase];

        if (v7 && (*(_WORD *)&self->_canvasViewFlags & 0x80000000) != 0)
        {
          uint64_t v8 = [(PKTiledCanvasView *)self delegate];
          v20[0] = v7;
          uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
          [v8 canvasView:self registerUndoCommands:v9];
        }
        id v10 = [(PKTiledCanvasView *)self drawing];
        [(PKTiledCanvasView *)self drawingChanged:v10];

        uint64_t v11 = os_log_create("com.apple.pencilkit", "Erase");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v17 = [(NSMutableArray *)self->_strokesToErase count];
          int v18 = 134217984;
          uint64_t v19 = v17;
          _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "Erased %lu strokes", (uint8_t *)&v18, 0xCu);
        }
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);
      CGAffineTransform v13 = [(PKTiledCanvasView *)self drawing];
      -[PKSelectionController _setAdditionalStrokes:inDrawing:completion:]((uint64_t)WeakRetained, 0, v13, 0);
    }
  }
  id v14 = objc_loadWeakRetained((id *)&self->_selectionController);
  -[PKSelectionController _resetSelectedStrokeStateForRenderer]((uint64_t)v14);

  CGAffineTransform v15 = self->_strokesToErase;
  self->_strokesToErase = 0;

  strokeIDsToErase = self->_strokeIDsToErase;
  self->_strokeIDsToErase = 0;
}

- (BOOL)eraserBegan:(id)a3
{
  id v4 = a3;
  self->_isErasingObjects = 0;
  BOOL v5 = [(PKTiledCanvasView *)self ink];
  double v6 = [v5 identifier];
  int v7 = [v6 isEqual:@"com.apple.ink.objectEraser"];

  if (v7)
  {
    self->_isErasingObjects = 1;
    __int16 canvasViewFlags = (__int16)self->_canvasViewFlags;
    if ((canvasViewFlags & 2) != 0)
    {
      uint64_t v9 = [(PKTiledCanvasView *)self delegate];
      objc_msgSend(v9, "canvasViewWillBeginNewStroke:withTouch:location:", self, v4, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

      __int16 canvasViewFlags = (__int16)self->_canvasViewFlags;
    }
    if ((canvasViewFlags & 0x80) != 0)
    {
      id v10 = [(PKTiledCanvasView *)self delegate];
      [v10 canvasViewDidBeginDrawing:self];
    }
    uint64_t v11 = [(PKTiledCanvasView *)self _touchView];
    objc_msgSend(v4, "PK_preciseLocationInView:", v11);
    double v13 = v12;
    double v15 = v14;

    -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v13, v15);
    double v17 = v16;
    double v19 = v18;
    kdebug_trace();
    self->_isErasingObjects = 1;
    -[PKTiledCanvasView eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", v17, v19, v17, v19);
    -[PKTiledCanvasView set_oldEraseLocation:](self, "set_oldEraseLocation:", v17, v19);
    id v20 = os_log_create("com.apple.pencilkit", "Erase");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v22 = 0;
      _os_log_debug_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEBUG, "Eraser began", v22, 2u);
    }

    [(PKTiledCanvasView *)self _postBeganErasingAXAnnouncement];
  }

  return v7;
}

- (void)eraserMoved:(id)a3
{
  id v16 = a3;
  id v4 = [(PKTiledCanvasView *)self _touchView];
  objc_msgSend(v16, "PK_preciseLocationInView:", v4);
  double v6 = v5;
  double v8 = v7;

  -[PKTiledCanvasView applyTransformToTouchLocation:](self, "applyTransformToTouchLocation:", v6, v8);
  double v10 = v9;
  double v12 = v11;
  -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", v16);
  [(PKTiledCanvasView *)self _oldEraseLocation];
  -[PKTiledCanvasView eraseStrokesForPoint:prevPoint:](self, "eraseStrokesForPoint:prevPoint:", v10, v12, v13, v14);
  -[PKTiledCanvasView set_oldEraseLocation:](self, "set_oldEraseLocation:", v10, v12);
  if ((*(_WORD *)&self->_canvasViewFlags & 0x100) != 0)
  {
    double v15 = [(PKTiledCanvasView *)self delegate];
    [v15 canvasViewDrawingMoved:self withTouch:v16];
  }
}

- (void)eraserEnded:(id)a3
{
  id v4 = a3;
  double v5 = os_log_create("com.apple.pencilkit", "Erase");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)double v9 = 0;
    _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Eraser ended", v9, 2u);
  }

  self->_isErasingObjects = 0;
  [(PKTiledCanvasView *)self _didFinishErasingStrokes:1];
  double v6 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordObjectEraseWithInputType:]((uint64_t)v6, [v4 type]);

  if ((*(_WORD *)&self->_canvasViewFlags & 0x400) != 0)
  {
    double v7 = [(PKTiledCanvasView *)self delegate];
    [v7 canvasViewDidEndDrawing:self];
  }
  kdebug_trace();
  double v8 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordTool:]((uint64_t)v8, @"objectEraser");

  [(PKTiledCanvasView *)self _postEndedErasingAXAnnouncement];
}

- (void)eraserCancelled
{
  self->_isErasingObjects = 0;
  [(PKTiledCanvasView *)self _didFinishErasingStrokes:0];
  __int16 canvasViewFlags = (__int16)self->_canvasViewFlags;
  if ((canvasViewFlags & 8) != 0)
  {
    id v4 = [(PKTiledCanvasView *)self delegate];
    [v4 canvasView:self cancelledStroke:0];

    __int16 canvasViewFlags = (__int16)self->_canvasViewFlags;
  }
  if ((canvasViewFlags & 0x400) != 0)
  {
    id v5 = [(PKTiledCanvasView *)self delegate];
    [v5 canvasViewDidEndDrawing:self];
  }
}

- (id)_strokeUUIDsForStrokes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v3, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "_strokeUUID", (void)v12);
        [v4 addObject:v9];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  double v10 = (void *)[v4 copy];

  return v10;
}

- (void)liveStrokeParticlesToDestinationFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v8 = [(PKTiledCanvasView *)self _drawingController];
  double v9 = -[PKController renderedStrokes](v8);
  id v10 = (id)[v9 copy];

  if ([v10 count]) {
    -[PKTiledCanvasView animateStrokes:destinationFrame:duration:particles:](self, "animateStrokes:destinationFrame:duration:particles:", v10, 1, x, y, width, height, 1.0);
  }
}

- (void)animateStrokes:(id)a3 destinationFrame:(CGRect)a4 duration:(double)a5 particles:(BOOL)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v13 = a3;
  [(PKTiledCanvasView *)self strokeTransform];
  CGAffineTransformInvert(&v36, &v35);
  v37.origin.CGFloat x = x;
  v37.origin.CGFloat y = y;
  v37.size.CGFloat width = width;
  v37.size.CGFloat height = height;
  CGRect v38 = CGRectApplyAffineTransform(v37, &v36);
  double v14 = v38.origin.x;
  double v15 = v38.origin.y;
  double v16 = v38.size.width;
  double v17 = v38.size.height;
  double v18 = [(PKTiledCanvasView *)self _strokeUUIDsForStrokes:v13];
  double v19 = [(PKTiledCanvasView *)self strokeUUIDsAboutToBeRemoved];
  [v19 unionSet:v18];

  id v20 = [(PKTiledCanvasView *)self _drawingController];
  uint64_t v29 = MEMORY[0x1E4F143A8];
  uint64_t v30 = 3221225472;
  uint64_t v31 = __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke;
  uint64_t v32 = &unk_1E64C5870;
  BOOL v33 = self;
  id v21 = v18;
  id v34 = v21;
  -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v20, v13, &v29);

  double v22 = CACurrentMediaTime();
  [(PKTiledCanvasView *)self liveAnimationStartTime];
  if (v23 == 0.0) {
    [(PKTiledCanvasView *)self setLiveAnimationStartTime:v22];
  }
  if (a6)
  {
    uint64_t v24 = -[PKLiveStrokesParticlesAnimation initWithStrokes:startTime:duration:destinationFrame:]([PKLiveStrokesParticlesAnimation alloc], "initWithStrokes:startTime:duration:destinationFrame:", v13, v22, a5, v14, v15, v16, v17);
    char v25 = [(PKTiledCanvasView *)self particlesToDestinationAnimations];
    [v25 addObject:v24];

    [(PKTiledCanvasView *)self liveAnimationStartTime];
    double v27 = v26;
    long long v28 = [(PKTiledCanvasView *)self _rendererController];
    -[PKMetalRendererController liveStrokeParticlesToFrame:strokes:startTime:duration:]((uint64_t)v28, v13, v14, v15, v16, v17, v22 - v27, a5);
  }
  else
  {
    uint64_t v24 = (PKLiveStrokesParticlesAnimation *)-[PKTransformStrokesAnimation initWithStrokes:startTime:duration:destinationFrame:fadeOutDuration:]((id *)[PKTransformStrokesAnimation alloc], v13, v22, a5, v14, v15, v16, v17, a5 * 0.95);
    long long v28 = [(PKTiledCanvasView *)self transformStrokesAnimations];
    [v28 addObject:v24];
  }

  if ([(CADisplayLink *)self->_displayLink isPaused]) {
    [(PKTiledCanvasView *)self setNeedsDrawingDisplay];
  }
}

void __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke_2;
  void v2[3] = &unk_1E64C5870;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __72__PKTiledCanvasView_animateStrokes_destinationFrame_duration_particles___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strokeUUIDsAboutToBeRemoved];
  [v2 minusSet:*(void *)(a1 + 40)];
}

- (void)setLiveAnimationStartTime:(double)a3
{
  if (self->_liveAnimationStartTime != a3)
  {
    self->_liveAnimationStartTime = a3;
    [(PKTiledCanvasView *)self updateHasVisibleStrokes];
  }
}

- (void)checkAnimationsDidEndAtTime:(double)a3
{
  [(PKTiledCanvasView *)self liveAnimationStartTime];
  if (v5 != 0.0)
  {
    unint64_t v6 = 0x1E4F1C000uLL;
    id v33 = [MEMORY[0x1E4F1CA48] array];
    if ([(NSMutableArray *)self->_fadeOutStrokeAnimations count])
    {
      uint64_t v7 = 0;
      uint64_t v8 = [(NSMutableArray *)self->_fadeOutStrokeAnimations count];
      if (v8)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          id v10 = [(NSMutableArray *)self->_fadeOutStrokeAnimations objectAtIndexedSubscript:i];
          if ([v10 isDoneAtTime:a3])
          {
            double v11 = [v10 stroke];
            [v33 addObject:v11];

            if (!v7)
            {
              uint64_t v7 = [MEMORY[0x1E4F28E60] indexSet];
            }
            [v7 addIndex:i];
          }
        }
        if (v7) {
          [(NSMutableArray *)self->_fadeOutStrokeAnimations removeObjectsAtIndexes:v7];
        }
      }
    }
    if ([(NSMutableArray *)self->_particlesToDestinationAnimations count])
    {
      uint64_t v12 = [(NSMutableArray *)self->_particlesToDestinationAnimations count];
      if (v12)
      {
        uint64_t v13 = 0;
        double v14 = 0;
        do
        {
          double v15 = [(NSMutableArray *)self->_particlesToDestinationAnimations objectAtIndexedSubscript:v13];
          if ([v15 isDoneAtTime:a3])
          {
            double v16 = [v15 strokes];
            [v33 addObjectsFromArray:v16];

            if (!v14)
            {
              double v14 = [MEMORY[0x1E4F28E60] indexSet];
            }
            [v14 addIndex:v13];
          }

          ++v13;
        }
        while (v12 != v13);
        if (v14) {
          [(NSMutableArray *)self->_particlesToDestinationAnimations removeObjectsAtIndexes:v14];
        }
      }
      else
      {
        double v14 = 0;
      }
    }
    if ([(NSMutableArray *)self->_transformStrokesAnimations count])
    {
      uint64_t v17 = [(NSMutableArray *)self->_transformStrokesAnimations count];
      if (v17)
      {
        uint64_t v18 = 0;
        double v19 = 0;
        do
        {
          uint64_t v20 = [(NSMutableArray *)self->_transformStrokesAnimations objectAtIndexedSubscript:v18];
          id v21 = (void *)v20;
          if (v20 && *(double *)(v20 + 16) + *(double *)(v20 + 24) <= a3)
          {
            id v22 = *(id *)(v20 + 8);
            [v33 addObjectsFromArray:v22];

            if (!v19)
            {
              double v19 = [MEMORY[0x1E4F28E60] indexSet];
            }
            [v19 addIndex:v18];
          }

          ++v18;
        }
        while (v17 != v18);
        if (v19)
        {
          [(NSMutableArray *)self->_transformStrokesAnimations removeObjectsAtIndexes:v19];
          unint64_t v6 = 0x1E4F1C000;
        }
        else
        {
          unint64_t v6 = 0x1E4F1C000uLL;
        }
      }
      else
      {
        double v19 = 0;
      }
    }
    alternativeStrokesAnimatiouint64_t n = self->_alternativeStrokesAnimation;
    if (alternativeStrokesAnimation)
    {
      if (alternativeStrokesAnimation->_forceDone
        || (double crossFadeStartTime = alternativeStrokesAnimation->_crossFadeStartTime, crossFadeStartTime > 0.0)
        && crossFadeStartTime + alternativeStrokesAnimation->_fadeDuration <= a3)
      {
        self->_alternativeStrokesAnimatiouint64_t n = 0;
      }
    }
    liveRenderingOverrideColorAnimatiouint64_t n = self->_liveRenderingOverrideColorAnimation;
    if (liveRenderingOverrideColorAnimation
      && liveRenderingOverrideColorAnimation->_startTime + liveRenderingOverrideColorAnimation->_duration <= a3)
    {
      self->_liveRenderingOverrideColorAnimatiouint64_t n = 0;

      double v26 = [(PKTiledCanvasView *)self _rendererController];
      -[PKMetalRendererController setLiveRenderingOverrideColor:]((uint64_t)v26, [(UIColor *)self->_liveRenderingOverrideColor CGColor]);
    }
    if (![(NSMutableArray *)self->_fadeOutStrokeAnimations count]
      && ![(NSMutableArray *)self->_particlesToDestinationAnimations count]
      && ![(NSMutableArray *)self->_fadeOutStrokeAnimations count]
      && !self->_alternativeStrokesAnimation
      && !self->_liveRenderingOverrideColorAnimation
      && ![(NSMutableArray *)self->_transformStrokesAnimations count])
    {
      [(PKTiledCanvasView *)self setLiveAnimationStartTime:0.0];
      double v27 = [(PKTiledCanvasView *)self delegate];
      char v28 = objc_opt_respondsToSelector();

      if (v28)
      {
        uint64_t v29 = [(PKTiledCanvasView *)self delegate];
        [v29 canvasViewDidFinishAnimatingStrokes:self];
      }
    }
    if ([v33 count])
    {
      strokeRenderCachesToPurge = self->_strokeRenderCachesToPurge;
      if (!strokeRenderCachesToPurge)
      {
        objc_msgSend(*(id *)(v6 + 2632), "arrayWithCapacity:", objc_msgSend(v33, "count"));
        uint64_t v31 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
        uint64_t v32 = self->_strokeRenderCachesToPurge;
        self->_strokeRenderCachesToPurge = v31;

        strokeRenderCachesToPurge = self->_strokeRenderCachesToPurge;
      }
      [(NSMutableArray *)strokeRenderCachesToPurge addObjectsFromArray:v33];
    }
  }
}

- (void)testHideOldestStroke
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = [(PKTiledCanvasView *)self _drawingController];
  id v4 = -[PKController renderedStrokes](v3);
  double v5 = (void *)[v4 copy];

  if ([v5 count])
  {
    unint64_t v6 = [v5 firstObject];
    v8[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [(PKTiledCanvasView *)self fadeOutAndHideStrokes:v7 duration:0.3];
  }
}

- (void)fadeOutAndHideStrokes:(id)a3 duration:(double)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = CACurrentMediaTime();
  [(PKTiledCanvasView *)self liveAnimationStartTime];
  if (v8 == 0.0) {
    [(PKTiledCanvasView *)self setLiveAnimationStartTime:v7];
  }
  double v19 = [(PKTiledCanvasView *)self _strokeUUIDsForStrokes:v6];
  double v9 = [(PKTiledCanvasView *)self strokeUUIDsAboutToBeRemoved];
  [v9 unionSet:v19];

  id v10 = [(PKTiledCanvasView *)self _drawingController];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke;
  v25[3] = &unk_1E64C5870;
  v25[4] = self;
  id v20 = v19;
  id v26 = v20;
  -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v10, v6, v25);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v11);
        }
        double v15 = [[PKFadeOutStrokeAnimation alloc] initWithStroke:*(void *)(*((void *)&v21 + 1) + 8 * i) startTime:v7 duration:a4];
        fadeOutStrokeAnimations = self->_fadeOutStrokeAnimations;
        if (!fadeOutStrokeAnimations)
        {
          uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
          uint64_t v18 = self->_fadeOutStrokeAnimations;
          self->_fadeOutStrokeAnimations = v17;

          fadeOutStrokeAnimations = self->_fadeOutStrokeAnimations;
        }
        [(NSMutableArray *)fadeOutStrokeAnimations addObject:v15];
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v12);
  }

  [(PKTiledCanvasView *)self setNeedsDrawingDisplay];
}

void __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke_2;
  void v2[3] = &unk_1E64C5870;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

void __52__PKTiledCanvasView_fadeOutAndHideStrokes_duration___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) strokeUUIDsAboutToBeRemoved];
  [v2 minusSet:*(void *)(a1 + 40)];
}

- (void)removeStuckStrokesAndSimulateCrashIfNecessary
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v13 = [(PKTiledCanvasView *)self _drawingController];
  id v3 = -[PKController renderedStrokes](v13);
  if ([v3 count])
  {
    id v4 = [(PKTiledCanvasView *)self drawing];
    int v5 = [v4 _isEmpty];

    if (v5)
    {
      id v6 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v10 = [(PKTiledCanvasView *)self _drawingController];
        id v11 = -[PKController renderedStrokes](v10);
        uint64_t v12 = +[PKDrawing _uuidDescriptionForStrokes:v11];
        *(_DWORD *)buf = 138412290;
        double v15 = v12;
        _os_log_fault_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_FAULT, "Detected stuck strokes on canvas (<rdar://problem/50709761>): %@", buf, 0xCu);
      }
      double v7 = [(PKTiledCanvasView *)self _drawingController];
      double v8 = [(PKTiledCanvasView *)self _drawingController];
      double v9 = -[PKController renderedStrokes](v8);
      -[PKController hideStrokesWithoutUpdating:completion:]((uint64_t)v7, v9, 0);
    }
  }
  else
  {
  }
}

- (CGSize)_metalViewDrawableSize
{
  [(PKTiledCanvasView *)self setupMetalViewIfNecessary];
  metalView = self->_metalView;
  if (metalView)
  {
    [(CAMetalLayer *)metalView->_metalLayer drawableSize];
  }
  else
  {
    double v5 = 0.0;
    double v4 = 0.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (CGSize)_rendererControllerPixelSize
{
  [(PKTiledCanvasView *)self setupMetalViewIfNecessary];
  id v3 = [(PKTiledCanvasView *)self _rendererController];
  if (v3)
  {
    double v5 = v3[13];
    double v4 = v3[14];
  }
  else
  {
    double v4 = 0.0;
    double v5 = 0.0;
  }

  double v6 = v5;
  double v7 = v4;
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (void)setCanvasOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  self->_canvasOffset = a3;
  id v5 = [(PKTiledCanvasView *)self _rendererController];
  [(PKMetalRendererController *)(uint64_t)v5 setCanvasOffset:y];
}

- (id)shapeDrawingControllerRendererController:(id)a3
{
  id v3 = [(PKTiledCanvasView *)self _rendererController];

  return v3;
}

- (void)shapeDrawingControllerShapeGestureDetected:(id)a3 isFastGesture:(BOOL)a4
{
  if (!self->_combiningStrokesCount)
  {
    BOOL v4 = a4;
    [(PKTiledCanvasView *)self _finishCombiningStrokesIfNecessary];
    double v6 = [(PKTiledCanvasView *)self strokeGenerator];
    char v7 = [v6 isSnappedToRuler];

    if (v7)
    {
      double v8 = 0;
    }
    else
    {
      double v9 = [(PKTiledCanvasView *)self shapeDrawingController];
      [(PKTiledCanvasView *)self _inputScale];
      double v11 = v10;
      uint64_t v12 = [(PKTiledCanvasView *)self shapeDrawingController];
      id v13 = (void *)v12;
      if (v12) {
        [(PKAveragePointGenerator *)*(void *)(v12 + 120) currentInputPoint];
      }
      else {
        memset(v33, 0, sizeof(v33));
      }
      if (v4) {
        double v14 = &unk_1F200EB08;
      }
      else {
        double v14 = 0;
      }
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __78__PKTiledCanvasView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke;
      v32[3] = &unk_1E64C64B0;
      v32[4] = self;
      double v8 = -[PKShapeDrawingController detectedShapeWithInputScale:averageInputPoint:allowedShapeTypes:createCurrentStrokeBlock:]((uint64_t)v9, v33, v14, v32, v11);

      if (v8)
      {
        double v15 = CACurrentMediaTime();
        [(PKTiledCanvasView *)self liveAnimationStartTime];
        if (v16 == 0.0) {
          [(PKTiledCanvasView *)self setLiveAnimationStartTime:v15];
        }
        if ([v8 type] != 13)
        {
          uint64_t v17 = [PKAlternativeStrokesAnimation alloc];
          uint64_t v18 = [v8 strokes];
          double v19 = -[PKAlternativeStrokesAnimation initWithStrokes:shape:startTime:fadeDuration:]((id *)&v17->super.isa, v18, v8, v15, 0.15);
          [(PKTiledCanvasView *)self setAlternativeStrokesAnimation:v19];
        }
        id v20 = [(PKTiledCanvasView *)self shapeDrawingController];
        -[PKShapeDrawingController setDetectedShape:]((uint64_t)v20, v8);

        if (_os_feature_enabled_impl())
        {
          long long v21 = os_log_create("com.apple.pencilkit", "Feedback");
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v31[0]) = 0;
            _os_log_impl(&dword_1C44F8000, v21, OS_LOG_TYPE_DEFAULT, "[Canvas Feedback Event] shape recognized.", (uint8_t *)v31, 2u);
          }

          uint64_t v22 = [(PKTiledCanvasView *)self shapeDrawingController];
          long long v23 = (void *)v22;
          if (v22)
          {
            [(PKAveragePointGenerator *)*(void *)(v22 + 120) currentInputPoint];
            double v25 = *(double *)v31;
            double v24 = *(double *)&v31[1];
          }
          else
          {
            double v24 = 0.0;
            double v25 = 0.0;
          }

          id v26 = [(_UICanvasFeedbackGenerator *)self->_feedbackGenerator view];
          -[PKTiledCanvasView convertPoint:toView:](self, "convertPoint:toView:", v26, v25, v24);
          double v28 = v27;
          double v30 = v29;

          -[_UICanvasFeedbackGenerator pathCompletedAtLocation:](self->_feedbackGenerator, "pathCompletedAtLocation:", v28, v30);
        }
      }
    }
  }
}

id __78__PKTiledCanvasView_shapeDrawingControllerShapeGestureDetected_isFastGesture___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) strokeGenerator];
  id v2 = (void *)[v1 newStrokeWithCurrentData];

  return v2;
}

- (void)shapeDrawingControllerShapeDetectionCancelled:(id)a3
{
  BOOL v4 = [(PKTiledCanvasView *)self shapeDrawingController];
  -[PKShapeDrawingController setDetectedShape:]((uint64_t)v4, 0);

  [(PKTiledCanvasView *)self _endAlternativeStrokeIfNecessaryAccepted:0];
}

- (int64_t)shapeDrawingControllerMaximumSupportedContentVersion:(id)a3
{
  if ((*((_WORD *)&self->_canvasViewFlags + 8) & 0x400) == 0) {
    return 3;
  }
  id v5 = [(PKTiledCanvasView *)self delegate];
  int64_t v3 = [v5 canvasViewMaximumSupportedContentVersion:self];

  return v3;
}

- (void)setIsPDFCanvasForAnalytics:(BOOL)a3
{
  self->_isPDFCanvasForAnalytics = a3;
  id v4 = [(PKTiledCanvasView *)self _rendererController];
  -[PKMetalRendererController setIsPDFCanvasForAnalytics:]((uint64_t)v4, a3);
}

- (void)strokeGeneratorDidSnapToRuler:(id)a3
{
  if (_os_feature_enabled_impl())
  {
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    void v4[2] = __51__PKTiledCanvasView_strokeGeneratorDidSnapToRuler___block_invoke;
    v4[3] = &unk_1E64C5E70;
    objc_copyWeak(&v5, &location);
    dispatch_async(MEMORY[0x1E4F14428], v4);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __51__PKTiledCanvasView_strokeGeneratorDidSnapToRuler___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = os_log_create("com.apple.pencilkit", "Feedback");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "[Canvas Feedback Event] snap-to-ruler recognized.", (uint8_t *)&v12, 2u);
    }

    int64_t v3 = [WeakRetained strokeGenerator];
    id v4 = v3;
    if (v3)
    {
      [v3 _latestStrokePoint];
      double v6 = *((double *)&v12 + 1);
      double v5 = *(double *)&v13;
    }
    else
    {
      uint64_t v17 = 0;
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      long long v12 = 0u;
      double v5 = 0.0;
      double v6 = 0.0;
    }

    char v7 = [WeakRetained[54] view];
    objc_msgSend(WeakRetained, "convertPoint:toView:", v7, v6, v5);
    double v9 = v8;
    double v11 = v10;

    objc_msgSend(WeakRetained[54], "snappingOccurredAtLocation:", v9, v11);
  }
}

- (BOOL)shapeDrawingController:(id)a3 scratchOutStrokesCoveredByStroke:(id)a4
{
  id v5 = a4;
  uint64_t v29 = 0;
  double v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__171;
  id v33 = __Block_byref_object_dispose__172;
  double v6 = [(PKTiledCanvasView *)self delegate];
  char v7 = [(PKTiledCanvasView *)self drawing];
  id v34 = [v6 canvasView:self attachmentViewForDrawing:v7];

  uint64_t v23 = 0;
  double v24 = &v23;
  uint64_t v25 = 0x3032000000;
  id v26 = __Block_byref_object_copy__171;
  double v27 = __Block_byref_object_dispose__172;
  scratchOutController = self->_scratchOutController;
  double v9 = (void *)v30[5];
  double v10 = [(PKTiledCanvasView *)self drawing];
  -[PKScratchOutController intersectedStrokesForStroke:attachmentView:drawing:]((uint64_t)scratchOutController, v5, v9, v10);
  id v28 = (id)objc_claimAutoreleasedReturnValue();

  if ([(id)v24[5] count])
  {
    double v11 = self->_scratchOutController;
    long long v12 = [(id)v24[5] allObjects];
    long long v13 = -[PKScratchOutController intersectedStrokesFilteredByCoverageThresholdForStroke:intersectedStrokes:]((uint64_t)v11, v5, v12);

    uint64_t v14 = [v13 count];
    BOOL v15 = v14 != 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke;
    aBlock[3] = &unk_1E64C65F0;
    objc_copyWeak(&v21, &location);
    void aBlock[4] = self;
    void aBlock[5] = &v23;
    aBlock[6] = &v29;
    long long v16 = _Block_copy(aBlock);
    if (v14)
    {
      uint64_t v17 = [(PKTiledCanvasView *)self delegate];
      uint64_t v18 = [(PKTiledCanvasView *)self drawing];
      [v17 canvasView:self textStrokesCoveredByStroke:v5 drawing:v18 completion:v16];
    }
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
  else
  {
    BOOL v15 = 0;
  }
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

void __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke(uint64_t a1, void *a2, void *a3, char a4)
{
  id v7 = a2;
  id v8 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke_2;
  block[3] = &unk_1E64C65C8;
  objc_copyWeak(&v16, (id *)(a1 + 56));
  id v12 = v7;
  id v13 = v8;
  long long v14 = *(_OWORD *)(a1 + 32);
  char v17 = a4;
  uint64_t v15 = *(void *)(a1 + 48);
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v16);
}

void __77__PKTiledCanvasView_shapeDrawingController_scratchOutStrokesCoveredByStroke___block_invoke_2(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 72));
  int64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained scratchOutController];
    id v5 = -[PKScratchOutController nonTextStrokeIntersectionBetweenAllStrokes:textStrokesToDelete:textStrokesToKeep:](v4, *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(void **)(a1 + 32), *(void **)(a1 + 40));

    double v6 = [v3 drawingGestureRecognizer];
    [v6 setState:5];

    [*(id *)(a1 + 48) drawingCancelled];
    id v7 = [v3 scratchOutController];
    id v8 = v7;
    if (v7 && v7[8] && *(unsigned char *)(a1 + 80))
    {
      id v9 = [v3 selectionController];
      id v10 = -[PKSelectionController selectionInteraction](v9);
      double v11 = [v10 delegate];
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = os_log_create("com.apple.pencilkit", "Actions");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v14 = [*(id *)(a1 + 32) count];
          int v28 = 134218240;
          uint64_t v29 = v14;
          __int16 v30 = 2048;
          uint64_t v31 = [v5 count];
          _os_log_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEFAULT, "Scratch Out recognized only text strokes, trigger Reflow with %lu text strokes and %lu non-text strokes.", (uint8_t *)&v28, 0x16u);
        }

        if (![v5 count]) {
          goto LABEL_20;
        }
        uint64_t v15 = [v3 selectionController];
        id v16 = -[PKSelectionController selectionInteraction](v15);
        char v17 = [v16 delegate];
        char v18 = objc_opt_respondsToSelector();

        if (v18)
        {
          double v19 = [v3 selectionController];
          id v20 = -[PKSelectionController selectionInteraction](v19);
          id v21 = [v20 delegate];
          uint64_t v22 = [v3 selectionController];
          uint64_t v23 = -[PKSelectionController selectionInteraction](v22);
          [v21 selectionInteraction:v23 handleDeleteForTextStrokes:*(void *)(a1 + 32) nonTextStrokes:v5 inAttachment:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        }
        else
        {
LABEL_20:
          double v19 = [v3 selectionController];
          id v20 = -[PKSelectionController selectionInteraction](v19);
          id v21 = [v20 delegate];
          uint64_t v22 = [v3 selectionController];
          uint64_t v23 = -[PKSelectionController selectionInteraction](v22);
          [v21 selectionInteraction:v23 handleDeleteForTextStrokes:*(void *)(a1 + 32) inAttachment:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
        }

LABEL_18:
        goto LABEL_19;
      }
    }
    else
    {
    }
    double v24 = os_log_create("com.apple.pencilkit", "Actions");
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEFAULT, "Scratch Out recognized a mix of text and drawing strokes, do not trigger Reflow.", (uint8_t *)&v28, 2u);
    }

    uint64_t v25 = [v5 mutableCopy];
    id v26 = v3[100];
    v3[100] = (id)v25;

    if (((_WORD)v3[56] & 0x2000) != 0 && [v3[100] count])
    {
      double v27 = [v3 delegate];
      [v27 _canvasViewDidEraseStrokes:v3[100]];
    }
    [v3 eraserEnded:0];
    [v3 setIsScratchOutPending:1];
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_postAXAnnouncement:(id)a3
{
}

- (void)_postBeganErasingAXAnnouncement
{
  if (![(PKTiledCanvasView *)self disableAXDrawingAnnouncements])
  {
    _PencilKitBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v3 = [v4 localizedStringForKey:@"Began erasing" value:@"Began erasing" table:@"Localizable"];
    [(PKTiledCanvasView *)self _postAXAnnouncement:v3];
  }
}

- (void)_postEndedErasingAXAnnouncement
{
  if (![(PKTiledCanvasView *)self disableAXDrawingAnnouncements])
  {
    _PencilKitBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v3 = [v4 localizedStringForKey:@"Ended erasing" value:@"Ended erasing" table:@"Localizable"];
    [(PKTiledCanvasView *)self _postAXAnnouncement:v3];
  }
}

- (void)_postBeganSketchingAXAnnouncement
{
  if (![(PKTiledCanvasView *)self disableAXDrawingAnnouncements])
  {
    _PencilKitBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v3 = [v4 localizedStringForKey:@"Began sketching" value:@"Began sketching" table:@"Localizable"];
    [(PKTiledCanvasView *)self _postAXAnnouncement:v3];
  }
}

- (void)_postEndedSketchingAXAnnouncement
{
  if (![(PKTiledCanvasView *)self disableAXDrawingAnnouncements])
  {
    _PencilKitBundle();
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    int64_t v3 = [v4 localizedStringForKey:@"Ended sketching" value:@"Ended sketching" table:@"Localizable"];
    [(PKTiledCanvasView *)self _postAXAnnouncement:v3];
  }
}

- (BOOL)_hasStrokeTransformChanged
{
  if ([(PKTiledCanvasView *)self isDrawing])
  {
    [(PKTiledCanvasView *)self scaledStrokeTransform];
    memset(v11, 0, sizeof(v11));
    int64_t v3 = [(PKTiledCanvasView *)self _rendererController];
    id v4 = v3;
    if (v3)
    {
      long long v5 = v3[44];
      long long v8 = v3[43];
      long long v9 = v5;
      long long v10 = v3[45];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    BOOL v6 = !DKDNearlyEqualTransforms((double *)v11, (double *)&v8);
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_previewDrawingBegan:(id *)a3 tiledViewLocation:(CGPoint)a4 disableDetachedRendering:(BOOL)a5
{
  BOOL v5 = a5;
  double y = a4.y;
  double x = a4.x;
  [(PKTiledCanvasView *)self setIsPreviewing:1];
  long long v10 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "Began preview drawing", buf, 2u);
  }

  long long v11 = *(_OWORD *)&a3->var9;
  v15[4] = *(_OWORD *)&a3->var7;
  v15[5] = v11;
  long long v12 = *(_OWORD *)&a3->var13;
  v15[6] = *(_OWORD *)&a3->var11;
  v15[7] = v12;
  long long v13 = *(_OWORD *)&a3->var1;
  v15[0] = a3->var0;
  v15[1] = v13;
  long long v14 = *(_OWORD *)&a3->var5;
  v15[2] = *(_OWORD *)&a3->var3;
  v15[3] = v14;
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", 0, v15, 1, v5, 23, 1, x, y);
}

- (void)_previewDrawingMoved:(id *)a3 tiledViewLocation:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  long long v8 = [(PKTiledCanvasView *)self rulerController];
  int v9 = -[PKRulerController rulerSelected]((uint64_t)v8);

  if (v9)
  {
    long long v10 = [(PKTiledCanvasView *)self rulerController];
    long long v11 = [(PKTiledCanvasView *)self _touchView];
    [(PKRulerController *)(uint64_t)v10 drawingMoved:x coordinateSystem:y];
  }
  long long v12 = [(PKTiledCanvasView *)self strokeGenerator];
  long long v13 = *(_OWORD *)&a3->var9;
  v23[4] = *(_OWORD *)&a3->var7;
  v23[5] = v13;
  long long v14 = *(_OWORD *)&a3->var13;
  v23[6] = *(_OWORD *)&a3->var11;
  v23[7] = v14;
  long long v15 = *(_OWORD *)&a3->var1;
  v23[0] = a3->var0;
  v23[1] = v15;
  long long v16 = *(_OWORD *)&a3->var5;
  v23[2] = *(_OWORD *)&a3->var3;
  v23[3] = v16;
  [v12 addPoint:v23];

  char v17 = [(PKTiledCanvasView *)self _rendererController];
  long long v18 = *(_OWORD *)&a3->var9;
  v22[4] = *(_OWORD *)&a3->var7;
  v22[5] = v18;
  long long v19 = *(_OWORD *)&a3->var13;
  v22[6] = *(_OWORD *)&a3->var11;
  v22[7] = v19;
  long long v20 = *(_OWORD *)&a3->var1;
  v22[0] = (__int128)a3->var0;
  v22[1] = v20;
  long long v21 = *(_OWORD *)&a3->var5;
  v22[2] = *(_OWORD *)&a3->var3;
  _OWORD v22[3] = v21;
  -[PKMetalRendererController addInputPoint:]((uint64_t)v17, v22);
}

- (void)_previewDrawingEnded
{
  [(PKTiledCanvasView *)self setIsPreviewing:0];
  int64_t v3 = [(PKTiledCanvasView *)self strokeGenerator];
  [v3 setIsPreviewing:0];

  id v4 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEFAULT, "Ended preview drawing", v5, 2u);
  }

  [(PKTiledCanvasView *)self drawingCancelledForPreview:1];
}

- (void)_replayDrawingBegan:(id *)a3
{
  id v4 = [(PKTiledCanvasView *)self _touchView];
  [(PKTiledCanvasView *)self _replayDrawingBegan:&v5 coordinateSpace:v4 activeInputProperties:23 inputType:1];
}

- (void)_replayDrawingBegan:(id *)a3 coordinateSpace:(id)a4 activeInputProperties:(unint64_t)a5 inputType:(int64_t)a6
{
  id v10 = a4;
  self->_replayInputType = a6;
  PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v10, self, v22);
  long long v11 = v22[1];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.double a = v22[0];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v11;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tdouble x = v22[2];
  long long v12 = [(PKTiledCanvasView *)self _touchView];
  objc_msgSend(v12, "convertPoint:fromCoordinateSpace:", v10, a3->var0.var0.x, a3->var0.var0.y);
  double v14 = v13;
  double v16 = v15;

  long long v17 = *(_OWORD *)&a3->var9;
  v21[4] = *(_OWORD *)&a3->var7;
  v21[5] = v17;
  long long v18 = *(_OWORD *)&a3->var13;
  v21[6] = *(_OWORD *)&a3->var11;
  v21[7] = v18;
  long long v19 = *(_OWORD *)&a3->var1;
  v21[0] = a3->var0;
  v21[1] = v19;
  long long v20 = *(_OWORD *)&a3->var5;
  v21[2] = *(_OWORD *)&a3->var3;
  v21[3] = v20;
  -[PKTiledCanvasView _drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:](self, "_drawingBegan:inputPoint:locationInView:forPreview:disableDetachedRendering:activeInputProperties:inputType:", 0, v21, 0, 0, a5, a6, v14, v16);
}

- (void)_replayDrawingMoved:(id *)a3
{
  id v4 = [(PKTiledCanvasView *)self _touchView];
  [(PKTiledCanvasView *)self _replayDrawingMoved:&v5 coordinateSpace:v4];
}

- (void)_replayDrawingMoved:(id *)a3 coordinateSpace:(id)a4
{
  id v6 = a4;
  id v7 = [(PKTiledCanvasView *)self strokeGenerator];
  uint64_t v8 = [v7 inputType];

  if (v8 == 1)
  {
    int v9 = +[PKPencilDevice activePencil];
    [v9 tagAsUsed];
  }
  id v10 = [(PKTiledCanvasView *)self strokeGenerator];
  long long v11 = *(_OWORD *)&a3->var9;
  void v58[4] = *(_OWORD *)&a3->var7;
  v58[5] = v11;
  long long v12 = *(_OWORD *)&a3->var13;
  v58[6] = *(_OWORD *)&a3->var11;
  v58[7] = v12;
  long long v13 = *(_OWORD *)&a3->var1;
  v58[0] = a3->var0;
  v58[1] = v13;
  long long v14 = *(_OWORD *)&a3->var5;
  v58[2] = *(_OWORD *)&a3->var3;
  v58[3] = v14;
  [v10 addPoint:v58];

  double v15 = [(PKTiledCanvasView *)self _rendererController];
  long long v16 = *(_OWORD *)&a3->var9;
  v57[4] = *(_OWORD *)&a3->var7;
  v57[5] = v16;
  long long v17 = *(_OWORD *)&a3->var13;
  v57[6] = *(_OWORD *)&a3->var11;
  v57[7] = v17;
  long long v18 = *(_OWORD *)&a3->var1;
  v57[0] = (__int128)a3->var0;
  v57[1] = v18;
  long long v19 = *(_OWORD *)&a3->var5;
  v57[2] = *(_OWORD *)&a3->var3;
  v57[3] = v19;
  -[PKMetalRendererController addInputPoint:]((uint64_t)v15, v57);

  if ((*(_WORD *)&self->_canvasViewFlags & 0x200) != 0)
  {
    long long v20 = [(PKTiledCanvasView *)self delegate];
    long long v21 = *(_OWORD *)&a3->var9;
    v56[4] = *(_OWORD *)&a3->var7;
    v56[5] = v21;
    long long v22 = *(_OWORD *)&a3->var13;
    v56[6] = *(_OWORD *)&a3->var11;
    v56[7] = v22;
    long long v23 = *(_OWORD *)&a3->var1;
    v56[0] = a3->var0;
    v56[1] = v23;
    long long v24 = *(_OWORD *)&a3->var5;
    v56[2] = *(_OWORD *)&a3->var3;
    v56[3] = v24;
    [v20 replayCanvasViewDrawingMoved:self inputPoint:v56 inputType:self->_replayInputType];
  }
  if (!a3->var8)
  {
    uint64_t v25 = [(PKTiledCanvasView *)self shapeDrawingController];
    if (v25)
    {
      uint64_t v27 = v25[1];
      uint64_t v26 = v25[2];

      if (v26 == v27) {
        goto LABEL_10;
      }
      double x = a3->var0.var0.x;
      double y = a3->var0.var0.y;
      __int16 v30 = [(PKTiledCanvasView *)self window];
      objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v30, x, y);
      CGFloat v32 = v31;
      CGFloat v34 = v33;

      CGAffineTransform v35 = [(PKTiledCanvasView *)self shapeDrawingController];
      long long v36 = *(_OWORD *)&a3->var9;
      v55[4] = *(_OWORD *)&a3->var7;
      v55[5] = v36;
      long long v37 = *(_OWORD *)&a3->var13;
      v55[6] = *(_OWORD *)&a3->var11;
      v55[7] = v37;
      long long v38 = *(_OWORD *)&a3->var1;
      v55[0] = a3->var0;
      v55[1] = v38;
      long long v39 = *(_OWORD *)&a3->var5;
      v55[2] = *(_OWORD *)&a3->var3;
      v55[3] = v39;
      [(PKShapeDrawingController *)(uint64_t)v35 addStrokePoint:v32 inputPoint:v34];
    }
    else
    {
      CGAffineTransform v35 = 0;
    }

LABEL_10:
    if (!a3->var8)
    {
      BOOL v40 = [(PKTiledCanvasView *)self ink];
      int v41 = [v40 _isEraserInk];

      if (v41) {
        -[PKTiledCanvasView _notifyEraserMoved:location:](self, "_notifyEraserMoved:location:", 0, a3->var0.var0.x, a3->var0.var0.y);
      }
      double v42 = a3->var0.var0.x;
      double v43 = a3->var0.var0.y;
      id v44 = [(PKTiledCanvasView *)self _touchView];
      objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v44, v42, v43);
      double v46 = v45;
      double v48 = v47;

      uint64_t v49 = [(PKTiledCanvasView *)self rulerController];
      int v50 = -[PKRulerController rulerSelected]((uint64_t)v49);

      if (v50)
      {
        long long v51 = [(PKTiledCanvasView *)self rulerController];
        char v52 = [(PKTiledCanvasView *)self _touchView];
        [(PKRulerController *)(uint64_t)v51 drawingMoved:v46 coordinateSystem:v48];
      }
      long long v53 = [(PKTiledCanvasView *)self powerSavingController];
      if (v53)
      {
        double v54 = v53[6] + sqrt((v53[5] - v48) * (v53[5] - v48) + (v53[4] - v46) * (v53[4] - v46));
        v53[5] = v48;
        v53[6] = v54;
        v53[4] = v46;
      }
    }
  }
}

- (void)_replayDrawingEnded
{
}

- (void)_replayDrawingEndedWithBackgroundQueueCompletion:(id)a3
{
}

- (void)_replayDrawingEndedEstimatesTimeout:(double)a3 withBackgroundQueueCompletion:(id)a4
{
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&self->__replayCoordinateSystemTransform.double a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v5;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tdouble x = v4;
  [(PKTiledCanvasView *)self _drawingEnded:0 estimatesTimeout:a4 completion:a3];
}

- (void)_replayDrawingCancelled
{
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  *(_OWORD *)&self->__replayCoordinateSystemTransform.double a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&self->__replayCoordinateSystemTransform.c = v4;
  *(_OWORD *)&self->__replayCoordinateSystemTransform.tdouble x = v3;
  long long v5 = [(PKTiledCanvasView *)self _drawingController];
  id v6 = -[PKController renderedStrokes](v5);
  [(PKTiledCanvasView *)self fadeOutAndHideStrokes:v6 duration:0.0];

  [(PKTiledCanvasView *)self cancelPurgeResourcesBlock];

  [(PKTiledCanvasView *)self drawingCancelled];
}

- (void)_replayEstimatedPropertiesUpdated:(id *)a3
{
  long long v4 = [(PKTiledCanvasView *)self strokeGenerator];
  long long v5 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v5;
  long long v6 = *(_OWORD *)&a3->var13;
  id v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = v6;
  long long v7 = *(_OWORD *)&a3->var1;
  v9[0] = a3->var0;
  v9[1] = v7;
  long long v8 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v8;
  [v4 drawingUpdatePoint:v9];
}

- (CAMetalLayer)metalLayer
{
  id v2 = [(PKTiledCanvasView *)self metalView];
  long long v3 = -[PKMetalView metalLayer](v2);

  return (CAMetalLayer *)v3;
}

- (PKTiledCanvasViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PKTiledCanvasViewDelegate *)WeakRetained;
}

- (PKLinedPaper)linedPaper
{
  return self->_linedPaper;
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (BOOL)hasVisibleStrokes
{
  return self->_hasVisibleStrokes;
}

- (BOOL)useLuminanceColorFilter
{
  return self->_useLuminanceColorFilter;
}

- (BOOL)isUnderBlendedContent
{
  return self->_isUnderBlendedContent;
}

- (BOOL)captureLiveData
{
  return self->_captureLiveData;
}

- (BOOL)generateLiveDrawing
{
  return self->_generateLiveDrawing;
}

- (void)setGenerateLiveDrawing:(BOOL)a3
{
  self->_generateLiveDrawing = a3;
}

- (UIColor)liveRenderingOverrideColor
{
  return self->_liveRenderingOverrideColor;
}

- (PKSelectionController)selectionController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_selectionController);

  return (PKSelectionController *)WeakRetained;
}

- (PKMetalConfig)metalConfig
{
  return self->_metalConfig;
}

- (BOOL)isErasingObjects
{
  return self->_isErasingObjects;
}

- (void)setIsErasingObjects:(BOOL)a3
{
  self->_isErasingObjects = a3;
}

- (double)latestRenderTimestamp
{
  return self->_latestRenderTimestamp;
}

- (BOOL)predictionDisabled
{
  return self->_predictionDisabled;
}

- (void)setPredictionDisabled:(BOOL)a3
{
  self->_predictionDisabled = a3;
}

- (double)metalLayerContentsScaleOverride
{
  return self->_metalLayerContentsScaleOverride;
}

- (CGAffineTransform)paperTransform
{
  long long v3 = *(_OWORD *)&self[21].c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[21].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[21].tx;
  return self;
}

- (BOOL)enableCanvasOffsetSupport
{
  return self->_enableCanvasOffsetSupport;
}

- (void)setEnableCanvasOffsetSupport:(BOOL)a3
{
  self->_enableCanvasOffsetSupport = a3;
}

- (CGPoint)canvasOffset
{
  double x = self->_canvasOffset.x;
  double y = self->_canvasOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)viewScissor
{
  double x = self->_viewScissor.origin.x;
  double y = self->_viewScissor.origin.y;
  double width = self->_viewScissor.size.width;
  double height = self->_viewScissor.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)liveStrokeMode
{
  return self->_liveStrokeMode;
}

- (CGSize)liveStrokeMaxSize
{
  double width = self->_liveStrokeMaxSize.width;
  double height = self->_liveStrokeMaxSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)resourceCacheSize
{
  return self->_resourceCacheSize;
}

- (BOOL)disableAXDrawingAnnouncements
{
  return self->_disableAXDrawingAnnouncements;
}

- (void)setDisableAXDrawingAnnouncements:(BOOL)a3
{
  self->_disableAXDrawingAnnouncements = a3;
}

- (PKDrawing)currentDrawingBeingCopiedToCanvas
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentDrawingBeingCopiedToCanvas);

  return (PKDrawing *)WeakRetained;
}

- (CGAffineTransform)_replayCoordinateSystemTransform
{
  long long v3 = *(_OWORD *)&self[22].c;
  *(_OWORD *)&retstr->double a = *(_OWORD *)&self[22].a;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[22].tx;
  return self;
}

- (BOOL)isPDFCanvasForAnalytics
{
  return self->_isPDFCanvasForAnalytics;
}

- (void)setMetalView:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (BOOL)shouldPause
{
  return self->_shouldPause;
}

- (void)setShouldPause:(BOOL)a3
{
  self->_shouldPause = a3;
}

- (BOOL)usePrivateResourceHandler
{
  return self->_usePrivateResourceHandler;
}

- (void)setUsePrivateResourceHandler:(BOOL)a3
{
  self->_usePrivateResourceHandler = a3;
}

- (BOOL)singleComponent
{
  return self->_singleComponent;
}

- (void)setSingleComponent:(BOOL)a3
{
  self->_singleComponent = a3;
}

- (PKMetalFramebuffer)snapshotFramebuffer
{
  return self->_snapshotFramebuffer;
}

- (void)setSnapshotFramebuffer:(id)a3
{
}

- (int64_t)maxNumPredictionPoints
{
  return self->_maxNumPredictionPoints;
}

- (void)setMaxNumPredictionPoints:(int64_t)a3
{
  self->_maxNumPredictionPoints = a3;
}

- (double)drawingStartTimestamp
{
  return self->_drawingStartTimestamp;
}

- (void)setDrawingStartTimestamp:(double)a3
{
  self->_drawingStartTimestamp = a3;
}

- (PKDrawingPowerSavingController)powerSavingController
{
  return self->_powerSavingController;
}

- (void)setPowerSavingController:(id)a3
{
}

- (CGPoint)_oldEraseLocation
{
  double x = self->__oldEraseLocation.x;
  double y = self->__oldEraseLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)set_oldEraseLocation:(CGPoint)a3
{
  self->__oldEraseLocatiouint64_t n = a3;
}

- (NSMutableArray)strokesToErase
{
  return self->_strokesToErase;
}

- (void)setStrokesToErase:(id)a3
{
}

- (NSMutableSet)strokeIDsToErase
{
  return self->_strokeIDsToErase;
}

- (void)setStrokeIDsToErase:(id)a3
{
}

- (NSMutableArray)particlesToDestinationAnimations
{
  return self->_particlesToDestinationAnimations;
}

- (void)setParticlesToDestinationAnimations:(id)a3
{
}

- (NSMutableArray)transformStrokesAnimations
{
  return self->_transformStrokesAnimations;
}

- (void)setTransformStrokesAnimations:(id)a3
{
}

- (double)liveAnimationStartTime
{
  return self->_liveAnimationStartTime;
}

- (NSMutableArray)fadeOutStrokeAnimations
{
  return self->_fadeOutStrokeAnimations;
}

- (void)setFadeOutStrokeAnimations:(id)a3
{
}

- (PKAlternativeStrokesAnimation)alternativeStrokesAnimation
{
  return self->_alternativeStrokesAnimation;
}

- (void)setAlternativeStrokesAnimation:(id)a3
{
}

- (NSMutableSet)strokeUUIDsAboutToBeRemoved
{
  return self->_strokeUUIDsAboutToBeRemoved;
}

- (void)setStrokeUUIDsAboutToBeRemoved:(id)a3
{
}

- (NSMutableArray)strokeRenderCachesToPurge
{
  return self->_strokeRenderCachesToPurge;
}

- (void)setStrokeRenderCachesToPurge:(id)a3
{
}

- (PKInterpolateColorAnimation)liveRenderingOverrideColorAnimation
{
  return self->_liveRenderingOverrideColorAnimation;
}

- (void)setLiveRenderingOverrideColorAnimation:(id)a3
{
}

- (PKShapeDrawingController)shapeDrawingController
{
  return self->_shapeDrawingController;
}

- (void)setShapeDrawingController:(id)a3
{
}

- (PKScratchOutController)scratchOutController
{
  return self->_scratchOutController;
}

- (void)setScratchOutController:(id)a3
{
}

- (PKInk)sixChannelInk
{
  return self->_sixChannelInk;
}

- (void)setSixChannelInk:(id)a3
{
}

- (BOOL)isScratchOutPending
{
  return self->_isScratchOutPending;
}

- (void)setIsScratchOutPending:(BOOL)a3
{
  self->_isScratchOutPending = a3;
}

- (BOOL)isPreviewing
{
  return self->_isPreviewing;
}

- (void)setIsPreviewing:(BOOL)a3
{
  self->_isPreviewing = a3;
}

- (UIGestureRecognizer)allowSimultaneousGR
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_allowSimultaneousGR);

  return (UIGestureRecognizer *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_allowSimultaneousGR);
  objc_storeStrong((id *)&self->_sixChannelInk, 0);
  objc_storeStrong((id *)&self->_scratchOutController, 0);
  objc_storeStrong((id *)&self->_shapeDrawingController, 0);
  objc_storeStrong((id *)&self->_liveRenderingOverrideColorAnimation, 0);
  objc_storeStrong((id *)&self->_strokeRenderCachesToPurge, 0);
  objc_storeStrong((id *)&self->_strokeUUIDsAboutToBeRemoved, 0);
  objc_storeStrong((id *)&self->_alternativeStrokesAnimation, 0);
  objc_storeStrong((id *)&self->_fadeOutStrokeAnimations, 0);
  objc_storeStrong((id *)&self->_transformStrokesAnimations, 0);
  objc_storeStrong((id *)&self->_particlesToDestinationAnimations, 0);
  objc_storeStrong((id *)&self->_strokeIDsToErase, 0);
  objc_storeStrong((id *)&self->_strokesToErase, 0);
  objc_storeStrong(&self->_purgeResourcesBlock, 0);
  objc_storeStrong((id *)&self->_powerSavingController, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_metalView, 0);
  objc_destroyWeak((id *)&self->_currentDrawingBeingCopiedToCanvas);
  objc_storeStrong((id *)&self->_metalConfig, 0);
  objc_destroyWeak((id *)&self->_rulerController);
  objc_destroyWeak((id *)&self->_selectionController);
  objc_storeStrong((id *)&self->_liveRenderingOverrideColor, 0);
  objc_storeStrong((id *)&self->_drawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_ink, 0);
  objc_storeStrong((id *)&self->_drawing, 0);
  objc_storeStrong((id *)&self->_paperTexture, 0);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_drawingController, 0);
  objc_storeStrong((id *)&self->_fallbackStrokeGenerator, 0);
  objc_storeStrong((id *)&self->_combineStrokesDrawingID, 0);
  objc_storeStrong((id *)&self->_combineStrokesRenderGroupID, 0);
  objc_storeStrong(&self->_combineTimeoutBlock, 0);
  objc_storeStrong((id *)&self->_snapshotFramebuffer, 0);
  objc_storeStrong((id *)&self->_canvasBackgroundColor, 0);
  objc_storeStrong((id *)&self->_currentStrokeTouch, 0);
  objc_storeStrong((id *)&self->_finishedStrokes, 0);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  begiuint64_t n = self->_rollPointsToUpdate.__begin_;
  if (begin)
  {
    self->_rollPointsToUpdate.__end_ = begin;
    operator delete(begin);
  }
}

@end