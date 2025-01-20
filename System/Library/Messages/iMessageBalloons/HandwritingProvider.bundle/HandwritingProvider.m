uint64_t sub_4168(uint64_t a1)
{
  uint64_t result;

  result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t sub_4328(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

BOOL HWDeviceIsiPad()
{
  v0 = +[UIDevice currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == (char *)&dword_0 + 1;

  return v1;
}

BOOL HWDeviceIsLargeiPad()
{
  BOOL result = HWDeviceIsiPad();
  if (result)
  {
    BOOL v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;
    double v5 = v4;

    if (v3 >= v5) {
      double v6 = v5;
    }
    else {
      double v6 = v3;
    }
    return v6 > 768.0;
  }
  return result;
}

BOOL HWDeviceIsiPhone()
{
  v0 = +[UIDevice currentDevice];
  BOOL v1 = [v0 userInterfaceIdiom] == 0;

  return v1;
}

BOOL HWDeviceSmallScreen()
{
  v0 = +[UIScreen mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  if (v2 >= v4) {
    double v5 = v4;
  }
  else {
    double v5 = v2;
  }
  return v5 == 320.0;
}

BOOL HWDeviceMediumScreen()
{
  v0 = +[UIScreen mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  if (v2 >= v4) {
    double v5 = v4;
  }
  else {
    double v5 = v2;
  }
  return v5 == 375.0;
}

BOOL HWDeviceLargeScreen()
{
  v0 = +[UIScreen mainScreen];
  [v0 bounds];
  double v2 = v1;
  double v4 = v3;

  if (v2 >= v4) {
    double v5 = v4;
  }
  else {
    double v5 = v2;
  }
  return v5 == 414.0;
}

void sub_5FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v21 - 144));
  _Unwind_Resume(a1);
}

void sub_5FE0(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setCurrentHandwritingItem:v3];

  if (HWDeviceIsiPad())
  {
    [WeakRetained _done:0];
  }
  else
  {
    [WeakRetained _resetScrollView:1];
    [WeakRetained _sendTypingIndicator];
  }
}

id sub_7220(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 320) setAlpha:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 328);

  return [v3 setAlpha:v2];
}

id sub_74F0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 304) setAlpha:*(double *)(a1 + 40)];
}

id sub_AB30()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_33618;
  uint64_t v7 = qword_33618;
  if (!qword_33618)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_C038;
    v3[3] = &unk_28740;
    v3[4] = &v4;
    sub_C038((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_ABFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_BF3C(id a1)
{
  id v1 = +[UIDevice currentDevice];
  double v2 = (char *)[v1 _graphicsQuality];

  uint64_t v3 = 3902;
  if (v2 == (unsigned char *)&dword_8 + 2) {
    uint64_t v3 = 2020;
  }
  qword_33600 = v3;
}

void sub_BF90(id a1)
{
  if (HWDeviceIsiPad())
  {
    id v1 = &unk_26380;
    if (HWDeviceIsLargeiPad())
    {
      double v2 = +[UIScreen mainScreen];
      [v2 bounds];
      double v4 = v3;
      double v6 = v5;

      if (v4 >= v6) {
        double v7 = v6;
      }
      else {
        double v7 = v4;
      }
      if (v7 > 834.0) {
        id v1 = &unk_26260;
      }
    }
  }
  else if (HWDeviceSmallScreen())
  {
    id v1 = &unk_264A0;
  }
  else
  {
    id v1 = &unk_265C0;
  }
  qword_335F8 = (uint64_t)v1;
}

Class sub_C038(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_33620)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_C17C;
    v3[4] = &unk_28778;
    void v3[5] = v3;
    long long v4 = off_28760;
    uint64_t v5 = 0;
    qword_33620 = _sl_dlopen();
    if (!qword_33620)
    {
      abort_report_np();
LABEL_8:
      sub_165B4();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CKBrowserItemPayload");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_33618 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_C17C()
{
  uint64_t result = _sl_dlopen();
  qword_33620 = result;
  return result;
}

id sub_C5F0(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = [*(id *)(a1 + 40) userInterfaceStyle];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _setupLayerAndStateControllerWithStateName:v3];
}

void sub_DE28(uint64_t a1)
{
  double v2 = +[HWRecentsManager sharedManager];
  [v2 deleteItem:*(void *)(a1 + 32)];

  uint64_t v3 = [*(id *)(a1 + 40) _indexPathForIndex:*(void *)(a1 + 56)];
  long long v4 = [*(id *)(a1 + 48) cellForItemAtIndexPath:v3];
  [v4 setSelected:1];
  uint64_t v5 = *(void **)(a1 + 48);
  double v7 = v3;
  double v6 = +[NSArray arrayWithObjects:&v7 count:1];
  [v5 deleteItemsAtIndexPaths:v6];
}

id sub_DF10(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadData];
}

void sub_E678(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)*(unint64_t *)&a2;
  long long v4 = [*(id *)(a1 + 32) leftShadow];
  [v4 setAlpha:v3];

  LOBYTE(v5) = *(unsigned char *)(a1 + 41);
  double v6 = (double)v5;
  id v7 = [*(id *)(a1 + 32) rightShadow];
  [v7 setAlpha:v6];
}

