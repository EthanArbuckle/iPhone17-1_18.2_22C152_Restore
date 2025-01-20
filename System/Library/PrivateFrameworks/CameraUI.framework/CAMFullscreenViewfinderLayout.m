@interface CAMFullscreenViewfinderLayout
- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5;
- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5 systemOverlayVisible:(int64_t)a6;
- (CAMFullscreenViewfinderLayout)initWithReferenceBounds:(CGRect)a3 shutterIntrinsicSize:(CGSize)a4;
- (CGRect)alignmentRectForShutterControl;
- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndLeftControl:(id)a4;
- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndRightControl:(id)a4;
- (CGRect)frameForBottomLeftControl:(id)a3;
- (CGRect)frameForBottomRightControl:(id)a3;
- (CGRect)frameForControlStatusBar;
- (CGRect)frameForShutterControl:(id)a3;
- (CGRect)referenceBounds;
- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 accessoryAreaExpanded:(BOOL)a4;
- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 usingAppDrawer:(BOOL)a4 accessoryAreaExpanded:(BOOL)a5;
- (CGSize)shutterIntrinsicSize;
- (CGSize)viewportSizeForAspectRatio:(int64_t)a3;
- (UIEdgeInsets)_safeAreaInsets;
- (double)frontCameraInset;
- (double)screenScale;
- (void)_updateSafeAreaInsets;
- (void)setFrontCameraInset:(double)a3;
- (void)setReferenceBounds:(CGRect)a3;
- (void)setScreenScale:(double)a3;
- (void)setShutterIntrinsicSize:(CGSize)a3;
@end

@implementation CAMFullscreenViewfinderLayout

- (CAMFullscreenViewfinderLayout)initWithReferenceBounds:(CGRect)a3 shutterIntrinsicSize:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  CGFloat v6 = a3.size.height;
  CGFloat v7 = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)CAMFullscreenViewfinderLayout;
  v10 = [(CAMFullscreenViewfinderLayout *)&v16 init];
  if (v10)
  {
    v11 = [MEMORY[0x263F82B60] mainScreen];
    [v11 scale];
    v10->_screenScale = v12;

    v10->_referenceBounds.origin.CGFloat x = x;
    v10->_referenceBounds.origin.CGFloat y = y;
    v10->_referenceBounds.size.CGFloat width = v7;
    v10->_referenceBounds.size.CGFloat height = v6;
    v10->_shutterIntrinsicSize.CGFloat width = width;
    v10->_shutterIntrinsicSize.CGFloat height = height;
    v13 = +[CAMCaptureCapabilities capabilities];
    [v13 frontCameraInset];
    v10->_frontCameraInset = v14;

    [(CAMFullscreenViewfinderLayout *)v10 _updateSafeAreaInsets];
  }
  return v10;
}

- (void)setReferenceBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (!CGRectEqualToRect(a3, self->_referenceBounds))
  {
    self->_referenceBounds.origin.CGFloat x = x;
    self->_referenceBounds.origin.CGFloat y = y;
    self->_referenceBounds.size.CGFloat width = width;
    self->_referenceBounds.size.CGFloat height = height;
    [(CAMFullscreenViewfinderLayout *)self _updateSafeAreaInsets];
  }
}

- (void)setScreenScale:(double)a3
{
  if (self->_screenScale != a3)
  {
    self->_screenScale = a3;
    [(CAMFullscreenViewfinderLayout *)self _updateSafeAreaInsets];
  }
}

- (void)setFrontCameraInset:(double)a3
{
  if (self->_frontCameraInset != a3)
  {
    self->_frontCameraInset = a3;
    [(CAMFullscreenViewfinderLayout *)self _updateSafeAreaInsets];
  }
}

