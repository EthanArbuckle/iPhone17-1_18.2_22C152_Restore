@interface PKTextAttachmentDrawingView
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canResignFirstResponder;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)gestureRecognizerShouldDelayLift:(id)a3;
- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4;
- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4;
- (BOOL)hitTestResizeHandles:(CGPoint)a3 threshold:(double)a4;
- (BOOL)inserted;
- (BOOL)isAtBeginningOfDocument;
- (BOOL)isAtEndOfDocument;
- (BOOL)isLiveResizing;
- (BOOL)resignFirstResponder;
- (BOOL)resizeUpper;
- (BOOL)zoomingProgramatically;
- (CGAffineTransform)drawingTransform;
- (CGAffineTransform)drawingTransformForViewWidth:(SEL)a3;
- (CGPoint)textViewContentOffsetStartLocation;
- (CGPoint)zoomStartLocationInAttachment;
- (CGPoint)zoomStartLocationInWindow;
- (CGRect)drawingBounds;
- (CGRect)drawingBoundsForViewWidth:(double)a3;
- (CGRect)drawingCanvasBounds;
- (CGRect)drawingContentBounds;
- (CGRect)drawingTextAttachmentBounds;
- (CGRect)drawingTextAttachmentBoundsForContainerView:(id)a3;
- (CGRect)liveResizeAttachmentBounds;
- (CGRect)resizeViewDrawingBounds:(id)a3;
- (CGSize)desiredTextAttachmentSizeForContainerView:(id)a3;
- (CGSize)drawingVisibleSize;
- (NSTextAttachment)textAttachment;
- (PKLinedPaperLayer)linesLayer;
- (PKTextAttachmentDrawingView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5;
- (PKTextAttachmentDrawingView)initWithCoder:(id)a3;
- (PKTextAttachmentDrawingView)initWithDrawingClass:(Class)a3;
- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3;
- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4;
- (PKTextAttachmentDrawingViewTouchRecognizer)resizeHighlightGestureRecognizer;
- (PKTextAttachmentResizeView)bottomResizeView;
- (PKTextAttachmentResizeView)topResizeView;
- (UILongPressGestureRecognizer)hideMenuGestureRecognizer;
- (UIPanGestureRecognizer)resizeDragGestureRecognizer;
- (UITapGestureRecognizer)eatKeyboardGestureRecognizer;
- (UITapGestureRecognizer)showMenuGestureRecognizer;
- (UITapGestureRecognizer)tapBelowDrawingGestureRecognizer;
- (UIView)tileScaleView;
- (double)canvasHeightFromDrawingViewHeight:(double)a3;
- (double)canvasHeightFromDrawingViewHeight:(double)a3 drawingViewWidth:(double)a4;
- (double)desiredAttachmentViewWidthForContainerView:(id)a3;
- (double)drawingAspectRatio;
- (double)drawingScaleForViewWidth:(double)a3;
- (double)heightFromDrawing:(id)a3 delta:(double)a4;
- (double)zoomScale;
- (double)zoomStartScale;
- (id)_drawingGestureRecognizer;
- (id)_textView;
- (id)dataForTextAttachment:(id)a3;
- (id)drawingForTextAttachment:(id)a3 drawingClass:(Class)a4;
- (id)keyCommands;
- (id)linedPaperLayerLinedPaper:(id)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)tileMaskView;
- (id)tiledView;
- (id)tiledViewAttachmentViews;
- (id)viewForZoomingInScrollView:(id)a3;
- (int64_t)_characterIndex;
- (void)_adjustResizeIndicatorVisibility;
- (void)_adjustResizeIndicatorVisibility:(BOOL)a3 highlightBackground:(BOOL)a4;
- (void)_adjustResizeIndicatorVisibilityNotification;
- (void)_sceneDidActivate:(id)a3;
- (void)_setAdjustResizeIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5;
- (void)_setHeight:(double)a3 originalHeight:(double)a4 growFromTop:(BOOL)a5;
- (void)_share:(id)a3;
- (void)_triggerRedraw;
- (void)_updateAfterBackgroundSnapshotting:(id)a3;
- (void)_updateAttachmentBoundsEnsureLayout:(BOOL)a3;
- (void)_updateResizeTouchInsetsFingerDrawingEnabled:(BOOL)a3;
- (void)_updateViewHeightIfNecessary;
- (void)beginLiveResize;
- (void)cleanupViewProviders;
- (void)copy:(id)a3;
- (void)copyStrokeSelection:(id)a3;
- (void)cut:(id)a3;
- (void)cutStrokeSelection:(id)a3;
- (void)dealloc;
- (void)delete:(id)a3;
- (void)deleteStrokeSelection:(id)a3;
- (void)didBeginDrawing;
- (void)didMoveToSuperview;
- (void)didMoveToWindow;
- (void)drawingDataDidChange:(id)a3;
- (void)drawingDidChangeVisibleStrokes:(BOOL)a3;
- (void)endLiveResize;
- (void)fingerDrawingEnabledDidChange;
- (void)handleDoubleTap:(id)a3;
- (void)hideDrawingMenu:(id)a3;
- (void)higlightResize:(id)a3;
- (void)insertSpace:(id)a3;
- (void)layoutSubviews;
- (void)layoutTileViews;
- (void)paste:(id)a3;
- (void)resetZoom;
- (void)resizeDrawing:(id)a3;
- (void)resizeView:(id)a3 finishedWithOriginalDrawingBounds:(CGRect)a4 originalViewBounds:(CGRect)a5;
- (void)resizeView:(id)a3 setDrawingHeight:(double)a4 originalHeight:(double)a5 growFromTop:(BOOL)a6;
- (void)resizeViewDidUpdate:(id)a3;
- (void)resizeViewLayoutAttachment:(id)a3;
- (void)resizeViewRemoveAttachment:(id)a3;
- (void)scaleDrawing:(double)a3;
- (void)scaleDrawing:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)selectAll:(id)a3;
- (void)setBottomResizeView:(id)a3;
- (void)setContentHidden:(BOOL)a3;
- (void)setDrawingCanvasBounds:(CGRect)a3;
- (void)setEatKeyboardGestureRecognizer:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setHideMenuGestureRecognizer:(id)a3;
- (void)setInserted:(BOOL)a3;
- (void)setIsLiveResizing:(BOOL)a3;
- (void)setLinesLayer:(id)a3;
- (void)setLiveResizeAttachmentBounds:(CGRect)a3;
- (void)setResizeDragGestureRecognizer:(id)a3;
- (void)setResizeHighlightGestureRecognizer:(id)a3;
- (void)setResizeUpper:(BOOL)a3;
- (void)setShowMenuGestureRecognizer:(id)a3;
- (void)setTapBelowDrawingGestureRecognizer:(id)a3;
- (void)setTextAttachment:(id)a3;
- (void)setTextViewContentOffsetStartLocation:(CGPoint)a3;
- (void)setTopResizeView:(id)a3;
- (void)setZoomScale:(double)a3;
- (void)setZoomStartLocationInAttachment:(CGPoint)a3;
- (void)setZoomStartLocationInWindow:(CGPoint)a3;
- (void)setZoomStartScale:(double)a3;
- (void)setZoomingProgramatically:(BOOL)a3;
- (void)showDrawingMenu:(id)a3;
- (void)tapBelowDrawingGesture:(id)a3;
- (void)toolPickerDidHide;
- (void)toolPickerDidShow;
- (void)updateDrawingHeight:(double)a3;
- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4;
- (void)updateFrameForTextContainer;
- (void)willMoveToSuperview:(id)a3;
@end

@implementation PKTextAttachmentDrawingView

- (PKTextAttachmentDrawingView)initWithDrawingClass:(Class)a3
{
  return [(PKTextAttachmentDrawingView *)self initWithAttachment:0 drawingClass:a3 inserted:0];
}

- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  return -[PKAttachmentView initWithFrame:drawing:](&v5, sel_initWithFrame_drawing_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (PKTextAttachmentDrawingView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5
{
  id v8 = a3;
  v9 = [(PKTextAttachmentDrawingView *)self drawingForTextAttachment:v8 drawingClass:a4];
  [(PKTextAttachmentDrawingView *)self setZoomScale:1.0];
  id v10 = [[PKTextAttachmentResizeView alloc] initAtTop:1 delegate:self];
  id v11 = [[PKTextAttachmentResizeView alloc] initAtTop:0 delegate:self];
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v13 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  v59.receiver = self;
  v59.super_class = (Class)PKTextAttachmentDrawingView;
  v14 = -[PKAttachmentView initWithFrame:drawing:](&v59, sel_initWithFrame_drawing_, v9, v12, v13, 0.0, 1024.0);
  v15 = (PKTextAttachmentDrawingView *)v14;
  if (v14)
  {
    uint64_t v16 = MEMORY[0x1E4F1DAB8];
    long long v17 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)(v14 + 712) = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)(v14 + 728) = v17;
    *(_OWORD *)(v14 + 744) = *(_OWORD *)(v16 + 32);
    *((void *)v14 + 95) = 0;
    objc_storeWeak((id *)v14 + 99, v8);
    v15->_inserted = a5;
    v18 = [_PKInlineDrawingScrollView alloc];
    [(PKTextAttachmentDrawingView *)v15 bounds];
    uint64_t v19 = -[_PKInlineDrawingScrollView initWithFrame:](v18, "initWithFrame:");
    tileMaskView = v15->_tileMaskView;
    v15->_tileMaskView = (UIScrollView *)v19;

    [(PKTextAttachmentDrawingView *)v15 drawingVisibleSize];
    -[UIScrollView setContentSize:](v15->_tileMaskView, "setContentSize:");
    [(UIScrollView *)v15->_tileMaskView setDelegate:v15];
    [(UIScrollView *)v15->_tileMaskView setMinimumZoomScale:0.0];
    [(UIScrollView *)v15->_tileMaskView setMaximumZoomScale:10.0];
    [(UIScrollView *)v15->_tileMaskView setClipsToBounds:1];
    [(UIScrollView *)v15->_tileMaskView setScrollEnabled:0];
    [(UIScrollView *)v15->_tileMaskView setZoomEnabled:0];
    v21 = [(PKTextAttachmentDrawingView *)v15 traitCollection];
    uint64_t v22 = [v21 userInterfaceIdiom];

    if (!v22)
    {
      [(UIScrollView *)v15->_tileMaskView setZoomEnabled:1];
      v23 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v15 action:sel_handleDoubleTap_];
      [v23 setName:@"com.apple.PencilKit.zoomDrawingOnPhone"];
      [v23 setNumberOfTapsRequired:2];
      [(UIScrollView *)v15->_tileMaskView addGestureRecognizer:v23];
    }
    [(PKTextAttachmentDrawingView *)v15 addSubview:v15->_tileMaskView];
    id v24 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(PKTextAttachmentDrawingView *)v15 bounds];
    uint64_t v25 = objc_msgSend(v24, "initWithFrame:");
    tileScaleView = v15->_tileScaleView;
    v15->_tileScaleView = (UIView *)v25;

    [(UIScrollView *)v15->_tileMaskView addSubview:v15->_tileScaleView];
    v27 = [[PKLinedPaperLayer alloc] initWithLinedPaperLayerDelegate:v15];
    linesLayer = v15->_linesLayer;
    v15->_linesLayer = v27;

    v29 = [(UIView *)v15->_tileScaleView layer];
    [v29 addSublayer:v15->_linesLayer];

    [(PKTextAttachmentDrawingView *)v15 bounds];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
    v38 = [(PKAttachmentView *)v15 tileContainerView];
    objc_msgSend(v38, "setFrame:", v31, v33, v35, v37);

    v39 = [(PKAttachmentView *)v15 tileContainerView];
    [v39 setUserInteractionEnabled:1];

    v40 = v15->_tileScaleView;
    v41 = [(PKAttachmentView *)v15 tileContainerView];
    [(UIView *)v40 addSubview:v41];

    objc_storeStrong((id *)&v15->_topResizeView, v10);
    objc_storeStrong((id *)&v15->_bottomResizeView, v11);
    [(PKTextAttachmentDrawingView *)v15 addSubview:v15->_topResizeView];
    [(PKTextAttachmentDrawingView *)v15 addSubview:v15->_bottomResizeView];
    [(PKTextAttachmentDrawingView *)v15 _adjustResizeIndicatorVisibility];
    uint64_t v42 = [objc_alloc(MEMORY[0x1E4FB1A58]) initWithTarget:v15 action:sel_resizeDrawing_];
    resizeDragGestureRecognizer = v15->_resizeDragGestureRecognizer;
    v15->_resizeDragGestureRecognizer = (UIPanGestureRecognizer *)v42;

    [(UIPanGestureRecognizer *)v15->_resizeDragGestureRecognizer setDelegate:v15];
    [(UIPanGestureRecognizer *)v15->_resizeDragGestureRecognizer setName:@"com.apple.PencilKit.resizeDragGestureRecognizer"];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_resizeDragGestureRecognizer];
    v44 = [[PKTextAttachmentDrawingViewTouchRecognizer alloc] initWithTarget:v15 action:sel_higlightResize_];
    resizeHighlightGestureRecognizer = v15->_resizeHighlightGestureRecognizer;
    v15->_resizeHighlightGestureRecognizer = v44;

    [(PKTextAttachmentDrawingViewTouchRecognizer *)v15->_resizeHighlightGestureRecognizer setDelegate:v15];
    [(PKTextAttachmentDrawingViewTouchRecognizer *)v15->_resizeHighlightGestureRecognizer setName:@"com.apple.PencilKit.resizeHighlightGestureRecognizer"];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_resizeHighlightGestureRecognizer];
    uint64_t v46 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v15 action:sel__noOpForGesture_];
    eatKeyboardGestureRecognizer = v15->_eatKeyboardGestureRecognizer;
    v15->_eatKeyboardGestureRecognizer = (UITapGestureRecognizer *)v46;

    [(UITapGestureRecognizer *)v15->_eatKeyboardGestureRecognizer setName:@"com.apple.PencilKit.eatKeyboardGR"];
    [(UITapGestureRecognizer *)v15->_eatKeyboardGestureRecognizer setDelegate:v15];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_eatKeyboardGestureRecognizer];
    uint64_t v48 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v15 action:sel_tapBelowDrawingGesture_];
    tapBelowDrawingGestureRecognizer = v15->_tapBelowDrawingGestureRecognizer;
    v15->_tapBelowDrawingGestureRecognizer = (UITapGestureRecognizer *)v48;

    [(UITapGestureRecognizer *)v15->_tapBelowDrawingGestureRecognizer setDelegate:v15];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_tapBelowDrawingGestureRecognizer];
    uint64_t v50 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v15 action:sel_showDrawingMenu_];
    showMenuGestureRecognizer = v15->_showMenuGestureRecognizer;
    v15->_showMenuGestureRecognizer = (UITapGestureRecognizer *)v50;

    [(UITapGestureRecognizer *)v15->_showMenuGestureRecognizer setName:@"com.apple.PencilKit.showMenuGR"];
    [(UITapGestureRecognizer *)v15->_showMenuGestureRecognizer setDelegate:v15];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_showMenuGestureRecognizer];
    uint64_t v52 = [objc_alloc(MEMORY[0x1E4FB1968]) initWithTarget:v15 action:sel_hideDrawingMenu_];
    hideMenuGestureRecognizer = v15->_hideMenuGestureRecognizer;
    v15->_hideMenuGestureRecognizer = (UILongPressGestureRecognizer *)v52;

    [(UILongPressGestureRecognizer *)v15->_hideMenuGestureRecognizer setName:@"com.apple.PencilKit.hideMenuGR"];
    [(UILongPressGestureRecognizer *)v15->_hideMenuGestureRecognizer setDelegate:v15];
    [(UILongPressGestureRecognizer *)v15->_hideMenuGestureRecognizer setMinimumPressDuration:0.0];
    [(PKTextAttachmentDrawingView *)v15 addGestureRecognizer:v15->_hideMenuGestureRecognizer];
    v54 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v55 = *MEMORY[0x1E4FB2CB0];
    v56 = [MEMORY[0x1E4FB1978] sharedMenuController];
    [v54 addObserver:v15 selector:sel_menuDidHide_ name:v55 object:v56];

    [(PKTextAttachmentDrawingView *)v15 layoutSubviews];
    v57 = (void *)[objc_alloc(MEMORY[0x1E4FB1AC8]) initWithDelegate:v15];
    [(PKTextAttachmentDrawingView *)v15 addInteraction:v57];
  }
  return v15;
}

