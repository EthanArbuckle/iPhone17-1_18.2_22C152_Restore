@interface PKAttachmentView
- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3;
- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4;
- (BOOL)_isDrawing;
- (BOOL)canConvertTextToHandwriting:(id)a3;
- (BOOL)contentHidden;
- (BOOL)deferMentionUpdate;
- (BOOL)detectionViewsHidden;
- (BOOL)didReceiveTextConversion;
- (BOOL)disableTileAnimations;
- (BOOL)hideUntilScroll;
- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4;
- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4;
- (BOOL)ignoreInitialDetectionItemsForStatistics;
- (BOOL)isAtEndOfDocument;
- (BOOL)isDraggingSelection;
- (BOOL)isExternalAttachment;
- (BOOL)isRTL;
- (BOOL)isSharedViaICloud;
- (BOOL)shouldDiscardEndedStroke:(id)a3;
- (BOOL)sixChannelBlending;
- (BOOL)toolPickerVisible;
- (BOOL)wantsAutoRefine;
- (BOOL)wantsDataDetection;
- (BOOL)wantsFullyRendered;
- (BOOL)wantsHashtagDetection;
- (BOOL)wantsMentionDetection;
- (BOOL)wantsProofreadingDetection;
- (CGAffineTransform)drawingTransform;
- (CGAffineTransform)tileDrawingTransform;
- (CGRect)boundingBoxForHashtagOrMentionWithUUID:(id)a3;
- (CGRect)cachedBounds;
- (NSArray)additionalStrokes;
- (NSMutableArray)dataDetectorViews;
- (NSMutableArray)hashtagViews;
- (NSMutableArray)mentionViews;
- (NSMutableArray)previousDataDetectorItems;
- (NSMutableArray)previousHashtagItems;
- (NSMutableArray)previousMentionItems;
- (NSMutableArray)previousProofreadingItems;
- (NSMutableArray)proofreadingViews;
- (NSMutableDictionary)mentionUUIDtoParticipant;
- (NSMutableDictionary)offscreenTiles;
- (NSMutableDictionary)purgedTiles;
- (NSMutableDictionary)tiles;
- (NSProgress)currentProgress;
- (PKAttachmentView)initWithCoder:(id)a3;
- (PKAttachmentView)initWithFrame:(CGRect)a3;
- (PKAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4;
- (PKAttachmentViewHashtagsAndMentionsDelegate)hashtagAndMentionsDelegate;
- (PKDrawing)drawing;
- (PKProgressAlertController)progressAlertController;
- (PKRecognitionController)recognitionController;
- (PKRecognitionSessionManager)recognitionManager;
- (PKStrokeSpatialCache)strokeSpatialCache;
- (PKTiledView)tiledView;
- (UIView)proofreadingContainerView;
- (UIView)tileContainerView;
- (double)heightFromDrawing:(id)a3 delta:(double)a4;
- (id)_accessibilityUserTestingChildren;
- (id)_firstStrokesInSelectedStrokes:(id)a3;
- (id)_lastStrokesInSelectedStrokes:(id)a3;
- (id)hitMiniMenu:(CGPoint)a3;
- (id)inlineViewAtPoint:(CGPoint)a3;
- (int64_t)contentTypeForIntersectedStrokes:(id)a3;
- (void)_didEnterBackground:(id)a3;
- (void)_handleAutoRefineSettingsDidChange;
- (void)_hideHUD;
- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3;
- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4;
- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4 createIfDrawingIfEmpty:(BOOL)a5;
- (void)_progressChanged;
- (void)_showHUDWithProgress:(id)a3;
- (void)_toolPickerDidShowHide:(id)a3;
- (void)_unregisterProgressObserver;
- (void)_updateAllPossibleParticipantNameTokens:(id)a3;
- (void)_willEnterForeground:(id)a3;
- (void)clearTileDrawingTransform;
- (void)containingScrollViewDidScroll;
- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 completion:(id)a6;
- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 inkColor:(id)a6 completion:(id)a7;
- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 suggestedDrawing:(id)a6 inkColor:(id)a7 completion:(id)a8;
- (void)dealloc;
- (void)didBeginDrawing;
- (void)didBeginModifyDrawing;
- (void)didEndModifyDrawing;
- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)drawingDidChange;
- (void)drawingDidChangeVisibleStrokes:(BOOL)a3;
- (void)endedStroke:(id)a3;
- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7;
- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6;
- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4;
- (void)hashtagView:(id)a3 registerCommand:(id)a4;
- (void)hashtagViewDidActivateHashtag:(id)a3;
- (void)hashtagViewDidDeactivateHashtag:(id)a3;
- (void)hashtagViewWillDeactivateHashtag:(id)a3;
- (void)layoutInlineViews;
- (void)layoutSubviews;
- (void)mentionView:(id)a3 registerCommand:(id)a4;
- (void)mentionViewDidActivateMention:(id)a3 withParticpant:(id)a4;
- (void)mentionViewDidDeactivateMention:(id)a3;
- (void)mentionViewWillDeactivateMention:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pixelAlignForContentScale:(double)a3 enclosingScrollView:(id)a4;
- (void)proofreadingView:(id)a3 didReplaceWithString:(id)a4;
- (void)recognitionController:(id)a3 foundDataDetectorItems:(id)a4;
- (void)recognitionController:(id)a3 foundHashtagItems:(id)a4;
- (void)recognitionController:(id)a3 foundMentionItems:(id)a4;
- (void)recognitionController:(id)a3 foundProofreadingItems:(id)a4;
- (void)removeDetectionViews;
- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 completion:(id)a6;
- (void)revealDetectionViews;
- (void)setAdditionalStrokes:(id)a3;
- (void)setCachedBounds:(CGRect)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setCurrentProgress:(id)a3;
- (void)setDataDetectorViews:(id)a3;
- (void)setDeferMentionUpdate:(BOOL)a3;
- (void)setDetectionViewsHidden:(BOOL)a3;
- (void)setDidReceiveTextConversion:(BOOL)a3;
- (void)setDrawing:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHashtagAndMentionsDelegate:(id)a3;
- (void)setHashtagViews:(id)a3;
- (void)setHideUntilScroll:(BOOL)a3;
- (void)setIgnoreInitialDetectionItemsForStatistics:(BOOL)a3;
- (void)setIsDraggingSelection:(BOOL)a3;
- (void)setIsSharedViaICloud:(BOOL)a3;
- (void)setMentionUUIDtoParticipant:(id)a3;
- (void)setMentionViews:(id)a3;
- (void)setPreviousDataDetectorItems:(id)a3;
- (void)setPreviousHashtagItems:(id)a3;
- (void)setPreviousMentionItems:(id)a3;
- (void)setPreviousProofreadingItems:(id)a3;
- (void)setProgressAlertController:(id)a3;
- (void)setProofreadingContainerView:(id)a3;
- (void)setProofreadingViews:(id)a3;
- (void)setRecognitionController:(id)a3;
- (void)setReflowingStrokeIds:(id)a3;
- (void)setSixChannelBlending:(BOOL)a3;
- (void)setTileContainerView:(id)a3;
- (void)setTileDrawingTransform:(CGAffineTransform *)a3;
- (void)setToolPickerVisible:(BOOL)a3;
- (void)setWantsDataDetection:(BOOL)a3;
- (void)setWantsHashtagDetection:(BOOL)a3;
- (void)setWantsMentionDetection:(BOOL)a3;
- (void)setWantsProofreadingDetection:(BOOL)a3;
- (void)toolPickerDidHide;
- (void)toolPickerDidShow;
- (void)updateAllPossibleParticipantNameTokens;
- (void)updateDataDetectorResults:(id)a3;
- (void)updateDetectionViewVisibility;
- (void)updateDetectionViews:(id)a3 withItems:(id)a4 previousItems:(id)a5;
- (void)updateDrawingHeight:(double)a3;
- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4;
- (void)updateHashtagResults:(id)a3;
- (void)updateMentionResults:(id)a3;
- (void)updateProofreadingResults:(id)a3;
- (void)updateTileContainerViewFrame;
- (void)visibleOnscreenBoundsDidChange:(CGRect)a3;
- (void)willMoveToWindow:(id)a3;
@end

@implementation PKAttachmentView

- (PKAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v34.receiver = self;
  v34.super_class = (Class)PKAttachmentView;
  v11 = -[PKAttachmentView initWithFrame:](&v34, sel_initWithFrame_, x, y, width, height);
  if (v11)
  {
    uint64_t v12 = [MEMORY[0x1E4F29128] UUID];
    listenerID = v11->_listenerID;
    v11->_listenerID = (NSUUID *)v12;

    id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PKAttachmentView *)v11 bounds];
    uint64_t v15 = objc_msgSend(v14, "initWithFrame:");
    tileContainerView = v11->_tileContainerView;
    v11->_tileContainerView = (UIView *)v15;

    [(UIView *)v11->_tileContainerView setUserInteractionEnabled:0];
    [(PKAttachmentView *)v11 addSubview:v11->_tileContainerView];
    id v17 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PKAttachmentView *)v11 bounds];
    uint64_t v18 = objc_msgSend(v17, "initWithFrame:");
    proofreadingContainerView = v11->_proofreadingContainerView;
    v11->_proofreadingContainerView = (UIView *)v18;

    [(UIView *)v11->_proofreadingContainerView setUserInteractionEnabled:0];
    [(PKAttachmentView *)v11 addSubview:v11->_proofreadingContainerView];
    v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    tiles = v11->_tiles;
    v11->_tiles = v20;

    v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    offscreenTiles = v11->_offscreenTiles;
    v11->_offscreenTiles = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    purgedTiles = v11->_purgedTiles;
    v11->_purgedTiles = v24;

    objc_storeStrong((id *)&v11->_drawing, a4);
    if (+[PKTiledView showDebugOutlines])
    {
      v26 = [(PKAttachmentView *)v11 layer];
      [v26 setBorderWidth:1.0];

      id v27 = [MEMORY[0x1E4FB1618] blueColor];
      uint64_t v28 = [v27 CGColor];
      v29 = [(PKAttachmentView *)v11 layer];
      [v29 setBorderColor:v28];
    }
    v30 = objc_alloc_init(PKStrokeSpatialCache);
    strokeSpatialCache = v11->_strokeSpatialCache;
    v11->_strokeSpatialCache = v30;

    v32 = v11->_strokeSpatialCache;
    if (v32) {
      objc_storeWeak((id *)&v32->_delegate, v11);
    }
    [(PKAttachmentView *)v11 _initializeRecognitionForDrawingIfNecessary:v11->_drawing];
  }

  return v11;
}

