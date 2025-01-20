@interface _SSSPDFThumbnailView
- (BOOL)isShowingThumbnailOptionView;
- (BOOL)shouldShowThumbnailOptionView;
- (BOOL)shouldUpdate;
- (BOOL)shouldUseMiniMapView;
- (CGRect)scrollViewVisibleRectInPDFView;
- (PDFThumbnailView)thumbnailView;
- (PDFView)pdfView;
- (_SSSPDFPageMiniMapView)miniMapView;
- (void)createMiniMapView;
- (void)createThumbnailView;
- (void)layoutSubviews;
- (void)setMiniMapView:(id)a3;
- (void)setPdfView:(id)a3;
- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3;
- (void)setShouldUpdate:(BOOL)a3;
- (void)setThumbnailView:(id)a3;
@end

@implementation _SSSPDFThumbnailView

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)_SSSPDFThumbnailView;
  [(_SSSPDFThumbnailView *)&v5 layoutSubviews];
  miniMapView = self->_miniMapView;
  [(_SSSPDFThumbnailView *)self bounds];
  -[_SSSPDFPageMiniMapView setFrame:](miniMapView, "setFrame:");
  thumbnailView = self->_thumbnailView;
  [(_SSSPDFThumbnailView *)self bounds];
  -[PDFThumbnailView setFrame:](thumbnailView, "setFrame:");
}

- (void)setPdfView:(id)a3
{
  p_pdfView = &self->_pdfView;
  v6 = (PDFView *)a3;
  if (*p_pdfView != v6 || ![(_SSSPDFThumbnailView *)self isShowingThumbnailOptionView])
  {
    objc_storeStrong((id *)&self->_pdfView, a3);
    [(_SSSPDFPageMiniMapView *)self->_miniMapView removeFromSuperview];
    [(PDFThumbnailView *)self->_thumbnailView removeFromSuperview];
    if (*p_pdfView && [(_SSSPDFThumbnailView *)self shouldShowThumbnailOptionView])
    {
      if ([(_SSSPDFThumbnailView *)self shouldUseMiniMapView]) {
        [(_SSSPDFThumbnailView *)self createMiniMapView];
      }
      else {
        [(_SSSPDFThumbnailView *)self createThumbnailView];
      }
    }
    [(_SSSPDFThumbnailView *)self setNeedsLayout];
  }
}

- (void)setScrollViewVisibleRectInPDFView:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  p_scrollViewVisibleRectInPDFView = &self->_scrollViewVisibleRectInPDFView;
  if (!CGRectEqualToRect(self->_scrollViewVisibleRectInPDFView, a3))
  {
    p_scrollViewVisibleRectInPDFView->origin.double x = x;
    p_scrollViewVisibleRectInPDFView->origin.double y = y;
    p_scrollViewVisibleRectInPDFView->size.double width = width;
    p_scrollViewVisibleRectInPDFView->size.double height = height;
    -[_SSSPDFPageMiniMapView setScrollViewVisibleRectInPDFView:](self->_miniMapView, "setScrollViewVisibleRectInPDFView:", x, y, width, height);
    [(_SSSPDFThumbnailView *)self setNeedsLayout];
  }
}

- (void)setShouldUpdate:(BOOL)a3
{
}

- (BOOL)shouldUpdate
{
  return [(_SSSPDFPageMiniMapView *)self->_miniMapView shouldUpdate];
}

- (BOOL)isShowingThumbnailOptionView
{
  return self->_thumbnailView || self->_miniMapView != 0;
}

- (BOOL)shouldShowThumbnailOptionView
{
  v2 = [(PDFView *)self->_pdfView document];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)shouldUseMiniMapView
{
  v2 = [(PDFView *)self->_pdfView document];
  BOOL v3 = [v2 pageCount] == (id)1;

  return v3;
}

- (void)createThumbnailView
{
  BOOL v3 = (PDFThumbnailView *)objc_alloc_init((Class)PDFThumbnailView);
  thumbnailView = self->_thumbnailView;
  self->_thumbnailView = v3;

  [(PDFThumbnailView *)self->_thumbnailView setPDFView:self->_pdfView];
  -[PDFThumbnailView setThumbnailSize:](self->_thumbnailView, "setThumbnailSize:", 45.0, 45.0);
  [(PDFThumbnailView *)self->_thumbnailView setLayoutMode:0];
  objc_super v5 = self->_thumbnailView;
  [(_SSSPDFThumbnailView *)self bounds];
  -[PDFThumbnailView setFrame:](v5, "setFrame:");
  v6 = self->_thumbnailView;
  v7 = +[UIColor clearColor];
  [(PDFThumbnailView *)v6 setBackgroundColor:v7];

  v8 = self->_thumbnailView;

  [(_SSSPDFThumbnailView *)self addSubview:v8];
}

- (void)createMiniMapView
{
  BOOL v3 = objc_alloc_init(_SSSPDFPageMiniMapView);
  miniMapView = self->_miniMapView;
  self->_miniMapView = v3;

  [(_SSSPDFPageMiniMapView *)self->_miniMapView setPdfView:self->_pdfView];
  [(_SSSPDFPageMiniMapView *)self->_miniMapView setPageIndex:0];
  -[_SSSPDFPageMiniMapView setScrollViewVisibleRectInPDFView:](self->_miniMapView, "setScrollViewVisibleRectInPDFView:", self->_scrollViewVisibleRectInPDFView.origin.x, self->_scrollViewVisibleRectInPDFView.origin.y, self->_scrollViewVisibleRectInPDFView.size.width, self->_scrollViewVisibleRectInPDFView.size.height);
  objc_super v5 = self->_miniMapView;

  [(_SSSPDFThumbnailView *)self addSubview:v5];
}

- (PDFView)pdfView
{
  return self->_pdfView;
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

- (_SSSPDFPageMiniMapView)miniMapView
{
  return self->_miniMapView;
}

- (void)setMiniMapView:(id)a3
{
}

- (PDFThumbnailView)thumbnailView
{
  return self->_thumbnailView;
}

- (void)setThumbnailView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_miniMapView, 0);

  objc_storeStrong((id *)&self->_pdfView, 0);
}

@end