id *sub_4210(id *result, int a2)
{
  if (a2) {
    return (id *)_[result[4] _showPhotoStreamController:result[5]];
  }
  return result;
}

void sub_44D4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) specifiers];
  id v3 = [v2 count];

  if (v3)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    v4 = *(void **)(a1 + 32);
    id v6 = [v4 specifiers];
    v5 = [v6 firstObject];
    [v4 _photoStreamSpecifierWasTapped:v5];
  }
}

void sub_4D9C(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  double y = CGPointZero.y;
  double v5 = *(double *)(a1 + 40);
  double v6 = *(double *)(a1 + 48);
  +[UIBezierPath bezierPathWithOvalInRect:](UIBezierPath, "bezierPathWithOvalInRect:", CGPointZero.x, y, v5, v6);
  id v7 = objc_claimAutoreleasedReturnValue();
  CGContextAddPath(v3, (CGPathRef)[v7 CGPath]);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", CGPointZero.x, y, v5, v6);
}

id sub_5040(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (CGContext *)[v3 CGContext];
  [*(id *)(a1 + 32) setFill];
  objc_msgSend(v3, "fillRect:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));

  CGFloat v5 = *(double *)(a1 + 80);
  v7.b = 0.0;
  v7.c = 0.0;
  v7.a = 1.0;
  *(_OWORD *)&v7.d = xmmword_58C70;
  v7.tdouble y = v5;
  CGContextConcatCTM(v4, &v7);
  return objc_msgSend(*(id *)(a1 + 40), "drawInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void sub_50D8(uint64_t a1, void *a2)
{
  id v3 = (CGContext *)[a2 CGContext];
  CGContextSaveGState(v3);
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), 5.0);
  id v4 = objc_claimAutoreleasedReturnValue();
  CGFloat v5 = (const CGPath *)[v4 CGPath];

  CGContextAddPath(v3, v5);
  CGContextClip(v3);
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));

  CGContextRestoreGState(v3);
}

id sub_5D5C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _fetchImagesForContacts:a2 ofSize:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

id sub_5E2C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _fetchImagesForContacts:a2 ofSize:*(void *)(a1 + 40) completion:*(double *)(a1 + 48)];
}

void sub_6090(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setImageData:a2];
  id v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t sub_60D0(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_624C(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2050000000;
  id v4 = (void *)qword_8FF48;
  uint64_t v13 = qword_8FF48;
  if (!qword_8FF48)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_64B4;
    v9[3] = &unk_75298;
    v9[4] = &v10;
    sub_64B4((uint64_t)v9);
    id v4 = (void *)v11[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v10, 8);
  double v6 = [*(id *)(a1 + 32) firstName];
  CGAffineTransform v7 = [*(id *)(a1 + 32) lastName];
  v8 = [v5 profilePictureForContact:0 serverImageData:v3 firstName:v6 lastName:v7 diameter:*(double *)(a1 + 48)];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_6388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6490(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

Class sub_64B4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_8FF50)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_65F8;
    v4[4] = &unk_752D0;
    v4[5] = v4;
    long long v5 = off_752B8;
    uint64_t v6 = 0;
    qword_8FF50 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_8FF50)
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
    Class result = objc_getClass("FAProfilePictureStore");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_486B4();
LABEL_8:
    free(v2);
  }
  qword_8FF48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_65F8()
{
  uint64_t result = _sl_dlopen();
  qword_8FF50 = result;
  return result;
}

id _AAUILogSystem()
{
  if (qword_8FF60 != -1) {
    dispatch_once(&qword_8FF60, &stru_75310);
  }
  v0 = (void *)qword_8FF58;

  return v0;
}

void sub_66C0(id a1)
{
  qword_8FF58 = (uint64_t)os_log_create("com.apple.appleaccount", "ui");

  _objc_release_x1();
}

id _AAUISignpostLogSystem()
{
  if (qword_8FF70 != -1) {
    dispatch_once(&qword_8FF70, &stru_75330);
  }
  v0 = (void *)qword_8FF68;

  return v0;
}

void sub_6758(id a1)
{
  qword_8FF68 = (uint64_t)os_log_create("com.apple.appleaccount", "ui.signpost");

  _objc_release_x1();
}

id _AAUIPPSLogSystem()
{
  if (qword_8FF80 != -1) {
    dispatch_once(&qword_8FF80, &stru_75350);
  }
  v0 = (void *)qword_8FF78;

  return v0;
}

void sub_67F0(id a1)
{
  qword_8FF78 = (uint64_t)os_log_create("com.apple.appleaccount", "ui.pps");

  _objc_release_x1();
}

uint64_t _AAUILogGreenTeaEnabled()
{
  return _ct_green_tea_logging_enabled();
}

void sub_6838(void *a1)
{
  id v1 = a1;
  id v5 = +[NSBundle mainBundle];
  id v2 = [v5 bundleIdentifier];
  [v2 UTF8String];
  ct_green_tea_logger_create();
  id v3 = getCTGreenTeaOsLogHandle();
  id v4 = v1;
  [v4 UTF8String];

  os_log_with_args();
  ct_green_tea_logger_destroy();
}

void _AAUILogGreenTeaWithFormat(void *a1)
{
}

void _AAUILogGreenTeaTransmittingPhotosOrVideos()
{
  id v4 = +[NSBundle mainBundle];
  v0 = [v4 objectForInfoDictionaryKey:@"CFBundleDisplayName"];
  id v1 = +[NSProcessInfo processInfo];
  id v2 = [v1 processName];

  id v3 = +[NSDate now];
  _AAUILogGreenTeaWithFormat(@"%@ <%@>[Settings][%@] : Transmitting photos or videos");
}

os_signpost_id_t _AAUISignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _AAUISignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  if (qword_8FF90 != -1) {
    dispatch_once(&qword_8FF90, &stru_75370);
  }
  uint64_t v3 = mach_continuous_time();
  LODWORD(v4) = dword_8FF88;
  LODWORD(v5) = *(_DWORD *)algn_8FF8C;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void sub_6AAC(id a1)
{
}

void sub_6D54()
{
  id v27 = objc_alloc_init((Class)AADeviceInfo);
  id v0 = objc_alloc_init((Class)NSMutableDictionary);
  os_signpost_id_t v1 = +[NSBundle bundleForClass:objc_opt_class()];
  id v2 = [v1 localizedStringForKey:@"NOTES_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  uint64_t v3 = [v27 deviceClass];
  unint64_t v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v2, v3);
  [v0 setObject:v4 forKeyedSubscript:ACAccountDataclassNotes];

  unint64_t v5 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v6 = [v5 localizedStringForKey:@"MESSAGES_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  CGAffineTransform v7 = [v27 deviceClass];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);
  [v0 setObject:v8 forKeyedSubscript:ACAccountDataclassMessages];

  v9 = +[AADataclassManager sharedManager];
  uint64_t v10 = ACAccountDataclassHealth;
  LODWORD(v5) = [v9 appIsNeitherInstalledOrPlaceholder:ACAccountDataclassHealth];

  v11 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v12 = v11;
  if (v5) {
    CFStringRef v13 = @"HEALTH_DATA_DATACLASS_TITLE";
  }
  else {
    CFStringRef v13 = @"HEALTH_DATACLASS_TITLE";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_76890 table:@"Localizable"];
  v15 = [v27 deviceClass];
  v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);
  [v0 setObject:v16 forKeyedSubscript:v10];

  v17 = +[NSBundle bundleForClass:objc_opt_class()];
  v18 = [v17 localizedStringForKey:@"KEYCHAIN_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  v19 = [v27 deviceClass];
  v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
  [v0 setObject:v20 forKeyedSubscript:ACAccountDataclassKeychainSync];

  v21 = +[NSBundle bundleForClass:objc_opt_class()];
  v22 = [v21 localizedStringForKey:@"ICLOUD_DRIVE_DATACLASS_TITLE" value:&stru_76890 table:@"Localizable"];
  v23 = [v27 deviceClass];
  v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);
  [v0 setObject:v24 forKeyedSubscript:ACAccountDataclassUbiquity];

  id v25 = [v0 copy];
  v26 = (void *)qword_8FF98;
  qword_8FF98 = (uint64_t)v25;
}

void sub_72DC(uint64_t a1)
{
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"NOTES_DATACLASS_SUBTITLE" value:&stru_76890 table:@"Localizable"];
  [v12 setObject:v3 forKeyedSubscript:ACAccountDataclassNotes];

  unint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v5 = [v4 localizedStringForKey:@"MESSAGES_DATACLASS_SUBTITLE" value:&stru_76890 table:@"Localizable"];
  [v12 setObject:v5 forKeyedSubscript:ACAccountDataclassMessages];

  [v12 setObject:*(void *)(a1 + 32) forKeyedSubscript:ACAccountDataclassHealth];
  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  CGAffineTransform v7 = [v6 localizedStringForKey:@"KEYCHAIN_DATACLASS_SUBTITLE" value:&stru_76890 table:@"Localizable"];
  [v12 setObject:v7 forKeyedSubscript:ACAccountDataclassKeychainSync];

  v8 = +[NSBundle bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"ICLOUD_DRIVE_DATACLASS_SUBTITLE" value:&stru_76890 table:@"Localizable"];
  [v12 setObject:v9 forKeyedSubscript:ACAccountDataclassUbiquity];

  id v10 = [v12 copy];
  v11 = (void *)qword_8FFA8;
  qword_8FFA8 = (uint64_t)v10;
}

void sub_7784()
{
  id v10 = objc_alloc_init((Class)NSMutableDictionary);
  id v0 = +[NSBundle bundleForClass:objc_opt_class()];
  os_signpost_id_t v1 = [v0 localizedStringForKey:@"NOTES_LEARN_MORE_LINK" value:&stru_76890 table:@"Localizable"];
  [v10 setObject:v1 forKeyedSubscript:ACAccountDataclassNotes];

  id v2 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"MESSAGES_LEARN_MORE_LINK" value:&stru_76890 table:@"Localizable"];
  [v10 setObject:v3 forKeyedSubscript:ACAccountDataclassMessages];

  unint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
  unint64_t v5 = [v4 localizedStringForKey:@"HEALTH_LEARN_MORE_LINK" value:&stru_76890 table:@"Localizable"];
  [v10 setObject:v5 forKeyedSubscript:ACAccountDataclassHealth];

  uint64_t v6 = +[NSBundle bundleForClass:objc_opt_class()];
  CGAffineTransform v7 = [v6 localizedStringForKey:@"ICLOUD_DRIVE_LEARN_MORE_LINK" value:&stru_76890 table:@"Localizable"];
  [v10 setObject:v7 forKeyedSubscript:ACAccountDataclassUbiquity];

  id v8 = [v10 copy];
  v9 = (void *)qword_8FFB8;
  qword_8FFB8 = (uint64_t)v8;
}

void sub_7FB0(uint64_t a1, char a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_8044;
  v3[3] = &unk_753C0;
  id v4 = *(id *)(a1 + 32);
  char v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

uint64_t sub_8044(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_805C(id *a1, char a2)
{
  id v4 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  char v5 = [a1[4] account];
  uint64_t v6 = objc_msgSend(v5, "aa_altDSID");
  [v4 setAltDSID:v6];

  [v4 setIsUsernameEditable:0];
  id WeakRetained = objc_loadWeakRetained((id *)a1[4] + 2);
  [v4 setPresentingViewController:WeakRetained];

  id v8 = a1[5];
  if ([v8 isEqualToString:AIDAServiceTypeCloud])
  {
    uint64_t v9 = 1;
  }
  else if ([v8 isEqualToString:AIDAServiceTypeStore])
  {
    uint64_t v9 = 2;
  }
  else if ([v8 isEqualToString:AIDAServiceTypeMessages])
  {
    uint64_t v9 = 4;
  }
  else if ([v8 isEqualToString:AIDAServiceTypeFaceTime])
  {
    uint64_t v9 = 5;
  }
  else if ([v8 isEqualToString:AIDAServiceTypeGameCenter])
  {
    uint64_t v9 = 6;
  }
  else
  {
    uint64_t v9 = 0;
  }

  [v4 setServiceType:v9];
  id v10 = [a1[4] account];
  v11 = [v10 username];
  [v4 setUsername:v11];

  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_82F8;
  id v25 = sub_8308;
  id v26 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
  id v12 = (void *)v22[5];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_8310;
  v16[3] = &unk_75438;
  v19 = &v21;
  id v13 = a1[6];
  char v20 = a2;
  id v14 = a1[4];
  id v15 = a1[5];
  id v18 = v13;
  v16[4] = v14;
  id v17 = v15;
  [v12 authenticateWithContext:v4 completion:v16];

  _Block_object_dispose(&v21, 8);
}

void sub_82E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_82F8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_8308(uint64_t a1)
{
}

void sub_8310(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  if (v6)
  {
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_486DC((uint64_t)v6, v9);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v10 = objc_alloc_init((Class)AIDAMutableServiceContext);
    [v10 setAuthenticationResults:v5];
    [v10 setShouldForceOperation:*(unsigned __int8 *)(a1 + 64)];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v10 setViewController:WeakRetained];

    id v12 = *(void **)(a1 + 40);
    if (v12 == (void *)AIDAServiceTypeGameCenter)
    {
      uint64_t v18 = *(void *)(a1 + 40);
      v19 = &off_79D08;
      id v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v10 setSignInContexts:v13];

      id v12 = *(void **)(a1 + 40);
    }
    id v14 = *(void **)(*(void *)(a1 + 32) + 24);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_8518;
    v15[3] = &unk_75410;
    id v16 = v12;
    id v17 = *(id *)(a1 + 48);
    [v14 signInService:v16 withContext:v10 completion:v15];
  }
}

void sub_8518(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Signed in to service %{public}@ with success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

uint64_t sub_8618(uint64_t a1, int a2)
{
  id v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User chose not to swap, bailing!", buf, 2u);
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)CFStringRef v8 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User opted to swap accounts, on it!", v8, 2u);
    }

    id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  }
  return v6();
}

void sub_8A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_8A54(uint64_t a1, char a2)
{
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_8B00;
  v6[3] = &unk_753C0;
  id v7 = *(id *)(a1 + 32);
  char v8 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

uint64_t sub_8B00(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_8B18(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138543874;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2112;
    CFStringRef v12 = v8;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Signed out of service: %{public}@, success: %@, error: %@", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40));
}

void sub_8E48(id a1)
{
  qword_8FFC8 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", ACAccountDataclassKeyValue, ACAccountDataclassContent, ACAccountDataclassShareLocation, ACAccountDataclassCKDatabaseService, ACAccountDataclassCKShareService, ACAccountDataclassCKDeviceService, ACAccountDataclassCloudPhotos, ACAccountDataclassAvailability, 0);

  _objc_release_x1();
}

void sub_9180(void *a1)
{
  os_signpost_id_t v1 = a1;
  id v2 = objc_alloc((Class)UIImageView);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  id v6 = objc_msgSend(v2, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v7 = v1[1];
  v1[1] = v6;

  [v1[1] setTranslatesAutoresizingMaskIntoConstraints:0];
  CFStringRef v8 = -[AAUILabel initWithFrame:]([AAUILabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v9 = v1[2];
  v1[2] = v8;

  id v10 = v1[2];
  __int16 v11 = +[UIColor colorWithWhite:0.0 alpha:0.959999979];
  [v10 setBackgroundColor:v11];

  [v1[2] setTextAlignment:1];
  id v12 = v1[2];
  __int16 v13 = +[UIColor whiteColor];
  [v12 setTextColor:v13];

  [v1[2] setTranslatesAutoresizingMaskIntoConstraints:0];
  id v14 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  id v15 = v1[3];
  v1[3] = v14;

  id v16 = v1[3];
  id v17 = +[UIColor colorWithWhite:0.0 alpha:0.300000012];
  [v16 setBackgroundColor:v17];

  objc_msgSend(v1[3], "setHidden:", objc_msgSend(v1, "isHighlighted") ^ 1);
  [v1[3] setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addSubview:v1[1]];
  [v1 addSubview:v1[2]];
  [v1 addSubview:v1[3]];
  v51 = [v1[1] topAnchor];
  v50 = [v1 topAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v52[0] = v49;
  v48 = [v1[1] bottomAnchor];
  v47 = [v1 bottomAnchor];
  v46 = [v48 constraintEqualToAnchor:v47];
  v52[1] = v46;
  v45 = [v1[1] leadingAnchor];
  v44 = [v1 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v52[2] = v43;
  v42 = [v1[1] trailingAnchor];
  v41 = [v1 trailingAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v52[3] = v40;
  v39 = [v1[2] bottomAnchor];
  v38 = [v1 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v52[4] = v37;
  v36 = [v1[2] leadingAnchor];
  v35 = [v1 leadingAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v52[5] = v34;
  v33 = [v1[2] trailingAnchor];
  v32 = [v1 trailingAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v52[6] = v31;
  v30 = [v1[3] topAnchor];
  v29 = [v1 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v52[7] = v28;
  id v27 = [v1[3] bottomAnchor];
  uint64_t v18 = [v1 bottomAnchor];
  v19 = [v27 constraintEqualToAnchor:v18];
  v52[8] = v19;
  char v20 = [v1[3] leadingAnchor];
  uint64_t v21 = [v1 leadingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v52[9] = v22;
  uint64_t v23 = [v1[3] trailingAnchor];
  v24 = [v1 trailingAnchor];
  id v25 = [v23 constraintEqualToAnchor:v24];
  v52[10] = v25;
  id v26 = +[NSArray arrayWithObjects:v52 count:11];
  +[NSLayoutConstraint activateConstraints:v26];

  [v1 _updateLabelVisibility];
  [v1 _updateOverlayViewVisibility];
}

void sub_9CB0(uint64_t a1)
{
  uint64_t v7 = 0;
  CFStringRef v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = sub_9E04;
  __int16 v11 = sub_9E14;
  id v12 = objc_alloc_init(AAUICloudStorageOffersManager);
  id v2 = [*(id *)(a1 + 32) objectForKey:AADataclassActionUserInfoLibrarySize];
  uint64_t v3 = (void *)v8[5];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  id v5 = [WeakRetained navigationController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9E1C;
  v6[3] = &unk_754F8;
  void v6[4] = &v7;
  [v3 presentCloudStorageOffersPageFromNavigationController:v5 requiredStorageThreshold:v2 completionHandler:v6];

  _Block_object_dispose(&v7, 8);
}

void sub_9DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9E04(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9E14(uint64_t a1)
{
}

void sub_9E1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  id v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void sub_9EF8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) anyObject];
  id v8 = (id)v2;
  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v2 = (uint64_t)v8;
    if (isKindOfClass)
    {
      id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      id v6 = [v5 specifierForID:v8];

      id v7 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
      [v7 startSpinnerInSpecifier:v6];

      uint64_t v2 = (uint64_t)v8;
    }
  }
  [*(id *)(a1 + 40) _beginManateeUpgradeForAccount:*(void *)(a1 + 48) failedDataclassName:v2];
}

void sub_A1A8(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    [v8 stopSpinnerInActiveSpecifier];
  }
  if ((a2 & 1) == 0)
  {
    id v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_48874((uint64_t)v5, v14);
    }

    id v15 = [v5 domain];
    if ([v15 isEqualToString:CDPStateErrorDomain]) {
      BOOL v16 = [v5 code] == "ateFrameworks/AppleMediaServices.framework/AppleMediaServices";
    }
    else {
      BOOL v16 = 0;
    }

    if (+[AFUtilities isInternalBuild]
      && [v5 code] != (id)-5307)
    {
      char v17 = [v5 code] != (id)-5308 || v16;
      if ((v17 & 1) == 0) {
        goto LABEL_35;
      }
    }
    else if (!v16)
    {
      goto LABEL_35;
    }
    uint64_t v18 = *(void *)(a1 + 40);
    v19 = +[NSBundle bundleForClass:objc_opt_class()];
    if (v18)
    {
      char v20 = @"HSA2_UPGRADE_FAILURE_MESSAGE";
      if (([@"HSA2_UPGRADE_FAILURE_MESSAGE" containsString:@"REBRAND"] & 1) != 0
        || !_os_feature_enabled_impl())
      {
        int v21 = 0;
      }
      else
      {
        char v20 = [@"HSA2_UPGRADE_FAILURE_MESSAGE" stringByAppendingString:@"_REBRAND"];
        int v21 = 1;
      }
      v22 = [v19 localizedStringForKey:v20 value:&stru_76890 table:@"Localizable"];
      uint64_t v23 = +[NSBundle bundleForClass:objc_opt_class()];
      v24 = [v23 localizedStringForKey:*(void *)(a1 + 40) value:&stru_76890 table:@"Localizable"];
      id v25 = objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      uint64_t v43 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v24, v25);

      if (v21) {
      id v26 = +[NSBundle bundleForClass:objc_opt_class()];
      }
      id v27 = @"HSA2_UPGRADE_FAILURE_TITLE";
      if (([@"HSA2_UPGRADE_FAILURE_TITLE" containsString:@"REBRAND"] & 1) != 0
        || !_os_feature_enabled_impl())
      {
        char v42 = 0;
      }
      else
      {
        id v27 = [@"HSA2_UPGRADE_FAILURE_TITLE" stringByAppendingString:@"_REBRAND"];
        char v42 = 1;
      }
      v28 = [v26 localizedStringForKey:v27 value:&stru_76890 table:@"Localizable"];
      v29 = +[NSBundle bundleForClass:objc_opt_class()];
      v30 = [v29 localizedStringForKey:*(void *)(a1 + 40) value:&stru_76890 table:@"Localizable"];
      v31 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v30);

      v32 = (void *)v43;
      if ((v42 & 1) == 0) {
        goto LABEL_34;
      }
    }
    else
    {
      v36 = @"HSA2_UPGRADE_FAILURE_MESSAGE_NO_FEATURE";
      if (([@"HSA2_UPGRADE_FAILURE_MESSAGE_NO_FEATURE" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
      {
        int v37 = 0;
      }
      else
      {
        v36 = [@"HSA2_UPGRADE_FAILURE_MESSAGE_NO_FEATURE" stringByAppendingString:@"_REBRAND"];
        int v37 = 1;
      }
      v38 = [v19 localizedStringForKey:v36 value:&stru_76890 table:@"Localizable"];
      v39 = objc_msgSend(*(id *)(a1 + 48), "aa_formattedUsername");
      v32 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v38, v39);

      if (v37) {
      id v26 = +[NSBundle bundleForClass:objc_opt_class()];
      }
      id v27 = @"HSA2_UPGRADE_FAILURE_TITLE_NO_FEATURE";
      if (([@"HSA2_UPGRADE_FAILURE_TITLE_NO_FEATURE" containsString:@"REBRAND"] & 1) != 0|| !_os_feature_enabled_impl())
      {
        int v40 = 0;
      }
      else
      {
        id v27 = [@"HSA2_UPGRADE_FAILURE_TITLE_NO_FEATURE" stringByAppendingString:@"_REBRAND"];
        int v40 = 1;
      }
      v41 = [v26 localizedStringForKey:v27 value:&stru_76890 table:@"Localizable"];
      v31 = +[NSString stringWithFormat:v41];

      if (!v40) {
        goto LABEL_34;
      }
    }

LABEL_34:
    v33 = +[NSBundle bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"LEARN_MORE_BUTTON" value:&stru_76890 table:@"Localizable"];
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_A860;
    v44[3] = &unk_75548;
    v44[4] = *(void *)(a1 + 32);
    v35 = +[UIAlertAction actionWithTitle:v34 style:0 handler:v44];

    [*(id *)(a1 + 32) _displayAccountSaveErrorAlertWithTitle:v31 message:v32 alternativeAction:v35];
    goto LABEL_35;
  }
  if (*(void *)(a1 + 40))
  {
    id v9 = [*(id *)(a1 + 48) copy];
    [v9 reload];
    [v9 setEnabled:1 forDataclass:*(void *)(a1 + 40)];
    id v10 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      id v12 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
      __int16 v13 = [v12 accountOperationsHelper];
      [v13 saveAccount:v9 requireVerification:0];
    }
  }
LABEL_35:
}

void sub_A860()
{
  id v3 = +[UIApplication sharedApplication];
  id v0 = +[NSBundle bundleForClass:objc_opt_class()];
  uint64_t v1 = [v0 localizedStringForKey:@"HSA2_UPGRADE_FAILURE_ARTICLE_PATH" value:&stru_76890 table:@"Localizable"];
  uint64_t v2 = +[NSURL URLWithString:v1];
  [v3 openURL:v2 withCompletionHandler:0];
}

void sub_ABE8(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  if (+[AFUtilities isInternalBuild])
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = +[NSBundle bundleForClass:objc_opt_class()];
    id v5 = [v4 localizedStringForKey:@"ACCOUNT_SAVE_ERROR_INTERNAL_MESSAGE" value:&stru_76890 table:@"Localizable"];
    uint64_t v6 = [v3 stringByAppendingFormat:@"\n%@", v5];

    id v7 = +[NSBundle bundleForClass:objc_opt_class()];
    id v8 = [v7 localizedStringForKey:@"TAP_TO_RADAR_TITLE" value:&stru_76890 table:@"Localizable"];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_AE78;
    v15[3] = &unk_75548;
    id v16 = *(id *)(a1 + 48);
    id v9 = +[UIAlertAction actionWithTitle:v8 style:0 handler:v15];

    id v2 = (id)v6;
  }
  else
  {
    id v9 = 0;
  }
  id v10 = +[UIAlertController alertWithTitle:*(void *)(a1 + 48) message:v2];
  char v11 = +[NSBundle bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
  __int16 v13 = +[UIAlertAction actionWithTitle:v12 style:1 handler:0];
  [v10 addAction:v13];

  if (v9) {
    [v10 addAction:v9];
  }
  if (*(void *)(a1 + 56)) {
    objc_msgSend(v10, "addAction:");
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
  [WeakRetained presentViewController:v10 animated:1 completion:0];
}

id sub_AE78(uint64_t a1)
{
  return +[AAUIRadarHelper tapToRadarWithTitle:*(void *)(a1 + 32) initialMessage:@"Error saving account"];
}

void sub_AE9C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_B590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18, id a19)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_B5DC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_B6DC;
  v8[3] = &unk_755C0;
  objc_copyWeak(&v11, (id *)(a1 + 40));
  char v14 = a2;
  objc_copyWeak(&v12, (id *)(a1 + 48));
  objc_copyWeak(&v13, (id *)(a1 + 56));
  uint64_t v6 = *(void *)(a1 + 32);
  id v9 = v5;
  uint64_t v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
}

void sub_B6DC(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  BOOL v3 = v2 == 0;

  if (!v3)
  {
    if (*(unsigned char *)(a1 + 72))
    {
      uint64_t v4 = (id *)(a1 + 56);
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      id v6 = objc_loadWeakRetained((id *)(a1 + 64));
      id v7 = [v6 _detailViewController];
      id v8 = objc_loadWeakRetained(v4);
      [WeakRetained showViewController:v7 sender:v8];
    }
    else
    {
      id v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = objc_loadWeakRetained((id *)(a1 + 64));
        id v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v13 = [*(id *)(a1 + 32) localizedDescription];
        *(_DWORD *)buf = 138412547;
        id v23 = v12;
        __int16 v24 = 2113;
        id v25 = v13;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "%@: CDP repair failed with error: %{private}@", buf, 0x16u);
      }
      char v14 = +[NSBundle bundleForClass:objc_opt_class()];
      id v15 = [v14 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_TITLE" value:&stru_76890 table:@"Localizable"];
      id v16 = +[NSBundle bundleForClass:objc_opt_class()];
      char v17 = [v16 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_MESSAGE" value:&stru_76890 table:@"Localizable"];
      uint64_t v18 = +[NSBundle bundleForClass:objc_opt_class()];
      v19 = [v18 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_BUTTON_TITLE" value:&stru_76890 table:@"Localizable"];
      id WeakRetained = +[UIAlertController alertWithTitle:v15 message:v17 buttonTitle:v19];

      id v6 = objc_loadWeakRetained((id *)(a1 + 56));
      [v6 presentViewController:WeakRetained animated:1 completion:0];
    }

    id v20 = objc_loadWeakRetained(&to);
    objc_msgSend(v20, "aaui_stopSpinner");
  }
  objc_destroyWeak(&to);
}

void sub_B9AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_BC44(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v2 = objc_loadWeakRetained(&to);

  if (v2)
  {
    id v3 = objc_loadWeakRetained(&to);
    uint64_t v4 = [v3 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        sub_488EC(v6);
      }

      id v7 = objc_loadWeakRetained(&to);
      id v8 = [v7 specifiers];

      id v9 = objc_loadWeakRetained(&to);
      [v9 setSpecifiers:0];

      if (*(unsigned char *)(*(void *)(a1 + 32) + 48))
      {
        id v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)char v14 = 0;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "AAUICDPSpecifierProvider: adp is enabled - reloading specifiers", v14, 2u);
        }

        id v11 = objc_loadWeakRetained(&to);
        id v12 = [v11 delegate];
        id v13 = objc_loadWeakRetained(&to);
        [v12 reloadSpecifiersForProvider:v13 oldSpecifiers:v8 animated:0];
      }
    }
  }
  objc_destroyWeak(&to);
}

void sub_BDC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_C934(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:*(void *)(a1 + 40) animated:1];
}

void sub_CFFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_D020(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_D9C0(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  uint64_t v4 = [v6 domain];
  if ([v4 isEqualToString:CDPStateErrorDomain])
  {
    id v5 = [v6 code];

    if (v5 == (id)-5700)
    {
      [*(id *)(a1 + 32) _beginManateeUpgradeAndEnableKeychain];
      goto LABEL_6;
    }
  }
  else
  {
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
  [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
LABEL_6:
}

id sub_DA70(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
  return [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
}

id sub_DC58(uint64_t a1, int a2)
{
  [*(id *)(a1 + 40) _stopSpinnerInActiveSpecifier:*(void *)(*(void *)(a1 + 40) + 192)];
  if (a2)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_DD30;
    v6[3] = &unk_756A8;
    void v6[4] = *(void *)(a1 + 40);
    return +[CDPKeychainSync setUserVisibleKeychainSyncEnabled:1 withCompletion:v6];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 208) = 0;
    id v5 = *(void **)(a1 + 40);
    return [v5 _keychainSyncStatusDidChange];
  }
}

id sub_DD30(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 208) = 0;
  return [*(id *)(a1 + 32) _keychainSyncStatusDidChange];
}

id sub_DE24(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 208);
    v5[0] = 67109120;
    v5[1] = v3;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Received Keychain Sync status change notification. In the middle of toggling the switch? %d", (uint8_t *)v5, 8u);
  }

  id result = *(id *)(a1 + 32);
  if (!*((unsigned char *)result + 208))
  {
    [result _stopSpinnerInActiveSpecifier:*((void *)result + 24)];
    [*(id *)(a1 + 32) reloadSpecifiers];
    return [*(id *)(a1 + 32) _reloadParentSpecifier];
  }
  return result;
}

void sub_E13C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 96));
  _Unwind_Resume(a1);
}

