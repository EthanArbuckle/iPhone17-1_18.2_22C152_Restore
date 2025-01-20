void sub_10000244C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  void v13[4];
  id v14;
  void block[4];
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  char v21;
  id v22;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    if (*(unsigned char *)(a1 + 80)) {
      [v5 beginSupressingLivePhoto];
    }
    [v5 setMediaOrigin:*(void *)(a1 + 72)];
    [v5 removeSidecarObjectForKey:*(void *)(a1 + 32)];
    v22 = 0;
    v8 = +[NSKeyedArchiver archivedDataWithRootObject:v5 requiringSecureCoding:1 error:&v22];
    v9 = v22;
    if (!v8)
    {
      v10 = os_log_create("com.apple.camera", "CameraMessagesApp");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_10000AAFC((uint64_t)v9, v10);
      }
    }
    +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:*(void *)(a1 + 40)];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000026A4;
    block[3] = &unk_100014550;
    v21 = *(unsigned char *)(a1 + 81);
    v16 = *(id *)(a1 + 48);
    v17 = v8;
    v20 = *(void *)(a1 + 72);
    v18 = *(id *)(a1 + 56);
    v19 = *(id *)(a1 + 64);
    v11 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

LABEL_13:
    goto LABEL_14;
  }
  if (v6)
  {
    v12 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000AA64(v7, v12);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000029C0;
    v13[3] = &unk_100014578;
    v14 = *(id *)(a1 + 64);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    v9 = v14;
    goto LABEL_13;
  }
LABEL_14:
}

uint64_t sub_1000026A4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 32) _insertAssetArchive:*(void *)(a1 + 40) completionHandler:&stru_100014508];
    v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_10;
    }
    uint64_t v3 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v3;
    v4 = "Called _insertAssetArchive on %{public}@";
    goto LABEL_9;
  }
  unint64_t v5 = *(void *)(a1 + 64);
  if (v5 > 4) {
    uint64_t v6 = 6;
  }
  else {
    uint64_t v6 = qword_100012E70[v5];
  }
  [*(id *)(a1 + 48) reportPayloadSentFromSource:v6];
  [*(id *)(a1 + 32) _sendAssetArchive:*(void *)(a1 + 40) completionHandler:&stru_100014528];
  v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v10 = 138543362;
    uint64_t v11 = v7;
    v4 = "Called _sendAssetArchive on %{public}@";
LABEL_9:
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v10, 0xCu);
  }
LABEL_10:

  uint64_t result = *(void *)(a1 + 56);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v8);
  }
  return result;
}

void sub_100002808(id a1, NSError *a2)
{
  v2 = a2;
  CAMSignpostWithIDAndArgs();
  uint64_t v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    unint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Staging complete: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000028E4(id a1, NSError *a2)
{
  v2 = a2;
  CAMSignpostWithIDAndArgs();
  uint64_t v3 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    unint64_t v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Send complete: %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t sub_1000029C0(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100002B78(id a1)
{
  *(void *)v2 = 0x1800000006;
  size_t v1 = 8;
  sysctl(v2, 2u, &qword_10001A538, &v1, 0, 0);
}

uint64_t sub_100002C84(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + 32) _deviceMemorySize];
  byte_10001A548 = result > 1610612736;
  return result;
}

id sub_100003330()
{
  if (qword_10001A560 != -1) {
    dispatch_once(&qword_10001A560, &stru_1000147D0);
  }
  v0 = (void *)qword_10001A568;

  return v0;
}

void sub_100003384(id a1)
{
  CAMSignpostWithIDAndArgs();
  if (!qword_10001A570) {
    qword_10001A570 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CameraEffectsKit.framework/CameraEffectsKit", 2);
  }

  CAMSignpostWithIDAndArgs();
}

void sub_100003414(uint64_t a1)
{
  CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
  uint64_t v3 = [*(id *)(a1 + 32) _regularCameraViewController];
  int v4 = [v3 persistenceController];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000034C4;
  v5[3] = &unk_100014640;
  *(CFAbsoluteTime *)&v5[4] = Current;
  [v4 emptyLocalPersistenceStorageWithTimeout:v5 completionHandler:0.5];
}

void sub_1000034C4(uint64_t a1)
{
  double Current = CFAbsoluteTimeGetCurrent();
  double v3 = *(double *)(a1 + 32);
  int v4 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 134217984;
    double v6 = Current - v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Emptying local persistence storage took %.3fs", (uint8_t *)&v5, 0xCu);
  }
}

