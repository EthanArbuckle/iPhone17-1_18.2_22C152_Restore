void sub_100002C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002C50(uint64_t a1, void *a2)
{
  v3 = (CGContext *)[a2 CGContext];
  CGContextScaleCTM(v3, 1.0, -1.0);
  CGContextTranslateCTM(v3, 0.0, -*(double *)(a1 + 48));
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6 = (CGImage *)[*(id *)(a1 + 32) CGImage];
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = v4;
  uint64_t v10 = v5;

  CGContextDrawImage(v3, *(CGRect *)&v7, v6);
}

void sub_100002E00(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B56E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10005E998();
    sub_100002E58();
  }
}

void sub_100002E58()
{
  v1[0] = 0;
  if (!qword_1000B56E8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100002F54;
    v1[4] = &unk_100099960;
    v1[5] = v1;
    long long v2 = off_100099948;
    uint64_t v3 = 0;
    qword_1000B56E8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_1000B56E8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100002F54()
{
  uint64_t result = _sl_dlopen();
  qword_1000B56E8 = result;
  return result;
}

Class sub_100002FC8(uint64_t a1)
{
  sub_100002E58();
  Class result = objc_getClass("LPFileMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B56F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005E9C0();
    return (Class)sub_100003020(v3);
  }
  return result;
}

Class sub_100003020(uint64_t a1)
{
  sub_100002E58();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B56F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)sub_10005E9E8();
    return (Class)+[UIImage _sss_imageFromScreenshot:v5];
  }
  return result;
}

void sub_100003354(uint64_t a1, void *a2)
{
  id v17 = a2;
  uint64_t v3 = (CGContext *)[v17 CGContext];
  long long v20 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v29.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  long long v19 = *(_OWORD *)&v29.a;
  *(_OWORD *)&v29.c = v20;
  *(_OWORD *)&v29.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  long long v18 = *(_OWORD *)&v29.tx;
  CGAffineTransformMakeScale(&t2, 1.0, -1.0);
  *(_OWORD *)&t1.a = v19;
  *(_OWORD *)&t1.c = v20;
  *(_OWORD *)&t1.tCGFloat x = v18;
  CGAffineTransformConcat(&v29, &t1, &t2);
  CGAffineTransformMakeTranslation(&v26, 0.0, *(CGFloat *)(a1 + 48));
  CGAffineTransform v25 = v29;
  CGAffineTransformConcat(&t1, &v25, &v26);
  CGAffineTransform v29 = t1;
  CGContextConcatCTM(v3, &t1);
  SEL v4 = [*(id *)(a1 + 32) originalAnnotations];
  objc_sync_enter(v4);
  id v5 = [*(id *)(a1 + 32) originalAnnotations];
  id v6 = [v5 copy];

  objc_sync_exit(v4);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v10);
        CGContextSaveGState(v3);
        [v11 integralDrawingBounds];
        CGFloat x = v31.origin.x;
        CGFloat y = v31.origin.y;
        if (!CGRectIsInfinite(v31)) {
          CGContextTranslateCTM(v3, x, y);
        }
        v25.a = 0.0;
        *(void *)&v25.b = &v25;
        *(void *)&v25.c = 0x2050000000;
        v15 = (void *)qword_1000B5700;
        *(void *)&v25.d = qword_1000B5700;
        if (!qword_1000B5700)
        {
          *(void *)&t1.a = _NSConcreteStackBlock;
          *(void *)&t1.b = 3221225472;
          *(void *)&t1.c = sub_1000037B4;
          *(void *)&t1.d = &unk_100099928;
          *(void *)&t1.tCGFloat x = &v25;
          sub_1000037B4((uint64_t)&t1);
          v15 = *(void **)(*(void *)&v25.b + 24);
        }
        id v16 = v15;
        _Block_object_dispose(&v25, 8);
        [v16 renderAnnotation:v11 inContext:v3];
        CGContextRestoreGState(v3);
        uint64_t v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v7 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v8);
  }
}

void sub_100003654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_sync_exit(v25);
  _Unwind_Resume(a1);
}

void sub_100003684(uint64_t a1, void *a2)
{
  id v11 = a2;
  double v3 = -*(double *)(a1 + 48);
  double v4 = -*(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 80);
  double v6 = *(double *)(a1 + 88);
  id v7 = SSCGImageBackedImageFromImage();
  [v7 drawInRect:v3, v4, v5, v6];
  if (*(double *)(a1 + 96) > 0.0 && (_os_feature_enabled_impl() & 1) == 0)
  {
    CGContextSaveGState((CGContextRef)[v11 CGContext]);
    id v8 = +[UIColor whiteColor];
    uint64_t v9 = [v8 colorWithAlphaComponent:*(double *)(a1 + 96)];
    [v9 set];

    v13.size.width = *(CGFloat *)(a1 + 104);
    v13.size.height = *(CGFloat *)(a1 + 112);
    v13.origin.CGFloat x = 0.0;
    v13.origin.CGFloat y = 0.0;
    UIRectFillUsingBlendMode(v13, kCGBlendModeNormal);
    CGContextRestoreGState((CGContextRef)[v11 CGContext]);
  }
  uint64_t v10 = *(void **)(a1 + 40);
  if (v10) {
    [v10 drawInRect:v3, v4, v5, v6];
  }
}

Class sub_1000037B4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000B5708)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000038F8;
    v4[4] = &unk_100099960;
    v4[5] = v4;
    long long v5 = off_1000999A8;
    uint64_t v6 = 0;
    qword_1000B5708 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1000B5708)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AKController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_10005EA10();
LABEL_8:
    free(v2);
  }
  qword_1000B5700 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000038F8()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5708 = result;
  return result;
}

void sub_100003D68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100003EE8(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5710 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10005E998();
    sub_100003F40();
  }
}

void sub_100003F40()
{
  v1[0] = 0;
  if (!qword_1000B5718)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000403C;
    v1[4] = &unk_100099960;
    v1[5] = v1;
    long long v2 = off_1000999C0;
    uint64_t v3 = 0;
    qword_1000B5718 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_1000B5718)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000403C()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5718 = result;
  return result;
}

Class sub_1000040B0(uint64_t a1)
{
  sub_100003F40();
  Class result = objc_getClass("LPFileMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5720 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005E9C0();
    return (Class)sub_100004108(v3);
  }
  return result;
}

Class sub_100004108(uint64_t a1)
{
  sub_100003F40();
  Class result = objc_getClass("LPImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5728 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)sub_10005E9E8();
    return +[SSSPathView layerClass];
  }
  return result;
}

void sub_100004670(id a1)
{
}

id sub_100007AB8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) setUserInteractionEnabled:0];
}

id sub_100007AD0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopFlash];
}

id sub_100007AD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopFlash];
}

void sub_1000081A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100009A30(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000B5738)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100009B74;
    v4[4] = &unk_100099960;
    v4[5] = v4;
    long long v5 = off_100099A40;
    uint64_t v6 = 0;
    qword_1000B5738 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1000B5738)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AKInkAnnotation");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_10005EA38();
LABEL_8:
    free(v2);
  }
  qword_1000B5730 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100009B74()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5738 = result;
  return result;
}

void sub_100009BE8(void *a1)
{
  id v1 = a1;
  long long v2 = +[SSSApplication sharedSSSApplication];
  uint64_t v3 = [v2 sssAppDelegate];
  SEL v4 = [v3 viewControllerManager];
  long long v5 = [v4 rootViewController];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100009CE0;
  v8[3] = &unk_100099A60;
  id v9 = v5;
  id v10 = v1;
  id v6 = v1;
  id v7 = v5;
  [v7 fullscreenifyWithCompletion:v8];
}

void sub_100009CE0(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) view];
  uint64_t v3 = +[NSMutableArray arrayWithObject:v2];
  if ([v3 count])
  {
    while (1)
    {
      SEL v4 = [v3 firstObject];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      [v3 removeObjectAtIndex:0];
      long long v5 = [v4 subviews];
      [v3 addObjectsFromArray:v5];

      if (![v3 count]) {
        goto LABEL_4;
      }
    }
  }
  else
  {
LABEL_4:
    SEL v4 = 0;
  }

  if (!v4)
  {
    id v10 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10005EA60(v10);
    }
    goto LABEL_21;
  }
  if (+[RPTTestRunner isRecapAvailable])
  {
    id v6 = [*(id *)(a1 + 32) view];
    id v7 = +[NSMutableArray arrayWithObject:v6];
    if ([v7 count])
    {
      while (1)
      {
        id v8 = [v7 firstObject];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          break;
        }
        [v7 removeObjectAtIndex:0];
        id v9 = [v8 subviews];
        [v7 addObjectsFromArray:v9];

        if (![v7 count])
        {
          id v8 = 0;
          break;
        }
      }
    }
    else
    {
      id v8 = 0;
    }

    if (v8)
    {
      RPTGetBoundsForView();
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v22 = v21 * 0.6;
      id v23 = objc_alloc((Class)RPTScrollViewTestParameters);
      CGAffineTransform v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      v27 = sub_10000A1B0;
      v28 = &unk_100099A60;
      id v29 = *(id *)(a1 + 32);
      id v30 = *(id *)(a1 + 40);
      id v24 = [v23 initWithTestName:@"GlitchFreeHero" scrollView:v4 completionHandler:&v25];
      [v24 setDirection:2 v25, v26, v27, v28];
      [v24 setPreventSheetDismissal:1];
      [v24 setShouldFlick:0];
      [v24 setScrollingBounds:v16, v18, v20, v22];
      +[RPTTestRunner runTestWithParameters:v24];

      v14 = v29;
      goto LABEL_18;
    }
    id v10 = os_log_create("com.apple.screenshotservices", "XPC");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_10005EAA4(v10);
    }
LABEL_21:

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    goto LABEL_22;
  }
  id v11 = +[UIApplication sharedApplication];
  [v11 startedTest:@"GlitchFreeHero"];

  [v4 contentSize];
  double v13 = v12;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10000A0D4;
  v31[3] = &unk_100099A60;
  id v32 = *(id *)(a1 + 32);
  id v33 = *(id *)(a1 + 40);
  [v4 _simulateScrollWithTranslation:0 duration:0 willBeginDragging:0 didEndDragging:v31 willBeginDecelerating:v13 didEndDecelerating:0.75];

  v14 = v32;
LABEL_18:

LABEL_22:
}

void sub_10000A0D4(uint64_t a1)
{
  long long v2 = +[UIApplication sharedApplication];
  [v2 finishedTest:@"GlitchFreeHero"];

  uint64_t v3 = *(void **)(a1 + 40);
  id v4 = *(id *)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000A260;
  v7[3] = &unk_100099A60;
  id v8 = v4;
  id v9 = v3;
  id v5 = v4;
  id v6 = v9;
  [v5 pipifyWithCompletion:v7];
}

void sub_10000A1B0(uint64_t a1)
{
  long long v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000A254;
  v3[3] = &unk_100099A60;
  id v4 = v2;
  id v5 = *(id *)(a1 + 40);
  [v4 pipifyWithCompletion:v3];
}

id sub_10000A254(uint64_t a1)
{
  return _[*(id *)(a1 + 32) performProgrammaticDismissWithCompletion:*(void *)(a1 + 40)];
}

id sub_10000A260(uint64_t a1)
{
  return _[*(id *)(a1 + 32) performProgrammaticDismissWithCompletion:*(void *)(a1 + 40)];
}

void *sub_10000A76C(void *result)
{
  id v1 = result;
  long long v2 = (void *)result[4];
  if (!v2[1])
  {
    uint64_t v3 = objc_alloc_init(SSSCropOverlayView);
    uint64_t v4 = v1[4];
    id v5 = *(void **)(v4 + 8);
    *(void *)(v4 + 8) = v3;

    [*(id *)(v1[4] + 8) setLineGrabberAlpha:*(double *)(v1[4] + 312)];
    [*(id *)(v1[4] + 8) setCornerGrabberAlpha:*(double *)(v1[4] + 296)];
    [*(id *)(v1[4] + 8) setLineAlpha:*(double *)(v1[4] + 304)];
    uint64_t result = [(id)v1[4] addSubview:*(void *)(v1[4] + 8)];
    long long v2 = (void *)v1[4];
  }
  if (!v2[6])
  {
    id v6 = objc_alloc_init(SSSUncroppedOccludingView);
    uint64_t v7 = v1[4];
    id v8 = *(void **)(v7 + 48);
    *(void *)(v7 + 48) = v6;

    [(id)v1[4] insertSubview:*(void *)(v1[4] + 64) belowSubview:*(void *)(v1[4] + 8)];
    uint64_t result = [*(id *)(v1[4] + 64) addSubview:*(void *)(v1[4] + 48)];
    long long v2 = (void *)v1[4];
  }
  if (!v2[13])
  {
    id v9 = [objc_alloc((Class)UILongPressGestureRecognizer) initWithTarget:v1[4] action:"_handleOverlayViewResize:"];
    uint64_t v10 = v1[4];
    id v11 = *(void **)(v10 + 104);
    *(void *)(v10 + 104) = v9;

    [*(id *)(v1[4] + 104) setMinimumPressDuration:0.0];
    uint64_t v12 = v1[4];
    double v13 = *(void **)(v12 + 8);
    uint64_t v14 = *(void *)(v12 + 104);
    return [v13 addGestureRecognizer:v14];
  }
  return result;
}

id sub_10000BF88(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsLayout];
  long long v2 = *(void **)(a1 + 32);
  uint64_t v3 = (void *)v2[23];
  [v2 _contentInsetForUnitRect:*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
  [v3 setContentInset:];
  [*(id *)(*(void *)(a1 + 32) + 184) zoomToRect:0, *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96)];
  [*(id *)(a1 + 32) _updateLastScrollViewUnitRect];
  uint64_t v4 = *(void **)(a1 + 32);

  return [v4 layoutIfNeeded];
}

id sub_10000C010(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateLastScrollViewUnitRect];
  [*(id *)(a1 + 32) _updateForScrollViewNonLiveUserEvent];
  long long v2 = *(void **)(a1 + 32);

  return [v2 setNeedsLayout];
}

id sub_10000DAA8(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setAlpha:*(double *)(a1 + 40)];
}

void sub_10000E15C(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3 = a1;
  *(_OWORD *)a2 = xmmword_100075E20;
  *(void *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = 0;
  *(void *)(a2 + 32) = 0x4010000000000000;
  id v6 = v3;
  [v3 displayCornerRadius];
  if (v4 != _UITraitCollectionDisplayCornerRadiusUnspecified)
  {
    [v6 displayCornerRadius];
    if (v5 != 0.0)
    {
      *(_OWORD *)a2 = xmmword_100075E30;
      *(_OWORD *)(a2 + 16) = xmmword_100075E40;
      *(void *)(a2 + 32) = 0x4010000000000000;
    }
  }
}

double sub_10000E1FC()
{
  return 0.2;
}

double sub_10000E208()
{
  return 6.0;
}

void sub_10000EB74(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[BSActionResponse response];
  [v1 sendResponse:v2];
}

void sub_10000F8D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000F8FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F9B8;
  v5[3] = &unk_100099B08;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
}

void sub_10000F9B8(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [WeakRetained[8] setImage:*(void *)(a1 + 32)];
    if ((_os_feature_enabled_impl() & 1) == 0)
    {
      id v2 = [WeakRetained delegate];
      [v2 imageViewDidLoadImage:WeakRetained];
    }
    [WeakRetained analyzeCurrentImageIfNecessary];
    [(id)objc_opt_class() _saveImageForSysdiagnose:*(void *)(a1 + 32)];
  }
}

void sub_10000FDE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_10000FE18(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = os_log_create("com.apple.screenshotservices", "ShareSheet");
  double v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Did begin analysis of new image", buf, 2u);
    }

    double v5 = [objc_alloc((Class)VKCImageAnalyzerRequest) initWithImage:v3 orientation:0 requestType:-1];
    [v5 setImageSource:1];
    [v5 set_wantsFormFieldDetection:0];
    id WeakRetained = objc_loadWeakRetained(a1 + 5);
    id v7 = [WeakRetained currentInProcessRequestID];
    if ((int)v7 >= 1)
    {
      [a1[4] cancelRequestID:v7];
      [WeakRetained setCurrentInProcessRequestID:0];
    }
    id v8 = a1[4];
    id v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_100010004;
    uint64_t v12 = &unk_100099B58;
    objc_copyWeak(&v13, a1 + 5);
    objc_copyWeak(&v14, a1 + 6);
    [v8 processRequest:v5 progressHandler:0 completionHandler:&v9];
    [WeakRetained setCurrentInProcessRequestID:[v5 requestID:v9, v10, v11, v12]];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    sub_10005EAE8(v5);
  }
}

void sub_10000FFE4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100010004(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v6 = [WeakRetained currentInProcessRequestID];
  if (v6 == [v3 analysisRequestID]) {
    [WeakRetained setCurrentInProcessRequestID:0];
  }
  if (WeakRetained)
  {
    if (v5)
    {
      id v7 = [WeakRetained screenshot];

      if (v7 == v5)
      {
        id v8 = os_log_create("com.apple.screenshotservices", "ShareSheet");
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v12 = 0;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Did complete analysis", v12, 2u);
        }

        id v9 = [WeakRetained imageInteraction];
        [v9 setAnalysis:v3];

        [WeakRetained setInteractionMode:[WeakRetained interactionMode]];
        uint64_t v10 = [WeakRetained delegate];
        id v11 = [WeakRetained imageInteraction];
        [v10 imageViewDidUpdateInteraction:v11 withAnalysis:v3];
      }
    }
  }
}

void sub_10001016C(uint64_t a1)
{
  SSCGImageBackedImageFromImage();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000101CC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000104D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateInteractionHighlightStatusIfNecessary];
}

void sub_100010A50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100010A74(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100010B44;
  block[3] = &unk_100099BF8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

uint64_t sub_100010B44(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[12] setImage:*(void *)(a1 + 32)];
    id v3 = v6;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, id *))(v4 + 16))(v4, v3);
  }

  return _objc_release_x1();
}

void sub_100010E04(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 40) _createDirectoryForSysdiagnoseIfNecessary];
  if (!v2)
  {
    id v3 = [@"/private/var/db/sysdiagnose/com.apple.ScreenshotServicesService/" stringByAppendingString:@"Screenshot.png"];
    id v5 = *(UIImage **)(a1 + 32);
    uint64_t v4 = (uint64_t *)(a1 + 32);
    id v6 = UIImagePNGRepresentation(v5);
    id v7 = v6;
    if (v6)
    {
      id v10 = 0;
      unsigned __int8 v8 = [v6 writeToFile:v3 options:1 error:&v10];
      id v2 = v10;
      if (v8)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v9 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005EC20((uint64_t)v3, (uint64_t)v2, v9);
      }
    }
    else
    {
      id v9 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_10005EBA4(v4, v9);
      }
      id v2 = 0;
    }

    goto LABEL_10;
  }
LABEL_11:
}

void sub_100012568(uint64_t a1)
{
  id v2 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) environmentDescription];
    uint64_t v4 = [v3 loggableDescription];
    *(_DWORD *)buf = 138412290;
    id v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finished saving edits to screenshot with environment description %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000126E0;
  v5[3] = &unk_100099B08;
  objc_copyWeak(&v7, (id *)buf);
  id v6 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void sub_1000126E0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) wasJustSavedForMode:0];
    id v3 = [*(id *)(a1 + 32) environmentDescription];
    uint64_t v4 = [v3 identifier];

    id v5 = [WeakRetained[6] indexOfObject:v4];
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) environmentDescription];
        unsigned __int8 v8 = [v7 loggableDescription];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Error: Trying to remove environment from _environmentDescriptionIdentifiersBeingSaved, but environment description %@ was not found.", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      [WeakRetained[6] removeObjectAtIndex:v5];
    }
    [WeakRetained _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:v4];
  }
}

void sub_100012844(uint64_t a1)
{
  id v2 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(a1 + 32) environmentDescription];
    uint64_t v4 = [v3 loggableDescription];
    *(_DWORD *)buf = 138412290;
    int v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Finished saving edits to pdf with environment description %@", buf, 0xCu);
  }
  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000129BC;
  v5[3] = &unk_100099B08;
  objc_copyWeak(&v7, (id *)buf);
  id v6 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void sub_1000129BC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    [*(id *)(a1 + 32) wasJustSavedForMode:1];
    id v3 = [*(id *)(a1 + 32) environmentDescription];
    uint64_t v4 = [v3 identifier];

    id v5 = [WeakRetained[6] indexOfObject:v4];
    if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      id v6 = os_log_create("com.apple.screenshotservices", "ScreenshotManager");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        id v7 = [*(id *)(a1 + 32) environmentDescription];
        unsigned __int8 v8 = [v7 loggableDescription];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Error: Trying to remove environment from _environmentDescriptionIdentifiersBeingSaved, but environment description %@ was not found.", (uint8_t *)&v9, 0xCu);
      }
    }
    else
    {
      [WeakRetained[6] removeObjectAtIndex:v5];
    }
    [WeakRetained _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:v4];
  }
}

void sub_100012BA8(id a1)
{
  qword_1000B5740 = (uint64_t)dispatch_queue_create("com.apple.screenshotservices.screenshotManagerTemporarySavingQueue", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);

  _objc_release_x1();
}

void sub_100012CC0(uint64_t a1)
{
  id v2 = dispatch_group_create();
  id v3 = +[NSMutableArray array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v12 = a1;
  id obj = *(id *)(a1 + 32);
  id v4 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v21;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v21 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v20 + 1) + 8 * (void)v7);
        dispatch_group_enter(v2);
        int v9 = +[SSScreenshotAssetManager sharedAssetManager];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100012F10;
        v17[3] = &unk_100099D08;
        id v18 = v3;
        double v19 = v2;
        [v9 recordPersistableToTemporaryLocation:v8 withCompletionBlock:v17];

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v5);
  }

  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100013030;
  block[3] = &unk_100099D30;
  id v10 = *(id *)(v12 + 40);
  id v15 = v3;
  id v16 = v10;
  id v11 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100012F10(uint64_t a1, char a2, void *a3)
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100012FE4;
  v5[3] = &unk_100099CE0;
  char v9 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  id v4 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100012FE4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56) && *(void *)(a1 + 32)) {
    [*(id *)(a1 + 40) addObject:];
  }
  id v2 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v2);
}

uint64_t sub_100013030(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_100013268(void *a1)
{
  id v2 = +[SSScreenshotAssetManager sharedAssetManager];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100013324;
  v6[3] = &unk_100099C98;
  uint64_t v3 = a1[4];
  id v4 = (void *)a1[6];
  uint64_t v5 = a1[7];
  v6[4] = a1[5];
  id v7 = v4;
  [v2 removePersistable:v3 deleteOptions:v5 withCompletionBlock:v6];
}

void sub_100013324(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000133E0;
  block[3] = &unk_100099B08;
  objc_copyWeak(&v4, &location);
  id v3 = *(id *)(a1 + 40);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void sub_1000133E0(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[5] removeObject:*(void *)(a1 + 32)];
    [v3 _reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

void sub_10001354C(uint64_t a1)
{
  id v2 = +[SSScreenshotAssetManager sharedAssetManager];
  [v2 removePersistable:*(void *)(a1 + 32) deleteOptions:*(void *)(a1 + 40) withCompletionBlock:&stru_100099D78];
}

uint64_t sub_100014174(uint64_t a1)
{
  qword_1000B5750 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

void sub_10001422C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id sub_100014B9C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setEffect:*(void *)(a1 + 40)];
}

void sub_10001523C(uint64_t a1)
{
  [*(id *)(a1 + 32) _addScreenshotWithPDF:0 visibleRect:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48) - 2;
  id v4 = [*(id *)(a1 + 32) debugView];
  id v5 = v4;
  if (v2 == v3) {
    [v4 resetScrollOffset];
  }
  else {
    [v4 advanceScrollOffset];
  }
}

id sub_100015438(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _addScreenshots];
}

void sub_100015A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100016468(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000B5768)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000165AC;
    v4[4] = &unk_100099960;
    v4[5] = v4;
    long long v5 = off_100099DE0;
    uint64_t v6 = 0;
    qword_1000B5768 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000B5768)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("WKWebView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10005EF54();
LABEL_8:
    free(v2);
  }
  qword_1000B5760 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000165AC()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5768 = result;
  return result;
}

void sub_100016F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100016F58(uint64_t a1, uint64_t a2, int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a3)
  {
    id v5 = WeakRetained;
    [WeakRetained reportStatistics];
    id WeakRetained = v5;
  }
}

void sub_1000174A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000174E0(id *a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 selectedOptionIndex];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setShareAsOption:v4];

  [v3 selectedOptionIndex];
  _SSSetLastUsedFullPageScreenshotShareAsOption();
  id v6 = objc_loadWeakRetained(a1);
  [v6 didChangeShareOptions];
}

void sub_100017824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017850(id *a1, void *a2)
{
  id v3 = [a2 text];
  a1 += 4;
  id WeakRetained = objc_loadWeakRetained(a1);
  [WeakRetained setRenameOption:v3];

  id v5 = objc_loadWeakRetained(a1);
  [v5 didChangeRenameOption];
}

void sub_100018DEC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_10001947C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (v5)
  {
    if (!a3)
    {
      id v7 = [v5 activityType];
      unsigned int v8 = [@"com.apple.screenshotservices.sirisharing" isEqual:v7];

      if (v8)
      {
        char v9 = os_log_create("com.apple.screenshotservices", "Editing");
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
          sub_10005F008(a1, v9);
        }

        [v6 _setOptions:0];
        [v6 becomeCurrent];
        [v6 resignCurrent];
        [v6 invalidate];
      }
    }
  }
  [*(id *)(a1 + 40) _markImageAsBeingEdited];
}

void sub_10001991C(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019A20;
  v7[3] = &unk_100099BD0;
  objc_copyWeak(&v8, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
  id v4 = UIImageJPEGRepresentation(v3, 1.0);
  (*(void (**)(void, void *, uint64_t, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4, v5, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void sub_100019A04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019A20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[44] = 0;
  }
}

double sub_10001A660(uint64_t a1, double a2)
{
  return a2 / *(double *)(a1 + 32);
}

void sub_10001ACC0(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained q_saveEditedPDF];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001AD9C;
  block[3] = &unk_100099BD0;
  objc_copyWeak(&v6, v2);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  objc_destroyWeak(&v6);
}

void sub_10001AD88(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10001AD9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[45] = 0;
  }
}

void sub_10001B4C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

id sub_10001B4FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDocumentIsSaving:1];
}

id sub_10001B508(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setDocumentIsSaving:0];
}

void sub_10001B514(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v9 = 0;
  unsigned __int8 v5 = [v4 writeToURL:v3 options:1 error:&v9];
  id v6 = v9;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v5;
  id v7 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
      CFStringRef v8 = @"Saved";
    }
    else {
      CFStringRef v8 = @"Could not save";
    }
    *(_DWORD *)buf = 138412802;
    CFStringRef v11 = v8;
    __int16 v12 = 2112;
    id v13 = v3;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ previously saved PDF to %@ (%@)", buf, 0x20u);
  }
}

void sub_10001B64C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained setPDFURL:*(void *)(a1 + 32)];

  id v3 = os_log_create("com.apple.screenshotservices", "PDF");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10005F368((uint64_t *)(a1 + 32), a1, v3);
  }
}

uint64_t sub_10001C19C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) imageProvider];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001C24C;
  v7[3] = &unk_100099BA8;
  id v8 = v3;
  id v5 = v3;
  [v4 requestOutputImageForSaving:v7];

  return 0;
}

uint64_t sub_10001C24C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10001C260(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v2 editedPDFDataForShareSheet];
  v3[2](v3, v4, 0);

  return 0;
}

void sub_10001C650(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_10001C668(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    id v3 = [a1[4] environmentDescription];
    uint64_t v4 = [v3 imageSurface];
    id v5 = +[UIImage ss_cgImageBackedImageFromImageSurface:v4];

    id v6 = UIImagePNGRepresentation(v5);
    id v7 = (void *)*((void *)a1[4] + 13);
    CFStringRef v11 = v6;
    id v8 = +[NSArray arrayWithObjects:&v11 count:1];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001C7CC;
    v9[3] = &unk_100099FB0;
    id v10 = a1[5];
    [v7 insertImagesData:v8 completion:v9];
  }
}

void sub_10001C7CC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10005F3F8(v5, v6);
    }
  }
  if (a2)
  {
    id v7 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "screenshot sent to quick note", v9, 2u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(void))(v8 + 16))();
  }
}

Class sub_10001CB44(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000B5778)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_10001CC88;
    v4[4] = &unk_100099960;
    v4[5] = v4;
    long long v5 = off_100099FD0;
    uint64_t v6 = 0;
    qword_1000B5778 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_1000B5778)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("SYLinkContextClient");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10005F48C();
LABEL_8:
    free(v2);
  }
  qword_1000B5770 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001CC88()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5778 = result;
  return result;
}

void sub_10001D0D8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v2 = *(void *)(a1 + 48) == 1;
  if (*(unsigned char *)(a1 + 56)) {
    double v3 = 0.3;
  }
  else {
    double v3 = 0.0;
  }
  id v4 = [*(id *)(a1 + 32) delegate];
  [v4 dittoRootViewController:*(void *)(a1 + 32) wantsBackground:v2 duration:v3];
}

id sub_10001D69C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForSize:*(double *)(a1 + 40) *(double *)(a1 + 48)];
}

id sub_10001E838(uint64_t a1)
{
  return [*(id *)(a1 + 32) setFrame: *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
}

id sub_10001E910(uint64_t a1)
{
  [*(id *)(a1 + 32) setFrame:*(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64)];
  BOOL v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void sub_100020B00(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setContentSwitcherAlpha:*(double *)(a1 + 48)];
  [*(id *)(a1 + 40) layoutIfNeeded];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  [v2 layoutIfNeeded];
}

void sub_100020B74(uint64_t a1)
{
  id v2 = +[SSSSignificantEventController sharedSignificantEventController];
  [v2 screenshotAppearAnimationEndedForScreenshot:*(void *)(a1 + 32) userInterface:*(void *)(a1 + 40)];

  [*(id *)(a1 + 40) _prepareDragInteractionIfNecessary];
  [*(id *)(a1 + 48) setNeedsLayout];
  id v3 = [*(id *)(*(void *)(a1 + 40) + 16) view];
  [v3 setNeedsLayout];
}

uint64_t sub_100020D5C(uint64_t a1)
{
  [*(id *)(a1 + 32) _positionAppearingScreenshot:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_100020E54(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setContentSwitcherAlpha:1.0];
}

void sub_1000210E8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 32);
  *(void *)(v2 + 32) = 0;

  (*(void (**)(void, id))(*(void *)(*(void *)(a1 + 32) + 40) + 16))(*(void *)(*(void *)(a1 + 32) + 40), [*(id *)(a1 + 40) successful]);
  uint64_t v4 = *(void *)(a1 + 32);
  long long v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  id v6 = [*(id *)(a1 + 32) delegate];
  [v6 containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI:*(void *)(a1 + 32)];
}

void sub_100021898(int8x16_t *a1)
{
  id v2 = [objc_alloc((Class)UICubicTimingParameters) initWithControlPoint1:0.666670024 controlPoint2:0.00666669989 0.800000012 0.993330002];
  id v3 = [objc_alloc((Class)UIViewPropertyAnimator) initWithDuration:v2 timingParameters:*(double *)a1[3].i64];
  [v3 setUserInteractionEnabled:0];
  uint64_t v4 = a1[2].i64[0];
  long long v5 = *(void **)(v4 + 96);
  *(void *)(v4 + 96) = v3;
  id v6 = v3;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100021A1C;
  v11[3] = &unk_100099A20;
  v11[4] = a1[2].i64[0];
  [v6 addAnimations:v11];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021A24;
  v8[3] = &unk_10009A0E0;
  int8x16_t v10 = vextq_s8(a1[3], a1[3], 8uLL);
  id v7 = (void *)a1[2].i64[1];
  void v8[4] = a1[2].i64[0];
  id v9 = v7;
  [v6 addCompletion:v8];
  [v6 startAnimation];
}

id sub_100021A1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _moveScreenshotsViewForHorizontalSlideOffDismiss];
}

void sub_100021A24(uint64_t a1)
{
  double v2 = *(double *)(a1 + 48) - *(double *)(a1 + 56);
  double v3 = v2 * 1000000000.0;
  BOOL v4 = v2 < 0.0;
  double v5 = 0.0;
  if (!v4) {
    double v5 = v3;
  }
  dispatch_time_t v6 = dispatch_time(0, (uint64_t)v5);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100021AEC;
  v8[3] = &unk_100099A60;
  id v7 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_after(v6, (dispatch_queue_t)&_dispatch_main_q, v8);
}

uint64_t sub_100021AEC(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 96);
  *(void *)(v2 + 96) = 0;

  [*(id *)(a1 + 32) _performPostDismissActions];
  uint64_t v4 = *(void *)(a1 + 40);

  return sub_100026FC0(v4);
}

void sub_100021B40(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id v3 = objc_alloc_init((Class)BSMutableAnimationSettings);
    [*(id *)(a1 + 32) _durationForHorizontalSlideOffDismiss];
    [v3 setDuration:];
    id v2 = v3;
  }
  else
  {
    id v2 = 0;
  }
  id v4 = v2;
  [*(id *)(a1 + 32) _performPreDismissActionsForAnimationSettings:v2];
  if (!*(unsigned char *)(a1 + 49)) {
    [*(id *)(a1 + 32) setState:0 animated:1 completion:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100021BEC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100021E5C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _moveScreenshotsViewForHorizontalSlideOffDismiss];
}

id sub_100021E64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPostDismissActions];
}

void sub_100021FD8(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  [v2 frame];
  [v2 setFrame:];
  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

id sub_100022048(uint64_t a1)
{
  return [*(id *)(a1 + 32) _performPostDismissActions];
}

void sub_100022234(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v4 = [v1 view];
  [v4 bounds];
  [v1 _updateForSize:v2, v3];
}

void sub_10002244C(uint64_t a1)
{
  double v2 = +[SSSSignificantEventController sharedSignificantEventController];
  double v3 = [*(id *)(*(void *)(a1 + 32) + 16) visibleScreenshots];
  [v2 screenshotUIWithScreenshots:v3 beganStateChangeFromState:*(void *)(*(void *)(a1 + 32) + 144) toState:*(void *)(a1 + 48)];

  id v4 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  [v4 layoutIfNeeded];

  double v5 = [*(id *)(a1 + 32) view];
  [v5 layoutIfNeeded];

  [*(id *)(a1 + 32) _prepareGesturesForState:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 16) setScreenshotsUseTrilinearMinificationFilter:1];
  [*(id *)(*(void *)(a1 + 32) + 16) setShowsShadow:0 animated:0];
  dispatch_time_t v6 = +[SSSSpringAnimationParameters scaleAnimationParameters];
  [v6 setAnimationOptions:[v6 animationOptions] & 0xFFFFFFFFFFFFFFFDLL];
  if (*(void *)(a1 + 48) == 1) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 3;
  }
  [v6 setAnimationReason:v7];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002262C;
  v12[3] = &unk_10009A1F8;
  id v9 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v12[4] = *(void *)(a1 + 32);
  uint64_t v15 = v8;
  char v16 = *(unsigned char *)(a1 + 56);
  id v14 = v9;
  id v10 = v6;
  id v13 = v10;
  CFStringRef v11 = objc_retainBlock(v12);
  if (!*(void *)(a1 + 48)) {
    [*(id *)(*(void *)(a1 + 32) + 16) removeChildViewControllers];
  }
  ((void (*)(void *))v11[2])(v11);
}

void sub_10002262C(uint64_t a1)
{
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100022828;
  v16[3] = &unk_100099AE0;
  uint64_t v2 = *(void *)(a1 + 56);
  v16[4] = *(void *)(a1 + 32);
  v16[5] = v2;
  double v3 = objc_retainBlock(v16);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000228B8;
  v12[3] = &unk_10009A1A8;
  double v5 = *(void **)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v12[4] = *(void *)(a1 + 32);
  uint64_t v14 = v4;
  char v15 = *(unsigned char *)(a1 + 64);
  id v13 = v5;
  dispatch_time_t v6 = objc_retainBlock(v12);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000229F4;
    v10[3] = &unk_10009A158;
    CFStringRef v11 = v3;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100022A04;
    v8[3] = &unk_10009A1D0;
    id v9 = v6;
    +[UIView sss_animateWithAnimationParameters:v7 animations:v10 completion:v8];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
    ((void (*)(void *, uint64_t))v6[2])(v6, 1);
  }
}

id sub_100022828(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v3 = [v2 view];
  [v3 bounds];
  [v2 _updateForSize:v4, v5];

  [*(id *)(*(void *)(a1 + 32) + 16) setState:*(void *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 16) setSnapshotScreenshotEdits:*(void *)(a1 + 40) == 0];
  dispatch_time_t v6 = *(void **)(a1 + 32);

  return [v6 setNeedsStatusBarAppearanceUpdate];
}

void sub_1000228B8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) state];
  id v3 = *(id *)(a1 + 48);
  double v4 = *(void **)(a1 + 32);
  double v5 = (void *)v4[2];
  BOOL v6 = [v4 state] == 0;
  BOOL v7 = v2 == v3 && v6;
  [v5 setShowsShadow:v7 animated:*(unsigned __int8 *)(a1 + 56)];
  [*(id *)(*(void *)(a1 + 32) + 16) setScreenshotsUseTrilinearMinificationFilter:[*(id *)(a1 + 32) state] == 0];
  [*(id *)(*(void *)(a1 + 32) + 16) stateTransitionFinished];
  if (v2 == v3)
  {
    uint64_t v8 = [*(id *)(a1 + 32) delegate];
    [v8 containerViewController:*(void *)(a1 + 32) didTransitionToState:*(void *)(a1 + 48)];
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
  id v11 = +[SSSSignificantEventController sharedSignificantEventController];
  id v10 = [*(id *)(*(void *)(a1 + 32) + 16) visibleScreenshots];
  [v11 screenshotUIWithScreenshots:v10 endedStateChangeFromState:*(void *)(*(void *)(a1 + 32) + 144) toState:*(void *)(a1 + 48)];
}

uint64_t sub_1000229F4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100022A04(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100022D88(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateForCurrentSize];
}

id sub_1000231F4(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 16) presentActivityViewController];
}

void sub_1000234A0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) lastViewEditMode];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    double v4 = [v3 editedPDFDataForShareSheet];
    if (!v4) {
      goto LABEL_7;
    }
    id v5 = objc_alloc((Class)NSItemProvider);
    BOOL v6 = [UTTypePDF identifier];
    id v7 = [v5 initWithItem:v4 typeIdentifier:v6];
  }
  else
  {
    uint64_t v8 = [v3 imageProvider];
    double v4 = [v8 requestOutputImageForSavingBlocking];

    if (!v4) {
      goto LABEL_7;
    }
    id v7 = [objc_alloc((Class)NSItemProvider) initWithObject:v4];
  }
  [*(id *)(a1 + 40) addObject:v7];

LABEL_7:
  uint64_t v9 = *(NSObject **)(a1 + 48);

  dispatch_group_leave(v9);
}

void sub_100023590(uint64_t a1)
{
  id v2 = +[UIPasteboard generalPasteboard];
  [v2 setItemProviders:*(void *)(a1 + 32)];
  [*(id *)(a1 + 40) screenshotsViewController:*(void *)(a1 + 48) requestsDeleteForScreenshots:*(void *)(a1 + 56) deleteOptions:*(void *)(a1 + 64) forReason:*(void *)(a1 + 72)];
}

void sub_100023804(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) visibleScreenshots];
  id v3 = [v2 count];

  if (!v3 && !*(void *)(a1 + 40))
  {
    double v4 = *(void **)(a1 + 32);
    _[v4 _dismissScreenshotsWithSlide];
  }
}

void sub_100023884(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) visibleScreenshots];
  if ([v2 count])
  {
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);

    if (v3 == 1)
    {
      double v4 = *(void **)(a1 + 32);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100023988;
      v7[3] = &unk_100099C98;
      void v7[4] = v4;
      id v8 = *(id *)(a1 + 40);
      [v4 dismissScreenshotsAnimated:1 completion:v7];

      return;
    }
  }
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);

  _[v5 _stopBeingInterestedInScreenshots:v6];
}

id sub_100023988(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _stopBeingInterestedInScreenshots:*(void *)(a1 + 40)];
}

id sub_100023B58(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) progressTowardsReceivingAllImageIdentifierUpdates];
  double v3 = v2;
  if (v2 >= 1.0)
  {
    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = [*(id *)(*(void *)(a1 + 32) + 24) successful];
    id v11 = *(uint64_t (**)(uint64_t, id))(v9 + 16);
    return (id)v11(v9, v10);
  }
  else
  {
    double v4 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_10005F4F8(v4, v3);
    }

    id v5 = objc_retainBlock(*(id *)(a1 + 40));
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    [*(id *)(a1 + 32) _prepareImageIdentifierUpdateAlertIfNecessary];
    return [*(id *)(a1 + 32) _presentImageIdentifierUpdateAlertIfNecessary];
  }
}

id sub_100023D0C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 24) progressTowardsReceivingAllImageIdentifierUpdates];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v3 >= 1.0)
  {
    id v9 = [*(id *)(*(void *)(a1 + 32) + 24) successful];
    id v10 = *(uint64_t (**)(uint64_t, id))(v2 + 16);
    return (id)v10(v2, v9);
  }
  else
  {
    id v4 = objc_retainBlock(*(id *)(a1 + 40));
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    [*(id *)(a1 + 32) _prepareImageIdentifierUpdateAlertIfNecessary];
    id v7 = *(void **)(a1 + 32);
    return [v7 _presentImageIdentifierUpdateAlertIfNecessary];
  }
}

void sub_100024498(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) _updateForSize:*(double *)(a1 + 40) *(double *)(a1 + 48)];
  id v4 = *(void **)(a1 + 32);
  if (v4[12])
  {
    objc_initWeak(&location, v4);
    uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 96);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100024590;
    v6[3] = &unk_100099BD0;
    objc_copyWeak(&v7, &location);
    [v5 addAnimations:v6];
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void sub_100024574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100024590(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _moveScreenshotsViewForHorizontalSlideOffDismiss];
}

void sub_10002464C(id a1)
{
  byte_1000B5780 = +[UIDragInteraction isEnabledByDefault];
}

void *sub_100024934(void *result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result[4] + 16) setBorderViewStyleOverride:0 withAnimator:0];
    id v3 = (void *)v2[4];
    return [v3 _stopDraggingDismissing:0];
  }
  return result;
}

void sub_100024B88(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) setBorderViewStyleOverride:0 withAnimator:0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) view];
  [v2 setAlpha:1.0];
}

void sub_100025658(id a1)
{
  qword_1000B5790 = objc_alloc_init(SSSSignificantEventController);

  _objc_release_x1();
}

id sub_100025B8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishRunPPTServiceRequest:*(void *)(a1 + 40)];
}

void sub_1000260C4(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() newTestScreenshot];
  id v3 = dispatch_get_global_queue(0, 0);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100026194;
  v6[3] = &unk_100099D30;
  id v4 = *(id *)(a1 + 40);
  id v7 = v2;
  id v8 = v4;
  id v5 = v2;
  dispatch_async(v3, v6);
}

uint64_t sub_100026194(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t sub_100026FC0(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_100026FD4(uint64_t result)
{
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_1000271E8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeHighQualityQueueIfNecessary];
}

void sub_100027518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100027530(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained && *((unsigned char *)WeakRetained + 13))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000275EC;
    v5[3] = &unk_10009A2F8;
    id v6 = a1[4];
    id v4 = a1[5];
    id v7 = v3;
    id v8 = v4;
    [v3 _loadUneditedImageIfNecessaryWithCompletionBlock:v5];
  }
}

void sub_1000275EC(uint64_t a1)
{
  id v2 = *(void **)(a1 + 40);
  uint64_t v1 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  id v3 = [v2 _outputImageOnCurrentUneditedImage];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void sub_100027760(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100027774(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id *)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = [WeakRetained _outputImageOnCurrentUneditedImage];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);
}

void sub_100027914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002792C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10002793C(uint64_t a1)
{
}

void sub_100027944(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100027AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027AD8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100027C08(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained screenshot];
  id v3 = [v2 backingImage];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);
}

void sub_100027DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100027DC0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100027F00(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100027F14(uint64_t a1)
{
  id v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = [WeakRetained cachedCGImageBackedUneditedImageForUI];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained(v2);
    id v6 = [v5 screenshot];
    id v7 = [v6 backingImage];

    id v8 = v7;
    id v9 = [v8 CGImage];
    id v10 = objc_loadWeakRetained(v2);
    id v11 = v10;
    if (v9)
    {
      [v10 setCachedCGImageBackedUneditedImageForUI:v8];
    }
    else
    {
      __int16 v12 = [v10 screenshot];
      id v13 = [v12 environmentDescription];
      uint64_t v14 = [v13 imageSurface];

      char v15 = +[UIImage ss_cgImageBackedImageFromImageSurface:v14];
      id v16 = objc_loadWeakRetained(v2);
      [v16 setCachedCGImageBackedUneditedImageForUI:v15];

      id v11 = (void *)v14;
    }
  }
  uint64_t v17 = *(void *)(a1 + 40);
  id v18 = [*(id *)(a1 + 32) cachedCGImageBackedUneditedImageForUI];
  (*(void (**)(uint64_t, id))(v17 + 16))(v17, v18);
}

void sub_10002819C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000281B4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002835C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100028380(uint64_t a1, void *a2)
{
  id v11 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setHasOriginalUneditedImage:1];

  id v4 = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [v4 screenshot];
  [v5 setBackingImage:v11];

  id v6 = objc_loadWeakRetained((id *)(a1 + 40));
  [v6 setHasChangedBackingImage:1];

  id v7 = objc_loadWeakRetained((id *)(a1 + 40));
  id v8 = [v7 screenshot];
  unsigned __int8 v9 = [v8 hasEverBeenEditedForMode:0];

  if ((v9 & 1) == 0)
  {
    id v10 = objc_loadWeakRetained((id *)(a1 + 40));
    [v10 setCachedOutputImage:v11];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100028568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_10002857C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resumeHighQualityQueueIfNecessary];
}

void sub_100028754(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100028768(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v3 = [WeakRetained highQualityQueueIsValid];

  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v4();
  }
}

void sub_100028EE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028EF8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100028F08(uint64_t a1)
{
}

void sub_100028F10(double *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = *((void *)a1 + 4);
  double v7 = a1[7];
  double v8 = a1[8];
  id v9 = a2;
  [v9 convertPoint:v6 fromView:v7];
  [v9 hitTest:*((void *)a1 + 5)];
  id obj = (id)objc_claimAutoreleasedReturnValue();

  id v10 = obj;
  if (obj)
  {
    objc_storeStrong((id *)(*(void *)(*((void *)a1 + 6) + 8) + 40), obj);
    id v10 = obj;
    *a4 = 1;
  }
}

void sub_10002A3AC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[1];
    WeakRetained[1] = 0;

    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = [v2[3] gestureRecognizers];
    id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      id v6 = v5;
      uint64_t v7 = *(void *)v10;
      while (2)
      {
        double v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) state] == (id)2)
          {

            [v2 annotationsDidChange];
            goto LABEL_12;
          }
          double v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    [v2 setNeedsPageImageUpdate];
  }
LABEL_12:
}

void sub_10002B698(id *a1)
{
  [a1[4] duration];
  double v3 = v2;
  [a1[4] delay];
  double v5 = v4;
  id v6 = [a1[4] animationOptions];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002B7CC;
  v10[3] = &unk_10009A158;
  id v7 = a1[4];
  id v11 = a1[5];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10002B7E4;
  v8[3] = &unk_10009A1D0;
  id v9 = a1[6];
  +[UIView _animateWithDuration:v6 delay:v7 options:v10 factory:v8 animations:v3 completion:v5];
}

uint64_t sub_10002B7CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_10002B7E4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

double *sub_10002BD54(double *result)
{
  uint64_t v1 = *((void *)result + 5);
  if (v1 >= 1)
  {
    double v2 = result;
    for (uint64_t i = 0; i < v1; ++i)
    {
      double v4 = v2[6] + (double)i * v2[7];
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_10002BE38;
      v5[3] = &unk_100099AE0;
      *(double *)&void v5[4] = v2[4];
      *(double *)&v5[5] = v4;
      uint64_t result = (double *)+[UIView addKeyframeWithRelativeStartTime:v5 relativeDuration:(double)i / (double)v1 animations:1.0 / (double)v1];
      uint64_t v1 = *((void *)v2 + 5);
    }
  }
  return result;
}

void sub_10002BE38(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  id v2 = [*(id *)(a1 + 32) _shapeLayerPathForProgress:*(double *)(a1 + 40)];
  [v1 setPath:v2];
}

void sub_10002C154(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 waitingForImageIdentifierUpdatesAlertControllerDidCancel:*(void *)(a1 + 32)];
}

BOOL sub_10002CA2C(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

CFStringRef sub_10002CA3C(uint64_t a1)
{
  CFStringRef v1 = @"unknown";
  if (a1 == 1) {
    CFStringRef v1 = @"fullscreen";
  }
  if (a1) {
    return v1;
  }
  else {
    return @"miniature";
  }
}

id sub_10002D764(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 8) performProgrammaticDismiss];
}

id sub_10002EB58(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) setAlpha:0.0];
}

id sub_10002EB70(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 80) stopAnimating];
}

double sub_10002F148(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13)
{
  id v24 = a3;
  double v25 = a10 - a8;
  double v26 = a11 - a9;
  UIRectGetCorners();
  if (sub_100030FAC(a1, a2)) {
    double v27 = v25;
  }
  else {
    double v27 = -0.0;
  }
  double v28 = v71 + v27;
  if (sub_100030FC0(a1, a2)) {
    double v29 = v25;
  }
  else {
    double v29 = -0.0;
  }
  double v30 = v74 + v29;
  if (sub_100030FD4(a1, a2)) {
    double v31 = v26;
  }
  else {
    double v31 = -0.0;
  }
  double v32 = v72 + v31;
  if (sub_100030FE8(a1, a2)) {
    double v33 = v26;
  }
  else {
    double v33 = -0.0;
  }
  long long v65 = 0u;
  long long v66 = 0u;
  double v34 = v73 + v33;
  long long v67 = 0u;
  long long v68 = 0u;
  id v35 = v24;
  id v36 = [v35 countByEnumeratingWithState:&v65 objects:v70 count:16];
  if (v36)
  {
    id v37 = v36;
    uint64_t v38 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v37; uint64_t i = (char *)i + 1)
      {
        double v61 = v34;
        double v62 = v32;
        double v63 = v28;
        double v64 = v30;
        if (*(void *)v66 != v38) {
          objc_enumerationMutation(v35);
        }
        [*(id *)(*((void *)&v65 + 1) + 8 * i) CGRectValue];
        CGFloat x = v77.origin.x;
        CGFloat y = v77.origin.y;
        CGFloat width = v77.size.width;
        CGFloat height = v77.size.height;
        double MinX = CGRectGetMinX(v77);
        v78.origin.CGFloat x = x;
        v78.origin.CGFloat y = y;
        v78.size.CGFloat width = width;
        v78.size.CGFloat height = height;
        double MaxX = CGRectGetMaxX(v78);
        v79.origin.CGFloat x = x;
        v79.origin.CGFloat y = y;
        v79.size.CGFloat width = width;
        v79.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v79);
        v80.origin.CGFloat x = x;
        v80.origin.CGFloat y = y;
        v80.size.CGFloat width = width;
        v80.size.CGFloat height = height;
        double MaxY = CGRectGetMaxY(v80);
        double v28 = v63;
        double v30 = v64;
        if (vabdd_f64(MinX, v63) < 0.005) {
          double v28 = MinX;
        }
        if (vabdd_f64(MaxX, v64) < 0.005) {
          double v30 = MaxX;
        }
        if (vabdd_f64(MinY, v62) >= 0.005) {
          double v48 = v62;
        }
        else {
          double v48 = MinY;
        }
        if (vabdd_f64(MaxY, v61) >= 0.005) {
          double v49 = v61;
        }
        else {
          double v49 = MaxY;
        }
        if (vabdd_f64(MinY, v49) >= 0.005) {
          double v34 = v49;
        }
        else {
          double v34 = MinY;
        }
        if (vabdd_f64(MaxY, v48) >= 0.005) {
          double v32 = v48;
        }
        else {
          double v32 = MaxY;
        }
      }
      id v37 = [v35 countByEnumeratingWithState:&v65 objects:v70 count:16];
    }
    while (v37);
  }

  if (v30 - v28 < a12)
  {
    if (sub_100030FAC(a1, a2)) {
      double v28 = v30 - a12;
    }
    else {
      double v30 = a12 + v28;
    }
  }
  if (v34 - v32 < a13)
  {
    if (sub_100030FD4(a1, a2)) {
      double v32 = v34 - a13;
    }
    else {
      double v34 = a13 + v32;
    }
  }
  uint64_t v50 = 0;
  *(double *)v69 = v28;
  *(double *)&v69[1] = v32;
  *(double *)&v69[2] = v28;
  *(double *)&v69[3] = v34;
  *(double *)&v69[4] = v30;
  *(double *)&v69[5] = v34;
  __asm { FMOV            V1.2D, #1.0 }
  *(double *)&v69[6] = v30;
  *(double *)&v69[7] = v32;
  do
  {
    v56 = (double *)&v69[v50];
    float64x2x2_t v75 = vld2q_f64(v56);
    float64x2_t v57 = vmaxnmq_f64(v75.val[0], (float64x2_t)0);
    v76.val[0] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v57, _Q1), (int8x16_t)_Q1, (int8x16_t)v57);
    v75.val[0] = vmaxnmq_f64(v75.val[1], (float64x2_t)0);
    v76.val[1] = (float64x2_t)vbslq_s8((int8x16_t)vcgtq_f64(v75.val[0], _Q1), (int8x16_t)_Q1, (int8x16_t)v75.val[0]);
    vst2q_f64(v56, v76);
    v50 += 4;
  }
  while (v50 != 8);
  UIRectMakeWithPoints();
  double v59 = v58;

  return v59;
}

double sub_10002F4C0(uint64_t a1, double a2, double a3, double a4, double a5)
{
  double result = 1.0;
  if (a2 > 0.0 && a3 > 0.0)
  {
    double result = a4 / a2;
    if (a1 != 1)
    {
      double v7 = a5 / a3;
      if (result >= v7) {
        return v7;
      }
    }
  }
  return result;
}

id sub_10002F4F4()
{
  return +[SSSCropOverlayGrabberView preferredOtherDimension];
}

double sub_10002F554()
{
  +[SSSCropOverlayCornerView preferredDimension];
  double v1 = v0;
  +[SSSCropOverlayGrabberView preferredOtherDimension];
  return v2 + v1 * 2.0;
}

uint64_t start(int a1, char **a2)
{
  getpid();
  memorystatus_control();
  double v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  double v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

id sub_10002FD4C(uint64_t a1)
{
  double v2 = *(void **)(*(void *)(a1 + 32) + 8);
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v11.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v11.c = v3;
  *(_OWORD *)&v11.tCGFloat x = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:&v11];
  double v4 = *(void **)(a1 + 32);
  double v5 = (void *)v4[1];
  [v4 bounds];
  [v5 setFrame:];
  id v6 = [*(id *)(a1 + 32) traitCollection];
  CGFloat v7 = 1.0 / sub_10000E1FC();

  memset(&v11, 0, sizeof(v11));
  CGAffineTransformMakeScale(&v11, v7, v7);
  double v8 = *(void **)(*(void *)(a1 + 32) + 8);
  CGAffineTransform v10 = v11;
  [v8 setTransform:&v10];
  [*(id *)(*(void *)(a1 + 32) + 8) frame];
  return [*(id *)(*(void *)(a1 + 32) + 8) setFrame:CGPointZero.x, CGPointZero.y];
}

void sub_1000300CC(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 appendPath:v2];
}

SSSActivityViewController *sub_1000309A4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, void *a7, void *a8)
{
  id v12 = a1;
  id v13 = v12;
  if (!v12 || a6)
  {
    id v15 = a8;
    id v16 = a7;
    uint64_t v14 = [[SSSActivityViewController alloc] initWithActivityItems:v15 applicationActivities:v16 editMode:a4];
  }
  else
  {
    uint64_t v14 = (SSSActivityViewController *)v12;
  }

  return v14;
}

BOOL sub_100030F9C(uint64_t a1, uint64_t a2)
{
  return (a2 | a1) == 0;
}

BOOL sub_100030FAC(uint64_t a1, uint64_t a2)
{
  return a1 == 2 || a2 == 1 || a2 == 4;
}

BOOL sub_100030FC0(uint64_t a1, uint64_t a2)
{
  return a1 == 8 || a2 == 2 || a2 == 8;
}

BOOL sub_100030FD4(uint64_t a1, uint64_t a2)
{
  return a1 == 1 || a2 == 1 || a2 == 2;
}

BOOL sub_100030FE8(uint64_t a1, uint64_t a2)
{
  return a1 == 4 || a2 == 4 || a2 == 8;
}

void sub_1000321B0(id a1)
{
  double v1 = objc_alloc_init(SSSStatisticsManager);
  uint64_t v2 = qword_1000B57A0;
  qword_1000B57A0 = (uint64_t)v1;

  _objc_release_x1(v1, v2);
}

id sub_100032294(uint64_t a1)
{
  v4[0] = @"screenshot_showing";
  v4[1] = @"triggerType";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &__kCFBooleanFalse;
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

id sub_1000323CC(uint64_t a1)
{
  v4[0] = @"screenshot_showing";
  v4[1] = @"triggerType";
  uint64_t v1 = *(void *)(a1 + 32);
  v5[0] = &__kCFBooleanTrue;
  v5[1] = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v5 forKeys:v4 count:2];

  return v2;
}

NSDictionary *__cdecl sub_1000324A4(id a1)
{
  CFStringRef v3 = @"reason";
  CFStringRef v4 = @"slidoffscreenduetotimer";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032540(id a1)
{
  CFStringRef v3 = @"reason";
  CFStringRef v4 = @"dragendedsuccessfully";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000325DC(id a1)
{
  CFStringRef v3 = @"reason";
  CFStringRef v4 = @"screenshot_showing";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032678(id a1)
{
  CFStringRef v3 = @"cropped";
  CFStringRef v4 = &__kCFBooleanTrue;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032718(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"normal";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000327B4(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"full_page";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032850(id a1)
{
  CFStringRef v3 = @"accidental_draw";
  CFStringRef v4 = &off_10009DE00;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

id sub_10003294C(uint64_t a1)
{
  CFStringRef v4 = @"stroke_count";
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  double v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

id sub_100032A74(uint64_t a1)
{
  CFStringRef v4 = @"annotation_count";
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  double v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_100032B3C(id a1)
{
  CFStringRef v3 = @"tapped";
  CFStringRef v4 = &__kCFBooleanTrue;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

id sub_100032C3C(uint64_t a1)
{
  CFStringRef v4 = @"annotation_count";
  uint64_t v1 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 32)];
  double v5 = v1;
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:&v5 forKeys:&v4 count:1];

  return v2;
}

NSDictionary *__cdecl sub_100032D04(id a1)
{
  CFStringRef v3 = @"tapped";
  CFStringRef v4 = &__kCFBooleanTrue;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032DA4(id a1)
{
  CFStringRef v3 = @"change_type";
  CFStringRef v4 = @"normal";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032E40(id a1)
{
  CFStringRef v3 = @"change_type";
  CFStringRef v4 = @"full_page";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032EDC(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_screen_single_screenshot";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100032F78(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_screen_multiple_screenshots";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033014(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_full_page_mixed_screenshots";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000330B0(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_full_page_screenshot_as_automatic_image";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_10003314C(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_full_page_screenshot_as_automatic_pdf";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000331E8(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_full_page_screenshot_as_image";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033284(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"share_full_page_screenshot_as_pdf";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033320(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"rename_screenshot";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000333BC(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"image_to_photos";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033458(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"image_to_files";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000334F4(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"image_to_quick_note";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033590(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"pdf_image_to_photos";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_10003362C(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"pdf_to_files";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_1000336C8(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"mixed_photos_and_files";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033764(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"mixed_quick_note_and_files";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033800(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"mixed_all_to_files";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_10003389C(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"delete";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

NSDictionary *__cdecl sub_100033938(id a1)
{
  CFStringRef v3 = @"type";
  CFStringRef v4 = @"copy_and_delete";
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:&v4 forKeys:&v3 count:1];

  return (NSDictionary *)v1;
}

void sub_100034074(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100034110;
  v5[3] = &unk_100099C98;
  void v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_100034110(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v5 = [*(id *)(a1 + 32) screenshot];
  uint64_t v2 = [v5 environmentDescription];
  id v3 = [v2 appleInternalOptions];
  id v4 = [v3 recapMovie];
  [v4 setScreenshot:v1];
}

void sub_100034198(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100034240;
  block[3] = &unk_10009A248;
  id v5 = *(id *)(a1 + 32);
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100034240(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  id v2 = (void *)qword_1000B57B8;
  uint64_t v14 = qword_1000B57B8;
  if (!qword_1000B57B8)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003519C;
    v10[3] = &unk_100099928;
    void v10[4] = &v11;
    sub_10003519C((uint64_t)v10);
    id v2 = (void *)v12[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v11, 8);
  id v4 = [[v3 alloc] initWithContentsOfURL:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 40) snapshots];
  [v4 setSnapshots:v5];

  id v6 = [*(id *)(a1 + 40) screenshot];
  [v4 setScreenshot:v6];

  uint64_t v7 = [*(id *)(a1 + 48) screenshot];
  double v8 = [v7 environmentDescription];
  uint64_t v9 = [v8 appleInternalOptions];
  [v9 setRecapMovie:v4];

  [*(id *)(a1 + 48) finishLoadingScreenshot];
}

void sub_1000343A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100034C3C(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 48) screenshot];
  [v1 tapToRadar:v2 screenshot:v3];
}

uint64_t sub_100035058()
{
  if (!qword_1000B57B0) {
    qword_1000B57B0 = _sl_dlopen();
  }
  return qword_1000B57B0;
}

uint64_t sub_100035128()
{
  uint64_t result = _sl_dlopen();
  qword_1000B57B0 = result;
  return result;
}

void sub_10003519C(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("RCPMovie");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10005F5FC();
    sub_1000351F4();
  }
}

void sub_1000351F4()
{
  if (!sub_100035058())
  {
    double v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class sub_100035244(uint64_t a1)
{
  sub_1000351F4();
  Class result = objc_getClass("RCPVizualizerView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005F624();
    return (Class)sub_10003529C(v3);
  }
  return result;
}

SSSScreenshotItemProviderPDFAsImage *sub_10003529C(uint64_t a1)
{
  sub_1000351F4();
  Class result = (SSSScreenshotItemProviderPDFAsImage *)objc_getClass("RCPTimelineView");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SSSScreenshotItemProviderPDFAsImage *)sub_10005F64C();
    return [(SSSScreenshotItemProviderPDFAsImage *)v3 initWithScreenshot:v5];
  }
  return result;
}

void sub_1000356A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100035808(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPLinkMetadata");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10005E998();
    sub_100035860();
  }
}

void sub_100035860()
{
  v1[0] = 0;
  if (!qword_1000B57D8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10003595C;
    v1[4] = &unk_100099960;
    v1[5] = v1;
    long long v2 = off_10009A918;
    uint64_t v3 = 0;
    qword_1000B57D8 = _sl_dlopen();
  }
  double v0 = (void *)v1[0];
  if (!qword_1000B57D8)
  {
    double v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10003595C()
{
  uint64_t result = _sl_dlopen();
  qword_1000B57D8 = result;
  return result;
}

Class sub_1000359D0(uint64_t a1)
{
  sub_100035860();
  Class result = objc_getClass("LPFileMetadata");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57E0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005E9C0();
    return (Class)sub_100035A28(v3);
  }
  return result;
}

void sub_100035A28(uint64_t a1)
{
  sub_100035860();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("LPImage");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57E8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    long long v2 = (_SSSPDFThumbnailView *)sub_10005E9E8();
    [(_SSSPDFThumbnailView *)v2 layoutSubviews];
  }
}

void sub_100036320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100036340(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v2 = WeakRetained;
    [WeakRetained _updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:WeakRetained[9]];
    [v2 _hideAndShowViewsForScreenshotEditsSnapshotted:v2[9]];
    id WeakRetained = v2;
  }
}

void sub_10003644C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v2 = WeakRetained;
    [WeakRetained setCachedViewsHidden:1];
    [v2[5] setHidden:0];
    id WeakRetained = v2;
  }
}

void sub_10003724C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100037564()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  double v0 = (void **)qword_1000B5808;
  uint64_t v8 = qword_1000B5808;
  if (!qword_1000B5808)
  {
    uint64_t v1 = (void *)sub_1000399D8();
    v6[3] = (uint64_t)dlsym(v1, "AKControllerDrawingGestureRecognizerNeedsDependencyUpdate");
    qword_1000B5808 = v6[3];
    double v0 = (void **)v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    SEL v4 = (_Unwind_Exception *)sub_10005F674();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  long long v2 = *v0;

  return v2;
}

void sub_1000379F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1000387A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_100039980(uint64_t a1)
{
  sub_1000399D8();
  Class result = objc_getClass("AKController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B57F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10005EA10();
    return (Class)sub_1000399D8();
  }
  return result;
}

uint64_t sub_1000399D8()
{
  v3[0] = 0;
  if (!qword_1000B57F8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100039AD8;
    void v3[4] = &unk_100099960;
    v3[5] = v3;
    long long v4 = off_10009A930;
    uint64_t v5 = 0;
    qword_1000B57F8 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000B57F8;
  uint64_t v1 = (void *)v3[0];
  if (!qword_1000B57F8)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100039AD8()
{
  uint64_t result = _sl_dlopen();
  qword_1000B57F8 = result;
  return result;
}

Class sub_100039B4C(uint64_t a1)
{
  sub_1000399D8();
  Class result = objc_getClass("AKPageModelController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5800 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005F698();
    return (Class)sub_100039BA4(v3);
  }
  return result;
}

void *sub_100039BA4(uint64_t a1)
{
  long long v2 = (void *)sub_1000399D8();
  Class result = dlsym(v2, "AKControllerDrawingGestureRecognizerNeedsDependencyUpdate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000B5808 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100039BF4(uint64_t a1)
{
  sub_1000399D8();
  Class result = objc_getClass("AKTextBoxAnnotation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5810 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005F6C0();
    return (Class)sub_100039C4C(v3);
  }
  return result;
}

void *sub_100039C4C(uint64_t a1)
{
  long long v2 = (void *)sub_1000399D8();
  Class result = dlsym(v2, "AKStatisticsDocumentTypeImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_1000B5818 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100039C9C(uint64_t a1)
{
  sub_1000399D8();
  Class result = objc_getClass("AKAnnotation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5820 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (SSSPassthroughView *)sub_10005F6E8();
    return (Class)[(SSSPassthroughView *)v3 hitTest:v6 withEvent:v5];
  }
  return result;
}

void sub_10003A858(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsPerformingFullscreenSetup:1];
  long long v2 = *(void **)(*(void *)(a1 + 32) + 8);
  NSAttributedStringKey v93 = NSForegroundColorAttributeName;
  uint64_t v3 = +[UIColor whiteColor];
  v94 = v3;
  SEL v4 = +[NSDictionary dictionaryWithObjects:&v94 forKeys:&v93 count:1];
  [v2 setTitleTextAttributes:v4];

  uint64_t v5 = objc_opt_new();
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v5;

  [*(id *)(*(void *)(a1 + 32) + 8) setDelegate:];
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v9 = objc_opt_new();
  [v8 setShadowImage:v9];

  [*(id *)(*(void *)(a1 + 32) + 8) setAccessibilityIdentifier:@"navigation-bar"];
  uint64_t v10 = +[UIBlurEffect effectWithStyle:1102];
  uint64_t v92 = v10;
  uint64_t v11 = +[NSArray arrayWithObjects:&v92 count:1];
  [*(id *)(*(void *)(a1 + 32) + 8) setBackgroundEffects:v11];

  id v12 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v10];
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 24);
  *(void *)(v13 + 24) = v12;

  id v15 = [*(id *)(*(void *)(a1 + 32) + 24) layer];
  [v15 setAllowsGroupOpacity:0];

  v88 = (void *)v10;
  id v16 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v10];
  uint64_t v17 = *(void *)(a1 + 32);
  id v18 = *(void **)(v17 + 88);
  *(void *)(v17 + 88) = v16;

  double v19 = [*(id *)(*(void *)(a1 + 32) + 88) layer];
  [v19 setAllowsGroupOpacity:0];

  uint64_t v20 = +[SSChromeHelper separatorView];
  uint64_t v21 = *(void *)(a1 + 32);
  long long v22 = *(void **)(v21 + 32);
  *(void *)(v21 + 32) = v20;

  [*(id *)(*(void *)(a1 + 32) + 8) addSubview:*(void *)(*(void *)(a1 + 32) + 32)];
  uint64_t v23 = +[SSChromeHelper separatorView];
  uint64_t v24 = *(void *)(a1 + 32);
  double v25 = *(void **)(v24 + 40);
  *(void *)(v24 + 40) = v23;

  double v26 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  [v26 addSubview:*(void *)(*(void *)(a1 + 32) + 40)];

  double v27 = objc_alloc_init(SSSScreenshotCountIndicator);
  uint64_t v28 = *(void *)(a1 + 32);
  double v29 = *(void **)(v28 + 112);
  *(void *)(v28 + 112) = v27;

  double v30 = +[UIImageSymbolConfiguration configurationWithScale:3];
  v90 = +[UIImage _systemImageNamed:@"info.circle.and.sparkles" withConfiguration:v30];

  double v31 = +[UIImageSymbolConfiguration configurationWithScale:3];
  uint64_t v32 = +[UIImage _systemImageNamed:@"info.circle.and.sparkles.fill" withConfiguration:v31];

  uint64_t v33 = +[UIButton buttonWithType:0];
  uint64_t v34 = *(void *)(a1 + 32);
  id v35 = *(void **)(v34 + 56);
  *(void *)(v34 + 56) = v33;

  [*(id *)(*(void *)(a1 + 32) + 56) setAccessibilityIdentifier:@"Screenshots-Visual-Search-Button"];
  [*(id *)(*(void *)(a1 + 32) + 56) setImage:v90 forState:0];
  v89 = (void *)v32;
  [*(id *)(*(void *)(a1 + 32) + 56) setImage:v32 forState:4];
  [*(id *)(*(void *)(a1 + 32) + 56) setImage:v32 forState:1];
  [*(id *)(*(void *)(a1 + 32) + 56) addTarget:*(void *)(a1 + 32) action:"analysisInfoButtonPressed:" forEvents:64];
  v87 = +[UIVibrancyEffect _effectForBlurEffect:v10 vibrancyStyle:102];
  id v36 = [objc_alloc((Class)UIVisualEffectView) initWithEffect:v87];
  [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v36 setUserInteractionEnabled:0];
  id v37 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  [v37 addSubview:v36];

  id v38 = objc_alloc_init((Class)UILabel);
  uint64_t v39 = *(void *)(a1 + 32);
  v40 = *(void **)(v39 + 48);
  *(void *)(v39 + 48) = v38;

  v41 = *(void **)(*(void *)(a1 + 32) + 48);
  v42 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  [v41 setFont:v42];

  [*(id *)(*(void *)(a1 + 32) + 48) setTextAlignment:1];
  [*(id *)(*(void *)(a1 + 32) + 48) setNumberOfLines:0];
  v43 = [v36 contentView];
  [v43 addSubview:*(void *)(*(void *)(a1 + 32) + 48)];

  v44 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  [v44 addSubview:*(void *)(*(void *)(a1 + 32) + 56)];
  [*(id *)(*(void *)(a1 + 32) + 56) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(*(void *)(a1 + 32) + 48) setTranslatesAutoresizingMaskIntoConstraints:0];
  [*(id *)(*(void *)(a1 + 32) + 48) setAdjustsFontForContentSizeCategory:1];
  [*(id *)(*(void *)(a1 + 32) + 48) setMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  [*(id *)(a1 + 32) bounds];
  double v46 = v45 + -32.0 + -64.0 + -16.0;
  v86 = [*(id *)(*(void *)(a1 + 32) + 56) leadingAnchor];
  v85 = [v44 leadingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85 constant:20.0];
  v91[0] = v84;
  v83 = [*(id *)(*(void *)(a1 + 32) + 56) topAnchor];
  v82 = [v44 topAnchor];
  v81 = [v83 constraintEqualToAnchor:v82 constant:20.0];
  v91[1] = v81;
  [*(id *)(*(void *)(a1 + 32) + 48) centerXAnchor];
  v80 = CGRect v79 = v44;
  CGRect v78 = [v44 centerXAnchor];
  CGRect v77 = [v80 constraintEqualToAnchor:v78];
  v91[2] = v77;
  float64x2x2_t v76 = [*(id *)(*(void *)(a1 + 32) + 48) centerYAnchor];
  float64x2x2_t v75 = [*(id *)(*(void *)(a1 + 32) + 56) centerYAnchor];
  double v74 = [v76 constraintGreaterThanOrEqualToAnchor:v75];
  v91[3] = v74;
  double v73 = [*(id *)(*(void *)(a1 + 32) + 48) widthAnchor];
  double v72 = [v73 constraintLessThanOrEqualToConstant:v46];
  v91[4] = v72;
  double v71 = [*(id *)(*(void *)(a1 + 32) + 48) topAnchor];
  v70 = [v44 topAnchor];
  long long v68 = [v71 constraintGreaterThanOrEqualToAnchor:v70];
  v91[5] = v68;
  long long v67 = [v36 contentView];
  long long v65 = [v67 topAnchor];
  long long v66 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  double v64 = [v66 topAnchor];
  double v63 = [v65 constraintEqualToAnchor:v64];
  v91[6] = v63;
  double v62 = [v36 contentView];
  v60 = [v62 leadingAnchor];
  double v61 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  double v59 = [v61 leadingAnchor];
  double v58 = [v60 constraintEqualToAnchor:v59];
  v91[7] = v58;
  v69 = v36;
  float64x2_t v57 = [v36 contentView];
  v56 = [v57 bottomAnchor];
  v47 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  double v48 = [v47 bottomAnchor];
  double v49 = [v56 constraintEqualToAnchor:v48];
  v91[8] = v49;
  uint64_t v50 = [v36 contentView];
  v51 = [v50 trailingAnchor];
  v52 = [*(id *)(*(void *)(a1 + 32) + 24) contentView];
  v53 = [v52 trailingAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  v91[9] = v54;
  v55 = +[NSArray arrayWithObjects:v91 count:10];
  +[NSLayoutConstraint activateConstraints:v55];

  [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:0.0];
  [*(id *)(a1 + 32) _updateSubviewOrdering];
  [*(id *)(a1 + 32) setIsPerformingFullscreenSetup:0];
}

void sub_10003B470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10003B5F0(uint64_t a1, void *a2)
{
  return [a2 setInteractionMode:*(void *)(a1 + 32)];
}

void sub_10003BA28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10003BA70(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[7] setAlpha:*(double *)(a1 + 40)];
  [WeakRetained _updateInstructionLabelIfNecessaryAnimated:1];
}

id sub_10003DDE0(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) editMode] == (id)1 && [*(id *)(a1 + 32) state] == (id)1;
  uint64_t v3 = [*(id *)(a1 + 32) currentScreenshot];
  SEL v4 = [v3 pdfData];

  if (v4) {
    unsigned int v5 = v2;
  }
  else {
    unsigned int v5 = 0;
  }
  double v6 = (double)v5;
  [*(id *)(*(void *)(a1 + 32) + 136) setAlpha:(double)v5];
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 88);

  return [v7 setAlpha:v6];
}

id sub_10004058C(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

id sub_100040594(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void sub_100040844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100040860(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    long long v3 = *(_OWORD *)(a1 + 56);
    WeakRetained[11] = *(_OWORD *)(a1 + 40);
    WeakRetained[12] = v3;
    SEL v4 = WeakRetained;
    [WeakRetained layoutIfNeeded];
    id WeakRetained = v4;
  }
}

Class sub_100041E24(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000B5830)
  {
    v4[1] = _NSConcreteStackBlock;
    void v4[2] = 3221225472;
    v4[3] = sub_100041F68;
    v4[4] = &unk_100099960;
    v4[5] = v4;
    long long v5 = off_10009A9B8;
    uint64_t v6 = 0;
    qword_1000B5830 = _sl_dlopen();
    BOOL v2 = (void *)v4[0];
    if (!qword_1000B5830)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("AKToolbarView");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    BOOL v2 = (void *)sub_10005F710();
LABEL_8:
    free(v2);
  }
  qword_1000B5828 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100041F68()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5830 = result;
  return result;
}

void sub_1000422D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000422F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _relevantTraitsDidChange];
}

uint64_t sub_1000429DC(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) _screenshotsView];
  [v2 removeScreenshots:*(void *)(a1 + 40)];

  if (!*(void *)(a1 + 56))
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    void v5[2] = sub_100042AB0;
    v5[3] = &unk_100099A20;
    void v5[4] = *(void *)(a1 + 32);
    +[UIView performWithoutAnimation:v5];
    long long v3 = [*(id *)(a1 + 32) _screenshotsView];
    [v3 layoutIfNeeded];
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100042AB0(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBarButtonItemPositionsAnimated:0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 16) navigationBar];
  [v2 layoutIfNeeded];
}

uint64_t sub_100042B18(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _screenshotsView];
  [v2 setCurrentScreenshotCropHandlesFadedOut:0];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v3 = *(id *)(a1 + 40);
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) removeFromSuperview];
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(a1 + 32) _updateBarButtonItemPositionsAnimated:1];
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100042C44(uint64_t a1)
{
  if (*(void *)(a1 + 40) == 1)
  {
    id v2 = [*(id *)(a1 + 32) _screenshotsView];
    [v2 setState:0];
  }
  id v3 = [*(id *)(a1 + 32) _screenshotsView];
  [v3 setCurrentScreenshotCropHandlesFadedOut:1];

  id v4 = [*(id *)(a1 + 32) _screenshotsView];
  [v4 layoutIfNeeded];
}

uint64_t sub_100042CD8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100042CE8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_100042CF8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100043574(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1000435B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained becomeFirstResponder];
}

void sub_1000435F8(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained becomeFirstResponder];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _undoPushed];
}

void sub_100043658(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained becomeFirstResponder];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _redoPushed];
}

void sub_1000442BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

id sub_1000442E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _screenshotsView];
  id v3 = [v2 createUndoMenu];

  return v3;
}

void sub_100044F08(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    _[v3 _actuallyPresentShareFromBarButtonItem:v4];
  }
  else
  {
    id v5 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_10005F738(a1, v5);
    }

    uint64_t v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"SAVE_TO_PHOTOS_FAILURE_MESSAGE" value:@"Unable to save image to Photos." table:0];

    uint64_t v8 = +[NSBundle mainBundle];
    long long v9 = [v8 localizedStringForKey:@"OK" value:@"OK" table:0];

    long long v10 = +[UIAlertController alertControllerWithTitle:0 message:v7 preferredStyle:1];
    long long v11 = +[UIAlertAction actionWithTitle:v9 style:0 handler:0];
    [v10 addAction:v11];

    [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
  }
}

void sub_100045334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100045358(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained becomeFirstResponder];
  uint64_t v6 = [WeakRetained _screenshotsView];
  [v6 setNeedsLayout];

  if (WeakRetained)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100045524;
    v11[3] = &unk_10009AAA0;
    objc_copyWeak(&v12, v4);
    [WeakRetained[32] setDisplayLinkObserverHandler:v11];
    [WeakRetained[32] startObserver];
    objc_destroyWeak(&v12);
  }
  uint64_t v7 = [WeakRetained _screenshotsView];
  BOOL v8 = [v7 editMode] == (id)2;

  if (v8)
  {
    [WeakRetained _exitCrop];
    v3[2](v3, &__NSArray0__struct);
  }
  else
  {
    long long v9 = [WeakRetained _buildDoneMenuElements];
    uint64_t v13 = v9;
    long long v10 = +[NSArray arrayWithObjects:&v13 count:1];
    v3[2](v3, v10);
  }
}

void sub_100045504(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id sub_100045524(uint64_t a1)
{
  uint64_t v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained isShowingModalUI];

  if ((v3 & 1) == 0)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v5 = [v4 _screenshotsView];
    [v5 setNeedsLayout];
  }
  return v3;
}

void sub_1000462C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, id *a12, id *a13, id *a14, id *a15, id *a16, id *location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(location);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)&STACK[0x2B0]);
  _Unwind_Resume(a1);
}

void sub_100046440(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v5 = WeakRetained;
    [WeakRetained commitInflightEditsIfNecessary];
    if (v3)
    {
      [v5 _dismissWithDeleteOptions:1];
      id v4 = +[SSSStatisticsManager sharedStatisticsManager];
      [v4 didSaveImageToPhotos];
    }
    else
    {
      [v5 _savePDFToPhotosPushed];
      [v5 _dismissWithDeleteOptions:2];
      id v4 = +[SSSStatisticsManager sharedStatisticsManager];
      [v4 didSavePDFImageToPhotos];
    }

    id WeakRetained = v5;
  }
}

void sub_1000464F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    uint64_t v6 = WeakRetained;
    [WeakRetained _saveToFilesPushed:savePDF:];
    int v3 = *(unsigned __int8 *)(a1 + 40);
    id v4 = +[SSSStatisticsManager sharedStatisticsManager];
    id v5 = v4;
    if (v3) {
      [v4 didSaveImageToFiles];
    }
    else {
      [v4 didSaveFullPagePDFToFiles];
    }

    id WeakRetained = v6;
  }
}

void sub_100046588(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    int v3 = WeakRetained;
    [WeakRetained _saveToQuickNotePushed:1 savePDF:0];
    uint64_t v2 = +[SSSStatisticsManager sharedStatisticsManager];
    [v2 didSaveImageToQuickNote];

    id WeakRetained = v3;
  }
}

void sub_100046608(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 1;
    int v3 = WeakRetained;
    [WeakRetained _saveToFilesPushed:0 savePDF:1];
    uint64_t v2 = +[SSSStatisticsManager sharedStatisticsManager];
    [v2 didSaveMixedToPhotosAndFiles];

    id WeakRetained = v3;
  }
}

void sub_100046688(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    int v3 = WeakRetained;
    [WeakRetained _saveToQuickNotePushed:1 savePDF:1];
    uint64_t v2 = +[SSSStatisticsManager sharedStatisticsManager];
    [v2 didSaveMixedToQuickNoteAndFiles];

    id WeakRetained = v3;
  }
}

void sub_100046708(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[25] = 2;
    int v3 = WeakRetained;
    [WeakRetained _saveToFilesPushed:1 savePDF:1];
    uint64_t v2 = +[SSSStatisticsManager sharedStatisticsManager];
    [v2 didSaveMixedAllToFiles];

    id WeakRetained = v3;
  }
}

void sub_100046788(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _exportVellumPDF];
}

void sub_1000467C8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendToDeveloper];
}

void sub_100046808(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    int v3 = [v5 visibleScreenshots];
    [v2 screenshotsViewController:v5 requestsCopyDeleteForScreenshots:v3 deleteOptions:2 forReason:1];

    id v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didCopyDeleteScreenshots];

    id WeakRetained = v5;
  }
}

void sub_1000468A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    uint64_t v2 = [WeakRetained delegate];
    int v3 = [v5 visibleScreenshots];
    [v2 screenshotsViewController:v5 requestsDeleteForScreenshots:v3 deleteOptions:2 forReason:0];

    id v4 = +[SSSStatisticsManager sharedStatisticsManager];
    [v4 didDeleteScreenshots];

    id WeakRetained = v5;
  }
}

void sub_100046DB0(uint64_t a1, void *a2)
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100046EB8;
  v8[3] = &unk_10009AB40;
  void v8[4] = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 enumerateObjectsUsingBlock:v8];
  id v4 = [v3 mutableCopy];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 216);
  *(void *)(v5 + 216) = v4;

  [*(id *)(*(void *)(a1 + 32) + 216) removeObjectsInArray:*(void *)(*(void *)(a1 + 32) + 208)];
  id v7 = [objc_alloc((Class)UIDocumentPickerViewController) initForExportingURLs:v3 asCopy:1];

  [v7 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void sub_100046EB8(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 startAccessingSecurityScopedResource])
  {
    id v3 = *(void **)(*(void *)(a1 + 32) + 208);
    if (v3)
    {
      [v3 addObject:v7];
    }
    else
    {
      uint64_t v4 = +[NSMutableArray arrayWithObject:v7];
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = *(void **)(v5 + 208);
      *(void *)(v5 + 208) = v4;
    }
  }
}

void sub_100046F4C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    id v3 = +[NSArray array];
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v5 = [v3 arrayByAddingObjectsFromArray:*(void *)(a1 + 32)];
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
}

void sub_100047070(id a1, NSURL *a2, unint64_t a3, BOOL *a4)
{
}

void sub_100047078(id a1, NSURL *a2, unint64_t a3, BOOL *a4)
{
  uint64_t v4 = a2;
  id v5 = +[NSFileManager defaultManager];
  [v5 removeItemAtURL:v4 error:0];
}

void sub_10004730C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  if (v15) {
    objc_destroyWeak(v16);
  }
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100047334(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000473F4;
  v8[3] = &unk_10009AC18;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v9 = v3;
  uint64_t v10 = v5;
  void v8[4] = v6;
  id v7 = v3;
  [v4 dismissRequestedFromScreenshotsViewController:v6 completion:v8];
}

uint64_t sub_1000473F4(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v2 = [*(id *)(a1 + 32) visibleScreenshots];
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        BOOL v8 = +[SSSScreenshotManager sharedScreenshotManager];
        [v8 removeTemporaryScreenshotLocation:v7 deleteOptions:*(void *)(a1 + 48)];

        uint64_t v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  return sub_100026FC0(*(void *)(a1 + 40));
}

uint64_t sub_100047520(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100047534(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _saveImages:*(void *)(a1 + 32) toQuickNoteWithDismissalCompletionBlock:0];
}

void sub_1000477DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000477F4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10005F858(a1, v5, v6);
    }
  }
  if (a2)
  {
    uint64_t v7 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [*(id *)(a1 + 32) count];
      int v9 = 134217984;
      id v10 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%lu screenshots sent to Quick Note", (uint8_t *)&v9, 0xCu);
    }
  }
}

void sub_100047918(uint64_t a1, void *a2)
{
  id v3 = [a2 object];
  NSClassFromString(@"ICSystemPaperExtensionHostViewController");
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = os_log_create("com.apple.screenshotservices", "Screenshot");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Quick Note UI dismissed", v6, 2u);
    }

    sub_100026FC0(*(void *)(a1 + 32));
  }
}

void sub_1000480DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100048118(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41))
  {
    uint64_t v2 = [*(id *)(a1 + 32) currentScreenshot];

    if (v2)
    {
      id v3 = [*(id *)(a1 + 32) delegate];
      id v4 = *(void **)(a1 + 32);
      id v5 = [v4 currentScreenshot];
      long long v12 = v5;
      uint64_t v6 = +[NSArray arrayWithObjects:&v12 count:1];
      [v3 screenshotsViewController:v4 requestsDeleteForScreenshots:v6 deleteOptions:2 forReason:0];
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _currentScreenshotView];
    id v8 = [v7 _internalPDFView];
    id v11 = [v8 currentPage];

    int v9 = [*(id *)(a1 + 32) currentScreenshot];
    [v9 deletePDFPage:v11];

    id v10 = [*(id *)(a1 + 32) _screenshotsView];
    [v10 setNeedsLayout];
  }
}

void sub_1000482A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained becomeFirstResponder];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v3 = [v4 _screenshotsView];
    [v3 setNeedsLayout];

    id WeakRetained = v4;
  }
}

void sub_100048320(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = (void *)WeakRetained[29];
    WeakRetained[29] = 0;
    id v4 = WeakRetained;

    [v4 becomeFirstResponder];
    id v3 = [v4 _screenshotsView];
    [v3 setNeedsLayout];

    id WeakRetained = v4;
  }
}

void sub_100048AAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100048AD4(uint64_t a1, uint64_t a2, char a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v5 = [WeakRetained _screenshotsView];
    [v5 setNeedsLayout];

    if ((a3 & 1) != 0
      || ([v8[20] presentingViewController], (id v6 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      id WeakRetained = v8;
      if (*((unsigned char *)v8 + 169)) {
        goto LABEL_7;
      }
      *((unsigned char *)v8 + 169) = 1;
      [v8 _cancelSharing:1 completion:0];
      uint64_t v7 = [v8 _screenshotsView];
      [v7 setIsSharing:0];

      [v8[20] setCompletionWithItemsHandler:0];
      id v6 = v8[20];
      v8[20] = 0;
    }

    id WeakRetained = v8;
  }
LABEL_7:
}

void sub_100048FEC(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateBarButtonItemPositionsAnimated:0];
  id v3 = [*(id *)(a1 + 32) _screenshotsView];
  uint64_t v2 = [v3 topBar];
  [v2 layoutIfNeeded];
}

void sub_100049058(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 160) _cancel];
  *(unsigned char *)(*(void *)(a1 + 32) + 169) = 0;
  uint64_t v2 = [*(id *)(a1 + 32) _screenshotsView];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 activityViewControllerDismissedFromScreenshotsViewController:*(void *)(a1 + 32)];
}

uint64_t sub_1000490E8(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

void sub_1000491FC(uint64_t a1, char a2)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 160) presentingViewController];
  id v6 = v4;
  if (!v4) {
    goto LABEL_4;
  }
  BOOL v5 = *(unsigned char *)(a1 + 48) != 0;
  if (a2)
  {
    [v4 dismissViewControllerAnimated:v5 completion:0];
LABEL_4:
    sub_100026FC0(*(void *)(a1 + 40));
    goto LABEL_6;
  }
  [v4 dismissViewControllerAnimated:v5 completion:*(void *)(a1 + 40)];
LABEL_6:
}

void sub_1000494D0(uint64_t a1, int a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 160) animated:1 completion:0];
    id v3 = [*(id *)(*(void *)(a1 + 32) + 160) popoverPresentationController];
    id v4 = [*(id *)(a1 + 32) _screenshotsView];
    [v4 screenshotsExtentRect];
    [v3 setSourceRect:];

    BOOL v5 = [*(id *)(*(void *)(a1 + 32) + 160) popoverPresentationController];
    id v6 = [*(id *)(a1 + 32) view];
    [v5 setSourceView:v6];

    id v14 = [*(id *)(*(void *)(a1 + 32) + 160) popoverPresentationController];
    [v14 setPermittedArrowDirections:2];
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.screenshotservices", "ShareSheet");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10005F738(a1, v7);
    }

    id v8 = +[NSBundle mainBundle];
    int v9 = [v8 localizedStringForKey:@"SAVE_TO_PHOTOS_FAILURE_MESSAGE" value:@"Unable to save image to Photos." table:0];

    id v10 = +[NSBundle mainBundle];
    id v11 = [v10 localizedStringForKey:@"OK" value:@"OK" table:0];

    long long v12 = +[UIAlertController alertControllerWithTitle:0 message:v9 preferredStyle:1];
    long long v13 = +[UIAlertAction actionWithTitle:v11 style:0 handler:0];
    [v12 addAction:v13];

    [*(id *)(a1 + 32) presentViewController:v12 animated:1 completion:0];
  }
}

id sub_1000499AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendToDeveloper];
}

void sub_100049B40(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  if (!v2)
  {
    uint64_t v18 = 0;
    double v19 = &v18;
    uint64_t v20 = 0x2050000000;
    id v3 = (void *)qword_1000B5850;
    uint64_t v21 = qword_1000B5850;
    if (!qword_1000B5850)
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10004C320;
      v17[3] = &unk_100099928;
      void v17[4] = &v18;
      sub_10004C320((uint64_t)v17);
      id v3 = (void *)v19[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v18, 8);
    id v5 = [[v4 alloc] initForContext:1 betaApplicationIdentifier:*(void *)(a1 + 40)];
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 184);
    *(void *)(v6 + 184) = v5;

    [*(id *)(*(void *)(a1 + 32) + 184) initiateFeedbackSnapshot];
    uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 184);
  }
  [v2 associateScreenshotImages:*(void *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 184) setDelegate:];
  uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 184) createFeedbackViewControllerForCurrentState];
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 176);
  *(void *)(v9 + 176) = v8;

  id v11 = +[NSBundle mainBundle];
  long long v12 = [v11 localizedStringForKey:@"BACK" value:@"Back" table:0];

  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithTitle:v12 style:0 target:*(void *)(a1 + 32) action:"dismissTFViewController"];
  id v14 = [*(id *)(*(void *)(a1 + 32) + 176) navigationItem];
  [v14 setLeftBarButtonItem:v13];

  uint64_t v15 = [*(id *)(a1 + 32) _screenshotsView];
  [v15 setIsSharing:1];

  id v16 = [objc_alloc((Class)UINavigationController) initWithRootViewController:*(void *)(*(void *)(a1 + 32) + 176)];
  [v16 setModalPresentationStyle:1];
  [*(id *)(a1 + 32) presentViewController:v16 animated:1 completion:0];
}

void sub_100049D74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100049E0C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _screenshotsView];
  [v2 setIsSharing:0];

  id v3 = [*(id *)(a1 + 32) _screenshotsView];
  [v3 setNeedsLayout];
}

void sub_100049F6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 dismissRequestedFromScreenshotsViewController:*(void *)(a1 + 32) completion:0];
}

id sub_10004A300(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:0];
}

id sub_10004A30C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:0];
}

void sub_10004A55C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _screenshotsView];
  [v2 setShowsShadow:*(unsigned __int8 *)(a1 + 40)];
}

void *sub_10004C104(uint64_t a1)
{
  id v2 = (void *)sub_10004C154();
  uint64_t result = dlsym(v2, "SYIsQuickNoteAvailable");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000B5838 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10004C154()
{
  v3[0] = 0;
  if (!qword_1000B5840)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10004C254;
    void v3[4] = &unk_100099960;
    v3[5] = v3;
    long long v4 = off_10009ADA0;
    uint64_t v5 = 0;
    qword_1000B5840 = _sl_dlopen();
  }
  uint64_t v0 = qword_1000B5840;
  uint64_t v1 = (void *)v3[0];
  if (!qword_1000B5840)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_10004C254()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5840 = result;
  return result;
}

Class sub_10004C2C8(uint64_t a1)
{
  sub_10004C154();
  Class result = objc_getClass("SYLinkContextClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000B5848 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10005F48C();
    return (Class)sub_10004C320(v3);
  }
  return result;
}

Class sub_10004C320(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_1000B5858)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_10004C464;
    void v3[4] = &unk_100099960;
    v3[5] = v3;
    long long v4 = off_10009ADB8;
    uint64_t v5 = 0;
    qword_1000B5858 = _sl_dlopen();
    if (!qword_1000B5858)
    {
      abort_report_np();
LABEL_8:
      sub_10005F918();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("TFFeedbackSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_1000B5850 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10004C464()
{
  uint64_t result = _sl_dlopen();
  qword_1000B5858 = result;
  return result;
}

__n128 sub_10004C7F4@<Q0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>)
{
  *(void *)(a1 + 32) = 0;
  *(void *)(a1 + 40) = 0;
  *(double *)a1 = a2;
  *(double *)(a1 + 8) = a3;
  __n128 result = *(__n128 *)a1;
  *(CGPoint *)(a1 + 16) = CGPointZero;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t sub_10004C814(uint64_t a1, uint64_t a2)
{
  BOOL v2 = *(double *)(a1 + 8) == *(double *)(a2 + 8) && *(double *)a1 == *(double *)a2;
  return v2 & CGRectEqualToRect(*(CGRect *)(a1 + 16), *(CGRect *)(a2 + 16));
}

double sub_10004C860(double *a1)
{
  return a1[2] / *a1;
}

id sub_10004C880(double a1, double a2, double a3, double a4)
{
  uint64_t v8 = +[NSMutableString string];
  [v8 appendFormat:@"<(%.1f,"];
  [v8 appendFormat:@"%.1f"], *(void *)&a2);
  [v8 appendFormat:@"@ %.1fx%.1f>"];

  return v8;
}

id sub_10004C924(CGSize *a1)
{
  BOOL v2 = +[NSMutableString stringWithString:@"<"];
  uint64_t v3 = sub_10004C880(a1[1].width, a1[1].height, a1[2].width, a1[2].height);
  long long v4 = +[NSString stringWithFormat:@"rect: %@ ", v3];
  [v2 appendString:v4];

  uint64_t v5 = NSStringFromCGSize(*a1);
  uint64_t v6 = +[NSString stringWithFormat:@"total size: %@", v5];
  [v2 appendString:v6];

  [v2 appendString:@">"];

  return v2;
}

uint64_t sub_10004CA5C(uint64_t a1, unint64_t a2)
{
  if (a2 <= 1) {
    uint64_t v2 = 1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (a1) {
    return 2;
  }
  else {
    return v2;
  }
}

BOOL sub_10004CA74(uint64_t a1)
{
  return a1 == 1;
}

id sub_10004D768(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) willSoonUnparentChildDittoRootViewController];
  if ((result & 1) == 0)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
    return _[v3 performProgrammaticDismiss];
  }
  return result;
}

uint64_t sub_10004DE08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10004DE4C@<X0>(uint64_t a1@<X8>)
{
  sub_10004DE08(&qword_1000B4F90);
  sub_10004F4BC(&qword_1000B5028, &qword_1000B4F90);
  dispatch thunk of Collection.startIndex.getter();
  dispatch thunk of Collection.endIndex.getter();
  if (v9[4] == v9[0])
  {
    uint64_t v2 = sub_10004DE08(&qword_1000B4F98);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(a1, 1, 1, v2);
  }
  else
  {
    long long v4 = (void (*)(void *, void))dispatch thunk of Collection.subscript.read();
    uint64_t v6 = v5;
    uint64_t v7 = sub_10004DE08(&qword_1000B4F98);
    uint64_t v8 = *(void *)(v7 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(a1, v6, v7);
    v4(v9, 0);
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
  }
}

uint64_t sub_10004DFE8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10004DE08(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10004E044()
{
  return Capsule.callAsFunction<A>(_:)();
}

uint64_t sub_10004E0A4(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v126 = a3;
  uint64_t v123 = a2;
  uint64_t v4 = *a1;
  uint64_t v122 = type metadata accessor for ShapeSecondaryProperties();
  uint64_t v111 = *(void *)(v122 - 8);
  __chkstk_darwin(v122);
  v109 = (char *)&v90 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v110 = (char *)&v90 - v7;
  uint64_t v106 = type metadata accessor for CanvasElementAutoresizeBehavior();
  __chkstk_darwin(v106);
  v107 = (char *)&v90 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10004DE08(&qword_1000B4FA8);
  __chkstk_darwin(v9 - 8);
  v105 = (char *)&v90 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10004DE08(&qword_1000B4FB0);
  __chkstk_darwin(v11 - 8);
  v118 = (char *)&v90 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  v104 = (char *)&v90 - v14;
  uint64_t v100 = type metadata accessor for Rectangle();
  __chkstk_darwin(v100);
  v99 = (char *)&v90 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10004DE08(&qword_1000B4FB8);
  uint64_t v120 = *(void *)(v16 - 8);
  uint64_t v121 = v16;
  __chkstk_darwin(v16);
  v116 = (char *)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  v119 = (char *)&v90 - v19;
  uint64_t v94 = type metadata accessor for CanvasElementFlags();
  uint64_t v95 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  NSAttributedStringKey v93 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  v112 = (char *)&v90 - v22;
  uint64_t v23 = sub_10004DE08(&qword_1000B4F88);
  __chkstk_darwin(v23 - 8);
  uint64_t v92 = (char *)&v90 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  v98 = (void (*)(uint64_t, uint64_t))((char *)&v90 - v26);
  uint64_t v125 = type metadata accessor for Shape();
  uint64_t v115 = *(void *)(v125 - 8);
  __chkstk_darwin(v125);
  v103 = (char *)&v90 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v28);
  v108 = (char *)&v90 - v29;
  __chkstk_darwin(v30);
  v97 = (char *)&v90 - v31;
  __chkstk_darwin(v32);
  v96 = (char *)&v90 - v33;
  uint64_t v34 = sub_10004DE08((uint64_t *)&unk_1000B5220);
  __chkstk_darwin(v34 - 8);
  id v36 = (char *)&v90 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_10004DE08(&qword_1000B4F90);
  uint64_t v38 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  v40 = (char *)&v90 - ((v39 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = *(void *)(v4 + class metadata base offset for Capsule.Ref);
  uint64_t v42 = *(void *)(v41 - 8);
  __chkstk_darwin(v43);
  double v45 = (char *)&v90 - v44;
  uint64_t v46 = sub_10004DE08(&qword_1000B4F98);
  uint64_t v124 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  v101 = (char *)&v90 - ((v47 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v48);
  uint64_t v50 = (char *)&v90 - v49;
  v114 = a1;
  Capsule.Ref<>.root.getter();
  dispatch thunk of ContainerCanvasElement.subelements.getter();
  v51 = *(void (**)(char *, uint64_t))(v42 + 8);
  uint64_t v117 = v41;
  v51(v45, v41);
  uint64_t v52 = v124;
  sub_10004DE4C((uint64_t)v36);
  uint64_t v53 = v46;
  v54 = *(void (**)(char *, uint64_t))(v38 + 8);
  uint64_t v102 = v37;
  v54(v40, v37);
  int v55 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v52 + 48))(v36, 1, v46);
  uint64_t v113 = v46;
  if (v55 == 1)
  {
    sub_10004DFE8((uint64_t)v36, (uint64_t *)&unk_1000B5220);
LABEL_9:
    Rectangle.init()();
    v98 = (void (*)(uint64_t, uint64_t))type metadata accessor for Ellipse();
    v97 = (char *)type metadata accessor for Line();
    v96 = (char *)type metadata accessor for BezierPath();
    uint64_t v95 = type metadata accessor for CalloutBubble();
    uint64_t v94 = type metadata accessor for RoundedRect();
    NSAttributedStringKey v93 = (char *)type metadata accessor for RegularPolygon();
    uint64_t v92 = (char *)type metadata accessor for Star();
    type metadata accessor for ArrowShape();
    sub_10004F474(&qword_1000B4FC0, (void (*)(uint64_t))&type metadata accessor for Rectangle);
    sub_10004F474(&qword_1000B4FC8, (void (*)(uint64_t))&type metadata accessor for Ellipse);
    sub_10004F474(&qword_1000B4FD0, (void (*)(uint64_t))&type metadata accessor for Line);
    sub_10004F474(&qword_1000B4FD8, (void (*)(uint64_t))&type metadata accessor for BezierPath);
    sub_10004F474(&qword_1000B4FE0, (void (*)(uint64_t))&type metadata accessor for CalloutBubble);
    sub_10004F474(&qword_1000B4FE8, (void (*)(uint64_t))&type metadata accessor for RoundedRect);
    sub_10004F474(&qword_1000B4FF0, (void (*)(uint64_t))&type metadata accessor for RegularPolygon);
    sub_10004F474(&qword_1000B4FF8, (void (*)(uint64_t))&type metadata accessor for Star);
    sub_10004F474(&qword_1000B5000, (void (*)(uint64_t))&type metadata accessor for ArrowShape);
    float64x2x2_t v76 = v119;
    TaggedValue_9.init(_:)();
    (*(void (**)(char *, char *, uint64_t))(v120 + 16))(v116, v76, v121);
    uint64_t v77 = type metadata accessor for Color();
    CGRect v78 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56);
    CGRect v79 = v104;
    v78(v104, 1, 1, v77);
    v78(v118, 1, 1, v77);
    uint64_t v80 = sub_10004DE08(&qword_1000B5008);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v80 - 8) + 56))(v105, 1, 1, v80);
    v128 = &_swiftEmptyArrayStorage;
    sub_10004F474(&qword_1000B5010, (void (*)(uint64_t))&type metadata accessor for CanvasElementAutoresizeBehavior);
    sub_10004DE08(&qword_1000B5018);
    sub_10004F4BC(&qword_1000B5020, &qword_1000B5018);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    v81 = v108;
    Shape.init(frame:type:strokeWidth:strokeColor:fillColor:text:textResizeBehavior:)();
    Color.init(red:green:blue:alpha:)();
    v78(v79, 0, 1, v77);
    Shape.fillColor.setter();
    uint64_t v82 = Shape.strokeWidth.setter();
    __chkstk_darwin(v82);
    swift_getKeyPath();
    Capsule.Ref<>.subscript.getter();
    swift_release();
    Shape.frame.setter();
    Shape.opacity.setter();
    v83 = v110;
    ShapeSecondaryProperties.init()();
    static CanvasElementFlags.readOnly.getter();
    ShapeSecondaryProperties.flags.setter();
    uint64_t v84 = v111;
    (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v109, v83, v122);
    Shape.secondaryProperties.setter();
    uint64_t v85 = v115;
    (*(void (**)(char *, char *, uint64_t))(v115 + 16))(v103, v81, v125);
    type metadata accessor for TaggedCanvasElement();
    sub_10004F474((unint64_t *)&unk_1000B55E0, (void (*)(uint64_t))&type metadata accessor for TaggedCanvasElement);
    swift_retain();
    v86 = v101;
    SharedTagged_9.init<A>(_:_:)();
    v87 = (void (*)(void **, void))Capsule.Ref<>.root.modify();
    v88 = (void (*)(char *, void))dispatch thunk of ContainerCanvasElement.subelements.modify();
    CROrderedSet.insert(_:at:)();
    (*(void (**)(char *, uint64_t))(v124 + 8))(v86, v113);
    v88(v127, 0);
    v87(&v128, 0);
    (*(void (**)(char *, uint64_t))(v84 + 8))(v83, v122);
    (*(void (**)(char *, uint64_t))(v85 + 8))(v81, v125);
    return (*(uint64_t (**)(char *, uint64_t))(v120 + 8))(v119, v121);
  }
  v56 = v97;
  float64x2_t v57 = v96;
  uint64_t v58 = v53;
  (*(void (**)(char *, char *, uint64_t))(v52 + 32))(v50, v36, v53);
  uint64_t v59 = (uint64_t)v98;
  SharedTagged_9<>.shape.getter();
  uint64_t v60 = sub_10004DE08(&qword_1000B4FA0);
  uint64_t v61 = *(void *)(v60 - 8);
  double v62 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v61 + 48);
  if (v62(v59, 1, v60) == 1)
  {
    sub_10004DFE8(v59, &qword_1000B4F88);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v50, v58);
    goto LABEL_9;
  }
  v90 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))v62;
  v91 = v50;
  Ref.subscript.getter();
  v98 = *(void (**)(uint64_t, uint64_t))(v61 + 8);
  v98(v59, v60);
  double v63 = v57;
  (*(void (**)(char *, char *, uint64_t))(v115 + 32))(v57, v56, v125);
  double v64 = v112;
  Shape.flags.getter();
  long long v65 = v93;
  static CanvasElementFlags.readOnly.getter();
  sub_10004F474(&qword_1000B5250, (void (*)(uint64_t))&type metadata accessor for CanvasElementFlags);
  uint64_t v66 = v94;
  char v67 = dispatch thunk of SetAlgebra.isSuperset(of:)();
  long long v68 = *(void (**)(char *, uint64_t))(v95 + 8);
  v68(v65, v66);
  v68(v64, v66);
  if ((v67 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t))(v115 + 8))(v57, v125);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v91, v113);
    goto LABEL_9;
  }
  uint64_t v69 = v125;
  uint64_t v70 = (uint64_t)v92;
  double v71 = v91;
  SharedTagged_9<>.shape.getter();
  int v72 = v90(v70, 1, v60);
  double v73 = v63;
  uint64_t v74 = v115;
  if (v72 == 1)
  {
    (*(void (**)(char *, uint64_t))(v115 + 8))(v63, v69);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v71, v113);
    return sub_10004DFE8(v70, &qword_1000B4F88);
  }
  else
  {
    v89 = (void (*)(void **, void))Ref.subscript.modify();
    Shape.opacity.setter();
    v89(&v128, 0);
    (*(void (**)(char *, uint64_t))(v74 + 8))(v73, v69);
    (*(void (**)(char *, uint64_t))(v124 + 8))(v71, v113);
    return ((uint64_t (*)(uint64_t, uint64_t))v98)(v70, v60);
  }
}

uint64_t sub_10004F35C(void *a1)
{
  return sub_10004E0A4(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10004F38C@<X0>(void *a1@<X8>)
{
  uint64_t result = dispatch thunk of ContainerCanvasElement.bounds.getter();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_10004F3CC()
{
  return dispatch thunk of ContainerCanvasElement.bounds.setter();
}

uint64_t sub_10004F40C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10004F454()
{
  return 24;
}

__n128 sub_10004F460(__n128 *a1, __n128 *a2)
{
  __n128 result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_10004F474(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004F4BC(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10004F40C(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10004F500(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 sub_10004F538(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_10004F544(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10004F564(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
}

__n128 sub_10004F5A4(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_10004F5B0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10004F5D0(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)__n128 result = (a2 - 1);
    *(void *)(result + 8) = 0;
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_10004F620(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_10004F670()
{
  uint64_t v1 = v0 + *(void *)(*(void *)v0 + 88);
  uint64_t v2 = type metadata accessor for Optional();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  uint64_t v3 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v4 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return _swift_deallocClassInstance(v0, v3, v4);
}

uint64_t sub_10004F734()
{
  uint64_t v0 = swift_allocObject();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(*(void *)(*(void *)v0 + 80) - 8) + 56))(v0 + *(void *)(*(void *)v0 + 88), 1, 1);
  return v0;
}

void sub_10004F958(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v5 = (void **)(a1 + *a4);
  swift_beginAccess();
  uint64_t v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
}

uint64_t sub_10004FA64(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10004FA78(a1, a2);
  }
  return a1;
}

uint64_t sub_10004FA78(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_retain();
  }

  return swift_retain();
}

uint64_t sub_10004FB64(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10004FB78(a1, a2);
  }
  return a1;
}

uint64_t sub_10004FB78(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2) {
      return result;
    }
    swift_release();
  }

  return swift_release();
}

void sub_10004FD04(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (double *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
  swift_beginAccess();
  double v5 = *v4;
  *uint64_t v4 = a1;
  if (v5 != a1)
  {
    uint64_t v6 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity;
    *(unsigned char *)(v2 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity) = 1;
    id v7 = (id *)(v2 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
    swift_beginAccess();
    if (*v7)
    {
      id v8 = *v7;
      dispatch thunk of PaperDocumentView.vellumOpacity.setter();
    }
    *(unsigned char *)(v2 + v6) = 0;
  }
}

uint64_t sub_10004FE4C()
{
  sub_10004DE08(&qword_1000B5090);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (char *)&v69 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for CRKeyPath();
  ((void (*)(void))__chkstk_darwin)();
  float64x2x2_t v76 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10004DE08(&qword_1000B5098);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  CGRect v78 = (char *)&v69 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v77 = v7;
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v69 - v8;
  uint64_t v10 = type metadata accessor for UUID();
  uint64_t v83 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v82 = (char *)&v69 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = type metadata accessor for URL();
  uint64_t v12 = *(void *)(v86 - 8);
  uint64_t v13 = __chkstk_darwin(v86);
  uint64_t v85 = (char *)&v69 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  v81 = (char *)&v69 - v16;
  __chkstk_darwin(v15);
  uint64_t v84 = (uint64_t)&v69 - v17;
  uint64_t v18 = sub_10004DE08(&qword_1000B50A0);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  uint64_t v21 = (char *)&v69 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v69 - v22;
  uint64_t v24 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot];
  swift_beginAccess();
  uint64_t v25 = *v24;
  if (*v24)
  {
    uint64_t v72 = v10;
    double v73 = v21;
    uint64_t v74 = v9;
    uint64_t v69 = v5;
    uint64_t v70 = v4;
    float64x2x2_t v75 = v2;
    id v26 = [v25 pdfData];
    uint64_t v27 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v29 = v28;

    CGRect v79 = v0;
    uint64_t v30 = (uint64_t *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData];
    swift_beginAccess();
    uint64_t v32 = *v30;
    unint64_t v31 = v30[1];
    sub_10004FA78(v27, v29);
    if (v31 >> 60 == 15)
    {
      sub_10004FB64(v27, v29);
      sub_10004FB64(v32, v31);
    }
    else
    {
      sub_10004FA64(v32, v31);
      char v35 = sub_100057C94(v27, v29, v32, v31);
      sub_10004FB64(v32, v31);
      sub_10004FB78(v27, v29);
      if (v35) {
        return sub_10004FB78(v27, v29);
      }
    }
    uint64_t v37 = *v30;
    unint64_t v38 = v30[1];
    *uint64_t v30 = v27;
    v30[1] = v29;
    sub_10004FA78(v27, v29);
    sub_10004FB64(v37, v38);
    uint64_t v39 = (void **)&v79[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument];
    swift_beginAccess();
    v40 = *v39;
    *uint64_t v39 = 0;

    uint64_t v41 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56);
    unint64_t v80 = v29;
    uint64_t v42 = (uint64_t)v23;
    uint64_t v43 = v23;
    uint64_t v44 = v86;
    double v71 = v41;
    v41((uint64_t)v43, 1, 1, v86);
    double v45 = NSTemporaryDirectory();
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v46 = v81;
    URL.init(fileURLWithPath:)();
    swift_bridgeObjectRelease();
    uint64_t v47 = v82;
    UUID.init()();
    UUID.uuidString.getter();
    (*(void (**)(char *, uint64_t))(v83 + 8))(v47, v72);
    uint64_t v48 = v84;
    URL.appendingPathComponent(_:)();
    swift_bridgeObjectRelease();
    v81 = *(char **)(v12 + 8);
    uint64_t v82 = (char *)(v12 + 8);
    ((void (*)(char *, uint64_t))v81)(v46, v44);
    uint64_t v83 = v27;
    Data.write(to:options:)();
    sub_10004DFE8(v42, &qword_1000B50A0);
    uint64_t v49 = *(void (**)(void))(v12 + 32);
    ((void (*)(uint64_t, uint64_t, uint64_t))v49)(v42, v48, v44);
    v71(v42, 0, 1, v44);
    uint64_t v50 = (uint64_t)v73;
    sub_100059E44(v42, (uint64_t)v73, &qword_1000B50A0);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(v50, 1, v44) == 1)
    {
      sub_10004DFE8(v42, &qword_1000B50A0);
      sub_10004FB78(v83, v80);
      return sub_10004DFE8(v50, &qword_1000B50A0);
    }
    else
    {
      v49();
      uint64_t v51 = static CRKeyPath.unique.getter();
      __chkstk_darwin(v51);
      uint64_t v84 = v42;
      uint64_t v52 = v79;
      type metadata accessor for PaperDocument();
      sub_1000580B4(&qword_1000B50A8, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
      uint64_t v53 = v74;
      Capsule<>.init(id:initClosure:)();
      uint64_t v54 = type metadata accessor for TaskPriority();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v54 - 8) + 56))(v75, 1, 1, v54);
      uint64_t v55 = v69;
      v56 = v78;
      uint64_t v57 = v70;
      (*(void (**)(char *, char *, uint64_t))(v69 + 16))(v78, v53, v70);
      type metadata accessor for MainActor();
      uint64_t v58 = v83;
      unint64_t v59 = v80;
      sub_10004FA78(v83, v80);
      id v60 = v52;
      uint64_t v61 = static MainActor.shared.getter();
      unint64_t v62 = (*(unsigned __int8 *)(v55 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v55 + 80);
      unint64_t v63 = (v77 + v62 + 7) & 0xFFFFFFFFFFFFFFF8;
      double v64 = (char *)swift_allocObject();
      *((void *)v64 + 2) = v61;
      *((void *)v64 + 3) = &protocol witness table for MainActor;
      *((void *)v64 + 4) = v60;
      (*(void (**)(char *, char *, uint64_t))(v55 + 32))(&v64[v62], v56, v57);
      long long v65 = (uint64_t *)&v64[v63];
      *long long v65 = v58;
      v65[1] = v59;
      sub_1000545D0((uint64_t)v75, (uint64_t)&unk_1000B50B8, (uint64_t)v64);
      swift_release();
      sub_10004FB78(v58, v59);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v74, v57);
      sub_10004DFE8(v84, &qword_1000B50A0);
      return ((uint64_t (*)(char *, uint64_t))v81)(v85, v86);
    }
  }
  else
  {
    uint64_t v33 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    swift_beginAccess();
    if (*v33)
    {
      [*v33 removeFromSuperview];
      id v34 = *v33;
    }
    else
    {
      id v34 = 0;
    }
    *uint64_t v33 = 0;

    uint64_t v66 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument];
    swift_beginAccess();
    char v67 = *v66;
    *uint64_t v66 = 0;

    long long v68 = &v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable];
    swift_beginAccess();
    *(void *)long long v68 = 0;
    return swift_release();
  }
}

void sub_100050904()
{
  uint64_t v1 = v0;
  uint64_t v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (*v2)
  {
    id v3 = *v2;
    uint64_t v4 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

    if (v4)
    {
      uint64_t v5 = &v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping];
      swift_beginAccess();
      if (*v5 == 1)
      {
        [v4 setMinScaleFactor:1.0];
        [v4 setMaxScaleFactor:1.0];
      }
      else
      {
        id v6 = [v4 currentPage];
        if (v6)
        {
          uint64_t v7 = v6;
          [v1 bounds];
          double v9 = v8;
          double v11 = fmax(v10 + -200.0, 200.0);
          [v7 boundsForBox:0];
          double v14 = sub_10002F4C0(1, v12, v13, v11, v9);
          sub_10002F4F4();
          double v16 = v15;
          [v4 setAutoScales:0];
          [v4 setMaxScaleFactor:v16];
          [v4 setMinScaleFactor:v14];

          uint64_t v4 = v7;
        }
      }
    }
  }
}

id sub_100050ABC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + *a3);
  swift_beginAccess();
  return *v3;
}

uint64_t sub_100050B60(double a1, double a2, double a3, double a4)
{
  uint64_t v9 = sub_10004DE08(&qword_1000B50D0);
  uint64_t v82 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  float64x2x2_t v75 = (char *)&v70 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v78 = sub_10004DE08(&qword_1000B50D8);
  uint64_t v77 = *(void *)(v78 - 8);
  __chkstk_darwin(v78);
  double v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v81 = sub_10004DE08(&qword_1000B5098);
  uint64_t v76 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  double v14 = (char *)&v70 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_10004DE08(&qword_1000B50E0);
  uint64_t v16 = ((uint64_t (*)(uint64_t))__chkstk_darwin)(v15 - 8);
  uint64_t v79 = (uint64_t)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  unint64_t v80 = (char *)&v70 - v18;
  uint64_t v19 = sub_10004DE08(&qword_1000B50E8);
  __chkstk_darwin(v19 - 8);
  uint64_t v21 = (char *)&v70 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_10004DE08(&qword_1000B50F0);
  uint64_t v84 = *(void *)(v22 - 8);
  uint64_t v85 = v22;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v70 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10004DE08(&qword_1000B50F8);
  __chkstk_darwin(v25 - 8);
  uint64_t v27 = (char *)&v70 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_10004DE08(&qword_1000B5100);
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  uint64_t v83 = (char *)&v70 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v74 = v4;
  unint64_t v31 = (id *)&v4[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  uint64_t result = swift_beginAccess();
  id v33 = *v31;
  if (*v31)
  {
    uint64_t v73 = v9;
    id v34 = v33;
    dispatch thunk of PaperDocumentView.currentPage.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28) == 1)
    {

      char v35 = &qword_1000B50F8;
      uint64_t v36 = (uint64_t)v27;
      return sub_10004DFE8(v36, v35);
    }
    id v72 = v34;
    uint64_t v37 = v83;
    (*(void (**)(char *, char *, uint64_t))(v29 + 32))(v83, v27, v28);
    WeakTagged_3<>.docPage.getter();
    uint64_t v39 = v84;
    uint64_t v38 = v85;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v84 + 48))(v21, 1, v85) == 1)
    {
      (*(void (**)(char *, uint64_t))(v29 + 8))(v37, v28);

      char v35 = &qword_1000B50E8;
      uint64_t v36 = (uint64_t)v21;
      return sub_10004DFE8(v36, v35);
    }
    uint64_t v71 = v29;
    (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v24, v21, v38);
    id v40 = v72;
    dispatch thunk of PaperDocumentView.paperDocument.getter();
    swift_getKeyPath();
    sub_1000580B4(&qword_1000B50A8, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
    uint64_t v41 = v81;
    Capsule<>.subscript.getter();
    swift_release();
    uint64_t v42 = (*(uint64_t (**)(char *, uint64_t))(v76 + 8))(v14, v41);
    __chkstk_darwin(v42);
    *(&v70 - 2) = (uint64_t)v24;
    uint64_t v43 = v24;
    uint64_t v44 = v80;
    sub_1000521CC((uint64_t (*)(char *))sub_100057FD0, (uint64_t)(&v70 - 4), v80);
    (*(void (**)(char *, uint64_t))(v77 + 8))(v12, v78);
    uint64_t v45 = v79;
    sub_100059E44((uint64_t)v44, v79, &qword_1000B50E0);
    uint64_t v46 = v82;
    uint64_t v47 = v73;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v82 + 48))(v45, 1, v73) == 1)
    {

      sub_10004DFE8((uint64_t)v44, &qword_1000B50E0);
      (*(void (**)(char *, uint64_t))(v71 + 8))(v83, v28);
      (*(void (**)(char *, uint64_t))(v84 + 8))(v43, v85);
      uint64_t v36 = v45;
      char v35 = &qword_1000B50E0;
      return sub_10004DFE8(v36, v35);
    }
    uint64_t v78 = (uint64_t)v43;
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v75, v45, v47);
    uint64_t v48 = v71;
    if (*v31)
    {
      id v49 = *v31;
      uint64_t v50 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v50)
      {
        id v51 = [v50 currentPage];
        if (v51)
        {
          uint64_t v52 = v51;
          [v51 boundsForBox:0];
          uint64_t v54 = v53;
          uint64_t v56 = v55;
          uint64_t v58 = v57;
          uint64_t v60 = v59;

LABEL_16:
          uint64_t v65 = swift_beginAccess();
          double v66 = __chkstk_darwin(v65);
          char v67 = v75;
          *(&v70 - 10) = (uint64_t)v75;
          *((double *)&v70 - 9) = a1;
          *((double *)&v70 - 8) = a2;
          *((double *)&v70 - 7) = a3;
          *((double *)&v70 - 6) = a4;
          *(&v70 - 5) = v54;
          *(&v70 - 4) = v56;
          *(&v70 - 3) = v58;
          *(&v70 - 2) = v60;
          *((double *)&v70 - 1) = v66;
          id v68 = v72;
          uint64_t v69 = (void (*)(char *, void))dispatch thunk of PaperDocumentView.paperDocument.modify();
          Capsule.callAsFunction<A>(_:)();
          v69(v86, 0);

          sub_10004DFE8((uint64_t)v80, &qword_1000B50E0);
          (*(void (**)(char *, uint64_t))(v48 + 8))(v83, v28);
          (*(void (**)(char *, uint64_t))(v82 + 8))(v67, v73);
          return (*(uint64_t (**)(uint64_t, uint64_t))(v84 + 8))(v78, v85);
        }
      }
    }
    [v74 bounds];
    uint64_t v54 = v61;
    uint64_t v56 = v62;
    uint64_t v58 = v63;
    uint64_t v60 = v64;
    goto LABEL_16;
  }
  return result;
}

double sub_100051530()
{
  uint64_t v1 = v0;
  sub_100051794((uint64_t)v25);
  sub_10005804C((uint64_t)v25, (uint64_t)v26);
  if ((v27 & 1) == 0)
  {
    double v4 = *(double *)v26;
    CGFloat v3 = *(double *)&v26[1];
    CGFloat v5 = *(double *)&v26[2];
    CGFloat v6 = *(double *)&v26[3];
    uint64_t v7 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    swift_beginAccess();
    if (*v7)
    {
      id v8 = *v7;
      uint64_t v9 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v9)
      {
        id v10 = [v9 currentPage];
        if (v10)
        {
          uint64_t v11 = v10;
          [v10 boundsForBox:0];
          double v13 = v12;
          CGFloat v15 = v14;
          CGFloat v17 = v16;
          CGFloat v19 = v18;

LABEL_9:
          v28.origin.CGFloat x = v4;
          v28.origin.CGFloat y = v3;
          v28.size.CGFloat width = v5;
          v28.size.CGFloat height = v6;
          CGRectGetWidth(v28);
          v29.origin.CGFloat x = v13;
          v29.origin.CGFloat y = v15;
          v29.size.CGFloat width = v17;
          v29.size.CGFloat height = v19;
          CGRectGetWidth(v29);
          v30.origin.CGFloat x = v4;
          v30.origin.CGFloat y = v3;
          v30.size.CGFloat width = v5;
          v30.size.CGFloat height = v6;
          CGRectGetHeight(v30);
          v31.origin.CGFloat x = v13;
          v31.origin.CGFloat y = v15;
          v31.size.CGFloat width = v17;
          v31.size.CGFloat height = v19;
          CGRectGetHeight(v31);
          v32.origin.CGFloat x = v13;
          v32.origin.CGFloat y = v15;
          v32.size.CGFloat width = v17;
          v32.size.CGFloat height = v19;
          double v2 = (v4 - v13) / CGRectGetWidth(v32);
          v33.origin.CGFloat x = v13;
          v33.origin.CGFloat y = v15;
          v33.size.CGFloat width = v17;
          v33.size.CGFloat height = v19;
          CGRectGetHeight(v33);
          return v2;
        }
      }
    }
    [v1 bounds];
    double v13 = v20;
    CGFloat v15 = v21;
    CGFloat v17 = v22;
    CGFloat v19 = v23;
    goto LABEL_9;
  }
  return 0.0;
}

uint64_t sub_100051794@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10004DE08(&qword_1000B5110);
  __chkstk_darwin(v3 - 8);
  CGFloat v5 = (char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DE08(&qword_1000B5118);
  __chkstk_darwin(v6 - 8);
  uint64_t v41 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004DE08(&qword_1000B5098);
  uint64_t v39 = *(void *)(v8 - 8);
  uint64_t v40 = v8;
  __chkstk_darwin(v8);
  uint64_t v43 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004DE08(&qword_1000B50E8);
  __chkstk_darwin(v10 - 8);
  double v12 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10004DE08(&qword_1000B50F0);
  uint64_t v44 = *(void *)(v13 - 8);
  __chkstk_darwin(v13);
  CGFloat v15 = (char *)&v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10004DE08(&qword_1000B50F8);
  __chkstk_darwin(v16 - 8);
  double v18 = (char *)&v37 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10004DE08(&qword_1000B5100);
  uint64_t v20 = *(void *)(v19 - 8);
  __chkstk_darwin(v19);
  double v22 = (char *)&v37 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v23 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  uint64_t result = swift_beginAccess();
  uint64_t v25 = *v23;
  long long v26 = 0uLL;
  if (*v23)
  {
    uint64_t v42 = a1;
    id v27 = v25;
    dispatch thunk of PaperDocumentView.currentPage.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
    {

      CGRect v28 = &qword_1000B50F8;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v20 + 32))(v22, v18, v19);
      WeakTagged_3<>.docPage.getter();
      uint64_t v32 = v44;
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v44 + 48))(v12, 1, v13) == 1)
      {
        (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);

        CGRect v28 = &qword_1000B50E8;
        uint64_t v29 = (uint64_t)v12;
        goto LABEL_10;
      }
      (*(void (**)(char *, char *, uint64_t))(v32 + 32))(v15, v12, v13);
      dispatch thunk of PaperDocumentView.paperDocument.getter();
      type metadata accessor for PaperDocument();
      sub_1000580B4(&qword_1000B5120, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
      WeakRef.subscript.getter();
      uint64_t v33 = type metadata accessor for PaperDocumentPage();
      uint64_t v34 = *(void *)(v33 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48))(v5, 1, v33) == 1)
      {

        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v13);
        (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
        CGRect v28 = &qword_1000B5110;
        uint64_t v29 = (uint64_t)v5;
        goto LABEL_10;
      }
      PaperDocumentPage.contentsBounds.getter();
      (*(void (**)(char *, uint64_t))(v34 + 8))(v5, v33);
      double v18 = v41;
      uint64_t v35 = sub_10004DE08(&qword_1000B5128);
      uint64_t v36 = *(void *)(v35 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v36 + 48))(v18, 1, v35) != 1)
      {
        TaggedValue_2<>.bounds.getter();
        long long v37 = v46;
        long long v38 = v45;
        char v30 = v47;

        (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
        (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v13);
        (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
        uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v36 + 8))(v18, v35);
        long long v31 = v37;
        long long v26 = v38;
        a1 = v42;
        goto LABEL_11;
      }

      (*(void (**)(char *, uint64_t))(v39 + 8))(v43, v40);
      (*(void (**)(char *, uint64_t))(v44 + 8))(v15, v13);
      (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
      CGRect v28 = &qword_1000B5118;
    }
    uint64_t v29 = (uint64_t)v18;
LABEL_10:
    uint64_t result = sub_10004DFE8(v29, v28);
    char v30 = 1;
    long long v31 = 0uLL;
    a1 = v42;
    long long v26 = 0uLL;
    goto LABEL_11;
  }
  char v30 = 1;
  long long v31 = 0uLL;
LABEL_11:
  *(_OWORD *)a1 = v26;
  *(_OWORD *)(a1 + 16) = v31;
  *(unsigned char *)(a1 + 32) = v30;
  return result;
}

double sub_100051E60()
{
  uint64_t v1 = v0;
  double v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (!*v2) {
    goto LABEL_6;
  }
  id v3 = *v2;
  uint64_t v4 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

  if (!v4) {
    goto LABEL_6;
  }
  id v5 = [v4 currentPage];
  if (!v5)
  {

LABEL_6:
    [v1 bounds];
    return v9;
  }
  uint64_t v6 = v5;
  [v5 boundsForBox:0];
  double v8 = v7;

  return v8;
}

uint64_t sub_100051F64()
{
  return PaperDocument.pages.getter();
}

uint64_t sub_100051F88(uint64_t a1)
{
  uint64_t v2 = sub_10004DE08(&qword_1000B50D8);
  double v3 = __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t, double))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  return PaperDocument.pages.setter();
}

uint64_t sub_100052054()
{
  uint64_t v0 = type metadata accessor for CRKeyPath();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)&v10 - v5;
  sub_10004DE08(&qword_1000B50D0);
  SharedTagged_3.identity.getter();
  sub_10004DE08(&qword_1000B50F0);
  sub_10004F4BC(&qword_1000B52A8, &qword_1000B50F0);
  Reference.identity.getter();
  char v7 = static CRKeyPath.== infix(_:_:)();
  double v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t sub_1000521CC@<X0>(uint64_t (*a1)(char *)@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  char v30 = a1;
  uint64_t v31 = a2;
  uint64_t v25 = a3;
  uint64_t v4 = sub_10004DE08(&qword_1000B50D0);
  uint64_t v27 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DE08(&qword_1000B50E0);
  __chkstk_darwin(v7 - 8);
  double v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004DE08(&qword_1000B50D8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10004DE08(&qword_1000B5248);
  uint64_t v26 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v33, v10);
  uint64_t v17 = v27;
  sub_10004F4BC(&qword_1000B5298, &qword_1000B50D8);
  dispatch thunk of Sequence.makeIterator()();
  uint64_t v18 = sub_10004F4BC(&qword_1000B52A0, &qword_1000B5248);
  uint64_t v32 = v16;
  uint64_t v33 = v14;
  uint64_t v28 = v18;
  dispatch thunk of IteratorProtocol.next()();
  uint64_t v19 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v17 + 48);
  if (v19(v9, 1, v4) == 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v33);
    uint64_t v22 = 1;
    double v23 = v25;
  }
  else
  {
    uint64_t v29 = *(void (**)(char *, char *, uint64_t))(v17 + 32);
    uint64_t v20 = (void (**)(char *, uint64_t))(v17 + 8);
    while (1)
    {
      v29(v6, v9, v4);
      char v21 = v30(v6);
      if (v3)
      {
        (*v20)(v6, v4);
        return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v32, v33);
      }
      if (v21) {
        break;
      }
      (*v20)(v6, v4);
      dispatch thunk of IteratorProtocol.next()();
      if (v19(v9, 1, v4) == 1) {
        goto LABEL_6;
      }
    }
    (*(void (**)(char *, uint64_t))(v26 + 8))(v32, v33);
    double v23 = v25;
    v29(v25, v6, v4);
    uint64_t v22 = 0;
  }
  return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v23, v22, 1, v4);
}

uint64_t sub_1000525FC(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  CGFloat v50 = a8;
  uint64_t v24 = sub_10004DE08(&qword_1000B5118);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (char *)&v48 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004DE08(&qword_1000B5238);
  __chkstk_darwin(v27 - 8);
  uint64_t v29 = (char *)&v48 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_10004DE08(&qword_1000B5240);
  uint64_t v31 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v33 = (char *)&v48 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  SharedTagged_3<>.docPage.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) == 1) {
    return sub_10004DFE8((uint64_t)v29, &qword_1000B5238);
  }
  double v49 = a9;
  (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v33, v29, v30);
  v53.origin.CGFloat x = a1;
  v53.origin.CGFloat y = a2;
  v53.size.CGFloat width = a3;
  v53.size.CGFloat height = a4;
  CGFloat Width = CGRectGetWidth(v53);
  CGFloat v48 = a4;
  double v36 = Width;
  v54.origin.CGFloat x = a5;
  v54.origin.CGFloat y = a6;
  CGFloat v37 = a7;
  v54.size.CGFloat width = a7;
  CGFloat v38 = v50;
  v54.size.CGFloat height = v50;
  double v51 = v36 * CGRectGetWidth(v54);
  v55.origin.CGFloat x = a1;
  v55.origin.CGFloat y = a2;
  v55.size.CGFloat width = a3;
  v55.size.CGFloat height = v48;
  double Height = CGRectGetHeight(v55);
  v56.origin.CGFloat x = a5;
  v56.origin.CGFloat y = a6;
  v56.size.CGFloat width = v37;
  v56.size.CGFloat height = v38;
  double v40 = Height * CGRectGetHeight(v56);
  v57.origin.CGFloat x = a5;
  v57.origin.CGFloat y = a6;
  v57.size.CGFloat width = v37;
  v57.size.CGFloat height = v38;
  CGFloat v41 = CGRectGetWidth(v57) * a1 + a5;
  v58.origin.CGFloat x = a5;
  v58.origin.CGFloat y = a6;
  v58.size.CGFloat width = v37;
  v58.size.CGFloat height = v38;
  CGFloat v42 = CGRectGetHeight(v58);
  *(CGFloat *)uint64_t v52 = v41;
  *(double *)&v52[1] = v42 * a2 + a6;
  *(double *)&v52[2] = v51;
  *(double *)&v52[3] = v40;
  type metadata accessor for CGRect(0);
  type metadata accessor for Quad();
  sub_1000580B4(&qword_1000B5270, type metadata accessor for CGRect);
  sub_1000580B4(&qword_1000B5278, (void (*)(uint64_t))&type metadata accessor for Quad);
  TaggedValue_2.init(_:)();
  uint64_t v43 = sub_10004DE08(&qword_1000B5128);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56))(v26, 0, 1, v43);
  uint64_t v44 = (void (*)(void *, void))Ref.subscript.modify();
  PaperDocumentPage.contentsBounds.setter();
  v44(v52, 0);
  long long v45 = (void (*)(void *, void))Ref.subscript.modify();
  double v46 = v49;
  PaperDocumentPage.bounds.setter();
  v45(v52, 0);
  if (v46 > 0.0)
  {
    char v47 = (void (*)(void *, void))Ref.subscript.modify();
    type metadata accessor for PaperDocumentPage();
    sub_1000580B4(&qword_1000B5290, (void (*)(uint64_t))&type metadata accessor for PaperDocumentPage);
    PaperPage<>.setVellum<A>(opacity:in:)();
    v47(v52, 0);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v31 + 8))(v33, v30);
}

double sub_100052AE8(void *a1, uint64_t a2, double (*a3)(void))
{
  id v4 = a1;
  double v5 = a3();

  return v5;
}

double sub_100052B90()
{
  uint64_t v1 = v0;
  uint64_t v2 = &v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping];
  swift_beginAccess();
  if (*v2 != 1)
  {
    id v10 = [v1 window];
    if (v10)
    {
      uint64_t v11 = v10;
      [v10 bounds];
      double v9 = v12;

      return v9;
    }
    uint64_t v13 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    swift_beginAccess();
    if (*v13)
    {
      id v14 = *v13;
      double v5 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

      if (v5)
      {
        id v6 = [v5 currentPage];
        if (v6) {
          goto LABEL_6;
        }
        goto LABEL_13;
      }
    }
LABEL_14:
    [v1 bounds];
    return v15;
  }
  sub_100051794((uint64_t)v17);
  sub_10005804C((uint64_t)v17, (uint64_t)v18);
  if ((v20 & 1) == 0) {
    return v19;
  }
  uint64_t v3 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (!*v3) {
    goto LABEL_14;
  }
  id v4 = *v3;
  double v5 = (void *)dispatch thunk of PaperDocumentView.pdfView.getter();

  if (!v5) {
    goto LABEL_14;
  }
  id v6 = [v5 currentPage];
  if (!v6)
  {
LABEL_13:

    goto LABEL_14;
  }
LABEL_6:
  uint64_t v7 = v6;
  [v6 boundsForBox:0];
  double v9 = v8;

  return v9;
}

void sub_100052E40(char a1)
{
  uint64_t v3 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (*v3)
  {
    id v4 = *v3;
    unsigned int v5 = [v4 isFirstResponder];
    if (a1)
    {
      if ((v5 & 1) == 0 && ([v4 _isAncestorOfFirstResponder] & 1) == 0) {
        [v4 becomeFirstResponder];
      }
      id v6 = [v1 traitCollection];
      id v7 = [v6 userInterfaceIdiom];

      if (!v7)
      {
        id v8 = [*(id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker] _contextualEditingView];
        if (v8)
        {
          double v9 = v8;
          [v8 setOverrideUserInterfaceStyle:2];
        }
      }
    }
    else if (v5)
    {
      [v4 resignFirstResponder];
    }
  }
}

void sub_100053054(char a1)
{
  uint64_t v3 = a1 & 1;
  uint64_t v4 = type metadata accessor for CanvasEditingMode();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  id v8 = &v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable];
  swift_beginAccess();
  int v9 = *v8;
  *id v8 = a1;
  if (v9 != v3)
  {
    [v1 setUserInteractionEnabled:v3];
    id v10 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
    swift_beginAccess();
    if (*v10)
    {
      char v11 = *v8;
      id v12 = *v10;
      uint64_t v13 = v12;
      if (v11)
      {
        static CanvasEditingMode.default.getter();
      }
      else
      {
        if (![v12 isFirstResponder])
        {
LABEL_8:

          return;
        }
        (*(void (**)(unsigned char *, void, uint64_t))(v5 + 104))(v7, enum case for CanvasEditingMode.readOnly(_:), v4);
      }
      dispatch thunk of PaperDocumentView.editingMode.setter();
      goto LABEL_8;
    }
  }
}

char *sub_1000531DC(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  *(void *)&v4[OBJC_IVAR____SSSScreenshotPaperKitPDFView_leftRightMargin] = 0x4059000000000000;
  uint64_t v11 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_context;
  type metadata accessor for CRContext();
  uint64_t v21 = 0;
  memset(v20, 0, sizeof(v20));
  id v12 = v4;
  uint64_t v13 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
  sub_10004DFE8((uint64_t)v20, &qword_1000B5038);
  *(void *)&v5[v11] = v13;
  v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument] = 0;
  uint64_t v14 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker;
  *(void *)&v12[v14] = [objc_allocWithZone((Class)PKToolPicker) init];
  *(_OWORD *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData] = xmmword_1000760C0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot] = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter] = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable] = 0;

  v19.receiver = v12;
  v19.super_class = ObjectType;
  double v15 = (char *)objc_msgSendSuper2(&v19, "initWithFrame:", a1, a2, a3, a4);
  [v15 setUserInteractionEnabled:0];
  uint64_t v16 = *(void **)&v15[OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker];
  [v16 setColorUserInterfaceStyle:1];
  [v16 _setShowsHandwritingTool:0];
  id v17 = v16;
  [v17 addObserver:v15];

  return v15;
}

uint64_t sub_1000534B8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  id v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10004DE08(&qword_1000B5258);
  __chkstk_darwin();
  int v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  swift_retain();
  CRContext.assetManager.getter();
  PaperDocument.init<A>(url:in:assetManager:)();
  uint64_t v10 = type metadata accessor for PaperDocument();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v11 + 32))(a2, v9, v10);
  }
  PaperDocument.init()();
  return sub_10004DFE8((uint64_t)v9, &qword_1000B5258);
}

uint64_t sub_1000536A0@<X0>(uint64_t a1@<X8>)
{
  return sub_1000534B8(*(void *)(v1 + 16), a1);
}

uint64_t sub_1000536A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[20] = a6;
  v7[21] = a7;
  v7[18] = a4;
  v7[19] = a5;
  uint64_t v8 = type metadata accessor for CanvasEditingMode();
  v7[22] = v8;
  v7[23] = *(void *)(v8 - 8);
  v7[24] = swift_task_alloc();
  uint64_t v9 = sub_10004DE08(&qword_1000B5098);
  v7[25] = v9;
  v7[26] = *(void *)(v9 - 8);
  v7[27] = swift_task_alloc();
  type metadata accessor for MainActor();
  v7[28] = static MainActor.shared.getter();
  uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
  v7[29] = v11;
  v7[30] = v10;
  return _swift_task_switch(sub_100053800, v11, v10);
}

uint64_t sub_100053800()
{
  uint64_t v1 = v0[24];
  uint64_t v2 = v0[22];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[18];
  uint64_t v5 = *(void **)(v4 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_context);
  (*(void (**)(void, void, void))(v0[26] + 16))(v0[27], v0[19], v0[25]);
  (*(void (**)(uint64_t, void, uint64_t))(v3 + 104))(v1, enum case for CanvasEditingMode.readOnly(_:), v2);
  uint64_t v6 = *(void **)(v4 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker);
  objc_allocWithZone((Class)type metadata accessor for PaperDocumentView());
  id v7 = v5;
  id v8 = v6;
  uint64_t v9 = (void *)swift_task_alloc();
  v0[31] = v9;
  *uint64_t v9 = v0;
  v9[1] = sub_100053930;
  uint64_t v10 = v0[27];
  uint64_t v11 = v0[24];
  return PaperDocumentView.init(context:document:editingMode:toolPicker:)(v7, v10, v11, v6);
}

uint64_t sub_100053930(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 256) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 240);
  uint64_t v4 = *(void *)(v2 + 232);
  return _swift_task_switch(sub_100053A58, v4, v3);
}

uint64_t sub_100053A58()
{
  uint64_t v1 = (void *)v0[32];
  uint64_t v2 = (void *)v0[18];
  swift_release();
  id v3 = v1;
  [v2 bounds];
  [v3 setFrame:];

  id v4 = objc_allocWithZone((Class)UIColor);
  id v5 = v3;
  id v6 = [v4 initWithWhite:0.2 alpha:1.0];
  [v5 setBackgroundColor:v6];

  uint64_t result = dispatch thunk of PaperDocumentView.pdfView.getter();
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v8 = (void *)result;
  id v9 = [self clearColor];
  [v8 setBackgroundColor:v9];

  uint64_t result = dispatch thunk of PaperDocumentView.pdfView.getter();
  if (!result)
  {
LABEL_17:
    __break(1u);
    return result;
  }
  uint64_t v10 = (void *)result;
  uint64_t v11 = (void *)v0[32];
  id v12 = (void *)v0[18];
  [v12 bounds];
  [v10 setFrame:];

  uint64_t v13 = v12;
  dispatch thunk of PaperDocumentView.contentSnapshottingView.setter();
  dispatch thunk of PaperDocumentView.automaticallyAdjustScaleFactor.setter();
  [v11 setOverrideUserInterfaceStyle:1];
  id v14 = [v13 traitCollection];
  [v14 userInterfaceIdiom];

  dispatch thunk of PaperDocumentView.canEditVellumOpacity.setter();
  double v15 = (id *)&v13[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView];
  swift_beginAccess();
  id v16 = *v15;
  dispatch thunk of PaperDocumentView.rulerHostView.setter();
  dispatch thunk of PaperDocumentView.shouldDeselectElementsWhenToolPickerIsHidden.setter();
  id v17 = [v13 traitCollection];
  id v18 = [v17 userInterfaceIdiom];

  if (!v18)
  {
    objc_super v19 = (void *)dispatch thunk of PaperDocumentView.toolPicker.getter();
    if (v19)
    {
      char v20 = v19;
      [v19 _setWantsClearBackgroundColorInCompactSize:1];
    }
  }
  uint64_t v21 = (char *)v0[18];
  [v21 addSubview:v0[32]];
  uint64_t v22 = (id *)&v21[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView];
  swift_beginAccess();
  if (*v22)
  {
    [*v22 removeFromSuperview];
    id v23 = *v22;
  }
  else
  {
    id v23 = 0;
  }
  uint64_t v24 = (void *)v0[32];
  *uint64_t v22 = v24;
  id v25 = v24;

  id v26 = *v22;
  if (*v22)
  {
    swift_beginAccess();
    Strong = (void *)swift_unknownObjectWeakLoadStrong();
    id v28 = v26;
    if (Strong)
    {
      id v29 = [Strong _paperKitPDFViewOverlayViewController:v0[18]];
      swift_unknownObjectRelease();
    }
    dispatch thunk of PaperDocumentView.viewControllerForPresentingUI.setter();
  }
  uint64_t v30 = (void *)v0[32];
  uint64_t v32 = v0[20];
  unint64_t v31 = v0[21];
  uint64_t v33 = v0[18];
  uint64_t v34 = (uint64_t *)(v33 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess();
  uint64_t v35 = *v34;
  unint64_t v36 = v34[1];
  *uint64_t v34 = v32;
  v34[1] = v31;
  sub_10004FB64(v35, v36);
  sub_10004FA78(v32, v31);
  sub_100050904();
  v0[17] = dispatch thunk of PaperDocumentView.publisher.getter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10004DE08(&qword_1000B52B8);
  sub_10004F4BC((unint64_t *)&unk_1000B52C0, &qword_1000B52B8);
  uint64_t v37 = Publisher<>.sink(receiveValue:)();

  swift_release();
  swift_release();
  CGFloat v38 = (uint64_t *)(v33 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable);
  swift_beginAccess();
  *CGFloat v38 = v37;
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v39 = (uint64_t (*)(void))v0[1];
  return v39();
}

uint64_t sub_100053F00()
{
  uint64_t v1 = sub_10004DE08(&qword_1000B5098);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  sub_10004FB78(*(void *)(v0 + v6), *(void *)(v0 + v6 + 8));

  return _swift_deallocObject(v0, v6 + 16, v5);
}

uint64_t sub_100053FF8()
{
  uint64_t v2 = *(void *)(sub_10004DE08(&qword_1000B5098) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  unint64_t v6 = (uint64_t *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = *v6;
  uint64_t v8 = v6[1];
  id v9 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v9;
  *id v9 = v1;
  v9[1] = sub_100054110;
  return sub_1000536A8((uint64_t)v9, v10, v11, v4, v5, v7, v8);
}

uint64_t sub_100054110()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void sub_100054204()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v9 = (char *)Strong;
    uint64_t v10 = (void **)(Strong + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
    swift_beginAccess();
    uint64_t v11 = *v10;
    *uint64_t v10 = 0;

    id v12 = &v9[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter];
    swift_beginAccess();
    if (*(void *)v12 == -1)
    {
      __break(1u);
    }
    else
    {
      ++*(void *)v12;
      if (v9[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity])
      {
      }
      else
      {
        sub_10005A090(0, (unint64_t *)&qword_1000B5630);
        uint64_t v19 = static OS_dispatch_queue.main.getter();
        uint64_t v13 = swift_allocObject();
        *(void *)(v13 + 16) = v9;
        aBlock[4] = sub_10005A104;
        aBlock[5] = v13;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10005458C;
        aBlock[3] = &unk_10009B238;
        id v14 = _Block_copy(aBlock);
        uint64_t v18 = v4;
        double v15 = v14;
        id v16 = v9;
        static DispatchQoS.unspecified.getter();
        char v20 = &_swiftEmptyArrayStorage;
        sub_1000580B4((unint64_t *)&unk_1000B52D0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10004DE08(&qword_1000B5640);
        sub_10004F4BC((unint64_t *)&unk_1000B52E0, &qword_1000B5640);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        id v17 = (void *)v19;
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v15);

        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v18);
        swift_release();
      }
    }
  }
}

uint64_t sub_10005458C(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_1000545D0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10004DFE8(a1, &qword_1000B5090);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

id sub_10005486C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_10004DE08(&qword_1000B5090);
  __chkstk_darwin(v6 - 8);
  uint64_t v61 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004DE08(&qword_1000B5098);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(void *)(v9 + 64);
  __chkstk_darwin(v8);
  uint64_t v60 = (char *)&v54 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v54 - v12;
  __chkstk_darwin(v14);
  id v16 = (char *)&v54 - v15;
  id v17 = (uint64_t *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData);
  swift_beginAccess();
  uint64_t v19 = *v17;
  unint64_t v18 = v17[1];
  sub_10004FA78(a1, a2);
  if (v18 >> 60 == 15)
  {
    sub_10004FB64(a1, a2);
    sub_10004FB64(v19, v18);
    return 0;
  }
  else
  {
    uint64_t v59 = v8;
    sub_10004FA64(v19, v18);
    char v21 = sub_100057C94(a1, a2, v19, v18);
    sub_10004FB64(v19, v18);
    sub_10004FB78(a1, a2);
    if ((v21 & 1) != 0
      && (uint64_t v22 = (id *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView), swift_beginAccess(), *v22))
    {
      id v23 = *v22;
      dispatch thunk of PaperDocumentView.paperDocument.getter();

      uint64_t v24 = v9;
      id v25 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
      uint64_t v26 = v59;
      v25(v16, v13, v59);
      uint64_t v27 = (id *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument);
      swift_beginAccess();
      id v20 = *v27;
      if (*v27)
      {
        id v28 = *(void (**)(char *, uint64_t))(v24 + 8);
        id v29 = v20;
        v28(v16, v26);
      }
      else
      {
        sub_10004DE08(&qword_1000B5148);
        uint64_t v31 = swift_allocObject();
        uint64_t v57 = v31;
        *(void *)(v31 + 16) = 0;
        CGRect v58 = (void **)(v31 + 16);
        dispatch_semaphore_t v55 = dispatch_semaphore_create(0);
        uint64_t v32 = v26;
        uint64_t v33 = (uint64_t *)(v3 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity);
        swift_beginAccess();
        uint64_t v34 = *v33;
        uint64_t v35 = v16;
        CGRect v56 = v16;
        uint64_t v36 = (uint64_t)v61;
        static TaskPriority.userInitiated.getter();
        uint64_t v37 = type metadata accessor for TaskPriority();
        (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v37 - 8) + 56))(v36, 0, 1, v37);
        CGFloat v38 = *(void (**)(char *, char *, uint64_t))(v24 + 16);
        CGRect v54 = (void (*)(unint64_t, char *, uint64_t))v25;
        uint64_t v39 = v60;
        v38(v60, v35, v32);
        unint64_t v40 = (*(unsigned __int8 *)(v24 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
        unint64_t v41 = (v10 + v40 + 7) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v42 = (v41 + 15) & 0xFFFFFFFFFFFFFFF8;
        unint64_t v43 = (v42 + 15) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v44 = swift_allocObject();
        *(void *)(v44 + 16) = 0;
        *(void *)(v44 + 24) = 0;
        long long v45 = v39;
        uint64_t v46 = v59;
        v54(v44 + v40, v45, v59);
        *(void *)(v44 + v41) = v34;
        *(void *)(v44 + v42) = v57;
        dispatch_semaphore_t v47 = v55;
        *(void *)(v44 + v43) = v55;
        swift_retain();
        CGFloat v48 = v47;
        sub_100054F80(v36, (uint64_t)&unk_1000B5158, v44);
        swift_release();
        sub_10004DFE8(v36, &qword_1000B5090);
        OS_dispatch_semaphore.wait()();

        (*(void (**)(char *, uint64_t))(v24 + 8))(v56, v46);
        double v49 = v58;
        swift_beginAccess();
        CGFloat v50 = *v49;
        id v51 = v50;
        swift_release();
        id v52 = *v27;
        *uint64_t v27 = v50;

        id v20 = *v27;
        id v53 = *v27;
      }
    }
    else
    {
      return 0;
    }
  }
  return v20;
}

uint64_t sub_100054D40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void v6[5] = a5;
  v6[6] = a6;
  uint64_t v9 = (uint64_t (__cdecl *)())((char *)&dword_1000B5168 + dword_1000B5168);
  uint64_t v7 = (void *)swift_task_alloc();
  v6[7] = v7;
  *uint64_t v7 = v6;
  v7[1] = sub_100054DE8;
  return v9();
}

uint64_t sub_100054DE8(uint64_t a1)
{
  *(void *)(*(void *)v1 + 64) = a1;
  swift_task_dealloc();
  return _swift_task_switch(sub_100054EE8, 0, 0);
}

uint64_t sub_100054EE8()
{
  uint64_t v1 = (void *)v0[8];
  uint64_t v2 = v0[5];
  swift_beginAccess();
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = v1;
  id v4 = v1;

  OS_dispatch_semaphore.signal()();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_100054F80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004DE08(&qword_1000B5090);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100059E44(a1, (uint64_t)v8, &qword_1000B5090);
  uint64_t v9 = type metadata accessor for TaskPriority();
  uint64_t v10 = *(void *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10004DFE8((uint64_t)v8, &qword_1000B5090);
    if (*(void *)(a3 + 16))
    {
LABEL_3:
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v11 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v13 = v12;
      swift_unknownObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v9);
    if (*(void *)(a3 + 16)) {
      goto LABEL_3;
    }
  }
  uint64_t v11 = 0;
  uint64_t v13 = 0;
LABEL_6:
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = a2;
  *(void *)(v14 + 24) = a3;
  if (v13 | v11)
  {
    v16[0] = 0;
    v16[1] = 0;
    v16[2] = v11;
    v16[3] = v13;
  }
  return swift_task_create();
}

id sub_1000551F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

uint64_t sub_1000552F0(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v125 = a3;
  id v128 = a2;
  uint64_t v4 = sub_10004DE08(&qword_1000B4F98);
  uint64_t v113 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v148 = (char *)&v102 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10004DE08((uint64_t *)&unk_1000B5220);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v102 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v124 = sub_10004DE08(&qword_1000B4F90);
  v149 = *(double **)(v124 - 8);
  __chkstk_darwin(v124);
  uint64_t v123 = (char *)&v102 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v151 = sub_10004DE08(&qword_1000B5230);
  double MinX = *(double *)(v151 - 8);
  __chkstk_darwin(v151);
  v150 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_10004DE08(&qword_1000B5260);
  v127 = *(char **)(v122 - 8);
  __chkstk_darwin(v122);
  uint64_t v111 = (char *)&v102 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_10004DE08(&qword_1000B5268);
  __chkstk_darwin(v12 - 8);
  uint64_t v121 = (char *)&v102 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for PKDrawingStruct();
  CGFloat v126 = *(double *)(v110 - 8);
  __chkstk_darwin(v110);
  v109 = (char *)&v102 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v108 = (char *)&v102 - v16;
  uint64_t v17 = sub_10004DE08(&qword_1000B5118);
  __chkstk_darwin(v17 - 8);
  uint64_t v120 = (char *)&v102 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v137 = type metadata accessor for PaperDocumentPage();
  v139 = *(void (***)(char *, uint64_t))(v137 - 8);
  __chkstk_darwin(v137);
  v119 = (char *)&v102 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  v118 = (char *)&v102 - v21;
  __chkstk_darwin(v22);
  v133 = (char *)&v102 - v23;
  uint64_t v24 = sub_10004DE08(&qword_1000B5238);
  __chkstk_darwin(v24 - 8);
  v134 = (char *)&v102 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v131 = sub_10004DE08(&qword_1000B5240);
  v129 = *(void (***)(char *, uint64_t))(v131 - 8);
  __chkstk_darwin(v131);
  v138 = (char *)&v102 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v27 = sub_10004DE08(&qword_1000B50D0);
  uint64_t v135 = *(void *)(v27 - 8);
  __chkstk_darwin(v27);
  v152 = (char *)&v102 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_10004DE08(&qword_1000B50E0);
  __chkstk_darwin(v29 - 8);
  uint64_t v31 = (char *)&v102 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_10004DE08(&qword_1000B50D8);
  uint64_t v33 = *(void *)(v32 - 8);
  __chkstk_darwin(v32);
  uint64_t v35 = (char *)&v102 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v146 = sub_10004DE08(&qword_1000B5248);
  uint64_t v117 = *(void *)(v146 - 8);
  __chkstk_darwin(v146);
  uint64_t v37 = (char *)&v102 - ((v36 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  uint64_t v107 = sub_1000580B4(&qword_1000B50A8, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
  uint64_t v153 = a1;
  Capsule.Ref<>.subscript.getter();
  uint64_t v38 = v135;
  swift_release();
  CROrderedSet.makeIterator()();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v35, v32);
  uint64_t v39 = v131;
  uint64_t v40 = (uint64_t)v134;
  v145 = v37;
  CROrderedSet.Iterator.next()();
  unint64_t v41 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
  uint64_t v144 = v38 + 48;
  v143 = v41;
  if (v41(v31, 1, v27) != 1)
  {
    uint64_t v44 = *(void (**)(char *, char *, uint64_t))(v38 + 32);
    uint64_t v43 = v38 + 32;
    v142 = v44;
    v141 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v129 + 6);
    v132 = (void (**)(char *, uint64_t, uint64_t))(v129 + 4);
    v136 = v139 + 1;
    ++v129;
    v139 = (void (**)(char *, uint64_t))(v43 - 24);
    v116 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v127 + 48);
    uint64_t v106 = (void (**)(char *, uint64_t, uint64_t))(v127 + 16);
    v105 = (void (**)(char *, uint64_t))(v127 + 8);
    v104 = (void (**)(char *, char *, uint64_t))(*(void *)&v126 + 32);
    v103 = (void (**)(char *, uint64_t))(*(void *)&v126 + 8);
    uint64_t v115 = (void (**)(char *, uint64_t))(v149 + 1);
    v114 = (uint64_t (**)(char *, uint64_t, uint64_t))(v113 + 48);
    v149 = (double *)(v113 + 32);
    v112 = (void (**)(char *, uint64_t))(*(void *)&MinX + 8);
    uint64_t v130 = v27;
    uint64_t v135 = v43;
    v140 = v31;
    v113 += 8;
    while (1)
    {
      long long v45 = v152;
      v142(v152, v31, v27);
      SharedTagged_3<>.docPage.getter();
      if ((*v141)(v40, 1, v39) != 1) {
        break;
      }
      (*v139)(v45, v27);
      sub_10004DFE8(v40, &qword_1000B5238);
LABEL_5:
      uint64_t v31 = v140;
      CROrderedSet.Iterator.next()();
      if (v143(v31, 1, v27) == 1) {
        return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v145, v146);
      }
    }
    uint64_t v46 = v138;
    (*v132)(v138, v40, v39);
    dispatch_semaphore_t v47 = v133;
    Ref.subscript.getter();
    uint64_t v48 = PaperDocumentPage.pageIndex.getter();
    char v50 = v49;
    id v51 = *v136;
    (*v136)(v47, v137);
    if (v50)
    {
      (*v129)(v46, v39);
      char v67 = *v139;
      id v68 = v152;
    }
    else
    {
      id v52 = (char *)[v128 pageAtIndex:v48];
      id v53 = v152;
      if (v52)
      {
        CGRect v54 = v52;
        [v52 boundsForBox:1];
        double v56 = v55;
        double v58 = v57;
        double v60 = v59;
        double v62 = v61;
        [v54 boundsForBox:0];
        CGFloat x = v156.origin.x;
        CGFloat y = v156.origin.y;
        CGFloat width = v156.size.width;
        CGFloat height = v156.size.height;
        v162.origin.CGFloat x = v56;
        v162.origin.CGFloat y = v58;
        v162.size.CGFloat width = v60;
        v162.size.CGFloat height = v62;
        if (!CGRectEqualToRect(v156, v162))
        {
          v127 = v54;
          [v54 setBounds:0 forBox:v56, v58, v60, v62];
          v157.origin.CGFloat x = x;
          v157.origin.CGFloat y = y;
          v157.size.CGFloat width = width;
          v157.size.CGFloat height = height;
          double MinX = CGRectGetMinX(v157);
          v158.origin.CGFloat x = v56;
          v158.size.CGFloat width = v60;
          CGFloat v69 = v56;
          v158.origin.CGFloat y = v58;
          CGFloat v70 = v62;
          CGFloat v71 = v158.size.width;
          v158.size.CGFloat height = v70;
          CGFloat v126 = MinX - CGRectGetMinX(v158);
          v159.origin.CGFloat x = v69;
          v159.origin.CGFloat y = v58;
          v159.size.CGFloat width = v71;
          v159.size.CGFloat height = v70;
          CGFloat MaxY = CGRectGetMaxY(v159);
          double MinX = v58;
          double v73 = MaxY;
          v160.origin.CGFloat x = x;
          v160.origin.CGFloat y = y;
          v160.size.CGFloat width = width;
          v160.size.CGFloat height = height;
          CGFloat v74 = CGRectGetMaxY(v160);
          CGAffineTransformMakeTranslation(&v154, v126, v73 - v74);
          CGAffineTransform v155 = v154;
          CGFloat v75 = MinX;
          v154.a = v69;
          v154.b = MinX;
          v154.c = v71;
          v154.d = v70;
          type metadata accessor for CGRect(0);
          type metadata accessor for Quad();
          sub_1000580B4(&qword_1000B5270, type metadata accessor for CGRect);
          sub_1000580B4(&qword_1000B5278, (void (*)(uint64_t))&type metadata accessor for Quad);
          uint64_t v76 = v120;
          TaggedValue_2.init(_:)();
          uint64_t v77 = sub_10004DE08(&qword_1000B5128);
          (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v77 - 8) + 56))(v76, 0, 1, v77);
          uint64_t v78 = (void (*)(CGAffineTransform *, void))Ref.subscript.modify();
          PaperDocumentPage.contentsBounds.setter();
          v78(&v154, 0);
          v161.origin.CGFloat x = v69;
          v161.origin.CGFloat y = v75;
          v161.size.CGFloat width = v71;
          v161.size.CGFloat height = v70;
          CGRectGetMinX(v161);
          uint64_t v79 = (void (*)(CGAffineTransform *, void))Ref.subscript.modify();
          PaperDocumentPage.bounds.setter();
          v79(&v154, 0);
          unint64_t v80 = v118;
          Ref.subscript.getter();
          uint64_t v81 = (uint64_t)v121;
          PaperDocumentPage.drawing.getter();
          uint64_t v82 = v51;
          v51(v80, v137);
          uint64_t v83 = v122;
          int v84 = (*v116)(v81, 1, v122);
          uint64_t v85 = v114;
          if (v84)
          {
            sub_10004DFE8(v81, &qword_1000B5268);
          }
          else
          {
            uint64_t v86 = v111;
            (*v106)(v111, v81, v83);
            sub_10004DFE8(v81, &qword_1000B5268);
            v87 = v109;
            Ref.subscript.getter();
            (*v105)(v86, v83);
            v88 = v108;
            v89 = v87;
            uint64_t v90 = v110;
            (*v104)(v108, v89, v110);
            PKDrawingStruct.apply<A>(_:concat:in:)();
            (*v103)(v88, v90);
          }
          v91 = v150;
          uint64_t v92 = v119;
          Ref.subscript.getter();
          NSAttributedStringKey v93 = v123;
          PaperDocumentPage.subelements.getter();
          v82(v92, v137);
          uint64_t v94 = v124;
          CROrderedSet.makeIterator()();
          (*v115)(v93, v94);
          CROrderedSet.Iterator.next()();
          uint64_t v95 = *v85;
          int v96 = (*v85)(v8, 1, v4);
          v97 = (void (**)(char *, uint64_t))v113;
          if (v96 != 1)
          {
            double MinX = *v149;
            do
            {
              v98 = v95;
              v99 = v148;
              (*(void (**)(char *, char *, uint64_t))&MinX)(v148, v8, v4);
              uint64_t v100 = (void (*)(CGAffineTransform *, void))SharedTagged_9.subscript.modify();
              sub_100059DF4(v101, *(void *)(v101 + 24));
              dispatch thunk of CanvasElement.apply(_:)();
              v100(&v154, 0);
              v91 = v150;
              (*v97)(v99, v4);
              CROrderedSet.Iterator.next()();
              uint64_t v95 = v98;
            }
            while (v98(v8, 1, v4) != 1);
          }

          (*v112)(v91, v151);
          uint64_t v39 = v131;
          (*v129)(v138, v131);
          uint64_t v27 = v130;
          (*v139)(v152, v130);
          *uint64_t v125 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v39 = v131;
      (*v129)(v138, v131);
      char v67 = *v139;
      id v68 = v53;
    }
    uint64_t v27 = v130;
    v67(v68, v130);
LABEL_14:
    uint64_t v40 = (uint64_t)v134;
    goto LABEL_5;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v117 + 8))(v145, v146);
}

uint64_t sub_10005661C@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10004DE08(&qword_1000B5258);
  double v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t, double))(v5 + 16))(v7, a1, v4, v9);
  swift_retain();
  CRContext.assetManager.getter();
  PaperDocument.init<A>(url:in:assetManager:)();
  uint64_t v12 = type metadata accessor for PaperDocument();
  uint64_t v13 = *(void *)(v12 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1) {
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 32))(a2, v11, v12);
  }
  PaperDocument.init()();
  return sub_10004DFE8((uint64_t)v11, &qword_1000B5258);
}

uint64_t sub_1000567F8(uint64_t a1)
{
  uint64_t v2 = sub_10004DE08((uint64_t *)&unk_1000B5210);
  __chkstk_darwin(v2 - 8);
  uint64_t v92 = (char *)v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v106 = type metadata accessor for CanvasElementFlags();
  uint64_t v104 = *(void *)(v106 - 8);
  __chkstk_darwin(v106);
  uint64_t v94 = (char *)v63 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  NSAttributedStringKey v93 = (char *)v63 - v6;
  __chkstk_darwin(v7);
  v97 = (char *)v63 - v8;
  __chkstk_darwin(v9);
  uint64_t v107 = (char *)v63 - v10;
  uint64_t v11 = sub_10004DE08(&qword_1000B4F98);
  uint64_t v100 = *(char **)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_10004DE08((uint64_t *)&unk_1000B5220);
  __chkstk_darwin(v14 - 8);
  uint64_t v95 = (char *)v63 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_10004DE08(&qword_1000B4F90);
  v105 = *(void (***)(char *, uint64_t))(v73 - 8);
  __chkstk_darwin(v73);
  id v72 = (char *)v63 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v71 = type metadata accessor for PaperDocumentPage();
  uint64_t v101 = *(char ***)(v71 - 8);
  __chkstk_darwin(v71);
  CGFloat v70 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v103 = sub_10004DE08(&qword_1000B5230);
  v98 = *(char **)(v103 - 8);
  __chkstk_darwin(v103);
  uint64_t v102 = (char *)v63 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10004DE08(&qword_1000B5238);
  __chkstk_darwin(v19 - 8);
  uint64_t v76 = (char *)v63 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10004DE08(&qword_1000B5240);
  uint64_t v78 = *(void (***)(char *, uint64_t))(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v82 = (char *)v63 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_10004DE08(&qword_1000B50D0);
  uint64_t v77 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  uint64_t v86 = (char *)v63 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = sub_10004DE08(&qword_1000B50E0);
  __chkstk_darwin(v23 - 8);
  uint64_t v25 = (char *)v63 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v26 = sub_10004DE08(&qword_1000B50D8);
  uint64_t v27 = *(void *)(v26 - 8);
  __chkstk_darwin(v26);
  uint64_t v29 = (char *)v63 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_10004DE08(&qword_1000B5248);
  v63[0] = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  uint64_t v31 = (char *)v63 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_1000580B4(&qword_1000B50A8, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
  v109[7] = a1;
  Capsule.Ref<>.subscript.getter();
  uint64_t v32 = (uint64_t)v76;
  swift_release();
  CROrderedSet.makeIterator()();
  uint64_t v33 = v29;
  uint64_t v34 = v77;
  uint64_t v35 = v26;
  uint64_t v36 = v74;
  (*(void (**)(char *, uint64_t))(v27 + 8))(v33, v35);
  uint64_t v37 = v75;
  CROrderedSet.Iterator.next()();
  uint64_t v38 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v34 + 48);
  uint64_t v84 = v34 + 48;
  uint64_t v83 = v38;
  if (v38(v25, 1, v36) != 1)
  {
    unint64_t v41 = *(void (**)(char *, char *, uint64_t))(v34 + 32);
    uint64_t v40 = v34 + 32;
    uint64_t v81 = v41;
    unint64_t v80 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v78 + 6);
    id v68 = (void (**)(char *, uint64_t, uint64_t))(v78 + 4);
    char v67 = (void (**)(char *, uint64_t))(v101 + 1);
    double v66 = v105 + 1;
    uint64_t v101 = (char **)(v100 + 48);
    v99 = (char **)(v100 + 32);
    v105 = (void (**)(char *, uint64_t))(v104 + 8);
    int v96 = (void (**)(char *, uint64_t))(v100 + 8);
    v89 = (void (**)(char *))(v104 + 16);
    v87 = (void (**)(char *, char *, uint64_t))(v104 + 32);
    v88 = (void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v104 + 56);
    uint64_t v65 = (void (**)(char *, uint64_t))(v98 + 8);
    uint64_t v64 = v78 + 1;
    uint64_t v78 = (void (**)(char *, uint64_t))(v40 - 24);
    uint64_t v91 = v11;
    uint64_t v90 = v13;
    uint64_t v77 = v40;
    uint64_t v79 = v25;
    CGFloat v69 = v31;
    do
    {
      unint64_t v42 = v86;
      v81(v86, v25, v36);
      SharedTagged_3<>.docPage.getter();
      if ((*v80)(v32, 1, v37) == 1)
      {
        (*v78)(v42, v36);
        sub_10004DFE8(v32, &qword_1000B5238);
        uint64_t v25 = v79;
      }
      else
      {
        (*v68)(v82, v32, v37);
        uint64_t v43 = v70;
        Ref.subscript.getter();
        uint64_t v44 = v72;
        PaperDocumentPage.subelements.getter();
        (*v67)(v43, v71);
        uint64_t v45 = v73;
        CROrderedSet.makeIterator()();
        (*v66)(v44, v45);
        uint64_t v46 = v95;
        CROrderedSet.Iterator.next()();
        uint64_t v100 = *v101;
        if (((unsigned int (*)(char *, uint64_t, uint64_t))v100)(v46, 1, v11) != 1)
        {
          v98 = *v99;
          ((void (*)(char *, char *, uint64_t))v98)(v13, v46, v11);
          while (1)
          {
            SharedTagged_9.subscript.getter();
            sub_100059D60(v109, v109[3]);
            uint64_t v49 = v11;
            char v50 = v107;
            dispatch thunk of CanvasElement.flags.getter();
            sub_100059DA4((uint64_t)v109);
            id v51 = v97;
            static CanvasElementFlags.useOriginalPDFAppearance.getter();
            uint64_t v52 = sub_1000580B4(&qword_1000B5250, (void (*)(uint64_t))&type metadata accessor for CanvasElementFlags);
            uint64_t v53 = v106;
            uint64_t v104 = v52;
            char v54 = dispatch thunk of SetAlgebra.isSuperset(of:)();
            double v55 = *v105;
            (*v105)(v51, v53);
            v55(v50, v53);
            if (v54)
            {
              double v56 = v55;
              double v57 = v93;
              static CanvasElementFlags.useOriginalPDFAppearance.getter();
              double v58 = (void (*)(void *, void))SharedTagged_9.subscript.modify();
              sub_100059DF4(v59, *(void *)(v59 + 24));
              double v60 = (void (*)(char *, void))dispatch thunk of CanvasElement.flags.modify();
              uint64_t v61 = v106;
              (*v89)(v107);
              double v62 = v94;
              dispatch thunk of SetAlgebra.intersection(_:)();
              if (dispatch thunk of SetAlgebra.isEmpty.getter())
              {
                v56(v62, v61);
                uint64_t v48 = 1;
                uint64_t v47 = (uint64_t)v92;
              }
              else
              {
                dispatch thunk of SetAlgebra.subtract(_:)();
                uint64_t v47 = (uint64_t)v92;
                (*v87)(v92, v62, v61);
                uint64_t v48 = 0;
              }
              (*v88)(v47, v48, 1, v61);
              v56(v57, v61);
              sub_10004DFE8(v47, (uint64_t *)&unk_1000B5210);
              v60(v108, 0);
              v58(v109, 0);
              uint64_t v49 = v91;
              uint64_t v13 = v90;
              uint64_t v46 = v95;
            }
            (*v96)(v13, v49);
            CROrderedSet.Iterator.next()();
            uint64_t v11 = v49;
            if (((unsigned int (*)(char *, uint64_t, uint64_t))v100)(v46, 1, v49) == 1) {
              break;
            }
            ((void (*)(char *, char *, uint64_t))v98)(v13, v46, v49);
          }
        }
        (*v65)(v102, v103);
        uint64_t v37 = v75;
        (*v64)(v82, v75);
        uint64_t v36 = v74;
        (*v78)(v86, v74);
        uint64_t v32 = (uint64_t)v76;
        uint64_t v25 = v79;
        uint64_t v31 = v69;
      }
      CROrderedSet.Iterator.next()();
    }
    while (v83(v25, 1, v36) != 1);
  }
  return (*(uint64_t (**)(char *, uint64_t))(v63[0] + 8))(v31, v85);
}

uint64_t sub_1000576BC@<X0>(uint64_t __s1@<X0>, uint64_t a2@<X2>, unint64_t a3@<X3>, char *a4@<X8>)
{
  uint64_t v7 = (const void *)__s1;
  switch(a3 >> 62)
  {
    case 1uLL:
      uint64_t v9 = (a2 >> 32) - (int)a2;
      if (a2 >> 32 < (int)a2)
      {
        __break(1u);
LABEL_31:
        __break(1u);
LABEL_32:
        __break(1u);
        goto LABEL_33;
      }
      sub_10004FA78(a2, a3);
      uint64_t v10 = (char *)__DataStorage._bytes.getter();
      if (!v10) {
        goto LABEL_8;
      }
      uint64_t v11 = __DataStorage._offset.getter();
      if (__OFSUB__((int)a2, v11)) {
LABEL_33:
      }
        __break(1u);
      v10 += (int)a2 - v11;
LABEL_8:
      uint64_t v12 = __DataStorage._length.getter();
      if (v12 >= v9) {
        size_t v13 = (a2 >> 32) - (int)a2;
      }
      else {
        size_t v13 = v12;
      }
      if (!v7)
      {
LABEL_35:
        __break(1u);
LABEL_36:
        __break(1u);
LABEL_37:
        __break(1u);
LABEL_38:
        __break(1u);
LABEL_39:
        __break(1u);
        JUMPOUT(0x100057920);
      }
      if (!v10) {
        goto LABEL_36;
      }
      int v14 = memcmp(v7, v10, v13);
      __s1 = sub_10004FB78(a2, a3);
      BOOL v8 = v14 == 0;
LABEL_24:
      char v24 = v8;
LABEL_29:
      *a4 = v24;
      return __s1;
    case 2uLL:
      uint64_t v15 = *(void *)(a2 + 16);
      uint64_t v16 = *(void *)(a2 + 24);
      swift_retain();
      swift_retain();
      uint64_t v17 = (char *)__DataStorage._bytes.getter();
      if (!v17) {
        goto LABEL_17;
      }
      uint64_t v18 = __DataStorage._offset.getter();
      if (__OFSUB__(v15, v18)) {
        goto LABEL_32;
      }
      v17 += v15 - v18;
LABEL_17:
      BOOL v19 = __OFSUB__(v16, v15);
      int64_t v20 = v16 - v15;
      if (v19) {
        goto LABEL_31;
      }
      uint64_t v21 = __DataStorage._length.getter();
      if (v21 >= v20) {
        size_t v22 = v20;
      }
      else {
        size_t v22 = v21;
      }
      if (!v7) {
        goto LABEL_37;
      }
      if (!v17) {
        goto LABEL_38;
      }
      int v23 = memcmp(v7, v17, v22);
      swift_release();
      __s1 = swift_release();
      BOOL v8 = v23 == 0;
      goto LABEL_24;
    case 3uLL:
      if (!__s1) {
        goto LABEL_39;
      }
      char v24 = 1;
      goto LABEL_29;
    default:
      uint64_t __s2 = a2;
      __int16 v26 = a3;
      char v27 = BYTE2(a3);
      char v28 = BYTE3(a3);
      char v29 = BYTE4(a3);
      char v30 = BYTE5(a3);
      if (__s1)
      {
        __s1 = memcmp((const void *)__s1, &__s2, BYTE6(a3));
        BOOL v8 = __s1 == 0;
        goto LABEL_24;
      }
      __break(1u);
      goto LABEL_35;
  }
}

uint64_t sub_100057930(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100057A0C;
  return v6(a1);
}

uint64_t sub_100057A0C()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100057B04(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t __s1 = a1;
  __int16 v9 = a2;
  char v10 = BYTE2(a2);
  char v11 = BYTE3(a2);
  char v12 = BYTE4(a2);
  char v13 = BYTE5(a2);
  sub_1000576BC((uint64_t)&__s1, a3, a4, &v7);
  if (!v4) {
    char v5 = v7;
  }
  return v5 & 1;
}

uint64_t sub_100057BDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  uint64_t result = __DataStorage._bytes.getter();
  uint64_t v11 = result;
  if (result)
  {
    uint64_t result = __DataStorage._offset.getter();
    if (__OFSUB__(a1, result))
    {
LABEL_9:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
    goto LABEL_9;
  }
  __DataStorage._length.getter();
  sub_1000576BC(v11, a4, a5, &v13);
  if (!v5) {
    char v12 = v13;
  }
  return v12 & 1;
}

uint64_t sub_100057C94(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v8 = 0;
  switch(a2 >> 62)
  {
    case 1uLL:
      LODWORD(v8) = HIDWORD(a1) - a1;
      if (__OFSUB__(HIDWORD(a1), a1))
      {
        __break(1u);
LABEL_26:
        __break(1u);
LABEL_27:
        __break(1u);
LABEL_28:
        __break(1u);
LABEL_29:
        __break(1u);
        JUMPOUT(0x100057EFCLL);
      }
      uint64_t v8 = (int)v8;
LABEL_6:
      switch(a4 >> 62)
      {
        case 1uLL:
          LODWORD(v12) = HIDWORD(a3) - a3;
          if (__OFSUB__(HIDWORD(a3), a3)) {
            goto LABEL_27;
          }
          uint64_t v12 = (int)v12;
LABEL_11:
          if (v8 == v12)
          {
            if (v8 < 1)
            {
              char v17 = 1;
            }
            else
            {
              switch(a2 >> 62)
              {
                case 1uLL:
                  if (a1 >> 32 < (int)a1) {
                    goto LABEL_29;
                  }
                  sub_10004FA78(a3, a4);
                  sub_10004FA78(a1, a2);
                  char v17 = sub_100057BDC((int)a1, a1 >> 32, a2 & 0x3FFFFFFFFFFFFFFFLL, a3, a4);
                  sub_10004FB78(a3, a4);
                  uint64_t v18 = a1;
                  unint64_t v19 = a2;
                  break;
                case 2uLL:
                  uint64_t v20 = a2 & 0x3FFFFFFFFFFFFFFFLL;
                  uint64_t v21 = *(void *)(a1 + 16);
                  uint64_t v22 = *(void *)(a1 + 24);
                  sub_10004FA78(a3, a4);
                  swift_retain();
                  swift_retain();
                  char v17 = sub_100057BDC(v21, v22, v20, a3, a4);
                  sub_10004FB78(a3, a4);
                  swift_release();
                  swift_release();
                  return v17 & 1;
                case 3uLL:
                  sub_10004FA78(a3, a4);
                  uint64_t v16 = 0;
                  uint64_t v15 = 0;
                  goto LABEL_22;
                default:
                  sub_10004FA78(a3, a4);
                  uint64_t v15 = a2 & 0xFFFFFFFFFFFFFFLL;
                  uint64_t v16 = a1;
LABEL_22:
                  char v17 = sub_100057B04(v16, v15, a3, a4);
                  uint64_t v18 = a3;
                  unint64_t v19 = a4;
                  break;
              }
              sub_10004FB78(v18, v19);
            }
          }
          else
          {
            char v17 = 0;
          }
          return v17 & 1;
        case 2uLL:
          uint64_t v14 = *(void *)(a3 + 16);
          uint64_t v13 = *(void *)(a3 + 24);
          BOOL v11 = __OFSUB__(v13, v14);
          uint64_t v12 = v13 - v14;
          if (!v11) {
            goto LABEL_11;
          }
          goto LABEL_28;
        case 3uLL:
          char v17 = v8 == 0;
          return v17 & 1;
        default:
          uint64_t v12 = BYTE6(a4);
          goto LABEL_11;
      }
    case 2uLL:
      uint64_t v10 = *(void *)(a1 + 16);
      uint64_t v9 = *(void *)(a1 + 24);
      BOOL v11 = __OFSUB__(v9, v10);
      uint64_t v8 = v9 - v10;
      if (!v11) {
        goto LABEL_6;
      }
      goto LABEL_26;
    case 3uLL:
      goto LABEL_6;
    default:
      uint64_t v8 = BYTE6(a2);
      goto LABEL_6;
  }
}

void sub_100057F2C(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView);
  swift_beginAccess();
  id v4 = *v3;
  id *v3 = a1;
  id v5 = a1;

  uint64_t v6 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView);
  swift_beginAccess();
  char v7 = *v6;
  if (v7)
  {
    id v8 = *v3;
    id v9 = v7;
    dispatch thunk of PaperDocumentView.rulerHostView.setter();
  }
}

uint64_t sub_100057FD0()
{
  return sub_100052054() & 1;
}

uint64_t sub_100058000()
{
  return sub_1000525FC(v0[3], v0[4], v0[5], v0[6], v0[7], v0[8], v0[9], v0[10], v0[11]);
}

uint64_t sub_10005804C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10004DE08(&qword_1000B5108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000580B4(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1000580FC()
{
  uint64_t v1 = v0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____SSSScreenshotPaperKitPDFView_leftRightMargin] = 0x4059000000000000;
  uint64_t v2 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_context;
  type metadata accessor for CRContext();
  uint64_t v6 = 0;
  memset(v5, 0, sizeof(v5));
  uint64_t v3 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
  sub_10004DFE8((uint64_t)v5, &qword_1000B5038);
  *(void *)&v1[v2] = v3;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshotEditsSnapshotted] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cancellable] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_paperDocumentView] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_cachedRenderedPDFDocument] = 0;
  uint64_t v4 = OBJC_IVAR____SSSScreenshotPaperKitPDFView_toolPicker;
  *(void *)&v1[v4] = [objc_allocWithZone((Class)PKToolPicker) init];
  *(_OWORD *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_pdfData] = xmmword_1000760C0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isChangingVellumOpacity] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_vellumOpacity] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_screenshot] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_isCropping] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_rulerHostView] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitPDFView_editable] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10005827C()
{
  uint64_t v1 = sub_10004DE08(&qword_1000B5098);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (((((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_100058380()
{
  uint64_t v2 = *(void *)(sub_10004DE08(&qword_1000B5098) - 8);
  unint64_t v3 = (((*(void *)(v2 + 64)
        + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80))
        + 7) & 0xFFFFFFFFFFFFFFF8)
      + 15) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v4 = *(void *)(v0 + v3);
  uint64_t v5 = *(void *)(v0 + ((v3 + 15) & 0xFFFFFFFFFFFFFFF8));
  unint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_10005A1EC;
  void v6[5] = v4;
  v6[6] = v5;
  id v9 = (uint64_t (*)(void))((char *)&dword_1000B5168 + dword_1000B5168);
  char v7 = (void *)swift_task_alloc();
  v6[7] = v7;
  *char v7 = v6;
  v7[1] = sub_100054DE8;
  return v9();
}

uint64_t sub_1000584F8()
{
  v1[8] = v0;
  type metadata accessor for CRKeyPath();
  v1[9] = swift_task_alloc();
  uint64_t v2 = type metadata accessor for UUID();
  v1[10] = v2;
  v1[11] = *(void *)(v2 - 8);
  v1[12] = swift_task_alloc();
  uint64_t v3 = type metadata accessor for URL();
  v1[13] = v3;
  v1[14] = *(void *)(v3 - 8);
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  uint64_t v4 = type metadata accessor for PaperDocument.PDFDocumentUse();
  v1[17] = v4;
  v1[18] = *(void *)(v4 - 8);
  v1[19] = swift_task_alloc();
  uint64_t v5 = sub_10004DE08(&qword_1000B5098);
  v1[20] = v5;
  v1[21] = *(void *)(v5 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  sub_10004DE08(&qword_1000B5200);
  v1[24] = swift_task_alloc();
  uint64_t v6 = type metadata accessor for PaperDocument();
  v1[25] = v6;
  v1[26] = *(void *)(v6 - 8);
  v1[27] = swift_task_alloc();
  return _swift_task_switch(sub_1000587D4, 0, 0);
}

uint64_t sub_1000587D4()
{
  uint64_t v1 = *(void *)(v0 + 192);
  type metadata accessor for CRContext();
  *(_OWORD *)(v0 + 32) = 0u;
  *(void *)(v0 + 48) = 0;
  *(_OWORD *)(v0 + 16) = 0u;
  uint64_t v2 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
  *(void *)(v0 + 224) = v2;
  sub_10004DFE8(v0 + 16, &qword_1000B5038);
  *(void *)(v0 + 232) = sub_1000580B4(&qword_1000B50A8, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
  Capsule<>.root.getter();
  uint64_t v3 = type metadata accessor for PaperRenderableOptions();
  *(void *)(v0 + 240) = v3;
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 56);
  *(void *)(v0 + 248) = v5;
  *(void *)(v0 + 256) = (v4 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
  v5(v1, 1, 1, v3);
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v0 + 264) = v6;
  uint64_t v7 = sub_1000580B4(&qword_1000B5120, (void (*)(uint64_t))&type metadata accessor for PaperDocument);
  *(void *)(v0 + 272) = v7;
  void *v6 = v0;
  v6[1] = sub_1000589DC;
  uint64_t v8 = *(void *)(v0 + 192);
  uint64_t v9 = *(void *)(v0 + 200);
  uint64_t v10 = *(void *)(v0 + 64);
  return PaperDocument.export<A>(_:in:options:)(v2, v10, v8, v9, v7);
}

uint64_t sub_1000589DC(uint64_t a1)
{
  uint64_t v2 = *(void **)v1;
  uint64_t v3 = *(void *)(*(void *)v1 + 216);
  uint64_t v4 = *(void *)(*(void *)v1 + 208);
  uint64_t v5 = *(void *)(*(void *)v1 + 200);
  uint64_t v6 = *(void *)(*(void *)v1 + 192);
  v2[35] = a1;
  swift_task_dealloc();
  sub_10004DFE8(v6, &qword_1000B5200);
  uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v2[36] = v7;
  v2[37] = (v4 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v7(v3, v5);
  return _swift_task_switch(sub_100058BA0, 0, 0);
}

uint64_t sub_100058BA0()
{
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 160);
  uint64_t v3 = *(void *)(v0 + 168);
  uint64_t v5 = *(void *)(v0 + 64);
  *(unsigned char *)(v0 + 396) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v1;
  *(void *)(v6 + 24) = v0 + 396;
  Capsule.callAsFunction<A>(_:)();
  *(void *)(v0 + 304) = 0;
  swift_task_dealloc();
  if (*(unsigned char *)(v0 + 396) == 1)
  {
    uint64_t v7 = *(void **)(v0 + 224);
    uint64_t v8 = *(void **)(v0 + 152);
    uint64_t v9 = *(void *)(v0 + 144);
    Capsule<>.root.getter();
    *uint64_t v8 = v7;
    *(_DWORD *)(v0 + 392) = enum case for PaperDocument.PDFDocumentUse.roundtrip(_:);
    uint64_t v10 = *(void (**)(void *))(v9 + 104);
    *(void *)(v0 + 312) = v10;
    *(void *)(v0 + 320) = (v9 + 104) & 0xFFFFFFFFFFFFLL | 0xB2E4000000000000;
    v10(v8);
    id v11 = v7;
    uint64_t v12 = (void *)swift_task_alloc();
    *(void *)(v0 + 328) = v12;
    void *v12 = v0;
    v12[1] = sub_100058E54;
    uint64_t v13 = *(void *)(v0 + 272);
    uint64_t v14 = *(void *)(v0 + 280);
    uint64_t v15 = *(void *)(v0 + 200);
    uint64_t v16 = *(void *)(v0 + 184);
    uint64_t v17 = *(void *)(v0 + 152);
    return PaperDocument.update<A>(pdfDocument:in:use:)(v14, v16, v17, v15, v13);
  }
  else
  {
    uint64_t v18 = *(void **)(v0 + 224);
    (*(void (**)(void, void))(*(void *)(v0 + 168) + 8))(*(void *)(v0 + 184), *(void *)(v0 + 160));

    uint64_t v19 = *(void *)(v0 + 280);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v20 = *(uint64_t (**)(uint64_t))(v0 + 8);
    return v20(v19);
  }
}

uint64_t sub_100058E54()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*v0 + 288);
  uint64_t v3 = *(void *)(*v0 + 216);
  uint64_t v4 = *(void *)(*v0 + 200);
  uint64_t v5 = *(void *)(*v0 + 152);
  uint64_t v6 = *(void *)(*v0 + 144);
  uint64_t v7 = *(void *)(*v0 + 136);
  swift_task_dealloc();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v6 + 8);
  *(void *)(v1 + 336) = v8;
  *(void *)(v1 + 344) = (v6 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v5, v7);
  v2(v3, v4);
  return _swift_task_switch(sub_100059058, 0, 0);
}

uint64_t sub_100059058()
{
  id v21 = (id)v0[35];
  uint64_t v24 = v0[30];
  uint64_t v25 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))v0[31];
  uint64_t v23 = v0[24];
  uint64_t v22 = v0[28];
  uint64_t v2 = v0[15];
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[14];
  uint64_t v5 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v6 = v0[10];
  uint64_t v20 = v0[13];
  uint64_t v7 = NSTemporaryDirectory();
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  URL.init(fileURLWithPath:)();
  swift_bridgeObjectRelease();
  UUID.init()();
  UUID.uuidString.getter();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  URL.appendingPathComponent(_:)();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(uint64_t, uint64_t))(v3 + 8);
  v0[44] = v8;
  v0[45] = (v3 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v8(v2, v20);
  URL._bridgeToObjectiveC()(v9);
  id v11 = v10;
  [v21 writeToURL:v10];

  static CRKeyPath.unique.getter();
  uint64_t v12 = swift_task_alloc();
  *(void *)(v12 + 16) = v1;
  *(void *)(v12 + 24) = v22;
  Capsule<>.init(id:initClosure:)();
  swift_task_dealloc();
  Capsule.callAsFunction<A>(_:)();
  Capsule<>.root.getter();
  v25(v23, 1, 1, v24);
  uint64_t v13 = (void *)swift_task_alloc();
  v0[46] = v13;
  *uint64_t v13 = v0;
  v13[1] = sub_100059330;
  uint64_t v14 = v0[34];
  uint64_t v15 = v0[28];
  uint64_t v16 = v0[24];
  uint64_t v17 = v0[25];
  uint64_t v18 = v0[22];
  return PaperDocument.export<A>(_:in:options:)(v15, v18, v16, v17, v14);
}

uint64_t sub_100059330(uint64_t a1)
{
  uint64_t v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v1 + 288);
  uint64_t v3 = *(void *)(*(void *)v1 + 216);
  uint64_t v4 = *(void *)(*(void *)v1 + 200);
  uint64_t v5 = *(void *)(*(void *)v1 + 192);
  *(void *)(*(void *)v1 + 376) = a1;
  swift_task_dealloc();
  sub_10004DFE8(v5, &qword_1000B5200);
  v2(v3, v4);
  return _swift_task_switch(sub_1000594F0, 0, 0);
}

uint64_t sub_1000594F0()
{
  unint64_t v1 = (unint64_t)[*(id *)(v0 + 376) pageCount];
  if ((v1 & 0x8000000000000000) != 0) {
LABEL_23:
  }
    __break(1u);
  unint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = 0;
    unint64_t v32 = v1;
    do
    {
      id v4 = [*(id *)(v33 + 376) pageAtIndex:v3];
      if (!v4) {
        goto LABEL_5;
      }
      uint64_t v5 = v4;
      id v6 = [v4 annotations];
      sub_10005A090(0, &qword_1000B5208);
      unint64_t v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

      if (v7 >> 62)
      {
        swift_bridgeObjectRetain();
        uint64_t v8 = _CocoaArrayWrapper.endIndex.getter();
        swift_bridgeObjectRelease();
        if (v8)
        {
LABEL_9:
          if (v8 < 1)
          {
            __break(1u);
            goto LABEL_23;
          }
          for (uint64_t i = 0; i != v8; ++i)
          {
            if ((v7 & 0xC000000000000001) != 0) {
              id v10 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v10 = *(id *)(v7 + 8 * i + 32);
            }
            id v11 = v10;
            id v12 = [v10 akAnnotation];
            if (v12)
            {
              uint64_t v13 = v12;
              [v12 drawingBounds];
              id v18 = [self valueWithRect:v14, v15, v16, v17];
              [v11 setValue:v18 forAnnotationKey:PDFAnnotationKeyRect];
            }
          }
        }
      }
      else
      {
        uint64_t v8 = *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10);
        if (v8) {
          goto LABEL_9;
        }
      }
      swift_bridgeObjectRelease();

      unint64_t v2 = v32;
LABEL_5:
      ++v3;
    }
    while (v3 != v2);
  }
  uint64_t v19 = *(void (**)(void *, uint64_t, uint64_t))(v33 + 312);
  uint64_t v20 = *(unsigned int *)(v33 + 392);
  id v21 = *(void **)(v33 + 224);
  uint64_t v22 = *(void **)(v33 + 152);
  uint64_t v23 = *(void *)(v33 + 136);
  Capsule<>.root.getter();
  *uint64_t v22 = v21;
  v19(v22, v20, v23);
  id v24 = v21;
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v33 + 384) = v25;
  *uint64_t v25 = v33;
  v25[1] = sub_100059824;
  uint64_t v26 = *(void *)(v33 + 272);
  uint64_t v27 = *(void *)(v33 + 200);
  uint64_t v28 = *(void *)(v33 + 176);
  uint64_t v29 = *(void *)(v33 + 152);
  uint64_t v30 = *(void *)(v33 + 376);
  return PaperDocument.update<A>(pdfDocument:in:use:)(v30, v28, v29, v27, v26);
}

uint64_t sub_100059824()
{
  unint64_t v1 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 336);
  unint64_t v2 = *(void (**)(uint64_t, uint64_t))(*(void *)v0 + 288);
  uint64_t v3 = *(void *)(*(void *)v0 + 216);
  uint64_t v4 = *(void *)(*(void *)v0 + 200);
  uint64_t v5 = *(void *)(*(void *)v0 + 152);
  uint64_t v6 = *(void *)(*(void *)v0 + 136);
  swift_task_dealloc();
  v1(v5, v6);
  v2(v3, v4);
  return _swift_task_switch(sub_100059A24, 0, 0);
}

uint64_t sub_100059A24()
{
  id v1 = [self defaultManager];
  URL._bridgeToObjectiveC()(v2);
  uint64_t v4 = v3;
  v0[7] = 0;
  unsigned int v5 = [v1 removeItemAtURL:v3 error:v0 + 7];

  uint64_t v6 = (void *)v0[7];
  if (v5)
  {
    unint64_t v7 = (void *)v0[28];
    id v8 = v6;

    uint64_t v9 = 35;
  }
  else
  {
    id v10 = (void *)v0[35];
    id v11 = v6;
    _convertNSErrorToError(_:)();

    swift_willThrow();
    swift_errorRelease();
    uint64_t v9 = 28;
  }
  id v12 = (void (*)(uint64_t, uint64_t))v0[44];
  uint64_t v13 = v0[22];
  uint64_t v14 = v0[23];
  uint64_t v15 = v0[20];
  uint64_t v16 = v0[21];
  uint64_t v17 = v0[16];
  uint64_t v18 = v0[13];

  uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  v19(v13, v15);
  v19(v14, v15);
  v12(v17, v18);
  uint64_t v20 = v0[47];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  id v21 = (uint64_t (*)(uint64_t))v0[1];
  return v21(v20);
}

uint64_t sub_100059C30(uint64_t a1)
{
  return a1;
}

uint64_t sub_100059C5C()
{
  uint64_t result = type metadata accessor for Optional();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t type metadata accessor for ObjectWrapper()
{
  return sub_10005A1BC();
}

uint64_t type metadata accessor for _SSSScreenshotPaperKitPDFView()
{
  return self;
}

uint64_t sub_100059D2C(uint64_t a1)
{
  return sub_1000552F0(a1, *(void **)(v1 + 16), *(unsigned char **)(v1 + 24));
}

uint64_t sub_100059D58@<X0>(uint64_t a1@<X8>)
{
  return sub_10005661C(*(void *)(v1 + 16), a1);
}

void *sub_100059D60(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100059DA4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100059DF4(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100059E44(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10004DE08(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100059EA8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100059EE0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10005A1EC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000B5280 + dword_1000B5280);
  return v6(a1, v4);
}

uint64_t sub_100059F98(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100054110;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000B5280 + dword_1000B5280);
  return v6(a1, v4);
}

uint64_t sub_10005A050()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10005A088()
{
}

uint64_t sub_10005A090(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_10005A0CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005A104()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = (void *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitPDFView_changeCounter);
    swift_beginAccess();
    [v3 _paperKitPDFDidChangeInView:v1 changeCounter:*v4];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10005A1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10005A1B4()
{
  return swift_release();
}

uint64_t sub_10005A1BC()
{
  return swift_getGenericMetadata();
}

void sub_10005A354(double a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (double *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity);
  swift_beginAccess();
  double v5 = *v4;
  *uint64_t v4 = a1;
  if (v5 != a1)
  {
    uint64_t v6 = OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity;
    *(unsigned char *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity) = 1;
    unint64_t v7 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
    swift_beginAccess();
    if (*v7)
    {
      id v8 = *v7;
      uint64_t v9 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter();

      if (v9)
      {
        id v10 = (void (*)(uint64_t *, void))dispatch thunk of Canvas.updatablePaper2.modify();
        sub_10004DE08(&qword_1000B53F8);
        sub_10005E910(&qword_1000B5400, (void (*)(uint64_t))&type metadata accessor for Image);
        sub_10004E044();
        v10(&v11, 0);
      }
    }
    *(unsigned char *)(v2 + v6) = 0;
  }
}

id sub_10005A688()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_10004DE08(&qword_1000B5090);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v70 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for CRKeyPath();
  __chkstk_darwin(v5 - 8);
  uint64_t v71 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10004DE08(&qword_1000B53F8);
  uint64_t v74 = *(void *)(v75 - 8);
  __chkstk_darwin(v75);
  uint64_t v73 = (char *)&v70 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v72 = v7;
  __chkstk_darwin(v8);
  id v10 = (char *)&v70 - v9;
  uint64_t v80 = type metadata accessor for Image();
  uint64_t v77 = *(void *)(v80 - 8);
  __chkstk_darwin(v80);
  id v12 = (char *)&v70 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v79 = (char *)&v70 - v14;
  uint64_t v15 = type metadata accessor for CanvasEditingMode();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v70 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess();
  uint64_t v20 = *v19;
  uint64_t v76 = v4;
  if (v20)
  {
    id result = [v20 view];
    if (!result)
    {
      __break(1u);
LABEL_19:
      __break(1u);
      goto LABEL_20;
    }
    uint64_t v22 = result;
    [result removeFromSuperview];

    uint64_t v23 = *v19;
  }
  else
  {
    uint64_t v23 = 0;
  }
  *uint64_t v19 = 0;

  id v24 = (void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_image];
  id result = (id)swift_beginAccess();
  uint64_t v25 = *v24;
  if (!*v24) {
    return result;
  }
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  id v27 = v25;
  if (Strong)
  {
    [Strong _paperKitImageView:v1 willBeginUpdatingImage:v27];
    swift_unknownObjectRelease();
  }
  id v78 = v27;
  uint64_t v28 = *(void **)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_context];
  uint64_t v29 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable];
  swift_beginAccess();
  BOOL v30 = *v29 == 1;
  CGFloat v70 = v10;
  if (v30)
  {
    id v31 = v28;
    static CanvasEditingMode.default.getter();
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v16 + 104))(v18, enum case for CanvasEditingMode.readOnly(_:), v15);
    id v32 = v28;
  }
  sub_10004DE08(&qword_1000B5610);
  uint64_t v33 = (void *)CanvasElementViewController.__allocating_init(context:editingMode:allowMediaCanvasElements:transparentBackground:)();
  dispatch thunk of CanvasElementViewController.isSixChannelBlendingEnabled.setter();
  id v34 = v33;
  uint64_t v35 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  [v35 addObserver:v1];
  id v36 = [v1 traitCollection];
  [v36 userInterfaceIdiom];

  dispatch thunk of CanvasElementViewController.canEditVellumOpacity.setter();
  uint64_t v37 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView];
  swift_beginAccess();
  id v38 = *v37;
  dispatch thunk of CanvasElementViewController.rulerHostView.setter();
  dispatch thunk of CanvasElementViewController.isImageAnalysisEnabled.setter();
  id result = [v34 view];
  uint64_t v39 = v77;
  if (!result) {
    goto LABEL_19;
  }
  uint64_t v40 = result;
  id v41 = [self clearColor];
  [v40 setBackgroundColor:v41];

  uint64_t v81 = dispatch thunk of CanvasElementViewController.publisher.getter();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_10004DE08(&qword_1000B5618);
  sub_10004F4BC(&qword_1000B5620, &qword_1000B5618);
  uint64_t v42 = Publisher<>.sink(receiveValue:)();
  swift_release();
  swift_release();
  id result = [v34 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v43 = result;
  [v1 addSubview:result];

  id result = [v34 view];
  uint64_t v44 = v80;
  uint64_t v45 = v79;
  if (!result)
  {
LABEL_21:
    __break(1u);
    return result;
  }
  uint64_t v46 = result;
  [result setAutoresizingMask:10];

  Image.init()();
  [v78 size];
  Image.frame.setter();
  Image.bounds.setter();
  (*(void (**)(char *, char *, uint64_t))(v39 + 16))(v12, v45, v44);
  static CRKeyPath.unique.getter();
  sub_10005E910(&qword_1000B5400, (void (*)(uint64_t))&type metadata accessor for Image);
  uint64_t v47 = v70;
  Capsule<>.init(_:id:)();
  uint64_t v48 = *v19;
  *uint64_t v19 = v34;
  id v49 = v34;

  char v50 = (uint64_t *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable];
  swift_beginAccess();
  *char v50 = v42;
  uint64_t v71 = (char *)v42;
  swift_retain();
  swift_release();
  id v51 = v49;
  uint64_t v52 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  [v52 setColorUserInterfaceStyle:1];
  id v53 = [v1 traitCollection];
  id v54 = [v53 userInterfaceIdiom];

  double v55 = v47;
  if (!v54)
  {
    id v56 = v51;
    double v57 = (void *)AnyCanvasElementViewController.toolPicker.getter();

    [v57 _setWantsClearBackgroundColorInCompactSize:1];
  }
  id v58 = v51;
  uint64_t v59 = (void *)AnyCanvasElementViewController.toolPicker.getter();

  [v59 _setShowsHandwritingTool:0];
  uint64_t v60 = (uint64_t)v76;
  static TaskPriority.userInitiated.getter();
  uint64_t v61 = type metadata accessor for TaskPriority();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v61 - 8) + 56))(v60, 0, 1, v61);
  uint64_t v62 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v63 = v74;
  uint64_t v64 = v73;
  uint64_t v65 = v75;
  (*(void (**)(char *, char *, uint64_t))(v74 + 16))(v73, v55, v75);
  unint64_t v66 = (*(unsigned __int8 *)(v63 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v63 + 80);
  char v67 = (char *)swift_allocObject();
  *((void *)v67 + 2) = 0;
  *((void *)v67 + 3) = 0;
  *((void *)v67 + 4) = v62;
  id v68 = v78;
  *((void *)v67 + 5) = v78;
  (*(void (**)(char *, char *, uint64_t))(v63 + 32))(&v67[v66], v64, v65);
  id v69 = v68;
  sub_100054F80(v60, (uint64_t)&unk_1000B5628, (uint64_t)v67);
  swift_release();
  sub_10004DFE8(v60, &qword_1000B5090);

  swift_release();
  (*(void (**)(char *, uint64_t))(v63 + 8))(v55, v65);
  return (id)(*(uint64_t (**)(char *, uint64_t))(v39 + 8))(v79, v80);
}

void sub_10005B380()
{
  uint64_t v1 = type metadata accessor for CanvasEditingMode();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = &v10[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v5 = (unsigned __int8 *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable];
  swift_beginAccess();
  [v0 setUserInteractionEnabled:*v5];
  uint64_t v6 = (void **)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess();
  uint64_t v7 = *v6;
  if (v7)
  {
    if (*v5 == 1)
    {
      id v8 = v7;
      static CanvasEditingMode.default.getter();
    }
    else
    {
      (*(void (**)(unsigned char *, void, uint64_t))(v2 + 104))(v4, enum case for CanvasEditingMode.readOnly(_:), v1);
      id v9 = v7;
    }
    dispatch thunk of CanvasElementViewController.editingMode.setter();
  }
}

id sub_10005B4D8(double a1, double a2, double a3, double a4)
{
  uint64_t v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  uint64_t v11 = OBJC_IVAR____SSSScreenshotPaperKitImageView_context;
  type metadata accessor for CRContext();
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  id v12 = v4;
  uint64_t v13 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
  sub_10004DFE8((uint64_t)v19, &qword_1000B5038);
  *(void *)&v5[v11] = v13;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable] = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_image] = 0;
  uint64_t v14 = &v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  *(_OWORD *)uint64_t v14 = 0u;
  *((_OWORD *)v14 + 1) = 0u;
  *((_OWORD *)v14 + 2) = 0u;
  uint64_t v15 = &v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
  *(void *)uint64_t v15 = 0;
  *((void *)v15 + 1) = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter] = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable] = 0;
  *(void *)&v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView] = 0;
  v12[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled] = 1;

  v18.receiver = v12;
  v18.super_class = ObjectType;
  id v16 = [super initWithFrame:a1, a2, a3, a4];
  [v16 setUserInteractionEnabled:0];
  return v16;
}

void sub_10005B6CC(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess();
  if (*v4)
  {
    id v5 = *v4;
    uint64_t v6 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter();
    if ((a1 & 1) != 0
      && (id v7 = [v5 presentedViewController], v7, !v7))
    {
      if (v6)
      {
        id v9 = v6;
        if (([v9 isFirstResponder] & 1) == 0
          && ([v9 _isAncestorOfFirstResponder] & 1) == 0)
        {
          [v5 becomeFirstResponder];
        }
      }
      else if (([v5 isFirstResponder] & 1) == 0)
      {
        [v5 becomeFirstResponder];
      }
      id v10 = [v2 traitCollection];
      id v11 = [v10 userInterfaceIdiom];

      if (!v11)
      {
        if (*v4)
        {
          id v12 = *v4;
          uint64_t v13 = (void *)AnyCanvasElementViewController.toolPicker.getter();

          id v14 = [v13 _contextualEditingView];
          if (v14)
          {
            [v14 setOverrideUserInterfaceStyle:2];
          }
        }
      }
    }
    else
    {
      if (v6)
      {
        id v8 = v6;
        if ([v8 isFirstResponder]) {
          [v8 resignFirstResponder];
        }
      }
      if ([v5 isFirstResponder]) {
        [v5 resignFirstResponder];
      }
    }
  }
}

void sub_10005BA18(unsigned __int8 a1)
{
  uint64_t v3 = (unsigned __int8 *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled);
  swift_beginAccess();
  unsigned __int8 *v3 = a1;
  uint64_t v4 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  if (*v4)
  {
    id v5 = [*v4 view];
    if (v5)
    {
      uint64_t v6 = v5;
      [v5 setUserInteractionEnabled:*v3];
    }
    else
    {
      __break(1u);
    }
  }
}

void sub_10005BAC8(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (id *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess();
  if (*v4)
  {
    id v5 = *v4;
    uint64_t v6 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v6)
    {
      id v7 = (void *)v6;
      [a1 zoomScale];
      id v8 = [v2 window];
      if (v8)
      {
        id v9 = v8;
        id v10 = [v8 screen];

        [v10 scale];
      }
      id v11 = v7;
      dispatch thunk of AnyCanvas.screenScaleOverride.setter();

      [a1 bounds];
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;
      double v19 = v18;
      [a1 adjustedContentInset];
      double v22 = sub_10005E19C(v13, v15, v17, v19, v20, v21);
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      id v29 = v11;
      [v29 convertRect:a1 fromCoordinateSpace:v22, v24, v26, v28];
      dispatch thunk of Canvas.visibleBoundsOverride.setter();

      id v5 = v29;
    }
  }
}

void sub_10005BD00(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  if (*v3)
  {
    id v4 = *v3;
    uint64_t v5 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      [a1 bounds];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      [a1 adjustedContentInset];
      double v17 = sub_10005E19C(v8, v10, v12, v14, v15, v16);
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      id v24 = v6;
      [v24 convertRect:a1 fromCoordinateSpace:v17, v19, v21, v23];
      dispatch thunk of Canvas.visibleBoundsOverride.setter();

      id v4 = v24;
    }
  }
}

void sub_10005BFE0()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v16 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    double v9 = (void *)Strong;
    double v10 = (void *)(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
    swift_beginAccess();
    if (*v10 == -1)
    {
      __break(1u);
    }
    else
    {
      ++*v10;
      if (*((unsigned char *)v9 + OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity))
      {
      }
      else
      {
        sub_10005E7F8();
        uint64_t v17 = static OS_dispatch_queue.main.getter();
        uint64_t v11 = swift_allocObject();
        *(void *)(v11 + 16) = v9;
        aBlock[4] = sub_10005E870;
        aBlock[5] = v11;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        aBlock[2] = sub_10005458C;
        aBlock[3] = &unk_10009B448;
        double v12 = _Block_copy(aBlock);
        uint64_t v16 = v4;
        double v13 = v12;
        id v14 = v9;
        swift_release();
        static DispatchQoS.unspecified.getter();
        aBlock[0] = &_swiftEmptyArrayStorage;
        sub_10005E910((unint64_t *)&unk_1000B52D0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
        sub_10004DE08(&qword_1000B5640);
        sub_10004F4BC((unint64_t *)&unk_1000B52E0, &qword_1000B5640);
        dispatch thunk of SetAlgebra.init<A>(_:)();
        double v15 = (void *)v17;
        OS_dispatch_queue.async(group:qos:flags:execute:)();
        _Block_release(v13);

        (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v16);
      }
    }
  }
}

void sub_10005C330()
{
  uint64_t v1 = v0;
  uint64_t v2 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
  swift_beginAccess();
  if (*v2)
  {
    id v3 = *v2;
    CanvasElementViewController<>.alwaysUseMaxResolutionImage.setter();
    uint64_t v4 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [self clearColor];
      [v5 setBackgroundColor:v6];
    }
    uint64_t v7 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v7)
    {
      double v8 = (void *)v7;
      double v9 = (void *)CanvasView.canvasScrollView.getter();

      if (!v9)
      {
LABEL_42:
        __break(1u);
        goto LABEL_43;
      }
      [v9 setMinimumZoomScale:1.0];
    }
    uint64_t v10 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v10)
    {
      uint64_t v11 = (void *)v10;
      double v12 = (void *)CanvasView.canvasScrollView.getter();

      if (!v12)
      {
LABEL_43:
        __break(1u);
        goto LABEL_44;
      }
      [v12 setMaximumZoomScale:1.0];
    }
    uint64_t v13 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v13)
    {
      id v14 = (void *)v13;
      double v15 = (void *)CanvasView.canvasScrollView.getter();

      if (!v15)
      {
LABEL_44:
        __break(1u);
        return;
      }
      [v15 setScrollEnabled:0];
    }
    dispatch thunk of CanvasElementViewController.shouldDeselectElementsWhenToolPickerIsHidden.setter();
    uint64_t v16 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      double v18 = v1;
      dispatch thunk of CanvasView.contentSnapshottingView.setter();
    }
    id v19 = [v3 view];
    if (!v19)
    {
LABEL_41:
      __break(1u);
      goto LABEL_42;
    }
    double v20 = v19;
    double v21 = (unsigned __int8 *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled];
    swift_beginAccess();
    [v20 setUserInteractionEnabled:*v21];

    double v22 = (void *)dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (v22)
    {
      double v23 = v22;
      [v22 setOverrideUserInterfaceStyle:1];
    }
    uint64_t v24 = dispatch thunk of CanvasElementViewController.canvasView.getter();
    if (!v24) {
      goto LABEL_38;
    }
    double v25 = (void *)v24;
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      id v27 = [Strong _paperKitImageViewOverlayViewController:v1];
      swift_unknownObjectRelease();
      if (v27)
      {
        id v28 = v25;
        id v29 = v27;
        dispatch thunk of AnyCanvas.overlayViewControllerForPresentingUI.setter();
      }
    }
    id v30 = [v1 superview];
    if (!v30)
    {
LABEL_37:

LABEL_38:
      return;
    }
    id v31 = v30;
    while (1)
    {
      self;
      uint64_t v32 = swift_dynamicCastObjCClass();
      if (v32) {
        break;
      }
      id v33 = [v31 superview];

      id v31 = v33;
      if (!v33) {
        goto LABEL_37;
      }
    }
    id v34 = (void *)v32;
    id v35 = v25;
    unint64_t v36 = dispatch thunk of AnyCanvas.movableOverlayViews.getter();

    id v49 = v25;
    if (v36 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v37 = _CocoaArrayWrapper.endIndex.getter();
      swift_bridgeObjectRelease();
      if (v37) {
        goto LABEL_29;
      }
    }
    else
    {
      uint64_t v37 = *(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v37)
      {
LABEL_29:
        if (v37 >= 1)
        {
          uint64_t v38 = 0;
          do
          {
            if ((v36 & 0xC000000000000001) != 0) {
              id v39 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            }
            else {
              id v39 = *(id *)(v36 + 8 * v38 + 32);
            }
            uint64_t v40 = v39;
            ++v38;
            [v39 bounds];
            [v34 convertRect:v40 fromCoordinateSpace:];
            double v42 = v41;
            double v44 = v43;
            double v46 = v45;
            double v48 = v47;
            [v34 addSubview:v40];
            [v40 setFrame:v42, v44, v46, v48];
          }
          while (v37 != v38);
          goto LABEL_36;
        }
        __break(1u);
        goto LABEL_41;
      }
    }
LABEL_36:
    swift_bridgeObjectRelease();
    sub_10005BAC8(v34);

    double v25 = v49;
    goto LABEL_37;
  }
}

uint64_t sub_10005C7E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[6] = a5;
  v6[7] = a6;
  void v6[5] = a4;
  sub_10004DE08(&qword_1000B5090);
  v6[8] = swift_task_alloc();
  uint64_t v7 = sub_10004DE08(&qword_1000B53F8);
  v6[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v6[10] = v8;
  v6[11] = *(void *)(v8 + 64);
  v6[12] = swift_task_alloc();
  v6[13] = swift_task_alloc();
  return _swift_task_switch(sub_10005C8F4, 0, 0);
}

uint64_t sub_10005C8F4()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    id v3 = [(UIImage *)[*(id *)(v0 + 48) ss_CGImageBacked]];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = UIImagePNGRepresentation(v3);
      if (v5)
      {
        id v6 = v5;
        uint64_t v7 = *(void *)(v0 + 104);
        uint64_t v8 = *(void *)(v0 + 80);
        uint64_t v26 = *(void *)(v0 + 96);
        uint64_t v27 = *(void *)(v0 + 88);
        uint64_t v24 = v8;
        uint64_t v9 = *(void *)(v0 + 72);
        uint64_t v30 = *(void *)(v0 + 64);
        uint64_t v10 = *(void *)(v0 + 56);
        uint64_t v11 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
        unint64_t v28 = v12;
        uint64_t v29 = v11;
        unint64_t v13 = v12;

        id v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
        v14(v7, v10, v9);
        uint64_t v15 = swift_task_alloc();
        *(void *)(v15 + 16) = v11;
        *(void *)(v15 + 24) = v13;
        uint64_t v25 = v7;
        Capsule.callAsFunction<A>(_:)();
        swift_task_dealloc();
        uint64_t v16 = type metadata accessor for TaskPriority();
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v30, 1, 1, v16);
        uint64_t v17 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v14(v26, v7, v9);
        type metadata accessor for MainActor();
        swift_retain();
        double v18 = v4;
        uint64_t v19 = static MainActor.shared.getter();
        unint64_t v20 = (*(unsigned __int8 *)(v24 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
        double v21 = (char *)swift_allocObject();
        *((void *)v21 + 2) = v19;
        *((void *)v21 + 3) = &protocol witness table for MainActor;
        *((void *)v21 + 4) = v17;
        (*(void (**)(char *, uint64_t, uint64_t))(v24 + 32))(&v21[v20], v26, v9);
        *(void *)&v21[(v27 + v20 + 7) & 0xFFFFFFFFFFFFFFF8] = v18;
        swift_release();
        sub_1000545D0(v30, (uint64_t)&unk_1000B55F8, (uint64_t)v21);
        sub_10004FB78(v29, v28);

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v25, v9);
      }
      else
      {
      }
    }
    else
    {
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t sub_10005CC20(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = sub_10004DE08(&qword_1000B5608);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  sub_10004FA78(a2, a3);
  CRDataAsset.init(_:)();
  uint64_t v8 = enum case for CRAssetOrData.data(_:);
  uint64_t v9 = type metadata accessor for CRAssetOrData();
  uint64_t v10 = *(void *)(v9 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 104))(v7, v8, v9);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  sub_10005E910(&qword_1000B5400, (void (*)(uint64_t))&type metadata accessor for Image);
  return Capsule.Ref<>.subscript.setter();
}

uint64_t sub_10005CD98()
{
  return Image.image.getter();
}

uint64_t sub_10005CDBC(uint64_t a1)
{
  uint64_t v2 = sub_10004DE08(&qword_1000B5608);
  __chkstk_darwin(v2 - 8);
  sub_100059E44(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1000B5608);
  return Image.image.setter();
}

uint64_t sub_10005CE50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[12] = a5;
  v6[13] = a6;
  v6[11] = a4;
  sub_10004DE08(&qword_1000B5468);
  v6[14] = swift_task_alloc();
  type metadata accessor for MainActor();
  v6[15] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10005CF1C, v8, v7);
}

uint64_t sub_10005CF1C()
{
  swift_release();
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v2 = (void *)Strong;
    uint64_t v3 = (void **)(Strong + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
    swift_beginAccess();
    uint64_t v4 = *v3;
    if (*v3)
    {
      uint64_t v5 = v0[14];
      uint64_t v6 = v0[12];
      uint64_t v7 = sub_10004DE08(&qword_1000B53F8);
      uint64_t v8 = *(void *)(v7 - 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v5, v6, v7);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
      id v9 = v4;
      dispatch thunk of CanvasElementViewController.paper.setter();
    }
    sub_10005C330();
    swift_beginAccess();
    uint64_t v10 = (void *)swift_unknownObjectWeakLoadStrong();
    if (v10)
    {
      [v10 _paperKitImageView:v2 didFinishUpdatingImage:v0[13]];
      swift_unknownObjectRelease();
    }
  }
  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

void sub_10005D0EC()
{
  v12.receiver = v0;
  v12.super_class = (Class)swift_getObjectType();
  [super layoutSubviews];
  uint64_t v1 = (double *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  swift_beginAccess();
  double v2 = v1[2];
  double v3 = v1[3];
  double v4 = v1[4];
  double v5 = v1[5];
  v13.origin.CGFloat x = v2;
  v13.origin.CGFloat y = v3;
  v13.size.CGFloat width = v4;
  v13.size.CGFloat height = v5;
  if (!CGRectIsEmpty(v13))
  {
    uint64_t v6 = (double *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
    swift_beginAccess();
    double v7 = *v6;
    double v8 = v6[1];
    id v9 = (id *)&v0[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController];
    swift_beginAccess();
    if (*v9)
    {
      id v10 = [*v9 view];
      if (v10)
      {
        uint64_t v11 = v10;
        [v10 setFrame:v2, v3, v4 * v7, v5 * v8];
      }
      else
      {
        __break(1u);
      }
    }
  }
}

uint64_t sub_10005D258(void *a1)
{
  id v32 = a1;
  uint64_t v2 = type metadata accessor for CRKeyPath();
  __chkstk_darwin(v2 - 8);
  uint64_t v3 = type metadata accessor for Paper();
  __chkstk_darwin(v3);
  double v4 = (void *)sub_10004DE08(&qword_1000B5460);
  uint64_t v5 = *(v4 - 1);
  __chkstk_darwin(v4);
  id v33 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10004DE08(&qword_1000B5468);
  __chkstk_darwin(v7 - 8);
  id v9 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_10004DE08(&qword_1000B53F8);
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  CGRect v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v14 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  if (!*v14)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
    goto LABEL_6;
  }
  id v15 = *v14;
  dispatch thunk of CanvasElementViewController.paper.getter();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
LABEL_6:
    sub_10004DFE8((uint64_t)v9, &qword_1000B5468);
    return 0;
  }
  uint64_t v30 = v5;
  uint64_t v16 = v13;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v13, v9, v10);
  id v17 = [v32 environmentDescription];
  [v17 imageScale];

  type metadata accessor for CanvasElementImageRenderer();
  swift_getKeyPath();
  id v32 = v4;
  sub_10005E910(&qword_1000B5400, (void (*)(uint64_t))&type metadata accessor for Image);
  Capsule<>.subscript.getter();
  swift_release();
  uint64_t v18 = CanvasElementImageRenderer.__allocating_init(size:scale:)();
  dispatch thunk of CanvasElementRenderer.sixChannelBlending.setter();
  swift_getKeyPath();
  uint64_t v19 = v16;
  uint64_t v31 = v16;
  Capsule<>.subscript.getter();
  swift_release();
  Paper.init(frame:)();
  static CRKeyPath.unique.getter();
  sub_10005E910(&qword_1000B5470, (void (*)(uint64_t))&type metadata accessor for Paper);
  unint64_t v20 = v33;
  uint64_t v21 = Capsule<>.init(_:id:)();
  __chkstk_darwin(v21);
  *(&v30 - 2) = (uint64_t)v19;
  Capsule.callAsFunction<A>(_:)();
  uint64_t v22 = swift_allocObject();
  *(void *)(v22 + 16) = 0;
  id v23 = [self traitCollectionWithUserInterfaceStyle:1];
  uint64_t v24 = (void *)swift_allocObject();
  v24[2] = v18;
  v24[3] = v20;
  v24[4] = v22;
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_10005E25C;
  *(void *)(v25 + 24) = v24;
  aBlock[4] = sub_10005E278;
  aBlock[5] = v25;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10005DD20;
  aBlock[3] = &unk_10009B300;
  uint64_t v26 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  [v23 performAsCurrentTraitCollection:v26];
  swift_release();
  _Block_release(v26);

  (*(void (**)(char *, uint64_t))(v11 + 8))(v31, v10);
  LOBYTE(v26) = swift_isEscapingClosureAtFileLocation();
  uint64_t result = swift_release();
  if ((v26 & 1) == 0)
  {
    swift_beginAccess();
    unint64_t v28 = *(void **)(v22 + 16);
    id v29 = v28;
    swift_release();
    (*(void (**)(char *, id))(v30 + 8))(v33, v32);
    swift_release();
    return (uint64_t)v28;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005D8D8@<X0>(void *a1@<X8>)
{
  uint64_t result = Image.frame.getter();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  return result;
}

uint64_t sub_10005D908()
{
  return Image.frame.setter();
}

uint64_t sub_10005D934(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10004DE08(&qword_1000B53F8);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = &v15[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_10004DE08(&qword_1000B4F98);
  uint64_t v8 = *(void *)(v7 - 8);
  double v9 = __chkstk_darwin(v7);
  uint64_t v11 = &v15[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  (*(void (**)(unsigned char *, uint64_t, uint64_t, double))(v4 + 16))(v6, a2, v3, v9);
  type metadata accessor for TaggedCanvasElement();
  sub_10005E910((unint64_t *)&unk_1000B55E0, (void (*)(uint64_t))&type metadata accessor for TaggedCanvasElement);
  swift_retain();
  SharedTagged_9.init<A>(_:_:)();
  sub_10005E910(&qword_1000B5470, (void (*)(uint64_t))&type metadata accessor for Paper);
  uint64_t v12 = (uint64_t (*)(unsigned char *, void))Capsule.Ref<>.root.modify();
  CGRect v13 = (void (*)(unsigned char *, void))Paper.subelements.modify();
  sub_10004DE08(&qword_1000B4F90);
  CROrderedSet.append(_:)();
  (*(void (**)(unsigned char *, uint64_t))(v8 + 8))(v11, v7);
  v13(v15, 0);
  return v12(v16, 0);
}

void sub_10005DBA4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10004DE08(&qword_1000B5460);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a2, v5);
  memset(v12, 0, sizeof(v12));
  char v13 = 1;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = a3;
  *(void *)(v10 + 24) = v9;
  swift_retain();
  uint64_t v11 = v9;
  dispatch thunk of CanvasElementImageRenderer.image(from:bounds:completion:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  OS_dispatch_semaphore.wait()();
}

uint64_t sub_10005DD20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

void sub_10005DFA0()
{
  uint64_t v1 = v0;
  swift_unknownObjectWeakInit();
  uint64_t v2 = OBJC_IVAR____SSSScreenshotPaperKitImageView_context;
  type metadata accessor for CRContext();
  uint64_t v7 = 0;
  memset(v6, 0, sizeof(v6));
  uint64_t v3 = static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
  sub_10004DFE8((uint64_t)v6, &qword_1000B5038);
  *(void *)&v1[v2] = v3;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_imageCancellable] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_isChangingVellumOpacity] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_vellumOpacity] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_image] = 0;
  uint64_t v4 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_cropInfo];
  *uint64_t v4 = 0u;
  v4[1] = 0u;
  void v4[2] = 0u;
  uint64_t v5 = &v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_sizeMultiplier];
  *uint64_t v5 = 0;
  v5[1] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_useTrilinearMinificationFilter] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_editable] = 0;
  *(void *)&v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView] = 0;
  v1[OBJC_IVAR____SSSScreenshotPaperKitImageView_annotationsEnabled] = 1;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_10005E0F8(void *a1)
{
  uint64_t v3 = (id *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_rulerHostView);
  swift_beginAccess();
  id v4 = *v3;
  id *v3 = a1;
  id v5 = a1;

  uint64_t v6 = (void **)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_imageViewController);
  swift_beginAccess();
  uint64_t v7 = *v6;
  if (v7)
  {
    id v8 = *v3;
    id v9 = v7;
    dispatch thunk of CanvasElementViewController.rulerHostView.setter();
  }
}

double sub_10005E19C(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_10005E1B8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005E1F0(uint64_t a1)
{
  return sub_10005D934(a1, *(void *)(v1 + 16));
}

uint64_t sub_10005E21C()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10005E25C()
{
  sub_10005DBA4(v0[2], v0[3], v0[4]);
}

uint64_t sub_10005E268()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10005E278()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_10005E2A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10005E2B0()
{
  return swift_release();
}

uint64_t type metadata accessor for _SSSScreenshotPaperKitImageView()
{
  return self;
}

__n128 sub_10005E2DC(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_10005E2F0(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_10005E310(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = (a2 - 1);
    if (!a3) {
      return result;
    }
    char v3 = 1;
  }
  else
  {
    if (!a3) {
      return result;
    }
    char v3 = 0;
  }
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for SSSCropInfo(uint64_t a1)
{
}

uint64_t sub_10005E35C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

Swift::Int sub_10005E39C(void *a1)
{
  uint64_t v3 = *(void *)(v1 + 16);
  swift_beginAccess();
  id v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = a1;
  id v5 = a1;

  return OS_dispatch_semaphore.signal()();
}

uint64_t sub_10005E3F8(uint64_t a1)
{
  return sub_10005CC20(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10005E424()
{
  uint64_t v1 = sub_10004DE08(&qword_1000B53F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = (*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6 + 8, v5);
}

uint64_t sub_10005E518()
{
  uint64_t v2 = *(void *)(sub_10004DE08(&qword_1000B53F8) - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = *(void *)(v0 + 32);
  uint64_t v5 = v0 + v3;
  uint64_t v6 = *(void *)(v0 + ((*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v7;
  *uint64_t v7 = v1;
  v7[1] = sub_10005A1EC;
  return sub_10005CE50((uint64_t)v7, v8, v9, v4, v5, v6);
}

void sub_10005E628()
{
}

uint64_t sub_10005E634()
{
  uint64_t v1 = sub_10004DE08(&qword_1000B53F8);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 48) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_10005E714()
{
  uint64_t v2 = *(void *)(sub_10004DE08(&qword_1000B53F8) - 8);
  uint64_t v3 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v5 = v0 + ((*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  uint64_t v6 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v6;
  void *v6 = v1;
  v6[1] = sub_100054110;
  return sub_10005C7E4((uint64_t)v6, v7, v8, v3, v4, v5);
}

unint64_t sub_10005E7F8()
{
  unint64_t result = qword_1000B5630;
  if (!qword_1000B5630)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000B5630);
  }
  return result;
}

uint64_t sub_10005E838()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005E870()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = (void *)result;
    uint64_t v4 = (void *)(v1 + OBJC_IVAR____SSSScreenshotPaperKitImageView_changeCounter);
    swift_beginAccess();
    [v3 _paperKitImageDidChangeInView:v1 changeCounter:*v4];
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10005E910(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10005E964()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_10005E998()
{
  uint64_t v0 = abort_report_np();
  return sub_10005E9C0(v0);
}

uint64_t sub_10005E9C0()
{
  uint64_t v0 = abort_report_np();
  return sub_10005E9E8(v0);
}

uint64_t sub_10005E9E8()
{
  uint64_t v0 = abort_report_np();
  return sub_10005EA10(v0);
}

uint64_t sub_10005EA10()
{
  uint64_t v0 = abort_report_np();
  return sub_10005EA38(v0);
}

uint64_t sub_10005EA38()
{
  uint64_t v0 = abort_report_np();
  return sub_10005EA60(v0);
}

void sub_10005EA60(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GlitchFreeHeroTest failed to find scroll view", v1, 2u);
}

void sub_10005EAA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GlitchFreeHeroTest failed to find screnshot view", v1, 2u);
}

void sub_10005EAE8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Image passed to VisionKit was nil", v1, 2u);
}

void sub_10005EB2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not write to directory for internal build with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10005EBA4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not generate image data for image %@ to save for sysdiagnose", (uint8_t *)&v3, 0xCu);
}

void sub_10005EC20(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not write to sysdiagnose for internal build to path %@ with error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10005ECA8(void *a1)
{
  uint64_t v1 = [a1 loggableDescription];
  sub_10001424C();
  sub_10001422C((void *)&_mh_execute_header, v2, v3, "Received an image identifier update %@ with no matching environment description", v4, v5, v6, v7, v8);
}

void sub_10005ED2C(void *a1)
{
  uint64_t v1 = [a1 loggableDescription];
  sub_10001424C();
  sub_10001422C((void *)&_mh_execute_header, v2, v3, "Received an image identifier failure %@", v4, v5, v6, v7, v8);
}

void sub_10005EDB0(void *a1)
{
  uint64_t v1 = [a1 loggableDescription];
  sub_10001424C();
  sub_10001422C((void *)&_mh_execute_header, v2, v3, "Received a metadata update %@ with no matching element identifier", v4, v5, v6, v7, v8);
}

void sub_10005EE34(void *a1)
{
  uint64_t v1 = [a1 loggableDescription];
  sub_10001424C();
  sub_10001422C((void *)&_mh_execute_header, v2, v3, "Received a document update %@ with no matching element identifier", v4, v5, v6, v7, v8);
}

void sub_10005EEB8(void *a1)
{
  uint64_t v1 = [a1 environmentDescription];
  uint64_t v2 = [v1 loggableDescription];
  sub_10001424C();
  sub_10001422C((void *)&_mh_execute_header, v3, v4, "Asked to remove a screenshot the manager is not tracking with environment description %@", v5, v6, v7, v8, v9);
}

uint64_t sub_10005EF54()
{
  int v0 = abort_report_np();
  return sub_10005EF7C(v0, v1, v2);
}

void sub_10005EF7C(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "We received more document updates (%lu) than we were expecting (%lu)", (uint8_t *)&v4, 0x16u);
}

void sub_10005F008(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) UUIDString];
  sub_10001424C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "screenshot was edited, undonating siri sharing user activity with UUID: %@", v4, 0xCu);
}

void sub_10005F0A0()
{
  sub_10001424C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "No file to remove at %@", v1, 0xCu);
}

void sub_10005F114()
{
  sub_10001424C();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Could not find pdf from file manager %@ at %@", v2, 0x16u);
}

void sub_10005F198(void *a1, NSObject *a2)
{
  __int16 v3 = [a1 filename];
  int v4 = 138412546;
  uint64_t v5 = 0;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Invalid path component when calling _savePDFToTemporaryPathWithData:%@ filename: %@", (uint8_t *)&v4, 0x16u);
}

void sub_10005F23C()
{
  sub_10001424C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Finished coordinated writing, error:%@", v1, 0xCu);
}

void sub_10005F2B0(void *a1, NSObject *a2)
{
  id v3 = a1;
  int v4 = 134218240;
  id v5 = [v3 bytes];
  __int16 v6 = 1024;
  unsigned int v7 = [v3 length];
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Generated PDF data %p, length:%d", (uint8_t *)&v4, 0x12u);
}

void sub_10005F368(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 40);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Moved PDF to %@ (error: %@)", (uint8_t *)&v5, 0x16u);
}

void sub_10005F3F8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  sub_10001424C();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "screenshot couldn't be sent to quick note. Error: %@", v4, 0xCu);
}

uint64_t sub_10005F48C()
{
  os_log_t v0 = abort_report_np();
  return sub_10005F4B4(v0);
}

void sub_10005F4B4(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "We got into a weird state - we have no container view controller but a valid root view controller.", v1, 2u);
}

void sub_10005F4F8(os_log_t log, double a2)
{
  int v2 = 134217984;
  double v3 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Still processing image identifiers progress: %f", (uint8_t *)&v2, 0xCu);
}

void sub_10005F574(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Saved environment description while we have a remote view controller", v1, 2u);
}

void sub_10005F5B8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "There were more valid screenshots than there were actually available - this is indicative of screenshots not getting cleaned up properly after dismissal", v1, 2u);
}

uint64_t sub_10005F5FC()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F624(v0);
}

uint64_t sub_10005F624()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F64C(v0);
}

uint64_t sub_10005F64C()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F674(v0);
}

uint64_t sub_10005F674()
{
  return sub_10005F698();
}

uint64_t sub_10005F698()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F6C0(v0);
}

uint64_t sub_10005F6C0()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F6E8(v0);
}

uint64_t sub_10005F6E8()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F710(v0);
}

uint64_t sub_10005F710()
{
  uint64_t v0 = abort_report_np();
  return sub_10005F738(v0);
}

void sub_10005F738(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 160);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Did not present share sheet for activity view controller %@ because success == NO", (uint8_t *)&v3, 0xCu);
}

void sub_10005F7C0(void *a1, NSObject *a2)
{
  int v3 = [a1 localizedDescription];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to save PDF page to Photos. Error: %@", (uint8_t *)&v4, 0xCu);
}

void sub_10005F858(uint64_t a1, void *a2, NSObject *a3)
{
  id v5 = [*(id *)(a1 + 32) count];
  uint64_t v6 = [a2 localizedDescription];
  int v7 = 134218242;
  id v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "failed to send %ld screenshots to Quick Note. Error: %@", (uint8_t *)&v7, 0x16u);
}

void sub_10005F918()
{
}

uint64_t __DataStorage._bytes.getter()
{
  return __DataStorage._bytes.getter();
}

uint64_t __DataStorage._length.getter()
{
  return __DataStorage._length.getter();
}

uint64_t __DataStorage._offset.getter()
{
  return __DataStorage._offset.getter();
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t URL.init(fileURLWithPath:)()
{
  return URL.init(fileURLWithPath:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

uint64_t URL.appendingPathComponent(_:)()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Data.write(to:options:)()
{
  return Data.write(to:options:)();
}

uint64_t UUID.uuidString.getter()
{
  return UUID.uuidString.getter();
}

uint64_t UUID.init()()
{
  return UUID.init()();
}

uint64_t type metadata accessor for UUID()
{
  return type metadata accessor for UUID();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t Paper.subelements.modify()
{
  return Paper.subelements.modify();
}

uint64_t Paper.init(frame:)()
{
  return Paper.init(frame:)();
}

uint64_t type metadata accessor for Paper()
{
  return type metadata accessor for Paper();
}

uint64_t PaperDocumentPage.subelements.getter()
{
  return PaperDocumentPage.subelements.getter();
}

uint64_t PaperDocumentPage.contentsBounds.getter()
{
  return PaperDocumentPage.contentsBounds.getter();
}

uint64_t PaperDocumentPage.contentsBounds.setter()
{
  return PaperDocumentPage.contentsBounds.setter();
}

uint64_t PaperDocumentPage.bounds.setter()
{
  return PaperDocumentPage.bounds.setter();
}

uint64_t PaperDocumentPage.drawing.getter()
{
  return PaperDocumentPage.drawing.getter();
}

uint64_t PaperDocumentPage.pageIndex.getter()
{
  return PaperDocumentPage.pageIndex.getter();
}

uint64_t type metadata accessor for PaperDocumentPage()
{
  return type metadata accessor for PaperDocumentPage();
}

uint64_t dispatch thunk of PaperDocumentView.contentSnapshottingView.setter()
{
  return dispatch thunk of PaperDocumentView.contentSnapshottingView.setter();
}

uint64_t dispatch thunk of PaperDocumentView.pdfView.getter()
{
  return dispatch thunk of PaperDocumentView.pdfView.getter();
}

uint64_t dispatch thunk of PaperDocumentView.paperDocument.modify()
{
  return dispatch thunk of PaperDocumentView.paperDocument.modify();
}

uint64_t dispatch thunk of PaperDocumentView.paperDocument.getter()
{
  return dispatch thunk of PaperDocumentView.paperDocument.getter();
}

uint64_t dispatch thunk of PaperDocumentView.rulerHostView.setter()
{
  return dispatch thunk of PaperDocumentView.rulerHostView.setter();
}

uint64_t dispatch thunk of PaperDocumentView.toolPicker.getter()
{
  return dispatch thunk of PaperDocumentView.toolPicker.getter();
}

uint64_t dispatch thunk of PaperDocumentView.currentPage.getter()
{
  return dispatch thunk of PaperDocumentView.currentPage.getter();
}

uint64_t dispatch thunk of PaperDocumentView.deselectAll()()
{
  return dispatch thunk of PaperDocumentView.deselectAll()();
}

uint64_t dispatch thunk of PaperDocumentView.editingMode.setter()
{
  return dispatch thunk of PaperDocumentView.editingMode.setter();
}

uint64_t dispatch thunk of PaperDocumentView.vellumOpacity.setter()
{
  return dispatch thunk of PaperDocumentView.vellumOpacity.setter();
}

uint64_t dispatch thunk of PaperDocumentView.canEditVellumOpacity.setter()
{
  return dispatch thunk of PaperDocumentView.canEditVellumOpacity.setter();
}

uint64_t dispatch thunk of PaperDocumentView.viewControllerForPresentingUI.setter()
{
  return dispatch thunk of PaperDocumentView.viewControllerForPresentingUI.setter();
}

uint64_t dispatch thunk of PaperDocumentView.automaticallyAdjustScaleFactor.setter()
{
  return dispatch thunk of PaperDocumentView.automaticallyAdjustScaleFactor.setter();
}

uint64_t dispatch thunk of PaperDocumentView.shouldDeselectElementsWhenToolPickerIsHidden.setter()
{
  return dispatch thunk of PaperDocumentView.shouldDeselectElementsWhenToolPickerIsHidden.setter();
}

uint64_t dispatch thunk of PaperDocumentView.publisher.getter()
{
  return dispatch thunk of PaperDocumentView.publisher.getter();
}

uint64_t type metadata accessor for PaperDocumentView()
{
  return type metadata accessor for PaperDocumentView();
}

uint64_t type metadata accessor for PaperRenderableOptions()
{
  return type metadata accessor for PaperRenderableOptions();
}

uint64_t PaperPage<>.setVellum<A>(opacity:in:)()
{
  return PaperPage<>.setVellum<A>(opacity:in:)();
}

uint64_t type metadata accessor for PaperDocument.PDFDocumentUse()
{
  return type metadata accessor for PaperDocument.PDFDocumentUse();
}

uint64_t PaperDocument.init<A>(url:in:assetManager:)()
{
  return PaperDocument.init<A>(url:in:assetManager:)();
}

uint64_t PaperDocument.pages.getter()
{
  return PaperDocument.pages.getter();
}

uint64_t PaperDocument.pages.setter()
{
  return PaperDocument.pages.setter();
}

uint64_t PaperDocument.init()()
{
  return PaperDocument.init()();
}

uint64_t type metadata accessor for PaperDocument()
{
  return type metadata accessor for PaperDocument();
}

uint64_t type metadata accessor for ArrowShape()
{
  return type metadata accessor for ArrowShape();
}

uint64_t type metadata accessor for BezierPath()
{
  return type metadata accessor for BezierPath();
}

uint64_t CanvasView.canvasScrollView.getter()
{
  return CanvasView.canvasScrollView.getter();
}

uint64_t dispatch thunk of CanvasView.contentSnapshottingView.setter()
{
  return dispatch thunk of CanvasView.contentSnapshottingView.setter();
}

uint64_t dispatch thunk of CanvasView.deselectAll()()
{
  return dispatch thunk of CanvasView.deselectAll()();
}

uint64_t CRDataAsset.init(_:)()
{
  return CRDataAsset.init(_:)();
}

uint64_t type metadata accessor for RoundedRect()
{
  return type metadata accessor for RoundedRect();
}

uint64_t type metadata accessor for CRAssetOrData()
{
  return type metadata accessor for CRAssetOrData();
}

uint64_t type metadata accessor for CalloutBubble()
{
  return type metadata accessor for CalloutBubble();
}

uint64_t dispatch thunk of CanvasElement.apply(_:)()
{
  return dispatch thunk of CanvasElement.apply(_:)();
}

uint64_t dispatch thunk of CanvasElement.flags.modify()
{
  return dispatch thunk of CanvasElement.flags.modify();
}

uint64_t dispatch thunk of CanvasElement.flags.getter()
{
  return dispatch thunk of CanvasElement.flags.getter();
}

uint64_t type metadata accessor for RegularPolygon()
{
  return type metadata accessor for RegularPolygon();
}

uint64_t PKDrawingStruct.apply<A>(_:concat:in:)()
{
  return PKDrawingStruct.apply<A>(_:concat:in:)();
}

uint64_t type metadata accessor for PKDrawingStruct()
{
  return type metadata accessor for PKDrawingStruct();
}

uint64_t static CanvasEditingMode.default.getter()
{
  return static CanvasEditingMode.default.getter();
}

uint64_t type metadata accessor for CanvasEditingMode()
{
  return type metadata accessor for CanvasEditingMode();
}

uint64_t static CanvasElementFlags.useOriginalPDFAppearance.getter()
{
  return static CanvasElementFlags.useOriginalPDFAppearance.getter();
}

uint64_t static CanvasElementFlags.readOnly.getter()
{
  return static CanvasElementFlags.readOnly.getter();
}

uint64_t type metadata accessor for CanvasElementFlags()
{
  return type metadata accessor for CanvasElementFlags();
}

uint64_t type metadata accessor for TaggedCanvasElement()
{
  return type metadata accessor for TaggedCanvasElement();
}

uint64_t dispatch thunk of CanvasElementRenderer.sixChannelBlending.setter()
{
  return dispatch thunk of CanvasElementRenderer.sixChannelBlending.setter();
}

uint64_t dispatch thunk of ContainerCanvasElement.subelements.modify()
{
  return dispatch thunk of ContainerCanvasElement.subelements.modify();
}

uint64_t dispatch thunk of ContainerCanvasElement.subelements.getter()
{
  return dispatch thunk of ContainerCanvasElement.subelements.getter();
}

uint64_t dispatch thunk of ContainerCanvasElement.bounds.getter()
{
  return dispatch thunk of ContainerCanvasElement.bounds.getter();
}

uint64_t dispatch thunk of ContainerCanvasElement.bounds.setter()
{
  return dispatch thunk of ContainerCanvasElement.bounds.setter();
}

uint64_t ShapeSecondaryProperties.flags.setter()
{
  return ShapeSecondaryProperties.flags.setter();
}

uint64_t ShapeSecondaryProperties.init()()
{
  return ShapeSecondaryProperties.init()();
}

uint64_t type metadata accessor for ShapeSecondaryProperties()
{
  return type metadata accessor for ShapeSecondaryProperties();
}

uint64_t CanvasElementImageRenderer.__allocating_init(size:scale:)()
{
  return CanvasElementImageRenderer.__allocating_init(size:scale:)();
}

uint64_t dispatch thunk of CanvasElementImageRenderer.image(from:bounds:completion:)()
{
  return dispatch thunk of CanvasElementImageRenderer.image(from:bounds:completion:)();
}

uint64_t type metadata accessor for CanvasElementImageRenderer()
{
  return type metadata accessor for CanvasElementImageRenderer();
}

uint64_t dispatch thunk of CanvasElementViewController.canvasView.getter()
{
  return dispatch thunk of CanvasElementViewController.canvasView.getter();
}

uint64_t dispatch thunk of CanvasElementViewController.rulerHostView.setter()
{
  return dispatch thunk of CanvasElementViewController.rulerHostView.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.editingMode.setter()
{
  return dispatch thunk of CanvasElementViewController.editingMode.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.canEditVellumOpacity.setter()
{
  return dispatch thunk of CanvasElementViewController.canEditVellumOpacity.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.isImageAnalysisEnabled.setter()
{
  return dispatch thunk of CanvasElementViewController.isImageAnalysisEnabled.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.drawingGestureRecognizer.getter()
{
  return dispatch thunk of CanvasElementViewController.drawingGestureRecognizer.getter();
}

uint64_t dispatch thunk of CanvasElementViewController.isSixChannelBlendingEnabled.setter()
{
  return dispatch thunk of CanvasElementViewController.isSixChannelBlendingEnabled.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.shouldDeselectElementsWhenToolPickerIsHidden.setter()
{
  return dispatch thunk of CanvasElementViewController.shouldDeselectElementsWhenToolPickerIsHidden.setter();
}

uint64_t dispatch thunk of CanvasElementViewController.paper.getter()
{
  return dispatch thunk of CanvasElementViewController.paper.getter();
}

uint64_t dispatch thunk of CanvasElementViewController.paper.setter()
{
  return dispatch thunk of CanvasElementViewController.paper.setter();
}

uint64_t CanvasElementViewController.__allocating_init(context:editingMode:allowMediaCanvasElements:transparentBackground:)()
{
  return CanvasElementViewController.__allocating_init(context:editingMode:allowMediaCanvasElements:transparentBackground:)();
}

uint64_t dispatch thunk of CanvasElementViewController.publisher.getter()
{
  return dispatch thunk of CanvasElementViewController.publisher.getter();
}

uint64_t CanvasElementViewController<>.alwaysUseMaxResolutionImage.setter()
{
  return CanvasElementViewController<>.alwaysUseMaxResolutionImage.setter();
}

uint64_t CanvasElementViewController<>.imageDescription.getter()
{
  return CanvasElementViewController<>.imageDescription.getter();
}

uint64_t AnyCanvasElementViewController.toolPicker.getter()
{
  return AnyCanvasElementViewController.toolPicker.getter();
}

uint64_t type metadata accessor for CanvasElementAutoresizeBehavior()
{
  return type metadata accessor for CanvasElementAutoresizeBehavior();
}

uint64_t type metadata accessor for Line()
{
  return type metadata accessor for Line();
}

uint64_t type metadata accessor for Quad()
{
  return type metadata accessor for Quad();
}

uint64_t type metadata accessor for Star()
{
  return type metadata accessor for Star();
}

uint64_t Color.init(red:green:blue:alpha:)()
{
  return Color.init(red:green:blue:alpha:)();
}

uint64_t type metadata accessor for Color()
{
  return type metadata accessor for Color();
}

uint64_t Image.frame.getter()
{
  return Image.frame.getter();
}

uint64_t Image.frame.setter()
{
  return Image.frame.setter();
}

uint64_t Image.image.getter()
{
  return Image.image.getter();
}

uint64_t Image.image.setter()
{
  return Image.image.setter();
}

uint64_t Image.bounds.setter()
{
  return Image.bounds.setter();
}

uint64_t Image.init()()
{
  return Image.init()();
}

uint64_t type metadata accessor for Image()
{
  return type metadata accessor for Image();
}

uint64_t Shape.strokeWidth.setter()
{
  return Shape.strokeWidth.setter();
}

uint64_t Shape.secondaryProperties.setter()
{
  return Shape.secondaryProperties.setter();
}

uint64_t Shape.flags.getter()
{
  return Shape.flags.getter();
}

uint64_t Shape.init(frame:type:strokeWidth:strokeColor:fillColor:text:textResizeBehavior:)()
{
  return Shape.init(frame:type:strokeWidth:strokeColor:fillColor:text:textResizeBehavior:)();
}

uint64_t Shape.frame.setter()
{
  return Shape.frame.setter();
}

uint64_t Shape.opacity.setter()
{
  return Shape.opacity.setter();
}

uint64_t Shape.fillColor.setter()
{
  return Shape.fillColor.setter();
}

uint64_t type metadata accessor for Shape()
{
  return type metadata accessor for Shape();
}

uint64_t dispatch thunk of Canvas.updatablePaper2.modify()
{
  return dispatch thunk of Canvas.updatablePaper2.modify();
}

uint64_t dispatch thunk of Canvas.visibleBoundsOverride.setter()
{
  return dispatch thunk of Canvas.visibleBoundsOverride.setter();
}

uint64_t type metadata accessor for Ellipse()
{
  return type metadata accessor for Ellipse();
}

uint64_t dispatch thunk of AnyCanvas.movableOverlayViews.getter()
{
  return dispatch thunk of AnyCanvas.movableOverlayViews.getter();
}

uint64_t dispatch thunk of AnyCanvas.screenScaleOverride.setter()
{
  return dispatch thunk of AnyCanvas.screenScaleOverride.setter();
}

uint64_t dispatch thunk of AnyCanvas.overlayViewControllerForPresentingUI.setter()
{
  return dispatch thunk of AnyCanvas.overlayViewControllerForPresentingUI.setter();
}

uint64_t Rectangle.init()()
{
  return Rectangle.init()();
}

uint64_t type metadata accessor for Rectangle()
{
  return type metadata accessor for Rectangle();
}

uint64_t CROrderedSet.makeIterator()()
{
  return CROrderedSet.makeIterator()();
}

uint64_t CROrderedSet.append(_:)()
{
  return CROrderedSet.append(_:)();
}

uint64_t CROrderedSet.insert(_:at:)()
{
  return CROrderedSet.insert(_:at:)();
}

uint64_t CROrderedSet.Iterator.next()()
{
  return CROrderedSet.Iterator.next()();
}

uint64_t WeakTagged_3<>.docPage.getter()
{
  return WeakTagged_3<>.docPage.getter();
}

uint64_t TaggedValue_2<>.bounds.getter()
{
  return TaggedValue_2<>.bounds.getter();
}

uint64_t TaggedValue_2.init(_:)()
{
  return TaggedValue_2.init(_:)();
}

uint64_t TaggedValue_9.init(_:)()
{
  return TaggedValue_9.init(_:)();
}

uint64_t SharedTagged_3<>.docPage.getter()
{
  return SharedTagged_3<>.docPage.getter();
}

uint64_t SharedTagged_3.identity.getter()
{
  return SharedTagged_3.identity.getter();
}

uint64_t SharedTagged_9<>.shape.getter()
{
  return SharedTagged_9<>.shape.getter();
}

uint64_t SharedTagged_9.subscript.modify()
{
  return SharedTagged_9.subscript.modify();
}

uint64_t SharedTagged_9.subscript.getter()
{
  return SharedTagged_9.subscript.getter();
}

uint64_t SharedTagged_9.init<A>(_:_:)()
{
  return SharedTagged_9.init<A>(_:_:)();
}

{
  return SharedTagged_9.init<A>(_:_:)();
}

uint64_t Ref.subscript.modify()
{
  return Ref.subscript.modify();
}

uint64_t Ref.subscript.getter()
{
  return Ref.subscript.getter();
}

uint64_t Capsule.callAsFunction<A>(_:)()
{
  return Capsule.callAsFunction<A>(_:)();
}

uint64_t Capsule.Ref<>.subscript.getter()
{
  return Capsule.Ref<>.subscript.getter();
}

uint64_t Capsule.Ref<>.subscript.setter()
{
  return Capsule.Ref<>.subscript.setter();
}

uint64_t Capsule.Ref<>.root.modify()
{
  return Capsule.Ref<>.root.modify();
}

uint64_t Capsule.Ref<>.root.getter()
{
  return Capsule.Ref<>.root.getter();
}

uint64_t Capsule<>.subscript.getter()
{
  return Capsule<>.subscript.getter();
}

uint64_t Capsule<>.init(id:initClosure:)()
{
  return Capsule<>.init(id:initClosure:)();
}

uint64_t Capsule<>.root.getter()
{
  return Capsule<>.root.getter();
}

uint64_t Capsule<>.init(_:id:)()
{
  return Capsule<>.init(_:id:)();
}

uint64_t WeakRef.subscript.getter()
{
  return WeakRef.subscript.getter();
}

uint64_t CRContext.assetManager.getter()
{
  return CRContext.assetManager.getter();
}

uint64_t static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)()
{
  return static CRContext.newTransientContext(uniqueAssetManager:encryptionDelegate:)();
}

uint64_t type metadata accessor for CRContext()
{
  return type metadata accessor for CRContext();
}

uint64_t static CRKeyPath.== infix(_:_:)()
{
  return static CRKeyPath.== infix(_:_:)();
}

uint64_t static CRKeyPath.unique.getter()
{
  return static CRKeyPath.unique.getter();
}

uint64_t type metadata accessor for CRKeyPath()
{
  return type metadata accessor for CRKeyPath();
}

uint64_t Reference.identity.getter()
{
  return Reference.identity.getter();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Sequence.makeIterator()()
{
  return dispatch thunk of Sequence.makeIterator()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t static TaskPriority.userInitiated.getter()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t dispatch thunk of Collection.startIndex.getter()
{
  return dispatch thunk of Collection.startIndex.getter();
}

uint64_t dispatch thunk of Collection.endIndex.getter()
{
  return dispatch thunk of Collection.endIndex.getter();
}

uint64_t dispatch thunk of Collection.subscript.read()
{
  return dispatch thunk of Collection.subscript.read();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

Swift::Void __swiftcall OS_dispatch_semaphore.wait()()
{
}

Swift::Int __swiftcall OS_dispatch_semaphore.signal()()
{
  return OS_dispatch_semaphore.signal()();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

uint64_t dispatch thunk of SetAlgebra.isSuperset(of:)()
{
  return dispatch thunk of SetAlgebra.isSuperset(of:)();
}

uint64_t dispatch thunk of SetAlgebra.intersection(_:)()
{
  return dispatch thunk of SetAlgebra.intersection(_:)();
}

uint64_t dispatch thunk of SetAlgebra.isEmpty.getter()
{
  return dispatch thunk of SetAlgebra.isEmpty.getter();
}

uint64_t dispatch thunk of SetAlgebra.subtract(_:)()
{
  return dispatch thunk of SetAlgebra.subtract(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BSSettingFlagForBool()
{
  return _BSSettingFlagForBool();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return _CFDataCreateMutable(allocator, capacity);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return _CGBitmapContextCreate(data, width, height, bitsPerComponent, bytesPerRow, space, bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return _CGBitmapContextCreateImage(context);
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return _CGBitmapGetAlignedBytesPerRow();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return _CGColorSpaceCreateWithName(name);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return _CGColorSpaceGetNumberOfComponents(space);
}

BOOL CGColorSpaceIsWideGamutRGB(CGColorSpaceRef a1)
{
  return _CGColorSpaceIsWideGamutRGB(a1);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
}

BOOL CGColorSpaceUsesExtendedRange(CGColorSpaceRef space)
{
  return _CGColorSpaceUsesExtendedRange(space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextDrawPDFPage(CGContextRef c, CGPDFPageRef page)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
}

void CGContextRelease(CGContextRef c)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
}

void CGContextSetAllowsAntialiasing(CGContextRef c, BOOL allowsAntialiasing)
{
}

void CGContextSetAllowsFontSmoothing(CGContextRef c, BOOL allowsFontSmoothing)
{
}

void CGContextSetAllowsFontSubpixelPositioning(CGContextRef c, BOOL allowsFontSubpixelPositioning)
{
}

void CGContextSetAllowsFontSubpixelQuantization(CGContextRef c, BOOL allowsFontSubpixelQuantization)
{
}

void CGContextSetFillColor(CGContextRef c, const CGFloat *components)
{
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
}

void CGContextSetShouldAntialias(CGContextRef c, BOOL shouldAntialias)
{
}

void CGContextSetShouldSubpixelPositionFonts(CGContextRef c, BOOL shouldSubpixelPositionFonts)
{
}

void CGContextSetShouldSubpixelQuantizeFonts(CGContextRef c, BOOL shouldSubpixelQuantizeFonts)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

CGDataConsumerRef CGDataConsumerCreateWithCFData(CFMutableDataRef data)
{
  return _CGDataConsumerCreateWithCFData(data);
}

void CGDataConsumerRelease(CGDataConsumerRef consumer)
{
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return _CGImageGetColorSpace(image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return _CGImageGetHeight(image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return _CGImageGetWidth(image);
}

void CGImageRelease(CGImageRef image)
{
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
}

void CGPDFContextClose(CGContextRef context)
{
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return _CGPDFContextCreate(consumer, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
}

CGPDFDocumentRef CGPDFDocumentCreateWithURL(CFURLRef url)
{
  return _CGPDFDocumentCreateWithURL(url);
}

CGPDFPageRef CGPDFDocumentGetPage(CGPDFDocumentRef document, size_t pageNumber)
{
  return _CGPDFDocumentGetPage(document, pageNumber);
}

CGRect CGPDFPageGetBoxRect(CGPDFPageRef page, CGPDFBox box)
{
  return _CGPDFPageGetBoxRect(page, box);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

void CGPathRelease(CGPathRef path)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  return _CGRectGetMaxX(rect);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

CGRect CGRectIntegral(CGRect rect)
{
  return _CGRectIntegral(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  return _CGRectUnion(r1, r2);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t RPTGetBoundsForView()
{
  return _RPTGetBoundsForView();
}

uint64_t SSApplyDebuggingCustomizationsToViewIfAppropriate()
{
  return _SSApplyDebuggingCustomizationsToViewIfAppropriate();
}

uint64_t SSCGImageBackedImageFromImage()
{
  return _SSCGImageBackedImageFromImage();
}

uint64_t SSEdgeInsetsEqualToEdgeInsets()
{
  return _SSEdgeInsetsEqualToEdgeInsets();
}

uint64_t SSRectEdgeIsHorizontal()
{
  return _SSRectEdgeIsHorizontal();
}

uint64_t SSRectEqualToRect()
{
  return _SSRectEqualToRect();
}

uint64_t SSRectIsValid()
{
  return _SSRectIsValid();
}

uint64_t SSRectSubtractingRect()
{
  return _SSRectSubtractingRect();
}

uint64_t SSRoundRectToScale()
{
  return _SSRoundRectToScale();
}

uint64_t SSRoundSizeToScale()
{
  return _SSRoundSizeToScale();
}

uint64_t SSizeToFitSizeInAspectRatioOfSize()
{
  return _SSizeToFitSizeInAspectRatioOfSize();
}

uint64_t UIAnimationDragCoefficient()
{
  return _UIAnimationDragCoefficient();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsBeginPDFContextToData(NSMutableData *data, CGRect bounds, NSDictionary *documentInfo)
{
}

void UIGraphicsBeginPDFPageWithInfo(CGRect bounds, NSDictionary *pageInfo)
{
}

void UIGraphicsEndImageContext(void)
{
}

void UIGraphicsEndPDFContext(void)
{
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

CGRect UIGraphicsGetPDFContextBounds(void)
{
  return _UIGraphicsGetPDFContextBounds();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void UIImageWriteToSavedPhotosAlbum(UIImage *image, id completionTarget, SEL completionSelector, void *contextInfo)
{
}

uint64_t UIRectCenteredAboutPoint()
{
  return _UIRectCenteredAboutPoint();
}

uint64_t UIRectCenteredIntegralRect()
{
  return _UIRectCenteredIntegralRect();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectCenteredYInRect()
{
  return _UIRectCenteredYInRect();
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

uint64_t UIRectGetCorners()
{
  return _UIRectGetCorners();
}

uint64_t UIRectInset()
{
  return _UIRectInset();
}

uint64_t UIRectMakeWithPoints()
{
  return _UIRectMakeWithPoints();
}

uint64_t UIRoundToViewScale()
{
  return _UIRoundToViewScale();
}

uint64_t UIViewIgnoresTouchEvents()
{
  return _UIViewIgnoresTouchEvents();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _SSEnableContinuousScreenCaptureForBugFiling()
{
  return __SSEnableContinuousScreenCaptureForBugFiling();
}

uint64_t _SSEnableVellumExport()
{
  return __SSEnableVellumExport();
}

uint64_t _SSGetAnnotationModePreference()
{
  return __SSGetAnnotationModePreference();
}

uint64_t _SSGetLastUsedFullPageScreenshotShareAsOption()
{
  return __SSGetLastUsedFullPageScreenshotShareAsOption();
}

uint64_t _SSIsScreenshotManagerDebuggingEnabled()
{
  return __SSIsScreenshotManagerDebuggingEnabled();
}

uint64_t _SSIsViewSnapshotDebuggingEnabled()
{
  return __SSIsViewSnapshotDebuggingEnabled();
}

uint64_t _SSQuickActionsEnabled()
{
  return __SSQuickActionsEnabled();
}

uint64_t _SSRemoveBackgroundEnabled()
{
  return __SSRemoveBackgroundEnabled();
}

uint64_t _SSScreenshotsInQuickNoteEnabled()
{
  return __SSScreenshotsInQuickNoteEnabled();
}

uint64_t _SSSetLastUsedFullPageScreenshotShareAsOption()
{
  return __SSSetLastUsedFullPageScreenshotShareAsOption();
}

uint64_t _SSShouldHomeButtonDismiss()
{
  return __SSShouldHomeButtonDismiss();
}

uint64_t _SSSignpostLog()
{
  return __SSSignpostLog();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t ct_green_tea_logger_create_static()
{
  return _ct_green_tea_logger_create_static();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_block_cancel(dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return _dispatch_block_create(flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
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

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

pid_t getpid(void)
{
  return _getpid();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

uint64_t memorystatus_control()
{
  return _memorystatus_control();
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
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

id objc_getAssociatedObject(id object, const void *key)
{
  return _objc_getAssociatedObject(object, key);
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
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

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_task_alloc()
{
  return _swift_task_alloc();
}

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGContext(void *a1, const char *a2, ...)
{
  return _[a1 CGContext];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_CGPath(void *a1, const char *a2, ...)
{
  return _[a1 CGPath];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_EnableAnnotationKit(void *a1, const char *a2, ...)
{
  return _[a1 EnableAnnotationKit];
}

id objc_msgSend_PDFData(void *a1, const char *a2, ...)
{
  return _[a1 PDFData];
}

id objc_msgSend_PDFDocument(void *a1, const char *a2, ...)
{
  return _[a1 PDFDocument];
}

id objc_msgSend_PDFPage(void *a1, const char *a2, ...)
{
  return _[a1 PDFPage];
}

id objc_msgSend_PDFURL(void *a1, const char *a2, ...)
{
  return _[a1 PDFURL];
}

id objc_msgSend_PDFVisibleRect(void *a1, const char *a2, ...)
{
  return _[a1 PDFVisibleRect];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__aboutToChangeSize(void *a1, const char *a2, ...)
{
  return _[a1 _aboutToChangeSize];
}

id objc_msgSend__actionInActions_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionInActions:ofClass:");
}

id objc_msgSend__actionInfoViewIfExists(void *a1, const char *a2, ...)
{
  return _[a1 _actionInfoViewIfExists];
}

id objc_msgSend__actionNameForDeletePDFPage(void *a1, const char *a2, ...)
{
  return _[a1 _actionNameForDeletePDFPage];
}

id objc_msgSend__actuallyMoveFromRemoteViewControllerToRemoteAlertViewController(void *a1, const char *a2, ...)
{
  return _[a1 _actuallyMoveFromRemoteViewControllerToRemoteAlertViewController];
}

id objc_msgSend__addRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 _addRootViewController];
}

id objc_msgSend__addScreenshotWithPDF_visibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addScreenshotWithPDF:visibleRect:");
}

id objc_msgSend__amountToMoveScreenshotsViewForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _[a1 _amountToMoveScreenshotsViewForHorizontalSlideOffDismiss];
}

id objc_msgSend__amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_amountToMoveScreenshotsViewWithFrameForHorizontalSlideOffDismiss:");
}

id objc_msgSend__animateUsingDefaultTimingWithOptions_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateUsingDefaultTimingWithOptions:animations:completion:");
}

id objc_msgSend__animateWithDuration_delay_options_factory_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateWithDuration:delay:options:factory:animations:completion:");
}

id objc_msgSend__anyScreenshotPDFViewNeedsBleedToBottom(void *a1, const char *a2, ...)
{
  return _[a1 _anyScreenshotPDFViewNeedsBleedToBottom];
}

id objc_msgSend__areAnyScreenshotsActive(void *a1, const char *a2, ...)
{
  return _[a1 _areAnyScreenshotsActive];
}

id objc_msgSend__arrayOfRectValues_isEqualToArrayOfRectValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_arrayOfRectValues:isEqualToArrayOfRectValues:");
}

id objc_msgSend__availableRectForContent(void *a1, const char *a2, ...)
{
  return _[a1 _availableRectForContent];
}

id objc_msgSend__bestFormatForScreenshotItemProvider_(void *a1, const char *a2, ...)
{
  return [a1 _bestFormatForScreenshotItemProvider:];
}

id objc_msgSend__betaAppActivityItemIfAvailble(void *a1, const char *a2, ...)
{
  return _[a1 _betaAppActivityItemIfAvailble];
}

id objc_msgSend__bottomBarHeightIncludingSafeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 _bottomBarHeightIncludingSafeAreaInsets];
}

id objc_msgSend__bottomPalette(void *a1, const char *a2, ...)
{
  return _[a1 _bottomPalette];
}

id objc_msgSend__buildDoneMenu(void *a1, const char *a2, ...)
{
  return _[a1 _buildDoneMenu];
}

id objc_msgSend__buildDoneMenuElements(void *a1, const char *a2, ...)
{
  return _[a1 _buildDoneMenuElements];
}

id objc_msgSend__bundleIDForBetaApp(void *a1, const char *a2, ...)
{
  return _[a1 _bundleIDForBetaApp];
}

id objc_msgSend__canProvidePDF(void *a1, const char *a2, ...)
{
  return _[a1 _canProvidePDF];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return _[a1 _cancel];
}

id objc_msgSend__cancelScheduledHideCachedOverlayView(void *a1, const char *a2, ...)
{
  return _[a1 _cancelScheduledHideCachedOverlayView];
}

id objc_msgSend__cancelSharing_completion_(void *a1, const char *a2, ...)
{
  return [a1 _cancelSharing:completion:];
}

id objc_msgSend__cancelZoomTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelZoomTimer];
}

id objc_msgSend__clearSecurityScopedResourcesAndTemporaryFiles(void *a1, const char *a2, ...)
{
  return _[a1 _clearSecurityScopedResourcesAndTemporaryFiles];
}

id objc_msgSend__commitCropControllerInflightEdits(void *a1, const char *a2, ...)
{
  return _[a1 _commitCropControllerInflightEdits];
}

id objc_msgSend__configureBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 _configureBarButtonItems];
}

id objc_msgSend__contentInsetForUnitRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentInsetForUnitRect:");
}

id objc_msgSend__contentSwitcherShouldMoveDown(void *a1, const char *a2, ...)
{
  return _[a1 _contentSwitcherShouldMoveDown];
}

id objc_msgSend__contentView(void *a1, const char *a2, ...)
{
  return _[a1 _contentView];
}

id objc_msgSend__createAndParentContainerViewControllerIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 _createAndParentContainerViewControllerIfPossible];
}

id objc_msgSend__createContainerViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _createContainerViewControllerIfNecessary];
}

id objc_msgSend__createDirectoryForSysdiagnoseIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _createDirectoryForSysdiagnoseIfNecessary];
}

id objc_msgSend__createTemporarySavingQueue(void *a1, const char *a2, ...)
{
  return _[a1 _createTemporarySavingQueue];
}

id objc_msgSend__cropPDFEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _cropPDFEnabled];
}

id objc_msgSend__cropRectFromOverlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cropRectFromOverlayView:");
}

id objc_msgSend__currentOverlayController(void *a1, const char *a2, ...)
{
  return _[a1 _currentOverlayController];
}

id objc_msgSend__currentPDFView(void *a1, const char *a2, ...)
{
  return _[a1 _currentPDFView];
}

id objc_msgSend__currentPage(void *a1, const char *a2, ...)
{
  return _[a1 _currentPage];
}

id objc_msgSend__currentScreenshotView(void *a1, const char *a2, ...)
{
  return _[a1 _currentScreenshotView];
}

id objc_msgSend__currentScrollViewCropRect(void *a1, const char *a2, ...)
{
  return _[a1 _currentScrollViewCropRect];
}

id objc_msgSend__currentUserActivityUUID(void *a1, const char *a2, ...)
{
  return _[a1 _currentUserActivityUUID];
}

id objc_msgSend__currentUserInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 _currentUserInterfaceIdiom];
}

id objc_msgSend__dataTypeIdentifierForActivityType_(void *a1, const char *a2, ...)
{
  return [a1 _dataTypeIdentifierForActivityType:];
}

id objc_msgSend__deletePageInPDF_(void *a1, const char *a2, ...)
{
  return [a1 _deletePageInPDF:];
}

id objc_msgSend__didChangeSize(void *a1, const char *a2, ...)
{
  return _[a1 _didChangeSize];
}

id objc_msgSend__dismissActivityViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissActivityViewController:completion:");
}

id objc_msgSend__dismissInflightActivity_completion_(void *a1, const char *a2, ...)
{
  return [_dismissInflightActivity:completion:];
}

id objc_msgSend__dismissScreenshotsWithVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissScreenshotsWithVelocity:");
}

id objc_msgSend__dismissWithDeleteOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissWithDeleteOptions:");
}

id objc_msgSend__doc_importItemAtURL_toDestination_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_doc_importItemAtURL:toDestination:error:");
}

id objc_msgSend__documentUpdateActionInActions_(void *a1, const char *a2, ...)
{
  return [a1 _documentUpdateActionInActions:];
}

id objc_msgSend__donateScreenshotUserActivityForSiri_(void *a1, const char *a2, ...)
{
  return [a1 _donateScreenshotUserActivityForSiri];
}

id objc_msgSend__durationForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _[a1 _durationForHorizontalSlideOffDismiss];
}

id objc_msgSend__durationForMinimize(void *a1, const char *a2, ...)
{
  return _[a1 _durationForMinimize];
}

id objc_msgSend__effectForBlurEffect_vibrancyStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectForBlurEffect:vibrancyStyle:");
}

id objc_msgSend__effectiveBottomBarExtent(void *a1, const char *a2, ...)
{
  return _[a1 _effectiveBottomBarExtent];
}

id objc_msgSend__effectiveIndexForIndex_inNumberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_effectiveIndexForIndex:inNumberOfScreenshots:");
}

id objc_msgSend__elementDocument(void *a1, const char *a2, ...)
{
  return _[a1 _elementDocument];
}

id objc_msgSend__elementHasValidPDFData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_elementHasValidPDFData:");
}

id objc_msgSend__elementIndexForDocument(void *a1, const char *a2, ...)
{
  return _[a1 _elementIndexForDocument];
}

id objc_msgSend__emitCropRectWillBeginChangingMessage(void *a1, const char *a2, ...)
{
  return _[a1 _emitCropRectWillBeginChangingMessage];
}

id objc_msgSend__enableInkingOnAKController_(void *a1, const char *a2, ...)
{
  return [a1 _enableInkingOnAKController];
}

id objc_msgSend__endOpacityEditing(void *a1, const char *a2, ...)
{
  return _[a1 _endOpacityEditing];
}

id objc_msgSend__enumerateAllShadowRectsWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enumerateAllShadowRectsWithBlock:");
}

id objc_msgSend__existingInteractionForWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 _existingInteractionForWindowScene:];
}

id objc_msgSend__exitCrop(void *a1, const char *a2, ...)
{
  return _[a1 _exitCrop];
}

id objc_msgSend__exportVellumPDF(void *a1, const char *a2, ...)
{
  return _[a1 _exportVellumPDF];
}

id objc_msgSend__fetchUserActivityWithUUID_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchUserActivityWithUUID:completionHandler:");
}

id objc_msgSend__findTextViewFirstResponderUnderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findTextViewFirstResponderUnderView:");
}

id objc_msgSend__finishRunPPTServiceRequest_(void *a1, const char *a2, ...)
{
  return [a1 _finishRunPPTServiceRequest:];
}

id objc_msgSend__fontSize(void *a1, const char *a2, ...)
{
  return _[a1 _fontSize];
}

id objc_msgSend__frameForGrabberAtEdge_inSize_dimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForGrabberAtEdge:inSize:dimension:");
}

id objc_msgSend__frameForLineAtEdge_inSize_dimension_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForLineAtEdge:inSize:dimension:");
}

id objc_msgSend__frameForScreenshot_atIndex_numberOfScreenshots_maximumSize_interScreenshotSpacing_rectToCenterAboveKeyboard_state_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForScreenshot:atIndex:numberOfScreenshots:maximumSize:interScreenshotSpacing:rectToCenterAboveKeyboard:state:");
}

id objc_msgSend__frameForViewInCorner_inSize_cornerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_frameForViewInCorner:inSize:cornerSize:");
}

id objc_msgSend__gesturesForMiniatureState(void *a1, const char *a2, ...)
{
  return _[a1 _gesturesForMiniatureState];
}

id objc_msgSend__goToPDFPage_rect_force_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_goToPDFPage:rect:force:");
}

id objc_msgSend__harvestPDFIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _harvestPDFIfNecessary];
}

id objc_msgSend__hasGeneratedPDF(void *a1, const char *a2, ...)
{
  return _[a1 _hasGeneratedPDF];
}

id objc_msgSend__hideAndShowViewsForScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideAndShowViewsForScreenshotEditsSnapshotted:");
}

id objc_msgSend__imageAnalysisAaButtonIfExists(void *a1, const char *a2, ...)
{
  return _[a1 _imageAnalysisAaButtonIfExists];
}

id objc_msgSend__imageIdentifierActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageIdentifierActionInActions:");
}

id objc_msgSend__informRepresentationOfUndoStackChange(void *a1, const char *a2, ...)
{
  return _[a1 _informRepresentationOfUndoStackChange];
}

id objc_msgSend__initGroupWithName_identifier_customizations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initGroupWithName:identifier:customizations:");
}

id objc_msgSend__initWithUserActivityType_dynamicActivityType_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithUserActivityType:dynamicActivityType:options:");
}

id objc_msgSend__interScreenshotSpacing(void *a1, const char *a2, ...)
{
  return _[a1 _interScreenshotSpacing];
}

id objc_msgSend__internalPDFView(void *a1, const char *a2, ...)
{
  return _[a1 _internalPDFView];
}

id objc_msgSend__isAncestorOfFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 _isAncestorOfFirstResponder];
}

id objc_msgSend__isEditingScreenshotImage(void *a1, const char *a2, ...)
{
  return _[a1 _isEditingScreenshotImage];
}

id objc_msgSend__isLandscapePhone(void *a1, const char *a2, ...)
{
  return _[a1 _isLandscapePhone];
}

id objc_msgSend__isPointInsidePaletteView_fromView_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPointInsidePaletteView:fromView:withEvent:");
}

id objc_msgSend__isPortraitPhone(void *a1, const char *a2, ...)
{
  return _[a1 _isPortraitPhone];
}

id objc_msgSend__isShowingPDFScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 _isShowingPDFScreenshot];
}

id objc_msgSend__isTriggeredByInteractiveScreenshotGesture_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isTriggeredByInteractiveScreenshotGesture:");
}

id objc_msgSend__labelAttributedString(void *a1, const char *a2, ...)
{
  return _[a1 _labelAttributedString];
}

id objc_msgSend__labelFont(void *a1, const char *a2, ...)
{
  return _[a1 _labelFont];
}

id objc_msgSend__layoutBounds(void *a1, const char *a2, ...)
{
  return _[a1 _layoutBounds];
}

id objc_msgSend__layoutBoundsForFullPageThumbnail(void *a1, const char *a2, ...)
{
  return _[a1 _layoutBoundsForFullPageThumbnail];
}

id objc_msgSend__layoutOccludingView_viewToCrop_overlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOccludingView:viewToCrop:overlayView:");
}

id objc_msgSend__layoutOccludingViewContainerView_occludingView_scrollViewMaskView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOccludingViewContainerView:occludingView:scrollViewMaskView:");
}

id objc_msgSend__layoutOverlayView_viewToCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutOverlayView:viewToCrop:");
}

id objc_msgSend__layoutPDFViewVerticalContentInsetToMatchImageView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutPDFViewVerticalContentInsetToMatchImageView];
}

id objc_msgSend__layoutScreenshotView_forState_isFirstScreenshot_isCurrentScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScreenshotView:forState:isFirstScreenshot:isCurrentScreenshot:");
}

id objc_msgSend__layoutScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScrollView:");
}

id objc_msgSend__layoutScrollViewContainerView_scrollView_overlayView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutScrollViewContainerView:scrollView:overlayView:");
}

id objc_msgSend__layoutShouldEnableContentSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 _layoutShouldEnableContentSwitcher];
}

id objc_msgSend__layoutShouldShowContentSwitcher(void *a1, const char *a2, ...)
{
  return _[a1 _layoutShouldShowContentSwitcher];
}

id objc_msgSend__layoutShouldShowCroppedContents(void *a1, const char *a2, ...)
{
  return _[a1 _layoutShouldShowCroppedContents];
}

id objc_msgSend__layoutThumbnailView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutThumbnailView];
}

id objc_msgSend__layoutUpdateCropControllers(void *a1, const char *a2, ...)
{
  return _[a1 _layoutUpdateCropControllers];
}

id objc_msgSend__layoutUpdateScrollViewContentLayout_viewToCrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutUpdateScrollViewContentLayout:viewToCrop:");
}

id objc_msgSend__layoutViewToCrop_scrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutViewToCrop:scrollView:");
}

id objc_msgSend__loadUneditedImageIfNecessaryWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadUneditedImageIfNecessaryWithCompletionBlock:");
}

id objc_msgSend__logEditsInScreenshotForAnalytics(void *a1, const char *a2, ...)
{
  return _[a1 _logEditsInScreenshotForAnalytics];
}

id objc_msgSend__markAsBeingEditedForMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_markAsBeingEditedForMode:");
}

id objc_msgSend__markImageAsBeingEdited(void *a1, const char *a2, ...)
{
  return _[a1 _markImageAsBeingEdited];
}

id objc_msgSend__maximumZoomScale(void *a1, const char *a2, ...)
{
  return _[a1 _maximumZoomScale];
}

id objc_msgSend__metadataUpdateActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_metadataUpdateActionInActions:");
}

id objc_msgSend__miniatureInsets(void *a1, const char *a2, ...)
{
  return _[a1 _miniatureInsets];
}

id objc_msgSend__minimumSizeForOverlayViewInUnitSpace(void *a1, const char *a2, ...)
{
  return _[a1 _minimumSizeForOverlayViewInUnitSpace];
}

id objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:");
}

id objc_msgSend__moveDittoRootViewControllerFromViewController_toViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_moveDittoRootViewControllerFromViewController:toViewController:");
}

id objc_msgSend__moveScreenshotsViewForHorizontalSlideOffDismiss(void *a1, const char *a2, ...)
{
  return _[a1 _moveScreenshotsViewForHorizontalSlideOffDismiss];
}

id objc_msgSend__moveToUnitRect_animated_(void *a1, const char *a2, ...)
{
  return [a1 _moveToUnitRect:animated:];
}

id objc_msgSend__noteCurrentPageForSignificantChange(void *a1, const char *a2, ...)
{
  return _[a1 _noteCurrentPageForSignificantChange];
}

id objc_msgSend__numberOfDrawingStrokesInScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfDrawingStrokesInScreenshot];
}

id objc_msgSend__numberOfPages(void *a1, const char *a2, ...)
{
  return _[a1 _numberOfPages];
}

id objc_msgSend__occludingViews(void *a1, const char *a2, ...)
{
  return _[a1 _occludingViews];
}

id objc_msgSend__orderedRectCorners(void *a1, const char *a2, ...)
{
  return _[a1 _orderedRectCorners];
}

id objc_msgSend__orderedRectEdges(void *a1, const char *a2, ...)
{
  return _[a1 _orderedRectEdges];
}

id objc_msgSend__outputImageOnCurrentUneditedImage(void *a1, const char *a2, ...)
{
  return _[a1 _outputImageOnCurrentUneditedImage];
}

id objc_msgSend__outsetAmountForHandles(void *a1, const char *a2, ...)
{
  return _[a1 _outsetAmountForHandles];
}

id objc_msgSend__pageForXOffsetInScrollView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pageForXOffsetInScrollView:");
}

id objc_msgSend__paletteViewVisible(void *a1, const char *a2, ...)
{
  return _[a1 _paletteViewVisible];
}

id objc_msgSend__pdfView(void *a1, const char *a2, ...)
{
  return _[a1 _pdfView];
}

id objc_msgSend__performPostDismissActions(void *a1, const char *a2, ...)
{
  return _[a1 _performPostDismissActions];
}

id objc_msgSend__performPreDismissActionsForAnimationSettings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performPreDismissActionsForAnimationSettings:");
}

id objc_msgSend__peripheryInsets(void *a1, const char *a2, ...)
{
  return _[a1 _peripheryInsets];
}

id objc_msgSend__pileTranslationAmountForDismiss(void *a1, const char *a2, ...)
{
  return _[a1 _pileTranslationAmountForDismiss];
}

id objc_msgSend__pileTranslationIsTowardsEdge(void *a1, const char *a2, ...)
{
  return _[a1 _pileTranslationIsTowardsEdge];
}

id objc_msgSend__pointInsideAnOccludingView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointInsideAnOccludingView:");
}

id objc_msgSend__positionAppearingScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 _positionAppearingScreenshot];
}

id objc_msgSend__positioningIndexForIndex_numberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_positioningIndexForIndex:numberOfScreenshots:");
}

id objc_msgSend__postNotificationForWillChangeToState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postNotificationForWillChangeToState:");
}

id objc_msgSend__pptTestInfos(void *a1, const char *a2, ...)
{
  return _[a1 _pptTestInfos];
}

id objc_msgSend__preferredStatusBarVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _preferredStatusBarVisibility];
}

id objc_msgSend__preheatActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preheatActionInActions:");
}

id objc_msgSend__prepareAKController(void *a1, const char *a2, ...)
{
  return _[a1 _prepareAKController];
}

id objc_msgSend__prepareDragInteractionIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _prepareDragInteractionIfNecessary];
}

id objc_msgSend__prepareGesturesForOverlayController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareGesturesForOverlayController:");
}

id objc_msgSend__prepareGesturesForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_prepareGesturesForState:");
}

id objc_msgSend__prepareImageIdentifierUpdateAlertIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _prepareImageIdentifierUpdateAlertIfNecessary];
}

id objc_msgSend__prepareRootViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _prepareRootViewControllerIfNecessary];
}

id objc_msgSend__presentActivityViewControllerFromBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentActivityViewControllerFromBarButtonItem:");
}

id objc_msgSend__presentImageIdentifierUpdateAlertIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _presentImageIdentifierUpdateAlertIfNecessary];
}

id objc_msgSend__presentUndoRedoAlertControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _presentUndoRedoAlertControllerIfNecessary];
}

id objc_msgSend__printProvider(void *a1, const char *a2, ...)
{
  return _[a1 _printProvider];
}

id objc_msgSend__printedDocument(void *a1, const char *a2, ...)
{
  return _[a1 _printedDocument];
}

id objc_msgSend__progressChanged(void *a1, const char *a2, ...)
{
  return _[a1 _progressChanged];
}

id objc_msgSend__prolongZoomTimerStartingIfNotRunning_(void *a1, const char *a2, ...)
{
  return [a1 _prolongZoomTimerStartingIfNotRunning:];
}

id objc_msgSend__rectInViewSpaceForUnitRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectInViewSpaceForUnitRect:");
}

id objc_msgSend__rectsForShadowView(void *a1, const char *a2, ...)
{
  return _[a1 _rectsForShadowView];
}

id objc_msgSend__redoPushed(void *a1, const char *a2, ...)
{
  return _[a1 _redoPushed];
}

id objc_msgSend__reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reevaluateTrackingForScreenshotWithEnvironmentDescriptionIdentifier:");
}

id objc_msgSend__relevantTraitsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _relevantTraitsDidChange];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__removeHighlightedModeForScreenshotViewIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeHighlightedModeForScreenshotViewIfNecessary:");
}

id objc_msgSend__removePDFNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _removePDFNotifications];
}

id objc_msgSend__removeSecurityScopedURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removeSecurityScopedURL:");
}

id objc_msgSend__removeURL_(void *a1, const char *a2, ...)
{
  return [a1 _removeURL:];
}

id objc_msgSend__resumeHighQualityQueueIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _resumeHighQualityQueueIfNecessary];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__runPPTNamed_numberOfRequiredScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTNamed:numberOfRequiredScreenshots:");
}

id objc_msgSend__runPPTServiceRequestForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTServiceRequestForScreenshot:");
}

id objc_msgSend__runPPTServiceRequestForScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runPPTServiceRequestForScreenshots:");
}

id objc_msgSend__sanitizedFilenameString_(void *a1, const char *a2, ...)
{
  return [a1 _sanitizedFilenameString];
}

id objc_msgSend__saveImageForSysdiagnose_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveImageForSysdiagnose:");
}

id objc_msgSend__saveImages_toQuickNoteWithDismissalCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveImages:toQuickNoteWithDismissalCompletionBlock:");
}

id objc_msgSend__savePDFToPhotosPushed(void *a1, const char *a2, ...)
{
  return _[a1 _savePDFToPhotosPushed];
}

id objc_msgSend__savePDFToTemporaryPathWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePDFToTemporaryPathWithData:");
}

id objc_msgSend__saveToFilesPushed_savePDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveToFilesPushed:savePDF:");
}

id objc_msgSend__saveToQuickNotePushed_savePDF_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_saveToQuickNotePushed:savePDF:");
}

id objc_msgSend__scaleAmountForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaleAmountForState:");
}

id objc_msgSend__scaledAndCenteredRect_withinRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaledAndCenteredRect:withinRect:");
}

id objc_msgSend__scheduleHideCachedOverlayViewWithDelay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleHideCachedOverlayViewWithDelay:");
}

id objc_msgSend__screenshotActionInActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotActionInActions:");
}

id objc_msgSend__screenshotEditsShouldBeSnapshottedForCurrentScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotEditsShouldBeSnapshottedForCurrentScreenshot];
}

id objc_msgSend__screenshotForDragItem_(void *a1, const char *a2, ...)
{
  return [a1 _screenshotForDragItem:];
}

id objc_msgSend__screenshotGestureTriggered_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotGestureTriggered:");
}

id objc_msgSend__screenshotIsBeingRemoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotIsBeingRemoved:");
}

id objc_msgSend__screenshotIsGoingAway_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotIsGoingAway:");
}

id objc_msgSend__screenshotMaximumSize(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotMaximumSize];
}

id objc_msgSend__screenshotViewForDragItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotViewForDragItem:");
}

id objc_msgSend__screenshotViewForScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotViewForScreenshot:");
}

id objc_msgSend__screenshotWasTakenFromScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotWasTakenFromScreenshots];
}

id objc_msgSend__screenshotWithEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 _screenshotWithEnvironmentDescriptionIdentifier:];
}

id objc_msgSend__screenshotWithEnvironmentElementWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_screenshotWithEnvironmentElementWithIdentifier:");
}

id objc_msgSend__screenshotsEligibleForSharing(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotsEligibleForSharing];
}

id objc_msgSend__screenshotsView(void *a1, const char *a2, ...)
{
  return _[a1 _screenshotsView];
}

id objc_msgSend__scrollContentInsets(void *a1, const char *a2, ...)
{
  return _[a1 _scrollContentInsets];
}

id objc_msgSend__scrollContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _scrollContentSize];
}

id objc_msgSend__scrollToPage_animated_(void *a1, const char *a2, ...)
{
  return [a1 _scrollToPage:animated:];
}

id objc_msgSend__scrollViewIsInLiveUserEvent(void *a1, const char *a2, ...)
{
  return _[a1 _scrollViewIsInLiveUserEvent];
}

id objc_msgSend__scrollViewRectForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scrollViewRectForPage:");
}

id objc_msgSend__scrollViewTerminalUserEventOccurred(void *a1, const char *a2, ...)
{
  return _[a1 _scrollViewTerminalUserEventOccurred];
}

id objc_msgSend__sendEvent_block_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendEvent:block:");
}

id objc_msgSend__sendToDeveloper(void *a1, const char *a2, ...)
{
  return _[a1 _sendToDeveloper];
}

id objc_msgSend__setAllowsPointerDragBeforeLiftDelay_(void *a1, const char *a2, ...)
{
  return [a1 _setAllowsPointerDragBeforeLiftDelay:];
}

id objc_msgSend__setAutoScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setAutoScrollEnabled:];
}

id objc_msgSend__setBottomPalette_(void *a1, const char *a2, ...)
{
  return [a1 _setBottomPalette:];
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 _setCornerRadius:];
}

id objc_msgSend__setCropRect_notify_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCropRect:notify:");
}

id objc_msgSend__setDocumentIsSaving_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDocumentIsSaving:");
}

id objc_msgSend__setFlexible_(void *a1, const char *a2, ...)
{
  return [a1 _setFlexible:];
}

id objc_msgSend__setIgnoreBarButtonItemSiblings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIgnoreBarButtonItemSiblings:");
}

id objc_msgSend__setLiftDelay_(void *a1, const char *a2, ...)
{
  return [a1 _setLiftDelay:];
}

id objc_msgSend__setMiniPaletteVisible_hoverLocation_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setMiniPaletteVisible:hoverLocation:inView:");
}

id objc_msgSend__setModelModificationDictionary_createUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setModelModificationDictionary:createUndoCommand:");
}

id objc_msgSend__setOptions_(void *a1, const char *a2, ...)
{
  return [a1 _setOptions:];
}

id objc_msgSend__setSecondaryActionsProvider_(void *a1, const char *a2, ...)
{
  return [a1 _setSecondaryActionsProvider:];
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setUpDevelopmentUI(void *a1, const char *a2, ...)
{
  return _[a1 _setUpDevelopmentUI];
}

id objc_msgSend__setZoomFeedbackGenerator_(void *a1, const char *a2, ...)
{
  return [a1 _setZoomFeedbackGenerator:];
}

id objc_msgSend__setupPDFNotificationsIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 _setupPDFNotificationsIfPossible];
}

id objc_msgSend__setupPaletteIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _setupPaletteIfNecessary];
}

id objc_msgSend__shapeLayer(void *a1, const char *a2, ...)
{
  return _[a1 _shapeLayer];
}

id objc_msgSend__shapeLayerPathForProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shapeLayerPathForProgress:");
}

id objc_msgSend__sharableItemForActivityType_screenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sharableItemForActivityType:screenshot:");
}

id objc_msgSend__shouldAvoidKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 _shouldAvoidKeyboard];
}

id objc_msgSend__shouldBleedToBottom(void *a1, const char *a2, ...)
{
  return _[a1 _shouldBleedToBottom];
}

id objc_msgSend__shouldConfigureDragInteraction(void *a1, const char *a2, ...)
{
  return _[a1 _shouldConfigureDragInteraction];
}

id objc_msgSend__shouldExtendBottomBarForPageDots(void *a1, const char *a2, ...)
{
  return _[a1 _shouldExtendBottomBarForPageDots];
}

id objc_msgSend__shouldHandleKeyboardNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldHandleKeyboardNotification:");
}

id objc_msgSend__shouldSendToDeveloper(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSendToDeveloper];
}

id objc_msgSend__shouldSetUpDevelopmentUI(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSetUpDevelopmentUI];
}

id objc_msgSend__shouldShowBottomBar(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowBottomBar];
}

id objc_msgSend__shouldShowScreenshotViewAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowScreenshotViewAtIndex:");
}

id objc_msgSend__showAllScreenshotsForNumberOfScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAllScreenshotsForNumberOfScreenshots:");
}

id objc_msgSend__significantTimerEventOccured(void *a1, const char *a2, ...)
{
  return _[a1 _significantTimerEventOccured];
}

id objc_msgSend__simulateScrollWithTranslation_duration_willBeginDragging_didEndDragging_willBeginDecelerating_didEndDecelerating_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_simulateScrollWithTranslation:duration:willBeginDragging:didEndDragging:willBeginDecelerating:didEndDecelerating:");
}

id objc_msgSend__sss_cropItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_cropItemWithTarget:action:");
}

id objc_msgSend__sss_imageFromScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_imageFromScreenshot:");
}

id objc_msgSend__sss_redoItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_redoItemWithTarget:action:");
}

id objc_msgSend__sss_shareItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_shareItemWithTarget:action:");
}

id objc_msgSend__sss_trashItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_trashItemWithTarget:action:");
}

id objc_msgSend__sss_undoItemWithTarget_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sss_undoItemWithTarget:action:");
}

id objc_msgSend__startDragging(void *a1, const char *a2, ...)
{
  return _[a1 _startDragging];
}

id objc_msgSend__startRunPPTServiceRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startRunPPTServiceRequest:");
}

id objc_msgSend__stateDescription(void *a1, const char *a2, ...)
{
  return _[a1 _stateDescription];
}

id objc_msgSend__statisticsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _statisticsEnabled];
}

id objc_msgSend__stitchPageImages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stitchPageImages:");
}

id objc_msgSend__stopDraggingDismissing_(void *a1, const char *a2, ...)
{
  return [a1 _stopDraggingDismissing];
}

id objc_msgSend__stopFlash(void *a1, const char *a2, ...)
{
  return _[a1 _stopFlash];
}

id objc_msgSend__systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:];
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:withConfiguration:];
}

id objc_msgSend__thumbnailTrayWidth(void *a1, const char *a2, ...)
{
  return _[a1 _thumbnailTrayWidth];
}

id objc_msgSend__timerShouldBeRunning(void *a1, const char *a2, ...)
{
  return _[a1 _timerShouldBeRunning];
}

id objc_msgSend__toolPickerHeightOnPhone(void *a1, const char *a2, ...)
{
  return _[a1 _toolPickerHeightOnPhone];
}

id objc_msgSend__trackingChanged(void *a1, const char *a2, ...)
{
  return _[a1 _trackingChanged];
}

id objc_msgSend__transformForState_(void *a1, const char *a2, ...)
{
  return [a1 _transformForState:];
}

id objc_msgSend__transformToConvertFromRect_toRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformToConvertFromRect:toRect:");
}

id objc_msgSend__transformToConvertToRect_fromRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformToConvertToRect:fromRect:");
}

id objc_msgSend__transitionToStateIfNecessaryFromEnvironmentDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transitionToStateIfNecessaryFromEnvironmentDescription:completion:");
}

id objc_msgSend__translationAmountForState_pileTranslation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_translationAmountForState:pileTranslation:");
}

id objc_msgSend__triggerTypeForPresentationMode_(void *a1, const char *a2, ...)
{
  return [a1 _triggerTypeForPresentationMode:];
}

id objc_msgSend__undoPushed(void *a1, const char *a2, ...)
{
  return _[a1 _undoPushed];
}

id objc_msgSend__undoableModelChangePrequel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undoableModelChangePrequel:");
}

id objc_msgSend__undoableModelChangeSequel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_undoableModelChangeSequel:");
}

id objc_msgSend__updateActiveScreenshotViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _updateActiveScreenshotViewIfNecessary];
}

id objc_msgSend__updateActivityItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateActivityItems:");
}

id objc_msgSend__updateActivityViewController(void *a1, const char *a2, ...)
{
  return _[a1 _updateActivityViewController];
}

id objc_msgSend__updateActivityViewControllerNeedsActivityUpdate_(void *a1, const char *a2, ...)
{
  return [a1 _updateActivityViewControllerNeedsActivityUpdate:];
}

id objc_msgSend__updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnalysisButtonAndInstructionLabelOpacityIfNecessaryAnimated:");
}

id objc_msgSend__updateAnnotations(void *a1, const char *a2, ...)
{
  return _[a1 _updateAnnotations];
}

id objc_msgSend__updateAnnotationsCreateUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnotationsCreateUndoCommand:");
}

id objc_msgSend__updateAnnotationsForViewState_createUndoCommand_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateAnnotationsForViewState:createUndoCommand:");
}

id objc_msgSend__updateBarButtonItemPositionsAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateBarButtonItemPositionsAnimated:");
}

id objc_msgSend__updateDisplayedPage(void *a1, const char *a2, ...)
{
  return _[a1 _updateDisplayedPage];
}

id objc_msgSend__updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _updateDisplayedProgressTowardsReceivingAllImageIdentifierUpdates];
}

id objc_msgSend__updateDragInteraction(void *a1, const char *a2, ...)
{
  return _[a1 _updateDragInteraction];
}

id objc_msgSend__updateFirstResponderForHidingToolPicker(void *a1, const char *a2, ...)
{
  return _[a1 _updateFirstResponderForHidingToolPicker];
}

id objc_msgSend__updateForCurrentSize(void *a1, const char *a2, ...)
{
  return _[a1 _updateForCurrentSize];
}

id objc_msgSend__updateForScrollViewLiveUserEvent(void *a1, const char *a2, ...)
{
  return _[a1 _updateForScrollViewLiveUserEvent];
}

id objc_msgSend__updateForScrollViewNonLiveUserEvent(void *a1, const char *a2, ...)
{
  return _[a1 _updateForScrollViewNonLiveUserEvent];
}

id objc_msgSend__updateForSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateForSize:");
}

id objc_msgSend__updateGestureDependencyPriority(void *a1, const char *a2, ...)
{
  return _[a1 _updateGestureDependencyPriority];
}

id objc_msgSend__updateGestures(void *a1, const char *a2, ...)
{
  return _[a1 _updateGestures];
}

id objc_msgSend__updateInstructionLabelIfNecessaryAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateInstructionLabelIfNecessaryAnimated:");
}

id objc_msgSend__updateItemProvidersWithOptions(void *a1, const char *a2, ...)
{
  return _[a1 _updateItemProvidersWithOptions];
}

id objc_msgSend__updateLastScrollViewUnitRect(void *a1, const char *a2, ...)
{
  return _[a1 _updateLastScrollViewUnitRect];
}

id objc_msgSend__updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateOverlayControllerForBeingActiveForScreenshotEditsSnapshotted:");
}

id objc_msgSend__updatePaletteVisibilityIfNecessary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePaletteVisibilityIfNecessary:");
}

id objc_msgSend__updatePropertiesOnManagedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _updatePropertiesOnManagedSubviews];
}

id objc_msgSend__updateScreenshotCount(void *a1, const char *a2, ...)
{
  return _[a1 _updateScreenshotCount];
}

id objc_msgSend__updateScreenshotsViewTransform(void *a1, const char *a2, ...)
{
  return _[a1 _updateScreenshotsViewTransform];
}

id objc_msgSend__updateScrollPositionForCurrentPage(void *a1, const char *a2, ...)
{
  return _[a1 _updateScrollPositionForCurrentPage];
}

id objc_msgSend__updateScrollViewZoomScaleEndpoints(void *a1, const char *a2, ...)
{
  return _[a1 _updateScrollViewZoomScaleEndpoints];
}

id objc_msgSend__updateShadowViewAlpha(void *a1, const char *a2, ...)
{
  return _[a1 _updateShadowViewAlpha];
}

id objc_msgSend__updateSubviewOrdering(void *a1, const char *a2, ...)
{
  return _[a1 _updateSubviewOrdering];
}

id objc_msgSend__updateThumbnailViewVisibilityIfNeededAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateThumbnailViewVisibilityIfNeededAnimated:");
}

id objc_msgSend__updateTopBarProperties(void *a1, const char *a2, ...)
{
  return _[a1 _updateTopBarProperties];
}

id objc_msgSend__updateUndoRedoEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 _updateUndoRedoEnabledState];
}

id objc_msgSend__updateVisualSearchCornerViewPositioning(void *a1, const char *a2, ...)
{
  return _[a1 _updateVisualSearchCornerViewPositioning];
}

id objc_msgSend__viewForPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewForPage:");
}

id objc_msgSend__viewState(void *a1, const char *a2, ...)
{
  return _[a1 _viewState];
}

id objc_msgSend__viewsToHitTest(void *a1, const char *a2, ...)
{
  return _[a1 _viewsToHitTest];
}

id objc_msgSend__visionKitActivityItemIfAvailble(void *a1, const char *a2, ...)
{
  return _[a1 _visionKitActivityItemIfAvailble];
}

id objc_msgSend__visualSearchCornerViewIfExists(void *a1, const char *a2, ...)
{
  return _[a1 _visualSearchCornerViewIfExists];
}

id objc_msgSend__waitingContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _waitingContentViewController];
}

id objc_msgSend__webViewPrintFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _webViewPrintFormatter];
}

id objc_msgSend__wk_pageCountForPrintFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wk_pageCountForPrintFormatter:");
}

id objc_msgSend__wk_requestDocumentForPrintFormatter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wk_requestDocumentForPrintFormatter:");
}

id objc_msgSend__zoomTimerRunning(void *a1, const char *a2, ...)
{
  return _[a1 _zoomTimerRunning];
}

id objc_msgSend__zoomToRectWithinContentInsetBounds_scrollView_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_zoomToRectWithinContentInsetBounds:scrollView:animated:");
}

id objc_msgSend_aaButtonPressed_(void *a1, const char *a2, ...)
{
  return [a1 aaButtonPressed:];
}

id objc_msgSend_aaModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 aaModeEnabled];
}

id objc_msgSend_acceptsTouches(void *a1, const char *a2, ...)
{
  return _[a1 acceptsTouches];
}

id objc_msgSend_actionWithTitle_image_identifier_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:image:identifier:handler:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_active(void *a1, const char *a2, ...)
{
  return _[a1 active];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeScreenshotView(void *a1, const char *a2, ...)
{
  return _[a1 activeScreenshotView];
}

id objc_msgSend_activeScreenshotViewDidChangeToView_fromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeScreenshotViewDidChangeToView:fromView:");
}

id objc_msgSend_activeToolPickerForWindow_(void *a1, const char *a2, ...)
{
  return [a1 activeToolPickerForWindow:];
}

id objc_msgSend_activityItemProviders(void *a1, const char *a2, ...)
{
  return _[a1 activityItemProviders];
}

id objc_msgSend_activityItems(void *a1, const char *a2, ...)
{
  return _[a1 activityItems];
}

id objc_msgSend_activityItemsChangedForScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activityItemsChangedForScreenshotsView:");
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return _[a1 activityType];
}

id objc_msgSend_activityTypeOrder(void *a1, const char *a2, ...)
{
  return _[a1 activityTypeOrder];
}

id objc_msgSend_activityViewController(void *a1, const char *a2, ...)
{
  return _[a1 activityViewController];
}

id objc_msgSend_activityViewControllerDismissedFromScreenshotsViewController_(void *a1, const char *a2, ...)
{
  return [a1 activityViewControllerDismissedFromScreenshotsViewController:];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return [a1 addAnimations:];
}

id objc_msgSend_addArcWithCenter_radius_startAngle_endAngle_clockwise_(void *a1, const char *a2, ...)
{
  return [a1 addArcWithCenter:radius:startAngle:endAngle:clockwise:];
}

id objc_msgSend_addAttributes_range_(void *a1, const char *a2, ...)
{
  return [a1 addAttributes:range:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return [a1 addCompletion:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addImageIdentifierUpdateObserver_(void *a1, const char *a2, ...)
{
  return [a1 addImageIdentifierUpdateObserver];
}

id objc_msgSend_addInteraction_(void *a1, const char *a2, ...)
{
  return [a1 addInteraction:];
}

id objc_msgSend_addKeyframeWithRelativeStartTime_relativeDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 addKeyframeWithRelativeStartTime:relativeStartTime:relativeDuration:animations:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_forKeyPath_options_context_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:forKeyPath:options:context:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOrRemoveAAButtonIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 addOrRemoveAAButtonIfNecessary];
}

id objc_msgSend_addOrRemoveActionInfoViewIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 addOrRemoveActionInfoViewIfNecessary];
}

id objc_msgSend_addScreenshot_completion_(void *a1, const char *a2, ...)
{
  return [a1 addScreenshot:completion:];
}

id objc_msgSend_addScreenshotToGroup_(void *a1, const char *a2, ...)
{
  return [a1 addScreenshotToGroup];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forEvents:];
}

id objc_msgSend_addToRunLoop_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addToRunLoop:forMode:];
}

id objc_msgSend_adjustPDFPositioningToMatchImageIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 adjustPDFPositioningToMatchImageIfNecessary];
}

id objc_msgSend_adjustedTranslationForProposedRect_originalRect_scaledContentViewBounds_(void *a1, const char *a2, ...)
{
  return [a1 adjustedTranslationForProposedRect:originalRect:scaledContentViewBounds:];
}

id objc_msgSend_advanceScrollOffset(void *a1, const char *a2, ...)
{
  return _[a1 advanceScrollOffset];
}

id objc_msgSend_akController(void *a1, const char *a2, ...)
{
  return _[a1 akController];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allowsBackdropGroups(void *a1, const char *a2, ...)
{
  return _[a1 allowsBackdropGroups];
}

id objc_msgSend_analysis(void *a1, const char *a2, ...)
{
  return _[a1 analysis];
}

id objc_msgSend_analysisBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 analysisBarButtonItem];
}

id objc_msgSend_analysisButton(void *a1, const char *a2, ...)
{
  return _[a1 analysisButton];
}

id objc_msgSend_analysisButtonImageForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 analysisButtonImageForCurrentState];
}

id objc_msgSend_analysisButtonPressed_(void *a1, const char *a2, ...)
{
  return [a1 analysisButtonPressed:];
}

id objc_msgSend_analysisHelperQueue(void *a1, const char *a2, ...)
{
  return _[a1 analysisHelperQueue];
}

id objc_msgSend_analysisModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 analysisModeEnabled];
}

id objc_msgSend_analysisRequestID(void *a1, const char *a2, ...)
{
  return _[a1 analysisRequestID];
}

id objc_msgSend_analyzeCurrentImageIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 analyzeCurrentImageIfNecessary];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateKeyframesWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateKeyframesWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_animateWithDuration_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:");
}

id objc_msgSend_animationOptions(void *a1, const char *a2, ...)
{
  return _[a1 animationOptions];
}

id objc_msgSend_animationReason(void *a1, const char *a2, ...)
{
  return _[a1 animationReason];
}

id objc_msgSend_animationUsingParametersForKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationUsingParametersForKeyPath:];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_annotationController(void *a1, const char *a2, ...)
{
  return _[a1 annotationController];
}

id objc_msgSend_annotationDataFromAnnotations_(void *a1, const char *a2, ...)
{
  return [a1 annotationDataFromAnnotations:];
}

id objc_msgSend_annotationKitController(void *a1, const char *a2, ...)
{
  return _[a1 annotationKitController];
}

id objc_msgSend_annotationModeEnabled(void *a1, const char *a2, ...)
{
  return _[a1 annotationModeEnabled];
}

id objc_msgSend_annotationNSDatas(void *a1, const char *a2, ...)
{
  return _[a1 annotationNSDatas];
}

id objc_msgSend_annotationOverlayView(void *a1, const char *a2, ...)
{
  return _[a1 annotationOverlayView];
}

id objc_msgSend_annotationWithData_(void *a1, const char *a2, ...)
{
  return [a1 annotationWithData:];
}

id objc_msgSend_annotations(void *a1, const char *a2, ...)
{
  return _[a1 annotations];
}

id objc_msgSend_annotationsDidChange(void *a1, const char *a2, ...)
{
  return _[a1 annotationsDidChange];
}

id objc_msgSend_annotationsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 annotationsEnabled];
}

id objc_msgSend_annotationsFromAnnotationData_(void *a1, const char *a2, ...)
{
  return [a1 annotationsFromAnnotationData:];
}

id objc_msgSend_appendAttributedString_(void *a1, const char *a2, ...)
{
  return [a1 appendAttributedString:];
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return [a1 appendFormat:];
}

id objc_msgSend_appendPath_(void *a1, const char *a2, ...)
{
  return [a1 appendPath:];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_appleInternalOptions(void *a1, const char *a2, ...)
{
  return _[a1 appleInternalOptions];
}

id objc_msgSend_applyTransform_(void *a1, const char *a2, ...)
{
  return [a1 applyTransform:];
}

id objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(void *a1, const char *a2, ...)
{
  return [a1 archivedDataWithRootObject:requiringSecureCoding:error:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayByAddingObjectsFromArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithContentsOfFile:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_asImage(void *a1, const char *a2, ...)
{
  return _[a1 asImage];
}

id objc_msgSend_assetMetadata(void *a1, const char *a2, ...)
{
  return _[a1 assetMetadata];
}

id objc_msgSend_associateScreenshotImages_(void *a1, const char *a2, ...)
{
  return [a1 associateScreenshotImages:];
}

id objc_msgSend_availableRectForFullscreenContent_layoutBounds_bleedToBottom_topBarHeight_bottomBarHeight_userInterfaceIdiom_multipleScreenshots_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:");
}

id objc_msgSend_backgroundBlurEffectStyle(void *a1, const char *a2, ...)
{
  return _[a1 backgroundBlurEffectStyle];
}

id objc_msgSend_backingImage(void *a1, const char *a2, ...)
{
  return _[a1 backingImage];
}

id objc_msgSend_barSeparatorSize(void *a1, const char *a2, ...)
{
  return _[a1 barSeparatorSize];
}

id objc_msgSend_becomeCurrent(void *a1, const char *a2, ...)
{
  return _[a1 becomeCurrent];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_becomeParentOfDittoRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 becomeParentOfDittoRootViewController];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_beginLogging_documentType_(void *a1, const char *a2, ...)
{
  return [a1 beginLogging:documentType:];
}

id objc_msgSend_betaApplicationBundleID(void *a1, const char *a2, ...)
{
  return _[a1 betaApplicationBundleID];
}

id objc_msgSend_betaApplicationName(void *a1, const char *a2, ...)
{
  return _[a1 betaApplicationName];
}

id objc_msgSend_bezierPath(void *a1, const char *a2, ...)
{
  return _[a1 bezierPath];
}

id objc_msgSend_bezierPathWithCGPath_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithCGPath:];
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRect:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_block(void *a1, const char *a2, ...)
{
  return _[a1 block];
}

id objc_msgSend_blockToRunForAddScreenshotsButton(void *a1, const char *a2, ...)
{
  return _[a1 blockToRunForAddScreenshotsButton];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return _[a1 blueColor];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_borderColor(void *a1, const char *a2, ...)
{
  return _[a1 borderColor];
}

id objc_msgSend_borderStyle(void *a1, const char *a2, ...)
{
  return _[a1 borderStyle];
}

id objc_msgSend_borderWidth(void *a1, const char *a2, ...)
{
  return _[a1 borderWidth];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_boundsForBox_(void *a1, const char *a2, ...)
{
  return [a1 boundsForBox:];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedCGImageBackedUneditedImageForUI(void *a1, const char *a2, ...)
{
  return _[a1 cachedCGImageBackedUneditedImageForUI];
}

id objc_msgSend_cachedOutputImageView(void *a1, const char *a2, ...)
{
  return _[a1 cachedOutputImageView];
}

id objc_msgSend_calendarWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 calendarWithIdentifier:];
}

id objc_msgSend_canAutosaveToFiles(void *a1, const char *a2, ...)
{
  return _[a1 canAutosaveToFiles];
}

id objc_msgSend_canGenerateDocument(void *a1, const char *a2, ...)
{
  return _[a1 canGenerateDocument];
}

id objc_msgSend_canRedo(void *a1, const char *a2, ...)
{
  return _[a1 canRedo];
}

id objc_msgSend_canRedoForViewState_(void *a1, const char *a2, ...)
{
  return [a1 canRedoForViewState:];
}

id objc_msgSend_canUndo(void *a1, const char *a2, ...)
{
  return _[a1 canUndo];
}

id objc_msgSend_canUndoForViewState_(void *a1, const char *a2, ...)
{
  return [a1 canUndoForViewState:];
}

id objc_msgSend_cancelCrop(void *a1, const char *a2, ...)
{
  return _[a1 cancelCrop];
}

id objc_msgSend_cancelRequestID_(void *a1, const char *a2, ...)
{
  return [a1 cancelRequestID:];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_changeObserver(void *a1, const char *a2, ...)
{
  return _[a1 changeObserver];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_cleanupRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 cleanupRootViewController];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearImageAnalysisTextSelection(void *a1, const char *a2, ...)
{
  return _[a1 clearImageAnalysisTextSelection];
}

id objc_msgSend_closePath(void *a1, const char *a2, ...)
{
  return _[a1 closePath];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return _[a1 color];
}

id objc_msgSend_colorAlpha(void *a1, const char *a2, ...)
{
  return _[a1 colorAlpha];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithCGColor_(void *a1, const char *a2, ...)
{
  return [a1 colorWithCGColor:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_commandWithTitle_image_action_propertyList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "commandWithTitle:image:action:propertyList:");
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitEditing(void *a1, const char *a2, ...)
{
  return _[a1 commitEditing];
}

id objc_msgSend_commitInflightEdits(void *a1, const char *a2, ...)
{
  return _[a1 commitInflightEdits];
}

id objc_msgSend_commitInflightEditsIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 commitInflightEditsIfNecessary];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithScale:];
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithTextStyle:scale:];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:constant:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_constraintLessThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToConstant:];
}

id objc_msgSend_containerViewController_didTransitionToState_(void *a1, const char *a2, ...)
{
  return [a1 containerViewController:didTransitionToState:];
}

id objc_msgSend_containerViewController_willBeginDismissAnimationWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 containerViewController:willBeginDismissAnimationWithSettings:];
}

id objc_msgSend_containerViewController_willShowSharingUIWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 containerViewController:willShowSharingUIWithBlock:];
}

id objc_msgSend_containerViewController_willShowTestFlightUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewController:willShowTestFlightUIWithBlock:");
}

id objc_msgSend_containerViewController_willTransitionToState_animated_changeBlock_(void *a1, const char *a2, ...)
{
  return [a1 containerViewController:willTransitionToState:animated:changeBlock:];
}

id objc_msgSend_containerViewControllerBeganDragAndDrop_(void *a1, const char *a2, ...)
{
  return [a1 containerViewControllerBeganDragAndDrop:];
}

id objc_msgSend_containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerBeganShowingWaitingForImageIdentifierUpdatesUI:");
}

id objc_msgSend_containerViewControllerDidEndDismissAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerDidEndDismissAnimation:");
}

id objc_msgSend_containerViewControllerEndedDragAndDrop_shouldDismiss_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerEndedDragAndDrop:shouldDismiss:");
}

id objc_msgSend_containerViewControllerEndedShowingSharingUI_inStateTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerEndedShowingSharingUI:inStateTransition:");
}

id objc_msgSend_containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI_(void *a1, const char *a2, ...)
{
  return [a1 containerViewControllerEndedShowingWaitingForImageIdentifierUpdatesUI];
}

id objc_msgSend_containerViewControllerHadGestureInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerViewControllerHadGestureInteraction:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsView_(void *a1, const char *a2, ...)
{
  return [a1 containsView:];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return _[a1 contentInset];
}

id objc_msgSend_contentInsetRect(void *a1, const char *a2, ...)
{
  return _[a1 contentInsetRect];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return _[a1 contentOffset];
}

id objc_msgSend_contentRects(void *a1, const char *a2, ...)
{
  return _[a1 contentRects];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 contentSnapshot];
}

id objc_msgSend_contentSwitcherPadding(void *a1, const char *a2, ...)
{
  return _[a1 contentSwitcherPadding];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_controllerWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 controllerWithDelegate:];
}

id objc_msgSend_convertPoint_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:fromCoordinateSpace:];
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:fromView:];
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:toView:];
}

id objc_msgSend_convertRect_fromCoordinateSpace_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromCoordinateSpace:];
}

id objc_msgSend_convertRect_fromPage_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromPage:];
}

id objc_msgSend_convertRect_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromView:];
}

id objc_msgSend_convertRect_fromWindow_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:fromWindow:];
}

id objc_msgSend_convertRect_toCoordinateSpace_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toCoordinateSpace:];
}

id objc_msgSend_convertRect_toView_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toView:];
}

id objc_msgSend_convertRect_toWindow_(void *a1, const char *a2, ...)
{
  return [a1 convertRect:toWindow:];
}

id objc_msgSend_convertRectToPageViewSpace_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertRectToPageViewSpace:fromView:];
}

id objc_msgSend_convertSize_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertSize:fromView:];
}

id objc_msgSend_coordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 coordinateSpace];
}

id objc_msgSend_coordinateWritingItemAtURL_options_error_byAccessor_(void *a1, const char *a2, ...)
{
  return [a1 coordinateWritingItemAtURL:options:error:byAccessor:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_corner(void *a1, const char *a2, ...)
{
  return _[a1 corner];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_countOfDataDetectorsWithTypes_(void *a1, const char *a2, ...)
{
  return [a1 countOfDataDetectorsWithTypes:];
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return [a1 createDirectoryAtPath:withIntermediateDirectories:attributes:error:];
}

id objc_msgSend_createDittoRootViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 createDittoRootViewControllerIfNecessary];
}

id objc_msgSend_createFeedbackViewControllerForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 createFeedbackViewControllerForCurrentState];
}

id objc_msgSend_createFixedSpaceBarButtonItemWithWidth_(void *a1, const char *a2, ...)
{
  return [a1 createFixedSpaceBarButtonItemWithWidth:];
}

id objc_msgSend_createMiniMapView(void *a1, const char *a2, ...)
{
  return _[a1 createMiniMapView];
}

id objc_msgSend_createScreenshotWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return [a1 createScreenshotWithEnvironmentDescription:];
}

id objc_msgSend_createThumbnailView(void *a1, const char *a2, ...)
{
  return _[a1 createThumbnailView];
}

id objc_msgSend_createUndoMenu(void *a1, const char *a2, ...)
{
  return _[a1 createUndoMenu];
}

id objc_msgSend_cropController_changedToCropRect_(void *a1, const char *a2, ...)
{
  return [a1 cropController:changedToCropRect:];
}

id objc_msgSend_cropControllerCropRectDidChange_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerCropRectDidChange];
}

id objc_msgSend_cropControllerDidBeginCropping_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerDidBeginCropping:];
}

id objc_msgSend_cropControllerDidUpdateScrollView_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerDidUpdateScrollView:];
}

id objc_msgSend_cropControllerDidZoomInScrollView_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerDidZoomInScrollView:];
}

id objc_msgSend_cropControllerRootView_changedToCropRect_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerRootView:changedToCropRect:];
}

id objc_msgSend_cropControllerRootViewWillBeginChangingCropRect_(void *a1, const char *a2, ...)
{
  return [a1 cropControllerRootViewWillBeginChangingCropRect:];
}

id objc_msgSend_cropDidChangeForScreenshotView_(void *a1, const char *a2, ...)
{
  return [a1 cropDidChangeForScreenshotView:];
}

id objc_msgSend_cropEnabled(void *a1, const char *a2, ...)
{
  return _[a1 cropEnabled];
}

id objc_msgSend_cropHandle(void *a1, const char *a2, ...)
{
  return _[a1 cropHandle];
}

id objc_msgSend_cropHandlesFadedOut(void *a1, const char *a2, ...)
{
  return _[a1 cropHandlesFadedOut];
}

id objc_msgSend_cropInfo(void *a1, const char *a2, ...)
{
  return _[a1 cropInfo];
}

id objc_msgSend_cropOverlayViewRectInWindow(void *a1, const char *a2, ...)
{
  return _[a1 cropOverlayViewRectInWindow];
}

id objc_msgSend_cropRect(void *a1, const char *a2, ...)
{
  return _[a1 cropRect];
}

id objc_msgSend_cropView(void *a1, const char *a2, ...)
{
  return _[a1 cropView];
}

id objc_msgSend_currentCropController(void *a1, const char *a2, ...)
{
  return _[a1 currentCropController];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentImageAnalysis(void *a1, const char *a2, ...)
{
  return _[a1 currentImageAnalysis];
}

id objc_msgSend_currentInProcessRequestID(void *a1, const char *a2, ...)
{
  return _[a1 currentInProcessRequestID];
}

id objc_msgSend_currentLiveTextBarButtonItemIfExists(void *a1, const char *a2, ...)
{
  return _[a1 currentLiveTextBarButtonItemIfExists];
}

id objc_msgSend_currentPDFPage(void *a1, const char *a2, ...)
{
  return _[a1 currentPDFPage];
}

id objc_msgSend_currentPDFView(void *a1, const char *a2, ...)
{
  return _[a1 currentPDFView];
}

id objc_msgSend_currentPage(void *a1, const char *a2, ...)
{
  return _[a1 currentPage];
}

id objc_msgSend_currentScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 currentScreenshot];
}

id objc_msgSend_currentScreenshotCropHandlesFadedOut(void *a1, const char *a2, ...)
{
  return _[a1 currentScreenshotCropHandlesFadedOut];
}

id objc_msgSend_currentScreenshotView(void *a1, const char *a2, ...)
{
  return _[a1 currentScreenshotView];
}

id objc_msgSend_currentView(void *a1, const char *a2, ...)
{
  return _[a1 currentView];
}

id objc_msgSend_customLayoutActionInfoView(void *a1, const char *a2, ...)
{
  return _[a1 customLayoutActionInfoView];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 darkGrayColor];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dataRepresentation];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateFormatFromTemplate_options_locale_(void *a1, const char *a2, ...)
{
  return [a1 dateFormatFromTemplate:options:locale:];
}

id objc_msgSend_debugView(void *a1, const char *a2, ...)
{
  return _[a1 debugView];
}

id objc_msgSend_defaultBarButtonSpacing(void *a1, const char *a2, ...)
{
  return _[a1 defaultBarButtonSpacing];
}

id objc_msgSend_defaultBarButtonWidth(void *a1, const char *a2, ...)
{
  return _[a1 defaultBarButtonWidth];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_delay(void *a1, const char *a2, ...)
{
  return _[a1 delay];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deletePDFPage_(void *a1, const char *a2, ...)
{
  return [a1 deletePDFPage:];
}

id objc_msgSend_deliveryCompletionBlock(void *a1, const char *a2, ...)
{
  return _[a1 deliveryCompletionBlock];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_deselectAllAnnotations(void *a1, const char *a2, ...)
{
  return _[a1 deselectAllAnnotations];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didAccidentallyDraw(void *a1, const char *a2, ...)
{
  return _[a1 didAccidentallyDraw];
}

id objc_msgSend_didChangeOpacityOnFullPage(void *a1, const char *a2, ...)
{
  return _[a1 didChangeOpacityOnFullPage];
}

id objc_msgSend_didChangeOpacityOnNormalScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 didChangeOpacityOnNormalScreenshot];
}

id objc_msgSend_didChangeRenameOption(void *a1, const char *a2, ...)
{
  return _[a1 didChangeRenameOption];
}

id objc_msgSend_didChangeShareOptions(void *a1, const char *a2, ...)
{
  return _[a1 didChangeShareOptions];
}

id objc_msgSend_didCopyDeleteScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 didCopyDeleteScreenshots];
}

id objc_msgSend_didCropInFullPageMode(void *a1, const char *a2, ...)
{
  return _[a1 didCropInFullPageMode];
}

id objc_msgSend_didCropInNormalMode(void *a1, const char *a2, ...)
{
  return _[a1 didCropInNormalMode];
}

id objc_msgSend_didDeleteScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 didDeleteScreenshots];
}

id objc_msgSend_didDrawPenStroke(void *a1, const char *a2, ...)
{
  return _[a1 didDrawPenStroke];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_didProcessDocumentUpdate(void *a1, const char *a2, ...)
{
  return _[a1 didProcessDocumentUpdate];
}

id objc_msgSend_didProcessDocumentUpdateForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 didProcessDocumentUpdateForScreenshot:];
}

id objc_msgSend_didRenameScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 didRenameScreenshot];
}

id objc_msgSend_didSaveFullPagePDFToFiles(void *a1, const char *a2, ...)
{
  return _[a1 didSaveFullPagePDFToFiles];
}

id objc_msgSend_didSaveImageToFiles(void *a1, const char *a2, ...)
{
  return _[a1 didSaveImageToFiles];
}

id objc_msgSend_didSaveImageToPhotos(void *a1, const char *a2, ...)
{
  return _[a1 didSaveImageToPhotos];
}

id objc_msgSend_didSaveImageToQuickNote(void *a1, const char *a2, ...)
{
  return _[a1 didSaveImageToQuickNote];
}

id objc_msgSend_didSaveMixedAllToFiles(void *a1, const char *a2, ...)
{
  return _[a1 didSaveMixedAllToFiles];
}

id objc_msgSend_didSaveMixedToPhotosAndFiles(void *a1, const char *a2, ...)
{
  return _[a1 didSaveMixedToPhotosAndFiles];
}

id objc_msgSend_didSaveMixedToQuickNoteAndFiles(void *a1, const char *a2, ...)
{
  return _[a1 didSaveMixedToQuickNoteAndFiles];
}

id objc_msgSend_didSavePDFImageToPhotos(void *a1, const char *a2, ...)
{
  return _[a1 didSavePDFImageToPhotos];
}

id objc_msgSend_didShareFullPageMixedScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 didShareFullPageMixedScreenshots];
}

id objc_msgSend_didShareFullPageScreenshotAsAutomaticImage(void *a1, const char *a2, ...)
{
  return _[a1 didShareFullPageScreenshotAsAutomaticImage];
}

id objc_msgSend_didShareFullPageScreenshotAsAutomaticPDF(void *a1, const char *a2, ...)
{
  return _[a1 didShareFullPageScreenshotAsAutomaticPDF];
}

id objc_msgSend_didShareFullPageScreenshotAsImage(void *a1, const char *a2, ...)
{
  return _[a1 didShareFullPageScreenshotAsImage];
}

id objc_msgSend_didShareFullPageScreenshotAsPDF(void *a1, const char *a2, ...)
{
  return _[a1 didShareFullPageScreenshotAsPDF];
}

id objc_msgSend_didShareScreenMultipleScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 didShareScreenMultipleScreenshots];
}

id objc_msgSend_didShareScreenSingleScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 didShareScreenSingleScreenshots];
}

id objc_msgSend_didSubmitFeedbackWithAnnotationCount_(void *a1, const char *a2, ...)
{
  return [a1 didSubmitFeedbackWithAnnotationCount:];
}

id objc_msgSend_didTapBetaFeedbackButton(void *a1, const char *a2, ...)
{
  return _[a1 didTapBetaFeedbackButton];
}

id objc_msgSend_didTapFullPageSegment(void *a1, const char *a2, ...)
{
  return _[a1 didTapFullPageSegment];
}

id objc_msgSend_didTapOpacityOptionWithAttributeView_(void *a1, const char *a2, ...)
{
  return [a1 didTapOpacityOptionWithAttributeView:];
}

id objc_msgSend_disableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 disableAnimation];
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilitySignal];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_dismissActivityViewController(void *a1, const char *a2, ...)
{
  return _[a1 dismissActivityViewController];
}

id objc_msgSend_dismissOverlayManagedViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 dismissOverlayManagedViewControllers];
}

id objc_msgSend_dismissPresentedPopovers(void *a1, const char *a2, ...)
{
  return _[a1 dismissPresentedPopovers];
}

id objc_msgSend_dismissRequestedFromScreenshotsViewController_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissRequestedFromScreenshotsViewController:completion:];
}

id objc_msgSend_dismissScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 dismissScreenshots];
}

id objc_msgSend_dismissScreenshotsAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissScreenshotsAnimated:completion:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_displayCornerRadius(void *a1, const char *a2, ...)
{
  return _[a1 displayCornerRadius];
}

id objc_msgSend_displayLinkObserverHandler(void *a1, const char *a2, ...)
{
  return _[a1 displayLinkObserverHandler];
}

id objc_msgSend_displayLinkWithTarget_selector_(void *a1, const char *a2, ...)
{
  return [a1 displayLinkWithTarget:selector:];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_dittoDebugView_requestsPresentationOfViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoDebugView:requestsPresentationOfViewController:");
}

id objc_msgSend_dittoDismissTimerFired_(void *a1, const char *a2, ...)
{
  return [a1 dittoDismissTimerFired:];
}

id objc_msgSend_dittoRemoteAlertViewControllerViewWillAppear_(void *a1, const char *a2, ...)
{
  return [a1 dittoRemoteAlertViewControllerViewWillAppear:];
}

id objc_msgSend_dittoRootViewController_didTransitionToState_(void *a1, const char *a2, ...)
{
  return [a1 dittoRootViewController:didTransitionToState:];
}

id objc_msgSend_dittoRootViewController_wantsBackground_duration_(void *a1, const char *a2, ...)
{
  return [a1 dittoRootViewController:wantsBackground:duration:];
}

id objc_msgSend_dittoRootViewController_willShowShowSharingUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:willShowShowSharingUIWithBlock:");
}

id objc_msgSend_dittoRootViewController_willShowTestFlightUIWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dittoRootViewController:willShowTestFlightUIWithBlock:");
}

id objc_msgSend_dittoRootViewController_willTransitionToState_changeBlock_(void *a1, const char *a2, ...)
{
  return [a1 dittoRootViewController:willTransitionToState:changeBlock:];
}

id objc_msgSend_dittoRootViewControllerDidDismiss_(void *a1, const char *a2, ...)
{
  return [a1 dittoRootViewControllerDidDismiss];
}

id objc_msgSend_dittoRootViewControllerFinishedShowingSharingUI_inStateTransition_(void *a1, const char *a2, ...)
{
  return [a1 dittoRootViewControllerFinishedShowingSharingUI:inStateTransition:];
}

id objc_msgSend_document(void *a1, const char *a2, ...)
{
  return _[a1 document];
}

id objc_msgSend_documentFromPDFData_(void *a1, const char *a2, ...)
{
  return [a1 documentFromPDFData];
}

id objc_msgSend_documentGenerator(void *a1, const char *a2, ...)
{
  return _[a1 documentGenerator];
}

id objc_msgSend_documentScrollView(void *a1, const char *a2, ...)
{
  return _[a1 documentScrollView];
}

id objc_msgSend_documentView(void *a1, const char *a2, ...)
{
  return _[a1 documentView];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doneCrop(void *a1, const char *a2, ...)
{
  return _[a1 doneCrop];
}

id objc_msgSend_doubleTapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 doubleTapGestureRecognizer];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dragAnimating(void *a1, const char *a2, ...)
{
  return _[a1 dragAnimating];
}

id objc_msgSend_dragItems(void *a1, const char *a2, ...)
{
  return _[a1 dragItems];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return [a1 drawInRect:];
}

id objc_msgSend_drawViewHierarchyInRect_afterScreenUpdates_(void *a1, const char *a2, ...)
{
  return [a1 drawViewHierarchyInRect:afterScreenUpdates:];
}

id objc_msgSend_drawWithBox_inContext_isThumbnail_(void *a1, const char *a2, ...)
{
  return [a1 drawWithBox:inContext:isThumbnail:];
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return _[a1 drawing];
}

id objc_msgSend_drawingBounds(void *a1, const char *a2, ...)
{
  return _[a1 drawingBounds];
}

id objc_msgSend_drawingGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 drawingGestureRecognizer];
}

id objc_msgSend_drewStrokes_(void *a1, const char *a2, ...)
{
  return [a1 drewStrokes:];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_edge(void *a1, const char *a2, ...)
{
  return _[a1 edge];
}

id objc_msgSend_editMode(void *a1, const char *a2, ...)
{
  return _[a1 editMode];
}

id objc_msgSend_editedPDFDataForShareSheet(void *a1, const char *a2, ...)
{
  return _[a1 editedPDFDataForShareSheet];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_elementWithUncachedProvider_(void *a1, const char *a2, ...)
{
  return [a1 elementWithUncachedProvider:];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_enableAnimation(void *a1, const char *a2, ...)
{
  return _[a1 enableAnimation];
}

id objc_msgSend_endAnnotationEditing(void *a1, const char *a2, ...)
{
  return _[a1 endAnnotationEditing];
}

id objc_msgSend_endCropTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 endCropTimestamp];
}

id objc_msgSend_endLogging(void *a1, const char *a2, ...)
{
  return _[a1 endLogging];
}

id objc_msgSend_endOpacityEditing(void *a1, const char *a2, ...)
{
  return _[a1 endOpacityEditing];
}

id objc_msgSend_endedEditing(void *a1, const char *a2, ...)
{
  return _[a1 endedEditing];
}

id objc_msgSend_enterCrop(void *a1, const char *a2, ...)
{
  return _[a1 enterCrop];
}

id objc_msgSend_enterCropMode(void *a1, const char *a2, ...)
{
  return _[a1 enterCropMode];
}

id objc_msgSend_enterMarkupMode(void *a1, const char *a2, ...)
{
  return _[a1 enterMarkupMode];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_environmentDescription(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescription];
}

id objc_msgSend_environmentDescriptionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifier];
}

id objc_msgSend_environmentDescriptionIdentifiersBeingRemoved(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifiersBeingRemoved];
}

id objc_msgSend_environmentDescriptionIdentifiersBeingSaved(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifiersBeingSaved];
}

id objc_msgSend_environmentDescriptionIdentifiersBeingTracked(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifiersBeingTracked];
}

id objc_msgSend_environmentDescriptionIdentifiersInActiveDragSession(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifiersInActiveDragSession];
}

id objc_msgSend_environmentDescriptionIdentifiersUIIsInterestedIn(void *a1, const char *a2, ...)
{
  return _[a1 environmentDescriptionIdentifiersUIIsInterestedIn];
}

id objc_msgSend_environmentElementIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 environmentElementIdentifier];
}

id objc_msgSend_exceptionWithName_reason_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 exceptionWithName:reason:userInfo:];
}

id objc_msgSend_expectedAnimationDurationForStyle_(void *a1, const char *a2, ...)
{
  return [a1 expectedAnimationDurationForStyle:];
}

id objc_msgSend_extent(void *a1, const char *a2, ...)
{
  return _[a1 extent];
}

id objc_msgSend_externalFlashLayerContextID(void *a1, const char *a2, ...)
{
  return _[a1 externalFlashLayerContextID];
}

id objc_msgSend_externalFlashLayerRenderID(void *a1, const char *a2, ...)
{
  return _[a1 externalFlashLayerRenderID];
}

id objc_msgSend_feedbackActivity(void *a1, const char *a2, ...)
{
  return _[a1 feedbackActivity];
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return [a1 fileURLWithPath:];
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return _[a1 filename];
}

id objc_msgSend_fillColor(void *a1, const char *a2, ...)
{
  return _[a1 fillColor];
}

id objc_msgSend_filledInfoButtonGlyphName(void *a1, const char *a2, ...)
{
  return _[a1 filledInfoButtonGlyphName];
}

id objc_msgSend_filter(void *a1, const char *a2, ...)
{
  return _[a1 filter];
}

id objc_msgSend_finishLoadingScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 finishLoadingScreenshot];
}

id objc_msgSend_finishPreparingForFullscreenExperience(void *a1, const char *a2, ...)
{
  return _[a1 finishPreparingForFullscreenExperience];
}

id objc_msgSend_finishedIPTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedIPTest:];
}

id objc_msgSend_finishedTest_(void *a1, const char *a2, ...)
{
  return [a1 finishedTest:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _[a1 firstResponder];
}

id objc_msgSend_fixedSpaceItemOfWidth_(void *a1, const char *a2, ...)
{
  return [a1 fixedSpaceItemOfWidth:];
}

id objc_msgSend_flash(void *a1, const char *a2, ...)
{
  return _[a1 flash];
}

id objc_msgSend_flashStyle(void *a1, const char *a2, ...)
{
  return _[a1 flashStyle];
}

id objc_msgSend_flashViewForStyle_(void *a1, const char *a2, ...)
{
  return [a1 flashViewForStyle:];
}

id objc_msgSend_flashWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 flashWithCompletion:];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_fontWithDescriptor_size_(void *a1, const char *a2, ...)
{
  return [a1 fontWithDescriptor:size:];
}

id objc_msgSend_forceHideRuler(void *a1, const char *a2, ...)
{
  return _[a1 forceHideRuler];
}

id objc_msgSend_formUnionWithCharacterSet_(void *a1, const char *a2, ...)
{
  return [a1 formUnionWithCharacterSet:];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fullscreenExperienceHadCropEvent(void *a1, const char *a2, ...)
{
  return _[a1 fullscreenExperienceHadCropEvent];
}

id objc_msgSend_fullscreenifyWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fullscreenifyWithCompletion:];
}

id objc_msgSend_generalPasteboard(void *a1, const char *a2, ...)
{
  return _[a1 generalPasteboard];
}

id objc_msgSend_generateImageForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 generateImageForScreenshot:];
}

id objc_msgSend_generatePDF_(void *a1, const char *a2, ...)
{
  return [a1 generatePDF:];
}

id objc_msgSend_generateSnapshotImageIfNecessary_withCompletion_(void *a1, const char *a2, ...)
{
  return [a1 generateSnapshotImageIfNecessary:withCompletion:];
}

id objc_msgSend_geometryMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 geometryMultiplier];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return _[a1 gestureRecognizers];
}

id objc_msgSend_gesturesEnabled(void *a1, const char *a2, ...)
{
  return _[a1 gesturesEnabled];
}

id objc_msgSend_goToPage_(void *a1, const char *a2, ...)
{
  return [a1 goToPage:];
}

id objc_msgSend_grabPositionForLocation_(void *a1, const char *a2, ...)
{
  return [a1 grabPositionForLocation:];
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return _[a1 greenColor];
}

id objc_msgSend_groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates_(void *a1, const char *a2, ...)
{
  return [a1 groupImageIdentifierUpdateTrackerChangedProgressTowardsReceivingAllImageIdentifierUpdates:];
}

id objc_msgSend_groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupImageIdentifierUpdateTrackerDidReceiveNewScreenshotIdentifier:");
}

id objc_msgSend_harvestedMetadata(void *a1, const char *a2, ...)
{
  return _[a1 harvestedMetadata];
}

id objc_msgSend_hasChangedBackingImage(void *a1, const char *a2, ...)
{
  return _[a1 hasChangedBackingImage];
}

id objc_msgSend_hasEverBeenEditedForMode_(void *a1, const char *a2, ...)
{
  return [a1 hasEverBeenEditedForMode:];
}

id objc_msgSend_hasKeyboardFocus(void *a1, const char *a2, ...)
{
  return _[a1 hasKeyboardFocus];
}

id objc_msgSend_hasOnenessScreen(void *a1, const char *a2, ...)
{
  return _[a1 hasOnenessScreen];
}

id objc_msgSend_hasResultsForAnalysisTypes_(void *a1, const char *a2, ...)
{
  return [a1 hasResultsForAnalysisTypes:];
}

id objc_msgSend_hasUnsavedImageEdits(void *a1, const char *a2, ...)
{
  return _[a1 hasUnsavedImageEdits];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hidesSourceLayer(void *a1, const char *a2, ...)
{
  return _[a1 hidesSourceLayer];
}

id objc_msgSend_highQualityImageQueue(void *a1, const char *a2, ...)
{
  return _[a1 highQualityImageQueue];
}

id objc_msgSend_highQualityQueueHasBeenResumed(void *a1, const char *a2, ...)
{
  return _[a1 highQualityQueueHasBeenResumed];
}

id objc_msgSend_highQualityQueueIsValid(void *a1, const char *a2, ...)
{
  return _[a1 highQualityQueueIsValid];
}

id objc_msgSend_highlightSelectableItems(void *a1, const char *a2, ...)
{
  return _[a1 highlightSelectableItems];
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 hitTest:withEvent:];
}

id objc_msgSend_hitTestsUsingSubviews(void *a1, const char *a2, ...)
{
  return _[a1 hitTestsUsingSubviews];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 horizontalSizeClass];
}

id objc_msgSend_hostingViewController(void *a1, const char *a2, ...)
{
  return _[a1 hostingViewController];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return _[a1 image];
}

id objc_msgSend_imageAnalyzer(void *a1, const char *a2, ...)
{
  return _[a1 imageAnalyzer];
}

id objc_msgSend_imageDescription(void *a1, const char *a2, ...)
{
  return _[a1 imageDescription];
}

id objc_msgSend_imageGenerator(void *a1, const char *a2, ...)
{
  return _[a1 imageGenerator];
}

id objc_msgSend_imageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 imageIdentifier];
}

id objc_msgSend_imageInteraction(void *a1, const char *a2, ...)
{
  return _[a1 imageInteraction];
}

id objc_msgSend_imageItems(void *a1, const char *a2, ...)
{
  return _[a1 imageItems];
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imagePixelSize(void *a1, const char *a2, ...)
{
  return _[a1 imagePixelSize];
}

id objc_msgSend_imagePointSize(void *a1, const char *a2, ...)
{
  return _[a1 imagePointSize];
}

id objc_msgSend_imageProvider(void *a1, const char *a2, ...)
{
  return _[a1 imageProvider];
}

id objc_msgSend_imageScale(void *a1, const char *a2, ...)
{
  return _[a1 imageScale];
}

id objc_msgSend_imageSurface(void *a1, const char *a2, ...)
{
  return _[a1 imageSurface];
}

id objc_msgSend_imageView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return [a1 imageView:requestsUpdateToInteractionMode:];
}

id objc_msgSend_imageView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 imageView:startEditingOpacityInAccessoryView:];
}

id objc_msgSend_imageViewDidLoadImage_(void *a1, const char *a2, ...)
{
  return [a1 imageViewDidLoadImage:];
}

id objc_msgSend_imageViewDidUpdateInteraction_withAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageViewDidUpdateInteraction:withAnalysis:");
}

id objc_msgSend_imageViewOverlayViewController_(void *a1, const char *a2, ...)
{
  return [a1 imageViewOverlayViewController:];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return [a1 imageWithActions:];
}

id objc_msgSend_imageWithBox_(void *a1, const char *a2, ...)
{
  return [a1 imageWithBox:];
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:scale:orientation:];
}

id objc_msgSend_imageWithPreviouslyRegisteredIdentifier_withAccessBlock_(void *a1, const char *a2, ...)
{
  return [a1 imageWithPreviouslyRegisteredIdentifier:withAccessBlock:];
}

id objc_msgSend_imageWithSymbolConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 imageWithSymbolConfiguration:];
}

id objc_msgSend_inDragAndDrop(void *a1, const char *a2, ...)
{
  return _[a1 inDragAndDrop];
}

id objc_msgSend_inStateTransition(void *a1, const char *a2, ...)
{
  return _[a1 inStateTransition];
}

id objc_msgSend_includedActivityTypes(void *a1, const char *a2, ...)
{
  return _[a1 includedActivityTypes];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexForPage_(void *a1, const char *a2, ...)
{
  return [a1 indexForPage:];
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return [a1 indexOfObject:];
}

id objc_msgSend_info(void *a1, const char *a2, ...)
{
  return _[a1 info];
}

id objc_msgSend_infoButtonGlyphName(void *a1, const char *a2, ...)
{
  return _[a1 infoButtonGlyphName];
}

id objc_msgSend_informHostThatScreenshotsHaveDismissed(void *a1, const char *a2, ...)
{
  return _[a1 informHostThatScreenshotsHaveDismissed];
}

id objc_msgSend_inhibitImageAnalysis(void *a1, const char *a2, ...)
{
  return _[a1 inhibitImageAnalysis];
}

id objc_msgSend_initForContext_betaApplicationIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initForContext:];
}

id objc_msgSend_initForCorner_(void *a1, const char *a2, ...)
{
  return [a1 initForCorner:];
}

id objc_msgSend_initForExportingURLs_asCopy_(void *a1, const char *a2, ...)
{
  return [a1 initForExportingURLs:asCopy:];
}

id objc_msgSend_initForScreenshotWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return [a1 initForScreenshotWithEnvironmentDescription:];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithActivityItems_applicationActivities_editMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityItems:applicationActivities:editMode:");
}

id objc_msgSend_initWithBarButtonSystemItem_menu_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:menu:];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlock:];
}

id objc_msgSend_initWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithCGImage:];
}

id objc_msgSend_initWithContainer_center_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainer:center:];
}

id objc_msgSend_initWithContainer_center_transform_(void *a1, const char *a2, ...)
{
  return [a1 initWithContainer:center:transform:];
}

id objc_msgSend_initWithContentView_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentView:];
}

id objc_msgSend_initWithContentsOfURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithContentsOfURL:];
}

id objc_msgSend_initWithControlPoint1_controlPoint2_(void *a1, const char *a2, ...)
{
  return [a1 initWithControlPoint1:controlPoint2:];
}

id objc_msgSend_initWithControlPoints__::(void *a1, const char *a2, ...)
{
  return [a1 initWithControlPoints:];
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return [a1 initWithCustomView:];
}

id objc_msgSend_initWithData_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:];
}

id objc_msgSend_initWithDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithDelegate:];
}

id objc_msgSend_initWithDuration_timingParameters_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:timingParameters:];
}

id objc_msgSend_initWithEdge_(void *a1, const char *a2, ...)
{
  return [a1 initWithEdge:];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithEnvironmentDescription_(void *a1, const char *a2, ...)
{
  return [a1 initWithEnvironmentDescription:];
}

id objc_msgSend_initWithFilePresenter_(void *a1, const char *a2, ...)
{
  return [a1 initWithFilePresenter:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithIdentifier_bundleID_context_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:bundleID:context:userInfo:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithImage_orientation_requestType_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:orientation:requestType:];
}

id objc_msgSend_initWithItem_typeIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithItem:typeIdentifier:];
}

id objc_msgSend_initWithItemProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithItemProvider:];
}

id objc_msgSend_initWithItems_(void *a1, const char *a2, ...)
{
  return [a1 initWithItems:];
}

id objc_msgSend_initWithMass_stiffness_damping_initialVelocity_(void *a1, const char *a2, ...)
{
  return [a1 initWithMass:stiffness:damping:initialVelocity:];
}

id objc_msgSend_initWithObject_(void *a1, const char *a2, ...)
{
  return [a1 initWithObject:];
}

id objc_msgSend_initWithPlatformImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithPlatformImage:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 initWithScreenshot:];
}

id objc_msgSend_initWithScreenshot_deliveryCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithScreenshot:deliveryCompletionBlock:];
}

id objc_msgSend_initWithScrollView_visibleRectInScrollView_(void *a1, const char *a2, ...)
{
  return [a1 initWithScrollView:visibleRectInScrollView:];
}

id objc_msgSend_initWithScrollViewRect_contentInsetRect_visibleRect_(void *a1, const char *a2, ...)
{
  return [a1 initWithScrollViewRect:contentInsetRect:visibleRect:];
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:];
}

id objc_msgSend_initWithSize_format_(void *a1, const char *a2, ...)
{
  return [a1 initWithSize:format:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTestName_scrollView_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 initWithTestName:scrollView:completionHandler:];
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithView_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:];
}

id objc_msgSend_initWithView_parameters_target_(void *a1, const char *a2, ...)
{
  return [a1 initWithView:parameters:target:];
}

id objc_msgSend_initialAnnotationMode(void *a1, const char *a2, ...)
{
  return _[a1 initialAnnotationMode];
}

id objc_msgSend_initiateFeedbackSnapshot(void *a1, const char *a2, ...)
{
  return _[a1 initiateFeedbackSnapshot];
}

id objc_msgSend_insertImagesData_completion_(void *a1, const char *a2, ...)
{
  return [a1 insertImagesData:completion:];
}

id objc_msgSend_insertIntoQuickNoteWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 insertIntoQuickNoteWithCompletion:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_insertPage_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertPage:atIndex:];
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:aboveSubview:];
}

id objc_msgSend_insertSubview_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:atIndex:];
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return [a1 insertSubview:belowSubview:];
}

id objc_msgSend_installInterstitialGesture_(void *a1, const char *a2, ...)
{
  return [a1 installInterstitialGesture];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_integralDrawingBounds(void *a1, const char *a2, ...)
{
  return _[a1 integralDrawingBounds];
}

id objc_msgSend_interactionMode(void *a1, const char *a2, ...)
{
  return _[a1 interactionMode];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateIntrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 invalidateIntrinsicContentSize];
}

id objc_msgSend_isAppLauncher(void *a1, const char *a2, ...)
{
  return _[a1 isAppLauncher];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingDismissed];
}

id objc_msgSend_isBeingRemoved(void *a1, const char *a2, ...)
{
  return _[a1 isBeingRemoved];
}

id objc_msgSend_isCropped(void *a1, const char *a2, ...)
{
  return _[a1 isCropped];
}

id objc_msgSend_isDecelerating(void *a1, const char *a2, ...)
{
  return _[a1 isDecelerating];
}

id objc_msgSend_isDeleted(void *a1, const char *a2, ...)
{
  return _[a1 isDeleted];
}

id objc_msgSend_isDragging(void *a1, const char *a2, ...)
{
  return _[a1 isDragging];
}

id objc_msgSend_isDraggingVisibleRect(void *a1, const char *a2, ...)
{
  return _[a1 isDraggingVisibleRect];
}

id objc_msgSend_isEnabledByDefault(void *a1, const char *a2, ...)
{
  return _[a1 isEnabledByDefault];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 isFirstResponder];
}

id objc_msgSend_isInProgrammaticCall(void *a1, const char *a2, ...)
{
  return _[a1 isInProgrammaticCall];
}

id objc_msgSend_isLostModeActive(void *a1, const char *a2, ...)
{
  return _[a1 isLostModeActive];
}

id objc_msgSend_isMoving(void *a1, const char *a2, ...)
{
  return _[a1 isMoving];
}

id objc_msgSend_isOn(void *a1, const char *a2, ...)
{
  return _[a1 isOn];
}

id objc_msgSend_isOverlayViewLoadedAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 isOverlayViewLoadedAtIndex:];
}

id objc_msgSend_isPerformingFullscreenSetup(void *a1, const char *a2, ...)
{
  return _[a1 isPerformingFullscreenSetup];
}

id objc_msgSend_isRecapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isRecapAvailable];
}

id objc_msgSend_isSaving(void *a1, const char *a2, ...)
{
  return _[a1 isSaving];
}

id objc_msgSend_isSavingForMode_(void *a1, const char *a2, ...)
{
  return [a1 isSavingForMode:];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return _[a1 isSelected];
}

id objc_msgSend_isSharing(void *a1, const char *a2, ...)
{
  return _[a1 isSharing];
}

id objc_msgSend_isSharingMixedScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 isSharingMixedScreenshots];
}

id objc_msgSend_isSharingMultipleScreenScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 isSharingMultipleScreenScreenshots];
}

id objc_msgSend_isSharingSingleFullPageScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 isSharingSingleFullPageScreenshot];
}

id objc_msgSend_isSharingSingleFullPageScreenshotAsImageUsingAutomatic(void *a1, const char *a2, ...)
{
  return _[a1 isSharingSingleFullPageScreenshotAsImageUsingAutomatic];
}

id objc_msgSend_isSharingSingleFullPageScreenshotAsPDFUsingAutomatic(void *a1, const char *a2, ...)
{
  return _[a1 isSharingSingleFullPageScreenshotAsPDFUsingAutomatic];
}

id objc_msgSend_isSharingSingleScreenScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 isSharingSingleScreenScreenshot];
}

id objc_msgSend_isShowingDeleteConfirmation(void *a1, const char *a2, ...)
{
  return _[a1 isShowingDeleteConfirmation];
}

id objc_msgSend_isShowingDoneActionSheet(void *a1, const char *a2, ...)
{
  return _[a1 isShowingDoneActionSheet];
}

id objc_msgSend_isShowingModalUI(void *a1, const char *a2, ...)
{
  return _[a1 isShowingModalUI];
}

id objc_msgSend_isShowingThumbnailOptionView(void *a1, const char *a2, ...)
{
  return _[a1 isShowingThumbnailOptionView];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return _[a1 isTracking];
}

id objc_msgSend_isTransitioningStates(void *a1, const char *a2, ...)
{
  return _[a1 isTransitioningStates];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isWaitingForPDF(void *a1, const char *a2, ...)
{
  return _[a1 isWaitingForPDF];
}

id objc_msgSend_isZoomBouncing(void *a1, const char *a2, ...)
{
  return _[a1 isZoomBouncing];
}

id objc_msgSend_isZooming(void *a1, const char *a2, ...)
{
  return _[a1 isZooming];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return _[a1 item];
}

id objc_msgSend_itemProviderForDragItems(void *a1, const char *a2, ...)
{
  return _[a1 itemProviderForDragItems];
}

id objc_msgSend_itemProviderImage(void *a1, const char *a2, ...)
{
  return _[a1 itemProviderImage];
}

id objc_msgSend_itemProviderPDF(void *a1, const char *a2, ...)
{
  return _[a1 itemProviderPDF];
}

id objc_msgSend_itemProviderPDFAsImage(void *a1, const char *a2, ...)
{
  return _[a1 itemProviderPDFAsImage];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_lastViewEditMode(void *a1, const char *a2, ...)
{
  return _[a1 lastViewEditMode];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutDocumentView(void *a1, const char *a2, ...)
{
  return _[a1 layoutDocumentView];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutRectsByApplyingTransform_(void *a1, const char *a2, ...)
{
  return [a1 layoutRectsByApplyingTransform:];
}

id objc_msgSend_layoutRectsByConvertingFromView_toView_(void *a1, const char *a2, ...)
{
  return [a1 layoutRectsByConvertingFromView:toView:];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return [a1 loadRequest:];
}

id objc_msgSend_loadScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 loadScreenshot];
}

id objc_msgSend_loadedView(void *a1, const char *a2, ...)
{
  return _[a1 loadedView];
}

id objc_msgSend_localObject(void *a1, const char *a2, ...)
{
  return _[a1 localObject];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringFromDate_dateStyle_timeStyle_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringFromDate:dateStyle:timeStyle:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return [a1 locationInView:];
}

id objc_msgSend_logDidEndEditingWithOverlay(void *a1, const char *a2, ...)
{
  return _[a1 logDidEndEditingWithOverlay];
}

id objc_msgSend_logDidEnterEditingWithOverlay(void *a1, const char *a2, ...)
{
  return _[a1 logDidEnterEditingWithOverlay];
}

id objc_msgSend_logTotalAnnotations_(void *a1, const char *a2, ...)
{
  return [a1 logTotalAnnotations:];
}

id objc_msgSend_loggableDescription(void *a1, const char *a2, ...)
{
  return _[a1 loggableDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_managedView(void *a1, const char *a2, ...)
{
  return _[a1 managedView];
}

id objc_msgSend_matchesOpacity(void *a1, const char *a2, ...)
{
  return _[a1 matchesOpacity];
}

id objc_msgSend_matchesPosition(void *a1, const char *a2, ...)
{
  return _[a1 matchesPosition];
}

id objc_msgSend_matchesTransform(void *a1, const char *a2, ...)
{
  return _[a1 matchesTransform];
}

id objc_msgSend_maximumZoomScale(void *a1, const char *a2, ...)
{
  return _[a1 maximumZoomScale];
}

id objc_msgSend_menuWithChildren_(void *a1, const char *a2, ...)
{
  return [a1 menuWithChildren:];
}

id objc_msgSend_menuWithTitle_image_identifier_options_children_(void *a1, const char *a2, ...)
{
  return [a1 menuWithTitle:image:identifier:options:children:];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_minimumZoomScale(void *a1, const char *a2, ...)
{
  return _[a1 minimumZoomScale];
}

id objc_msgSend_modelController(void *a1, const char *a2, ...)
{
  return _[a1 modelController];
}

id objc_msgSend_modelModificationInfo(void *a1, const char *a2, ...)
{
  return _[a1 modelModificationInfo];
}

id objc_msgSend_modelModificationInfoForState_(void *a1, const char *a2, ...)
{
  return [a1 modelModificationInfoForState:];
}

id objc_msgSend_modificationInfo(void *a1, const char *a2, ...)
{
  return _[a1 modificationInfo];
}

id objc_msgSend_modifiedImageDescription(void *a1, const char *a2, ...)
{
  return _[a1 modifiedImageDescription];
}

id objc_msgSend_moveFromRemoteAlertViewControllerToRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 moveFromRemoteAlertViewControllerToRemoteViewController];
}

id objc_msgSend_moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveFromRemoteViewControllerToRemoteAlertViewControllerExecutingChangeBlockWhenReady:");
}

id objc_msgSend_moveToPoint_(void *a1, const char *a2, ...)
{
  return [a1 moveToPoint:];
}

id objc_msgSend_mutableArrayValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 mutableArrayValueForKey:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_nameForScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 nameForScreenshot];
}

id objc_msgSend_nameForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 nameForScreenshot:];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_newPageUndoObjectWithPDFPage_index_modificationInfo_(void *a1, const char *a2, ...)
{
  return [a1 newPageUndoObjectWithPDFPage:index:modificationInfo:];
}

id objc_msgSend_newScreenshotReceived(void *a1, const char *a2, ...)
{
  return _[a1 newScreenshotReceived];
}

id objc_msgSend_newTestScreenshot(void *a1, const char *a2, ...)
{
  return _[a1 newTestScreenshot];
}

id objc_msgSend_newWaitingForImageIdentifierUpdatesAlertController(void *a1, const char *a2, ...)
{
  return _[a1 newWaitingForImageIdentifierUpdatesAlertController];
}

id objc_msgSend_notifyScrollViewChanged_(void *a1, const char *a2, ...)
{
  return [a1 notifyScrollViewChanged:];
}

id objc_msgSend_notifyZoomScaleChanged_(void *a1, const char *a2, ...)
{
  return [a1 notifyZoomScaleChanged:];
}

id objc_msgSend_numberOfRequiredScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 numberOfRequiredScreenshots];
}

id objc_msgSend_numberOfScreenshotImages(void *a1, const char *a2, ...)
{
  return _[a1 numberOfScreenshotImages];
}

id objc_msgSend_numberOfScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 numberOfScreenshots];
}

id objc_msgSend_numberOfScreenshotsToAdd(void *a1, const char *a2, ...)
{
  return _[a1 numberOfScreenshotsToAdd];
}

id objc_msgSend_numberOfTouchesRequiredForPanningCrop(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouchesRequiredForPanningCrop];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInteger:];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndex:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return [a1 objectForKey:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_objectForSetting_(void *a1, const char *a2, ...)
{
  return [a1 objectForSetting:];
}

id objc_msgSend_onlyDrawWithApplePencil(void *a1, const char *a2, ...)
{
  return _[a1 onlyDrawWithApplePencil];
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 openURL:options:completionHandler:];
}

id objc_msgSend_orangeColor(void *a1, const char *a2, ...)
{
  return _[a1 orangeColor];
}

id objc_msgSend_originalAnnotations(void *a1, const char *a2, ...)
{
  return _[a1 originalAnnotations];
}

id objc_msgSend_overlayController(void *a1, const char *a2, ...)
{
  return _[a1 overlayController];
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return _[a1 overlayView];
}

id objc_msgSend_overlayViewAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 overlayViewAtIndex:];
}

id objc_msgSend_page(void *a1, const char *a2, ...)
{
  return _[a1 page];
}

id objc_msgSend_pageAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 pageAtIndex:];
}

id objc_msgSend_pageBreakMargins(void *a1, const char *a2, ...)
{
  return _[a1 pageBreakMargins];
}

id objc_msgSend_pageCount(void *a1, const char *a2, ...)
{
  return _[a1 pageCount];
}

id objc_msgSend_pageImageForSize_(void *a1, const char *a2, ...)
{
  return [a1 pageImageForSize:];
}

id objc_msgSend_pageModelController(void *a1, const char *a2, ...)
{
  return _[a1 pageModelController];
}

id objc_msgSend_pageModelControllerForPage_(void *a1, const char *a2, ...)
{
  return [a1 pageModelControllerForPage:];
}

id objc_msgSend_pageView(void *a1, const char *a2, ...)
{
  return _[a1 pageView];
}

id objc_msgSend_pageViewForPageAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 pageViewForPageAtIndex:];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 panGestureRecognizer];
}

id objc_msgSend_paperKitChangeCounter(void *a1, const char *a2, ...)
{
  return _[a1 paperKitChangeCounter];
}

id objc_msgSend_paperKitImageView(void *a1, const char *a2, ...)
{
  return _[a1 paperKitImageView];
}

id objc_msgSend_paperRect(void *a1, const char *a2, ...)
{
  return _[a1 paperRect];
}

id objc_msgSend_parentScreenshotView_animated_(void *a1, const char *a2, ...)
{
  return [a1 parentScreenshotView:animated:];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pdfAsImage(void *a1, const char *a2, ...)
{
  return _[a1 pdfAsImage];
}

id objc_msgSend_pdfCanBeConvertedToImage(void *a1, const char *a2, ...)
{
  return _[a1 pdfCanBeConvertedToImage];
}

id objc_msgSend_pdfData(void *a1, const char *a2, ...)
{
  return _[a1 pdfData];
}

id objc_msgSend_pdfPage(void *a1, const char *a2, ...)
{
  return _[a1 pdfPage];
}

id objc_msgSend_pdfView(void *a1, const char *a2, ...)
{
  return _[a1 pdfView];
}

id objc_msgSend_pdfView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 pdfView:startEditingOpacityInAccessoryView:];
}

id objc_msgSend_pdfViewOverlayViewController_(void *a1, const char *a2, ...)
{
  return [a1 pdfViewOverlayViewController:];
}

id objc_msgSend_performInteractiveGesturePresentationCompleteAnimations(void *a1, const char *a2, ...)
{
  return _[a1 performInteractiveGesturePresentationCompleteAnimations];
}

id objc_msgSend_performSystemAnimation_onViews_options_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSystemAnimation:onViews:options:animations:completion:");
}

id objc_msgSend_performWithoutAnimation_(void *a1, const char *a2, ...)
{
  return [a1 performWithoutAnimation:];
}

id objc_msgSend_performingDismissAnimation(void *a1, const char *a2, ...)
{
  return _[a1 performingDismissAnimation];
}

id objc_msgSend_pickerCustomizationWithIdentifier_options_selectedOptionIndex_footerText_valueChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 pickerCustomizationWithIdentifier:options:selectedOptionIndex:footerText:valueChangedHandler:];
}

id objc_msgSend_pinchGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 pinchGestureRecognizer];
}

id objc_msgSend_pipDragEndedSuccessfully(void *a1, const char *a2, ...)
{
  return _[a1 pipDragEndedSuccessfully];
}

id objc_msgSend_pipExpanded(void *a1, const char *a2, ...)
{
  return _[a1 pipExpanded];
}

id objc_msgSend_pipSlidOffscreenDueToTimeout(void *a1, const char *a2, ...)
{
  return _[a1 pipSlidOffscreenDueToTimeout];
}

id objc_msgSend_pipifyWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 pipifyWithCompletion:];
}

id objc_msgSend_placeholderItemForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 placeholderItemForScreenshot];
}

id objc_msgSend_playScreenshotSound(void *a1, const char *a2, ...)
{
  return _[a1 playScreenshotSound];
}

id objc_msgSend_pointCanPassthrough_(void *a1, const char *a2, ...)
{
  return [a1 pointCanPassthrough:];
}

id objc_msgSend_pointInside_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 pointInside:withEvent:];
}

id objc_msgSend_popNavigationItemAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popNavigationItemAnimated:];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 popoverPresentationController];
}

id objc_msgSend_popoverPresentingViewControllerForAnnotationController_(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentingViewControllerForAnnotationController:];
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return _[a1 portalLayer];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_potentiallyLowQualityImageQueue(void *a1, const char *a2, ...)
{
  return _[a1 potentiallyLowQualityImageQueue];
}

id objc_msgSend_preferredDimension(void *a1, const char *a2, ...)
{
  return _[a1 preferredDimension];
}

id objc_msgSend_preferredFontDescriptorWithTextStyle_addingSymbolicTraits_options_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontDescriptorWithTextStyle:];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredOtherDimension(void *a1, const char *a2, ...)
{
  return _[a1 preferredOtherDimension];
}

id objc_msgSend_preferredWidth(void *a1, const char *a2, ...)
{
  return _[a1 preferredWidth];
}

id objc_msgSend_preheatWithPresentationMode_(void *a1, const char *a2, ...)
{
  return [a1 preheatWithPresentationMode:];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _[a1 prepare];
}

id objc_msgSend_prepareForDebugging(void *a1, const char *a2, ...)
{
  return _[a1 prepareForDebugging];
}

id objc_msgSend_prepareForFullscreenExperience(void *a1, const char *a2, ...)
{
  return _[a1 prepareForFullscreenExperience];
}

id objc_msgSend_prepareForFullscreenExperience_(void *a1, const char *a2, ...)
{
  return [a1 prepareForFullscreenExperience:];
}

id objc_msgSend_prepareForMiniaturization(void *a1, const char *a2, ...)
{
  return _[a1 prepareForMiniaturization];
}

id objc_msgSend_prepareOverlayAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 prepareOverlayAtIndex:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentationMode(void *a1, const char *a2, ...)
{
  return _[a1 presentationMode];
}

id objc_msgSend_presentedView(void *a1, const char *a2, ...)
{
  return _[a1 presentedView];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_pressGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 pressGestureRecognizer];
}

id objc_msgSend_previewForDragItem_inContainer_(void *a1, const char *a2, ...)
{
  return [a1 previewForDragItem:inContainer:];
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return _[a1 printInfo];
}

id objc_msgSend_processEnvironmentElementDocumentUpdate_(void *a1, const char *a2, ...)
{
  return [a1 processEnvironmentElementDocumentUpdate:];
}

id objc_msgSend_processEnvironmentElementMetadataUpdate_(void *a1, const char *a2, ...)
{
  return [a1 processEnvironmentElementMetadataUpdate:];
}

id objc_msgSend_processImageIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 processImageIdentifier:];
}

id objc_msgSend_processImageIdentifierUpdate_(void *a1, const char *a2, ...)
{
  return [a1 processImageIdentifierUpdate:];
}

id objc_msgSend_processRequest_progressHandler_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 processRequest:progressHandler:completionHandler:];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_progressTowardsReceivingAllImageIdentifierUpdates(void *a1, const char *a2, ...)
{
  return _[a1 progressTowardsReceivingAllImageIdentifierUpdates];
}

id objc_msgSend_promoteViewValueToModelValueForKey_(void *a1, const char *a2, ...)
{
  return [a1 promoteViewValueToModelValueForKey:];
}

id objc_msgSend_promoteViewValueToModelValueForKey_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "promoteViewValueToModelValueForKey:forState:");
}

id objc_msgSend_promoteViewValueToModelValueForKey_forState_createUndoCommand_(void *a1, const char *a2, ...)
{
  return [a1 promoteViewValueToModelValueForKey:forState:createUndoCommand:];
}

id objc_msgSend_propertyAnimator(void *a1, const char *a2, ...)
{
  return _[a1 propertyAnimator];
}

id objc_msgSend_pushNavigationItem_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushNavigationItem:animated:];
}

id objc_msgSend_q_saveEditedPDF(void *a1, const char *a2, ...)
{
  return [a1 q_saveEditedPDF];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_rangeOfCharacterFromSet_options_range_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:options:range:];
}

id objc_msgSend_reanalyzeImage(void *a1, const char *a2, ...)
{
  return _[a1 reanalyzeImage];
}

id objc_msgSend_recapAvailable(void *a1, const char *a2, ...)
{
  return _[a1 recapAvailable];
}

id objc_msgSend_recapMovie(void *a1, const char *a2, ...)
{
  return _[a1 recapMovie];
}

id objc_msgSend_receiveEnvironmentDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "receiveEnvironmentDescription:completion:");
}

id objc_msgSend_recordEditsToPersistable_inTransition_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 recordEditsToPersistable:inTransition:withCompletionBlock:];
}

id objc_msgSend_recordEditsToPersistableForPDF_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 recordEditsToPersistableForPDF:withCompletionBlock:];
}

id objc_msgSend_recordPersistableToTemporaryLocation_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recordPersistableToTemporaryLocation:withCompletionBlock:");
}

id objc_msgSend_rect(void *a1, const char *a2, ...)
{
  return _[a1 rect];
}

id objc_msgSend_rectToCenterAboveKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 rectToCenterAboveKeyboard];
}

id objc_msgSend_rectsForShadow(void *a1, const char *a2, ...)
{
  return _[a1 rectsForShadow];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_redo(void *a1, const char *a2, ...)
{
  return _[a1 redo];
}

id objc_msgSend_redoForViewState_(void *a1, const char *a2, ...)
{
  return [a1 redoForViewState:];
}

id objc_msgSend_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerDataRepresentationForTypeIdentifier:visibility:loadHandler:];
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges:withHandler:];
}

id objc_msgSend_registerObjectOfClass_visibility_loadHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerObjectOfClass:visibility:loadHandler:];
}

id objc_msgSend_registerRemoteAlertViewController_(void *a1, const char *a2, ...)
{
  return [a1 registerRemoteAlertViewController];
}

id objc_msgSend_registerRemoteViewController_(void *a1, const char *a2, ...)
{
  return [a1 registerRemoteViewController:];
}

id objc_msgSend_registerUndoWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 registerUndoWithTarget:selector:object:];
}

id objc_msgSend_relinquishOverlayAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 relinquishOverlayAtIndex:];
}

id objc_msgSend_removeAllActions(void *a1, const char *a2, ...)
{
  return _[a1 removeAllActions];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeChildViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 removeChildViewControllers];
}

id objc_msgSend_removeDescendantViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 removeDescendantViewControllers];
}

id objc_msgSend_removeFailureRequirement_(void *a1, const char *a2, ...)
{
  return [a1 removeFailureRequirement:];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeImageIdentifierUpdateObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeImageIdentifierUpdateObserver];
}

id objc_msgSend_removeInteraction_(void *a1, const char *a2, ...)
{
  return [a1 removeInteraction:];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return [a1 removeItemAtURL:error:];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectsInArray:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_forKeyPath_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:forKeyPath:context:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removePageAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removePageAtIndex:];
}

id objc_msgSend_removePersistable_deleteOptions_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 removePersistable:deleteOptions:withCompletionBlock:];
}

id objc_msgSend_removeScreenshot_deleteOptions_(void *a1, const char *a2, ...)
{
  return [a1 removeScreenshot:deleteOptions:];
}

id objc_msgSend_removeScreenshots_(void *a1, const char *a2, ...)
{
  return [a1 removeScreenshots:];
}

id objc_msgSend_removeScreenshots_forReason_alongsideAnimations_completion_(void *a1, const char *a2, ...)
{
  return [a1 removeScreenshots:forReason:alongsideAnimations:completion:];
}

id objc_msgSend_removeTemporaryScreenshotLocation_deleteOptions_(void *a1, const char *a2, ...)
{
  return [a1 removeTemporaryScreenshotLocation:deleteOptions:];
}

id objc_msgSend_renameGroup(void *a1, const char *a2, ...)
{
  return _[a1 renameGroup];
}

id objc_msgSend_renameOption(void *a1, const char *a2, ...)
{
  return _[a1 renameOption];
}

id objc_msgSend_renderAnnotation_inContext_(void *a1, const char *a2, ...)
{
  return [a1 renderAnnotation:inContext:];
}

id objc_msgSend_replaceCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 replaceCharactersInRange:withString:];
}

id objc_msgSend_reportStatistics(void *a1, const char *a2, ...)
{
  return _[a1 reportStatistics];
}

id objc_msgSend_representation(void *a1, const char *a2, ...)
{
  return _[a1 representation];
}

id objc_msgSend_requestCGImageBackedUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return [a1 requestCGImageBackedUneditedImageForUI];
}

id objc_msgSend_requestCGImageBackedUneditedImageForUIBlocking(void *a1, const char *a2, ...)
{
  return _[a1 requestCGImageBackedUneditedImageForUIBlocking];
}

id objc_msgSend_requestID(void *a1, const char *a2, ...)
{
  return _[a1 requestID];
}

id objc_msgSend_requestOutputImageForSaving_(void *a1, const char *a2, ...)
{
  return [a1 requestOutputImageForSaving];
}

id objc_msgSend_requestOutputImageForSavingBlocking(void *a1, const char *a2, ...)
{
  return _[a1 requestOutputImageForSavingBlocking];
}

id objc_msgSend_requestOutputImageForUI_(void *a1, const char *a2, ...)
{
  return [a1 requestOutputImageForUI:];
}

id objc_msgSend_requestOutputImageForUIBlocking(void *a1, const char *a2, ...)
{
  return _[a1 requestOutputImageForUIBlocking];
}

id objc_msgSend_requestOutputImageInTransition_forSaving_(void *a1, const char *a2, ...)
{
  return [a1 requestOutputImageInTransition:forSaving:];
}

id objc_msgSend_requestUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return [a1 requestUneditedImageForUI];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 requireAllOtherGestureRecognizersToFailBeforeGestureRecognizer:];
}

id objc_msgSend_requireGestureRecognizerToFail_(void *a1, const char *a2, ...)
{
  return [a1 requireGestureRecognizerToFail:];
}

id objc_msgSend_requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers_(void *a1, const char *a2, ...)
{
  return [a1 requireGestureRecognizerToFailBeforeAllOtherGestureRecognizers:];
}

id objc_msgSend_resetCrop(void *a1, const char *a2, ...)
{
  return _[a1 resetCrop];
}

id objc_msgSend_resetScrollOffset(void *a1, const char *a2, ...)
{
  return _[a1 resetScrollOffset];
}

id objc_msgSend_resetSelection(void *a1, const char *a2, ...)
{
  return _[a1 resetSelection];
}

id objc_msgSend_resignCurrent(void *a1, const char *a2, ...)
{
  return _[a1 resignCurrent];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resizableSnapshotViewFromRect_afterScreenUpdates_withCapInsets_(void *a1, const char *a2, ...)
{
  return [a1 resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return _[a1 response];
}

id objc_msgSend_responseWithInfo_(void *a1, const char *a2, ...)
{
  return [a1 responseWithInfo:];
}

id objc_msgSend_retargetedPreviewWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "retargetedPreviewWithTarget:");
}

id objc_msgSend_revert(void *a1, const char *a2, ...)
{
  return _[a1 revert];
}

id objc_msgSend_revertForViewState_(void *a1, const char *a2, ...)
{
  return [a1 revertForViewState:];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rotation(void *a1, const char *a2, ...)
{
  return _[a1 rotation];
}

id objc_msgSend_rotationGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 rotationGestureRecognizer];
}

id objc_msgSend_runPPTServiceRequest(void *a1, const char *a2, ...)
{
  return _[a1 runPPTServiceRequest];
}

id objc_msgSend_runTestWithParameters_(void *a1, const char *a2, ...)
{
  return [a1 runTestWithParameters:];
}

id objc_msgSend_runningPropertyAnimatorWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 runningPropertyAnimatorWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_saveEditsToScreenshotIfNecessary_inTransition_(void *a1, const char *a2, ...)
{
  return [a1 saveEditsToScreenshotIfNecessary:inTransition:];
}

id objc_msgSend_saveLocation(void *a1, const char *a2, ...)
{
  return _[a1 saveLocation];
}

id objc_msgSend_saveScreenshotsToTemporaryLocation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveScreenshotsToTemporaryLocation:completion:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaleAnimationParameters(void *a1, const char *a2, ...)
{
  return _[a1 scaleAnimationParameters];
}

id objc_msgSend_scheduleDeletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 scheduleDeletionBlock:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_repeats_block_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:repeats:block:];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_screenRecording(void *a1, const char *a2, ...)
{
  return _[a1 screenRecording];
}

id objc_msgSend_screenshot(void *a1, const char *a2, ...)
{
  return _[a1 screenshot];
}

id objc_msgSend_screenshot_didHaveChangeOnPage_(void *a1, const char *a2, ...)
{
  return [a1 screenshot:didHaveChangeOnPage:];
}

id objc_msgSend_screenshotAppearAnimationBeganForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 screenshotAppearAnimationBeganForScreenshot:];
}

id objc_msgSend_screenshotAppearAnimationEndedForScreenshot_userInterface_(void *a1, const char *a2, ...)
{
  return [a1 screenshotAppearAnimationEndedForScreenshot:userInterface:];
}

id objc_msgSend_screenshotDeletePDFPage_(void *a1, const char *a2, ...)
{
  return [a1 screenshotDeletePDFPage:];
}

id objc_msgSend_screenshotDidChangeForScreenshotsView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotDidChangeForScreenshotsView:");
}

id objc_msgSend_screenshotDidHaveUndoStackChanged_(void *a1, const char *a2, ...)
{
  return [a1 screenshotDidHaveUndoStackChanged:];
}

id objc_msgSend_screenshotDidHaveViewModificationInfoChanged_(void *a1, const char *a2, ...)
{
  return [a1 screenshotDidHaveViewModificationInfoChanged];
}

id objc_msgSend_screenshotDidMakeAnnotationEditOnImage(void *a1, const char *a2, ...)
{
  return _[a1 screenshotDidMakeAnnotationEditOnImage];
}

id objc_msgSend_screenshotDidReceivePDFData(void *a1, const char *a2, ...)
{
  return _[a1 screenshotDidReceivePDFData];
}

id objc_msgSend_screenshotDidRevert_(void *a1, const char *a2, ...)
{
  return [a1 screenshotDidRevert:];
}

id objc_msgSend_screenshotEditsSnapshotted(void *a1, const char *a2, ...)
{
  return _[a1 screenshotEditsSnapshotted];
}

id objc_msgSend_screenshotEnteredDragSession_(void *a1, const char *a2, ...)
{
  return [a1 screenshotEnteredDragSession];
}

id objc_msgSend_screenshotExperienceHasDismissed(void *a1, const char *a2, ...)
{
  return _[a1 screenshotExperienceHasDismissed];
}

id objc_msgSend_screenshotGestureTriggered_(void *a1, const char *a2, ...)
{
  return [a1 screenshotGestureTriggered:];
}

id objc_msgSend_screenshotGestureTriggeredWhileAnotherScreenshotWasShowing_(void *a1, const char *a2, ...)
{
  return [a1 screenshotGestureTriggeredWhileAnotherScreenshotWasShowing:];
}

id objc_msgSend_screenshotInsertPDFPage_pageIndex_(void *a1, const char *a2, ...)
{
  return [a1 screenshotInsertPDFPage:pageIndex:];
}

id objc_msgSend_screenshotItemProviders(void *a1, const char *a2, ...)
{
  return _[a1 screenshotItemProviders];
}

id objc_msgSend_screenshotLeftDragSession_(void *a1, const char *a2, ...)
{
  return [a1 screenshotLeftDragSession];
}

id objc_msgSend_screenshotMutableModificationInfo_valueChangedForKey_(void *a1, const char *a2, ...)
{
  return [a1 screenshotMutableModificationInfo:valueChangedForKey:];
}

id objc_msgSend_screenshotPDFPageIndex_(void *a1, const char *a2, ...)
{
  return [a1 screenshotPDFPageIndex:];
}

id objc_msgSend_screenshotReceived_completion_(void *a1, const char *a2, ...)
{
  return [a1 screenshotReceived:completion:];
}

id objc_msgSend_screenshotReceivedImageIdentifierUpdate_(void *a1, const char *a2, ...)
{
  return [a1 screenshotReceivedImageIdentifierUpdate:];
}

id objc_msgSend_screenshotRepresentationAKControllerForPDF(void *a1, const char *a2, ...)
{
  return _[a1 screenshotRepresentationAKControllerForPDF];
}

id objc_msgSend_screenshotShouldJumpToPDFPageIndex_(void *a1, const char *a2, ...)
{
  return [a1 screenshotShouldJumpToPDFPageIndex];
}

id objc_msgSend_screenshotUIWithScreenshots_beganStateChangeFromState_toState_(void *a1, const char *a2, ...)
{
  return [a1 screenshotUIWithScreenshots:beganStateChangeFromState:toState:];
}

id objc_msgSend_screenshotUIWithScreenshots_endedStateChangeFromState_toState_userInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotUIWithScreenshots:endedStateChangeFromState:toState:userInterface:");
}

id objc_msgSend_screenshotView_didUpdateInteraction_withAnalysis_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotView:didUpdateInteraction:withAnalysis:");
}

id objc_msgSend_screenshotView_hasHighPriorityGesture_(void *a1, const char *a2, ...)
{
  return [a1 screenshotView:hasHighPriorityGesture:];
}

id objc_msgSend_screenshotView_noLongerHasHighPriorityGesture_(void *a1, const char *a2, ...)
{
  return [a1 screenshotView:noLongerHasHighPriorityGesture:];
}

id objc_msgSend_screenshotView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return [a1 screenshotView:requestsUpdateToInteractionMode:];
}

id objc_msgSend_screenshotView_startEditingOpacityInAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 screenshotView:startEditingOpacityInAccessoryView:];
}

id objc_msgSend_screenshotViewCropDidChange_(void *a1, const char *a2, ...)
{
  return [a1 screenshotViewCropDidChange:];
}

id objc_msgSend_screenshotViewForScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 screenshotViewForScreenshot:];
}

id objc_msgSend_screenshotViewTapped_(void *a1, const char *a2, ...)
{
  return [a1 screenshotViewTapped:];
}

id objc_msgSend_screenshotViewUndoStackChanged_(void *a1, const char *a2, ...)
{
  return [a1 screenshotViewUndoStackChanged:];
}

id objc_msgSend_screenshotViewsUseTrilinearMinificationFilter(void *a1, const char *a2, ...)
{
  return _[a1 screenshotViewsUseTrilinearMinificationFilter];
}

id objc_msgSend_screenshots(void *a1, const char *a2, ...)
{
  return _[a1 screenshots];
}

id objc_msgSend_screenshotsDismissed(void *a1, const char *a2, ...)
{
  return _[a1 screenshotsDismissed];
}

id objc_msgSend_screenshotsExtentRect(void *a1, const char *a2, ...)
{
  return _[a1 screenshotsExtentRect];
}

id objc_msgSend_screenshotsParentCoordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 screenshotsParentCoordinateSpace];
}

id objc_msgSend_screenshotsView_didHitTestView_point_withEvent_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsView:didHitTestView:point:withEvent:];
}

id objc_msgSend_screenshotsView_requestsUpdateToInteractionMode_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsView:requestsUpdateToInteractionMode:];
}

id objc_msgSend_screenshotsViewController_requestsCopyDeleteForScreenshots_deleteOptions_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsCopyDeleteForScreenshots:deleteOptions:forReason:");
}

id objc_msgSend_screenshotsViewController_requestsDeleteForScreenshots_deleteOptions_forReason_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "screenshotsViewController:requestsDeleteForScreenshots:deleteOptions:forReason:");
}

id objc_msgSend_screenshotsViewController_requestsPresentingActivityViewControllerWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsViewController:requestsPresentingActivityViewControllerWithBlock:];
}

id objc_msgSend_screenshotsViewController_requestsPresentingTestFlightFeedbackControllerWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsViewController:requestsPresentingTestFlightFeedbackControllerWithBlock:];
}

id objc_msgSend_screenshotsViewControllerShouldAllowSharing_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsViewControllerShouldAllowSharing];
}

id objc_msgSend_screenshotsViewEditModeDidChange_(void *a1, const char *a2, ...)
{
  return [a1 screenshotsViewEditModeDidChange];
}

id objc_msgSend_scrollView(void *a1, const char *a2, ...)
{
  return _[a1 scrollView];
}

id objc_msgSend_scrollViewRect(void *a1, const char *a2, ...)
{
  return _[a1 scrollViewRect];
}

id objc_msgSend_selectedAnnotations(void *a1, const char *a2, ...)
{
  return _[a1 selectedAnnotations];
}

id objc_msgSend_selectedOptionIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedOptionIndex];
}

id objc_msgSend_selectedSegmentIndex(void *a1, const char *a2, ...)
{
  return _[a1 selectedSegmentIndex];
}

id objc_msgSend_sendAsGroup(void *a1, const char *a2, ...)
{
  return _[a1 sendAsGroup];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return [a1 sendEvent:];
}

id objc_msgSend_sendResponse_(void *a1, const char *a2, ...)
{
  return [a1 sendResponse:];
}

id objc_msgSend_separatorView(void *a1, const char *a2, ...)
{
  return _[a1 separatorView];
}

id objc_msgSend_serviceOptions(void *a1, const char *a2, ...)
{
  return _[a1 serviceOptions];
}

id objc_msgSend_sessionIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sessionIdentifier];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAcceptsTouches_(void *a1, const char *a2, ...)
{
  return [a1 setAcceptsTouches:];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return [a1 setAction:];
}

id objc_msgSend_setActionInfoEdgeInsets_(void *a1, const char *a2, ...)
{
  return [a1 setActionInfoEdgeInsets:];
}

id objc_msgSend_setActionInfoLiveTextButtonDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setActionInfoLiveTextButtonDisabled:];
}

id objc_msgSend_setActionInfoViewHidden_(void *a1, const char *a2, ...)
{
  return [a1 setActionInfoViewHidden:];
}

id objc_msgSend_setActionInfoVisualSearchCornerViewDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setActionInfoVisualSearchCornerViewDisabled:];
}

id objc_msgSend_setActionName_(void *a1, const char *a2, ...)
{
  return [a1 setActionName:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveInteractionTypes_(void *a1, const char *a2, ...)
{
  return [a1 setActiveInteractionTypes:];
}

id objc_msgSend_setActiveScreenshotView_(void *a1, const char *a2, ...)
{
  return [a1 setActiveScreenshotView:];
}

id objc_msgSend_setActivityItemProviders_(void *a1, const char *a2, ...)
{
  return [a1 setActivityItemProviders:];
}

id objc_msgSend_setActivityTypeOrder_(void *a1, const char *a2, ...)
{
  return [a1 setActivityTypeOrder:];
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontForContentSizeCategory:];
}

id objc_msgSend_setAllEditingDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setAllEditingDisabled:];
}

id objc_msgSend_setAllowedTouchTypes_(void *a1, const char *a2, ...)
{
  return [a1 setAllowedTouchTypes:];
}

id objc_msgSend_setAllowsAlertItems_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAlertItems:];
}

id objc_msgSend_setAllowsAlertStacking_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsAlertStacking:];
}

id objc_msgSend_setAllowsBackdropGroups_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsBackdropGroups:];
}

id objc_msgSend_setAllowsGroupOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setAllowsGroupOpacity:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAlwaysBounceHorizontal_(void *a1, const char *a2, ...)
{
  return [a1 setAlwaysBounceHorizontal:];
}

id objc_msgSend_setAlwaysBounceVertical_(void *a1, const char *a2, ...)
{
  return [a1 setAlwaysBounceVertical:];
}

id objc_msgSend_setAnalysis_(void *a1, const char *a2, ...)
{
  return [a1 setAnalysis:];
}

id objc_msgSend_setAnalysisButtonPrefersDarkGlyphWhenSelected_(void *a1, const char *a2, ...)
{
  return [a1 setAnalysisButtonPrefersDarkGlyphWhenSelected:];
}

id objc_msgSend_setAnalysisButtonRequiresVisibleContentGating_(void *a1, const char *a2, ...)
{
  return [a1 setAnalysisButtonRequiresVisibleContentGating:];
}

id objc_msgSend_setAnalysisModeEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnalysisModeEnabled:];
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return [a1 setAnchorPoint:];
}

id objc_msgSend_setAnimationOptions_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationOptions:];
}

id objc_msgSend_setAnimationReason_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationReason:];
}

id objc_msgSend_setAnnotationController_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationController:];
}

id objc_msgSend_setAnnotationEditingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationEditingEnabled:];
}

id objc_msgSend_setAnnotationKitController_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationKitController:];
}

id objc_msgSend_setAnnotationKitController_didAllocate_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationKitController:didAllocate:];
}

id objc_msgSend_setAnnotationModeEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationModeEnabled:];
}

id objc_msgSend_setAnnotationNSDatas_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationNSDatas:];
}

id objc_msgSend_setAnnotationOverlayView_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationOverlayView:];
}

id objc_msgSend_setAnnotationsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnnotationsEnabled:];
}

id objc_msgSend_setAssetMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setAssetMetadata:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setAttributes:];
}

id objc_msgSend_setAutoScales_(void *a1, const char *a2, ...)
{
  return [a1 setAutoScales:];
}

id objc_msgSend_setAutomaticallyShowVisualSearchResults_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticallyShowVisualSearchResults:];
}

id objc_msgSend_setAutoresizesSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizesSubviews:];
}

id objc_msgSend_setBackend_(void *a1, const char *a2, ...)
{
  return [a1 setBackend:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundEffects_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundEffects:];
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:forBarMetrics:];
}

id objc_msgSend_setBackingImage_(void *a1, const char *a2, ...)
{
  return [a1 setBackingImage:];
}

id objc_msgSend_setBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setBarButtonItem:];
}

id objc_msgSend_setBarTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setBarTintColor:];
}

id objc_msgSend_setBlock_(void *a1, const char *a2, ...)
{
  return [a1 setBlock:];
}

id objc_msgSend_setBlockToRunForAddScreenshotsButton_(void *a1, const char *a2, ...)
{
  return [a1 setBlockToRunForAddScreenshotsButton:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBorderStyle:];
}

id objc_msgSend_setBorderViewStyleOverride_withAnimator_(void *a1, const char *a2, ...)
{
  return [a1 setBorderViewStyleOverride:withAnimator:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setBounces_(void *a1, const char *a2, ...)
{
  return [a1 setBounces:];
}

id objc_msgSend_setBouncesZoom_(void *a1, const char *a2, ...)
{
  return [a1 setBouncesZoom:];
}

id objc_msgSend_setBounds_forBox_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:forBox:];
}

id objc_msgSend_setCachedCGImageBackedUneditedImageForUI_(void *a1, const char *a2, ...)
{
  return [a1 setCachedCGImageBackedUneditedImageForUI];
}

id objc_msgSend_setCachedModificationInfo_(void *a1, const char *a2, ...)
{
  return [a1 setCachedModificationInfo:];
}

id objc_msgSend_setCachedOutputImage_(void *a1, const char *a2, ...)
{
  return [a1 setCachedOutputImage:];
}

id objc_msgSend_setCachedViewsHidden_(void *a1, const char *a2, ...)
{
  return [a1 setCachedViewsHidden];
}

id objc_msgSend_setCalendar_(void *a1, const char *a2, ...)
{
  return [a1 setCalendar:];
}

id objc_msgSend_setCanGenerateDocument_(void *a1, const char *a2, ...)
{
  return [a1 setCanGenerateDocument:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setChangeObserver_(void *a1, const char *a2, ...)
{
  return [a1 setChangeObserver:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return [a1 setColor:];
}

id objc_msgSend_setCompletionWithItemsHandler_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionWithItemsHandler:];
}

id objc_msgSend_setContentInset_(void *a1, const char *a2, ...)
{
  return [a1 setContentInset:];
}

id objc_msgSend_setContentOffset_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:];
}

id objc_msgSend_setContentOffset_animated_(void *a1, const char *a2, ...)
{
  return [a1 setContentOffset:animated:];
}

id objc_msgSend_setContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setContentSize:];
}

id objc_msgSend_setContentSwitcherAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setContentSwitcherAlpha:];
}

id objc_msgSend_setContentViewController_(void *a1, const char *a2, ...)
{
  return [a1 setContentViewController:];
}

id objc_msgSend_setCornerGrabberAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setCornerGrabberAlpha:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCount_(void *a1, const char *a2, ...)
{
  return [a1 setCount:];
}

id objc_msgSend_setCreateFeedbackProviders_(void *a1, const char *a2, ...)
{
  return [a1 setCreateFeedbackProviders:];
}

id objc_msgSend_setCrop_(void *a1, const char *a2, ...)
{
  return [a1 setCrop];
}

id objc_msgSend_setCropEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setCropEnabled:];
}

id objc_msgSend_setCropHandlesFadedOut_(void *a1, const char *a2, ...)
{
  return [a1 setCropHandlesFadedOut:];
}

id objc_msgSend_setCropInfo_(void *a1, const char *a2, ...)
{
  return [a1 setCropInfo:];
}

id objc_msgSend_setCropRect_(void *a1, const char *a2, ...)
{
  return [a1 setCropRect:];
}

id objc_msgSend_setCurrentInProcessRequestID_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentInProcessRequestID:];
}

id objc_msgSend_setCurrentPage_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPage:];
}

id objc_msgSend_setCurrentPageIndex_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPageIndex:];
}

id objc_msgSend_setCurrentPageIndicatorTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentPageIndicatorTintColor:];
}

id objc_msgSend_setCurrentScreenshotCropHandlesFadedOut_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentScreenshotCropHandlesFadedOut:];
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return [a1 setDamping:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDateFormat_(void *a1, const char *a2, ...)
{
  return [a1 setDateFormat:];
}

id objc_msgSend_setDebugElements_(void *a1, const char *a2, ...)
{
  return [a1 setDebugElements:];
}

id objc_msgSend_setDecelerationRate_(void *a1, const char *a2, ...)
{
  return [a1 setDecelerationRate:];
}

id objc_msgSend_setDelay_(void *a1, const char *a2, ...)
{
  return [a1 setDelay:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDeliveryCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setDeliveryCompletionBlock:];
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredHardwareButtonEvents:];
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return [a1 setDirection:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setDisplayBox_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayBox:];
}

id objc_msgSend_setDisplayLinkObserverHandler_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayLinkObserverHandler:];
}

id objc_msgSend_setDisplayMode_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayMode:];
}

id objc_msgSend_setDisplaysPageBreaks_(void *a1, const char *a2, ...)
{
  return [a1 setDisplaysPageBreaks:];
}

id objc_msgSend_setDittoRemoteAlertDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDittoRemoteAlertDelegate:];
}

id objc_msgSend_setDocument_(void *a1, const char *a2, ...)
{
  return [a1 setDocument:];
}

id objc_msgSend_setDocumentGenerator_(void *a1, const char *a2, ...)
{
  return [a1 setDocumentGenerator:];
}

id objc_msgSend_setDragAnimating_(void *a1, const char *a2, ...)
{
  return [a1 setDragAnimating:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEditMode_(void *a1, const char *a2, ...)
{
  return [a1 setEditMode:];
}

id objc_msgSend_setEditable_(void *a1, const char *a2, ...)
{
  return [a1 setEditable:];
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return [a1 setEffect:];
}

id objc_msgSend_setEligibleForHandoff_(void *a1, const char *a2, ...)
{
  return [a1 setEligibleForHandoff:];
}

id objc_msgSend_setEligibleForPrediction_(void *a1, const char *a2, ...)
{
  return [a1 setEligibleForPrediction:];
}

id objc_msgSend_setEligibleForPublicIndexing_(void *a1, const char *a2, ...)
{
  return [a1 setEligibleForPublicIndexing:];
}

id objc_msgSend_setEligibleForSearch_(void *a1, const char *a2, ...)
{
  return [a1 setEligibleForSearch:];
}

id objc_msgSend_setEnableDataDetectors_(void *a1, const char *a2, ...)
{
  return [a1 setEnableDataDetectors:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEnvironmentDescriptionIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setEnvironmentDescriptionIdentifier:];
}

id objc_msgSend_setExcludedActivityTypes_(void *a1, const char *a2, ...)
{
  return [a1 setExcludedActivityTypes:];
}

id objc_msgSend_setFillColor_(void *a1, const char *a2, ...)
{
  return [a1 setFillColor:];
}

id objc_msgSend_setFillRule_(void *a1, const char *a2, ...)
{
  return [a1 setFillRule:];
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return [a1 setFilters:];
}

id objc_msgSend_setFlag_forSetting_(void *a1, const char *a2, ...)
{
  return [a1 setFlag:forSetting:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setForceAnalysisBarButtonItemEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setForceAnalysisBarButtonItemEnabled:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setGeometryMultiplier_(void *a1, const char *a2, ...)
{
  return [a1 setGeometryMultiplier:];
}

id objc_msgSend_setGesturesEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setGesturesEnabled:];
}

id objc_msgSend_setGroupsByEvent_(void *a1, const char *a2, ...)
{
  return [a1 setGroupsByEvent:];
}

id objc_msgSend_setHarvestedMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setHarvestedMetadata:];
}

id objc_msgSend_setHasChangedBackingImage_(void *a1, const char *a2, ...)
{
  return [a1 setHasChangedBackingImage:];
}

id objc_msgSend_setHasOriginalUneditedImage_(void *a1, const char *a2, ...)
{
  return [a1 setHasOriginalUneditedImage:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHidesSourceLayer_(void *a1, const char *a2, ...)
{
  return [a1 setHidesSourceLayer:];
}

id objc_msgSend_setHidesSourceView_(void *a1, const char *a2, ...)
{
  return [a1 setHidesSourceView:];
}

id objc_msgSend_setHighFrameRateReason_(void *a1, const char *a2, ...)
{
  return [a1 setHighFrameRateReason:];
}

id objc_msgSend_setHighQualityQueueHasBeenResumed_(void *a1, const char *a2, ...)
{
  return [a1 setHighQualityQueueHasBeenResumed:];
}

id objc_msgSend_setHighQualityQueueIsValid_(void *a1, const char *a2, ...)
{
  return [a1 setHighQualityQueueIsValid:];
}

id objc_msgSend_setHighlightSelectableItems_(void *a1, const char *a2, ...)
{
  return [a1 setHighlightSelectableItems:];
}

id objc_msgSend_setHitTestsUsingSubviews_(void *a1, const char *a2, ...)
{
  return [a1 setHitTestsUsingSubviews:];
}

id objc_msgSend_setHostingViewController_(void *a1, const char *a2, ...)
{
  return [a1 setHostingViewController:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setImage_forState_(void *a1, const char *a2, ...)
{
  return [a1 setImage:forState:];
}

id objc_msgSend_setImageAnalyzer_(void *a1, const char *a2, ...)
{
  return [a1 setImageAnalyzer:];
}

id objc_msgSend_setImageDescription_(void *a1, const char *a2, ...)
{
  return [a1 setImageDescription:];
}

id objc_msgSend_setImageGenerator_(void *a1, const char *a2, ...)
{
  return [a1 setImageGenerator:];
}

id objc_msgSend_setImageIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setImageIdentifier:];
}

id objc_msgSend_setImagePixelSize_(void *a1, const char *a2, ...)
{
  return [a1 setImagePixelSize:];
}

id objc_msgSend_setImageScale_(void *a1, const char *a2, ...)
{
  return [a1 setImageScale:];
}

id objc_msgSend_setImageSource_(void *a1, const char *a2, ...)
{
  return [a1 setImageSource:];
}

id objc_msgSend_setInDragAndDrop_(void *a1, const char *a2, ...)
{
  return [a1 setInDragAndDrop:];
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return [a1 setIndex:];
}

id objc_msgSend_setInhibitImageAnalysis_(void *a1, const char *a2, ...)
{
  return [a1 setInhibitImageAnalysis:];
}

id objc_msgSend_setInitialAnnotationMode_(void *a1, const char *a2, ...)
{
  return [a1 setInitialAnnotationMode:];
}

id objc_msgSend_setInitialVelocity_(void *a1, const char *a2, ...)
{
  return [a1 setInitialVelocity:];
}

id objc_msgSend_setInteractionMode_(void *a1, const char *a2, ...)
{
  return [a1 setInteractionMode:];
}

id objc_msgSend_setInteractionTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setInteractionTintColor:];
}

id objc_msgSend_setIsBeingRemoved_(void *a1, const char *a2, ...)
{
  return [a1 setIsBeingRemoved:];
}

id objc_msgSend_setIsDeleted_(void *a1, const char *a2, ...)
{
  return [a1 setIsDeleted:];
}

id objc_msgSend_setIsInCropMode_(void *a1, const char *a2, ...)
{
  return [a1 setIsInCropMode:];
}

id objc_msgSend_setIsPDFRequested_(void *a1, const char *a2, ...)
{
  return [a1 setIsPDFRequested:];
}

id objc_msgSend_setIsPerformingFullscreenSetup_(void *a1, const char *a2, ...)
{
  return [a1 setIsPerformingFullscreenSetup:];
}

id objc_msgSend_setIsSaving_(void *a1, const char *a2, ...)
{
  return [a1 setIsSaving:];
}

id objc_msgSend_setIsSharing_(void *a1, const char *a2, ...)
{
  return [a1 setIsSharing:];
}

id objc_msgSend_setIsTransitioningStates_(void *a1, const char *a2, ...)
{
  return [a1 setIsTransitioningStates:];
}

id objc_msgSend_setItemProviders_(void *a1, const char *a2, ...)
{
  return [a1 setItemProviders:];
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return [a1 setItems:];
}

id objc_msgSend_setJobName_(void *a1, const char *a2, ...)
{
  return [a1 setJobName:];
}

id objc_msgSend_setLastViewEditMode_(void *a1, const char *a2, ...)
{
  return [a1 setLastViewEditMode:];
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchingInterfaceOrientation:];
}

id objc_msgSend_setLayoutMode_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutMode:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLeftBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItems:animated:];
}

id objc_msgSend_setLineAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setLineAlpha:];
}

id objc_msgSend_setLineGrabberAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setLineGrabberAlpha:];
}

id objc_msgSend_setLocalObject_(void *a1, const char *a2, ...)
{
  return [a1 setLocalObject:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setManagedView_(void *a1, const char *a2, ...)
{
  return [a1 setManagedView:];
}

id objc_msgSend_setMask_(void *a1, const char *a2, ...)
{
  return [a1 setMask:];
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return [a1 setMass:];
}

id objc_msgSend_setMatchesAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setMatchesAlpha:];
}

id objc_msgSend_setMatchesOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setMatchesOpacity:];
}

id objc_msgSend_setMatchesPosition_(void *a1, const char *a2, ...)
{
  return [a1 setMatchesPosition:];
}

id objc_msgSend_setMatchesTransform_(void *a1, const char *a2, ...)
{
  return [a1 setMatchesTransform:];
}

id objc_msgSend_setMaxScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setMaxScaleFactor:];
}

id objc_msgSend_setMaximumContentSizeCategory_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumContentSizeCategory:];
}

id objc_msgSend_setMaximumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumNumberOfTouches:];
}

id objc_msgSend_setMaximumValue_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumValue:];
}

id objc_msgSend_setMaximumZoomScale_(void *a1, const char *a2, ...)
{
  return [a1 setMaximumZoomScale:];
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return [a1 setMetadata:];
}

id objc_msgSend_setMinScaleFactor_(void *a1, const char *a2, ...)
{
  return [a1 setMinScaleFactor:];
}

id objc_msgSend_setMinificationFilter_(void *a1, const char *a2, ...)
{
  return [a1 setMinificationFilter:];
}

id objc_msgSend_setMinimumNumberOfTouches_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumNumberOfTouches:];
}

id objc_msgSend_setMinimumPressDuration_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumPressDuration:];
}

id objc_msgSend_setMinimumValue_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumValue:];
}

id objc_msgSend_setMinimumZoomScale_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumZoomScale:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setModelModificationInfo_forState_(void *a1, const char *a2, ...)
{
  return [a1 setModelModificationInfo:forState:];
}

id objc_msgSend_setModificationInfo_(void *a1, const char *a2, ...)
{
  return [a1 setModificationInfo:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsPageImageUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsPageImageUpdate];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberOfPages_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfPages:];
}

id objc_msgSend_setNumberOfTouchesRequiredForPanningCrop_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfTouchesRequiredForPanningCrop:];
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:atIndexedSubscript:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setObjectManipulationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setObjectManipulationDelegate:];
}

id objc_msgSend_setOpacityEditingDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setOpacityEditingDelegate:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setOrientationChangedEventsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setOrientationChangedEventsEnabled:];
}

id objc_msgSend_setOriginalAnnotations_(void *a1, const char *a2, ...)
{
  return [a1 setOriginalAnnotations:];
}

id objc_msgSend_setOutputType_(void *a1, const char *a2, ...)
{
  return [a1 setOutputType:];
}

id objc_msgSend_setOverlayControllerActive_(void *a1, const char *a2, ...)
{
  return [a1 setOverlayControllerActive:];
}

id objc_msgSend_setOverlayViewUnitRect_(void *a1, const char *a2, ...)
{
  return [a1 setOverlayViewUnitRect:];
}

id objc_msgSend_setOverrideName_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideName:];
}

id objc_msgSend_setOverrideUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideUserInterfaceStyle:];
}

id objc_msgSend_setPDFAKControllerDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPDFAKControllerDelegate:];
}

id objc_msgSend_setPDFData_(void *a1, const char *a2, ...)
{
  return [a1 setPDFData:];
}

id objc_msgSend_setPDFPage_(void *a1, const char *a2, ...)
{
  return [a1 setPDFPage:];
}

id objc_msgSend_setPDFURL_(void *a1, const char *a2, ...)
{
  return [a1 setPDFURL:];
}

id objc_msgSend_setPDFView_(void *a1, const char *a2, ...)
{
  return [a1 setPDFView:];
}

id objc_msgSend_setPDFVisibleRect_(void *a1, const char *a2, ...)
{
  return [a1 setPDFVisibleRect:];
}

id objc_msgSend_setPage_(void *a1, const char *a2, ...)
{
  return [a1 setPage:];
}

id objc_msgSend_setPageBreakMargins_(void *a1, const char *a2, ...)
{
  return [a1 setPageBreakMargins:];
}

id objc_msgSend_setPageCropRect_(void *a1, const char *a2, ...)
{
  return [a1 setPageCropRect:];
}

id objc_msgSend_setPageIndex_(void *a1, const char *a2, ...)
{
  return [a1 setPageIndex:];
}

id objc_msgSend_setPagingEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setPagingEnabled:];
}

id objc_msgSend_setPaperKitChangeCounter_(void *a1, const char *a2, ...)
{
  return [a1 setPaperKitChangeCounter:];
}

id objc_msgSend_setPaperRect_(void *a1, const char *a2, ...)
{
  return [a1 setPaperRect:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPdfAsImage_(void *a1, const char *a2, ...)
{
  return [a1 setPdfAsImage:];
}

id objc_msgSend_setPdfView_(void *a1, const char *a2, ...)
{
  return [a1 setPdfView:];
}

id objc_msgSend_setPencilAlwaysDraws_(void *a1, const char *a2, ...)
{
  return [a1 setPencilAlwaysDraws:];
}

id objc_msgSend_setPerformingDismissAnimation_(void *a1, const char *a2, ...)
{
  return [a1 setPerformingDismissAnimation:];
}

id objc_msgSend_setPermittedArrowDirections_(void *a1, const char *a2, ...)
{
  return [a1 setPermittedArrowDirections:];
}

id objc_msgSend_setPreCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setPreCompletionHandler:];
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredContentSize:];
}

id objc_msgSend_setPreferredFrameRateRange_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredFrameRateRange:];
}

id objc_msgSend_setPreferredFramesPerSecond_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredFramesPerSecond:];
}

id objc_msgSend_setPreferredHeight_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredHeight:];
}

id objc_msgSend_setPreferredPresentationSize_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPresentationSize:];
}

id objc_msgSend_setPreferredQuickActionButtonHeight_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredQuickActionButtonHeight:];
}

id objc_msgSend_setPreferredSymbolConfiguration_forImageInState_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredSymbolConfiguration:forImageInState:];
}

id objc_msgSend_setPresentationMode_(void *a1, const char *a2, ...)
{
  return [a1 setPresentationMode:];
}

id objc_msgSend_setPreventSheetDismissal_(void *a1, const char *a2, ...)
{
  return [a1 setPreventSheetDismissal:];
}

id objc_msgSend_setPrintFormatters_(void *a1, const char *a2, ...)
{
  return [a1 setPrintFormatters:];
}

id objc_msgSend_setPrintableRect_(void *a1, const char *a2, ...)
{
  return [a1 setPrintableRect:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return [a1 setProgress:];
}

id objc_msgSend_setPropertyAnimator_(void *a1, const char *a2, ...)
{
  return [a1 setPropertyAnimator:];
}

id objc_msgSend_setReachabilityDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setReachabilityDisabled:];
}

id objc_msgSend_setRecapMovie_(void *a1, const char *a2, ...)
{
  return [a1 setRecapMovie:];
}

id objc_msgSend_setRectsForShadow_(void *a1, const char *a2, ...)
{
  return [a1 setRectsForShadow];
}

id objc_msgSend_setRedoItemAction_(void *a1, const char *a2, ...)
{
  return [a1 setRedoItemAction:];
}

id objc_msgSend_setRedoItemTarget_(void *a1, const char *a2, ...)
{
  return [a1 setRedoItemTarget:];
}

id objc_msgSend_setRenameOption_(void *a1, const char *a2, ...)
{
  return [a1 setRenameOption:];
}

id objc_msgSend_setRepresentation_(void *a1, const char *a2, ...)
{
  return [a1 setRepresentation];
}

id objc_msgSend_setRightBarButtonItems_animated_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItems:animated:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setRulerHostView_(void *a1, const char *a2, ...)
{
  return [a1 setRulerHostView:];
}

id objc_msgSend_setRulerHostingDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setRulerHostingDelegate:];
}

id objc_msgSend_setRulerHostingView_(void *a1, const char *a2, ...)
{
  return [a1 setRulerHostingView:];
}

id objc_msgSend_setSaveLocation_(void *a1, const char *a2, ...)
{
  return [a1 setSaveLocation:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 setScreenshot:];
}

id objc_msgSend_setScreenshotEditsSnapshotted_(void *a1, const char *a2, ...)
{
  return [a1 setScreenshotEditsSnapshotted];
}

id objc_msgSend_setScreenshotEditsSnapshotted_inTransition_currentScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 setScreenshotEditsSnapshotted:inTransition:currentScreenshot:];
}

id objc_msgSend_setScreenshotViewsUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return [a1 setScreenshotViewsUseTrilinearMinificationFilter:];
}

id objc_msgSend_setScreenshotsUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return [a1 setScreenshotsUseTrilinearMinificationFilter:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setScrollViewVisibleRectInPDFView_(void *a1, const char *a2, ...)
{
  return [a1 setScrollViewVisibleRectInPDFView:];
}

id objc_msgSend_setScrollingBounds_(void *a1, const char *a2, ...)
{
  return [a1 setScrollingBounds:];
}

id objc_msgSend_setScrollsToTop_(void *a1, const char *a2, ...)
{
  return [a1 setScrollsToTop:];
}

id objc_msgSend_setSelected_(void *a1, const char *a2, ...)
{
  return [a1 setSelected:];
}

id objc_msgSend_setSelectedSegmentIndex_(void *a1, const char *a2, ...)
{
  return [a1 setSelectedSegmentIndex:];
}

id objc_msgSend_setShadowColor_(void *a1, const char *a2, ...)
{
  return [a1 setShadowColor:];
}

id objc_msgSend_setShadowImage_(void *a1, const char *a2, ...)
{
  return [a1 setShadowImage:];
}

id objc_msgSend_setShadowOffset_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOffset:];
}

id objc_msgSend_setShadowOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setShadowOpacity:];
}

id objc_msgSend_setShadowPath_(void *a1, const char *a2, ...)
{
  return [a1 setShadowPath:];
}

id objc_msgSend_setShadowRadius_(void *a1, const char *a2, ...)
{
  return [a1 setShadowRadius:];
}

id objc_msgSend_setShareAsOption_(void *a1, const char *a2, ...)
{
  return [a1 setShareAsOption:];
}

id objc_msgSend_setShareButtonAction_(void *a1, const char *a2, ...)
{
  return [a1 setShareButtonAction:];
}

id objc_msgSend_setShareButtonHidden_(void *a1, const char *a2, ...)
{
  return [a1 setShareButtonHidden:];
}

id objc_msgSend_setShareButtonTarget_(void *a1, const char *a2, ...)
{
  return [a1 setShareButtonTarget:];
}

id objc_msgSend_setShareItemAction_(void *a1, const char *a2, ...)
{
  return [a1 setShareItemAction];
}

id objc_msgSend_setShareItemTarget_(void *a1, const char *a2, ...)
{
  return [a1 setShareItemTarget:];
}

id objc_msgSend_setShouldFlick_(void *a1, const char *a2, ...)
{
  return [a1 setShouldFlick:];
}

id objc_msgSend_setShouldUpdate_(void *a1, const char *a2, ...)
{
  return [a1 setShouldUpdate:];
}

id objc_msgSend_setShowingSharingUI_(void *a1, const char *a2, ...)
{
  return [a1 setShowingSharingUI:];
}

id objc_msgSend_setShowsHorizontalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsHorizontalScrollIndicator:];
}

id objc_msgSend_setShowsLargeContentViewer_(void *a1, const char *a2, ...)
{
  return [a1 setShowsLargeContentViewer:];
}

id objc_msgSend_setShowsShadow_(void *a1, const char *a2, ...)
{
  return [a1 setShowsShadow:];
}

id objc_msgSend_setShowsShadow_animated_(void *a1, const char *a2, ...)
{
  return [a1 setShowsShadow:animated:];
}

id objc_msgSend_setShowsVerticalScrollIndicator_(void *a1, const char *a2, ...)
{
  return [a1 setShowsVerticalScrollIndicator:];
}

id objc_msgSend_setSiriActionActivity_(void *a1, const char *a2, ...)
{
  return [a1 setSiriActionActivity:];
}

id objc_msgSend_setSizeMultiplier_(void *a1, const char *a2, ...)
{
  return [a1 setSizeMultiplier:];
}

id objc_msgSend_setSnapRects_(void *a1, const char *a2, ...)
{
  return [a1 setSnapRects:];
}

id objc_msgSend_setSnapshotFirstPage_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotFirstPage:];
}

id objc_msgSend_setSnapshotScreenshotEdits_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshotScreenshotEdits:];
}

id objc_msgSend_setSnapshots_(void *a1, const char *a2, ...)
{
  return [a1 setSnapshots:];
}

id objc_msgSend_setSourceContextId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceContextId:];
}

id objc_msgSend_setSourceLayer_(void *a1, const char *a2, ...)
{
  return [a1 setSourceLayer:];
}

id objc_msgSend_setSourceLayerRenderId_(void *a1, const char *a2, ...)
{
  return [a1 setSourceLayerRenderId:];
}

id objc_msgSend_setSourceRect_(void *a1, const char *a2, ...)
{
  return [a1 setSourceRect:];
}

id objc_msgSend_setSourceView_(void *a1, const char *a2, ...)
{
  return [a1 setSourceView:];
}

id objc_msgSend_setSpecialization_(void *a1, const char *a2, ...)
{
  return [a1 setSpecialization:];
}

id objc_msgSend_setSpeed_(void *a1, const char *a2, ...)
{
  return [a1 setSpeed:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setState_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 setState:animated:completion:];
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return [a1 setStiffness:];
}

id objc_msgSend_setSuccess_(void *a1, const char *a2, ...)
{
  return [a1 setSuccess:];
}

id objc_msgSend_setSuggestedName_(void *a1, const char *a2, ...)
{
  return [a1 setSuggestedName:];
}

id objc_msgSend_setSupportsOpacityEditing_(void *a1, const char *a2, ...)
{
  return [a1 setSupportsOpacityEditing:];
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return [a1 setTarget:];
}

id objc_msgSend_setTemporaryPDFURL_(void *a1, const char *a2, ...)
{
  return [a1 setTemporaryPDFURL];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setTextAlignment:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setThumbnail_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnail:];
}

id objc_msgSend_setThumbnailImage_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnailImage:];
}

id objc_msgSend_setThumbnailSize_(void *a1, const char *a2, ...)
{
  return [a1 setThumbnailSize:];
}

id objc_msgSend_setTimeZone_(void *a1, const char *a2, ...)
{
  return [a1 setTimeZone:];
}

id objc_msgSend_setTimingFunction_(void *a1, const char *a2, ...)
{
  return [a1 setTimingFunction:];
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return [a1 setTintColor:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleTextAttributes_(void *a1, const char *a2, ...)
{
  return [a1 setTitleTextAttributes:];
}

id objc_msgSend_setTitleView_(void *a1, const char *a2, ...)
{
  return [a1 setTitleView:];
}

id objc_msgSend_setToolMode_(void *a1, const char *a2, ...)
{
  return [a1 setToolMode:];
}

id objc_msgSend_setToolPickerVisible_forFirstResponder_(void *a1, const char *a2, ...)
{
  return [a1 setToolPickerVisible:forFirstResponder:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setTranslucent_(void *a1, const char *a2, ...)
{
  return [a1 setTranslucent:];
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return [a1 setType:];
}

id objc_msgSend_setUndoItemAction_(void *a1, const char *a2, ...)
{
  return [a1 setUndoItemAction:];
}

id objc_msgSend_setUndoItemTarget_(void *a1, const char *a2, ...)
{
  return [a1 setUndoItemTarget:];
}

id objc_msgSend_setUndoRedoButtonsHidden_(void *a1, const char *a2, ...)
{
  return [a1 setUndoRedoButtonsHidden:];
}

id objc_msgSend_setUnitRectForContent_(void *a1, const char *a2, ...)
{
  return [a1 setUnitRectForContent:];
}

id objc_msgSend_setUnoccludedRect_(void *a1, const char *a2, ...)
{
  return [a1 setUnoccludedRect:];
}

id objc_msgSend_setUseHighVisibilityDefaultInks_(void *a1, const char *a2, ...)
{
  return [a1 setUseHighVisibilityDefaultInks:];
}

id objc_msgSend_setUseTrilinearMinificationFilter_(void *a1, const char *a2, ...)
{
  return [a1 setUseTrilinearMinificationFilter:];
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return [a1 setUserInfo:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setUserInterfaceHidden_(void *a1, const char *a2, ...)
{
  return [a1 setUserInterfaceHidden:];
}

id objc_msgSend_setUsesOriginalImageAspectRatio_(void *a1, const char *a2, ...)
{
  return [a1 setUsesOriginalImageAspectRatio:];
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return [a1 setValue:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVellumOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setVellumOpacity:];
}

id objc_msgSend_setVellumView_(void *a1, const char *a2, ...)
{
  return [a1 setVellumView:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setViewControllerManager_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllerManager:];
}

id objc_msgSend_setViewControllers_direction_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:direction:animated:completion:];
}

id objc_msgSend_setViewModificationInfo_forState_(void *a1, const char *a2, ...)
{
  return [a1 setViewModificationInfo:forState:];
}

id objc_msgSend_setViewState_(void *a1, const char *a2, ...)
{
  return [a1 setViewState:];
}

id objc_msgSend_setViewToCrop_(void *a1, const char *a2, ...)
{
  return [a1 setViewToCrop:];
}

id objc_msgSend_setVisible_forFirstResponder_(void *a1, const char *a2, ...)
{
  return [a1 setVisible:forFirstResponder:];
}

id objc_msgSend_setVisibleRect_(void *a1, const char *a2, ...)
{
  return [a1 setVisibleRect:];
}

id objc_msgSend_setWantsAutomaticContentsRectCalculation_(void *a1, const char *a2, ...)
{
  return [a1 setWantsAutomaticContentsRectCalculation:];
}

id objc_msgSend_setWantsClearBackgroundColorInCompactSize_(void *a1, const char *a2, ...)
{
  return [a1 setWantsClearBackgroundColorInCompactSize:];
}

id objc_msgSend_setWantsTranslucentActionInfoButtons_(void *a1, const char *a2, ...)
{
  return [a1 setWantsTranslucentActionInfoButtons:];
}

id objc_msgSend_setWidth_(void *a1, const char *a2, ...)
{
  return [a1 setWidth:];
}

id objc_msgSend_setWidth_forSegmentAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 setWidth:forSegmentAtIndex:];
}

id objc_msgSend_setWillSoonUnparentChildDittoRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setWillSoonUnparentChildDittoRootViewController:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_setZoomScale_(void *a1, const char *a2, ...)
{
  return [a1 setZoomScale:];
}

id objc_msgSend_setZoomScale_animated_(void *a1, const char *a2, ...)
{
  return [a1 setZoomScale:animated:];
}

id objc_msgSend_set_delegate_(void *a1, const char *a2, ...)
{
  return [a1 set_delegate:];
}

id objc_msgSend_set_wantsFormFieldDetection_(void *a1, const char *a2, ...)
{
  return [a1 set_wantsFormFieldDetection:];
}

id objc_msgSend_settingsWithMass_stiffness_damping_(void *a1, const char *a2, ...)
{
  return [a1 settingsWithMass:stiffness:damping:];
}

id objc_msgSend_setupDocumentViewController(void *a1, const char *a2, ...)
{
  return _[a1 setupDocumentViewController];
}

id objc_msgSend_setupOverlayControllerWithPDFDocument_(void *a1, const char *a2, ...)
{
  return [a1 setupOverlayControllerWithPDFDocument:];
}

id objc_msgSend_setupPDFData(void *a1, const char *a2, ...)
{
  return _[a1 setupPDFData];
}

id objc_msgSend_setupPDFView(void *a1, const char *a2, ...)
{
  return _[a1 setupPDFView];
}

id objc_msgSend_setupPaperKitView(void *a1, const char *a2, ...)
{
  return _[a1 setupPaperKitView];
}

id objc_msgSend_shadowColor(void *a1, const char *a2, ...)
{
  return _[a1 shadowColor];
}

id objc_msgSend_shadowOffset(void *a1, const char *a2, ...)
{
  return _[a1 shadowOffset];
}

id objc_msgSend_shadowOpacity(void *a1, const char *a2, ...)
{
  return _[a1 shadowOpacity];
}

id objc_msgSend_shadowPath(void *a1, const char *a2, ...)
{
  return _[a1 shadowPath];
}

id objc_msgSend_shadowRadius(void *a1, const char *a2, ...)
{
  return _[a1 shadowRadius];
}

id objc_msgSend_shareAsOption(void *a1, const char *a2, ...)
{
  return _[a1 shareAsOption];
}

id objc_msgSend_shareItemAction(void *a1, const char *a2, ...)
{
  return _[a1 shareItemAction];
}

id objc_msgSend_shareItemTarget(void *a1, const char *a2, ...)
{
  return _[a1 shareItemTarget];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedAssetManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedAssetManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedSSSApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedSSSApplication];
}

id objc_msgSend_sharedScreenshotManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedScreenshotManager];
}

id objc_msgSend_sharedSignificantEventController(void *a1, const char *a2, ...)
{
  return _[a1 sharedSignificantEventController];
}

id objc_msgSend_sharedStatisticsManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedStatisticsManager];
}

id objc_msgSend_shouldCaptureDocumentForMetadataUpdate_(void *a1, const char *a2, ...)
{
  return [a1 shouldCaptureDocumentForMetadataUpdate:];
}

id objc_msgSend_shouldFlash(void *a1, const char *a2, ...)
{
  return _[a1 shouldFlash];
}

id objc_msgSend_shouldIncludePDF(void *a1, const char *a2, ...)
{
  return _[a1 shouldIncludePDF];
}

id objc_msgSend_shouldShowThumbnailOptionView(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowThumbnailOptionView];
}

id objc_msgSend_shouldUseMiniMapView(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseMiniMapView];
}

id objc_msgSend_showingSharingUI(void *a1, const char *a2, ...)
{
  return _[a1 showingSharingUI];
}

id objc_msgSend_showingWaitingForImageIdentifierUpdatesUI(void *a1, const char *a2, ...)
{
  return _[a1 showingWaitingForImageIdentifierUpdatesUI];
}

id objc_msgSend_showsShadow(void *a1, const char *a2, ...)
{
  return _[a1 showsShadow];
}

id objc_msgSend_significantEventControllerRequestsTransitionToStateForTest_(void *a1, const char *a2, ...)
{
  return [a1 significantEventControllerRequestsTransitionToStateForTest:];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeMultiplier(void *a1, const char *a2, ...)
{
  return _[a1 sizeMultiplier];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_skipShutterSound(void *a1, const char *a2, ...)
{
  return _[a1 skipShutterSound];
}

id objc_msgSend_snapRects(void *a1, const char *a2, ...)
{
  return _[a1 snapRects];
}

id objc_msgSend_snapUnitRects(void *a1, const char *a2, ...)
{
  return _[a1 snapUnitRects];
}

id objc_msgSend_snapshotScreenshotEdits(void *a1, const char *a2, ...)
{
  return _[a1 snapshotScreenshotEdits];
}

id objc_msgSend_snapshots(void *a1, const char *a2, ...)
{
  return _[a1 snapshots];
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_sourceContextId(void *a1, const char *a2, ...)
{
  return _[a1 sourceContextId];
}

id objc_msgSend_sourceLayerRenderId(void *a1, const char *a2, ...)
{
  return _[a1 sourceLayerRenderId];
}

id objc_msgSend_speed(void *a1, const char *a2, ...)
{
  return _[a1 speed];
}

id objc_msgSend_springAnimationParametersWithDuration_mass_stiffness_damping_speed_controlPointOne_controlPointTwo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "springAnimationParametersWithDuration:mass:stiffness:damping:speed:controlPointOne:controlPointTwo:");
}

id objc_msgSend_ss_cgImageBackedImageFromImageSurface_(void *a1, const char *a2, ...)
{
  return [a1 ss_cgImageBackedImageFromImageSurface:];
}

id objc_msgSend_ss_imageFromImageSurface_(void *a1, const char *a2, ...)
{
  return [a1 ss_imageFromImageSurface:];
}

id objc_msgSend_sssAppDelegate(void *a1, const char *a2, ...)
{
  return _[a1 sssAppDelegate];
}

id objc_msgSend_sss_animateWithAnimationParameters_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 sss_animateWithAnimationParameters:animations:completion:];
}

id objc_msgSend_sss_miniatureBorderColor(void *a1, const char *a2, ...)
{
  return [a1 sss_miniatureBorderColor];
}

id objc_msgSend_sss_setFrameUnanimating_(void *a1, const char *a2, ...)
{
  return [a1 sss_setFrameUnanimating:];
}

id objc_msgSend_sss_setFrameUnanimatingIfChangingFromCGSizeZero_(void *a1, const char *a2, ...)
{
  return [a1 sss_setFrameUnanimatingIfChangingFromCGSizeZero:];
}

id objc_msgSend_sss_setFrameUnanimatingLayingOut_(void *a1, const char *a2, ...)
{
  return [a1 sss_setFrameUnanimatingLayingOut:];
}

id objc_msgSend_startAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 startAccessingSecurityScopedResource];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startCropTimestamp(void *a1, const char *a2, ...)
{
  return _[a1 startCropTimestamp];
}

id objc_msgSend_startObserver(void *a1, const char *a2, ...)
{
  return _[a1 startObserver];
}

id objc_msgSend_startedTest_(void *a1, const char *a2, ...)
{
  return [a1 startedTest:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stateTransitionFinished(void *a1, const char *a2, ...)
{
  return _[a1 stateTransitionFinished];
}

id objc_msgSend_statusBarVisibilityForTraitCollection_isPortrait_(void *a1, const char *a2, ...)
{
  return [a1 statusBarVisibilityForTraitCollection:isPortrait:];
}

id objc_msgSend_stopAccessingSecurityScopedResource(void *a1, const char *a2, ...)
{
  return _[a1 stopAccessingSecurityScopedResource];
}

id objc_msgSend_stopBeingParentOfDittoRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopBeingParentOfDittoRootViewController:");
}

id objc_msgSend_stopObserver(void *a1, const char *a2, ...)
{
  return _[a1 stopObserver];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(void *a1, const char *a2, ...)
{
  return [a1 stringByAddingPercentEncodingWithAllowedCharacters:];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingFormat:];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathComponent:];
}

id objc_msgSend_stringByAppendingPathExtension_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingPathExtension:];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByDeletingPathExtension(void *a1, const char *a2, ...)
{
  return _[a1 stringByDeletingPathExtension];
}

id objc_msgSend_stringByReplacingOccurrencesOfString_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingOccurrencesOfString:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithString_(void *a1, const char *a2, ...)
{
  return [a1 stringWithString:];
}

id objc_msgSend_strokes(void *a1, const char *a2, ...)
{
  return _[a1 strokes];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_success(void *a1, const char *a2, ...)
{
  return _[a1 success];
}

id objc_msgSend_successful(void *a1, const char *a2, ...)
{
  return _[a1 successful];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportedAnalysisTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedAnalysisTypes];
}

id objc_msgSend_supportedInterfaceOrientations(void *a1, const char *a2, ...)
{
  return _[a1 supportedInterfaceOrientations];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return [a1 systemLayoutSizeFittingSize:];
}

id objc_msgSend_systemTraitsAffectingColorAppearance(void *a1, const char *a2, ...)
{
  return _[a1 systemTraitsAffectingColorAppearance];
}

id objc_msgSend_takeValueFromModificationInfo_forKey_(void *a1, const char *a2, ...)
{
  return [a1 takeValueFromModificationInfo:forKey:];
}

id objc_msgSend_tapGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 tapGestureRecognizer];
}

id objc_msgSend_tapToRadar_screenshot_(void *a1, const char *a2, ...)
{
  return [a1 tapToRadar:screenshot:];
}

id objc_msgSend_tapToRadarURL(void *a1, const char *a2, ...)
{
  return _[a1 tapToRadarURL];
}

id objc_msgSend_targetForCancellingDragItem_inContainer_(void *a1, const char *a2, ...)
{
  return [a1 targetForCancellingDragItem:inContainer:];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return _[a1 teardown];
}

id objc_msgSend_temporaryPDFFile(void *a1, const char *a2, ...)
{
  return _[a1 temporaryPDFFile];
}

id objc_msgSend_temporaryPDFURL(void *a1, const char *a2, ...)
{
  return _[a1 temporaryPDFURL];
}

id objc_msgSend_testName(void *a1, const char *a2, ...)
{
  return _[a1 testName];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textFieldCustomizationWithText_placeholder_identifier_footerText_textChangedHandler_(void *a1, const char *a2, ...)
{
  return [a1 textFieldCustomizationWithText:placeholder:identifier:footerText:textChangedHandler:];
}

id objc_msgSend_thumbnailImage(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImage];
}

id objc_msgSend_thumbnailOfSize_forBox_(void *a1, const char *a2, ...)
{
  return [a1 thumbnailOfSize:forBox:];
}

id objc_msgSend_timeZoneForSecondsFromGMT_(void *a1, const char *a2, ...)
{
  return [a1 timeZoneForSecondsFromGMT:];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_toolPicker(void *a1, const char *a2, ...)
{
  return _[a1 toolPicker];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topBar(void *a1, const char *a2, ...)
{
  return _[a1 topBar];
}

id objc_msgSend_topItem(void *a1, const char *a2, ...)
{
  return _[a1 topItem];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_translationInView_(void *a1, const char *a2, ...)
{
  return [a1 translationInView:];
}

id objc_msgSend_trimmedFrom_to_(void *a1, const char *a2, ...)
{
  return [a1 trimmedFrom:to:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_undo(void *a1, const char *a2, ...)
{
  return _[a1 undo];
}

id objc_msgSend_undoActionName(void *a1, const char *a2, ...)
{
  return _[a1 undoActionName];
}

id objc_msgSend_undoForViewState_(void *a1, const char *a2, ...)
{
  return [a1 undoForViewState:];
}

id objc_msgSend_undoManager(void *a1, const char *a2, ...)
{
  return _[a1 undoManager];
}

id objc_msgSend_undoManagerForEditMode_(void *a1, const char *a2, ...)
{
  return [a1 undoManagerForEditMode:];
}

id objc_msgSend_undoStackChangedForScreenshotsView_(void *a1, const char *a2, ...)
{
  return [a1 undoStackChangedForScreenshotsView:];
}

id objc_msgSend_undoStateMightHaveChanged(void *a1, const char *a2, ...)
{
  return _[a1 undoStateMightHaveChanged];
}

id objc_msgSend_uninstallInterstitialGesture_(void *a1, const char *a2, ...)
{
  return [a1 uninstallInterstitialGesture];
}

id objc_msgSend_unitRectCoordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 unitRectCoordinateSpace];
}

id objc_msgSend_unitRectForContent(void *a1, const char *a2, ...)
{
  return _[a1 unitRectForContent];
}

id objc_msgSend_unoccludedRect(void *a1, const char *a2, ...)
{
  return _[a1 unoccludedRect];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateAnalysisButtonStateToVisible_(void *a1, const char *a2, ...)
{
  return [a1 updateAnalysisButtonStateToVisible:];
}

id objc_msgSend_updateAnnotationButtonForCurrentState(void *a1, const char *a2, ...)
{
  return _[a1 updateAnnotationButtonForCurrentState];
}

id objc_msgSend_updateForFrame_(void *a1, const char *a2, ...)
{
  return [a1 updateForFrame:];
}

id objc_msgSend_updateHiddenRegionViewWithVisibleRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateHiddenRegionViewWithVisibleRect:");
}

id objc_msgSend_updateInteractionHighlightStatusIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateInteractionHighlightStatusIfNecessary];
}

id objc_msgSend_updatePDFViewFromVisibleRegionView(void *a1, const char *a2, ...)
{
  return _[a1 updatePDFViewFromVisibleRegionView];
}

id objc_msgSend_updatePaletteVisibilityIfNecessary_(void *a1, const char *a2, ...)
{
  return [a1 updatePaletteVisibilityIfNecessary:];
}

id objc_msgSend_updateScreenshotsInteractionModeIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 updateScreenshotsInteractionModeIfNecessary];
}

id objc_msgSend_updateUndoState(void *a1, const char *a2, ...)
{
  return _[a1 updateUndoState];
}

id objc_msgSend_updateViewState(void *a1, const char *a2, ...)
{
  return _[a1 updateViewState];
}

id objc_msgSend_updateVisibleRegionViewFromPDFView(void *a1, const char *a2, ...)
{
  return _[a1 updateVisibleRegionViewFromPDFView];
}

id objc_msgSend_updateVisibleRegionViewWithVisibleRect_(void *a1, const char *a2, ...)
{
  return [a1 updateVisibleRegionViewWithVisibleRect:];
}

id objc_msgSend_useTrilinearMinificationFilter(void *a1, const char *a2, ...)
{
  return _[a1 useTrilinearMinificationFilter];
}

id objc_msgSend_userActivityTitle(void *a1, const char *a2, ...)
{
  return _[a1 userActivityTitle];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceBecameInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceBecameInterestedInScreenshot];
}

id objc_msgSend_userInterfaceHidden(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceHidden];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStoppedBeingInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userInterfaceStoppedBeingInterestedInScreenshot:");
}

id objc_msgSend_userInterfaceWillStopBeingInterestedInScreenshot_(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceWillStopBeingInterestedInScreenshot:];
}

id objc_msgSend_validateRedo_(void *a1, const char *a2, ...)
{
  return [a1 validateRedo:];
}

id objc_msgSend_validateUndo_(void *a1, const char *a2, ...)
{
  return [a1 validateUndo:];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return [a1 valueForKey:];
}

id objc_msgSend_valueWithCGRect_(void *a1, const char *a2, ...)
{
  return [a1 valueWithCGRect:];
}

id objc_msgSend_vellumOpacity(void *a1, const char *a2, ...)
{
  return _[a1 vellumOpacity];
}

id objc_msgSend_vellumView(void *a1, const char *a2, ...)
{
  return _[a1 vellumView];
}

id objc_msgSend_velocityInView_(void *a1, const char *a2, ...)
{
  return [a1 velocityInView:];
}

id objc_msgSend_verticalSizeClass(void *a1, const char *a2, ...)
{
  return _[a1 verticalSizeClass];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewContainingScreenshotContents(void *a1, const char *a2, ...)
{
  return _[a1 viewContainingScreenshotContents];
}

id objc_msgSend_viewControllerForOverlayPresentations(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerForOverlayPresentations];
}

id objc_msgSend_viewControllerForPresentationsFromScreenshotView_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForPresentationsFromScreenshotView:];
}

id objc_msgSend_viewControllerForPresentationsFromScreenshotsView_(void *a1, const char *a2, ...)
{
  return [a1 viewControllerForPresentationsFromScreenshotsView:];
}

id objc_msgSend_viewControllerManager(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerManager];
}

id objc_msgSend_viewDidDisappear_(void *a1, const char *a2, ...)
{
  return [a1 viewDidDisappear:];
}

id objc_msgSend_viewForPage_(void *a1, const char *a2, ...)
{
  return [a1 viewForPage:];
}

id objc_msgSend_viewForZoomingInScrollView_(void *a1, const char *a2, ...)
{
  return [a1 viewForZoomingInScrollView:];
}

id objc_msgSend_viewModificationInfo(void *a1, const char *a2, ...)
{
  return _[a1 viewModificationInfo];
}

id objc_msgSend_viewModificationInfoForState_(void *a1, const char *a2, ...)
{
  return [a1 viewModificationInfoForState:];
}

id objc_msgSend_viewState(void *a1, const char *a2, ...)
{
  return _[a1 viewState];
}

id objc_msgSend_viewToCrop(void *a1, const char *a2, ...)
{
  return _[a1 viewToCrop];
}

id objc_msgSend_viewWithScreenshotImage(void *a1, const char *a2, ...)
{
  return _[a1 viewWithScreenshotImage];
}

id objc_msgSend_viewsForScreenshots_(void *a1, const char *a2, ...)
{
  return [a1 viewsForScreenshots];
}

id objc_msgSend_visiblePDFPageWhenScreenshotted(void *a1, const char *a2, ...)
{
  return _[a1 visiblePDFPageWhenScreenshotted];
}

id objc_msgSend_visiblePDFRectWhenScreenshotted(void *a1, const char *a2, ...)
{
  return _[a1 visiblePDFRectWhenScreenshotted];
}

id objc_msgSend_visiblePages(void *a1, const char *a2, ...)
{
  return _[a1 visiblePages];
}

id objc_msgSend_visibleRect(void *a1, const char *a2, ...)
{
  return _[a1 visibleRect];
}

id objc_msgSend_visibleScreenshots(void *a1, const char *a2, ...)
{
  return _[a1 visibleScreenshots];
}

id objc_msgSend_visionKitFeedbackActivity(void *a1, const char *a2, ...)
{
  return _[a1 visionKitFeedbackActivity];
}

id objc_msgSend_visualSearchCornerView(void *a1, const char *a2, ...)
{
  return _[a1 visualSearchCornerView];
}

id objc_msgSend_visualSearchResultItems(void *a1, const char *a2, ...)
{
  return _[a1 visualSearchResultItems];
}

id objc_msgSend_vsGlyph(void *a1, const char *a2, ...)
{
  return _[a1 vsGlyph];
}

id objc_msgSend_vsGlyphFilled(void *a1, const char *a2, ...)
{
  return _[a1 vsGlyphFilled];
}

id objc_msgSend_waitingForImageIdentifierUpdatesAlertControllerDidCancel_(void *a1, const char *a2, ...)
{
  return [a1 waitingForImageIdentifierUpdatesAlertControllerDidCancel:];
}

id objc_msgSend_wasJustSavedForMode_(void *a1, const char *a2, ...)
{
  return [a1 wasJustSavedForMode:];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_whitespaceCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_widthForContentSwitcher_forView_(void *a1, const char *a2, ...)
{
  return [a1 widthForContentSwitcher:forView:];
}

id objc_msgSend_widthForOpacityControlInView_withContentSwitcher_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "widthForOpacityControlInView:withContentSwitcher:");
}

id objc_msgSend_willMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParentViewController:];
}

id objc_msgSend_willSoonUnparentChildDittoRootViewController(void *a1, const char *a2, ...)
{
  return _[a1 willSoonUnparentChildDittoRootViewController];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}

id objc_msgSend_writeToFile_atomically_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:atomically:];
}

id objc_msgSend_writeToFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 writeToFile:options:error:];
}

id objc_msgSend_writeToURL_completion_(void *a1, const char *a2, ...)
{
  return [a1 writeToURL:completion:];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToURL:options:error:");
}

id objc_msgSend_zoomScale(void *a1, const char *a2, ...)
{
  return _[a1 zoomScale];
}

id objc_msgSend_zoomToRect_animated_(void *a1, const char *a2, ...)
{
  return [a1 zoomToRect:animated:];
}