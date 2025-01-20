id sub_100001AE0()
{
  void *v0;
  uint64_t vars8;

  if (qword_100044058 != -1) {
    dispatch_once(&qword_100044058, &stru_100038708);
  }
  v0 = (void *)qword_100044060;

  return v0;
}

void sub_100001B34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = WFUIPresenterServiceInterface();
  [v3 setInterface:v4];

  v5 = +[BSServiceQuality userInitiated];
  [v3 setServiceQuality:v5];

  v6 = [*(id *)(a1 + 32) concretePresenter];
  [v3 setInterfaceTarget:v6];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100001C28;
  v7[3] = &unk_100038758;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
}

void sub_100001C28(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100001AE0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[WFUIPresentationServer listener:didReceiveConnection:withContext:]_block_invoke_2";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%s [Server-side] Connection to host was invalidated", (uint8_t *)&v6, 0xCu);
  }

  v5 = [*(id *)(a1 + 32) bannerManager];
  [v5 removeConnectedHost:v3];
}

void sub_100001D04(id a1)
{
  qword_100044060 = (uint64_t)os_log_create(WFLogSubsystem, "UIPresentationServer");

  _objc_release_x1();
}

void sub_100001DFC(uint64_t a1, void *a2)
{
  uint64_t v3 = WFLaunchAngelServiceDomain;
  id v4 = a2;
  [v4 setDomain:v3];
  [v4 setService:WFLaunchAngelUIPresenterServiceName];
  [v4 setDelegate:*(void *)(a1 + 32)];
}

id sub_100002254()
{
  if (qword_100044068 != -1) {
    dispatch_once(&qword_100044068, &stru_1000387A0);
  }
  v0 = (void *)qword_100044070;

  return v0;
}

void sub_1000022A8(id a1)
{
  qword_100044070 = (uint64_t)os_log_create(WFLogSubsystem, "AngelSceneManager");

  _objc_release_x1();
}

SBUIRemoteAlertButtonAction *__cdecl sub_100002680(id a1, SBUIRemoteAlertButtonAction *a2)
{
  unint64_t v2 = a2;
  uint64_t v3 = (SBUIRemoteAlertButtonAction *)(id)(v2 & ((uint64_t)((void)[(id)v2 events] << 59) >> 63));

  return v3;
}

void sub_100002808(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) activeScene];

  if (v2)
  {
    uint64_t v3 = sub_100002254();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "-[WFAngelSceneManager requestSceneDeactivation]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Invalidating scene...", (uint8_t *)&v5, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) activeScene];
    [v4 invalidate];
  }
}

void sub_100002B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002B4C(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  notify_get_state(token, &state64);
  if (!state64)
  {
    uint64_t v3 = (id *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained(v3);
    int v5 = [WeakRetained cancellationHandler];

    if (v5)
    {
      id v6 = objc_loadWeakRetained(v3);
      v7 = [v6 cancellationHandler];
      v7[2]();
    }
  }
}

void sub_100002CF4(id a1)
{
  qword_100044080 = objc_alloc_init(WFAngelSceneManager);

  _objc_release_x1();
}

void sub_1000032FC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setAlpha:0.0];
}

void sub_100003344(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setHidden:1];
}

id sub_10000338C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100003410;
  v2[3] = &unk_100038C80;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView animateWithDuration:v2 animations:0.4];
}

void sub_100003410(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) micaView];
  [v1 setAlpha:1.0];
}

id sub_1000035B0(uint64_t a1)
{
  [*(id *)(a1 + 32) setProgressSuppressionState:3];
  unint64_t v2 = *(void **)(a1 + 32);

  return [v2 setProgressSuppressionTimer:0];
}

id sub_100003738(uint64_t a1)
{
  [*(id *)(a1 + 32) updateMicaViewState];
  BOOL v2 = *(void *)(a1 + 40) != 4;
  uint64_t v3 = [*(id *)(a1 + 32) cancelButton];
  [v3 setHidden:v2];

  id result = [*(id *)(a1 + 32) progressSuppressionState];
  if (result != (id)3)
  {
    id v5 = [*(id *)(a1 + 32) activeLayoutMode];
    id v6 = *(void **)(a1 + 32);
    if (v5 == (id)4)
    {
      uint64_t v7 = 0;
      uint64_t v8 = 1;
    }
    else
    {
      uint64_t v7 = 1;
      uint64_t v8 = 0;
    }
    return [v6 setMicaViewHidden:v7 animated:v8];
  }
  return result;
}

id sub_10000397C(uint64_t a1)
{
  [*(id *)(a1 + 32) setLastKnownProgressValue:*(double *)(a1 + 40)];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 updateMicaViewState];
}

id sub_100003D34(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) CGColor];
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setBackgroundColor:v2];
}

void sub_10000489C(uint64_t a1)
{
  [*(id *)(a1 + 32) setAwaitingIconOwnershipSwap:0];
  id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
  [v2 setElementNeedsUpdate];
}

void sub_1000049F4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) systemApertureElementContext];
  [v1 setElementNeedsUpdate];
}

BOOL sub_1000050C8(void *a1)
{
  id v1 = a1;
  [v1 contentSize];
  UIRoundToViewScale();
  double v3 = v2;
  [v1 bounds];
  UIRoundToViewScale();
  double v5 = v4;

  return v3 > v5;
}

void sub_10000512C(uint64_t a1, double a2, double a3)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100005218;
    v6[3] = &unk_1000388A0;
    v6[4] = *(void *)(a1 + 32);
    *(double *)&v6[5] = a2;
    *(double *)&v6[6] = a3;
    +[UIView animateWithDuration:0 delay:v6 options:0 animations:0.35 completion:0.0];
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) embeddedScrollView];
    [v5 setContentOffset:a2, a3];
  }
}

void sub_100005218(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) embeddedScrollView];
  [v2 setContentOffset:*(double *)(a1 + 40), *(double *)(a1 + 48)];
}

id sub_100005338(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000053E8;
  v3[3] = &unk_100038AA0;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = *(void *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_1000053E8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dimmingView];
  [v2 setAlpha:*(double *)(a1 + 40)];
}

void sub_1000059C0(uint64_t a1)
{
  [*(id *)(a1 + 32) poofResponse];
  double v3 = v2;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100005FE8;
  v19[3] = &unk_100038850;
  uint64_t v22 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  long long v23 = *(_OWORD *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 40);
  id v20 = v4;
  uint64_t v21 = v5;
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v19 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  id v6 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v7 = [v6 blurFilterEnabled];

  if (v7)
  {
    [*(id *)(a1 + 32) poofBlurDelay];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000060D8;
    block[3] = &unk_100038BC0;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 40);
    id v17 = v10;
    uint64_t v18 = v11;
    dispatch_after(v9, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  if ([*(id *)(a1 + 32) alphaOutEnabled])
  {
    [*(id *)(a1 + 32) poofAlphaResponse];
    double v13 = v12;
    [*(id *)(a1 + 32) poofAlphaDelay];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000061B4;
    v15[3] = &unk_100038C80;
    v15[4] = *(void *)(a1 + 40);
    +[UIView animateWithDuration:0 delay:v15 options:0 animations:v13 completion:v14];
  }
}

void sub_100005BDC(uint64_t a1)
{
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005E58;
  v10[3] = &unk_100038878;
  long long v13 = *(_OWORD *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v11 = v5;
  uint64_t v12 = v6;
  *(float *)&double v7 = minimum;
  *(float *)&double v8 = maximum;
  *(float *)&double v9 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v10, v7, v8, v9);
}

uint64_t sub_100005CC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100005CD4(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005DC4;
  v3[3] = &unk_100038C80;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100005D7C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) embeddedScrollView];
  [v1 setBounces:1];
}

void sub_100005DC4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v6[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v6[1] = v3;
  v6[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v6];

  CAFrameRateRange v4 = [*(id *)(a1 + 32) view];
  id v5 = [v4 layer];
  [v5 setValue:&off_10003B0C0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_100005E58(uint64_t a1)
{
  double v2 = *(double *)(a1 + 56);
  [*(id *)(a1 + 32) phase1_artificialInitialOffset];
  if (v2 <= 0.0) {
    double v4 = -v3;
  }
  else {
    double v4 = v3;
  }
  double v5 = 0.0;
  if (v4 < 0.0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) view];
    [v6 bounds];
    double v8 = v7;
    [*(id *)(a1 + 32) phase1_initialScale];
    double v5 = v8 * (1.0 - v9) * -0.5;
  }
  CGFloat v10 = v4 + v5;
  [*(id *)(a1 + 32) phase1_initialScale];
  CGFloat v12 = v11;
  [*(id *)(a1 + 32) phase1_initialScale];
  CGAffineTransformMakeScale(&t1, v12, v13);
  CGAffineTransformMakeTranslation(&t2, 0.0, v10);
  CGAffineTransformConcat(&v23, &t1, &t2);
  CAFrameRateRange v14 = [*(id *)(a1 + 40) view];
  CGAffineTransform v20 = v23;
  [v14 setTransform:&v20];

  v15 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v16 = [v15 blurFilterEnabled];

  if (v16)
  {
    id v17 = [*(id *)(a1 + 40) view];
    uint64_t v18 = [v17 layer];
    [*(id *)(a1 + 32) phase1_initialBlurRadius];
    v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    [v18 setValue:v19 forKeyPath:@"filters.gaussianBlur.inputRadius"];
  }
}

void sub_100005FE8(uint64_t a1)
{
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006378;
  v9[3] = &unk_100038850;
  uint64_t v12 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  long long v13 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 40);
  id v10 = v5;
  uint64_t v11 = v6;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, COERCE_DOUBLE(__PAIR64__(DWORD1(v13), LODWORD(minimum))), v7, v8);
}

void sub_1000060D8(uint64_t a1)
{
  [*(id *)(a1 + 32) poofBlurResponse];
  double v3 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000061FC;
  _OWORD v6[3] = &unk_100038BC0;
  int8x16_t v5 = *(int8x16_t *)(a1 + 32);
  id v4 = (id)v5.i64[0];
  int8x16_t v7 = vextq_s8(v5, v5, 8uLL);
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v6 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
}

void sub_1000061B4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

void sub_1000061FC(uint64_t a1)
{
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000062DC;
  v9[3] = &unk_100038BC0;
  int8x16_t v5 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);
}

void sub_1000062DC(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) view];
  double v2 = [v4 layer];
  [*(id *)(a1 + 40) poofBlurRadius];
  double v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_100006378(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48);
  double v3 = *(void **)(a1 + 32);
  if (v2 <= 0.0) {
    [v3 poofScaleUp];
  }
  else {
    [v3 poofScaleDown];
  }
  double v5 = v4;
  double v6 = *(double *)(a1 + 64);
  if (v6 <= 0.0)
  {
    double v9 = 0.0;
    if (v6 < 0.0)
    {
      if ([*(id *)(a1 + 32) fixedEndTranslationUpEnabled])
      {
        id v10 = *(void **)(a1 + 40);
        [*(id *)(a1 + 32) fixedEndTranslationUp];
        double v12 = v11;
        [*(id *)(a1 + 32) poof_scale_multiplier_y];
        double v14 = v5 * v13;
        v15 = [*(id *)(a1 + 40) view];
        [v15 bounds];
        [v10 topEdgeClampedTranslationForTranslation:v12 scale:v14 height:v16];
        double v9 = v17;

        uint64_t v18 = [*(id *)(a1 + 40) view];
        [v18 bounds];
        double v20 = v19;

        if (v20 > 200.0)
        {
          uint64_t v21 = [*(id *)(a1 + 40) view];
          [v21 bounds];
          double v23 = (v22 + -200.0) * 0.08;

          double v9 = v9 + v23;
        }
      }
      else
      {
        double v24 = *(double *)(a1 + 48);
        [*(id *)(a1 + 32) poofThrowDistanceUp];
        double v26 = v24 - v25;
        if (v26 <= -25.0) {
          double v9 = v26;
        }
        else {
          double v9 = -25.0;
        }
      }
    }
  }
  else
  {
    double v7 = *(double *)(a1 + 48);
    [*(id *)(a1 + 32) poofThrowDistanceDown];
    double v9 = v7 + v8;
  }
  [*(id *)(a1 + 32) poof_scale_multiplier_y];
  CGAffineTransformMakeScale(&t1, v5, v5 * v27);
  CGAffineTransformMakeTranslation(&t2, 0.0, v9);
  CGAffineTransformConcat(&v32, &t1, &t2);
  v28 = [*(id *)(a1 + 40) view];
  CGAffineTransform v29 = v32;
  [v28 setTransform:&v29];
}

id sub_100006938(uint64_t a1)
{
  CAFrameRateRange v6 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006B34;
  v3[3] = &unk_1000389D8;
  v3[4] = *(void *)(a1 + 32);
  void v3[5] = *(void *)(a1 + 40);
  long long v4 = *(_OWORD *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 64);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v6.minimum, *(double *)&v6.maximum, *(double *)&v6.preferred);
}

id sub_1000069F8(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100006AA8;
  v3[3] = &unk_100038AA0;
  v3[4] = *(void *)(a1 + 32);
  void v3[5] = *(void *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100006AA8(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) view];
  double v2 = [v4 layer];
  double v3 = +[NSNumber numberWithDouble:*(double *)(a1 + 40)];
  [v2 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_100006B34(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = *(double *)(a1 + 40);
  double v4 = *(double *)(a1 + 56);
  uint64_t v5 = [v2 view];
  [v5 bounds];
  [v2 topEdgeClampedTranslationForTranslation:v3 scale:v4 height:v6];
  CGFloat v8 = v7;

  CGAffineTransformMakeScale(&t1, *(CGFloat *)(a1 + 48), *(CGFloat *)(a1 + 56));
  CGAffineTransformMakeTranslation(&t2, *(CGFloat *)(a1 + 64), v8);
  CGAffineTransformConcat(&v13, &t1, &t2);
  double v9 = [*(id *)(a1 + 32) view];
  CGAffineTransform v10 = v13;
  [v9 setTransform:&v10];
}

void sub_100007528(id a1)
{
  qword_100044088 = +[WFBannerPrototypeSettingsDomain rootSettings];

  _objc_release_x1();
}

void sub_100007EC0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) activeLayoutMode] == (id)4)
  {
    [*(id *)(a1 + 32) setOverrideLayoutMode:3];
    id v2 = [*(id *)(a1 + 32) systemApertureElementContext];
    [v2 requestTransitionToPreferredLayoutMode];
  }
}

void sub_100007FC0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) progressView];
  id v2 = [*(id *)(a1 + 32) progress];
  [v2 fractionCompleted];
  [v3 updateProgressWithValue:];
}

id sub_100008190(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

void sub_10000899C(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialPresentationTransitioning:0];
  id v2 = [*(id *)(a1 + 32) pendingDelayedAttribution];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    double v4 = [v3 pendingDelayedAttribution];
    [v3 setAttribution:v4];

    uint64_t v5 = *(void **)(a1 + 32);
    [v5 setPendingDelayedAttribution:0];
  }
}

void sub_10000B9F4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) materialView];
  id v1 = [v2 layer];
  [v1 setShadowOpacity:0.0];
}

void sub_10000BA54(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 endEditing:1];
}

id sub_10000BBC8(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000BC70;
  v3[3] = &unk_100038C80;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_10000BC70(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setAlpha:0.0];
}

void sub_10000BF78(uint64_t a1)
{
  id v9 = (id)objc_opt_new();
  [v9 setAlpha:0.0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 insertSubview:v9 atIndex:0];

  [*(id *)(a1 + 32) setDimmingView:v9];
  [*(id *)(a1 + 32) layoutDimmingLayer];
  id v3 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v4 = [v3 bannerFramesEnabled];

  if (v4)
  {
    uint64_t v5 = [v9 layer];
    id v6 = +[UIColor systemWhiteColor];
    [v5 setBorderColor:[v6 CGColor]];

    double v7 = [v9 layer];
    [v7 setBorderWidth:4.0];
  }
  id v8 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:*(void *)(a1 + 32) action:"handleTapGesture:"];
  [v9 addGestureRecognizer:v8];
}

id sub_10000C0B8(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000C168;
  v3[3] = &unk_100038B18;
  v3[4] = *(void *)(a1 + 32);
  char v4 = *(unsigned char *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

void sub_10000C168(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) dimmingView];
  [v2 setAlpha:v1];
}

