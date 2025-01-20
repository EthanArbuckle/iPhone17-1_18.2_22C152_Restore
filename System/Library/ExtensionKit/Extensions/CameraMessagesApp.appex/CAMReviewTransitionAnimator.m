@interface CAMReviewTransitionAnimator
- ($E927905399350D4C972495EAC2D81E51)_sendGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5;
- ($E927905399350D4C972495EAC2D81E51)_shutterGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5;
- (CAMCameraViewController)cameraViewController;
- (CAMReviewTransitionAnimatorDelegate)delegate;
- (CAMShutterButtonSpec)_cameraButtonShutterSpecForLayoutStyle:(SEL)a3;
- (CAMShutterButtonSpec)_sendButtonShutterSpecForSendBounds:(SEL)a3;
- (CFXCameraViewController)funCamViewController;
- (CGAffineTransform)_sendImageTransformOrientation:(SEL)a3;
- (PUAssetExplorerReviewScreenViewController)reviewViewController;
- (double)transitionDuration:(id)a3;
- (id)_buttonColorForMode:(int64_t)a3;
- (int64_t)_captureMode;
- (int64_t)_layoutStyle;
- (unint64_t)transitionDirection;
- (void)_finishTransitionWithContext:(id)a3;
- (void)_prepareTransitionWithContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)setCameraViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFunCamViewController:(id)a3;
- (void)setReviewViewController:(id)a3;
- (void)setTransitionDirection:(unint64_t)a3;
@end

@implementation CAMReviewTransitionAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  v5 = [v4 viewForKey:UITransitionContextToViewKey];
  v6 = [v4 containerView];
  unsigned int v7 = [v4 isAnimated];
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_msgSend(v5, "setFrame:");
  [v6 addSubview:v5];
  [(CAMReviewTransitionAnimator *)self _prepareTransitionWithContext:v4];
  if (v7)
  {
    v16 = [v6 window];
    v17 = [v16 screen];
    [v17 scale];
    double v19 = v18;

    v20 = [v6 window];
    id v21 = [v20 _windowInterfaceOrientation];

    long long v74 = 0u;
    long long v75 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    -[CAMReviewTransitionAnimator _shutterGeometryForReferenceBounds:orientation:screenScale:](self, "_shutterGeometryForReferenceBounds:orientation:screenScale:", v21, v9, v11, v13, v15, v19);
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    -[CAMReviewTransitionAnimator _sendGeometryForReferenceBounds:orientation:screenScale:](self, "_sendGeometryForReferenceBounds:orientation:screenScale:", v21, v9, v11, v13, v15, v19);
    unint64_t v22 = [(CAMReviewTransitionAnimator *)self transitionDirection];
    uint64_t v63 = 0;
    long long v61 = 0u;
    long long v62 = 0u;
    [(CAMReviewTransitionAnimator *)self _cameraButtonShutterSpecForLayoutStyle:[(CAMReviewTransitionAnimator *)self _layoutStyle]];
    uint64_t v60 = 0;
    long long v58 = 0u;
    long long v59 = 0u;
    -[CAMReviewTransitionAnimator _sendButtonShutterSpecForSendBounds:](self, "_sendButtonShutterSpecForSendBounds:", (unsigned __int128)0, (unsigned __int128)0);
    if (v22)
    {
      long long v55 = v58;
      long long v56 = v59;
      uint64_t v57 = v60;
      v23 = &v61;
    }
    else
    {
      long long v55 = v61;
      long long v56 = v62;
      uint64_t v57 = v63;
      v23 = &v58;
    }
    long long v24 = v23[1];
    long long v52 = *v23;
    long long v53 = v24;
    uint64_t v54 = *((void *)v23 + 4);
    if (v22) {
      double v25 = 1.0;
    }
    else {
      double v25 = 0.0;
    }
    if (v22) {
      double v26 = 0.0;
    }
    else {
      double v26 = 1.0;
    }
    v27 = objc_alloc_init(CAMReviewTransitionButton);
    v50[0] = v55;
    v50[1] = v56;
    uint64_t v51 = v57;
    [(CAMReviewTransitionButton *)v27 configureWithShutterButtonSpec:v50];
    -[CAMReviewTransitionButton setCenter:](v27, "setCenter:", 0.0, 0.0);
    v28 = [(CAMReviewTransitionAnimator *)self _buttonColorForMode:[(CAMReviewTransitionAnimator *)self _captureMode]];
    v29 = [(CAMReviewTransitionButton *)v27 innerCircle];
    [v29 setBackgroundColor:v28];

    v30 = [(CAMReviewTransitionButton *)v27 imageView];
    [v30 setAlpha:v25];

    v31 = +[NSBundle bundleForClass:objc_opt_class()];
    v32 = +[UIImage imageNamed:@"CAMMessagesSendButton" inBundle:v31];
    v33 = [(CAMReviewTransitionButton *)v27 imageView];
    [v33 setImage:v32];

    [(CAMReviewTransitionAnimator *)self _sendImageTransformOrientation:v21];
    v34 = [(CAMReviewTransitionButton *)v27 imageView];
    v49[0] = v49[3];
    v49[1] = v49[4];
    v49[2] = v49[5];
    [v34 setTransform:v49];

    [v6 addSubview:v27];
    [v5 setAlpha:0.0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000093D8;
    v40[3] = &unk_100014878;
    v41 = v27;
    long long v43 = v52;
    long long v44 = v53;
    uint64_t v45 = v54;
    double v46 = v26;
    uint64_t v47 = 0;
    uint64_t v48 = 0;
    id v42 = v5;
    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_10000945C;
    v36[3] = &unk_1000148A0;
    v37 = v41;
    id v38 = v4;
    v39 = self;
    v35 = v41;
    +[UIView animateWithDuration:0 delay:v40 usingSpringWithDamping:v36 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
  }
}

- (void)_prepareTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v12 = [(CAMReviewTransitionAnimator *)self reviewViewController];
  v5 = [v12 reviewBarsModel];
  [v5 performChanges:&stru_1000148E0];
  id v6 = [v4 isAnimated];

  unsigned int v7 = [(CAMReviewTransitionAnimator *)self cameraViewController];
  unint64_t v8 = [(CAMReviewTransitionAnimator *)self transitionDirection];
  if (v8) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 2;
  }
  if (v8) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = 3;
  }
  [v7 setMessagesTransitionState:v9 animated:v6];
  double v11 = [(CAMReviewTransitionAnimator *)self funCamViewController];
  [v11 setTransitionState:v10 animated:v6];
}

