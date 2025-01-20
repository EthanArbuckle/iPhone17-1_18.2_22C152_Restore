id sub_45F8(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void v7[4];
  id v8;
  uint64_t vars8;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_F9E4;
  v7[3] = &unk_24CF8;
  objc_copyWeak(&v8, v2);
  v4 = objc_retainBlock(v7);
  v5 = [WeakRetained _createWrappedCollectionsForDevice:*(void *)(a1 + 32) completion:v4];

  objc_destroyWeak(&v8);

  return v5;
}

void sub_46D4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_4B1C(id a1, BOOL a2)
{
  BOOL v2 = a2;
  v3 = _NTKLoggingObjectForDomain();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      __int16 v8 = 0;
      v5 = "Starting query…";
      v6 = (uint8_t *)&v8;
LABEL_6:
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, v5, v6, 2u);
    }
  }
  else if (v4)
  {
    __int16 v7 = 0;
    v5 = "Ignoring query…";
    v6 = (uint8_t *)&v7;
    goto LABEL_6;
  }
}

void sub_4D28(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_4DB8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_513C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
}

__n128 sub_5D90@<Q0>(uint64_t a1@<X8>)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2E430);
  id WeakRetained = objc_loadWeakRetained(&qword_2E438);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  BOOL v4 = +[CLKRenderingContext sharedRenderingContext];
  id v5 = [v4 device];
  id v6 = objc_loadWeakRetained(&qword_2E438);
  if (v5 != v6)
  {

LABEL_5:
    v11 = +[CLKRenderingContext sharedRenderingContext];
    v12 = [v11 device];
    objc_storeWeak(&qword_2E438, v12);

    id v13 = objc_loadWeakRetained(&qword_2E438);
    qword_2E440 = (uint64_t)[v13 version];

    v14 = +[CLKRenderingContext sharedRenderingContext];
    v15 = [v14 device];
    sub_608C((uint64_t)v15, v15);

    goto LABEL_6;
  }
  __int16 v7 = +[CLKRenderingContext sharedRenderingContext];
  __int16 v8 = [v7 device];
  id v9 = [v8 version];
  uint64_t v10 = qword_2E440;

  if (v9 != (id)v10) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2E430);
  long long v16 = unk_2E410;
  *(_OWORD *)(a1 + 96) = xmmword_2E400;
  *(_OWORD *)(a1 + 112) = v16;
  *(_OWORD *)(a1 + 128) = xmmword_2E420;
  long long v17 = *(_OWORD *)&qword_2E3D0;
  *(_OWORD *)(a1 + 32) = xmmword_2E3C0;
  *(_OWORD *)(a1 + 48) = v17;
  long long v18 = *(_OWORD *)&qword_2E3F0;
  *(_OWORD *)(a1 + 64) = *(long long *)((char *)&xmmword_2E3D8 + 8);
  *(_OWORD *)(a1 + 80) = v18;
  __n128 result = (__n128)unk_2E3B0;
  *(_OWORD *)a1 = xmmword_2E3A0;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

double sub_5F3C@<D0>(uint64_t a1@<X8>)
{
  os_unfair_lock_lock((os_unfair_lock_t)&unk_2E508);
  id WeakRetained = objc_loadWeakRetained(&qword_2E510);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v3 = WeakRetained;
  id v4 = +[CLKDevice currentDevice];
  id v5 = objc_loadWeakRetained(&qword_2E510);
  if (v4 != v5)
  {

LABEL_5:
    id v9 = +[CLKDevice currentDevice];
    objc_storeWeak(&qword_2E510, v9);

    id v10 = objc_loadWeakRetained(&qword_2E510);
    qword_2E518 = (uint64_t)[v10 version];

    v11 = +[CLKDevice currentDevice];
    sub_6280((uint64_t)v11, v11);

    goto LABEL_6;
  }
  id v6 = +[CLKDevice currentDevice];
  id v7 = [v6 version];
  uint64_t v8 = qword_2E518;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_2E508);
  long long v12 = *(_OWORD *)&qword_2E4E0;
  *(_OWORD *)a1 = xmmword_2E4D0;
  *(_OWORD *)(a1 + 16) = v12;
  double result = *(double *)&xmmword_2E4F0;
  *(_OWORD *)(a1 + 32) = xmmword_2E4F0;
  *(void *)(a1 + 48) = qword_2E500;
  return result;
}

double sub_608C(uint64_t a1, void *a2)
{
  id v2 = a2;
  int v3 = _os_feature_enabled_impl();
  double v4 = 33.0;
  if (v3) {
    double v4 = 20.0;
  }
  *(double *)&xmmword_2E3A0 = v4;
  *(long long *)((char *)&xmmword_2E3A0 + 8) = xmmword_1A3C0;
  qword_2E3B8 = 0x4008000000000000;
  id v5 = [v2 deviceCategory];

  switch((unint64_t)v5)
  {
    case 1uLL:
      xmmword_2E3C0 = xmmword_1A430;
      qword_2E3D0 = 0x4060400000000000;
      float64x2_t v6 = (float64x2_t)xmmword_1A440;
      double v7 = 11.0;
      break;
    case 2uLL:
      xmmword_2E3C0 = xmmword_1A410;
      qword_2E3D0 = 0x4060800000000000;
      float64x2_t v6 = (float64x2_t)xmmword_1A420;
      double v7 = 10.0;
      break;
    case 3uLL:
      xmmword_2E3C0 = xmmword_1A3F0;
      qword_2E3D0 = 0x4061800000000000;
      float64x2_t v6 = (float64x2_t)xmmword_1A400;
      goto LABEL_9;
    case 4uLL:
    case 5uLL:
      xmmword_2E3C0 = xmmword_1A3D0;
      qword_2E3D0 = 0x4061800000000000;
      float64x2_t v6 = (float64x2_t)xmmword_1A3E0;
LABEL_9:
      double v7 = 6.0;
      break;
    default:
      double v7 = *(double *)&xmmword_2E3C0;
      float64x2_t v6 = *(float64x2_t *)((char *)&xmmword_2E3C0 + 8);
      break;
  }
  xmmword_2E3D8 = (__int128)vaddq_f64(v6, (float64x2_t)vdupq_lane_s64(COERCE__INT64(*(double *)&qword_2E3B8 + v7 + *(double *)&qword_2E3B8 + v7), 0));
  int v8 = _os_feature_enabled_impl();
  double v9 = 23.0;
  if (v8) {
    double v9 = 16.0;
  }
  double v10 = 9.0;
  if (v8) {
    double v10 = 0.0;
  }
  qword_2E3E8 = *(void *)&v9;
  qword_2E3F8 = *(void *)&v10;
  qword_2E3F0 = 0x4035800000000000;
  xmmword_2E400 = xmmword_1A450;
  unk_2E410 = xmmword_1A450;
  double result = 4.0;
  xmmword_2E420 = xmmword_1A460;
  return result;
}