- (PKTextAttachmentDrawingView)initWithCoder:(id)a3
{
  return -[PKTextAttachmentDrawingView initWithFrame:](self, "initWithFrame:", a3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (PKTextAttachmentDrawingView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = [(PKTextAttachmentDrawingView *)self init];
  id v8 = v7;
  if (v7) {
    -[PKAttachmentView setFrame:](v7, "setFrame:", x, y, width, height);
  }
  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v4 dealloc];
}

- (id)tiledViewAttachmentViews
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = self;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (void)beginLiveResize
{
  [(PKTextAttachmentDrawingView *)self setIsLiveResizing:1];
  [(PKTextAttachmentDrawingView *)self bounds];

  -[PKTextAttachmentDrawingView setLiveResizeAttachmentBounds:](self, "setLiveResizeAttachmentBounds:");
}

- (void)endLiveResize
{
}

- (CGRect)drawingTextAttachmentBoundsForContainerView:(id)a3
{
  id v4 = a3;
  if ([(PKTextAttachmentDrawingView *)self isLiveResizing])
  {
    [(PKTextAttachmentDrawingView *)self liveResizeAttachmentBounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    [(PKTextAttachmentDrawingView *)self desiredTextAttachmentSizeForContainerView:v4];
    double v10 = v13;
    double v15 = v14;
    uint64_t v16 = [v4 window];
    long long v17 = [v16 screen];
    [v17 scale];
    double v19 = v18;

    double v20 = 1.0;
    if (v19 > 0.0) {
      double v20 = v19;
    }
    double v12 = round(v15 * v20) / v20;
  }

  double v21 = v6;
  double v22 = v8;
  double v23 = v10;
  double v24 = v12;
  result.size.double height = v24;
  result.size.double width = v23;
  result.origin.double y = v22;
  result.origin.double x = v21;
  return result;
}

- (CGRect)drawingTextAttachmentBounds
{
  v3 = [(PKTextAttachmentDrawingView *)self _textView];
  [(PKTextAttachmentDrawingView *)self drawingTextAttachmentBoundsForContainerView:v3];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (id)drawingForTextAttachment:(id)a3 drawingClass:(Class)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = [v5 fileWrapper];
  double v7 = [v6 regularFileContents];

  if ((v7 && [v7 length]
     || ([v5 contents],
         uint64_t v8 = objc_claimAutoreleasedReturnValue(),
         v7,
         (double v7 = (void *)v8) != 0))
    && [v7 length])
  {
    id v13 = 0;
    id v9 = (id)[[a4 alloc] initWithData:v7 error:&v13];
    id v10 = v13;
    if (v10)
    {
      double v11 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v15 = v10;
        _os_log_error_impl(&dword_1C44F8000, v11, OS_LOG_TYPE_ERROR, "Error loading drawing: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v9 = +[PKTiledView newInlineDrawingOfClass:a4];
  }

  return v9;
}

- (CGRect)drawingCanvasBounds
{
  v2 = [(PKAttachmentView *)self drawing];
  [v2 _canvasBounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)setDrawingCanvasBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(PKAttachmentView *)self drawing];
  objc_msgSend(v7, "set_canvasBounds:", x, y, width, height);
}

- (void)_updateResizeTouchInsetsFingerDrawingEnabled:(BOOL)a3
{
  double v6 = *MEMORY[0x1E4FB2848];
  double v5 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v8 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v7 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  int v9 = [(PKTextAttachmentDrawingView *)self isFirstResponder];
  double v10 = -10.0;
  double v11 = 0.0;
  if (a3) {
    double v12 = v7;
  }
  else {
    double v12 = 0.0;
  }
  if (a3) {
    double v13 = v8;
  }
  else {
    double v13 = -10.0;
  }
  if (a3)
  {
    double v11 = v5;
    double v10 = v6;
  }
  if (v9)
  {
    double v7 = v12;
    double v8 = v13;
    double v5 = v11;
    double v6 = v10;
  }
  -[PKTextAttachmentDrawingView _setTouchInsets:](self, "_setTouchInsets:", v6, v5, v8, v7);
  double v14 = [(PKTextAttachmentDrawingView *)self topResizeView];
  objc_msgSend(v14, "_setTouchInsets:", v6, v5, v8, v7);

  id v15 = [(PKTextAttachmentDrawingView *)self bottomResizeView];
  objc_msgSend(v15, "_setTouchInsets:", v6, v5, v8, v7);
}

- (id)tileMaskView
{
  return self->_tileMaskView;
}

- (void)cleanupViewProviders
{
  v2 = [(PKTextAttachmentDrawingView *)self _textView];
  double v3 = v2;
  if (v2)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PKTextAttachmentDrawingView_cleanupViewProviders__block_invoke;
    block[3] = &unk_1E64C61C0;
    id v5 = v2;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __51__PKTextAttachmentDrawingView_cleanupViewProviders__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanupStaleCachedViewProviders];
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v4 didMoveToWindow];
  double v3 = [(PKTextAttachmentDrawingView *)self window];

  if (v3) {
    [(PKAttachmentView *)self setWantsDataDetection:1];
  }
}

- (void)willMoveToSuperview:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKTextAttachmentDrawingView *)&v8 willMoveToSuperview:v4];
  id v5 = [(PKTextAttachmentDrawingView *)self textAttachment];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    double v7 = [(PKTextAttachmentDrawingView *)self textAttachment];
    [v7 attachmentView:self willMoveToSuperview:v4];
  }
}

- (void)didMoveToSuperview
{
  v51.receiver = self;
  v51.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v51 didMoveToSuperview];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v4 = *MEMORY[0x1E4FB30A0];
  [v3 removeObserver:self name:*MEMORY[0x1E4FB30A0] object:0];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v6 = *MEMORY[0x1E4FB07F0];
  [v5 removeObserver:self name:*MEMORY[0x1E4FB07F0] object:0];

  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v8 = *MEMORY[0x1E4FB3298];
  [v7 removeObserver:self name:*MEMORY[0x1E4FB3298] object:0];

  int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v10 = *MEMORY[0x1E4FB2E80];
  [v9 removeObserver:self name:*MEMORY[0x1E4FB2E80] object:0];

  double v11 = [(PKTextAttachmentDrawingView *)self superview];

  if (v11)
  {
    [(PKTextAttachmentDrawingView *)self cleanupViewProviders];
    double v12 = [(PKTextAttachmentDrawingView *)self tiledView];
    [v12 _didAddDrawingAttachmentView];
    [(PKTextAttachmentDrawingView *)self updateFrameForTextContainer];
    [(PKTextAttachmentDrawingView *)self _triggerRedraw];
    [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility];
    if ([(PKTextAttachmentDrawingView *)self inserted])
    {
      uint64_t v49 = v10;
      double v13 = [(PKTextAttachmentDrawingView *)self window];
      double v14 = [v13 firstResponder];

      id v15 = [(PKTextAttachmentDrawingView *)self window];
      uint64_t v16 = +[PKToolPicker activeToolPickerForWindow:v15];
      int v17 = [v16 isVisible];

      [(PKTextAttachmentDrawingView *)self becomeFirstResponder];
      [(PKTextAttachmentDrawingView *)self setInserted:0];
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      uint64_t v19 = v18;
      unint64_t v20 = [(PKTextAttachmentDrawingView *)self _characterIndex] - 1;
      double v21 = 13.0;
      if (v20 <= 0x7FFFFFFFFFFFFFFDLL)
      {
        double v22 = [(PKTextAttachmentDrawingView *)self _textView];
        objc_msgSend(v22, "_pk_lineFragmentRectForGlyphAtCharacterIndex:", v20);
        double v24 = v23;

        double v21 = fmax(v24, 13.0);
      }
      if ([(PKTextAttachmentDrawingView *)self isAtEndOfDocument])
      {
        [(PKTextAttachmentDrawingView *)self _updateAttachmentBoundsEnsureLayout:0];
      }
      else
      {
        [(PKTextAttachmentDrawingView *)self bounds];
        -[PKTextAttachmentDrawingView setBounds:](self, "setBounds:");
        [(PKTextAttachmentDrawingView *)self _updateAttachmentBoundsEnsureLayout:0];
        [(PKTextAttachmentDrawingView *)self bounds];
        if (v27 < 240.0)
        {
          v28 = [(PKAttachmentView *)self drawing];
          v29 = [v28 strokes];
          uint64_t v48 = [v29 count];

          if (!v48)
          {
            [(PKTextAttachmentDrawingView *)self beginLiveResize];
            v50[0] = MEMORY[0x1E4F143A8];
            v50[1] = 3221225472;
            v50[2] = __49__PKTextAttachmentDrawingView_didMoveToSuperview__block_invoke;
            v50[3] = &unk_1E64CA140;
            v50[4] = self;
            *(double *)&v50[5] = v21;
            v50[6] = v19;
            id v30 = (id)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:1 repeats:v50 block:0.0166666667];
          }
        }
      }
      if (v17) {
        [v14 becomeFirstResponder];
      }

      uint64_t v10 = v49;
    }
    double v31 = [(PKTextAttachmentDrawingView *)self traitCollection];
    if (![v31 userInterfaceIdiom])
    {
      double v32 = [(PKTextAttachmentDrawingView *)self window];
      BOOL v33 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v32];

      if (v33) {
        goto LABEL_19;
      }
      double v31 = [(PKTextAttachmentDrawingView *)self tiledView];
      double v34 = [v31 selectionController];
      double v35 = -[PKSelectionController selectionInteraction](v34);
      [v35 setEnabled:0];
    }
LABEL_19:
    double v36 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v37 = [(PKTextAttachmentDrawingView *)self _textView];
    [v36 addObserver:self selector:sel__adjustResizeIndicatorVisibilityNotification name:v4 object:v37];

    v38 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v39 = [(PKTextAttachmentDrawingView *)self _textView];
    v40 = [v39 textStorage];
    [v38 addObserver:self selector:sel__adjustResizeIndicatorVisibilityNotification name:v6 object:v40];

    v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v41 addObserver:self selector:sel__updateAfterBackgroundSnapshotting_ name:v8 object:0];

    uint64_t v42 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v43 = [(PKTextAttachmentDrawingView *)self window];
    v44 = [v43 windowScene];
    [(id)v42 addObserver:self selector:sel__sceneDidActivate_ name:v10 object:v44];

    v45 = [(PKTextAttachmentDrawingView *)self textAttachment];
    LOBYTE(v42) = objc_opt_respondsToSelector();

    if (v42)
    {
      uint64_t v46 = [(PKTextAttachmentDrawingView *)self textAttachment];
      v47 = [(PKTextAttachmentDrawingView *)self superview];
      [v46 attachmentView:self didMoveToSuperview:v47];
    }
    goto LABEL_21;
  }
  uint64_t v25 = [(PKTextAttachmentDrawingView *)self textAttachment];
  char v26 = objc_opt_respondsToSelector();

  if ((v26 & 1) == 0) {
    return;
  }
  double v12 = [(PKTextAttachmentDrawingView *)self textAttachment];
  [v12 attachmentView:self didMoveToSuperview:0];
