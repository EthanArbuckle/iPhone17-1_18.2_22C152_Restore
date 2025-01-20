@interface DRSessionController
+ (id)outAnimatorForOperation:(unint64_t)a3;
+ (id)systemDropAnimationForView:(id)a3;
- (CGPoint)_transformVelocity:(CGPoint)a3 withTransform:(CATransform3D *)a4;
- (DRSessionController)initWithSessionID:(unsigned int)a3 delegate:(id)a4;
- (DRSessionControllerDelegate)delegate;
- (DRSessionView)view;
- (DRSessionViewModel)model;
- (id)referenceScreenForViewModel:(id)a3;
- (id)visibleDroppedItemsInTargetScreen:(id)a3 transform:(CATransform3D *)a4;
- (unsigned)sessionID;
- (void)_notifyObserversOfPreviewsChangesUpdatedInLayout:(id)a3;
- (void)_requestItemImagesIfNecessary;
- (void)_updatePrecisionMode;
- (void)_usePrecisionMode:(id)a3;
- (void)animateOutWithOperation:(unint64_t)a3;
- (void)dealloc;
- (void)performAfterAnimationsComplete:(id)a3;
- (void)sessionViewWillLayoutSubviews:(id)a3;
- (void)setOrientation:(int64_t)a3 withDuration:(double)a4 direction:(int64_t)a5;
- (void)viewModelInvalidated:(id)a3;
@end

@implementation DRSessionController

- (DRSessionController)initWithSessionID:(unsigned int)a3 delegate:(id)a4
{
  id v6 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DRSessionController;
  v7 = [(DRSessionController *)&v18 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_delegate, v6);
    v8->_sessionID = a3;
    uint64_t v9 = objc_opt_new();
    model = v8->_model;
    v8->_model = (DRSessionViewModel *)v9;

    [(DRSessionViewModel *)v8->_model setDelegate:v8];
    v11 = -[DRSessionView initWithFrame:]([DRSessionView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    view = v8->_view;
    v8->_view = v11;

    [(DRSessionView *)v8->_view setUserInteractionEnabled:0];
    [(DRSessionView *)v8->_view setDelegate:v8];
    uint64_t v13 = objc_opt_new();
    flockLayout = v8->_flockLayout;
    v8->_flockLayout = (DRFlockLayout *)v13;

    uint64_t v15 = objc_opt_new();
    flockAnimator = v8->_flockAnimator;
    v8->_flockAnimator = (DRFlockAnimator *)v15;
  }
  return v8;
}

- (void)dealloc
{
  precisionHysteresisTimer = self->_precisionHysteresisTimer;
  if (precisionHysteresisTimer)
  {
    [(DRDispatchTimer *)precisionHysteresisTimer cancel];
    v4 = self->_precisionHysteresisTimer;
    self->_precisionHysteresisTimer = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)DRSessionController;
  [(DRSessionController *)&v5 dealloc];
}

- (void)setOrientation:(int64_t)a3 withDuration:(double)a4 direction:(int64_t)a5
{
}

- (void)performAfterAnimationsComplete:(id)a3
{
  v4 = (void (**)(void))a3;
  if (v4)
  {
    id v9 = v4;
    if (self->_animating)
    {
      afterAnimationBlocks = self->_afterAnimationBlocks;
      if (!afterAnimationBlocks)
      {
        id v6 = (NSMutableArray *)objc_opt_new();
        v7 = self->_afterAnimationBlocks;
        self->_afterAnimationBlocks = v6;

        afterAnimationBlocks = self->_afterAnimationBlocks;
      }
      id v8 = objc_retainBlock(v9);
      [(NSMutableArray *)afterAnimationBlocks addObject:v8];
    }
    else
    {
      v4[2](v4);
    }
    v4 = (void (**)(void))v9;
  }
}

+ (id)outAnimatorForOperation:(unint64_t)a3
{
  return +[_UIDragSetDownAnimation defaultSetDownPropertyAnimator];
}

+ (id)systemDropAnimationForView:(id)a3
{
  return +[_UIDragSetDownAnimation defaultDropAnimationForPlatterView:a3];
}

- (void)animateOutWithOperation:(unint64_t)a3
{
  self->_didStartAnimateOut = 1;
  self->_animating = 1;
  objc_super v5 = [(DRSessionView *)self->_view flockContainer];
  id v6 = [v5 subviews];

  v7 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput badgeView];

  if (v7)
  {
    id v8 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput badgeView];
    uint64_t v9 = [v6 arrayByAddingObject:v8];

    id v6 = (void *)v9;
  }
  [(id)objc_opt_class() outAnimatorForOperation:a3];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100025BC4;
  v12[3] = &unk_100055E30;
  v14 = self;
  unint64_t v15 = a3;
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = v13;
  [v6 enumerateObjectsUsingBlock:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100025F4C;
  v11[3] = &unk_100055E58;
  v11[4] = self;
  [v10 addCompletion:v11];
  [v10 startAnimation];
}