void sub_6280(uint64_t a1, void *a2)
{
  id v2 = a2;
  *((void *)&xmmword_2E4D0 + 1) = 0x4010000000000000;
  qword_2E4E8 = 0x4008000000000000;
  *((void *)&xmmword_2E4F0 + 1) = 0x4008000000000000;
  id v8 = v2;
  int v3 = (char *)[v2 deviceCategory];
  if ((unint64_t)(v3 - 3) < 3)
  {
    *(void *)&xmmword_2E4D0 = 0x401C000000000000;
    qword_2E4E0 = 0x401C000000000000;
    *(void *)&xmmword_2E4F0 = 0x4014000000000000;
    double v4 = v8;
LABEL_8:
    [v4 screenCornerRadius];
    float64x2_t v6 = v8;
    goto LABEL_9;
  }
  if (v3 == (unsigned char *)&dword_0 + 2)
  {
    *(void *)&xmmword_2E4D0 = 0x4026000000000000;
    qword_2E4E0 = 0x4026000000000000;
    *(void *)&xmmword_2E4F0 = 0x401C000000000000;
    double v4 = v8;
    goto LABEL_8;
  }
  BOOL v5 = v3 == (unsigned char *)&dword_0 + 1;
  float64x2_t v6 = v8;
  if (v5)
  {
    *(void *)&xmmword_2E4D0 = 0x4026000000000000;
    qword_2E4E0 = 0x4028000000000000;
    *(void *)&xmmword_2E4F0 = 0x4020000000000000;
    double v7 = 12.0;
LABEL_9:
    qword_2E500 = *(void *)&v7;
  }
}

id sub_741C(uint64_t a1, void *a2)
{
  return [a2 removeObserver:*(void *)(a1 + 32)];
}

id sub_7968(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

id sub_8DDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

id sub_8FA8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _detailViewControllerForIndexPath:*(void *)(a1 + 40)];
}

id sub_8FB4(id *a1, void *a2)
{
  id v3 = a2;
  double v4 = NTKCCustomizationLocalizedString();
  BOOL v5 = +[UIImage systemImageNamed:@"applewatch.watchface"];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_935C;
  v26[3] = &unk_24838;
  id v27 = a1[4];
  id v28 = a1[5];
  float64x2_t v6 = +[UIAction actionWithTitle:v4 image:v5 identifier:0 handler:v26];

  objc_initWeak(&location, a1[6]);
  double v7 = NTKClockFaceLocalizedString();
  id v8 = +[UIImage systemImageNamed:@"square.and.arrow.up"];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_936C;
  v22[3] = &unk_24860;
  objc_copyWeak(&v24, &location);
  id v23 = a1[5];
  double v9 = +[UIAction actionWithTitle:v7 image:v8 identifier:0 handler:v22];

  double v10 = NTKCCustomizationLocalizedString();
  v11 = +[UIImage systemImageNamed:@"trash"];
  long long v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  long long v18 = sub_93DC;
  v19 = &unk_24838;
  id v20 = a1[4];
  id v21 = a1[5];
  long long v12 = +[UIAction actionWithTitle:v10 image:v11 identifier:0 handler:&v16];

  objc_msgSend(v12, "setAttributes:", 2, v16, v17, v18, v19);
  v29[0] = v6;
  v29[1] = v9;
  v29[2] = v12;
  id v13 = +[NSArray arrayWithObjects:v29 count:3];
  v14 = +[UIMenu menuWithTitle:&stru_252B0 children:v13];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v14;
}

void sub_9320(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_935C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSelectedFace:*(void *)(a1 + 40) suppressingCallbackToObserver:0];
}

void sub_936C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v2 = +[NTKGreenfieldCompanionShareController sharedController];
    [v2 shareWatchFace:*(void *)(a1 + 32) fromViewController:WeakRetained];
  }
}

id sub_93DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFace:*(void *)(a1 + 40) suppressingCallbackToObserver:0];
}

id sub_9540(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [*(id *)(a1 + 40) setPresentedDetailVC:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v2 = *(void **)(a1 + 40);

  return [v2 showViewController:v3 sender:v2];
}

id sub_9610(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSelectionsAnimated:1];
}

NSString *NTKFaceSnapshotRendererSuccessLogMessage(int a1)
{
  CFStringRef v1 = &stru_252B0;
  if (a1) {
    CFStringRef v1 = @" hasBlankComplication";
  }
  return +[NSString stringWithFormat:@"snapshot succeeded%@", v1];
}

void sub_AFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_B014(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  id v5 = [*(id *)(a1 + 32) complicationForSlot:a2];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v5 complicationType] == (char *)&dword_1C + 3;
  *a3 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void sub_B264(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(1);
  uint64_t v3 = (void *)qword_2E460;
  qword_2E460 = (uint64_t)v2;

  id v4 = +[NSString stringWithFormat:@"com.apple.ntkd.facesnapshotter"];
  dispatch_queue_t v5 = dispatch_queue_create((const char *)[v4 UTF8String], 0);
  float64x2_t v6 = (void *)qword_2E468;
  qword_2E468 = (uint64_t)v5;

  uint64_t v7 = +[NSMutableArray array];
  id v8 = (void *)qword_2E470;
  qword_2E470 = v7;

  byte_2E478 = 0;
  uint64_t v9 = +[NSMapTable strongToStrongObjectsMapTable];
  double v10 = (void *)qword_2E448;
  qword_2E448 = v9;

  byte_2E450 = 0;
  v11 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Waiting on NTKCompanionAppLibrary (AppConduit) so apps are known before we snapshot", buf, 2u);
  }

  long long v12 = +[NTKCompanionAppLibrary sharedAppLibrary];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_B408;
  v13[3] = &unk_248D8;
  id v14 = *(id *)(a1 + 32);
  [v12 prewarmCompanionDaemonWithCompletion:v13];
}

