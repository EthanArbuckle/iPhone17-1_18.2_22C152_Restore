@interface ZWZoomPIPLensViewController
- (AXAssertion)disableDashBoardSystemGesturesAssertion;
- (BOOL)_shouldDisableLensEffectsForStandbyMode;
- (BOOL)_shouldRoundLensCorners;
- (BOOL)_sufficientSpaceExistsForGrabber:(id)a3;
- (BOOL)isInLensResizingMode;
- (BOOL)offsetZoomWindow;
- (CGPoint)_lensDragMultiplier;
- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3;
- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4;
- (NSLayoutConstraint)bottomChromeGrabberDragConstraint;
- (NSLayoutConstraint)leftChromeGrabberDragConstraint;
- (NSLayoutConstraint)rightChromeGrabberDragConstraint;
- (NSLayoutConstraint)topChromeGrabberDragConstraint;
- (ZWLensChromeGrabberView)activeGrabber;
- (ZWLensChromeGrabberView)bottomChromeGrabberView;
- (ZWLensChromeGrabberView)leftChromeGrabberView;
- (ZWLensChromeGrabberView)rightChromeGrabberView;
- (ZWLensChromeGrabberView)topChromeGrabberView;
- (ZWLensChromeView)lensChromeView;
- (ZWZoomPIPLensViewControllerDelegate)pipDelegate;
- (id)_activeGrabberForTouchAtLocation:(CGPoint)a3;
- (id)_defaultGrabberForAxis:(int64_t)a3;
- (id)_secondaryGrabberForAxis:(int64_t)a3;
- (id)grabberViews;
- (id)identifier;
- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4;
- (int64_t)activeResizeHandle;
- (int64_t)lensEdgeForTouchAtLocation:(CGPoint)a3;
- (void)_applyInitialLayoutConstraints;
- (void)_collapseNonactiveGrabbers;
- (void)_handleLongPress:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_trackActiveGrabberWithTouchAtLocation:(CGPoint)a3;
- (void)_updateActiveGrabberDragConstraintWithOffset:(CGPoint)a3;
- (void)_updateActiveResizeHandleForTouchOnChromeAtLocation:(CGPoint)a3;
- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)loadView;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillBeginDragging:(id)a3;
- (void)setActiveGrabber:(id)a3;
- (void)setActiveResizeHandle:(int64_t)a3;
- (void)setBottomChromeGrabberDragConstraint:(id)a3;
- (void)setBottomChromeGrabberView:(id)a3;
- (void)setDisableDashBoardSystemGesturesAssertion:(id)a3;
- (void)setInLensResizingMode:(BOOL)a3;
- (void)setLeftChromeGrabberDragConstraint:(id)a3;
- (void)setLeftChromeGrabberView:(id)a3;
- (void)setLensChromeView:(id)a3;
- (void)setOffsetZoomWindow:(BOOL)a3;
- (void)setPipDelegate:(id)a3;
- (void)setRightChromeGrabberDragConstraint:(id)a3;
- (void)setRightChromeGrabberView:(id)a3;
- (void)setTopChromeGrabberDragConstraint:(id)a3;
- (void)setTopChromeGrabberView:(id)a3;
- (void)updateLensChromeAnimated:(BOOL)a3;
- (void)updateVisibleGrabbersAnimated:(BOOL)a3;
@end

@implementation ZWZoomPIPLensViewController

