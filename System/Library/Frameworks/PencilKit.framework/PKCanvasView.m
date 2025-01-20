@interface PKCanvasView
- (BOOL)_canvasViewSnapshottingDisabled:(id)a3;
- (BOOL)_combiningStrokesEnabled;
- (BOOL)_disableTileRendering;
- (BOOL)_disableUndoManager;
- (BOOL)_drawBitmapEraserMask;
- (BOOL)_hasObserver:(id)a3;
- (BOOL)_hasSelection;
- (BOOL)allowsFingerDrawing;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4;
- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4;
- (BOOL)disableWideGamut;
- (BOOL)isDrawingEnabled;
- (BOOL)isRulerActive;
- (BOOL)predictionDisabled;
- (BOOL)rulerEnabled;
- (BOOL)rulerHostWantsSharedRuler;
- (BOOL)supportsCopyAsText;
- (CGAffineTransform)drawingTransform;
- (CGAffineTransform)strokeTransform;
- (CGPoint)rulerSnapLineOriginAndNormal:(CGPoint *)a3 topSide:(BOOL)a4;
- (CGSize)_fixedPixelSize;
- (CGSize)_metalViewDrawableSize;
- (CGSize)_rendererControllerPixelSize;
- (NSHashTable)_observers;
- (PKCanvasView)initWithFrame:(CGRect)a3;
- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4;
- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4 fixedPixelSizeScrollView:(id)a5;
- (PKCanvasView)initWithFrame:(CGRect)a3 fixedPixelSize:(CGSize)a4 drawingScale:(double)a5 layerFixedPixelSize:(BOOL)a6;
- (PKCanvasView)initWithFrame:(CGRect)a3 sixChannelBlend:(BOOL)a4 snapshotView:(id)a5;
- (PKCanvasViewDrawingPolicy)drawingPolicy;
- (PKContentVersion)maximumSupportedContentVersion;
- (PKDrawing)drawing;
- (PKInk)ink;
- (PKRulerHostingDelegate)rulerHostingDelegate;
- (PKTiledView)_tiledView;
- (PKTool)tool;
- (SEL)drawingUndoSelector;
- (UICoordinateSpace)_contentCoordinateSpace;
- (UIGestureRecognizer)drawingGestureRecognizer;
- (UIHoverGestureRecognizer)_hoverGestureRecognizer;
- (UIView)contentView;
- (UIView)rulerView;
- (UIView)selectionView;
- (double)_latestLatency;
- (id)_adornmentViewsToHitTest;
- (id)_allowedDrawingTouchTypes;
- (id)_currentStroke;
- (id)_getDelegateZoomView;
- (id)_selectionController;
- (id)_selectionInteraction;
- (id)drawingUndoTarget;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)rulerHostingView;
- (int64_t)_maxFileFormatVersion;
- (void)_addObserver:(id)a3;
- (void)_canvasViewWillBeginDrawing:(id)a3;
- (void)_canvasViewWillCreateSnapshot:(id)a3;
- (void)_drawingDidChange;
- (void)_flushCaches;
- (void)_fullyRendered;
- (void)_keepPencilShadowVisible;
- (void)_removeObserver:(id)a3;
- (void)_setChildrenBackgroundColor:(id)a3;
- (void)_setCombiningStrokesEnabled:(BOOL)a3;
- (void)_setContentCoordinateSpace:(id)a3;
- (void)_setContentViewOpaqueBackgroundColorIfApplicable;
- (void)_setDisableTileRendering:(BOOL)a3;
- (void)_setDrawBitmapEraserMask:(BOOL)a3;
- (void)_setDrawing:(id)a3 alreadyRenderedDrawing:(id)a4 imageForAlreadyRenderedDrawing:(id)a5 fullyRenderedCompletionBlock:(id)a6;
- (void)_setDrawing:(id)a3 fullyRenderedCompletionBlock:(id)a4;
- (void)_setFixedPixelSize:(CGSize)a3 drawingScale:(double)a4;
- (void)_setSelectedStrokesColor:(id)a3;
- (void)_toolPicker:(id)a3 didChangeColor:(id)a4;
- (void)_updateCanvas;
- (void)_updateChildrenOpaque;
- (void)_updatePencilShadowViewWithInputPoint:(id *)a3;
- (void)awakeFromNib;
- (void)canvasView:(id)a3 beganStroke:(id)a4;
- (void)canvasView:(id)a3 cancelledStroke:(id)a4;
- (void)canvasView:(id)a3 didChangeHiddenState:(BOOL)a4;
- (void)canvasView:(id)a3 didRefineStrokes:(id)a4 withNewStrokes:(id)a5;
- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5;
- (void)canvasViewDidBeginDrawing:(id)a3;
- (void)canvasViewDidBeginLasso:(id)a3;
- (void)canvasViewDidEndDrawing:(id)a3;
- (void)canvasViewDidEndLasso:(id)a3;
- (void)commitSelectionIfNecessaryWithCompletion:(id)a3;
- (void)imageWithCompletionBlock:(id)a3;
- (void)layoutSubviews;
- (void)paste:(id)a3;
- (void)performUndo:(id)a3;
- (void)setAllowsFingerDrawing:(BOOL)allowsFingerDrawing;
- (void)setBackgroundColor:(id)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setDelegate:(id)delegate;
- (void)setDisableWideGamut:(BOOL)a3;
- (void)setDrawing:(PKDrawing *)drawing;
- (void)setDrawingEnabled:(BOOL)a3;
- (void)setDrawingPolicy:(PKCanvasViewDrawingPolicy)drawingPolicy;
- (void)setDrawingTransform:(CGAffineTransform *)a3;
- (void)setDrawingUndoSelector:(SEL)a3;
- (void)setDrawingUndoTarget:(id)a3;
- (void)setInk:(id)a3;
- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion;
- (void)setMaximumZoomScale:(double)a3;
- (void)setOpaque:(BOOL)a3;
- (void)setPredictionDisabled:(BOOL)a3;
- (void)setRulerActive:(BOOL)rulerActive;
- (void)setRulerEnabled:(BOOL)a3;
- (void)setRulerHostingDelegate:(id)a3;
- (void)setSupportsCopyAsText:(BOOL)a3;
- (void)setTool:(PKTool *)tool;
- (void)set_disableUndoManager:(BOOL)a3;
- (void)set_maxFileFormatVersion:(int64_t)a3;
- (void)set_observers:(id)a3;
- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4;
- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4 sixChannelBlend:(BOOL)a5 drawBitmapEraserMask:(BOOL)a6;
- (void)toolPickerIsRulerActiveDidChange:(id)a3;
- (void)toolPickerSelectedToolItemDidChange:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateFixedPixelSizeViewForBounds:(CGRect)a3;
- (void)updateSubviewsForBounds:(CGRect)a3;
@end

@implementation PKCanvasView

- (PKCanvasView)initWithFrame:(CGRect)a3
{
  return -[PKCanvasView initWithFrame:drawingWidth:](self, "initWithFrame:drawingWidth:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, 0.0);
}

- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4
{
  return -[PKCanvasView initWithFrame:drawingWidth:fixedPixelSizeScrollView:](self, "initWithFrame:drawingWidth:fixedPixelSizeScrollView:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4);
}

- (PKCanvasView)initWithFrame:(CGRect)a3 drawingWidth:(double)a4 fixedPixelSizeScrollView:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PKCanvasView;
  id v10 = a5;
  v11 = -[PKCanvasView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = +[PKContentVersionUtility sharedUtility]();
  v11->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v12);

  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:](v11, "setupDrawingWidth:fixedPixelSizeScrollView:", v10, a4, v14.receiver, v14.super_class);
  return v11;
}