id sub_10000C9D4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateHomeGestureOwnership];
  [*(id *)(a1 + 32) updateDimmingLayerVisibility];
  id v2 = *(void **)(a1 + 32);
  [v2 bannerSize];

  return [v2 setPreferredContentSize:];
}

void sub_10000D708(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10000D730(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained systemIdleTimerOverrideAssertion];
  [v1 invalidate];

  [WeakRetained setSystemIdleTimerOverrideAssertion:0];
  id v2 = [WeakRetained localIdleTimer];
  [v2 cancel];

  [WeakRetained setLocalIdleTimer:0];
}

void sub_10000DB90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000DBB8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10000E480;
  v2[3] = &unk_100038BC0;
  double v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_10000DC40(id *a1)
{
  if ([a1[4] dismissalPhase] != (id)2)
  {
    [a1[4] setDismissalPhase:2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000DE30;
    block[3] = &unk_100038C30;
    id v2 = a1[5];
    id v3 = a1[4];
    id v5 = v2;
    id v6 = v3;
    id v7 = a1[6];
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_10000DD04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) embeddedPlatter];
  double v1 = [v2 scrollView];
  [v1 setAutoresizingMask:0];
}

id sub_10000DD64(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) dismissalPhase];
  if (result == (id)1)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return (id)v3();
  }
  return result;
}

id sub_10000DDBC(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateDimmingLayerVisibility];
}

void sub_10000DDC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDismissalPhase:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained setDismissalCompletionTimer:0];
}

void sub_10000DE30(id *a1)
{
  if ([a1[4] disableTransition])
  {
    double v22 = [a1[5] containerView];
    [v22 setAlpha:0.0];
  }
  else
  {
    [a1[4] poofOutScaleResponse];
    double v3 = v2;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_10000E13C;
    v27[3] = &unk_100038C30;
    id v4 = a1[4];
    id v5 = a1[5];
    id v6 = a1[6];
    id v28 = v4;
    id v29 = v5;
    id v30 = v6;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v27 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v3 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    id v7 = [a1[5] containerView];
    long long v8 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v26[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v26[1] = v8;
    v26[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v7 setTransform:v26];

    id v9 = +[WFBannerPrototypeSettings sharedSettings];
    unsigned int v10 = [v9 blurFilterEnabled];

    if (v10)
    {
      double v11 = [a1[5] containerView];
      double v12 = [v11 layer];
      [v12 setValue:&off_10003B0D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];

      [a1[4] poofOutBlurResponse];
      double v14 = v13;
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000E22C;
      v24[3] = &unk_100038BC0;
      *(_OWORD *)uint64_t v21 = *((_OWORD *)a1 + 2);
      id v15 = v21[0];
      int8x16_t v25 = vextq_s8(*(int8x16_t *)v21, *(int8x16_t *)v21, 8uLL);
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v24 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v14 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    }
    double v16 = [a1[6] gestureSettings:v21[0]];
    unsigned int v17 = [v16 alphaOutEnabled];

    if (v17)
    {
      [a1[4] poofOutAlphaResponse];
      double v19 = v18;
      [a1[4] poofOutAlphaDelay];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_10000E30C;
      v23[3] = &unk_100038C80;
      v23[4] = a1[5];
      +[UIView animateWithDuration:0 delay:v23 options:0 animations:v19 completion:v20];
    }
  }
}

void sub_10000E13C(uint64_t a1)
{
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v15.minimum;
  float maximum = v15.maximum;
  float preferred = v15.preferred;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000E3F0;
  v11[3] = &unk_100038C30;
  id v5 = *(id *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  id v12 = v5;
  uint64_t v13 = v6;
  id v14 = v7;
  *(float *)&double v8 = minimum;
  *(float *)&double v9 = maximum;
  *(float *)&double v10 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v11, v8, v9, v10);
}

void sub_10000E22C(uint64_t a1)
{
  CAFrameRateRange v11 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v11.minimum;
  float maximum = v11.maximum;
  float preferred = v11.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000E354;
  v9[3] = &unk_100038BC0;
  id v5 = *(void **)(a1 + 40);
  void v9[4] = *(void *)(a1 + 32);
  id v10 = v5;
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);
}

void sub_10000E30C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setAlpha:0.0];
}

void sub_10000E354(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) containerView];
  double v2 = [v4 layer];
  [*(id *)(a1 + 40) poofOutBlurRadius];
  double v3 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
  [v2 setValue:v3 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_10000E3F0(id *a1)
{
  [a1[4] poofOutScale];
  CGFloat v3 = v2;
  id v4 = [a1[6] gestureSettings];
  [v4 poof_scale_multiplier_y];
  CGAffineTransformMakeScale(&v8, v3, v3 * v5);
  double v6 = [a1[5] containerView];
  CGAffineTransform v7 = v8;
  [v6 setTransform:&v7];
}

void sub_10000E480(uint64_t a1)
{
  if (UIAccessibilityIsReduceMotionEnabled())
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10000E644;
    v14[3] = &unk_100038C80;
    v14[4] = *(void *)(a1 + 32);
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v14 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:1.0 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    memset(&v13, 0, sizeof(v13));
    [*(id *)(a1 + 40) hintAnimationTargetScale];
    CGFloat v3 = v2;
    [*(id *)(a1 + 40) hintAnimationTargetScale];
    CGAffineTransformMakeScale(&v13, v3, v4);
    [*(id *)(a1 + 40) hintAnimationResponse];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    long long v10 = *(_OWORD *)&v13.a;
    long long v11 = *(_OWORD *)&v13.c;
    v9[2] = sub_10000E690;
    v9[3] = &unk_100038988;
    void v9[4] = *(void *)(a1 + 32);
    long long v12 = *(_OWORD *)&v13.tx;
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v9 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    double v6 = [*(id *)(a1 + 32) containerView];
    long long v7 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v8[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v8[1] = v7;
    v8[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v6 setTransform:v8];
  }
}

void sub_10000E644(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setAlpha:0.6];
}

id sub_10000E690(uint64_t a1)
{
  CAFrameRateRange v8 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000E74C;
  v4[3] = &unk_100038988;
  v4[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  long long v7 = *(_OWORD *)(a1 + 72);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v8.minimum, *(double *)&v8.maximum, *(double *)&v8.preferred);
}

void sub_10000E74C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView:*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80)];
  [v1 setTransform:&v2];
}

void sub_10000E870(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dimmingView];
  [v1 setCaptureTouches:0];
}

void sub_10000EA50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10000EA78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setEmbeddedPlatter:*(void *)(a1 + 32)];
}

void sub_10000EF04(uint64_t a1, int a2)
{
  if (a2) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  CGFloat v4 = [*(id *)(a1 + 32) sashView];
  long long v5 = [v4 iconView];
  [v5 setAlpha:v3];

  id v7 = [*(id *)(a1 + 32) sashView];
  long long v6 = [v7 label];
  [v6 setAlpha:v3];
}

uint64_t sub_10000EFB4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000EFC8(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  v21.origin.x = v4;
  v21.origin.y = v6;
  v21.size.width = v8;
  v21.size.height = v10;
  if (!CGRectIsEmpty(v21))
  {
    [*(id *)(*(void *)(a1 + 32) + 104) sizeThatFits:v8, v10];
    BSRectWithSize();
    long long v11 = [*(id *)(a1 + 32) view];
    long long v12 = [v11 _window];
    CGAffineTransform v13 = [v12 screen];
    [v13 scale];
    UIRectIntegralWithScale();
    double v4 = v14;
    double v6 = v15;
    double v8 = v16;
    double v10 = v17;
  }
  double v18 = [*(id *)(a1 + 32) sashView];
  [v18 setFrame:v4, v6, v8, v10];

  id v19 = [*(id *)(a1 + 32) sashView];
  [v19 setNeedsLayout];
}

uint64_t sub_10000F128(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F13C(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) sashView];
  [v2 setIcon:*(void *)(a1 + 40)];

  double v3 = [*(id *)(a1 + 32) sashView];
  [v3 setTitle:*(void *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  double v4 = *(double *)(a1 + 72);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F248;
  v5[3] = &unk_100038F60;
  id v6 = *(id *)(a1 + 64);
  +[UIView animateWithDuration:0x20000 delay:v5 options:0 animations:v4 completion:0.0];
}

uint64_t sub_10000F234(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000F248(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F39C(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) materialView];
  [v2 _setContinuousCornerRadius:v1];
}

uint64_t sub_10000F3F0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000F500(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) embeddedPlatter];
  id v2 = [v3 view];
  [v2 setFrame:0.0, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56)];
}

void sub_100010288(_Unwind_Exception *a1)
{
}

id sub_1000102B0(uint64_t a1)
{
  CAFrameRateRange v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100010978;
  v4[3] = &unk_1000389D8;
  v4[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
}

void sub_100010364(uint64_t a1)
{
  CAFrameRateRange v15 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v15.minimum;
  float maximum = v15.maximum;
  float preferred = v15.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000108F0;
  v9[3] = &unk_100038A00;
  id v10 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v13 = v5;
  long long v14 = *(_OWORD *)(a1 + 80);
  id v11 = *(id *)(a1 + 40);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);
}

void sub_100010464(uint64_t a1)
{
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001088C;
  v9[3] = &unk_100038A50;
  id v10 = *(id *)(a1 + 32);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v12 = *(_OWORD *)(a1 + 48);
  long long v13 = v5;
  id v11 = *(id *)(a1 + 40);
  *(float *)&double v6 = minimum;
  *(float *)&double v7 = maximum;
  *(float *)&double v8 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v9, v6, v7, v8);
}

id sub_10001055C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBackgroundColor:*(void *)(a1 + 40)];
}

void sub_100010564(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleLabel];
  [v1 setAlpha:0.0];
}

void sub_1000105AC(uint64_t a1)
{
  [*(id *)(a1 + 32) setTitle:*(void *)(a1 + 40) forState:0];
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100010844;
  v2[3] = &unk_100038C80;
  id v3 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:0x20000 delay:v2 options:0 animations:0.3 completion:0.0];
}

id sub_100010664(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_100010670(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained activeTransitioningActionGroupViewPortal];
  [v1 removeFromSuperview];

  [WeakRetained setActiveTransitioningActionGroupViewPortal:0];
  [WeakRetained setActionGroupViewTransitionCompletionTimer:0];
}

id sub_1000106E0(uint64_t a1)
{
  CAFrameRateRange v7 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100010794;
  v4[3] = &unk_1000389D8;
  v4[4] = *(void *)(a1 + 32);
  long long v2 = *(_OWORD *)(a1 + 56);
  long long v5 = *(_OWORD *)(a1 + 40);
  long long v6 = v2;
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v4, *(double *)&v7.minimum, *(double *)&v7.maximum, *(double *)&v7.preferred);
}

void sub_100010794(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  id v10 = [*(id *)(a1 + 32) activeTransitioningActionGroupViewPortal];
  [v10 bounds];
  double v4 = v2 - v3;
  double v5 = *(double *)(a1 + 56);
  long long v6 = [*(id *)(a1 + 32) activeTransitioningActionGroupViewPortal];
  [v6 bounds];
  double v8 = v7;
  double v9 = [*(id *)(a1 + 32) activeTransitioningActionGroupViewPortal];
  [v9 setFrame:0.0, v4, v5, v8];
}

void sub_100010844(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) titleLabel];
  [v1 setAlpha:1.0];
}

id sub_10001088C(uint64_t a1)
{
  double v2 = *(double *)(a1 + 72);
  [*(id *)(a1 + 40) bounds];
  double v4 = v2 - v3;
  double v5 = *(double *)(a1 + 64);
  [*(id *)(a1 + 40) bounds];
  long long v6 = *(void **)(a1 + 32);

  return [v6 setFrame:0.0, v4, v5];
}

void sub_1000108F0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) clippingContentView];
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v6 = *(_OWORD *)(a1 + 48);
  long long v7 = v3;
  long long v8 = *(_OWORD *)(a1 + 80);
  [v2 setTransform:&v6];

  double v4 = [*(id *)(a1 + 40) clippingContentView];
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  long long v6 = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v7 = v5;
  long long v8 = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v4 setTransform:&v6];
}

void sub_100010978(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  id v5 = [*(id *)(a1 + 32) containerView];
  [v5 setFrame:v1, v2, v3, v4];
}

void sub_100010EA8(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000116B0;
  _OWORD v8[3] = &unk_100038C80;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v8, v5, v6, v7);
}

void sub_100010F84(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromParentViewController];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];
}

void sub_100010FDC(uint64_t a1)
{
  if (+[NSUserDefaults universalPreviewsEnabled])
  {
    id v2 = +[WFBannerPrototypeSettings sharedSettings];
    unsigned __int8 v3 = [v2 debugMorphTransitions];

    if ((v3 & 1) == 0)
    {
      double v4 = +[CAFilter filterWithType:kCAFilterGaussianBlur];
      [v4 setName:@"gaussianBlur"];
      [v4 setValue:&off_10003B0E0 forKey:kCAFilterInputRadius];
      [v4 setValue:&__kCFBooleanFalse forKey:kCAFilterInputNormalizeEdges];
      [v4 setValue:&__kCFBooleanFalse forKey:kCAFilterInputHardEdges];
      [v4 setValue:@"default" forKey:kCAFilterInputQuality];
      [v4 setValue:@"default" forKey:kCAFilterInputIntermediateBitDepth];
      double v5 = [*(id *)(a1 + 32) platterView];
      double v6 = [v5 layer];
      long long v12 = v4;
      double v7 = +[NSArray arrayWithObjects:&v12 count:1];
      [v6 setFilters:v7];

      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_100011444;
      v10[3] = &unk_100038C80;
      id v11 = *(id *)(a1 + 32);
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v10 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    }
  }
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011520;
  _OWORD v8[3] = &unk_100038C80;
  id v9 = *(id *)(a1 + 32);
  +[UIView _animateUsingSpringWithDampingRatio:1 response:v8 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.35 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
}

void sub_1000112A0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setAlpha:1.0];
}

id sub_1000112E8(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000113D8;
  v3[3] = &unk_100038C80;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100011390(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setAlpha:1.0];
}

void sub_1000113D8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerView];
  id v1 = [v2 layer];
  [v1 setValue:&off_10003B0D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_100011444(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100011644;
  _OWORD v8[3] = &unk_100038C80;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v8, v5, v6, v7);
}

void sub_100011520(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000115FC;
  _OWORD v8[3] = &unk_100038C80;
  id v9 = *(id *)(a1 + 32);
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v8, v5, v6, v7);
}

void sub_1000115FC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) platterView];
  [v1 setAlpha:1.0];
}

void sub_100011644(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platterView];
  id v1 = [v2 layer];
  [v1 setValue:&off_10003B0D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_1000116B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) platterView];
  [v2 setAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) platterView];
  unsigned __int8 v3 = [v4 layer];
  [v3 setValue:&off_10003B0E0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_1000118D8(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView:*(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80)];
  [v1 setTransform:&v2];
}

id sub_10001192C(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 56);
  v6[0] = *(_OWORD *)(a1 + 40);
  v6[1] = v2;
  v6[2] = *(_OWORD *)(a1 + 72);
  unsigned __int8 v3 = [*(id *)(a1 + 32) containerView];
  [v3 setTransform:v6];

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100011A08;
  v5[3] = &unk_100038C80;
  void v5[4] = *(void *)(a1 + 32);
  return +[UIView _animateUsingSpringWithDampingRatio:1 response:v5 tracking:0 dampingRatioSmoothing:0.5 responseSmoothing:0.6 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
}

void sub_100011A08(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v1 setTransform:v3];
}

