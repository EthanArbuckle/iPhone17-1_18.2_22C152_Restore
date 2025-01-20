@interface CAMPreviewView
+ (Class)layerClass;
- (AVCaptureVideoPreviewLayer)videoPreviewLayer;
- (BOOL)_debugDrawZoomPIP;
- (BOOL)_isZoomPIPRectValid;
- (CAMFocusIndicatorView)continuousIndicator;
- (CAMFocusIndicatorView)externalFocusLockIndicator;
- (CAMFocusIndicatorView)pointIndicator;
- (CAMGridView)gridView;
- (CAMHorizonLevelView)horizonLevelView;
- (CAMInterfaceModulationView)indicatorContainerView;
- (CAMLevelIndicatorView)levelView;
- (CAMPreviewView)initWithFrame:(CGRect)a3;
- (CAMStageLightOverlayView)stageLightOverlayView;
- (CAMVideoPreviewView)videoPreviewView;
- (CAShapeLayer)_indicatorContainerMask;
- (CEKSubjectIndicatorView)centeredSubjectIndicatorView;
- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)a3;
- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3;
- (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 angle:(double)a4;
- (CGRect)_frameClampedToBounds:(CGRect)a3;
- (CGRect)_frameForAVMetadataObject:(id)a3;
- (CGRect)faceIndicatorFrameForFaceResult:(id)a3;
- (CGRect)fixedSizeSubjectIndicatorFrameForBodyResult:(id)a3;
- (CGRect)fixedSizeSubjectIndicatorFrameForFaceResult:(id)a3;
- (CGRect)frameForMetadataObjectResult:(id)a3;
- (CGRect)frameForMetadataObjectResult:(id)a3 fixedSize:(CGSize)a4;
- (CGRect)frameForSubjectGroupResult:(id)a3 minimumSize:(CGSize)a4;
- (CGRect)frameForTextRegionResult:(id)a3;
- (CGRect)normalizedZoomPIPRect;
- (CGRect)overlayFrame;
- (CGRect)viewportFrame;
- (UILabel)_simulatorLabel;
- (double)bottomContentInset;
- (int)_exposureBiasSide;
- (int)_faceOrientationForRollAngle:(double)a3;
- (int64_t)indicatorClippingStyle;
- (int64_t)orientation;
- (void)_drawZoomPIP;
- (void)_setIndicatorContainerMask:(id)a3;
- (void)_updateIndicatorContainerMask;
- (void)dealloc;
- (void)indicatePointOfInterest:(CGPoint)a3;
- (void)layoutSubviews;
- (void)setBottomContentInset:(double)a3;
- (void)setCenteredSubjectIndicatorView:(id)a3;
- (void)setContinuousIndicator:(id)a3;
- (void)setExternalFocusLockIndicator:(id)a3;
- (void)setGridView:(id)a3;
- (void)setHorizonLevelView:(id)a3;
- (void)setIndicatorClippingStyle:(int64_t)a3;
- (void)setLevelView:(id)a3;
- (void)setNormalizedZoomPIPRect:(CGRect)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4;
- (void)setOverlayFrame:(CGRect)a3;
- (void)setPointIndicator:(id)a3;
- (void)setStageLightOverlayView:(id)a3;
- (void)setVideoPreviewLayer:(id)a3;
- (void)setViewportFrame:(CGRect)a3;
- (void)set_exposureBiasSide:(int)a3;
@end

@implementation CAMPreviewView

- (CAMPreviewView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)CAMPreviewView;
  v3 = -[CAMPreviewView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F825C8] blackColor];
    [(CAMPreviewView *)v3 setBackgroundColor:v4];

    v5 = [MEMORY[0x263F825C8] systemYellowColor];
    [(CAMPreviewView *)v3 setTintColor:v5];

    [(CAMPreviewView *)v3 setOrientation:1];
    v6 = [CAMVideoPreviewView alloc];
    uint64_t v7 = -[CAMVideoPreviewView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    videoPreviewView = v3->_videoPreviewView;
    v3->_videoPreviewView = (CAMVideoPreviewView *)v7;

    [(CAMVideoPreviewView *)v3->_videoPreviewView setClipsToBounds:1];
    [(CAMPreviewView *)v3 addSubview:v3->_videoPreviewView];
    v9 = [[CAMInterfaceModulationView alloc] initWithHostingView:v3];
    indicatorContainerView = v3->_indicatorContainerView;
    v3->_indicatorContainerView = v9;

    [(CAMInterfaceModulationView *)v3->_indicatorContainerView setClipsToBounds:1];
    [(CAMPreviewView *)v3 addSubview:v3->_indicatorContainerView];
    v3->__debugDrawZoomPIP = CFPreferencesGetAppBooleanValue(@"CAMDebugDrawZoomPIP", @"com.apple.camera", 0) != 0;
    v11 = v3;
  }

  return v3;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setVideoPreviewLayer:(id)a3
{
}