void sub_E900(uint64_t a1)
{
  [*(id *)(a1 + 32) pickerDidExitEditMode:*(void *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  double v3 = *(double *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double v6 = [*(id *)(a1 + 40) collectionView];
  objc_msgSend(v6, "setContentInset:", v2, v3, v4, v5);

  double v7 = *(double *)(a1 + 80);
  double v8 = *(double *)(a1 + 88);
  id v9 = [*(id *)(a1 + 40) collectionView];
  objc_msgSend(v9, "setContentOffset:", v7, v8);
}

id sub_EB38(uint64_t a1)
{
  return [*(id *)(a1 + 32) deselectItemAtIndexPath:*(void *)(a1 + 40) animated:1];
}

void sub_F048(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v23 - 80));
  objc_destroyWeak((id *)(v23 - 72));
  _Unwind_Resume(a1);
}

void sub_F08C(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) drawing];
  float64x2_t v7 = vsubq_f64((float64x2_t)vextq_s8((int8x16_t)_PlatformSpec, (int8x16_t)_PlatformSpec, 8uLL), vaddq_f64(*(float64x2_t *)&qword_33690, (float64x2_t)xmmword_336A0));
  double v3 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:*(void *)(a1 + 72)];
  +[UITraitCollection setCurrentTraitCollection:v3];

  double v4 = +[UIColor inkColor];
  double v5 = +[DKInkThumbnailRenderer imageForDrawing:v2 fittingInSize:v4 color:0 highFidelity:v7.f64[1]];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_F230;
  block[3] = &unk_28890;
  objc_copyWeak(&v11, (id *)(a1 + 48));
  objc_copyWeak(&v12, (id *)(a1 + 56));
  id v9 = v5;
  id v10 = *(id *)(a1 + 40);
  id v6 = v5;
  objc_copyWeak(&v13, (id *)(a1 + 64));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void sub_F230(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [WeakRetained setObject:v4 forKey:*(void *)(a1 + 40)];
  }
  double v5 = [v3 uuidString];
  unsigned int v6 = [v5 isEqual:*(void *)(a1 + 40)];

  if (v6)
  {
    id v7 = v3;
    if (!v7) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  id v8 = objc_loadWeakRetained((id *)(a1 + 64));
  id v7 = [v8 _cellViewForUUID:*(void *)(a1 + 40)];

  if (v7)
  {
LABEL_7:
    id v9 = [v7 imageView];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_F39C;
    v10[3] = &unk_28868;
    id v11 = v7;
    id v12 = *(id *)(a1 + 32);
    +[UIView transitionWithView:v9 duration:5242880 options:v10 animations:0 completion:0.18];
  }
LABEL_8:
}

void sub_F39C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) imageView];
  [v2 setImage:v1];
}

void sub_10AC4(uint64_t a1, double a2)
{
  LOBYTE(a2) = *(unsigned char *)(a1 + 40);
  double v2 = (double)*(unint64_t *)&a2;
  id v3 = [*(id *)(a1 + 32) deleteButton];
  [v3 setAlpha:v2];
}

id sub_10B1C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned char *)(a1 + 40) == 0];
}

