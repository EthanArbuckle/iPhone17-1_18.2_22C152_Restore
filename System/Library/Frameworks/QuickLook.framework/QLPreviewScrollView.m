@interface QLPreviewScrollView
- (BOOL)needsZoomUpdate;
- (BOOL)preventZoomUpdate;
- (BOOL)shouldFit;
- (CGRect)zoomRectForScale:(double)a3 withCenter:(CGPoint)a4;
- (CGSize)contentViewSize;
- (QLPreviewScrollView)init;
- (QLPreviewScrollViewZoomDelegate)zoomDelegate;
- (UIEdgeInsets)peripheryInsetsLandscape;
- (UIEdgeInsets)peripheryInsetsPortrait;
- (double)_maxZoomScaleForContentSize:(CGSize)a3;
- (double)contentIsSmallerThanView;
- (double)fillZoomScale;
- (double)fitZoomScale;
- (double)maxZoomScale;
- (double)minZoomScale;
- (double)pinchMaxZoomScale;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)_updateScrollViewZooming;
- (void)layoutSubviews;
- (void)resetZoomScale;
- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4;
- (void)setContentViewSize:(CGSize)a3;
- (void)setNeedsZoomUpdate:(BOOL)a3;
- (void)setPeripheryInsetsLandscape:(UIEdgeInsets)a3;
- (void)setPeripheryInsetsPortrait:(UIEdgeInsets)a3;
- (void)setPreventZoomUpdate:(BOOL)a3;
- (void)setShouldFit:(BOOL)a3;
- (void)setZoomDelegate:(id)a3;
- (void)updateZoomScales;
- (void)updateZoomScalesWithSize:(CGSize)a3;
@end

@implementation QLPreviewScrollView

- (QLPreviewScrollView)init
{
  v7.receiver = self;
  v7.super_class = (Class)QLPreviewScrollView;
  v2 = -[QLPreviewScrollView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v3 = v2;
  if (v2)
  {
    [(QLPreviewScrollView *)v2 setDelegate:v2];
    v4 = [MEMORY[0x263F825C8] clearColor];
    [(QLPreviewScrollView *)v3 setBackgroundColor:v4];

    [(QLPreviewScrollView *)v3 setBouncesZoom:1];
    [(QLPreviewScrollView *)v3 setShowsVerticalScrollIndicator:0];
    [(QLPreviewScrollView *)v3 setShowsHorizontalScrollIndicator:0];
    [(QLPreviewScrollView *)v3 setPreservesCenterDuringRotation:1];
    [(QLPreviewScrollView *)v3 setDecelerationRate:*MEMORY[0x263F83970]];
    [(QLPreviewScrollView *)v3 setAlwaysBounceVertical:1];
    v3->_lastUpdatedSize = (CGSize)*MEMORY[0x263F001B0];
    v3->_preventZoomUpdate = 0;
    v5 = v3;
  }

  return v3;
}

- (void)setContentViewSize:(CGSize)a3
{
  if (self->_contentViewSize.width != a3.width || self->_contentViewSize.height != a3.height)
  {
    self->_contentViewSize = a3;
    -[QLPreviewScrollView setContentSize:](self, "setContentSize:");
    [(QLPreviewScrollView *)self _updateScrollViewZooming];
  }
}

- (void)setNeedsZoomUpdate:(BOOL)a3
{
  self->_needsZoomUpdate = a3;
  if (a3) {
    [(QLPreviewScrollView *)self _updateScrollViewZooming];
  }
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)QLPreviewScrollView;
  [(QLPreviewScrollView *)&v8 layoutSubviews];
  if (![(QLPreviewScrollView *)self preventZoomUpdate])
  {
    [(QLPreviewScrollView *)self extent];
    double width = self->_lastUpdatedSize.width;
    double height = self->_lastUpdatedSize.height;
    BOOL v7 = width == v6 && height == v3;
    if (!v7 || [(QLPreviewScrollView *)self needsZoomUpdate]) {
      [(QLPreviewScrollView *)self _updateScrollViewZooming];
    }
  }
}