- (void)loadView
{
  v11.receiver = self;
  v11.super_class = (Class)ZWZoomPIPLensViewController;
  [(ZWZoomLensViewController *)&v11 loadView];
  v3 = [(ZWZoomPIPLensViewController *)self view];
  v4 = -[ZWLensChromeView initWithFrame:]([ZWLensChromeView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(ZWZoomPIPLensViewController *)self setLensChromeView:v4];
  [(ZWLensChromeView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(ZWZoomPIPLensViewController *)self view];
  v6 = [v5 layer];
  [v6 setMasksToBounds:0];

  [v3 addSubview:v4];
  v7 = [[ZWLensChromeGrabberView alloc] initWithEdge:0 startExpanded:0];
  [(ZWLensChromeGrabberView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ZWZoomPIPLensViewController *)self setTopChromeGrabberView:v7];
  [v3 addSubview:v7];
  v8 = [[ZWLensChromeGrabberView alloc] initWithEdge:1 startExpanded:0];
  [(ZWLensChromeGrabberView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ZWZoomPIPLensViewController *)self setRightChromeGrabberView:v8];
  [v3 addSubview:v8];
  v9 = [[ZWLensChromeGrabberView alloc] initWithEdge:2 startExpanded:0];
  [(ZWLensChromeGrabberView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ZWZoomPIPLensViewController *)self setBottomChromeGrabberView:v9];
  [v3 addSubview:v9];
  v10 = [[ZWLensChromeGrabberView alloc] initWithEdge:3 startExpanded:0];
  [(ZWLensChromeGrabberView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ZWZoomPIPLensViewController *)self setLeftChromeGrabberView:v10];
  [v3 addSubview:v10];
  [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:0];
}

- (void)_applyInitialLayoutConstraints
{
  v47.receiver = self;
  v47.super_class = (Class)ZWZoomPIPLensViewController;
  [(ZWZoomLensViewController *)&v47 _applyInitialLayoutConstraints];
  v3 = [(ZWZoomPIPLensViewController *)self view];
  v42 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
  uint64_t v4 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
  v5 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
  v43 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
  v6 = [(ZWZoomPIPLensViewController *)self lensChromeView];
  v45 = [(ZWZoomLensViewController *)self lensZoomView];
  CFStringRef v49 = @"negativePad";
  v7 = +[NSNumber numberWithDouble:-ZWLensOuterBorderWidth()];
  v50 = v7;
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:&v50 forKeys:&v49 count:1];

  v44 = (void *)v4;
  v9 = _NSDictionaryOfVariableBindings(@"lensChromeView, leftGrabber, rightGrabber", v6, v43, v4, 0);
  v46 = (void *)v8;
  v10 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|[leftGrabber]-negativePad-[lensChromeView]-negativePad-[rightGrabber]|", 0, v8, v9);
  [v3 addConstraints:v10];

  objc_super v11 = _NSDictionaryOfVariableBindings(@"lensChromeView, topGrabber, bottomGrabber", v6, v42, v5, 0);
  v12 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"V:|[topGrabber]-negativePad-[lensChromeView]-negativePad-[bottomGrabber]|", 0, v8, v11);
  [v3 addConstraints:v12];

  v13 = +[NSLayoutConstraint constraintWithItem:v42 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];
  [(ZWZoomPIPLensViewController *)self setTopChromeGrabberDragConstraint:v13];

  v14 = [(ZWZoomPIPLensViewController *)self topChromeGrabberDragConstraint];
  LODWORD(v15) = 1148829696;
  [v14 setPriority:v15];

  v16 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
  [(ZWZoomPIPLensViewController *)self setRightChromeGrabberDragConstraint:v16];

  v17 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberDragConstraint];
  LODWORD(v18) = 1148829696;
  [v17 setPriority:v18];

  v19 = +[NSLayoutConstraint constraintWithItem:v5 attribute:9 relatedBy:0 toItem:v6 attribute:9 multiplier:1.0 constant:0.0];
  [(ZWZoomPIPLensViewController *)self setBottomChromeGrabberDragConstraint:v19];

  v20 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberDragConstraint];
  LODWORD(v21) = 1148829696;
  [v20 setPriority:v21];

  v22 = +[NSLayoutConstraint constraintWithItem:v43 attribute:10 relatedBy:0 toItem:v6 attribute:10 multiplier:1.0 constant:0.0];
  [(ZWZoomPIPLensViewController *)self setLeftChromeGrabberDragConstraint:v22];

  v23 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberDragConstraint];
  LODWORD(v24) = 1148829696;
  [v23 setPriority:v24];

  v25 = [(ZWZoomPIPLensViewController *)self topChromeGrabberDragConstraint];
  v48[0] = v25;
  v26 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberDragConstraint];
  v48[1] = v26;
  v27 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberDragConstraint];
  v48[2] = v27;
  v28 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberDragConstraint];
  v48[3] = v28;
  v29 = +[NSArray arrayWithObjects:v48 count:4];
  [v3 addConstraints:v29];

  v30 = +[NSLayoutConstraint constraintWithItem:v42 attribute:1 relatedBy:1 toItem:v6 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v30];

  v31 = +[NSLayoutConstraint constraintWithItem:v42 attribute:2 relatedBy:-1 toItem:v6 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v31];

  v32 = +[NSLayoutConstraint constraintWithItem:v5 attribute:1 relatedBy:1 toItem:v6 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v32];

  v33 = +[NSLayoutConstraint constraintWithItem:v5 attribute:2 relatedBy:-1 toItem:v6 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v33];

  v34 = +[NSLayoutConstraint constraintWithItem:v43 attribute:3 relatedBy:1 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v34];

  v35 = +[NSLayoutConstraint constraintWithItem:v43 attribute:4 relatedBy:-1 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v35];

  v36 = +[NSLayoutConstraint constraintWithItem:v44 attribute:3 relatedBy:1 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v36];

  v37 = +[NSLayoutConstraint constraintWithItem:v44 attribute:4 relatedBy:-1 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v37];

  v38 = +[NSLayoutConstraint constraintWithItem:v45 attribute:1 relatedBy:0 toItem:v6 attribute:1 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v38];

  v39 = +[NSLayoutConstraint constraintWithItem:v45 attribute:2 relatedBy:0 toItem:v6 attribute:2 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v39];

  v40 = +[NSLayoutConstraint constraintWithItem:v45 attribute:3 relatedBy:0 toItem:v6 attribute:3 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v40];

  v41 = +[NSLayoutConstraint constraintWithItem:v45 attribute:4 relatedBy:0 toItem:v6 attribute:4 multiplier:1.0 constant:0.0];
  [v3 addConstraint:v41];
}

