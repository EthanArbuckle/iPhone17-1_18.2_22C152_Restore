@interface _SSSPDFPageMiniMapView
+ (CGAffineTransform)_transformToConvertToRect:(SEL)a3 fromRect:(CGRect)a4;
+ (double)adjustedTranslationForProposedRect:(CGFloat)a3 originalRect:(CGFloat)a4 scaledContentViewBounds:(double)a5;
- (BOOL)isDraggingVisibleRect;
- (BOOL)shouldUpdate;
- (CGRect)_lastSetScrollViewRectInContentViewSpace;
- (CGRect)convertRectFromPageViewSpace:(CGRect)a3 toView:(id)a4;
- (CGRect)convertRectToPageViewSpace:(CGRect)a3 fromView:(id)a4;
- (CGRect)scrollViewVisibleRectInPDFView;
- (CGRect)visibleRectInPageViewSpace;
- (CGSize)lastRequestedImageSize;
- (PDFView)pdfView;
- (UIImage)lastPageImage;
- (UIImageView)pageImageView;
- (UIPanGestureRecognizer)panGestureRecognizer;
- (UIView)scaledScrollViewVisibleRectView;
- (_SSSPDFPageMiniMapView)initWithFrame:(CGRect)a3;
- (_SSSPDFPageMiniMapVisibleRegionView)visibleRegionView;
- (_SSSScrollViewLayoutRects)inFlightScaledScrollViewLayoutRectsInSelf;
- (_SSSScrollViewLayoutRects)scaledScrollViewLayoutRectsInSelf;
- (id)pageImageForSize:(CGSize)a3;
- (id)pageView;
- (id)pdfPage;
- (int64_t)pageIndex;
- (void)_removePDFNotifications;
- (void)_setupPDFNotificationsIfPossible;
- (void)annotationsDidChange;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setInFlightScaledScrollViewLayoutRectsInSelf:(id)a3;
- (void)setLastPageImage:(id)a3;
- (void)setLastRequestedImageSize:(CGSize)a3;
- (void)setNeedsPageImageUpdate;
- (void)setPageImageView:(id)a3;
- (void)setPageIndex:(int64_t)a3;
- (void)setPanGestureRecognizer:(id)a3;
- (void)setPdfView:(id)a3;
- (void)setScaledScrollViewLayoutRectsInSelf:(id)a3;
- (void)setScaledScrollViewVisibleRectView:(id)a3;
- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3;
- (void)setShouldUpdate:(BOOL)a3;
- (void)setVisibleRegionView:(id)a3;
- (void)set_lastSetScrollViewRectInContentViewSpace:(CGRect)a3;
- (void)updatePDFViewFromVisibleRegionView;
- (void)updateVisibleRegionViewFromPDFView;
- (void)userDidPanSelectionRect:(id)a3;
- (void)visibleRegionRectDidChange;
@end

@implementation _SSSPDFPageMiniMapView

- (_SSSPDFPageMiniMapView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)_SSSPDFPageMiniMapView;
  v3 = -[_SSSPDFPageMiniMapView initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (UIImageView *)objc_alloc_init((Class)UIImageView);
  pageImageView = v3->_pageImageView;
  v3->_pageImageView = v4;

  [(UIImageView *)v3->_pageImageView setUserInteractionEnabled:0];
  [(_SSSPDFPageMiniMapView *)v3 addSubview:v3->_pageImageView];
  v6 = objc_alloc_init(_SSSPDFPageMiniMapVisibleRegionView);
  visibleRegionView = v3->_visibleRegionView;
  v3->_visibleRegionView = v6;

  [(_SSSPDFPageMiniMapVisibleRegionView *)v3->_visibleRegionView setUserInteractionEnabled:0];
  [(_SSSPDFPageMiniMapView *)v3 addSubview:v3->_visibleRegionView];
  v8 = (UIView *)objc_alloc_init((Class)UIView);
  scaledScrollViewVisibleRectView = v3->_scaledScrollViewVisibleRectView;
  v3->_scaledScrollViewVisibleRectView = v8;

  [(_SSSPDFPageMiniMapView *)v3 addSubview:v3->_scaledScrollViewVisibleRectView];
  v10 = (UIPanGestureRecognizer *)[objc_alloc((Class)UIPanGestureRecognizer) initWithTarget:v3 action:"userDidPanSelectionRect:"];
  panGestureRecognizer = v3->_panGestureRecognizer;
  v3->_panGestureRecognizer = v10;

  [(UIView *)v3->_scaledScrollViewVisibleRectView addGestureRecognizer:v3->_panGestureRecognizer];
  return v3;
}

