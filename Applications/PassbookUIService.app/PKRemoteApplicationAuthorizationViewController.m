@interface PKRemoteApplicationAuthorizationViewController
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (PKRemoteApplicationAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_tapRecognized:(id)a3;
- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4;
- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)didInvalidateForRemoteAlert;
- (void)dismissPasscodeViewController;
- (void)loadView;
- (void)observedView:(id)a3 didMoveToWindow:(id)a4;
- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4;
- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PKRemoteApplicationAuthorizationViewController

- (PKRemoteApplicationAuthorizationViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PKRemoteApplicationAuthorizationViewController;
  v4 = [(PKRemoteApplicationAuthorizationViewController *)&v8 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_visible = 0;
    v4->_state = 1;
    v6 = [(PKRemoteApplicationAuthorizationViewController *)v4 traitOverrides];
    [v6 setUserInterfaceStyle:2];
  }
  return v5;
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)loadView
{
  id v3 = objc_alloc_init((Class)PKView);
  v4 = +[UIColor clearColor];
  [v3 setBackgroundColor:v4];

  [(PKRemoteApplicationAuthorizationViewController *)self setView:v3];
  self->_userIntentStyle = (int64_t)+[PKAuthenticator userIntentStyle];
  [v3 addWindowObserver:self];
  v5 = (UITapGestureRecognizer *)[objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_tapRecognized:"];
  tapRecognizer = self->_tapRecognizer;
  self->_tapRecognizer = v5;

  [(UITapGestureRecognizer *)self->_tapRecognizer setDelegate:self];
  [v3 addGestureRecognizer:self->_tapRecognizer];
  v7 = (PKSpringAnimationFactory *)[objc_alloc((Class)PKSpringAnimationFactory) initWithMass:2.0 stiffness:300.0 damping:50.0];
  springFactory = self->_springFactory;
  self->_springFactory = v7;

  v9 = self;
  v17 = v9;
  v10 = +[NSArray arrayWithObjects:&v17 count:1];
  id v11 = [(PKRemoteApplicationAuthorizationViewController *)self registerForTraitChanges:v10 withHandler:&stru_1000145E8];

  v12 = self;
  v16 = v12;
  v13 = +[NSArray arrayWithObjects:&v16 count:1];
  id v14 = [(PKRemoteApplicationAuthorizationViewController *)self registerForTraitChanges:v13 withHandler:&stru_100014608];

  v15 = [(PKRemoteApplicationAuthorizationViewController *)self traitCollection];
  sub_100006254((uint64_t)self, v15);
  sub_100006700((uint64_t)self, v15, 0, 0);
  sub_10000694C((uint64_t)self, 0, 0);
  sub_100007640((uint64_t)self, 0);
}

- (void)observedView:(id)a3 didMoveToWindow:(id)a4
{
  if (self->_physicalButton)
  {
    id v4 = [(PKRemoteApplicationAuthorizationViewController *)self view];
    [v4 setNeedsLayout];
  }
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)PKRemoteApplicationAuthorizationViewController;
  id v7 = a4;
  -[PKRemoteApplicationAuthorizationViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100007888;
  v8[3] = &unk_100014630;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

- (void)viewWillLayoutSubviews
{
  v148.receiver = self;
  v148.super_class = (Class)PKRemoteApplicationAuthorizationViewController;
  [(PKRemoteApplicationAuthorizationViewController *)&v148 viewWillLayoutSubviews];
  id v3 = [(PKRemoteApplicationAuthorizationViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  if (PKCATrackedLayoutIsAnimated()) {
    springFactordouble y = self->_springFactory;
  }
  else {
    springFactordouble y = 0;
  }
  v21 = springFactory;
  Tracker = (void *)PKCATrackedLayoutGetTracker();
  background = self->_background;
  v126 = v21;
  v127 = Tracker;
  if (background)
  {
    -[PKBackdropView setFrame:](background, "setFrame:", v5, v7, v9, v11);
    BOOL visible = self->_visible;
    v25 = self->_background;
    v26 = v21;
    id v27 = [(PKBackdropView *)v25 layer];
    v28 = v26;
    double v29 = 26.6666667;
    if (!visible) {
      double v29 = 0.0;
    }
    sub_10000C220(v27, v28, v29);
    if (visible)
    {
      float32x4_t v121 = (float32x4_t)xmmword_100012E50;
      float32x4_t v117 = (float32x4_t)xmmword_100012E60;
      float32x4_t v119 = 0u;
      float32x4_t v124 = (float32x4_t)xmmword_100012E40;
      float32x4_t v115 = (float32x4_t)xmmword_100012E40;
    }
    else
    {
      float32x4_t v119 = CAColorMatrixIdentity[2];
      float32x4_t v121 = CAColorMatrixIdentity[1];
      float32x4_t v124 = CAColorMatrixIdentity[0];
      float32x4_t v115 = CAColorMatrixIdentity[3];
      float32x4_t v117 = CAColorMatrixIdentity[4];
    }
    id v30 = v27;
    v31 = v28;
    if (!v30) {
      goto LABEL_65;
    }
    v32 = v31;
    v33 = [v30 valueForKeyPath:@"filters.colorMatrix.inputColorMatrix"];
    v34 = v33;
    memset(&location, 0, 80);
    if (v33)
    {
      [v33 CAColorMatrixValue];
    }
    else
    {
      float32x4_t v35 = CAColorMatrixIdentity[3];
      *(float32x4_t *)&location.m21 = CAColorMatrixIdentity[2];
      *(float32x4_t *)&location.m23 = v35;
      *(float32x4_t *)&location.m31 = CAColorMatrixIdentity[4];
      float32x4_t v36 = CAColorMatrixIdentity[1];
      *(float32x4_t *)&location.m11 = CAColorMatrixIdentity[0];
      *(float32x4_t *)&location.m13 = v36;
    }
    if ((vminvq_u8((uint8x16_t)vcltzq_s8(vshlq_n_s8(vuzp1q_s8((int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(*(float32x4_t *)&location.m11, v124), (int16x8_t)vceqq_f32(*(float32x4_t *)&location.m13, v121)), (int8x16_t)vuzp1q_s16((int16x8_t)vceqq_f32(*(float32x4_t *)&location.m21, v119), (int16x8_t)vceqq_f32(*(float32x4_t *)&location.m23, v115))), 7uLL))) & 1) == 0|| (~vaddvq_s32((int32x4_t)vandq_s8((int8x16_t)vcltzq_s32(vshlq_n_s32(vceqq_f32(*(float32x4_t *)&location.m31, v117), 0x1FuLL)), (int8x16_t)xmmword_100012E70)) & 0xF) != 0)
    {
      v113 = v3;
      float32x4_t v137 = v124;
      float32x4_t v138 = v121;
      float32x4_t v139 = v119;
      float32x4_t v140 = v115;
      float32x4_t v141 = v117;
      v37 = +[NSValue valueWithCAColorMatrix:&v137];
      if (v32)
      {
        v125 = (void *)PKCATrackedLayoutGetTracker();
        uint64_t v38 = [v30 presentationLayer];
        v39 = (void *)v38;
        if (v38) {
          v40 = (void *)v38;
        }
        else {
          v40 = v30;
        }
        id v41 = v40;

        v122 = v41;
        v42 = [v41 valueForKeyPath:@"filters.colorMatrix.inputColorMatrix"];
        v43 = v42;
        float32x4_t v140 = 0u;
        float32x4_t v141 = 0u;
        float32x4_t v138 = 0u;
        float32x4_t v139 = 0u;
        float32x4_t v137 = 0u;
        if (v42)
        {
          [v42 CAColorMatrixValue];
        }
        else
        {
          float32x4_t v44 = CAColorMatrixIdentity[3];
          float32x4_t v139 = CAColorMatrixIdentity[2];
          float32x4_t v140 = v44;
          float32x4_t v141 = CAColorMatrixIdentity[4];
          float32x4_t v45 = CAColorMatrixIdentity[1];
          float32x4_t v137 = CAColorMatrixIdentity[0];
          float32x4_t v138 = v45;
        }
        v46 = [(PKSpringAnimationFactory *)v32 springAnimationWithKeyPath:@"filters.colorMatrix.inputColorMatrix", v25];
        [v46 setAdditive:0];
        *(float32x4_t *)&v136.m23 = v140;
        *(float32x4_t *)&v136.m31 = v141;
        *(float32x4_t *)&v136.m13 = v138;
        *(float32x4_t *)&v136.m21 = v139;
        *(float32x4_t *)&v136.m11 = v137;
        v47 = +[NSValue valueWithCAColorMatrix:&v136];
        [v46 setFromValue:v47];

        [v46 setToValue:v37];
        [v125 trackAnimation:v46];
        [v30 removeAnimationForKey:@"colorMatrix"];
        [v30 addAnimation:v46 forKey:@"colorMatrix"];

        v25 = v112;
      }
      [v30 setValue:v37 forKeyPath:@"filters.colorMatrix.inputColorMatrix"];

      id v3 = v113;
    }

    v21 = v126;
    Tracker = v127;
  }
  if (!self->_content)
  {
LABEL_64:

    return;
  }
  double v123 = v9;
  BOOL v48 = self->_visible;
  if (v48)
  {
    int state = self->_state;
    BOOL v50 = state != 1;
    if (state == 1) {
      double v51 = 0.95;
    }
    else {
      double v51 = 1.0;
    }
  }
  else
  {
    BOOL v50 = 0;
    double v51 = 0.95;
  }
  BOOL v52 = self->_contentVisible || self->_contentVisibilityAnimationCounter != 0;
  v145[0] = _NSConcreteStackBlock;
  v145[1] = 3221225472;
  v145[2] = sub_1000082F8;
  v145[3] = &unk_100014658;
  v145[4] = self;
  BOOL v147 = v48;
  v53 = v21;
  v146 = v53;
  v54 = objc_retainBlock(v145);
  v55 = v54;
  if (v127)
  {
    objc_initWeak((id *)&location, self);
    ++self->_contentVisibilityAnimationCounter;
    v143[0] = _NSConcreteStackBlock;
    v143[1] = 3221225472;
    v143[2] = sub_100008544;
    v143[3] = &unk_100014680;
    objc_copyWeak(&v144, (id *)&location);
    [v127 performTransactionWithBlock:v55 completion:v143];
    objc_destroyWeak(&v144);
    objc_destroyWeak((id *)&location);
  }
  else
  {
    ((void (*)(void *))v54[2])(v54);
  }
  memset(&location, 0, sizeof(location));
  if (v50)
  {
    long long v56 = *(_OWORD *)&CATransform3DIdentity.m33;
    *(_OWORD *)&location.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
    *(_OWORD *)&location.m33 = v56;
    long long v57 = *(_OWORD *)&CATransform3DIdentity.m43;
    *(_OWORD *)&location.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
    *(_OWORD *)&location.m43 = v57;
    long long v58 = *(_OWORD *)&CATransform3DIdentity.m13;
    *(_OWORD *)&location.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
    *(_OWORD *)&location.m13 = v58;
    long long v59 = *(_OWORD *)&CATransform3DIdentity.m23;
    *(_OWORD *)&location.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
    *(_OWORD *)&location.m23 = v59;
  }
  else
  {
    CATransform3DMakeScale(&location, v51, v51, 1.0);
  }
  content = self->_content;
  id v61 = [v127 beginTrackingAnimation];
  CATransform3D v136 = location;
  [(UIView *)content pkui_setTransform:&v136 withAdditiveAnimationFactory:v53 completion:v61];

  if (v53 != 0 && v52) {
    v62 = v53;
  }
  else {
    v62 = 0;
  }
  v128[0] = _NSConcreteStackBlock;
  v128[1] = 3221225472;
  v128[2] = sub_100008594;
  v128[3] = &unk_1000146D0;
  double v120 = v5;
  double v132 = v5;
  double v133 = v7;
  double v134 = v123;
  double v135 = v11;
  v63 = v62;
  v129 = v63;
  id v64 = v127;
  id v130 = v64;
  v131 = self;
  v65 = objc_retainBlock(v128);
  double v66 = v11;
  double v67 = v7 + v13;
  double v118 = v15;
  double v68 = v66 - (v13 + v17);
  double v116 = v123 - (v15 + v19);
  double v69 = ((double (*)(void))v65[2])();
  double v71 = v70;
  double v73 = v72;
  double v75 = v74;
  v76 = self->_content;
  id v77 = [v64 beginTrackingAnimation];
  -[UIView pkui_setBounds:withAdditiveAnimationFactory:completion:](v76, "pkui_setBounds:withAdditiveAnimationFactory:completion:", v63, v77, v69, v71, v73, v75);

  if (v51 != 1.0)
  {
    PKFloatRoundToPixel();
    PKFloatRoundToPixel();
  }
  PKSizeAlignedInRect();
  double v79 = v78;
  double v81 = v80;
  double v83 = v82;
  double v85 = fmax(fmin(v84, v67 + v68 - v82), v67);
  if (self->_state)
  {
LABEL_63:
    [(UIView *)self->_content anchorPoint];
    double v107 = fmax(fmin(v79, v120 + v118 + v116 - v81), v120 + v118) + v106 * v81;
    double v109 = v85 + v108 * v83;
    v110 = self->_content;
    id v111 = [v64 beginTrackingAnimation];
    -[UIView pkui_setPosition:withAdditiveAnimationFactory:completion:](v110, "pkui_setPosition:withAdditiveAnimationFactory:completion:", v63, v111, v107, v109);

    v21 = v126;
    Tracker = v127;
    goto LABEL_64;
  }
  v114 = v3;
  id v86 = v3;
  if (v86)
  {
    v87 = v86;
    v88 = [v86 window];
    v89 = v88;
    if (v88)
    {
      v90 = [v88 windowScene];
      v91 = v90;
      if (v90)
      {
        v92 = [v90 screen];
        v93 = v92;
        if (v92)
        {
          v94 = [v92 fixedCoordinateSpace];
          v95 = v94;
          if (v94)
          {
            [v94 bounds];
            LAUIPhysicalButtonNormalizedFrame();
            PKRectRoundToPixel();
            [v87 convertRect:v95 fromCoordinateSpace:];
            CGFloat x = v96;
            double y = v98;
            CGFloat width = v100;
            double height = v102;
          }
          else
          {
            CGFloat x = CGRectNull.origin.x;
            double y = CGRectNull.origin.y;
            CGFloat width = CGRectNull.size.width;
            double height = CGRectNull.size.height;
          }
        }
        else
        {
          CGFloat x = CGRectNull.origin.x;
          double y = CGRectNull.origin.y;
          CGFloat width = CGRectNull.size.width;
          double height = CGRectNull.size.height;
        }
      }
      else
      {
        CGFloat x = CGRectNull.origin.x;
        double y = CGRectNull.origin.y;
        CGFloat width = CGRectNull.size.width;
        double height = CGRectNull.size.height;
      }
    }
    else
    {
      CGFloat x = CGRectNull.origin.x;
      double y = CGRectNull.origin.y;
      CGFloat width = CGRectNull.size.width;
      double height = CGRectNull.size.height;
    }

    v149.origin.CGFloat x = x;
    v149.origin.double y = y;
    v149.size.CGFloat width = width;
    v149.size.double height = height;
    BOOL IsNull = CGRectIsNull(v149);
    double v105 = fmax(v85, y + height);
    if (!IsNull) {
      double v85 = v105;
    }
    id v3 = v114;
    goto LABEL_63;
  }
LABEL_65:
  __break(1u);
}

- (void)_tapRecognized:(id)a3
{
  if (self) {
    sub_10000A1A4((uint64_t)self, 0);
  }
}

- (void)didInvalidateForRemoteAlert
{
  v3.receiver = self;
  v3.super_class = (Class)PKRemoteApplicationAuthorizationViewController;
  [(PKRemoteApplicationAuthorizationViewController *)&v3 didInvalidateForRemoteAlert];
  sub_10000A1A4((uint64_t)self, 1);
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(void))a4;
  double v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    float32x4_t v36 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): configuring.", buf, 0xCu);
  }

  if (self->_configured)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      float32x4_t v36 = self;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): already configured once - ignoring configuration request.", buf, 0xCu);
    }

    goto LABEL_5;
  }
  self->_configured = 1;
  if (!self->_invalidated)
  {
    double v9 = [(PKRemoteApplicationAuthorizationViewController *)self _remoteViewControllerProxy];
    [v9 setWallpaperStyle:1 withDuration:0.0];
    [v9 setLaunchingInterfaceOrientation:1];
    [v9 setAllowsSiri:0];
    [v9 setDesiredHardwareButtonEvents:0];
    [v9 setSwipeDismissalStyle:0];
    [v9 setDismissalAnimationStyle:0];
    double v10 = +[UIDevice currentDevice];
    unint64_t v11 = (unint64_t)[v10 userInterfaceIdiom];

    if ((v11 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        float32x4_t v36 = self;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): pad not supported.", buf, 0xCu);
      }

      double v12 = [v6 xpcEndpoint];
      id v13 = 0;
    }
    else
    {
      uint64_t v14 = [v6 xpcEndpoint];
      if (v14)
      {
        double v12 = (void *)v14;
        id v15 = objc_alloc_init((Class)NSXPCListenerEndpoint);
        double v16 = v15;
        if (v15)
        {
          [v15 _setEndpoint:v12];
          id v13 = [objc_alloc((Class)NSXPCConnection) initWithListenerEndpoint:v16];
          p_uiConnection = (id *)&self->_uiConnection;
          objc_storeStrong((id *)&self->_uiConnection, v13);
          if (self->_uiConnection)
          {

            double v18 = PKLogFacilityTypeGetObject();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218240;
              float32x4_t v36 = self;
              __int16 v37 = 2048;
              id v38 = v13;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "PKRemoteApplicationAuthorizationViewController (%p): created ui-connection %p.", buf, 0x16u);
            }

            id v19 = *p_uiConnection;
            v20 = (void *)PKApplicationAuthorizationViewServiceInterface_Service();
            [v19 setExportedInterface:v20];

            id v21 = *p_uiConnection;
            v22 = (void *)PKApplicationAuthorizationViewServiceInterface_Remote();
            [v21 setRemoteObjectInterface:v22];

            [*p_uiConnection setExportedObject:self];
            id v23 = *p_uiConnection;
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_10000AF80;
            v33[3] = &unk_100014998;
            v33[4] = self;
            id v24 = v13;
            id v34 = v24;
            v25 = self;
            [v23 setInterruptionHandler:v33];
            id v26 = *p_uiConnection;
            id v27 = _NSConcreteStackBlock;
            uint64_t v28 = 3221225472;
            double v29 = sub_10000B0A8;
            id v30 = &unk_100014998;
            v31 = v25;
            id v13 = v24;
            id v32 = v13;
            [v26 setInvalidationHandler:&v27];
            [*p_uiConnection activate:v27, v28, v29, v30, v31];

            v7[2](v7);
            goto LABEL_20;
          }
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            sub_10000CE78((uint64_t)self, v8);
          }

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            float32x4_t v36 = self;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): failed to create ui-connection.", buf, 0xCu);
          }
        }
        else
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
            sub_10000CE00((uint64_t)self, v8);
          }

          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            float32x4_t v36 = self;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): failed to create listener endpoint.", buf, 0xCu);
          }
          id v13 = 0;
        }
      }
      else
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          float32x4_t v36 = self;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): configuration missing endpoint - invalidating.", buf, 0xCu);
        }

        id v13 = 0;
        double v12 = 0;
      }
    }
    v7[2](v7);
    sub_10000A1A4((uint64_t)self, 0);