void sub_B408(uint64_t a1)
{
  CFStringRef v1 = qword_2E468;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B498;
  block[3] = &unk_248D8;
  id v3 = *(id *)(a1 + 32);
  dispatch_async(v1, block);
}

id sub_B498(uint64_t a1)
{
  dispatch_semaphore_t v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "NTKCompanionAppLibrary loaded!", v4, 2u);
  }

  byte_2E450 = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

void sub_B5E8(uint64_t a1)
{
  dispatch_semaphore_t v2 = [*(id *)(a1 + 32) nrDeviceUUID];
  if (v2)
  {
    id v3 = [(id)qword_2E448 objectForKey:v2];
    if (!v3)
    {
      id v3 = +[NTKCompanionComplicationCollectionManager sharedComplicationCollectionForDevice:*(void *)(a1 + 32)];
      [(id)qword_2E448 setObject:v3 forKey:v2];
      id v4 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 138412290;
        float64x2_t v6 = v2;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Listening for collection load of device uuid %@", (uint8_t *)&v5, 0xCu);
      }

      if (([v3 hasLoaded] & 1) == 0) {
        [v3 addObserver:*(void *)(a1 + 40)];
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void sub_B8E0(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_B95C;
  block[3] = &unk_248D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_2E468, block);
}

id sub_B95C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

void sub_B964(uint64_t a1)
{
  id v4 = [[NTKFaceSnapshotRequest alloc] initWithFace:*(void *)(a1 + 32) options:*(void *)(a1 + 40) completion:*(void *)(a1 + 56)];
  id v2 = (id)qword_2E470;
  id v3 = objc_msgSend(v2, "indexOfObject:inSortedRange:options:usingComparator:", v4, 0, objc_msgSend(v2, "count"), 1024, &stru_249B8);
  [(id)qword_2E470 insertObject:v4 atIndex:v3];
  objc_msgSend(*(id *)(a1 + 48), "_queue_serviceRequestIfIdle");
}

int64_t sub_BA14(id a1, NTKFaceSnapshotRequest *a2, NTKFaceSnapshotRequest *a3)
{
  id v4 = a2;
  int v5 = a3;
  float64x2_t v6 = [(NTKFaceSnapshotRequest *)v4 options];
  uint64_t v7 = [v6 objectForKey:@"NTKSnapshotPriorityKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v8 = [v7 unsignedIntegerValue];
  }
  else {
    id v8 = 0;
  }
  uint64_t v9 = [(NTKFaceSnapshotRequest *)v5 options];
  double v10 = [v9 objectForKey:@"NTKSnapshotPriorityKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = [v10 unsignedIntegerValue];
  }
  else {
    id v11 = 0;
  }
  if (v8 == v11)
  {
    long long v12 = [(NTKFaceSnapshotRequest *)v4 creationDate];
    id v13 = [(NTKFaceSnapshotRequest *)v5 creationDate];
    int64_t v14 = (int64_t)[v12 compare:v13];
  }
  else
  {
    int64_t v14 = v8 < v11;
  }

  return v14;
}

BOOL sub_BD40(id a1, NTKFaceSnapshotRequest *a2, unint64_t a3, BOOL *a4)
{
  return [(NTKFaceSnapshotRequest *)a2 isReady];
}

id sub_BD48(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_BDBC;
  v4[3] = &unk_248D8;
  v4[4] = v2;
  return objc_msgSend(v2, "_mainQueue_serviceRequest:completion:", v1, v4);
}

void sub_BDBC(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Signalling waiting queue that main queue is ready", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_BE90;
  block[3] = &unk_248D8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)qword_2E468, block);
}

id sub_BE90(uint64_t a1)
{
  byte_2E478 = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

uint64_t sub_BFC4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_C0C4(uint64_t a1, void *a2)
{
  id v11 = a2;
  [v11 setDataMode:3];
  id v3 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUIOnlyKey"];
  objc_msgSend(v11, "setSupressesNonSnapshotUI:", objc_msgSend(v3, "BOOLValue"));

  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUseCanonicalContentKey"];
  int v5 = v4;
  if (v4) {
    id v6 = [v4 BOOLValue];
  }
  else {
    id v6 = &dword_0 + 1;
  }
  [v11 setShowsCanonicalContent:v6];
  uint64_t v7 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotShouldUseSampleComplicationTemplatesKey"];
  objc_msgSend(v11, "setShouldUseSampleTemplate:", objc_msgSend(v7, "BOOLValue"));

  id v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotUnadornedContentKey"];
  objc_msgSend(v11, "setShowContentForUnadornedSnapshot:", objc_msgSend(v8, "BOOLValue"));

  uint64_t v9 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotForcedLockedKey"];
  objc_msgSend(v11, "setShowsLockedUI:", objc_msgSend(v9, "BOOLValue"));

  double v10 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"NTKSnapshotIgnoreSnapshotImages"];
  objc_msgSend(v11, "setIgnoreSnapshotImages:", objc_msgSend(v10, "BOOLValue"));
}

void sub_C8D8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v3 - 240), 8);
  objc_destroyWeak((id *)(v3 - 208));
  _Block_object_dispose((const void *)(v3 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_C92C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    uint64_t v7 = [a3 complication];
    if ([v7 complicationType] == (char *)&dword_1C + 3)
    {
      id v8 = [v6 display];
      uint64_t v9 = [v8 complicationTemplate];

      if (!v9)
      {
        double v10 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = [v7 clientIdentifier];
          int v12 = 138412290;
          id v13 = v11;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Missing complication template for %@", (uint8_t *)&v12, 0xCu);
        }
        *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
      }
    }
  }
}

