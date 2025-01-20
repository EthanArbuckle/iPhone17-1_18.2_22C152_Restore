@interface PDFScrollView
- (PDFScrollView)initWithFrame:(CGRect)a3;
- (id)pdfDocumentView;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)centerAlign;
- (void)dealloc;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setBounds:(CGRect)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDocument:(id)a3;
- (void)setForcesTopAlignment:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setPDFView:(id)a3;
- (void)updateLayout;
@end

@implementation PDFScrollView

- (PDFScrollView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PDFScrollView;
  v3 = -[PDFScrollView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(PDFScrollViewPrivate);
    v5 = v3->_private;
    v3->_private = v4;

    v3->_private->forcesTopAlignment = 0;
  }
  return v3;
}

- (void)setPDFView:(id)a3
{
}

- (void)setDocument:(id)a3
{
  id v17 = a3;
  objc_storeWeak((id *)&self->_private->document, v17);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    [WeakRetained setDocument:0];
    [v5 removeFromSuperview];

    objc_storeWeak((id *)&self->_private->documentView, 0);
  }
  v6 = v17;
  if (v17)
  {
    objc_super v7 = [PDFDocumentView alloc];
    id v8 = objc_loadWeakRetained((id *)&self->_private->pdfView);
    v9 = [(PDFDocumentView *)v7 initWithPDFView:v8];

    objc_storeWeak((id *)&self->_private->documentView, v9);
    self->_private->oldMagnification = 1.0;
    v10 = [[PDFTimer alloc] initWithThrottleDelay:sel_updateVisibility forSelector:v9 forTarget:0.25];
    v11 = self->_private;
    boundsUpdateTimer = v11->boundsUpdateTimer;
    v11->boundsUpdateTimer = v10;

    [(PDFTimer *)self->_private->boundsUpdateTimer update];
    [(PDFScrollView *)self addSubview:v9];
    [(PDFDocumentView *)v9 setDocument:v17];
    [(PDFDocumentView *)v9 layoutDocumentView];
    [(PDFDocumentView *)v9 documentViewSize];
    -[PDFDocumentView setFrame:](v9, "setFrame:", 0.0, 0.0, v13, v14);
    [(PDFDocumentView *)v9 frame];
    -[PDFScrollView setContentSize:](self, "setContentSize:", v15, v16);
    [(PDFScrollView *)self setDirectionalLockEnabled:1];
    [(PDFScrollView *)self setMinimumZoomScale:0.25];
    [(PDFScrollView *)self setMaximumZoomScale:5.0];
    [(PDFScrollView *)self setDelegate:self];
    -[PDFScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
    [(PDFScrollView *)self centerAlign];

    v6 = v17;
  }
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PDFScrollView;
  [(PDFScrollView *)&v4 dealloc];
}

- (id)pdfDocumentView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);

  return WeakRetained;
}

- (void)updateLayout
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  [WeakRetained layoutDocumentView];
  [WeakRetained documentViewSize];
  double v4 = v3;
  double v6 = v5;
  objc_msgSend(WeakRetained, "setBounds:", 0.0, 0.0, v3, v5);
  objc_msgSend(WeakRetained, "setFrame:", 0.0, 0.0, v4, v6);
  [WeakRetained frame];
  -[PDFScrollView setContentSize:](self, "setContentSize:", v7, v8);
  -[PDFScrollView setContentOffset:](self, "setContentOffset:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [(PDFScrollView *)self centerAlign];
}

- (void)setForcesTopAlignment:(BOOL)a3
{
  self->_private->forcesTopAlignment = a3;
}

- (void)setFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFScrollView;
  -[PDFScrollView setFrame:](&v6, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = self->_private;
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
    [WeakRetained updateVisibility];

    [(PDFScrollView *)self centerAlign];
  }
}

