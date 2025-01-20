void sub_1000032D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003300(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    dispatch_time_t v4 = dispatch_time(0, 100000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003408;
    block[3] = &unk_100008350;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    v5 = *(void **)(a1 + 40);
    block[4] = *(void *)(a1 + 32);
    id v9 = v5;
    id v6 = v3;
    uint64_t v7 = *(void *)(a1 + 48);
    id v10 = v6;
    uint64_t v11 = v7;
    dispatch_after(v4, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(&v12);
  }
  else if ([*(id *)(a1 + 48) useFancyTransition])
  {
    [*(id *)(a1 + 48) _bailFailedAnimateEnterMarkup];
  }
}

void sub_100003408(uint64_t a1)
{
  v2 = +[NSOperationQueue mainQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000034FC;
  v6[3] = &unk_100008350;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v3 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  id v8 = v4;
  uint64_t v9 = v5;
  [v2 addOperationWithBlock:v6];

  objc_destroyWeak(&v10);
}

void sub_1000034E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1000034FC(uint64_t a1)
{
  v2 = (id *)(a1 + 64);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = [*(id *)(a1 + 32) userInfo];
  uint64_t v5 = [v4 objectForKey:MUEncryptPrivateMetadata];

  if (v5 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(WeakRetained, "setEncryptPrivateMetadata:", objc_msgSend(v5, "BOOLValue"));
  }
  if ([*(id *)(a1 + 40) conformsToType:UTTypeFileURL])
  {
    [WeakRetained setFileURL:*(void *)(a1 + 48) withArchivedModelData:0];
  }
  else if ([*(id *)(a1 + 40) conformsToType:UTTypeData])
  {
    uint64_t v6 = *(void *)(a1 + 48);
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    uint64_t v11 = sub_100003710;
    id v12 = &unk_100008328;
    objc_copyWeak(&v14, v2);
    uint64_t v13 = *(void *)(a1 + 32);
    [WeakRetained _setData:v6 withArchivedModelData:0 withCompletion:&v9];
    objc_destroyWeak(&v14);
  }
  else if ([*(id *)(a1 + 40) conformsToType:UTTypeImage])
  {
    [WeakRetained setImage:*(void *)(a1 + 48) withArchivedModelData:0];
  }
  else if ([*(id *)(a1 + 40) conformsToType:UTTypePDF])
  {
    [WeakRetained setData:*(void *)(a1 + 48) withArchivedModelData:0];
  }
  id v7 = objc_msgSend(*(id *)(a1 + 32), "userInfo", v9, v10, v11, v12);
  id v8 = [v7 valueForKey:MUFileDisplayName];

  if (v8) {
    [*(id *)(a1 + 56) setPreferredFileDisplayName:v8];
  }
}

void sub_1000036FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100003710(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained useFancyTransition])
  {
    v2 = [*(id *)(a1 + 32) userInfo];
    [WeakRetained _animateEnteringMarkupWithInfo:v2];
  }
}

id sub_10000385C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) contentViewController];
  [v2 visibleContentRect];
  double v4 = v3;
  double v6 = v5;

  id v7 = *(void **)(a1 + 32);
  return objc_msgSend(v7, "_adjustFormSheetFrameToFitSize:", v4, v6);
}