void sub_CA78(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
  if (!*(unsigned char *)(v7 + 24))
  {
    *(unsigned char *)(v7 + 24) = 1;
    if (*(void *)(a1 + 32))
    {
      NTKSetIdealizedDate();
      CLKSetCompanionDisplayDate();
    }
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 88));
    uint64_t v9 = WeakRetained;
    if (WeakRetained)
    {
      [WeakRetained[1] setRootViewController:0];
      [v9 _hideSnapshotWindow];
    }
    double v10 = CFAbsoluteTimeGetCurrent() - *(double *)(a1 + 96);
    if (v5)
    {
      [v5 size];
      id v11 = NSStringFromCGSize(v34);
      int v12 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24)) {
          CFStringRef v13 = @" hasBlankComplication";
        }
        else {
          CFStringRef v13 = &stru_252B0;
        }
        int64_t v14 = +[NSString stringWithFormat:@"snapshot succeeded%@", v13];
        uint64_t v15 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 134218754;
        double v27 = v10;
        __int16 v28 = 2112;
        v29 = v14;
        __int16 v30 = 2112;
        v31 = v11;
        __int16 v32 = 2112;
        uint64_t v33 = v15;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%.2f seconds - %@: %@ %@", buf, 0x2Au);
      }
      long long v16 = *(id *)(a1 + 48);
      uint64_t v17 = v16;
      os_signpost_id_t v18 = *(void *)(a1 + 104);
      if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
      {
        int v19 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        *(_DWORD *)buf = 138412546;
        double v27 = *(double *)&v11;
        __int16 v28 = 1024;
        LODWORD(v29) = v19;
        _os_signpost_emit_with_name_impl(&dword_0, v17, OS_SIGNPOST_INTERVAL_END, v18, "FaceSnapshot", "size=%@ hasBlankComplication=%d", buf, 0x12u);
      }
    }
    else
    {
      id v20 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v25 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 134218498;
        double v27 = v10;
        __int16 v28 = 2112;
        v29 = v25;
        __int16 v30 = 2112;
        v31 = v6;
        _os_log_error_impl(&dword_0, v20, OS_LOG_TYPE_ERROR, "%.2f seconds - snapshot failed: %@, error: %@", buf, 0x20u);
      }

      id v21 = *(id *)(a1 + 48);
      id v11 = v21;
      os_signpost_id_t v22 = *(void *)(a1 + 104);
      if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
      {
        *(_DWORD *)buf = 138412290;
        double v27 = *(double *)&v6;
        _os_signpost_emit_with_name_impl(&dword_0, v11, OS_SIGNPOST_INTERVAL_END, v22, "FaceSnapshot", "snapshot failed: %@", buf, 0xCu);
      }
    }

    id v23 = [*(id *)(a1 + 56) completion];

    if (v23)
    {
      id v24 = [*(id *)(a1 + 56) completion];
      ((void (**)(void, void, id))v24)[2](v24, *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 80) + 8) + 24), v5);
    }
    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

void sub_CE18(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v2 = +[NSError errorWithDomain:kNTKFaceSnapshotRendererErrorDomain code:2 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_CEB4(uint64_t a1)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v2 = *(void **)(a1 + 32);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_CF8C;
  v3[3] = &unk_24B38;
  uint64_t v5 = *(void *)(a1 + 48);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v4 = *(id *)(a1 + 40);
  [v2 finalizeForSnapshotting:v3];

  objc_destroyWeak(&v6);
}

void sub_CF78(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_CF8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_D064;
  v5[3] = &unk_24B10;
  uint64_t v8 = *(void *)(a1 + 40);
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v9, (id *)(a1 + 48));
  id v7 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);

  objc_destroyWeak(&v9);
}

void sub_D064(uint64_t a1)
{
  +[CATransaction flush];
  +[CATransaction synchronize];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v2 = (uint64_t *)(a1 + 32);
    id v4 = _NTKLoggingObjectForDomain();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_14A78(v2, v5);
      }
    }
    else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "finalizeForSnapshotting completed after timeout", buf, 2u);
    }

    return;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v7 = [(id)objc_opt_class() renderSnapshotFromWindow:WeakRetained[1]];
    if (!v7)
    {
      id v9 = +[NSError errorWithDomain:kNTKFaceSnapshotRendererErrorDomain code:4 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

      goto LABEL_14;
    }
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    id v7 = +[NSError errorWithDomain:kNTKFaceSnapshotRendererErrorDomain code:3 userInfo:0];
    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v8();
LABEL_14:
}

void sub_D238(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_D2C8;
  block[3] = &unk_24AE8;
  long long v2 = *(_OWORD *)(a1 + 32);
  id v1 = (id)v2;
  long long v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_D2C8(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    id v1 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "preform prewarm routine finished after timeout", v3, 2u);
    }
  }
  else
  {
    long long v2 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    v2();
  }
}

id sub_D520(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_serviceRequestIfIdle");
}

void sub_DEDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_E4C8(id a1)
{
  qword_2E480 = (uint64_t)os_log_create("com.apple.nanotimekit.facesupport.notifications", "FaceSupport");

  _objc_release_x1();
}

void sub_E780(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = +[NTKCompanionFaceCollectionsManager sharedInstance];
  uint64_t v4 = [v6 sharedFaceCollectionForDevice:v3 forCollectionIdentifier:*(void *)(a1 + 32)];

  uint64_t v5 = (void *)qword_2E490;
  qword_2E490 = v4;
}

void sub_EAD0(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) galleryViewController];
  [v2 loadViewIfNeeded];

  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_EB9C;
  block[3] = &unk_24BF0;
  uint64_t v4 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v6 = v4;
  int v7 = *(_DWORD *)(a1 + 48);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_EB9C(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) galleryViewController];
  long long v2 = [v3 tableView];
  [v2 _performScrollTest:*(void *)(a1 + 40) iterations:*(unsigned int *)(a1 + 48) delta:12 scrollAxis:2];
}

void sub_EE04(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _prideFaceStateMachine:0];
}

void sub_EE48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setupGalleryPromise];
}

void sub_F118(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_F140(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v7 = [a2 collection];
  id v8 = [v7 title];

  if ([*(id *)(a1 + 32) isEqual:v8])
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

uint64_t sub_F28C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_F83C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  [v5 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _setupGalleryCollection:v5 atIndex:a3 shouldUpdateSnaphots:1 shouldReloadRow:0];
}

void sub_F9E4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[9];
    id v4 = v2[10];
    id v5 = [v4 name];
    unsigned int v6 = [v3 isEqualToString:v5];

    if (v6)
    {
      int v7 = [v4 object];
      [v2[8] removeAllObjects];
      [v2[7] removeAllIndexes];
      *((unsigned char *)v2 + 88) = 1;
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_FB18;
      v8[3] = &unk_24CD0;
      v8[4] = v2;
      [v7 enumerateObjectsUsingBlock:v8];
    }
  }
}