id sub_1000037F8(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _didReceiveViewWillAppear];
  if ((result & 1) == 0)
  {
    double v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Stopping camera session that we started in viewDidLoad since we haven't received viewWillAppear within %.3f seconds", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(a1 + 32) _stopActiveCameraSession];
  }
  return result;
}

id sub_1000040E8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLayoutParametersForReviewBarsModel:viewBounds:orientation:forceLayout:", *(void *)(a1 + 40), *(void *)(a1 + 64), 1, 0.0, 0.0, *(double *)(a1 + 48), *(double *)(a1 + 56));
}

id sub_1000046AC()
{
  uint64_t v4 = 0;
  int v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_10001A578;
  uint64_t v7 = qword_10001A578;
  if (!qword_10001A578)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100008710;
    v3[3] = &unk_1000147F8;
    v3[4] = &v4;
    sub_100008710((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100004778(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100005648(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id sub_100005654(uint64_t a1)
{
  return +[CAMMessagesExtensionViewController _removeChildViewController:*(void *)(a1 + 32)];
}

void sub_10000602C(id a1)
{
  id v1 = sub_100006074();
  dispatch_async(v1, &stru_100014720);
}

id sub_100006074()
{
  if (qword_10001A580 != -1) {
    dispatch_once(&qword_10001A580, &stru_100014818);
  }
  v0 = (void *)qword_10001A588;

  return v0;
}

void sub_1000060C8(id a1)
{
  CAMSignpostWithIDAndArgs();
  if (!qword_10001A590) {
    qword_10001A590 = (uint64_t)dlopen("/System/Library/PrivateFrameworks/AssetExplorer.framework/AssetExplorer", 2);
  }

  CAMSignpostWithIDAndArgs();
}

void sub_1000062E0(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 72);
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 view];
  uint64_t v7 = [v6 window];
  uint64_t v8 = [v7 screen];
  [v8 scale];
  +[CMAMessagesExtensionUtilities shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:](CMAMessagesExtensionUtilities, "shutterButtonAlignmentRectForReferenceBounds:layoutStyle:screenScale:", v3, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  +[PUReviewScreenUtilities orientedGeometryForFrame:inBounds:orientation:](PUReviewScreenUtilities, "orientedGeometryForFrame:inBounds:orientation:", *(void *)(a1 + 80), v11, v13, v15, v17, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 0, 0, 0, 0);
  [v5 setControlCenterAlignmentPoint:*(unsigned __int8 *)(a1 + 88) forceLayout:(unsigned __int128)0];
}

id sub_100006950(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dismissing after _transportAsset completion", v4, 2u);
  }

  return [*(id *)(a1 + 40) dismiss];
}

void sub_100006AF8(uint64_t a1, int a2)
{
  if (a2)
  {
    v2 = os_log_create("com.apple.camera", "CameraMessagesApp");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_10000ABA8();
    }
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 32);
    +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:v3];
  }
}

id sub_100006C44(uint64_t a1)
{
  return +[CMAMessagesExtensionStorageHelper markFilesPurgeableForAsset:*(void *)(a1 + 32)];
}

