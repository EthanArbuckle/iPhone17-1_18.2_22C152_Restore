void sub_100001E48(uint64_t a1)
{
  id v1;
  uint64_t vars8;

  v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
  [v1 invalidate];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100024720);
}

void sub_100001EA8(id a1)
{
}

void sub_100002204(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100002510(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000025A4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
}

void sub_100002ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100002AE4()
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v0 = (void (*)(void))off_10002E760;
  v8 = off_10002E760;
  if (!off_10002E760)
  {
    id v1 = (void *)sub_100002CD4();
    v6[3] = (uint64_t)dlsym(v1, "CACLogAccessibility");
    off_10002E760 = (_UNKNOWN *)v6[3];
    v0 = (void (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)sub_100013028();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  v2 = v0();

  return v2;
}

Class sub_100002C7C(uint64_t a1)
{
  sub_100002CD4();
  Class result = objc_getClass("CACCustomCommandEditorViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E738 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000132EC();
    return (Class)sub_100002CD4();
  }
  return result;
}

uint64_t sub_100002CD4()
{
  v3[0] = 0;
  if (!qword_10002E740)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100002DD4;
    v3[4] = &unk_1000247A8;
    v3[5] = v3;
    long long v4 = off_100024790;
    uint64_t v5 = 0;
    qword_10002E740 = _sl_dlopen();
  }
  uint64_t v0 = qword_10002E740;
  id v1 = (void *)v3[0];
  if (!qword_10002E740)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_100002DD4()
{
  uint64_t result = _sl_dlopen();
  qword_10002E740 = result;
  return result;
}

Class sub_100002E48(uint64_t a1)
{
  sub_100002CD4();
  Class result = objc_getClass("CACSpokenCommandItem");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E748 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_100013314();
    return (Class)sub_100002EA0(v3);
  }
  return result;
}

Class sub_100002EA0(uint64_t a1)
{
  sub_100002CD4();
  Class result = objc_getClass("CACPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E750 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10001333C();
    return (Class)sub_100002EF8(v3);
  }
  return result;
}

void *sub_100002EF8(uint64_t a1)
{
  v2 = (void *)sub_100002CD4();
  Class result = dlsym(v2, "CACLogPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10002E758 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100002F48(uint64_t a1)
{
  v2 = (void *)sub_100002CD4();
  Class result = dlsym(v2, "CACLogAccessibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10002E760 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100002F98(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CACRecordedUserActionFlow");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E768 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100013364();
    sub_100002FF0();
  }
}

void sub_100003008(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_100003EB0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_100003ED0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

uint64_t start(int a1, char **a2)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_100004760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000489C(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:1.0];
  id v2 = [*(id *)(a1 + 40) popoverPresentingViewController];
  [v2 didMoveToParentViewController:*(void *)(a1 + 40)];
}

void sub_1000049C0(uint64_t a1)
{
  [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
  id v3 = [*(id *)(a1 + 32) popoverPresentingViewController];
  id v2 = [v3 view];
  [v2 setAlpha:0.0];
}

void sub_100004A34(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
}

void sub_100004D64(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CACCorrectionsCollectionViewController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E770 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_1000136A8();
    sub_100004DBC();
  }
}

void sub_100004DBC()
{
  v1[0] = 0;
  if (!qword_10002E778)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100004EB8;
    v1[4] = &unk_1000247A8;
    v1[5] = v1;
    long long v2 = off_100024818;
    uint64_t v3 = 0;
    qword_10002E778 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_10002E778)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100004EB8()
{
  uint64_t result = _sl_dlopen();
  qword_10002E778 = result;
  return result;
}

VOTQuickSettingsListViewController *sub_100004F2C(uint64_t a1)
{
  sub_100004DBC();
  uint64_t result = (VOTQuickSettingsListViewController *)objc_getClass("CACPopoverPresentingViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10002E780 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (VOTQuickSettingsListViewController *)sub_1000136D0();
    return [(VOTQuickSettingsListViewController *)v3 initWithNibName:v5 bundle:v6];
  }
  return result;
}

void sub_1000053B8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 88));
  _Unwind_Resume(a1);
}

void sub_1000053F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_100005434(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_100005474(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_100005B98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100005BBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained _isFiltering])
  {
    id v1 = sub_10000CFD0(@"item.count");
    long long v2 = [WeakRetained filteredSpecifiers];
    uint64_t v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v1, [v2 count]);

    UIAccessibilitySpeakIfNotSpeaking();
  }
}

void sub_10000643C(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) imageExplorerViewController];
  long long v2 = [*(id *)(a1 + 32) hostAppName];
  uint64_t v3 = *(void *)(a1 + 40);
  SEL v4 = [*(id *)(a1 + 32) visionResult];
  id v5 = [v4 features];
  id v6 = [*(id *)(a1 + 32) detailData];
  [v7 launchImageExplorerFromHostApp:v2 withImage:v3 visionFeatures:v5 data:v6];
}

id sub_1000064FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadImageViewIfNeeded];
}

void sub_100006A1C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
  [v1 invalidate];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1000248A8);
}

void sub_100006A7C(id a1)
{
}

void sub_100007214(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location,char a27)
{
  objc_destroyWeak(&location);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007240(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100007250(uint64_t a1)
{
}

void sub_100007258(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  uint64_t v3 = VOTLogImageExplorer();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100013CE0();
  }

  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = [WeakRetained _photoAssetDataWithNetWorkAccess:1];
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  v9 = VOTLogImageExplorer();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v23 = (objc_class *)objc_opt_class();
    v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138412546;
    v32 = v24;
    __int16 v33 = 2048;
    double v34 = v8 - v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ - Loading image from network took %.3fs to complete", buf, 0x16u);
  }
  id v10 = objc_alloc((Class)UIImage);
  v11 = [v6 imageData];
  id v12 = [v10 initWithData:v11];

  v13 = [*(id *)(a1 + 40) visionEngine];
  v14 = +[AXMVisionAnalysisOptions voiceOverOptions];
  +[NSDate timeIntervalSinceReferenceDate];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100007550;
  v26[3] = &unk_1000248D0;
  uint64_t v30 = v15;
  uint64_t v29 = *(void *)(a1 + 64);
  v26[4] = WeakRetained;
  id v27 = v12;
  long long v25 = *(_OWORD *)(a1 + 48);
  id v16 = (id)v25;
  long long v28 = v25;
  id v17 = v12;
  v18 = objc_retainBlock(v26);
  v19 = [v13 imageNode];
  [v19 setShouldProcessRemotely:1];

  v20 = VOTLogImageExplorer();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
    sub_100013C50();
  }

  v21 = [v13 imageNode];
  id v22 = [objc_alloc((Class)CIImage) initWithImage:v17];
  [v21 triggerWithImage:v22 options:v14 cacheKey:0 resultHandler:v18];
}