- (id)identifier
{
  return AXZoomLensModeWindow;
}

- (void)updateLensChromeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController updateLensChromeAnimated:](&v5, "updateLensChromeAnimated:");
  [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:v3];
}

- (BOOL)_shouldRoundLensCorners
{
  return ![(ZWZoomLensViewController *)self inStandbyMode];
}

- (void)_updateLensChromeVisibility:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  id v8 = a5;
  [(ZWZoomPIPLensViewController *)self updateLensChromeAnimated:v5];
  v9 = [(ZWZoomPIPLensViewController *)self lensChromeView];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = __79__ZWZoomPIPLensViewController__updateLensChromeVisibility_animated_completion___block_invoke;
  v11[3] = &unk_78CF8;
  id v12 = v8;
  id v10 = v8;
  [v9 updateChromeVisibility:v6 animated:v5 completion:v11];
}

uint64_t __79__ZWZoomPIPLensViewController__updateLensChromeVisibility_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_shouldDisableLensEffectsForStandbyMode
{
  return 1;
}

- (CGPoint)maximumPanOffsetWithZoomFactor:(double)a3
{
  BOOL v5 = [(ZWZoomLensViewController *)self lensZoomView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;

  id v10 = [(ZWZoomLensViewController *)self lensZoomView];
  [v10 sampledContentSizeWithZoomFactor:a3];
  double v12 = v11;
  double v14 = v13;

  double v15 = (v7 - v12) * 0.5;
  double v16 = (v9 - v14) * 0.5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (void)setInLensResizingMode:(BOOL)a3
{
  if (self->_inLensResizingMode != a3)
  {
    BOOL v3 = a3;
    self->_inLensResizingMode = a3;
    BOOL v5 = [(ZWZoomPIPLensViewController *)self lensChromeView];
    [v5 showLensResizingHandles:v3 animated:1];

    double v6 = [(ZWZoomLensViewController *)self lensZoomView];
    [v6 showLensResizingHandlesShowing:v3];

    [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:1];
  }
}

- (void)_updateActiveResizeHandleForTouchOnChromeAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(ZWZoomPIPLensViewController *)self isInLensResizingMode])
  {
    int64_t v6 = -[ZWZoomPIPLensViewController lensEdgeForTouchAtLocation:](self, "lensEdgeForTouchAtLocation:", x, y);
    [(ZWZoomPIPLensViewController *)self setActiveResizeHandle:v6];
  }
}