void sub_E178(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

void sub_E1B8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

void sub_E1F8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStatusDidChange];
}

void sub_EA94(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained[11] showViewController:*(void *)(*(void *)(a1 + 32) + 64) sender:0];
  id v2 = WeakRetained;
  if (*((unsigned char *)WeakRetained + 80))
  {
    if (*((unsigned char *)WeakRetained + 81)) {
      [WeakRetained _postAdpUpsellCFUFamilyCustodianAddedEvent];
    }
    else {
      [WeakRetained _postAdpUpsellCFUCustodianInviteSentEvent];
    }
    id v2 = WeakRetained;
  }
}

void sub_EE4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_EE70(uint64_t a1, int a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = (id *)(a1 + 48);
  if (a2)
  {
    [v5 _sendTelemetryEventWithSuccess:v6 didSucceed:1 error:0];
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained _showInvitationSent];
  }
  else
  {
    [v5 _sendTelemetryEventWithSuccess:v6 didSucceed:0 error:a3];
    id WeakRetained = objc_loadWeakRetained(v7);
    [WeakRetained _cancelMessageInvitationFlow];
  }
}

void sub_F0FC(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[11] dismissViewControllerAnimated:1 completion:0];
}

void sub_F288(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[11] dismissViewControllerAnimated:1 completion:0];
}

void sub_F4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_F4F4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _hideActivitySpinnerInNavigationBar];
    id v9 = _AAUILogSystem();
    id v10 = v9;
    if (v5)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Sending message with linkmetadata: %@", buf, 0xCu);
      }

      id v10 = objc_alloc_init((Class)LPMessagesPayload);
      id v11 = [v5 bubbleMetadata];
      [v10 setMetadata:v11];

      id v19 = 0;
      id v12 = [v10 dataRepresentationWithOutOfLineAttachments:&v19];
      id v13 = v19;
      char v14 = [v8[2] inviteURL];
      int v15 = IMSPISendRichLink();

      id v16 = [v8[2] messageBody];
      int v17 = IMSPISendMessageWithAttachments();

      if (v15 && v17)
      {
        [v8 _invitationWasSent];
      }
      else
      {
        uint64_t v18 = _AAUILogSystem();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_48A70(v18);
        }
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      sub_489F8((uint64_t)v6, v10);
    }
  }
  else
  {
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      sub_48974(v10);
    }
  }
}

void sub_101C4(uint64_t a1)
{
  id v2 = dispatch_queue_create("createEmailAccountQueue", 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10258;
  block[3] = &unk_756F8;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

void sub_10258(uint64_t a1)
{
  id v2 = +[AAURLConfiguration urlConfiguration];
  int v3 = [v2 addEmailURL];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1031C;
  v6[3] = &unk_75130;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_1031C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    if (!*(void *)(*(void *)(a1 + 40) + 24))
    {
      id v2 = objc_alloc_init((Class)UINavigationController);
      uint64_t v3 = *(void *)(a1 + 40);
      uint64_t v4 = *(void **)(v3 + 24);
      *(void *)(v3 + 24) = v2;

      id v5 = +[UIDevice currentDevice];
      unint64_t v6 = (unint64_t)[v5 userInterfaceIdiom];

      [*(id *)(*(void *)(a1 + 40) + 24) setModalPresentationStyle:2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)];
    }
    id v7 = *(void **)(*(void *)(a1 + 40) + 32);
    if (!v7)
    {
      id v8 = objc_alloc_init((Class)RUILoader);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 32);
      *(void *)(v9 + 32) = v8;

      id v7 = *(void **)(*(void *)(a1 + 40) + 32);
    }
    objc_msgSend(v7, "setDelegate:");
    id v13 = [objc_alloc((Class)AAAddEmailUIRequest) initWithURLString:*(void *)(a1 + 32) account:*(void *)(*(void *)(a1 + 40) + 8)];
    id v11 = *(void **)(*(void *)(a1 + 40) + 32);
    id v12 = [v13 urlRequest];
    [v11 loadXMLUIWithRequest:v12];
  }
  else
  {
    id v13 = +[UIApplication sharedApplication];
    [v13 setNetworkActivityIndicatorVisible:0];
  }
}

void sub_10460(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_104E8;
  v2[3] = &unk_757C0;
  uint64_t v4 = a2;
  id v3 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

uint64_t sub_104E8(uint64_t result)
{
  if (!*(void *)(result + 40)) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

id sub_10740(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) dismissViewControllerAnimated:1 completion:0];
}

void sub_10754(uint64_t a1)
{
  +[ACAccountStore defaultStore];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10828;
  v4[3] = &unk_75860;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = *(void **)(a1 + 32);
  id v6 = v2;
  id v7 = *(id *)(a1 + 40);
  id v3 = v5;
  objc_msgSend(v3, "aa_updatePropertiesForAppleAccount:completion:", v2, v4);
}

void sub_10828(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_108B8;
  v3[3] = &unk_75838;
  id v4 = *(id *)(a1 + 48);
  [v1 saveVerifiedAccount:v2 withCompletionHandler:v3];
}

void sub_108B8(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1093C;
  block[3] = &unk_75810;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1093C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10A88(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    if ([v4 isMailSetupForced]) {
      [v4 cancelButtonTapped:*(void *)(a1 + 32)];
    }
  }
}

void sub_11500(uint64_t a1)
{
  unsigned int v2 = +[AAUIKeychainSyncController isKeychainSyncEnabled];
  *(unsigned char *)(*(void *)(a1 + 32) + 24) = 0;
  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v9 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "isKeychainSyncEnabled: %d", buf, 8u);
  }

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 16);
  if (v2)
  {
    if (v5 == 2) {
      return;
    }
    uint64_t v6 = 2;
  }
  else
  {
    if (v5 == 1) {
      return;
    }
    uint64_t v6 = 1;
  }
  *(void *)(v4 + 16) = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1164C;
  block[3] = &unk_756F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_1164C(uint64_t a1)
{
  unsigned int v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    uint64_t v7 = ACAccountDataclassKeychainSync;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Reloading specifier with ID: %@", (uint8_t *)&v6, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
    [v5 reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:ACAccountDataclassKeychainSync];
  }
}

void sub_11920(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_1195C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

void sub_1199C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

void sub_119DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _keychainSyncStateDidChange];
}

void sub_11F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  objc_destroyWeak(v17);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)(v18 - 88));
  _Unwind_Resume(a1);
}

void sub_11F9C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained fetchIDSStatusForRecipient:*(void *)(a1 + 32)];
}

void sub_11FEC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [WeakRetained _isHandleReachable:*(void *)(a1 + 32)];
}

void sub_12C4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_12C78(uint64_t a1, char a2)
{
  uint64_t v4 = *(NSObject **)(*(void *)(a1 + 32) + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_12D34;
  block[3] = &unk_758D8;
  objc_copyWeak(&v7, (id *)(a1 + 48));
  id v6 = *(id *)(a1 + 40);
  char v8 = a2;
  dispatch_async(v4, block);

  objc_destroyWeak(&v7);
}

void sub_12D34(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = +[NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  uint64_t v4 = [WeakRetained _idsReachabilityDictionaryForRecipient:*(void *)(a1 + 32)];
  id v5 = [*(id *)(a1 + 32) address];
  [v4 setObject:v3 forKeyedSubscript:v5];

  if (*(unsigned char *)(a1 + 48) && *(void *)(a1 + 32))
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_12E5C;
    v6[3] = &unk_75130;
    id v7 = WeakRetained;
    id v8 = *(id *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

void sub_12E5C(uint64_t a1)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = +[UIColor tintColor];
  [v2 setTintColor:v3 forRecipient:*(void *)(a1 + 40)];
}

void sub_13A68(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(*(void *)(a1 + 32) + 48);
  id v6 = v3;
  id v5 = [v3 identifier];
  LODWORD(v4) = [v4 containsObject:v5];

  if (v4) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

void sub_13C2C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  [*(id *)(*(void *)(a1 + 32) + 48) removeAllObjects];
  *(unsigned char *)(*(void *)(a1 + 32) + 56) = 0;
  id v7 = _AAUILogSystem();
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_48ED4((uint64_t)v6, v8);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Apps Syncing To Drive : %@", buf, 0xCu);
    }

    unsigned int v9 = [v5 apps];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_13E64;
    v13[3] = &unk_75950;
    v13[4] = *(void *)(a1 + 32);
    [v9 enumerateObjectsUsingBlock:v13];

    id v10 = [*(id *)(*(void *)(a1 + 32) + 24) specifiers];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_13F80;
    v12[3] = &unk_75978;
    v12[4] = *(void *)(a1 + 32);
    [v10 enumerateObjectsUsingBlock:v12];

    [*(id *)(*(void *)(a1 + 32) + 48) intersectSet:*(void *)(*(void *)(a1 + 32) + 40)];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_13FDC;
    block[3] = &unk_756F8;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_13E64(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 label];
    int v10 = 138412290;
    id v11 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "App from server %@", (uint8_t *)&v10, 0xCu);
  }
  id v6 = *(void **)(*(void *)(a1 + 32) + 40);
  id v7 = [v3 containerID];
  [v6 addObject:v7];

  id v8 = *(void **)(*(void *)(a1 + 32) + 40);
  unsigned int v9 = [v3 bundleIds];
  [v8 addObjectsFromArray:v9];
}

void sub_13F80(uint64_t a1, void *a2)
{
  unsigned int v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [a2 identifier];
  [v2 addObject:v3];
}

id sub_13FDC(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reloadSpecifier];
}

id sub_14E00(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) findMyAppLaunchButton];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 56);
  *(void *)(v3 + 56) = v2;

  [*(id *)(*(void *)(a1 + 32) + 40) removeFromSuperview];
  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 56) belowSubview:*(void *)(*(void *)(a1 + 32) + 32)];
  +[NSLayoutConstraint deactivateConstraints:*(void *)(*(void *)(a1 + 32) + 80)];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 56) centerXAnchor];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 56) superview];
  id v7 = [v6 centerXAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v18[0] = v8;
  unsigned int v9 = [*(id *)(*(void *)(a1 + 32) + 56) topAnchor];
  int v10 = [*(id *)(*(void *)(a1 + 32) + 32) bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:0.0];
  v18[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v18 count:2];
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(void **)(v13 + 80);
  *(void *)(v13 + 80) = v12;

  +[NSLayoutConstraint activateConstraints:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = 0;

  return [*(id *)(a1 + 32) setNeedsDisplay];
}

id sub_14FE0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeFromSuperview];
  uint64_t v2 = [*(id *)(a1 + 32) _deviceTypeLabel];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(a1 + 32) insertSubview:*(void *)(*(void *)(a1 + 32) + 40) belowSubview:*(void *)(*(void *)(a1 + 32) + 32)];
  +[NSLayoutConstraint deactivateConstraints:*(void *)(*(void *)(a1 + 32) + 80)];
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) centerXAnchor];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 40) superview];
  id v7 = [v6 centerXAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v18[0] = v8;
  unsigned int v9 = [*(id *)(*(void *)(a1 + 32) + 40) topAnchor];
  int v10 = [*(id *)(*(void *)(a1 + 32) + 32) bottomAnchor];
  id v11 = [v9 constraintEqualToAnchor:v10 constant:0.0];
  v18[1] = v11;
  uint64_t v12 = +[NSArray arrayWithObjects:v18 count:2];
  uint64_t v13 = *(void *)(a1 + 32);
  char v14 = *(void **)(v13 + 80);
  *(void *)(v13 + 80) = v12;

  +[NSLayoutConstraint activateConstraints:*(void *)(*(void *)(a1 + 32) + 80)];
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 56);
  *(void *)(v15 + 56) = 0;

  return [*(id *)(a1 + 32) setNeedsDisplay];
}

void sub_15C64(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  unsigned int v9 = v8;
  if (!v6 || v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_48FBC((uint64_t)v7, v9);
    }
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Fetched device header image!", buf, 2u);
    }

    int v10 = +[UIImage imageWithData:v6];
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_15DA8;
    v11[3] = &unk_75130;
    v11[4] = *(void *)(a1 + 32);
    id v12 = v10;
    unsigned int v9 = v10;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
  }
}

void sub_15DA8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) setImage:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;
}

void sub_16760(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_16784(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2)
  {
    id v5 = WeakRetained;
    [WeakRetained _showBackupController:*(void *)(a1 + 32)];
    id WeakRetained = v5;
  }
}

void sub_1777C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_177A4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_177B4(uint64_t a1)
{
}

void sub_177BC(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  unsigned int v9 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong(WeakRetained + 31, a2);
    if (v7)
    {
      int v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_4912C((uint64_t)v7, v10);
      }
    }
    id v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Cleaning up iCloud specifiers and reloading.", buf, 2u);
    }

    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_17954;
    v13[3] = &unk_75A18;
    objc_copyWeak(&v14, (id *)(a1 + 40));
    v13[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
    objc_destroyWeak(&v14);
  }
  else
  {
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_490F8();
    }
  }
}

void sub_17954(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained shouldShowiCloudDetails])
    {
      id v5 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cachediCloudDetailsPage];

      if (v5)
      {
        id v6 = _AAUILogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Showing iCloud details page", buf, 2u);
        }

        id v7 = objc_alloc((Class)ICQLiftUIPresenter);
        id v8 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) cachediCloudDetailsPage];
        unsigned int v9 = [v8 icqLink];
        int v10 = [v9 actionURL];
        id v11 = [v4 account];
        id v12 = [v7 initWithURL:v10 account:v11 data:0];

        id v13 = [objc_alloc((Class)ICQNDMLiftUIPresenterDelegate) initWithPresentingViewController:v4];
        id v14 = (void *)v4[33];
        v4[33] = v13;

        [v12 setDelegate:v4[33]];
        [v12 presentInViewController:v4 animated:1];
        [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setICloudDetailsPageShown:1];
      }
    }
    [v4 _cleanupiCloudSpecifiers];
    [v4 reloadSpecifiers];
    dispatch_time_t v15 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_17BC4;
    block[3] = &unk_75770;
    objc_copyWeak(&v20, v2);
    dispatch_after(v15, (dispatch_queue_t)&_dispatch_main_q, block);
    uint64_t v16 = *(void *)(*(void *)(a1 + 32) + 8);
    int v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = 0;

    objc_destroyWeak(&v20);
  }
  else
  {
    uint64_t v18 = _AAUILogSystem();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_490F8();
    }
  }
}

void sub_17BC4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    uint64_t v2 = _AAUILogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      sub_490F8();
    }
  }
  if ([WeakRetained handlePendingURL])
  {
    uint64_t v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Handled deferred URL push in _fetchCloudStorageSummary.", v4, 2u);
    }
  }
}

void sub_19C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19CA0(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    CFStringRef v5 = @"QuotaDidChange";
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fetchCloudStorageSummary];
}

void sub_19EFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19F20(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    uint64_t v5 = CDPWalrusStateChangeNotification;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "AAUIiCloudViewController: Received notification: %@", (uint8_t *)&v4, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadADPStatusAndSpecifierIfNeeded];
}

void sub_1A150(uint64_t a1)
{
  char v2 = +[AAUICDPHelper isWalrusEnabled];
  uint64_t v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_492A8(v2, v3);
  }

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1A22C;
  v4[3] = &unk_75A68;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  char v6 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
  objc_destroyWeak(&v5);
}

void sub_1A22C(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    int v5 = *(unsigned __int8 *)(a1 + 40);
    int v4 = (unsigned __int8 *)(a1 + 40);
    char v6 = WeakRetained + 392;
    if (v5 != WeakRetained[392])
    {
      id v7 = _AAUILogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        sub_4938C(v3 + 392, v4, v7);
      }

      *char v6 = *v4;
      id v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_49358();
      }

      [v3 _cleanupADPSpecifiers];
      [v3 reloadSpecifiers];
    }
  }
  else
  {
    unsigned int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_49324();
    }
  }
}

void sub_1A8B4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_1AC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1ACAC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1ACBC(uint64_t a1)
{
}

void sub_1ACC4(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController done with iForgot! Error: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = 0;
}

void sub_1AFEC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1B0AC;
  v8[3] = &unk_75AB8;
  char v11 = a2;
  uint64_t v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
}

void sub_1B0AC(uint64_t a1)
{
  [*(id *)(a1 + 32) hideBusyUI];
  int v2 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v3 = _AAUILogSystem();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Succesfully signed in to iCloud, error: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v6 = +[ACAccountStore defaultStore];
    id v7 = [*(id *)(a1 + 48) objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
    id v4 = objc_msgSend(v6, "aa_appleAccountWithAltDSID:", v7);

    [*(id *)(a1 + 32) didCompleteSigningInWithAccount:v4];
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    sub_494A4(a1, v4);
  }
}

void sub_1C1F4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setActivityIndicatorVisible:0];
  [*(id *)(a1 + 40) updateDetailLabelWithBackup:v4];
}

void sub_1C660(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)MBManager);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 40) backupUUID];
  id v14 = 0;
  id v4 = [v2 getBackupListWithError:&v14];
  id v5 = v14;
  uint64_t v6 = _AAUILogSystem();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_49564((uint64_t)v5, v7);
    }

    int v8 = 0;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_49520(v7);
    }

    int v8 = [*(id *)(a1 + 32) backupForUDID:v3 backupList:v4];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1C7D8;
  block[3] = &unk_75220;
  id v9 = *(id *)(a1 + 40);
  id v12 = v8;
  id v13 = v9;
  id v10 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1C7D8(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_1CE84(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = [v2 popViewControllerAnimated:1];
}

void sub_1DD10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DD2C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (a2)
  {
    id v5 = WeakRetained;
    [WeakRetained _superDataclassSwitchStateDidChange:*(void *)(a1 + 32) withSpecifier:*(void *)(a1 + 40)];
    id WeakRetained = v5;
  }
}

void sub_1DF64(uint64_t a1, char a2)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1DFF0;
  block[3] = &unk_75B30;
  char v5 = a2;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1DFF0(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(id **)(a1 + 32);
  if (v2) {
    return [v3 reloadSpecifier:*(void *)(a1 + 40)];
  }
  else {
    return _[v3[28] configureEmailAccount];
  }
}

void sub_1E16C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E190(uint64_t a1, int a2)
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "_validateDataclassAccessForSpecifier shouldContinue: %d", (uint8_t *)v6, 8u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained stopSpinnerInActiveSpecifier];
  if ((a2 & 1) == 0) {
    [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1E938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1E95C(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = AIDAServiceTypeCloud;
    int v8 = [v10 objectForKeyedSubscript:AIDAServiceTypeCloud];
    id v9 = [v5 objectForKeyedSubscript:v7];
    [WeakRetained accountDidChangeFromAccount:v8 toAccount:v9];
  }
}

void sub_1EB9C(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "aa_isPrimaryEmailVerified")) {
    unsigned int v2 = 0;
  }
  else {
    unsigned int v2 = objc_msgSend(*(id *)(a1 + 40), "aa_isPrimaryEmailVerified");
  }
  unsigned int v3 = [*(id *)(a1 + 32) isAuthenticated];
  unsigned int v4 = [*(id *)(a1 + 40) isAuthenticated];
  id v5 = [*(id *)(a1 + 32) enabledDataclasses];
  uint64_t v6 = [*(id *)(a1 + 40) enabledDataclasses];
  unsigned __int8 v7 = [v5 isEqual:v6];

  unsigned int v8 = [*(id *)(a1 + 32) isPropertyDirty:ACPropertyKeyEnabledDataclasses];
  if (v2)
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Account became verified. Will reload specifiers.";
LABEL_16:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 2u);
    }
  }
  else if (v3 == v4)
  {
    if (v7)
    {
      if (!v8) {
        return;
      }
      id v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v10 = "Account enabled dataclasses are dirty and were likely set on oldAccount. Will reload specifiers.";
        goto LABEL_16;
      }
    }
    else
    {
      id v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v10 = "Account enabled dataclasses changed. Will reload specifiers.";
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      id v10 = "Account authentication state changed. Will reload specifiers.";
      goto LABEL_16;
    }
  }

  char v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Account has changed, will reload specifiers.", buf, 2u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1EDE8;
  block[3] = &unk_756F8;
  void block[4] = *(void *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_1EDE8(uint64_t a1)
{
  [*(id *)(a1 + 32) cleanupDataclassSpecifiers];
  unsigned int v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_1EF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1EF64(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained cleanupDataclassSpecifiers];

  id v3 = objc_loadWeakRetained(v1);
  [v3 reloadSpecifiers];
}

void sub_210D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_210EC(id a1, NSNotification *a2)
{
  unsigned int v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = CDPWalrusStateChangeNotification;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "AAUICDPWebSpecifierProvider: Received notification: %@", (uint8_t *)&v3, 0xCu);
  }
}

void sub_212BC(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  id v1 = objc_loadWeakRetained(&to);

  if (v1)
  {
    id v2 = objc_loadWeakRetained(&to);
    int v3 = [v2 delegate];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      id v5 = _AAUILogSystem();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v6 = objc_opt_class();
        sub_498B8(v6, (uint64_t)v14, v5);
      }

      id v7 = objc_loadWeakRetained(&to);
      unsigned int v8 = [v7 specifiers];

      id v9 = objc_loadWeakRetained(&to);
      [v9 setSpecifiers:0];

      id v10 = objc_loadWeakRetained(&to);
      char v11 = [v10 delegate];
      id v12 = objc_loadWeakRetained(&to);
      [v11 reloadSpecifiersForProvider:v12 oldSpecifiers:v8 animated:0];
    }
  }
  objc_destroyWeak(&to);
}

void sub_21420(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_21610(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _reloadSpecifiers];
    id WeakRetained = v2;
  }
}

void sub_21920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location, id a18)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_21954(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_21A38;
  v6[3] = &unk_75C00;
  objc_copyWeak(&v9, a1 + 5);
  objc_copyWeak(&v10, a1 + 6);
  id v7 = a1[4];
  id v8 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void sub_21A38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "aaui_stopSpinner");

  int v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_49A8C(a1, v3);
  }
}

void sub_21CCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21CF8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      id v8 = (objc_class *)objc_opt_class();
      id v9 = NSStringFromClass(v8);
      id v10 = [v5 localizedDescription];
      int v12 = 138412547;
      id v13 = v9;
      __int16 v14 = 2113;
      dispatch_time_t v15 = v10;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@: Done saving web access state with error: %{private}@", (uint8_t *)&v12, 0x16u);
    }
    id v11 = objc_loadWeakRetained((id *)(a1 + 32));
    [v11 _reloadSpecifiers];
  }
}

void sub_21FE0(uint64_t a1)
{
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_copyWeak(&v14, (id *)(a1 + 48));
  id v2 = objc_loadWeakRetained(&to);
  if (v2)
  {
    int v3 = v2;
    id v4 = objc_loadWeakRetained(&v14);

    if (v4)
    {
      id v5 = +[NSBundle bundleForClass:objc_opt_class()];
      uint64_t v6 = [v5 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_TITLE" value:&stru_76890 table:@"Localizable"];
      id v7 = +[NSBundle bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_MESSAGE" value:&stru_76890 table:@"Localizable"];
      id v9 = +[NSBundle bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"ACCESS_DATACLASS_VALIDATION_FAILED_BUTTON_TITLE" value:&stru_76890 table:@"Localizable"];
      id v11 = +[UIAlertController alertWithTitle:v6 message:v8 buttonTitle:v10];

      id v12 = objc_loadWeakRetained(&v14);
      [v12 presentViewController:v11 animated:1 completion:0];

      id v13 = objc_loadWeakRetained(&to);
      [v13 _reloadSpecifiers];
    }
  }
  objc_destroyWeak(&v14);
  objc_destroyWeak(&to);
}

void sub_221B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_22420(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_22AB0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(v3 + 48) specifierForID:@"PRIVATE_EMAIL_MANAGE"];
    [v5 specifierProvider:v3 didFinishLoadingSpecifier:v4];
  }
}

void sub_22C10(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = v5;
  id v9 = v5;

  if (v6)
  {
    id v10 = _AAUILogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_4912C((uint64_t)v6, v10);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_22D00;
  block[3] = &unk_756F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_22D00(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _reloadPrivateEmailSpecifier];
}

void sub_24568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_258E0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _didTapShowAllSpecifier:*(void *)(*(void *)(a1 + 32) + 136) url:*(void *)(a1 + 40) animated:0];
}

void sub_26458(uint64_t a1, char a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained stopSpinnerInActiveSpecifier];

  if ((a2 & 1) == 0)
  {
    id v5 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [v5 reloadSpecifier:*(void *)(a1 + 40)];
  }
}

Class sub_26B60(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_8FFE8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_26CA4;
    void v4[4] = &unk_752D0;
    v4[5] = v4;
    long long v5 = off_75CE0;
    uint64_t v6 = 0;
    qword_8FFE8 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_8FFE8)
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
    Class result = objc_getClass("CKCloudSettingsViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_49DE8();
LABEL_8:
    free(v2);
  }
  qword_8FFE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_26CA4()
{
  uint64_t result = _sl_dlopen();
  qword_8FFE8 = result;
  return result;
}

void sub_27074(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_27284;
  v12[3] = &unk_75D00;
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 48);
  uint64_t v3 = objc_retainBlock(v12);
  if (WeakRetained)
  {
    id v4 = (char *)[WeakRetained _currentWalrusStatus];
    long long v5 = _AAUILogSystem();
    uint64_t v6 = v5;
    if (v4 == (unsigned char *)&dword_0 + 1)
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
        sub_49E50();
      }

      [WeakRetained _walrusValidateAccessForDataclass:*(void *)(a1 + 40) completion:v3];
    }
    else
    {
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAUIDataclassValidationController: Dataclass access cannot be validated, walrus status is unknown", buf, 2u);
      }

      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_2733C;
      v8[3] = &unk_75888;
      id v9 = WeakRetained;
      id v10 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }
  else
  {
    uint64_t v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_49E10();
    }

    ((void (*)(void *, void))v3[2])(v3, 0);
  }
}

void sub_27284(uint64_t a1, char a2)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_27324;
  v4[3] = &unk_753C0;
  id v5 = *(id *)(a1 + 40);
  char v6 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

uint64_t sub_27324(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void sub_2733C(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_273C4;
  v2[3] = &unk_75810;
  id v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 _walrusPresentUnknownErrorWithCompletionHandler:v2];
}

uint64_t sub_273C4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2764C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Received walrus state change notification, fetching current status...", buf, 2u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_27734;
  v7[3] = &unk_75D78;
  id v5 = *(void **)(a1 + 32);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v3;
  id v6 = v3;
  [v5 walrusStatusWithCompletion:v7];
}

void sub_27734(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_49EB8((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_27814;
  block[3] = &unk_75D50;
  id v13 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  uint64_t v16 = a2;
  id v15 = v13;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_27814(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(v2 + 8);
  uint64_t v4 = *(void *)(a1 + 48);
  *(void *)(v2 + 8) = v4;
  if (v3 != v4) {
    [*(id *)(a1 + 32) _reloadSpecifiers];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void sub_27884(uint64_t a1, void *a2)
{
  uint64_t v3 = a2;
  uint64_t v4 = +[NSNotificationCenter defaultCenter];
  uint64_t v5 = CDPWalrusStateChangeNotification;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_27968;
  v8[3] = &unk_75DC8;
  id v9 = *(id *)(a1 + 32);
  uint64_t v6 = [v4 addObserverForName:v5 object:0 queue:0 usingBlock:v8];
  uint64_t v7 = (void *)v3[3];
  v3[3] = v6;
}

uint64_t sub_27968(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_27BBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_27BE0(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained(v2);
  uint64_t v4 = [v3 userInfo];

  uint64_t v5 = [v4 objectForKey:CDPManateeAvailabilityStateKey];

  if (WeakRetained)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unsigned int v6 = [v5 BOOLValue];
      int v7 = WeakRetained[16];
      WeakRetained[16] = v6;
      if (v7 != v6) {
        [WeakRetained _reloadSpecifiers];
      }
    }
  }
}

void sub_27EF4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_49FC4((uint64_t)v5, v7, v8, v9, v10, v11, v12, v13);
    }

    unsigned int v6 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v6();
}

void sub_27F84(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_28040;
  block[3] = &unk_75E18;
  id v6 = *(id *)(a1 + 32);
  char v11 = a2;
  id v9 = v5;
  id v10 = v6;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_28040(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

void sub_2825C(id a1)
{
  v4[0] = ACAccountDataclassCalendars;
  v4[1] = ACAccountDataclassContacts;
  v4[2] = ACAccountDataclassMail;
  id v1 = +[NSArray arrayWithObjects:v4 count:3];
  uint64_t v2 = +[NSSet setWithArray:v1];
  id v3 = (void *)qword_8FFF0;
  qword_8FFF0 = v2;
}

void sub_28404(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2977C(id a1)
{
  v4.double height = 40.0;
  v4.double width = 29.0;
  UIGraphicsBeginImageContextWithOptions(v4, 0, 0.0);
  uint64_t v1 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  uint64_t v2 = (void *)qword_90000;
  qword_90000 = v1;
}

id sub_2A5BC(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) _appSpecifierWithBundleID:a2];
}

int64_t sub_2A5C8(id a1, id a2, id a3)
{
  id v4 = a3;
  id v5 = [a2 name];
  id v6 = [v4 name];

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_2B01C(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0) {
    [*(id *)(a1 + 32) _startUsingiCloudDriveWithSpecifier:*(void *)(a1 + 40)];
  }
  id v3 = *(id **)(a1 + 32);
  id v4 = v3[4];
  [v3 _clearSpecifiers];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  [WeakRetained reloadSpecifiersForProvider:*(void *)(a1 + 32) oldSpecifiers:v4 animated:1];
}

void sub_2B2A8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2B2C8(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained[4];
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v5 = @"YES";
      if (!v3) {
        CFStringRef v5 = @"NO";
      }
      int v7 = 138412290;
      CFStringRef v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AAUIUbiquitySpecifierProvider recieved TCC access changed notification (has old specifiers: %@)", (uint8_t *)&v7, 0xCu);
    }

    [v2 _clearSpecifiers];
    id v6 = [v2 delegate];
    [v6 reloadSpecifiersForProvider:v2 oldSpecifiers:0 animated:1];
  }
}

void sub_2B6F8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_2B71C(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained && a2)
  {
    id v8 = WeakRetained;
    CFStringRef v5 = *(void **)(*(void *)(a1 + 32) + 48);
    id v6 = [*(id *)(a1 + 40) BOOLValue];
    int v7 = [*(id *)(a1 + 48) identifier];
    [v5 setAppAccessGranted:v6 forBundleID:v7];

    id WeakRetained = v8;
  }
}