- (PKCanvasView)initWithFrame:(CGRect)a3 sixChannelBlend:(BOOL)a4 snapshotView:(id)a5
{
  BOOL v5 = a4;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14.receiver = self;
  v14.super_class = (Class)PKCanvasView;
  id v10 = a5;
  v11 = -[PKCanvasView initWithFrame:](&v14, sel_initWithFrame_, x, y, width, height);
  v12 = +[PKContentVersionUtility sharedUtility]();
  v11->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v12);

  -[PKCanvasView setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:](v11, "setupDrawingWidth:fixedPixelSizeScrollView:sixChannelBlend:drawBitmapEraserMask:", 0, v5, 0, 0.0, v14.receiver, v14.super_class);
  [(PKTiledView *)v11->_tiledView setContentSnapshottingView:v10];

  return v11;
}

- (void)awakeFromNib
{
  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  [(PKCanvasView *)&v5 awakeFromNib];
  if (!self->__observers)
  {
    v3 = +[PKContentVersionUtility sharedUtility]();
    self->__observers = (NSHashTable *)-[PKContentVersionUtility contentVersionForCurrentSDK]((uint64_t)v3);
  }
  [(PKCanvasView *)self setupDrawingWidth:0 fixedPixelSizeScrollView:0.0];
  v4 = [(PKCanvasView *)self backgroundColor];
  [(PKCanvasView *)self _setChildrenBackgroundColor:v4];
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(PKCanvasView *)self _tiledView];
  char v9 = [v8 disableTileRendering];

  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)PKCanvasView;
    id v10 = -[PKCanvasView hitTest:withEvent:](&v12, sel_hitTest_withEvent_, v7, x, y);
  }

  return v10;
}

- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4
{
}

- (void)setupDrawingWidth:(double)a3 fixedPixelSizeScrollView:(id)a4 sixChannelBlend:(BOOL)a5 drawBitmapEraserMask:(BOOL)a6
{
  BOOL v6 = a5;
  id v66 = a4;
  id v10 = (objc_class *)objc_opt_class();
  if (v66)
  {
    [v66 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    objc_storeStrong((id *)&self->_fixedPixelSizeScrollView, a4);
    id v19 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
    v20 = (UIView *)objc_msgSend(v19, "initWithFrame:");
    fixedPixelSizeScrollViewWrapper = self->_fixedPixelSizeScrollViewWrapper;
    self->_fixedPixelSizeScrollViewWrapper = v20;

    [(UIView *)self->_fixedPixelSizeScrollViewWrapper addSubview:self->_fixedPixelSizeScrollView];
    v22 = [(UIView *)self->_fixedPixelSizeScrollViewWrapper layer];
    objc_msgSend(v22, "setAnchorPoint:", 0.0, 0.0);

    [(PKCanvasView *)self bounds];
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:");
  }
  else
  {
    [(PKCanvasView *)self bounds];
    double v12 = v23;
    double v14 = v24;
    double v16 = v25;
    double v18 = v26;
  }
  v27 = [(PKCanvasView *)self panGestureRecognizer];
  [v27 setAllowedTouchTypes:&unk_1F200F018];

  v28 = (PKRulerHostingDelegate *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v12, v14, v16, v18);
  rulerHostingDelegate = self->_rulerHostingDelegate;
  self->_rulerHostingDelegate = v28;

  v30 = [PKCanvasAttachmentView alloc];
  id v31 = objc_alloc_init(v10);
  v32 = -[PKAttachmentView initWithFrame:drawing:](v30, "initWithFrame:drawing:", v31, v12, v14, v16, v18);
  pageView = self->_pageView;
  self->_pageView = v32;

  [(PKCanvasAttachmentView *)self->_pageView setCanvasView:self];
  [(PKAttachmentView *)self->_pageView setSixChannelBlending:v6];
  [(PKCanvasAttachmentView *)self->_pageView setUserInteractionEnabled:0];
  [(PKCanvasAttachmentView *)self->_pageView setDrawingWidth:a3];
  [(PKRulerHostingDelegate *)self->_rulerHostingDelegate addSubview:self->_pageView];
  v34 = [PKTiledView alloc];
  if (self->_fixedPixelSizeScrollView) {
    fixedPixelSizeScrollView = (PKCanvasView *)self->_fixedPixelSizeScrollView;
  }
  else {
    fixedPixelSizeScrollView = self;
  }
  v36 = [(PKTiledView *)v34 initInScrollView:fixedPixelSizeScrollView sixChannelBlending:v6 defaultDrawingClass:objc_opt_class()];
  tiledView = self->_tiledView;
  self->_tiledView = v36;

  [(PKTiledView *)self->_tiledView setAttachmentContainerView:self->_rulerHostingDelegate];
  [(PKTiledView *)self->_tiledView setDelegate:self];
  [(PKTiledView *)self->_tiledView setRulerHostingDelegate:self];
  [(PKTiledView *)self->_tiledView setMaximumSupportedContentVersion:self->__observers];
  if (+[PKShapeDrawingController hasSnapToShapeEntitlement]()) {
    goto LABEL_18;
  }
  v38 = [MEMORY[0x1E4F28B50] mainBundle];
  v39 = [v38 bundleIdentifier];
  char v40 = [v39 isEqualToString:@"com.apple.mobilenotes"];

  if (v40) {
    goto LABEL_18;
  }
  v41 = [MEMORY[0x1E4F28B50] mainBundle];
  v42 = [v41 bundleIdentifier];
  char v43 = [v42 hasPrefix:@"com.apple.sidecar.extension."];

  if (v43) {
    goto LABEL_18;
  }
  v44 = [MEMORY[0x1E4F28B50] mainBundle];
  v45 = [v44 bundleIdentifier];
  char v46 = [v45 isEqualToString:@"com.apple.ScreenshotServicesService"];

  if (v46) {
    goto LABEL_18;
  }
  v47 = [MEMORY[0x1E4F28B50] mainBundle];
  v48 = [v47 bundleIdentifier];

  if (os_variant_has_internal_diagnostics())
  {
    if (([v48 isEqualToString:@"com.apple.TestApp"] & 1) != 0
      || ([v48 isEqualToString:@"com.apple.ZoomTestApp"] & 1) != 0
      || ([v48 isEqualToString:@"com.apple.PaperKitTestApp"] & 1) != 0)
    {
      goto LABEL_16;
    }
    char v63 = [v48 isEqualToString:@"com.apple.pencilkit.MultiDrawingCanvasTestApp"];

    if (v63) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  v49 = [MEMORY[0x1E4F28B50] mainBundle];
  v50 = [v49 bundleIdentifier];
  char v51 = [v50 isEqualToString:@"com.apple.PaperKit.MarkupPhotoEditingExtension"];

  if (v51)
  {
LABEL_18:
    [(PKTiledView *)self->_tiledView setAllowSnapToShape:1];
    goto LABEL_19;
  }
  v48 = [MEMORY[0x1E4F28B50] mainBundle];
  v52 = [v48 bundleIdentifier];
  if ([v52 isEqualToString:@"com.apple.quicklook.extension.previewUI"])
  {

LABEL_16:
    goto LABEL_18;
  }
  v64 = [MEMORY[0x1E4F28B50] mainBundle];
  v53 = [v64 bundleIdentifier];
  char v65 = [v53 isEqualToString:@"com.apple.quicklook.UIExtension"];

  if (v65) {
    goto LABEL_18;
  }
  v62 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  -[PKTiledView setAllowSnapToShape:](self->_tiledView, "setAllowSnapToShape:", [v62 BOOLForKey:@"internalSettings.shapeRecognition.enableEverywhere"]);

LABEL_19:
  v54 = [MEMORY[0x1E4F28B50] mainBundle];
  v55 = [v54 bundleIdentifier];
  char v56 = [v55 isEqualToString:@"com.apple.Pages"];

  if ((v56 & 1) == 0)
  {
    v57 = [(PKTiledView *)self->_tiledView selectionInteraction];
    [v57 setDelegate:self];
  }
  if (v6)
  {
    v58 = [(PKTiledView *)self->_tiledView canvasView];
    [v58 setOpaque:1];

    [(PKTiledView *)self->_tiledView setCanvasViewZOrderPolicy:1];
  }
  [(PKTiledView *)self->_tiledView setInsertSpaceEnabled:self->_fixedPixelSizeScrollView == 0];
  v59 = self->_fixedPixelSizeScrollView;
  v60 = self->_rulerHostingDelegate;
  if (v59)
  {
    [(UIScrollView *)v59 insertSubview:v60 atIndex:0];
    v60 = self->_fixedPixelSizeScrollViewWrapper;
  }
  [(PKCanvasView *)self insertSubview:v60 atIndex:0];
  v61 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v61 addObserver:self selector:sel__drawingDidChange name:@"drawingDidChange" object:self->_pageView];

  [(PKCanvasView *)self _setContentViewOpaqueBackgroundColorIfApplicable];
  [(PKTiledView *)self->_tiledView _layoutSubviews];
}

- (void)setMaximumSupportedContentVersion:(PKContentVersion)maximumSupportedContentVersion
{
  self->__observers = (NSHashTable *)maximumSupportedContentVersion;
  -[PKTiledView setMaximumSupportedContentVersion:](self->_tiledView, "setMaximumSupportedContentVersion:");
}

- (void)setOpaque:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKCanvasView;
  [(PKCanvasView *)&v4 setOpaque:a3];
  [(PKCanvasView *)self _updateChildrenOpaque];
}

