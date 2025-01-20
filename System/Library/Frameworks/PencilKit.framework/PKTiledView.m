@interface PKTiledView
+ (BOOL)showDebugOutlines;
+ (id)newInlineDrawingOfClass:(Class)a3;
- ($5C7D0D34CEC3E6999BF186EC2548EE70)generateStrokeDataFromApplyingTransformations:(SEL)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6;
- ($F30B99E357B462A7BBD676CBC61D9025)convertInputPoint:(SEL)a3 toAttachment:(id *)a4;
- (BOOL)_hasSelection;
- (BOOL)_isDrawingEnabled;
- (BOOL)_isScrollViewSizeAnimating;
- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3;
- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3 didInsertNewAttachment:(BOOL *)a4;
- (BOOL)_isVirtualDevice;
- (BOOL)_isZoomingOrResizing;
- (BOOL)_scrollViewIsScrollingOrZoomingOrResizing;
- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop;
- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing;
- (BOOL)_shouldUpdateHeightOfAttachments;
- (BOOL)_sixChannelBlendingIsActive;
- (BOOL)_snapshottingDisabled;
- (BOOL)_toolPickerIsOrWillBeVisible;
- (BOOL)_updateHeightOfAttachmentIfNecessary:(id)a3;
- (BOOL)aggd_didMergeWithCollaborator;
- (BOOL)allowSnapToShape;
- (BOOL)allowsFingerDrawing;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canvasView:(id)a3 drawingIsShared:(id)a4;
- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4;
- (BOOL)canvasView:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4;
- (BOOL)canvasView:(id)a3 shouldDiscardEndedStroke:(id)a4 drawing:(id)a5;
- (BOOL)canvasView:(id)a3 shouldDiscardTapStrokeAt:(CGPoint)a4 drawing:(id)a5;
- (BOOL)canvasViewShouldCombineStrokes:(id)a3;
- (BOOL)combiningStrokesEnabled;
- (BOOL)cropDrawingAttachmentsWhenViewIsSmaller;
- (BOOL)disableTileRendering;
- (BOOL)disableUndoManager;
- (BOOL)drawBitmapEraserMask;
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (BOOL)editMenuVisible;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasRefinableStrokes;
- (BOOL)hitSelectionAt:(CGPoint)a3;
- (BOOL)hoverController:(id)a3 shouldBeActiveAt:(CGPoint)a4;
- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3;
- (BOOL)insertSpaceEnabled;
- (BOOL)invertColors;
- (BOOL)isAutoRefineEnabled;
- (BOOL)isDrawing;
- (BOOL)isGenerationModelAvailable;
- (BOOL)isInNotesTextView;
- (BOOL)isReadOnlyView;
- (BOOL)isRefinableStroke:(id)a3;
- (BOOL)needToUpdateViewFrame;
- (BOOL)rulerEnabled;
- (BOOL)rulerHostWantsSharedRuler;
- (BOOL)selectionHidden;
- (BOOL)selectionSupportsCopyAsText;
- (BOOL)selectionSupportsSnapToShape;
- (BOOL)selectionSupportsTranslate;
- (BOOL)shouldStartToolPreviewWhenHovering;
- (BOOL)showDebugOutlines;
- (BOOL)sixChannelBlending;
- (BOOL)sixChannelBlendingDisableSnapshotting;
- (BOOL)supportsCopyAsText;
- (BOOL)tileIsVisibleForOffset:(CGPoint)a3 inAttachment:(id)a4 distanceToMiddle:(double *)a5;
- (BOOL)toolShadowShouldBeActive;
- (CAMetalLayer)metalLayer;
- (CGAffineTransform)canvasView:(SEL)a3 transformForStroke:(id)a4;
- (CGAffineTransform)contentCoordinateSpaceTransform;
- (CGAffineTransform)rulerTransform;
- (CGAffineTransform)strokeTransform;
- (CGAffineTransform)transformFromStrokeSpaceToViewInAttachment:(SEL)a3;
- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3;
- (CGAffineTransform)transformFromViewToStrokeSpaceInAttachment:(SEL)a3;
- (CGAffineTransform)transformFromViewToStrokeSpaceInDrawing:(SEL)a3;
- (CGPoint)paletteViewHoverLocation:(id)a3;
- (CGPoint)pointInStrokeSpace:(CGPoint)a3 inDrawing:(id)a4;
- (CGRect)attachmentBoundsForDrawing:(id)a3;
- (CGRect)boundsForDrawing:(id)a3;
- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4;
- (CGRect)newViewFrame;
- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3;
- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3 slack:(CGSize)a4;
- (Class)defaultDrawingClass;
- (PKController)drawingController;
- (PKHoverController)hoverController;
- (PKInk)ink;
- (PKLinedPaper)linedPaper;
- (PKRulerController)rulerController;
- (PKRulerHostingDelegate)rulerHostingDelegate;
- (PKSelectionController)selectionController;
- (PKSelectionInteraction)selectionInteraction;
- (PKStrokeSelectionImage)selectionImage;
- (PKTileController)tileController;
- (PKTiledCanvasView)canvasView;
- (PKTiledViewAnimationController)refineAnimationController;
- (PKTiledViewDelegate)delegate;
- (PKWelcomeController)welcomeController;
- (SEL)drawingUndoSelector;
- (UICoordinateSpace)contentCoordinateSpace;
- (UIEditMenuInteraction)editMenuInteraction;
- (UIGestureRecognizer)pencilLongPressGestureRecognizer;
- (UIImage)paperTexture;
- (UIPanGestureRecognizer)generationToolGestureRecognizer;
- (UIPanGestureRecognizer)simultaneousDrawingGestureRecognizer;
- (UIScrollView)scrollView;
- (UITouch)drawingTouchThatHitNothing;
- (UIView)attachmentContainerView;
- (UIView)contentSnapshottingView;
- (UIView)selectionView;
- (double)_latestLatency;
- (double)_layerContentsScale;
- (double)canvasZoomScale;
- (double)inputScale;
- (double)rulerWidth;
- (double)timestampForLatestUserInteraction;
- (id)_accessibilityUserTestingChildren;
- (id)_activeToolPicker;
- (id)_adornmentViewsToHitTest;
- (id)_attachmentForUUID:(id)a3;
- (id)_createPKStrokesFromCHDrawing:(id)a3 inputScale:(double)a4 sourceStroke:(id)a5 ink:(id)a6;
- (id)_createPKStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStroke:(id)a6;
- (id)_currentStroke;
- (id)_hitAttachment:(CGPoint)a3;
- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4;
- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5;
- (id)_liveDrawing;
- (id)_newStrokesFromApplyingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6;
- (id)_tilesForAttachment:(id)a3 bounds:(CGRect)a4 invert:(BOOL)a5;
- (id)_visibleAttachments;
- (id)_visibleTilesForAttachment:(id)a3;
- (id)attachmentForHoverPreviewAt:(id *)a3;
- (id)attachmentForUUID:(id)a3;
- (id)attachmentViews;
- (id)attachments;
- (id)canvasView:(id)a3 attachmentViewForDrawing:(id)a4;
- (id)canvasViewContentCoordinateSpace:(id)a3;
- (id)canvasViewTouchView:(id)a3;
- (id)currentDrawingBeingCopiedToCanvas;
- (id)didChangeDrawing:(id)a3 undoable:(BOOL)a4;
- (id)drawingGestureRecognizer;
- (id)drawingUndoTarget;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5;
- (id)generateTile:(CGPoint)a3 inAttachment:(id)a4 rendering:(BOOL)a5 offscreen:(BOOL)a6 overrideAdditionalStrokes:(id)a7;
- (id)hitAttachment:(CGPoint)a3;
- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4;
- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)hoverGestureRecognizer;
- (id)initInScrollView:(id)a3;
- (id)initInScrollView:(id)a3 defaultDrawingClass:(Class)a4;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5;
- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6;
- (id)liveAttachment;
- (id)paletteViewHoverView:(id)a3;
- (id)rulerHostingView;
- (id)rulerView;
- (id)selectedStrokeIdsForAttachment:(id)a3;
- (id)smoothedHullForStroke:(id)a3;
- (id)standInAttachmentView;
- (id)tileForOffset:(CGPoint)a3 inAttachment:(id)a4 offscreen:(BOOL)a5 tileZoomScale:(double)a6;
- (id)topZAttachment;
- (id)undoManager;
- (id)viewForAttachmentAtBlankSpace;
- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3;
- (id)visibleAttachments;
- (id)visibleOnScreenStrokesForDrawing:(id)a3;
- (int64_t)_activeSixChannelBlendingMode;
- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4;
- (int64_t)_maxFileFormatVersion;
- (int64_t)_totalVisibleStrokes;
- (int64_t)canvasViewZOrderPolicy;
- (int64_t)effectiveMaximumSupportedContentVersion;
- (int64_t)maximumSupportedContentVersion;
- (uint64_t)isSystemSnapshotting;
- (unint64_t)drawingPolicy;
- (vector<AttachmentTileInfo,)getVisibleTiles:(PKTiledView *)self;
- (void)_addAttachmentsUnderView:(id)a3 toArray:(id)a4;
- (void)_beginAnalyticsSessionIfNecessary;
- (void)_cancelCurrentStrokeAndReduceMemoryFootprint;
- (void)_cancelHideCanvasIfNecessary;
- (void)_canvasView:(id)a3 didFinishRenderingNewStrokes:(id)a4 inDrawing:(id)a5 forPreview:(BOOL)a6;
- (void)_canvasView:(id)a3 eraserMoved:(CGPoint)a4 attachment:(id)a5;
- (void)_canvasViewDidEraseStrokes:(id)a3;
- (void)_canvasViewWillBeginDrawing:(id)a3 startPoint:(id *)a4 forPreview:(BOOL)a5;
- (void)_canvasViewWillCreateSnapshot;
- (void)_clearSelectionIfNecessary;
- (void)_copyAll:(id)a3;
- (void)_copyFromCanvas:(id)a3 intoAttachment:(id)a4 hideCanvas:(BOOL)a5 strokes:(id)a6;
- (void)_createHoverControllerIfNecessary;
- (void)_didAddDrawingAttachmentView;
- (void)_didEndInteractiveResize;
- (void)_disableScrollViewPanGestureIfNecessary;
- (void)_dismissInsertSpaceHandlesIfNecessary;
- (void)_endAnalyticsSessionsIfNecessary;
- (void)_endHoverToolPreview;
- (void)_findSelectionTranscriptionWithCompletion:(id)a3;
- (void)_finishCombiningStrokesIfNecessaryForAttachment:(id)a3;
- (void)_flushCaches;
- (void)_getAllHandwritingTranscription:(id)a3;
- (void)_handleDrawingDidChangeForAttachment:(id)a3;
- (void)_handleDrawingDidChangeForAttachment:(id)a3 didChangeVisibleStrokes:(BOOL)a4;
- (void)_handlePencilSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3;
- (void)_handleSingleTapAtLocation:(CGPoint)a3 forAttachment:(id)a4;
- (void)_hideCanvas;
- (void)_keepPencilShadowVisible;
- (void)_layoutSubviews;
- (void)_layoutSubviewsUpdateTilesForRendering:(BOOL)a3;
- (void)_observeScrollViewDidScroll:(id)a3;
- (void)_pauseHoverPreviewForTimeInterval:(double)a3;
- (void)_reenableScrollViewPanGestureIfNecessary;
- (void)_resetDrawingState;
- (void)_resetSelectedStrokeStateForRenderer;
- (void)_sceneDidActivate:(id)a3;
- (void)_scrollViewDidLayoutSubviews:(id)a3;
- (void)_scrollViewDidScroll;
- (void)_selectionRefreshWithChangeToDrawings:(id)a3 completion:(id)a4;
- (void)_selectionRefreshWithChangeToDrawings:(id)a3 overrideAdditionalStrokes:(id)a4 completion:(id)a5;
- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5;
- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5;
- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5 forceOffscreen:(BOOL)a6 completion:(id)a7;
- (void)_setDrawingEnabled:(BOOL)a3;
- (void)_setExternalAttachments:(id)a3;
- (void)_setupPencilShadowViewIfNecessary;
- (void)_share:(id)a3;
- (void)_showEditMenuFromLocation:(CGPoint)a3 forAttachment:(id)a4;
- (void)_straightenStrokes:(id)a3 drawing:(id)a4 completionBlock:(id)a5;
- (void)_transientlyUpdateHeightOfAttachment:(id)a3 delta:(double)a4;
- (void)_updateAttachmentHeightIfNecessaryForDrawing:(id)a3;
- (void)_updateAttachmentOnscreenBounds;
- (void)_updateDrawingGestureEnablement;
- (void)_updateDrawingGestureEnablementWithInk:(id)a3;
- (void)_updateForToolPickerVisibilityChange:(id)a3;
- (void)_updatePencilShadowView:(id *)a3;
- (void)_updateSymbolPreviewViewForTouch:(id *)a3 attachment:(id)a4 alpha:(double)a5;
- (void)_updateToolPreviewIndicatorInputPoint:(id *)a3;
- (void)_willBeginInteractiveResize;
- (void)autoRefineTask:(id)a3 synthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6 completionBlock:(id)a7;
- (void)blitOldTilesIntoNewTiles:(id)a3 completion:(id)a4;
- (void)cancelTileGenerationInvalidateTiles:(BOOL)a3;
- (void)canvasView:(id)a3 beganStroke:(id)a4;
- (void)canvasView:(id)a3 cancelledStroke:(id)a4;
- (void)canvasView:(id)a3 drawingDidChange:(id)a4;
- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5;
- (void)canvasView:(id)a3 registerMultiStepUndoCommands:(id)a4;
- (void)canvasView:(id)a3 registerUndoCommands:(id)a4;
- (void)canvasView:(id)a3 textStrokesCoveredByStroke:(id)a4 drawing:(id)a5 completion:(id)a6;
- (void)canvasViewDidBeginDrawing:(id)a3;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4;
- (void)canvasViewInvalidateTiles:(id)a3;
- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5;
- (void)changeStrokesUsingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6;
- (void)clearRefinableStrokes;
- (void)commitSelectionIfNecessaryWithCompletion:(id)a3;
- (void)convertToShapeAtLocation:(CGPoint)a3;
- (void)copy:(id)a3;
- (void)copyTranscriptionOfSelection;
- (void)createSticker:(id)a3;
- (void)cut:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)didChangeDrawing:(id)a3;
- (void)didMoveToWindow;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)duplicate:(id)a3;
- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5;
- (void)enumerateRefinableStrokesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6;
- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6 scrollViewContentOffset:(CGPoint)a7;
- (void)hoverController:(id)a3 didBegin:(id *)a4;
- (void)hoverController:(id)a3 didUpdate:(id *)a4;
- (void)hoverController:(id)a3 holdGestureMeanTouch:(id *)a4 latestTouch:(id *)a5;
- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4;
- (void)hoverControllerDidEnd:(id)a3;
- (void)hoverControllerHoldGestureEnded:(id)a3;
- (void)insertCanvasView:(id)a3 intoScrollView:(id)a4;
- (void)insertSpace:(id)a3;
- (void)insertSpaceAtLocation:(CGPoint)a3;
- (void)layoutSubviews;
- (void)newCanvasView;
- (void)paletteViewPencilDidTap:(id)a3;
- (void)paste:(id)a3;
- (void)performUndo:(id)a3;
- (void)purgeNonVisibleTiles;
- (void)refine:(id)a3 strokes:(id)a4 drawing:(id)a5;
- (void)refineSelection;
- (void)registerUndoCommand:(id)a3;
- (void)registerUndoCommands:(id)a3;
- (void)registerUndoCommands:(id)a3 andChangeToDrawing:(id)a4;
- (void)renderAttachment:(id)a3 intoCanvas:(id)a4 showing:(BOOL)a5;
- (void)replaceInkTexture:(id)a3 image:(CGImage *)a4;
- (void)replayCanvasViewDrawingMoved:(id)a3 inputPoint:(id *)a4 inputType:(int64_t)a5;
- (void)resizeTiles:(id)a3 completion:(id)a4;
- (void)resumeWorkAfterDrawing;
- (void)selectAll:(id)a3;
- (void)selectionDidChange;
- (void)selectionSupportsRefinement:(id)a3;
- (void)setAggd_didMergeWithCollaborator:(BOOL)a3;
- (void)setAllowSnapToShape:(BOOL)a3;
- (void)setAttachmentContainerView:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setCanvasViewZOrderPolicy:(int64_t)a3;
- (void)setCombiningStrokesEnabled:(BOOL)a3;
- (void)setContentCoordinateSpace:(id)a3;
- (void)setContentSnapshottingView:(id)a3;
- (void)setCropDrawingAttachmentsWhenViewIsSmaller:(BOOL)a3;
- (void)setCurrentDrawingBeingCopiedToCanvas:(id *)a1;
- (void)setCurrentPreviewDrawingUUID:(uint64_t)a1;
- (void)setDefaultDrawingClass:(Class)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableTileRendering:(BOOL)a3;
- (void)setDisableUndoManager:(BOOL)a3;
- (void)setDrawBitmapEraserMask:(BOOL)a3;
- (void)setDrawingPolicy:(unint64_t)a3;
- (void)setDrawingUndoSelector:(SEL)a3;
- (void)setDrawingUndoTarget:(id)a3;
- (void)setEditMenuVisible:(BOOL)a3;
- (void)setHoverController:(id)a3;
- (void)setInk:(id)a3;
- (void)setInsertSpaceEnabled:(BOOL)a3;
- (void)setIsAutoRefineEnabled:(BOOL)a3;
- (void)setLinedPaper:(id)a3;
- (void)setLiveAttachment:(uint64_t)a1;
- (void)setMaximumSupportedContentVersion:(int64_t)a3;
- (void)setPaperTexture:(id)a3;
- (void)setRulerEnabled:(BOOL)a3;
- (void)setRulerHostingDelegate:(id)a3;
- (void)setSelectedStrokeIds:(id)a3 selectionType:(int64_t)a4 forAttachment:(id)a5;
- (void)setSelectedStrokesColor:(id)a3;
- (void)setSelectionHidden:(BOOL)a3;
- (void)setShowDebugOutlines:(BOOL)a3;
- (void)setSixChannelBlending:(BOOL)a3;
- (void)setSixChannelBlendingDisableSnapshotting:(BOOL)a3;
- (void)setSupportsCopyAsText:(BOOL)a3;
- (void)setTileController:(id)a3;
- (void)setWelcomeController:(id)a3;
- (void)set_maxFileFormatVersion:(int64_t)a3;
- (void)setupGestures;
- (void)setupRefineAnimationFrom:(id)a3 to:(id)a4 inDrawing:(id)a5 completionHandler:(id)a6;
- (void)setupStrokeInAnimationTo:(id)a3 inDrawing:(id)a4 completionHandler:(id)a5;
- (void)showImageWandTipWithController:(id)a3 toolPicker:(id)a4;
- (void)snapToShapeSelection;
- (void)startRefineAnimationWithDuration:(double)a3;
- (void)startToolPreviewIfPossibleForInputPoint:(id *)a3;
- (void)startedDrawingInBlankSpaceWithTouch:(id)a3 location:(CGPoint)a4;
- (void)stopRefineAnimation;
- (void)straighten:(id)a3 strokes:(id)a4 drawing:(id)a5;
- (void)straightenSelection;
- (void)straightenStrokes:(id)a3 drawing:(id)a4 completionBlockWithStrokeTransformInfo:(id)a5;
- (void)suspendWorkForDrawing;
- (void)swapOffscreenCallback:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transformingSelectionBegan;
- (void)transformingSelectionCancelled;
- (void)transformingSelectionChanged:(CGAffineTransform *)a3;
- (void)transformingSelectionEnded;
- (void)translateSelection;
- (void)updateAfterTraitCollectionChange;
- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(id)a3;
- (void)updateExistingTiles:(BOOL)a3;
- (void)updateForAllowedDrawingInput;
- (void)updateTilesForVisibleRect;
- (void)updateTilesForVisibleRectForceIfZooming:(BOOL)a3;
- (void)updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:(id)a3 withCallback:(id)a4;
- (void)updateTilesForVisibleRectRendering:(BOOL)a3 offscreen:(BOOL)a4 overrideAdditionalStrokes:(id)a5;
- (void)updateTilesForVisibleRectRendering:(uint64_t)a3 offscreen:(char)a4 overrideAdditionalStrokes:;
@end

@implementation PKTiledView

- (void)updateForAllowedDrawingInput
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKTiledView *)self allowsFingerDrawing];
  if (!PKIsVisionDevice()) {
    goto LABEL_5;
  }
  if (qword_1EA3C3800 != -1) {
    dispatch_once(&qword_1EA3C3800, &__block_literal_global_1461);
  }
  if (byte_1EA3C37E1)
  {
LABEL_5:
    if (v3) {
      v4 = &unk_1F200EAC0;
    }
    else {
      v4 = &unk_1F200EAD8;
    }
    v5 = [(PKTiledView *)self drawingGestureRecognizer];
    [v5 setAllowedTouchTypes:v4];

    v6 = [(PKTiledView *)self scrollView];
    v7 = [v6 panGestureRecognizer];
    v8 = v7;
    if (v3) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = 1;
    }
    [v7 setMinimumNumberOfTouches:v9];
    goto LABEL_12;
  }
  [(PKTiledView *)self _updateRemoteEffect];
  if (![(PKTiledView *)self _isVirtualDevice])
  {
    v25 = [(PKTiledView *)self drawingGestureRecognizer];
    [v25 setAllowedTouchTypes:&unk_1F200EA90];

    v26 = [(PKTiledView *)self scrollView];
    v27 = [v26 panGestureRecognizer];
    [v27 setMinimumNumberOfTouches:1];

    v6 = [(PKTiledView *)self scrollView];
    v8 = [v6 panGestureRecognizer];
    [v8 setAllowedTouchTypes:&unk_1F200EAA8];
LABEL_12:
  }
  v10 = [(PKTiledView *)self drawingGestureRecognizer];
  v11 = [v10 allowedTouchTypes];
  v12 = [(PKTiledView *)self generationToolGestureRecognizer];
  [v12 setAllowedTouchTypes:v11];

  v13 = [(PKTiledView *)self drawingGestureRecognizer];
  v14 = [v13 allowedTouchTypes];
  v15 = [(PKTiledView *)self simultaneousDrawingGestureRecognizer];
  [v15 setAllowedTouchTypes:v14];

  v16 = [(PKTiledView *)self selectionController];
  v17 = -[PKSelectionController selectionInteraction](v16);
  v18 = [(PKTiledView *)self ink];
  [v17 _updateAllowedTouchTypesForSelectedInk:v18];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = [(PKTiledView *)self attachmentViews];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(v19);
        }
        [*(id *)(*((void *)&v28 + 1) + 8 * i) fingerDrawingEnabledDidChange];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v20);
  }

  v23 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    BOOL v24 = [(PKTiledView *)self allowsFingerDrawing];
    *(_DWORD *)buf = 67109120;
    BOOL v33 = v24;
    _os_log_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_INFO, "Update allows finger drawing: %{BOOL}d", buf, 8u);
  }
}

- (id)drawingGestureRecognizer
{
  v2 = [(PKTiledView *)self canvasView];
  BOOL v3 = [v2 drawingGestureRecognizer];

  return v3;
}

- (PKInk)ink
{
  v2 = [(PKTiledView *)self canvasView];
  BOOL v3 = [v2 ink];

  return (PKInk *)v3;
}

- (uint64_t)isSystemSnapshotting
{
  if (!a1) {
    return 0;
  }
  v1 = [a1 window];
  v2 = [v1 windowScene];
  uint64_t v3 = [v2 _isPerformingSystemSnapshot];

  return v3;
}

uint64_t __34__PKTiledView_allowsFingerDrawing__block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) window];
  v2 = [v1 windowScene];
  uint64_t v3 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v2];
  uint64_t v4 = [v3 _paletteViewVisible];

  return v4;
}

- (BOOL)allowsFingerDrawing
{
  delegate = self->_delegate;
  if (delegate == (PKTiledViewDelegate *)2) {
    return 0;
  }
  if (delegate == (PKTiledViewDelegate *)1) {
    return 1;
  }
  if (delegate || ([MEMORY[0x1E4FB1A80] prefersPencilOnlyDrawing] & 1) != 0) {
    return 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__PKTiledView_allowsFingerDrawing__block_invoke;
  aBlock[3] = &unk_1E64C5D88;
  aBlock[4] = self;
  v5 = (uint64_t (**)(void))_Block_copy(aBlock);
  v6 = [(PKTiledView *)self window];
  if (+[PKToolPicker isActiveToolPickerVisibleForWindow:v6])
  {
    char v4 = 1;
  }
  else
  {
    char v4 = v5[2](v5);
  }

  return v4;
}

- (id)_attachmentForUUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(PKTiledView *)self attachments];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v10 = objc_msgSend(v9, "drawing", (void)v14);
        v11 = [v10 uuid];
        char v12 = [v11 isEqual:v4];

        if (v12)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)attachmentViews
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  [(PKTiledView *)self attachments];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        v10 = PKDynamicCast(v9, v8);
        if (v10) {
          objc_msgSend(v3, "addObject:", v10, (void)v13);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  v11 = (void *)[v3 copy];

  return v11;
}

- (id)attachments
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (*(unsigned char *)&self->_tiledViewFlags & 4) == 0;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  if (v3)
  {
    uint64_t v5 = [(PKTiledView *)self attachmentContainerView];
    [(PKTiledView *)self _addAttachmentsUnderView:v5 toArray:v4];

    id v6 = [MEMORY[0x1E4F1CA48] array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v7);
          }
          v11 = PKProtocolCast(&unk_1F203AAA8, *(void **)(*((void *)&v31 + 1) + 8 * i));
          if (v11) {
            [v6 addObject:v11];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v8);
    }

    double timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
    if (timestampForLatestUserInteraction != 0.0)
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = *(id *)&timestampForLatestUserInteraction;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v28;
        do
        {
          for (uint64_t j = 0; j != v14; ++j)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v13);
            }
            long long v17 = *(void **)(*((void *)&v27 + 1) + 8 * j);
            if (objc_msgSend(v17, "isExternalAttachment", (void)v27)) {
              [v6 addObject:v17];
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
        }
        while (v14);
      }
    }
    uint64_t v18 = objc_msgSend(v6, "copy", (void)v27);
  }
  else
  {
    uint64_t v19 = [(PKTiledView *)self delegate];
    uint64_t v20 = [v19 tiledViewAttachmentViews];

    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v6 = v20;
    uint64_t v21 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v21; ++k)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v6);
          }
          BOOL v24 = PKProtocolCast(&unk_1F203AAA8, *(void **)(*((void *)&v35 + 1) + 8 * k));
          if (v24) {
            [v4 addObject:v24];
          }
        }
        uint64_t v21 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
      }
      while (v21);
    }

    uint64_t v18 = [v4 copy];
  }
  v25 = (void *)v18;

  return v25;
}

- (void)_addAttachmentsUnderView:(id)a3 toArray:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [a3 subviews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v15 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          v11 = [v10 tiledViewAttachmentViews];
          [v5 addObjectsFromArray:v11];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            [v5 addObject:v10];
          }
          else
          {
            char v12 = [v10 subviews];
            BOOL v13 = [v12 count] == 0;

            if (!v13) {
              [(PKTiledView *)self _addAttachmentsUnderView:v10 toArray:v5];
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

- (UIView)attachmentContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);

  return (UIView *)WeakRetained;
}

- (PKSelectionController)selectionController
{
  return (PKSelectionController *)self->_tileController;
}

- (UIPanGestureRecognizer)simultaneousDrawingGestureRecognizer
{
  return self->_generationToolGestureRecognizer;
}

- (UIPanGestureRecognizer)generationToolGestureRecognizer
{
  return (UIPanGestureRecognizer *)self->_drawingUndoTarget;
}

- (void)_observeScrollViewDidScroll:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  tileController = self->_tileController;
  double y = self->_lastContentOffset.y;
  double a = self->_strokeTransformAtStartOfStroke.a;
  uint64_t v7 = [(PKTiledView *)self scrollView];
  [v7 contentOffset];
  [(PKSelectionController *)(id *)&tileController->super.isa didScroll:a - v9];

  [(PKTiledView *)self setNeedsLayout];
  v10 = [(PKTiledView *)self scrollView];
  [v10 contentOffset];
  double v12 = v11;
  double v14 = v13;
  double v15 = self->_lastContentOffset.y;
  double v16 = self->_strokeTransformAtStartOfStroke.a;

  if (v12 != v15 || v14 != v16)
  {
    updateAttachmentBoundsBlocuint64_t k = self->_updateAttachmentBoundsBlock;
    if (updateAttachmentBoundsBlock) {
      dispatch_block_cancel(updateAttachmentBoundsBlock);
    }
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __43__PKTiledView__observeScrollViewDidScroll___block_invoke;
    block[3] = &unk_1E64C5E70;
    objc_copyWeak(&v41, &location);
    dispatch_block_t v19 = dispatch_block_create((dispatch_block_flags_t)0, block);
    id v20 = self->_updateAttachmentBoundsBlock;
    self->_updateAttachmentBoundsBlocuint64_t k = v19;

    self->_aggd_didMergeWithCollaborator = 1;
    dispatch_time_t v21 = dispatch_time(0, 100000000);
    dispatch_after(v21, MEMORY[0x1E4F14428], self->_updateAttachmentBoundsBlock);
    uint64_t v22 = [(PKTiledView *)self scrollView];
    [v22 contentOffset];
    self->_lastContentOffset.double y = v23;
    self->_strokeTransformAtStartOfStroke.double a = v24;

    objc_destroyWeak(&v41);
    objc_destroyWeak(&location);
  }
  cachedAdditionalStrokes = self->_cachedAdditionalStrokes;
  v26 = [(PKTiledView *)self scrollView];
  [v26 zoomScale];
  BOOL v28 = vabdd_f64(*(double *)&cachedAdditionalStrokes, v27) < 0.00999999978;

  if (!v28)
  {
    long long v29 = [(PKTiledView *)self scrollView];
    [v29 zoomScale];
    self->_cachedAdditionalStrokes = v30;
  }
  [(PKTiledView *)self updateTilesForVisibleRect];
  if ([(PKTiledView *)self _scrollViewIsScrollingOrZoomingOrResizing]
    || !self->_updateAttachmentBoundsBlock)
  {
    [(PKTiledView *)self purgeNonVisibleTiles];
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v31 = [(PKTiledView *)self attachmentViews];
  uint64_t v32 = [v31 countByEnumeratingWithState:&v36 objects:v43 count:16];
  if (v32)
  {
    uint64_t v33 = *(void *)v37;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v37 != v33) {
          objc_enumerationMutation(v31);
        }
        [*(id *)(*((void *)&v36 + 1) + 8 * v34++) containingScrollViewDidScroll];
      }
      while (v32 != v34);
      uint64_t v32 = [v31 countByEnumeratingWithState:&v36 objects:v43 count:16];
    }
    while (v32);
  }

  p_tileController = &self->_tileController;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:*p_tileController];
  [(PKTileController *)*p_tileController performSelector:sel_didEndScroll withObject:0 afterDelay:0.3];
}

- (void)_hideCanvas
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PKTiledView *)self canvasView];
  [v3 _finishCombiningStrokesIfNecessary];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastZoomScale);
  if (WeakRetained)
  {
    id v5 = os_log_create("com.apple.pencilkit", "Rendering");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "currentDrawingBeingCopiedToCanvas is not nil when it should be", buf, 2u);
    }

    -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, 0);
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = [(PKTiledView *)self attachmentViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v22 + 1) + 8 * v9++) setContentHidden:0];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  v10 = [(PKTiledView *)self canvasView];
  char v11 = [v10 isHidden];

  double v12 = [(PKTiledView *)self canvasView];
  [v12 setHidden:1];

  -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, 0);
  if ((v11 & 1) == 0 && (*(unsigned char *)&self->_tiledViewFlags & 0x20) != 0)
  {
    double v13 = [(PKTiledView *)self delegate];
    [v13 canvasView:self didChangeHiddenState:1];
  }
  if ([(PKTiledView *)self canvasViewZOrderPolicy] == 2)
  {
    long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v19 = *MEMORY[0x1E4F1DAB8];
    long long v20 = v14;
    long long v21 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    double v15 = [(PKTiledView *)self canvasView];
    v18[0] = v19;
    v18[1] = v20;
    v18[2] = v21;
    [v15 setTransform:v18];

    double v16 = [(PKTiledView *)self canvasView];
    long long v17 = [(PKTiledView *)self scrollView];
    [(PKTiledView *)self insertCanvasView:v16 intoScrollView:v17];
  }
  [MEMORY[0x1E4F39CF8] commit];
  [(PKTiledView *)self resumeWorkAfterDrawing];
}

- (PKTiledCanvasView)canvasView
{
  return (PKTiledCanvasView *)self->_drawingPolicy;
}

- (void)_layoutSubviews
{
}

- (void)_layoutSubviewsUpdateTilesForRendering:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  if (self && self->_didDisableScrollViewPanGestureRecognizer) {
    goto LABEL_3;
  }
  double v12 = [(PKTiledView *)self scrollView];
  if ([v12 isZooming]
    && (!self ? (double v13 = 0.0) : (double v13 = *(double *)&self->_tileLevel),
        [(PKTiledView *)self canvasZoomScale],
        v13 + v13 > v14))
  {
    double v15 = [(PKTiledView *)self scrollView];
    [v15 zoomScale];
    double v17 = v16;
    if (self) {
      double v18 = *(double *)&self->_tileLevel;
    }
    else {
      double v18 = 0.0;
    }
    double v19 = v18 * 0.5;

    if (v17 > v19)
    {
LABEL_3:
      id v75 = [(PKTiledView *)self scrollView];
      [v75 zoomScale];
      if (self) {
        double v6 = *(double *)&self->_tileLevel;
      }
      else {
        double v6 = 0.0;
      }
      if (v5 >= v6)
      {
      }
      else
      {
        updateVisibleTilesAfterZoomOutBlocuint64_t k = self->_updateVisibleTilesAfterZoomOutBlock;

        if (!updateVisibleTilesAfterZoomOutBlock)
        {
          objc_initWeak(&location, self);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke;
          block[3] = &unk_1E64C5E70;
          objc_copyWeak(&v91, &location);
          dispatch_block_t v8 = dispatch_block_create((dispatch_block_flags_t)0, block);
          p_updateVisibleTilesAfterZoomOutBlocuint64_t k = &self->_updateVisibleTilesAfterZoomOutBlock;
          dispatch_block_t v10 = *p_updateVisibleTilesAfterZoomOutBlock;
          *p_updateVisibleTilesAfterZoomOutBlocuint64_t k = v8;

          dispatch_time_t v11 = dispatch_time(0, 100000000);
          dispatch_after(v11, MEMORY[0x1E4F14428], *p_updateVisibleTilesAfterZoomOutBlock);
          objc_destroyWeak(&v91);
          objc_destroyWeak(&location);
        }
      }
      return;
    }
  }
  else
  {
  }
  if (self)
  {
    if (self->_disableTileRendering || (-[PKTiledView isSystemSnapshotting](self) & 1) != 0) {
      return;
    }
    self->_didDisableScrollViewPanGestureRecognizer = 1;
  }
  [(PKTiledView *)self frame];
  double v21 = v20;
  double v23 = v22;
  [(PKTiledView *)self newViewFrame];
  -[PKTiledView setFrame:](self, "setFrame:");
  [(PKTiledView *)self frame];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  uint64_t v32 = [(PKTiledView *)self canvasView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  [(PKTiledView *)self bounds];
  if (self) {
    liveAttachment = self->_liveAttachment;
  }
  else {
    liveAttachment = 0;
  }
  -[PKAttachmentView setFrame:](liveAttachment, "setFrame:");
  uint64_t v34 = [(PKTiledView *)self scrollView];
  [v34 zoomScale];
  int64_t v36 = v35;

  if (self)
  {
    double v37 = floor(log2(1.0 / *(double *)&v36)) + 1.0;
    self->_gestureView = (PKTiledGestureView *)(uint64_t)v37;
    double tileScale = self->_tileScale;
    double v39 = *(double *)&self->_tileLevel;
    self;
    self->_double tileScale = round(exp2((double)(uint64_t)v37) * 256.0);
    self->_tileLevel = v36;
  }
  else
  {
    self;
    double v39 = 0.0;
    double tileScale = 0.0;
  }
  hideCanvasBlocuint64_t k = self->_hideCanvasBlock;
  if (hideCanvasBlock)
  {
    dispatch_block_cancel(hideCanvasBlock);
    id v41 = self->_hideCanvasBlock;
    self->_hideCanvasBlocuint64_t k = 0;
  }
  if (![(PKTiledView *)self _scrollViewIsScrollingOrZoomingOrResizing])
  {
    objc_initWeak(&location, self);
    v88[0] = MEMORY[0x1E4F143A8];
    v88[1] = 3221225472;
    v88[2] = __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke_2;
    v88[3] = &unk_1E64C5E70;
    objc_copyWeak(&v89, &location);
    dispatch_block_t v42 = dispatch_block_create((dispatch_block_flags_t)0, v88);
    id v43 = self->_hideCanvasBlock;
    self->_hideCanvasBlocuint64_t k = v42;

    dispatch_time_t v44 = dispatch_time(0, 100000000);
    dispatch_after(v44, MEMORY[0x1E4F14428], self->_hideCanvasBlock);
    objc_destroyWeak(&v89);
    objc_destroyWeak(&location);
  }
  [(PKTiledView *)self frame];
  if (v46 == v21 && v45 == v23 && self->_tileScale == tileScale && *(double *)&self->_tileLevel == v39)
  {
    [(PKTiledView *)self updateTilesForVisibleRectRendering:v3 offscreen:0 overrideAdditionalStrokes:0];
LABEL_73:
    self->_didDisableScrollViewPanGestureRecognizer = 0;
    return;
  }
  if (self->_disableTileRendering)
  {
    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    v47 = [(PKTiledView *)self attachmentViews];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v84 objects:v95 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v85;
      do
      {
        for (uint64_t i = 0; i != v48; ++i)
        {
          if (*(void *)v85 != v49) {
            objc_enumerationMutation(v47);
          }
          v51 = [*(id *)(*((void *)&v84 + 1) + 8 * i) purgedTiles];
          [v51 removeAllObjects];
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v84 objects:v95 count:16];
      }
      while (v48);
    }
  }
  tileController = self->_tileController;
  if (tileController)
  {
    if (*(void *)&tileController[2]._contentZoomScale)
    {
      v53 = tileController[2]._completionHandlers;
      char v54 = [(NSMutableArray *)v53 isDragging];

      if ((v54 & 1) == 0)
      {
        v55 = self->_tileController;
        if (v55) {
          -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v55, 1, 0);
        }
      }
    }
  }
  [(PKTiledView *)self _dismissInsertSpaceHandlesIfNecessary];
  v56 = [(PKTiledView *)self attachmentViews];
  [(PKTiledView *)self frame];
  if (v58 != v21 || v57 != v23)
  {
    long long v82 = 0u;
    long long v83 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    id v59 = v56;
    uint64_t v60 = [v59 countByEnumeratingWithState:&v80 objects:v94 count:16];
    if (v60)
    {
      uint64_t v61 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v60; ++j)
        {
          if (*(void *)v81 != v61) {
            objc_enumerationMutation(v59);
          }
          [*(id *)(*((void *)&v80 + 1) + 8 * j) updateFrameForTextContainer];
        }
        uint64_t v60 = [v59 countByEnumeratingWithState:&v80 objects:v94 count:16];
      }
      while (v60);

      if (!self)
      {
        double v63 = 0.0;
        goto LABEL_63;
      }
    }
    else
    {
    }
  }
  double v63 = *(double *)&self->_tileLevel;
LABEL_63:
  if (v63 != v39)
  {
    [(PKTiledView *)self _layerContentsScale];
    double v65 = v64;
    long long v78 = 0u;
    long long v79 = 0u;
    long long v76 = 0u;
    long long v77 = 0u;
    id v66 = v56;
    uint64_t v67 = [v66 countByEnumeratingWithState:&v76 objects:v93 count:16];
    if (v67)
    {
      uint64_t v68 = *(void *)v77;
      do
      {
        for (uint64_t k = 0; k != v67; ++k)
        {
          if (*(void *)v77 != v68) {
            objc_enumerationMutation(v66);
          }
          v70 = *(void **)(*((void *)&v76 + 1) + 8 * k);
          v71 = [(PKTiledView *)self scrollView];
          [v70 pixelAlignForContentScale:v71 enclosingScrollView:v65];
        }
        uint64_t v67 = [v66 countByEnumeratingWithState:&v76 objects:v93 count:16];
      }
      while (v67);
    }
  }
  [(PKTiledView *)self _hideCanvas];
  v72 = [(PKTiledView *)self canvasView];
  [(PKTiledView *)self frame];
  objc_msgSend(v72, "_setFixedPointSize:drawingScale:", v73, v74, *(double *)&v36);

  [(PKTiledView *)self resizeTiles:v56 completion:0];
  [(PKTiledView *)self updateTilesForVisibleRectRendering:v3 offscreen:0 overrideAdditionalStrokes:0];
  if (self) {
    goto LABEL_73;
  }
}

- (void)updateTilesForVisibleRectRendering:(BOOL)a3 offscreen:(BOOL)a4 overrideAdditionalStrokes:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v48 = a5;
  updateVisibleTilesAfterZoomOutBlocuint64_t k = self->_updateVisibleTilesAfterZoomOutBlock;
  if (updateVisibleTilesAfterZoomOutBlock)
  {
    dispatch_block_cancel(updateVisibleTilesAfterZoomOutBlock);
    id v9 = self->_updateVisibleTilesAfterZoomOutBlock;
    self->_updateVisibleTilesAfterZoomOutBlocuint64_t k = 0;
  }
  dispatch_block_t v10 = [(PKTiledView *)self scrollView];
  [v10 zoomScale];
  double v12 = v11;

  if (self->_tileScale >= 1.0)
  {
    [(PKTiledView *)self frame];
    if (v14 != 0.0 && v13 != 0.0)
    {
      [(PKTiledView *)self frame];
      if (fabs(v18) != INFINITY && fabs(v15) != INFINITY && fabs(v16) != INFINITY && fabs(v17) != INFINITY)
      {
        BOOL v19 = [(PKTiledView *)self disableTileRendering];
        char v20 = v12 == 0.0 || v19;
        if ((v20 & 1) == 0 && *(double *)&self->_tileLevel != 0.0)
        {
          double v21 = [(PKTiledView *)self visibleAttachments];
          [(PKTiledView *)self getVisibleTiles:v21];

          unint64_t v22 = 126 - 2 * __clz(((char *)v63 - (char *)v62) >> 5);
          if (v63 == v62) {
            uint64_t v23 = 0;
          }
          else {
            uint64_t v23 = v22;
          }
          std::__introsort<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *,false>((uint64_t)v62, v63, v23, 1);
          for (uint64_t i = v62; i != v63; i += 4)
          {
            uint64_t v25 = objc_opt_class();
            double v26 = PKDynamicCast(v25, *(void **)i);
            double v27 = v26;
            if (v26) {
              [v26 clearTileDrawingTransform];
            }
            double v28 = [v27 drawing];
            double v29 = [v28 uuid];
            double v30 = [v48 objectForKeyedSubscript:v29];

            id v31 = -[PKTiledView generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:](self, "generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:", *(void *)i, v6, v5, v30, i[1], i[2]);
          }
          long long v60 = 0u;
          long long v61 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          uint64_t v32 = [(PKTiledView *)self attachmentViews];
          uint64_t v33 = [v32 countByEnumeratingWithState:&v58 objects:v65 count:16];
          if (v33)
          {
            obuint64_t j = v32;
            uint64_t v47 = *(void *)v59;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v59 != v47) {
                  objc_enumerationMutation(obj);
                }
                int64_t v35 = *(void **)(*((void *)&v58 + 1) + 8 * j);
                long long v56 = 0u;
                long long v57 = 0u;
                long long v55 = 0u;
                if (v35) {
                  [v35 drawingTransform];
                }
                long long v53 = 0u;
                long long v54 = 0u;
                long long v51 = 0u;
                long long v52 = 0u;
                int64_t v36 = [v35 tiles];
                double v37 = [v36 allKeys];

                uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v64 count:16];
                if (v38)
                {
                  uint64_t v39 = *(void *)v52;
                  do
                  {
                    for (uint64_t k = 0; k != v38; ++k)
                    {
                      if (*(void *)v52 != v39) {
                        objc_enumerationMutation(v37);
                      }
                      id v41 = *(void **)(*((void *)&v51 + 1) + 8 * k);
                      v50[0] = v55;
                      v50[1] = v56;
                      v50[2] = v57;
                      if (v41) {
                        [v41 drawingTransform];
                      }
                      else {
                        memset(v49, 0, sizeof(v49));
                      }
                      if (!DKDNearlyEqualTransforms((double *)v50, (double *)v49))
                      {
                        dispatch_block_t v42 = [v35 tiles];
                        id v43 = [v42 objectForKeyedSubscript:v41];

                        dispatch_time_t v44 = [v35 tiles];
                        [v44 removeObjectForKey:v41];

                        -[PKRendererTile purgeTileLayers]((uint64_t)v43);
                        double v45 = [v35 purgedTiles];
                        [v45 setObject:v43 forKeyedSubscript:v41];
                      }
                    }
                    uint64_t v38 = [v37 countByEnumeratingWithState:&v51 objects:v64 count:16];
                  }
                  while (v38);
                }
              }
              uint64_t v32 = obj;
              uint64_t v33 = [obj countByEnumeratingWithState:&v58 objects:v65 count:16];
            }
            while (v33);
          }

          *(void *)&long long v55 = &v62;
          std::vector<AttachmentTileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v55);
        }
      }
    }
  }
}

- (void)updateTilesForVisibleRectRendering:(uint64_t)a3 offscreen:(char)a4 overrideAdditionalStrokes:
{
  while (2)
  {
    uint64_t v120 = (uint64_t)(a2 - 4);
    dispatch_block_t v10 = (double *)a1;
    while (1)
    {
      while (1)
      {
        while (1)
        {
          a1 = (uint64_t)v10;
          uint64_t v11 = (char *)a2 - (char *)v10;
          uint64_t v12 = ((char *)a2 - (char *)v10) >> 5;
          if (!(!v5 & v4))
          {
            switch(v12)
            {
              case 0:
              case 1:
                return;
              case 2:
                if (*(a2 - 1) >= *(double *)(a1 + 24)) {
                  return;
                }
                uint64_t v52 = a1;
                uint64_t v53 = (uint64_t)(a2 - 4);
                break;
              case 3:
                std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1, a1 + 32, v120);
                return;
              case 4:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1, a1 + 32, a1 + 64, v120);
                return;
              case 5:
                std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1, a1 + 32, a1 + 64, a1 + 96);
                if (*(a2 - 1) >= *(double *)(a1 + 120)) {
                  return;
                }
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>(a1 + 96, v120);
                if (*(double *)(a1 + 120) >= *(double *)(a1 + 88)) {
                  return;
                }
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>(a1 + 64, a1 + 96);
                if (*(double *)(a1 + 88) >= *(double *)(a1 + 56)) {
                  return;
                }
                std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>(a1 + 32, a1 + 64);
                if (*(double *)(a1 + 56) >= *(double *)(a1 + 24)) {
                  return;
                }
                uint64_t v52 = a1;
                uint64_t v53 = a1 + 32;
                break;
              default:
                JUMPOUT(0);
            }
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>(v52, v53);
            return;
          }
          if (v11 <= 767)
          {
            long long v54 = (double *)(a1 + 32);
            BOOL v56 = (double *)a1 == a2 || v54 == a2;
            if (a4)
            {
              if (!v56)
              {
                uint64_t v57 = 0;
                uint64_t v58 = a1;
                do
                {
                  long long v59 = v54;
                  if (*(double *)(v58 + 56) < *(double *)(v58 + 24))
                  {
                    uint64_t v60 = *(void *)v54;
                    *long long v54 = 0.0;
                    long long v125 = *(_OWORD *)(v58 + 40);
                    double v61 = *(double *)(v58 + 56);
                    uint64_t v62 = v57;
                    while (1)
                    {
                      uint64_t v63 = a1 + v62;
                      uint64_t v64 = *(void *)(a1 + v62);
                      *(void *)uint64_t v63 = 0;
                      double v65 = *(void **)(a1 + v62 + 32);
                      *(void *)(v63 + 32) = v64;

                      *(_OWORD *)(v63 + 40) = *(_OWORD *)(v63 + 8);
                      *(void *)(v63 + 56) = *(void *)(v63 + 24);
                      if (!v62) {
                        break;
                      }
                      v62 -= 32;
                      if (v61 >= *(double *)(v63 - 8))
                      {
                        uint64_t v66 = a1 + v62 + 32;
                        goto LABEL_88;
                      }
                    }
                    uint64_t v66 = a1;
LABEL_88:
                    uint64_t v67 = *(void **)v66;
                    *(void *)uint64_t v66 = v60;

                    *(_OWORD *)(v63 + 8) = v125;
                    *(double *)(v66 + 24) = v61;
                  }
                  long long v54 = v59 + 4;
                  v57 += 32;
                  uint64_t v58 = (uint64_t)v59;
                }
                while (v59 + 4 != a2);
              }
            }
            else if (!v56)
            {
              do
              {
                v111 = v54;
                if (*(double *)(a1 + 56) < *(double *)(a1 + 24))
                {
                  uint64_t v112 = *(void *)v54;
                  *long long v54 = 0.0;
                  long long v128 = *(_OWORD *)(a1 + 40);
                  double v113 = *(double *)(a1 + 56);
                  v114 = v54;
                  v115 = v54;
                  do
                  {
                    uint64_t v116 = *((void *)v115 - 4);
                    v115 -= 4;
                    double *v115 = 0.0;
                    v117 = *(void **)v114;
                    *(void *)v114 = v116;

                    *(_OWORD *)(v114 + 1) = *(_OWORD *)(v114 - 3);
                    v114[3] = *(v114 - 1);
                    double v118 = *(v114 - 5);
                    v114 = v115;
                  }
                  while (v113 < v118);
                  v119 = *(void **)v115;
                  *(void *)v115 = v112;

                  *(_OWORD *)(v115 + 1) = v128;
                  v115[3] = v113;
                }
                long long v54 = v111 + 4;
                a1 = (uint64_t)v111;
              }
              while (v111 + 4 != a2);
            }
            return;
          }
          if (!a3)
          {
            if ((double *)a1 != a2)
            {
              int64_t v68 = (unint64_t)(v12 - 2) >> 1;
              int64_t v69 = v68;
              do
              {
                int64_t v70 = v69;
                if (v68 >= v69)
                {
                  uint64_t v71 = (2 * v69) | 1;
                  uint64_t v72 = a1 + 32 * v71;
                  if (2 * v70 + 2 < v12 && *(double *)(v72 + 24) < *(double *)(v72 + 56))
                  {
                    v72 += 32;
                    uint64_t v71 = 2 * v70 + 2;
                  }
                  uint64_t v73 = a1 + 32 * v70;
                  double v74 = *(double *)(v73 + 24);
                  if (*(double *)(v72 + 24) >= v74)
                  {
                    uint64_t v75 = a1 + 32 * v70;
                    long long v76 = *(void **)v75;
                    *(void *)uint64_t v75 = 0;
                    long long v126 = *(_OWORD *)(v73 + 8);
                    do
                    {
                      uint64_t v77 = v75;
                      uint64_t v75 = v72;
                      uint64_t v78 = *(void *)v72;
                      *(void *)uint64_t v75 = 0;
                      long long v79 = *(void **)v77;
                      *(void *)uint64_t v77 = v78;

                      long long v80 = *(_OWORD *)(v75 + 8);
                      *(void *)(v77 + 24) = *(void *)(v75 + 24);
                      *(_OWORD *)(v77 + 8) = v80;
                      if (v68 < v71) {
                        break;
                      }
                      uint64_t v81 = 2 * v71;
                      uint64_t v71 = (2 * v71) | 1;
                      uint64_t v72 = a1 + 32 * v71;
                      uint64_t v82 = v81 + 2;
                      if (v82 < v12 && *(double *)(v72 + 24) < *(double *)(v72 + 56))
                      {
                        v72 += 32;
                        uint64_t v71 = v82;
                      }
                    }
                    while (*(double *)(v72 + 24) >= v74);
                    long long v83 = *(void **)v75;
                    *(void *)uint64_t v75 = v76;

                    *(_OWORD *)(v75 + 8) = v126;
                    *(double *)(v75 + 24) = v74;
                  }
                }
                int64_t v69 = v70 - 1;
              }
              while (v70);
              uint64_t v84 = (unint64_t)v11 >> 5;
              do
              {
                uint64_t v85 = 0;
                double v86 = *(double *)a1;
                *(void *)a1 = 0;
                long long v127 = *(_OWORD *)(a1 + 8);
                uint64_t v130 = *(void *)(a1 + 24);
                uint64_t v87 = a1;
                do
                {
                  uint64_t v88 = v87;
                  v87 += 32 * (v85 + 1);
                  uint64_t v89 = 2 * v85;
                  uint64_t v85 = (2 * v85) | 1;
                  uint64_t v90 = v89 + 2;
                  if (v90 < v84 && *(double *)(v87 + 24) < *(double *)(v87 + 56))
                  {
                    v87 += 32;
                    uint64_t v85 = v90;
                  }
                  id v91 = *(void **)v87;
                  *(void *)uint64_t v87 = 0;
                  v92 = *(void **)v88;
                  *(void *)uint64_t v88 = v91;

                  long long v93 = *(_OWORD *)(v87 + 8);
                  *(void *)(v88 + 24) = *(void *)(v87 + 24);
                  *(_OWORD *)(v88 + 8) = v93;
                }
                while (v85 <= (uint64_t)((unint64_t)(v84 - 2) >> 1));
                v94 = (long long *)(v87 + 8);
                v95 = a2 - 4;
                if ((double *)v87 == a2 - 4)
                {
                  v109 = *(void **)v87;
                  *(double *)uint64_t v87 = v86;

                  *(void *)(v87 + 24) = v130;
                  long long *v94 = v127;
                }
                else
                {
                  uint64_t v96 = *((void *)a2 - 4);
                  *(a2 - 4) = 0.0;
                  v97 = *(void **)v87;
                  *(void *)uint64_t v87 = v96;

                  long long v98 = *(_OWORD *)(a2 - 3);
                  *(double *)(v87 + 24) = *(a2 - 1);
                  long long *v94 = v98;
                  v99 = (void *)*((void *)a2 - 4);
                  *(a2 - 4) = v86;

                  *((void *)a2 - 1) = v130;
                  *(_OWORD *)(a2 - 3) = v127;
                  uint64_t v100 = v87 - a1 + 32;
                  if (v100 >= 33)
                  {
                    unint64_t v101 = (((unint64_t)v100 >> 5) - 2) >> 1;
                    double v102 = *(double *)(v87 + 24);
                    if (*(double *)(a1 + 32 * v101 + 24) < v102)
                    {
                      v103 = *(void **)v87;
                      *(void *)uint64_t v87 = 0;
                      long long v121 = *v94;
                      do
                      {
                        uint64_t v104 = v87;
                        uint64_t v87 = a1 + 32 * v101;
                        v105 = *(void **)v87;
                        *(void *)uint64_t v87 = 0;
                        v106 = *(void **)v104;
                        *(void *)uint64_t v104 = v105;

                        long long v107 = *(_OWORD *)(v87 + 8);
                        *(void *)(v104 + 24) = *(void *)(v87 + 24);
                        *(_OWORD *)(v104 + 8) = v107;
                        if (!v101) {
                          break;
                        }
                        unint64_t v101 = (v101 - 1) >> 1;
                      }
                      while (*(double *)(a1 + 32 * v101 + 24) < v102);
                      v108 = *(void **)v87;
                      *(void *)uint64_t v87 = v103;

                      *(_OWORD *)(v87 + 8) = v121;
                      *(double *)(v87 + 24) = v102;
                    }
                  }
                }
                a2 = v95;
              }
              while (v84-- > 2);
            }
            return;
          }
          unint64_t v13 = (unint64_t)v12 >> 1;
          uint64_t v14 = a1 + 32 * ((unint64_t)v12 >> 1);
          if ((unint64_t)v11 <= 0x1000)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(v14, a1, v120);
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1, v14, v120);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1 + 32, v14 - 32, (uint64_t)(a2 - 8));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(a1 + 64, a1 + 32 + 32 * v13, (uint64_t)(a2 - 12));
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(v14 - 32, v14, a1 + 32 + 32 * v13);
            double v15 = *(double *)a1;
            *(void *)a1 = 0;
            long long v122 = *(_OWORD *)(a1 + 8);
            uint64_t v129 = *(void *)(a1 + 24);
            double v16 = *(void **)v14;
            *(void *)uint64_t v14 = 0;
            double v17 = *(void **)a1;
            *(void *)a1 = v16;

            long long v18 = *(_OWORD *)(v14 + 8);
            *(void *)(a1 + 24) = *(void *)(v14 + 24);
            *(_OWORD *)(a1 + 8) = v18;
            BOOL v19 = *(void **)v14;
            *(double *)uint64_t v14 = v15;

            *(void *)(v14 + 24) = v129;
            *(_OWORD *)(v14 + 8) = v122;
          }
          --a3;
          if (a4) {
            break;
          }
          double v20 = *(double *)(a1 + 24);
          if (*(double *)(a1 - 8) < v20) {
            goto LABEL_12;
          }
          double v38 = *(double *)a1;
          *(void *)a1 = 0;
          long long v124 = *(_OWORD *)(a1 + 8);
          if (v20 >= *(a2 - 1))
          {
            id v41 = (double *)(a1 + 32);
            do
            {
              dispatch_block_t v10 = v41;
              if (v41 >= a2) {
                break;
              }
              double v42 = v41[3];
              v41 += 4;
            }
            while (v20 >= v42);
          }
          else
          {
            uint64_t v39 = a1;
            do
            {
              dispatch_block_t v10 = (double *)(v39 + 32);
              double v40 = *(double *)(v39 + 56);
              v39 += 32;
            }
            while (v20 >= v40);
          }
          unint64_t v43 = (unint64_t)a2;
          if (v10 < a2)
          {
            dispatch_time_t v44 = a2;
            do
            {
              unint64_t v43 = (unint64_t)(v44 - 4);
              double v45 = *(v44 - 1);
              v44 -= 4;
            }
            while (v20 < v45);
          }
          while ((unint64_t)v10 < v43)
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>((uint64_t)v10, v43);
            do
            {
              double v46 = v10[7];
              v10 += 4;
            }
            while (v20 >= v46);
            do
            {
              double v47 = *(double *)(v43 - 8);
              v43 -= 32;
            }
            while (v20 < v47);
          }
          if (v10 - 4 != (double *)a1)
          {
            uint64_t v48 = *((void *)v10 - 4);
            *(v10 - 4) = 0.0;
            uint64_t v49 = *(void **)a1;
            *(void *)a1 = v48;

            long long v50 = *(_OWORD *)(v10 - 3);
            *(double *)(a1 + 24) = *(v10 - 1);
            *(_OWORD *)(a1 + 8) = v50;
          }
          long long v51 = (void *)*((void *)v10 - 4);
          *(v10 - 4) = v38;

          a4 = 0;
          *(_OWORD *)(v10 - 3) = v124;
          *(v10 - 1) = v20;
        }
        double v20 = *(double *)(a1 + 24);
LABEL_12:
        uint64_t v21 = 0;
        double v22 = *(double *)a1;
        *(void *)a1 = 0;
        long long v123 = *(_OWORD *)(a1 + 8);
        do
        {
          double v23 = *(double *)(a1 + v21 + 56);
          v21 += 32;
        }
        while (v23 < v20);
        double v24 = (double *)(a1 + v21);
        uint64_t v25 = a2;
        if (v21 == 32)
        {
          double v28 = a2;
          while (v24 < v28)
          {
            unint64_t v26 = (unint64_t)(v28 - 4);
            double v29 = *(v28 - 1);
            v28 -= 4;
            if (v29 < v20) {
              goto LABEL_22;
            }
          }
          unint64_t v26 = (unint64_t)v28;
        }
        else
        {
          do
          {
            unint64_t v26 = (unint64_t)(v25 - 4);
            double v27 = *(v25 - 1);
            v25 -= 4;
          }
          while (v27 >= v20);
        }
LABEL_22:
        if ((unint64_t)v24 >= v26)
        {
          dispatch_block_t v10 = v24;
        }
        else
        {
          unint64_t v30 = v26;
          dispatch_block_t v10 = v24;
          do
          {
            std::_IterOps<std::_ClassicAlgPolicy>::iter_swap[abi:ne180100]<AttachmentTileInfo *&,AttachmentTileInfo *&>((uint64_t)v10, v30);
            do
            {
              double v31 = v10[7];
              v10 += 4;
            }
            while (v31 < v20);
            do
            {
              double v32 = *(double *)(v30 - 8);
              v30 -= 32;
            }
            while (v32 >= v20);
          }
          while ((unint64_t)v10 < v30);
        }
        if (v10 - 4 != (double *)a1)
        {
          uint64_t v33 = *((void *)v10 - 4);
          *(v10 - 4) = 0.0;
          uint64_t v34 = *(void **)a1;
          *(void *)a1 = v33;

          long long v35 = *(_OWORD *)(v10 - 3);
          *(double *)(a1 + 24) = *(v10 - 1);
          *(_OWORD *)(a1 + 8) = v35;
        }
        int64_t v36 = (void *)*((void *)v10 - 4);
        *(v10 - 4) = v22;

        *(_OWORD *)(v10 - 3) = v123;
        *(v10 - 1) = v20;
        if ((unint64_t)v24 >= v26) {
          break;
        }
LABEL_35:
        std::__introsort<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *,false>(a1, v10 - 4, a3, a4 & 1);
        a4 = 0;
      }
      BOOL v37 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>((double *)a1, v10 - 4);
      if (std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,-[PKTiledView updateTilesForVisibleRectRendering:offscreen:overrideAdditionalStrokes:]::$_0 &,AttachmentTileInfo *>(v10, a2))
      {
        break;
      }
      if (!v37) {
        goto LABEL_35;
      }
    }
    a2 = v10 - 4;
    if (!v37) {
      continue;
    }
    break;
  }
}

- (id)visibleAttachments
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [(PKTiledView *)self _visibleAttachments];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        dispatch_block_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v9 = objc_opt_class();
        dispatch_block_t v10 = PKDynamicCast(v9, v8);
        if (v10) {
          objc_msgSend(v3, "addObject:", v10, (void)v12);
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (vector<AttachmentTileInfo,)getVisibleTiles:(PKTiledView *)self
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v68 = a4;
  uint64_t v6 = [(PKTiledView *)self scrollView];
  [v6 bounds];
  double v71 = v8;
  double v72 = v7;
  double v69 = v10;
  double v70 = v9;

  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  long long v78 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  obuint64_t j = v68;
  uint64_t v11 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
  if (v11)
  {
    long long v12 = 0;
    uint64_t v74 = *(void *)v79;
    do
    {
      uint64_t v13 = 0;
      uint64_t v75 = v11;
      do
      {
        if (*(void *)v79 != v74) {
          objc_enumerationMutation(obj);
        }
        long long v14 = *(void **)(*((void *)&v78 + 1) + 8 * v13);
        long long v15 = [v14 viewRep];
        [v15 frame];
        uint64_t v77 = v13;
        if (v16 <= 1.0) {
          goto LABEL_11;
        }
        uint64_t v17 = [v14 viewRep];
        [v17 frame];
        if (fabs(v21) == INFINITY || (double v22 = fabs(v18), v22 >= INFINITY) && v22 <= INFINITY)
        {

LABEL_11:
          goto LABEL_12;
        }
        double v23 = fabs(v19);
        BOOL v24 = v23 > INFINITY || v23 < INFINITY;
        double v25 = fabs(v20);
        BOOL v26 = v25 > INFINITY || v25 < INFINITY;

        if (v24 && v26)
        {
          double v27 = [v14 tileContainerView];
          double v28 = [(PKTiledView *)self scrollView];
          objc_msgSend(v27, "convertRect:fromView:", v28, v72, v71, v70, v69);
          double v30 = v29;
          double v32 = v31;
          CGFloat v34 = v33;
          CGFloat v36 = v35;

          double v37 = self ? self->_tileScale : 0.0;
          v85.origin.x = v30;
          v85.origin.double y = v32;
          v85.size.width = v34;
          v85.size.height = v36;
          double MaxX = CGRectGetMaxX(v85);
          double v39 = self ? self->_tileScale : 0.0;
          v86.origin.x = v30;
          v86.origin.double y = v32;
          v86.size.width = v34;
          v86.size.height = v36;
          double MaxY = CGRectGetMaxY(v86);
          double v41 = self ? self->_tileScale : 0.0;
          double v42 = v30 / v37 + -1.0;
          double v43 = MaxX / v39 + 1.0;
          double v44 = (double)(uint64_t)v42;
          if (v43 >= v44)
          {
            uint64_t v45 = (uint64_t)v42;
            uint64_t v76 = (uint64_t)(v32 / v37 + -1.0);
            double v46 = MaxY / v41 + 1.0;
            do
            {
              if (v46 >= (double)v76)
              {
                double v47 = (double)v76;
                uint64_t v48 = v76;
                do
                {
                  uint64_t v82 = 0;
                  if (-[PKTiledView tileIsVisibleForOffset:inAttachment:distanceToMiddle:](self, "tileIsVisibleForOffset:inAttachment:distanceToMiddle:", v14, &v82, v44, v47))
                  {
                    id v49 = v14;
                    id v50 = v49;
                    uint64_t v51 = v82;
                    var0 = retstr->var2.var0;
                    if (v12 >= var0)
                    {
                      long long v54 = retstr->var0;
                      uint64_t v55 = (v12 - retstr->var0) >> 5;
                      unint64_t v56 = v55 + 1;
                      if ((unint64_t)(v55 + 1) >> 59) {
                        std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
                      }
                      uint64_t v57 = var0 - v54;
                      if (v57 >> 4 > v56) {
                        unint64_t v56 = v57 >> 4;
                      }
                      if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFE0) {
                        unint64_t v58 = 0x7FFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v58 = v56;
                      }
                      if (v58)
                      {
                        if (v58 >> 59) {
                          std::__throw_bad_array_new_length[abi:ne180100]();
                        }
                        long long v59 = (char *)operator new(32 * v58);
                      }
                      else
                      {
                        long long v59 = 0;
                      }
                      uint64_t v60 = &v59[32 * v55];
                      *(void *)uint64_t v60 = v50;
                      *((double *)v60 + 1) = v44;
                      *((double *)v60 + 2) = v47;
                      *((void *)v60 + 3) = v51;
                      if (v12 == v54)
                      {
                        uint64_t v53 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var0 = (AttachmentTileInfo *)v60;
                        retstr->var1 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var2.var0 = (AttachmentTileInfo *)&v59[32 * v58];
                      }
                      else
                      {
                        double v61 = &v59[32 * v55];
                        do
                        {
                          uint64_t v62 = *((void *)v12 - 4);
                          long long v12 = (AttachmentTileInfo *)((char *)v12 - 32);
                          *(void *)long long v12 = 0;
                          *((void *)v61 - 4) = v62;
                          v61 -= 32;
                          long long v63 = *(_OWORD *)((char *)v12 + 8);
                          *((void *)v61 + 3) = *((void *)v12 + 3);
                          *(_OWORD *)(v61 + 8) = v63;
                        }
                        while (v12 != v54);
                        long long v12 = retstr->var0;
                        var1 = retstr->var1;
                        uint64_t v53 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var0 = (AttachmentTileInfo *)v61;
                        retstr->var1 = (AttachmentTileInfo *)(v60 + 32);
                        retstr->var2.var0 = (AttachmentTileInfo *)&v59[32 * v58];
                        while (var1 != v12)
                        {
                          double v65 = (void *)*((void *)var1 - 4);
                          var1 = (AttachmentTileInfo *)((char *)var1 - 32);
                        }
                      }
                      if (v12) {
                        operator delete(v12);
                      }
                    }
                    else
                    {
                      *(void *)long long v12 = v49;
                      *((double *)v12 + 1) = v44;
                      *((double *)v12 + 2) = v47;
                      uint64_t v53 = (AttachmentTileInfo *)((char *)v12 + 32);
                      *((void *)v12 + 3) = v51;
                    }
                    retstr->var1 = v53;
                    long long v12 = v53;
                  }
                  double v47 = (double)++v48;
                }
                while (v46 >= (double)v48);
              }
              double v44 = (double)++v45;
            }
            while (v43 >= (double)v45);
          }
        }
LABEL_12:
        uint64_t v13 = v77 + 1;
      }
      while (v77 + 1 != v75);
      uint64_t v66 = [obj countByEnumeratingWithState:&v78 objects:v83 count:16];
      uint64_t v11 = v66;
    }
    while (v66);
  }

  return result;
}

- (BOOL)disableTileRendering
{
  return BYTE5(self->_refineAnimationController);
}

- (id)_visibleAttachments
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F1CA48] array];
  [(PKTiledView *)self attachments];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        double v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = objc_msgSend(v8, "viewRep", (void)v12);
        char v10 = [v9 isHidden];

        if ((v10 & 1) == 0) {
          [v3 addObject:v8];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (BOOL)_scrollViewIsScrollingOrZoomingOrResizing
{
  if ([(PKTiledView *)self _isZoomingOrResizing]) {
    return 1;
  }
  id v4 = [(PKTiledView *)self scrollView];
  if ([v4 isDragging])
  {
    char v3 = 1;
  }
  else
  {
    uint64_t v5 = [(PKTiledView *)self scrollView];
    if ([v5 isDecelerating])
    {
      char v3 = 1;
    }
    else
    {
      uint64_t v6 = [(PKTiledView *)self scrollView];
      if ([v6 _isAnimatingScroll])
      {
        char v3 = 1;
      }
      else
      {
        double v7 = [(PKTiledView *)self scrollView];
        char v3 = [v7 _isAnimatingZoom];
      }
    }
  }
  return v3;
}

- (CGRect)newViewFrame
{
  char v3 = [(PKTiledView *)self scrollView];
  [v3 contentOffset];
  double v5 = v4;
  double v7 = v6;

  double v8 = [(PKTiledView *)self scrollView];
  [v8 bounds];
  double v10 = v9;
  uint64_t v11 = [(PKTiledView *)self scrollView];
  [v11 bounds];
  double v13 = v12;

  double v14 = v5;
  double v15 = v7;
  double v16 = v10;
  double v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.double y = v15;
  result.origin.x = v14;
  return result;
}

- (UIScrollView)scrollView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentContainerView);

  return (UIScrollView *)WeakRetained;
}

- (BOOL)_isZoomingOrResizing
{
  char v3 = [(PKTiledView *)self scrollView];
  if (([v3 isZooming] & 1) != 0 || self && self->_disableTileRendering) {
    char v4 = 1;
  }
  else {
    char v4 = -[PKTiledView isSystemSnapshotting](self);
  }

  return v4;
}

- (void)_scrollViewDidLayoutSubviews:(id)a3
{
  if ([(PKTiledView *)self needToUpdateViewFrame])
  {
    [(PKTiledView *)self _endHoverToolPreview];
    [(PKTiledView *)self newViewFrame];
    double v29 = v4;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(PKTiledView *)self frame];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v19 = [(PKTiledView *)self window];
    double v20 = [v19 windowScene];
    double v21 = [v20 screen];
    [v21 nativeScale];
    double v23 = v22;

    if (v23 <= 1.0) {
      double v24 = 1.0;
    }
    else {
      double v24 = 1.0 / v23;
    }
    if ([(PKTiledView *)self isDrawing]
      && (v8 != v16 || v10 != v18 || sqrt((v6 - v14) * (v6 - v14) + (v29 - v12) * (v29 - v12)) >= v24))
    {
      double v25 = [(PKTiledView *)self canvasView];
      BOOL v26 = [v25 drawingGestureRecognizer];
      [v26 cancel];
    }
    double v27 = [(PKTiledView *)self canvasView];
    [v27 _finishCombiningStrokesIfNecessary];

    [(PKTiledView *)self _layoutSubviews];
    tileController = self->_tileController;
    -[PKSelectionController _layoutViewsIfNecessary]((id *)&tileController->super.isa);
  }
}

- (BOOL)needToUpdateViewFrame
{
  if (!self) {
    return 1;
  }
  if (self->_tileScale == 0.0) {
    return 1;
  }
  [(PKTiledView *)self frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [(PKTiledView *)self newViewFrame];
  v17.origin.x = v12;
  v17.origin.double y = v13;
  v17.size.width = v14;
  v17.size.height = v15;
  v16.origin.x = v5;
  v16.origin.double y = v7;
  v16.size.width = v9;
  v16.size.height = v11;
  return !CGRectEqualToRect(v16, v17);
}

- (BOOL)isDrawing
{
  v2 = [(PKTiledView *)self canvasView];
  char v3 = [v2 isDrawing];

  return v3;
}

- (void)_endHoverToolPreview
{
  if (self)
  {
    if (BYTE1(self->_refineAnimationController))
    {
      char v3 = [(PKTiledView *)self canvasView];
      [v3 _previewDrawingEnded];
    }
    if (self->_toolPreviewView)
    {
      if ([(PKDrawing *)self->_erasePreviewDrawing count])
      {
        [(PKTiledView *)self _setAdditionalStrokes:MEMORY[0x1E4F1CBF0] inDrawing:self->_toolPreviewView invalidateTiles:1];
        objc_setProperty_nonatomic_copy(self, v4, 0, 856);
      }
      objc_storeStrong((id *)&self->_toolPreviewView, 0);
    }
    objc_storeStrong((id *)&self->_pencilStatisticsManager, 0);
    BYTE1(self->_refineAnimationController) = 0;
    LOBYTE(self->_refineAnimationController) = 0;
    BYTE2(self->_refineAnimationController) = 0;
    [(NSOrderedSet *)self->_eraseOrLassoPreviewStrokes removeFromSuperview];
    objc_storeStrong((id *)&self->_eraseOrLassoPreviewStrokes, 0);
    objc_setProperty_nonatomic_copy(self, v5, 0, 856);
  }
  else
  {
    [0 removeFromSuperview];
  }
  [(NSUUID *)self->_currentPreviewDrawingUUID removeFromSuperview];
  currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
  self->_currentPreviewDrawingUUID = 0;
}

- (void)setCurrentDrawingBeingCopiedToCanvas:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id v5 = v3;
    objc_storeWeak(a1 + 92, v3);
    SEL v4 = [a1 canvasView];
    [v4 setCurrentDrawingBeingCopiedToCanvas:v5];

    id v3 = v5;
  }
}

- (void)resumeWorkAfterDrawing
{
  -[PKTileController resumePreviews]((uint64_t)self->_drawingTouchThatHitNothing);
  Class defaultDrawingClass = self->_defaultDrawingClass;

  [(objc_class *)defaultDrawingClass didEndDrawing];
}

- (void)insertCanvasView:(id)a3 intoScrollView:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ([(PKTiledView *)self canvasViewZOrderPolicy]) {
    [v6 addSubview:v7];
  }
  else {
    [v6 insertSubview:v7 atIndex:0];
  }
}

- (int64_t)canvasViewZOrderPolicy
{
  return (int64_t)self->_contentSnapshottingView;
}

- (void)updateTilesForVisibleRect
{
  if (![(PKTiledView *)self _isZoomingOrResizing])
  {
    [(PKTiledView *)self updateTilesForVisibleRectRendering:1 offscreen:0 overrideAdditionalStrokes:0];
  }
}

- (void)resizeTiles:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v6 = (void (**)(id, BOOL))a4;
  drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
  if (!drawingTouchThatHitNothing
    || self->_disableTileRendering
    || -[PKTiledView isSystemSnapshotting](self))
  {
    if (v6) {
      v6[2](v6, drawingTouchThatHitNothing == 0);
    }
  }
  else
  {
    double v27 = self;
    double v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      gestureView = self->_gestureView;
      *(_DWORD *)buf = 134217984;
      double v40 = gestureView;
      _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "New tile level: %ld", buf, 0xCu);
    }

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v28;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          CGFloat v13 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          long long v29 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          CGFloat v14 = objc_msgSend(v13, "tiles", v27);
          CGFloat v15 = [v14 objectEnumerator];

          uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
          if (v16)
          {
            uint64_t v17 = *(void *)v30;
            do
            {
              for (uint64_t j = 0; j != v16; ++j)
              {
                if (*(void *)v30 != v17) {
                  objc_enumerationMutation(v15);
                }
                uint64_t v19 = *(void *)(*((void *)&v29 + 1) + 8 * j);
                if (v19) {
                  *(unsigned char *)(v19 + 83) = 1;
                }
              }
              uint64_t v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
            }
            while (v16);
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v10);
    }

    if (v27->_tileScale <= 0.0
      || ([(PKTiledView *)v27 frame], v21 == 0.0)
      || v20 == 0.0
      || ([(PKTiledView *)v27 _layerContentsScale], v22 <= 0.0)
      || ([(PKTiledView *)v27 scrollView],
          double v23 = objc_claimAutoreleasedReturnValue(),
          [v23 zoomScale],
          BOOL v25 = v24 > 0.0,
          v23,
          !v25))
    {
      if (v6) {
        v6[2](v6, 0);
      }
    }
    else
    {
      [(PKTiledView *)v27 blitOldTilesIntoNewTiles:v9 completion:v6];
    }
  }
}

- (void)_dismissInsertSpaceHandlesIfNecessary
{
  tileController = self->_tileController;
  if (tileController)
  {
    if ([(NSMutableArray *)tileController[2]._tasks isCurrentlyAddingSpace])
    {
      SEL v4 = self->_tileController;
      if (v4)
      {
        [(NSMutableArray *)v4[2]._tasks didMoveStrokes];
        id v5 = self->_tileController;
        if (v5)
        {
          tasks = v5[2]._tasks;
          [(NSMutableArray *)tasks commitSpacingResize];
        }
      }
    }
  }
}

- (double)_layerContentsScale
{
  id v3 = [(PKTiledView *)self canvasView];
  if (v3)
  {
    SEL v4 = [(PKTiledView *)self canvasView];
    [v4 layerContentsScale];
    double v6 = v5;
  }
  else
  {
    +[PKMetalUtility layerContentsScale];
    double v6 = v7;
  }

  return v6;
}

- (double)canvasZoomScale
{
  id v3 = [(PKTiledView *)self contentCoordinateSpace];

  if (v3)
  {
    [(PKTiledView *)self contentCoordinateSpaceTransform];
    return sqrt(v10 * v10 + v9 * v9);
  }
  else
  {
    double v5 = [(PKTiledView *)self scrollView];

    if (v5)
    {
      double v6 = [(PKTiledView *)self scrollView];
      [v6 zoomScale];
      double v4 = v7;
    }
    else
    {
      return 1.0;
    }
  }
  return v4;
}

- (UICoordinateSpace)contentCoordinateSpace
{
  return (UICoordinateSpace *)self->_maximumSupportedContentVersion;
}

uint64_t __30__PKTiledView_didMoveToWindow__block_invoke()
{
  return +[PKHoverSettings prewarmIfNecessary];
}

- (void)setCanvasViewZOrderPolicy:(int64_t)a3
{
  self->_contentSnapshottingView = (UIView *)a3;
  drawingPolicdouble y = (void *)self->_drawingPolicy;
  if (drawingPolicy)
  {
    [drawingPolicy removeFromSuperview];
    unint64_t v5 = self->_drawingPolicy;
    id v6 = [(PKTiledView *)self scrollView];
    -[PKTiledView insertCanvasView:intoScrollView:](self, "insertCanvasView:intoScrollView:", v5);
  }
}

- (UIImage)paperTexture
{
  v2 = [(PKTiledView *)self canvasView];
  id v3 = [v2 paperTexture];

  return (UIImage *)v3;
}

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKTiledView;
  [(PKTiledView *)&v9 layoutSubviews];
  if ([(PKTiledView *)self needToUpdateViewFrame]) {
    [(PKTiledView *)self _layoutSubviews];
  }
  -[PKSelectionController _layoutViewsIfNecessary]((id *)&self->_tileController->super.isa);
  if (-[PKTiledView isSystemSnapshotting](self))
  {
    self->_disableUndoManager = 1;
  }
  else
  {
    int v3 = [(PKTiledView *)self invertColors];
    drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
    if (drawingTouchThatHitNothing)
    {
      LOBYTE(drawingTouchThatHitNothing[1].super.isa) = v3;
      -[PKMetalRendererController setInvertColors:]((uint64_t)drawingTouchThatHitNothing[3].super.isa, v3);
    }
    int64_t v5 = [(PKTiledView *)self _activeSixChannelBlendingMode];
    id v6 = [(PKTiledView *)self canvasView];
    [v6 setSixChannelBlendingMode:v5];

    BOOL v7 = [(PKTiledView *)self drawBitmapEraserMask];
    double v8 = [(PKTiledView *)self canvasView];
    [v8 setDrawBitmapEraserMask:v7];
  }
}

- (BOOL)_sixChannelBlendingIsActive
{
  BOOL v3 = [(PKTiledView *)self sixChannelBlending];
  if (v3) {
    LOBYTE(v3) = ![(PKTiledView *)self invertColors];
  }
  return v3;
}

- (BOOL)invertColors
{
  v2 = [(PKTiledView *)self traitCollection];
  BOOL v3 = [v2 userInterfaceStyle] == 2;

  return v3;
}

- (BOOL)sixChannelBlending
{
  return self->_isLayingOut;
}

- (int64_t)_activeSixChannelBlendingMode
{
  if (![(PKTiledView *)self _sixChannelBlendingIsActive]) {
    return 0;
  }
  if (self->_hoverIsKnownToBeUnsupported) {
    return 2;
  }
  return 1;
}

- (BOOL)drawBitmapEraserMask
{
  return self->_shouldHideCanvasAfterScroll;
}

- (PKSelectionInteraction)selectionInteraction
{
  return (PKSelectionInteraction *)-[PKSelectionController selectionInteraction]((id *)&self->_tileController->super.isa);
}

uint64_t __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 448) = 1;
  return result;
}

- (void)didMoveToWindow
{
  v13.receiver = self;
  v13.super_class = (Class)PKTiledView;
  [(PKTiledView *)&v13 didMoveToWindow];
  [(PKTiledView *)self updateForAllowedDrawingInput];
  BOOL v3 = [(PKTiledView *)self window];
  double v4 = [v3 windowScene];

  if (v4)
  {
    int64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v6 = [(PKTiledView *)self window];
    BOOL v7 = [v6 windowScene];
    [v5 addObserver:self selector:sel__sceneDidActivate_ name:*MEMORY[0x1E4FB2E80] object:v7];

    double v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_super v9 = [(PKTiledView *)self window];
    double v10 = [v9 windowScene];
    [v8 addObserver:self selector:sel__sceneWillDeactivate_ name:*MEMORY[0x1E4FB2EA8] object:v10];

    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_2);
  }
  else
  {
    [(PKTiledView *)self _endAnalyticsSessionsIfNecessary];
    uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self name:*MEMORY[0x1E4FB2E80] object:0];

    CGFloat v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:*MEMORY[0x1E4FB2EA8] object:0];
  }
}

- (void)setSupportsCopyAsText:(BOOL)a3
{
  self->_hoverPreviewActive = a3;
}

- (void)setInsertSpaceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKTiledView *)self selectionController];
  -[PKSelectionController setInsertSpaceEnabled:]((uint64_t)v4, v3);
}

- (void)setAttachmentContainerView:(id)a3
{
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5 readOnly:(BOOL)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  [v10 bounds];
  v46.receiver = self;
  v46.super_class = (Class)PKTiledView;
  id v11 = -[PKTiledView initWithFrame:](&v46, sel_initWithFrame_);
  if (v11)
  {
    CGFloat v12 = +[PKGenerationModelAvailabilityController sharedInstance];
    [v12 queryGenerationModelAvailabilityStatus];

    *((void *)v11 + 76) = 3;
    *((unsigned char *)v11 + 448) = !v8;
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke;
      block[3] = &unk_1E64C5368;
      id v45 = v11;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    objc_storeStrong((id *)v11 + 66, a5);
    *((unsigned char *)v11 + 499) = v8;
    objc_super v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
    *((unsigned char *)v11 + 503) = [v13 BOOLForKey:@"PKSixChannelDisableSnapshotting"];
    *((unsigned char *)v11 + 498) = +[PKTiledView showDebugOutlines];
    self;
    *((void *)v11 + 87) = 0x4080000000000000;
    id v14 = objc_storeWeak((id *)v11 + 68, v10);
    [v10 _addScrollViewScrollObserver:v11];

    id WeakRetained = objc_loadWeakRetained((id *)v11 + 68);
    [WeakRetained _setLayoutObserver:v11];

    id v16 = objc_loadWeakRetained((id *)v11 + 68);
    [v16 contentOffset];
    *((void *)v11 + 118) = v17;
    *((void *)v11 + 119) = v18;

    id v19 = objc_loadWeakRetained((id *)v11 + 68);
    objc_storeWeak((id *)v11 + 69, v19);

    double v20 = -[PKSelectionController initWithTiledView:]((id *)[PKSelectionController alloc], v11);
    double v21 = (void *)*((void *)v11 + 83);
    *((void *)v11 + 83) = v20;

    double v22 = -[PKRulerController initWithDelegate:]((id *)[PKRulerController alloc], v11);
    double v23 = (void *)*((void *)v11 + 116);
    *((void *)v11 + 116) = v22;

    -[PKRulerController setRulerHostingDelegate:](*((void *)v11 + 116), v11);
    *((unsigned char *)v11 + 502) = 1;
    double v24 = [[PKWelcomeController alloc] initWithTiledView:v11];
    BOOL v25 = (void *)*((void *)v11 + 77);
    *((void *)v11 + 77) = v24;

    BOOL v26 = objc_alloc_init(PKTiledGestureView);
    double v27 = (void *)*((void *)v11 + 90);
    *((void *)v11 + 90) = v26;

    [*((id *)v11 + 90) setTiledView:v11];
    [v11 addSubview:*((void *)v11 + 90)];
    if (!a6) {
      [v11 newCanvasView];
    }
    [v10 addSubview:v11];
    objc_msgSend(v11, "set_maxFileFormatVersion:", +[PKDrawing _currentSerializationVersion](PKDrawingConcrete, "_currentSerializationVersion"));
    *((unsigned char *)v11 + 496) = 1;
    *((void *)v11 + 71) = dyld_program_sdk_at_least() ^ 1;
    id v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v28 addObserver:v11 selector:sel__updateForToolPickerVisibilityChange_ name:@"PKToolPickerWillShowNotification" object:0];

    long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v29 addObserver:v11 selector:sel__updateForToolPickerVisibilityChange_ name:@"PKToolPickerDidShowNotification" object:0];

    long long v30 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v30 addObserver:v11 selector:sel__updateForToolPickerVisibilityChange_ name:@"PKToolPickerDidHideNotification" object:0];

    [(id)objc_opt_class() addObserver:v11 forKeyPath:@"prefersPencilOnlyDrawing" options:0 context:0];
    long long v31 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v31 addObserver:v11 selector:sel__handlePencilSqueezeInteractionDidChangePaletteViewVisibilityNotification_ name:@"PKPencilSqueezeInteractionDidChangePaletteViewVisibilityNotification" object:0];

    [v11 updateForAllowedDrawingInput];
    [v11 setAccessibilityIdentifier:@"com.apple.pencilkit.tiledView"];
    uint64_t v32 = [objc_alloc(MEMORY[0x1E4FB1738]) initWithDelegate:v11];
    long long v33 = (void *)*((void *)v11 + 51);
    *((void *)v11 + 51) = v32;

    [v10 addInteraction:*((void *)v11 + 51)];
    objc_initWeak(&location, v11);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke_2;
    v41[3] = &unk_1E64C5DD8;
    objc_copyWeak(&v42, &location);
    +[PKHoverSettings checkIfHoverIsSupported:v41];
    uint64_t v34 = [objc_alloc(MEMORY[0x1E4FB1758]) initWithDelegate:v11];
    long long v35 = (void *)*((void *)v11 + 115);
    *((void *)v11 + 115) = v34;

    [v11 addInteraction:*((void *)v11 + 115)];
    *((unsigned char *)v11 + 519) = 0;
    *((unsigned char *)v11 + 501) = 1;
    *((unsigned char *)v11 + 464) = 1;
    long long v36 = objc_alloc_init(PKAutoRefineController);
    double v37 = (void *)*((void *)v11 + 59);
    *((void *)v11 + 59) = v36;

    double v38 = [[PKTiledViewAnimationController alloc] initWithTiledView:v11];
    double v39 = (void *)*((void *)v11 + 65);
    *((void *)v11 + 65) = v38;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }
  return v11;
}

- (void)set_maxFileFormatVersion:(int64_t)a3
{
  self->_editMenuInteraction = (UIEditMenuInteraction *)a3;
}

- (void)newCanvasView
{
  id v19 = [(PKTiledView *)self scrollView];
  [v19 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v20 = -[PKTiledCanvasView initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:]([PKTiledCanvasView alloc], "initWithFrame:usePrivateResourceHandler:singleComponent:sixChannelBlending:", 0, 0, [(PKTiledView *)self _sixChannelBlendingIsActive], v4, v6, fmax(v8, 1.0), fmax(v10, 1.0));
  [(PKTiledCanvasView *)v20 setSixChannelBlendingMode:[(PKTiledView *)self _activeSixChannelBlendingMode]];
  id v11 = objc_alloc_init([(PKTiledView *)self defaultDrawingClass]);
  [(PKTiledCanvasView *)v20 setDrawing:v11];

  [(PKTiledCanvasView *)v20 setSelectionController:self->_tileController];
  [(PKTiledCanvasView *)v20 setRulerController:self->_hoverController];
  [(PKTiledCanvasView *)v20 setHidden:1];
  if (qword_1EA3C37F0 != -1) {
    dispatch_once(&qword_1EA3C37F0, &__block_literal_global_1441);
  }
  if ( (id) qword_1EA3C37F8)
  {
    CGFloat v12 = [(PKTiledView *)self scrollView];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      [(PKTiledCanvasView *)v20 setIsPDFCanvasForAnalytics:1];
    }
  }
  if ([(PKTiledView *)self showDebugOutlines])
  {
    id v14 = [(PKTiledCanvasView *)v20 layer];
    [v14 setBorderWidth:2.0];

    id v15 = [MEMORY[0x1E4FB1618] purpleColor];
    uint64_t v16 = [v15 CGColor];
    uint64_t v17 = [(PKTiledCanvasView *)v20 layer];
    [v17 setBorderColor:v16];
  }
  [(PKTiledView *)self setDrawingUndoTarget:self];
  [(PKTiledView *)self setDrawingUndoSelector:sel_performUndo_];
  [(PKTiledCanvasView *)v20 setDelegate:self];
  [(PKTiledCanvasView *)v20 setUserInteractionEnabled:0];
  [(PKTiledView *)self setCanvasView:v20];
  [(PKTiledView *)self setupGestures];
  uint64_t v18 = [(PKTiledView *)self scrollView];
  [(PKTiledView *)self insertCanvasView:v20 intoScrollView:v18];
}

- (BOOL)showDebugOutlines
{
  return self->_shouldAdjustStrokeTransformAtEndOfStroke;
}

- (void)setupGestures
{
  double v3 = objc_alloc_init(PKLongPressGestureRecognizer);
  simultaneousDrawingGestureRecognizer = self->_simultaneousDrawingGestureRecognizer;
  self->_simultaneousDrawingGestureRecognizer = (UIPanGestureRecognizer *)v3;

  double v5 = objc_alloc_init(PKDrawingGestureRecognizer);
  generationToolGestureRecognizer = self->_generationToolGestureRecognizer;
  self->_generationToolGestureRecognizer = (UIPanGestureRecognizer *)v5;

  [(UIPanGestureRecognizer *)self->_generationToolGestureRecognizer setDelegate:self];
  [(UIPanGestureRecognizer *)self->_generationToolGestureRecognizer setName:@"com.apple.PencilKit.simultaneous"];
  double v7 = objc_alloc_init(PKDrawingGestureRecognizer);
  id drawingUndoTarget = self->_drawingUndoTarget;
  self->_id drawingUndoTarget = v7;

  [self->_drawingUndoTarget setName:@"com.apple.PencilKit.generationTool"];
  [self->_drawingUndoTarget setThresholdDistance:5.0];
  if (_os_feature_enabled_impl() && !PKIsDeviceLocked())
  {
    double v9 = [MEMORY[0x1E4F28B50] mainBundle];
    double v10 = [v9 bundleIdentifier];
    int v11 = [v10 isEqualToString:@"com.apple.mobilenotes"];

    if (v11 && !PKIsQuickNoteOnPhone()) {
      goto LABEL_11;
    }
    CGFloat v12 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_super v13 = [v12 bundleIdentifier];

    if ((os_variant_has_internal_diagnostics() & 1) == 0)
    {

      goto LABEL_12;
    }
    if (([v13 isEqualToString:@"com.apple.TestApp"] & 1) != 0
      || ([v13 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
      || ([v13 isEqualToString:@"com.apple.PaperKitTestApp"] & 1) != 0)
    {

LABEL_11:
      [(PKAttachmentView *)self->_liveAttachment addGestureRecognizer:self->_drawingUndoTarget];
      goto LABEL_12;
    }
    int v21 = [v13 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

    if (v21) {
      goto LABEL_11;
    }
  }
LABEL_12:
  id v14 = self->_liveAttachment;
  id v15 = [(PKTiledView *)self canvasView];
  uint64_t v16 = [v15 drawingGestureRecognizer];
  [(PKAttachmentView *)v14 addGestureRecognizer:v16];

  if (_os_feature_enabled_impl())
  {
    uint64_t v17 = self->_simultaneousDrawingGestureRecognizer;
    uint64_t v18 = [(PKTiledView *)self canvasView];
    [v18 setAllowSimultaneousGR:v17];

    [(PKAttachmentView *)self->_liveAttachment addGestureRecognizer:self->_generationToolGestureRecognizer];
    liveAttachment = self->_liveAttachment;
    double v20 = self->_simultaneousDrawingGestureRecognizer;
    [(PKAttachmentView *)liveAttachment addGestureRecognizer:v20];
  }
}

- (void)setDrawingUndoTarget:(id)a3
{
}

- (void)setDrawingUndoSelector:(SEL)a3
{
  self->_selectionController = (PKSelectionController *)a3;
}

- (void)setCanvasView:(id)a3
{
}

- (id)initInScrollView:(id)a3 sixChannelBlending:(BOOL)a4 defaultDrawingClass:(Class)a5
{
  return [(PKTiledView *)self initInScrollView:a3 sixChannelBlending:a4 defaultDrawingClass:a5 readOnly:0];
}

- (Class)defaultDrawingClass
{
  return (Class)self->_linedPaper;
}

- (id)rulerHostingView
{
  uint64_t v3 = [(PKTiledView *)self rulerHostingDelegate];
  if (!v3) {
    goto LABEL_4;
  }
  double v4 = (void *)v3;
  double v5 = [(PKTiledView *)self rulerHostingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0
    || ([(PKTiledView *)self rulerHostingDelegate],
        double v7 = objc_claimAutoreleasedReturnValue(),
        [v7 rulerHostingView],
        double v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue(),
        v7,
        !v8))
  {
LABEL_4:
    double v8 = self;
  }

  return v8;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tileSize);

  return (PKRulerHostingDelegate *)WeakRetained;
}

+ (BOOL)showDebugOutlines
{
  if (qword_1EA3C37E8 != -1) {
    dispatch_once(&qword_1EA3C37E8, &__block_literal_global_334);
  }
  return _MergedGlobals_299;
}

- (void)_sceneDidActivate:(id)a3
{
  if (self && self->_disableUndoManager)
  {
    self->_disableUndoManager = 0;
    [(PKTiledView *)self updateAfterTraitCollectionChange];
    [(PKTiledView *)self updateTilesForVisibleRect];
  }
}

void __32__PKTiledView_showDebugOutlines__block_invoke()
{
  id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.PencilKit"];
  _MergedGlobals_299 = [v0 BOOLForKey:@"PKDebugViews"];
}

void __43__PKTiledView__observeScrollViewDidScroll___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scrollViewDidScroll];
}

- (void)_scrollViewDidScroll
{
  if (!self->_hideCanvasBlock) {
    [(PKTiledView *)self _updateAttachmentOnscreenBounds];
  }
  [(PKTiledView *)self purgeNonVisibleTiles];
  if (self->_aggd_didMergeWithCollaborator) {
    [(PKTiledView *)self _hideCanvas];
  }
  id v4 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  uint64_t v3 = [(PKTiledView *)self scrollView];
  [v3 contentOffset];
  objc_msgSend(v4, "logScrollEventWithContentOffset:");
}

- (void)purgeNonVisibleTiles
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((!self || !self->_didDisableScrollViewPanGestureRecognizer)
    && ![(PKTiledView *)self _isZoomingOrResizing])
  {
    v2 = [MEMORY[0x1E4F28F80] processInfo];
    [v2 systemUptime];
    double v4 = v3;

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    obuint64_t j = [(PKTiledView *)self attachmentViews];
    uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
    if (!v5) {
      goto LABEL_41;
    }
    uint64_t v36 = *(void *)v47;
    while (1)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v47 != v36) {
          objc_enumerationMutation(obj);
        }
        double v7 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        double v8 = [v7 viewRep];
        int v9 = [v8 isHidden];

        if (!v9)
        {
          [(PKTiledView *)self bounds];
          CGRect v55 = CGRectInset(v54, -v54.size.width, -v54.size.height);
          double v23 = -[PKTiledView _tilesForAttachment:bounds:invert:](self, "_tilesForAttachment:bounds:invert:", v7, 1, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
          long long v40 = 0u;
          long long v41 = 0u;
          long long v38 = 0u;
          long long v39 = 0u;
          id v11 = v23;
          uint64_t v24 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
          if (!v24) {
            goto LABEL_38;
          }
          uint64_t v25 = *(void *)v39;
          while (1)
          {
            uint64_t v26 = 0;
            do
            {
              if (*(void *)v39 != v25) {
                objc_enumerationMutation(v11);
              }
              uint64_t v27 = *(void *)(*((void *)&v38 + 1) + 8 * v26);
              if (v27)
              {
                if (*(unsigned char *)(v27 + 84)) {
                  goto LABEL_34;
                }
                *(double *)&unint64_t v28 = COERCE_DOUBLE(atomic_load((unint64_t *)(v27 + 24)));
                double v29 = *(double *)&v28;
              }
              else
              {
                double v29 = 0.0;
              }
              if (v4 - v29 >= 0.1)
              {
                -[PKRendererTile purgeTileLayers](*(void *)(*((void *)&v38 + 1) + 8 * v26));
                long long v30 = [v7 purgedTiles];
                long long v31 = -[PKRendererTile properties]((PKRendererTileProperties *)v27);
                [v30 setObject:v27 forKeyedSubscript:v31];

                uint64_t v32 = [v7 tiles];
                long long v33 = -[PKRendererTile properties]((PKRendererTileProperties *)v27);
                [v32 removeObjectForKey:v33];
              }
LABEL_34:
              ++v26;
            }
            while (v24 != v26);
            uint64_t v34 = [v11 countByEnumeratingWithState:&v38 objects:v50 count:16];
            uint64_t v24 = v34;
            if (!v34)
            {
LABEL_38:

              goto LABEL_39;
            }
          }
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        double v10 = [v7 tiles];
        id v11 = [v10 allValues];

        uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v43;
          do
          {
            uint64_t v14 = 0;
            do
            {
              if (*(void *)v43 != v13) {
                objc_enumerationMutation(v11);
              }
              uint64_t v15 = *(void *)(*((void *)&v42 + 1) + 8 * v14);
              if (v15)
              {
                *(double *)&unint64_t v16 = COERCE_DOUBLE(atomic_load((unint64_t *)(v15 + 24)));
                double v17 = *(double *)&v16;
              }
              else
              {
                double v17 = 0.0;
              }
              if (v4 - v17 >= 0.1)
              {
                -[PKRendererTile purgeTileLayers](*(void *)(*((void *)&v42 + 1) + 8 * v14));
                uint64_t v18 = [v7 purgedTiles];
                id v19 = -[PKRendererTile properties]((PKRendererTileProperties *)v15);
                [v18 setObject:v15 forKeyedSubscript:v19];

                double v20 = [v7 tiles];
                int v21 = -[PKRendererTile properties]((PKRendererTileProperties *)v15);
                [v20 removeObjectForKey:v21];
              }
              ++v14;
            }
            while (v12 != v14);
            uint64_t v22 = [v11 countByEnumeratingWithState:&v42 objects:v51 count:16];
            uint64_t v12 = v22;
          }
          while (v22);
        }
LABEL_39:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v46 objects:v52 count:16];
      if (!v5)
      {
LABEL_41:

        return;
      }
    }
  }
}

void __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained _updateAttachmentOnscreenBounds];
    v2 = (void *)v3[99];
    v3[99] = 0;

    id WeakRetained = v3;
  }
}

- (void)_updateAttachmentOnscreenBounds
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(PKTiledView *)self attachments];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        double v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        double v8 = [v7 drawing];
        [(PKTiledView *)self visibleOnscreenBoundsForDrawing:v8];
        objc_msgSend(v7, "visibleOnscreenBoundsDidChange:");
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTiledView;
  [(PKTiledView *)&v8 traitCollectionDidChange:v4];
  if (self->_drawingTouchThatHitNothing)
  {
    uint64_t v5 = [(PKTiledView *)self window];
    char v6 = [v5 windowScene];
    uint64_t v7 = [v6 activationState];

    if (v7 == 2) {
      self->_disableUndoManager = 1;
    }
    else {
      [(PKTiledView *)self updateAfterTraitCollectionChange];
    }
  }
}

void __80__PKTiledView_initInScrollView_sixChannelBlending_defaultDrawingClass_readOnly___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id **)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v9[0] = 67109120;
      v9[1] = a2;
      _os_log_debug_impl(&dword_1C44F8000, v4, OS_LOG_TYPE_DEBUG, "Hover supported check completed: %d", (uint8_t *)v9, 8u);
    }

    if (a2)
    {
      [WeakRetained _createHoverControllerIfNecessary];
    }
    else
    {
      *((unsigned char *)WeakRetained + 511) = 1;
      if (WeakRetained[117])
      {
        uint64_t v5 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v9[0]) = 0;
          _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "Tearing down hover controller since hover isn't supported", (uint8_t *)v9, 2u);
        }

        char v6 = -[PKHoverController hoverGestureRecognizer](WeakRetained[117]);
        uint64_t v7 = [v6 view];
        [v7 removeGestureRecognizer:v6];

        objc_super v8 = WeakRetained[117];
        WeakRetained[117] = 0;
      }
    }
  }
}

- (id)initInScrollView:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTiledView *)self initInScrollView:v4 defaultDrawingClass:objc_opt_class()];

  return v5;
}

- (id)initInScrollView:(id)a3 defaultDrawingClass:(Class)a4
{
  return [(PKTiledView *)self initInScrollView:a3 sixChannelBlending:0 defaultDrawingClass:a4];
}

- (void)dealloc
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [(PKTiledView *)self _reenableScrollViewPanGestureIfNecessary];
  [self->_drawingPolicy removeFromSuperview];
  hoverConvertToShapeBlocuint64_t k = self->_hoverConvertToShapeBlock;
  if (hoverConvertToShapeBlock)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = hoverConvertToShapeBlock;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v19;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v19 != v6) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v18 + 1) + 8 * v7++) removeAllActionsWithTarget:self];
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v5);
    }
  }
  updateAttachmentBoundsBlocuint64_t k = self->_updateAttachmentBoundsBlock;
  if (updateAttachmentBoundsBlock)
  {
    dispatch_block_cancel(updateAttachmentBoundsBlock);
    id v9 = self->_updateAttachmentBoundsBlock;
    self->_updateAttachmentBoundsBlocuint64_t k = 0;
  }
  hideCanvasBlocuint64_t k = self->_hideCanvasBlock;
  if (hideCanvasBlock)
  {
    dispatch_block_cancel(hideCanvasBlock);
    id v11 = self->_hideCanvasBlock;
    self->_hideCanvasBlocuint64_t k = 0;
  }
  long long v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 removeObserver:self];

  [(id)objc_opt_class() removeObserver:self forKeyPath:@"prefersPencilOnlyDrawing"];
  -[PKTileController teardown]((uint64_t)self->_drawingTouchThatHitNothing);
  uint64_t v13 = [(UIDropInteraction *)self->_dropInteraction view];
  [v13 removeInteraction:self->_dropInteraction];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_attachmentContainerView);
  [WeakRetained _setLayoutObserver:0];

  id v15 = objc_loadWeakRetained((id *)&self->_attachmentContainerView);
  [v15 _removeScrollViewScrollObserver:self];

  double timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
  self->_double timestampForLatestUserInteraction = 0.0;

  v17.receiver = self;
  v17.super_class = (Class)PKTiledView;
  [(PKTiledView *)&v17 dealloc];
}

- (int64_t)effectiveMaximumSupportedContentVersion
{
  int64_t v3 = [(PKTiledView *)self maximumSupportedContentVersion];
  id v4 = [(PKTiledView *)self _activeToolPicker];
  uint64_t v5 = v4;
  if (v4) {
    uint64_t v6 = [v4 maximumSupportedContentVersion];
  }
  else {
    uint64_t v6 = 3;
  }
  if (v3 >= v6) {
    int64_t v3 = v6;
  }

  return v3;
}

- (void)setDelegate:(id)a3
{
  id v11 = a3;
  objc_storeWeak((id *)&self->_canvasViewZOrderPolicy, v11);
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v4 = 2;
  }
  else {
    char v4 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xFD | v4;
  if (objc_opt_respondsToSelector()) {
    char v5 = 4;
  }
  else {
    char v5 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xFB | v5;
  if (objc_opt_respondsToSelector()) {
    char v6 = 8;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xF7 | v6;
  if (objc_opt_respondsToSelector()) {
    char v7 = 16;
  }
  else {
    char v7 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xEF | v7;
  if (objc_opt_respondsToSelector()) {
    char v8 = 32;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xDF | v8;
  if (objc_opt_respondsToSelector()) {
    char v9 = 64;
  }
  else {
    char v9 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = *(unsigned char *)&self->_tiledViewFlags & 0xBF | v9;
  if (objc_opt_respondsToSelector()) {
    char v10 = 0x80;
  }
  else {
    char v10 = 0;
  }
  *(unsigned char *)&self->_tiledViewFlags = v10 & 0x80 | *(unsigned char *)&self->_tiledViewFlags & 0x7F;
}

- (void)_disableScrollViewPanGestureIfNecessary
{
  if (!self || !BYTE3(self->_refineAnimationController))
  {
    id v8 = [(PKTiledView *)self scrollView];
    int64_t v3 = [v8 panGestureRecognizer];
    if ([v3 isEnabled])
    {
      BOOL v4 = [(PKTiledView *)self _shouldPreventScrollViewPanGestureWhilePreviewing];

      if (v4)
      {
        char v5 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "Disable scroll view pan gesture recognizer", buf, 2u);
        }

        if (self) {
          BYTE3(self->_refineAnimationController) = 1;
        }
        char v6 = [(PKTiledView *)self scrollView];
        char v7 = [v6 panGestureRecognizer];
        [v7 setEnabled:0];
      }
    }
    else
    {
    }
  }
}

- (void)_reenableScrollViewPanGestureIfNecessary
{
  if (self && BYTE3(self->_refineAnimationController))
  {
    int64_t v3 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_INFO, "Reenabling scroll view pan gesture recognizer", v6, 2u);
    }

    BOOL v4 = [(PKTiledView *)self scrollView];
    char v5 = [v4 panGestureRecognizer];
    [v5 setEnabled:1];

    BYTE3(self->_refineAnimationController) = 0;
  }
}

- (PKTileController)tileController
{
  if ([(PKTiledView *)self disableTileRendering])
  {
    int64_t v3 = 0;
  }
  else
  {
    if (!self->_drawingTouchThatHitNothing)
    {
      BOOL v4 = [(PKTiledView *)self canvasView];
      char v5 = [v4 metalConfig];
      char v6 = v5;
      if (v5) {
        char v7 = v5;
      }
      else {
        char v7 = objc_alloc_init(PKMetalConfig);
      }
      id v8 = v7;

      self;
      +[PKMetalUtility layerContentsScale];
      double v10 = v9;
      id v11 = [PKTileController alloc];
      int v12 = [(PKTiledView *)self _sixChannelBlendingIsActive];
      double v13 = ceil(v10 * 512.0);
      uint64_t v14 = (UITouch *)-[PKTileController initWithPixelSize:actualSize:pixelFormat:sixChannelBlending:metalConfig:](v11, 80, v12, v8, v13, v13, v13, v13);
      drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
      self->_drawingTouchThatHitNothing = v14;

      int v16 = [(PKTiledView *)self invertColors];
      objc_super v17 = self->_drawingTouchThatHitNothing;
      if (v17)
      {
        LOBYTE(v17[1].super.isa) = v16;
        -[PKMetalRendererController setInvertColors:]((uint64_t)v17[3].super.isa, v16);
      }
    }
    [(PKTiledView *)self canvasZoomScale];
    -[PKTileController setContentZoomScale:]((uint64_t)self->_drawingTouchThatHitNothing, v18);
    int64_t v3 = self->_drawingTouchThatHitNothing;
  }

  return (PKTileController *)v3;
}

- (double)timestampForLatestUserInteraction
{
  int64_t v3 = [(PKTiledView *)self canvasView];
  if (([v3 isDrawing] & 1) == 0)
  {

    return *(double *)&self->_drawingEnabled;
  }
  BOOL v4 = [(PKTiledView *)self canvasView];
  char v5 = [v4 isPreviewing];

  if (v5) {
    return *(double *)&self->_drawingEnabled;
  }

  return CACurrentMediaTime();
}

- (void)_cancelCurrentStrokeAndReduceMemoryFootprint
{
  [(PKTiledView *)self _endHoverToolPreview];
  -[PKHoverController reset](*(void *)&self->_lastContentOffset.x);
  [(PKTiledView *)self _resetDrawingState];
  [(PKTiledView *)self _flushCaches];
  id v3 = [(PKTiledView *)self canvasView];
  [v3 _reduceMemoryFootprint];
}

- (void)_flushCaches
{
  id v3 = [self->_drawingPolicy _rendererController];
  -[PKMetalRendererController flushMemoryIfPossible]((uint64_t)v3);

  drawingTouchThatHitNothing = self->_drawingTouchThatHitNothing;
  if (drawingTouchThatHitNothing)
  {
    isdouble a = (uint64_t)drawingTouchThatHitNothing[3].super.isa;
    -[PKMetalRendererController flushMemoryIfPossible](isa);
  }
}

- (void)_resetDrawingState
{
  id v3 = [(PKTiledView *)self drawingGestureRecognizer];
  [v3 cancel];

  if (([self->_drawingPolicy isHidden] & 1) == 0)
  {
    [(PKTiledView *)self _hideCanvas];
  }
}

- (void)_beginAnalyticsSessionIfNecessary
{
  if (!self->_aggd_cachedVisibleStrokeCount)
  {
    id v3 = objc_alloc_init(PKAnalyticsSession);
    aggd_cachedVisibleStrokeCount = (void *)self->_aggd_cachedVisibleStrokeCount;
    self->_aggd_cachedVisibleStrokeCount = (int64_t)v3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsSession);

  if (!WeakRetained)
  {
    char v6 = [(PKTiledView *)self window];
    char v7 = [v6 windowScene];
    uint64_t v8 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v7);
    double v9 = (void *)v8;
    if (v8) {
      double v10 = *(void **)(v8 + 56);
    }
    else {
      double v10 = 0;
    }
    obuint64_t j = v10;

    id v11 = objc_storeWeak((id *)&self->_analyticsSession, obj);
    -[PKPencilStatisticsManager startAnalyticsSessionIfNecessary]((uint64_t)obj);

    id v12 = objc_loadWeakRetained((id *)&self->_analyticsSession);
    double v13 = [(PKTiledView *)self ink];
    id v15 = [v13 identifier];
    if (v12) {
      objc_setProperty_nonatomic_copy(v12, v14, v15, 40);
    }
  }
}

- (void)_endAnalyticsSessionsIfNecessary
{
  -[PKAnalyticsSession endSessionAndSendAnalytics]((void *)self->_aggd_cachedVisibleStrokeCount);
  aggd_cachedVisibleStrokeCount = (void *)self->_aggd_cachedVisibleStrokeCount;
  self->_aggd_cachedVisibleStrokeCount = 0;

  p_analyticsSession = &self->_analyticsSession;
  id WeakRetained = objc_loadWeakRetained((id *)p_analyticsSession);
  -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)WeakRetained);

  objc_storeWeak((id *)p_analyticsSession, 0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v6 = (UIPanGestureRecognizer *)a3;
  char v7 = (UIPanGestureRecognizer *)a4;
  uint64_t v8 = v7;
  generationToolGestureRecognizer = self->_generationToolGestureRecognizer;
  BOOL v11 = generationToolGestureRecognizer == v6 || generationToolGestureRecognizer == v7;
  id v12 = [(PKTiledView *)self canvasView];
  double v13 = [v12 drawingGestureRecognizer];

  if (v11)
  {
    char v14 = 1;
  }
  else
  {
    simultaneousDrawingGestureRecognizer = self->_simultaneousDrawingGestureRecognizer;
    BOOL v17 = v13 != v6 && v13 != v8;
    char v19 = simultaneousDrawingGestureRecognizer != v6 && simultaneousDrawingGestureRecognizer != v8 || v17;
    char v14 = v19 ^ 1;
  }

  return v14;
}

- (void)setDefaultDrawingClass:(Class)a3
{
  p_linedPaper = &self->_linedPaper;
  if (*p_linedPaper != (PKLinedPaper *)a3)
  {
    objc_storeStrong((id *)p_linedPaper, a3);
    id v6 = objc_alloc_init(a3);
    objc_msgSend(self->_drawingPolicy, "setDrawing:");
  }
}

- (void)setInk:(id)a3
{
  id v4 = a3;
  char v5 = [v4 identifier];
  id v6 = [(PKTiledView *)self canvasView];
  char v7 = [v6 ink];
  uint64_t v8 = [v7 identifier];
  char v9 = [v5 isEqualToString:v8];

  if ((v9 & 1) == 0)
  {
    double v10 = [(PKTiledView *)self window];
    BOOL v11 = [v10 windowScene];
    id v12 = +[PKPencilShadowView shadowViewForScene:v11];
    [v12 setInk:v4];

    if (([v4 _isEraserInk] & 1) != 0
      || ([(PKTiledView *)self canvasView],
          double v13 = objc_claimAutoreleasedReturnValue(),
          [v13 ink],
          char v14 = objc_claimAutoreleasedReturnValue(),
          char v15 = [v14 _isEraserInk],
          v14,
          v13,
          (v15 & 1) != 0))
    {
      if (!self)
      {
LABEL_10:
        id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsSession);
        -[PKPencilStatisticsManager endAnalyticsSessionIfNecessary]((uint64_t)WeakRetained);

        objc_storeWeak((id *)&self->_analyticsSession, 0);
        goto LABEL_11;
      }
    }
    else
    {
      LOBYTE(self->_autoRefineController) = 1;
    }
    if (BYTE1(self->_refineAnimationController) || BYTE2(self->_refineAnimationController))
    {
      [(PKTiledView *)self _endHoverToolPreview];
      int v16 = [(PKTiledView *)self hoverController];
      -[PKHoverController reset]((uint64_t)v16);

      [(PKTiledView *)self _resetDrawingState];
    }
    goto LABEL_10;
  }
LABEL_11:
  [(PKTiledView *)self _updateDrawingGestureEnablementWithInk:v4];
  double v18 = [(PKTiledView *)self canvasView];
  char v19 = [v18 ink];
  long long v20 = [v19 identifier];
  if (![v20 isEqual:@"com.apple.ink.objectEraser"])
  {
LABEL_17:

    goto LABEL_18;
  }
  long long v21 = [(PKTiledView *)self canvasView];
  id v43 = v4;
  uint64_t v22 = [v21 ink];
  uint64_t v23 = [v22 identifier];
  uint64_t v24 = [v4 identifier];
  if (([v23 isEqual:v24] & 1) != 0
    || (int64_t maxFileFormatVersion = self->__maxFileFormatVersion,
        maxFileFormatVersion != [(PKTiledView *)self _totalVisibleStrokes]))
  {

    id v4 = v43;
    goto LABEL_17;
  }
  BOOL v42 = [(PKTiledView *)self aggd_didMergeWithCollaborator];

  id v4 = v43;
  if (!v42)
  {
    uint64_t v26 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordInkPickerNoOp:]((uint64_t)v26, @"eraser");

    goto LABEL_22;
  }
LABEL_18:
  uint64_t v27 = [v4 identifier];
  int v28 = [v27 isEqual:@"com.apple.ink.objectEraser"];

  if (v28)
  {
    self->__int64_t maxFileFormatVersion = [(PKTiledView *)self _totalVisibleStrokes];
    [(PKTiledView *)self setAggd_didMergeWithCollaborator:0];
  }
  else if ([v4 _isHandwritingInk])
  {
    [(PKTiledView *)self setRulerEnabled:0];
  }
LABEL_22:
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  long long v30 = tileController;
  char v31 = [(PKTileController *)v30 isDragging];

  if (v31) {
    goto LABEL_34;
  }
  uint64_t v32 = self->_tileController;
  if (v32 && *(void *)&v32[2]._contentZoomScale
    || -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((BOOL)v32, 0))
  {
    long long v33 = [v4 inkType];
    uint64_t v34 = [(PKTiledView *)self ink];
    long long v35 = [v34 inkType];
    char v36 = [v33 isEqual:v35];

    if ((v36 & 1) == 0)
    {
      long long v38 = self->_tileController;
      if (v38) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)v38, 1, 0);
      }
      goto LABEL_34;
    }
  }
  double v37 = self->_tileController;
  if (!v37 || !*(void *)&v37[2]._contentZoomScale)
  {
LABEL_34:
    long long v39 = [(PKTiledView *)self canvasView];
    [v39 setInk:v4];

    long long v40 = [(PKTiledView *)self selectionController];
    long long v41 = -[PKSelectionController selectionInteraction](v40);
    [v41 _updateAllowedTouchTypesForSelectedInk:v4];

    objc_initWeak(&location, self);
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __22__PKTiledView_setInk___block_invoke;
    v44[3] = &unk_1E64C5DD8;
    objc_copyWeak(&v45, &location);
    +[PKHoverSettings checkIfHoverIsSupported:v44];
    objc_destroyWeak(&v45);
    objc_destroyWeak(&location);
  }
}

void __22__PKTiledView_setInk___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 && WeakRetained)
  {
    id v6 = WeakRetained;
    id v4 = [WeakRetained window];
    char v5 = +[PKToolPicker existingPaletteViewForWindow:v4];

    if (v5) {
      [v5 setHoverDelegate:v6];
    }

    id WeakRetained = v6;
  }
}

- (void)setSelectedStrokesColor:(id)a3
{
  id v8 = a3;
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  char v5 = tileController;
  char v6 = [(PKTileController *)v5 isDragging];

  if ((v6 & 1) == 0)
  {
    char v7 = self->_tileController;
    if (v7)
    {
      if (*(void *)&v7[2]._contentZoomScale) {
        -[PKSelectionController changeColorOfSelection:]((uint64_t)v7, v8);
      }
    }
  }
}

- (void)setPaperTexture:(id)a3
{
  id v5 = a3;
  id v4 = [(PKTiledView *)self canvasView];
  [v4 setPaperTexture:v5];
}

- (int64_t)_totalVisibleStrokes
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = [(PKTiledView *)self attachments];
  int64_t v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        char v7 = [*(id *)(*((void *)&v11 + 1) + 8 * v6) drawing];
        id v8 = [v7 strokes];
        uint64_t v9 = [v8 count];

        v3 += v9;
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }

  return v3;
}

- (BOOL)_toolPickerIsOrWillBeVisible
{
  v2 = [(PKTiledView *)self _activeToolPicker];
  int64_t v3 = v2;
  if (v2)
  {
    if ([v2 isVisible]) {
      char v4 = 1;
    }
    else {
      char v4 = [v3 _isAnimatingToVisible];
    }
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (void)_setDrawingEnabled:(BOOL)a3
{
  if (self->_selectionHidden != a3)
  {
    self->_selectionHidden = a3;
    [(PKTiledView *)self _updateDrawingGestureEnablement];
  }
}

- (void)setDrawingPolicy:(unint64_t)a3
{
  if (self->_delegate != (PKTiledViewDelegate *)a3)
  {
    self->_delegate = (PKTiledViewDelegate *)a3;
    [(PKTiledView *)self updateForAllowedDrawingInput];
  }
}

- (void)showImageWandTipWithController:(id)a3 toolPicker:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isVisible])
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v8 = [(PKTiledView *)self visibleAttachments];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v33 != v10) {
            objc_enumerationMutation(v8);
          }
          long long v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          [v12 frame];
          CGFloat v14 = v13;
          CGFloat v16 = v15;
          CGFloat v18 = v17;
          CGFloat v20 = v19;
          long long v21 = [(PKTiledView *)self scrollView];
          [v21 visibleBounds];
          v39.origin.x = v22;
          v39.origin.double y = v23;
          v39.size.width = v24;
          v39.size.height = v25;
          v38.origin.x = v14;
          v38.origin.double y = v16;
          v38.size.width = v18;
          v38.size.height = v20;
          BOOL v26 = CGRectIntersectsRect(v38, v39);

          if (v26)
          {
            uint64_t v27 = [v12 drawing];
            [v27 bounds];
            double v29 = v28;
            double v31 = v30;

            if (v29 > 0.0 && v31 > 0.0)
            {
              [v7 _showImageWandTipWithController:v6];
              goto LABEL_14;
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
}

- (void)_updateForToolPickerVisibilityChange:(id)a3
{
  id v8 = a3;
  char v4 = [v8 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:@"PKToolPickerNotificationWindowSceneUserInfoKey"];
  id v6 = [(PKTiledView *)self window];
  id v7 = [v6 windowScene];

  if (v5 == v7) {
    [(PKTiledView *)self _toolPickerVisibilityDidChange];
  }
}

- (id)_activeToolPicker
{
  int64_t v3 = [(PKTiledView *)self window];

  if (v3)
  {
    char v4 = [(PKTiledView *)self window];
    int64_t v3 = +[PKToolPicker activeToolPickerForWindow:v4];
  }

  return v3;
}

- (void)_handlePencilSqueezeInteractionDidChangePaletteViewVisibilityNotification:(id)a3
{
  char v4 = [(PKTiledView *)self window];
  uint64_t v5 = [v4 windowScene];
  id v6 = +[PKPencilSqueezeInteraction _existingInteractionForWindowScene:v5];
  int v7 = [v6 _paletteViewVisible];

  if (v7)
  {
    [(PKTiledView *)self updateForAllowedDrawingInput];
  }
}

- (void)_updateDrawingGestureEnablement
{
  id v4 = [(PKTiledView *)self canvasView];
  int64_t v3 = [v4 ink];
  [(PKTiledView *)self _updateDrawingGestureEnablementWithInk:v3];
}

- (void)_updateDrawingGestureEnablementWithInk:(id)a3
{
  id v12 = a3;
  if ([(PKTiledView *)self _isDrawingEnabled])
  {
    int v4 = [v12 _isLassoInk];
    uint64_t v5 = [v12 _isGenerationTool];
    id v6 = [(PKTiledView *)self drawingGestureRecognizer];
    uint64_t v7 = (v4 | v5) ^ 1;
    [v6 setEnabled:v7];

    id v8 = [(PKTiledView *)self simultaneousDrawingGestureRecognizer];
    [v8 setEnabled:v7];

    uint64_t v9 = [(PKTiledView *)self generationToolGestureRecognizer];
    [v9 setEnabled:v5];
  }
  else
  {
    uint64_t v10 = [(PKTiledView *)self drawingGestureRecognizer];
    [v10 setEnabled:0];

    long long v11 = [(PKTiledView *)self simultaneousDrawingGestureRecognizer];
    [v11 setEnabled:0];

    uint64_t v9 = [(PKTiledView *)self generationToolGestureRecognizer];
    [v9 setEnabled:0];
  }
}

- (BOOL)_isVirtualDevice
{
  return 0;
}

- (void)setLinedPaper:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (UIScrollView *)[v4 copy];
  scrollView = self->_scrollView;
  self->_scrollView = v5;

  uint64_t v7 = [(PKTiledView *)self canvasView];
  [v7 setLinedPaper:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v8 = [(PKTiledView *)self attachmentViews];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setNeedsLayout];
      }
      while (v9 != v11);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)setRulerEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (!PKIsVisionDevice())
  {
    self->_rulerEnabled = v3;
    hoverController = self->_hoverController;
    if (v3)
    {
      -[PKRulerController showRuler]((uint64_t)hoverController);
    }
    else if (hoverController)
    {
      -[PKRulerController hideRulerAnimated:]((uint64_t)hoverController, 1);
    }
    id v6 = [(PKTiledView *)self _activeToolPicker];
    if ([v6 isRulerActive] != v3) {
      [v6 setRulerActive:v3];
    }
  }
}

- (BOOL)rulerEnabled
{
  return self->_rulerEnabled;
}

- (CGAffineTransform)rulerTransform
{
  [(PKRulerController *)(uint64_t)self->_hoverController rulerTransform];
  return result;
}

- (double)rulerWidth
{
  hoverController = self->_hoverController;
  if (hoverController)
  {
    id v4 = *(id *)&hoverController->_waitingForHoverHoldTimestamp;
    uint64_t v5 = v4;
    if (v4)
    {
      id v6 = (void *)*((void *)v4 + 52);
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = 0;
LABEL_4:
  id v7 = v6;
  [v7 rulerWidth];
  double v9 = v8;
  uint64_t v10 = self->_hoverController;
  if (!v10)
  {
    long long v12 = 0;
    goto LABEL_11;
  }
  id v11 = *(id *)&v10->_waitingForHoverHoldTimestamp;
  long long v12 = v11;
  if (!v11)
  {
LABEL_11:
    long long v13 = 0;
    goto LABEL_7;
  }
  long long v13 = (void *)*((void *)v11 + 52);
LABEL_7:
  id v14 = v13;
  [v14 rulerAlignInset];
  double v16 = v9 - v15;

  return v16;
}

- (void)setRulerHostingDelegate:(id)a3
{
  p_tileSize = &self->_tileSize;
  id v6 = (PKTiledView *)a3;
  objc_storeWeak((id *)p_tileSize, v6);
  if (v6) {
    uint64_t v5 = v6;
  }
  else {
    uint64_t v5 = self;
  }
  -[PKRulerController setRulerHostingDelegate:]((uint64_t)self->_hoverController, v5);
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)selectionSupportsCopyAsText
{
  return -[PKSelectionController supportsCopyAsText]((uint64_t)self->_tileController);
}

- (BOOL)selectionSupportsTranslate
{
  if (!self->_tileController) {
    return 0;
  }
  id LTUITranslationViewControllerClass = getLTUITranslationViewControllerClass();

  return [LTUITranslationViewControllerClass isAvailable];
}

- (void)selectionSupportsRefinement:(id)a3
{
  id v4 = a3;
  if (-[PKSelectionController refinementEnabled]((uint64_t)self->_tileController))
  {
    -[PKSelectionController supportsRefinement:]((id *)&self->_tileController->super.isa, v4);
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (BOOL)selectionSupportsSnapToShape
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  BOOL v3 = tileController;
  char v4 = [(PKTileController *)v3 supportsSnapToShape];

  return v4;
}

- (void)refineSelection
{
}

- (void)copyTranscriptionOfSelection
{
}

- (void)translateSelection
{
}

- (void)straightenSelection
{
}

- (void)snapToShapeSelection
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  BOOL v3 = tileController;
  [(PKTileController *)v3 convertToShapes:0];
}

- (void)selectAll:(id)a3
{
}

- (void)paste:(id)a3
{
}

- (void)cut:(id)a3
{
}

- (void)copy:(id)a3
{
}

- (void)delete:(id)a3
{
}

- (void)duplicate:(id)a3
{
}

- (void)insertSpace:(id)a3
{
  id v5 = a3;
  char v4 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v4, 2);

  -[PKSelectionController insertSpace:]((id *)&self->_tileController->super.isa, v5);
}

- (void)insertSpaceAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordInsertSpaceWithType:]((uint64_t)v6, 2);

  tileController = self->_tileController;

  [(PKSelectionController *)(id *)&tileController->super.isa insertSpaceAtPoint:0 addDefaultSpace:0 strokesAbove:x strokesBelow:y];
}

- (void)createSticker:(id)a3
{
}

- (void)_share:(id)a3
{
}

- (id)_currentStroke
{
  return (id)[self->_drawingPolicy currentStroke];
}

- (id)_liveDrawing
{
  return (id)[self->_drawingPolicy liveDrawing];
}

- (BOOL)_shouldExpandBottomAttachmentForDragAndDrop
{
  return 0;
}

- (double)inputScale
{
  drawingPolicdouble y = (void *)self->_drawingPolicy;
  if (!drawingPolicy) {
    return 1.0;
  }
  [drawingPolicy _inputScale];
  return result;
}

- (void)setSixChannelBlending:(BOOL)a3
{
  if (self->_isLayingOut != a3)
  {
    self->_isLayingOut = a3;
    int64_t v4 = [(PKTiledView *)self _activeSixChannelBlendingMode];
    id v5 = [(PKTiledView *)self canvasView];
    [v5 setSixChannelBlendingMode:v4];

    [(PKTiledView *)self updateAfterTraitCollectionChange];
  }
}

- (void)setDrawBitmapEraserMask:(BOOL)a3
{
  if (self->_shouldHideCanvasAfterScroll != a3)
  {
    self->_shouldHideCanvasAfterScroll = a3;
    objc_msgSend(self->_drawingPolicy, "setDrawBitmapEraserMask:");
  }
}

- (BOOL)isAutoRefineEnabled
{
  externalAttachments = self->_externalAttachments;
  return externalAttachments && LOBYTE(externalAttachments[3].super.isa) != 0;
}

- (void)setIsAutoRefineEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  externalAttachments = self->_externalAttachments;
  if (externalAttachments) {
    -[PKAutoRefineController setIsAutoRefineOn:force:]((uint64_t)externalAttachments, a3, 1);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = [(PKTiledView *)self attachmentViews];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * i) _handleAutoRefineSettingsDidChange];
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)updateAfterTraitCollectionChange
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v3 = [(PKTiledView *)self invertColors];
  BOOL v4 = [(PKTiledView *)self _sixChannelBlendingIsActive];
  id v5 = [(PKTiledView *)self tileController];
  if (v5) {
    BOOL v6 = v5[9] != 0;
  }
  else {
    BOOL v6 = 0;
  }

  uint64_t v7 = [(PKTiledView *)self tileController];
  BOOL v8 = v4 ^ v6;
  if (v7) {
    BOOL v9 = v7[8] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  int v10 = v3 ^ v9 | v8;

  if (v10 == 1)
  {
    uint64_t v11 = [(PKTiledView *)self tileController];
    long long v12 = (void *)v11;
    if (v11)
    {
      *(unsigned char *)(v11 + 8) = v3;
      -[PKMetalRendererController setInvertColors:](*(void *)(v11 + 24), v3);
    }

    long long v13 = [(PKTiledView *)self tileController];
    -[PKTileController setSixChannelBlending:]((uint64_t)v13, v4);

    [(PKTiledView *)self cancelTileGenerationInvalidateTiles:1];
    if (v8)
    {
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      uint64_t v14 = [(PKTiledView *)self attachmentViews];
      uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v21;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v21 != v16) {
              objc_enumerationMutation(v14);
            }
            [*(id *)(*((void *)&v20 + 1) + 8 * v17++) setSixChannelBlending:v4];
          }
          while (v15 != v17);
          uint64_t v15 = [v14 countByEnumeratingWithState:&v20 objects:v24 count:16];
        }
        while (v15);
      }

      int64_t v18 = [(PKTiledView *)self _activeSixChannelBlendingMode];
      double v19 = [(PKTiledView *)self canvasView];
      [v19 setSixChannelBlendingMode:v18];
    }
    [(PKTiledView *)self _layoutSubviews];
  }
}

- (id)visibleOnScreenStrokesForDrawing:(id)a3
{
  BOOL v4 = [a3 uuid];
  id v5 = [(PKTiledView *)self attachmentForUUID:v4];

  uint64_t v6 = [v5 strokeSpatialCache];
  uint64_t v7 = (void *)v6;
  if (v6) {
    BOOL v8 = *(void **)(v6 + 24);
  }
  else {
    BOOL v8 = 0;
  }
  id v9 = v8;

  return v9;
}

- (id)smoothedHullForStroke:(id)a3
{
  id v3 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x4812000000;
  uint64_t v16 = __Block_byref_object_copy__1;
  uint64_t v17 = __Block_byref_object_dispose__1;
  int64_t v18 = "";
  long long v20 = 0;
  uint64_t v21 = 0;
  double v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __37__PKTiledView_smoothedHullForStroke___block_invoke;
  v12[3] = &unk_1E64C59C8;
  v12[4] = &v13;
  [v3 interpolatePointDataWithStep:v12 usingBlock:1.0];
  +[PKPathUtility smoothedHullForPoints:v14 + 6];
  BOOL v4 = +[PKPathUtility bezierPathFromPoints:__p];
  id v5 = [PKStroke alloc];
  id v6 = v4;
  uint64_t v7 = [v6 CGPath];
  BOOL v8 = [v3 ink];
  id v9 = [(PKStroke *)v5 _initWithPath:v7 ink:v8 inputScale:1.0];

  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  _Block_object_dispose(&v13, 8);
  if (v19)
  {
    long long v20 = v19;
    operator delete(v19);
  }

  return v9;
}

void __37__PKTiledView_smoothedHullForStroke___block_invoke(uint64_t a1, double a2, double a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = (double *)v5[7];
  unint64_t v7 = v5[8];
  if ((unint64_t)v6 >= v7)
  {
    id v9 = (double *)v5[6];
    uint64_t v10 = ((char *)v6 - (char *)v9) >> 4;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 60) {
      std::vector<CGPoint>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v12 = v7 - (void)v9;
    if (v12 >> 3 > v11) {
      unint64_t v11 = v12 >> 3;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v13 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<CGPoint>>((uint64_t)(v5 + 8), v13);
      id v9 = (double *)v5[6];
      id v6 = (double *)v5[7];
    }
    else
    {
      uint64_t v14 = 0;
    }
    uint64_t v15 = (double *)&v14[16 * v10];
    uint64_t v16 = &v14[16 * v13];
    double *v15 = a2;
    v15[1] = a3;
    BOOL v8 = v15 + 2;
    if (v6 != v9)
    {
      do
      {
        *((_OWORD *)v15 - 1) = *((_OWORD *)v6 - 1);
        v15 -= 2;
        v6 -= 2;
      }
      while (v6 != v9);
      id v9 = (double *)v5[6];
    }
    v5[6] = v15;
    v5[7] = v8;
    v5[8] = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    double *v6 = a2;
    v6[1] = a3;
    BOOL v8 = v6 + 2;
  }
  v5[7] = v8;
}

- (id)canvasView:(id)a3 attachmentViewForDrawing:(id)a4
{
  id v5 = objc_msgSend(a4, "uuid", a3);
  id v6 = [(PKTiledView *)self attachmentForUUID:v5];

  return v6;
}

- (void)canvasView:(id)a3 textStrokesCoveredByStroke:(id)a4 drawing:(id)a5 completion:(id)a6
{
  id v13 = a4;
  id v9 = a6;
  uint64_t v10 = [a5 uuid];
  unint64_t v11 = [(PKTiledView *)self attachmentForUUID:v10];

  uint64_t v12 = [v11 recognitionManager];
  -[PKRecognitionSessionManager textStrokesCoveredByStroke:completion:]((uint64_t)v12, v13, v9);
}

- (id)attachmentForUUID:(id)a3
{
  id v3 = [(PKTiledView *)self _attachmentForUUID:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return v4;
}

- (void)_setExternalAttachments:(id)a3
{
  id v6 = a3;
  double v4 = COERCE_DOUBLE([v6 copy]);
  double timestampForLatestUserInteraction = self->_timestampForLatestUserInteraction;
  self->_double timestampForLatestUserInteraction = v4;
}

- (id)topZAttachment
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v2 = [(PKTiledView *)self _visibleAttachments];
  id v3 = 0;
  uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        unint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (v3)
        {
          BOOL v8 = [v3 viewRep];
          id v9 = [v7 viewRep];
          int v10 = objc_msgSend(v8, "PK_isBelowViewInDepth:", v9);

          if (!v10) {
            continue;
          }
        }
        id v11 = v7;

        id v3 = v11;
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  return v3;
}

- (id)undoManager
{
  if ([(PKTiledView *)self disableUndoManager])
  {
    id v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PKTiledView;
    id v3 = [(PKTiledView *)&v5 undoManager];
  }

  return v3;
}

- (id)standInAttachmentView
{
  return 0;
}

- (void)startedDrawingInBlankSpaceWithTouch:(id)a3 location:(CGPoint)a4
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_rulerHostingDelegate, a3);
  if (v12)
  {
    id v6 = [(PKTiledView *)self viewForAttachmentAtBlankSpace];
  }
  else
  {
    id v6 = 0;
  }
  id v7 = [v6 drawing];
  if (!v7) {
    id v7 = +[PKTiledView newInlineDrawingOfClass:[(PKTiledView *)self defaultDrawingClass]];
  }
  BOOL v8 = [(PKTiledView *)self canvasView];
  [v8 setDrawing:v7];

  [(PKTiledView *)self defaultDrawingClass];
  if (objc_opt_isKindOfClass())
  {
    id v9 = [(PKTiledView *)self standInAttachmentView];
    [v9 setDrawing:v7];

    int v10 = [(PKTiledView *)self standInAttachmentView];
    id v11 = [(PKTiledView *)self canvasView];
    [(PKTiledView *)self renderAttachment:v10 intoCanvas:v11 showing:1];
  }
  else
  {
    if (!v6) {
      goto LABEL_11;
    }
    int v10 = [(PKTiledView *)self canvasView];
    [(PKTiledView *)self renderAttachment:v6 intoCanvas:v10 showing:1];
  }

LABEL_11:
}

- (void)canvasViewWillBeginNewStroke:(id)a3 withTouch:(id)a4 location:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  id v9 = a3;
  id v10 = a4;
  if (v10)
  {
    id v11 = [(PKTiledView *)self hoverController];
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)v11, v10);

    [(PKTiledView *)self canvasZoomScale];
    double v13 = v12;
    uint64_t v14 = [(PKTiledView *)self drawingController];
    long long v15 = (void *)v14;
    if (v14) {
      long long v16 = *(void **)(v14 + 64);
    }
    else {
      long long v16 = 0;
    }
    id v17 = v16;
    -[PKMetalRendererController setContentZoomScale:]((uint64_t)v17, v13);

    [v10 locationInView:self];
    double x = v18;
    double y = v19;
  }
  id v20 = [(PKTiledView *)self tileController];
  if (v10)
  {
    -[PKHoverController reset](*(void *)&self->_lastContentOffset.x);
    uint64_t v21 = [(PKTiledView *)self selectionController];
    if (v21)
    {
      uint64_t v22 = v21[16];

      if (!v22) {
        goto LABEL_11;
      }
      uint64_t v23 = [(PKTiledView *)self selectionController];
      CGFloat v24 = (void *)v23;
      if (v23) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v23, 1, 0);
      }
    }
    else
    {
      CGFloat v24 = 0;
    }
  }
LABEL_11:
  [(PKTiledView *)self cancelTileGenerationInvalidateTiles:0];
  kdebug_trace();
  if (self)
  {
    self->_aggd_didMergeWithCollaborator = 0;
    self->_symbolPreviewActive = 0;
  }
  uint64_t v25 = -[PKTiledView _hitAttachment:](self, "_hitAttachment:", x, y);
  if (v25)
  {
    if (v10)
    {
      id v26 = [(PKTiledView *)self drawingTouchThatHitNothing];

      if (self)
      {
        if (v26 == v10) {
          self->_symbolPreviewActive = 1;
        }
      }
    }
    rulerHostingDelegate = self->_rulerHostingDelegate;
    self->_rulerHostingDelegate = 0;

    uint64_t v28 = objc_opt_class();
    double v29 = PKDynamicCast(v28, v25);
    objc_storeStrong((id *)&self->_currentDrawingBeingCopiedToCanvas, v29);

    if ([v9 isErasingObjects])
    {
      double v30 = [v25 drawing];
      [v9 setDrawing:v30];

      [(PKTiledView *)self getAttachment:v25 tileTransform:buf strokeTransform:v39 paperTransform:&v38];
      goto LABEL_26;
    }
    double v31 = [v9 drawing];
    long long v32 = [(PKTiledView *)self liveAttachment];
    long long v33 = [v32 drawing];
    if (v31 != v33)
    {

LABEL_25:
      [(PKTiledView *)self _layoutSubviewsUpdateTilesForRendering:0];
      char v36 = [(PKTiledView *)self liveAttachment];
      [(PKTiledView *)self renderAttachment:v36 intoCanvas:v9 showing:1];

      goto LABEL_26;
    }
    long long v34 = [(PKTiledView *)self canvasView];
    int v35 = [v34 isHidden];

    if (v35) {
      goto LABEL_25;
    }
    uint64_t v37 = os_log_create("com.apple.pencilkit", "Sketching");
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C44F8000, v37, OS_LOG_TYPE_INFO, "Skip render attachment", buf, 2u);
    }
  }
  else if (([v9 isErasingObjects] & 1) == 0)
  {
    -[PKTiledView startedDrawingInBlankSpaceWithTouch:location:](self, "startedDrawingInBlankSpaceWithTouch:location:", v10, x, y);
  }
LABEL_26:
}

- (void)setLiveAttachment:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 728), a2);
  }
}

- (void)_canvasViewWillBeginDrawing:(id)a3 startPoint:(id *)a4 forPreview:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (a5)
  {
    [(PKTiledView *)self _setupPencilShadowViewIfNecessary];
  }
  else
  {
    id v9 = [(PKTiledView *)self hoverController];
    -[PKHoverController didReceiveNormalTouch:]((uint64_t)v9, 0);

    id v10 = [(PKTiledView *)self delegate];
    [v10 _canvasViewWillBeginDrawing:self];
  }
  id v11 = +[PKPencilDevice activePencil];
  [v11 timeIntervalSinceUsed];
  double v13 = v12;

  if (v13 <= 60.0)
  {
    if (!LOBYTE(self->_autoRefineController)) {
      goto LABEL_10;
    }
  }
  else
  {
    LOBYTE(self->_autoRefineController) = 1;
  }
  uint64_t v14 = os_log_create("com.apple.pencilkit", "Drawing");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double var12 = a4->var12;
    int v24 = 134217984;
    double v25 = var12;
    _os_log_impl(&dword_1C44F8000, v14, OS_LOG_TYPE_DEFAULT, "Resetting base roll value to: %g", (uint8_t *)&v24, 0xCu);
  }

  LOBYTE(self->_autoRefineController) = 0;
  double v16 = a4->var12;
  id v17 = +[PKPencilDevice activePencil];
  [v17 setBaseRollAngle:v16];

LABEL_10:
  double v18 = +[PKPencilDevice activePencil];
  [v18 baseRollAngle];
  uint64_t v20 = v19;
  uint64_t v21 = [(PKTiledView *)self drawingController];
  -[PKController inputController](v21);
  uint64_t v22 = (os_unfair_lock_s *)objc_claimAutoreleasedReturnValue();
  uint64_t v23 = v22;
  if (v22)
  {
    os_unfair_lock_lock(v22 + 76);
    *(void *)&v23[90]._os_unfair_lock_opaque = v20;
    os_unfair_lock_unlock(v23 + 76);
  }
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(PKTiledView *)self delegate];
  [v4 canvasViewDidBeginDrawing:self];

  objc_super v5 = [v13 activeDrawing];
  id v6 = [v5 uuid];
  id v7 = [(PKTiledView *)self attachmentForUUID:v6];
  [v7 didBeginDrawing];

  id v8 = +[PKSelectionStatisticsManager sharedStatisticsManager];
  [v8 logEndSelectionSessionIfNecessary];

  uint64_t v9 = [(PKTiledView *)self selectionController];
  id v10 = (void *)v9;
  if (v9) {
    id v11 = *(void **)(v9 + 144);
  }
  else {
    id v11 = 0;
  }
  id v12 = v11;
  [v12 invalidateCachedStrokes];
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = [(PKTiledView *)self delegate];
  [v5 canvasViewDidEndDrawing:self];

  id v6 = [v4 activeDrawing];
  id v7 = [v6 uuid];
  id v8 = [(PKTiledView *)self _attachmentForUUID:v7];

  uint64_t v9 = objc_opt_class();
  id v10 = PKDynamicCast(v9, v8);
  id v11 = v10;
  if (v10) {
    [v10 didEndDrawing];
  }
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  src[0] = *MEMORY[0x1E4F1DAB8];
  src[1] = v12;
  src[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (self)
  {
    objc_copyStruct(&self->_strokeTransformAdjustment.b, src, 48, 1, 0);
    if (self->_symbolPreviewActive)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
      if (v8)
      {
        [v8 drawingTransform];
        double v13 = *((double *)&v24 + 1);
        double v14 = *(double *)&v24;
      }
      else
      {
        double v13 = 0.0;
        double v14 = 0.0;
      }
      double v15 = sqrt(v13 * v13 + v14 * v14);
      if (v15 <= 0.0)
      {
        self->_symbolPreviewActive = 0;
      }
      else
      {
        [(PKTiledView *)self getAttachment:v8 tileTransform:v23 strokeTransform:v21 paperTransform:v20];
        double v16 = self->_strokeTransformAdjustment.a - v22;
        id v17 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218240;
          double v29 = v16;
          __int16 v30 = 2048;
          double v31 = v15;
          _os_log_debug_impl(&dword_1C44F8000, v17, OS_LOG_TYPE_DEBUG, "Adjusting stroke transform at end of stroke: %g, %g", buf, 0x16u);
        }

        CGAffineTransformMakeTranslation(&v19, 0.0, v16 / v15);
        CGAffineTransform v18 = v19;
        objc_copyStruct(&self->_strokeTransformAdjustment.b, &v18, 48, 1, 0);
      }
    }
  }
  -[PKTiledView setLiveAttachment:]((uint64_t)self, 0);
}

- (BOOL)canvasView:(id)a3 shouldDiscardEndedStroke:(id)a4 drawing:(id)a5
{
  id v7 = a4;
  id v8 = [a5 uuid];
  uint64_t v9 = [(PKTiledView *)self _attachmentForUUID:v8];

  uint64_t v10 = objc_opt_class();
  id v11 = PKDynamicCast(v10, v9);
  long long v12 = v11;
  if (v11) {
    char v13 = [v11 shouldDiscardEndedStroke:v7];
  }
  else {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)canvasView:(id)a3 shouldDiscardTapStrokeAt:(CGPoint)a4 drawing:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v8 = objc_msgSend(a5, "uuid", a3);
  uint64_t v9 = [(PKTiledView *)self _attachmentForUUID:v8];

  uint64_t v10 = objc_opt_class();
  id v11 = PKDynamicCast(v10, v9);
  if (v11)
  {
    long long v12 = [v9 drawing];
    [(PKTiledView *)self transformFromViewToStrokeSpaceInDrawing:v12];

    char v13 = objc_msgSend(v11, "_handleSingleTapAtDrawingLocation:fromTapStroke:", 1, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)canvasView:(id)a3 shouldDelayDrawingBeganWithTouch:(id)a4
{
  return LOBYTE(self->_previouslySelectedDrawingUUID) == 0;
}

- (BOOL)canvasView:(id)a3 drawingIsShared:(id)a4
{
  objc_super v5 = objc_msgSend(a4, "uuid", a3);
  id v6 = [(PKTiledView *)self _attachmentForUUID:v5];

  uint64_t v7 = objc_opt_class();
  id v8 = PKDynamicCast(v7, v6);
  char v9 = [v8 isSharedViaICloud];

  return v9;
}

- (BOOL)canvasViewShouldCombineStrokes:(id)a3
{
  if ([(PKTiledView *)self _activeSixChannelBlendingMode] == 2) {
    return 0;
  }
  if (!self->_isDoingInteractiveResize) {
    return 0;
  }
  if ([(PKTiledView *)self _hasSelection]) {
    return 0;
  }
  id v4 = [(PKTiledView *)self selectionController];
  BOOL v5 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((BOOL)v4, 0);

  if (v5) {
    return 0;
  }
  uint64_t v7 = [(PKTiledView *)self rulerController];
  char v8 = -[PKRulerController rulerSelected]((uint64_t)v7);

  return v8 ^ 1;
}

- (id)canvasViewContentCoordinateSpace:(id)a3
{
  id v3 = [(PKTiledView *)self contentCoordinateSpace];

  return v3;
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  id v14 = a3;
  id v6 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if ([(PKTiledView *)self toolShadowShouldBeActive])
  {
    uint64_t v7 = [(PKTiledView *)self window];
    char v8 = [v7 windowScene];
    char v9 = +[PKPencilShadowView shadowViewForScene:v8];
    [v9 strokeBegan];
  }
  uint64_t v10 = [(PKTiledView *)self delegate];
  [v10 canvasView:self beganStroke:v6];

  id v11 = [v14 activeDrawing];
  long long v12 = [v11 uuid];
  char v13 = [(PKTiledView *)self attachmentForUUID:v12];
  [v13 beganStroke:v6];
}

- (void)replayCanvasViewDrawingMoved:(id)a3 inputPoint:(id *)a4 inputType:(int64_t)a5
{
  char v8 = objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle", a3);
  char v9 = [v8 bundleIdentifier];
  int v10 = [v9 isEqualToString:@"com.apple.freeform"];

  if (v10)
  {
    uint64_t v11 = [(PKTiledView *)self contentCoordinateSpace];
    if (v11)
    {
      long long v12 = (void *)v11;
      BOOL v13 = [(PKTiledView *)self toolShadowShouldBeActive];

      char v14 = !v13;
      if (a5 != 1) {
        char v14 = 1;
      }
      if ((v14 & 1) == 0)
      {
        double v15 = [(PKTiledView *)self contentCoordinateSpace];
        objc_msgSend(v15, "convertPoint:toCoordinateSpace:", self, a4->var0.var0.x, a4->var0.var0.y);
        CGFloat v17 = v16;
        CGFloat v19 = v18;

        a4->var0.var0.double x = v17;
        a4->var0.var0.double y = v19;
        long long v20 = *(_OWORD *)&a4->var9;
        v24[4] = *(_OWORD *)&a4->var7;
        v24[5] = v20;
        long long v21 = *(_OWORD *)&a4->var13;
        v24[6] = *(_OWORD *)&a4->var11;
        v24[7] = v21;
        long long v22 = *(_OWORD *)&a4->var5;
        v24[2] = *(_OWORD *)&a4->var3;
        v24[3] = v22;
        long long v23 = *(_OWORD *)&a4->var1;
        v24[0] = a4->var0;
        v24[1] = v23;
        [(PKTiledView *)self _updatePencilShadowView:v24];
      }
    }
  }
}

- (void)changeStrokesUsingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  id v10 = a5;
  [(PKTiledView *)self generateStrokeDataFromApplyingTransformations:a3 strokeGroups:a4 drawing:v10 originalStrokes:a6];
  id v11 = v22;
  id v12 = v23;
  id v13 = v24;
  char v14 = [v10 transformStrokes:v11 paths:v12 masks:v13];
  char v15 = [v10 shouldClearSelectionAfterStraightening];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __86__PKTiledView_changeStrokesUsingTransformations_strokeGroups_drawing_originalStrokes___block_invoke;
  block[3] = &unk_1E64C5EC0;
  char v21 = v15;
  void block[4] = self;
  id v19 = v14;
  id v20 = v10;
  id v16 = v10;
  id v17 = v14;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __86__PKTiledView_changeStrokesUsingTransformations_strokeGroups_drawing_originalStrokes___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v2 = [*(id *)(a1 + 32) selectionController];
    id v3 = (void *)v2;
    if (v2) {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v2, 1, 0);
    }
  }
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v4 canvasView];
  [v4 canvasView:v5 registerUndoCommands:*(void *)(a1 + 40)];

  id v6 = *(void **)(a1 + 32);
  uint64_t v7 = [v6 canvasView];
  [v6 canvasView:v7 drawingDidChange:*(void *)(a1 + 48)];

  char v8 = *(void **)(a1 + 32);
  v10[0] = *(void *)(a1 + 48);
  char v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 _selectionRefreshWithChangeToDrawings:v9 completion:&__block_literal_global_506];
}

- ($5C7D0D34CEC3E6999BF186EC2548EE70)generateStrokeDataFromApplyingTransformations:(SEL)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  long long v33 = retstr;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v36 = a4;
  id v38 = a5;
  id v44 = a6;
  id v34 = a7;
  int v35 = (void *)[v34 mutableCopy];
  +[PKDrawing sortStrokes:](PKDrawing, "sortStrokes:");
  id v43 = objc_opt_new();
  BOOL v42 = objc_opt_new();
  for (unint64_t i = 0; objc_msgSend(v38, "count", v33) > i; ++i)
  {
    uint64_t v37 = [v38 objectAtIndexedSubscript:i];
    id v10 = [v36 objectAtIndexedSubscript:i];
    long long v40 = [MEMORY[0x1E4F1CA48] array];
    id v11 = [MEMORY[0x1E4F1CA70] orderedSet];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    obuint64_t j = v37;
    uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v51;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v51 != v13) {
            objc_enumerationMutation(obj);
          }
          char v15 = *(void **)(*((void *)&v50 + 1) + 8 * j);
          id v16 = [v15 strokeUUID];
          id v17 = [v44 _visibleStrokeForIdentifier:v16];

          if (v17)
          {
            double v18 = [v15 strokeUUID];
            char v19 = [v11 containsObject:v18];

            if ((v19 & 1) == 0)
            {
              id v20 = [v15 strokeUUID];
              [v11 addObject:v20];

              [v40 addObject:v17];
            }
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v50 objects:v55 count:16];
      }
      while (v12);
    }

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v21 = v40;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v54 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v47;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v47 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v46 + 1) + 8 * k);
          long long v26 = [v25 path];
          if (v25) {
            [v25 transform];
          }
          else {
            memset(v45, 0, sizeof(v45));
          }
          uint64_t v27 = (void *)[v26 copyTransformed:v10 inCoordinateSpace:v45];
          uint64_t v28 = [v25 _strokeUUID];
          [v43 setObject:v27 forKeyedSubscript:v28];

          double v29 = [v25 _strokeMask];
          __int16 v30 = [v29 maskTransformedBy:v10];
          double v31 = [v25 _strokeUUID];
          [v42 setObject:v30 forKeyedSubscript:v31];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v46 objects:v54 count:16];
      }
      while (v22);
    }
  }
  v33->var0 = v34;
  v33->var1 = v43;
  v33->var2 = v42;

  return result;
}

- (void)straightenStrokes:(id)a3 drawing:(id)a4 completionBlockWithStrokeTransformInfo:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v32 = a5;
  __int16 v30 = v8;
  id v10 = [v9 uuid];
  id v11 = [(PKTiledView *)self _attachmentForUUID:v10];

  double v31 = v11;
  uint64_t v12 = [v11 recognitionController];
  uint64_t v13 = (void *)v12;
  if (v12) {
    char v14 = *(void **)(v12 + 48);
  }
  else {
    char v14 = 0;
  }
  id v15 = v14;

  long long v33 = v15;
  id v34 = -[PKRecognitionSessionManager session](v15);
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F5C0B0]) initWithRecognitionSession:v34];
  id v17 = +[PKStrokeProvider slicesForStrokes:v8];
  double v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v17, "count"));
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v19 = v17;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v44 != v21) {
          objc_enumerationMutation(v19);
        }
        uint64_t v23 = [*(id *)(*((void *)&v43 + 1) + 8 * i) strokeIdentifier];
        [v18 addObject:v23];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v43 objects:v47 count:16];
    }
    while (v20);
  }

  id v24 = (void *)[v9 copy];
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x2020000000;
  char v42 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke;
  aBlock[3] = &unk_1E64C59F0;
  id v25 = v32;
  id v39 = v25;
  id v26 = v24;
  id v36 = v26;
  id v27 = v30;
  long long v40 = v41;
  id v37 = v27;
  id v38 = self;
  uint64_t v28 = _Block_copy(aBlock);
  id v29 = (id)[v16 strokePointTransformationsForContextStrokes:v18 completionWithTelemetry:v28 shouldCancel:&__block_literal_global_514];

  _Block_object_dispose(v41, 8);
}

void __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  (*(void (**)(void))(a1[7] + 16))();
  *(unsigned char *)(*(void *)(a1[8] + 8) + 24) = 1;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_2;
  v7[3] = &unk_1E64C5870;
  v7[4] = a1[6];
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    [*(id *)(a1 + 32) _beginAnalyticsSessionIfNecessary];
    id v3 = *(id *)(v2 + 896);
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;
  -[PKAnalyticsSession incrementTextLineStraighteningCount](v3);

  +[PKStatisticsManager sharedStatisticsManager]();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordTextLineStraightening:withUndo:]((uint64_t)v5, *(void **)(a1 + 40), 0);
}

uint64_t __80__PKTiledView_straightenStrokes_drawing_completionBlockWithStrokeTransformInfo___block_invoke_3()
{
  return 0;
}

- (void)straighten:(id)a3 strokes:(id)a4 drawing:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__PKTiledView_straighten_strokes_drawing___block_invoke;
  v5[3] = &unk_1E64C5A18;
  v5[4] = self;
  [(PKTiledView *)self straightenStrokes:a4 drawing:a5 completionBlockWithStrokeTransformInfo:v5];
}

uint64_t __42__PKTiledView_straighten_strokes_drawing___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [*(id *)(a1 + 32) changeStrokesUsingTransformations:a2 strokeGroups:a3 drawing:a4 originalStrokes:a5];
}

- (void)_straightenStrokes:(id)a3 drawing:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __58__PKTiledView__straightenStrokes_drawing_completionBlock___block_invoke;
  v14[3] = &unk_1E64C5A40;
  v14[4] = self;
  id v15 = v9;
  id v16 = v8;
  id v17 = v10;
  id v11 = v10;
  id v12 = v8;
  id v13 = v9;
  [(PKTiledView *)self straightenStrokes:v12 drawing:v13 completionBlockWithStrokeTransformInfo:v14];
}

void __58__PKTiledView__straightenStrokes_drawing_completionBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = (id)[*(id *)(a1 + 32) _newStrokesFromApplyingTransformations:a2 strokeGroups:a3 drawing:*(void *)(a1 + 40) originalStrokes:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)_newStrokesFromApplyingTransformations:(id)a3 strokeGroups:(id)a4 drawing:(id)a5 originalStrokes:(id)a6
{
  id v10 = a5;
  [(PKTiledView *)self generateStrokeDataFromApplyingTransformations:a3 strokeGroups:a4 drawing:v10 originalStrokes:a6];
  id v11 = v17;
  id v12 = v19;
  id v13 = v18;
  id v14 = v11;
  id v15 = [v10 _originalStrokeUUIDToTransformedStrokeDictFromStrokes:v14 pathDict:v13 maskDict:v12];

  return v15;
}

- (id)_createPKStrokesFromCHDrawing:(id)a3 inputScale:(double)a4 sourceStroke:(id)a5 ink:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  long long v12 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v16 = *MEMORY[0x1E4F1DAB8];
  long long v17 = v12;
  long long v18 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  if (v10)
  {
    v19[0] = v10;
    id v13 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1, v16, v17, v18);
  }
  else
  {
    id v13 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v14 = +[PKStroke _createStrokesFromCHDrawing:v9 transform:&v16 inputScale:v13 sourceStrokes:objc_opt_class() strokeClass:v11 newInk:1 suggestedHeight:a4 shouldSetSynthesizedFlag:-1.0];
  if (v10) {

  }
  return v14;
}

- (id)_createPKStrokesFromCHDrawing:(id)a3 transform:(CGAffineTransform *)a4 inputScale:(double)a5 sourceStroke:(id)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a6;
  long long v11 = *(_OWORD *)&a4->c;
  v15[0] = *(_OWORD *)&a4->a;
  v15[1] = v11;
  long long v16 = *(_OWORD *)&a4->tx;
  v17[0] = v10;
  long long v12 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 1, v15[0], v11, v16);
  id v13 = +[PKStroke _createStrokesFromCHDrawing:v9 transform:v15 inputScale:v12 sourceStrokes:objc_opt_class() strokeClass:0 newInk:1 suggestedHeight:a5 shouldSetSynthesizedFlag:-1.0];

  return v13;
}

- (void)clearRefinableStrokes
{
}

- (BOOL)hasRefinableStrokes
{
  externalAttachments = self->_externalAttachments;
  return externalAttachments && [(objc_class *)externalAttachments[1].super.isa count] > 0;
}

- (BOOL)isRefinableStroke:(id)a3
{
  return -[PKAutoRefineController isRefinableStroke:]((uint64_t)self->_externalAttachments, a3);
}

- (void)enumerateRefinableStrokesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  externalAttachments = self->_externalAttachments;
  if (externalAttachments) {
    [(objc_class *)externalAttachments[1].super.isa enumerateObjectsWithOptions:a3 usingBlock:a4];
  }
}

- (void)autoRefineTask:(id)a3 synthesizeRefinedDrawingForStrokes:(id)a4 transcription:(id)a5 drawingUUID:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v28 = a6;
  id v29 = a7;
  id v13 = [(PKTiledView *)self _attachmentForUUID:v28];
  id v14 = [v13 drawing];
  id v15 = (void *)[v14 copy];

  uint64_t v16 = [v13 recognitionController];
  long long v17 = (void *)v16;
  if (v16) {
    long long v18 = *(void **)(v16 + 48);
  }
  else {
    long long v18 = 0;
  }
  id v19 = v18;

  uint64_t v20 = -[PKRecognitionSessionManager session](v19);
  [(PKTiledView *)self inputScale];
  uint64_t v22 = v21;
  uint64_t v23 = os_log_create("com.apple.pencilkit", "AutoRefine");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C44F8000, v23, OS_LOG_TYPE_DEBUG, "AutoRefine executeSynthesisWithSession session with last provider version.", buf, 2u);
  }

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke;
  v32[3] = &unk_1E64C5AE0;
  v32[4] = self;
  id v24 = v11;
  id v33 = v24;
  id v25 = v15;
  id v34 = v25;
  id v26 = v12;
  id v35 = v26;
  uint64_t v36 = v22;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2_523;
  v30[3] = &unk_1E64C5390;
  id v27 = v29;
  id v31 = v27;
  -[PKAutoRefineTask executeSynthesisWithSession:processingBlock:completionBlock:]((uint64_t)v24, v20, v32, v30);
}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, double a7, double a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2;
  v24[3] = &unk_1E64C5AB8;
  id v19 = *(void **)(a1 + 40);
  v24[4] = *(void *)(a1 + 32);
  id v25 = v19;
  id v26 = *(id *)(a1 + 48);
  id v27 = *(id *)(a1 + 56);
  id v28 = v17;
  id v30 = v15;
  id v31 = v18;
  id v29 = v16;
  uint64_t v32 = *(void *)(a1 + 64);
  uint64_t v33 = a5;
  double v34 = a7;
  double v35 = a8;
  id v20 = v15;
  id v21 = v18;
  id v22 = v16;
  id v23 = v17;
  dispatch_async(MEMORY[0x1E4F14428], v24);
}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  long long v50 = [*(id *)(a1 + 32) _currentStroke];
  id v3 = *(void **)(*(void *)v2 + 472);
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  id v6 = *(void **)(a1 + 56);
  uint64_t v7 = *(void **)(a1 + 64);
  id v8 = *(void **)(a1 + 72);
  id v70 = 0;
  id v71 = 0;
  int v9 = -[PKAutoRefineTask isInvalidatedGivenDrawing:autoRefineController:currentStroke:inStrokesToReplace:lineDrawing:strokeGroups:outStrokeGroupsToReplace:outStrokesToPreserve:](v4, v5, v3, v50, v6, v7, v8, &v71, &v70);
  id v10 = v71;
  id v51 = v70;
  if (v9) {
    -[PKAutoRefineTask cancel](*(void *)(a1 + 40));
  }
  uint64_t v66 = 0;
  uint64_t v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_3;
  v65[3] = &unk_1E64C5A68;
  v65[4] = &v66;
  CGRect v54 = v10;
  [v10 enumerateObjectsUsingBlock:v65];
  if ((v9 & 1) != 0 || !v67[3])
  {
    (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    -[PKAutoRefineTask logEventCompletionWithSuccess:](*(void *)(a1 + 40), 0);
  }
  else
  {
    id v11 = os_log_create("com.apple.pencilkit", "AutoRefine");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v47 = [*(id *)(a1 + 80) count];
      uint64_t v48 = [*(id *)(a1 + 64) strokeCount];
      uint64_t v49 = [*(id *)(a1 + 56) count];
      *(_DWORD *)buf = 134218496;
      unint64_t v73 = v47;
      __int16 v74 = 2048;
      uint64_t v75 = v48;
      __int16 v76 = 2048;
      uint64_t v77 = v49;
      _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "AutoRefine in view delegate callback inside the synthesis query call for %ld groups of strokes, %ld new strokes replacing %ld strokes", buf, 0x20u);
    }

    long long v53 = [MEMORY[0x1E4F1CA48] array];
    long long v52 = [MEMORY[0x1E4F1CA48] array];
    id v12 = 0;
    id v13 = 0;
    for (unint64_t i = 0; i < [*(id *)(a1 + 80) count]; ++i)
    {
      uint64_t v15 = *(void *)(*(void *)(a1 + 32) + 472);
      id v16 = [v54 objectAtIndexedSubscript:i];
      id v63 = v13;
      id v64 = v12;
      BOOL v17 = -[PKAutoRefineController stableSynthesisParametersFromSourceStrokes:outInk:outReferenceStroke:](v15, v16, &v64, &v63);
      id v18 = v64;

      id v19 = v63;
      if (v17)
      {
        id v20 = *(void **)(a1 + 32);
        id v21 = [*(id *)(a1 + 80) objectAtIndexedSubscript:i];
        id v22 = [v20 _createPKStrokesFromCHDrawing:v21 inputScale:v19 sourceStroke:v18 ink:*(double *)(a1 + 96)];

        [v53 addObjectsFromArray:v22];
        id v23 = [v54 objectAtIndexedSubscript:i];
        [v52 addObjectsFromArray:v23];

        id v24 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = [v22 count];
          id v28 = [v54 objectAtIndexedSubscript:i];
          uint64_t v29 = [v28 count];
          id v30 = [v18 description];
          *(_DWORD *)buf = 134218754;
          unint64_t v73 = i;
          __int16 v74 = 2048;
          uint64_t v75 = v27;
          __int16 v76 = 2048;
          uint64_t v77 = v29;
          __int16 v78 = 2112;
          long long v79 = v30;
          _os_log_debug_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEBUG, "AutoRefine synthesis query call for group %ld: %ld new strokes replacing %ld strokes, innuint64_t k = %@", buf, 0x2Au);
        }
      }
      else
      {
        id v24 = os_log_create("com.apple.pencilkit", "AutoRefine");
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        {
          id v25 = [v54 objectAtIndexedSubscript:i];
          uint64_t v26 = [v25 count];
          *(_DWORD *)buf = 134218240;
          unint64_t v73 = i;
          __int16 v74 = 2048;
          uint64_t v75 = v26;
          _os_log_debug_impl(&dword_1C44F8000, v24, OS_LOG_TYPE_DEBUG, "AutoRefine synthesis query call for group %ld: keeping %ld old strokes unchanged due to variable ink", buf, 0x16u);
        }
        id v22 = v24;
      }

      id v12 = v18;
      id v13 = v19;
    }
    if ([v53 count])
    {
      id v31 = [*(id *)(a1 + 48) undoableAddNewStrokes:v53 replacingOldStrokes:v52];
      if (v31)
      {
        -[PKSqueezePaletteViewContext setSelectedColor:](*(void *)(*(void *)(a1 + 32) + 472), v13);
        -[PKMathResultAttribution setDate:](*(void *)(*(void *)(a1 + 32) + 472), v12);
        -[PKAutoRefineController removeAsRefinableStrokes:](*(void *)(*(void *)(a1 + 32) + 472), v52);
        uint64_t v32 = *(void *)(a1 + 40);
        if (v32) {
          *(unsigned char *)(v32 + 106) = 1;
        }
        uint64_t v33 = *(void *)(a1 + 32);
        double v34 = *(void **)(v33 + 520);
        uint64_t v35 = *(void *)(a1 + 48);
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_518;
        v55[3] = &unk_1E64C5A90;
        v55[4] = v33;
        id v60 = *(id *)(a1 + 88);
        id v56 = *(id *)(a1 + 40);
        id v57 = v53;
        id v58 = v52;
        id v36 = v51;
        uint64_t v37 = *(void *)(a1 + 104);
        id v59 = v36;
        uint64_t v61 = v37;
        long long v62 = *(_OWORD *)(a1 + 112);
        [v34 refineFrom:v58 to:v57 in:v35 completionHandler:v55];
      }
      else
      {
        (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
        -[PKAutoRefineTask logEventCompletionWithSuccess:](*(void *)(a1 + 40), 0);
        id v38 = [PKAutoRefineLogEntry alloc];
        id v39 = -[PKAutoRefineTask locale](*(void **)(a1 + 40));
        uint64_t v40 = *(void *)(a1 + 40);
        double v41 = 0.0;
        if (v40 && *(unsigned char *)(v40 + 105)) {
          double v41 = *(double *)(v40 + 64) - *(double *)(v40 + 56);
        }
        uint64_t v42 = *(void *)(a1 + 104);
        long long v43 = -[PKAutoRefineTask debugInfo](v40);
        id v31 = [(PKAutoRefineLogEntry *)v38 initWithRefinedStrokes:v53 originalStrokes:v52 unchangedStrokes:v51 locale:v39 refinedWordCount:v42 duration:1 isAutoRefined:v41 debugInfo:v43];

        long long v44 = +[PKAutoRefineLogger sharedAutoRefineLogger]();
        -[PKAutoRefineLogger addLogEntry:](v44, v31);

        uint64_t v45 = *(void *)(a1 + 32);
        if (*(char *)(v45 + 440) < 0)
        {
          id WeakRetained = objc_loadWeakRetained((id *)(v45 + 576));
          [WeakRetained canvasView:*(void *)(a1 + 32) didRefineStrokes:v52 withNewStrokes:v53];
        }
      }
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
      -[PKAutoRefineTask logEventCompletionWithSuccess:](*(void *)(a1 + 40), 0);
    }
  }
  _Block_object_dispose(&v66, 8);
}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v3 count];
}

void __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_518(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    id v5 = [v4 canvasView];
    v24[0] = v3;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:1];
    [v4 canvasView:v5 registerUndoCommands:v6];
  }
  uint64_t v7 = [*(id *)(a1 + 32) selectionController];
  id v8 = (void *)v7;
  if (v7) {
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v7, 1, 0);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  -[PKAutoRefineTask logEventCompletionWithSuccess:](*(void *)(a1 + 40), 1);
  int v9 = [PKAutoRefineLogEntry alloc];
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v12 = *(void *)(a1 + 48);
  id v13 = -[PKAutoRefineTask locale](*(void **)(a1 + 40));
  uint64_t v14 = *(void *)(a1 + 40);
  double v15 = 0.0;
  if (v14 && *(unsigned char *)(v14 + 105)) {
    double v15 = *(double *)(v14 + 64) - *(double *)(v14 + 56);
  }
  uint64_t v16 = *(void *)(a1 + 80);
  BOOL v17 = -[PKAutoRefineTask debugInfo](v14);
  id v18 = [(PKAutoRefineLogEntry *)v9 initWithRefinedStrokes:v12 originalStrokes:v10 unchangedStrokes:v11 locale:v13 refinedWordCount:v16 duration:1 isAutoRefined:v15 debugInfo:v17];

  [(PKAutoRefineLogEntry *)v18 estimateMetricsWithTokenDeviation:*(double *)(a1 + 88) tokenHeight:*(double *)(a1 + 96)];
  id v19 = +[PKAutoRefineLogger sharedAutoRefineLogger]();
  -[PKAutoRefineLogger addLogEntry:](v19, v18);

  id v20 = *(void **)(a1 + 32);
  id v21 = [v20 canvasView];
  [v20 _canvasView:v21 didCompleteRefinementEntry:v18];

  uint64_t v22 = *(void *)(a1 + 32);
  if (*(char *)(v22 + 440) < 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v22 + 576));
    [WeakRetained canvasView:*(void *)(a1 + 32) didRefineStrokes:*(void *)(a1 + 56) withNewStrokes:*(void *)(a1 + 48)];
  }
}

uint64_t __107__PKTiledView_autoRefineTask_synthesizeRefinedDrawingForStrokes_transcription_drawingUUID_completionBlock___block_invoke_2_523(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)refine:(id)a3 strokes:(id)a4 drawing:(id)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v50 = a4;
  id v7 = a5;
  id v8 = [v7 uuid];
  int v9 = [(PKTiledView *)self _attachmentForUUID:v8];

  long long v46 = v9;
  uint64_t v10 = [v9 recognitionController];
  uint64_t v11 = (void *)v10;
  if (v10) {
    uint64_t v12 = *(void **)(v10 + 48);
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;

  uint64_t v49 = -[PKRecognitionSessionManager session](v13);
  uint64_t v47 = v13;
  uint64_t v48 = +[PKStrokeProvider slicesForStrokes:v50];
  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v48, "count"));
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v15 = v48;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v66 != v17) {
          objc_enumerationMutation(v15);
        }
        id v19 = [*(id *)(*((void *)&v65 + 1) + 8 * i) strokeIdentifier];
        [v14 addObject:v19];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(PKTiledView *)self selectionController];
  id v21 = (void *)v20;
  if (v20) {
    uint64_t v22 = *(void **)(v20 + 128);
  }
  else {
    uint64_t v22 = 0;
  }
  id v51 = v22;

  uint64_t v23 = [(PKTiledView *)self selectionController];
  id v24 = (void *)v23;
  if (v23) {
    uint64_t v45 = [*(id *)(v23 + 152) selectionType];
  }
  else {
    uint64_t v45 = 0;
  }

  if (v51)
  {
    id v25 = [v51 strokes];
    if ([v25 count])
    {
      uint64_t v26 = [v51 drawing];
      uint64_t v27 = [v26 uuid];
      id v28 = [v7 uuid];
      char v29 = [v27 isEqual:v28];

      if (v29) {
        goto LABEL_21;
      }
    }
    else
    {
    }
  }
  id v51 = 0;
LABEL_21:
  id v30 = (void *)[v7 copy];

  [(PKTiledView *)self inputScale];
  uint64_t v32 = v31;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  char v64 = 0;
  uint64_t v33 = [MEMORY[0x1E4F1CA48] array];
  double v34 = [MEMORY[0x1E4F1CA48] array];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  uint64_t v36 = v35;
  uint64_t v37 = (void *)[objc_alloc(MEMORY[0x1E4F5C0B8]) initWithRecognitionSession:v49];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke;
  v52[3] = &unk_1E64C5B80;
  long long v44 = v30;
  id v38 = v30;
  id v53 = v38;
  CGRect v54 = self;
  uint64_t v60 = v32;
  id v39 = v34;
  id v55 = v39;
  id v40 = v33;
  id v56 = v40;
  id v41 = v47;
  id v57 = v41;
  uint64_t v61 = v36;
  id v42 = v51;
  uint64_t v62 = v45;
  id v58 = v42;
  id v59 = v63;
  id v43 = (id)objc_msgSend(v37, "refinementOfContextStrokesWithTranscriptions:completion:shouldCancel:", v14, v52, &__block_literal_global_537, v44);

  _Block_object_dispose(v63, 8);
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v45 = a2;
  id v49 = a3;
  id v47 = a4;
  long long v44 = [MEMORY[0x1E4F1CA48] array];
  id v7 = [MEMORY[0x1E4F1CA48] array];
  unint64_t v50 = 0;
  uint64_t v86 = 0;
  uint64_t v87 = (double *)&v86;
  uint64_t v88 = 0x2020000000;
  uint64_t v89 = 0;
  uint64_t v82 = 0;
  long long v83 = (double *)&v82;
  uint64_t v84 = 0x2020000000;
  uint64_t v85 = 0;
  while (v50 < [v49 count])
  {
    uint64_t v48 = [v45 objectAtIndexedSubscript:v50];
    uint64_t v76 = 0;
    uint64_t v77 = &v76;
    uint64_t v78 = 0x3032000000;
    long long v79 = __Block_byref_object_copy__526;
    uint64_t v80 = __Block_byref_object_dispose__527;
    id v8 = *(void **)(a1 + 32);
    int v9 = [v49 objectAtIndexedSubscript:v50];
    uint64_t v10 = [v9 firstObject];
    uint64_t v11 = [v10 strokeUUID];
    id v81 = [v8 _visibleStrokeForIdentifier:v11];

    uint64_t v12 = [v49 objectAtIndexedSubscript:v50];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_528;
    v73[3] = &unk_1E64C5B08;
    id v74 = *(id *)(a1 + 32);
    uint64_t v75 = &v76;
    [v12 enumerateObjectsUsingBlock:v73];

    id v13 = [*(id *)(a1 + 40) _createPKStrokesFromCHDrawing:v48 inputScale:v77[5] sourceStroke:0 ink:*(double *)(a1 + 88)];
    if ([v13 count])
    {
      uint64_t v14 = *(void **)(a1 + 48);
      id v15 = [v47 objectAtIndexedSubscript:v50];
      [v14 addObject:v15];

      uint64_t v16 = *(void **)(a1 + 56);
      uint64_t v17 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v13];
      [v16 addObject:v17];

      [v44 addObjectsFromArray:v13];
      long long v46 = [v47 objectAtIndexedSubscript:v50];
      id v18 = [v46 refinableTranscriptionPath];
      uint64_t v19 = [v46 tokenColumnCount];
      v72[0] = MEMORY[0x1E4F143A8];
      v72[1] = 3221225472;
      v72[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_2;
      v72[3] = &unk_1E64C5B30;
      v72[4] = &v86;
      v72[5] = &v82;
      objc_msgSend(v46, "enumerateTokensInTranscriptionPath:columnRange:tokenProcessingBlock:", v18, 0, v19, v72);

      uint64_t v20 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v13, "count"));
      long long v70 = 0u;
      long long v71 = 0u;
      long long v68 = 0u;
      long long v69 = 0u;
      id v21 = [v49 objectAtIndexedSubscript:v50];
      uint64_t v22 = [v21 countByEnumeratingWithState:&v68 objects:v90 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v69;
        do
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v69 != v23) {
              objc_enumerationMutation(v21);
            }
            id v25 = *(void **)(a1 + 32);
            uint64_t v26 = [*(id *)(*((void *)&v68 + 1) + 8 * i) strokeUUID];
            uint64_t v27 = [v25 _visibleStrokeForIdentifier:v26];

            if (v27)
            {
              [v20 addObject:v27];
              [v7 addObject:v27];
            }
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v68 objects:v90 count:16];
        }
        while (v22);
      }

      +[PKStroke _applyPropertiesToNewStrokes:v13 fromOldStrokes:v20];
    }

    _Block_object_dispose(&v76, 8);
    ++v50;
  }
  for (unint64_t j = 0; j < [*(id *)(a1 + 56) count]; ++j)
  {
    uint64_t v29 = *(void *)(a1 + 64);
    id v30 = [*(id *)(a1 + 48) objectAtIndexedSubscript:j];
    uint64_t v31 = [*(id *)(a1 + 56) objectAtIndexedSubscript:j];
    -[PKRecognitionSessionManager cacheTranscription:strokeGroup:](v29, v30, v31);
  }
  if ([v44 count])
  {
    uint64_t v32 = [*(id *)(a1 + 32) undoableDeleteStrokes:v7];
    uint64_t v33 = [*(id *)(a1 + 32) undoableAddNewStrokes:v44];
  }
  else
  {
    uint64_t v32 = 0;
    uint64_t v33 = 0;
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v35 = v83[3];
  double v36 = 0.0;
  if (v35 > 0.0) {
    double v36 = v87[3] / v35;
  }
  v87[3] = v36;
  if (v32 && v33)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_3;
    block[3] = &unk_1E64C5B58;
    id v55 = v44;
    id v56 = v7;
    uint64_t v37 = *(void *)(a1 + 96);
    uint64_t v64 = v34;
    uint64_t v65 = v37;
    uint64_t v66 = 0;
    uint64_t v62 = &v82;
    id v63 = &v86;
    uint64_t v57 = *(void *)(a1 + 40);
    id v58 = v33;
    id v59 = v32;
    id v38 = *(id *)(a1 + 72);
    uint64_t v39 = *(void *)(a1 + 104);
    id v60 = v38;
    uint64_t v67 = v39;
    id v61 = *(id *)(a1 + 32);
    id v40 = v44;
    id v41 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __38__PKTiledView_refine_strokes_drawing___block_invoke_5;
    v51[3] = &unk_1E64C53E0;
    v51[4] = *(void *)(a1 + 40);
    id v52 = v7;
    id v53 = v44;
    id v42 = v44;
    id v43 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v51);
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;

  _Block_object_dispose(&v82, 8);
  _Block_object_dispose(&v86, 8);
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_528(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = *(void **)(a1 + 32);
  id v10 = v6;
  id v8 = [v6 strokeUUID];
  int v9 = [v7 _visibleStrokeForIdentifier:v8];

  if (v9 && ([v9 _isSynthesizedInk] & 1) == 0)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v9);
    *a4 = 1;
  }
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F5C080]) initWithTokenizedTextResultToken:v3];
  if ([v4 hasValidPrincipalLines])
  {
    if (v4)
    {
      [v4 principalLines];
      [v4 principalLines];
      [v4 principalLines];
      [v4 principalLines];
      double v5 = *((double *)&v34 + 1) + *((double *)&v27 + 1) - *((double *)&v20 + 1);
      double v6 = *((double *)&v13 + 1);
    }
    else
    {
      uint64_t v38 = 0;
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      long long v12 = 0u;
      long long v13 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      double v6 = 0.0;
      long long v8 = 0u;
      long long v9 = 0u;
      double v5 = 0.0;
    }
    objc_msgSend(v4, "bounds", v8, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      v30,
      v31,
      v32,
      v33,
      v34,
      v35,
      v36,
      v37,
      v38);
    *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                            + 24)
                                                                + (v5 - v6) * 0.5 * v7;
  }
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(double *)(*(void *)(*(void *)(a1 + 40) + 8)
                                                                          + 24)
                                                              + 1.0;
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_3(uint64_t a1)
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [PKAutoRefineLogEntry alloc];
  id v3 = [(PKAutoRefineLogEntry *)v2 initWithRefinedStrokes:*(void *)(a1 + 32) originalStrokes:*(void *)(a1 + 40) unchangedStrokes:MEMORY[0x1E4F1CBF0] locale:0 refinedWordCount:(uint64_t)*(double *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) duration:0 isAutoRefined:*(double *)(a1 + 104) - *(double *)(a1 + 112) debugInfo:MEMORY[0x1E4F1CC08]];
  [(PKAutoRefineLogEntry *)v3 estimateMetricsWithTokenDeviation:*(double *)(a1 + 120) tokenHeight:*(double *)(*(void *)(*(void *)(a1 + 96) + 8) + 24)];
  uint64_t v4 = *(void **)(a1 + 48);
  double v5 = [v4 canvasView];
  [v4 _canvasView:v5 didCompleteRefinementEntry:v3];

  double v6 = *(void **)(a1 + 48);
  double v7 = [v6 canvasView];
  uint64_t v8 = *(void *)(a1 + 64);
  v19[0] = *(void *)(a1 + 56);
  v19[1] = v8;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [v6 canvasView:v7 registerUndoCommands:v9];

  long long v10 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 72))
  {
    long long v11 = [v10 selectionController];
    long long v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:*(void *)(a1 + 32)];
    -[PKSelectionController selectStrokes:forSelectionType:inDrawing:](v11, v12, *(void *)(a1 + 128), *(void **)(a1 + 80));
  }
  else
  {
    uint64_t v13 = [v10 selectionController];
    long long v11 = (id *)v13;
    if (v13) {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v13, 1, 0);
    }
  }

  [*(id *)(a1 + 48) didChangeDrawing:*(void *)(a1 + 80)];
  long long v14 = *(void **)(a1 + 48);
  uint64_t v18 = *(void *)(a1 + 80);
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
  [v14 _selectionRefreshWithChangeToDrawings:v15 completion:&__block_literal_global_534];

  uint64_t v16 = *(void *)(a1 + 48);
  if (*(char *)(v16 + 440) < 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v16 + 576));
    [WeakRetained canvasView:*(void *)(a1 + 48) didRefineStrokes:*(void *)(a1 + 40) withNewStrokes:*(void *)(a1 + 32)];
  }
}

void __38__PKTiledView_refine_strokes_drawing___block_invoke_5(void *a1)
{
  uint64_t v1 = a1[4];
  if (*(char *)(v1 + 440) < 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v1 + 576));
    [WeakRetained canvasView:a1[4] didRefineStrokes:a1[5] withNewStrokes:a1[6]];
  }
}

uint64_t __38__PKTiledView_refine_strokes_drawing___block_invoke_6()
{
  return 0;
}

- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  id v16 = a3;
  id v8 = a4;
  id v9 = a5;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if ((*(unsigned char *)&self->_tiledViewFlags & 2) != 0)
  {
    long long v10 = [(PKTiledView *)self delegate];
    [v10 canvasView:self endedStroke:v8 shapeStrokes:v9];
  }
  else
  {
    if ((*(unsigned char *)&self->_tiledViewFlags & 1) == 0) {
      goto LABEL_6;
    }
    long long v10 = [(PKTiledView *)self delegate];
    [v10 canvasView:self endedStroke:v8];
  }

LABEL_6:
  long long v11 = [v16 activeDrawing];
  long long v12 = [v11 uuid];
  uint64_t v13 = [(PKTiledView *)self attachmentForUUID:v12];

  if (v8)
  {
    -[PKAutoRefineController indexRefinableStroke:]((uint64_t)self->_externalAttachments, v8);
    long long v14 = [v13 recognitionManager];
    -[PKRecognitionSessionManager updateWithRefinableStroke:]((uint64_t)v14, v8);
  }
  [(PKTiledView *)self _beginAnalyticsSessionIfNecessary];
  long long v15 = self->_aggd_cachedVisibleStrokeCount;
  -[PKAnalyticsSession incrementStrokeCount](v15);

  [v13 endedStroke:v8];
}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if (v6)
  {
    double v7 = [(PKTiledView *)self delegate];
    [v7 canvasView:self cancelledStroke:v6];

    id v8 = [v15 activeDrawing];
    id v9 = [v8 uuid];
    long long v10 = [(PKTiledView *)self attachmentForUUID:v9];
    [v10 cancelledStroke:v6];
  }
  long long v11 = [(PKTiledView *)self canvasView];
  [v11 _finishCombiningStrokesIfNecessary];

  long long v12 = [(PKTiledView *)self canvasView];
  char v13 = [v12 wantsCanvasVisible];

  if ((v13 & 1) == 0)
  {
    rulerHostingDelegate = self->_rulerHostingDelegate;
    self->_rulerHostingDelegate = 0;

    [(PKTiledView *)self _hideCanvas];
    [(PKTiledView *)self updateTilesForVisibleRect];
  }
}

- (void)_canvasViewDidEraseStrokes:(id)a3
{
  id v16 = a3;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  uint64_t v4 = [(PKTiledView *)self canvasView];
  double v5 = [v4 drawing];

  if (v5)
  {
    id v6 = [(PKTiledView *)self canvasView];
    double v7 = [v6 drawing];
    id v8 = [v7 uuid];
    id v9 = [(PKTiledView *)self _attachmentForUUID:v8];

    uint64_t v10 = objc_opt_class();
    long long v11 = PKDynamicCast(v10, v9);
    long long v12 = v11;
    if (v11) {
      [v11 drawingDidEraseStrokes:v16];
    }
  }
  char v13 = [(PKTiledView *)self delegate];
  char v14 = objc_opt_respondsToSelector();

  if (v14)
  {
    id v15 = [(PKTiledView *)self delegate];
    [v15 canvasViewDidEraseStrokes:v16];
  }
}

- (void)_canvasView:(id)a3 eraserMoved:(CGPoint)a4 attachment:(id)a5
{
}

- (void)_cancelHideCanvasIfNecessary
{
  undoManagersRegisteredWith = self->_undoManagersRegisteredWith;
  if (undoManagersRegisteredWith)
  {
    dispatch_block_cancel(undoManagersRegisteredWith);
    uint64_t v4 = self->_undoManagersRegisteredWith;
    self->_undoManagersRegisteredWith = 0;
  }
}

- (void)_canvasView:(id)a3 didFinishRenderingNewStrokes:(id)a4 inDrawing:(id)a5 forPreview:(BOOL)a6
{
  id v18 = a3;
  id v9 = a4;
  id v10 = a5;
  kdebug_trace();
  long long v11 = [v10 uuid];
  long long v12 = [(PKTiledView *)self _attachmentForUUID:v11];

  if (v12)
  {
    uint64_t v13 = objc_opt_class();
    char v14 = PKDynamicCast(v13, v12);
    id v15 = v14;
    if (v14 && [v14 updateHeightAfterDrawing] && (objc_msgSend(v10, "_isEmpty") & 1) == 0)
    {
      [(PKTiledView *)self _updateHeightOfAttachmentIfNecessary:v15];
      [(PKTiledView *)self updateTilesForVisibleRectRendering:0 offscreen:0 overrideAdditionalStrokes:0];
    }
    [(PKTiledView *)self cancelTileGenerationInvalidateTiles:0];
    int v16 = [v18 wantsCanvasVisible];
    if ((v16 & 1) == 0) {
      [v9 count];
    }
    long long v17 = [(PKTiledView *)self canvasView];
    [(PKTiledView *)self _copyFromCanvas:v17 intoAttachment:v12 hideCanvas:v16 ^ 1u strokes:v9];
  }
  else if (([v18 wantsCanvasVisible] & 1) == 0)
  {
    [(PKTiledView *)self _hideCanvas];
  }
}

- (void)updateCurrentSelectionWithNewDrawingIfNecessary:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PKTiledView *)self selectionController];
  -[PKSelectionController updateCurrentSelectionWithNewDrawingIfNecessary:]((uint64_t)v4, v5);
}

- (void)_handleDrawingDidChangeForAttachment:(id)a3
{
}

- (void)_handleDrawingDidChangeForAttachment:(id)a3 didChangeVisibleStrokes:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [v6 drawing];

  if (v7)
  {
    objc_initWeak(&location, self);
    id v8 = [v6 drawing];
    [(PKTiledView *)self visibleOnscreenBoundsForDrawing:v8];
    id v10 = v9;
    long long v12 = v11;
    char v14 = v13;
    int v16 = v15;

    uint64_t v17 = objc_opt_class();
    id v18 = PKDynamicCast(v17, v6);
    long long v19 = v18;
    if (v18) {
      [v18 drawingDidChangeVisibleStrokes:v4];
    }
    dispatch_time_t v20 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __76__PKTiledView__handleDrawingDidChangeForAttachment_didChangeVisibleStrokes___block_invoke;
    block[3] = &unk_1E64C5BA8;
    objc_copyWeak(v23, &location);
    id v22 = v6;
    v23[1] = v10;
    v23[2] = v12;
    v23[3] = v14;
    v23[4] = v16;
    dispatch_after(v20, MEMORY[0x1E4F14428], block);

    objc_destroyWeak(v23);
    objc_destroyWeak(&location);
  }
}

void __76__PKTiledView__handleDrawingDidChangeForAttachment_didChangeVisibleStrokes___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) drawing];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) drawing];
      [WeakRetained visibleOnscreenBoundsForDrawing:v3];
      double v5 = v4;
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;

      v14.origin.double x = v5;
      v14.origin.double y = v7;
      v14.size.width = v9;
      v14.size.height = v11;
      if (!CGRectEqualToRect(v14, *(CGRect *)(a1 + 48))) {
        objc_msgSend(*(id *)(a1 + 32), "visibleOnscreenBoundsDidChange:", v5, v7, v9, v11);
      }
    }
  }
}

- (void)canvasView:(id)a3 drawingDidChange:(id)a4
{
  id v5 = a4;
  double v6 = [v5 uuid];
  double v7 = [(PKTiledView *)self _attachmentForUUID:v6];

  if (v7)
  {
    double v8 = [v7 drawing];
    [v8 mergeWithDrawing:v5];

    [(PKTiledView *)self _handleDrawingDidChangeForAttachment:v7];
  }
  else
  {
    double v9 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_error_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_ERROR, "Drawing did change that is not in text.", v10, 2u);
    }
  }
  [(PKTiledView *)self updateCurrentSelectionWithNewDrawingIfNecessary:v5];
}

- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5 = a4;
  [(PKTiledView *)self _beginAnalyticsSessionIfNecessary];
  double v6 = [(PKTiledView *)self delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    double v8 = [(PKTiledView *)self delegate];
    int v9 = [v8 canvasView:self shouldBeginDrawingWithTouch:v5];
  }
  else
  {
    int v9 = 1;
  }
  if ([v5 type])
  {
    if ((v9 & 1) == 0) {
      goto LABEL_27;
    }
  }
  else
  {
    uint64_t v17 = [(PKTiledView *)self hoverController];
    if (v17 && self && v17[56])
    {
      if (BYTE1(self->_refineAnimationController))
      {

        goto LABEL_27;
      }
      int v28 = BYTE2(self->_refineAnimationController);

      if (v28) {
        int v29 = 0;
      }
      else {
        int v29 = v9;
      }
      if (v29 != 1) {
        goto LABEL_27;
      }
    }
    else
    {

      if ((v9 & 1) == 0) {
        goto LABEL_27;
      }
    }
  }
  double v10 = [(PKTiledView *)self drawingGestureRecognizer];
  double v11 = [v10 drawingTouch];

  if (v11)
  {
    long long v12 = [(PKTiledView *)self drawingGestureRecognizer];
    uint64_t v13 = [v12 drawingTouch];
    uint64_t v14 = [v13 type];

    uint64_t v15 = [v5 type];
    if (v14 == 2 && v15 != 2)
    {
      int v16 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v31 = 0;
        _os_log_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_INFO, "Avoided started drawing since we were already drawing with a pencil.", v31, 2u);
      }

      goto LABEL_27;
    }
  }
  id v18 = [(PKTiledView *)self selectionController];
  if (v18)
  {
    uint64_t v19 = v18[16];

    if (v19)
    {
      [v5 locationInView:self];
      double v21 = v20;
      double v23 = v22;
      long long v24 = [(PKTiledView *)self selectionController];
      long long v25 = -[PKSelectionController selectionInteraction](v24);
      char v26 = objc_msgSend(v25, "_selectionShouldReceiveTouchForPoint:", v21, v23);

      if (v26)
      {
LABEL_27:
        BOOL v27 = 0;
        goto LABEL_28;
      }
    }
  }
  [(PKTiledView *)self _cancelHideCanvasIfNecessary];
  BOOL v27 = 1;
LABEL_28:

  return v27;
}

- (void)canvasViewDrawingMoved:(id)a3 withTouch:(id)a4
{
  id v5 = a4;
  *(CFTimeInterval *)&self->_drawingEnabled = CACurrentMediaTime();
  if (-[PKTiledView toolShadowShouldBeActive](self, "toolShadowShouldBeActive") && [v5 type] == 2) {
    [(PKTiledView *)self _keepPencilShadowVisible];
  }
  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long __s1 = 0u;
  double v6 = [(PKTiledView *)self canvasView];
  char v7 = [v6 _drawingController];
  double v8 = -[PKController inputController](v7);
  int v9 = v8;
  if (v8)
  {
    [v8 _latestStrokePoint];
  }
  else
  {
    uint64_t v16 = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long __s1 = 0u;
  }

  if (memcmp(&__s1, &_PKStrokePointZero, 0x58uLL))
  {
    memset(v10, 0, sizeof(v10));
    [(PKTiledView *)self _updateToolPreviewIndicatorInputPoint:v10];
  }
}

- (void)canvasViewInvalidateTiles:(id)a3
{
  [(PKTiledView *)self cancelTileGenerationInvalidateTiles:1];

  [(PKTiledView *)self updateTilesForVisibleRect];
}

- (CGAffineTransform)canvasView:(SEL)a3 transformForStroke:(id)a4
{
  if (self && (BYTE2(self[10].d) & 1) != 0)
  {
    objc_copyStruct(retstr, &self[21], 48, 1, 0);
  }
  else
  {
    uint64_t v5 = MEMORY[0x1E4F1DAB8];
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v6;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v5 + 32);
  }
  return self;
}

- (void)_handleSingleTapAtLocation:(CGPoint)a3 forAttachment:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = objc_opt_class();
  int v9 = PKDynamicCast(v8, v7);
  if (v9)
  {
    double v10 = [v7 drawing];

    if (!v10
      || ([v7 drawing],
          double v11 = objc_claimAutoreleasedReturnValue(),
          [(PKTiledView *)self transformFromViewToStrokeSpaceInDrawing:v11],
          v11,
          (objc_msgSend(v9, "_handleSingleTapAtDrawingLocation:", y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0) & 1) == 0))
    {
      -[PKTiledView _showEditMenuFromLocation:forAttachment:](self, "_showEditMenuFromLocation:forAttachment:", v9, x, y);
    }
  }
}

- (void)_showEditMenuFromLocation:(CGPoint)a3 forAttachment:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v12 = a4;
  [(PKTiledView *)self becomeFirstResponder];
  [v12 setAttachmentChromeVisible:1 animated:1 highlightBackground:0];
  id v7 = objc_msgSend(MEMORY[0x1E4FB1750], "configurationWithIdentifier:sourcePoint:", @"PKEditMenuConfigurationIdentifier", x, y);
  uint64_t v8 = [(PKTiledView *)self selectionController];
  int v9 = (void *)v8;
  if (v8) {
    id WeakRetained = objc_loadWeakRetained((id *)(v8 + 120));
  }
  else {
    id WeakRetained = 0;
  }
  double v11 = [WeakRetained editMenuInteraction];
  [v11 presentEditMenuWithConfiguration:v7];
}

- (void)didChangeDrawing:(id)a3
{
  id v3 = [(PKTiledView *)self didChangeDrawing:a3 undoable:0];
}

- (id)didChangeDrawing:(id)a3 undoable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [v6 uuid];
  uint64_t v8 = [(PKTiledView *)self _attachmentForUUID:v7];

  if [v8 isExternalAttachment] && (objc_opt_respondsToSelector()) {
    [v8 externalAttachmentDidChangeDrawing:v6];
  }
  [v8 drawing];
  if (v4) {
    int v9 = {;
  }
    double v10 = [v9 undoableMergeWithDrawing:v6];
  }
  else {
    int v9 = {;
  }
    [v9 mergeWithDrawing:v6];
    double v10 = 0;
  }

  [(PKTiledView *)self _handleDrawingDidChangeForAttachment:v8];

  return v10;
}

- (void)registerUndoCommand:(id)a3
{
  id v15 = a3;
  BOOL v4 = [(PKTiledView *)self undoManager];

  if (v4)
  {
    uint64_t v5 = [(PKTiledView *)self undoManager];
    id v6 = [(PKTiledView *)self drawingUndoTarget];
    objc_msgSend(v15, "registerWithUndoManager:target:selector:", v5, v6, -[PKTiledView drawingUndoSelector](self, "drawingUndoSelector"));

    id v7 = [(PKTiledView *)self drawingUndoTarget];

    if (v7 == self)
    {
      hoverConvertToShapeBlocuint64_t k = self->_hoverConvertToShapeBlock;
      if (!hoverConvertToShapeBlock)
      {
        int v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
        id v10 = self->_hoverConvertToShapeBlock;
        self->_hoverConvertToShapeBlocuint64_t k = v9;

        hoverConvertToShapeBlocuint64_t k = self->_hoverConvertToShapeBlock;
      }
      double v11 = [(PKTiledView *)self undoManager];
      uint64_t v12 = [hoverConvertToShapeBlock indexOfObjectIdenticalTo:v11];

      if (v12 == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = self->_hoverConvertToShapeBlock;
        long long v14 = [(PKTiledView *)self undoManager];
        [v13 addObject:v14];
      }
    }
  }
}

- (void)registerUndoCommands:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKTiledView *)self undoManager];

  if (v5)
  {
    if ((unint64_t)[v4 count] < 2
      || ([(PKTiledView *)self undoManager],
          id v6 = objc_claimAutoreleasedReturnValue(),
          char v7 = [v6 groupsByEvent],
          v6,
          (v7 & 1) != 0))
    {
      int v8 = 0;
    }
    else
    {
      int v9 = [(PKTiledView *)self undoManager];
      [v9 beginUndoGrouping];

      int v8 = 1;
    }
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v16;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v10);
          }
          -[PKTiledView registerUndoCommand:](self, "registerUndoCommand:", *(void *)(*((void *)&v15 + 1) + 8 * v13++), (void)v15);
        }
        while (v11 != v13);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }

    if (v8)
    {
      long long v14 = [(PKTiledView *)self undoManager];
      [v14 endUndoGrouping];
    }
  }
}

- (void)registerUndoCommands:(id)a3 andChangeToDrawing:(id)a4
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PKTiledView *)self registerUndoCommands:v6];
  [(PKTiledView *)self didChangeDrawing:v7];
  uint64_t v8 = [(PKTiledView *)self selectionController];
  int v9 = (void *)v8;
  if (v8) {
    -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v8, 1, 0);
  }

  [(PKTiledView *)self didChangeDrawing:v7];
  v11[0] = v7;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  [(PKTiledView *)self _selectionRefreshWithChangeToDrawings:v10 completion:&__block_literal_global_545];
}

- (void)canvasView:(id)a3 registerMultiStepUndoCommands:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PKTiledView *)self undoManager];
  if (v8)
  {
    uint64_t v9 = [v7 count];

    if (v9)
    {
      id v10 = [v7 firstObject];
      [(PKTiledView *)self canvasView:v6 registerUndoCommands:v10];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56__PKTiledView_canvasView_registerMultiStepUndoCommands___block_invoke;
      block[3] = &unk_1E64C53E0;
      void block[4] = self;
      id v12 = v6;
      id v13 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

void __56__PKTiledView_canvasView_registerMultiStepUndoCommands___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "subarrayWithRange:", 1, objc_msgSend(*(id *)(a1 + 48), "count") - 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "canvasView:registerMultiStepUndoCommands:", v2);
}

- (void)canvasView:(id)a3 registerUndoCommands:(id)a4
{
  id v6 = a4;
  uint64_t v5 = [(PKTiledView *)self undoManager];

  if (v5) {
    [(PKTiledView *)self registerUndoCommands:v6];
  }
}

- (void)performUndo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordUndoIfNecessary]((uint64_t)v5);

  -[PKAutoRefineController clearRefinableStrokes]((uint64_t)self->_externalAttachments);
  [(PKTiledView *)self _dismissInsertSpaceHandlesIfNecessary];
  id v6 = [(PKTiledView *)self canvasView];
  int v7 = [v6 _isCombiningStrokes];

  if (v7)
  {
    uint64_t v8 = [(PKTiledView *)self canvasView];
    [v8 _finishCombiningStrokesIfNecessary];
  }
  [(PKTiledView *)self _endHoverToolPreview];
  -[PKHoverController reset](*(void *)&self->_lastContentOffset.x);
  uint64_t v9 = [v4 drawingUUID];
  id v10 = [(PKTiledView *)self _attachmentForUUID:v9];

  if (!v10)
  {
    [(PKTiledView *)self updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:0 withCallback:0];
    goto LABEL_20;
  }
  uint64_t v11 = [(PKTiledView *)self undoManager];
  id v12 = [v4 actionName];
  [v11 setActionName:v12];

  id v13 = [v10 drawing];
  uint64_t v14 = [v4 applyToDrawingReturnInverted:v13];

  long long v35 = (void *)v14;
  if (v14) {
    [(PKTiledView *)self registerUndoCommand:v14];
  }
  long long v15 = +[PKStatisticsManager sharedStatisticsManager]();
  long long v16 = [v4 actionName];
  long long v17 = [v4 strokes];
  long long v18 = [(PKTiledView *)self canvasView];
  uint64_t v19 = [v18 ink];
  uint64_t v20 = [v19 identifier];
  -[PKStatisticsManager recordUndo:forStrokes:fallbackInkIdentifier:]((uint64_t)v15, v16, v17, v20);

  [(PKTiledView *)self _beginAnalyticsSessionIfNecessary];
  double v21 = self->_aggd_cachedVisibleStrokeCount;
  -[PKAnalyticsSession incrementUndoCount](v21);

  if (v7)
  {
    double v22 = [(PKTiledView *)self canvasView];
    if ([v22 isHidden])
    {
    }
    else
    {
      double v23 = [(PKTiledView *)self canvasView];
      int v24 = [v23 wantsCanvasVisible];

      if (v24)
      {
        long long v25 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_INFO, "Skipping tile update since canvas is visible", (uint8_t *)buf, 2u);
        }

        goto LABEL_16;
      }
    }
    [(PKTiledView *)self updateTilesForVisibleRect];
  }
  else
  {
    [(PKTiledView *)self updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:0 withCallback:0];
  }
LABEL_16:
  -[PKTiledView _handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:](self, "_handleDrawingDidChangeForAttachment:didChangeVisibleStrokes:", v10, [v4 changesVisibleStrokes]);
  char v26 = dispatch_get_global_queue(0, 0);
  BOOL v27 = [v10 drawing];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __27__PKTiledView_performUndo___block_invoke;
  v42[3] = &unk_1E64C57A8;
  id v28 = v10;
  id v43 = v28;
  [v27 clipStrokesIfNeededOnQueue:v26 completion:v42];

  if ([v28 isAtEndOfDocument])
  {
    int v29 = [v28 drawing];
    char v30 = [v29 _isEmpty];

    if ((v30 & 1) == 0)
    {
      uint64_t v31 = objc_opt_class();
      long long v32 = PKDynamicCast(v31, v28);
      long long v33 = [v28 drawing];
      [v33 bounds];
      double MaxY = CGRectGetMaxY(v44);
      [v28 drawingTransform];
      [v32 updateDrawingHeight:MaxY * sqrt(v41 * v41 + v40 * v40)];
    }
  }
  objc_initWeak(buf, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__PKTiledView_performUndo___block_invoke_3;
  block[3] = &unk_1E64C5E98;
  objc_copyWeak(&v38, buf);
  id v37 = v28;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(buf);

LABEL_20:
}

void __27__PKTiledView_performUndo___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __27__PKTiledView_performUndo___block_invoke_2;
  v5[3] = &unk_1E64C5870;
  id v6 = *(id *)(a1 + 32);
  id v7 = v3;
  id v4 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], v5);
}

void __27__PKTiledView_performUndo___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) drawing];
  [v3 mergeWithDrawing:*(void *)(a1 + 40)];

  uint64_t v2 = objc_opt_class();
  PKDynamicCast(v2, *(void **)(a1 + 32));
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4) {
    [v4 drawingDidChange];
  }
}

void __27__PKTiledView_performUndo___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = [*(id *)(a1 + 32) drawing];
  [WeakRetained updateCurrentSelectionWithNewDrawingIfNecessary:v2];
}

+ (id)newInlineDrawingOfClass:(Class)a3
{
  id v3 = objc_alloc_init(a3);
  objc_msgSend(v3, "set_canvasBounds:", 0.0, 0.0, 768.0, 120.0);
  return v3;
}

- (BOOL)_isScrollViewSizeAnimating
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [(PKTiledView *)self scrollView];
  id v3 = [v2 layer];
  id v4 = [v3 animationKeys];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v10 + 1) + 8 * i) hasPrefix:@"bounds.size"])
        {
          BOOL v8 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 0;
LABEL_11:

  return v8;
}

- (void)_didAddDrawingAttachmentView
{
  if (self->_rulerHostingDelegate)
  {
    id v3 = [(PKTiledView *)self canvasView];
    char v4 = [v3 isDrawing];

    uint64_t v5 = [(PKTiledView *)self canvasView];
    uint64_t v6 = [(PKTiledView *)self drawingTouchThatHitNothing];
    -[PKTiledView canvasViewWillBeginNewStroke:withTouch:location:](self, "canvasViewWillBeginNewStroke:withTouch:location:", v5, v6, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

    rulerHostingDelegate = self->_rulerHostingDelegate;
    if (rulerHostingDelegate) {
      char v8 = 1;
    }
    else {
      char v8 = v4;
    }
    if ((v8 & 1) == 0)
    {
      uint64_t v9 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long v12 = 0;
        _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "Stroke already ended in _didAddDrawingAttachmentView", v12, 2u);
      }

      long long v10 = [(PKTiledView *)self canvasView];
      [(PKTiledView *)self canvasViewDidEndDrawing:v10];

      rulerHostingDelegate = self->_rulerHostingDelegate;
    }
    self->_rulerHostingDelegate = 0;
  }
  long long v11 = [(PKTiledView *)self selectionController];
  -[PKSelectionController _didAddDrawingAttachmentView](v11);
}

void __54__PKTiledView__layoutSubviewsUpdateTilesForRendering___block_invoke(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)*((void *)WeakRetained + 54);
    WeakRetained[54] = 0.0;
    id v7 = WeakRetained;

    id v3 = [v7 scrollView];
    [v3 zoomScale];
    if (v4 >= v7[88])
    {

      id WeakRetained = v7;
    }
    else
    {
      uint64_t v5 = [v7 scrollView];
      int v6 = [v5 isZooming];

      id WeakRetained = v7;
      if (v6)
      {
        [v7 updateTilesForVisibleRectRendering:1 offscreen:0 overrideAdditionalStrokes:0];
        id WeakRetained = v7;
      }
    }
  }
}

- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6
{
  id v11 = a3;
  long long v10 = [(PKTiledView *)self scrollView];
  [v10 contentOffset];
  -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:", v11, a4, a5, a6);
}

- (CGAffineTransform)contentCoordinateSpaceTransform
{
  uint64_t v5 = [(PKTiledView *)self contentCoordinateSpace];

  if (v5)
  {
    id v10 = [(PKTiledView *)self contentCoordinateSpace];
    id v7 = [(PKTiledView *)self canvasView];
    PK_transformToConvertFromCoordinateSpaceToCoordinateSpace(v10, v7, retstr);
  }
  else
  {
    uint64_t v8 = MEMORY[0x1E4F1DAB8];
    long long v9 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v9;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v8 + 32);
  }
  return result;
}

- (void)getAttachment:(id)a3 tileTransform:(CGAffineTransform *)a4 strokeTransform:(CGAffineTransform *)a5 paperTransform:(CGAffineTransform *)a6 scrollViewContentOffset:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  id v13 = a3;
  uint64_t v14 = [(PKTiledView *)self scrollView];
  [v14 zoomScale];
  double v16 = v15;

  long long v17 = [(PKTiledView *)self drawingTouchThatHitNothing];

  if (v17)
  {
    uint64_t v18 = [(PKTiledView *)self standInAttachmentView];

    id v13 = (id)v18;
  }
  memset(&v48[1], 0, sizeof(CGAffineTransform));
  if (v13) {
    [v13 drawingTransform];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  uint64_t v20 = [v13 tileContainerView];
  [v20 bounds];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  int v29 = [v13 tileContainerView];
  objc_msgSend(WeakRetained, "convertRect:fromView:", v29, v22, v24, v26, v28);
  double v31 = v30;
  double v33 = v32;

  [(PKTiledView *)self _layerContentsScale];
  CGFloat v35 = v34;
  memset(v48, 0, 48);
  long long v36 = [(PKTiledView *)self canvasView];
  id v37 = v36;
  if (v36) {
    [v36 _replayCoordinateSystemTransform];
  }
  else {
    memset(v48, 0, 48);
  }

  CGAffineTransform v47 = v48[0];
  if (CGAffineTransformIsIdentity(&v47))
  {
    id v38 = [(PKTiledView *)self contentCoordinateSpace];

    if (v38)
    {
      memset(&t1, 0, sizeof(t1));
      [(PKTiledView *)self contentCoordinateSpaceTransform];
      double v31 = *MEMORY[0x1E4F1DAD8];
      double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v16 = sqrt(t1.b * t1.b + t1.a * t1.a);
      double y = -t1.ty;
      double x = -t1.tx;
    }
  }
  else
  {
    double x = -v48[0].tx;
    double y = -v48[0].ty;
    double v31 = *MEMORY[0x1E4F1DAD8];
    double v33 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v16 = sqrt(v48[0].b * v48[0].b + v48[0].a * v48[0].a);
  }
  memset(&v46, 0, sizeof(v46));
  CGAffineTransformMakeTranslation(&v46, v31 - x, v33 - y);
  CGAffineTransformMakeScale(&v43, v16, v16);
  CGAffineTransform t1 = v48[1];
  CGAffineTransform t2 = v43;
  CGAffineTransformConcat(&v44, &t1, &t2);
  CGAffineTransform t1 = v44;
  CGAffineTransform t2 = v46;
  CGAffineTransformConcat(&v45, &t1, &t2);
  long long v39 = *(_OWORD *)&v45.c;
  *(_OWORD *)&a5->double a = *(_OWORD *)&v45.a;
  *(_OWORD *)&a5->c = v39;
  *(_OWORD *)&a5->tdouble x = *(_OWORD *)&v45.tx;
  CGAffineTransformMakeScale(&v44, v35, v35);
  long long v40 = *(_OWORD *)&a5->c;
  *(_OWORD *)&t1.double a = *(_OWORD *)&a5->a;
  *(_OWORD *)&t1.c = v40;
  *(_OWORD *)&t1.tdouble x = *(_OWORD *)&a5->tx;
  CGAffineTransform t2 = v44;
  CGAffineTransformConcat(&v45, &t1, &t2);
  long long v41 = *(_OWORD *)&v45.c;
  *(_OWORD *)&a4->double a = *(_OWORD *)&v45.a;
  *(_OWORD *)&a4->c = v41;
  *(_OWORD *)&a4->tdouble x = *(_OWORD *)&v45.tx;
  CGAffineTransformMakeTranslation(&t1, -x / v16, -y / v16);
  long long v42 = *(_OWORD *)&t1.c;
  *(_OWORD *)&a6->double a = *(_OWORD *)&t1.a;
  *(_OWORD *)&a6->c = v42;
  *(_OWORD *)&a6->tdouble x = *(_OWORD *)&t1.tx;
}

- (id)canvasViewTouchView:(id)a3
{
  double v4 = [(PKTiledView *)self liveAttachment];

  if (v4) {
    [(PKTiledView *)self liveAttachment];
  }
  else {
  uint64_t v5 = [(PKTiledView *)self standInAttachmentView];
  }

  return v5;
}

- (id)_hitAttachment:(CGPoint)a3
{
  return -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 1, a3.x, a3.y);
}

- (id)hitAttachment:(CGPoint)a3
{
  return -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 1, a3.x, a3.y);
}

- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4
{
  return -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, 1, a3.x, a3.y);
}

- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4
{
  return -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, 1, a3.x, a3.y);
}

- (id)_hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  double y = a3.y;
  double x = a3.x;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v10 = [(PKTiledView *)self contentCoordinateSpace];
  if (v10 && [(PKTiledView *)self disableTileRendering])
  {
    id v11 = [(PKTiledView *)self _visibleAttachments];
    uint64_t v12 = [v11 count];

    if (v12 == 1)
    {
      id v13 = [(PKTiledView *)self _visibleAttachments];
      id v14 = [v13 firstObject];

      goto LABEL_28;
    }
  }
  else
  {
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  double v15 = [(PKTiledView *)self _visibleAttachments];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v65 count:16];
  if (!v16)
  {

    if (!v6)
    {
LABEL_27:
      id v14 = 0;
      goto LABEL_28;
    }
LABEL_23:
    id v37 = [(PKTiledView *)self standInAttachmentView];
    if (v37)
    {
      id v38 = [(PKTiledView *)self standInAttachmentView];
      long long v39 = [v38 attachmentContainerView];
      char v40 = [v39 isHidden];

      if ((v40 & 1) == 0)
      {
        long long v41 = [(PKTiledView *)self standInAttachmentView];
        [v41 bounds];
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        double v49 = v48;

        unint64_t v50 = [(PKTiledView *)self scrollView];
        [v50 bounds];
        double v52 = v51;

        id v53 = [(PKTiledView *)self standInAttachmentView];
        objc_msgSend(v53, "convertPoint:fromView:", self, x, y);
        double v55 = v54;
        double v57 = v56;

        id v58 = [(PKTiledView *)self standInAttachmentView];
        int v59 = objc_msgSend(v58, "hitByTouchLocation:bounds:", v55, v57, v43, v45, v47, v49 + v52);

        if (v59)
        {
          id v14 = [(PKTiledView *)self standInAttachmentView];
          goto LABEL_28;
        }
      }
    }
    goto LABEL_27;
  }
  uint64_t v17 = *(void *)v62;
  while (2)
  {
    for (uint64_t i = 0; i != v16; ++i)
    {
      if (*(void *)v62 != v17) {
        objc_enumerationMutation(v15);
      }
      uint64_t v19 = *(void **)(*((void *)&v61 + 1) + 8 * i);
      uint64_t v20 = [v19 viewRep];
      [v20 bounds];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;

      if (v19 && ([v19 isAtEndOfDocument] & v5) == 1)
      {
        int v29 = [(PKTiledView *)self scrollView];
        [v29 bounds];
        double v31 = v30;

        double v28 = v28 + v31;
      }
      double v32 = [v19 viewRep];
      objc_msgSend(v32, "convertPoint:fromView:", self, x, y);
      double v34 = v33;
      double v36 = v35;

      if (objc_msgSend(v19, "hitByTouchLocation:bounds:", v34, v36, v22, v24, v26, v28))
      {
        id v14 = v19;
        goto LABEL_19;
      }
    }
    uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v65 count:16];
    if (v16) {
      continue;
    }
    break;
  }
  id v14 = 0;
LABEL_19:

  if (!v14 && v6) {
    goto LABEL_23;
  }
LABEL_28:

  return v14;
}

- (id)hitAttachment:(CGPoint)a3 includeStandinAttachment:(BOOL)a4 expandBottomAttachment:(BOOL)a5
{
  BOOL v5 = -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", a4, a5, a3.x, a3.y);
  uint64_t v6 = objc_opt_class();
  id v7 = PKDynamicCast(v6, v5);

  return v7;
}

- (BOOL)insertAttachmentIfInBlankSpace:(CGPoint)a3
{
  return 0;
}

- (BOOL)isReadOnlyView
{
  return self->_drawingPolicy == 0;
}

- (BOOL)isInNotesTextView
{
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  double v4 = [v3 bundleIdentifier];
  int v5 = [v4 isEqualToString:@"com.apple.mobilenotes"];

  if (v5)
  {
    uint64_t v6 = [(PKTiledView *)self superview];
    if (v6)
    {
      id v7 = (void *)v6;
      while (1)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        uint64_t v8 = [v7 superview];

        id v7 = (void *)v8;
        if (!v8) {
          goto LABEL_6;
        }
      }

      LOBYTE(v6) = 1;
    }
  }
  else
  {
LABEL_6:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_setupPencilShadowViewIfNecessary
{
  BOOL v3 = [(PKTiledView *)self toolShadowShouldBeActive];
  id v5 = [(PKTiledView *)self window];
  double v4 = [v5 windowScene];
  if (v3) {
    +[PKPencilShadowView createShadowViewForSceneIfNecessary:v4];
  }
  else {
    +[PKPencilShadowView hideShadowViewForSceneIfNecessary:v4];
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__526;
  double v21 = __Block_byref_object_dispose__527;
  id v22 = 0;
  uint64_t v8 = [(PKTiledView *)self subviews];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __33__PKTiledView_hitTest_withEvent___block_invoke;
  v12[3] = &unk_1E64C5BD0;
  CGFloat v15 = x;
  CGFloat v16 = y;
  id v14 = &v17;
  v12[4] = self;
  id v9 = v7;
  id v13 = v9;
  [v8 enumerateObjectsWithOptions:2 usingBlock:v12];

  id v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

void __33__PKTiledView_hitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  objc_msgSend(a2, "convertPoint:fromView:", *(void *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t v7 = objc_msgSend(a2, "hitTest:withEvent:", *(void *)(a1 + 40));
  uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)
    || ((v10 = *(void **)(*(void *)(a1 + 32) + 720), v10 == a2) ? (BOOL v11 = v10 == 0) : (BOOL v11 = 1), !v11))
  {
    *a4 = 1;
  }
}

- (id)_visibleTilesForAttachment:(id)a3
{
  id v4 = a3;
  [(PKTiledView *)self bounds];
  id v5 = -[PKTiledView _tilesForAttachment:bounds:invert:](self, "_tilesForAttachment:bounds:invert:", v4, 0);

  return v5;
}

- (id)_tilesForAttachment:(id)a3 bounds:(CGRect)a4 invert:(BOOL)a5
{
  BOOL v5 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v13 = objc_opt_class();
  id v14 = PKDynamicCast(v13, v11);
  id v37 = v14;
  if (v14)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    CGFloat v15 = [v14 tiles];
    CGFloat v16 = [v15 allValues];

    uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v39;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v39 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(double **)(*((void *)&v38 + 1) + 8 * v19);
          if (v20)
          {
            double v22 = v20[27];
            double v21 = v20[28];
            double v23 = v20[29];
            double v24 = v20[30];
          }
          else
          {
            double v21 = 0.0;
            double v23 = 0.0;
            double v24 = 0.0;
            double v22 = 0.0;
          }
          double v25 = [v11 tileContainerView];
          -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v25, v22, v21, v23, v24);
          CGFloat v27 = v26;
          CGFloat v29 = v28;
          CGFloat v31 = v30;
          CGFloat v33 = v32;

          v45.origin.CGFloat x = v27;
          v45.origin.CGFloat y = v29;
          v45.size.CGFloat width = v31;
          v45.size.CGFloat height = v33;
          v46.origin.CGFloat x = x;
          v46.origin.CGFloat y = y;
          v46.size.CGFloat width = width;
          v46.size.CGFloat height = height;
          if (CGRectIntersectsRect(v45, v46) != v5) {
            [v12 addObject:v20];
          }
          ++v19;
        }
        while (v17 != v19);
        uint64_t v34 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
        uint64_t v17 = v34;
      }
      while (v34);
    }

    id v35 = v12;
  }
  else
  {
    id v35 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v35;
}

- (void)setSixChannelBlendingDisableSnapshotting:(BOOL)a3
{
  self->_hoverIsKnownToBeUnsupported = a3;
  int64_t v4 = [(PKTiledView *)self _activeSixChannelBlendingMode];
  drawingPolicCGFloat y = (void *)self->_drawingPolicy;

  [drawingPolicy setSixChannelBlendingMode:v4];
}

- (BOOL)_snapshottingDisabled
{
  if ([(PKTiledView *)self sixChannelBlendingDisableSnapshotting]) {
    return 1;
  }
  if ((*(unsigned char *)&self->_tiledViewFlags & 0x10) == 0) {
    return 0;
  }
  int64_t v4 = [(PKTiledView *)self delegate];
  char v3 = [v4 _canvasViewSnapshottingDisabled:self];

  return v3;
}

- (void)_canvasViewWillCreateSnapshot
{
  if ((*(unsigned char *)&self->_tiledViewFlags & 8) != 0)
  {
    id v3 = [(PKTiledView *)self delegate];
    [v3 _canvasViewWillCreateSnapshot:self];
  }
}

- (void)setDisableTileRendering:(BOOL)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  BYTE5(self->_refineAnimationController) = a3;
  if (a3 && self->_drawingTouchThatHitNothing)
  {
    [(PKTiledView *)self cancelTileGenerationInvalidateTiles:1];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v18 = self;
    int64_t v4 = [(PKTiledView *)self attachmentViews];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v9 = [v8 tiles];
          id v10 = [v9 objectEnumerator];

          uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v20;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v20 != v12) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * j);
                if (v14) {
                  atomic_fetch_add((atomic_ullong *volatile)(v14 + 16), 1uLL);
                }
                -[PKRendererTile purgeTileLayers](v14);
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v27 count:16];
            }
            while (v11);
          }

          CGFloat v15 = [v8 tiles];
          [v15 removeAllObjects];

          CGFloat v16 = [v8 purgedTiles];
          [v16 removeAllObjects];
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v5);
    }

    -[PKTileController teardown]((uint64_t)v18->_drawingTouchThatHitNothing);
    drawingTouchThatHitNothing = v18->_drawingTouchThatHitNothing;
    v18->_drawingTouchThatHitNothing = 0;
  }
}

- (void)_finishCombiningStrokesIfNecessaryForAttachment:(id)a3
{
  id v10 = a3;
  if (v10)
  {
    int64_t v4 = [(PKTiledView *)self canvasView];
    if ([v4 _isCombiningStrokes])
    {
      uint64_t v5 = [(PKTiledView *)self canvasView];
      uint64_t v6 = [v5 _combineStrokesDrawingUUID];
      uint64_t v7 = [v10 drawing];
      uint64_t v8 = [v7 uuid];
      char v9 = [v6 isEqual:v8];

      if (v9) {
        goto LABEL_6;
      }
      int64_t v4 = [(PKTiledView *)self canvasView];
      [v4 _finishCombiningStrokesIfNecessary];
    }
  }
LABEL_6:
}

- (void)suspendWorkForDrawing
{
}

- (void)renderAttachment:(id)a3 intoCanvas:(id)a4 showing:(BOOL)a5
{
  v169[8] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = -[PKTiledView currentDrawingBeingCopiedToCanvas]((id *)&self->super.super.super.isa);
  uint64_t v11 = [v8 drawing];

  if (v10 != v11)
  {
    long long v125 = v9;
    [(PKTiledView *)self _finishCombiningStrokesIfNecessaryForAttachment:v8];
    long long v126 = [(PKTiledView *)self _visibleTilesForAttachment:v8];
    uint64_t v12 = [(PKTiledView *)self canvasView];
    uint64_t v13 = [v8 tileMaskView];
    [v13 bounds];
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    long long v22 = [v8 tileMaskView];
    objc_msgSend(v12, "convertRect:fromView:", v22, v15, v17, v19, v21);
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    double v30 = v29;

    if (v8)
    {
      if (([v8 isAtEndOfDocument] & 1) != 0
        || ([(PKTiledView *)self standInAttachmentView],
            id v31 = (id)objc_claimAutoreleasedReturnValue(),
            v31,
            v31 == v8))
      {
        double v32 = [(PKTiledView *)self scrollView];
        [v32 bounds];
        double v34 = v33;

        id v35 = [(PKTiledView *)self standInAttachmentView];
        double v30 = v30 + v34;

        if (v35 == v8)
        {
          double v36 = [(PKTiledView *)self scrollView];
          [v36 bounds];
          CGFloat v28 = v37;
        }
      }
    }
    [(PKTiledView *)self bounds];
    v174.origin.double x = v38;
    v174.origin.double y = v39;
    v174.size.CGFloat width = v40;
    v174.size.double height = v41;
    v170.origin.double x = v24;
    v170.origin.double y = v26;
    v170.size.CGFloat width = v28;
    v170.size.double height = v30;
    CGRect v171 = CGRectIntersection(v170, v174);
    double x = v171.origin.x;
    double y = v171.origin.y;
    CGFloat width = v171.size.width;
    double height = v171.size.height;
    [(PKTiledView *)self bounds];
    double v47 = v46;
    [(PKTiledView *)self _layerContentsScale];
    double v49 = DKDMultiplyRectScalar(x, v47 - y - height, width, height, v48);
    double v51 = v50;
    id v53 = v52;
    double v55 = v54;
    [(PKTiledView *)self suspendWorkForDrawing];
    objc_initWeak(&location, self);
    [(PKTiledView *)self getAttachment:v8 tileTransform:v166 strokeTransform:v165 paperTransform:v164];
    if (self)
    {
      long long v56 = v165[1];
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.b = v165[0];
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.d = v56;
      *(_OWORD *)&self->_strokeTransformAtStartOfStroke.tdouble y = v165[2];
    }
    double v57 = [v8 drawing];
    -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)&self->super.super.super.isa, v57);

    uint64_t v155 = 0;
    v156 = &v155;
    uint64_t v157 = 0x6012000000;
    v158 = __Block_byref_object_copy__554;
    v159 = __Block_byref_object_dispose__555;
    v160 = "";
    long long v58 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    long long v161 = *MEMORY[0x1E4F1DAB8];
    long long v162 = v58;
    long long v163 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    uint64_t v149 = 0;
    v150 = &v149;
    uint64_t v151 = 0x3032000000;
    v152 = __Block_byref_object_copy__526;
    v153 = __Block_byref_object_dispose__527;
    id v154 = 0;
    if ([(PKTiledView *)self _sixChannelBlendingIsActive])
    {
      if (![(PKTiledView *)self _snapshottingDisabled])
      {
        [(PKTiledView *)self _canvasViewWillCreateSnapshot];
        uint64_t v120 = [(PKTiledView *)self window];
        id v124 = [(PKTiledView *)self contentSnapshottingView];
        if (!v124) {
          id v124 = v120;
        }
        int v59 = [(PKTiledView *)self canvasView];
        id v60 = [v59 _rendererController];
        if (v60) {
          BOOL v61 = v60[505] != 0;
        }
        else {
          BOOL v61 = 0;
        }

        +[PKMetalUtility layerContentsScale];
        double v63 = v62;
        [v124 layer];
        v117 = v55;
        long long v64 = v51;
        v122 = double v65 = v49;
        [v122 bounds];
        sdouble x = v63;
        double v70 = DKDMultiplyRectScalar(v66, v67, v68, v69, v63);
        v172.origin.double x = DKDRoundedRectForScale(v70, v71, v72, v73, 1.0);
        CGFloat v74 = v172.origin.x;
        CGFloat v75 = v172.origin.y;
        CGFloat v76 = v172.size.width;
        CGFloat v77 = v172.size.height;
        double v78 = CGRectGetWidth(v172);
        v173.origin.double x = v74;
        v173.origin.double y = v75;
        v173.size.CGFloat width = v76;
        v173.size.double height = v77;
        double v79 = CGRectGetHeight(v173);
        uint64_t v80 = [(PKTiledView *)self canvasView];
        id v81 = v80;
        double v82 = 1.0;
        if (v79 >= 1.0) {
          double v83 = v79;
        }
        else {
          double v83 = 1.0;
        }
        if (v78 >= 1.0) {
          double v82 = v78;
        }
        uint64_t v123 = objc_msgSend(v80, "snapshotFramebufferWithSize:", v82, v83);

        double v51 = v64;
        double v55 = v117;
        double v49 = v65;
        uint64_t v84 = (void *)v123;
        if (v123 && *(void *)(v123 + 56))
        {
          double v118 = (__CFString *)(id)*MEMORY[0x1E4F3A4F8];
          uint64_t v85 = [(PKTiledView *)self window];
          uint64_t v86 = [v85 screen];
          uint64_t v87 = [v86 displayConfiguration];
          long long v121 = [v87 name];

          if (!v121)
          {
            uint64_t v88 = [MEMORY[0x1E4F39B60] mainDisplay];
            uint64_t v89 = [v88 name];

            uint64_t v90 = @"LCD";
            if (v89) {
              uint64_t v90 = (__CFString *)v89;
            }
            long long v121 = v90;
          }
          uint64_t v91 = [(PKTiledView *)self window];
          v119 = [v91 windowScene];

          char v92 = objc_opt_respondsToSelector();
          CGFloat v93 = sx;
          if (v92)
          {
            v94 = objc_msgSend(v119, "renderingEnvironment", sx);
            if (objc_opt_respondsToSelector())
            {
              v95 = [v94 systemDisplayIdentifier];
              if (v95)
              {

                id v96 = v95;
                double v118 = @"systemIdentifier";
                long long v121 = v96;
              }
            }
            CGFloat v93 = sx;
          }
          memset(&v148, 0, sizeof(v148));
          CGAffineTransformMakeScale(&v148, v93, v93);
          CGAffineTransform m = v148;
          memset(&v147, 0, sizeof(v147));
          CATransform3DMakeAffineTransform(&v147, &m);
          uint64_t v97 = *MEMORY[0x1E4F3A558];
          v168[0] = *MEMORY[0x1E4F3A538];
          v168[1] = v118;
          v169[0] = v97;
          v169[1] = v121;
          uint64_t v98 = *MEMORY[0x1E4F3A4F0];
          v169[2] = *(void *)(v123 + 56);
          uint64_t v99 = *MEMORY[0x1E4F3A588];
          v168[2] = v98;
          v168[3] = v99;
          CATransform3D v145 = v147;
          uint64_t v100 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v145];
          v169[3] = v100;
          v168[4] = *MEMORY[0x1E4F3A4E0];
          unint64_t v101 = NSNumber;
          double v102 = [v122 context];
          v103 = objc_msgSend(v101, "numberWithUnsignedInt:", objc_msgSend(v102, "contextId"));
          v169[4] = v103;
          v168[5] = *MEMORY[0x1E4F3A530];
          uint64_t v104 = [NSNumber numberWithUnsignedLongLong:v122];
          v169[5] = v104;
          v168[6] = *MEMORY[0x1E4F3A518];
          v105 = [NSNumber numberWithBool:v61];
          v168[7] = *MEMORY[0x1E4F3A510];
          v169[6] = v105;
          v169[7] = MEMORY[0x1E4F1CC38];
          v106 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v169 forKeys:v168 count:8];

          Class defaultDrawingClass = self->_defaultDrawingClass;
          v138[0] = MEMORY[0x1E4F143A8];
          v138[1] = 3221225472;
          v138[2] = __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke;
          v138[3] = &unk_1E64C5BF8;
          id v139 = v106;
          id v140 = v124;
          v141 = self;
          v143 = &v155;
          v144 = &v149;
          uint64_t v142 = v123;
          id v108 = v106;
          [(objc_class *)defaultDrawingClass avoidSnapshot:v138];

          uint64_t v84 = (void *)v123;
        }
      }
      id v109 = v126;
      v110 = [(PKTiledView *)self ink];
      char v111 = [v110 _isEraserInk];

      if ((v111 & 1) == 0)
      {

        id v109 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      id v109 = v126;
    }
    uint64_t v112 = [(PKTiledView *)self canvasView];
    double v113 = [v8 drawing];
    v137[1] = v166[1];
    v137[2] = v166[2];
    uint64_t v114 = v150[5];
    long long v115 = *((_OWORD *)v156 + 4);
    v136[0] = *((_OWORD *)v156 + 3);
    v136[1] = v115;
    v136[2] = *((_OWORD *)v156 + 5);
    v137[0] = v166[0];
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke_572;
    v127[3] = &unk_1E64C5C20;
    id v128 = v125;
    v131[1] = *(id *)&v49;
    v131[2] = v51;
    v131[3] = v53;
    v131[4] = v55;
    long long v132 = v164[0];
    long long v133 = v164[1];
    long long v134 = v164[2];
    objc_copyWeak(v131, &location);
    BOOL v135 = a5;
    id v129 = v8;
    uint64_t v130 = self;
    [v112 _setDrawing:v113 tiles:v109 tileTransform:v137 snapshotTexture:v114 snapshotTextureTransform:v136 completionBlock:v127];

    objc_destroyWeak(v131);
    _Block_object_dispose(&v149, 8);

    _Block_object_dispose(&v155, 8);
    objc_destroyWeak(&location);

    id v9 = v125;
  }
}

- (id)currentDrawingBeingCopiedToCanvas
{
  if (WeakRetained)
  {
    id WeakRetained = (id *)objc_loadWeakRetained(WeakRetained + 92);
    uint64_t v1 = vars8;
  }
  return WeakRetained;
}

void __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke(uint64_t a1)
{
  uint64_t v2 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v2, OS_LOG_TYPE_DEFAULT, "Snapshot", buf, 2u);
  }

  if (CARenderServerSnapshot())
  {
    [*(id *)(a1 + 40) bounds];
    double v4 = v3;
    [*(id *)(a1 + 40) bounds];
    objc_msgSend(*(id *)(a1 + 48), "convertRect:fromView:", *(void *)(a1 + 40), 0.0, 0.0, v4);
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [*(id *)(a1 + 48) bounds];
    DKDNormalizedSubrectInRect(v6, v8, v10, v12);
    +[PKMetalUtility transformConvertingRect:toRect:percent:](PKMetalUtility, "transformConvertingRect:toRect:percent:", 0x3FF0000000000000);
    uint64_t v13 = *(_OWORD **)(*(void *)(a1 + 64) + 8);
    long long v14 = v18;
    v13[3] = *(_OWORD *)buf;
    v13[4] = v14;
    v13[5] = v19;
    uint64_t v15 = *(void *)(a1 + 56);
    if (v15) {
      double v16 = *(void **)(v15 + 24);
    }
    else {
      double v16 = 0;
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v16);
  }
}

void __51__PKTiledView_renderAttachment_intoCanvas_showing___block_invoke_572(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setViewScissor:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  long long v2 = *(_OWORD *)(a1 + 112);
  v45[0] = *(_OWORD *)(a1 + 96);
  v45[1] = v2;
  v45[2] = *(_OWORD *)(a1 + 128);
  [*(id *)(a1 + 32) setPaperTransform:v45];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  double v4 = WeakRetained;
  if (*(unsigned char *)(a1 + 144))
  {
    if (WeakRetained)
    {
      double v5 = [WeakRetained canvasView];
      int v6 = [v5 wantsCanvasVisible];

      if (v6)
      {
        [MEMORY[0x1E4F39CF8] begin];
        [MEMORY[0x1E4F39CF8] setDisableActions:1];
        double v7 = [*(id *)(a1 + 40) drawing];
        CGFloat v8 = [v7 uuid];
        double v9 = [v4 attachmentForUUID:v8];

        if (![*(id *)(a1 + 48) _sixChannelBlendingIsActive]
          || ([*(id *)(a1 + 32) hasSnapshot] & 1) != 0
          || ([*(id *)(a1 + 48) ink],
              CGFloat v10 = objc_claimAutoreleasedReturnValue(),
              int v11 = [v10 _isEraserInk],
              v10,
              v11))
        {
          [v9 setContentHidden:1];
        }
        if ([v4 canvasViewZOrderPolicy] == 2)
        {
          CGFloat v12 = *(void **)(a1 + 32);
          [v12 bounds];
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;
          double v20 = v19;
          double v21 = [v9 superview];
          objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
          double v23 = v22;
          double v25 = v24;
          double v27 = v26;
          double v29 = v28;

          [*(id *)(a1 + 32) frame];
          objc_msgSend(*(id *)(a1 + 32), "bounds", DKDTransformConvertingRectToRectAtPercent((uint64_t)v43, v30, v31, v32, v33, v23, v25, v27, v29, 1.0));
          CGFloat MidX = CGRectGetMidX(v46);
          [*(id *)(a1 + 32) bounds];
          CGFloat MidY = CGRectGetMidY(v47);
          CGAffineTransformMakeTranslation(&v42, MidX, MidY);
          DKDTransformInTransformSpace(v43, &v42, &v44);
          double v36 = *(void **)(a1 + 32);
          CGAffineTransform v41 = v44;
          [v36 setTransform:&v41];
          double v37 = [v9 superview];
          [v37 insertSubview:*(void *)(a1 + 32) aboveSubview:v9];

          CGFloat v38 = [v4 topZAttachment];
          [*(id *)(a1 + 32) setIsUnderBlendedContent:v9 != v38];
        }
        int v39 = [*(id *)(a1 + 32) isHidden];
        [*(id *)(a1 + 32) setHidden:0];
        if (v39 && (v4[440] & 0x20) != 0)
        {
          CGFloat v40 = [v4 delegate];
          [v40 canvasView:v4 didChangeHiddenState:0];
        }
        [MEMORY[0x1E4F39CF8] commit];
        kdebug_trace();
      }
    }
  }
  -[PKTiledView setCurrentDrawingBeingCopiedToCanvas:]((id *)v4, 0);
}

- (void)_copyFromCanvas:(id)a3 intoAttachment:(id)a4 hideCanvas:(BOOL)a5 strokes:(id)a6
{
  BOOL v78 = a5;
  uint64_t v132 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v80 = a4;
  id v81 = a6;
  CGFloat v8 = [v80 drawing];
  double v9 = [v8 strokes];
  CGFloat v10 = (void *)[v9 copy];

  CGFloat v75 = v10;
  double v82 = [(PKTiledView *)self _visibleTilesForAttachment:v80];
  int v11 = (void *)[v10 mutableCopy];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  id v12 = [v81 reverseObjectEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v119 objects:v131 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v120;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v120 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v119 + 1) + 8 * i);
        double v17 = [v11 lastObject];
        LODWORD(v16) = [v17 isEqual:v16];

        if (!v16)
        {
          double v25 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C44F8000, v25, OS_LOG_TYPE_DEFAULT, "Unexpected stroke in expectedTileStrokes", buf, 2u);
          }

          goto LABEL_23;
        }
        [v11 removeLastObject];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v119 objects:v131 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v116 = 0u;
  long long v117 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  id v12 = v82;
  uint64_t v19 = [v12 countByEnumeratingWithState:&v114 objects:v130 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v115;
LABEL_11:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v115 != v20) {
        objc_enumerationMutation(v12);
      }
      PropertCGFloat y = *(id *)(*((void *)&v114 + 1) + 8 * v21);
      if (Property) {
        PropertCGFloat y = objc_getProperty(Property, v18, 136, 1);
      }
      id v23 = Property;
      BOOL v24 = v23 == 0;

      if (v24) {
        break;
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = [v12 countByEnumeratingWithState:&v114 objects:v130 count:16];
        if (v19) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
    }
LABEL_23:
    char v76 = 1;
  }
  else
  {
LABEL_19:
    char v76 = 0;
  }

  double v26 = [(PKTiledView *)self scrollView];
  [v26 contentOffset];
  -[PKTiledView getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:](self, "getAttachment:tileTransform:strokeTransform:paperTransform:scrollViewContentOffset:", v80, v125, v124, v123);

  if (v78) {
    -[PKTiledView setLiveAttachment:]((uint64_t)self, 0);
  }
  if ([v81 count])
  {
    CGFloat x = *MEMORY[0x1E4F1DB20];
    CGFloat y = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    long long v110 = 0u;
    long long v111 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v31 = v81;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v110 objects:v129 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v111;
      do
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v111 != v33) {
            objc_enumerationMutation(v31);
          }
          [*(id *)(*((void *)&v110 + 1) + 8 * j) renderBounds];
          v135.origin.CGFloat x = v35;
          v135.origin.CGFloat y = v36;
          v135.size.CGFloat width = v37;
          v135.size.CGFloat height = v38;
          v133.origin.CGFloat x = x;
          v133.origin.CGFloat y = y;
          v133.size.CGFloat width = width;
          v133.size.CGFloat height = height;
          CGRect v134 = CGRectUnion(v133, v135);
          CGFloat x = v134.origin.x;
          CGFloat y = v134.origin.y;
          CGFloat width = v134.size.width;
          CGFloat height = v134.size.height;
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v110 objects:v129 count:16];
      }
      while (v32);
    }

    int v39 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v82, "count"));
    long long v108 = 0u;
    long long v109 = 0u;
    long long v106 = 0u;
    long long v107 = 0u;
    id v40 = v82;
    uint64_t v41 = [v40 countByEnumeratingWithState:&v106 objects:v128 count:16];
    if (v41)
    {
      uint64_t v42 = *(void *)v107;
      do
      {
        uint64_t v43 = 0;
        do
        {
          if (*(void *)v107 != v42) {
            objc_enumerationMutation(v40);
          }
          CGAffineTransform v44 = *(void **)(*((void *)&v106 + 1) + 8 * v43);
          if (v44)
          {
            uint64_t v45 = v44[23];
            uint64_t v46 = v44[24];
            uint64_t v47 = v44[25];
            uint64_t v48 = v44[26];
          }
          else
          {
            uint64_t v46 = 0;
            uint64_t v47 = 0;
            uint64_t v48 = 0;
            uint64_t v45 = 0;
          }
          v136.origin.CGFloat x = x;
          v136.origin.CGFloat y = y;
          v136.size.CGFloat width = width;
          v136.size.CGFloat height = height;
          if (CGRectIntersectsRect(*(CGRect *)&v45, v136)) {
            [v39 addObject:v44];
          }
          ++v43;
        }
        while (v41 != v43);
        uint64_t v49 = [v40 countByEnumeratingWithState:&v106 objects:v128 count:16];
        uint64_t v41 = v49;
      }
      while (v49);
    }
  }
  else
  {
    int v39 = 0;
    char v76 = 1;
  }
  long long v104 = 0u;
  long long v105 = 0u;
  long long v102 = 0u;
  long long v103 = 0u;
  id v50 = v39;
  uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v127 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v103;
    do
    {
      for (uint64_t k = 0; k != v51; ++k)
      {
        if (*(void *)v103 != v52) {
          objc_enumerationMutation(v50);
        }
        uint64_t v54 = *(void *)(*((void *)&v102 + 1) + 8 * k);
        if (v54) {
          atomic_fetch_add((atomic_ullong *volatile)(v54 + 16), 1uLL);
        }
      }
      uint64_t v51 = [v50 countByEnumeratingWithState:&v102 objects:v127 count:16];
    }
    while (v51);
  }

  double v55 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v82, "count"));
  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v56 = v82;
  uint64_t v57 = [v56 countByEnumeratingWithState:&v98 objects:v126 count:16];
  if (v57)
  {
    uint64_t v58 = *(void *)v99;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v99 != v58) {
          objc_enumerationMutation(v56);
        }
        uint64_t v60 = *(void *)(*((void *)&v98 + 1) + 8 * v59);
        if (v60) {
          unint64_t v61 = atomic_load((unint64_t *)(v60 + 16));
        }
        else {
          unint64_t v61 = 0;
        }
        double v62 = [NSNumber numberWithInteger:v61];
        if (v60) {
          double v63 = *(void **)(v60 + 120);
        }
        else {
          double v63 = 0;
        }
        id v64 = v63;
        [v55 setObject:v62 forKeyedSubscript:v64];

        ++v59;
      }
      while (v57 != v59);
      uint64_t v65 = [v56 countByEnumeratingWithState:&v98 objects:v126 count:16];
      uint64_t v57 = v65;
    }
    while (v65);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke;
  aBlock[3] = &unk_1E64C5C48;
  id v73 = v11;
  id v87 = v73;
  id v66 = v50;
  id v88 = v66;
  id v67 = v55;
  id v89 = v67;
  id v68 = v56;
  id v90 = v68;
  char v96 = v76;
  id v69 = v75;
  BOOL v97 = v78;
  id v91 = v69;
  char v92 = self;
  id v77 = v74;
  id v93 = v77;
  id v79 = v80;
  id v94 = v79;
  id v70 = v81;
  id v95 = v70;
  CGFloat v71 = (void (**)(void))_Block_copy(aBlock);
  if ([v66 count] && !-[PKTiledView disableTileRendering](self, "disableTileRendering", v73))
  {
    CGFloat v72 = [(PKTiledView *)self tileController];
    v84[0] = MEMORY[0x1E4F143A8];
    v84[1] = 3221225472;
    v84[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_574;
    v84[3] = &unk_1E64C5390;
    uint64_t v85 = v71;
    if (v72) {
      -[PKMetalRendererController updateTiles:withNewStrokes:completionBlock:](v72[3], v66, v70, v84);
    }
  }
  else
  {
    v71[2](v71);
  }
}

void __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke(uint64_t a1)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) copy];
  double v3 = (void *)v2;
  double v4 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    double v4 = (void *)v2;
  }
  id v5 = v4;

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v64;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v64 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v63 + 1) + 8 * v9);
        if (v10)
        {
          unint64_t v11 = atomic_load((unint64_t *)(v10 + 16));
          id v12 = *(void **)(v10 + 120);
        }
        else
        {
          unint64_t v11 = 0;
          id v12 = 0;
        }
        uint64_t v13 = *(void **)(a1 + 48);
        id v14 = v12;
        double v15 = [v13 objectForKeyedSubscript:v14];
        BOOL v16 = v11 == [v15 unsignedIntegerValue];

        if (v16) {
          -[PKRendererTile updateDisableTransactionActions:reloadContents:](v10, 1, 1);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v17 = [v6 countByEnumeratingWithState:&v63 objects:v72 count:16];
      uint64_t v7 = v17;
    }
    while (v17);
  }

  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v18 = *(id *)(a1 + 56);
  uint64_t v20 = [v18 countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (!v20)
  {
    char v56 = 0;
    goto LABEL_45;
  }
  char v56 = 0;
  uint64_t v21 = *(void *)v60;
  do
  {
    uint64_t v22 = 0;
    do
    {
      if (*(void *)v60 != v21) {
        objc_enumerationMutation(v18);
      }
      id v23 = *(unint64_t **)(*((void *)&v59 + 1) + 8 * v22);
      if (*(unsigned char *)(a1 + 104))
      {
        if (v23) {
          objc_setProperty_atomic_copy(*(id *)(*((void *)&v59 + 1) + 8 * v22), v19, 0, 136);
        }
      }
      else
      {
        if (v23)
        {
          unint64_t v24 = atomic_load(v23 + 2);
          double v25 = (void *)v23[15];
        }
        else
        {
          unint64_t v24 = 0;
          double v25 = 0;
        }
        double v26 = *(void **)(a1 + 48);
        id v27 = v25;
        double v28 = [v26 objectForKeyedSubscript:v27];
        BOOL v29 = v24 == [v28 unsignedIntegerValue];

        if (!v29) {
          goto LABEL_36;
        }
        if (v23) {
          PropertCGFloat y = objc_getProperty(v23, v19, 136, 1);
        }
        else {
          PropertCGFloat y = 0;
        }
        id v31 = Property;
        char v32 = [v31 isEqualToArray:v5];

        if ((v32 & 1) == 0)
        {
          CGFloat v36 = os_log_create("com.apple.pencilkit", "Sketching");
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1C44F8000, v36, OS_LOG_TYPE_DEFAULT, "Detected a tile with unexpected strokes", buf, 2u);
          }

          if (v23) {
            objc_setProperty_atomic_copy(v23, v19, 0, 136);
          }
LABEL_36:
          char v56 = 1;
          goto LABEL_37;
        }
        if (v23)
        {
          id v34 = objc_getProperty(v23, v33, 136, 1);

          id v5 = v34;
          objc_setProperty_atomic_copy(v23, v35, *(id *)(a1 + 64), 136);
        }
        else
        {

          id v5 = 0;
        }
      }
LABEL_37:
      ++v22;
    }
    while (v20 != v22);
    uint64_t v37 = [v18 countByEnumeratingWithState:&v59 objects:v71 count:16];
    uint64_t v20 = v37;
  }
  while (v37);
LABEL_45:

  if (*(unsigned char *)(a1 + 105))
  {
    CGFloat v38 = [*(id *)(a1 + 72) liveAttachment];
    BOOL v39 = v38 == 0;

    if (v39)
    {
      kdebug_trace();
      [*(id *)(a1 + 72) _hideCanvas];
      CGAffineTransform v44 = (void *)MEMORY[0x1E4F39CF8];
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_573;
      v57[3] = &unk_1E64C5368;
      uint64_t v58 = *(id *)(a1 + 80);
      [v44 setCompletionBlock:v57];
      id v40 = v58;
    }
    else
    {
      id v40 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v40, OS_LOG_TYPE_DEBUG, "Skipped hiding canvas because a new stroke started", buf, 2u);
      }
    }
    goto LABEL_54;
  }
  id v40 = [*(id *)(a1 + 80) drawing];
  uint64_t v41 = [*(id *)(a1 + 88) drawing];
  if (v40 == v41)
  {
    uint64_t v50 = -[PKTiledView currentDrawingBeingCopiedToCanvas](*(id **)(a1 + 72));
    if (!v50)
    {

      goto LABEL_54;
    }
    uint64_t v51 = (void *)v50;
    uint64_t v52 = -[PKTiledView currentDrawingBeingCopiedToCanvas](*(id **)(a1 + 72));
    id v53 = [*(id *)(a1 + 88) drawing];
    BOOL v54 = v52 == v53;

    if (!v54) {
      goto LABEL_51;
    }
  }
  else
  {

LABEL_51:
    uint64_t v42 = objc_opt_class();
    uint64_t v43 = PKDynamicCast(v42, *(void **)(a1 + 88));
    id v40 = v43;
    if (v43) {
      [v43 setContentHidden:0];
    }
LABEL_54:
  }
  [MEMORY[0x1E4F39CF8] commit];
  if ((*(unsigned char *)(a1 + 104) != 0) | v56 & 1)
  {
    uint64_t v45 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      int v55 = *(unsigned __int8 *)(a1 + 104);
      *(_DWORD *)buf = 67109376;
      int v68 = v55;
      __int16 v69 = 1024;
      int v70 = v56 & 1;
      _os_log_debug_impl(&dword_1C44F8000, v45, OS_LOG_TYPE_DEBUG, "Updating tiles after copyFromCanvas: %d, %d", buf, 0xEu);
    }

    [*(id *)(a1 + 72) updateTilesForVisibleRect];
  }
  if ([*(id *)(a1 + 96) count])
  {
    uint64_t v46 = [*(id *)(a1 + 72) selectionController];
    int v47 = -[PKSelectionController hasStrokesOrElementsSelection](v46);

    if (v47)
    {
      uint64_t v48 = [*(id *)(a1 + 72) selectionController];
      uint64_t v49 = (void *)v48;
      if (v48) {
        -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:](v48, 1, 0);
      }
    }
  }
}

uint64_t __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_573(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didFinishHideCanvasTransaction];
}

void __65__PKTiledView__copyFromCanvas_intoAttachment_hideCanvas_strokes___block_invoke_574(uint64_t a1)
{
}

- (BOOL)_shouldUpdateHeightOfAttachments
{
  return 0;
}

- (BOOL)_shouldPreventScrollViewPanGestureWhilePreviewing
{
  return 0;
}

- (BOOL)_updateHeightOfAttachmentIfNecessary:(id)a3
{
  id v4 = a3;
  if ([(PKTiledView *)self _shouldUpdateHeightOfAttachments])
  {
    id v5 = [v4 drawing];
    uint64_t v6 = objc_opt_class();
    uint64_t v7 = PKDynamicCast(v6, v4);
    char v8 = [v5 _isEmpty];
    if (v7) {
      char v9 = v8;
    }
    else {
      char v9 = 1;
    }
    if (v9)
    {
LABEL_6:
      BOOL v10 = 0;
LABEL_10:

      goto LABEL_11;
    }
    unint64_t v11 = [v7 drawing];
    [v7 heightFromDrawing:v11 delta:10.0];
    double v13 = v12;

    [v7 bounds];
    if (v13 <= v14)
    {
      [v5 bounds];
      double rect = v16;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      [v5 _canvasBounds];
      CGFloat v27 = v26;
      CGFloat v28 = v23;
      BOOL v10 = 0;
      if (fabs(v26) == INFINITY) {
        goto LABEL_10;
      }
      if (fabs(v23) == INFINITY) {
        goto LABEL_10;
      }
      CGFloat v29 = v24;
      BOOL v10 = 0;
      if (fabs(v24) == INFINITY) {
        goto LABEL_10;
      }
      CGFloat v30 = v25;
      if (fabs(v25) == INFINITY) {
        goto LABEL_10;
      }
      BOOL v10 = 0;
      if (fabs(v18) == INFINITY) {
        goto LABEL_10;
      }
      if (fabs(v20) == INFINITY) {
        goto LABEL_10;
      }
      BOOL v10 = 0;
      if (fabs(v22) == INFINITY || fabs(rect) == INFINITY) {
        goto LABEL_10;
      }
      v35.origin.CGFloat x = v18;
      v35.origin.CGFloat y = v20;
      v35.size.CGFloat width = v22;
      v35.size.CGFloat height = rect;
      double MaxY = CGRectGetMaxY(v35);
      v36.origin.CGFloat x = v27;
      v36.origin.CGFloat y = v28;
      v36.size.CGFloat width = v29;
      v36.size.CGFloat height = v30;
      if (MaxY <= CGRectGetMaxY(v36)) {
        goto LABEL_6;
      }
      char v32 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v32, OS_LOG_TYPE_DEBUG, "Detected a drawing that will be clipped at the bottom", buf, 2u);
      }
    }
    [v7 updateDrawingHeight:v13];
    BOOL v10 = 1;
    goto LABEL_10;
  }
  BOOL v10 = 0;
LABEL_11:

  return v10;
}

- (void)_transientlyUpdateHeightOfAttachment:(id)a3 delta:(double)a4
{
  id v11 = a3;
  uint64_t v6 = [v11 drawing];
  if ([v6 _isEmpty])
  {
  }
  else
  {
    BOOL v7 = [(PKTiledView *)self _shouldUpdateHeightOfAttachments];

    if (v7)
    {
      char v8 = [v11 drawing];
      [v11 heightFromDrawing:v8 delta:a4 + 10.0];
      double v10 = v9;

      [v11 updateDrawingHeight:0 notifyDrawingDidChange:v10];
    }
  }
}

- (void)cancelTileGenerationInvalidateTiles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v5 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "cancel tile generation", buf, 2u);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  obuint64_t j = [(PKTiledView *)self attachmentViews];
  uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v34;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        double v9 = *(void **)(*((void *)&v33 + 1) + 8 * v8);
        long long v29 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        double v10 = [v9 tiles];
        id v11 = [v10 objectEnumerator];

        uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v30;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v11);
              }
              double v16 = *(atomic_ullong **)(*((void *)&v29 + 1) + 8 * v15);
              if (v16)
              {
                atomic_fetch_add(v16 + 2, 1uLL);
                if (v3) {
                  objc_setProperty_atomic_copy(v16, v12, 0, 136);
                }
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v39 count:16];
          }
          while (v13);
        }

        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        double v17 = [v9 offscreenTiles];
        double v18 = [v17 objectEnumerator];

        uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v26;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v26 != v20) {
                objc_enumerationMutation(v18);
              }
              uint64_t v22 = *(void *)(*((void *)&v25 + 1) + 8 * v21);
              if (v22) {
                atomic_fetch_add((atomic_ullong *volatile)(v22 + 16), 1uLL);
              }
              -[PKRendererTile purgeTileLayers](v22);
              ++v21;
            }
            while (v19 != v21);
            uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v38 count:16];
          }
          while (v19);
        }

        double v23 = [v9 offscreenTiles];
        [v23 removeAllObjects];

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v33 objects:v40 count:16];
    }
    while (v6);
  }
}

- (void)updateTilesForVisibleRectForceIfZooming:(BOOL)a3
{
  if (a3 || ![(PKTiledView *)self _isZoomingOrResizing])
  {
    [(PKTiledView *)self updateTilesForVisibleRectRendering:1 offscreen:0 overrideAdditionalStrokes:0];
  }
}

- (void)swapOffscreenCallback:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  double v12 = (void (**)(void))a3;
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(PKTiledView *)self _pauseHoverPreviewForTimeInterval:0.1];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obuint64_t j = [(PKTiledView *)self attachmentViews];
  uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v17;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v17 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void **)(*((void *)&v16 + 1) + 8 * v5);
        uint64_t v7 = os_log_create("com.apple.pencilkit", "Tiles");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          double v10 = [v6 offscreenTiles];
          uint64_t v11 = [v10 count];
          *(_DWORD *)buf = 134217984;
          uint64_t v25 = v11;
          _os_log_debug_impl(&dword_1C44F8000, v7, OS_LOG_TYPE_DEBUG, "swap offscreen tiles %ld", buf, 0xCu);
        }
        uint64_t v8 = [v6 offscreenTiles];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        _OWORD v15[2] = __37__PKTiledView_swapOffscreenCallback___block_invoke;
        v15[3] = &unk_1E64C5C70;
        v15[4] = v6;
        v15[5] = &v20;
        [v8 enumerateKeysAndObjectsUsingBlock:v15];

        double v9 = [v6 offscreenTiles];
        [v9 removeAllObjects];

        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [obj countByEnumeratingWithState:&v16 objects:v26 count:16];
    }
    while (v3);
  }

  if (v12) {
    v12[2]();
  }
  [MEMORY[0x1E4F39CF8] commit];
  if (*((unsigned char *)v21 + 24)) {
    [(PKTiledView *)self updateTilesForVisibleRectRendering:1 offscreen:0 overrideAdditionalStrokes:0];
  }
  _Block_object_dispose(&v20, 8);
}

void __37__PKTiledView_swapOffscreenCallback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (id *)v6;
  if (v6)
  {
    if (*((double *)v6 + 20) == 1.0)
    {
      *((unsigned char *)v6 + 84) = 0;
      [*((id *)v6 + 11) setHidden:0];
      [v7[12] setHidden:0];
      uint64_t v8 = [*(id *)(a1 + 32) tiles];
      double v9 = [v8 objectForKeyedSubscript:v5];

      if (v9) {
        -[PKRendererTile purgeTileLayers]((uint64_t)v9);
      }
      double v10 = [*(id *)(a1 + 32) tiles];
      [v10 setObject:v7 forKeyedSubscript:v5];

      uint64_t v11 = os_log_create("com.apple.pencilkit", "Tiles");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_debug_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_DEBUG, "show tile %@", (uint8_t *)&v12, 0xCu);
      }

      goto LABEL_11;
    }
    atomic_fetch_add((atomic_ullong *volatile)v6 + 2, 1uLL);
  }
  -[PKRendererTile purgeTileLayers]((uint64_t)v6);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  double v9 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v12 = 138412290;
    uint64_t v13 = v7;
    _os_log_debug_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_DEBUG, "purge %@", (uint8_t *)&v12, 0xCu);
  }
LABEL_11:
}

- (void)updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:(id)a3 withCallback:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  if ([(PKTiledView *)self _isZoomingOrResizing])
  {
    if (v6)
    {
      uint64_t v8 = os_log_create("com.apple.pencilkit", "Tiles");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_DEBUG, "zooming/resizing - requeuing tiles", buf, 2u);
      }

      dispatch_time_t v9 = dispatch_time(0, 50000000);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke_576;
      v13[3] = &unk_1E64C5820;
      v13[4] = self;
      id v14 = v6;
      uint64_t v15 = v7;
      dispatch_after(v9, MEMORY[0x1E4F14428], v13);
    }
    else
    {
      v7[2](v7);
    }
  }
  else
  {
    double v10 = os_log_create("com.apple.pencilkit", "Tiles");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v12 = [(PKTiledView *)self canvasView];
      *(_DWORD *)buf = 67109120;
      int v21 = [v12 isHidden];
      _os_log_debug_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEBUG, "updateTilesForVisibleRectRendering canvasVisible:%d", buf, 8u);
    }
    [(PKTiledView *)self updateTilesForVisibleRectRendering:1 offscreen:1 overrideAdditionalStrokes:v6];
    uint64_t v11 = [(PKTiledView *)self tileController];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke;
    v16[3] = &unk_1E64C5820;
    id v17 = v6;
    long long v18 = self;
    long long v19 = v7;
    -[PKTileController callbackAfterTileGeneration:]((uint64_t)v11, v16);
  }
}

uint64_t __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32)) {
    return [*(id *)(a1 + 40) swapOffscreenCallback:*(void *)(a1 + 48)];
  }
  uint64_t v2 = [*(id *)(a1 + 40) canvasView];
  int v3 = [v2 isHidden];

  if (v3)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = *(id *)(a1 + 32);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v15;
      while (2)
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = [*(id *)(a1 + 40) attachmentForUUID:*(void *)(*((void *)&v14 + 1) + 8 * v7)];
          dispatch_time_t v9 = [v8 offscreenTiles];
          BOOL v10 = [v9 count] == 0;

          if (v10)
          {

            goto LABEL_14;
          }
          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }

    return [*(id *)(a1 + 40) swapOffscreenCallback:*(void *)(a1 + 48)];
  }
LABEL_14:
  int v12 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_log_debug_impl(&dword_1C44F8000, v12, OS_LOG_TYPE_DEBUG, "offscreen cancelled - requeuing tiles", v13, 2u);
  }

  return [*(id *)(a1 + 40) updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:*(void *)(a1 + 32) withCallback:*(void *)(a1 + 48)];
}

uint64_t __88__PKTiledView_updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes_withCallback___block_invoke_576(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:*(void *)(a1 + 40) withCallback:*(void *)(a1 + 48)];
}

- (BOOL)tileIsVisibleForOffset:(CGPoint)a3 inAttachment:(id)a4 distanceToMiddle:(double *)a5
{
  double y = a3.y;
  double x = a3.x;
  id v9 = a4;
  BOOL v10 = [(PKTiledView *)self scrollView];
  [v10 bounds];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;

  if (self) {
    gestureView = self->_gestureView;
  }
  else {
    gestureView = 0;
  }
  double v20 = +[PKRendererTile layerFrameForLevel:(uint64_t)PKRendererTile offset:(uint64_t)gestureView];
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  uint64_t v27 = [v9 tileContainerView];
  uint64_t v28 = [v9 viewRep];
  objc_msgSend(v27, "convertRect:toView:", v28, v20, v22, v24, v26);
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;

  uint64_t v37 = [v9 tileContainerView];
  [v37 bounds];
  v60.origin.double x = v30;
  v60.origin.double y = v32;
  v60.size.CGFloat width = v34;
  v60.size.CGFloat height = v36;
  LOBYTE(v28) = CGRectIntersectsRect(v54, v60);

  if ((v28 & 1) == 0) {
    goto LABEL_8;
  }
  CGFloat v38 = [v9 viewRep];
  BOOL v39 = [(PKTiledView *)self scrollView];
  objc_msgSend(v38, "convertRect:toView:", v39, v30, v32, v34, v36);
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  CGFloat v45 = v44;
  CGFloat v47 = v46;

  v55.origin.double x = v12;
  v55.origin.double y = v14;
  v55.size.CGFloat width = v16;
  v55.size.CGFloat height = v18;
  v61.origin.double x = v41;
  v61.origin.double y = v43;
  v61.size.CGFloat width = v45;
  v61.size.CGFloat height = v47;
  if (CGRectIntersectsRect(v55, v61))
  {
    if (a5)
    {
      v56.origin.double x = v12;
      v56.origin.double y = v14;
      v56.size.CGFloat width = v16;
      v56.size.CGFloat height = v18;
      double MidX = CGRectGetMidX(v56);
      v57.origin.double x = v12;
      v57.origin.double y = v14;
      v57.size.CGFloat width = v16;
      v57.size.CGFloat height = v18;
      double MidY = CGRectGetMidY(v57);
      v58.origin.double x = v41;
      v58.origin.double y = v43;
      v58.size.CGFloat width = v45;
      v58.size.CGFloat height = v47;
      double v49 = CGRectGetMidX(v58);
      v59.origin.double x = v41;
      v59.origin.double y = v43;
      v59.size.CGFloat width = v45;
      v59.size.CGFloat height = v47;
      CGFloat v50 = CGRectGetMidY(v59);
      *a5 = (MidY - v50) * (MidY - v50) + (MidX - v49) * (MidX - v49);
    }
    BOOL v51 = 1;
  }
  else
  {
LABEL_8:
    BOOL v51 = 0;
  }

  return v51;
}

- (void)updateExistingTiles:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  [(PKTiledView *)self bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  obuint64_t j = [(PKTiledView *)self attachmentViews];
  uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v31)
  {
    uint64_t v30 = *(void *)v38;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v38 != v30) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v37 + 1) + 8 * v32);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        CGFloat v14 = [v13 tiles];
        double v15 = [v14 allValues];

        uint64_t v16 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v34;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v34 != v17) {
                objc_enumerationMutation(v15);
              }
              uint64_t v19 = *(PKRendererTileProperties **)(*((void *)&v33 + 1) + 8 * v18);
              if (!v3) {
                goto LABEL_15;
              }
              if (v19)
              {
                double a = v19[2]._drawingTransform.a;
                double b = v19[2]._drawingTransform.b;
                double c = v19[2]._drawingTransform.c;
                double d = v19[2]._drawingTransform.d;
              }
              else
              {
                double b = 0.0;
                double c = 0.0;
                double d = 0.0;
                double a = 0.0;
              }
              double v24 = [v13 tileContainerView];
              -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v24, a, b, c, d);
              v45.origin.double x = v6;
              v45.origin.double y = v8;
              v45.size.CGFloat width = v10;
              v45.size.CGFloat height = v12;
              BOOL v25 = CGRectIntersectsRect(v44, v45);

              if (v25)
              {
LABEL_15:
                double v26 = -[PKRendererTile properties](v19);
                [v26 offset];
                id v27 = -[PKTiledView generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:](self, "generateTile:inAttachment:rendering:offscreen:overrideAdditionalStrokes:", v13, 1, 0, 0);
              }
              ++v18;
            }
            while (v16 != v18);
            uint64_t v28 = [v15 countByEnumeratingWithState:&v33 objects:v41 count:16];
            uint64_t v16 = v28;
          }
          while (v28);
        }

        ++v32;
      }
      while (v32 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v31);
  }
}

- (void)blitOldTilesIntoNewTiles:(id)a3 completion:(id)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v76 = a4;
  BOOL v78 = objc_msgSend(MEMORY[0x1E4F28E10], "strongToStrongObjectsMapTable", v6);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  obuint64_t j = v6;
  uint64_t v7 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
  id v80 = self;
  if (v7)
  {
    uint64_t v8 = *(void *)v106;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v106 != v8) {
          objc_enumerationMutation(obj);
        }
        CGFloat v10 = *(void **)(*((void *)&v105 + 1) + 8 * i);
        uint64_t v11 = objc_opt_class();
        CGFloat v12 = PKDynamicCast(v11, v10);
        double v13 = v12;
        if (v12)
        {
          [v12 drawingTransform];
          if (sqrt(v104 * v104 + v103 * v103) > 0.0)
          {
            CGFloat v14 = [v13 tiles];
            double v15 = (void *)[v14 copy];
            [v78 setObject:v15 forKey:v10];

            uint64_t v16 = [v13 tiles];
            [v16 removeAllObjects];
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v105 objects:v112 count:16];
    }
    while (v7);
  }

  uint64_t v17 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  [(PKTiledView *)self _layerContentsScale];
  double v19 = v18;
  double v20 = [(PKTiledView *)self scrollView];
  [v20 zoomScale];
  double v22 = v21;

  double v23 = self;
  [(PKTiledView *)self getVisibleTiles:obj];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  double v24 = v101;
  id v77 = v102;
  if (v101 != v102)
  {
    double v25 = v19 * v22;
    do
    {
      if (*(void *)v24)
      {
        [*(id *)v24 drawingTransform];
        double v26 = *((double *)&v98 + 1);
        double v27 = *(double *)&v98;
        if (!v23) {
          goto LABEL_19;
        }
      }
      else
      {
        long long v99 = 0u;
        long long v100 = 0u;
        double v26 = 0.0;
        double v27 = 0.0;
        long long v98 = 0u;
        if (!v23)
        {
LABEL_19:
          uint64_t gestureView = 0;
          goto LABEL_16;
        }
      }
      uint64_t gestureView = (uint64_t)v23->_gestureView;
LABEL_16:
      double v29 = +[PKRendererTile layerFrameForLevel:(uint64_t)PKRendererTile offset:gestureView];
      CGFloat v31 = v30;
      CGFloat v33 = v32;
      CGFloat v35 = v34;
      if (*(void *)v24) {
        [*(id *)v24 drawingTransform];
      }
      else {
        memset(v97, 0, sizeof(v97));
      }
      +[PKRendererTile drawingFrameForLayerFrame:drawingTransform:contentScale:](v29, v31, v33, v35, v25 * sqrt(v26 * v26 + v27 * v27), (uint64_t)PKRendererTile, v97);
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      CGFloat v43 = v42;
      long long v95 = 0u;
      long long v96 = 0u;
      long long v93 = 0u;
      long long v94 = 0u;
      CGRect v44 = [v78 objectForKey:*(void *)v24];
      CGRect v45 = [v44 objectEnumerator];

      uint64_t v46 = 0;
      uint64_t v47 = [v45 countByEnumeratingWithState:&v93 objects:v111 count:16];
      if (v47)
      {
        uint64_t v48 = *(void *)v94;
        do
        {
          uint64_t v49 = 0;
          do
          {
            if (*(void *)v94 != v48) {
              objc_enumerationMutation(v45);
            }
            CGFloat v50 = *(void **)(*((void *)&v93 + 1) + 8 * v49);
            if (v50)
            {
              uint64_t v51 = v50[23];
              uint64_t v52 = v50[24];
              uint64_t v53 = v50[25];
              uint64_t v54 = v50[26];
            }
            else
            {
              uint64_t v52 = 0;
              uint64_t v53 = 0;
              uint64_t v54 = 0;
              uint64_t v51 = 0;
            }
            v114.origin.double x = v37;
            v114.origin.double y = v39;
            v114.size.CGFloat width = v41;
            v114.size.CGFloat height = v43;
            if (CGRectIntersectsRect(*(CGRect *)&v51, v114))
            {
              if (!v46)
              {
                double v55 = v24[1];
                double v56 = v24[2];
                id v57 = *(id *)v24;
                CGRect v58 = [(PKTiledView *)v80 scrollView];
                [v58 zoomScale];
                uint64_t v46 = -[PKTiledView tileForOffset:inAttachment:offscreen:tileZoomScale:](v80, "tileForOffset:inAttachment:offscreen:tileZoomScale:", v57, 0, v55, v56, v59);

                if (v46)
                {
                  *(unsigned char *)(v46 + 84) = 1;
                  [*(id *)(v46 + 88) setHidden:1];
                  [*(id *)(v46 + 96) setHidden:1];
                }
              }
              CGRect v60 = [v17 objectForKey:v46];
              if (!v60)
              {
                CGRect v60 = [MEMORY[0x1E4F1CA48] array];
                [v17 setObject:v60 forKey:v46];
              }
              [v60 addObject:v50];
            }
            ++v49;
          }
          while (v47 != v49);
          uint64_t v61 = [v45 countByEnumeratingWithState:&v93 objects:v111 count:16];
          uint64_t v47 = v61;
        }
        while (v61);
      }

      v24 += 4;
      double v23 = v80;
    }
    while (v24 != v77);
  }
  [MEMORY[0x1E4F39CF8] commit];
  long long v62 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  long long v91 = 0u;
  long long v92 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id v63 = obj;
  uint64_t v64 = [v63 countByEnumeratingWithState:&v89 objects:v110 count:16];
  if (v64)
  {
    uint64_t v65 = *(void *)v90;
    do
    {
      for (uint64_t j = 0; j != v64; ++j)
      {
        if (*(void *)v90 != v65) {
          objc_enumerationMutation(v63);
        }
        uint64_t v67 = *(void *)(*((void *)&v89 + 1) + 8 * j);
        int v68 = (void *)MEMORY[0x1E4F29238];
        if (v67) {
          [*(id *)(*((void *)&v89 + 1) + 8 * j) drawingTransform];
        }
        else {
          memset(v88, 0, sizeof(v88));
        }
        __int16 v69 = [v68 valueWithCGAffineTransform:v88];
        [v62 setObject:v69 forKey:v67];
      }
      uint64_t v64 = [v63 countByEnumeratingWithState:&v89 objects:v110 count:16];
    }
    while (v64);
  }

  uint64_t drawingTouchThatHitNothing = (uint64_t)v80->_drawingTouchThatHitNothing;
  v81[0] = MEMORY[0x1E4F143A8];
  v81[1] = 3221225472;
  v81[2] = __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke;
  v81[3] = &unk_1E64C5C98;
  id v71 = v63;
  id v82 = v71;
  id v72 = v62;
  id v83 = v72;
  id v73 = v17;
  id v84 = v73;
  id v74 = v78;
  id v85 = v74;
  id v75 = v76;
  uint64_t v86 = v80;
  id v87 = v75;
  -[PKTileController renderTilesIntoTiles:completion:](drawingTouchThatHitNothing, v73, v81);

  long long v109 = &v101;
  std::vector<AttachmentTileInfo>::__destroy_vector::operator()[abi:ne180100]((void ***)&v109);
}

void __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke_2;
  v3[3] = &unk_1E64C5C98;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  id v7 = *(id *)(a1 + 56);
  id v2 = *(id *)(a1 + 72);
  uint64_t v8 = *(void *)(a1 + 64);
  id v9 = v2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
}

uint64_t __51__PKTiledView_blitOldTilesIntoNewTiles_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v44 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = PKDynamicCast(v7, v6);
        if (v8)
        {
          id v9 = [*(id *)(a1 + 40) objectForKey:v6];
          CGFloat v10 = v9;
          if (v9)
          {
            [v9 CGAffineTransformValue];
          }
          else
          {
            long long v41 = 0u;
            long long v42 = 0u;
            long long v40 = 0u;
          }
          v39[0] = v40;
          v39[1] = v41;
          v39[2] = v42;
          [v8 setTileDrawingTransform:v39];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v3);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = [*(id *)(a1 + 48) keyEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v49 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v36 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v35 + 1) + 8 * j);
        -[PKRendererTile updateDisableTransactionActions:reloadContents:](v15, 1, 1);
        if (v15)
        {
          *(unsigned char *)(v15 + 84) = 0;
          [*(id *)(v15 + 88) setHidden:0];
          [*(id *)(v15 + 96) setHidden:0];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v49 count:16];
    }
    while (v12);
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v16 = [*(id *)(a1 + 56) objectEnumerator];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v48 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v32 != v18) {
          objc_enumerationMutation(v16);
        }
        double v20 = *(void **)(*((void *)&v31 + 1) + 8 * k);
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        double v21 = objc_msgSend(v20, "objectEnumerator", 0);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v47 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v28;
          do
          {
            for (uint64_t m = 0; m != v22; ++m)
            {
              if (*(void *)v28 != v23) {
                objc_enumerationMutation(v21);
              }
              -[PKRendererTile purgeTileLayers](*(void *)(*((void *)&v27 + 1) + 8 * m));
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v47 count:16];
          }
          while (v22);
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v48 count:16];
    }
    while (v17);
  }

  uint64_t v25 = *(void *)(a1 + 72);
  if (v25) {
    (*(void (**)(uint64_t, uint64_t))(v25 + 16))(v25, 1);
  }
  [MEMORY[0x1E4F39CF8] commit];
  return [*(id *)(a1 + 64) updateTilesForVisibleRect];
}

- (id)tileForOffset:(CGPoint)a3 inAttachment:(id)a4 offscreen:(BOOL)a5 tileZoomScale:(double)a6
{
  BOOL v7 = a5;
  double y = a3.y;
  double x = a3.x;
  id v11 = a4;
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = PKDynamicCast(v12, v11);
  if (v13) {
    objc_msgSend(v13, "setSixChannelBlending:", -[PKTiledView _sixChannelBlendingIsActive](self, "_sixChannelBlendingIsActive"));
  }
  [(PKTiledView *)self _layerContentsScale];
  double v15 = v14;
  if (v11)
  {
    [v11 drawingTransform];
    double v16 = *((double *)&v74 + 1);
    double v17 = *(double *)&v74;
  }
  else
  {
    long long v75 = 0u;
    long long v76 = 0u;
    long long v74 = 0u;
    double v16 = 0.0;
    double v17 = 0.0;
  }
  uint64_t v18 = [PKRendererTileProperties alloc];
  if (!self)
  {
    uint64_t gestureView = 0;
    if (v11) {
      goto LABEL_8;
    }
LABEL_10:
    memset(v73, 0, sizeof(v73));
    goto LABEL_11;
  }
  uint64_t gestureView = self->_gestureView;
  if (!v11) {
    goto LABEL_10;
  }
LABEL_8:
  [v11 drawingTransform];
LABEL_11:
  double v20 = -[PKRendererTileProperties initWithLevel:offset:drawingTransform:sixChannelMode:](v18, "initWithLevel:offset:drawingTransform:sixChannelMode:", gestureView, v73, [(PKTiledView *)self _sixChannelBlendingIsActive], x, y);
  double v21 = [v13 tiles];
  id v71 = [v21 objectForKeyedSubscript:v20];

  uint64_t v22 = [v13 offscreenTiles];
  uint64_t v23 = [v22 objectForKeyedSubscript:v20];

  double v24 = [v13 purgedTiles];
  uint64_t v25 = [v24 objectForKeyedSubscript:v20];

  double v26 = [v13 purgedTiles];
  [v26 removeObjectForKey:v20];
  double v27 = v15 * a6 * sqrt(v16 * v16 + v17 * v17);

  if (v25 && v25[19] != v27)
  {

    uint64_t v25 = 0;
  }
  if (!v23) {
    goto LABEL_17;
  }
  if (v23[19] != v27)
  {

LABEL_17:
    long long v28 = 0;
    goto LABEL_19;
  }
  long long v28 = v23;
LABEL_19:
  if (v71)
  {
    if (v71[19] == v27) {
      goto LABEL_23;
    }
  }
  id v71 = 0;
LABEL_23:
  if (v7)
  {
    if (!v28)
    {
      int v70 = v25;
      if (v71)
      {
        uint64_t v29 = [v71 copy];
        id v30 = (id)v29;
        if (v29)
        {
          *(unsigned char *)(v29 + 84) = 1;
          [*(id *)(v29 + 88) setHidden:1];
          [*((id *)v30 + 12) setHidden:1];
LABEL_38:
          long long v40 = [v13 offscreenTiles];
LABEL_46:
          __int16 v69 = v40;
          if (v30)
          {
            *((double *)v30 + 19) = v27;
            atomic_store(*(unint64_t *)&v27, (unint64_t *)v30 + 1);
            [*((id *)v30 + 11) setContentsScale:v27];
            [*((id *)v30 + 12) setContentsScale:v27];
          }
          [v40 setObject:v30 forKeyedSubscript:v20];
          if (v30 && *((unsigned char *)v30 + 82))
          {
            long long v42 = [v11 tileContainerView];
            long long v43 = [v42 layer];
            long long v44 = -[PKRendererTile tileMultiplyLayer]((double *)v30);
            [v43 addSublayer:v44];
          }
          long long v45 = [v11 tileContainerView];
          long long v46 = [v45 layer];
          uint64_t v47 = -[PKRendererTile tileLayer]((double *)v30);
          [v46 addSublayer:v47];

          if ([(PKTiledView *)self showDebugOutlines])
          {
            [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:dbl_1C4828FA0[((int)(x + y) & 1) == 0]];
            id v48 = objc_claimAutoreleasedReturnValue();
            uint64_t v49 = [v48 CGColor];
            CGFloat v50 = -[PKRendererTile tileLayer]((double *)v30);
            [v50 setBackgroundColor:v49];

            id v51 = objc_alloc_init(MEMORY[0x1E4F39CE8]);
            uint64_t v52 = [(PKTiledView *)self scrollView];
            [v52 zoomScale];
            double v54 = v53;
            double v55 = [(PKTiledView *)self scrollView];
            [v55 zoomScale];
            objc_msgSend(v51, "setFrame:", 0.0, 0.0, 100.0 / v54, 30.0 / v56);

            if (v30)
            {
              uint64_t v57 = *((void *)v30 + 16);
              uint64_t v58 = (int)*((double *)v30 + 21);
              uint64_t v59 = (int)*((double *)v30 + 22);
            }
            else
            {
              uint64_t v58 = 0;
              uint64_t v57 = 0;
              uint64_t v59 = 0;
            }
            CGRect v60 = [NSString stringWithFormat:@"%ld, (%d, %d)", v57, v58, v59, v40];
            [v51 setString:v60];

            id v61 = [MEMORY[0x1E4FB1618] blackColor];
            objc_msgSend(v51, "setForegroundColor:", objc_msgSend(v61, "CGColor"));

            long long v62 = [(PKTiledView *)self scrollView];
            [v62 zoomScale];
            [v51 setFontSize:14.0 / v63];

            uint64_t v64 = [(PKTiledView *)self scrollView];
            [v64 zoomScale];
            [v51 setContentsScale:v65 + v65];

            long long v66 = -[PKRendererTile tileLayer]((double *)v30);
            [v66 addSublayer:v51];
          }
          long long v32 = (double *)v30;

          long long v31 = v32;
          goto LABEL_56;
        }
      }
LABEL_32:
      long long v33 = v70;
      if (v70)
      {
        int v34 = -[PKRendererTile recreatePurgedTileLayersIfPossible]((uint64_t)v70);
        long long v33 = v70;
        if (v34)
        {
          long long v35 = v70;
          long long v36 = v35;
          double v37 = 1.0;
          if (v7) {
            double v37 = 0.0;
          }
          *((double *)v35 + 20) = v37;
          float v38 = v37;
          *(float *)&double v37 = v38;
          [v35[11] setOpacity:v37];
          *(float *)&double v39 = v38;
          [v36[12] setOpacity:v39];
          *((unsigned char *)v36 + 84) = v7;
          [v36[11] setHidden:v7];
          [v36[12] setHidden:v7];
          if (v7) {
            goto LABEL_37;
          }
          goto LABEL_45;
        }
      }
      int v70 = v33;
      int v68 = [PKRendererTile alloc];
      if (self)
      {
        long long v41 = self->_gestureView;
        if (v11)
        {
LABEL_41:
          [v11 drawingTransform];
          goto LABEL_44;
        }
      }
      else
      {
        long long v41 = 0;
        if (v11) {
          goto LABEL_41;
        }
      }
      memset(v72, 0, sizeof(v72));
LABEL_44:
      long long v36 = (id *)[(PKRendererTile *)v68 initWithLevel:v72 offset:[(PKTiledView *)self _sixChannelBlendingIsActive] drawingTransform:x contentsScale:y sixChannelMode:v27];
      if (v7)
      {
LABEL_37:
        id v30 = v36;
        goto LABEL_38;
      }
LABEL_45:
      long long v40 = [v13 tiles];
      id v30 = v36;
      goto LABEL_46;
    }
LABEL_29:
    long long v31 = v28;
    long long v32 = 0;
    goto LABEL_57;
  }
  if (v28) {
    goto LABEL_29;
  }
  int v70 = v25;
  if (!v71) {
    goto LABEL_32;
  }
  long long v31 = v71;
  long long v32 = 0;
LABEL_56:
  uint64_t v25 = v70;
LABEL_57:

  return v31;
}

- (id)generateTile:(CGPoint)a3 inAttachment:(id)a4 rendering:(BOOL)a5 offscreen:(BOOL)a6 overrideAdditionalStrokes:(id)a7
{
  BOOL v8 = a6;
  double y = a3.y;
  double x = a3.x;
  id v13 = a4;
  id v14 = a7;
  if (!self || *(double *)&self->_tileLevel == 0.0)
  {
    double v15 = 0;
    goto LABEL_30;
  }
  double v16 = [(PKTiledView *)self tileForOffset:v13 inAttachment:v8 offscreen:x tileZoomScale:y];
  double v15 = 0;
  if (v16 && a5)
  {
    double v17 = [v13 drawing];
    uint64_t v18 = [v17 strokes];

    uint64_t v19 = objc_opt_class();
    double v20 = PKDynamicCast(v19, v13);
    double v21 = v20;
    if (!v20)
    {
      uint64_t v23 = v16;
LABEL_28:

      double v15 = v16;
      goto LABEL_29;
    }
    id v51 = (PKDrawingUUID *)v18;
    uint64_t v52 = v20;
    if (v14)
    {
      id v22 = v14;
    }
    else
    {
      id v22 = [v20 additionalStrokes];
    }
    double v24 = v22;
    uint64_t v25 = [(PKDrawing *)self->_dirtyDrawing uuid];
    double v26 = [v13 drawing];
    double v27 = [v26 uuid];
    int v28 = [v25 isEqual:v27];
    if (v24) {
      int v29 = v28;
    }
    else {
      int v29 = 0;
    }

    if (v14
      || !v29
      || ![v24 isEqualToArray:self->_cachedVisibleStrokesWithAdditionalStrokesForDirtyDrawing])
    {
LABEL_24:
      -[PKRendererTile updateLastUsedTimestamp]((uint64_t)v16);
      if ([v52 wantsFullyRendered])
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke;
        aBlock[3] = &unk_1E64C53E0;
        id v64 = v52;
        double v65 = self;
        id v66 = v13;
        long long v36 = _Block_copy(aBlock);
      }
      else
      {
        long long v36 = 0;
      }
      CGFloat v50 = [(PKDrawing *)self->_dirtyDrawing uuid];
      double v37 = [(PKDrawing *)self->_dirtyDrawing version];
      id v48 = (void *)[v24 copy];
      ++v16[18];
      float v38 = [(PKTiledView *)self tileController];
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_2;
      v53[3] = &unk_1E64C5CE8;
      double v39 = v16;
      id v54 = v39;
      id v55 = v52;
      id v40 = v36;
      id v62 = v40;
      id v41 = v24;
      id v56 = v41;
      id v57 = v14;
      uint64_t v58 = self;
      id v42 = v48;
      id v59 = v42;
      id v43 = v50;
      id v60 = v43;
      id v44 = v37;
      id v61 = v44;
      -[PKTileController renderStrokes:additionalStrokes:intoTile:completionBlock:]((uint64_t)v38, v51, v41, v39, v53);

      long long v45 = v39;
      uint64_t v18 = v51;
      double v21 = v52;
      goto LABEL_28;
    }
    cachedDrawingVersionForAdditionalStrokes = self->_cachedDrawingVersionForAdditionalStrokes;
    long long v31 = [v13 drawing];
    uint64_t v47 = v24;
    long long v32 = [v31 uuid];
    if ([(PKDrawingVersion *)cachedDrawingVersionForAdditionalStrokes isEqual:v32])
    {
      didScrollBlocuint64_t k = self->_didScrollBlock;
      int v34 = [v13 drawing];
      long long v35 = [v34 version];
      if ([didScrollBlock isEqual:v35])
      {
        cachedDrawingUUIDForAdditionalStrokes = self->_cachedDrawingUUIDForAdditionalStrokes;

        if (!cachedDrawingUUIDForAdditionalStrokes)
        {
          double v24 = v47;
          goto LABEL_24;
        }
        long long v32 = v51;
        long long v31 = v47;
        id v51 = self->_cachedDrawingUUIDForAdditionalStrokes;
        double v24 = 0;
        goto LABEL_23;
      }
    }
    double v24 = v47;
LABEL_23:

    goto LABEL_24;
  }
LABEL_29:

LABEL_30:

  return v15;
}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "tiles", 0);
  uint64_t v3 = [v2 allValues];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (v7
          && *(uint64_t *)(v7 + 144) >= 1
          && (objc_msgSend(*(id *)(a1 + 40), "tileIsVisibleForOffset:inAttachment:distanceToMiddle:", *(void *)(a1 + 48), 0, *(double *)(v7 + 168), *(double *)(v7 + 176)) & 1) != 0)
        {

          return;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 32) fullyRendered];
}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_3;
  block[3] = &unk_1E64C5CC0;
  id v11 = *(id *)(a1 + 32);
  int v21 = a2;
  id v12 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 96);
  id v13 = *(id *)(a1 + 48);
  id v14 = v5;
  id v6 = *(id *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 64);
  long long v8 = *(void **)(a1 + 72);
  id v15 = v6;
  uint64_t v16 = v7;
  id v17 = v8;
  id v18 = *(id *)(a1 + 80);
  id v19 = *(id *)(a1 + 88);
  id v9 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

void __87__PKTiledView_generateTile_inAttachment_rendering_offscreen_overrideAdditionalStrokes___block_invoke_3(uint64_t a1, const char *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    --*(void *)(v3 + 144);
  }
  int v4 = *(_DWORD *)(a1 + 112);
  switch(v4)
  {
    case 1:
      uint64_t v5 = *(void *)(a1 + 32);
      if (!v5 || *(double *)(v5 + 160) < 1.0) {
LABEL_9:
      }
        -[PKRendererTile updateDisableTransactionActions:reloadContents:](v5, [*(id *)(a1 + 40) disableTileAnimations], *(_DWORD *)(a1 + 112) == 3);
      break;
    case 2:
      id v6 = *(void **)(a1 + 32);
      if (v6) {
        objc_setProperty_atomic_copy(v6, a2, 0, 136);
      }
      break;
    case 3:
      uint64_t v5 = *(void *)(a1 + 32);
      goto LABEL_9;
    default:
      break;
  }
  uint64_t v7 = *(void *)(a1 + 104);
  if (v7) {
    (*(void (**)(void))(v7 + 16))();
  }
  if (*(void *)(a1 + 48))
  {
    if (*(void *)(a1 + 56))
    {
      if (!*(void *)(a1 + 64))
      {
        long long v8 = *(void **)(a1 + 72);
        if (v8)
        {
          objc_setProperty_nonatomic_copy(v8, a2, *(id *)(a1 + 80), 752);
          long long v10 = *(void **)(a1 + 72);
          if (v10)
          {
            objc_setProperty_nonatomic_copy(v10, v9, *(id *)(a1 + 56), 760);
            id v12 = *(void **)(a1 + 72);
            if (v12)
            {
              objc_setProperty_nonatomic_copy(v12, v11, *(id *)(a1 + 88), 768);
              id v14 = *(void **)(a1 + 72);
              if (v14)
              {
                id v15 = *(void **)(a1 + 96);
                objc_setProperty_nonatomic_copy(v14, v13, v15, 776);
              }
            }
          }
        }
      }
    }
  }
}

- (id)_adornmentViewsToHitTest
{
  uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v4 = [(PKTiledView *)self selectionController];
  uint64_t v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 160);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  uint64_t v8 = [(PKTiledView *)self selectionController];
  id v9 = (void *)v8;
  if (v8) {
    long long v10 = *(void **)(v8 + 152);
  }
  else {
    long long v10 = 0;
  }
  id v11 = v10;

  id v12 = [(PKTiledView *)self rulerView];
  if (v11) {
    [v3 addObject:v11];
  }
  if (([v7 isHidden] & 1) == 0) {
    [v3 addObject:v7];
  }
  if (v12) {
    [v3 addObject:v12];
  }
  id v13 = (void *)[v3 copy];

  return v13;
}

- (void)_willBeginInteractiveResize
{
  if (self) {
    self->_disableTileRendering = 1;
  }
}

- (void)_didEndInteractiveResize
{
  if (self) {
    self->_disableTileRendering = 0;
  }
  [(PKTiledView *)self updateTilesForVisibleRect];
}

- (void)selectionDidChange
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = *(PKTileController **)&tileController[2]._contentZoomScale;
  }
  uint64_t v4 = tileController;
  uint64_t v5 = [(PKTileController *)v4 drawing];
  obuint64_t j = [v5 uuid];

  uint64_t v6 = *(void *)&self->_shouldResetBaseRollAngleOnNextStroke;
  if (!v6)
  {
LABEL_8:
    uint64_t v8 = obj;
    if (!obj) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
  if (!obj)
  {
LABEL_7:
    id v9 = [(PKTiledView *)self attachmentForUUID:v6];
    [v9 selectionDidChange];

    goto LABEL_8;
  }
  int v7 = [*(id *)&self->_shouldResetBaseRollAngleOnNextStroke isEqual:obj];
  uint64_t v8 = obj;
  if (v7)
  {
    uint64_t v6 = *(void *)&self->_shouldResetBaseRollAngleOnNextStroke;
    goto LABEL_7;
  }
LABEL_9:
  long long v10 = [(PKTiledView *)self attachmentForUUID:v8];
  [v10 selectionDidChange];

  uint64_t v8 = obj;
LABEL_10:
  objc_storeStrong((id *)&self->_shouldResetBaseRollAngleOnNextStroke, v8);
  id v11 = [(PKTiledView *)self canvasView];
  int v12 = [v11 _isCombiningStrokes];

  if (v12)
  {
    id v13 = [(PKTiledView *)self canvasView];
    [v13 _finishCombiningStrokesIfNecessary];
  }
  [(PKTiledView *)self _updateRemoteEffect];
}

- (void)setSelectedStrokeIds:(id)a3 selectionType:(int64_t)a4 forAttachment:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PKTiledView *)self _attachmentForUUID:a5];
  if (v9)
  {
    int64_t v21 = a4;
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v23 != v13) {
            objc_enumerationMutation(v11);
          }
          uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v16 = [v9 drawing];
          id v17 = [v16 _strokeForIdentifier:v15];

          if (v17) {
            [v10 addObject:v17];
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v12);
    }

    uint64_t v18 = [v10 count];
    tileController = self->_tileController;
    if (v18)
    {
      id v20 = [v9 drawing];
      -[PKSelectionController selectStrokes:forSelectionType:inDrawing:]((id *)&tileController->super.isa, v10, v21, v20);
    }
    else if (tileController)
    {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)self->_tileController, 1, 0);
    }
  }
}

- (id)selectedStrokeIdsForAttachment:(id)a3
{
  id v4 = a3;
  tileController = self->_tileController;
  if (tileController) {
    tileController = *(PKTileController **)&tileController[2]._contentZoomScale;
  }
  uint64_t v6 = tileController;
  int v7 = [(PKTileController *)v6 drawing];
  id v8 = [v7 uuid];
  char v9 = [v8 isEqual:v4];

  if (v9) {
    [(PKTileController *)v6 strokeIdentifiers];
  }
  else {
  id v10 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v10;
}

- (UIView)selectionView
{
  tileController = self->_tileController;
  if (tileController) {
    return (UIView *)tileController[2]._completionHandlers;
  }
  else {
    return 0;
  }
}

- (PKStrokeSelectionImage)selectionImage
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = *(PKTileController **)&tileController[2]._contentZoomScale;
  }
  uint64_t v3 = tileController;
  id v4 = [(PKTileController *)v3 strokeImage];

  return (PKStrokeSelectionImage *)v4;
}

- (void)transformingSelectionBegan
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = *(PKTileController **)&tileController[2]._contentZoomScale;
  }
  id v4 = tileController;
  uint64_t v5 = [(PKTileController *)v4 drawing];
  uint64_t v6 = [v5 uuid];
  int v7 = [(PKTiledView *)self _attachmentForUUID:v6];

  if (v7)
  {
    [(PKTiledView *)self getAttachment:v7 tileTransform:v17 strokeTransform:&v16 paperTransform:v15];
    CGAffineTransform v13 = v16;
    CGAffineTransformInvert(&v14, &v13);
    completionHandlers = self->_tileController;
    if (completionHandlers) {
      completionHandlers = (PKTileController *)completionHandlers[2]._completionHandlers;
    }
    char v9 = completionHandlers;
    CGAffineTransform v12 = v14;
    [(PKTileController *)v9 setSelectionDrawingStrokeTransform:&v12];
  }
  id v10 = self->_tileController;
  if (v10) {
    id v10 = (PKTileController *)v10[2]._completionHandlers;
  }
  id v11 = v10;
  [(PKTileController *)v11 transformBegan];
}

- (void)transformingSelectionChanged:(CGAffineTransform *)a3
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  uint64_t v5 = tileController;
  long long v6 = *(_OWORD *)&a3->c;
  v7[0] = *(_OWORD *)&a3->a;
  v7[1] = v6;
  v7[2] = *(_OWORD *)&a3->tx;
  [(PKTileController *)v5 transformChanged:v7];
}

- (void)transformingSelectionEnded
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  uint64_t v3 = tileController;
  [(PKTileController *)v3 transformEnded];
}

- (void)transformingSelectionCancelled
{
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  uint64_t v3 = tileController;
  [(PKTileController *)v3 transformCancelled];
}

- (void)setSelectionHidden:(BOOL)a3
{
  BOOL v3 = a3;
  tileController = self->_tileController;
  if (tileController) {
    tileController = (PKTileController *)tileController[2]._completionHandlers;
  }
  uint64_t v5 = tileController;
  [(PKTileController *)v5 setHidden:v3];
}

- (BOOL)hitSelectionAt:(CGPoint)a3
{
  tileController = self->_tileController;
  if (!tileController)
  {
    id v8 = 0;
    goto LABEL_5;
  }
  double y = a3.y;
  double x = a3.x;
  int v7 = tileController[2]._completionHandlers;
  id v8 = v7;
  if (!v7)
  {
LABEL_5:
    BOOL v10 = 0;
    goto LABEL_6;
  }
  -[NSMutableArray convertPoint:fromView:](v7, "convertPoint:fromView:", self, x, y);
  char v9 = -[NSMutableArray hitTest:withEvent:](v8, "hitTest:withEvent:", 0);
  BOOL v10 = v9 != 0;

LABEL_6:
  return v10;
}

- (BOOL)_hasSelection
{
  tileController = self->_tileController;
  return tileController && *(void *)&tileController[2]._contentZoomScale != 0;
}

- (void)_selectionRefreshWithChangeToDrawings:(id)a3 completion:(id)a4
{
}

- (void)_selectionRefreshWithChangeToDrawings:(id)a3 overrideAdditionalStrokes:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  id v17 = __90__PKTiledView__selectionRefreshWithChangeToDrawings_overrideAdditionalStrokes_completion___block_invoke;
  uint64_t v18 = &unk_1E64C57D0;
  id v11 = v8;
  id v19 = v11;
  id v20 = self;
  id v12 = v9;
  id v21 = v12;
  id v13 = v10;
  id v22 = v13;
  CGAffineTransform v14 = (void (**)(void))_Block_copy(&v15);
  if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", v15, v16, v17, v18)) {
    v14[2](v14);
  }
  else {
    dispatch_sync(MEMORY[0x1E4F14428], v14);
  }
}

uint64_t __90__PKTiledView__selectionRefreshWithChangeToDrawings_overrideAdditionalStrokes_completion___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v2);
        }
        long long v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        int v7 = *(void **)(a1 + 40);
        id v8 = objc_msgSend(v6, "uuid", (void)v11);
        id v9 = [v7 _attachmentForUUID:v8];

        if ([v9 isAtEndOfDocument]) {
          [*(id *)(a1 + 40) _updateAttachmentHeightIfNecessaryForDrawing:v6];
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }

  return [*(id *)(a1 + 40) updateTilesForVisibleRectOffscreenOverrideAdditionalStrokes:*(void *)(a1 + 48) withCallback:*(void *)(a1 + 56)];
}

- (void)_updateAttachmentHeightIfNecessaryForDrawing:(id)a3
{
  uint64_t v4 = [a3 uuid];
  id v5 = [(PKTiledView *)self _attachmentForUUID:v4];

  if (v5 && [(PKTiledView *)self _updateHeightOfAttachmentIfNecessary:v5]) {
    [(PKTiledView *)self _handleDrawingDidChangeForAttachment:v5];
  }
}

- (void)commitSelectionIfNecessaryWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(PKTiledView *)self selectionController];
  long long v6 = (void *)v5;
  if (v5)
  {
    if (*(void *)(v5 + 128))
    {

      goto LABEL_5;
    }
    int v7 = [*(id *)(v5 + 144) isCurrentlyAddingSpace];

    if (v7)
    {
LABEL_5:
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        id v8 = [(PKTiledView *)self selectionController];
        -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v8, v4);
      }
      else
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        _DWORD v9[2] = __56__PKTiledView_commitSelectionIfNecessaryWithCompletion___block_invoke;
        v9[3] = &unk_1E64C5E48;
        v9[4] = self;
        id v10 = v4;
        dispatch_sync(MEMORY[0x1E4F14428], v9);
      }
      goto LABEL_10;
    }
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_10:
}

void __56__PKTiledView_commitSelectionIfNecessaryWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) selectionController];
  -[PKSelectionController clearSelectionIfNecessaryWithCompletion:]((uint64_t)v2, *(void **)(a1 + 40));
}

- (CGPoint)pointInStrokeSpace:(CGPoint)a3 inDrawing:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  [(PKTiledView *)self transformFromViewToStrokeSpaceInDrawing:a4];
  float64x2_t v4 = vaddq_f64((float64x2_t)0, vmlaq_n_f64(vmulq_n_f64((float64x2_t)0, y), (float64x2_t)0, x));
  double v5 = v4.f64[1];
  result.double x = v4.f64[0];
  result.double y = v5;
  return result;
}

- (CGAffineTransform)transformFromViewToStrokeSpaceInDrawing:(SEL)a3
{
  [(PKTiledView *)self transformFromStrokeSpaceToViewInDrawing:a4];
  return CGAffineTransformInvert(retstr, &v6);
}

- (CGAffineTransform)transformFromViewToStrokeSpaceInAttachment:(SEL)a3
{
  [(PKTiledView *)self transformFromStrokeSpaceToViewInAttachment:a4];
  return CGAffineTransformInvert(retstr, &v6);
}

- (CGAffineTransform)transformFromStrokeSpaceToViewInDrawing:(SEL)a3
{
  CGAffineTransform v6 = [a4 uuid];
  int v7 = [(PKTiledView *)self _attachmentForUUID:v6];

  if (v7)
  {
    [(PKTiledView *)self transformFromStrokeSpaceToViewInAttachment:v7];
  }
  else
  {
    id v8 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long v12 = 0;
      _os_log_error_impl(&dword_1C44F8000, v8, OS_LOG_TYPE_ERROR, "Attachment view not found from drawing", v12, 2u);
    }

    uint64_t v9 = MEMORY[0x1E4F1DAB8];
    long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->double a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->double c = v10;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v9 + 32);
  }

  return result;
}

- (CGAffineTransform)transformFromStrokeSpaceToViewInAttachment:(SEL)a3
{
  id v9 = a4;
  CGAffineTransform v6 = [(PKTiledView *)self canvasView];
  int v7 = v6;
  if (v6)
  {
    [v6 _strokeTransformForAttachment:v9];
  }
  else
  {
    *(_OWORD *)&retstr->double c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->double a = 0u;
  }

  return result;
}

- (CGRect)attachmentBoundsForDrawing:(id)a3
{
  float64x2_t v4 = [a3 uuid];
  double v5 = [(PKTiledView *)self _attachmentForUUID:v4];

  CGAffineTransform v6 = [v5 viewRep];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)boundsForDrawing:(id)a3
{
  id v4 = a3;
  double v5 = [v4 uuid];
  CGAffineTransform v6 = [(PKTiledView *)self _attachmentForUUID:v5];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasView);
  double v8 = [v6 tileContainerView];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [v6 tileContainerView];
  objc_msgSend(WeakRetained, "convertRect:fromView:", v17, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;

  id v22 = [(PKTiledView *)self scrollView];
  [v22 contentOffset];
  double v24 = v23;
  double v26 = v25;

  [v4 bounds];
  double v28 = v27;
  double v30 = v29;

  double v31 = v19 - v24;
  double v32 = v21 - v26;
  double v33 = v28;
  double v34 = v30;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.double y = v32;
  result.origin.double x = v31;
  return result;
}

- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3
{
  id v4 = a3;
  [(PKTiledView *)self bounds];
  -[PKTiledView visibleOnscreenBoundsForDrawing:slack:](self, "visibleOnscreenBoundsForDrawing:slack:", v4, v5, v6);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  double v15 = v8;
  double v16 = v10;
  double v17 = v12;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (CGRect)visibleOnscreenBoundsForDrawing:(id)a3 slack:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  double v8 = [(PKTiledView *)self scrollView];
  [v8 bounds];
  CGRect v57 = CGRectInset(v56, -width, -height);
  CGFloat x = v57.origin.x;
  CGFloat y = v57.origin.y;
  CGFloat v11 = v57.size.width;
  CGFloat v12 = v57.size.height;

  double v13 = [v7 uuid];
  double v14 = [(PKTiledView *)self _attachmentForUUID:v13];

  double v15 = [(PKTiledView *)self scrollView];
  double v16 = [v14 viewRep];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  double v25 = [v14 viewRep];
  objc_msgSend(v15, "convertRect:fromView:", v25, v18, v20, v22, v24);
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGFloat v31 = v30;
  CGFloat v33 = v32;

  v58.origin.CGFloat x = x;
  v58.origin.CGFloat y = y;
  v58.size.double width = v11;
  v58.size.double height = v12;
  v64.origin.CGFloat x = v27;
  v64.origin.CGFloat y = v29;
  v64.size.double width = v31;
  v64.size.double height = v33;
  if (CGRectIntersectsRect(v58, v64))
  {
    v59.origin.CGFloat x = v27;
    v59.origin.CGFloat y = v29;
    v59.size.double width = v31;
    v59.size.double height = v33;
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = y;
    v65.size.double width = v11;
    v65.size.double height = v12;
    CGRect v60 = CGRectIntersection(v59, v65);
    double v34 = v60.origin.x;
    double v35 = v60.origin.y;
    double v36 = v60.size.width;
    double v37 = v60.size.height;
    float v38 = [(PKTiledView *)self scrollView];
    -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v38, v34, v35, v36, v37);
    CGFloat v40 = v39;
    CGFloat v42 = v41;
    CGFloat v44 = v43;
    CGFloat v46 = v45;

    memset(&v55[1], 0, sizeof(CGAffineTransform));
    [(PKTiledView *)self transformFromViewToStrokeSpaceInDrawing:v7];
    v55[0] = v55[1];
    v61.origin.CGFloat x = v40;
    v61.origin.CGFloat y = v42;
    v61.size.double width = v44;
    v61.size.double height = v46;
    CGRect v62 = CGRectApplyAffineTransform(v61, v55);
    CGFloat v47 = v62.origin.x;
    CGFloat v48 = v62.origin.y;
    CGFloat v49 = v62.size.width;
    CGFloat v50 = v62.size.height;
  }
  else
  {
    CGFloat v47 = *MEMORY[0x1E4F1DB20];
    CGFloat v48 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    CGFloat v49 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    CGFloat v50 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v51 = v47;
  double v52 = v48;
  double v53 = v49;
  double v54 = v50;
  result.size.double height = v54;
  result.size.double width = v53;
  result.origin.CGFloat y = v52;
  result.origin.CGFloat x = v51;
  return result;
}

- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3
{
  char v4 = 0;
  return -[PKTiledView _isValidDropPointForStrokes:didInsertNewAttachment:](self, "_isValidDropPointForStrokes:didInsertNewAttachment:", &v4, a3.x, a3.y);
}

- (BOOL)_isValidDropPointForStrokes:(CGPoint)a3 didInsertNewAttachment:(BOOL *)a4
{
  double y = a3.y;
  double x = a3.x;
  *a4 = 0;
  double v8 = -[PKTiledView hitAttachment:](self, "hitAttachment:");

  if (v8) {
    return 1;
  }
  double v10 = [(PKTiledView *)self scrollView];
  objc_msgSend(v10, "convertPoint:fromView:", self, x, y);
  BOOL v11 = -[PKTiledView insertAttachmentIfInBlankSpace:](self, "insertAttachmentIfInBlankSpace:");

  if (!v11) {
    return 0;
  }
  BOOL result = 1;
  *a4 = 1;
  return result;
}

- (CGAffineTransform)strokeTransform
{
  char v4 = [(PKTiledView *)self canvasView];
  id v6 = v4;
  if (v4)
  {
    [v4 strokeTransform];
  }
  else
  {
    *(_OWORD *)&retstr->double c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->double a = 0u;
  }

  return result;
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 completion:(id)a5
{
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5
{
}

- (void)_setAdditionalStrokes:(id)a3 inDrawing:(id)a4 invalidateTiles:(BOOL)a5 forceOffscreen:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  double v15 = _PKSignpostLog();
  os_signpost_id_t v16 = os_signpost_id_generate(v15);

  double v17 = _PKSignpostLog();
  double v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "Set Additional Strokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  double v19 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C44F8000, v19, OS_LOG_TYPE_INFO, "BEGIN \"Set Additional Strokes\"", buf, 2u);
  }

  double v20 = os_log_create("com.apple.pencilkit", "Tiles");
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = [v12 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v41 = v27;
    __int16 v42 = 1024;
    BOOL v43 = v8;
    _os_log_debug_impl(&dword_1C44F8000, v20, OS_LOG_TYPE_DEBUG, "setAdditionalStrokes %ld forceOffscreen:%d", buf, 0x12u);
  }

  if (v8)
  {
    [(PKTiledView *)self cancelTileGenerationInvalidateTiles:v9];
    id v39 = v13;
    double v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v39 count:1];
    double v22 = [v13 uuid];
    double v37 = v22;
    id v38 = v12;
    double v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke;
    v31[3] = &unk_1E64C5D10;
    v31[4] = self;
    id v32 = v13;
    id v33 = v12;
    os_signpost_id_t v35 = v16;
    id v34 = v14;
    [(PKTiledView *)self _selectionRefreshWithChangeToDrawings:v21 overrideAdditionalStrokes:v23 completion:v31];
  }
  else
  {
    objc_storeStrong((id *)&self->_dirtyDrawing, a4);
    double v24 = [v13 uuid];
    double v25 = [(PKTiledView *)self attachmentForUUID:v24];
    [v25 setAdditionalStrokes:v12];

    [(PKTiledView *)self cancelTileGenerationInvalidateTiles:v9];
    id v36 = v13;
    double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke_589;
    v28[3] = &unk_1E64C5DB0;
    os_signpost_id_t v30 = v16;
    id v29 = v14;
    [(PKTiledView *)self _selectionRefreshWithChangeToDrawings:v26 completion:v28];
  }
}

uint64_t __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);
  char v4 = [*(id *)(a1 + 40) uuid];
  double v5 = [v2 attachmentForUUID:v4];
  [v5 setAdditionalStrokes:v3];

  id v6 = _PKSignpostLog();
  id v7 = v6;
  os_signpost_id_t v8 = *(void *)(a1 + 64);
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v7, OS_SIGNPOST_INTERVAL_END, v8, "Set Additional Strokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  BOOL v9 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)BOOL v11 = 0;
    _os_log_impl(&dword_1C44F8000, v9, OS_LOG_TYPE_INFO, "END \"Set Additional Strokes\"", v11, 2u);
  }

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __89__PKTiledView__setAdditionalStrokes_inDrawing_invalidateTiles_forceOffscreen_completion___block_invoke_589(uint64_t a1)
{
  id v2 = _PKSignpostLog();
  uint64_t v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 40);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C44F8000, v3, OS_SIGNPOST_INTERVAL_END, v4, "Set Additional Strokes", (const char *)&unk_1C48540E6, buf, 2u);
  }

  double v5 = os_log_create("com.apple.pencilkit", "");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_INFO, "END \"Set Additional Strokes\"", v7, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_resetSelectedStrokeStateForRenderer
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dirtyDrawing = self->_dirtyDrawing;
  self->_dirtyDrawing = 0;

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  os_signpost_id_t v4 = [(PKTiledView *)self attachmentViews];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    char v6 = 0;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        double v10 = [v9 additionalStrokes];
        BOOL v11 = v10 == 0;

        if (!v11)
        {
          [v9 setAdditionalStrokes:0];
          char v6 = 1;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);

    if (v6)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __51__PKTiledView__resetSelectedStrokeStateForRenderer__block_invoke;
      block[3] = &unk_1E64C5368;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
  }
}

uint64_t __51__PKTiledView__resetSelectedStrokeStateForRenderer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateTilesForVisibleRect];
}

- (void)_clearSelectionIfNecessary
{
  if (-[PKSelectionController _hasStrokesOrExternalElementsSelectedInAttachment:]((uint64_t)self->_tileController, 0))
  {
    tileController = self->_tileController;
    if (tileController)
    {
      -[PKSelectionController clearSelectionIfNecessaryAnimated:withCompletion:]((uint64_t)tileController, 1, 0);
    }
  }
}

- (BOOL)insertSpaceEnabled
{
  id v2 = [(PKTiledView *)self selectionController];
  if (v2) {
    BOOL v3 = v2[114] != 0;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (BOOL)isGenerationModelAvailable
{
  id v2 = +[PKGenerationModelAvailabilityController sharedInstance];
  char v3 = [v2 isGenerationModelAvailable];

  return v3;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  os_signpost_id_t v8 = [(PKTiledView *)self selectionController];
  if (v8 && (uint64_t v9 = v8[16], v8, v9))
  {
    double v10 = [(PKTiledView *)self selectionController];
    BOOL v11 = -[PKSelectionController editMenuActionsForConfiguration:]((uint64_t)v10, v6);
    [v7 addObjectsFromArray:v11];
  }
  else
  {
    BOOL v12 = -[PKSelectionController _hasExternalElementsSelectedInAttachment:]((BOOL)self->_tileController, 0);
    long long v13 = (void *)MEMORY[0x1E4FB13F0];
    long long v14 = _PencilKitBundle();
    long long v15 = [v14 localizedStringForKey:@"Select All" value:@"Select All" table:@"Localizable"];
    long long v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"character.textbox"];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
    _OWORD v73[3] = &unk_1E64C5E20;
    void v73[4] = self;
    id v17 = v6;
    id v74 = v17;
    double v63 = [v13 actionWithTitle:v15 image:v16 identifier:0 handler:v73];

    uint64_t v18 = (void *)MEMORY[0x1E4FB13F0];
    double v19 = _PencilKitBundle();
    double v20 = [v19 localizedStringForKey:@"Paste" value:@"Paste" table:@"Localizable"];
    double v21 = [MEMORY[0x1E4FB1818] systemImageNamed:@"doc.on.clipboard"];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2;
    v71[3] = &unk_1E64C5E20;
    v71[4] = self;
    id v22 = v17;
    id v72 = v22;
    CGRect v62 = [v18 actionWithTitle:v20 image:v21 identifier:0 handler:v71];

    double v23 = (void *)MEMORY[0x1E4FB13F0];
    double v24 = _PencilKitBundle();
    if (v12) {
      [v24 localizedStringForKey:@"Insert Space Above" value:@"Insert Space Above" table:@"Localizable"];
    }
    else {
    double v25 = [v24 localizedStringForKey:@"Insert Space" value:@"Insert Space" table:@"Localizable"];
    }
    double v26 = [MEMORY[0x1E4FB1818] systemImageNamed:@"rectangle.expand.vertical"];
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3;
    v69[3] = &unk_1E64C5E20;
    v69[4] = self;
    id v27 = v22;
    id v70 = v27;
    CGRect v61 = [v23 actionWithTitle:v25 image:v26 identifier:0 handler:v69];

    double v28 = [(PKTiledView *)self selectionController];
    [v27 sourcePoint];
    CGRect v64 = -[PKSelectionController _drawingForSelectionRect:]((uint64_t)v28, v29 + -60.0, v30 + -60.0, 120.0, 120.0);

    CGFloat v31 = [v64 strokes];
    uint64_t v32 = [v31 count];

    id v33 = [(PKTiledView *)self selectionController];
    LODWORD(v26) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v33, (uint64_t)sel_selectAll_, self, 0);

    if (((v32 != 0) | v26) == 1) {
      [v7 addObject:v63];
    }
    id v34 = [(PKTiledView *)self selectionController];
    int v35 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v34, (uint64_t)sel_paste_, self, 0);

    id v36 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v75[0] = @"com.apple.drawing";
    double v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
    int v38 = [v36 containsPasteboardTypes:v37];

    if ((!v12 & (v38 | v35)) == 1) {
      [v7 addObject:v62];
    }
    id v39 = [(PKTiledView *)self selectionController];
    int v40 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v39, (uint64_t)sel_insertSpace_, self, 0);

    if (((v32 != 0) | v40) == 1)
    {
      uint64_t v41 = [(PKTiledView *)self selectionController];
      if (v41)
      {
        BOOL v42 = v41[114] == 0;

        if (!v42) {
          [v7 addObject:v61];
        }
      }
    }
    BOOL v43 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v44 = [v43 BOOLForKey:@"internalSettings.drawing.enableCopyAllHandwritingTranscription"];

    if (v44)
    {
      double v45 = (void *)MEMORY[0x1E4FB13F0];
      CGFloat v46 = _PencilKitBundle();
      CGFloat v47 = [v46 localizedStringForKey:@"Copy All Transcription" value:@"Copy All Transcription" table:@"Localizable"];
      CGFloat v48 = [MEMORY[0x1E4FB1818] systemImageNamed:@"character.textbox"];
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4;
      v67[3] = &unk_1E64C5E20;
      v67[4] = self;
      id v68 = v27;
      CGFloat v49 = [v45 actionWithTitle:v47 image:v48 identifier:0 handler:v67];

      CGFloat v50 = [(PKTiledView *)self selectionController];
      LODWORD(v48) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v50, (uint64_t)sel__getAllHandwritingTranscription_, self, 0);

      if (((v32 != 0) | v48) == 1) {
        [v7 addObject:v49];
      }
    }
    double v51 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v52 = [v51 BOOLForKey:@"internalSettings.drawing.enableCopyAll"];

    if (v52)
    {
      double v53 = (void *)MEMORY[0x1E4FB13F0];
      double v54 = _PencilKitBundle();
      id v55 = [v54 localizedStringForKey:@"Copy All" value:@"Copy All" table:@"Localizable"];
      CGRect v56 = [MEMORY[0x1E4FB1818] systemImageNamed:@"character.textbox"];
      v65[0] = MEMORY[0x1E4F143A8];
      v65[1] = 3221225472;
      v65[2] = __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_5;
      v65[3] = &unk_1E64C5E20;
      v65[4] = self;
      id v66 = v27;
      CGRect v57 = [v53 actionWithTitle:v55 image:v56 identifier:0 handler:v65];

      CGRect v58 = [(PKTiledView *)self selectionController];
      LODWORD(v56) = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v58, (uint64_t)sel__copyAll_, self, 0);

      if (((v32 != 0) | v56) == 1) {
        [v7 addObject:v57];
      }
    }
  }
  CGRect v59 = [MEMORY[0x1E4FB1970] menuWithChildren:v7];

  return v59;
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectAll:*(void *)(a1 + 40)];
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) paste:*(void *)(a1 + 40)];
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) insertSpace:*(void *)(a1 + 40)];
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _getAllHandwritingTranscription:*(void *)(a1 + 40)];
}

uint64_t __73__PKTiledView_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _copyAll:*(void *)(a1 + 40)];
}

- (CGRect)editMenuInteraction:(id)a3 targetRectForConfiguration:(id)a4
{
  id v5 = a4;
  id v6 = [(PKTiledView *)self selectionController];
  if (v6 && (uint64_t v7 = v6[16], v6, v7))
  {
    os_signpost_id_t v8 = [(PKTiledView *)self selectionController];
    double v9 = -[PKSelectionController editMenuTargetRect]((uint64_t)v8);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;

    uint64_t v16 = [(PKTiledView *)self selectionController];
    id v17 = (void *)v16;
    if (v16) {
      uint64_t v18 = *(void **)(v16 + 152);
    }
    else {
      uint64_t v18 = 0;
    }
    id v19 = v18;
    -[PKTiledView convertRect:fromView:](self, "convertRect:fromView:", v19, v9, v11, v13, v15);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
  }
  else
  {
    [v5 sourcePoint];
    double v21 = v28;
    [v5 sourcePoint];
    double v23 = v29;
    double v25 = 5.0;
    double v27 = 5.0;
  }

  double v30 = v21;
  double v31 = v23;
  double v32 = v25;
  double v33 = v27;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)editMenuInteraction:(id)a3 willPresentMenuForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PKTiledView_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E64C5368;
  void v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __76__PKTiledView_editMenuInteraction_willPresentMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditMenuVisible:1];
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__PKTiledView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke;
  v5[3] = &unk_1E64C5368;
  void v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

uint64_t __76__PKTiledView_editMenuInteraction_willDismissMenuForConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setEditMenuVisible:0];
}

- (PKController)drawingController
{
  id v2 = [(PKTiledView *)self canvasView];
  char v3 = [v2 _drawingController];

  return (PKController *)v3;
}

- (void)_createHoverControllerIfNecessary
{
  if (!*(void *)&self->_lastContentOffset.x && !self->_editMenuVisible)
  {
    char v3 = -[PKHoverController initWithDelegate:view:]((int64x2_t *)[PKHoverController alloc], self, self);
    CGFloat x = self->_lastContentOffset.x;
    *(void *)&self->_lastContentOffset.CGFloat x = v3;

    id v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    uint64_t v6 = [v5 maximumFramesPerSecond];

    if (v6 >= 101) {
      -[PKHoverController setShouldGenerate120HzEvents:](*(void *)&self->_lastContentOffset.x, 1);
    }
    CGFloat v7 = self->_lastContentOffset.x;
    if (v7 != 0.0) {
      *(void *)(*(void *)&v7 + 448) = 0x3FB999999999999ALL;
    }
  }
}

- (id)hoverGestureRecognizer
{
  [(PKTiledView *)self _createHoverControllerIfNecessary];
  char v3 = [(PKTiledView *)self hoverController];
  os_signpost_id_t v4 = -[PKHoverController hoverGestureRecognizer](v3);

  return v4;
}

- (BOOL)rulerHostWantsSharedRuler
{
  uint64_t v3 = [(PKTiledView *)self rulerHostingDelegate];
  if (!v3) {
    return 0;
  }
  os_signpost_id_t v4 = (void *)v3;
  id v5 = [(PKTiledView *)self rulerHostingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  CGFloat v7 = [(PKTiledView *)self rulerHostingDelegate];
  char v8 = [v7 rulerHostWantsSharedRuler];

  return v8;
}

- (id)rulerView
{
  hoverController = self->_hoverController;
  if (hoverController) {
    return *(id *)&hoverController->_waitingForHoverHoldTimestamp;
  }
  else {
    return 0;
  }
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return [(PKTileController *)self->_tileController dropInteraction:a3 canHandleSession:a4];
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  os_signpost_id_t v4 = [(PKTileController *)self->_tileController dropInteraction:a3 sessionDidUpdate:a4];

  return v4;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return [(PKTileController *)self->_tileController _dropInteraction:a3 dataOwnerForSession:a4];
}

- (void)replaceInkTexture:(id)a3 image:(CGImage *)a4
{
  id v8 = a3;
  char v6 = [(PKTiledView *)self canvasView];
  CGFloat v7 = [v6 _rendererController];
  -[PKMetalRendererController replaceInkTexture:image:]((uint64_t)v7, v8, (uint64_t)a4);
}

- (double)_latestLatency
{
  id v2 = [(PKTiledView *)self canvasView];
  uint64_t v3 = [v2 _rendererController];
  double v4 = -[PKMetalRendererController _latestLatency]((uint64_t)v3);

  return v4;
}

- (id)viewForAttachmentAtBlankSpace
{
  return 0;
}

- (id)viewToMakeFirstResponderWhenHoveringOverAttachment:(id)a3
{
  return 0;
}

- (void)_pauseHoverPreviewForTimeInterval:(double)a3
{
  self->_hoverPreviewStartTimestamp = a3;
}

- (BOOL)toolShadowShouldBeActive
{
  if (!self->_selectionHidden || !*(void *)&self->_lastContentOffset.x) {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v3 = [v2 bundleIdentifier];
  char v4 = [v3 isEqualToString:@"com.apple.mobilenotes"];

  if ((v4 & 1) != 0
    || (+[PKHoverSettings sharedSettings],
        id v2 = objc_claimAutoreleasedReturnValue(),
        [v2 toolShadowActiveOutsideNotes]))
  {
    id v5 = +[PKHoverSettings sharedSettings];
    if ([v5 toolShadowActive])
    {

      char v6 = 1;
      if (v4) {
        return v6;
      }
    }
    else
    {
      CGFloat v7 = +[PKHoverSettings sharedSettings];
      char v6 = [v7 toolShadowActiveOnOldPencils];

      if (v4) {
        return v6;
      }
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)paletteViewHoverView:(id)a3
{
  char v4 = [(PKTiledView *)self window];
  id v5 = [v4 windowScene];
  char v6 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v5);

  if (v6)
  {
    uint64_t v7 = v6[8];
    if (v7)
    {
      if (*(unsigned char *)(v7 + 56))
      {
        id v8 = [v6 view];
LABEL_12:
        id v17 = v8;
        goto LABEL_13;
      }
    }
  }
  CGFloat x = self->_lastContentOffset.x;
  if (x == 0.0)
  {
    double v13 = 0.0;
  }
  else
  {
    if (*(unsigned char *)(*(void *)&x + 56))
    {
LABEL_11:
      id v8 = self;
      goto LABEL_12;
    }
    uint64_t v11 = *(void *)(*(void *)&x + 32);
    uint64_t v10 = *(void *)(*(void *)&x + 40);
    double v12 = (double *)(*(void *)&x + 160);
    if (v10 != v11) {
      double v12 = (double *)(v11 + 64);
    }
    double v13 = *v12;
  }
  double v14 = [MEMORY[0x1E4F28F80] processInfo];
  [v14 systemUptime];
  double v16 = v15;

  if (v16 - v13 < 0.1) {
    goto LABEL_11;
  }
  id v17 = 0;
LABEL_13:

  return v17;
}

- (CGPoint)paletteViewHoverLocation:(id)a3
{
  char v4 = [(PKTiledView *)self window];
  id v5 = [v4 windowScene];
  +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v5);
  char v6 = (double *)objc_claimAutoreleasedReturnValue();

  if (v6 && (uint64_t v7 = *((void *)v6 + 8)) != 0 && *(unsigned char *)(v7 + 56))
  {
    id v8 = v6 + 15;
    double v9 = v6 + 16;
  }
  else
  {
    CGFloat x = self->_lastContentOffset.x;
    if (x == 0.0)
    {
      double v11 = 0.0;
      double v12 = 0.0;
      goto LABEL_10;
    }
    id v8 = *(double **)(*(void *)&x + 32);
    if (*(double **)(*(void *)&x + 40) == v8)
    {
      id v8 = (double *)(*(void *)&x + 96);
      double v9 = (double *)(*(void *)&x + 104);
    }
    else
    {
      double v9 = v8 + 1;
    }
  }
  double v11 = *v8;
  double v12 = *v9;
LABEL_10:

  double v13 = v11;
  double v14 = v12;
  result.double y = v14;
  result.CGFloat x = v13;
  return result;
}

- (void)paletteViewPencilDidTap:(id)a3
{
  id v3 = [(PKTiledView *)self canvasView];
  [v3 _finishCombiningStrokesIfNecessary];
}

- ($F30B99E357B462A7BBD676CBC61D9025)convertInputPoint:(SEL)a3 toAttachment:(id *)a4
{
  float64x2_t v13 = 0u;
  float64x2_t v14 = 0u;
  float64x2_t v12 = 0u;
  CGPoint result = [(PKTiledView *)self transformFromViewToStrokeSpaceInAttachment:a5];
  a4->var0 = ($047367E7237D93BB26E796C35D3A0ACE)vaddq_f64(v14, vmlaq_n_f64(vmulq_n_f64(v13, a4->var0.var0.y), v12, a4->var0.var0.x));
  a4->var9 = -1;
  a4->var1 = 1.0;
  long long v8 = *(_OWORD *)&a4->var13;
  *(_OWORD *)&retstr->var11 = *(_OWORD *)&a4->var11;
  *(_OWORD *)&retstr->var13 = v8;
  long long v9 = *(_OWORD *)&a4->var5;
  *(_OWORD *)&retstr->var3 = *(_OWORD *)&a4->var3;
  *(_OWORD *)&retstr->var5 = v9;
  long long v10 = *(_OWORD *)&a4->var9;
  *(_OWORD *)&retstr->var7 = *(_OWORD *)&a4->var7;
  *(_OWORD *)&retstr->var9 = v10;
  long long v11 = *(_OWORD *)&a4->var1;
  retstr->var0 = a4->var0;
  *(_OWORD *)&retstr->var1 = v11;
  return result;
}

- (id)attachmentForHoverPreviewAt:(id *)a3
{
  id v5 = [(PKTiledView *)self ink];
  int v6 = [v5 _isHandwritingInk];

  uint64_t v7 = -[PKTiledView hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "hitAttachment:includeStandinAttachment:expandBottomAttachment:", v6 ^ 1u, v6 ^ 1u, a3->var0.var0.x, a3->var0.var0.y);
  long long v8 = +[PKDrawing drawingClassForPaper];
  if (v7) {
    char v9 = v6 ^ 1;
  }
  else {
    char v9 = 1;
  }
  if ((v9 & 1) == 0)
  {
    if (!v8
      || ([v7 drawing],
          long long v10 = objc_claimAutoreleasedReturnValue(),
          char isKindOfClass = objc_opt_isKindOfClass(),
          v10,
          (isKindOfClass & 1) == 0))
    {

      uint64_t v7 = 0;
    }
  }

  return v7;
}

- (BOOL)hoverController:(id)a3 shouldBeActiveAt:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  if (![(PKTiledView *)self rulerEnabled]) {
    goto LABEL_8;
  }
  uint64_t v7 = [(PKTiledView *)self rulerController];
  long long v8 = (void *)v7;
  char v9 = v7 ? *(void **)(v7 + 56) : 0;
  id v10 = v9;
  objc_msgSend(v10, "convertPoint:fromView:", self, x, y);
  double v12 = v11;
  double v14 = v13;

  uint64_t v15 = [(PKTiledView *)self rulerController];
  double v16 = (void *)v15;
  id v17 = v15 ? *(void **)(v15 + 56) : 0;
  id v18 = v17;
  id v19 = objc_msgSend(v18, "hitTest:withEvent:", 0, v12, v14);

  if (v19) {
    return 0;
  }
LABEL_8:
  if ((*(unsigned char *)&self->_tiledViewFlags & 0x40) == 0) {
    return 1;
  }
  double v21 = [(PKTiledView *)self delegate];
  char v20 = objc_msgSend(v21, "canvasView:hoverShouldBeActiveAt:", self, x, y);

  return v20;
}

- (void)hoverController:(id)a3 intentionalHoverWithDuration:(double)a4
{
  if (self && BYTE1(self->_refineAnimationController))
  {
    [(PKTiledView *)self _beginAnalyticsSessionIfNecessary];
    id WeakRetained = (double *)objc_loadWeakRetained((id *)&self->_analyticsSession);
    if (WeakRetained) {
      WeakRetained[12] = WeakRetained[12] + a4;
    }
  }
}

- (void)hoverController:(id)a3 didBegin:(id *)a4
{
  [(PKTiledView *)self _beginAnalyticsSessionIfNecessary];
  int v6 = [(PKTiledView *)self window];
  uint64_t v7 = +[PKToolPicker existingPaletteViewForWindow:v6];

  if (v7) {
    [v7 setHoverDelegate:self];
  }
  double v8 = CACurrentMediaTime();
  char v9 = [(PKTiledView *)self canvasView];
  int v10 = [v9 isHidden];
  if (self)
  {
    double v11 = 0.1;
    if (!v10) {
      double v11 = 0.0;
    }
    self->_extraHoverPreviewDeladouble y = v8 + v11 + self->_hoverPreviewStartTimestamp;

    self->_hoverPreviewStartTimestamp = 0.0;
  }
  else
  {
  }
  double v12 = [(PKTiledView *)self canvasView];
  if ([v12 isHidden])
  {
    double v13 = [(PKTiledView *)self canvasView];
    [v13 latestRenderTimestamp];
    double v15 = v14;
    double v16 = +[PKHoverSettings sharedSettings];
    [v16 inactivityTimeInterval];
    double v18 = v15 + v17;

    if (v8 <= v18) {
      goto LABEL_12;
    }
    double v12 = +[PKHoverSettings sharedSettings];
    [v12 extraHoverPreviewDelay];
    if (self) {
      self->_extraHoverPreviewDeladouble y = v19 + self->_extraHoverPreviewDelay;
    }
  }

LABEL_12:
  if ([(PKTiledView *)self shouldStartToolPreviewWhenHovering])
  {
    long long v20 = *(_OWORD *)&a4->var9;
    void v30[4] = *(_OWORD *)&a4->var7;
    v30[5] = v20;
    long long v21 = *(_OWORD *)&a4->var13;
    v30[6] = *(_OWORD *)&a4->var11;
    v30[7] = v21;
    long long v22 = *(_OWORD *)&a4->var1;
    v30[0] = a4->var0;
    v30[1] = v22;
    long long v23 = *(_OWORD *)&a4->var5;
    v30[2] = *(_OWORD *)&a4->var3;
    v30[3] = v23;
    double v24 = [(PKTiledView *)self attachmentForHoverPreviewAt:v30];
    [(PKTiledView *)self _finishCombiningStrokesIfNecessaryForAttachment:v24];
    if (v24)
    {
      double v25 = [(PKTiledView *)self standInAttachmentView];

      if (v24 != v25)
      {
        double v26 = [(PKTiledView *)self viewToMakeFirstResponderWhenHoveringOverAttachment:v24];
        if (v26)
        {
          double v27 = [(PKTiledView *)self _activeToolPicker];
          if ([v27 isVisible])
          {
            v28[0] = MEMORY[0x1E4F143A8];
            v28[1] = 3221225472;
            v28[2] = __40__PKTiledView_hoverController_didBegin___block_invoke;
            v28[3] = &unk_1E64C5368;
            id v29 = v26;
            [v27 _performWithVisibilityUpdatesEnabled:0 block:v28];
          }
          else
          {
            [v26 becomeFirstResponder];
          }
          if (self) {
            self->_extraHoverPreviewDeladouble y = self->_extraHoverPreviewDelay + 0.1;
          }
        }
      }
    }
  }
}

uint64_t __40__PKTiledView_hoverController_didBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

- (void)_keepPencilShadowVisible
{
  if ([(PKTiledView *)self toolShadowShouldBeActive])
  {
    [(PKTiledView *)self _setupPencilShadowViewIfNecessary];
    id v8 = [(PKTiledView *)self window];
    id v3 = [v8 windowScene];
    char v4 = +[PKPencilShadowView shadowViewForScene:v3];
    id v5 = [(PKTiledView *)self ink];
    [v4 setInk:v5];

    id v9 = [(PKTiledView *)self window];
    int v6 = [v9 windowScene];
    uint64_t v7 = +[PKPencilShadowView shadowViewForScene:v6];
    [v7 keepVisibleInTiledView:self];
  }
}

- (void)_updatePencilShadowView:(id *)a3
{
  if ([(PKTiledView *)self toolShadowShouldBeActive])
  {
    [(PKTiledView *)self _keepPencilShadowVisible];
    id v5 = +[PKHoverSettings sharedSettings];
    if ([v5 toolShadowLocationWorkaround])
    {
    }
    else
    {
      int v6 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v7 = [v6 bundleIdentifier];
      char v8 = [v7 isEqualToString:@"com.apple.freeform"];

      if ((v8 & 1) == 0) {
        return;
      }
    }
    id v9 = [(PKTiledView *)self window];
    int v10 = [v9 windowScene];
    double v11 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v10);
    double v12 = [v11 view];

    -[UIView PK_convertPoint:toCoordinateSpace:](self, "PK_convertPoint:toCoordinateSpace:", v12, a3->var0.var0.x, a3->var0.var0.y);
    double v14 = v13;
    double v16 = v15;
    long long v17 = *(_OWORD *)&a3->var11;
    long long v35 = *(_OWORD *)&a3->var9;
    long long v36 = v17;
    long long v37 = *(_OWORD *)&a3->var13;
    long long v18 = *(_OWORD *)&a3->var3;
    long long v31 = *(_OWORD *)&a3->var1;
    long long v32 = v18;
    long long v19 = *(_OWORD *)&a3->var7;
    long long v33 = *(_OWORD *)&a3->var5;
    long long v34 = v19;
    long long v20 = [(PKTiledView *)self window];
    long long v21 = [v20 windowScene];
    long long v22 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v21);
    v23[0] = v14;
    v23[1] = v16;
    long long v28 = v35;
    long long v29 = v36;
    long long v30 = v37;
    long long v24 = v31;
    long long v25 = v32;
    long long v26 = v33;
    long long v27 = v34;
    -[PKPencilObserverInteraction _updatePencilShadowView:]((uint64_t)v22, v23);
  }
}

- (void)hoverController:(id)a3 didUpdate:(id *)a4
{
  if (![(PKTiledView *)self _scrollViewIsScrollingOrZoomingOrResizing])
  {
    if (!self
      || !BYTE1(self->_refineAnimationController)
      || ([(PKTiledView *)self canvasView],
          int v6 = objc_claimAutoreleasedReturnValue(),
          int v7 = [v6 _hasStrokeTransformChanged],
          v6,
          !v7))
    {
      long long v10 = *(_OWORD *)&a4->var9;
      v144[4] = *(_OWORD *)&a4->var7;
      v144[5] = v10;
      long long v11 = *(_OWORD *)&a4->var13;
      v144[6] = *(_OWORD *)&a4->var11;
      v144[7] = v11;
      long long v12 = *(_OWORD *)&a4->var1;
      v144[0] = a4->var0;
      v144[1] = v12;
      long long v13 = *(_OWORD *)&a4->var5;
      v144[2] = *(_OWORD *)&a4->var3;
      v144[3] = v13;
      double v14 = [(PKTiledView *)self attachmentForHoverPreviewAt:v144];
      [(PKTiledView *)self _finishCombiningStrokesIfNecessaryForAttachment:v14];
      if (self) {
        pencilStatisticsManager = self->_pencilStatisticsManager;
      }
      else {
        pencilStatisticsManager = 0;
      }
      double v16 = pencilStatisticsManager;
      long long v17 = v16;
      if (v14 && v16)
      {
        if (self) {
          long long v18 = self->_pencilStatisticsManager;
        }
        else {
          long long v18 = 0;
        }
        long long v19 = v18;
        long long v20 = [v14 drawing];
        long long v21 = [v20 uuid];
        char v22 = [(PKPencilStatisticsManager *)v19 isEqual:v21];

        if ((v22 & 1) == 0)
        {
          long long v23 = [(PKTiledView *)self hoverController];
          -[PKHoverController reset]((uint64_t)v23);

LABEL_72:
          return;
        }
      }
      else
      {

        if (!v14)
        {
          -[PKHoverController reset](*(void *)&self->_lastContentOffset.x);
          goto LABEL_72;
        }
      }
      long long v24 = *(_OWORD *)&a4->var9;
      v143[4] = *(_OWORD *)&a4->var7;
      v143[5] = v24;
      long long v25 = *(_OWORD *)&a4->var13;
      v143[6] = *(_OWORD *)&a4->var11;
      v143[7] = v25;
      long long v26 = *(_OWORD *)&a4->var1;
      v143[0] = a4->var0;
      v143[1] = v26;
      long long v27 = *(_OWORD *)&a4->var5;
      v143[2] = *(_OWORD *)&a4->var3;
      v143[3] = v27;
      [(PKTiledView *)self _updatePencilShadowView:v143];
      kdebug_trace();
      long long v28 = +[PKHoverSettings sharedSettings];
      char v29 = [v28 toolPreviewShouldWaitForHoverAndHold];

      if ((v29 & 1) == 0)
      {
        long long v30 = *(_OWORD *)&a4->var9;
        v142[4] = *(_OWORD *)&a4->var7;
        v142[5] = v30;
        long long v31 = *(_OWORD *)&a4->var13;
        v142[6] = *(_OWORD *)&a4->var11;
        v142[7] = v31;
        long long v32 = *(_OWORD *)&a4->var1;
        v142[0] = a4->var0;
        v142[1] = v32;
        long long v33 = *(_OWORD *)&a4->var5;
        v142[2] = *(_OWORD *)&a4->var3;
        v142[3] = v33;
        [(PKTiledView *)self startToolPreviewIfPossibleForInputPoint:v142];
      }
      long long v34 = [(PKTiledView *)self hoverController];
      long long v35 = +[PKHoverSettings sharedSettings];
      [v35 toolPreviewMaxZDistance];
      long long v36 = *(_OWORD *)&a4->var9;
      v141[4] = *(_OWORD *)&a4->var7;
      v141[5] = v36;
      long long v37 = *(_OWORD *)&a4->var13;
      v141[6] = *(_OWORD *)&a4->var11;
      v141[7] = v37;
      long long v38 = *(_OWORD *)&a4->var1;
      v141[0] = a4->var0;
      v141[1] = v38;
      long long v39 = *(_OWORD *)&a4->var5;
      v141[2] = *(_OWORD *)&a4->var3;
      v141[3] = v39;
      double v41 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v34, v141, v40);

      BOOL v42 = +[PKHoverSettings sharedSettings];
      [v42 toolPreviewFadeOutDistance];
      double v44 = v43;

      if (v41 >= v44) {
        double v45 = v44;
      }
      else {
        double v45 = v41;
      }
      double v46 = v41 - v45;
      double var6 = a4->var6;
      double v48 = 1.0;
      if (var6 > v46)
      {
        if (v45 <= 0.0)
        {
          if (var6 >= v46) {
            double v48 = 0.0;
          }
          else {
            double v48 = 1.0;
          }
        }
        else
        {
          double v49 = var6 - v46;
          if (v49 >= v45) {
            double v49 = v45;
          }
          double v48 = 1.0 - v49 / v45;
        }
      }
      CGFloat v50 = +[PKHoverSettings sharedSettings];
      [v50 toolShadowFadeInDistance];

      uint64_t v51 = *(void *)&self->_lastContentOffset.x;
      if (v51)
      {
        [*(id *)&self->_lastContentOffset.x currentMovementSpeed];
        -[PKHoverController alphaFactorFromMovementSpeed:](v51);
      }
      int v52 = +[PKHoverSettings sharedSettings];
      [v52 toolShadowMaxOpacity];

      if (BYTE1(self->_refineAnimationController)
        || BYTE2(self->_refineAnimationController)
        || LOBYTE(self->_refineAnimationController))
      {
        strokePreviewView = self->_strokePreviewView;
        double v54 = (CACurrentMediaTime() - *(double *)&strokePreviewView)
            / (*(double *)&strokePreviewView + 0.3 - *(double *)&strokePreviewView);
        double v55 = 0.0;
        if (v54 >= 0.0)
        {
          double v55 = v54;
          if (v54 > 1.0) {
            double v55 = 1.0;
          }
        }
        double v48 = v48 * v55;
      }
      CGRect v56 = [(PKTiledView *)self canvasView];
      CGRect v57 = [v56 _rendererController];
      -[PKMetalRendererController setPreviewStrokeAlpha:]((uint64_t)v57, v48);

      long long v139 = 0u;
      long long v140 = 0u;
      long long v137 = 0u;
      long long v138 = 0u;
      long long v135 = 0u;
      long long v136 = 0u;
      long long v133 = 0u;
      long long v134 = 0u;
      long long v58 = *(_OWORD *)&a4->var9;
      v132[4] = *(_OWORD *)&a4->var7;
      v132[5] = v58;
      long long v59 = *(_OWORD *)&a4->var13;
      v132[6] = *(_OWORD *)&a4->var11;
      v132[7] = v59;
      long long v60 = *(_OWORD *)&a4->var1;
      v132[0] = a4->var0;
      v132[1] = v60;
      long long v61 = *(_OWORD *)&a4->var5;
      v132[2] = *(_OWORD *)&a4->var3;
      v132[3] = v61;
      [(PKTiledView *)self convertInputPoint:v132 toAttachment:v14];
      if (!LOBYTE(self->_refineAnimationController)) {
        goto LABEL_44;
      }
      CGRect v62 = [(PKTiledView *)self canvasView];
      if ([v62 isDrawing])
      {

        goto LABEL_44;
      }
      double v63 = [(PKTiledView *)self canvasView];
      char v64 = [v63 _isLiveAnimating];

      if (v64)
      {
LABEL_44:
        if (BYTE1(self->_refineAnimationController) || BYTE2(self->_refineAnimationController))
        {
          CGRect v65 = [(PKTiledView *)self hoverController];
          id v66 = +[PKHoverSettings sharedSettings];
          [v66 toolPreviewMaxZDistance];
          double v68 = v67;
          __int16 v69 = +[PKHoverSettings sharedSettings];
          [v69 deactivateExtraDistance];
          long long v71 = *(_OWORD *)&a4->var9;
          v130[4] = *(_OWORD *)&a4->var7;
          v130[5] = v71;
          long long v72 = *(_OWORD *)&a4->var13;
          v130[6] = *(_OWORD *)&a4->var11;
          v130[7] = v72;
          long long v73 = *(_OWORD *)&a4->var1;
          v130[0] = a4->var0;
          v130[1] = v73;
          long long v74 = *(_OWORD *)&a4->var5;
          v130[2] = *(_OWORD *)&a4->var3;
          v130[3] = v74;
          double v75 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v65, v130, v68 + v70);

          if (a4->var6 > v75)
          {
            long long v76 = +[PKHoverSettings sharedSettings];
            int v77 = [v76 toolPreviewShouldWaitForHoverAndHold];

            if (v77)
            {
              BOOL v78 = [(PKTiledView *)self hoverController];
              -[PKHoverController resetHoverHold]((uint64_t)v78);
            }
            [(PKTiledView *)self _endHoverToolPreview];
            goto LABEL_71;
          }
          if (!BYTE1(self->_refineAnimationController))
          {
            if (BYTE2(self->_refineAnimationController))
            {
              long long v92 = *(_OWORD *)&a4->var9;
              v117[4] = *(_OWORD *)&a4->var7;
              v117[5] = v92;
              long long v93 = *(_OWORD *)&a4->var13;
              v117[6] = *(_OWORD *)&a4->var11;
              v117[7] = v93;
              long long v94 = *(_OWORD *)&a4->var1;
              v117[0] = a4->var0;
              v117[1] = v94;
              long long v95 = *(_OWORD *)&a4->var5;
              v117[2] = *(_OWORD *)&a4->var3;
              v117[3] = v95;
              [(PKTiledView *)self _updateSymbolPreviewViewForTouch:v117 attachment:v14 alpha:v48];
            }
            goto LABEL_71;
          }
          id v79 = [(PKTiledView *)self canvasView];
          v129[4] = v137;
          v129[5] = v138;
          v129[6] = v139;
          v129[7] = v140;
          v129[0] = v133;
          v129[1] = v134;
          v129[2] = v135;
          v129[3] = v136;
          objc_msgSend(v79, "_previewDrawingMoved:tiledViewLocation:", v129, a4->var0.var0.x, a4->var0.var0.y);

          id v80 = [(PKTiledView *)self ink];
          id v81 = [v80 identifier];
          LODWORD(v79) = [v81 isEqual:@"com.apple.ink.pen"];

          id v82 = [(PKTiledView *)self ink];
          id v83 = [v82 identifier];
          LODWORD(v81) = [v83 isEqual:@"com.apple.ink.marker"];

          id v84 = [(PKTiledView *)self ink];
          id v85 = [v84 identifier];
          int v86 = [v85 isEqual:@"com.apple.ink.pencil"];

          if ((v79 | v81 | v86) == 1)
          {
            id v87 = +[PKHoverSettings sharedSettings];
            if ([v87 toolIndicatorActive])
            {

LABEL_64:
              BOOL v97 = +[PKHoverSettings sharedSettings];
              if ([v97 toolIndicatorActive])
              {
                currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;

                if (!currentPreviewDrawingUUID)
                {
                  long long v99 = objc_alloc_init(PKToolPreviewView);
                  long long v100 = self->_currentPreviewDrawingUUID;
                  self->_currentPreviewDrawingUUID = (NSUUID *)v99;

                  [(NSUUID *)self->_currentPreviewDrawingUUID setTranslatesAutoresizingMaskIntoConstraints:0];
                  [(NSUUID *)self->_currentPreviewDrawingUUID setHidden:1];
                  [(PKTiledView *)self addSubview:self->_currentPreviewDrawingUUID];
                }
              }
              else
              {
              }
              [(NSUUID *)self->_currentPreviewDrawingUUID setAlpha:v48];
              objc_initWeak(&location, self);
              if (self->_currentPreviewDrawingUUID)
              {
                long long v101 = [(PKTiledView *)self canvasView];
                long long v102 = [v101 _rendererController];
                v118[0] = MEMORY[0x1E4F143A8];
                v118[1] = 3221225472;
                v118[2] = __41__PKTiledView_hoverController_didUpdate___block_invoke;
                v118[3] = &unk_1E64C5D38;
                objc_copyWeak(&v119, &location);
                long long v124 = v137;
                long long v125 = v138;
                long long v126 = v139;
                long long v127 = v140;
                long long v120 = v133;
                long long v121 = v134;
                long long v122 = v135;
                long long v123 = v136;
                -[PKMetalRendererController addBlockToCallAfterPresenting:]((uint64_t)v102, v118);

                objc_destroyWeak(&v119);
              }
              objc_destroyWeak(&location);
              goto LABEL_71;
            }
            BOOL v96 = [(PKTiledView *)self toolShadowShouldBeActive];

            if (v96) {
              goto LABEL_64;
            }
          }
        }
LABEL_71:
        kdebug_trace();
        goto LABEL_72;
      }
      id v88 = [(PKTiledView *)self ink];
      long long v89 = [v88 identifier];
      if (([v89 isEqual:@"com.apple.ink.objectEraser"] & 1) == 0)
      {
        long long v90 = [(PKTiledView *)self ink];
        long long v91 = [v90 identifier];
        if (([v91 isEqualToString:@"com.apple.ink.lasso"] & 1) == 0)
        {
          long long v116 = [(PKTiledView *)self ink];
          if (([v116 _isHandwritingInk] & 1) == 0)
          {
            long long v115 = [(PKTiledView *)self ink];
            CGRect v114 = [v115 identifier];
            char v113 = [v114 isEqual:@"com.apple.ink.generationtool"];

            if ((v113 & 1) == 0)
            {
              double v103 = +[PKHoverSettings sharedSettings];
              if ([v103 toolPreviewActive]) {
                uint64_t v104 = 2;
              }
              else {
                uint64_t v104 = 1;
              }
              long long v105 = [(PKTiledView *)self canvasView];
              long long v106 = [v105 _rendererController];
              -[PKMetalRendererController setPreviewStrokeMaxPoints:]((uint64_t)v106, v104);

              long long v107 = [(PKTiledView *)self window];
              long long v108 = +[PKToolPicker existingPaletteViewForWindow:v107];

              uint64_t v109 = [v108 isPalettePresentingPopover];
              long long v110 = [(PKTiledView *)self canvasView];
              v131[4] = v137;
              id v131[5] = v138;
              v131[6] = v139;
              v131[7] = v140;
              v131[0] = v133;
              v131[1] = v134;
              v131[2] = v135;
              v131[3] = v136;
              objc_msgSend(v110, "_previewDrawingBegan:tiledViewLocation:disableDetachedRendering:", v131, v109, a4->var0.var0.x, a4->var0.var0.y);

              BYTE1(self->_refineAnimationController) = 1;
              long long v111 = [v14 drawing];
              long long v112 = [v111 uuid];
              -[PKTiledView setCurrentPreviewDrawingUUID:]((uint64_t)self, v112);

              LOBYTE(self->_refineAnimationController) = 0;
              goto LABEL_71;
            }
            goto LABEL_60;
          }
        }
      }

LABEL_60:
      BYTE2(self->_refineAnimationController) = 1;
      LOBYTE(self->_refineAnimationController) = 0;
      goto LABEL_71;
    }
  }
  char v8 = [(PKTiledView *)self canvasView];
  [v8 _finishCombiningStrokesIfNecessary];

  uint64_t v9 = *(void *)&self->_lastContentOffset.x;

  -[PKHoverController reset](v9);
}

- (void)setCurrentPreviewDrawingUUID:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 880), a2);
  }
}

void __41__PKTiledView_hoverController_didUpdate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = *(_OWORD *)(a1 + 120);
  v7[4] = *(_OWORD *)(a1 + 104);
  void v7[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v7[6] = *(_OWORD *)(a1 + 136);
  v7[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v7[2] = *(_OWORD *)(a1 + 72);
  _OWORD v7[3] = v6;
  [WeakRetained _updateToolPreviewIndicatorInputPoint:v7];
}

- (void)_updateSymbolPreviewViewForTouch:(id *)a3 attachment:(id)a4 alpha:(double)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v65 = a4;
  id v66 = self;
  char v8 = [(PKTiledView *)self ink];
  char v9 = [v8 _isEraserInk];

  if (v9)
  {
    unint64_t v10 = 1;
  }
  else
  {
    long long v11 = [(PKTiledView *)self ink];
    int v12 = [v11 _isHandwritingInk];

    if (v12) {
      unint64_t v10 = 3;
    }
    else {
      unint64_t v10 = 2;
    }
  }
  if (self->_currentPreviewDrawingUUID)
  {
    -[PKTiledView bringSubviewToFront:](self, "bringSubviewToFront:");
  }
  else
  {
    long long v13 = objc_alloc_init(PKToolPreviewView);
    currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
    self->_currentPreviewDrawingUUID = (NSUUID *)v13;

    [(NSUUID *)self->_currentPreviewDrawingUUID setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PKTiledView *)self addSubview:self->_currentPreviewDrawingUUID];
  }
  self;
  if (v10 == 3) {
    double v15 = 4.0;
  }
  else {
    double v15 = 12.0;
  }
  -[PKToolPreviewView prepareWithFrame:mode:]((id *)&self->_currentPreviewDrawingUUID->super.isa, v10, a3->var0.var0.x - v15 * 0.5, a3->var0.var0.y - v15 * 0.5, v15, v15);
  [(NSUUID *)self->_currentPreviewDrawingUUID setAlpha:a5];
  double v16 = [(PKTiledView *)self ink];
  int v17 = [v16 _isEraserInk];

  if (v17)
  {
    double x = a3->var0.var0.x;
    double y = a3->var0.var0.y;
    memset(&v79, 0, sizeof(v79));
    [(PKTiledView *)self transformFromViewToStrokeSpaceInAttachment:v65];
    uint64_t v20 = [v65 strokeSpatialCache];
    long long v21 = (void *)v20;
    if (v20 && *(unsigned char *)(v20 + 8))
    {
      uint64_t v22 = [v65 strokeSpatialCache];
      long long v23 = (void *)v22;
      if (v22) {
        long long v24 = *(void **)(v22 + 24);
      }
      else {
        long long v24 = 0;
      }
      id v63 = v24;
    }
    else
    {
      id v63 = 0;
    }

    long long v25 = [v65 drawing];
    objc_msgSend(v25, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v63, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0, y * 0.0 + 0.0 * x + 0.0);
    id newValue = (id)objc_claimAutoreleasedReturnValue();

    if (([(PKDrawing *)self->_erasePreviewDrawing isEqualToOrderedSet:newValue] & 1) == 0)
    {
      objc_setProperty_nonatomic_copy(self, v26, newValue, 856);
      long long v27 = +[PKHoverSettings sharedSettings];
      [v27 erasePreviewAlphaFactor];
      double v29 = v28;

      if (v29 <= 0.0 || v29 >= 1.0)
      {
        double v43 = *MEMORY[0x1E4F1DB20];
        double v44 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
        double width = *(double *)(MEMORY[0x1E4F1DB20] + 16);
        double height = *(double *)(MEMORY[0x1E4F1DB20] + 24);
        long long v71 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        id v47 = newValue;
        uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v80 count:16];
        if (v48)
        {
          uint64_t v49 = *(void *)v72;
          do
          {
            for (uint64_t i = 0; i != v48; ++i)
            {
              if (*(void *)v72 != v49) {
                objc_enumerationMutation(v47);
              }
              [*(id *)(*((void *)&v71 + 1) + 8 * i) renderBounds];
              v89.origin.double x = v51;
              v89.origin.double y = v52;
              v89.size.double width = v53;
              v89.size.double height = v54;
              v83.origin.double x = v43;
              v83.origin.double y = v44;
              v83.size.double width = width;
              v83.size.double height = height;
              CGRect v84 = CGRectUnion(v83, v89);
              double v43 = v84.origin.x;
              double v44 = v84.origin.y;
              double width = v84.size.width;
              double height = v84.size.height;
            }
            uint64_t v48 = [v47 countByEnumeratingWithState:&v71 objects:v80 count:16];
          }
          while (v48);
        }

        v85.origin.double x = v43;
        v85.origin.double y = v44;
        v85.size.double width = width;
        v85.size.double height = height;
        p_isdouble a = (id *)&v66->super.super.super.isa;
        if (CGRectIsNull(v85))
        {
          [(NSOrderedSet *)v66->_eraseOrLassoPreviewStrokes removeFromSuperview];
          objc_storeStrong((id *)&v66->_eraseOrLassoPreviewStrokes, 0);
        }
        else
        {
          if (!v66->_eraseOrLassoPreviewStrokes)
          {
            CGRect v56 = objc_alloc_init(PKStrokePreviewView);
            objc_storeStrong((id *)&v66->_eraseOrLassoPreviewStrokes, v56);

            p_isdouble a = (id *)&v66->super.super.super.isa;
            [(NSOrderedSet *)v66->_eraseOrLassoPreviewStrokes setTranslatesAutoresizingMaskIntoConstraints:0];
            [p_isa addSubview:p_isa[106]];
            [(NSOrderedSet *)v66->_eraseOrLassoPreviewStrokes setOpaque:0];
            [(NSOrderedSet *)v66->_eraseOrLassoPreviewStrokes setAlpha:1.0];
          }
          CGAffineTransform v69 = v79;
          memset(&v70, 0, sizeof(v70));
          CGAffineTransformInvert(&v70, &v69);
          CGAffineTransform v68 = v70;
          v86.origin.double x = v43;
          v86.origin.double y = v44;
          v86.size.double width = width;
          v86.size.double height = height;
          CGRect v87 = CGRectApplyAffineTransform(v86, &v68);
          CGRect v88 = CGRectIntegral(v87);
          double v57 = v88.origin.x;
          double v58 = v88.origin.y;
          double v59 = v88.size.width;
          double v60 = v88.size.height;
          long long v61 = (id *)p_isa[106];
          CGRect v62 = [v47 array];
          -[PKStrokePreviewView prepareWithFrame:strokeBounds:strokes:](v61, v62, v57, v58, v59, v60, v43, v44, width, height);
        }
      }
      else
      {
        long long v30 = [v65 drawing];
        objc_storeStrong((id *)&self->_toolPreviewView, v30);

        long long v31 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(newValue, "count"));
        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        obuint64_t j = newValue;
        uint64_t v32 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
        if (v32)
        {
          uint64_t v33 = *(void *)v76;
          do
          {
            for (uint64_t j = 0; j != v32; ++j)
            {
              if (*(void *)v76 != v33) {
                objc_enumerationMutation(obj);
              }
              long long v35 = *(void **)(*((void *)&v75 + 1) + 8 * j);
              long long v36 = [v35 ink];
              long long v37 = [v36 color];
              [v37 alphaComponent];
              long long v39 = [v37 colorWithAlphaComponent:v29 * v38];
              double v40 = +[PKInk inkFromInk:v36 color:v39];

              double v41 = (void *)[v35 mutableCopy];
              [v41 setInk:v40];
              [v41 _setRenderGroupID:0];
              [v31 addObject:v41];
            }
            uint64_t v32 = [obj countByEnumeratingWithState:&v75 objects:v81 count:16];
          }
          while (v32);
        }

        BOOL v42 = [v65 drawing];
        [(PKTiledView *)v66 _setAdditionalStrokes:v31 inDrawing:v42 invalidateTiles:1];
      }
    }
  }
}

- (void)_updateToolPreviewIndicatorInputPoint:(id *)a3
{
  if (self->_currentPreviewDrawingUUID)
  {
    long long v5 = [(PKTiledView *)self ink];
    long long v6 = [v5 identifier];
    int v7 = [v6 isEqual:@"com.apple.ink.pen"];

    char v8 = [(PKTiledView *)self ink];
    char v9 = [v8 identifier];
    int v10 = [v9 isEqual:@"com.apple.ink.marker"];

    long long v11 = [(PKTiledView *)self ink];
    int v12 = [v11 identifier];
    int v13 = [v12 isEqual:@"com.apple.ink.pencil"];

    uint64_t v61 = 0;
    long long v59 = 0u;
    long long v60 = 0u;
    memset(&__s1, 0, sizeof(__s1));
    double v14 = [(PKTiledView *)self canvasView];
    double v15 = [v14 _drawingController];
    double v16 = -[PKController inputController](v15);
    int v17 = v16;
    if (v16)
    {
      [v16 _latestStrokePoint];
    }
    else
    {
      uint64_t v61 = 0;
      long long v59 = 0u;
      long long v60 = 0u;
      memset(&__s1, 0, sizeof(__s1));
    }

    if (!memcmp(&__s1, &_PKStrokePointZero, 0x58uLL))
    {
      long long v18 = [(PKTiledView *)self canvasView];
      long long v19 = [v18 _drawingController];
      uint64_t v20 = -[PKController inputController](v19);
      long long v21 = v20;
      long long v22 = *(_OWORD *)&a3->var9;
      void v53[4] = *(_OWORD *)&a3->var7;
      v53[5] = v22;
      long long v23 = *(_OWORD *)&a3->var13;
      v53[6] = *(_OWORD *)&a3->var11;
      v53[7] = v23;
      long long v24 = *(_OWORD *)&a3->var1;
      v53[0] = a3->var0;
      v53[1] = v24;
      long long v25 = *(_OWORD *)&a3->var5;
      v53[2] = *(_OWORD *)&a3->var3;
      v53[3] = v25;
      if (v20)
      {
        [v20 outputCurrentStrokePoint:v53];
      }
      else
      {
        uint64_t v57 = 0;
        long long v55 = 0u;
        long long v56 = 0u;
        memset(&v54, 0, sizeof(v54));
      }
      CGAffineTransform __s1 = v54;
      long long v59 = v55;
      long long v60 = v56;
      uint64_t v61 = v57;
    }
    memset(&v54, 0, sizeof(v54));
    long long v26 = [(PKTiledView *)self canvasView];
    long long v27 = v26;
    if (v26) {
      [v26 strokeTransform];
    }
    else {
      memset(&v54, 0, sizeof(v54));
    }

    CGAffineTransform v51 = v54;
    CGAffineTransformInvert(&v52, &v51);
    if (!self->_currentPreviewDrawingUUID) {
      goto LABEL_22;
    }
    double v28 = __s1.d / sqrt(v52.b * v52.b + v52.a * v52.a);
    double v29 = v54.tx + __s1.c * v54.c + v54.a * __s1.b;
    double v30 = v54.ty + __s1.c * v54.d + v54.b * __s1.b;
    if (v7)
    {
      long long v31 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithOvalInRect:", v29 - (v28 + 1.0) * 0.5, v30 - (v28 + 1.0) * 0.5, v28 + 1.0, v28 + 1.0);
      if (!v31)
      {
LABEL_22:
        id v41 = 0;
LABEL_23:

        return;
      }
    }
    else
    {
      if ((v10 | v13) != 1) {
        goto LABEL_22;
      }
      tdouble x = __s1.tx;
      CGFloat v33 = *((double *)&v59 + 1);
      long long v34 = [(PKTiledView *)self ink];
      long long v35 = [v34 behavior];
      long long v36 = [v35 particleDescriptor];

      [v36 particleSize];
      long long v31 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRoundedRect:cornerRadius:", *MEMORY[0x1E4F1DAD8] - tx * (v28 + v28) * v37 * 0.5, *(double *)(MEMORY[0x1E4F1DAD8] + 8) - (v28 + v28) * v38 * 0.5, tx * (v28 + v28) * v37, (v28 + v28) * v38, 2.0);
      memset(&v50, 0, sizeof(v50));
      CGAffineTransformMakeRotation(&v50, v33);
      memset(&v49, 0, sizeof(v49));
      CGAffineTransformMakeTranslation(&v49, v29, v30);
      CGAffineTransform t1 = v50;
      CGAffineTransform t2 = v49;
      CGAffineTransformConcat(&v48, &t1, &t2);
      [v31 applyTransform:&v48];

      if (!v31) {
        goto LABEL_22;
      }
    }
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    [MEMORY[0x1E4F39CF8] setLowLatency:1];
    [v31 bounds];
    CGRect v63 = CGRectInset(v62, -50.0, -50.0);
    double x = v63.origin.x;
    double y = v63.origin.y;
    -[PKToolPreviewView prepareWithFrame:mode:]((id *)&self->_currentPreviewDrawingUUID->super.isa, 0, v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
    CGAffineTransformMakeTranslation(&v45, -x, -y);
    [v31 applyTransform:&v45];
    id v41 = v31;
    uint64_t v42 = [v41 CGPath];
    currentPreviewDrawingUUID = self->_currentPreviewDrawingUUID;
    if (currentPreviewDrawingUUID)
    {
      [(objc_class *)currentPreviewDrawingUUID[52].super.isa setPath:v42];
      double v44 = self->_currentPreviewDrawingUUID;
    }
    else
    {
      double v44 = 0;
    }
    [(NSUUID *)v44 setHidden:0];
    [MEMORY[0x1E4F39CF8] commit];
    goto LABEL_23;
  }
}

- (void)hoverControllerDidEnd:(id)a3
{
  [(PKTiledView *)self _reenableScrollViewPanGestureIfNecessary];
  [(PKTiledView *)self _endHoverToolPreview];
  long long v4 = +[PKHoverSettings sharedSettings];
  int v5 = [v4 toolShadowLocationWorkaround];

  if (v5)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PKTiledView_hoverControllerDidEnd___block_invoke;
    block[3] = &unk_1E64C5368;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __37__PKTiledView_hoverControllerDidEnd___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) window];
  uint64_t v1 = [v3 windowScene];
  id v2 = +[PKPencilObserverInteraction interactionForScene:]((uint64_t)PKPencilObserverInteraction, v1);
  -[PKPencilObserverInteraction workaroundShadowUpdateEnded]((uint64_t)v2);
}

- (void)hoverController:(id)a3 holdGestureMeanTouch:(id *)a4 latestTouch:(id *)a5
{
  id v7 = a3;
  if (!self
    || !BYTE1(self->_refineAnimationController)
    && !LOBYTE(self->_refineAnimationController)
    && !BYTE2(self->_refineAnimationController))
  {
    -[PKTiledView convertToShapeAtLocation:](self, "convertToShapeAtLocation:", a5->var0.var0.x, a5->var0.var0.y);
    char v8 = +[PKHoverSettings sharedSettings];
    int v9 = [v8 toolPreviewShouldWaitForHoverAndHold];

    if (v9)
    {
      long long v10 = *(_OWORD *)&a5->var9;
      v14[4] = *(_OWORD *)&a5->var7;
      void v14[5] = v10;
      long long v11 = *(_OWORD *)&a5->var13;
      v14[6] = *(_OWORD *)&a5->var11;
      v14[7] = v11;
      long long v12 = *(_OWORD *)&a5->var1;
      v14[0] = a5->var0;
      v14[1] = v12;
      long long v13 = *(_OWORD *)&a5->var5;
      v14[2] = *(_OWORD *)&a5->var3;
      v14[3] = v13;
      [(PKTiledView *)self startToolPreviewIfPossibleForInputPoint:v14];
    }
  }
}

- (void)hoverControllerHoldGestureEnded:(id)a3
{
  if (self)
  {
    double delayHoverPreviewUntil = self->_delayHoverPreviewUntil;
    if (delayHoverPreviewUntil != 0.0)
    {
      dispatch_block_cancel(*(dispatch_block_t *)&delayHoverPreviewUntil);
      objc_setProperty_nonatomic_copy(self, v5, 0, 816);
    }
  }
  id v6 = [(PKTiledView *)self hoverController];
  [v6 hideLabel];
}

- (BOOL)shouldStartToolPreviewWhenHovering
{
  if (!self->_selectionHidden) {
    return 0;
  }
  id v2 = *(id *)&self->_delayHoverPreviewUntil;
  if (v2)
  {
    char v3 = 0;
  }
  else
  {
    long long v4 = +[PKHoverSettings sharedSettings];
    if ([v4 toolPreviewActive])
    {
      char v3 = 1;
    }
    else
    {
      SEL v5 = +[PKHoverSettings sharedSettings];
      char v3 = [v5 toolIndicatorActive];
    }
  }

  return v3;
}

- (void)startToolPreviewIfPossibleForInputPoint:(id *)a3
{
  if (!self
    || !LOBYTE(self->_refineAnimationController)
    && !BYTE1(self->_refineAnimationController)
    && !BYTE2(self->_refineAnimationController))
  {
    SEL v5 = [(PKTiledView *)self canvasView];
    if ([v5 _isCombiningStrokes])
    {
    }
    else
    {
      id v6 = [(PKTiledView *)self canvasView];
      char v7 = [v6 isHidden];

      if ((v7 & 1) == 0) {
        return;
      }
    }
    double v8 = CACurrentMediaTime();
    if (self) {
      extraHoverPreviewDeladouble y = self->_extraHoverPreviewDelay;
    }
    else {
      extraHoverPreviewDeladouble y = 0.0;
    }
    if (v8 >= extraHoverPreviewDelay
      && ![(PKTiledView *)self _scrollViewIsScrollingOrZoomingOrResizing]
      && ![(PKTiledView *)self _isScrollViewSizeAnimating]
      && [(PKTiledView *)self shouldStartToolPreviewWhenHovering])
    {
      long long v10 = [(PKTiledView *)self hoverController];
      long long v11 = +[PKHoverSettings sharedSettings];
      [v11 toolPreviewMaxZDistance];
      long long v12 = *(_OWORD *)&a3->var9;
      v21[4] = *(_OWORD *)&a3->var7;
      v21[5] = v12;
      long long v13 = *(_OWORD *)&a3->var13;
      v21[6] = *(_OWORD *)&a3->var11;
      v21[7] = v13;
      long long v14 = *(_OWORD *)&a3->var1;
      v21[0] = a3->var0;
      v21[1] = v14;
      long long v15 = *(_OWORD *)&a3->var5;
      v21[2] = *(_OWORD *)&a3->var3;
      v21[3] = v15;
      double v17 = -[PKHoverController adjustedZLimitFromLimit:inputPoint:]((uint64_t)v10, v21, v16);

      if (a3->var6 <= v17)
      {
        if (self)
        {
          LOBYTE(self->_refineAnimationController) = 1;
          *(CFTimeInterval *)&self->_strokePreviewView = CACurrentMediaTime();
        }
        else
        {
          CACurrentMediaTime();
        }
        [(PKTiledView *)self _disableScrollViewPanGestureIfNecessary];
      }
      else
      {
        if (self) {
          LOBYTE(self->_refineAnimationController) = 0;
        }
        long long v18 = +[PKHoverSettings sharedSettings];
        int v19 = [v18 toolPreviewShouldWaitForHoverAndHold];

        if (v19)
        {
          uint64_t v20 = [(PKTiledView *)self hoverController];
          -[PKHoverController resetHoverHold]((uint64_t)v20);
        }
      }
    }
  }
}

- (void)convertToShapeAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = +[PKHoverSettings sharedSettings];
  if ([v6 snapToShapeActive])
  {
  }
  else
  {
    char v7 = [(PKTiledView *)self ink];
    char v8 = [v7 _isStrokeGeneratingInk];

    if (v8) {
      return;
    }
  }
  int v9 = -[PKTiledView _hitAttachment:includeStandinAttachment:expandBottomAttachment:](self, "_hitAttachment:includeStandinAttachment:expandBottomAttachment:", 0, 0, x, y);
  long long v10 = v9;
  if (v9)
  {
    long long v11 = [v9 drawing];
    [(PKTiledView *)self transformFromViewToStrokeSpaceInAttachment:v10];
    uint64_t v12 = [v10 strokeSpatialCache];
    long long v13 = (void *)v12;
    if (v12 && *(unsigned char *)(v12 + 8))
    {
      uint64_t v14 = [v10 strokeSpatialCache];
      long long v15 = (void *)v14;
      if (v14) {
        double v16 = *(void **)(v14 + 24);
      }
      else {
        double v16 = 0;
      }
      id v17 = v16;
    }
    else
    {
      id v17 = 0;
    }

    long long v18 = objc_msgSend(v11, "strokesIntersectedByPoint:prevPoint:onscreenVisibleStrokes:", v17, v44 + y * v42 + v40 * x, v45 + y * v43 + v41 * x, v44 + y * v42 + v40 * x + 1.0, v45 + y * v43 + v41 * x + 1.0);
    if ([v18 count] != 1) {
      goto LABEL_28;
    }
    int v19 = [v18 firstObject];
    if (![v19 _shapeType])
    {
      uint64_t v20 = [v19 _strokeData];
      if (![v20 hasValidPointTimestampData])
      {
LABEL_26:

        goto LABEL_27;
      }
      long long v21 = [v19 _strokeMask];

      if (!v21)
      {
        long long v22 = objc_alloc_init(PKShapeDrawingController);
        uint64_t v20 = v22;
        if (v22) {
          v22->_shapeRecognitionOn = 1;
        }
        [(PKTiledView *)self inputScale];
        memset(v39, 0, sizeof(v39));
        long long v24 = -[PKShapeDrawingController shapeFromStroke:inputScale:averageInputPoint:allowedShapeTypes:]((uint64_t)v20, v19, v39, 0, v23);
        long long v25 = v24;
        if (v24 && [v24 type] != 6 && objc_msgSend(v25, "type") != 7)
        {
          objc_initWeak(&location, self);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __40__PKTiledView_convertToShapeAtLocation___block_invoke;
          block[3] = &unk_1E64C5D60;
          objc_copyWeak(&v37, &location);
          id v34 = v11;
          id v35 = v19;
          id v36 = v25;
          dispatch_block_t v27 = dispatch_block_create((dispatch_block_flags_t)0, block);
          if (self) {
            objc_setProperty_nonatomic_copy(self, v26, v27, 816);
          }

          double v28 = [(PKTiledView *)self hoverController];
          [(PKHoverController *)v28 showLabel:x atLocation:y];

          double v29 = +[PKHoverSettings sharedSettings];
          [v29 hoverAndHoldActionTimeInterval];
          dispatch_time_t v31 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
          if (self) {
            double delayHoverPreviewUntil = self->_delayHoverPreviewUntil;
          }
          else {
            double delayHoverPreviewUntil = 0.0;
          }
          dispatch_after(v31, MEMORY[0x1E4F14428], *(dispatch_block_t *)&delayHoverPreviewUntil);

          objc_destroyWeak(&v37);
          objc_destroyWeak(&location);
        }

        goto LABEL_26;
      }
    }
LABEL_27:

LABEL_28:
  }
}

void __40__PKTiledView_convertToShapeAtLocation___block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    char v3 = *(void **)(a1 + 32);
    v15[0] = *(void *)(a1 + 40);
    long long v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    SEL v5 = [v3 undoableDeleteStrokes:v4];

    id v6 = *(void **)(a1 + 32);
    char v7 = [*(id *)(a1 + 48) strokes];
    char v8 = [v6 undoableAddNewStrokes:v7];

    int v9 = [WeakRetained canvasView];
    v14[0] = v8;
    v14[1] = v5;
    long long v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    [WeakRetained canvasView:v9 registerUndoCommands:v10];

    [WeakRetained didChangeDrawing:*(void *)(a1 + 32)];
    uint64_t v13 = *(void *)(a1 + 32);
    long long v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
    [WeakRetained _selectionRefreshWithChangeToDrawings:v11 completion:&__block_literal_global_647];

    uint64_t v12 = [WeakRetained hoverController];
    [v12 hideLabel];
  }
}

- (CAMetalLayer)metalLayer
{
  return (CAMetalLayer *)[self->_drawingPolicy metalLayer];
}

- (void)_findSelectionTranscriptionWithCompletion:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PKTiledView *)self selectionController];
  SEL v5 = (void *)v4;
  if (v4) {
    id v6 = *(void **)(v4 + 152);
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  [v7 _findTranscriptionWithCompletion:v8];
}

- (id)_accessibilityUserTestingChildren
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  char v3 = (void *)MEMORY[0x1E4F1CA48];
  v16.receiver = self;
  v16.super_class = (Class)PKTiledView;
  uint64_t v4 = [(PKTiledView *)&v16 _accessibilityUserTestingChildren];
  SEL v5 = [v3 arrayWithArray:v4];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(PKTiledView *)self attachmentViews];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        long long v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) _accessibilityUserTestingChildren];
        [v5 addObjectsFromArray:v10];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v7);
  }

  return v5;
}

- (void)_getAllHandwritingTranscription:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PKTiledView *)self selectionController];
  -[PKSelectionController getAllHandwritingTranscription:]((uint64_t)v4);
}

- (void)_copyAll:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(PKTiledView *)self selectionController];
  -[PKSelectionController copyAll:]((uint64_t)v4, v5);
}

- (BOOL)_isDrawingEnabled
{
  return self->_selectionHidden;
}

- (PKTiledViewAnimationController)refineAnimationController
{
  return (PKTiledViewAnimationController *)self->_defaultDrawingClass;
}

- (PKLinedPaper)linedPaper
{
  return (PKLinedPaper *)self->_scrollView;
}

- (BOOL)cropDrawingAttachmentsWhenViewIsSmaller
{
  return self->_supportsCopyAsText;
}

- (void)setCropDrawingAttachmentsWhenViewIsSmaller:(BOOL)a3
{
  self->_supportsCopyAsText = a3;
}

- (unint64_t)drawingPolicy
{
  return (unint64_t)self->_delegate;
}

- (void)setShowDebugOutlines:(BOOL)a3
{
  self->_shouldAdjustStrokeTransformAtEndOfStroke = a3;
}

- (PKTiledViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_canvasViewZOrderPolicy);

  return (PKTiledViewDelegate *)WeakRetained;
}

- (BOOL)combiningStrokesEnabled
{
  return self->_isDoingInteractiveResize;
}

- (void)setCombiningStrokesEnabled:(BOOL)a3
{
  self->_isDoingInteractiveResize = a3;
}

- (UIView)contentSnapshottingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentCoordinateSpace);

  return (UIView *)WeakRetained;
}

- (void)setContentSnapshottingView:(id)a3
{
}

- (void)setContentCoordinateSpace:(id)a3
{
}

- (int64_t)maximumSupportedContentVersion
{
  return (int64_t)self->_welcomeController;
}

- (void)setMaximumSupportedContentVersion:(int64_t)a3
{
  self->_welcomeController = (PKWelcomeController *)a3;
}

- (BOOL)allowSnapToShape
{
  return self->_needUpdateAfterBackgroundTraitCollectionChange;
}

- (void)setAllowSnapToShape:(BOOL)a3
{
  self->_needUpdateAfterBackgroundTraitCollectionChange = a3;
}

- (PKWelcomeController)welcomeController
{
  return (PKWelcomeController *)self->_pencilLongPressGestureRecognizer;
}

- (void)setWelcomeController:(id)a3
{
}

- (BOOL)sixChannelBlendingDisableSnapshotting
{
  return self->_hoverIsKnownToBeUnsupported;
}

- (UIGestureRecognizer)pencilLongPressGestureRecognizer
{
  return &self->_simultaneousDrawingGestureRecognizer->super;
}

- (id)drawingUndoTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingUndoSelector);

  return WeakRetained;
}

- (SEL)drawingUndoSelector
{
  return (SEL)self->_selectionController;
}

- (void)setTileController:(id)a3
{
}

- (UITouch)drawingTouchThatHitNothing
{
  return (UITouch *)self->_rulerHostingDelegate;
}

- (BOOL)selectionHidden
{
  return self->_shouldBeginHoverPreview;
}

- (BOOL)supportsCopyAsText
{
  return self->_hoverPreviewActive;
}

- (id)liveAttachment
{
  return self->_currentDrawingBeingCopiedToCanvas;
}

- (BOOL)aggd_didMergeWithCollaborator
{
  return BYTE4(self->_refineAnimationController);
}

- (void)setAggd_didMergeWithCollaborator:(BOOL)a3
{
  BYTE4(self->_refineAnimationController) = a3;
}

- (int64_t)_maxFileFormatVersion
{
  return (int64_t)self->_editMenuInteraction;
}

- (BOOL)disableUndoManager
{
  return BYTE6(self->_refineAnimationController);
}

- (void)setDisableUndoManager:(BOOL)a3
{
  BYTE6(self->_refineAnimationController) = a3;
}

- (UIEditMenuInteraction)editMenuInteraction
{
  return (UIEditMenuInteraction *)self->_rulerController;
}

- (BOOL)editMenuVisible
{
  return HIBYTE(self->_refineAnimationController);
}

- (void)setEditMenuVisible:(BOOL)a3
{
  HIBYTE(self->_refineAnimationController) = a3;
}

- (PKRulerController)rulerController
{
  return (PKRulerController *)self->_hoverController;
}

- (PKHoverController)hoverController
{
  return *(PKHoverController **)&self->_lastContentOffset.x;
}

- (void)setHoverController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastContentOffset, 0);
  objc_storeStrong((id *)&self->_hoverController, 0);
  objc_storeStrong((id *)&self->_rulerController, 0);
  objc_storeStrong((id *)&self->_aggd_cachedVisibleStrokeCount, 0);
  objc_destroyWeak((id *)&self->_analyticsSession);
  objc_storeStrong((id *)&self->_pencilStatisticsManager, 0);
  objc_storeStrong((id *)&self->_currentPreviewDrawingUUID, 0);
  objc_storeStrong((id *)&self->_toolPreviewView, 0);
  objc_storeStrong((id *)&self->_erasePreviewDrawing, 0);
  objc_storeStrong((id *)&self->_eraseOrLassoPreviewStrokes, 0);
  objc_storeStrong((id *)&self->_delayHoverPreviewUntil, 0);
  objc_storeStrong(&self->_hoverConvertToShapeBlock, 0);
  objc_storeStrong((id *)&self->_undoManagersRegisteredWith, 0);
  objc_storeStrong(&self->_hideCanvasBlock, 0);
  objc_storeStrong(&self->_updateAttachmentBoundsBlock, 0);
  objc_storeStrong(&self->_didScrollBlock, 0);
  objc_storeStrong((id *)&self->_cachedDrawingVersionForAdditionalStrokes, 0);
  objc_storeStrong((id *)&self->_cachedDrawingUUIDForAdditionalStrokes, 0);
  objc_storeStrong((id *)&self->_cachedVisibleStrokesWithAdditionalStrokesForDirtyDrawing, 0);
  objc_destroyWeak((id *)&self->_lastZoomScale);
  objc_storeStrong((id *)&self->_currentDrawingBeingCopiedToCanvas, 0);
  objc_storeStrong((id *)&self->_liveAttachment, 0);
  objc_destroyWeak((id *)&self->_tileSize);
  objc_storeStrong((id *)&self->_rulerHostingDelegate, 0);
  objc_storeStrong((id *)&self->_drawingTouchThatHitNothing, 0);
  objc_storeStrong((id *)&self->_tileController, 0);
  objc_destroyWeak((id *)&self->_drawingUndoSelector);
  objc_storeStrong(&self->_drawingUndoTarget, 0);
  objc_storeStrong((id *)&self->_generationToolGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_simultaneousDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pencilLongPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_maximumSupportedContentVersion, 0);
  objc_destroyWeak((id *)&self->_contentCoordinateSpace);
  objc_destroyWeak((id *)&self->_canvasViewZOrderPolicy);
  objc_storeStrong((id *)&self->_drawingPolicy, 0);
  objc_destroyWeak((id *)&self->_canvasView);
  objc_destroyWeak((id *)&self->_attachmentContainerView);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_linedPaper, 0);
  objc_storeStrong((id *)&self->_defaultDrawingClass, 0);
  objc_storeStrong((id *)&self->_timestampForLatestUserInteraction, 0);
  objc_storeStrong((id *)&self->_externalAttachments, 0);
  objc_storeStrong((id *)&self->_shouldResetBaseRollAngleOnNextStroke, 0);
  objc_storeStrong(&self->_updateVisibleTilesAfterZoomOutBlock, 0);
  objc_storeStrong((id *)&self->_dirtyDrawing, 0);

  objc_storeStrong((id *)&self->_dropInteraction, 0);
}

- (void)setupRefineAnimationFrom:(id)a3 to:(id)a4 inDrawing:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(PKTiledView *)self refineAnimationController];
  [v14 setupRefineAnimationFrom:v13 to:v12 in:v11 completionHandler:v10];
}

- (void)setupStrokeInAnimationTo:(id)a3 inDrawing:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PKTiledView *)self refineAnimationController];
  [v11 setupStrokeInAnimationTo:v10 in:v9 completionHandler:v8];
}

- (void)startRefineAnimationWithDuration:(double)a3
{
  id v4 = [(PKTiledView *)self refineAnimationController];
  [v4 startRefineAnimationWithDuration:a3];
}

- (void)stopRefineAnimation
{
  id v2 = [(PKTiledView *)self refineAnimationController];
  [v2 stopRefineAnimation];
}

@end