void sub_1000125F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012634(uint64_t a1)
{
  long long v2 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned __int8 v3 = [v2 transitionSettings];

  if ([v3 disableTransition])
  {
    id v4 = [*(id *)(a1 + 32) containerView];
    [v4 setAlpha:1.0];
  }
  else
  {
    [v3 poofInScale];
    CGFloat v6 = v5;
    [v3 poofInScale];
    CGAffineTransformMakeScale(&v22, v6, v7);
    long long v8 = [*(id *)(a1 + 32) containerView];
    CGAffineTransform v21 = v22;
    [v8 setTransform:&v21];

    [v3 poofInScaleDamping];
    double v10 = v9;
    [v3 poofInScaleResponse];
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000129BC;
    v20[3] = &unk_100038C80;
    v20[4] = *(void *)(a1 + 32);
    +[UIView _animateUsingSpringWithDampingRatio:1 response:v20 tracking:0 dampingRatioSmoothing:v10 responseSmoothing:v11 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    long long v12 = +[WFBannerPrototypeSettings sharedSettings];
    unsigned int v13 = [v12 blurFilterEnabled];

    if (v13)
    {
      CAFrameRateRange v14 = [*(id *)(a1 + 32) containerView];
      CAFrameRateRange v15 = [v14 layer];
      [v3 poofInBlurRadius];
      double v16 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
      [v15 setValue:v16 forKeyPath:@"filters.gaussianBlur.inputRadius"];

      [v3 poofInBlurResponse];
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100012A64;
      v19[3] = &unk_100038C80;
      void v19[4] = *(void *)(a1 + 32);
      +[UIView _animateUsingSpringWithDampingRatio:1 response:v19 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:v17 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.0];
    }
    [v3 poofInAlphaResponse];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100012B0C;
    v18[3] = &unk_100038C80;
    v18[4] = *(void *)(a1 + 32);
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 2, v18, 0);
  }
}

void sub_100012910(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [WeakRetained updateDimmingLayerVisibility];
  [WeakRetained setViewIsAppearingHandler:0];
}

void sub_10001297C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetLocalIdleTimer];
}

id sub_1000129BC(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100012BC0;
  _OWORD v3[3] = &unk_100038C80;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

id sub_100012A64(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100012B54;
  _OWORD v3[3] = &unk_100038C80;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1835010, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

void sub_100012B0C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  [v1 setAlpha:1.0];
}

void sub_100012B54(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) containerView];
  id v1 = [v2 layer];
  [v1 setValue:&off_10003B0D0 forKeyPath:@"filters.gaussianBlur.inputRadius"];
}

void sub_100012BC0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) containerView];
  long long v2 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v3[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v3[1] = v2;
  v3[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v1 setTransform:v3];
}

id sub_100012CE0(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  [v1 bannerSize];

  return [v1 setPreferredContentSize:];
}

void sub_100013384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000133A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained resetLocalIdleTimer];
}

id sub_1000140D4()
{
  if (qword_100044098 != -1) {
    dispatch_once(&qword_100044098, &stru_100038B70);
  }
  v0 = (void *)qword_1000440A0;

  return v0;
}

void sub_100014128(id a1)
{
  qword_1000440A0 = (uint64_t)os_log_create(WFLogSubsystem, "BannerManager");

  _objc_release_x1();
}

void sub_100014404(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  double v5 = sub_1000140D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v12 = "-[WFBannerManager configuredDisplayLayoutMonitor]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Received monitor configuration change: %@", buf, 0x16u);
  }

  CGFloat v6 = sub_1000140D4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    long long v12 = "-[WFBannerManager configuredDisplayLayoutMonitor]_block_invoke";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s Received monitor configuration change: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100014660;
  block[3] = &unk_100038C80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if ([*(id *)(a1 + 32) shouldUpdateStateBasedOnLayout:v4]
    && [*(id *)(a1 + 32) shouldObserveDisplayLayout])
  {
    CGFloat v7 = sub_1000140D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      long long v12 = "-[WFBannerManager configuredDisplayLayoutMonitor]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s Display layout change matches conditions to present next banner, asking now", buf, 0xCu);
    }

    long long v8 = [*(id *)(a1 + 32) queue];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000146E8;
    v9[3] = &unk_100038C80;
    void v9[4] = *(void *)(a1 + 32);
    dispatch_async(v8, v9);
  }
}

void sub_100014660(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) presentedBanner];
  if (v1)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      long long v2 = v1;
    }
    else {
      long long v2 = 0;
    }
  }
  else
  {
    long long v2 = 0;
  }
  id v3 = v2;

  [v3 performLayoutUpdate];
}

id sub_1000146E8(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_updateStateWithReason:@"display lit"];
  long long v2 = *(void **)(a1 + 32);

  return [v2 setShouldObserveDisplayLayout:0];
}

void sub_1000148C8(uint64_t a1)
{
  long long v2 = +[WFApertureStatusViewController requestIdentifierForContext:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) bannerSource];
  CFStringRef v7 = @"id";
  long long v8 = v2;
  id v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  id v5 = [v3 revokePresentableWithRequestIdentifier:v2, @"WFBannerManager: single step home screen collapsed back to normal, dismissing", 1, v4, 0 reason animated userInfo error];

  CGFloat v6 = [*(id *)(a1 + 40) singleStepHomeScreenRevokeTimers];
  [v6 removeObjectForKey:*(void *)(a1 + 32)];
}

void sub_100014BAC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionUserInterfaceListener];
  id v1 = [v2 actionInterface];
  [v1 cancelPresentationWithCompletionHandler:&stru_100039130];
}

void sub_100014CAC(uint64_t a1)
{
  id v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) associatedRunningContext];
    int v7 = 136315394;
    long long v8 = "-[WFBannerManager bannerViewControllerHomeGestureDidPassThreshold:]_block_invoke";
    __int16 v9 = 2112;
    double v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s User dismissed via home gesture <%@>", (uint8_t *)&v7, 0x16u);
  }
  id v4 = [*(id *)(a1 + 40) dialogRequestCompletionHandler];

  if (v4)
  {
    id v5 = [*(id *)(a1 + 40) dialogRequestCompletionHandler];
    id v6 = [objc_alloc((Class)WFDialogResponse) initWithCancelled:1];
    ((void (**)(void, id, void))v5)[2](v5, v6, 0);

    [*(id *)(a1 + 40) setDialogRequestCompletionHandler:0];
  }
}

void sub_100014EC4(id *a1)
{
  unsigned __int8 v2 = [a1[4] hasPrefix:@"WFBannerManager: "];
  id v3 = sub_1000140D4();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      id v5 = [a1[5] associatedRunningContext];
      id v6 = a1[4];
      int v14 = 136315650;
      CAFrameRateRange v15 = "-[WFBannerManager bannerViewController:willDismissWithReason:]_block_invoke";
      __int16 v16 = 2112;
      double v17 = v5;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Banner (%@) will dismiss with reason: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  else
  {
    if (v4)
    {
      int v7 = [a1[5] associatedRunningContext];
      id v8 = a1[4];
      int v14 = 136315650;
      CAFrameRateRange v15 = "-[WFBannerManager bannerViewController:willDismissWithReason:]_block_invoke";
      __int16 v16 = 2112;
      double v17 = v7;
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s System will dismiss banner (%@) with reason: %@", (uint8_t *)&v14, 0x20u);
    }
    [a1[5] systemDismissedBanner];
    [a1[6] cancelAllPendingRequestsForSystemDismiss];
    __int16 v9 = [a1[6] actionUserInterfaceListener];
    double v10 = [v9 actionInterface];
    double v11 = [v10 runningContext];
    long long v12 = [a1[5] associatedRunningContext];
    unsigned int v13 = [v11 isEqual:v12];

    if (v13) {
      [a1[6] setActionUserInterfaceListener:0];
    }
  }
}

void sub_100015138(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) bannerPresentationCompletion];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) bannerPresentationCompletion];
    v3[2](v3, 1);

    BOOL v4 = *(void **)(a1 + 32);
    [v4 setBannerPresentationCompletion:0];
  }
}

void sub_10001530C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) queue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100015464;
  v4[3] = &unk_100038CA8;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void sub_1000153B0(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) viewControllerForPresenting];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100015454;
  _OWORD v3[3] = &unk_100038F60;
  id v4 = *(id *)(a1 + 40);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t sub_100015454(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100015464(uint64_t a1)
{
  unsigned __int8 v2 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v3 = [v2 useRemoteAlertsForActionInterfaceDialogRequests];

  id v4 = *(void **)(a1 + 32);
  if (v3) {
    [v4 queue_dismissRemoteAlertViewControllerWithReason:@"dismissing action UI scene"];
  }
  else {
    [v4 queue_dismissPresentableWithReason:@"dismissPlatterForActionUserInterface" interruptible:0 forced:0];
  }
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v5();
}

void sub_100015830(uint64_t a1)
{
  unsigned __int8 v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v31 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke";
    __int16 v32 = 2112;
    uint64_t v33 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Dialog finished: %@", buf, 0x16u);
  }

  id v4 = [*(id *)(a1 + 32) request];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  id v7 = *(id *)(a1 + 40);
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  id v9 = v8;

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100015BA8;
  v24[3] = &unk_100039070;
  char v29 = *(unsigned char *)(a1 + 56);
  void v24[4] = *(void *)(a1 + 48);
  id v25 = *(id *)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  id v10 = v6;
  id v27 = v10;
  id v11 = v9;
  id v28 = v11;
  long long v12 = objc_retainBlock(v24);
  unsigned int v13 = (void (**)(void))v12;
  if (v10 && v11)
  {
    int v14 = [v10 configuration];
    CAFrameRateRange v15 = [v14 workflowReference];
    __int16 v16 = [v11 promptedStatesData];
    id v17 = [v16 count];

    if (v17)
    {
      __int16 v18 = [v11 promptedStatesData];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      id v21[2] = sub_100015E28;
      v21[3] = &unk_1000390C0;
      id v22 = v14;
      id v23 = v15;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100015F20;
      v19[3] = &unk_1000390E8;
      void v19[4] = *(void *)(a1 + 48);
      double v20 = v13;
      [v18 if_mapAsynchronously:v21 completionHandler:v19];
    }
    else
    {
      v13[2](v13);
    }
  }
  else
  {
    ((void (*)(void *))v12[2])(v12);
  }
}

void sub_100015BA8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    unsigned __int8 v2 = sub_1000140D4();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      CAFrameRateRange v15 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Asked to wait for follow up", buf, 0xCu);
    }

    uint64_t v3 = [*(id *)(a1 + 40) associatedRunningContext];
    [*(id *)(a1 + 32) setRunningContextWaitingForFollowUpRequest:v3];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001605C;
  block[3] = &unk_100038BC0;
  void block[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if ([*(id *)(a1 + 48) isCancelled])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) associatedRunningContext];
    [v4 queue_removePendingStatusPresentationsForRunningContext:v5];
  }
  if (!*(void *)(a1 + 56) || !*(void *)(a1 + 64)) {
    goto LABEL_21;
  }
  id v6 = [*(id *)(a1 + 32) presentedBanner];
  if (v6)
  {
    objc_opt_class();
    id v7 = (objc_opt_isKindOfClass() & 1) != 0 ? v6 : 0;
  }
  else
  {
    id v7 = 0;
  }
  id v8 = v7;

  id v9 = [v8 embeddedPlatter];

  if (!v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000160E0;
    v10[3] = &unk_100038C80;
    id v11 = *(id *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
  else
  {
LABEL_21:
    if (!*(unsigned char *)(a1 + 72)) {
      [*(id *)(a1 + 32) queue_dismissPresentableWithReason:@"dialog view controller did finish with response" interruptible:1 forced:0];
    }
  }
}

void sub_100015E28(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  id v8 = +[VCVoiceShortcutClient standardClient];
  id v9 = [*(id *)(a1 + 32) actionUUID];
  uint64_t v10 = *(void *)(a1 + 40);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100015F74;
  v12[3] = &unk_100039098;
  id v13 = v6;
  id v11 = v6;
  [v8 setPerWorkflowStateData:v7 forSmartPromptWithActionUUID:v9 reference:v10 completion:v12];
}

void sub_100015F20(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) queue];
  dispatch_async(v2, *(dispatch_block_t *)(a1 + 40));
}

void sub_100015F74(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = sub_1000140D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 136315394;
      id v6 = "-[WFBannerManager dialogViewController:didFinishWithResponse:waitForFollowUpRequest:]_block_invoke_4";
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%s Failed to set smart prompt data with error: %@", (uint8_t *)&v5, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10001605C(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(a1 + 32) dialogRequestCompletionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) dialogRequestCompletionHandler];
    v3[2](v3, *(void *)(a1 + 40), 0);

    id v4 = *(void **)(a1 + 32);
    [v4 setDialogRequestCompletionHandler:0];
  }
}

id sub_1000160E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_100016178(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = [*(id *)(a1 + 32) pendingRequests];
  id v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v11;
    do
    {
      int v5 = 0;
      do
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        id v6 = *(id *)(*((void *)&v10 + 1) + 8 * (void)v5);
        if (v6)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v7 = [objc_alloc((Class)WFDialogResponse) initWithCancelled:1];
            id v8 = [v6 completionHandler];

            if (v8)
            {
              id v9 = [v6 completionHandler];
              ((void (**)(void, id, void))v9)[2](v9, v7, 0);

              [v6 setCompletionHandler:0];
            }
          }
        }

        int v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
}

void sub_1000165F8(uint64_t a1)
{
  id v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) defaultPostOptions];
  if ([*v2 presentsApertureStatus])
  {
    uint64_t v4 = [WFSingleStepHomeScreenCompletionStatusViewController alloc];
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = [*(id *)(a1 + 48) attribution];
    id v7 = [(WFApertureStatusViewController *)v4 initWithRunningContext:v5 attribution:v6];

    [(WFApertureStatusViewController *)v7 setDelegate:*(void *)(a1 + 32)];
    [(WFApertureStatusViewController *)v7 setCompletingSuccessfully:1];
    uint64_t v8 = *(void *)(a1 + 40);
    id v9 = v7;
    long long v10 = +[WFApertureStatusViewController requestIdentifierForContext:v8];
    id v11 = [v3 mutableCopy];
    long long v12 = [(WFApertureStatusViewController *)v9 postOptions];

    uint64_t v13 = [v11 if_dictionaryByAddingEntriesFromDictionary:v12];

    id v3 = (void *)v13;
  }
  else
  {
    id v14 = [objc_alloc((Class)WFSingleStepHomeScreenShortcutCompletionDialogViewController) initWithRequest:*(void *)(a1 + 48)];
    [v14 setAssociatedRunningContext:*(void *)(a1 + 40)];
    id v9 = [*(id *)(a1 + 32) requestContainerForRunningContext:*(void *)(a1 + 40)];
    CAFrameRateRange v15 = sub_1000140D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = [(WFSingleStepHomeScreenCompletionStatusViewController *)v9 embeddedPlatter];
      *(_DWORD *)buf = 136315650;
      v39 = "-[WFBannerManager handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:]_block_invoke";
      __int16 v40 = 2112;
      id v41 = v16;
      __int16 v42 = 2112;
      v43 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Morphing to platter %@ in container %@", buf, 0x20u);
    }
    [(WFSingleStepHomeScreenCompletionStatusViewController *)v9 setEmbeddedPlatter:v14];
    [*(id *)(a1 + 32) preferredPresentationSize];
    double v18 = v17;
    [*(id *)(a1 + 32) preferredPresentationSize];
    [v14 platterHeightForWidth:v18];
    [v14 setPreferredContentSize:v18, v19];
    long long v10 = [(WFApertureStatusViewController *)v9 requestIdentifier];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100016A64;
  v32[3] = &unk_100039048;
  objc_copyWeak(&v36, &location);
  id v20 = v10;
  id v33 = v20;
  CGAffineTransform v21 = v9;
  v34 = v21;
  id v35 = *(id *)(a1 + 40);
  id v22 = objc_retainBlock(v32);
  id v23 = [*(id *)(a1 + 32) presentedBanner];
  BOOL v24 = v23 == v21;

  if (v24)
  {
    id v27 = 0;
    goto LABEL_12;
  }
  id v25 = [*(id *)(a1 + 32) bannerSource];
  id v31 = 0;
  unsigned int v26 = [v25 postPresentable:v21 options:0 userInfo:v3 error:&v31];
  id v27 = v31;

  if (v26)
  {
LABEL_12:
    ((void (*)(void *, double))v22[2])(v22, 1.0);
    goto LABEL_13;
  }
  id v28 = sub_1000140D4();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[WFBannerManager handleSingleStepHomeScreenDialogRequest:runningContext:completionHandler:]_block_invoke_5";
    __int16 v40 = 2112;
    id v41 = v27;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s Unable to post single step home screen completion (%@)", buf, 0x16u);
  }