void sub_2B894(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2C8C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_2D250(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_4A12C();
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 0;
  if (v7)
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 67) = 1;
  }
  else if (v6)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), a2);
    uint64_t v9 = [v6 apps];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_2D42C;
    v14[3] = &unk_75950;
    id v15 = *(id *)(a1 + 40);
    [v9 enumerateObjectsUsingBlock:v14];

    uint64_t v10 = *(void **)(a1 + 48);
    char v11 = [*(id *)(*(void *)(a1 + 32) + 48) appsUsingUbiquity];
    [v10 addObjectsFromArray:v11];

    [*(id *)(a1 + 48) intersectSet:*(void *)(a1 + 40)];
    *(_DWORD *)(*(void *)(a1 + 32) + 6_Block_object_dispose(&a9, 8) = [*(id *)(a1 + 48) count];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2D4BC;
  block[3] = &unk_75130;
  void block[4] = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 56);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_2D42C(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  CFStringRef v5 = [v4 containerID];
  [v3 addObject:v5];

  id v6 = *(void **)(a1 + 32);
  id v7 = [v4 bundleIds];

  [v6 addObjectsFromArray:v7];
}

void sub_2D4BC(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupAppsSyncingToDriveSpecifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:@"DATACLASS_DRIVE_GROUP"];
}

void sub_2D72C(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_4A194();
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 0;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v7) {
    *(unsigned char *)(v9 + 66) = 1;
  }
  else {
    objc_storeStrong((id *)(v9 + 24), a2);
  }
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2D848;
  v11[3] = &unk_75130;
  uint64_t v10 = *(void **)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v11);
}

void sub_2D848(uint64_t a1)
{
  [*(id *)(a1 + 32) _setupStorageUsedSpecifier:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained reloadSpecifierForProvider:*(void *)(a1 + 32) identifier:@"DATACLASS_STORAGE_USED_GROUP"];
}

id sub_2DA10(id result, int a2)
{
  if (a2)
  {
    id v2 = result;
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *((void *)v2 + 4);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Performing health dataclass switch state change to: %@", (uint8_t *)&v5, 0xCu);
    }

    return objc_msgSend(*((id *)v2 + 5), "aaui_performSuperSetterWithValue:", *((void *)v2 + 4));
  }
  return result;
}

Class sub_2E0DC(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_90018)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    void v4[3] = sub_2E220;
    void v4[4] = &unk_752D0;
    v4[5] = v4;
    long long v5 = off_75F58;
    uint64_t v6 = 0;
    qword_90018 = _sl_dlopen();
    id v2 = (void *)v4[0];
    if (!qword_90018)
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
    Class result = objc_getClass("HKHealthManageStorageViewController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    id v2 = (void *)sub_4A274();
LABEL_8:
    free(v2);
  }
  qword_90010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2E220()
{
  uint64_t result = _sl_dlopen();
  qword_90018 = result;
  return result;
}

void sub_2E2AC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_2F31C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2F340(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    uint64_t v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_4A32C(a1, v5);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2F420;
    block[3] = &unk_75770;
    objc_copyWeak(&v8, (id *)(a1 + 32));
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v8);
  }
}

void sub_2F420(uint64_t a1)
{
  id v3 = +[NSNotificationCenter defaultCenter];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 postNotificationName:@"AAUIWebAccessChangeNotification" object:WeakRetained];
}

void sub_2F648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_2F674(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_2F758;
  v6[3] = &unk_75C00;
  objc_copyWeak(&v9, a1 + 5);
  objc_copyWeak(&v10, a1 + 6);
  id v7 = a1[4];
  id v8 = v4;
  id v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void sub_2F758(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained stopSpinner];

  id v3 = _AAUILogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_4A464(a1);
  }
}

void sub_2FC28(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_4A61C(a1, v2, v3, v4, v5, v6, v7, v8);
  }
}

void sub_2FCC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_30BF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_30C14(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_4A728();
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_30CFC;
  block[3] = &unk_75F80;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 32);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
}

void sub_30CFC(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_storeStrong((id *)WeakRetained + 86, a1[4]);
    uint64_t v4 = [v3 _activeAccount];
    uint64_t v5 = +[AAUIIdentityViewFactory createAppleAccountHeaderViewFromContact:v3[86] account:v4 showAccountDetails:1 showEditButton:0];
    id v6 = a1[5];
    uint64_t v7 = (void *)v6[87];
    v6[87] = v5;

    id v8 = [v3 table];
    uint64_t v9 = [v3 _identityCardViewController];
    id v10 = [v9 view];
    [v8 setTableHeaderView:v10];

    [v3 _layoutIdentityCardHeader];
    char v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_4A7C4();
    }
  }
  else
  {
    uint64_t v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      sub_4A790();
    }
  }

  id v12 = _AAUILogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_4A75C();
  }

  [a1[5] _forgetSpecifiers];
  [a1[5] reloadSpecifiers];
}

void sub_31228(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) table];
  [v2 beginUpdates];

  id v3 = [*(id *)(a1 + 32) table];
  [v3 endUpdates];
}

void sub_318B0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _appleAccount];

  if (v2)
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Fetching grandslam account from apple account", buf, 2u);
    }

    uint64_t v4 = [*(id *)(a1 + 32) _accountStore];
    uint64_t v5 = [*(id *)(a1 + 32) _appleAccount];
    uint64_t v6 = objc_msgSend(v4, "aida_accountForiCloudAccount:", v5);
LABEL_9:
    uint64_t v12 = *(void *)(a1 + 32);
    id v13 = *(void **)(v12 + 528);
    *(void *)(v12 + 52_Block_object_dispose(&a9, 8) = v6;

    goto LABEL_10;
  }
  uint64_t v7 = [*(id *)(a1 + 32) _storeAccount];

  if (v7)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Fetching grandslam account from store account", v16, 2u);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = (void *)v9[62];
    char v11 = [v9 _storeAccount];
    uint64_t v4 = [v10 altDSIDForAccount:v11 service:AIDAServiceTypeStore];

    uint64_t v5 = [*(id *)(a1 + 32) _accountStore];
    uint64_t v6 = objc_msgSend(v5, "aida_accountForAltDSID:", v4);
    goto LABEL_9;
  }
LABEL_10:
  if (!*(void *)(*(void *)(a1 + 32) + 528))
  {
    id v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v15 = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Could not fetch GrandSlam Account, we're destined for failure!", v15, 2u);
    }
  }
}

void sub_324E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_328C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_328E0(uint64_t a1)
{
  uint64_t v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Followups changed. Lets reload specifiers", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_33A3C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_33A58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_33A68(uint64_t a1)
{
}

void sub_33A70(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "User's total iCloudStorage: %@", buf, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 792);
  *(void *)(v5 + 792) = v3;
  id v7 = v3;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_33BC8;
  block[3] = &unk_756F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  *(unsigned char *)(*(void *)(a1 + 32) + 800) = 0;
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = 0;
}

id sub_33BC8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"ICLOUD_SERVICE"];
}

void sub_33BD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [v5 totalStorage];
    id v8 = [v7 longLongValue];

    if (v8)
    {
      uint64_t v9 = NSLocalizedFileSizeDescription();
      uint64_t v10 = *(void *)(a1 + 32);
      char v11 = *(void **)(v10 + 792);
      *(void *)(v10 + 792) = v9;

      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_33D40;
      block[3] = &unk_756F8;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
  else
  {
    id v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_4A940();
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 800) = 0;
  *(unsigned char *)(*(void *)(a1 + 32) + 801) = 1;
  uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
  id v14 = *(void **)(v13 + 40);
  *(void *)(v13 + 40) = 0;
}

id sub_33D40(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"ICLOUD_SERVICE"];
}

void sub_340C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL sub_34BC0(id a1, TUCall *a2)
{
  uint64_t v2 = [(TUCall *)a2 provider];
  unsigned __int8 v3 = [v2 isFaceTimeProvider];

  return v3;
}

void sub_34DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_34E08(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v5 name];
    [WeakRetained _reloadSignoutGroupSpecifiersForName:v4];
  }
}

void sub_34E80(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = [v5 name];
    [WeakRetained _reloadSignoutGroupSpecifiersForName:v4];
  }
}

void sub_350A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = (id)objc_opt_new();
  uint64_t v4 = [v8 hooksFor:3 accountManager:*(void *)(*(void *)(a1 + 32) + 504)];
  id v5 = [objc_alloc((Class)AAUIServerUIHookHandler) initWithRemoteUIController:v3 hooks:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v5;
}

void sub_351F8(uint64_t a1)
{
  uint64_t v2 = +[AKNetworkObserver sharedNetworkObserver];
  unsigned __int8 v3 = [v2 isNetworkReachable];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_352A8;
  void v4[3] = &unk_760F0;
  unsigned __int8 v5 = v3;
  void v4[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);
}

void sub_352A8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = objc_alloc((Class)AAPasswordSecurityUIRequest);
    unsigned __int8 v3 = [*(id *)(a1 + 32) _grandSlamAccount];
    uint64_t v4 = [*(id *)(a1 + 32) _accountStore];
    id v5 = [v2 initWithGrandSlamAccount:v3 accountStore:v4];

    uint64_t v6 = [*(id *)(a1 + 32) _appleAccount];
    LODWORD(v4) = objc_msgSend(v6, "aa_isAccountClass:", AAAccountClassPrimary);

    if (v4) {
      [v5 setSpyglassOptionMask:AASpyGlassOptionPrimaryAccount];
    }
    id v7 = *(void **)(a1 + 32);
    id v8 = [v5 urlRequest];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_3543C;
    v13[3] = &unk_760C8;
    v13[4] = *(void *)(a1 + 32);
    uint64_t v9 = [v7 _loadRemoteRequest:v8 withIdentifier:@"_AAUIRemotePageIdentifierSecurity" preparation:v13 completion:0];
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(void **)(v10 + 408);
    *(void *)(v10 + 40_Block_object_dispose(&a9, 8) = v9;
  }
  else
  {
    [*(id *)(a1 + 32) _showAccountDetailsUnavailableAlert];
    id v12 = *(void **)(a1 + 32);
    [v12 _stopSpinnerInActiveSpecifier];
  }
}

void sub_3543C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v8 = (id)objc_opt_new();
  uint64_t v4 = [v8 hooksFor:1 accountManager:*(void *)(*(void *)(a1 + 32) + 504)];
  id v5 = [objc_alloc((Class)AAUIServerUIHookHandler) initWithRemoteUIController:v3 hooks:v4];

  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 464);
  *(void *)(v6 + 464) = v5;
}

void sub_3593C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  [*(id *)(*(void *)(a1 + 32) + 472) stopNavigationBarSpinner];
  uint64_t v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v_Block_object_dispose(&a9, 8) = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController: CDP enrollement finished.", (uint8_t *)&v8, 2u);
    }
  }
  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController: CDP flow failed with error. %@", (uint8_t *)&v8, 0xCu);
    }

    [*(id *)(a1 + 32) _postCDPRepairFollowUp];
  }
}

void sub_35BD8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    BOOL v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_35CD0;
    v10[3] = &unk_75410;
    id v11 = v7;
    id v12 = *(id *)(a1 + 48);
    [v11 loadRequest:v8 completion:v10];
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 48);
    if (v9) {
      (*(void (**)(uint64_t, void, id))(v9 + 16))(v9, 0, v6);
    }
  }
}

void sub_35CD0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v16 = v7;
    __int16 v17 = 1024;
    int v18 = a2;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "%@ done loading request with success %d. Error: %@", buf, 0x1Cu);
  }

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_35E3C;
  v10[3] = &unk_76118;
  id v8 = *(id *)(a1 + 40);
  char v14 = a2;
  id v13 = v8;
  id v11 = v5;
  id v12 = *(id *)(a1 + 32);
  id v9 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
}

uint64_t sub_35E3C(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 32));
  }
  return result;
}

id sub_36130(uint64_t a1)
{
  [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 showController:v3 animate:1];
}

void sub_364CC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v21 = v7;
    __int16 v22 = 2114;
    id v23 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Sign in preflight came back with success: %{public}@, error: %{public}@", buf, 0x16u);
  }

  if (!a2)
  {
    if ((objc_msgSend(v5, "ak_isAuthenticationErrorWithCode:", -7005) & 1) == 0)
    {
      id v8 = [v5 domain];
      if ([v8 isEqualToString:AASignInErrorDomain])
      {
        id v9 = [v5 code];

        if (v9 == (id)-8009) {
          goto LABEL_10;
        }
      }
      else
      {
      }
      [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
      goto LABEL_13;
    }
LABEL_10:
    uint64_t v10 = +[NSBundle bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"SIGN_IN_ERROR_UNREACHABLE_TITLE" value:&stru_76890 table:@"Localizable"];
    id v12 = +[NSBundle bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"SIGN_IN_ERROR_UNREACHABLE_MESSAGE" value:&stru_76890 table:@"Localizable"];
    char v14 = +[UIAlertController alertWithTitle:v11 message:v13];

    id v15 = +[NSBundle bundleForClass:objc_opt_class()];
    uint64_t v16 = [v15 localizedStringForKey:@"OK" value:&stru_76890 table:@"Localizable"];
    __int16 v17 = +[UIAlertAction actionWithTitle:v16 style:1 handler:0];
    [v14 addAction:v17];

    int v18 = *(void **)(a1 + 32);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_367D0;
    v19[3] = &unk_756F8;
    v19[4] = v18;
    [v18 presentViewController:v14 animated:1 completion:v19];

    goto LABEL_13;
  }
  [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
LABEL_13:
}

id sub_367D0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
}

void sub_37360(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  objc_destroyWeak(location);
  _Block_object_dispose((const void *)(v12 - 232), 8);
  objc_destroyWeak((id *)(v12 - 184));
  os_activity_scope_leave((os_activity_scope_state_t)(v12 - 176));
  _Unwind_Resume(a1);
}

void sub_3740C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v12 = v7;
    __int16 v13 = 2112;
    id v14 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Account sign out completed with success: %@, error: %@", buf, 0x16u);
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_37564;
  block[3] = &unk_76168;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  char v10 = a2;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v9);
}

void sub_37564(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [WeakRetained popRecursivelyToRootController];
      uint64_t v4 = +[UIDevice currentDevice];
      unint64_t v5 = (unint64_t)[v4 userInterfaceIdiom];

      if ((v5 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        id v6 = +[NSURL URLWithString:@"prefs:root=General"];
        CFStringRef v7 = +[LSApplicationWorkspace defaultWorkspace];
        [v7 openSensitiveURL:v6 withOptions:0];
      }
    }
    else
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_376BC;
      v10[3] = &unk_756F8;
      void v10[4] = WeakRetained;
      [WeakRetained dismissViewControllerAnimated:1 completion:v10];
    }
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    id v8 = *(NSObject **)(v9 + 40);
    *(void *)(v9 + 40) = 0;
  }
  else
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_4AAF4();
    }
  }
}

id sub_376BC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startObservingAccountStoreChanges];
}

void sub_376C4(id *a1, int a2, int a3)
{
  id v6 = a1 + 8;
  id WeakRetained = objc_loadWeakRetained(a1 + 8);
  id v8 = WeakRetained;
  if (a2 && a3)
  {
    uint64_t v9 = (void *)*((void *)WeakRetained + 62);
    uint64_t v10 = AIDAServiceTypeCloud;
    id v11 = [a1[4] copy];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_379D0;
    v26[3] = &unk_76208;
    id v30 = a1[7];
    objc_copyWeak(&v31, v6);
    id v27 = a1[5];
    id v28 = a1[4];
    id v29 = a1[6];
    [v9 signOutService:v10 withContext:v11 completion:v26];

    objc_destroyWeak(&v31);
    CFStringRef v12 = v30;
  }
  else if (a2)
  {
    __int16 v13 = (void *)*((void *)WeakRetained + 62);
    uint64_t v14 = AIDAServiceTypeCloud;
    id v15 = [a1[4] copy];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_37F74;
    v24[3] = &unk_75838;
    id v25 = a1[7];
    [v13 signOutService:v14 withContext:v15 completion:v24];

    CFStringRef v12 = v25;
  }
  else if (a3)
  {
    uint64_t v16 = (void *)*((void *)WeakRetained + 62);
    uint64_t v17 = AIDAServiceTypeStore;
    id v18 = [a1[4] copy];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_3806C;
    v22[3] = &unk_75838;
    id v23 = a1[7];
    [v16 signOutService:v17 withContext:v18 completion:v22];

    CFStringRef v12 = v23;
  }
  else
  {
    __int16 v19 = _AAUILogSystem();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v21 = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_DEFAULT, "Not signing out of any accounts...", (uint8_t *)&v21, 2u);
    }

    id v20 = (void (**)(id, void, void *))a1[7];
    CFStringRef v12 = +[NSError aa_errorWithCode:-1];
    v20[2](v20, 0, v12);
  }
}

void sub_379BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_379D0(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
    CFStringRef v7 = _AAUILogSystem();
    id v8 = v7;
    if (WeakRetained)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v29 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Signing out store account %@ now...", buf, 0xCu);
      }

      uint64_t v10 = (void *)WeakRetained[62];
      id v11 = [*(id *)(a1 + 40) copy];
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_37C4C;
      v21[3] = &unk_761E0;
      objc_copyWeak(&v26, (id *)(a1 + 64));
      uint64_t v12 = AIDAServiceTypeStore;
      id v25 = *(id *)(a1 + 56);
      char v27 = a2;
      id v22 = v5;
      id v23 = *(id *)(a1 + 48);
      id v24 = *(id *)(a1 + 40);
      [v10 signOutService:v12 withContext:v11 completion:v21];

      objc_destroyWeak(&v26);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_4AB28(v8, v14, v15, v16, v17, v18, v19, v20);
      }

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    __int16 v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_4ABA0();
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_37C30(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_37C4C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  CFStringRef v7 = _AAUILogSystem();
  id v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v9 = @"NO";
      if (a2) {
        CFStringRef v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v29 = v9;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Store sign out completed with success %@, error: %@", buf, 0x16u);
    }

    id v10 = objc_alloc_init((Class)AAUISignOutUtilities);
    uint64_t v11 = WeakRetained[62];
    uint64_t v12 = objc_msgSend(*(id *)(a1 + 40), "aa_altDSID");
    __int16 v13 = objc_msgSend(*(id *)(a1 + 40), "aa_personID");
    id v14 = [*(id *)(a1 + 48) copy];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_37E7C;
    v23[3] = &unk_761B8;
    id v26 = *(id *)(a1 + 56);
    char v27 = *(unsigned char *)(a1 + 72);
    id v24 = *(id *)(a1 + 32);
    id v25 = v10;
    id v15 = v10;
    [v15 signOutServiceAccountsWithServiceOwnersManager:v11 forAltDSID:v12 DSID:v13 context:v14 completion:v23];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_4AB28(v8, v16, v17, v18, v19, v20, v21, v22);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void sub_37E7C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Service accounts sign out completed with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_37F74(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Sign out of apple account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3806C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Sign out of store account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_38164(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) accountOperationsHelper];
  [v2 removeAccount:*(void *)(a1 + 40)];
}

void sub_381B8(id *a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  CFStringRef v7 = _AAUILogSystem();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Signing out of service accounts.", buf, 2u);
    }

    id v9 = objc_alloc_init((Class)AAUISignOutUtilities);
    uint64_t v10 = WeakRetained[62];
    id v11 = objc_msgSend(a1[4], "aa_altDSID");
    uint64_t v12 = objc_msgSend(a1[4], "aa_personID");
    id v13 = [a1[5] copy];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_383D8;
    v15[3] = &unk_761B8;
    id v18 = a1[6];
    char v19 = a2;
    id v16 = v5;
    id v17 = v9;
    id v14 = v9;
    [v14 signOutServiceAccountsWithServiceOwnersManager:v10 forAltDSID:v11 DSID:v12 context:v13 completion:v15];
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 138412290;
      id v21 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Failed to sign out apple account, error: %@", buf, 0xCu);
    }

    (*((void (**)(void))a1[6] + 2))();
  }
}

void sub_383D8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Service accounts sign out completed with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void sub_384D0(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v8 = 138412546;
    CFStringRef v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Sign out of store account completed with success: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_38BB8(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User opted to sign out of both accounts.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_38C3C(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User opted to sign out of apple account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_38CC0(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User opted to sign out of store account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_38D44(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "User opted to cancel sign out!", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_38F3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
}

id sub_38F58(uint64_t a1)
{
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Subscription Specifier loaded", v4, 2u);
  }

  [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
  return [*(id *)(a1 + 32) showController:*(void *)(a1 + 40) animate:1];
}

id sub_39048(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
}

id sub_390C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
}

void sub_392F8(uint64_t a1)
{
  id v2 = objc_alloc((Class)AAPaymentSummaryRequest);
  uint64_t v3 = [*(id *)(a1 + 32) _grandSlamAccount];
  uint64_t v4 = [*(id *)(a1 + 32) _accountStore];
  id v5 = [v2 initWithGrandSlamAccount:v3 accountStore:v4];

  id v6 = *(void **)(a1 + 32);
  if (v6[72])
  {
    objc_msgSend(v5, "setSecondaryAuthToken:");
    id v6 = *(void **)(a1 + 32);
  }
  CFStringRef v7 = [v6 _grandSlamAccount];
  int v8 = objc_msgSend(v7, "aida_tokenForService:", @"com.apple.gs.idms.hb");

  [v5 setHeartbeatToken:v8];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_394A4;
  v15[3] = &unk_762D0;
  void v15[4] = *(void *)(a1 + 32);
  CFStringRef v9 = objc_retainBlock(v15);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3959C;
  v12[3] = &unk_762F8;
  void v12[4] = *(void *)(a1 + 32);
  id v13 = v5;
  id v14 = v9;
  __int16 v10 = v9;
  id v11 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

void sub_394A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  _DWORD v5[2] = sub_39540;
  v5[3] = &unk_75130;
  v5[4] = *(void *)(a1 + 32);
  id v6 = v3;
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
}

void sub_39540(uint64_t a1)
{
  if (([*(id *)(*(void *)(a1 + 32) + 488) isCanceled] & 1) == 0) {
    [*(id *)(a1 + 32) _handlePaymentMethodSummaryResponse:*(void *)(a1 + 40)];
  }
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 488);
  *(void *)(v2 + 48_Block_object_dispose(&a9, 8) = 0;
}

id sub_3959C(void *a1)
{
  id v2 = [objc_alloc((Class)AARequester) initWithRequest:a1[5] handler:a1[6]];
  uint64_t v3 = a1[4];
  id v4 = *(void **)(v3 + 488);
  *(void *)(v3 + 48_Block_object_dispose(&a9, 8) = v2;

  uint64_t v5 = a1[4];
  id v6 = *(void **)(v5 + 752);
  uint64_t v7 = *(void *)(v5 + 488);

  return _[v6 addOperation:v7];
}

void sub_398C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_39D7C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = _AAUILogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_4AC3C(a1, v4);
    }
  }
}

void sub_3A758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3A77C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v7 = [v5 objectForKeyedSubscript:AKActionKey];
    unsigned int v8 = [v7 isEqualToString:AKActionCancel];

    if (v8)
    {
      if (*(unsigned char *)(a1 + 40))
      {
        id v9 = [WeakRetained dismissObjectModelsAnimated:1 completion:0];
      }
      else
      {
        __int16 v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)id v11 = 0;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Cancel action received for a non-modal flow", v11, 2u);
        }
      }
    }
  }
}

id sub_3AAE0(void *a1, uint64_t a2)
{
  id v2 = [a1 objectForKeyedSubscript:a2];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

void sub_3AB50(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  id v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    __int16 v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Updated account information with success: %@, error: %@", (uint8_t *)&v7, 0x16u);
  }
}

void sub_3BE20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3BE44(uint64_t a1, int a2)
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (a2) {
      CFStringRef v5 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    CFStringRef v12 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "401 handling completed with success: %@", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v7 = WeakRetained;
  if (a2)
  {
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_3BF84;
    v10[3] = &unk_756A8;
    void v10[4] = WeakRetained;
    [WeakRetained _retryRequest:v8 inRemoteUIController:v9 completion:v10];
  }
  else
  {
    [WeakRetained _stopSpinnerInActiveSpecifier];
  }
}

id sub_3BF84(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
}

id sub_3BF8C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopSpinnerInActiveSpecifier];
}

void sub_3C2E0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  CFStringRef v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Retry request completed with success: %@, error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, a2, v5);
  }
}

void sub_3C82C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5)
  {
    CFStringRef v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Error! Unable to get AKAppleIDServerResourceLoadDelegate. %@", buf, 0xCu);
    }
  }
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_3C984;
  v12[3] = &unk_763B0;
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v13 = v5;
  uint64_t v14 = v8;
  id v15 = v6;
  id v16 = v9;
  id v10 = v6;
  id v11 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
}

uint64_t sub_3C984(void *a1)
{
  id v2 = (void *)a1[4];
  if (v2) {
    objc_storeStrong((id *)(a1[5] + 456), v2);
  }
  uint64_t result = a1[7];
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void sub_3CBA4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      uint64_t v8 = "Successfully passed on auth response to AuthKit.";
      int v9 = v6;
      uint32_t v10 = 2;
LABEL_6:
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v11, v10);
    }
  }
  else if (v7)
  {
    int v11 = 138412290;
    id v12 = v5;
    uint64_t v8 = "Failed to inform AuhtKit of auth response! Error: %@.";
    int v9 = v6;
    uint32_t v10 = 12;
    goto LABEL_6;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_3CD7C(uint64_t a1, void *a2, void *a3)
{
  if (a2)
  {
    id v5 = a3;
    id v6 = a2;
    BOOL v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "Updating profile picture for account owner...", v8, 2u);
    }

    [*(id *)(*(void *)(a1 + 32) + 544) setProfilePictureForAccountOwner:v6 cropRect:v5];
  }
}

void sub_3CF44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3CF68(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _profilePictureStoreDidChange:v5];
  }
}

void sub_3D5DC(uint64_t a1, uint64_t a2, void *a3)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_3D6A0;
  v6[3] = &unk_76448;
  uint64_t v10 = a2;
  id v7 = a3;
  id v4 = *(id *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = v4;
  id v5 = v7;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_3D6A0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (!v2)
  {
    id v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "renewCredentialsForAccount succeeded for AAGrandSlamAppTokenIDAppleIDSettings.", buf, 2u);
    }

    id v6 = [*(id *)(a1 + 40) _accountStore];
    id v7 = [*(id *)(a1 + 40) _grandSlamAccount];
    uint64_t v8 = [v6 credentialForAccount:v7 serviceID:AAGrandSlamAppTokenIDAppleIDSettings];

    id v9 = [v8 token];
    uint64_t v10 = _AAUILogSystem();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Obtained new AppleID token from GS.", buf, 2u);
      }

      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      void v18[2] = sub_3DA38;
      v18[3] = &unk_75810;
      id v12 = *(void **)(a1 + 40);
      id v19 = *(id *)(a1 + 48);
      [v12 _requestSecondaryAuthenticationIfNecessaryWithGSToken:v9 completion:v18];

      goto LABEL_20;
    }
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "No AppleID token despite renewCredentialsForAccount reporting success!", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_19:
    uint64_t v14 = *(void **)(a1 + 40);
    uint64_t v8 = +[NSBundle bundleForClass:objc_opt_class()];
    id v15 = [v8 localizedStringForKey:@"SERVER_NO_CREDENTIALS_TITLE" value:&stru_76890 table:@"Localizable"];
    id v16 = +[NSBundle bundleForClass:objc_opt_class()];
    id v17 = [v16 localizedStringForKey:@"SERVER_NO_CREDENTIALS_MESSAGE" value:&stru_76890 table:@"Localizable"];
    [v14 _showAlertWithTitle:v15 message:v17];

LABEL_20:
    return;
  }
  if (v2 != 1)
  {
    if (v2 != 2) {
      return;
    }
    BOOL v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Failed to get new AppleID token. Error: %@", buf, 0xCu);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    goto LABEL_19;
  }
  id v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Failed to get new AppleID token because the user rejected the requests.", buf, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_3DA38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_3DBC8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_3DC8C;
  v7[3] = &unk_76498;
  id v5 = *(void **)(a1 + 40);
  v7[4] = *(void *)(a1 + 32);
  id v8 = v4;
  id v9 = v5;
  id v10 = *(id *)(a1 + 48);
  id v6 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v7);
}