- (void)_updateChildrenOpaque
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v3 = [(PKCanvasView *)self backgroundColor];

  if (v3)
  {
    *((void *)&v8 + 1) = unk_1C482B800;
    id v4 = [(PKCanvasView *)self backgroundColor];
    DKUColorGetRGBAComponents((CGColor *)[v4 CGColor], &v7);

    uint64_t v5 = *((double *)&v8 + 1) >= 1.0;
  }
  else
  {
    uint64_t v5 = [(PKCanvasView *)self isOpaque];
  }
  BOOL v6 = [(PKTiledView *)self->_tiledView canvasView];
  [v6 setOpaque:v5];

  [(PKRulerHostingDelegate *)self->_rulerHostingDelegate setOpaque:v5];
  [(PKCanvasAttachmentView *)self->_pageView setOpaque:v5];
  if (v5) {
    [(PKCanvasView *)self _setContentViewOpaqueBackgroundColorIfApplicable];
  }
  else {
    [(PKRulerHostingDelegate *)self->_rulerHostingDelegate setBackgroundColor:0];
  }
}

- (void)_setContentViewOpaqueBackgroundColorIfApplicable
{
  if ([(PKCanvasView *)self isOpaque])
  {
    id v9 = [(PKCanvasView *)self backgroundColor];
    if (!v9)
    {
      v3 = [(PKCanvasView *)self traitCollection];
      if ([v3 userInterfaceStyle] == 2) {
        [MEMORY[0x1E4FB1618] blackColor];
      }
      else {
      id v9 = [MEMORY[0x1E4FB1618] whiteColor];
      }
    }
    id v4 = [(PKRulerHostingDelegate *)self->_rulerHostingDelegate backgroundColor];
    char v5 = [v4 isEqual:v9];

    if ((v5 & 1) == 0) {
      [(PKRulerHostingDelegate *)self->_rulerHostingDelegate setBackgroundColor:v9];
    }
    BOOL v6 = [(PKCanvasView *)self traitCollection];
    long long v7 = [v9 resolvedColorWithTraitCollection:v6];

    long long v8 = [(PKTiledView *)self->_tiledView canvasView];
    [v8 setCanvasBackgroundColor:v7];
  }
}

- (void)setBackgroundColor:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  id v4 = a3;
  [(PKCanvasView *)&v5 setBackgroundColor:v4];
  -[PKCanvasView _setChildrenBackgroundColor:](self, "_setChildrenBackgroundColor:", v4, v5.receiver, v5.super_class);
}

- (void)_setChildrenBackgroundColor:(id)a3
{
  tiledView = self->_tiledView;
  id v5 = a3;
  BOOL v6 = [(PKTiledView *)tiledView canvasView];
  [v6 setCanvasBackgroundColor:v5];

  [(PKRulerHostingDelegate *)self->_rulerHostingDelegate setBackgroundColor:v5];

  [(PKCanvasView *)self _updateChildrenOpaque];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKCanvasView;
  id v4 = a3;
  [(PKCanvasView *)&v8 traitCollectionDidChange:v4];
  uint64_t v5 = objc_msgSend(v4, "userInterfaceStyle", v8.receiver, v8.super_class);

  BOOL v6 = [(PKCanvasView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(PKCanvasView *)self _setContentViewOpaqueBackgroundColorIfApplicable];
  }
}

- (void)setDelegate:(id)delegate
{
  v24.receiver = self;
  v24.super_class = (Class)PKCanvasView;
  id v4 = delegate;
  [(PKCanvasView *)&v24 setDelegate:v4];
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFE | objc_opt_respondsToSelector() & 1);
  if (objc_opt_respondsToSelector()) {
    int v5 = 2;
  }
  else {
    int v5 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFD | v5);
  if (objc_opt_respondsToSelector()) {
    int v6 = 4;
  }
  else {
    int v6 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFFB | v6);
  if (objc_opt_respondsToSelector()) {
    int v7 = 8;
  }
  else {
    int v7 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFF7 | v7);
  if (objc_opt_respondsToSelector()) {
    int v8 = 16;
  }
  else {
    int v8 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFEF | v8);
  if (objc_opt_respondsToSelector()) {
    int v9 = 32;
  }
  else {
    int v9 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFDF | v9);
  if (objc_opt_respondsToSelector()) {
    int v10 = 64;
  }
  else {
    int v10 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFFBF | v10);
  if (objc_opt_respondsToSelector()) {
    int v11 = 256;
  }
  else {
    int v11 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFEFF | v11);
  if (objc_opt_respondsToSelector()) {
    int v12 = 512;
  }
  else {
    int v12 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFDFF | v12);
  if (objc_opt_respondsToSelector()) {
    int v13 = 1024;
  }
  else {
    int v13 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFFBFF | v13);
  if (objc_opt_respondsToSelector()) {
    int v14 = 4096;
  }
  else {
    int v14 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFEFFF | v14);
  if (objc_opt_respondsToSelector()) {
    int v15 = 0x2000;
  }
  else {
    int v15 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFDFFF | v15);
  if (objc_opt_respondsToSelector()) {
    int v16 = 2048;
  }
  else {
    int v16 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFF7FF | v16);
  if (objc_opt_respondsToSelector()) {
    int v17 = 0x4000;
  }
  else {
    int v17 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFFBFFF | v17);
  if (objc_opt_respondsToSelector()) {
    int v18 = 0x8000;
  }
  else {
    int v18 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFF7FFF | v18);
  if (objc_opt_respondsToSelector()) {
    int v19 = 0x10000;
  }
  else {
    int v19 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFEFFFF | v19);
  if (objc_opt_respondsToSelector()) {
    int v20 = 0x20000;
  }
  else {
    int v20 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFDFFFF | v20);
  char v21 = objc_opt_respondsToSelector();

  if (v21) {
    int v22 = 0x40000;
  }
  else {
    int v22 = 0;
  }
  self->_canvasViewFlags = ($FDC2B10B4A0E912D0554168D9DD1339C)(*(_DWORD *)&self->_canvasViewFlags & 0xFFFBFFFF | v22);
  double v23 = [(PKTiledView *)self->_tiledView rulerHostingDelegate];

  if (v23 == self) {
    [(PKTiledView *)self->_tiledView setRulerHostingDelegate:self];
  }
}