- (void)_finishTransitionWithContext:(id)a3
{
  id v9 = a3;
  id v4 = [(CAMReviewTransitionAnimator *)self reviewViewController];
  v5 = [v4 reviewBarsModel];
  [v5 performChanges:&stru_100014900];
  id v6 = [(CAMReviewTransitionAnimator *)self cameraViewController];
  if ((id)[(CAMReviewTransitionAnimator *)self transitionDirection] == (id)1)
  {
    id v7 = [v9 isAnimated];
    [v6 setMessagesTransitionState:0 animated:v7];
    unint64_t v8 = [(CAMReviewTransitionAnimator *)self funCamViewController];
    [v8 setTransitionState:0 animated:v7];
  }
  else if (![(CAMReviewTransitionAnimator *)self transitionDirection])
  {
    objc_msgSend(v6, "setMessagesTransitionState:animated:", 3, objc_msgSend(v9, "isAnimated"));
  }
}

- (int64_t)_captureMode
{
  v3 = [(CAMReviewTransitionAnimator *)self cameraViewController];

  if (v3)
  {
    id v4 = [(CAMReviewTransitionAnimator *)self cameraViewController];
    id v5 = [v4 captureMode];

    return (int64_t)v5;
  }
  else
  {
    id v7 = [(CAMReviewTransitionAnimator *)self funCamViewController];

    if (v7)
    {
      unint64_t v8 = [(CAMReviewTransitionAnimator *)self funCamViewController];
      id v9 = [v8 mode];

      return v9 == (id)2;
    }
    else
    {
      return 0;
    }
  }
}

- (id)_buttonColorForMode:(int64_t)a3
{
  if ((unint64_t)a3 <= 9 && ((1 << a3) & 0x1A6) != 0)
  {
    v3 = +[UIColor colorWithRed:0.961 green:0.2 blue:0.2 alpha:1.0];
  }
  else
  {
    v3 = +[UIColor whiteColor];
  }

  return v3;
}

- (int64_t)_layoutStyle
{
  v2 = [(CAMReviewTransitionAnimator *)self cameraViewController];
  v3 = [v2 view];
  int64_t v4 = CAMLayoutStyleForView();

  return v4;
}