- (void)dealloc
{
  id updatePageImageBlock = self->_updatePageImageBlock;
  if (updatePageImageBlock)
  {
    dispatch_block_cancel(updatePageImageBlock);
    id v4 = self->_updatePageImageBlock;
    self->_id updatePageImageBlock = 0;
  }
  [(_SSSPDFPageMiniMapView *)self _removePDFNotifications];
  v5.receiver = self;
  v5.super_class = (Class)_SSSPDFPageMiniMapView;
  [(_SSSPDFPageMiniMapView *)&v5 dealloc];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)_SSSPDFPageMiniMapView;
  [(_SSSPDFPageMiniMapView *)&v12 layoutSubviews];
  [(_SSSPDFPageMiniMapView *)self bounds];
  CGRect v14 = CGRectInset(v13, 10.0, 0.0);
  v3 = -[_SSSPDFPageMiniMapView pageImageForSize:](self, "pageImageForSize:", v14.size.width, v14.size.height);
  [v3 size];
  [v3 size];
  [(_SSSPDFPageMiniMapView *)self bounds];
  UIRectCenteredIntegralRectScale();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [(UIImageView *)self->_pageImageView setFrame:0];
  [(UIImageView *)self->_pageImageView setImage:v3];
  -[_SSSPDFPageMiniMapVisibleRegionView setFrame:](self->_visibleRegionView, "setFrame:", v5, v7, v9, v11);
  if ([(_SSSPDFPageMiniMapView *)self isDraggingVisibleRect]) {
    [(_SSSPDFPageMiniMapView *)self updatePDFViewFromVisibleRegionView];
  }
  else {
    [(_SSSPDFPageMiniMapView *)self updateVisibleRegionViewFromPDFView];
  }
}

- (void)setPdfView:(id)a3
{
  double v5 = (PDFView *)a3;
  p_pdfView = &self->_pdfView;
  if (self->_pdfView != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_pdfView, a3);
    [(_SSSPDFPageMiniMapView *)self _setupPDFNotificationsIfPossible];
    [(_SSSPDFPageMiniMapView *)self setNeedsPageImageUpdate];
    p_pdfView = (PDFView **)[(_SSSPDFPageMiniMapView *)self setNeedsLayout];
    double v5 = v7;
  }

  _objc_release_x1(p_pdfView, v5);
}

- (void)setShouldUpdate:(BOOL)a3
{
  if (self->_shouldUpdate != a3)
  {
    self->_shouldUpdate = a3;
    [(_SSSPDFPageMiniMapView *)self _setupPDFNotificationsIfPossible];
    [(_SSSPDFPageMiniMapView *)self setNeedsPageImageUpdate];
    [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
  }
}

- (void)_setupPDFNotificationsIfPossible
{
  [(_SSSPDFPageMiniMapView *)self _removePDFNotifications];
  if (self->_pdfView)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    double v4 = [(PDFView *)self->_pdfView documentScrollView];
    [v3 addObserver:self selector:"visibleRegionRectDidChange" name:@"PDFScrollViewPageMayHaveChangedNotification" object:v4];

    double v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"annotationsDidChange" name:PDFViewAnnotationsDidChangeNotification object:self->_pdfView];

    id v8 = +[NSNotificationCenter defaultCenter];
    uint64_t v6 = PDFPageChangedBoundsForBoxNotification;
    double v7 = [(_SSSPDFPageMiniMapView *)self pdfPage];
    [v8 addObserver:self selector:"setNeedsPageImageUpdate" name:v6 object:v7];
  }
}