- (id)_getDelegateZoomView
{
  return self->_rulerHostingDelegate;
}

- (void)setMaximumZoomScale:(double)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PKCanvasView;
  [(PKCanvasView *)&v3 setMaximumZoomScale:fmin(a3, 10.0)];
}

- (void)_fullyRendered
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(PKCanvasAttachmentView *)self->_pageView _wantsFullyRenderedNotification])
  {
    if ((*(unsigned char *)&self->_canvasViewFlags & 2) != 0)
    {
      objc_super v3 = [(PKCanvasView *)self delegate];
      [v3 canvasViewDidFinishRendering:self];
    }
    [(PKCanvasAttachmentView *)self->_pageView set_wantsFullyRenderedNotification:0];
  }
  id v4 = [(PKCanvasAttachmentView *)self->_pageView fullyRenderedCompletionBlocks];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    int v6 = [(PKCanvasAttachmentView *)self->_pageView fullyRenderedCompletionBlocks];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10++) + 16))();
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    int v11 = [(PKCanvasAttachmentView *)self->_pageView fullyRenderedCompletionBlocks];
    [v11 removeAllObjects];
  }
}

- (void)_drawingDidChange
{
  if (*(unsigned char *)&self->_canvasViewFlags)
  {
    objc_super v3 = [(PKAttachmentView *)self->_pageView drawing];
    char v4 = [v3 containsInternalStrokes];

    if ((v4 & 1) == 0)
    {
      id v5 = [(PKCanvasView *)self delegate];
      [v5 canvasViewDrawingDidChange:self];
    }
  }
}

- (PKDrawing)drawing
{
  objc_super v3 = [(PKAttachmentView *)self->_pageView drawing];
  int v4 = [v3 containsInternalStrokes];

  id v5 = [(PKAttachmentView *)self->_pageView drawing];
  int v6 = v5;
  if (v4) {
    uint64_t v7 = [v5 copyWithoutInternalStrokes];
  }
  else {
    uint64_t v7 = [v5 copy];
  }
  uint64_t v8 = (void *)v7;

  return (PKDrawing *)v8;
}

- (void)setDrawing:(PKDrawing *)drawing
{
  int v11 = drawing;
  if ([(PKTiledView *)self->_tiledView disableTileRendering]
    && ([(PKDrawing *)v11 strokes],
        int v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    uint64_t v8 = [(PKAttachmentView *)self->_pageView drawing];
    uint64_t v9 = [(PKAttachmentView *)self->_pageView drawing];
    uint64_t v10 = [v9 strokes];
    [v8 deleteStrokes:v10];
  }
  else
  {
    int v6 = v11;
    if (!v11) {
      int v6 = (PKDrawing *)objc_alloc_init((Class)objc_opt_class());
    }
    int v11 = v6;
    [(PKTiledView *)self->_tiledView _resetDrawingState];
    [(PKCanvasView *)self layoutIfNeeded];
    uint64_t v7 = (void *)[(PKDrawing *)v11 copy];
    [(PKAttachmentView *)self->_pageView setDrawing:v7];

    if ((*(unsigned char *)&self->_canvasViewFlags & 2) != 0) {
      [(PKCanvasAttachmentView *)self->_pageView set_wantsFullyRenderedNotification:1];
    }
    [(PKTiledView *)self->_tiledView _layoutSubviews];
    [(PKTiledView *)self->_tiledView updateTilesForVisibleRect];
  }
}

- (PKInk)ink
{
  return [(PKTiledView *)self->_tiledView ink];
}

- (void)setInk:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FB1618] blackColor];
    id v6 = +[PKInk inkWithIdentifier:@"com.apple.ink.pen" color:v5 weight:-1.0];

    id v4 = v6;
  }
  id v7 = v4;
  [(PKTiledView *)self->_tiledView setInk:v4];
}

- (PKTool)tool
{
  tool = self->_tool;
  if (tool)
  {
    objc_super v3 = tool;
  }
  else
  {
    id v4 = [(PKTiledView *)self->_tiledView ink];
    objc_super v3 = +[PKTool _toolWithInk:v4];
  }

  return v3;
}

- (void)setTool:(PKTool *)tool
{
  uint64_t v8 = tool;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Can not use PKCustomTool with PKCanvasView." userInfo:0];
    objc_exception_throw(v7);
  }
  uint64_t v5 = v8;
  if (v8)
  {
    id v6 = [(PKTool *)v8 ink];
    [(PKTiledView *)self->_tiledView setInk:v6];

    objc_storeStrong((id *)&self->_tool, tool);
    uint64_t v5 = v8;
  }
}

- (void)setRulerActive:(BOOL)rulerActive
{
}

- (BOOL)isRulerActive
{
  return [(PKTiledView *)self->_tiledView rulerEnabled];
}

- (void)updateSubviewsForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (self->_fixedPixelSizeScrollView)
  {
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:");
  }
  else
  {
    [(PKCanvasView *)self contentSize];
    if (v9 == *MEMORY[0x1E4F1DB30] && v8 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      -[PKTiledView setFrame:](self->_tiledView, "setFrame:", x, y, width, height);
      double v11 = *MEMORY[0x1E4F1DAD8];
      double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      [(PKRulerHostingDelegate *)self->_rulerHostingDelegate frame];
      v16.origin.double x = v11;
      v16.origin.double y = v12;
      v16.size.double width = width;
      v16.size.double height = height;
      if (!CGRectEqualToRect(v15, v16))
      {
        -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:", v11, v12, width, height);
        -[PKAttachmentView setFrame:](self->_pageView, "setFrame:", v11, v12, width, height);
        [(PKTiledView *)self->_tiledView _layoutSubviews];
        tiledView = self->_tiledView;
        [(PKTiledView *)tiledView updateTilesForVisibleRect];
      }
    }
  }
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)PKCanvasView;
  [(PKCanvasView *)&v5 layoutSubviews];
  [(PKCanvasView *)self bounds];
  -[PKCanvasView updateSubviewsForBounds:](self, "updateSubviewsForBounds:");
  [(PKCanvasView *)self _setContentViewOpaqueBackgroundColorIfApplicable];
  objc_super v3 = [(PKTiledView *)self->_tiledView canvasView];
  id v4 = [v3 rulerController];
  -[PKRulerController ensureRulerIsFullyOnscreen]((uint64_t)v4);
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)PKCanvasView;
  -[PKCanvasView setContentSize:](&v13, sel_setContentSize_);
  [(PKCanvasAttachmentView *)self->_pageView frame];
  if (fabs(v9) >= 0.01 || fabs(v6) >= 0.01 || vabdd_f64(v7, width) >= 0.01 || vabdd_f64(v8, height) >= 0.01)
  {
    -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:", 0.0, 0.0, width, height);
    [(PKCanvasView *)self zoomScale];
    double v11 = width / v10;
    [(PKCanvasView *)self zoomScale];
    -[PKAttachmentView setFrame:](self->_pageView, "setFrame:", 0.0, 0.0, v11, height / v12);
  }
}

