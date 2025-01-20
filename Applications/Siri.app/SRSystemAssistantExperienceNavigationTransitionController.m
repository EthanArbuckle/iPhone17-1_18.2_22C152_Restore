@interface SRSystemAssistantExperienceNavigationTransitionController
- (BOOL)_isDrillIn;
- (SRSystemAssistantExperienceNavigationTransitionController)init;
- (SiriUINavigationController)_navigationController;
- (UIViewControllerAnimatedTransitioning)animationController;
- (double)transitionDuration:(id)a3;
- (id)_platterViewOfViewController:(id)a3;
- (id)_saeContainerViewFromViewController:(id)a3;
- (id)_snippetContainerViewOfView:(id)a3;
- (int64_t)operation;
- (void)_setNavigationController:(id)a3;
- (void)animateDrillInTransitionWithContext:(id)a3;
- (void)animatePopToRootViewControllerWithContext:(id)a3;
- (void)animateTransition:(id)a3;
- (void)configureWithNavigationController:(id)a3;
- (void)setOperation:(int64_t)a3;
@end

@implementation SRSystemAssistantExperienceNavigationTransitionController

- (SRSystemAssistantExperienceNavigationTransitionController)init
{
  v6.receiver = self;
  v6.super_class = (Class)SRSystemAssistantExperienceNavigationTransitionController;
  v2 = [(SRSystemAssistantExperienceNavigationTransitionController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:0.75 response:0.628318531];
    springAnimationBehavior = v2->_springAnimationBehavior;
    v2->_springAnimationBehavior = (UIViewSpringAnimationBehavior *)v3;
  }
  return v2;
}

- (void)configureWithNavigationController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(SRSystemAssistantExperienceNavigationTransitionController *)self _setNavigationController:v4];
  }
  else
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_ERROR)) {
      sub_1000B7C34(v5);
    }
  }
}