- (void)_removePDFNotifications
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:@"PDFScrollViewPageMayHaveChangedNotification" object:0];

  double v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:PDFViewAnnotationsDidChangeNotification object:0];

  id v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:PDFPageChangedBoundsForBoxNotification object:0];
}

- (void)setPageIndex:(int64_t)a3
{
  if (self->_pageIndex != a3)
  {
    self->_pageIndex = a3;
    [(_SSSPDFPageMiniMapView *)self setNeedsPageImageUpdate];
    [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
  }
}

- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_scrollViewVisibleRectInPDFView = &self->_scrollViewVisibleRectInPDFView;
  if (!CGRectEqualToRect(self->_scrollViewVisibleRectInPDFView, a3))
  {
    p_scrollViewVisibleRectInPDFView->origin.CGFloat x = x;
    p_scrollViewVisibleRectInPDFView->origin.CGFloat y = y;
    p_scrollViewVisibleRectInPDFView->size.CGFloat width = width;
    p_scrollViewVisibleRectInPDFView->size.CGFloat height = height;
    [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
  }
}

- (void)setNeedsPageImageUpdate
{
  lastPageImage = self->_lastPageImage;
  self->_lastPageImage = 0;

  [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
}

- (id)pdfPage
{
  v3 = [(PDFView *)self->_pdfView document];
  double v4 = [v3 pageAtIndex:self->_pageIndex];

  return v4;
}

- (id)pageView
{
  pdfView = self->_pdfView;
  v3 = [(_SSSPDFPageMiniMapView *)self pdfPage];
  double v4 = [(PDFView *)pdfView viewForPage:v3];

  return v4;
}

- (id)pageImageForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = [(_SSSPDFPageMiniMapView *)self pdfPage];
  if (v6)
  {
    double v7 = CGSizeZero.height;

    if (width == CGSizeZero.width && height == v7)
    {
      uint64_t v6 = 0;
    }
    else
    {
      lastPageImage = self->_lastPageImage;
      if (!lastPageImage
        || (width == self->_lastRequestedImageSize.width
          ? (BOOL v10 = height == self->_lastRequestedImageSize.height)
          : (BOOL v10 = 0),
            !v10))
      {
        double v11 = +[UIScreen mainScreen];
        [v11 scale];
        CGFloat v13 = v12;

        CGAffineTransformMakeScale(&v22, v13, v13);
        double v14 = height * v22.c + v22.a * width;
        double v15 = height * v22.d + v22.b * width;
        v16 = [(_SSSPDFPageMiniMapView *)self pdfPage];
        v17 = [v16 thumbnailOfSize:1 forBox:v14, v15];

        id v18 = v17;
        +[UIImage imageWithCGImage:scale:orientation:](UIImage, "imageWithCGImage:scale:orientation:", [v18 CGImage], [v18 imageOrientation], v13);
        v19 = (UIImage *)objc_claimAutoreleasedReturnValue();
        v20 = self->_lastPageImage;
        self->_lastPageImage = v19;

        self->_lastRequestedImageSize.double width = width;
        self->_lastRequestedImageSize.double height = height;

        lastPageImage = self->_lastPageImage;
      }
      uint64_t v6 = lastPageImage;
    }
  }

  return v6;
}

- (void)visibleRegionRectDidChange
{
  if (![(_SSSPDFPageMiniMapView *)self isDraggingVisibleRect])
  {
    [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
  }
}

- (void)annotationsDidChange
{
  id updatePageImageBlock = self->_updatePageImageBlock;
  if (updatePageImageBlock)
  {
    dispatch_block_cancel(updatePageImageBlock);
    id v4 = self->_updatePageImageBlock;
    self->_id updatePageImageBlock = 0;
  }
  if (self->_lastPageImage)
  {
    objc_initWeak(&location, self);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10002A3AC;
    v8[3] = &unk_100099BD0;
    objc_copyWeak(&v9, &location);
    dispatch_block_t v5 = dispatch_block_create((dispatch_block_flags_t)0, v8);
    id v6 = self->_updatePageImageBlock;
    self->_id updatePageImageBlock = v5;

    dispatch_time_t v7 = dispatch_time(0, 500000000);
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, self->_updatePageImageBlock);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    [(_SSSPDFPageMiniMapView *)self setNeedsPageImageUpdate];
  }
}

- (void)updateVisibleRegionViewFromPDFView
{
  v3 = [(PDFView *)self->_pdfView documentScrollView];
  id v4 = [v3 delegate];
  dispatch_block_t v5 = [v4 viewForZoomingInScrollView:v3];

  double x = self->_scrollViewVisibleRectInPDFView.origin.x;
  double y = self->_scrollViewVisibleRectInPDFView.origin.y;
  double width = self->_scrollViewVisibleRectInPDFView.size.width;
  double height = self->_scrollViewVisibleRectInPDFView.size.height;
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  if (CGRectIsEmpty(v53))
  {
    [v3 bounds];
    [v3 convertRect:self->_pdfView];
    double x = v10;
    double y = v11;
    double width = v12;
    double height = v13;
  }
  long long v51 = 0u;
  long long v52 = 0u;
  long long v50 = 0u;
  double v14 = objc_opt_class();
  [(UIImageView *)self->_pageImageView bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  [v5 bounds];
  if (v14)
  {
    [v14 _transformToConvertToRect:v16 fromRect:v18 v20, v22, v23, v24, v25, v26];
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v50 = 0u;
  }
  -[PDFView convertRect:toView:](self->_pdfView, "convertRect:toView:", v3, x, y, width, height);
  v31 = -[_SSSScrollViewLayoutRects initWithScrollView:visibleRectInScrollView:]([_SSSScrollViewLayoutRects alloc], "initWithScrollView:visibleRectInScrollView:", v3, v27, v28, v29, v30);
  v32 = [(_SSSScrollViewLayoutRects *)v31 layoutRectsByConvertingFromView:v3 toView:v5];
  v49[0] = v50;
  v49[1] = v51;
  v49[2] = v52;
  v33 = [v32 layoutRectsByApplyingTransform:v49];
  v34 = [v33 layoutRectsByConvertingFromView:self->_pageImageView toView:self];
  scaledScrollViewLayoutRectsInSelf = self->_scaledScrollViewLayoutRectsInSelf;
  self->_scaledScrollViewLayoutRectsInSelf = v34;

  [(_SSSScrollViewLayoutRects *)self->_scaledScrollViewLayoutRectsInSelf visibleRect];
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  CGFloat v41 = v40;
  CGFloat v43 = v42;
  [(_SSSPDFPageMiniMapVisibleRegionView *)self->_visibleRegionView frame];
  v56.origin.double x = v44;
  v56.origin.double y = v45;
  v56.size.double width = v46;
  v56.size.double height = v47;
  v54.origin.double x = v37;
  v54.origin.double y = v39;
  v54.size.double width = v41;
  v54.size.double height = v43;
  CGRect v55 = CGRectIntersection(v54, v56);
  -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView, v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  -[_SSSPDFPageMiniMapVisibleRegionView setVisibleRect:](self->_visibleRegionView, "setVisibleRect:");
  scaledScrollViewVisibleRectView = self->_scaledScrollViewVisibleRectView;
  [(_SSSScrollViewLayoutRects *)self->_scaledScrollViewLayoutRectsInSelf visibleRect];
  -[UIView setFrame:](scaledScrollViewVisibleRectView, "setFrame:");
}

- (void)updatePDFViewFromVisibleRegionView
{
  +[UIAnimator disableAnimation];
  id v23 = [(PDFView *)self->_pdfView documentScrollView];
  v3 = [v23 delegate];
  id v4 = [v3 viewForZoomingInScrollView:v23];

  [(_SSSScrollViewLayoutRects *)self->_inFlightScaledScrollViewLayoutRectsInSelf scrollViewRect];
  -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView);
  -[_SSSPDFPageMiniMapView convertRectToPageViewSpace:fromView:](self, "convertRectToPageViewSpace:fromView:", self->_visibleRegionView);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(_SSSPDFPageMiniMapView *)self pageView];
  [v4 convertRect:v13 fromView:v6, v8, v10, v12];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  [v23 zoomScale];
  [v23 setZoomScale:v22 + 0.00000011920929];
  [v23 zoomToRect:0, v15, v17, v19, v21];
  +[UIAnimator enableAnimation];
}