- (CAMVideoPreviewView)videoPreviewView
{
  return self->_videoPreviewView;
}

- (void)layoutSubviews
{
  v87.receiver = self;
  v87.super_class = (Class)CAMPreviewView;
  [(CAMPreviewView *)&v87 layoutSubviews];
  [(CAMPreviewView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(CAMPreviewView *)self indicatorContainerView];
  double v12 = v10;
  double v13 = v8;
  double v14 = v6;
  double v15 = v4;
  if ([(CAMPreviewView *)self indicatorClippingStyle] == 1)
  {
    [(CAMPreviewView *)self viewportFrame];
    double v15 = v16;
    double v14 = v17;
    double v13 = v18;
    double v12 = v19;
  }
  v20 = [(CAMPreviewView *)self videoPreviewView];
  double v85 = v6;
  double v86 = v4;
  objc_msgSend(v20, "setFrame:", v4, v6, v8, v10);

  objc_msgSend(v11, "setFrame:", v15, v14, v13, v12);
  v21 = [(CAMPreviewView *)self _indicatorContainerMask];
  if (v21)
  {
    [v11 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    [v21 frame];
    v89.origin.x = v23;
    v89.origin.y = v25;
    v89.size.width = v27;
    v89.size.height = v29;
    if (!CGRectEqualToRect(v88, v89))
    {
      objc_msgSend(v21, "setFrame:", v23, v25, v27, v29);
      [(CAMPreviewView *)self _updateIndicatorContainerMask];
    }
  }
  [(CAMPreviewView *)self viewportFrame];
  UIRectGetCenter();
  -[CAMPreviewView convertPoint:toView:](self, "convertPoint:toView:", v11);
  v30 = [(CAMPreviewView *)self continuousIndicator];
  v31 = [(CAMPreviewView *)self traitCollection];
  [v31 displayScale];
  double v33 = v32;

  [v30 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v30, "setFrame:");
  v34 = [(CAMPreviewView *)self pointIndicator];
  [v34 intrinsicContentSize];
  objc_msgSend(v34, "setBounds:", 0.0, 0.0, v35, v36);
  v37 = [(CAMPreviewView *)self externalFocusLockIndicator];
  [v37 intrinsicContentSize];
  UIRectCenteredAboutPointScale();
  objc_msgSend(v37, "setFrame:");
  [(CAMPreviewView *)self viewportFrame];
  -[CAMPreviewView convertRect:toView:](self, "convertRect:toView:", v11);
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;
  double v45 = v44;
  v46 = [(CAMPreviewView *)self gridView];
  CAMViewSetBoundsAndCenterForFrame(v46, v39, v41, v43, v45);

  v47 = [(CAMPreviewView *)self levelView];
  CAMViewSetBoundsAndCenterForFrame(v47, v39, v41, v43, v45);

  v48 = [(CAMPreviewView *)self horizonLevelView];
  CAMViewSetBoundsAndCenterForFrame(v48, v39, v41, v43, v45);

  [(CAMPreviewView *)self viewportFrame];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  int64_t v57 = [(CAMPreviewView *)self orientation];
  [(CAMPreviewView *)self bottomContentInset];
  +[CAMStageLightOverlayView circleFrameForViewport:orientation:bottomContentInset:screenScale:](CAMStageLightOverlayView, "circleFrameForViewport:orientation:bottomContentInset:screenScale:", v57, v50, v52, v54, v56, v58, v33);
  UIRectGetCenter();
  double v60 = v59;
  double v62 = v61;
  v63 = [(CAMPreviewView *)self centeredSubjectIndicatorView];
  [v63 intrinsicContentSize];
  double v65 = v64;
  double v67 = v66;
  int64_t v68 = [(CAMPreviewView *)self orientation];
  if ((unint64_t)(v68 - 3) >= 2) {
    double v69 = v65;
  }
  else {
    double v69 = v67;
  }
  if ((unint64_t)(v68 - 3) >= 2) {
    double v65 = v67;
  }
  double v71 = *MEMORY[0x263F00148];
  double v70 = *(double *)(MEMORY[0x263F00148] + 8);
  -[CAMPreviewView convertPoint:toView:](self, "convertPoint:toView:", v11, v60, v62);
  objc_msgSend(v63, "setCenter:");
  objc_msgSend(v63, "setBounds:", v71, v70, v69, v65);
  v72 = [(CAMPreviewView *)self stageLightOverlayView];
  objc_msgSend(v72, "setFrame:", v86, v85, v8, v10);

  [(CAMPreviewView *)self overlayFrame];
  double v74 = v73;
  double v76 = v75;
  double v78 = v77;
  double v80 = v79;
  v81 = [(CAMPreviewView *)self stageLightOverlayView];
  objc_msgSend(v81, "setViewportFrame:", v74, v76, v78, v80);

  [(CAMPreviewView *)self bottomContentInset];
  double v83 = v82;
  v84 = [(CAMPreviewView *)self stageLightOverlayView];
  [v84 setBottomContentInset:v83];
}

- (CAMFocusIndicatorView)continuousIndicator
{
  return self->_continuousIndicator;
}

- (CAMFocusIndicatorView)pointIndicator
{
  return self->_pointIndicator;
}

- (CAMGridView)gridView
{
  return self->_gridView;
}

- (CAMLevelIndicatorView)levelView
{
  return self->_levelView;
}

- (CEKSubjectIndicatorView)centeredSubjectIndicatorView
{
  return self->_centeredSubjectIndicatorView;
}

- (CAMStageLightOverlayView)stageLightOverlayView
{
  return self->_stageLightOverlayView;
}

- (double)bottomContentInset
{
  return self->_bottomContentInset;
}

- (void)setContinuousIndicator:(id)a3
{
  double v5 = (CAMFocusIndicatorView *)a3;
  if (self->_continuousIndicator != v5)
  {
    objc_storeStrong((id *)&self->_continuousIndicator, a3);
    [(CAMInterfaceModulationView *)self->_indicatorContainerView addSubview:v5];
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (void)dealloc
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewView;
  [(CAMPreviewView *)&v4 dealloc];
}

- (void)setOrientation:(int64_t)a3
{
}

- (void)setOrientation:(int64_t)a3 animated:(BOOL)a4
{
  if (self->_orientation != a3)
  {
    if (a4)
    {
      [(CAMPreviewView *)self layoutIfNeeded];
      self->_orientation = a3;
      [(CAMPreviewView *)self setNeedsLayout];
      v6[0] = MEMORY[0x263EF8330];
      v6[1] = 3221225472;
      v6[2] = __42__CAMPreviewView_setOrientation_animated___block_invoke;
      v6[3] = &unk_263FA0208;
      v6[4] = self;
      +[CAMView animateIfNeededWithDuration:0x20000 options:v6 animations:0 completion:0.35];
    }
    else
    {
      self->_orientation = a3;
      [(CAMPreviewView *)self setNeedsLayout];
    }
  }
}

uint64_t __42__CAMPreviewView_setOrientation_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setViewportFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_viewportFrame = &self->_viewportFrame;
  if (!CGRectEqualToRect(a3, self->_viewportFrame))
  {
    p_viewportFrame->origin.CGFloat x = x;
    p_viewportFrame->origin.CGFloat y = y;
    p_viewportFrame->size.CGFloat width = width;
    p_viewportFrame->size.CGFloat height = height;
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (void)setOverlayFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_overlayFrame = &self->_overlayFrame;
  if (!CGRectEqualToRect(a3, self->_overlayFrame))
  {
    p_overlayFrame->origin.CGFloat x = x;
    p_overlayFrame->origin.CGFloat y = y;
    p_overlayFrame->size.CGFloat width = width;
    p_overlayFrame->size.CGFloat height = height;
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (AVCaptureVideoPreviewLayer)videoPreviewLayer
{
  return [(CAMVideoPreviewView *)self->_videoPreviewView videoPreviewLayer];
}

- (void)setIndicatorClippingStyle:(int64_t)a3
{
  if (self->_indicatorClippingStyle != a3)
  {
    self->_indicatorClippingStyle = a3;
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (void)setPointIndicator:(id)a3
{
  double v5 = (CAMFocusIndicatorView *)a3;
  if (self->_pointIndicator != v5)
  {
    objc_storeStrong((id *)&self->_pointIndicator, a3);
    [(CAMInterfaceModulationView *)self->_indicatorContainerView addSubview:v5];
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (void)setExternalFocusLockIndicator:(id)a3
{
  double v5 = (CAMFocusIndicatorView *)a3;
  if (self->_externalFocusLockIndicator != v5)
  {
    objc_storeStrong((id *)&self->_externalFocusLockIndicator, a3);
    [(CAMInterfaceModulationView *)self->_indicatorContainerView addSubview:v5];
    [(CAMPreviewView *)self setNeedsLayout];
  }
}

- (void)indicatePointOfInterest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v6 = [(CAMPreviewView *)self pointIndicator];
  -[CAMPreviewView pointForCaptureDevicePointOfInterest:](self, "pointForCaptureDevicePointOfInterest:", x, y);
  double v7 = (void *)MEMORY[0x263F82E00];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __42__CAMPreviewView_indicatePointOfInterest___block_invoke;
  v11[3] = &unk_263FA5198;
  uint64_t v14 = v8;
  uint64_t v15 = v9;
  id v12 = v6;
  double v13 = self;
  id v10 = v6;
  [v7 performWithoutAnimation:v11];
}

uint64_t __42__CAMPreviewView_indicatePointOfInterest___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2 * 0.5;
  double v5 = v4 * 0.5;
  UIRoundToViewScale();
  double v7 = v6;
  UIRoundToViewScale();
  double v8 = v7 + v3;
  double v10 = v5 + v9;
  v11 = *(void **)(a1 + 40);
  id v12 = [v11 indicatorContainerView];
  objc_msgSend(v11, "convertPoint:toView:", v12, v8, v10);
  double v14 = v13;
  double v16 = v15;

  double v17 = *(void **)(a1 + 32);
  return objc_msgSend(v17, "setCenter:", v14, v16);
}

- (void)setGridView:(id)a3
{
  double v4 = (CAMGridView *)a3;
  gridView = self->_gridView;
  if (gridView != v4)
  {
    double v9 = v4;
    double v6 = [(CAMGridView *)gridView superview];
    double v7 = [(CAMPreviewView *)self indicatorContainerView];

    if (v6 == v7) {
      [(CAMGridView *)self->_gridView removeFromSuperview];
    }
    self->_gridView = v9;
    double v8 = [(CAMPreviewView *)self indicatorContainerView];
    [v8 addSubview:v9];

    double v4 = v9;
  }
  MEMORY[0x270F9A758](gridView, v4);
}

- (void)setLevelView:(id)a3
{
  double v4 = (CAMLevelIndicatorView *)a3;
  levelView = self->_levelView;
  if (levelView != v4)
  {
    double v9 = v4;
    double v6 = [(CAMLevelIndicatorView *)levelView superview];
    double v7 = [(CAMPreviewView *)self indicatorContainerView];

    if (v6 == v7) {
      [(CAMLevelIndicatorView *)self->_levelView removeFromSuperview];
    }
    self->_levelView = v9;
    double v8 = [(CAMPreviewView *)self indicatorContainerView];
    [v8 addSubview:v9];

    double v4 = v9;
  }
  MEMORY[0x270F9A758](levelView, v4);
}

- (void)setHorizonLevelView:(id)a3
{
  double v4 = (CAMHorizonLevelView *)a3;
  horizonLevelView = self->_horizonLevelView;
  if (horizonLevelView != v4)
  {
    double v9 = v4;
    double v6 = [(CAMHorizonLevelView *)horizonLevelView superview];
    double v7 = [(CAMPreviewView *)self indicatorContainerView];

    if (v6 == v7) {
      [(CAMHorizonLevelView *)self->_horizonLevelView removeFromSuperview];
    }
    self->_horizonLevelView = v9;
    double v8 = [(CAMPreviewView *)self indicatorContainerView];
    [v8 addSubview:v9];

    double v4 = v9;
  }
  MEMORY[0x270F9A758](horizonLevelView, v4);
}

- (void)setStageLightOverlayView:(id)a3
{
  double v5 = (CAMStageLightOverlayView *)a3;
  stageLightOverlayView = self->_stageLightOverlayView;
  double v8 = v5;
  if (stageLightOverlayView != v5)
  {
    [(CAMStageLightOverlayView *)stageLightOverlayView removeFromSuperview];
    objc_storeStrong((id *)&self->_stageLightOverlayView, a3);
    double v7 = [(CAMPreviewView *)self videoPreviewView];
    [(CAMPreviewView *)self insertSubview:v8 aboveSubview:v7];
  }
}

- (void)setBottomContentInset:(double)a3
{
  if (self->_bottomContentInset != a3)
  {
    self->_bottomContentInset = a3;
    id v4 = [(CAMPreviewView *)self stageLightOverlayView];
    [v4 setBottomContentInset:a3];
  }
}

- (void)setCenteredSubjectIndicatorView:(id)a3
{
  double v5 = (CEKSubjectIndicatorView *)a3;
  if (self->_centeredSubjectIndicatorView != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_centeredSubjectIndicatorView, a3);
    [(CAMInterfaceModulationView *)self->_indicatorContainerView addSubview:self->_centeredSubjectIndicatorView];
    [(CAMPreviewView *)self setNeedsLayout];
    double v5 = v6;
  }
}

- (CGRect)fixedSizeSubjectIndicatorFrameForFaceResult:(id)a3
{
  id v4 = a3;
  [v4 rollAngle];
  unsigned int v5 = -[CAMPreviewView _faceOrientationForRollAngle:](self, "_faceOrientationForRollAngle:");
  [(CAMPreviewView *)self faceIndicatorFrameForFaceResult:v4];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v39.origin.double x = v7;
  v39.origin.double y = v9;
  v39.size.CGFloat width = v11;
  v39.size.CGFloat height = v13;
  double MidX = CGRectGetMidX(v39);
  v40.origin.double x = v7;
  v40.origin.double y = v9;
  v40.size.CGFloat width = v11;
  v40.size.CGFloat height = v13;
  double MidY = CGRectGetMidY(v40);
  double v15 = (void *)MEMORY[0x263F30700];
  double v16 = [(CAMPreviewView *)self window];
  double v17 = [v16 screen];
  [v17 scale];
  objc_msgSend(v15, "fixedSizeWithScale:");
  double v19 = v18;
  double v21 = v20;

  if ((v5 & 0xFFFFFFFE) == 2) {
    double v22 = v21;
  }
  else {
    double v22 = v19;
  }
  if ((v5 & 0xFFFFFFFE) != 2) {
    double v19 = v21;
  }
  if (v5 - 2 < 2)
  {
    v42.origin.double x = v7;
    v42.origin.double y = v9;
    v42.size.CGFloat width = v11;
    v42.size.CGFloat height = v13;
    double Width = CGRectGetWidth(v42);
    double v24 = v22;
  }
  else if (v5 > 1)
  {
    double v24 = 0.0;
    double Width = 0.0;
  }
  else
  {
    v41.origin.double x = v7;
    v41.origin.double y = v9;
    v41.size.CGFloat width = v11;
    v41.size.CGFloat height = v13;
    double Width = CGRectGetHeight(v41);
    double v24 = v19;
  }
  double v25 = v24 * 0.3;
  double v26 = v24 - v24 * 0.3;
  long double v27 = 0.0;
  if (v26 > 0.0)
  {
    double v28 = (Width - v25) / v26;
    if (v28 >= 0.0)
    {
      long double v27 = v28;
      if (v28 > 1.0) {
        long double v27 = 1.0;
      }
    }
  }
  double v29 = v25 + pow(v27, 0.3) * (v24 * 0.5 - v25);
  switch(v5)
  {
    case 0u:
      UIRoundToViewScale();
      double v31 = v30;
      double v32 = MidY - v29;
      break;
    case 1u:
      UIRoundToViewScale();
      double v31 = v33;
      double v32 = MidY - (v19 - v29);
      break;
    case 2u:
      double v31 = MidX - v29;
      goto LABEL_21;
    case 3u:
      double v31 = MidX - (v22 - v29);
LABEL_21:
      UIRoundToViewScale();
      double v32 = v34;
      break;
    default:
      double v31 = *MEMORY[0x263F001A8];
      double v32 = *(double *)(MEMORY[0x263F001A8] + 8);
      break;
  }
  double v35 = v31;
  double v36 = v22;
  double v37 = v19;
  result.size.CGFloat height = v37;
  result.size.CGFloat width = v36;
  result.origin.double y = v32;
  result.origin.double x = v35;
  return result;
}

- (CGRect)fixedSizeSubjectIndicatorFrameForBodyResult:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [(CAMPreviewView *)self window];
  double v6 = [v5 screen];
  [v6 scale];
  double v8 = v7;

  [MEMORY[0x263F30700] fixedSizeWithScale:v8];
  -[CAMPreviewView frameForMetadataObjectResult:fixedSize:](self, "frameForMetadataObjectResult:fixedSize:", v4);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  double v17 = v10;
  double v18 = v12;
  double v19 = v14;
  double v20 = v16;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v19;
  result.origin.double y = v18;
  result.origin.double x = v17;
  return result;
}

- (CGRect)frameForMetadataObjectResult:(id)a3
{
  id v4 = [a3 underlyingMetadataObject];
  [(CAMPreviewView *)self _frameForAVMetadataObject:v4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:", v6, v8, v10, v12);
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)frameForMetadataObjectResult:(id)a3 fixedSize:(CGSize)a4
{
  double v5 = [a3 underlyingMetadataObject];
  [(CAMPreviewView *)self _frameForAVMetadataObject:v5];

  UIRectGetCenter();
  UIRectCenteredAboutPointScale();
  result.size.CGFloat height = v9;
  result.size.CGFloat width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGRect)_frameForAVMetadataObject:(id)a3
{
  id v4 = a3;
  double v5 = [(CAMPreviewView *)self videoPreviewLayer];
  double v6 = [v5 transformedMetadataObjectForMetadataObject:v4];

  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v15 = [(CAMPreviewView *)self layer];
  objc_msgSend(v5, "convertRect:toLayer:", v15, v8, v10, v12, v14);

  UIRectIntegralWithScale();
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;

  double v24 = v17;
  double v25 = v19;
  double v26 = v21;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.double y = v25;
  result.origin.double x = v24;
  return result;
}

- (CGRect)_frameClampedToBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(CAMPreviewView *)self indicatorContainerView];
  [v7 frame];
  CGRect v22 = CGRectInset(v21, 3.0, 3.0);
  CGFloat v8 = v22.origin.x;
  CGFloat v9 = v22.origin.y;
  CGFloat v10 = v22.size.width;
  CGFloat v11 = v22.size.height;

  CGFloat v12 = v8;
  CGFloat v13 = v9;
  CGFloat v14 = v10;
  CGFloat v15 = v11;
  CGFloat v16 = x;
  CGFloat v17 = y;
  CGFloat v18 = width;
  CGFloat v19 = height;
  return CGRectIntersection(*(CGRect *)&v12, *(CGRect *)&v16);
}

- (CGRect)frameForTextRegionResult:(id)a3
{
  id v4 = a3;
  double v5 = [(CAMPreviewView *)self videoPreviewLayer];
  double v6 = [v4 underlyingMetadataObject];

  double v7 = [v5 transformedMetadataObjectForMetadataObject:v6];

  CGFloat v8 = [v7 type];
  [v7 angularOffsetBounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = [(CAMPreviewView *)self layer];
  objc_msgSend(v5, "convertRect:toLayer:", v17, v10, v12, v14, v16);

  UIRectIntegralWithScale();
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  double v26 = v19;
  double v27 = v21;
  double v28 = v23;
  double v29 = v25;
  result.size.CGFloat height = v29;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

- (CGPoint)captureDevicePointOfInterestForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CAMPreviewView *)self videoPreviewLayer];
  objc_msgSend(v5, "captureDevicePointOfInterestForPoint:", x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGPoint)pointForCaptureDevicePointOfInterest:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  double v5 = [(CAMPreviewView *)self videoPreviewLayer];
  objc_msgSend(v5, "pointForCaptureDevicePointOfInterest:", x, y);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (CGRect)faceIndicatorFrameForFaceResult:(id)a3
{
  id v4 = a3;
  double v5 = [v4 underlyingMetadataObject];
  [(CAMPreviewView *)self _frameForAVMetadataObject:v5];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  [v4 rollAngle];
  double v15 = v14;

  -[CAMPreviewView _aspectFaceRectFromSquareFaceRect:angle:](self, "_aspectFaceRectFromSquareFaceRect:angle:", v7, v9, v11, v13, v15);
  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:");
  UIRectIntegralWithScale();
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (CGRect)frameForSubjectGroupResult:(id)a3 minimumSize:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v5 = a3;
  CGFloat v6 = *MEMORY[0x263F001A0];
  CGFloat v7 = *(double *)(MEMORY[0x263F001A0] + 8);
  CGFloat v8 = *(double *)(MEMORY[0x263F001A0] + 16);
  CGFloat v9 = *(double *)(MEMORY[0x263F001A0] + 24);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  double v10 = [v5 metadataObjects];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
  double v12 = v9;
  double v13 = v8;
  double v14 = v7;
  double v15 = v6;
  if (v11)
  {
    uint64_t v16 = v11;
    uint64_t v17 = *(void *)v51;
    double v12 = v9;
    double v13 = v8;
    double v14 = v7;
    double v15 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(v10);
        }
        double v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(CAMPreviewView *)self faceIndicatorFrameForFaceResult:v19];
          double v15 = v20;
          double v14 = v21;
          double v13 = v22;
          double v12 = v23;
        }
        else if ((objc_opt_respondsToSelector() & 1) != 0 && ([v19 syntheticFocusMode] & 3) != 0)
        {
          [(CAMPreviewView *)self frameForMetadataObjectResult:v19];
          double v15 = v24;
          double v14 = v25;
          double v13 = v26;
          double v12 = v27;
          goto LABEL_14;
        }
      }
      uint64_t v16 = [v10 countByEnumeratingWithState:&v50 objects:v54 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  v56.origin.double x = v15;
  v56.origin.double y = v14;
  v56.size.double width = v13;
  v56.size.double height = v12;
  v58.origin.double x = v6;
  v58.origin.double y = v7;
  v58.size.double width = v8;
  v58.size.double height = v9;
  if (CGRectEqualToRect(v56, v58))
  {
    double v28 = [v5 metadataObjects];
    double v29 = [v28 firstObject];
    [(CAMPreviewView *)self frameForMetadataObjectResult:v29];
    double v15 = v30;
    double v14 = v31;
    double v13 = v32;
    double v12 = v33;
  }
  if (width > 0.0 && height > 0.0)
  {
    double v34 = width - v13;
    if (v13 >= width) {
      double v34 = 0.0;
    }
    double v15 = v15 - v34;
    if (v13 < width) {
      double v13 = width;
    }
    double v35 = height - v12;
    if (v12 >= height) {
      double v35 = 0.0;
    }
    double v14 = v14 - v35;
    if (v12 < height) {
      double v12 = height;
    }
  }
  -[CAMPreviewView _frameClampedToBounds:](self, "_frameClampedToBounds:", v15, v14, v13, v12, *(void *)&height);
  UIRectIntegralWithScale();
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  double v43 = v42;

  double v44 = v37;
  double v45 = v39;
  double v46 = v41;
  double v47 = v43;
  result.size.double height = v47;
  result.size.double width = v46;
  result.origin.double y = v45;
  result.origin.double x = v44;
  return result;
}

- (int)_faceOrientationForRollAngle:(double)a3
{
  if (a3 == 3.40282347e38) {
    a3 = 0.0;
  }
  double v3 = _nearestRoundedAngleForAngle(a3);
  if (v3 == 90.0) {
    return 1;
  }
  int result = 3;
  if (v3 != 0.0 && v3 != 360.0) {
    return 2 * (v3 == 180.0);
  }
  return result;
}

- (CGRect)_aspectFaceRectFromSquareFaceRect:(CGRect)a3 angle:(double)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  unsigned int v9 = [(CAMPreviewView *)self _faceOrientationForRollAngle:a4];
  unsigned int v10 = v9;
  if (v9 - 2 < 2)
  {
    double v16 = width * 1.6;
    [(CAMPreviewView *)self frame];
    double v19 = v18;
    double v20 = [(CAMPreviewView *)self traitCollection];
    [v20 displayScale];
    double v22 = v19 * v21;

    if (width * 1.6 >= v22) {
      double v16 = v22;
    }
    double v15 = v16 * 0.8;
    double v23 = (v16 - width) / 1.6;
    double v24 = [(CAMPreviewView *)self videoPreviewLayer];
    double v25 = [v24 connection];
    int v26 = [v25 isVideoMirrored];

    if (v26)
    {
      if (v10 == 3) {
        goto LABEL_16;
      }
    }
    else if (v10 != 3)
    {
LABEL_16:
      double x = x - v23;
      double y = y + (v15 - height) * -0.5;
      goto LABEL_17;
    }
    double v23 = v16 - v23 - width;
    goto LABEL_16;
  }
  if (v9 > 1)
  {
    double v15 = height;
    double v16 = width;
  }
  else
  {
    [(CAMPreviewView *)self frame];
    double v12 = v11;
    double v13 = [(CAMPreviewView *)self traitCollection];
    [v13 displayScale];
    double v15 = v12 * v14;

    if (height * 1.6 < v15) {
      double v15 = height * 1.6;
    }
    double v16 = v15 * 0.8;
    double v17 = (v15 - height) / 1.6;
    if (v10) {
      double v17 = v15 - v17 - height;
    }
    double y = y - v17;
    double x = x + (v16 - width) * -0.5;
  }
LABEL_17:
  double v27 = x;
  double v28 = y;
  double v29 = v16;
  double v30 = v15;
  result.size.double height = v30;
  result.size.double width = v29;
  result.origin.double y = v28;
  result.origin.double x = v27;
  return result;
}

- (void)setNormalizedZoomPIPRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v21 = *MEMORY[0x263EF8340];
  p_normalizedZoomPIPRect = &self->_normalizedZoomPIPRect;
  if (!CGRectEqualToRect(self->_normalizedZoomPIPRect, a3))
  {
    p_normalizedZoomPIPRect->origin.CGFloat x = x;
    p_normalizedZoomPIPRect->origin.CGFloat y = y;
    p_normalizedZoomPIPRect->size.CGFloat width = width;
    p_normalizedZoomPIPRect->size.CGFloat height = height;
    if ([(CAMPreviewView *)self _isZoomPIPRectValid])
    {
      unsigned int v9 = [(CAMPreviewView *)self _indicatorContainerMask];

      if (v9)
      {
        [(CAMPreviewView *)self _updateIndicatorContainerMask];
      }
      else
      {
        id v13 = objc_alloc_init(MEMORY[0x263F15880]);
        [v13 setFillRule:*MEMORY[0x263F15AC0]];
        id v14 = [MEMORY[0x263F825C8] whiteColor];
        objc_msgSend(v13, "setFillColor:", objc_msgSend(v14, "CGColor"));

        [(CAMPreviewView *)self _setIndicatorContainerMask:v13];
        double v15 = [(CAMPreviewView *)self indicatorContainerView];
        double v16 = [v15 layer];
        [v16 setMask:v13];

        [(CAMPreviewView *)self setNeedsLayout];
      }
    }
    else if (self->__indicatorContainerMask)
    {
      unsigned int v10 = [(CAMPreviewView *)self indicatorContainerView];
      double v11 = [v10 layer];
      [v11 setMask:0];

      indicatorContainerMask = self->__indicatorContainerMask;
      self->__indicatorContainerMask = 0;
    }
    if ([(CAMPreviewView *)self _debugDrawZoomPIP])
    {
      double v17 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        v22.origin.CGFloat x = x;
        v22.origin.CGFloat y = y;
        v22.size.CGFloat width = width;
        v22.size.CGFloat height = height;
        double v18 = NSStringFromCGRect(v22);
        int v19 = 138543362;
        double v20 = v18;
        _os_log_impl(&dword_2099F8000, v17, OS_LOG_TYPE_DEFAULT, "---- Normalized Zoom PIP rect: %{public}@", (uint8_t *)&v19, 0xCu);
      }
      [(CAMPreviewView *)self _drawZoomPIP];
    }
  }
}