- (id)visibleDroppedItemsInTargetScreen:(id)a3 transform:(CATransform3D *)a4
{
  id v60 = a3;
  id v59 = (id)objc_opt_new();
  id v6 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput shownItemModels];
  v7 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput itemViews];
  v58 = v6;
  id v8 = (char *)[v6 count];
  v57 = v7;
  uint64_t v9 = (char *)[v7 count];
  if (v8 >= v9) {
    id v10 = v9;
  }
  else {
    id v10 = v8;
  }
  v56 = v10;
  if (v10)
  {
    v11 = 0;
    do
    {
      v12 = [v58 objectAtIndexedSubscript:v11];
      id v13 = [v57 objectAtIndexedSubscript:v11];
      v14 = objc_opt_new();
      objc_msgSend(v14, "setItemIndex:", objc_msgSend(v12, "itemIndex"));
      if ([(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput shouldHideFlock])
      {
        [v14 setImageComponent:0];
      }
      else
      {
        unint64_t v15 = [v12 imageComponent];
        [v14 setImageComponent:v15];
      }
      v16 = [v12 preview];
      [v14 setPreview:v16];

      v17 = [(DRSessionController *)self model];
      objc_super v18 = v17;
      if (v17)
      {
        [v17 appliedTransform];
      }
      else
      {
        long long v72 = 0u;
        long long v73 = 0u;
        long long v71 = 0u;
      }
      v70[0] = v71;
      v70[1] = v72;
      v70[2] = v73;
      [v14 setAppliedTransform:v70];

      v19 = [v13 layer];
      v20 = [v13 layer];
      [v20 bounds];
      UIRectGetCenter();
      double v22 = v21;
      double v24 = v23;
      v25 = [v13 layer];
      v26 = [v25 superlayer];
      objc_msgSend(v19, "convertPoint:toLayer:", v26, v22, v24);
      double v28 = v27;

      v29 = [v13 _screen];
      sub_100006044(v29, v60, v28);

      long long v30 = *(_OWORD *)&a4->m33;
      long long v66 = *(_OWORD *)&a4->m31;
      long long v67 = v30;
      long long v31 = *(_OWORD *)&a4->m43;
      long long v68 = *(_OWORD *)&a4->m41;
      long long v69 = v31;
      long long v32 = *(_OWORD *)&a4->m13;
      v64.scale = *(CGSize *)&a4->m11;
      *(_OWORD *)&v64.horizontalShear = v32;
      long long v33 = *(_OWORD *)&a4->m23;
      v64.translation = *(CGVector *)&a4->m21;
      long long v65 = v33;
      CA_CGPointApplyTransform();
      objc_msgSend(v14, "setCenter:");
      v34 = [v13 _velocityForKey:@"position"];
      [v34 CGPointValue];
      long long v35 = *(_OWORD *)&a4->m33;
      long long v66 = *(_OWORD *)&a4->m31;
      long long v67 = v35;
      long long v36 = *(_OWORD *)&a4->m43;
      long long v68 = *(_OWORD *)&a4->m41;
      long long v69 = v36;
      long long v37 = *(_OWORD *)&a4->m13;
      v64.scale = *(CGSize *)&a4->m11;
      *(_OWORD *)&v64.horizontalShear = v37;
      long long v38 = *(_OWORD *)&a4->m23;
      v64.translation = *(CGVector *)&a4->m21;
      long long v65 = v38;
      -[DRSessionController _transformVelocity:withTransform:](self, "_transformVelocity:withTransform:", &v64);
      uint64_t v40 = v39;
      uint64_t v42 = v41;

      v43 = [v13 _targetVelocityForKey:@"position"];
      [v43 CGPointValue];
      long long v44 = *(_OWORD *)&a4->m33;
      long long v66 = *(_OWORD *)&a4->m31;
      long long v67 = v44;
      long long v45 = *(_OWORD *)&a4->m43;
      long long v68 = *(_OWORD *)&a4->m41;
      long long v69 = v45;
      long long v46 = *(_OWORD *)&a4->m13;
      v64.scale = *(CGSize *)&a4->m11;
      *(_OWORD *)&v64.horizontalShear = v46;
      long long v47 = *(_OWORD *)&a4->m23;
      v64.translation = *(CGVector *)&a4->m21;
      long long v65 = v47;
      -[DRSessionController _transformVelocity:withTransform:](self, "_transformVelocity:withTransform:", &v64);
      uint64_t v49 = v48;
      uint64_t v51 = v50;

      v63[0] = v40;
      v63[1] = v42;
      v63[2] = 0;
      v63[3] = 0;
      [v14 setVelocity3D:v63];
      v62[0] = v49;
      v62[1] = v51;
      v62[2] = 0;
      v62[3] = 0;
      [v14 setTargetVelocity3D:v62];
      memset(&v64, 0, sizeof(v64));
      v52 = [(DRSessionController *)self model];
      v53 = v52;
      if (v52) {
        [v52 elasticTransform];
      }
      else {
        memset(&transform, 0, sizeof(transform));
      }
      CGAffineTransformDecompose(&v64, &transform);

      objc_msgSend(v14, "setConstrainSize:", objc_msgSend(v13, "constrainSize"));
      [v13 stackRotation];
      [v14 setRotation:v54 + v64.rotation];
      [v59 addObject:v14];

      ++v11;
    }
    while (v56 != v11);
  }

  return v59;
}