LABEL_13:
  uint64_t v29 = *(void *)(a1 + 56);
  id v30 = [objc_alloc((Class)WFDialogResponse) initWithResponseCode:0];
  (*(void (**)(uint64_t, id, void))(v29 + 16))(v29, v30, 0);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

void sub_100016A40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016A64(id *a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100016B8C;
  v7[3] = &unk_100039020;
  v7[4] = WeakRetained;
  id v8 = a1[4];
  id v9 = @"WFBannerManager: Hit single step home screen revoke timer.";
  id v10 = a1[5];
  id v11 = a1[6];
  uint64_t v5 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:v7 block:a2];
  id v6 = [WeakRetained singleStepHomeScreenRevokeTimers];
  [v6 setObject:v5 forKey:a1[6]];
}

void sub_100016B8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) presentsApertureStatus])
  {
    id v4 = [*(id *)(a1 + 32) bannerSource];
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    CFStringRef v20 = @"id";
    uint64_t v21 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v8 = [v4 revokePresentableWithRequestIdentifier:v5 reason:v6 animated:1 userInfo:v7 error:0];
  }
  else
  {
    id v9 = *(id *)(a1 + 56);
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        id v10 = v9;
      }
      else {
        id v10 = 0;
      }
    }
    else
    {
      id v10 = 0;
    }
    id v4 = v10;

    [v4 dismissEmbeddedPlatterWithCompletion:&stru_100038FD0 interruptible:0];
    objc_initWeak(&location, *(id *)(a1 + 32));
    id v11 = objc_alloc((Class)WFDispatchSourceTimer);
    long long v12 = [*(id *)(a1 + 32) queue];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100016E18;
    v15[3] = &unk_100038FF8;
    objc_copyWeak(&v18, &location);
    id v16 = *(id *)(a1 + 40);
    id v17 = *(id *)(a1 + 48);
    id v13 = [v11 initWithInterval:v12 queue:v15 handler:0.5];

    [v13 setPreventSuspension:1];
    [v13 start];

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  id v14 = [*(id *)(a1 + 32) singleStepHomeScreenRevokeTimers];
  [v14 removeObjectForKey:*(void *)(a1 + 64)];
}

void sub_100016DDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016E18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained bannerSource];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  CFStringRef v8 = @"id";
  uint64_t v9 = v5;
  uint64_t v6 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v7 = [v3 revokePresentableWithRequestIdentifier:v5 reason:v4 animated:0 userInfo:v6 error:0];
}

void sub_10001789C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000178D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = +[NSString stringWithFormat:@"pause timer kicked, %.2f seconds elapsed", *(void *)(a1 + 40)];
  [WeakRetained queue_resumeDialogPresentationWithReason:v2 onRequestFromHost:0];
}

void sub_100017ABC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) request];
  id v3 = [*(id *)(a1 + 32) context];
  if (([*(id *)(a1 + 40) queuedDialogIsActionUIRequest:*(void *)(a1 + 32)] & 1) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 40));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100017E58;
    v25[3] = &unk_100038F38;
    uint64_t v4 = *(void **)(a1 + 40);
    id v26 = *(id *)(a1 + 32);
    objc_copyWeak(&v27, &location);
    [v4 setDialogRequestCompletionHandler:v25];
    objc_destroyWeak(&v27);

    objc_destroyWeak(&location);
  }
  if ([*(id *)(a1 + 40) queuedDialogIsActionUIRequest:*(void *)(a1 + 32)])
  {
    uint64_t v5 = [[WFBannerViewController alloc] initWithDelegate:*(void *)(a1 + 40) associatedRunningContext:v3];
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_19:
    v6();
    goto LABEL_20;
  }
  if ([*(id *)(a1 + 32) isFollowUp])
  {
    id v7 = [*(id *)(a1 + 40) presentedPlatter];
    if (v7)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        CFStringRef v8 = v7;
      }
      else {
        CFStringRef v8 = 0;
      }
    }
    else
    {
      CFStringRef v8 = 0;
    }
    uint64_t v5 = v8;

    CAFrameRateRange v15 = [*(id *)(a1 + 32) request];
    unsigned int v16 = [(WFBannerViewController *)v5 canHandleFollowUpRequest:v15];

    if (v16)
    {
      id v17 = [*(id *)(a1 + 32) request];
      [(WFBannerViewController *)v5 handleFollowUpRequest:v17];
    }
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_19;
  }
  if (*(unsigned char *)(a1 + 56)
    && ([*(id *)(a1 + 32) request],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char isKindOfClass = objc_opt_isKindOfClass(),
        v9,
        (isKindOfClass & 1) != 0))
  {
    id v11 = objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "wf_dialogViewControllerClass")), "initWithRequest:", v2);
    [v11 setAssociatedRunningContext:v3];
    [v11 setDelegate:*(void *)(a1 + 40)];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100017F18;
    v22[3] = &unk_100038CF8;
    long long v12 = *(void **)(a1 + 48);
    v22[4] = *(void *)(a1 + 40);
    id v23 = v11;
    id v24 = v12;
    uint64_t v5 = (WFBannerViewController *)v11;
    [(WFBannerViewController *)v5 prepareForPresentationWithCompletionHandler:v22];

    id v13 = v23;
  }
  else
  {
    id v14 = objc_msgSend(objc_alloc((Class)objc_msgSend(v2, "wf_dialogViewControllerClass")), "initWithRequest:", v2);
    [v14 setAssociatedRunningContext:v3];
    [v14 setDelegate:*(void *)(a1 + 40)];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100017FC0;
    v18[3] = &unk_100038CD0;
    v18[4] = *(void *)(a1 + 40);
    id v19 = v3;
    id v20 = v14;
    id v21 = *(id *)(a1 + 48);
    uint64_t v5 = (WFBannerViewController *)v14;
    [(WFBannerViewController *)v5 prepareForPresentationWithCompletionHandler:v18];

    id v13 = v19;
  }

LABEL_20:
}

void sub_100017E3C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_100017E58(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) completionHandler];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) completionHandler];
    ((void (**)(void, id, id))v7)[2](v7, v9, v5);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDialogRequestCompletionHandler:0];
}

void sub_100017F18(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018190;
  block[3] = &unk_100038CF8;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100017FC0(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001807C;
  _OWORD v3[3] = &unk_100038CD0;
  uint64_t v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

void sub_10001807C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) requestContainerForRunningContext:*(void *)(a1 + 40)];
  id v3 = sub_1000140D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [v2 embeddedPlatter];
    int v5 = 136315650;
    id v6 = "-[WFBannerManager getBannerForQueuedDialogRequest:dialogIsBreakthroughSmartPrompt:completionHandler:]_block_invoke_7";
    __int16 v7 = 2112;
    CFStringRef v8 = v4;
    __int16 v9 = 2112;
    id v10 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Morphing to platter %@ in container %@", (uint8_t *)&v5, 0x20u);
  }
  [v2 setEmbeddedPlatter:*(void *)(a1 + 48)];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_100018190(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) presentedBanner];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  id v4 = v3;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100018278;
  _OWORD v6[3] = &unk_100038F60;
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  [v4 presentViewController:v5 animated:1 completion:v6];
}

uint64_t sub_100018278(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100018414(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = sub_1000140D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v26 = "-[WFBannerManager requestContainerForRunningContext:]_block_invoke";
    __int16 v27 = 2112;
    uint64_t v28 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s User dismissed via dismissal gesture for running context: <%@>", buf, 0x16u);
  }

  id v6 = [*(id *)(a1 + 40) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000186F8;
  block[3] = &unk_100038C30;
  int8x16_t v16 = *(int8x16_t *)(a1 + 32);
  id v7 = (id)v16.i64[0];
  int8x16_t v23 = vextq_s8(v16, v16, 8uLL);
  id v8 = v3;
  id v24 = v8;
  dispatch_async(v6, block);

  __int16 v9 = [*(id *)(a1 + 40) dialogRequestCompletionHandler];

  if (v9)
  {
    id v10 = [*(id *)(a1 + 40) dialogRequestCompletionHandler];
    id v11 = [objc_alloc((Class)WFDialogResponse) initWithCancelled:1];
    ((void (**)(void, id, void))v10)[2](v10, v11, 0);

    [*(id *)(a1 + 40) setDialogRequestCompletionHandler:0];
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  id v21[2] = sub_10001873C;
  v21[3] = &unk_100038C80;
  void v21[4] = *(void *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v21);
  dispatch_time_t v12 = dispatch_time(0, 550000000);
  id v13 = [*(id *)(a1 + 40) queue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000187CC;
  v18[3] = &unk_100038C30;
  int8x16_t v17 = *(int8x16_t *)(a1 + 32);
  id v14 = (id)v17.i64[0];
  int8x16_t v19 = vextq_s8(v17, v17, 8uLL);
  id v20 = v8;
  id v15 = v8;
  dispatch_after(v12, v13, v18);
}

id sub_1000186F8(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_removePendingStatusPresentationsForRunningContext:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 queue_revokeIslandPresentableForContext:v3 reason:v4];
}

void sub_10001873C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) actionUserInterfaceListener];

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) actionUserInterfaceListener];
    uint64_t v3 = [v4 actionInterface];
    [v3 cancelPresentationWithCompletionHandler:&stru_100038EE8];
  }
}

id sub_1000187CC(uint64_t a1)
{
  return [*(id *)(a1 + 32) queue_revokePresentableForContext:*(void *)(a1 + 40) reason:*(void *)(a1 + 48) forced:0];
}

void sub_1000188A8(uint64_t a1)
{
  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  id v41 = sub_100018F30;
  __int16 v42 = sub_100018F40;
  id v43 = 0;
  uint64_t v2 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100018F48;
  block[3] = &unk_100038EC8;
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(a1 + 40);
  v37 = &v38;
  void block[4] = v3;
  id v36 = v4;
  dispatch_sync(v2, block);

  uint64_t v5 = [(id)v39[5] runningContext];
  if (!v5
    || ([(id)v39[5] attribution],
        id v6 = objc_claimAutoreleasedReturnValue(),
        BOOL v7 = v6 == 0,
        v6,
        v7))
  {
    id v15 = sub_1000140D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315138;
      v45 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "%s Tracking workflow is not available for the requested status presentation", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    unsigned int v8 = [*(id *)(a1 + 32) presentsApertureStatus];
    __int16 v9 = sub_1000140D4();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Getting view for the island...", buf, 0xCu);
      }

      id v11 = [(id)v39[5] associatedPill];
      if (v11
        && (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v11, (isKindOfClass & 1) != 0))
      {
        id v13 = [(id)v39[5] associatedPill];
        if (v13)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v14 = v13;
          }
          else {
            id v14 = 0;
          }
        }
        else
        {
          id v14 = 0;
        }
        id v25 = v14;
      }
      else
      {
        id v21 = [WFApertureStatusViewController alloc];
        id v22 = [(id)v39[5] attribution];
        int8x16_t v23 = [(id)v39[5] progress];
        id v24 = [(WFApertureStatusViewController *)v21 initWithRunningContext:v5 attribution:v22 progress:v23];

        [*(id *)(a1 + 32) preferredPresentationSize];
        -[WFApertureStatusViewController setPreferredContentSize:](v24, "setPreferredContentSize:");
        id v25 = v24;
      }
      if ([(id)v39[5] completed])
      {
        [(WFApertureStatusViewController *)v25 setCompletingSuccessfully:1];
        dispatch_time_t v30 = dispatch_time(0, 1000000000);
        id v31 = [*(id *)(a1 + 32) queue];
        v33[0] = _NSConcreteStackBlock;
        v33[1] = 3221225472;
        v33[2] = sub_100018FCC;
        v33[3] = &unk_100038BC0;
        v33[4] = *(void *)(a1 + 32);
        id v34 = v5;
        dispatch_after(v30, v31, v33);
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 136315138;
        v45 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Getting status banner...", buf, 0xCu);
      }

      int8x16_t v16 = [*(id *)(a1 + 32) presentedPlatter];
      if (v16 && (objc_opt_class(), char v17 = objc_opt_isKindOfClass(), v16, (v17 & 1) != 0))
      {
        id v18 = sub_1000140D4();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v45 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s Already presented", buf, 0xCu);
        }

        int8x16_t v19 = [*(id *)(a1 + 32) presentedPlatter];
        if (v19)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v20 = v19;
          }
          else {
            id v20 = 0;
          }
        }
        else
        {
          id v20 = 0;
        }
        id v25 = v20;

        uint64_t v28 = 0;
      }
      else
      {
        id v25 = (WFApertureStatusViewController *)objc_alloc_init((Class)WFCompactStatusViewController);
        id v26 = [(id)v39[5] progress];
        [(WFApertureStatusViewController *)v25 setProgress:v26];

        __int16 v27 = [(id)v39[5] attribution];
        [(WFApertureStatusViewController *)v25 setAttribution:v27];

        [(WFApertureStatusViewController *)v25 setAssociatedRunningContext:v5];
        uint64_t v28 = [*(id *)(a1 + 32) requestContainerForRunningContext:v5];
        uint64_t v29 = sub_1000140D4();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v45 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
          __int16 v46 = 2112;
          v47 = v25;
          __int16 v48 = 2112;
          v49 = v28;
          _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s Queuing status platter %@ in container %@", buf, 0x20u);
        }

        [v28 setQueuedStatusPlatter:v25];
      }
      id v32 = v28;
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }

  _Block_object_dispose(&v38, 8);
}

void sub_100018EF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100018F30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100018F40(uint64_t a1)
{
}

void sub_100018F48(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) runningPersistentWorkflows];
  uint64_t v2 = [*(id *)(a1 + 40) context];
  uint64_t v3 = [v6 objectForKey:v2];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

id sub_100018FCC(uint64_t a1)
{
  uint64_t v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[WFBannerManager getBannerForQueuedStatusPresentation:completionHandler:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Revoking status view controller after delay", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) queue_revokeIslandPresentableForContext:*(void *)(a1 + 40) reason:@"timer fired auto-dismiss completed persistent shortcut"];
  return [*(id *)(a1 + 32) queue_stopTrackingPersistentModeContext:*(void *)(a1 + 40) withReason:@"completion auto-dismiss timer fired and presentable revoked"];
}

void sub_100019654(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 40) progress];
  [*(id *)(a1 + 32) setProgress:v2];

  if ([*(id *)(a1 + 40) completed])
  {
    [*(id *)(a1 + 32) setCompletingSuccessfully:1];
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    int v4 = [*(id *)(a1 + 48) queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100019AE0;
    block[3] = &unk_100038BC0;
    uint64_t v5 = *(void **)(a1 + 56);
    void block[4] = *(void *)(a1 + 48);
    id v22 = v5;
    dispatch_after(v3, v4, block);
  }
  else
  {
    id v6 = [*(id *)(a1 + 48) presentedBanner];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v7 = v6;
      }
      else {
        BOOL v7 = 0;
      }
    }
    else
    {
      BOOL v7 = 0;
    }
    id v8 = v7;

    __int16 v9 = [*(id *)(a1 + 48) presentedPlatter];
    if (v9)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        BOOL v10 = v9;
      }
      else {
        BOOL v10 = 0;
      }
    }
    else
    {
      BOOL v10 = 0;
    }
    id v11 = v10;

    if (v8
      && ![v8 dismissalPhase]
      && v11
      && ([v11 associatedRunningContext],
          dispatch_time_t v12 = objc_claimAutoreleasedReturnValue(),
          unsigned int v13 = [v12 isEqual:*(void *)(a1 + 56)],
          v12,
          v13))
    {
      id v14 = *(void **)(a1 + 32);
      id v15 = [v11 platterView];
      int8x16_t v16 = [v15 attribution];
      [v14 setAttribution:v16];

      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100019B30;
      v19[3] = &unk_100038C80;
      id v20 = *(id *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v19);
    }
    else
    {
      char v17 = *(void **)(a1 + 32);
      id v18 = [*(id *)(a1 + 40) attribution];
      [v17 setAttribution:v18];
    }
  }
}

id sub_1000198EC(uint64_t a1)
{
  uint64_t v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 136315394;
    id v6 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Popping completion checkmark on status view controller: %@", (uint8_t *)&v5, 0x16u);
  }

  return [*(id *)(a1 + 32) transitionToCompleted:1 animated:1];
}