LABEL_20:

    goto LABEL_21;
  }
LABEL_5:
  v7[2](v7);
LABEL_21:
}

- (void)prepareForActivationWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  double v7 = (void (**)(void))a4;
  double v8 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): preparing.", buf, 0xCu);
  }

  if (!self->_activated)
  {
    self->_activated = 1;
    if (self->_invalidated)
    {
      v7[2](v7);
      goto LABEL_17;
    }
    double v9 = [v6 presentationTarget];
    double v10 = v9;
    if (v9
      && [v9 shouldDismissOnUILock]
      && ([v10 shouldDismissInSwitcher] & 1) != 0)
    {
      if (!PKDeviceLocked())
      {
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_10000B62C;
        v22[3] = &unk_1000149C0;
        id v23 = v7;
        double v12 = objc_retainBlock(v22);
        objc_initWeak(&location, self);
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_10000B754;
        v18[3] = &unk_100014880;
        id v13 = v12;
        id v19 = v13;
        objc_copyWeak(&v20, &location);
        uint64_t v14 = (void *)sub_100009FB0((uint64_t)self, v18);
        if (v14)
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_10000B860;
          v15[3] = &unk_100014A10;
          double v16 = v13;
          objc_copyWeak(&v17, &location);
          [v14 configurationWithReply:v15];
          objc_destroyWeak(&v17);
        }
        else
        {
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v25 = self;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): activating while missing ui-connection - invalidating.", buf, 0xCu);
          }

          ((void (*)(void *, PKRemoteApplicationAuthorizationViewController *, void, void))v13[2])(v13, self, 0, 0);
        }

        objc_destroyWeak(&v20);
        objc_destroyWeak(&location);

        goto LABEL_16;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v25 = self;
        unint64_t v11 = "PKRemoteApplicationAuthorizationViewController (%p): activating while locked - invalidating.";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = self;
      unint64_t v11 = "PKRemoteApplicationAuthorizationViewController (%p): activating with improperly configured presentation targ"
            "et - invalidating.";
      goto LABEL_14;
    }

    v7[2](v7);
    sub_10000A1A4((uint64_t)self, 0);
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = self;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PKRemoteApplicationAuthorizationViewController (%p): already activated once - ignoring activation request.", buf, 0xCu);
  }

  v7[2](v7);