LABEL_21:
}

void __49__PKTextAttachmentDrawingView_didMoveToSuperview__block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  [*(id *)(a1 + 32) bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  if (v8 < 240.0)
  {
    double v10 = v3;
    double v11 = [*(id *)(a1 + 32) drawing];
    double v12 = [v11 strokes];
    uint64_t v13 = [v12 count];

    if (!v13)
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      UIRoundToViewScale();
      double v9 = fmin(v14, 240.0);
      objc_msgSend(*(id *)(a1 + 32), "setBounds:", v5, v10, v7, v9);
      objc_msgSend(*(id *)(a1 + 32), "setLiveResizeAttachmentBounds:", v5, v10, v7, v9);
      [*(id *)(a1 + 32) _updateAttachmentBoundsEnsureLayout:0];
    }
  }
  if (v9 >= 240.0)
  {
    [v22 invalidate];
    [*(id *)(a1 + 32) endLiveResize];
    if (([*(id *)(a1 + 32) isFirstResponder] & 1) == 0) {
      [*(id *)(a1 + 32) becomeFirstResponder];
    }
    [*(id *)(a1 + 32) drawingBounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [*(id *)(a1 + 32) canvasHeightFromDrawingViewHeight:v9 drawingViewWidth:v7];
    objc_msgSend(*(id *)(a1 + 32), "setDrawingCanvasBounds:", v16, v18, v20, v21);
  }
}

- (void)_sceneDidActivate:(id)a3
{
  double v4 = [(PKTextAttachmentDrawingView *)self textAttachment];
  int v5 = [v4 pkAttachmentBoundsMightBeInvalid];

  if (v5)
  {
    [(PKTextAttachmentDrawingView *)self updateFrameForTextContainer];
  }
}

- (void)_updateAfterBackgroundSnapshotting:(id)a3
{
  id v7 = [(PKTextAttachmentDrawingView *)self textAttachment];
  if ([v7 pkAttachmentBoundsMightBeInvalid])
  {
    double v4 = [(PKTextAttachmentDrawingView *)self window];
    int v5 = [v4 windowScene];
    uint64_t v6 = [v5 activationState];

    if (!v6)
    {
      [(PKTextAttachmentDrawingView *)self updateFrameForTextContainer];
    }
  }
  else
  {
  }
}

- (id)tiledView
{
  v2 = [(PKTextAttachmentDrawingView *)self _textView];
  double v3 = [v2 _pkTiledViewIfEnabled];

  return v3;
}

- (void)setContentHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  -[PKAttachmentView setContentHidden:](&v5, sel_setContentHidden_);
  [(PKLinedPaperLayer *)self->_linesLayer setHidden:v3];
}

- (void)_triggerRedraw
{
  id v2 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v2 _layoutSubviews];
  [v2 updateTilesForVisibleRect];
}

- (id)_textView
{
  id v2 = [(PKTextAttachmentDrawingView *)self superview];
  if (v2)
  {
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v3 = [v2 superview];

      id v2 = (void *)v3;
    }
    while (v3);
  }

  return v2;
}

- (int64_t)_characterIndex
{
  uint64_t v10 = 0;
  double v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  uint64_t v3 = [(PKTextAttachmentDrawingView *)self _textView];
  double v4 = [v3 textStorage];

  uint64_t v5 = [v4 length];
  uint64_t v6 = *MEMORY[0x1E4FB06B8];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__PKTextAttachmentDrawingView__characterIndex__block_invoke;
  v9[3] = &unk_1E64CA168;
  v9[4] = self;
  v9[5] = &v10;
  objc_msgSend(v4, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v5, 0, v9);
  int64_t v7 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void __46__PKTextAttachmentDrawingView__characterIndex__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  double v8 = (id *)(*(void *)(a1 + 32) + 792);
  id v9 = a2;
  id WeakRetained = objc_loadWeakRetained(v8);

  if (WeakRetained == v9)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a5 = 1;
  }
}

- (void)_updateAttachmentBoundsEnsureLayout:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(PKTextAttachmentDrawingView *)self _textView];
  uint64_t v6 = [v5 textLayoutManager];

  id v31 = [(PKTextAttachmentDrawingView *)self _textView];
  int64_t v7 = [(PKTextAttachmentDrawingView *)self _characterIndex];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
  [WeakRetained bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  [(PKTextAttachmentDrawingView *)self bounds];
  v34.origin.double x = v17;
  v34.origin.double y = v18;
  v34.size.double width = v19;
  v34.size.double height = v20;
  v33.origin.double x = v10;
  v33.origin.double y = v12;
  v33.size.double width = v14;
  v33.size.double height = v16;
  BOOL v21 = CGRectEqualToRect(v33, v34);

  [(PKTextAttachmentDrawingView *)self bounds];
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  id v30 = objc_loadWeakRetained((id *)&self->_textAttachment);
  objc_msgSend(v30, "setBounds:", v23, v25, v27, v29);

  if (v3 || !v6 || !v21) {
    objc_msgSend(v31, "_pk_invalidateLayoutForCharacterRange:invalidateDisplay:ensureLayout:", v7, 1, 1, v3);
  }
  [(PKTextAttachmentDrawingView *)self _triggerRedraw];
}

- (CGSize)drawingVisibleSize
{
  BOOL v3 = [(PKTextAttachmentDrawingView *)self _textView];
  [(PKTextAttachmentDrawingView *)self desiredAttachmentViewWidthForContainerView:v3];
  double v5 = v4;

  [(PKTextAttachmentDrawingView *)self drawingScaleForViewWidth:v5];
  double v7 = v6;
  [(PKTextAttachmentDrawingView *)self drawingCanvasBounds];
  double v9 = fmax(v7 * v8, 58.0);
  double v10 = v5;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGRect)drawingBounds
{
  [(PKTextAttachmentDrawingView *)self drawingCanvasBounds];
  double v6 = v5;
  if (fabs(v7) == INFINITY || fabs(v3) == INFINITY || (double v8 = v4, v9 = fabs(v4), v9 >= INFINITY) && v9 <= INFINITY)
  {
    double v10 = [(PKAttachmentView *)self drawing];
    [v10 bounds];
    double v6 = v11;
    double v8 = v12;
  }
  double v13 = 0.0;
  if (fabs(v6) == INFINITY) {
    double v14 = 0.0;
  }
  else {
    double v14 = v6;
  }
  double v15 = 768.0;
  double v16 = v8;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (void)didBeginDrawing
{
  v3.receiver = self;
  v3.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v3 didBeginDrawing];
  [(PKTextAttachmentDrawingView *)self becomeFirstResponder];
}

- (void)drawingDidChangeVisibleStrokes:(BOOL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v15 drawingDidChangeVisibleStrokes:a3];
  double v4 = [(PKTextAttachmentDrawingView *)self textAttachment];
  char v5 = objc_opt_respondsToSelector();
  os_log_t v6 = [(PKAttachmentView *)self drawing];
  if (v5)
  {
    [v4 drawingDataDidChange:v6 view:self];
  }
  else
  {
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();

    if (v7 == v8)
    {
      os_log_t v6 = [(PKAttachmentView *)self drawing];
      double v9 = [v6 serialize];
      double v10 = [(PKTextAttachmentDrawingView *)self textAttachment];
      [v10 setContents:v9];
    }
    else
    {
      os_log_t v6 = os_log_create("com.apple.pencilkit", "");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        double v11 = [(PKAttachmentView *)self drawing];
        double v12 = (objc_class *)objc_opt_class();
        double v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138412290;
        CGFloat v17 = v13;
        _os_log_error_impl(&dword_1C44F8000, v6, OS_LOG_TYPE_ERROR, "Unexpected drawing class in attachment view: %@", buf, 0xCu);
      }
    }
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PKTextAttachmentDrawingView_drawingDidChangeVisibleStrokes___block_invoke;
  block[3] = &unk_1E64C61C0;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __62__PKTextAttachmentDrawingView_drawingDidChangeVisibleStrokes___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _textView];
  id v2 = [v5 _pkTiledViewIfEnabled];
  objc_super v3 = [v2 selectionController];
  double v4 = [*(id *)(a1 + 32) drawing];
  -[PKSelectionController updateCurrentSelectionWithNewDrawingIfNecessary:]((uint64_t)v3, v4);
}

- (void)toolPickerDidShow
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v8 toolPickerDidShow];
  [(PKTextAttachmentDrawingView *)self resetZoom];
  objc_super v3 = [(PKTextAttachmentDrawingView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4)
  {
    id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
    os_log_t v6 = [v5 selectionController];
    uint64_t v7 = -[PKSelectionController selectionInteraction](v6);
    [v7 setEnabled:1];
  }
}

- (void)toolPickerDidHide
{
  v8.receiver = self;
  v8.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v8 toolPickerDidHide];
  objc_super v3 = [(PKTextAttachmentDrawingView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (!v4)
  {
    id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
    os_log_t v6 = [v5 selectionController];
    uint64_t v7 = -[PKSelectionController selectionInteraction](v6);
    [v7 setEnabled:0];
  }
}

- (void)fingerDrawingEnabledDidChange
{
  objc_super v3 = [(PKTextAttachmentDrawingView *)self tiledView];
  uint64_t v4 = [v3 allowsFingerDrawing];

  [(PKTextAttachmentResizeView *)self->_topResizeView setEnabled:v4 ^ 1];
  [(PKTextAttachmentResizeView *)self->_bottomResizeView setEnabled:v4 ^ 1];

  [(PKTextAttachmentDrawingView *)self _updateResizeTouchInsetsFingerDrawingEnabled:v4];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(PKTextAttachmentDrawingView *)self isHidden];
  v6.receiver = self;
  v6.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKTextAttachmentDrawingView *)&v6 setHidden:v3];
  if (v5)
  {
    if (!v3) {
      [(PKTextAttachmentDrawingView *)self _triggerRedraw];
    }
  }
}