- (BOOL)isDraggingVisibleRect
{
  return (uint64_t)[(UIPanGestureRecognizer *)self->_panGestureRecognizer state] >= 1
      && (uint64_t)[(UIPanGestureRecognizer *)self->_panGestureRecognizer state] < 3;
}

+ (double)adjustedTranslationForProposedRect:(CGFloat)a3 originalRect:(CGFloat)a4 scaledContentViewBounds:(double)a5
{
  double Width = CGRectGetWidth(*(CGRect *)&a1);
  v30.origin.double x = a9;
  v30.origin.double y = a10;
  v30.size.double width = a11;
  v30.size.double height = a12;
  double v21 = a5;
  if (Width < CGRectGetWidth(v30))
  {
    v31.origin.double x = a1;
    v31.origin.double y = a2;
    v31.size.double width = a3;
    v31.size.double height = a4;
    double MinX = CGRectGetMinX(v31);
    v32.origin.double x = a9;
    v32.origin.double y = a10;
    v32.size.double width = a11;
    v32.size.double height = a12;
    double v23 = CGRectGetMinX(v32);
    if (MinX < v23) {
      double MinX = v23;
    }
    v33.origin.double x = a9;
    v33.origin.double y = a10;
    v33.size.double width = a11;
    v33.size.double height = a12;
    double MaxX = CGRectGetMaxX(v33);
    v34.origin.double x = a1;
    v34.origin.double y = a2;
    v34.size.double width = a3;
    v34.size.double height = a4;
    double v25 = MaxX - CGRectGetWidth(v34);
    if (MinX >= v25) {
      double v21 = v25;
    }
    else {
      double v21 = MinX;
    }
  }
  v35.origin.double x = a1;
  v35.origin.double y = a2;
  v35.size.double width = a3;
  v35.size.double height = a4;
  double Height = CGRectGetHeight(v35);
  v36.origin.double x = a9;
  v36.origin.double y = a10;
  v36.size.double width = a11;
  v36.size.double height = a12;
  if (Height < CGRectGetHeight(v36))
  {
    v37.origin.double x = a1;
    v37.origin.double y = a2;
    v37.size.double width = a3;
    v37.size.double height = a4;
    CGRectGetMinY(v37);
    v38.origin.double x = a9;
    v38.origin.double y = a10;
    v38.size.double width = a11;
    v38.size.double height = a12;
    CGRectGetMinY(v38);
    v39.origin.double x = a9;
    v39.origin.double y = a10;
    v39.size.double width = a11;
    v39.size.double height = a12;
    CGRectGetMaxY(v39);
    v40.origin.double x = a1;
    v40.origin.double y = a2;
    v40.size.double width = a3;
    v40.size.double height = a4;
    CGRectGetHeight(v40);
  }
  return v21 - a5;
}