- (PKAttachmentView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = objc_alloc_init(PKDrawing);
  v9 = -[PKAttachmentView initWithFrame:drawing:](self, "initWithFrame:drawing:", v8, x, y, width, height);

  return v9;
}

- (PKAttachmentView)initWithCoder:(id)a3
{
  return -[PKAttachmentView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4 = [(PKAttachmentView *)self recognitionManager];
  -[PKRecognitionSessionManager removeListener:]((uint64_t)v4, self->_listenerID);

  v5.receiver = self;
  v5.super_class = (Class)PKAttachmentView;
  [(PKAttachmentView *)&v5 dealloc];
}

- (void)didMoveToSuperview
{
  v7.receiver = self;
  v7.super_class = (Class)PKAttachmentView;
  [(PKAttachmentView *)&v7 didMoveToSuperview];
  v3 = [(PKAttachmentView *)self superview];

  v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  objc_super v5 = v4;
  if (v3)
  {
    [v4 addObserver:self selector:sel__toolPickerDidShowHide_ name:@"PKToolPickerDidShowNotification" object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:self selector:sel__toolPickerDidShowHide_ name:@"PKToolPickerDidHideNotification" object:0];
  }
  else
  {
    [v4 removeObserver:self name:@"PKToolPickerDidShowNotification" object:0];

    v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 removeObserver:self name:@"PKToolPickerDidHideNotification" object:0];
  }
}

- (void)setTileDrawingTransform:(CGAffineTransform *)a3
{
  self->_didSetTileDrawingTransform = 1;
  long long v3 = *(_OWORD *)&a3->a;
  long long v4 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_tileDrawingTransform.c = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_tileDrawingTransform.tdouble x = v4;
  *(_OWORD *)&self->_tileDrawingTransform.a = v3;
}

- (CGAffineTransform)tileDrawingTransform
{
  if (!LOBYTE(self[8].tx)) {
    return (CGAffineTransform *)[(CGAffineTransform *)self drawingTransform];
  }
  long long v3 = *(_OWORD *)&self[14].a;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[13].tx;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[14].c;
  return self;
}

- (void)clearTileDrawingTransform
{
  self->_didSetTileDrawingTransform = 0;
}

- (BOOL)wantsFullyRendered
{
  return 0;
}

- (void)setAdditionalStrokes:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_super v5 = (NSArray *)[v4 count];
  if (v5) {
    objc_super v5 = (NSArray *)v4;
  }
  additionalStrokes = self->_additionalStrokes;
  self->_additionalStrokes = v5;

  if ([(PKAttachmentView *)self wantsProofreadingDetection]
    && self->_previousProofreadingItems
    && [v4 count])
  {
    [MEMORY[0x1E4F1CA48] arrayWithArray:self->_previousProofreadingItems];
    v25 = id v24 = v4;
    objc_super v7 = (void *)MEMORY[0x1E4F1CAD0];
    v8 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v4];
    v9 = +[PKStrokeProvider _identifiersForStrokes:v8];
    id v10 = [v7 setWithArray:v9];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    v23 = self;
    v11 = self->_proofreadingViews;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          id v17 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v18 = [v16 proofreadingItem];
          v19 = [v18 chStrokeIdentifiers];
          v20 = [v17 setWithArray:v19];

          if ([v20 intersectsSet:v10])
          {
            v21 = [v16 proofreadingItem];
            [v25 removeObject:v21];
          }
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v13);
    }

    uint64_t v22 = [v25 count];
    if (v22 != [(NSMutableArray *)v23->_previousProofreadingItems count]) {
      [(PKAttachmentView *)v23 updateDetectionViews:v23->_proofreadingViews withItems:v25 previousItems:v23->_previousProofreadingItems];
    }

    id v4 = v24;
  }
}

- (BOOL)disableTileAnimations
{
  return 0;
}

- (void)setContentHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_contentHidden = a3;
  id v4 = [(PKAttachmentView *)self tileContainerView];
  [v4 setHidden:v3];
}

- (void)setSixChannelBlending:(BOOL)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (self->_sixChannelBlending != a3)
  {
    BOOL v3 = a3;
    self->_sixChannelBlending = a3;
    objc_super v5 = [(PKAttachmentView *)self tileContainerView];
    v6 = [v5 layer];
    BOOL v7 = !v3;
    [v6 setAllowsGroupBlending:v7];

    v8 = [(PKAttachmentView *)self proofreadingContainerView];
    v9 = [v8 layer];
    [v9 setAllowsGroupBlending:v7];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = [(PKAttachmentView *)self tiles];
    v11 = [v10 allValues];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v11);
          }
          -[PKRendererTile purgeTileLayers](*(void *)(*((void *)&v17 + 1) + 8 * i));
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v13);
    }

    v16 = [(PKAttachmentView *)self tiles];
    [v16 removeAllObjects];

    [(NSMutableDictionary *)self->_purgedTiles removeAllObjects];
  }
}

- (id)hitMiniMenu:(CGPoint)a3
{
  return 0;
}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  return 0;
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  v7.CGFloat x = x;
  v7.CGFloat y = y;
  return CGRectContainsPoint(a4, v7);
}

- (void)_toolPickerDidShowHide:(id)a3
{
  id v10 = a3;
  id v4 = [v10 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"PKToolPickerNotificationWindowSceneUserInfoKey"];
  v6 = [(PKAttachmentView *)self window];
  CGPoint v7 = [v6 windowScene];

  v8 = v10;
  if (v5 == v7)
  {
    v9 = [v10 object];
    if ([v9 isVisible]) {
      [(PKAttachmentView *)self toolPickerDidShow];
    }
    else {
      [(PKAttachmentView *)self toolPickerDidHide];
    }

    v8 = v10;
  }
}

- (void)toolPickerDidShow
{
  self->_toolPickerVisible = 1;
  self->_hideUntilScroll = 0;
  [(PKAttachmentView *)self updateDetectionViewVisibility];
}

- (void)toolPickerDidHide
{
  self->_toolPickerVisible = 0;
  [(PKAttachmentView *)self updateDetectionViewVisibility];
}

- (void)drawingDidChange
{
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  if (a3)
  {
    [(NSMutableDictionary *)self->_purgedTiles removeAllObjects];
    strokeSpatialCache = self->_strokeSpatialCache;
    objc_super v5 = [(PKAttachmentView *)self drawing];
    -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)strokeSpatialCache, v5, 1, self->_cachedBounds.origin.x, self->_cachedBounds.origin.y, self->_cachedBounds.size.width, self->_cachedBounds.size.height);

    self->_hideUntilScroll = !self->_toolPickerVisible;
    [(PKAttachmentView *)self setDetectionViewsHidden:1];
    self->_ignoreInitialDetectionItemsForStatistics = 0;
  }
  else
  {
    [(NSMutableArray *)self->_hashtagViews makeObjectsPerformSelector:sel_updateActivationState];
    mentionViews = self->_mentionViews;
    [(NSMutableArray *)mentionViews makeObjectsPerformSelector:sel_updateActivationState];
  }
}

- (void)visibleOnscreenBoundsDidChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  self->_cachedBounds = a3;
  strokeSpatialCache = self->_strokeSpatialCache;
  v8 = [(PKAttachmentView *)self drawing];
  if (strokeSpatialCache)
  {
    v9 = v8;
    -[PKStrokeSpatialCache _invalidateCacheForBounds:inDrawing:force:]((uint64_t)strokeSpatialCache, v8, 0, x, y, width, height);
    v8 = v9;
  }
}

- (PKDrawing)drawing
{
  return self->_drawing;
}

- (void)setDrawing:(id)a3
{
  objc_super v5 = (PKDrawing *)a3;
  if (self->_drawing != v5)
  {
    objc_storeStrong((id *)&self->_drawing, a3);
    [(PKAttachmentView *)self _initializeRecognitionForDrawingIfNecessary:v5];
    [(PKAttachmentView *)self drawingDidChange];
  }
}

- (NSMutableDictionary)tiles
{
  return self->_tiles;
}

- (NSMutableDictionary)offscreenTiles
{
  return self->_offscreenTiles;
}

- (NSMutableDictionary)purgedTiles
{
  return self->_purgedTiles;
}

- (CGAffineTransform)drawingTransform
{
  [(PKAttachmentView *)self bounds];

  return CGAffineTransformMakeScale(retstr, v4 / 768.0, v4 / 768.0);
}

- (PKStrokeSpatialCache)strokeSpatialCache
{
  return self->_strokeSpatialCache;
}

- (UIView)tileContainerView
{
  return self->_tileContainerView;
}

- (BOOL)isAtEndOfDocument
{
  return 0;
}

- (BOOL)isExternalAttachment
{
  return 0;
}

- (void)didFinishCalculatingVisibleOnscreenStrokes:(id)a3 drawing:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(PKAttachmentView *)self drawing];
  char v9 = [v7 isEqual:v8];

  if ((v9 & 1) == 0)
  {
    id v10 = os_log_create("com.apple.pencilkit", "");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1C44F8000, v10, OS_LOG_TYPE_DEFAULT, "PKStrokeSpatialCache drawing did not match current drawing", v11, 2u);
    }
  }
  [(PKAttachmentView *)self _initializeRecognitionForDrawingIfNecessary:v7 withVisibleOnscreenStrokes:v6];
}

- (void)containingScrollViewDidScroll
{
  self->_hideUntilScroll = 0;
  if ([(PKAttachmentView *)self detectionViewsHidden])
  {
    [(PKAttachmentView *)self revealDetectionViews];
  }
}

- (void)pixelAlignForContentScale:(double)a3 enclosingScrollView:(id)a4
{
  id v6 = a4;
  id v7 = [v6 superview];
  [(PKAttachmentView *)self bounds];
  objc_msgSend(v7, "convertRect:fromView:", self);
  double v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  double v16 = DKDRoundedRectForScale(v9, v11, v13, v15, a3);
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [v6 superview];

  objc_msgSend(v23, "convertRect:toView:", self, v16, v18, v20, v22);
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  v32 = [(PKAttachmentView *)self tileContainerView];
  objc_msgSend(v32, "setFrame:", v25, v27, v29, v31);

  id v33 = [(PKAttachmentView *)self proofreadingContainerView];
  objc_msgSend(v33, "setFrame:", v25, v27, v29, v31);
}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  [a3 bounds];
  CGFloat v6 = CGRectGetMaxY(v10) + a4;
  [(PKAttachmentView *)self drawingTransform];
  return v6 * sqrt(v9 * v9 + v8 * v8);
}