void sub_100004AB4(id *a1)
{
  v2 = [a1[4] contentContainerView];
  long long v3 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v38[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v38[1] = v3;
  v38[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  [v2 setTransform:v38];

  id v4 = a1[5];
  double v5 = [a1[4] contentViewController];
  [v5 visibleContentRect];
  objc_msgSend(v4, "convertRect:fromView:", 0);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100004DD8;
  v36[3] = &unk_1000083C8;
  id v37 = a1[6];
  +[UIView addKeyframeWithRelativeStartTime:v36 relativeDuration:0.75 animations:0.25];
  [a1[5] bounds];
  v40.origin.x = v7;
  v40.origin.y = v9;
  v40.size.width = v11;
  v40.size.height = v13;
  if (!CGRectContainsRect(v39, v40))
  {
    unsigned int v14 = [a1[4] showAsFormSheet];
    id v15 = a1[4];
    if (v14)
    {
      [v15 _rectBetweenNavAndToolbar];
    }
    else
    {
      double v5 = [v15 view];
      [v5 bounds];
    }
    objc_msgSend(a1[5], "setFrame:");
    if ((v14 & 1) == 0) {

    }
    id v16 = a1[5];
    v17 = [a1[4] contentViewController];
    [v17 visibleContentRect];
    objc_msgSend(v16, "convertRect:fromView:", 0);
    double v7 = v18;
    double v9 = v19;
    double v11 = v20;
    double v13 = v21;
  }
  objc_msgSend(a1[7], "setFrame:", v7, v9, v11, v13);
  id v22 = a1[8];
  if (v22)
  {
    v31 = _NSConcreteStackBlock;
    uint64_t v32 = 3221225472;
    v33 = sub_100004E60;
    v34 = &unk_1000083C8;
    id v35 = v22;
    +[UIView addKeyframeWithRelativeStartTime:&v31 relativeDuration:0.0 animations:0.5];
    objc_msgSend(a1[7], "bounds", v31, v32, v33, v34);
    objc_msgSend(a1[8], "setFrame:");
  }
  v23 = [a1[4] toolbar];
  [v23 setAlpha:1.0];

  v24 = [a1[4] navBar];
  [v24 setAlpha:1.0];

  v25 = [a1[4] contentViewController];
  v26 = [v25 view];
  [v26 setAlpha:1.0];

  if ([a1[4] showAsFormSheet])
  {
    v27 = [a1[4] transitionDimmingView];
    [v27 setAlpha:0.37];
  }
  v28 = [a1[4] annotationController];
  v29 = [v28 toolbarViewController];

  v30 = [v29 floatingAttributeToolbarContainer];
  [v30 setAlpha:1.0];

  [a1[9] setAlpha:1.0];
}

id sub_100004DD8(uint64_t a1)
{
  +[CATransaction begin];
  v2 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
  +[CATransaction setAnimationTimingFunction:v2];

  [*(id *)(a1 + 32) setAlpha:0.0];
  return +[CATransaction commit];
}

id sub_100004E60(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_100004E6C(id *a1)
{
  [a1[4] removeFromSuperview];
  [a1[5] removeFromSuperview];
  [a1[6] removeFromSuperview];
  v2 = [a1[7] _effectiveBackgroundColor];
  long long v3 = [a1[7] contentContainerView];
  [v3 setBackgroundColor:v2];

  if (([a1[7] showAsFormSheet] & 1) == 0)
  {
    id v4 = [a1[7] whiteView];
    [v4 removeFromSuperview];

    [a1[7] setWhiteView:0];
  }
  id v5 = a1[7];
  return [v5 setIsAnimatingMarkupExtensionTransition:0];
}

void sub_1000055B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1000055EC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) showAsFormSheet])
  {
    v2 = *(CGRect **)(*(void *)(a1 + 72) + 8);
    long long v3 = [*(id *)(a1 + 32) view];
    objc_msgSend(v3, "convertRect:fromView:", 0, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
    v44.origin.double x = v4;
    v44.origin.double y = v5;
    v44.size.double width = v6;
    v44.size.double height = v7;
    CGRect v43 = CGRectIntersection(v2[1], v44);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;

    double v12 = *(void **)(a1 + 32);
    if (v12)
    {
      objc_msgSend(v12, "_transformToHideContainerViewBehindBounds:", x, y, width, height);
      double v12 = *(void **)(a1 + 32);
    }
    else
    {
      long long v41 = 0u;
      long long v42 = 0u;
      long long v40 = 0u;
    }
    double v13 = [v12 contentContainerView];
    v39[0] = v40;
    v39[1] = v41;
    v39[2] = v42;
    [v13 setTransform:v39];
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100005978;
  v37[3] = &unk_1000083C8;
  id v38 = *(id *)(a1 + 40);
  +[UIView addKeyframeWithRelativeStartTime:v37 relativeDuration:0.0 animations:0.25];
  if (CGRectContainsRect(*(CGRect *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(CGRect *)(a1 + 80)))
  {
    uint64_t v14 = *(void *)(*(void *)(a1 + 72) + 8);
    long long v15 = *(_OWORD *)(a1 + 96);
    *(_OWORD *)(v14 + 32) = *(_OWORD *)(a1 + 80);
    *(_OWORD *)(v14 + 48) = v15;
  }
  id v16 = *(CGRect **)(*(void *)(a1 + 72) + 8);
  [*(id *)(a1 + 48) frame];
  v45.origin.double x = v17;
  v45.origin.double y = v18;
  v45.size.double width = v19;
  v45.size.double height = v20;
  if (!CGRectEqualToRect(v16[1], v45)) {
    objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 72) + 8) + 56));
  }
  double v21 = *(void **)(a1 + 48);
  id v22 = [*(id *)(a1 + 32) view];
  v23 = [v22 window];
  objc_msgSend(v21, "convertRect:fromView:", v23, *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  objc_msgSend(*(id *)(a1 + 56), "setFrame:");

  if (*(void *)(a1 + 64))
  {
    [*(id *)(a1 + 56) bounds];
    objc_msgSend(*(id *)(a1 + 64), "setFrame:");
    uint64_t v32 = _NSConcreteStackBlock;
    uint64_t v33 = 3221225472;
    v34 = sub_100005A00;
    id v35 = &unk_1000083C8;
    id v36 = *(id *)(a1 + 64);
    +[UIView addKeyframeWithRelativeStartTime:&v32 relativeDuration:0.5 animations:0.5];
  }
  v24 = objc_msgSend(*(id *)(a1 + 32), "contentViewController", v32, v33, v34, v35);
  v25 = [v24 view];
  [v25 setAlpha:0.0];

  v26 = [*(id *)(a1 + 32) toolbar];
  [v26 setAlpha:0.0];

  v27 = [*(id *)(a1 + 32) navBar];
  [v27 setAlpha:0.0];

  if ([*(id *)(a1 + 32) showAsFormSheet])
  {
    v28 = [*(id *)(a1 + 32) transitionDimmingView];
    [v28 setAlpha:0.0];
  }
  v29 = [*(id *)(a1 + 32) annotationController];
  v30 = [v29 toolbarViewController];

  v31 = [v30 floatingAttributeToolbarContainer];
  [v31 setAlpha:0.0];
}