void sub_11240(id a1)
{
  if (HWDeviceIsiPad())
  {
    if (HWDeviceIsLargeiPad())
    {
      _PlatformSpec = xmmword_268B0;
      *(_OWORD *)&qword_33690 = xmmword_268C0;
      xmmword_336A0 = xmmword_268C0;
      *(_OWORD *)&qword_336B0 = xmmword_268D0;
      xmmword_336C0 = xmmword_268E0;
      *(_OWORD *)&qword_336D0 = xmmword_268F0;
      xmmword_336E0 = xmmword_26900;
      *(_OWORD *)&qword_336F0 = xmmword_26910;
      __asm { FMOV            V0.2D, #20.0 }
      xmmword_33700 = _Q0;
      qword_33710 = *(void *)&UIFontWeightRegular;
      *(_OWORD *)&qword_33718 = xmmword_26920;
      long long v6 = xmmword_267C0;
      *(_OWORD *)algn_33728 = xmmword_267C0;
      long long v7 = xmmword_26930;
    }
    else
    {
      _PlatformSpec = xmmword_26810;
      *(_OWORD *)&qword_33690 = xmmword_26820;
      xmmword_336A0 = xmmword_26820;
      *(_OWORD *)&qword_336B0 = xmmword_26830;
      xmmword_336C0 = xmmword_26840;
      *(_OWORD *)&qword_336D0 = xmmword_26850;
      xmmword_336E0 = xmmword_26860;
      *(_OWORD *)&qword_336F0 = xmmword_26870;
      xmmword_33700 = xmmword_26880;
      qword_33710 = *(void *)&UIFontWeightRegular;
      *(_OWORD *)&qword_33718 = xmmword_26890;
      long long v6 = xmmword_267C0;
      *(_OWORD *)algn_33728 = xmmword_267C0;
      long long v7 = xmmword_268A0;
    }
    *(_OWORD *)&qword_33738 = v7;
    *(_OWORD *)&qword_33748 = v6;
  }
  else
  {
    BOOL v8 = HWDeviceSmallScreen();
    _PlatformSpec = xmmword_26770;
    *(_OWORD *)&qword_33690 = xmmword_26780;
    xmmword_336A0 = xmmword_26780;
    *(_OWORD *)&qword_336B0 = xmmword_26790;
    if (v8)
    {
      xmmword_336C0 = xmmword_267E0;
      *(_OWORD *)&qword_336D0 = 0u;
      __asm { FMOV            V0.2D, #18.0 }
      xmmword_336E0 = 0u;
      *(_OWORD *)&qword_336F0 = _Q0;
      *((void *)&xmmword_33700 + 1) = 0x402C000000000000;
      qword_33710 = *(void *)&UIFontWeightLight;
      *(_OWORD *)&qword_33718 = xmmword_267F0;
      long long v10 = xmmword_26800;
    }
    else
    {
      xmmword_336C0 = xmmword_267A0;
      *(_OWORD *)&qword_336D0 = 0u;
      __asm { FMOV            V0.2D, #22.0 }
      xmmword_336E0 = 0u;
      *(_OWORD *)&qword_336F0 = _Q0;
      *((void *)&xmmword_33700 + 1) = 0x402C000000000000;
      qword_33710 = *(void *)&UIFontWeightLight;
      *(_OWORD *)&qword_33718 = xmmword_267B0;
      long long v10 = xmmword_267C0;
    }
    *(_OWORD *)algn_33728 = v10;
    qword_33748 = 0;
    qword_33750 = 0;
    *(_OWORD *)&qword_33738 = xmmword_267D0;
  }
}

id sub_11838()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_33638;
  uint64_t v7 = qword_33638;
  if (!qword_33638)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_12314;
    v3[3] = &unk_28740;
    v3[4] = &v4;
    sub_12314((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_11904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_1191C()
{
  uint64_t v4 = 0;
  double v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_33648;
  uint64_t v7 = qword_33648;
  if (!qword_33648)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_124E0;
    v3[3] = &unk_28740;
    v3[4] = &v4;
    sub_124E0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_119E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_11F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_12314(uint64_t a1)
{
  sub_1236C();
  Class result = objc_getClass("CKUIBehavior");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_16600();
  }
  qword_33638 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1236C()
{
  v3[0] = 0;
  if (!qword_33640)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_1246C;
    v3[4] = &unk_28778;
    void v3[5] = v3;
    long long v4 = off_28948;
    uint64_t v5 = 0;
    qword_33640 = _sl_dlopen();
  }
  uint64_t v0 = qword_33640;
  id v1 = (void *)v3[0];
  if (!qword_33640)
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

uint64_t sub_1246C()
{
  uint64_t result = _sl_dlopen();
  qword_33640 = result;
  return result;
}

Class sub_124E0(uint64_t a1)
{
  sub_1236C();
  Class result = objc_getClass("CKBrowserDragManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_16628();
  }
  qword_33648 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_12538(uint64_t a1)
{
  double v2 = (void *)sub_1236C();
  Class result = dlsym(v2, "CKSetHandwritingShouldBeAutoDisplayed");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_33650 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_12ED0()
{
  qword_33658 = (uint64_t)objc_alloc_init((Class)objc_opt_class());

  return _objc_release_x1();
}

int64_t sub_132E8(id a1, HWHandwritingItem *a2, HWHandwritingItem *a3)
{
  long long v4 = a3;
  uint64_t v5 = [(HWHandwritingItem *)a2 creationDate];
  [v5 timeIntervalSinceReferenceDate];
  double v7 = v6;

  BOOL v8 = [(HWHandwritingItem *)v4 creationDate];

  [v8 timeIntervalSinceReferenceDate];
  double v10 = v9;

  if (v7 <= v10) {
    int64_t v11 = 0;
  }
  else {
    int64_t v11 = -1;
  }
  if (v7 < v10) {
    return 1;
  }
  else {
    return v11;
  }
}

void sub_13710(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = [*(id *)(*((void *)&v10 + 1) + 8 * (void)v7) payloadData];
        if (v8)
        {
          double v9 = +[HWEncoding decodeHandwritingFromData:v8];
          [*(id *)(a1 + 32) _addItem:v9 dataRepresentation:v8 persist:0];
        }
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

int64_t sub_14020(id a1, NSURL *a2, NSURL *a3)
{
  id v4 = a3;
  id v5 = [(NSURL *)a2 lastPathComponent];
  uint64_t v6 = [(NSURL *)v4 lastPathComponent];

  id v7 = [v5 compare:v6 options:1];
  return (int64_t)v7;
}

void sub_1471C(id a1)
{
  id v1 = objc_alloc_init((Class)NSOperationQueue);
  double v2 = (void *)qword_33668;
  qword_33668 = (uint64_t)v1;

  [(id)qword_33668 setQualityOfService:25];
  [(id)qword_33668 setMaxConcurrentOperationCount:-1];
  [(id)qword_33668 setName:@"Handwriting_Renderer_Queue"];
  id v3 = objc_alloc_init(HWSharedRenderQueueApplicationObserver);
  id v4 = (void *)qword_33670;
  qword_33670 = (uint64_t)v3;

  uint64_t v5 = qword_33668;
  uint64_t v6 = (void *)qword_33670;

  [v6 setOperationQueue:v5];
}

void sub_14C0C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 216), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_14C50(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_14C60(uint64_t a1)
{
}

uint64_t sub_14C68(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void sub_14C84(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) uuid];
  id v3 = [v2 UUIDString];
  NSLog(@"Creating %@ file at path at path %@", v3, *(void *)(a1 + 40));

  id v4 = +[UITraitCollection currentTraitCollection];
  if (*(unsigned char *)(a1 + 96)) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  uint64_t v6 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:v5];
  +[UITraitCollection setCurrentTraitCollection:v6];

  id v7 = [*(id *)(a1 + 32) drawing];
  +[DKInkThumbnailRenderer imageForDrawing:fittingInSize:color:highFidelity:](DKInkThumbnailRenderer, "imageForDrawing:fittingInSize:color:highFidelity:", v7, *(void *)(a1 + 48), *(unsigned __int8 *)(a1 + 97), *(double *)(a1 + 80), *(double *)(a1 + 88));
  BOOL v8 = (UIImage *)objc_claimAutoreleasedReturnValue();

  +[UITraitCollection setCurrentTraitCollection:v4];
  double v9 = UIImagePNGRepresentation(v8);
  if ([v9 writeToURL:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) atomically:1])objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)); {
  block[0] = _NSConcreteStackBlock;
  }
  block[1] = 3221225472;
  block[2] = sub_14E3C;
  block[3] = &unk_28A30;
  id v10 = *(id *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 72);
  id v13 = v10;
  uint64_t v14 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_14E3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

uint64_t sub_14E64(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  }
  return result;
}

void sub_1588C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_158B4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained cleanupAfterAnimation];
}

void sub_159EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15A10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _teardownInkView];
  [WeakRetained setNeedsLayout];
}