LABEL_17:
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_invalidated || !self->_visible)
  {
    char v8 = 0;
  }
  else
  {
    double v9 = [(PKRemoteApplicationAuthorizationViewController *)self viewIfLoaded];
    if (v9
      && ([v7 locationInView:v9],
          double v11 = v10,
          double v13 = v12,
          objc_msgSend(v9, "pointInside:withEvent:", 0))
      && ((physicalButton = self->_physicalButton) == 0
       || (-[LAUIPhysicalButtonView convertPoint:fromView:](self->_physicalButton, "convertPoint:fromView:", v9, v11, v13), (-[LAUIPhysicalButtonView pointInside:withEvent:](physicalButton, "pointInside:withEvent:", 0) & 1) == 0)))
    {
      content = self->_content;
      if (content)
      {
        -[UIView convertPoint:fromView:](self->_content, "convertPoint:fromView:", v9, v11, v13);
        -[UIView hitTest:withEvent:](content, "hitTest:withEvent:", 0);
        id v17 = (UIView *)objc_claimAutoreleasedReturnValue();
        if (v17)
        {
          if (v17 == self->_content) {
            char v8 = -1;
          }
          else {
            char v8 = 0;
          }
        }
        else
        {
          char v8 = 1;
        }
      }
      else
      {
        char v8 = 1;
      }
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8 & 1;
}

- (void)authenticator:(id)a3 didTransitionToEvaluationStateWithEvent:(id)a4
{
  int64_t var1 = a4.var1;
  int64_t var0 = a4.var0;
  id v7 = a3;
  if (!self->_invalidated && self->_authenticating && !self->_authenticated)
  {
    int64_t authenticationEvaluationState = self->_authenticationEvaluationState;
    self->_int64_t authenticationEvaluationState = var0;
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10000BD58;
    v20[3] = &unk_100014A38;
    v20[4] = self;
    double v9 = objc_retainBlock(v20);
    double v10 = (void (**)(void, void, void, void))v9;
    int64_t authenticationCoachingState = self->_authenticationCoachingState;
    switch(var0)
    {
      case 0:
        if (var1 == 3)
        {
          uint64_t v12 = 0;
LABEL_28:
          uint64_t v16 = 1;
          goto LABEL_32;
        }
        if (var1 == 1)
        {
          if (PKPearlIsAvailable()) {
            uint64_t v12 = 3;
          }
          else {
            uint64_t v12 = 0;
          }
          goto LABEL_28;
        }
        unsigned int IsAvailable = PKPearlIsAvailable();
        uint64_t v12 = 0;
        if ((unint64_t)(authenticationEvaluationState - 1) < 2) {
          uint64_t v16 = IsAvailable;
        }
        else {
          uint64_t v16 = 0;
        }
LABEL_32:
        if (authenticationCoachingState == 3)
        {
          unsigned __int8 v18 = 2;
        }
        else
        {
          if (self->_state == 2) {
            int v19 = 1;
          }
          else {
            int v19 = v16;
          }
          if (v19) {
            unsigned __int8 v18 = 2;
          }
          else {
            unsigned __int8 v18 = 1;
          }
        }
        v10[2](v10, v18, v12, v16);
LABEL_26:

        break;
      case 1:
        if (PKPearlIsAvailable()) {
          uint64_t v13 = 4;
        }
        else {
          uint64_t v13 = 0;
        }
        goto LABEL_17;
      case 2:
        if (PKPearlIsAvailable()) {
          uint64_t v13 = 5;
        }
        else {
          uint64_t v13 = 1;
        }
LABEL_17:
        uint64_t v14 = (void (*)(void *, uint64_t, uint64_t, void))v10[2];
        if (authenticationCoachingState == 3) {
          uint64_t v15 = 2;
        }
        else {
          uint64_t v15 = 1;
        }
        double v9 = v10;
        goto LABEL_25;
      case 3:
        uint64_t v14 = (void (*)(void *, uint64_t, uint64_t, void))v9[2];
        uint64_t v15 = 0;
        goto LABEL_23;
      case 4:
        uint64_t v14 = (void (*)(void *, uint64_t, uint64_t, void))v9[2];
        uint64_t v15 = 2;
LABEL_23:
        uint64_t v13 = 0;
        goto LABEL_25;
      case 5:
        uint64_t v14 = (void (*)(void *, uint64_t, uint64_t, void))v9[2];
        uint64_t v15 = 1;
        uint64_t v13 = 8;
LABEL_25:
        v14(v9, v15, v13, 0);
        goto LABEL_26;
      default:
        goto LABEL_26;
    }
  }
}

- (void)authenticator:(id)a3 didTransitionToCoachingState:(int64_t)a4
{
  id v6 = a3;
  if (!self->_invalidated && self->_authenticating && !self->_authenticated && self->_authenticationCoachingState != a4)
  {
    self->_int64_t authenticationCoachingState = a4;
    if (a4 == 3 && self->_state == 1)
    {
      id v7 = v6;
      sub_100008D34(self, 2, 1);
      id v6 = v7;
    }
  }
}

- (void)presentPasscodeViewController:(id)a3 completionHandler:(id)a4 reply:(id)a5
{
  id v8 = a3;
  double v9 = (void (**)(id, void))a4;
  if (self->_invalidated || !self->_authenticating || self->_passcodeVC)
  {
    v9[2](v9, 0);
  }
  else
  {
    objc_storeStrong((id *)&self->_passcodeVC, a3);
    [v8 setModalPresentationStyle:6];
    [v8 setModalTransitionStyle:0];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000BFCC;
    v10[3] = &unk_1000145A8;
    double v11 = v9;
    [(PKRemoteApplicationAuthorizationViewController *)self presentViewController:v8 animated:1 completion:v10];
  }
}

- (void)dismissPasscodeViewController
{
  if (!self->_invalidated)
  {
    passcodeVC = self->_passcodeVC;
    self->_passcodeVC = 0;
    objc_super v3 = passcodeVC;

    id v6 = [(UIViewController *)v3 presentingViewController];
    unsigned __int8 v4 = [(UIViewController *)v3 isBeingDismissed];

    double v5 = v6;
    if (v6 && (v4 & 1) == 0)
    {
      [v6 dismissViewControllerAnimated:1 completion:0];
      double v5 = v6;
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passcode, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_passcodeVC, 0);
  objc_storeStrong((id *)&self->_physicalButton, 0);
  objc_storeStrong((id *)&self->_userIntentInstruction, 0);
  objc_storeStrong((id *)&self->_glyph, 0);
  objc_storeStrong((id *)&self->_background, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_springFactory, 0);
  objc_storeStrong((id *)&self->_authenticator, 0);
  objc_storeStrong((id *)&self->_target, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_visibilityCompletions, 0);

  objc_storeStrong((id *)&self->_uiConnection, 0);
}

@end