void sub_1000070B8(uint64_t a1)
{
  id v17 = objc_alloc_init((Class)PHAssetCreationOptions);
  [v17 setUseRecoverableStagingDirectory:1];
  [v17 setShouldUseAutomaticallyGeneratedOriginalFilename:1];
  id v2 = [*(id *)(a1 + 32) mediaType];
  if (v2 == (id)2)
  {
    uint64_t v8 = [*(id *)(a1 + 32) identifier];
    uint64_t v4 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v8 options:v17];

    double v9 = [*(id *)(a1 + 32) providedFullsizeRenderVideoURL];
    double v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [*(id *)(a1 + 32) providedVideoURL];
    }
    double v12 = v11;

    [v4 addResourceWithType:2 fileURL:v12 options:0];
  }
  else
  {
    if (v2 != (id)1) {
      goto LABEL_16;
    }
    uint64_t v3 = [*(id *)(a1 + 32) identifier];
    uint64_t v4 = +[PHAssetCreationRequest creationRequestForAssetWithUUID:v3 options:v17];

    id v5 = [*(id *)(a1 + 32) providedFullsizeRenderImageURL];
    uint64_t v6 = v5;
    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      id v7 = [*(id *)(a1 + 32) providedFullsizeImageURL];
    }
    double v12 = v7;

    [v4 addResourceWithType:1 fileURL:v12 options:0];
    if ([*(id *)(a1 + 32) isLivePhoto])
    {
      double v13 = [*(id *)(a1 + 32) providedFullsizeRenderVideoURL];
      double v14 = v13;
      if (v13)
      {
        id v15 = v13;
      }
      else
      {
        id v15 = [*(id *)(a1 + 32) providedVideoURL];
      }
      double v16 = v15;

      [v4 addResourceWithType:9 fileURL:v16 options:0];
    }
  }

LABEL_16:
}

void sub_100007288(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  uint64_t v4 = a3;
  id v5 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"Success.";
    if (!v3) {
      CFStringRef v6 = (const __CFString *)v4;
    }
    int v7 = 138543362;
    CFStringRef v8 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Finished updating asset. %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void sub_10000869C(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.camera.softlink.CameraEffectsKit", 0);
  id v2 = (void *)qword_10001A568;
  qword_10001A568 = (uint64_t)v1;

  BOOL v3 = qword_10001A568;
  uint64_t v4 = camSoftLinkQueue();
  dispatch_set_target_queue(v3, v4);
}

Class sub_100008710(uint64_t a1)
{
  CAMSignpostWithIDAndArgs();
  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = 0;
  id v2 = sub_100003330();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008858;
  block[3] = &unk_1000147F8;
  block[4] = v6;
  dispatch_sync(v2, block);

  CAMSignpostWithIDAndArgs();
  _Block_object_dispose(v6, 8);
  Class result = objc_getClass("CFXCameraViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v4 = (_Unwind_Exception *)sub_10000AD04();
    _Block_object_dispose(v6, 8);
    _Unwind_Resume(v4);
  }
  qword_10001A578 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_100008858(uint64_t a1)
{
  Class result = (void *)qword_10001A570;
  if (!qword_10001A570)
  {
    Class result = dlopen("/System/Library/PrivateFrameworks/CameraEffectsKit.framework/CameraEffectsKit", 2);
    qword_10001A570 = (uint64_t)result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_1000088A4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.camera.softlink.AssetExplorer", 0);
  id v2 = (void *)qword_10001A588;
  qword_10001A588 = (uint64_t)v1;

  BOOL v3 = qword_10001A588;
  uint64_t v4 = camSoftLinkQueue();
  dispatch_set_target_queue(v3, v4);
}

Class sub_100008918(uint64_t a1)
{
  sub_100008970();
  Class result = objc_getClass("AECameraAssetPackageGenerator");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10001A598 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000AD2C();
    return (Class)sub_100008970();
  }
  return result;
}

uint64_t sub_100008970()
{
  CAMSignpostWithIDAndArgs();
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v7 = 0;
  v0 = sub_100006074();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008A84;
  block[3] = &unk_1000147F8;
  block[4] = &v4;
  dispatch_sync(v0, block);

  CAMSignpostWithIDAndArgs();
  uint64_t v1 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100008A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *sub_100008A84(uint64_t a1)
{
  Class result = (void *)qword_10001A590;
  if (!qword_10001A590)
  {
    Class result = dlopen("/System/Library/PrivateFrameworks/AssetExplorer.framework/AssetExplorer", 2);
    qword_10001A590 = (uint64_t)result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

Class sub_100008AD0(uint64_t a1)
{
  sub_100008970();
  Class result = objc_getClass("AEChatKitStatisticsManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10001A5A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000AD54();
    return (Class)sub_100008B28(v3);
  }
  return result;
}

void *sub_100008B28(uint64_t a1)
{
  id v2 = (void *)sub_100008970();
  Class result = dlsym(v2, "kUTTypeAssetPreviewImage");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_10001A5A8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100008B78(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_1000093D8(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 64);
  v7[0] = *(_OWORD *)(a1 + 48);
  v7[1] = v3;
  uint64_t v8 = *(void *)(a1 + 80);
  [v2 configureWithShutterButtonSpec:v7];
  double v4 = *(double *)(a1 + 88);
  id v5 = [*(id *)(a1 + 32) imageView];
  [v5 setAlpha:v4];

  objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 96), *(double *)(a1 + 104));
  return [*(id *)(a1 + 40) setAlpha:1.0];
}

id sub_10000945C(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", objc_msgSend(*(id *)(a1 + 40), "transitionWasCancelled") ^ 1);
  uint64_t v3 = *(void *)(a1 + 40);
  id v2 = *(void **)(a1 + 48);

  return [v2 _finishTransitionWithContext:v3];
}

void sub_1000095A0(id a1, PUMutableReviewScreenBarsModel *a2)
{
}

void sub_1000096B8(id a1, PUMutableReviewScreenBarsModel *a2)
{
}

void sub_10000AA38(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000AA64(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 localizedDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "CAMAssetTransportController reported an error generating AEMutableAssetPackage: %{public}@", (uint8_t *)&v4, 0xCu);
}

void sub_10000AAFC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to archive package: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000AB74()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "Trying to send nil asset from review screen. Dismissing.", v2, v3, v4, v5, v6);
}

void sub_10000ABA8()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "Could not take task assertion to mark asset files purgeable", v2, v3, v4, v5, v6);
}