void sub_FB18(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = [a2 collection];
  [v5 setDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) _setupGalleryCollection:v5 atIndex:a3 shouldUpdateSnaphots:1 shouldReloadRow:0];
}

void sub_FE24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_FE48(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    unsigned int v6 = (void *)WeakRetained[5];
    uint64_t v7 = NRDevicePropertyCurrentUserLocale;
    uint64_t v21 = NRDevicePropertyCurrentUserLocale;
    id v8 = +[NSArray arrayWithObjects:&v21 count:1];
    [v6 unregisterForPropertyChanges:v8 withBlock:v5[3]];

    id v9 = (void *)v5[5];
    uint64_t v10 = NRDevicePropertyFractionCompleted;
    uint64_t v20 = NRDevicePropertyFractionCompleted;
    id v11 = +[NSArray arrayWithObjects:&v20 count:1];
    [v9 unregisterForPropertyChanges:v11 withBlock:v5[4]];

    uint64_t v12 = [v3 nrDevice];
    CFStringRef v13 = (void *)v5[5];
    v5[5] = v12;

    int64_t v14 = (void *)v5[5];
    uint64_t v19 = v7;
    uint64_t v15 = +[NSArray arrayWithObjects:&v19 count:1];
    [v14 registerForPropertyChanges:v15 withBlock:v5[3]];

    long long v16 = (void *)v5[5];
    uint64_t v18 = v10;
    uint64_t v17 = +[NSArray arrayWithObjects:&v18 count:1];
    [v16 registerForPropertyChanges:v17 withBlock:v5[4]];
  }
}

void sub_10B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10BB0(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = [a2 collection];
  id v8 = *(void **)(a1 + 32);

  if (v7 == v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void sub_10F20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  objc_destroyWeak(v30);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v31 - 136), 8);
  _Unwind_Resume(a1);
}

id sub_10F6C(uint64_t a1, unint64_t a2, char *a3)
{
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0x7FFFFFFFFFFFFFFFLL;
  for (i = *(void **)(a1 + 32); ; i = *(void **)(a1 + 32))
  {
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [i lastIndex];
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL || v7 < (unint64_t)[*(id *)(a1 + 40) count]) {
      break;
    }
    [*(id *)(a1 + 32) removeIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
  }
  *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) firstIndex];
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
    while (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v8 = *(void **)(a1 + 48);
      id v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:");
      uint64_t v10 = [v8 objectForKeyedSubscript:v9];

      if (v10)
      {
        id v11 = (char *)[v10 firstIndex];
        uint64_t v12 = [*(id *)(a1 + 40) objectAtIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
        CFStringRef v13 = [v12 collection];

        int64_t v14 = (char *)[v13 numberOfFaces];
        if (v11 == (char *)0x7FFFFFFFFFFFFFFFLL || v11 >= v14)
        {
          long long v16 = *(void **)(a1 + 48);
          uint64_t v17 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
          [v16 removeObjectForKey:v17];

          [*(id *)(a1 + 32) removeIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
        }
        else if ((unint64_t)v11 < a2 || &v11[-a2] >= a3)
        {
          *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) indexGreaterThanIndex:*(void *)(*(void *)(*(void *)(a1 + 64)+ 8)+ 24)];
        }
        else
        {
          *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v11;
        }
      }
      else
      {
        [*(id *)(a1 + 32) removeIndex:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = [*(id *)(a1 + 32) firstIndex];
      }

      if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_23;
      }
    }
    goto LABEL_24;
  }
LABEL_23:
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_24:
    id v19 = 0;
    goto LABEL_37;
  }
  uint64_t v20 = objc_msgSend(*(id *)(a1 + 40), "objectAtIndex:");
  uint64_t v21 = [v20 collection];

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 0x7FFFFFFFFFFFFFFFLL
    || (unint64_t)[v21 numberOfFaces] <= *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    id v19 = 0;
  }
  else
  {
    os_signpost_id_t v22 = objc_msgSend(v21, "faceAtIndex:");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v19 = v22;
    }
    else
    {
      if (v22)
      {
        id v23 = _NTKLoggingObjectForDomain();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          v25 = [v21 title];
          uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
          int v27 = 138412802;
          __int16 v28 = v25;
          __int16 v29 = 2112;
          __int16 v30 = v22;
          __int16 v31 = 2048;
          uint64_t v32 = v26;
          _os_log_fault_impl(&dword_0, v23, OS_LOG_TYPE_FAULT, "NTKGalleryPrewarmCollectionNotVendingFace: Collection %@ returned a %@ at an index %lu", (uint8_t *)&v27, 0x20u);
        }
      }
      id v19 = 0;
    }
  }
LABEL_37:

  return v19;
}

void sub_11344(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_11414;
  block[3] = &unk_24D98;
  objc_copyWeak(&v10, (id *)(a1 + 64));
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 56);
  id v7 = v2;
  uint64_t v9 = v3;
  long long v5 = *(_OWORD *)(a1 + 40);
  id v4 = (id)v5;
  long long v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
}

void sub_11414(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    uint64_t v3 = *(void **)(a1 + 32);
    id v4 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    long long v5 = [v3 objectForKey:v4];

    [v5 removeIndex:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
    if ([v5 firstIndex] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      unsigned int v6 = *(void **)(a1 + 32);
      id v7 = +[NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
      [v6 removeObjectForKey:v7];

      [*(id *)(a1 + 40) removeIndex:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)];
    }
    long long v8 = (void *)v9[6];
    v9[6] = 0;

    [v9 _prewarmNextGallerySnapshot];
    id WeakRetained = v9;
  }
}

id sub_116B0(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

UIMenu *__cdecl sub_116B8(id a1, NSArray *a2)
{
  return 0;
}

id sub_118B0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showViewController:sender:", *(void *)(a1 + 40));
}

void sub_11994(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) previewingGalleryCell];
  [v1 clearSelectedFaces];
}

id sub_119D8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPreviewingGalleryCell:0];
}

void sub_12480(uint64_t a1)
{
  id v2 = +[NSIndexPath indexPathForRow:*(void *)(a1 + 40) inSection:0];
  [*(id *)(*(void *)(a1 + 32) + 32) scrollToRowAtIndexPath:v2 atScrollPosition:2 animated:0];
}

id sub_125E0(uint64_t a1, void *a2)
{
  return [a2 addObserver:*(void *)(a1 + 32)];
}