- (void)userDidPanSelectionRect:(id)a3
{
  id v4 = a3;
  id v5 = [v4 state];
  if (v5 == (id)3)
  {
    objc_storeStrong((id *)&self->_scaledScrollViewLayoutRectsInSelf, self->_inFlightScaledScrollViewLayoutRectsInSelf);
  }
  else if (v5 == (id)2)
  {
    [v4 translationInView:self];
    scaledScrollViewLayoutRectsInSelf = self->_scaledScrollViewLayoutRectsInSelf;
    CGAffineTransformMakeTranslation(&v50, v7, v8);
    double v9 = [(_SSSScrollViewLayoutRects *)scaledScrollViewLayoutRectsInSelf layoutRectsByApplyingTransform:&v50];
    double v10 = objc_opt_class();
    [v9 contentInsetRect];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(_SSSScrollViewLayoutRects *)self->_scaledScrollViewLayoutRectsInSelf contentInsetRect];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    [(_SSSPDFPageMiniMapVisibleRegionView *)self->_visibleRegionView frame];
    [v10 adjustedTranslationForProposedRect:v12 originalRect:v14 scaledContentViewBounds:v16 v18 v20 v22 v24 v26 v27 v28 v29 v30];
    CGRect v31 = self->_scaledScrollViewLayoutRectsInSelf;
    CGAffineTransformMakeTranslation(&v49, v32, v33);
    CGRect v34 = [(_SSSScrollViewLayoutRects *)v31 layoutRectsByApplyingTransform:&v49];
    inFlightScaledScrollViewLayoutRectsInSelf = self->_inFlightScaledScrollViewLayoutRectsInSelf;
    self->_inFlightScaledScrollViewLayoutRectsInSelf = v34;

    [(_SSSScrollViewLayoutRects *)self->_inFlightScaledScrollViewLayoutRectsInSelf visibleRect];
    CGFloat v37 = v36;
    CGFloat v39 = v38;
    CGFloat v41 = v40;
    CGFloat v43 = v42;
    [(_SSSPDFPageMiniMapVisibleRegionView *)self->_visibleRegionView frame];
    v53.origin.double x = v44;
    v53.origin.double y = v45;
    v53.size.double width = v46;
    v53.size.double height = v47;
    v51.origin.double x = v37;
    v51.origin.double y = v39;
    v51.size.double width = v41;
    v51.size.double height = v43;
    CGRect v52 = CGRectIntersection(v51, v53);
    -[_SSSPDFPageMiniMapView convertRect:toView:](self, "convertRect:toView:", self->_visibleRegionView, v52.origin.x, v52.origin.y, v52.size.width, v52.size.height);
    -[_SSSPDFPageMiniMapVisibleRegionView setVisibleRect:](self->_visibleRegionView, "setVisibleRect:");
    scaledScrollViewVisibleRectView = self->_scaledScrollViewVisibleRectView;
    [(_SSSScrollViewLayoutRects *)self->_inFlightScaledScrollViewLayoutRectsInSelf visibleRect];
    -[UIView setFrame:](scaledScrollViewVisibleRectView, "setFrame:");
    [(_SSSPDFPageMiniMapView *)self setNeedsLayout];
  }
}

