@interface _SSSScreenshotPDFView
- (BOOL)isInCropMode;
- (CGSize)intrinsicContentSize;
- (SSSScreenshotPDFViewDelegate)delegate;
- (_SSSScreenshotPDFView)initWithFrame:(CGRect)a3;
- (id)_paperKitPDFViewOverlayViewController:(id)a3;
- (id)currentPDFView;
- (id)undoManager;
- (int64_t)currentPDFPage;
- (void)_paperKitPDFDidChangeInView:(id)a3 changeCounter:(unint64_t)a4;
- (void)_paperKitPDFView:(id)a3 startEditingOpacityInAccessoryView:(id)a4;
- (void)deselectAllAnnotations;
- (void)didMoveToWindow;
- (void)endedEditing;
- (void)enterCropMode;
- (void)enterEditing;
- (void)enterMarkupMode;
- (void)exitMarkupMode;
- (void)layoutSubviews;
- (void)setCrop:(CGRect)a3;
- (void)setDelegate:(id)a3;
- (void)setIsInCropMode:(BOOL)a3;
- (void)setRulerHostView:(id)a3;
- (void)setScreenshot:(id)a3;
- (void)setVellumOpacity:(double)a3;
- (void)setupOverlayControllerWithPDFDocument:(id)a3;
- (void)setupPDFData;
- (void)setupPDFView;
- (void)setupPaperKitView;
- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3;
- (void)updateViewState;
@end

@implementation _SSSScreenshotPDFView

- (_SSSScreenshotPDFView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_SSSScreenshotPDFView;
  v3 = -[_SSSScreenshotAnnotationView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (_os_feature_enabled_impl()) {
    [(_SSSScreenshotPDFView *)v3 setupPaperKitView];
  }
  else {
    [(_SSSScreenshotPDFView *)v3 setupPDFView];
  }
  v4 = (UIActivityIndicatorView *)[objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  activityIndicatorView = v3->_activityIndicatorView;
  v3->_activityIndicatorView = v4;

  [(UIActivityIndicatorView *)v3->_activityIndicatorView setUserInteractionEnabled:0];
  [(UIActivityIndicatorView *)v3->_activityIndicatorView startAnimating];
  v6 = +[UIColor whiteColor];
  [(UIActivityIndicatorView *)v3->_activityIndicatorView setColor:v6];

  [(_SSSScreenshotPDFView *)v3 addSubview:v3->_activityIndicatorView];
  v7 = [(_SSSScreenshotAnnotationView *)v3 overlayController];
  [v7 setViewState:1, 0];

  [(_SSSScreenshotAnnotationView *)v3 setScreenshotEditsSnapshotted:1];
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    id v8 = objc_alloc_init((Class)UIView);
    [(_SSSScreenshotAnnotationView *)v3 setVellumView:v8];

    v9 = [(_SSSScreenshotAnnotationView *)v3 vellumView];
    v10 = +[UIColor whiteColor];
    [v9 setBackgroundColor:v10];

    v11 = [(_SSSScreenshotAnnotationView *)v3 vellumView];
    [v11 setUserInteractionEnabled:0];
  }
  v3->_currentVellumPage = 0x7FFFFFFFFFFFFFFFLL;
  return v3;
}

- (void)didMoveToWindow
{
  v3 = [(_SSSScreenshotPDFView *)self window];

  if (v3)
  {
    if (_os_feature_enabled_impl())
    {
      paperKitView = self->_paperKitView;
      [(_SSSScreenshotPaperKitPDFView *)paperKitView setEditable:0];
    }
    else
    {
      v5 = [(PDFView *)self->_pdfView document];
      v6 = [v5 akController];
      id v7 = [v6 toolPicker];

      [v7 setVisible:1 forFirstResponder:self->_pdfView];
    }
  }
}

- (void)enterEditing
{
  if (_os_feature_enabled_impl())
  {
    [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setEditable:1];
    [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView updatePaletteVisibilityIfNecessary:1];
  }
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotPDFView;
  [(_SSSScreenshotAnnotationView *)&v3 enterEditing];
}

- (void)endedEditing
{
  if (_os_feature_enabled_impl()) {
    [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setEditable:0];
  }
  v3.receiver = self;
  v3.super_class = (Class)_SSSScreenshotPDFView;
  [(_SSSScreenshotAnnotationView *)&v3 endedEditing];
}

- (void)updatePaletteVisibilityIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if (_os_feature_enabled_impl())
  {
    paperKitView = self->_paperKitView;
    [(_SSSScreenshotPaperKitPDFView *)paperKitView updatePaletteVisibilityIfNecessary:v3];
  }
}