- (int64_t)lensEdgeForTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  int64_t v6 = [(ZWZoomPIPLensViewController *)self view];
  double v7 = [(ZWZoomPIPLensViewController *)self lensChromeView];
  objc_msgSend(v6, "convertPoint:toView:", v7, x, y);
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  double v12 = ZWZoomLensBorderThicknessForTouches();
  double v13 = [(ZWZoomPIPLensViewController *)self lensChromeView];
  [v13 bounds];
  double v15 = v14;
  CGFloat rect_24 = v16;
  CGFloat v39 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;

  CGFloat v22 = v15 - v12;
  CGFloat v23 = v17 - v12;
  double v24 = v19;
  CGFloat rect_8 = v19;
  CGFloat v25 = v19 + v12 * 2.0;
  CGFloat v26 = v12 + v12;
  CGFloat v27 = v21 + v12 * 2.0;
  CGFloat rect = v24 + v22;
  v45.origin.double x = v22;
  v45.origin.double y = v23;
  v45.size.width = v25;
  v45.size.height = v26;
  v40.double x = v9;
  v40.double y = v11;
  BOOL v28 = CGRectContainsPoint(v45, v40);
  v46.origin.double x = v22;
  v46.origin.double y = v21 + v23;
  v46.size.width = v25;
  v46.size.height = v26;
  v41.double x = v9;
  v41.double y = v11;
  BOOL v29 = CGRectContainsPoint(v46, v41);
  v47.origin.double x = v22;
  v47.origin.double y = v23;
  v47.size.width = v26;
  v47.size.height = v27;
  v42.double x = v9;
  v42.double y = v11;
  BOOL v30 = CGRectContainsPoint(v47, v42);
  v48.origin.double x = rect;
  v48.origin.double y = v23;
  v48.size.width = v26;
  v48.size.height = v27;
  v43.double x = v9;
  v43.double y = v11;
  BOOL v31 = CGRectContainsPoint(v48, v43);
  v49.origin.double y = rect_24;
  v49.origin.double x = v39;
  v49.size.width = rect_8;
  v49.size.height = v21;
  v44.double x = v9;
  v44.double y = v11;
  LODWORD(result) = CGRectContainsPoint(v49, v44);
  if (v28 && v30) {
    return 2;
  }
  if (v28 && v31) {
    return 4;
  }
  if (v29 && v30) {
    return 8;
  }
  int64_t v33 = 5;
  if (v28) {
    int64_t v33 = 3;
  }
  int v34 = v29 && v31 || v28 || v31;
  if (v29 && v31) {
    int64_t v33 = 6;
  }
  uint64_t v35 = 9;
  if (v29) {
    uint64_t v35 = 7;
  }
  if (!v34) {
    int64_t v33 = v35;
  }
  if (v34 | (v29 || v30)) {
    return v33;
  }
  else {
    return result;
  }
}

- (void)setOffsetZoomWindow:(BOOL)a3
{
  BOOL v3 = a3;
  self->_offsetZoomWindow = a3;
  id v4 = [(ZWZoomLensViewController *)self lensZoomView];
  [v4 setOffsetZoomWindowFromFinger:v3];
}

- (id)grabberViews
{
  BOOL v3 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
  v9[0] = v3;
  id v4 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
  v9[1] = v4;
  BOOL v5 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
  v9[2] = v5;
  int64_t v6 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
  v9[3] = v6;
  double v7 = +[NSArray arrayWithObjects:v9 count:4];

  return v7;
}

- (id)_defaultGrabberForAxis:(int64_t)a3
{
  if (a3 == 2) {
    [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
  }
  else {
  BOOL v3 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
  }

  return v3;
}

- (id)_secondaryGrabberForAxis:(int64_t)a3
{
  if (a3 == 2) {
    [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
  }
  else {
  BOOL v3 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
  }

  return v3;
}

- (BOOL)_sufficientSpaceExistsForGrabber:(id)a3
{
  id v3 = a3;
  id v4 = [v3 window];
  [v3 bounds];
  objc_msgSend(v4, "convertRect:fromView:", v3);
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [v3 window];

  [v13 bounds];
  v16.origin.double x = v6;
  v16.origin.double y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  LOBYTE(v3) = CGRectContainsRect(v15, v16);

  return (char)v3;
}

- (id)_activeGrabberForTouchAtLocation:(CGPoint)a3
{
  id v4 = (char *)-[ZWZoomPIPLensViewController lensEdgeForTouchAtLocation:](self, "lensEdgeForTouchAtLocation:", a3.x, a3.y)- 1;
  double v5 = 0;
  switch((unint64_t)v4)
  {
    case 0uLL:
      break;
    case 1uLL:
      CGFloat v6 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
      unsigned int v7 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v6];

      if (v7) {
        goto LABEL_13;
      }
      goto LABEL_21;
    case 2uLL:
      CGRect v15 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
      unsigned int v16 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v15];

      if (!v16) {
        goto LABEL_23;
      }
      goto LABEL_13;
    case 3uLL:
      double v17 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
      unsigned int v18 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v17];

      if (!v18) {
        goto LABEL_15;
      }
LABEL_13:
      double v5 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
      break;
    case 4uLL:
      goto LABEL_15;
    case 5uLL:
      double v19 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
      unsigned int v20 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v19];

      if (v20) {
        goto LABEL_20;
      }