- (void)updateDrawingHeight:(double)a3
{
  id v4 = [(PKAttachmentView *)self drawing];
  objc_msgSend(v4, "set_canvasBounds:", 0.0, 0.0, 768.0, a3);
}

- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKAttachmentView *)self updateDrawingHeight:a3];
  if (v4)
  {
    [(PKAttachmentView *)self drawingDidChange];
  }
}

- (void)updateTileContainerViewFrame
{
  [(PKAttachmentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  CGFloat v11 = [(PKAttachmentView *)self tileContainerView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  [(PKAttachmentView *)self bounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  id v20 = [(PKAttachmentView *)self proofreadingContainerView];
  objc_msgSend(v20, "setFrame:", v13, v15, v17, v19);
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKAttachmentView;
  -[PKAttachmentView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(PKAttachmentView *)self updateTileContainerViewFrame];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKAttachmentView;
  [(PKAttachmentView *)&v4 layoutSubviews];
  double v3 = [(PKAttachmentView *)self tileMaskView];
  [v3 setClipsToBounds:1];

  [(PKAttachmentView *)self updateTileContainerViewFrame];
  [(PKAttachmentView *)self layoutInlineViews];
}

- (void)didBeginDrawing
{
}

- (void)endedStroke:(id)a3
{
  self->_latestEndOfStrokeTimestamp = CACurrentMediaTime();
}

- (void)setReflowingStrokeIds:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  double v22 = self;
  id obj = [(PKAttachmentView *)self proofreadingViews];
  uint64_t v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v21 = *(void *)v28;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v27 + 1) + 8 * v7);
        double v9 = [(PKAttachmentView *)v22 drawing];
        double v10 = [v8 proofreadingItem];
        CGFloat v11 = [v10 chStrokeIdentifiers];
        double v12 = [v9 strokesForCHStrokeIdentifiers:v11];

        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        id v13 = v12;
        uint64_t v14 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v24;
          do
          {
            uint64_t v17 = 0;
            do
            {
              if (*(void *)v24 != v16) {
                objc_enumerationMutation(v13);
              }
              double v18 = [*(id *)(*((void *)&v23 + 1) + 8 * v17) _strokeUUID];
              int v19 = [v4 containsObject:v18];

              if (v19) {
                [v8 ensureViewIsVisible];
              }
              ++v17;
            }
            while (v15 != v17);
            uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v15);
        }

        ++v7;
      }
      while (v7 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }
}

- (void)didBeginModifyDrawing
{
  self->_isDraggingSelection = 1;
  [(PKAttachmentView *)self updateDetectionViewVisibility];
}

- (void)didEndModifyDrawing
{
  self->_isDraggingSelection = 0;
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3
{
  return 0;
}

- (BOOL)_handleSingleTapAtDrawingLocation:(CGPoint)a3 fromTapStroke:(BOOL)a4
{
  return 0;
}

- (PKRecognitionSessionManager)recognitionManager
{
  recognitionController = self->_recognitionController;
  if (recognitionController) {
    return recognitionController->_sessionManager;
  }
  else {
    return 0;
  }
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3
{
}

- (PKRecognitionController)recognitionController
{
  recognitionController = self->_recognitionController;
  if (!recognitionController)
  {
    id v4 = [(PKAttachmentView *)self drawing];
    [(PKAttachmentView *)self _initializeRecognitionForDrawingIfNecessary:v4 withVisibleOnscreenStrokes:0 createIfDrawingIfEmpty:1];

    recognitionController = self->_recognitionController;
  }

  return recognitionController;
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4
{
}

- (void)_initializeRecognitionForDrawingIfNecessary:(id)a3 withVisibleOnscreenStrokes:(id)a4 createIfDrawingIfEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  if (self->_recognitionController || [v8 _isEmpty] && !v5)
  {
    uint64_t v10 = [v9 count];
    recognitionController = self->_recognitionController;
    if (v10) {
      [(PKRecognitionController *)recognitionController setDrawing:v8 withVisibleOnscreenStrokes:v9];
    }
    else {
      [(PKRecognitionController *)recognitionController setDrawing:v8];
    }
  }
  else
  {
    double v12 = [[PKRecognitionController alloc] initWithDrawing:v8 visibleOnscreenStrokes:v9];
    id v13 = self->_recognitionController;
    self->_recognitionController = v12;

    uint64_t v14 = self->_recognitionController;
    if (v14) {
      uint64_t v14 = (PKRecognitionController *)v14->_sessionManager;
    }
    uint64_t v15 = v14;
    -[PKRecognitionSessionManager addListener:]((uint64_t)v15, self->_listenerID);

    uint64_t v16 = self->_recognitionController;
    if (v16) {
      objc_storeWeak((id *)&v16->_internalDelegate, self);
    }
    uint64_t v17 = [(PKAttachmentView *)self window];
    if (v17) {
      char wantsDataDetection = self->_wantsDataDetection;
    }
    else {
      char wantsDataDetection = 0;
    }
    int v19 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v19, wantsDataDetection);

    id v20 = [(PKAttachmentView *)self window];
    if (v20) {
      char wantsHashtagDetection = self->_wantsHashtagDetection;
    }
    else {
      char wantsHashtagDetection = 0;
    }
    double v22 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v22, wantsHashtagDetection);

    long long v23 = [(PKAttachmentView *)self window];
    if (v23) {
      char wantsMentionDetection = self->_wantsMentionDetection;
    }
    else {
      char wantsMentionDetection = 0;
    }
    long long v25 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v25, wantsMentionDetection);

    long long v26 = [(PKAttachmentView *)self window];
    if (v26) {
      BOOL wantsProofreadingDetection = self->_wantsProofreadingDetection;
    }
    else {
      BOOL wantsProofreadingDetection = 0;
    }
    long long v28 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v28, wantsProofreadingDetection);

    [(PKAttachmentView *)self _handleAutoRefineSettingsDidChange];
    if (!self->_settingsObserver)
    {
      objc_initWeak(&location, self);
      long long v29 = [PKAutoRefineSettingsObserver alloc];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke;
      v32[3] = &unk_1E64C6690;
      objc_copyWeak(&v33, &location);
      long long v30 = (PKAutoRefineSettingsObserver *)-[PKAutoRefineSettingsObserver initWithHandler:](v29, v32);
      settingsObserver = self->_settingsObserver;
      self->_settingsObserver = v30;

      objc_destroyWeak(&v33);
      objc_destroyWeak(&location);
    }
  }
}

void __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke_2;
  v4[3] = &unk_1E64C5998;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  PKPerformOnMainThread(v4);
  objc_destroyWeak(&v5);
}

void __114__PKAttachmentView__initializeRecognitionForDrawingIfNecessary_withVisibleOnscreenStrokes_createIfDrawingIfEmpty___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleAutoRefineSettingsDidChange];
}

- (void)_handleAutoRefineSettingsDidChange
{
  id v3 = os_log_create("com.apple.pencilkit", "AttachmentView");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1C44F8000, v3, OS_LOG_TYPE_DEFAULT, "handle AutoRefine settings did change", v8, 2u);
  }

  BOOL v4 = [(PKAttachmentView *)self wantsAutoRefine];
  id v5 = [(PKAttachmentView *)self recognitionManager];
  -[PKRecognitionSessionManager setWantsAutoRefine:]((uint64_t)v5, v4);

  if (v4)
  {
    uint64_t v6 = [(PKAttachmentView *)self tiledView];
    uint64_t v7 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setAutoRefineViewDelegate:]((uint64_t)v7, v6);
  }
  else
  {
    uint64_t v6 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setAutoRefineViewDelegate:]((uint64_t)v6, 0);
  }
}

- (void)fetchIntersectedStrokesAtPoint:(CGPoint)a3 selectionType:(int64_t)a4 inputType:(int64_t)a5 visibleOnscreenStrokes:(id)a6 completion:(id)a7
{
  double y = a3.y;
  double x = a3.x;
  id v13 = a7;
  id v14 = a6;
  id v15 = [(PKAttachmentView *)self recognitionManager];
  [(PKRecognitionSessionManager *)(uint64_t)v15 fetchIntersectedStrokesAtPoint:a5 selectionType:v14 inputType:v13 visibleOnscreenStrokes:x completion:y];
}

- (void)fetchIntersectedStrokesBetweenTopPoint:(CGPoint)a3 bottomPoint:(CGPoint)a4 liveScrollOffset:(CGPoint)a5 completion:(id)a6
{
  double y = a5.y;
  double x = a5.x;
  double v8 = a4.y;
  double v9 = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  id v13 = a6;
  id v14 = [(PKAttachmentView *)self recognitionManager];
  -[PKRecognitionSessionManager fetchIntersectedStrokesBetweenTopPoint:bottomPoint:liveScrollOffset:isRTL:completion:](v14, [(PKAttachmentView *)self isRTL], v13, v11, v10, v9, v8, x, y);
}

- (BOOL)isRTL
{
  return [(PKAttachmentView *)self effectiveUserInterfaceLayoutDirection] == 1;
}

- (id)_firstStrokesInSelectedStrokes:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self recognitionManager];
  uint64_t v6 = -[PKRecognitionSessionManager _firstStrokesInSelectedStrokes:isRTL:](v5, v4, [(PKAttachmentView *)self isRTL]);

  return v6;
}

- (id)_lastStrokesInSelectedStrokes:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self recognitionManager];
  uint64_t v6 = -[PKRecognitionSessionManager _lastStrokesInSelectedStrokes:isRTL:](v5, v4, [(PKAttachmentView *)self isRTL]);

  return v6;
}

- (void)fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  double v8 = [(PKAttachmentView *)self recognitionManager];
  -[PKRecognitionSessionManager fetchStrokesAmbiguouslyBelowAndAboveInsertSpaceHandleWithStrokes:completion:](v8, v7, v6);
}

- (int64_t)contentTypeForIntersectedStrokes:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self recognitionManager];
  int64_t v6 = -[PKRecognitionSessionManager contentTypeForIntersectedStrokes:]((uint64_t)v5, v4);

  return v6;
}

- (void)_willEnterForeground:(id)a3
{
}