- (UIGestureRecognizer)drawingGestureRecognizer
{
  v2 = [(PKTiledView *)self->_tiledView canvasView];
  objc_super v3 = [v2 drawingGestureRecognizer];

  return (UIGestureRecognizer *)v3;
}

- (BOOL)isDrawingEnabled
{
  return [(PKTiledView *)self->_tiledView _isDrawingEnabled];
}

- (void)setDrawingEnabled:(BOOL)a3
{
}

- (BOOL)allowsFingerDrawing
{
  return [(PKTiledView *)self->_tiledView allowsFingerDrawing];
}

- (void)setAllowsFingerDrawing:(BOOL)allowsFingerDrawing
{
  if (allowsFingerDrawing) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = 2;
  }
  [(PKTiledView *)self->_tiledView setDrawingPolicy:v3];
}

- (PKCanvasViewDrawingPolicy)drawingPolicy
{
  return [(PKTiledView *)self->_tiledView drawingPolicy];
}

- (void)setDrawingPolicy:(PKCanvasViewDrawingPolicy)drawingPolicy
{
}

- (id)_currentStroke
{
  return [(PKTiledView *)self->_tiledView _currentStroke];
}

- (int64_t)_maxFileFormatVersion
{
  return [(PKTiledView *)self->_tiledView _maxFileFormatVersion];
}

- (void)set_maxFileFormatVersion:(int64_t)a3
{
}

- (PKTiledView)_tiledView
{
  return self->_tiledView;
}

- (void)_setDisableTileRendering:(BOOL)a3
{
}

- (BOOL)_disableTileRendering
{
  return [(PKTiledView *)self->_tiledView disableTileRendering];
}

- (void)_setContentCoordinateSpace:(id)a3
{
}

- (UICoordinateSpace)_contentCoordinateSpace
{
  return [(PKTiledView *)self->_tiledView contentCoordinateSpace];
}

- (void)_setDrawBitmapEraserMask:(BOOL)a3
{
}

- (BOOL)_drawBitmapEraserMask
{
  return [(PKTiledView *)self->_tiledView drawBitmapEraserMask];
}

- (void)_setCombiningStrokesEnabled:(BOOL)a3
{
}

- (BOOL)_combiningStrokesEnabled
{
  return [(PKTiledView *)self->_tiledView combiningStrokesEnabled];
}

- (void)performUndo:(id)a3
{
}

- (id)drawingUndoTarget
{
  return [(PKTiledView *)self->_tiledView drawingUndoTarget];
}

- (void)setDrawingUndoTarget:(id)a3
{
}

- (SEL)drawingUndoSelector
{
  return [(PKTiledView *)self->_tiledView drawingUndoSelector];
}

- (void)setDrawingUndoSelector:(SEL)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (sel_paste_ != a3) {
    return 0;
  }
  objc_super v5 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  v8[0] = @"com.apple.drawing";
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  char v4 = [v5 containsPasteboardTypes:v6];

  return v4;
}

- (void)paste:(id)a3
{
}

- (void)set_disableUndoManager:(BOOL)a3
{
}

- (BOOL)_disableUndoManager
{
  return [(PKTiledView *)self->_tiledView disableUndoManager];
}

- (void)toolPickerSelectedToolItemDidChange:(id)a3
{
  id v8 = a3;
  char v4 = [v8 selectedToolItem];
  uint64_t v5 = [v4 _toolShouldBeSetOnCanvasView];
  if (v5)
  {
    double v6 = [v8 selectedToolItem];
    double v7 = [v6 _tool];
    [(PKCanvasView *)self setTool:v7];
  }
  [(PKCanvasView *)self setDrawingEnabled:v5];
}

- (void)toolPickerIsRulerActiveDidChange:(id)a3
{
  uint64_t v4 = [a3 isRulerActive];

  [(PKCanvasView *)self setRulerActive:v4];
}

- (void)_toolPicker:(id)a3 didChangeColor:(id)a4
{
}

- (PKCanvasView)initWithFrame:(CGRect)a3 fixedPixelSize:(CGSize)a4 drawingScale:(double)a5 layerFixedPixelSize:(BOOL)a6
{
  BOOL v6 = a6;
  double height = a4.height;
  double width = a4.width;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a5 == 0.0) {
    double v14 = 1.0;
  }
  else {
    double v14 = a5;
  }
  +[PKMetalUtility layerContentsScale];
  if (v6)
  {
    +[PKMetalUtility layerContentsScale];
    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", 0.0, 0.0, width / v16, height / v16);
    [v17 setScrollEnabled:0];
    [v17 setDelaysContentTouches:0];
    [v17 setCanCancelContentTouches:0];
    [v17 setMinimumZoomScale:1.0];
    [v17 setMaximumZoomScale:1.0];
    double v18 = width / v14;
  }
  else
  {
    uint64_t v17 = 0;
    double v18 = v10 / v14 * v15;
  }
  int v19 = -[PKCanvasView initWithFrame:drawingWidth:fixedPixelSizeScrollView:](self, "initWithFrame:drawingWidth:fixedPixelSizeScrollView:", v17, x, y, v10, v9, v18);
  [(PKCanvasView *)v19 setScrollEnabled:0];
  [(PKCanvasView *)v19 setDelaysContentTouches:0];
  [(PKCanvasView *)v19 setCanCancelContentTouches:0];
  [(PKCanvasView *)v19 setMinimumZoomScale:1.0];
  [(PKCanvasView *)v19 setMaximumZoomScale:1.0];

  return v19;
}

- (void)_setDrawing:(id)a3 fullyRenderedCompletionBlock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  double v7 = [(PKCanvasAttachmentView *)self->_pageView fullyRenderedCompletionBlocks];

  if (v7)
  {
    if (!v6) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  double v10 = [MEMORY[0x1E4F1CA48] array];
  [(PKCanvasAttachmentView *)self->_pageView setFullyRenderedCompletionBlocks:v10];

  if (v6)
  {
LABEL_3:
    id v8 = [(PKCanvasAttachmentView *)self->_pageView fullyRenderedCompletionBlocks];
    double v9 = _Block_copy(v6);
    [v8 addObject:v9];
  }
LABEL_4:
  [(PKCanvasView *)self setDrawing:v11];
}

- (void)_setDrawing:(id)a3 alreadyRenderedDrawing:(id)a4 imageForAlreadyRenderedDrawing:(id)a5 fullyRenderedCompletionBlock:(id)a6
{
}