- (void)setIsInCropMode:(BOOL)a3
{
  self->_isInCropMode = a3;
  -[_SSSScreenshotPaperKitPDFView setIsCropping:](self->_paperKitView, "setIsCropping:");
}

- (void)setupPaperKitView
{
  BOOL v3 = [_SSSScreenshotPaperKitPDFView alloc];
  [(_SSSScreenshotPDFView *)self bounds];
  v4 = -[_SSSScreenshotPaperKitPDFView initWithFrame:](v3, "initWithFrame:");
  paperKitView = self->_paperKitView;
  self->_paperKitView = v4;

  [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setDelegate:self];
  v6 = self->_paperKitView;

  [(_SSSScreenshotPDFView *)self addSubview:v6];
}

- (void)setupPDFView
{
  +[PDFView EnableAnnotationKit];
  id v3 = objc_alloc((Class)PDFView);
  [(_SSSScreenshotPDFView *)self bounds];
  v4 = [v3 initWithFrame:];
  pdfView = self->_pdfView;
  self->_pdfView = v4;

  [(PDFView *)self->_pdfView setDisplayMode:1];
  [(PDFView *)self->_pdfView setDisplaysPageBreaks:1];
  [(PDFView *)self->_pdfView setMinScaleFactor:1.0];
  [(PDFView *)self->_pdfView setMaxScaleFactor:1.0];
  [(PDFView *)self->_pdfView setAutoScales:0];
  v6 = self->_pdfView;
  id v7 = +[UIColor clearColor];
  [(PDFView *)v6 setBackgroundColor:v7];

  [(PDFView *)self->_pdfView setEnableDataDetectors:0];
  id v8 = [(PDFView *)self->_pdfView documentScrollView];
  [v8 setShowsHorizontalScrollIndicator:0];

  v9 = [(PDFView *)self->_pdfView documentScrollView];
  [v9 setShowsVerticalScrollIndicator:0];

  [(_SSSScreenshotPDFView *)self addSubview:self->_pdfView];
  v10 = self->_pdfView;

  [(PDFView *)v10 setAkAnnotationEditingEnabled:1];
}

- (void)setVellumOpacity:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_SSSScreenshotPDFView;
  -[_SSSScreenshotAnnotationView setVellumOpacity:](&v5, "setVellumOpacity:");
  [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setVellumOpacity:a3];
}

- (void)setRulerHostView:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl())
  {
    [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setRulerHostView:v4];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)_SSSScreenshotPDFView;
    [(_SSSScreenshotAnnotationView *)&v5 setRulerHostView:v4];
  }
}