- (CGSize)desiredTextAttachmentSizeForContainerView:(id)a3
{
  [(PKTextAttachmentDrawingView *)self desiredAttachmentViewWidthForContainerView:a3];
  double v5 = v4;
  -[PKTextAttachmentDrawingView drawingScaleForViewWidth:](self, "drawingScaleForViewWidth:");
  double v7 = v6;
  [(PKTextAttachmentDrawingView *)self drawingBounds];
  double v9 = v8;
  [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
  double v11 = v10;
  [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
  double v13 = v11 + v12;
  [(PKTextAttachmentDrawingView *)self zoomScale];
  double v15 = v13 + fmax(v7 * v9 * v14, 58.0);
  double v16 = v5;
  result.double height = v15;
  result.double width = v16;
  return result;
}

- (void)updateFrameForTextContainer
{
  [(PKTextAttachmentDrawingView *)self frame];
  CGFloat v4 = v3;
  double v5 = [(PKTextAttachmentDrawingView *)self _textView];
  id v50 = v5;
  if (v5)
  {
    double v6 = [v5 window];
    double v7 = [v6 screen];
    [v7 scale];
    double v9 = v8;
  }
  else
  {
    double v6 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v6 scale];
    double v9 = v10;
  }

  [(PKTextAttachmentDrawingView *)self desiredTextAttachmentSizeForContainerView:v50];
  double v12 = v11;
  double v14 = v13;
  [(PKAttachmentView *)self setFrame:DKDRoundedRectForScale(0.0, v4, v11, v13, v9)];
  double v15 = [(PKTextAttachmentDrawingView *)self window];
  double v16 = [v15 windowScene];
  int v17 = [v16 _isPerformingSystemSnapshot];

  uint64_t v18 = [(PKTextAttachmentDrawingView *)self textAttachment];
  uint64_t v19 = [v18 pkAttachmentBoundsMightBeInvalid] | v17;

  [(PKTextAttachmentDrawingView *)self _updateAttachmentBoundsEnsureLayout:v19];
  [(UIScrollView *)self->_tileMaskView contentSize];
  double v21 = v20;
  [(UIScrollView *)self->_tileMaskView contentOffset];
  double v23 = v22;
  double v25 = v24;
  [(UIScrollView *)self->_tileMaskView frame];
  double v27 = v26;
  -[UIScrollView setFrame:](self->_tileMaskView, "setFrame:", 0.0, 0.0, v12, v14);
  [(PKTextAttachmentDrawingView *)self drawingVisibleSize];
  double v29 = v28;
  double v31 = v30;
  [(PKTextAttachmentDrawingView *)self zoomScale];
  double v33 = v29 * v32;
  [(PKTextAttachmentDrawingView *)self zoomScale];
  -[UIScrollView setContentSize:](self->_tileMaskView, "setContentSize:", v33, v31 * v34);
  -[UIScrollView setContentOffset:](self->_tileMaskView, "setContentOffset:", v23, v25);
  [(UIView *)self->_tileScaleView frame];
  double v36 = v35;
  double v38 = v37;
  [(PKTextAttachmentDrawingView *)self zoomScale];
  double v40 = v12 * v39;
  [(PKTextAttachmentDrawingView *)self zoomScale];
  -[UIView setFrame:](self->_tileScaleView, "setFrame:", v36, v38, v40, v14 * v41);
  [(UIScrollView *)self->_tileMaskView frame];
  if (v42 != v27 && v23 != 0.0 && v21 > 0.0)
  {
    [(UIScrollView *)self->_tileMaskView contentSize];
    -[UIScrollView setContentOffset:](self->_tileMaskView, "setContentOffset:", v23 / v21 * v43, 0.0);
  }
  if (v17)
  {
    v44 = [(PKTextAttachmentDrawingView *)self textAttachment];
    v45 = v44;
    uint64_t v46 = 1;
  }
  else
  {
    v47 = [(PKTextAttachmentDrawingView *)self window];
    uint64_t v48 = [v47 windowScene];
    uint64_t v49 = [v48 activationState];

    if (v49) {
      goto LABEL_13;
    }
    v44 = [(PKTextAttachmentDrawingView *)self textAttachment];
    v45 = v44;
    uint64_t v46 = 0;
  }
  [v44 setPkAttachmentBoundsMightBeInvalid:v46];

LABEL_13:
}

- (void)_updateViewHeightIfNecessary
{
  [(PKTextAttachmentDrawingView *)self drawingCanvasBounds];
  if (fabs(v3) == INFINITY)
  {
    double v9 = [(PKAttachmentView *)self drawing];
    [(PKTextAttachmentDrawingView *)self heightFromDrawing:v9 delta:0.0];
    double v8 = v10;
  }
  else
  {
    double v4 = v3;
    [(PKTextAttachmentDrawingView *)self drawingTransform];
    [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
    double v6 = v5;
    [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
    double v8 = -(v6 + v7 - v4 * sqrt(v12 * v12 + v11 * v11));
  }
  if (fabs(v8) != INFINITY) {
    [(PKTextAttachmentDrawingView *)self updateDrawingHeight:0 notifyDrawingDidChange:v8];
  }
}

- (void)_adjustResizeIndicatorVisibilityNotification
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__PKTextAttachmentDrawingView__adjustResizeIndicatorVisibilityNotification__block_invoke;
    block[3] = &unk_1E64C61C0;
    void block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __75__PKTextAttachmentDrawingView__adjustResizeIndicatorVisibilityNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _adjustResizeIndicatorVisibility];
}

- (void)_adjustResizeIndicatorVisibility
{
}

- (void)_adjustResizeIndicatorVisibility:(BOOL)a3 highlightBackground:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v7 = [(PKTextAttachmentDrawingView *)self isFirstResponder];

  [(PKTextAttachmentDrawingView *)self _setAdjustResizeIndicatorVisible:v7 animated:v5 highlightBackground:v4];
}