- (void)imageWithCompletionBlock:(id)a3
{
  id v4 = a3;
  if (self->_fixedPixelSizeScrollView) {
    fixedPixelSizeScrollView = (PKCanvasView *)self->_fixedPixelSizeScrollView;
  }
  else {
    fixedPixelSizeScrollView = self;
  }
  [(PKCanvasView *)fixedPixelSizeScrollView bounds];
  double v7 = v6;
  double v9 = v8;
  double v10 = [PKImageRenderer alloc];
  +[PKMetalUtility layerContentsScale];
  double v12 = -[PKImageRenderer initWithSize:scale:](v10, "initWithSize:scale:", v7, v9, v11);
  objc_super v13 = [(PKCanvasView *)self drawing];
  pageView = self->_pageView;
  if (pageView)
  {
    [(PKCanvasAttachmentView *)pageView drawingTransform];
    double v15 = *((double *)&v25 + 1);
    double v16 = *(double *)&v25;
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v25 = 0u;
    double v15 = 0.0;
    double v16 = 0.0;
  }
  double v17 = sqrt(v15 * v15 + v16 * v16);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __41__PKCanvasView_imageWithCompletionBlock___block_invoke;
  v23[3] = &unk_1E64CAE40;
  id v24 = v4;
  double v18 = *MEMORY[0x1E4F1DB20];
  double v19 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
  double v20 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
  double v21 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  id v22 = v4;
  -[PKImageRenderer renderDrawing:clippedToStrokeSpaceRect:scale:completion:](v12, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v13, v23, v18, v19, v20, v21, v17);
}

uint64_t __41__PKCanvasView_imageWithCompletionBlock___block_invoke(uint64_t a1, id a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 CGImage];
  id v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);

  return v4(v2, v3);
}

- (UIView)rulerView
{
  return (UIView *)[(PKTiledView *)self->_tiledView rulerView];
}

- (id)rulerHostingView
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 0x40) != 0)
  {
    double v9 = [(PKCanvasView *)self delegate];
    double v8 = [v9 _canvasViewRulerHostingView:self];
  }
  else
  {
    uint64_t v3 = [(PKCanvasView *)self rulerHostingDelegate];
    if (!v3) {
      goto LABEL_5;
    }
    id v4 = (void *)v3;
    uint64_t v5 = [(PKCanvasView *)self rulerHostingDelegate];
    char v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) == 0
      || ([(PKCanvasView *)self rulerHostingDelegate],
          double v7 = objc_claimAutoreleasedReturnValue(),
          [v7 rulerHostingView],
          double v8 = (PKTiledView *)objc_claimAutoreleasedReturnValue(),
          v7,
          !v8))
    {
LABEL_5:
      double v8 = self->_tiledView;
    }
  }

  return v8;
}

- (BOOL)rulerHostWantsSharedRuler
{
  uint64_t v3 = [(PKCanvasView *)self rulerHostingDelegate];
  if (!v3) {
    return 0;
  }
  id v4 = (void *)v3;
  uint64_t v5 = [(PKCanvasView *)self rulerHostingDelegate];
  char v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) == 0) {
    return 0;
  }
  double v7 = [(PKCanvasView *)self rulerHostingDelegate];
  char v8 = [v7 rulerHostWantsSharedRuler];

  return v8;
}

- (UIView)selectionView
{
  uint64_t v2 = [(PKTiledView *)self->_tiledView selectionController];
  uint64_t v3 = v2;
  if (v2) {
    uint64_t v2 = (void *)v2[19];
  }
  id v4 = v2;

  return v4;
}

- (BOOL)_hasSelection
{
  return [(PKTiledView *)self->_tiledView _hasSelection];
}

- (void)commitSelectionIfNecessaryWithCompletion:(id)a3
{
}

- (void)_setSelectedStrokesColor:(id)a3
{
}

- (id)_selectionController
{
  return [(PKTiledView *)self->_tiledView selectionController];
}

- (void)_flushCaches
{
}

- (CGSize)_metalViewDrawableSize
{
  uint64_t v2 = [(PKTiledView *)self->_tiledView canvasView];
  [v2 _metalViewDrawableSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (CGSize)_rendererControllerPixelSize
{
  uint64_t v2 = [(PKTiledView *)self->_tiledView canvasView];
  [v2 _rendererControllerPixelSize];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)_updateCanvas
{
  [(PKTiledView *)self->_tiledView _layoutSubviews];
  tiledView = self->_tiledView;

  [(PKTiledView *)tiledView updateTilesForVisibleRect];
}

- (CGSize)_fixedPixelSize
{
  if (self->_fixedPixelSizeScrollView) {
    fixedPixelSizeScrollView = self->_fixedPixelSizeScrollView;
  }
  else {
    fixedPixelSizeScrollView = self->_rulerHostingDelegate;
  }
  [fixedPixelSizeScrollView bounds];
  double v4 = v3;
  double v6 = v5;
  +[PKMetalUtility layerContentsScale];
  double v8 = v4 * v7;
  +[PKMetalUtility layerContentsScale];
  double v10 = v6 * v9;
  double v11 = v8;
  result.double height = v10;
  result.double width = v11;
  return result;
}

- (void)updateFixedPixelSizeViewForBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  objc_msgSend(MEMORY[0x1E4F39CF8], "begin", a3.origin.x, a3.origin.y);
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
  CGFloat v7 = width / v6;
  [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
  CGFloat v9 = height / v8;
  [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
  -[PKAttachmentView setFrame:](self->_pageView, "setFrame:");
  [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
  -[PKRulerHostingDelegate setFrame:](self->_rulerHostingDelegate, "setFrame:");
  fixedPixelSizeScrollViewWrapper = self->_fixedPixelSizeScrollViewWrapper;
  long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v16[0] = *MEMORY[0x1E4F1DAB8];
  v16[1] = v11;
  v16[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [(UIView *)fixedPixelSizeScrollViewWrapper setTransform:v16];
  [(UIScrollView *)self->_fixedPixelSizeScrollView bounds];
  -[UIView setFrame:](self->_fixedPixelSizeScrollViewWrapper, "setFrame:");
  CGAffineTransformMakeScale(&v15, v7, v9);
  double v12 = self->_fixedPixelSizeScrollViewWrapper;
  CGAffineTransform v14 = v15;
  [(UIView *)v12 setTransform:&v14];
  v13.receiver = self;
  v13.super_class = (Class)PKCanvasView;
  -[PKCanvasView setContentSize:](&v13, sel_setContentSize_, width, height);
  [MEMORY[0x1E4F39CF8] commit];
}

- (void)_setFixedPixelSize:(CGSize)a3 drawingScale:(double)a4
{
  if (self->_fixedPixelSizeScrollView)
  {
    double height = a3.height;
    double width = a3.width;
    +[PKMetalUtility layerContentsScale];
    -[UIScrollView setFrame:](self->_fixedPixelSizeScrollView, "setFrame:", 0.0, 0.0, width / v8, height / v8);
    [(PKCanvasView *)self bounds];
    -[PKCanvasView updateFixedPixelSizeViewForBounds:](self, "updateFixedPixelSizeViewForBounds:");
  }
  [(PKRulerHostingDelegate *)self->_rulerHostingDelegate bounds];
  double v10 = v9 / a4;
  +[PKMetalUtility layerContentsScale];
  double v12 = v11 * v10;
  pageView = self->_pageView;

  [(PKCanvasAttachmentView *)pageView setDrawingWidth:v12];
}

- (CGAffineTransform)strokeTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v3 + 32);
  return self;
}

- (CGAffineTransform)drawingTransform
{
  uint64_t v4 = MEMORY[0x1E4F1DAB8];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->CGFloat c = v5;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v4 + 32);
  if (*(void *)&self[43].d)
  {
    double v6 = self;
    [(CGAffineTransform *)self bounds];
    double v8 = v7;
    double v10 = v9;
    [*(id *)&v6[43].d bounds];
    double v12 = v11;
    double v14 = v13;
    memset(&v18, 0, sizeof(v18));
    CGFloat c = v6[43].c;
    if (c != 0.0) {
      [*(id *)&c drawingTransform];
    }
    CGAffineTransformMakeScale(&t1, v8 / v12, v10 / v14);
    CGAffineTransform v16 = v18;
    return CGAffineTransformConcat(retstr, &t1, &v16);
  }
  return self;
}

- (UIHoverGestureRecognizer)_hoverGestureRecognizer
{
  uint64_t v2 = [(PKCanvasView *)self _tiledView];
  uint64_t v3 = [v2 hoverGestureRecognizer];

  return (UIHoverGestureRecognizer *)v3;
}

- (void)_canvasViewWillBeginDrawing:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 0x20) != 0)
  {
    long long v5 = [(PKCanvasView *)self delegate];
    [v5 _canvasViewWillBeginDrawing:self];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v6 = [(PKCanvasView *)self _observers];
  double v7 = (void *)[v6 copy];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) _canvasViewWillBeginDrawing:self];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)_canvasViewWillCreateSnapshot:(id)a3
{
  if (*((unsigned char *)&self->_canvasViewFlags + 2))
  {
    id v4 = [(PKCanvasView *)self delegate];
    [v4 _canvasViewWillCreateSnapshot:self];
  }
}