- (void)_didEnterBackground:(id)a3
{
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PKAttachmentView;
  [(PKAttachmentView *)&v20 willMoveToWindow:v4];
  [(PKAttachmentView *)self setWantsDataDetection:0];
  [(PKAttachmentView *)self setWantsHashtagDetection:0];
  [(PKAttachmentView *)self setWantsMentionDetection:0];
  [(PKAttachmentView *)self setWantsProofreadingDetection:0];
  [(PKAttachmentView *)self removeDetectionViews];
  id v5 = (uint64_t *)MEMORY[0x1E4FB2EB0];
  int64_t v6 = (uint64_t *)MEMORY[0x1E4FB2E90];
  if (v4)
  {
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v8 = *v5;
    double v9 = [v4 windowScene];
    [v7 addObserver:self selector:sel__willEnterForeground_ name:v8 object:v9];

    double v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v11 = *v6;
    double v12 = [v4 windowScene];
    [v10 addObserver:self selector:sel__didEnterBackground_ name:v11 object:v12];
  }
  id v13 = [(PKAttachmentView *)self window];
  if (v13)
  {
    id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v15 = *v5;
    uint64_t v16 = [v13 windowScene];
    [v14 removeObserver:self name:v15 object:v16];

    uint64_t v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v18 = *v6;
    int v19 = [v13 windowScene];
    [v17 removeObserver:self name:v18 object:v19];
  }
}

- (void)removeDetectionViews
{
  id v3 = [(PKAttachmentView *)self dataDetectorViews];
  [v3 makeObjectsPerformSelector:sel_removeFromSuperview];

  id v4 = [(PKAttachmentView *)self dataDetectorViews];
  [v4 removeAllObjects];

  id v5 = [(PKAttachmentView *)self previousDataDetectorItems];
  [v5 removeAllObjects];

  int64_t v6 = [(PKAttachmentView *)self hashtagViews];
  [v6 makeObjectsPerformSelector:sel_removeFromSuperview];

  id v7 = [(PKAttachmentView *)self hashtagViews];
  [v7 removeAllObjects];

  uint64_t v8 = [(PKAttachmentView *)self previousHashtagItems];
  [v8 removeAllObjects];

  double v9 = [(PKAttachmentView *)self mentionViews];
  [v9 makeObjectsPerformSelector:sel_removeFromSuperview];

  double v10 = [(PKAttachmentView *)self mentionViews];
  [v10 removeAllObjects];

  id v11 = [(PKAttachmentView *)self previousMentionItems];
  [v11 removeAllObjects];
}

- (void)didMoveToWindow
{
  v16.receiver = self;
  v16.super_class = (Class)PKAttachmentView;
  [(PKAttachmentView *)&v16 didMoveToWindow];
  id v3 = [(PKAttachmentView *)self window];

  if (v3)
  {
    char wantsDataDetection = self->_wantsDataDetection;
    id v5 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v5, wantsDataDetection);

    char wantsHashtagDetection = self->_wantsHashtagDetection;
    id v7 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v7, wantsHashtagDetection);

    char wantsMentionDetection = self->_wantsMentionDetection;
    double v9 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v9, wantsMentionDetection);

    BOOL wantsProofreadingDetection = self->_wantsProofreadingDetection;
    id v11 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v11, wantsProofreadingDetection);

    uint64_t v12 = [(PKAttachmentView *)self window];
    [(PKAttachmentView *)self setToolPickerVisible:+[PKToolPicker isActiveToolPickerVisibleForWindow:v12]];

    self->_ignoreInitialDetectionItemsForStatistics = 1;
    [(PKAttachmentView *)self _handleAutoRefineSettingsDidChange];
    id v13 = [(PKAttachmentView *)self drawing];
    LOBYTE(v12) = [v13 _isEmpty];

    if ((v12 & 1) == 0)
    {
      id v14 = [(PKAttachmentView *)self tiledView];
      uint64_t v15 = [v14 welcomeController];
      [v15 showPencilEducationPane];
    }
  }
}

- (void)setWantsDataDetection:(BOOL)a3
{
  if (self->_wantsDataDetection != a3)
  {
    self->_char wantsDataDetection = a3;
    id v4 = [(PKAttachmentView *)self window];
    char v5 = v4 && self->_wantsDataDetection;
    int64_t v6 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsDataDetection:]((uint64_t)v6, v5);

    if (self->_wantsDataDetection && !self->_dataDetectorViews)
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
      dataDetectorViews = self->_dataDetectorViews;
      self->_dataDetectorViews = v7;

      double v9 = [MEMORY[0x1E4F1CA48] array];
      previousDataDetectorItems = self->_previousDataDetectorItems;
      self->_previousDataDetectorItems = v9;
    }
  }
}

- (void)setWantsHashtagDetection:(BOOL)a3
{
  if (self->_wantsHashtagDetection != a3)
  {
    self->_char wantsHashtagDetection = a3;
    id v4 = [(PKAttachmentView *)self window];
    char v5 = v4 && self->_wantsHashtagDetection;
    int64_t v6 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsHashtagDetection:]((uint64_t)v6, v5);

    if (self->_wantsHashtagDetection && !self->_hashtagViews)
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
      hashtagViews = self->_hashtagViews;
      self->_hashtagViews = v7;

      double v9 = [MEMORY[0x1E4F1CA48] array];
      previousHashtagItems = self->_previousHashtagItems;
      self->_previousHashtagItems = v9;
    }
  }
}

- (void)setWantsMentionDetection:(BOOL)a3
{
  if (self->_wantsMentionDetection != a3)
  {
    self->_char wantsMentionDetection = a3;
    id v4 = [(PKAttachmentView *)self window];
    char v5 = v4 && self->_wantsMentionDetection;
    int64_t v6 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsMentionDetection:]((uint64_t)v6, v5);

    if (self->_wantsMentionDetection && !self->_mentionViews)
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
      mentionViews = self->_mentionViews;
      self->_mentionViews = v7;

      double v9 = [MEMORY[0x1E4F1CA48] array];
      previousMentionItems = self->_previousMentionItems;
      self->_previousMentionItems = v9;
    }
  }
}

- (void)setWantsProofreadingDetection:(BOOL)a3
{
  if (self->_wantsProofreadingDetection != a3)
  {
    self->_BOOL wantsProofreadingDetection = a3;
    id v4 = [(PKAttachmentView *)self window];
    BOOL v5 = v4 && self->_wantsProofreadingDetection;
    int64_t v6 = [(PKAttachmentView *)self recognitionManager];
    -[PKRecognitionSessionManager setWantsProofreadingDetection:]((uint64_t)v6, v5);

    if (self->_wantsProofreadingDetection && !self->_proofreadingViews)
    {
      id v7 = [MEMORY[0x1E4F1CA48] array];
      proofreadingViews = self->_proofreadingViews;
      self->_proofreadingViews = v7;

      double v9 = [MEMORY[0x1E4F1CA48] array];
      previousProofreadingItems = self->_previousProofreadingItems;
      self->_previousProofreadingItems = v9;
    }
  }
}

- (BOOL)wantsAutoRefine
{
  id v3 = [(PKAttachmentView *)self window];
  if (v3)
  {
    id v4 = [(PKAttachmentView *)self tiledView];
    char v5 = [v4 isAutoRefineEnabled];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)recognitionController:(id)a3 foundDataDetectorItems:(id)a4
{
}

- (void)recognitionController:(id)a3 foundHashtagItems:(id)a4
{
}

- (void)recognitionController:(id)a3 foundMentionItems:(id)a4
{
}

- (void)recognitionController:(id)a3 foundProofreadingItems:(id)a4
{
}

- (BOOL)canConvertTextToHandwriting:(id)a3
{
  id v4 = a3;
  char v5 = [(PKAttachmentView *)self recognitionController];
  char v6 = [v5 canConvertTextToHandwriting:v4];

  return v6;
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 inkColor:(id)a6 completion:(id)a7
{
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 inkColor:(id)a5 completion:(id)a6
{
}

- (void)convertTextToHandwriting:(id)a3 bounds:(CGRect)a4 suggestedHeight:(double)a5 suggestedDrawing:(id)a6 inkColor:(id)a7 completion:(id)a8
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v17 = a3;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v19)
  {
    id v21 = v19;
  }
  else
  {
    id v21 = [(PKAttachmentView *)self tintColor];
  }
  double v22 = v21;
  long long v23 = [(PKAttachmentView *)self tiledView];
  [v23 inputScale];
  double v25 = v24;

  self->_didReceiveTextConversion = 0;
  long long v26 = [(PKAttachmentView *)self recognitionController];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke;
  v30[3] = &unk_1E64C66E0;
  v30[4] = self;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_3;
  v28[3] = &unk_1E64C6708;
  v28[4] = self;
  id v29 = v20;
  id v27 = v20;
  objc_msgSend(v26, "convertTextToHandwriting:bounds:inkColor:inputScale:suggestedHeight:suggestedDrawing:progress:completion:", v17, v22, v18, v30, v28, x, y, width, height, v25, a5);
}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  dispatch_time_t v4 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_2;
  block[3] = &unk_1E64C66B8;
  objc_copyWeak(&v8, &location);
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v5 = WeakRetained;
      char v4 = [WeakRetained didReceiveTextConversion];
      id v3 = v5;
      if ((v4 & 1) == 0)
      {
        [v5 _showHUDWithProgress:*(void *)(a1 + 32)];
        id v3 = v5;
      }
    }
  }
}

void __105__PKAttachmentView_convertTextToHandwriting_bounds_suggestedHeight_suggestedDrawing_inkColor_completion___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v9 = a2;
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1 + 32) + 501) = 1;
  if ([v9 count] && objc_msgSend(v7, "count") && objc_msgSend(v8, "count"))
  {
    [*(id *)(a1 + 32) _hideHUD];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)replaceStrokes:(id)a3 withString:(id)a4 inBounds:(CGRect)a5 completion:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  objc_super v16 = [(PKAttachmentView *)self tiledView];
  [v16 inputScale];
  double v18 = v17;

  id v19 = [(PKAttachmentView *)self recognitionController];
  objc_msgSend(v19, "replaceStrokes:withString:inBounds:inputScale:completion:", v15, v14, v13, x, y, width, height, v18);
}