- (CGRect)visibleRectInPageViewSpace
{
  v3 = [(_SSSPDFPageMiniMapView *)self pageView];

  if (v3)
  {
    id v4 = [(_SSSPDFPageMiniMapView *)self pageView];
    [(PDFView *)self->_pdfView bounds];
    [v4 convertRect:self->_pdfView fromView:];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    double v13 = [(_SSSPDFPageMiniMapView *)self pageView];
    [v13 bounds];
    v25.origin.CGFloat x = v6;
    v25.origin.CGFloat y = v8;
    v25.size.CGFloat width = v10;
    v25.size.CGFloat height = v12;
    CGRect v23 = CGRectIntersection(v22, v25);
    CGFloat x = v23.origin.x;
    CGFloat y = v23.origin.y;
    CGFloat width = v23.size.width;
    CGFloat height = v23.size.height;
  }
  else
  {
    CGFloat x = CGRectZero.origin.x;
    CGFloat y = CGRectZero.origin.y;
    CGFloat width = CGRectZero.size.width;
    CGFloat height = CGRectZero.size.height;
  }
  double v18 = x;
  double v19 = y;
  double v20 = width;
  double v21 = height;
  result.size.CGFloat height = v21;
  result.size.CGFloat width = v20;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v18;
  return result;
}