- (void)_setAdjustResizeIndicatorVisible:(BOOL)a3 animated:(BOOL)a4 highlightBackground:(BOOL)a5
{
  BOOL v6 = a4;
  if (a3)
  {
    [(PKTextAttachmentDrawingView *)self frame];
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    if (v10 > 1.0 && !a5)
    {
      uint64_t v8 = [(PKTextAttachmentDrawingView *)self isAtBeginningOfDocument] ^ 1;
      uint64_t v9 = [(PKTextAttachmentDrawingView *)self isAtEndOfDocument] ^ 1;
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  topResizeView = self->_topResizeView;
  double v12 = [(PKTextAttachmentDrawingView *)self tiledView];
  -[PKTextAttachmentResizeView show:enabled:animated:](topResizeView, "show:enabled:animated:", v8, [v12 allowsFingerDrawing] ^ 1, v6);

  bottomResizeView = self->_bottomResizeView;
  double v14 = [(PKTextAttachmentDrawingView *)self tiledView];
  -[PKTextAttachmentResizeView show:enabled:animated:](bottomResizeView, "show:enabled:animated:", v9, [v14 allowsFingerDrawing] ^ 1, v6);

  if (a5)
  {
    double v15 = [(PKTextAttachmentDrawingView *)self _textView];
    double v16 = [v15 selectionHighlightColor];
    [(PKTextAttachmentDrawingView *)self setBackgroundColor:v16];
  }
  else
  {
    [(PKTextAttachmentDrawingView *)self setBackgroundColor:0];
  }
  int v17 = [(PKTextAttachmentDrawingView *)self tiledView];
  -[PKTextAttachmentDrawingView _updateResizeTouchInsetsFingerDrawingEnabled:](self, "_updateResizeTouchInsetsFingerDrawingEnabled:", [v17 allowsFingerDrawing]);

  uint64_t v18 = [(PKAttachmentView *)self drawing];

  if (v18)
  {
    [(PKTextAttachmentDrawingView *)self layoutTileViews];
  }
}

- (double)heightFromDrawing:(id)a3 delta:(double)a4
{
  [a3 bounds];
  CGFloat v6 = CGRectGetMaxY(v11) + a4;
  [(PKTextAttachmentDrawingView *)self drawingBounds];
  CGFloat v7 = v6 - CGRectGetMinY(v12);
  [(PKTextAttachmentDrawingView *)self drawingTransform];
  return v7 * sqrt(v10 * v10 + v9 * v9);
}

- (double)canvasHeightFromDrawingViewHeight:(double)a3
{
  [(PKTextAttachmentDrawingView *)self frame];

  [(PKTextAttachmentDrawingView *)self canvasHeightFromDrawingViewHeight:a3 drawingViewWidth:v5];
  return result;
}

- (double)canvasHeightFromDrawingViewHeight:(double)a3 drawingViewWidth:(double)a4
{
  [(PKTextAttachmentDrawingView *)self drawingScaleForViewWidth:a4];
  double v7 = v6;
  [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
  double v9 = v8;
  [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
  double v11 = a3 - (v9 + v10);
  [(PKTextAttachmentDrawingView *)self zoomScale];
  return v11 / (v7 * v12);
}

- (void)updateDrawingHeight:(double)a3
{
}

- (void)updateDrawingHeight:(double)a3 notifyDrawingDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
  double v8 = v7 + a3;
  [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
  double v10 = v8 + v9;
  [(PKTextAttachmentDrawingView *)self bounds];
  [(PKTextAttachmentDrawingView *)self _setHeight:0 originalHeight:v10 growFromTop:v11];
  if (v4)
  {
    [(PKTextAttachmentDrawingView *)self drawingDidChangeVisibleStrokes:0];
  }
}

- (void)_setHeight:(double)a3 originalHeight:(double)a4 growFromTop:(BOOL)a5
{
  BOOL v5 = a5;
  id v88 = [(PKTextAttachmentDrawingView *)self _textView];
  [(PKTextAttachmentDrawingView *)self frame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = v13 * 58.0;
  [(PKTextAttachmentDrawingView *)self drawingBounds];
  double v19 = fmax(v17 / v18, 8.0);
  double v20 = fabs(a3);
  if (v19 >= a3) {
    double v21 = v19;
  }
  else {
    double v21 = a3;
  }
  if (v20 == INFINITY) {
    double v22 = v19;
  }
  else {
    double v22 = v21;
  }
  double v23 = v22;
  if (v22 != v16)
  {
    double v81 = v16;
    double v82 = a4;
    double v85 = v12;
    double v86 = v10;
    double v78 = v22 - v16;
    [v88 contentOffset];
    [(PKTextAttachmentDrawingView *)self drawingBounds];
    CGFloat v83 = v24;
    CGFloat v80 = v25;
    double v87 = v26;
    CGFloat rect = v27;
    [(PKTextAttachmentDrawingView *)self frame];
    [(PKTextAttachmentDrawingView *)self drawingBoundsForViewWidth:v28];
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    double v84 = v14;
    [(PKTextAttachmentDrawingView *)self drawingScaleForViewWidth:v14];
    double v79 = 1.0 / v37;
    [v88 contentInset];
    double v39 = v38;
    [v88 _contentScrollInset];
    if (v5)
    {
      v90.origin.double x = v30;
      v90.origin.double y = v32;
      v90.size.double width = v34;
      v90.size.double height = v36;
      if (CGRectIsEmpty(v90))
      {
        double v41 = v88;
        double v43 = v83;
        double v42 = v84;
        double v44 = v78;
        double v45 = v79;
      }
      else
      {
        v93.origin.double x = v30;
        v93.origin.double y = v32;
        v93.size.double width = v34;
        v93.size.double height = v36;
        double MinY = CGRectGetMinY(v93);
        [(PKTextAttachmentDrawingView *)self drawingBounds];
        double v56 = MinY * v55 / -768.0;
        double v43 = v83;
        v94.origin.double x = v83;
        v94.origin.double y = v80;
        v94.size.double width = v87;
        v94.size.double height = rect;
        CGFloat v57 = CGRectGetMinY(v94) + v56;
        [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
        double v59 = fmin(v58 + v57, 0.0);
        double v44 = v78;
        double v45 = v79;
        if (v78 < v59) {
          double v44 = v59;
        }
        double v41 = v88;
        double v42 = v84;
      }
      double v60 = v44;
      [v41 contentOffset];
      objc_msgSend(v88, "setContentOffset:");
      double v61 = v81 + v60;
      double v62 = v81 + v60 - v82;
      [(PKTextAttachmentDrawingView *)self canvasHeightFromDrawingViewHeight:v81 + v60];
      double v64 = v63;
      [(PKTextAttachmentResizeView *)self->_topResizeView originalDrawingBounds];
      double v66 = v65;
      [(PKTextAttachmentDrawingView *)self zoomScale];
      double v68 = v66 - v45 * v62 / v67;
      double v51 = v85;
    }
    else
    {
      double v46 = v39 + v40;
      [v88 contentSize];
      double v48 = v46 + v47;
      [v88 bounds];
      double v49 = v48 - CGRectGetMaxY(v91);
      if (v49 >= 0.0) {
        double v50 = v49;
      }
      else {
        double v50 = 0.0;
      }
      v92.origin.double x = v30;
      v92.origin.double y = v32;
      v92.size.double width = v34;
      v92.size.double height = v36;
      if (CGRectIsEmpty(v92))
      {
        double v42 = v84;
        double v51 = v85;
        double v43 = v83;
        double v52 = v78;
        double v53 = v79;
      }
      else
      {
        v95.origin.double x = v30;
        v95.origin.double y = v32;
        v95.size.double width = v34;
        v95.size.double height = v36;
        double MaxY = CGRectGetMaxY(v95);
        double v43 = v83;
        v96.origin.double x = v83;
        v96.origin.double y = v80;
        v96.size.double width = v87;
        v96.size.double height = rect;
        double v53 = v79;
        double v70 = (MaxY - CGRectGetMaxY(v96)) / v79;
        [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
        double v72 = fmin(v70 - v71, 0.0);
        double v52 = v78;
        if (v78 < v72) {
          double v52 = v72;
        }
        double v42 = v84;
        double v51 = v85;
      }
      double v73 = v23 - v82;
      if (v50 >= v23 - v82) {
        double v73 = v50;
      }
      double v74 = -v73;
      if (v52 >= v74) {
        double v74 = v52;
      }
      double v61 = v81 + v74;
      double v75 = v53 * (v81 + v74);
      [(PKTextAttachmentDrawingView *)self zoomScale];
      double v64 = v75 / v76;
      double v68 = v80;
    }
    -[PKTextAttachmentDrawingView setDrawingCanvasBounds:](self, "setDrawingCanvasBounds:", v43, v68, v87, v64);
    -[PKAttachmentView setFrame:](self, "setFrame:", v86, v51, v42, v61);
    [(PKTextAttachmentDrawingView *)self _updateAttachmentBoundsEnsureLayout:1];
  }
}

- (BOOL)hitChrome:(CGPoint)a3 isStylus:(BOOL)a4
{
  double v4 = 80.0;
  if (a4) {
    double v4 = 40.0;
  }
  return -[PKTextAttachmentDrawingView hitTestResizeHandles:threshold:](self, "hitTestResizeHandles:threshold:", a3.x, a3.y, v4);
}

- (BOOL)hitByTouchLocation:(CGPoint)a3 bounds:(CGRect)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  CGRect v20 = CGRectInset(a4, -64.0, 0.0);
  CGFloat v7 = v20.origin.x;
  double v8 = v20.origin.y;
  CGFloat width = v20.size.width;
  double height = v20.size.height;
  int64_t v11 = [(PKTextAttachmentDrawingView *)self _characterIndex];
  if (v11) {
    double v12 = v8;
  }
  else {
    double v12 = v8 + -16.0;
  }
  if (v11) {
    double v13 = height;
  }
  else {
    double v13 = height + 16.0;
  }
  CGFloat v14 = v7;
  CGFloat v15 = width;
  CGFloat v16 = x;
  CGFloat v17 = y;

  return CGRectContainsPoint(*(CGRect *)(&v12 - 1), *(CGPoint *)&v16);
}

- (BOOL)hitTestResizeHandles:(CGPoint)a3 threshold:(double)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PKTextAttachmentDrawingView *)self bounds];
  double v10 = v9;
  double v11 = v8;
  double v12 = a4 * 0.5;
  if (a4 * 0.5 + v8 * 0.5 >= a4) {
    double v13 = a4;
  }
  else {
    double v13 = a4 * 0.5 + v8 * 0.5;
  }
  if ([(PKTextAttachmentDrawingView *)self effectiveUserInterfaceLayoutDirection] == 1)double v14 = v10 - v12; {
  else
  }
    double v14 = a4 * -0.5;
  v21.origin.CGFloat x = v14;
  v21.size.CGFloat width = a4;
  v21.size.double height = v13;
  v19.CGFloat x = x;
  v19.CGFloat y = y;
  v21.origin.CGFloat y = a4 * -0.5;
  if (CGRectContainsPoint(v21, v19) && [(PKTextAttachmentResizeView *)self->_topResizeView shown])
  {
    LOBYTE(v15) = 1;
  }
  else
  {
    v22.origin.CGFloat y = v12 + v11 - v13;
    v22.origin.CGFloat x = v14;
    v22.size.CGFloat width = a4;
    v22.size.double height = v13;
    v20.CGFloat x = x;
    v20.CGFloat y = y;
    BOOL v15 = CGRectContainsPoint(v22, v20);
    if (v15)
    {
      bottomResizeView = self->_bottomResizeView;
      LOBYTE(v15) = [(PKTextAttachmentResizeView *)bottomResizeView shown];
    }
  }
  return v15;
}

- (void)tapBelowDrawingGesture:(id)a3
{
  if ([(PKTextAttachmentDrawingView *)self isFirstResponder])
  {
    [(PKTextAttachmentDrawingView *)self resignFirstResponder];
    double v4 = [(PKTextAttachmentDrawingView *)self window];
    BOOL v5 = [v4 firstResponder];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 resignFirstResponder];
    }
  }
  double v6 = [(PKTextAttachmentDrawingView *)self window];
  id v7 = +[PKToolPicker activeToolPickerForWindow:v6];

  [v7 _tellDelegateToHideToolPicker];
}

- (id)_drawingGestureRecognizer
{
  id v2 = [(PKTextAttachmentDrawingView *)self _textView];
  double v3 = [v2 _pkTiledViewIfEnabled];
  double v4 = [v3 drawingGestureRecognizer];

  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  double v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  double v8 = v7;
  if ((UITapGestureRecognizer *)self->_resizeDragGestureRecognizer == v6
    || (UITapGestureRecognizer *)self->_resizeHighlightGestureRecognizer == v6
    || self->_showMenuGestureRecognizer == v6)
  {
    [v7 locationInView:self];
    double v11 = v10;
    double v13 = v12;
    +[PKTextAttachmentResizeView resizeHitSize];
    if (-[PKTextAttachmentDrawingView hitTestResizeHandles:threshold:](self, "hitTestResizeHandles:threshold:", v11, v13, v14))
    {
      if (self->_showMenuGestureRecognizer != v6)
      {
        BOOL v15 = [MEMORY[0x1E4FB1978] sharedMenuController];
        [v15 hideMenu];

        [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility];
      }
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    NSClassFromString(&cfstr_Uitextselectio.isa);
    char v9 = objc_opt_isKindOfClass() ^ 1;
  }

  return v9 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  double v6 = (UIPanGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = [(PKTextAttachmentDrawingView *)self showMenuGestureRecognizer];
  if (v8 == v7)
  {
    NSClassFromString(&cfstr_Uitextselectio.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
LABEL_7:
      BOOL v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  if (self->_resizeDragGestureRecognizer == v6)
  {
    id v10 = [(PKTextAttachmentDrawingView *)self showMenuGestureRecognizer];

    if (v10 == v7) {
      goto LABEL_7;
    }
  }
  id v11 = [(PKTextAttachmentDrawingView *)self _drawingGestureRecognizer];
  BOOL v12 = v11 == v7;

LABEL_8:
  return v12;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = (UITapGestureRecognizer *)a4;
  uint64_t v8 = [(PKTextAttachmentDrawingView *)self _drawingGestureRecognizer];
  if ((id)v8 == v6)
  {

    goto LABEL_7;
  }
  char v9 = (void *)v8;
  id v10 = [(PKTextAttachmentDrawingView *)self _drawingGestureRecognizer];

  if (v10 == v7) {
    goto LABEL_7;
  }
  resizeDragGestureRecognizer = self->_resizeDragGestureRecognizer;
  resizeHighlightGestureRecognizer = self->_resizeHighlightGestureRecognizer;
  if (resizeDragGestureRecognizer == v6)
  {
    BOOL v14 = resizeHighlightGestureRecognizer == (PKTextAttachmentDrawingViewTouchRecognizer *)v7;
    goto LABEL_11;
  }
  if (resizeHighlightGestureRecognizer != v6)
  {
    NSClassFromString(&cfstr_Uitextselectio.isa);
    objc_opt_isKindOfClass();
    BOOL v13 = 0;
    goto LABEL_14;
  }
  if (resizeDragGestureRecognizer == (UIPanGestureRecognizer *)v7)
  {
LABEL_7:
    BOOL v13 = 1;
    goto LABEL_14;
  }
  BOOL v14 = self->_showMenuGestureRecognizer == v7;
LABEL_11:
  BOOL v13 = v14;
LABEL_14:

  return v13;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (UITapGestureRecognizer *)a3;
  [(UITapGestureRecognizer *)v4 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [(PKTextAttachmentDrawingView *)self bounds];
  BOOL v13 = -[PKTextAttachmentDrawingView hitByTouchLocation:bounds:](self, "hitByTouchLocation:bounds:", v6, v8, v9, v10, v11, v12);
  if (self->_tapBelowDrawingGestureRecognizer != v4)
  {
    BOOL v14 = -[PKAttachmentView inlineViewAtPoint:](self, "inlineViewAtPoint:", v6, v8);
    BOOL v15 = v14;
    if (!v14 || ([v14 alpha], v16 <= 0.0))
    {
      if (self->_eatKeyboardGestureRecognizer == v4)
      {
        char v17 = 1;
        goto LABEL_16;
      }
      if (self->_showMenuGestureRecognizer == v4)
      {
        if ([(PKTextAttachmentDrawingView *)self isFirstResponder])
        {
          double v18 = [MEMORY[0x1E4FB1978] sharedMenuController];
          char v17 = [v18 isMenuVisible] ^ 1;
LABEL_14:

          goto LABEL_16;
        }
      }
      else
      {
        if ((UITapGestureRecognizer *)self->_hideMenuGestureRecognizer != v4)
        {
          NSClassFromString(&cfstr_Uitextselectio.isa);
          char v17 = objc_opt_isKindOfClass() ^ 1;
LABEL_16:

          goto LABEL_17;
        }
        if ([(PKTextAttachmentDrawingView *)self isFirstResponder])
        {
          double v18 = [MEMORY[0x1E4FB1978] sharedMenuController];
          char v17 = [v18 isMenuVisible];
          goto LABEL_14;
        }
      }
    }
    char v17 = 0;
    goto LABEL_16;
  }
  char v17 = !v13;
LABEL_17:

  return v17 & 1;
}

- (BOOL)gestureRecognizerShouldDelayLift:(id)a3
{
  double v4 = (PKTextAttachmentDrawingViewTouchRecognizer *)a3;
  double v5 = (UITapGestureRecognizer *)v4;
  if (self->_resizeHighlightGestureRecognizer == v4
    || (PKTextAttachmentDrawingViewTouchRecognizer *)self->_resizeDragGestureRecognizer == v4)
  {
    BOOL v9 = 1;
  }
  else
  {
    double v6 = [(PKTextAttachmentDrawingView *)self tiledView];
    double v7 = [v6 canvasView];
    double v8 = [v7 drawingGestureRecognizer];
    BOOL v9 = v8 == v5 || self->_showMenuGestureRecognizer == v5;
  }
  return v9;
}

- (void)higlightResize:(id)a3
{
  id v10 = a3;
  uint64_t v4 = [v10 state];
  if (v4 == 5 || v4 == 3)
  {
    double v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__bottomResizeView;
    [(PKTextAttachmentResizeView *)self->_topResizeView setHighlighted:0];
    uint64_t v7 = 0;
  }
  else
  {
    if (v4 != 1) {
      goto LABEL_13;
    }
    [v10 locationInView:self];
    double v9 = v8;
    [(PKTextAttachmentDrawingView *)self bounds];
    if (v9 >= CGRectGetMidY(v12)) {
      double v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__bottomResizeView;
    }
    else {
      double v6 = &OBJC_IVAR___PKTextAttachmentDrawingView__topResizeView;
    }
    uint64_t v7 = 1;
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa + *v6) setHighlighted:v7];
LABEL_13:
}

- (void)resizeDrawing:(id)a3
{
  id v9 = a3;
  if ([v9 state] == 1)
  {
    [v9 locationInView:self];
    double v5 = v4;
    [(PKTextAttachmentDrawingView *)self bounds];
    BOOL resizeUpper = v5 < CGRectGetMidY(v11);
    self->_BOOL resizeUpper = resizeUpper;
  }
  else
  {
    BOOL resizeUpper = self->_resizeUpper;
  }
  BOOL v7 = !resizeUpper;
  uint64_t v8 = 7;
  if (v7) {
    uint64_t v8 = 8;
  }
  [*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR___PKTextAttachmentDrawingView__cachedDrawingTransform[v8]) handleGesture:v9];
}

- (void)hideDrawingMenu:(id)a3
{
  double v4 = objc_msgSend(MEMORY[0x1E4FB1978], "sharedMenuController", a3);
  [v4 hideMenu];

  double v5 = [(PKTextAttachmentDrawingView *)self _textView];
  [v5 setSelectedTextRange:0];

  [(PKTextAttachmentDrawingView *)self resignFirstResponder];
}

- (void)showDrawingMenu:(id)a3
{
  id v5 = a3;
  if (([(PKTextAttachmentDrawingView *)self isFirstResponder] & 1) == 0) {
    [(PKTextAttachmentDrawingView *)self becomeFirstResponder];
  }
  if ([v5 state] == 3)
  {
    double v4 = [MEMORY[0x1E4FB1978] sharedMenuController];
    if ([v4 isMenuVisible])
    {
      [v4 hideMenu];
    }
    else
    {
      [v5 locationInView:self];
      objc_msgSend(v4, "showMenuFromView:rect:", self);
    }
    [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility:1 highlightBackground:1];
  }
}

- (BOOL)canBecomeFirstResponder
{
  id v2 = [(PKTextAttachmentDrawingView *)self _textView];
  char v3 = [v2 _canSelectDrawing];

  return v3;
}

- (BOOL)becomeFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  BOOL v3 = [(PKTextAttachmentDrawingView *)&v5 becomeFirstResponder];
  [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility:1 highlightBackground:0];
  return v3;
}

- (BOOL)canResignFirstResponder
{
  return !self->_isLiveResizing;
}

- (BOOL)resignFirstResponder
{
  v5.receiver = self;
  v5.super_class = (Class)PKTextAttachmentDrawingView;
  BOOL v3 = [(PKTextAttachmentDrawingView *)&v5 resignFirstResponder];
  [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility:1 highlightBackground:0];
  return v3;
}

- (id)keyCommands
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v2 = [(PKTextAttachmentDrawingView *)self tiledView];
  int v3 = [v2 _hasSelection];

  _PencilKitBundle();
  if (v3) {
    char v17 = {;
  }
    double v4 = [v17 localizedStringForKey:@"Copy strokes" value:@"Copy strokes" table:@"Localizable"];
    objc_super v5 = __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(@"c", 0x100000, (uint64_t)sel_copyStrokeSelection_, v4);
    v20[0] = v5;
    double v18 = _PencilKitBundle();
    double v16 = [v18 localizedStringForKey:@"Cut strokes" value:@"Cut strokes" table:@"Localizable"];
    double v6 = __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(@"x", 0x100000, (uint64_t)sel_cutStrokeSelection_, v16);
    v20[1] = v6;
    BOOL v7 = _PencilKitBundle();
    uint64_t v8 = [v7 localizedStringForKey:@"Paste strokes" value:@"Paste strokes" table:@"Localizable"];
    id v9 = __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(@"v", 0x100000, (uint64_t)sel_paste_, v8);
    v20[2] = v9;
    id v10 = _PencilKitBundle();
    CGRect v11 = [v10 localizedStringForKey:@"Delete strokes" value:@"Delete strokes" table:@"Localizable"];
    CGRect v12 = __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(@"\b", 0, (uint64_t)sel_deleteStrokeSelection_, v11);
    v20[3] = v12;
    BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];

    BOOL v14 = v17;
  }
  else {
    BOOL v14 = {;
  }
    double v4 = [v14 localizedStringForKey:@"Select All" value:@"Select All" table:@"Localizable"];
    objc_super v5 = __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(@"a", 0x100000, (uint64_t)sel_selectAll_, v4);
    CGPoint v19 = v5;
    BOOL v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
  }

  return v13;
}

id __42__PKTextAttachmentDrawingView_keyCommands__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  BOOL v7 = (void *)MEMORY[0x1E4FB18D0];
  id v8 = a4;
  id v9 = [v7 keyCommandWithInput:a1 modifierFlags:a2 action:a3];
  [v9 setDiscoverabilityTitle:v8];

  return v9;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (sel__share_ == a3)
  {
    id v8 = [(PKAttachmentView *)self drawing];
    [v8 bounds];
    if (!CGRectIsEmpty(v22))
    {
      id v10 = [(PKTextAttachmentDrawingView *)self window];
      CGRect v11 = [v10 screen];
      CGRect v12 = [v11 displayIdentity];
      LODWORD(v7) = [v12 expectsSecureRendering] ^ 1;

LABEL_20:
      goto LABEL_21;
    }
LABEL_10:
    LOBYTE(v7) = 0;
LABEL_21:

    goto LABEL_22;
  }
  if (sel_cut_ == a3)
  {
    id v9 = [(PKAttachmentView *)self drawing];
    [v9 bounds];
    if (CGRectIsEmpty(v23))
    {
      LOBYTE(v7) = 0;
    }
    else
    {
      id v13 = [MEMORY[0x1E4FB1978] sharedMenuController];
      LOBYTE(v7) = v13 == v6;
    }
    goto LABEL_16;
  }
  if (sel_copy_ == a3)
  {
    id v9 = [(PKAttachmentView *)self drawing];
    [v9 bounds];
    LODWORD(v7) = !CGRectIsEmpty(v24);
LABEL_16:

    goto LABEL_22;
  }
  if (sel_delete_ == a3)
  {
    id v8 = [(PKAttachmentView *)self drawing];
    [v8 bounds];
    if (!CGRectIsEmpty(v25) || ![(PKTextAttachmentDrawingView *)self isAtEndOfDocument])
    {
      id v10 = [(PKTextAttachmentDrawingView *)self _textView];
      CGRect v11 = [v10 textStorage];
      LOBYTE(v7) = [v11 length] != 0;
      goto LABEL_20;
    }
    goto LABEL_10;
  }
  if (sel_paste_ == a3)
  {
    BOOL v15 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v21[0] = @"com.apple.drawing";
    double v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    char v17 = [v15 containsPasteboardTypes:v16];

    double v18 = [(PKTextAttachmentDrawingView *)self tiledView];
    BOOL v7 = [v18 selectionController];
    char v19 = -[PKSelectionController _selectionInteractionCanPerformAction:withSender:inAttachment:](v7, (uint64_t)a3, v6, 0);

    LOBYTE(v7) = v17 | v19;
  }
  else
  {
    LOBYTE(v7) = 0;
    if (sel_insertSpace_ != a3 && sel_selectAll_ != a3)
    {
      v20.receiver = self;
      v20.super_class = (Class)PKTextAttachmentDrawingView;
      LOBYTE(v7) = [(PKTextAttachmentDrawingView *)&v20 canPerformAction:a3 withSender:v6];
    }
  }
LABEL_22:

  return (char)v7;
}