- (void)_showHUDWithProgress:(id)a3
{
  char v4 = (NSProgress *)a3;
  id v5 = _PencilKitBundle();
  id v16 = [v5 localizedStringForKey:@"Converting text to handwriting…" value:@"Converting text to handwriting…" table:@"Localizable"];

  char v6 = _PencilKitBundle();
  id v7 = [v6 localizedStringForKey:@"Cancel converting to handwriting" value:@"Cancel" table:@"Localizable"];

  id v8 = +[PKProgressAlertController newProgressAlertControllerWithTitle:v16 cancel:v7];
  progressAlertController = self->_progressAlertController;
  self->_progressAlertController = v8;

  [(PKProgressAlertController *)self->_progressAlertController setDelegate:self];
  double v10 = self->_progressAlertController;
  [(NSProgress *)v4 fractionCompleted];
  -[PKProgressAlertController setProgress:](v10, "setProgress:");
  currentProgress = self->_currentProgress;
  self->_currentProgress = v4;
  uint64_t v12 = v4;

  [(NSProgress *)self->_currentProgress addObserver:self forKeyPath:@"fractionCompleted" options:3 context:PKInkSynthesisContext];
  id v13 = [(PKAttachmentView *)self viewRep];
  id v14 = [v13 window];
  id v15 = [v14 rootViewController];
  [v15 presentViewController:self->_progressAlertController animated:1 completion:&__block_literal_global_11];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if ((void *)PKInkSynthesisContext == a6)
  {
    if (objc_msgSend(MEMORY[0x1E4F29060], "isMainThread", a3, a4, a5))
    {
      [(PKAttachmentView *)self _progressChanged];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __67__PKAttachmentView_observeValueForKeyPath_ofObject_change_context___block_invoke;
      block[3] = &unk_1E64C61C0;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __67__PKAttachmentView_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _progressChanged];
}

- (void)_progressChanged
{
  id v3 = [(PKProgressAlertController *)self->_progressAlertController presentingViewController];

  if (v3)
  {
    progressAlertController = self->_progressAlertController;
    [(NSProgress *)self->_currentProgress fractionCompleted];
    -[PKProgressAlertController setProgress:](progressAlertController, "setProgress:");
  }
}

- (void)_unregisterProgressObserver
{
  [(NSProgress *)self->_currentProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PKInkSynthesisContext];
  currentProgress = self->_currentProgress;
  self->_currentProgress = 0;
}

- (void)_hideHUD
{
  [(PKAttachmentView *)self _unregisterProgressObserver];
  progressAlertController = self->_progressAlertController;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PKAttachmentView__hideHUD__block_invoke;
  v4[3] = &unk_1E64C61C0;
  void v4[4] = self;
  [(PKProgressAlertController *)progressAlertController dismissViewControllerAnimated:1 completion:v4];
}

void __28__PKAttachmentView__hideHUD__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 600);
  *(void *)(v1 + 600) = 0;
}

- (BOOL)_isDrawing
{
  v2 = [(PKAttachmentView *)self tiledView];
  id v3 = [v2 canvasView];
  char v4 = [v3 isHidden] ^ 1;

  return v4;
}

- (BOOL)shouldDiscardEndedStroke:(id)a3
{
  return 0;
}

- (void)setHashtagAndMentionsDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_hashtagAndMentionsDelegate, obj);
    [(PKAttachmentView *)self updateAllPossibleParticipantNameTokens];
    id v5 = obj;
  }
}

