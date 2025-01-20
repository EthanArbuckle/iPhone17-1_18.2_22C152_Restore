void sub_100004828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100004914(id a1, NSError *a2)
{
  v2 = a2;
  v3 = sub_10000A660();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000A750((uint64_t)v2, v3);
  }
}

void sub_100004B54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_100004B6C(id a1, _UIStickerRepresentation *a2, unint64_t a3, BOOL *a4)
{
  v4 = [(_UIStickerRepresentation *)a2 role];
  unsigned __int8 v5 = [v4 isEqualToString:@"com.apple.stickers.role.still"];

  return v5;
}

uint64_t sub_100004BB0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004BC0(uint64_t a1)
{
}

uint64_t sub_100004BC8(uint64_t a1, void *a2)
{
  v3 = [a2 __ck_heicsImageData];
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setData:v3];

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

void sub_100004FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_100004FFC(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _remoteProxy];
  [v4 stageSticker:v3];
}

void *sub_10000505C(void *result, int a2)
{
  if (a2)
  {
    v2 = result;
    id v3 = sub_10000A660();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = v2[4];
      *(_DWORD *)buf = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Donating sticker to recents with identifier %@", buf, 0xCu);
    }

    return [sub_100005124() donateStickerToRecentsWithIdentifier:v2[4] representations:v2[5] stickerEffectType:v2[11] externalURI:v2[6] name:v2[7] accessibilityLabel:v2[8] metadata:v2[9] ckAttributionInfo:v2[10]];
  }
  return result;
}

id sub_100005124()
{
  uint64_t v4 = 0;
  unsigned __int8 v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100016730;
  uint64_t v7 = qword_100016730;
  if (!qword_100016730)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000617C;
    v3[3] = &unk_100010560;
    v3[4] = &v4;
    sub_10000617C((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_1000051F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000052B8(id a1)
{
  qword_1000166F0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIStickerPickerHostProtocol];

  _objc_release_x1();
}

void sub_100005354(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIStickerPickerServiceProtocol];
  v2 = (void *)qword_100016700;
  qword_100016700 = v1;

  id v3 = (void *)qword_100016700;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"setHostBundleID:" argumentIndex:0 ofReply:0];
}

int64_t sub_100005910(id a1, STKStickerRepresentation *a2, STKStickerRepresentation *a3)
{
  id v4 = a2;
  unsigned __int8 v5 = a3;
  if ([(STKStickerRepresentation *)v4 isPreferred]
    && ([(STKStickerRepresentation *)v5 isPreferred] & 1) != 0)
  {
    int64_t v6 = 0;
  }
  else if ([(STKStickerRepresentation *)v4 isPreferred])
  {
    int64_t v6 = -1;
  }
  else
  {
    int64_t v6 = [(STKStickerRepresentation *)v5 isPreferred];
  }

  return v6;
}

void sub_100005DB4(uint64_t a1, int a2)
{
  if (a2) {
    [sub_100005124() donateStickerToRecents:*(void *)(a1 + 32)];
  }
  if ([(id)qword_100016718 isEqual:*(void *)(a1 + 40)])
  {
    id v3 = (void *)qword_100016710;
    qword_100016710 = 0;

    id v4 = (void *)qword_100016718;
    qword_100016718 = 0;
  }
}

Class sub_100005FC4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016728)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100006108;
    v4[4] = &unk_100010598;
    v4[5] = v4;
    long long v5 = off_100010580;
    uint64_t v6 = 0;
    qword_100016728 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100016728)
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
    Class result = objc_getClass("STKStickerKeyboardRecentCollectionViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_10000A898();
LABEL_8:
    free(v2);
  }
  qword_100016720 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006108()
{
  uint64_t result = _sl_dlopen();
  qword_100016728 = result;
  return result;
}

Class sub_10000617C(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016738)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000062C0;
    v4[4] = &unk_100010598;
    v4[5] = v4;
    long long v5 = off_1000105B8;
    uint64_t v6 = 0;
    qword_100016738 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100016738)
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
    Class result = objc_getClass("CKChatController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_10000A8C0();
LABEL_8:
    free(v2);
  }
  qword_100016730 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000062C0()
{
  uint64_t result = _sl_dlopen();
  qword_100016738 = result;
  return result;
}

Class sub_100006334(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016748)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100006478;
    v4[4] = &unk_100010598;
    v4[5] = v4;
    long long v5 = off_1000105D0;
    uint64_t v6 = 0;
    qword_100016748 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100016748)
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
    Class result = objc_getClass("AVTUsageTracker");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_10000A8E8();