LABEL_15:
      double v21 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
      unsigned int v22 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v21];

      if (!v22) {
        goto LABEL_23;
      }
      double v5 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
      break;
    case 6uLL:
      CGFloat v23 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
      unsigned int v24 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v23];

      if (!v24) {
        goto LABEL_23;
      }
      goto LABEL_20;
    case 7uLL:
      CGFloat v25 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
      unsigned int v26 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v25];

      if (!v26) {
        goto LABEL_21;
      }
LABEL_20:
      double v5 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
      break;
    case 8uLL:
LABEL_21:
      CGFloat v27 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
      unsigned int v28 = [(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v27];

      if (!v28) {
        goto LABEL_23;
      }
      double v5 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
      break;
    default:
      CGFloat v8 = +[AXSubsystemZoom sharedInstance];
      unsigned __int8 v9 = [v8 ignoreLogging];

      if ((v9 & 1) == 0)
      {
        CGFloat v10 = +[AXSubsystemZoom identifier];
        double v11 = AXLoggerForFacility();

        os_log_type_t v12 = AXOSLogLevelFromAXLogLevel();
        if (os_log_type_enabled(v11, v12))
        {
          double v13 = AXColorizeFormatLog();
          double v14 = _AXStringForArgs();
          if (os_log_type_enabled(v11, v12))
          {
            int v30 = 138543362;
            BOOL v31 = v14;
            _os_log_impl(&dword_0, v11, v12, "%{public}@", (uint8_t *)&v30, 0xCu);
          }
        }
      }
LABEL_23:
      double v5 = 0;
      break;
  }

  return v5;
}

- (void)_collapseNonactiveGrabbers
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(ZWZoomPIPLensViewController *)self grabberViews];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      unsigned int v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        CGFloat v8 = *(void **)(*((void *)&v10 + 1) + 8 * (void)v7);
        unsigned __int8 v9 = [(ZWZoomPIPLensViewController *)self activeGrabber];

        if (v8 != v9) {
          [v8 collapseGrabberAnimated:1];
        }
        unsigned int v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (void)_updateActiveGrabberDragConstraintWithOffset:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = [(ZWZoomPIPLensViewController *)self activeGrabber];
  unsigned int v7 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];

  if (v6 == v7)
  {
    double v14 = [(ZWZoomPIPLensViewController *)self topChromeGrabberDragConstraint];
  }
  else
  {
    CGFloat v8 = [(ZWZoomPIPLensViewController *)self activeGrabber];
    unsigned __int8 v9 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];

    if (v8 == v9)
    {
      double v14 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberDragConstraint];
LABEL_11:
      id v16 = v14;
      double v15 = y;
      goto LABEL_12;
    }
    long long v10 = [(ZWZoomPIPLensViewController *)self activeGrabber];
    long long v11 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];

    if (v10 != v11)
    {
      long long v12 = [(ZWZoomPIPLensViewController *)self activeGrabber];
      long long v13 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];

      if (v12 != v13) {
        return;
      }
      double v14 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberDragConstraint];
      goto LABEL_11;
    }
    double v14 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberDragConstraint];
  }
  id v16 = v14;
  double v15 = x;
LABEL_12:
  [v14 setConstant:v15];
}