void sub_12D88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  long long v5 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Library List: user deleting face at indexPath %@", buf, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 40) suspendUpdatesFromDaemon];
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 32);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_12F38;
  v10[3] = &unk_24E78;
  id v11 = v4;
  uint64_t v12 = v6;
  id v13 = *(id *)(a1 + 40);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_131E4;
  v9[3] = &unk_24EA0;
  v9[4] = *(void *)(a1 + 32);
  id v8 = v4;
  [v7 performBatchUpdates:v10 completion:v9];
}

void sub_12F38(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Library List: starting batch updates", (uint8_t *)&v17, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  if (v3 && (id v4 = [v3 row], v4 < objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "numberOfFaces")))
  {
    long long v5 = (char *)[*(id *)(a1 + 32) row];
    uint64_t v6 = [*(id *)(*(void *)(a1 + 40) + 40) faceAtIndex:v5];
    id v7 = (char *)[*(id *)(*(void *)(a1 + 40) + 40) selectedFaceIndex];
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 40), "removeFace:suppressingCallbackToObserver:", v6);
    [*(id *)(a1 + 40) _removeViewControllerForFace:v6];
    id v8 = *(void **)(*(void *)(a1 + 40) + 32);
    uint64_t v19 = *(void *)(a1 + 32);
    uint64_t v9 = +[NSArray arrayWithObjects:&v19 count:1];
    [v8 deleteRowsAtIndexPaths:v9 withRowAnimation:100];

    if (v7 == v5)
    {
      id v10 = (char *)[*(id *)(*(void *)(a1 + 40) + 40) selectedFaceIndex];
      id v11 = _NTKLoggingObjectForDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 134217984;
        uint64_t v18 = v10;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Library List: marking %ld as selected row", (uint8_t *)&v17, 0xCu);
      }

      if (v10 == v5) {
        uint64_t v12 = v10 + 1;
      }
      else {
        uint64_t v12 = v10;
      }
      id v13 = *(void **)(a1 + 48);
      int64_t v14 = +[NSIndexPath indexPathForRow:v12 inSection:0];
      id v15 = [v13 cellForRowAtIndexPath:v14];

      [v15 setCurrentFace:1];
    }
    [*(id *)(a1 + 40) _updateTitle];
    NTKCCAnalyticsIncrement();
  }
  else
  {
    long long v16 = _NTKLoggingObjectForDomain();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      sub_14CE4((uint64_t *)(a1 + 32), v16);
    }

    [*(id *)(*(void *)(a1 + 40) + 32) reloadData];
  }
}

id sub_131E4(uint64_t a1)
{
  id v2 = _NTKLoggingObjectForDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Library List: ending batch updates", v7, 2u);
  }

  if ([*(id *)(*(void *)(a1 + 32) + 40) numberOfFaces] == (char *)&dword_0 + 1)
  {
    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
    id v4 = +[NSIndexPath indexPathForRow:0 inSection:0];
    id v8 = v4;
    long long v5 = +[NSArray arrayWithObjects:&v8 count:1];
    [v3 reloadRowsAtIndexPaths:v5 withRowAnimation:5];
  }
  return [*(id *)(*(void *)(a1 + 32) + 40) resumeUpdatesFromDaemon];
}

id sub_142B4(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 56) setAlpha:v1];
}

void sub_14978(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Face upgrade failed but no error given: %@", (uint8_t *)&v2, 0xCu);
}

void sub_149F0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Face upgrade failed: manager = %@, error = %@", (uint8_t *)&v3, 0x16u);
}

void sub_14A78(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "finalizeForSnapshotting failed after timeout: %@", (uint8_t *)&v3, 0xCu);
}

void sub_14AF4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "UserInfo is missing for notification response %@", (uint8_t *)&v2, 0xCu);
}

void sub_14B6C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Bundle Identifier %@ is invalid", (uint8_t *)&v2, 0xCu);
}

void sub_14BE4(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Can not open Face Detail for %{public}@. Bundle not found", (uint8_t *)&v2, 0xCu);
}

void sub_14C5C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Attempted to scroll to face at index %lu, but there are only %lu faces", (uint8_t *)&v3, 0x16u);
}

void sub_14CE4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Library List: indexPath %@ not valid", (uint8_t *)&v3, 0xCu);
}

uint64_t BPSBackgroundColor()
{
  return _BPSBackgroundColor();
}

uint64_t BPSBridgeTintColor()
{
  return _BPSBridgeTintColor();
}

uint64_t BPSDetailTextColor()
{
  return _BPSDetailTextColor();
}

uint64_t BPSForegroundColor()
{
  return _BPSForegroundColor();
}

uint64_t BPSSeparatorColor()
{
  return _BPSSeparatorColor();
}