void sub_15CA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_15CC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = +[UITraitCollection currentTraitCollection];
    id v4 = +[UITraitCollection traitCollectionWithUserInterfaceStyle:*(void *)(a1 + 56)];
    +[UITraitCollection setCurrentTraitCollection:v4];

    uint64_t v5 = [WeakRetained handwriting];
    uint64_t v6 = [v5 drawing];
    id v7 = +[DKInkThumbnailRenderer imageForDrawing:fittingInSize:color:highFidelity:](DKInkThumbnailRenderer, "imageForDrawing:fittingInSize:color:highFidelity:", v6, *(void *)(a1 + 32), 1, *(double *)(a1 + 80), *(double *)(a1 + 88));

    +[UITraitCollection setCurrentTraitCollection:v3];
    if (v7) {
      [WeakRetained setCachedImage:v7];
    }
    else {
      objc_msgSend(WeakRetained, "setCachedSize:", *(double *)(a1 + 96), *(double *)(a1 + 104));
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_15E5C;
    block[3] = &unk_28AE0;
    id v11 = WeakRetained;
    id v8 = *(id *)(a1 + 40);
    id v12 = v7;
    id v13 = v8;
    id v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_15E5C(uint64_t a1)
{
  [*(id *)(a1 + 32) setNeedsDisplay];
  uint64_t v2 = [*(id *)(a1 + 32) cachedImage];
  id v3 = [*(id *)(a1 + 32) imageView];
  [v3 setImage:v2];

  id v4 = [*(id *)(a1 + 32) imageView];
  [v4 setContentMode:4];

  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(void))(v5 + 16))();
  }
  uint64_t v6 = *(void *)(a1 + 40);
  if (v6)
  {
    CFStringRef v9 = @"CKTranscriptPluginViewSnapshotUserInfoKey";
    uint64_t v10 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 postNotificationName:@"CKTranscriptPluginViewReadyForSnapshotNotification" object:*(void *)(a1 + 32) userInfo:v7];
}

uint64_t sub_16534(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_165B4()
{
  uint64_t v0 = abort_report_np();
  sub_165DC(v0);
}

void sub_165DC()
{
}

void sub_16600()
{
  uint64_t v0 = abort_report_np();
  sub_16628(v0);
}

void sub_16628()
{
  abort_report_np();
  CGAffineTransformMakeScale(v0, v1, v2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
}

void CGContextFillRect(CGContextRef c, CGRect rect)
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

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
}

BOOL CGPointMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGPoint *point)
{
  return _CGPointMakeWithDictionaryRepresentation(dict, point);
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

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return _CGRectIntersectsRect(rect1, rect2);
}

uint64_t DKDrawingIsValid()
{
  return _DKDrawingIsValid();
}

uint64_t DKIsDarkMode()
{
  return _DKIsDarkMode();
}