- (void)viewModelInvalidated:(id)a3
{
  if (!self->_didStartAnimateOut)
  {
    [(DRSessionView *)self->_view setNeedsLayout];
    v4 = [(DRSessionView *)self->_view window];

    if (!v4)
    {
      [(DRSessionController *)self _requestItemImagesIfNecessary];
    }
  }
}

- (id)referenceScreenForViewModel:(id)a3
{
  v3 = [(DRSessionView *)self->_view window];
  v4 = [v3 windowScene];
  objc_super v5 = [v4 screen];

  return v5;
}

- (void)sessionViewWillLayoutSubviews:(id)a3
{
  if (self->_didStartAnimateOut) {
    return;
  }
  [(DRSessionController *)self _requestItemImagesIfNecessary];
  v4 = [(DRSessionController *)self model];
  [v4 centroid];
  if (CAPoint3DEqualToPoint())
  {
    objc_super v5 = [(DRSessionController *)self model];
    id v6 = [v5 itemModels];
    v7 = [v6 firstObject];
    id v8 = [v7 preview];

    if (!v8) {
      return;
    }
  }
  else
  {
  }
  [(DRSessionController *)self _updatePrecisionMode];
  id v38 = (id)objc_opt_new();
  [v38 setMaxItemCount:5];
  uint64_t v9 = [(DRSessionController *)self model];
  [v38 setModel:v9];

  id v10 = [(DRSessionController *)self view];
  [v10 bounds];
  objc_msgSend(v38, "setContainerBounds:");

  v11 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput badgeView];
  v12 = [(DRFlockLayout *)self->_flockLayout layoutWithInput:v38];
  [(DRSessionController *)self _notifyObserversOfPreviewsChangesUpdatedInLayout:v12];
  objc_storeStrong((id *)&self->_lastFlockLayoutOutput, v12);
  id v13 = [(DRSessionController *)self view];
  v14 = [v13 flockContainer];
  unint64_t v15 = [v12 allViews];
  sub_1000269A8(v14, v15);

  v16 = [v12 badgeView];

  if (v16)
  {
    id v17 = [v12 shouldHideFlock];
    objc_super v18 = [v12 badgeView];
    [v18 setHidden:v17];

    v19 = [v12 badgeView];
    [v13 addSubview:v19];
  }
  else if (v11)
  {
    [v11 removeFromSuperview];
  }
  if (!self->_animating)
  {
    v20 = [v38 model];
    double v21 = [v20 itemModels];

    if ([v21 count] == (id)1)
    {
      double v22 = [v21 firstObject];
      double v23 = [v22 preview];

      if (v23)
      {
        [v23 stackAlpha];
        double v25 = v24;
        v26 = [v13 flockContainer];
        [v26 setAlpha:v25];
      }
    }
    else
    {
      +[_DUIPreview defaultStackAlpha];
      double v28 = v27;
      double v23 = [v13 flockContainer];
      [v23 setAlpha:v28];
    }
  }
  id v29 = [v12 shouldHideFlock];
  long long v30 = [v13 flockContainer];
  [v30 setHidden:v29];

  [(DRFlockAnimator *)self->_flockAnimator animateFlockLayoutOutput:v12];
  long long v31 = [(DRSessionController *)self model];
  LODWORD(v30) = [v31 canAddManipulatedTouch];

  dragManipulationHitTestView = self->_dragManipulationHitTestView;
  if (v30)
  {
    if (!dragManipulationHitTestView)
    {
      long long v33 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 600.0, 600.0);
      v34 = [(UIView *)v33 layer];
      [v34 setHitTestsAsOpaque:1];

      long long v35 = [v13 flockContainer];
      [v13 insertSubview:v33 aboveSubview:v35];

      long long v36 = self->_dragManipulationHitTestView;
      self->_dragManipulationHitTestView = v33;
    }
    long long v37 = [(DRSessionController *)self model];
    [v37 centroid];
    -[UIView setCenter:](self->_dragManipulationHitTestView, "setCenter:");
    goto LABEL_22;
  }
  if (dragManipulationHitTestView)
  {
    [(UIView *)dragManipulationHitTestView removeFromSuperview];
    long long v37 = self->_dragManipulationHitTestView;
    self->_dragManipulationHitTestView = 0;
LABEL_22:
  }
}