void sub_10000ABDC()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "Trying to send assets without an active conversation", v2, v3, v4, v5, v6);
}

uint64_t sub_10000AC10()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10000AC34(v0);
}

void sub_10000AC34()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture photo, not proceeding with review", v2, v3, v4, v5, v6);
}

void sub_10000AC68()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture live photo, not proceeding with review", v2, v3, v4, v5, v6);
}

void sub_10000AC9C()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "<Camera> Failed to capture video, not proceeding with review", v2, v3, v4, v5, v6);
}

void sub_10000ACD0()
{
  sub_100008B94();
  sub_100008B78((void *)&_mh_execute_header, v0, v1, "<CFXCamera> Failed to create review asset for mediaItem, not proceeding with review", v2, v3, v4, v5, v6);
}

uint64_t sub_10000AD04()
{
  uint64_t v0 = abort_report_np();
  return sub_10000AD2C(v0);
}

uint64_t sub_10000AD2C()
{
  uint64_t v0 = abort_report_np();
  return sub_10000AD54(v0);
}

uint64_t sub_10000AD54()
{
  int v0 = abort_report_np();
  return sub_10000AD7C(v0, v1, v2);
}

void sub_10000AD7C(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to mark file purgeable: %{public}@, %{errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_10000AE04(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown media type for CFXMediaItem", v1, 2u);
}

void sub_10000AE48(void *a1)
{
  int v1 = [a1 path];
  sub_10000AA58();
  sub_10000AA38((void *)&_mh_execute_header, v2, v3, "Unable to create image source for '%{public}@'.", v4, v5, v6, v7, v8);
}

void sub_10000AECC(void *a1)
{
  int v1 = [a1 path];
  sub_10000AA58();
  sub_10000AA38((void *)&_mh_execute_header, v2, v3, "Unable to create AVAsset for '%{public}@'.", v4, v5, v6, v7, v8);
}

void sub_10000AF50(void *a1)
{
  int v1 = [a1 path];
  sub_10000AA58();
  sub_10000AA38((void *)&_mh_execute_header, v2, v3, "Unable to find valid duration for '%{public}@'.", v4, v5, v6, v7, v8);
}

void sub_10000AFD4(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v5 = [a1 path];
  sub_10000AA58();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Could not generate preview image for %{public}@. Error: %{public}@", v6, 0x16u);
}

uint64_t CAMLayoutStyleForView()
{
  return _CAMLayoutStyleForView();
}

uint64_t CAMShutterButtonSpecForLayoutStyle()
{
  return _CAMShutterButtonSpecForLayoutStyle();
}

uint64_t CAMShutterButtonSpecMake()
{
  return _CAMShutterButtonSpecMake();
}

uint64_t CAMSignpostWithIDAndArgs()
{
  return _CAMSignpostWithIDAndArgs();
}

uint64_t CEKIsViewInMultitask()
{
  return _CEKIsViewInMultitask();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

void CGImageRelease(CGImageRef image)
{
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCopyPropertiesAtIndex(isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return _CGImageSourceCreateThumbnailAtIndex(isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return _CGImageSourceCreateWithURL(url, options);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

CGRect CGRectStandardize(CGRect rect)
{
  return _CGRectStandardize(rect);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return _CMTimeMakeWithSeconds(retstr, seconds, preferredTimescale);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PLScaledSizeToFitSize()
{
  return _PLScaledSizeToFitSize();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t camSoftLinkQueue()
{
  return _camSoftLinkQueue();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return _dlopen(__path, __mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return _fsctl(a1, a2, a3, a4);
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

void objc_destroyWeak(id *location)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__activeConversation(void *a1, const char *a2, ...)
{
  return [a1 _activeConversation];
}

id objc_msgSend__captureMode(void *a1, const char *a2, ...)
{
  return [a1 _captureMode];
}

id objc_msgSend__captureState(void *a1, const char *a2, ...)
{
  return [a1 _captureState];
}

id objc_msgSend__cfxCameraViewController(void *a1, const char *a2, ...)
{
  return [a1 _cfxCameraViewController];
}

id objc_msgSend__createAndEmbedCFXCameraViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createAndEmbedCFXCameraViewControllerIfNecessary];
}

id objc_msgSend__createAndEmbedRegularCameraViewControllerIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _createAndEmbedRegularCameraViewControllerIfNecessary];
}

id objc_msgSend__currentReviewAssset(void *a1, const char *a2, ...)
{
  return [a1 _currentReviewAssset];
}

id objc_msgSend__deviceMemorySize(void *a1, const char *a2, ...)
{
  return [a1 _deviceMemorySize];
}

id objc_msgSend__deviceSupportsFunEffects(void *a1, const char *a2, ...)
{
  return [a1 _deviceSupportsFunEffects];
}

id objc_msgSend__didReceiveViewWillAppear(void *a1, const char *a2, ...)
{
  return [a1 _didReceiveViewWillAppear];
}

id objc_msgSend__dismissReviewController(void *a1, const char *a2, ...)
{
  return [a1 _dismissReviewController];
}

id objc_msgSend__isReviewControllerPresented(void *a1, const char *a2, ...)
{
  return [a1 _isReviewControllerPresented];
}

id objc_msgSend__layoutStyle(void *a1, const char *a2, ...)
{
  return [a1 _layoutStyle];
}

id objc_msgSend__logReferenceDescription(void *a1, const char *a2, ...)
{
  return [a1 _logReferenceDescription];
}

id objc_msgSend__logReferenceTime(void *a1, const char *a2, ...)
{
  return [a1 _logReferenceTime];
}

id objc_msgSend__messageLabel(void *a1, const char *a2, ...)
{
  return [a1 _messageLabel];
}

id objc_msgSend__previewImageKey(void *a1, const char *a2, ...)
{
  return [a1 _previewImageKey];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__regularCameraViewController(void *a1, const char *a2, ...)
{
  return [a1 _regularCameraViewController];
}

id objc_msgSend__reviewController(void *a1, const char *a2, ...)
{
  return [a1 _reviewController];
}

id objc_msgSend__shouldShowFunEffects(void *a1, const char *a2, ...)
{
  return [a1 _shouldShowFunEffects];
}

id objc_msgSend__startActiveCameraSession(void *a1, const char *a2, ...)
{
  return [a1 _startActiveCameraSession];
}

id objc_msgSend__startCFXCamera(void *a1, const char *a2, ...)
{
  return [a1 _startCFXCamera];
}

id objc_msgSend__startRegularCamera(void *a1, const char *a2, ...)
{
  return [a1 _startRegularCamera];
}

id objc_msgSend__stateChangeReferenceTime(void *a1, const char *a2, ...)
{
  return [a1 _stateChangeReferenceTime];
}

id objc_msgSend__statisticsManager(void *a1, const char *a2, ...)
{
  return [a1 _statisticsManager];
}

id objc_msgSend__stopActiveCameraSession(void *a1, const char *a2, ...)
{
  return [a1 _stopActiveCameraSession];
}

id objc_msgSend__stopAndReleaseCFXCameraViewController(void *a1, const char *a2, ...)
{
  return [a1 _stopAndReleaseCFXCameraViewController];
}

id objc_msgSend__stopAndReleaseRegularCameraViewController(void *a1, const char *a2, ...)
{
  return [a1 _stopAndReleaseRegularCameraViewController];
}

id objc_msgSend__stopCFXCamera(void *a1, const char *a2, ...)
{
  return [a1 _stopCFXCamera];
}

id objc_msgSend__stopRegularCamera(void *a1, const char *a2, ...)
{
  return [a1 _stopRegularCamera];
}

id objc_msgSend__toWindowOrientation(void *a1, const char *a2, ...)
{
  return [a1 _toWindowOrientation];
}

id objc_msgSend__updateFonts(void *a1, const char *a2, ...)
{
  return [a1 _updateFonts];
}

id objc_msgSend__userPreferenceOverrides(void *a1, const char *a2, ...)
{
  return [a1 _userPreferenceOverrides];
}

id objc_msgSend__windowInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _windowInterfaceOrientation];
}

id objc_msgSend_activeConversation(void *a1, const char *a2, ...)
{
  return [a1 activeConversation];
}

id objc_msgSend_adjustmentsData(void *a1, const char *a2, ...)
{
  return [a1 adjustmentsData];
}

id objc_msgSend_alignmentRectForShutterControl(void *a1, const char *a2, ...)
{
  return [a1 alignmentRectForShutterControl];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_aspectRatioCrop(void *a1, const char *a2, ...)
{
  return [a1 aspectRatioCrop];
}

id objc_msgSend_beginSupressingLivePhoto(void *a1, const char *a2, ...)
{
  return [a1 beginSupressingLivePhoto];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_cameraViewController(void *a1, const char *a2, ...)
{
  return [a1 cameraViewController];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_captureDevice(void *a1, const char *a2, ...)
{
  return [a1 captureDevice];
}

id objc_msgSend_captureMode(void *a1, const char *a2, ...)
{
  return [a1 captureMode];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return [a1 center];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return [a1 containerView];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_devicePosition(void *a1, const char *a2, ...)
{
  return [a1 devicePosition];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_doneButton(void *a1, const char *a2, ...)
{
  return [a1 doneButton];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return [a1 fileSystemRepresentation];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flashMode(void *a1, const char *a2, ...)
{
  return [a1 flashMode];
}

id objc_msgSend_funCamViewController(void *a1, const char *a2, ...)
{
  return [a1 funCamViewController];
}

id objc_msgSend_handleVolumeButtonPressed(void *a1, const char *a2, ...)
{
  return [a1 handleVolumeButtonPressed];
}

id objc_msgSend_handleVolumeButtonReleased(void *a1, const char *a2, ...)
{
  return [a1 handleVolumeButtonReleased];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_innerCircle(void *a1, const char *a2, ...)
{
  return [a1 innerCircle];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isAnimated(void *a1, const char *a2, ...)
{
  return [a1 isAnimated];
}

id objc_msgSend_isCTMSupported(void *a1, const char *a2, ...)
{
  return [a1 isCTMSupported];
}

id objc_msgSend_isCapturingLivePhoto(void *a1, const char *a2, ...)
{
  return [a1 isCapturingLivePhoto];
}

id objc_msgSend_isCapturingPhoto(void *a1, const char *a2, ...)
{
  return [a1 isCapturingPhoto];
}

id objc_msgSend_isLivePhoto(void *a1, const char *a2, ...)
{
  return [a1 isLivePhoto];
}

id objc_msgSend_isPreventingAdditionalCaptures(void *a1, const char *a2, ...)
{
  return [a1 isPreventingAdditionalCaptures];
}

id objc_msgSend_isRecording(void *a1, const char *a2, ...)
{
  return [a1 isRecording];
}

id objc_msgSend_isSplitScreenSupported(void *a1, const char *a2, ...)
{
  return [a1 isSplitScreenSupported];
}

id objc_msgSend_isTemporaryPlaceholder(void *a1, const char *a2, ...)
{
  return [a1 isTemporaryPlaceholder];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mediaSubtypes(void *a1, const char *a2, ...)
{
  return [a1 mediaSubtypes];
}

id objc_msgSend_mediaType(void *a1, const char *a2, ...)
{
  return [a1 mediaType];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_naturalSize(void *a1, const char *a2, ...)
{
  return [a1 naturalSize];
}

id objc_msgSend_originalAssetURL(void *a1, const char *a2, ...)
{
  return [a1 originalAssetURL];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_persistenceController(void *a1, const char *a2, ...)
{
  return [a1 persistenceController];
}

id objc_msgSend_photoModeAspectRatioCrop(void *a1, const char *a2, ...)
{
  return [a1 photoModeAspectRatioCrop];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredTransform(void *a1, const char *a2, ...)
{
  return [a1 preferredTransform];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_providedFullsizeImageURL(void *a1, const char *a2, ...)
{
  return [a1 providedFullsizeImageURL];
}

id objc_msgSend_providedFullsizeRenderImageURL(void *a1, const char *a2, ...)
{
  return [a1 providedFullsizeRenderImageURL];
}

id objc_msgSend_providedFullsizeRenderVideoURL(void *a1, const char *a2, ...)
{
  return [a1 providedFullsizeRenderVideoURL];
}

id objc_msgSend_providedVideoURL(void *a1, const char *a2, ...)
{
  return [a1 providedVideoURL];
}

id objc_msgSend_publish(void *a1, const char *a2, ...)
{
  return [a1 publish];
}

id objc_msgSend_registerActivityAttribution(void *a1, const char *a2, ...)
{
  return [a1 registerActivityAttribution];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_resumeCameraSession(void *a1, const char *a2, ...)
{
  return [a1 resumeCameraSession];
}

id objc_msgSend_reviewBarsModel(void *a1, const char *a2, ...)
{
  return [a1 reviewBarsModel];
}

id objc_msgSend_reviewViewController(void *a1, const char *a2, ...)
{
  return [a1 reviewViewController];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedPhotoLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedPhotoLibrary];
}

id objc_msgSend_sourceType(void *a1, const char *a2, ...)
{
  return [a1 sourceType];
}

id objc_msgSend_startCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 startCaptureSession];
}

id objc_msgSend_stopCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 stopCaptureSession];
}

id objc_msgSend_suspendCameraSession(void *a1, const char *a2, ...)
{
  return [a1 suspendCameraSession];
}

id objc_msgSend_systemYellowColor(void *a1, const char *a2, ...)
{
  return [a1 systemYellowColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_torchMode(void *a1, const char *a2, ...)
{
  return [a1 torchMode];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_transitionDirection(void *a1, const char *a2, ...)
{
  return [a1 transitionDirection];
}

id objc_msgSend_transitionWasCancelled(void *a1, const char *a2, ...)
{
  return [a1 transitionWasCancelled];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}