- (void)cutStrokeSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 cut:v4];
}

- (void)copyStrokeSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 copy:v4];
}

- (void)deleteStrokeSelection:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 delete:v4];
}

- (void)cut:(id)a3
{
  [(PKTextAttachmentDrawingView *)self copy:a3];
  id v5 = [(PKTextAttachmentDrawingView *)self _textView];
  id v4 = [(PKTextAttachmentDrawingView *)self textAttachment];
  [v5 _removeDrawingAttachment:v4 withView:self forDeletion:0];
}

- (void)copy:(id)a3
{
  id v4 = [(PKAttachmentView *)self drawing];
  id v5 = [v4 serializeTransiently];

  id v6 = [(PKAttachmentView *)self drawing];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;

  if (v10 <= 2048.0)
  {
    double v11 = 1.0;
  }
  else
  {
    double v11 = 2048.0 / v10;
    double v8 = ceil(v8 * (2048.0 / v10));
    double v10 = 2048.0;
  }
  CGRect v12 = [PKImageRenderer alloc];
  id v13 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v13 scale];
  BOOL v15 = -[PKImageRenderer initWithSize:scale:](v12, "initWithSize:scale:", v8, v10, v14);

  double v16 = [(PKAttachmentView *)self drawing];
  char v17 = [(PKAttachmentView *)self drawing];
  [v17 bounds];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __36__PKTextAttachmentDrawingView_copy___block_invoke;
  v27[3] = &unk_1E64CA190;
  id v28 = v5;
  id v26 = v5;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v15, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v16, v27, v19, v21, v23, v25, v11);
}

void __36__PKTextAttachmentDrawingView_copy___block_invoke(uint64_t a1, void *a2)
{
  int v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = UIImagePNGRepresentation(v3);
LABEL_5:
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __36__PKTextAttachmentDrawingView_copy___block_invoke_2;
    block[3] = &unk_1E64C9B48;
    double v8 = v4;
    id v9 = v5;
    id v10 = *(id *)(a1 + 32);
    id v6 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);

    goto LABEL_6;
  }
  if (*(void *)(a1 + 32))
  {
    id v5 = 0;
    goto LABEL_5;
  }
LABEL_6:
}

void __36__PKTextAttachmentDrawingView_copy___block_invoke_2(void *a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (a1[4])
  {
    uint64_t v3 = a1[5];
    id v4 = [(id)*MEMORY[0x1E4F44460] identifier];
    [v2 setObject:v3 forKeyedSubscript:v4];
  }
  uint64_t v5 = a1[6];
  if (v5) {
    [v2 setObject:v5 forKeyedSubscript:@"com.apple.drawing"];
  }
  if ([v2 count])
  {
    id v6 = [MEMORY[0x1E4FB1A78] generalPasteboard];
    v8[0] = v2;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 setItems:v7];
  }
}

- (void)paste:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 paste:v4];
}

- (void)delete:(id)a3
{
  id v5 = [(PKTextAttachmentDrawingView *)self _textView];
  id v4 = [(PKTextAttachmentDrawingView *)self textAttachment];
  [v5 _removeDrawingAttachment:v4 withView:self forDeletion:1];
}

- (void)insertSpace:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 insertSpace:v4];
}

- (void)selectAll:(id)a3
{
  id v4 = a3;
  id v5 = [(PKTextAttachmentDrawingView *)self tiledView];
  [v5 selectAll:v4];
}

- (void)_share:(id)a3
{
  v55[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v48 = 0;
  double v49 = &v48;
  uint64_t v50 = 0x3032000000;
  double v51 = __Block_byref_object_copy__25;
  double v52 = __Block_byref_object_dispose__25;
  id v53 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  id v6 = [PKImageRenderer alloc];
  double v7 = [(PKAttachmentView *)self drawing];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  CGRect v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v12 scale];
  double v14 = -[PKImageRenderer initWithSize:scale:](v6, "initWithSize:scale:", v9, v11, v13);

  BOOL v15 = [(PKAttachmentView *)self drawing];
  double v16 = [(PKAttachmentView *)self drawing];
  [v16 bounds];
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  double v24 = v23;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __38__PKTextAttachmentDrawingView__share___block_invoke;
  v45[3] = &unk_1E64C72E0;
  double v47 = &v48;
  double v25 = v5;
  double v46 = v25;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v14, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v15, v45, v18, v20, v22, v24, 1.0);

  dispatch_time_t v26 = dispatch_time(0, 4000000000);
  dispatch_semaphore_wait(v25, v26);
  if (v49[5])
  {
    id v27 = objc_alloc(MEMORY[0x1E4F42718]);
    v55[0] = v49[5];
    id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:1];
    double v29 = (void *)[v27 initWithActivityItems:v28 applicationActivities:0];

    [v29 setModalPresentationStyle:7];
    CGFloat v30 = [v29 popoverPresentationController];
    [v30 setSourceView:self];

    [(PKTextAttachmentDrawingView *)self bounds];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;
    double v39 = [v29 popoverPresentationController];
    objc_msgSend(v39, "setSourceRect:", v32, v34, v36, v38);

    double v40 = [v29 popoverPresentationController];
    [v40 setPermittedArrowDirections:3];

    double v41 = [v29 popoverPresentationController];
    [v41 setCanOverlapSourceViewRect:1];

    uint64_t v54 = *MEMORY[0x1E4F435B8];
    double v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
    [v29 setExcludedActivityTypes:v42];

    double v43 = [(PKTextAttachmentDrawingView *)self window];
    double v44 = [v43 rootViewController];
    [v44 presentViewController:v29 animated:1 completion:0];
  }
  _Block_object_dispose(&v48, 8);
}

void __38__PKTextAttachmentDrawingView__share___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)scaleDrawing:(double)a3
{
  [(UIScrollView *)self->_tileMaskView contentOffset];

  -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 0, a3, v5, v6);
}

- (void)scaleDrawing:(double)a3 withOffset:(CGPoint)a4 animated:(BOOL)a5
{
  if (a5)
  {
    CGFloat y = a4.y;
    CGFloat x = a4.x;
    [(PKTextAttachmentDrawingView *)self zoomScale];
    double v10 = dbl_1C482B560[v9 < a3];
    [(PKTextAttachmentDrawingView *)self zoomScale];
    double v12 = v11;
    [(UIScrollView *)self->_tileMaskView contentOffset];
    UIRoundToViewScale();
    uint64_t v14 = v13;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x2020000000;
    uint64_t v25 = 0;
    [(PKTextAttachmentDrawingView *)self zoomScale];
    uint64_t v25 = v15;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x2020000000;
    uint64_t v23 = 0;
    [(UIScrollView *)self->_tileMaskView contentOffset];
    uint64_t v23 = v16;
    [(PKTextAttachmentDrawingView *)self setZoomingProgramatically:1];
    double v17 = [(PKTextAttachmentDrawingView *)self _textView];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);
    int64_t v19 = [(PKTextAttachmentDrawingView *)self _characterIndex];
    v21[1] = 3221225472;
    v21[0] = MEMORY[0x1E4F143A8];
    void v21[2] = __64__PKTextAttachmentDrawingView_scaleDrawing_withOffset_animated___block_invoke;
    v21[3] = &unk_1E64CA1B8;
    *(double *)&v21[7] = (a3 - v12) * v10;
    *(double *)&v21[8] = a3;
    v21[4] = self;
    v21[5] = v24;
    v21[6] = v22;
    v21[9] = v14;
    *(CGFloat *)&v21[10] = x;
    *(CGFloat *)&v21[11] = y;
    objc_msgSend(v17, "_growView:textAttachment:atCharacterIndex:step:stop:", self, WeakRetained, v19, v21);

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    -[PKTextAttachmentDrawingView setZoomScale:](self, "setZoomScale:", a3, a4.x, a4.y);
    [(PKTextAttachmentDrawingView *)self zoomScale];
    [(UIScrollView *)self->_tileMaskView setScrollEnabled:v20 > 1.0];
    [(PKTextAttachmentDrawingView *)self updateFrameForTextContainer];
  }
}

uint64_t __64__PKTextAttachmentDrawingView_scaleDrawing_withOffset_animated___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  if (v2 == 0.0
    || (v4 = *(void *)(*(void *)(a1 + 40) + 8), double v5 = *(double *)(v4 + 24), v2 < 0.0) && v5 <= *(double *)(a1 + 64)
    || v2 > 0.0 && v5 >= *(double *)(a1 + 64))
  {
    int v3 = 1;
  }
  else
  {
    *(double *)(v4 + 24) = v2 + v5;
    double v6 = *(double *)(a1 + 56);
    uint64_t v7 = *(void *)(a1 + 40);
    if ((v6 >= 0.0 || (uint64_t v8 = *(void *)(v7 + 8), v9 = *(double *)(a1 + 64), *(double *)(v8 + 24) >= v9))
      && (v6 <= 0.0 || (uint64_t v8 = *(void *)(v7 + 8), v9 = *(double *)(a1 + 64), *(double *)(v8 + 24) <= v9)))
    {
      int v3 = 0;
    }
    else
    {
      *(double *)(v8 + 24) = v9;
      uint64_t v7 = *(void *)(a1 + 40);
      int v3 = 1;
    }
    [*(id *)(a1 + 32) scaleDrawing:*(double *)(*(void *)(v7 + 8) + 24)];
    [*(id *)(*(void *)(a1 + 32) + 704) setZoomScale:*(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  }
  double v10 = *(double *)(a1 + 72);
  if (v10 == 0.0
    || (uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8), v13 = *(double *)(v12 + 24), v10 < 0.0)
    && v13 <= *(double *)(a1 + 80)
    || v10 > 0.0 && v13 >= *(double *)(a1 + 80))
  {
    int v11 = 1;
  }
  else
  {
    *(double *)(v12 + 24) = v10 + v13;
    double v14 = *(double *)(a1 + 72);
    uint64_t v15 = *(void *)(a1 + 48);
    if (v14 < 0.0 && (uint64_t v16 = *(void *)(v15 + 8), v17 = *(double *)(a1 + 80), *(double *)(v16 + 24) <= v17)
      || v14 > 0.0 && (uint64_t v16 = *(void *)(v15 + 8), v17 = *(double *)(a1 + 80), *(double *)(v16 + 24) >= v17))
    {
      *(double *)(v16 + 24) = v17;
      uint64_t v15 = *(void *)(a1 + 48);
      int v11 = 1;
    }
    else
    {
      int v11 = 0;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 704), "setContentOffset:", *(double *)(*(void *)(v15 + 8) + 24), 0.0);
  }
  uint64_t v18 = v3 & v11;
  if (v18 == 1) {
    [*(id *)(a1 + 32) setZoomingProgramatically:0];
  }
  return v18;
}