void sub_100007550(uint64_t a1, void *a2)
{
  id v3 = a2;
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = VOTLogImageExplorer();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100013E3C();
  }

  double v5 = VOTLogImageExplorer();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_100013D80();
  }

  UIAccessibilityNotifications v6 = UIAccessibilityAnnouncementNotification;
  double v7 = sub_10000CFD0(@"VoiceOverImageExplorer.image.and.features.updated");
  UIAccessibilityPostNotification(v6, v7);

  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v3;
  id v10 = v3;

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), *(id *)(a1 + 40));
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

void sub_100007664(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) imageExplorerViewController];
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v3 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) features];
  double v4 = [*(id *)(a1 + 32) detailData];
  [v5 updateImageExplorerWithImage:v2 features:v3 data:v4];
}

id sub_100007D18(uint64_t a1, void *a2)
{
  id v3 = [a2 label];
  id v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

void sub_100008000(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100008098(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x20u);
}

BOOL sub_1000084F0(uint64_t a1, void *a2)
{
  return [a2 ocrFeatureType] == *(id *)(a1 + 32);
}

BOOL sub_1000085E8(id a1, id a2, NSDictionary *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  UIAccessibilityNotifications v6 = __UIAccessibilityCastAsClass();
  double v7 = v6;
  if (v6) {
    unsigned __int8 v8 = [v6 isHeader];
  }
  else {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

BOOL sub_10000929C(uint64_t a1, void *a2)
{
  return [a2 ocrFeatureType] == *(id *)(a1 + 32);
}

id sub_100009C14(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_100009F30(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id sub_10000A518(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

void sub_10000A684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000A6A8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000A6B8(uint64_t a1)
{
}

void sub_10000A6C0(uint64_t a1, void *a2)
{
  id v27 = a2;
  [*(id *)(a1 + 40) normalizedFrame];
  [*(id *)(a1 + 32) frame];
  UIAccessibilityFrameForBounds();
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  [v27 normalizedFrame];
  [*(id *)(a1 + 32) frame];
  UIAccessibilityFrameForBounds();
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v29.origin.CGFloat x = v5;
  v29.origin.CGFloat y = v7;
  v29.size.CGFloat width = v9;
  v29.size.CGFloat height = v11;
  v34.origin.CGFloat x = v13;
  v34.origin.CGFloat y = v15;
  v34.size.CGFloat width = v17;
  v34.size.CGFloat height = v19;
  if (CGRectIntersectsRect(v29, v34)) {
    goto LABEL_10;
  }
  v30.origin.CGFloat x = v13;
  v30.origin.CGFloat y = v15;
  v30.size.CGFloat width = v17;
  v30.size.CGFloat height = v19;
  v35.origin.CGFloat x = v5;
  v35.origin.CGFloat y = v7;
  v35.size.CGFloat width = v9;
  v35.size.CGFloat height = v11;
  if (CGRectContainsRect(v30, v35))
  {
LABEL_10:
    v31.origin.CGFloat x = v13;
    v31.origin.CGFloat y = v15;
    v31.size.CGFloat width = v17;
    v31.size.CGFloat height = v19;
    v36.origin.CGFloat x = v5;
    v36.origin.CGFloat y = v7;
    v36.size.CGFloat width = v9;
    v36.size.CGFloat height = v11;
    CGRect v32 = CGRectIntersection(v31, v36);
    CGFloat x = v32.origin.x;
    CGFloat y = v32.origin.y;
    CGFloat width = v32.size.width;
    CGFloat height = v32.size.height;
    double v24 = CGRectGetWidth(v32);
    v33.origin.CGFloat x = x;
    v33.origin.CGFloat y = y;
    v33.size.CGFloat width = width;
    v33.size.CGFloat height = height;
    double v25 = v24 * CGRectGetHeight(v33);
    uint64_t v26 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v25 > *(double *)(v26 + 24))
    {
      *(double *)(v26 + 24) = v25;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    }
  }
}

void sub_10000AAD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000AAF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGFloat v5 = [WeakRetained elements];
  double v6 = [v5 objectForKeyedSubscript:*(void *)(a1 + 32)];

  if (![v6 count]) {
    goto LABEL_17;
  }
  CGFloat v7 = *(__CFString **)(a1 + 32);
  if (v7 == @"VoiceOverImageExplorer.text.rotor")
  {
    CGFloat v9 = [v6 firstObject];
    uint64_t v8 = [v9 accessibilityElements];

    double v6 = v9;
    goto LABEL_7;
  }
  if (v7 == @"VoiceOverImageExplorer.document.rotor" || v7 == @"VoiceOverImageExplorer.table.rotor")
  {
    uint64_t v8 = [v6 ax_flatMappedArrayUsingBlock:&stru_100024A60];
LABEL_7:

    double v6 = (void *)v8;
  }
  if ([v6 count])
  {
    double v10 = [v3 currentItem];
    CGFloat v11 = [v10 targetElement];
    id v12 = [v6 indexOfObject:v11];

    if (v12 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v13 = 0;
    }
    else
    {
      if ([v3 searchDirection]) {
        unint64_t v13 = (unint64_t)v12 + 1;
      }
      else {
        unint64_t v13 = (unint64_t)v12 - 1;
      }
      if ((v13 & 0x8000000000000000) != 0) {
        goto LABEL_17;
      }
    }
    if (v13 < (unint64_t)[v6 count])
    {
      id v14 = objc_alloc_init((Class)UIAccessibilityCustomRotorItemResult);
      CGFloat v15 = [v6 objectAtIndexedSubscript:v13];
      [v14 setTargetElement:v15];

      goto LABEL_18;
    }
  }
LABEL_17:
  id v14 = 0;
LABEL_18:

  return v14;
}

id sub_10000ACBC(id a1, id a2)
{
  id v2 = a2;
  id v3 = [v2 accessibilityElements];
  id v4 = [v3 count];

  if (v4)
  {
    CGFloat v5 = [v2 accessibilityElements];
    double v6 = [v5 firstObject];
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

void sub_10000B450(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_10000B494()
{
}

void sub_10000B49C(uint64_t a1, void *a2)
{
  id v15 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _axNearbyRelationKeyForFeature:*(void *)(a1 + 32) andNeighborFeature:v15];

  if (v4)
  {
    CGFloat v5 = [v15 faceDetectionResult];
    double v6 = [v5 name];

    if (AXRuntimeCheck_MediaAnalysisSupport())
    {
      CGFloat v7 = [v15 mediaAnalysisFaceDetectionResult];
      uint64_t v8 = [v7 name];

      double v6 = (__CFString *)v8;
    }
    if (![(__CFString *)v6 length])
    {

      double v6 = @"UNKFace";
    }
    CGFloat v9 = [*(id *)(a1 + 40) objectForKey:v4];
    id v10 = [v9 mutableCopy];
    CGFloat v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = +[NSMutableArray array];
    }
    unint64_t v13 = v12;

    id v14 = [[VOTImageExplorerCustomContentValue alloc] initWithFeatureValue:v6 featureType:@"Face"];
    [v13 axSafelyAddObject:v14];
    [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v4];
  }
}

void sub_10000B610(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _axNearbyRelationKeyForFeature:*(void *)(a1 + 32) andNeighborFeature:v13];

  if (v4)
  {
    CGFloat v5 = [*(id *)(a1 + 40) objectForKey:v4];
    id v6 = [v5 mutableCopy];
    CGFloat v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSMutableArray array];
    }
    CGFloat v9 = v8;

    id v10 = [VOTImageExplorerCustomContentValue alloc];
    CGFloat v11 = [v13 classificationLocalizedValue];
    id v12 = [(VOTImageExplorerCustomContentValue *)v10 initWithFeatureValue:v11 featureType:@"Object"];

    [v9 axSafelyAddObject:v12];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v4];
  }
}

void sub_10000B734(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [WeakRetained _axNearbyRelationKeyForFeature:*(void *)(a1 + 32) andNeighborFeature:v13];

  if (v4 && [v13 ocrFeatureType] != (id)1)
  {
    CGFloat v5 = [*(id *)(a1 + 40) objectForKey:v4];
    id v6 = [v5 mutableCopy];
    CGFloat v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = +[NSMutableArray array];
    }
    CGFloat v9 = v8;

    id v10 = [VOTImageExplorerCustomContentValue alloc];
    CGFloat v11 = +[AXMVisionFeature nameForOCRType:](AXMVisionFeature, "nameForOCRType:", [v13 ocrFeatureType]);
    id v12 = [(VOTImageExplorerCustomContentValue *)v10 initWithFeatureValue:v11 featureType:@"OCR"];

    [v9 axSafelyAddObject:v12];
    [*(id *)(a1 + 40) setObject:v9 forKeyedSubscript:v4];
  }
}