- (void)_trackActiveGrabberWithTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = [(ZWZoomPIPLensViewController *)self activeGrabber];
  if (v6)
  {
    id v17 = v6;
    unsigned int v7 = [(ZWZoomPIPLensViewController *)self view];
    CGFloat v8 = [(ZWZoomPIPLensViewController *)self lensChromeView];
    objc_msgSend(v7, "convertPoint:toView:", v8, x, y);
    double v10 = v9;
    double v12 = v11;

    long long v13 = [(ZWZoomPIPLensViewController *)self lensChromeView];
    [v13 bounds];
    double MidX = CGRectGetMidX(v19);
    double v15 = [(ZWZoomPIPLensViewController *)self lensChromeView];
    [v15 bounds];
    double MidY = CGRectGetMidY(v20);

    -[ZWZoomPIPLensViewController _updateActiveGrabberDragConstraintWithOffset:](self, "_updateActiveGrabberDragConstraintWithOffset:", v10 - MidX, v12 - MidY);
    uint64_t v6 = v17;
  }
}

- (void)updateVisibleGrabbersAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(ZWZoomLensViewController *)self inStandbyMode]
    || [(ZWZoomPIPLensViewController *)self isInLensResizingMode]
    || ([(ZWZoomPIPLensViewController *)self pipDelegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        unsigned int v6 = [v5 shouldHideGrabbersWithZoomLensViewController:self],
        v5,
        v6))
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    unsigned int v7 = [(ZWZoomPIPLensViewController *)self grabberViews];
    id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v17;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * i) collapseGrabberAnimated:v3];
        }
        id v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }

    return;
  }
  double v12 = [(ZWZoomPIPLensViewController *)self _defaultGrabberForAxis:2];
  long long v13 = [(ZWZoomPIPLensViewController *)self _secondaryGrabberForAxis:2];
  if ([(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v12])
  {
    [v12 expandGrabberAnimated:v3];
  }
  else
  {
    [v12 collapseGrabberAnimated:v3];
    if ([(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v13])
    {
      [v13 expandGrabberAnimated:v3];
      goto LABEL_17;
    }
  }
  [v13 collapseGrabberAnimated:v3];
LABEL_17:
  id v15 = [(ZWZoomPIPLensViewController *)self _defaultGrabberForAxis:4];

  double v14 = [(ZWZoomPIPLensViewController *)self _secondaryGrabberForAxis:4];

  if ([(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v15])
  {
    [v15 expandGrabberAnimated:v3];
LABEL_21:
    [v14 collapseGrabberAnimated:v3];
    goto LABEL_22;
  }
  [v15 collapseGrabberAnimated:v3];
  if (![(ZWZoomPIPLensViewController *)self _sufficientSpaceExistsForGrabber:v14]) {
    goto LABEL_21;
  }
  [v14 expandGrabberAnimated:v3];
LABEL_22:
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ZWZoomPIPLensViewController;
  [(ZWZoomLensViewController *)&v19 _handleTap:v4];
  if ([v4 state] == (char *)&dword_0 + 3)
  {
    [(ZWZoomPIPLensViewController *)self grabberViews];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    id v6 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          double v11 = [(ZWZoomPIPLensViewController *)self view];
          double v12 = [(ZWZoomPIPLensViewController *)self view];
          [v4 locationInView:v12];
          objc_msgSend(v11, "convertPoint:toView:", v10);
          unsigned int v13 = objc_msgSend(v10, "pointInside:withEvent:", 0);

          if (v13)
          {
            double v14 = [(ZWZoomPIPLensViewController *)self pipDelegate];
            [v14 zoomLensViewController:self grabberDidReceiveTap:v10];

            goto LABEL_12;
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (void)_handleLongPress:(id)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ZWZoomPIPLensViewController;
  id v4 = a3;
  [(ZWZoomLensViewController *)&v12 _handleLongPress:v4];
  id v5 = (char *)objc_msgSend(v4, "state", v12.receiver, v12.super_class);

  if ((unint64_t)(v5 - 3) >= 3)
  {
    if (v5 == (unsigned char *)&dword_0 + 1)
    {
      id v6 = [(ZWZoomLensViewController *)self dummyScrollViewPanGestureRecognizer];
      id v7 = [(ZWZoomPIPLensViewController *)self view];
      [v6 locationInView:v7];
      double v9 = v8;
      double v11 = v10;

      -[ZWZoomPIPLensViewController _updateActiveResizeHandleForTouchOnChromeAtLocation:](self, "_updateActiveResizeHandleForTouchOnChromeAtLocation:", v9, v11);
    }
  }
  else
  {
    -[ZWZoomPIPLensViewController _updateActiveGrabberDragConstraintWithOffset:](self, "_updateActiveGrabberDragConstraintWithOffset:", CGPointZero.x, CGPointZero.y);
    [(ZWZoomPIPLensViewController *)self setActiveGrabber:0];
    [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:1];
  }
}

- (CGPoint)_lensDragMultiplier
{
  double v2 = 1.0;
  double v3 = 1.0;
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    id v5 = +[AXAssertion assertionWithType:AXAssertionTypeDisableDashboardSystemGestures identifier:@"Zoom: PIP window dragging"];
    [(ZWZoomPIPLensViewController *)self setDisableDashBoardSystemGesturesAssertion:v5];

    id v6 = [v4 panGestureRecognizer];
    id v7 = [(ZWZoomPIPLensViewController *)self view];
    [v6 locationInView:v7];
    double v8 = -[ZWZoomPIPLensViewController _activeGrabberForTouchAtLocation:](self, "_activeGrabberForTouchAtLocation:");
    [(ZWZoomPIPLensViewController *)self setActiveGrabber:v8];

    [(ZWZoomPIPLensViewController *)self _collapseNonactiveGrabbers];
    v9.receiver = self;
    v9.super_class = (Class)ZWZoomPIPLensViewController;
    [(ZWZoomLensViewController *)&v9 scrollViewWillBeginDragging:v4];
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    id v5 = [v4 panGestureRecognizer];
    id v6 = [(ZWZoomPIPLensViewController *)self view];
    [v5 locationInView:v6];
    -[ZWZoomPIPLensViewController _trackActiveGrabberWithTouchAtLocation:](self, "_trackActiveGrabberWithTouchAtLocation:");

    v7.receiver = self;
    v7.super_class = (Class)ZWZoomPIPLensViewController;
    [(ZWZoomLensViewController *)&v7 scrollViewDidScroll:v4];
  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomPIPLensViewController *)self setDisableDashBoardSystemGesturesAssertion:0];
    if (!v4) {
      [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:1];
    }
    v7.receiver = self;
    v7.super_class = (Class)ZWZoomPIPLensViewController;
    [(ZWZoomLensViewController *)&v7 scrollViewDidEndDragging:v6 willDecelerate:v4];
  }
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  if (![(ZWZoomLensViewController *)self inStandbyMode])
  {
    [(ZWZoomPIPLensViewController *)self updateVisibleGrabbersAnimated:1];
    v5.receiver = self;
    v5.super_class = (Class)ZWZoomPIPLensViewController;
    [(ZWZoomLensViewController *)&v5 scrollViewDidEndDecelerating:v4];
  }
}

- (id)zoomRootview:(id)a3 viewForHitTestAtPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  id v7 = a3;
  double v8 = [(ZWZoomPIPLensViewController *)self lensChromeView];
  v29[0] = v8;
  objc_super v9 = [(ZWZoomPIPLensViewController *)self topChromeGrabberView];
  v29[1] = v9;
  double v10 = [(ZWZoomPIPLensViewController *)self rightChromeGrabberView];
  v29[2] = v10;
  double v11 = [(ZWZoomPIPLensViewController *)self bottomChromeGrabberView];
  v29[3] = v11;
  objc_super v12 = [(ZWZoomPIPLensViewController *)self leftChromeGrabberView];
  v29[4] = v12;
  unsigned int v13 = +[NSArray arrayWithObjects:v29 count:5];

  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = v13;
  id v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v25;
LABEL_3:
    uint64_t v18 = 0;
    while (1)
    {
      if (*(void *)v25 != v17) {
        objc_enumerationMutation(v14);
      }
      objc_super v19 = *(void **)(*((void *)&v24 + 1) + 8 * v18);
      objc_msgSend(v7, "convertPoint:toView:", v19, x, y);
      CGRect v20 = objc_msgSend(v19, "hitTest:withEvent:", 0);

      if (v20) {
        break;
      }
      if (v16 == (id)++v18)
      {
        id v16 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v16) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v21 = v7;

    if (v21) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v23.receiver = self;
  v23.super_class = (Class)ZWZoomPIPLensViewController;
  -[ZWZoomLensViewController zoomRootview:viewForHitTestAtPoint:](&v23, "zoomRootview:viewForHitTestAtPoint:", v7, x, y);
  id v21 = (id)objc_claimAutoreleasedReturnValue();
LABEL_12:

  return v21;
}

- (CGPoint)validPanOffsetForProposedOffset:(CGPoint)a3 proposedZoomFactor:(double)a4
{
  double y = a3.y;
  double x = a3.x;
  if (![(ZWZoomPIPLensViewController *)self offsetZoomWindow])
  {
    v12.receiver = self;
    v12.super_class = (Class)ZWZoomPIPLensViewController;
    -[ZWZoomLensViewController validPanOffsetForProposedOffset:proposedZoomFactor:](&v12, "validPanOffsetForProposedOffset:proposedZoomFactor:", x, y, a4);
    double x = v8;
    double y = v9;
  }
  double v10 = x;
  double v11 = y;
  result.double y = v11;
  result.double x = v10;
  return result;
}

- (ZWZoomPIPLensViewControllerDelegate)pipDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pipDelegate);

  return (ZWZoomPIPLensViewControllerDelegate *)WeakRetained;
}