- (BOOL)_isZoomPIPRectValid
{
  [(CAMPreviewView *)self normalizedZoomPIPRect];
  return !CGRectIsEmpty(v3);
}

- (void)_updateIndicatorContainerMask
{
  id v13 = [(CAMPreviewView *)self _indicatorContainerMask];
  if (v13)
  {
    CGRect v3 = [(CAMPreviewView *)self videoPreviewLayer];
    [(CAMPreviewView *)self normalizedZoomPIPRect];
    objc_msgSend(v3, "rectForMetadataOutputRectOfInterest:");
    objc_msgSend(v3, "convertRect:toLayer:", v13);
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    Mutable = CGPathCreateMutable();
    [v13 bounds];
    CGPathAddRect(Mutable, 0, v15);
    v16.origin.CGFloat x = v5;
    v16.origin.CGFloat y = v7;
    v16.size.CGFloat width = v9;
    v16.size.CGFloat height = v11;
    CGPathAddRect(Mutable, 0, v16);
    [v13 setPath:Mutable];
    CGPathRelease(Mutable);
  }
}

- (void)_drawZoomPIP
{
  id v26 = [(CAMPreviewView *)self viewWithTag:86832];
  if ([(CAMPreviewView *)self _isZoomPIPRectValid])
  {
    CGRect v3 = [(CAMPreviewView *)self videoPreviewLayer];
    double v4 = [(CAMPreviewView *)self indicatorContainerView];
    [(CAMPreviewView *)self normalizedZoomPIPRect];
    objc_msgSend(v3, "rectForMetadataOutputRectOfInterest:");
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [v4 layer];
    objc_msgSend(v3, "convertRect:toLayer:", v13, v6, v8, v10, v12);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v28.origin.CGFloat x = v15;
    v28.origin.CGFloat y = v17;
    v28.size.CGFloat width = v19;
    v28.size.CGFloat height = v21;
    CGRect v29 = CGRectInset(v28, -1.0, -1.0);
    if (v26)
    {
      objc_msgSend(v26, "setFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
    }
    else
    {
      id v26 = (id)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v29.origin.x, v29.origin.y, v29.size.width, v29.size.height);
      [v26 setTag:86832];
      id v22 = [MEMORY[0x263F825C8] redColor];
      uint64_t v23 = [v22 CGColor];
      double v24 = [v26 layer];
      [v24 setBorderColor:v23];

      double v25 = [v26 layer];
      [v25 setBorderWidth:1.0];

      [v4 addSubview:v26];
    }
  }
  else
  {
    [v26 removeFromSuperview];
  }
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (CGRect)viewportFrame
{
  double x = self->_viewportFrame.origin.x;
  double y = self->_viewportFrame.origin.y;
  double width = self->_viewportFrame.size.width;
  double height = self->_viewportFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)overlayFrame
{
  double x = self->_overlayFrame.origin.x;
  double y = self->_overlayFrame.origin.y;
  double width = self->_overlayFrame.size.width;
  double height = self->_overlayFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CAMInterfaceModulationView)indicatorContainerView
{
  return self->_indicatorContainerView;
}

- (int64_t)indicatorClippingStyle
{
  return self->_indicatorClippingStyle;
}

- (CAMFocusIndicatorView)externalFocusLockIndicator
{
  return self->_externalFocusLockIndicator;
}

- (CAMHorizonLevelView)horizonLevelView
{
  return self->_horizonLevelView;
}

- (CGRect)normalizedZoomPIPRect
{
  double x = self->_normalizedZoomPIPRect.origin.x;
  double y = self->_normalizedZoomPIPRect.origin.y;
  double width = self->_normalizedZoomPIPRect.size.width;
  double height = self->_normalizedZoomPIPRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UILabel)_simulatorLabel
{
  return self->__simulatorLabel;
}

- (int)_exposureBiasSide
{
  return self->__exposureBiasSide;
}

- (void)set_exposureBiasSide:(int)a3
{
  self->__exposureBiasSide = a3;
}

- (CAShapeLayer)_indicatorContainerMask
{
  return self->__indicatorContainerMask;
}

- (void)_setIndicatorContainerMask:(id)a3
{
}

- (BOOL)_debugDrawZoomPIP
{
  return self->__debugDrawZoomPIP;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__indicatorContainerMask, 0);
  objc_storeStrong((id *)&self->__simulatorLabel, 0);
  objc_storeStrong((id *)&self->_stageLightOverlayView, 0);
  objc_storeStrong((id *)&self->_centeredSubjectIndicatorView, 0);
  objc_storeStrong((id *)&self->_externalFocusLockIndicator, 0);
  objc_storeStrong((id *)&self->_pointIndicator, 0);
  objc_storeStrong((id *)&self->_continuousIndicator, 0);
  objc_storeStrong((id *)&self->_indicatorContainerView, 0);
  objc_storeStrong((id *)&self->_videoPreviewView, 0);
}

@end