- (void)updateDetectionViews:(id)a3 withItems:(id)a4 previousItems:(id)a5
{
  uint64_t v166 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v124 = a4;
  id v119 = a5;
  BOOL ignoreInitialDetectionItemsForStatistics = self->_ignoreInitialDetectionItemsForStatistics;
  id v9 = [MEMORY[0x1E4F1CA48] array];
  long long v155 = 0u;
  long long v156 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  double v10 = (NSMutableArray *)v8;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v155 objects:v165 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v156;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v156 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v155 + 1) + 8 * i);
        id v16 = [v15 item];
        char v17 = [v124 containsObject:v16];

        if ((v17 & 1) == 0)
        {
          [v9 addObject:v15];
          double v18 = [v15 item];
          [v119 removeObject:v18];

          id v19 = [v15 item];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v21 = +[PKStatisticsManager sharedStatisticsManager]();
            double v22 = [v15 item];
            -[PKStatisticsManager recordDataDetectorItemRemove:]((uint64_t)v21, v22);
          }
          else
          {
            long long v23 = [v15 item];
            objc_opt_class();
            char v24 = objc_opt_isKindOfClass();

            uint64_t v25 = +[PKStatisticsManager sharedStatisticsManager]();
            id v21 = (void *)v25;
            if (v24) {
              -[PKStatisticsManager recordHashtagItemRemove](v25);
            }
            else {
              -[PKStatisticsManager recordMentionItemRemove](v25);
            }
          }
        }
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v155 objects:v165 count:16];
    }
    while (v12);
  }

  long long v153 = 0u;
  long long v154 = 0u;
  long long v151 = 0u;
  long long v152 = 0u;
  id obj = v9;
  uint64_t v26 = [obj countByEnumeratingWithState:&v151 objects:v164 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v152;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v152 != v28) {
          objc_enumerationMutation(obj);
        }
        long long v30 = *(void **)(*((void *)&v151 + 1) + 8 * v29);
        if (self->_detectionViewsHidden)
        {
          [*(id *)(*((void *)&v151 + 1) + 8 * v29) removeFromSuperview];
        }
        else
        {
          v150[0] = MEMORY[0x1E4F143A8];
          v150[1] = 3221225472;
          v150[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke;
          v150[3] = &unk_1E64C61C0;
          v150[4] = v30;
          v149[0] = MEMORY[0x1E4F143A8];
          v149[1] = 3221225472;
          v149[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_2;
          v149[3] = &unk_1E64C6730;
          v149[4] = v30;
          [MEMORY[0x1E4FB1EB0] animateWithDuration:v150 animations:v149 completion:0.15];
        }
        if (!ignoreInitialDetectionItemsForStatistics)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v31 = [v30 item];
            int v32 = [v31 active];

            if (v32)
            {
              [(PKAttachmentView *)self hashtagViewWillDeactivateHashtag:v30];
              [(PKAttachmentView *)self hashtagViewDidDeactivateHashtag:v30];
            }
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v33 = [v30 item];
              int v34 = [v33 active];

              if (v34)
              {
                [(PKAttachmentView *)self mentionViewWillDeactivateMention:v30];
                [(PKAttachmentView *)self mentionViewDidDeactivateMention:v30];
              }
            }
          }
        }
        ++v29;
      }
      while (v27 != v29);
      uint64_t v35 = [obj countByEnumeratingWithState:&v151 objects:v164 count:16];
      uint64_t v27 = v35;
    }
    while (v35);
  }

  [(NSMutableArray *)v10 removeObjectsInArray:obj];
  uint64_t v36 = 552;
  uint64_t v113 = 552;
  if (self->_hashtagViews == v10)
  {
    v37 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
    v38 = [v37 allConfirmedHashtagsForAttachmentView:self];

    long long v147 = 0u;
    long long v148 = 0u;
    long long v145 = 0u;
    long long v146 = 0u;
    v122 = v10;
    uint64_t v39 = [(NSMutableArray *)v122 countByEnumeratingWithState:&v145 objects:v163 count:16];
    if (v39)
    {
      uint64_t v40 = v39;
      uint64_t v41 = *(void *)v146;
      do
      {
        for (uint64_t j = 0; j != v40; ++j)
        {
          if (*(void *)v146 != v41) {
            objc_enumerationMutation(v122);
          }
          v43 = *(void **)(*((void *)&v145 + 1) + 8 * j);
          v44 = objc_msgSend(v43, "hashtagItem", v113);
          v45 = [v44 hashtagUUID];
          char v46 = [v38 containsObject:v45];

          if ((v46 & 1) == 0)
          {
            v47 = [v43 item];
            int v48 = [v47 active];

            if (v48)
            {
              [(PKAttachmentView *)self hashtagViewWillDeactivateHashtag:v43];
              v49 = [v43 item];
              v50 = [(PKAttachmentView *)self drawing];
              [v49 clearActiveInDrawing:v50];

              [(PKAttachmentView *)self hashtagViewDidDeactivateHashtag:v43];
            }
          }
        }
        uint64_t v40 = [(NSMutableArray *)v122 countByEnumeratingWithState:&v145 objects:v163 count:16];
      }
      while (v40);
    }

    uint64_t v36 = v113;
  }
  -[NSMutableArray makeObjectsPerformSelector:](v10, "makeObjectsPerformSelector:", sel_setNeedsDisplay, v113);
  v51 = [MEMORY[0x1E4F1CA48] array];
  if ([v119 count])
  {
    long long v143 = 0u;
    long long v144 = 0u;
    long long v141 = 0u;
    long long v142 = 0u;
    id v52 = v124;
    uint64_t v53 = [v52 countByEnumeratingWithState:&v141 objects:v162 count:16];
    if (v53)
    {
      uint64_t v54 = v53;
      uint64_t v55 = *(void *)v142;
      do
      {
        for (uint64_t k = 0; k != v54; ++k)
        {
          if (*(void *)v142 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v141 + 1) + 8 * k);
          if (([v119 containsObject:v57] & 1) == 0) {
            [v51 addObject:v57];
          }
        }
        uint64_t v54 = [v52 countByEnumeratingWithState:&v141 objects:v162 count:16];
      }
      while (v54);
    }

    uint64_t v36 = v114;
  }
  else
  {
    [v51 addObjectsFromArray:v124];
  }
  [v119 addObjectsFromArray:v51];
  if (!ignoreInitialDetectionItemsForStatistics && [v51 count])
  {
    long long v139 = 0u;
    long long v140 = 0u;
    long long v137 = 0u;
    long long v138 = 0u;
    id v58 = v51;
    uint64_t v59 = [v58 countByEnumeratingWithState:&v137 objects:v161 count:16];
    if (v59)
    {
      uint64_t v60 = v59;
      uint64_t v61 = *(void *)v138;
      do
      {
        for (uint64_t m = 0; m != v60; ++m)
        {
          if (*(void *)v138 != v61) {
            objc_enumerationMutation(v58);
          }
          v63 = *(void **)(*((void *)&v137 + 1) + 8 * m);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v64 = +[PKStatisticsManager sharedStatisticsManager]();
            -[PKStatisticsManager recordDataDetectorItemAdd:]((uint64_t)v64, v63);
          }
          else
          {
            objc_opt_class();
            char v65 = objc_opt_isKindOfClass();
            uint64_t v66 = +[PKStatisticsManager sharedStatisticsManager]();
            v64 = (void *)v66;
            if (v65) {
              -[PKStatisticsManager recordHashtagItemAdd](v66);
            }
            else {
              -[PKStatisticsManager recordMentionItemAdd](v66);
            }
          }
        }
        uint64_t v60 = [v58 countByEnumeratingWithState:&v137 objects:v161 count:16];
      }
      while (v60);
    }

    uint64_t v36 = v114;
  }
  v67 = [(PKAttachmentView *)self dataDetectorViews];

  if (v67 == v10)
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v124, "count"));
    id v123 = (id)objc_claimAutoreleasedReturnValue();
    long long v133 = 0u;
    long long v134 = 0u;
    long long v135 = 0u;
    long long v136 = 0u;
    id v68 = v124;
    uint64_t v69 = [v68 countByEnumeratingWithState:&v133 objects:v160 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v134;
      do
      {
        for (uint64_t n = 0; n != v70; ++n)
        {
          if (*(void *)v134 != v71) {
            objc_enumerationMutation(v68);
          }
          objc_msgSend(v123, "addObject:", objc_msgSend(*(id *)(*((void *)&v133 + 1) + 8 * n), "coreResult"));
        }
        uint64_t v70 = [v68 countByEnumeratingWithState:&v133 objects:v160 count:16];
      }
      while (v70);
    }
  }
  else
  {
    id v123 = 0;
  }
  v73 = [(PKAttachmentView *)self tileContainerView];
  long long v129 = 0u;
  long long v130 = 0u;
  long long v131 = 0u;
  long long v132 = 0u;
  id v120 = v51;
  uint64_t v74 = [v120 countByEnumeratingWithState:&v129 objects:v159 count:16];
  if (v74)
  {
    uint64_t v75 = v74;
    uint64_t v76 = *(void *)v130;
    unint64_t v77 = 0x1EB3C3000uLL;
    v117 = v10;
    do
    {
      uint64_t v78 = 0;
      uint64_t v118 = v75;
      do
      {
        if (*(void *)v130 != v76) {
          objc_enumerationMutation(v120);
        }
        v79 = *(void **)(*((void *)&v129 + 1) + 8 * v78);
        if (*(NSMutableArray **)((char *)&self->super.super.super.isa + *(int *)(v77 + 2924)) == v10)
        {
          v82 = [[PKDataDetectorView alloc] initWithDataDetectorItem:v79 allItems:v123];
          if (!v82) {
            goto LABEL_124;
          }
          goto LABEL_120;
        }
        if (*(NSMutableArray **)((char *)&self->super.super.super.isa + v36) != v10)
        {
          if (self->_mentionViews != v10)
          {
            if (self->_proofreadingViews != v10) {
              goto LABEL_124;
            }
            v80 = [PKProofreadingView alloc];
            v81 = [(PKAttachmentView *)self drawing];
            v82 = [(PKProofreadingView *)v80 initWithProofreadingItem:v79 inDrawing:v81];

            unint64_t v77 = 0x1EB3C3000;
            [(PKDataDetectorView *)v82 setDelegate:self];
            v83 = self->_proofreadingContainerView;

            v73 = v83;
            if (!v82) {
              goto LABEL_124;
            }
            goto LABEL_120;
          }
          v90 = [*(id *)(*((void *)&v129 + 1) + 8 * v78) mentionResult];
          v91 = objc_msgSend(v90, "stringByReplacingCharactersInRange:withString:", 0, 1, &stru_1F1FB2C00);

          v92 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
          v93 = [v92 attachmentView:self participantMatchesForMentionText:v91];

          if ([v93 count])
          {
            v116 = v73;
            v94 = [PKMentionView alloc];
            v95 = [(PKAttachmentView *)self drawing];
            v82 = [(PKMentionView *)v94 initWithMentionItem:v79 possibleParticipants:v93 inDrawing:v95];

            [(PKDataDetectorView *)v82 setDelegate:self];
            v96 = [(PKDataDetectorView *)v82 mentionItem];
            LODWORD(v95) = [v96 active];

            if (v95)
            {
              v115 = v91;
              v97 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
              v98 = [v97 allConfirmedMentionsForAttachmentView:self];

              if (!self->_mentionUUIDtoParticipant)
              {
                v99 = [v98 mutableCopy];
                mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
                self->_mentionUUIDtoParticipant = v99;
              }
              v101 = [(PKDataDetectorView *)v82 mentionItem];
              v102 = [v101 mentionUUID];

              v103 = [v98 objectForKeyedSubscript:v102];
              if (v103)
              {
LABEL_104:
                v105 = [v103 color];
                [(PKDataDetectorView *)v82 setMentionColor:v105];
              }
              else
              {
                uint64_t v104 = [(NSMutableDictionary *)self->_mentionUUIDtoParticipant objectForKeyedSubscript:v102];
                if (v104)
                {
                  v103 = (void *)v104;
                  [(PKAttachmentView *)self mentionViewDidActivateMention:v82 withParticpant:v104];
                  goto LABEL_104;
                }
                v103 = [(PKDataDetectorView *)v82 mentionItem];
                v105 = [(PKAttachmentView *)self drawing];
                [v103 clearActiveInDrawing:v105];
              }

              uint64_t v36 = v114;
              v91 = v115;
              v73 = v116;
LABEL_116:
            }
            else
            {
              v73 = v116;
            }

            goto LABEL_119;
          }
          v98 = os_log_create("com.apple.pencilkit", "");
          if (os_log_type_enabled(v98, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1C44F8000, v98, OS_LOG_TYPE_DEBUG, "No particpants provided mention", buf, 2u);
          }
          v82 = 0;
          goto LABEL_116;
        }
        uint64_t v84 = v76;
        uint64_t v85 = v36;
        v86 = v73;
        v87 = [*(id *)(*((void *)&v129 + 1) + 8 * v78) hashtagUUID];
        v88 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
        v89 = [v88 allConfirmedHashtagsForAttachmentView:self];
        if ([v89 containsObject:v87])
        {
        }
        else
        {
          int v106 = [v79 active];

          if (!v106) {
            goto LABEL_109;
          }
          v88 = [(PKAttachmentView *)self drawing];
          [v79 clearActiveInDrawing:v88];
        }

LABEL_109:
        v107 = [PKHashtagView alloc];
        v108 = [(PKAttachmentView *)self drawing];
        v82 = [(PKHashtagView *)v107 initWithHashtagItem:v79 inDrawing:v108];

        [(PKDataDetectorView *)v82 setDelegate:self];
        if (!ignoreInitialDetectionItemsForStatistics)
        {
          v109 = [(PKDataDetectorView *)v82 item];
          int v110 = [v109 active];

          if (v110) {
            [(PKAttachmentView *)self hashtagViewDidActivateHashtag:v82];
          }
        }

        v73 = v86;
        uint64_t v36 = v85;
        uint64_t v76 = v84;
        double v10 = v117;
LABEL_119:
        uint64_t v75 = v118;
        unint64_t v77 = 0x1EB3C3000;
        if (!v82) {
          goto LABEL_124;
        }
LABEL_120:
        [(UIView *)v73 insertSubview:v82 atIndex:0];
        [(PKDataDetectorView *)v82 setAlpha:0.0];
        if (!self->_detectionViewsHidden || v73 == self->_proofreadingContainerView)
        {
          v111 = (void *)MEMORY[0x1E4FB1EB0];
          v126[0] = MEMORY[0x1E4F143A8];
          v126[1] = 3221225472;
          v126[2] = __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_72;
          v126[3] = &unk_1E64C61C0;
          v127 = v82;
          [v111 animateWithDuration:v126 animations:0.15];
        }
        [(NSMutableArray *)v10 addObject:v82];

LABEL_124:
        ++v78;
      }
      while (v75 != v78);
      uint64_t v112 = [v120 countByEnumeratingWithState:&v129 objects:v159 count:16];
      uint64_t v75 = v112;
    }
    while (v112);
  }

  if ([v120 count]) {
    [(UIView *)v73 setNeedsLayout];
  }
  [(PKAttachmentView *)self setNeedsLayout];
}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __65__PKAttachmentView_updateDetectionViews_withItems_previousItems___block_invoke_72(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (PKTiledView)tiledView
{
  return 0;
}

- (void)hashtagView:(id)a3 registerCommand:(id)a4
{
  id v5 = a4;
  id v6 = [(PKAttachmentView *)self tiledView];
  [v6 registerUndoCommand:v5];
}

- (void)hashtagViewDidActivateHashtag:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
  id v6 = [v4 hashtagItem];
  id v7 = [v6 hashtagUUID];
  id v8 = [v4 hashtagItem];

  id v9 = [v8 hashtagResult];
  [v5 attachmentView:self userConfirmedHashtagWithUUID:v7 displayText:v9];

  [(PKAttachmentView *)self drawingDidChangeVisibleStrokes:0];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordHashtagItemActivate]((uint64_t)v10);
}

- (void)hashtagViewWillDeactivateHashtag:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
  id v6 = [v4 hashtagItem];

  id v7 = [v6 hashtagUUID];
  [v5 attachmentView:self userDeletedHashtagWithUUID:v7];

  [(PKAttachmentView *)self drawingDidChangeVisibleStrokes:0];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordHashtagItemDeactivate]((uint64_t)v8);
}

- (void)hashtagViewDidDeactivateHashtag:(id)a3
{
}

- (void)mentionView:(id)a3 registerCommand:(id)a4
{
  id v5 = a4;
  id v6 = [(PKAttachmentView *)self tiledView];
  [v6 registerUndoCommand:v5];
}

- (void)mentionViewDidActivateMention:(id)a3 withParticpant:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (!v6)
  {
    id v7 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
    id v8 = [v7 allConfirmedMentionsForAttachmentView:self];
    id v9 = [v21 mentionItem];
    id v10 = [v9 mentionUUID];
    id v6 = [v8 objectForKeyedSubscript:v10];
  }
  uint64_t v11 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
  uint64_t v12 = [v21 mentionItem];
  uint64_t v13 = [v12 mentionUUID];
  id v14 = [v6 identifier];
  [v11 attachmentView:self userConfirmedMentionWithUUID:v13 participantIdentifier:v14];

  [(PKAttachmentView *)self drawingDidChangeVisibleStrokes:0];
  id v15 = +[PKStatisticsManager sharedStatisticsManager]();
  -[PKStatisticsManager recordMentionItemActivate]((uint64_t)v15);

  mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
  if (!mentionUUIDtoParticipant)
  {
    char v17 = [MEMORY[0x1E4F1CA60] dictionary];
    double v18 = self->_mentionUUIDtoParticipant;
    self->_mentionUUIDtoParticipant = v17;

    mentionUUIDtoParticipant = self->_mentionUUIDtoParticipant;
  }
  id v19 = [v21 mentionItem];
  id v20 = [v19 mentionUUID];
  [(NSMutableDictionary *)mentionUUIDtoParticipant setObject:v6 forKeyedSubscript:v20];
}