- (BOOL)_canvasViewSnapshottingDisabled:(id)a3
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 2) & 2) == 0) {
    return 0;
  }
  id v4 = self;
  long long v5 = [(PKCanvasView *)self delegate];
  LOBYTE(v4) = [v5 _canvasViewSnapshottingDisabled:v4];

  return (char)v4;
}

- (void)canvasViewDidBeginDrawing:(id)a3
{
  id v7 = a3;
  $FDC2B10B4A0E912D0554168D9DD1339C canvasViewFlags = self->_canvasViewFlags;
  if ((*(unsigned char *)&canvasViewFlags & 4) != 0)
  {
    long long v5 = [(PKCanvasView *)self delegate];
    [v5 canvasViewDidBeginDrawing:self];

    $FDC2B10B4A0E912D0554168D9DD1339C canvasViewFlags = self->_canvasViewFlags;
  }
  if ((*(unsigned char *)&canvasViewFlags & 0x10) != 0)
  {
    double v6 = [(PKCanvasView *)self delegate];
    [v6 canvasViewDidBeginUsingTool:self];
  }
}

- (void)canvasViewDidEndDrawing:(id)a3
{
  id v7 = a3;
  $FDC2B10B4A0E912D0554168D9DD1339C canvasViewFlags = self->_canvasViewFlags;
  if ((*(unsigned char *)&canvasViewFlags & 8) != 0)
  {
    long long v5 = [(PKCanvasView *)self delegate];
    [v5 canvasViewDidEndDrawing:self];

    $FDC2B10B4A0E912D0554168D9DD1339C canvasViewFlags = self->_canvasViewFlags;
  }
  if ((*(unsigned char *)&canvasViewFlags & 0x20) != 0)
  {
    double v6 = [(PKCanvasView *)self delegate];
    [v6 canvasViewDidEndUsingTool:self];
  }
}

- (void)canvasViewDidBeginLasso:(id)a3
{
  if ((*(unsigned char *)&self->_canvasViewFlags & 0x10) != 0)
  {
    id v4 = [(PKCanvasView *)self delegate];
    [v4 canvasViewDidBeginUsingTool:self];
  }
}

- (void)canvasViewDidEndLasso:(id)a3
{
  if ((*(unsigned char *)&self->_canvasViewFlags & 0x20) != 0)
  {
    id v4 = [(PKCanvasView *)self delegate];
    [v4 canvasViewDidEndUsingTool:self];
  }
}

- (void)canvasView:(id)a3 beganStroke:(id)a4
{
  if ((*(unsigned char *)&self->_canvasViewFlags & 0x40) != 0)
  {
    id v5 = a4;
    id v6 = [(PKCanvasView *)self delegate];
    [v6 _canvasView:self beganStroke:v5];
  }
}

- (void)canvasView:(id)a3 endedStroke:(id)a4 shapeStrokes:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  $FDC2B10B4A0E912D0554168D9DD1339C canvasViewFlags = self->_canvasViewFlags;
  if ((*(_WORD *)&canvasViewFlags & 0x200) != 0)
  {
    uint64_t v11 = [(PKCanvasView *)self delegate];
    [v11 _canvasView:self endedStroke:v8 shapeStrokes:v9];
  }
  else
  {
    if ((*(_WORD *)&canvasViewFlags & 0x100) == 0) {
      goto LABEL_6;
    }
    uint64_t v11 = [(PKCanvasView *)self delegate];
    [v11 _canvasView:self endedStroke:v8];
  }

LABEL_6:
}

- (void)canvasView:(id)a3 cancelledStroke:(id)a4
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 4) != 0)
  {
    id v5 = a4;
    id v6 = [(PKCanvasView *)self delegate];
    [v6 _canvasView:self cancelledStroke:v5];
  }
}

- (void)canvasView:(id)a3 didRefineStrokes:(id)a4 withNewStrokes:(id)a5
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 2) & 4) != 0)
  {
    id v7 = a5;
    id v8 = a4;
    id v9 = [(PKCanvasView *)self delegate];
    [v9 canvasView:self didRefineStrokes:v8 withNewStrokes:v7];
  }
}

- (void)canvasView:(id)a3 didChangeHiddenState:(BOOL)a4
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 0x10) != 0)
  {
    BOOL v4 = a4;
    id v6 = [(PKCanvasView *)self delegate];
    [v6 _canvasView:self didChangeHiddenState:v4];
  }
}

- (BOOL)canvasView:(id)a3 shouldBeginDrawingWithTouch:(id)a4
{
  id v5 = a4;
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 8) != 0)
  {
    id v7 = [(PKCanvasView *)self window];
    BOOL v8 = +[PKToolPicker isActiveToolPickerVisibleForWindow:v7];

    if (v8)
    {
      id v9 = [(PKCanvasView *)self drawingGestureRecognizer];
      uint64_t v10 = [v9 allowedTouchTypes];
      uint64_t v11 = [(PKCanvasView *)self _allowedDrawingTouchTypes];
      char v12 = [v10 isEqualToArray:v11];

      if ((v12 & 1) == 0)
      {
        long long v13 = os_log_create("com.apple.pencilkit", "");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)double v19 = 0;
          _os_log_error_impl(&dword_1C44F8000, v13, OS_LOG_TYPE_ERROR, "Received an unexpected touch type according to the current drawing policy.", v19, 2u);
        }

        long long v14 = [(PKCanvasView *)self _allowedDrawingTouchTypes];
        long long v15 = [(PKCanvasView *)self drawingGestureRecognizer];
        [v15 setAllowedTouchTypes:v14];
      }
    }
    [v5 locationInView:self];
    CGAffineTransform v16 = -[PKCanvasView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
    if (v16)
    {
      uint64_t v17 = [(PKCanvasView *)self delegate];
      char v6 = [v17 _canvasView:self shouldBeginDrawingWithTouch:v5];
    }
    else
    {
      char v6 = 0;
    }
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)canvasView:(id)a3 hoverShouldBeActiveAt:(CGPoint)a4
{
  if ((*((unsigned char *)&self->_canvasViewFlags + 1) & 0x80) == 0) {
    return 1;
  }
  id v5 = self;
  -[PKTiledView convertPoint:toView:](self->_tiledView, "convertPoint:toView:", self, a4.x, a4.y);
  double v7 = v6;
  double v9 = v8;
  uint64_t v10 = [(PKCanvasView *)v5 delegate];
  LOBYTE(v5) = objc_msgSend(v10, "_canvasView:hoverShouldBeActiveAt:", v5, v7, v9);

  return (char)v5;
}