void sub_10000B9A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000B9C0(uint64_t a1, void *a2, void *a3)
{
  id v34 = a2;
  id v36 = a3;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10000A6A8;
  v49 = sub_10000A6B8;
  id v50 = +[NSString string];
  uint64_t v4 = [v36 axFilterObjectsUsingBlock:&stru_100024AF0];
  CGRect v35 = [v4 axFilterObjectsUsingBlock:&stru_100024B10];
  CGRect v32 = v4;
  id v5 = [v4 count];
  if (v5)
  {
    id v6 = sub_10000CFD0(@"VoiceOverImageExplorer.maybe.x.people");
    long long v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v5);
    uint64_t v7 = __UIAXStringForVariables();
    id v8 = (void *)v46[5];
    v46[5] = v7;

    if (objc_msgSend(v35, "count", v28, @"__AXStringForVariablesSentinel"))
    {
      CGFloat v9 = sub_10000CFD0(@"VoiceOverImageExplorer.relations.including.people.names");
      id v10 = [v35 valueForKeyPath:@"@distinctUnionOfObjects.value"];
      CGFloat v11 = UIAXLabelForElements();
      id v27 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v11);
      CFStringRef v30 = @"__AXStringForVariablesSentinel";
      uint64_t v12 = __UIAXStringForVariables();
      id v13 = (void *)v46[5];
      v46[5] = v12;
    }
  }
  v39 = [v36 axFilterObjectsUsingBlock:&stru_100024B30 v27, v30];
  v38 = objc_opt_new();
  [v39 valueForKeyPath:@"@distinctUnionOfObjects.value"];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v14 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v42;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
        double v18 = +[NSPredicate predicateWithFormat:@"value = %@", v17];
        CGFloat v19 = [v39 filteredArrayUsingPredicate:v18];
        id v20 = [v19 count];

        v21 = +[NSNumber numberWithUnsignedInteger:v20];
        [v38 setObject:v21 forKey:v17];
      }
      id v14 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
    }
    while (v14);
  }

  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_10000BF98;
  v40[3] = &unk_100024B58;
  v40[4] = &v45;
  [v38 enumerateKeysAndObjectsUsingBlock:v40];
  id v22 = [v36 axFilterObjectsUsingBlock:&stru_100024B78];
  if ([v22 count])
  {
    v23 = [v22 valueForKeyPath:@"@distinctUnionOfObjects.value"];
    CGRect v29 = UIAXLabelForElements();
    CFStringRef v31 = @"__AXStringForVariablesSentinel";
    uint64_t v24 = __UIAXStringForVariables();
    double v25 = (void *)v46[5];
    v46[5] = v24;
  }
  uint64_t v26 = +[AXCustomContent customContentWithLabel:value:](AXCustomContent, "customContentWithLabel:value:", v34, v46[5], v29, v31);
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) axSafelyAddObject:v26];

  _Block_object_dispose(&v45, 8);
}

void sub_10000BE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

BOOL sub_10000BECC(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  id v3 = [(VOTImageExplorerCustomContentValue *)a2 type];
  unsigned __int8 v4 = [v3 isEqualToString:@"Face"];

  return v4;
}

BOOL sub_10000BF10(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  id v3 = [(VOTImageExplorerCustomContentValue *)a2 value];
  char v4 = [v3 isEqualToString:@"UNKFace"] ^ 1;

  return v4;
}