- (void)mentionViewWillDeactivateMention:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
  id v6 = [v4 mentionItem];

  id v7 = [v6 mentionUUID];
  [v5 attachmentView:self userDeletedMentionWithUUID:v7];

  [(PKAttachmentView *)self drawingDidChangeVisibleStrokes:0];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PKStatisticsManager recordMentionItemDeactivate]((uint64_t)v8);
}

- (void)mentionViewDidDeactivateMention:(id)a3
{
}

- (void)proofreadingView:(id)a3 didReplaceWithString:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PKAttachmentView *)self tiledView];
  id v9 = [v8 selectionInteraction];

  id v10 = [v9 delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    char v30 = 1;
    uint64_t v12 = [(PKAttachmentView *)self drawing];
    uint64_t v13 = [v6 proofreadingItem];
    id v14 = [v13 chStrokeIdentifiers];
    id v15 = [v12 strokesForCHStrokeIdentifiers:v14 didFindAllStrokes:&v30];

    if (v30)
    {
      +[PKDrawing _boundingBoxForStrokeArray:v15];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      char v24 = [v9 delegate];
      uint64_t v25 = [v6 proofreadingItem];
      objc_msgSend(v24, "selectionInteraction:replaceStrokes:withString:proofreadingItem:inBounds:inAttachment:", v9, v15, v7, v25, self, v17, v19, v21, v23);

      uint64_t v26 = [(PKAttachmentView *)self previousProofreadingItems];
      os_log_t v27 = (os_log_t)[v26 mutableCopy];

      uint64_t v28 = [v6 proofreadingItem];
      [v27 removeObjectIdenticalTo:v28];

      [(PKAttachmentView *)self updateProofreadingResults:v27];
    }
    else
    {
      os_log_t v27 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v29 = 0;
        _os_log_error_impl(&dword_1C44F8000, v27, OS_LOG_TYPE_ERROR, "PKProofreadingView failed to find all the strokes for its group.", v29, 2u);
      }
    }
  }
}

- (id)inlineViewAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v6 = self->_dataDetectorViews;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v39;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v39 != v9) {
        objc_enumerationMutation(v6);
      }
      char v11 = *(void **)(*((void *)&v38 + 1) + 8 * v10);
      -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
      if (objc_msgSend(v11, "hitTest:")) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v38 objects:v45 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v6 = self->_hashtagViews;
    uint64_t v12 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v44 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v35;
LABEL_11:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v35 != v14) {
          objc_enumerationMutation(v6);
        }
        char v11 = *(void **)(*((void *)&v34 + 1) + 8 * v15);
        -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        if (objc_msgSend(v11, "hitTest:")) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v34 objects:v44 count:16];
          if (v13) {
            goto LABEL_11;
          }
          goto LABEL_17;
        }
      }
    }
    else
    {
LABEL_17:

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v6 = self->_mentionViews;
      uint64_t v16 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v43 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v31;
LABEL_19:
        uint64_t v19 = 0;
        while (1)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v30 + 1) + 8 * v19);
          -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
          if (objc_msgSend(v11, "hitTest:")) {
            break;
          }
          if (v17 == ++v19)
          {
            uint64_t v17 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v30 objects:v43 count:16];
            if (v17) {
              goto LABEL_19;
            }
            goto LABEL_25;
          }
        }
      }
      else
      {
LABEL_25:

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v6 = self->_proofreadingViews;
        uint64_t v20 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
        if (!v20)
        {
LABEL_33:
          id v24 = 0;
          goto LABEL_35;
        }
        uint64_t v21 = v20;
        uint64_t v22 = *(void *)v27;
LABEL_27:
        uint64_t v23 = 0;
        while (1)
        {
          if (*(void *)v27 != v22) {
            objc_enumerationMutation(v6);
          }
          char v11 = *(void **)(*((void *)&v26 + 1) + 8 * v23);
          -[PKAttachmentView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y, (void)v26);
          if (objc_msgSend(v11, "hitTest:")) {
            break;
          }
          if (v21 == ++v23)
          {
            uint64_t v21 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v26 objects:v42 count:16];
            if (v21) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
        }
      }
    }
  }
  id v24 = v11;
LABEL_35:

  return v24;
}

- (void)layoutInlineViews
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  memset(&v52, 0, sizeof(v52));
  [(PKAttachmentView *)self drawingTransform];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = [(PKAttachmentView *)self dataDetectorViews];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(PKAttachmentView *)self dataDetectorViews];
    [v3 addObjectsFromArray:v6];
  }
  uint64_t v7 = [(PKAttachmentView *)self hashtagViews];
  uint64_t v8 = [v7 count];

  if (v8)
  {
    uint64_t v9 = [(PKAttachmentView *)self hashtagViews];
    [v3 addObjectsFromArray:v9];
  }
  uint64_t v10 = [(PKAttachmentView *)self mentionViews];
  uint64_t v11 = [v10 count];

  if (v11)
  {
    uint64_t v12 = [(PKAttachmentView *)self mentionViews];
    [v3 addObjectsFromArray:v12];
  }
  uint64_t v13 = [(PKAttachmentView *)self proofreadingViews];
  uint64_t v14 = [v13 count];

  if (v14)
  {
    uint64_t v15 = [(PKAttachmentView *)self proofreadingViews];
    [v3 addObjectsFromArray:v15];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v16 = v3;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    BOOL v19 = 0;
    uint64_t v20 = *(void *)v49;
    CGFloat v43 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    CGFloat v44 = *MEMORY[0x1E4F1DB28];
    CGFloat v41 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v42 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v49 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        objc_msgSend(v22, "drawingBounds", *(void *)&v41, *(void *)&v42, *(void *)&v43, *(void *)&v44);
        CGAffineTransform v47 = v52;
        CGRectApplyAffineTransform(v55, &v47);
        [v22 contentScaleFactor];
        UIRectIntegralWithScale();
        CGFloat v24 = v23;
        CGFloat v26 = v25;
        CGFloat v28 = v27;
        CGFloat v30 = v29;
        objc_msgSend(v22, "setFrame:");
        if (v22) {
          [v22 drawingTransform];
        }
        else {
          memset(&v46, 0, sizeof(v46));
        }
        v56.origin.double x = v24;
        v56.origin.double y = v26;
        v56.size.double width = v28;
        v56.size.double height = v30;
        CGRect v57 = CGRectApplyAffineTransform(v56, &v46);
        double x = v57.origin.x;
        double y = v57.origin.y;
        double width = v57.size.width;
        double height = v57.size.height;
        CGAffineTransform v47 = v52;
        v57.origin.double x = v24;
        v57.origin.double y = v26;
        v57.size.double width = v28;
        v57.size.double height = v30;
        CGRect v58 = CGRectApplyAffineTransform(v57, &v47);
        double v35 = vabdd_f64(y, v58.origin.y);
        BOOL v36 = vabdd_f64(x, v58.origin.x) < 1.0 && v35 < 1.0;
        double v37 = vabdd_f64(width, v58.size.width);
        double v38 = vabdd_f64(height, v58.size.height);
        if (!v36 || v37 >= 1.0 || v38 >= 1.0)
        {
          CGAffineTransform v45 = v52;
          [v22 setDrawingTransform:&v45];
          v59.origin.double x = x;
          v59.origin.double y = y;
          v59.size.double width = width;
          v59.size.double height = height;
          v60.origin.double y = v43;
          v60.origin.double x = v44;
          v60.size.double height = v41;
          v60.size.double width = v42;
          BOOL v19 = !CGRectEqualToRect(v59, v60);
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v48 objects:v53 count:16];
    }
    while (v18);

    if (v19)
    {
      [(PKAttachmentView *)self setDetectionViewsHidden:1];
      +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:self selector:sel_revealDetectionViews object:0];
      [(PKAttachmentView *)self performSelector:sel_revealDetectionViews withObject:0 afterDelay:0.2];
    }
  }
  else
  {
  }
}

- (void)updateDetectionViewVisibility
{
  [(PKAttachmentView *)self revealDetectionViews];

  +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:self selector:sel_revealDetectionViews object:0];
}

- (void)setDetectionViewsHidden:(BOOL)a3
{
  self->_detectionViewsHiddeuint64_t n = a3;
  if (a3)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke;
    v9[3] = &unk_1E64C61C0;
    v9[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v9];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_2;
    v8[3] = &unk_1E64C61C0;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_3;
    v7[3] = &unk_1E64C61C0;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
  else
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_4;
    v6[3] = &unk_1E64C61C0;
    v6[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:0.15];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_5;
    v5[3] = &unk_1E64C61C0;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:0.15];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_6;
    v4[3] = &unk_1E64C61C0;
    void v4[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v4 animations:0.15];
  }
  +[PKAttachmentView cancelPreviousPerformRequestsWithTarget:self selector:sel_revealDetectionViews object:0];
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "dataDetectorViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:0.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_2(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "hashtagViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:0.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "mentionViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:0.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_4(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "dataDetectorViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:1.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_5(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "hashtagViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:1.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void __44__PKAttachmentView_setDetectionViewsHidden___block_invoke_6(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "mentionViews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) setAlpha:1.0];
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)revealDetectionViews
{
  BOOL v2 = self->_isDraggingSelection || self->_toolPickerVisible || self->_hideUntilScroll;
  [(PKAttachmentView *)self setDetectionViewsHidden:v2];
}

- (void)updateDataDetectorResults:(id)a3
{
}

- (void)updateHashtagResults:(id)a3
{
}

- (void)updateMentionResults:(id)a3
{
  if (self->_deferMentionUpdate)
  {
    uint64_t v5 = (NSMutableArray *)[a3 mutableCopy];
    previousMentionItems = self->_previousMentionItems;
    self->_previousMentionItems = v5;
  }
  else
  {
    mentionViews = self->_mentionViews;
    long long v8 = self->_previousMentionItems;
    [(PKAttachmentView *)self updateDetectionViews:mentionViews withItems:a3 previousItems:v8];
  }
}