- (void)_updateScrollViewZooming
{
  [(QLPreviewScrollView *)self extent];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  if (*MEMORY[0x263F001B0] != v5 || v4 != v3)
  {
    [(QLPreviewScrollView *)self updateZoomScales];
    [(QLPreviewScrollView *)self resetZoomScale];
    [(QLPreviewScrollView *)self setNeedsZoomUpdate:0];
  }
}

- (double)_maxZoomScaleForContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = 3.0;
  if (_UIAccessibilityZoomTouchEnabled())
  {
    double v6 = height * 0.0165999997;
    if (width * 0.0165999997 >= height * 0.0165999997) {
      double v6 = width * 0.0165999997;
    }
    if (v6 >= 3.0) {
      return v6;
    }
    else {
      return 3.0;
    }
  }
  return v5;
}

- (void)updateZoomScales
{
  [(QLPreviewScrollView *)self extent];

  -[QLPreviewScrollView updateZoomScalesWithSize:](self, "updateZoomScalesWithSize:", v3, v4);
}

- (void)updateZoomScalesWithSize:(CGSize)a3
{
  if (self->_preventZoomUpdate) {
    return;
  }
  double height = a3.height;
  double width = a3.width;
  self->_lastUpdatedSize = a3;
  double v6 = [(QLPreviewScrollView *)self zoomDelegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v7 = [(QLPreviewScrollView *)self zoomDelegate];
    int v8 = [v7 previewScrollViewShouldResizeContentBasedOnPeripheryInsets:self];

    if (v8)
    {
      v9 = [(QLPreviewScrollView *)self window];
      if ([v9 _windowInterfaceOrientation] == 1)
      {
      }
      else
      {
        v10 = [(QLPreviewScrollView *)self window];
        uint64_t v11 = [v10 _windowInterfaceOrientation];

        if (v11 != 2)
        {
          double width = width - self->_peripheryInsetsLandscape.left - self->_peripheryInsetsLandscape.right;
          goto LABEL_10;
        }
      }
      double height = height - self->_peripheryInsetsPortrait.bottom - self->_peripheryInsetsPortrait.top;
    }
  }
  else
  {
  }
LABEL_10:
  [(QLPreviewScrollView *)self contentViewSize];
  -[QLPreviewScrollView _maxZoomScaleForContentSize:](self, "_maxZoomScaleForContentSize:");
  double v13 = v12;
  self->_contentIsSmallerThanView = 0.0;
  [(QLPreviewScrollView *)self contentViewSize];
  if (v14 == 0.0
    || ([(QLPreviewScrollView *)self contentViewSize], v21 == 0.0)
    || width == 0.0
    || height == 0.0)
  {
    self->_double pinchMaxZoomScale = 1.0;
    self->_maxZoomScale = 1.0;
    self->_minZoomScale = 1.0;
    self->_fillZoomScale = 1.0;
  }
  else
  {
    self->_maxZoomScale = 3.0;
    self->_double pinchMaxZoomScale = v13;
    [(QLPreviewScrollView *)self contentViewSize];
    double v23 = width / v22;
    [(QLPreviewScrollView *)self contentViewSize];
    double v25 = height / v24;
    [(QLPreviewScrollView *)self contentViewSize];
    if (QLImageWithSizeShouldNotBeScaled())
    {
      v26 = [MEMORY[0x263F82B60] mainScreen];
      [v26 scale];
      self->_minZoomScale = 1.0 / v27;

      if (v23 <= v25) {
        double v28 = v23;
      }
      else {
        double v28 = v25;
      }
      self->_double pinchMaxZoomScale = v28;
      self->_maxZoomScale = v28;
      self->_fillZoomScale = v28;
      self->_contentIsSmallerThanView = 1.0;
      goto LABEL_12;
    }
    [(QLPreviewScrollView *)self contentViewSize];
    if (v29 < width)
    {
      [(QLPreviewScrollView *)self contentViewSize];
      if (v30 < height)
      {
        if ([(QLPreviewScrollView *)self shouldFit])
        {
          if (v23 <= v25) {
            double v31 = v25;
          }
          else {
            double v31 = v23;
          }
          if (v23 <= v25) {
            double v32 = v23;
          }
          else {
            double v32 = v25;
          }
          self->_double pinchMaxZoomScale = v31;
          self->_maxZoomScale = v31;
          self->_minZoomScale = v32;
          self->_fillZoomScale = self->_maxZoomScale;
          self->_contentIsSmallerThanView = 0.0;
        }
        else
        {
          if (v23 <= v25) {
            double v42 = v23;
          }
          else {
            double v42 = v25;
          }
          self->_double pinchMaxZoomScale = v42;
          self->_maxZoomScale = v42;
          self->_fillZoomScale = v42;
          self->_contentIsSmallerThanView = 1.0;
          [(QLPreviewScrollView *)self contentViewSize];
          if (v43 >= width * 0.75
            || ([(QLPreviewScrollView *)self contentViewSize], v44 >= height * 0.75))
          {
            self->_minZoomScale = 1.0;
          }
          else
          {
            [(QLPreviewScrollView *)self contentViewSize];
            QLAdaptSizeToRect();
            double v46 = v45;
            double v48 = v47;
            [(QLPreviewScrollView *)self contentViewSize];
            if (v23 <= v25) {
              double v51 = v48 / v50;
            }
            else {
              double v51 = v46 / v49;
            }
            self->_minZoomScale = v51;
          }
        }
        goto LABEL_12;
      }
    }
    [(QLPreviewScrollView *)self contentViewSize];
    if (v33 <= width || ([(QLPreviewScrollView *)self contentViewSize], v34 >= height))
    {
      [(QLPreviewScrollView *)self contentViewSize];
      if (v38 >= width || ([(QLPreviewScrollView *)self contentViewSize], v39 <= height))
      {
        if (v23 <= v25)
        {
          self->_minZoomScale = v23;
          self->_fillZoomScale = v25;
        }
        else
        {
          self->_minZoomScale = v25;
          self->_fillZoomScale = v23;
        }
        goto LABEL_12;
      }
      [(QLPreviewScrollView *)self contentViewSize];
      self->_minZoomScale = height / v40;
      [(QLPreviewScrollView *)self contentViewSize];
      double v37 = width / v41;
    }
    else
    {
      [(QLPreviewScrollView *)self contentViewSize];
      self->_minZoomScale = width / v35;
      [(QLPreviewScrollView *)self contentViewSize];
      double v37 = height / v36;
    }
    self->_fillZoomScale = v37;
  }
LABEL_12:
  v15 = [(QLPreviewScrollView *)self zoomDelegate];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    v17 = [(QLPreviewScrollView *)self zoomDelegate];
    objc_msgSend(v17, "previewScrollView:extraMinimumZoomForMinimumZoomScale:maximumZoomScale:", self, self->_minZoomScale, fmin(self->_pinchMaxZoomScale, 3.0));
    self->_minZoomScale = v18 + self->_minZoomScale;
  }
  v19 = &OBJC_IVAR___QLPreviewScrollView__minZoomScale;
  if (self->_contentIsSmallerThanView != 0.0) {
    v19 = &OBJC_IVAR___QLPreviewScrollView__maxZoomScale;
  }
  *(void *)&self->_fitZoomScale = *(Class *)((char *)&self->super.super.super.super.isa + *v19);
  [(QLPreviewScrollView *)self setMinimumZoomScale:self->_minZoomScale];
  double pinchMaxZoomScale = self->_pinchMaxZoomScale;

  [(QLPreviewScrollView *)self setMaximumZoomScale:pinchMaxZoomScale];
}