BOOL sub_10000BF54(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  id v3 = [(VOTImageExplorerCustomContentValue *)a2 type];
  unsigned __int8 v4 = [v3 isEqualToString:@"Object"];

  return v4;
}

void sub_10000BF98(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = [a3 unsignedIntegerValue];
  id v6 = v11;
  if (v5)
  {
    uint64_t v7 = v11;
    if (v5 != (id)1)
    {
      uint64_t v7 = +[NSString stringWithFormat:@"%lu %@", v5, v11];
    }
    uint64_t v8 = __UIAXStringForVariables();
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    id v6 = v11;
    if (v5 != (id)1)
    {

      id v6 = v11;
    }
  }
}

BOOL sub_10000C074(id a1, VOTImageExplorerCustomContentValue *a2, unint64_t a3)
{
  id v3 = [(VOTImageExplorerCustomContentValue *)a2 type];
  unsigned __int8 v4 = [v3 isEqualToString:@"OCR"];

  return v4;
}

void sub_10000CCF8(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 sceneClassId];
  [v2 axSafelyAddObject:v3];
}

void sub_10000CDEC(id a1)
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  id v1 = (id *)qword_10002E7A8;
  id v10 = (void *)qword_10002E7A8;
  if (!qword_10002E7A8)
  {
    id v2 = (void *)sub_10000D0B4();
    v8[3] = (uint64_t)dlsym(v2, "kTCCServicePhotos");
    qword_10002E7A8 = v8[3];
    id v1 = (id *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v1)
  {
    sub_100013028();
    goto LABEL_9;
  }
  id v3 = *v1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unsigned __int8 v4 = (unsigned int (*)(id, void))off_10002E798;
  id v10 = off_10002E798;
  if (!off_10002E798)
  {
    id v5 = (void *)sub_10000D0B4();
    v8[3] = (uint64_t)dlsym(v5, "TCCAccessPreflight");
    off_10002E798 = (_UNKNOWN *)v8[3];
    unsigned __int8 v4 = (unsigned int (*)(id, void))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v4)
  {
LABEL_9:
    id v6 = (_Unwind_Exception *)sub_100013028();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v6);
  }
  byte_10002E788 = v4(v3, 0) == 0;
}

id sub_10000CFD0(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:v1 value:&stru_100024F38 table:@"AXUIViewService"];

  return v3;
}

void *sub_10000D064(uint64_t a1)
{
  id v2 = (void *)sub_10000D0B4();
  uint64_t result = dlsym(v2, "TCCAccessPreflight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_10002E798 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10000D0B4()
{
  v3[0] = 0;
  if (!qword_10002E7A0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10000D1B4;
    v3[4] = &unk_1000247A8;
    v3[5] = v3;
    long long v4 = off_100024C08;
    uint64_t v5 = 0;
    qword_10002E7A0 = _sl_dlopen();
  }
  uint64_t v0 = qword_10002E7A0;
  id v1 = (void *)v3[0];
  if (!qword_10002E7A0)
  {
    id v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_10000D1B4()
{
  uint64_t result = _sl_dlopen();
  qword_10002E7A0 = result;
  return result;
}

void *sub_10000D228(uint64_t a1)
{
  id v2 = (void *)sub_10000D0B4();
  uint64_t result = dlsym(v2, "kTCCServicePhotos");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10002E7A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000D5C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000D5E0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained value];
  id v2 = AXFormatFloatWithPercentage();

  return v2;
}

id sub_10000F304(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) selectAll:0];
}

void sub_10000F5B0(id a1)
{
  id v1 = +[NSBundle bundleWithPath:@"/System/Library/AccessibilityBundles/GAXClient.bundle"];
  id v2 = v1;
  if (v1)
  {
    id v16 = 0;
    unsigned __int8 v3 = [v1 loadAndReturnError:&v16];
    long long v4 = v16;
    if (v3) {
      goto LABEL_14;
    }
    uint64_t v5 = +[AXSubsystemVoiceOver sharedInstance];
    unsigned __int8 v6 = [v5 ignoreLogging];

    if (v6) {
      goto LABEL_14;
    }
    uint64_t v7 = +[AXSubsystemVoiceOver identifier];
    uint64_t v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_13;
    }
    id v10 = AXColorizeFormatLog();
    id v11 = _AXStringForArgs();
    if (os_log_type_enabled(v8, v9))
    {
      *(_DWORD *)buf = 138543362;
      double v18 = v11;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "%{public}@", buf, 0xCu);
    }

LABEL_12:
LABEL_13:

    goto LABEL_14;
  }
  uint64_t v12 = +[AXSubsystemVoiceOver sharedInstance];
  unsigned __int8 v13 = [v12 ignoreLogging];

  if ((v13 & 1) == 0)
  {
    id v14 = +[AXSubsystemVoiceOver identifier];
    long long v4 = AXLoggerForFacility();

    os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
    if (!os_log_type_enabled(v4, v15))
    {
LABEL_14:

      goto LABEL_15;
    }
    uint64_t v8 = AXColorizeFormatLog();
    id v10 = _AXStringForArgs();
    if (os_log_type_enabled(v4, v15))
    {
      *(_DWORD *)buf = 138543362;
      double v18 = v10;
      _os_log_impl((void *)&_mh_execute_header, v4, v15, "%{public}@", buf, 0xCu);
    }
    goto LABEL_12;
  }
LABEL_15:
}

uint64_t sub_10000FC0C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 56) objectAtIndex:];
  uint64_t v3 = [v2 containsObject:*(void *)(a1 + 40)] ^ 1;

  return v3;
}

BOOL sub_10000FC5C(id a1, id a2)
{
  return [a2 isAccessibilityElement];
}

void sub_10000FD44(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:0.0];
}

id sub_10000FD8C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) resignFirstResponder];
  [*(id *)(*(void *)(a1 + 32) + 16) setText:&stru_100024F38];
  [*(id *)(*(void *)(a1 + 32) + 32) removeAllObjects];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 104);
  *(void *)(v2 + 104) = 0;

  long long v4 = [*(id *)(a1 + 32) delegate];
  [v4 itemChooser:*(void *)(a1 + 32) didSelectItemAtIndex:*(void *)(*(void *)(a1 + 32) + 112) activate:*(unsigned __int8 *)(*(void *)(a1 + 32) + 120)];

  uint64_t v5 = *(void **)(a1 + 32);

  return [v5 _updateGuidedAccessWindowId:0];
}