id sub_1000199B8(uint64_t a1)
{
  uint64_t v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[WFBannerManager queue_updatePresentedStatusForRunningContext:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Revoking status view controller after delay", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) queue_dismissPresentableWithReason:@"timer fired auto-dismiss completed persistent shortcut" interruptible:0 forced:0];
  return [*(id *)(a1 + 32) queue_stopTrackingPersistentModeContext:*(void *)(a1 + 40) withReason:@"completion auto-dismiss timer fired and presentable revoked"];
}

void sub_100019A8C(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) progress];
  [v1 setProgress:v2];
}

id sub_100019AE0(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_revokeIslandPresentableForContext:*(void *)(a1 + 40) reason:@"updatePresentedStatusWithProgressForRunningContext's auto dismiss timer fired"];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 queue_stopTrackingPersistentModeContext:v3 withReason:@"updatePresentedStatusWithProgressForRunningContext's auto dismiss timer fired"];
}

void sub_100019B30(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) progressView];
  id v3 = [v2 progressSuppressionState];

  if (v3 == (id)1)
  {
    id v4 = [*(id *)(a1 + 32) progressView];
    [v4 setProgressSuppressionState:2];
  }
}

void sub_10001A1EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A228(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained pendingRequests];
  [v2 addObject:*(void *)(a1 + 32)];

  [WeakRetained queue_updateStateWithReason:@"Persistent status queued."];
}

void sub_10001AA70(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) defaultPostOptions];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [*(id *)(a1 + 40) postOptions];
    uint64_t v4 = [v2 if_dictionaryByAddingEntriesFromDictionary:v3];

    id v2 = (void *)v4;
  }
  int v5 = [*(id *)(a1 + 32) inflightRequest];
  if (v5)
  {

LABEL_6:
    id v6 = sub_1000140D4();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v7 = *(void **)(a1 + 40);
      uint64_t v8 = [v7 requestIdentifier];
      *(_DWORD *)buf = 136315650;
      id v22 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke_2";
      __int16 v23 = 2112;
      id v24 = v7;
      __int16 v25 = 2112;
      id v26 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s Presenting banner (%@) for running context (%@)", buf, 0x20u);
    }
    __int16 v9 = [*(id *)(a1 + 32) bannerSource];
    uint64_t v10 = *(void *)(a1 + 40);
    id v20 = 0;
    unsigned __int8 v11 = [v9 postPresentable:v10 options:0 userInfo:v2 error:&v20];
    id v12 = v20;

    if (v11)
    {
      if (!*(unsigned char *)(a1 + 48))
      {
        [*(id *)(a1 + 32) setPresentedBanner:*(void *)(a1 + 40)];
        unsigned int v13 = [*(id *)(a1 + 32) queue];
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10001AD74;
        block[3] = &unk_100038BC0;
        id v14 = *(void **)(a1 + 40);
        void block[4] = *(void *)(a1 + 32);
        id v19 = v14;
        dispatch_async(v13, block);
      }
    }
    else
    {
      id v15 = sub_1000140D4();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        int8x16_t v16 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 136315650;
        id v22 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke";
        __int16 v23 = 2112;
        id v24 = v16;
        __int16 v25 = 2112;
        id v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s Unable to post banner: %@, error: %@", buf, 0x20u);
      }
    }
    goto LABEL_17;
  }
  if (*(unsigned char *)(a1 + 48)) {
    goto LABEL_6;
  }
  char v17 = sub_1000140D4();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v22 = "-[WFBannerManager queue_presentBanner:completion:]_block_invoke";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%s Didn't find an inflight request for the banner, so not presenting anything", buf, 0xCu);
  }

  id v12 = 0;
LABEL_17:
}

void sub_10001AD74(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) associatedRunningContext];
  [v1 queue_updatePresentedStatusForRunningContext:v2];
}

void sub_10001AF74(uint64_t a1)
{
  id v2 = +[WFApertureStatusViewController requestIdentifierForContext:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 40) bannerSource];
  uint64_t v4 = [*(id *)(a1 + 40) dismissalReasonWithReason:*(void *)(a1 + 48)];
  id v9 = 0;
  int v5 = [v3 revokePresentableWithRequestIdentifier:v2 reason:v4 animated:1 userInfo:&__NSDictionary0__struct error:&v9];
  id v6 = v9;

  if (!v5)
  {
    __int16 v7 = sub_1000140D4();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v11 = "-[WFBannerManager queue_revokeIslandPresentableForContext:reason:]_block_invoke";
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s Failed to revoke banner for running context: %@, error: %@", buf, 0x20u);
    }
  }
}

void sub_10001B9B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,id a21)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_10001B9EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BAD8;
  block[3] = &unk_100038DC0;
  objc_copyWeak(&v7, (id *)(a1 + 56));
  void block[4] = WeakRetained;
  id v5 = *(id *)(a1 + 32);
  id v6 = *(id *)(a1 + 40);
  char v8 = *(unsigned char *)(a1 + 64);
  dispatch_async(v3, block);

  objc_destroyWeak(&v7);
}

void sub_10001BAD8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v3 = [*(id *)(a1 + 32) presentedBanner];

  if (v3 == WeakRetained)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 40);
    id v7 = +[NSString stringWithFormat:@"hinting timer fired, hint reason: %@", *(void *)(a1 + 48)];
    [v5 queue_revokePresentableForContext:v6 reason:v7 forced:*(unsigned __int8 *)(a1 + 64)];
  }
  else
  {
    uint64_t v4 = sub_1000140D4();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v9 = "-[WFBannerManager queue_dismissPresentableWithReason:interruptible:forced:]_block_invoke_2";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Revoked running context does not match current presentable.", buf, 0xCu);
    }
  }
}

void sub_10001C974(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_1000140D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Presenting status presentation: %@", buf, 0x16u);
  }

  if (([*(id *)(a1 + 32) presentsApertureStatus] & 1) == 0) {
    [*(id *)(a1 + 32) setInflightRequest:v3];
  }
  id v5 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D4B0;
  v7[3] = &unk_100038D48;
  v7[4] = v5;
  id v8 = v3;
  id v6 = v3;
  [v5 getBannerForQueuedStatusPresentation:v6 completionHandler:v7];
}

void sub_10001CAC4(uint64_t a1)
{
  id v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v10 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
    __int16 v11 = 2112;
    uint64_t v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Requesting remote alert scene for queued action UI request: %@", buf, 0x16u);
  }

  uint64_t v4 = +[WFAngelSceneManager sharedManager];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001D0C4;
  v7[3] = &unk_100038C80;
  uint64_t v8 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D184;
  v5[3] = &unk_100038D98;
  void v5[4] = v8;
  id v6 = *(id *)(a1 + 32);
  [v4 getWindowWithCancellationHandler:v7 completionHandler:v5];
}

void sub_10001CC48(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CD14;
  block[3] = &unk_100038C30;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v4, block);
}

void sub_10001CD14(uint64_t a1)
{
  id v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke_7";
    __int16 v14 = 2112;
    uint64_t v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Got banner for queued dialog: %@, presentable: %@", buf, 0x20u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  id v5 = *(void **)(a1 + 48);
  if (v6)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001CE64;
    v9[3] = &unk_100038D20;
    id v7 = *(id *)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    id v10 = v7;
    uint64_t v11 = v8;
    [v5 queue_presentBanner:v6 completion:v9];
  }
  else
  {
    [*(id *)(a1 + 48) setInflightRequest:0];
  }
}

id sub_10001CE64(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000140D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)(a2 - 1) > 5) {
      CFStringRef v5 = @"unknown (uh oh)";
    }
    else {
      CFStringRef v5 = *(&off_1000391D0 + a2 - 1);
    }
    uint64_t v6 = *(void *)(a1 + 32);
    int v18 = 136315650;
    id v19 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
    __int16 v20 = 2112;
    CFStringRef v21 = v5;
    __int16 v22 = 2112;
    uint64_t v23 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s Banner presented for queued dialog with result: %@, dialog: %@", (uint8_t *)&v18, 0x20u);
  }

  if (a2 == 1)
  {
    if ([*(id *)(a1 + 40) queuedDialogIsActionUIRequest:*(void *)(a1 + 32)])
    {
      id v7 = [*(id *)(a1 + 32) completionHandler];

      if (v7)
      {
        uint64_t v8 = [*(id *)(a1 + 32) completionHandler];
        id v9 = objc_alloc((Class)WFShowActionInterfaceDialogResponse);
        id v10 = [*(id *)(a1 + 40) actionUserInterfaceListener];
        uint64_t v11 = [v10 endpoint];
        id v12 = [v9 initWithListenerEndpoint:v11 userInterfaceType:WFUserInterfaceTypeUIKit];
        ((void (**)(void, id, void))v8)[2](v8, v12, 0);

        [*(id *)(a1 + 32) setCompletionHandler:0];
      }
    }
  }
  uint64_t v13 = [*(id *)(a1 + 40) queue];
  dispatch_assert_queue_V2(v13);

  id result = [*(id *)(a1 + 40) setInflightRequest:0];
  if ((unint64_t)(a2 - 5) <= 1)
  {
    uint64_t v15 = [*(id *)(a1 + 32) completionHandler];

    if (v15)
    {
      __int16 v16 = [*(id *)(a1 + 32) completionHandler];
      id v17 = [objc_alloc((Class)WFDialogResponse) initWithResponseCode:1];
      ((void (**)(void, id, void))v16)[2](v16, v17, 0);

      [*(id *)(a1 + 32) setCompletionHandler:0];
    }
    return [*(id *)(a1 + 40) queue_updateStateWithReason:@"previous dialog failed, moving on"];
  }
  return result;
}

void sub_10001D0C4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) actionUserInterfaceListener];

  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) actionUserInterfaceListener];
    uint64_t v4 = [v3 actionInterface];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001D410;
    v5[3] = &unk_100038C80;
    void v5[4] = *(void *)(a1 + 32);
    [v4 cancelPresentationWithCompletionHandler:v5];
  }
}

void sub_10001D184(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = +[WFBannerPrototypeSettings sharedSettings];
  unsigned int v5 = [v4 bannerFramesEnabled];

  if (v5)
  {
    uint64_t v6 = [v3 layer];
    id v7 = +[UIColor systemIndigoColor];
    id v8 = [v7 colorWithAlphaComponent:0.7];
    objc_msgSend(v6, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    id v9 = [v3 layer];
    [v9 setBorderWidth:2.0];

    id v10 = +[WFDevice currentDevice];
    [v10 screenCornerRadius];
    [v3 _setContinuousCornerRadius:];
  }
  uint64_t v11 = *(void **)(a1 + 32);
  id v12 = [v3 rootViewController];
  [v11 setPresentedRemoteAlertViewController:v12];

  uint64_t v13 = [*(id *)(a1 + 32) queue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10001D324;
  v16[3] = &unk_100038BC0;
  id v14 = *(id *)(a1 + 40);
  uint64_t v15 = *(void *)(a1 + 32);
  id v17 = v14;
  uint64_t v18 = v15;
  dispatch_async(v13, v16);
}

id sub_10001D324(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completionHandler];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) completionHandler];
    id v4 = objc_alloc((Class)WFShowActionInterfaceDialogResponse);
    unsigned int v5 = [*(id *)(a1 + 40) actionUserInterfaceListener];
    uint64_t v6 = [v5 endpoint];
    id v7 = [v4 initWithListenerEndpoint:v6 userInterfaceType:WFUserInterfaceTypeUIKit];
    ((void (**)(void, id, void))v3)[2](v3, v7, 0);

    [*(id *)(a1 + 32) setCompletionHandler:0];
  }
  id v8 = *(void **)(a1 + 40);

  return [v8 setInflightRequest:0];
}

void sub_10001D410(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D4A0;
  block[3] = &unk_100038C80;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

id sub_10001D4A0(uint64_t a1)
{
  return [*(id *)(a1 + 32) queue_dismissRemoteAlertViewControllerWithReason:@"action presentation cancelled"];
}

void sub_10001D4B0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D578;
  block[3] = &unk_100038C30;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void sub_10001D578(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);
  if (v3)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001D664;
    v5[3] = &unk_100038D20;
    void v5[4] = v2;
    id v6 = *(id *)(a1 + 48);
    [v2 queue_presentBanner:v3 completion:v5];
  }
  else
  {
    if (([*(id *)(a1 + 40) presentsApertureStatus] & 1) == 0) {
      [*(id *)(a1 + 40) setInflightRequest:0];
    }
    id v4 = *(void **)(a1 + 40);
    [v4 queue_updateStateWithReason:@"status completion was in queue but tracking workflow was unavailable, moving on"];
  }
}

void sub_10001D664(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v4);

  uint64_t v5 = sub_1000140D4();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a2 == 3)
  {
    if (v6)
    {
      CFStringRef v7 = *(const __CFString **)(a1 + 40);
      int v10 = 136315394;
      id v11 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke_3";
      __int16 v12 = 2112;
      CFStringRef v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Tried presenting status (%@) but display was not lit. Not moving on for now.", (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      if ((unint64_t)(a2 - 1) > 5) {
        CFStringRef v8 = @"unknown (uh oh)";
      }
      else {
        CFStringRef v8 = *(&off_1000391A0 + a2 - 1);
      }
      uint64_t v9 = *(void *)(a1 + 40);
      int v10 = 136315650;
      id v11 = "-[WFBannerManager queue_updateStateWithReason:]_block_invoke";
      __int16 v12 = 2112;
      CFStringRef v13 = v8;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s Status banner presented with result: %@, status: %@", (uint8_t *)&v10, 0x20u);
    }

    if (([*(id *)(a1 + 32) presentsApertureStatus] & 1) == 0) {
      [*(id *)(a1 + 32) setInflightRequest:0];
    }
    [*(id *)(a1 + 32) queue_updateStateWithReason:@"a status banner was just presented and we need to check if a dialog for this shortcut came in while that was happening"];
  }
}

id sub_10001D968(uint64_t a1)
{
  return [*(id *)(a1 + 32) queue_updateStateWithReason:@"an inflightRequest was completed."];
}

void sub_10001DC98(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentedBanner];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v9 = v3;

  id v4 = [v9 associatedRunningContext];
  unsigned int v5 = [v4 isEqual:*(void *)(a1 + 40)];

  if (v5)
  {
    BOOL v6 = [v9 queuedStatusPlatter];

    if (v6) {
      [v9 setQueuedStatusPlatter:0];
    }
    CFStringRef v7 = [*(id *)(a1 + 32) presentedPlatter];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      id v8 = [v9 dismissalPhase];

      if (v8 != (id)1) {
        goto LABEL_13;
      }
    }
    [*(id *)(a1 + 32) queue_dismissPresentableWithReason:@"application was launched on last step of run" interruptible:0 forced:0];
  }
LABEL_13:
  [*(id *)(a1 + 32) queue_stopTrackingPersistentModeContext:*(void *)(a1 + 40) withReason:@"application was launched on last step of run"];
  [*(id *)(a1 + 32) queue_removePendingStatusPresentationsForRunningContext:*(void *)(a1 + 40)];
}

void sub_10001DEE8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) runningPersistentWorkflows];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (([v3 completed] & 1) == 0)
    {
      [v3 setAttribution:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) queue_updatePresentedStatusForRunningContext:*(void *)(a1 + 40)];
      id v4 = [v3 associatedPill];
      if (v4)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_10001E028;
          block[3] = &unk_100038C80;
          id v6 = v4;
          id v4 = v4;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
      }
    }
  }
  else
  {

    uint64_t v3 = 0;
  }
}

void sub_10001E028(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) progressView];
  [v1 setProgressSuppressionState:3];
}