- (void)_requestItemImagesIfNecessary
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  objc_super v5 = [(DRSessionController *)self model];
  id v6 = [v5 sourceClient];

  v7 = [(DRSessionController *)self model];
  id v8 = [v7 potentialDropDestinationClient];

  uint64_t v9 = [(DRSessionController *)self model];
  id v10 = [v9 itemModels];
  v11 = [v10 reverseObjectEnumerator];
  v12 = [v11 allObjects];

  uint64_t v40 = 0;
  uint64_t v41 = &v40;
  uint64_t v42 = 0x2020000000;
  uint64_t v43 = 0;
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_100026E14;
  v34[3] = &unk_100055E80;
  id v13 = v8;
  id v35 = v13;
  id v14 = v4;
  id v36 = v14;
  id v15 = v6;
  id v37 = v15;
  id v16 = v3;
  id v38 = v16;
  uint64_t v39 = &v40;
  id v17 = objc_retainBlock(v34);
  objc_super v18 = [(DRSessionController *)self model];
  v19 = [v18 preferredPreviewIndexes];
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10002705C;
  v31[3] = &unk_100055EA8;
  id v20 = v12;
  id v32 = v20;
  double v21 = v17;
  id v33 = v21;
  [v19 enumerateIndexesUsingBlock:v31];

  if ((unint64_t)v41[3] <= 4)
  {
    v26 = _NSConcreteStackBlock;
    uint64_t v27 = 3221225472;
    double v28 = sub_1000270E0;
    id v29 = &unk_100055ED0;
    long long v30 = v21;
    [v20 enumerateObjectsUsingBlock:&v26];
  }
  if (objc_msgSend(v16, "count", v26, v27, v28, v29))
  {
    double v22 = [(DRSessionController *)self delegate];
    double v23 = [v15 client];
    [v22 sessionController:self requestImagesForClient:v23 itemIndexes:v16];
  }
  if ([v14 count])
  {
    double v24 = [(DRSessionController *)self delegate];
    double v25 = [v13 client];
    [v24 sessionController:self requestImagesForClient:v25 itemIndexes:v14];
  }
  _Block_object_dispose(&v40, 8);
}