- ($E927905399350D4C972495EAC2D81E51)_shutterGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5
{
  +[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", [(CAMReviewTransitionAnimator *)self _layoutStyle], a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, a6);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tx = 0u;

  return ($E927905399350D4C972495EAC2D81E51 *)+[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", a5);
}

- ($E927905399350D4C972495EAC2D81E51)_sendGeometryForReferenceBounds:(SEL)a3 orientation:(CGRect)a4 screenScale:(int64_t)a5
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  +[PUReviewScreenUtilities reviewScreenControlBarFrameForReferenceBounds:](PUReviewScreenUtilities, "reviewScreenControlBarFrameForReferenceBounds:");
  double v27 = v14;
  double v28 = v15;
  double v17 = v16;
  double v19 = v18;
  +[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", [(CAMReviewTransitionAnimator *)self _layoutStyle], x, y, width, height, a6);
  UIRectGetCenter();
  double v22 = v20;
  double v23 = v21;
  if (v19 <= v17)
  {
    +[PUReviewScreenControlBar sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:](PUReviewScreenControlBar, "sendButtonAlignmentRectInHorizontalBounds:relativeCenterAlignmentPoint:", v27, v28, v17, v19, v20, v21);
  }
  else
  {
    long long v24 = [(CAMReviewTransitionAnimator *)self delegate];
    id v25 = [v24 availableControlsCountForReviewTransition:self];

    +[PUReviewScreenControlBar sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:](PUReviewScreenControlBar, "sendButtonAlignmentRectInVerticalBounds:relativeCenterAlignmentPoint:controlsCount:", v25, v27, v28, v17, v19, v22, v23);
  }
  *(_OWORD *)&retstr->var2.c = 0u;
  *(_OWORD *)&retstr->var2.tdouble x = 0u;
  retstr->var1 = 0u;
  *(_OWORD *)&retstr->var2.a = 0u;
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;

  return ($E927905399350D4C972495EAC2D81E51 *)+[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", a5);
}

- (CGAffineTransform)_sendImageTransformOrientation:(SEL)a3
{
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&retstr->c = v6;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  id v7 = +[UIDevice currentDevice];
  id v8 = [v7 userInterfaceIdiom];

  if (v8 != (id)1)
  {
    switch(a4)
    {
      case 1:
        double v10 = 0.0;
        break;
      case 3:
        double v10 = 1.57079633;
        break;
      case 4:
        double v10 = -1.57079633;
        break;
      default:
        double v10 = 3.14159265;
        if (a4 != 2) {
          double v10 = 0.0;
        }
        break;
    }
    double v11 = -v10;
    return CGAffineTransformMakeRotation(retstr, v11);
  }
  return result;
}

- (CAMShutterButtonSpec)_cameraButtonShutterSpecForLayoutStyle:(SEL)a3
{
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  long long v6 = +[CAMCaptureCapabilities capabilities];
  unsigned int v7 = [v6 isCTMSupported];

  if (v7) {
    result = (CAMShutterButtonSpec *)+[CAMDynamicShutterControl shutterButtonSpecForLayoutStyle:a4];
  }
  else {
    result = (CAMShutterButtonSpec *)CAMShutterButtonSpecForLayoutStyle();
  }
  long long v9 = v11;
  *(_OWORD *)&retstr->var0 = v10;
  *(_OWORD *)&retstr->var2 = v9;
  retstr->var4 = v12;
  return result;
}

- (CAMShutterButtonSpec)_sendButtonShutterSpecForSendBounds:(SEL)a3
{
  double width = a4.size.width;
  retstr->var4 = 0.0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  result = (CAMShutterButtonSpec *)CAMShutterButtonSpecMake();
  if (width > 60.0)
  {
    retstr->var1 = 6.0;
    retstr->var4 = 2.5;
  }
  return result;
}

- (unint64_t)transitionDirection
{
  return self->_transitionDirection;
}

- (void)setTransitionDirection:(unint64_t)a3
{
  self->_transitionDirection = a3;
}

- (CAMReviewTransitionAnimatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CAMReviewTransitionAnimatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CAMCameraViewController)cameraViewController
{
  return self->_cameraViewController;
}

- (void)setCameraViewController:(id)a3
{
}

- (PUAssetExplorerReviewScreenViewController)reviewViewController
{
  return self->_reviewViewController;
}

- (void)setReviewViewController:(id)a3
{
}

- (CFXCameraViewController)funCamViewController
{
  return self->_funCamViewController;
}

- (void)setFunCamViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_funCamViewController, 0);
  objc_storeStrong((id *)&self->_reviewViewController, 0);
  objc_storeStrong((id *)&self->_cameraViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end