LABEL_8:
    free(v2);
  }
  qword_100016740 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100006478()
{
  uint64_t result = _sl_dlopen();
  qword_100016748 = result;
  return result;
}

void sub_1000064EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_100006768(uint64_t a1)
{
  return [*(id *)(a1 + 32) stickerPickerCardDidLoad];
}

void sub_100006840(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) appPresenter];
  [v1 updateAppFrameForRotation];
}

void sub_100006CF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006D18(uint64_t a1, int a2)
{
  if (a2)
  {
    id v3 = sub_10000A660();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [*(id *)(a1 + 32) stickerIdentifier];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Donating sticker to recents with identifier %@", (uint8_t *)&buf, 0xCu);
    }
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    long long v5 = (void *)qword_100016778;
    uint64_t v22 = qword_100016778;
    if (!qword_100016778)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v24 = sub_1000084D0;
      v25 = &unk_100010560;
      v26 = &v19;
      sub_1000084D0((uint64_t)&buf);
      long long v5 = (void *)v20[3];
    }
    id v6 = v5;
    _Block_object_dispose(&v19, 8);
    uint64_t v7 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v8 = a1 + 32;
    uint64_t v10 = *(void *)(v8 + 16);
    v11 = [v7 stickerEffectType];
    v12 = v11;
    if (!v11) {
      v11 = &off_100010A70;
    }
    signed int v13 = [v11 intValue];
    v14 = [*(id *)v8 externalURI];
    v15 = [*(id *)v8 stickerName];
    v16 = [*(id *)v8 accessibilityLabel];
    v17 = [*(id *)v8 metadata];
    v18 = [*(id *)v8 ckAttributionInfo];
    [v6 donateStickerToRecentsWithIdentifier:v9 representations:v10 stickerEffectType:v13 externalURI:v14 name:v15 accessibilityLabel:v16 metadata:v17 ckAttributionInfo:v18];
  }
}

void sub_100006F40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100007448(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  if (v11)
  {
    v12 = sub_10000A660();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10000A944(v11);
    }
  }
  v25.origin.x = a3;
  v25.origin.y = a4;
  v25.size.width = a5;
  v25.size.height = a6;
  if (!CGRectIsNull(v25))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v14 = [WeakRetained view];
    v15 = [*(id *)(a1 + 32) view];
    v16 = [v15 window];
    [v14 convertRect:v16 toCoordinateSpace:a3, a4, a5, a6];
    a3 = v17;
    a4 = v18;
    a5 = v19;
    a6 = v20;

    uint64_t v21 = sub_10000A660();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v26.origin.x = a3;
      v26.origin.y = a4;
      v26.size.width = a5;
      v26.size.height = a6;
      uint64_t v22 = NSStringFromCGRect(v26);
      int v23 = 138412290;
      v24 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Added sticker to %@", (uint8_t *)&v23, 0xCu);
    }
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a3, a4, a5, a6);
}

void sub_1000077C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000077DC(uint64_t a1, void *a2, void *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  id v13 = a2;
  id v14 = a3;
  if (v14)
  {
    v15 = sub_10000A660();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_10000A944(v14);
    }
  }
  v24.origin.x = a4;
  v24.origin.y = a5;
  v24.size.width = a6;
  v24.size.height = a7;
  if (!CGRectIsNull(v24))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v17 = [WeakRetained view];
    double v18 = [*(id *)(a1 + 32) view];
    double v19 = [v18 window];
    [v17 convertRect:v19 toCoordinateSpace:a4, a5, a6, a7];
    a4 = v20;
    a5 = v21;
    a6 = v22;
    a7 = v23;
  }
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(a4, a5, a6, a7);
}