- (void)_updateSafeAreaInsets
{
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  double v4 = v3;
  [(CAMFullscreenViewfinderLayout *)self viewportSizeForAspectRatio:1];
  double v6 = v4 - v5;
  CGFloat v7 = (double *)MEMORY[0x263F834E8];
  CGFloat v8 = *(double *)(MEMORY[0x263F834E8] + 8);
  CGFloat v9 = *(double *)(MEMORY[0x263F834E8] + 24);
  [(CAMFullscreenViewfinderLayout *)self screenScale];
  UIRoundToScale();
  double v11 = v10;
  double v12 = v6 - v10;
  [(CAMFullscreenViewfinderLayout *)self frameForControlStatusBar];
  if (v12 >= v13 + 33.0)
  {
    [(CAMFullscreenViewfinderLayout *)self frontCameraInset];
    if (v15 <= 45.0)
    {
      double v14 = 33.0;
    }
    else
    {
      double v11 = v11 + -15.0;
      double v14 = 48.0;
    }
  }
  else
  {
    double v14 = *v7;
  }
  self->__safeAreaInsets.top = v14;
  self->__safeAreaInsets.left = v8;
  self->__safeAreaInsets.bottom = v11;
  self->__safeAreaInsets.right = v9;
}

- (CGSize)viewportSizeForAspectRatio:(int64_t)a3
{
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  double v5 = v4;
  [(CAMFullscreenViewfinderLayout *)self screenScale];
  UIRoundToScale();
  double v7 = v6;
  double v8 = v5;
  result.CGFloat height = v7;
  result.CGFloat width = v8;
  return result;
}

- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 accessoryAreaExpanded:(BOOL)a4
{
  [(CAMFullscreenViewfinderLayout *)self viewportFrameForAspectRatio:a3 usingAppDrawer:0 accessoryAreaExpanded:a4];
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v6;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v4;
  return result;
}