BOOL sub_10000FFD8(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lowercaseString];
  BOOL v4 = [v3 rangeOfString:*(void *)(*(void *)(a1 + 32) + 104)] == (id)0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

void sub_100010400(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  if ([v12 length])
  {
    uint64_t v5 = [v12 substringToIndex:1];
    unsigned __int8 v6 = [v5 uppercaseString];

    uint64_t v7 = +[NSCharacterSet letterCharacterSet];
    unsigned __int8 v8 = [v7 characterIsMember:[v6 characterAtIndex:0]];

    if ((v8 & 1) == 0)
    {

      unsigned __int8 v6 = @"#";
    }
    id v9 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKey:v6];
    if (!v9)
    {
      id v9 = [objc_allocWithZone((Class)NSMutableArray) init];
      [*(id *)(*(void *)(a1 + 32) + 40) setObject:v9 forKey:v6];
    }
    id v10 = +[NSNumber numberWithInteger:a3];
    id v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v12, v10, 0);
    [v9 addObject:v11];
  }
}

int64_t sub_100010568(id a1, id a2, id a3)
{
  return (int64_t)[a2 localizedCaseInsensitiveCompare:a3];
}

void sub_100010570(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = +[UIColor clearColor];
  [v1 setIndexBackgroundColor:v2];
}

id sub_100010750(uint64_t a1)
{
  CGRect v10 = CGRectIntegral(*(CGRect *)(a1 + 40));
  double x = v10.origin.x;
  double y = v10.origin.y;
  double width = v10.size.width;
  double height = v10.size.height;
  unsigned __int8 v6 = [*(id *)(a1 + 32) view];
  [v6 setFrame:CGRectMake(x, y, width, height)];

  CGRect v11 = CGRectIntegral(*(CGRect *)(a1 + 40));
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 128);

  return [v7 setFrame:v11.origin.x, v11.origin.y, v11.size.width, v11.size.height];
}

void sub_100011EAC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
}

void sub_100012268(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_100012290(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

void sub_1000122D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismiss];
}

void sub_1000124C0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v1 deactivate];
  [v1 invalidate];
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100024E68);
}

void sub_100012520(id a1)
{
}

void sub_10001284C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) itemChooserController];
  uint64_t v2 = [*(id *)(a1 + 32) items];
  [v3 showItemChooser:v2];
}

void sub_1000129B4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _remoteViewControllerProxy];
  [v2 deactivate];
  id v3 = *(id *)(a1 + 40);
  AXPerformBlockOnMainThreadAfterDelay();
}

void sub_100012A68(uint64_t a1)
{
  v6[0] = @"row";
  uint64_t v2 = +[NSNumber numberWithInteger:*(void *)(a1 + 40)];
  v7[0] = v2;
  v6[1] = @"activate";
  id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v6[2] = @"searchTerm";
  uint64_t v4 = *(void *)(a1 + 32);
  v7[1] = v3;
  v7[2] = v4;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:3];
  UIAccessibilityPostNotification(0x7EAu, v5);
}

void sub_100012E2C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v5);
  int v7 = 138412546;
  unsigned __int8 v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - Did prepare for alert activation context : %@", (uint8_t *)&v7, 0x16u);
}

void sub_100012EE0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not decode settings data: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100012F58(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = (objc_class *)objc_opt_class();
  unsigned __int8 v6 = NSStringFromClass(v5);
  int v7 = [a2 userInfo];
  int v8 = 138412802;
  __int16 v9 = v6;
  __int16 v10 = 2112;
  CGRect v11 = a2;
  __int16 v12 = 2112;
  unsigned __int8 v13 = v7;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%@ - Did configure with alert configuration context : %@, userInfo : %@", (uint8_t *)&v8, 0x20u);
}

uint64_t sub_100013028()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10001304C(v0);
}

void sub_10001304C(uint64_t a1, NSObject *a2)
{
  int v2 = 138477827;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get identifier for command with dictionary: %{private}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000130C4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get a valid shortcut from identifier: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001313C()
{
  sub_100002FF0();
  sub_100003008((void *)&_mh_execute_header, v0, v1, "Unable to deserialize user action flow from data: %@, error: %@");
}

void sub_1000131A4()
{
  sub_100002FF0();
  sub_100003008((void *)&_mh_execute_header, v0, v1, "Unable to deserialize gesture from data: %@, error: %@");
}

void sub_10001320C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Empty string passed as text to insert", v1, 2u);
}

void sub_100013250(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 userInfo];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unsupported context for custom command: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_1000132EC()
{
  uint64_t v0 = abort_report_np();
  return sub_100013314(v0);
}

uint64_t sub_100013314()
{
  uint64_t v0 = abort_report_np();
  return sub_10001333C(v0);
}

uint64_t sub_10001333C()
{
  uint64_t v0 = abort_report_np();
  return sub_100013364(v0);
}

uint64_t sub_100013364()
{
  uint64_t v0 = abort_report_np();
  return sub_10001338C(v0);
}

void sub_10001338C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - detail data not found", v4, v5, v6, v7, 2u);
}

void sub_100013418()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - features not found", v4, v5, v6, v7, 2u);
}

void sub_1000134A4()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - image is nil", v4, v5, v6, v7, 2u);
}

void sub_100013530(void *a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [a1 image];
  uint64_t v5 = [a1 features];
  sub_100003E90();
  sub_100003ED0((void *)&_mh_execute_header, v6, v7, "%@ - After update : image : %@ features : %@", v8, v9, v10, v11, v12);
}

void sub_1000135EC(void *a1)
{
  uint64_t v2 = (objc_class *)objc_opt_class();
  uint64_t v3 = NSStringFromClass(v2);
  uint64_t v4 = [a1 image];
  uint64_t v5 = [a1 features];
  sub_100003E90();
  sub_100003ED0((void *)&_mh_execute_header, v6, v7, "%@ - Before update : image : %@ features : %@", v8, v9, v10, v11, v12);
}

uint64_t sub_1000136A8()
{
  uint64_t v0 = abort_report_np();
  return sub_1000136D0(v0);
}

uint64_t sub_1000136D0()
{
  uint64_t v0 = abort_report_np();
  return sub_1000136F8(v0);
}

void sub_1000136F8()
{
  sub_100008058();
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100008020();
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Did prepare for alert activation context : %@", v4, v5, v6, v7, v8);
}