- (void)setPipDelegate:(id)a3
{
}

- (BOOL)isInLensResizingMode
{
  return self->_inLensResizingMode;
}

- (ZWLensChromeView)lensChromeView
{
  return self->_lensChromeView;
}

- (void)setLensChromeView:(id)a3
{
}

- (int64_t)activeResizeHandle
{
  return self->_activeResizeHandle;
}

- (void)setActiveResizeHandle:(int64_t)a3
{
  self->_activeResizeHandle = a3;
}

- (BOOL)offsetZoomWindow
{
  return self->_offsetZoomWindow;
}

- (ZWLensChromeGrabberView)topChromeGrabberView
{
  return self->_topChromeGrabberView;
}

- (void)setTopChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)rightChromeGrabberView
{
  return self->_rightChromeGrabberView;
}

- (void)setRightChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)bottomChromeGrabberView
{
  return self->_bottomChromeGrabberView;
}

- (void)setBottomChromeGrabberView:(id)a3
{
}

- (ZWLensChromeGrabberView)leftChromeGrabberView
{
  return self->_leftChromeGrabberView;
}

- (void)setLeftChromeGrabberView:(id)a3
{
}

- (NSLayoutConstraint)topChromeGrabberDragConstraint
{
  return self->_topChromeGrabberDragConstraint;
}