- (void)_updatePrecisionMode
{
  v3 = [(DRSessionController *)self model];
  v4 = [v3 precisionMode];

  objc_super v5 = objc_opt_new();
  id v6 = [(DRSessionController *)self model];
  v7 = [v6 potentialDrop];
  objc_msgSend(v5, "setDirection:", objc_msgSend(v7, "precise"));

  id v8 = [(DRSessionController *)self model];
  objc_msgSend(v5, "setOrientation:", objc_msgSend(v8, "orientation"));

  unsigned int v9 = [v4 isEqual:v5];
  p_pendingPrecisionMode = &self->_pendingPrecisionMode;
  pendingPrecisionMode = self->_pendingPrecisionMode;
  if (v9)
  {
    self->_pendingPrecisionMode = 0;

    if (self->_precisionHysteresisTimer)
    {
      v12 = DRLogTarget();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        sub_100033DA8((uint64_t)v4, (uint64_t)v5, v12);
      }

      precisionHysteresisTimer = self->_precisionHysteresisTimer;
      p_precisionHysteresisTimer = &self->_precisionHysteresisTimer;
      [(DRDispatchTimer *)precisionHysteresisTimer cancel];
      id v15 = *p_precisionHysteresisTimer;
      *p_precisionHysteresisTimer = 0;
    }
    goto LABEL_43;
  }
  unsigned int v16 = [(DRPrecisionMode *)pendingPrecisionMode isEqual:v5];
  id v17 = DRLogTarget();
  BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG);
  if (v16)
  {
    if (v18)
    {
      long long v44 = *p_pendingPrecisionMode;
      *(_DWORD *)location = 138412802;
      *(void *)&location[4] = v4;
      __int16 v49 = 2112;
      uint64_t v50 = v5;
      __int16 v51 = 2112;
      v52 = v44;
      _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode from %@ to %@, IS a change, but pending %@ is the same already", location, 0x20u);
    }

    goto LABEL_43;
  }
  if (v18)
  {
    long long v45 = *p_pendingPrecisionMode;
    *(_DWORD *)location = 138412802;
    *(void *)&location[4] = v4;
    __int16 v49 = 2112;
    uint64_t v50 = v5;
    __int16 v51 = 2112;
    v52 = v45;
    _os_log_debug_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode from %@ to %@, IS a change, replacing pending %@", location, 0x20u);
  }

  if (![v5 direction])
  {
    double v19 = CACurrentMediaTime();
    id v20 = [(DRSessionController *)self model];
    [v20 enteredPrecisionModeTime];
    double v22 = v21;

    double v23 = [(DRSessionController *)self model];
    [v23 enteredPrecisionModeY];
    double v25 = v24;
    v26 = [(DRSessionController *)self model];
    [v26 centroid];
    double v28 = v27;

    id v29 = DRLogTarget();
    double v30 = v19 - v22;
    double v31 = vabdd_f64(v25, v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      sub_100033EF0(v29, v30, v31);
    }

    if (qword_100064888 != -1) {
      dispatch_once(&qword_100064888, &stru_100055F58);
    }
    double v32 = byte_100064890 ? sub_100027C6C() : 0.0666666667;
    if (v30 < v32)
    {
      if (qword_100064888 != -1) {
        dispatch_once(&qword_100064888, &stru_100055FB8);
      }
      double v33 = 5.0;
      if (byte_100064890) {
        double v33 = sub_100027E24();
      }
      if (v31 < v33)
      {
        v34 = DRLogTarget();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
          sub_100033E30((uint64_t)self, v34);
        }

        [(DRSessionController *)self _usePrecisionMode:v5];
        id v35 = [(DRSessionController *)self model];
        [v35 centroid];
        self->_precisionModeLimitY = v36;

        goto LABEL_43;
      }
    }
  }
  objc_storeStrong((id *)&self->_pendingPrecisionMode, v5);
  id v37 = self->_precisionHysteresisTimer;
  if (!v37)
  {
    objc_initWeak((id *)location, self);
    id v38 = [DRDispatchTimer alloc];
    id v39 = &_dispatch_main_q;
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_100027680;
    v46[3] = &unk_100054CA8;
    objc_copyWeak(&v47, (id *)location);
    uint64_t v40 = [(DRDispatchTimer *)v38 initWithQueue:&_dispatch_main_q eventHandler:v46];

    uint64_t v41 = self->_precisionHysteresisTimer;
    self->_precisionHysteresisTimer = v40;

    objc_destroyWeak(&v47);
    objc_destroyWeak((id *)location);
  }
  if ([v5 direction])
  {
    if (qword_100064888 != -1) {
      dispatch_once(&qword_100064888, &stru_100056018);
    }
    if (byte_100064890)
    {
      double v42 = sub_100027FD8();
      goto LABEL_39;
    }
    goto LABEL_38;
  }
  if (qword_100064888 != -1) {
    dispatch_once(&qword_100064888, &stru_100056078);
  }
  if (!byte_100064890)
  {
LABEL_38:
    double v42 = 0.2;
    goto LABEL_39;
  }
  double v42 = sub_100028190();