void sub_100007AAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_10000A660();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000A944(v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007CAC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = sub_10000A660();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_10000A944(v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100007F88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007FFC(id a1)
{
  qword_100016758 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIStickerPickerHostProtocol];

  _objc_release_x1();
}

void sub_100008098(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIStickerPickerServiceProtocol];
  v2 = (void *)qword_100016768;
  qword_100016768 = v1;

  id v3 = (void *)qword_100016768;
  uint64_t v4 = objc_opt_class();
  id v5 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v4, objc_opt_class(), 0);
  [v3 setClasses:v5 forSelector:"addStickerToStoreWithRepresentations:completionHandler:" argumentIndex:0 ofReply:0];

  id v6 = (void *)qword_100016768;
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  [v6 setClasses:v9 forSelector:"addStickerToStoreWithRepresentations:completionWithStickerIDs:" argumentIndex:0 ofReply:0];

  uint64_t v10 = (void *)qword_100016768;
  uint64_t v11 = objc_opt_class();
  v12 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v11, objc_opt_class(), 0);
  [v10 setClasses:v12 forSelector:"addStickerToStoreWithRepresentations:completionWithStickerIDs:" argumentIndex:1 ofReply:1];

  id v13 = (void *)qword_100016768;
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, v15, objc_opt_class(), 0);
  [v13 setClasses:v16 forSelector:"addStickerToStoreWithRepresentations:sourceRect:completion:" argumentIndex:0 ofReply:0];

  double v17 = (void *)qword_100016768;
  uint64_t v18 = objc_opt_class();
  double v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
  [v17 setClasses:v19 forSelector:"addStickerToStoreWithRepresentations:sourceRect:completion:" argumentIndex:0 ofReply:1];

  double v20 = (void *)qword_100016768;
  uint64_t v21 = objc_opt_class();
  uint64_t v22 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  CGRect v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, v22, v23, v24, objc_opt_class(), 0);
  [v20 setClasses:v25 forSelector:"animatedStickerCreationProgressChanged:progress:" argumentIndex:0 ofReply:0];

  CGRect v26 = (void *)qword_100016768;
  id v27 = +[NSSet setWithObject:objc_opt_class()];
  [v26 setClasses:v27 forSelector:"setHostBundleID:" argumentIndex:0 ofReply:0];
}

void sub_1000084D0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("CKChatController");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100016778 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000A8C0();
    sub_100008528();
  }
}

void sub_100008528()
{
  v1[0] = 0;
  if (!qword_100016780)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100008624;
    v1[4] = &unk_100010598;
    v1[5] = v1;
    long long v2 = off_100010718;
    uint64_t v3 = 0;
    qword_100016780 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100016780)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100008624()
{
  uint64_t result = _sl_dlopen();
  qword_100016780 = result;
  return result;
}

Class sub_100008698(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016790)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000087DC;
    v4[4] = &unk_100010598;
    v4[5] = v4;
    long long v5 = off_100010730;
    uint64_t v6 = 0;
    qword_100016790 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_100016790)
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
    Class result = objc_getClass("AVTUsageTracker");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_10000A8E8();
LABEL_8:
    free(v2);
  }
  qword_100016788 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000087DC()
{
  uint64_t result = _sl_dlopen();
  qword_100016790 = result;
  return result;
}

Class sub_100008850(uint64_t a1)
{
  sub_100008528();
  Class result = objc_getClass("CKPluginExtensionStateObserver");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000A9C8();
  }
  qword_100016798 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1000088A8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t sub_100008A80(uint64_t a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  uint64_t v4 = state64;
  int v5 = state64 != 0;
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v6 + 28) != v5)
  {
    *(unsigned char *)(v6 + 28) = v5;
    uint64_t result = SBSGetScreenLockStatus();
    if (v4) {
      return (uint64_t)[*(id *)(a1 + 32) _didBecomeLocked];
    }
  }
  return result;
}

void sub_100008BD0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) resume];
  uint64_t v1 = sub_10000A660();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Listening", v2, 2u);
  }
}

void sub_100008E44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  _Unwind_Resume(a1);
}

void sub_100008E7C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = sub_10000A660();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Source connection interrupted from PID %d", (uint8_t *)v3, 8u);
  }

  [WeakRetained invalidate];
}

void sub_100008F3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  long long v2 = sub_10000A660();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Source connection invalidated from PID %d", (uint8_t *)v3, 8u);
  }
}

uint64_t start(int a1, char **a2)
{
  int v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  uint64_t v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_10000944C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) appPresenter];
  [v1 updateAppFrameForRotation];
}

void sub_100009664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000098B4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100009938(id a1)
{
  qword_1000167A8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UIKeyboardMediaHostProtocol];

  _objc_release_x1();
}

void sub_1000099D4(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIKeyboardMediaServiceProtocol];
  long long v2 = (void *)qword_1000167B8;
  qword_1000167B8 = v1;

  uint64_t v3 = (void *)qword_1000167B8;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"setHostBundleID:" argumentIndex:0 ofReply:0];
}