void sub_100013788()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_10000808C();
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - Unable to unarchive AXMVisionResult object from imageData", v4, v5, v6, v7, v8);
}

void sub_100013810()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_10000808C();
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - Unable to unarchive AXSBImageExplorerData object from imageData", v4, v5, v6, v7, v8);
}

void sub_100013898()
{
  sub_100008064();
  os_log_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 elementInfo];
  sub_100008038();
  sub_100008098((void *)&_mh_execute_header, v4, v5, "%@ - elementInfo must be type AXSBImageExplorerData. was actually %@. error:%@ ", v6, v7, v8, v9, v10);
}

void sub_10001393C()
{
  sub_100008064();
  os_log_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 visionResult];
  sub_100008038();
  sub_100008098((void *)&_mh_execute_header, v4, v5, "%@ - result must be type AXMVisionResult. was actually %@. error:%@ ", v6, v7, v8, v9, v10);
}

void sub_1000139E0()
{
  sub_100008058();
  os_log_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 userInfo];
  sub_100008074();
  sub_100003ED0((void *)&_mh_execute_header, v4, v5, "%@ - Did configure with alert configuration context : %@, userInfo : %@", v6, v7, v8, v9, 2u);
}

void sub_100013A8C()
{
  sub_100008058();
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100008020();
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Using screengrab image : %@", v4, v5, v6, v7, v8);
}

void sub_100013B1C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_10000808C();
  sub_100003EB0((void *)&_mh_execute_header, v2, v3, "%@ - Neither a valid local identifier, nor a valid image, nor a valid imageURL available to present the Image Explorer", v4, v5, v6, v7, v8);
}

void sub_100013BA4()
{
  sub_100008064();
  os_log_t v1 = (objc_class *)objc_opt_class();
  uint64_t v2 = NSStringFromClass(v1);
  uint64_t v3 = [v0 _photoLibraryURL];
  sub_100008074();
  sub_100003ED0((void *)&_mh_execute_header, v4, v5, "%@ - Using asset local identifier : %@ at photoLibraryURL : %@", v6, v7, v8, v9, 2u);
}

void sub_100013C50()
{
  sub_100008058();
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100008020();
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Vision engine to process image downloaded from iCloud. %@", v4, v5, v6, v7, v8);
}

void sub_100013CE0()
{
  sub_100008058();
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_10000808C();
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Reload image from PHAsset's localIdentifier : %@", v4, v5, v6, v7, v8);
}

void sub_100013D80()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Vision request took %.3fs to complete", v4, v5, v6, v7, 2u);
}

void sub_100013E3C()
{
  sub_100008058();
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_100008020();
  sub_100008000((void *)&_mh_execute_header, v2, v3, "%@ - Vision results available : %@", v4, v5, v6, v7, v8);
}

void sub_100013ED0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 detailData];
  sub_10000808C();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Detail data : %@", v4, 0xCu);
}

void sub_100013F64(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 description];
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  CFStringRef v7 = @"VoiceOverImageExplorer.text.rotor";
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unable to add element %@ with a feature key of: %@", (uint8_t *)&v4, 0x16u);
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXDeviceIsPhone()
{
  return _AXDeviceIsPhone();
}

uint64_t AXFormatFloatWithPercentage()
{
  return _AXFormatFloatWithPercentage();
}

uint64_t AXFormatInteger()
{
  return _AXFormatInteger();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXMSecureCodingClasses()
{
  return _AXMSecureCodingClasses();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return _AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t AXRuntimeCheck_MediaAnalysisSupport()
{
  return _AXRuntimeCheck_MediaAnalysisSupport();
}

uint64_t AXSafeClassFromString()
{
  return _AXSafeClassFromString();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectContainsRect(rect1, rect2);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGRect CGRectFromString(NSString *string)
{
  return _CGRectFromString(string);
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

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectOffset(rect, dx, dy);
}

uint64_t GSEventIsHardwareKeyboardAttached()
{
  return _GSEventIsHardwareKeyboardAttached();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t UIAXLabelForElements()
{
  return _UIAXLabelForElements();
}

uint64_t UIAccessibilityFrameForBounds()
{
  return _UIAccessibilityFrameForBounds();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakIfNotSpeaking()
{
  return _UIAccessibilitySpeakIfNotSpeaking();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t VOSProcessAllowsScreenRecognition()
{
  return _VOSProcessAllowsScreenRecognition();
}

uint64_t VOTLogCommon()
{
  return _VOTLogCommon();
}

uint64_t VOTLogImageExplorer()
{
  return _VOTLogImageExplorer();
}

uint64_t VOTLogQuickSettings()
{
  return _VOTLogQuickSettings();
}

uint64_t _AXAssert()
{
  return __AXAssert();
}

uint64_t _AXSGuidedAccessEnabled()
{
  return __AXSGuidedAccessEnabled();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return ___UIAXStringForVariables();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void free(void *a1)
{
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_Activities(void *a1, const char *a2, ...)
{
  return [a1 Activities];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return [a1 CGRectValue];
}

id objc_msgSend_DuckingAmount(void *a1, const char *a2, ...)
{
  return [a1 DuckingAmount];
}

id objc_msgSend_ScreenRecognition(void *a1, const char *a2, ...)
{
  return [a1 ScreenRecognition];
}

id objc_msgSend_Volume(void *a1, const char *a2, ...)
{
  return [a1 Volume];
}

id objc_msgSend__accessibilityShouldClearChildren(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityShouldClearChildren];
}

id objc_msgSend__assetLocalIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _assetLocalIdentifier];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__dismiss(void *a1, const char *a2, ...)
{
  return [a1 _dismiss];
}

id objc_msgSend__explorerImage(void *a1, const char *a2, ...)
{
  return [a1 _explorerImage];
}

id objc_msgSend__generateFaceAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _generateFaceAccessibilityElements];
}

id objc_msgSend__generateOCRDocumentAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _generateOCRDocumentAccessibilityElements];
}

id objc_msgSend__generateObjectClassificationAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 _generateObjectClassificationAccessibilityElements];
}

id objc_msgSend__guidedAccessItemChooserDidShow(void *a1, const char *a2, ...)
{
  return [a1 _guidedAccessItemChooserDidShow];
}

id objc_msgSend__imageURL(void *a1, const char *a2, ...)
{
  return [a1 _imageURL];
}