- (void)updateProofreadingResults:(id)a3
{
}

- (void)updateAllPossibleParticipantNameTokens
{
  p_hashtagAndMentionsDelegate = &self->_hashtagAndMentionsDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);
  self->_deferMentionUpdate = objc_opt_respondsToSelector() & 1;

  if (self->_deferMentionUpdate)
  {
    objc_initWeak(&location, self);
    id v5 = objc_loadWeakRetained((id *)p_hashtagAndMentionsDelegate);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__PKAttachmentView_updateAllPossibleParticipantNameTokens__block_invoke;
    v10[3] = &unk_1E64C6758;
    objc_copyWeak(&v11, &location);
    [v5 allPossibleParticipantNameTokensForAttachmentView:self completion:v10];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v6 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      long long v8 = [(PKAttachmentView *)self hashtagAndMentionsDelegate];
      id v9 = [v8 allPossibleParticipantNameTokensForAttachmentView:self];

      [(PKAttachmentView *)self _updateAllPossibleParticipantNameTokens:v9];
    }
  }
}

void __58__PKAttachmentView_updateAllPossibleParticipantNameTokens__block_invoke(uint64_t a1, void *a2)
{
  BOOL v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _updateAllPossibleParticipantNameTokens:v3];
}

- (void)_updateAllPossibleParticipantNameTokens:(id)a3
{
  id v4 = a3;
  id v5 = [(PKAttachmentView *)self recognitionManager];
  -[PKRecognitionSessionManager setMentionSuffixes:]((uint64_t)v5, v4);

  if (self->_deferMentionUpdate)
  {
    self->_deferMentionUpdate = 0;
    if ([(NSMutableArray *)self->_previousMentionItems count])
    {
      long long v6 = (void *)MEMORY[0x1E4F1CA48];
      id v9 = self->_previousMentionItems;
      char v7 = [v6 array];
      previousMentionItems = self->_previousMentionItems;
      self->_previousMentionItems = v7;

      [(PKAttachmentView *)self updateMentionResults:v9];
    }
  }
}

- (CGRect)boundingBoxForHashtagOrMentionWithUUID:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v5 = self->_hashtagViews;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v44;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        id v11 = [v10 hashtagItem];
        uint64_t v12 = [v11 hashtagUUID];
        char v13 = [v12 isEqual:v4];

        if (v13)
        {
          [v10 frame];
          double v23 = v27;
          double v24 = v28;
          double v25 = v29;
          double v26 = v30;

          goto LABEL_20;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v43 objects:v48 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v14 = self->_mentionViews;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v40;
    while (2)
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v40 != v17) {
          objc_enumerationMutation(v14);
        }
        BOOL v19 = *(void **)(*((void *)&v39 + 1) + 8 * j);
        uint64_t v20 = objc_msgSend(v19, "mentionItem", (void)v39);
        uint64_t v21 = [v20 mentionUUID];
        char v22 = [v21 isEqual:v4];

        if (v22)
        {
          [v19 frame];
          double v23 = v31;
          double v24 = v32;
          double v25 = v33;
          double v26 = v34;

          goto LABEL_20;
        }
      }
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v39 objects:v47 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  double v23 = *MEMORY[0x1E4F1DB28];
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_20:

  double v35 = v23;
  double v36 = v24;
  double v37 = v25;
  double v38 = v26;
  result.size.double height = v38;
  result.size.double width = v37;
  result.origin.double y = v36;
  result.origin.double x = v35;
  return result;
}

- (id)_accessibilityUserTestingChildren
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v10.receiver = self;
  v10.super_class = (Class)PKAttachmentView;
  id v4 = [(PKAttachmentView *)&v10 _accessibilityUserTestingChildren];
  id v5 = [v3 arrayWithArray:v4];

  uint64_t v6 = [(PKAttachmentView *)self dataDetectorViews];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [(PKAttachmentView *)self hashtagViews];
  [v5 addObjectsFromArray:v7];

  uint64_t v8 = [(PKAttachmentView *)self mentionViews];
  [v5 addObjectsFromArray:v8];

  return v5;
}

- (void)setRecognitionController:(id)a3
{
}

- (NSArray)additionalStrokes
{
  return self->_additionalStrokes;
}

- (void)setTileContainerView:(id)a3
{
}

- (UIView)proofreadingContainerView
{
  return self->_proofreadingContainerView;
}

- (void)setProofreadingContainerView:(id)a3
{
}

- (BOOL)contentHidden
{
  return self->_contentHidden;
}

- (BOOL)sixChannelBlending
{
  return self->_sixChannelBlending;
}

- (BOOL)wantsDataDetection
{
  return self->_wantsDataDetection;
}

- (BOOL)wantsMentionDetection
{
  return self->_wantsMentionDetection;
}

- (BOOL)wantsHashtagDetection
{
  return self->_wantsHashtagDetection;
}

- (BOOL)wantsProofreadingDetection
{
  return self->_wantsProofreadingDetection;
}

- (BOOL)isSharedViaICloud
{
  return self->_isSharedViaICloud;
}

- (void)setIsSharedViaICloud:(BOOL)a3
{
  self->_isSharedViaICloud = a3;
}

- (PKAttachmentViewHashtagsAndMentionsDelegate)hashtagAndMentionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hashtagAndMentionsDelegate);

  return (PKAttachmentViewHashtagsAndMentionsDelegate *)WeakRetained;
}

- (CGRect)cachedBounds
{
  double x = self->_cachedBounds.origin.x;
  double y = self->_cachedBounds.origin.y;
  double width = self->_cachedBounds.size.width;
  double height = self->_cachedBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedBounds:(CGRect)a3
{
  self->_cachedBounds = a3;
}

- (NSMutableArray)dataDetectorViews
{
  return self->_dataDetectorViews;
}

- (void)setDataDetectorViews:(id)a3
{
}

- (NSMutableArray)mentionViews
{
  return self->_mentionViews;
}

- (void)setMentionViews:(id)a3
{
}

- (NSMutableArray)hashtagViews
{
  return self->_hashtagViews;
}

- (void)setHashtagViews:(id)a3
{
}

- (NSMutableArray)proofreadingViews
{
  return self->_proofreadingViews;
}

- (void)setProofreadingViews:(id)a3
{
}

- (BOOL)detectionViewsHidden
{
  return self->_detectionViewsHidden;
}

- (BOOL)hideUntilScroll
{
  return self->_hideUntilScroll;
}

- (void)setHideUntilScroll:(BOOL)a3
{
  self->_hideUntilScroll = a3;
}

- (BOOL)toolPickerVisible
{
  return self->_toolPickerVisible;
}

- (void)setToolPickerVisible:(BOOL)a3
{
  self->_toolPickerVisible = a3;
}

- (BOOL)isDraggingSelection
{
  return self->_isDraggingSelection;
}

- (void)setIsDraggingSelection:(BOOL)a3
{
  self->_isDraggingSelectiouint64_t n = a3;
}

- (BOOL)ignoreInitialDetectionItemsForStatistics
{
  return self->_ignoreInitialDetectionItemsForStatistics;
}

- (void)setIgnoreInitialDetectionItemsForStatistics:(BOOL)a3
{
  self->_BOOL ignoreInitialDetectionItemsForStatistics = a3;
}

- (BOOL)deferMentionUpdate
{
  return self->_deferMentionUpdate;
}

- (void)setDeferMentionUpdate:(BOOL)a3
{
  self->_deferMentionUpdate = a3;
}

- (NSMutableArray)previousDataDetectorItems
{
  return self->_previousDataDetectorItems;
}

- (void)setPreviousDataDetectorItems:(id)a3
{
}

- (NSMutableArray)previousHashtagItems
{
  return self->_previousHashtagItems;
}

- (void)setPreviousHashtagItems:(id)a3
{
}

- (NSMutableArray)previousMentionItems
{
  return self->_previousMentionItems;
}

- (void)setPreviousMentionItems:(id)a3
{
}

- (NSMutableArray)previousProofreadingItems
{
  return self->_previousProofreadingItems;
}

- (void)setPreviousProofreadingItems:(id)a3
{
}

- (PKProgressAlertController)progressAlertController
{
  return self->_progressAlertController;
}

- (void)setProgressAlertController:(id)a3
{
}

- (NSProgress)currentProgress
{
  return self->_currentProgress;
}

- (void)setCurrentProgress:(id)a3
{
}

- (BOOL)didReceiveTextConversion
{
  return self->_didReceiveTextConversion;
}

- (void)setDidReceiveTextConversion:(BOOL)a3
{
  self->_didReceiveTextConversiouint64_t n = a3;
}

- (NSMutableDictionary)mentionUUIDtoParticipant
{
  return self->_mentionUUIDtoParticipant;
}

- (void)setMentionUUIDtoParticipant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mentionUUIDtoParticipant, 0);
  objc_storeStrong((id *)&self->_currentProgress, 0);
  objc_storeStrong((id *)&self->_progressAlertController, 0);
  objc_storeStrong((id *)&self->_previousProofreadingItems, 0);
  objc_storeStrong((id *)&self->_previousMentionItems, 0);
  objc_storeStrong((id *)&self->_previousHashtagItems, 0);
  objc_storeStrong((id *)&self->_previousDataDetectorItems, 0);
  objc_storeStrong((id *)&self->_proofreadingViews, 0);
  objc_storeStrong((id *)&self->_hashtagViews, 0);
  objc_storeStrong((id *)&self->_mentionViews, 0);
  objc_storeStrong((id *)&self->_dataDetectorViews, 0);
  objc_destroyWeak((id *)&self->_hashtagAndMentionsDelegate);
  objc_storeStrong((id *)&self->_proofreadingContainerView, 0);
  objc_storeStrong((id *)&self->_additionalStrokes, 0);
  objc_storeStrong((id *)&self->_recognitionController, 0);
  objc_storeStrong((id *)&self->_settingsObserver, 0);
  objc_storeStrong((id *)&self->_purgedTiles, 0);
  objc_storeStrong((id *)&self->_offscreenTiles, 0);
  objc_storeStrong((id *)&self->_tiles, 0);
  objc_storeStrong((id *)&self->_strokeSpatialCache, 0);
  objc_storeStrong((id *)&self->_tileContainerView, 0);
  objc_storeStrong((id *)&self->_drawing, 0);

  objc_storeStrong((id *)&self->_listenerID, 0);
}

@end