- (void)layoutSubviews
{
  v58.receiver = self;
  v58.super_class = (Class)_SSSScreenshotPDFView;
  [(_SSSScreenshotPDFView *)&v58 layoutSubviews];
  [(_SSSScreenshotPDFView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[PDFView setFrame:](self->_pdfView, "setFrame:");
  [(PDFView *)self->_pdfView layoutDocumentView];
  -[_SSSScreenshotPaperKitPDFView setFrame:](self->_paperKitView, "setFrame:", v4, v6, v8, v10);
  if ((_os_feature_enabled_impl() & 1) != 0
    || ([(_SSSScreenshotAnnotationView *)self screenshot],
        v11 = objc_claimAutoreleasedReturnValue(),
        [v11 pdfData],
        v12 = objc_claimAutoreleasedReturnValue(),
        v12,
        v11,
        !v12))
  {
    v16 = [(_SSSScreenshotAnnotationView *)self overlayController];
    [v16 setViewState:1];
    goto LABEL_9;
  }
  int64_t v13 = [(_SSSScreenshotPDFView *)self currentPDFPage];
  int64_t v14 = [(_SSSScreenshotPDFView *)self currentPDFPage];
  v15 = [(_SSSScreenshotPDFView *)self currentPDFView];
  v16 = [v15 pageViewForPageAtIndex:v14];

  if (self->_currentVellumPage != v14) {
    goto LABEL_11;
  }
  v17 = [(_SSSScreenshotAnnotationView *)self vellumView];
  uint64_t v18 = [v17 superview];
  if (!v18)
  {

LABEL_11:
    v25 = [(_SSSScreenshotAnnotationView *)self vellumView];
    [v25 removeFromSuperview];

    if (_os_feature_enabled_impl())
    {
      v26 = [(_SSSScreenshotAnnotationView *)self vellumView];
      [v16 bounds];
      [v26 setFrame:];

      v27 = [(_SSSScreenshotAnnotationView *)self vellumView];
      [v16 addSubview:v27];
    }
    else
    {
      v28 = [(PDFView *)self->_pdfView document];
      v29 = [v28 akController];
      v27 = [v29 overlayViewAtIndex:v14];

      v30 = [(_SSSScreenshotAnnotationView *)self vellumView];
      [v27 bounds];
      [v30 setFrame:];

      v31 = [(_SSSScreenshotAnnotationView *)self vellumView];
      [v16 insertSubview:v31 belowSubview:v27];
    }
    self->_currentVellumPage = [(_SSSScreenshotPDFView *)self currentPDFPage];
    goto LABEL_15;
  }
  v19 = (void *)v18;
  v20 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [v20 superview];
  v22 = int64_t v21 = v13;

  BOOL v23 = v22 == v16;
  int64_t v13 = v21;
  if (!v23) {
    goto LABEL_11;
  }
LABEL_15:
  v32 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [(_SSSScreenshotAnnotationView *)self vellumOpacity];
  [v32 setAlpha:];

  v33 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [v33 setHidden:0];

  if (_os_feature_enabled_impl())
  {
    int64_t v34 = [(_SSSScreenshotPDFView *)self currentPDFPage];
    v35 = [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView pdfView];
    v36 = [v35 pageViewForPageAtIndex:v34];
  }
  else
  {
    v35 = [(PDFView *)self->_pdfView document];
    v37 = [v35 akController];
    v36 = [v37 overlayViewAtIndex:v14];
  }
  v38 = [(_SSSScreenshotAnnotationView *)self vellumView];
  [v36 bounds];
  [v38 setFrame:];

  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    v39 = [(_SSSScreenshotPDFView *)self currentPDFView];
    v40 = [v39 visiblePages];

    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = v40;
    id v42 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
    if (v42)
    {
      id v43 = v42;
      uint64_t v44 = *(void *)v55;
      do
      {
        for (i = 0; i != v43; i = (char *)i + 1)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          v46 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          [(_SSSScreenshotAnnotationView *)self vellumOpacity];
          [v46 setVellumOpacity:];
        }
        id v43 = [v41 countByEnumeratingWithState:&v54 objects:v59 count:16];
      }
      while (v43);
    }

    v47 = [(_SSSScreenshotAnnotationView *)self overlayController];
    [v47 setViewState:1 v13];
  }
  v48 = [(_SSSScreenshotAnnotationView *)self screenshot];
  v49 = [v48 PDFDocument];
  id v50 = [v49 pageCount];

  if ((unint64_t)v50 >= 2)
  {
    v51 = [(_SSSScreenshotPDFView *)self traitCollection];
    if ([v51 userInterfaceIdiom]) {
      double v52 = 24.0;
    }
    else {
      double v52 = 8.0;
    }

    v53 = [(_SSSScreenshotPDFView *)self currentPDFView];
    [v53 setPageBreakMargins:v52, v52, v52, v52];
  }
LABEL_9:

  activityIndicatorView = self->_activityIndicatorView;
  [(_SSSScreenshotPDFView *)self bounds];
  -[UIActivityIndicatorView setFrame:](activityIndicatorView, "setFrame:");
}

- (id)currentPDFView
{
  if (_os_feature_enabled_impl())
  {
    double v3 = [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView pdfView];
  }
  else
  {
    double v3 = self->_pdfView;
  }

  return v3;
}