- (CGRect)viewportFrameForAspectRatio:(int64_t)a3 usingAppDrawer:(BOOL)a4 accessoryAreaExpanded:(BOOL)a5
{
  BOOL v5 = a5;
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  CGFloat v9 = v8;
  double v11 = v10;
  uint64_t v13 = v12;
  double v15 = v14;
  [(CAMFullscreenViewfinderLayout *)self viewportSizeForAspectRatio:a3];
  double v17 = v16;
  double v19 = v18;
  if ((unint64_t)(a3 - 2) >= 2 && a3)
  {
    if (a3 == 1)
    {
      [(CAMFullscreenViewfinderLayout *)self _safeAreaInsets];
      double v11 = v15 - v19 - v20;
    }
  }
  else
  {
    uint64_t v40 = v13;
    double v42 = v15;
    if (v5)
    {
      +[CAMControlDrawerButton buttonSize];
      double v22 = v21 + 30.0;
    }
    else
    {
      [(CAMFullscreenViewfinderLayout *)self screenScale];
      UIRoundToScale();
    }
    double v23 = fmax(v22, 31.0);
    [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
    double v25 = v24;
    [(CAMFullscreenViewfinderLayout *)self viewportSizeForAspectRatio:0];
    double v27 = v25 - v23 - v26;
    [(CAMFullscreenViewfinderLayout *)self frameForControlStatusBar];
    CGFloat x = v44.origin.x;
    CGFloat y = v44.origin.y;
    CGFloat width = v44.size.width;
    CGFloat height = v44.size.height;
    if (v27 >= CGRectGetMidY(v44))
    {
      v46.origin.CGFloat x = x;
      v46.origin.CGFloat y = y;
      v46.size.CGFloat width = width;
      v46.size.CGFloat height = height;
      if (v27 < CGRectGetMaxY(v46))
      {
        v47.origin.CGFloat x = x;
        v47.origin.CGFloat y = y;
        v47.size.CGFloat width = width;
        v47.size.CGFloat height = height;
        CGRectGetMaxY(v47);
      }
    }
    else
    {
      v45.origin.CGFloat x = x;
      v45.origin.CGFloat y = y;
      v45.size.CGFloat width = width;
      v45.size.CGFloat height = height;
      CGRectGetMinY(v45);
    }
    v48.size.CGFloat width = v41;
    v48.size.CGFloat height = v43;
    v48.origin.CGFloat x = v9;
    v48.origin.CGFloat y = v11;
    CGRectGetMidX(v48);
    [(CAMFullscreenViewfinderLayout *)self screenScale];
    UIRectCenteredAboutPointScale();
    CGFloat v9 = v32;
    double v11 = v33;
    double v17 = v34;
    double v19 = v35;
  }
  double v36 = v9;
  double v37 = v11;
  double v38 = v17;
  double v39 = v19;
  result.size.CGFloat height = v39;
  result.size.CGFloat width = v38;
  result.origin.CGFloat y = v37;
  result.origin.CGFloat x = v36;
  return result;
}

- (CGRect)frameForShutterControl:(id)a3
{
  id v4 = a3;
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
  objc_msgSend(v4, "frameForAlignmentRect:availableWidth:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)alignmentRectForShutterControl
{
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(CAMFullscreenViewfinderLayout *)self shutterIntrinsicSize];
  [(CAMFullscreenViewfinderLayout *)self screenScale];
  uint64_t v26 = v11;
  UIRectCenteredXInRectScale();
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  CEKClamp();
  [(CAMFullscreenViewfinderLayout *)self screenScale];
  UIRoundToScale();
  double v19 = v18;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double MaxY = CGRectGetMaxY(v27);
  [(CAMFullscreenViewfinderLayout *)self _safeAreaInsets];
  double v22 = MaxY - v21 - v17 - v19;
  double v23 = v13;
  double v24 = v15;
  double v25 = v17;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v24;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v23;
  return result;
}

- (CGRect)frameForControlStatusBar
{
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  double v4 = v3;
  double v6 = v5;
  CEKClamp();
  [(CAMFullscreenViewfinderLayout *)self screenScale];
  UIRoundToScale();
  double v8 = v7;
  [(CAMFullscreenViewfinderLayout *)self _safeAreaInsets];
  double v10 = v9;
  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)frameForBottomLeftControl:(id)a3
{
  id v4 = a3;
  [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
  [v4 intrinsicContentSize];
  UIRectCenteredYInRectScale();
  [v4 frameForAlignmentRect:0];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndLeftControl:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
  CGFloat v9 = v8;
  CGFloat rect = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CAMFullscreenViewfinderLayout *)self frameForBottomLeftControl:v6];
  objc_msgSend(v6, "alignmentRectForFrame:");
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v37.origin.CGFloat x = v9;
  v37.origin.CGFloat y = v11;
  v37.size.CGFloat width = v13;
  v37.size.CGFloat height = v15;
  CGRectGetMinX(v37);
  v38.origin.CGFloat x = v17;
  v38.origin.CGFloat y = v19;
  v38.size.CGFloat width = v21;
  v38.size.CGFloat height = v23;
  CGRectGetMaxX(v38);
  v39.origin.CGFloat x = rect;
  v39.origin.CGFloat y = v11;
  v39.size.CGFloat width = v13;
  v39.size.CGFloat height = v15;
  CGRectGetMidY(v39);
  [v7 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v7, "frameForAlignmentRect:");
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- (CGRect)frameForBottomRightControl:(id)a3
{
  id v4 = a3;
  [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
  [v4 intrinsicContentSize];
  [(CAMFullscreenViewfinderLayout *)self referenceBounds];
  CGRectGetMaxX(v17);
  UIRectCenteredYInRectScale();
  [v4 frameForAlignmentRect:0];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (CGRect)frameForBottomControl:(id)a3 betweenShutterAndRightControl:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CAMFullscreenViewfinderLayout *)self alignmentRectForShutterControl];
  CGFloat v9 = v8;
  CGFloat rect = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  [(CAMFullscreenViewfinderLayout *)self frameForBottomRightControl:v6];
  objc_msgSend(v6, "alignmentRectForFrame:");
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v37.origin.CGFloat x = v9;
  v37.origin.CGFloat y = v11;
  v37.size.CGFloat width = v13;
  v37.size.CGFloat height = v15;
  CGRectGetMaxX(v37);
  v38.origin.CGFloat x = v17;
  v38.origin.CGFloat y = v19;
  v38.size.CGFloat width = v21;
  v38.size.CGFloat height = v23;
  CGRectGetMinX(v38);
  v39.origin.CGFloat x = rect;
  v39.origin.CGFloat y = v11;
  v39.size.CGFloat width = v13;
  v39.size.CGFloat height = v15;
  CGRectGetMidY(v39);
  [v7 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v7, "frameForAlignmentRect:");
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  double v32 = v25;
  double v33 = v27;
  double v34 = v29;
  double v35 = v31;
  result.size.CGFloat height = v35;
  result.size.CGFloat width = v34;
  result.origin.CGFloat y = v33;
  result.origin.CGFloat x = v32;
  return result;
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5
{
  return -[CAMFullscreenViewfinderLayout geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:](self, "geometryForElapsedTimeView:viewportFrame:orientation:systemOverlayVisible:", a4, a6, 0, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- ($3B1716E7537CC2F16D6737AAC3CCCADB)geometryForElapsedTimeView:(SEL)a3 viewportFrame:(id)a4 orientation:(CGRect)a5 systemOverlayVisible:(int64_t)a6
{
  BOOL v7 = a7;
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  id v15 = a4;
  *retstr = *($3B1716E7537CC2F16D6737AAC3CCCADB *)CAMViewGeometryZero;
  [v15 intrinsicContentSize];
  double v17 = v16;
  retstr->var0.size.CGFloat width = v18;
  retstr->var0.size.CGFloat height = v16;
  CAMOrientationTransform(a6, (uint64_t)&origin);
  CGSize v19 = v49;
  *(CGPoint *)&retstr->var2.a = origin;
  *(CGSize *)&retstr->var2.c = v19;
  *(CGPoint *)&retstr->var2.tCGFloat x = var1;
  UIRectGetCenter();
  double v21 = v20;
  retstr->var1.CGFloat x = v22;
  retstr->var1.CGFloat y = v20;
  double v23 = v17 * 0.5;
  UIRoundToViewScale();
  if ((unint64_t)a6 < 3)
  {
    [(CAMFullscreenViewfinderLayout *)self frameForControlStatusBar];
    double v25 = v54.origin.y;
    double MidY = CGRectGetMidY(v54);
    retstr->var1.CGFloat y = MidY;
    double v27 = +[CAMCaptureCapabilities capabilities];
    [v27 frontCameraInset];
    double v29 = v28 + 2.0;

    double v30 = MidY - v23 + v25;
    if (v29 > v30) {
      retstr->var1.CGFloat y = MidY + v29 - v30;
    }
    UIRoundToViewScale();
    goto LABEL_5;
  }
  double v32 = v24;
  if (a6 == 3)
  {
    v56.origin.CGFloat x = x;
    v56.origin.CGFloat y = y;
    v56.size.CGFloat width = width;
    v56.size.CGFloat height = height;
    retstr->var1.CGFloat x = CGRectGetMaxX(v56) - v32 + -8.0;
    if (v7)
    {
      double v33 = +[CAMCaptureCapabilities capabilities];
      [v33 frameForPhysicalButton:6];
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;

      v57.origin.CGFloat x = v35;
      v57.origin.CGFloat y = v37;
      v57.size.CGFloat width = v39;
      v57.size.CGFloat height = v41;
      double MinY = CGRectGetMinY(v57);
      long long v43 = *(_OWORD *)&retstr->var2.a;
      CGPoint var1 = retstr->var1;
      long long v51 = v43;
      long long v44 = *(_OWORD *)&retstr->var2.tx;
      long long v52 = *(_OWORD *)&retstr->var2.c;
      long long v53 = v44;
      CGSize size = retstr->var0.size;
      CGPoint origin = retstr->var0.origin;
      CGSize v49 = size;
      CAMFrameForGeometry((uint64_t)&origin);
      double v46 = CGRectGetMaxY(v58) + 88.0;
      if (v46 > MinY)
      {
        double v31 = v21 - (v46 - MinY);
LABEL_5:
        retstr->var1.CGFloat y = v31;
      }
    }
  }
  else if (a6 == 4)
  {
    v55.origin.CGFloat x = x;
    v55.origin.CGFloat y = y;
    v55.size.CGFloat width = width;
    v55.size.CGFloat height = height;
    retstr->var1.CGFloat x = v32 + CGRectGetMinX(v55) + 8.0;
  }

  return result;
}

- (CGRect)referenceBounds
{
  double x = self->_referenceBounds.origin.x;
  double y = self->_referenceBounds.origin.y;
  double width = self->_referenceBounds.size.width;
  double height = self->_referenceBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGSize)shutterIntrinsicSize
{
  double width = self->_shutterIntrinsicSize.width;
  double height = self->_shutterIntrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setShutterIntrinsicSize:(CGSize)a3
{
  self->_shutterIntrinsicSize = a3;
}

- (double)screenScale
{
  return self->_screenScale;
}

- (UIEdgeInsets)_safeAreaInsets
{
  double top = self->__safeAreaInsets.top;
  double left = self->__safeAreaInsets.left;
  double bottom = self->__safeAreaInsets.bottom;
  double right = self->__safeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (double)frontCameraInset
{
  return self->_frontCameraInset;
}

@end