id sub_3DC8C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleSecondaryAuthenticationResponse:*(void *)(a1 + 40) baseURL:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

void sub_3DF24(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = nullsub_5;
  block[3] = &unk_756F8;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id *sub_3E1FC(id *result, char a2)
{
  if ((a2 & 1) == 0) {
    return (id *)[result[4] _generateLoginCode];
  }
  return result;
}

id sub_3EB70(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  BOOL v3 = +[NSBundle bundleForClass:objc_opt_class()];
  id v4 = @"APPLEID_TITLE";
  if (([@"APPLEID_TITLE" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v5 = 0;
  }
  else
  {
    id v4 = [@"APPLEID_TITLE" stringByAppendingString:@"_REBRAND"];
    int v5 = 1;
  }
  id v6 = [v3 localizedStringForKey:v4 value:&stru_76890 table:@"Localizable"];
  id v7 = +[UIDevice currentDevice];
  unint64_t v8 = (unint64_t)[v7 userInterfaceIdiom];

  BOOL v9 = (v8 & 0xFFFFFFFFFFFFFFFBLL) == 1 && *(unsigned char *)(*(void *)(a1 + 32) + 585) == 0;
  [v2 stopValidationWithPrompt:v6 showButtons:v9];

  if (v5) {
  id v10 = *(void **)(a1 + 32);
  }

  return [v10 _accountEmailBecameVerified];
}

void sub_3F05C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F0D4;
  block[3] = &unk_756F8;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_3F0D4(uint64_t a1)
{
  return _[*(id *)(*(void *)(a1 + 32) + 624) enableInContext:3];
}

void sub_3F380(uint64_t a1)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_3F408;
  v2[3] = &unk_75130;
  uint64_t v1 = *(void **)(a1 + 40);
  void v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

void sub_3F408(uint64_t a1)
{
  id v2 = +[FMDFMIPManager sharedInstance];
  [v2 userNotifiedOfActivationLockForAllPairedDevices];

  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v8 = +[NSBundle bundleForClass:objc_opt_class()];
  int v5 = @"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH";
  if (([@"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH" containsString:@"REBRAND"] & 1) != 0
    || !_os_feature_enabled_impl())
  {
    int v6 = 0;
  }
  else
  {
    int v5 = [@"ENABLE_DEVICE_LOCATOR_MESSAGE_WATCH" stringByAppendingString:@"_REBRAND"];
    int v6 = 1;
  }
  id v7 = [v8 localizedStringForKey:v5 value:&stru_76890 table:@"Localizable"];
  [v3 _issueFindMyiPhonePromptWithTitle:v4 andMessage:v7];

  if (v6) {
}
  }

void sub_3F638(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3F65C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = _AAUILogSystem();
  int v6 = v5;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_4ADB4();
    }

    [WeakRetained _deviceLocatorStateDidChange:v3];
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_4AD80();
    }
  }
}

id sub_3F7EC(uint64_t a1)
{
  unsigned __int8 v2 = [*(id *)(*(void *)(a1 + 32) + 624) isChangingState];
  unsigned int v3 = [*(id *)(*(void *)(a1 + 32) + 624) isStateKnown];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 640);
  if (v5 && (v2 & 1) == 0)
  {
    if (v3
      && (unsigned int v6 = [*(id *)(v4 + 624) isEnabled],
          uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 640),
          v6))
    {
      id v7 = *(void (**)(void))(v5 + 16);
    }
    else
    {
      id v7 = *(void (**)(void))(v5 + 16);
    }
    v7();
    uint64_t v8 = *(void *)(a1 + 32);
    BOOL v9 = *(void **)(v8 + 640);
    *(void *)(v8 + 640) = 0;

    uint64_t v4 = *(void *)(a1 + 32);
  }
  id v10 = *(void **)(v4 + 224);
  *(void *)(v4 + 224) = 0;

  [*(id *)(a1 + 32) reloadSpecifiers];
  BOOL v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v13 = 0;
    _os_log_impl(&dword_0, v11, OS_LOG_TYPE_DEFAULT, "Account FMIP dataclass has changed", v13, 2u);
  }

  return [*(id *)(a1 + 32) refreshDetailTextForTableCellWithTag:1001];
}

void sub_3FABC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3FAE0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained presentCustodianSetupFlow:v3];
  }
  else
  {
    unsigned int v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_4ADE8();
    }
  }
}

void sub_3FCD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3FCF8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _forgetSpecifiers];
    [v2 reloadSpecifiers];
  }
  else
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_4AE1C();
    }
  }
}

id sub_3FEC0(uint64_t a1)
{
  [*(id *)(a1 + 32) _forgetSpecifiers];
  unsigned __int8 v2 = *(void **)(a1 + 32);

  return [v2 reloadSpecifiers];
}

void sub_3FFF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_40014(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    WeakRetained[590] = 0;
    unsigned __int8 v2 = WeakRetained;
    [WeakRetained _checkNetworkReachabilityAndValidateAccount];
    id WeakRetained = v2;
  }
}

void sub_40190(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_401B4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reloadSignoutGroupSpecifiersForName:@"Backup"];
}

id sub_404B0(uint64_t a1)
{
  [*(id *)(a1 + 32) tryLock];
  unsigned __int8 v2 = *(void **)(a1 + 32);

  return [v2 unlock];
}

id sub_409BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _handleAccountRegistrationCompletionWithResult:a2 error:a3];
}

void sub_40B38(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  if (!a2)
  {
    uint64_t v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Failed to save ACAccount after registration request succeeded. Error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

id sub_40BEC(uint64_t a1)
{
  [*(id *)(a1 + 32) _forgetSpecifiers];
  [*(id *)(a1 + 32) reloadSpecifiers];
  unsigned __int8 v2 = *(void **)(a1 + 32);

  return [v2 _presentFirstAlertIfNecessary];
}

void sub_40C30(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 592) unlock];
  unsigned __int8 v2 = (char *)[*(id *)(a1 + 40) code];
  id v3 = *(void **)(a1 + 40);
  if (v2 == (unsigned char *)&stru_158.reloff + 3)
  {
    uint64_t v4 = [v3 userInfo];
    id v11 = [v4 objectForKey:kAAProtocolErrorKey];

    unsigned int v5 = [v11 isEqualToString:kAAProtocolErrorMobileMeAccountMissingInfo];
    int v6 = *(void **)(a1 + 32);
    if (v5)
    {
      [*(id *)(a1 + 32) _updateAccountTermsInformation];
    }
    else
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = [v6 _appleAccount];
      [v6 _presentValidationErrorAlert:v9 account:v10];
    }
  }
  else
  {
    if (![v3 code]) {
      return;
    }
    uint64_t v8 = *(void **)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    id v11 = [v8 _appleAccount];
    [v8 _presentValidationErrorAlert:v7 account:v11];
  }
}

void sub_40FAC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _isPasswordRequiredToValidateAppleAccount:*(void *)(a1 + 40)];
  id v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 _accountStore];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_41094;
    v7[3] = &unk_76558;
    unsigned int v5 = *(void **)(a1 + 40);
    v7[4] = *(void *)(a1 + 32);
    id v8 = v5;
    [v4 renewCredentialsForAccount:v8 force:1 reason:0 completion:v7];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    [v3 _beginValidationForAccount:v6];
  }
}

void sub_41094(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2 == 1)
  {
    uint64_t v7 = _AAUILogSystem();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v11 = 0;
    id v8 = "Account revalidation aborted because the user canceled the password prompt.";
    uint64_t v9 = (uint8_t *)&v11;
LABEL_8:
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_9;
  }
  if (a2)
  {
    uint64_t v7 = _AAUILogSystem();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    __int16 v10 = 0;
    id v8 = "Account revalidation aborted because the user's password could not be obtained!";
    uint64_t v9 = (uint8_t *)&v10;
    goto LABEL_8;
  }
  [*(id *)(a1 + 32) _clearCachedSpecifierValues];
  uint64_t v6 = *(void **)(a1 + 32);
  uint64_t v7 = [*(id *)(a1 + 40) copy];
  [v6 _beginValidationForAccount:v7];
LABEL_9:
}

void sub_413D4(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _accountStore];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_414AC;
  v9[3] = &unk_76580;
  uint64_t v7 = *(void **)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  char v12 = a2;
  id v10 = v7;
  id v11 = v5;
  id v8 = v5;
  [v6 saveVerifiedAccount:v10 withCompletionHandler:v9];
}

void sub_414AC(uint64_t a1)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4155C;
  v3[3] = &unk_75AB8;
  unsigned int v2 = *(void **)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  id v4 = v2;
  char v6 = *(unsigned char *)(a1 + 56);
  id v5 = *(id *)(a1 + 48);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id sub_4155C(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _handleAccountRevalidationCompletionWithValidatedAccount:*(void *)(a1 + 40) success:*(unsigned __int8 *)(a1 + 56) error:*(void *)(a1 + 48)];
}

void sub_41A48(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) _accountStore];
  id v3 = _AAUILogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Will attempt to save because validation is done...", buf, 2u);
    }

    [v2 saveVerifiedAccount:*(void *)(a1 + 40) withCompletionHandler:0];
  }
  else
  {
    if (v4)
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "I don't have a store to save for some reason. This is wrong.", v5, 2u);
    }
  }
}

void sub_41B18(void *a1)
{
  [*(id *)(a1[4] + 592) unlock];
  if ([(id)a1[5] code] == (char *)&stru_158.reloff + 1)
  {
    unsigned int v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[6];
LABEL_3:
    [v2 _presentValidationErrorAlert:v3 account:v4];
    return;
  }
  id v5 = (char *)[(id)a1[5] code];
  char v6 = (void *)a1[5];
  if (v5 != (unsigned char *)&stru_158.reloff + 3)
  {
    if ([v6 code] == (id)-1)
    {
      *(unsigned char *)(a1[4] + 616) = 1;
      return;
    }
    if (![(id)a1[5] code]) {
      return;
    }
    unsigned int v2 = (void *)a1[4];
    uint64_t v3 = a1[5];
    uint64_t v4 = a1[7];
    goto LABEL_3;
  }
  uint64_t v7 = [v6 userInfo];
  id v9 = [v7 objectForKeyedSubscript:kAAProtocolErrorKey];

  if ([v9 isEqualToString:kAAProtocolErrorMobileMeAccountMissingInfo])
  {
    id v8 = (unsigned char *)a1[4];
    if (!v8[712])
    {
      if (v8[617]) {
        [v8 _updateAccountTermsInformation];
      }
      else {
        [v8 _presentValidationErrorAlert:a1[5] account:a1[6]];
      }
    }
  }
}

void sub_41E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_41E8C(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned int v2 = objc_msgSend(*(id *)(a1 + 32), "provisionedDataclasses", 0);
  id v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      char v6 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * (void)v6);
        id v8 = +[AADataclassManager sharedManager];
        if ([v8 canAutoEnableDataclass:v7 forAccount:*(void *)(a1 + 32)])
        {
          unsigned __int8 v9 = [*(id *)(a1 + 32) isEnabledForDataclass:v7];

          if ((v9 & 1) == 0)
          {
            [*(id *)(a1 + 32) setEnabled:1 forDataclass:v7];
            *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
          }
        }
        else
        {
        }
        char v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void sub_423B0(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _accountStore];
  unsigned int v2 = [*(id *)(a1 + 32) _appleAccount];
  [v3 saveAccount:v2 withCompletionHandler:&stru_765C8];
}

void sub_42424(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  id v4 = a3;
  uint64_t v5 = _AAUILogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    int v7 = 138412546;
    CFStringRef v8 = v6;
    __int16 v9 = 2112;
    long long v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Did save, did it work? %@, error is: %@", (uint8_t *)&v7, 0x16u);
  }
}

id sub_426DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) _handleAccountAutoVerificationCompletionWithSuccess:a2 error:a3];
}

void sub_42978(uint64_t a1, int a2)
{
  if (a2)
  {
    BOOL v3 = [*(id *)(a1 + 32) _appleAccount];
    unsigned int v4 = objc_msgSend(v3, "aa_isPrimaryEmailVerified");

    if (v4)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_42A2C;
      block[3] = &unk_756F8;
      void block[4] = *(void *)(a1 + 32);
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

id sub_42A2C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accountEmailBecameVerified];
}

void sub_42D98(uint64_t a1, uint64_t a2)
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_42E10;
  v2[3] = &unk_75398;
  void v2[4] = *(void *)(a1 + 32);
  void v2[5] = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v2);
}

id *sub_42E10(id *result)
{
  if (!result[5]) {
    return (id *)[result[4] reload];
  }
  return result;
}

id *sub_42E24(id *result)
{
  if (*((unsigned char *)result + 40)) {
    return (id *)[result[4] _updateAccountTermsInformation];
  }
  return result;
}

void sub_43884(uint64_t a1)
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  _DWORD v6[2] = sub_43924;
  v6[3] = &unk_75570;
  unsigned int v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void **)(a1 + 56);
  id v7 = v3;
  uint64_t v8 = v4;
  id v9 = v5;
  [v2 performDeviceToDeviceEncryptionStateRepairWithCompletion:v6];
}

void sub_43924(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  [*(id *)(a1 + 40) dismissViewControllerAnimated:1 completion:0];
  CFStringRef v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    int v9 = 138412546;
    CFStringRef v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "_handleUpgradeSecurityLevelActionURL completed with didRepair: %@ (Error: %@)", (uint8_t *)&v9, 0x16u);
  }

  if (a2 && *(void *)(a1 + 48))
  {
    uint64_t v8 = +[LSApplicationWorkspace defaultWorkspace];
    [v8 openApplicationWithBundleID:*(void *)(a1 + 48)];
  }
}

void sub_43BD4(id a1, BOOL a2, NSError *a3)
{
  if (a2)
  {
    id v3 = _AAUILogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Successfully completed displaying authkit server ui", v4, 2u);
    }
  }
}

void sub_43DB0(uint64_t a1)
{
  unsigned int v2 = +[PSNavBarSpinnerManager sharedSpinnerManager];
  [v2 stopAnimatingForIdentifier:@"cdpAction"];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 setUserInteractionEnabled:1];
}

void sub_43F34(id a1, NSDictionary *a2, NSError *a3)
{
  id v3 = a3;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController done with iForgot! Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_440E0(id a1, NSDictionary *a2, NSError *a3)
{
  id v3 = a3;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController done with change password! Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_44288(id a1, NSDictionary *a2, NSError *a3)
{
  id v3 = a3;
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    CFStringRef v6 = v3;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationController done! Error: %@", (uint8_t *)&v5, 0xCu);
  }
}

void sub_445B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v18 - 48));
  _Unwind_Resume(a1);
}

void sub_445E8(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v5)
    {
      [WeakRetained _showEDPTokenPaneWithToken:v5 onViewController:WeakRetained];
    }
    else
    {
      CFStringRef v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        sub_4AFBC();
      }

      id v11 = [objc_alloc((Class)AAUIEDPStateValidator) initWithPresentingViewController:v8];
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_44760;
      v12[3] = &unk_766E0;
      objc_copyWeak(&v14, (id *)(a1 + 40));
      void v12[4] = v8;
      id v13 = 0;
      [v11 repairPrimaryAppleAccountEDPStateWithCompletion:v12];

      objc_destroyWeak(&v14);
    }
  }
  else
  {
    int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_4AF88();
    }
  }
}

void sub_4474C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_44760(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  CFStringRef v7 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_44880;
      v11[3] = &unk_766B8;
      uint64_t v8 = *(void **)(a1 + 40);
      v11[4] = *(void *)(a1 + 32);
      id v12 = v8;
      [v7 fetchEDPTokenWithCompletion:v11];
    }
    else
    {
      CFStringRef v10 = _AAUILogSystem();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_4AFF0();
      }
    }
  }
  else
  {
    int v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_4B024();
    }
  }
}

void sub_44880(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (!a2 || v5)
  {
    CFStringRef v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_4B0A0();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _showEDPTokenPaneWithToken:*(void *)(a1 + 40) onViewController:*(void *)(a1 + 32)];
  }
}

void sub_449B4(uint64_t a1)
{
  unsigned int v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_4B11C();
  }

  id v3 = +[CDPStateSwiftUIProvider makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken:*(void *)(a1 + 32) presentingViewController:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) showViewController:v3 sender:*(void *)(a1 + 40)];
}

void sub_44BE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v20 - 64));
  _Unwind_Resume(a1);
}

void sub_44C0C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained && a2)
  {
    if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled])
    {
      uint64_t v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        sub_4B150();
      }

      int v9 = [*(id *)(a1 + 40) objectForKey:@"highlight"];

      if (v9)
      {
        CFStringRef v10 = [*(id *)(a1 + 40) objectForKey:@"highlight"];
        id v11 = _AAUILogSystem();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          sub_4AF20();
        }

        uint64_t v12 = +[AAUILegacyContactsViewFactory createViewModelWithAccountManager:*(void *)(*(void *)(a1 + 48) + 504)];

        id v13 = [objc_alloc((Class)AAUIAccountBeneficiaryViewController) initWithAccountManager:WeakRetained[63] highlightRowIdentifier:v10];
        id v7 = (id)v12;
        goto LABEL_18;
      }
      CFStringRef v10 = objc_loadWeakRetained((id *)(a1 + 64));
      id v16 = +[AAUILegacyContactsViewFactory createWithViewModel:v10];
    }
    else
    {
      id v14 = [*(id *)(a1 + 40) objectForKey:@"highlight"];

      if (!v14)
      {
        id v13 = [objc_alloc((Class)AAUIAccountBeneficiaryViewController) initWithAccountManager:WeakRetained[63]];
        goto LABEL_19;
      }
      CFStringRef v10 = [*(id *)(a1 + 40) objectForKey:@"highlight"];
      id v15 = _AAUILogSystem();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        sub_4AF20();
      }

      id v16 = [objc_alloc((Class)AAUIAccountBeneficiaryViewController) initWithAccountManager:WeakRetained[63] highlightRowIdentifier:v10];
    }
    id v13 = v16;
LABEL_18:

LABEL_19:
    [WeakRetained showViewController:v13 sender:WeakRetained];
    goto LABEL_20;
  }
  id v13 = _AAUILogSystem();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    sub_4B184();
  }
LABEL_20:
}

void sub_45D64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_45D80(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "AAUIAppleAccountViewController account store did change.", buf, 2u);
  }

  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    CFStringRef v10 = WeakRetained[95];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_45EA4;
    block[3] = &unk_75520;
    void block[4] = WeakRetained;
    id v12 = v5;
    id v13 = v6;
    dispatch_async(v10, block);
  }
}

void sub_45EA4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _reloadOptionsForChangesFromAccounts:*(void *)(a1 + 40) toAccounts:*(void *)(a1 + 48)];
  id v3 = _AAUILogSystem();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Account has changed, will reload specifiers.", buf, 2u);
    }

    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    _DWORD v5[2] = sub_45FBC;
    v5[3] = &unk_75398;
    v5[4] = *(void *)(a1 + 32);
    void v5[5] = v2;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v5);
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "No significant account change. Not reloading specifiers.", buf, 2u);
    }
  }
}

id *sub_45FBC(id *result)
{
  uint64_t v1 = result;
  id v2 = result[5];
  if ((v2 & 1) == 0)
  {
    if ((v2 & 2) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    [v1[4] _forgetSpecifiers];
    uint64_t result = (id *)[v1[4] reloadSpecifiers];
    if ((v1[5] & 4) == 0) {
      return result;
    }
    goto LABEL_7;
  }
  uint64_t result = (id *)[result[4] _setupIdentityCardHeader];
  id v2 = v1[5];
  if ((v2 & 2) != 0) {
    goto LABEL_6;
  }
LABEL_3:
  if ((v2 & 4) == 0) {
    return result;
  }
LABEL_7:
  id v3 = v1[4];

  return (id *)[v3 refreshDetailTextForTableCellWithTag:1002];
}

void sub_46288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_462AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412546;
    id v6 = (id)objc_opt_class();
    __int16 v7 = 2112;
    uint64_t v8 = ICQQuotaDidChangeNotification;
    id v3 = v6;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "[%@] Received notification: %@", (uint8_t *)&v5, 0x16u);
  }
  if (WeakRetained)
  {
    WeakRetained[801] = 0;
    BOOL v4 = (void *)*((void *)WeakRetained + 99);
    *((void *)WeakRetained + 99) = 0;
  }
}

Class sub_4696C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_90028)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_46AB0;
    void v3[4] = &unk_752D0;
    void v3[5] = v3;
    long long v4 = off_76750;
    uint64_t v5 = 0;
    qword_90028 = _sl_dlopen();
    if (!qword_90028)
    {
      abort_report_np();
LABEL_8:
      sub_4B2E0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("TUIOptInSpecifierProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_90020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_46AB0()
{
  uint64_t result = _sl_dlopen();
  qword_90028 = result;
  return result;
}

Class sub_46B24(uint64_t a1)
{
  if (!qword_90038) {
    qword_90038 = _sl_dlopen();
  }
  Class result = objc_getClass("AMSUIPaymentSpecifierProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_90030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_46C24()
{
  uint64_t result = _sl_dlopen();
  qword_90038 = result;
  return result;
}

Class sub_46C98(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_90048)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_46DDC;
    void v3[4] = &unk_752D0;
    void v3[5] = v3;
    long long v4 = off_76780;
    uint64_t v5 = 0;
    qword_90048 = _sl_dlopen();
    if (!qword_90048)
    {
      abort_report_np();
LABEL_8:
      sub_4B308();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("FASettingsSpecifierProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_90040 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_46DDC()
{
  uint64_t result = _sl_dlopen();
  qword_90048 = result;
  return result;
}

void sub_46E68(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t sub_472BC(uint64_t a1)
{
  return sub_473DC(a1, static AAUILogger.AAUI);
}

uint64_t AAUILogger.AAUI.unsafeMutableAddressor()
{
  return sub_47478(&qword_90050, (uint64_t)static AAUILogger.AAUI);
}

uint64_t sub_472F8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t static AAUILogger.AAUI.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_474F0(&qword_90050, (uint64_t)static AAUILogger.AAUI, a1);
}

uint64_t sub_47354(uint64_t a1)
{
  return sub_473DC(a1, static AAUILogger.pps);
}

uint64_t AAUILogger.pps.unsafeMutableAddressor()
{
  return sub_47478(&qword_90058, (uint64_t)static AAUILogger.pps);
}

uint64_t static AAUILogger.pps.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_474F0(&qword_90058, (uint64_t)static AAUILogger.pps, a1);
}

uint64_t sub_473B8(uint64_t a1)
{
  return sub_473DC(a1, static AAUILogger.extension);
}

uint64_t sub_473DC(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4B360();
  sub_47598(v3, a2);
  sub_472F8(v3, (uint64_t)a2);
  return sub_4B350();
}

uint64_t AAUILogger.extension.unsafeMutableAddressor()
{
  return sub_47478(&qword_90060, (uint64_t)static AAUILogger.extension);
}

uint64_t sub_47478(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_4B360();

  return sub_472F8(v3, a2);
}

uint64_t static AAUILogger.extension.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_474F0(&qword_90060, (uint64_t)static AAUILogger.extension, a1);
}

uint64_t sub_474F0@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_4B360();
  uint64_t v6 = sub_472F8(v5, a2);
  __int16 v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

ValueMetadata *type metadata accessor for AAUILogger()
{
  return &type metadata for AAUILogger;
}

uint64_t *sub_47598(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_475FC()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

id sub_4760C()
{
  type metadata accessor for ResourceBundleClass();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id result = [self bundleForClass:ObjCClassFromMetadata];
  qword_90070 = (uint64_t)result;
  return result;
}

uint64_t sub_47660(uint64_t a1)
{
  return sub_48284(a1, qword_901B8);
}

uint64_t sub_47684()
{
  return sub_4834C(&qword_90078, (uint64_t)qword_901B8);
}

uint64_t sub_476A8@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90078, (uint64_t)qword_901B8, a1);
}

uint64_t sub_476CC(uint64_t a1)
{
  return sub_48284(a1, qword_901D0);
}

uint64_t sub_476F0()
{
  return sub_4834C(&qword_90080, (uint64_t)qword_901D0);
}

uint64_t sub_47714@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90080, (uint64_t)qword_901D0, a1);
}

uint64_t sub_47738(uint64_t a1)
{
  return sub_48284(a1, qword_901E8);
}

uint64_t sub_4775C()
{
  return sub_4834C(&qword_90088, (uint64_t)qword_901E8);
}

uint64_t sub_47780@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90088, (uint64_t)qword_901E8, a1);
}

uint64_t sub_477A4(uint64_t a1)
{
  return sub_48284(a1, qword_90200);
}

uint64_t sub_477C8()
{
  return sub_4834C(&qword_90090, (uint64_t)qword_90200);
}

uint64_t sub_477EC@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90090, (uint64_t)qword_90200, a1);
}

uint64_t sub_47810(uint64_t a1)
{
  return sub_48284(a1, qword_90218);
}

uint64_t sub_4782C()
{
  return sub_4834C(&qword_90098, (uint64_t)qword_90218);
}

uint64_t sub_47850@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90098, (uint64_t)qword_90218, a1);
}

uint64_t sub_47874(uint64_t a1)
{
  return sub_48284(a1, qword_90230);
}

uint64_t sub_47890()
{
  return sub_4834C(&qword_900A0, (uint64_t)qword_90230);
}

uint64_t sub_478B4@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900A0, (uint64_t)qword_90230, a1);
}

uint64_t sub_478D8(uint64_t a1)
{
  return sub_48284(a1, qword_90248);
}

uint64_t sub_478F4()
{
  return sub_4834C(&qword_900A8, (uint64_t)qword_90248);
}

uint64_t sub_47918@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900A8, (uint64_t)qword_90248, a1);
}

uint64_t sub_4793C(uint64_t a1)
{
  return sub_48284(a1, qword_90260);
}

uint64_t sub_47958()
{
  return sub_4834C(&qword_900B0, (uint64_t)qword_90260);
}

uint64_t sub_4797C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900B0, (uint64_t)qword_90260, a1);
}

uint64_t sub_479A0(uint64_t a1)
{
  return sub_48284(a1, qword_90278);
}

uint64_t sub_479BC()
{
  return sub_4834C(&qword_900B8, (uint64_t)qword_90278);
}

uint64_t sub_479E0@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900B8, (uint64_t)qword_90278, a1);
}

uint64_t sub_47A04(uint64_t a1)
{
  return sub_48284(a1, qword_90290);
}

uint64_t sub_47A20()
{
  return sub_4834C(&qword_900C0, (uint64_t)qword_90290);
}

uint64_t sub_47A44@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900C0, (uint64_t)qword_90290, a1);
}

uint64_t sub_47A68(uint64_t a1)
{
  return sub_48284(a1, qword_902A8);
}

uint64_t sub_47A84()
{
  return sub_4834C(&qword_900C8, (uint64_t)qword_902A8);
}

uint64_t sub_47AA8@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900C8, (uint64_t)qword_902A8, a1);
}

uint64_t sub_47ACC(uint64_t a1)
{
  return sub_48284(a1, qword_902C0);
}

uint64_t sub_47AE8()
{
  return sub_4834C(&qword_900D0, (uint64_t)qword_902C0);
}

uint64_t sub_47B0C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900D0, (uint64_t)qword_902C0, a1);
}

uint64_t sub_47B30(uint64_t a1)
{
  return sub_48284(a1, qword_902D8);
}

uint64_t sub_47B4C()
{
  return sub_4834C(&qword_900D8, (uint64_t)qword_902D8);
}

uint64_t sub_47B70@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900D8, (uint64_t)qword_902D8, a1);
}

uint64_t sub_47B94(uint64_t a1)
{
  return sub_48284(a1, qword_902F0);
}

uint64_t sub_47BB8()
{
  return sub_4834C(&qword_900E0, (uint64_t)qword_902F0);
}

uint64_t sub_47BDC@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900E0, (uint64_t)qword_902F0, a1);
}

uint64_t sub_47C00(uint64_t a1)
{
  return sub_48284(a1, qword_90308);
}

uint64_t sub_47C24()
{
  return sub_4834C(&qword_900E8, (uint64_t)qword_90308);
}

uint64_t sub_47C48@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900E8, (uint64_t)qword_90308, a1);
}

uint64_t sub_47C6C(uint64_t a1)
{
  return sub_48284(a1, qword_90320);
}

uint64_t sub_47C90()
{
  return sub_4834C(&qword_900F0, (uint64_t)qword_90320);
}

uint64_t sub_47CB4@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900F0, (uint64_t)qword_90320, a1);
}

uint64_t sub_47CD8(uint64_t a1)
{
  return sub_48284(a1, qword_90338);
}

uint64_t sub_47CFC()
{
  return sub_4834C(&qword_900F8, (uint64_t)qword_90338);
}

uint64_t sub_47D20@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_900F8, (uint64_t)qword_90338, a1);
}

uint64_t sub_47D44(uint64_t a1)
{
  return sub_48284(a1, qword_90350);
}

uint64_t sub_47D68()
{
  return sub_4834C(&qword_90100, (uint64_t)qword_90350);
}

uint64_t sub_47D8C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90100, (uint64_t)qword_90350, a1);
}

uint64_t sub_47DB0(uint64_t a1)
{
  return sub_48284(a1, qword_90368);
}

uint64_t sub_47DD4()
{
  return sub_4834C(&qword_90108, (uint64_t)qword_90368);
}

uint64_t sub_47DF8@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90108, (uint64_t)qword_90368, a1);
}

uint64_t sub_47E1C(uint64_t a1)
{
  return sub_48284(a1, qword_90380);
}

uint64_t sub_47E40()
{
  return sub_4834C(&qword_90110, (uint64_t)qword_90380);
}

uint64_t sub_47E64@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90110, (uint64_t)qword_90380, a1);
}

uint64_t sub_47E88(uint64_t a1)
{
  return sub_48284(a1, qword_90398);
}

uint64_t sub_47EAC()
{
  return sub_4834C(&qword_90118, (uint64_t)qword_90398);
}