- (void)setBounds:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PDFScrollView;
  -[PDFScrollView setBounds:](&v6, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = self->_private;
  if (v4)
  {
    if (!v4->isZooming)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
      [WeakRetained updateVisibility];
    }
    [(PDFScrollView *)self centerAlign];
  }
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(PDFScrollView *)self contentInset];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(PDFScrollView *)self contentOffset];
  double v30 = v17;
  double v31 = v16;
  v32.receiver = self;
  v32.super_class = (Class)PDFScrollView;
  -[PDFScrollView setContentInset:](&v32, sel_setContentInset_, top, left, bottom, right);
  if ([(PDFScrollView *)self contentInsetAdjustmentBehavior] == 2
    && !PDFEdgeInsetsEqualToInsets(top, left, bottom, right, v9, v11, v13, v15))
  {
    if (v9 <= top) {
      double v18 = top;
    }
    else {
      double v18 = v9;
    }
    double v19 = -1.0 - v18;
    [(PDFScrollView *)self contentSize];
    double v21 = v20;
    [(PDFScrollView *)self bounds];
    double v23 = v13 + v21 - v22;
    double v24 = bottom + v21 - v22;
    if (v23 >= v24) {
      double v25 = bottom + v21 - v22;
    }
    else {
      double v25 = v13 + v21 - v22;
    }
    if (v23 < v24) {
      double v23 = bottom + v21 - v22;
    }
    if (v30 < v19) {
      goto LABEL_15;
    }
    double v26 = -v9;
    double v27 = -top;
    if (v9 > top) {
      double v26 = -top;
    }
    if (v30 > v26 + 1.0)
    {
LABEL_15:
      double v28 = v25 + -1.0;
      if (v30 > v23 + 1.0 || v30 < v28) {
        double v27 = v30;
      }
      else {
        double v27 = v24;
      }
    }
    if (!PDFPointEqualToPoint(v31, v27, v31, v30)) {
      -[PDFScrollView setContentOffset:](self, "setContentOffset:", v31, v27);
    }
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);

  return WeakRetained;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v4 postNotificationName:@"PDFScrollViewWillBeginDraggingNotification" object:self];
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = self->_private;
  if (!v4->isZooming)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&v4->documentView);
    [WeakRetained updateVisibility];
  }
  objc_super v6 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v6 postNotificationName:@"PDFScrollViewPageMayHaveChangedNotification" object:self];

  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 postNotificationName:@"PDFTextSelectionMenuWillChangeScrollPosition" object:self];

  [(PDFScrollView *)self centerAlign];
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v6 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:self];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  uint64_t v4 = objc_msgSend(MEMORY[0x263F08A00], "defaultCenter", a3);
  [v4 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:self];

  double v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 postNotificationName:@"PDFScrollViewPageMayHaveChangedNotification" object:self];

  [(PDFScrollView *)self centerAlign];
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  self->_private->isZooming = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  [WeakRetained updateVisibility];

  [(PDFScrollView *)self centerAlign];
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  self->_private->isZooming = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
  [WeakRetained updateVisibility];

  [(PDFScrollView *)self centerAlign];
  double v7 = [MEMORY[0x263F08A00] defaultCenter];
  id v8 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [v7 postNotificationName:@"PDFViewScaleChanged" object:v8];

  double v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 postNotificationName:@"PDFScrollViewPageMayHaveChangedNotification" object:self];

  id v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 postNotificationName:@"PDFTextSelectionMenuDidChangeScrollPosition" object:self];
}

- (void)scrollViewDidZoom:(id)a3
{
  id v12 = a3;
  uint64_t v4 = self->_private;
  if (!v4->scheduledPageSync)
  {
    v4->scheduledPageSync = 1;
    uint64_t v5 = [MEMORY[0x263EFF910] date];
    id v6 = self->_private;
    pageSyncDate = v6->pageSyncDate;
    v6->pageSyncDate = (NSDate *)v5;

    uint64_t v4 = self->_private;
  }
  [(NSDate *)v4->pageSyncDate timeIntervalSinceNow];
  if (fabs(v8) > 0.25)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_private->documentView);
    [WeakRetained updateVisibility];

    self->_private->scheduledPageSync = 0;
  }
  [(PDFScrollView *)self centerAlign];
  id v10 = objc_loadWeakRetained((id *)&self->_private->pdfView);
  [v10 setAutoScales:0];

  double v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 postNotificationName:@"PDFTextSelectionMenuWillChangeZoomFactor" object:0];
}

- (void)centerAlign
{
  [(PDFScrollView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(PDFScrollView *)self contentSize];
  double v12 = v11;
  double v14 = v13;
  if (v11 <= v8)
  {
    if ([(PDFScrollView *)self isDragging])
    {
      double MidX = v12 * 0.5 + fmax((v8 - v12) * 0.5, 0.0);
    }
    else
    {
      v22.origin.x = v4;
      v22.origin.y = v6;
      v22.size.width = v8;
      v22.size.height = v10;
      double MidX = CGRectGetMidX(v22);
    }
  }
  else
  {
    double MidX = v11 * 0.5;
  }
  double v16 = self->_private;
  if (v16->forcesTopAlignment
    && (id WeakRetained = objc_loadWeakRetained((id *)&v16->document),
        uint64_t v18 = [WeakRetained pageCount],
        WeakRetained,
        v18)
    || v14 > v10)
  {
    double MidY = v14 * 0.5;
  }
  else
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    double MidY = CGRectGetMidY(v23);
  }
  id v20 = objc_loadWeakRetained((id *)&self->_private->documentView);
  objc_msgSend(v20, "setCenter:", MidX, MidY);
}

- (void).cxx_destruct
{
}

@end