id objc_msgSend__isAssetLocallyAvailable(void *a1, const char *a2, ...)
{
  return [a1 _isAssetLocallyAvailable];
}

id objc_msgSend__isFiltering(void *a1, const char *a2, ...)
{
  return [a1 _isFiltering];
}

id objc_msgSend__isSearchBarEmpty(void *a1, const char *a2, ...)
{
  return [a1 _isSearchBarEmpty];
}

id objc_msgSend__loadGuidedAccessBundle(void *a1, const char *a2, ...)
{
  return [a1 _loadGuidedAccessBundle];
}

id objc_msgSend__photoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 _photoLibraryURL];
}

id objc_msgSend__populateCaptionAndMetadata(void *a1, const char *a2, ...)
{
  return [a1 _populateCaptionAndMetadata];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return [a1 _rootSheetPresentationController];
}

id objc_msgSend__screenGrabImage(void *a1, const char *a2, ...)
{
  return [a1 _screenGrabImage];
}

id objc_msgSend__settingsItem(void *a1, const char *a2, ...)
{
  return [a1 _settingsItem];
}

id objc_msgSend__setupRemoteProxy(void *a1, const char *a2, ...)
{
  return [a1 _setupRemoteProxy];
}

id objc_msgSend__updateCellAccessories(void *a1, const char *a2, ...)
{
  return [a1 _updateCellAccessories];
}

id objc_msgSend__visionFeatureDescriptionOptions(void *a1, const char *a2, ...)
{
  return [a1 _visionFeatureDescriptionOptions];
}

id objc_msgSend_accessibilityContainer(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContainer];
}

id objc_msgSend_accessibilityContainerType(void *a1, const char *a2, ...)
{
  return [a1 accessibilityContainerType];
}

id objc_msgSend_accessibilityCustomActions(void *a1, const char *a2, ...)
{
  return [a1 accessibilityCustomActions];
}

id objc_msgSend_accessibilityDecrement(void *a1, const char *a2, ...)
{
  return [a1 accessibilityDecrement];
}

id objc_msgSend_accessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 accessibilityElements];
}

id objc_msgSend_accessibilityFrame(void *a1, const char *a2, ...)
{
  return [a1 accessibilityFrame];
}

id objc_msgSend_accessibilityIncrement(void *a1, const char *a2, ...)
{
  return [a1 accessibilityIncrement];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityLabelForAttributes(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabelForAttributes];
}

id objc_msgSend_accessibilityTraits(void *a1, const char *a2, ...)
{
  return [a1 accessibilityTraits];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 allSpecifiers];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetLocallyAvailable(void *a1, const char *a2, ...)
{
  return [a1 assetLocallyAvailable];
}

id objc_msgSend_assetMetadata(void *a1, const char *a2, ...)
{
  return [a1 assetMetadata];
}

id objc_msgSend_assetMetadataFeature(void *a1, const char *a2, ...)
{
  return [a1 assetMetadataFeature];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return [a1 attributes];
}

id objc_msgSend_axCapitalizeFirstLetter(void *a1, const char *a2, ...)
{
  return [a1 axCapitalizeFirstLetter];
}

id objc_msgSend_axLabel(void *a1, const char *a2, ...)
{
  return [a1 axLabel];
}

id objc_msgSend_axSortedElements(void *a1, const char *a2, ...)
{
  return [a1 axSortedElements];
}

id objc_msgSend_axTCCAllowsPhotoLibraryAccess(void *a1, const char *a2, ...)
{
  return [a1 axTCCAllowsPhotoLibraryAccess];
}

id objc_msgSend_axVisionQueue(void *a1, const char *a2, ...)
{
  return [a1 axVisionQueue];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_becomeKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 becomeKeyWindow];
}

id objc_msgSend_bestLocaleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bestLocaleIdentifier];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cell(void *a1, const char *a2, ...)
{
  return [a1 cell];
}

id objc_msgSend_cellAccessibility(void *a1, const char *a2, ...)
{
  return [a1 cellAccessibility];
}

id objc_msgSend_chartDescriptor(void *a1, const char *a2, ...)
{
  return [a1 chartDescriptor];
}

id objc_msgSend_classificationLabel(void *a1, const char *a2, ...)
{
  return [a1 classificationLabel];
}