uint64_t sub_47ED0@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90118, (uint64_t)qword_90398, a1);
}

uint64_t sub_47EF4(uint64_t a1)
{
  return sub_48284(a1, qword_903B0);
}

uint64_t sub_47F18()
{
  return sub_4834C(&qword_90120, (uint64_t)qword_903B0);
}

uint64_t sub_47F3C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90120, (uint64_t)qword_903B0, a1);
}

uint64_t sub_47F60(uint64_t a1)
{
  return sub_48284(a1, qword_903C8);
}

uint64_t sub_47F8C()
{
  return sub_4834C(&qword_90128, (uint64_t)qword_903C8);
}

uint64_t sub_47FB0@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90128, (uint64_t)qword_903C8, a1);
}

uint64_t sub_47FD4(uint64_t a1)
{
  return sub_48284(a1, qword_903E0);
}

uint64_t sub_47FFC()
{
  return sub_4834C(&qword_90130, (uint64_t)qword_903E0);
}

uint64_t sub_48020@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90130, (uint64_t)qword_903E0, a1);
}

uint64_t sub_48044(uint64_t a1)
{
  return sub_48284(a1, qword_903F8);
}

uint64_t sub_48068()
{
  return sub_4834C(&qword_90138, (uint64_t)qword_903F8);
}

uint64_t sub_4808C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90138, (uint64_t)qword_903F8, a1);
}

uint64_t sub_480B0(uint64_t a1)
{
  return sub_48284(a1, qword_90410);
}

uint64_t sub_480D4()
{
  return sub_4834C(&qword_90140, (uint64_t)qword_90410);
}

uint64_t sub_480F8@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90140, (uint64_t)qword_90410, a1);
}

uint64_t sub_4811C(uint64_t a1)
{
  return sub_48284(a1, qword_90428);
}

uint64_t sub_48140()
{
  return sub_4834C(&qword_90148, (uint64_t)qword_90428);
}

uint64_t sub_48164@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90148, (uint64_t)qword_90428, a1);
}

uint64_t sub_48188(uint64_t a1)
{
  return sub_48284(a1, qword_90440);
}

uint64_t sub_481AC()
{
  return sub_4834C(&qword_90150, (uint64_t)qword_90440);
}

uint64_t sub_481D0@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90150, (uint64_t)qword_90440, a1);
}

uint64_t sub_481F4(uint64_t a1)
{
  return sub_48284(a1, qword_90458);
}

uint64_t sub_48218()
{
  return sub_4834C(&qword_90158, (uint64_t)qword_90458);
}

uint64_t sub_4823C@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90158, (uint64_t)qword_90458, a1);
}

uint64_t sub_48260(uint64_t a1)
{
  return sub_48284(a1, qword_90470);
}

uint64_t sub_48284(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_4B340();
  sub_47598(v3, a2);
  sub_472F8(v3, (uint64_t)a2);
  if (qword_90068 != -1) {
    swift_once();
  }
  id v4 = (id)qword_90070;
  return sub_4B330();
}

uint64_t sub_48328()
{
  return sub_4834C(&qword_90160, (uint64_t)qword_90470);
}

uint64_t sub_4834C(void *a1, uint64_t a2)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v3 = sub_4B340();

  return sub_472F8(v3, a2);
}

uint64_t sub_483A0@<X0>(uint64_t a1@<X8>)
{
  return sub_483C4(&qword_90160, (uint64_t)qword_90470, a1);
}

uint64_t sub_483C4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  if (*a1 != -1) {
    swift_once();
  }
  uint64_t v5 = sub_4B340();
  uint64_t v6 = sub_472F8(v5, a2);
  __int16 v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v7(a3, v6, v5);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_48480(id *a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  int v4 = 138412290;
  id v5 = WeakRetained;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", (uint8_t *)&v4, 0xCu);
}

void sub_48514(os_log_t log)
{
  int v1 = 136315138;
  id v2 = "+[UIImage(AppleAccountUI) circularImageFromCGImage:size:scale:]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s Couldn't create circular image", (uint8_t *)&v1, 0xCu);
}

void sub_48598(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 208);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "AAUIBaseDataclassDetailViewController: PSAppSettingsBundleIDKey is %@", (uint8_t *)&v3, 0xCu);
}

void sub_4861C(void *a1, NSObject *a2)
{
  int v3 = [a1 identifier];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Adding spinner to specifier: %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_486B4()
{
  uint64_t v0 = abort_report_np();
  return sub_486DC(v0);
}

void sub_486DC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "AuthKit authentication returned an error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_48754(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to handle error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_487CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_48804(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4883C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_48874(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to repair device to device encryption state, error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_488EC(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "AAUICDPSpecifierProvider: Reloading specifiers", v1, 2u);
}

void sub_48930(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Instantiating AAUIInviteMessageFlowController with nil cdpContext", v1, 2u);
}

void sub_48974(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AAUIInviteMessageFlowController _sendDefaultMessage]_block_invoke";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s failed to acquire strong ref.", (uint8_t *)&v1, 0xCu);
}

void sub_489F8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch metadata for message with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_48A70(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Message did not send!", v1, 2u);
}

void sub_48AB4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "MFMessageComposeViewController failed with other error", v1, 2u);
}

void sub_48AF8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "AAUIBaseDetailViewController: Loading AAUIBaseDataclassDetailViewController with bundleID: %@ and account: %@", (uint8_t *)&v3, 0x16u);
}

void sub_48B80(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Selection is invalid!", v1, 2u);
}

void sub_48BC4(void *a1, char a2, NSObject *a3)
{
  __int16 v5 = [a1 address];
  int v6 = 138478083;
  __int16 v7 = v5;
  __int16 v8 = 1024;
  int v9 = a2 & 1;
  _os_log_debug_impl(&dword_0, a3, OS_LOG_TYPE_DEBUG, "%{private}@ _isHandleReachable %d", (uint8_t *)&v6, 0x12u);
}

void sub_48C78(void *a1, uint64_t a2, NSObject *a3)
{
  int v6 = [a1 address];
  int v7 = 138478339;
  __int16 v8 = v6;
  __int16 v9 = 2112;
  uint64_t v10 = a1;
  __int16 v11 = 2112;
  uint64_t v12 = a2;
  _os_log_error_impl(&dword_0, a3, OS_LOG_TYPE_ERROR, "%{private}@ mismatch in tintColorForRecipient incoming %@ existing %@", (uint8_t *)&v7, 0x20u);
}

void sub_48D38(void *a1, NSObject *a2)
{
  int v3 = [a1 address];
  int v4 = 138477827;
  __int16 v5 = v3;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%{private}@ Missing AA SPI, skipping reachability check", (uint8_t *)&v4, 0xCu);
}

void sub_48DD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "flowManager %@", (uint8_t *)&v2, 0xCu);
}

void sub_48E4C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "matterhorn upgrade flow cancel", v1, 2u);
}

void sub_48E90(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "matterhorn upgrade flow complete", v1, 2u);
}

void sub_48ED4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Apps Syncing To Drive error : %@", (uint8_t *)&v2, 0xCu);
}

void sub_48F4C(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "AAUIiCloudViewController was instantiated without an AIDAAccountManager set on the launching specifier.", v1, 2u);
}

void sub_48F90()
{
}

void sub_48FBC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch device header image with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_49034(char a1, NSObject *a2)
{
  CFStringRef v2 = @"YES";
  if (a1) {
    CFStringRef v2 = @"NO";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "iCloudLogoutPolicy restricted: %@", (uint8_t *)&v3, 0xCu);
}

void sub_490C4()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIiCloudViewController - setting account manager", v2, v3, v4, v5, v6);
}

void sub_490F8()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Missing strongSelf. Stopping fetchCloudStorageSummary flow.", v2, v3, v4, v5, v6);
}

void sub_4912C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to fetch storage summary with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_491A4()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIiCloudViewController: adding CDP Web specifier", v2, v3, v4, v5, v6);
}

void sub_491D8()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIiCloudViewController: adding CDP specifier", v2, v3, v4, v5, v6);
}

void sub_4920C()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Account is nil, not displaying account settings cell.", v2, v3, v4, v5, v6);
}

void sub_49240()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Account is nil, not displaying account summary cell.", v2, v3, v4, v5, v6);
}

void sub_49274()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIiCloudViewController: fetching ADP state in background", v2, v3, v4, v5, v6);
}

void sub_492A8(char a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "AAUIiCloudViewController: fetched ADP state in background: %d", (uint8_t *)v2, 8u);
}

void sub_49324()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Missing strongSelf. AAUIiCloudViewController has been deallocated.", v2, v3, v4, v5, v6);
}

void sub_49358()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIiCloudViewController: ADP state changed, reloading specifier", v2, v3, v4, v5, v6);
}

void sub_4938C(unsigned __int8 *a1, unsigned __int8 *a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = *a2;
  v5[0] = 67109376;
  v5[1] = v3;
  __int16 v6 = 1024;
  int v7 = v4;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "AAUIiCloudViewController: cached state: %d, fetched state: %d", (uint8_t *)v5, 0xEu);
}

void sub_4941C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
}

void sub_494A4(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to sign in to iCloud with error: %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_49520(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Backups found. Attempting to find matching UDID in list.", v1, 2u);
}

void sub_49564(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error fetching backup list: %@", (uint8_t *)&v2, 0xCu);
}

void sub_495DC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Updating backup detail label as %@", (uint8_t *)&v2, 0xCu);
}

void sub_49654(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl(&dword_0, log, OS_LOG_TYPE_FAULT, "AAUIDataclassViewController was instantiated without an AIDAAccountManager set on the launching specifier", v1, 2u);
}

void sub_49698(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unbalanced call to -specifierProvider:willBeginLoadingSpecifier:, please file a radar! (provider: %@)", (uint8_t *)&v2, 0xCu);
}

void sub_49710(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Unbalanced call to -specifierProvider:didFinishLoadingSpecifier:, please file a radar! (provider: %@)", (uint8_t *)&v2, 0xCu);
}

void sub_49788(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "AAUIDataclassViewController Failed to load %{public}@ from bundle: %{public}@", (uint8_t *)&v3, 0x16u);
}

void sub_49810(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_49848(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_49880(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_498B8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_22420(&dword_0, a3, (uint64_t)a3, "%@: Reloading specifiers", (uint8_t *)a2);
}

void sub_498F8(uint64_t a1, NSObject *a2)
{
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_22438();
  sub_22420(&dword_0, a2, v5, "%@: Start observing web access changes.", v6);
}

void sub_4998C(uint64_t a1, NSObject *a2)
{
  int v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  sub_22438();
  sub_22420(&dword_0, a2, v5, "%@ Missing web access URL in the bag.", v6);
}

void sub_49A20()
{
  sub_22438();
  sub_22420(&dword_0, v0, v1, "Loading Remote UI request, %@", v2);
}

void sub_49A8C(uint64_t a1, NSObject *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v6 = NSStringFromClass(v5);
  int v7 = [*(id *)(a1 + 32) debugDescription];
  uint64_t v8 = *(void *)(a1 + 40);
  int v9 = 138412803;
  uint64_t v10 = v6;
  __int16 v11 = 2112;
  uint64_t v12 = v7;
  __int16 v13 = 2113;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%@: Request %@ completed with error: %{private}@", (uint8_t *)&v9, 0x20u);
}

void sub_49B7C()
{
  sub_22438();
  sub_22420(&dword_0, v0, v1, "Loading Remote UI request with response: %@", v2);
}

void sub_49BE8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Private email specifier tapped, url %@", (uint8_t *)&v2, 0xCu);
}

void sub_49C60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "private email specifier failed with error %@", (uint8_t *)&v2, 0xCu);
}

void sub_49CD8(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Calendar settings main feature not enabled", v1, 2u);
}

void sub_49D1C(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
}

void sub_49DA4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "AAUIMailSpecifierProvider not found", v1, 2u);
}

uint64_t sub_49DE8()
{
  uint64_t v0 = abort_report_np();
  return sub_49E10(v0);
}

void sub_49E10()
{
  sub_1A8A8();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "AAUIDataclassValidationController has been released, unable to continue validation", v1, 2u);
}

void sub_49E50()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Attempting to toggle dataclass switch on walrus account", v2, v3, v4, v5, v6);
}

void sub_49E84()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Account not eligible for walrus, will not observe walrus state changes", v2, v3, v4, v5, v6);
}

void sub_49EB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_49F24(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_49F90()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Account not eligible for walrus, will not observe manatee availability", v2, v3, v4, v5, v6);
}

void sub_49FC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4A030(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Returning TCC/Ubiquity Specifiers: %@", (uint8_t *)&v2, 0xCu);
}

void sub_4A0A8(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1);
  sub_2B894(&dword_0, v2, v3, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", v4, v5, v6, v7, 2u);
}

void sub_4A12C()
{
  sub_2E294();
  sub_2E2AC(&dword_0, v0, v1, "Fetched apps syncing to drive: %@, error: %@");
}

void sub_4A194()
{
  sub_2E294();
  sub_2E2AC(&dword_0, v0, v1, "Fetched storage used: %@, error: %@");
}

void sub_4A1FC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_0, a2, OS_LOG_TYPE_FAULT, "Delegate (%@) does not respond to 'specifierProvider:isDataclassAvailableForSpecifier:'", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_4A274()
{
  uint64_t v0 = abort_report_np();
  return sub_4A29C(v0);
}

void sub_4A29C()
{
  uint64_t v0 = (objc_class *)objc_opt_class();
  os_log_t v1 = NSStringFromClass(v0);
  sub_22438();
  sub_2FCE4();
  _os_log_debug_impl(v2, v3, v4, v5, v6, 0xCu);
}

void sub_4A32C(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_type_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  __int16 v11 = [a2 localizedDescription];
  sub_2FCE4();
  _os_log_debug_impl(v6, v7, v8, v9, v10, 0x16u);
}

void sub_4A3FC()
{
  sub_22438();
  sub_2FCC8(&dword_0, v0, v1, "Loading Remote UI request, %@", v2, v3, v4, v5, v6);
}

void sub_4A464(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  uint64_t v10 = [*(id *)(a1 + 32) debugDescription];
  sub_2FCE4();
  _os_log_debug_impl(v5, v6, v7, v8, v9, 0x20u);
}

void sub_4A54C()
{
  sub_22438();
  sub_2FCC8(&dword_0, v0, v1, "Done loading Remote UI request with response: %@", v2, v3, v4, v5, v6);
}

void sub_4A5B4()
{
  sub_22438();
  sub_2FCC8(&dword_0, v0, v1, "%@: RemoteUI dismiss flow.", v2, v3, v4, v5, v6);
}

void sub_4A61C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4A68C()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Attempted to set up AppleAccount header with no account!", v2, v3, v4, v5, v6);
}

void sub_4A6C0()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupAppleAccountHeader]: was called.", v2, v3, v4, v5, v6);
}

void sub_4A6F4()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupIdentityCardHeader]: was called.", v2, v3, v4, v5, v6);
}

void sub_4A728()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupIdentityCardHeader]: fetched Me Card.", v2, v3, v4, v5, v6);
}

void sub_4A75C()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupIdentityCardHeader]: Reloading specifiers.", v2, v3, v4, v5, v6);
}

void sub_4A790()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupIdentityCardHeader]: deallocated, skipping header view setup.", v2, v3, v4, v5, v6);
}

void sub_4A7C4()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _setupIdentityCardHeader]: layout identity card.", v2, v3, v4, v5, v6);
}

void sub_4A7F8()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _layoutTableHeaderView]: was called.", v2, v3, v4, v5, v6);
}

void sub_4A82C()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "[AAUIAppleAccountViewController _layoutIdentityCardHeader]: was called.", v2, v3, v4, v5, v6);
}

void sub_4A860()
{
  sub_2E294();
  _os_log_error_impl(&dword_0, v0, OS_LOG_TYPE_ERROR, "Failed to compare appleAltDSID (%@) with storeAltDSID (%@)!", v1, 0x16u);
}

void sub_4A8D8()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "No account exists, can't fetch cloud storage summary. Bailing.", v2, v3, v4, v5, v6);
}

void sub_4A90C()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "iCloudSettings feature flag Stelvio is not enabled. Falling back.", v2, v3, v4, v5, v6);
}

void sub_4A940()
{
  sub_22438();
  sub_28404(&dword_0, v0, v1, "Failed to fetch cloud storage summary with error: %@", v2, v3, v4, v5, v6);
}

void sub_4A9A8(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 context];
  sub_22438();
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Calling CDP repair with CDPContext=%@", v4, 0xCu);
}

void sub_4AA3C()
{
  sub_46E88();
  id v3 = [*v2 length];
  id v4 = [*(id *)(v1 + 368) length];
  int v5 = 134218240;
  id v6 = v3;
  __int16 v7 = 2048;
  id v8 = v4;
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "Calling CDPContext setNewPassword:oldPassword with password length=%lu, oldPassword length=%lu", (uint8_t *)&v5, 0x16u);
}

void sub_4AAF4()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Missing strong reference for dismiss!", v2, v3, v4, v5, v6);
}

void sub_4AB28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_4ABA0()
{
  sub_22438();
  sub_28404(&dword_0, v0, v1, "Failed to sign out apple account, error: %@", v2, v3, v4, v5, v6);
}

void sub_4AC08()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Unimplemented", v2, v3, v4, v5, v6);
}

void sub_4AC3C(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [*(id *)(a1 + 32) URL];
  sub_22438();
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "AAUIAppleAccountViewController shouldLoadRequest failed to open URL: %@", v4, 0xCu);
}

void sub_4ACD4()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "No request available to retry.", v2, v3, v4, v5, v6);
}

void sub_4AD08()
{
  sub_2E294();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "AAUI NameComponent change: %@/%@ (old/new)", v1, 0x16u);
}

void sub_4AD80()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "AAUIAppleAccountViewController missing reference for AADeviceLocatorStateDidChangeNotification", v2, v3, v4, v5, v6);
}

void sub_4ADB4()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "AAUIAppleAccountViewController observed AADeviceLocatorStateDidChangeNotification", v2, v3, v4, v5, v6);
}

void sub_4ADE8()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Missing strong reference. Skipping presenting custodian setup flow.", v2, v3, v4, v5, v6);
}

void sub_4AE1C()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Missing strong reference. Skipping observing RC upsell tip dismissed notification.", v2, v3, v4, v5, v6);
}

void sub_4AE50()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Authkit followup redirect url does not contain server urlkey.", v2, v3, v4, v5, v6);
}

void sub_4AE84()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Asking Authkit to present Server UI", v2, v3, v4, v5, v6);
}

void sub_4AEB8()
{
  sub_22438();
  sub_2FCC8(&dword_0, v0, v1, "Received a Authkit Followup Server UI launch. Redirecting to Authkit %@", v2, v3, v4, v5, v6);
}

void sub_4AF20()
{
  sub_22438();
  sub_2FCC8(&dword_0, v0, v1, "Highlight key: %@ is present in resourceDictionary.", v2, v3, v4, v5, v6);
}

void sub_4AF88()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Unable to show EDP token screen because strongSelf is nil.", v2, v3, v4, v5, v6);
}

void sub_4AFBC()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Attempting to repair EDP state.", v2, v3, v4, v5, v6);
}

void sub_4AFF0()
{
  sub_1A8A8();
  sub_AE9C(&dword_0, v0, v1, "Unable to show EDP token screen because strongCDPController is nil.", v2, v3, v4, v5, v6);
}

void sub_4B024()
{
  sub_46E88();
  objc_opt_class();
  sub_46E50();
  sub_46E68(&dword_0, v0, v1, "%@ - Unable to repair EDP state. Stopping flow with error %@", v2, v3, v4, v5, v6);
}

void sub_4B0A0()
{
  sub_46E88();
  objc_opt_class();
  sub_46E50();
  sub_46E68(&dword_0, v0, v1, "%@ - Unable to fetch EDP token after repair. Stopping flow with error %@", v2, v3, v4, v5, v6);
}

void sub_4B11C()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Presenting EDP Token Spyglass Pane", v2, v3, v4, v5, v6);
}

void sub_4B150()
{
  sub_1A8A8();
  sub_1A8B4(&dword_0, v0, v1, "Presenting new Legacy Contacts UI", v2, v3, v4, v5, v6);
}

void sub_4B184()
{
  sub_46E88();
  id WeakRetained = objc_loadWeakRetained(v0);
  objc_opt_class();
  sub_46E50();
  sub_46E68(&dword_0, v2, v3, "%@ - Unable to validate CDP state. Stopping beneficary flow with error %@", v4, v5, v6, v7, v8);
}

void sub_4B210()
{
  sub_22438();
  sub_28404(&dword_0, v0, v1, "Unbalanced call to -specifierProvider:willBeginLoadingSpecifier:, please file a radar! (provider: %@)", v2, v3, v4, v5, v6);
}

void sub_4B278()
{
  sub_22438();
  sub_28404(&dword_0, v0, v1, "Unbalanced call to -specifierProvider:didFinishLoadingSpecifier:, please file a radar! (provider: %@)", v2, v3, v4, v5, v6);
}

void sub_4B2E0()
{
  uint64_t v0 = abort_report_np();
  sub_4B308(v0);
}

void sub_4B308()
{
}

uint64_t sub_4B330()
{
  return ImageResource.init(name:bundle:)();
}

uint64_t sub_4B340()
{
  return type metadata accessor for ImageResource();
}

uint64_t sub_4B350()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_4B360()
{
  return type metadata accessor for Logger();
}

uint64_t AALocalizedStringForServiceType()
{
  return _AALocalizedStringForServiceType();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return _CFBundleGetIdentifier(bundle);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return _CFPreferencesGetAppBooleanValue(key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
}

void CGContextClip(CGContextRef c)
{
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
}

void CGContextRestoreGState(CGContextRef c)
{
}

void CGContextSaveGState(CGContextRef c)
{
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return _CGImageCreateWithImageInRect(image, rect);
}

void CGImageRelease(CGImageRef image)
{
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  return _CGRectApplyAffineTransform(rect, t);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t IMSPISendMessageWithAttachments()
{
  return _IMSPISendMessageWithAttachments();
}

uint64_t IMSPISendRichLink()
{
  return _IMSPISendRichLink();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return _NSLocalizedFileSizeDescription();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return _NSSelectorFromString(aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t PSBackupClass()
{
  return _PSBackupClass();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return _PSBundlePathForPreferenceBundle();
}

uint64_t PSIsiPad()
{
  return _PSIsiPad();
}

uint64_t TCCAccessCopyInformation()
{
  return _TCCAccessCopyInformation();
}

uint64_t TCCAccessSetForBundle()
{
  return _TCCAccessSetForBundle();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return _UIContentSizeCategoryIsAccessibilityCategory(category);
}

void UIGraphicsBeginImageContext(CGSize size)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return _UIGraphicsGetImageFromCurrentImageContext();
}

void UIRectFill(CGRect rect)
{
}

uint64_t UIRoundToScreenScale()
{
  return _UIRoundToScreenScale();
}

uint64_t UISystemRootDirectory()
{
  return _UISystemRootDirectory();
}

uint64_t _AALogSystem()
{
  return __AALogSystem();
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

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint64_t ct_green_tea_logger_create()
{
  return _ct_green_tea_logger_create();
}

uint64_t ct_green_tea_logger_destroy()
{
  return _ct_green_tea_logger_destroy();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t getCTGreenTeaOsLogHandle()
{
  return _getCTGreenTeaOsLogHandle();
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
}

void os_activity_scope_leave(os_activity_scope_state_t state)
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

uint64_t os_log_with_args()
{
  return _os_log_with_args();
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return _os_signpost_id_generate(log);
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
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

id objc_msgSend_CIImage(void *a1, const char *a2, ...)
{
  return _[a1 CIImage];
}

id objc_msgSend_DSIDForAccount_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "DSIDForAccount:service:");
}

id objc_msgSend_FMIPDeviceID(void *a1, const char *a2, ...)
{
  return _[a1 FMIPDeviceID];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend_URLWithString_relativeToURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:relativeToURL:");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__RUITableViewSectionForDevice_inPage_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_RUITableViewSectionForDevice:inPage:delegate:");
}

id objc_msgSend__aa_setAppleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aa_setAppleID:");
}

id objc_msgSend__aa_setPrimaryEmail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aa_setPrimaryEmail:");
}

id objc_msgSend__aaui_activityIndicatorView(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aaui_activityIndicatorView");
}

id objc_msgSend__aaui_currentRightBarButtonItems(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aaui_currentRightBarButtonItems");
}

id objc_msgSend__aaui_selectorForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aaui_selectorForKey:");
}

id objc_msgSend__aaui_setActivityIndicatorView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aaui_setActivityIndicatorView:");
}

id objc_msgSend__aaui_setCurrentRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_aaui_setCurrentRightBarButtonItems:");
}

id objc_msgSend__account(void *a1, const char *a2, ...)
{
  return _[a1 _account];
}

id objc_msgSend__accountAutoVerifier(void *a1, const char *a2, ...)
{
  return _[a1 _accountAutoVerifier];
}

id objc_msgSend__accountEmailBecameVerified(void *a1, const char *a2, ...)
{
  return _[a1 _accountEmailBecameVerified];
}

id objc_msgSend__accountForService_matchingAltDSID_DSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_accountForService:matchingAltDSID:DSID:");
}

id objc_msgSend__accountStore(void *a1, const char *a2, ...)
{
  return _[a1 _accountStore];
}

id objc_msgSend__activeAccount(void *a1, const char *a2, ...)
{
  return _[a1 _activeAccount];
}

id objc_msgSend__activeFaceTimeCall(void *a1, const char *a2, ...)
{
  return _[a1 _activeFaceTimeCall];
}

id objc_msgSend__addAccessInfo_forServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addAccessInfo:forServiceName:");
}

id objc_msgSend__addHeadersToRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addHeadersToRequest:");
}

id objc_msgSend__appAccessGrantedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appAccessGrantedForBundleID:");
}

id objc_msgSend__appSpecifiersForUbiquityServices(void *a1, const char *a2, ...)
{
  return _[a1 _appSpecifiersForUbiquityServices];
}

id objc_msgSend__appleAccount(void *a1, const char *a2, ...)
{
  return _[a1 _appleAccount];
}

id objc_msgSend__attemptSignInForServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptSignInForServiceType:");
}

id objc_msgSend__attemptUpdateAuthControllerWithActionableResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_attemptUpdateAuthControllerWithActionableResponse:");
}

id objc_msgSend__authController(void *a1, const char *a2, ...)
{
  return _[a1 _authController];
}

id objc_msgSend__autoVerifyAccount(void *a1, const char *a2, ...)
{
  return _[a1 _autoVerifyAccount];
}

id objc_msgSend__backupStatusString(void *a1, const char *a2, ...)
{
  return _[a1 _backupStatusString];
}

id objc_msgSend__beginManateeUpgradeAndEnableKeychain(void *a1, const char *a2, ...)
{
  return _[a1 _beginManateeUpgradeAndEnableKeychain];
}

id objc_msgSend__beginManateeUpgradeForAccount_failedDataclassName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginManateeUpgradeForAccount:failedDataclassName:");
}

id objc_msgSend__beginObservingCallStatusChanges(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingCallStatusChanges];
}

id objc_msgSend__beginObservingEmailVerificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingEmailVerificationStatus];
}

id objc_msgSend__beginObservingProfilePictureStoreDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingProfilePictureStoreDidChangeNotification];
}

id objc_msgSend__beginObservingiCloudRestoreStatus(void *a1, const char *a2, ...)
{
  return _[a1 _beginObservingiCloudRestoreStatus];
}

id objc_msgSend__beginValidationForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_beginValidationForAccount:");
}

id objc_msgSend__bodyLeading(void *a1, const char *a2, ...)
{
  return _[a1 _bodyLeading];
}

id objc_msgSend__bubbleImageForFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bubbleImageForFlow:");
}

id objc_msgSend__buildAppGroupHeaderSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _buildAppGroupHeaderSpecifiers];
}

id objc_msgSend__buildAppSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _buildAppSpecifiers];
}

id objc_msgSend__buildEmailSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildEmailSpecifier];
}

id objc_msgSend__buildHealthDataSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildHealthDataSpecifier];
}

id objc_msgSend__buildKeychainSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildKeychainSpecifier];
}

id objc_msgSend__buildPhotosSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildPhotosSpecifier];
}

id objc_msgSend__buildShowAllAppSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildShowAllAppSpecifier];
}

id objc_msgSend__buildUbiquitySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _buildUbiquitySpecifier];
}

id objc_msgSend__buildiCloudPlusSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _buildiCloudPlusSpecifiers];
}

id objc_msgSend__bundleForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_bundleForBundleID:");
}

id objc_msgSend__canHandleDataclassURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandleDataclassURL:");
}

id objc_msgSend__canHandleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_canHandleURL:");
}

id objc_msgSend__cancelMessageInvitationFlow(void *a1, const char *a2, ...)
{
  return _[a1 _cancelMessageInvitationFlow];
}

id objc_msgSend__cdpGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _cdpGroupSpecifier];
}

id objc_msgSend__cdpSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _cdpSpecifier];
}

id objc_msgSend__cdpWebGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _cdpWebGroupSpecifier];
}

id objc_msgSend__cdpWebSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _cdpWebSpecifier];
}

id objc_msgSend__checkNetworkReachabilityAndValidateAccount(void *a1, const char *a2, ...)
{
  return _[a1 _checkNetworkReachabilityAndValidateAccount];
}

id objc_msgSend__circularImageFromIcon_size_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_circularImageFromIcon:size:scale:");
}

id objc_msgSend__cleanupADPSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupADPSpecifiers];
}

id objc_msgSend__cleanupFromNetworkActivity(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupFromNetworkActivity];
}

id objc_msgSend__cleanupLoader(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupLoader];
}

id objc_msgSend__cleanupiCloudSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _cleanupiCloudSpecifiers];
}

id objc_msgSend__clearCachedSpecifierValues(void *a1, const char *a2, ...)
{
  return _[a1 _clearCachedSpecifierValues];
}