uint64_t BPSTextColor()
{
  return _BPSTextColor();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

uint64_t CLKLayoutIsRTL()
{
  return _CLKLayoutIsRTL();
}

uint64_t CLKSetCompanionDisplayDate()
{
  return _CLKSetCompanionDisplayDate();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return _CTLineCreateWithAttributedString(attrString);
}

double CTLineGetTypographicBounds(CTLineRef line, CGFloat *ascent, CGFloat *descent, CGFloat *leading)
{
  return _CTLineGetTypographicBounds(line, ascent, descent, leading);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return _NSStringFromCGSize(size);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NTKCCAnalyticsIncrement()
{
  return _NTKCCAnalyticsIncrement();
}

uint64_t NTKCCustomizationLocalizedString()
{
  return _NTKCCustomizationLocalizedString();
}

uint64_t NTKCOutlineColor()
{
  return _NTKCOutlineColor();
}

uint64_t NTKCScreenEdgeMargin()
{
  return _NTKCScreenEdgeMargin();
}

uint64_t NTKCScreenStyle()
{
  return _NTKCScreenStyle();
}

uint64_t NTKCSeparatorColor()
{
  return _NTKCSeparatorColor();
}

uint64_t NTKClockFaceLocalizedString()
{
  return _NTKClockFaceLocalizedString();
}

uint64_t NTKCompanionClockFaceLocalizedString()
{
  return _NTKCompanionClockFaceLocalizedString();
}

uint64_t NTKInternalBuild()
{
  return _NTKInternalBuild();
}

uint64_t NTKMaxLineHeightDeltaForEnumeratableFaceCollection()
{
  return _NTKMaxLineHeightDeltaForEnumeratableFaceCollection();
}

uint64_t NTKRoundDateDownToNearestSecond()
{
  return _NTKRoundDateDownToNearestSecond();
}

uint64_t NTKSetIdealizedDate()
{
  return _NTKSetIdealizedDate();
}

uint64_t PSIsN56()
{
  return _PSIsN56();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

uint64_t _NTKLoggingObjectForDomain()
{
  return __NTKLoggingObjectForDomain();
}

uint64_t _UIAppSetStatusBarHeight()
{
  return __UIAppSetStatusBarHeight();
}

uint64_t _UIAppSetStatusBarOrientation()
{
  return __UIAppSetStatusBarOrientation();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
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

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return [a1 CGPointValue];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__applicationKeyWindow(void *a1, const char *a2, ...)
{
  return [a1 _applicationKeyWindow];
}

id objc_msgSend__baselineOffsetFromBottom(void *a1, const char *a2, ...)
{
  return [a1 _baselineOffsetFromBottom];
}

id objc_msgSend__canTouchCollectionView(void *a1, const char *a2, ...)
{
  return [a1 _canTouchCollectionView];
}

id objc_msgSend__clearFaceViewControllers(void *a1, const char *a2, ...)
{
  return [a1 _clearFaceViewControllers];
}

id objc_msgSend__complicationsAreLoaded(void *a1, const char *a2, ...)
{
  return [a1 _complicationsAreLoaded];
}

id objc_msgSend__configureLayout(void *a1, const char *a2, ...)
{
  return [a1 _configureLayout];
}

id objc_msgSend__editDoneTapped(void *a1, const char *a2, ...)
{
  return [a1 _editDoneTapped];
}

id objc_msgSend__firstBaselineOffsetFromTop(void *a1, const char *a2, ...)
{
  return [a1 _firstBaselineOffsetFromTop];
}

id objc_msgSend__fontSizeDidChange(void *a1, const char *a2, ...)
{
  return [a1 _fontSizeDidChange];
}

id objc_msgSend__hideSnapshotWindow(void *a1, const char *a2, ...)
{
  return [a1 _hideSnapshotWindow];
}

id objc_msgSend__highlight(void *a1, const char *a2, ...)
{
  return [a1 _highlight];
}

id objc_msgSend__load(void *a1, const char *a2, ...)
{
  return [a1 _load];
}

id objc_msgSend__loadLibrary(void *a1, const char *a2, ...)
{
  return [a1 _loadLibrary];
}

id objc_msgSend__navigateToRowContainingWhatsNew(void *a1, const char *a2, ...)
{
  return [a1 _navigateToRowContainingWhatsNew];
}

id objc_msgSend__outlineLineWidth(void *a1, const char *a2, ...)
{
  return [a1 _outlineLineWidth];
}

id objc_msgSend__prewarmNextGallerySnapshot(void *a1, const char *a2, ...)
{
  return [a1 _prewarmNextGallerySnapshot];
}

id objc_msgSend__queryForNewFaces(void *a1, const char *a2, ...)
{
  return [a1 _queryForNewFaces];
}

id objc_msgSend__reloadAllFacesForCollectionView(void *a1, const char *a2, ...)
{
  return [a1 _reloadAllFacesForCollectionView];
}

id objc_msgSend__reloadFaces(void *a1, const char *a2, ...)
{
  return [a1 _reloadFaces];
}

id objc_msgSend__resetCollectionView(void *a1, const char *a2, ...)
{
  return [a1 _resetCollectionView];
}

id objc_msgSend__setupGalleryPromise(void *a1, const char *a2, ...)
{
  return [a1 _setupGalleryPromise];
}

id objc_msgSend__showBearTrap(void *a1, const char *a2, ...)
{
  return [a1 _showBearTrap];
}

id objc_msgSend__transformForFaceView(void *a1, const char *a2, ...)
{
  return [a1 _transformForFaceView];
}

id objc_msgSend__updateOutlineColor(void *a1, const char *a2, ...)
{
  return [a1 _updateOutlineColor];
}

id objc_msgSend__updateTitle(void *a1, const char *a2, ...)
{
  return [a1 _updateTitle];
}

id objc_msgSend__viewWhatsNew(void *a1, const char *a2, ...)
{
  return [a1 _viewWhatsNew];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activeNRDevice(void *a1, const char *a2, ...)
{
  return [a1 activeNRDevice];
}

id objc_msgSend_addFaceDetailViewController(void *a1, const char *a2, ...)
{
  return [a1 addFaceDetailViewController];
}

id objc_msgSend_agaveReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 agaveReuseIdentifier];
}

id objc_msgSend_aloeReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 aloeReuseIdentifier];
}

id objc_msgSend_applicationState(void *a1, const char *a2, ...)
{
  return [a1 applicationState];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_avoniaReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 avoniaReuseIdentifier];
}

id objc_msgSend_backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 backgroundColor];
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

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifierForUpgrade(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifierForUpgrade];
}

id objc_msgSend_canUpgradeFace(void *a1, const char *a2, ...)
{
  return [a1 canUpgradeFace];
}

id objc_msgSend_categoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 categoryIdentifier];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_childViewControllers(void *a1, const char *a2, ...)
{
  return [a1 childViewControllers];
}