Class sub_100009B08(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000167D0)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100009C4C;
    v4[4] = &unk_100010598;
    v4[5] = v4;
    long long v5 = off_100010800;
    uint64_t v6 = 0;
    qword_1000167D0 = _sl_dlopen();
    long long v2 = (void *)v4[0];
    if (!qword_1000167D0)
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
    Class result = objc_getClass("AVTUsageTracker");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    long long v2 = (void *)sub_10000A8E8();
LABEL_8:
    free(v2);
  }
  qword_1000167C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100009C4C()
{
  uint64_t result = _sl_dlopen();
  qword_1000167D0 = result;
  return result;
}

void sub_100009F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A1DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000A2A4(id a1)
{
  qword_1000167D8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___UIKeyboardMediaHostProtocol];

  _objc_release_x1();
}

void sub_10000A340(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CKUIKeyboardMediaServiceProtocol];
  long long v2 = (void *)qword_1000167E8;
  qword_1000167E8 = v1;

  uint64_t v3 = (void *)qword_1000167E8;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"setHostBundleID:" argumentIndex:0 ofReply:0];
}

Class sub_10000A3E8(uint64_t a1)
{
  sub_10000A440();
  Class result = objc_getClass("AVTStickerRecentsViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000A9F0();
  }
  qword_1000167F8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000A440()
{
  v1[0] = 0;
  if (!qword_100016800)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_10000A53C;
    v1[4] = &unk_100010598;
    v1[5] = v1;
    long long v2 = off_100010858;
    uint64_t v3 = 0;
    qword_100016800 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100016800)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_10000A53C()
{
  uint64_t result = _sl_dlopen();
  qword_100016800 = result;
  return result;
}

Class sub_10000A5B0(uint64_t a1)
{
  sub_10000A440();
  Class result = objc_getClass("AVTAvatarStore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000AA18();
  }
  qword_100016808 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_10000A608(uint64_t a1)
{
  sub_10000A440();
  Class result = objc_getClass("AVTUsageTracker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100016810 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000A8E8();
    return (Class)sub_10000A660();
  }
  return result;
}

id sub_10000A660()
{
  if (qword_100016820 != -1) {
    dispatch_once(&qword_100016820, &stru_100010870);
  }
  v0 = (void *)qword_100016818;

  return v0;
}

void sub_10000A6B4(id a1)
{
  qword_100016818 = (uint64_t)os_log_create("com.apple.Messages", "iMessageAppsViewService");

  _objc_release_x1();
}

void sub_10000A750(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote proxy error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A7C8()
{
  sub_100006508();
  sub_1000064EC((void *)&_mh_execute_header, v0, v1, "Expecting the sticker callback via _MSStickerSendManagerDelegate", v2, v3, v4, v5, v6);
}

void sub_10000A7FC()
{
  sub_100006508();
  sub_1000064EC((void *)&_mh_execute_header, v0, v1, "Can't create photos from inline recent stickers", v2, v3, v4, v5, v6);
}

void sub_10000A830()
{
  sub_100006508();
  sub_1000064EC((void *)&_mh_execute_header, v0, v1, "Can't present view controllers from inline recent stickers", v2, v3, v4, v5, v6);
}

void sub_10000A864()
{
  sub_100006508();
  sub_1000064EC((void *)&_mh_execute_header, v0, v1, "Inline recents doesn't support showBrowserForPluginIdentifier:style:completion", v2, v3, v4, v5, v6);
}

uint64_t sub_10000A898()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A8C0(v0);
}

uint64_t sub_10000A8C0()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A8E8(v0);
}

uint64_t sub_10000A8E8()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A910(v0);
}

void sub_10000A910()
{
  sub_100006508();
  sub_1000064EC((void *)&_mh_execute_header, v0, v1, "Unable to add sticker to store: missing remote stickers view", v2, v3, v4, v5, v6);
}

void sub_10000A944(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  sub_1000088C8();
  sub_1000088A8((void *)&_mh_execute_header, v2, v3, "Unable to add sticker to store: %@", v4, v5, v6, v7, v8);
}

void sub_10000A9C8()
{
  uint64_t v0 = abort_report_np();
  sub_10000A9F0(v0);
}

void sub_10000A9F0()
{
  uint64_t v0 = abort_report_np();
  sub_10000AA18(v0);
}

void sub_10000AA18()
{
  uint64_t v0 = (const void *)abort_report_np();
  CFRelease(v0);
}