id objc_msgSend__clearSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _clearSpecifiers];
}

id objc_msgSend__cloudMessageDetailControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 _cloudMessageDetailControllerClass];
}

id objc_msgSend__cloudSpecifierForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cloudSpecifierForAccount:");
}

id objc_msgSend__contactSpecifierWasTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contactSpecifierWasTapped:");
}

id objc_msgSend__cropRectForRawImageOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_cropRectForRawImageOrientation:");
}

id objc_msgSend__currentWalrusStatus(void *a1, const char *a2, ...)
{
  return _[a1 _currentWalrusStatus];
}

id objc_msgSend__dataclassSwitchStateDidChange_forSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataclassSwitchStateDidChange:forSpecifier:");
}

id objc_msgSend__dateStringOfLatestBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dateStringOfLatestBackup:");
}

id objc_msgSend__detailViewController(void *a1, const char *a2, ...)
{
  return _[a1 _detailViewController];
}

id objc_msgSend__deviceList(void *a1, const char *a2, ...)
{
  return _[a1 _deviceList];
}

id objc_msgSend__deviceLocatorStateDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceLocatorStateDidChange:");
}

id objc_msgSend__deviceSpecificLocalizedStringKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_deviceSpecificLocalizedStringKey:");
}

id objc_msgSend__deviceTypeLabel(void *a1, const char *a2, ...)
{
  return _[a1 _deviceTypeLabel];
}

id objc_msgSend__didFinishSecondaryAuthentication(void *a1, const char *a2, ...)
{
  return _[a1 _didFinishSecondaryAuthentication];
}

id objc_msgSend__displayAccountSaveErrorAlertWithTitle_message_alternativeAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_displayAccountSaveErrorAlertWithTitle:message:alternativeAction:");
}

id objc_msgSend__enableAllProvisionedDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 _enableAllProvisionedDataclasses];
}

id objc_msgSend__familySpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _familySpecifierProvider];
}

id objc_msgSend__fetchCloudStorageSummary(void *a1, const char *a2, ...)
{
  return _[a1 _fetchCloudStorageSummary];
}

id objc_msgSend__fetchImageDataForLocalContact_ofSize_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchImageDataForLocalContact:ofSize:withCompletion:");
}

id objc_msgSend__fetchServerApps(void *a1, const char *a2, ...)
{
  return _[a1 _fetchServerApps];
}

id objc_msgSend__fetchServerImageDataFor_WithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchServerImageDataFor:WithCompletion:");
}

id objc_msgSend__fmipStatusString(void *a1, const char *a2, ...)
{
  return _[a1 _fmipStatusString];
}

id objc_msgSend__footerForBackupRow(void *a1, const char *a2, ...)
{
  return _[a1 _footerForBackupRow];
}

id objc_msgSend__forgetSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _forgetSpecifiers];
}

id objc_msgSend__generateLoginCode(void *a1, const char *a2, ...)
{
  return _[a1 _generateLoginCode];
}

id objc_msgSend__getLazyLoadedDeviceImage(void *a1, const char *a2, ...)
{
  return _[a1 _getLazyLoadedDeviceImage];
}

id objc_msgSend__getServerUILoadDelegateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getServerUILoadDelegateWithCompletion:");
}

id objc_msgSend__grandSlamAccount(void *a1, const char *a2, ...)
{
  return _[a1 _grandSlamAccount];
}

id objc_msgSend__grandSlamSigner(void *a1, const char *a2, ...)
{
  return _[a1 _grandSlamSigner];
}

id objc_msgSend__groupUbiquityServices_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_groupUbiquityServices:");
}

id objc_msgSend__handleAccountBeneficiaryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAccountBeneficiaryURL:");
}

id objc_msgSend__handleAccountRecoveryURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAccountRecoveryURL:");
}

id objc_msgSend__handleAuthActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAuthActionURL:");
}

id objc_msgSend__handleAuthkitFollowUpServerUI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleAuthkitFollowUpServerUI:");
}

id objc_msgSend__handleCDPActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCDPActionURL:");
}

id objc_msgSend__handleChangePasswordActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleChangePasswordActionURL:");
}

id objc_msgSend__handleEDPTokenPane(void *a1, const char *a2, ...)
{
  return _[a1 _handleEDPTokenPane];
}

id objc_msgSend__handleInsufficientStorageWithUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleInsufficientStorageWithUserInfo:");
}

id objc_msgSend__handleManateeErrorForAccount_withDescription_failedDataclasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleManateeErrorForAccount:withDescription:failedDataclasses:");
}

id objc_msgSend__handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleMaxTierAndInsufficientStorageErrorWithFailedDataclasses:");
}

id objc_msgSend__handleOONAddressVettingActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleOONAddressVettingActionURL:");
}

id objc_msgSend__handleObjectModelChangeForController_objectModel_isModal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleObjectModelChangeForController:objectModel:isModal:");
}

id objc_msgSend__handlePaymentMethodSummaryResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handlePaymentMethodSummaryResponse:");
}

id objc_msgSend__handleUpgradeSecurityLevelActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleUpgradeSecurityLevelActionURL:");
}

id objc_msgSend__handleiForgotActionURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleiForgotActionURL:");
}

id objc_msgSend__harvestWebAccessDataFromResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_harvestWebAccessDataFromResponse:");
}

id objc_msgSend__hasActiveSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _hasActiveSpecifier];
}

id objc_msgSend__headerGroupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _headerGroupSpecifiers];
}

id objc_msgSend__hideActivitySpinnerInNavigationBar(void *a1, const char *a2, ...)
{
  return _[a1 _hideActivitySpinnerInNavigationBar];
}

id objc_msgSend__iCloudBackupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _iCloudBackupSpecifier];
}

id objc_msgSend__iCloudBackupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _iCloudBackupSpecifiers];
}

id objc_msgSend__iconForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconForDataclass:");
}

id objc_msgSend__iconURLForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_iconURLForDevice:");
}

id objc_msgSend__identityCardViewController(void *a1, const char *a2, ...)
{
  return _[a1 _identityCardViewController];
}

id objc_msgSend__idsReachabilityDictionaryForRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_idsReachabilityDictionaryForRecipient:");
}

id objc_msgSend__imageByCroppingCGImageToRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageByCroppingCGImageToRect:");
}

id objc_msgSend__imageByCroppingCIImageToRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_imageByCroppingCIImageToRect:");
}

id objc_msgSend__initSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _initSpecifiers];
}

id objc_msgSend__initWithSourceImageData_cropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithSourceImageData:cropRect:");
}

id objc_msgSend__initiateServiceAuthHandler(void *a1, const char *a2, ...)
{
  return _[a1 _initiateServiceAuthHandler];
}

id objc_msgSend__initiateSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _initiateSpecifiers];
}

id objc_msgSend__invitationWasSent(void *a1, const char *a2, ...)
{
  return _[a1 _invitationWasSent];
}

id objc_msgSend__isAccountCleanupUIEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isAccountCleanupUIEnabled];
}

id objc_msgSend__isBeneficiaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 _isBeneficiaryAccount];
}

id objc_msgSend__isDataclassAllowlisted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDataclassAllowlisted:");
}

id objc_msgSend__isDataclassAvailableForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDataclassAvailableForSpecifier:");
}

id objc_msgSend__isDemoAccount(void *a1, const char *a2, ...)
{
  return _[a1 _isDemoAccount];
}

id objc_msgSend__isDocumentsAndDataEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isDocumentsAndDataEnabled:");
}

id objc_msgSend__isEligibleForWalrus(void *a1, const char *a2, ...)
{
  return _[a1 _isEligibleForWalrus];
}

id objc_msgSend__isEnabledForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isEnabledForAccount:");
}

id objc_msgSend__isFindMyIsInstalled(void *a1, const char *a2, ...)
{
  return _[a1 _isFindMyIsInstalled];
}

id objc_msgSend__isHandleReachable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isHandleReachable:");
}

id objc_msgSend__isHealthDataEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isHealthDataEnabled:");
}

id objc_msgSend__isHiddenDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isHiddenDataclass:");
}

id objc_msgSend__isPasswordRequiredToValidateAppleAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPasswordRequiredToValidateAppleAccount:");
}

id objc_msgSend__isPhotoStreamEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isPhotoStreamEnabled:");
}

id objc_msgSend__isRestoringFromiCloud(void *a1, const char *a2, ...)
{
  return _[a1 _isRestoringFromiCloud];
}

id objc_msgSend__isSingleIdentity(void *a1, const char *a2, ...)
{
  return _[a1 _isSingleIdentity];
}

id objc_msgSend__isSpecifierEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSpecifierEnabled:");
}

id objc_msgSend__isSpecifierHiddenForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isSpecifierHiddenForBundleID:");
}

id objc_msgSend__isSplitView(void *a1, const char *a2, ...)
{
  return _[a1 _isSplitView];
}

id objc_msgSend__isWebAccessEnabled(void *a1, const char *a2, ...)
{
  return _[a1 _isWebAccessEnabled];
}

id objc_msgSend__issueFindMyiPhonePromptWithTitle_andMessage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_issueFindMyiPhonePromptWithTitle:andMessage:");
}

id objc_msgSend__keychainSyncStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _keychainSyncStateDidChange];
}

id objc_msgSend__keychainSyncStatusDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _keychainSyncStatusDidChange];
}

id objc_msgSend__layoutIdentityCardHeader(void *a1, const char *a2, ...)
{
  return _[a1 _layoutIdentityCardHeader];
}

id objc_msgSend__layoutTableHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 _layoutTableHeaderView];
}

id objc_msgSend__loadCalendarSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _loadCalendarSpecifierProvider];
}

id objc_msgSend__loadCloudKitSettingsBundleIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _loadCloudKitSettingsBundleIfNeeded];
}

id objc_msgSend__loadCloudStorageSummary(void *a1, const char *a2, ...)
{
  return _[a1 _loadCloudStorageSummary];
}

id objc_msgSend__loadCustomDomainSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _loadCustomDomainSpecifierProvider];
}

id objc_msgSend__loadHealthSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _loadHealthSpecifierProvider];
}

id objc_msgSend__loadMailSettingsBundleIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _loadMailSettingsBundleIfNeeded];
}

id objc_msgSend__loadNotesDetailViewController(void *a1, const char *a2, ...)
{
  return _[a1 _loadNotesDetailViewController];
}

id objc_msgSend__loadPaymentMethodSummary(void *a1, const char *a2, ...)
{
  return _[a1 _loadPaymentMethodSummary];
}

id objc_msgSend__loadRemoteRequest_withIdentifier_preparation_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRemoteRequest:withIdentifier:preparation:completion:");
}

id objc_msgSend__loadRemoteRequest_withIdentifier_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRemoteRequest:withIdentifier:specifier:");
}

id objc_msgSend__loadRemoteUIForADPSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRemoteUIForADPSpecifier:");
}

id objc_msgSend__loadRemoteUIForEnablingWebAccessState_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadRemoteUIForEnablingWebAccessState:specifier:");
}

id objc_msgSend__loadSpecifierProviderWithClassName_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_loadSpecifierProviderWithClassName:inBundle:");
}

id objc_msgSend__loadiCloudDriveSettingsBundleIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _loadiCloudDriveSettingsBundleIfNeeded];
}

id objc_msgSend__matterhornUpsell_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_matterhornUpsell:");
}

id objc_msgSend__messageForError_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_messageForError:account:");
}

id objc_msgSend__notesDataclassDetailViewController(void *a1, const char *a2, ...)
{
  return _[a1 _notesDataclassDetailViewController];
}

id objc_msgSend__passcodeValueFromPage_withFieldIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_passcodeValueFromPage:withFieldIdentifier:");
}

id objc_msgSend__paymentSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _paymentSpecifierProvider];
}

id objc_msgSend__performNetworkValidation(void *a1, const char *a2, ...)
{
  return _[a1 _performNetworkValidation];
}

id objc_msgSend__performUpdateIfNeededOnSpecifier_forDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performUpdateIfNeededOnSpecifier:forDataclass:");
}

id objc_msgSend__personNameComponents(void *a1, const char *a2, ...)
{
  return _[a1 _personNameComponents];
}

id objc_msgSend__personNameComponentsForAccountCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_personNameComponentsForAccountCollection:");
}

id objc_msgSend__photoStreamSpecifierWasTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_photoStreamSpecifierWasTapped:");
}

id objc_msgSend__postAdpUpsellCFUCustodianInviteSentEvent(void *a1, const char *a2, ...)
{
  return _[a1 _postAdpUpsellCFUCustodianInviteSentEvent];
}

id objc_msgSend__postAdpUpsellCFUFamilyCustodianAddedEvent(void *a1, const char *a2, ...)
{
  return _[a1 _postAdpUpsellCFUFamilyCustodianAddedEvent];
}

id objc_msgSend__postCDPRepairFollowUp(void *a1, const char *a2, ...)
{
  return _[a1 _postCDPRepairFollowUp];
}

id objc_msgSend__prepareNextButton(void *a1, const char *a2, ...)
{
  return _[a1 _prepareNextButton];
}

id objc_msgSend__presentFirstAlertIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _presentFirstAlertIfNecessary];
}

id objc_msgSend__presentValidationErrorAlert_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentValidationErrorAlert:account:");
}

id objc_msgSend__presentiCloudUpgradeFlowForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentiCloudUpgradeFlowForSpecifier:");
}

id objc_msgSend__privateEmailSpecifierWasTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_privateEmailSpecifierWasTapped:");
}

id objc_msgSend__profilePictureStore(void *a1, const char *a2, ...)
{
  return _[a1 _profilePictureStore];
}

id objc_msgSend__profilePictureStoreDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_profilePictureStoreDidChange:");
}

id objc_msgSend__promptForAccountSignOutAppleAccount_storeAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_promptForAccountSignOutAppleAccount:storeAccount:completion:");
}

id objc_msgSend__promptUserToEnableFindMyiPhoneIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 _promptUserToEnableFindMyiPhoneIfPossible];
}

id objc_msgSend__properties(void *a1, const char *a2, ...)
{
  return _[a1 _properties];
}

id objc_msgSend__pushSecondaryAuthenticationRemoteUI_baseURL_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pushSecondaryAuthenticationRemoteUI:baseURL:withCompletion:");
}

id objc_msgSend__recoveryContactUpsellViewController(void *a1, const char *a2, ...)
{
  return _[a1 _recoveryContactUpsellViewController];
}

id objc_msgSend__refreshAppleIDSettingsTokensWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_refreshAppleIDSettingsTokensWithCompletion:");
}

id objc_msgSend__refreshKeychainState(void *a1, const char *a2, ...)
{
  return _[a1 _refreshKeychainState];
}

id objc_msgSend__registerAccount(void *a1, const char *a2, ...)
{
  return _[a1 _registerAccount];
}

id objc_msgSend__registerForKeychainSyncStatusChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _registerForKeychainSyncStatusChangeNotification];
}

id objc_msgSend__reloadADPStatusAndSpecifierIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _reloadADPStatusAndSpecifierIfNeeded];
}

id objc_msgSend__reloadOptionsForChangesFromAccounts_toAccounts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadOptionsForChangesFromAccounts:toAccounts:");
}

id objc_msgSend__reloadParentSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _reloadParentSpecifier];
}

id objc_msgSend__reloadSignoutGroupSpecifiersForName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_reloadSignoutGroupSpecifiersForName:");
}

id objc_msgSend__reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _reloadSpecifiers];
}

id objc_msgSend__requestSecondaryAuthenticationIfNecessaryWithGSToken_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestSecondaryAuthenticationIfNecessaryWithGSToken:completion:");
}

id objc_msgSend__retryRequest_inRemoteUIController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_retryRequest:inRemoteUIController:completion:");
}

id objc_msgSend__revalidateAccount(void *a1, const char *a2, ...)
{
  return _[a1 _revalidateAccount];
}

id objc_msgSend__scaleValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scaleValue:");
}

id objc_msgSend__sendEscapeOfferSelectedEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendEscapeOfferSelectedEvent:");
}

id objc_msgSend__sendRecoveryContactSendMessageLandingEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendRecoveryContactSendMessageLandingEvent:");
}

id objc_msgSend__sendTelemetryEventWithSuccess_didSucceed_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendTelemetryEventWithSuccess:didSucceed:error:");
}

id objc_msgSend__serviceContextWithResults_parentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceContextWithResults:parentViewController:");
}

id objc_msgSend__serviceNamesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_serviceNamesForBundleID:");
}

id objc_msgSend__servicesForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_servicesForBundleID:");
}

id objc_msgSend__setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setCornerRadius:");
}

id objc_msgSend__setProperties_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setProperties:");
}

id objc_msgSend__setShouldForceOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShouldForceOperation:");
}

id objc_msgSend__setupAppsSyncingToDriveSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupAppsSyncingToDriveSpecifier:");
}

id objc_msgSend__setupForNetworkActivity(void *a1, const char *a2, ...)
{
  return _[a1 _setupForNetworkActivity];
}

id objc_msgSend__setupIdentityCardHeader(void *a1, const char *a2, ...)
{
  return _[a1 _setupIdentityCardHeader];
}

id objc_msgSend__setupNavigationBarButtons(void *a1, const char *a2, ...)
{
  return _[a1 _setupNavigationBarButtons];
}

id objc_msgSend__setupStorageUsedSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupStorageUsedSpecifier:");
}

id objc_msgSend__setupSubviews(void *a1, const char *a2, ...)
{
  return _[a1 _setupSubviews];
}

id objc_msgSend__setupViewController(void *a1, const char *a2, ...)
{
  return _[a1 _setupViewController];
}

id objc_msgSend__shouldContinueDataclassChangeForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldContinueDataclassChangeForSpecifier:");
}

id objc_msgSend__shouldDisableiCloudUI(void *a1, const char *a2, ...)
{
  return _[a1 _shouldDisableiCloudUI];
}

id objc_msgSend__shouldRestrictSignoutMessage(void *a1, const char *a2, ...)
{
  return _[a1 _shouldRestrictSignoutMessage];
}

id objc_msgSend__shouldShowBackupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowBackupSpecifier];
}

id objc_msgSend__shouldShowDataclassSwitchForAppBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldShowDataclassSwitchForAppBundleID:");
}

id objc_msgSend__shouldShowDeleteAccountButton(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowDeleteAccountButton];
}

id objc_msgSend__shouldShowDeviceSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowDeviceSpecifiers];
}

id objc_msgSend__shouldShowStoreSettings(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowStoreSettings];
}

id objc_msgSend__shouldShowSyncingToDriveGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowSyncingToDriveGroupSpecifier];
}

id objc_msgSend__shouldShowUbiquitySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _shouldShowUbiquitySpecifier];
}

id objc_msgSend__showAccountDetailsUnavailableAlert(void *a1, const char *a2, ...)
{
  return _[a1 _showAccountDetailsUnavailableAlert];
}

id objc_msgSend__showActivitySpinnerInNavigationBar(void *a1, const char *a2, ...)
{
  return _[a1 _showActivitySpinnerInNavigationBar];
}

id objc_msgSend__showAlertWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertWithTitle:message:");
}

id objc_msgSend__showBackupController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showBackupController:");
}

id objc_msgSend__showDefaultMessageView(void *a1, const char *a2, ...)
{
  return _[a1 _showDefaultMessageView];
}

id objc_msgSend__showEDPTokenPaneWithToken_onViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showEDPTokenPaneWithToken:onViewController:");
}

id objc_msgSend__showInvitationSent(void *a1, const char *a2, ...)
{
  return _[a1 _showInvitationSent];
}

id objc_msgSend__showSpecifierForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSpecifierForDataclass:");
}

id objc_msgSend__siwaSpecifierForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_siwaSpecifierForAccount:");
}

id objc_msgSend__specifierAttributedLink(void *a1, const char *a2, ...)
{
  return _[a1 _specifierAttributedLink];
}

id objc_msgSend__specifierForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierForDataclass:");
}

id objc_msgSend__specifierForDataclass_withCustomDetailClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierForDataclass:withCustomDetailClass:");
}

id objc_msgSend__specifierForDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifierForDevice:");
}

id objc_msgSend__specifierForError(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForError];
}

id objc_msgSend__specifierForHealth(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForHealth];
}

id objc_msgSend__specifierForHealthData(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForHealthData];
}

id objc_msgSend__specifierForKeychainSync(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForKeychainSync];
}

id objc_msgSend__specifierForLookMeUpByEmail(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForLookMeUpByEmail];
}

id objc_msgSend__specifierForMessagesDataclass(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForMessagesDataclass];
}

id objc_msgSend__specifierForPhotoStream(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForPhotoStream];
}

id objc_msgSend__specifierForSpinner(void *a1, const char *a2, ...)
{
  return _[a1 _specifierForSpinner];
}

id objc_msgSend__specifierSubTitle(void *a1, const char *a2, ...)
{
  return _[a1 _specifierSubTitle];
}

id objc_msgSend__specifierTitle(void *a1, const char *a2, ...)
{
  return _[a1 _specifierTitle];
}

id objc_msgSend__specifiersForAccountGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForAccountGroup];
}

id objc_msgSend__specifiersForAppListVC(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForAppListVC];
}

id objc_msgSend__specifiersForAppsGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForAppsGroup];
}

id objc_msgSend__specifiersForAppsSyncingToDrive(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForAppsSyncingToDrive];
}

id objc_msgSend__specifiersForDeviceList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_specifiersForDeviceList:");
}

id objc_msgSend__specifiersForDevicesGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForDevicesGroup];
}

id objc_msgSend__specifiersForFamily(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForFamily];
}

id objc_msgSend__specifiersForFollowupGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForFollowupGroup];
}

id objc_msgSend__specifiersForProvisionedDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForProvisionedDataclasses];
}

id objc_msgSend__specifiersForServerProvidedFooter(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForServerProvidedFooter];
}

id objc_msgSend__specifiersForServicesGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForServicesGroup];
}

id objc_msgSend__specifiersForSignoutGroup(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForSignoutGroup];
}

id objc_msgSend__specifiersForStore(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForStore];
}

id objc_msgSend__specifiersForiCloudVC(void *a1, const char *a2, ...)
{
  return _[a1 _specifiersForiCloudVC];
}

id objc_msgSend__startListeningForForegrounding(void *a1, const char *a2, ...)
{
  return _[a1 _startListeningForForegrounding];
}

id objc_msgSend__startMonitoringReachability(void *a1, const char *a2, ...)
{
  return _[a1 _startMonitoringReachability];
}

id objc_msgSend__startObservingADPStateChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingADPStateChangeNotification];
}

id objc_msgSend__startObservingAccountStoreChanges(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingAccountStoreChanges];
}

id objc_msgSend__startObservingDeviceLocatorStateChanges(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingDeviceLocatorStateChanges];
}

id objc_msgSend__startObservingNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingNotifications];
}

id objc_msgSend__startObservingPresentCustodianSetupNotification(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingPresentCustodianSetupNotification];
}

id objc_msgSend__startObservingQuotaChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingQuotaChangeNotifications];
}

id objc_msgSend__startObservingRCUpsellTipDismissedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingRCUpsellTipDismissedNotification];
}

id objc_msgSend__startObservingTCCAccessChanges(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingTCCAccessChanges];
}

id objc_msgSend__startObservingWalrusStateChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingWalrusStateChangeNotification];
}

id objc_msgSend__startObservingWebAccessChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _startObservingWebAccessChangeNotification];
}

id objc_msgSend__startSpinnerInSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startSpinnerInSpecifier:");
}

id objc_msgSend__startUsingiCloudDriveWithSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_startUsingiCloudDriveWithSpecifier:");
}

id objc_msgSend__stopListeningForKeychainSyncStatusChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopListeningForKeychainSyncStatusChangeNotification];
}

id objc_msgSend__stopMonitoringReachability(void *a1, const char *a2, ...)
{
  return _[a1 _stopMonitoringReachability];
}

id objc_msgSend__stopObservingADPStateChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingADPStateChangeNotification];
}

id objc_msgSend__stopObservingAccountStoreChanges(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingAccountStoreChanges];
}

id objc_msgSend__stopObservingCallStatusChanges(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingCallStatusChanges];
}

id objc_msgSend__stopObservingDeviceLocatorStateChanges(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingDeviceLocatorStateChanges];
}

id objc_msgSend__stopObservingEmailVerificationStatus(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingEmailVerificationStatus];
}

id objc_msgSend__stopObservingNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingNotifications];
}

id objc_msgSend__stopObservingPresentCustodianSetupNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingPresentCustodianSetupNotification];
}

id objc_msgSend__stopObservingProfilePictureStoreDidChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingProfilePictureStoreDidChangeNotification];
}

id objc_msgSend__stopObservingQuotaChangeNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingQuotaChangeNotifications];
}

id objc_msgSend__stopObservingRCUpsellTipDismissedNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingRCUpsellTipDismissedNotification];
}

id objc_msgSend__stopObservingRestrictionChanges(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingRestrictionChanges];
}

id objc_msgSend__stopObservingTCCAccessChanges(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingTCCAccessChanges];
}

id objc_msgSend__stopObservingWalrusStateChangeNotification(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingWalrusStateChangeNotification];
}

id objc_msgSend__stopObservingiCloudRestoreStatus(void *a1, const char *a2, ...)
{
  return _[a1 _stopObservingiCloudRestoreStatus];
}

id objc_msgSend__stopSpinnerInActiveSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _stopSpinnerInActiveSpecifier];
}

id objc_msgSend__stopSpinnerInActiveSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_stopSpinnerInActiveSpecifier:");
}

id objc_msgSend__storageUsedGroupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _storageUsedGroupSpecifiers];
}

id objc_msgSend__storeAccount(void *a1, const char *a2, ...)
{
  return _[a1 _storeAccount];
}

id objc_msgSend__storeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _storeSpecifier];
}

id objc_msgSend__storeSpecifierForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_storeSpecifierForAccount:");
}

id objc_msgSend__storeSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 _storeSpecifierProvider];
}

id objc_msgSend__superDataclassSwitchStateDidChange_withSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_superDataclassSwitchStateDidChange:withSpecifier:");
}

id objc_msgSend__switchSpecifierWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_switchSpecifierWithTitle:");
}

id objc_msgSend__syncingToDriveGroupSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _syncingToDriveGroupSpecifiers];
}

id objc_msgSend__titleForError_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_titleForError:account:");
}

id objc_msgSend__tobleroneKeychainSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 _tobleroneKeychainSpecifiers];
}

id objc_msgSend__ubiquitySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _ubiquitySpecifier];
}

id objc_msgSend__updateAccountTermsInformation(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccountTermsInformation];
}

id objc_msgSend__updateCacheGranted_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateCacheGranted:forBundleID:");
}

id objc_msgSend__updateLabelFonts(void *a1, const char *a2, ...)
{
  return _[a1 _updateLabelFonts];
}

id objc_msgSend__updateLabelVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateLabelVisibility];
}

id objc_msgSend__updateLocalAccountInformationFromClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLocalAccountInformationFromClientInfo:");
}

id objc_msgSend__updateOverlayViewVisibility(void *a1, const char *a2, ...)
{
  return _[a1 _updateOverlayViewVisibility];
}

id objc_msgSend__urlSession(void *a1, const char *a2, ...)
{
  return _[a1 _urlSession];
}

id objc_msgSend__validateDataclassAccessForSpecifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_validateDataclassAccessForSpecifier:completion:");
}

id objc_msgSend__valueForPaymentSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_valueForPaymentSpecifier:");
}

id objc_msgSend__walrusPresentUnknownErrorWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_walrusPresentUnknownErrorWithCompletionHandler:");
}

id objc_msgSend__walrusValidateAccessForDataclass_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_walrusValidateAccessForDataclass:completion:");
}

id objc_msgSend_aa_accountFirstDisplayAlert(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_accountFirstDisplayAlert");
}

id objc_msgSend_aa_accountFooterButton(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_accountFooterButton");
}

id objc_msgSend_aa_accountFooterText(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_accountFooterText");
}

id objc_msgSend_aa_addDeviceProvisioningInfoHeadersWithDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_addDeviceProvisioningInfoHeadersWithDSID:");
}

id objc_msgSend_aa_altDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_altDSID");
}

id objc_msgSend_aa_appearsToBeEmail(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appearsToBeEmail");
}

id objc_msgSend_aa_appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appearsToBePhoneNumber");
}

id objc_msgSend_aa_appleAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_appleAccountWithAltDSID:");
}

id objc_msgSend_aa_authToken(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_authToken");
}

id objc_msgSend_aa_cloudKitAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_cloudKitAccount");
}

id objc_msgSend_aa_displayName(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_displayName");
}

id objc_msgSend_aa_errorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_errorWithCode:");
}

id objc_msgSend_aa_formattedUsername(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_formattedUsername");
}

id objc_msgSend_aa_isAccountClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isAccountClass:");
}

id objc_msgSend_aa_isFamilyEligible(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isFamilyEligible");
}

id objc_msgSend_aa_isManagedAppleID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isManagedAppleID");
}

id objc_msgSend_aa_isPrimaryAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isPrimaryAccount");
}

id objc_msgSend_aa_isPrimaryEmailVerified(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isPrimaryEmailVerified");
}

id objc_msgSend_aa_isRemotelyManaged(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isRemotelyManaged");
}

id objc_msgSend_aa_isSuspended(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isSuspended");
}

id objc_msgSend_aa_isSyncedAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isSyncedAccount");
}

id objc_msgSend_aa_isUnremovableRemotelyManagedAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isUnremovableRemotelyManagedAccount");
}

id objc_msgSend_aa_isUsingCloudDocs(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_isUsingCloudDocs");
}

id objc_msgSend_aa_needsEmailConfiguration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_needsEmailConfiguration");
}

id objc_msgSend_aa_needsRegistration(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_needsRegistration");
}

id objc_msgSend_aa_needsToVerifyTerms(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_needsToVerifyTerms");
}

id objc_msgSend_aa_password(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_password");
}