uint64_t IMSharedHelperMD5OfData()
{
  return _IMSharedHelperMD5OfData();
}

void NSLog(NSString *format, ...)
{
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SBSSetInterceptsMenuButton()
{
  return _SBSSetInterceptsMenuButton();
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return _UIImageJPEGRepresentation(image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

uint64_t UIKeyboardGetGlobeKeyImage()
{
  return _UIKeyboardGetGlobeKeyImage();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return __NSDictionaryOfVariableBindings(commaSeparatedKeysString, firstValue);
}

uint64_t _UIContentSizeCategoryIsAccessibilityContentSizeCategory()
{
  return __UIContentSizeCategoryIsAccessibilityContentSizeCategory();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

uint32_t arc4random(void)
{
  return _arc4random();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void free(void *a1)
{
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
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

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return [a1 CGImage];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__advancePageLeftButtonShouldBeVisible(void *a1, const char *a2, ...)
{
  return [a1 _advancePageLeftButtonShouldBeVisible];
}

id objc_msgSend__advancePageRightButtonShouldBeVisible(void *a1, const char *a2, ...)
{
  return [a1 _advancePageRightButtonShouldBeVisible];
}

id objc_msgSend__backdropStyleForCurrentDevice(void *a1, const char *a2, ...)
{
  return [a1 _backdropStyleForCurrentDevice];
}

id objc_msgSend__backgroundColor(void *a1, const char *a2, ...)
{
  return [a1 _backgroundColor];
}

id objc_msgSend__canvasSize(void *a1, const char *a2, ...)
{
  return [a1 _canvasSize];
}

id objc_msgSend__commonInit(void *a1, const char *a2, ...)
{
  return [a1 _commonInit];
}

id objc_msgSend__configureLayoutToiPadLandscape(void *a1, const char *a2, ...)
{
  return [a1 _configureLayoutToiPadLandscape];
}

id objc_msgSend__configureLayoutToiPadPortrait(void *a1, const char *a2, ...)
{
  return [a1 _configureLayoutToiPadPortrait];
}

id objc_msgSend__createAdvancePageLeftButton(void *a1, const char *a2, ...)
{
  return [a1 _createAdvancePageLeftButton];
}

id objc_msgSend__createAdvancePageRightButton(void *a1, const char *a2, ...)
{
  return [a1 _createAdvancePageRightButton];
}

id objc_msgSend__currentKeyboardIsRTL(void *a1, const char *a2, ...)
{
  return [a1 _currentKeyboardIsRTL];
}

id objc_msgSend__defaultsLoaded(void *a1, const char *a2, ...)
{
  return [a1 _defaultsLoaded];
}

id objc_msgSend__deviceOrientationPortrait(void *a1, const char *a2, ...)
{
  return [a1 _deviceOrientationPortrait];
}

id objc_msgSend__graphicsQuality(void *a1, const char *a2, ...)
{
  return [a1 _graphicsQuality];
}

id objc_msgSend__handwritingItemFromCurrentState(void *a1, const char *a2, ...)
{
  return [a1 _handwritingItemFromCurrentState];
}

id objc_msgSend__inkColor(void *a1, const char *a2, ...)
{
  return [a1 _inkColor];
}

id objc_msgSend__jitterPositionAnimation(void *a1, const char *a2, ...)
{
  return [a1 _jitterPositionAnimation];
}

id objc_msgSend__jitterTransformAnimation(void *a1, const char *a2, ...)
{
  return [a1 _jitterTransformAnimation];
}

id objc_msgSend__lazySetupGLInkView(void *a1, const char *a2, ...)
{
  return [a1 _lazySetupGLInkView];
}

id objc_msgSend__loadDefaultItems(void *a1, const char *a2, ...)
{
  return [a1 _loadDefaultItems];
}

id objc_msgSend__loadDrawingFromResumablePayload(void *a1, const char *a2, ...)
{
  return [a1 _loadDrawingFromResumablePayload];
}

id objc_msgSend__loadStoredItems(void *a1, const char *a2, ...)
{
  return [a1 _loadStoredItems];
}

id objc_msgSend__loadTypingIndicatorFile(void *a1, const char *a2, ...)
{
  return [a1 _loadTypingIndicatorFile];
}

id objc_msgSend__notifyChanges(void *a1, const char *a2, ...)
{
  return [a1 _notifyChanges];
}

id objc_msgSend__scrollToVisibleRegion(void *a1, const char *a2, ...)
{
  return [a1 _scrollToVisibleRegion];
}

id objc_msgSend__sendHandwritingMessage(void *a1, const char *a2, ...)
{
  return [a1 _sendHandwritingMessage];
}

id objc_msgSend__sendTypingIndicator(void *a1, const char *a2, ...)
{
  return [a1 _sendTypingIndicator];
}

id objc_msgSend__sharedRenderQueue(void *a1, const char *a2, ...)
{
  return [a1 _sharedRenderQueue];
}

id objc_msgSend__sortItems(void *a1, const char *a2, ...)
{
  return [a1 _sortItems];
}

id objc_msgSend__swipePageHintTextShouldBeVisible(void *a1, const char *a2, ...)
{
  return [a1 _swipePageHintTextShouldBeVisible];
}

id objc_msgSend__synchronizeHandwritingToDefaults(void *a1, const char *a2, ...)
{
  return [a1 _synchronizeHandwritingToDefaults];
}

id objc_msgSend__teardownInkView(void *a1, const char *a2, ...)
{
  return [a1 _teardownInkView];
}

id objc_msgSend__updateBackgroundView(void *a1, const char *a2, ...)
{
  return [a1 _updateBackgroundView];
}

id objc_msgSend__updateCanvasSize(void *a1, const char *a2, ...)
{
  return [a1 _updateCanvasSize];
}

id objc_msgSend__updateClearButton(void *a1, const char *a2, ...)
{
  return [a1 _updateClearButton];
}

id objc_msgSend__updateCoronaColors(void *a1, const char *a2, ...)
{
  return [a1 _updateCoronaColors];
}

id objc_msgSend__updateLayoutForKeboardInterfaceOrientaion(void *a1, const char *a2, ...)
{
  return [a1 _updateLayoutForKeboardInterfaceOrientaion];
}

id objc_msgSend__updateUserInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 _updateUserInterfaceStyle];
}

id objc_msgSend__visibleInkRegionInView(void *a1, const char *a2, ...)
{
  return [a1 _visibleInkRegionInView];
}

id objc_msgSend_advancePageButtonEnabledColor(void *a1, const char *a2, ...)
{
  return [a1 advancePageButtonEnabledColor];
}

id objc_msgSend_advanceToNextInputMode(void *a1, const char *a2, ...)
{
  return [a1 advanceToNextInputMode];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allTargets(void *a1, const char *a2, ...)
{
  return [a1 allTargets];
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return [a1 alpha];
}

id objc_msgSend_animation(void *a1, const char *a2, ...)
{
  return [a1 animation];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_balloonController(void *a1, const char *a2, ...)
{
  return [a1 balloonController];
}

id objc_msgSend_balloonPlugin(void *a1, const char *a2, ...)
{
  return [a1 balloonPlugin];
}

id objc_msgSend_balloonPluginDatasource(void *a1, const char *a2, ...)
{
  return [a1 balloonPluginDatasource];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_borderView(void *a1, const char *a2, ...)
{
  return [a1 borderView];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bottomStackView(void *a1, const char *a2, ...)
{
  return [a1 bottomStackView];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_browserBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 browserBackgroundColor];
}

id objc_msgSend_browserPresentationStyle(void *a1, const char *a2, ...)
{
  return [a1 browserPresentationStyle];
}

id objc_msgSend_browserSwitcherExpandThreshold(void *a1, const char *a2, ...)
{
  return [a1 browserSwitcherExpandThreshold];
}

id objc_msgSend_buttonYMargin(void *a1, const char *a2, ...)
{
  return [a1 buttonYMargin];
}

id objc_msgSend_cachedImage(void *a1, const char *a2, ...)
{
  return [a1 cachedImage];
}

id objc_msgSend_canUndo(void *a1, const char *a2, ...)
{
  return [a1 canUndo];
}

id objc_msgSend_cancelPlayback(void *a1, const char *a2, ...)
{
  return [a1 cancelPlayback];
}

id objc_msgSend_canvasHasInk(void *a1, const char *a2, ...)
{
  return [a1 canvasHasInk];
}

id objc_msgSend_canvasView(void *a1, const char *a2, ...)
{
  return [a1 canvasView];
}

id objc_msgSend_cellSize(void *a1, const char *a2, ...)
{
  return [a1 cellSize];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_cleanupAfterAnimation(void *a1, const char *a2, ...)
{
  return [a1 cleanupAfterAnimation];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_clearThumbnailCache(void *a1, const char *a2, ...)
{
  return [a1 clearThumbnailCache];
}

id objc_msgSend_collectionView(void *a1, const char *a2, ...)
{
  return [a1 collectionView];
}

id objc_msgSend_collectionViewLayout(void *a1, const char *a2, ...)
{
  return [a1 collectionViewLayout];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_contentOffset(void *a1, const char *a2, ...)
{
  return [a1 contentOffset];
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return [a1 contentSize];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_countOfCurrentStroke(void *a1, const char *a2, ...)
{
  return [a1 countOfCurrentStroke];
}

id objc_msgSend_creationDate(void *a1, const char *a2, ...)
{
  return [a1 creationDate];
}

id objc_msgSend_currentBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 currentBackgroundColor];
}

id objc_msgSend_currentBrowserConsumer(void *a1, const char *a2, ...)
{
  return [a1 currentBrowserConsumer];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentDrawing(void *a1, const char *a2, ...)
{
  return [a1 currentDrawing];
}

id objc_msgSend_currentHandwritingItem(void *a1, const char *a2, ...)
{
  return [a1 currentHandwritingItem];
}

id objc_msgSend_currentInputMode(void *a1, const char *a2, ...)
{
  return [a1 currentInputMode];
}

id objc_msgSend_currentLayoutSize(void *a1, const char *a2, ...)
{
  return [a1 currentLayoutSize];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return [a1 currentTraitCollection];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_dataSource(void *a1, const char *a2, ...)
{
  return [a1 dataSource];
}

id objc_msgSend_datasourceIsFromMe(void *a1, const char *a2, ...)
{
  return [a1 datasourceIsFromMe];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_defaultQueue(void *a1, const char *a2, ...)
{
  return [a1 defaultQueue];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_deleteButton(void *a1, const char *a2, ...)
{
  return [a1 deleteButton];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disabledButtonColor(void *a1, const char *a2, ...)
{
  return [a1 disabledButtonColor];
}

id objc_msgSend_dragControllerTranscriptDelegate(void *a1, const char *a2, ...)
{
  return [a1 dragControllerTranscriptDelegate];
}

id objc_msgSend_drawing(void *a1, const char *a2, ...)
{
  return [a1 drawing];
}

id objc_msgSend_drawingCanvasBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 drawingCanvasBackgroundColor];
}

id objc_msgSend_editing(void *a1, const char *a2, ...)
{
  return [a1 editing];
}

id objc_msgSend_effectiveUserInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 effectiveUserInterfaceLayoutDirection];
}

id objc_msgSend_enabledButtonColor(void *a1, const char *a2, ...)
{
  return [a1 enabledButtonColor];
}

id objc_msgSend_fallbackInkColor(void *a1, const char *a2, ...)
{
  return [a1 fallbackInkColor];
}

id objc_msgSend_favoritesGlobeButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 favoritesGlobeButtonTintColor];
}

id objc_msgSend_favoritesLabelColor(void *a1, const char *a2, ...)
{
  return [a1 favoritesLabelColor];
}

id objc_msgSend_favoritesPickerBorderColor(void *a1, const char *a2, ...)
{
  return [a1 favoritesPickerBorderColor];
}

id objc_msgSend_favoritesPickerItemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 favoritesPickerItemBackgroundColor];
}

id objc_msgSend_favoritesPickerItemBorderColor(void *a1, const char *a2, ...)
{
  return [a1 favoritesPickerItemBorderColor];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_gestureRecognizers(void *a1, const char *a2, ...)
{
  return [a1 gestureRecognizers];
}

id objc_msgSend_gpuAvailable(void *a1, const char *a2, ...)
{
  return [a1 gpuAvailable];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_handwriting(void *a1, const char *a2, ...)
{
  return [a1 handwriting];
}

id objc_msgSend_handwritingBrowserBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 handwritingBrowserBackgroundColor];
}

id objc_msgSend_handwritingFromPayload(void *a1, const char *a2, ...)
{
  return [a1 handwritingFromPayload];
}

id objc_msgSend_handwritingIsDisplayed(void *a1, const char *a2, ...)
{
  return [a1 handwritingIsDisplayed];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_highlightOverlayView(void *a1, const char *a2, ...)
{
  return [a1 highlightOverlayView];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_image(void *a1, const char *a2, ...)
{
  return [a1 image];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return [a1 imageView];
}

id objc_msgSend_inCompactPresentation(void *a1, const char *a2, ...)
{
  return [a1 inCompactPresentation];
}

id objc_msgSend_inkBounds(void *a1, const char *a2, ...)
{
  return [a1 inkBounds];
}

id objc_msgSend_inkColor(void *a1, const char *a2, ...)
{
  return [a1 inkColor];
}

id objc_msgSend_inkView(void *a1, const char *a2, ...)
{
  return [a1 inkView];
}

id objc_msgSend_inkViewMargin(void *a1, const char *a2, ...)
{
  return [a1 inkViewMargin];
}

id objc_msgSend_isDefaultRightToLeft(void *a1, const char *a2, ...)
{
  return [a1 isDefaultRightToLeft];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isExtensionInputMode(void *a1, const char *a2, ...)
{
  return [a1 isExtensionInputMode];
}

id objc_msgSend_isFromMe(void *a1, const char *a2, ...)
{
  return [a1 isFromMe];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return [a1 isHidden];
}

id objc_msgSend_isLast(void *a1, const char *a2, ...)
{
  return [a1 isLast];
}

id objc_msgSend_isPlayed(void *a1, const char *a2, ...)
{
  return [a1 isPlayed];
}

id objc_msgSend_isTracking(void *a1, const char *a2, ...)
{
  return [a1 isTracking];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_keyboardButtonTintColor(void *a1, const char *a2, ...)
{
  return [a1 keyboardButtonTintColor];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_leftAnchor(void *a1, const char *a2, ...)
{
  return [a1 leftAnchor];
}

id objc_msgSend_leftShadow(void *a1, const char *a2, ...)
{
  return [a1 leftShadow];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lineSpacing(void *a1, const char *a2, ...)
{
  return [a1 lineSpacing];
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return [a1 localizations];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_markAsPlayed(void *a1, const char *a2, ...)
{
  return [a1 markAsPlayed];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_operationQueue(void *a1, const char *a2, ...)
{
  return [a1 operationQueue];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return [a1 orderedSet];
}

id objc_msgSend_panGestureRecognizer(void *a1, const char *a2, ...)
{
  return [a1 panGestureRecognizer];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_pauseRendering(void *a1, const char *a2, ...)
{
  return [a1 pauseRendering];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_payloadData(void *a1, const char *a2, ...)
{
  return [a1 payloadData];
}

id objc_msgSend_payloadInShelf(void *a1, const char *a2, ...)
{
  return [a1 payloadInShelf];
}

id objc_msgSend_pluginContentView(void *a1, const char *a2, ...)
{
  return [a1 pluginContentView];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return [a1 position];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_presentationViewController(void *a1, const char *a2, ...)
{
  return [a1 presentationViewController];
}

id objc_msgSend_primaryLanguage(void *a1, const char *a2, ...)
{
  return [a1 primaryLanguage];
}

id objc_msgSend_recentsDomain(void *a1, const char *a2, ...)
{
  return [a1 recentsDomain];
}

id objc_msgSend_recentsPicker(void *a1, const char *a2, ...)
{
  return [a1 recentsPicker];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_reloadStoredItems(void *a1, const char *a2, ...)
{
  return [a1 reloadStoredItems];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperlayer(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperlayer];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_repeatCount(void *a1, const char *a2, ...)
{
  return [a1 repeatCount];
}

id objc_msgSend_repeatingAction(void *a1, const char *a2, ...)
{
  return [a1 repeatingAction];
}

id objc_msgSend_resetScrollPosition(void *a1, const char *a2, ...)
{
  return [a1 resetScrollPosition];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_resumablePayload(void *a1, const char *a2, ...)
{
  return [a1 resumablePayload];
}

id objc_msgSend_resumeRendering(void *a1, const char *a2, ...)
{
  return [a1 resumeRendering];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return [a1 rightAnchor];
}

id objc_msgSend_rightShadow(void *a1, const char *a2, ...)
{
  return [a1 rightShadow];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return [a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_selectionHandler(void *a1, const char *a2, ...)
{
  return [a1 selectionHandler];
}

id objc_msgSend_semanticContentAttribute(void *a1, const char *a2, ...)
{
  return [a1 semanticContentAttribute];
}

id objc_msgSend_sendDelegate(void *a1, const char *a2, ...)
{
  return [a1 sendDelegate];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return [a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedBehaviors(void *a1, const char *a2, ...)
{
  return [a1 sharedBehaviors];
}

id objc_msgSend_sharedInputModeController(void *a1, const char *a2, ...)
{
  return [a1 sharedInputModeController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_shouldAnimate(void *a1, const char *a2, ...)
{
  return [a1 shouldAnimate];
}

id objc_msgSend_shouldHideAppSwitcher(void *a1, const char *a2, ...)
{
  return [a1 shouldHideAppSwitcher];
}

id objc_msgSend_shouldPresentModally(void *a1, const char *a2, ...)
{
  return [a1 shouldPresentModally];
}

id objc_msgSend_shouldShowShadows(void *a1, const char *a2, ...)
{
  return [a1 shouldShowShadows];
}

id objc_msgSend_showShadows(void *a1, const char *a2, ...)
{
  return [a1 showShadows];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_snapshotRendererState(void *a1, const char *a2, ...)
{
  return [a1 snapshotRendererState];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_strokeUndoManager(void *a1, const char *a2, ...)
{
  return [a1 strokeUndoManager];
}

id objc_msgSend_strokesFrame(void *a1, const char *a2, ...)
{
  return [a1 strokesFrame];
}

id objc_msgSend_sublayers(void *a1, const char *a2, ...)
{
  return [a1 sublayers];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_teardown(void *a1, const char *a2, ...)
{
  return [a1 teardown];
}

id objc_msgSend_theme(void *a1, const char *a2, ...)
{
  return [a1 theme];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return [a1 tintColor];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topBarHeight(void *a1, const char *a2, ...)
{
  return [a1 topBarHeight];
}

id objc_msgSend_topBarSpacing(void *a1, const char *a2, ...)
{
  return [a1 topBarSpacing];
}

id objc_msgSend_totalPoints(void *a1, const char *a2, ...)
{
  return [a1 totalPoints];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_undoLastStroke(void *a1, const char *a2, ...)
{
  return [a1 undoLastStroke];
}

id objc_msgSend_updateImage(void *a1, const char *a2, ...)
{
  return [a1 updateImage];
}

id objc_msgSend_updateShadowVisiblity(void *a1, const char *a2, ...)
{
  return [a1 updateShadowVisiblity];
}

id objc_msgSend_updateVisibility(void *a1, const char *a2, ...)
{
  return [a1 updateVisibility];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceStyle];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return [a1 uuidString];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_visibleCells(void *a1, const char *a2, ...)
{
  return [a1 visibleCells];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}

id objc_msgSend_writeToURL_options_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:options:error:");
}