- (void)resetZoomScale
{
  if (!self->_inSizeChange)
  {
    [(QLPreviewScrollView *)self setScrollEnabled:0];
    double minZoomScale = self->_minZoomScale;
    [(QLPreviewScrollView *)self setZoomScale:minZoomScale];
  }
}

- (CGRect)zoomRectForScale:(double)a3 withCenter:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  [(QLPreviewScrollView *)self frame];
  double v9 = v8 / a3;
  [(QLPreviewScrollView *)self frame];
  double v11 = v10 / a3;
  double v12 = x - v11 * 0.5;
  double v13 = y - v9 * 0.5;
  double v14 = v9;
  result.size.double height = v14;
  result.size.double width = v11;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)scrollViewWillBeginZooming:(id)a3 withView:(id)a4
{
  self->_inSizeChange = 1;
  -[QLPreviewScrollView setScrollEnabled:](self, "setScrollEnabled:", 1, a4);
  double v5 = [(QLPreviewScrollView *)self zoomDelegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(QLPreviewScrollView *)self zoomDelegate];
    [v7 previewScrollViewWillBeginZooming:self];
  }
}

- (void)scrollViewDidEndZooming:(id)a3 withView:(id)a4 atScale:(double)a5
{
  BOOL v7 = 0;
  self->_inSizeChange = 0;
  if (self->_contentIsSmallerThanView == 0.0) {
    BOOL v7 = self->_minZoomScale < a5;
  }
  -[QLPreviewScrollView setScrollEnabled:](self, "setScrollEnabled:", v7, a4);
  double v8 = [(QLPreviewScrollView *)self zoomDelegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = [(QLPreviewScrollView *)self zoomDelegate];
    [v10 previewScrollView:self didEndZoomingAtScale:a5];
  }
}