- (BOOL)isAtBeginningOfDocument
{
  int v3 = [(PKTextAttachmentDrawingView *)self textAttachment];

  if (!v3) {
    return 1;
  }
  uint64_t v4 = [(PKTextAttachmentDrawingView *)self _textView];
  double v5 = [v4 textStorage];
  if ([v5 length])
  {
    double v6 = [v4 textStorage];
    uint64_t v7 = [v6 attribute:*MEMORY[0x1E4FB06B8] atIndex:0 effectiveRange:0];
  }
  else
  {
    uint64_t v7 = 0;
  }

  double v9 = [(PKTextAttachmentDrawingView *)self textAttachment];
  BOOL v8 = v7 == v9;

  return v8;
}

- (BOOL)isAtEndOfDocument
{
  int v3 = [(PKTextAttachmentDrawingView *)self textAttachment];

  if (!v3) {
    return 1;
  }
  uint64_t v4 = [(PKTextAttachmentDrawingView *)self _textView];
  double v5 = [v4 textStorage];
  uint64_t v6 = [v5 length];

  if (!v6) {
    goto LABEL_4;
  }
  uint64_t v7 = [v4 textStorage];
  BOOL v8 = [v7 string];
  double v9 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  double v10 = [v9 invertedSet];
  uint64_t v11 = [v8 rangeOfCharacterFromSet:v10 options:4];

  if (v11 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v13 = [v4 textStorage];
    double v14 = [v13 attribute:*MEMORY[0x1E4FB06B8] atIndex:v11 effectiveRange:0];

    uint64_t v15 = [(PKTextAttachmentDrawingView *)self textAttachment];
    BOOL v12 = v14 == v15;
  }
  else
  {
LABEL_4:
    BOOL v12 = 0;
  }

  return v12;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKTextAttachmentDrawingView;
  [(PKAttachmentView *)&v3 layoutSubviews];
  [(PKTextAttachmentResizeView *)self->_topResizeView layoutInsideSuperview];
  [(PKTextAttachmentResizeView *)self->_bottomResizeView layoutInsideSuperview];
  [(PKTextAttachmentDrawingView *)self layoutTileViews];
}

- (void)layoutTileViews
{
  [(PKTextAttachmentDrawingView *)self bounds];
  if (v5 != 0.0)
  {
    double v7 = v3;
    double v8 = v4;
    double v9 = v5;
    double v10 = v6;
    if ([(PKTextAttachmentDrawingView *)self isAtEndOfDocument])
    {
      uint64_t v11 = [(PKTextAttachmentDrawingView *)self _textView];
      [v11 bounds];
      double v10 = v10 + v12;
    }
    [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
    double v14 = v8 + v13;
    [(PKTextAttachmentResizeView *)self->_topResizeView resizeContentInset];
    double v16 = v15;
    [(PKTextAttachmentResizeView *)self->_bottomResizeView resizeContentInset];
    -[UIScrollView setFrame:](self->_tileMaskView, "setFrame:", v7, v14, v9, v10 - (v16 + v17));
    [(PKTextAttachmentDrawingView *)self drawingBounds];
    double v19 = -(v18 * v9);
    [(PKTextAttachmentDrawingView *)self drawingBounds];
    double v21 = floor(v19 / v20);
    double v22 = [(PKAttachmentView *)self tileContainerView];
    objc_msgSend(v22, "setFrame:", 0.0, v21, v9, v10);

    linesLayer = self->_linesLayer;
    -[PKLinedPaperLayer updateLinesFromAttachmentBounds:](linesLayer, "updateLinesFromAttachmentBounds:", v7, v8, v9, v10);
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return self->_tileScaleView;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  id v9 = a3;
  if (![(PKTextAttachmentDrawingView *)self zoomingProgramatically])
  {
    [(PKTextAttachmentDrawingView *)self zoomScale];
    -[PKTextAttachmentDrawingView setZoomStartScale:](self, "setZoomStartScale:");
    double v5 = [v9 pinchGestureRecognizer];
    [v5 locationInView:0];
    -[PKTextAttachmentDrawingView setZoomStartLocationInWindow:](self, "setZoomStartLocationInWindow:");

    tileScaleView = self->_tileScaleView;
    [(PKTextAttachmentDrawingView *)self zoomStartLocationInWindow];
    -[UIView convertPoint:fromView:](tileScaleView, "convertPoint:fromView:", 0);
    -[PKTextAttachmentDrawingView setZoomStartLocationInAttachment:](self, "setZoomStartLocationInAttachment:");
    double v7 = [(PKTextAttachmentDrawingView *)self _textView];
    [v7 contentOffset];
    -[PKTextAttachmentDrawingView setTextViewContentOffsetStartLocation:](self, "setTextViewContentOffsetStartLocation:");

    double v8 = [v9 pinchGestureRecognizer];
    [v8 scale];
    -[PKTextAttachmentDrawingView scaleDrawing:](self, "scaleDrawing:");
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  id v23 = a3;
  if (![(PKTextAttachmentDrawingView *)self zoomingProgramatically])
  {
    double v4 = [v23 pinchGestureRecognizer];
    [v4 scale];
    double v6 = v5;

    [(PKTextAttachmentDrawingView *)self scaleDrawing:v6];
    int64_t v7 = [(PKTextAttachmentDrawingView *)self _characterIndex];
    double v8 = [(PKTextAttachmentDrawingView *)self _textView];
    objc_msgSend(v8, "_pk_ensureLayoutForCharacterRange:", v7, 1);

    id v9 = [v23 pinchGestureRecognizer];
    [v9 locationInView:0];
    double v11 = v10;

    [(PKTextAttachmentDrawingView *)self zoomStartLocationInWindow];
    double v13 = v12 - v11;
    [(PKTextAttachmentDrawingView *)self zoomStartLocationInAttachment];
    double v15 = v14;
    [(PKTextAttachmentDrawingView *)self zoomStartScale];
    double v17 = v13 + v15 * (v6 - v16);
    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v19 = v18;
    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v21 = v17 + v20;
    double v22 = [(PKTextAttachmentDrawingView *)self _textView];
    objc_msgSend(v22, "setContentOffset:", v19, v21);
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  id v68 = a3;
  if (![(PKTextAttachmentDrawingView *)self zoomingProgramatically])
  {
    [(PKTextAttachmentDrawingView *)self scaleDrawing:a5];
    int64_t v7 = [v68 pinchGestureRecognizer];
    [v7 locationInView:0];

    [(PKTextAttachmentDrawingView *)self zoomStartLocationInWindow];
    [(PKTextAttachmentDrawingView *)self zoomStartLocationInAttachment];
    [(PKTextAttachmentDrawingView *)self zoomStartScale];
    double v8 = [(PKTextAttachmentDrawingView *)self window];
    UIRoundToViewScale();
    double v10 = v9;

    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v12 = v11;
    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v14 = v10 + v13;
    double v15 = [(PKTextAttachmentDrawingView *)self _textView];
    objc_msgSend(v15, "setContentOffset:", v12, v14);

    double v16 = 3.0;
    if (a5 <= 3.0) {
      double v16 = a5;
    }
    if (a5 >= 1.0) {
      double v17 = v16;
    }
    else {
      double v17 = 1.0;
    }
    [(PKTextAttachmentDrawingView *)self zoomStartLocationInWindow];
    [(PKTextAttachmentDrawingView *)self zoomStartLocationInAttachment];
    [(PKTextAttachmentDrawingView *)self zoomStartScale];
    double v18 = [(PKTextAttachmentDrawingView *)self window];
    UIRoundToViewScale();
    double v20 = v19;

    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v22 = v21;
    [(PKTextAttachmentDrawingView *)self textViewContentOffsetStartLocation];
    double v24 = v20 + v23;
    uint64_t v25 = [(PKTextAttachmentDrawingView *)self _textView];
    [v25 adjustedContentInset];
    double v27 = -v26;

    id v28 = [(PKTextAttachmentDrawingView *)self _textView];
    [v28 contentSize];
    double v30 = v29;
    double v31 = [(PKTextAttachmentDrawingView *)self _textView];
    [v31 adjustedContentInset];
    double v33 = v30 + v32;
    double v34 = [(PKTextAttachmentDrawingView *)self _textView];
    [v34 adjustedContentInset];
    double v36 = v33 + v35;
    double v37 = [(PKTextAttachmentDrawingView *)self _textView];
    [v37 frame];
    double v39 = v38;

    if (v24 < v27 || v36 <= v39) {
      double v24 = v27;
    }
    double v41 = [(PKTextAttachmentDrawingView *)self _textView];
    [v41 contentSize];
    double v43 = v42;
    double v44 = [(PKTextAttachmentDrawingView *)self _textView];
    [v44 frame];
    double v46 = v43 - v45;
    double v47 = [(PKTextAttachmentDrawingView *)self _textView];
    [v47 adjustedContentInset];
    double v49 = v46 + v48;

    uint64_t v50 = [(PKTextAttachmentDrawingView *)self _textView];
    [v50 contentSize];
    double v52 = v51;
    id v53 = [(PKTextAttachmentDrawingView *)self _textView];
    [v53 adjustedContentInset];
    double v55 = v52 + v54;
    double v56 = [(PKTextAttachmentDrawingView *)self _textView];
    [v56 adjustedContentInset];
    double v58 = v55 + v57;
    double v59 = [(PKTextAttachmentDrawingView *)self _textView];
    [v59 frame];
    double v61 = v60;

    if (v24 <= v49 || v58 <= v61) {
      double v63 = v24;
    }
    else {
      double v63 = v49;
    }
    [(UIScrollView *)self->_tileMaskView contentOffset];
    UIRoundToViewScale();
    double v65 = v64;
    [(UIScrollView *)self->_tileMaskView contentOffset];
    UIRoundToViewScale();
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, v17, v65, v66);
    double v67 = [(PKTextAttachmentDrawingView *)self _textView];
    objc_msgSend(v67, "setContentOffset:animated:", 1, v22, v63);
  }
}

- (void)handleDoubleTap:(id)a3
{
  id v20 = a3;
  double v4 = [(PKTextAttachmentDrawingView *)self window];
  uint64_t v5 = [v4 firstResponder];
  if (v5)
  {
    double v6 = (void *)v5;
    int64_t v7 = [(PKTextAttachmentDrawingView *)self window];
    double v8 = [v7 firstResponder];

    if (v8 == self) {
      goto LABEL_5;
    }
    double v4 = [(PKTextAttachmentDrawingView *)self window];
    double v9 = [v4 firstResponder];
    [v9 resignFirstResponder];
  }
LABEL_5:
  double v10 = [(PKTextAttachmentDrawingView *)self _textView];
  char v11 = [v10 isFingerDrawingEnabled];

  if ((v11 & 1) == 0)
  {
    [(PKTextAttachmentDrawingView *)self zoomScale];
    if (v12 <= 1.0)
    {
      [v20 locationInView:self];
      [(PKTextAttachmentDrawingView *)self bounds];
      UIRoundToViewScale();
      double v16 = v15;
      [(PKTextAttachmentDrawingView *)self bounds];
      UIRoundToViewScale();
      UIRoundToViewScale();
      double v18 = fmax(v17, 0.0);
      [(PKTextAttachmentDrawingView *)self bounds];
      if (v18 >= -(v16 - v19 * 2.0)) {
        double v14 = -(v16 - v19 * 2.0);
      }
      else {
        double v14 = v18;
      }
      double v13 = 2.0;
    }
    else
    {
      double v13 = 1.0;
      double v14 = 0.0;
    }
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, v13, v14, 0.0);
  }
}

- (CGRect)drawingContentBounds
{
  double v3 = [(PKAttachmentView *)self drawing];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  if (fabs(v5) == INFINITY
    || fabs(v7) == INFINITY
    || fabs(v9) == INFINITY
    || (double v12 = fabs(v11), v12 >= INFINITY) && v12 <= INFINITY)
  {
    if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PKTextAttachmentDrawingView semanticContentAttribute](self, "semanticContentAttribute")))
    {
      double v11 = 0.0;
      double v5 = 768.0;
      double v9 = 0.0;
      double v7 = 0.0;
    }
    else
    {
      double v5 = *MEMORY[0x1E4F1DB28];
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  if (v11 >= 58.0) {
    double v13 = v11;
  }
  else {
    double v13 = 58.0;
  }
  double v14 = v5;
  double v15 = v7;
  double v16 = v9;
  result.size.double height = v13;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)drawingBoundsForViewWidth:(double)a3
{
  [(PKTextAttachmentDrawingView *)self drawingContentBounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double v13 = [(PKTextAttachmentDrawingView *)self tiledView];
  int v14 = [v13 cropDrawingAttachmentsWhenViewIsSmaller];

  if (v14)
  {
    if (objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[PKTextAttachmentDrawingView semanticContentAttribute](self, "semanticContentAttribute")))
    {
      v22.origin.CGFloat x = v6;
      v22.origin.CGFloat y = v8;
      v22.size.CGFloat width = v10;
      v22.size.double height = v12;
      double MinX = CGRectGetMinX(v22);
      if (MinX >= 768.0 - a3 + -16.0) {
        double MinX = 768.0 - a3 + -16.0;
      }
      double v16 = fmax(MinX, 0.0);
      double v17 = 768.0 - v16;
    }
    else
    {
      double v16 = 0.0;
      v23.origin.CGFloat x = 0.0;
      v23.origin.CGFloat y = v8;
      v23.size.CGFloat width = v10;
      v23.size.double height = v12;
      double v18 = CGRectGetMaxX(v23) + 16.0;
      if (v18 < a3) {
        double v18 = a3;
      }
      if (v18 <= 768.0) {
        double v17 = v18;
      }
      else {
        double v17 = 768.0;
      }
    }
  }
  else
  {
    double v16 = 0.0;
    double v17 = 768.0;
  }
  double v19 = v16;
  double v20 = v8;
  double v21 = v12;
  result.size.double height = v21;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v20;
  result.origin.CGFloat x = v19;
  return result;
}

- (double)drawingScaleForViewWidth:(double)a3
{
  [(PKTextAttachmentDrawingView *)self drawingTransformForViewWidth:a3];
  return sqrt(v5 * v5 + v4 * v4);
}

- (CGAffineTransform)drawingTransformForViewWidth:(SEL)a3
{
  double v5 = self;
  double v7 = a4 - self[15].ty;
  if (v7 < 0.0) {
    double v7 = -v7;
  }
  if (v7 < 1.0)
  {
    p_tCGFloat y = (_OWORD *)&self[14].ty;
LABEL_16:
    long long v18 = p_ty[1];
    *(_OWORD *)&retstr->a = *p_ty;
    *(_OWORD *)&retstr->c = v18;
    long long v19 = p_ty[2];
    goto LABEL_21;
  }
  self = (CGAffineTransform *)[(CGAffineTransform *)self drawingBoundsForViewWidth:a4];
  double v11 = a4 / v10;
  double v12 = fabs(a4 / v10);
  BOOL v13 = (unint64_t)(*(void *)&v12 - 1) < 0xFFFFFFFFFFFFFLL;
  BOOL v14 = (unint64_t)(*(void *)&v12 - 0x10000000000000) >> 53 < 0x3FF;
  if (COERCE__INT64(a4 / v10) >= 0)
  {
    BOOL v14 = 0;
    BOOL v13 = 0;
  }
  double v15 = fabs(a4 / v10);
  if (v15 == 0.0) {
    BOOL v13 = 1;
  }
  BOOL v16 = *(void *)&v15 <= 0x7FF0000000000000;
  int v17 = v15 == INFINITY || v13;
  if (!v16) {
    int v17 = 1;
  }
  if ((v17 | v14) == 1)
  {
    p_tCGFloat y = (_OWORD *)MEMORY[0x1E4F1DAB8];
    goto LABEL_16;
  }
  double v20 = v9;
  self = (CGAffineTransform *)objc_msgSend(MEMORY[0x1E4FB1EB0], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[CGAffineTransform semanticContentAttribute](v5, "semanticContentAttribute"));
  double v21 = &v5[14].ty;
  if (self)
  {
    double *v21 = v11;
    v5[15].a = 0.0;
    v5[15].b = 0.0;
    v5[15].c = v11;
    v5[15].d = -(v11 * v20);
    v5[15].tCGFloat x = 0.0;
  }
  else
  {
    self = CGAffineTransformMakeScale(&v24, v11, v11);
    long long v22 = *(_OWORD *)&v24.c;
    *(_OWORD *)double v21 = *(_OWORD *)&v24.a;
    *(_OWORD *)&v5[15].b = v22;
    *(_OWORD *)&v5[15].d = *(_OWORD *)&v24.tx;
  }
  v5[15].tCGFloat y = a4;
  long long v23 = *(_OWORD *)&v5[15].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)v21;
  *(_OWORD *)&retstr->c = v23;
  long long v19 = *(_OWORD *)&v5[15].d;
LABEL_21:
  *(_OWORD *)&retstr->tCGFloat x = v19;
  return self;
}