id sub_100005978(uint64_t a1)
{
  +[CATransaction begin];
  v2 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
  +[CATransaction setAnimationTimingFunction:v2];

  [*(id *)(a1 + 32) setAlpha:1.0];
  return +[CATransaction commit];
}

id sub_100005A00(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void sub_100005A0C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) userDidCancel])
  {
    id v4 = +[NSError errorWithDomain:NSCocoaErrorDomain code:3072 userInfo:&__NSDictionary0__struct];
    v2 = [*(id *)(a1 + 32) extensionContext];
    [v2 cancelRequestWithError:v4];

    [*(id *)(a1 + 32) documentDidCloseTeardown];
  }
  else
  {
    long long v3 = [*(id *)(a1 + 32) extensionContext];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100005B20;
    v5[3] = &unk_100008468;
    v5[4] = *(void *)(a1 + 32);
    [v3 completeRequestReturningItems:0 completionHandler:v5];
  }
}

void sub_100005B20(uint64_t a1)
{
  if (+[NSThread isMainThread])
  {
    v2 = *(void **)(a1 + 32);
    [v2 documentDidCloseTeardown];
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005BD8;
    block[3] = &unk_1000083C8;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_100005BD8(uint64_t a1)
{
  return [*(id *)(a1 + 32) documentDidCloseTeardown];
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  return _CGRectIntersection(r1, r2);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return _CGRectIsInfinite(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

id objc_msgSend__bailFailedAnimateEnterMarkup(void *a1, const char *a2, ...)
{
  return [a1 _bailFailedAnimateEnterMarkup];
}

id objc_msgSend__containerBounds(void *a1, const char *a2, ...)
{
  return [a1 _containerBounds];
}

id objc_msgSend__createCancelDoneNavBar(void *a1, const char *a2, ...)
{
  return [a1 _createCancelDoneNavBar];
}

id objc_msgSend__effectiveBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _effectiveBackgroundColor];
}

id objc_msgSend__minimumFormSheetDimensions(void *a1, const char *a2, ...)
{
  return [a1 _minimumFormSheetDimensions];
}

id objc_msgSend__rectBetweenNavAndToolbar(void *a1, const char *a2, ...)
{
  return [a1 _rectBetweenNavAndToolbar];
}

id objc_msgSend__setupContainerAndDimmingViews(void *a1, const char *a2, ...)
{
  return [a1 _setupContainerAndDimmingViews];
}

id objc_msgSend_annotationController(void *a1, const char *a2, ...)
{
  return [a1 annotationController];
}

id objc_msgSend_attachments(void *a1, const char *a2, ...)
{
  return [a1 attachments];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_contentContainerView(void *a1, const char *a2, ...)
{
  return [a1 contentContainerView];
}

id objc_msgSend_contentSnapshot(void *a1, const char *a2, ...)
{
  return [a1 contentSnapshot];
}

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_documentDidCloseTeardown(void *a1, const char *a2, ...)
{
  return [a1 documentDidCloseTeardown];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_floatingAttributeToolbarContainer(void *a1, const char *a2, ...)
{
  return [a1 floatingAttributeToolbarContainer];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_isAnimatingMarkupExtensionTransition(void *a1, const char *a2, ...)
{
  return [a1 isAnimatingMarkupExtensionTransition];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_navBar(void *a1, const char *a2, ...)
{
  return [a1 navBar];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return [a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_showAsFormSheet(void *a1, const char *a2, ...)
{
  return [a1 showAsFormSheet];
}

id objc_msgSend_toolbar(void *a1, const char *a2, ...)
{
  return [a1 toolbar];
}

id objc_msgSend_toolbarViewController(void *a1, const char *a2, ...)
{
  return [a1 toolbarViewController];
}

id objc_msgSend_transitionDimmingView(void *a1, const char *a2, ...)
{
  return [a1 transitionDimmingView];
}

id objc_msgSend_useFancyTransition(void *a1, const char *a2, ...)
{
  return [a1 useFancyTransition];
}

id objc_msgSend_userDidCancel(void *a1, const char *a2, ...)
{
  return [a1 userDidCancel];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleContentRect(void *a1, const char *a2, ...)
{
  return [a1 visibleContentRect];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_whiteView(void *a1, const char *a2, ...)
{
  return [a1 whiteView];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}