- (UIViewControllerAnimatedTransitioning)animationController
{
  if ([(SRSystemAssistantExperienceNavigationTransitionController *)self _isDrillIn]
    && (id)[(SRSystemAssistantExperienceNavigationTransitionController *)self operation] == (id)1
    || (-[SRSystemAssistantExperienceNavigationTransitionController _navigationController](self, "_navigationController"), uint64_t v3 = objc_claimAutoreleasedReturnValue(), v4 = [v3 popToRootViewController], v3, v4))
  {
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return (UIViewControllerAnimatedTransitioning *)v5;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(SRSystemAssistantExperienceNavigationTransitionController *)self operation];
  switch(v5)
  {
    case 2:
      v7 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
      unsigned int v8 = [v7 popToRootViewController];

      if (v8)
      {
        v9 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
        [v9 setPopToRootViewController:0];

        [(SRSystemAssistantExperienceNavigationTransitionController *)self animatePopToRootViewControllerWithContext:v4];
      }
      break;
    case 1:
      [(SRSystemAssistantExperienceNavigationTransitionController *)self animateDrillInTransitionWithContext:v4];
      break;
    case 0:
      objc_super v6 = AFSiriLogContextConnection;
      if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_FAULT)) {
        sub_1000B7CB8((uint64_t)self, v6);
      }
      break;
  }
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (void)animateDrillInTransitionWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containerView];
  objc_super v6 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  v97 = (void *)v5;
  [v6 setFirstCommonAncestralView:v5];

  v99 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  v92 = [v4 viewForKey:UITransitionContextFromViewKey];
  v7 = [v4 viewForKey:UITransitionContextToViewKey];
  v93 = v4;
  v96 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  v98 = v7;
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  char IsPad = SiriSharedUIDeviceIsPad();
  double v17 = v15;
  double v18 = v13;
  double v19 = v11;
  double v20 = v9;
  if ((IsPad & 1) == 0)
  {
    double v20 = v9 + -1.0;
    double v19 = v11 + -1.0;
    double v18 = v13 + 2.0;
    double v17 = v15 + 2.0;
  }
  double v86 = v20;
  double v87 = v19;
  double v88 = v18;
  double v89 = v17;
  v95 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _platterViewOfViewController:v99];
  v94 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _snippetContainerViewOfView:v95];
  id v21 = objc_alloc((Class)UIVisualEffectView);
  v22 = +[UIBlurEffect effectWithStyle:4];
  id v23 = [v21 initWithEffect:v22];

  v24 = [v23 layer];
  double v25 = SiriSharedUISmartDialogPlatterCornerRadius;
  [v24 setCornerRadius:SiriSharedUISmartDialogPlatterCornerRadius];

  [v98 bounds];
  [v23 setFrame:];
  v26 = [v23 layer];
  [v26 setMasksToBounds:1];

  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v23 setUserInteractionEnabled:0];
  [v98 addSubview:v23];
  v83 = [v23 leadingAnchor];
  v81 = [v98 leadingAnchor];
  v80 = [v83 constraintEqualToAnchor:v81];
  v117[0] = v80;
  v27 = [v23 trailingAnchor];
  v28 = [v98 trailingAnchor];
  v29 = [v27 constraintEqualToAnchor:v28];
  v117[1] = v29;
  [v23 topAnchor];
  v30 = v90 = self;
  v31 = [v98 topAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v117[2] = v32;
  v85 = v23;
  v33 = [v23 bottomAnchor];
  v34 = [v98 bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v117[3] = v35;
  v36 = +[NSArray arrayWithObjects:v117 count:4];
  +[NSLayoutConstraint activateConstraints:v36];

  v37 = +[PLPlatterView platterViewWithBlurEffectStyle:9];
  v38 = [v37 layer];
  [v38 setMasksToBounds:1];

  v39 = [v37 layer];
  [v39 setCornerRadius:v25];

  v40 = [(SRSystemAssistantExperienceNavigationTransitionController *)v90 _navigationController];
  [v40 setAnimatingBackgroundView:v37];

  [v95 frame];
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;
  v49 = [v95 superview];
  [v97 convertRect:v49 fromView:v42];
  double v51 = v50;
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;

  [v37 setFrame:v51, v53, v55, v57];
  id v58 = objc_alloc_init((Class)UIView);
  v59 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
  [v59 setName:@"gaussianBlur"];
  [v59 setValue:&off_100149B08 forKey:kCAFilterInputRadius];
  v60 = [v58 layer];
  v84 = v59;
  v116 = v59;
  v61 = +[NSArray arrayWithObjects:&v116 count:1];
  [v60 setFilters:v61];

  [v97 frame];
  [v58 setFrame:];
  [v58 addSubview:v37];
  v62 = [(SRSystemAssistantExperienceNavigationTransitionController *)v90 _navigationController];
  [v62 setBlurrableView:v58];

  [v97 insertSubview:v58 belowSubview:v92];
  v63 = +[SiriSharedUISystemAssistantExperienceContainerView makeDropletContainerShadowView];
  v64 = [(SRSystemAssistantExperienceNavigationTransitionController *)v90 _navigationController];
  [v64 setShadowView:v63];

  [v63 setFrame:v51, v53, v55, v57];
  [v58 insertSubview:v63 belowSubview:v37];
  [v94 frame];
  double MinY = CGRectGetMinY(v118);
  [v98 setClipsToBounds:1];
  [v98 setAlpha:0.0];
  [v98 setFrame:v9, v11, v13, v15];
  [v37 addSubview:v98];
  v119.origin.x = v9;
  v119.origin.y = v11;
  v119.size.width = v13;
  v119.size.height = v15;
  double MidX = CGRectGetMidX(v119);
  v120.origin.x = v9;
  v120.origin.y = v11;
  v120.size.width = v13;
  v120.size.height = v15;
  [v98 setCenter:MidX, MinY + CGRectGetMidY(v120)];
  v67 = +[UIScreen mainScreen];
  v68 = [v67 traitCollection];
  [v68 displayCornerRadius];
  uint64_t v70 = v69;

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v71 = v96;
  }
  else {
    id v71 = 0;
  }
  v82 = v71;
  [v71 prepareForDrillInAnimation];
  v72 = [(SRSystemAssistantExperienceNavigationTransitionController *)v90 _saeContainerViewFromViewController:v99];
  [v72 prepareForDrillinAnimation];
  springAnimationBehavior = v90->_springAnimationBehavior;
  v104[0] = _NSConcreteStackBlock;
  v104[1] = 3221225472;
  v104[2] = sub_100038FB0;
  v104[3] = &unk_100143858;
  id v91 = v37;
  id v105 = v91;
  uint64_t v110 = v70;
  double v111 = v86;
  double v112 = v87;
  double v113 = v88;
  double v114 = v89;
  id v74 = v63;
  id v106 = v74;
  id v75 = v94;
  id v107 = v75;
  double v115 = MinY;
  id v108 = v85;
  id v76 = v98;
  id v109 = v76;
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_100039090;
  v100[3] = &unk_100143880;
  id v77 = v92;
  id v101 = v77;
  id v78 = v108;
  id v102 = v78;
  id v79 = v93;
  id v103 = v79;
  +[UIView _animateUsingSpringBehavior:springAnimationBehavior tracking:0 animations:v104 completion:v100];
  if (objc_opt_respondsToSelector()) {
    [v95 performSelector:"animateForDrillIn"];
  }
  [v72 performAnimatedBlur:1 usingSpringWithMass:2.0 stiffness:200.0 damping:30.0];
}