- (CGRect)convertRectFromPageViewSpace:(CGRect)a3 toView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  CGFloat v10 = [(_SSSPDFPageMiniMapView *)self pageView];

  if (v9 && v10)
  {
    memset(&v34, 0, sizeof(v34));
    double v11 = objc_opt_class();
    [v9 bounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v20 = [(_SSSPDFPageMiniMapView *)self pageView];
    [v20 bounds];
    if (v11) {
      [v11 _transformToConvertToRect:v13 fromRect:v15 v17, v19, v21, v22, v23, v24];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }

    CGAffineTransform v33 = v34;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
    CGFloat v25 = v36.origin.x;
    CGFloat v26 = v36.origin.y;
    CGFloat v27 = v36.size.width;
    CGFloat v28 = v36.size.height;
  }
  else
  {
    CGFloat v25 = CGRectZero.origin.x;
    CGFloat v26 = CGRectZero.origin.y;
    CGFloat v27 = CGRectZero.size.width;
    CGFloat v28 = CGRectZero.size.height;
  }

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (CGRect)convertRectToPageViewSpace:(CGRect)a3 fromView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  CGFloat v10 = [(_SSSPDFPageMiniMapView *)self pageView];

  if (v9 && v10)
  {
    memset(&v34, 0, sizeof(v34));
    double v11 = objc_opt_class();
    double v12 = [(_SSSPDFPageMiniMapView *)self pageView];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v9 bounds];
    if (v11) {
      [v11 _transformToConvertToRect:v14 fromRect:v16, v18, v20, v21, v22, v23, v24];
    }
    else {
      memset(&v34, 0, sizeof(v34));
    }

    CGAffineTransform v33 = v34;
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGRect v36 = CGRectApplyAffineTransform(v35, &v33);
    CGFloat v25 = v36.origin.x;
    CGFloat v26 = v36.origin.y;
    CGFloat v27 = v36.size.width;
    CGFloat v28 = v36.size.height;
  }
  else
  {
    CGFloat v25 = CGRectZero.origin.x;
    CGFloat v26 = CGRectZero.origin.y;
    CGFloat v27 = CGRectZero.size.width;
    CGFloat v28 = CGRectZero.size.height;
  }

  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

+ (CGAffineTransform)_transformToConvertToRect:(SEL)a3 fromRect:(CGRect)a4
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  CGFloat v9 = a4.size.height;
  CGFloat v10 = a4.size.width;
  CGFloat v11 = a4.origin.y;
  CGFloat v12 = a4.origin.x;
  CGRect result = (CGAffineTransform *)CGRectIsEmpty(a4);
  if (result) {
    goto LABEL_5;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGRect result = (CGAffineTransform *)CGRectIsEmpty(v26);
  if (result) {
    goto LABEL_5;
  }
  v27.origin.CGFloat x = v12;
  v27.origin.CGFloat y = v11;
  v27.size.CGFloat width = v10;
  v27.size.CGFloat height = v9;
  CGRect result = (CGAffineTransform *)CGRectIsInfinite(v27);
  if ((result & 1) != 0
    || (v28.origin.CGFloat x = x,
        v28.origin.CGFloat y = y,
        v28.size.CGFloat width = width,
        v28.size.CGFloat height = height,
        CGRect result = (CGAffineTransform *)CGRectIsInfinite(v28),
        result))
  {
LABEL_5:
    long long v15 = *(_OWORD *)&CGAffineTransformIdentity.c;
    *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  }
  else
  {
    v29.origin.CGFloat x = v12;
    v29.origin.CGFloat y = v11;
    v29.size.CGFloat width = v10;
    v29.size.CGFloat height = v9;
    double v24 = CGRectGetWidth(v29);
    v30.origin.CGFloat x = x;
    v30.origin.CGFloat y = y;
    v30.size.CGFloat width = width;
    v30.size.CGFloat height = height;
    CGFloat v25 = v24 / CGRectGetWidth(v30);
    v31.origin.CGFloat x = v12;
    v31.origin.CGFloat y = v11;
    v31.size.CGFloat width = v10;
    v31.size.CGFloat height = v9;
    double v22 = CGRectGetHeight(v31);
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    v32.size.CGFloat height = height;
    CGFloat v23 = v22 / CGRectGetHeight(v32);
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v11;
    v33.size.CGFloat width = v10;
    v33.size.CGFloat height = v9;
    double v20 = CGRectGetWidth(v33);
    v34.origin.CGFloat x = x;
    v34.origin.CGFloat y = y;
    v34.size.CGFloat width = width;
    v34.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v34);
    v35.origin.CGFloat x = x;
    v35.origin.CGFloat y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    CGFloat v21 = CGRectGetMinX(v35) + v20 * MinX;
    v36.origin.CGFloat x = v12;
    v36.origin.CGFloat y = v11;
    v36.size.CGFloat width = v10;
    v36.size.CGFloat height = v9;
    double v16 = CGRectGetHeight(v36);
    v37.origin.CGFloat x = x;
    v37.origin.CGFloat y = y;
    v37.size.CGFloat width = width;
    v37.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v37);
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    CGFloat v18 = CGRectGetMinY(v38);
    retstr->a = v25;
    retstr->b = 0.0;
    retstr->c = 0.0;
    retstr->d = v23;
    retstr->tCGFloat x = v21;
    retstr->tCGFloat y = v18 + v16 * MinY;
  }
  return result;
}