- (id)_allowedDrawingTouchTypes
{
  if ([(PKTiledView *)self->_tiledView allowsFingerDrawing]) {
    uint64_t v2 = &unk_1F200F030;
  }
  else {
    uint64_t v2 = &unk_1F200F048;
  }

  return v2;
}

- (CGPoint)rulerSnapLineOriginAndNormal:(CGPoint *)a3 topSide:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [(PKCanvasView *)self _tiledView];
  char v8 = [v7 rulerEnabled];

  if (v8)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v24 = 0u;
    double v9 = [(PKCanvasView *)self _tiledView];
    uint64_t v10 = v9;
    if (v9)
    {
      [v9 rulerTransform];
    }
    else
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v24 = 0u;
    }

    long long v13 = [(PKCanvasView *)self _tiledView];
    [v13 rulerWidth];
    double v15 = v14;

    if (v4) {
      double v16 = v15 * 0.5;
    }
    else {
      double v16 = -(v15 * 0.5);
    }
    double v17 = v16 * *(double *)&v25 + *(double *)&v24 * -100.0;
    double v18 = v16 * *((double *)&v25 + 1) + *((double *)&v24 + 1) * -100.0;
    if (a3)
    {
      double v19 = v16 + v16;
      double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
      double v21 = *(double *)&v26
          + v19 * *(double *)&v25
          + *(double *)&v24 * 0.0
          - (*(double *)&v26
           + *(double *)&v25 * v20
           + *(double *)&v24 * *MEMORY[0x1E4F1DAD8]);
      double v22 = *((double *)&v26 + 1)
          + v19 * *((double *)&v25 + 1)
          + *((double *)&v24 + 1) * 0.0
          - (*((double *)&v26 + 1)
           + *((double *)&v25 + 1) * v20
           + *((double *)&v24 + 1) * *MEMORY[0x1E4F1DAD8]);
      double v23 = 1.0 / sqrt(v22 * v22 + v21 * v21);
      a3->double x = v21 * v23;
      a3->double y = v22 * v23;
    }
    double v11 = *(double *)&v26 + v17;
    double v12 = *((double *)&v26 + 1) + v18;
  }
  else
  {
    if (a3)
    {
      a3->double x = 0.0;
      a3->double y = 0.0;
    }
    double v11 = *MEMORY[0x1E4F1DAD8];
    double v12 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)setRulerEnabled:(BOOL)a3
{
}

- (BOOL)rulerEnabled
{
  return [(PKTiledView *)self->_tiledView rulerEnabled];
}

- (void)setRulerHostingDelegate:(id)a3
{
  p_drawingTransform = &self->_drawingTransform;
  double v6 = (PKCanvasView *)a3;
  objc_storeWeak((id *)p_drawingTransform, v6);
  if (v6) {
    id v5 = v6;
  }
  else {
    id v5 = self;
  }
  [(PKTiledView *)self->_tiledView setRulerHostingDelegate:v5];
}

- (void)setPredictionDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PKTiledView *)self->_tiledView canvasView];
  [v4 setPredictionDisabled:v3];
}

- (BOOL)predictionDisabled
{
  uint64_t v2 = [(PKTiledView *)self->_tiledView canvasView];
  char v3 = [v2 predictionDisabled];

  return v3;
}

- (double)_latestLatency
{
  [(PKTiledView *)self->_tiledView _latestLatency];
  return result;
}

- (id)_adornmentViewsToHitTest
{
  return [(PKTiledView *)self->_tiledView _adornmentViewsToHitTest];
}

- (id)_selectionInteraction
{
  uint64_t v2 = [(PKTiledView *)self->_tiledView selectionController];
  char v3 = -[PKSelectionController selectionInteraction](v2);

  return v3;
}

- (BOOL)supportsCopyAsText
{
  return [(PKTiledView *)self->_tiledView supportsCopyAsText];
}

- (void)setSupportsCopyAsText:(BOOL)a3
{
}

- (NSHashTable)_observers
{
  contentView = self->_contentView;
  if (!contentView)
  {
    id v4 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    id v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }

  return (NSHashTable *)contentView;
}

- (void)_addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKCanvasView *)self _observers];
  [v5 addObject:v4];
}

- (void)_removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKCanvasView *)self _observers];
  [v5 removeObject:v4];
}

- (BOOL)_hasObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(PKCanvasView *)self _observers];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_keepPencilShadowVisible
{
  id v2 = [(PKCanvasView *)self _tiledView];
  [v2 _keepPencilShadowVisible];
}

- (void)_updatePencilShadowViewWithInputPoint:(id *)a3
{
  id v4 = [(PKCanvasView *)self _tiledView];
  long long v5 = *(_OWORD *)&a3->var9;
  v9[4] = *(_OWORD *)&a3->var7;
  v9[5] = v5;
  long long v6 = *(_OWORD *)&a3->var13;
  v9[6] = *(_OWORD *)&a3->var11;
  v9[7] = v6;
  long long v7 = *(_OWORD *)&a3->var1;
  v9[0] = a3->var0;
  v9[1] = v7;
  long long v8 = *(_OWORD *)&a3->var5;
  v9[2] = *(_OWORD *)&a3->var3;
  v9[3] = v8;
  [v4 _updatePencilShadowView:v9];
}

- (PKContentVersion)maximumSupportedContentVersion
{
  return (PKContentVersion)self->__observers;
}

- (void)set_observers:(id)a3
{
}

- (UIView)contentView
{
  return (UIView *)self->_rulerHostingDelegate;
}

- (BOOL)disableWideGamut
{
  return self->_maximumSupportedContentVersion;
}

- (void)setDisableWideGamut:(BOOL)a3
{
  LOBYTE(self->_maximumSupportedContentVersion) = a3;
}

- (PKRulerHostingDelegate)rulerHostingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_drawingTransform);

  return (PKRulerHostingDelegate *)WeakRetained;
}

- (void)setDrawingTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_drawingTransform.b = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_drawingTransform.d = v4;
  *(_OWORD *)&self->_drawingTransform.tdouble y = v3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_drawingTransform);
  objc_storeStrong((id *)&self->_rulerHostingDelegate, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_fixedPixelSizeScrollViewWrapper, 0);
  objc_storeStrong((id *)&self->_fixedPixelSizeScrollView, 0);
  objc_storeStrong((id *)&self->_pageView, 0);
  objc_storeStrong((id *)&self->_tool, 0);

  objc_storeStrong((id *)&self->_tiledView, 0);
}

@end