LABEL_39:
  [(DRDispatchTimer *)self->_precisionHysteresisTimer resetWithTimeout:v42 leeway:v42 * 0.2];
  if (!v37)
  {
    uint64_t v43 = DRLogTarget();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      sub_100033EAC(v43);
    }

    [(DRDispatchTimer *)self->_precisionHysteresisTimer activate];
  }
LABEL_43:
}

- (void)_usePrecisionMode:(id)a3
{
  id v4 = a3;
  if ([v4 direction])
  {
    objc_super v5 = [(DRSessionController *)self model];
    [v5 centroid];
    double v7 = v6;

    if (v7 <= self->_precisionModeLimitY)
    {
      uint64_t v8 = objc_opt_new();

      unsigned int v9 = DRLogTarget();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        sub_100033FF4((uint64_t *)&self->_precisionModeLimitY, v9, v7);
      }

      id v4 = (id)v8;
    }
  }
  id v10 = [(DRSessionController *)self model];
  v11 = [v10 precisionMode];
  unsigned __int8 v12 = [v11 isEqual:v4];

  if ((v12 & 1) == 0)
  {
    id v13 = [(DRSessionController *)self model];
    [v13 setPrecisionMode:v4];

    id v14 = [(DRSessionController *)self delegate];
    [v4 touchOffset];
    objc_msgSend(v14, "sessionController:setTouchOffset:", self);

    self->_precisionModeLimitY = -10000000.0;
  }
}

- (CGPoint)_transformVelocity:(CGPoint)a3 withTransform:(CATransform3D *)a4
{
  double y = a3.y;
  double x = a3.x;
  CATransform3DGetDecomposition_();
  if (vabdd_f64(-1.57079633, v8) <= 2.22044605e-16)
  {
    double v6 = -x;
  }
  else if (vabdd_f64(-3.14159265, v8) <= 2.22044605e-16 || vabdd_f64(3.14159265, v8) <= 2.22044605e-16)
  {
    double v6 = -y;
    double y = -x;
  }
  else if (vabdd_f64(1.57079633, v8) <= 2.22044605e-16 || vabdd_f64(-4.71238898, v8) <= 2.22044605e-16)
  {
    double y = -y;
    double v6 = x;
  }
  else
  {
    double v6 = y;
    double y = x;
  }
  double v7 = y;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (void)_notifyObserversOfPreviewsChangesUpdatedInLayout:(id)a3
{
  id v15 = a3;
  id v4 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput previewAndImageComponents];
  objc_super v5 = [v15 previewAndImageComponents];
  id v6 = [v5 mutableCopy];

  if (v4) {
    [v6 removeObjectsInArray:v4];
  }
  double v7 = [v6 indexesOfObjectsPassingTest:&stru_100055F10];
  [v6 removeObjectsAtIndexes:v7];

  if (v15 && !self->_lastFlockLayoutOutput)
  {
    [v6 count];
LABEL_6:
    id v8 = objc_alloc_init((Class)_DUIPresentationUpdate);
    [v8 setModifiedPreviews:v6];
    unsigned int v9 = [v15 badgeLayout];
    objc_msgSend(v8, "setBadgeStyle:", objc_msgSend(v9, "style"));

    id v10 = [(DRSessionController *)self delegate];
    [v10 sessionController:self didUpdatePresentation:v8];

    goto LABEL_9;
  }
  v11 = [v15 badgeLayout];
  id v12 = [v11 style];
  id v13 = [(DRFlockLayoutOutput *)self->_lastFlockLayoutOutput badgeLayout];
  id v14 = [v13 style];

  if ([v6 count] || v12 != v14) {
    goto LABEL_6;
  }
LABEL_9:
}

- (DRSessionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DRSessionControllerDelegate *)WeakRetained;
}

- (unsigned)sessionID
{
  return self->_sessionID;
}

- (DRSessionViewModel)model
{
  return self->_model;
}

- (DRSessionView)view
{
  return self->_view;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dragManipulationHitTestView, 0);
  objc_storeStrong((id *)&self->_pendingPrecisionMode, 0);
  objc_storeStrong((id *)&self->_precisionHysteresisTimer, 0);
  objc_storeStrong((id *)&self->_lastFlockLayoutOutput, 0);
  objc_storeStrong((id *)&self->_flockAnimator, 0);
  objc_storeStrong((id *)&self->_flockLayout, 0);
  objc_storeStrong((id *)&self->_afterAnimationBlocks, 0);
}

@end