void sub_10001E124(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_resumeDialogPresentationWithReason:@"host asked us to" onRequestFromHost:1];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001E268(uint64_t a1)
{
  [*(id *)(a1 + 32) queue_pauseDialogPresentationForDuration:*(void *)(a1 + 40) withReason:@"host asked us to"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_10001E3AC(uint64_t a1)
{
  id v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    id v43 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
    __int16 v44 = 2112;
    uint64_t v45 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Dismissing content for running context: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) setRunningContextWaitingForFollowUpRequest:0];
  id v4 = [*(id *)(a1 + 40) actionUserInterfaceListener];
  unsigned int v5 = [v4 actionInterface];
  id v6 = [v5 runningContext];
  unsigned int v7 = [v6 isEqual:*(void *)(a1 + 32)];

  if (v7)
  {
    id v8 = sub_1000140D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v43 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Found active action UI scene, dismissing", buf, 0xCu);
    }

    [*(id *)(a1 + 40) queue_dismissRemoteAlertViewControllerWithReason:@"dismiss presented content was called for the currently presented action UI"];
  }
  id v9 = [*(id *)(a1 + 40) presentedBanner];
  int v10 = [v9 associatedRunningContext];
  unsigned int v11 = [v10 isEqual:*(void *)(a1 + 32)];

  __int16 v12 = [*(id *)(a1 + 40) inflightRequest];
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      CFStringRef v13 = v12;
    }
    else {
      CFStringRef v13 = 0;
    }
  }
  else
  {
    CFStringRef v13 = 0;
  }
  id v14 = v13;

  uint64_t v15 = [v14 context];

  unsigned int v16 = [v15 isEqual:*(void *)(a1 + 32)];
  id v17 = [*(id *)(a1 + 40) presentedPlatter];
  if (v17)
  {
    objc_opt_class();
    int v18 = objc_opt_isKindOfClass() & 1;
    if (v18) {
      id v19 = v17;
    }
    else {
      id v19 = 0;
    }
    id v20 = v19;

    if ((v18 & v11) == 1)
    {
      CFStringRef v21 = sub_1000140D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Can't dismiss status through dismissPresentedContent:", buf, 0xCu);
      }

      goto LABEL_23;
    }
    id v17 = v20;
    if (v16)
    {
LABEL_25:
      __int16 v22 = sub_1000140D4();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v43 = "-[WFBannerManager dismissPresentedContentForRunningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%s The inflight request is for a dialog from this run, cancelling it", buf, 0xCu);
      }

      [*(id *)(a1 + 40) setInflightRequest:0];
      if (!v11) {
        goto LABEL_28;
      }
LABEL_22:
      [*(id *)(a1 + 40) queue_dismissPresentableWithReason:@"dismissPresentedContentForRunningContext" interruptible:1 forced:0];
      [*(id *)(a1 + 40) queue_updateStateWithReason:@"dismiss presented content was called for the currently presented banner"];
LABEL_23:
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      goto LABEL_43;
    }
  }
  else if (v16)
  {
    goto LABEL_25;
  }
  if (v11) {
    goto LABEL_22;
  }
LABEL_28:
  id v36 = v17;
  uint64_t v23 = objc_opt_new();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v24 = a1;
  __int16 v25 = [*(id *)(a1 + 40) pendingRequests];
  id v26 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v26)
  {
    id v27 = v26;
    uint64_t v28 = *(void *)v38;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v38 != v28) {
          objc_enumerationMutation(v25);
        }
        id v30 = *(id *)(*((void *)&v37 + 1) + 8 * i);
        if (v30)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            id v31 = v30;
          }
          else {
            id v31 = 0;
          }
        }
        else
        {
          id v31 = 0;
        }
        id v32 = v31;

        id v33 = [v32 context];
        unsigned int v34 = [v33 isEqual:*(void *)(v24 + 32)];

        if (v34) {
          [v23 addObject:v30];
        }
      }
      id v27 = [v25 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v27);
  }

  id v35 = [*(id *)(v24 + 40) pendingRequests];
  [v35 removeObjectsInArray:v23];

  (*(void (**)(void))(*(void *)(v24 + 48) + 16))();
  id v17 = v36;
LABEL_43:
}

void sub_10001E99C(id *a1)
{
  id v2 = [a1[4] presentedBanner];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v3 = v2;
    }
    else {
      uint64_t v3 = 0;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  unsigned int v5 = [a1[4] presentedBanner];
  id v6 = [v5 associatedRunningContext];

  if (v4)
  {
    unsigned int v7 = [a1[5] automationType];
    if (v7)
    {
    }
    else
    {
      id v8 = [v6 identifier];
      id v9 = [a1[5] identifier];
      unsigned __int8 v10 = [v8 isEqualToString:v9];

      if ((v10 & 1) == 0)
      {
        uint64_t v22 = [v6 workflowIdentifier];
        if (v22)
        {
          uint64_t v23 = (void *)v22;
          uint64_t v24 = [a1[5] workflowIdentifier];
          if (v24)
          {
            __int16 v25 = (void *)v24;
            id v26 = [a1[5] workflowIdentifier];
            id v27 = [v6 workflowIdentifier];
            unsigned int v28 = [v26 isEqualToString:v27];

            if (v28)
            {
              uint64_t v29 = sub_1000140D4();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315138;
                v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%s The incoming dialog is from a new run of the same shortcut. Discarding new run and performing bump animation.", buf, 0xCu);
              }

              v55[0] = _NSConcreteStackBlock;
              v55[1] = 3221225472;
              v55[2] = sub_10001F200;
              v55[3] = &unk_100038C80;
              id v56 = v4;
              dispatch_async((dispatch_queue_t)&_dispatch_main_q, v55);
              id v30 = (void (**)(id, id, void))a1[7];
              id v31 = [objc_alloc((Class)WFDialogResponse) initWithCancelled:1];
              v30[2](v30, v31, 0);

              id v14 = v56;
              goto LABEL_14;
            }
          }
          else
          {
          }
        }
        long long v40 = sub_1000140D4();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
          _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%s A presentable for a different shortcut has come in, immediately revoking the currently presented banner and cancelling the presented dialog. Presenting next dialog after a 0.3s delay.", buf, 0xCu);
        }

        id v41 = [a1[4] runningPersistentWorkflows];
        int v18 = [v41 objectForKey:v6];

        if (v18)
        {
          __int16 v42 = [(WFQueuedDialog *)v18 progress];
          [v42 cancel];
        }
        else
        {
          id v43 = a1[4];
          __int16 v44 = [0 runningContext];
          [v43 queue_removePendingStatusPresentationsForRunningContext:v44];

          [a1[4] queue_dismissPresentableWithReason:@"dismissPresentedContentForRunningContext" interruptible:0 forced:1];
          uint64_t v45 = [a1[4] dialogRequestCompletionHandler];

          if (v45)
          {
            __int16 v46 = [a1[4] dialogRequestCompletionHandler];
            id v47 = [objc_alloc((Class)WFDialogResponse) initWithCancelled:1];
            ((void (**)(void, id, void))v46)[2](v46, v47, 0);

            [a1[4] setDialogRequestCompletionHandler:0];
          }
        }
        dispatch_time_t v48 = dispatch_time(0, 200000000);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_10001F208;
        v51[3] = &unk_100038CD0;
        v51[4] = a1[4];
        id v52 = a1[6];
        id v53 = a1[5];
        id v54 = a1[7];
        dispatch_after(v48, (dispatch_queue_t)&_dispatch_main_q, v51);

LABEL_52:
        goto LABEL_53;
      }
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [a1[4] handleSingleStepHomeScreenDialogRequest:a1[6] runningContext:a1[5] completionHandler:a1[7]];
      goto LABEL_53;
    }
    uint64_t v15 = sub_1000140D4();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = a1[5];
      id v16 = a1[6];
      *(_DWORD *)buf = 136315650;
      v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
      __int16 v59 = 2112;
      id v60 = v16;
      __int16 v61 = 2112;
      id v62 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s Queuing a dialog request: %@ for running context: %@", buf, 0x20u);
    }

    int v18 = [[WFQueuedDialog alloc] initWithRequest:a1[6] context:a1[5] completionHandler:a1[7]];
    id v19 = [a1[4] runningContextWaitingForFollowUpRequest];
    unsigned int v20 = [v19 isEqual:a1[5]];

    if (v20)
    {
      CFStringRef v21 = sub_1000140D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
LABEL_37:
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%s Moving dialog request to front of line, since it is the follow-up we are waiting for", buf, 0xCu);
      }
    }
    else
    {
      if (([a1[4] presentsApertureStatus] & 1) == 0)
      {
        uint64_t v32 = [a1[4] presentedPersistentRunningContext];
        if (v32)
        {
          id v33 = (void *)v32;
          unsigned int v34 = [a1[4] presentedPersistentRunningContext];
          unsigned int v35 = [v34 isEqual:a1[5]];

          if (v35)
          {
            id v36 = sub_1000140D4();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%s Moving dialog request to front of line, since it is part of the current presented persistent running context", buf, 0xCu);
            }

            goto LABEL_39;
          }
        }
      }
      long long v37 = [a1[4] runningContextWaitingForFollowUpRequest];
      unsigned int v38 = [v37 isEqual:a1[5]];

      if (!v38)
      {
        long long v39 = [a1[4] pendingRequests];
        [v39 addObject:v18];
        goto LABEL_41;
      }
      CFStringRef v21 = sub_1000140D4();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke";
        goto LABEL_37;
      }
    }

    [(WFQueuedDialog *)v18 setIsFollowUp:1];
LABEL_39:
    long long v39 = [a1[4] pendingRequests];
    [v39 insertObject:v18 atIndex:0];
LABEL_41:

    if ([a1[4] runningContextIsInPersistentMode:a1[5]]) {
      [a1[4] queue_removePendingStatusPresentationsForRunningContext:a1[5]];
    }
    [a1[4] queue_updateStateWithReason:@"an incoming dialog came in"];
    goto LABEL_52;
  }
  unsigned int v11 = sub_1000140D4();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = a1[5];
    *(_DWORD *)buf = 136315394;
    v58 = "-[WFBannerManager showDialogRequest:runningContext:completionHandler:]_block_invoke_2";
    __int16 v59 = 2112;
    id v60 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s Handling Link snippet sizing request for context: %@", buf, 0x16u);
  }

  dispatch_time_t v13 = dispatch_time(0, 100000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001F218;
  block[3] = &unk_100038CA8;
  void block[4] = a1[4];
  id v50 = a1[7];
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, block);
  id v14 = v50;
LABEL_14:

LABEL_53:
}

id sub_10001F200(uint64_t a1)
{
  return [*(id *)(a1 + 32) performBumpAnimation];
}

id sub_10001F208(uint64_t a1)
{
  return [*(id *)(a1 + 32) showDialogRequest:*(void *)(a1 + 40) runningContext:*(void *)(a1 + 48) completionHandler:*(void *)(a1 + 56)];
}

void sub_10001F218(uint64_t a1)
{
  [*(id *)(a1 + 32) preferredContainerSize];
  +[WFCompactPlatterPresentationController preferredSizeForPresentingInContainerViewOfSize:](WFCompactPlatterPresentationController, "preferredSizeForPresentingInContainerViewOfSize:");
  double v3 = v2;
  id v4 = +[UIScreen mainScreen];
  unsigned int v5 = [v4 traitCollection];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = +[UITraitCollection currentTraitCollection];
  }
  id v8 = v7;

  if ([*(id *)(a1 + 32) currentUserInterfaceStyle])
  {
    id v9 = [*(id *)(a1 + 32) currentUserInterfaceStyle];
    if (v9 != [v8 userInterfaceStyle])
    {
      v17[0] = v8;
      unsigned __int8 v10 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", [*(id *)(a1 + 32) currentUserInterfaceStyle]);
      v17[1] = v10;
      unsigned int v11 = +[NSArray arrayWithObjects:v17 count:2];
      uint64_t v12 = +[UITraitCollection traitCollectionWithTraitsFromCollections:v11];

      id v8 = (void *)v12;
    }
  }
  else
  {
    [*(id *)(a1 + 32) setCurrentUserInterfaceStyle:[v8 userInterfaceStyle]];
  }
  dispatch_time_t v13 = +[NSLocale currentLocale];
  id v14 = [objc_alloc((Class)LNSnippetEnvironment) initWithSize:v13 locale:v8 traitCollection:v3];
  uint64_t v15 = *(void *)(a1 + 40);
  id v16 = [objc_alloc((Class)WFLinkSnippetEnvironmentDialogResponse) initWithEnvironment:v14];
  (*(void (**)(uint64_t, id, void))(v15 + 16))(v15, v16, 0);
}

uint64_t sub_10001F514(uint64_t a1)
{
  double v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v29 = "-[WFBannerManager completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
    __int16 v30 = 2112;
    uint64_t v31 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Finishing persistent mode for running context: %@", buf, 0x16u);
  }

  if ([*(id *)(a1 + 40) BOOLValue])
  {
    id v4 = [*(id *)(a1 + 48) runningPersistentWorkflows];
    unsigned int v5 = [v4 objectForKey:*(void *)(a1 + 32)];

    if (v5)
    {
      [v5 setCompleted:1];
      id v6 = [*(id *)(a1 + 48) runningPersistentWorkflows];
      [v6 setObject:v5 forKey:*(void *)(a1 + 32)];

      [*(id *)(a1 + 48) queue_updatePresentedStatusForRunningContext:*(void *)(a1 + 32)];
    }
    else
    {
      unsigned int v5 = sub_1000140D4();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        uint64_t v29 = "-[WFBannerManager completePersistentModeWithSuccess:runningContext:completionHandler:]_block_invoke";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "%s must be tracking a workflow at the time we complete it!", buf, 0xCu);
      }
    }
  }
  else
  {
    unsigned int v5 = objc_opt_new();
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v7 = [*(id *)(a1 + 48) pendingRequests];
    id v8 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          dispatch_time_t v13 = [v12 context];
          unsigned int v14 = [v13 isEqual:*(void *)(a1 + 32)];

          if (v14) {
            [v5 addObject:v12];
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    uint64_t v15 = [*(id *)(a1 + 48) pendingRequests];
    [v15 removeObjectsInArray:v5];

    [*(id *)(a1 + 48) queue_stopTrackingPersistentModeContext:*(void *)(a1 + 32) withReason:@"complete persistent called with failure"];
    id v16 = [*(id *)(a1 + 48) inflightRequest];
    id v17 = [v16 context];
    unsigned int v18 = [v17 isEqual:*(void *)(a1 + 32)];

    if (v18) {
      [*(id *)(a1 + 48) setInflightRequest:0];
    }
    if ([*(id *)(a1 + 48) presentsApertureStatus]) {
      [*(id *)(a1 + 48) queue_revokeIslandPresentableForContext:*(void *)(a1 + 32) reason:@"complete persistent called with failure"];
    }
    id v19 = [*(id *)(a1 + 48) presentedBanner];
    unsigned int v20 = [v19 associatedRunningContext];
    unsigned int v21 = [v20 isEqual:*(void *)(a1 + 32)];

    if (v21) {
      [*(id *)(a1 + 48) queue_dismissPresentableWithReason:@"complete persistent called with failure" interruptible:0 forced:0];
    }
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))();
}

void sub_10001F97C(uint64_t a1)
{
  double v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Queuing a new persistent mode request for running context: %@", buf, 0x16u);
  }

  objc_initWeak(&location, *(id *)(a1 + 40));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001FBF8;
  v10[3] = &unk_100038C58;
  objc_copyWeak(&v12, &location);
  id v11 = *(id *)(a1 + 32);
  id v4 = objc_retainBlock(v10);
  unsigned int v5 = [*(id *)(a1 + 32) addProgressSubscriberUsingPublishingHandler:v4];
  id v6 = [[WFRunningPersistentModeWorkflow alloc] initWithRunningContext:*(void *)(a1 + 32) attribution:*(void *)(a1 + 48) progressSubscriber:v5];
  id v7 = [*(id *)(a1 + 40) runningPersistentWorkflows];
  [v7 setObject:v6 forKey:*(void *)(a1 + 32)];

  id v8 = sub_1000140D4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    uint64_t v15 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke";
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s Starting to track persistent workflow with context: %@", buf, 0x16u);
  }

  [*(id *)(a1 + 40) queue_enqueuePersistentModeStatusPresentationForRunningContext:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) queue_updateStateWithReason:@"a new persistent mode shortcut started and we just enqueued a new persistent mode request"];
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void sub_10001FBD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Block_layout *sub_10001FBF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v5 = [WeakRetained queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001FCD4;
  block[3] = &unk_100038C30;
  id v9 = *(id *)(a1 + 32);
  id v10 = WeakRetained;
  id v11 = v3;
  id v6 = v3;
  dispatch_async(v5, block);

  return &stru_100038C08;
}

id sub_10001FCD4(uint64_t a1)
{
  double v2 = sub_1000140D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 136315394;
    id v8 = "-[WFBannerManager beginPersistentModeWithRunningContext:attribution:completionHandler:]_block_invoke_3";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s Received progress for persistent workflow: %@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = [*(id *)(a1 + 40) runningPersistentWorkflows];
  unsigned int v5 = [v4 objectForKey:*(void *)(a1 + 32)];

  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 updateWithProgress:*(void *)(a1 + 48)];
    }
  }

  return [*(id *)(a1 + 40) queue_updatePresentedStatusForRunningContext:*(void *)(a1 + 32)];
}