id objc_msgSend_aa_personID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_personID");
}

id objc_msgSend_aa_primaryAppleAccount(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_primaryAppleAccount");
}

id objc_msgSend_aa_registerAppleAccount_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_registerAppleAccount:withCompletion:");
}

id objc_msgSend_aa_repairState(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_repairState");
}

id objc_msgSend_aa_serverDisabledDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_serverDisabledDataclass:");
}

id objc_msgSend_aa_serviceUnavailable(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_serviceUnavailable");
}

id objc_msgSend_aa_setFirstName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setFirstName:");
}

id objc_msgSend_aa_setLastName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setLastName:");
}

id objc_msgSend_aa_setMiddleName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_setMiddleName:");
}

id objc_msgSend_aa_suspensionInfo(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_suspensionInfo");
}

id objc_msgSend_aa_updatePropertiesForAppleAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aa_updatePropertiesForAppleAccount:completion:");
}

id objc_msgSend_aaf_arrayAsCommaSeperatedString(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaf_arrayAsCommaSeperatedString");
}

id objc_msgSend_aaf_isToday(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaf_isToday");
}

id objc_msgSend_aaf_map_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaf_map:");
}

id objc_msgSend_aas_hasiCloudSignOutRestriction(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aas_hasiCloudSignOutRestriction");
}

id objc_msgSend_aaui_loadBundle_atPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_loadBundle:atPath:");
}

id objc_msgSend_aaui_localizedDeviceLocatorLabel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_localizedDeviceLocatorLabel");
}

id objc_msgSend_aaui_overrideAccessorsWithTarget_getter_setter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_overrideAccessorsWithTarget:getter:setter:");
}

id objc_msgSend_aaui_performSuperGetter(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_performSuperGetter");
}

id objc_msgSend_aaui_performSuperSetterWithValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_performSuperSetterWithValue:");
}

id objc_msgSend_aaui_startSpinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_startSpinner");
}

id objc_msgSend_aaui_stopSpinner(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aaui_stopSpinner");
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return _[a1 absoluteString];
}

id objc_msgSend_absoluteURL(void *a1, const char *a2, ...)
{
  return _[a1 absoluteURL];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return _[a1 account];
}

id objc_msgSend_accountDidChangeFromAccount_toAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountDidChangeFromAccount:toAccount:");
}

id objc_msgSend_accountForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountForService:");
}

id objc_msgSend_accountHeaderLabel(void *a1, const char *a2, ...)
{
  return _[a1 accountHeaderLabel];
}

id objc_msgSend_accountHeaderSublabel(void *a1, const char *a2, ...)
{
  return _[a1 accountHeaderSublabel];
}

id objc_msgSend_accountManager(void *a1, const char *a2, ...)
{
  return _[a1 accountManager];
}

id objc_msgSend_accountMatchesPrimaryAccount_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountMatchesPrimaryAccount:service:");
}

id objc_msgSend_accountOperationsHelper(void *a1, const char *a2, ...)
{
  return _[a1 accountOperationsHelper];
}

id objc_msgSend_accountPropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "accountPropertyForKey:");
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return _[a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return _[a1 accountType];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return _[a1 accounts];
}

id objc_msgSend_actionURL(void *a1, const char *a2, ...)
{
  return _[a1 actionURL];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activeSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 activeSpecifier];
}

id objc_msgSend_acui_dataclass(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_dataclass");
}

id objc_msgSend_acui_iconForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_iconForDataclass:");
}

id objc_msgSend_acui_linkListCellSpecifierForDataclass_account_target_set_get_detail_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_linkListCellSpecifierForDataclass:account:target:set:get:detail:");
}

id objc_msgSend_acui_specifierForDataclass_account_target_set_get_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acui_specifierForDataclass:account:target:set:get:");
}

id objc_msgSend_addAccountChangeObserver_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAccountChangeObserver:handler:");
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addBackgroundForImage_withBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addBackgroundForImage:withBackgroundColor:");
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChildViewController:");
}

id objc_msgSend_addConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addConstraints:");
}

id objc_msgSend_addEmailURL(void *a1, const char *a2, ...)
{
  return _[a1 addEmailURL];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addNetworkReachableObserver_selector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addNetworkReachableObserver:selector:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:queue:usingBlock:");
}

id objc_msgSend_addObserverForName_object_suspensionBehavior_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserverForName:object:suspensionBehavior:queue:usingBlock:");
}

id objc_msgSend_addRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addRow:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTarget_action_forEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forEvents:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return _[a1 address];
}

id objc_msgSend_addressKindAndHandleForSingleAddressContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addressKindAndHandleForSingleAddressContact:");
}

id objc_msgSend_affectedDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 affectedDataclasses];
}

id objc_msgSend_aida_accountForAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_accountForAltDSID:");
}

id objc_msgSend_aida_accountForiCloudAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_accountForiCloudAccount:");
}

id objc_msgSend_aida_alternateDSID(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_alternateDSID");
}

id objc_msgSend_aida_dsid(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_dsid");
}

id objc_msgSend_aida_tokenForService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aida_tokenForService:");
}

id objc_msgSend_ak_isAuthenticationErrorWithCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ak_isAuthenticationErrorWithCode:");
}

id objc_msgSend_alertControllerWithSelectionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithSelectionHandler:");
}

id objc_msgSend_alertWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithTitle:message:");
}

id objc_msgSend_alertWithTitle_message_buttonTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithTitle:message:buttonTitle:");
}

id objc_msgSend_alertWithTitle_message_buttonTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithTitle:message:buttonTitle:actionHandler:");
}

id objc_msgSend_alertWithTitle_message_cancelButtonTitle_defaultButtonTitle_actionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertWithTitle:message:cancelButtonTitle:defaultButtonTitle:actionHandler:");
}

id objc_msgSend_allBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 allBundleIDs];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allPages(void *a1, const char *a2, ...)
{
  return _[a1 allPages];
}

id objc_msgSend_altDSID(void *a1, const char *a2, ...)
{
  return _[a1 altDSID];
}

id objc_msgSend_altDSIDForAccount_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "altDSIDForAccount:service:");
}

id objc_msgSend_ams_securityLevel(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ams_securityLevel");
}

id objc_msgSend_analyticsEventWithName_altDSID_flowID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "analyticsEventWithName:altDSID:flowID:");
}

id objc_msgSend_animateAlongsideTransition_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateAlongsideTransition:completion:");
}

id objc_msgSend_anyCallPassesTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "anyCallPassesTest:");
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return _[a1 anyObject];
}

id objc_msgSend_appBundleIdentifierForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appBundleIdentifierForDataclass:");
}

id objc_msgSend_appIsNeitherInstalledOrPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "appIsNeitherInstalledOrPlaceholder:");
}

id objc_msgSend_appState(void *a1, const char *a2, ...)
{
  return _[a1 appState];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_apps(void *a1, const char *a2, ...)
{
  return _[a1 apps];
}

id objc_msgSend_appsUsingUbiquity(void *a1, const char *a2, ...)
{
  return _[a1 appsUsingUbiquity];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithArray:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributedLinkForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributedLinkForDataclass:");
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_authKitAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authKitAccountWithAltDSID:");
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_backupForUDID_backupList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "backupForUDID:backupList:");
}

id objc_msgSend_backupUUID(void *a1, const char *a2, ...)
{
  return _[a1 backupUUID];
}

id objc_msgSend_bagForAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bagForAltDSID:");
}

id objc_msgSend_beginFlowWithNavigationController_modally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginFlowWithNavigationController:modally:");
}

id objc_msgSend_beginJourney(void *a1, const char *a2, ...)
{
  return _[a1 beginJourney];
}

id objc_msgSend_beginLoadingForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginLoadingForSpecifier:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_bezierPathWithOvalInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithOvalInRect:");
}

id objc_msgSend_bezierPathWithRoundedRect_cornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bezierPathWithRoundedRect:cornerRadius:");
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

id objc_msgSend_bubbleMetadata(void *a1, const char *a2, ...)
{
  return _[a1 bubbleMetadata];
}

id objc_msgSend_buddyML(void *a1, const char *a2, ...)
{
  return _[a1 buddyML];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleIds(void *a1, const char *a2, ...)
{
  return _[a1 bundleIds];
}

id objc_msgSend_bundleWithPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithPath:");
}

id objc_msgSend_cachediCloudDetailsPage(void *a1, const char *a2, ...)
{
  return _[a1 cachediCloudDetailsPage];
}

id objc_msgSend_canAutoEnableDataclass_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canAutoEnableDataclass:forAccount:");
}

id objc_msgSend_canOpenURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canOpenURL:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_cancelButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cancelButtonTapped:");
}

id objc_msgSend_cdpContextForPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 cdpContextForPrimaryAccount];
}

id objc_msgSend_cdpStateControllerForPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 cdpStateControllerForPrimaryAccount];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_cellType(void *a1, const char *a2, ...)
{
  return _[a1 cellType];
}

id objc_msgSend_cellWithTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellWithTag:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_checkIfWatchHasAppleIDAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkIfWatchHasAppleIDAccount:");
}

id objc_msgSend_children(void *a1, const char *a2, ...)
{
  return _[a1 children];
}

id objc_msgSend_chooseContactController_didSelectContact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "chooseContactController:didSelectContact:");
}

id objc_msgSend_chooseContactViewController(void *a1, const char *a2, ...)
{
  return _[a1 chooseContactViewController];
}

id objc_msgSend_circularImageFromCGImage_size_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "circularImageFromCGImage:size:scale:");
}

id objc_msgSend_classNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "classNamed:");
}

id objc_msgSend_cleanupDataclassSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 cleanupDataclassSpecifiers];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_colorWithAlphaComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithAlphaComponent:");
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "colorWithWhite:alpha:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_configurationWithScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithScale:");
}

id objc_msgSend_configurationWithWeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithWeight:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:constant:");
}

id objc_msgSend_constraintEqualToConstant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToConstant:");
}

id objc_msgSend_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:");
}

id objc_msgSend_constraintsWithVisualFormat_options_metrics_views_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintsWithVisualFormat:options:metrics:views:");
}

id objc_msgSend_contact(void *a1, const char *a2, ...)
{
  return _[a1 contact];
}

id objc_msgSend_contactForHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contactForHandle:");
}

id objc_msgSend_containerID(void *a1, const char *a2, ...)
{
  return _[a1 containerID];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsString:");
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return _[a1 context];
}

id objc_msgSend_contextForAccountWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextForAccountWithAltDSID:");
}

id objc_msgSend_contextForPrimaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 contextForPrimaryAccount];
}

id objc_msgSend_contextForStateRepair(void *a1, const char *a2, ...)
{
  return _[a1 contextForStateRepair];
}

id objc_msgSend_controller_didFinishSettingUpAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "controller:didFinishSettingUpAccount:");
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
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createAppleAccountHeaderViewFromContact_account_showAccountDetails_showEditButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createAppleAccountHeaderViewFromContact:account:showAccountDetails:showEditButton:");
}

id objc_msgSend_createRecoveryContactUpsellTipView(void *a1, const char *a2, ...)
{
  return _[a1 createRecoveryContactUpsellTipView];
}

id objc_msgSend_createViewModelWithAccountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createViewModelWithAccountManager:");
}

id objc_msgSend_createWithViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "createWithViewModel:");
}

id objc_msgSend_credentialForAccount_serviceID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "credentialForAccount:serviceID:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentQueue(void *a1, const char *a2, ...)
{
  return _[a1 currentQueue];
}

id objc_msgSend_currentRequest(void *a1, const char *a2, ...)
{
  return _[a1 currentRequest];
}

id objc_msgSend_currentSecurityLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSecurityLevel:");
}

id objc_msgSend_currentSpecifierForPaymentAndShipping(void *a1, const char *a2, ...)
{
  return _[a1 currentSpecifierForPaymentAndShipping];
}

id objc_msgSend_currentSpecifierForPersonalInformation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "currentSpecifierForPersonalInformation:");
}

id objc_msgSend_currentSpecifierForSignInAndSecurity(void *a1, const char *a2, ...)
{
  return _[a1 currentSpecifierForSignInAndSecurity];
}

id objc_msgSend_dataClassSpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 dataClassSpecifierProvider];
}

id objc_msgSend_dataRepresentationWithOutOfLineAttachments_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataRepresentationWithOutOfLineAttachments:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTaskWithRequest:completionHandler:");
}

id objc_msgSend_dataWithContentsOfURL_options_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataWithContentsOfURL:options:error:");
}

id objc_msgSend_dataclassAttributedLinkDictionary(void *a1, const char *a2, ...)
{
  return _[a1 dataclassAttributedLinkDictionary];
}

id objc_msgSend_dataclassSubTitleDictionary_idmsAccount_securityLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataclassSubTitleDictionary:idmsAccount:securityLevel:");
}

id objc_msgSend_dataclassTitleDictionary(void *a1, const char *a2, ...)
{
  return _[a1 dataclassTitleDictionary];
}

id objc_msgSend_dateWithTimeIntervalSince1970_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSince1970:");
}

id objc_msgSend_deactivateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deactivateConstraints:");
}

id objc_msgSend_debugDescription(void *a1, const char *a2, ...)
{
  return _[a1 debugDescription];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultPages(void *a1, const char *a2, ...)
{
  return _[a1 defaultPages];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return _[a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteButtonSpecifierWithName_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteButtonSpecifierWithName:target:action:");
}

id objc_msgSend_demoAccountForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "demoAccountForAccount:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_desiredHeight(void *a1, const char *a2, ...)
{
  return _[a1 desiredHeight];
}

id objc_msgSend_detailDeviceName(void *a1, const char *a2, ...)
{
  return _[a1 detailDeviceName];
}

id objc_msgSend_detailSubLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailSubLabel];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_deviceDetailHttpMethod(void *a1, const char *a2, ...)
{
  return _[a1 deviceDetailHttpMethod];
}

id objc_msgSend_deviceDetailUri(void *a1, const char *a2, ...)
{
  return _[a1 deviceDetailUri];
}

id objc_msgSend_deviceRecentlyTapped(void *a1, const char *a2, ...)
{
  return _[a1 deviceRecentlyTapped];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didCompleteSigningInWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didCompleteSigningInWithAccount:");
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didMoveToParentViewController:");
}

id objc_msgSend_dismissObjectModelsAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissObjectModelsAnimated:completion:");
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dismissViewControllerAnimated:completion:");
}

id objc_msgSend_displayedPages(void *a1, const char *a2, ...)
{
  return _[a1 displayedPages];
}

id objc_msgSend_doesNotRecognizeSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "doesNotRecognizeSelector:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_drawInRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "drawInRect:");
}

id objc_msgSend_effectiveBoolValueForSetting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "effectiveBoolValueForSetting:");
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 emptyGroupSpecifier];
}

id objc_msgSend_enabled(void *a1, const char *a2, ...)
{
  return _[a1 enabled];
}

id objc_msgSend_enabledDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 enabledDataclasses];
}

id objc_msgSend_enabledDataclassesForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enabledDataclassesForAccount:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_entitlementValueForKey_ofClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "entitlementValueForKey:ofClass:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return _[a1 error];
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_familyDSID(void *a1, const char *a2, ...)
{
  return _[a1 familyDSID];
}

id objc_msgSend_fetchAppsSyncingToiCloudDriveWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchAppsSyncingToiCloudDriveWithCompletion:");
}

id objc_msgSend_fetchBackupWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchBackupWithCompletion:");
}

id objc_msgSend_fetchCloudStorage_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchCloudStorage:completion:");
}

id objc_msgSend_fetchEDPTokenWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchEDPTokenWithCompletion:");
}

id objc_msgSend_fetchIDSStatusForRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchIDSStatusForRecipient:");
}

id objc_msgSend_fetchStorageByApp_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStorageByApp:completion:");
}

id objc_msgSend_fetchStorageSummaryWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchStorageSummaryWithCompletion:");
}

id objc_msgSend_fillRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fillRect:");
}

id objc_msgSend_findMyAppLaunchButton(void *a1, const char *a2, ...)
{
  return _[a1 findMyAppLaunchButton];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return _[a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fmipEnabled(void *a1, const char *a2, ...)
{
  return _[a1 fmipEnabled];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateLoginCodeWithPresenter_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "generateLoginCodeWithPresenter:completion:");
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return _[a1 getActivePairedDevice];
}

id objc_msgSend_getBackupListWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getBackupListWithError:");
}

id objc_msgSend_getDeviceImageURL(void *a1, const char *a2, ...)
{
  return _[a1 getDeviceImageURL];
}

id objc_msgSend_getICloudMailSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 getICloudMailSpecifier];
}

id objc_msgSend_getServerUILoadDelegateWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getServerUILoadDelegateWithContext:completion:");
}

id objc_msgSend_grayColor(void *a1, const char *a2, ...)
{
  return _[a1 grayColor];
}

id objc_msgSend_groupSpecifierAccountSummary(void *a1, const char *a2, ...)
{
  return _[a1 groupSpecifierAccountSummary];
}

id objc_msgSend_groupSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:");
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_groupSpecifierWithName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithName:");
}

id objc_msgSend_handle(void *a1, const char *a2, ...)
{
  return _[a1 handle];
}

id objc_msgSend_handleAccountSaveError_forAccount_failedDataclasses_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAccountSaveError:forAccount:failedDataclasses:");
}

id objc_msgSend_handlePendingURL(void *a1, const char *a2, ...)
{
  return _[a1 handlePendingURL];
}

id objc_msgSend_handleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURL:");
}

id objc_msgSend_handleURL_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURL:withCompletion:");
}

id objc_msgSend_handleURLActionWithInfo_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleURLActionWithInfo:completion:");
}

id objc_msgSend_hasBackupEnabledState(void *a1, const char *a2, ...)
{
  return _[a1 hasBackupEnabledState];
}

id objc_msgSend_hasLocalSecret(void *a1, const char *a2, ...)
{
  return _[a1 hasLocalSecret];
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_headerViewDidTapImageControl_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "headerViewDidTapImageControl:");
}

id objc_msgSend_healthDataIcon(void *a1, const char *a2, ...)
{
  return _[a1 healthDataIcon];
}

id objc_msgSend_healthDataclassSubtitleForSecurityLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "healthDataclassSubtitleForSecurityLevel:");
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_helperWithPresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "helperWithPresenter:");
}

id objc_msgSend_hideBusyUI(void *a1, const char *a2, ...)
{
  return _[a1 hideBusyUI];
}

id objc_msgSend_hooksFor_accountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hooksFor:accountManager:");
}

id objc_msgSend_iCloudHomeViewControllerClassLegacy(void *a1, const char *a2, ...)
{
  return _[a1 iCloudHomeViewControllerClassLegacy];
}

id objc_msgSend_iCloudLogoutPolicy(void *a1, const char *a2, ...)
{
  return _[a1 iCloudLogoutPolicy];
}

id objc_msgSend_iconName(void *a1, const char *a2, ...)
{
  return _[a1 iconName];
}

id objc_msgSend_icqLink(void *a1, const char *a2, ...)
{
  return _[a1 icqLink];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_idsStatusForHandle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "idsStatusForHandle:completion:");
}

id objc_msgSend_imageByCroppingToRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageByCroppingToRect:");
}

id objc_msgSend_imageControl(void *a1, const char *a2, ...)
{
  return _[a1 imageControl];
}

id objc_msgSend_imageData(void *a1, const char *a2, ...)
{
  return _[a1 imageData];
}

id objc_msgSend_imageForDataclassWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForDataclassWithBundleID:");
}

id objc_msgSend_imageForDataclassWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForDataclassWithType:");
}

id objc_msgSend_imageForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageForKey:");
}

id objc_msgSend_imageNamed_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:");
}

id objc_msgSend_imageNamed_inBundle_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageNamed:inBundle:withConfiguration:");
}

id objc_msgSend_imageOrientation(void *a1, const char *a2, ...)
{
  return _[a1 imageOrientation];
}

id objc_msgSend_imageView(void *a1, const char *a2, ...)
{
  return _[a1 imageView];
}

id objc_msgSend_imageWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithActions:");
}

id objc_msgSend_imageWithCGImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCGImage:scale:orientation:");
}

id objc_msgSend_imageWithCIImage_scale_orientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithCIImage:scale:orientation:");
}

id objc_msgSend_imageWithData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithData:");
}

id objc_msgSend_imageWithTintColor_renderingMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "imageWithTintColor:renderingMode:");
}

id objc_msgSend_indexPathForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForSpecifier:");
}

id objc_msgSend_initForSpecifierType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForSpecifierType:");
}

id objc_msgSend_initWithAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:");
}

id objc_msgSend_initWithAccount_inStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:inStore:");
}

id objc_msgSend_initWithAccount_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:presenter:");
}

id objc_msgSend_initWithAccount_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccount:presentingViewController:");
}

id objc_msgSend_initWithAccountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:");
}

id objc_msgSend_initWithAccountManager_highlightRowIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:highlightRowIdentifier:");
}

id objc_msgSend_initWithAccountManager_hookType_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:hookType:presenter:");
}

id objc_msgSend_initWithAccountManager_presenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:presenter:");
}

id objc_msgSend_initWithAccountManager_presenter_hooks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:presenter:hooks:");
}

id objc_msgSend_initWithAccountManager_presenter_sectionAnchorIdentifier_showUpwardPointingTips_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountManager:presenter:sectionAnchorIdentifier:showUpwardPointingTips:");
}

id objc_msgSend_initWithAccountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:");
}

id objc_msgSend_initWithAccountStore_grandSlamAccount_appTokenID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountStore:grandSlamAccount:appTokenID:");
}

id objc_msgSend_initWithAccountURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAccountURL:");
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithActivityIndicatorStyle:");
}

id objc_msgSend_initWithAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAltDSID:");
}

id objc_msgSend_initWithAltDSID_upgradeContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAltDSID:upgradeContext:");
}

id objc_msgSend_initWithAppBundleID_account_navigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAppBundleID:account:navigationController:");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithAttributes_parent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAttributes:parent:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithBundleID_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleID:account:");
}

id objc_msgSend_initWithBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:");
}

id objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBundleIdentifier:allowPlaceholder:error:");
}

id objc_msgSend_initWithCGImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCGImage:");
}

id objc_msgSend_initWithContact_address_kind_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContact:address:kind:");
}

id objc_msgSend_initWithContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:");
}

id objc_msgSend_initWithContext_flow_navigationController_defaultMessageViewModel_messageSentViewModel_isADPUpsellFlow_isFamilyMember_cdpContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContext:flow:navigationController:defaultMessageViewModel:messageSentViewModel:isADPUpsellFlow:isFamilyMember:cdpContext:");
}

id objc_msgSend_initWithCustomView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCustomView:");
}

id objc_msgSend_initWithDSID_primaryToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDSID:primaryToken:");
}

id objc_msgSend_initWithDevice_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDevice:style:");
}

id objc_msgSend_initWithFamilyMemberDSID_size_localFallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFamilyMemberDSID:size:localFallback:");
}

id objc_msgSend_initWithFlowContext_withPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFlowContext:withPresentingViewController:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithGrandSlamAccount_accountStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGrandSlamAccount:accountStore:");
}

id objc_msgSend_initWithGrandSlamSigner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithGrandSlamSigner:");
}

id objc_msgSend_initWithHandle_contact_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithHandle:contact:");
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:");
}

id objc_msgSend_initWithIdentifier_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:account:");
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithImage:");
}

id objc_msgSend_initWithInviteContext_flow_presentingController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInviteContext:flow:presentingController:");
}

id objc_msgSend_initWithJourneyId_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithJourneyId:");
}

id objc_msgSend_initWithLabelInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabelInsets:");
}

id objc_msgSend_initWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithName:value:");
}

id objc_msgSend_initWithNavigationItem_hideBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNavigationItem:hideBackButton:");
}

id objc_msgSend_initWithNibName_bundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithNibName:bundle:");
}

id objc_msgSend_initWithPage_device_appleAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPage:device:appleAccount:");
}

id objc_msgSend_initWithPresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresenter:");
}

id objc_msgSend_initWithPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPresentingViewController:");
}

id objc_msgSend_initWithRemoteUIController_hooks_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRemoteUIController:hooks:");
}

id objc_msgSend_initWithRequest_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRequest:handler:");
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithRootViewController:");
}

id objc_msgSend_initWithSearchType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchType:");
}

id objc_msgSend_initWithSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:");
}

id objc_msgSend_initWithSize_scale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSize:scale:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithTitle:style:target:action:");
}

id objc_msgSend_initWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithType:");
}

id objc_msgSend_initWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:");
}

id objc_msgSend_initWithURL_account_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:account:data:");
}

id objc_msgSend_initWithURLString_account_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLString:account:");
}

id objc_msgSend_initWithUUIDString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithUUIDString:");
}

id objc_msgSend_initWithViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithViewModel:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSpecifier_afterSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:afterSpecifier:animated:");
}

id objc_msgSend_insertSubview_belowSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:belowSubview:");
}

id objc_msgSend_instancesRespondToSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "instancesRespondToSelector:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_intersectSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectSet:");
}

id objc_msgSend_intersectsSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "intersectsSet:");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_inviteMessageCompleteSecondaryButtonTapped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteMessageCompleteSecondaryButtonTapped:");
}

id objc_msgSend_inviteMessageFlowDidFinish_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteMessageFlowDidFinish:");
}

id objc_msgSend_inviteMessageFlowWasCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteMessageFlowWasCancelled:");
}

id objc_msgSend_inviteMessageWasSent_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "inviteMessageWasSent:completion:");
}

id objc_msgSend_inviteURL(void *a1, const char *a2, ...)
{
  return _[a1 inviteURL];
}

id objc_msgSend_invokeWithTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invokeWithTarget:");
}

id objc_msgSend_isAccessGrantedForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAccessGrantedForBundleID:");
}

id objc_msgSend_isAccountDataclassListRedesignEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isAccountDataclassListRedesignEnabled];
}

id objc_msgSend_isAppRestrictedOnThisDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isAppRestrictedOnThisDevice:");
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return _[a1 isAuthenticated];
}

id objc_msgSend_isBackupEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isBackupEnabled];
}

id objc_msgSend_isBeneficiaryForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBeneficiaryForAccount:");
}

id objc_msgSend_isBoolSettingLockedDownByRestrictions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isBoolSettingLockedDownByRestrictions:");
}

id objc_msgSend_isCanceled(void *a1, const char *a2, ...)
{
  return _[a1 isCanceled];
}

id objc_msgSend_isChangingState(void *a1, const char *a2, ...)
{
  return _[a1 isChangingState];
}

id objc_msgSend_isCloudSubscriber(void *a1, const char *a2, ...)
{
  return _[a1 isCloudSubscriber];
}

id objc_msgSend_isCloudSyncAllowed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isCloudSyncAllowed:");
}

id objc_msgSend_isDataclassAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isDataclassAvailable:");
}

id objc_msgSend_isDataclassLDMDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isDataclassLDMDisabled];
}

id objc_msgSend_isDirty(void *a1, const char *a2, ...)
{
  return _[a1 isDirty];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isEnabled];
}

id objc_msgSend_isEnabledForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEnabledForDataclass:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isFaceTimeProvider(void *a1, const char *a2, ...)
{
  return _[a1 isFaceTimeProvider];
}

id objc_msgSend_isFamilySuspended(void *a1, const char *a2, ...)
{
  return _[a1 isFamilySuspended];
}

id objc_msgSend_isHighlighted(void *a1, const char *a2, ...)
{
  return _[a1 isHighlighted];
}

id objc_msgSend_isICDPEnabledForDSID_checkWithServer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isICDPEnabledForDSID:checkWithServer:");
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return _[a1 isInstalled];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return _[a1 isInternalBuild];
}

id objc_msgSend_isKeychainSyncEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isKeychainSyncEnabled];
}

id objc_msgSend_isLoaded(void *a1, const char *a2, ...)
{
  return _[a1 isLoaded];
}

id objc_msgSend_isMailSetupForced(void *a1, const char *a2, ...)
{
  return _[a1 isMailSetupForced];
}

id objc_msgSend_isManateeAvailable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isManateeAvailable:");
}

id objc_msgSend_isMomentsDataclassEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isMomentsDataclassEnabled];
}

id objc_msgSend_isMultiUserMode(void *a1, const char *a2, ...)
{
  return _[a1 isMultiUserMode];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkReachable];
}

id objc_msgSend_isPlaceholder(void *a1, const char *a2, ...)
{
  return _[a1 isPlaceholder];
}

id objc_msgSend_isPresentedAsModalSheet(void *a1, const char *a2, ...)
{
  return _[a1 isPresentedAsModalSheet];
}

id objc_msgSend_isPropertyDirty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isPropertyDirty:");
}

id objc_msgSend_isProvisionedForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isProvisionedForDataclass:");
}

id objc_msgSend_isRecoveryContactUpsellTipEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isRecoveryContactUpsellTipEnabled];
}

id objc_msgSend_isRegularWatchPairing(void *a1, const char *a2, ...)
{
  return _[a1 isRegularWatchPairing];
}

id objc_msgSend_isRemovingAccount(void *a1, const char *a2, ...)
{
  return _[a1 isRemovingAccount];
}

id objc_msgSend_isResponseActionable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResponseActionable:");
}

id objc_msgSend_isResponseFinalForHSA2ServerFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isResponseFinalForHSA2ServerFlow:");
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return _[a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSecondaryAccount(void *a1, const char *a2, ...)
{
  return _[a1 isSecondaryAccount];
}

id objc_msgSend_isShowDataclassDetailFromAppsEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isShowDataclassDetailFromAppsEnabled];
}

id objc_msgSend_isSignInSecurityRedesignEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isSignInSecurityRedesignEnabled];
}

id objc_msgSend_isSpyglass2023Enabled(void *a1, const char *a2, ...)
{
  return _[a1 isSpyglass2023Enabled];
}