id objc_msgSend_classicReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 classicReuseIdentifier];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearSelectedFaces(void *a1, const char *a2, ...)
{
  return [a1 clearSelectedFaces];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_collection(void *a1, const char *a2, ...)
{
  return [a1 collection];
}

id objc_msgSend_color(void *a1, const char *a2, ...)
{
  return [a1 color];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationTemplate(void *a1, const char *a2, ...)
{
  return [a1 complicationTemplate];
}

id objc_msgSend_complicationType(void *a1, const char *a2, ...)
{
  return [a1 complicationType];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentFace(void *a1, const char *a2, ...)
{
  return [a1 currentFace];
}

id objc_msgSend_customEditModes(void *a1, const char *a2, ...)
{
  return [a1 customEditModes];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_deviceCanBePrewarmed(void *a1, const char *a2, ...)
{
  return [a1 deviceCanBePrewarmed];
}

id objc_msgSend_deviceCategory(void *a1, const char *a2, ...)
{
  return [a1 deviceCategory];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_display(void *a1, const char *a2, ...)
{
  return [a1 display];
}

id objc_msgSend_enabledState(void *a1, const char *a2, ...)
{
  return [a1 enabledState];
}

id objc_msgSend_estimatedRowHeight(void *a1, const char *a2, ...)
{
  return [a1 estimatedRowHeight];
}

id objc_msgSend_face(void *a1, const char *a2, ...)
{
  return [a1 face];
}

id objc_msgSend_faceClass(void *a1, const char *a2, ...)
{
  return [a1 faceClass];
}

id objc_msgSend_faceContainerView(void *a1, const char *a2, ...)
{
  return [a1 faceContainerView];
}

id objc_msgSend_faceSize(void *a1, const char *a2, ...)
{
  return [a1 faceSize];
}

id objc_msgSend_faceView(void *a1, const char *a2, ...)
{
  return [a1 faceView];
}

id objc_msgSend_facesByUUID(void *a1, const char *a2, ...)
{
  return [a1 facesByUUID];
}

id objc_msgSend_firstBaselineAnchor(void *a1, const char *a2, ...)
{
  return [a1 firstBaselineAnchor];
}

id objc_msgSend_firstIndex(void *a1, const char *a2, ...)
{
  return [a1 firstIndex];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_flush(void *a1, const char *a2, ...)
{
  return [a1 flush];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return [a1 font];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_freeze(void *a1, const char *a2, ...)
{
  return [a1 freeze];
}

id objc_msgSend_galleryViewController(void *a1, const char *a2, ...)
{
  return [a1 galleryViewController];
}

id objc_msgSend_hasLoaded(void *a1, const char *a2, ...)
{
  return [a1 hasLoaded];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_indexPathsForSelectedItems(void *a1, const char *a2, ...)
{
  return [a1 indexPathsForSelectedItems];
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return [a1 indexSet];
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return [a1 intrinsicContentSize];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return [a1 isHighlighted];
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return [a1 isMovingToParentViewController];
}

id objc_msgSend_isSelected(void *a1, const char *a2, ...)
{
  return [a1 isSelected];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_item(void *a1, const char *a2, ...)
{
  return [a1 item];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_lastIndex(void *a1, const char *a2, ...)
{
  return [a1 lastIndex];
}

id objc_msgSend_launchedToTest(void *a1, const char *a2, ...)
{
  return [a1 launchedToTest];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutBelowIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutBelowIfNeeded];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_libraryDetailViewController(void *a1, const char *a2, ...)
{
  return [a1 libraryDetailViewController];
}

id objc_msgSend_loadViewIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 loadViewIfNeeded];
}

id objc_msgSend_loaded(void *a1, const char *a2, ...)
{
  return [a1 loaded];
}

id objc_msgSend_localizedUppercaseString(void *a1, const char *a2, ...)
{
  return [a1 localizedUppercaseString];
}

id objc_msgSend_luxoReuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 luxoReuseIdentifier];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigateToRowContainingWhatsNew(void *a1, const char *a2, ...)
{
  return [a1 navigateToRowContainingWhatsNew];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_nrDevice(void *a1, const char *a2, ...)
{
  return [a1 nrDevice];
}

id objc_msgSend_nrDeviceUUID(void *a1, const char *a2, ...)
{
  return [a1 nrDeviceUUID];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfFaces(void *a1, const char *a2, ...)
{
  return [a1 numberOfFaces];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return [a1 options];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_popoverPresentationController(void *a1, const char *a2, ...)
{
  return [a1 popoverPresentationController];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_prepareForSnapshotting(void *a1, const char *a2, ...)
{
  return [a1 prepareForSnapshotting];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_previewViewController(void *a1, const char *a2, ...)
{
  return [a1 previewViewController];
}

id objc_msgSend_previewingGalleryCell(void *a1, const char *a2, ...)
{
  return [a1 previewingGalleryCell];
}

id objc_msgSend_prominentInsetGroupedHeaderConfiguration(void *a1, const char *a2, ...)
{
  return [a1 prominentInsetGroupedHeaderConfiguration];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllIndexes(void *a1, const char *a2, ...)
{
  return [a1 removeAllIndexes];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resumeUpdatesFromDaemon(void *a1, const char *a2, ...)
{
  return [a1 resumeUpdatesFromDaemon];
}

id objc_msgSend_reuseIdentifier(void *a1, const char *a2, ...)
{
  return [a1 reuseIdentifier];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenCornerRadius(void *a1, const char *a2, ...)
{
  return [a1 screenCornerRadius];
}

id objc_msgSend_scrollOffset(void *a1, const char *a2, ...)
{
  return [a1 scrollOffset];
}

id objc_msgSend_selectedFace(void *a1, const char *a2, ...)
{
  return [a1 selectedFace];
}

id objc_msgSend_selectedFaceIndex(void *a1, const char *a2, ...)
{
  return [a1 selectedFaceIndex];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return [a1 separatorInset];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_setNeedsRender(void *a1, const char *a2, ...)
{
  return [a1 setNeedsRender];
}

id objc_msgSend_sharedAppLibrary(void *a1, const char *a2, ...)
{
  return [a1 sharedAppLibrary];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedMonitor(void *a1, const char *a2, ...)
{
  return [a1 sharedMonitor];
}

id objc_msgSend_sharedRenderingContext(void *a1, const char *a2, ...)
{
  return [a1 sharedRenderingContext];
}

id objc_msgSend_shouldShow(void *a1, const char *a2, ...)
{
  return [a1 shouldShow];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapshotCache(void *a1, const char *a2, ...)
{
  return [a1 snapshotCache];
}

id objc_msgSend_spacing(void *a1, const char *a2, ...)
{
  return [a1 spacing];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return [a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_suspendUpdatesFromDaemon(void *a1, const char *a2, ...)
{
  return [a1 suspendUpdatesFromDaemon];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_tabBar(void *a1, const char *a2, ...)
{
  return [a1 tabBar];
}

id objc_msgSend_tabBarController(void *a1, const char *a2, ...)
{
  return [a1 tabBarController];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return [a1 tableView];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_textProperties(void *a1, const char *a2, ...)
{
  return [a1 textProperties];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_upgradingFaceIndex(void *a1, const char *a2, ...)
{
  return [a1 upgradingFaceIndex];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return [a1 version];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return [a1 viewControllers];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}