void sub_10001FF3C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) connectedHosts];
  [v2 removeObject:*(void *)(a1 + 40)];

  uint64_t v3 = sub_1000140D4();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    id v19 = "-[WFBannerManager removeConnectedHost:]_block_invoke";
    __int16 v20 = 2112;
    uint64_t v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s Removed connected host: %@", buf, 0x16u);
  }

  unsigned int v5 = [*(id *)(a1 + 32) connectedHosts];
  id v6 = [v5 allObjects];
  BOOL v7 = [v6 count] == 0;

  if (v7)
  {
    id v8 = sub_1000140D4();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[WFBannerManager removeConnectedHost:]_block_invoke";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s No connected hosts remain, resetting.", buf, 0xCu);
    }

    __int16 v9 = [*(id *)(a1 + 32) layoutMonitor];
    [v9 invalidate];

    uint64_t v10 = *(void **)(*(void *)(a1 + 32) + 128);
    *(void *)(*(void *)(a1 + 32) + 128) = 0;

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    id v11 = objc_alloc((Class)WFDispatchSourceTimer);
    id v12 = [*(id *)(a1 + 32) queue];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100020200;
    v16[3] = &unk_100038BE8;
    objc_copyWeak(&v17, (id *)buf);
    id v13 = [v11 initWithInterval:v12 queue:v16 handler:2.0];
    [*(id *)(a1 + 32) setCleanUpTimer:v13];

    unsigned int v14 = [*(id *)(a1 + 32) cleanUpTimer];
    [v14 setPreventSuspension:1];

    uint64_t v15 = [*(id *)(a1 + 32) cleanUpTimer];
    [v15 start];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void sub_1000201C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020200(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained queue_resetWithReason:@"No connected hosts, clean up timer fired."];
  [WeakRetained revokeAllPresentablesWithReason:@"No connected hosts, clean up timer fired."];
  [WeakRetained setCleanUpTimer:0];
}

void sub_1000203B0(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) connectedHosts];
  uint64_t v3 = [v2 allObjects];
  id v4 = [v3 count];

  if (!v4)
  {
    uint64_t v5 = [*(id *)(a1 + 32) configuredDisplayLayoutMonitor];
    uint64_t v6 = *(void *)(a1 + 32);
    BOOL v7 = *(void **)(v6 + 128);
    *(void *)(v6 + 128) = v5;
  }
  id v8 = [*(id *)(a1 + 32) connectedHosts];
  [v8 addObject:*(void *)(a1 + 40)];

  __int16 v9 = sub_1000140D4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v10 = *(void *)(a1 + 40);
    int v13 = 136315394;
    unsigned int v14 = "-[WFBannerManager addConnectedHost:]_block_invoke";
    __int16 v15 = 2112;
    uint64_t v16 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s Added connected host: %@", (uint8_t *)&v13, 0x16u);
  }

  id v11 = [*(id *)(a1 + 32) cleanUpTimer];

  if (v11)
  {
    [*(id *)(a1 + 32) queue_resetWithReason:@"Was awaiting cleanup, but new run started, so cleaning up now"];
    [*(id *)(a1 + 32) revokeAllPresentablesWithReason:@"Was awaiting cleanup, but new run started, so cleaning up now"];
    id v12 = [*(id *)(a1 + 32) cleanUpTimer];
    [v12 cancel];

    [*(id *)(a1 + 32) setCleanUpTimer:0];
  }
}

void sub_100020760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100020784(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [v3 userInterfaceStyle];

  [WeakRetained setCurrentUserInterfaceStyle:v4];
}

uint64_t start(int a1, char **a2)
{
  id v4 = objc_opt_new();
  [v4 start];
  id v5 = +[WFBannerPrototypeSettings sharedSettings];
  uint64_t v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  BOOL v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = UIApplicationMain(a1, a2, 0, v7);

  return v8;
}