- (double)desiredAttachmentViewWidthForContainerView:(id)a3
{
  if (!a3) {
    return 768.0;
  }
  [a3 bounds];
  return v3;
}

- (CGAffineTransform)drawingTransform
{
  id v5 = [(PKTextAttachmentDrawingView *)self _textView];
  [(PKTextAttachmentDrawingView *)self desiredAttachmentViewWidthForContainerView:v5];
  -[PKTextAttachmentDrawingView drawingTransformForViewWidth:](self, "drawingTransformForViewWidth:");

  return result;
}

- (CGRect)resizeViewDrawingBounds:(id)a3
{
  double v4 = [(PKAttachmentView *)self drawing];
  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  v17.origin.CGFloat x = v6;
  v17.origin.CGFloat y = v8;
  v17.size.CGFloat width = v10;
  v17.size.double height = v12;
  if (CGRectIsNull(v17))
  {
    double v13 = *MEMORY[0x1E4F1DB20];
    double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    [(PKTextAttachmentDrawingView *)self drawingCanvasBounds];
  }
  result.size.double height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)resizeView:(id)a3 setDrawingHeight:(double)a4 originalHeight:(double)a5 growFromTop:(BOOL)a6
{
}

- (void)resizeViewRemoveAttachment:(id)a3
{
  id v5 = [(PKTextAttachmentDrawingView *)self _textView];
  double v4 = [(PKTextAttachmentDrawingView *)self textAttachment];
  [v5 _removeDrawingAttachment:v4 withView:self forDeletion:0];
}

- (void)resizeViewLayoutAttachment:(id)a3
{
}

- (void)resizeView:(id)a3 finishedWithOriginalDrawingBounds:(CGRect)a4 originalViewBounds:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v9 = a4.size.height;
  double v10 = a4.size.width;
  double v11 = a4.origin.y;
  double v12 = a4.origin.x;
  id v18 = [(PKTextAttachmentDrawingView *)self undoManager];
  double v14 = [(PKTextAttachmentDrawingView *)self _textView];
  double v15 = [v18 prepareWithInvocationTarget:v14];
  double v16 = [(PKAttachmentView *)self drawing];
  CGRect v17 = [v16 uuid];
  objc_msgSend(v15, "_undoDrawingBounds:viewBounds:ofAttachmentUUID:", v17, v12, v11, v10, v9, x, y, width, height);
}

- (void)resizeViewDidUpdate:(id)a3
{
  [(PKTextAttachmentDrawingView *)self _adjustResizeIndicatorVisibility];

  [(PKAttachmentView *)self drawingDidChange];
}

- (id)dataForTextAttachment:(id)a3
{
  double v3 = [(PKAttachmentView *)self drawing];
  double v4 = [v3 serialize];

  return v4;
}

- (void)drawingDataDidChange:(id)a3
{
  id v4 = a3;
  id v5 = os_log_create("com.apple.pencilkit", "Sketching");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1C44F8000, v5, OS_LOG_TYPE_DEBUG, "drawingDataDidChange called", buf, 2u);
  }

  CGFloat v6 = [(PKTextAttachmentDrawingView *)self _textView];
  double v7 = [v6 _pkTiledViewIfEnabled];
  objc_msgSend(v7, "setAggd_didMergeWithCollaborator:", 1);

  CGFloat v8 = [(PKAttachmentView *)self drawing];

  if (v4 && v8)
  {
    double v9 = [(PKAttachmentView *)self drawing];
    double v10 = (void *)[v9 copy];

    unint64_t v11 = [v10 mergeWithDrawing:v4];
    double v12 = +[PKStatisticsManager sharedStatisticsManager]();
    -[PKStatisticsManager recordCollaboration:]((uint64_t)v12, v11);

    if (v11 == 2)
    {
      double v16 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)CGRect v17 = 0;
        _os_log_debug_impl(&dword_1C44F8000, v16, OS_LOG_TYPE_DEBUG, "drawing updated when merging", v17, 2u);
      }

      [(PKAttachmentView *)self setDrawing:v10];
      [(PKTextAttachmentDrawingView *)self _updateViewHeightIfNecessary];
      [(PKTextAttachmentDrawingView *)self _triggerRedraw];
      goto LABEL_15;
    }
    if (v11 == 1)
    {
      double v13 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v18 = 0;
        double v14 = "No change when merging drawings";
        double v15 = v18;
        goto LABEL_18;
      }
    }
    else
    {
      if (v11)
      {
LABEL_15:

        goto LABEL_16;
      }
      double v13 = os_log_create("com.apple.pencilkit", "Sketching");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        __int16 v19 = 0;
        double v14 = "Fail when merging drawings";
        double v15 = (uint8_t *)&v19;
LABEL_18:
        _os_log_debug_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_DEBUG, v14, v15, 2u);
      }
    }

    goto LABEL_15;
  }
LABEL_16:
}

- (void)resetZoom
{
  [(PKTextAttachmentDrawingView *)self zoomScale];
  if (v3 != 1.0)
  {
    -[PKTextAttachmentDrawingView scaleDrawing:withOffset:animated:](self, "scaleDrawing:withOffset:animated:", 1, 1.0, 0.0, 0.0);
  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return 0;
}

- (id)linedPaperLayerLinedPaper:(id)a3
{
  double v3 = [(PKTextAttachmentDrawingView *)self _textView];
  id v4 = [v3 linedPaper];

  return v4;
}

- (double)drawingAspectRatio
{
  return self->_drawingAspectRatio;
}

- (UIView)tileScaleView
{
  return self->_tileScaleView;
}

- (NSTextAttachment)textAttachment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textAttachment);

  return (NSTextAttachment *)WeakRetained;
}

- (void)setTextAttachment:(id)a3
{
}

- (double)zoomScale
{
  return self->_zoomScale;
}

- (void)setZoomScale:(double)a3
{
  self->_zoomScale = a3;
}

- (PKTextAttachmentResizeView)topResizeView
{
  return self->_topResizeView;
}

- (void)setTopResizeView:(id)a3
{
}

- (PKTextAttachmentResizeView)bottomResizeView
{
  return self->_bottomResizeView;
}

- (void)setBottomResizeView:(id)a3
{
}

- (PKLinedPaperLayer)linesLayer
{
  return self->_linesLayer;
}

- (void)setLinesLayer:(id)a3
{
}

- (PKTextAttachmentDrawingViewTouchRecognizer)resizeHighlightGestureRecognizer
{
  return self->_resizeHighlightGestureRecognizer;
}

- (void)setResizeHighlightGestureRecognizer:(id)a3
{
}

- (UIPanGestureRecognizer)resizeDragGestureRecognizer
{
  return self->_resizeDragGestureRecognizer;
}

- (void)setResizeDragGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)eatKeyboardGestureRecognizer
{
  return self->_eatKeyboardGestureRecognizer;
}

- (void)setEatKeyboardGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)tapBelowDrawingGestureRecognizer
{
  return self->_tapBelowDrawingGestureRecognizer;
}

- (void)setTapBelowDrawingGestureRecognizer:(id)a3
{
}

- (UITapGestureRecognizer)showMenuGestureRecognizer
{
  return self->_showMenuGestureRecognizer;
}

- (void)setShowMenuGestureRecognizer:(id)a3
{
}

- (UILongPressGestureRecognizer)hideMenuGestureRecognizer
{
  return self->_hideMenuGestureRecognizer;
}

- (void)setHideMenuGestureRecognizer:(id)a3
{
}

- (BOOL)resizeUpper
{
  return self->_resizeUpper;
}

- (void)setResizeUpper:(BOOL)a3
{
  self->_BOOL resizeUpper = a3;
}

- (BOOL)inserted
{
  return self->_inserted;
}

- (void)setInserted:(BOOL)a3
{
  self->_inserted = a3;
}

- (BOOL)zoomingProgramatically
{
  return self->_zoomingProgramatically;
}

- (void)setZoomingProgramatically:(BOOL)a3
{
  self->_zoomingProgramaticalldouble y = a3;
}

- (CGPoint)zoomStartLocationInWindow
{
  double x = self->_zoomStartLocationInWindow.x;
  double y = self->_zoomStartLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomStartLocationInWindow:(CGPoint)a3
{
  self->_zoomStartLocationInWindow = a3;
}

- (CGPoint)zoomStartLocationInAttachment
{
  double x = self->_zoomStartLocationInAttachment.x;
  double y = self->_zoomStartLocationInAttachment.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setZoomStartLocationInAttachment:(CGPoint)a3
{
  self->_zoomStartLocationInAttachment = a3;
}

- (CGPoint)textViewContentOffsetStartLocation
{
  double x = self->_textViewContentOffsetStartLocation.x;
  double y = self->_textViewContentOffsetStartLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setTextViewContentOffsetStartLocation:(CGPoint)a3
{
  self->_textViewContentOffsetStartLocation = a3;
}

- (double)zoomStartScale
{
  return self->_zoomStartScale;
}

- (void)setZoomStartScale:(double)a3
{
  self->_zoomStartScale = a3;
}

- (BOOL)isLiveResizing
{
  return self->_isLiveResizing;
}

- (void)setIsLiveResizing:(BOOL)a3
{
  self->_isLiveResizing = a3;
}

- (CGRect)liveResizeAttachmentBounds
{
  double x = self->_liveResizeAttachmentBounds.origin.x;
  double y = self->_liveResizeAttachmentBounds.origin.y;
  double width = self->_liveResizeAttachmentBounds.size.width;
  double height = self->_liveResizeAttachmentBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setLiveResizeAttachmentBounds:(CGRect)a3
{
  self->_liveResizeAttachmentBounds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hideMenuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_showMenuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_tapBelowDrawingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_eatKeyboardGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_resizeDragGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_resizeHighlightGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_linesLayer, 0);
  objc_storeStrong((id *)&self->_bottomResizeView, 0);
  objc_storeStrong((id *)&self->_topResizeView, 0);
  objc_destroyWeak((id *)&self->_textAttachment);
  objc_storeStrong((id *)&self->_tileScaleView, 0);

  objc_storeStrong((id *)&self->_tileMaskView, 0);
}

@end