id objc_msgSend_isStateKnown(void *a1, const char *a2, ...)
{
  return _[a1 isStateKnown];
}

id objc_msgSend_isSystemAppMCRestrictedOrRemovedForDataclass_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSystemAppMCRestrictedOrRemovedForDataclass:forAccount:");
}

id objc_msgSend_isWalrusEnabled(void *a1, const char *a2, ...)
{
  return _[a1 isWalrusEnabled];
}

id objc_msgSend_isiCloudPlusSubscriber(void *a1, const char *a2, ...)
{
  return _[a1 isiCloudPlusSubscriber];
}

id objc_msgSend_isiCloudSuspended(void *a1, const char *a2, ...)
{
  return _[a1 isiCloudSuspended];
}

id objc_msgSend_kind(void *a1, const char *a2, ...)
{
  return _[a1 kind];
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return _[a1 lastName];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutSubviews(void *a1, const char *a2, ...)
{
  return _[a1 layoutSubviews];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItems];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return _[a1 load];
}

id objc_msgSend_loadBundle_atPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadBundle:atPath:");
}

id objc_msgSend_loadData_baseURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadData:baseURL:");
}

id objc_msgSend_loadError(void *a1, const char *a2, ...)
{
  return _[a1 loadError];
}

id objc_msgSend_loadMetadataWithImage_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadMetadataWithImage:completion:");
}

id objc_msgSend_loadRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRequest:");
}

id objc_msgSend_loadRequest_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRequest:completion:");
}

id objc_msgSend_loadSpecifierProviderWithClassName_inBundle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifierProviderWithClassName:inBundle:");
}

id objc_msgSend_loadWithCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadWithCompletionBlock:");
}

id objc_msgSend_loadXMLUIWithRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadXMLUIWithRequest:");
}

id objc_msgSend_loader(void *a1, const char *a2, ...)
{
  return _[a1 loader];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedRecoverySuggestion(void *a1, const char *a2, ...)
{
  return _[a1 localizedRecoverySuggestion];
}

id objc_msgSend_localizedReferenceToLocalSourceOfDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedReferenceToLocalSourceOfDataclass:");
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringFromPersonNameComponents_style_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringFromPersonNameComponents:style:options:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_localizedSubTitleForDataclass_idmsAccount_securityLevel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedSubTitleForDataclass:idmsAccount:securityLevel:");
}

id objc_msgSend_localizedTextForDataclasses_usedAtBeginningOfSentence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTextForDataclasses:usedAtBeginningOfSentence:");
}

id objc_msgSend_localizedTitleForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedTitleForDataclass:");
}

id objc_msgSend_locationServicesRestricted(void *a1, const char *a2, ...)
{
  return _[a1 locationServicesRestricted];
}

id objc_msgSend_lockedColor(void *a1, const char *a2, ...)
{
  return _[a1 lockedColor];
}

id objc_msgSend_longLongValue(void *a1, const char *a2, ...)
{
  return _[a1 longLongValue];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainQueue(void *a1, const char *a2, ...)
{
  return _[a1 mainQueue];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return _[a1 mainScreen];
}

id objc_msgSend_makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeSwiftUIViewForEDPTokenInSpyglassWithRecoveryToken:presentingViewController:");
}

id objc_msgSend_makeSwiftUIViewWithCdpContext_advancedDataProtectionViewModelDelegate_presentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "makeSwiftUIViewWithCdpContext:advancedDataProtectionViewModelDelegate:presentingViewController:");
}

id objc_msgSend_meCardWithVisualIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "meCardWithVisualIdentity:");
}

id objc_msgSend_messageBody(void *a1, const char *a2, ...)
{
  return _[a1 messageBody];
}

id objc_msgSend_methodForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodForSelector:");
}

id objc_msgSend_methodSignatureForSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "methodSignatureForSelector:");
}

id objc_msgSend_metricsForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "metricsForTextStyle:");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_modelDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 modelDisplayName];
}

id objc_msgSend_modelLargePhotoURL1x(void *a1, const char *a2, ...)
{
  return _[a1 modelLargePhotoURL1x];
}

id objc_msgSend_modelLargePhotoURL2x(void *a1, const char *a2, ...)
{
  return _[a1 modelLargePhotoURL2x];
}

id objc_msgSend_modelLargePhotoURL3x(void *a1, const char *a2, ...)
{
  return _[a1 modelLargePhotoURL3x];
}

id objc_msgSend_modelSmallPhotoURL3x(void *a1, const char *a2, ...)
{
  return _[a1 modelSmallPhotoURL3x];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nameComponentsForAccount_service_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "nameComponentsForAccount:service:");
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberOfCards(void *a1, const char *a2, ...)
{
  return _[a1 numberOfCards];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForInfoDictionaryKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForInfoDictionaryKey:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openApplicationWithBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openApplicationWithBundleID:");
}

id objc_msgSend_openSensitiveURL_withOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openSensitiveURL:withOptions:");
}

id objc_msgSend_openURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_openURL_options_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:options:completionHandler:");
}

id objc_msgSend_openURL_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:withCompletionHandler:");
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return _[a1 parentController];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return _[a1 parentViewController];
}

id objc_msgSend_passcodeViewOM(void *a1, const char *a2, ...)
{
  return _[a1 passcodeViewOM];
}

id objc_msgSend_pendingURLResourceDictionary(void *a1, const char *a2, ...)
{
  return _[a1 pendingURLResourceDictionary];
}

id objc_msgSend_performDeviceToDeviceEncryptionStateRepairWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDeviceToDeviceEncryptionStateRepairWithCompletion:");
}

id objc_msgSend_performRequestWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performRequestWithHandler:");
}

id objc_msgSend_performSelector_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performSelector:withObject:");
}

id objc_msgSend_popRecursivelyToRootController(void *a1, const char *a2, ...)
{
  return _[a1 popRecursivelyToRootController];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "popViewControllerAnimated:");
}

id objc_msgSend_populatePostbackDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populatePostbackDictionary:");
}

id objc_msgSend_populateUnderlyingErrorsStartingWithRootError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "populateUnderlyingErrorsStartingWithRootError:");
}

id objc_msgSend_postFollowUpWithContext_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postFollowUpWithContext:error:");
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postNotificationName:object:");
}

id objc_msgSend_postbackData(void *a1, const char *a2, ...)
{
  return _[a1 postbackData];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return _[a1 preferredContentSizeCategory];
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_prepareImageForDescriptor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareImageForDescriptor:");
}

id objc_msgSend_prepareInViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "prepareInViewController:completion:");
}

id objc_msgSend_presentCloudStorageOffersPageFromNavigationController_requiredStorageThreshold_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCloudStorageOffersPageFromNavigationController:requiredStorageThreshold:completionHandler:");
}

id objc_msgSend_presentCreateFreeEmailPromptWithCompletion_isForNotes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCreateFreeEmailPromptWithCompletion:isForNotes:");
}

id objc_msgSend_presentCustodianSetupFlow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentCustodianSetupFlow:");
}

id objc_msgSend_presentInParentViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentInParentViewController:animated:");
}

id objc_msgSend_presentInViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentInViewController:animated:");
}

id objc_msgSend_presentServerUIWithContext_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentServerUIWithContext:withCompletion:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentWhenReadyWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentWhenReadyWithCompletion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentingViewController];
}

id objc_msgSend_primaryAccountAltDSID(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountAltDSID];
}

id objc_msgSend_primaryAccountDSID(void *a1, const char *a2, ...)
{
  return _[a1 primaryAccountDSID];
}

id objc_msgSend_primaryButton(void *a1, const char *a2, ...)
{
  return _[a1 primaryButton];
}

id objc_msgSend_principalClass(void *a1, const char *a2, ...)
{
  return _[a1 principalClass];
}

id objc_msgSend_privateEmailManageURL(void *a1, const char *a2, ...)
{
  return _[a1 privateEmailManageURL];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return _[a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return _[a1 processName];
}

id objc_msgSend_processObjectModel_isModal_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processObjectModel:isModal:");
}

id objc_msgSend_processResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processResponse:");
}

id objc_msgSend_processServerResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processServerResponse:");
}

id objc_msgSend_profilePictureForAccountOwner(void *a1, const char *a2, ...)
{
  return _[a1 profilePictureForAccountOwner];
}

id objc_msgSend_profilePictureForContact_serverImageData_firstName_lastName_diameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "profilePictureForContact:serverImageData:firstName:lastName:diameter:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_provider(void *a1, const char *a2, ...)
{
  return _[a1 provider];
}

id objc_msgSend_provisionedDataclasses(void *a1, const char *a2, ...)
{
  return _[a1 provisionedDataclasses];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pushViewController:animated:");
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rawLatestBackup(void *a1, const char *a2, ...)
{
  return _[a1 rawLatestBackup];
}

id objc_msgSend_recipients(void *a1, const char *a2, ...)
{
  return _[a1 recipients];
}

id objc_msgSend_redirectResponse(void *a1, const char *a2, ...)
{
  return _[a1 redirectResponse];
}

id objc_msgSend_refreshBackupDetailText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshBackupDetailText:");
}

id objc_msgSend_refreshDetailTextForTableCellWithTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "refreshDetailTextForTableCellWithTag:");
}

id objc_msgSend_refreshDeviceList(void *a1, const char *a2, ...)
{
  return _[a1 refreshDeviceList];
}

id objc_msgSend_registerSIWASharingTipView(void *a1, const char *a2, ...)
{
  return _[a1 registerSIWASharingTipView];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return _[a1 reload];
}

id objc_msgSend_reloadAccessInfo(void *a1, const char *a2, ...)
{
  return _[a1 reloadAccessInfo];
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:animated:");
}

id objc_msgSend_reloadSpecifierForProvider_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierForProvider:identifier:");
}

id objc_msgSend_reloadSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifierID:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_reloadSpecifiersForDataclassValidationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifiersForDataclassValidationController:");
}

id objc_msgSend_reloadSpecifiersForProvider_oldSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifiersForProvider:oldSpecifiers:animated:");
}

id objc_msgSend_removeAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeAccount:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeNetworkReachableObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeNetworkReachableObserver:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertyForKey:");
}

id objc_msgSend_renewCredentialsForAccount_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:completion:");
}

id objc_msgSend_renewCredentialsForAccount_force_reason_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:force:reason:completion:");
}

id objc_msgSend_renewCredentialsForAccount_options_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "renewCredentialsForAccount:options:completion:");
}

id objc_msgSend_repairCloudDataProtectionStateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairCloudDataProtectionStateWithCompletion:");
}

id objc_msgSend_repairPrimaryAppleAccountEDPStateWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairPrimaryAppleAccountEDPStateWithCompletion:");
}

id objc_msgSend_repairPrimaryAppleAccountInViewController_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "repairPrimaryAppleAccountInViewController:completion:");
}

id objc_msgSend_replaceContiguousSpecifiers_withSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceContiguousSpecifiers:withSpecifiers:animated:");
}

id objc_msgSend_reporter(void *a1, const char *a2, ...)
{
  return _[a1 reporter];
}

id objc_msgSend_requestWithURL_cachePolicy_timeoutInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestWithURL:cachePolicy:timeoutInterval:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_rightBarButtonItems(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItems];
}

id objc_msgSend_rootController(void *a1, const char *a2, ...)
{
  return _[a1 rootController];
}

id objc_msgSend_saveAccount_requireVerification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:requireVerification:");
}

id objc_msgSend_saveAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveAccount:withCompletionHandler:");
}

id objc_msgSend_saveVerifiedAccount_withCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveVerifiedAccount:withCompletionHandler:");
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaledValueForValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scaledValueForValue:");
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_secondaryButton(void *a1, const char *a2, ...)
{
  return _[a1 secondaryButton];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return _[a1 secondaryLabelColor];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_securityLevelForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "securityLevelForAccount:");
}

id objc_msgSend_selectButtonText(void *a1, const char *a2, ...)
{
  return _[a1 selectButtonText];
}

id objc_msgSend_selector(void *a1, const char *a2, ...)
{
  return _[a1 selector];
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_sendVerificationEmail(void *a1, const char *a2, ...)
{
  return _[a1 sendVerificationEmail];
}

id objc_msgSend_serviceOwnersManager(void *a1, const char *a2, ...)
{
  return _[a1 serviceOwnersManager];
}

id objc_msgSend_sessionWithConfiguration_delegate_delegateQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionWithConfiguration:delegate:delegateQueue:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setADPState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setADPState:");
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryView:");
}

id objc_msgSend_setAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccount:");
}

id objc_msgSend_setAccountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountManager:");
}

id objc_msgSend_setAccountProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccountProperty:forKey:");
}

id objc_msgSend_setAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAction:");
}

id objc_msgSend_setActivityIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActivityIndicatorVisible:");
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontSizeToFitWidth:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAltDSID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAltDSID:");
}

id objc_msgSend_setAnimationsEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationsEnabled:");
}

id objc_msgSend_setAnticipateEscrowAttempt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnticipateEscrowAttempt:");
}

id objc_msgSend_setAppAccessGranted_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppAccessGranted:forBundleID:");
}

id objc_msgSend_setAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributes:");
}

id objc_msgSend_setAuthenticationResults_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthenticationResults:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelButton:");
}

id objc_msgSend_setCellType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCellType:");
}

id objc_msgSend_setClientData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientData:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setColor:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContentMode:");
}

id objc_msgSend_setControllerLoadAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setControllerLoadAction:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDateStyle:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDetailControllerClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDetailControllerClass:");
}

id objc_msgSend_setDeviceToDeviceEncryptionUpgradeType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceToDeviceEncryptionUpgradeType:");
}

id objc_msgSend_setDeviceToDeviceEncryptionUpgradeUIStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDeviceToDeviceEncryptionUpgradeUIStyle:");
}

id objc_msgSend_setDoesRelativeDateFormatting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDoesRelativeDateFormatting:");
}

id objc_msgSend_setEdgeInsets_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEdgeInsets:");
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:");
}

id objc_msgSend_setEnabled_forDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEnabled:forDataclass:");
}

id objc_msgSend_setEstimatedSectionHeaderHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedSectionHeaderHeight:");
}

id objc_msgSend_setFeatureName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFeatureName:");
}

id objc_msgSend_setFill(void *a1, const char *a2, ...)
{
  return _[a1 setFill];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPBody:");
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHTTPMethod:");
}

id objc_msgSend_setHandlerForButtonName_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandlerForButtonName:handler:");
}

id objc_msgSend_setHeartbeatToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHeartbeatToken:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBackButton:");
}

id objc_msgSend_setHidesBottomBarWhenPushed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBottomBarWhenPushed:");
}

id objc_msgSend_setHidesWhenStopped_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesWhenStopped:");
}

id objc_msgSend_setHighlighted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlighted:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setICloudDetailsPageShown_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setICloudDetailsPageShown:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImage:");
}

id objc_msgSend_setImageData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageData:");
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsUsernameEditable:");
}

id objc_msgSend_setItemChangeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemChangeObserver:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setListViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListViewController:");
}

id objc_msgSend_setLoadCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoadCompletion:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNavigationController:");
}

id objc_msgSend_setNeedsCredentialRecovery_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsCredentialRecovery:");
}

id objc_msgSend_setNeedsDisplay(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsDisplay];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNeedsPasswordChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsPasswordChange:");
}

id objc_msgSend_setNetworkActivityIndicatorVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNetworkActivityIndicatorVisible:");
}

id objc_msgSend_setNetworkError(void *a1, const char *a2, ...)
{
  return _[a1 setNetworkError];
}

id objc_msgSend_setNewPassword_oldPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNewPassword:oldPassword:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setParentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentController:");
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPassword:");
}

id objc_msgSend_setPaymentSummaryDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPaymentSummaryDescription:");
}

id objc_msgSend_setPictureDiameter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPictureDiameter:");
}

id objc_msgSend_setPreferredMaxLayoutWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredMaxLayoutWidth:");
}

id objc_msgSend_setPresentedModally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentedModally:");
}

id objc_msgSend_setPresentingControllerOverride_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingControllerOverride:");
}

id objc_msgSend_setPresentingViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPresentingViewController:");
}

id objc_msgSend_setProfilePictureForAccountOwner_cropRect_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProfilePictureForAccountOwner:cropRect:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setRecipients_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRecipients:");
}

id objc_msgSend_setRepairType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRepairType:");
}

id objc_msgSend_setRequiredStorageThreshold_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRequiredStorageThreshold:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRightBarButtonItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItems:");
}

id objc_msgSend_setRootController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootController:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSecondaryAuthToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryAuthToken:");
}

id objc_msgSend_setSectionHeaderHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSectionHeaderHeight:");
}

id objc_msgSend_setSecurityUpgradeContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecurityUpgradeContext:");
}

id objc_msgSend_setServiceToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceToken:");
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceType:");
}

id objc_msgSend_setServiceTypes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setServiceTypes:");
}

id objc_msgSend_setShouldEnableDeleteAccountButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldEnableDeleteAccountButton:");
}

id objc_msgSend_setShouldForceInteractiveAuth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldForceInteractiveAuth:");
}

id objc_msgSend_setShouldForceOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldForceOperation:");
}

id objc_msgSend_setShouldIgnoreCache_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldIgnoreCache:");
}

id objc_msgSend_setShouldOfferSecurityUpgrade_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldOfferSecurityUpgrade:");
}

id objc_msgSend_setShouldShowDeleteAccountButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowDeleteAccountButton:");
}

id objc_msgSend_setShouldShowiCloudDetails_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldShowiCloudDetails:");
}

id objc_msgSend_setShouldUpdatePersistentServiceTokens_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldUpdatePersistentServiceTokens:");
}

id objc_msgSend_setSignInContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignInContexts:");
}

id objc_msgSend_setSignOutContexts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSignOutContexts:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifiers:");
}

id objc_msgSend_setSpyglassOptionMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpyglassOptionMask:");
}

id objc_msgSend_setSupportsPiggybacking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsPiggybacking:");
}

id objc_msgSend_setTableHeaderView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTableHeaderView:");
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTag:");
}

id objc_msgSend_setTarget_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTarget:");
}

id objc_msgSend_setTaskCompletionAssertionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTaskCompletionAssertionEnabled:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTimeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTimeStyle:");
}

id objc_msgSend_setTintColor_forRecipient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:forRecipient:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTitleColor_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleColor:forState:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTriggeredByNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTriggeredByNotification:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setType:");
}

id objc_msgSend_setURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setURL:");
}

id objc_msgSend_setUbiquityDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUbiquityDelegate:");
}

id objc_msgSend_setUnderlyingQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnderlyingQueue:");
}

id objc_msgSend_setUniqueItemIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUniqueItemIdentifier:");
}

id objc_msgSend_setUrlKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUrlKey:");
}

id objc_msgSend_setUseMonogramAsLastResort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUseMonogramAsLastResort:");
}

id objc_msgSend_setUserInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInfo:");
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUserVisibleKeychainSyncEnabled_withCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserVisibleKeychainSyncEnabled:withCompletion:");
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsername:");
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forHTTPHeaderField:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewController:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_settingsIconCache(void *a1, const char *a2, ...)
{
  return _[a1 settingsIconCache];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return _[a1 shared];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedBag(void *a1, const char *a2, ...)
{
  return _[a1 sharedBag];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkObserver];
}

id objc_msgSend_sharedPinner(void *a1, const char *a2, ...)
{
  return _[a1 sharedPinner];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedSpinnerManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedSpinnerManager];
}

id objc_msgSend_shouldInject_inPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldInject:inPage:");
}

id objc_msgSend_shouldOpenGate(void *a1, const char *a2, ...)
{
  return _[a1 shouldOpenGate];
}

id objc_msgSend_shouldShowRecoveryContactUpsellTip(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowRecoveryContactUpsellTip];
}

id objc_msgSend_shouldShowSpecifierForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowSpecifierForDataclass:");
}

id objc_msgSend_shouldShowSpecifierForDataclass_forAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowSpecifierForDataclass:forAccount:");
}

id objc_msgSend_shouldShowSpecifierForServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldShowSpecifierForServiceType:");
}

id objc_msgSend_shouldShowiCloudDetails(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowiCloudDetails];
}

id objc_msgSend_showAccountRecoveryFromViewController_accountManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAccountRecoveryFromViewController:accountManager:");
}

id objc_msgSend_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showAccountRecoveryFromViewController:accountManager:highlightRowIdentifier:");
}

id objc_msgSend_showBackupRow(void *a1, const char *a2, ...)
{
  return _[a1 showBackupRow];
}

id objc_msgSend_showController_animate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:animate:");
}

id objc_msgSend_showFMIPLink(void *a1, const char *a2, ...)
{
  return _[a1 showFMIPLink];
}

id objc_msgSend_showFMIPRow(void *a1, const char *a2, ...)
{
  return _[a1 showFMIPRow];
}

id objc_msgSend_showUserNotificationWithTitle_message_cancelButtonTitle_otherButtonTitle_withCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUserNotificationWithTitle:message:cancelButtonTitle:otherButtonTitle:withCompletionBlock:");
}

id objc_msgSend_showViewController_sender_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showViewController:sender:");
}

id objc_msgSend_signInAccountForService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInAccountForService:completion:");
}

id objc_msgSend_signInContexts(void *a1, const char *a2, ...)
{
  return _[a1 signInContexts];
}

id objc_msgSend_signInControllerDidCancel(void *a1, const char *a2, ...)
{
  return _[a1 signInControllerDidCancel];
}

id objc_msgSend_signInControllerDidCompleteWithSuccess_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInControllerDidCompleteWithSuccess:error:");
}

id objc_msgSend_signInService_withContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signInService:withContext:completion:");
}

id objc_msgSend_signOutAccountForService_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signOutAccountForService:completion:");
}

id objc_msgSend_signOutService_withContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signOutService:withContext:completion:");
}

id objc_msgSend_signOutServiceAccountsWithServiceOwnersManager_forAltDSID_DSID_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signOutServiceAccountsWithServiceOwnersManager:forAltDSID:DSID:context:completion:");
}

id objc_msgSend_signRequest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signRequest:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return _[a1 sourceURL];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierForAccountSettingsCell(void *a1, const char *a2, ...)
{
  return _[a1 specifierForAccountSettingsCell];
}

id objc_msgSend_specifierForAccountSummaryCell(void *a1, const char *a2, ...)
{
  return _[a1 specifierForAccountSummaryCell];
}

id objc_msgSend_specifierForDataclass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForDataclass:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifierForPaymentAndShipping_isPaymentSpecifierProviderNil_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForPaymentAndShipping:isPaymentSpecifierProviderNil:");
}

id objc_msgSend_specifierForPersonalInformationWithAppleIDType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForPersonalInformationWithAppleIDType:");
}

id objc_msgSend_specifierForServiceType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForServiceType:");
}

id objc_msgSend_specifierForSignInAndSecurity(void *a1, const char *a2, ...)
{
  return _[a1 specifierForSignInAndSecurity];
}

id objc_msgSend_specifierForSubscriptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForSubscriptions:");
}

id objc_msgSend_specifierProvider_dataclassSwitchStateDidChange_withSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:dataclassSwitchStateDidChange:withSpecifier:");
}

id objc_msgSend_specifierProvider_dataclassSwitchStateForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:dataclassSwitchStateForSpecifier:");
}

id objc_msgSend_specifierProvider_didFinishLoadingSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:didFinishLoadingSpecifier:");
}

id objc_msgSend_specifierProvider_isDataclassAvailableForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:isDataclassAvailableForSpecifier:");
}

id objc_msgSend_specifierProvider_loadRequest_withIdentifier_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:loadRequest:withIdentifier:specifier:");
}

id objc_msgSend_specifierProvider_showViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:showViewController:");
}

id objc_msgSend_specifierProvider_willBeginLoadingSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierProvider:willBeginLoadingSpecifier:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_spyglassSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 spyglassSpecifiers];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimatingInNavItem_forIdentifier_hideBackButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startAnimatingInNavItem:forIdentifier:hideBackButton:");
}

id objc_msgSend_startNavigationBarSpinnerWithTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startNavigationBarSpinnerWithTitle:");
}

id objc_msgSend_startRequestWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startRequestWithCompletionHandler:");
}

id objc_msgSend_startSpinnerInSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startSpinnerInSpecifier:");
}

id objc_msgSend_startValidationWithPrompt_userInteraction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "startValidationWithPrompt:userInteraction:");
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return _[a1 statusCode];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopAnimatingForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopAnimatingForIdentifier:");
}

id objc_msgSend_stopNavigationBarSpinner(void *a1, const char *a2, ...)
{
  return _[a1 stopNavigationBarSpinner];
}

id objc_msgSend_stopNavigationSpinner(void *a1, const char *a2, ...)
{
  return _[a1 stopNavigationSpinner];
}

id objc_msgSend_stopSpinner(void *a1, const char *a2, ...)
{
  return _[a1 stopSpinner];
}

id objc_msgSend_stopSpinnerInActiveSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 stopSpinnerInActiveSpecifier];
}

id objc_msgSend_stopValidationWithPrompt_showButtons_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stopValidationWithPrompt:showButtons:");
}

id objc_msgSend_storageUsed(void *a1, const char *a2, ...)
{
  return _[a1 storageUsed];
}

id objc_msgSend_stringByAppendingFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingFormat:");
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_submittedPIN(void *a1, const char *a2, ...)
{
  return _[a1 submittedPIN];
}

id objc_msgSend_subscriptionInfo(void *a1, const char *a2, ...)
{
  return _[a1 subscriptionInfo];
}

id objc_msgSend_superclass(void *a1, const char *a2, ...)
{
  return _[a1 superclass];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportedServices(void *a1, const char *a2, ...)
{
  return _[a1 supportedServices];
}

id objc_msgSend_supportsCapability_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportsCapability:");
}

id objc_msgSend_syncWithiCloudSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 syncWithiCloudSpecifiers];
}

id objc_msgSend_systemFontOfSize_weight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemFontOfSize:weight:");
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGrayColor];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:");
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemImageNamed:withConfiguration:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableCell(void *a1, const char *a2, ...)
{
  return _[a1 tableCell];
}

id objc_msgSend_tableHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 tableHeaderView];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tableView_didSelectRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:didSelectRowAtIndexPath:");
}

id objc_msgSend_tableView_heightForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:heightForHeaderInSection:");
}

id objc_msgSend_tableView_titleForFooterInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:titleForFooterInSection:");
}

id objc_msgSend_tableView_viewForHeaderInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:viewForHeaderInSection:");
}

id objc_msgSend_tableViewOM(void *a1, const char *a2, ...)
{
  return _[a1 tableViewOM];
}

id objc_msgSend_tableViewSectionInjectorForGPPRWithPage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableViewSectionInjectorForGPPRWithPage:");
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return _[a1 tag];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return _[a1 target];
}

id objc_msgSend_telemetryFlowID(void *a1, const char *a2, ...)
{
  return _[a1 telemetryFlowID];
}

id objc_msgSend_terminateApplication_forReason_andReport_withDescription_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "terminateApplication:forReason:andReport:withDescription:");
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_thumbnailImageData(void *a1, const char *a2, ...)
{
  return _[a1 thumbnailImageData];
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

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_totalStorage(void *a1, const char *a2, ...)
{
  return _[a1 totalStorage];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_tryLock(void *a1, const char *a2, ...)
{
  return _[a1 tryLock];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_ubiquityAccessManager(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityAccessManager];
}

id objc_msgSend_ubiquityDataclassSwitchSpecifer(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityDataclassSwitchSpecifer];
}

id objc_msgSend_ubiquityLinklistSpecifer(void *a1, const char *a2, ...)
{
  return _[a1 ubiquityLinklistSpecifer];
}

id objc_msgSend_ubiquityProviderShowViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ubiquityProviderShowViewController:");
}

id objc_msgSend_ubiquitySpecifierProvider(void *a1, const char *a2, ...)
{
  return _[a1 ubiquitySpecifierProvider];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return _[a1 unlock];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateDetailLabelWithBackup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDetailLabelWithBackup:");
}

id objc_msgSend_updateStateWithExternalAuthenticationResponse_forContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateStateWithExternalAuthenticationResponse:forContext:completion:");
}

id objc_msgSend_updateWithRUIClientInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithRUIClientInfo:");
}

id objc_msgSend_urlConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 urlConfiguration];
}

id objc_msgSend_urlRequest(void *a1, const char *a2, ...)
{
  return _[a1 urlRequest];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userNotifiedOfActivationLockForAllPairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 userNotifiedOfActivationLockForAllPairedDevices];
}

id objc_msgSend_userTappedBackup(void *a1, const char *a2, ...)
{
  return _[a1 userTappedBackup];
}

id objc_msgSend_userTappedFMIP(void *a1, const char *a2, ...)
{
  return _[a1 userTappedFMIP];
}

id objc_msgSend_userUnderAgeForAccount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "userUnderAgeForAccount:");
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return _[a1 username];
}

id objc_msgSend_validateAccessForDataclass_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateAccessForDataclass:completion:");
}

id objc_msgSend_validateDataclassAccessForProvider_specifier_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateDataclassAccessForProvider:specifier:completion:");
}

id objc_msgSend_validateSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateSpecifier:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithNonretainedObject:");
}

id objc_msgSend_verifyAndRepairManateeWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyAndRepairManateeWithCompletion:");
}

id objc_msgSend_verifyWithHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "verifyWithHandler:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return _[a1 viewController];
}

id objc_msgSend_walrusStatusWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "walrusStatusWithCompletion:");
}

id objc_msgSend_webAccessDisableURL(void *a1, const char *a2, ...)
{
  return _[a1 webAccessDisableURL];
}

id objc_msgSend_webAccessEnableURL(void *a1, const char *a2, ...)
{
  return _[a1 webAccessEnableURL];
}

id objc_msgSend_webAccessKBURL(void *a1, const char *a2, ...)
{
  return _[a1 webAccessKBURL];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}