uint64_t BSRectWithSize()
{
  return _BSRectWithSize();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return _BSUIConstrainValueWithRubberBand();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformEqualToTransform(t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

uint64_t WFApertureStatusViewControllerIdentityFromRunningContext()
{
  return _WFApertureStatusViewControllerIdentityFromRunningContext();
}

uint64_t WFUIPresenterServiceInterface()
{
  return _WFUIPresenterServiceInterface();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIUpdateRequestActivate()
{
  return __UIUpdateRequestActivate();
}

uint64_t _UIUpdateRequestDeactivate()
{
  return __UIUpdateRequestDeactivate();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

uint64_t getWFXPCRunnerLogObject()
{
  return _getWFXPCRunnerLogObject();
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return _notify_is_valid_token(val);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return [super a2];
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return [a1 CGPath];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__defaultAttributes(void *a1, const char *a2, ...)
{
  return [a1 _defaultAttributes];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return [a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return [a1 _screen];
}

id objc_msgSend__window(void *a1, const char *a2, ...)
{
  return [a1 _window];
}

id objc_msgSend_acquireDismissalPreventionAssertion(void *a1, const char *a2, ...)
{
  return [a1 acquireDismissalPreventionAssertion];
}

id objc_msgSend_actionClassName(void *a1, const char *a2, ...)
{
  return [a1 actionClassName];
}

id objc_msgSend_actionGroupView(void *a1, const char *a2, ...)
{
  return [a1 actionGroupView];
}

id objc_msgSend_actionGroupViewTransitionCompletionTimer(void *a1, const char *a2, ...)
{
  return [a1 actionGroupViewTransitionCompletionTimer];
}

id objc_msgSend_actionInterface(void *a1, const char *a2, ...)
{
  return [a1 actionInterface];
}

id objc_msgSend_actionUUID(void *a1, const char *a2, ...)
{
  return [a1 actionUUID];
}

id objc_msgSend_actionUserInterfaceListener(void *a1, const char *a2, ...)
{
  return [a1 actionUserInterfaceListener];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 activeLayoutMode];
}

id objc_msgSend_activeScene(void *a1, const char *a2, ...)
{
  return [a1 activeScene];
}

id objc_msgSend_activeTransitioningActionGroupViewPortal(void *a1, const char *a2, ...)
{
  return [a1 activeTransitioningActionGroupViewPortal];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_alphaOutEnabled(void *a1, const char *a2, ...)
{
  return [a1 alphaOutEnabled];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_applyMaterialViewStyling(void *a1, const char *a2, ...)
{
  return [a1 applyMaterialViewStyling];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_assertionReason(void *a1, const char *a2, ...)
{
  return [a1 assertionReason];
}

id objc_msgSend_associatedPill(void *a1, const char *a2, ...)
{
  return [a1 associatedPill];
}

id objc_msgSend_associatedRunningContext(void *a1, const char *a2, ...)
{
  return [a1 associatedRunningContext];
}

id objc_msgSend_attribution(void *a1, const char *a2, ...)
{
  return [a1 attribution];
}

id objc_msgSend_automationType(void *a1, const char *a2, ...)
{
  return [a1 automationType];
}

id objc_msgSend_awaitingIconOwnershipSwap(void *a1, const char *a2, ...)
{
  return [a1 awaitingIconOwnershipSwap];
}

id objc_msgSend_backdropView(void *a1, const char *a2, ...)
{
  return [a1 backdropView];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return [a1 backlightState];
}

id objc_msgSend_bannerContentOutsets(void *a1, const char *a2, ...)
{
  return [a1 bannerContentOutsets];
}

id objc_msgSend_bannerFramesEnabled(void *a1, const char *a2, ...)
{
  return [a1 bannerFramesEnabled];
}

id objc_msgSend_bannerGesture(void *a1, const char *a2, ...)
{
  return [a1 bannerGesture];
}

id objc_msgSend_bannerGestureDidBegin(void *a1, const char *a2, ...)
{
  return [a1 bannerGestureDidBegin];
}

id objc_msgSend_bannerGestureDidContinue(void *a1, const char *a2, ...)
{
  return [a1 bannerGestureDidContinue];
}

id objc_msgSend_bannerIsFullScreen(void *a1, const char *a2, ...)
{
  return [a1 bannerIsFullScreen];
}

id objc_msgSend_bannerManager(void *a1, const char *a2, ...)
{
  return [a1 bannerManager];
}

id objc_msgSend_bannerPresentationCompletion(void *a1, const char *a2, ...)
{
  return [a1 bannerPresentationCompletion];
}

id objc_msgSend_bannerSize(void *a1, const char *a2, ...)
{
  return [a1 bannerSize];
}

id objc_msgSend_bannerSource(void *a1, const char *a2, ...)
{
  return [a1 bannerSource];
}

id objc_msgSend_beginObservingForPresentation(void *a1, const char *a2, ...)
{
  return [a1 beginObservingForPresentation];
}

id objc_msgSend_beginObservingKeyboard(void *a1, const char *a2, ...)
{
  return [a1 beginObservingKeyboard];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blurBottomLimit(void *a1, const char *a2, ...)
{
  return [a1 blurBottomLimit];
}

id objc_msgSend_blurFilterEnabled(void *a1, const char *a2, ...)
{
  return [a1 blurFilterEnabled];
}

id objc_msgSend_blurTopLimit(void *a1, const char *a2, ...)
{
  return [a1 blurTopLimit];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomLimit(void *a1, const char *a2, ...)
{
  return [a1 bottomLimit];
}

id objc_msgSend_bottomRubberBandRange(void *a1, const char *a2, ...)
{
  return [a1 bottomRubberBandRange];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelAllPendingRequestsForSystemDismiss(void *a1, const char *a2, ...)
{
  return [a1 cancelAllPendingRequestsForSystemDismiss];
}

id objc_msgSend_cancelButton(void *a1, const char *a2, ...)
{
  return [a1 cancelButton];
}

id objc_msgSend_cancellationHandler(void *a1, const char *a2, ...)
{
  return [a1 cancellationHandler];
}

id objc_msgSend_classNamesByType(void *a1, const char *a2, ...)
{
  return [a1 classNamesByType];
}

id objc_msgSend_cleanUpTimer(void *a1, const char *a2, ...)
{
  return [a1 cleanUpTimer];
}

id objc_msgSend_clippingContentView(void *a1, const char *a2, ...)
{
  return [a1 clippingContentView];
}

id objc_msgSend_collapseTimer(void *a1, const char *a2, ...)
{
  return [a1 collapseTimer];
}

id objc_msgSend_completed(void *a1, const char *a2, ...)
{
  return [a1 completed];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return [a1 completionHandler];
}

id objc_msgSend_concretePresenter(void *a1, const char *a2, ...)
{
  return [a1 concretePresenter];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return [a1 configuration];
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return [a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_configuredDisplayLayoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 configuredDisplayLayoutMonitor];
}

id objc_msgSend_connectedHosts(void *a1, const char *a2, ...)
{
  return [a1 connectedHosts];
}

id objc_msgSend_connectedIdentities(void *a1, const char *a2, ...)
{
  return [a1 connectedIdentities];
}

id objc_msgSend_containerSize(void *a1, const char *a2, ...)
{
  return [a1 containerSize];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return [a1 currentLayout];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_currentUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 currentUserInterfaceStyle];
}

id objc_msgSend_debugMorphTransitions(void *a1, const char *a2, ...)
{
  return [a1 debugMorphTransitions];
}

id objc_msgSend_debugShadowsEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugShadowsEnabled];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultPostOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultPostOptions];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dialogDescriptionLabel(void *a1, const char *a2, ...)
{
  return [a1 dialogDescriptionLabel];
}

id objc_msgSend_dialogPresentationPausingReason(void *a1, const char *a2, ...)
{
  return [a1 dialogPresentationPausingReason];
}

id objc_msgSend_dialogPresentationResumingReason(void *a1, const char *a2, ...)
{
  return [a1 dialogPresentationResumingReason];
}

id objc_msgSend_dialogRequestCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 dialogRequestCompletionHandler];
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return [a1 dimmingView];
}

id objc_msgSend_disableTransition(void *a1, const char *a2, ...)
{
  return [a1 disableTransition];
}

id objc_msgSend_dismissalCompletionTimer(void *a1, const char *a2, ...)
{
  return [a1 dismissalCompletionTimer];
}

id objc_msgSend_dismissalHandler(void *a1, const char *a2, ...)
{
  return [a1 dismissalHandler];
}

id objc_msgSend_dismissalPhase(void *a1, const char *a2, ...)
{
  return [a1 dismissalPhase];
}

id objc_msgSend_dismissalPreventionAssertion(void *a1, const char *a2, ...)
{
  return [a1 dismissalPreventionAssertion];
}

id objc_msgSend_displayActive(void *a1, const char *a2, ...)
{
  return [a1 displayActive];
}

id objc_msgSend_displayMonitor(void *a1, const char *a2, ...)
{
  return [a1 displayMonitor];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_embeddedPlatter(void *a1, const char *a2, ...)
{
  return [a1 embeddedPlatter];
}

id objc_msgSend_embeddedScrollView(void *a1, const char *a2, ...)
{
  return [a1 embeddedScrollView];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_events(void *a1, const char *a2, ...)
{
  return [a1 events];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_fixedEndTranslationUp(void *a1, const char *a2, ...)
{
  return [a1 fixedEndTranslationUp];
}

id objc_msgSend_fixedEndTranslationUpEnabled(void *a1, const char *a2, ...)
{
  return [a1 fixedEndTranslationUpEnabled];
}

id objc_msgSend_forwardingTarget(void *a1, const char *a2, ...)
{
  return [a1 forwardingTarget];
}

id objc_msgSend_fractionCompleted(void *a1, const char *a2, ...)
{
  return [a1 fractionCompleted];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gestureSettings(void *a1, const char *a2, ...)
{
  return [a1 gestureSettings];
}

id objc_msgSend_hasCompleted(void *a1, const char *a2, ...)
{
  return [a1 hasCompleted];
}

id objc_msgSend_hasCustomHomeGestureBehavior(void *a1, const char *a2, ...)
{
  return [a1 hasCustomHomeGestureBehavior];
}

id objc_msgSend_hasSystemAperture(void *a1, const char *a2, ...)
{
  return [a1 hasSystemAperture];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_hintAnimationResponse(void *a1, const char *a2, ...)
{
  return [a1 hintAnimationResponse];
}

id objc_msgSend_hintAnimationTargetScale(void *a1, const char *a2, ...)
{
  return [a1 hintAnimationTargetScale];
}

id objc_msgSend_hintDuration(void *a1, const char *a2, ...)
{
  return [a1 hintDuration];
}

id objc_msgSend_homeGestureDidPassThreshold(void *a1, const char *a2, ...)
{
  return [a1 homeGestureDidPassThreshold];
}

id objc_msgSend_horizontalTrackingEnabled(void *a1, const char *a2, ...)
{
  return [a1 horizontalTrackingEnabled];
}

id objc_msgSend_horizontalTrackingFriction(void *a1, const char *a2, ...)
{
  return [a1 horizontalTrackingFriction];
}

id objc_msgSend_icon(void *a1, const char *a2, ...)
{
  return [a1 icon];
}

id objc_msgSend_iconView(void *a1, const char *a2, ...)
{
  return [a1 iconView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inflightRequest(void *a1, const char *a2, ...)
{
  return [a1 inflightRequest];
}

id objc_msgSend_initialPresentationTransitioning(void *a1, const char *a2, ...)
{
  return [a1 initialPresentationTransitioning];
}

id objc_msgSend_initialScrollOffset(void *a1, const char *a2, ...)
{
  return [a1 initialScrollOffset];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_isDialogPresentationPaused(void *a1, const char *a2, ...)
{
  return [a1 isDialogPresentationPaused];
}

id objc_msgSend_isFollowUp(void *a1, const char *a2, ...)
{
  return [a1 isFollowUp];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isRunningFromActionButton(void *a1, const char *a2, ...)
{
  return [a1 isRunningFromActionButton];
}

id objc_msgSend_isShortcutsApp(void *a1, const char *a2, ...)
{
  return [a1 isShortcutsApp];
}

id objc_msgSend_isTouchingDownButton(void *a1, const char *a2, ...)
{
  return [a1 isTouchingDownButton];
}

id objc_msgSend_keyboardIsVisible(void *a1, const char *a2, ...)
{
  return [a1 keyboardIsVisible];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastKnownProgressValue(void *a1, const char *a2, ...)
{
  return [a1 lastKnownProgressValue];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutDescription(void *a1, const char *a2, ...)
{
  return [a1 layoutDescription];
}

id objc_msgSend_layoutDimmingLayer(void *a1, const char *a2, ...)
{
  return [a1 layoutDimmingLayer];
}

id objc_msgSend_layoutEmbeddedPlatter(void *a1, const char *a2, ...)
{
  return [a1 layoutEmbeddedPlatter];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return [a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMonitor(void *a1, const char *a2, ...)
{
  return [a1 layoutMonitor];
}

id objc_msgSend_leadingView(void *a1, const char *a2, ...)
{
  return [a1 leadingView];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return [a1 listener];
}

id objc_msgSend_localIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 localIdleTimer];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 makeKeyWindow];
}

id objc_msgSend_materialView(void *a1, const char *a2, ...)
{
  return [a1 materialView];
}

id objc_msgSend_micaView(void *a1, const char *a2, ...)
{
  return [a1 micaView];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_offsetFromPresentationEdge(void *a1, const char *a2, ...)
{
  return [a1 offsetFromPresentationEdge];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return [a1 opacity];
}

id objc_msgSend_outgoingPlatterViewAwaitingSizeTransition(void *a1, const char *a2, ...)
{
  return [a1 outgoingPlatterViewAwaitingSizeTransition];
}

id objc_msgSend_overrideLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 overrideLayoutMode];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_pauseTimer(void *a1, const char *a2, ...)
{
  return [a1 pauseTimer];
}

id objc_msgSend_pendingDelayedAttribution(void *a1, const char *a2, ...)
{
  return [a1 pendingDelayedAttribution];
}

id objc_msgSend_pendingRequests(void *a1, const char *a2, ...)
{
  return [a1 pendingRequests];
}

id objc_msgSend_performBumpAnimation(void *a1, const char *a2, ...)
{
  return [a1 performBumpAnimation];
}

id objc_msgSend_performLayoutUpdate(void *a1, const char *a2, ...)
{
  return [a1 performLayoutUpdate];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_platterContentSize(void *a1, const char *a2, ...)
{
  return [a1 platterContentSize];
}

id objc_msgSend_platterCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 platterCornerRadius];
}

id objc_msgSend_platterView(void *a1, const char *a2, ...)
{
  return [a1 platterView];
}

id objc_msgSend_poofAlphaDelay(void *a1, const char *a2, ...)
{
  return [a1 poofAlphaDelay];
}

id objc_msgSend_poofAlphaResponse(void *a1, const char *a2, ...)
{
  return [a1 poofAlphaResponse];
}

id objc_msgSend_poofBlurDelay(void *a1, const char *a2, ...)
{
  return [a1 poofBlurDelay];
}

id objc_msgSend_poofBlurRadius(void *a1, const char *a2, ...)
{
  return [a1 poofBlurRadius];
}

id objc_msgSend_poofBlurResponse(void *a1, const char *a2, ...)
{
  return [a1 poofBlurResponse];
}

id objc_msgSend_poofInAlphaResponse(void *a1, const char *a2, ...)
{
  return [a1 poofInAlphaResponse];
}

id objc_msgSend_poofInBlurRadius(void *a1, const char *a2, ...)
{
  return [a1 poofInBlurRadius];
}

id objc_msgSend_poofInBlurResponse(void *a1, const char *a2, ...)
{
  return [a1 poofInBlurResponse];
}

id objc_msgSend_poofInScale(void *a1, const char *a2, ...)
{
  return [a1 poofInScale];
}

id objc_msgSend_poofInScaleDamping(void *a1, const char *a2, ...)
{
  return [a1 poofInScaleDamping];
}

id objc_msgSend_poofInScaleResponse(void *a1, const char *a2, ...)
{
  return [a1 poofInScaleResponse];
}

id objc_msgSend_poofOutAlphaDelay(void *a1, const char *a2, ...)
{
  return [a1 poofOutAlphaDelay];
}

id objc_msgSend_poofOutAlphaResponse(void *a1, const char *a2, ...)
{
  return [a1 poofOutAlphaResponse];
}

id objc_msgSend_poofOutBlurRadius(void *a1, const char *a2, ...)
{
  return [a1 poofOutBlurRadius];
}

id objc_msgSend_poofOutBlurResponse(void *a1, const char *a2, ...)
{
  return [a1 poofOutBlurResponse];
}

id objc_msgSend_poofOutScale(void *a1, const char *a2, ...)
{
  return [a1 poofOutScale];
}

id objc_msgSend_poofOutScaleResponse(void *a1, const char *a2, ...)
{
  return [a1 poofOutScaleResponse];
}

id objc_msgSend_poofResponse(void *a1, const char *a2, ...)
{
  return [a1 poofResponse];
}

id objc_msgSend_poofScaleDown(void *a1, const char *a2, ...)
{
  return [a1 poofScaleDown];
}

id objc_msgSend_poofScaleUp(void *a1, const char *a2, ...)
{
  return [a1 poofScaleUp];
}

id objc_msgSend_poofThrowDistanceDown(void *a1, const char *a2, ...)
{
  return [a1 poofThrowDistanceDown];
}

id objc_msgSend_poofThrowDistanceUp(void *a1, const char *a2, ...)
{
  return [a1 poofThrowDistanceUp];
}

id objc_msgSend_postOptions(void *a1, const char *a2, ...)
{
  return [a1 postOptions];
}

id objc_msgSend_preferredContainerSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContainerSize];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_preferredPresentationSize(void *a1, const char *a2, ...)
{
  return [a1 preferredPresentationSize];
}

id objc_msgSend_presentableContext(void *a1, const char *a2, ...)
{
  return [a1 presentableContext];
}

id objc_msgSend_presentableDismissalPreventionContext(void *a1, const char *a2, ...)
{
  return [a1 presentableDismissalPreventionContext];
}

id objc_msgSend_presentableHomeGestureContext(void *a1, const char *a2, ...)
{
  return [a1 presentableHomeGestureContext];
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return [a1 presentationLayer];
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return [a1 presentationSize];
}

id objc_msgSend_presentedBanner(void *a1, const char *a2, ...)
{
  return [a1 presentedBanner];
}

id objc_msgSend_presentedPersistentRunningContext(void *a1, const char *a2, ...)
{
  return [a1 presentedPersistentRunningContext];
}

id objc_msgSend_presentedPlatter(void *a1, const char *a2, ...)
{
  return [a1 presentedPlatter];
}

id objc_msgSend_presentedRemoteAlertViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedRemoteAlertViewController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_presentingScreen(void *a1, const char *a2, ...)
{
  return [a1 presentingScreen];
}

id objc_msgSend_presentsApertureStatus(void *a1, const char *a2, ...)
{
  return [a1 presentsApertureStatus];
}

id objc_msgSend_previousLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 previousLayoutMode];
}

id objc_msgSend_primaryColor(void *a1, const char *a2, ...)
{
  return [a1 primaryColor];
}

id objc_msgSend_primaryText(void *a1, const char *a2, ...)
{
  return [a1 primaryText];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return [a1 progress];
}

id objc_msgSend_progressSubscriber(void *a1, const char *a2, ...)
{
  return [a1 progressSubscriber];
}

id objc_msgSend_progressSuppressionState(void *a1, const char *a2, ...)
{
  return [a1 progressSuppressionState];
}

id objc_msgSend_progressSuppressionTimer(void *a1, const char *a2, ...)
{
  return [a1 progressSuppressionTimer];
}

id objc_msgSend_progressView(void *a1, const char *a2, ...)
{
  return [a1 progressView];
}

id objc_msgSend_promptedStatesData(void *a1, const char *a2, ...)
{
  return [a1 promptedStatesData];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_queuedStatusPlatter(void *a1, const char *a2, ...)
{
  return [a1 queuedStatusPlatter];
}

id objc_msgSend_queuedStatusPlatterTimer(void *a1, const char *a2, ...)
{
  return [a1 queuedStatusPlatterTimer];
}

id objc_msgSend_releaseDismissalPreventionAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 releaseDismissalPreventionAssertionIfNecessary];
}

id objc_msgSend_remoteProcess(void *a1, const char *a2, ...)
{
  return [a1 remoteProcess];
}

id objc_msgSend_remoteTarget(void *a1, const char *a2, ...)
{
  return [a1 remoteTarget];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return [a1 requestIdentifier];
}

id objc_msgSend_requestSceneDeactivation(void *a1, const char *a2, ...)
{
  return [a1 requestSceneDeactivation];
}

id objc_msgSend_requestTransitionToPreferredLayoutMode(void *a1, const char *a2, ...)
{
  return [a1 requestTransitionToPreferredLayoutMode];
}

id objc_msgSend_resetLocalIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 resetLocalIdleTimer];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootModalViewController(void *a1, const char *a2, ...)
{
  return [a1 rootModalViewController];
}

id objc_msgSend_rootSettings(void *a1, const char *a2, ...)
{
  return [a1 rootSettings];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_rubberBandingEnabled(void *a1, const char *a2, ...)
{
  return [a1 rubberBandingEnabled];
}

id objc_msgSend_runKind(void *a1, const char *a2, ...)
{
  return [a1 runKind];
}

id objc_msgSend_runSource(void *a1, const char *a2, ...)
{
  return [a1 runSource];
}

id objc_msgSend_runningContext(void *a1, const char *a2, ...)
{
  return [a1 runningContext];
}

id objc_msgSend_runningContextWaitingForFollowUpRequest(void *a1, const char *a2, ...)
{
  return [a1 runningContextWaitingForFollowUpRequest];
}

id objc_msgSend_runningPersistentWorkflows(void *a1, const char *a2, ...)
{
  return [a1 runningPersistentWorkflows];
}

id objc_msgSend_sashView(void *a1, const char *a2, ...)
{
  return [a1 sashView];
}

id objc_msgSend_sashViewHeight(void *a1, const char *a2, ...)
{
  return [a1 sashViewHeight];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_scrollDismissalActivationLeniency(void *a1, const char *a2, ...)
{
  return [a1 scrollDismissalActivationLeniency];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return [a1 scrollView];
}

id objc_msgSend_scrollViewGestureState(void *a1, const char *a2, ...)
{
  return [a1 scrollViewGestureState];
}

id objc_msgSend_secondaryText(void *a1, const char *a2, ...)
{
  return [a1 secondaryText];
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 setElementNeedsUpdate];
}

id objc_msgSend_setHostNeedsUpdate(void *a1, const char *a2, ...)
{
  return [a1 setHostNeedsUpdate];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedContext(void *a1, const char *a2, ...)
{
  return [a1 sharedContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedSettings(void *a1, const char *a2, ...)
{
  return [a1 sharedSettings];
}

id objc_msgSend_shouldDisplaySash(void *a1, const char *a2, ...)
{
  return [a1 shouldDisplaySash];
}

id objc_msgSend_shouldFreezePlatterLayout(void *a1, const char *a2, ...)
{
  return [a1 shouldFreezePlatterLayout];
}

id objc_msgSend_shouldHideSashView(void *a1, const char *a2, ...)
{
  return [a1 shouldHideSashView];
}

id objc_msgSend_shouldInstallBannerDimmingLayer(void *a1, const char *a2, ...)
{
  return [a1 shouldInstallBannerDimmingLayer];
}

id objc_msgSend_shouldObserveDisplayLayout(void *a1, const char *a2, ...)
{
  return [a1 shouldObserveDisplayLayout];
}

id objc_msgSend_shouldShowDimmingLayer(void *a1, const char *a2, ...)
{
  return [a1 shouldShowDimmingLayer];
}

id objc_msgSend_simulateStatusBannerDevice(void *a1, const char *a2, ...)
{
  return [a1 simulateStatusBannerDevice];
}

id objc_msgSend_singleStepHomeScreenRevokeTimers(void *a1, const char *a2, ...)
{
  return [a1 singleStepHomeScreenRevokeTimers];
}

id objc_msgSend_squeezeEnabled(void *a1, const char *a2, ...)
{
  return [a1 squeezeEnabled];
}

id objc_msgSend_standardClient(void *a1, const char *a2, ...)
{
  return [a1 standardClient];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startCollapseTimerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 startCollapseTimerIfNecessary];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stopObservingKeyboard(void *a1, const char *a2, ...)
{
  return [a1 stopObservingKeyboard];
}

id objc_msgSend_strokeColor(void *a1, const char *a2, ...)
{
  return [a1 strokeColor];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return [a1 systemApertureElementContext];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlueColor];
}

id objc_msgSend_systemDismissedBanner(void *a1, const char *a2, ...)
{
  return [a1 systemDismissedBanner];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_systemIdleTimerOverrideAssertion(void *a1, const char *a2, ...)
{
  return [a1 systemIdleTimerOverrideAssertion];
}

id objc_msgSend_systemIndigoColor(void *a1, const char *a2, ...)
{
  return [a1 systemIndigoColor];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return [a1 systemOrangeColor];
}

id objc_msgSend_systemRedColor(void *a1, const char *a2, ...)
{
  return [a1 systemRedColor];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return [a1 systemWhiteColor];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_testUnregisteredVelocityEdgeCase(void *a1, const char *a2, ...)
{
  return [a1 testUnregisteredVelocityEdgeCase];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleFont(void *a1, const char *a2, ...)
{
  return [a1 titleFont];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topLimit(void *a1, const char *a2, ...)
{
  return [a1 topLimit];
}

id objc_msgSend_topRubberBandRange(void *a1, const char *a2, ...)
{
  return [a1 topRubberBandRange];
}

id objc_msgSend_touchCapturedHandler(void *a1, const char *a2, ...)
{
  return [a1 touchCapturedHandler];
}

id objc_msgSend_trackingBlurEnabled(void *a1, const char *a2, ...)
{
  return [a1 trackingBlurEnabled];
}

id objc_msgSend_trackingDampingRatio(void *a1, const char *a2, ...)
{
  return [a1 trackingDampingRatio];
}

id objc_msgSend_trackingResponse(void *a1, const char *a2, ...)
{
  return [a1 trackingResponse];
}

id objc_msgSend_trackingScale(void *a1, const char *a2, ...)
{
  return [a1 trackingScale];
}

id objc_msgSend_trackingSqueezeFactor(void *a1, const char *a2, ...)
{
  return [a1 trackingSqueezeFactor];
}

id objc_msgSend_trailingView(void *a1, const char *a2, ...)
{
  return [a1 trailingView];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_transitionSettings(void *a1, const char *a2, ...)
{
  return [a1 transitionSettings];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_universalPreviewsEnabled(void *a1, const char *a2, ...)
{
  return [a1 universalPreviewsEnabled];
}

id objc_msgSend_updateDimmingLayerVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateDimmingLayerVisibility];
}

id objc_msgSend_updateHomeGestureOwnership(void *a1, const char *a2, ...)
{
  return [a1 updateHomeGestureOwnership];
}

id objc_msgSend_updateMicaViewState(void *a1, const char *a2, ...)
{
  return [a1 updateMicaViewState];
}

id objc_msgSend_useRemoteAlertsForActionInterfaceDialogRequests(void *a1, const char *a2, ...)
{
  return [a1 useRemoteAlertsForActionInterfaceDialogRequests];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInitiated(void *a1, const char *a2, ...)
{
  return [a1 userInitiated];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllerForPresenting(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForPresenting];
}

id objc_msgSend_viewIsAppearingCalled(void *a1, const char *a2, ...)
{
  return [a1 viewIsAppearingCalled];
}

id objc_msgSend_viewIsAppearingHandler(void *a1, const char *a2, ...)
{
  return [a1 viewIsAppearingHandler];
}

id objc_msgSend_viewWillAppearCalled(void *a1, const char *a2, ...)
{
  return [a1 viewWillAppearCalled];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_windowActivationCompletionHandler(void *a1, const char *a2, ...)
{
  return [a1 windowActivationCompletionHandler];
}

id objc_msgSend_workflowIdentifier(void *a1, const char *a2, ...)
{
  return [a1 workflowIdentifier];
}

id objc_msgSend_workflowReference(void *a1, const char *a2, ...)
{
  return [a1 workflowReference];
}