- (void)animatePopToRootViewControllerWithContext:(id)a3
{
  id v71 = a3;
  id v4 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  id v5 = [v4 popAnimationType];

  v73 = [v71 viewForKey:UITransitionContextFromViewKey];
  v68 = [v71 viewForKey:UITransitionContextToViewKey];
  id v75 = [v71 viewControllerForKey:UITransitionContextToViewControllerKey];
  v64 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _saeContainerViewFromViewController:v75];
  uint64_t v69 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _platterViewOfViewController:v75];
  v62 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _snippetContainerViewOfView:v69];
  objc_super v6 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  v66 = [v6 blurrableView];

  v7 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  v67 = [v7 firstCommonAncestralView];

  double v8 = v66;
  if (v5)
  {
    if (v5 != (id)1) {
      goto LABEL_5;
    }
    double v8 = v73;
  }
  [v67 insertSubview:v68 belowSubview:v8];
LABEL_5:
  id v9 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:0];
  double v10 = v9;
  if (v5 == (id)1)
  {
    double v11 = [v9 layer];
    [v11 setCornerRadius:SiriSharedUISmartDialogPlatterCornerRadius];

    [v73 bounds];
    [v10 setFrame:];
    double v12 = [v10 layer];
    [v12 setMasksToBounds:1];

    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setUserInteractionEnabled:0];
    [v73 addSubview:v10];
    v60 = [v10 leadingAnchor];
    id v58 = [v73 leadingAnchor];
    double v57 = [v60 constraintEqualToAnchor:v58];
    v98[0] = v57;
    double v56 = [v10 trailingAnchor];
    double v55 = [v73 trailingAnchor];
    double v54 = [v56 constraintEqualToAnchor:v55];
    v98[1] = v54;
    double v13 = [v10 topAnchor];
    double v14 = [v73 topAnchor];
    double v15 = [v13 constraintEqualToAnchor:v14];
    v98[2] = v15;
    v16 = [v10 bottomAnchor];
    double v17 = [v73 bottomAnchor];
    double v18 = [v16 constraintEqualToAnchor:v17];
    v98[3] = v18;
    double v19 = +[NSArray arrayWithObjects:v98 count:4];
    +[NSLayoutConstraint activateConstraints:v19];
  }
  [v68 setHidden:0];
  double v20 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  id v21 = [v20 animatingBackgroundView];

  v22 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
  id v23 = [v22 shadowView];

  [v64 prepareForPopAnimationOfType:v5];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v24 = v75;
  }
  else {
    id v24 = 0;
  }
  v61 = v24;
  [v24 prepareForPopAnimationOfType:v5];
  [v69 frame];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  v33 = [v69 superview];
  [v67 convertRect:v33 fromView:v26 toView:v28];
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;

  objc_initWeak(&location, self);
  springAnimationBehavior = self->_springAnimationBehavior;
  v85[0] = _NSConcreteStackBlock;
  v85[1] = 3221225472;
  v85[2] = sub_1000398D8;
  v85[3] = &unk_1001438A8;
  id v92 = v5;
  id v43 = v21;
  id v86 = v43;
  id v44 = v23;
  id v87 = v44;
  uint64_t v93 = v35;
  uint64_t v94 = v37;
  uint64_t v95 = v39;
  uint64_t v96 = v41;
  id v63 = v62;
  id v88 = v63;
  id v59 = v69;
  id v89 = v59;
  id v45 = v10;
  id v90 = v45;
  id v46 = v73;
  id v91 = v46;
  v76[0] = _NSConcreteStackBlock;
  v76[1] = 3221225472;
  v76[2] = sub_100039A20;
  v76[3] = &unk_1001438D0;
  objc_copyWeak(v84, &location);
  id v47 = v64;
  id v77 = v47;
  v84[1] = v5;
  id v65 = v46;
  id v78 = v65;
  id v70 = v45;
  id v79 = v70;
  id v48 = v66;
  id v80 = v48;
  id v74 = v43;
  id v81 = v74;
  id v49 = v44;
  id v82 = v49;
  id v72 = v71;
  id v83 = v72;
  +[UIView _animateUsingSpringBehavior:springAnimationBehavior tracking:0 animations:v85 completion:v76];
  double v50 = +[CASpringAnimation animationWithKeyPath:@"filters.gaussianBlur.inputRadius"];
  double v51 = v50;
  if (v5)
  {
    if (v5 == (id)1)
    {
      double v52 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _navigationController];
      [v52 setPopAnimationType:0];

      [v47 performAnimatedBlur:0 usingSpringWithMass:2.0 stiffness:200.0 damping:30.0];
    }
  }
  else
  {
    [v50 setMass:2.0];
    [v51 setStiffness:200.0];
    [v51 setDamping:30.0];
    [v51 setAdditive:1];
    [v51 setFromValue:&off_100149B08];
    [v51 setToValue:&off_100149A20];
    [v51 setDuration:1.0];
    double v53 = [v48 layer];
    [v53 addAnimation:v51 forKey:@"filters.gaussianBlur.inputRadius"];
  }
  objc_destroyWeak(v84);

  objc_destroyWeak(&location);
}

- (BOOL)_isDrillIn
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);
  uint64_t v3 = [WeakRetained viewControllers];
  BOOL v4 = [v3 count] == (id)2;

  return v4;
}

- (id)_saeContainerViewFromViewController:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [v3 containerView];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_platterViewOfViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(SRSystemAssistantExperienceNavigationTransitionController *)self _saeContainerViewFromViewController:v4];
  objc_super v6 = v5;
  if (v5
    && ([v5 resultContentView],
        v7 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        (isKindOfClass & 1) != 0))
  {
    uint64_t v9 = [v6 resultContentView];
  }
  else
  {
    uint64_t v9 = [v4 view];
  }
  double v10 = (void *)v9;

  return v10;
}

- (id)_snippetContainerViewOfView:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 contentContainerView];
  }
  else
  {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (int64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(int64_t)a3
{
  self->_operation = a3;
}

- (SiriUINavigationController)_navigationController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationController);

  return (SiriUINavigationController *)WeakRetained;
}

- (void)_setNavigationController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_navigationController);

  objc_storeStrong((id *)&self->_springAnimationBehavior, 0);
}

@end