- (void)setTopChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)rightChromeGrabberDragConstraint
{
  return self->_rightChromeGrabberDragConstraint;
}

- (void)setRightChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)bottomChromeGrabberDragConstraint
{
  return self->_bottomChromeGrabberDragConstraint;
}

- (void)setBottomChromeGrabberDragConstraint:(id)a3
{
}

- (NSLayoutConstraint)leftChromeGrabberDragConstraint
{
  return self->_leftChromeGrabberDragConstraint;
}

- (void)setLeftChromeGrabberDragConstraint:(id)a3
{
}

- (ZWLensChromeGrabberView)activeGrabber
{
  return self->_activeGrabber;
}

- (void)setActiveGrabber:(id)a3
{
}

- (AXAssertion)disableDashBoardSystemGesturesAssertion
{
  return self->_disableDashBoardSystemGesturesAssertion;
}

- (void)setDisableDashBoardSystemGesturesAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disableDashBoardSystemGesturesAssertion, 0);
  objc_storeStrong((id *)&self->_activeGrabber, 0);
  objc_storeStrong((id *)&self->_leftChromeGrabberDragConstraint, 0);
  objc_storeStrong((id *)&self->_bottomChromeGrabberDragConstraint, 0);
  objc_storeStrong((id *)&self->_rightChromeGrabberDragConstraint, 0);
  objc_storeStrong((id *)&self->_topChromeGrabberDragConstraint, 0);
  objc_storeStrong((id *)&self->_leftChromeGrabberView, 0);
  objc_storeStrong((id *)&self->_bottomChromeGrabberView, 0);
  objc_storeStrong((id *)&self->_rightChromeGrabberView, 0);
  objc_storeStrong((id *)&self->_topChromeGrabberView, 0);
  objc_storeStrong((id *)&self->_lensChromeView, 0);

  objc_destroyWeak((id *)&self->_pipDelegate);
}

@end