- (void)scrollViewDidZoom:(id)a3
{
  double v4 = [(QLPreviewScrollView *)self zoomDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLPreviewScrollView *)self zoomDelegate];
    [v6 previewScrollViewDidZoom:self];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  double v4 = [(QLPreviewScrollView *)self zoomDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(QLPreviewScrollView *)self zoomDelegate];
    [v6 previewScrollViewDidScroll:self];
  }
}

- (id)viewForZoomingInScrollView:(id)a3
{
  double v3 = [(QLPreviewScrollView *)self subviews];
  double v4 = [v3 firstObject];

  return v4;
}

- (BOOL)needsZoomUpdate
{
  return self->_needsZoomUpdate;
}

- (CGSize)contentViewSize
{
  double width = self->_contentViewSize.width;
  double height = self->_contentViewSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)minZoomScale
{
  return self->_minZoomScale;
}

- (double)maxZoomScale
{
  return self->_maxZoomScale;
}

- (double)pinchMaxZoomScale
{
  return self->_pinchMaxZoomScale;
}

- (double)fillZoomScale
{
  return self->_fillZoomScale;
}

- (double)fitZoomScale
{
  return self->_fitZoomScale;
}

- (double)contentIsSmallerThanView
{
  return self->_contentIsSmallerThanView;
}

- (QLPreviewScrollViewZoomDelegate)zoomDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_zoomDelegate);

  return (QLPreviewScrollViewZoomDelegate *)WeakRetained;
}

- (void)setZoomDelegate:(id)a3
{
}

- (BOOL)preventZoomUpdate
{
  return self->_preventZoomUpdate;
}

- (void)setPreventZoomUpdate:(BOOL)a3
{
  self->_preventZoomUpdate = a3;
}

- (BOOL)shouldFit
{
  return self->_shouldFit;
}

- (void)setShouldFit:(BOOL)a3
{
  self->_shouldFit = a3;
}

- (UIEdgeInsets)peripheryInsetsLandscape
{
  objc_copyStruct(v6, &self->_peripheryInsetsLandscape, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setPeripheryInsetsLandscape:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_peripheryInsetsLandscape, &v3, 32, 1, 0);
}

- (UIEdgeInsets)peripheryInsetsPortrait
{
  objc_copyStruct(v6, &self->_peripheryInsetsPortrait, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setPeripheryInsetsPortrait:(UIEdgeInsets)a3
{
  UIEdgeInsets v3 = a3;
  objc_copyStruct(&self->_peripheryInsetsPortrait, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
}

@end