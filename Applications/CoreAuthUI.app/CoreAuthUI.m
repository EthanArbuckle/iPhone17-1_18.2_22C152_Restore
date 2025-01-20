uint64_t sub_100005A28(unint64_t a1)
{
  int v1;
  NSObject *v3;

  v1 = a1;
  if (a1 < 3) {
    return qword_10006B8C0[a1];
  }
  v3 = LACLogFaceIDUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100060C2C(v1, v3);
  }

  return 0;
}

unint64_t sub_100005A90(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >= 3)
  {
    v2 = LACLogFaceIDUI();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_100060C2C(v1, v2);
    }

    return 0;
  }
  return v1;
}

void sub_1000064E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000064FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000650C(uint64_t a1)
{
}

id sub_100006514(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t sub_100006520(uint64_t a1)
{
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) removeFromSuperview];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v2();
}

id sub_100006A14(id *a1)
{
  id v2 = [a1[4] _lockStyleForPasscodeType:[a1[5] type]];
  if ([a1[6] rawValue]) {
    +[SBUIPasscodeLockViewFactory lightPasscodeLockViewForStyle:v2];
  }
  else {
  v3 = +[SBUIPasscodeLockViewFactory passcodeLockViewForStyle:v2];
  }

  return v3;
}

TouchIdAlertController *sub_100006CE4(uint64_t a1)
{
  if (*(void *)(a1 + 40) == LACBiometryTypeTouchID)
  {
    unint64_t v1 = objc_alloc_init(TouchIdAlertController);
    id v2 = +[NSBundle bundleForClass:objc_opt_class()];
    v3 = [v2 localizedStringForKey:@"TOUCH_ID_REQUIRED" value:&stru_100088CF0 table:@"MobileUI"];
    [(TouchIdAlertController *)v1 setTitle:v3];

    v4 = +[UIColor tertiaryLabelColor];
    v5 = [(TouchIdAlertController *)v1 _headerContentViewController];
    v6 = [v5 view];
    [v6 setTintColor:v4];
  }
  else
  {
    unint64_t v1 = objc_alloc_init(FaceIdAlertViewController);
    v7 = sub_100006E6C();
    [(TouchIdAlertController *)v1 setGlyph:v7];

    v4 = +[NSBundle bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"FACE_ID_REQUIRED" value:&stru_100088CF0 table:@"MobileUI"];
    [(TouchIdAlertController *)v1 setTitle:v5];
  }

  return v1;
}

id sub_100006E6C()
{
  id v0 = +[LAUIPearlGlyphStaticConfiguration createSystemApertureConfiguration];
  [v0 setInitialStyle:2];
  id v1 = [objc_alloc((Class)LAUIPearlGlyphView) initWithConfiguration:v0];

  return v1;
}

void sub_100006ED4(id a1, UIAlertAction *a2)
{
  id v2 = +[LACUIDTOUtilities dtoLearnMoreLinkURL];
  v3 = +[URLOpener sharedInstance];
  v4 = [v3 openURL:v2];

  if (v4)
  {
    v5 = LACLogUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100060CA4((uint64_t)v2, (uint64_t)v4, v5);
    }
  }
}

DTOBiometryAlertFactory *sub_100006F70()
{
  id v0 = objc_alloc_init(DTOBiometryAlertFactory);

  return v0;
}

id sub_1000070A4(uint64_t a1)
{
  id v2 = objc_opt_new();
  v3 = objc_opt_new();
  v4 = [v3 widthAnchor];
  v5 = [v4 constraintEqualToConstant:272.0];
  [v5 setActive:1];

  v6 = [v3 heightAnchor];
  v7 = [v6 constraintEqualToConstant:88.0];
  [v7 setActive:1];

  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v3 addSubview:WeakRetained];

  id v9 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v11 = [v10 topAnchor];
  v12 = [v3 topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12 constant:18.0];
  [v13 setActive:1];

  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v15 = [v14 bottomAnchor];
  v16 = [v3 bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  id v18 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v19 = [v18 centerXAnchor];
  v20 = [v3 centerXAnchor];
  v21 = [v19 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v23 = [v22 widthAnchor];
  v24 = [v23 constraintEqualToConstant:65.0];
  [v24 setActive:1];

  id v25 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  v26 = [v25 heightAnchor];
  v27 = [v26 constraintEqualToConstant:65.0];
  [v27 setActive:1];

  [v2 setView:v3];

  return v2;
}

id sub_100007698(uint64_t a1)
{
  id v2 = objc_opt_new();
  v3 = [*(id *)(a1 + 32) view];
  [v2 addObject:v3];

  if ([v2 count])
  {
    unsigned int v4 = 50;
    do
    {
      v5 = [v2 firstObject];
      [v2 removeObjectAtIndex:0];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = [v5 text];
        v7 = [*(id *)(a1 + 32) title];
        unsigned __int8 v8 = [v6 isEqualToString:v7];

        if (v8) {
          break;
        }
      }
      id v9 = [v5 subviews];
      [v2 addObjectsFromArray:v9];

      v5 = 0;
      if (![v2 count]) {
        break;
      }
    }
    while (v4-- > 1);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1000078E4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  v3 = [v2 superview];
  [v3 setAlpha:0.0];

  unsigned int v4 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  v5 = [*(id *)(a1 + 32) view];
  [v5 setBackgroundColor:v4];

  CGAffineTransformMakeScale(&v8, 0.88, 0.88);
  v6 = [*(id *)(a1 + 32) view];
  CGAffineTransform v7 = v8;
  [v6 setTransform:&v7];
}

id sub_1000079C4(uint64_t a1)
{
  CGAffineTransformMakeScale(&v5, 1.0, 1.0);
  id v2 = [*(id *)(a1 + 32) view];
  CGAffineTransform v4 = v5;
  [v2 setTransform:&v4];

  return [*(id *)(a1 + 32) dismissViewControllerAnimated:0 completion:*(void *)(a1 + 40)];
}

void sub_100008BF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008C1C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleToastPresented];
}

void sub_100008D78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained uiEvent:0 options:0];
}

void sub_100009164(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_10000918C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained setDismissingTemporarily:0];
    v3 = [v4 alertController];
    [v3 _setHeaderContentViewController:0];

    [v4 _presentAlertAnimated:0 specialUi:*(unsigned __int8 *)(a1 + 40)];
    id WeakRetained = v4;
  }
}

void sub_10000920C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentAlertAnimated:1 specialUi:*(unsigned __int8 *)(a1 + 40)];
}

void sub_1000098DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100009910(uint64_t a1)
{
  uint64_t v2 = LACLogFaceIDUI();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138543362;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Will dismiss %{public}@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) dismissWithDelay:&stru_100086120 completion:0.0];
}

uint64_t sub_1000099D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (([WeakRetained dismissingTemporarily] & 1) == 0)
    {
      uint64_t v2 = [v4 toastController];
      [v2 dismissWithDelay:&stru_100086140 completion:0.0];
    }
  }

  return _objc_release_x1();
}

void sub_100009A54(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = (void *)WeakRetained[33];
    if (v5)
    {
      uint64_t v6 = [WeakRetained presentedViewController];

      if (v5 != v6)
      {
        uint64_t v7 = v4[33];
        uint64_t v8 = *(unsigned __int8 *)(a1 + 40);
        v9[0] = _NSConcreteStackBlock;
        v9[1] = 3221225472;
        v9[2] = sub_100009B64;
        v9[3] = &unk_100086100;
        char v11 = *(unsigned char *)(a1 + 41);
        objc_copyWeak(&v10, v2);
        [v4 presentViewController:v7 animated:v8 completion:v9];
        objc_destroyWeak(&v10);
      }
    }
  }
}

void sub_100009B50(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009B64(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _shake:*(unsigned __int8 *)(a1 + 40)];
  }
}

void sub_10000AB68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  objc_destroyWeak(v50);
  objc_destroyWeak(location);
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose((const void *)(v51 - 160), 8);
  _Block_object_dispose(&a50, 8);
  _Block_object_dispose((const void *)(v51 - 232), 8);
  _Block_object_dispose((const void *)(v51 - 200), 8);
  objc_destroyWeak((id *)(v51 - 168));
  _Unwind_Resume(a1);
}

void sub_10000AC5C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 161) && *(unsigned char *)(v2 + 162) || *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v3 = [*(id *)(a1 + 40) objectForKeyedSubscript:&off_10008A240];
    id v4 = +[LAUtils truncateString:v3 maxLength:32];

    if (v4
      && (+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"), int v5 = objc_claimAutoreleasedReturnValue(), [v4 stringByTrimmingCharactersInSet:v5], v6 = objc_claimAutoreleasedReturnValue(), v4, v5, *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1, v6))
    {
      if ([v6 isEqualToString:@"Enter Passcode"])
      {
        uint64_t v7 = +[NSBundle bundleForClass:objc_opt_class()];
        uint64_t v8 = [v7 localizedStringForKey:@"ENTER_PASSCODE_ONLY" value:&stru_100088CF0 table:@"MobileUI"];

        *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
        uint64_t v6 = (void *)v8;
      }
    }
    else
    {
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v6 = [v9 localizedStringForKey:@"ENTER_PASSWORD" value:&stru_100088CF0 table:@"MobileUI"];
    }
    if ([v6 length])
    {
      id v10 = *(void **)(*(void *)(a1 + 32) + 264);
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_10000AEEC;
      v11[3] = &unk_1000861B0;
      v11[4] = *(void *)(a1 + 48);
      objc_copyWeak(&v12, (id *)(a1 + 88));
      [v10 _addActionWithTitle:v6 style:0 handler:v11 shouldDismissHandler:&stru_1000861F0];
      objc_destroyWeak(&v12);
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
    }
  }
}

void sub_10000AED8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000AEEC(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (v1) {
    [WeakRetained _uiCancelWithUnderlyingError];
  }
  else {
    [WeakRetained _enterPassword];
  }
}

BOOL sub_10000AF4C(id a1)
{
  return 0;
}

void sub_10000AF54(uint64_t a1)
{
  int v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained pearlUIState];

  if (v3 != (id)3)
  {
    id v4 = objc_loadWeakRetained(v1);
    [v4 setPearlUIState:3];

    id v5 = objc_loadWeakRetained(v1);
    [v5 uiEvent:6 options:0];
  }
}

BOOL sub_10000AFFC(id a1)
{
  return 0;
}

void sub_10000B004(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained uiCancelWithError:WeakRetained[21]];
    uint64_t v2 = +[LACUIDTOUtilities dtoLearnMoreLinkURL];
    [v3 uiOpenURL:v2];

    id WeakRetained = v3;
  }
}

void sub_10000B080(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*((void *)WeakRetained + 22) && *((unsigned char *)WeakRetained + 161))
    {
      id v3 = +[LAErrorHelper errorWithCode:-3 message:@"Fallback authentication mechanism selected."];
      [v4 uiFailureWithError:v3];
    }
    else if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      [WeakRetained _uiCancelWithUnderlyingError];
    }
    else
    {
      [WeakRetained uiCancel];
    }
    id WeakRetained = v4;
  }
}

BOOL sub_10000B144(id a1)
{
  return 0;
}

void sub_10000B6A8(uint64_t a1)
{
  int v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setGlyphState:3 animated:1];

  id v3 = objc_loadWeakRetained(v1);
  [v3 setSuspended:1];
}

id sub_10000BBDC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 192) setAnimating:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 208);

  return [v2 setAnimating:0];
}

void sub_10000BC38(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000BCB0;
  block[3] = &unk_100085F40;
  block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_10000BCB0(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePearlViews];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 192);

  return [v2 setAnimating:1];
}

void sub_10000C3DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_10000C3F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _destroyViewControllers];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10000C620(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_10000C64C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _destroyViewControllers];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_10000C6AC(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000C75C;
  v6[3] = &unk_100086320;
  id v5 = *(id *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [WeakRetained _dismissToastWithDelay:v6 completion:a2];
}

id sub_10000C75C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)FaceIdViewController;
  return [super dismissChildWithCompletionHandler:v1];
}

void sub_10000C950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000C96C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    (*(void (**)(double))(v2 + 16))(0.0);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setDismissingTemporarily:0];
}

void sub_10000DFA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, id *a14)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_10000DFF8(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 184), a2);
  id v4 = a2;
  [v4 setSecureTextEntry:1];
  [v4 setPlaceholder:*(void *)(a1 + 40)];
  [v4 setKeyboardAppearance:1];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 setDelegate:WeakRetained];
}

void sub_10000E090(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _cancel];
}

void sub_10000E0D0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _passwordEntered];
}

void sub_10000E110(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _passwordNext];
}

void sub_10000E150(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _passwordConfirm];
}

id sub_10000E190(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(*(void *)(a1 + 32) + 176) animated:1 completion:0];
}

id sub_10000E33C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureAndShowAlertController];
}

id sub_10000E4AC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _configureAndShowAlertController];
}

void sub_10000EA08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _presentUI:0];
}

void sub_10000F144(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_10000F180(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    if (WeakRetained[24]) {
      [WeakRetained _uiCancelWithUnderlyingError];
    }
    else {
      [WeakRetained uiFallback];
    }
    id WeakRetained = v2;
  }
}

void sub_10000F1E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _uiCancelWithUnderlyingError];
    uint64_t v2 = +[LACUIDTOUtilities dtoLearnMoreLinkURL];
    [v3 uiOpenURL:v2];

    id WeakRetained = v3;
  }
}

void sub_10000F254(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained uiCancel];
    id WeakRetained = v2;
  }
}

void sub_10000F298(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _uiCancelWithUnderlyingError];
    id WeakRetained = v2;
  }
}

id sub_10000FE78(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TouchIdViewController;
  return [super dismissChildWithCompletionHandler:v1];
}

id sub_1000101F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _configureUI];
}

id sub_1000104E4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 208);
  v3.receiver = *(id *)(a1 + 32);
  v3.super_class = (Class)TouchIdViewControllerWithCoachings;
  return [super _addFrontMostSubview:v1];
}

double sub_100010730(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) traitCollection];
  BOOL v2 = [v1 userInterfaceStyle] == (id)2;

  return fmin(fmax((0.75 - dbl_10006B9B0[v2]) / (1.0 - dbl_10006B9B0[v2]), 0.0), 1.0);
}

id sub_10001082C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 208) updateFrame];
  BOOL v2 = *(void **)(*(void *)(a1 + 32) + 208);

  return [v2 setAnimating:1];
}

uint64_t sub_100010890()
{
  if (qword_10009E268 != -1) {
    dispatch_once(&qword_10009E268, &stru_100086440);
  }
  return byte_10009E260;
}

void sub_1000108D4(id a1)
{
  if (MGIsQuestionValid())
  {
    byte_10009E260 = MGGetBoolAnswer();
  }
  else
  {
    uint64_t v1 = LACLogTouchIDUI();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
      sub_100060E40(v1);
    }
  }
}

id sub_100010940()
{
  if (qword_10009E268 != -1) {
    dispatch_once(&qword_10009E268, &stru_100086440);
  }
  if (byte_10009E260) {
    id v0 = &off_100085560;
  }
  else {
    id v0 = off_100085558;
  }
  id v1 = objc_alloc(*v0);

  return v1;
}

id sub_1000109B4(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  sub_100010940();
  id v13 = [(id)objc_claimAutoreleasedReturnValue() initWithInternalInfo:v12 mechanism:v11 backoffCounter:v10 remoteUIHost:v9 allowsLandscape:a5];

  return v13;
}

id sub_100010D54(uint64_t a1, void *a2)
{
  return _[a2 _cancelForApplicationChangeIfNeeded];
}

void sub_100010F38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100010F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_storeWeak(&qword_10009E270, 0);
    id v1 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_100011300(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_100011354(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetUI];
}

void sub_100011394(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetUI];

  uint64_t v2 = (void *)qword_10009E278;
  qword_10009E278 = 0;
}

void sub_1000113E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = LALogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100061088();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _resetUI];
}

void sub_100011458(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), a2);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 88), a3);
  }
  else
  {
    id v11 = LALogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000610F0();
    }

    [*(id *)(a1 + 32) _resetUI];
  }
}

void sub_100011528(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 120), a2);
  id v4 = a2;
  [*(id *)(a1 + 32) didReceiveAuthenticationData];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

id sub_100011CA8(uint64_t a1, void *a2, int a3)
{
  id v4 = a2;
  id v5 = +[NSBundle bundleForClass:objc_opt_class()];
  if (a3)
  {
    uint64_t v6 = +[UIDevice modelSpecificLocalizedStringKeyForKey:v4];

    id v4 = (id)v6;
  }
  id v7 = [v5 localizedStringForKey:v4 value:&stru_100088CF0 table:@"MobileUI"];

  return v7;
}

void sub_1000121FC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 80));
  _Unwind_Resume(a1);
}

void sub_100012224(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v2 = +[NSString stringWithFormat:@"immediate dismiss requested, tid: %u", *(unsigned int *)(a1 + 48)];
  [WeakRetained _dismissRootWithReason:v2 completion:*(void *)(a1 + 32)];
}

void sub_1000122A4(uint64_t a1)
{
  uint64_t v2 = LALogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 56);
    *(_DWORD *)buf = 67109120;
    int v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Executing disappearBlock, tid:%u", buf, 8u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 1;
  id v4 = objc_retainBlock(*(id *)(a1 + 40));
  id v5 = *(void **)(*(void *)(a1 + 32) + 144);
  *(void *)(*(void *)(a1 + 32) + 144) = v4;

  uint64_t v6 = *(void **)(a1 + 32);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100012420;
  v7[3] = &unk_100086530;
  objc_copyWeak(&v8, (id *)(a1 + 48));
  int v9 = *(_DWORD *)(a1 + 56);
  [v6 _performOnMainQueueWhenAppeared:v7];
  objc_destroyWeak(&v8);
}

void sub_100012404(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100012420(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = +[NSString stringWithFormat:@"dismiss requested, tid: %u", *(unsigned int *)(a1 + 40)];
  [WeakRetained _dismissRootWithReason:v2 completion:0];
}

void sub_1000128DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    id v2 = +[LAErrorHelper errorWithCode:-4 message:@"Caller moved to background."];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void sub_100012964(uint64_t a1)
{
  id v2 = LALogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 56);
    int v4 = *(_DWORD *)(a1 + 64);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v42 = v3;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Preparing a new child controller: %d, tid:%u", buf, 0xEu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 40);
  if (!v6)
  {
    switch(*(void *)(a1 + 56))
    {
      case 1:
        sub_100010940();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 2:
        sub_10001C0F0(*(void **)(a1 + 40));
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 3:
        sub_1000182F0(*(void **)(a1 + 40));
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_18;
      case 4:
        v17 = PasswordViewController;
        goto LABEL_17;
      case 5:
        v17 = FaceIdViewController;
        goto LABEL_17;
      case 6:
        v17 = RatchetCoolOffViewController;
LABEL_17:
        id v12 = [v17 alloc];
LABEL_18:
        uint64_t v18 = *(void *)(a1 + 32);
        v19 = *(void **)(v18 + 8);
        *(void *)(v18 + 8) = v12;

        id v20 = [*(id *)(*(void *)(a1 + 32) + 8) initWithInternalInfo:*(void *)(a1 + 40) parent:*(void *)(a1 + 32) allowsLandscape:*(unsigned __int8 *)(*(void *)(a1 + 32) + 24)];
        uint64_t v21 = *(void *)(a1 + 32);
        id v22 = *(void **)(v21 + 8);
        *(void *)(v21 + 8) = v20;

        uint64_t v10 = *(void *)(a1 + 32);
        goto LABEL_19;
      default:
        id v13 = *(void **)(v5 + 8);
        *(void *)(v5 + 8) = 0;

        if (*(void *)(a1 + 48))
        {
          id v14 = +[NSString stringWithFormat:@"Unexpected controller type (%d).", *(void *)(a1 + 56)];
          uint64_t v15 = *(void *)(a1 + 48);
          v16 = +[LAErrorHelper internalErrorWithMessage:v14];
          (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
        }
        return;
    }
  }
  uint64_t v7 = [v6 childControllerFor:*(void *)(v5 + 32) type:*(void *)(a1 + 56) allowsLandscape:*(unsigned __int8 *)(v5 + 24)];
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = v7;

  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 8))
  {
LABEL_19:
    *(unsigned char *)(v10 + 49) = 1;
    uint64_t v23 = *(void *)(a1 + 32);
    if (*(void *)(v23 + 16))
    {
      v24 = LALogForCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        uint64_t v26 = *(void *)(v25 + 16);
        uint64_t v27 = *(void *)(v25 + 8);
        int v28 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v42 = v26;
        *(_WORD *)&v42[4] = 2114;
        *(void *)&v42[6] = v27;
        *(_WORD *)&v42[14] = 1024;
        *(_DWORD *)&v42[16] = v28;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Forwarding cached event %d to %{public}@, tid:%u", buf, 0x18u);
      }

      [*(id *)(*(void *)(a1 + 32) + 8) mechanismEvent:*(void *)(*(void *)(a1 + 32) + 16) reply:&stru_1000865A0];
      *(void *)(*(void *)(a1 + 32) + 16) = 0;
      uint64_t v23 = *(void *)(a1 + 32);
    }
    [*(id *)(v23 + 8) setModalPresentationStyle:0];
    v29 = [*(id *)(a1 + 32) view];
    v30 = [v29 window];
    v31 = [v30 _rootSheetPresentationController];
    [v31 _setShouldScaleDownBehindDescendantSheets:0];

    v32 = LALogForCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v33 = *(void *)(a1 + 32);
      uint64_t v34 = *(void *)(v33 + 8);
      int v35 = *(_DWORD *)(a1 + 64);
      *(_DWORD *)buf = 138543874;
      *(void *)v42 = v34;
      *(_WORD *)&v42[8] = 2114;
      *(void *)&v42[10] = v33;
      *(_WORD *)&v42[18] = 1024;
      int v43 = v35;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "%{public}@ is being presented by %{public}@, tid:%u", buf, 0x1Cu);
    }

    v36 = *(void **)(a1 + 32);
    v37 = (void *)v36[1];
    id v38 = [v37 shouldPresentWithAnimation];
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100012E68;
    v39[3] = &unk_1000865C8;
    v39[4] = *(void *)(a1 + 32);
    id v40 = *(id *)(a1 + 48);
    [v36 presentViewController:v37 animated:v38 completion:v39];
  }
  else
  {
    int v11 = LALogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "New child controller is nil - nothing to show.", buf, 2u);
    }
  }
}

uint64_t sub_100012E68(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

void sub_100013040(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    uint64_t v2 = *(void *)(a1 + 32);
    uint64_t v3 = +[NSString stringWithFormat:@"dismissing child for tid:%u", *(unsigned int *)(a1 + 64)];
    [WeakRetained _dismissChild:v2 andRoot:0 reason:v3 completion:*(void *)(a1 + 48)];
  }
  else
  {
    int v4 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 51);
    uint64_t v5 = LALogForCategory();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        int v7 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v25 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Appeared, performing task, tid:%u", buf, 8u);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      if (v6)
      {
        int v8 = *(_DWORD *)(a1 + 64);
        *(_DWORD *)buf = 67109120;
        int v25 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling block when controller appears, tid:%u", buf, 8u);
      }

      if (*(void *)(*(void *)(a1 + 40) + 152))
      {
        int v9 = LALogForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v10 = *(_DWORD *)(a1 + 64);
          *(_DWORD *)buf = 67109120;
          int v25 = v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "compound notification, tid:%u", buf, 8u);
        }

        id v11 = objc_retainBlock(*(id *)(*(void *)(a1 + 40) + 152));
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100013318;
        v20[3] = &unk_100086618;
        int v23 = *(_DWORD *)(a1 + 64);
        id v21 = *(id *)(a1 + 48);
        id v22 = v11;
        id v12 = v11;
        id v13 = objc_retainBlock(v20);
        uint64_t v14 = *(void *)(a1 + 40);
        uint64_t v15 = *(void **)(v14 + 152);
        *(void *)(v14 + 152) = v13;
      }
      else
      {
        id v16 = objc_retainBlock(*(id *)(a1 + 48));
        uint64_t v17 = *(void *)(a1 + 40);
        uint64_t v18 = *(void **)(v17 + 152);
        *(void *)(v17 + 152) = v16;
      }
    }
  }
}

uint64_t sub_100013318(uint64_t a1)
{
  uint64_t v2 = LALogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_1000611D4(a1, v2);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100061158(a1, v3);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000135C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000135EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsStatusBarAppearanceUpdate];
}

void sub_100013F80(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = LALogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1000612B8();
  }
}

void sub_1000140A0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1000140C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000141A0;
  block[3] = &unk_1000866B8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v12);
}

void sub_1000141A0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleIdleExitResponse:*(void *)(a1 + 32) error:*(void *)(a1 + 40)];
}

void sub_1000149E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained && !*((unsigned char *)WeakRetained + 50))
  {
    uint64_t v3 = LALogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100061424();
    }

    int v4 = +[TransitionViewController rootController];
    [v4 _dismissRemoteUIWithCompletionHandler:0];
  }
}

void sub_100014B8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _mechanismEvent:*(void *)(a1 + 56) value:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

uint64_t sub_100014EA0(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000155B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_1000155E8(uint64_t a1)
{
  uint64_t v2 = LALogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    uint64_t v4 = *(void *)(a1 + 32);
    int v6 = 138543618;
    id v7 = WeakRetained;
    __int16 v8 = 2114;
    uint64_t v9 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ was dismissed (%{public}@)", (uint8_t *)&v6, 0x16u);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_1000156CC(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 56))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _dismissRootWithReason:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v2 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v2();
  }
}

void sub_100015FF0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10001764C(id a1)
{
  qword_10009E288 = objc_alloc_init(URLOpener);

  _objc_release_x1();
}

id sub_1000182F0(void *a1)
{
  uint64_t v1 = [a1 objectForKeyedSubscript:@"CTKPIN"];
  unsigned int v2 = [v1 BOOLValue];

  uint64_t v3 = off_100085658;
  if (!v2) {
    uint64_t v3 = &off_100085538;
  }
  id v4 = objc_alloc(*v3);

  return v4;
}

void sub_10001835C(id a1)
{
  qword_10009E2A0 = (uint64_t)os_log_create("com.apple.LocalAuthentication", "PinViewController");

  _objc_release_x1();
}

void sub_10001A008(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    [*(id *)(a1 + 32) _switchToBackoffScreen:a2];
    *(unsigned char *)(*(void *)(a1 + 32) + 202) = 0;
  }
  else
  {
    uint64_t v3 = +[LACConcurrencyUtilities globalUserInitiatedConcurrentQueue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10001A0E4;
    block[3] = &unk_100086800;
    char v10 = *(unsigned char *)(a1 + 52);
    int v9 = *(_DWORD *)(a1 + 48);
    id v4 = *(id *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 32);
    id v7 = v4;
    uint64_t v8 = v5;
    dispatch_async(v3, block);
  }
}

id sub_10001A0E4(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 52)) {
    goto LABEL_9;
  }
  int v2 = *(_DWORD *)(a1 + 48);
  if (v2 == -14 || v2 == -3)
  {
    uint64_t v4 = 1;
    goto LABEL_11;
  }
  if (v2)
  {
    uint64_t v4 = 3;
  }
  else
  {
LABEL_9:
    uint64_t v5 = +[LAPasscodeHelper sharedInstance];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [*(id *)(a1 + 40) cachedExternalizedContext];
    uint64_t v8 = [v7 externalizedContext];
    int v9 = [*(id *)(a1 + 40) internalInfo];
    char v10 = [v9 objectForKeyedSubscript:@"UserId"];
    id v11 = [*(id *)(a1 + 40) policy];
    id v12 = [*(id *)(a1 + 40) options];
    uint64_t v4 = (uint64_t)[v5 verifyPasswordUsingAKS:v6 acmContext:v8 userId:v10 policy:v11 options:v12 bioLockoutRecovery:0];
  }
LABEL_11:
  [*(id *)(a1 + 32) reset];
  id v13 = *(void **)(a1 + 40);

  return _[v13 _processPasscodeEntryResult:v4];
}

void sub_10001A618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001A63C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showGlyph:0 animated:1];
}

void sub_10001A684(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001A720;
  v6[3] = &unk_100086850;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10001A720(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = *(void **)(v2 + 160);
  if (v1)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10001A7E8;
    v5[3] = &unk_100086850;
    v5[4] = v2;
    id v6 = v1;
    [v3 animateToFailureStateWithCompletion:v5];
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 160);
    [v4 animateToFailureStateWithCompletion:&stru_100086870];
  }
}

void sub_10001A7E8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001A870;
  v2[3] = &unk_100086850;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_10001A870(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToBackoffScreen:*(void *)(a1 + 40)];
}

void sub_10001A880(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001A91C;
  v5[3] = &unk_100086850;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_10001A91C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 160);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10001A9B8;
  v3[3] = &unk_100086850;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 animateToFailureStateWithCompletion:v3];
}

void sub_10001A9B8(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001AA40;
  v2[3] = &unk_100086850;
  uint64_t v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id sub_10001AA40(uint64_t a1)
{
  return [*(id *)(a1 + 32) _switchToBackoffScreen:*(void *)(a1 + 40)];
}

void sub_10001ABFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001AC20(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10001ACF0;
    v6[3] = &unk_100086898;
    objc_copyWeak(&v8, v4);
    id v7 = v3;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

    objc_destroyWeak(&v8);
  }
}

void sub_10001ACF0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(void *)(a1 + 32)) {
      [WeakRetained _switchToBackoffScreen:];
    }
    else {
      [WeakRetained _showPasscodeScreen];
    }
    id WeakRetained = v3;
  }
}

id sub_10001B420(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) authenticationTitle];
  id v3 = [*(id *)(a1 + 32) authenticationSubtitle];
  uint64_t v4 = *(void *)(a1 + 32);
  if (*(void *)(v4 + 216)) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = *(void *)(v4 + 208);
  }
  id v6 = +[PasscodeViewState activeStateWithTitle:v2 subtitle:v3 accessoryView:v5];
  id v7 = [*(id *)(a1 + 32) _style];
  id v8 = [v6 withStyle:v7];

  return v8;
}

id sub_10001B650(uint64_t a1)
{
  uint64_t v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"MINUTES_TO_UNBLOCK" value:&stru_100088CF0 table:@"MobileUI"];
  uint64_t v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, *(unsigned int *)(a1 + 40));

  return v4;
}

void sub_10001BE04(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 160);
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_10001BE9C;
  v2[3] = &unk_100086580;
  id v3 = *(id *)(a1 + 40);
  [v1 animateToSucessStateWithCompletion:v2];
}

void sub_10001BE9C(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 1000000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001BF44;
  block[3] = &unk_100086580;
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_10001BF44(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10001BF5C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setGlyphState:4 animated:1];
}

void sub_10001BFA4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showGlyph:0 animated:1];
}

void sub_10001BFEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setGlyphState:2 animated:1];
}

id sub_10001C0F0(void *a1)
{
  uint64_t v1 = [a1 objectForKey:@"Options"];
  dispatch_time_t v2 = [v1 objectForKey:&off_10008A600];
  unsigned int v3 = [v2 BOOLValue];
  id v4 = &off_100085660;
  if (!v3) {
    id v4 = off_100085530;
  }
  id v5 = objc_alloc(*v4);

  return v5;
}

id sub_10001C180(void *a1, void *a2, void *a3, void *a4, uint64_t a5)
{
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  id v12 = a1;
  sub_10001C0F0(v12);
  id v13 = [(id)objc_claimAutoreleasedReturnValue() initWithInternalInfo:v12 mechanism:v11 backoffCounter:v10 remoteUIHost:v9 allowsLandscape:a5];

  return v13;
}

uint64_t start(int a1, char **a2)
{
  LALogSetProcessCategory();
  id v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

void sub_10001D114(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  [WeakRetained pinEntered:*(void *)(*(void *)(a1 + 32) + 88)];
}

uint64_t sub_10001D634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained
    && (unsigned int v3 = *(void **)(a1 + 32)) != 0
    && (id v7 = WeakRetained,
        [v3 presentedViewController],
        id v4 = (id)objc_claimAutoreleasedReturnValue(),
        v4,
        v7 != v4))
  {
    [*(id *)(a1 + 32) presentViewController:v7 animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(void))(v5 + 16))();
    }
  }

  return _objc_release_x1();
}

void sub_10001DD0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_10001DD28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained systemApertureElementContext];
  [v1 setElementNeedsUpdate];
}

uint64_t sub_10001E3DC()
{
  if (qword_10009E2B0 != -1) {
    dispatch_once(&qword_10009E2B0, &stru_100086908);
  }
  return byte_10009E2A9;
}

void sub_10001E5C0(id a1)
{
  id v1 = +[LACUIDevice sharedInstance];
  byte_10009E2A9 = [v1 isDynamicIslandAvailable];
}

uint64_t sub_10001E610()
{
  return byte_10009E2A8;
}

void sub_10001E634(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

double sub_10001E964(uint64_t a1)
{
  if ([*(id *)(a1 + 32) lightweightUI]) {
    return 56.0;
  }
  else {
    return dbl_10006BA50[*(unsigned char *)(*(void *)(a1 + 32) + 288) == 0];
  }
}

void sub_10001ECD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001ECF4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toastAnimationFadeIn:1 finished:0];
}

void sub_10001ED3C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toastAnimationFadeIn:1 finished:1];
}

void sub_10001F0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001F0F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toastAnimationFadeIn:0 finished:0];
}

void sub_10001F140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toastAnimationFadeIn:0 finished:1];
}

void sub_10001F4C0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 80));
  _Unwind_Resume(a1);
}

void sub_10001F4F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _shrinkAndRevokeWithCompletion:*(void *)(a1 + 32)];
}

void sub_10001F544(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    dispatch_time_t v2 = [WeakRetained[6] superview];
    [v2 setAlpha:0.0];

    uint64_t v3 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
    [v4[6] setBackgroundColor:v3];

    [v4 _setTransformScale:1];
    id WeakRetained = v4;
  }
}

void sub_10001F5F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _setTransformScale:0];
    [v3 dismissViewControllerAnimated:0 completion:*(void *)(a1 + 32)];
    id WeakRetained = v3;
  }
}

id sub_10001FAC8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 272) setAlpha:0.0];
  dispatch_time_t v2 = *(void **)(*(void *)(a1 + 32) + 280);

  return [v2 setAlpha:0.0];
}

void sub_10001FB24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained revokePresentableWithCompletionHandler:*(void *)(a1 + 32)];
}

void sub_100020DA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_100020DC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateLightweightConstraints];
}

id sub_100021488(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [*(id *)(a1 + 40) constraintEqualToAnchor:*(double *)(a1 + 48)];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v2 = [*(id *)(a1 + 40) constraintEqualToConstant:*(double *)(a1 + 48)];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }

  return v2;
}

double sub_100021B14()
{
  id v0 = +[UITraitCollection currentTraitCollection];
  id v1 = [v0 preferredContentSizeCategory];

  double v2 = 1.0;
  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v1)
    && ([v1 isEqualToString:UIContentSizeCategoryAccessibilityMedium] & 1) == 0)
  {
    if ([v1 isEqualToString:UIContentSizeCategoryAccessibilityLarge]) {
      double v2 = 1.0;
    }
    else {
      double v2 = 1.5;
    }
  }

  return v2;
}

id sub_100021CD4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) isActive];
  if (result)
  {
    id v3 = *(void **)(a1 + 32);
    return _[v3 updateGlyphConstraintsIfOrientationChanged];
  }
  return result;
}

id sub_100022068(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateLightweightConstraintsWithCoordinatedAnimations];
}

void sub_100022358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100022374(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setBackdropEnabled:*(unsigned __int8 *)(a1 + 40)];
}

id sub_100023570(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)UIToolbar);
  [v2 setBarStyle:4];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:5 target:0 action:0];
  v7[0] = v3;
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 32) action:"_submitPasscode:"];
  v7[1] = v4;
  uint64_t v5 = +[NSArray arrayWithObjects:v7 count:2];
  [v2 setItems:v5];

  [v2 sizeToFit];

  return v2;
}

id sub_100023D60(uint64_t a1)
{
  LODWORD(v1) = vcvtpd_s64_f64(*(double *)(a1 + 40) / 60.0);
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  id v3 = [v2 localizedStringForKey:@"MINUTES_TO_UNBLOCK" value:&stru_100088CF0 table:@"MobileUI"];
  id v4 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v3, v1);

  return v4;
}

void sub_100023E24(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 40)) {
      BOOL v3 = *(unsigned char *)(a1 + 41) != 0;
    }
    else {
      BOOL v3 = 0;
    }
    id v4 = WeakRetained;
    [WeakRetained setPasscodeFocused:v3];
    id WeakRetained = v4;
  }
}

void sub_100024058(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100024104;
  v4[3] = &unk_100086850;
  BOOL v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v4);
}

id sub_100024104(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  return [*(id *)(a1 + 40) setText:&stru_100088CF0];
}

void sub_100024494(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000244B0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  dispatch_time_t v2 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v3 = (void *)*((void *)WeakRetained + 2);
    long long v4 = *(_OWORD *)&CGAffineTransformIdentity.c;
    v5[0] = *(_OWORD *)&CGAffineTransformIdentity.a;
    v5[1] = v4;
    v5[2] = *(_OWORD *)&CGAffineTransformIdentity.tx;
    [v3 setTransform:v5];
  }
}

uint64_t sub_100024514(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100024814(id a1)
{
  qword_10009E2C8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LAUIPasscodeService];

  _objc_release_x1();
}

void sub_1000248B0(id a1)
{
  qword_10009E2D8 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___LAUIPasscodeHost];

  _objc_release_x1();
}

void sub_100024C14(id a1, BOOL a2, NSError *a3)
{
  long long v4 = a3;
  if (v4 || !a2)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_100061894((uint64_t)v4);
    }
  }
  else
  {
    id v5 = LALogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Passcode verification succeeded", v6, 2u);
    }
  }
}

void sub_100024DB8(id a1, NSError *a2)
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
    sub_100061914((uint64_t)a2);
  }
}

void sub_100024F20(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _backoffTimeout];
    double v3 = v2;
    if (v2 > 0.0) {
      [v4 _dispatchBackoffTimer];
    }
    [v4 setBackoffTimeout:v3];
    id WeakRetained = v4;
  }
}

void sub_10002561C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100025640(uint64_t a1, char a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained && (a2 & 1) == 0)
  {
    [WeakRetained setAnimating:1];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    void v7[2] = sub_10002572C;
    v7[3] = &unk_100086898;
    objc_copyWeak(&v9, v4);
    id v8 = *(id *)(a1 + 32);
    [v6 _shakePasscodeFieldWithCompletion:v7];

    objc_destroyWeak(&v9);
  }
}

void sub_100025718(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002572C(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 200000000);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000257F4;
  v3[3] = &unk_100086898;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  id v4 = *(id *)(a1 + 32);
  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, v3);

  objc_destroyWeak(&v5);
}

void sub_1000257F4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained setAnimating:0];
    [*(id *)(a1 + 32) setText:&stru_100088CF0];
    id WeakRetained = v3;
  }
}

id sub_100026568()
{
  id v0 = objc_opt_new();
  uint64_t v1 = sub_1000265C4();
  [v0 setView:v1];

  return v0;
}

id sub_1000265C4()
{
  id v0 = sub_100026768();
  uint64_t v1 = objc_opt_new();
  [v1 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v0];
  [v0 setTranslatesAutoresizingMaskIntoConstraints:0];
  dispatch_time_t v2 = [v0 topAnchor];
  id v3 = [v1 topAnchor];
  id v4 = [v2 constraintEqualToAnchor:v3 constant:20.0];
  [v4 setActive:1];

  id v5 = [v0 bottomAnchor];
  id v6 = [v1 bottomAnchor];
  id v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  id v8 = [v0 leadingAnchor];
  id v9 = [v1 leadingAnchor];
  id v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  id v11 = [v0 trailingAnchor];
  id v12 = [v1 trailingAnchor];
  id v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  return v1;
}

id sub_100026768()
{
  id v0 = +[UIImageSymbolConfiguration configurationWithTextStyle:UIFontTextStyleLargeTitle scale:2];
  uint64_t v1 = +[UIImage _systemImageNamed:@"touchid" withConfiguration:v0];
  id v2 = [objc_alloc((Class)UIImageView) initWithImage:v1];
  [v2 setContentMode:1];

  return v2;
}

uint64_t sub_100027310()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x4C45434E4143;
  v1._object = (void *)0xE600000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000273D0()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 1162760004;
  v1._object = (void *)0xE400000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002748C()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 19279;
  v1._object = (void *)0xE200000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027544()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007AC70;
  v1._uint64_t countAndFlagsBits = 0xD000000000000017;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002760C()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x494147415F595254;
  v1._object = (void *)0xE90000000000004ELL;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000276D4()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007AC90;
  v1._uint64_t countAndFlagsBits = 0xD000000000000013;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002779C()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007ACB0;
  v1._uint64_t countAndFlagsBits = 0xD000000000000013;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027864()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007ACD0;
  v1._uint64_t countAndFlagsBits = 0xD000000000000015;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_10002792C()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 5849424;
  v1._object = (void *)0xE300000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000279E8()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007ACF0;
  v1._uint64_t countAndFlagsBits = 0xD000000000000015;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027AB0()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x49505F5245544E45;
  v1._object = (void *)0xE90000000000004ELL;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027B78()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x4C52414550;
  v1._object = (void *)0xE500000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027C38()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x44495F4843554F54;
  v1._object = (void *)0xE800000000000000;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027CFC()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x41505F5245544E45;
  v1._object = (void *)0xEE0044524F575353;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027DCC()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._uint64_t countAndFlagsBits = 0x425F454349564544;
  v1._object = (void *)0xEE0044454B434F4CLL;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100027E9C(uint64_t a1)
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v2 = (id)qword_10009E2E8;
  v9._object = (void *)0xE000000000000000;
  v3._object = (void *)0x800000010007AD10;
  v3._uint64_t countAndFlagsBits = 0xD000000000000012;
  v4.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v4.value._object = (void *)0xE800000000000000;
  v5._uint64_t countAndFlagsBits = 0;
  v5._object = (void *)0xE000000000000000;
  v9._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v3, v4, (NSBundle)v2, v5, v9);

  sub_100028560(&qword_10009CC00);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10006BB30;
  *(void *)(v6 + 56) = &type metadata for Int;
  *(void *)(v6 + 64) = &protocol witness table for Int;
  *(void *)(v6 + 32) = a1;
  uint64_t v7 = static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_100027FD0(uint64_t a1, uint64_t a2)
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_10009E2E8;
  v11._object = (void *)0xE000000000000000;
  v5._object = (void *)0x800000010007AD30;
  v5._uint64_t countAndFlagsBits = 0xD000000000000019;
  v6.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v6.value._object = (void *)0xE800000000000000;
  v7._uint64_t countAndFlagsBits = 0;
  v7._object = (void *)0xE000000000000000;
  v11._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v5, v6, (NSBundle)v4, v7, v11);

  sub_100028560(&qword_10009CC00);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10006BB30;
  *(void *)(v8 + 56) = &type metadata for String;
  *(void *)(v8 + 64) = sub_1000285A4();
  *(void *)(v8 + 32) = a1;
  *(void *)(v8 + 40) = a2;
  swift_bridgeObjectRetain();
  uint64_t v9 = static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9;
}

uint64_t sub_100028118(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v8 = (id)qword_10009E2E8;
  v16._object = (void *)0xE000000000000000;
  v9._uint64_t countAndFlagsBits = 0x494B53415F505041;
  v9._object = (void *)0xEF485455415F474ELL;
  v10.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v10.value._object = (void *)0xE800000000000000;
  v11._uint64_t countAndFlagsBits = 0;
  v11._object = (void *)0xE000000000000000;
  v16._uint64_t countAndFlagsBits = 0;
  NSLocalizedString(_:tableName:bundle:value:comment:)(v9, v10, (NSBundle)v8, v11, v16);

  sub_100028560(&qword_10009CC00);
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_10006BB40;
  *(void *)(v12 + 56) = &type metadata for String;
  unint64_t v13 = sub_1000285A4();
  *(void *)(v12 + 32) = a3;
  *(void *)(v12 + 40) = a4;
  *(void *)(v12 + 96) = &type metadata for String;
  *(void *)(v12 + 104) = v13;
  *(void *)(v12 + 64) = v13;
  *(void *)(v12 + 72) = a1;
  *(void *)(v12 + 80) = a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v14 = static String.localizedStringWithFormat(_:_:)();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v14;
}

uint64_t sub_100028288()
{
  return sub_1000282D8(0);
}

uint64_t sub_100028290()
{
  return sub_1000282D8(1);
}

uint64_t sub_100028298()
{
  return sub_1000282D8(2);
}

uint64_t sub_1000282A0()
{
  return sub_1000282D8(3);
}

uint64_t sub_1000282A8()
{
  return sub_1000282D8(4);
}

uint64_t sub_1000282B0()
{
  return sub_1000282D8(5);
}

uint64_t sub_1000282B8()
{
  return sub_1000282D8(6);
}

uint64_t sub_1000282C0()
{
  return sub_1000282D8(7);
}

uint64_t sub_1000282C8()
{
  return sub_1000282D8(8);
}

uint64_t sub_1000282D0()
{
  return sub_1000282D8(9);
}

uint64_t sub_1000282D8(Swift::Int a1)
{
  id v2 = self;
  sub_1000285F8();
  Class isa = NSNumber.init(integerLiteral:)(a1).super.super.isa;
  id v4 = [v2 localizedStringFromNumber:isa numberStyle:1];

  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return v5;
}

uint64_t sub_10002836C()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007AD50;
  v1._uint64_t countAndFlagsBits = 0xD00000000000001FLL;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_100028434()
{
  if (qword_10009E2E0 != -1) {
    swift_once();
  }
  id v0 = (id)qword_10009E2E8;
  v6._object = (void *)0xE000000000000000;
  v1._object = (void *)0x800000010007AD70;
  v1._uint64_t countAndFlagsBits = 0xD00000000000001ELL;
  v2.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
  v2.value._object = (void *)0xE800000000000000;
  v3._uint64_t countAndFlagsBits = 0;
  v3._object = (void *)0xE000000000000000;
  v6._uint64_t countAndFlagsBits = 0;
  uint64_t countAndFlagsBits = NSLocalizedString(_:tableName:bundle:value:comment:)(v1, v2, (NSBundle)v0, v3, v6)._countAndFlagsBits;

  return countAndFlagsBits;
}

uint64_t sub_1000284FC()
{
  return swift_deallocClassInstance();
}

id sub_10002850C()
{
  _s8SentinelCMa();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10009E2E8 = (uint64_t)result;
  return result;
}

uint64_t sub_100028560(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_1000285A4()
{
  unint64_t result = qword_10009CC08;
  if (!qword_10009CC08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009CC08);
  }
  return result;
}

unint64_t sub_1000285F8()
{
  unint64_t result = qword_10009CC10;
  if (!qword_10009CC10)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10009CC10);
  }
  return result;
}

ValueMetadata *type metadata accessor for LocalizedStrings()
{
  return &type metadata for LocalizedStrings;
}

ValueMetadata *type metadata accessor for LocalizedStrings.AuthenticationReason()
{
  return &type metadata for LocalizedStrings.AuthenticationReason;
}

ValueMetadata *type metadata accessor for LocalizedStrings.Digits()
{
  return &type metadata for LocalizedStrings.Digits;
}

ValueMetadata *type metadata accessor for LocalizedStrings.Pearl()
{
  return &type metadata for LocalizedStrings.Pearl;
}

uint64_t _s8SentinelCMa()
{
  return self;
}

id sub_10002869C()
{
  id v0 = objc_allocWithZone((Class)LAContext);

  return [v0 init];
}

uint64_t variable initialization expression of AuthorizationRemoteViewController.terminateAssertion()
{
  return 0;
}

Swift::Bool __swiftcall LACUIDTOViewController._canShowWhileLocked()()
{
  return 1;
}

void sub_1000286EC()
{
  id v1 = [objc_allocWithZone((Class)UIView) initWithFrame:0.0, 0.0, 0.0, 0.0];
  [v0 setView:v1];

  if ([self isSharedIPad])
  {
    id v2 = [objc_allocWithZone((Class)LALocalBackoffCounter) init];
    [v0 setBackoffCounter:v2];
  }
}

void sub_10002880C(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  [super viewWillAppear:a1 & 1];
  sub_100028870(v1);
  Swift::String v3 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  *(void *)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = v4;
}

void sub_100028870(char *a1)
{
  id v2 = [a1 internalInfo];
  if (!v2)
  {
    __break(1u);
    goto LABEL_106;
  }
  Swift::String v3 = v2;
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  strcpy((char *)v89, "Options");
  v89[1] = (id)0xE700000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v4 + 16) && (unint64_t v5 = sub_10002A9F0((uint64_t)&v90), (v6 & 1) != 0))
  {
    sub_10002B158(*(void *)(v4 + 56) + 32 * v5, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    sub_100028560(&qword_10009CCF8);
    if (swift_dynamicCast())
    {
      id v7 = v89[0];
      goto LABEL_11;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
  }
  id v7 = (id)sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
LABEL_11:
  id v8 = [*(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context] externalizedContext];
  if (!v8)
  {
LABEL_106:
    __break(1u);
    goto LABEL_107;
  }
  Swift::String v9 = v8;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  id v13 = objc_allocWithZone((Class)LACUIAuthenticatorServiceConfiguration);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v15 = [v13 initWithContext:isa requirement:2];
  sub_10002ADFC(v10, v12);

  id v16 = [a1 callerName];
  if (!v16)
  {
LABEL_107:
    __break(1u);
    goto LABEL_108;
  }
  uint64_t v17 = v16;
  [v15 setTitle:v16];

  swift_getObjectType();
  id v18 = [a1 options];
  if (!v18)
  {
LABEL_108:
    __break(1u);
    goto LABEL_109;
  }
  v19 = v18;
  uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v89[0]) = 1037;
  AnyHashable.init<A>(_:)();
  uint64_t v88 = (uint64_t)v7;
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_10002A9F0((uint64_t)&v90), (v22 & 1) != 0))
  {
    sub_10002B158(*(void *)(v20 + 56) + 32 * v21, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    if (swift_dynamicCast()) {
      goto LABEL_38;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
  }
  if (objc_msgSend(self, "isApplePayPolicy:", objc_msgSend(a1, "policy")))
  {
LABEL_23:
    sub_10002792C();
    goto LABEL_38;
  }
  id v23 = [a1 options];
  if (!v23)
  {
LABEL_115:
    __break(1u);
    goto LABEL_116;
  }
  v24 = v23;
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v89[0]) = 1053;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v25 + 16) && (unint64_t v26 = sub_10002A9F0((uint64_t)&v90), (v27 & 1) != 0))
  {
    sub_10002B158(*(void *)(v25 + 56) + 32 * v26, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && LOBYTE(v89[0]) == 1) {
      goto LABEL_23;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
  }
  if ([a1 policy] == (id)1010)
  {
    sub_1000279E8();
  }
  else
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v29 = [self bundleForClass:ObjCClassFromMetadata];
    v30 = self;
    NSString v31 = String._bridgeToObjectiveC()();
    id v32 = [v30 modelSpecificLocalizedStringKeyForKey:v31];

    if (!v32)
    {
LABEL_116:
      __break(1u);
      return;
    }
    NSString v33 = String._bridgeToObjectiveC()();
    id v34 = [v29 localizedStringForKey:v32 value:0 table:v33];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
LABEL_38:
  NSString v35 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setSubtitle:v35];

  id v36 = [a1 internalInfo];
  if (!v36)
  {
LABEL_109:
    __break(1u);
    goto LABEL_110;
  }
  v37 = v36;
  uint64_t v38 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  strcpy((char *)v89, "FallbackReason");
  HIBYTE(v89[1]) = -18;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v38 + 16) && (unint64_t v39 = sub_10002A9F0((uint64_t)&v90), (v40 & 1) != 0))
  {
    sub_10002B158(*(void *)(v38 + 56) + 32 * v39, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (!*((void *)&v93 + 1))
  {
    v50 = &v92;
LABEL_50:
    sub_10002A660((uint64_t)v50);
    goto LABEL_58;
  }
  sub_10002B40C(0, &qword_10009CD18);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_58;
  }
  v41 = self;
  id v42 = v89[0];
  int v43 = (void *)_convertErrorToNSError(_:)();

  LODWORD(v41) = [v41 error:v43 hasCode:-4];
  if (!v41) {
    goto LABEL_57;
  }
  id v44 = [v42 userInfo];
  uint64_t v45 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v46 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v45 + 16) && (unint64_t v48 = sub_10002AAA8(v46, v47), (v49 & 1) != 0))
  {
    sub_10002B158(*(void *)(v45 + 56) + 32 * v48, (uint64_t)&v90);
  }
  else
  {
    long long v90 = 0u;
    long long v91 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v91 + 1))
  {

    v50 = &v90;
    goto LABEL_50;
  }
  type metadata accessor for LAErrorSubcode();
  if (swift_dynamicCast())
  {
    if ((void)v92 == 13)
    {
      sub_10002836C();
LABEL_103:
      uint64_t v87 = v51;

      if (!v87) {
        goto LABEL_68;
      }
LABEL_66:
      NSString v57 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_69;
    }
    if ((void)v92 == 14)
    {
      sub_100028434();
      goto LABEL_103;
    }
  }
LABEL_57:

LABEL_58:
  id v52 = [a1 options];
  if (!v52)
  {
LABEL_114:
    __break(1u);
    goto LABEL_115;
  }
  v53 = v52;
  uint64_t v54 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  v89[0] = (id)1031;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v54 + 16) && (unint64_t v55 = sub_10002A9F0((uint64_t)&v90), (v56 & 1) != 0))
  {
    sub_10002B158(*(void *)(v54 + 56) + 32 * v55, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    if ((swift_dynamicCast() & 1) == 0 || !v89[1]) {
      goto LABEL_68;
    }
    goto LABEL_66;
  }
  sub_10002A660((uint64_t)&v92);
LABEL_68:
  NSString v57 = 0;
LABEL_69:
  [v15 setPrompt:v57];

  NSString v58 = String._bridgeToObjectiveC()();
  [v15 setPasswordFieldPlaceholder:v58];

  sub_100027310();
  NSString v59 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v15 setCancelButtonTitle:v59];

  id v60 = [a1 internalInfo];
  if (!v60)
  {
LABEL_110:
    __break(1u);
    goto LABEL_111;
  }
  v61 = v60;
  uint64_t v62 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  strcpy((char *)v89, "CallerName");
  BYTE3(v89[1]) = 0;
  HIDWORD(v89[1]) = -369098752;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v62 + 16) && (unint64_t v63 = sub_10002A9F0((uint64_t)&v90), (v64 & 1) != 0))
  {
    sub_10002B158(*(void *)(v62 + 56) + 32 * v63, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    if (swift_dynamicCast())
    {
      NSString v65 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      goto LABEL_79;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
  }
  NSString v65 = 0;
LABEL_79:
  [v15 setBundleIdentifier:v65];

  [v15 setStyle:0];
  id v66 = [a1 cachedExternalizedContext];
  id v67 = [a1 backoffCounter];
  if (!v67)
  {
LABEL_111:
    __break(1u);
    goto LABEL_112;
  }
  v68 = v67;
  id v69 = [a1 options];
  if (!v69)
  {
LABEL_112:
    __break(1u);
    goto LABEL_113;
  }
  v70 = v69;
  uint64_t v71 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v89[0]) = 1004;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v71 + 16) && (unint64_t v72 = sub_10002A9F0((uint64_t)&v90), (v73 & 1) != 0))
  {
    sub_10002B158(*(void *)(v71 + 56) + 32 * v72, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    sub_10002B40C(0, (unint64_t *)&qword_10009CC10);
    if (swift_dynamicCast())
    {
      id v74 = [v89[0] unsignedIntegerValue];

      char v75 = 0;
      goto LABEL_90;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
  }
  id v74 = 0;
  char v75 = 1;
LABEL_90:
  id v76 = [a1 policy];
  id v77 = [a1 internalInfo];
  if (!v77)
  {
LABEL_113:
    __break(1u);
    goto LABEL_114;
  }
  v78 = v77;
  uint64_t v79 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&long long v92 = 0x644972657355;
  *((void *)&v92 + 1) = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v79 + 16) && (unint64_t v80 = sub_10002A9F0((uint64_t)&v90), (v81 & 1) != 0))
  {
    sub_10002B158(*(void *)(v79 + 56) + 32 * v80, (uint64_t)&v92);
  }
  else
  {
    long long v92 = 0u;
    long long v93 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v90);
  if (*((void *)&v93 + 1))
  {
    sub_10002B40C(0, (unint64_t *)&qword_10009CC10);
    if (swift_dynamicCast()) {
      id v82 = v89[0];
    }
    else {
      id v82 = 0;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v92);
    id v82 = 0;
  }
  uint64_t v83 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v84 = v15;
  *(void *)&long long v90 = sub_10003F268(v84, v66, v68, (uint64_t)v74, v75, (uint64_t)v76, v82, v88, (uint64_t)sub_10002AE8C, v83);
  swift_unknownObjectRetain();
  sub_10003F07C();
  id v85 = (id)v90;
  Swift::Bool canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
  sub_10003F498(a1, canShowWhile, v85);
}

unint64_t sub_1000295F8(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    Swift::String v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100028560(&qword_10009CCF0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
  Swift::String v3 = (void *)v2;
  uint64_t v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  uint64_t v5 = v2 + 64;
  uint64_t v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_10002AA34(v6, (uint64_t)v15, (uint64_t *)&unk_10009CDE0);
    unint64_t result = sub_10002A9F0((uint64_t)v15);
    if (v8) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v9 = v3[6] + 40 * result;
    long long v10 = v15[0];
    long long v11 = v15[1];
    *(void *)(v9 + 32) = v16;
    *(_OWORD *)uint64_t v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    unint64_t result = (unint64_t)sub_10002AA98(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

BOOL sub_1000297B8()
{
  return sub_1000608FC();
}

uint64_t sub_100029838()
{
  return 0;
}

void sub_100029848(uint64_t a1, uint64_t a2)
{
  Swift::String v3 = v2;
  sub_10002B40C(0, &qword_10009E050);
  if (sub_1000608FC())
  {
    uint64_t v6 = (void *)swift_allocObject();
    v6[2] = v2;
    v6[3] = a1;
    void v6[4] = a2;
    v15[4] = sub_100029AA8;
    v15[5] = v6;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    _OWORD v15[2] = sub_100029A40;
    v15[3] = &unk_100086D98;
    id v7 = _Block_copy(v15);
    id v8 = v3;
    sub_100029A94(a1);
    swift_release();
    [v8 dismissViewControllerAnimated:1 completion:v7];
    _Block_release(v7);
  }
  else
  {
    uint64_t v9 = *(void **)&v2[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
    if (v9)
    {
      long long v10 = self;
      id v11 = v9;
      id v12 = [v10 errorWithCode:-4];
      BOOL v13 = (void *)swift_allocObject();
      v13[2] = v3;
      v13[3] = a1;
      v13[4] = a2;
      id v14 = v3;
      sub_100029A94(a1);
      sub_10003F324((uint64_t)v12, (uint64_t (*)(uint64_t))sub_100029A88, (uint64_t)v13);

      swift_release();
    }
  }
}

uint64_t sub_100029A40(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100029A88()
{
}

uint64_t sub_100029A94(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

void sub_100029AA8()
{
  id v1 = *(char **)(v0 + 16);
  uint64_t v2 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager];
  if (v2)
  {
    uint64_t v5 = v0 + 24;
    uint64_t v4 = *(void *)(v0 + 24);
    uint64_t v3 = *(void *)(v5 + 8);
    uint64_t v6 = self;
    id v10 = v2;
    id v7 = [v6 errorWithCode:-4];
    id v8 = (void *)swift_allocObject();
    v8[2] = v1;
    v8[3] = v4;
    v8[4] = v3;
    uint64_t v9 = v1;
    sub_100029A94(v4);
    sub_10003F324((uint64_t)v7, (uint64_t (*)(uint64_t))sub_10002AD2C, (uint64_t)v8);
    swift_release();
  }
}

uint64_t sub_100029BB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100029BC8()
{
  return swift_release();
}

id sub_100029C88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v10 = objc_allocWithZone(v5);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithInternalInfo:isa mechanism:a2 backoffCounter:a3 remoteUIHost:a4 allowsLandscape:a5 & 1];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v12;
}

id sub_100029D54(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v6 = v5;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  id v13 = objc_allocWithZone((Class)LAContext);
  id v14 = v6;
  *(void *)&v6[v12] = [v13 init];
  *(void *)&v14[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(void *)&v14[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v18.receiver = v14;
  v18.super_class = ObjectType;
  id v16 = [super initWithInternalInfo:isa, a2, a3, a4, a5 & 1];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v16;
}

id AuthorizationRemoteViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id sub_100029FA0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  id v9 = objc_allocWithZone((Class)LAContext);
  id v10 = v4;
  *(void *)&v4[v8] = [v9 init];
  *(void *)&v10[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(void *)&v10[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  if (a2)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  id v12 = [super initWithNibName:v11 bundle:a3];

  return v12;
}

id AuthorizationRemoteViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id sub_10002A13C(void *a1)
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  id v5 = objc_allocWithZone((Class)LAContext);
  NSString v6 = v1;
  *(void *)&v1[v4] = [v5 init];
  *(void *)&v6[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(void *)&v6[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  [super initWithCoder:a1];

  return v7;
}

id sub_10002A21C(uint64_t a1, void *a2)
{
  if (!a1)
  {
    v4.super.Class isa = 0;
    uint64_t v5 = a2[3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  NSString v6 = sub_10002A3A8(a2, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10002A3EC((uint64_t)a2);
LABEL_6:
  id v11 = [objc_allocWithZone(v2) initWithInternalInfo:v4.super.isa parent:v10];

  swift_unknownObjectRelease();
  return v11;
}

void *sub_10002A3A8(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10002A3EC(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

id sub_10002A43C(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_context;
  id v8 = objc_allocWithZone((Class)LAContext);
  objc_super v9 = v3;
  *(void *)&v3[v7] = [v8 init];
  *(void *)&v9[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_authorizationViewManager] = 0;
  *(void *)&v9[OBJC_IVAR____TtC10CoreAuthUI27PasscodeSheetViewController_failures] = 0;

  if (a1)
  {
    v10.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.Class isa = 0;
  }
  sub_10002AA34(a2, (uint64_t)v21, &qword_10009D580);
  uint64_t v11 = v22;
  if (v22)
  {
    id v12 = sub_10002A3A8(v21, v22);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    id v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10002A3EC((uint64_t)v21);
  }
  else
  {
    uint64_t v16 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  [v17 initWithInternalInfo:v10.super.isa parent:v16];

  swift_unknownObjectRelease();
  id v18 = v17;
  sub_10002A660(a2);
  if (v18) {

  }
  return v18;
}

uint64_t sub_10002A660(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009D580);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id sub_10002A760()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return [super dealloc];
}

void sub_10002A7E4()
{
  id v1 = [v0 mechanism];
  if (v1)
  {
    objc_super v2 = v1;
    sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v2 uiEvent:9 options:isa];
    swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

uint64_t type metadata accessor for PasscodeSheetViewController()
{
  return self;
}

uint64_t sub_10002A998(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_10002A9A8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002A9E0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

unint64_t sub_10002A9F0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10002AB68(a1, v4);
}

uint64_t sub_10002AA34(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100028560(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_10002AA98(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_10002AAA8(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();

  return sub_10002B1B4(a1, a2, v4);
}

unint64_t sub_10002AB20(int a1)
{
  uint64_t v2 = static Hasher._hash(seed:bytes:count:)();

  return sub_10002B298(a1, v2);
}

unint64_t sub_10002AB68(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10002AC30(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10002AC8C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10002AC30(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10002AC8C(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002ACE4()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_10002AD2C()
{
}

void sub_10002AD38(uint64_t a1)
{
  uint64_t v3 = (void *)v1[2];
  uint64_t v2 = v1[3];
  if (v2)
  {
    uint64_t v4 = v1[4];
    uint64_t v10 = v2;
    uint64_t v11 = v4;
    v7.receiver = _NSConcreteStackBlock;
    v7.super_class = (Class)1107296256;
    id v8 = sub_100029A40;
    uint64_t v9 = a1;
    uint64_t v5 = _Block_copy(&v7);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v5 = 0;
  }
  char v6 = (objc_class *)type metadata accessor for PasscodeSheetViewController();
  v7.receiver = v3;
  v7.super_class = v6;
  [super dismissChildWithCompletionHandler:v5];
  _Block_release(v5);
}

uint64_t sub_10002ADFC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10002AE54()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10002AE8C(uint64_t a1)
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    if (a1)
    {
      swift_errorRetain();
      id v4 = [v3 mechanism];
      if (v4)
      {
        uint64_t v5 = v4;
        sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
        Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v5 uiEvent:9 options:isa];
        swift_unknownObjectRelease();

        objc_super v7 = self;
        id v8 = (void *)_convertErrorToNSError(_:)();
        LODWORD(v7) = [v7 error:v8 hasCode:-2];

        if (v7)
        {
          [v3 uiCancel];
          swift_errorRelease();
LABEL_10:

          return;
        }
        v14.super.Class isa = (Class)_convertErrorToNSError(_:)();
        [v3 uiFailureWithError:v14.super.isa];
        swift_errorRelease();
LABEL_9:

        goto LABEL_10;
      }
      __break(1u);
    }
    else
    {
      id v9 = [Strong mechanism];
      if (v9)
      {
        uint64_t v10 = v9;
        sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
        Class v11 = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v10 uiEvent:8 options:v11];
        swift_unknownObjectRelease();

        sub_100028560(&qword_10009CD00);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10006BB30;
        AnyHashable.init<A>(_:)();
        unint64_t v13 = sub_10002B334((uint64_t)&off_100086D20);
        *(void *)(inited + 96) = sub_100028560(&qword_10009CD08);
        *(void *)(inited + 72) = v13;
        sub_1000295F8(inited);
        v14.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v3 uiSuccessWithResult:v14.super.isa];
        goto LABEL_9;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10002B158(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10002B1B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_10002B298(int a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(_DWORD *)(v7 + 4 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(_DWORD *)(v7 + 4 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_10002B334(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100028560(&qword_10009CD10);
    uint64_t v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (unsigned char *)(a1 + 36); ; i += 8)
    {
      int v5 = *((_DWORD *)i - 1);
      char v6 = *i;
      unint64_t result = sub_10002AB20(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(_DWORD *)(v3[6] + 4 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t sub_10002B40C(uint64_t a1, unint64_t *a2)
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

void type metadata accessor for LAErrorSubcode()
{
  if (!qword_10009CD20)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10009CD20);
    }
  }
}

const char *sub_10002B4B0()
{
  return "LocalAuthentication";
}

const char *sub_10002B4C4()
{
  return "newDevicePasscodeAlert";
}

void sub_10002B4D8()
{
}

Swift::Int sub_10002B500()
{
  return Hasher._finalize()();
}

Swift::Int sub_10002B544()
{
  return Hasher._finalize()();
}

unint64_t sub_10002B588()
{
  unint64_t result = qword_10009CD28;
  if (!qword_10009CD28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009CD28);
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlags()
{
  return &type metadata for FeatureFlags;
}

uint64_t getEnumTagSinglePayload for FeatureFlags.LocalAuthentication(unsigned int *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if ((a2 + 1) >= 0x10000) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) < 0x100) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4) {
    return *a1;
  }
  if (v3 == 2) {
    return *(unsigned __int16 *)a1;
  }
  return *(unsigned __int8 *)a1;
}

unsigned char *storeEnumTagSinglePayload for FeatureFlags.LocalAuthentication(unsigned char *result, int a2, int a3)
{
  if ((a3 + 1) >= 0x10000) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) < 0x100) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2)
  {
    switch(v5)
    {
      case 1:
        *unint64_t result = a2;
        return result;
      case 2:
        *(_WORD *)unint64_t result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)unint64_t result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *unint64_t result = 0;
      break;
    case 2:
      *(_WORD *)unint64_t result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x10002B6E0);
    case 4:
      *(_DWORD *)unint64_t result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for FeatureFlags.LocalAuthentication()
{
  return &type metadata for FeatureFlags.LocalAuthentication;
}

ValueMetadata *type metadata accessor for Defaults()
{
  return &type metadata for Defaults;
}

void *sub_10002B778()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess();
  int v2 = *v1;
  id v3 = v2;
  return v2;
}

void sub_10002B828(void *a1)
{
  id v3 = (void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window);
  swift_beginAccess();
  unsigned int v4 = *v3;
  void *v3 = a1;
}

uint64_t (*sub_10002B87C())()
{
  return j__swift_endAccess;
}

void *sub_10002B8DC()
{
  unint64_t result = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v0) + 0x58))();
  if (result)
  {
    int v2 = result;
    id v3 = [result rootViewController];

    if (v3)
    {
      type metadata accessor for RemoteAlertRootViewController();
      unint64_t result = (void *)swift_dynamicCastClass();
      if (result) {
        return result;
      }
    }
    return 0;
  }
  return result;
}

void sub_10002BA08(void *a1)
{
  int v2 = v1;
  unsigned int v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x58))();
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [v4 windowScene];

    if (v6)
    {
      sub_10002B40C(0, &qword_10009CD38);
      id v7 = a1;
      char v8 = static NSObject.== infix(_:_:)();

      if (v8)
      {
        uint64_t v9 = *(void (**)(void))((swift_isaMask & *v2) + 0x60);
        v9(0);
      }
    }
  }
}

void sub_10002BB94(void *a1)
{
  uint64_t v3 = (*(uint64_t (**)(void))((swift_isaMask & *v1) + 0x70))();
  if (v3)
  {
    BOOL v10 = (void *)v3;
    self;
    uint64_t v4 = swift_dynamicCastObjCClass();
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = a1;
      id v7 = sub_10002BCCC(v5);
      id v8 = [objc_allocWithZone((Class)LACUIScenePresentationRequest) initWithUserInterfaceRequest:v7];

      (*(void (**)(id))((swift_isaMask & *v10) + 0x50))(v8);
      uint64_t v9 = v8;
    }
    else
    {
      uint64_t v9 = v10;
    }
  }
}

id sub_10002BCCC(void *a1)
{
  id v2 = [objc_allocWithZone((Class)LACUserInterfaceRequestCoder) init];
  id v3 = [a1 configurationContext];
  if (v3 && (uint64_t v4 = v3, v5 = [v3 userInfo], v4, v5))
  {
    static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
  }
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v7 = [v2 decode:isa];

  if (!v7) {
    id v7 = [self unknownInstance];
  }

  return v7;
}

void sub_10002BF54(uint64_t a1, uint64_t a2)
{
  sub_10002BFF8(a2);
  if (v3)
  {
    uint64_t v4 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *v2) + 0x70))();
    if (v4)
    {
      id v5 = v4;
      [v4 handleSceneButton:0];
    }
  }
}

void sub_10002BFF8(uint64_t a1)
{
  uint64_t v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    __CocoaSet.makeIterator()();
    sub_10002B40C(0, &qword_10009CDC8);
    sub_10002C6B0();
    Set.Iterator.init(_cocoa:)();
    uint64_t v1 = v18;
    uint64_t v17 = v19;
    uint64_t v2 = v20;
    uint64_t v3 = v21;
    unint64_t v4 = v22;
  }
  else
  {
    uint64_t v5 = -1 << *(unsigned char *)(a1 + 32);
    uint64_t v17 = a1 + 56;
    uint64_t v2 = ~v5;
    uint64_t v6 = -v5;
    if (v6 < 64) {
      uint64_t v7 = ~(-1 << v6);
    }
    else {
      uint64_t v7 = -1;
    }
    unint64_t v4 = v7 & *(void *)(a1 + 56);
    swift_bridgeObjectRetain();
    uint64_t v3 = 0;
  }
  int64_t v16 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    uint64_t v12 = v3;
    if ((v1 & 0x8000000000000000) == 0) {
      break;
    }
    if (!__CocoaSet.Iterator.next()()) {
      goto LABEL_31;
    }
    sub_10002B40C(0, &qword_10009CDC8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    id v10 = v23;
    swift_unknownObjectRelease();
    if (!v23) {
      goto LABEL_31;
    }
LABEL_10:
    unsigned __int8 v11 = [v10 events];

    if ((v11 & 0x10) != 0) {
      goto LABEL_31;
    }
  }
  if (v4)
  {
    unint64_t v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    unint64_t v9 = v8 | (v3 << 6);
LABEL_9:
    id v10 = *(id *)(*(void *)(v1 + 48) + 8 * v9);
    if (!v10) {
      goto LABEL_31;
    }
    goto LABEL_10;
  }
  int64_t v13 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v13 >= v16) {
      goto LABEL_31;
    }
    unint64_t v14 = *(void *)(v17 + 8 * v13);
    ++v3;
    if (!v14)
    {
      uint64_t v3 = v12 + 2;
      if (v12 + 2 >= v16) {
        goto LABEL_31;
      }
      unint64_t v14 = *(void *)(v17 + 8 * v3);
      if (!v14)
      {
        uint64_t v3 = v12 + 3;
        if (v12 + 3 >= v16) {
          goto LABEL_31;
        }
        unint64_t v14 = *(void *)(v17 + 8 * v3);
        if (!v14)
        {
          uint64_t v3 = v12 + 4;
          if (v12 + 4 >= v16) {
            goto LABEL_31;
          }
          unint64_t v14 = *(void *)(v17 + 8 * v3);
          if (!v14)
          {
            uint64_t v3 = v12 + 5;
            if (v12 + 5 >= v16) {
              goto LABEL_31;
            }
            unint64_t v14 = *(void *)(v17 + 8 * v3);
            if (!v14)
            {
              uint64_t v15 = v12 + 6;
              while (v16 != v15)
              {
                unint64_t v14 = *(void *)(v17 + 8 * v15++);
                if (v14)
                {
                  uint64_t v3 = v15 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_10002C718();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    unint64_t v4 = (v14 - 1) & v14;
    unint64_t v9 = __clz(__rbit64(v14)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

id sub_10002C3E8()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id sub_10002C41C()
{
  *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUI24RemoteAlertSceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [super init];
}

id sub_10002C4A8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertSceneDelegate();
  return [super dealloc];
}

void sub_10002C4EC(void *a1)
{
  objc_super v2 = v1;
  self;
  uint64_t v4 = swift_dynamicCastObjCClass();
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    id v6 = a1;
    [v5 setDesiredHardwareButtonEvents:16];
    type metadata accessor for SecureWindow();
    id v14 = v6;
    id v7 = sub_100031B18(v5);
    uint64_t v8 = (*(uint64_t (**)(id))((swift_isaMask & *v2) + 0x60))(v7);
    unint64_t v9 = *(uint64_t (**)(void))((swift_isaMask & *v2) + 0x58);
    uint64_t v10 = ((uint64_t (*)(uint64_t))v9)(v8);
    if (v10)
    {
      unsigned __int8 v11 = (void *)v10;
      type metadata accessor for RemoteAlertRootViewController();
      id v12 = sub_10004B038((uint64_t)[objc_allocWithZone((Class)LACUISceneSpringBoardAdapter) initWithScene:v5]);
      [v11 setRootViewController:v12];
    }
    int64_t v13 = (void *)v9();
    [v13 makeKeyAndVisible];
  }
}

uint64_t type metadata accessor for RemoteAlertSceneDelegate()
{
  return self;
}

unint64_t sub_10002C6B0()
{
  unint64_t result = qword_10009CDD0;
  if (!qword_10009CDD0)
  {
    sub_10002B40C(255, &qword_10009CDC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009CDD0);
  }
  return result;
}

uint64_t sub_10002C718()
{
  return swift_release();
}

uint64_t sub_10002C720(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560((uint64_t *)&unk_10009CDE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_10002C788()
{
  uint64_t v0 = *(void *)sub_100048C74();

  return sub_100048C8C(v0);
}

id sub_10002C7C4()
{
  uint64_t v0 = self;
  id v1 = [v0 currentPasscode];
  id v2 = [v1 length];

  id v3 = [v0 currentPasscode];
  id v4 = [v3 type];

  BOOL v5 = v4 == (id)3;
  if (v2 == (id)NSNotFound.getter()) {
    id v6 = 0;
  }
  else {
    id v6 = v2;
  }
  id v7 = objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController);

  return [v7 initWithPasscodeLength:v6 alphanumeric:v5];
}

uint64_t sub_10002C890()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext);
  sub_10002E5EC(v1, *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext + 8));
  return v1;
}

void *sub_10002C8D0()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId);
  id v2 = v1;
  return v1;
}

uint64_t sub_10002C900()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy);
}

uint64_t sub_10002C910()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10002C920()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_10002C930()
{
  return 0;
}

uint64_t sub_10002C93C()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10002C98C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess();
  *(void *)(v4 + 8) = a2;
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_10002C9F8(void *a1))(uint64_t a1, char a2)
{
  id v3 = malloc(0x38uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  void v3[5] = v1;
  v3[6] = v4;
  uint64_t v5 = v1 + v4;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v7 = *(void *)(v5 + 8);
  v3[3] = Strong;
  void v3[4] = v7;
  return sub_10002CA80;
}

void sub_10002CA80(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  *(void *)(*(void *)(*(void *)a1 + 40) + *(void *)(*(void *)a1 + 48) + 8) = *(void *)(*(void *)a1 + 32);
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

id sub_10002CB08()
{
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options);
  LODWORD(v6) = 1004;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v1 + 16) && (unint64_t v2 = sub_10002A9F0((uint64_t)v7), (v3 & 1) != 0))
  {
    sub_10002B158(*(void *)(v1 + 56) + 32 * v2, (uint64_t)&v8);
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
  }
  sub_10002AC8C((uint64_t)v7);
  if (!*((void *)&v9 + 1))
  {
    sub_10002F024((uint64_t)&v8, &qword_10009D580);
    return 0;
  }
  sub_10002B40C(0, (unint64_t *)&qword_10009CC10);
  if ((swift_dynamicCast() & 1) == 0) {
    return 0;
  }
  id v4 = [v6 unsignedIntegerValue];

  return v4;
}

uint64_t sub_10002CC18()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10002CC60(uint64_t a1)
{
  char v3 = (void *)(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_10002CCAC())()
{
  return j__swift_endAccess;
}

id sub_10002CD08(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v13 = objc_allocWithZone(v6);
  id v14 = sub_10002EC9C(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  sub_10002ADFC(a1, a2);
  return v14;
}

id sub_10002CD9C(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9 = sub_10002EC9C(a1, a2, a3, a4, a5, a6);
  swift_unknownObjectRelease();

  sub_10002ADFC(a1, a2);
  return v9;
}

id sub_10002CE28()
{
  uint64_t v1 = v0;
  id v2 = [objc_allocWithZone((Class)UIView) init];
  [v1 setView:v2];

  id result = [v1 view];
  if (!result)
  {
    __break(1u);
    goto LABEL_17;
  }
  id v4 = result;
  uint64_t v5 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController];
  id result = [v5 view];
  if (!result)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  id v6 = result;
  [v4 addSubview:result];

  id result = [v5 view];
  if (!result)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v7 = result;
  [result setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_100028560(&qword_10009CEB0);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10006BD10;
  id result = [v5 view];
  if (!result)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  id v9 = result;
  id v10 = [result leadingAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  unsigned __int8 v11 = result;
  id v12 = [result leadingAnchor];

  id v13 = [v10 constraintEqualToAnchor:v12 constant:10.0];
  *(void *)(v8 + 32) = v13;
  id result = [v5 view];
  if (!result)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v14 = result;
  id v15 = [result trailingAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  int64_t v16 = result;
  id v17 = [result trailingAnchor];

  id v18 = [v15 constraintEqualToAnchor:v17 constant:-10.0];
  *(void *)(v8 + 40) = v18;
  id result = [v5 view];
  if (!result)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v19 = result;
  id v20 = [result topAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v21 = result;
  id v22 = [result topAnchor];

  id v23 = [v20 constraintEqualToAnchor:v22];
  *(void *)(v8 + 48) = v23;
  id result = [v5 view];
  if (!result)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  v24 = result;
  id v25 = [result bottomAnchor];

  id result = [v1 view];
  if (!result)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  unint64_t v26 = result;
  id v27 = [result bottomAnchor];

  id v28 = [v25 constraintEqualToAnchor:v27];
  *(void *)(v8 + 56) = v28;
  id result = [v5 view];
  if (!result)
  {
LABEL_27:
    __break(1u);
    return result;
  }
  id v29 = result;
  v30 = self;
  id v31 = [v29 heightAnchor];

  id v32 = [v31 constraintEqualToConstant:80.0];
  *(void *)(v8 + 64) = v32;
  specialized Array._endMutation()();
  sub_10002B40C(0, (unint64_t *)&qword_10009CEB8);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v30 activateConstraints:isa];

  [v1 addChildViewController:v5];
  [v5 didMoveToParentViewController:v1];
  [v5 setDelegate:v1];

  return [v5 setPasscodeFocused:1];
}

void sub_10002D35C(char a1)
{
  v7.receiver = v1;
  v7.super_class = (Class)swift_getObjectType();
  [super viewWillAppear:a1 & 1];
  char v3 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter];
  uint64_t v4 = swift_allocObject();
  swift_unknownObjectWeakInit();
  void v6[4] = sub_10002F004;
  void v6[5] = v4;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10002DE44;
  v6[3] = &unk_100086FA0;
  uint64_t v5 = _Block_copy(v6);
  swift_release();
  [v3 currentBackoffErrorWithReply:v5];
  _Block_release(v5);
}

uint64_t sub_10002D464(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = __chkstk_darwin(v6);
  id v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v16 = result;
    sub_10002B40C(0, (unint64_t *)&qword_10009E060);
    swift_errorRetain();
    unsigned __int8 v11 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v12 = swift_allocObject();
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    *(void *)(v14 + 24) = a1;
    aBlock[4] = sub_10002F334;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100029A40;
    aBlock[3] = &unk_1000870E8;
    id v15 = _Block_copy(aBlock);
    swift_errorRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_10002F390((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v15);

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v16);
  }
  return result;
}

uint64_t sub_10002D78C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  unsigned __int8 v11 = (char *)v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)v47 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)v47 - v15;
  id v17 = (void *)_convertErrorToNSError(_:)();
  id v18 = [v17 userInfo];

  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v20 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (!*(void *)(v19 + 16) || (unint64_t v22 = sub_10002AAA8(v20, v21), (v23 & 1) == 0))
  {
    long long aBlock = 0u;
    long long v55 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_10002B158(*(void *)(v19 + 56) + 32 * v22, (uint64_t)&aBlock);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((void *)&v55 + 1))
  {
LABEL_9:
    sub_10002F024((uint64_t)&aBlock, &qword_10009D580);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    return sub_10002F024((uint64_t)v6, &qword_10009E000);
  }
  int v24 = swift_dynamicCast();
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, v24 ^ 1u, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1) {
    return sub_10002F024((uint64_t)v6, &qword_10009E000);
  }
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(v16, v6, v7);
  Date.init()();
  uint64_t v25 = Date.compare(_:)();
  unint64_t v26 = *(void (**)(char *, uint64_t))(v8 + 8);
  v26(v14, v7);
  if (v25 == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v16, v7);
    id v27 = v2;
    id v28 = Logger.logObject.getter();
    os_log_type_t v29 = static os_log_type_t.info.getter();
    int v30 = v29;
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v31 = swift_slowAlloc();
      id v52 = v26;
      uint64_t v32 = v31;
      uint64_t v51 = (void *)swift_slowAlloc();
      uint64_t v50 = swift_slowAlloc();
      uint64_t v53 = (uint64_t)v27;
      *(void *)&long long aBlock = v50;
      *(_DWORD *)uint64_t v32 = 138543618;
      int v49 = v30;
      v47[1] = v32 + 12;
      v47[2] = v32 + 4;
      v47[3] = &aBlock;
      NSString v33 = v27;
      os_log_t v48 = v28;
      id v34 = v33;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v51 = v27;

      *(_WORD *)(v32 + 12) = 2082;
      sub_10002F390(&qword_10009CEC0, (void (*)(uint64_t))&type metadata accessor for Date);
      uint64_t v35 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v53 = sub_10002E644(v35, v36, (uint64_t *)&aBlock);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v52(v11, v7);
      os_log_t v37 = v48;
      _os_log_impl((void *)&_mh_execute_header, v48, (os_log_type_t)v49, "%{public}@ is blocked until %{public}s", (uint8_t *)v32, 0x16u);
      sub_100028560(&qword_10009D280);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      unint64_t v26 = v52;
      swift_slowDealloc();
    }
    else
    {

      v26(v11, v7);
    }
    unint64_t v39 = *(void **)&v27[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController];
    Date.init()();
    Date.timeIntervalSince(_:)();
    double v41 = v40;
    v26(v14, v7);
    [v39 setBackoffTimeout:0 showBackoffTitle:1 passcodeFocused:v41];
    id v42 = self;
    uint64_t v43 = swift_allocObject();
    *(void *)(v43 + 16) = v27;
    *(void *)(v43 + 24) = a1;
    char v56 = sub_10002F0C0;
    uint64_t v57 = v43;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    *(void *)&long long v55 = sub_10002E0F8;
    *((void *)&v55 + 1) = &unk_100086FF0;
    id v44 = _Block_copy(&aBlock);
    uint64_t v45 = v27;
    swift_errorRetain();
    swift_release();
    id v46 = [v42 scheduledTimerWithTimeInterval:0 repeats:v44 block:1.0];
    _Block_release(v44);
  }
  else
  {
    [*(id *)&v2[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController] setBackoffTimeout:0 showBackoffTitle:1 passcodeFocused:0.0];
  }
  return ((uint64_t (*)(char *, uint64_t))v26)(v16, v7);
}

void sub_10002DE44(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

id sub_10002DF04(char a1)
{
  return [*(id *)(v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController) setPasscodeFocused:a1 & 1];
}

void sub_10002DF24(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  sub_10002F490(a1, a2, *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext), *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext + 8), *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId), *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy), *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options), a3, a4, ObjectType, (uint64_t)&off_100087018);
}

void sub_10002E0F8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_10002E160(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 8))(a1, ObjectType, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10002E1F0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v3 = *(void *)(v1 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(ObjectType, v3);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10002E26C(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 24))(a1, ObjectType, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10002E2FC(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate;
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v5 = *(void *)(v3 + 8);
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 32))(a1, ObjectType, v5);
    return swift_unknownObjectRelease();
  }
  return result;
}

void sub_10002E38C()
{
}

id sub_10002E4C4()
{
  return sub_10002CB08();
}

uint64_t (*sub_10002E4E0())()
{
  return j_j__swift_endAccess;
}

void sub_10002E540(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (*a8)(void), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t ObjectType = swift_getObjectType();

  sub_10002F490(a1, a2, a3, a4, a5, a6, a7, a8, a9, ObjectType, a11);
}

uint64_t sub_10002E5EC(uint64_t a1, unint64_t a2)
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

uint64_t sub_10002E644(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10002E718(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10002B158((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10002B158((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_10002A3EC((uint64_t)v12);
  return v7;
}

uint64_t sub_10002E718(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        uint64_t v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (void *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_10002E8D4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0) {
    goto LABEL_13;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    uint64_t v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0) {
    return 0;
  }
  else {
    return swift_unknownObjectRetain();
  }
}

uint64_t sub_10002E8D4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_10002E96C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_10002EB4C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10002EB4C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_10002E96C(uint64_t a1, unint64_t a2)
{
  if ((a2 & 0x1000000000000000) != 0) {
    goto LABEL_10;
  }
  if ((a2 & 0x2000000000000000) != 0) {
    uint64_t v2 = HIBYTE(a2) & 0xF;
  }
  else {
    uint64_t v2 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v2)
  {
    while (1)
    {
      unint64_t v3 = sub_10002EAE4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_10002EAE4(uint64_t a1, uint64_t a2)
{
  if (a2 <= a1) {
    uint64_t v2 = a1;
  }
  else {
    uint64_t v2 = a2;
  }
  if (!v2) {
    return &_swiftEmptyArrayStorage;
  }
  sub_100028560((uint64_t *)&unk_10009D3E0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_10002EB4C(char a1, int64_t a2, char a3, char *a4)
{
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  int64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    int64_t v9 = *((void *)a4 + 2);
  }
  else {
    int64_t v9 = v7;
  }
  if (v9)
  {
    sub_100028560((uint64_t *)&unk_10009D3E0);
    uint64_t v10 = (char *)swift_allocObject();
    size_t v11 = j__malloc_size(v10);
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v12 = v10 + 32;
  uint64_t v13 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v12 >= &v13[v8]) {
      memmove(v12, v13, v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10002EC9C(uint64_t a1, unint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = v6;
  uint64_t v13 = sub_100048C74();
  sub_100048C8C(*v13);
  uint64_t v14 = self;
  id v15 = [v14 currentPasscode];
  id v16 = [v15 length];

  id v17 = [v14 currentPasscode];
  id v18 = [v17 type];

  if (v16 == (id)NSNotFound.getter()) {
    id v16 = 0;
  }
  uint64_t v19 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController;
  *(void *)&v12[v19] = [objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController) initWithPasscodeLength:v16 alphanumeric:v18 == (id)3];
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures] = 0;
  uint64_t v20 = (uint64_t *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_externalizedContext];
  uint64_t *v20 = a1;
  v20[1] = a2;
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_userId] = a3;
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_policy] = a4;
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_options] = a5;
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_backoffCounter] = a6;
  sub_10002E5EC(a1, a2);
  id v21 = a3;
  swift_unknownObjectRetain();

  v25.receiver = v12;
  v25.super_class = ObjectType;
  return [super initWithNibName:0 bundle:0];
}

void sub_10002EE78()
{
  uint64_t v1 = sub_100048C74();
  sub_100048C8C(*v1);
  uint64_t v2 = self;
  id v3 = [v2 currentPasscode];
  id v4 = [v3 length];

  id v5 = [v2 currentPasscode];
  id v6 = [v5 type];

  BOOL v7 = v6 == (id)3;
  if (v4 == (id)NSNotFound.getter()) {
    id v8 = 0;
  }
  else {
    id v8 = v4;
  }
  uint64_t v9 = OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_passcodeController;
  *(void *)&v0[v9] = [objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController) initWithPasscodeLength:v8 alphanumeric:v7];
  *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_failures] = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_10002EFCC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F004(uint64_t a1)
{
  return sub_10002D464(a1);
}

uint64_t sub_10002F00C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002F01C()
{
  return swift_release();
}

uint64_t sub_10002F024(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100028560(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_10002F080()
{
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10002F0C0()
{
  return sub_10002D78C(*(void *)(v0 + 24));
}

uint64_t sub_10002F0E8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002F110()
{
  return type metadata accessor for PasscodeAlertContentViewController();
}

uint64_t type metadata accessor for PasscodeAlertContentViewController()
{
  uint64_t result = qword_10009E480;
  if (!qword_10009E480) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10002F164()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void type metadata accessor for LAPolicy()
{
  if (!qword_10009E160)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10009E160);
    }
  }
}

uint64_t sub_10002F2A0()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F2D8(char a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(v1 + 16) + 16))(*(void *)(v1 + 16), a1 & 1);
}

uint64_t sub_10002F2F4()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10002F334()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_10002D78C(v1);
  }
}

uint64_t sub_10002F390(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_10002F3D8()
{
  unint64_t result = qword_10009D6A0;
  if (!qword_10009D6A0)
  {
    sub_10002F434((uint64_t *)&unk_10009E070);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D6A0);
  }
  return result;
}

uint64_t sub_10002F434(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void sub_10002F490(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, void *a5, uint64_t a6, uint64_t a7, void (*a8)(void), uint64_t a9, uint64_t a10, uint64_t a11)
{
  uint64_t v46 = a6;
  uint64_t v47 = a3;
  unint64_t v48 = a4;
  int v49 = a5;
  uint64_t v50 = a10;
  uint64_t v51 = a8;
  uint64_t v12 = type metadata accessor for String.Encoding();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  id v15 = (char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = [self sharedInstance];
  if (v16)
  {
    id v17 = v16;
    uint64_t v44 = a7;
    uint64_t v45 = a9;
    id v18 = objc_allocWithZone((Class)LACSecureData);
    swift_bridgeObjectRetain();
    NSString v19 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v20 = [v18 initWithString:v19];

    uint64_t v21 = swift_allocObject();
    *(_DWORD *)(v21 + 16) = 0;
    if ([self isSharedIPad])
    {
      static String.Encoding.utf8.getter();
      uint64_t v22 = String.data(using:allowLossyConversion:)();
      unint64_t v24 = v23;
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      if (v24 >> 60 == 15)
      {
        Class isa = 0;
      }
      else
      {
        Class isa = Data._bridgeToObjectiveC()().super.isa;
        sub_10002FEA4(v22, v24);
      }
      int v29 = MKBUnlockDevice();

      *(_DWORD *)(v21 + 16) = v29;
    }
    uint64_t v30 = v50;
    id v43 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(a11 + 8))(v50, a11);
    uint64_t v31 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v32 = (void *)swift_allocObject();
    v32[2] = v30;
    v32[3] = a11;
    NSString v33 = v51;
    v32[4] = v31;
    v32[5] = v33;
    uint64_t v34 = v46;
    v32[6] = v45;
    v32[7] = v21;
    v32[8] = v17;
    v32[9] = v20;
    uint64_t v35 = v47;
    unint64_t v36 = v48;
    v32[10] = v47;
    v32[11] = v36;
    os_log_t v37 = v49;
    v32[12] = v49;
    v32[13] = v34;
    v32[14] = v44;
    aBlock[4] = sub_10002FE44;
    aBlock[5] = v32;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002DE44;
    aBlock[3] = &unk_1000871B0;
    uint64_t v38 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    id v39 = v17;
    id v40 = v20;
    sub_10002E5EC(v35, v36);
    id v41 = v37;
    swift_bridgeObjectRetain();
    swift_release();
    [v43 currentBackoffErrorWithReply:v38];
    _Block_release(v38);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    unint64_t v26 = self;
    NSString v27 = String._bridgeToObjectiveC()();
    id v28 = [v26 internalErrorWithMessage:v27];

    if (v28)
    {
      (*(void (**)(id, uint64_t, uint64_t))(a11 + 64))(v28, v50, a11);

      v51(0);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_10002F8A4()
{
  return _swift_deallocObject(v0, 20, 7);
}

uint64_t sub_10002F8B4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10002F8EC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4, uint64_t a5, void *a6, void *a7, uint64_t a8, unint64_t a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14)
{
  uint64_t v50 = a6;
  uint64_t v51 = a8;
  unint64_t v48 = a7;
  uint64_t v49 = a5;
  long long v55 = a3;
  uint64_t v56 = a4;
  uint64_t v47 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v54 = *(void *)(v47 - 8);
  __chkstk_darwin(v47);
  id v16 = (char *)&v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = type metadata accessor for DispatchQoS();
  uint64_t v52 = *(void *)(v17 - 8);
  uint64_t v53 = v17;
  __chkstk_darwin(v17);
  NSString v19 = (char *)&v42 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  unint64_t v23 = (char *)&v42 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    unint64_t v24 = v55;
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      objc_super v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(a14 + 80);
      swift_errorRetain();
      v25(a1, a13, a14);
      swift_unknownObjectRelease();
    }
    else
    {
      swift_errorRetain();
    }
    v24(0);
    return swift_errorRelease();
  }
  else
  {
    uint64_t v45 = a12;
    uint64_t v44 = a11;
    id v43 = a10;
    unint64_t v42 = a9;
    sub_10002FEB8();
    (*(void (**)(char *, void, uint64_t))(v21 + 104))(v23, enum case for DispatchQoS.QoSClass.default(_:), v20);
    uint64_t v46 = static OS_dispatch_queue.global(qos:)();
    (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
    uint64_t v26 = swift_allocObject();
    swift_beginAccess();
    swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    NSString v27 = (void *)swift_allocObject();
    v27[2] = a13;
    v27[3] = a14;
    int v29 = v48;
    uint64_t v28 = v49;
    v27[4] = v26;
    v27[5] = v28;
    uint64_t v30 = v56;
    v27[6] = v55;
    v27[7] = v30;
    uint64_t v32 = v50;
    uint64_t v31 = v51;
    v27[8] = v50;
    v27[9] = v29;
    v27[10] = v31;
    v27[11] = a9;
    NSString v33 = v43;
    uint64_t v34 = v44;
    v27[12] = v43;
    v27[13] = v34;
    v27[14] = v45;
    aBlock[4] = sub_10002FF68;
    aBlock[5] = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002FE88;
    aBlock[3] = &unk_100087200;
    long long v55 = (void (*)(void))_Block_copy(aBlock);
    id v35 = v29;
    swift_retain();
    swift_retain();
    swift_retain();
    id v36 = v32;
    sub_10002E5EC(v31, v42);
    id v37 = v33;
    swift_bridgeObjectRetain();
    static DispatchQoS.unspecified.getter();
    uint64_t v57 = &_swiftEmptyArrayStorage;
    sub_1000305EC();
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    uint64_t v38 = v47;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    id v39 = v55;
    id v40 = (void *)v46;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v39);

    (*(void (**)(char *, uint64_t))(v54 + 8))(v16, v38);
    (*(void (**)(char *, uint64_t))(v52 + 8))(v19, v53);
    swift_release();
    return swift_release();
  }
}

uint64_t sub_10002FDD4()
{
  swift_release();
  swift_release();
  swift_release();

  sub_10002ADFC(*(void *)(v0 + 80), *(void *)(v0 + 88));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 120, 7);
}

uint64_t sub_10002FE44(uint64_t a1)
{
  return sub_10002F8EC(a1, *(void *)(v1 + 32), *(void (**)(void))(v1 + 40), *(void *)(v1 + 48), *(void *)(v1 + 56), *(void **)(v1 + 64), *(void **)(v1 + 72), *(void *)(v1 + 80), *(void *)(v1 + 88), *(void **)(v1 + 96), *(void *)(v1 + 104), *(void *)(v1 + 112), *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_10002FE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10002FE9C()
{
  return swift_release();
}

uint64_t sub_10002FEA4(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10002ADFC(a1, a2);
  }
  return a1;
}

unint64_t sub_10002FEB8()
{
  unint64_t result = qword_10009E060;
  if (!qword_10009E060)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10009E060);
  }
  return result;
}

uint64_t sub_10002FEF8()
{
  swift_release();
  swift_release();
  swift_release();

  sub_10002ADFC(*(void *)(v0 + 80), *(void *)(v0 + 88));
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 120, 7);
}

void sub_10002FF68()
{
  uint64_t v34 = v0[2];
  uint64_t v35 = v0[3];
  uint64_t v1 = v0[5];
  uint64_t v2 = (void *)v0[8];
  uint64_t v32 = (void (*)(uint64_t))v0[6];
  uint64_t v33 = v0[7];
  uint64_t v3 = v0[9];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    if ([self isSharedIPad])
    {
      swift_beginAccess();
      int v6 = *(_DWORD *)(v1 + 16);
      if (v6 == -14 || v6 == -3)
      {
        uint64_t v9 = v34;
        uint64_t v8 = v35;
        goto LABEL_14;
      }
      if (v6)
      {
        uint64_t v9 = v34;
        uint64_t v8 = v35;
        goto LABEL_21;
      }
    }
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    uint64_t v11 = nullsub_15(v5);
    Class v12 = Dictionary._bridgeToObjectiveC()().super.isa;
    id v13 = [v2 verifyPasswordUsingAKS:v3 acmContext:isa userId:v4 policy:v11 options:v12 bioLockoutRecovery:0];

    if (v13 == (id)2)
    {
      (*(void (**)(uint64_t, uint64_t))(v35 + 56))(v34, v35);
      unint64_t v24 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8))(v34, v35);
      uint64_t v25 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v26 = (void *)swift_allocObject();
      v26[2] = v34;
      v26[3] = v35;
      v26[4] = v25;
      v26[5] = v32;
      v26[6] = v33;
      id v40 = sub_100030C74;
      id v41 = v26;
      uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
      unint64_t v37 = 1107296256;
      uint64_t v38 = sub_10002DE44;
      id v39 = &unk_100087250;
      unint64_t v23 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
      [v24 actionBackoffWithReply:v23, v32, v33];
      goto LABEL_19;
    }
    uint64_t v9 = v34;
    uint64_t v8 = v35;
    if (v13 != (id)1)
    {
      if (!v13)
      {
        [*(uint64_t (**)(uint64_t, uint64_t))(v35 + 8)(v34, v35) actionSuccess];
        swift_unknownObjectRelease();
        sub_100028560(&qword_10009CD00);
        uint64_t inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_10006BB30;
        uint64_t aBlock = 0x746C75736552;
        unint64_t v37 = 0xE600000000000000;
        AnyHashable.init<A>(_:)();
        unint64_t v15 = sub_10002B334((uint64_t)&off_100087110);
        *(void *)(inited + 96) = sub_100028560(&qword_10009CD08);
        *(void *)(inited + 72) = v15;
        sub_1000295F8(inited);
        (*(void (**)(void))(v35 + 48))();
        swift_bridgeObjectRelease();
        v32(1);
LABEL_26:
        swift_unknownObjectRelease();
        return;
      }
LABEL_21:
      (*(void (**)(uint64_t, uint64_t))(v8 + 56))(v9, v8);
      NSString v27 = self;
      NSString v28 = String._bridgeToObjectiveC()();
      id v29 = [v27 internalErrorWithMessage:v28];

      if (v29)
      {
        (*(void (**)(id, uint64_t, uint64_t))(v8 + 64))(v29, v9, v8);
LABEL_25:

        goto LABEL_26;
      }
      goto LABEL_29;
    }
LABEL_14:
    (*(void (**)(uint64_t, uint64_t))(v8 + 56))(v9, v8);
    id v16 = (void (*)(uint64_t *, void))(*(uint64_t (**)(uint64_t *, uint64_t, uint64_t))(v8 + 40))(&aBlock, v9, v8);
    if (*v17 == -1)
    {
      __break(1u);
LABEL_29:
      __break(1u);
      goto LABEL_30;
    }
    ++*v17;
    v16(&aBlock, 0);
    unint64_t v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 16))(v9, v8);
    if ((v19 & 1) == 0 && (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 24))(v9, v8) >= v18)
    {
      uint64_t v30 = self;
      NSString v31 = String._bridgeToObjectiveC()();
      id v29 = [v30 errorWithCode:-1 message:v31];

      if (v29)
      {
        (*(void (**)(id, uint64_t, uint64_t))(v8 + 72))(v29, v9, v8);
        goto LABEL_25;
      }
LABEL_30:
      __break(1u);
      return;
    }
    uint64_t v20 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v9, v8);
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v22 = (void *)swift_allocObject();
    v22[2] = v9;
    v22[3] = v8;
    v22[4] = v21;
    v22[5] = v32;
    v22[6] = v33;
    id v40 = sub_100030CD0;
    id v41 = v22;
    uint64_t aBlock = (uint64_t)_NSConcreteStackBlock;
    unint64_t v37 = 1107296256;
    uint64_t v38 = sub_10002DE44;
    id v39 = &unk_1000872A0;
    unint64_t v23 = _Block_copy(&aBlock);
    swift_retain();
    swift_release();
    [v20 actionFailureWithReply:v23, v32, v33];
LABEL_19:
    _Block_release(v23);
    swift_unknownObjectRelease();
    goto LABEL_26;
  }
}

unint64_t sub_1000305EC()
{
  unint64_t result = qword_10009D690;
  if (!qword_10009D690)
  {
    type metadata accessor for DispatchWorkItemFlags();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D690);
  }
  return result;
}

uint64_t sub_100030644(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v22 = a3;
  uint64_t v23 = a6;
  uint64_t v9 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v26 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = type metadata accessor for DispatchQoS();
  uint64_t v12 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002FEB8();
  uint64_t v24 = static OS_dispatch_queue.main.getter();
  uint64_t v15 = swift_allocObject();
  swift_beginAccess();
  swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();
  swift_unknownObjectRelease();
  id v16 = (void *)swift_allocObject();
  uint64_t v17 = v23;
  v16[2] = a5;
  v16[3] = v17;
  uint64_t v18 = v22;
  v16[4] = a1;
  v16[5] = v18;
  v16[6] = a4;
  v16[7] = v15;
  aBlock[4] = sub_100030D48;
  aBlock[5] = v16;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100029A40;
  aBlock[3] = &unk_1000872F0;
  char v19 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000305EC();
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v20 = (void *)v24;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v19);

  (*(void (**)(char *, uint64_t))(v26 + 8))(v11, v9);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v25);
}

uint64_t sub_100030944(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v11 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t result = __chkstk_darwin(v15);
  char v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v24 = a5;
    uint64_t v28 = result;
    uint64_t v26 = v17;
    sub_10002FEB8();
    swift_errorRetain();
    uint64_t v27 = static OS_dispatch_queue.main.getter();
    uint64_t v20 = swift_allocObject();
    uint64_t v25 = v12;
    swift_beginAccess();
    swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();
    swift_unknownObjectRelease();
    uint64_t v21 = (void *)swift_allocObject();
    v21[2] = v24;
    void v21[3] = a6;
    v21[4] = v20;
    v21[5] = a1;
    v21[6] = a3;
    v21[7] = a4;
    aBlock[4] = sub_100030E70;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100029A40;
    aBlock[3] = &unk_100087340;
    uint64_t v22 = _Block_copy(aBlock);
    swift_errorRetain();
    swift_retain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000305EC();
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v23 = (void *)v27;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v22);

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v14, v11);
    return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v19, v28);
  }
  return result;
}

uint64_t sub_100030C74(uint64_t a1)
{
  return sub_100030CE8(a1, sub_100030944);
}

uint64_t sub_100030C90()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100030CD0(uint64_t a1)
{
  return sub_100030CE8(a1, sub_100030644);
}

uint64_t sub_100030CE8(uint64_t a1, uint64_t (*a2)(uint64_t, void, void, void, void, void))
{
  return a2(a1, v2[4], v2[5], v2[6], v2[2], v2[3]);
}

uint64_t sub_100030D00()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100030D48()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (uint64_t (*)(void))v0[5];
  if (!v1) {
    return v2(0);
  }
  uint64_t v3 = v0[2];
  uint64_t v4 = v0[3];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 80);
    swift_errorRetain();
    v5(v1, v3, v4);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_errorRetain();
  }
  v2(0);
  return swift_errorRelease();
}

uint64_t sub_100030E28()
{
  swift_release();
  swift_errorRelease();
  swift_release();

  return _swift_deallocObject(v0, 64, 7);
}

uint64_t sub_100030E70()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = v0[5];
  uint64_t v4 = (uint64_t (*)(void))v0[6];
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 80))(v3, v1, v2);
    swift_unknownObjectRelease();
  }
  return v4(0);
}

id sub_100030F94()
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = (uint64_t *)&v0[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  uint64_t v3 = *(void (**)(char *))&v0[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  if (v3)
  {
    swift_retain();
    v3(v0);
    sub_10002A998((uint64_t)v3);
    uint64_t v4 = *v2;
    uint64_t *v2 = 0;
    v2[1] = 0;
    sub_10002A998(v4);
  }
  v6.receiver = v0;
  v6.super_class = ObjectType;
  return [super dealloc];
}

void sub_1000310F0()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  uint64_t v2 = *(void (**)(uint64_t))(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion);
  if (v2)
  {
    swift_retain();
    v2(v0);
    sub_10002A998((uint64_t)v2);
    uint64_t v3 = *v1;
    *uint64_t v1 = 0;
    v1[1] = 0;
    sub_10002A998(v3);
  }
}

id sub_100031178()
{
  id v0 = [self weakObjectsHashTable];

  return v0;
}

id sub_100031258()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for TerminationService()) init];
  qword_10009FBF8 = (uint64_t)result;
  return result;
}

uint64_t *sub_100031288()
{
  if (qword_10009E490 != -1) {
    swift_once();
  }
  return &qword_10009FBF8;
}

id sub_1000312D4()
{
  if (qword_10009E490 != -1) {
    swift_once();
  }
  swift_beginAccess();
  id v0 = (void *)qword_10009FBF8;

  return v0;
}

void sub_1000313D0(uint64_t a1)
{
  if (qword_10009E490 != -1) {
    swift_once();
  }
  swift_beginAccess();
  uint64_t v2 = (void *)qword_10009FBF8;
  qword_10009FBF8 = a1;
}

uint64_t (*sub_1000314D4())()
{
  if (qword_10009E490 != -1) {
    swift_once();
  }
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_10003155C()
{
  *(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) = 1;
  return sub_100031570();
}

id sub_100031570()
{
  uint64_t v1 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  id result = [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions) count];
  if (!result && *(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_terminationScheduled) == 1)
  {
    sub_10002FEB8();
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for DispatchQoS.QoSClass.background(_:), v9);
    v16[0] = static OS_dispatch_queue.global(qos:)();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    aBlock[4] = sub_100031AB0;
    aBlock[5] = 0;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10002FE88;
    aBlock[3] = &unk_100087390;
    uint64_t v14 = _Block_copy(aBlock);
    static DispatchQoS.unspecified.getter();
    v16[1] = &_swiftEmptyArrayStorage;
    sub_1000305EC();
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v15 = (void *)v16[0];
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v14);

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return (id)(*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return result;
}

id sub_100031904()
{
  uint64_t v1 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v2 = (objc_class *)type metadata accessor for TerminateAssertion();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  uint64_t v4 = (void (**)(uint64_t))&v3[OBJC_IVAR____TtC10CoreAuthUI18TerminateAssertion_completion];
  char *v4 = sub_100031A18;
  v4[1] = (void (*)(uint64_t))v1;
  swift_retain_n();
  sub_10002A998(0);
  v7.receiver = v3;
  v7.super_class = v2;
  id v5 = [super init];
  swift_release_n();
  [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions) addObject:v5];
  return v5;
}

uint64_t sub_1000319E0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100031A18(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    [*(id *)(Strong + OBJC_IVAR____TtC10CoreAuthUI18TerminationService_assertions) removeObject:a1];
    sub_100031570();
  }
}

uint64_t type metadata accessor for TerminateAssertion()
{
  return self;
}

void sub_100031AB0()
{
}

uint64_t type metadata accessor for TerminationService()
{
  return self;
}

uint64_t sub_100031AF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100031B08()
{
  return swift_release();
}

id sub_100031B18(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithWindowScene:a1];

  return v3;
}

id sub_100031B5C(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  [super initWithWindowScene:a1];

  return v3;
}

uint64_t type metadata accessor for SecureWindow()
{
  return self;
}

id sub_100031C18(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithFrame:a1, a2, a3, a4];
}

id sub_100031C7C(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for SecureWindow();
  return [super initWithFrame:a1, a2, a3, a4];
}

id sub_100031D50(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id sub_100031DE8(double a1, double a2, double a3, double a4)
{
  id v9 = objc_allocWithZone(v4);

  return [v9 initWithContentRect:a1, a2, a3, a4];
}

id sub_100031E4C(double a1, double a2, double a3, double a4)
{
  v10.receiver = v4;
  v10.super_class = (Class)type metadata accessor for SecureWindow();
  return [super initWithContentRect:a1, a2, a3, a4];
}

id sub_100031F20()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SecureWindow();
  [super dealloc];
}

uint64_t sub_100031F54(unint64_t a1)
{
  if (a1 >= 7) {
    return 2;
  }
  else {
    return (0x1000100010202uLL >> (8 * a1));
  }
}

BOOL sub_100031F74(int a1, int a2)
{
  return ((a2 ^ a1) & 1) == 0;
}

void sub_100031F84(uint64_t a1, char a2)
{
}

Swift::Int sub_100031FAC(char a1)
{
  return Hasher._finalize()();
}

BOOL sub_100031FF4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

Swift::Int sub_10003200C()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_100032054()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_100032080()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

unint64_t sub_1000320C8()
{
  unint64_t result = qword_10009E1A0;
  if (!qword_10009E1A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009E1A0);
  }
  return result;
}

unsigned char *initializeBufferWithCopyOfBuffer for AuthenticationFallbackMethod(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for AuthenticationFallbackMethod(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for AuthenticationFallbackMethod(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *unint64_t result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x100032284);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *unint64_t result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_1000322AC(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_1000322B4(unsigned char *result, char a2)
{
  *unint64_t result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationFallbackMethod()
{
  return &type metadata for AuthenticationFallbackMethod;
}

void *sub_1000322D0()
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) == 0 || !_CocoaArrayWrapper.endIndex.getter()) {
    return &_swiftEmptySetSingleton;
  }
  return (void *)sub_100033A20((unint64_t)&_swiftEmptyArrayStorage);
}

id sub_100032328(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = (char *)objc_allocWithZone(v2);
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    unsigned int v6 = (void *)sub_100033A20((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    unsigned int v6 = &_swiftEmptySetSingleton;
  }
  *(void *)&v5[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v6;
  BOOL v7 = &v5[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  *(void *)BOOL v7 = a1;
  *((void *)v7 + 1) = a2;
  swift_unknownObjectRetain();

  v10.receiver = v5;
  v10.super_class = v2;
  [super initWithNibName:0 bundle:0];
  swift_unknownObjectRelease();
  return v8;
}

id sub_1000323F8(uint64_t a1, uint64_t a2)
{
  int v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  BOOL v7 = v3;
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    id v8 = (void *)sub_100033A20((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    id v8 = &_swiftEmptySetSingleton;
  }
  *(void *)&v7[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v8;
  id v9 = &v7[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel];
  *(void *)id v9 = a1;
  *((void *)v9 + 1) = a2;
  swift_unknownObjectRetain();

  v12.receiver = v7;
  v12.super_class = ObjectType;
  id v10 = [super initWithNibName:0 bundle:0];
  swift_unknownObjectRelease();
  return v10;
}

void sub_1000324D0()
{
  if (((unint64_t)&_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && _CocoaArrayWrapper.endIndex.getter()) {
    Swift::UInt v1 = (void *)sub_100033A20((unint64_t)&_swiftEmptyArrayStorage);
  }
  else {
    Swift::UInt v1 = &_swiftEmptySetSingleton;
  }
  *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_cancellables] = v1;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

uint64_t sub_100032634()
{
  v4.receiver = v0;
  v4.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  id v1 = [v0 interactivePopGestureRecognizer];
  if (v1)
  {
    int v2 = v1;
    [v1 setEnabled:0];
  }
  [v0 setNavigationBarHidden:1 animated:0];
  return sub_1000326C4();
}

uint64_t sub_1000326C4()
{
  uint64_t v33 = sub_100028560(&qword_10009D018);
  __chkstk_darwin(v33);
  int v2 = (char *)&v28 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100028560(&qword_10009D020);
  uint64_t v3 = __chkstk_darwin(v28);
  NSString v31 = (char *)&v28 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  id v29 = (char *)&v28 - v5;
  uint64_t v6 = sub_100028560(&qword_10009D028);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = sub_100028560(&qword_10009D030);
  uint64_t v32 = *(void *)(v30 - 8);
  __chkstk_darwin(v30);
  uint64_t v11 = (char *)&v28 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100028560(&qword_10009D038);
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v34 = v12;
  uint64_t v35 = v13;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v28 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel + 8);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v36 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 16))(ObjectType, v16);
  sub_100028560(&qword_10009D040);
  sub_100033E8C(&qword_10009D048, &qword_10009D040);
  sub_100034038(&qword_10009D050, (void (*)(uint64_t))type metadata accessor for RatchetCoolOffContentViewModelState);
  Publisher<>.removeDuplicates()();
  swift_release();
  sub_100033E8C(&qword_10009D058, &qword_10009D028);
  Publisher.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  uint64_t v18 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  char v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
  uint64_t v20 = (uint64_t)v29;
  v19(v29, 1, 1, v18);
  uint64_t v21 = (uint64_t)v31;
  v19(v31, 1, 1, v18);
  uint64_t v22 = (uint64_t)&v2[*(int *)(v33 + 48)];
  sub_100033CF8(v20, (uint64_t)v2);
  sub_100033CF8(v21, v22);
  sub_100033E8C(&qword_10009D060, &qword_10009D030);
  uint64_t v23 = v30;
  Publisher.scan<A>(_:_:)();
  sub_10002F024((uint64_t)v2, &qword_10009D018);
  (*(void (**)(char *, uint64_t))(v32 + 8))(v11, v23);
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v25 = swift_allocObject();
  *(void *)(v25 + 16) = sub_100033D98;
  *(void *)(v25 + 24) = v24;
  sub_100033E8C(&qword_10009D068, &qword_10009D038);
  uint64_t v26 = v34;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v35 + 8))(v15, v26);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  return swift_release();
}

id sub_100032D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = a2;
  if (a1)
  {
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    if (!v3) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  uint64_t ObjCClassFromMetadata = 0;
  if (a2) {
LABEL_3:
  }
    uint64_t v3 = swift_getObjCClassFromMetadata();
LABEL_4:
  id v5 = objc_allocWithZone(v2);

  return [v5 initWithNavigationBarClass:ObjCClassFromMetadata toolbarClass:v3];
}

void sub_100032DC4()
{
}

id sub_100032E24(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithRootViewController:a1];

  return v3;
}

void sub_100032E68()
{
}

void sub_100032ECC()
{
}

uint64_t sub_100032F7C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_100033FD4(a1, a2);
  uint64_t v3 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  uint64_t v4 = *(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v3 - 8) + 56);

  return v4(a2, 0, 1, v3);
}

uint64_t sub_100032FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_100028560(&qword_10009D018);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  id v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(int *)(v7 + 56);
  uint64_t v11 = a3 + v10;
  uint64_t v12 = (uint64_t)&v9[v10];
  uint64_t v13 = a1 + v10;
  sub_100033ED0(a1, (uint64_t)v9);
  sub_100033ED0(v13, v12);
  sub_100033CF8(v12, a3);
  sub_100033ED0(a2, v11);
  return sub_10002F024((uint64_t)v9, &qword_10009D020);
}

void sub_1000330CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D020);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  long long v55 = (char *)&v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  id v9 = (char *)&v55 - v8;
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v55 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v55 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v55 - v16;
  uint64_t v18 = sub_100028560(&qword_10009D018);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v55 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v58 = *(void *)(v60 - 8);
  uint64_t v22 = __chkstk_darwin(v60);
  uint64_t v57 = (char *)&v55 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = (char *)&v55 - v25;
  __chkstk_darwin(v24);
  uint64_t v56 = (char *)&v55 - v27;
  uint64_t v28 = (uint64_t)&v21[*(int *)(v19 + 56)];
  sub_100033ED0(a1, (uint64_t)v21);
  sub_100033ED0(a2, v28);
  uint64_t v29 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  uint64_t v30 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v29 - 8) + 48);
  if (v30(v28, 1, v29) == 1)
  {
    sub_10002F024((uint64_t)v21, &qword_10009D018);
    return;
  }
  sub_100033ED0(v28, (uint64_t)v17);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      unsigned int v34 = v30((uint64_t)v21, 1, v29);
      uint64_t v33 = v58;
      uint64_t v32 = v59;
      if (v34 == 1) {
        goto LABEL_18;
      }
      id v9 = v55;
      sub_100033ED0((uint64_t)v21, (uint64_t)v55);
      if (swift_getEnumCaseMultiPayload() != 1) {
        break;
      }
      goto LABEL_15;
    case 2u:
      unsigned int v35 = v30((uint64_t)v21, 1, v29);
      uint64_t v33 = v58;
      uint64_t v32 = v59;
      if (v35 == 1) {
        goto LABEL_18;
      }
      sub_100033ED0((uint64_t)v21, (uint64_t)v12);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        uint64_t v36 = v56;
        uint64_t v37 = v60;
        (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v56, v17, v60);
        uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
        v38(v12, v37);
        goto LABEL_22;
      }
      id v9 = v12;
      break;
    case 3u:
      unsigned int v39 = v30((uint64_t)v21, 1, v29);
      uint64_t v33 = v58;
      uint64_t v32 = v59;
      if (v39 == 1) {
        goto LABEL_18;
      }
      sub_100033ED0((uint64_t)v21, (uint64_t)v9);
      if (swift_getEnumCaseMultiPayload() != 3) {
        break;
      }
LABEL_15:
      uint64_t v36 = v56;
      uint64_t v37 = v60;
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v56, v17, v60);
      uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
      v38(v9, v37);
      goto LABEL_22;
    default:
      unsigned int v31 = v30((uint64_t)v21, 1, v29);
      uint64_t v33 = v58;
      uint64_t v32 = v59;
      if (v31 == 1) {
        goto LABEL_18;
      }
      sub_100033ED0((uint64_t)v21, (uint64_t)v15);
      if (!swift_getEnumCaseMultiPayload())
      {
        uint64_t v47 = v56;
        uint64_t v37 = v60;
        (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v56, v17, v60);
        uint64_t v38 = *(void (**)(char *, uint64_t))(v33 + 8);
        unint64_t v48 = v15;
        uint64_t v36 = v47;
        v38(v48, v37);
LABEL_22:
        sub_10002F024(v28, &qword_10009D020);
        sub_10002F024((uint64_t)v21, &qword_10009D020);
        id v49 = [v32 viewControllers];
        sub_100033F38();
        unint64_t v50 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

        if (v50 >> 62)
        {
          swift_bridgeObjectRetain();
          uint64_t v51 = _CocoaArrayWrapper.endIndex.getter();
          swift_bridgeObjectRelease();
          if (v51)
          {
LABEL_24:
            unint64_t v52 = v51 - 1;
            if (__OFSUB__(v51, 1))
            {
              __break(1u);
            }
            else if ((v50 & 0xC000000000000001) == 0)
            {
              if ((v52 & 0x8000000000000000) != 0)
              {
                __break(1u);
              }
              else if (v52 < *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10))
              {
                id v53 = *(id *)(v50 + 8 * v52 + 32);
LABEL_29:
                uint64_t v54 = v53;
                swift_bridgeObjectRelease();
                type metadata accessor for LACUIDTOViewController();
                if (swift_dynamicCastClass()) {
                  dispatch thunk of LACUIDTOViewController.refresh(with:)();
                }

                goto LABEL_35;
              }
              __break(1u);
              JUMPOUT(0x100033828);
            }
            id v53 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
            goto LABEL_29;
          }
        }
        else
        {
          uint64_t v51 = *(void *)((v50 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (v51) {
            goto LABEL_24;
          }
        }
        swift_bridgeObjectRelease();
LABEL_35:
        v38(v36, v37);
        return;
      }
      id v9 = v15;
      break;
  }
  sub_100033F78((uint64_t)v9);
LABEL_18:
  id v40 = v17;
  uint64_t v41 = v60;
  (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v26, v40, v60);
  sub_10002F024(v28, &qword_10009D020);
  sub_10002F024((uint64_t)v21, &qword_10009D020);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(v57, v26, v41);
  id v42 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOViewController());
  swift_unknownObjectRetain();
  id v43 = (void *)LACUIDTOViewController.init(configuration:handler:)();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v26, v41);
  id v44 = [v32 viewControllers];
  sub_100033F38();
  unint64_t v45 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v45 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v46 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  [v32 pushViewController:v43 animated:v46 != 0];
}

id sub_100033838(uint64_t a1)
{
  return [v1 didMoveToParentViewController:a1];
}

id sub_100033858(void *a1)
{
  [a1 addChildViewController:v1];

  return [v1 willMoveToParentViewController:a1];
}

uint64_t sub_100033920(double a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC10CoreAuthUI35RatchetCoolOffContentViewController_viewModel + 8);
  uint64_t ObjectType = swift_getObjectType();
  return (*(uint64_t (**)(uint64_t, uint64_t, double))(v3 + 24))(ObjectType, v3, a1);
}

uint64_t sub_100033A18()
{
  return 1;
}

unint64_t sub_100033A20(unint64_t result)
{
  unint64_t v1 = result;
  unint64_t v2 = result >> 62;
  if (result >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = _CocoaArrayWrapper.endIndex.getter();
    unint64_t result = swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_100028560(&qword_10009D078);
      unint64_t result = static _SetStorage.allocate(capacity:)();
      uint64_t v3 = (unsigned char *)result;
      uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = _CocoaArrayWrapper.endIndex.getter();
      unint64_t result = swift_bridgeObjectRelease();
      if (!v5) {
        return (unint64_t)v3;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((result & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = v1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return (unint64_t)v3;
  }
LABEL_9:
  unint64_t v7 = 0;
  uint64_t v8 = v3 + 56;
  unint64_t v21 = v1 & 0xC000000000000001;
  unint64_t v19 = v1 + 32;
  uint64_t v20 = v1 & 0xFFFFFFFFFFFFFF8;
  while (v21)
  {
    unint64_t result = specialized _ArrayBuffer._getElementSlowPath(_:)();
    unint64_t v9 = result;
    BOOL v10 = __OFADD__(v7++, 1);
    if (v10) {
      goto LABEL_25;
    }
LABEL_18:
    type metadata accessor for AnyCancellable();
    sub_100034038(&qword_10009D080, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
    unint64_t result = dispatch thunk of Hashable._rawHashValue(seed:)();
    uint64_t v11 = -1 << v3[32];
    unint64_t v12 = result & ~v11;
    unint64_t v13 = v12 >> 6;
    uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
    uint64_t v15 = 1 << v12;
    if (((1 << v12) & v14) != 0)
    {
      uint64_t v16 = ~v11;
      sub_100034038(&qword_10009D088, (void (*)(uint64_t))&type metadata accessor for AnyCancellable);
      while (1)
      {
        unint64_t result = dispatch thunk of static Equatable.== infix(_:_:)();
        if (result) {
          break;
        }
        unint64_t v12 = (v12 + 1) & v16;
        unint64_t v13 = v12 >> 6;
        uint64_t v14 = *(void *)&v8[8 * (v12 >> 6)];
        uint64_t v15 = 1 << v12;
        if ((v14 & (1 << v12)) == 0) {
          goto LABEL_22;
        }
      }
      unint64_t result = swift_release();
    }
    else
    {
LABEL_22:
      *(void *)&v8[8 * v13] = v15 | v14;
      *(void *)(*((void *)v3 + 6) + 8 * v12) = v9;
      uint64_t v17 = *((void *)v3 + 2);
      BOOL v10 = __OFADD__(v17, 1);
      uint64_t v18 = v17 + 1;
      if (v10) {
        goto LABEL_26;
      }
      *((void *)v3 + 2) = v18;
    }
    if (v7 == v5) {
      return (unint64_t)v3;
    }
  }
  if (v7 >= *(void *)(v20 + 16)) {
    goto LABEL_27;
  }
  unint64_t v9 = *(void *)(v19 + 8 * v7);
  unint64_t result = swift_retain();
  BOOL v10 = __OFADD__(v7++, 1);
  if (!v10) {
    goto LABEL_18;
  }
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewController()
{
  return self;
}

uint64_t sub_100033CF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100033D60()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100033D98(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v5 = (void *)Strong;
    sub_1000330CC(a1, a2);
  }
}

uint64_t sub_100033E08()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100033E40(uint64_t a1)
{
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  uint64_t v4 = sub_100028560(&qword_10009D018);
  return v3(a1, a1 + *(int *)(v4 + 48));
}

uint64_t sub_100033E8C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F434(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100033ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D020);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_100033F38()
{
  unint64_t result = qword_10009D070;
  if (!qword_10009D070)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10009D070);
  }
  return result;
}

uint64_t sub_100033F78(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100033FD4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100034038(unint64_t *a1, void (*a2)(uint64_t))
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

void sub_100034080()
{
}

id sub_100034138(uint64_t a1, uint64_t a2)
{
  type metadata accessor for RatchetCoolOffContentViewModel(0);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v4 = sub_10003B050(a1, a2);
  type metadata accessor for RatchetCoolOffContentViewController();
  unint64_t v5 = sub_1000341B0();
  return sub_100032328((uint64_t)v4, v5);
}

unint64_t sub_1000341B0()
{
  unint64_t result = qword_10009D090;
  if (!qword_10009D090)
  {
    type metadata accessor for RatchetCoolOffContentViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D090);
  }
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffFactory()
{
  return self;
}

id sub_1000342F0()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for TransitionViewModel()) init];
  qword_10009FC00 = (uint64_t)result;
  return result;
}

uint64_t *sub_100034324()
{
  if (qword_10009E5A0 != -1) {
    swift_once();
  }
  return &qword_10009FC00;
}

id sub_100034370()
{
  if (qword_10009E5A0 != -1) {
    swift_once();
  }
  uint64_t v0 = (void *)qword_10009FC00;

  return v0;
}

id sub_100034428()
{
  id v0 = [self hashTableWithOptions:5];

  return v0;
}

id sub_1000344B8()
{
  uint64_t v1 = (void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  uint64_t v2 = *v1;

  return v2;
}

void sub_100034570(void *a1)
{
  uint64_t v3 = (void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  id v4 = *v3;
  unsigned char *v3 = a1;
}

uint64_t (*sub_1000345C4())()
{
  return j__swift_endAccess;
}

uint64_t sub_100034620(uint64_t a1)
{
  return sub_1000346AC(a1, &qword_10009D0C8);
}

uint64_t sub_10003462C()
{
  return sub_100034704();
}

uint64_t sub_100034640(uint64_t a1)
{
  return sub_1000346AC(a1, &qword_10009D130);
}

uint64_t sub_10003464C()
{
  return sub_100034704();
}

uint64_t sub_100034660(uint64_t a1)
{
  return sub_1000346AC(a1, &qword_10009D138);
}

uint64_t sub_10003466C()
{
  return sub_100034704();
}

uint64_t sub_100034680(uint64_t a1)
{
  return sub_1000346AC(a1, &qword_10009D1A0);
}

uint64_t sub_10003468C()
{
  return sub_100034704();
}

uint64_t sub_1000346A0(uint64_t a1)
{
  return sub_1000346AC(a1, &qword_10009D1A8);
}

uint64_t sub_1000346AC(uint64_t a1, uint64_t *a2)
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000346F0()
{
  return sub_100034704();
}

uint64_t sub_100034704()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100034770()
{
  return Published.init(initialValue:)();
}

uint64_t sub_1000347C0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100034838()
{
  return 0;
}

uint64_t sub_100034844(uint64_t a1, uint64_t a2)
{
  if (a1)
  {
    uint64_t v4 = swift_allocObject();
    *(void *)(v4 + 16) = a1;
    *(void *)(v4 + 24) = a2;
  }
  sub_100028560(&qword_10009D1B8);
  return Published.init(initialValue:)();
}

uint64_t (*sub_1000348D0())(char, uint64_t)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (!v2) {
    return 0;
  }
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = v2;
  *(void *)(v0 + 24) = v3;
  return sub_100039E84;
}

uint64_t sub_100034988()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000349C0(unsigned __int8 *a1, void *a2)
{
  return (*(uint64_t (**)(void, void))(v2 + 16))(*a1, *a2);
}

void *sub_1000349F0()
{
  return &_swiftEmptySetSingleton;
}

id sub_1000349FC()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = sub_100028560((uint64_t *)&unk_10009D200);
  uint64_t v50 = *(void *)(v2 - 8);
  uint64_t v51 = v2;
  __chkstk_darwin(v2);
  id v49 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_100028560(&qword_10009D1F8);
  uint64_t v47 = *(void *)(v4 - 8);
  uint64_t v48 = v4;
  __chkstk_darwin(v4);
  uint64_t v46 = (char *)&v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009D1F0);
  uint64_t v44 = *(void *)(v6 - 8);
  uint64_t v45 = v6;
  __chkstk_darwin(v6);
  id v43 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100028560(&qword_10009D1E8);
  uint64_t v41 = *(void *)(v8 - 8);
  uint64_t v42 = v8;
  __chkstk_darwin(v8);
  id v40 = (char *)&v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100028560(&qword_10009D1E0);
  uint64_t v38 = *(void *)(v10 - 8);
  uint64_t v39 = v10;
  __chkstk_darwin(v10);
  unint64_t v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v37 = sub_100028560(&qword_10009D1D8);
  uint64_t v13 = *(void *)(v37 - 8);
  __chkstk_darwin(v37);
  uint64_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100028560(&qword_10009D1D0);
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  unint64_t v19 = (char *)&v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates;
  unint64_t v21 = self;
  uint64_t v22 = v1;
  *(void *)&v1[v20] = [v21 hashTableWithOptions:5];
  uint64_t v23 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__connection];
  uint64_t v54 = 0;
  sub_100028560(&qword_10009D0C8);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v17 + 32))(v23, v19, v16);
  uint64_t v24 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__remoteUIHost];
  uint64_t v54 = 0;
  sub_100028560(&qword_10009D130);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v24, v15, v37);
  uint64_t v25 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__mechanism];
  uint64_t v54 = 0;
  sub_100028560(&qword_10009D138);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v38 + 32))(v25, v12, v39);
  uint64_t v26 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__backoffCounter];
  uint64_t v54 = 0;
  sub_100028560(&qword_10009D1A0);
  uint64_t v27 = v40;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v26, v27, v42);
  uint64_t v28 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__internalInfo];
  uint64_t v54 = 0;
  sub_100028560(&qword_10009D1A8);
  uint64_t v29 = v43;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v28, v29, v45);
  uint64_t v30 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__controllerToShow];
  uint64_t v54 = 0;
  LOBYTE(v55) = 1;
  sub_100028560(&qword_10009D1B0);
  unsigned int v31 = v46;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v47 + 32))(v30, v31, v48);
  uint64_t v32 = &v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel__completionHandler];
  uint64_t v54 = 0;
  uint64_t v55 = 0;
  sub_100028560(&qword_10009D1B8);
  uint64_t v33 = v49;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v50 + 32))(v32, v33, v51);
  *(void *)&v22[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag] = &_swiftEmptySetSingleton;
  unsigned int v34 = sub_100048C74();
  sub_100048C8C(*v34);

  v53.receiver = v22;
  v53.super_class = ObjectType;
  return [super init];
}

char *sub_100035070(unint64_t a1, uint64_t a2, char a3)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v6 = (uint64_t)v41;
  if (v41)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v7 = v41;
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    uint64_t v8 = v41;
    switch(a2)
    {
      case 1:
        switch(a1)
        {
          case 0uLL:
          case 2uLL:
          case 4uLL:
            v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
            swift_bridgeObjectRelease();
            swift_getKeyPath();
            swift_getKeyPath();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            id v10 = sub_1000109B4(v9.super.isa, v41, v41, v41, a3 & 1);
            goto LABEL_31;
          case 3uLL:
            type metadata accessor for BiometryCompanionViewController();
            swift_getKeyPath();
            swift_getKeyPath();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            unint64_t v19 = (char *)sub_100029C88((uint64_t)v41, (uint64_t)v41, (uint64_t)v41, (uint64_t)v41, a3 & 1);
            id v40 = &v19[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
            swift_beginAccess();
            *(void *)id v40 = 1;
            return v19;
          case 5uLL:
            goto LABEL_39;
          default:
            swift_bridgeObjectRelease();
            uint64_t v28 = Logger.logObject.getter();
            os_log_type_t v29 = static os_log_type_t.error.getter();
            if (!os_log_type_enabled(v28, v29)) {
              goto LABEL_47;
            }
            uint64_t v30 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v30 = 134217984;
            uint64_t v41 = (void *)a1;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v32 = "Unsupported SBUIRemoteAlertViewControllerPresentationMode %ld";
            goto LABEL_45;
        }
      case 2:
        id v43 = &type metadata for FeatureFlags.LocalAuthentication;
        unint64_t v44 = sub_100039070();
        char v25 = isFeatureEnabled(_:)();
        sub_10002A3EC((uint64_t)&v41);
        if (v25)
        {
          switch(a1)
          {
            case 0uLL:
            case 2uLL:
              goto LABEL_30;
            case 3uLL:
              type metadata accessor for ComplementaryPasscodeViewController();
              swift_getKeyPath();
              swift_getKeyPath();
              static Published.subscript.getter();
              swift_release();
              swift_release();
              return (char *)sub_100029C88(v6, (uint64_t)v7, (uint64_t)v41, (uint64_t)v8, a3 & 1);
            case 4uLL:
            case 5uLL:
              swift_bridgeObjectRelease();
              uint64_t v28 = Logger.logObject.getter();
              os_log_type_t v33 = static os_log_type_t.info.getter();
              if (!os_log_type_enabled(v28, v33)) {
                goto LABEL_47;
              }
              unsigned int v34 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unsigned int v34 = 0;
              uint64_t v32 = "We present passcode view controller on primary display only";
              goto LABEL_54;
            default:
              goto LABEL_43;
          }
        }
        if (!v27 & v26) {
          goto LABEL_43;
        }
        if (((1 << a1) & 0x15) != 0)
        {
LABEL_30:
          v9.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          id v10 = sub_10001C180(v9.super.isa, v7, v41, v8, a3 & 1);
LABEL_31:
          unint64_t v19 = (char *)v10;

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return v19;
        }
        if (((1 << a1) & 0x28) == 0) {
          goto LABEL_43;
        }
        swift_bridgeObjectRelease();
        uint64_t v28 = Logger.logObject.getter();
        os_log_type_t v33 = static os_log_type_t.info.getter();
        if (!os_log_type_enabled(v28, v33)) {
          goto LABEL_47;
        }
        unsigned int v34 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)unsigned int v34 = 0;
        uint64_t v32 = "newDevicePasscodeAlert feature flag is disabled, showing old passcode on device display only";
LABEL_54:
        unsigned int v35 = v28;
        os_log_type_t v36 = v33;
        uint64_t v37 = v34;
        uint32_t v38 = 2;
        goto LABEL_46;
      case 3:
        if (a1 > 5) {
          goto LABEL_43;
        }
        if (((1 << a1) & 0x15) != 0)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          unint64_t v21 = v41;
          uint64_t v22 = PinViewController;
          goto LABEL_25;
        }
        if (((1 << a1) & 0x28) == 0) {
          goto LABEL_43;
        }
        swift_bridgeObjectRelease();
        uint64_t v28 = Logger.logObject.getter();
        os_log_type_t v29 = static os_log_type_t.debug.getter();
        if (!os_log_type_enabled(v28, v29)) {
          goto LABEL_47;
        }
        uint64_t v30 = (uint8_t *)swift_slowAlloc();
        *(_DWORD *)uint64_t v30 = 134349056;
        uint64_t v31 = 3;
        goto LABEL_38;
      case 4:
        if (a1 > 5) {
          goto LABEL_43;
        }
        if (((1 << a1) & 0x15) != 0)
        {
          swift_getKeyPath();
          swift_getKeyPath();
          static Published.subscript.getter();
          swift_release();
          swift_release();
          unint64_t v21 = v41;
          uint64_t v22 = PasswordViewController;
LABEL_25:
          id v23 = objc_allocWithZone((Class)v22);
          Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
          swift_bridgeObjectRelease();
          unint64_t v19 = (char *)[v23 initWithInternalInfo:isa mechanism:v41 backoffCounter:v21 remoteUIHost:v41 allowsLandscape:a3 & 1];

          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          swift_unknownObjectRelease();
          return v19;
        }
        if (((1 << a1) & 0x28) != 0)
        {
          swift_bridgeObjectRelease();
          uint64_t v28 = Logger.logObject.getter();
          os_log_type_t v29 = static os_log_type_t.debug.getter();
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v30 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v30 = 134349056;
            uint64_t v31 = 4;
LABEL_38:
            uint64_t v41 = (void *)v31;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v32 = "We do not support showing content on external display for this type %{public}ld";
            goto LABEL_45;
          }
        }
        else
        {
LABEL_43:
          swift_bridgeObjectRelease();
          uint64_t v28 = Logger.logObject.getter();
          os_log_type_t v29 = static os_log_type_t.error.getter();
          if (os_log_type_enabled(v28, v29))
          {
            uint64_t v30 = (uint8_t *)swift_slowAlloc();
            *(_DWORD *)uint64_t v30 = 134349056;
            uint64_t v41 = (void *)a1;
            UnsafeMutableRawBufferPointer.copyMemory(from:)();
            uint64_t v32 = "Unsupported SBUIRemoteAlertViewControllerPresentationMode %{public}ld";
LABEL_45:
            unsigned int v35 = v28;
            os_log_type_t v36 = v29;
            uint64_t v37 = v30;
            uint32_t v38 = 12;
LABEL_46:
            _os_log_impl((void *)&_mh_execute_header, v35, v36, v32, v37, v38);
            swift_slowDealloc();
          }
        }
LABEL_47:

        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
        return 0;
      case 5:
        switch(a1)
        {
          case 0uLL:
          case 2uLL:
          case 4uLL:
            swift_getKeyPath();
            swift_getKeyPath();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            unint64_t v21 = v41;
            uint64_t v22 = FaceIdViewController;
            goto LABEL_25;
          case 3uLL:
            type metadata accessor for BiometryCompanionViewController();
            swift_getKeyPath();
            swift_getKeyPath();
            static Published.subscript.getter();
            swift_release();
            swift_release();
            unint64_t v19 = (char *)sub_100029C88((uint64_t)v41, (uint64_t)v41, (uint64_t)v41, (uint64_t)v41, a3 & 1);
            uint64_t v39 = &v19[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
            swift_beginAccess();
            *(void *)uint64_t v39 = 2;
            break;
          case 5uLL:
LABEL_39:
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            swift_unknownObjectRelease();
            return 0;
          default:
            goto LABEL_43;
        }
        return v19;
      default:
        goto LABEL_43;
    }
  }
  uint64_t v41 = 0;
  unint64_t v42 = 0xE000000000000000;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  if (!v46)
  {
    v11._uint64_t countAndFlagsBits = 0x6C616E7265746E69;
    v11._object = (void *)0xEC0000006F666E49;
    String.append(_:)(v11);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  if (!v46)
  {
    v12._uint64_t countAndFlagsBits = 0x696E616863656D20;
    v12._object = (void *)0xEA00000000006D73;
    String.append(_:)(v12);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  if (!v46)
  {
    v13._uint64_t countAndFlagsBits = 0x5565746F6D657220;
    v13._object = (void *)0xED000074736F4849;
    String.append(_:)(v13);
  }
  uint64_t v15 = (uint64_t)v41;
  unint64_t v14 = v42;
  swift_bridgeObjectRetain();
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v46 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v45 = sub_10002E644(v15, v14, &v46);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Missing needed informations: %s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  return 0;
}

uint64_t sub_100035EAC()
{
  uint64_t v1 = sub_100028560(&qword_10009D288);
  __chkstk_darwin(v1 - 8);
  long long v92 = (char *)v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
  uint64_t v93 = *(void *)(v3 - 8);
  uint64_t v94 = v3;
  __chkstk_darwin(v3);
  long long v91 = (char *)v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v90 = (id)sub_100028560(&qword_10009D290);
  __chkstk_darwin(v90);
  uint64_t v88 = (char *)v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009D298);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v83 = v6;
  uint64_t v84 = v7;
  __chkstk_darwin(v6);
  uint64_t v79 = (char *)v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v89 = (void (*)(char *, uint64_t, uint64_t, uint64_t))sub_100028560(&qword_10009D2A0);
  __chkstk_darwin(v89);
  unint64_t v80 = (char *)v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100028560(&qword_10009D2A8);
  uint64_t v75 = *(void *)(v74 - 8);
  __chkstk_darwin(v74);
  id v66 = (char *)v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v86 = sub_100028560(&qword_10009D2B0);
  __chkstk_darwin(v86);
  v68 = (char *)v52 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_100028560(&qword_10009D2B8);
  __chkstk_darwin(v63);
  v61 = (char *)v52 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = sub_100028560(&qword_10009D2C0);
  uint64_t v59 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  unint64_t v14 = (char *)v52 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_100028560(&qword_10009D2C8);
  __chkstk_darwin(v62);
  uint64_t v56 = (char *)v52 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100028560(&qword_10009D2D0);
  uint64_t v54 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v18 = (char *)v52 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v60 = sub_100028560(&qword_10009D2D8);
  __chkstk_darwin(v60);
  v52[2] = (char *)v52 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100028560(&qword_10009D2E0);
  uint64_t v21 = *(void *)(v20 - 8);
  __chkstk_darwin(v20);
  id v23 = (char *)v52 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v57 = sub_100028560(&qword_10009D2E8);
  __chkstk_darwin(v57);
  v52[1] = (char *)v52 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v67 = sub_100028560(&qword_10009D2F0);
  __chkstk_darwin(v67);
  uint64_t v55 = (char *)v52 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_100028560(&qword_10009D2F8);
  uint64_t v71 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  char v64 = (char *)v52 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v70 = sub_100028560(&qword_10009D300);
  uint64_t v72 = *(void *)(v70 - 8);
  __chkstk_darwin(v70);
  NSString v65 = (char *)v52 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100028560(&qword_10009D308);
  uint64_t v78 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  v95 = (char *)v52 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = sub_100028560(&qword_10009D310);
  uint64_t v30 = *(void *)(v29 - 8);
  uint64_t v81 = v29;
  uint64_t v82 = v30;
  __chkstk_darwin(v29);
  char v73 = (char *)v52 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v85 = sub_100028560(&qword_10009D318);
  uint64_t v87 = *(void *)(v85 - 8);
  __chkstk_darwin(v85);
  id v77 = (char *)v52 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  sub_100028560(&qword_10009D1D0);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_10002B40C(0, &qword_10009D320);
  sub_100033E8C(&qword_10009D328, &qword_10009D2E0);
  Publisher.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
  swift_beginAccess();
  sub_100028560(&qword_10009D1D8);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100028560(&qword_10009D1C8);
  sub_100033E8C(&qword_10009D330, &qword_10009D2D0);
  Publisher.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v54 + 8))(v18, v16);
  swift_beginAccess();
  sub_100028560(&qword_10009D1E0);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100028560(&qword_10009D338);
  sub_100033E8C(&qword_10009D340, &qword_10009D2C0);
  uint64_t v33 = v58;
  Publisher.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v59 + 8))(v14, v33);
  swift_beginAccess();
  sub_100028560(&qword_10009D1E8);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100033E8C(&qword_10009D348, &qword_10009D2E8);
  sub_100033E8C(&qword_10009D350, &qword_10009D2D8);
  sub_100033E8C(&qword_10009D358, &qword_10009D2C8);
  sub_100033E8C((unint64_t *)&unk_10009D360, &qword_10009D2B8);
  Publishers.CombineLatest4.init(_:_:_:_:)();
  swift_beginAccess();
  sub_100028560(&qword_10009D1F0);
  unsigned int v34 = v66;
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100028560(&qword_10009CCF8);
  sub_100033E8C(&qword_10009D370, &qword_10009D2A8);
  uint64_t v35 = v74;
  Publisher.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v75 + 8))(v34, v35);
  uint64_t v53 = v0;
  swift_beginAccess();
  sub_100028560(&qword_10009D1F8);
  os_log_type_t v36 = v79;
  Published.projectedValue.getter();
  swift_endAccess();
  type metadata accessor for LARemoteUIController();
  sub_100033E8C(&qword_10009D378, &qword_10009D298);
  uint64_t v37 = v83;
  Publisher.compactMap<A>(_:)();
  (*(void (**)(char *, uint64_t))(v84 + 8))(v36, v37);
  swift_beginAccess();
  sub_100028560((uint64_t *)&unk_10009D200);
  Published.projectedValue.getter();
  swift_endAccess();
  sub_100033E8C(&qword_10009D380, &qword_10009D2F0);
  sub_100033E8C(&qword_10009D388, &qword_10009D2B0);
  sub_100033E8C(&qword_10009D390, &qword_10009D2A0);
  sub_100033E8C(&qword_10009D398, &qword_10009D290);
  uint32_t v38 = v64;
  Publishers.CombineLatest4.init(_:_:_:_:)();
  sub_100028560(&qword_10009D3A0);
  sub_100033E8C(&qword_10009D3A8, &qword_10009D2F8);
  uint64_t v39 = v65;
  uint64_t v40 = v69;
  Publisher.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v71 + 8))(v38, v40);
  sub_100028560(&qword_10009D3B0);
  uint64_t v41 = v70;
  Publishers.Map.map<A>(_:)();
  (*(void (**)(char *, uint64_t))(v72 + 8))(v39, v41);
  unint64_t v42 = v91;
  NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
  id v90 = self;
  id v96 = [v90 mainRunLoop];
  uint64_t v43 = type metadata accessor for NSRunLoop.SchedulerOptions();
  v89 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v43 - 8) + 56);
  uint64_t v44 = (uint64_t)v92;
  v89(v92, 1, 1, v43);
  sub_10002B40C(0, &qword_10009D3B8);
  sub_100033E8C(&qword_10009D3C0, &qword_10009D308);
  sub_100039F20();
  uint64_t v45 = v73;
  uint64_t v46 = v76;
  uint64_t v47 = v95;
  Publisher.debounce<A>(for:scheduler:options:)();
  sub_10002F024(v44, &qword_10009D288);

  (*(void (**)(char *, uint64_t))(v93 + 8))(v42, v94);
  (*(void (**)(char *, uint64_t))(v78 + 8))(v47, v46);
  id v96 = [v90 mainRunLoop];
  v89((char *)v44, 1, 1, v43);
  sub_100033E8C(&qword_10009D3D0, &qword_10009D310);
  uint64_t v48 = v77;
  uint64_t v49 = v81;
  Publisher.receive<A>(on:options:)();
  sub_10002F024(v44, &qword_10009D288);

  (*(void (**)(char *, uint64_t))(v82 + 8))(v45, v49);
  swift_allocObject();
  swift_unknownObjectWeakInit();
  sub_100033E8C(&qword_10009D3D8, &qword_10009D318);
  uint64_t v50 = v85;
  Publisher<>.sink(receiveValue:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v87 + 8))(v48, v50);
  swift_beginAccess();
  AnyCancellable.store(in:)();
  swift_endAccess();
  return swift_release();
}

id sub_10003718C@<X0>(void **a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = *a1;
  *a2 = v2;
  return v2;
}

uint64_t sub_100037198@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_unknownObjectRetain();
}

uint64_t sub_1000371A4@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000371B0@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  char v2 = *(unsigned char *)(result + 8);
  *(void *)a2 = *(void *)result;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

uint64_t sub_1000371C4@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *(void **)a1;
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  uint64_t v4 = *(void *)(a1 + 24);
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 56);
  *a2 = *(void *)a1;
  a2[1] = v2;
  a2[2] = v5;
  a2[3] = v4;
  a2[4] = v7;
  a2[5] = v6;
  a2[6] = v8;
  a2[7] = v9;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();
  id v10 = v3;
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();

  return sub_100029A94(v8);
}

uint64_t sub_10003724C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v2 = a1[2];
  uint64_t v3 = a1[4];
  uint64_t v4 = a1[6];
  uint64_t v5 = a1[7];
  *a2 = a1[5];
  a2[1] = v3;
  a2[2] = v2;
  a2[3] = v4;
  a2[4] = v5;
  swift_unknownObjectRetain();
  swift_bridgeObjectRetain();

  return sub_100029A94(v4);
}

void sub_1000372B0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100037328()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  uint64_t v5 = aBlock;

  if (!v5)
  {
    sub_100035EAC();
    id v6 = objc_allocWithZone((Class)NSXPCConnection);
    NSString v7 = String._bridgeToObjectiveC()();
    uint64_t v8 = (void **)[v6 initWithMachServiceName:v7 options:0];

    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t aBlock = v8;
    uint64_t v9 = v0;
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    id v10 = aBlock;
    if (aBlock)
    {
      id v11 = [self interfaceWithInternalProtocol:&OBJC_PROTOCOL___LARemoteUIHost];
      [v10 setRemoteObjectInterface:v11];

      uint64_t v12 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v41 = sub_1000390FC;
      uint64_t v42 = v12;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v38 = 1107296256;
      uint64_t v39 = sub_100029A40;
      uint64_t v40 = &unk_1000874E8;
      uint64_t v13 = _Block_copy(&aBlock);
      swift_release();
      [v10 setInterruptionHandler:v13];
      _Block_release(v13);
      uint64_t v14 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v41 = sub_100039120;
      uint64_t v42 = v14;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v38 = 1107296256;
      uint64_t v39 = sub_100029A40;
      uint64_t v40 = &unk_100087510;
      uint64_t v15 = _Block_copy(&aBlock);
      swift_release();
      [v10 setInvalidationHandler:v15];
      _Block_release(v15);
      [v10 resume];
      uint64_t v32 = *(void (**)(char *))(v2 + 16);
      uint64_t v33 = &v9[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_log];
      v32((char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
      uint64_t v16 = *(unsigned __int8 *)(v2 + 80);
      uint64_t v17 = (v16 + 16) & ~v16;
      uint64_t v29 = v17 + v3;
      uint64_t v31 = v16 | 7;
      uint64_t v18 = swift_allocObject();
      uint64_t v19 = *(void (**)(uint64_t, char *, uint64_t))(v2 + 32);
      uint64_t v34 = v17;
      uint64_t v35 = v2 + 32;
      uint64_t v30 = v19;
      v19(v18 + v17, v4, v1);
      uint64_t v41 = sub_100039344;
      uint64_t v42 = v18;
      uint64_t aBlock = _NSConcreteStackBlock;
      uint64_t v38 = 1107296256;
      uint64_t v39 = sub_1000379B8;
      uint64_t v40 = &unk_100087560;
      uint64_t v20 = _Block_copy(&aBlock);
      swift_release();
      id v21 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v20];
      _Block_release(v20);
      _bridgeAnyObjectToAny(_:)();
      swift_unknownObjectRelease();
      sub_100028560(&qword_10009D1C8);
      if (swift_dynamicCast()) {
        uint64_t v22 = v36;
      }
      else {
        uint64_t v22 = 0;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t v36 = v22;
      id v23 = v9;
      static Published.subscript.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      static Published.subscript.getter();
      swift_release();
      swift_release();
      uint64_t v24 = aBlock;
      if (aBlock)
      {
        uint64_t v25 = swift_allocObject();
        swift_unknownObjectWeakInit();
        ((void (*)(char *, char *, uint64_t))v32)(v4, v33, v1);
        unint64_t v26 = (v29 + 7) & 0xFFFFFFFFFFFFFFF8;
        uint64_t v27 = swift_allocObject();
        v30(v27 + v34, v4, v1);
        *(void *)(v27 + v26) = v25;
        uint64_t v41 = sub_1000395A8;
        uint64_t v42 = v27;
        uint64_t aBlock = _NSConcreteStackBlock;
        uint64_t v38 = 1107296256;
        uint64_t v39 = sub_100037AB0;
        uint64_t v40 = &unk_1000875B0;
        uint64_t v28 = _Block_copy(&aBlock);
        swift_release();
        [v24 connectRemoteUI:v23 reply:v28];

        swift_unknownObjectRelease();
        _Block_release(v28);
      }
      else
      {
      }
    }
  }
}

void sub_1000379B8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

uint64_t sub_100037A20(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void (**)(uint64_t))(a1 + 32);
  if (a2) {
    uint64_t v3 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    uint64_t v3 = 0;
  }
  swift_retain();
  v2(v3);
  swift_release();

  return swift_bridgeObjectRelease();
}

uint64_t sub_100037AB0(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString v7 = *(void (**)(uint64_t, uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  id v8 = a4;
  v7(a2, a3, a4);
  swift_release();

  swift_unknownObjectRelease();

  return swift_unknownObjectRelease();
}

uint64_t sub_100037B90()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  [v4 suspend];

  swift_getKeyPath();
  swift_getKeyPath();
  uint64_t v1 = v0;
  static Published.subscript.setter();
  uint64_t v2 = &v1[OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_disposeBag];
  swift_beginAccess();
  *(void *)uint64_t v2 = &_swiftEmptySetSingleton;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100037F64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  memset(v4, 0, sizeof(v4));
  sub_100037FA8(a1, (uint64_t)v4, a2, a3);
  return sub_10002F024((uint64_t)v4, &qword_10009D580);
}

uint64_t sub_100037FA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a1;
  uint64_t v27 = a2;
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a3;
  *(void *)(v7 + 24) = a4;
  id v8 = (void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  uint64_t v9 = *v8;
  sub_100029A94(a3);
  id v10 = [v9 allObjects];
  sub_100028560(&qword_10009D210);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v12 = result;
  if (!result) {
    goto LABEL_13;
  }
LABEL_3:
  if (v12 >= 1)
  {
    uint64_t v14 = 0;
    v24[1] = &v29;
    unint64_t v25 = v11 & 0xC000000000000001;
    do
    {
      if (v25)
      {
        uint64_t v22 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        uint64_t v22 = *(void **)(v11 + 8 * v14 + 32);
        swift_unknownObjectRetain();
      }
      sub_100039990(v27, (uint64_t)aBlock);
      id v23 = v30;
      if (v30)
      {
        uint64_t v15 = sub_10002A3A8(aBlock, (uint64_t)v30);
        unint64_t v16 = v11;
        uint64_t v17 = *(v23 - 1);
        __chkstk_darwin(v15);
        uint64_t v19 = (char *)v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v17 + 16))(v19);
        uint64_t v20 = _bridgeAnythingToObjectiveC<A>(_:)();
        (*(void (**)(char *, void *))(v17 + 8))(v19, v23);
        unint64_t v11 = v16;
        sub_10002A3EC((uint64_t)aBlock);
      }
      else
      {
        uint64_t v20 = 0;
      }
      ++v14;
      uint64_t v31 = sub_1000399F8;
      uint64_t v32 = v7;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      uint64_t v29 = sub_100029A40;
      uint64_t v30 = &unk_100087600;
      id v21 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v22 viewModelDidReceiveMechanismEvent:v26 value:v20 reply:v21];
      _Block_release(v21);
      swift_unknownObjectRelease();
      swift_unknownObjectRelease();
    }
    while (v12 != v14);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003847C(char a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = a2;
  *(void *)(v7 + 24) = a3;
  id v8 = (void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  uint64_t v9 = *v8;
  sub_100029A94(a2);
  id v10 = [v9 allObjects];
  sub_100028560(&qword_10009D210);
  unint64_t v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v11 >> 62))
  {
    uint64_t v12 = *(void *)((v11 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v12) {
      goto LABEL_3;
    }
LABEL_10:
    swift_bridgeObjectRelease_n();
    return swift_release();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v12 = result;
  if (!result) {
    goto LABEL_10;
  }
LABEL_3:
  if (v12 >= 1)
  {
    uint64_t v14 = 0;
    uint64_t v15 = a1 & 1;
    do
    {
      if ((v11 & 0xC000000000000001) != 0)
      {
        unint64_t v16 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        unint64_t v16 = *(void **)(v11 + 8 * v14 + 32);
        swift_unknownObjectRetain();
      }
      ++v14;
      aBlock[4] = sub_1000399F8;
      aBlock[5] = v7;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      void aBlock[2] = sub_100029A40;
      aBlock[3] = &unk_100087628;
      uint64_t v17 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v16 viewModelDidReceiveDismissWasInvalidated:v15 completionHandler:v17];
      _Block_release(v17);
      swift_unknownObjectRelease();
    }
    while (v12 != v14);
    goto LABEL_10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100038760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = v4;
  os_log_type_t v10 = static os_log_type_t.debug.getter();
  swift_bridgeObjectRetain_n();
  unint64_t v11 = Logger.logObject.getter();
  if (os_log_type_enabled(v11, v10))
  {
    id v21 = v5;
    uint64_t v22 = a4;
    uint64_t v12 = swift_slowAlloc();
    id v23 = (uint64_t (*)(unsigned __int8 *, void *))swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 134349314;
    uint64_t result = UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v12 + 12) = 2082;
    if (!a2)
    {
      __break(1u);
      return result;
    }
    swift_bridgeObjectRetain();
    uint64_t v14 = Dictionary.description.getter();
    unint64_t v16 = v15;
    swift_bridgeObjectRelease();
    sub_10002E644(v14, v16, (uint64_t *)&v23);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v10, "transition to controller: %{public}ld, internalInfo: %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    a4 = v22;
    uint64_t v5 = v21;
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v23 = (uint64_t (*)(unsigned __int8 *, void *))a1;
  LOBYTE(v24) = 0;
  id v17 = v5;
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  if (a3)
  {
    uint64_t v18 = swift_allocObject();
    *(void *)(v18 + 16) = a3;
    *(void *)(v18 + 24) = a4;
    uint64_t v19 = sub_10003A384;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v18 = 0;
  }
  id v23 = v19;
  uint64_t v24 = v18;
  id v20 = v17;
  sub_100029A94(a3);
  return static Published.subscript.setter();
}

void sub_100038AF8(char a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = _convertErrorToNSError(_:)();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, void))(a3 + 16))(a3, a1 & 1);
}

uint64_t sub_100038B68@<X0>(void *a1@<X8>)
{
  return sub_100038CF0(a1);
}

uint64_t sub_100038B7C(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100038C58(a1, a2, a3, a4, (uint64_t)&unk_10006BFE8, (uint64_t)&unk_10006C010, (void (*)(uint64_t))&_swift_bridgeObjectRetain);
}

uint64_t sub_100038BA4@<X0>(void *a1@<X8>)
{
  return sub_100038CF0(a1);
}

uint64_t sub_100038BB8(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100038C58(a1, a2, a3, a4, (uint64_t)&unk_10006C030, (uint64_t)&unk_10006C058, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_100038BE0@<X0>(void *a1@<X8>)
{
  return sub_100038CF0(a1);
}

uint64_t sub_100038BF4(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100038C58(a1, a2, a3, a4, (uint64_t)&unk_10006C078, (uint64_t)&unk_10006C0A0, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_100038C1C@<X0>(void *a1@<X8>)
{
  return sub_100038CF0(a1);
}

uint64_t sub_100038C30(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4)
{
  return sub_100038C58(a1, a2, a3, a4, (uint64_t)&unk_10006C0C0, (uint64_t)&unk_10006C0E8, (void (*)(uint64_t))&_swift_unknownObjectRetain);
}

uint64_t sub_100038C58(uint64_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(uint64_t))
{
  uint64_t v8 = *a1;
  uint64_t v9 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  a7(v8);
  id v10 = v9;
  return static Published.subscript.setter();
}

uint64_t sub_100038CDC@<X0>(void *a1@<X8>)
{
  return sub_100038CF0(a1);
}

uint64_t sub_100038CF0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100038D6C(void **a1, void **a2)
{
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v4 = v2;
  id v5 = v3;
  return static Published.subscript.setter();
}

uint64_t sub_100038DE0@<X0>(uint64_t a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *(void *)a1 = v3;
  *(unsigned char *)(a1 + 8) = v4;
  return result;
}

uint64_t sub_100038E68(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

double sub_100038EE8@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100038F68(uint64_t *a1, void **a2)
{
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  if (*a1)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v3;
    *(void *)(v5 + 24) = v4;
    id v6 = sub_100039E84;
  }
  else
  {
    id v6 = 0;
    uint64_t v5 = 0;
  }
  uint64_t v7 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  if (v3)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v6;
    *(void *)(v8 + 24) = v5;
  }
  sub_100029A94(v3);
  id v9 = v7;
  return static Published.subscript.setter();
}

unint64_t sub_100039070()
{
  unint64_t result = qword_10009D1C0;
  if (!qword_10009D1C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D1C0);
  }
  return result;
}

uint64_t sub_1000390C4()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000390FC()
{
}

uint64_t sub_100039108(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100039118()
{
  return swift_release();
}

void sub_100039120()
{
}

void sub_10003912C(char *a1)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    id v4 = Strong;
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      format = a1;
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138543362;
      id v9 = v4;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v8 = v3;

      _os_log_impl((void *)&_mh_execute_header, v5, v6, format, v7, 0xCu);
      sub_100028560(&qword_10009D280);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t sub_1000392B4()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_100039344()
{
  type metadata accessor for Logger();
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v0 = Logger.logObject.getter();
  os_log_type_t v1 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v0, v1))
  {
    uint64_t v2 = (uint8_t *)swift_slowAlloc();
    uint64_t v3 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v2 = 138543362;
    uint64_t v4 = _convertErrorToNSError(_:)();
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v3 = v4;
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v0, v1, "Could not obtaint remote object with error %{public}@", v2, 0xCu);
    sub_100028560(&qword_10009D280);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
}

uint64_t sub_100039504()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

void sub_1000395A8(uint64_t a1, void *a2, uint64_t a3)
{
  type metadata accessor for Logger();
  if (a3)
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      unint64_t v15 = a2;
      uint64_t v8 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v7 = 138543362;
      aBlock[0] = _convertErrorToNSError(_:)();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *uint64_t v8 = aBlock[0];
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Could not connect to remote object with error %{public}@", v7, 0xCu);
      sub_100028560(&qword_10009D280);
      swift_arrayDestroy();
      a2 = v15;
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v10 = (void *)Strong;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_unknownObjectRetain();
    id v11 = v10;
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    swift_unknownObjectRetain();
    id v12 = v11;
    static Published.subscript.setter();
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (a2)
    {
      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      aBlock[4] = sub_100039E88;
      aBlock[5] = v13;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      void aBlock[2] = sub_100037A20;
      aBlock[3] = &unk_1000877B0;
      uint64_t v14 = _Block_copy(aBlock);
      swift_release();
      [a2 internalInfoWithReply:v14];

      swift_unknownObjectRelease();
      _Block_release(v14);
    }
    else
    {
    }
  }
}

uint64_t sub_100039950()
{
  if (*(void *)(v0 + 16)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100039990(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000399FC()
{
  swift_beginAccess();
  uint64_t v1 = *(void (**)(uint64_t))(v0 + 16);
  if (v1)
  {
    uint64_t v2 = swift_retain();
    v1(v2);
    sub_10002A998((uint64_t)v1);
  }
  swift_beginAccess();
  uint64_t v3 = *(void *)(v0 + 16);
  *(void *)(v0 + 16) = 0;
  *(void *)(v0 + 24) = 0;
  return sub_10002A998(v3);
}

uint64_t sub_100039A8C()
{
  return type metadata accessor for TransitionViewModel();
}

uint64_t type metadata accessor for TransitionViewModel()
{
  uint64_t result = qword_10009E660;
  if (!qword_10009E660) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_100039AE0()
{
  sub_100039D9C(319, &qword_10009D240, &qword_10009D0C8);
  if (v0 <= 0x3F)
  {
    sub_100039D9C(319, &qword_10009D248, &qword_10009D130);
    if (v1 <= 0x3F)
    {
      sub_100039D9C(319, &qword_10009D250, &qword_10009D138);
      if (v2 <= 0x3F)
      {
        sub_100039D9C(319, &qword_10009D258, &qword_10009D1A0);
        if (v3 <= 0x3F)
        {
          sub_100039D9C(319, &qword_10009D260, &qword_10009D1A8);
          if (v4 <= 0x3F)
          {
            sub_100039D9C(319, &qword_10009D268, &qword_10009D1B0);
            if (v5 <= 0x3F)
            {
              sub_100039D9C(319, &qword_10009D270, &qword_10009D1B8);
              if (v6 <= 0x3F)
              {
                type metadata accessor for Logger();
                if (v7 <= 0x3F) {
                  swift_updateClassMetadata2();
                }
              }
            }
          }
        }
      }
    }
  }
}

void sub_100039D9C(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  if (!*a2)
  {
    sub_10002F434(a3);
    unint64_t v4 = type metadata accessor for Published();
    if (!v5) {
      atomic_store(v4, a2);
    }
  }
}

void type metadata accessor for LARemoteUIController()
{
  if (!qword_10009D278)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10009D278);
    }
  }
}

uint64_t sub_100039E44()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100039E7C(char a1, uint64_t a2)
{
  sub_100038AF8(a1, a2, *(void *)(v2 + 16));
}

uint64_t sub_100039E88()
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_bridgeObjectRetain();
    return static Published.subscript.setter();
  }
  return result;
}

unint64_t sub_100039F20()
{
  unint64_t result = qword_10009D3C8;
  if (!qword_10009D3C8)
  {
    sub_10002B40C(255, &qword_10009D3B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D3C8);
  }
  return result;
}

uint64_t sub_100039F88(uint64_t *a1)
{
  uint64_t v21 = *a1;
  uint64_t v1 = a1[3];
  uint64_t v22 = a1[2];
  uint64_t v2 = a1[4];
  if (v1)
  {
    uint64_t v3 = swift_allocObject();
    *(void *)(v3 + 16) = v1;
    *(void *)(v3 + 24) = v2;
    uint64_t v19 = sub_100039E84;
    uint64_t v20 = v3;
  }
  else
  {
    uint64_t v19 = 0;
    uint64_t v20 = 0;
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (!Strong)
  {
    sub_100029A94(v1);
    return sub_10002A998((uint64_t)v19);
  }
  uint64_t v5 = (void *)Strong;
  unint64_t v6 = (void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI19TransitionViewModel_delegates);
  swift_beginAccess();
  unint64_t v7 = *v6;
  sub_100029A94(v1);
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  id v8 = v7;

  id v9 = [v8 allObjects];
  sub_100028560(&qword_10009D210);
  unint64_t v10 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v10 >> 62))
  {
    uint64_t v11 = *(void *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (v11) {
      goto LABEL_7;
    }
LABEL_18:
    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002A998((uint64_t)v19);
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t result = _CocoaArrayWrapper.endIndex.getter();
  uint64_t v11 = result;
  if (!result) {
    goto LABEL_18;
  }
LABEL_7:
  if (v11 >= 1)
  {
    uint64_t v13 = 0;
    uint64_t v18 = v24;
    do
    {
      if ((v10 & 0xC000000000000001) != 0)
      {
        unint64_t v15 = (void *)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else
      {
        unint64_t v15 = *(void **)(v10 + 8 * v13 + 32);
        swift_unknownObjectRetain();
      }
      Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      [v15 viewModelDidReceiveAuthenticationDataWithInternalInfo:isa v22 v18];

      v17.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
      if (v1)
      {
        void v24[2] = v19;
        v24[3] = v20;
        aBlock[0] = _NSConcreteStackBlock;
        aBlock[1] = 1107296256;
        v24[0] = sub_1000372B0;
        v24[1] = &unk_1000877D8;
        uint64_t v14 = _Block_copy(aBlock);
        swift_retain();
        swift_release();
      }
      else
      {
        uint64_t v14 = 0;
      }
      ++v13;
      [v15 showWithController:v21 internalInfo:v17.super.isa completionHandler:v14];
      _Block_release(v14);

      swift_unknownObjectRelease();
    }
    while (v11 != v13);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_10003A2E8(char a1, uint64_t a2)
{
  uint64_t v3 = *(uint64_t (**)(char *, uint64_t *))(v2 + 16);
  char v6 = a1;
  uint64_t v5 = a2;
  return v3(&v6, &v5);
}

uint64_t sub_10003A390()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10003A3DC()
{
  return swift_unknownObjectRelease();
}

void (*sub_10003A438(void *a1))(void **a1, char a2)
{
  uint64_t v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_delegate;
  void v3[4] = v1;
  void v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return sub_10003A4BC;
}

void sub_10003A4BC(void **a1, char a2)
{
  uint64_t v3 = *a1;
  swift_unknownObjectWeakAssign();
  if (a2)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }

  free(v3);
}

uint64_t sub_10003A53C()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  __chkstk_darwin(v2);
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state;
  if (*(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state))
  {
    uint64_t v5 = *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state);
  }
  else
  {
    sub_10003A638((uint64_t)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    swift_storeEnumTagMultiPayload();
    sub_100028560(&qword_10009D458);
    swift_allocObject();
    uint64_t v5 = CurrentValueSubject.init(_:)();
    *(void *)(v1 + v4) = v5;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v5;
}

uint64_t sub_10003A638@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v48 = a1;
  uint64_t v3 = sub_100028560(&qword_10009E000);
  uint64_t v4 = __chkstk_darwin(v3 - 8);
  char v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  id v8 = (char *)&v46 - v7;
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v46 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v46 - v14;
  unint64_t v16 = sub_10003AF38();
  LODWORD(v53) = 1076;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v16 + 16) && (unint64_t v17 = sub_10002A9F0((uint64_t)v52), (v18 & 1) != 0))
  {
    sub_10002B158(*(void *)(v16 + 56) + 32 * v17, (uint64_t)&v53);
  }
  else
  {
    long long v53 = 0u;
    long long v54 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v52);
  if (*((void *)&v54 + 1))
  {
    int v19 = swift_dynamicCast();
    if (v19) {
      uint64_t v20 = v50;
    }
    else {
      uint64_t v20 = 0;
    }
    if (v19) {
      uint64_t v21 = v51;
    }
    else {
      uint64_t v21 = 0;
    }
    uint64_t v46 = v20;
    uint64_t v47 = v21;
  }
  else
  {
    sub_10002F024((uint64_t)&v53, &qword_10009D580);
    uint64_t v46 = 0;
    uint64_t v47 = 0;
  }
  uint64_t v22 = v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess();
  sub_10002AA34(v22, (uint64_t)v8, &qword_10009E000);
  id v23 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48);
  if (v23(v8, 1, v9) == 1)
  {
    sub_10002F024((uint64_t)v8, &qword_10009E000);
    uint64_t v24 = v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate;
    swift_beginAccess();
    sub_10002AA34(v24, (uint64_t)v6, &qword_10009E000);
    int v25 = v23(v6, 1, v9);
    sub_10002F024((uint64_t)v6, &qword_10009E000);
    if (v25 == 1)
    {
      unint64_t v26 = sub_10003AF38();
      LODWORD(v53) = 1069;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v26 + 16) && (unint64_t v27 = sub_10002A9F0((uint64_t)v52), (v28 & 1) != 0))
      {
        sub_10002B158(*(void *)(v26 + 56) + 32 * v27, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v52);
      if (*((void *)&v54 + 1)) {
        swift_dynamicCast();
      }
      else {
        sub_10002F024((uint64_t)&v53, &qword_10009D580);
      }
      unint64_t v34 = sub_10003AF38();
      LODWORD(v53) = 1070;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v34 + 16) && (unint64_t v35 = sub_10002A9F0((uint64_t)v52), (v36 & 1) != 0))
      {
        sub_10002B158(*(void *)(v34 + 56) + 32 * v35, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v52);
      if (*((void *)&v54 + 1))
      {
        if (swift_dynamicCast()) {
          uint64_t v37 = v49;
        }
        else {
          uint64_t v37 = 0;
        }
      }
      else
      {
        sub_10002F024((uint64_t)&v53, &qword_10009D580);
        uint64_t v37 = 0;
      }
      unint64_t v39 = sub_10003AF38();
      LODWORD(v53) = 1088;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v39 + 16) && (unint64_t v40 = sub_10002A9F0((uint64_t)v52), (v41 & 1) != 0))
      {
        sub_10002B158(*(void *)(v39 + 56) + 32 * v40, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v52);
      if (*((void *)&v54 + 1))
      {
        if (swift_dynamicCast()) {
          uint64_t v42 = v49;
        }
        else {
          uint64_t v42 = 0;
        }
      }
      else
      {
        sub_10002F024((uint64_t)&v53, &qword_10009D580);
        uint64_t v42 = 0;
      }
      if ((*(unsigned char *)(v2 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled) & 1) == 0)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRetain();
        uint64_t v42 = v37;
      }
      if (v42) {
        swift_bridgeObjectRelease();
      }
      unint64_t v43 = sub_10003AF38();
      LODWORD(v53) = 1071;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v43 + 16) && (unint64_t v44 = sub_10002A9F0((uint64_t)v52), (v45 & 1) != 0))
      {
        sub_10002B158(*(void *)(v43 + 56) + 32 * v44, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v52);
      if (*((void *)&v54 + 1)) {
        swift_dynamicCast();
      }
      else {
        sub_10002F024((uint64_t)&v53, &qword_10009D580);
      }
      static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:familiarLocationsUnavailable:customCancelTitle:)();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
    }
    else
    {
      static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)();
    }
    return swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
    static Date.now.getter();
    char v29 = static Date.> infix(_:_:)();
    uint64_t v30 = *(void (**)(char *, uint64_t))(v10 + 8);
    v30(v13, v9);
    if (v29)
    {
      unint64_t v31 = sub_10003AF38();
      LODWORD(v53) = 1072;
      AnyHashable.init<A>(_:)();
      if (*(void *)(v31 + 16) && (unint64_t v32 = sub_10002A9F0((uint64_t)v52), (v33 & 1) != 0))
      {
        sub_10002B158(*(void *)(v31 + 56) + 32 * v32, (uint64_t)&v53);
      }
      else
      {
        long long v53 = 0u;
        long long v54 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v52);
      if (*((void *)&v54 + 1)) {
        swift_dynamicCast();
      }
      else {
        sub_10002F024((uint64_t)&v53, &qword_10009D580);
      }
      static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)();
      swift_bridgeObjectRelease();
    }
    else
    {
      static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)();
    }
    swift_bridgeObjectRelease();
    return ((uint64_t (*)(char *, uint64_t))v30)(v15, v9);
  }
}

uint64_t sub_10003AE5C()
{
  sub_10003A53C();
  sub_100028560(&qword_10009D458);
  sub_10003C92C();
  uint64_t v0 = Publisher.eraseToAnyPublisher()();
  swift_release();
  return v0;
}

uint64_t sub_10003AECC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

unint64_t sub_10003AF38()
{
  AnyHashable.init<A>(_:)();
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_internalInfo);
  swift_beginAccess();
  uint64_t v2 = *v1;
  if (*(void *)(*v1 + 16) && (unint64_t v3 = sub_10002A9F0((uint64_t)v6), (v4 & 1) != 0))
  {
    sub_10002B158(*(void *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
  }
  else
  {
    long long v7 = 0u;
    long long v8 = 0u;
  }
  swift_endAccess();
  sub_10002AC8C((uint64_t)v6);
  if (*((void *)&v8 + 1))
  {
    sub_100028560(&qword_10009CCF8);
    if (swift_dynamicCast()) {
      return 0x736E6F6974704FLL;
    }
  }
  else
  {
    sub_10002F024((uint64_t)&v7, &qword_10009D580);
  }
  return sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
}

id sub_10003B050(uint64_t a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_10003B094(a1, a2);
}

id sub_10003B094(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = type metadata accessor for Date();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v11 - 8);
  char v36 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(void *)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel____lazy_storage___state] = 0;
  uint64_t v13 = (uint64_t)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate];
  uint64_t v37 = v8;
  uint64_t v14 = *(void (**)(void))(v8 + 56);
  ((void (*)(char *, uint64_t, uint64_t, uint64_t))v14)(&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate], 1, 1, v7);
  unint64_t v35 = &v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate];
  v14();
  *(void *)&v3[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_internalInfo] = a1;
  swift_beginAccess();
  uint64_t v38 = a2;
  swift_unknownObjectWeakAssign();
  unint64_t v40 = 0x6F6974704F4F5444;
  unint64_t v41 = 0xEA0000000000736ELL;
  unint64_t v15 = v3;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(a1 + 16) && (unint64_t v16 = sub_10002A9F0((uint64_t)v42), (v17 & 1) != 0))
  {
    sub_10002B158(*(void *)(a1 + 56) + 32 * v16, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v42);
  if (!*((void *)&v44 + 1))
  {
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
LABEL_12:
    long long v43 = 0u;
    long long v44 = 0u;
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
    long long v43 = 0u;
    long long v44 = 0u;
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
    long long v43 = 0u;
    long long v44 = 0u;
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
    v15[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled] = 0;
    long long v43 = 0u;
    long long v44 = 0u;
LABEL_13:
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
    goto LABEL_14;
  }
  sub_100028560(&qword_10009CCF8);
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_12;
  }
  unint64_t v18 = v40;
  if (!v40) {
    goto LABEL_12;
  }
  unint64_t v40 = 0x4466664F6C6F6F43;
  unint64_t v41 = 0xEF6E6F6974617275;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v18 + 16) && (unint64_t v19 = sub_10002A9F0((uint64_t)v42), (v20 & 1) != 0))
  {
    sub_10002B158(*(void *)(v18 + 56) + 32 * v19, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v42);
  if (*((void *)&v44 + 1))
  {
    if (swift_dynamicCast())
    {
      static Date.now.getter();
      uint64_t v24 = (uint64_t)v36;
      Date.addingTimeInterval(_:)();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v7);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v14)(v24, 0, 1, v7);
      swift_beginAccess();
      sub_10003C988(v24, v13);
      swift_endAccess();
    }
  }
  else
  {
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
  }
  unint64_t v40 = 0xD000000000000013;
  unint64_t v41 = 0x800000010007BBD0;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v18 + 16) && (unint64_t v25 = sub_10002A9F0((uint64_t)v42), (v26 & 1) != 0))
  {
    sub_10002B158(*(void *)(v18 + 56) + 32 * v25, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v42);
  if (*((void *)&v44 + 1))
  {
    if (swift_dynamicCast())
    {
      static Date.now.getter();
      uint64_t v27 = (uint64_t)v36;
      Date.addingTimeInterval(_:)();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v10, v7);
      ((void (*)(uint64_t, void, uint64_t, uint64_t))v14)(v27, 0, 1, v7);
      uint64_t v28 = (uint64_t)v35;
      swift_beginAccess();
      sub_10003C988(v27, v28);
      swift_endAccess();
    }
  }
  else
  {
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
  }
  unint64_t v40 = 0xD000000000000011;
  unint64_t v41 = 0x800000010007BBB0;
  swift_bridgeObjectRetain();
  AnyHashable.init<A>(_:)();
  if (*(void *)(v18 + 16) && (unint64_t v29 = sub_10002A9F0((uint64_t)v42), (v30 & 1) != 0))
  {
    sub_10002B158(*(void *)(v18 + 56) + 32 * v29, (uint64_t)&v43);
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v42);
  if (*((void *)&v44 + 1))
  {
    if (swift_dynamicCast()) {
      char v31 = v42[0];
    }
    else {
      char v31 = 0;
    }
    v15[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled] = v31;
  }
  else
  {
    sub_10002F024((uint64_t)&v43, &qword_10009D580);
    v15[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_isStrictModeEnabled] = 0;
  }
  unint64_t v40 = 0xD00000000000001CLL;
  unint64_t v41 = 0x800000010007BB90;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v18 + 16))
  {
    unint64_t v32 = sub_10002A9F0((uint64_t)v42);
    if (v33)
    {
      sub_10002B158(*(void *)(v18 + 56) + 32 * v32, (uint64_t)&v43);
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
  }
  else
  {
    long long v43 = 0u;
    long long v44 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v42);
  if (!*((void *)&v44 + 1)) {
    goto LABEL_13;
  }
  if (swift_dynamicCast())
  {
    char v21 = v42[0];
    goto LABEL_15;
  }
LABEL_14:
  char v21 = 0;
LABEL_15:
  v15[OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_familiarLocationsUnavailable] = v21;

  v39.receiver = v15;
  v39.super_class = ObjectType;
  id v22 = [super init];
  sub_10003B838();

  swift_unknownObjectRelease();
  return v22;
}

uint64_t sub_10003B838()
{
  uint64_t v1 = type metadata accessor for Date();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = __chkstk_darwin(v1);
  uint64_t v27 = (char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v3);
  uint64_t v28 = (char *)v25 - v5;
  uint64_t v6 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100028560(&qword_10009E000);
  uint64_t v10 = __chkstk_darwin(v9 - 8);
  uint64_t v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)v25 - v13;
  uint64_t v15 = v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_gracePeriodExpirationDate;
  swift_beginAccess();
  sub_10002AA34(v15, (uint64_t)v14, &qword_10009E000);
  uint64_t v16 = v2;
  char v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v2 + 48);
  uint64_t v29 = v1;
  LODWORD(v15) = v17(v14, 1, v1);
  sub_10002F024((uint64_t)v14, &qword_10009E000);
  if (v15 != 1)
  {
    sub_10003A53C();
    sub_10003A638((uint64_t)v8);
    goto LABEL_5;
  }
  v25[1] = v6;
  char v26 = v8;
  unint64_t v18 = v28;
  uint64_t v19 = v0 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess();
  sub_10002AA34(v19, (uint64_t)v12, &qword_10009E000);
  uint64_t v20 = v29;
  if (v17(v12, 1, v29) == 1)
  {
    sub_10002F024((uint64_t)v12, &qword_10009E000);
    sub_10003A53C();
    sub_10003A638((uint64_t)v26);
LABEL_5:
    swift_storeEnumTagMultiPayload();
    CurrentValueSubject.value.setter();
    return swift_release();
  }
  uint64_t v22 = v16;
  (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v12, v20);
  id v23 = v27;
  static Date.now.getter();
  static Date.> infix(_:_:)();
  uint64_t v24 = *(void (**)(char *, uint64_t))(v22 + 8);
  v24(v23, v20);
  sub_10003A53C();
  sub_10003A638((uint64_t)v26);
  swift_storeEnumTagMultiPayload();
  CurrentValueSubject.value.setter();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v24)(v18, v20);
}

uint64_t sub_10003BBC8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Date.now.getter();
  Date.addingTimeInterval(_:)();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
  uint64_t v9 = v1 + OBJC_IVAR____TtC10CoreAuthUI30RatchetCoolOffContentViewModel_expirationDate;
  swift_beginAccess();
  sub_10003C988((uint64_t)v8, v9);
  swift_endAccess();
  return sub_10003B838();
}

void sub_10003BD58()
{
}

uint64_t sub_10003BE38(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009D478);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier();
  uint64_t v35 = *(void *)(v5 - 8);
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v34 - v9;
  uint64_t v11 = type metadata accessor for LACUIAuthButtonConfiguration();
  uint64_t v34 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = type metadata accessor for LACUIAuthActionCountdown();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  char v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v17, a1, v14);
  int v18 = (*(uint64_t (**)(char *, uint64_t))(v15 + 88))(v17, v14);
  if (v18 == enum case for LACUIAuthActionCountdown.buttonTapped(_:))
  {
    uint64_t v19 = v10;
    (*(void (**)(char *, uint64_t))(v15 + 96))(v17, v14);
    uint64_t v20 = v34;
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v13, v17, v11);
    LACUIAuthButtonConfiguration.id.getter();
    LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)();
    uint64_t v21 = v35;
    uint64_t v22 = v20;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v35 + 48))(v4, 1, v5) == 1)
    {
      (*(void (**)(char *, uint64_t))(v20 + 8))(v13, v11);
      return sub_10002F024((uint64_t)v4, &qword_10009D478);
    }
    (*(void (**)(char *, char *, uint64_t))(v21 + 32))(v19, v4, v5);
    (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v8, v19, v5);
    int v24 = (*(uint64_t (**)(char *, uint64_t))(v21 + 88))(v8, v5);
    if (v24 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.beginSecurityDelay(_:))
    {
      uint64_t v25 = v36;
      swift_beginAccess();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        [Strong ratchetCoolOffContentDidTapOnBeginDelay:v25];
LABEL_20:
        swift_unknownObjectRelease();
      }
    }
    else
    {
      uint64_t v27 = v36;
      if (v24 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.learnMore(_:))
      {
        swift_beginAccess();
        uint64_t v28 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v28)
        {
          [v28 ratchetCoolOffContentDidTapOnLearnMore:v27];
          goto LABEL_20;
        }
      }
      else if (v24 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.done(_:))
      {
        swift_beginAccess();
        uint64_t v29 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v29)
        {
          [v29 ratchetCoolOffContentDidTapOnDone:v27];
          goto LABEL_20;
        }
      }
      else
      {
        if (v24 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.continue(_:)
          && v24 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.continueInGracePeriod(_:))
        {
          if (v24 == enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.cancel(_:))
          {
            swift_beginAccess();
            char v31 = (void *)swift_unknownObjectWeakLoadStrong();
            if (!v31) {
              goto LABEL_21;
            }
            [v31 ratchetCoolOffContentDidTapOnCancel:v27];
          }
          else
          {
            if (v24 != enum case for LACUIAuthCountdownConfiguration.ActionButtonIdentifier.customCancel(_:))
            {
              char v33 = *(void (**)(char *, uint64_t))(v21 + 8);
              v33(v19, v5);
              (*(void (**)(char *, uint64_t))(v22 + 8))(v13, v11);
              return ((uint64_t (*)(char *, uint64_t))v33)(v8, v5);
            }
            swift_beginAccess();
            unint64_t v32 = (void *)swift_unknownObjectWeakLoadStrong();
            if (!v32) {
              goto LABEL_21;
            }
            [v32 ratchetCoolOffContentDidTapOnCustomCancel:v27];
          }
          goto LABEL_20;
        }
        swift_beginAccess();
        char v30 = (void *)swift_unknownObjectWeakLoadStrong();
        if (v30)
        {
          [v30 ratchetCoolOffContentDidTapOnContinue:v27];
          goto LABEL_20;
        }
      }
    }
LABEL_21:
    (*(void (**)(char *, uint64_t))(v21 + 8))(v19, v5);
    return (*(uint64_t (**)(char *, uint64_t))(v22 + 8))(v13, v11);
  }
  if (v18 == enum case for LACUIAuthActionCountdown.delayElapsed(_:)) {
    return sub_10003B838();
  }
  else {
    return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  }
}

uint64_t sub_10003C470(uint64_t a1, uint64_t a2)
{
  uint64_t v45 = a1;
  uint64_t v46 = a2;
  uint64_t v44 = type metadata accessor for LACUIAuthCountdownConfiguration();
  uint64_t v2 = *(void *)(v44 - 8);
  uint64_t v3 = __chkstk_darwin(v44);
  long long v43 = (char *)&v41 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v42 = (char *)&v41 - v6;
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v41 - v8;
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v41 - v10;
  uint64_t v12 = type metadata accessor for RatchetCoolOffContentViewModelState(0);
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v41 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v13);
  int v18 = (char *)&v41 - v17;
  uint64_t v19 = __chkstk_darwin(v16);
  uint64_t v21 = (char *)&v41 - v20;
  __chkstk_darwin(v19);
  id v23 = (char *)&v41 - v22;
  uint64_t v24 = sub_100028560((uint64_t *)&unk_10009D550);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v27 = (char *)&v41 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = (uint64_t)&v27[*(int *)(v25 + 56)];
  sub_100033FD4(v45, (uint64_t)v27);
  sub_100033FD4(v46, v28);
  switch(swift_getEnumCaseMultiPayload())
  {
    case 1u:
      sub_100033FD4((uint64_t)v27, (uint64_t)v21);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v29 = v44;
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v9, v28, v44);
        char v30 = static LACUIAuthCountdownConfiguration.== infix(_:_:)();
        char v31 = *(void (**)(char *, uint64_t))(v2 + 8);
        v31(v9, v29);
        v31(v21, v29);
        goto LABEL_15;
      }
      uint64_t v15 = v21;
      goto LABEL_12;
    case 2u:
      sub_100033FD4((uint64_t)v27, (uint64_t)v18);
      if (swift_getEnumCaseMultiPayload() == 2)
      {
        unint64_t v32 = v42;
        uint64_t v33 = v44;
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v42, v28, v44);
        char v30 = static LACUIAuthCountdownConfiguration.== infix(_:_:)();
        uint64_t v34 = *(void (**)(char *, uint64_t))(v2 + 8);
        v34(v32, v33);
        v34(v18, v33);
        goto LABEL_15;
      }
      uint64_t v15 = v18;
      goto LABEL_12;
    case 3u:
      sub_100033FD4((uint64_t)v27, (uint64_t)v15);
      if (swift_getEnumCaseMultiPayload() != 3) {
        goto LABEL_12;
      }
      uint64_t v36 = v43;
      uint64_t v35 = v44;
      (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v43, v28, v44);
      char v30 = static LACUIAuthCountdownConfiguration.== infix(_:_:)();
      uint64_t v37 = *(void (**)(char *, uint64_t))(v2 + 8);
      v37(v36, v35);
      v37(v15, v35);
      goto LABEL_15;
    default:
      sub_100033FD4((uint64_t)v27, (uint64_t)v23);
      if (swift_getEnumCaseMultiPayload())
      {
        uint64_t v15 = v23;
LABEL_12:
        (*(void (**)(char *, uint64_t))(v2 + 8))(v15, v44);
        sub_10002F024((uint64_t)v27, (uint64_t *)&unk_10009D550);
        char v30 = 0;
      }
      else
      {
        uint64_t v38 = v44;
        (*(void (**)(char *, uint64_t, uint64_t))(v2 + 32))(v11, v28, v44);
        char v30 = static LACUIAuthCountdownConfiguration.== infix(_:_:)();
        objc_super v39 = *(void (**)(char *, uint64_t))(v2 + 8);
        v39(v11, v38);
        v39(v23, v38);
LABEL_15:
        sub_100033F78((uint64_t)v27);
      }
      return v30 & 1;
  }
}

unint64_t sub_10003C92C()
{
  unint64_t result = qword_10009D460;
  if (!qword_10009D460)
  {
    sub_10002F434(&qword_10009D458);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D460);
  }
  return result;
}

uint64_t sub_10003C988(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009E000);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_10003C9F0(uint64_t a1)
{
  unint64_t result = sub_10003CA18();
  *(void *)(a1 + 8) = result;
  return result;
}

unint64_t sub_10003CA18()
{
  unint64_t result = qword_10009D480;
  if (!qword_10009D480)
  {
    type metadata accessor for RatchetCoolOffContentViewModel(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D480);
  }
  return result;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewModel(uint64_t a1)
{
  return sub_10003CE50(a1, (uint64_t *)&unk_10009E820);
}

uint64_t *sub_10003CA90(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v6 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v6 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    swift_getEnumCaseMultiPayload();
    uint64_t v7 = type metadata accessor for LACUIAuthCountdownConfiguration();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003CC84(uint64_t a1)
{
  uint64_t result = swift_getEnumCaseMultiPayload();
  if (result <= 3)
  {
    uint64_t v3 = type metadata accessor for LACUIAuthCountdownConfiguration();
    uint64_t v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8);
    return v4(a1, v3);
  }
  return result;
}

uint64_t sub_10003CD00(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10003CD90(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_100033F78(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t type metadata accessor for RatchetCoolOffContentViewModelState(uint64_t a1)
{
  return sub_10003CE50(a1, (uint64_t *)&unk_10009E810);
}

uint64_t sub_10003CE50(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10003CE88(uint64_t a1, uint64_t a2)
{
  swift_getEnumCaseMultiPayload();
  uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_10003CF18(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_100033F78(a1);
    swift_getEnumCaseMultiPayload();
    uint64_t v4 = type metadata accessor for LACUIAuthCountdownConfiguration();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a1, a2, v4);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_10003CFB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t sub_10003CFE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_10003D00C()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_10003D01C()
{
  uint64_t result = type metadata accessor for LACUIAuthCountdownConfiguration();
  if (v1 <= 0x3F)
  {
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

uint64_t sub_10003D0A8()
{
  return type metadata accessor for RatchetCoolOffContentViewModel(0);
}

void sub_10003D0B0()
{
  sub_10003D170();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_10003D170()
{
  if (!qword_10009D548)
  {
    type metadata accessor for Date();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10009D548);
    }
  }
}

uint64_t variable initialization expression of AuthorizationRemoteViewController.log()
{
  sub_100028560(&qword_10009D560);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10006C390;
  *(void *)(v0 + 32) = *(void *)sub_100048C74();
  *(void *)(v0 + 40) = *(void *)sub_100048C80();
  *(void *)(v0 + 48) = *(void *)sub_100048FF4();
  sub_10003D2A4();
  sub_100028560(&qword_10009D570);
  sub_10003EBB4(&qword_10009D578, &qword_10009D570);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  return sub_100048C8C();
}

unint64_t sub_10003D2A4()
{
  unint64_t result = qword_10009D568;
  if (!qword_10009D568)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D568);
  }
  return result;
}

uint64_t AuthorizationRemoteViewController.authenticatorHost.getter()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(void *)(v2 + 64);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, (uint64_t)v0 + OBJC_IVAR___AuthorizationRemoteViewController_log, v1);
  unint64_t v5 = (*(unsigned __int8 *)(v2 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v2 + 32))(v6 + v5, v4, v1);
  uint64_t v14 = sub_10003D5B0;
  uint64_t v15 = v6;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_10002DE44;
  uint64_t v13 = &unk_100087870;
  uint64_t v7 = _Block_copy(aBlock);
  swift_release();
  id v8 = [v0 _remoteViewControllerProxyWithErrorHandler:v7];
  _Block_release(v7);
  if (v8)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v11, 0, sizeof(v11));
  }
  sub_10003D78C((uint64_t)v11, (uint64_t)aBlock);
  if (v13)
  {
    sub_100028560(&qword_10009D5E8);
    if (swift_dynamicCast()) {
      return v10[1];
    }
    else {
      return 0;
    }
  }
  else
  {
    sub_10002A660((uint64_t)aBlock);
    return 0;
  }
}

uint64_t sub_10003D520()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

void sub_10003D5B0(uint64_t a1)
{
  type metadata accessor for Logger();
  if (a1)
  {
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v2 = Logger.logObject.getter();
    os_log_type_t v3 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v2, v3))
    {
      uint64_t v4 = (uint8_t *)swift_slowAlloc();
      uint64_t v5 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v4 = 138543362;
      uint64_t v6 = _convertErrorToNSError(_:)();
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      void *v5 = v6;
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Could not obtain remote object with error %{public}@", v4, 0xCu);
      sub_100028560(&qword_10009D280);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
      swift_errorRelease();
    }
    else
    {

      swift_errorRelease();
      swift_errorRelease();
    }
  }
}

uint64_t sub_10003D774(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10003D784()
{
  return swift_release();
}

uint64_t sub_10003D78C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D580);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id static AuthorizationRemoteViewController._exportedInterface()()
{
  return sub_10003D820(&protocolRef_LACUIAuthenticatorService);
}

id static AuthorizationRemoteViewController._remoteViewControllerInterface()()
{
  return sub_10003D820(&protocolRef_LACUIAuthenticatorHost);
}

id sub_10003D820(void *a1)
{
  id v1 = [self interfaceWithProtocol:*a1];

  return v1;
}

id sub_10003D87C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = [self interfaceWithProtocol:*a3];

  return v3;
}

void AuthorizationRemoteViewController.presentUI(configuration:)(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100031288();
  swift_beginAccess();
  id v5 = (id)*v4;
  id v6 = sub_100031904();

  uint64_t v7 = *(void **)&v2[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion];
  *(void *)&v2[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = v6;

  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  id v9 = a1;
  swift_retain();
  id v10 = sub_10003F21C();
  uint64_t v11 = sub_10003F254();
  unint64_t v12 = sub_10003F25C();
  uint64_t v13 = sub_10003F268(v9, 0, v10, 0, 1, v11, 0, v12, (uint64_t)sub_10003EC04, v8);
  swift_release();
  uint64_t v20 = v13;
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "Authorization Sheet will appear", v16, 2u);
    swift_slowDealloc();
  }

  swift_unknownObjectRetain();
  sub_10003F07C();
  uint64_t v17 = v20;
  Swift::Bool canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
  sub_10003F498(v2, canShowWhile, v17);

  uint64_t v19 = *(void **)&v2[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager];
  *(void *)&v2[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = v17;
}

void sub_10003DAA0(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = Strong;
    id v5 = (void *)(*(uint64_t (**)(void))((swift_isaMask & *Strong) + 0x98))();

    if (v5)
    {
      if (a2) {
        id v6 = (void *)_convertErrorToNSError(_:)();
      }
      else {
        id v6 = 0;
      }
      uint64_t v7 = swift_allocObject();
      swift_beginAccess();
      uint64_t v8 = (void *)swift_unknownObjectWeakLoadStrong();
      swift_unknownObjectWeakInit();

      v10[4] = sub_10003EF54;
      v10[5] = v7;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      void v10[2] = sub_100029A40;
      v10[3] = &unk_100087A00;
      id v9 = _Block_copy(v10);
      swift_release();
      [v5 authenticatorServiceDidFinishWithError:v6 reply:v9];
      swift_unknownObjectRelease();
      _Block_release(v9);
    }
  }
}

id AuthorizationRemoteViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = 0;
  *(void *)&v3[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = 0;
  sub_100028560(&qword_10009D560);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10006C390;
  uint64_t v7 = v3;
  *(void *)(v6 + 32) = *(void *)sub_100048C74();
  *(void *)(v6 + 40) = *(void *)sub_100048C80();
  *(void *)(v6 + 48) = *(void *)sub_100048FF4();
  uint64_t v12 = v6;
  sub_10003D2A4();
  sub_100028560(&qword_10009D570);
  sub_10003EBB4(&qword_10009D578, &qword_10009D570);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100048C8C();

  if (a2)
  {
    NSString v8 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v7;
  v11.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController();
  [super initWithNibName:v8 bundle:a3];

  return v9;
}

uint64_t type metadata accessor for AuthorizationRemoteViewController()
{
  uint64_t result = qword_10009E838;
  if (!qword_10009E838) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id AuthorizationRemoteViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager] = 0;
  *(void *)&v1[OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion] = 0;
  sub_100028560(&qword_10009D560);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_10006C390;
  uint64_t v4 = v1;
  *(void *)(v3 + 32) = *(void *)sub_100048C74();
  *(void *)(v3 + 40) = *(void *)sub_100048C80();
  *(void *)(v3 + 48) = *(void *)sub_100048FF4();
  uint64_t v8 = v3;
  sub_10003D2A4();
  sub_100028560(&qword_10009D570);
  sub_10003EBB4(&qword_10009D578, &qword_10009D570);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  sub_100048C8C();

  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController();
  [super initWithCoder:a1];

  return v5;
}

id AuthorizationRemoteViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AuthorizationRemoteViewController();
  return [super dealloc];
}

void AuthorizationRemoteViewController.start(with:reply:)(void *a1, void (*a2)(id))
{
  id v4 = [a1 validateConfiguration];
  if (v4)
  {
    id v5 = v4;
    id v6 = v4;
    a2(v5);
  }
  else
  {
    AuthorizationRemoteViewController.presentUI(configuration:)(a1);
    a2(0);
  }
}

uint64_t AuthorizationRemoteViewController.stop(reply:)(uint64_t (*a1)(void))
{
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v3)
  {
    id v4 = self;
    id v5 = v3;
    id v6 = [v4 errorWithCode:-4];
    objc_super v7 = sub_10003F308();
    sub_10003F324((uint64_t)v6, (uint64_t (*)(uint64_t))v7, v8);

    swift_release();
  }
  return a1(0);
}

void sub_10003E358(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_10003E36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v19 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  id v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = type metadata accessor for DispatchQoS();
  uint64_t v11 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  uint64_t v14 = (void *)static OS_dispatch_queue.main.getter();
  os_log_type_t v15 = (void *)swift_allocObject();
  _OWORD v15[2] = a1;
  v15[3] = a2;
  v15[4] = a3;
  v15[5] = a4;
  aBlock[4] = sub_10003EAE8;
  aBlock[5] = v15;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100029A40;
  void aBlock[3] = &unk_100087960;
  uint64_t v16 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_1000305EC();
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10003EBB4((unint64_t *)&qword_10009D6A0, (uint64_t *)&unk_10009E070);
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v16);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v10, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v18);
}

uint64_t sub_10003E6F8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(a1 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v3)
  {
    id v4 = self;
    id v5 = v3;
    id v6 = [v4 errorWithCode:-4];
    objc_super v7 = sub_10003F308();
    sub_10003F324((uint64_t)v6, (uint64_t (*)(uint64_t))v7, v8);

    swift_release();
  }
  uint64_t v9 = *(uint64_t (**)(uint64_t, void))(a2 + 16);

  return v9(a2, 0);
}

void sub_10003E7B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_super v7 = *(void **)((char *)v4 + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
  if (v7)
  {
    id v10 = v7;
    sub_10003F348(a1, a2, (uint64_t)v10);
  }
  uint64_t v11 = (*(uint64_t (**)(void))((swift_isaMask & *v4) + 0x98))();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v14 = (void *)swift_allocObject();
    v14[2] = a3;
    v14[3] = a4;
    v14[4] = v13;
    v16[4] = sub_10003EA94;
    v16[5] = v14;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 1107296256;
    void v16[2] = sub_10002DE44;
    v16[3] = &unk_100087910;
    os_log_type_t v15 = _Block_copy(v16);
    swift_retain();
    swift_release();
    [v12 authenticatorServiceDidObtainAuthenticationWithReply:v15];
    swift_unknownObjectRelease();
    _Block_release(v15);
  }
}

uint64_t sub_10003E940()
{
  return type metadata accessor for AuthorizationRemoteViewController();
}

uint64_t sub_10003E948()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_10003E9E4()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003EA1C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10003EA54()
{
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10003EA94(uint64_t a1)
{
  return sub_10003E36C(a1, v1[2], v1[3], v1[4]);
}

uint64_t sub_10003EAA0()
{
  swift_errorRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_10003EAE8()
{
  unint64_t v1 = *(void (**)(uint64_t))(v0 + 24);
  if (*(void *)(v0 + 16))
  {
    v1(0);
  }
  else
  {
    v1(1);
    swift_beginAccess();
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    if (Strong)
    {
      uint64_t v3 = (void *)Strong;
      id v4 = *(void **)(Strong + OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager);
      id v5 = v4;

      if (v4)
      {
        id v6 = sub_10003F308();
        sub_10003F324(0, (uint64_t (*)(uint64_t))v6, v7);
        swift_release();
      }
    }
  }
}

uint64_t sub_10003EBB4(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F434(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_10003EC04(uint64_t a1)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (char *)Strong;
    id v4 = Logger.logObject.getter();
    os_log_type_t v5 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v4, v5))
    {
      id v6 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Authorization Sheet did finish", v6, 2u);
      swift_slowDealloc();
    }

    uint64_t v7 = *(void **)&v3[OBJC_IVAR___AuthorizationRemoteViewController_authorizationViewManager];
    if (v7)
    {
      uint64_t v8 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v9 = swift_allocObject();
      *(void *)(v9 + 16) = v8;
      *(void *)(v9 + 24) = a1;
      id v10 = v7;
      swift_retain();
      swift_errorRetain();
      sub_10003F324(a1, (uint64_t (*)(uint64_t))sub_10003ED84, v9);
      swift_release();
      swift_release();
    }
  }
}

void sub_10003ED84()
{
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v1 = *(void *)(v0 + 24);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v4 = (void *)Strong;
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v2;
    *(void *)(v5 + 24) = v1;
    sub_10002B40C(0, &qword_10009E050);
    swift_retain();
    swift_errorRetain();
    swift_retain();
    swift_errorRetain();
    if (sub_1000608FC())
    {
      aBlock[4] = sub_10003EF4C;
      aBlock[5] = v5;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      void aBlock[2] = sub_100029A40;
      void aBlock[3] = &unk_1000879D8;
      id v6 = _Block_copy(aBlock);
      swift_retain();
      swift_release();
      [v4 dismissViewControllerAnimated:1 completion:v6];
      _Block_release(v6);
    }
    else
    {
      sub_10003DAA0(v2, v1);
    }
    swift_release();
    swift_release();
    swift_errorRelease();
  }
}

uint64_t sub_10003EF0C()
{
  swift_release();
  swift_errorRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_10003EF4C()
{
  sub_10003DAA0(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

void sub_10003EF54()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    uint64_t v2 = *(void **)(Strong + OBJC_IVAR___AuthorizationRemoteViewController_terminateAssertion);
    id v3 = v2;

    if (v2)
    {
      sub_1000310F0();
    }
  }
  id v4 = sub_100031288();
  swift_beginAccess();
  id v5 = (id)*v4;
  sub_10003155C();
}

void AuthorizationRemoteViewController.dismiss(_:)()
{
}

uint64_t sub_10003F02C()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_10003F07C()
{
  return swift_unknownObjectRelease();
}

void (*sub_10003F0E0(void *a1))(void **a1)
{
  id v3 = malloc(0x58uLL);
  *a1 = v3;
  v3[10] = v1;
  swift_beginAccess();
  v3[9] = swift_unknownObjectWeakLoadStrong();
  return sub_10003F16C;
}

void sub_10003F16C(void **a1)
{
  uint64_t v1 = *a1;
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();

  free(v1);
}

id sub_10003F21C()
{
  id v0 = objc_allocWithZone((Class)LALocalBackoffCounter);

  return [v0 init];
}

uint64_t sub_10003F254()
{
  return 2;
}

unint64_t sub_10003F25C()
{
  return sub_1000295F8((uint64_t)&_swiftEmptyArrayStorage);
}

char *sub_10003F268(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  char v17 = a5 & 1;
  type metadata accessor for AuthorizationViewModel();
  return sub_10005A818(a1, a2, a3, a4, v17, a6, a7, a8, a9, a10);
}

uint64_t (*sub_10003F308())()
{
  return nullsub_15;
}

uint64_t sub_10003F324(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  return sub_10005C258(a1, a2, a3);
}

void sub_10003F348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = type metadata accessor for String.Encoding();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = *(void **)(a3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  static String.Encoding.utf8.getter();
  uint64_t v9 = String.data(using:allowLossyConversion:)();
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  Class isa = 0;
  if (v11 >> 60 != 15)
  {
    Class isa = Data._bridgeToObjectiveC()().super.isa;
    sub_10002FEA4(v9, v11);
  }
  [v8 setCredential:isa type:-9];
}

void sub_10003F498(void *a1, char a2, void *a3)
{
  uint64_t v6 = type metadata accessor for UIHostingControllerSizingOptions();
  __chkstk_darwin(v6 - 8);
  uint64_t v7 = sub_10004B6A0();
  uint64_t v9 = v8;
  type metadata accessor for AuthorizationViewModel();
  sub_10003FA20();
  uint64_t v52 = static ObservableObject.environmentStore.getter();
  long long v53 = a3;
  id v10 = objc_allocWithZone((Class)sub_100028560(&qword_10009D6B0));
  a3;
  unint64_t v11 = (void *)UIHostingController.init(rootView:)();
  id v12 = [v11 view:v7, v9, v52, v53];
  if (!v12)
  {
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v13 = v12;
  id v14 = [self clearColor];
  [v13 setBackgroundColor:v14];

  sub_10002B40C(0, &qword_10009E050);
  if (sub_1000608FC() && !sub_100059ED8())
  {
    static UIHostingControllerSizingOptions.preferredContentSize.getter();
    dispatch thunk of UIHostingController.sizingOptions.setter();
    [v11 setModalPresentationStyle:2];
    [a1 presentViewController:v11 animated:a2 & 1 completion:0];
    goto LABEL_17;
  }
  id v15 = [a1 view];
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v16 = v15;
  id v17 = [v11 view];
  if (!v17)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  uint64_t v18 = v17;
  [v16 addSubview:v17];

  [a1 addChildViewController:v11];
  [v11 didMoveToParentViewController:a1];
  id v19 = [v11 view];
  if (!v19)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  uint64_t v20 = v19;
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_100028560(&qword_10009CEB0);
  uint64_t v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_10006C400;
  id v22 = [v11 view];
  if (!v22)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v23 = v22;
  id v24 = [v22 leadingAnchor];

  id v25 = [a1 view];
  if (!v25)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  uint64_t v26 = v25;
  id v27 = [v25 leadingAnchor];

  id v28 = [v24 constraintEqualToAnchor:v27];
  *(void *)(v21 + 32) = v28;
  id v29 = [v11 view];
  if (!v29)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  char v30 = v29;
  id v31 = [v29 trailingAnchor];

  id v32 = [a1 view];
  if (!v32)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  uint64_t v33 = v32;
  id v34 = [v32 trailingAnchor];

  id v35 = [v31 constraintEqualToAnchor:v34];
  *(void *)(v21 + 40) = v35;
  id v36 = [v11 view];
  if (!v36)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  uint64_t v37 = v36;
  id v38 = [v36 topAnchor];

  id v39 = [a1 view];
  if (!v39)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  unint64_t v40 = v39;
  id v41 = [v39 topAnchor];

  id v42 = [v38 constraintEqualToAnchor:v41];
  *(void *)(v21 + 48) = v42;
  id v43 = [v11 view];
  if (!v43)
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  uint64_t v44 = v43;
  id v45 = [v43 bottomAnchor];

  id v46 = [a1 view];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = self;
    id v49 = [v47 bottomAnchor];

    id v50 = [v45 constraintEqualToAnchor:v49];
    *(void *)(v21 + 56) = v50;
    specialized Array._endMutation()();
    sub_10002B40C(0, (unint64_t *)&qword_10009CEB8);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v48 activateConstraints:isa, v21];

LABEL_17:
    return;
  }
LABEL_29:
  __break(1u);
}

unint64_t sub_10003FA20()
{
  unint64_t result = qword_10009D6A8;
  if (!qword_10009D6A8)
  {
    type metadata accessor for AuthorizationViewModel();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D6A8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationViewManager()
{
  return &type metadata for AuthorizationViewManager;
}

uint64_t sub_10003FA88()
{
  sub_100028560(&qword_10009D6B8);
  Binding.wrappedValue.getter();
  return v1;
}

uint64_t sub_10003FAD8()
{
  return Binding.wrappedValue.setter();
}

void (*sub_10003FB2C(void *a1))(uint64_t a1)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = *(void *)(v1 + 16);
  v3[3] = v4;
  void v3[4] = v5;
  char v6 = *(unsigned char *)(v1 + 24);
  *((unsigned char *)v3 + 19) = v6;
  void *v3 = v4;
  v3[1] = v5;
  *((unsigned char *)v3 + 16) = v6;
  swift_retain();
  swift_retain();
  void v3[5] = sub_100028560(&qword_10009D6B8);
  Binding.wrappedValue.getter();
  return sub_10003FBCC;
}

void sub_10003FBCC(uint64_t a1)
{
  uint64_t v1 = *(void **)a1;
  char v2 = *(unsigned char *)(*(void *)a1 + 17);
  uint64_t v3 = *(void *)(*(void *)a1 + 32);
  char v4 = *(unsigned char *)(*(void *)a1 + 19);
  *uint64_t v1 = *(void *)(*(void *)a1 + 24);
  v1[1] = v3;
  *((unsigned char *)v1 + 16) = v4;
  *((unsigned char *)v1 + 18) = v2;
  Binding.wrappedValue.setter();
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_10003FC3C()
{
  sub_100028560(&qword_10009D6B8);
  Binding.projectedValue.getter();
  return v1;
}

uint64_t sub_10003FC90()
{
  return sub_10003FF44((uint64_t (*)(uint64_t))&Binding.wrappedValue.getter);
}

uint64_t type metadata accessor for PasscodeEmbeddedView(uint64_t a1)
{
  return sub_10003CE50(a1, (uint64_t *)&unk_10009E970);
}

uint64_t sub_10003FCC8(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v2 - 8);
  char v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PasscodeEmbeddedView(0);
  sub_10002AA34(a1, (uint64_t)v4, &qword_10009E000);
  sub_100028560(&qword_10009D6C0);
  Binding.wrappedValue.setter();
  return sub_10002F024(a1, &qword_10009E000);
}

void (*sub_10003FD84(void **a1))(uint64_t a1, char a2)
{
  size_t v3 = *(void *)(*(void *)(sub_100028560(&qword_10009E000) - 8) + 64);
  *a1 = malloc(v3);
  a1[1] = malloc(v3);
  uint64_t v4 = sub_100028560(&qword_10009D6C0);
  a1[2] = (void *)v4;
  uint64_t v5 = malloc(*(void *)(*(void *)(v4 - 8) + 64));
  a1[3] = v5;
  uint64_t v6 = type metadata accessor for PasscodeEmbeddedView(0);
  sub_10002AA34(v1 + *(int *)(v6 + 24), (uint64_t)v5, &qword_10009D6C0);
  Binding.wrappedValue.getter();
  return sub_10003FE74;
}

void sub_10003FE74(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)(a1 + 24);
  size_t v3 = *(void **)a1;
  uint64_t v4 = *(void **)(a1 + 8);
  if (a2)
  {
    sub_10002AA34(*(void *)(a1 + 8), (uint64_t)v3, &qword_10009E000);
    Binding.wrappedValue.setter();
    sub_10002F024((uint64_t)v2, &qword_10009D6C0);
    uint64_t v5 = (uint64_t)v4;
    uint64_t v6 = &qword_10009E000;
  }
  else
  {
    Binding.wrappedValue.setter();
    uint64_t v6 = &qword_10009D6C0;
    uint64_t v5 = (uint64_t)v2;
  }
  sub_10002F024(v5, v6);
  free(v2);
  free(v4);

  free(v3);
}

uint64_t sub_10003FF2C()
{
  return sub_10003FF44((uint64_t (*)(uint64_t))&Binding.projectedValue.getter);
}

uint64_t sub_10003FF44(uint64_t (*a1)(uint64_t))
{
  type metadata accessor for PasscodeEmbeddedView(0);
  uint64_t v2 = sub_100028560(&qword_10009D6C0);
  return a1(v2);
}

uint64_t sub_10003FF98@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, char a5@<W4>, uint64_t a6@<X5>, uint64_t a7@<X6>, int a8@<W7>, uint64_t a9@<X8>, uint64_t a10, uint64_t a11, uint64_t a12)
{
  int v33 = a8;
  uint64_t v31 = a6;
  uint64_t v32 = a7;
  uint64_t v34 = a10;
  uint64_t v18 = sub_100028560(&qword_10009D6C8);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v21 = objc_allocWithZone((Class)type metadata accessor for PasscodeEmbeddedParentViewController(0));
  sub_100029A94(a11);
  id v22 = sub_1000407B0(a1, a2, a3, a4, a5, a11, a12);
  uint64_t v24 = v31;
  uint64_t v23 = v32;
  *(void *)a9 = v22;
  *(void *)(a9 + 8) = v24;
  *(void *)(a9 + 16) = v23;
  *(unsigned char *)(a9 + 24) = v33;
  uint64_t v25 = type metadata accessor for PasscodeEmbeddedView(0);
  uint64_t v26 = v34;
  sub_10002AA34(v34, a9 + *(int *)(v25 + 24), &qword_10009D6C0);
  sub_100040998(a9, (uint64_t)v20);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v25 - 8) + 56))(v20, 0, 1, v25);
  uint64_t v27 = (uint64_t)&v22[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  swift_beginAccess();
  swift_retain();
  swift_retain();
  id v28 = v22;
  sub_1000409FC((uint64_t)v20, v27);
  swift_endAccess();
  sub_10002A998(a11);

  swift_release();
  swift_release();
  return sub_10002F024(v26, &qword_10009D6C0);
}

char *sub_10004018C(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  id v15 = objc_allocWithZone(v7);
  return sub_1000407B0(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t sub_100040208(uint64_t a1)
{
  uint64_t v3 = sub_100028560(&qword_10009D6C8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100040998(a1, (uint64_t)v5);
  uint64_t v6 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 0, 1, v6);
  uint64_t v7 = v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess();
  sub_1000409FC((uint64_t)v5, v7);
  return swift_endAccess();
}

uint64_t type metadata accessor for PasscodeEmbeddedParentViewController(uint64_t a1)
{
  return sub_10003CE50(a1, (uint64_t *)&unk_10009E980);
}

id sub_100040320()
{
  return *v0;
}

id sub_100040328(uint64_t a1)
{
  uint64_t v3 = type metadata accessor for Date();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)v19 - v8;
  uint64_t v10 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v10 - 8);
  id v12 = (char *)v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PasscodeEmbeddedView(0);
  sub_100028560(&qword_10009D6C0);
  Binding.wrappedValue.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v12, 1, v3))
  {
    sub_10002F024((uint64_t)v12, &qword_10009E000);
    double v13 = 0.0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v9, v12, v3);
    sub_10002F024((uint64_t)v12, &qword_10009E000);
    Date.init()();
    Date.timeIntervalSince(_:)();
    double v13 = v14;
    id v15 = *(void (**)(char *, uint64_t))(v4 + 8);
    v15(v7, v3);
    v15(v9, v3);
  }
  uint64_t v16 = *(void *)(v1 + 16);
  char v17 = *(unsigned char *)(v1 + 24);
  v19[1] = *(void *)(v1 + 8);
  v19[2] = v16;
  char v20 = v17;
  sub_100028560(&qword_10009D6B8);
  Binding.wrappedValue.getter();
  return [*(id *)(a1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController) setBackoffTimeout:0 showBackoffTitle:v21 passcodeFocused:v13];
}

id sub_100040574(char a1)
{
  return [*(id *)(v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController) setBackoffTimeout:0 showBackoffTitle:a1 & 1];
}

uint64_t sub_1000405A8()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t sub_1000405E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004307C(&qword_10009D7D0);

  return static UIViewControllerRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100040664(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10004307C(&qword_10009D7D0);

  return static UIViewControllerRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_1000406E4()
{
  return static View._viewListCount(inputs:)();
}

void sub_100040700()
{
}

uint64_t sub_100040744@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = type metadata accessor for PasscodeEmbeddedView(0);
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

char *sub_1000407B0(uint64_t a1, char a2, uint64_t a3, uint64_t a4, char a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8 = v7;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v15 = &v8[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  uint64_t v16 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v15, 1, 1, v16);
  char v17 = (uint64_t *)&v8[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode];
  uint64_t *v17 = 0;
  v17[1] = 0;
  id v18 = objc_allocWithZone((Class)PasscodeEmbeddedCustomizableViewController);
  uint64_t v19 = v8;
  id v20 = [v18 initWithPasscodeLength:a1 alphanumeric:a2 & 1];
  *(void *)&v19[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController] = v20;
  id v21 = v20;
  if (a4)
  {
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v22 = 0;
  }
  [v20 setPlaceholderText:v22];

  uint64_t v23 = *v17;
  uint64_t *v17 = a6;
  v17[1] = a7;
  sub_100029A94(a6);
  sub_10002A998(v23);
  v19[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear] = a5 & 1;

  v30.receiver = v19;
  v30.super_class = ObjectType;
  uint64_t v24 = (char *)[super initWithNibName:0 bundle:0];
  uint64_t v25 = *(void **)&v24[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController];
  uint64_t v26 = v24;
  id v27 = v25;
  [v27 setDelegate:v26];
  sub_10002A998(a6);

  return v26;
}

uint64_t sub_100040998(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000409FC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D6C8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

void sub_100040A64()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView];
  uint64_t v2 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  uint64_t v3 = &v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;

  _assertionFailure(_:_:file:line:flags:)();
  __break(1u);
}

void sub_100040BF4()
{
  id v1 = [objc_allocWithZone((Class)UIView) init];
  [v0 setView:v1];

  id v2 = [v0 view];
  if (!v2)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v3 = v2;
  uint64_t v4 = *(void **)&v0[OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeViewController];
  id v5 = [v4 view];
  if (!v5)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  [v3 addSubview:v5];

  [v0 addChildViewController:v4];
  [v4 didMoveToParentViewController:v0];
  id v7 = [v4 view];
  if (!v7)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  sub_100028560(&qword_10009CEB0);
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_10006C400;
  id v10 = [v4 view];
  if (!v10)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  id v12 = [v10 trailingAnchor];

  id v13 = [v0 view];
  if (!v13)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  double v14 = v13;
  id v15 = [v13 trailingAnchor];

  id v16 = [v12 constraintEqualToAnchor:v15];
  *(void *)(v9 + 32) = v16;
  id v17 = [v4 view];
  if (!v17)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  id v18 = v17;
  id v19 = [v17 leadingAnchor];

  id v20 = [v0 view];
  if (!v20)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  id v21 = v20;
  id v22 = [v20 leadingAnchor];

  id v23 = [v19 constraintEqualToAnchor:v22];
  *(void *)(v9 + 40) = v23;
  id v24 = [v4 view];
  if (!v24)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  uint64_t v25 = v24;
  id v26 = [v24 topAnchor];

  id v27 = [v0 view];
  if (!v27)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  id v28 = v27;
  id v29 = [v27 topAnchor];

  id v30 = [v26 constraintEqualToAnchor:v29];
  *(void *)(v9 + 48) = v30;
  id v31 = [v4 view];
  if (!v31)
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  uint64_t v32 = v31;
  id v33 = [v31 bottomAnchor];

  id v34 = [v0 view];
  if (!v34)
  {
LABEL_25:
    __break(1u);
    return;
  }
  id v35 = v34;
  id v36 = self;
  id v37 = [v35 bottomAnchor];

  id v38 = [v33 constraintEqualToAnchor:v37];
  *(void *)(v9 + 56) = v38;
  specialized Array._endMutation()();
  sub_100041034();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v36 activateConstraints:isa];
}

unint64_t sub_100041034()
{
  unint64_t result = qword_10009CEB8;
  if (!qword_10009CEB8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10009CEB8);
  }
  return result;
}

uint64_t sub_1000410BC(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100028560(&qword_10009E080);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = v1;
  v12.super_class = ObjectType;
  [super viewWillAppear:a1 & 1];
  uint64_t v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);
  type metadata accessor for MainActor();
  id v8 = v1;
  uint64_t v9 = static MainActor.shared.getter();
  id v10 = (void *)swift_allocObject();
  void v10[2] = v9;
  v10[3] = &protocol witness table for MainActor;
  v10[4] = v8;
  sub_1000415B4((uint64_t)v6, (uint64_t)&unk_10009D6E0, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_100041200(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a1;
  v4[9] = a4;
  uint64_t v5 = type metadata accessor for PasscodeEmbeddedView(0);
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = type metadata accessor for MainActor();
  v4[14] = static MainActor.shared.getter();
  return _swift_task_switch(sub_1000412D8, 0, 0);
}

uint64_t sub_1000412D8()
{
  *(void *)(v0 + 120) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100041364, v2, v1);
}

uint64_t sub_100041364()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v1);
  if (!v5)
  {
    uint64_t v6 = *(void *)(v0 + 96);
    sub_100040998(v4, v6);
    uint64_t v7 = *(void *)(v6 + 16);
    char v8 = *(unsigned char *)(v6 + 24);
    *(void *)(v0 + 40) = *(void *)(v6 + 8);
    *(void *)(v0 + 48) = v7;
    *(unsigned char *)(v0 + 56) = v8;
    *(unsigned char *)(v0 + 57) = 1;
    sub_100028560(&qword_10009D6B8);
    Binding.wrappedValue.setter();
    sub_1000430C0(v6);
  }
  **(unsigned char **)(v0 + 64) = v5 != 0;
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_1000414A4, v10, v9);
}

uint64_t sub_1000414A4()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100041514(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100043404;
  return sub_100041200(a1, v5, v6, v4);
}

uint64_t sub_1000415B4(uint64_t a1, uint64_t a2, uint64_t a3)
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
  sub_10002F024(a1, &qword_10009E080);
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
  sub_100028560((uint64_t *)&unk_10009E190);
  return swift_task_create();
}

id sub_1000418B8(char a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = sub_100028560(&qword_10009E080);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12.receiver = v1;
  v12.super_class = ObjectType;
  id result = [super viewWillDisappear:a1 & 1];
  if (*((unsigned char *)v1 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_dismissKeyboardOnDissappear) == 1)
  {
    uint64_t v8 = type metadata accessor for TaskPriority();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
    type metadata accessor for MainActor();
    id v9 = v1;
    uint64_t v10 = static MainActor.shared.getter();
    uint64_t v11 = (void *)swift_allocObject();
    _OWORD v11[2] = v10;
    v11[3] = &protocol witness table for MainActor;
    v11[4] = v9;
    sub_1000415B4((uint64_t)v6, (uint64_t)&unk_10009D6F0, (uint64_t)v11);
    return (id)swift_release();
  }
  return result;
}

uint64_t sub_100041A10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[8] = a1;
  v4[9] = a4;
  uint64_t v5 = type metadata accessor for PasscodeEmbeddedView(0);
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = type metadata accessor for MainActor();
  v4[14] = static MainActor.shared.getter();
  return _swift_task_switch(sub_100041AE8, 0, 0);
}

uint64_t sub_100041AE8()
{
  *(void *)(v0 + 120) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100041B74, v2, v1);
}

uint64_t sub_100041B74()
{
  uint64_t v1 = *(void *)(v0 + 80);
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  swift_release();
  uint64_t v4 = v3 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_passcodeEmbeddedView;
  swift_beginAccess();
  int v5 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v4, 1, v1);
  if (!v5)
  {
    uint64_t v6 = *(void *)(v0 + 96);
    sub_100040998(v4, v6);
    uint64_t v7 = *(void *)(v6 + 16);
    unsigned __int8 v8 = *(unsigned char *)(v6 + 24);
    *(void *)(v0 + 40) = *(void *)(v6 + 8);
    *(void *)(v0 + 48) = v7;
    *(_WORD *)(v0 + 56) = v8;
    sub_100028560(&qword_10009D6B8);
    Binding.wrappedValue.setter();
    sub_1000430C0(v6);
  }
  **(unsigned char **)(v0 + 64) = v5 != 0;
  uint64_t v10 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100043400, v10, v9);
}

uint64_t sub_100041CAC(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100043404;
  return sub_100041A10(a1, v5, v6, v4);
}

uint64_t sub_100041EB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4
                                                                 + OBJC_IVAR____TtC10CoreAuthUI36PasscodeEmbeddedParentViewController_verifyPasscode);
  if (v5)
  {
    uint64_t v9 = result;
    swift_retain();
    v5(v9, a2, a3, a4);
    return sub_10002A998((uint64_t)v5);
  }
  return result;
}

void sub_10004205C()
{
}

uint64_t sub_100042128()
{
  return sub_10004307C(&qword_10009D6F8);
}

void *sub_10004215C()
{
  return &protocol witness table for Never;
}

char *sub_100042168(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  uint64_t v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v6 = a2[2];
    *((void *)a1 + 1) = a2[1];
    *((void *)a1 + 2) = v6;
    a1[24] = *((unsigned char *)a2 + 24);
    uint64_t v7 = *(int *)(a3 + 24);
    unsigned __int8 v8 = &a1[v7];
    uint64_t v9 = (uint64_t)a2 + v7;
    uint64_t v10 = *(uint64_t *)((char *)a2 + v7 + 8);
    *(void *)unsigned __int8 v8 = *(char **)((char *)a2 + v7);
    *((void *)v8 + 1) = v10;
    uint64_t v11 = v5;
    swift_retain();
    swift_retain();
    swift_retain();
    swift_retain();
    uint64_t v12 = *(int *)(sub_100028560(&qword_10009D6C0) + 32);
    id v13 = &v8[v12];
    double v14 = (const void *)(v9 + v12);
    uint64_t v15 = type metadata accessor for Date();
    uint64_t v16 = *(void *)(v15 - 8);
    if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15))
    {
      uint64_t v17 = sub_100028560(&qword_10009E000);
      memcpy(v13, v14, *(void *)(*(void *)(v17 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, const void *, uint64_t))(v16 + 16))(v13, v14, v15);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
    }
  }
  return a1;
}

uint64_t sub_100042320(id *a1, uint64_t a2)
{
  swift_release();
  swift_release();
  int v4 = (char *)a1 + *(int *)(a2 + 24);
  swift_release();
  swift_release();
  uint64_t v5 = &v4[*(int *)(sub_100028560(&qword_10009D6C0) + 32)];
  uint64_t v6 = type metadata accessor for Date();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    unsigned __int8 v8 = *(uint64_t (**)(char *, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_100042424(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (void *)(a1 + v6);
  uint64_t v8 = a2 + v6;
  uint64_t v9 = *(void *)(a2 + v6 + 8);
  void *v7 = *(void *)(a2 + v6);
  v7[1] = v9;
  id v10 = v4;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v11 = *(int *)(sub_100028560(&qword_10009D6C0) + 32);
  uint64_t v12 = (char *)v7 + v11;
  id v13 = (const void *)(v8 + v11);
  uint64_t v14 = type metadata accessor for Date();
  uint64_t v15 = *(void *)(v14 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    uint64_t v16 = sub_100028560(&qword_10009E000);
    memcpy(v12, v13, *(void *)(*(void *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v15 + 16))(v12, v13, v14);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  return a1;
}

uint64_t sub_100042594(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a2;
  uint64_t v7 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v8 = v6;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_retain();
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v9 = *(int *)(a3 + 24);
  uint64_t v10 = a1 + v9;
  uint64_t v11 = (void *)(a2 + v9);
  *(void *)(a1 + v9) = *v11;
  swift_retain();
  swift_release();
  *(void *)(v10 + 8) = v11[1];
  swift_retain();
  swift_release();
  uint64_t v12 = *(int *)(sub_100028560(&qword_10009D6C0) + 32);
  id v13 = (void *)(v10 + v12);
  uint64_t v14 = (char *)v11 + v12;
  uint64_t v15 = type metadata accessor for Date();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v16 + 48);
  int v18 = v17(v13, 1, v15);
  int v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(void *, char *, uint64_t))(v16 + 24))(v13, v14, v15);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v16 + 8))(v13, v15);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    uint64_t v20 = sub_100028560(&qword_10009E000);
    memcpy(v13, v14, *(void *)(*(void *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v16 + 16))(v13, v14, v15);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v16 + 56))(v13, 0, 1, v15);
  return a1;
}

uint64_t sub_1000427A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = a2 + v4;
  uint64_t v7 = *(void *)(a2 + v4 + 8);
  void *v5 = *(void *)(a2 + v4);
  v5[1] = v7;
  uint64_t v8 = *(int *)(sub_100028560(&qword_10009D6C0) + 32);
  uint64_t v9 = (char *)v5 + v8;
  uint64_t v10 = (const void *)(v6 + v8);
  uint64_t v11 = type metadata accessor for Date();
  uint64_t v12 = *(void *)(v11 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
  {
    uint64_t v13 = sub_100028560(&qword_10009E000);
    memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, const void *, uint64_t))(v12 + 32))(v9, v10, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
  }
  return a1;
}

uint64_t sub_1000428E4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_release();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_release();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = a1 + v7;
  uint64_t v9 = (void *)(a2 + v7);
  *(void *)(a1 + v7) = *v9;
  swift_release();
  *(void *)(v8 + 8) = v9[1];
  swift_release();
  uint64_t v10 = *(int *)(sub_100028560(&qword_10009D6C0) + 32);
  uint64_t v11 = (void *)(v8 + v10);
  uint64_t v12 = (char *)v9 + v10;
  uint64_t v13 = type metadata accessor for Date();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v14 + 48);
  int v16 = v15(v11, 1, v13);
  int v17 = v15(v12, 1, v13);
  if (!v16)
  {
    if (!v17)
    {
      (*(void (**)(void *, char *, uint64_t))(v14 + 40))(v11, v12, v13);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v14 + 8))(v11, v13);
    goto LABEL_6;
  }
  if (v17)
  {
LABEL_6:
    uint64_t v18 = sub_100028560(&qword_10009E000);
    memcpy(v11, v12, *(void *)(*(void *)(v18 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, char *, uint64_t))(v14 + 32))(v11, v12, v13);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v14 + 56))(v11, 0, 1, v13);
  return a1;
}

uint64_t sub_100042ACC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100042AE0);
}

uint64_t sub_100042AE0(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_100028560(&qword_10009D6C0);
    uint64_t v9 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = (char *)a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100042B94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100042BA8);
}

void *sub_100042BA8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *uint64_t result = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_100028560(&qword_10009D6C0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100042C54()
{
  sub_100042CF8();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_100042CF8()
{
  if (!qword_10009D758)
  {
    sub_10002F434(&qword_10009E000);
    unint64_t v0 = type metadata accessor for Binding();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10009D758);
    }
  }
}

uint64_t sub_100042D54()
{
  return type metadata accessor for PasscodeEmbeddedParentViewController(0);
}

void sub_100042D5C()
{
  sub_100042E10();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100042E10()
{
  if (!qword_10009D7B8)
  {
    type metadata accessor for PasscodeEmbeddedView(255);
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10009D7B8);
    }
  }
}

uint64_t sub_100042E68()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100042EA8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100042EE8(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100042F88;
  return sub_100041200(a1, v5, v6, v4);
}

uint64_t sub_100042F88()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10004307C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for PasscodeEmbeddedView(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1000430C0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for PasscodeEmbeddedView(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004311C(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  void *v3 = v2;
  v3[1] = sub_1000431FC;
  return v5(v2 + 32);
}

uint64_t sub_1000431FC()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  unsigned char *v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t sub_100043310()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100043348(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100042F88;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10009D7D8 + dword_10009D7D8);
  return v6(a1, v4);
}

void sub_100043410(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  [super viewWillAppear:a1 & 1];
  id v3 = sub_100043474(v1);
  uint64_t v4 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  *(void *)&v1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = v3;
}

id sub_100043474(char *a1)
{
  id result = [*(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context] externalizedContext];
  if (!result)
  {
    __break(1u);
    goto LABEL_48;
  }
  id v3 = result;
  uint64_t v4 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v6 = v5;

  id v7 = objc_allocWithZone((Class)LACUIAuthenticatorServiceConfiguration);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  id v9 = [v7 initWithContext:isa requirement:3];
  sub_10002ADFC(v4, v6);

  id result = [a1 options];
  if (!result)
  {
LABEL_48:
    __break(1u);
LABEL_49:
    __break(1u);
    goto LABEL_50;
  }
  uint64_t v10 = result;
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_10002A9F0((uint64_t)v55), (v13 & 1) != 0))
  {
    sub_10002B158(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v55);
  if (*((void *)&v57 + 1))
  {
    sub_10002B40C(0, &qword_10009CD18);
    if (swift_dynamicCast())
    {
      id v14 = [(id)0x41B localizedDescription];

      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v56);
  }
  NSString v15 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setPrompt:v15];

  [v9 setPasscodeLength:LACustomPasswordTypeCustomDigits];
  sub_100027310();
  NSString v16 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setCancelButtonTitle:v16];

  id result = [a1 callerName];
  if (!result) {
    goto LABEL_49;
  }
  int v17 = result;
  [v9 setTitle:result];

  id result = [a1 options];
  if (!result)
  {
LABEL_50:
    __break(1u);
LABEL_51:
    __break(1u);
    goto LABEL_52;
  }
  uint64_t v18 = result;
  uint64_t v19 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v19 + 16) && (unint64_t v20 = sub_10002A9F0((uint64_t)v55), (v21 & 1) != 0))
  {
    sub_10002B158(*(void *)(v19 + 56) + 32 * v20, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v55);
  if (*((void *)&v57 + 1))
  {
    if (swift_dynamicCast()) {
      goto LABEL_28;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v56);
  }
  id result = [a1 options];
  if (!result)
  {
LABEL_53:
    __break(1u);
    goto LABEL_54;
  }
  id v22 = result;
  uint64_t v23 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v23 + 16) && (unint64_t v24 = sub_10002A9F0((uint64_t)v55), (v25 & 1) != 0))
  {
    sub_10002B158(*(void *)(v23 + 56) + 32 * v24, (uint64_t)&v56);
  }
  else
  {
    long long v56 = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)v55);
  if (!*((void *)&v57 + 1))
  {
    sub_10002A660((uint64_t)&v56);
    goto LABEL_34;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_34:
    id result = [a1 callerName];
    if (!result)
    {
LABEL_52:
      __break(1u);
      goto LABEL_53;
    }
    id v36 = result;
    uint64_t v37 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v39 = v38;

    sub_100027FD0(v37, v39);
    goto LABEL_36;
  }
LABEL_28:
  id v26 = self;
  NSString v27 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v28 = [v26 truncateString:v27 maxLength:512];

  if (!v28) {
    goto LABEL_34;
  }
  uint64_t v29 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v31 = v30;

  if (String.count.getter() < 1)
  {
    swift_bridgeObjectRelease();
    goto LABEL_34;
  }
  id result = [a1 callerName];
  if (result)
  {
    uint64_t v32 = result;
    uint64_t v33 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v35 = v34;

    sub_100028118(v29, v31, v33, v35);
    swift_bridgeObjectRelease();
LABEL_36:
    swift_bridgeObjectRelease();
    NSString v40 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v9 setSubtitle:v40];

    sub_100027AB0();
    NSString v41 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    [v9 setPasswordFieldPlaceholder:v41];

    [v9 setStyle:0];
    id result = [a1 internalInfo];
    if (result)
    {
      id v42 = result;
      uint64_t v43 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

      AnyHashable.init<A>(_:)();
      if (*(void *)(v43 + 16) && (unint64_t v44 = sub_10002A9F0((uint64_t)v55), (v45 & 1) != 0))
      {
        sub_10002B158(*(void *)(v43 + 56) + 32 * v44, (uint64_t)&v56);
      }
      else
      {
        long long v56 = 0u;
        long long v57 = 0u;
      }
      swift_bridgeObjectRelease();
      sub_10002AC8C((uint64_t)v55);
      if (*((void *)&v57 + 1))
      {
        if (swift_dynamicCast())
        {
          NSString v46 = String._bridgeToObjectiveC()();
          swift_bridgeObjectRelease();
LABEL_46:
          [v9 setBundleIdentifier:v46];

          uint64_t v47 = swift_allocObject();
          swift_unknownObjectWeakInit();
          id v48 = v9;
          swift_retain();
          id v49 = sub_10003F21C();
          uint64_t v50 = sub_10003F254();
          unint64_t v51 = sub_10003F25C();
          uint64_t v52 = sub_10003F268(v48, 0, v49, 0, 1, v50, 0, v51, (uint64_t)sub_100045760, v47);
          swift_release();
          v55[0] = v52;
          swift_unknownObjectRetain();
          sub_10003F07C();
          id v53 = v55[0];
          Swift::Bool canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
          sub_10003F498(a1, canShowWhile, v53);

          return v53;
        }
      }
      else
      {
        sub_10002A660((uint64_t)&v56);
      }
      NSString v46 = 0;
      goto LABEL_46;
    }
    goto LABEL_51;
  }
LABEL_54:
  __break(1u);
  return result;
}

void sub_100043D7C(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  sub_10002B40C(0, &qword_10009E050);
  if (sub_1000608FC())
  {
    uint64_t v6 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v7 = (void *)swift_allocObject();
    void v7[2] = v6;
    v7[3] = a1;
    void v7[4] = a2;
    v15[4] = sub_10004400C;
    v15[5] = v7;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 1107296256;
    _OWORD v15[2] = sub_100029A40;
    v15[3] = &unk_100087BB8;
    uint64_t v8 = _Block_copy(v15);
    sub_100029A94(a1);
    swift_release();
    [v3 dismissViewControllerAnimated:1 completion:v8];
    _Block_release(v8);
  }
  else
  {
    id v9 = *(void **)&v2[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
    if (v9)
    {
      uint64_t v10 = self;
      id v11 = v9;
      id v12 = [v10 errorWithCode:-4];
      uint64_t v13 = swift_allocObject();
      swift_unknownObjectWeakInit();
      id v14 = (void *)swift_allocObject();
      v14[2] = v13;
      v14[3] = a1;
      v14[4] = a2;
      sub_100029A94(a1);
      swift_retain();
      sub_10003F324((uint64_t)v12, (uint64_t (*)(uint64_t))sub_100043FFC, (uint64_t)v14);

      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_100043FC0()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_100043FFC()
{
}

void sub_10004400C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(void *)(v0 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    unint64_t v5 = *(void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager);
    if (v5)
    {
      id v6 = v5;

      id v7 = [self errorWithCode:-4];
      uint64_t v8 = swift_allocObject();
      swift_beginAccess();
      id v9 = (void *)swift_unknownObjectWeakLoadStrong();
      swift_unknownObjectWeakInit();

      uint64_t v10 = (void *)swift_allocObject();
      void v10[2] = v8;
      v10[3] = v1;
      v10[4] = v2;
      swift_retain();
      sub_100029A94(v1);
      sub_10003F324((uint64_t)v7, (uint64_t (*)(uint64_t))sub_100045660, (uint64_t)v10);
      swift_release();
      swift_release();

      uint64_t v4 = v6;
    }
  }
}

uint64_t sub_10004417C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004418C()
{
  return swift_release();
}

id sub_10004424C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  id v6 = v5;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v12 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  id v13 = objc_allocWithZone((Class)LAContext);
  id v14 = v6;
  *(void *)&v6[v12] = [v13 init];
  *(void *)&v14[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v18.receiver = v14;
  v18.super_class = ObjectType;
  id v16 = [super initWithInternalInfo:isa mechanism:a2 backoffCounter:a3 remoteUIHost:a4 allowsLandscape:a5 & 1];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v16;
}

id sub_1000444D4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  id v9 = objc_allocWithZone((Class)LAContext);
  uint64_t v10 = v4;
  *(void *)&v4[v8] = [v9 init];
  *(void *)&v10[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  if (a2)
  {
    NSString v11 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v11 = 0;
  }
  v14.receiver = v10;
  v14.super_class = ObjectType;
  [super initWithNibName:v11 bundle:a3];

  return v12;
}

id sub_100044620(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  id v5 = objc_allocWithZone((Class)LAContext);
  id v6 = v1;
  *(void *)&v1[v4] = [v5 init];
  *(void *)&v6[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  v9.receiver = v6;
  v9.super_class = ObjectType;
  id v7 = [super initWithCoder:a1];

  return v7;
}

id sub_1000446F4(uint64_t a1, void *a2)
{
  if (!a1)
  {
    v4.super.Class isa = 0;
    uint64_t v5 = a2[3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = sub_10002A3A8(a2, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  objc_super v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10002A3EC((uint64_t)a2);
LABEL_6:
  id v11 = [objc_allocWithZone(v2) initWithInternalInfo:v4.super.isa parent:v10];

  swift_unknownObjectRelease();
  return v11;
}

id sub_100044880(uint64_t a1, uint64_t a2)
{
  id v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_context;
  id v8 = objc_allocWithZone((Class)LAContext);
  objc_super v9 = v3;
  *(void *)&v3[v7] = [v8 init];
  *(void *)&v9[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager] = 0;

  if (a1)
  {
    v10.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v10.super.Class isa = 0;
  }
  sub_10002AA34(a2, (uint64_t)v21, &qword_10009D580);
  uint64_t v11 = v22;
  if (v22)
  {
    id v12 = sub_10002A3A8(v21, v22);
    uint64_t v13 = *(void *)(v11 - 8);
    __chkstk_darwin(v12);
    NSString v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v11);
    sub_10002A3EC((uint64_t)v21);
  }
  else
  {
    uint64_t v16 = 0;
  }
  v20.receiver = v9;
  v20.super_class = ObjectType;
  id v17 = [super initWithInternalInfo:v10.super.isa parent:v16];

  swift_unknownObjectRelease();
  id v18 = v17;
  sub_10002A660(a2);
  if (v18) {

  }
  return v18;
}

id sub_100044B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v5 = v4;
  id result = [v4 options];
  if (!result)
  {
    __break(1u);
LABEL_25:
    __break(1u);
    return result;
  }
  NSDictionary v10 = result;
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_10002A9F0((uint64_t)&v26), (v13 & 1) != 0))
  {
    sub_10002B158(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v28);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v26);
  if (*((void *)&v29 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && String.count.getter() < 1046) {
      return (id)a4(0);
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v28);
  }
  id result = [v5 options];
  if (!result) {
    goto LABEL_25;
  }
  uint64_t v14 = result;
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_10002A9F0((uint64_t)&v26), (v17 & 1) != 0))
  {
    sub_10002B158(*(void *)(v15 + 56) + 32 * v16, (uint64_t)&v28);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v26);
  if (*((void *)&v29 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && String.count.getter() > 1047) {
      return (id)a4(0);
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v28);
  }
  sub_100028560(&qword_10009CD00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10006BB40;
  uint64_t v26 = 0x746C75736552;
  unint64_t v27 = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  sub_100028560(&qword_10009D7F8);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = xmmword_10006BB30;
  *(void *)(v19 + 32) = 5;
  *(unsigned char *)(v19 + 40) = 1;
  unint64_t v20 = sub_1000450F4(v19);
  swift_setDeallocating();
  *(void *)(inited + 96) = sub_100028560(&qword_10009D800);
  *(void *)(inited + 72) = v20;
  uint64_t v26 = 5130576;
  unint64_t v27 = 0xE300000000000000;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = a2;
  *(void *)(inited + 152) = a3;
  swift_bridgeObjectRetain();
  sub_1000295F8(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v5 uiSuccessWithResult:isa];

  id result = (id)a4(1);
  uint64_t v22 = *(void **)&v5[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  if (v22)
  {
    id v23 = v22;
    unint64_t v24 = sub_10003F308();
    sub_10003F324(0, (uint64_t (*)(uint64_t))v24, v25);

    return (id)swift_release();
  }
  return result;
}

unint64_t sub_100045014(uint64_t a1)
{
  uint64_t v2 = static Hasher._hash(seed:_:)();

  return sub_100045058(a1, v2);
}

unint64_t sub_100045058(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = v2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t result = a2 & ~v5;
  if ((*(void *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result))
  {
    uint64_t v7 = *(void *)(v2 + 48);
    if (*(void *)(v7 + 8 * result) != a1)
    {
      uint64_t v8 = ~v5;
      for (unint64_t result = (result + 1) & v8;
            ((*(void *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            unint64_t result = (result + 1) & v8)
      {
        if (*(void *)(v7 + 8 * result) == a1) {
          break;
        }
      }
    }
  }
  return result;
}

unint64_t sub_1000450F4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100028560(&qword_10009D830);
    id v3 = (void *)static _DictionaryStorage.allocate(capacity:)();
    for (i = (unsigned char *)(a1 + 40); ; i += 16)
    {
      uint64_t v5 = *((void *)i - 1);
      char v6 = *i;
      unint64_t result = sub_100045014(v5);
      if (v8) {
        break;
      }
      *(void *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
      *(void *)(v3[6] + 8 * result) = v5;
      *(unsigned char *)(v3[7] + result) = v6;
      uint64_t v9 = v3[2];
      BOOL v10 = __OFADD__(v9, 1);
      uint64_t v11 = v9 + 1;
      if (v10) {
        goto LABEL_10;
      }
      v3[2] = v11;
      if (!--v1) {
        return (unint64_t)v3;
      }
    }
    __break(1u);
LABEL_10:
    __break(1u);
  }
  else
  {
    return (unint64_t)&_swiftEmptyDictionarySingleton;
  }
  return result;
}

uint64_t type metadata accessor for PINSheetViewController()
{
  return self;
}

void sub_1000451F0(uint64_t a1, uint64_t a2, char *a3, void (**a4)(void, void))
{
  id v8 = [a3 options];
  if (!v8)
  {
    _Block_release(a4);
    __break(1u);
LABEL_25:
    _Block_release(a4);
    __break(1u);
    return;
  }
  uint64_t v9 = v8;
  uint64_t v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v10 + 16) && (unint64_t v11 = sub_10002A9F0((uint64_t)&v26), (v12 & 1) != 0))
  {
    sub_10002B158(*(void *)(v10 + 56) + 32 * v11, (uint64_t)&v28);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v26);
  if (*((void *)&v29 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && String.count.getter() < 1046) {
      goto LABEL_19;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v28);
  }
  id v13 = [a3 options];
  if (!v13) {
    goto LABEL_25;
  }
  uint64_t v14 = v13;
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  AnyHashable.init<A>(_:)();
  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_10002A9F0((uint64_t)&v26), (v17 & 1) != 0))
  {
    sub_10002B158(*(void *)(v15 + 56) + 32 * v16, (uint64_t)&v28);
  }
  else
  {
    long long v28 = 0u;
    long long v29 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v26);
  if (*((void *)&v29 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && String.count.getter() > 1047)
    {
LABEL_19:
      a4[2](a4, 0);
      return;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v28);
  }
  sub_100028560(&qword_10009CD00);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10006BB40;
  uint64_t v26 = 0x746C75736552;
  unint64_t v27 = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  sub_100028560(&qword_10009D7F8);
  uint64_t v19 = swift_initStackObject();
  *(_OWORD *)(v19 + 16) = xmmword_10006BB30;
  *(void *)(v19 + 32) = 5;
  *(unsigned char *)(v19 + 40) = 1;
  unint64_t v20 = sub_1000450F4(v19);
  swift_setDeallocating();
  *(void *)(inited + 96) = sub_100028560(&qword_10009D800);
  *(void *)(inited + 72) = v20;
  uint64_t v26 = 5130576;
  unint64_t v27 = 0xE300000000000000;
  AnyHashable.init<A>(_:)();
  *(void *)(inited + 168) = &type metadata for String;
  *(void *)(inited + 144) = a1;
  *(void *)(inited + 152) = a2;
  swift_bridgeObjectRetain();
  sub_1000295F8(inited);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a3 uiSuccessWithResult:isa];

  a4[2](a4, 1);
  uint64_t v22 = *(void **)&a3[OBJC_IVAR____TtC10CoreAuthUI22PINSheetViewController_authorizationViewManager];
  if (v22)
  {
    id v23 = v22;
    unint64_t v24 = sub_10003F308();
    sub_10003F324(0, (uint64_t (*)(uint64_t))v24, v25);

    swift_release();
  }
}

uint64_t sub_1000455DC()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100045618()
{
  swift_release();
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100045660()
{
}

void sub_10004566C(uint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + 24);
  uint64_t v4 = *(void *)(v1 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v6 = (void *)Strong;
    if (v3)
    {
      uint64_t v12 = v3;
      uint64_t v13 = v4;
      aBlock.receiver = _NSConcreteStackBlock;
      aBlock.super_class = (Class)1107296256;
      uint64_t v10 = sub_100029A40;
      uint64_t v11 = a1;
      uint64_t v7 = _Block_copy(&aBlock);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v7 = 0;
    }
    id v8 = (objc_class *)type metadata accessor for PINSheetViewController();
    aBlock.receiver = v6;
    aBlock.super_class = v8;
    [super dismissChildWithCompletionHandler:v7];
    _Block_release(v7);
  }
}

void sub_100045760(uint64_t a1)
{
  if (a1)
  {
    uint64_t v1 = self;
    swift_errorRetain();
    uint64_t v2 = (void *)_convertErrorToNSError(_:)();
    LODWORD(v1) = [v1 error:v2 hasCode:-2];

    if (v1)
    {
      swift_beginAccess();
      uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
      if (Strong)
      {
        uint64_t v4 = Strong;
        [Strong uiCancel];
        swift_errorRelease();

        return;
      }
    }
    else
    {
      swift_beginAccess();
      uint64_t v5 = swift_unknownObjectWeakLoadStrong();
      if (v5)
      {
        char v6 = (void *)v5;
        uint64_t v7 = (void *)_convertErrorToNSError(_:)();
        [v6 uiFailureWithError:v7];
        swift_errorRelease();

        return;
      }
    }
    swift_errorRelease();
  }
}

char *sub_100045884()
{
  uint64_t v1 = v0;
  uint64_t v72 = type metadata accessor for CharacterSet();
  uint64_t v2 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v71 = (char *)&v69 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t result = (char *)[v0 options];
  if (!result)
  {
    __break(1u);
    goto LABEL_78;
  }
  uint64_t v5 = result;
  uint64_t v6 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v75) = 1010;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v6 + 16) && (unint64_t v7 = sub_10002A9F0((uint64_t)&v76), (v8 & 1) != 0))
  {
    sub_10002B158(*(void *)(v6 + 56) + 32 * v7, (uint64_t)&v78);
  }
  else
  {
    long long v78 = 0u;
    long long v79 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v76);
  if (*((void *)&v79 + 1))
  {
    if (swift_dynamicCast())
    {
      char v9 = (char)v75;
      goto LABEL_11;
    }
  }
  else
  {
    sub_10002F024((uint64_t)&v78, &qword_10009D580);
  }
  char v9 = 1;
LABEL_11:
  unsigned __int8 v80 = v9;
  unint64_t result = (char *)[v1 options];
  if (!result)
  {
LABEL_78:
    __break(1u);
LABEL_79:
    __break(1u);
    goto LABEL_80;
  }
  uint64_t v10 = result;
  uint64_t v11 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v75) = 1011;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_10002A9F0((uint64_t)&v76), (v13 & 1) != 0))
  {
    sub_10002B158(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v78);
  }
  else
  {
    long long v78 = 0u;
    long long v79 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&v76);
  if (!*((void *)&v79 + 1))
  {
    sub_10002F024((uint64_t)&v78, &qword_10009D580);
    unint64_t v16 = 0;
    if ((v80 & 1) == 0) {
      goto LABEL_25;
    }
LABEL_24:
    char v18 = 1;
    goto LABEL_27;
  }
  sub_10002B40C(0, (unint64_t *)&qword_10009CC10);
  int v14 = swift_dynamicCast();
  uint64_t v15 = v75;
  if (v14) {
    unint64_t v16 = v75;
  }
  else {
    unint64_t v16 = 0;
  }
  if (v80) {
    goto LABEL_24;
  }
  if (!v16)
  {
LABEL_25:
    unsigned __int8 v17 = 0;
    goto LABEL_26;
  }
  unsigned __int8 v17 = [v16 BOOLValue];
  unint64_t v16 = v15;
LABEL_26:
  char v18 = v17 ^ 1;
LABEL_27:
  unsigned __int8 v80 = v18;
  os_log_type_t v19 = static os_log_type_t.default.getter();
  id v20 = v16;
  id v21 = v1;
  id v22 = v20;
  id v23 = v21;
  unint64_t v24 = Logger.logObject.getter();
  if (os_log_type_enabled(v24, v19))
  {
    id v70 = v22;
    uint64_t v73 = v2;
    uint64_t v25 = swift_slowAlloc();
    uint64_t v26 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v25 = 138543874;
    uint64_t v76 = (uint64_t)v23;
    id v27 = v23;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v26 = v23;

    *(_WORD *)(v25 + 12) = 1026;
    swift_beginAccess();
    LODWORD(v76) = v80;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v25 + 18) = 1026;
    if (v16)
    {
      id v22 = v70;
      unsigned int v28 = [v70 BOOLValue];
    }
    else
    {
      unsigned int v28 = 0;
      id v22 = v70;
    }
    LODWORD(v76) = v28;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    _os_log_impl((void *)&_mh_execute_header, v24, v19, "%{public}@ buttons - cancel: %{BOOL,public}d fallback: %{BOOL,public}d", (uint8_t *)v25, 0x18u);
    sub_100028560(&qword_10009D280);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    uint64_t v2 = v73;

    if (!v16) {
      goto LABEL_39;
    }
  }
  else
  {

    if (!v16) {
      goto LABEL_39;
    }
  }
  if (![v22 BOOLValue])
  {
LABEL_39:
    uint64_t v33 = (char *)&_swiftEmptyArrayStorage;
    goto LABEL_57;
  }
  unint64_t result = (char *)[v23 options];
  if (result)
  {
    long long v29 = result;
    uint64_t v30 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

    LODWORD(v75) = 1;
    AnyHashable.init<A>(_:)();
    if (*(void *)(v30 + 16) && (unint64_t v31 = sub_10002A9F0((uint64_t)&v76), (v32 & 1) != 0))
    {
      sub_10002B158(*(void *)(v30 + 56) + 32 * v31, (uint64_t)&v78);
    }
    else
    {
      long long v78 = 0u;
      long long v79 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10002AC8C((uint64_t)&v76);
    if (*((void *)&v79 + 1))
    {
      if (swift_dynamicCast())
      {
        NSString v34 = String._bridgeToObjectiveC()();
        swift_bridgeObjectRelease();
LABEL_46:
        id v35 = [self truncateString:v34 maxLength:32];

        if (v35)
        {
          uint64_t v36 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v38 = v37;

          uint64_t v76 = v36;
          uint64_t v77 = v38;
          uint64_t v39 = v71;
          static CharacterSet.whitespacesAndNewlines.getter();
          sub_1000483D4();
          uint64_t v40 = StringProtocol.trimmingCharacters(in:)();
          uint64_t v42 = v41;
          (*(void (**)(char *, uint64_t))(v2 + 8))(v39, v72);
          swift_bridgeObjectRelease();
        }
        else
        {
          uint64_t v40 = sub_100027CFC();
          uint64_t v42 = v43;
        }
        uint64_t v73 = v2;
        if (v40 == 0x6150207265746E45 && v42 == 0xEE0065646F637373
          || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
        {
          id v44 = v22;
          swift_bridgeObjectRelease();
          uint64_t v40 = sub_1000276D4();
          uint64_t v42 = v45;
        }
        else
        {
          id v44 = v22;
        }
        uint64_t v46 = swift_allocObject();
        swift_unknownObjectWeakInit();
        uint64_t v33 = sub_10004826C(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
        unint64_t v48 = *((void *)v33 + 2);
        unint64_t v47 = *((void *)v33 + 3);
        if (v48 >= v47 >> 1) {
          uint64_t v33 = sub_10004826C((char *)(v47 > 1), v48 + 1, 1, v33);
        }
        *((void *)v33 + 2) = v48 + 1;
        id v49 = &v33[40 * v48];
        *((void *)v49 + 4) = v40;
        *((void *)v49 + 5) = v42;
        *((void *)v49 + 6) = 0;
        *((void *)v49 + 7) = sub_100048428;
        *((void *)v49 + 8) = v46;
        id v22 = v44;
        uint64_t v2 = v73;
LABEL_57:
        swift_beginAccess();
        if (v80 != 1)
        {
LABEL_76:

          return v33;
        }
        unint64_t result = (char *)[v23 options];
        if (result)
        {
          uint64_t v50 = result;
          uint64_t v51 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

          LODWORD(v74) = 1018;
          AnyHashable.init<A>(_:)();
          if (*(void *)(v51 + 16) && (unint64_t v52 = sub_10002A9F0((uint64_t)&v76), (v53 & 1) != 0))
          {
            sub_10002B158(*(void *)(v51 + 56) + 32 * v52, (uint64_t)&v78);
          }
          else
          {
            long long v78 = 0u;
            long long v79 = 0u;
          }
          swift_bridgeObjectRelease();
          sub_10002AC8C((uint64_t)&v76);
          if (*((void *)&v79 + 1))
          {
            if (swift_dynamicCast())
            {
              NSString v54 = String._bridgeToObjectiveC()();
              swift_bridgeObjectRelease();
LABEL_68:
              id v55 = [self truncateString:v54 maxLength:32];

              if (v55)
              {
                uint64_t v56 = static String._unconditionallyBridgeFromObjectiveC(_:)();
                uint64_t v58 = v57;

                uint64_t v76 = v56;
                uint64_t v77 = v58;
                uint64_t v59 = v71;
                static CharacterSet.whitespacesAndNewlines.getter();
                sub_1000483D4();
                uint64_t v60 = StringProtocol.trimmingCharacters(in:)();
                uint64_t v62 = v61;
                (*(void (**)(char *, uint64_t))(v2 + 8))(v59, v72);
                swift_bridgeObjectRelease();
              }
              else
              {
                uint64_t v60 = sub_100027310();
                uint64_t v62 = v63;
              }
              uint64_t v64 = swift_allocObject();
              swift_unknownObjectWeakInit();
              id v65 = v22;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                uint64_t v33 = sub_10004826C(0, *((void *)v33 + 2) + 1, 1, v33);
              }
              unint64_t v67 = *((void *)v33 + 2);
              unint64_t v66 = *((void *)v33 + 3);
              if (v67 >= v66 >> 1) {
                uint64_t v33 = sub_10004826C((char *)(v66 > 1), v67 + 1, 1, v33);
              }
              *((void *)v33 + 2) = v67 + 1;
              v68 = &v33[40 * v67];
              *((void *)v68 + 4) = v60;
              *((void *)v68 + 5) = v62;
              *((void *)v68 + 6) = 1;
              *((void *)v68 + 7) = sub_1000483C8;
              *((void *)v68 + 8) = v64;
              id v22 = v65;
              goto LABEL_76;
            }
          }
          else
          {
            sub_10002F024((uint64_t)&v78, &qword_10009D580);
          }
          NSString v54 = 0;
          goto LABEL_68;
        }
        goto LABEL_79;
      }
    }
    else
    {
      sub_10002F024((uint64_t)&v78, &qword_10009D580);
    }
    NSString v34 = 0;
    goto LABEL_46;
  }
LABEL_80:
  __break(1u);
  return result;
}

uint64_t sub_1000462F4()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_10004633C(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_100046388())()
{
  return j__swift_endAccess;
}

void sub_1000463E4(char a1)
{
  uint64_t v2 = v1;
  v39.receiver = v1;
  v39.super_class = (Class)swift_getObjectType();
  [super viewDidAppear:a1 & 1];
  uint64_t v4 = &v1[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType];
  swift_beginAccess();
  uint64_t v5 = *(void *)v4;
  uint64_t v6 = (objc_class *)type metadata accessor for BiometryAlertViewController();
  unint64_t v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR____TtC10CoreAuthUIP33_AABE3714D9C58676A24E916892CB721E27BiometryAlertViewController_biometryType] = v5;
  v38.receiver = v7;
  v38.super_class = v6;
  id v8 = [super initWithNibName:0 bundle:0];
  char v9 = v8;
  if (*(void *)v4 == 1)
  {
    id v11 = v8;
    sub_100027C38();
  }
  else if (*(void *)v4 == 2)
  {
    id v10 = v8;
    sub_100027B78();
  }
  else
  {
    id v12 = v8;
  }
  NSString v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  [v9 setTitle:v13];

  id v14 = v9;
  id v15 = [v2 callerName];
  [v14 setMessage:v15];
  id v31 = v14;

  unint64_t v16 = sub_100045884();
  uint64_t v17 = *((void *)v16 + 2);
  if (v17)
  {
    uint64_t v30 = v2;
    swift_bridgeObjectRetain();
    char v18 = (uint64_t *)(v16 + 64);
    do
    {
      uint64_t v22 = *(v18 - 2);
      uint64_t v21 = *(v18 - 1);
      uint64_t v23 = *v18;
      swift_bridgeObjectRetain();
      sub_100029A94(v21);
      NSString v24 = String._bridgeToObjectiveC()();
      if (v21)
      {
        uint64_t v36 = (uint64_t (*)())v21;
        uint64_t v37 = v23;
        objc_super aBlock = _NSConcreteStackBlock;
        uint64_t v33 = 1107296256;
        NSString v34 = sub_100029A40;
        id v35 = &unk_100087CA8;
        os_log_type_t v19 = _Block_copy(&aBlock);
        swift_retain();
        swift_release();
      }
      else
      {
        os_log_type_t v19 = 0;
      }
      v18 += 5;
      uint64_t v36 = sub_100029838;
      uint64_t v37 = 0;
      objc_super aBlock = _NSConcreteStackBlock;
      uint64_t v33 = 1107296256;
      NSString v34 = sub_100046844;
      id v35 = &unk_100087C80;
      id v20 = _Block_copy(&aBlock);
      [v31 _addActionWithTitle:v24 style:v22 handler:v19 shouldDismissHandler:v20];
      _Block_release(v20);
      _Block_release(v19);
      swift_bridgeObjectRelease();

      sub_10002A998(v21);
      --v17;
    }
    while (v17);
    swift_bridgeObjectRelease();
    uint64_t v2 = v30;
  }
  swift_bridgeObjectRelease();
  id v25 = v31;
  id v26 = [v25 actions];
  sub_10002B40C(0, &qword_10009D840);
  unint64_t v27 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v27 >> 62)
  {
    swift_bridgeObjectRetain();
    unsigned int v28 = (void *)_CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (!v28) {
      goto LABEL_19;
    }
  }
  else
  {
    unsigned int v28 = *(void **)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v28)
    {
LABEL_19:
      swift_bridgeObjectRelease();
      [v25 setPreferredAction:v28];

      [v25 setPreferredStyle:1];
      [v2 presentViewController:v25 animated:1 completion:0];

      return;
    }
  }
  if ((v27 & 0xC000000000000001) != 0)
  {
    id v29 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    goto LABEL_18;
  }
  if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    id v29 = *(id *)(v27 + 32);
LABEL_18:
    unsigned int v28 = v29;
    goto LABEL_19;
  }
  __break(1u);
}

uint64_t type metadata accessor for BiometryAlertViewController()
{
  return self;
}

uint64_t sub_100046844(uint64_t a1)
{
  uint64_t v1 = *(uint64_t (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  LOBYTE(v1) = v1(v2);
  swift_release();
  return v1 & 1;
}

uint64_t sub_100046884(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100046894()
{
  return swift_release();
}

void sub_1000468F0(uint64_t a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v6 = [v2 presentedViewController];
  if (v6)
  {
    unint64_t v7 = v6;
    id v8 = (void *)swift_allocObject();
    v8[2] = v2;
    v8[3] = a1;
    v8[4] = a2;
    unint64_t v16 = sub_100046AF8;
    uint64_t v17 = v8;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 1107296256;
    id v14 = sub_100029A40;
    id v15 = &unk_100087D20;
    char v9 = _Block_copy(&v12);
    id v10 = v2;
    sub_100029A94(a1);
    swift_release();
    [v7 dismissViewControllerAnimated:0 completion:v9];
    _Block_release(v9);
  }
  else
  {
    if (a1)
    {
      unint64_t v16 = (void (*)())a1;
      uint64_t v17 = a2;
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 1107296256;
      id v14 = sub_100029A40;
      id v15 = &unk_100087CD0;
      id v11 = _Block_copy(&v12);
      swift_retain();
      swift_release();
    }
    else
    {
      id v11 = 0;
    }
    v18.receiver = v2;
    v18.super_class = ObjectType;
    [super dismissChildWithCompletionHandler:v11];
    _Block_release(v11);
  }
}

uint64_t sub_100046AB0()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100046AF8()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = v0[3];
  if (v1)
  {
    uint64_t v3 = v0[4];
    uint64_t v9 = v1;
    uint64_t v10 = v3;
    v6.receiver = _NSConcreteStackBlock;
    v6.super_class = (Class)1107296256;
    unint64_t v7 = sub_100029A40;
    id v8 = &unk_100087D90;
    uint64_t v4 = _Block_copy(&v6);
    swift_retain();
    swift_release();
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = (objc_class *)type metadata accessor for BiometryCompanionViewController();
  v6.receiver = v2;
  v6.super_class = v5;
  [super dismissChildWithCompletionHandler:v4];
  _Block_release(v4);
}

id sub_100046C80(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  objc_super v6 = v5;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v12 = v6;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v12[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v16.receiver = v12;
  v16.super_class = ObjectType;
  id v14 = [super initWithInternalInfo:isa mechanism:a2 backoffCounter:a3 remoteUIHost:a4 allowsLandscape:a5 & 1];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v14;
}

id sub_100046EE0(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v8 = v4;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v8[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  if (a2)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }
  v12.receiver = v8;
  v12.super_class = ObjectType;
  [super initWithNibName:v9 bundle:a3];

  return v10;
}

id sub_100047014(void *a1)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = v1;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v4[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  id v5 = [super initWithCoder:a1];

  return v5;
}

id sub_100047144(uint64_t a1, void *a2)
{
  if (!a1)
  {
    v4.super.Class isa = 0;
    uint64_t v5 = a2[3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  objc_super v6 = sub_10002A3A8(a2, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  NSString v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10002A3EC((uint64_t)a2);
LABEL_6:
  id v11 = [objc_allocWithZone(v2) initWithInternalInfo:v4.super.isa parent:v10];

  swift_unknownObjectRelease();
  return v11;
}

id sub_1000472D0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = v3;
  sub_100048C74();
  sub_100048C8C();
  *(void *)&v7[OBJC_IVAR____TtC10CoreAuthUI31BiometryCompanionViewController_biometryType] = 0;

  if (a1)
  {
    v8.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v8.super.Class isa = 0;
  }
  sub_10002AA34(a2, (uint64_t)v19, &qword_10009D580);
  uint64_t v9 = v20;
  if (v20)
  {
    uint64_t v10 = sub_10002A3A8(v19, v20);
    uint64_t v11 = *(void *)(v9 - 8);
    __chkstk_darwin(v10);
    uint64_t v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v11 + 16))(v13);
    uint64_t v14 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v9);
    sub_10002A3EC((uint64_t)v19);
  }
  else
  {
    uint64_t v14 = 0;
  }
  v18.receiver = v7;
  v18.super_class = ObjectType;
  [v18 initWithInternalInfo:v8.super.isa parent:v14];

  swift_unknownObjectRelease();
  id v16 = v15;
  sub_10002F024(a2, &qword_10009D580);
  if (v16) {

  }
  return v16;
}

uint64_t sub_1000475F0()
{
  return type metadata accessor for BiometryCompanionViewController();
}

uint64_t type metadata accessor for BiometryCompanionViewController()
{
  uint64_t result = qword_10009E998;
  if (!qword_10009E998) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100047644()
{
  uint64_t result = type metadata accessor for Logger();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void sub_10004773C()
{
  unint64_t v1 = v0;
  v7.receiver = v0;
  v7.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  id v2 = objc_allocWithZone((Class)sub_100028560(&qword_10009D8A0));
  uint64_t v3 = (void *)UIHostingController.init(rootView:)();
  id v4 = [v3 view];
  if (v4)
  {
    uint64_t v5 = v4;
    id v6 = [self clearColor];
    [v5 setBackgroundColor:v6];

    [v1 _setHeaderContentViewController:v3];
  }
  else
  {
    __break(1u);
  }
}

void type metadata accessor for LABiometryType(uint64_t a1)
{
}

uint64_t sub_1000478C8()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100047900@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100028560(&qword_10009D8B8);
  __chkstk_darwin(v4 - 8);
  id v6 = (uint64_t *)((char *)v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = sub_100028560(&qword_10009D8C0);
  uint64_t v8 = v7 - 8;
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)v40 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100028560(&qword_10009D8C8);
  uint64_t v12 = v11 - 8;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t *v6 = static Alignment.center.getter();
  v6[1] = v15;
  uint64_t v16 = sub_100028560(&qword_10009D8D0);
  sub_100047B80(a1, (uint64_t)v6 + *(int *)(v16 + 44));
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  sub_10002AA34((uint64_t)v6, (uint64_t)v10, &qword_10009D8B8);
  uint64_t v17 = &v10[*(int *)(v8 + 44)];
  long long v18 = v40[1];
  *(_OWORD *)uint64_t v17 = v40[0];
  *((_OWORD *)v17 + 1) = v18;
  *((_OWORD *)v17 + 2) = v40[2];
  sub_10002F024((uint64_t)v6, &qword_10009D8B8);
  char v19 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  sub_10002AA34((uint64_t)v10, (uint64_t)v14, &qword_10009D8C0);
  unsigned int v28 = &v14[*(int *)(v12 + 44)];
  *unsigned int v28 = v19;
  *((void *)v28 + 1) = v21;
  *((void *)v28 + 2) = v23;
  *((void *)v28 + 3) = v25;
  *((void *)v28 + 4) = v27;
  v28[40] = 0;
  sub_10002F024((uint64_t)v10, &qword_10009D8C0);
  char v29 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  sub_10002AA34((uint64_t)v14, a2, &qword_10009D8C8);
  uint64_t v38 = a2 + *(int *)(sub_100028560(&qword_10009D8D8) + 36);
  *(unsigned char *)uint64_t v38 = v29;
  *(void *)(v38 + 8) = v31;
  *(void *)(v38 + 16) = v33;
  *(void *)(v38 + 24) = v35;
  *(void *)(v38 + 32) = v37;
  *(unsigned char *)(v38 + 40) = 0;
  return sub_10002F024((uint64_t)v14, &qword_10009D8C8);
}

uint64_t sub_100047B80@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v69 = a1;
  uint64_t v71 = a2;
  uint64_t v2 = sub_100028560(&qword_10009D8E0);
  __chkstk_darwin(v2 - 8);
  KeyPath = (char *)&v63 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Image.ResizingMode();
  uint64_t v67 = *(void *)(v4 - 8);
  uint64_t v68 = v4;
  __chkstk_darwin(v4);
  unint64_t v66 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009D8E8);
  __chkstk_darwin(v6 - 8);
  uint64_t v64 = (uint64_t)&v63 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for RoundedRectangle();
  uint64_t v9 = v8 - 8;
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v63 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100028560(&qword_10009D8F0);
  uint64_t v13 = v12 - 8;
  __chkstk_darwin(v12);
  uint64_t v15 = (char *)&v63 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100028560(&qword_10009D8F8) - 8;
  uint64_t v16 = __chkstk_darwin(v65);
  uint64_t v73 = (uint64_t)&v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v72 = (uint64_t)&v63 - v18;
  char v19 = &v11[*(int *)(v9 + 28)];
  uint64_t v20 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v21 = type metadata accessor for RoundedCornerStyle();
  uint64_t v22 = *(void (**)(char *, uint64_t, uint64_t))(*(void *)(v21 - 8) + 104);
  v22(v19, v20, v21);
  __asm { FMOV            V0.2D, #10.0 }
  long long v63 = _Q0;
  *(_OWORD *)uint64_t v11 = _Q0;
  static Color.blue.getter();
  uint64_t v28 = Color.opacity(_:)();
  swift_release();
  sub_10004894C((uint64_t)v11, (uint64_t)v15);
  *(void *)&v15[*(int *)(v13 + 60)] = v28;
  *(_WORD *)&v15[*(int *)(v13 + 64)] = 256;
  sub_1000489B0((uint64_t)v11);
  v22(&v11[*(int *)(v9 + 28)], v20, v21);
  *(_OWORD *)uint64_t v11 = v63;
  uint64_t v29 = static Color.blue.getter();
  StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
  uint64_t v30 = v64;
  sub_10004894C((uint64_t)v11, v64);
  uint64_t v31 = v30 + *(int *)(sub_100028560(&qword_10009D900) + 36);
  long long v32 = v75;
  *(_OWORD *)uint64_t v31 = v74;
  *(_OWORD *)(v31 + 16) = v32;
  *(void *)(v31 + 32) = v76;
  uint64_t v33 = sub_100028560(&qword_10009D908);
  *(void *)(v30 + *(int *)(v33 + 52)) = v29;
  *(_WORD *)(v30 + *(int *)(v33 + 56)) = 256;
  uint64_t v34 = static Alignment.center.getter();
  uint64_t v36 = v35;
  uint64_t v37 = (uint64_t *)(v30 + *(int *)(sub_100028560(&qword_10009D910) + 36));
  uint64_t *v37 = v34;
  v37[1] = v36;
  sub_1000489B0((uint64_t)v11);
  uint64_t v38 = static Alignment.center.getter();
  uint64_t v40 = v39;
  uint64_t v41 = v73;
  uint64_t v42 = v73 + *(int *)(v65 + 44);
  sub_10002AA34(v30, v42, &qword_10009D8E8);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(sub_100028560(&qword_10009D918) + 36));
  *uint64_t v43 = v38;
  v43[1] = v40;
  sub_10002AA34((uint64_t)v15, v41, &qword_10009D8F0);
  sub_10002F024(v30, &qword_10009D8E8);
  sub_10002F024((uint64_t)v15, &qword_10009D8F0);
  uint64_t v44 = v72;
  sub_100048A0C(v41, v72);
  Image.init(systemName:)();
  uint64_t v46 = v66;
  uint64_t v45 = v67;
  uint64_t v47 = v68;
  (*(void (**)(char *, void, uint64_t))(v67 + 104))(v66, enum case for Image.ResizingMode.stretch(_:), v68);
  uint64_t v69 = Image.resizable(capInsets:resizingMode:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v45 + 8))(v46, v47);
  static Font.Weight.light.getter();
  uint64_t v48 = type metadata accessor for Font.Design();
  uint64_t v49 = (uint64_t)KeyPath;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v48 - 8) + 56))(KeyPath, 1, 1, v48);
  uint64_t v68 = static Font.system(size:weight:design:)();
  sub_10002F024(v49, &qword_10009D8E0);
  KeyPath = (char *)swift_getKeyPath();
  uint64_t v50 = static Color.blue.getter();
  uint64_t v51 = swift_getKeyPath();
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v52 = v77;
  LOBYTE(v46) = v78;
  uint64_t v53 = v79;
  LOBYTE(v22) = v80;
  uint64_t v54 = v81;
  uint64_t v55 = v82;
  uint64_t v56 = v44;
  uint64_t v57 = v73;
  sub_10002AA34(v56, v73, &qword_10009D8F8);
  uint64_t v58 = v57;
  uint64_t v59 = v71;
  sub_10002AA34(v58, v71, &qword_10009D8F8);
  uint64_t v60 = v59 + *(int *)(sub_100028560(&qword_10009D920) + 48);
  uint64_t v61 = KeyPath;
  *(void *)uint64_t v60 = v69;
  *(void *)(v60 + 8) = v61;
  *(void *)(v60 + 16) = v68;
  *(void *)(v60 + 24) = v51;
  *(void *)(v60 + 32) = v50;
  *(void *)(v60 + 40) = v52;
  *(unsigned char *)(v60 + 48) = (_BYTE)v46;
  *(void *)(v60 + 56) = v53;
  *(unsigned char *)(v60 + 64) = (_BYTE)v22;
  *(void *)(v60 + 72) = v54;
  *(void *)(v60 + 80) = v55;
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_10002F024(v72, &qword_10009D8F8);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  return sub_10002F024(v73, &qword_10009D8F8);
}

uint64_t sub_100048264@<X0>(uint64_t a1@<X8>)
{
  return sub_100047900(*v1, a1);
}

char *sub_10004826C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    uint64_t v7 = a2;
    goto LABEL_8;
  }
  unint64_t v6 = *((void *)a4 + 3);
  uint64_t v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2) {
    goto LABEL_8;
  }
  if (v7 + 0x4000000000000000 >= 0)
  {
    uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
      uint64_t v7 = a2;
    }
LABEL_8:
    uint64_t v8 = *((void *)a4 + 2);
    if (v7 <= v8) {
      uint64_t v9 = *((void *)a4 + 2);
    }
    else {
      uint64_t v9 = v7;
    }
    if (v9)
    {
      sub_100028560(&qword_10009D8B0);
      uint64_t v10 = (char *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v8;
      *((void *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 40);
      uint64_t v12 = v10 + 32;
      if (v5)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[40 * v8 + 32]) {
          memmove(v12, a4 + 32, 40 * v8);
        }
        *((void *)a4 + 2) = 0;
        goto LABEL_22;
      }
    }
    else
    {
      uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
      uint64_t v12 = (char *)&_swiftEmptyArrayStorage + 32;
      if (result) {
        goto LABEL_13;
      }
    }
    sub_100048540(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_100048390()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000483C8()
{
}

unint64_t sub_1000483D4()
{
  unint64_t result = qword_10009D8A8;
  if (!qword_10009D8A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D8A8);
  }
  return result;
}

void sub_100048428()
{
}

void sub_100048434(SEL *a1)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = Strong;
    [Strong *a1];
  }
}

uint64_t sub_100048490@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000484BC()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000484E8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100048514()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_100048540(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    unint64_t v5 = a4 + 40 * a1 + 32;
    unint64_t v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for BiometryCompanionViewController.AlertAction(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BiometryCompanionViewController.AlertAction(uint64_t a1)
{
  uint64_t result = swift_bridgeObjectRelease();
  if (*(void *)(a1 + 24))
  {
    return swift_release();
  }
  return result;
}

void *initializeWithCopy for BiometryCompanionViewController.AlertAction(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  unint64_t v6 = a2 + 3;
  uint64_t v5 = a2[3];
  swift_bridgeObjectRetain();
  if (v5)
  {
    uint64_t v7 = a2[4];
    a1[3] = v5;
    a1[4] = v7;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 3) = *v6;
  }
  return a1;
}

void *assignWithCopy for BiometryCompanionViewController.AlertAction(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = a1[3];
  a1[2] = a2[2];
  uint64_t v5 = a2[3];
  if (!v4)
  {
    if (v5)
    {
      uint64_t v7 = a2[4];
      a1[3] = v5;
      a1[4] = v7;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = a2[4];
  a1[3] = v5;
  a1[4] = v6;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for BiometryCompanionViewController.AlertAction(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

void *assignWithTake for BiometryCompanionViewController.AlertAction(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  uint64_t v6 = a1[3];
  a1[2] = a2[2];
  if (!v6)
  {
    if (v5)
    {
      uint64_t v8 = a2[4];
      a1[3] = v5;
      a1[4] = v8;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 3) = *(_OWORD *)(a2 + 3);
    return a1;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v7 = a2[4];
  a1[3] = v5;
  a1[4] = v7;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for BiometryCompanionViewController.AlertAction(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 40)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for BiometryCompanionViewController.AlertAction(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 40) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BiometryCompanionViewController.AlertAction()
{
  return &type metadata for BiometryCompanionViewController.AlertAction;
}

ValueMetadata *type metadata accessor for GlyphView()
{
  return &type metadata for GlyphView;
}

uint64_t sub_100048930()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004894C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000489B0(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100048A0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D8F8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void type metadata accessor for Style(uint64_t a1)
{
}

void sub_100048A88(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100048AD0()
{
  return sub_100048B44(&qword_10009D930, &qword_10009D8D8, (void (*)(void))sub_100048B14);
}

uint64_t sub_100048B14()
{
  return sub_100048B44(&qword_10009D938, &qword_10009D8C8, (void (*)(void))sub_100048BC0);
}

uint64_t sub_100048B44(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F434(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100048BC0()
{
  return sub_100048B44(&qword_10009D940, &qword_10009D8C0, (void (*)(void))sub_100048BF0);
}

unint64_t sub_100048BF0()
{
  unint64_t result = qword_10009D948;
  if (!qword_10009D948)
  {
    sub_10002F434(&qword_10009D8B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D948);
  }
  return result;
}

uint64_t sub_100048C6C()
{
  return 3;
}

void *sub_100048C74()
{
  return &unk_10006C730;
}

void *sub_100048C80()
{
  return &unk_10006C738;
}

uint64_t sub_100048C90@<X0>(char a1@<W0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100028560(&qword_10009D980);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v25 - v8;
  if (qword_10009EA40 != -1) {
    swift_once();
  }
  uint64_t v10 = sub_100049008(a1);
  uint64_t v12 = v11;
  swift_beginAccess();
  uint64_t v13 = qword_10009EA48;
  if (*(void *)(qword_10009EA48 + 16) && (unint64_t v14 = sub_10002AAA8(v10, v12), (v15 & 1) != 0))
  {
    unint64_t v16 = v14;
    uint64_t v17 = *(void *)(v13 + 56);
    uint64_t v18 = type metadata accessor for Logger();
    uint64_t v19 = *(void *)(v18 - 8);
    (*(void (**)(char *, unint64_t, uint64_t))(v19 + 16))(v9, v17 + *(void *)(v19 + 72) * v16, v18);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v19 + 56))(v9, 0, 1, v18);
  }
  else
  {
    uint64_t v18 = type metadata accessor for Logger();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  }
  swift_bridgeObjectRelease();
  swift_endAccess();
  type metadata accessor for Logger();
  uint64_t v20 = *(void *)(v18 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48))(v9, 1, v18) == 1)
  {
    sub_100049008(a1);
    Logger.init(subsystem:category:)();
    sub_10004A754((uint64_t)v9);
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v20 + 32))(a2, v9, v18);
  }
  uint64_t v21 = sub_100049008(a1);
  uint64_t v23 = v22;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v7, a2, v18);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v20 + 56))(v7, 0, 1, v18);
  swift_beginAccess();
  sub_10004969C((uint64_t)v7, v21, v23);
  return swift_endAccess();
}

void *sub_100048FF4()
{
  return &unk_10006C740;
}

uint64_t sub_100049000()
{
  return 4;
}

uint64_t sub_100049008(char a1)
{
  if ((a1 & 1) == 0)
  {
    uint64_t v2 = (char *)&_swiftEmptyArrayStorage;
    if ((a1 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_7;
  }
  uint64_t v2 = sub_10004A4FC(0, 1, 1, (char *)&_swiftEmptyArrayStorage);
  unint64_t v4 = *((void *)v2 + 2);
  unint64_t v3 = *((void *)v2 + 3);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_10004A4FC((char *)(v3 > 1), v4 + 1, 1, v2);
  }
  *((void *)v2 + 2) = v4 + 1;
  uint64_t v5 = &v2[16 * v4];
  *((void *)v5 + 4) = 0x6369767265534955;
  *((void *)v5 + 5) = 0xE900000000000065;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_10004A4FC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v7 = *((void *)v2 + 2);
    unint64_t v6 = *((void *)v2 + 3);
    if (v7 >= v6 >> 1) {
      uint64_t v2 = sub_10004A4FC((char *)(v6 > 1), v7 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v7 + 1;
    uint64_t v8 = &v2[16 * v7];
    *((void *)v8 + 4) = 0x7463617265746E49;
    *((void *)v8 + 5) = 0xEB00000000657669;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
      uint64_t v2 = sub_10004A4FC(0, *((void *)v2 + 2) + 1, 1, v2);
    }
    unint64_t v10 = *((void *)v2 + 2);
    unint64_t v9 = *((void *)v2 + 3);
    if (v10 >= v9 >> 1) {
      uint64_t v2 = sub_10004A4FC((char *)(v9 > 1), v10 + 1, 1, v2);
    }
    *((void *)v2 + 2) = v10 + 1;
    uint64_t v11 = &v2[16 * v10];
    strcpy(v11 + 32, "Authorization");
    *((_WORD *)v11 + 23) = -4864;
  }
  sub_100028560(&qword_10009D950);
  sub_1000493E0();
  uint64_t v12 = BidirectionalCollection<>.joined(separator:)();
  swift_bridgeObjectRelease();
  return v12;
}

void *sub_100049218@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_100049224(void *a1@<X8>)
{
  *a1 = 0;
}

void *sub_10004922C@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 | *result;
  return result;
}

void *sub_100049240@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & *result;
  return result;
}

void *sub_100049254@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_100049268(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = *v2 & *a2;
  if (v4 != *a2) {
    *v2 |= v3;
  }
  *a1 = v3;
  return v4 != v3;
}

void *sub_100049298@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *v2 & *result;
  if (v3) {
    *v2 &= ~*result;
  }
  *(void *)a2 = v3;
  *(unsigned char *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1000492C4@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *result;
  uint64_t v4 = *v2;
  *v2 |= *result;
  uint64_t v5 = v4 & v3;
  *(void *)a2 = v5;
  *(unsigned char *)(a2 + 8) = v5 == 0;
  return result;
}

void *sub_1000492E8(void *result)
{
  *v1 |= *result;
  return result;
}

void *sub_1000492FC(void *result)
{
  *v1 &= *result;
  return result;
}

void *sub_100049310(void *result)
{
  *v1 ^= *result;
  return result;
}

void *sub_100049324@<X0>(void *result@<X0>, void *a2@<X8>)
{
  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_100049338(void *a1)
{
  return (*v1 & ~*a1) == 0;
}

BOOL sub_10004934C(void *a1)
{
  return (*v1 & *a1) == 0;
}

BOOL sub_100049360(void *a1)
{
  return (*a1 & ~*v1) == 0;
}

BOOL sub_100049374()
{
  return *v0 == 0;
}

uint64_t sub_100049384(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return SetAlgebra.init<A>(_:)(a1, a4, a2, a5, a3);
}

void *sub_10004939C(void *result)
{
  *v1 &= ~*result;
  return result;
}

void *sub_1000493B0@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_1000493C0(void *a1@<X8>)
{
  *a1 = *v1;
}

BOOL sub_1000493CC(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t sub_1000493E0()
{
  unint64_t result = qword_10009D958;
  if (!qword_10009D958)
  {
    sub_10002F434(&qword_10009D950);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D958);
  }
  return result;
}

uint64_t sub_10004943C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3 = sub_10004A71C(a1);
  uint64_t result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

unint64_t sub_10004947C()
{
  unint64_t result = sub_1000494A4((uint64_t)&_swiftEmptyArrayStorage);
  qword_10009EA48 = result;
  return result;
}

unint64_t sub_1000494A4(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009D990);
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (void *)((char *)v25 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (!*(void *)(a1 + 16))
  {
    unint64_t v7 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100028560(&qword_10009D988);
  uint64_t v6 = static _DictionaryStorage.allocate(capacity:)();
  unint64_t v7 = (void *)v6;
  uint64_t v8 = *(void *)(a1 + 16);
  if (!v8)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v7;
  }
  unint64_t v9 = (char *)v5 + *(int *)(v2 + 48);
  uint64_t v10 = v6 + 64;
  unint64_t v11 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v25[1] = a1;
  uint64_t v12 = a1 + v11;
  uint64_t v13 = *(void *)(v3 + 72);
  swift_retain();
  while (1)
  {
    sub_10004A7B4(v12, (uint64_t)v5);
    uint64_t v14 = *v5;
    uint64_t v15 = v5[1];
    unint64_t result = sub_10002AAA8(*v5, v15);
    if (v17) {
      break;
    }
    unint64_t v18 = result;
    *(void *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v19 = (uint64_t *)(v7[6] + 16 * result);
    uint64_t *v19 = v14;
    v19[1] = v15;
    uint64_t v20 = v7[7];
    uint64_t v21 = type metadata accessor for Logger();
    unint64_t result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(*(void *)(v21 - 8) + 32))(v20 + *(void *)(*(void *)(v21 - 8) + 72) * v18, v9, v21);
    uint64_t v22 = v7[2];
    BOOL v23 = __OFADD__(v22, 1);
    uint64_t v24 = v22 + 1;
    if (v23) {
      goto LABEL_11;
    }
    void v7[2] = v24;
    v12 += v13;
    if (!--v8)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10004969C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = sub_100028560(&qword_10009D980);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v17 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v12 + 48))(a1, 1, v11) == 1)
  {
    sub_10004A754(a1);
    sub_100049868(a2, a3, (uint64_t)v10);
    swift_bridgeObjectRelease();
    return sub_10004A754((uint64_t)v10);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v12 + 32))(v14, a1, v11);
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v18 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    sub_10004A008((uint64_t)v14, a2, a3, isUniquelyReferenced_nonNull_native);
    uint64_t *v4 = v18;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100049868@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v4 = v3;
  swift_bridgeObjectRetain();
  unint64_t v8 = sub_10002AAA8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if (a2)
  {
    int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v11 = *v4;
    uint64_t v21 = *v4;
    uint64_t *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_10004A238();
      uint64_t v11 = v21;
    }
    swift_bridgeObjectRelease();
    uint64_t v12 = *(void *)(v11 + 56);
    uint64_t v13 = type metadata accessor for Logger();
    uint64_t v20 = *(void *)(v13 - 8);
    (*(void (**)(uint64_t, unint64_t, uint64_t))(v20 + 32))(a3, v12 + *(void *)(v20 + 72) * v8, v13);
    sub_100049DF8(v8, v11);
    uint64_t *v4 = v11;
    swift_bridgeObjectRelease();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56);
    uint64_t v15 = a3;
    uint64_t v16 = 0;
    uint64_t v17 = v13;
  }
  else
  {
    uint64_t v18 = type metadata accessor for Logger();
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56);
    uint64_t v17 = v18;
    uint64_t v15 = a3;
    uint64_t v16 = 1;
  }

  return v14(v15, v16, 1, v17);
}

uint64_t sub_100049A10(uint64_t a1, int a2)
{
  uint64_t v3 = v2;
  uint64_t v49 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v49 - 8);
  __chkstk_darwin(v49);
  uint64_t v48 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *v2;
  sub_100028560(&qword_10009D988);
  int v47 = a2;
  uint64_t v8 = static _DictionaryStorage.resize(original:capacity:move:)();
  uint64_t v9 = v8;
  if (!*(void *)(v7 + 16)) {
    goto LABEL_41;
  }
  uint64_t v10 = 1 << *(unsigned char *)(v7 + 32);
  uint64_t v11 = *(void *)(v7 + 64);
  uint64_t v44 = (void *)(v7 + 64);
  if (v10 < 64) {
    uint64_t v12 = ~(-1 << v10);
  }
  else {
    uint64_t v12 = -1;
  }
  unint64_t v13 = v12 & v11;
  uint64_t v42 = v2;
  int64_t v43 = (unint64_t)(v10 + 63) >> 6;
  uint64_t v45 = (void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  uint64_t v46 = v5;
  uint64_t v14 = (void (**)(char *, uint64_t, uint64_t))(v5 + 32);
  uint64_t v15 = v8 + 64;
  uint64_t result = swift_retain();
  int64_t v17 = 0;
  while (1)
  {
    if (v13)
    {
      unint64_t v20 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v21 = v20 | (v17 << 6);
      goto LABEL_22;
    }
    int64_t v22 = v17 + 1;
    if (__OFADD__(v17, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v22 >= v43) {
      break;
    }
    BOOL v23 = v44;
    unint64_t v24 = v44[v22];
    ++v17;
    if (!v24)
    {
      int64_t v17 = v22 + 1;
      if (v22 + 1 >= v43) {
        goto LABEL_34;
      }
      unint64_t v24 = v44[v17];
      if (!v24)
      {
        int64_t v25 = v22 + 2;
        if (v25 >= v43)
        {
LABEL_34:
          swift_release();
          uint64_t v3 = v42;
          if ((v47 & 1) == 0) {
            goto LABEL_41;
          }
          goto LABEL_37;
        }
        unint64_t v24 = v44[v25];
        if (!v24)
        {
          while (1)
          {
            int64_t v17 = v25 + 1;
            if (__OFADD__(v25, 1)) {
              goto LABEL_43;
            }
            if (v17 >= v43) {
              goto LABEL_34;
            }
            unint64_t v24 = v44[v17];
            ++v25;
            if (v24) {
              goto LABEL_21;
            }
          }
        }
        int64_t v17 = v25;
      }
    }
LABEL_21:
    unint64_t v13 = (v24 - 1) & v24;
    unint64_t v21 = __clz(__rbit64(v24)) + (v17 << 6);
LABEL_22:
    uint64_t v26 = *(void *)(v7 + 56);
    uint64_t v27 = v7;
    uint64_t v28 = (uint64_t *)(*(void *)(v7 + 48) + 16 * v21);
    uint64_t v29 = *v28;
    uint64_t v30 = v28[1];
    uint64_t v31 = *(void *)(v46 + 72);
    uint64_t v32 = v26 + v31 * v21;
    if (v47)
    {
      (*v14)(v48, v32, v49);
    }
    else
    {
      (*v45)(v48, v32, v49);
      swift_bridgeObjectRetain();
    }
    Hasher.init(_seed:)();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
    uint64_t v33 = -1 << *(unsigned char *)(v9 + 32);
    unint64_t v34 = result & ~v33;
    unint64_t v35 = v34 >> 6;
    if (((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6))) != 0)
    {
      unint64_t v18 = __clz(__rbit64((-1 << v34) & ~*(void *)(v15 + 8 * (v34 >> 6)))) | v34 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v36 = 0;
      unint64_t v37 = (unint64_t)(63 - v33) >> 6;
      do
      {
        if (++v35 == v37 && (v36 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        BOOL v38 = v35 == v37;
        if (v35 == v37) {
          unint64_t v35 = 0;
        }
        v36 |= v38;
        uint64_t v39 = *(void *)(v15 + 8 * v35);
      }
      while (v39 == -1);
      unint64_t v18 = __clz(__rbit64(~v39)) + (v35 << 6);
    }
    *(void *)(v15 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    uint64_t v19 = (void *)(*(void *)(v9 + 48) + 16 * v18);
    void *v19 = v29;
    v19[1] = v30;
    uint64_t result = ((uint64_t (*)(unint64_t, char *, uint64_t))*v14)(*(void *)(v9 + 56) + v31 * v18, v48, v49);
    ++*(void *)(v9 + 16);
    uint64_t v7 = v27;
  }
  swift_release();
  uint64_t v3 = v42;
  BOOL v23 = v44;
  if ((v47 & 1) == 0) {
    goto LABEL_41;
  }
LABEL_37:
  uint64_t v40 = 1 << *(unsigned char *)(v7 + 32);
  if (v40 >= 64) {
    bzero(v23, ((unint64_t)(v40 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v23 = -1 << v40;
  }
  *(void *)(v7 + 16) = 0;
LABEL_41:
  uint64_t result = swift_release();
  uint64_t *v3 = v9;
  return result;
}

unint64_t sub_100049DF8(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = _HashTable.previousHole(before:)();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      while (1)
      {
        Hasher.init(_seed:)();
        swift_bridgeObjectRetain();
        String.hash(into:)();
        Swift::Int v9 = Hasher._finalize()();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8) {
          break;
        }
        if (v10 < v8) {
          goto LABEL_11;
        }
LABEL_12:
        uint64_t v11 = *(void *)(a2 + 48);
        uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
        unint64_t v13 = (_OWORD *)(v11 + 16 * v6);
        if (v3 != v6 || v12 >= v13 + 1) {
          _OWORD *v12 = *v13;
        }
        uint64_t v14 = *(void *)(a2 + 56);
        uint64_t v15 = *(void *)(*(void *)(type metadata accessor for Logger() - 8) + 72);
        int64_t v16 = v15 * v3;
        uint64_t result = v14 + v15 * v3;
        int64_t v17 = v15 * v6;
        unint64_t v18 = v14 + v15 * v6 + v15;
        if (v16 < v17 || result >= v18)
        {
          uint64_t result = swift_arrayInitWithTakeFrontToBack();
        }
        else
        {
          int64_t v3 = v6;
          if (v16 == v17) {
            goto LABEL_6;
          }
          uint64_t result = swift_arrayInitWithTakeBackToFront();
        }
        int64_t v3 = v6;
LABEL_6:
        unint64_t v6 = (v6 + 1) & v7;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          goto LABEL_21;
        }
      }
      if (v10 < v8) {
        goto LABEL_6;
      }
LABEL_11:
      if (v3 < (uint64_t)v10) {
        goto LABEL_6;
      }
      goto LABEL_12;
    }
LABEL_21:
    unint64_t v20 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v21 = *v20;
    uint64_t v22 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v20 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v22 = *v20;
    uint64_t v21 = (-1 << result) - 1;
  }
  uint64_t *v20 = v22 & v21;
  uint64_t v23 = *(void *)(a2 + 16);
  BOOL v24 = __OFSUB__(v23, 1);
  uint64_t v25 = v23 - 1;
  if (v24)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v25;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_10004A008(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5 = (void **)v4;
  unint64_t v10 = (void *)*v4;
  unint64_t v12 = sub_10002AAA8(a2, a3);
  uint64_t v13 = v10[2];
  BOOL v14 = (v11 & 1) == 0;
  uint64_t v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_17;
  }
  char v16 = v11;
  uint64_t v17 = v10[3];
  if (v17 < v15 || (a4 & 1) == 0)
  {
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_10004A238();
      goto LABEL_7;
    }
    sub_100049A10(v15, a4 & 1);
    unint64_t v26 = sub_10002AAA8(a2, a3);
    if ((v16 & 1) == (v27 & 1))
    {
      unint64_t v12 = v26;
      unint64_t v18 = *v5;
      if (v16) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
LABEL_17:
    uint64_t result = KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
    __break(1u);
    return result;
  }
LABEL_7:
  unint64_t v18 = *v5;
  if (v16)
  {
LABEL_8:
    uint64_t v19 = v18[7];
    uint64_t v20 = type metadata accessor for Logger();
    uint64_t v21 = *(void *)(v20 - 8);
    uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 40);
    uint64_t v23 = v20;
    uint64_t v24 = v19 + *(void *)(v21 + 72) * v12;
    return v22(v24, a1, v23);
  }
LABEL_13:
  sub_10004A188(v12, a2, a3, a1, v18);

  return swift_bridgeObjectRetain();
}

uint64_t sub_10004A188(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  a5[(a1 >> 6) + 8] |= 1 << a1;
  unint64_t v8 = (void *)(a5[6] + 16 * a1);
  *unint64_t v8 = a2;
  v8[1] = a3;
  uint64_t v9 = a5[7];
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t result = (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 32))(v9 + *(void *)(*(void *)(v10 - 8) + 72) * a1, a4, v10);
  uint64_t v12 = a5[2];
  BOOL v13 = __OFADD__(v12, 1);
  uint64_t v14 = v12 + 1;
  if (v13) {
    __break(1u);
  }
  else {
    a5[2] = v14;
  }
  return result;
}

void *sub_10004A238()
{
  uint64_t v35 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v35 - 8);
  __chkstk_darwin(v35);
  int64_t v3 = (char *)&v29 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028560(&qword_10009D988);
  uint64_t v30 = v0;
  uint64_t v4 = *v0;
  uint64_t v5 = static _DictionaryStorage.copy(original:)();
  uint64_t v6 = *(void *)(v4 + 16);
  uint64_t v36 = v5;
  if (!v6)
  {
    uint64_t result = (void *)swift_release();
    uint64_t v28 = v36;
    char v27 = v30;
LABEL_25:
    uint64_t *v27 = v28;
    return result;
  }
  uint64_t v7 = v5;
  uint64_t result = (void *)(v5 + 64);
  unint64_t v9 = (unint64_t)((1 << *(unsigned char *)(v7 + 32)) + 63) >> 6;
  if (v7 != v4 || (unint64_t)result >= v4 + 64 + 8 * v9)
  {
    uint64_t result = memmove(result, (const void *)(v4 + 64), 8 * v9);
    uint64_t v7 = v36;
  }
  int64_t v10 = 0;
  *(void *)(v7 + 16) = *(void *)(v4 + 16);
  uint64_t v11 = 1 << *(unsigned char *)(v4 + 32);
  uint64_t v12 = -1;
  if (v11 < 64) {
    uint64_t v12 = ~(-1 << v11);
  }
  unint64_t v13 = v12 & *(void *)(v4 + 64);
  uint64_t v31 = v4 + 64;
  int64_t v32 = (unint64_t)(v11 + 63) >> 6;
  uint64_t v33 = v1 + 32;
  uint64_t v34 = v1 + 16;
  uint64_t v14 = v35;
  while (1)
  {
    if (v13)
    {
      unint64_t v15 = __clz(__rbit64(v13));
      v13 &= v13 - 1;
      unint64_t v16 = v15 | (v10 << 6);
      goto LABEL_9;
    }
    int64_t v24 = v10 + 1;
    if (__OFADD__(v10, 1))
    {
      __break(1u);
      goto LABEL_27;
    }
    if (v24 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v24);
    ++v10;
    if (!v25)
    {
      int64_t v10 = v24 + 1;
      if (v24 + 1 >= v32) {
        goto LABEL_23;
      }
      unint64_t v25 = *(void *)(v31 + 8 * v10);
      if (!v25) {
        break;
      }
    }
LABEL_22:
    unint64_t v13 = (v25 - 1) & v25;
    unint64_t v16 = __clz(__rbit64(v25)) + (v10 << 6);
LABEL_9:
    uint64_t v17 = 16 * v16;
    unint64_t v18 = (uint64_t *)(*(void *)(v4 + 48) + 16 * v16);
    uint64_t v19 = *v18;
    uint64_t v20 = v18[1];
    unint64_t v21 = *(void *)(v1 + 72) * v16;
    (*(void (**)(char *, unint64_t, uint64_t))(v1 + 16))(v3, *(void *)(v4 + 56) + v21, v14);
    uint64_t v22 = v36;
    uint64_t v23 = (void *)(*(void *)(v36 + 48) + v17);
    void *v23 = v19;
    v23[1] = v20;
    (*(void (**)(unint64_t, char *, uint64_t))(v1 + 32))(*(void *)(v22 + 56) + v21, v3, v14);
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v26 = v24 + 2;
  if (v26 >= v32)
  {
LABEL_23:
    uint64_t result = (void *)swift_release();
    char v27 = v30;
    uint64_t v28 = v36;
    goto LABEL_25;
  }
  unint64_t v25 = *(void *)(v31 + 8 * v26);
  if (v25)
  {
    int64_t v10 = v26;
    goto LABEL_22;
  }
  while (1)
  {
    int64_t v10 = v26 + 1;
    if (__OFADD__(v26, 1)) {
      break;
    }
    if (v10 >= v32) {
      goto LABEL_23;
    }
    unint64_t v25 = *(void *)(v31 + 8 * v10);
    ++v26;
    if (v25) {
      goto LABEL_22;
    }
  }
LABEL_27:
  __break(1u);
  return result;
}

char *sub_10004A4FC(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100028560(&qword_10009D978);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  unint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

unint64_t sub_10004A604()
{
  unint64_t result = qword_10009D960;
  if (!qword_10009D960)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D960);
  }
  return result;
}

unint64_t sub_10004A660()
{
  unint64_t result = qword_10009D968;
  if (!qword_10009D968)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D968);
  }
  return result;
}

unint64_t sub_10004A6B8()
{
  unint64_t result = qword_10009D970;
  if (!qword_10009D970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D970);
  }
  return result;
}

ValueMetadata *type metadata accessor for LogCategory()
{
  return &type metadata for LogCategory;
}

uint64_t sub_10004A71C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return 0;
  }
  uint64_t result = 0;
  uint64_t v4 = (uint64_t *)(a1 + 32);
  do
  {
    uint64_t v6 = *v4++;
    uint64_t v5 = v6;
    if ((v6 & ~result) == 0) {
      uint64_t v5 = 0;
    }
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t sub_10004A754(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009D980);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10004A7B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100028560(&qword_10009D990);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

double sub_10004A820()
{
  return 10.0;
}

void sub_10004A828(double a1)
{
  *uint64_t v1 = a1;
}

uint64_t (*sub_10004A830())()
{
  return nullsub_15;
}

uint64_t sub_10004A850(uint64_t result)
{
  *(void *)(v1 + 8) = result;
  return result;
}

uint64_t (*sub_10004A858())()
{
  return nullsub_15;
}

double sub_10004A878(double a1, double a2)
{
  return a2;
}

void sub_10004A880(double a1)
{
  *(double *)(v1 + 16) = a1;
}

uint64_t (*sub_10004A888())()
{
  return nullsub_15;
}

CGFloat sub_10004A8A8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>, double a3@<D2>, double a4@<D3>)
{
  long double v6 = sin(a4 * 3.14159265 * (double)a1);
  CGAffineTransformMakeTranslation(&v10, v6 * a3, 0.0);
  CGFloat result = v10.a;
  long long v8 = *(_OWORD *)&v10.c;
  long long v9 = *(_OWORD *)&v10.tx;
  *(_OWORD *)a2 = *(_OWORD *)&v10.a;
  *(void *)(a2 + 16) = 0;
  *(_OWORD *)(a2 + 24) = v8;
  *(void *)(a2 + 40) = 0;
  *(_OWORD *)(a2 + 48) = v9;
  *(void *)(a2 + 64) = 0x3FF0000000000000;
  return result;
}

unint64_t sub_10004A92C()
{
  unint64_t result = qword_10009D998;
  if (!qword_10009D998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D998);
  }
  return result;
}

unint64_t sub_10004A984()
{
  unint64_t result = qword_10009D9A0;
  if (!qword_10009D9A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D9A0);
  }
  return result;
}

CGFloat sub_10004A9D8@<D0>(uint64_t a1@<X8>)
{
  double v3 = *(double *)v1;
  long double v4 = sin(*(double *)(v1 + 16) * 3.14159265 * (double)*(uint64_t *)(v1 + 8));
  CGAffineTransformMakeTranslation(&v8, v3 * v4, 0.0);
  CGFloat result = v8.a;
  long long v6 = *(_OWORD *)&v8.c;
  long long v7 = *(_OWORD *)&v8.tx;
  *(_OWORD *)a1 = *(_OWORD *)&v8.a;
  *(void *)(a1 + 16) = 0;
  *(_OWORD *)(a1 + 24) = v6;
  *(void *)(a1 + 40) = 0;
  *(_OWORD *)(a1 + 48) = v7;
  *(void *)(a1 + 64) = 0x3FF0000000000000;
  return result;
}

unint64_t sub_10004AA64()
{
  unint64_t result = qword_10009D9A8;
  if (!qword_10009D9A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D9A8);
  }
  return result;
}

double sub_10004AAB8@<D0>(double *a1@<X8>)
{
  double result = *(double *)(v1 + 16);
  *a1 = result;
  return result;
}

double sub_10004AAC4(double *a1)
{
  double result = *a1;
  *(double *)(v1 + 16) = *a1;
  return result;
}

uint64_t sub_10004AAD4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_10004ACAC();

  return static GeometryEffect._makeView(modifier:inputs:body:)(a1, a2, a3, a4, a5, v10);
}

uint64_t sub_10004AB50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v10 = sub_10004ACAC();

  return static GeometryEffect._makeViewList(modifier:inputs:body:)(a1, a2, a3, a4, a5, v10);
}

uint64_t sub_10004ABCC()
{
  return static GeometryEffect._viewListCount(inputs:body:)();
}

void sub_10004AC28()
{
}

__n128 initializeBufferWithCopyOfBuffer for Shake(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for Shake(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for Shake(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
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
  *(unsigned char *)(result + 24) = v3;
  return result;
}

ValueMetadata *type metadata accessor for Shake()
{
  return &type metadata for Shake;
}

unint64_t sub_10004ACAC()
{
  unint64_t result = qword_10009D9B0;
  if (!qword_10009D9B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D9B0);
  }
  return result;
}

void sub_10004AD00(void *a1)
{
  uint64_t v2 = v1;
  id v4 = [a1 userInterfaceRequest];
  unsigned int v5 = [v4 identifier];

  switch(v5)
  {
    case 1u:
      id v6 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler());
      long long v7 = (void *)LACUIDTOSensorNotTrustedScenePresentationHandler.init()();
      if (v7) {
        goto LABEL_7;
      }
      goto LABEL_12;
    case 2u:
      id v8 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler());
      long long v7 = (void *)LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()();
      if (!v7) {
        goto LABEL_12;
      }
      goto LABEL_7;
    case 3u:
      id v9 = objc_allocWithZone((Class)type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler());
      id v10 = a1;
      long long v7 = (void *)LACUIOnenessUnsatisfiablePresentationHandler.init(request:)();
      if (v7) {
        goto LABEL_7;
      }
      goto LABEL_12;
    case 5u:
      uint64_t v14 = self;
      if (([v14 deviceHasFaceID] & 1) == 0
        && ![v14 deviceHasTouchID])
      {
        [v14 deviceHasOpticID];
      }
      unint64_t v15 = sub_100006F70();
      id v16 = objc_allocWithZone((Class)type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler());
      long long v7 = (void *)LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)();
      if (!v7) {
        goto LABEL_12;
      }
LABEL_7:
      id v11 = [v2 scene];
      id v12 = objc_allocWithZone((Class)LACUIScenePresentationContext);
      id v13 = v2;
      id v24 = [v12 initWithPresenter:v13 scene:v11];

      swift_unknownObjectRelease();
      [v7 handle:a1 inContext:v24];
      break;
    default:
LABEL_12:
      id v17 = [v2 scene];
      _StringGuts.grow(_:)(24);
      swift_bridgeObjectRelease();
      id v18 = [a1 description];
      uint64_t v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v21 = v20;

      v22._uint64_t countAndFlagsBits = v19;
      v22._object = v21;
      String.append(_:)(v22);
      swift_bridgeObjectRelease();
      v23._uint64_t countAndFlagsBits = 0x756F6620746F6E20;
      v23._object = (void *)0xEA0000000000646ELL;
      String.append(_:)(v23);
      id v24 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v17 deactivateWithReason:v24];
      break;
  }
  swift_unknownObjectRelease();
}

id sub_10004B038(uint64_t a1)
{
  id v2 = [objc_allocWithZone(v1) initWithScene:a1];
  swift_unknownObjectRelease();
  return v2;
}

id sub_10004B080(uint64_t a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  [super initWithScene:a1];
  swift_unknownObjectRelease();
  return v3;
}

id sub_10004B11C(uint64_t a1, uint64_t a2, void *a3)
{
  if (a2)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  id v6 = [super initWithNibName:v5 bundle:a3];

  return v6;
}

id sub_10004B23C(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  [super initWithCoder:a1];

  return v3;
}

id sub_10004B2D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RemoteAlertRootViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for RemoteAlertRootViewController()
{
  return self;
}

id sub_10004B32C(void *a1)
{
  if (a1)
  {
    return a1;
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    id result = (id)EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10004B3AC()
{
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);

  return EnvironmentObject.projectedValue.getter();
}

uint64_t sub_10004B438@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  sub_10002B40C(0, &qword_10009E050);
  if (sub_1000608FC()) {
    goto LABEL_4;
  }
  if (a1)
  {
    id v4 = a1;
    sub_100059ED8();

LABEL_4:
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.init()();
    sub_10004B5F8();
    sub_10004B64C();
    uint64_t result = _ConditionalContent<>.init(storage:)();
    *(_OWORD *)a2 = v6;
    *(unsigned char *)(a2 + 16) = v7;
    return result;
  }
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

unint64_t sub_10004B5F8()
{
  unint64_t result = qword_10009EE50;
  if (!qword_10009EE50)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009EE50);
  }
  return result;
}

unint64_t sub_10004B64C()
{
  unint64_t result = qword_10009EE58[0];
  if (!qword_10009EE58[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10009EE58);
  }
  return result;
}

uint64_t sub_10004B6A0()
{
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);

  return EnvironmentObject.init()();
}

uint64_t sub_10004B714()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004B730@<X0>(uint64_t a1@<X8>)
{
  return sub_10004B438(*v1, a1);
}

__n128 initializeWithTake for AuthorizationViewWrapper(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationViewWrapper()
{
  return &type metadata for AuthorizationViewWrapper;
}

unint64_t sub_10004B760()
{
  unint64_t result = qword_10009D9E0;
  if (!qword_10009D9E0)
  {
    sub_10002F434(&qword_10009D9E8);
    sub_10004B5F8();
    sub_10004B64C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009D9E0);
  }
  return result;
}

void *initializeBufferWithCopyOfBuffer for AuthorizationView(void *a1, uint64_t a2)
{
  id v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  id v5 = v3;
  return a1;
}

void destroy for AuthorizationView(id *a1)
{
}

uint64_t assignWithCopy for AuthorizationView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for AuthorizationView(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *a2;

  *(void *)(a1 + 8) = a2[1];
  return a1;
}

ValueMetadata *type metadata accessor for AuthorizationView()
{
  return &type metadata for AuthorizationView;
}

ValueMetadata *type metadata accessor for AuthorizationContentView()
{
  return &type metadata for AuthorizationContentView;
}

uint64_t sub_10004B8C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004B8DC@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v32 = a2;
  uint64_t v5 = sub_100028560(&qword_10009DA90);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  objc_super v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v10 = (char *)&v31 - v9;
  uint64_t v11 = sub_100028560(&qword_10009DA98);
  __chkstk_darwin(v11 - 8);
  id v13 = (uint64_t *)((char *)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t *v13 = static Alignment.center.getter();
  v13[1] = v14;
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t v15 = EnvironmentObject.init()();
  if (a1)
  {
    id v17 = (void *)v15;
    uint64_t v18 = v16;
    id v19 = a1;
    char v20 = sub_1000572E0();

    if (v20) {
      double v21 = 1.0;
    }
    else {
      double v21 = 0.0;
    }
    Swift::String v22 = (char *)v13 + *(int *)(sub_100028560(&qword_10009DAA0) + 44);
    *(void *)id v10 = static HorizontalAlignment.center.getter();
    *((void *)v10 + 1) = 0;
    v10[16] = 1;
    uint64_t v23 = sub_100028560(&qword_10009DAA8);
    sub_10004BB9C(a1, &v10[*(int *)(v23 + 44)]);
    sub_10002AA34((uint64_t)v10, (uint64_t)v8, &qword_10009DA90);
    *(void *)Swift::String v22 = v17;
    *((void *)v22 + 1) = v18;
    *((double *)v22 + 2) = v21;
    uint64_t v24 = sub_100028560(&qword_10009DAB0);
    sub_10002AA34((uint64_t)v8, (uint64_t)&v22[*(int *)(v24 + 48)], &qword_10009DA90);
    id v25 = v17;
    sub_10002F024((uint64_t)v10, &qword_10009DA90);
    sub_10002F024((uint64_t)v8, &qword_10009DA90);

    uint64_t v26 = swift_allocObject();
    uint64_t v27 = v32;
    *(void *)(v26 + 16) = a1;
    *(void *)(v26 + 24) = v27;
    sub_10002AA34((uint64_t)v13, a3, &qword_10009DA98);
    uint64_t v28 = (uint64_t (**)())(a3 + *(int *)(sub_100028560(&qword_10009DAB8) + 36));
    *uint64_t v28 = sub_10004D7B8;
    v28[1] = (uint64_t (*)())v26;
    v28[2] = 0;
    v28[3] = 0;
    id v29 = v19;
    return sub_10002F024((uint64_t)v13, &qword_10009DA98);
  }
  else
  {
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10004BB9C@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  uint64_t v51 = a2;
  uint64_t v45 = sub_100028560(&qword_10009DAC0);
  __chkstk_darwin(v45);
  uint64_t v48 = (char *)&v42 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for Material();
  uint64_t v46 = *(void *)(v4 - 8);
  uint64_t v47 = v4;
  __chkstk_darwin(v4);
  uint64_t v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for MoveTransition();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v13 = (char *)&v42 - v12;
  uint64_t v43 = sub_100028560(&qword_10009DAC8);
  __chkstk_darwin(v43);
  uint64_t v15 = (uint64_t *)((char *)&v42 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v16 = sub_100028560(&qword_10009DAD0);
  uint64_t v49 = *(void *)(v16 - 8);
  uint64_t v50 = v16;
  __chkstk_darwin(v16);
  uint64_t v44 = (uint64_t)&v42 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100028560(&qword_10009DAD8);
  uint64_t v19 = __chkstk_darwin(v18 - 8);
  double v21 = (char *)&v42 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v19);
  uint64_t v23 = (char *)&v42 - v22;
  id v24 = a1;
  char v25 = sub_1000572E0();

  if (v25)
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t v26 = (void *)EnvironmentObject.init()();
    uint64_t v42 = v27;
    MoveTransition.init(edge:)();
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    sub_1000547AC(&qword_10009DAE8, (void (*)(uint64_t))&type metadata accessor for MoveTransition);
    uint64_t v28 = AnyTransition.init<A>(_:)();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
    static Material.thick.getter();
    char v29 = static Edge.Set.all.getter();
    uint64_t v31 = v46;
    uint64_t v30 = v47;
    uint64_t v32 = (uint64_t)v48;
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v48, v6, v47);
    *(unsigned char *)(v32 + *(int *)(v45 + 36)) = v29;
    sub_10002AA34(v32, (uint64_t)v15 + *(int *)(v43 + 36), &qword_10009DAC0);
    uint64_t v33 = v42;
    void *v15 = v26;
    v15[1] = v33;
    _OWORD v15[2] = v28;
    id v34 = v26;
    swift_retain();
    sub_10002F024(v32, &qword_10009DAC0);
    (*(void (**)(char *, uint64_t))(v31 + 8))(v6, v30);
    swift_release();

    uint64_t v35 = static SafeAreaRegions.container.getter();
    LOBYTE(v34) = static Edge.Set.bottom.getter();
    uint64_t v36 = v44;
    sub_10002AA34((uint64_t)v15, v44, &qword_10009DAC8);
    uint64_t v37 = v50;
    uint64_t v38 = v36 + *(int *)(v50 + 36);
    *(void *)uint64_t v38 = v35;
    *(unsigned char *)(v38 + 8) = (_BYTE)v34;
    sub_10002F024((uint64_t)v15, &qword_10009DAC8);
    sub_1000542F8(v36, (uint64_t)v23, &qword_10009DAD0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v49 + 56))(v23, 0, 1, v37);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v49 + 56))(v23, 1, 1, v50);
  }
  sub_10002AA34((uint64_t)v23, (uint64_t)v21, &qword_10009DAD8);
  uint64_t v39 = v51;
  *uint64_t v51 = 0;
  *((unsigned char *)v39 + 8) = 1;
  uint64_t v40 = sub_100028560(&qword_10009DAE0);
  sub_10002AA34((uint64_t)v21, (uint64_t)v39 + *(int *)(v40 + 48), &qword_10009DAD8);
  sub_10002F024((uint64_t)v23, &qword_10009DAD8);
  return sub_10002F024((uint64_t)v21, &qword_10009DAD8);
}

uint64_t sub_10004C124(void *a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for DispatchQoS();
  uint64_t v6 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    id v9 = a1;
    sub_10005731C();

    sub_10002B40C(0, (unint64_t *)&qword_10009E060);
    uint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v11 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_10004D894;
    aBlock[5] = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    void aBlock[2] = sub_100029A40;
    void aBlock[3] = &unk_1000881A8;
    uint64_t v12 = _Block_copy(aBlock);
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_1000547AC((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_100033E8C((unint64_t *)&qword_10009D6A0, (uint64_t *)&unk_10009E070);
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v12);

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v15);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10004C480@<X0>(uint64_t a1@<X8>)
{
  return sub_10004B8DC(*(void **)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_10004C488()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_10004C4A4(unsigned char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v48 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v48);
  uint64_t v6 = (double *)((char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = type metadata accessor for Material();
  uint64_t v7 = *(void *)(v45 - 8);
  __chkstk_darwin(v45);
  id v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = sub_100028560(&qword_10009D9F0);
  __chkstk_darwin(v42);
  uint64_t v11 = (char *)&v40 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100028560(&qword_10009D9F8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v40 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v41 = sub_100028560(&qword_10009DA00);
  __chkstk_darwin(v41);
  uint64_t v16 = (char *)&v40 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100028560(&qword_10009DA08);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    char v21 = a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad];
    uint64_t v49 = a3;
    uint64_t v44 = v18;
    if (v21)
    {
      type metadata accessor for AuthorizationViewModel();
      sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
      uint64_t v46 = EnvironmentObject.init()();
      uint64_t v47 = v22;
    }
    else
    {
      uint64_t v46 = 1;
      uint64_t v47 = 0;
    }
    *(void *)uint64_t v14 = static HorizontalAlignment.center.getter();
    *((void *)v14 + 1) = 0;
    v14[16] = 1;
    uint64_t v23 = sub_100028560(&qword_10009DA10);
    sub_10004CA10(a1, v43, (uint64_t)&v14[*(int *)(v23 + 44)]);
    static Material.thick.getter();
    if (a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad] != 1
      || (v24 = a1, BOOL v25 = sub_100059ED8(), v24, v26 = 1.0, v25))
    {
      float v26 = 0.0;
    }
    uint64_t v27 = v45;
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v11, v9, v45);
    *(float *)&v11[*(int *)(v42 + 36)] = v26;
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v27);
    char v28 = static Edge.Set.all.getter();
    uint64_t v29 = (uint64_t)&v16[*(int *)(v41 + 36)];
    sub_10002AA34((uint64_t)v11, v29, &qword_10009D9F0);
    *(unsigned char *)(v29 + *(int *)(sub_100028560(&qword_10009DA18) + 36)) = v28;
    sub_10002AA34((uint64_t)v14, (uint64_t)v16, &qword_10009D9F8);
    sub_10002F024((uint64_t)v11, &qword_10009D9F0);
    sub_10002F024((uint64_t)v14, &qword_10009D9F8);
    uint64_t v30 = a1;
    double v31 = sub_1000599D8();

    uint64_t v32 = (char *)v6 + *(int *)(v48 + 20);
    uint64_t v33 = enum case for RoundedCornerStyle.continuous(_:);
    uint64_t v34 = type metadata accessor for RoundedCornerStyle();
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v34 - 8) + 104))(v32, v33, v34);
    double *v6 = v31;
    v6[1] = v31;
    uint64_t v35 = (uint64_t)&v20[*(int *)(v44 + 36)];
    sub_100054224((uint64_t)v6, v35, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    *(_WORD *)(v35 + *(int *)(sub_100028560(&qword_10009DA20) + 36)) = 256;
    sub_10002AA34((uint64_t)v16, (uint64_t)v20, &qword_10009DA00);
    sub_10005428C((uint64_t)v6, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
    sub_10002F024((uint64_t)v16, &qword_10009DA00);
    uint64_t v36 = sub_10004CD58();
    sub_10002F024((uint64_t)v20, &qword_10009DA08);
    uint64_t v37 = v49;
    uint64_t v39 = (void *)v46;
    uint64_t v38 = v47;
    *uint64_t v49 = v46;
    v37[1] = v38;
    v37[2] = v36;
    sub_10004D2DC(v39);
    sub_10004D2EC(v39);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t sub_10004CA10@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v34 = a3;
  uint64_t v5 = type metadata accessor for AuthorizationHeaderView();
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (uint64_t *)((char *)&v32 - v9);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a1;
  *(void *)(v11 + 24) = a2;
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  id v12 = a1;
  *uint64_t v10 = EnvironmentObject.init()();
  v10[1] = v13;
  void v10[2] = (uint64_t)sub_10004D5F0;
  v10[3] = v11;
  *(void *)&long long v40 = 0x4034000000000000;
  sub_10004D5F4();
  ScaledMetric.init(wrappedValue:)();
  id v14 = v12;
  BOOL v33 = sub_100059ED8();

  id v15 = v14;
  LOBYTE(v12) = sub_10005A2C4();

  uint64_t v16 = EnvironmentObject.init()();
  uint64_t v18 = v16;
  uint64_t v19 = v17;
  if (v12)
  {
    uint64_t v35 = v16;
    uint64_t v36 = v17;
    sub_10004D648();
    sub_10004D69C();
    uint64_t v38 = 0;
    long long v37 = 0uLL;
    char v39 = 0;
  }
  else
  {
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    State.init(wrappedValue:)();
    uint64_t v35 = v18;
    uint64_t v36 = v19;
    long long v37 = v40;
    uint64_t v38 = v41;
    char v39 = 1;
    sub_10004D648();
    sub_10004D69C();
  }
  _ConditionalContent<>.init(storage:)();
  long long v20 = v40;
  uint64_t v21 = v41;
  uint64_t v22 = v42;
  uint64_t v23 = v43;
  char v24 = v44;
  id v25 = v15;
  BOOL v32 = sub_100059ED8();

  sub_100054224((uint64_t)v10, (uint64_t)v8, (uint64_t (*)(void))type metadata accessor for AuthorizationHeaderView);
  uint64_t v26 = v34;
  sub_100054224((uint64_t)v8, v34, (uint64_t (*)(void))type metadata accessor for AuthorizationHeaderView);
  uint64_t v27 = (int *)sub_100028560(&qword_10009DA88);
  uint64_t v28 = v26 + v27[12];
  *(void *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 8) = 0;
  *(unsigned char *)(v28 + 9) = !v33;
  uint64_t v29 = v26 + v27[16];
  *(_OWORD *)uint64_t v29 = v20;
  *(void *)(v29 + 16) = v21;
  *(void *)(v29 + 24) = v22;
  *(void *)(v29 + 32) = v23;
  *(unsigned char *)(v29 + 40) = v24;
  uint64_t v30 = v26 + v27[20];
  *(void *)uint64_t v30 = 0;
  *(unsigned char *)(v30 + 8) = 0;
  *(unsigned char *)(v30 + 9) = !v32;
  sub_10004D6F0((void *)v20, *((uint64_t *)&v20 + 1), v21, v22, v23, v24);
  sub_10005428C((uint64_t)v10, (uint64_t (*)(void))type metadata accessor for AuthorizationHeaderView);
  sub_10004D754((void *)v20, *((uint64_t *)&v20 + 1), v21, v22, v23, v24);
  return sub_10005428C((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for AuthorizationHeaderView);
}

uint64_t sub_10004CD58()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100028560(&qword_10009DA28);
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100028560(&qword_10009DA30);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B40C(0, &qword_10009E050);
  if (sub_1000608FC())
  {
    uint64_t v8 = self;
    id v9 = [v8 mainScreen];
    [v9 nativeBounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    v24.origin.x = v11;
    v24.origin.y = v13;
    v24.size.width = v15;
    v24.size.height = v17;
    double Width = CGRectGetWidth(v24);
    id v19 = [v8 mainScreen];
    [v19 nativeScale];
    double v21 = v20;

    sub_10002AA34(v1, (uint64_t)v7, &qword_10009DA08);
    *(double *)&v7[*(int *)(v5 + 36)] = Width / v21 * 0.55;
    sub_10004D4D4();
  }
  else
  {
    sub_10002AA34(v0, (uint64_t)v4, &qword_10009DA08);
    sub_100054684(&qword_10009DA38, &qword_10009DA28, (void (*)(void))sub_10004D2FC);
  }
  return AnyView.init<A>(_:)();
}

unsigned char *sub_10004CF80@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(unsigned char **)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  uint64_t v5 = static Alignment.center.getter();
  uint64_t v7 = v6;
  sub_10004C4A4(v3, v4, (uint64_t *)&v14);
  long long v13 = v14;
  uint64_t v8 = v15;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v3;
  *(void *)(v9 + 24) = v4;
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v3;
  *(void *)(v10 + 24) = v4;
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v7;
  *(_OWORD *)(a1 + 16) = v13;
  *(void *)(a1 + 40) = 0;
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 32) = v8;
  *(void *)(a1 + 56) = sub_10004D0AC;
  *(void *)(a1 + 64) = v9;
  *(void *)(a1 + 72) = sub_10004D1E0;
  *(void *)(a1 + 80) = v10;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 96) = 0;
  CGFloat v11 = v3;

  return v11;
}

uint64_t sub_10004D074()
{
  return _swift_deallocObject(v0, 32, 7);
}

void sub_10004D0AC()
{
  uint64_t v1 = *(char **)(v0 + 16);
  if (v1)
  {
    if (v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad])
    {
      uint64_t v2 = &v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad];
      swift_beginAccess();
      if ((*v2 & 1) == 0)
      {
        uint64_t v3 = self;
        uint64_t v4 = v1;
        id v5 = [v3 errorWithCode:-2];
        uint64_t v6 = sub_10003F308();
        sub_10005C258((uint64_t)v5, (uint64_t (*)(uint64_t))v6, v7);
        swift_release();
      }
    }
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

void sub_10004D1E0()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    if ((*((unsigned char *)v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad) & 1) != 0
      || (id v2 = v1, v3 = sub_100059ED8(), v2, v3))
    {
      id v4 = v1;
      sub_100057B9C();
    }
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

id sub_10004D2DC(id result)
{
  if (result != (id)1) {
    return result;
  }
  return result;
}

void sub_10004D2EC(id a1)
{
  if (a1 != (id)1) {
}
  }

unint64_t sub_10004D2FC()
{
  unint64_t result = qword_10009DA40;
  if (!qword_10009DA40)
  {
    sub_10002F434(&qword_10009DA08);
    sub_10004D39C();
    sub_100033E8C(&qword_10009DA70, &qword_10009DA20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DA40);
  }
  return result;
}

unint64_t sub_10004D39C()
{
  unint64_t result = qword_10009DA48;
  if (!qword_10009DA48)
  {
    sub_10002F434(&qword_10009DA00);
    sub_10004D43C();
    sub_100033E8C(&qword_10009DA68, &qword_10009DA18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DA48);
  }
  return result;
}

unint64_t sub_10004D43C()
{
  unint64_t result = qword_10009DA50;
  if (!qword_10009DA50)
  {
    sub_10002F434(&qword_10009D9F8);
    sub_100033E8C(&qword_10009DA58, &qword_10009DA60);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DA50);
  }
  return result;
}

unint64_t sub_10004D4D4()
{
  unint64_t result = qword_10009DA78;
  if (!qword_10009DA78)
  {
    sub_10002F434(&qword_10009DA30);
    sub_10004D2FC();
    sub_10004D550();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DA78);
  }
  return result;
}

unint64_t sub_10004D550()
{
  unint64_t result = qword_10009EFE0;
  if (!qword_10009EFE0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009EFE0);
  }
  return result;
}

uint64_t type metadata accessor for AuthorizationHeaderView()
{
  uint64_t result = qword_10009EFF8;
  if (!qword_10009EFF8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

unint64_t sub_10004D5F4()
{
  unint64_t result = qword_10009DA80;
  if (!qword_10009DA80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DA80);
  }
  return result;
}

unint64_t sub_10004D648()
{
  unint64_t result = qword_10009EFE8;
  if (!qword_10009EFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009EFE8);
  }
  return result;
}

unint64_t sub_10004D69C()
{
  unint64_t result = qword_10009EFF0;
  if (!qword_10009EFF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009EFF0);
  }
  return result;
}

id sub_10004D6F0(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    swift_retain();
    id v7 = a1;
    return (id)swift_bridgeObjectRetain();
  }
  else
  {
    return a1;
  }
}

void sub_10004D754(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6)
{
  if (a6)
  {
    swift_bridgeObjectRelease();
    swift_release();
  }
}

uint64_t sub_10004D7B8()
{
  return swift_release();
}

uint64_t sub_10004D830()
{
  return sub_10004C124(*(void **)(v0 + 16));
}

uint64_t sub_10004D85C()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10004D894()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_100057B9C();
  }
}

uint64_t sub_10004D8EC(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10004D8FC()
{
  return swift_release();
}

ValueMetadata *type metadata accessor for AuthorizationBackgroundView()
{
  return &type metadata for AuthorizationBackgroundView;
}

uint64_t getEnumTagSinglePayload for AuthorizationRegisterPasswordContentView.Mode(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  if ((v3 + 1) >= 2) {
    return v3;
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for AuthorizationRegisterPasswordContentView.Mode(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = 0;
    *(void *)(result + 8) = 0;
    *(_DWORD *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

uint64_t sub_10004D9BC(uint64_t a1)
{
  unint64_t v1 = *(void *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF) {
    LODWORD(v1) = -1;
  }
  return (v1 + 1);
}

void *sub_10004D9D4(void *result, int a2)
{
  if (a2 < 0)
  {
    *unint64_t result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationRegisterPasswordContentView.Mode()
{
  return &type metadata for AuthorizationRegisterPasswordContentView.Mode;
}

ValueMetadata *type metadata accessor for MaxWidth()
{
  return &type metadata for MaxWidth;
}

uint64_t destroy for AuthorizationRegisterPasswordContentView(id *a1)
{
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  id v5 = v3;
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  id v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for AuthorizationRegisterPasswordContentView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationRegisterPasswordContentView(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 40)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationRegisterPasswordContentView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 40) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationRegisterPasswordContentView()
{
  return &type metadata for AuthorizationRegisterPasswordContentView;
}

uint64_t _s10CoreAuthUI24AuthorizationViewWrapperVwet_0(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  uint64_t v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t _s10CoreAuthUI24AuthorizationViewWrapperVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)unint64_t result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)unint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationEnterPasswordContentView()
{
  return &type metadata for AuthorizationEnterPasswordContentView;
}

char *sub_10004DD10(char *a1, char **a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  id v5 = *a2;
  *(void *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    swift_retain();
  }
  else
  {
    uint64_t v8 = a2 + 2;
    uint64_t v9 = a2[2];
    *((void *)a1 + 1) = a2[1];
    uint64_t v10 = v5;
    if (v9)
    {
      CGFloat v11 = a2[3];
      *((void *)a1 + 2) = v9;
      *((void *)a1 + 3) = v11;
      swift_retain();
    }
    else
    {
      *((_OWORD *)a1 + 1) = *v8;
    }
    uint64_t v12 = *(int *)(a3 + 24);
    long long v13 = &a1[v12];
    uint64_t v14 = (uint64_t)a2 + v12;
    uint64_t v15 = sub_100028560(&qword_10009DAF0);
    (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  }
  return a1;
}

uint64_t sub_10004DE1C(uint64_t a1, uint64_t a2)
{
  if (*(void *)(a1 + 16)) {
    swift_release();
  }
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_100028560(&qword_10009DAF0);
  id v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *sub_10004DEA8(void *a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)a2;
  uint64_t v7 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v7;
  uint64_t v9 = (_OWORD *)(a2 + 16);
  uint64_t v8 = *(void *)(a2 + 16);
  id v10 = v6;
  if (v8)
  {
    uint64_t v11 = *(void *)(a2 + 24);
    a1[2] = v8;
    a1[3] = v11;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v9;
  }
  uint64_t v12 = *(int *)(a3 + 24);
  long long v13 = (char *)a1 + v12;
  uint64_t v14 = a2 + v12;
  uint64_t v15 = sub_100028560(&qword_10009DAF0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v15 - 8) + 16))(v13, v14, v15);
  return a1;
}

uint64_t sub_10004DF64(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = *(void **)a1;
  uint64_t v7 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v8 = v7;

  uint64_t v9 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v10 = *(void *)(a2 + 16);
  if (!v9)
  {
    if (v10)
    {
      uint64_t v12 = *(void *)(a2 + 24);
      *(void *)(a1 + 16) = v10;
      *(void *)(a1 + 24) = v12;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    goto LABEL_8;
  }
  if (!v10)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v11 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = v10;
  *(void *)(a1 + 24) = v11;
  swift_retain();
  swift_release();
LABEL_8:
  uint64_t v13 = *(int *)(a3 + 24);
  uint64_t v14 = a1 + v13;
  uint64_t v15 = a2 + v13;
  uint64_t v16 = sub_100028560(&qword_10009DAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 24))(v14, v15, v16);
  return a1;
}

uint64_t sub_10004E060(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  if (v4)
  {
    uint64_t v5 = *(void *)(a2 + 24);
    *(void *)(a1 + 16) = v4;
    *(void *)(a1 + 24) = v5;
  }
  else
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  }
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = a1 + v6;
  uint64_t v8 = a2 + v6;
  uint64_t v9 = sub_100028560(&qword_10009DAF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(v7, v8, v9);
  return a1;
}

uint64_t sub_10004E104(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = *(void **)a1;
  *(void *)a1 = *a2;

  uint64_t v7 = a2[2];
  uint64_t v8 = *(void *)(a1 + 16);
  *(void *)(a1 + 8) = a2[1];
  if (!v8)
  {
    if (v7)
    {
      uint64_t v10 = a2[3];
      *(void *)(a1 + 16) = v7;
      *(void *)(a1 + 24) = v10;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v9 = a2[3];
  *(void *)(a1 + 16) = v7;
  *(void *)(a1 + 24) = v9;
  swift_release();
LABEL_8:
  uint64_t v11 = *(int *)(a3 + 24);
  uint64_t v12 = a1 + v11;
  uint64_t v13 = (char *)a2 + v11;
  uint64_t v14 = sub_100028560(&qword_10009DAF0);
  (*(void (**)(uint64_t, char *, uint64_t))(*(void *)(v14 - 8) + 40))(v12, v13, v14);
  return a1;
}

uint64_t sub_10004E1F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10004E204);
}

uint64_t sub_10004E204(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 2147483646)
  {
    uint64_t v4 = *a1;
    if ((unint64_t)*a1 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    int v5 = v4 - 1;
    if (v5 < 0) {
      int v5 = -1;
    }
    return (v5 + 1);
  }
  else
  {
    uint64_t v9 = sub_100028560(&qword_10009DAF0);
    uint64_t v10 = *(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v9 - 8) + 48);
    uint64_t v11 = v9;
    uint64_t v12 = (char *)a1 + *(int *)(a3 + 24);
    return v10(v12, a2, v11);
  }
}

uint64_t sub_10004E2C4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10004E2D8);
}

void *sub_10004E2D8(void *result, uint64_t a2, int a3, uint64_t a4)
{
  int v5 = result;
  if (a3 == 2147483646)
  {
    *unint64_t result = a2;
  }
  else
  {
    uint64_t v7 = sub_100028560(&qword_10009DAF0);
    uint64_t v8 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = (char *)v5 + *(int *)(a4 + 24);
    return (void *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_10004E384()
{
  sub_10004E41C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10004E41C()
{
  if (!qword_10009DB50)
  {
    sub_10004D5F4();
    unint64_t v0 = type metadata accessor for ScaledMetric();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10009DB50);
    }
  }
}

uint64_t sub_10004E478()
{
  return sub_100054684(&qword_10009DB88, &qword_10009DB90, (void (*)(void))sub_10004E4BC);
}

unint64_t sub_10004E4BC()
{
  unint64_t result = qword_10009DB98;
  if (!qword_10009DB98)
  {
    sub_10002F434(&qword_10009DBA0);
    sub_100033E8C(&qword_10009DBA8, &qword_10009DBB0);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DB98);
  }
  return result;
}

unint64_t sub_10004E560()
{
  unint64_t result = qword_10009DBB8;
  if (!qword_10009DBB8)
  {
    sub_10002F434(&qword_10009DAB8);
    sub_100033E8C(&qword_10009DBC0, &qword_10009DA98);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DBB8);
  }
  return result;
}

uint64_t sub_10004E600()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_10004E61C@<X0>(char *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v147 = a2;
  v158 = a3;
  uint64_t v155 = sub_100028560(&qword_10009DBE0);
  uint64_t v160 = *(void *)(v155 - 8);
  __chkstk_darwin(v155);
  int v5 = (char *)&v123 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009DBE8);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v157 = (uint64_t)&v123 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  v156 = (char *)&v123 - v9;
  uint64_t v133 = sub_100028560(&qword_10009DBF0);
  __chkstk_darwin(v133);
  uint64_t v134 = (uint64_t)&v123 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v153 = sub_100028560(&qword_10009DBF8);
  __chkstk_darwin(v153);
  v135 = (char *)&v123 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v140 = sub_100028560(&qword_10009DC00);
  __chkstk_darwin(v140);
  v141 = (char *)&v123 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100028560(&qword_10009DC08);
  uint64_t v126 = *(void *)(v13 - 8);
  uint64_t v127 = v13;
  __chkstk_darwin(v13);
  v125 = (char *)&v123 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v132 = sub_100028560(&qword_10009DC10);
  __chkstk_darwin(v132);
  v128 = (char *)&v123 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = type metadata accessor for BorderedProminentButtonStyle();
  uint64_t v137 = *(void *)(v16 - 8);
  uint64_t v138 = v16;
  __chkstk_darwin(v16);
  v136 = (char *)&v123 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100028560(&qword_10009DC18);
  uint64_t v145 = *(void *)(v18 - 8);
  uint64_t v146 = v18;
  __chkstk_darwin(v18);
  v144 = (char *)&v123 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100028560(&qword_10009DC20);
  uint64_t v129 = *(void *)(v20 - 8);
  uint64_t v130 = v20;
  __chkstk_darwin(v20);
  uint64_t v22 = (char *)&v123 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v143 = sub_100028560(&qword_10009DC28);
  uint64_t v23 = __chkstk_darwin(v143);
  id v25 = (char *)&v123 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v23);
  uint64_t v131 = (uint64_t)&v123 - v26;
  uint64_t v149 = sub_100028560(&qword_10009DC30);
  __chkstk_darwin(v149);
  uint64_t v151 = (uint64_t)&v123 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v142 = sub_100028560(&qword_10009DC38);
  __chkstk_darwin(v142);
  uint64_t v29 = (char **)((char *)&v123 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v150 = sub_100028560(&qword_10009DC40);
  __chkstk_darwin(v150);
  double v31 = (char *)&v123 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = sub_100028560(&qword_10009DC48);
  uint64_t v33 = __chkstk_darwin(v32 - 8);
  uint64_t v35 = (char *)&v123 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  long long v37 = (char *)&v123 - v36;
  if (!a1)
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
    return result;
  }
  v148 = a1;
  uint64_t v38 = a1;
  uint64_t v152 = sub_100058194();
  uint64_t v154 = v39;

  long long v40 = v38;
  LOBYTE(v38) = sub_100059D10();

  v139 = v5;
  v159 = v37;
  if ((v38 & 1) == 0)
  {
    v123 = v40;
    v124 = v35;
    uint64_t v49 = v40;
    char v50 = sub_100057504();

    if (v50)
    {
      uint64_t v51 = swift_allocObject();
      uint64_t v52 = v147;
      *(void *)(v51 + 16) = v148;
      *(void *)(v51 + 24) = v52;
      __chkstk_darwin(v51);
      *(&v123 - 2) = v54;
      *(&v123 - 1) = v53;
      uint64_t v55 = v49;
      uint64_t v56 = v144;
      Button.init(action:label:)();
      uint64_t v57 = v136;
      BorderedProminentButtonStyle.init()();
      sub_100033E8C(&qword_10009DC68, &qword_10009DC18);
      sub_1000547AC(&qword_10009DC70, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
      uint64_t v58 = v146;
      uint64_t v59 = v138;
      View.buttonStyle<A>(_:)();
      (*(void (**)(char *, uint64_t))(v137 + 8))(v57, v59);
      (*(void (**)(char *, uint64_t))(v145 + 8))(v56, v58);
      LOBYTE(v56) = static Edge.Set.bottom.getter();
      uint64_t v61 = v129;
      uint64_t v60 = v130;
      (*(void (**)(char *, char *, uint64_t))(v129 + 16))(v25, v22, v130);
      uint64_t v62 = &v25[*(int *)(v143 + 36)];
      *uint64_t v62 = (char)v56;
      *(_OWORD *)(v62 + 8) = 0u;
      *(_OWORD *)(v62 + 24) = 0u;
      v62[40] = 1;
      (*(void (**)(char *, uint64_t))(v61 + 8))(v22, v60);
      uint64_t v63 = v131;
      sub_1000542F8((uint64_t)v25, v131, &qword_10009DC28);
      sub_10002AA34(v63, (uint64_t)v29, &qword_10009DC28);
      swift_storeEnumTagMultiPayload();
      sub_100052B0C();
      sub_100052B60();
      _ConditionalContent<>.init(storage:)();
      sub_10002AA34((uint64_t)v31, v151, &qword_10009DC40);
      swift_storeEnumTagMultiPayload();
      sub_100052A90();
      sub_100052C84();
      _ConditionalContent<>.init(storage:)();
      sub_10002F024((uint64_t)v31, &qword_10009DC40);
      sub_10002F024(v63, &qword_10009DC28);
    }
    else
    {
      uint64_t v64 = v49;
      char v65 = sub_100058D00();

      if (v65)
      {
        unint64_t v66 = v64;
        char v67 = sub_100058D00();

        uint64_t v35 = v124;
        if (v67)
        {
          *(void *)&v163[0] = sub_10002760C();
          *((void *)&v163[0] + 1) = v68;
          uint64_t v69 = swift_allocObject();
          uint64_t v70 = v147;
          *(void *)(v69 + 16) = v148;
          *(void *)(v69 + 24) = v70;
          sub_1000483D4();
          uint64_t v71 = v66;
          uint64_t v72 = v144;
          Button<>.init<A>(_:action:)();
          char v73 = static Edge.Set.all.getter();
          uint64_t v75 = v145;
          uint64_t v74 = v146;
          uint64_t v76 = (uint64_t)v141;
          (*(void (**)(char *, char *, uint64_t))(v145 + 16))(v141, v72, v146);
          uint64_t v77 = v76 + *(int *)(v140 + 36);
          *(unsigned char *)uint64_t v77 = v73;
          *(_OWORD *)(v77 + 8) = 0u;
          *(_OWORD *)(v77 + 24) = 0u;
          *(unsigned char *)(v77 + 40) = 1;
          (*(void (**)(char *, uint64_t))(v75 + 8))(v72, v74);
          char v78 = v136;
          BorderedProminentButtonStyle.init()();
          sub_1000529F0();
          sub_1000547AC(&qword_10009DC70, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
          uint64_t v79 = v125;
          uint64_t v80 = v138;
          View.buttonStyle<A>(_:)();
          (*(void (**)(char *, uint64_t))(v137 + 8))(v78, v80);
          sub_10002F024(v76, &qword_10009DC00);
          uint64_t v82 = v126;
          uint64_t v81 = v127;
          uint64_t v83 = (uint64_t)v128;
          (*(void (**)(char *, char *, uint64_t))(v126 + 32))(v128, v79, v127);
          (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v82 + 56))(v83, 0, 1, v81);
        }
        else
        {
          uint64_t v83 = (uint64_t)v128;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v126 + 56))(v128, 1, 1, v127);
        }
        long long v40 = v123;
        sub_10002AA34(v83, v134, &qword_10009DC10);
        swift_storeEnumTagMultiPayload();
        sub_100028560(&qword_10009DC50);
        sub_1000528F8();
        sub_100033E8C(&qword_10009DC78, &qword_10009DC50);
        uint64_t v122 = (uint64_t)v135;
        _ConditionalContent<>.init(storage:)();
        sub_10002AA34(v122, v151, &qword_10009DBF8);
        swift_storeEnumTagMultiPayload();
        sub_100052A90();
        sub_100052C84();
        _ConditionalContent<>.init(storage:)();
        sub_10002F024(v122, &qword_10009DBF8);
        sub_10002F024(v83, &qword_10009DC10);
        goto LABEL_4;
      }
      uint64_t v84 = static HorizontalAlignment.center.getter();
      sub_10004F85C(v148, (uint64_t)v161);
      *(_OWORD *)((char *)&v163[9] + 7) = v161[9];
      *(_OWORD *)((char *)&v163[10] + 7) = v161[10];
      *(_OWORD *)((char *)&v163[11] + 7) = v162[0];
      v163[12] = *(_OWORD *)((char *)v162 + 9);
      *(_OWORD *)((char *)&v163[5] + 7) = v161[5];
      *(_OWORD *)((char *)&v163[6] + 7) = v161[6];
      *(_OWORD *)((char *)&v163[7] + 7) = v161[7];
      *(_OWORD *)((char *)&v163[8] + 7) = v161[8];
      *(_OWORD *)((char *)&v163[1] + 7) = v161[1];
      *(_OWORD *)((char *)&v163[2] + 7) = v161[2];
      *(_OWORD *)((char *)&v163[3] + 7) = v161[3];
      *(_OWORD *)((char *)&v163[4] + 7) = v161[4];
      *(_OWORD *)((char *)v163 + 7) = v161[0];
      long long v85 = v163[8];
      uint64_t v86 = v134;
      *(_OWORD *)(v134 + 161) = v163[9];
      long long v87 = v163[11];
      *(_OWORD *)(v86 + 177) = v163[10];
      *(_OWORD *)(v86 + 193) = v87;
      *(_OWORD *)(v86 + 209) = v163[12];
      long long v88 = v163[4];
      *(_OWORD *)(v86 + 97) = v163[5];
      long long v89 = v163[7];
      *(_OWORD *)(v86 + 113) = v163[6];
      *(_OWORD *)(v86 + 129) = v89;
      *(_OWORD *)(v86 + 145) = v85;
      long long v90 = v163[0];
      *(_OWORD *)(v86 + 33) = v163[1];
      long long v91 = v163[3];
      *(_OWORD *)(v86 + 49) = v163[2];
      *(_OWORD *)(v86 + 65) = v91;
      *(_OWORD *)(v86 + 81) = v88;
      char v164 = 1;
      *(void *)uint64_t v86 = v84;
      *(void *)(v86 + 8) = 0;
      *(unsigned char *)(v86 + 16) = 1;
      *(_OWORD *)(v86 + 17) = v90;
      swift_storeEnumTagMultiPayload();
      sub_100052888((uint64_t)v161);
      sub_100028560(&qword_10009DC50);
      sub_1000528F8();
      sub_100033E8C(&qword_10009DC78, &qword_10009DC50);
      uint64_t v92 = (uint64_t)v135;
      _ConditionalContent<>.init(storage:)();
      sub_10002AA34(v92, v151, &qword_10009DBF8);
      swift_storeEnumTagMultiPayload();
      sub_100052A90();
      sub_100052C84();
      _ConditionalContent<>.init(storage:)();
      sub_10002F024(v92, &qword_10009DBF8);
      sub_100052D24((uint64_t)v161);
    }
    uint64_t v46 = v155;
    uint64_t v47 = (uint64_t)v156;
    uint64_t v48 = v160;
    long long v40 = v123;
    uint64_t v35 = v124;
    goto LABEL_12;
  }
  uint64_t v41 = swift_allocObject();
  *(void *)(v41 + 16) = v40;
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t v42 = v40;
  uint64_t v43 = (void *)EnvironmentObject.init()();
  void *v29 = v43;
  v29[1] = v44;
  v29[2] = sub_100053054;
  v29[3] = v41;
  swift_storeEnumTagMultiPayload();
  sub_100052B0C();
  sub_100052B60();
  id v45 = v43;
  swift_retain();
  _ConditionalContent<>.init(storage:)();
  sub_10002AA34((uint64_t)v31, v151, &qword_10009DC40);
  swift_storeEnumTagMultiPayload();
  sub_100052A90();
  sub_100052C84();
  _ConditionalContent<>.init(storage:)();
  sub_10002F024((uint64_t)v31, &qword_10009DC40);
  swift_release();

LABEL_4:
  uint64_t v46 = v155;
  uint64_t v47 = (uint64_t)v156;
  uint64_t v48 = v160;
LABEL_12:
  uint64_t v93 = v40;
  char v94 = sub_100058F1C();

  uint64_t v95 = 1;
  if (v94)
  {
    id v96 = v93;
    uint64_t v97 = sub_10005A770();
    uint64_t v99 = v98;

    *(void *)&v163[0] = v97;
    *((void *)&v163[0] + 1) = v99;
    uint64_t v100 = swift_allocObject();
    uint64_t v101 = v147;
    *(void *)(v100 + 16) = v148;
    *(void *)(v100 + 24) = v101;
    sub_1000483D4();
    v102 = v96;
    uint64_t v103 = v46;
    v104 = v35;
    v105 = v144;
    Button<>.init<A>(_:action:)();
    LOBYTE(v96) = static Edge.Set.bottom.getter();
    uint64_t v107 = v145;
    uint64_t v106 = v146;
    uint64_t v108 = (uint64_t)v141;
    (*(void (**)(char *, char *, uint64_t))(v145 + 16))(v141, v105, v146);
    uint64_t v109 = v108 + *(int *)(v140 + 36);
    *(unsigned char *)uint64_t v109 = (_BYTE)v96;
    *(_OWORD *)(v109 + 8) = 0u;
    *(_OWORD *)(v109 + 24) = 0u;
    *(unsigned char *)(v109 + 40) = 1;
    v110 = v105;
    uint64_t v35 = v104;
    uint64_t v46 = v103;
    (*(void (**)(char *, uint64_t))(v107 + 8))(v110, v106);
    uint64_t v111 = static Font.subheadline.getter();
    uint64_t KeyPath = swift_getKeyPath();
    uint64_t v113 = (uint64_t)v139;
    sub_10002AA34(v108, (uint64_t)v139, &qword_10009DC00);
    v114 = (uint64_t *)(v113 + *(int *)(v103 + 36));
    uint64_t *v114 = KeyPath;
    v114[1] = v111;
    sub_10002F024(v108, &qword_10009DC00);
    uint64_t v115 = v113;
    uint64_t v48 = v160;
    sub_1000542F8(v115, v47, &qword_10009DBE0);
    uint64_t v95 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v48 + 56))(v47, v95, 1, v46);
  uint64_t v116 = (uint64_t)v159;
  sub_10002AA34((uint64_t)v159, (uint64_t)v35, &qword_10009DC48);
  uint64_t v117 = v157;
  sub_10002AA34(v47, v157, &qword_10009DBE8);
  v118 = v158;
  uint64_t v119 = v154;
  uint64_t *v158 = v152;
  v118[1] = v119;
  uint64_t v120 = sub_100028560(&qword_10009DC98);
  sub_10002AA34((uint64_t)v35, (uint64_t)v118 + *(int *)(v120 + 48), &qword_10009DC48);
  sub_10002AA34(v117, (uint64_t)v118 + *(int *)(v120 + 64), &qword_10009DBE8);
  swift_bridgeObjectRetain();
  sub_10002F024(v47, &qword_10009DBE8);
  sub_10002F024(v116, &qword_10009DC48);
  sub_10002F024(v117, &qword_10009DBE8);
  sub_10002F024((uint64_t)v35, &qword_10009DC48);
  return swift_bridgeObjectRelease();
}

id *sub_10004F85C@<X0>(char *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100028560(&qword_10009D8E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v58 = type metadata accessor for Font.TextStyle();
  uint64_t v7 = *(void *)(v58 - 8);
  __chkstk_darwin(v58);
  uint64_t v9 = (char *)&v52 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v10 = *(id *)&a1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context];
  uint64_t v11 = a1;
  char v65 = sub_100056DC0(v10, (uint64_t)a1);
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  LOBYTE(v10) = v107;
  uint64_t v63 = v106;
  uint64_t v64 = v108;
  unsigned __int8 v12 = v109;
  uint64_t v61 = v111;
  uint64_t v62 = v110;
  int v60 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v21 = v11;
  sub_100058964();

  sub_10004A820();
  uint64_t v22 = sub_100048C6C();
  uint64_t v23 = nullsub_15(v22);
  uint64_t v25 = v24;
  uint64_t v59 = v23;
  uint64_t v27 = v26;
  unsigned __int8 v105 = v10;
  unsigned __int8 v103 = v12;
  unsigned __int8 v100 = 0;
  uint64_t v28 = v21;
  uint64_t v57 = sub_100059BBC();

  uint64_t v29 = v58;
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Font.TextStyle.subheadline(_:), v58);
  uint64_t v30 = type metadata accessor for Font.Design();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v6, 1, 1, v30);
  static Font.system(_:design:weight:)();
  sub_10002F024((uint64_t)v6, &qword_10009D8E0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v29);
  uint64_t v31 = Text.font(_:)();
  uint64_t v56 = v32;
  uint64_t v57 = v31;
  LOBYTE(v29) = v33;
  uint64_t v58 = v34;
  swift_bridgeObjectRelease();
  swift_release();
  int v55 = static Edge.Set.bottom.getter();
  uint64_t v35 = v28;
  sub_100059B60();

  LOBYTE(v35) = v29 & 1;
  EdgeInsets.init(_all:)();
  v69[0] = *(_DWORD *)v104;
  *(_DWORD *)((char *)v69 + 3) = *(_DWORD *)&v104[3];
  int v52 = v105;
  int v53 = v103;
  v68[0] = *(_DWORD *)v102;
  *(_DWORD *)((char *)v68 + 3) = *(_DWORD *)&v102[3];
  v67[0] = *(_DWORD *)v101;
  *(_DWORD *)((char *)v67 + 3) = *(_DWORD *)&v101[3];
  int v54 = v100;
  *(_DWORD *)((char *)v66 + 3) = *(_DWORD *)&v99[3];
  v66[0] = *(_DWORD *)v99;
  uint64_t v36 = v62;
  *(void *)&long long v70 = v65;
  *((void *)&v70 + 1) = v63;
  LOBYTE(v71) = v105;
  DWORD1(v71) = *(_DWORD *)&v104[3];
  *(_DWORD *)((char *)&v71 + 1) = *(_DWORD *)v104;
  *((void *)&v71 + 1) = v64;
  LOBYTE(v72) = v103;
  DWORD1(v72) = *(_DWORD *)&v102[3];
  *(_DWORD *)((char *)&v72 + 1) = *(_DWORD *)v102;
  uint64_t v37 = v61;
  *((void *)&v72 + 1) = v62;
  *(void *)&long long v73 = v61;
  LOBYTE(v9) = v60;
  BYTE8(v73) = v60;
  HIDWORD(v73) = *(_DWORD *)&v101[3];
  *(_DWORD *)((char *)&v73 + 9) = *(_DWORD *)v101;
  *(void *)&long long v74 = v14;
  *((void *)&v74 + 1) = v16;
  *(void *)&long long v75 = v18;
  *((void *)&v75 + 1) = v20;
  LOBYTE(v76) = v100;
  DWORD1(v76) = *(_DWORD *)&v99[3];
  *(_DWORD *)((char *)&v76 + 1) = *(_DWORD *)v99;
  *((void *)&v76 + 1) = v25;
  uint64_t v38 = v59;
  *(void *)&long long v77 = v59;
  *((void *)&v77 + 1) = v27;
  long long v39 = v70;
  long long v40 = v71;
  long long v41 = v73;
  *(_OWORD *)(a2 + 32) = v72;
  *(_OWORD *)(a2 + 48) = v41;
  *(_OWORD *)a2 = v39;
  *(_OWORD *)(a2 + 16) = v40;
  long long v42 = v74;
  long long v43 = v75;
  long long v44 = v77;
  *(_OWORD *)(a2 + 96) = v76;
  *(_OWORD *)(a2 + 112) = v44;
  *(_OWORD *)(a2 + 64) = v42;
  *(_OWORD *)(a2 + 80) = v43;
  char v79 = v29 & 1;
  char v78 = 0;
  uint64_t v46 = v56;
  uint64_t v45 = v57;
  *(void *)(a2 + 128) = v57;
  *(void *)(a2 + 136) = v46;
  *(unsigned char *)(a2 + 144) = (_BYTE)v35;
  *(void *)(a2 + 152) = v58;
  *(unsigned char *)(a2 + 160) = v55;
  *(void *)(a2 + 168) = v47;
  *(void *)(a2 + 176) = v48;
  *(void *)(a2 + 184) = v49;
  *(void *)(a2 + 192) = v50;
  *(unsigned char *)(a2 + 200) = 0;
  sub_100053114((id *)&v70);
  sub_1000528E8(v45, v46, (char)v35);
  swift_bridgeObjectRetain();
  sub_100052D84(v45, v46, (char)v35);
  swift_bridgeObjectRelease();
  v80[0] = v65;
  v80[1] = v63;
  char v81 = v52;
  *(_DWORD *)uint64_t v82 = v69[0];
  *(_DWORD *)&v82[3] = *(_DWORD *)((char *)v69 + 3);
  uint64_t v83 = v64;
  char v84 = v53;
  *(_DWORD *)long long v85 = v68[0];
  *(_DWORD *)&v85[3] = *(_DWORD *)((char *)v68 + 3);
  uint64_t v86 = v36;
  uint64_t v87 = v37;
  char v88 = (char)v9;
  *(_DWORD *)long long v89 = v67[0];
  *(_DWORD *)&v89[3] = *(_DWORD *)((char *)v67 + 3);
  uint64_t v90 = v14;
  uint64_t v91 = v16;
  uint64_t v92 = v18;
  uint64_t v93 = v20;
  char v94 = v54;
  *(_DWORD *)&v95[3] = *(_DWORD *)((char *)v66 + 3);
  *(_DWORD *)uint64_t v95 = v66[0];
  uint64_t v96 = v25;
  uint64_t v97 = v38;
  uint64_t v98 = v27;
  return sub_100053140(v80);
}

uint64_t sub_10004FDB0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v4 = *(char **)v1;
  uint64_t v3 = *(void *)(v1 + 8);
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v5 = sub_100028560(&qword_10009DBD8);
  return sub_10004E61C(v4, v3, (uint64_t *)(a1 + *(int *)(v5 + 44)));
}

uint64_t sub_10004FE0C(void *a1, void *a2)
{
  uint64_t v3 = a1[1];
  uint64_t v4 = a2[1];
  if (!v3) {
    return v4 == 0;
  }
  if (!v4) {
    return 0;
  }
  if (*a1 == *a2 && v3 == v4) {
    return 1;
  }
  else {
    return _stringCompareWithSmolCheck(_:_:expecting:)();
  }
}

void sub_10004FE58(char **a1@<X0>, uint64_t a2@<X8>)
{
  long long v23 = *((_OWORD *)a1 + 1);
  uint64_t v24 = a1[4];
  sub_10005316C(&v23, &v26);
  sub_1000542F8((uint64_t)&v24, (uint64_t)v25, &qword_10009DCA0);
  long long v19 = v23;
  *(void *)&long long v20 = v24;
  sub_100028560(&qword_10009DCA8);
  State.wrappedValue.getter();
  if (v18)
  {
    uint64_t v4 = *a1;
    if (*a1)
    {
      id v5 = [*(id *)&v4[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration] verifyPrompt];
      if (v5)
      {
        uint64_t v6 = v5;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
      uint64_t v10 = swift_allocObject();
      *(void *)(v10 + 16) = v17;
      *(void *)(v10 + 24) = v18;
      long long v11 = *((_OWORD *)a1 + 1);
      *(_OWORD *)(v10 + 32) = *(_OWORD *)a1;
      *(_OWORD *)(v10 + 48) = v11;
      *(void *)(v10 + 64) = a1[4];
      sub_1000533A0((uint64_t)&v26);
      sub_1000533CC((uint64_t)v25);
      type metadata accessor for AuthorizationViewModel();
      sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
      unsigned __int8 v12 = v4;
      id v13 = (id)EnvironmentObject.init()();
      swift_retain();
LABEL_10:
      sub_100028560(&qword_10009DCB0);
      sub_100033E8C(&qword_10009DCB8, &qword_10009DCB0);
      _ConditionalContent<>.init(storage:)();
      swift_release();

      *(_OWORD *)a2 = v19;
      *(_OWORD *)(a2 + 16) = v20;
      *(_OWORD *)(a2 + 32) = v21;
      *(unsigned char *)(a2 + 48) = v22;
      return;
    }
  }
  else
  {
    uint64_t v7 = *a1;
    if (*a1)
    {
      id v8 = [*(id *)&v7[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration] prompt];
      if (v8)
      {
        uint64_t v9 = v8;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
      uint64_t v14 = swift_allocObject();
      long long v15 = *((_OWORD *)a1 + 1);
      *(_OWORD *)(v14 + 16) = *(_OWORD *)a1;
      *(_OWORD *)(v14 + 32) = v15;
      *(void *)(v14 + 48) = a1[4];
      uint64_t v16 = v7;
      sub_1000533A0((uint64_t)&v26);
      sub_1000533CC((uint64_t)v25);
      type metadata accessor for AuthorizationViewModel();
      sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
      id v13 = (id)EnvironmentObject.init()();
      swift_retain();
      goto LABEL_10;
    }
  }
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  EnvironmentObject.error()();
  __break(1u);
}

__n128 sub_100050214@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v3 = static HorizontalAlignment.center.getter();
  sub_10004FE58(v1, (uint64_t)v8);
  char v4 = v9;
  __n128 result = (__n128)v8[0];
  long long v6 = v8[1];
  long long v7 = v8[2];
  *(void *)a1 = v3;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(_OWORD *)(a1 + 40) = v6;
  *(_OWORD *)(a1 + 56) = v7;
  *(unsigned char *)(a1 + 72) = v4;
  return result;
}

uint64_t sub_100050280@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v25 = a2;
  uint64_t v26 = a3;
  uint64_t v4 = type metadata accessor for OpacityTransition();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  id v8 = (char *)&v23 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v23 - v9;
  uint64_t v11 = sub_100028560(&qword_10009DCC0);
  uint64_t v23 = *(void *)(v11 - 8);
  uint64_t v24 = v11;
  __chkstk_darwin(v11);
  id v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Color.black.getter();
  if (a1)
  {
    id v14 = a1;
    sub_100059A98();

    uint64_t v15 = Color.opacity(_:)();
    swift_release();
    uint64_t v16 = static SafeAreaRegions.all.getter();
    char v17 = static Edge.Set.all.getter();
    OpacityTransition.init()();
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
    sub_1000547AC(&qword_10009DCC8, (void (*)(uint64_t))&type metadata accessor for OpacityTransition);
    uint64_t v18 = AnyTransition.init<A>(_:)();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    uint64_t v27 = v15;
    uint64_t v28 = v16;
    char v29 = v17;
    uint64_t v30 = v18;
    uint64_t v19 = swift_allocObject();
    uint64_t v20 = v25;
    *(void *)(v19 + 16) = a1;
    *(void *)(v19 + 24) = v20;
    id v21 = v14;
    sub_100028560(&qword_10009DCD0);
    sub_1000537F4();
    View.onTapGesture(count:perform:)();
    swift_release();
    swift_release();
    swift_release();
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v23 + 32))(v26, v13, v24);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_1000505B4@<X0>(uint64_t a1@<X8>)
{
  return sub_100050280(*(void **)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_1000505BC@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100028560(&qword_10009D8E0);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v100 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for Font.TextStyle();
  uint64_t v107 = *(void *)(v7 - 8);
  uint64_t v108 = v7;
  __chkstk_darwin(v7);
  uint64_t v106 = (char *)&v100 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v113 = sub_100028560(&qword_10009DA20);
  __chkstk_darwin(v113);
  uint64_t v114 = (uint64_t)&v100 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v110 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v110);
  v112 = (char *)&v100 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for Image.ResizingMode();
  uint64_t v12 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  id v14 = (char *)&v100 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v109 = sub_100028560(&qword_10009DD08);
  __chkstk_darwin(v109);
  uint64_t v16 = (char *)&v100 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100028560(&qword_10009DD10);
  uint64_t v115 = *(void *)(v17 - 8);
  uint64_t v116 = v17;
  __chkstk_darwin(v17);
  uint64_t v111 = (uint64_t)&v100 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100028560(&qword_10009DD18);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v118 = (uint64_t)&v100 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v23 = (char *)&v100 - v22;
  uint64_t v24 = sub_100028560(&qword_10009DD20);
  uint64_t v25 = __chkstk_darwin(v24 - 8);
  uint64_t v117 = (uint64_t)&v100 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v120 = a1;
  v121 = (uint64_t *)((char *)&v100 - v27);
  if (*a1)
  {
    id v28 = *a1;
    unsigned __int8 v29 = sub_100059F0C();

    if (v29)
    {
      uint64_t v30 = sub_100028560(&qword_10009DD30);
      (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v121, 1, 1, v30);
    }
    else
    {
      uint64_t v31 = static HorizontalAlignment.center.getter();
      uint64_t v32 = v121;
      uint64_t *v121 = v31;
      v32[1] = 0;
      *((unsigned char *)v32 + 16) = 0;
      uint64_t v33 = sub_100028560(&qword_10009DD28);
      sub_100051120(v120, (uint64_t)v32 + *(int *)(v33 + 44));
      uint64_t v34 = sub_100028560(&qword_10009DD30);
      (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v32, 0, 1, v34);
    }
    uint64_t v119 = a2;
    id v35 = v28;
    id v36 = sub_10005A03C();

    if (v36)
    {
      id v103 = v36;
      Image.init(uiImage:)();
      (*(void (**)(char *, void, uint64_t))(v12 + 104))(v14, enum case for Image.ResizingMode.stretch(_:), v11);
      uint64_t v37 = Image.resizable(capInsets:resizingMode:)();
      swift_release();
      (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
      static Alignment.center.getter();
      _FrameLayout.init(width:height:alignment:)();
      char v38 = v157;
      uint64_t v101 = v158;
      uint64_t v102 = v156[21];
      v104 = v6;
      unsigned __int8 v105 = v23;
      char v39 = v159;
      uint64_t v40 = v160;
      uint64_t v100 = v161;
      long long v41 = v112;
      long long v42 = &v112[*(int *)(v110 + 20)];
      uint64_t v43 = enum case for RoundedCornerStyle.continuous(_:);
      uint64_t v44 = type metadata accessor for RoundedCornerStyle();
      (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 104))(v42, v43, v44);
      __asm { FMOV            V0.2D, #10.0 }
      _OWORD *v41 = _Q0;
      uint64_t v50 = v114;
      sub_100054224((uint64_t)v41, v114, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
      *(_WORD *)(v50 + *(int *)(v113 + 36)) = 256;
      sub_10002AA34(v50, (uint64_t)&v16[*(int *)(v109 + 36)], &qword_10009DA20);
      uint64_t v51 = v102;
      *(void *)uint64_t v16 = v37;
      *((void *)v16 + 1) = v51;
      v16[16] = v38;
      *((void *)v16 + 3) = v101;
      v16[32] = v39;
      *((void *)v16 + 5) = v40;
      uint64_t v6 = v104;
      uint64_t v23 = v105;
      *((void *)v16 + 6) = v100;
      swift_retain();
      sub_10002F024(v50, &qword_10009DA20);
      sub_10005428C((uint64_t)v41, (uint64_t (*)(void))&type metadata accessor for RoundedRectangle);
      swift_release();
      LOBYTE(v37) = static Edge.Set.top.getter();
      EdgeInsets.init(_all:)();
      uint64_t v53 = v52;
      uint64_t v55 = v54;
      uint64_t v57 = v56;
      uint64_t v59 = v58;
      uint64_t v60 = v111;
      sub_10002AA34((uint64_t)v16, v111, &qword_10009DD08);

      uint64_t v61 = v116;
      uint64_t v62 = v60 + *(int *)(v116 + 36);
      *(unsigned char *)uint64_t v62 = v37;
      *(void *)(v62 + 8) = v53;
      *(void *)(v62 + 16) = v55;
      *(void *)(v62 + 24) = v57;
      *(void *)(v62 + 32) = v59;
      *(unsigned char *)(v62 + 40) = 0;
      sub_10002F024((uint64_t)v16, &qword_10009DD08);
      sub_1000542F8(v60, (uint64_t)v23, &qword_10009DD10);
      uint64_t v63 = 0;
    }
    else
    {
      uint64_t v63 = 1;
      uint64_t v61 = v116;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v115 + 56))(v23, v63, 1, v61);
    if (*v120)
    {
      uint64_t v64 = *v120;
      uint64_t v65 = sub_100059FA8();
      unint64_t v67 = v66;

      if (v67)
      {
        uint64_t v68 = HIBYTE(v67) & 0xF;
        if ((v67 & 0x2000000000000000) == 0) {
          uint64_t v68 = v65 & 0xFFFFFFFFFFFFLL;
        }
        if (v68)
        {
          long long v70 = v106;
          uint64_t v69 = v107;
          uint64_t v71 = v108;
          (*(void (**)(char *, void, uint64_t))(v107 + 104))(v106, enum case for Font.TextStyle.body(_:), v108);
          uint64_t v72 = type metadata accessor for Font.Design();
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v6, 1, 1, v72);
          static Font.system(_:design:weight:)();
          sub_10002F024((uint64_t)v6, &qword_10009D8E0);
          (*(void (**)(char *, uint64_t))(v69 + 8))(v70, v71);
          uint64_t v73 = Text.font(_:)();
          uint64_t v75 = v74;
          char v77 = v76;
          uint64_t v79 = v78;
          swift_bridgeObjectRelease();
          swift_release();
          uint64_t KeyPath = swift_getKeyPath();
          char v81 = static Edge.Set.vertical.getter();
          EdgeInsets.init(_all:)();
          uint64_t v83 = v82;
          uint64_t v85 = v84;
          uint64_t v87 = v86;
          uint64_t v89 = v88;
          uint64_t v90 = v23;
          char v91 = static Edge.Set.horizontal.getter();
          char v128 = v77 & 1;
          char v125 = 0;
          char v122 = 1;
          uint64_t v92 = swift_getKeyPath();
          *(_DWORD *)uint64_t v134 = *(_DWORD *)v130;
          *(_DWORD *)&v134[3] = *(_DWORD *)&v130[3];
          *(_DWORD *)uint64_t v138 = *(_DWORD *)v127;
          *(_DWORD *)&v138[3] = *(_DWORD *)&v127[3];
          *(_DWORD *)uint64_t v140 = *(_DWORD *)v126;
          *(_DWORD *)&v140[3] = *(_DWORD *)&v126[3];
          *(_DWORD *)&v146[3] = *(_DWORD *)&v124[3];
          *(_DWORD *)uint64_t v146 = *(_DWORD *)v124;
          *(_DWORD *)&v148[3] = *(_DWORD *)&v123[3];
          *(_DWORD *)v148 = *(_DWORD *)v123;
          char v129 = 0;
          v132[0] = v73;
          v132[1] = v75;
          char v133 = v128;
          uint64_t v135 = v79;
          uint64_t v136 = KeyPath;
          char v137 = 1;
          char v139 = v81;
          uint64_t v141 = v83;
          uint64_t v142 = v85;
          uint64_t v143 = v87;
          uint64_t v144 = v89;
          char v145 = v125;
          char v147 = v91;
          uint64_t v23 = v90;
          long long v150 = 0u;
          long long v149 = 0u;
          char v151 = v122;
          *(_DWORD *)uint64_t v152 = *(_DWORD *)v131;
          *(_DWORD *)&v152[3] = *(_DWORD *)&v131[3];
          uint64_t v153 = v92;
          uint64_t v154 = 5;
          char v155 = 0;
          nullsub_15(v132);
LABEL_16:
          sub_1000542F8((uint64_t)v132, (uint64_t)v156, &qword_10009DD38);
          uint64_t v93 = v121;
          uint64_t v94 = v117;
          sub_10002AA34((uint64_t)v121, v117, &qword_10009DD20);
          uint64_t v95 = v118;
          sub_10002AA34((uint64_t)v23, v118, &qword_10009DD18);
          sub_1000542F8((uint64_t)v156, (uint64_t)v130, &qword_10009DD38);
          uint64_t v96 = v119;
          sub_10002AA34(v94, v119, &qword_10009DD20);
          uint64_t v97 = sub_100028560(&qword_10009DD40);
          sub_10002AA34(v95, v96 + *(int *)(v97 + 48), &qword_10009DD18);
          uint64_t v98 = v96 + *(int *)(v97 + 64);
          sub_1000542F8((uint64_t)v130, (uint64_t)v131, &qword_10009DD38);
          sub_1000542F8((uint64_t)v131, v98, &qword_10009DD38);
          sub_10005398C((uint64_t)v131, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100053928);
          sub_10002F024((uint64_t)v23, &qword_10009DD18);
          sub_10002F024((uint64_t)v93, &qword_10009DD20);
          sub_1000542F8((uint64_t)v130, (uint64_t)v132, &qword_10009DD38);
          sub_10005398C((uint64_t)v132, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))sub_100053A00);
          sub_10002F024(v95, &qword_10009DD18);
          return sub_10002F024(v94, &qword_10009DD20);
        }
        swift_bridgeObjectRelease();
      }
      sub_100053908((uint64_t)v132);
      goto LABEL_16;
    }
  }
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100051120@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v40 = type metadata accessor for Divider();
  uint64_t v3 = *(void *)(v40 - 8);
  uint64_t v4 = __chkstk_darwin(v40);
  long long v42 = (char *)&v40 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  long long v41 = (char *)&v40 - v6;
  uint64_t v7 = sub_100028560(&qword_10009DD48);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v40 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100028560(&qword_10009DD50);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v40 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100028560(&qword_10009DD58);
  uint64_t v15 = v14 - 8;
  uint64_t v16 = __chkstk_darwin(v14);
  uint64_t v18 = (char *)&v40 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v40 - v19;
  *(void *)uint64_t v9 = static VerticalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v21 = sub_100028560(&qword_10009DD60);
  sub_1000514C4(a1, (uint64_t)&v9[*(int *)(v21 + 44)]);
  LOBYTE(a1) = static Edge.Set.horizontal.getter();
  sub_10002AA34((uint64_t)v9, (uint64_t)v13, &qword_10009DD48);
  uint64_t v22 = &v13[*(int *)(v11 + 44)];
  *uint64_t v22 = (char)a1;
  *(_OWORD *)(v22 + 8) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  v22[40] = 1;
  sub_10002F024((uint64_t)v9, &qword_10009DD48);
  LOBYTE(a1) = static Edge.Set.vertical.getter();
  EdgeInsets.init(_all:)();
  uint64_t v24 = v23;
  uint64_t v26 = v25;
  uint64_t v28 = v27;
  uint64_t v30 = v29;
  sub_10002AA34((uint64_t)v13, (uint64_t)v18, &qword_10009DD50);
  uint64_t v31 = &v18[*(int *)(v15 + 44)];
  char *v31 = (char)a1;
  *((void *)v31 + 1) = v24;
  *((void *)v31 + 2) = v26;
  *((void *)v31 + 3) = v28;
  *((void *)v31 + 4) = v30;
  v31[40] = 0;
  sub_10002F024((uint64_t)v13, &qword_10009DD50);
  sub_1000542F8((uint64_t)v18, (uint64_t)v20, &qword_10009DD58);
  uint64_t v32 = v41;
  Divider.init()();
  sub_10002AA34((uint64_t)v20, (uint64_t)v18, &qword_10009DD58);
  uint64_t v33 = *(void (**)(char *, char *, uint64_t))(v3 + 16);
  uint64_t v34 = v42;
  uint64_t v35 = v40;
  v33(v42, v32, v40);
  uint64_t v36 = v43;
  sub_10002AA34((uint64_t)v18, v43, &qword_10009DD58);
  uint64_t v37 = sub_100028560(&qword_10009DD68);
  v33((char *)(v36 + *(int *)(v37 + 48)), v34, v35);
  char v38 = *(void (**)(char *, uint64_t))(v3 + 8);
  v38(v32, v35);
  sub_10002F024((uint64_t)v20, &qword_10009DD58);
  v38(v34, v35);
  return sub_10002F024((uint64_t)v18, &qword_10009DD58);
}

uint64_t sub_1000514C4@<X0>(void **a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for Font.TextStyle();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v69 = (char *)&v60 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for AuthorizationHeaderView();
  uint64_t v62 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v63 = v8;
  uint64_t v64 = (uint64_t)&v60 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100028560(&qword_10009DC18);
  uint64_t v67 = *(void *)(v9 - 8);
  uint64_t v68 = v9;
  __chkstk_darwin(v9);
  unint64_t v66 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100028560(&qword_10009DD70);
  uint64_t v74 = *(void *)(v11 - 8);
  uint64_t v75 = v11;
  __chkstk_darwin(v11);
  uint64_t v65 = (char *)&v60 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100028560(&qword_10009DD78);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  uint64_t v76 = (uint64_t)&v60 - v17;
  uint64_t v18 = sub_100028560(&qword_10009D8E0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v60 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = *a1;
  if (*a1)
  {
    uint64_t v70 = v5;
    uint64_t v71 = v4;
    char v77 = v16;
    id v22 = v21;
    sub_100059F38();

    sub_100028560(&qword_10009DAF0);
    ScaledMetric.wrappedValue.getter();
    static Font.Weight.semibold.getter();
    uint64_t v23 = enum case for Font.Design.default(_:);
    uint64_t v24 = type metadata accessor for Font.Design();
    uint64_t v25 = a1;
    uint64_t v26 = *(void *)(v24 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v26 + 104))(v20, v23, v24);
    uint64_t v61 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
    v61(v20, 0, 1, v24);
    static Font.system(size:weight:design:)();
    sub_10002F024((uint64_t)v20, &qword_10009D8E0);
    uint64_t v73 = Text.font(_:)();
    uint64_t v28 = v27;
    int v72 = v29;
    uint64_t v31 = v30;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t v32 = (uint64_t)v25;
    if (*v25)
    {
      id v33 = *v25;
      uint64_t v34 = sub_100059F98();
      unint64_t v36 = v35;

      if (v36)
      {
        uint64_t v37 = HIBYTE(v36) & 0xF;
        if ((v36 & 0x2000000000000000) == 0) {
          uint64_t v37 = v34 & 0xFFFFFFFFFFFFLL;
        }
        if (v37)
        {
          uint64_t v78 = v34;
          unint64_t v79 = v36;
          uint64_t v38 = v64;
          sub_100054224(v32, v64, (uint64_t (*)(void))type metadata accessor for AuthorizationHeaderView);
          unint64_t v39 = (*(unsigned __int8 *)(v62 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v62 + 80);
          uint64_t v40 = swift_allocObject();
          sub_100053C28(v38, v40 + v39);
          sub_1000483D4();
          uint64_t v64 = v31;
          long long v41 = v66;
          Button<>.init<A>(_:action:)();
          uint64_t v43 = v69;
          uint64_t v42 = v70;
          uint64_t v44 = v71;
          (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Font.TextStyle.body(_:), v71);
          v61(v20, 1, 1, v24);
          uint64_t v45 = static Font.system(_:design:weight:)();
          sub_10002F024((uint64_t)v20, &qword_10009D8E0);
          (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v44);
          uint64_t KeyPath = swift_getKeyPath();
          uint64_t v48 = v67;
          uint64_t v47 = v68;
          uint64_t v49 = (uint64_t)v65;
          (*(void (**)(char *, char *, uint64_t))(v67 + 16))(v65, v41, v68);
          uint64_t v50 = v75;
          uint64_t v51 = (uint64_t *)(v49 + *(int *)(v75 + 36));
          *uint64_t v51 = KeyPath;
          v51[1] = v45;
          uint64_t v52 = v41;
          uint64_t v31 = v64;
          (*(void (**)(char *, uint64_t))(v48 + 8))(v52, v47);
          uint64_t v53 = v76;
          sub_1000542F8(v49, v76, &qword_10009DD70);
          uint64_t v54 = 0;
LABEL_10:
          (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v74 + 56))(v53, v54, 1, v50);
          char v55 = v72 & 1;
          uint64_t v56 = (uint64_t)v77;
          sub_10002AA34(v53, (uint64_t)v77, &qword_10009DD78);
          uint64_t v57 = v73;
          *(void *)a2 = v73;
          *(void *)(a2 + 8) = v28;
          *(unsigned char *)(a2 + 16) = v55;
          *(void *)(a2 + 24) = v31;
          *(void *)(a2 + 32) = 0;
          *(unsigned char *)(a2 + 40) = 1;
          uint64_t v58 = sub_100028560(&qword_10009DD80);
          sub_10002AA34(v56, a2 + *(int *)(v58 + 64), &qword_10009DD78);
          sub_1000528E8(v57, v28, v55);
          swift_bridgeObjectRetain();
          sub_10002F024(v53, &qword_10009DD78);
          sub_10002F024(v56, &qword_10009DD78);
          sub_100052D84(v57, v28, v55);
          return swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      uint64_t v54 = 1;
      uint64_t v50 = v75;
      uint64_t v53 = v76;
      goto LABEL_10;
    }
  }
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

uint64_t sub_100051C28@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = static HorizontalAlignment.center.getter();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v3 = sub_100028560(&qword_10009DD00);
  return sub_1000505BC(v1, a1 + *(int *)(v3 + 44));
}

uint64_t sub_100051C74()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051C90()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051CAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051CC8()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100051CE4@<X0>(void *a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v43 = a3;
  uint64_t v44 = a2;
  uint64_t v47 = a4;
  uint64_t v5 = sub_100028560(&qword_10009D6C0);
  __chkstk_darwin(v5 - 8);
  long long v41 = &v34[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = type metadata accessor for PasscodeEmbeddedView(0);
  __chkstk_darwin(v7 - 8);
  uint64_t v42 = &v34[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v45 = sub_100028560(&qword_10009DDD8);
  __chkstk_darwin(v45);
  uint64_t v10 = &v34[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v46 = sub_100028560(&qword_10009DDE0);
  __chkstk_darwin(v46);
  uint64_t v12 = &v34[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    id v13 = a1;
    id v39 = sub_10005A024();

    id v14 = v13;
    uint64_t v15 = sub_100059DD8();

    uint64_t v40 = LACustomPasswordTypeAlphanumeric;
    BOOL v38 = v15 == LACustomPasswordTypeAlphanumeric;
    id v16 = v14;
    uint64_t v17 = sub_10005857C();
    uint64_t v36 = v18;
    uint64_t v37 = v17;

    id v19 = v16;
    BOOL v35 = sub_10005A2C4();

    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t v20 = (void *)EnvironmentObject.projectedValue.getter();
    swift_getKeyPath();
    EnvironmentObject.Wrapper.subscript.getter();
    swift_release();

    long long v21 = v48;
    int v22 = v49;
    uint64_t v23 = (void *)EnvironmentObject.projectedValue.getter();
    swift_getKeyPath();
    uint64_t v24 = v41;
    EnvironmentObject.Wrapper.subscript.getter();

    swift_release();
    uint64_t v25 = swift_retain();
    uint64_t v33 = (uint64_t)v24;
    uint64_t v26 = v42;
    sub_10003FF98((uint64_t)v39, v38, v37, v36, v35, v21, *((uint64_t *)&v21 + 1), v22, (uint64_t)v42, v33, v44, v25);
    id v27 = v19;
    sub_100059DD8();

    static Alignment.center.getter();
    _FrameLayout.init(width:height:alignment:)();
    sub_100054224((uint64_t)v26, (uint64_t)v10, type metadata accessor for PasscodeEmbeddedView);
    uint64_t v28 = &v10[*(int *)(v45 + 36)];
    long long v29 = v49;
    *uint64_t v28 = v48;
    v28[1] = v29;
    v28[2] = v50;
    sub_10005428C((uint64_t)v26, type metadata accessor for PasscodeEmbeddedView);
    char v30 = static Edge.Set.horizontal.getter();
    sub_10002AA34((uint64_t)v10, (uint64_t)v12, &qword_10009DDD8);
    uint64_t v31 = &v12[*(int *)(v46 + 36)];
    unsigned char *v31 = v30;
    *(_OWORD *)(v31 + 8) = 0u;
    *(_OWORD *)(v31 + 24) = 0u;
    v31[40] = 1;
    sub_10002F024((uint64_t)v10, &qword_10009DDD8);
    return sub_1000542F8((uint64_t)v12, v47, &qword_10009DDE0);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_100052168@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100057B88();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100052198()
{
  return sub_100057B9C();
}

uint64_t sub_1000521C0()
{
  return sub_100057E34();
}

uint64_t sub_1000521E4(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002AA34(a1, (uint64_t)v4, &qword_10009E000);
  return sub_100057EAC((uint64_t)v4);
}

uint64_t sub_10005227C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_100028560(&qword_10009DDC8);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100051CE4(*(void **)v1, *(void *)(v1 + 16), *(void *)(v1 + 24), (uint64_t)v5);
  char v6 = static Edge.Set.bottom.getter();
  EdgeInsets.init(_all:)();
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  uint64_t v14 = v13;
  sub_10002AA34((uint64_t)v5, a1, &qword_10009DDC8);
  uint64_t v15 = a1 + *(int *)(sub_100028560(&qword_10009DDD0) + 36);
  *(unsigned char *)uint64_t v15 = v6;
  *(void *)(v15 + 8) = v8;
  *(void *)(v15 + 16) = v10;
  *(void *)(v15 + 24) = v12;
  *(void *)(v15 + 32) = v14;
  *(unsigned char *)(v15 + 40) = 0;
  return sub_10002F024((uint64_t)v5, &qword_10009DDC8);
}

double sub_100052374@<D0>(uint64_t a1@<X0>, unint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t v6 = sub_100028560(&qword_10009D8E0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Font.TextStyle();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v41 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a2) {
    goto LABEL_6;
  }
  uint64_t v13 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0) {
    uint64_t v13 = a1 & 0xFFFFFFFFFFFFLL;
  }
  if (v13)
  {
    (*(void (**)(char *, void, uint64_t))(v10 + 104))(v12, enum case for Font.TextStyle.body(_:), v9);
    uint64_t v14 = type metadata accessor for Font.Design();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
    swift_bridgeObjectRetain();
    static Font.system(_:design:weight:)();
    sub_10002F024((uint64_t)v8, &qword_10009D8E0);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    uint64_t v15 = Text.font(_:)();
    uint64_t v44 = v16;
    uint64_t v45 = v15;
    char v18 = v17;
    uint64_t v46 = v19;
    swift_bridgeObjectRelease();
    swift_release();
    uint64_t KeyPath = swift_getKeyPath();
    char v21 = static Edge.Set.bottom.getter();
    EdgeInsets.init(_all:)();
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    char v30 = static Edge.Set.horizontal.getter();
    char v54 = v18 & 1;
    char v50 = 0;
    char v47 = 1;
    uint64_t v42 = swift_getKeyPath();
    char v31 = v54;
    char v32 = v50;
    char v33 = v47;
    char v55 = 0;
    uint64_t v43 = static Color.secondary.getter();
    uint64_t v34 = swift_getKeyPath();
    *(_DWORD *)unint64_t v79 = *(_DWORD *)v56;
    *(_DWORD *)&v79[3] = *(_DWORD *)&v56[3];
    v59[0] = v45;
    v59[1] = v44;
    char v60 = v31;
    *(_DWORD *)uint64_t v61 = *(_DWORD *)v53;
    *(_DWORD *)&v61[3] = *(_DWORD *)&v53[3];
    uint64_t v62 = v46;
    uint64_t v63 = KeyPath;
    char v64 = 1;
    *(_DWORD *)&v65[3] = *(_DWORD *)&v52[3];
    *(_DWORD *)uint64_t v65 = *(_DWORD *)v52;
    char v66 = v21;
    *(_DWORD *)&v67[3] = *(_DWORD *)&v51[3];
    *(_DWORD *)uint64_t v67 = *(_DWORD *)v51;
    uint64_t v68 = v23;
    uint64_t v69 = v25;
    uint64_t v70 = v27;
    uint64_t v71 = v29;
    char v72 = v32;
    *(_DWORD *)&v73[3] = *(_DWORD *)&v49[3];
    *(_DWORD *)uint64_t v73 = *(_DWORD *)v49;
    char v74 = v30;
    *(_DWORD *)&v75[3] = *(_DWORD *)&v48[3];
    *(_DWORD *)uint64_t v75 = *(_DWORD *)v48;
    long long v77 = 0u;
    long long v76 = 0u;
    char v78 = v33;
    uint64_t v80 = v42;
    uint64_t v81 = 3;
    char v82 = v55;
    *(_DWORD *)&v83[3] = *(_DWORD *)&v57[3];
    *(_DWORD *)uint64_t v83 = *(_DWORD *)v57;
    uint64_t v84 = v34;
    uint64_t v85 = v43;
    sub_100054598((uint64_t)v59);
  }
  else
  {
LABEL_6:
    sub_1000542EC((uint64_t)v59);
  }
  sub_1000542F8((uint64_t)v59, (uint64_t)&v58, &qword_10009DDE8);
  sub_100028560(&qword_10009DDF0);
  sub_10005435C();
  _ConditionalContent<>.init(storage:)();
  long long v35 = v95;
  a3[8] = v94;
  a3[9] = v35;
  a3[10] = v96[0];
  *(_OWORD *)((char *)a3 + 169) = *(_OWORD *)((char *)v96 + 9);
  long long v36 = v91;
  a3[4] = v90;
  a3[5] = v36;
  long long v37 = v93;
  a3[6] = v92;
  a3[7] = v37;
  long long v38 = v87;
  *a3 = v86;
  a3[1] = v38;
  double result = *(double *)&v88;
  long long v40 = v89;
  a3[2] = v88;
  a3[3] = v40;
  return result;
}

double sub_10005279C@<D0>(_OWORD *a1@<X8>)
{
  return sub_100052374(*(void *)v1, *(void *)(v1 + 8), a1);
}

uint64_t sub_1000527AC()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

double sub_1000527C8@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  static Alignment.center.getter();
  _FrameLayout.init(width:height:alignment:)();
  uint64_t v4 = sub_100028560(&qword_10009DBC8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  uint64_t v5 = (_OWORD *)(a2 + *(int *)(sub_100028560(&qword_10009DBD0) + 36));
  _OWORD *v5 = v7;
  v5[1] = v8;
  double result = *(double *)&v9;
  v5[2] = v9;
  return result;
}

uint64_t sub_100052888(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  char v4 = *(unsigned char *)(a1 + 144);
  id v5 = *(id *)a1;
  sub_1000528E8(v2, v3, v4);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1000528E8(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

unint64_t sub_1000528F8()
{
  unint64_t result = qword_10009DC58;
  if (!qword_10009DC58)
  {
    sub_10002F434(&qword_10009DC10);
    sub_10002F434(&qword_10009DC00);
    type metadata accessor for BorderedProminentButtonStyle();
    sub_1000529F0();
    sub_1000547AC(&qword_10009DC70, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DC58);
  }
  return result;
}

unint64_t sub_1000529F0()
{
  unint64_t result = qword_10009DC60;
  if (!qword_10009DC60)
  {
    sub_10002F434(&qword_10009DC00);
    sub_100033E8C(&qword_10009DC68, &qword_10009DC18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DC60);
  }
  return result;
}

unint64_t sub_100052A90()
{
  unint64_t result = qword_10009DC80;
  if (!qword_10009DC80)
  {
    sub_10002F434(&qword_10009DC40);
    sub_100052B0C();
    sub_100052B60();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DC80);
  }
  return result;
}

unint64_t sub_100052B0C()
{
  unint64_t result = qword_10009F310[0];
  if (!qword_10009F310[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_10009F310);
  }
  return result;
}

unint64_t sub_100052B60()
{
  unint64_t result = qword_10009DC88;
  if (!qword_10009DC88)
  {
    sub_10002F434(&qword_10009DC28);
    sub_10002F434(&qword_10009DC18);
    type metadata accessor for BorderedProminentButtonStyle();
    sub_100033E8C(&qword_10009DC68, &qword_10009DC18);
    sub_1000547AC(&qword_10009DC70, (void (*)(uint64_t))&type metadata accessor for BorderedProminentButtonStyle);
    swift_getOpaqueTypeConformance2();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DC88);
  }
  return result;
}

unint64_t sub_100052C84()
{
  unint64_t result = qword_10009DC90;
  if (!qword_10009DC90)
  {
    sub_10002F434(&qword_10009DBF8);
    sub_1000528F8();
    sub_100033E8C(&qword_10009DC78, &qword_10009DC50);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DC90);
  }
  return result;
}

uint64_t sub_100052D24(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 128);
  uint64_t v3 = *(void *)(a1 + 136);
  char v4 = *(unsigned char *)(a1 + 144);

  sub_100052D84(v2, v3, v4);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_100052D84(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

void sub_100052D94()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v3 = v1;
    Swift::Bool canShowWhile = LACUIDTOViewController._canShowWhileLocked()();
    sub_10005D074(canShowWhile);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

void sub_100052E48()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    sub_10005CFE8();
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t sub_100052EF4()
{
  return swift_release();
}

void sub_100052F64(uint64_t a1@<X8>)
{
  id v3 = *(void **)(v1 + 16);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_100059FA4();
    uint64_t v7 = v6;

    *(void *)a1 = v5;
    *(void *)(a1 + 8) = v7;
    *(unsigned char *)(a1 + 16) = 0;
    *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

uint64_t sub_10005301C()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_100053054(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  return sub_10005CCC4(a1, a2, a3, a4);
}

void sub_100053078()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = v1;
    sub_100057540();
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

id *sub_100053114(id *a1)
{
  id v2 = *a1;
  return a1;
}

id *sub_100053140(id *a1)
{
  return a1;
}

_OWORD *sub_10005316C(_OWORD *a1, _OWORD *a2)
{
  *a2 = *a1;
  return a2;
}

uint64_t sub_10005317C()
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

void sub_1000531CC(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  BOOL v9 = *(void *)(v4 + 16) == a1 && *(void *)(v4 + 24) == a2;
  if (v9 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
  {
    uint64_t v10 = *(void **)(v4 + 32);
    if (v10)
    {
      long long v14 = *(_OWORD *)(v4 + 48);
      uint64_t v15 = *(void *)(v4 + 64);
      sub_10005316C(&v14, &v17);
      sub_1000542F8((uint64_t)&v15, (uint64_t)v16, &qword_10009DCA0);
      uint64_t v11 = swift_allocObject();
      long long v12 = *(_OWORD *)(v4 + 48);
      *(_OWORD *)(v11 + 16) = *(_OWORD *)(v4 + 32);
      *(_OWORD *)(v11 + 32) = v12;
      *(void *)(v11 + 48) = *(void *)(v4 + 64);
      *(void *)(v11 + 56) = a3;
      *(void *)(v11 + 64) = a4;
      id v13 = v10;
      sub_1000533A0((uint64_t)&v17);
      sub_1000533CC((uint64_t)v16);
      swift_retain();
      sub_10005CCC4(a1, a2, (void (*)(void))sub_1000535DC, v11);
      swift_release();
    }
    else
    {
      type metadata accessor for AuthorizationViewModel();
      sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
      EnvironmentObject.error()();
      __break(1u);
    }
  }
  else
  {
    long long v14 = *(_OWORD *)(v4 + 48);
    uint64_t v15 = *(void *)(v4 + 64);
    long long v17 = 0uLL;
    sub_100028560(&qword_10009DCA8);
    State.wrappedValue.setter();
    a3(0);
  }
}

uint64_t sub_1000533A0(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000533CC(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000533F8()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100053440(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = *(void **)(v3 + 16);
  if (v4)
  {
    id v6 = v4;
    id v7 = sub_10005A024();

    if ((uint64_t)v7 <= 0
      || (v8 = String.count.getter(), id v9 = v6, v10 = sub_10005A024(), v9, (id)v8 == v10))
    {
      swift_bridgeObjectRetain();
      sub_100028560(&qword_10009DCA8);
      State.wrappedValue.setter();
      uint64_t v11 = 1;
    }
    else
    {
      uint64_t v11 = 0;
    }
    return a3(v11);
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    uint64_t result = EnvironmentObject.error()();
    __break(1u);
  }
  return result;
}

uint64_t sub_10005358C()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_1000535DC(char a1)
{
  id v2 = *(uint64_t (**)(uint64_t))(v1 + 56);
  if ((a1 & 1) == 0)
  {
    sub_100028560(&qword_10009DCA8);
    State.wrappedValue.setter();
    uint64_t v7 = 0;
    return v2(v7);
  }
  uint64_t v3 = *(void **)(v1 + 16);
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = sub_10003F308();
    sub_10005C258(0, (uint64_t (*)(uint64_t))v5, v6);
    swift_release();

    uint64_t v7 = 1;
    return v2(v7);
  }
  type metadata accessor for AuthorizationViewModel();
  sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
  uint64_t result = EnvironmentObject.error()();
  __break(1u);
  return result;
}

void sub_1000536EC()
{
  uint64_t v1 = *(void **)(v0 + 16);
  if (v1)
  {
    id v2 = self;
    id v6 = v1;
    id v3 = [v2 errorWithCode:-2];
    id v4 = sub_10003F308();
    sub_10005C258((uint64_t)v3, (uint64_t (*)(uint64_t))v4, v5);
    swift_release();
  }
  else
  {
    type metadata accessor for AuthorizationViewModel();
    sub_1000547AC((unint64_t *)&qword_10009D6A8, (void (*)(uint64_t))type metadata accessor for AuthorizationViewModel);
    EnvironmentObject.error()();
    __break(1u);
  }
}

unint64_t sub_1000537F4()
{
  unint64_t result = qword_10009DCD8;
  if (!qword_10009DCD8)
  {
    sub_10002F434(&qword_10009DCD0);
    sub_100053894();
    sub_100033E8C(&qword_10009DCF0, &qword_10009DCF8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DCD8);
  }
  return result;
}

unint64_t sub_100053894()
{
  unint64_t result = qword_10009DCE0;
  if (!qword_10009DCE0)
  {
    sub_10002F434(&qword_10009DCE8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DCE0);
  }
  return result;
}

double sub_100053908(uint64_t a1)
{
  *(unsigned char *)(a1 + 160) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

uint64_t sub_100053928(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1000528E8(result, a2, a3 & 1);
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10005398C(uint64_t a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, char))
{
  char v4 = *(unsigned char *)(a1 + 160);
  a2(*(void *)a1, *(void *)(a1 + 8), *(void *)(a1 + 16), *(void *)(a1 + 24), *(void *)(a1 + 32), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80), *(void *)(a1 + 88), *(void *)(a1 + 96), *(void *)(a1 + 104), *(void *)(a1 + 112), *(void *)(a1 + 120), *(void *)(a1 + 128), *(void *)(a1 + 136), *(void *)(a1 + 144),
    *(void *)(a1 + 152),
    v4);
  return a1;
}

uint64_t sub_100053A00(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100052D84(result, a2, a3 & 1);
    swift_release();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_100053A64@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100053A90()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100053AB8@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = EnvironmentValues.lineLimit.getter();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100053AEC()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_100053B1C()
{
  uint64_t v1 = type metadata accessor for AuthorizationHeaderView();
  uint64_t v2 = *(unsigned __int8 *)(*(void *)(v1 - 8) + 80);
  uint64_t v3 = (v2 + 16) & ~v2;
  uint64_t v4 = *(void *)(*(void *)(v1 - 8) + 64);

  if (*(void *)(v0 + v3 + 16)) {
    swift_release();
  }
  uint64_t v5 = v0 + v3 + *(int *)(v1 + 24);
  uint64_t v6 = sub_100028560(&qword_10009DAF0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);

  return _swift_deallocObject(v0, v3 + v4, v2 | 7);
}

uint64_t sub_100053C28(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for AuthorizationHeaderView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100053C8C()
{
  uint64_t v1 = type metadata accessor for AuthorizationHeaderView();
  uint64_t v3 = *(void *)(v1 - 8);
  uint64_t result = v1 - 8;
  uint64_t v4 = *(uint64_t (**)(void))(v0
                           + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80))
                           + 16);
  if (v4) {
    return v4();
  }
  return result;
}

uint64_t destroy for AuthorizationPasscodeView(id *a1)
{
  return swift_release();
}

void *initializeWithCopy for AuthorizationPasscodeView(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *a1 = *(void *)a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a2 + 24);
  a1[2] = *(void *)(a2 + 16);
  a1[3] = v5;
  id v6 = v3;
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for AuthorizationPasscodeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  uint64_t v5 = *(void **)a2;
  *(void *)a1 = *(void *)a2;
  id v6 = v5;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  uint64_t v7 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v7;
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for AuthorizationPasscodeView(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t assignWithTake for AuthorizationPasscodeView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationPasscodeView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 32)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationPasscodeView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 16) = 0;
    *(void *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 32) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 16) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 32) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationPasscodeView()
{
  return &type metadata for AuthorizationPasscodeView;
}

void *initializeBufferWithCopyOfBuffer for AuthorizationPromptView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for AuthorizationPromptView()
{
  return swift_bridgeObjectRelease();
}

void *_s10CoreAuthUI40AuthorizationRegisterPasswordContentViewV4ModeOwca_0(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for AuthorizationPromptView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for AuthorizationPromptView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for AuthorizationPromptView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    *(void *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 16) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthorizationPromptView()
{
  return &type metadata for AuthorizationPromptView;
}

unint64_t sub_10005403C()
{
  unint64_t result = qword_10009DD88;
  if (!qword_10009DD88)
  {
    sub_10002F434(&qword_10009DBD0);
    sub_100033E8C(&qword_10009DD90, &qword_10009DBC8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DD88);
  }
  return result;
}

uint64_t sub_1000540DC()
{
  return sub_100033E8C(&qword_10009DD98, &qword_10009DDA0);
}

uint64_t sub_100054118()
{
  return sub_100033E8C(&qword_10009DDA8, &qword_10009DDB0);
}

uint64_t sub_100054154()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1000541B0()
{
  return sub_100033E8C(&qword_10009DDB8, &qword_10009DDC0);
}

uint64_t sub_1000541EC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100054208()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_100054224(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10005428C(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000542EC(uint64_t result)
{
  *(unsigned char *)(result + 184) = 1;
  return result;
}

uint64_t sub_1000542F8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100028560(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_10005435C()
{
  unint64_t result = qword_10009DDF8;
  if (!qword_10009DDF8)
  {
    sub_10002F434(&qword_10009DDF0);
    sub_1000543FC();
    sub_100033E8C(&qword_10009DE60, &qword_10009DE68);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DDF8);
  }
  return result;
}

unint64_t sub_1000543FC()
{
  unint64_t result = qword_10009DE00;
  if (!qword_10009DE00)
  {
    sub_10002F434(&qword_10009DE08);
    sub_100054684(&qword_10009DE10, &qword_10009DE18, (void (*)(void))sub_1000544C8);
    sub_100033E8C(&qword_10009DE50, &qword_10009DE58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DE00);
  }
  return result;
}

uint64_t sub_1000544C8()
{
  return sub_100054684(&qword_10009DE20, &qword_10009DE28, (void (*)(void))sub_1000544F8);
}

unint64_t sub_1000544F8()
{
  unint64_t result = qword_10009DE30;
  if (!qword_10009DE30)
  {
    sub_10002F434(&qword_10009DE38);
    sub_100033E8C(&qword_10009DE40, &qword_10009DE48);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DE30);
  }
  return result;
}

uint64_t sub_100054598(uint64_t result)
{
  *(unsigned char *)(result + 184) = 0;
  return result;
}

uint64_t sub_1000545A0()
{
  return sub_100054684(&qword_10009DE70, &qword_10009DDD0, (void (*)(void))sub_1000545E4);
}

unint64_t sub_1000545E4()
{
  unint64_t result = qword_10009DE78;
  if (!qword_10009DE78)
  {
    sub_10002F434(&qword_10009DDC8);
    sub_100054684(&qword_10009DE80, &qword_10009DDE0, (void (*)(void))sub_100054700);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DE78);
  }
  return result;
}

uint64_t sub_100054684(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002F434(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100054700()
{
  unint64_t result = qword_10009DE88;
  if (!qword_10009DE88)
  {
    sub_10002F434(&qword_10009DDD8);
    sub_1000547AC(&qword_10009D6F8, (void (*)(uint64_t))type metadata accessor for PasscodeEmbeddedView);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DE88);
  }
  return result;
}

uint64_t sub_1000547AC(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_1000547F8()
{
  unint64_t result = qword_10009DE90;
  if (!qword_10009DE90)
  {
    sub_10002F434(&qword_10009DE98);
    sub_10005435C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DE90);
  }
  return result;
}

uint64_t sub_1000548B4()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000565A0(v0, qword_10009F458);
  sub_100055434(v0, (uint64_t)qword_10009F458);
  sub_100048C74();
  return sub_100048C8C();
}

void sub_10005490C()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  if ([self isSharedIPad])
  {
    id v1 = [objc_allocWithZone((Class)LALocalBackoffCounter) init];
    [v0 setBackoffCounter:v1];
  }
}

void sub_100054A40(char a1)
{
  objc_super v2 = v1;
  v74.receiver = v2;
  v74.super_class = (Class)swift_getObjectType();
  [super viewDidAppear:a1 & 1];
  id v4 = [v2 backoffCounter];
  if (!v4)
  {
    if (qword_10009F450 != -1) {
      swift_once();
    }
    uint64_t v18 = type metadata accessor for Logger();
    sub_100055434(v18, (uint64_t)qword_10009F458);
    uint64_t v19 = Logger.logObject.getter();
    os_log_type_t v20 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v19, v20))
    {
      char v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)char v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Backoff counter cannot be nil!", v21, 2u);
      swift_slowDealloc();
    }
    goto LABEL_46;
  }
  id v5 = v4;
  id v6 = [v2 cachedExternalizedContext];
  if (!v6)
  {
    __break(1u);
    goto LABEL_48;
  }
  uint64_t v7 = v6;
  id v8 = [v6 externalizedContext];

  if (!v8)
  {
LABEL_48:
    __break(1u);
    goto LABEL_49;
  }
  uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;

  id v12 = [v2 internalInfo];
  if (!v12)
  {
LABEL_49:
    __break(1u);
LABEL_50:
    __break(1u);
    goto LABEL_51;
  }
  id v13 = v12;
  uint64_t v14 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  *(void *)&long long v76 = 0x644972657355;
  *((void *)&v76 + 1) = 0xE600000000000000;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v14 + 16) && (unint64_t v15 = sub_10002A9F0((uint64_t)&aBlock), (v16 & 1) != 0))
  {
    sub_10002B158(*(void *)(v14 + 56) + 32 * v15, (uint64_t)&v76);
  }
  else
  {
    long long v76 = 0u;
    long long v77 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&aBlock);
  id v66 = v5;
  if (*((void *)&v77 + 1))
  {
    sub_1000285F8();
    if (swift_dynamicCast()) {
      uint64_t v17 = v75;
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v76);
    uint64_t v17 = 0;
  }
  id v22 = [v2 policy];
  id v23 = [v2 options];
  if (!v23) {
    goto LABEL_50;
  }
  uint64_t v24 = v23;
  uint64_t v25 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v26 = (objc_class *)type metadata accessor for PasscodeAlertViewController();
  uint64_t v27 = (char *)objc_allocWithZone(v26);
  *(void *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate
                + 8] = 0;
  swift_unknownObjectWeakInit();
  uint64_t v28 = (uint64_t *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext];
  *uint64_t v28 = v9;
  v28[1] = v11;
  *(void *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_userId] = v17;
  *(void *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_policy] = v22;
  *(void *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_options] = v25;
  *(void *)&v27[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_backoffCounter] = v66;
  v73.receiver = v27;
  v73.super_class = v26;
  swift_unknownObjectRetain();
  id v29 = [super initWithNibName:0 bundle:0];
  swift_getObjectType();
  id v30 = [v2 options];
  if (!v30)
  {
LABEL_51:
    __break(1u);
LABEL_52:
    __break(1u);
    goto LABEL_53;
  }
  char v31 = v30;
  uint64_t v32 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v75) = 1037;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v32 + 16) && (unint64_t v33 = sub_10002A9F0((uint64_t)&aBlock), (v34 & 1) != 0))
  {
    sub_10002B158(*(void *)(v32 + 56) + 32 * v33, (uint64_t)&v76);
  }
  else
  {
    long long v76 = 0u;
    long long v77 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&aBlock);
  if (*((void *)&v77 + 1))
  {
    if (swift_dynamicCast()) {
      goto LABEL_45;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v76);
  }
  if (objc_msgSend(self, "isApplePayPolicy:", objc_msgSend(v2, "policy"))) {
    goto LABEL_29;
  }
  id v39 = [v2 options];
  if (!v39) {
    goto LABEL_52;
  }
  long long v40 = v39;
  uint64_t v41 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v75) = 1053;
  AnyHashable.init<A>(_:)();
  if (*(void *)(v41 + 16) && (unint64_t v42 = sub_10002A9F0((uint64_t)&aBlock), (v43 & 1) != 0))
  {
    sub_10002B158(*(void *)(v41 + 56) + 32 * v42, (uint64_t)&v76);
  }
  else
  {
    long long v76 = 0u;
    long long v77 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_10002AC8C((uint64_t)&aBlock);
  if (*((void *)&v77 + 1))
  {
    if ((swift_dynamicCast() & 1) != 0 && v75 == 1)
    {
LABEL_29:
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v36 = [self bundleForClass:ObjCClassFromMetadata];
      unint64_t v65 = 0xE000000000000000;
      unint64_t v37 = 5849424;
      unint64_t v38 = 0xE300000000000000;
LABEL_42:
      v46.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
      v46.value._object = (void *)0xE800000000000000;
      v47._uint64_t countAndFlagsBits = 0;
      v47._object = (void *)0xE000000000000000;
      uint64_t v48 = 0;
      NSLocalizedString(_:tableName:bundle:value:comment:)(*(Swift::String *)&v37, v46, (NSBundle)v36, v47, *(Swift::String *)(&v65 - 1));

LABEL_45:
      NSString v54 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      [v29 setTitle:v54];

      uint64_t v19 = v29;
      id v55 = [v2 callerName];
      [v19 setMessage:v55];

      [v19 setPreferredStyle:1];
      *(Class *)((char *)&v19[1].isa
               + OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate) = (Class)&off_100088760;
      swift_unknownObjectWeakAssign();
      uint64_t v56 = swift_getObjCClassFromMetadata();
      id v57 = [self bundleForClass:v56];
      v78._object = (void *)0xE000000000000000;
      v58._uint64_t countAndFlagsBits = 0x4C45434E4143;
      v58._object = (void *)0xE600000000000000;
      v59.value._uint64_t countAndFlagsBits = 0x4955656C69626F4DLL;
      v59.value._object = (void *)0xE800000000000000;
      v60._uint64_t countAndFlagsBits = 0;
      v60._object = (void *)0xE000000000000000;
      v78._uint64_t countAndFlagsBits = 0;
      NSLocalizedString(_:tableName:bundle:value:comment:)(v58, v59, (NSBundle)v57, v60, v78);

      NSString v61 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
      uint64_t v62 = swift_allocObject();
      swift_unknownObjectWeakInit();
      uint64_t v71 = sub_1000563BC;
      uint64_t v72 = v62;
      objc_super aBlock = _NSConcreteStackBlock;
      uint64_t v68 = 1107296256;
      uint64_t v69 = sub_100029A40;
      uint64_t v70 = &unk_100088698;
      uint64_t v63 = _Block_copy(&aBlock);
      swift_release();
      uint64_t v71 = sub_100029838;
      uint64_t v72 = 0;
      objc_super aBlock = _NSConcreteStackBlock;
      uint64_t v68 = 1107296256;
      uint64_t v69 = sub_100046844;
      uint64_t v70 = &unk_1000886C0;
      char v64 = _Block_copy(&aBlock);
      [v19 _addActionWithTitle:v61 style:1 handler:v63 shouldDismissHandler:v64];
      _Block_release(v64);
      _Block_release(v63);

      [v2 presentViewController:v19 animated:1 completion:0];
      swift_unknownObjectRelease();
LABEL_46:

      return;
    }
  }
  else
  {
    sub_10002A660((uint64_t)&v76);
  }
  id v44 = [v2 policy];
  uint64_t v45 = swift_getObjCClassFromMetadata();
  id v36 = [self bundleForClass:v45];
  if (v44 == (id)1010)
  {
    unint64_t v65 = 0xE000000000000000;
    unint64_t v38 = 0x800000010007ACF0;
    unint64_t v37 = 0xD000000000000015;
    goto LABEL_42;
  }
  long long v49 = self;
  NSString v50 = String._bridgeToObjectiveC()();
  id v51 = [v49 modelSpecificLocalizedStringKeyForKey:v50];

  if (v51)
  {
    NSString v52 = String._bridgeToObjectiveC()();
    id v53 = [v36 localizedStringForKey:v51 value:0 table:v52];

    static String._unconditionallyBridgeFromObjectiveC(_:)();
    goto LABEL_45;
  }
LABEL_53:
  __break(1u);
}

uint64_t sub_100055434(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

void sub_1000554C0(uint64_t a1, void *a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v6 = [v2 presentedViewController];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = (void *)swift_allocObject();
    v8[2] = v2;
    _OWORD v8[3] = a1;
    v8[4] = a2;
    char v16 = sub_100056478;
    uint64_t v17 = v8;
    id v12 = _NSConcreteStackBlock;
    uint64_t v13 = 1107296256;
    uint64_t v14 = sub_100029A40;
    unint64_t v15 = &unk_100088738;
    uint64_t v9 = _Block_copy(&v12);
    id v10 = v2;
    sub_100029A94(a1);
    swift_release();
    [v7 dismissViewControllerAnimated:0 completion:v9];
    _Block_release(v9);
  }
  else
  {
    if (a1)
    {
      char v16 = (void (*)())a1;
      uint64_t v17 = a2;
      id v12 = _NSConcreteStackBlock;
      uint64_t v13 = 1107296256;
      uint64_t v14 = sub_100029A40;
      unint64_t v15 = &unk_1000886E8;
      uint64_t v11 = _Block_copy(&v12);
      swift_retain();
      swift_release();
    }
    else
    {
      uint64_t v11 = 0;
    }
    v18.receiver = v2;
    v18.super_class = ObjectType;
    [super dismissChildWithCompletionHandler:v11];
    _Block_release(v11);
  }
}

id sub_100055738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  v14.receiver = v5;
  v14.super_class = ObjectType;
  id v12 = [super initWithInternalInfo:isa mechanism:a2 backoffCounter:a3 remoteUIHost:a4 allowsLandscape:a5 & 1];

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v12;
}

id sub_10005592C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (a2)
  {
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = [super initWithNibName:v7 bundle:a3];

  return v8;
}

id sub_100055A74(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id sub_100055B10(uint64_t a1, void *a2)
{
  if (!a1)
  {
    v4.super.Class isa = 0;
    uint64_t v5 = a2[3];
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v10 = 0;
    goto LABEL_6;
  }
  v4.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  if (!v5) {
    goto LABEL_5;
  }
LABEL_3:
  id v6 = sub_10002A3A8(a2, v5);
  uint64_t v7 = *(void *)(v5 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  uint64_t v10 = _bridgeAnythingToObjectiveC<A>(_:)();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  sub_10002A3EC((uint64_t)a2);
LABEL_6:
  id v11 = [objc_allocWithZone(v2) initWithInternalInfo:v4.super.isa parent:v10];

  swift_unknownObjectRelease();
  return v11;
}

id sub_100055C9C(uint64_t a1, uint64_t a2)
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  if (a1)
  {
    v6.super.Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.Class isa = 0;
  }
  sub_100039990(a2, (uint64_t)v17);
  uint64_t v7 = v18;
  if (v18)
  {
    uint64_t v8 = sub_10002A3A8(v17, v18);
    uint64_t v9 = *(void *)(v7 - 8);
    __chkstk_darwin(v8);
    id v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v9 + 16))(v11);
    uint64_t v12 = _bridgeAnythingToObjectiveC<A>(_:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v7);
    sub_10002A3EC((uint64_t)v17);
  }
  else
  {
    uint64_t v12 = 0;
  }
  v16.receiver = v2;
  v16.super_class = ObjectType;
  id v13 = [super initWithInternalInfo:v6.super.isa parent:v12];

  swift_unknownObjectRelease();
  id v14 = v13;
  sub_10002A660(a2);
  if (v14) {

  }
  return v14;
}

id sub_100055F04()
{
  id result = [v0 mechanism];
  if (result)
  {
    [result uiEvent:9 options:0];
    return (id)swift_unknownObjectRelease();
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_100055F6C()
{
  id v1 = [v0 mechanism];
  if (v1)
  {
    [v1 uiEvent:8 options:0];
    swift_unknownObjectRelease();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    [v0 uiSuccessWithResult:isa];
  }
  else
  {
    __break(1u);
  }
}

void sub_100056030()
{
  id v1 = (id)_convertErrorToNSError(_:)();
  [v0 uiFailureWithError:v1];
}

void sub_100056104()
{
  id v1 = v0;
  v13.receiver = v0;
  v13.super_class = (Class)swift_getObjectType();
  [super viewDidLoad];
  type metadata accessor for PasscodeAlertContentViewController();
  uint64_t v2 = *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext];
  unint64_t v3 = *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext
                    + 8];
  NSDictionary v4 = *(void **)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_userId];
  uint64_t v5 = *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_policy];
  uint64_t v6 = *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_options];
  uint64_t v7 = *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_backoffCounter];
  sub_10002E5EC(*(void *)&v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext], *(void *)&v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_externalizedContext+ 8]);
  id v8 = v4;
  swift_bridgeObjectRetain();
  swift_unknownObjectRetain();
  uint64_t v9 = (char *)sub_10002CD08(v2, v3, v4, v5, v6, v7);
  uint64_t v10 = &v1[OBJC_IVAR____TtC10CoreAuthUIP33_591C72486BB2C16BB16487A2DB3BF7FA27PasscodeAlertViewController_delegate];
  swift_unknownObjectWeakLoadStrong();
  uint64_t v11 = *((void *)v10 + 1);
  uint64_t v12 = &v9[OBJC_IVAR____TtC10CoreAuthUI34PasscodeAlertContentViewController_delegate];
  swift_beginAccess();
  *((void *)v12 + 1) = v11;
  swift_unknownObjectWeakAssign();
  swift_unknownObjectRelease();
  [v1 setContentViewController:v9];
}

uint64_t type metadata accessor for PasscodeAlertViewController()
{
  return self;
}

uint64_t sub_100056384()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000563BC()
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = Strong;
    [Strong uiCancel];
  }
}

uint64_t sub_100056418(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100056428()
{
  return swift_release();
}

uint64_t sub_100056430()
{
  if (*(void *)(v0 + 24)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 40, 7);
}

void sub_100056478()
{
  uint64_t v2 = (void *)v0[2];
  uint64_t v1 = v0[3];
  if (v1)
  {
    uint64_t v3 = v0[4];
    uint64_t v9 = v1;
    uint64_t v10 = v3;
    v6.receiver = _NSConcreteStackBlock;
    v6.super_class = (Class)1107296256;
    uint64_t v7 = sub_100029A40;
    id v8 = &unk_1000887B0;
    NSDictionary v4 = _Block_copy(&v6);
    swift_retain();
    swift_release();
  }
  else
  {
    NSDictionary v4 = 0;
  }
  uint64_t v5 = (objc_class *)type metadata accessor for ComplementaryPasscodeViewController();
  v6.receiver = v2;
  v6.super_class = v5;
  [super dismissChildWithCompletionHandler:v4];
  _Block_release(v4);
}

uint64_t type metadata accessor for ComplementaryPasscodeViewController()
{
  return self;
}

uint64_t sub_100056568()
{
  _Block_release(*(const void **)(v0 + 16));

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t *sub_1000565A0(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_100056624()
{
  uint64_t v0 = type metadata accessor for Logger();
  sub_1000565A0(v0, qword_10009F578);
  sub_100055434(v0, (uint64_t)qword_10009F578);
  sub_100048C6C();
  return sub_100048C8C();
}

id sub_10005676C()
{
  *(void *)&v0[OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super init];
}

id sub_1000567F8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  return [super dealloc];
}

void sub_10005683C(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v6 = [self sharedInstance];
  unsigned int v7 = [v6 usesFrontBoardServicesForRemoteUI];

  if (v7)
  {
    if (qword_10009F570 != -1) {
      swift_once();
    }
    uint64_t v8 = type metadata accessor for Logger();
    sub_100055434(v8, (uint64_t)qword_10009F578);
    id v9 = a2;
    uint64_t v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v30 = swift_slowAlloc();
      *(_DWORD *)uint64_t v12 = 136315138;
      id v13 = [v9 persistentIdentifier];
      uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v16 = v15;

      sub_10002E644(v14, v16, &v30);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Will connect to scene: %s", v12, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    self;
    uint64_t v17 = swift_dynamicCastObjCClass();
    if (v17)
    {
      uint64_t v18 = v17;
      id v19 = objc_allocWithZone((Class)UIWindow);
      id v20 = a1;
      id v21 = [v19 initWithWindowScene:v18];
      uint64_t v22 = OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window;
      id v23 = *(void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window);
      *(void *)(v3 + OBJC_IVAR____TtC10CoreAuthUI13SceneDelegate_window) = v21;

      uint64_t v24 = *(void **)(v3 + v22);
      if (v24)
      {
        id v25 = objc_allocWithZone((Class)TransitionViewController);
        id v26 = v24;
        id v27 = [v25 init];
        [v26 setRootViewController:v27];

        uint64_t v28 = *(void **)(v3 + v22);
      }
      else
      {
        uint64_t v28 = 0;
      }
      id v29 = v28;
      [v29 makeKeyAndVisible];
    }
  }
}

void sub_100056B38(void *a1)
{
  id v2 = [self sharedInstance];
  unsigned int v3 = [v2 usesFrontBoardServicesForRemoteUI];

  if (v3)
  {
    if (qword_10009F570 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_100055434(v4, (uint64_t)qword_10009F578);
    id v13 = a1;
    uint64_t v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v5, v6))
    {
      unsigned int v7 = (uint8_t *)swift_slowAlloc();
      uint64_t v14 = swift_slowAlloc();
      *(_DWORD *)unsigned int v7 = 136315138;
      id v8 = [v13 session];
      id v9 = [v8 persistentIdentifier];

      uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v12 = v11;

      sub_10002E644(v10, v12, &v14);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Did disconnect from scene: %s", v7, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
  }
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

char *sub_100056DC0(void *a1, uint64_t a2)
{
  id v4 = objc_allocWithZone((Class)type metadata accessor for AuthenticationParentView());
  return sub_100056FB0(a1, a2);
}

char *sub_100056E00(void *a1, uint64_t a2)
{
  id v5 = objc_allocWithZone(v2);
  return sub_100056FB0(a1, a2);
}

uint64_t type metadata accessor for AuthenticationParentView()
{
  return self;
}

uint64_t sub_100056E7C()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t sub_100056EC0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10005728C();

  return static UIViewRepresentable._makeView(view:inputs:)(a1, a2, a3, v6);
}

uint64_t sub_100056F24(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v6 = sub_10005728C();

  return static UIViewRepresentable._makeViewList(view:inputs:)(a1, a2, a3, v6);
}

void sub_100056F88()
{
}

char *sub_100056FB0(void *a1, uint64_t a2)
{
  unsigned int v3 = v2;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v7 = objc_allocWithZone((Class)LAUIAuthenticationView);
  id v8 = v3;
  id v9 = [v7 initWithFrame:4, a1, 0.0, 0.0, 50.0, 50.0];
  *(void *)&v8[OBJC_IVAR____TtC10CoreAuthUI24AuthenticationParentView_authenticationView] = v9;
  [v9 setStyle:1];
  id v10 = v9;
  [v10 setDelegate:a2];

  v16.receiver = v8;
  v16.super_class = ObjectType;
  unint64_t v11 = [(char *)[super initWithFrame:0.0, 0.0, 0.0, 0.0]];
  unint64_t v12 = *(void **)&v11[OBJC_IVAR____TtC10CoreAuthUI24AuthenticationParentView_authenticationView];
  id v13 = v11;
  id v14 = v12;
  [v13 addSubview:v14];

  swift_unknownObjectRelease();
  return v13;
}

void sub_1000570FC()
{
}

void sub_1000571B4()
{
}

unint64_t sub_100057228()
{
  unint64_t result = qword_10009DFB8;
  if (!qword_10009DFB8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DFB8);
  }
  return result;
}

ValueMetadata *type metadata accessor for AuthenticationView()
{
  return &type metadata for AuthenticationView;
}

unint64_t sub_10005728C()
{
  unint64_t result = qword_10009DFE8;
  if (!qword_10009DFE8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10009DFE8);
  }
  return result;
}

uint64_t sub_1000572E0()
{
  return sub_100058F30();
}

uint64_t sub_1000572F4@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_100057308(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_10005731C()
{
  return sub_1000590C0();
}

uint64_t (*sub_100057330(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_1000573C0()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView, &qword_10009DFF0);
}

uint64_t sub_1000573D4(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView, &qword_10009DFF0);
}

uint64_t (*sub_1000573F0(void *a1))()
{
  unsigned int v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100057504()
{
  return sub_100058F30();
}

uint64_t sub_100057518@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_10005752C(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_100057540()
{
  return sub_1000590C0();
}

uint64_t (*sub_100057554(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_1000575E0()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton, &qword_10009DFF0);
}

uint64_t sub_1000575F4(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton, &qword_10009DFF0);
}

uint64_t (*sub_100057610(void *a1))()
{
  unsigned int v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100057720()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100057750()
{
  return sub_100058F30();
}

uint64_t sub_100057764@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_100057778(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_10005778C()
{
  return sub_1000590C0();
}

uint64_t (*sub_1000577A0(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_10005782C()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView, &qword_10009DFF0);
}

uint64_t sub_100057840(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView, &qword_10009DFF0);
}

uint64_t (*sub_10005785C(void *a1))()
{
  unsigned int v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_10005796C()
{
  return sub_100058F30();
}

uint64_t sub_100057980@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_100057994(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_1000579A8()
{
  return sub_1000590C0();
}

uint64_t (*sub_1000579BC(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_100057A48()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, &qword_10009DFF0);
}

uint64_t sub_100057A5C(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView, &qword_10009DFF0);
}

uint64_t (*sub_100057A78(void *a1))()
{
  unsigned int v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100057B88()
{
  return sub_100058F30();
}

uint64_t sub_100057B9C()
{
  return sub_1000590C0();
}

uint64_t (*sub_100057BB0(void *a1))()
{
  id v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_100057C3C()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused, &qword_10009DFF0);
}

uint64_t sub_100057C50(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused, &qword_10009DFF0);
}

uint64_t (*sub_100057C6C(void *a1))()
{
  unsigned int v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100057D7C(uint64_t a1)
{
  uint64_t v2 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v2);
  sub_10002AA34(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10009E000);
  Published.init(initialValue:)();
  return sub_10002F024(a1, &qword_10009E000);
}

uint64_t sub_100057E34()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();

  return swift_release();
}

uint64_t sub_100057EAC(uint64_t a1)
{
  uint64_t v3 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_10002AA34(a1, (uint64_t)v5, &qword_10009E000);
  id v6 = v1;
  static Published.subscript.setter();
  return sub_10002F024(a1, &qword_10009E000);
}

uint64_t (*sub_100057F80(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_10005800C()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate, &qword_10009E008);
}

uint64_t sub_100058020(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009E010, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate, &qword_10009E008);
}

uint64_t (*sub_10005803C(void *a1))()
{
  uint64_t v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009E010);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009E008);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_10005814C()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100058194()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

double sub_100058208@<D0>(_OWORD *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  double result = *(double *)&v3;
  *a1 = v3;
  return result;
}

uint64_t sub_100058288(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100058308()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*sub_100058380(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_10005840C()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText, &qword_10009E020);
}

uint64_t sub_100058420(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009E028, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText, &qword_10009E020);
}

uint64_t (*sub_10005843C(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009E028);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009E020);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_10005854C()
{
  return Published.init(initialValue:)();
}

uint64_t sub_10005857C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000585F0@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  a1[1] = v4;
  return result;
}

uint64_t sub_100058670(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_1000586F0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*sub_100058768(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_1000587F4()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder, &qword_10009E030);
}

uint64_t sub_100058808(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009E038, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder, &qword_10009E030);
}

uint64_t (*sub_100058824(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009E038);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passwordFieldPlaceholder;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009E030);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100058934()
{
  return Published.init(initialValue:)();
}

uint64_t sub_100058964()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_1000589D8@<X0>(void *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_100058A58(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_100058AC8()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*sub_100058B34(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_100058BC0()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts, &qword_10009E040);
}

uint64_t sub_100058BD4(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009E048, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts, &qword_10009E040);
}

uint64_t (*sub_100058BF0(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009E048);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009E040);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100058D00()
{
  return sub_100058F30();
}

uint64_t sub_100058D14@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_100058D28(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_100058D3C()
{
  return sub_1000590C0();
}

uint64_t (*sub_100058D50(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

uint64_t sub_100058DDC()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton, &qword_10009DFF0);
}

uint64_t sub_100058DF0(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton, &qword_10009DFF0);
}

uint64_t (*sub_100058E0C(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  id v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

uint64_t sub_100058F1C()
{
  return sub_100058F30();
}

uint64_t sub_100058F30()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100058F9C@<X0>(unsigned char *a1@<X8>)
{
  return sub_100058FB0(a1);
}

uint64_t sub_100058FB0@<X0>(unsigned char *a1@<X8>)
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  uint64_t result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_10005902C(uint64_t a1, void **a2)
{
  return sub_100059040(a1, a2);
}

uint64_t sub_100059040(uint64_t a1, void **a2)
{
  uint64_t v2 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_1000590AC()
{
  return sub_1000590C0();
}

uint64_t sub_1000590C0()
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t (*sub_100059128(void *a1))()
{
  uint64_t v2 = malloc(0x38uLL);
  *a1 = v2;
  void v2[4] = swift_getKeyPath();
  void v2[5] = swift_getKeyPath();
  v2[6] = static Published.subscript.modify();
  return sub_1000573BC;
}

void sub_1000591B4(void *a1)
{
  id v1 = (void *)*a1;
  (*(void (**)(void, void))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();

  free(v1);
}

uint64_t sub_10005921C()
{
  return sub_100059230((uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, &qword_10009DFF0);
}

uint64_t sub_100059230(uint64_t a1, uint64_t *a2)
{
  return swift_endAccess();
}

uint64_t sub_100059298(uint64_t a1)
{
  return sub_1000592B4(a1, &qword_10009DFF8, (uint64_t)&OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton, &qword_10009DFF0);
}

uint64_t sub_1000592B4(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = sub_100028560(a2);
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v10 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  swift_beginAccess();
  sub_100028560(a4);
  Published.projectedValue.setter();
  swift_endAccess();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
}

uint64_t (*sub_1000593E4(void *a1))()
{
  id v3 = malloc(0x88uLL);
  *a1 = v3;
  v3[9] = v1;
  uint64_t v4 = sub_100028560(&qword_10009DFF8);
  v3[10] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v3[11] = v5;
  size_t v6 = *(void *)(v5 + 64);
  v3[12] = malloc(v6);
  v3[13] = malloc(v6);
  uint64_t v7 = malloc(v6);
  uint64_t v8 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton;
  v3[14] = v7;
  v3[15] = v8;
  swift_beginAccess();
  v3[16] = sub_100028560(&qword_10009DFF0);
  Published.projectedValue.getter();
  swift_endAccess();
  return sub_100057500;
}

void sub_1000594F4(uint64_t a1, char a2)
{
  id v3 = *(void **)a1;
  uint64_t v4 = *(void (**)(void, void, void))(*(void *)(*(void *)a1 + 88) + 16);
  v4(*(void *)(*(void *)a1 + 104), v3[14], v3[10]);
  uint64_t v5 = (void *)v3[14];
  size_t v6 = (void *)v3[12];
  uint64_t v7 = (void *)v3[13];
  uint64_t v8 = v3[10];
  uint64_t v9 = v3[11];
  if (a2)
  {
    v4(v3[12], v3[13], v3[10]);
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    uint64_t v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v7, v8);
    v10(v5, v8);
  }
  else
  {
    swift_beginAccess();
    Published.projectedValue.setter();
    swift_endAccess();
    (*(void (**)(void *, uint64_t))(v9 + 8))(v5, v8);
  }
  free(v5);
  free(v7);
  free(v6);

  free(v3);
}

double sub_100059664()
{
  return 0.15;
}

uint64_t sub_100059674()
{
  return *(unsigned __int8 *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
}

uint64_t sub_100059684()
{
  return swift_unknownObjectRetain();
}

id sub_100059694()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration);
}

uint64_t sub_1000596A4()
{
  return *(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failureLimit);
}

uint64_t sub_1000596BC()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures;
  swift_beginAccess();
  return *(void *)v1;
}

uint64_t sub_100059704(uint64_t a1)
{
  id v3 = (void *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures);
  uint64_t result = swift_beginAccess();
  void *v3 = a1;
  return result;
}

uint64_t (*sub_100059750())()
{
  return j_j__swift_endAccess;
}

id sub_1000597AC()
{
  return *(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
}

uint64_t sub_1000597BC()
{
  uint64_t v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_100059804(char a1)
{
  id v3 = (unsigned char *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
  uint64_t result = swift_beginAccess();
  unsigned char *v3 = a1;
  return result;
}

uint64_t (*sub_100059850())()
{
  return j__swift_endAccess;
}

uint64_t sub_1000598AC()
{
  return swift_unknownObjectWeakLoadStrong();
}

uint64_t sub_1000598F8()
{
  return swift_unknownObjectRelease();
}

void (*sub_100059954(void *a1))(void **a1, char a2)
{
  id v3 = malloc(0x30uLL);
  *a1 = v3;
  uint64_t v4 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_delegate;
  void v3[4] = v1;
  void v3[5] = v4;
  swift_beginAccess();
  v3[3] = swift_unknownObjectWeakLoadStrong();
  return sub_10003A4BC;
}

double sub_1000599D8()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius + 8) & 1) == 0) {
    return *(double *)v1;
  }
  double result = 0.0;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad)) {
    double result = 8.0;
  }
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

void sub_100059A1C(double a1)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius;
  *(double *)uint64_t v2 = a1;
  *(unsigned char *)(v2 + 8) = 0;
}

void *(*sub_100059A34(uint64_t a1))(void *result)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = sub_1000599D8();
  return sub_100059A7C;
}

void *sub_100059A7C(void *result)
{
  uint64_t v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius;
  *(void *)uint64_t v1 = *result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

double sub_100059A98()
{
  uint64_t v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity);
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity + 8) & 1) == 0) {
    return *(double *)v1;
  }
  double result = 0.8;
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad)) {
    double result = 0.000001;
  }
  *(double *)uint64_t v1 = result;
  v1[8] = 0;
  return result;
}

void sub_100059AE4(double a1)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity;
  *(double *)uint64_t v2 = a1;
  *(unsigned char *)(v2 + 8) = 0;
}

void *(*sub_100059AFC(uint64_t a1))(void *result)
{
  *(void *)(a1 + 8) = v1;
  *(double *)a1 = sub_100059A98();
  return sub_100059B44;
}

void *sub_100059B44(void *result)
{
  uint64_t v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity;
  *(void *)uint64_t v1 = *result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

id sub_100059B60()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  [v1 canEvaluatePolicy:1 error:0];

  return [v1 biometryType];
}

uint64_t sub_100059BBC()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  if (!*(void *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle + 8))
  {
    id v3 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    [v3 canEvaluatePolicy:1 error:0];
    id v4 = [v3 biometryType];
    if (v4 == (id)1)
    {
      uint64_t v5 = sub_100027C38();
    }
    else
    {
      if (v4 != (id)2)
      {
        uint64_t v2 = 0;
        unint64_t v7 = 0xE000000000000000;
        goto LABEL_9;
      }
      uint64_t v5 = sub_100027B78();
    }
    uint64_t v2 = v5;
    unint64_t v7 = v6;
LABEL_9:
    *uint64_t v1 = v2;
    v1[1] = v7;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  uint64_t v2 = *v1;
LABEL_10:
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t sub_100059C8C(uint64_t a1, uint64_t a2)
{
  id v3 = (void *)(v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  void *v3 = a1;
  v3[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_100059CA8(uint64_t *a1))(void *a1)
{
  a1[2] = v1;
  *a1 = sub_100059BBC();
  a1[1] = v3;
  return sub_100059CF0;
}

uint64_t sub_100059CF0(void *a1)
{
  uint64_t v1 = a1[1];
  uint64_t v2 = (void *)(a1[2] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle);
  void *v2 = *a1;
  v2[1] = v1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100059D10()
{
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v2) {
    return 1;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_100059DD8()
{
  unsigned __int8 v1 = (unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType);
  if (*(unsigned char *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType + 8) != 1) {
    return *(void *)v1;
  }
  id v2 = [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration) passcodeLength];
  if ((unint64_t)v2 + 1 > 7) {
    uint64_t v3 = (uint64_t *)&LACustomPasswordTypeAlphanumeric;
  }
  else {
    uint64_t v3 = (uint64_t *)*(&off_100088C70 + (void)v2 + 1);
  }
  uint64_t result = *v3;
  *(void *)unsigned __int8 v1 = *v3;
  v1[8] = 0;
  return result;
}

uint64_t sub_100059E5C(uint64_t result)
{
  uint64_t v2 = v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType;
  *(void *)uint64_t v2 = result;
  *(unsigned char *)(v2 + 8) = 0;
  return result;
}

void *(*sub_100059E74(uint64_t *a1))(void *result)
{
  a1[1] = v1;
  *a1 = sub_100059DD8();
  return sub_100059EBC;
}

void *sub_100059EBC(void *result)
{
  uint64_t v1 = result[1] + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType;
  *(void *)uint64_t v1 = *result;
  *(unsigned char *)(v1 + 8) = 0;
  return result;
}

BOOL sub_100059ED8()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration) style] == (id)1;
}

id sub_100059F0C()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration) headerHidden];
}

uint64_t sub_100059F38()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), "title"));
  uint64_t v2 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v2;
}

uint64_t sub_100059F98()
{
  return sub_100059FB4((SEL *)&selRef_cancelButtonTitle);
}

uint64_t sub_100059FA8()
{
  return sub_100059FB4((SEL *)&selRef_subtitle);
}

uint64_t sub_100059FB4(SEL *a1)
{
  id v2 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                             + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration), *a1));
  if (!v2) {
    return 0;
  }
  uint64_t v3 = v2;
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();

  return v4;
}

id sub_10005A024()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration) passcodeLength];
}

id sub_10005A03C()
{
  uint64_t v1 = v0;
  uint64_t v2 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon;
  uint64_t v3 = *(void **)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  id v4 = v3;
  if (v3 == (void *)1)
  {
    uint64_t v5 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration);
    id v6 = [v5 iconPath];
    if (v6)
    {
      unint64_t v7 = v6;
      id v8 = [self imageForPath:v6];
    }
    else
    {
      id v9 = [v5 bundleIdentifier];
      if (!v9)
      {
        id v13 = Logger.logObject.getter();
        os_log_type_t v14 = static os_log_type_t.info.getter();
        if (os_log_type_enabled(v13, v14))
        {
          unint64_t v15 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)unint64_t v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, v14, "The icon path and bundle identifier are nil", v15, 2u);
          swift_slowDealloc();
        }

        id v4 = [self genericIcon];
        goto LABEL_7;
      }
      unint64_t v7 = v9;
      id v8 = [self imageForBundleIdentifier:v9];
    }
    id v4 = v8;

LABEL_7:
    uint64_t v10 = *(void **)(v1 + v2);
    *(void *)(v1 + v2) = v4;
    id v11 = v4;
    sub_10004D2EC(v10);
  }
  sub_10004D2DC(v3);
  return v4;
}

void sub_10005A1E0(uint64_t a1)
{
  uint64_t v2 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  *(void *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon) = a1;
  sub_10004D2EC(v2);
}

void (*sub_10005A1F8(id *a1))(uint64_t a1, char a2)
{
  a1[1] = v1;
  *a1 = sub_10005A03C();
  return sub_10005A240;
}

void sub_10005A240(uint64_t a1, char a2)
{
  uint64_t v2 = *(void **)a1;
  uint64_t v3 = *(void *)(a1 + 8);
  id v4 = *(void **)(v3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon);
  *(void *)(v3 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon) = *(void *)a1;
  if (a2)
  {
    id v5 = v2;
    sub_10004D2EC(v4);
  }
  else
  {
    sub_10004D2EC(v4);
  }
}

BOOL sub_10005A2C4()
{
  return [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration) mode] == 0;
}

uint64_t sub_10005A2F8()
{
  uint64_t v0 = type metadata accessor for Calendar();
  uint64_t v28 = *(void *)(v0 - 8);
  uint64_t v29 = v0;
  __chkstk_darwin(v0);
  uint64_t v2 = (char *)&v26 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for DateComponents();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v27 = v3;
  __chkstk_darwin(v3);
  id v5 = (char *)&v26 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100028560(&qword_10009E000);
  __chkstk_darwin(v6 - 8);
  id v8 = (char *)&v26 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Date();
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = __chkstk_darwin(v9);
  id v13 = (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v26 - v14;
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1)
  {
    sub_10002F024((uint64_t)v8, &qword_10009E000);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v15, v8, v9);
  static Calendar.current.getter();
  sub_100028560(&qword_10009E058);
  uint64_t v16 = type metadata accessor for Calendar.Component();
  uint64_t v17 = *(void *)(v16 - 8);
  unint64_t v18 = (*(unsigned __int8 *)(v17 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v17 + 80);
  uint64_t v19 = swift_allocObject();
  *(_OWORD *)(v19 + 16) = xmmword_10006BB30;
  (*(void (**)(unint64_t, void, uint64_t))(v17 + 104))(v19 + v18, enum case for Calendar.Component.minute(_:), v16);
  sub_10005EFD4(v19);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  Date.init()();
  Calendar.dateComponents(_:from:to:)();
  swift_bridgeObjectRelease();
  id v20 = *(void (**)(char *, uint64_t))(v10 + 8);
  v20(v13, v9);
  (*(void (**)(char *, uint64_t))(v28 + 8))(v2, v29);
  uint64_t v21 = DateComponents.minute.getter();
  char v23 = v22;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v5, v27);
  if ((v23 & 1) != 0 || v21 < 0)
  {
    v20(v15, v9);
    return 0;
  }
  uint64_t result = v21 + 1;
  if (!__OFADD__(v21, 1))
  {
    uint64_t v25 = sub_100027E9C(result);
    v20(v15, v9);
    return v25;
  }
  __break(1u);
  return result;
}

uint64_t sub_10005A770()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  if (v1 == (id)1)
  {
    return sub_10002779C();
  }
  else if (v1)
  {
    return sub_1000276D4();
  }
  else
  {
    return sub_100027864();
  }
}

char *sub_10005A818(void *a1, void *a2, void *a3, uint64_t a4, char a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  int v17 = a5 & 1;
  id v18 = objc_allocWithZone(v10);
  return sub_10005A8B4(a1, a2, a3, a4, v17, a6, a7, a8, a9, a10);
}

char *sub_10005A8B4(void *a1, void *a2, void *a3, uint64_t a4, int a5, uint64_t a6, void *a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v88 = a8;
  long long v89 = a7;
  uint64_t v87 = a6;
  LODWORD(v103) = a5;
  uint64_t v101 = a1;
  uint64_t v102 = a4;
  uint64_t v100 = a2;
  uint64_t v105 = a10;
  id v106 = a3;
  uint64_t v104 = a9;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v11 = sub_100028560(&qword_10009E040);
  uint64_t v98 = *(void *)(v11 - 8);
  uint64_t v99 = v11;
  __chkstk_darwin(v11);
  uint64_t v97 = (char *)&v86 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v96 = sub_100028560(&qword_10009E020);
  uint64_t v95 = *(void *)(v96 - 8);
  __chkstk_darwin(v96);
  long long v94 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v93 = sub_100028560(&qword_10009E008);
  uint64_t v92 = *(void *)(v93 - 8);
  __chkstk_darwin(v93);
  unint64_t v15 = (char *)&v86 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100028560(&qword_10009E000);
  uint64_t v16 = __chkstk_darwin(v91);
  id v18 = (char *)&v86 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16);
  id v20 = (char *)&v86 - v19;
  uint64_t v21 = sub_100028560(&qword_10009DFF0);
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = &v10[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showAuthorizationView];
  LOBYTE(aBlock) = 0;
  uint64_t v26 = v10;
  Published.init(initialValue:)();
  uint64_t v27 = *(void (**)(char *, char *, uint64_t))(v22 + 32);
  v27(v25, v24, v21);
  uint64_t v28 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryIntentButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v28, v24, v21);
  uint64_t v29 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowCustomPasswordView];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v29, v24, v21);
  uint64_t v30 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__shouldShowDevicePasscodeView];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v30, v24, v21);
  char v31 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__passcodeFocused];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v31, v24, v21);
  uint64_t v32 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__blockedUntilDate];
  uint64_t v33 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v33 - 8) + 56))(v20, 1, 1, v33);
  sub_10002AA34((uint64_t)v20, (uint64_t)v18, &qword_10009E000);
  Published.init(initialValue:)();
  sub_10002F024((uint64_t)v20, &qword_10009E000);
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v32, v15, v93);
  char v34 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__promptText];
  objc_super aBlock = 0;
  uint64_t v108 = 0;
  sub_100028560(&qword_10009E018);
  long long v35 = v94;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v95 + 32))(v34, v35, v96);
  id v36 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__wrongBioAttempts];
  objc_super aBlock = 0;
  unint64_t v37 = v97;
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v98 + 32))(v36, v37, v99);
  unint64_t v38 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showBiometryRetryButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v38, v24, v21);
  id v39 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel__showFallbackButton];
  LOBYTE(aBlock) = 0;
  Published.init(initialValue:)();
  v27(v39, v24, v21);
  long long v40 = (uint64_t *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion];
  *long long v40 = 0;
  v40[1] = 0;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissAnimationDuration] = 0x3FC3333333333333;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed] = 0;
  uint64_t v41 = sub_100048C74();
  sub_100048C8C(*v41);
  uint64_t v42 = OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad;
  sub_10002B40C(0, &qword_10009E050);
  v26[v42] = sub_1000608FC();
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failures] = 0;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad] = 0;
  swift_unknownObjectWeakInit();
  char v43 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___cornerRadius];
  *(void *)char v43 = 0;
  v43[8] = 1;
  id v44 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___backgroundOpacity];
  *(void *)id v44 = 0;
  v44[8] = 1;
  uint64_t v45 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___biometrySubtitle];
  *(void *)uint64_t v45 = 0;
  *((void *)v45 + 1) = 0;
  Swift::String_optional v46 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___passwordType];
  *(void *)Swift::String_optional v46 = 0;
  v46[8] = 1;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel____lazy_storage___appIcon] = 1;
  uint64_t v47 = *v40;
  uint64_t v48 = v104;
  uint64_t v49 = v105;
  *long long v40 = v104;
  v40[1] = v49;
  sub_100029A94(v48);
  sub_10002A998(v47);
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_backoffCounter] = v106;
  NSString v50 = v100;
  id v51 = v101;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_cachedContext] = v100;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration] = v51;
  NSString v52 = &v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_failureLimit];
  *(void *)NSString v52 = v102;
  v52[8] = v103 & 1;
  id v103 = v50;
  swift_unknownObjectRetain();
  id v53 = v51;
  v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod] = sub_100031F54((unint64_t)[v53 requirement]);
  id v54 = [v53 contextData];
  uint64_t v55 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v57 = v56;

  id v58 = objc_allocWithZone((Class)LAContext);
  Class isa = Data._bridgeToObjectiveC()().super.isa;
  sub_10002ADFC(v55, v57);
  id v60 = [v58 initWithExternalizedContext:isa];

  if (!v60)
  {
    __break(1u);
    JUMPOUT(0x10005B53CLL);
  }
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context] = v60;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_policy] = v87;
  NSString v61 = v89;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_userId] = v89;
  *(void *)&v26[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_options] = v88;
  id v62 = v61;
  id v63 = [v53 passwordFieldPlaceholder];
  uint64_t v64 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v66 = v65;

  swift_beginAccess();
  uint64_t v114 = v64;
  uint64_t v115 = v66;
  Published.init(initialValue:)();
  swift_endAccess();

  v113.receiver = v26;
  v113.super_class = ObjectType;
  uint64_t v67 = (char *)[super init];
  uint64_t v68 = *(void **)&v67[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration];
  uint64_t v69 = v67;
  switch((unint64_t)[v68 requirement])
  {
    case 1uLL:
    case 5uLL:
      goto LABEL_10;
    case 2uLL:
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = 0;
      objc_super v73 = v69;
      static Published.subscript.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = 1;
      objc_super v74 = v73;
      static Published.subscript.setter();
      id v75 = [self currentPasscode];
      id v76 = [v75 type];

      if ((unint64_t)v76 > 3) {
        long long v77 = &LACustomPasswordTypeAlphanumeric;
      }
      else {
        long long v77 = *(&off_100088CB0 + (void)v76);
      }
      [v68 setPasscodeLength:*v77];
      break;
    case 3uLL:
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = 1;
      Swift::String v78 = v69;
      static Published.subscript.setter();
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = 0;
      unint64_t v79 = v78;
      goto LABEL_14;
    case 4uLL:
    case 6uLL:
      id v70 = [self currentPasscode];
      id v71 = [v70 type];

      if ((unint64_t)v71 > 3) {
        uint64_t v72 = &LACustomPasswordTypeAlphanumeric;
      }
      else {
        uint64_t v72 = *(&off_100088CB0 + (void)v71);
      }
      [v68 setPasscodeLength:*v72];
LABEL_10:
      uint64_t v80 = *(void **)&v69[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context];
      [v80 canEvaluatePolicy:1 error:0];
      if ([v80 biometryType] == (id)2) {
        unsigned __int8 v81 = [v68 requiresIntent];
      }
      else {
        unsigned __int8 v81 = 0;
      }
      swift_getKeyPath();
      swift_getKeyPath();
      LOBYTE(aBlock) = v81;
      char v82 = v69;
LABEL_14:
      static Published.subscript.setter();
      break;
    default:
      break;
  }
  sub_10005B554(0);
  uint64_t v83 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v111 = sub_10005F324;
  uint64_t v112 = v83;
  objc_super aBlock = _NSConcreteStackBlock;
  uint64_t v108 = 1107296256;
  uint64_t v109 = sub_10002DE44;
  uint64_t v110 = &unk_100088828;
  uint64_t v84 = _Block_copy(&aBlock);
  swift_release();
  [v106 currentBackoffErrorWithReply:v84];
  sub_10002A998(v104);

  swift_unknownObjectRelease();
  _Block_release(v84);
  return v69;
}

uint64_t sub_10005B554(char a1)
{
  uint64_t v2 = v1;
  if (a1)
  {
    sub_100027DCC();
LABEL_19:
    swift_getKeyPath();
    swift_getKeyPath();
    id v16 = v2;
    return static Published.subscript.setter();
  }
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_configuration];
  if ([v3 mode]) {
    goto LABEL_4;
  }
  id v6 = [v3 prompt];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v10 = v9;

    swift_bridgeObjectRelease();
    uint64_t v11 = HIBYTE(v10) & 0xF;
    if ((v10 & 0x2000000000000000) == 0) {
      uint64_t v11 = v8 & 0xFFFFFFFFFFFFLL;
    }
    if (v11) {
      goto LABEL_4;
    }
  }
  if (*((unsigned char *)v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod) == 2) {
    goto LABEL_4;
  }
  char v20 = *((unsigned char *)v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod);
  sub_1000320C8();
  if ((dispatch thunk of static Equatable.== infix(_:_:)() & 1) == 0) {
    goto LABEL_4;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if ((v20 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    if (v20 != 1)
    {
LABEL_4:
      id v4 = [v3 prompt];
      if (v4)
      {
        id v5 = v4;
        static String._unconditionallyBridgeFromObjectiveC(_:)();
      }
      goto LABEL_19;
    }
  }
  uint64_t v12 = sub_100059DD8();
  uint64_t v13 = LACustomPasswordTypeFourDigits;
  id v14 = [self currentDevice];
  id v15 = [v14 userInterfaceIdiom];

  if (v13 == v12 || LACustomPasswordTypeSixDigits == v12)
  {
    if (v15 == (id)1)
    {
      sub_10002779C();
    }
    else if (v15)
    {
      sub_1000276D4();
    }
    else
    {
      sub_100027864();
    }
    goto LABEL_19;
  }
  if (v15 == (id)1)
  {
    sub_10002779C();
  }
  else if (v15)
  {
    sub_1000276D4();
  }
  else
  {
    sub_100027864();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v18 = v2;
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  id v19 = v18;
  return static Published.subscript.setter();
}

uint64_t sub_10005B894(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&aBlock[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t result = __chkstk_darwin(v6);
  unint64_t v10 = (char *)&aBlock[-1] - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    uint64_t v16 = result;
    sub_10002B40C(0, (unint64_t *)&qword_10009E060);
    swift_errorRetain();
    uint64_t v11 = (void *)static OS_dispatch_queue.main.getter();
    uint64_t v12 = swift_allocObject();
    swift_beginAccess();
    uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    uint64_t v14 = swift_allocObject();
    *(void *)(v14 + 16) = v12;
    *(void *)(v14 + 24) = a1;
    aBlock[4] = sub_100060834;
    aBlock[5] = v14;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    void aBlock[2] = sub_100029A40;
    void aBlock[3] = &unk_100088C48;
    id v15 = _Block_copy(aBlock);
    swift_errorRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v15);

    swift_errorRelease();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v16);
  }
  return result;
}

uint64_t sub_10005BBBC(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)aBlock - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DispatchQoS();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  unint64_t v10 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v11 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = v11;
  *(void *)(v12 + 24) = a1;
  aBlock[4] = sub_10005F348;
  aBlock[5] = v12;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100029A40;
  void aBlock[3] = &unk_100088878;
  uint64_t v13 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_10005BEA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(unsigned char *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) & 1) == 0)
  {
    *(unsigned char *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) = 1;
    char v13 = *(unsigned char *)(a2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
    sub_10002B40C(0, (unint64_t *)&qword_10009E060);
    uint64_t v20 = static OS_dispatch_queue.main.getter();
    uint64_t v14 = swift_allocObject();
    swift_unknownObjectWeakInit();
    id v15 = (void *)swift_allocObject();
    if (v13)
    {
      _OWORD v15[2] = v14;
      v15[3] = a1;
      v15[4] = nullsub_15;
      v15[5] = 0;
      uint64_t v25 = sub_100060894;
      uint64_t v26 = v15;
      objc_super aBlock = _NSConcreteStackBlock;
      uint64_t v22 = 1107296256;
      uint64_t v16 = &unk_100088B58;
    }
    else
    {
      _OWORD v15[2] = 0x3FC3333333333333;
      v15[3] = v14;
      v15[4] = a1;
      v15[5] = nullsub_15;
      void v15[6] = 0;
      uint64_t v25 = sub_10005F354;
      uint64_t v26 = v15;
      objc_super aBlock = _NSConcreteStackBlock;
      uint64_t v22 = 1107296256;
      uint64_t v16 = &unk_100088B08;
    }
    uint64_t v23 = sub_100029A40;
    uint64_t v24 = v16;
    uint64_t v17 = _Block_copy(&aBlock);
    swift_errorRetain();
    swift_release();
    static DispatchQoS.unspecified.getter();
    objc_super aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    id v18 = (void *)v20;
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v17);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v12, v8);
  }
  return result;
}

uint64_t sub_10005C258(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v8 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = type metadata accessor for DispatchQoS();
  uint64_t v13 = __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v24 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(unsigned char *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed)) {
    return a2(v13);
  }
  uint64_t v26 = v14;
  uint64_t v27 = v9;
  *(unsigned char *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_dismissed) = 1;
  int v18 = *(unsigned __int8 *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_isPad);
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  uint64_t v25 = static OS_dispatch_queue.main.getter();
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = (void *)swift_allocObject();
  if (v18 == 1)
  {
    v20[2] = v19;
    v20[3] = a1;
    void v20[4] = a2;
    v20[5] = a3;
    uint64_t v32 = sub_10005F35C;
    uint64_t v33 = v20;
    objc_super aBlock = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    uint64_t v21 = &unk_100088918;
  }
  else
  {
    v20[2] = 0x3FC3333333333333;
    v20[3] = v19;
    void v20[4] = a1;
    v20[5] = a2;
    v20[6] = a3;
    uint64_t v32 = sub_10005F354;
    uint64_t v33 = v20;
    objc_super aBlock = _NSConcreteStackBlock;
    uint64_t v29 = 1107296256;
    uint64_t v21 = &unk_1000888C8;
  }
  uint64_t v30 = sub_100029A40;
  char v31 = v21;
  uint64_t v22 = _Block_copy(&aBlock);
  swift_errorRetain();
  swift_retain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  objc_super aBlock = (void **)&_swiftEmptyArrayStorage;
  sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  uint64_t v23 = (void *)v25;
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v27 + 8))(v11, v8);
  return (*(uint64_t (**)(char *, uint64_t))(v26 + 8))(v16, v12);
}

uint64_t sub_10005C61C(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.setter();
  }
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v6 = (void *)Strong;
    uint64_t v7 = (unsigned char *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_expectsDismissOnIpad);
    swift_beginAccess();
    unsigned char *v7 = 1;
  }
  swift_beginAccess();
  uint64_t v8 = swift_unknownObjectWeakLoadStrong();
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = (uint64_t *)(v8 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    uint64_t v11 = *(void (**)(uint64_t))(v8 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    if (v11)
    {
      swift_retain();
      v11(a2);
      sub_10002A998((uint64_t)v11);
      uint64_t v12 = *v10;
      *uint64_t v10 = 0;
      v10[1] = 0;
      sub_10002A998(v12);
    }
  }
  return a3();
}

uint64_t sub_10005C78C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = a4;
  uint64_t v33 = a3;
  uint64_t v32 = a2;
  uint64_t v36 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v39 = *(void *)(v36 - 8);
  __chkstk_darwin(v36);
  long long v35 = (char *)&v30 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v37 = *(void *)(v5 - 8);
  uint64_t v38 = v5;
  __chkstk_darwin(v5);
  char v31 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for DispatchTime();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v30 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v30 - v15;
  static Animation.easeIn(duration:)();
  swift_allocObject();
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  sub_100028560((uint64_t *)&unk_10009E190);
  withAnimation<A>(_:_:)();
  swift_release();
  swift_release();
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  int v18 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  uint64_t v30 = v7;
  v19(v11, v7);
  + infix(_:_:)();
  v19(v14, v7);
  uint64_t v20 = swift_allocObject();
  swift_beginAccess();
  uint64_t v21 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  uint64_t v22 = (void *)swift_allocObject();
  uint64_t v23 = v32;
  v22[2] = v20;
  v22[3] = v23;
  uint64_t v24 = v34;
  v22[4] = v33;
  v22[5] = v24;
  aBlock[4] = sub_100060770;
  aBlock[5] = v22;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100029A40;
  void aBlock[3] = &unk_100088BA8;
  uint64_t v25 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_retain();
  swift_release();
  uint64_t v26 = v31;
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  uint64_t v28 = v35;
  uint64_t v27 = v36;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v25);

  (*(void (**)(char *, uint64_t))(v39 + 8))(v28, v27);
  (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v38);
  return ((uint64_t (*)(char *, uint64_t))v19)(v16, v30);
}

id sub_10005CCC4(uint64_t a1, uint64_t a2, void (*a3)(void), uint64_t a4)
{
  uint64_t ObjectType = swift_getObjectType();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (aBlock == 1)
  {
    uint64_t v10 = *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_cachedContext);
    if (v10 && (id v11 = [v10 externalizedContext]) != 0
      || (result = [*(id *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context) externalizedContext], (id v11 = result) != 0))
    {
      uint64_t v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v15 = v14;

      sub_10002F490(a1, a2, v13, v15, *(void **)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_userId), *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_policy), *(void *)(v4 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_options), a3, a4, ObjectType, (uint64_t)&off_100088A08);
      return (id)sub_10002ADFC(v13, v15);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.getter();
    swift_release();
    swift_release();
    return (id)((uint64_t (*)(void))a3)(0);
  }
  return result;
}

uint64_t sub_10005CF94(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_10005CFE8()
{
  static Animation.default.getter();
  withAnimation<A>(_:_:)();
  swift_release();
  return [*(id *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context) retryProcessedEvent:7 reply:0];
}

uint64_t sub_10005D074(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v27 = *(void *)(v8 - 8);
  uint64_t v28 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v24 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for DispatchTime();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v24 - v16;
  if (a1)
  {
    uint64_t v18 = static Animation.linear(duration:)();
    __chkstk_darwin(v18);
    *(&v24 - 2) = v2;
    withAnimation<A>(_:_:)();
    return swift_release();
  }
  else
  {
    uint64_t v20 = *(void **)(v2 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    [v20 canEvaluatePolicy:1 error:0];
    [v20 biometryType];
    sub_10002B40C(0, (unint64_t *)&qword_10009E060);
    uint64_t v25 = static OS_dispatch_queue.main.getter();
    static DispatchTime.now()();
    + infix(_:_:)();
    uint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
    v26(v15, v11);
    uint64_t v21 = swift_allocObject();
    swift_unknownObjectWeakInit();
    aBlock[4] = sub_10005F41C;
    aBlock[5] = v21;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    void aBlock[2] = sub_100029A40;
    void aBlock[3] = &unk_100088968;
    uint64_t v22 = _Block_copy(aBlock);
    swift_release();
    static DispatchQoS.unspecified.getter();
    aBlock[0] = &_swiftEmptyArrayStorage;
    sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100028560((uint64_t *)&unk_10009E070);
    sub_10002F3D8();
    dispatch thunk of SetAlgebra.init<A>(_:)();
    uint64_t v23 = (void *)v25;
    OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
    _Block_release(v22);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v10, v28);
    return ((uint64_t (*)(char *, uint64_t))v26)(v17, v11);
  }
}

uint64_t sub_10005D4D8()
{
  if (*((unsigned char *)v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod) == 2)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    id v0 = v0;
    static Published.subscript.setter();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v1 = v0;
  return static Published.subscript.setter();
}

uint64_t sub_10005D608(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = a2;
  uint64_t v2 = type metadata accessor for Date();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v5 = (char *)&v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100028560(&qword_10009E000);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v53 = (uint64_t)&v50 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v50 - v9;
  uint64_t v11 = __chkstk_darwin(v8);
  uint64_t v55 = (char *)&v50 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  unint64_t v15 = (char *)&v50 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v50 - v16;
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    LOBYTE(aBlock) = 0;
    static Published.subscript.setter();
  }
  uint64_t v18 = (void *)_convertErrorToNSError(_:)();
  id v19 = [v18 userInfo];

  uint64_t v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (*(void *)(v20 + 16) && (unint64_t v23 = sub_10002AAA8(v21, v22), (v24 & 1) != 0))
  {
    sub_10002B158(*(void *)(v20 + 56) + 32 * v23, (uint64_t)&aBlock);
  }
  else
  {
    long long aBlock = 0u;
    long long v57 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((void *)&v57 + 1))
  {
    int v25 = swift_dynamicCast();
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    uint64_t v27 = v25 ^ 1u;
    uint64_t v28 = v17;
  }
  else
  {
    sub_10002F024((uint64_t)&aBlock, &qword_10009D580);
    uint64_t v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    uint64_t v28 = v17;
    uint64_t v27 = 1;
  }
  NSString v52 = v26;
  v26(v28, v27, 1, v2);
  uint64_t v29 = (uint64_t)v55;
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    char v31 = (void *)Strong;
    sub_10002AA34((uint64_t)v17, (uint64_t)v15, &qword_10009E000);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v15, 1, v2) == 1)
    {
      sub_10002F024((uint64_t)v15, &qword_10009E000);
      char v32 = 0;
    }
    else
    {
      Date.init()();
      uint64_t v51 = Date.compare(_:)();
      uint64_t v33 = *(void (**)(char *, uint64_t))(v3 + 8);
      v33(v5, v2);
      v33(v15, v2);
      uint64_t v29 = (uint64_t)v55;
      char v32 = v51 == 1;
    }
    sub_10005B554(v32);
  }
  sub_10002AA34((uint64_t)v17, v29, &qword_10009E000);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v29, 1, v2) == 1)
  {
    sub_10002F024(v29, &qword_10009E000);
LABEL_21:
    swift_beginAccess();
    uint64_t v46 = swift_unknownObjectWeakLoadStrong();
    if (v46)
    {
      uint64_t v47 = (void *)v46;
      v52(v10, 1, 1, v2);
      swift_getKeyPath();
      swift_getKeyPath();
      sub_10002AA34((uint64_t)v10, v53, &qword_10009E000);
      id v48 = v47;
      static Published.subscript.setter();
      sub_10002F024((uint64_t)v10, &qword_10009E000);
    }
    swift_beginAccess();
    if (swift_unknownObjectWeakLoadStrong())
    {
      swift_getKeyPath();
      swift_getKeyPath();
      char v60 = 1;
      static Published.subscript.setter();
    }
    return sub_10002F024((uint64_t)v17, &qword_10009E000);
  }
  Date.init()();
  uint64_t v34 = Date.compare(_:)();
  long long v35 = *(void (**)(char *, uint64_t))(v3 + 8);
  v35(v5, v2);
  v35((char *)v29, v2);
  if (v34 != 1) {
    goto LABEL_21;
  }
  swift_beginAccess();
  uint64_t v36 = swift_unknownObjectWeakLoadStrong();
  if (v36)
  {
    uint64_t v37 = (void *)v36;
    sub_10002AA34((uint64_t)v17, (uint64_t)v10, &qword_10009E000);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_10002AA34((uint64_t)v10, v53, &qword_10009E000);
    id v38 = v37;
    static Published.subscript.setter();
    sub_10002F024((uint64_t)v10, &qword_10009E000);
  }
  uint64_t v39 = self;
  uint64_t v40 = swift_allocObject();
  swift_beginAccess();
  uint64_t v41 = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  uint64_t v42 = swift_allocObject();
  uint64_t v43 = v54;
  *(void *)(v42 + 16) = v40;
  *(void *)(v42 + 24) = v43;
  id v58 = sub_100060834;
  uint64_t v59 = v42;
  *(void *)&long long aBlock = _NSConcreteStackBlock;
  *((void *)&aBlock + 1) = 1107296256;
  *(void *)&long long v57 = sub_10002E0F8;
  *((void *)&v57 + 1) = &unk_100088BF8;
  id v44 = _Block_copy(&aBlock);
  swift_errorRetain();
  swift_release();
  id v45 = [v39 scheduledTimerWithTimeInterval:0 repeats:v44 block:1.0];
  _Block_release(v44);

  return sub_10002F024((uint64_t)v17, &qword_10009E000);
}

void sub_10005DDA4()
{
  id v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  uint64_t v2 = *(void (**)(void))(v0 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  if (v2)
  {
    swift_retain();
    v2(0);
    sub_10002A998((uint64_t)v2);
    uint64_t v3 = *v1;
    *id v1 = 0;
    v1[1] = 0;
    sub_10002A998(v3);
  }
}

void *sub_10005DE28()
{
  swift_beginAccess();
  id result = (void *)swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    uint64_t v2 = result;
    if ([result respondsToSelector:"viewModelDidRejectDevicePasscode:"]) {
      [v2 viewModelDidRejectDevicePasscode:v0];
    }
    return (void *)swift_unknownObjectRelease();
  }
  return result;
}

uint64_t sub_10005DEB8(uint64_t result)
{
  uint64_t v2 = (uint64_t *)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  uint64_t v3 = *(void (**)(uint64_t))(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
  if (v3)
  {
    uint64_t v4 = result;
    swift_retain();
    v3(v4);
    sub_10002A998((uint64_t)v3);
    uint64_t v5 = *v2;
    uint64_t *v2 = 0;
    v2[1] = 0;
    return sub_10002A998(v5);
  }
  return result;
}

void sub_10005DF40()
{
}

uint64_t sub_10005E2DC@<X0>(uint64_t *a1@<X8>)
{
  swift_getObjectType();
  uint64_t result = ObservableObject<>.objectWillChange.getter();
  *a1 = result;
  return result;
}

uint64_t sub_10005E320(uint64_t a1, uint64_t a2)
{
  return sub_10005F5A8(a2);
}

uint64_t sub_10005E3DC()
{
  uint64_t v0 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for DispatchQoS();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  uint64_t v8 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v9 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10005F9C8;
  aBlock[5] = v9;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100029A40;
  void aBlock[3] = &unk_100088990;
  uint64_t v10 = _Block_copy(aBlock);
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v10);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_10005E6E4()
{
  uint64_t v1 = sub_100028560(&qword_10009E080);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for TaskPriority();
  uint64_t v5 = *(void *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  uint64_t v6 = (void *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  void v6[4] = v0;
  int v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  id v8 = v0;
  if (v7 == 1)
  {
    sub_10002F024((uint64_t)v3, &qword_10009E080);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_10009E090;
  *(void *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_10005E924(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a4;
  return _swift_task_switch(sub_10005E944, 0, 0);
}

uint64_t sub_10005E944()
{
  type metadata accessor for MainActor();
  *(void *)(v0 + 32) = static MainActor.shared.getter();
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_10005E9D8, v2, v1);
}

uint64_t sub_10005E9D8()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  sub_10005EA4C(v1);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void (*sub_10005EA4C(uint64_t a1))(id *, void)
{
  uint64_t v2 = *(void **)(a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  [v2 canEvaluatePolicy:1 error:0];
  uint64_t result = (void (*)(id *, void))[v2 biometryType];
  if (result == (void (*)(id *, void))2)
  {
    uint64_t v4 = *(void **)(a1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    v9[0] = 0;
    [v4 canEvaluatePolicy:1 error:v9];
    id v5 = v9[0];
    id v6 = v9[0];
    if (v5)
    {
      sub_10005F5A8((uint64_t)v6);
      return (void (*)(id *, void))swift_errorRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      uint64_t result = (void (*)(id *, void))static Published.subscript.modify();
      if (__OFADD__(*v7, 1))
      {
        __break(1u);
      }
      else
      {
        ++*v7;
        result(v9, 0);
        swift_release();
        uint64_t v8 = swift_release();
        __chkstk_darwin(v8);
        static Animation.default.getter();
        withAnimation<A>(_:_:)();
        return (void (*)(id *, void))swift_release();
      }
    }
  }
  return result;
}

NSNumber sub_10005EC2C()
{
  return Int._bridgeToObjectiveC()();
}

uint64_t sub_10005EC34(uint64_t a1, uint64_t a2)
{
  uint64_t result = static Int._forceBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return result;
}

uint64_t sub_10005EC88(uint64_t a1, uint64_t a2)
{
  char v3 = static Int._conditionallyBridgeFromObjectiveC(_:result:)();
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_10005ECE0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static Int._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  return result;
}

uint64_t sub_10005ED08()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t sub_10005EDC4()
{
  return Int.hashValue.getter(*v0);
}

void sub_10005EDCC()
{
  Hasher._combine(_:)(*v0);
}

uint64_t sub_10005EDF8()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t sub_10005EE00(uint64_t a1, int *a2)
{
  id v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_10005EEDC;
  return v6(a1);
}

uint64_t sub_10005EEDC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

void *sub_10005EFD4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Calendar.Component();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = __chkstk_darwin(v2);
  id v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v37 = (char *)&v30 - v7;
  uint64_t v8 = *(void *)(a1 + 16);
  if (v8)
  {
    sub_100028560(&qword_10009E1A8);
    uint64_t v9 = static _SetStorage.allocate(capacity:)();
    uint64_t v10 = 0;
    uint64_t v12 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    uint64_t v11 = v3 + 16;
    long long v35 = v12;
    uint64_t v36 = v9 + 56;
    uint64_t v13 = *(unsigned __int8 *)(v11 + 64);
    uint64_t v32 = v8;
    uint64_t v33 = a1 + ((v13 + 32) & ~v13);
    uint64_t v14 = *(void *)(v11 + 56);
    unint64_t v15 = (void (**)(char *, uint64_t))(v11 - 8);
    char v31 = (uint64_t (**)(unint64_t, char *, uint64_t))(v11 + 16);
    while (1)
    {
      uint64_t v34 = v10;
      v35(v37, v33 + v14 * v10, v2);
      sub_100060114(&qword_10009E1B0, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
      uint64_t v16 = dispatch thunk of Hashable._rawHashValue(seed:)();
      uint64_t v17 = ~(-1 << *(unsigned char *)(v9 + 32));
      unint64_t v18 = v16 & v17;
      unint64_t v19 = (v16 & (unint64_t)v17) >> 6;
      uint64_t v20 = *(void *)(v36 + 8 * v19);
      uint64_t v21 = 1 << (v16 & v17);
      if ((v21 & v20) != 0)
      {
        while (1)
        {
          uint64_t v22 = v11;
          v35(v6, *(void *)(v9 + 48) + v18 * v14, v2);
          sub_100060114(&qword_10009E1B8, (void (*)(uint64_t))&type metadata accessor for Calendar.Component);
          char v23 = dispatch thunk of static Equatable.== infix(_:_:)();
          char v24 = *v15;
          (*v15)(v6, v2);
          if (v23) {
            break;
          }
          unint64_t v18 = (v18 + 1) & v17;
          unint64_t v19 = v18 >> 6;
          uint64_t v20 = *(void *)(v36 + 8 * (v18 >> 6));
          uint64_t v21 = 1 << v18;
          uint64_t v11 = v22;
          if ((v20 & (1 << v18)) == 0) {
            goto LABEL_8;
          }
        }
        v24(v37, v2);
        uint64_t v11 = v22;
      }
      else
      {
LABEL_8:
        int v25 = v37;
        *(void *)(v36 + 8 * v19) = v21 | v20;
        uint64_t result = (void *)(*v31)(*(void *)(v9 + 48) + v18 * v14, v25, v2);
        uint64_t v27 = *(void *)(v9 + 16);
        BOOL v28 = __OFADD__(v27, 1);
        uint64_t v29 = v27 + 1;
        if (v28)
        {
          __break(1u);
          return result;
        }
        *(void *)(v9 + 16) = v29;
      }
      uint64_t v10 = v34 + 1;
      if (v34 + 1 == v32) {
        return (void *)v9;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_10005F2EC()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_10005F324(uint64_t a1)
{
  return sub_10005B894(a1);
}

uint64_t sub_10005F32C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10005F33C()
{
  return swift_release();
}

uint64_t sub_10005F348()
{
  return sub_10005D608(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_10005F35C()
{
  return sub_10005C61C(*(void *)(v0 + 16), *(void *)(v0 + 24), *(uint64_t (**)(void))(v0 + 32));
}

uint64_t sub_10005F368()
{
  uint64_t v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10005F41C()
{
  static Animation.linear(duration:)();
  swift_allocObject();
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  swift_unknownObjectWeakInit();

  withAnimation<A>(_:_:)();
  swift_release();
  return swift_release();
}

uint64_t sub_10005F4E8()
{
  uint64_t v1 = *(void **)(v0 + 16);
  sub_10005D4D8();
  sub_10005B554(0);
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

uint64_t sub_10005F5A8(uint64_t a1)
{
  uint64_t v25 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v28 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v4 = (char *)&v23 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v26 = *(void *)(v5 - 8);
  uint64_t v27 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchTime();
  uint64_t v24 = v8;
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v23 - v13;
  unint64_t v15 = *(void **)(v1 + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
  [v15 canEvaluatePolicy:1 error:0];
  [v15 biometryType];
  sub_10002B40C(0, (unint64_t *)&qword_10009E060);
  uint64_t v16 = (void *)static OS_dispatch_queue.main.getter();
  static DispatchTime.now()();
  + infix(_:_:)();
  uint64_t v17 = *(void (**)(char *, uint64_t))(v9 + 8);
  v17(v12, v8);
  uint64_t v18 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v18;
  *(void *)(v19 + 24) = a1;
  aBlock[4] = sub_100060408;
  aBlock[5] = v19;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  void aBlock[2] = sub_100029A40;
  void aBlock[3] = &unk_100088AB8;
  uint64_t v20 = _Block_copy(aBlock);
  swift_errorRetain();
  swift_release();
  static DispatchQoS.unspecified.getter();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_100060114((unint64_t *)&qword_10009D690, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100028560((uint64_t *)&unk_10009E070);
  sub_10002F3D8();
  uint64_t v21 = v25;
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
  _Block_release(v20);

  (*(void (**)(char *, uint64_t))(v28 + 8))(v4, v21);
  (*(void (**)(char *, uint64_t))(v26 + 8))(v7, v27);
  return ((uint64_t (*)(char *, uint64_t))v17)(v14, v24);
}

void sub_10005F9C8()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    id v2 = *(void **)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_context);
    [v2 canEvaluatePolicy:1 error:0];
    id v3 = [v2 biometryType];

    if (v3 == (id)1)
    {
      id v4 = [objc_allocWithZone((Class)UIImpactFeedbackGenerator) initWithStyle:2];
      [v4 impactOccurred];

      swift_allocObject();
      swift_beginAccess();
      uint64_t v5 = (void *)swift_unknownObjectWeakLoadStrong();
      swift_unknownObjectWeakInit();

      static Animation.default.getter();
      sub_100028560((uint64_t *)&unk_10009E190);
      withAnimation<A>(_:_:)();
      swift_release();
      swift_release();
    }
  }
}

uint64_t sub_10005FB2C()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_10005FB6C(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 32);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[2] = a1;
  _OWORD v5[3] = v4;
  v5[1] = sub_100042F88;
  return _swift_task_switch(sub_10005E944, 0, 0);
}

uint64_t sub_10005FC1C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10005FC54(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_100042F88;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10009E098 + dword_10009E098);
  return v6(a1, v4);
}

void *sub_10005FD0C()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_10005FD18()
{
  return type metadata accessor for AuthorizationViewModel();
}

uint64_t type metadata accessor for AuthorizationViewModel()
{
  uint64_t result = qword_10009F890;
  if (!qword_10009F890) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10005FD6C()
{
  sub_100060080(319, &qword_10009E0D0, (uint64_t)&type metadata for Bool, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
  if (v0 <= 0x3F)
  {
    sub_100039D9C(319, &qword_10009E0D8, &qword_10009E000);
    if (v1 <= 0x3F)
    {
      sub_100039D9C(319, &qword_10009E0E0, &qword_10009E018);
      if (v2 <= 0x3F)
      {
        sub_100060080(319, &qword_10009E0E8, (uint64_t)&type metadata for String, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
        if (v3 <= 0x3F)
        {
          sub_100060080(319, &qword_10009E0F0, (uint64_t)&type metadata for Int, (uint64_t (*)(void, uint64_t))&type metadata accessor for Published);
          if (v4 <= 0x3F)
          {
            type metadata accessor for Logger();
            if (v5 <= 0x3F) {
              swift_updateClassMetadata2();
            }
          }
        }
      }
    }
  }
}

void type metadata accessor for LACustomPasswordType(uint64_t a1)
{
}

void sub_100060080(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

uint64_t sub_1000600CC()
{
  return sub_100060114(&qword_10009E168, type metadata accessor for LACustomPasswordType);
}

uint64_t sub_100060114(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10006015C()
{
  return sub_100060114(&qword_10009E170, type metadata accessor for LACustomPasswordType);
}

uint64_t sub_1000601A4()
{
  return sub_100060114(&qword_10009E178, type metadata accessor for LACustomPasswordType);
}

uint64_t sub_1000601EC()
{
  unint64_t v1 = *(void **)(v0 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  id v2 = v1;
  static Published.subscript.setter();
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = v2;
  return static Published.subscript.setter();
}

void sub_100060318(BOOL *a1@<X8>)
{
  swift_beginAccess();
  uint64_t Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (!Strong) {
    goto LABEL_4;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  id v3 = (void (*)(unsigned char *, void))static Published.subscript.modify();
  if (!__OFADD__(*v4, 1))
  {
    ++*v4;
    v3(v5, 0);
    swift_release();
    swift_release();

LABEL_4:
    *a1 = Strong == 0;
    return;
  }
  __break(1u);
}

void sub_100060408()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v3 = (void *)Strong;
    if (v1)
    {
      if (*(unsigned char *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_fallbackMethod) == 2) {
        sub_10005BEA4(v1, Strong);
      }
      else {
        sub_10005D074(0);
      }
    }
    else
    {
      unint64_t v4 = (uint64_t *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
      unint64_t v5 = *(void (**)(void))(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
      if (v5)
      {
        swift_retain();
        v5(0);
        sub_10002A998((uint64_t)v5);
        uint64_t v6 = *v4;
        uint64_t *v4 = 0;
        v4[1] = 0;
        sub_10002A998(v6);
      }
    }
  }
}

uint64_t sub_1000604E4()
{
  swift_release();
  swift_errorRelease();
  swift_release();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_10006052C()
{
  return sub_10005C78C(v0[3], v0[4], v0[5], v0[6]);
}

uint64_t sub_100060540()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = (void *)Strong;
    sub_10005D4D8();
  }
  swift_beginAccess();
  uint64_t v2 = swift_unknownObjectWeakLoadStrong();
  if (v2)
  {
    id v3 = (void *)v2;
    sub_10005B554(0);
  }
  swift_beginAccess();
  if (swift_unknownObjectWeakLoadStrong())
  {
    swift_getKeyPath();
    swift_getKeyPath();
    static Published.subscript.setter();
  }
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    return static Published.subscript.setter();
  }
  return result;
}

uint64_t sub_100060684@<X0>(BOOL *a1@<X8>)
{
  swift_beginAccess();
  uint64_t result = swift_unknownObjectWeakLoadStrong();
  uint64_t v3 = result;
  if (result)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    uint64_t result = static Published.subscript.setter();
  }
  *a1 = v3 == 0;
  return result;
}

uint64_t sub_100060728()
{
  swift_release();
  swift_errorRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100060770()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 32);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    unint64_t v4 = (void *)Strong;
    unint64_t v5 = (uint64_t *)(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    uint64_t v6 = *(void (**)(uint64_t))(Strong + OBJC_IVAR____TtC10CoreAuthUI22AuthorizationViewModel_completion);
    if (v6)
    {
      swift_retain();
      v6(v1);
      sub_10002A998((uint64_t)v6);
      uint64_t v7 = *v5;
      uint64_t *v5 = 0;
      v5[1] = 0;
      sub_10002A998(v7);
    }
  }
  return v2();
}

void sub_100060834()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_10005BBBC(v1);
  }
}

BOOL sub_1000608FC()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  return v1 == (id)1;
}

id sub_100060958()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_10009FBA8 = (uint64_t)result;
  return result;
}

uint64_t sub_1000609AC(uint64_t a1)
{
  return sub_100060A30(a1, qword_10009FC50);
}

uint64_t sub_1000609CC()
{
  return sub_100060AF8(&qword_10009FBB0, (uint64_t)qword_10009FC50);
}

uint64_t sub_1000609F0@<X0>(uint64_t a1@<X8>)
{
  return sub_100060B70(&qword_10009FBB0, (uint64_t)qword_10009FC50, a1);
}

uint64_t sub_100060A14(uint64_t a1)
{
  return sub_100060A30(a1, qword_10009FC68);
}

uint64_t sub_100060A30(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = type metadata accessor for ImageResource();
  sub_1000565A0(v3, a2);
  sub_100055434(v3, (uint64_t)a2);
  if (qword_10009FBA0 != -1) {
    swift_once();
  }
  id v4 = (id)qword_10009FBA8;
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_100060AD4()
{
  return sub_100060AF8(&qword_10009FBB8, (uint64_t)qword_10009FC68);
}

uint64_t sub_100060AF8(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = type metadata accessor for ImageResource();

  return sub_100055434(v3, a2);
}

uint64_t sub_100060B4C@<X0>(uint64_t a1@<X8>)
{
  return sub_100060B70(&qword_10009FBB8, (uint64_t)qword_10009FC68, a1);
}

uint64_t sub_100060B70@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = type metadata accessor for ImageResource();
  uint64_t v6 = sub_100055434(v5, a2);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100060C2C(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid FaceIdLightweightTrailingViewState: %d", (uint8_t *)v2, 8u);
}

void sub_100060CA4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to open URL: %{public}@ error: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_100060D2C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100060DA4(int a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[FaceIdViewController _processCoachingFeedback:]";
  __int16 v5 = 1024;
  int v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s %d on %@", (uint8_t *)&v3, 0x1Cu);
}

void sub_100060E40(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Can't query SecureDoubleClick.", v1, 2u);
}

void sub_100060E84(NSObject *a1)
{
  id WeakRetained = objc_loadWeakRetained(&qword_10009E270);
  sub_10001600C();
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Skipping recovery of stale root controller %{public}@", v3, 0xCu);
}

void sub_100060F1C(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained(&qword_10009E270);
  int v5 = 138543618;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  id v8 = WeakRetained;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@ must replace a stale root controller %{public}@", (uint8_t *)&v5, 0x16u);
}

void sub_100060FD0()
{
  sub_10001600C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%{public}@ dealloc", v1, 0xCu);
}

void sub_100061044(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Timed out waiting for internal info", v1, 2u);
}

void sub_100061088()
{
  sub_10001600C();
  sub_100015FF0((void *)&_mh_execute_header, v0, v1, "XPC error connecting to remoteUIHost: %{public}@", v2, v3, v4, v5, v6);
}

void sub_1000610F0()
{
  sub_10001600C();
  sub_100015FF0((void *)&_mh_execute_header, v0, v1, "Error connecting to remoteUIHost: %{public}@", v2, v3, v4, v5, v6);
}

void sub_100061158(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 48);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "executing part 2, tid:%u", (uint8_t *)v3, 8u);
}

void sub_1000611D4(uint64_t a1, NSObject *a2)
{
  int v2 = *(_DWORD *)(a1 + 48);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "executing part 1, tid:%u", (uint8_t *)v3, 8u);
}

void sub_100061250()
{
  sub_10001600C();
  sub_100015FF0((void *)&_mh_execute_header, v0, v1, "Simulating a stale root controller: %@", v2, v3, v4, v5, v6);
}

void sub_1000612B8()
{
  sub_10001600C();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "Found error (%{public}@) while destroying %{public}@", v2, 0x16u);
}

void sub_100061340()
{
  sub_10001600C();
  sub_100015FF0((void *)&_mh_execute_header, v0, v1, "CoreAuthUI won't idle-exit: %{public}@", v2, v3, v4, v5, v6);
}

double sub_1000613A8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015FF0((void *)&_mh_execute_header, a1, a3, "CoreAuthUI failed to idle-exit by %.0f ms, retrying...", a5, a6, a7, a8, 0);
  return result;
}

void sub_100061424()
{
  sub_10001600C();
  sub_100015FF0((void *)&_mh_execute_header, v0, v1, "%{public}@ triggered UI watchdog", v2, v3, v4, v5, v6);
}

void sub_10006148C(char a1, unsigned char *a2, os_log_t log)
{
  uint64_t v3 = "all";
  if (a1) {
    uint64_t v3 = "portrait";
  }
  uint64_t v4 = "YES";
  if (!*a2) {
    uint64_t v4 = "NO";
  }
  int v5 = 136315394;
  uint8_t v6 = v3;
  __int16 v7 = 2080;
  id v8 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "supportedInterfaceOrientations: %s, _allowsLandscape: %s", (uint8_t *)&v5, 0x16u);
}

void sub_100061548(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color. Received empty payload.", v1, 2u);
}

void sub_10006158C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color. Received: '%{public}@'.", (uint8_t *)&v2, 0xCu);
}

void sub_100061604(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to unarchive tint color. Received unexpected payload type.", v1, 2u);
}

void sub_100061648()
{
  sub_10001E61C();
  sub_10001E634((void *)&_mh_execute_header, v0, v1, "Failed to post %{public}@: %{public}@");
}

void sub_1000616B0()
{
  sub_10001E61C();
  sub_10001E634((void *)&_mh_execute_header, v0, v1, "Failed to revoke %{public}@: %{public}@");
}

void sub_100061718(uint64_t a1, id *a2, NSObject *a3)
{
  unsigned int v5 = [*a2 count];
  int v6 = 138543618;
  uint64_t v7 = a1;
  __int16 v8 = 1024;
  unsigned int v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}@ was revoked and will complete when the presentable disappears, tracking %u completion handlers.", (uint8_t *)&v6, 0x12u);
}

void sub_1000617B8(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = NSStringFromLAPasscodeType();
  int v4 = 138412290;
  unsigned int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unrecognized passcode type: %@", (uint8_t *)&v4, 0xCu);
}

void sub_100061850(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown interface orientation.", v1, 2u);
}

void sub_100061894(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not set credential (%@)", (uint8_t *)&v1, 0xCu);
}

void sub_100061914(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Could not obtain remote proxy: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100061994()
{
  __assert_rtn("-[ScreenDimmingView setDimLevel:]", "ScreenDimmingView.m", 36, "dimLevel >= 0 && dimLevel <= 1");
}

uint64_t NSNotFound.getter()
{
  return NSNotFound.getter();
}

uint64_t static CharacterSet.whitespacesAndNewlines.getter()
{
  return static CharacterSet.whitespacesAndNewlines.getter();
}

uint64_t type metadata accessor for CharacterSet()
{
  return type metadata accessor for CharacterSet();
}

uint64_t DateComponents.minute.getter()
{
  return DateComponents.minute.getter();
}

uint64_t type metadata accessor for DateComponents()
{
  return type metadata accessor for DateComponents();
}

Swift::String __swiftcall NSLocalizedString(_:tableName:bundle:value:comment:)(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  uint64_t v5 = NSLocalizedString(_:tableName:bundle:value:comment:)(_._countAndFlagsBits, _._object, tableName.value._countAndFlagsBits, tableName.value._object, bundle.super.isa, value._countAndFlagsBits, value._object, comment._countAndFlagsBits);
  result._object = v6;
  result._uint64_t countAndFlagsBits = v5;
  return result;
}

uint64_t _convertErrorToNSError(_:)()
{
  return _convertErrorToNSError(_:)();
}

NSData __swiftcall Data._bridgeToObjectiveC()()
{
  return (NSData)Data._bridgeToObjectiveC()();
}

uint64_t static Data._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Date.timeIntervalSince(_:)()
{
  return Date.timeIntervalSince(_:)();
}

uint64_t Date.addingTimeInterval(_:)()
{
  return Date.addingTimeInterval(_:)();
}

uint64_t static Date.> infix(_:_:)()
{
  return static Date.> infix(_:_:)();
}

uint64_t static Date.now.getter()
{
  return static Date.now.getter();
}

uint64_t Date.compare(_:)()
{
  return Date.compare(_:)();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Calendar.dateComponents(_:from:to:)()
{
  return Calendar.dateComponents(_:from:to:)();
}

uint64_t static Calendar.current.getter()
{
  return static Calendar.current.getter();
}

uint64_t type metadata accessor for Calendar.Component()
{
  return type metadata accessor for Calendar.Component();
}

uint64_t type metadata accessor for Calendar()
{
  return type metadata accessor for Calendar();
}

uint64_t isFeatureEnabled(_:)()
{
  return isFeatureEnabled(_:)();
}

uint64_t ImageResource.init(name:bundle:)()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t type metadata accessor for ImageResource()
{
  return type metadata accessor for ImageResource();
}

uint64_t LACUIDTOViewController.init(configuration:handler:)()
{
  return LACUIDTOViewController.init(configuration:handler:)();
}

uint64_t dispatch thunk of LACUIDTOViewController.refresh(with:)()
{
  return dispatch thunk of LACUIDTOViewController.refresh(with:)();
}

uint64_t type metadata accessor for LACUIDTOViewController()
{
  return type metadata accessor for LACUIDTOViewController();
}

uint64_t type metadata accessor for LACUIAuthActionCountdown()
{
  return type metadata accessor for LACUIAuthActionCountdown();
}

uint64_t LACUIAuthButtonConfiguration.id.getter()
{
  return LACUIAuthButtonConfiguration.id.getter();
}

uint64_t type metadata accessor for LACUIAuthButtonConfiguration()
{
  return type metadata accessor for LACUIAuthButtonConfiguration();
}

uint64_t static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)()
{
  return static LACUIAuthCountdownConfiguration.gracePeriod(customCancelTitle:)();
}

uint64_t LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)()
{
  return LACUIAuthCountdownConfiguration.ActionButtonIdentifier.init(rawValue:)();
}

uint64_t type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier()
{
  return type metadata accessor for LACUIAuthCountdownConfiguration.ActionButtonIdentifier();
}

uint64_t static LACUIAuthCountdownConfiguration.== infix(_:_:)()
{
  return static LACUIAuthCountdownConfiguration.== infix(_:_:)();
}

uint64_t static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:familiarLocationsUnavailable:customCancelTitle:)()
{
  return static LACUIAuthCountdownConfiguration.begin(title:message:strictModeEnabled:showsLocationWarning:familiarLocationsUnavailable:customCancelTitle:)();
}

uint64_t static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)()
{
  return static LACUIAuthCountdownConfiguration.ready(message:customCancelTitle:)();
}

uint64_t static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)()
{
  return static LACUIAuthCountdownConfiguration.countdown(message:delayExpiration:customCancelTitle:)();
}

uint64_t type metadata accessor for LACUIAuthCountdownConfiguration()
{
  return type metadata accessor for LACUIAuthCountdownConfiguration();
}

uint64_t LACUIOnenessUnsatisfiablePresentationHandler.init(request:)()
{
  return LACUIOnenessUnsatisfiablePresentationHandler.init(request:)();
}

uint64_t type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler()
{
  return type metadata accessor for LACUIOnenessUnsatisfiablePresentationHandler();
}

uint64_t LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)()
{
  return LACUIDTOBiometryRequiredScenePresentationHandler.init(biometryType:alertFactory:)();
}

uint64_t type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler()
{
  return type metadata accessor for LACUIDTOBiometryRequiredScenePresentationHandler();
}

uint64_t LACUIDTOSensorNotTrustedScenePresentationHandler.init()()
{
  return LACUIDTOSensorNotTrustedScenePresentationHandler.init()();
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler()
{
  return type metadata accessor for LACUIDTOSensorNotTrustedScenePresentationHandler();
}

uint64_t LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()()
{
  return LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler.init()();
}

uint64_t type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler()
{
  return type metadata accessor for LACUIDTOSensorNotTrustedStrictModeScenePresentationHandler();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t Logger.init(subsystem:category:)()
{
  return Logger.init(subsystem:category:)();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t Publishers.CombineLatest4.init(_:_:_:_:)()
{
  return Publishers.CombineLatest4.init(_:_:_:_:)();
}

uint64_t Publishers.Map.map<A>(_:)()
{
  return Publishers.Map.map<A>(_:)();
}

uint64_t AnyCancellable.store(in:)()
{
  return AnyCancellable.store(in:)();
}

uint64_t type metadata accessor for AnyCancellable()
{
  return type metadata accessor for AnyCancellable();
}

uint64_t static ObservableObject.environmentStore.getter()
{
  return static ObservableObject.environmentStore.getter();
}

uint64_t ObservableObject<>.objectWillChange.getter()
{
  return ObservableObject<>.objectWillChange.getter();
}

uint64_t CurrentValueSubject.value.setter()
{
  return CurrentValueSubject.value.setter();
}

uint64_t CurrentValueSubject.init(_:)()
{
  return CurrentValueSubject.init(_:)();
}

uint64_t Published.init(initialValue:)()
{
  return Published.init(initialValue:)();
}

uint64_t Published.projectedValue.getter()
{
  return Published.projectedValue.getter();
}

uint64_t Published.projectedValue.setter()
{
  return Published.projectedValue.setter();
}

uint64_t static Published.subscript.modify()
{
  return static Published.subscript.modify();
}

uint64_t static Published.subscript.getter()
{
  return static Published.subscript.getter();
}

uint64_t static Published.subscript.setter()
{
  return static Published.subscript.setter();
}

uint64_t type metadata accessor for Published()
{
  return type metadata accessor for Published();
}

uint64_t Publisher.eraseToAnyPublisher()()
{
  return Publisher.eraseToAnyPublisher()();
}

uint64_t Publisher.compactMap<A>(_:)()
{
  return Publisher.compactMap<A>(_:)();
}

uint64_t Publisher.map<A>(_:)()
{
  return Publisher.map<A>(_:)();
}

uint64_t Publisher.scan<A>(_:_:)()
{
  return Publisher.scan<A>(_:_:)();
}

uint64_t Publisher.receive<A>(on:options:)()
{
  return Publisher.receive<A>(on:options:)();
}

uint64_t Publisher.debounce<A>(for:scheduler:options:)()
{
  return Publisher.debounce<A>(for:scheduler:options:)();
}

uint64_t Publisher<>.removeDuplicates()()
{
  return Publisher<>.removeDuplicates()();
}

uint64_t Publisher<>.sink(receiveValue:)()
{
  return Publisher<>.sink(receiveValue:)();
}

uint64_t static Animatable._makeAnimatable(value:inputs:)()
{
  return static Animatable._makeAnimatable(value:inputs:)();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)()
{
  return StrokeStyle.init(lineWidth:lineCap:lineJoin:miterLimit:dash:dashPhase:)();
}

uint64_t ScaledMetric.init(wrappedValue:)()
{
  return ScaledMetric.init(wrappedValue:)();
}

uint64_t ScaledMetric.wrappedValue.getter()
{
  return ScaledMetric.wrappedValue.getter();
}

uint64_t type metadata accessor for ScaledMetric()
{
  return type metadata accessor for ScaledMetric();
}

uint64_t static ViewModifier._makeView(modifier:inputs:body:)()
{
  return static ViewModifier._makeView(modifier:inputs:body:)();
}

uint64_t static ViewModifier._makeViewList(modifier:inputs:body:)()
{
  return static ViewModifier._makeViewList(modifier:inputs:body:)();
}

uint64_t static ViewModifier._viewListCount(inputs:body:)()
{
  return static ViewModifier._viewListCount(inputs:body:)();
}

uint64_t ViewModifier<>.body(content:)()
{
  return ViewModifier<>.body(content:)();
}

uint64_t _FrameLayout.init(width:height:alignment:)()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t AnyTransition.init<A>(_:)()
{
  return AnyTransition.init<A>(_:)();
}

uint64_t withAnimation<A>(_:_:)()
{
  return withAnimation<A>(_:_:)();
}

uint64_t static GeometryEffect._affectsLayout.getter()
{
  return static GeometryEffect._affectsLayout.getter();
}

uint64_t static GeometryEffect._viewListCount(inputs:body:)()
{
  return static GeometryEffect._viewListCount(inputs:body:)();
}

uint64_t MoveTransition.init(edge:)()
{
  return MoveTransition.init(edge:)();
}

uint64_t type metadata accessor for MoveTransition()
{
  return type metadata accessor for MoveTransition();
}

uint64_t static SafeAreaRegions.all.getter()
{
  return static SafeAreaRegions.all.getter();
}

uint64_t static SafeAreaRegions.container.getter()
{
  return static SafeAreaRegions.container.getter();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t EnvironmentObject.projectedValue.getter()
{
  return EnvironmentObject.projectedValue.getter();
}

uint64_t EnvironmentObject.error()()
{
  return EnvironmentObject.error()();
}

uint64_t EnvironmentObject.Wrapper.subscript.getter()
{
  return EnvironmentObject.Wrapper.subscript.getter();
}

uint64_t EnvironmentObject.init()()
{
  return EnvironmentObject.init()();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.multilineTextAlignment.getter()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t EnvironmentValues.multilineTextAlignment.setter()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t EnvironmentValues.font.getter()
{
  return EnvironmentValues.font.getter();
}

uint64_t EnvironmentValues.font.setter()
{
  return EnvironmentValues.font.setter();
}

uint64_t EnvironmentValues.lineLimit.getter()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t EnvironmentValues.lineLimit.setter()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t OpacityTransition.init()()
{
  return OpacityTransition.init()();
}

uint64_t type metadata accessor for OpacityTransition()
{
  return type metadata accessor for OpacityTransition();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t dispatch thunk of UIHostingController.sizingOptions.setter()
{
  return dispatch thunk of UIHostingController.sizingOptions.setter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t UIViewRepresentable._resetUIView(_:coordinator:destroy:)()
{
  return UIViewRepresentable._resetUIView(_:coordinator:destroy:)();
}

uint64_t static UIViewRepresentable.dismantleUIView(_:coordinator:)()
{
  return static UIViewRepresentable.dismantleUIView(_:coordinator:)();
}

uint64_t UIViewRepresentable.sizeThatFits(_:uiView:context:)()
{
  return UIViewRepresentable.sizeThatFits(_:uiView:context:)();
}

uint64_t static UIViewRepresentable._layoutOptions(_:)()
{
  return static UIViewRepresentable._layoutOptions(_:)();
}

uint64_t UIViewRepresentable._identifiedViewTree(in:)()
{
  return UIViewRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewRepresentable._overrideLayoutTraits(_:for:)()
{
  return UIViewRepresentable._overrideLayoutTraits(_:for:)();
}

uint64_t UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)()
{
  return UIViewRepresentable._overrideSizeThatFits(_:in:uiView:)();
}

uint64_t static UIViewRepresentable._modifyBridgedViewInputs(_:)()
{
  return static UIViewRepresentable._modifyBridgedViewInputs(_:)();
}

uint64_t UIViewRepresentable.body.getter()
{
  return UIViewRepresentable.body.getter();
}

uint64_t UIViewRepresentable<>.makeCoordinator()()
{
  return UIViewRepresentable<>.makeCoordinator()();
}

uint64_t _ConditionalContent<>.init(storage:)()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t BorderedProminentButtonStyle.init()()
{
  return BorderedProminentButtonStyle.init()();
}

uint64_t type metadata accessor for BorderedProminentButtonStyle()
{
  return type metadata accessor for BorderedProminentButtonStyle();
}

uint64_t UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)()
{
  return UIViewControllerRepresentable._resetUIViewController(_:coordinator:destroy:)();
}

uint64_t static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)()
{
  return static UIViewControllerRepresentable.dismantleUIViewController(_:coordinator:)();
}

uint64_t UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)()
{
  return UIViewControllerRepresentable.sizeThatFits(_:uiViewController:context:)();
}

uint64_t static UIViewControllerRepresentable._layoutOptions(_:)()
{
  return static UIViewControllerRepresentable._layoutOptions(_:)();
}

uint64_t UIViewControllerRepresentable._identifiedViewTree(in:)()
{
  return UIViewControllerRepresentable._identifiedViewTree(in:)();
}

uint64_t UIViewControllerRepresentable.body.getter()
{
  return UIViewControllerRepresentable.body.getter();
}

uint64_t UIViewControllerRepresentable<>.makeCoordinator()()
{
  return UIViewControllerRepresentable<>.makeCoordinator()();
}

uint64_t static UIHostingControllerSizingOptions.preferredContentSize.getter()
{
  return static UIHostingControllerSizingOptions.preferredContentSize.getter();
}

uint64_t type metadata accessor for UIHostingControllerSizingOptions()
{
  return type metadata accessor for UIHostingControllerSizingOptions();
}

uint64_t static Edge.Set.horizontal.getter()
{
  return static Edge.Set.horizontal.getter();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Edge.Set.top.getter()
{
  return static Edge.Set.top.getter();
}

uint64_t static Edge.Set.bottom.getter()
{
  return static Edge.Set.bottom.getter();
}

uint64_t static Edge.Set.vertical.getter()
{
  return static Edge.Set.vertical.getter();
}

uint64_t static Font.subheadline.getter()
{
  return static Font.subheadline.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.Weight.light.getter()
{
  return static Font.Weight.light.getter();
}

uint64_t static Font.Weight.semibold.getter()
{
  return static Font.Weight.semibold.getter();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
}

uint64_t static Font.system(_:design:weight:)()
{
  return static Font.system(_:design:weight:)();
}

uint64_t type metadata accessor for Font.TextStyle()
{
  return type metadata accessor for Font.TextStyle();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t static View._makeView(view:inputs:)()
{
  return static View._makeView(view:inputs:)();
}

uint64_t static View._makeViewList(view:inputs:)()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t View.buttonStyle<A>(_:)()
{
  return View.buttonStyle<A>(_:)();
}

uint64_t View.onTapGesture(count:perform:)()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.black.getter()
{
  return static Color.black.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
}

uint64_t static Color.secondary.getter()
{
  return static Color.secondary.getter();
}

uint64_t Image.init(uiImage:)()
{
  return Image.init(uiImage:)();
}

uint64_t Image.init(systemName:)()
{
  return Image.init(systemName:)();
}

uint64_t type metadata accessor for Image.ResizingMode()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t Image.resizable(capInsets:resizingMode:)()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t State.init(wrappedValue:)()
{
  return State.init(wrappedValue:)();
}

uint64_t State.wrappedValue.getter()
{
  return State.wrappedValue.getter();
}

uint64_t State.wrappedValue.setter()
{
  return State.wrappedValue.setter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init<A>(_:action:)()
{
  return Button<>.init<A>(_:action:)();
}

uint64_t AnyView.init<A>(_:)()
{
  return AnyView.init<A>(_:)();
}

uint64_t Binding.wrappedValue.getter()
{
  return Binding.wrappedValue.getter();
}

uint64_t Binding.wrappedValue.setter()
{
  return Binding.wrappedValue.setter();
}

uint64_t Binding.projectedValue.getter()
{
  return Binding.projectedValue.getter();
}

uint64_t type metadata accessor for Binding()
{
  return type metadata accessor for Binding();
}

uint64_t Divider.init()()
{
  return Divider.init()();
}

uint64_t type metadata accessor for Divider()
{
  return type metadata accessor for Divider();
}

uint64_t static Material.thick.getter()
{
  return static Material.thick.getter();
}

uint64_t type metadata accessor for Material()
{
  return type metadata accessor for Material();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
}

uint64_t static Animation.easeIn(duration:)()
{
  return static Animation.easeIn(duration:)();
}

uint64_t static Animation.linear(duration:)()
{
  return static Animation.linear(duration:)();
}

uint64_t static Animation.default.getter()
{
  return static Animation.default.getter();
}

uint64_t static Animation.easeOut(duration:)()
{
  return static Animation.easeOut(duration:)();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t type metadata accessor for DispatchQoS.QoSClass()
{
  return type metadata accessor for DispatchQoS.QoSClass();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t static DispatchTime.now()()
{
  return static DispatchTime.now()();
}

uint64_t type metadata accessor for DispatchTime()
{
  return type metadata accessor for DispatchTime();
}

uint64_t + infix(_:_:)()
{
  return + infix(_:_:)();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Dictionary.description.getter()
{
  return Dictionary.description.getter();
}

uint64_t dispatch thunk of Hashable._rawHashValue(seed:)()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t BidirectionalCollection<>.joined(separator:)()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String.localizedStringWithFormat(_:_:)()
{
  return static String.localizedStringWithFormat(_:_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.data(using:allowLossyConversion:)()
{
  return String.data(using:allowLossyConversion:)();
}

uint64_t static String.Encoding.utf8.getter()
{
  return static String.Encoding.utf8.getter();
}

uint64_t type metadata accessor for String.Encoding()
{
  return type metadata accessor for String.Encoding();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.count.getter()
{
  return String.count.getter();
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
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

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

NSNumber __swiftcall Int._bridgeToObjectiveC()()
{
  return (NSNumber)Int._bridgeToObjectiveC()();
}

uint64_t static Int._forceBridgeFromObjectiveC(_:result:)()
{
  return static Int._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static Int._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static Int._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Int._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)()
{
  return OS_dispatch_queue.asyncAfter(deadline:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

NSNumber __swiftcall NSNumber.init(integerLiteral:)(Swift::Int integerLiteral)
{
  return (NSNumber)NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerOptions()
{
  return type metadata accessor for NSRunLoop.SchedulerOptions();
}

uint64_t NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)()
{
  return NSRunLoop.SchedulerTimeType.Stride.init(floatLiteral:)();
}

uint64_t type metadata accessor for NSRunLoop.SchedulerTimeType.Stride()
{
  return type metadata accessor for NSRunLoop.SchedulerTimeType.Stride();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t StringProtocol.trimmingCharacters(in:)()
{
  return StringProtocol.trimmingCharacters(in:)();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t _HashTable.previousHole(before:)()
{
  return _HashTable.previousHole(before:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static AnyHashable.== infix(_:_:)()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t AnyHashable.init<A>(_:)()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t static _SetStorage.allocate(capacity:)()
{
  return static _SetStorage.allocate(capacity:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.copy(original:)()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t static _DictionaryStorage.resize(original:capacity:move:)()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t _SwiftNewtypeWrapper<>._toCustomAnyHashable()()
{
  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _bridgeAnythingToObjectiveC<A>(_:)()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t static Hasher._hash(seed:bytes:count:)()
{
  return static Hasher._hash(seed:bytes:count:)();
}

uint64_t static Hasher._hash(seed:_:)()
{
  return static Hasher._hash(seed:_:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Void __swiftcall Hasher._combine(_:)(Swift::UInt a1)
{
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformMakeTranslation(retstr, tx, ty);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return _CGColorEqualToColor(color1, color2);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t LACLightweightUIModeFromOptions()
{
  return _LACLightweightUIModeFromOptions();
}

uint64_t LACLogAlertUI()
{
  return _LACLogAlertUI();
}

uint64_t LACLogFaceIDUI()
{
  return _LACLogFaceIDUI();
}

uint64_t LACLogPasscodeUI()
{
  return _LACLogPasscodeUI();
}

uint64_t LACLogTouchIDUI()
{
  return _LACLogTouchIDUI();
}

uint64_t LACLogUI()
{
  return _LACLogUI();
}

uint64_t LALogForCategory()
{
  return _LALogForCategory();
}

uint64_t LALogSetProcessCategory()
{
  return _LALogSetProcessCategory();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGIsQuestionValid()
{
  return _MGIsQuestionValid();
}

uint64_t MKBGetDeviceLockStateInfo()
{
  return _MKBGetDeviceLockStateInfo();
}

uint64_t MKBUnlockDevice()
{
  return _MKBUnlockDevice();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t NSStringFromLACPasscodeType()
{
  return _NSStringFromLACPasscodeType();
}

uint64_t NSStringFromLAPasscodeType()
{
  return _NSStringFromLAPasscodeType();
}

uint64_t NSStringFromMechanismEventAndValue()
{
  return _NSStringFromMechanismEventAndValue();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return _UIAccessibilityIsBoldTextEnabled();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return _UIGraphicsGetCurrentContext();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return _UIKeyboardAutomaticIsOnScreen();
}

uint64_t UIKeyboardDisableAutomaticAppearance()
{
  return _UIKeyboardDisableAutomaticAppearance();
}

uint64_t UIKeyboardEnableAutomaticAppearance()
{
  return _UIKeyboardEnableAutomaticAppearance();
}

uint64_t UIKeyboardOrderOutAutomaticSkippingAnimation()
{
  return _UIKeyboardOrderOutAutomaticSkippingAnimation();
}

uint64_t UIRectCenteredXInRect()
{
  return _UIRectCenteredXInRect();
}

uint64_t UIRectCenteredXInRectScale()
{
  return _UIRectCenteredXInRectScale();
}

uint64_t UIRectIntegralWithScale()
{
  return _UIRectIntegralWithScale();
}

uint64_t UISystemFontForSize()
{
  return _UISystemFontForSize();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

uid_t geteuid(void)
{
  return _geteuid();
}

uid_t getuid(void)
{
  return _getuid();
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
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

uint64_t os_variant_allows_internal_security_policies()
{
  return _os_variant_allows_internal_security_policies();
}

long double sin(long double __x)
{
  return _sin(__x);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_deletedMethodError()
{
  return _swift_deletedMethodError();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return _swift_getOpaqueTypeConformance2();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return _swift_initEnumMetadataMultiPayload();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_retain_n()
{
  return _swift_retain_n();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectRetain_n()
{
  return _swift_unknownObjectRetain_n();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGRectValue(void *a1, const char *a2, ...)
{
  return _[a1 CGRectValue];
}

id objc_msgSend_SBUISA_systemApertureObstructedAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return [a1 SBUISA_systemApertureObstructedAreaLayoutGuide];
}

id objc_msgSend__activateKeypadView(void *a1, const char *a2, ...)
{
  return _[a1 _activateKeypadView];
}

id objc_msgSend__addActionWithTitle_style_handler_shouldDismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addActionWithTitle:style:handler:shouldDismissHandler:");
}

id objc_msgSend__adjustToastSizeForAccessibilityIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _adjustToastSizeForAccessibilityIfNeeded];
}

id objc_msgSend__anchorToastViewToView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anchorToastViewToView:");
}

id objc_msgSend__animationForState_propertyName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animationForState:propertyName:");
}

id objc_msgSend__backdropRenderingHintColor(void *a1, const char *a2, ...)
{
  return _[a1 _backdropRenderingHintColor];
}

id objc_msgSend__backdropStyle(void *a1, const char *a2, ...)
{
  return _[a1 _backdropStyle];
}

id objc_msgSend__backgroundStyle(void *a1, const char *a2, ...)
{
  return _[a1 _backgroundStyle];
}

id objc_msgSend__backoffTimeout(void *a1, const char *a2, ...)
{
  return _[a1 _backoffTimeout];
}

id objc_msgSend__cancel(void *a1, const char *a2, ...)
{
  return _[a1 _cancel];
}

id objc_msgSend__centeringAnchorWithObstructedLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 _centeringAnchorWithObstructedLayoutGuide:];
}

id objc_msgSend__checkClearForIdleExit(void *a1, const char *a2, ...)
{
  return _[a1 _checkClearForIdleExit];
}

id objc_msgSend__checkDismissalCompletion(void *a1, const char *a2, ...)
{
  return _[a1 _checkDismissalCompletion];
}

id objc_msgSend__clearTimer(void *a1, const char *a2, ...)
{
  return _[a1 _clearTimer];
}

id objc_msgSend__coachingTextForFeedback_(void *a1, const char *a2, ...)
{
  return [a1 _coachingTextForFeedback:];
}

id objc_msgSend__configureAndShowAlertController(void *a1, const char *a2, ...)
{
  return _[a1 _configureAndShowAlertController];
}

id objc_msgSend__createBlurView(void *a1, const char *a2, ...)
{
  return _[a1 _createBlurView];
}

id objc_msgSend__createGlyphViewForRetryUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createGlyphViewForRetryUI:");
}

id objc_msgSend__deactivateKeypadView(void *a1, const char *a2, ...)
{
  return _[a1 _deactivateKeypadView];
}

id objc_msgSend__destroyViewControllers(void *a1, const char *a2, ...)
{
  return _[a1 _destroyViewControllers];
}

id objc_msgSend__dismissAlertWithDelay_temporarily_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissAlertWithDelay:temporarily:completion:");
}

id objc_msgSend__dismissChild_andRoot_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissChild:andRoot:reason:completion:");
}

id objc_msgSend__dismissCoachingViews(void *a1, const char *a2, ...)
{
  return _[a1 _dismissCoachingViews];
}

id objc_msgSend__dismissKeypad(void *a1, const char *a2, ...)
{
  return _[a1 _dismissKeypad];
}

id objc_msgSend__dismissRemoteUIWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _dismissRemoteUIWithCompletionHandler:];
}

id objc_msgSend__dismissRootWithReason_completion_(void *a1, const char *a2, ...)
{
  return [_dismissRootWithReason:completion:];
}

id objc_msgSend__dismissToastWithDelay_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dismissToastWithDelay:completion:");
}

id objc_msgSend__dismissUIWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 _dismissUIWithCompletionHandler:];
}

id objc_msgSend__dispatchBackoffTimer(void *a1, const char *a2, ...)
{
  return _[a1 _dispatchBackoffTimer];
}

id objc_msgSend__dispatchTapBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dispatchTapBlock:");
}

id objc_msgSend__effectForBlurEffect_vibrancyStyle_(void *a1, const char *a2, ...)
{
  return [a1 _effectForBlurEffect:vibrancyStyle:];
}

id objc_msgSend__embedSubview_(void *a1, const char *a2, ...)
{
  return [a1 _embedSubview:];
}

id objc_msgSend__enterPassword(void *a1, const char *a2, ...)
{
  return _[a1 _enterPassword];
}

id objc_msgSend__enterPin(void *a1, const char *a2, ...)
{
  return _[a1 _enterPin];
}

id objc_msgSend__glyphAnchorWithObstructedLayoutGuide_(void *a1, const char *a2, ...)
{
  return [a1 _glyphAnchorWithObstructedLayoutGuide:];
}

id objc_msgSend__handleBioLockout_(void *a1, const char *a2, ...)
{
  return [a1 _handleBioLockout:];
}

id objc_msgSend__handleBiometryNoMatch(void *a1, const char *a2, ...)
{
  return _[a1 _handleBiometryNoMatch];
}

id objc_msgSend__handleBiometryRequiredEnterPasscode(void *a1, const char *a2, ...)
{
  return _[a1 _handleBiometryRequiredEnterPasscode];
}

id objc_msgSend__handleBiometryRequiredFailure(void *a1, const char *a2, ...)
{
  return _[a1 _handleBiometryRequiredFailure];
}

id objc_msgSend__handleIdleExitResponse_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleIdleExitResponse:error:");
}

id objc_msgSend__handleMatch(void *a1, const char *a2, ...)
{
  return _[a1 _handleMatch];
}

id objc_msgSend__handleNoMatchOrSensorInactive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNoMatchOrSensorInactive:");
}

id objc_msgSend__handleSensorActive(void *a1, const char *a2, ...)
{
  return _[a1 _handleSensorActive];
}

id objc_msgSend__handleToastPresented(void *a1, const char *a2, ...)
{
  return _[a1 _handleToastPresented];
}

id objc_msgSend__hasBlurredBackground(void *a1, const char *a2, ...)
{
  return _[a1 _hasBlurredBackground];
}

id objc_msgSend__hasTranslucentBackground(void *a1, const char *a2, ...)
{
  return _[a1 _hasTranslucentBackground];
}

id objc_msgSend__headerContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _headerContentViewController];
}

id objc_msgSend__hideGlyphWithSpecialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_hideGlyphWithSpecialUi:");
}

id objc_msgSend__holdPresentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 _holdPresentingViewController];
}

id objc_msgSend__interfaceOrientationFromObstructedArea_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_interfaceOrientationFromObstructedArea:");
}

id objc_msgSend__isCollapsingFromFullExpansion(void *a1, const char *a2, ...)
{
  return _[a1 _isCollapsingFromFullExpansion];
}

id objc_msgSend__isEarlyExpansion(void *a1, const char *a2, ...)
{
  return _[a1 _isEarlyExpansion];
}

id objc_msgSend__isRootControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 _isRootControllerClass];
}

id objc_msgSend__isSensorActive(void *a1, const char *a2, ...)
{
  return _[a1 _isSensorActive];
}

id objc_msgSend__isSuccessfulState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSuccessfulState:");
}

id objc_msgSend__layoutGlyph(void *a1, const char *a2, ...)
{
  return _[a1 _layoutGlyph];
}

id objc_msgSend__layoutSubviewsWithKeyboard_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_layoutSubviewsWithKeyboard:");
}

id objc_msgSend__leadingViewStateFromGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_leadingViewStateFromGlyphState:");
}

id objc_msgSend__lightweightJindoContainerSize(void *a1, const char *a2, ...)
{
  return _[a1 _lightweightJindoContainerSize];
}

id objc_msgSend__lightweightJindoContentShiftOnLeading_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoContentShiftOnLeading:");
}

id objc_msgSend__lightweightJindoContentSizeForExpansion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoContentSizeForExpansion:");
}

id objc_msgSend__lightweightJindoExpansion(void *a1, const char *a2, ...)
{
  return _[a1 _lightweightJindoExpansion];
}

id objc_msgSend__lightweightJindoExpansionForState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lightweightJindoExpansionForState:");
}

id objc_msgSend__lockStyleForPasscodeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lockStyleForPasscodeType:");
}

id objc_msgSend__mechanismEvent_value_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_mechanismEvent:value:reply:");
}

id objc_msgSend__notifyPasscodeVerificationFinishedWithSuccess_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyPasscodeVerificationFinishedWithSuccess:");
}

id objc_msgSend__opacityForState_(void *a1, const char *a2, ...)
{
  return [a1 _opacityForState:];
}

id objc_msgSend__passwordConfirm(void *a1, const char *a2, ...)
{
  return _[a1 _passwordConfirm];
}

id objc_msgSend__passwordEntered(void *a1, const char *a2, ...)
{
  return _[a1 _passwordEntered];
}

id objc_msgSend__passwordNext(void *a1, const char *a2, ...)
{
  return _[a1 _passwordNext];
}

id objc_msgSend__performOnMainQueueWhenAppeared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performOnMainQueueWhenAppeared:");
}

id objc_msgSend__presentAlertAnimated_specialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentAlertAnimated:specialUi:");
}

id objc_msgSend__presentToast(void *a1, const char *a2, ...)
{
  return _[a1 _presentToast];
}

id objc_msgSend__presentUI_(void *a1, const char *a2, ...)
{
  return [a1 _presentUI:];
}

id objc_msgSend__processCoachingFeedback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processCoachingFeedback:");
}

id objc_msgSend__releasePresentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 _releasePresentingViewController];
}

id objc_msgSend__remainingMinDisplayTime(void *a1, const char *a2, ...)
{
  return _[a1 _remainingMinDisplayTime];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return _[a1 _remoteViewControllerProxy];
}

id objc_msgSend__remoteViewControllerProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_remoteViewControllerProxyWithErrorHandler:");
}

id objc_msgSend__removePreviousBackgroundFromView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_removePreviousBackgroundFromView:");
}

id objc_msgSend__resetUI(void *a1, const char *a2, ...)
{
  return _[a1 _resetUI];
}

id objc_msgSend__rootSheetPresentationController(void *a1, const char *a2, ...)
{
  return _[a1 _rootSheetPresentationController];
}

id objc_msgSend__roundRectToPixel_(void *a1, const char *a2, ...)
{
  return [a1 _roundRectToPixel:];
}

id objc_msgSend__roundToPixel_(void *a1, const char *a2, ...)
{
  return [a1 _roundToPixel:];
}

id objc_msgSend__sceneSessions(void *a1, const char *a2, ...)
{
  return _[a1 _sceneSessions];
}

id objc_msgSend__scheduleIdleExit(void *a1, const char *a2, ...)
{
  return _[a1 _scheduleIdleExit];
}

id objc_msgSend__setActionButtons(void *a1, const char *a2, ...)
{
  return _[a1 _setActionButtons];
}

id objc_msgSend__setActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setActions:");
}

id objc_msgSend__setActivityWatchdog(void *a1, const char *a2, ...)
{
  return _[a1 _setActivityWatchdog];
}

id objc_msgSend__setBackdropEnabled_(void *a1, const char *a2, ...)
{
  return [a1 _setBackdropEnabled:];
}

id objc_msgSend__setBackdropEnabled_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setBackdropEnabled:animated:");
}

id objc_msgSend__setContainerIgnoresDirectTouchEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setContainerIgnoresDirectTouchEvents:");
}

id objc_msgSend__setCredential_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCredential:");
}

id objc_msgSend__setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setFont:");
}

id objc_msgSend__setGlyphState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlyphState:animated:");
}

id objc_msgSend__setGlyphToNoMatchWithSpecialUi_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setGlyphToNoMatchWithSpecialUi:");
}

id objc_msgSend__setHeaderContentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHeaderContentViewController:");
}

id objc_msgSend__setShouldScaleDownBehindDescendantSheets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldScaleDownBehindDescendantSheets:");
}

id objc_msgSend__setState_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setState:animated:");
}

id objc_msgSend__setTransformScale_(void *a1, const char *a2, ...)
{
  return [a1 _setTransformScale:];
}

id objc_msgSend__setup(void *a1, const char *a2, ...)
{
  return _[a1 _setup];
}

id objc_msgSend__setupAlertController(void *a1, const char *a2, ...)
{
  return _[a1 _setupAlertController];
}

id objc_msgSend__setupAlertControllerActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupAlertControllerActions:");
}

id objc_msgSend__setupCoachingView(void *a1, const char *a2, ...)
{
  return _[a1 _setupCoachingView];
}

id objc_msgSend__setupConnection(void *a1, const char *a2, ...)
{
  return _[a1 _setupConnection];
}

id objc_msgSend__setupDimming(void *a1, const char *a2, ...)
{
  return _[a1 _setupDimming];
}

id objc_msgSend__setupForFixedLength(void *a1, const char *a2, ...)
{
  return _[a1 _setupForFixedLength];
}

id objc_msgSend__setupForVariableLength(void *a1, const char *a2, ...)
{
  return _[a1 _setupForVariableLength];
}

id objc_msgSend__setupGlyph(void *a1, const char *a2, ...)
{
  return _[a1 _setupGlyph];
}

id objc_msgSend__setupGlyphWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupGlyphWrapper:");
}

id objc_msgSend__setupHeaderContentViewController(void *a1, const char *a2, ...)
{
  return _[a1 _setupHeaderContentViewController];
}

id objc_msgSend__setupSecureView(void *a1, const char *a2, ...)
{
  return _[a1 _setupSecureView];
}

id objc_msgSend__setupSpinnerView(void *a1, const char *a2, ...)
{
  return _[a1 _setupSpinnerView];
}

id objc_msgSend__setupSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _setupSubviews];
}

id objc_msgSend__setupToastView(void *a1, const char *a2, ...)
{
  return _[a1 _setupToastView];
}

id objc_msgSend__setupToastWithGlyph_(void *a1, const char *a2, ...)
{
  return [a1 _setupToastWithGlyph:];
}

id objc_msgSend__setupView(void *a1, const char *a2, ...)
{
  return _[a1 _setupView];
}

id objc_msgSend__shake_(void *a1, const char *a2, ...)
{
  return [a1 _shake:];
}

id objc_msgSend__shakePasscodeFieldWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shakePasscodeFieldWithCompletion:");
}

id objc_msgSend__shouldCancelForApplicationChange(void *a1, const char *a2, ...)
{
  return _[a1 _shouldCancelForApplicationChange];
}

id objc_msgSend__shouldHideStatusBarForController_(void *a1, const char *a2, ...)
{
  return [a1 _shouldHideStatusBarForController];
}

id objc_msgSend__shouldRegisterForApplicationChange(void *a1, const char *a2, ...)
{
  return _[a1 _shouldRegisterForApplicationChange];
}

id objc_msgSend__shouldSimulateStaleRootController(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSimulateStaleRootController];
}

id objc_msgSend__shouldSkipStaleRootControllerRecovery(void *a1, const char *a2, ...)
{
  return _[a1 _shouldSkipStaleRootControllerRecovery];
}

id objc_msgSend__showBackOffView(void *a1, const char *a2, ...)
{
  return _[a1 _showBackOffView];
}

id objc_msgSend__showBackoffScreenWithMinsUntilUnblocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showBackoffScreenWithMinsUntilUnblocked:");
}

id objc_msgSend__showFailAlert(void *a1, const char *a2, ...)
{
  return _[a1 _showFailAlert];
}

id objc_msgSend__showGlyph_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showGlyph:animated:");
}

id objc_msgSend__showPasscodeScreen(void *a1, const char *a2, ...)
{
  return _[a1 _showPasscodeScreen];
}

id objc_msgSend__showPasscodeView(void *a1, const char *a2, ...)
{
  return _[a1 _showPasscodeView];
}

id objc_msgSend__shrinkAndRevokeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shrinkAndRevokeWithCompletion:");
}

id objc_msgSend__style(void *a1, const char *a2, ...)
{
  return _[a1 _style];
}

id objc_msgSend__switchToBackoffScreen_(void *a1, const char *a2, ...)
{
  return [a1 _switchToBackoffScreen:];
}

id objc_msgSend__systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 _systemImageNamed:withConfiguration:];
}

id objc_msgSend__textColor(void *a1, const char *a2, ...)
{
  return _[a1 _textColor];
}

id objc_msgSend__tintColorForState_(void *a1, const char *a2, ...)
{
  return [a1 _tintColorForState:];
}

id objc_msgSend__toastAnimationFadeIn_finished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_toastAnimationFadeIn:finished:");
}

id objc_msgSend__toastViewContraints(void *a1, const char *a2, ...)
{
  return _[a1 _toastViewContraints];
}

id objc_msgSend__trailingViewStateForGlyphState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_trailingViewStateForGlyphState:");
}

id objc_msgSend__uiCancelWithUnderlyingError(void *a1, const char *a2, ...)
{
  return _[a1 _uiCancelWithUnderlyingError];
}

id objc_msgSend__updateConstraint_ofView_anchor1_anchor2_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateConstraint:ofView:anchor1:anchor2:constant:");
}

id objc_msgSend__updateCurrentAppearanceIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _updateCurrentAppearanceIfNeeded];
}

id objc_msgSend__updateGlyphConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _updateGlyphConstraints];
}

id objc_msgSend__updateLightweightConstraints(void *a1, const char *a2, ...)
{
  return _[a1 _updateLightweightConstraints];
}

id objc_msgSend__updateLightweightConstraintsWithCoordinatedAnimations(void *a1, const char *a2, ...)
{
  return _[a1 _updateLightweightConstraintsWithCoordinatedAnimations];
}

id objc_msgSend__updateLightweightContentSize(void *a1, const char *a2, ...)
{
  return _[a1 _updateLightweightContentSize];
}

id objc_msgSend__updateOpacityForState_animated_(void *a1, const char *a2, ...)
{
  return [a1 _updateOpacityForState:animated:];
}

id objc_msgSend__updatePearlViews(void *a1, const char *a2, ...)
{
  return _[a1 _updatePearlViews];
}

id objc_msgSend__updateStyle(void *a1, const char *a2, ...)
{
  return _[a1 _updateStyle];
}

id objc_msgSend__updateTintColorForState_animated_(void *a1, const char *a2, ...)
{
  return [a1 _updateTintColorForState:animated:];
}

id objc_msgSend__updateUI(void *a1, const char *a2, ...)
{
  return _[a1 _updateUI];
}

id objc_msgSend__useDotPattern(void *a1, const char *a2, ...)
{
  return _[a1 _useDotPattern];
}

id objc_msgSend__useWhitePasscodeScreen(void *a1, const char *a2, ...)
{
  return _[a1 _useWhitePasscodeScreen];
}

id objc_msgSend__verifyTextField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_verifyTextField:");
}

id objc_msgSend_accessoryView(void *a1, const char *a2, ...)
{
  return _[a1 accessoryView];
}

id objc_msgSend_actionBackoffWithReply_(void *a1, const char *a2, ...)
{
  return [a1 actionBackoffWithReply:];
}

id objc_msgSend_actionFailureWithReply_(void *a1, const char *a2, ...)
{
  return [a1 actionFailureWithReply:];
}

id objc_msgSend_actionSuccess(void *a1, const char *a2, ...)
{
  return _[a1 actionSuccess];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return _[a1 actions];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activeStateWithTitle_subtitle_accessoryView_(void *a1, const char *a2, ...)
{
  return [a1 activeStateWithTitle:subtitle:accessoryView:];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addAnimation_forKey_(void *a1, const char *a2, ...)
{
  return [a1 addAnimation:forKey:];
}

id objc_msgSend_addArrangedSubview_(void *a1, const char *a2, ...)
{
  return [a1 addArrangedSubview:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addConstraint_(void *a1, const char *a2, ...)
{
  return [a1 addConstraint:];
}

id objc_msgSend_addGestureRecognizer_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_addTextFieldWithConfigurationHandler_(void *a1, const char *a2, ...)
{
  return [a1 addTextFieldWithConfigurationHandler:];
}

id objc_msgSend_alertActionsFromOptions_event_(void *a1, const char *a2, ...)
{
  return [a1 alertActionsFromOptions:event:];
}

id objc_msgSend_alertController(void *a1, const char *a2, ...)
{
  return _[a1 alertController];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alertTintFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 alertTintFromOptions:];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_alphanumericFieldPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 alphanumericFieldPlaceholder];
}

id objc_msgSend_alphanumericFieldTextAlignment(void *a1, const char *a2, ...)
{
  return _[a1 alphanumericFieldTextAlignment];
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_animateToFailureStateWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 animateToFailureStateWithCompletion:];
}

id objc_msgSend_animateToSucessStateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateToSucessStateWithCompletion:");
}

id objc_msgSend_animateWithDuration_animations_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:];
}

id objc_msgSend_animateWithDuration_delay_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:options:animations:completion:];
}

id objc_msgSend_animateWithDuration_delay_usingSpringWithDamping_initialSpringVelocity_options_animations_completion_(void *a1, const char *a2, ...)
{
  return [a1 animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:];
}

id objc_msgSend_animating(void *a1, const char *a2, ...)
{
  return _[a1 animating];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_appeared(void *a1, const char *a2, ...)
{
  return _[a1 appeared];
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return [a1 appendString:];
}

id objc_msgSend_applyBackgroundForStyle_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applyBackgroundForStyle:toView:");
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return _[a1 arrangedSubviews];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_authenticationSubtitle(void *a1, const char *a2, ...)
{
  return _[a1 authenticationSubtitle];
}

id objc_msgSend_authenticationTitle(void *a1, const char *a2, ...)
{
  return _[a1 authenticationTitle];
}

id objc_msgSend_backOffStateWithTitle_subtitle_(void *a1, const char *a2, ...)
{
  return [a1 backOffStateWithTitle:subtitle:];
}

id objc_msgSend_backgroundStyle(void *a1, const char *a2, ...)
{
  return _[a1 backgroundStyle];
}

id objc_msgSend_backoffCounter(void *a1, const char *a2, ...)
{
  return _[a1 backoffCounter];
}

id objc_msgSend_bannerSource(void *a1, const char *a2, ...)
{
  return _[a1 bannerSource];
}

id objc_msgSend_bannerSourceForDestination_forRequesterIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 bannerSourceForDestination:forRequesterIdentifier:];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_bezierPathWithRect_(void *a1, const char *a2, ...)
{
  return [a1 bezierPathWithRect:];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bringSubviewToFront_(void *a1, const char *a2, ...)
{
  return [a1 bringSubviewToFront:];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleRecordWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithType:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cachedExternalizedContext(void *a1, const char *a2, ...)
{
  return _[a1 cachedExternalizedContext];
}

id objc_msgSend_callerBundleId(void *a1, const char *a2, ...)
{
  return _[a1 callerBundleId];
}

id objc_msgSend_callerName(void *a1, const char *a2, ...)
{
  return _[a1 callerName];
}

id objc_msgSend_callerNameOverride(void *a1, const char *a2, ...)
{
  return _[a1 callerNameOverride];
}

id objc_msgSend_callerRunningOnForeground_pid_(void *a1, const char *a2, ...)
{
  return [a1 callerRunningOnForeground:pid:];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_checkClearForIdleExitWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 checkClearForIdleExitWithCompletion:];
}

id objc_msgSend_childControllerFor_type_allowsLandscape_(void *a1, const char *a2, ...)
{
  return [a1 childControllerFor:type:allowsLandscape:];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return [a1 colorWithAlphaComponent:];
}

id objc_msgSend_colorWithRed_green_blue_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithRed:green:blue:alpha:];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return _[a1 combinedTintColor];
}

id objc_msgSend_configuration(void *a1, const char *a2, ...)
{
  return _[a1 configuration];
}

id objc_msgSend_configurationWithTextStyle_scale_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithTextStyle:scale:];
}

id objc_msgSend_connectRemoteUI_reply_(void *a1, const char *a2, ...)
{
  return [a1 connectRemoteUI:reply:];
}

id objc_msgSend_connectedScenes(void *a1, const char *a2, ...)
{
  return _[a1 connectedScenes];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToAnchor:];
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintEqualToConstant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:constant:];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentsMultiplyColor(void *a1, const char *a2, ...)
{
  return _[a1 contentsMultiplyColor];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_createDefaultConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 createDefaultConfiguration];
}

id objc_msgSend_createSystemApertureConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 createSystemApertureConfiguration];
}

id objc_msgSend_ctkPin(void *a1, const char *a2, ...)
{
  return _[a1 ctkPin];
}

id objc_msgSend_currentBackoffErrorWithReply_(void *a1, const char *a2, ...)
{
  return [a1 currentBackoffErrorWithReply:];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentDeviceScreenSize(void *a1, const char *a2, ...)
{
  return _[a1 currentDeviceScreenSize];
}

id objc_msgSend_currentPasscode(void *a1, const char *a2, ...)
{
  return _[a1 currentPasscode];
}

id objc_msgSend_currentTraitCollection(void *a1, const char *a2, ...)
{
  return _[a1 currentTraitCollection];
}

id objc_msgSend_darkGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 darkGrayColor];
}

id objc_msgSend_darkStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return [a1 darkStyleWithBackgroundStyle:];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return _[a1 deactivate];
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 deactivateConstraints:];
}

id objc_msgSend_decodeLocalizationKeyFromString_shouldUseDeviceVariant_(void *a1, const char *a2, ...)
{
  return [a1 decodeLocalizationKeyFromString:shouldUseDeviceVariant:];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return [a1 defaultStyleWithBackgroundStyle:];
}

id objc_msgSend_defaultTextAttributes(void *a1, const char *a2, ...)
{
  return _[a1 defaultTextAttributes];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegates(void *a1, const char *a2, ...)
{
  return _[a1 delegates];
}

id objc_msgSend_deleteBackward(void *a1, const char *a2, ...)
{
  return _[a1 deleteBackward];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_didReceiveAuthenticationData(void *a1, const char *a2, ...)
{
  return _[a1 didReceiveAuthenticationData];
}

id objc_msgSend_dimmingView(void *a1, const char *a2, ...)
{
  return _[a1 dimmingView];
}

id objc_msgSend_disableUpdateMask(void *a1, const char *a2, ...)
{
  return _[a1 disableUpdateMask];
}

id objc_msgSend_disappeared(void *a1, const char *a2, ...)
{
  return _[a1 disappeared];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_dismissChildWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dismissChildWithCompletionHandler:];
}

id objc_msgSend_dismissRemoteUIWasInvalidated_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dismissRemoteUIWasInvalidated:completionHandler:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_dismissWithDelay_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissWithDelay:completion:];
}

id objc_msgSend_dismissingTemporarily(void *a1, const char *a2, ...)
{
  return _[a1 dismissingTemporarily];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dtoLearnMoreLinkURL(void *a1, const char *a2, ...)
{
  return _[a1 dtoLearnMoreLinkURL];
}

id objc_msgSend_effectWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 effectWithStyle:];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_error_hasCode_(void *a1, const char *a2, ...)
{
  return [a1 error:hasCode:];
}

id objc_msgSend_errorWithCode_debugDescription_(void *a1, const char *a2, ...)
{
  return [a1 errorWithCode:debugDescription:];
}

id objc_msgSend_errorWithCode_message_(void *a1, const char *a2, ...)
{
  return [a1 errorWithCode:message:];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_externalizedContext(void *a1, const char *a2, ...)
{
  return _[a1 externalizedContext];
}

id objc_msgSend_faceIDCameraOrientation(void *a1, const char *a2, ...)
{
  return _[a1 faceIDCameraOrientation];
}

id objc_msgSend_faceLayer(void *a1, const char *a2, ...)
{
  return _[a1 faceLayer];
}

id objc_msgSend_fallbackActionFromOptions_(void *a1, const char *a2, ...)
{
  return [a1 fallbackActionFromOptions:];
}

id objc_msgSend_fill(void *a1, const char *a2, ...)
{
  return _[a1 fill];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_functionWithControlPoints__::(void *a1, const char *a2, ...)
{
  return [a1 functionWithControlPoints:];
}

id objc_msgSend_globalUserInitiatedConcurrentQueue(void *a1, const char *a2, ...)
{
  return _[a1 globalUserInitiatedConcurrentQueue];
}

id objc_msgSend_glyphView(void *a1, const char *a2, ...)
{
  return _[a1 glyphView];
}

id objc_msgSend_hasAlphaNumericPasscode(void *a1, const char *a2, ...)
{
  return _[a1 hasAlphaNumericPasscode];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_idleTimerDisable_(void *a1, const char *a2, ...)
{
  return [a1 idleTimerDisable:];
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:inBundle:];
}

id objc_msgSend_impactOccurred(void *a1, const char *a2, ...)
{
  return _[a1 impactOccurred];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithDefaultSize(void *a1, const char *a2, ...)
{
  return _[a1 initWithDefaultSize];
}

id objc_msgSend_initWithEffect_(void *a1, const char *a2, ...)
{
  return [a1 initWithEffect:];
}

id objc_msgSend_initWithExternalizationDelegate_(void *a1, const char *a2, ...)
{
  return [a1 initWithExternalizationDelegate:];
}

id objc_msgSend_initWithExternalizedContext_(void *a1, const char *a2, ...)
{
  return [a1 initWithExternalizedContext:];
}

id objc_msgSend_initWithGlyph_presentingController_title_lightweightUIMode_(void *a1, const char *a2, ...)
{
  return [a1 initWithGlyph:presentingController:title:lightweightUIMode:];
}

id objc_msgSend_initWithGlyphView_(void *a1, const char *a2, ...)
{
  return [a1 initWithGlyphView:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithInitialState_(void *a1, const char *a2, ...)
{
  return [a1 initWithInitialState:];
}

id objc_msgSend_initWithInternalInfo_mechanism_backoffCounter_remoteUIHost_allowsLandscape_(void *a1, const char *a2, ...)
{
  return [a1 initWithInternalInfo:mechanism:backoffCounter:remoteUIHost:allowsLandscape:];
}

id objc_msgSend_initWithInternalInfo_parent_allowsLandscape_(void *a1, const char *a2, ...)
{
  return [a1 initWithInternalInfo:parent:allowsLandscape:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithName_sessionRole_(void *a1, const char *a2, ...)
{
  return [a1 initWithName:sessionRole:];
}

id objc_msgSend_initWithPasscode_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithPasscode:options:];
}

id objc_msgSend_initWithPinLength_minLength_maxLength_charset_(void *a1, const char *a2, ...)
{
  return [a1 initWithPinLength:minLength:maxLength:charset:];
}

id objc_msgSend_initWithRawValue_backgroundStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithRawValue:backgroundStyle:];
}

id objc_msgSend_initWithRawValue_title_subtitle_accessoryView_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithRawValue:title:subtitle:accessoryView:style:];
}

id objc_msgSend_initWithSettings_(void *a1, const char *a2, ...)
{
  return [a1 initWithSettings:];
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithStyle:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return [a1 initWithType:];
}

id objc_msgSend_insertText_(void *a1, const char *a2, ...)
{
  return [a1 insertText:];
}

id objc_msgSend_instanceId(void *a1, const char *a2, ...)
{
  return _[a1 instanceId];
}

id objc_msgSend_instruction(void *a1, const char *a2, ...)
{
  return _[a1 instruction];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return _[a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceWithInternalProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithInternalProtocol:];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_internalErrorWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 internalErrorWithMessage:];
}

id objc_msgSend_internalInfo(void *a1, const char *a2, ...)
{
  return _[a1 internalInfo];
}

id objc_msgSend_internalInfoWithReply_(void *a1, const char *a2, ...)
{
  return [a1 internalInfoWithReply:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invokeSuccessFeedback(void *a1, const char *a2, ...)
{
  return _[a1 invokeSuccessFeedback];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return _[a1 isActive];
}

id objc_msgSend_isAnimating(void *a1, const char *a2, ...)
{
  return _[a1 isAnimating];
}

id objc_msgSend_isApplePayPolicy_(void *a1, const char *a2, ...)
{
  return [a1 isApplePayPolicy:];
}

id objc_msgSend_isApplePayPolicy_inApp_(void *a1, const char *a2, ...)
{
  return [a1 isApplePayPolicy:inApp:];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingDismissed];
}

id objc_msgSend_isBiometricOnlyPolicy_(void *a1, const char *a2, ...)
{
  return [a1 isBiometricOnlyPolicy:];
}

id objc_msgSend_isClarityBoardRunning(void *a1, const char *a2, ...)
{
  return _[a1 isClarityBoardRunning];
}

id objc_msgSend_isComplex(void *a1, const char *a2, ...)
{
  return _[a1 isComplex];
}

id objc_msgSend_isDynamicIslandAvailable(void *a1, const char *a2, ...)
{
  return _[a1 isDynamicIslandAvailable];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToDictionary_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToDictionary:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 isFirstResponder];
}

id objc_msgSend_isFullScreenController(void *a1, const char *a2, ...)
{
  return _[a1 isFullScreenController];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isLocalizationKey_(void *a1, const char *a2, ...)
{
  return [a1 isLocalizationKey:];
}

id objc_msgSend_isLocationBasedPolicy_(void *a1, const char *a2, ...)
{
  return [a1 isLocationBasedPolicy:];
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return [a1 isMemberOfClass:];
}

id objc_msgSend_isRemoteViewController(void *a1, const char *a2, ...)
{
  return _[a1 isRemoteViewController];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isSupported(void *a1, const char *a2, ...)
{
  return _[a1 isSupported];
}

id objc_msgSend_isSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isSuspended];
}

id objc_msgSend_isUiReady(void *a1, const char *a2, ...)
{
  return _[a1 isUiReady];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isViewLoaded];
}

id objc_msgSend_keyboardLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 keyboardLayoutGuide];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutFrame(void *a1, const char *a2, ...)
{
  return _[a1 layoutFrame];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lightPasscodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "lightPasscodeLockViewForStyle:");
}

id objc_msgSend_lightStyleWithBackgroundStyle_(void *a1, const char *a2, ...)
{
  return [a1 lightStyleWithBackgroundStyle:];
}

id objc_msgSend_lightweightUI(void *a1, const char *a2, ...)
{
  return _[a1 lightweightUI];
}

id objc_msgSend_lightweightUIMode(void *a1, const char *a2, ...)
{
  return _[a1 lightweightUIMode];
}

id objc_msgSend_localizedCallerName(void *a1, const char *a2, ...)
{
  return _[a1 localizedCallerName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringWithFormat:];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeViewControllerWith_delegate_(void *a1, const char *a2, ...)
{
  return [a1 makeViewControllerWith:delegate:];
}

id objc_msgSend_mechanism(void *a1, const char *a2, ...)
{
  return _[a1 mechanism];
}

id objc_msgSend_mechanismEvent_reply_(void *a1, const char *a2, ...)
{
  return [a1 mechanismEvent:reply:];
}

id objc_msgSend_mechanismEvent_value_reply_(void *a1, const char *a2, ...)
{
  return [a1 mechanismEvent:value:reply:];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return [a1 modelSpecificLocalizedStringKeyForKey:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_newInstanceId(void *a1, const char *a2, ...)
{
  return _[a1 newInstanceId];
}

id objc_msgSend_newTaskId(void *a1, const char *a2, ...)
{
  return _[a1 newTaskId];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberOfTouches(void *a1, const char *a2, ...)
{
  return _[a1 numberOfTouches];
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return [a1 numberWithDouble:];
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return [a1 numberWithFloat:];
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInt:];
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return [a1 numberWithUnsignedInt:];
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

id objc_msgSend_okButton(void *a1, const char *a2, ...)
{
  return _[a1 okButton];
}

id objc_msgSend_onDismiss(void *a1, const char *a2, ...)
{
  return _[a1 onDismiss];
}

id objc_msgSend_opacity(void *a1, const char *a2, ...)
{
  return _[a1 opacity];
}

id objc_msgSend_openSessions(void *a1, const char *a2, ...)
{
  return _[a1 openSessions];
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return [a1 openURL:];
}

id objc_msgSend_openURL_withOptions_error_(void *a1, const char *a2, ...)
{
  return [a1 openURL:withOptions:error:];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return _[a1 passcode];
}

id objc_msgSend_passcodeBackOffViewCanceled_(void *a1, const char *a2, ...)
{
  return [a1 passcodeBackOffViewCanceled:];
}

id objc_msgSend_passcodeContentViewControllerForPasscode_options_(void *a1, const char *a2, ...)
{
  return [a1 passcodeContentViewControllerForPasscode:options:];
}

id objc_msgSend_passcodeField(void *a1, const char *a2, ...)
{
  return _[a1 passcodeField];
}

id objc_msgSend_passcodeLength(void *a1, const char *a2, ...)
{
  return _[a1 passcodeLength];
}

id objc_msgSend_passcodeLockViewForStyle_(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockViewForStyle:];
}

id objc_msgSend_passcodeScreenStyleWithPolicy_options_darkInterface_(void *a1, const char *a2, ...)
{
  return [a1 passcodeScreenStyleWithPolicy:options:darkInterface:];
}

id objc_msgSend_passcodeType(void *a1, const char *a2, ...)
{
  return _[a1 passcodeType];
}

id objc_msgSend_passcodeVerificationFinished_(void *a1, const char *a2, ...)
{
  return [a1 passcodeVerificationFinished:];
}

id objc_msgSend_passcodeViewCancelButtonPressed_(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewCancelButtonPressed:];
}

id objc_msgSend_passcodeViewForPasscode_style_(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewForPasscode:style:];
}

id objc_msgSend_passcodeViewPasscodeDidChange_(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewPasscodeDidChange:];
}

id objc_msgSend_passcodeViewPasscodeEntered_(void *a1, const char *a2, ...)
{
  return [a1 passcodeViewPasscodeEntered:];
}

id objc_msgSend_pearlUIState(void *a1, const char *a2, ...)
{
  return _[a1 pearlUIState];
}

id objc_msgSend_persistentDomainForName_(void *a1, const char *a2, ...)
{
  return [a1 persistentDomainForName:];
}

id objc_msgSend_persistentIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistentIdentifier];
}

id objc_msgSend_pinCancelled(void *a1, const char *a2, ...)
{
  return _[a1 pinCancelled];
}

id objc_msgSend_pinCharset(void *a1, const char *a2, ...)
{
  return _[a1 pinCharset];
}

id objc_msgSend_pinEntered_(void *a1, const char *a2, ...)
{
  return [a1 pinEntered:];
}

id objc_msgSend_pinLength(void *a1, const char *a2, ...)
{
  return _[a1 pinLength];
}

id objc_msgSend_pinMaxLength(void *a1, const char *a2, ...)
{
  return _[a1 pinMaxLength];
}

id objc_msgSend_pinMinLength(void *a1, const char *a2, ...)
{
  return _[a1 pinMinLength];
}

id objc_msgSend_pinTextField(void *a1, const char *a2, ...)
{
  return _[a1 pinTextField];
}

id objc_msgSend_pinValue(void *a1, const char *a2, ...)
{
  return _[a1 pinValue];
}

id objc_msgSend_policy(void *a1, const char *a2, ...)
{
  return _[a1 policy];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postNotificationWithNewBoolState_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationWithNewBoolState:];
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return _[a1 prepare];
}

id objc_msgSend_presentOnParentViewController_animated_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 presentOnParentViewController:animated:completionHandler:];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentationController(void *a1, const char *a2, ...)
{
  return _[a1 presentationController];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingTransitionViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingTransitionViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_processHomeButtonPressed(void *a1, const char *a2, ...)
{
  return _[a1 processHomeButtonPressed];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_purgeBuffers(void *a1, const char *a2, ...)
{
  return _[a1 purgeBuffers];
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 quaternaryLabelColor];
}

id objc_msgSend_raise_format_(void *a1, const char *a2, ...)
{
  return [a1 raise:format:];
}

id objc_msgSend_rawValue(void *a1, const char *a2, ...)
{
  return _[a1 rawValue];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return _[a1 redColor];
}

id objc_msgSend_registerForTraitChanges_withHandler_(void *a1, const char *a2, ...)
{
  return [a1 registerForTraitChanges:withHandler:];
}

id objc_msgSend_remainingMinDisplayTimeInterval(void *a1, const char *a2, ...)
{
  return _[a1 remainingMinDisplayTimeInterval];
}

id objc_msgSend_remainingSecurityDelay(void *a1, const char *a2, ...)
{
  return _[a1 remainingSecurityDelay];
}

id objc_msgSend_remoteUIHost(void *a1, const char *a2, ...)
{
  return _[a1 remoteUIHost];
}

id objc_msgSend_removeAllAnimations(void *a1, const char *a2, ...)
{
  return _[a1 removeAllAnimations];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeLastCharacter(void *a1, const char *a2, ...)
{
  return _[a1 removeLastCharacter];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_replacePassphraseCredentialWithPurpose_passphrase_scope_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replacePassphraseCredentialWithPurpose:passphrase:scope:error:");
}

id objc_msgSend_requestAlertingAssertion(void *a1, const char *a2, ...)
{
  return _[a1 requestAlertingAssertion];
}

id objc_msgSend_requestIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 requestIdentifier];
}

id objc_msgSend_requestNegativeResponseAnimation(void *a1, const char *a2, ...)
{
  return _[a1 requestNegativeResponseAnimation];
}

id objc_msgSend_requestSceneSessionDestruction_options_errorHandler_(void *a1, const char *a2, ...)
{
  return [a1 requestSceneSessionDestruction:options:errorHandler:];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return _[a1 reset];
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return _[a1 resetForFailedPasscode];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_resize_(void *a1, const char *a2, ...)
{
  return [a1 resize:];
}

id objc_msgSend_resolvedColorWithTraitCollection_(void *a1, const char *a2, ...)
{
  return [a1 resolvedColorWithTraitCollection:];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_revokePresentableWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return [a1 revokePresentableWithCompletionHandler:];
}

id objc_msgSend_revokePresentableWithRequestIdentifier_reason_animated_userInfo_error_(void *a1, const char *a2, ...)
{
  return [a1 revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:];
}

id objc_msgSend_rightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 rightAnchor];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return _[a1 role];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _[a1 rootController];
}

id objc_msgSend_safeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaInsets];
}

id objc_msgSend_safeAreaLayoutGuide(void *a1, const char *a2, ...)
{
  return _[a1 safeAreaLayoutGuide];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scheduledTimerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_secureDataWithString_(void *a1, const char *a2, ...)
{
  return [a1 secureDataWithString:];
}

id objc_msgSend_sendSubviewToBack_(void *a1, const char *a2, ...)
{
  return [a1 sendSubviewToBack:];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return _[a1 session];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setActions_(void *a1, const char *a2, ...)
{
  return [a1 setActions:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setAlertController_(void *a1, const char *a2, ...)
{
  return [a1 setAlertController:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAnimating_(void *a1, const char *a2, ...)
{
  return [a1 setAnimating:];
}

id objc_msgSend_setAnimationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationStyle:];
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationsEnabled:];
}

id objc_msgSend_setAttributedPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedPlaceholder:];
}

id objc_msgSend_setAuthenticationSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationSubtitle:];
}

id objc_msgSend_setAuthenticationTitle_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationTitle:];
}

id objc_msgSend_setAutomaticallyInvalidatable_(void *a1, const char *a2, ...)
{
  return [a1 setAutomaticallyInvalidatable:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setAxis_(void *a1, const char *a2, ...)
{
  return [a1 setAxis:];
}

id objc_msgSend_setBackdropVisible_(void *a1, const char *a2, ...)
{
  return [a1 setBackdropVisible:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackoffCounter_(void *a1, const char *a2, ...)
{
  return [a1 setBackoffCounter:];
}

id objc_msgSend_setBackoffTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setBackoffTimeout:];
}

id objc_msgSend_setBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBarStyle:];
}

id objc_msgSend_setBiometricAuthenticationAllowed_(void *a1, const char *a2, ...)
{
  return [a1 setBiometricAuthenticationAllowed:];
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return [a1 setBorderColor:];
}

id objc_msgSend_setBorderStyle_(void *a1, const char *a2, ...)
{
  return [a1 setBorderStyle:];
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return [a1 setBorderWidth:];
}

id objc_msgSend_setCancelButton_(void *a1, const char *a2, ...)
{
  return [a1 setCancelButton:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setClipsToBounds:];
}

id objc_msgSend_setConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:];
}

id objc_msgSend_setConstant_(void *a1, const char *a2, ...)
{
  return [a1 setConstant:];
}

id objc_msgSend_setContentCompressionResistancePriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentCompressionResistancePriority:forAxis:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContentsMultiplyColor_(void *a1, const char *a2, ...)
{
  return [a1 setContentsMultiplyColor:];
}

id objc_msgSend_setCoolOffDuration_(void *a1, const char *a2, ...)
{
  return [a1 setCoolOffDuration:];
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return [a1 setCornerCurve:];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCredential_forProcessedEvent_credentialType_reply_(void *a1, const char *a2, ...)
{
  return [a1 setCredential:forProcessedEvent:credentialType:reply:];
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return [a1 setDamping:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDesiredHardwareButtonEvents_(void *a1, const char *a2, ...)
{
  return [a1 setDesiredHardwareButtonEvents:];
}

id objc_msgSend_setDevicePasscodeEntry_(void *a1, const char *a2, ...)
{
  return [a1 setDevicePasscodeEntry];
}

id objc_msgSend_setDimEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDimEnabled:];
}

id objc_msgSend_setDimLevel_(void *a1, const char *a2, ...)
{
  return [a1 setDimLevel:];
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return [a1 setDirection:];
}

id objc_msgSend_setDisableUpdateMask_(void *a1, const char *a2, ...)
{
  return [a1 setDisableUpdateMask:];
}

id objc_msgSend_setDismissalAnimationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDismissalAnimationStyle:];
}

id objc_msgSend_setDismissingTemporarily_(void *a1, const char *a2, ...)
{
  return [a1 setDismissingTemporarily:];
}

id objc_msgSend_setDisplacement_(void *a1, const char *a2, ...)
{
  return [a1 setDisplacement:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEffect_(void *a1, const char *a2, ...)
{
  return [a1 setEffect:];
}

id objc_msgSend_setElementNeedsUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setElementNeedsUpdate];
}

id objc_msgSend_setElementNeedsUpdateWithCoordinatedAnimations_(void *a1, const char *a2, ...)
{
  return [a1 setElementNeedsUpdateWithCoordinatedAnimations:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setFaceVisibility_animated_(void *a1, const char *a2, ...)
{
  return [a1 setFaceVisibility:animated:];
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFinishedColor_animated_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedColor:animated:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setGlyph_(void *a1, const char *a2, ...)
{
  return [a1 setGlyph:];
}

id objc_msgSend_setGlyphView_(void *a1, const char *a2, ...)
{
  return [a1 setGlyphView:];
}

id objc_msgSend_setHasWhiteBackground_(void *a1, const char *a2, ...)
{
  return [a1 setHasWhiteBackground:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setIdleColor_animated_(void *a1, const char *a2, ...)
{
  return [a1 setIdleColor:animated:];
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTimerDisabled:forReason:];
}

id objc_msgSend_setInitialStyle_(void *a1, const char *a2, ...)
{
  return [a1 setInitialStyle:];
}

id objc_msgSend_setInputAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setInputAccessoryView:];
}

id objc_msgSend_setInstruction_(void *a1, const char *a2, ...)
{
  return [a1 setInstruction:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsInstructionHidden_(void *a1, const char *a2, ...)
{
  return [a1 setIsInstructionHidden:];
}

id objc_msgSend_setItems_(void *a1, const char *a2, ...)
{
  return [a1 setItems:];
}

id objc_msgSend_setKeyboardAppearance_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardAppearance:];
}

id objc_msgSend_setKeyboardType_(void *a1, const char *a2, ...)
{
  return [a1 setKeyboardType:];
}

id objc_msgSend_setLaunchingInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchingInterfaceOrientation:];
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return [a1 setMass:];
}

id objc_msgSend_setMessage_(void *a1, const char *a2, ...)
{
  return [a1 setMessage:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalTransitionStyle:];
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsStatusBarAppearanceUpdate(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsStatusBarAppearanceUpdate];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOnDismiss_(void *a1, const char *a2, ...)
{
  return [a1 setOnDismiss:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOpaque_(void *a1, const char *a2, ...)
{
  return [a1 setOpaque:];
}

id objc_msgSend_setPasscodeFocused_(void *a1, const char *a2, ...)
{
  return [a1 setPasscodeFocused:];
}

id objc_msgSend_setPaused_(void *a1, const char *a2, ...)
{
  return [a1 setPaused:];
}

id objc_msgSend_setPearlUIState_(void *a1, const char *a2, ...)
{
  return [a1 setPearlUIState:];
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholder:];
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredAction:];
}

id objc_msgSend_setPreferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredStyle:];
}

id objc_msgSend_setPriority_(void *a1, const char *a2, ...)
{
  return [a1 setPriority:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRenderingHint_(void *a1, const char *a2, ...)
{
  return [a1 setRenderingHint:];
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return [a1 setReturnKeyType:];
}

id objc_msgSend_setSecureTextEntry_(void *a1, const char *a2, ...)
{
  return [a1 setSecureTextEntry:];
}

id objc_msgSend_setSecureVariantEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setSecureVariantEnabled:];
}

id objc_msgSend_setSecureVariantType_(void *a1, const char *a2, ...)
{
  return [a1 setSecureVariantType:];
}

id objc_msgSend_setShakeEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setShakeEnabled:];
}

id objc_msgSend_setShowsEmergencyCallButton_(void *a1, const char *a2, ...)
{
  return [a1 setShowsEmergencyCallButton:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setStackingLevel_(void *a1, const char *a2, ...)
{
  return [a1 setStackingLevel:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setState_animated_(void *a1, const char *a2, ...)
{
  return [a1 setState:animated:];
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return [a1 setStiffness:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setStyle_animated_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:animated:];
}

id objc_msgSend_setSubtitle_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitle:];
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return [a1 setSuspended:];
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

id objc_msgSend_setTextContentType_(void *a1, const char *a2, ...)
{
  return [a1 setTextContentType:];
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

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitleColor:forState:];
}

id objc_msgSend_setTitleText_(void *a1, const char *a2, ...)
{
  return [a1 setTitleText:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return [a1 setTransform:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return [a1 setVelocity:];
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return [a1 setView:];
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return [a1 setViewController:];
}

id objc_msgSend_setWallpaperStyle_withDuration_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperStyle:withDuration:];
}

id objc_msgSend_setWallpaperTunnelActive_(void *a1, const char *a2, ...)
{
  return [a1 setWallpaperTunnelActive:];
}

id objc_msgSend_settingsForPrivateStyle_(void *a1, const char *a2, ...)
{
  return [a1 settingsForPrivateStyle:];
}

id objc_msgSend_settingsForPrivateStyle_graphicsQuality_(void *a1, const char *a2, ...)
{
  return [a1 settingsForPrivateStyle:graphicsQuality:];
}

id objc_msgSend_setupConnection(void *a1, const char *a2, ...)
{
  return _[a1 setupConnection];
}

id objc_msgSend_shake(void *a1, const char *a2, ...)
{
  return _[a1 shake];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldPresentWithAnimation(void *a1, const char *a2, ...)
{
  return _[a1 shouldPresentWithAnimation];
}

id objc_msgSend_silentInternalErrorWithMessage_(void *a1, const char *a2, ...)
{
  return [a1 silentInternalErrorWithMessage:];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return _[a1 string];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return [a1 stringByAppendingString:];
}

id objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 stringByPaddingToLength:withString:startingAtIndex:];
}

id objc_msgSend_stringByReplacingCharactersInRange_withString_(void *a1, const char *a2, ...)
{
  return [a1 stringByReplacingCharactersInRange:withString:];
}

id objc_msgSend_stringByTrimmingCharactersInSet_(void *a1, const char *a2, ...)
{
  return [a1 stringByTrimmingCharactersInSet:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_substringToIndex_(void *a1, const char *a2, ...)
{
  return [a1 substringToIndex:];
}

id objc_msgSend_subtitle(void *a1, const char *a2, ...)
{
  return _[a1 subtitle];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_suspend(void *a1, const char *a2, ...)
{
  return _[a1 suspend];
}

id objc_msgSend_suspendConnection(void *a1, const char *a2, ...)
{
  return _[a1 suspendConnection];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_systemApertureElementContext(void *a1, const char *a2, ...)
{
  return _[a1 systemApertureElementContext];
}

id objc_msgSend_systemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBackgroundColor];
}

id objc_msgSend_systemBlueColor(void *a1, const char *a2, ...)
{
  return _[a1 systemBlueColor];
}

id objc_msgSend_systemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 systemFontOfSize:];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemLightGrayTintColor(void *a1, const char *a2, ...)
{
  return _[a1 systemLightGrayTintColor];
}

id objc_msgSend_systemPinkColor(void *a1, const char *a2, ...)
{
  return _[a1 systemPinkColor];
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return _[a1 systemUptime];
}

id objc_msgSend_tertiaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 tertiaryLabelColor];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceNow];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_toastController(void *a1, const char *a2, ...)
{
  return _[a1 toastController];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_traitCollectionWithUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 traitCollectionWithUserInterfaceStyle:];
}

id objc_msgSend_truncateString_maxLength_(void *a1, const char *a2, ...)
{
  return [a1 truncateString:maxLength:];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_uiCancel(void *a1, const char *a2, ...)
{
  return _[a1 uiCancel];
}

id objc_msgSend_uiCancelByGestureIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 uiCancelByGestureIfPossible];
}

id objc_msgSend_uiCancelWithError_(void *a1, const char *a2, ...)
{
  return [a1 uiCancelWithError:];
}

id objc_msgSend_uiDismissed(void *a1, const char *a2, ...)
{
  return _[a1 uiDismissed];
}

id objc_msgSend_uiEvent_options_(void *a1, const char *a2, ...)
{
  return [a1 uiEvent:options:];
}

id objc_msgSend_uiFailureWithError_(void *a1, const char *a2, ...)
{
  return [a1 uiFailureWithError:];
}

id objc_msgSend_uiFallback(void *a1, const char *a2, ...)
{
  return _[a1 uiFallback];
}

id objc_msgSend_uiOpenURL_(void *a1, const char *a2, ...)
{
  return [a1 uiOpenURL:];
}

id objc_msgSend_uiSuccessWithResult_(void *a1, const char *a2, ...)
{
  return [a1 uiSuccessWithResult:];
}

id objc_msgSend_unarchivedObjectOfClass_fromData_error_(void *a1, const char *a2, ...)
{
  return [a1 unarchivedObjectOfClass:fromData:error:];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateFrame(void *a1, const char *a2, ...)
{
  return _[a1 updateFrame];
}

id objc_msgSend_updateLayoutForWidth_(void *a1, const char *a2, ...)
{
  return [a1 updateLayoutForWidth:];
}

id objc_msgSend_updateStatusText_subtitle_animated_(void *a1, const char *a2, ...)
{
  return [a1 updateStatusText:subtitle:animated:];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceStyle(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceStyle];
}

id objc_msgSend_usesFrontBoardServicesForRemoteUI(void *a1, const char *a2, ...)
{
  return _[a1 usesFrontBoardServicesForRemoteUI];
}

id objc_msgSend_variableLength(void *a1, const char *a2, ...)
{
  return _[a1 variableLength];
}

id objc_msgSend_verifyPasscode_(void *a1, const char *a2, ...)
{
  return [a1 verifyPasscode:];
}

id objc_msgSend_verifyPasscode_reply_(void *a1, const char *a2, ...)
{
  return [a1 verifyPasscode:reply:];
}

id objc_msgSend_verifyPasswordUsingAKS_acmContext_userId_policy_options_bioLockoutRecovery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyPasswordUsingAKS:acmContext:userId:policy:options:bioLockoutRecovery:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_viewDidLayoutSubviews(void *a1, const char *a2, ...)
{
  return _[a1 viewDidLayoutSubviews];
}

id objc_msgSend_viewModelDidReceiveAuthenticationDataWithInternalInfo_mechanism_(void *a1, const char *a2, ...)
{
  return [a1 viewModelDidReceiveAuthenticationDataWithInternalInfo:mechanism:];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitespaceAndNewlineCharacterSet(void *a1, const char *a2, ...)
{
  return _[a1 whitespaceAndNewlineCharacterSet];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_willMoveToParent_(void *a1, const char *a2, ...)
{
  return [a1 willMoveToParent:];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_withStyle_(void *a1, const char *a2, ...)
{
  return [a1 withStyle:];
}