void CFRelease(CFTypeRef cf)
{
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t IMBalloonExtensionIDWithSuffix()
{
  return _IMBalloonExtensionIDWithSuffix();
}

uint64_t IMIsStickersStripInCling()
{
  return _IMIsStickersStripInCling();
}

uint64_t IMStickersExtensionIdentifier()
{
  return _IMStickersExtensionIdentifier();
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
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

void exit(int a1)
{
}

void free(void *a1)
{
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__didBecomeLocked(void *a1, const char *a2, ...)
{
  return [a1 _didBecomeLocked];
}

id objc_msgSend__didRemoveStickerPreview(void *a1, const char *a2, ...)
{
  return [a1 _didRemoveStickerPreview];
}

id objc_msgSend__hostApplicationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 _hostApplicationBundleIdentifier];
}

id objc_msgSend__hostAuditToken(void *a1, const char *a2, ...)
{
  return [a1 _hostAuditToken];
}

id objc_msgSend__remoteProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteProxy];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accessibilityLabel(void *a1, const char *a2, ...)
{
  return [a1 accessibilityLabel];
}

id objc_msgSend_accessibilityName(void *a1, const char *a2, ...)
{
  return [a1 accessibilityName];
}

id objc_msgSend_adamID(void *a1, const char *a2, ...)
{
  return [a1 adamID];
}

id objc_msgSend_appPresenter(void *a1, const char *a2, ...)
{
  return [a1 appPresenter];
}

id objc_msgSend_attributionInfo(void *a1, const char *a2, ...)
{
  return [a1 attributionInfo];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_ckAttributionInfo(void *a1, const char *a2, ...)
{
  return [a1 ckAttributionInfo];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_compactHeight(void *a1, const char *a2, ...)
{
  return [a1 compactHeight];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAppViewController(void *a1, const char *a2, ...)
{
  return [a1 currentAppViewController];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentStickerViewController(void *a1, const char *a2, ...)
{
  return [a1 currentStickerViewController];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_disableAutomaticAppDiscovery(void *a1, const char *a2, ...)
{
  return [a1 disableAutomaticAppDiscovery];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_dismissCard(void *a1, const char *a2, ...)
{
  return [a1 dismissCard];
}

id objc_msgSend_effect(void *a1, const char *a2, ...)
{
  return [a1 effect];
}

id objc_msgSend_externalURI(void *a1, const char *a2, ...)
{
  return [a1 externalURI];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return [a1 fileURL];
}

id objc_msgSend_horizontalSizeClass(void *a1, const char *a2, ...)
{
  return [a1 horizontalSizeClass];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageFileURL(void *a1, const char *a2, ...)
{
  return [a1 imageFileURL];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isPreferred(void *a1, const char *a2, ...)
{
  return [a1 isPreferred];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return [a1 lastPathComponent];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return [a1 metadata];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_presentCard(void *a1, const char *a2, ...)
{
  return [a1 presentCard];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return [a1 processIdentifier];
}

id objc_msgSend_representations(void *a1, const char *a2, ...)
{
  return [a1 representations];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_screenCoordinate(void *a1, const char *a2, ...)
{
  return [a1 screenCoordinate];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_stickerDragActiveInCurrentProcess(void *a1, const char *a2, ...)
{
  return [a1 stickerDragActiveInCurrentProcess];
}

id objc_msgSend_stickerEffectType(void *a1, const char *a2, ...)
{
  return [a1 stickerEffectType];
}

id objc_msgSend_stickerIdentifier(void *a1, const char *a2, ...)
{
  return [a1 stickerIdentifier];
}

id objc_msgSend_stickerName(void *a1, const char *a2, ...)
{
  return [a1 stickerName];
}

id objc_msgSend_stickerPackGUID(void *a1, const char *a2, ...)
{
  return [a1 stickerPackGUID];
}

id objc_msgSend_stickerPickerCardDidLoad(void *a1, const char *a2, ...)
{
  return [a1 stickerPickerCardDidLoad];
}

id objc_msgSend_stickerRecentsController(void *a1, const char *a2, ...)
{
  return [a1 stickerRecentsController];
}

id objc_msgSend_stickersHostViewController(void *a1, const char *a2, ...)
{
  return [a1 stickersHostViewController];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_updateAppFrameForRotation(void *a1, const char *a2, ...)
{
  return [a1 updateAppFrameForRotation];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_uti(void *a1, const char *a2, ...)
{
  return [a1 uti];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}