- (CGSize)intrinsicContentSize
{
  if (_os_feature_enabled_impl())
  {
    paperKitView = self->_paperKitView;
    [(_SSSScreenshotPaperKitPDFView *)paperKitView intrinsicContentSize];
  }
  else
  {
    double v6 = [(_SSSScreenshotPDFView *)self currentPDFView];
    double v7 = [v6 document];
    double v8 = [v7 pageAtIndex:-[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage")];
    [v8 boundsForBox:1];
    double v10 = v9;
    double v12 = v11;

    double v4 = v10;
    double v5 = v12;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)setCrop:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (_os_feature_enabled_impl())
  {
    paperKitView = self->_paperKitView;
    -[_SSSScreenshotPaperKitPDFView updateCurrentPageCropRect:](paperKitView, "updateCurrentPageCropRect:", x, y, width, height);
  }
  else
  {
    id v17 = [(_SSSScreenshotPDFView *)self currentPDFView];
    double v9 = [v17 document];
    double v10 = [v9 pageAtIndex:-[_SSSScreenshotPDFView currentPDFPage](self, "currentPDFPage")];
    [v10 boundsForBox:0];
    double v12 = v11;
    double v14 = v13;

    v15 = [v17 document];
    v16 = [_SSSScreenshotPDFView currentPDFPage];
    [v16 setBounds:1 forBox:x * v12, (1.0 - (y + height)) * v14, width * v12, height * v14];

    [v17 layoutDocumentView];
  }
}

- (void)deselectAllAnnotations
{
  if (_os_feature_enabled_impl())
  {
    paperKitView = self->_paperKitView;
    [(_SSSScreenshotPaperKitPDFView *)paperKitView deselectAllAnnotations];
  }
}

- (void)setScreenshot:(id)a3
{
  id v4 = a3;
  if (_os_feature_enabled_impl()) {
    [v4 setDocumentGenerator:self->_paperKitView];
  }
  double v5 = [(_SSSScreenshotAnnotationView *)self screenshot];
  unsigned __int8 v6 = [v5 isEqual:v4];

  if ((v6 & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_SSSScreenshotPDFView;
    [(_SSSScreenshotAnnotationView *)&v7 setScreenshot:v4];
    [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setScreenshot:v4];
    [(_SSSScreenshotPDFView *)self setNeedsLayout];
  }
  [(_SSSScreenshotPDFView *)self setupPDFData];
}

- (id)undoManager
{
  v2 = [(_SSSScreenshotAnnotationView *)self screenshot];
  double v3 = [v2 undoManagerForEditMode:1];

  return v3;
}

- (void)setupPDFData
{
  int v3 = _os_feature_enabled_impl();
  id v4 = [(_SSSScreenshotAnnotationView *)self screenshot];
  double v5 = v4;
  if (v3)
  {
    unsigned __int8 v6 = [v4 pdfData];

    objc_super v7 = [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView pdfData];
    unsigned __int8 v8 = [v7 isEqual:v6];

    if ((v8 & 1) == 0) {
      [(_SSSScreenshotPaperKitPDFView *)self->_paperKitView setupDocumentViewController];
    }
    id v9 = [v6 length];

    if (!v9) {
      goto LABEL_11;
    }
LABEL_10:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002EB58;
    v15[3] = &unk_100099A20;
    v15[4] = self;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10002EB70;
    v14[3] = &unk_100099AB0;
    v14[4] = self;
    +[UIView animateWithDuration:v15 animations:v14 completion:0.2];
    return;
  }
  double v10 = [v4 PDFDocument];

  if (v10)
  {
    double v11 = [(PDFView *)self->_pdfView document];
    unsigned __int8 v12 = [v11 isEqual:v10];

    if ((v12 & 1) == 0) {
      [(_SSSScreenshotPDFView *)self setupOverlayControllerWithPDFDocument:v10];
    }

    goto LABEL_10;
  }
LABEL_11:
  [(UIActivityIndicatorView *)self->_activityIndicatorView setAlpha:1.0];
  activityIndicatorView = self->_activityIndicatorView;

  [(UIActivityIndicatorView *)activityIndicatorView startAnimating];
}

- (void)setupOverlayControllerWithPDFDocument:(id)a3
{
  pdfView = self->_pdfView;
  id v5 = a3;
  [(PDFView *)pdfView setDocument:v5];
  unsigned __int8 v6 = [(PDFView *)self->_pdfView documentView];
  [v6 setUserInteractionEnabled:0];

  objc_super v7 = [(_SSSScreenshotAnnotationView *)self overlayController];
  [v5 setPDFAKControllerDelegate:v7];

  id v9 = [v5 akController];

  unsigned __int8 v8 = [(_SSSScreenshotAnnotationView *)self overlayController];
  [v8 setAnnotationKitController:v9];
}

- (void)enterCropMode
{
  [(_SSSScreenshotPDFView *)self setIsInCropMode:1];
  [(_SSSScreenshotPDFView *)self invalidateIntrinsicContentSize];
  int v3 = [(_SSSScreenshotPDFView *)self currentPDFView];
  id v8 = [v3 documentScrollView];

  [v8 contentOffset];
  self->_scrollOffset.double x = v4;
  self->_scrollOffset.double y = v5;
  [v8 zoomScale];
  self->_scrollZoomScale = v6;
  [v8 setZoomScale:1.0];
  [v8 setContentOffset:CGPointZero];
  objc_super v7 = [(_SSSScreenshotPDFView *)self currentPDFView];
  [v7 setDisplayBox:0];

  [(_SSSScreenshotPDFView *)self setNeedsLayout];
}

- (void)enterMarkupMode
{
  [(_SSSScreenshotPDFView *)self setIsInCropMode:0];
  [(_SSSScreenshotPDFView *)self invalidateIntrinsicContentSize];
  int v3 = [(_SSSScreenshotPDFView *)self currentPDFView];
  [v3 setDisplayBox:1];

  CGFloat v4 = [(_SSSScreenshotPDFView *)self currentPDFView];
  id v5 = [v4 documentScrollView];

  if (self->_scrollZoomScale != 0.0) {
    [v5 setZoomScale:];
  }
  [v5 setContentOffset:self->_scrollOffset.x, self->_scrollOffset.y];
  [(_SSSScreenshotPDFView *)self setNeedsLayout];
}

- (void)exitMarkupMode
{
  int v3 = [(_SSSScreenshotPDFView *)self currentPDFView];
  id v6 = [v3 documentScrollView];

  [v6 contentOffset];
  self->_scrollOffset.double x = v4;
  self->_scrollOffset.double y = v5;
  [(_SSSScreenshotPDFView *)self invalidateIntrinsicContentSize];
}

- (int64_t)currentPDFPage
{
  v2 = [(_SSSScreenshotPDFView *)self currentPDFView];
  int v3 = [v2 currentPage];
  CGFloat v4 = [v2 document];
  id v5 = [v4 indexForPage:v3];

  return (int64_t)v5;
}

- (void)updateViewState
{
  int v3 = [(_SSSScreenshotAnnotationView *)self screenshot];
  CGFloat v4 = [v3 pdfData];

  if (v4)
  {
    int64_t v5 = [(_SSSScreenshotPDFView *)self currentPDFPage];
    id v6 = [(_SSSScreenshotAnnotationView *)self overlayController];
    [v6 setViewState:1 v5];
  }
}

- (void)_paperKitPDFDidChangeInView:(id)a3 changeCounter:(unint64_t)a4
{
  id v4 = [(_SSSScreenshotAnnotationView *)self screenshot];
  [v4 undoStateMightHaveChanged];
}

- (void)_paperKitPDFView:(id)a3 startEditingOpacityInAccessoryView:(id)a4
{
  id v5 = a4;
  id v6 = [(_SSSScreenshotPDFView *)self delegate];
  [v6 pdfView:self startEditingOpacityInAccessoryView:v5];
}

- (id)_paperKitPDFViewOverlayViewController:(id)a3
{
  id v4 = [(_SSSScreenshotPDFView *)self delegate];
  id v5 = [v4 pdfViewOverlayViewController:self];

  return v5;
}

- (SSSScreenshotPDFViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SSSScreenshotPDFViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isInCropMode
{
  return self->_isInCropMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activityIndicatorView, 0);
  objc_storeStrong((id *)&self->_paperKitView, 0);

  objc_storeStrong((id *)&self->_pdfView, 0);
}

@end