id objc_msgSend_classificationLocalizedValue(void *a1, const char *a2, ...)
{
  return [a1 classificationLocalizedValue];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_collectionViewController(void *a1, const char *a2, ...)
{
  return [a1 collectionViewController];
}

id objc_msgSend_columnIndex(void *a1, const char *a2, ...)
{
  return [a1 columnIndex];
}

id objc_msgSend_commandItem(void *a1, const char *a2, ...)
{
  return [a1 commandItem];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentItem(void *a1, const char *a2, ...)
{
  return [a1 currentItem];
}

id objc_msgSend_customContent(void *a1, const char *a2, ...)
{
  return [a1 customContent];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return [a1 deactivate];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultExcludeOptions(void *a1, const char *a2, ...)
{
  return [a1 defaultExcludeOptions];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_detailData(void *a1, const char *a2, ...)
{
  return [a1 detailData];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dictionaryForSavingToPreferences(void *a1, const char *a2, ...)
{
  return [a1 dictionaryForSavingToPreferences];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissDelegate(void *a1, const char *a2, ...)
{
  return [a1 dismissDelegate];
}

id objc_msgSend_editor(void *a1, const char *a2, ...)
{
  return [a1 editor];
}

id objc_msgSend_editorNavigationController(void *a1, const char *a2, ...)
{
  return [a1 editorNavigationController];
}

id objc_msgSend_elementInfo(void *a1, const char *a2, ...)
{
  return [a1 elementInfo];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return [a1 elements];
}

id objc_msgSend_explorableOCRTypes(void *a1, const char *a2, ...)
{
  return [a1 explorableOCRTypes];
}

id objc_msgSend_explorerImageView(void *a1, const char *a2, ...)
{
  return [a1 explorerImageView];
}

id objc_msgSend_faceDetectionResult(void *a1, const char *a2, ...)
{
  return [a1 faceDetectionResult];
}

id objc_msgSend_faceFeatures(void *a1, const char *a2, ...)
{
  return [a1 faceFeatures];
}

id objc_msgSend_feature(void *a1, const char *a2, ...)
{
  return [a1 feature];
}

id objc_msgSend_featureType(void *a1, const char *a2, ...)
{
  return [a1 featureType];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_filteredColumnHeaders(void *a1, const char *a2, ...)
{
  return [a1 filteredColumnHeaders];
}

id objc_msgSend_filteredSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 filteredSpecifiers];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flippedYAxis(void *a1, const char *a2, ...)
{
  return [a1 flippedYAxis];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_frontmostAppIdentifier(void *a1, const char *a2, ...)
{
  return [a1 frontmostAppIdentifier];
}

id objc_msgSend_generateAccessibilityElements(void *a1, const char *a2, ...)
{
  return [a1 generateAccessibilityElements];
}

id objc_msgSend_hostAppName(void *a1, const char *a2, ...)
{
  return [a1 hostAppName];
}

id objc_msgSend_hostingController(void *a1, const char *a2, ...)
{
  return [a1 hostingController];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return [a1 imageData];
}

id objc_msgSend_imageExplorerRotorCache(void *a1, const char *a2, ...)
{
  return [a1 imageExplorerRotorCache];
}

id objc_msgSend_imageExplorerViewController(void *a1, const char *a2, ...)
{
  return [a1 imageExplorerViewController];
}

id objc_msgSend_imageExplorerViewControllerWillDisappear(void *a1, const char *a2, ...)
{
  return [a1 imageExplorerViewControllerWillDisappear];
}

id objc_msgSend_imageNode(void *a1, const char *a2, ...)
{
  return [a1 imageNode];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initializeImageView(void *a1, const char *a2, ...)
{
  return [a1 initializeImageView];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 isFirstResponder];
}

id objc_msgSend_isHeader(void *a1, const char *a2, ...)
{
  return [a1 isHeader];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_itemChooserActivate(void *a1, const char *a2, ...)
{
  return [a1 itemChooserActivate];
}

id objc_msgSend_itemChooserController(void *a1, const char *a2, ...)
{
  return [a1 itemChooserController];
}

id objc_msgSend_itemChooserSelectedIndex(void *a1, const char *a2, ...)
{
  return [a1 itemChooserSelectedIndex];
}

id objc_msgSend_itemType(void *a1, const char *a2, ...)
{
  return [a1 itemType];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_key(void *a1, const char *a2, ...)
{
  return [a1 key];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return [a1 label];
}

id objc_msgSend_lastSearchTerm(void *a1, const char *a2, ...)
{
  return [a1 lastSearchTerm];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_letterCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 letterCharacterSet];
}

id objc_msgSend_localIdentifier(void *a1, const char *a2, ...)
{
  return [a1 localIdentifier];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return [a1 mainQueue];
}

id objc_msgSend_matchingScenes(void *a1, const char *a2, ...)
{
  return [a1 matchingScenes];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_mediaAnalysisFaceDetectionResult(void *a1, const char *a2, ...)
{
  return [a1 mediaAnalysisFaceDetectionResult];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return [a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_normalizedFrame(void *a1, const char *a2, ...)
{
  return [a1 normalizedFrame];
}

id objc_msgSend_objectClassificationFeatures(void *a1, const char *a2, ...)
{
  return [a1 objectClassificationFeatures];
}

id objc_msgSend_objectIndex(void *a1, const char *a2, ...)
{
  return [a1 objectIndex];
}

id objc_msgSend_ocrFeatureType(void *a1, const char *a2, ...)
{
  return [a1 ocrFeatureType];
}

id objc_msgSend_ocrFeatures(void *a1, const char *a2, ...)
{
  return [a1 ocrFeatures];
}

id objc_msgSend_parentAccessibilityContainer(void *a1, const char *a2, ...)
{
  return [a1 parentAccessibilityContainer];
}

id objc_msgSend_parentTextFeature(void *a1, const char *a2, ...)
{
  return [a1 parentTextFeature];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_peopleFeature(void *a1, const char *a2, ...)
{
  return [a1 peopleFeature];
}

id objc_msgSend_peopleFeatures(void *a1, const char *a2, ...)
{
  return [a1 peopleFeatures];
}

id objc_msgSend_photoLibraryURL(void *a1, const char *a2, ...)
{
  return [a1 photoLibraryURL];
}

id objc_msgSend_popoverPresentingViewController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentingViewController];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return [a1 presentationController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return [a1 rootViewController];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_rowIndex(void *a1, const char *a2, ...)
{
  return [a1 rowIndex];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_sceneClassId(void *a1, const char *a2, ...)
{
  return [a1 sceneClassId];
}

id objc_msgSend_sceneClassificationFeatures(void *a1, const char *a2, ...)
{
  return [a1 sceneClassificationFeatures];
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return [a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return [a1 searchController];
}

id objc_msgSend_searchDirection(void *a1, const char *a2, ...)
{
  return [a1 searchDirection];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_series(void *a1, const char *a2, ...)
{
  return [a1 series];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_settingsItemUpdateObserverToken(void *a1, const char *a2, ...)
{
  return [a1 settingsItemUpdateObserverToken];
}

id objc_msgSend_setupNavigationItems(void *a1, const char *a2, ...)
{
  return [a1 setupNavigationItems];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sortedElements(void *a1, const char *a2, ...)
{
  return [a1 sortedElements];
}

id objc_msgSend_speakFilteredItemSummaryTimer(void *a1, const char *a2, ...)
{
  return [a1 speakFilteredItemSummaryTimer];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_subfeatures(void *a1, const char *a2, ...)
{
  return [a1 subfeatures];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 systemBackgroundColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_targetElement(void *a1, const char *a2, ...)
{
  return [a1 targetElement];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userSettingsItems(void *a1, const char *a2, ...)
{
  return [a1 userSettingsItems];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_visionEngine(void *a1, const char *a2, ...)
{
  return [a1 visionEngine];
}

id objc_msgSend_visionResult(void *a1, const char *a2, ...)
{
  return [a1 visionResult];
}

id objc_msgSend_voiceOverActivities(void *a1, const char *a2, ...)
{
  return [a1 voiceOverActivities];
}

id objc_msgSend_voiceOverDiscoveredSensitiveContentFeedback(void *a1, const char *a2, ...)
{
  return [a1 voiceOverDiscoveredSensitiveContentFeedback];
}

id objc_msgSend_voiceOverOptions(void *a1, const char *a2, ...)
{
  return [a1 voiceOverOptions];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}