- (PDFView)pdfView
{
  return self->_pdfView;
}

- (int64_t)pageIndex
{
  return self->_pageIndex;
}

- (CGRect)scrollViewVisibleRectInPDFView
{
  double x = self->_scrollViewVisibleRectInPDFView.origin.x;
  double y = self->_scrollViewVisibleRectInPDFView.origin.y;
  double width = self->_scrollViewVisibleRectInPDFView.size.width;
  double height = self->_scrollViewVisibleRectInPDFView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)shouldUpdate
{
  return self->_shouldUpdate;
}

- (_SSSPDFPageMiniMapVisibleRegionView)visibleRegionView
{
  return self->_visibleRegionView;
}

- (void)setVisibleRegionView:(id)a3
{
}

- (UIImageView)pageImageView
{
  return self->_pageImageView;
}

- (void)setPageImageView:(id)a3
{
}

- (CGSize)lastRequestedImageSize
{
  double width = self->_lastRequestedImageSize.width;
  double height = self->_lastRequestedImageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setLastRequestedImageSize:(CGSize)a3
{
  self->_lastRequestedImageSize = a3;
}

- (UIImage)lastPageImage
{
  return self->_lastPageImage;
}

- (void)setLastPageImage:(id)a3
{
}

- (UIPanGestureRecognizer)panGestureRecognizer
{
  return self->_panGestureRecognizer;
}

- (void)setPanGestureRecognizer:(id)a3
{
}

- (_SSSScrollViewLayoutRects)scaledScrollViewLayoutRectsInSelf
{
  return self->_scaledScrollViewLayoutRectsInSelf;
}

- (void)setScaledScrollViewLayoutRectsInSelf:(id)a3
{
}

- (_SSSScrollViewLayoutRects)inFlightScaledScrollViewLayoutRectsInSelf
{
  return self->_inFlightScaledScrollViewLayoutRectsInSelf;
}

- (void)setInFlightScaledScrollViewLayoutRectsInSelf:(id)a3
{
}

- (UIView)scaledScrollViewVisibleRectView
{
  return self->_scaledScrollViewVisibleRectView;
}

- (void)setScaledScrollViewVisibleRectView:(id)a3
{
}

- (CGRect)_lastSetScrollViewRectInContentViewSpace
{
  double x = self->__lastSetScrollViewRectInContentViewSpace.origin.x;
  double y = self->__lastSetScrollViewRectInContentViewSpace.origin.y;
  double width = self->__lastSetScrollViewRectInContentViewSpace.size.width;
  double height = self->__lastSetScrollViewRectInContentViewSpace.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)set_lastSetScrollViewRectInContentViewSpace:(CGRect)a3
{
  self->__lastSetScrollViewRectInContentViewSpace = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scaledScrollViewVisibleRectView, 0);
  objc_storeStrong((id *)&self->_inFlightScaledScrollViewLayoutRectsInSelf, 0);
  objc_storeStrong((id *)&self->_scaledScrollViewLayoutRectsInSelf, 0);
  objc_storeStrong((id *)&self->_panGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_lastPageImage, 0);
  objc_storeStrong((id *)&self->_pageImageView, 0);
  objc_storeStrong((id *)&self->_visibleRegionView, 0);
  objc_storeStrong((id *)&self->_pdfView, 0);

  objc_storeStrong(&self->_updatePageImageBlock, 0);
}

@end