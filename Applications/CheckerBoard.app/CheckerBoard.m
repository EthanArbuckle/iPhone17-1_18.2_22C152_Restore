void sub_100005EDC(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v2 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];
    [v3 stopScan];
  }
}

void sub_100005F54(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 remoteSetupQRCodeScannerController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000601C;
  v7[3] = &unk_1000794E0;
  v7[4] = *(void *)(a1 + 32);
  [v5 dismissViewControllerAnimated:1 completion:v7];

  v6 = [*(id *)(a1 + 32) remoteSetupManager];
  [v6 sendAuthPassword:v4];
}

void sub_10000601C(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];
    [v3 stopScan];
  }
}

void sub_100006094(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];
  unsigned __int8 v3 = [v2 startScan];

  if ((v3 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006140;
    block[3] = &unk_1000794E0;
    block[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

void sub_100006140(uint64_t a1)
{
  v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100048AD8(v2, v3, v4, v5, v6, v7, v8, v9);
  }

  v10 = [*(id *)(a1 + 32) remoteSetupManager];
  [v10 setupFailed];
}

void sub_100006614(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];

  if (v2)
  {
    id v3 = [*(id *)(a1 + 32) remoteSetupQRCodeScanner];
    [v3 stopScan];
  }
}

void sub_1000068F4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) remoteSetupManager];
  [v1 startRemoteSetupBroadcast];
}

void sub_100006938(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000069D4(id a1)
{
  qword_10008FD60 = objc_alloc_init(CBUserSettings);

  _objc_release_x1();
}

void sub_100007258(id a1)
{
  id v1 = +[CBAPTicket sharedInstance];
  unsigned int v2 = [v1 isEntitledForTag:1633776739];

  int v3 = MGGetBoolAnswer();
  id v12 = 0;
  unsigned int v4 = +[CBSNVRamUtil readNVRamVariable:@"EnableInfoPaneInCheckerBoard" value:&v12];
  id v5 = v12;
  uint64_t v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7 || ![v5 length])
  {
    char v10 = 0;
  }
  else
  {
    id v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
    unsigned int v9 = [v8 BOOLValue];

    char v10 = v3 ^ 1 | v2;
    if (!v9) {
      char v10 = 0;
    }
  }
  byte_10008FD70 = v10;
  v11 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    int v14 = byte_10008FD70;
    __int16 v15 = 1024;
    unsigned int v16 = v2;
    __int16 v17 = 1024;
    int v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Should show info pane: (%d). Entitled: (%d)  Fusing: (%d)", buf, 0x14u);
  }
}

void sub_1000077D0(uint64_t a1)
{
  unsigned int v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = [*(id *)(a1 + 32) wifiSSIDFromNvram];
    unsigned int v4 = [*(id *)(a1 + 32) wifiPasswordFromNvram];
    *(_DWORD *)buf = 138412546;
    id v18 = v3;
    __int16 v19 = 2112;
    v20 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Attempting to set wifi to (%@ : %@)", buf, 0x16u);
  }
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100007A78;
  v16[3] = &unk_1000795B8;
  v16[4] = *(void *)(a1 + 32);
  id v5 = objc_retainBlock(v16);
  unsigned int v6 = [*(id *)(a1 + 32) wifiRequiresPassword];
  BOOL v7 = +[CBShellServer sharedInstance];
  id v8 = [v7 systemServicesDelegate];
  unsigned int v9 = [*(id *)(a1 + 32) wifiSSIDFromNvram];
  if (v6)
  {
    char v10 = [*(id *)(a1 + 32) wifiPasswordFromNvram];
    [v8 connectToSSID:v9 password:v10 completion:v5];
  }
  else
  {
    [v8 connectToSSID:v9 completion:v5];
  }

  [*(id *)(a1 + 32) setWifiJoinAttemptCount:[*(id *)(a1 + 32) wifiJoinAttemptCount] + 1];
  if ((unint64_t)[*(id *)(a1 + 32) wifiJoinAttemptCount] >= 0xB)
  {
    v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = [*(id *)(a1 + 32) wifiJoinAttemptCount];
      *(_DWORD *)buf = 134217984;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempted to connect to wifi %ld times without success. No further attempts will be made", buf, 0xCu);
    }

    v13 = [*(id *)(a1 + 32) wifiReconnectTimer];

    if (v13)
    {
      int v14 = [*(id *)(a1 + 32) wifiReconnectTimer];
      [v14 invalidate];

      [*(id *)(a1 + 32) setWifiReconnectTimer:0];
    }
    __int16 v15 = [*(id *)(a1 + 32) diagsLaunchDependenciesSemaphore];
    dispatch_semaphore_signal(v15);
  }
}

void sub_100007A78(uint64_t a1, int a2)
{
  unsigned int v4 = CheckerBoardLogHandleForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Connected to wifi network specified in nvram", buf, 2u);
    }

    unsigned int v6 = [*(id *)(a1 + 32) wifiReconnectTimer];

    if (v6)
    {
      BOOL v7 = [*(id *)(a1 + 32) wifiReconnectTimer];
      [v7 invalidate];

      [*(id *)(a1 + 32) setWifiReconnectTimer:0];
    }
    id v8 = [*(id *)(a1 + 32) diagsLaunchDependenciesSemaphore];
    dispatch_semaphore_signal(v8);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to connect to wifi network specified in nvram. Setting timer to re-try", v11, 2u);
    }

    unsigned int v9 = [*(id *)(a1 + 32) wifiReconnectTimer];

    if (v9)
    {
      char v10 = [*(id *)(a1 + 32) wifiReconnectTimer];
      [v10 invalidate];
    }
    id v8 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_attemptConnectingToWifi" selector:0 userInfo:0 repeats:2.0];
    [*(id *)(a1 + 32) setWifiReconnectTimer:v8];
  }
}

void sub_1000080AC(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) diagsLaunchDependenciesSemaphore];
  dispatch_time_t v3 = dispatch_time(0, 20);
  dispatch_semaphore_wait(v2, v3);

  id v12 = 0;
  unsigned int v4 = +[CBSNVRamUtil readNVRamVariable:@"cb-auto-launch-diags" value:&v12];
  id v5 = v12;
  unsigned int v6 = v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    if ([v5 length])
    {
      id v8 = [objc_alloc((Class)NSString) initWithData:v6 encoding:4];
      unsigned int v9 = [v8 BOOLValue];

      if (v9)
      {
        v10[0] = _NSConcreteStackBlock;
        v10[1] = 3221225472;
        v10[2] = sub_1000081E4;
        v10[3] = &unk_1000794E0;
        id v11 = *(id *)(a1 + 40);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
      }
    }
  }
}

void sub_1000081E4(uint64_t a1)
{
  unsigned int v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Moving directly to Diagnostics", v4, 2u);
  }

  dispatch_time_t v3 = objc_alloc_init(CBEndgameViewController);
  [*(id *)(a1 + 32) pushViewController:v3 animated:1];
}

void sub_100008678(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100008694(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained windowManager];
  [v1 windowDidDismiss:WeakRetained];
}

void sub_1000088D8(id a1)
{
  qword_10008FD80 = objc_alloc_init(CBThermalManager);

  _objc_release_x1();
}

id sub_100008D70(uint64_t a1, void *a2)
{
  dispatch_time_t v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Handling thermal notification…", v5, 2u);
  }

  return [a2 _respondToCurrentThermalCondition];
}

id sub_100008DE8(uint64_t a1)
{
  unsigned int v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Thermal state changed", v4, 2u);
  }

  return [*(id *)(a1 + 32) _respondToCurrentThermalCondition];
}

void sub_1000093FC(uint64_t a1)
{
  if ([*(id *)(a1 + 32) sampling])
  {
    unsigned int v2 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v7 = 0x4024000000000000;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Let's kill the thermally active application after %f seconds", buf, 0xCu);
    }

    dispatch_time_t v3 = *(void **)(a1 + 32);
    NSRunLoopMode v5 = NSRunLoopCommonModes;
    unsigned int v4 = +[NSArray arrayWithObjects:&v5 count:1];
    [v3 performSelector:"_killThermallyActiveApplication" withObject:0 afterDelay:v4 inModes:10.0];
  }
}

id *sub_100009ADC(id *result)
{
  if (result)
  {
    id v1 = result;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    unsigned int v2 = +[UIScreen mainScreen];
    [v2 scale];
    CGFloat v4 = v3;

    v27[0] = kCAContextDisplayable;
    v27[1] = kCAContextSecure;
    v28[0] = kCFBooleanTrue;
    v28[1] = kCFBooleanTrue;
    NSRunLoopMode v5 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
    uint64_t v6 = +[CAContext remoteContextWithOptions:v5];
    id v7 = v1[13];
    v1[13] = (id)v6;

    LODWORD(v8) = 1148846080;
    [v1[13] setLevel:v8];
    [v1[13] setSecure:1];
    uint64_t v9 = +[CALayer layer];
    id v10 = v1[14];
    v1[14] = (id)v9;

    id v11 = v1[14];
    CGAffineTransformMakeScale(&v26, v4, v4);
    [v11 setAffineTransform:&v26];
    double y = CGPointZero.y;
    GSMainScreenPixelSize();
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    [v1[14] setFrame:CGPointZero.x, y, v13, v15];
    GSMainScreenOrientation();
    if (v17 != 0.0)
    {
      float v18 = v17;
      id v19 = v1[14];
      v29.origin.x = CGPointZero.x;
      v29.origin.double y = y;
      v29.size.width = v14;
      v29.size.height = v16;
      double MidY = CGRectGetMidY(v29);
      v30.origin.x = CGPointZero.x;
      v30.origin.double y = y;
      v30.size.width = v14;
      v30.size.height = v16;
      [v19 setPosition:MidY, CGRectGetMidX(v30)];
      id v21 = v1[14];
      if (v21) {
        [v21 affineTransform];
      }
      else {
        memset(&v24, 0, sizeof(v24));
      }
      CGAffineTransformRotate(&v25, &v24, (float)-v18);
      [v21 setAffineTransform:&v25];
    }
    uint64_t v22 = +[CASecureIndicatorLayer layer];
    id v23 = v1[16];
    v1[16] = (id)v22;

    [v1[16] setMasksToBounds:1];
    [v1[14] addSublayer:v1[16]];
    [v1[13] setLayer:v1[14]];

    return (id *)+[CATransaction commit];
  }
  return result;
}

void sub_100009DB4(uint64_t a1)
{
  if (a1)
  {
    *(void *)(a1 + 64) = 0;
    *(void *)(a1 + 72) = 0xC049000000000000;
    *(void *)(a1 + 80) = 0xC049000000000000;
    switch(sub_100038930())
    {
      case 0:
      case 1:
      case 2:
        id v7 = +[UIScreen mainScreen];
        [v7 scale];
        double v9 = fabs(v8 + -2.0);

        char v2 = 0;
        double v10 = 10.0;
        if (v9 > 2.22044605e-16) {
          double v10 = 13.0;
        }
        *(double *)(a1 + 64) = v10;
        goto LABEL_10;
      case 3:
      case 4:
      case 6:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4030000000000000;
        double v6 = 18.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 212.0;
        goto LABEL_25;
      case 5:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4030000000000000;
        double v6 = 18.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 268.0;
        goto LABEL_25;
      case 7:
      case 8:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4028000000000000;
        double v6 = 12.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 157.0;
        goto LABEL_25;
      case 9:
      case 10:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v6 = 19.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        uint64_t v11 = 0x4066000000000000;
        goto LABEL_15;
      case 11:
      case 12:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v6 = 19.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        uint64_t v11 = 0x406D000000000000;
LABEL_15:
        double v4 = *(double *)&v11;
        goto LABEL_25;
      case 13:
      case 14:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v6 = 18.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 289.0;
        goto LABEL_25;
      case 15:
      case 16:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v6 = 19.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 252.0;
        goto LABEL_25;
      case 17:
      case 18:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 18.0;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v6 = 306.0;
        goto LABEL_25;
      case 19:
      case 20:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4032000000000000;
        double v6 = 18.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v4 = 363.0;
        goto LABEL_25;
      case 21:
      case 22:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4031000000000000;
        double v6 = 31.0;
        goto LABEL_22;
      case 23:
      case 24:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4031000000000000;
        double v6 = 28.0;
LABEL_22:
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v4 = 79.0;
        goto LABEL_25;
      case 25:
      case 26:
      case 27:
      case 28:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x4031000000000000;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v6 = 39.0;
        double v4 = 88.5;
        goto LABEL_25;
      case 29:
      case 30:
      case 31:
      case 32:
      case 33:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x402C000000000000;
LABEL_10:
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v4 = 3.0;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v6 = 3.0;
        goto LABEL_25;
      case 34:
      case 35:
      case 36:
      case 37:
      case 38:
        char v2 = 0;
        *(void *)(a1 + 64) = 0x402C000000000000;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v4 = 16.0;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
        double v6 = 16.0;
        goto LABEL_25;
      case 39:
      case 40:
      case 41:
      case 42:
      case 43:
        *(void *)(a1 + 64) = 0x4028000000000000;
        char v2 = 1;
        double v6 = 18.0;
        double v3 = &OBJC_IVAR___CBRecordingIndicatorViewController__topOffset;
        double v4 = 31.0;
        NSRunLoopMode v5 = &OBJC_IVAR___CBRecordingIndicatorViewController__sideOffset;
LABEL_25:
        *(double *)(a1 + *v5) = v4;
        *(double *)(a1 + *v3) = v6;
        break;
      default:
        char v2 = 0;
        break;
    }
    id v12 = (char *)[(id)a1 location];
    if (v12 == (char *)1)
    {
      double v13 = +[UIScreen mainScreen];
      [v13 scale];
      double v15 = fabs(v14 + -2.0);

      if (v15 <= 2.22044605e-16)
      {
        float v17 = +[UIDevice currentDevice];
        id v18 = [v17 userInterfaceIdiom];

        if (v18 == (id)1) {
          uint64_t v16 = 0x402E000000000000;
        }
        else {
          uint64_t v16 = 0x402A000000000000;
        }
      }
      else
      {
        uint64_t v16 = 0x4032000000000000;
      }
      *(void *)(a1 + 64) = v16;
    }
    id v19 = +[UIScreen mainScreen];
    [v19 scale];

    if ((v2 & 1) == 0)
    {
      v20 = +[UIScreen mainScreen];
      [v20 nativeScale];
    }
    UIRoundToScale();
    *(void *)(a1 + 64) = v21;
    UIRoundToScale();
    *(void *)(a1 + 72) = v22;
    UIRoundToScale();
    *(void *)(a1 + 80) = v23;
    if ((unint64_t)(v12 - 1) <= 1)
    {
      *(void *)(a1 + 72) = 0xC059000000000000;
      *(void *)(a1 + 80) = 0xC059000000000000;
    }
    if ([UIApp userInterfaceLayoutDirection] == (id)1)
    {
      double v24 = *(double *)(a1 + 72);
      double v25 = *(double *)(a1 + 64);
      double v26 = *(double *)(a1 + 80);
    }
    else
    {
      v27 = +[UIScreen mainScreen];
      [v27 bounds];
      double v25 = *(double *)(a1 + 64);
      double v24 = v28 - v25 - *(double *)(a1 + 72);
      double v26 = *(double *)(a1 + 80);
    }
    v34.origin.x = v24;
    v34.origin.double y = v26;
    v34.size.width = v25;
    v34.size.height = v25;
    CGFloat MidX = CGRectGetMidX(v34);
    v35.origin.x = v24;
    v35.origin.double y = v26;
    v35.size.width = v25;
    v35.size.height = v25;
    CGFloat MidY = CGRectGetMidY(v35);
    *(CGFloat *)(a1 + 88) = MidX;
    *(CGFloat *)(a1 + 96) = MidY;
    sub_10000A940((id *)a1, v24, v26, v25, v25, *(double *)(a1 + 88), *(double *)(a1 + 96));
    v31 = [(id)a1 indicatorContainerView];
    [v31 setFrame:v24, v26, v25, v25];

    v32 = [(id)a1 indicatorView];
    [v32 setFrame:v24, v26, v25, v25];

    if (v12 != (char *)1)
    {
      sub_10000AA40((id *)a1, 0.0, 0.0);
      sub_10000AB3C(a1, 0.0, 0.0);
    }
  }
}

void sub_10000A4D0(void *a1, uint64_t a2)
{
  if (a1 && a1[20] != a2)
  {
    a1[20] = a2;
    id v4 = [a1 delegate];
    [v4 recordingIndicatorViewController:a1 didUpdateIndicatorState:a2];
  }
}

void sub_10000A608(uint64_t a1, uint64_t a2, double a3)
{
  if (a1 && *(void *)(a1 + 168) != a2)
  {
    *(void *)(a1 + 168) = a2;
    if (a3 <= 0.0 || *(unsigned char *)(a1 + 120) == 0)
    {
      sub_10000ADD4((char *)a1, a2);
    }
    else
    {
      NSRunLoopMode v5 = +[CBRecordingIndicatorDomain rootSettings];
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        [v5 delayBeforeFadeOut180];
        double v8 = v7;
        [v5 fadeOutDuration180];
        double v10 = v9;
        [v5 delayBeforeFadeIn180];
        id v12 = v11;
        [v5 fadeInDuration180];
      }
      else
      {
        [v5 delayBeforeFadeOut90];
        double v8 = v14;
        [v5 fadeOutDuration90];
        double v10 = v15;
        [v5 delayBeforeFadeIn90];
        id v12 = v16;
        [v5 fadeInDuration90];
      }
      double v17 = v13;
      objc_initWeak(&location, (id)a1);
      id v18 = objc_alloc((Class)UIViewPropertyAnimator);
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10000AC7C;
      v31[3] = &unk_100079608;
      objc_copyWeak(&v32, &location);
      id v19 = [v18 initWithDuration:0 curve:v31 animations:v10];
      id v20 = objc_alloc((Class)UIViewPropertyAnimator);
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10000ACF4;
      v29[3] = &unk_100079608;
      objc_copyWeak(&v30, &location);
      id v21 = [v20 initWithDuration:0 curve:v29 animations:v17];
      uint64_t v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      double v25 = sub_10000AD6C;
      double v26 = &unk_1000796A8;
      objc_copyWeak(v28, &location);
      id v22 = v21;
      id v27 = v22;
      v28[1] = v12;
      [v19 addCompletion:&v23];
      [v19 startAnimationAfterDelay:v8, v23, v24, v25, v26];

      objc_destroyWeak(v28);
      objc_destroyWeak(&v30);

      objc_destroyWeak(&v32);
      objc_destroyWeak(&location);
    }
  }
}

void sub_10000A8F4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 120));
  _Unwind_Resume(a1);
}

void sub_10000A938()
{
}

id *sub_10000A940(id *result, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (result)
  {
    double v13 = result;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    double v14 = [v13 indicatorView];
    BOOL v15 = sub_10001CA04((unint64_t)[v14 indicatorType]);

    double v16 = a4 * 0.5;
    if (!v15) {
      double v16 = 0.0;
    }
    [v13[16] setCornerRadius:v16];
    [v13[16] setBounds:a2, a3, a4, a5];
    [v13[16] setPosition:a6, a7];
    return (id *)+[CATransaction commit];
  }
  return result;
}

id *sub_10000AA40(id *result, double a2, double a3)
{
  if (result)
  {
    NSRunLoopMode v5 = result;
    +[CATransaction begin];
    +[CATransaction setDisableActions:1];
    double v6 = [v5 indicatorView];
    BOOL v7 = sub_10001CA04((unint64_t)[v6 indicatorType]);

    double v8 = a2 * 0.5;
    if (!v7) {
      double v8 = 0.0;
    }
    [v5[16] setCornerRadius:v8];
    [v5[16] frame];
    [v5[16] setFrame:];
    [v5[16] setPosition:*((double *)v5 + 11), *((double *)v5 + 12)];
    *(float *)&double v9 = a3;
    [v5[16] setOpacity:v9];
    return (id *)+[CATransaction commit];
  }
  return result;
}

void sub_10000AB3C(uint64_t a1, double a2, double a3)
{
  if (a1)
  {
    id v18 = [(id)a1 indicatorView];
    [v18 setBounds:0.0, 0.0, a2, a2];
    [v18 setAlpha:a3];
    BOOL v6 = [(id)a1 location] == (id)2 || *(unsigned char *)(a1 + 120) && ![a1 location];
    BOOL v7 = [(id)a1 indicatorContainerView];
    double v8 = v7;
    if (v6 && v7)
    {
      [v7 center];
      double v10 = v9;
      double v12 = v11;
      double v13 = [v8 superview];
      [v8 convertPoint:v13 fromView:v10];
      double v15 = v14;
      double v17 = v16;
    }
    else
    {
      double v15 = *(double *)(a1 + 88);
      double v17 = *(double *)(a1 + 96);
    }
    [v18 setCenter:v15, v17];
  }
}

void sub_10000AC7C(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    char v2 = [WeakRetained view];
    [v2 setAlpha:0.0];

    [v3[14] setOpacity:0.0];
    id WeakRetained = v3;
  }
}

void sub_10000ACF4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    char v2 = [WeakRetained view];
    [v2 setAlpha:1.0];

    LODWORD(v3) = 1.0;
    [v4[14] setOpacity:v3];
    id WeakRetained = v4;
  }
}

void sub_10000AD6C(uint64_t a1)
{
  id WeakRetained = (uint64_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    sub_10000ADD4((char *)WeakRetained, WeakRetained[21]);
    [*(id *)(a1 + 32) startAnimationAfterDelay:*(double *)(a1 + 48)];
    id WeakRetained = v3;
  }
}

char *sub_10000ADD4(char *result, uint64_t a2)
{
  if (!result) {
    return result;
  }
  double v3 = result;
  uint64_t v4 = +[UIScreen mainScreen];
  [v4 _referenceBounds];
  double v6 = v5;
  double v8 = v7;

  switch(a2)
  {
    case 4:
      id v12 = [UIApp userInterfaceLayoutDirection];
      double v10 = *((double *)v3 + 10);
      double v9 = *((double *)v3 + 8);
      if (v12 == (id)1) {
        double v10 = v6 - v10 - v9;
      }
      uint64_t v14 = 72;
      break;
    case 3:
      id v11 = [UIApp userInterfaceLayoutDirection];
      double v10 = *((double *)v3 + 10);
      double v9 = *((double *)v3 + 8);
      if (v11 != (id)1) {
        double v10 = v6 - v10 - v9;
      }
      double v13 = v8 - *((double *)v3 + 9) - v9;
      goto LABEL_21;
    case 2:
      if ([UIApp userInterfaceLayoutDirection] == (id)1)
      {
        double v9 = *((double *)v3 + 8);
        double v10 = v6 - v9 - *((double *)v3 + 9);
      }
      else
      {
        double v10 = *((double *)v3 + 9);
        double v9 = *((double *)v3 + 8);
      }
      double v13 = v8 - v9 - *((double *)v3 + 10);
      goto LABEL_21;
    default:
      if ([UIApp userInterfaceLayoutDirection] == (id)1)
      {
        double v10 = *((double *)v3 + 9);
        double v9 = *((double *)v3 + 8);
      }
      else
      {
        double v9 = *((double *)v3 + 8);
        double v10 = v6 - v9 - *((double *)v3 + 9);
      }
      uint64_t v14 = 80;
      break;
  }
  double v13 = *(double *)&v3[v14];
LABEL_21:
  v19.origin.x = v10;
  v19.origin.double y = v13;
  v19.size.width = v9;
  v19.size.height = v9;
  CGFloat MidX = CGRectGetMidX(v19);
  v20.origin.x = v10;
  v20.origin.double y = v13;
  v20.size.width = v9;
  v20.size.height = v9;
  CGFloat MidY = CGRectGetMidY(v20);
  *((CGFloat *)v3 + 11) = MidX;
  *((CGFloat *)v3 + 12) = MidY;
  +[CATransaction begin];
  +[CATransaction setDisableActions:1];
  [*((id *)v3 + 16) setPosition:*((double *)v3 + 11), *((double *)v3 + 12)];
  double v17 = [v3 indicatorView];
  [v17 setCenter:*((double *)v3 + 11), *((double *)v3 + 12)];

  return (char *)+[CATransaction commit];
}

void sub_10000B3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000B41C(uint64_t a1, int a2)
{
  if (a1)
  {
    uint64_t v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      if (a2) {
        CFStringRef v5 = @"on";
      }
      else {
        CFStringRef v5 = @"off";
      }
      id v6 = [(id)a1 location];
      double v7 = @"Standalone";
      if (v6 == (id)1) {
        double v7 = @"StatusBar";
      }
      if (v6 == (id)2) {
        double v7 = @"SystemAperture";
      }
      double v8 = v7;
      *(_DWORD *)buf = 138543618;
      CFStringRef v33 = v5;
      __int16 v34 = 2114;
      CGRect v35 = v8;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Recording Indicator] Turning %{public}@ at %{public}@ location (spring animation)", buf, 0x16u);
    }
    sub_10000B8D8((id *)a1);
    objc_initWeak((id *)buf, (id)a1);
    double v9 = [(id)a1 indicatorView];
    double v10 = [v9 layer];
    if (a2)
    {
      if (!*(unsigned char *)(a1 + 120))
      {
        sub_10000BFF8(a1, v10, 6.0);
        sub_10000C11C(a1, v10, @"filters.gaussianBlur.inputRadius", &off_10007CE88, &off_10007CE98, 1, 0.8);
      }
      id v11 = objc_alloc((Class)UIViewPropertyAnimator);
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10000C1F0;
      v30[3] = &unk_100079720;
      id v12 = &v31;
      objc_copyWeak(&v31, (id *)buf);
      v30[4] = a1;
      id v13 = [v11 initWithDuration:v30 dampingRatio:1.9 animations:0.35];
      uint64_t v14 = *(void **)(a1 + 48);
      *(void *)(a1 + 48) = v13;

      double v15 = *(void **)(a1 + 48);
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      id v28[2] = sub_10000C254;
      v28[3] = &unk_1000796D0;
      double v16 = &v29;
      objc_copyWeak(&v29, (id *)buf);
      [v15 addCompletion:v28];
      sub_10000A4D0((void *)a1, 1);
      [*(id *)(a1 + 48) startAnimation];
    }
    else
    {
      if (!*(unsigned char *)(a1 + 120))
      {
        sub_10000BFF8(a1, v10, 0.0);
        sub_10000C11C(a1, v10, @"filters.gaussianBlur.inputRadius", &off_10007CEA8, &off_10007CEB8, 0, 1.0);
      }
      id v17 = objc_alloc((Class)UIViewPropertyAnimator);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10000C2A8;
      v26[3] = &unk_100079720;
      id v12 = &v27;
      objc_copyWeak(&v27, (id *)buf);
      v26[4] = a1;
      id v18 = [v17 initWithDuration:v26 dampingRatio:1.5 animations:1.02];
      CGRect v19 = *(void **)(a1 + 56);
      *(void *)(a1 + 56) = v18;

      CGRect v20 = *(void **)(a1 + 56);
      id v21 = _NSConcreteStackBlock;
      uint64_t v22 = 3221225472;
      uint64_t v23 = sub_10000C314;
      uint64_t v24 = &unk_1000796D0;
      double v16 = &v25;
      objc_copyWeak(&v25, (id *)buf);
      [v20 addCompletion:&v21];
      sub_10000A4D0((void *)a1, 3);
      [*(id *)(a1 + 56) startAnimation:v21, v22, v23, v24];
    }
    objc_destroyWeak(v16);
    objc_destroyWeak(v12);

    objc_destroyWeak((id *)buf);
  }
}

void sub_10000B854(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 112));
  _Unwind_Resume(a1);
}

id *sub_10000B8D8(id *result)
{
  if (result)
  {
    uint64_t v1 = result;
    [result[1] stopAnimation:1];
    [v1[2] stopAnimation:1];
    [v1[3] stopAnimation:1];
    [v1[4] stopAnimation:1];
    [v1[5] stopAnimation:1];
    [v1[6] stopAnimation:1];
    id v2 = v1[7];
    return (id *)[v2 stopAnimation:1];
  }
  return result;
}

void sub_10000B998(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 32));
  sub_10000AB3C((uint64_t)WeakRetained, WeakRetained[8] * 1.2, 1.0);
}

void sub_10000BDB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_10000BDFC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    double v2 = *(double *)(v1 + 64);
    double v3 = 0.8;
    if (*(unsigned char *)(v1 + 120)) {
      double v3 = 1.0;
    }
    else {
      double v2 = v2 * 0.8;
    }
  }
  else
  {
    double v2 = 0.0;
    double v3 = 0.0;
  }
  sub_10000AB3C(v1, v2, v3);
}

void sub_10000BE48(uint64_t a1)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v13 = WeakRetained;
    id v3 = [WeakRetained location];
    uint64_t v4 = v13;
    if (v3 != (id)2)
    {
      if (v3)
      {
        BOOL v6 = v13[120] == 0;
        double v5 = *((double *)v13 + 8);
        if (v13[120])
        {
LABEL_8:
          double v7 = 1.0;
          if (v6) {
            double v7 = 0.8;
          }
          sub_10000AA40((id *)v13, v5, v7);
          double v8 = [v13 traitCollection];
          id v9 = [v8 _backlightLuminance];

          if (v9 == (id)1 && (uint64_t v10 = *(void *)(a1 + 32)) != 0)
          {
            if (*(unsigned char *)(v10 + 120)) {
              double v11 = 1.0;
            }
            else {
              double v11 = 0.8;
            }
          }
          else
          {
            double v11 = 0.0;
          }
          double v12 = *((double *)v13 + 8);
          if (!v13[120]) {
            double v12 = v12 * 0.8;
          }
          sub_10000AB3C((uint64_t)v13, v12, v11);
          uint64_t v4 = v13;
          goto LABEL_19;
        }
LABEL_7:
        double v5 = v5 * 0.8;
        goto LABEL_8;
      }
      if (!v13[120])
      {
        double v5 = *((double *)v13 + 8);
        BOOL v6 = 1;
        goto LABEL_7;
      }
    }
LABEL_19:
    sub_10000A4D0(v4, 2);
    id WeakRetained = v13;
  }
}

void sub_10000BFA4(uint64_t a1)
{
}

void sub_10000BFB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_10000A4D0(WeakRetained, 0);
}

void sub_10000BFF8(uint64_t a1, void *a2, double a3)
{
  if (a1)
  {
    uint64_t v4 = kCAFilterGaussianBlur;
    id v5 = a2;
    BOOL v6 = +[CAFilter filterWithType:v4];
    [v6 setName:@"gaussianBlur"];
    [v6 setValue:@"high" forKey:@"inputQuality"];
    double v7 = +[NSNumber numberWithDouble:a3];
    [v6 setValue:v7 forKey:@"inputRadius"];

    id v9 = v6;
    double v8 = +[NSArray arrayWithObjects:&v9 count:1];
    [v5 setFilters:v8];
  }
}

void sub_10000C11C(uint64_t a1, void *a2, void *a3, void *a4, void *a5, int a6, double a7)
{
  id v16 = a2;
  id v13 = a3;
  id v14 = a5;
  if (a1)
  {
    double v15 = sub_10000C368(a1, (uint64_t)v13, a4, v14, a7);
    [v16 addAnimation:v15 forKey:v13];
    if (a6) {
      [v16 setValue:v14 forKeyPath:v13];
    }
  }
}

void sub_10000C1F0(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  sub_10000AB3C(*(void *)(a1 + 32), WeakRetained[8], 1.0);
}

void sub_10000C254(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained indicatorState] == (id)1) {
    sub_10000A4D0(WeakRetained, 2);
  }
}

void sub_10000C2A8(uint64_t a1)
{
  id WeakRetained = (double *)objc_loadWeakRetained((id *)(a1 + 40));
  sub_10000AB3C(*(void *)(a1 + 32), WeakRetained[8] * 0.5, 0.0);
}

void sub_10000C314(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained indicatorState] == (id)3) {
    sub_10000A4D0(WeakRetained, 0);
  }
}

id sub_10000C368(uint64_t a1, uint64_t a2, void *a3, void *a4, double a5)
{
  if (a1)
  {
    id v8 = a4;
    id v9 = a3;
    uint64_t v10 = +[CASpringAnimation animationWithKeyPath:a2];
    [v10 setBeginTime:CACurrentMediaTime()];
    [v10 setFillMode:kCAFillModeBackwards];
    [v10 setFromValue:v9];

    [v10 setToValue:v8];
    [v10 setMass:2.0];
    [v10 setStiffness:300.0];
    [v10 setDamping:50.0];
    [v10 setDuration:a5];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_10000C464(unsigned char *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    if ([a1 indicatorState] == (id)2)
    {
      id v6 = [a1 location];
      if (v6 != (id)2 && (v6 || !a1[120]) && (a2 == 1 || a3 == 1))
      {
        double v7 = [a1 indicatorView];
        double v8 = 0.0;
        if (a2 == 1)
        {
          double v8 = 0.8;
          if (a1[120]) {
            double v8 = 1.0;
          }
        }
        id v9 = v7;
        [v7 setAlpha:v8];
      }
    }
  }
}

void sub_10000C824(id a1)
{
  qword_10008FD90 = objc_alloc_init(CBStatusBarStateAggregator);

  _objc_release_x1();
}

id sub_10000CFC8(uint64_t a1, void *a2)
{
  return [a2 _updateLockItem];
}

void sub_10000D19C(id a1)
{
  id v1 = objc_alloc_init((Class)NSDateFormatter);
  double v2 = (void *)qword_10008FDA0;
  qword_10008FDA0 = (uint64_t)v1;

  id v3 = (void *)qword_10008FDA0;
  uint64_t v4 = +[NSLocale currentLocale];
  [v3 setLocale:v4];

  [(id)qword_10008FDA0 setDateStyle:0];
  id v5 = (void *)qword_10008FDA0;

  _[v5 setTimeStyle:1];
}

id sub_10000D2BC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _timeItemDateFormatter];
  id v2 = [v1 copy];
  id v3 = (void *)qword_10008FDB0;
  qword_10008FDB0 = (uint64_t)v2;

  uint64_t v4 = (void *)qword_10008FDB0;

  return _[v4 setLocalizedDateFormatFromTemplate:@"Jmm"];
}

void sub_10000D878(id a1)
{
  id v1 = objc_alloc_init((Class)NSNumberFormatter);
  id v2 = (void *)qword_10008FDC0;
  qword_10008FDC0 = (uint64_t)v1;

  [(id)qword_10008FDC0 setNumberStyle:3];
  id v3 = (void *)qword_10008FDC0;

  _[v3 _setUsesCharacterDirection:1];
}

void sub_10000DA9C(id a1, int a2)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Battery Saver Mode changed", v3, 2u);
  }
}

CFStringRef sub_10000ED70(unint64_t a1)
{
  if (a1 > 2) {
    return @"invalid";
  }
  else {
    return off_1000797E0[a1];
  }
}

id sub_10000EFCC(uint64_t a1)
{
  return [*(id *)(a1 + 32) sensor];
}

id sub_10000F09C(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)CBSensorActivityAttribution;
  return [super hash];
}

void sub_10000F2E4(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  sub_10000ED70((unint64_t)[*(id *)(a1 + 40) sensor]);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 appendObject:v3 withName:@"sensor"];
}

void sub_10001023C(id a1, unint64_t a2)
{
  if (!a2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    +[CBSystem checkoutAndReboot:1 userInitiated:1];
    uint64_t v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Exit Diagnostics] button was tapped. Checking out now…", v5, 2u);
    }
  }
}

void sub_100010484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000104A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained didTappedLanguageSelectorButton];
}

uint64_t sub_1000106A8(uint64_t a1)
{
  uint64_t v2 = 0;
  do
  {
    char v5 = 0;
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 16))(a1, v2, &v5);
    if (v5) {
      break;
    }
  }
  while (v2++ != 43);
  return result;
}

uint64_t sub_100010710(unint64_t a1)
{
  return (a1 < 0x22) & (0x3E0000007uLL >> a1);
}

BOOL sub_10001072C(uint64_t a1)
{
  return (unint64_t)(a1 - 29) < 0xF;
}

BOOL sub_10001073C(unint64_t a1)
{
  return a1 < 0x1D;
}

unint64_t sub_100010748@<X0>(unint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  uint64_t v2 = 2;
  uint64_t v3 = 1;
  if (((1 << result) & 0x3E0000007) == 0) {
    uint64_t v3 = 2;
  }
  if (result <= 0x21) {
    uint64_t v2 = v3;
  }
  *(void *)(a2 + 32) = v2;
  switch(result)
  {
    case 0uLL:
      *(_OWORD *)a2 = xmmword_1000598B0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 568;
      goto LABEL_53;
    case 1uLL:
      *(_OWORD *)a2 = xmmword_1000598C0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 569;
      goto LABEL_53;
    case 2uLL:
      *(_OWORD *)a2 = xmmword_1000598D0;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 570;
      goto LABEL_53;
    case 3uLL:
      long long v9 = xmmword_1000598F0;
      goto LABEL_22;
    case 4uLL:
      long long v9 = xmmword_1000598E0;
LABEL_22:
      *(_OWORD *)a2 = v9;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2436;
      goto LABEL_53;
    case 5uLL:
      long long v10 = xmmword_100059910;
      goto LABEL_25;
    case 6uLL:
      long long v10 = xmmword_1000598F0;
LABEL_25:
      *(_OWORD *)a2 = v10;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2688;
      goto LABEL_53;
    case 7uLL:
      long long v11 = xmmword_100059910;
      goto LABEL_28;
    case 8uLL:
      long long v11 = xmmword_1000598F0;
LABEL_28:
      *(_OWORD *)a2 = v11;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 1792;
      goto LABEL_53;
    case 9uLL:
    case 0xFuLL:
      long long v4 = xmmword_1000598F0;
      goto LABEL_9;
    case 0xAuLL:
    case 0x10uLL:
      long long v4 = xmmword_1000598E0;
LABEL_9:
      *(_OWORD *)a2 = v4;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2340;
      goto LABEL_53;
    case 0xBuLL:
    case 0x11uLL:
      long long v7 = xmmword_100059900;
      goto LABEL_12;
    case 0xCuLL:
    case 0x12uLL:
      long long v7 = xmmword_1000598E0;
LABEL_12:
      *(_OWORD *)a2 = v7;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2532;
      goto LABEL_53;
    case 0xDuLL:
    case 0x13uLL:
      long long v8 = xmmword_100059920;
      goto LABEL_15;
    case 0xEuLL:
    case 0x14uLL:
      long long v8 = xmmword_1000598F0;
LABEL_15:
      *(_OWORD *)a2 = v8;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2778;
      goto LABEL_53;
    case 0x15uLL:
      long long v12 = xmmword_100059930;
      goto LABEL_31;
    case 0x16uLL:
      long long v12 = xmmword_1000598E0;
LABEL_31:
      *(_OWORD *)a2 = v12;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2556;
      goto LABEL_53;
    case 0x17uLL:
      long long v13 = xmmword_100059940;
      goto LABEL_34;
    case 0x18uLL:
      long long v13 = xmmword_1000598F0;
LABEL_34:
      *(_OWORD *)a2 = v13;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2796;
      goto LABEL_53;
    case 0x19uLL:
      long long v14 = xmmword_100059950;
      goto LABEL_37;
    case 0x1AuLL:
      long long v14 = xmmword_1000598E0;
LABEL_37:
      *(_OWORD *)a2 = v14;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2622;
      goto LABEL_53;
    case 0x1BuLL:
      long long v15 = xmmword_100059960;
      goto LABEL_40;
    case 0x1CuLL:
      long long v15 = xmmword_1000598F0;
LABEL_40:
      *(_OWORD *)a2 = v15;
      uint64_t v5 = 0x4008000000000000;
      uint64_t v6 = 2868;
      goto LABEL_53;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x26uLL:
      *(_OWORD *)a2 = xmmword_100059970;
      *(void *)(a2 + 16) = 0x4000000000000000;
      return result;
    case 0x1FuLL:
      *(_OWORD *)a2 = xmmword_100059980;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2160;
      goto LABEL_53;
    case 0x20uLL:
      *(_OWORD *)a2 = xmmword_100059990;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2224;
      goto LABEL_53;
    case 0x21uLL:
    case 0x25uLL:
      *(_OWORD *)a2 = xmmword_1000599A0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2732;
      goto LABEL_53;
    case 0x22uLL:
      *(_OWORD *)a2 = xmmword_1000599B0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2266;
      goto LABEL_53;
    case 0x23uLL:
      *(_OWORD *)a2 = xmmword_1000599E0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2360;
      goto LABEL_53;
    case 0x24uLL:
      *(_OWORD *)a2 = xmmword_1000599F0;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2388;
      goto LABEL_53;
    case 0x27uLL:
      long long v16 = xmmword_100059A00;
      goto LABEL_48;
    case 0x28uLL:
      long long v16 = xmmword_100059A10;
LABEL_48:
      *(_OWORD *)a2 = v16;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2420;
      goto LABEL_53;
    case 0x29uLL:
      long long v17 = xmmword_100059A30;
      goto LABEL_52;
    case 0x2AuLL:
      long long v17 = xmmword_1000599D0;
      goto LABEL_52;
    case 0x2BuLL:
      long long v17 = xmmword_100059A40;
LABEL_52:
      *(_OWORD *)a2 = v17;
      uint64_t v5 = 0x4000000000000000;
      uint64_t v6 = 2752;
LABEL_53:
      *(void *)(a2 + 16) = v5;
      *(void *)(a2 + 24) = v6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t sub_100010B94(uint64_t a1, uint64_t a2)
{
  BOOL v3 = *(double *)(a1 + 16) == *(double *)(a2 + 16);
  if (*(double *)a1 != *(double *)a2) {
    BOOL v3 = 0;
  }
  uint64_t result = *(double *)(a1 + 8) == *(double *)(a2 + 8) && v3;
  uint64_t v5 = *(void *)(a1 + 24);
  if (v5)
  {
    uint64_t v6 = *(void *)(a2 + 24);
    if (v6) {
      BOOL v7 = v5 == v6;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      uint64_t result = result;
    }
    else {
      uint64_t result = 0;
    }
  }
  uint64_t v8 = *(void *)(a1 + 32);
  if (v8 != -1)
  {
    uint64_t v9 = *(void *)(a2 + 32);
    unsigned int v10 = ((v8 != 2) ^ (v9 == 2)) & result;
    if (v9 == -1) {
      return result;
    }
    else {
      return v10;
    }
  }
  return result;
}

void sub_100010C60(id a1)
{
  qword_10008FDD0 = objc_alloc_init(CBRemoteSetupManager);

  _objc_release_x1();
}

void sub_100011034(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011064(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleSetupEvent:v3];
}

id sub_1000111DC(uint64_t a1)
{
  return [*(id *)(a1 + 32) startRemoteSetupBroadcast];
}

id sub_100011E40(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Network is not reachable. Failing remote setup.", v4, 2u);
  }

  [*(id *)(a1 + 32) removeObserver:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 40) setupFailed];
}

void sub_1000132D4(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Wi-Fi network scan completed notification sent", v7, 2u);
  }

  id v3 = (id *)(a1 + 32);
  id v4 = objc_loadWeakRetained(v3);
  uint64_t v5 = [v4 wifiManager];
  [v4 enableContinueButton:[v5 isAssociatedToNetwork]];

  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained updateNetworkList];
}

void sub_100013B90(id a1, unint64_t a2)
{
  if (!a2) {
    +[CBSystem checkoutAndReboot:1 userInitiated:1];
  }
}

void sub_100013FF0(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) targetNetworkForBootIntent];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v3 = [*(id *)(a1 + 32) wifiManager];
  id v4 = [v3 filteredWiFiScanResults];

  id obj = v4;
  id v5 = [v4 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    id v27 = 0;
    uint64_t v7 = *(void *)v29;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v29 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        unsigned int v10 = [[CBNetworkListRecord alloc] initWithScanResult:v9];
        [*(id *)(a1 + 40) addObject:v10];
        long long v11 = [v9 networkName];
        long long v12 = [*(id *)(a1 + 32) wifiManager];
        long long v13 = [v12 currentNetworkSSID];
        unsigned int v14 = [v11 isEqualToString:v13];

        if (v14)
        {
          long long v15 = v10;

          id v27 = v15;
        }
        if (v2)
        {
          long long v16 = [v2 ssid];
          long long v17 = [(CBNetworkListRecord *)v10 ssid];
          unsigned int v18 = [v16 isEqualToString:v17];

          if (v18)
          {
            CGRect v19 = v10;

            [*(id *)(a1 + 32) setTargetNetworkForBootIntent:v19];
            uint64_t v2 = v19;
          }
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    id v27 = 0;
  }

  if (v2 && ([*(id *)(a1 + 40) containsObject:v2] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v2];
  }
  [*(id *)(a1 + 32) setNetworks:*(void *)(a1 + 40)];
  CGRect v20 = *(void **)(a1 + 32);
  if (v27)
  {
    id v21 = [v20 currentNetwork];

    if (v21 != v27)
    {
      [*(id *)(a1 + 32) setCurrentNetwork:v27];
      if ([*(id *)(a1 + 32) networkConnectionInProgress]) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 2;
      }
      uint64_t v23 = *(void **)(a1 + 32);
      goto LABEL_31;
    }
  }
  else
  {
    if (!v2)
    {
      [v20 setCurrentNetwork:0];
      uint64_t v23 = *(void **)(a1 + 32);
      uint64_t v22 = 0;
LABEL_31:
      [v23 setCurrentNetworkState:v22];
      goto LABEL_32;
    }
    uint64_t v24 = [v20 currentNetwork];

    if (v24 != v2)
    {
      [*(id *)(a1 + 32) setCurrentNetwork:v2];
      if ([*(id *)(a1 + 32) networkConnectionInProgress]) {
        uint64_t v25 = 1;
      }
      else {
        uint64_t v25 = 2;
      }
      [*(id *)(a1 + 32) setCurrentNetworkState:v25];
      [*(id *)(a1 + 32) enableContinueButton:1];
    }
  }
LABEL_32:
}

void sub_1000148C0(id a1)
{
  id v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Alternate Network View Controller presented", v2, 2u);
  }
}

void sub_1000160C4(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (v5)
  {
    id v6 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Language Location: Wifi scan failed with error %@", (uint8_t *)&v7, 0xCu);
    }

    [*(id *)(a1 + 32) _closeWifiConnection];
  }
  else
  {
    [*(id *)(a1 + 32) _scanComplete:a3];
  }
}

void sub_10001702C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017060(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100048DE4(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained mainNavigationController];
  id v5 = [v4 popToRootViewControllerAnimated:1];

  id v6 = [*(id *)(a1 + 32) localServiceClient];
  LODWORD(v4) = [v6 didMoveToEndgame];

  if (v4)
  {
    int v7 = [*(id *)(a1 + 32) localServiceClient];
    [v7 relaunchToDiagnosticsApp];
  }
}

void sub_10001711C(id a1)
{
  id v1 = +[CBWiFiManager sharedInstance];
  [v1 updateWiFiState];
}

void sub_1000182F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001831C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Status bar server dataAccessDomain updated with data %@", buf, 0xCu);
  }

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001845C;
  v6[3] = &unk_100079A40;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v8);
}

void sub_10001845C(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Status bar server dataAccessDomain updated with data %@", (uint8_t *)&v5, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _handleNewDomainData:*(void *)(a1 + 32)];
}

BOOL sub_100018818(id a1, CBSensorActivityAttribution *a2, BOOL *a3)
{
  uint64_t v3 = a2;
  if ([(CBSensorActivityAttribution *)v3 sensor]) {
    BOOL v4 = (id)[(CBSensorActivityAttribution *)v3 sensor] == (id)1;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

id sub_100018D04(id a1, STUIDataAccessAttribution *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [[CBSensorActivityAttribution alloc] initWithDataAccessAttribution:v2];

  return v3;
}

id sub_100018D5C(id a1, STUIDataAccessAttribution *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = [[CBSensorActivityAttribution alloc] initWithDataAccessAttribution:v2];

  return v3;
}

void sub_10001906C(id a1)
{
  qword_10008FDE8 = objc_alloc_init(CBAppManager);

  _objc_release_x1();
}

id sub_100019324(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addScene:a2];
}

void sub_100019458(uint64_t a1)
{
  uint64_t v2 = [[CBAppLaunch alloc] initWithBundleID:*(void *)(a1 + 32) backgrounded:*(unsigned __int8 *)(a1 + 56) native:*(unsigned __int8 *)(a1 + 57)];
  uint64_t v3 = [*(id *)(a1 + 40) openApps];
  [v3 addObject:v2];

  objc_initWeak(&location, v2);
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100019580;
  v4[3] = &unk_100079A40;
  v4[4] = *(void *)(a1 + 40);
  objc_copyWeak(&v5, &location);
  [(CBAppLaunch *)v2 setOnExit:v4];
  [(CBAppLaunch *)v2 setOnLaunch:*(void *)(a1 + 48)];
  [(CBAppLaunch *)v2 launch];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void sub_100019560(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100019580(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) openApps];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [v3 removeObject:WeakRetained];
}

void sub_10001981C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100019844(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Terminate event handler called", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  BOOL v4 = +[FBProcessManager sharedInstance];
  id v5 = [v4 applicationProcessesForBundleIdentifier:*(void *)(a1 + 32)];

  [WeakRetained _terminateApps:v5 reason:*(void *)(a1 + 64) reportCrash:*(unsigned __int8 *)(a1 + 72) description:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

uint64_t sub_100019D14(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void sub_100019D30(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019DB4;
  block[3] = &unk_1000794E0;
  id v2 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_100019DB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) signal];
}

void sub_10001A060(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) bundleIdentifier];
    int v10 = 138412290;
    long long v11 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Posting layout change for frontboard on behalf of %@", (uint8_t *)&v10, 0xCu);
  }
  id v4 = objc_alloc((Class)FBSDisplayLayoutElement);
  id v5 = [*(id *)(a1 + 32) bundleIdentifier];
  id v6 = [v4 initWithIdentifier:v5];

  id v7 = +[UIScreen mainScreen];
  [v7 bounds];
  [v6 setReferenceFrame:];

  [v6 setLevel:1];
  id v8 = +[FBMainDisplayLayoutPublisher sharedInstance];
  uint64_t v9 = [v8 addElement:v6];
  [*(id *)(a1 + 40) setLayoutElementInvalidator:v9];
}

id sub_10001A39C(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = [*(id *)(a1 + 32) bundleIdentifier];
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Invalidating layout change for frontboard on behalf of %@", (uint8_t *)&v6, 0xCu);
  }
  id v4 = [*(id *)(a1 + 40) layoutElementInvalidator];
  [v4 invalidate];

  return [*(id *)(a1 + 40) setLayoutElementInvalidator:0];
}

id sub_10001AAE0(uint64_t a1, void *a2)
{
  return [a2 setLevel:*(double *)(a1 + 32)];
}

void sub_10001ABDC(id a1, void *a2)
{
  id v2 = a2;
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Observing idle timer disabled state…", (uint8_t *)&v17, 2u);
  }

  id v4 = [v2 updatedClientSettings];
  id v5 = [v4 idleTimerDisabled];

  int v6 = [v2 settings];
  unsigned int v7 = [v6 isForeground];

  id v8 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v2 scene];
    int v10 = (void *)v9;
    long long v11 = "NO";
    if (v5) {
      long long v11 = "YES";
    }
    long long v12 = " (ignoring because isForeground is false)";
    int v17 = 138412802;
    uint64_t v18 = v9;
    CGRect v20 = v11;
    __int16 v19 = 2080;
    if (v7) {
      long long v12 = "";
    }
    __int16 v21 = 2080;
    uint64_t v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Scene %@ is setting idleTimerDisabled to: %s%s", (uint8_t *)&v17, 0x20u);
  }
  if (v7)
  {
    long long v13 = +[CBIdleSleepManager sharedInstance];
    unsigned int v14 = CheckerBoardLogHandleForCategory();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v15)
      {
        LOWORD(v17) = 0;
        long long v16 = "Disabling idle timer per app request";
LABEL_15:
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v17, 2u);
      }
    }
    else if (v15)
    {
      LOWORD(v17) = 0;
      long long v16 = "Enabling idle timer per app request";
      goto LABEL_15;
    }

    [v13 setIdleTimerDisabled:v5 forReason:@"AppRequest"];
  }
}

void sub_10001B3A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) bounds];
  [v3 setFrame:];
  [v3 setForeground:1];
  +[CBSceneManager windowLevel:1];
  [v3 setLevel:];
  [v3 setInterfaceOrientation:1];
  if ([v3 isUISubclass]) {
    [v3 setInterfaceOrientationMode:2];
  }
}

void sub_10001C5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,id *location)
{
}

id sub_10001C610(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if ([*(id *)(a1 + 32) passwordType] == 8)
    {
      int v6 = [*(id *)(a1 + 32) view];
      [v6 bounds];
      double v8 = v7;
      uint64_t v9 = [*(id *)(a1 + 32) headerView];
      [v9 bounds];
      double v11 = v8 - v10;
      long long v12 = [*(id *)(a1 + 32) buttonTray];
      [v12 bounds];
      double v14 = v11 - v13;

      BOOL v15 = [v4 heightAnchor];
      long long v16 = [v15 constraintEqualToConstant:(double)(uint64_t)v14];
      [WeakRetained setHeightConstraint:v16];
    }
    else
    {
      int v17 = [WeakRetained heightConstraint];
      [v17 setActive:0];

      [WeakRetained setHeightConstraint:0];
    }
  }
  uint64_t v18 = [WeakRetained heightConstraint];

  return v18;
}

id sub_10001C9C0(id a1)
{
  if ((unint64_t)a1 <= 2) {
    a1 = *(id *)*(&off_100079CA8 + (void)a1);
  }
  return a1;
}

BOOL sub_10001CA04(unint64_t a1)
{
  return a1 < 2;
}

void sub_10001CA64(id *a1)
{
  if (a1)
  {
    sub_10001C9C0(a1[1]);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v2 = objc_opt_class();
    id v3 = [a1 layer];
    id v4 = sub_10001CD3C(v2, v3);

    [v4 setPrivacyIndicatorType:v5];
  }
}

id sub_10001CD3C(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id sub_10001D2F4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _activityAttribution];
}

id sub_10001D5D4(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) displayName];
  id v4 = [v2 appendObject:v3 withName:@"displayName"];

  id v5 = *(void **)(a1 + 32);
  int v6 = [*(id *)(a1 + 40) bundleIdentifier];
  id v7 = [v5 appendObject:v6 withName:@"bundleIdentifier"];

  double v8 = *(void **)(a1 + 32);
  uint64_t v9 = [*(id *)(a1 + 40) website];
  id v10 = [v8 appendObject:v9 withName:@"website"];

  return [*(id *)(a1 + 32) appendBool:[*(id *)(a1 + 40) isSystemService] withName:@"isSystemService"];
}

void sub_10001D740(id a1)
{
  int v2 = 0;
  size_t v1 = 4;
  if (!sysctlbyname("kern.hv_vmm_present", &v2, &v1, 0, 0)) {
    byte_10008EF00 = v2 == 0;
  }
}

void sub_10001D82C(id a1)
{
  byte_10008FE00 = os_variant_has_internal_content();
}

void sub_10001F990(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 168));
  _Unwind_Resume(a1);
}

id sub_10001F9D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained view];
    [v7 frame];
    double v9 = v8;
    uint64_t v10 = [v6 headerView];
    [v10 frame];
    double v12 = v9 - v11 + -120.0;

    double v13 = [v4 heightAnchor];
    double v14 = [v13 constraintEqualToConstant:(double)(uint64_t)v12];
    [v6 setHeightConstraint:v14];
  }
  BOOL v15 = [v6 heightConstraint];

  return v15;
}

void sub_10002019C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 136));
  _Unwind_Resume(a1);
}

id sub_1000201D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = [WeakRetained heightConstraint];
    [v3 setActive:0];

    [v2 setHeightConstraint:0];
  }
  id v4 = [v2 heightConstraint];

  return v4;
}

FBProcessExecutionContext *__cdecl sub_100020694(id a1)
{
  id v1 = objc_alloc_init((Class)FBMutableProcessExecutionContext);
  [v1 setLaunchIntent:4];

  return (FBProcessExecutionContext *)v1;
}

void sub_1000206DC(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Transaction completed, success: %d", (uint8_t *)v4, 8u);
  }
}

void sub_100020888(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) windowRepresentation];
  [v2 dismissViewControllerAnimated:1];

  id v3 = [*(id *)(a1 + 32) onExit];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) onExit];
    v4[2]();
  }
}

void sub_100020CA0(id a1, NSError *a2)
{
  BOOL v2 = a2;
  id v3 = CheckerBoardLogHandleForCategory();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100048FD4((uint64_t)v2, v4);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Launched Diagnostics", v5, 2u);
  }
}

void sub_100020D8C(id a1)
{
  uint64_t v1 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBLocalServiceClientInterface];
  BOOL v2 = (void *)qword_10008FE20;
  qword_10008FE20 = v1;

  id v3 = (void *)qword_10008FE20;
  id v4 = +[NSSet setWithObject:objc_opt_class()];
  [v3 setClasses:v4 forSelector:"setProxyServer:completion:" argumentIndex:0 ofReply:0];
}

void sub_100020E88(id a1)
{
  qword_10008FE30 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___CBLocalServiceServerInterface];

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  +[CBApplication disableS2R];
  id v5 = (id)FBSystemShellInitialize();
  int v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  id v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  double v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  double v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = UIApplicationMain(a1, a2, v7, v9);

  return v10;
}

void sub_100020F84(id a1, FBMutableSystemShellInitializationOptions *a2)
{
  BOOL v2 = a2;
  [(FBMutableSystemShellInitializationOptions *)v2 setShouldWaitForMigrator:0];
  [(FBMutableSystemShellInitializationOptions *)v2 setRegisterAdditionalServicesBlock:&stru_100079E98];
}

void sub_100020FD4(id a1)
{
}

void sub_100021034(id a1)
{
  qword_10008FE38 = objc_alloc_init(CBAPTicket);

  _objc_release_x1();
}

id sub_1000220E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _dataProviderDidUpdate:*(void *)(a1 + 40)];
}

void sub_100022454(id a1)
{
  byte_10008FE50 = MGGetBoolAnswer();
}

void sub_100023510(id a1)
{
  qword_10008FE58 = objc_alloc_init(CBIdleSleepManager);

  _objc_release_x1();
}

void sub_100023700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100023720(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v5 = [v3 eventMask];
  int v6 = CheckerBoardLogHandleForCategory();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Dimming for idle", (uint8_t *)&v8, 2u);
    }

    [WeakRetained dimDisplay];
  }
  else
  {
    if (v7)
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[CBIdleSleepManager] Reset idle for event %@", (uint8_t *)&v8, 0xCu);
    }

    [WeakRetained resetIdleTimerAndUndim:1];
  }
}

id sub_10002455C(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _[a1 _powerChangedOnService:a2 messageType:a3 messageArgument:a4];
}

void sub_100024E98(id a1)
{
  uint64_t v1 = +[UIKeyboard activeKeyboard];
  if (v1)
  {
    BOOL v2 = v1;
    if (([v1 isMinimized] & 1) == 0) {
      [v2 setMinimized:1];
    }
  }

  _objc_release_x1();
}

void sub_100024FAC(id a1)
{
  id v1 = +[UIKeyboard activeKeyboard];
  if (v1) {
    [v1 setMinimized:[UIKeyboard isInHardwareKeyboardMode]];
  }
}

void sub_1000250DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10002514C(id a1)
{
  qword_10008FE80 = [[CBAlertManager alloc] _init];

  _objc_release_x1();
}

uint64_t sub_10002583C(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggered [Exit Diagnostics].", v4, 2u);
  }

  [*(id *)(a1 + 32) setAlertVisible:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000258CC(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggered [Wi-Fi Settings].", v4, 2u);
  }

  [*(id *)(a1 + 32) setAlertVisible:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_10002595C(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggered [Shut Down].", v4, 2u);
  }

  [*(id *)(a1 + 32) setAlertVisible:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000259EC(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggered [Debug Info].", v4, 2u);
  }

  [*(id *)(a1 + 32) setAlertVisible:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100025A7C(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Triggered [Cancel].", v4, 2u);
  }

  [*(id *)(a1 + 32) setAlertVisible:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100025B0C(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Menu sheet presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_100025F20(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlertVisible:0];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t sub_100025F6C(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlertVisible:0];
  BOOL v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t sub_100025FB8(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "CheckerBoard confirmation alert presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_100026214(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Wi-Fi picker presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_1000264A8(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Thermal warning UI presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_100026720(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Power Down UI presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

uint64_t sub_100026974(uint64_t a1)
{
  BOOL v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Debug info presented.", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

void sub_1000271E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

uint64_t sub_1000271FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = [WeakRetained window];
  [v3 viewControllerDidDismiss];

  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    unsigned __int8 v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_100027578(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002759C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setPresentedView:0];
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = WeakRetained;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Dismissed view controller on %@", (uint8_t *)&v4, 0xCu);
  }

  id v3 = [WeakRetained windowManager];
  [v3 windowDidDismiss:WeakRetained];
}

void sub_100027990(id a1)
{
  id v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Local XPC - _connection.interruptionHandler", v2, 2u);
  }
}

void sub_1000279FC(id a1)
{
  id v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Local XPC - _connection.invalidationHandler", v2, 2u);
  }
}

void sub_100027B90(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Local XPC - Can't get remote proxy object %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100027C40(id a1)
{
  id v1 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Local XPC - ping pong", v2, 2u);
  }
}

void sub_100027CF0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  if (v2)
  {
    id v3 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Relaunch Diagnostics app again. error = %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void sub_100027F9C(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Local XPC - moveToDiagnosticsApp: move to endgame.", v5, 2u);
  }

  id v3 = objc_alloc_init(CBEndgameViewController);
  int v4 = [*(id *)(a1 + 32) mainNavController];
  [v4 pushViewController:v3 animated:1];

  [*(id *)(a1 + 32) setDidMoveToEndgame:1];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100028394(id a1)
{
  if (+[CBUtilities isRunningOnPhysicalHardware])
  {
    qword_10008FE90 = objc_alloc_init(CBWiFiManager);
    _objc_release_x1();
  }
  else
  {
    id v1 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
      sub_100049470();
    }
  }
}

void sub_1000289B4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1000289E8(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleCWInterfaceEvent:v3];
}

void sub_100028A44(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "cwInterface was invalidated. Recreating", v6, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = objc_alloc_init((Class)CWFInterface);
  [WeakRetained setCwInterface:v4];

  id v5 = [WeakRetained cwInterface];
  [v5 activate];

  [WeakRetained _registerWiFiNotifications];
}

void sub_100029438(uint64_t a1)
{
  [*(id *)(a1 + 32) _attemptReconnect];
  uint64_t v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_attemptReconnect" selector:0 userInfo:1 repeats:8.0];
  [*(id *)(a1 + 32) setReconnectTimer:v2];

  id v3 = +[NSRunLoop currentRunLoop];
  id v4 = [*(id *)(a1 + 32) reconnectTimer];
  [v3 addTimer:v4 forMode:NSRunLoopCommonModes];

  id v5 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reconnect scheduled", v6, 2u);
  }
}

int64_t sub_1000296D8(id a1, CWFScanResult *a2, CWFScanResult *a3)
{
  id v4 = a3;
  id v5 = [(CWFScanResult *)a2 networkName];
  int v6 = [(CWFScanResult *)v4 networkName];

  id v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return (int64_t)v7;
}

void sub_100029DE4(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = [WeakRetained networkScanSemaphore];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);

  id v7 = [*(id *)(a1 + 32) cwInterface];

  int v8 = CheckerBoardLogHandleForCategory();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (!v7 || v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unfortunately, we do not have a Wi-Fi device available for network scan… Let's try again", buf, 2u);
    }

    [*(id *)(a1 + 32) _restartWiFiNetworkScan];
  }
  else
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Device is available for network scan", buf, 2u);
    }

    uint64_t v10 = [*(id *)(a1 + 32) scanParametersWithSSID:0 isHidden:0];
    double v11 = [*(id *)(a1 + 32) cwInterface];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100029FB4;
    v12[3] = &unk_10007A1E0;
    objc_copyWeak(&v13, v2);
    [v11 performScanWithParameters:v10 reply:v12];

    objc_destroyWeak(&v13);
  }
}

void sub_100029FA0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100029FB4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained(v7);
  BOOL v9 = [WeakRetained networkScanSemaphore];
  dispatch_semaphore_signal(v9);

  if (v5)
  {
    uint64_t v10 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1000494E4();
    }

    id v11 = objc_loadWeakRetained(v7);
    [v11 _restartWiFiNetworkScan];
  }
  else
  {
    id v11 = objc_loadWeakRetained(v7);
    [v11 _wifiScanCompleted:v6];
  }
}

void sub_10002A6A0(uint64_t a1)
{
  id v2 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_startWiFiNetworkScan" selector:0 userInfo:0 repeats:*(double *)(a1 + 40)];
  [*(id *)(a1 + 32) setScanTimer:v2];
}

void sub_10002AB38(uint64_t a1)
{
  id v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained networkScanSemaphore];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);

  id v7 = [*(id *)(a1 + 32) cwInterface];

  if (!v7 || v6)
  {
    id v11 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      double v12 = [*(id *)(a1 + 32) cwInterface];
      *(_DWORD *)buf = 138412546;
      uint64_t v25 = v12;
      __int16 v26 = 2048;
      intptr_t v27 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping scan: %@ + semaphore result: %li", buf, 0x16u);
    }
    int v8 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"Wifi", [&off_10007CDC8 integerValue], 0);
    BOOL v13 = *(unsigned char *)(a1 + 64) == 0;
    double v14 = +[NSNotificationCenter defaultCenter];
    if (v13)
    {
      CFStringRef v20 = @"CBWiFiManagerErrorKey";
      __int16 v21 = v8;
      BOOL v15 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      [v14 postNotificationName:@"CBWiFiManagerDidAssociateToEncryptedNetworkNotification" object:0 userInfo:v15];
    }
    else
    {
      CFStringRef v22 = @"CBWiFiManagerErrorKey";
      uint64_t v23 = v8;
      BOOL v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      [v14 postNotificationName:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0 userInfo:v15];
    }
  }
  else
  {
    int v8 = [*(id *)(a1 + 32) scanParametersWithSSID:*(void *)(a1 + 40) isHidden:*(unsigned __int8 *)(a1 + 64)];
    id v9 = objc_loadWeakRetained(v2);
    uint64_t v10 = [v9 cwInterface];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10002AE44;
    v16[3] = &unk_10007A230;
    objc_copyWeak(&v18, v2);
    id v17 = *(id *)(a1 + 48);
    char v19 = *(unsigned char *)(a1 + 64);
    [v10 performScanWithParameters:v8 reply:v16];

    objc_destroyWeak(&v18);
  }
}

void sub_10002AE28(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10002AE44(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = (id *)(a1 + 40);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained networkScanSemaphore];
  dispatch_semaphore_signal(v7);

  id v8 = objc_loadWeakRetained(v4);
  [v8 updateWiFiState];

  id v9 = +[NSMutableArray arrayWithArray:v5];

  uint64_t v10 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    id v22 = [v9 count];
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "There are %lu directed scan results", buf, 0xCu);
  }

  if ([v9 count])
  {
    id v11 = [v9 count];
    double v12 = CheckerBoardLogHandleForCategory();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v11 == (id)1)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        double v14 = "Attempting to associate to that one";
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v14, buf, 2u);
      }
    }
    else if (v13)
    {
      *(_WORD *)buf = 0;
      double v14 = "Attempting to associate to the first scan result";
      goto LABEL_10;
    }

    long long v16 = [v9 objectAtIndexedSubscript:0];
    id v17 = objc_loadWeakRetained(v4);
    [v17 _associateToEncryptedNetworkWithScanResult:v16 password:*(void *)(a1 + 32) isHidden:*(unsigned __int8 *)(a1 + 48)];
    goto LABEL_12;
  }
  id v15 = objc_loadWeakRetained(v4);
  [v15 updateWiFiState];

  long long v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"Wifi", [&off_10007CDC8 integerValue], 0);
  id v17 = +[NSNotificationCenter defaultCenter];
  CFStringRef v19 = @"CBWiFiManagerErrorKey";
  CFStringRef v20 = v16;
  id v18 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
  [v17 postNotificationName:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0 userInfo:v18];

LABEL_12:
}

void sub_10002B480(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002B4A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100049580();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postDidAssociateToEncryptedNetworkNotificationWithError:v3];
}

void sub_10002B684(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002B6A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000495E8();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postDidAssociateToOpenNetworkNotificationWithError:v3];
}

void sub_10002B888(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002B8AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100049650();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _postDidAssociateToOpenNetworkNotificationWithError:v3];
}

void sub_10002C0C4(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"CBWiFiSignalStrengthChangedNotification" object:0 userInfo:0];
}

void sub_10002C1FC(uint64_t a1)
{
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [v4 setObject:v2 forKeyedSubscript:@"CBWiFiManagerErrorKey"];
  }
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CBWiFiManagerDidAssociateToEncryptedNetworkNotification" object:0 userInfo:v4];
}

void sub_10002C370(uint64_t a1)
{
  id v4 = +[NSMutableDictionary dictionary];
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    [v4 setObject:v2 forKeyedSubscript:@"CBWiFiManagerErrorKey"];
  }
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"CBWiFiManagerDidAssociateToOpenNetworkNotification" object:0 userInfo:v4];
}

void sub_10002C990(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBarView];
  [v1 setHidden:0];
}

void sub_10002CAA0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) statusBarView];
  [v1 setHidden:1];
}

void sub_10002CBF4(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) statusBarView];
  uint64_t v2 = [v3 statusBar];
  [v2 setStyle:[*(id *)(a1 + 32) _statusBarStyle:*(void *)(a1 + 40)]];
}

void sub_10002CDAC(id a1)
{
  qword_10008FEA0 = objc_alloc_init(CBSceneManager);

  _objc_release_x1();
}

void sub_10002D364(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = +[FBDisplayManager mainConfiguration];
  [v5 setDisplayConfiguration:v3];

  id v4 = +[UIScreen mainScreen];
  [v4 _referenceBounds];
  [v5 setFrame:];

  [v5 setLevel:*(double *)(a1 + 32)];
  [v5 setForeground:1];
  [v5 setInterfaceOrientation:1];
  if ([v5 isUISubclass]) {
    [v5 setDeviceOrientationEventsEnabled:1];
  }
}

void sub_10002D42C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isUISubclass])
  {
    id v3 = [*(id *)(a1 + 32) settings];
    [v4 setInterfaceOrientation:[v3 interfaceOrientation]];

    [v4 setStatusBarStyle:0];
  }
}

void sub_10002DAA0(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v1 = [*(id *)(a1 + 32) allKeys];
  id v2 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v9;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v1);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * (void)v5);
        id v7 = +[FBSceneManager sharedInstance];
        [v7 destroyScene:v6 withTransitionContext:0];

        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v3);
  }
}

void sub_10002DE1C(id a1)
{
  qword_10008FEB0 = objc_alloc_init(CBWindowManager);

  _objc_release_x1();
}

uint64_t sub_10002E47C(uint64_t a1)
{
  id v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Presented", v5, 2u);
  }

  id v3 = [*(id *)(a1 + 32) windowManager];
  [v3 windowDidAppear:*(void *)(a1 + 32)];

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10002E614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_10002ED04(id a1)
{
  qword_10008FEC0 = objc_alloc_init(CBShellServer);

  _objc_release_x1();
}

void sub_10002EFA8(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) systemServicesDelegate];
  [v2 exitRequestedWithServer:*(void *)(a1 + 32)];
}

void sub_10002F448(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained systemServicesDelegate];
  [v1 launchDiagnostics];
}

void sub_10002FF24(id a1)
{
  id v1 = objc_alloc((Class)UISMutableDisplayContext);
  id v2 = +[FBDisplayManager sharedInstance];
  id v3 = [v2 mainConfiguration];
  id v19 = [v1 initWithDisplayConfiguration:v3];

  unint64_t v4 = sub_100038930();
  id v5 = +[FBDisplayManager sharedInstance];
  uint64_t v6 = [v5 mainConfiguration];
  [v19 setDisplayConfiguration:v6];

  id v7 = sub_100039634(v4);
  [v19 setDisplayEdgeInfo:v7];

  long long v8 = sub_1000399D0(v4);
  [v19 setExclusionArea:v8];

  [v19 setArtworkSubtype:sub_100038A34()];
  long long v9 = +[UIUserInterfaceStyleArbiter sharedInstance];
  long long v10 = v9;
  if (v9) {
    [v19 setUserInterfaceStyle:[v9 currentStyle]];
  }
  id v11 = [objc_alloc((Class)UISMutableDeviceContext) initWithDeviceInfoValues:&__NSDictionary0__struct];
  double v12 = +[BSPlatform sharedInstance];
  BOOL v13 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v12 deviceClass]);
  [v11 setDeviceInfoValue:v13 forKey:UISDeviceContextDeviceClassKey];

  double v14 = +[BSPlatform sharedInstance];
  id v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v14 homeButtonType]);
  [v11 setDeviceInfoValue:v15 forKey:UISDeviceContextHomeButtonTypeKey];

  MGGetFloat32Answer();
  long long v16 = +[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:");
  [v11 setDeviceInfoValue:v16 forKey:UISDeviceContextDeviceCornerRadiusKey];

  id v17 = [objc_alloc((Class)UISApplicationInitializationContext) initWithDisplayContext:v19 deviceContext:v11 persistedSceneIdentifiers:0 supportAppSceneRequests:1];
  id v18 = (void *)qword_10008FED0;
  qword_10008FED0 = (uint64_t)v17;
}

void sub_1000306DC(id a1)
{
  id v1 = +[NSBundle mainBundle];
  id v2 = [v1 bundleIdentifier];
  id v3 = +[LSApplicationProxy applicationProxyForIdentifier:v2];

  queue = dispatch_queue_create("com.apple.checkerboard.initializationContext", 0);
  unint64_t v4 = objc_alloc_init(_CBApplicationSupportServiceDelegate);
  id v5 = (void *)qword_10008FEE8;
  qword_10008FEE8 = (uint64_t)v4;

  id v6 = objc_alloc((Class)UISApplicationSupportService);
  id v7 = +[FBSSerialQueue queueWithDispatchQueue:queue];
  id v8 = [v6 initWithCalloutQueue:v7];
  long long v9 = (void *)qword_10008FEE0;
  qword_10008FEE0 = (uint64_t)v8;

  dispatch_sync(queue, &stru_10007A388);
}

void sub_1000307E8(id a1)
{
}

void sub_1000313C8(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case 0:
      id v3 = +[CBAlertManager sharedInstance];
      [v3 showExitConfirmationWithCompletion:0 response:&stru_10007A3A8];
      goto LABEL_8;
    case 1:
      id v3 = +[CBAlertManager sharedInstance];
      [v3 showWiFiPickerWithCompletion:0];
      goto LABEL_8;
    case 2:
      id v2 = *(void **)(a1 + 32);
      [v2 _showPowerDownView];
      return;
    case 3:
      id v3 = +[CBAlertManager sharedInstance];
      [v3 showDebugInfoWithCompletion:0];
LABEL_8:

      break;
    default:
      return;
  }
}

void sub_1000314C4(id a1, unint64_t a2)
{
  if (!a2) {
    +[CBSystem checkoutAndReboot:1 userInitiated:1];
  }
}

void sub_10003199C(id a1, unint64_t a2)
{
  if (!a2)
  {
    uint64_t v6 = v2;
    uint64_t v7 = v3;
    unint64_t v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Shutting down device…", v5, 2u);
    }

    +[CBSystem checkoutAndReboot:0 userInitiated:1];
  }
}

void sub_10003234C(id a1, FBSMutableSceneSettings *a2)
{
  unint64_t v4 = a2;
  uint64_t v2 = +[FBDisplayManager mainConfiguration];
  [(FBSMutableSceneSettings *)v4 setDisplayConfiguration:v2];

  uint64_t v3 = +[UIScreen mainScreen];
  [v3 _referenceBounds];
  -[FBSMutableSceneSettings setFrame:](v4, "setFrame:");

  [(FBSMutableSceneSettings *)v4 setLevel:0.0];
  [(FBSMutableSceneSettings *)v4 setForeground:1];
  [(FBSMutableSceneSettings *)v4 setInterfaceOrientation:1];
  if ([(FBSMutableSceneSettings *)v4 isUISubclass]) {
    [(FBSMutableSceneSettings *)v4 setDeviceOrientationEventsEnabled:1];
  }
}

void sub_100032410(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isUISubclass])
  {
    uint64_t v3 = [*(id *)(a1 + 32) settings];
    [v4 setInterfaceOrientation:[v3 interfaceOrientation]];

    [v4 setStatusBarStyle:0];
  }
}

void sub_1000325CC(uint64_t a1)
{
  int v1 = *(unsigned __int8 *)(a1 + 32);
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Restarting immediately due to kIOPMPSAtCriticalLevelKey battery notification", buf, 2u);
    }
    uint64_t v4 = 1;
  }
  else
  {
    if (v3)
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Shutting down immediately due to kIOPMPSAtCriticalLevelKey battery notification", v6, 2u);
    }
    uint64_t v4 = 0;
  }

  id v5 = +[FBSystemService sharedInstance];
  [v5 shutdownWithOptions:v4 forSource:0];
}

void sub_100032C80(uint64_t a1)
{
  id v3 = [objc_alloc((Class)FBSShutdownOptions) initWithReason:@"Rebooting for Diagnostics"];
  if (*(unsigned char *)(a1 + 32)) {
    [v3 setRebootType:1];
  }
  uint64_t v2 = +[FBSSystemService sharedService];
  [v2 shutdownWithOptions:v3];
}

uint64_t sub_100032D0C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100032E38(uint64_t a1)
{
  if ([*(id *)(a1 + 32) checkedInWiFiSettings])
  {
    uint64_t v2 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting Wi-Fi settings", v4, 2u);
    }

    id v3 = +[CBWiFiManager sharedInstance];
    [v3 setPowered:[*(id *)(a1 + 32) wifiPowerStateOn]];
  }
}

void sub_100033934(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose((const void *)(v34 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100033980(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100033990(uint64_t a1)
{
}

void sub_100033998(void *a1, void *a2)
{
  id v3 = [a2 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"CBWiFiManagerErrorKey"];

  if (v4) {
    BOOL v5 = [v4 code] == 0;
  }
  else {
    BOOL v5 = 1;
  }
  uint64_t v6 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 67109120;
    v11[1] = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Network association for CBSystem completed with success: %d", (uint8_t *)v11, 8u);
  }

  (*(void (**)(void))(a1[5] + 16))();
  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:*(void *)(*(void *)(a1[6] + 8) + 40)];

  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:*(void *)(*(void *)(a1[7] + 8) + 40)];

  long long v9 = +[CBStatusBarStateAggregator sharedInstance];
  [v9 updateStatusBarItem:9];

  long long v10 = +[CBWiFiManager sharedInstance];
  [v10 stopWiFiNetworkScanRequestFrom:a1[4]];
}

void sub_100033B34(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem completed as part of association", buf, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];

  uint64_t v4 = +[CBWiFiManager sharedInstance];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 stopWiFiNetworkScanRequestFrom:WeakRetained];

  uint64_t v6 = +[CBWiFiManager sharedInstance];
  uint64_t v7 = [v6 filteredWiFiScanResults];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v8);
        }
        double v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        BOOL v13 = [v12 networkName:v22];
        unsigned int v14 = [v13 isEqualToString:*(void *)(a1 + 32)];

        if (v14)
        {
          id v9 = v12;
          id v15 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem found a network matching the association request.", buf, 2u);
          }

          goto LABEL_15;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v22 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_15:

  long long v16 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v17 = *(void *)(a1 + 40) != 0;
    *(_DWORD *)buf = 67109376;
    BOOL v27 = v9 != 0;
    __int16 v28 = 1024;
    BOOL v29 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Network scan for CBSystem complete - associating to network. In scan results: %d, has password: %d", buf, 0xEu);
  }

  if (v9)
  {
    id v18 = +[CBWiFiManager sharedInstance];
    [v18 associateToEncryptedNetworkWithScanResult:v9 password:*(void *)(a1 + 40)];
  }
  else
  {
    uint64_t v19 = *(void *)(a1 + 40);
    CFStringRef v20 = +[CBWiFiManager sharedInstance];
    id v18 = v20;
    uint64_t v21 = *(void *)(a1 + 32);
    if (v19) {
      [v20 associateToHiddenEncryptedNetworkWithName:v21 password:*(void *)(a1 + 40)];
    }
    else {
      [v20 associateToHiddenUnencryptedNetworkWithName:v21];
    }
  }
}

void sub_100034038(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_100034064(uint64_t a1)
{
  uint64_t v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Network scan completed for CBSystem network scan (without association)", buf, 2u);
  }

  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

  uint64_t v4 = +[CBWiFiManager sharedInstance];
  uint64_t v20 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v4 stopWiFiNetworkScanRequestFrom:WeakRetained];

  uint64_t v6 = +[CBWiFiManager sharedInstance];
  uint64_t v7 = [v6 filteredWiFiScanResults];

  id v8 = objc_alloc_init((Class)NSMutableArray);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v7;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        BOOL v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        unsigned int v14 = [v13 networkName];
        id v15 = [v13 requiresPassword];
        v27[1] = @"protected";
        v28[0] = v14;
        v27[0] = @"ssid";
        long long v16 = +[NSNumber numberWithBool:v15];
        v28[1] = v16;
        BOOL v17 = +[NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:2];
        [v8 addObject:v17];
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v29 count:16];
    }
    while (v10);
  }

  uint64_t v18 = *(void *)(v20 + 32);
  id v19 = [v8 copy];
  (*(void (**)(uint64_t, id))(v18 + 16))(v18, v19);
}

uint64_t sub_1000345F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100035C38(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentlyActiveTextField];
  id v3 = [v2 textInputTraits];

  if ([v3 returnKeyType] != (id)3)
  {
    BOOL v5 = [*(id *)(a1 + 32) currentlyActiveTextField];

    if (!v5) {
      goto LABEL_14;
    }
    uint64_t v6 = [*(id *)(a1 + 32) currentlyActiveTextField];
    uint64_t v7 = [*(id *)(a1 + 32) networkNameCell];
    id v8 = [v7 textField];

    id v9 = *(void **)(a1 + 32);
    if (v6 == v8)
    {
      BOOL v17 = [v9 scanResult];
      unsigned int v18 = [v17 requiresPassword];

      if (!v18)
      {
LABEL_12:
        uint64_t v20 = *(char **)(a1 + 32);
        uint64_t v21 = *(void **)&v20[OBJC_IVAR___PSListController__table];
        long long v22 = [v20 indexPathForIndex:[v20 indexToSelect]];
        long long v23 = [v21 cellForRowAtIndexPath:v22];
        [v23 becomeFirstResponder];

        goto LABEL_13;
      }
      BOOL v13 = *(void **)(a1 + 32);
      unsigned int v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v16 = @"PASSWORD";
    }
    else
    {
      id v10 = [v9 currentlyActiveTextField];
      uint64_t v11 = [*(id *)(a1 + 32) passwordCell];
      double v12 = [v11 textField];

      if (v10 != v12)
      {
LABEL_13:
        [*(id *)(a1 + 32) setCurrentlyActiveTextField:0];
        goto LABEL_14;
      }
      BOOL v13 = *(void **)(a1 + 32);
      unsigned int v14 = +[NSBundle mainBundle];
      id v15 = v14;
      CFStringRef v16 = @"OTHER_NETWORK_NAME";
    }
    id v19 = [v14 localizedStringForKey:v16 value:&stru_10007A9F8 table:0];
    [*(id *)(a1 + 32) setIndexToSelect:[v13 indexOfSpecifierID:v19]];

    goto LABEL_12;
  }
  uint64_t v4 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v24 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[Return] key is [Join]", v24, 2u);
  }

  [*(id *)(a1 + 32) joinTapped:0];
LABEL_14:
}

void sub_100035F20(uint64_t a1)
{
  if ([*(id *)(a1 + 32) joining])
  {
    [*(id *)(a1 + 32) setJoining:0];
    uint64_t v2 = [*(id *)(a1 + 40) userInfo];
    id v3 = [v2 objectForKeyedSubscript:@"CBWiFiManagerErrorKey"];
    uint64_t v4 = CheckerBoardLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Wi-Fi network did associate to [un]encrypted network notification sent with error (%@)", buf, 0xCu);
    }

    BOOL v5 = CheckerBoardLogHandleForCategory();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 138412290;
        v52 = v3;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Association error: %@", buf, 0xCu);
      }

      id v7 = [v3 code];
      if ((unint64_t)v7 + 102 >= 3 && (unint64_t)v7 + 3925 >= 2)
      {
        if (v7 == (id)16)
        {
          id v32 = CheckerBoardLogHandleForCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            sub_100049768(v32, v33, v34, v35, v36, v37, v38, v39);
          }

          v40 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 32) target:"_networkJoinRetryTimerFired:" selector:0 userInfo:0 repeats:1.0];
          [*(id *)(a1 + 32) setJoinTimer:v40];
        }
        else
        {
          v41 = +[NSBundle mainBundle];
          v42 = [v41 localizedStringForKey:@"FAILED_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
          v43 = [*(id *)(a1 + 32) networkName];
          v44 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v42, v43);
          v45 = [*(id *)(a1 + 32) navigationItem];
          [v45 setPrompt:v44];

          [*(id *)(a1 + 32) _enableUI:1];
          v46 = *(void **)(a1 + 32);
          v47 = +[NSBundle mainBundle];
          v48 = [v47 localizedStringForKey:@"COULD_NOT_FIND_NETWORK_TITLE" value:&stru_10007A9F8 table:0];
          v49 = [*(id *)(a1 + 32) networkName];
          v50 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, v49);
          [v46 _presentFailedAssociationAlertWithTitle:v50 message:0];
        }
      }
      else
      {
        id v9 = CheckerBoardLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_100049730(v9, v10, v11, v12, v13, v14, v15, v16);
        }

        BOOL v17 = +[NSBundle mainBundle];
        unsigned int v18 = [v17 localizedStringForKey:@"FAILED_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
        id v19 = [*(id *)(a1 + 32) networkName];
        uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);
        uint64_t v21 = [*(id *)(a1 + 32) navigationItem];
        [v21 setPrompt:v20];

        [*(id *)(a1 + 32) _enableUI:1];
        long long v22 = *(void **)(a1 + 32);
        long long v23 = +[NSBundle mainBundle];
        long long v24 = [v23 localizedStringForKey:@"INCORRECT_PASSWORD_TITLE" value:&stru_10007A9F8 table:0];
        long long v25 = [*(id *)(a1 + 32) networkName];
        __int16 v26 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v24, v25);
        [v22 _presentFailedAssociationAlertWithTitle:v26 message:0];
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "No association error", buf, 2u);
      }

      BOOL v27 = +[NSBundle mainBundle];
      __int16 v28 = [v27 localizedStringForKey:@"JOINED_NETWORK_PROMPT" value:&stru_10007A9F8 table:0];
      BOOL v29 = [*(id *)(a1 + 32) networkName];
      long long v30 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v28, v29);
      long long v31 = [*(id *)(a1 + 32) navigationItem];
      [v31 setPrompt:v30];

      [*(id *)(a1 + 32) _enableUI:0];
      [*(id *)(a1 + 32) _checkoutAndPostAssociationCompletedNotificationWithError:0];
    }
  }
}

double sub_100038890()
{
  v0 = sub_10003907C();
  [v0 bounds];
  double v2 = v1;

  return v2;
}

double sub_1000388F0()
{
  v0 = sub_10003907C();
  [v0 scale];
  double v2 = v1;

  return v2;
}

uint64_t sub_100038930()
{
  if (qword_10008FEF8 != -1) {
    dispatch_once(&qword_10008FEF8, &stru_10007A4E8);
  }
  return qword_10008FF00;
}

void sub_100038974(id a1)
{
  double v1 = sub_100038890();
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v8 = sub_1000388F0();
  if (qword_10008FF10 != -1) {
    dispatch_once(&qword_10008FF10, &stru_10007A570);
  }
  uint64_t v9 = qword_10008FF08;
  unsigned int v10 = sub_100038EC8();
  id v11 = sub_100038F08();
  qword_10008FF00 = sub_100038AA4(v10, (uint64_t)v11, v9, &stru_10007A528, v1, v3, v5, v7, v8);
}

uint64_t sub_100038A34()
{
  if (qword_10008FF10 != -1) {
    dispatch_once(&qword_10008FF10, &stru_10007A570);
  }
  return qword_10008FF08;
}

BOOL sub_100038A78(id a1)
{
  return MGGetSInt32Answer() == 7;
}

uint64_t sub_100038AA4(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, double a5, double a6, double a7, double a8, double a9)
{
  uint64_t v15 = a4;
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v25 = 0;
  __int16 v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100038F48;
  v24[3] = &unk_10007A550;
  *(double *)&v24[6] = a7;
  *(double *)&v24[7] = a8;
  *(double *)&v24[8] = a9;
  v24[9] = a3;
  v24[10] = a2;
  v24[4] = &v29;
  v24[5] = &v25;
  sub_1000106A8((uint64_t)v24);
  if (!*((unsigned char *)v26 + 24))
  {
    if (a1 == 2)
    {
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 37;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 36;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 35;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 39;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 41;
        }
        else
        {
          int v20 = BSSizeGreaterThanOrEqualToSize();
          uint64_t v16 = v30;
          if (v20) {
            uint64_t v17 = 38;
          }
          else {
            uint64_t v17 = 34;
          }
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        uint64_t v16 = v30;
        uint64_t v17 = 33;
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        uint64_t v16 = v30;
        uint64_t v17 = 32;
      }
      else
      {
        int v19 = BSSizeGreaterThanOrEqualToSize();
        uint64_t v16 = v30;
        if (v19) {
          uint64_t v17 = 31;
        }
        else {
          uint64_t v17 = 29;
        }
      }
    }
    else
    {
      if (a1 > 1) {
        goto LABEL_49;
      }
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 13;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 5;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 11;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 3;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 21;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 23;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          uint64_t v16 = v30;
          uint64_t v17 = 25;
        }
        else
        {
          int v21 = BSSizeGreaterThanOrEqualToSize();
          uint64_t v16 = v30;
          if (v21) {
            uint64_t v17 = 27;
          }
          else {
            uint64_t v17 = 4;
          }
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        uint64_t v16 = v30;
        uint64_t v17 = 2;
      }
      else
      {
        int v18 = BSSizeGreaterThanOrEqualToSize();
        uint64_t v16 = v30;
        if (!v18)
        {
          v30[3] = 0;
          goto LABEL_49;
        }
        uint64_t v17 = 1;
      }
    }
    v16[3] = v17;
  }
LABEL_49:
  uint64_t v22 = v30[3];
  if ((unint64_t)(v22 - 29) <= 1)
  {
    if (v15[2](v15)) {
      uint64_t v22 = 30;
    }
    else {
      uint64_t v22 = 29;
    }
    v30[3] = v22;
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

  return v22;
}

void sub_100038EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
  _Unwind_Resume(a1);
}

id sub_100038EC8()
{
  v0 = +[BSPlatform sharedInstance];
  id v1 = [v0 deviceClass];

  return v1;
}

id sub_100038F08()
{
  v0 = +[BSPlatform sharedInstance];
  id v1 = [v0 homeButtonType];

  return v1;
}

uint64_t sub_100038F48(uint64_t a1, unint64_t a2, unsigned char *a3)
{
  uint64_t v14 = 0;
  long long v12 = 0u;
  long long v13 = 0u;
  sub_100010748(a2, (uint64_t)&v12);
  v10[0] = v12;
  v10[1] = v13;
  uint64_t v11 = v14;
  long long v6 = *(_OWORD *)(a1 + 64);
  v8[0] = *(_OWORD *)(a1 + 48);
  v8[1] = v6;
  uint64_t v9 = *(void *)(a1 + 80);
  uint64_t result = sub_100010B94((uint64_t)v10, (uint64_t)v8);
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a3 = 1;
  }
  return result;
}

void sub_100038FE8(id a1)
{
  CFDictionaryRef v1 = (const __CFDictionary *)MGCopyAnswer();
  if (v1)
  {
    CFDictionaryRef v2 = v1;
    CFDictionaryGetValue(v1, @"ArtworkDeviceSubType");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    if (v3) {
      qword_10008FF08 = (int)[v3 intValue];
    }
    CFRelease(v2);
  }
}

id sub_10003907C()
{
  if (qword_10008FF20 != -1) {
    dispatch_once(&qword_10008FF20, &stru_10007A590);
  }
  v0 = (void *)qword_10008FF18;

  return v0;
}

void sub_1000390D0(id a1)
{
  uint64_t v7 = 0;
  double v8 = &v7;
  uint64_t v9 = 0x2050000000;
  CFDictionaryRef v1 = (void *)qword_10008FF28;
  uint64_t v10 = qword_10008FF28;
  if (!qword_10008FF28)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000391E4;
    v6[3] = &unk_10007A5B8;
    void v6[4] = &v7;
    sub_1000391E4((uint64_t)v6);
    CFDictionaryRef v1 = (void *)v8[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v7, 8);
  id v3 = [v2 mainDisplay];
  id v4 = [objc_alloc((Class)FBSDisplayConfiguration) initWithCADisplay:v3];
  double v5 = (void *)qword_10008FF18;
  qword_10008FF18 = (uint64_t)v4;

  [(id)qword_10008FF18 bounds];
  BSCGFloatEpsilon();
}

void sub_1000391CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000391E4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_10008FF30)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_100039328;
    v3[4] = &unk_10007A5F0;
    v3[5] = v3;
    long long v4 = off_10007A5D8;
    uint64_t v5 = 0;
    qword_10008FF30 = _sl_dlopen();
    if (!qword_10008FF30)
    {
      abort_report_np();
LABEL_8:
      sub_1000497D8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CADisplay");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_10008FF28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100039328()
{
  uint64_t result = _sl_dlopen();
  qword_10008FF30 = result;
  return result;
}

double sub_10003939C(unint64_t a1)
{
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x2BuLL:
      sub_100010748(a1, (uint64_t)v5);
      return v6;
    case 3uLL:
    case 4uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 3;
      goto LABEL_19;
    case 5uLL:
    case 6uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 5;
      goto LABEL_19;
    case 7uLL:
    case 8uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 7;
      goto LABEL_19;
    case 9uLL:
    case 0xAuLL:
      double v2 = 0.96;
      unint64_t v3 = a1;
      unint64_t v4 = 9;
      goto LABEL_19;
    case 0xBuLL:
    case 0xCuLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 11;
      goto LABEL_19;
    case 0xDuLL:
    case 0xEuLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 13;
      goto LABEL_19;
    case 0xFuLL:
    case 0x10uLL:
      double v2 = 0.96;
      unint64_t v3 = a1;
      unint64_t v4 = 15;
      goto LABEL_19;
    case 0x11uLL:
    case 0x12uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 17;
      goto LABEL_19;
    case 0x13uLL:
    case 0x14uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 19;
      goto LABEL_19;
    case 0x15uLL:
    case 0x16uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 21;
      goto LABEL_19;
    case 0x17uLL:
    case 0x18uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 23;
      goto LABEL_19;
    case 0x19uLL:
    case 0x1AuLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 25;
      goto LABEL_19;
    case 0x1BuLL:
    case 0x1CuLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 27;
      goto LABEL_19;
    case 0x25uLL:
    case 0x26uLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 37;
      goto LABEL_19;
    case 0x29uLL:
    case 0x2AuLL:
      double v2 = 1.0;
      unint64_t v3 = a1;
      unint64_t v4 = 41;
LABEL_19:
      double result = sub_1000395B8(v2, a1, v3, v4);
      break;
    default:
      double result = 0.0;
      break;
  }
  return result;
}

double sub_1000395B8(double a1, uint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  sub_100010748(a3, (uint64_t)v10);
  uint64_t v9 = 0;
  long long v7 = 0u;
  long long v8 = 0u;
  sub_100010748(a4, (uint64_t)&v7);
  return *(double *)&v8 * (*(double *)&v7 / *(double *)v10) * a1;
}

id sub_100039634(unint64_t a1)
{
  double v2 = 27.0;
  uint64_t v3 = 0x4049800000000000;
  uint64_t v4 = 0x4043000000000000;
  uint64_t v5 = 0x4044000000000000;
  double v6 = 48.0;
  switch(a1)
  {
    case 3uLL:
    case 5uLL:
    case 8uLL:
      uint64_t v7 = 0x4046000000000000;
      goto LABEL_6;
    case 4uLL:
LABEL_25:
      double v2 = 29.0;
      double v6 = *(double *)&v4;
      break;
    case 6uLL:
LABEL_26:
      double v2 = 30.67;
      double v6 = *(double *)&v5;
      break;
    case 7uLL:
      goto LABEL_11;
    case 9uLL:
    case 0xFuLL:
      uint64_t v7 = 0x4049000000000000;
LABEL_6:
      double v6 = *(double *)&v7;
      goto LABEL_10;
    case 0xAuLL:
    case 0x10uLL:
      double v6 = 43.0;
      goto LABEL_10;
    case 0xBuLL:
    case 0xDuLL:
    case 0x11uLL:
    case 0x13uLL:
      double v6 = 47.0;
      goto LABEL_10;
    case 0xCuLL:
    case 0x12uLL:
      double v6 = 39.0;
      goto LABEL_10;
    case 0xEuLL:
    case 0x14uLL:
      double v6 = 41.0;
      goto LABEL_10;
    case 0x15uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1BuLL:
      double v6 = 59.0;
LABEL_11:
      double v2 = 34.0;
      break;
    case 0x16uLL:
LABEL_27:
      double v2 = 27.67;
      break;
    case 0x18uLL:
LABEL_28:
      double v2 = 31.0;
      double v6 = *(double *)&v3;
      break;
    case 0x1AuLL:
      break;
    case 0x1CuLL:
      double v2 = 29.0;
      double v6 = 51.0;
      break;
    default:
LABEL_10:
      uint64_t v4 = *(void *)&v6;
      uint64_t v5 = *(void *)&v6;
      uint64_t v3 = *(void *)&v6;
      double v2 = 0.0;
      switch(a1)
      {
        case 3uLL:
        case 5uLL:
        case 7uLL:
        case 9uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0xFuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
          goto LABEL_11;
        case 4uLL:
          goto LABEL_25;
        case 6uLL:
          goto LABEL_26;
        case 8uLL:
          double v2 = 31.0;
          break;
        case 0xAuLL:
        case 0x10uLL:
          double v2 = 29.0;
          break;
        case 0xCuLL:
        case 0x12uLL:
          double v2 = 28.0;
          break;
        case 0xEuLL:
        case 0x14uLL:
          double v2 = 29.67;
          break;
        case 0x16uLL:
          goto LABEL_27;
        case 0x18uLL:
          goto LABEL_28;
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
          goto LABEL_12;
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
          double v2 = 20.0;
          break;
        default:
          double v2 = 0.0;
          break;
      }
      break;
  }
LABEL_12:
  id v8 = objc_alloc_init((Class)UISApplicationSupportDisplayEdgeInfo);
  if ((sub_100010710(a1) & 1) == 0 && (sub_10001073C(a1) || sub_10001072C(a1)))
  {
    BOOL v9 = sub_10001073C(a1);
    double v10 = 15.0;
    if (v9)
    {
      if (a1 - 21 >= 8) {
        double v11 = 32.0;
      }
      else {
        double v11 = 48.0;
      }
      id v12 = [objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper) initWithTop:v11 left:0.0 bottom:0.0 right:0.0];
      [v8 setPeripheryInsets:v12];

      double v10 = 21.0;
    }
    long long v13 = +[NSNumber numberWithDouble:v10];
    [v8 setHomeAffordanceOverlayAllowance:v13];

    id v14 = [objc_alloc((Class)UISApplicationSupportDisplayEdgeInsetsWrapper) initWithTop:v6 left:0.0 bottom:v2 right:0.0];
    [v8 setSafeAreaInsetsPortrait:v14];

    [v8 setSystemMinimumMargin:&off_10007CEC8];
  }

  return v8;
}

id sub_1000399D0(unint64_t a1)
{
  CGSize size = CGRectNull.size;
  size.double height = CGRectNull.origin.x;
  CGSize v23 = size;
  *(double *)&uint64_t v3 = sub_10003939C(a1);
  switch(a1)
  {
    case 3uLL:
    case 4uLL:
      float64x2_t v4 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v5 = (float64x2_t)xmmword_100059B80;
      goto LABEL_4;
    case 5uLL:
    case 6uLL:
      float64x2_t v4 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v5 = (float64x2_t)xmmword_100059B70;
LABEL_4:
      float64x2_t v6 = vdivq_f64(v5, v4);
      double v7 = 90.0;
      goto LABEL_15;
    case 7uLL:
    case 8uLL:
      float64x2_t v6 = vdivq_f64((float64x2_t)xmmword_100059B60, (float64x2_t)vdupq_lane_s64(v3, 0));
      *(double *)&uint64_t v8 = 64.0;
      goto LABEL_10;
    case 9uLL:
    case 0xAuLL:
      float64x2_t v6 = vdivq_f64((float64x2_t)xmmword_100059B50, (float64x2_t)vdupq_lane_s64(v3, 0));
      double v7 = 98.88;
      goto LABEL_15;
    case 0xBuLL:
    case 0xCuLL:
      float64x2_t v9 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v10 = (float64x2_t)xmmword_100059B90;
      goto LABEL_9;
    case 0xDuLL:
    case 0xEuLL:
      float64x2_t v9 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v10 = (float64x2_t)xmmword_100059BA0;
LABEL_9:
      float64x2_t v6 = vdivq_f64(v10, v9);
      *(double *)&uint64_t v8 = 96.0;
LABEL_10:
      double v7 = *(double *)&v8;
      goto LABEL_15;
    case 0xFuLL:
    case 0x10uLL:
      float64x2_t v6 = vdivq_f64((float64x2_t)xmmword_100059BB0, (float64x2_t)vdupq_lane_s64(v3, 0));
      double v7 = 107.52;
      goto LABEL_15;
    case 0x11uLL:
    case 0x12uLL:
      float64x2_t v11 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v12 = (float64x2_t)xmmword_100059BC0;
      goto LABEL_14;
    case 0x13uLL:
    case 0x14uLL:
      float64x2_t v11 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v12 = (float64x2_t)xmmword_100059BD0;
LABEL_14:
      float64x2_t v6 = vdivq_f64(v12, v11);
      double v7 = 101.0;
LABEL_15:
      double y = 0.0;
      goto LABEL_21;
    case 0x15uLL:
    case 0x16uLL:
      double y = 34.0 / *(double *)&v3;
      float64x2_t v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v15 = (float64x2_t)xmmword_100059BE0;
      goto LABEL_20;
    case 0x17uLL:
    case 0x18uLL:
      double y = 34.0 / *(double *)&v3;
      float64x2_t v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v15 = (float64x2_t)xmmword_100059BF0;
      goto LABEL_20;
    case 0x19uLL:
    case 0x1AuLL:
      double y = 42.0 / *(double *)&v3;
      float64x2_t v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v15 = (float64x2_t)xmmword_100059C00;
      goto LABEL_20;
    case 0x1BuLL:
    case 0x1CuLL:
      double y = 42.0 / *(double *)&v3;
      float64x2_t v14 = (float64x2_t)vdupq_lane_s64(v3, 0);
      float64x2_t v15 = (float64x2_t)xmmword_100059C10;
LABEL_20:
      float64x2_t v6 = vdivq_f64(v15, v14);
      double v7 = 110.0;
LABEL_21:
      double height = v7 / *(double *)&v3;
      break;
    default:
      double y = CGRectNull.origin.y;
      double height = CGRectNull.size.height;
      float64x2_t v6 = (float64x2_t)v23;
      break;
  }
  double v17 = v6.f64[1];
  float64_t v18 = v6.f64[1];
  double v19 = y;
  double v24 = v6.f64[0];
  double v20 = height;
  if (CGRectIsNull(*(CGRect *)(&v6 - 1))) {
    id v21 = 0;
  }
  else {
    id v21 = [objc_alloc((Class)UISDisplaySingleRectShape) initWithRect:v17 y:y v24:height];
  }

  return v21;
}

void sub_10003A6B4(uint64_t a1)
{
  CFDictionaryRef v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained languageStrings];
  id v4 = [v3 count];

  id v5 = objc_loadWeakRetained(v1);
  id v7 = v5;
  if (v4)
  {
    [v5 _hideActivityView];

    id v7 = objc_loadWeakRetained(v1);
    float64x2_t v6 = [v7 tableView];
    [v6 reloadData];
  }
  else
  {
    [v5 _showActivityView];
  }
}

void sub_10003A7FC(uint64_t a1)
{
  id v2 = +[CBLocationController sharedLocationController];
  [v2 selectLanguage:*(void *)(a1 + 32) restartAfterCompletion:0];
}

id sub_10003AE68(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  id v5 = objc_alloc((Class)NSAttributedString);
  CFStringRef v9 = kCTLanguageAttributeName;
  id v10 = v3;
  float64x2_t v6 = +[NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];

  id v7 = [v5 initWithString:v4 attributes:v6];

  return v7;
}

BOOL sub_10003B24C(void *a1, void *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10003B260()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void sub_10003B2A8()
{
  Hasher._combine(_:)(*v0);
}

Swift::Int sub_10003B2D4()
{
  Swift::UInt v1 = *v0;
  Hasher.init(_seed:)();
  Hasher._combine(_:)(v1);
  return Hasher._finalize()();
}

void *sub_10003B318@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  BOOL v2 = *result != 1 && *result != 0;
  *(void *)a2 = *result == 1;
  *(unsigned char *)(a2 + 8) = v2;
  return result;
}

void sub_10003B348(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_10003B354@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent;
  uint64_t v4 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent);
  uint64_t v5 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 8);
  uint64_t v7 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 16);
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 24);
  uint64_t v8 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 32);
  uint64_t v9 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 40);
  uint64_t v10 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 48);
  if (v7 == 1)
  {
    uint64_t v26 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 8);
    uint64_t v27 = *(void *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent);
    sub_10003B4A8(v1, (uint64_t)&v28);
    uint64_t v11 = v31;
    char v12 = v32;
    uint64_t v13 = *(void *)v3;
    uint64_t v25 = *(void *)(v3 + 8);
    uint64_t v14 = *(void *)(v3 + 16);
    long long v15 = v29;
    *(_OWORD *)uint64_t v3 = v28;
    *(_OWORD *)(v3 + 16) = v15;
    *(_OWORD *)(v3 + 32) = v30;
    *(void *)(v3 + 48) = v11;
    *(unsigned char *)(v3 + 56) = v12;
    sub_10003CFB4((uint64_t)&v28);
    sub_10003D000(v13, v25, v14);
    uint64_t v5 = v26;
    uint64_t v4 = v27;
    char v16 = v32;
    uint64_t v18 = *((void *)&v30 + 1);
    uint64_t v17 = v31;
    uint64_t v20 = *((void *)&v29 + 1);
    uint64_t v19 = v30;
    uint64_t v22 = *((void *)&v28 + 1);
    uint64_t v21 = v29;
    uint64_t v23 = v28;
  }
  else
  {
    char v16 = *(unsigned char *)(v1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___bootIntent + 56) & 1;
    uint64_t v23 = v4;
    uint64_t v22 = v5;
    uint64_t v21 = v7;
    uint64_t v20 = v6;
    uint64_t v19 = v8;
    uint64_t v18 = v9;
    uint64_t v17 = v10;
  }
  uint64_t result = sub_10003D054(v4, v5, v7);
  *(void *)a1 = v23;
  *(void *)(a1 + 8) = v22;
  *(void *)(a1 + 16) = v21;
  *(void *)(a1 + 24) = v20;
  *(void *)(a1 + 32) = v19;
  *(void *)(a1 + 40) = v18;
  *(void *)(a1 + 48) = v17;
  *(unsigned char *)(a1 + 56) = v16;
  return result;
}

void sub_10003B4A8(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10003BC34((uint64_t)v24);
  sub_10003D0F4((uint64_t)v24, (uint64_t)v33, &qword_10008F810);
  uint64_t v4 = v34;
  if (v34 != 1)
  {
    uint64_t v9 = v33[0];
    uint64_t v12 = v36;
    uint64_t v22 = v35;
    uint64_t v23 = v33[1];
    uint64_t v16 = v37;
    uint64_t v15 = v38;
    char v21 = v39;
    id v17 = [self standardUserDefaults];
LABEL_6:
    id v18 = v17;
    Class isa = UInt._bridgeToObjectiveC()().super.super.isa;
    NSString v20 = String._bridgeToObjectiveC()();
    [v18 setValue:isa forKey:v20];

    uint64_t v14 = v15;
    uint64_t v13 = v16;
    uint64_t v11 = v22;
    uint64_t v10 = v23;
    *(unsigned char *)(a1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 1;
    char v5 = v21 & 1;
    goto LABEL_7;
  }
  sub_10003C068((uint64_t)v25);
  sub_10003D0F4((uint64_t)v25, (uint64_t)v26, &qword_10008F810);
  uint64_t v4 = v27;
  if (v27 != 1)
  {
    uint64_t v9 = v26[0];
    uint64_t v12 = v29;
    uint64_t v22 = v28;
    uint64_t v23 = v26[1];
    uint64_t v16 = v30;
    uint64_t v15 = v31;
    char v21 = v32;
    id v17 = [self standardUserDefaults];
    goto LABEL_6;
  }
  char v5 = sub_10003B6F0() ^ 1;
  id v6 = [self standardUserDefaults];
  Class v7 = UInt._bridgeToObjectiveC()().super.super.isa;
  NSString v8 = String._bridgeToObjectiveC()();
  [v6 setValue:v7 forKey:v8];

  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v4 = 0;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  *(unsigned char *)(a1 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead) = 1;
LABEL_7:
  *(void *)a2 = v9;
  *(void *)(a2 + 8) = v10;
  *(void *)(a2 + 16) = v4;
  *(void *)(a2 + 24) = v11;
  *(void *)(a2 + 32) = v12;
  *(void *)(a2 + 40) = v13;
  *(void *)(a2 + 48) = v14;
  *(unsigned char *)(a2 + 56) = v5 & 1;
}

uint64_t sub_10003B6F0()
{
  uint64_t v1 = OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead;
  int v2 = *(unsigned __int8 *)(v0 + OBJC_IVAR___CBBootIntentManager____lazy_storage___checkBootIntentWasRead);
  if (v2 == 2)
  {
    char v3 = sub_10003B738();
    *(unsigned char *)(v0 + v1) = v3 & 1;
  }
  else
  {
    char v3 = v2 & 1;
  }
  return v3 & 1;
}

uint64_t sub_10003B738()
{
  id v0 = [self standardUserDefaults];
  NSString v1 = String._bridgeToObjectiveC()();
  id v2 = [v0 objectForKey:v1];

  if (v2)
  {
    _bridgeAnyObjectToAny(_:)();

    swift_unknownObjectRelease();
  }
  else
  {

    memset(v4, 0, sizeof(v4));
  }
  sub_10003D0F4((uint64_t)v4, (uint64_t)v5, &qword_10008F808);
  if (v6) {
    return swift_dynamicCast();
  }
  sub_10003CDD4((uint64_t)v5);
  return 0;
}

id sub_10003B848()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for BootIntentManager()) init];
  qword_1000902F0 = (uint64_t)result;
  return result;
}

void sub_10003BC34(uint64_t a1@<X8>)
{
  id v2 = [self standardUserDefaults];
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = [v2 objectForKey:v3];

  if (v4)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  sub_10003D0F4((uint64_t)&v26, (uint64_t)v28, &qword_10008F808);
  if (!v29)
  {
    sub_10003CDD4((uint64_t)v28);
LABEL_10:
    sub_10003CC64();
    NSString v8 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    unint64_t v5 = 0;
    unint64_t v9 = 0;
    unint64_t v10 = 0;
    uint64_t v11 = 0;
    unint64_t v12 = 0;
    uint64_t v13 = 0;
    BOOL v14 = 0;
    uint64_t v15 = 1;
    goto LABEL_11;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_10;
  }
  unint64_t v5 = v24;
  if (v24 > 1) {
    goto LABEL_10;
  }
  NSString v6 = String._bridgeToObjectiveC()();
  id v7 = [v2 objectForKey:v6];

  if (v7)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  sub_10003D0F4((uint64_t)&v26, (uint64_t)v28, &qword_10008F808);
  if (v29)
  {
    int v16 = swift_dynamicCast();
    if (v16) {
      unint64_t v9 = v24;
    }
    else {
      unint64_t v9 = 0;
    }
    if (v16) {
      uint64_t v15 = v25;
    }
    else {
      uint64_t v15 = 0;
    }
  }
  else
  {
    sub_10003CDD4((uint64_t)v28);
    unint64_t v9 = 0;
    uint64_t v15 = 0;
  }
  NSString v17 = String._bridgeToObjectiveC()();
  id v18 = [v2 objectForKey:v17];

  if (v18)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  sub_10003D0F4((uint64_t)&v26, (uint64_t)v28, &qword_10008F808);
  if (v29)
  {
    int v19 = swift_dynamicCast();
    if (v19) {
      unint64_t v10 = v24;
    }
    else {
      unint64_t v10 = 0;
    }
    if (v19) {
      uint64_t v11 = v25;
    }
    else {
      uint64_t v11 = 0;
    }
  }
  else
  {
    sub_10003CDD4((uint64_t)v28);
    unint64_t v10 = 0;
    uint64_t v11 = 0;
  }
  NSString v20 = String._bridgeToObjectiveC()();
  id v21 = [v2 objectForKey:v20];

  if (v21)
  {
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v26 = 0u;
    long long v27 = 0u;
  }
  sub_10003D0F4((uint64_t)&v26, (uint64_t)v28, &qword_10008F808);
  if (v29)
  {
    int v22 = swift_dynamicCast();
    if (v22) {
      unint64_t v12 = v24;
    }
    else {
      unint64_t v12 = 0;
    }
    if (v22) {
      uint64_t v13 = v25;
    }
    else {
      uint64_t v13 = 0;
    }
  }
  else
  {
    sub_10003CDD4((uint64_t)v28);
    unint64_t v12 = 0;
    uint64_t v13 = 0;
  }
  char v23 = sub_10003B6F0();

  BOOL v14 = (v23 & 1) == 0;
LABEL_11:
  *(void *)a1 = v5;
  *(void *)(a1 + 8) = v9;
  *(void *)(a1 + 16) = v15;
  *(void *)(a1 + 24) = v10;
  *(void *)(a1 + 32) = v11;
  *(void *)(a1 + 40) = v12;
  *(void *)(a1 + 48) = v13;
  *(unsigned char *)(a1 + 56) = v14;
}

void sub_10003C068(uint64_t a1@<X8>)
{
  if (!sub_10003CB80())
  {
    sub_10003CC64();
    unint64_t v9 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
LABEL_17:
    os_log(_:dso:log:type:_:)();

    goto LABEL_18;
  }
  swift_getObjCClassMetadata();
  id v37 = 0;
  id v2 = [(id)swift_getObjCClassFromMetadata() getSsrBootIntentWithError:&v37];
  id v3 = v37;
  if (v2)
  {
    id v4 = v2;
    uint64_t v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = v3;
    swift_bridgeObjectRetain();

    swift_bridgeObjectRetain();
    AnyHashable.init<A>(_:)();
    if (*(void *)(v5 + 16) && (unint64_t v7 = sub_10003CD3C((uint64_t)&v37), (v8 & 1) != 0))
    {
      sub_10003CE34(*(void *)(v5 + 56) + 32 * v7, (uint64_t)&v39);
    }
    else
    {
      long long v39 = 0u;
      long long v40 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_10003CD80((uint64_t)&v37);
    if (*((void *)&v40 + 1))
    {
      if (swift_dynamicCast())
      {
        if (v37 == (id)0xD000000000000013 && v38 == 0x80000001000703B0)
        {
          swift_bridgeObjectRelease();
        }
        else
        {
          char v24 = _stringCompareWithSmolCheck(_:_:expecting:)();
          swift_bridgeObjectRelease();
          if ((v24 & 1) == 0)
          {
            uint64_t v16 = 0;
            goto LABEL_23;
          }
        }
        sub_10003CC64();
        uint64_t v25 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();

        uint64_t v16 = 1;
LABEL_23:
        strcpy((char *)&v39, "ActiveLocale");
        BYTE13(v39) = 0;
        HIWORD(v39) = -5120;
        swift_bridgeObjectRetain();
        AnyHashable.init<A>(_:)();
        if (*(void *)(v5 + 16) && (unint64_t v26 = sub_10003CD3C((uint64_t)&v37), (v27 & 1) != 0))
        {
          sub_10003CE34(*(void *)(v5 + 56) + 32 * v26, (uint64_t)&v39);
        }
        else
        {
          long long v39 = 0u;
          long long v40 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_10003CD80((uint64_t)&v37);
        if (*((void *)&v40 + 1))
        {
          int v28 = swift_dynamicCast();
          if (v28) {
            id v17 = v37;
          }
          else {
            id v17 = 0;
          }
          if (v28) {
            uint64_t v23 = v38;
          }
          else {
            uint64_t v23 = 0;
          }
        }
        else
        {
          sub_10003CDD4((uint64_t)&v39);
          id v17 = 0;
          uint64_t v23 = 0;
        }
        AnyHashable.init<A>(_:)();
        if (*(void *)(v5 + 16) && (unint64_t v29 = sub_10003CD3C((uint64_t)&v37), (v30 & 1) != 0))
        {
          sub_10003CE34(*(void *)(v5 + 56) + 32 * v29, (uint64_t)&v39);
        }
        else
        {
          long long v39 = 0u;
          long long v40 = 0u;
        }
        swift_bridgeObjectRelease();
        sub_10003CD80((uint64_t)&v37);
        if (*((void *)&v40 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0 && v37 == 1)
          {
            *(void *)&long long v39 = 0x6F50737365636341;
            *((void *)&v39 + 1) = 0xEB00000000746E69;
            AnyHashable.init<A>(_:)();
            if (*(void *)(v5 + 16))
            {
              unint64_t v31 = sub_10003CD3C((uint64_t)&v37);
              if (v32)
              {
                sub_10003CE34(*(void *)(v5 + 56) + 32 * v31, (uint64_t)&v39);
              }
              else
              {
                long long v39 = 0u;
                long long v40 = 0u;
              }
            }
            else
            {
              long long v39 = 0u;
              long long v40 = 0u;
            }
            sub_10003CD80((uint64_t)&v37);
            if (*((void *)&v40 + 1))
            {
              int v33 = swift_dynamicCast();
              if (v33) {
                id v18 = v37;
              }
              else {
                id v18 = 0;
              }
              if (v33) {
                uint64_t v19 = v38;
              }
              else {
                uint64_t v19 = 0;
              }
            }
            else
            {
              sub_10003CDD4((uint64_t)&v39);
              id v18 = 0;
              uint64_t v19 = 0;
            }
            AnyHashable.init<A>(_:)();
            if (*(void *)(v5 + 16) && (unint64_t v34 = sub_10003CD3C((uint64_t)&v37), (v35 & 1) != 0))
            {
              sub_10003CE34(*(void *)(v5 + 56) + 32 * v34, (uint64_t)&v39);
            }
            else
            {
              long long v39 = 0u;
              long long v40 = 0u;
            }
            swift_bridgeObjectRelease();
            sub_10003CD80((uint64_t)&v37);
            if (*((void *)&v40 + 1))
            {
              int v36 = swift_dynamicCast();
              if (v36) {
                id v20 = v37;
              }
              else {
                id v20 = 0;
              }
              if (v36) {
                uint64_t v21 = v38;
              }
              else {
                uint64_t v21 = 0;
              }
            }
            else
            {
              sub_10003CDD4((uint64_t)&v39);
              id v20 = 0;
              uint64_t v21 = 0;
            }
            goto LABEL_48;
          }
          swift_bridgeObjectRelease();
        }
        else
        {
          swift_bridgeObjectRelease();
          sub_10003CDD4((uint64_t)&v39);
        }
        id v20 = 0;
        uint64_t v21 = 0;
        id v18 = 0;
        uint64_t v19 = 0;
LABEL_48:
        BOOL v22 = (sub_10003B6F0() & 1) == 0;
        goto LABEL_19;
      }
      swift_bridgeObjectRelease_n();
    }
    else
    {
      swift_bridgeObjectRelease_n();
      sub_10003CDD4((uint64_t)&v39);
    }
    sub_10003CC64();
    unint64_t v9 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    goto LABEL_17;
  }
  id v10 = v37;
  _convertNSErrorToError(_:)();

  swift_willThrow();
  static os_log_type_t.error.getter();
  sub_10003CCA4((uint64_t *)&unk_10008F990);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_100059C20;
  swift_getErrorValue();
  uint64_t v12 = Error.localizedDescription.getter();
  uint64_t v14 = v13;
  *(void *)(v11 + 56) = &type metadata for String;
  *(void *)(v11 + 64) = sub_10003CCE8();
  *(void *)(v11 + 32) = v12;
  *(void *)(v11 + 40) = v14;
  sub_10003CC64();
  uint64_t v15 = (void *)static OS_os_log.default.getter();
  os_log(_:dso:log:type:_:)();
  swift_bridgeObjectRelease();

  swift_errorRelease();
LABEL_18:
  uint64_t v16 = 0;
  id v17 = 0;
  id v18 = 0;
  uint64_t v19 = 0;
  id v20 = 0;
  uint64_t v21 = 0;
  BOOL v22 = 0;
  uint64_t v23 = 1;
LABEL_19:
  *(void *)a1 = v16;
  *(void *)(a1 + 8) = v17;
  *(void *)(a1 + 16) = v23;
  *(void *)(a1 + 24) = v18;
  *(void *)(a1 + 32) = v19;
  *(void *)(a1 + 40) = v20;
  *(void *)(a1 + 48) = v21;
  *(unsigned char *)(a1 + 56) = v22;
}

id sub_10003C830()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for BootIntentManager();
  return [super dealloc];
}

uint64_t type metadata accessor for BootIntentManager()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for BootIntent(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for BootIntent()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for BootIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  uint64_t v3 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v3;
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for BootIntent(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

__n128 initializeWithTake for BootIntent(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for BootIntent(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(a2 + 32);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 48);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  *(void *)(a1 + 48) = v5;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for BootIntent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 57)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 16);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for BootIntent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 56) = 0;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 57) = 0;
    }
    if (a2) {
      *(void *)(result + 16) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for BootIntent()
{
  return &type metadata for BootIntent;
}

id sub_10003CB80()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v0 = (void *)qword_1000900C0;
  uint64_t v7 = qword_1000900C0;
  if (!qword_1000900C0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003D218;
    v3[3] = &unk_10007A5B8;
    v3[4] = &v4;
    sub_10003D218(v3);
    id v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_10003CC4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t sub_10003CC64()
{
  unint64_t result = qword_10008F7F8;
  if (!qword_10008F7F8)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10008F7F8);
  }
  return result;
}

uint64_t sub_10003CCA4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10003CCE8()
{
  unint64_t result = qword_10008F800;
  if (!qword_10008F800)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008F800);
  }
  return result;
}

unint64_t sub_10003CD3C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = AnyHashable._rawHashValue(seed:)(*(void *)(v2 + 40));

  return sub_10003CE90(a1, v4);
}

uint64_t sub_10003CD80(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003CDD4(uint64_t a1)
{
  uint64_t v2 = sub_10003CCA4(&qword_10008F808);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10003CE34(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_10003CE90(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_10003CF58(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = static AnyHashable.== infix(_:_:)();
      sub_10003CD80((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_10003CF58(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_10003CFB4(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003D000(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10003D054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 != 1)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_10003D0A8(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003D0F4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10003CCA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_10003D158(uint64_t a1)
{
  return a1;
}

uint64_t sub_10003D184(uint64_t a1)
{
  return a1;
}

ValueMetadata *type metadata accessor for BootIntentReason()
{
  return &type metadata for BootIntentReason;
}

unint64_t sub_10003D1C4()
{
  unint64_t result = qword_10008F820;
  if (!qword_10008F820)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008F820);
  }
  return result;
}

Class sub_10003D218(void *a1)
{
  v7[0] = 0;
  if (!qword_1000900C8)
  {
    v7[1] = _NSConcreteStackBlock;
    v7[2] = (void *)3221225472;
    v7[3] = sub_10003D408;
    v7[4] = &unk_10007A5F0;
    void v7[5] = v7;
    long long v8 = off_10007A790;
    uint64_t v9 = 0;
    qword_1000900C8 = _sl_dlopen();
  }
  if (qword_1000900C8)
  {
    uint64_t v2 = v7[0];
    if (!v7[0]) {
      goto LABEL_5;
    }
  }
  else
  {
    a1 = +[NSAssertionHandler currentHandler];
    unint64_t v4 = +[NSString stringWithUTF8String:"void *CoreRepairCoreLibrary(void)"];
    [a1 handleFailureInFunction:v4 file:@"CheckerBoard-Bridging-Header.h" lineNumber:10 description:@"%s" v7[0]];

    __break(1u);
  }
  free(v2);
LABEL_5:
  Class result = objc_getClass("CRRepairStatusLite");
  *(void *)(*(void *)(a1[4] + 8) + 24) = result;
  if (!*(void *)(*(void *)(a1[4] + 8) + 24))
  {
    uint64_t v5 = +[NSAssertionHandler currentHandler];
    char v6 = +[NSString stringWithUTF8String:"Class getCRRepairStatusLiteClass(void)_block_invoke"];
    [v5 handleFailureInFunction:v6 file:@"CheckerBoard-Bridging-Header.h" lineNumber:11 description:@"Unable to find class %s" "CRRepairStatusLite"];

    __break(1u);
  }
  qword_1000900C0 = *(void *)(*(void *)(a1[4] + 8) + 24);
  return result;
}

uint64_t sub_10003D408()
{
  uint64_t result = _sl_dlopen();
  qword_1000900C8 = result;
  return result;
}

NSString sub_10003D47C()
{
  NSString result = String._bridgeToObjectiveC()();
  qword_1000902F8 = (uint64_t)result;
  return result;
}

void sub_10003D510()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Locale();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  char v6 = (objc_class *)type metadata accessor for DebugInfoViewController();
  v61.receiver = v0;
  v61.super_class = v6;
  [super viewDidLoad];
  char v7 = [self wasRemoteSetupPerformed];
  static Locale.current.getter();
  uint64_t v8 = Locale.identifier.getter();
  uint64_t v10 = v9;
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v11 = (id)MobileGestalt_get_current_device();
  if (!v11)
  {
    __break(1u);
    goto LABEL_16;
  }
  uint64_t v12 = v11;
  char v13 = MobileGestalt_get_inDiagnosticsMode();

  id v14 = (id)MobileGestalt_get_current_device();
  if (!v14)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  uint64_t v15 = v14;
  id v16 = (id)MobileGestalt_copy_buildVersion_obj();

  if (!v16)
  {
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  id v20 = [objc_allocWithZone((Class)type metadata accessor for DebugInfoState(0)) init];
  sub_1000467D4(v7, v8, v10, v13, v17, v19, (uint64_t)v20, (uint64_t)v60);
  id v21 = objc_allocWithZone((Class)sub_10003CCA4(&qword_10008F9A0));
  BOOL v22 = (void *)UIHostingController.init(rootView:)();
  id v23 = [v22 view];
  if (!v23)
  {
    static os_log_type_t.error.getter();
    sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
    char v24 = (void *)static OS_os_log.default.getter();
    os_log(_:dso:log:type:_:)();
    goto LABEL_14;
  }
  char v24 = v23;
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v1 addChildViewController:v22];
  id v25 = [v1 view];
  if (!v25) {
    goto LABEL_18;
  }
  unint64_t v26 = v25;
  [v25 addSubview:v24];

  sub_10003CCA4(&qword_10008F9A8);
  uint64_t v27 = swift_allocObject();
  *(_OWORD *)(v27 + 16) = xmmword_100059D20;
  id v28 = [v24 centerXAnchor];
  id v29 = [v1 view];
  if (!v29)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  char v30 = v29;
  id v31 = [v29 centerXAnchor];

  id v32 = [v28 constraintEqualToAnchor:v31];
  *(void *)(v27 + 32) = v32;
  id v33 = [v24 centerYAnchor];
  id v34 = [v1 view];
  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  char v35 = v34;
  id v36 = [v34 centerYAnchor];

  id v37 = [v33 constraintEqualToAnchor:v36];
  *(void *)(v27 + 40) = v37;
  id v38 = [v24 topAnchor];
  id v39 = [v1 view];
  if (!v39)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  long long v40 = v39;
  id v41 = [v39 topAnchor];

  id v42 = [v38 constraintEqualToAnchor:v41];
  *(void *)(v27 + 48) = v42;
  id v43 = [v24 bottomAnchor];
  id v44 = [v1 view];
  if (!v44)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v45 = v44;
  id v46 = [v44 bottomAnchor];

  id v47 = [v43 constraintEqualToAnchor:v46];
  *(void *)(v27 + 56) = v47;
  id v48 = [v24 leadingAnchor];
  id v49 = [v1 view];
  if (!v49)
  {
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v50 = v49;
  id v51 = [v49 leadingAnchor];

  id v52 = [v48 constraintEqualToAnchor:v51];
  *(void *)(v27 + 64) = v52;
  id v53 = [v24 trailingAnchor];
  id v54 = [v1 view];
  if (v54)
  {
    v55 = v54;
    v56 = self;
    id v57 = [v55 trailingAnchor];

    id v58 = [v53 constraintEqualToAnchor:v57];
    *(void *)(v27 + 72) = v58;
    v60[0] = v27;
    specialized Array._endMutation()();
    sub_1000470F0(0, &qword_10008F9B0);
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v56 activateConstraints:isa];

    [v22 didMoveToParentViewController:v1];
LABEL_14:

    return;
  }
LABEL_24:
  __break(1u);
}

id sub_10003DCB0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DebugInfoViewController();
  [super dealloc];
}

uint64_t type metadata accessor for DebugInfoViewController()
{
  return self;
}

uint64_t sub_10003DD0C(uint64_t a1)
{
  uint64_t v2 = sub_10003CCA4(&qword_10008F9D0);
  __chkstk_darwin(v2);
  uint64_t v4 = &v7[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  *(void *)uint64_t v4 = static HorizontalAlignment.center.getter();
  *((void *)v4 + 1) = 0;
  uint8_t v4[16] = 1;
  uint64_t v5 = sub_10003CCA4(&qword_10008F9D8);
  sub_10003DF14((_OWORD *)a1, &v4[*(int *)(v5 + 44)]);
  long long v10 = *(_OWORD *)(a1 + 88);
  uint64_t v11 = *(void *)(a1 + 104);
  sub_10003CCA4(&qword_10008F9E0);
  State.wrappedValue.getter();
  long long v9 = *(_OWORD *)(a1 + 72);
  sub_10003CCA4(&qword_10008F9E8);
  State.projectedValue.getter();
  uint64_t v8 = a1;
  sub_10003CCA4(&qword_10008F9F0);
  sub_10004880C(&qword_10008F9F8, &qword_10008F9D0);
  sub_100046CB8();
  sub_10004880C(&qword_10008FA08, &qword_10008F9F0);
  View.alert<A, B>(_:isPresented:actions:)();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return sub_1000483D8((uint64_t)v4, &qword_10008F9D0);
}

uint64_t sub_10003DF14@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4 = sub_10003CCA4(&qword_10008FA18);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  char v7 = &v42[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v5);
  long long v9 = &v42[-v8];
  uint64_t v50 = static VerticalAlignment.center.getter();
  uint64_t v49 = static HorizontalAlignment.center.getter();
  static Font.title.getter();
  uint64_t v10 = Text.font(_:)();
  uint64_t v44 = v11;
  uint64_t v45 = v10;
  uint64_t v48 = v12;
  char v14 = v13;
  swift_release();
  uint64_t KeyPath = swift_getKeyPath();
  int v46 = static Edge.Set.top.getter();
  EdgeInsets.init(_all:)();
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  uint64_t v22 = v21;
  unsigned __int8 v23 = static Edge.Set.leading.getter();
  unsigned __int8 v24 = static Edge.Set.trailing.getter();
  char v25 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v23) {
    char v25 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v24) {
    char v25 = Edge.Set.init(rawValue:)();
  }
  char v54 = 1;
  char v53 = 1;
  int v26 = v14 & 1;
  char v52 = v26;
  int v43 = v26;
  char v51 = 0;
  char v55 = 1;
  *(void *)long long v9 = static HorizontalAlignment.center.getter();
  *((void *)v9 + 1) = 0;
  v9[16] = 1;
  uint64_t v27 = sub_10003CCA4(&qword_10008FA20);
  sub_10003E278(a1, (uint64_t)&v9[*(int *)(v27 + 44)]);
  char v28 = v55;
  sub_100048434((uint64_t)v9, (uint64_t)v7, &qword_10008FA18);
  long long v56 = (unint64_t)v50;
  LOBYTE(v57) = 1;
  *((void *)&v57 + 1) = v49;
  *(void *)&long long v58 = 0;
  BYTE8(v58) = 1;
  uint64_t v29 = v45;
  *(void *)&long long v59 = v45;
  *((void *)&v59 + 1) = v48;
  LOBYTE(v60) = v26;
  uint64_t v30 = v44;
  *((void *)&v60 + 1) = v44;
  *(void *)&long long v61 = KeyPath;
  BYTE8(v61) = 1;
  LOBYTE(v62) = v46;
  *((void *)&v62 + 1) = v16;
  *(void *)&long long v63 = v18;
  *((void *)&v63 + 1) = v20;
  *(void *)&long long v64 = v22;
  BYTE8(v64) = 0;
  LOBYTE(v65[0]) = v25;
  *(_OWORD *)((char *)&v65[1] + 8) = 0u;
  *(_OWORD *)((char *)v65 + 8) = 0u;
  BYTE8(v65[2]) = v28;
  long long v31 = v60;
  long long v32 = v61;
  long long v33 = v63;
  a2[6] = v62;
  a2[7] = v33;
  a2[4] = v31;
  a2[5] = v32;
  long long v34 = v56;
  long long v35 = v57;
  long long v36 = v59;
  a2[2] = v58;
  a2[3] = v36;
  *a2 = v34;
  a2[1] = v35;
  long long v37 = v64;
  long long v38 = v65[0];
  long long v39 = v65[1];
  *(_OWORD *)((char *)a2 + 169) = *(_OWORD *)((char *)&v65[1] + 9);
  a2[9] = v38;
  a2[10] = v39;
  a2[8] = v37;
  uint64_t v40 = sub_10003CCA4(&qword_10008FA28);
  sub_100048434((uint64_t)v7, (uint64_t)a2 + *(int *)(v40 + 48), &qword_10008FA18);
  sub_100046E30((uint64_t)&v56);
  sub_1000483D8((uint64_t)v9, &qword_10008FA18);
  sub_1000483D8((uint64_t)v7, &qword_10008FA18);
  v66[0] = v50;
  v66[1] = 0;
  char v67 = 1;
  uint64_t v68 = v49;
  uint64_t v69 = 0;
  char v70 = 1;
  uint64_t v71 = v29;
  uint64_t v72 = v48;
  char v73 = v43;
  uint64_t v74 = v30;
  uint64_t v75 = KeyPath;
  char v76 = 1;
  char v77 = v46;
  uint64_t v78 = v16;
  uint64_t v79 = v18;
  uint64_t v80 = v20;
  uint64_t v81 = v22;
  char v82 = 0;
  char v83 = v25;
  long long v85 = 0u;
  long long v84 = 0u;
  char v86 = v28;
  return sub_100046E90((uint64_t)v66);
}

uint64_t sub_10003E278@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10003CCA4(&qword_10008FA30);
  __chkstk_darwin(v4 - 8);
  uint64_t v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10003CCA4(&qword_10008FA38);
  uint64_t v8 = v7 - 8;
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  char v13 = (char *)&v26 - v12;
  uint64_t v14 = sub_10003CCA4(&qword_10008FA40);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v26 - v18;
  *(void *)uint64_t v19 = static HorizontalAlignment.center.getter();
  *((void *)v19 + 1) = 0;
  v19[16] = 1;
  uint64_t v20 = sub_10003CCA4(&qword_10008FA48);
  sub_10003E534((uint64_t)a1, (uint64_t)&v19[*(int *)(v20 + 44)]);
  *(void *)uint64_t v6 = static HorizontalAlignment.center.getter();
  *((void *)v6 + 1) = 0;
  uint8_t v6[16] = 1;
  uint64_t v21 = sub_10003CCA4(&qword_10008FA50);
  sub_100040428(a1, (uint64_t)&v6[*(int *)(v21 + 44)]);
  LOBYTE(a1) = static Edge.Set.bottom.getter();
  sub_100048434((uint64_t)v6, (uint64_t)v11, &qword_10008FA30);
  uint64_t v22 = &v11[*(int *)(v8 + 44)];
  *uint64_t v22 = (char)a1;
  *(_OWORD *)(v22 + 8) = 0u;
  *(_OWORD *)(v22 + 24) = 0u;
  v22[40] = 1;
  sub_1000483D8((uint64_t)v6, &qword_10008FA30);
  sub_10003D0F4((uint64_t)v11, (uint64_t)v13, &qword_10008FA38);
  sub_100048434((uint64_t)v19, (uint64_t)v17, &qword_10008FA40);
  sub_100048434((uint64_t)v13, (uint64_t)v11, &qword_10008FA38);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  unsigned __int8 v23 = (int *)sub_10003CCA4(&qword_10008FA58);
  sub_100048434((uint64_t)v17, a2 + v23[12], &qword_10008FA40);
  uint64_t v24 = a2 + v23[16];
  *(void *)uint64_t v24 = 0;
  *(unsigned char *)(v24 + 8) = 1;
  sub_100048434((uint64_t)v11, a2 + v23[20], &qword_10008FA38);
  sub_1000483D8((uint64_t)v13, &qword_10008FA38);
  sub_1000483D8((uint64_t)v19, &qword_10008FA40);
  sub_1000483D8((uint64_t)v11, &qword_10008FA38);
  return sub_1000483D8((uint64_t)v17, &qword_10008FA40);
}

uint64_t sub_10003E534@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_10003CCA4(&qword_10008FAB8);
  uint64_t v4 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v126 = (uint64_t)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  v122 = (uint64_t *)((char *)&v56 - v6);
  uint64_t v81 = static VerticalAlignment.center.getter();
  sub_10003F318(a1, (uint64_t)&v187);
  uint64_t v93 = v188;
  uint64_t v94 = v187;
  int v83 = v189;
  uint64_t v97 = v191;
  uint64_t v95 = v190;
  uint64_t v96 = v192;
  int v109 = v193;
  uint64_t v147 = v194;
  uint64_t v80 = static VerticalAlignment.center.getter();
  sub_10003F3EC((uint64_t)&v187);
  uint64_t v142 = v187;
  uint64_t v141 = v188;
  int v82 = v189;
  uint64_t v143 = v190;
  uint64_t v145 = v191;
  uint64_t v144 = v192;
  int v101 = v193;
  uint64_t v146 = v194;
  uint64_t v79 = static VerticalAlignment.center.getter();
  sub_10003F6D0(a1, (uint64_t)&v187);
  uint64_t v137 = v187;
  uint64_t v136 = v188;
  int v98 = v189;
  uint64_t v138 = v190;
  uint64_t v139 = v191;
  uint64_t v92 = v192;
  int v103 = v193;
  uint64_t v140 = v194;
  uint64_t v78 = static VerticalAlignment.center.getter();
  sub_10003F8C0(a1, (uint64_t)&v187);
  uint64_t v131 = v187;
  uint64_t v130 = v188;
  int v99 = v189;
  uint64_t v132 = v190;
  uint64_t v134 = v191;
  uint64_t v133 = v192;
  int v105 = v193;
  uint64_t v135 = v194;
  uint64_t v77 = static VerticalAlignment.center.getter();
  sub_10003F9CC(a1, (uint64_t)&v187);
  uint64_t v123 = v188;
  uint64_t v124 = v187;
  int v100 = v189;
  uint64_t v125 = v190;
  uint64_t v127 = v192;
  uint64_t v128 = v191;
  int v107 = v193;
  uint64_t v129 = v194;
  uint64_t v76 = static VerticalAlignment.center.getter();
  sub_10003FB40((unsigned char *)a1, (uint64_t)&v187);
  uint64_t v116 = v188;
  uint64_t v117 = v187;
  int v102 = v189;
  uint64_t v118 = v190;
  uint64_t v119 = v192;
  int v108 = v193;
  uint64_t v120 = v191;
  uint64_t v121 = v194;
  uint64_t v75 = static VerticalAlignment.center.getter();
  sub_10003FC34(a1, (uint64_t)&v187);
  uint64_t v90 = v188;
  uint64_t v91 = v187;
  int v104 = v189;
  uint64_t v112 = v190;
  uint64_t v113 = v192;
  int v110 = v193;
  uint64_t v114 = v191;
  uint64_t v115 = v194;
  uint64_t v74 = static VerticalAlignment.center.getter();
  sub_10003FD28(a1, (uint64_t)&v187);
  uint64_t v84 = v188;
  uint64_t v85 = v187;
  int v106 = v189;
  uint64_t v86 = v190;
  uint64_t v87 = v192;
  int v111 = v193;
  uint64_t v88 = v191;
  uint64_t v89 = v194;
  uint64_t v7 = *(void *)(a1 + 48);
  swift_getKeyPath();
  uint64_t v187 = v7;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v7 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1)
  {
    uint64_t v64 = static VerticalAlignment.center.getter();
    sub_10003FE9C(a1, (uint64_t)&v187);
    uint64_t v8 = v187;
    uint64_t v9 = v188;
    uint64_t v59 = v188;
    uint64_t v60 = v187;
    int v10 = v189;
    uint64_t v61 = v190;
    uint64_t v11 = v191;
    uint64_t v12 = v192;
    uint64_t v56 = v192;
    uint64_t v57 = v191;
    int v13 = v193;
    uint64_t v72 = v194;
    uint64_t v63 = static VerticalAlignment.center.getter();
    sub_10003FFFC((uint64_t)&v187);
    uint64_t v70 = v188;
    uint64_t v71 = v187;
    uint64_t v68 = v191;
    uint64_t v69 = v190;
    uint64_t v67 = v192;
    int v66 = v193;
    uint64_t v65 = v194;
    LOBYTE(v165[0]) = 1;
    char v14 = v10;
    int v58 = v10;
    v148[0] = v10;
    LOBYTE(v10) = v13;
    char v164 = v13;
    int v73 = v13;
    char v163 = 1;
    char v162 = v189;
    LOBYTE(v13) = v189;
    unsigned __int8 v161 = v193;
    sub_100046E80(v8, v9, v14);
    swift_bridgeObjectRetain();
    sub_100046E80(v11, v12, v10);
    swift_bridgeObjectRetain();
    uint64_t v16 = v70;
    uint64_t v15 = v71;
    uint64_t v62 = a1;
    char v17 = v13;
    sub_100046E80(v71, v70, v13);
    swift_bridgeObjectRetain();
    uint64_t v19 = v67;
    uint64_t v18 = v68;
    char v20 = v66;
    sub_100046E80(v68, v67, v66);
    swift_bridgeObjectRetain();
    sub_100046EE0(v15, v16, v17);
    swift_bridgeObjectRelease();
    sub_100046EE0(v18, v19, v20);
    swift_bridgeObjectRelease();
    uint64_t v22 = v59;
    uint64_t v21 = v60;
    LOBYTE(v18) = v58;
    sub_100046EE0(v60, v59, v58);
    uint64_t v23 = v61;
    swift_bridgeObjectRelease();
    uint64_t v25 = v56;
    uint64_t v24 = v57;
    sub_100046EE0(v57, v56, v73);
    uint64_t v26 = v72;
    swift_bridgeObjectRelease();
    long long v166 = (unint64_t)v64;
    char v167 = 1;
    uint64_t v168 = v21;
    uint64_t v169 = v22;
    char v170 = v18;
    uint64_t v171 = v23;
    uint64_t v172 = v24;
    uint64_t v173 = v25;
    char v174 = v73;
    uint64_t v175 = v26;
    uint64_t v176 = v63;
    uint64_t v177 = 0;
    char v178 = 1;
    uint64_t v179 = v71;
    uint64_t v180 = v70;
    char v181 = v17;
    a1 = v62;
    uint64_t v182 = v69;
    uint64_t v183 = v68;
    uint64_t v184 = v67;
    char v185 = v66;
    uint64_t v186 = v65;
    nullsub_2(&v166);
  }
  else
  {
    sub_1000471F4(&v166);
  }
  sub_10003D0F4((uint64_t)&v166, (uint64_t)&v187, &qword_10008FAC0);
  long long v166 = *(_OWORD *)(a1 + 56);
  sub_10003CCA4(&qword_10008F9E8);
  State.wrappedValue.getter();
  if (LOBYTE(v165[0]) == 1)
  {
    uint64_t v27 = static VerticalAlignment.center.getter();
    char v28 = v122;
    uint64_t *v122 = v27;
    v28[1] = 0;
    *((unsigned char *)v28 + 16) = 1;
    sub_10003CCA4(&qword_10008FAD8);
    sub_10003CCA4(&qword_10008FAE0);
    sub_10004880C(&qword_10008FAE8, &qword_10008FAE0);
    ProgressView<>.init(label:)();
    uint64_t v29 = sub_10003CCA4(&qword_10008FAC8);
    (*(void (**)(uint64_t *, void, uint64_t, uint64_t))(*(void *)(v29 - 8) + 56))(v28, 0, 1, v29);
  }
  else
  {
    uint64_t v30 = sub_10003CCA4(&qword_10008FAC8);
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(void *)(v30 - 8) + 56))(v122, 1, 1, v30);
  }
  char v31 = v82;
  char v164 = v83;
  char v32 = v83;
  char v163 = v109;
  char v162 = v82;
  unsigned __int8 v161 = v101;
  char v160 = v98;
  char v159 = v103;
  char v158 = v99;
  char v157 = v105;
  char v156 = v100;
  char v155 = v107;
  char v154 = v102;
  char v153 = v108;
  char v152 = v104;
  char v151 = v110;
  char v150 = v106;
  char v149 = v111;
  sub_10003D0F4((uint64_t)&v187, (uint64_t)v148, &qword_10008FAC0);
  sub_100048434((uint64_t)v122, v126, &qword_10008FAB8);
  *(void *)(a2 + 88) = v80;
  *(void *)(a2 + 176) = v79;
  *(void *)(a2 + 264) = v78;
  *(void *)(a2 + 352) = v77;
  *(void *)(a2 + 440) = v76;
  *(void *)(a2 + 528) = v75;
  *(void *)(a2 + 616) = v74;
  *(unsigned char *)(a2 + 16) = 1;
  *(unsigned char *)(a2 + 104) = 1;
  *(unsigned char *)(a2 + 192) = 1;
  *(unsigned char *)(a2 + 280) = 1;
  *(unsigned char *)(a2 + 368) = 1;
  *(unsigned char *)(a2 + 456) = 1;
  *(unsigned char *)(a2 + 544) = 1;
  *(unsigned char *)(a2 + 632) = 1;
  *(void *)a2 = v81;
  *(void *)(a2 + 8) = 0;
  *(void *)(a2 + 80) = v147;
  *(void *)(a2 + 168) = v146;
  *(void *)(a2 + 256) = v140;
  *(void *)(a2 + 344) = v135;
  *(void *)(a2 + 432) = v129;
  uint64_t v33 = v93;
  uint64_t v34 = v94;
  *(void *)(a2 + 24) = v94;
  *(void *)(a2 + 32) = v33;
  *(unsigned char *)(a2 + 40) = v32;
  uint64_t v35 = v96;
  uint64_t v36 = v97;
  *(void *)(a2 + 48) = v95;
  *(void *)(a2 + 56) = v36;
  *(void *)(a2 + 64) = v35;
  *(unsigned char *)(a2 + 72) = v109;
  *(void *)(a2 + 96) = 0;
  uint64_t v37 = v141;
  *(void *)(a2 + 112) = v142;
  *(void *)(a2 + 120) = v37;
  *(unsigned char *)(a2 + 128) = v31;
  uint64_t v38 = v145;
  *(void *)(a2 + 136) = v143;
  *(void *)(a2 + 144) = v38;
  *(void *)(a2 + 152) = v144;
  *(unsigned char *)(a2 + 160) = v101;
  *(void *)(a2 + 184) = 0;
  uint64_t v39 = v136;
  *(void *)(a2 + 200) = v137;
  *(void *)(a2 + 208) = v39;
  *(unsigned char *)(a2 + 216) = v98;
  uint64_t v40 = v139;
  *(void *)(a2 + 224) = v138;
  *(void *)(a2 + 232) = v40;
  uint64_t v41 = v92;
  *(void *)(a2 + 240) = v92;
  *(unsigned char *)(a2 + 248) = v103;
  *(void *)(a2 + 272) = 0;
  uint64_t v42 = v130;
  *(void *)(a2 + 288) = v131;
  *(void *)(a2 + 296) = v42;
  *(unsigned char *)(a2 + 304) = v99;
  uint64_t v43 = v134;
  *(void *)(a2 + 312) = v132;
  *(void *)(a2 + 320) = v43;
  *(void *)(a2 + 328) = v133;
  *(unsigned char *)(a2 + 336) = v105;
  *(void *)(a2 + 360) = 0;
  uint64_t v44 = v123;
  *(void *)(a2 + 376) = v124;
  *(void *)(a2 + 384) = v44;
  *(unsigned char *)(a2 + 392) = v100;
  uint64_t v45 = v128;
  *(void *)(a2 + 400) = v125;
  *(void *)(a2 + 408) = v45;
  *(void *)(a2 + 416) = v127;
  *(unsigned char *)(a2 + 424) = v107;
  *(void *)(a2 + 448) = 0;
  uint64_t v46 = v116;
  *(void *)(a2 + 464) = v117;
  *(void *)(a2 + 472) = v46;
  *(unsigned char *)(a2 + 480) = v102;
  uint64_t v47 = v120;
  *(void *)(a2 + 488) = v118;
  *(void *)(a2 + 496) = v47;
  *(void *)(a2 + 504) = v119;
  *(unsigned char *)(a2 + 512) = v108;
  *(void *)(a2 + 520) = v121;
  *(void *)(a2 + 536) = 0;
  *(void *)(a2 + 552) = v91;
  *(void *)(a2 + 560) = v90;
  *(unsigned char *)(a2 + 568) = v104;
  *(void *)(a2 + 576) = v112;
  *(void *)(a2 + 584) = v114;
  *(void *)(a2 + 592) = v113;
  *(unsigned char *)(a2 + 600) = v110;
  *(void *)(a2 + 608) = v115;
  *(void *)(a2 + 624) = 0;
  *(void *)(a2 + 640) = v85;
  *(void *)(a2 + 648) = v84;
  *(unsigned char *)(a2 + 656) = v106;
  *(void *)(a2 + 664) = v86;
  *(void *)(a2 + 672) = v88;
  *(void *)(a2 + 680) = v87;
  *(unsigned char *)(a2 + 688) = v111;
  *(void *)(a2 + 696) = v89;
  sub_10003D0F4((uint64_t)v148, (uint64_t)v165, &qword_10008FAC0);
  sub_10003D0F4((uint64_t)v165, a2 + 704, &qword_10008FAC0);
  uint64_t v48 = sub_10003CCA4(&qword_10008FAD0);
  sub_100048434(v126, a2 + *(int *)(v48 + 176), &qword_10008FAB8);
  sub_100046E80(v34, v33, v83);
  swift_bridgeObjectRetain();
  sub_100046E80(v36, v35, v109);
  swift_bridgeObjectRetain();
  sub_100046E80(v142, v141, v82);
  swift_bridgeObjectRetain();
  sub_100046E80(v145, v144, v101);
  swift_bridgeObjectRetain();
  sub_100046E80(v137, v136, v98);
  swift_bridgeObjectRetain();
  sub_100046E80(v139, v41, v103);
  swift_bridgeObjectRetain();
  sub_100046E80(v131, v130, v99);
  swift_bridgeObjectRetain();
  sub_100046E80(v134, v133, v105);
  swift_bridgeObjectRetain();
  sub_100046E80(v124, v123, v100);
  swift_bridgeObjectRetain();
  sub_100046E80(v128, v127, v107);
  swift_bridgeObjectRetain();
  sub_100046E80(v117, v116, v102);
  swift_bridgeObjectRetain();
  sub_100046E80(v120, v119, v108);
  swift_bridgeObjectRetain();
  uint64_t v50 = v90;
  uint64_t v49 = v91;
  sub_100046E80(v91, v90, v104);
  swift_bridgeObjectRetain();
  sub_100046E80(v114, v113, v110);
  swift_bridgeObjectRetain();
  uint64_t v51 = v84;
  uint64_t v52 = v85;
  sub_100046E80(v85, v84, v106);
  swift_bridgeObjectRetain();
  uint64_t v53 = v87;
  uint64_t v54 = v88;
  sub_100046E80(v88, v87, v111);
  swift_bridgeObjectRetain();
  sub_100047304(v165, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100047214);
  sub_1000483D8((uint64_t)v122, &qword_10008FAB8);
  sub_1000483D8(v126, &qword_10008FAB8);
  sub_10003D0F4((uint64_t)v148, (uint64_t)&v166, &qword_10008FAC0);
  sub_100047304(&v166, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100047370);
  LOBYTE(v33) = v149;
  sub_100046EE0(v52, v51, v150);
  swift_bridgeObjectRelease();
  sub_100046EE0(v54, v53, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v151;
  sub_100046EE0(v49, v50, v152);
  swift_bridgeObjectRelease();
  sub_100046EE0(v114, v113, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v153;
  sub_100046EE0(v117, v116, v154);
  swift_bridgeObjectRelease();
  sub_100046EE0(v120, v119, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v155;
  sub_100046EE0(v124, v123, v156);
  swift_bridgeObjectRelease();
  sub_100046EE0(v128, v127, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v157;
  sub_100046EE0(v131, v130, v158);
  swift_bridgeObjectRelease();
  sub_100046EE0(v134, v133, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v159;
  sub_100046EE0(v137, v136, v160);
  swift_bridgeObjectRelease();
  sub_100046EE0(v139, v92, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v161;
  sub_100046EE0(v142, v141, v162);
  swift_bridgeObjectRelease();
  sub_100046EE0(v145, v144, v33);
  swift_bridgeObjectRelease();
  LOBYTE(v33) = v163;
  sub_100046EE0(v94, v93, v164);
  swift_bridgeObjectRelease();
  sub_100046EE0(v97, v96, v33);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003F318@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  *(_OWORD *)a2 = xmmword_100059D30;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = v3;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0x3A646C697542, 0xE600000000000000, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v2, v3, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100046EE0(v2, v3, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0x3A646C697542, 0xE600000000000000, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003F3EC@<X0>(uint64_t a1@<X8>)
{
  _StringGuts.grow(_:)(19);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x202F20424D20;
  v5._object = (void *)0xE600000000000000;
  String.append(_:)(v5);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x2820424D20;
  v7._object = (void *)0xE500000000000000;
  String.append(_:)(v7);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10533;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  *(_OWORD *)a1 = xmmword_100059D40;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0x617053206B736944, 0xEB000000003A6563, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v2, v4, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v2, v4, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0x617053206B736944, 0xEB000000003A6563, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003F6D0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 48);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = (uint64_t *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
  swift_bridgeObjectRetain();
  uint64_t v5 = String.count.getter();
  swift_bridgeObjectRelease();
  if (v5 < 1)
  {
    uint64_t v6 = 0xE600000000000000;
    uint64_t v7 = 0x29656E6F4E28;
  }
  else
  {
    swift_getKeyPath();
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v7 = *v4;
    uint64_t v6 = v4[1];
    swift_bridgeObjectRetain();
  }
  *(_OWORD *)a2 = xmmword_100059D50;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v7;
  *(void *)(a2 + 40) = v6;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0x74654E2069466957, 0xED00003A6B726F77, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v7, v6, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v7, v6, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0x74654E2069466957, 0xED00003A6B726F77, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003F8C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  if (String.count.getter() < 1)
  {
    uint64_t v3 = 0xE700000000000000;
    uint64_t v4 = 0x6E776F6E6B6E55;
  }
  else
  {
    swift_bridgeObjectRetain();
  }
  *(_OWORD *)a2 = xmmword_100059D60;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v3;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0x3A656C61636F4CLL, 0xE700000000000000, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v4, v3, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v4, v3, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0x3A656C61636F4CLL, 0xE700000000000000, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003F9CC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 48);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning)) {
    uint64_t v4 = 7562585;
  }
  else {
    uint64_t v4 = 28494;
  }
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning)) {
    uint64_t v5 = 0xE300000000000000;
  }
  else {
    uint64_t v5 = 0xE200000000000000;
  }
  *(void *)a2 = 0xD000000000000014;
  *(void *)(a2 + 8) = 0x8000000100070E30;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD000000000000014, 0x8000000100070E30, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v4, v5, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v4, v5, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD000000000000014, 0x8000000100070E30, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FB40@<X0>(unsigned char *a1@<X0>, uint64_t a2@<X8>)
{
  if (*a1) {
    uint64_t v2 = 7562585;
  }
  else {
    uint64_t v2 = 28494;
  }
  if (*a1) {
    uint64_t v3 = 0xE300000000000000;
  }
  else {
    uint64_t v3 = 0xE200000000000000;
  }
  *(void *)a2 = 0xD000000000000017;
  *(void *)(a2 + 8) = 0x8000000100070E10;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = v3;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD000000000000017, 0x8000000100070E10, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v2, v3, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v2, v3, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD000000000000017, 0x8000000100070E10, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FC34@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  if (*(unsigned char *)(a1 + 24)) {
    uint64_t v2 = 7562585;
  }
  else {
    uint64_t v2 = 28494;
  }
  if (*(unsigned char *)(a1 + 24)) {
    uint64_t v3 = 0xE300000000000000;
  }
  else {
    uint64_t v3 = 0xE200000000000000;
  }
  *(void *)a2 = 0xD000000000000011;
  *(void *)(a2 + 8) = 0x8000000100070DF0;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v2;
  *(void *)(a2 + 40) = v3;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD000000000000011, 0x8000000100070DF0, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v2, v3, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v2, v3, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD000000000000011, 0x8000000100070DF0, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FD28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 48);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected)) {
    uint64_t v4 = 7562585;
  }
  else {
    uint64_t v4 = 28494;
  }
  if (*(unsigned char *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected)) {
    uint64_t v5 = 0xE300000000000000;
  }
  else {
    uint64_t v5 = 0xE200000000000000;
  }
  *(void *)a2 = 0xD00000000000001BLL;
  *(void *)(a2 + 8) = 0x8000000100070DD0;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD00000000000001BLL, 0x8000000100070DD0, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v4, v5, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v4, v5, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD00000000000001BLL, 0x8000000100070DD0, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FE9C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3 = *(void *)(a1 + 48);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
  uint64_t v5 = *(void *)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName + 8);
  *(void *)a2 = 0xD00000000000001DLL;
  *(void *)(a2 + 8) = 0x8000000100070D60;
  *(unsigned char *)(a2 + 16) = 0;
  *(void *)(a2 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a2 + 32) = v4;
  *(void *)(a2 + 40) = v5;
  *(unsigned char *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD00000000000001DLL, 0x8000000100070D60, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v4, v5, 0);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_100046EE0(v4, v5, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD00000000000001DLL, 0x8000000100070D60, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_10003FFFC@<X0>(uint64_t a1@<X8>)
{
  _StringGuts.grow(_:)(19);
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v2 = dispatch thunk of CustomStringConvertible.description.getter();
  uint64_t v4 = v3;
  swift_bridgeObjectRelease();
  v5._countAndFlagsBits = 0x202F20424D20;
  v5._object = (void *)0xE600000000000000;
  String.append(_:)(v5);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v6._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v6);
  swift_bridgeObjectRelease();
  v7._countAndFlagsBits = 0x2820424D20;
  v7._object = (void *)0xE500000000000000;
  String.append(_:)(v7);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  v8._countAndFlagsBits = dispatch thunk of CustomStringConvertible.description.getter();
  String.append(_:)(v8);
  swift_bridgeObjectRelease();
  v9._countAndFlagsBits = 10533;
  v9._object = (void *)0xE200000000000000;
  String.append(_:)(v9);
  *(void *)a1 = 0xD000000000000017;
  *(void *)(a1 + 8) = 0x8000000100070D40;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 32) = v2;
  *(void *)(a1 + 40) = v4;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD000000000000017, 0x8000000100070D40, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(v2, v4, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(v2, v4, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD000000000000017, 0x8000000100070D40, 0);
  return swift_bridgeObjectRelease();
}

__n128 sub_1000402D0@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v2 = static HorizontalAlignment.center.getter();
  sub_100040344((uint64_t)&v9);
  char v3 = v10;
  uint64_t v4 = v11;
  char v5 = v13;
  uint64_t v6 = v14;
  __n128 result = v9;
  long long v8 = v12;
  *(void *)a1 = v2;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(__n128 *)(a1 + 24) = result;
  *(unsigned char *)(a1 + 40) = v3;
  *(void *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 56) = v8;
  *(unsigned char *)(a1 + 72) = v5;
  *(void *)(a1 + 80) = v6;
  return result;
}

uint64_t sub_100040344@<X0>(uint64_t a1@<X8>)
{
  *(void *)a1 = 0xD000000000000024;
  *(void *)(a1 + 8) = 0x8000000100070D80;
  *(void *)(a1 + 24) = &_swiftEmptyArrayStorage;
  *(void *)(a1 + 32) = 0xD000000000000014;
  *(unsigned char *)(a1 + 16) = 0;
  *(void *)(a1 + 40) = 0x8000000100070DB0;
  *(unsigned char *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = &_swiftEmptyArrayStorage;
  sub_100046E80(0xD000000000000024, 0x8000000100070D80, 0);
  swift_bridgeObjectRetain();
  sub_100046E80(0xD000000000000014, 0x8000000100070DB0, 0);
  swift_bridgeObjectRetain();
  sub_100046EE0(0xD000000000000014, 0x8000000100070DB0, 0);
  swift_bridgeObjectRelease();
  sub_100046EE0(0xD000000000000024, 0x8000000100070D80, 0);

  return swift_bridgeObjectRelease();
}

uint64_t sub_100040428@<X0>(_OWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v56 = a2;
  uint64_t v3 = sub_10003CCA4(&qword_10008FA60);
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v53 = (char *)&v48 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  long long v8 = (char *)&v48 - v7;
  uint64_t v57 = sub_10003CCA4(&qword_10008FA68);
  uint64_t v9 = __chkstk_darwin(v57);
  uint64_t v55 = (uint64_t)&v48 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v54 = (char *)&v48 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v52 = (uint64_t)&v48 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  char v17 = (char *)&v48 - v16;
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v48 - v18;
  char v20 = (_OWORD *)swift_allocObject();
  long long v21 = a1[5];
  v20[5] = a1[4];
  v20[6] = v21;
  v20[7] = a1[6];
  long long v22 = a1[1];
  v20[1] = *a1;
  v20[2] = v22;
  long long v23 = a1[3];
  v20[3] = a1[2];
  v20[4] = v23;
  int v58 = a1;
  sub_100046D5C((uint64_t)a1);
  uint64_t v24 = type metadata accessor for TestButtonLabel(0);
  uint64_t v50 = sub_100046F78(&qword_10008FA70, (void (*)(uint64_t))type metadata accessor for TestButtonLabel);
  uint64_t v51 = v24;
  Button.init(action:label:)();
  uint64_t v25 = *((void *)a1 + 6);
  swift_getKeyPath();
  *(void *)&long long v59 = v25;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v25 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1)
  {
    long long v59 = *(_OWORD *)((char *)a1 + 56);
    sub_10003CCA4(&qword_10008F9E8);
    State.wrappedValue.getter();
    char v26 = v60;
  }
  else
  {
    char v26 = 1;
  }
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v28 = swift_allocObject();
  *(unsigned char *)(v28 + 16) = v26;
  uint64_t v49 = *(void (**)(char *, char *, uint64_t))(v4 + 16);
  v49(v17, v8, v3);
  uint64_t v29 = (uint64_t *)&v17[*(int *)(v57 + 36)];
  *uint64_t v29 = KeyPath;
  v29[1] = (uint64_t)sub_100047028;
  v29[2] = v28;
  uint64_t v30 = *(void (**)(char *, uint64_t))(v4 + 8);
  v30(v8, v3);
  sub_10003D0F4((uint64_t)v17, (uint64_t)v19, &qword_10008FA68);
  char v31 = (_OWORD *)swift_allocObject();
  uint64_t v48 = v19;
  uint64_t v32 = v3;
  long long v33 = a1[5];
  v31[5] = a1[4];
  v31[6] = v33;
  v31[7] = a1[6];
  long long v34 = a1[1];
  v31[1] = *a1;
  v31[2] = v34;
  long long v35 = a1[3];
  v31[3] = a1[2];
  void v31[4] = v35;
  __chkstk_darwin(v31);
  *(&v48 - 2) = (char *)a1;
  sub_100046D5C((uint64_t)a1);
  uint64_t v36 = v53;
  Button.init(action:label:)();
  long long v59 = *(_OWORD *)((char *)a1 + 56);
  sub_10003CCA4(&qword_10008F9E8);
  State.wrappedValue.getter();
  char v37 = v60;
  uint64_t v38 = swift_getKeyPath();
  uint64_t v39 = swift_allocObject();
  *(unsigned char *)(v39 + 16) = v37;
  uint64_t v40 = (uint64_t)v54;
  v49(v54, v36, v32);
  uint64_t v41 = (uint64_t *)(v40 + *(int *)(v57 + 36));
  uint64_t *v41 = v38;
  v41[1] = (uint64_t)sub_1000488F8;
  v41[2] = v39;
  v30(v36, v32);
  uint64_t v42 = v52;
  sub_10003D0F4(v40, v52, &qword_10008FA68);
  uint64_t v43 = (uint64_t)v48;
  sub_100048434((uint64_t)v48, v40, &qword_10008FA68);
  uint64_t v44 = v55;
  sub_100048434(v42, v55, &qword_10008FA68);
  uint64_t v45 = v56;
  sub_100048434(v40, v56, &qword_10008FA68);
  uint64_t v46 = sub_10003CCA4(&qword_10008FA78);
  sub_100048434(v44, v45 + *(int *)(v46 + 48), &qword_10008FA68);
  sub_1000483D8(v42, &qword_10008FA68);
  sub_1000483D8(v43, &qword_10008FA68);
  sub_1000483D8(v44, &qword_10008FA68);
  return sub_1000483D8(v40, &qword_10008FA68);
}

uint64_t sub_100040A08()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v26 = *(void *)(v2 - 8);
  uint64_t v27 = v2;
  __chkstk_darwin(v2);
  uint64_t v4 = (char *)&v24 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = type metadata accessor for DispatchQoS();
  uint64_t v24 = *(void *)(v5 - 8);
  uint64_t v25 = v5;
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS.QoSClass();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *(void *)(v0 + 48);
  swift_getKeyPath();
  *(void *)&long long aBlock = v12;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1
    && ((swift_getKeyPath(),
         *(void *)&long long aBlock = v12,
         ObservationRegistrar.access<A, B>(_:keyPath:)(),
         swift_release(),
         unint64_t v13 = *(void *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath + 8),
         (v13 & 0x2000000000000000) != 0)
      ? (uint64_t v14 = HIBYTE(v13) & 0xF)
      : (uint64_t v14 = *(void *)(v12 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath) & 0xFFFFFFFFFFFFLL),
        v14))
  {
    long long aBlock = *(_OWORD *)(v0 + 56);
    LOBYTE(v33) = 1;
    sub_10003CCA4(&qword_10008F9E8);
    State.wrappedValue.setter();
    sub_1000470F0(0, &qword_10008FA90);
    (*(void (**)(char *, void, uint64_t))(v9 + 104))(v11, enum case for DispatchQoS.QoSClass.background(_:), v8);
    uint64_t v15 = (void *)static OS_dispatch_queue.global(qos:)();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v16 = (_OWORD *)swift_allocObject();
    long long v17 = *(_OWORD *)(v0 + 80);
    void v16[5] = *(_OWORD *)(v0 + 64);
    v16[6] = v17;
    v16[7] = *(_OWORD *)(v0 + 96);
    long long v18 = *(_OWORD *)(v0 + 16);
    v16[1] = *(_OWORD *)v0;
    v16[2] = v18;
    long long v19 = *(_OWORD *)(v0 + 48);
    v16[3] = *(_OWORD *)(v0 + 32);
    void v16[4] = v19;
    char v31 = sub_100047198;
    uint64_t v32 = v16;
    *(void *)&long long aBlock = _NSConcreteStackBlock;
    *((void *)&aBlock + 1) = 1107296256;
    uint64_t v29 = sub_100041BF4;
    uint64_t v30 = &unk_10007A9D0;
    char v20 = _Block_copy(&aBlock);
    sub_100046D5C(v0);
    static DispatchQoS.unspecified.getter();
    long long v33 = &_swiftEmptyArrayStorage;
    sub_100046F78(&qword_10008FA98, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_10003CCA4(&qword_10008FAA0);
    sub_10004880C(&qword_10008FAA8, &qword_10008FAA0);
    uint64_t v21 = v27;
    dispatch thunk of SetAlgebra.init<A>(_:)();
    OS_dispatch_queue.async(group:qos:flags:execute:)();
    _Block_release(v20);

    (*(void (**)(char *, uint64_t))(v26 + 8))(v4, v21);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v7, v25);
    return swift_release();
  }
  else
  {
    sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
    long long v23 = (void *)static OS_os_log.default.getter();
    static os_log_type_t.default.getter();
    os_log(_:dso:log:type:_:)();

    long long aBlock = *(_OWORD *)(v1 + 88);
    uint64_t v29 = *(uint64_t (**)(uint64_t))(v1 + 104);
    long long v33 = (void *)0xD00000000000002CLL;
    unint64_t v34 = 0x80000001000709F0;
    sub_10003CCA4(&qword_10008F9E0);
    State.wrappedValue.setter();
    long long aBlock = *(_OWORD *)(v1 + 72);
    LOBYTE(v33) = 1;
    sub_10003CCA4(&qword_10008F9E8);
    return State.wrappedValue.setter();
  }
}

uint64_t sub_100040F90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TestButtonLabel(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (void *)((char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v7 = *(void *)(a1 + 48);
  swift_getKeyPath();
  *(void *)&long long v12 = v7;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  if (*(unsigned char *)(v7 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) == 1
    && (long long v12 = *(_OWORD *)(a1 + 56), sub_10003CCA4(&qword_10008F9E8), State.wrappedValue.getter(), (v13 & 1) == 0))
  {
    uint64_t v8 = static Color.blue.getter();
  }
  else
  {
    uint64_t v8 = static Color.gray.getter();
  }
  uint64_t v9 = v8;
  uint64_t v10 = static Color.white.getter();
  *(void *)((char *)v6 + *(int *)(v4 + 28)) = swift_getKeyPath();
  sub_10003CCA4(&qword_10008FA80);
  swift_storeEnumTagMultiPayload();
  void *v6 = 0xD000000000000023;
  v6[1] = 0x8000000100070990;
  v6[2] = v9;
  v6[3] = v10;
  return sub_10004708C((uint64_t)v6, a2);
}

void sub_100041144()
{
  id v0 = [self defaultCenter];
  id v1 = v0;
  if (qword_10008F7B8 != -1)
  {
    swift_once();
    id v0 = v1;
  }
  [v0 postNotificationName:qword_1000902F8 object:0];
}

uint64_t sub_1000411E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = type metadata accessor for TestButtonLabel(0);
  __chkstk_darwin(v4);
  uint64_t v6 = (void *)((char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  static Color.white.getter();
  uint64_t v7 = Color.opacity(_:)();
  swift_release();
  long long v11 = *(_OWORD *)(a1 + 56);
  sub_10003CCA4(&qword_10008F9E8);
  State.wrappedValue.getter();
  if (v12 == 1) {
    uint64_t v8 = static Color.gray.getter();
  }
  else {
    uint64_t v8 = static Color.blue.getter();
  }
  uint64_t v9 = v8;
  *(void *)((char *)v6 + *(int *)(v4 + 28)) = swift_getKeyPath();
  sub_10003CCA4(&qword_10008FA80);
  swift_storeEnumTagMultiPayload();
  void *v6 = 0x6265442074697845;
  v6[1] = 0xEF6F666E49206775;
  v6[2] = v7;
  v6[3] = v9;
  return sub_10004708C((uint64_t)v6, a2);
}

uint64_t sub_10004132C(_OWORD *a1)
{
  uint64_t v2 = sub_10003CCA4(&qword_10008FA10);
  __chkstk_darwin(v2 - 8);
  uint64_t v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  LocalizedStringKey.init(stringLiteral:)();
  static ButtonRole.cancel.getter();
  uint64_t v5 = type metadata accessor for ButtonRole();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v5 - 8) + 56))(v4, 0, 1, v5);
  uint64_t v6 = (_OWORD *)swift_allocObject();
  long long v7 = a1[5];
  void v6[5] = a1[4];
  v6[6] = v7;
  v6[7] = a1[6];
  long long v8 = a1[1];
  v6[1] = *a1;
  v6[2] = v8;
  long long v9 = a1[3];
  v6[3] = a1[2];
  void v6[4] = v9;
  sub_100046D5C((uint64_t)a1);
  return Button<>.init(_:role:action:)();
}

uint64_t sub_10004148C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  swift_getKeyPath();
  *(void *)&long long v37 = v2;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  long long v35 = (void *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
  uint64_t v3 = *(void *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath + 8);
  *(void *)&long long v37 = *(void *)(v2 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
  *((void *)&v37 + 1) = v3;
  swift_bridgeObjectRetain();
  v4._countAndFlagsBits = 0x2F73676F4C2FLL;
  v4._object = (void *)0xE600000000000000;
  String.append(_:)(v4);
  long long v5 = v37;
  uint64_t v6 = self;
  id v7 = [v6 defaultManager];
  NSString v8 = String._bridgeToObjectiveC()();
  unsigned int v9 = [v7 fileExistsAtPath:v8];

  uint64_t v36 = a1;
  if (!v9) {
    goto LABEL_3;
  }
  sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
  uint64_t v10 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  id v11 = [v6 defaultManager];
  NSString v12 = String._bridgeToObjectiveC()();
  *(void *)&long long v37 = 0;
  unsigned int v13 = [v11 removeItemAtPath:v12 error:&v37];

  id v14 = (id)v37;
  if (!v13)
  {
    uint64_t v26 = v14;
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_3:
    sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
    swift_bridgeObjectRetain();
    uint64_t v15 = static OS_os_log.default.getter();
    os_log_type_t v16 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v15, v16))
    {
      uint64_t v34 = v2;
      long long v17 = (uint8_t *)swift_slowAlloc();
      *(void *)&long long v37 = swift_slowAlloc();
      *(_DWORD *)long long v17 = 136315138;
      swift_bridgeObjectRetain();
      sub_10004617C(v5, *((unint64_t *)&v5 + 1), (uint64_t *)&v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "Copying logs to %s", v17, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v2 = v34;
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    id v18 = [v6 defaultManager];
    NSString v19 = String._bridgeToObjectiveC()();
    swift_getKeyPath();
    *(void *)&long long v37 = v2;
    ObservationRegistrar.access<A, B>(_:keyPath:)();
    swift_release();
    uint64_t v20 = v35[1];
    *(void *)&long long v37 = *v35;
    *((void *)&v37 + 1) = v20;
    swift_bridgeObjectRetain();
    v21._countAndFlagsBits = 0x2F73676F4C2FLL;
    v21._object = (void *)0xE600000000000000;
    String.append(_:)(v21);
    NSString v22 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    *(void *)&long long v37 = 0;
    unsigned int v23 = [v18 copyItemAtPath:v19 toPath:v22 error:&v37];

    id v24 = (id)v37;
    if (v23)
    {
      uint64_t v25 = v36;
      long long v37 = *(_OWORD *)(v36 + 88);
      uint64_t v38 = *(void *)(v36 + 104);
      sub_10003CCA4(&qword_10008F9E0);
      State.wrappedValue.setter();
      long long v37 = *(_OWORD *)(v36 + 72);
      sub_10003CCA4(&qword_10008F9E8);
      State.wrappedValue.setter();
      goto LABEL_14;
    }
    uint64_t v26 = v24;
  }
  _convertNSErrorToError(_:)();

  swift_willThrow();
  sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
  swift_errorRetain();
  swift_errorRetain();
  uint64_t v27 = static OS_os_log.default.getter();
  os_log_type_t v28 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = (uint8_t *)swift_slowAlloc();
    *(void *)&long long v37 = swift_slowAlloc();
    *(_DWORD *)uint64_t v29 = 136315138;
    swift_getErrorValue();
    uint64_t v30 = Error.localizedDescription.getter();
    sub_10004617C(v30, v31, (uint64_t *)&v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Failed to copy log files - %s", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }
  *(void *)&long long v37 = 0;
  *((void *)&v37 + 1) = 0xE000000000000000;
  _StringGuts.grow(_:)(28);
  swift_bridgeObjectRelease();
  *(void *)&long long v37 = 0xD00000000000001ALL;
  *((void *)&v37 + 1) = 0x8000000100070A50;
  swift_getErrorValue();
  v32._countAndFlagsBits = Error.localizedDescription.getter();
  String.append(_:)(v32);
  swift_bridgeObjectRelease();
  uint64_t v25 = v36;
  long long v37 = *(_OWORD *)(v36 + 88);
  uint64_t v38 = *(void *)(v36 + 104);
  sub_10003CCA4(&qword_10008F9E0);
  State.wrappedValue.setter();
  long long v37 = *(_OWORD *)(v36 + 72);
  sub_10003CCA4(&qword_10008F9E8);
  State.wrappedValue.setter();
  swift_errorRelease();
LABEL_14:
  long long v37 = *(_OWORD *)(v25 + 56);
  sub_10003CCA4(&qword_10008F9E8);
  return State.wrappedValue.setter();
}

uint64_t sub_100041BF4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100041C40()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100041C5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_10003CCA4(&qword_10008F9B8);
  __chkstk_darwin(v3 - 8);
  long long v5 = (uint64_t *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  long long v6 = v1[5];
  void v12[4] = v1[4];
  v12[5] = v6;
  v12[6] = v1[6];
  long long v7 = v1[1];
  v12[0] = *v1;
  v12[1] = v7;
  long long v8 = v1[3];
  v12[2] = v1[2];
  v12[3] = v8;
  uint64_t *v5 = static Alignment.center.getter();
  v5[1] = v9;
  sub_10003CCA4(&qword_10008F9C0);
  sub_10003DD0C((uint64_t)v12);
  char v10 = static Edge.Set.all.getter();
  sub_100048434((uint64_t)v5, a1, &qword_10008F9B8);
  *(unsigned char *)(a1 + *(int *)(sub_10003CCA4(&qword_10008F9C8) + 36)) = v10;
  return sub_1000483D8((uint64_t)v5, &qword_10008F9B8);
}

uint64_t sub_100041D54@<X0>(uint64_t a1@<X8>)
{
  uint64_t v82 = a1;
  uint64_t v78 = sub_10003CCA4(&qword_10008FBA8);
  __chkstk_darwin(v78);
  uint64_t v80 = (uint64_t)&v67 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = type metadata accessor for RoundedRectangle();
  __chkstk_darwin(v74);
  uint64_t v79 = (char *)&v67 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_10003CCA4(&qword_10008FBB0);
  __chkstk_darwin(v4 - 8);
  uint64_t v72 = (char *)&v67 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for UserInterfaceSizeClass();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v68 = (char *)&v67 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_10003CCA4(&qword_10008FBB8);
  uint64_t v10 = v9 - 8;
  __chkstk_darwin(v9);
  NSString v12 = (char *)&v67 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10003CCA4(&qword_10008FA88);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  int v83 = (char *)&v67 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = __chkstk_darwin(v14);
  id v18 = (char *)&v67 - v17;
  __chkstk_darwin(v16);
  uint64_t v20 = (char *)&v67 - v19;
  uint64_t v71 = sub_10003CCA4(&qword_10008FBC0);
  __chkstk_darwin(v71);
  NSString v22 = (_OWORD *)((char *)&v67 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v73 = sub_10003CCA4(&qword_10008FBC8);
  __chkstk_darwin(v73);
  uint64_t v77 = (uint64_t)&v67 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v75 = sub_10003CCA4(&qword_10008FBD0);
  __chkstk_darwin(v75);
  uint64_t v76 = (uint64_t)&v67 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = v1[1];
  uint64_t v69 = *v1;
  type metadata accessor for TestButtonLabel(0);
  uint64_t v81 = v1;
  uint64_t v70 = v25;
  swift_bridgeObjectRetain();
  sub_100045E58((uint64_t)v20);
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v18, enum case for UserInterfaceSizeClass.compact(_:), v6);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v7 + 56))(v18, 0, 1, v6);
  uint64_t v26 = (uint64_t)&v12[*(int *)(v10 + 56)];
  sub_100048434((uint64_t)v20, (uint64_t)v12, &qword_10008FA88);
  sub_100048434((uint64_t)v18, v26, &qword_10008FA88);
  uint64_t v27 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
  if (v27((uint64_t)v12, 1, v6) == 1)
  {
    sub_1000483D8((uint64_t)v18, &qword_10008FA88);
    sub_1000483D8((uint64_t)v20, &qword_10008FA88);
    if (v27(v26, 1, v6) == 1)
    {
      sub_1000483D8((uint64_t)v12, &qword_10008FA88);
LABEL_8:
      double v31 = INFINITY;
      goto LABEL_10;
    }
    goto LABEL_6;
  }
  sub_100048434((uint64_t)v12, (uint64_t)v83, &qword_10008FA88);
  if (v27(v26, 1, v6) == 1)
  {
    sub_1000483D8((uint64_t)v18, &qword_10008FA88);
    sub_1000483D8((uint64_t)v20, &qword_10008FA88);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v83, v6);
LABEL_6:
    sub_1000483D8((uint64_t)v12, &qword_10008FBB8);
    goto LABEL_9;
  }
  os_log_type_t v28 = v68;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 32))(v68, v26, v6);
  sub_100046F78(&qword_10008FBD8, (void (*)(uint64_t))&type metadata accessor for UserInterfaceSizeClass);
  char v29 = dispatch thunk of static Equatable.== infix(_:_:)();
  uint64_t v30 = *(void (**)(char *, uint64_t))(v7 + 8);
  v30(v28, v6);
  sub_1000483D8((uint64_t)v18, &qword_10008FA88);
  sub_1000483D8((uint64_t)v20, &qword_10008FA88);
  v30(v83, v6);
  sub_1000483D8((uint64_t)v12, &qword_10008FA88);
  if (v29) {
    goto LABEL_8;
  }
LABEL_9:
  double v31 = 350.0;
LABEL_10:
  uint64_t v32 = static Alignment.center.getter();
  sub_100042704(300.0, 0, 0.0, 1, v31, 0, 0.0, 1, (uint64_t)v84, 0.0, 1, 50.0, 0, v32, v33, v69, v70, 0, (uint64_t)&_swiftEmptyArrayStorage);
  swift_bridgeObjectRelease();
  uint64_t v34 = v81;
  uint64_t v35 = v81[2];
  swift_retain();
  char v36 = static Edge.Set.all.getter();
  uint64_t v37 = enum case for Font.Design.default(_:);
  uint64_t v38 = type metadata accessor for Font.Design();
  uint64_t v39 = *(void *)(v38 - 8);
  uint64_t v40 = (uint64_t)v72;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 104))(v72, v37, v38);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v39 + 56))(v40, 0, 1, v38);
  uint64_t v41 = static Font.system(size:weight:design:)();
  sub_1000483D8(v40, &qword_10008FBB0);
  uint64_t KeyPath = swift_getKeyPath();
  long long v91 = v84[6];
  long long v92 = v84[7];
  long long v93 = v84[8];
  long long v87 = v84[2];
  long long v88 = v84[3];
  long long v89 = v84[4];
  long long v90 = v84[5];
  long long v85 = v84[0];
  long long v86 = v84[1];
  *(void *)&long long v94 = v35;
  BYTE8(v94) = v36;
  *(void *)&long long v95 = KeyPath;
  *((void *)&v95 + 1) = v41;
  uint64_t v43 = v79;
  uint64_t v44 = &v79[*(int *)(v74 + 20)];
  uint64_t v45 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v46 = type metadata accessor for RoundedCornerStyle();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v46 - 8) + 104))(v44, v45, v46);
  __asm { FMOV            V0.2D, #20.0 }
  _OWORD *v43 = _Q0;
  uint64_t v52 = v80;
  sub_1000481E0((uint64_t)v43, v80);
  *(_WORD *)(v52 + *(int *)(v78 + 36)) = 256;
  sub_100048434(v52, (uint64_t)v22 + *(int *)(v71 + 36), &qword_10008FBA8);
  long long v53 = v94;
  v22[8] = v93;
  v22[9] = v53;
  v22[10] = v95;
  long long v54 = v90;
  v22[4] = v89;
  v22[5] = v54;
  long long v55 = v92;
  v22[6] = v91;
  v22[7] = v55;
  long long v56 = v86;
  *NSString v22 = v85;
  v22[1] = v56;
  long long v57 = v88;
  v22[2] = v87;
  v22[3] = v57;
  sub_100048244((uint64_t)&v85);
  sub_1000483D8(v52, &qword_10008FBA8);
  sub_1000482B4((uint64_t)v43);
  sub_100048310((uint64_t)&v85);
  uint64_t v58 = v34[3];
  uint64_t v59 = swift_getKeyPath();
  uint64_t v60 = v77;
  sub_100048434((uint64_t)v22, v77, &qword_10008FBC0);
  uint64_t v61 = (uint64_t *)(v60 + *(int *)(v73 + 36));
  *uint64_t v61 = v59;
  v61[1] = v58;
  swift_retain();
  sub_1000483D8((uint64_t)v22, &qword_10008FBC0);
  LOBYTE(v43) = static Edge.Set.leading.getter();
  unsigned __int8 v62 = static Edge.Set.trailing.getter();
  char v63 = Edge.Set.init(rawValue:)();
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v43) {
    char v63 = Edge.Set.init(rawValue:)();
  }
  Edge.Set.init(rawValue:)();
  if (Edge.Set.init(rawValue:)() != v62) {
    char v63 = Edge.Set.init(rawValue:)();
  }
  uint64_t v64 = v76;
  sub_100048434(v60, v76, &qword_10008FBC8);
  uint64_t v65 = v64 + *(int *)(v75 + 36);
  *(unsigned char *)uint64_t v65 = v63;
  *(_OWORD *)(v65 + 8) = 0u;
  *(_OWORD *)(v65 + 24) = 0u;
  *(unsigned char *)(v65 + 40) = 1;
  sub_1000483D8(v60, &qword_10008FBC8);
  return sub_10003D0F4(v64, v82, &qword_10008FBD0);
}

uint64_t sub_100042704@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19)
{
  uint64_t v20 = a19;
  char v21 = a18;
  uint64_t v22 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    static os_log_type_t.fault.getter();
    double v31 = (void *)static Log.runtimeIssuesLog.getter();
    os_log(_:dso:log:_:_:)();

    char v21 = a18;
    uint64_t v20 = a19;
    uint64_t v22 = a17;
  }
  _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
  *(void *)a9 = a16;
  *(void *)(a9 + 8) = v22;
  *(unsigned char *)(a9 + 16) = v21 & 1;
  *(void *)(a9 + 24) = v20;
  *(_OWORD *)(a9 + 96) = v37;
  *(_OWORD *)(a9 + 112) = v38;
  *(_OWORD *)(a9 + 128) = v39;
  *(_OWORD *)(a9 + 32) = v33;
  *(_OWORD *)(a9 + 48) = v34;
  *(_OWORD *)(a9 + 64) = v35;
  *(_OWORD *)(a9 + 80) = v36;
  sub_100046E80(a16, v22, v21 & 1);

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000428FC()
{
  return sub_100042F68((uint64_t)&unk_100059FA0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
}

uint64_t sub_100042910()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000429F4()
{
  return sub_1000435C4((uint64_t)&unk_100059FC8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning);
}

uint64_t sub_100042A08()
{
  return swift_release();
}

uint64_t sub_100042AD8()
{
  return sub_100043390((uint64_t)&unk_100059F28, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize);
}

uint64_t sub_100042AEC()
{
  return swift_release();
}

uint64_t sub_100042BB8()
{
  return sub_100043390((uint64_t)&unk_100059F50, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed);
}

uint64_t sub_100042BCC()
{
  return swift_release();
}

uint64_t sub_100042C98()
{
  return sub_100043390((uint64_t)&unk_100059F78, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage);
}

uint64_t sub_100042CAC()
{
  return swift_release();
}

uint64_t sub_100042D78()
{
  return sub_1000435C4((uint64_t)&unk_100059F00, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected);
}

uint64_t sub_100042D8C()
{
  return swift_release();
}

uint64_t sub_100042E5C()
{
  return sub_100042F68((uint64_t)&unk_100059E38, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
}

uint64_t sub_100042E70()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_100042F54()
{
  return sub_100042F68((uint64_t)&unk_100059ED8, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
}

uint64_t sub_100042F68(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void *)(v2 + *a2);
  swift_bridgeObjectRetain();
  return v4;
}

uint64_t sub_10004301C@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v6 = (void *)(v5 + *a2);
  uint64_t v7 = v6[1];
  *a3 = *v6;
  a3[1] = v7;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1000430D8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_1000431BC()
{
  return sub_100043390((uint64_t)&unk_100059E60, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize);
}

uint64_t sub_1000431D0()
{
  return swift_release();
}

uint64_t sub_10004329C()
{
  return sub_100043390((uint64_t)&unk_100059E88, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed);
}

uint64_t sub_1000432B0()
{
  return swift_release();
}

uint64_t sub_10004337C()
{
  return sub_100043390((uint64_t)&unk_100059EB0, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage);
}

uint64_t sub_100043390(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(void *)(v2 + *a2);
}

uint64_t sub_100043430@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, void *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a3 = *(void *)(v5 + *a2);
  return result;
}

uint64_t sub_1000434E4()
{
  return swift_release();
}

uint64_t sub_1000435B0()
{
  return sub_1000435C4((uint64_t)&unk_100059E10, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady);
}

uint64_t sub_1000435C4(uint64_t a1, void *a2)
{
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  return *(unsigned __int8 *)(v2 + *a2);
}

uint64_t sub_100043664@<X0>(uint64_t *a1@<X0>, void *a2@<X4>, unsigned char *a3@<X8>)
{
  uint64_t v5 = *a1;
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  uint64_t result = swift_release();
  *a3 = *(unsigned char *)(v5 + *a2);
  return result;
}

uint64_t sub_100043718()
{
  return swift_release();
}

void *sub_1000437E8()
{
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  id v1 = *(void **)(v0 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  id v2 = v1;
  return v1;
}

id sub_100043898@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v4 = *(void **)(v3 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  *a2 = v4;

  return v4;
}

void sub_100043958(void **a1)
{
  id v1 = *a1;
  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  id v2 = v1;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
}

char *sub_100043A34()
{
  id v1 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork];
  *id v1 = 0;
  v1[1] = 0xE000000000000000;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage] = 0;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected] = 0;
  id v2 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath];
  void *v2 = 0;
  v2[1] = 0xE000000000000000;
  uint64_t v3 = &v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName];
  void *v3 = 0;
  v3[1] = 0xE000000000000000;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage] = 0;
  v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady] = 0;
  *(void *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer] = 0;
  uint64_t v4 = self;
  uint64_t v5 = v0;
  uint64_t result = (char *)[v4 sharedManager];
  if (result)
  {
    *(void *)&v5[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager] = result;
    ObservationRegistrar.init()();

    v17.receiver = v5;
    v17.super_class = (Class)type metadata accessor for DebugInfoState(0);
    uint64_t v7 = (char *)[super init];
    uint64_t v8 = *(void **)&v7[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager];
    uint64_t v9 = v7;
    [v8 addListener:v9];
    sub_10004431C();
    sub_1000444A4();
    sub_1000440A8();
    sub_10004481C();
    uint64_t v10 = self;
    uint64_t v11 = swift_allocObject();
    *(void *)(v11 + 16) = v9;
    aBlock[4] = sub_100045E10;
    aBlock[5] = v11;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100043D7C;
    aBlock[3] = &unk_10007A820;
    NSString v12 = _Block_copy(aBlock);
    uint64_t v13 = v9;
    swift_release();
    id v14 = [v10 scheduledTimerWithTimeInterval:1 repeats:v12 block:10.0];
    _Block_release(v12);
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    aBlock[0] = v13;
    sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    swift_release();
    return v13;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_100043D4C()
{
  return sub_10004481C();
}

void sub_100043D7C(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_100043E08()
{
  swift_getKeyPath();
  uint64_t v3 = v0;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  [*(id *)&v0[OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer] invalidate];
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DebugInfoState(0);
  return [super dealloc];
}

uint64_t sub_100044080()
{
  return type metadata accessor for DebugInfoState(0);
}

uint64_t type metadata accessor for DebugInfoState(uint64_t a1)
{
  return sub_100046F40(a1, qword_10008F958);
}

void sub_1000440A8()
{
  id v1 = [self sharedInstance];
  if (v1)
  {
    id v7 = v1;
    id v2 = [v1 systemServicesDelegate];
    if (v2)
    {
      uint64_t v3 = v2;
      uint64_t v4 = swift_allocObject();
      *(void *)(v4 + 16) = v0;
      aBlock[4] = sub_100045D8C;
      aBlock[5] = v4;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1000442C8;
      aBlock[3] = &unk_10007A7D0;
      uint64_t v5 = _Block_copy(aBlock);
      id v6 = v0;
      swift_release();
      [v3 diagnosticsRunning:v5];
      _Block_release(v5);

      swift_unknownObjectRelease();
    }
    else
    {
    }
  }
}

uint64_t sub_1000441F8()
{
  return swift_release();
}

uint64_t sub_1000442C8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id sub_10004431C()
{
  id result = [self sharedInstance];
  if (result)
  {
    id v1 = result;
    if ([result isAssociatedToNetwork])
    {
      id result = [v1 currentNetworkSSID];
      if (!result)
      {
        __break(1u);
        return result;
      }
      id v2 = result;
      static String._unconditionallyBridgeFromObjectiveC(_:)();
    }
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    swift_release();
    return (id)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000444A4()
{
  bzero(&v7, 0x878uLL);
  statfs("/private/var", &v7);
  if (!is_mul_ok(v7.f_blocks, v7.f_bsize))
  {
    __break(1u);
    goto LABEL_9;
  }
  if (!is_mul_ok(v7.f_bfree, v7.f_bsize))
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  if (v7.f_blocks * v7.f_bsize < v7.f_bfree * v7.f_bsize)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  uint64_t KeyPath = swift_getKeyPath();
  __chkstk_darwin(KeyPath);
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v2 = swift_getKeyPath();
  __chkstk_darwin(v2);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double v3 = (double)*(unint64_t *)(v0 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed);
  swift_getKeyPath();
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double v4 = v3 / (double)*(unint64_t *)(v0 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize) * 100.0;
  if ((~*(void *)&v4 & 0x7FF0000000000000) == 0)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_12:
    __break(1u);
LABEL_13:
    __break(1u);
  }
  if (v4 >= 9.22337204e18) {
    goto LABEL_13;
  }
  uint64_t v5 = swift_getKeyPath();
  __chkstk_darwin(v5);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  return swift_release();
}

uint64_t sub_10004481C()
{
  id v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState_skManager), "allDisks"));
  uint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v70 = sub_10003CCA4(&qword_10008F978);
  uint64_t v71 = sub_10004880C(&qword_10008F980, &qword_10008F978);
  v69[0] = v2;
  double v3 = sub_100045958(v69, v70);
  __chkstk_darwin(v3);
  uint64_t v5 = (uint64_t *)((char *)&v59 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v6 + 16))(v5);
  v66.f_bavail = swift_getAssociatedTypeWitness();
  v66.f_files = swift_getAssociatedConformanceWitness();
  statfs v7 = sub_100045B88((uint64_t *)&v66);
  id v62 = 0;
  *statfs v7 = *v5;
  v7[1] = 0;
  long long v61 = xmmword_100059C20;
  while (1)
  {
    sub_10004599C((uint64_t)&v66, v66.f_bavail);
    uint64_t AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    uint64_t v9 = type metadata accessor for Optional();
    uint64_t v10 = *(void *)(v9 - 8);
    __chkstk_darwin(v9);
    NSString v12 = (char *)&v59 - v11;
    dispatch thunk of IteratorProtocol.next()();
    uint64_t v13 = *(void *)(AssociatedTypeWitness - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v12, 1, AssociatedTypeWitness) == 1) {
      break;
    }
    uint64_t v68 = AssociatedTypeWitness;
    id v14 = sub_100045B88(v67);
    (*(void (**)(uint64_t *, char *, uint64_t))(v13 + 32))(v14, v12, AssociatedTypeWitness);
    sub_100045BEC(v67, &v65);
    sub_1000470F0(0, &qword_10008F988);
    if (swift_dynamicCast())
    {
      id v15 = v64;
      if ([v64 isValid]
        && [v15 isWritable]
        && ([v15 isInternal] & 1) == 0)
      {
        sub_10003CCA4((uint64_t *)&unk_10008F990);
        uint64_t v16 = swift_allocObject();
        *(_OWORD *)(v16 + 16) = v61;
        id v17 = [v15 description];
        uint64_t v18 = static String._unconditionallyBridgeFromObjectiveC(_:)();
        uint64_t v20 = v19;

        *(void *)(v16 + 56) = &type metadata for String;
        *(void *)(v16 + 64) = sub_10003CCE8();
        *(void *)(v16 + 32) = v18;
        *(void *)(v16 + 40) = v20;
        sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
        char v21 = (void *)static OS_os_log.default.getter();
        static os_log_type_t.default.getter();
        os_log(_:dso:log:type:_:)();
        swift_bridgeObjectRelease();

        id v62 = v15;
      }
      else
      {
      }
    }
  }
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1000471A0((uint64_t)&v66);
  id v22 = v62;
  if (!v62) {
    goto LABEL_21;
  }
  id v23 = v62;
  id v24 = [v23 mountPoint];
  if (!v24)
  {

LABEL_21:
    uint64_t KeyPath = swift_getKeyPath();
    __chkstk_darwin(KeyPath);
    uint64_t v52 = v63;
    *(&v59 - 4) = v63;
    *(&v59 - 3) = 0;
    *(&v59 - 2) = 0xE000000000000000;
    *(void *)&v66.f_bCGSize size = v52;
    sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v53 = swift_getKeyPath();
    __chkstk_darwin(v53);
    *(&v59 - 2) = v52;
    *(&v59 - 1) = 0;
    *(void *)&v66.f_bCGSize size = v52;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v54 = swift_getKeyPath();
    __chkstk_darwin(v54);
    *(&v59 - 2) = v52;
    *(&v59 - 1) = 0;
    *(void *)&v66.f_bCGSize size = v52;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v55 = swift_getKeyPath();
    __chkstk_darwin(v55);
    *(&v59 - 2) = v52;
    *(&v59 - 1) = 0;
    *(void *)&v66.f_bCGSize size = v52;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v56 = swift_getKeyPath();
    __chkstk_darwin(v56);
    *(&v59 - 4) = v52;
    *(&v59 - 3) = 0;
    *(&v59 - 2) = 0xE000000000000000;
    *(void *)&v66.f_bCGSize size = v52;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
    swift_release();
    uint64_t v57 = swift_getKeyPath();
    __chkstk_darwin(v57);
    *(&v59 - 2) = v52;
    *((unsigned char *)&v59 - 8) = 0;
    *(void *)&v66.f_bCGSize size = v52;
    ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();

    swift_release();
    return sub_1000471A0((uint64_t)v69);
  }
  uint64_t v25 = v24;
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v28 = v27;

  id v29 = [v23 volumeName];
  if (!v29)
  {

    swift_bridgeObjectRelease();
    goto LABEL_21;
  }
  uint64_t v30 = v29;
  *(void *)&long long v61 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v62 = v31;

  uint64_t v32 = swift_getKeyPath();
  __chkstk_darwin(v32);
  uint64_t v33 = v63;
  *(&v59 - 4) = v63;
  *(&v59 - 3) = v26;
  *(&v59 - 2) = v28;
  *(void *)&v66.f_bCGSize size = v33;
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  bzero(&v66, 0x878uLL);
  swift_getKeyPath();
  v67[0] = v33;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  uint64_t v34 = String.utf8CString.getter();
  statfs((const char *)(v34 + 32), &v66);
  swift_release();
  if (!is_mul_ok(v66.f_blocks, v66.f_bsize))
  {
    __break(1u);
    goto LABEL_24;
  }
  if (!is_mul_ok(v66.f_bfree, v66.f_bsize))
  {
LABEL_24:
    __break(1u);
    goto LABEL_25;
  }
  id v60 = v23;
  uint64_t v35 = v66.f_blocks * v66.f_bsize;
  uint64_t v36 = v66.f_bfree * v66.f_bsize;
  uint64_t v37 = v35 - v36;
  if (v35 < v36)
  {
LABEL_25:
    __break(1u);
    goto LABEL_26;
  }
  unint64_t v38 = v35 / 0xF4240;
  uint64_t v39 = swift_getKeyPath();
  __chkstk_darwin(v39);
  uint64_t v40 = v63;
  *(&v59 - 2) = v63;
  *(&v59 - 1) = v38;
  v67[0] = v40;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v41 = swift_getKeyPath();
  __chkstk_darwin(v41);
  *(&v59 - 2) = v40;
  *(&v59 - 1) = v37 / 0xF4240;
  v67[0] = v40;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_getKeyPath();
  v67[0] = v40;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double v42 = (double)*(unint64_t *)(v40 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed);
  swift_getKeyPath();
  v67[0] = v40;
  ObservationRegistrar.access<A, B>(_:keyPath:)();
  swift_release();
  double v43 = v42 / (double)*(unint64_t *)(v40 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize) * 100.0;
  if ((~*(void *)&v43 & 0x7FF0000000000000) == 0)
  {
LABEL_26:
    __break(1u);
    goto LABEL_27;
  }
  if (v43 <= -9.22337204e18)
  {
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
  }
  if (v43 >= 9.22337204e18) {
    goto LABEL_28;
  }
  uint64_t v44 = (uint64_t)v43;
  uint64_t v45 = swift_getKeyPath();
  __chkstk_darwin(v45);
  uint64_t v46 = v63;
  *(&v59 - 2) = v63;
  *(&v59 - 1) = v44;
  v67[0] = v46;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  uint64_t v47 = swift_getKeyPath();
  __chkstk_darwin(v47);
  uint64_t v48 = v61;
  *(&v59 - 4) = v46;
  *(&v59 - 3) = v48;
  *(&v59 - 2) = (uint64_t)v62;
  v67[0] = v46;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  swift_bridgeObjectRelease();
  uint64_t v49 = swift_getKeyPath();
  __chkstk_darwin(v49);
  *(&v59 - 2) = v46;
  *((unsigned char *)&v59 - 8) = 1;
  v67[0] = v46;
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  id v50 = v60;

  swift_release();
  return sub_1000471A0((uint64_t)v69);
}

uint64_t sub_100045564()
{
  sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
  uint64_t v0 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  swift_getKeyPath();
  sub_100046F78(&qword_10008F970, (void (*)(uint64_t))type metadata accessor for DebugInfoState);
  ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
  swift_release();
  sub_10004431C();
  sub_1000444A4();
  sub_1000440A8();
  return sub_10004481C();
}

uint64_t sub_100045708(void *a1, uint64_t a2, uint64_t a3)
{
  if (a3) {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  sub_1000470F0(0, (unint64_t *)&qword_10008F7F8);
  id v4 = a1;
  uint64_t v5 = (void *)static OS_os_log.default.getter();
  static os_log_type_t.default.getter();
  os_log(_:dso:log:type:_:)();

  sub_10004481C();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000457F4()
{
  uint64_t result = type metadata accessor for ObservationRegistrar();
  if (v1 <= 0x3F) {
    return swift_updateClassMetadata2();
  }
  return result;
}

uint64_t sub_1000458CC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_100043664(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady, a2);
}

void sub_1000458F8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__skManagerReady) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_100045910(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

void *sub_100045958(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10004599C(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_1000459EC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10004301C(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath, a2);
}

uint64_t sub_100045A18()
{
  return sub_100045D08(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDrivePath);
}

uint64_t sub_100045A38@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize, a2);
}

void sub_100045A64()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveSize) = *(void *)(v0 + 24);
}

uint64_t sub_100045A78@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed, a2);
}

void sub_100045AA4()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsed) = *(void *)(v0 + 24);
}

uint64_t sub_100045AB8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage, a2);
}

void sub_100045AE4()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveUsage) = *(void *)(v0 + 24);
}

uint64_t sub_100045AF8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10004301C(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName, a2);
}

uint64_t sub_100045B24()
{
  return sub_100045D08(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveName);
}

uint64_t sub_100045B44@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_100043664(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected, a2);
}

void sub_100045B70()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__usbDriveConnected) = *(unsigned char *)(v0 + 24);
}

uint64_t *sub_100045B88(uint64_t *a1)
{
  unint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

_OWORD *sub_100045BEC(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100045BFC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize, a2);
}

void sub_100045C28()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskSize) = *(void *)(v0 + 24);
}

uint64_t sub_100045C3C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed, a2);
}

void sub_100045C68()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsed) = *(void *)(v0 + 24);
}

uint64_t sub_100045C7C@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_100043430(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage, a2);
}

void sub_100045CA8()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__ramDiskUsage) = *(void *)(v0 + 24);
}

uint64_t sub_100045CBC@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  return sub_10004301C(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork, a2);
}

uint64_t sub_100045CE8()
{
  return sub_100045D08(&OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__currentWiFiNetwork);
}

uint64_t sub_100045D08(void *a1)
{
  uint64_t v2 = v1[4];
  double v3 = (void *)(v1[2] + *a1);
  void *v3 = v1[3];
  v3[1] = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_100045D54()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100045D8C()
{
  return sub_1000441F8();
}

uint64_t sub_100045D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100045DA4()
{
  return swift_release();
}

uint64_t sub_100045DAC@<X0>(uint64_t *a1@<X0>, unsigned char *a2@<X8>)
{
  return sub_100043664(a1, &OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning, a2);
}

void sub_100045DD8()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__diagsRunning) = *(unsigned char *)(v0 + 24);
}

void sub_100045DF8()
{
}

uint64_t sub_100045E10()
{
  return sub_100043D4C();
}

void sub_100045E18()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  double v3 = *(void **)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer);
  *(void *)(v1 + OBJC_IVAR____TtC12CheckerBoard14DebugInfoState__timer) = v2;
  id v4 = v2;
}

uint64_t sub_100045E58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for EnvironmentValues();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  statfs v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_10003CCA4(&qword_10008FA80);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100048434(v2, (uint64_t)v10, &qword_10008FA80);
  if (swift_getEnumCaseMultiPayload() == 1) {
    return sub_10003D0F4((uint64_t)v10, a1, &qword_10008FA88);
  }
  os_log_type_t v12 = static os_log_type_t.fault.getter();
  uint64_t v13 = static Log.runtimeIssuesLog.getter();
  os_log_type_t v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    id v15 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = swift_slowAlloc();
    v17[1] = a1;
    uint64_t v18 = v16;
    *(_DWORD *)id v15 = 136315138;
    v17[2] = sub_10004617C(0xD000000000000020, 0x8000000100070E80, &v18);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  EnvironmentValues.init()();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1000460E8(uint64_t a1)
{
  uint64_t v2 = sub_10003CCA4(&qword_10008FA88);
  __chkstk_darwin(v2 - 8);
  sub_100048434(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_10008FA88);
  return EnvironmentValues.horizontalSizeClass.setter();
}

uint64_t sub_10004617C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100046250(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10003CE34((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_10003CE34((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_1000471A0((uint64_t)v12);
  return v7;
}

uint64_t sub_100046250(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
    uint64_t result = sub_10004640C(a5, a6);
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

uint64_t sub_10004640C(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000464A4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100046684(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100046684(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000464A4(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_10004661C(v2, 0);
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

void *sub_10004661C(uint64_t a1, uint64_t a2)
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
  sub_10003CCA4(&qword_10008FAB0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  _OWORD v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100046684(char a1, int64_t a2, char a3, char *a4)
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
    sub_10003CCA4(&qword_10008FAB0);
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

__n128 sub_1000467D4@<Q0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X8>)
{
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  State.init(wrappedValue:)();
  __n128 result = v17;
  *(unsigned char *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(void *)(a8 + 16) = a3;
  *(unsigned char *)(a8 + 24) = a4;
  *(void *)(a8 + 32) = a5;
  *(void *)(a8 + 40) = a6;
  *(void *)(a8 + 48) = a7;
  *(unsigned char *)(a8 + 56) = v17.n128_u8[0];
  *(void *)(a8 + 64) = v17.n128_u64[1];
  *(unsigned char *)(a8 + 72) = v17.n128_u8[0];
  *(void *)(a8 + 80) = v17.n128_u64[1];
  *(__n128 *)(a8 + 88) = v17;
  *(void *)(a8 + 104) = v18;
  return result;
}

uint64_t destroy for DebugInfoView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t initializeWithCopy for DebugInfoView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v3 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v3;
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  uint64_t v4 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v4;
  size_t v5 = *(void **)(a2 + 48);
  *(void *)(a1 + 48) = v5;
  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  uint64_t v6 = *(void *)(a2 + 88);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  *(void *)(a1 + 88) = v6;
  uint64_t v7 = *(void *)(a2 + 104);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  *(void *)(a1 + 104) = v7;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v8 = v5;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DebugInfoView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void **)(a2 + 48);
  size_t v5 = *(void **)(a1 + 48);
  *(void *)(a1 + 48) = v4;
  id v6 = v4;

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_retain();
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  *(void *)(a1 + 96) = *(void *)(a2 + 96);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 104) = *(void *)(a2 + 104);
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for DebugInfoView(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[6];
  *(_OWORD *)(a1 + 80) = a2[5];
  *(_OWORD *)(a1 + 96) = v6;
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v5;
  return result;
}

uint64_t assignWithTake for DebugInfoView(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  uint64_t v4 = *(void *)(a2 + 16);
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  long long v5 = *(void **)(a1 + 48);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);

  *(unsigned char *)(a1 + 56) = *(unsigned char *)(a2 + 56);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  swift_release();
  *(unsigned char *)(a1 + 72) = *(unsigned char *)(a2 + 72);
  *(void *)(a1 + 80) = *(void *)(a2 + 80);
  swift_release();
  *(void *)(a1 + 88) = *(void *)(a2 + 88);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for DebugInfoView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 112)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DebugInfoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 104) = 0;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 112) = 1;
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
    *(unsigned char *)(result + 112) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DebugInfoView()
{
  return &type metadata for DebugInfoView;
}

uint64_t sub_100046C94(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100075CE8, 1);
}

uint64_t sub_100046CB0()
{
  return sub_10004132C(*(_OWORD **)(v0 + 16));
}

unint64_t sub_100046CB8()
{
  unint64_t result = qword_10008FA00;
  if (!qword_10008FA00)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FA00);
  }
  return result;
}

uint64_t sub_100046D10()
{
  return State.wrappedValue.setter();
}

uint64_t sub_100046D5C(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 48);
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  id v3 = v2;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_100046DDC@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.multilineTextAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_100046E08()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

uint64_t sub_100046E30(uint64_t a1)
{
  return a1;
}

uint64_t sub_100046E80(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100046E90(uint64_t a1)
{
  return a1;
}

uint64_t sub_100046EE0(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100046EF4()
{
  return sub_100040A08();
}

uint64_t sub_100046F18@<X0>(uint64_t a1@<X8>)
{
  return sub_100040F90(*(void *)(v1 + 16), a1);
}

uint64_t type metadata accessor for TestButtonLabel(uint64_t a1)
{
  return sub_100046F40(a1, (uint64_t *)&unk_10008FB50);
}

uint64_t sub_100046F40(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100046F78(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100046FC0@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = EnvironmentValues.isEnabled.getter();
  *a1 = result & 1;
  return result;
}

uint64_t sub_100046FF0()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t sub_100047018()
{
  return _swift_deallocObject(v0, 17, 7);
}

unsigned char *sub_100047028(unsigned char *result)
{
  *result &= ~*(unsigned char *)(v1 + 16) & 1;
  return result;
}

void sub_100047044()
{
}

uint64_t sub_10004704C@<X0>(uint64_t a1@<X8>)
{
  return sub_1000411E4(*(void *)(v1 + 16), a1);
}

uint64_t sub_100047054()
{
  return _swift_deallocObject(v0, 17, 7);
}

uint64_t sub_100047064()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t sub_10004708C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for TestButtonLabel(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000470F0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100047130()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 128, 7);
}

uint64_t sub_100047198()
{
  return sub_10004148C(v0 + 16);
}

uint64_t sub_1000471A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

double sub_1000471F4(_OWORD *a1)
{
  double result = 0.0;
  a1[9] = 0u;
  a1[10] = 0u;
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return result;
}

uint64_t sub_100047214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a7)
  {
    sub_100046E80(a4, a5, a6 & 1);
    swift_bridgeObjectRetain();
    sub_100046E80(a8, a9, a10 & 1);
    swift_bridgeObjectRetain();
    sub_100046E80(a15, a16, a17 & 1);
    swift_bridgeObjectRetain();
    sub_100046E80(a19, a20, a21 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

void *sub_100047304(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  a2(*a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15], a1[16], a1[17], a1[18],
    a1[19],
    a1[20],
    a1[21]);
  return a1;
}

uint64_t sub_100047370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, char a6, uint64_t a7, uint64_t a8, uint64_t a9, char a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  if (a7)
  {
    sub_100046EE0(a4, a5, a6 & 1);
    swift_bridgeObjectRelease();
    sub_100046EE0(a8, a9, a10 & 1);
    swift_bridgeObjectRelease();
    sub_100046EE0(a15, a16, a17 & 1);
    swift_bridgeObjectRelease();
    sub_100046EE0(a19, a20, a21 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t *sub_100047464(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v13 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v13 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = a2[3];
    a1[2] = a2[2];
    a1[3] = v6;
    uint64_t v7 = *(int *)(a3 + 28);
    id v8 = (uint64_t *)((char *)a1 + v7);
    int64_t v9 = (uint64_t *)((char *)a2 + v7);
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    sub_10003CCA4(&qword_10008FA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v10 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v11 = *(void *)(v10 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        uint64_t v12 = sub_10003CCA4(&qword_10008FA88);
        memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      *id v8 = *v9;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t sub_100047648(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t v4 = a1 + *(int *)(a2 + 28);
  sub_10003CCA4(&qword_10008FA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v5 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v8 = *(void *)(v5 - 8);
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v4, 1, v5);
    if (!result)
    {
      uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t))(v8 + 8);
      return v7(v4, v5);
    }
  }
  else
  {
    return swift_release();
  }
  return result;
}

void *sub_100047780(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  uint64_t v6 = *(int *)(a3 + 28);
  uint64_t v7 = (void *)((char *)a1 + v6);
  uint64_t v8 = (void *)((char *)a2 + v6);
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  sub_10003CCA4(&qword_10008FA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      uint64_t v11 = sub_10003CCA4(&qword_10008FA88);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  else
  {
    *uint64_t v7 = *v8;
    swift_retain();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

void *sub_100047914(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  a1[3] = a2[3];
  swift_retain();
  swift_release();
  if (a1 != a2)
  {
    uint64_t v6 = *(int *)(a3 + 28);
    uint64_t v7 = (void *)((char *)a1 + v6);
    uint64_t v8 = (void *)((char *)a2 + v6);
    sub_1000483D8((uint64_t)a1 + v6, &qword_10008FA80);
    sub_10003CCA4(&qword_10008FA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v9 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v10 = *(void *)(v9 - 8);
      if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
      {
        uint64_t v11 = sub_10003CCA4(&qword_10008FA88);
        memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
      }
      else
      {
        (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v7, v8, v9);
        (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      }
    }
    else
    {
      *uint64_t v7 = *v8;
      swift_retain();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_100047AF4(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  long long v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_10003CCA4(&qword_10008FA80);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    uint64_t v9 = type metadata accessor for UserInterfaceSizeClass();
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v7, 1, v9))
    {
      uint64_t v11 = sub_10003CCA4(&qword_10008FA88);
      memcpy(v6, v7, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v6, v7, v9);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v10 + 56))(v6, 0, 1, v9);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v6, v7, *(void *)(*(void *)(v8 - 8) + 64));
  }
  return a1;
}

void *sub_100047C74(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_release();
  a1[3] = a2[3];
  swift_release();
  if (a1 != a2)
  {
    uint64_t v7 = *(int *)(a3 + 28);
    uint64_t v8 = (char *)a1 + v7;
    uint64_t v9 = (char *)a2 + v7;
    sub_1000483D8((uint64_t)a1 + v7, &qword_10008FA80);
    uint64_t v10 = sub_10003CCA4(&qword_10008FA80);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      uint64_t v11 = type metadata accessor for UserInterfaceSizeClass();
      uint64_t v12 = *(void *)(v11 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v9, 1, v11))
      {
        uint64_t v13 = sub_10003CCA4(&qword_10008FA88);
        memcpy(v8, v9, *(void *)(*(void *)(v13 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v8, v9, v11);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v8, 0, 1, v11);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v8, v9, *(void *)(*(void *)(v10 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_100047E3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100047E50);
}

uint64_t sub_100047E50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_10003CCA4(&qword_10008FAF0);
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 28);
    return v9(v11, a2, v10);
  }
}

uint64_t sub_100047F04(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_100047F18);
}

uint64_t sub_100047F18(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_10003CCA4(&qword_10008FAF0);
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 28);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_100047FC4()
{
  sub_10004806C();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_10004806C()
{
  if (!qword_10008FB60)
  {
    sub_100045910(&qword_10008FA88);
    unint64_t v0 = type metadata accessor for Environment.Content();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_10008FB60);
    }
  }
}

unint64_t sub_1000480CC()
{
  unint64_t result = qword_10008FB98;
  if (!qword_10008FB98)
  {
    sub_100045910(&qword_10008F9C8);
    sub_10004880C(&qword_10008FBA0, &qword_10008F9B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FB98);
  }
  return result;
}

uint64_t sub_10004816C(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100075D10, 1);
}

uint64_t sub_100048188@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.font.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000481B4()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_1000481E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100048244(uint64_t a1)
{
  return a1;
}

uint64_t sub_1000482B4(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for RoundedRectangle();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100048310(uint64_t a1)
{
  return a1;
}

uint64_t sub_100048380@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = EnvironmentValues.foregroundColor.getter();
  *a1 = result;
  return result;
}

uint64_t sub_1000483AC()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_1000483D8(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_10003CCA4(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_100048434(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_10003CCA4(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_10004849C()
{
  unint64_t result = qword_10008FBE0;
  if (!qword_10008FBE0)
  {
    sub_100045910(&qword_10008FBD0);
    sub_100048518();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FBE0);
  }
  return result;
}

unint64_t sub_100048518()
{
  unint64_t result = qword_10008FBE8;
  if (!qword_10008FBE8)
  {
    sub_100045910(&qword_10008FBC8);
    sub_1000485B8();
    sub_10004880C(&qword_10008FC50, &qword_10008FC58);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FBE8);
  }
  return result;
}

unint64_t sub_1000485B8()
{
  unint64_t result = qword_10008FBF0;
  if (!qword_10008FBF0)
  {
    sub_100045910(&qword_10008FBC0);
    sub_100048658();
    sub_10004880C(&qword_10008FC48, &qword_10008FBA8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FBF0);
  }
  return result;
}

unint64_t sub_100048658()
{
  unint64_t result = qword_10008FBF8;
  if (!qword_10008FBF8)
  {
    sub_100045910(&qword_10008FC00);
    sub_1000486F8();
    sub_10004880C(&qword_10008FC38, &qword_10008FC40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FBF8);
  }
  return result;
}

unint64_t sub_1000486F8()
{
  unint64_t result = qword_10008FC08;
  if (!qword_10008FC08)
  {
    sub_100045910(&qword_10008FC10);
    sub_100048798();
    sub_10004880C(&qword_10008FC28, &qword_10008FC30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FC08);
  }
  return result;
}

unint64_t sub_100048798()
{
  unint64_t result = qword_10008FC18;
  if (!qword_10008FC18)
  {
    sub_100045910(&qword_10008FC20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10008FC18);
  }
  return result;
}

uint64_t sub_10004880C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100045910(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_100048868()
{
}

void sub_100048880()
{
}

void sub_100048898()
{
}

void sub_1000488B0()
{
}

void sub_1000488C8()
{
}

void sub_1000488E0()
{
}

void sub_1000488FC()
{
}

void sub_100048914()
{
}

void sub_10004892C()
{
}

uint64_t sub_100048944()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100048978(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote setup requested we present a pascode of unsupported type %@", (uint8_t *)&v2, 0xCu);
}

void sub_1000489F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048A28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048A60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Remote setup wants us to answer authentication with invalid password type %@", (uint8_t *)&v2, 0xCu);
}

void sub_100048AD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048B10(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "notify_register_check(kSunlightState) failed", v1, 2u);
}

void sub_100048B54(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "notify_get_state(sunlightStateToken) failed", v1, 2u);
}

void sub_100048B98(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Battery device state change occured without any internal batteries present!", v1, 2u);
}

void sub_100048BDC(uint64_t a1)
{
  int v2 = CheckerBoardLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412290;
    uint64_t v4 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Unable to find url to package %@:", (uint8_t *)&v3, 0xCu);
  }

  __assert_rtn("-[OBWelcomeController(Animation) bundleUrlForPackageName:]", "OBWelcomeController+Animation.m", 47, "0");
}

void sub_100048C78(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 1024;
  unsigned int v7 = [a2 broadcastingForSetup];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Unable to set override pin to (%@) - broadcasting: (%d)", (uint8_t *)&v4, 0x12u);
}

void sub_100048D18(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "sendPasswordAuth called while not performing remote setup!", v1, 2u);
}

void sub_100048D5C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Setup server unexpectedly stopped", v1, 2u);
}

void sub_100048DA0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Network selected in wifi picker, but selected cell is not a CBNetworkListRecord!", v1, 2u);
}

void sub_100048DE4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Primary app exited, resetting flow.", v1, 2u);
}

void sub_100048E28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048E60(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Operation not permitted: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100048ED8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048F10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100048F48(void *a1, NSObject *a2)
{
  v3[0] = 67109120;
  v3[1] = [a1 passwordType];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected authentication type %d for remote setup. Setup flow will fail when pushed.", (uint8_t *)v3, 8u);
}

void sub_100048FD4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Launched diagnostics with error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10004904C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Skiping entitlement check. APTicket is not valid", v1, 2u);
}

void sub_100049090(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get path for APTicket: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100049108(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unable to load data for APTicket from path (%@): %@", (uint8_t *)&v3, 0x16u);
}

void sub_100049190(int a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109376;
  v3[1] = a1;
  __int16 v4 = 2048;
  uint64_t v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to digest ticket, error %d, digestSize=%zu", (uint8_t *)v3, 0x12u);
}

void sub_100049218()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "Failed to discover cameras for QR code scanning", v2, v3, v4, v5, v6);
}

void sub_10004924C()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "Failed to obtain capture device for QR code scanning", v2, v3, v4, v5, v6);
}

void sub_100049280()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "Failed to set input device for camera capture for QR code scanning", v2, v3, v4, v5, v6);
}

void sub_1000492B4()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "AVCaptureMetadataOutput doesn't support QR codes!", v2, v3, v4, v5, v6);
}

void sub_1000492E8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100049354(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000493C0(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "[CBIdleSleepManager] IORegisterForSystemPower failed. CheckerBoard will not receive wake and sleep notifications.", v1, 2u);
}

void sub_100049404(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100049470()
{
  sub_1000234B0();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "CheckerBoard is running in an environment that prevents initialization of WiFi.", v1, 2u);
}

void sub_1000494B0()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "startWiFiNetworkScanRequestFrom called without a requestor", v2, v3, v4, v5, v6);
}

void sub_1000494E4()
{
  sub_10002C5B0();
  sub_1000250DC((void *)&_mh_execute_header, v0, v1, "Network scan returned error %@", v2, v3, v4, v5, v6);
}

void sub_10004954C()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "stopWiFiNetworkScanWithRequestor called without a previously registered requestor!", v2, v3, v4, v5, v6);
}

void sub_100049580()
{
  sub_10002C5B0();
  sub_1000250DC((void *)&_mh_execute_header, v0, v1, "Encrypted network association returned error %@", v2, v3, v4, v5, v6);
}

void sub_1000495E8()
{
  sub_10002C5B0();
  sub_1000250DC((void *)&_mh_execute_header, v0, v1, "Unencrypted network association returned error %@", v2, v3, v4, v5, v6);
}

void sub_100049650()
{
  sub_10002C5B0();
  sub_1000250DC((void *)&_mh_execute_header, v0, v1, "Hidden unencrypted network association returned error %@", v2, v3, v4, v5, v6);
}

void sub_1000496B8()
{
  sub_1000234B0();
  sub_100006938((void *)&_mh_execute_header, v0, v1, "Attempting to reconnect to last known good network without a last known good network!", v2, v3, v4, v5, v6);
}

void sub_1000496EC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Timed out waiting for shutdown tasks to complete", v1, 2u);
}

void sub_100049730(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100049768(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000497A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000497D8()
{
}

uint64_t _convertNSErrorToError(_:)()
{
  return _convertNSErrorToError(_:)();
}

uint64_t Locale.identifier.getter()
{
  return Locale.identifier.getter();
}

uint64_t static Locale.current.getter()
{
  return static Locale.current.getter();
}

uint64_t type metadata accessor for Locale()
{
  return type metadata accessor for Locale();
}

uint64_t ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t ObservationRegistrar.access<A, B>(_:keyPath:)()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t ObservationRegistrar.init()()
{
  return ObservationRegistrar.init()();
}

uint64_t type metadata accessor for ObservationRegistrar()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t os_log(_:dso:log:type:_:)()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t os_log(_:dso:log:_:_:)()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t static ButtonRole.cancel.getter()
{
  return static ButtonRole.cancel.getter();
}

uint64_t type metadata accessor for ButtonRole()
{
  return type metadata accessor for ButtonRole();
}

uint64_t EdgeInsets.init(_all:)()
{
  return EdgeInsets.init(_all:)();
}

uint64_t type metadata accessor for Environment.Content()
{
  return type metadata accessor for Environment.Content();
}

uint64_t ProgressView<>.init(label:)()
{
  return ProgressView<>.init(label:)();
}

uint64_t type metadata accessor for RoundedRectangle()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t EnvironmentValues.foregroundColor.getter()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t EnvironmentValues.foregroundColor.setter()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t EnvironmentValues.horizontalSizeClass.getter()
{
  return EnvironmentValues.horizontalSizeClass.getter();
}

uint64_t EnvironmentValues.horizontalSizeClass.setter()
{
  return EnvironmentValues.horizontalSizeClass.setter();
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

uint64_t EnvironmentValues.isEnabled.getter()
{
  return EnvironmentValues.isEnabled.getter();
}

uint64_t EnvironmentValues.isEnabled.setter()
{
  return EnvironmentValues.isEnabled.setter();
}

uint64_t EnvironmentValues.init()()
{
  return EnvironmentValues.init()();
}

uint64_t type metadata accessor for EnvironmentValues()
{
  return type metadata accessor for EnvironmentValues();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t LocalizedStringKey.init(stringLiteral:)()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t type metadata accessor for RoundedCornerStyle()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t type metadata accessor for UserInterfaceSizeClass()
{
  return type metadata accessor for UserInterfaceSizeClass();
}

uint64_t static Log.runtimeIssuesLog.getter()
{
  return static Log.runtimeIssuesLog.getter();
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

uint64_t static Edge.Set.leading.getter()
{
  return static Edge.Set.leading.getter();
}

uint64_t Edge.Set.init(rawValue:)()
{
  return Edge.Set.init(rawValue:)();
}

uint64_t static Edge.Set.trailing.getter()
{
  return static Edge.Set.trailing.getter();
}

uint64_t static Font.title.getter()
{
  return static Font.title.getter();
}

uint64_t type metadata accessor for Font.Design()
{
  return type metadata accessor for Font.Design();
}

uint64_t static Font.system(size:weight:design:)()
{
  return static Font.system(size:weight:design:)();
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

uint64_t static View._viewListCount(inputs:)()
{
  return static View._viewListCount(inputs:)();
}

uint64_t View.alert<A, B>(_:isPresented:actions:)()
{
  return View.alert<A, B>(_:isPresented:actions:)();
}

uint64_t static Color.blue.getter()
{
  return static Color.blue.getter();
}

uint64_t static Color.gray.getter()
{
  return static Color.gray.getter();
}

uint64_t static Color.white.getter()
{
  return static Color.white.getter();
}

uint64_t Color.opacity(_:)()
{
  return Color.opacity(_:)();
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

uint64_t State.projectedValue.getter()
{
  return State.projectedValue.getter();
}

uint64_t Button.init(action:label:)()
{
  return Button.init(action:label:)();
}

uint64_t Button<>.init(_:role:action:)()
{
  return Button<>.init(_:role:action:)();
}

uint64_t static Alignment.center.getter()
{
  return static Alignment.center.getter();
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

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.utf8CString.getter()
{
  return String.utf8CString.getter();
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

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.fault.getter()
{
  return static os_log_type_t.fault.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static OS_dispatch_queue.global(qos:)()
{
  return static OS_dispatch_queue.global(qos:)();
}

uint64_t static OS_os_log.default.getter()
{
  return static OS_os_log.default.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t dispatch thunk of IteratorProtocol.next()()
{
  return dispatch thunk of IteratorProtocol.next()();
}

NSNumber __swiftcall UInt._bridgeToObjectiveC()()
{
  return (NSNumber)UInt._bridgeToObjectiveC()();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t _bridgeAnyObjectToAny(_:)()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
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

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
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

uint64_t ACMKernelControl()
{
  return _ACMKernelControl();
}

uint64_t AMSupportDigestSha1()
{
  return _AMSupportDigestSha1();
}

uint64_t AMSupportDigestSha384()
{
  return _AMSupportDigestSha384();
}

uint64_t AMSupportSafeRelease()
{
  return _AMSupportSafeRelease();
}

uint64_t AVResetMediaServices()
{
  return _AVResetMediaServices();
}

uint64_t BKSDisplayServicesSetScreenBlanked()
{
  return _BKSDisplayServicesSetScreenBlanked();
}

uint64_t BKSHIDServicesAmbientLightSensorEnableAutoBrightness()
{
  return _BKSHIDServicesAmbientLightSensorEnableAutoBrightness();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration()
{
  return _BKSHIDServicesSetBacklightFactorWithFadeDuration();
}

uint64_t BKSHIDServicesSetHIDUILockedState()
{
  return _BKSHIDServicesSetHIDUILockedState();
}

uint64_t BKSHIDTouchSensitiveButtonRequestScanMode()
{
  return _BKSHIDTouchSensitiveButtonRequestScanMode();
}

uint64_t BSCGFloatEpsilon()
{
  return _BSCGFloatEpsilon();
}

uint64_t BSDispatchMain()
{
  return _BSDispatchMain();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return _BSFloatGreaterThanOrEqualToFloat();
}

uint64_t BSPathExistsOnSystemPartition()
{
  return _BSPathExistsOnSystemPartition();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return _BSSizeGreaterThanOrEqualToSize();
}

uint64_t BSTimeUntilNextClockMinute()
{
  return _BSTimeUntilNextClockMinute();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return _CFDataGetBytePtr(theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return _CFDataGetLength(theData);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return _CFDictionaryGetValue(theDict, key);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return _CFNumberCreate(allocator, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return _CFPreferencesAppSynchronize(applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return _CFStringCompare(theString1, theString2, compareOptions);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMidY(CGRect rect)
{
  return _CGRectGetMidY(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t CheckerBoardLogHandleForCategory()
{
  return _CheckerBoardLogHandleForCategory();
}

uint64_t FBSApplicationTerminationReasonDescription()
{
  return _FBSApplicationTerminationReasonDescription();
}

uint64_t FBSApplicationTerminationReasonIsGraceful()
{
  return _FBSApplicationTerminationReasonIsGraceful();
}

uint64_t FBSOpenApplicationErrorCreate()
{
  return _FBSOpenApplicationErrorCreate();
}

uint64_t FBSystemAppBundleID()
{
  return _FBSystemAppBundleID();
}

uint64_t FBSystemShellInitialize()
{
  return _FBSystemShellInitialize();
}

uint64_t GSMainScreenOrientation()
{
  return _GSMainScreenOrientation();
}

uint64_t GSMainScreenPixelSize()
{
  return _GSMainScreenPixelSize();
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return _IOAllowPowerChange(kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return _IODeregisterForSystemPower(notifier);
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetPhase()
{
  return _IOHIDEventGetPhase();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return _IONotificationPortGetRunLoopSource(notify);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithName(AssertionType, AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return _IORegisterForSystemPower(refcon, thePortRef, callback, notifier);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return _IORegistryEntryFromPath(mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return _IORegistryEntrySetCFProperty(entry, propertyName, property);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return _IOServiceClose(connect);
}

uint64_t Img4DecodeGetBooleanFromSection()
{
  return _Img4DecodeGetBooleanFromSection();
}

uint64_t Img4DecodeInitManifest()
{
  return _Img4DecodeInitManifest();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t MGGetFloat32Answer()
{
  return _MGGetFloat32Answer();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

uint64_t MobileGestalt_copy_buildVersion_obj()
{
  return _MobileGestalt_copy_buildVersion_obj();
}

uint64_t MobileGestalt_get_current_device()
{
  return _MobileGestalt_get_current_device();
}

uint64_t MobileGestalt_get_inDiagnosticsMode()
{
  return _MobileGestalt_get_inDiagnosticsMode();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return _OSThermalNotificationCurrentLevel();
}

BOOL UIAccessibilityShouldDifferentiateWithoutColor(void)
{
  return _UIAccessibilityShouldDifferentiateWithoutColor();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void UIGraphicsBeginImageContext(CGSize size)
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

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

uint64_t WFScaleRSSI()
{
  return _WFScaleRSSI();
}

uint64_t WFSignalBarsFromScaledRSSI()
{
  return _WFSignalBarsFromScaledRSSI();
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

uint64_t _OSThermalNotificationLevelForBehavior()
{
  return __OSThermalNotificationLevelForBehavior();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
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

void bzero(void *a1, size_t a2)
{
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

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return _notify_get_state(token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return _notify_register_check(name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return _os_variant_has_internal_content();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return _os_variant_uses_ephemeral_storage();
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

int statfs(const char *a1, statfs *a2)
{
  return _statfs(a1, a2);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return _swift_getAssociatedConformanceWitness();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return _swift_getAssociatedTypeWitness();
}

uint64_t swift_getAtKeyPath()
{
  return _swift_getAtKeyPath();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return _swift_getEnumCaseMultiPayload();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return _sysctlbyname(a1, a2, a3, a4, a5);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return _xpc_BOOL_get_value(xBOOL);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return _xpc_copy_entitlement_for_token();
}

id objc_msgSend_CBDebugInfoViewDismissButtonPressedNotification(void *a1, const char *a2, ...)
{
  return _[a1 CBDebugInfoViewDismissButtonPressedNotification];
}

id objc_msgSend_CGImage(void *a1, const char *a2, ...)
{
  return _[a1 CGImage];
}

id objc_msgSend_RSSI(void *a1, const char *a2, ...)
{
  return _[a1 RSSI];
}

id objc_msgSend_URLForResource_withExtension_(void *a1, const char *a2, ...)
{
  return [a1 URLForResource:withExtension:];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_WAPISubtype(void *a1, const char *a2, ...)
{
  return _[a1 WAPISubtype];
}

id objc_msgSend___handleHIDEvent_(void *a1, const char *a2, ...)
{
  return [a1 __handleHIDEvent:];
}

id objc_msgSend__additionalSafeAreaInsets(void *a1, const char *a2, ...)
{
  return _[a1 _additionalSafeAreaInsets];
}

id objc_msgSend__adjustBackgroundWindowLevel(void *a1, const char *a2, ...)
{
  return _[a1 _adjustBackgroundWindowLevel];
}

id objc_msgSend__alertNotVisible(void *a1, const char *a2, ...)
{
  return _[a1 _alertNotVisible];
}

id objc_msgSend__appClientSettingsDiffInspector(void *a1, const char *a2, ...)
{
  return _[a1 _appClientSettingsDiffInspector];
}

id objc_msgSend__associateToEncryptedNetworkWithScanResult_password_isHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associateToEncryptedNetworkWithScanResult:password:isHidden:");
}

id objc_msgSend__associateToNetworkWithScanResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associateToNetworkWithScanResult:");
}

id objc_msgSend__associateToUnencryptedNetwork_(void *a1, const char *a2, ...)
{
  return [a1 _associateToUnencryptedNetwork];
}

id objc_msgSend__associationParametersFromScanResult_withPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_associationParametersFromScanResult:withPassword:");
}

id objc_msgSend__attemptConnectingToWifi(void *a1, const char *a2, ...)
{
  return _[a1 _attemptConnectingToWifi];
}

id objc_msgSend__attemptReconnect(void *a1, const char *a2, ...)
{
  return _[a1 _attemptReconnect];
}

id objc_msgSend__auditToken_hasEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_auditToken:hasEntitlement:");
}

id objc_msgSend__backlightLuminance(void *a1, const char *a2, ...)
{
  return _[a1 _backlightLuminance];
}

id objc_msgSend__backlightSceneEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 _backlightSceneEnvironment];
}

id objc_msgSend__batteryItemPercentFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _batteryItemPercentFormatter];
}

id objc_msgSend__beginThermalJetsamCPUSampling(void *a1, const char *a2, ...)
{
  return _[a1 _beginThermalJetsamCPUSampling];
}

id objc_msgSend__calculateAppsCPUTimesWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_calculateAppsCPUTimesWithCompletion:");
}

id objc_msgSend__canAttemptJoin(void *a1, const char *a2, ...)
{
  return _[a1 _canAttemptJoin];
}

id objc_msgSend__cancelLockButtonTimer(void *a1, const char *a2, ...)
{
  return _[a1 _cancelLockButtonTimer];
}

id objc_msgSend__checkForAliases_(void *a1, const char *a2, ...)
{
  return [a1 _checkForAliases:];
}

id objc_msgSend__checkForAliasesOrInvalid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkForAliasesOrInvalid:");
}

id objc_msgSend__checkOutUserSettings(void *a1, const char *a2, ...)
{
  return _[a1 _checkOutUserSettings];
}

id objc_msgSend__checkoutAndPostAssociationCompletedNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_checkoutAndPostAssociationCompletedNotificationWithError:");
}

id objc_msgSend__cleanUp(void *a1, const char *a2, ...)
{
  return _[a1 _cleanUp];
}

id objc_msgSend__clearRemoteSetupUX(void *a1, const char *a2, ...)
{
  return _[a1 _clearRemoteSetupUX];
}

id objc_msgSend__closeWifiConnection(void *a1, const char *a2, ...)
{
  return _[a1 _closeWifiConnection];
}

id objc_msgSend__createInitialAppScene(void *a1, const char *a2, ...)
{
  return _[a1 _createInitialAppScene];
}

id objc_msgSend__createInputScene(void *a1, const char *a2, ...)
{
  return _[a1 _createInputScene];
}

id objc_msgSend__createRecordingIndicatorForStandaloneLocation(void *a1, const char *a2, ...)
{
  return _[a1 _createRecordingIndicatorForStandaloneLocation];
}

id objc_msgSend__createRecordingIndicatorForStatusBarLocation(void *a1, const char *a2, ...)
{
  return _[a1 _createRecordingIndicatorForStatusBarLocation];
}

id objc_msgSend__dataProviderDidUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_dataProviderDidUpdate:");
}

id objc_msgSend__deregisterNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterNotifications];
}

id objc_msgSend__deregisterWiFiNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _deregisterWiFiNotifications];
}

id objc_msgSend__disableContinousPath(void *a1, const char *a2, ...)
{
  return _[a1 _disableContinousPath];
}

id objc_msgSend__disableTapToWake(void *a1, const char *a2, ...)
{
  return _[a1 _disableTapToWake];
}

id objc_msgSend__disableUIAndDisplaySpinnerBarItem(void *a1, const char *a2, ...)
{
  return _[a1 _disableUIAndDisplaySpinnerBarItem];
}

id objc_msgSend__disableUSBRestrictedMode(void *a1, const char *a2, ...)
{
  return _[a1 _disableUSBRestrictedMode];
}

id objc_msgSend__enableAndUpdateUI(void *a1, const char *a2, ...)
{
  return _[a1 _enableAndUpdateUI];
}

id objc_msgSend__enableLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_enableLeftBarButtonItem:");
}

id objc_msgSend__enableRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 _enableRightBarButtonItem:];
}

id objc_msgSend__enableUI_(void *a1, const char *a2, ...)
{
  return [a1 _enableUI:];
}

id objc_msgSend__getEntitlementLevelForConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getEntitlementLevelForConnection:");
}

id objc_msgSend__groupSeparatorSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _groupSeparatorSpecifier];
}

id objc_msgSend__handleCWInterfaceEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleCWInterfaceEvent:");
}

id objc_msgSend__handleNewDomainData_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleNewDomainData:");
}

id objc_msgSend__handleRemoteSetupFinished(void *a1, const char *a2, ...)
{
  return _[a1 _handleRemoteSetupFinished];
}

id objc_msgSend__handleSetupServerFinished(void *a1, const char *a2, ...)
{
  return _[a1 _handleSetupServerFinished];
}

id objc_msgSend__hasHomeButton(void *a1, const char *a2, ...)
{
  return _[a1 _hasHomeButton];
}

id objc_msgSend__hasLaunchedDiagnosticsProcess(void *a1, const char *a2, ...)
{
  return _[a1 _hasLaunchedDiagnosticsProcess];
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return _[a1 _hidEvent];
}

id objc_msgSend__hideActivityView(void *a1, const char *a2, ...)
{
  return _[a1 _hideActivityView];
}

id objc_msgSend__homeButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 _homeButtonDown];
}

id objc_msgSend__homeButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 _homeButtonUp];
}

id objc_msgSend__indicatorIdentifierForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indicatorIdentifierForSensorType:");
}

id objc_msgSend__indicatorTypeForSensorType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_indicatorTypeForSensorType:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initRoutingRules(void *a1, const char *a2, ...)
{
  return _[a1 _initRoutingRules];
}

id objc_msgSend__initTapToWake(void *a1, const char *a2, ...)
{
  return _[a1 _initTapToWake];
}

id objc_msgSend__initWithFrame_debugName_scene_attached_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initWithFrame:debugName:scene:attached:");
}

id objc_msgSend__initialStatusBarSetup(void *a1, const char *a2, ...)
{
  return _[a1 _initialStatusBarSetup];
}

id objc_msgSend__isLevelBlocked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isLevelBlocked:");
}

id objc_msgSend__isLockButtonTimerValid(void *a1, const char *a2, ...)
{
  return _[a1 _isLockButtonTimerValid];
}

id objc_msgSend__isLowPowerModeActive(void *a1, const char *a2, ...)
{
  return _[a1 _isLowPowerModeActive];
}

id objc_msgSend__isPermittedToUpdateASTDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _isPermittedToUpdateASTDefaults];
}

id objc_msgSend__joinTapped(void *a1, const char *a2, ...)
{
  return _[a1 _joinTapped];
}

id objc_msgSend__killThermallyActiveDiagnosticsApplication(void *a1, const char *a2, ...)
{
  return _[a1 _killThermallyActiveDiagnosticsApplication];
}

id objc_msgSend__lightSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 _lightSystemFontOfSize:];
}

id objc_msgSend__loadAPTicket(void *a1, const char *a2, ...)
{
  return _[a1 _loadAPTicket];
}

id objc_msgSend__lockButtonDown(void *a1, const char *a2, ...)
{
  return _[a1 _lockButtonDown];
}

id objc_msgSend__lockButtonUp(void *a1, const char *a2, ...)
{
  return _[a1 _lockButtonUp];
}

id objc_msgSend__maxLevelForLayer_(void *a1, const char *a2, ...)
{
  return [a1 _maxLevelForLayer:];
}

id objc_msgSend__modalNotVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modalNotVisible:");
}

id objc_msgSend__networkNameIsValid(void *a1, const char *a2, ...)
{
  return _[a1 _networkNameIsValid];
}

id objc_msgSend__networkNameSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _networkNameSpecifier];
}

id objc_msgSend__notifyObserversOfActivityChange(void *a1, const char *a2, ...)
{
  return _[a1 _notifyObserversOfActivityChange];
}

id objc_msgSend__passwordIsValid(void *a1, const char *a2, ...)
{
  return _[a1 _passwordIsValid];
}

id objc_msgSend__passwordSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _passwordSpecifier];
}

id objc_msgSend__performDirectedScanIncludingHidden_AndAssociateToNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDirectedScanIncludingHidden:AndAssociateToNetworkWithName:password:");
}

id objc_msgSend__peripheryInsets(void *a1, const char *a2, ...)
{
  return _[a1 _peripheryInsets];
}

id objc_msgSend__pointImageOfColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_pointImageOfColor:");
}

id objc_msgSend__postDidAssociateToEncryptedNetworkNotificationWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_postDidAssociateToEncryptedNetworkNotificationWithError:");
}

id objc_msgSend__postDidAssociateToOpenNetworkNotificationWithError_(void *a1, const char *a2, ...)
{
  return [a1 _postDidAssociateToOpenNetworkNotificationWithError:];
}

id objc_msgSend__postStatusBarUpdates(void *a1, const char *a2, ...)
{
  return _[a1 _postStatusBarUpdates];
}

id objc_msgSend__powerStateDidChange(void *a1, const char *a2, ...)
{
  return _[a1 _powerStateDidChange];
}

id objc_msgSend__presentAlternateNetworkViewControllerWithInfo_(void *a1, const char *a2, ...)
{
  return [a1 _presentAlternateNetworkViewControllerWithInfo:];
}

id objc_msgSend__presentFailedAssociationAlertWithTitle_message_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentFailedAssociationAlertWithTitle:message:");
}

id objc_msgSend__presentOpenNetworkAssociationFailureAlertWithNetworkName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentOpenNetworkAssociationFailureAlertWithNetworkName:");
}

id objc_msgSend__presentVC_onLayer_backgroundTunnel_statusBarVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_presentVC:onLayer:backgroundTunnel:statusBarVisible:animated:completion:");
}

id objc_msgSend__presentWiFiNetworkTimeoutAlert(void *a1, const char *a2, ...)
{
  return _[a1 _presentWiFiNetworkTimeoutAlert];
}

id objc_msgSend__preventIdleSleep(void *a1, const char *a2, ...)
{
  return _[a1 _preventIdleSleep];
}

id objc_msgSend__preventIdleSleepForNumberOfSeconds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_preventIdleSleepForNumberOfSeconds:");
}

id objc_msgSend__privateNotificationOccurred_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_privateNotificationOccurred:");
}

id objc_msgSend__processBasicConfigFromEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_processBasicConfigFromEvent:");
}

id objc_msgSend__pushedViewControllerBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 _pushedViewControllerBackgroundColor];
}

id objc_msgSend__recentCameraAndMicrophoneActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 _recentCameraAndMicrophoneActivityAttributions];
}

id objc_msgSend__rectTuckedInBoundingPathCorner_withSize_cornerRadii_minimumPadding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_rectTuckedInBoundingPathCorner:withSize:cornerRadii:minimumPadding:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _[a1 _referenceBounds];
}

id objc_msgSend__refreshLanguageStrings(void *a1, const char *a2, ...)
{
  return _[a1 _refreshLanguageStrings];
}

id objc_msgSend__registerForNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerForNotifications];
}

id objc_msgSend__registerWiFiNotifications(void *a1, const char *a2, ...)
{
  return _[a1 _registerWiFiNotifications];
}

id objc_msgSend__rekeyWindows(void *a1, const char *a2, ...)
{
  return _[a1 _rekeyWindows];
}

id objc_msgSend__respondToCurrentThermalCondition(void *a1, const char *a2, ...)
{
  return _[a1 _respondToCurrentThermalCondition];
}

id objc_msgSend__restartTimeItemTimer(void *a1, const char *a2, ...)
{
  return _[a1 _restartTimeItemTimer];
}

id objc_msgSend__restartWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _[a1 _restartWiFiNetworkScan];
}

id objc_msgSend__ringerSwitchDown(void *a1, const char *a2, ...)
{
  return _[a1 _ringerSwitchDown];
}

id objc_msgSend__ringerSwitchUp(void *a1, const char *a2, ...)
{
  return _[a1 _ringerSwitchUp];
}

id objc_msgSend__rootStatusBarViewController(void *a1, const char *a2, ...)
{
  return _[a1 _rootStatusBarViewController];
}

id objc_msgSend__savePendingInfoWithScanResult_password_isHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_savePendingInfoWithScanResult:password:isHidden:");
}

id objc_msgSend__scanComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scanComplete:");
}

id objc_msgSend__scanWifiList(void *a1, const char *a2, ...)
{
  return _[a1 _scanWifiList];
}

id objc_msgSend__sceneForFBSScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sceneForFBSScene:");
}

id objc_msgSend__securitySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 _securitySpecifier];
}

id objc_msgSend__selectLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_selectLanguage:");
}

id objc_msgSend__setAllowsHighContrastForBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsHighContrastForBackgroundColor:");
}

id objc_msgSend__setAutoDiagsFromNVRamWithNavController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAutoDiagsFromNVRamWithNavController:");
}

id objc_msgSend__setClassesForProxyServerOnInterface_(void *a1, const char *a2, ...)
{
  return [a1 _setClassesForProxyServerOnInterface:];
}

id objc_msgSend__setClassesForRemoteAlertsOnInterface_(void *a1, const char *a2, ...)
{
  return [a1 _setClassesForRemoteAlertsOnInterface:];
}

id objc_msgSend__setDesiredUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 _setDesiredUserDefaults];
}

id objc_msgSend__setDrawsSeparatorAtTopOfSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setDrawsSeparatorAtTopOfSections:");
}

id objc_msgSend__setHIDUILockedState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setHIDUILockedState:");
}

id objc_msgSend__setIndicatorVisible_atLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setIndicatorVisible:atLocation:");
}

id objc_msgSend__setItem_enabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setItem:enabled:");
}

id objc_msgSend__setLanguageFromNVRam(void *a1, const char *a2, ...)
{
  return _[a1 _setLanguageFromNVRam];
}

id objc_msgSend__setReturnKeyEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setReturnKeyEnabled:");
}

id objc_msgSend__setShowsBackButtonIndicator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setShowsBackButtonIndicator:");
}

id objc_msgSend__setSkipDiagsTermsAndConditionsFromNVRam(void *a1, const char *a2, ...)
{
  return _[a1 _setSkipDiagsTermsAndConditionsFromNVRam];
}

id objc_msgSend__setWiFiFromNVRam(void *a1, const char *a2, ...)
{
  return _[a1 _setWiFiFromNVRam];
}

id objc_msgSend__setupBattery(void *a1, const char *a2, ...)
{
  return _[a1 _setupBattery];
}

id objc_msgSend__setupLanguageButton(void *a1, const char *a2, ...)
{
  return _[a1 _setupLanguageButton];
}

id objc_msgSend__setupLock(void *a1, const char *a2, ...)
{
  return _[a1 _setupLock];
}

id objc_msgSend__setupNavBar(void *a1, const char *a2, ...)
{
  return _[a1 _setupNavBar];
}

id objc_msgSend__setupOnboardingButtons(void *a1, const char *a2, ...)
{
  return _[a1 _setupOnboardingButtons];
}

id objc_msgSend__setupTime(void *a1, const char *a2, ...)
{
  return _[a1 _setupTime];
}

id objc_msgSend__setupVersionFooter(void *a1, const char *a2, ...)
{
  return _[a1 _setupVersionFooter];
}

id objc_msgSend__setupWiFi(void *a1, const char *a2, ...)
{
  return _[a1 _setupWiFi];
}

id objc_msgSend__showActivityView(void *a1, const char *a2, ...)
{
  return _[a1 _showActivityView];
}

id objc_msgSend__showPowerDownView(void *a1, const char *a2, ...)
{
  return _[a1 _showPowerDownView];
}

id objc_msgSend__showSceneStatusBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showSceneStatusBar:");
}

id objc_msgSend__showWiFiSettingsAction(void *a1, const char *a2, ...)
{
  return _[a1 _showWiFiSettingsAction];
}

id objc_msgSend__sortWiFiScanResultsAlphabetically_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sortWiFiScanResultsAlphabetically:");
}

id objc_msgSend__startInactivityTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startInactivityTimer];
}

id objc_msgSend__startLockButtonTimer(void *a1, const char *a2, ...)
{
  return _[a1 _startLockButtonTimer];
}

id objc_msgSend__startNetworkScan(void *a1, const char *a2, ...)
{
  return _[a1 _startNetworkScan];
}

id objc_msgSend__startSystemStatusServer(void *a1, const char *a2, ...)
{
  return _[a1 _startSystemStatusServer];
}

id objc_msgSend__startWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _[a1 _startWiFiNetworkScan];
}

id objc_msgSend__startWifiScan(void *a1, const char *a2, ...)
{
  return _[a1 _startWifiScan];
}

id objc_msgSend__statusBarStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_statusBarStyle:");
}

id objc_msgSend__stopInactivityTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopInactivityTimer];
}

id objc_msgSend__stopNetworkScan(void *a1, const char *a2, ...)
{
  return _[a1 _stopNetworkScan];
}

id objc_msgSend__stopTimeItemTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopTimeItemTimer];
}

id objc_msgSend__stopWiFiNetworkScan(void *a1, const char *a2, ...)
{
  return _[a1 _stopWiFiNetworkScan];
}

id objc_msgSend__stopWiFiTimeroutTimer(void *a1, const char *a2, ...)
{
  return _[a1 _stopWiFiTimeroutTimer];
}

id objc_msgSend__supportsSecureIndicator(void *a1, const char *a2, ...)
{
  return _[a1 _supportsSecureIndicator];
}

id objc_msgSend__supportsStatusBarItem(void *a1, const char *a2, ...)
{
  return _[a1 _supportsStatusBarItem];
}

id objc_msgSend__synchronizeDrawingWithFence_(void *a1, const char *a2, ...)
{
  return [a1 _synchronizeDrawingWithFence:];
}

id objc_msgSend__terminateApps_reason_reportCrash_description_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_terminateApps:reason:reportCrash:description:completion:");
}

id objc_msgSend__timeItemDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _timeItemDateFormatter];
}

id objc_msgSend__timeItemShortDateFormatter(void *a1, const char *a2, ...)
{
  return _[a1 _timeItemShortDateFormatter];
}

id objc_msgSend__topViewController(void *a1, const char *a2, ...)
{
  return _[a1 _topViewController];
}

id objc_msgSend__undimDisplay(void *a1, const char *a2, ...)
{
  return _[a1 _undimDisplay];
}

id objc_msgSend__updateBatteryItems(void *a1, const char *a2, ...)
{
  return _[a1 _updateBatteryItems];
}

id objc_msgSend__updateDataNetworkItem(void *a1, const char *a2, ...)
{
  return _[a1 _updateDataNetworkItem];
}

id objc_msgSend__updateForAssociationChange(void *a1, const char *a2, ...)
{
  return _[a1 _updateForAssociationChange];
}

id objc_msgSend__updateIndicatorStyleForSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return [a1 _updateIndicatorStyleForSensorActivityAttributions:];
}

id objc_msgSend__updateIndicatorViewForSensorType_(void *a1, const char *a2, ...)
{
  return [a1 _updateIndicatorViewForSensorType:];
}

id objc_msgSend__updateLevelForScene_transitionContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateLevelForScene:transitionContext:");
}

id objc_msgSend__updateLockItem(void *a1, const char *a2, ...)
{
  return _[a1 _updateLockItem];
}

id objc_msgSend__updatePowerState(void *a1, const char *a2, ...)
{
  return _[a1 _updatePowerState];
}

id objc_msgSend__updateRecordingIndicatorForStatusBarChanges(void *a1, const char *a2, ...)
{
  return _[a1 _updateRecordingIndicatorForStatusBarChanges];
}

id objc_msgSend__updateReturnKey(void *a1, const char *a2, ...)
{
  return _[a1 _updateReturnKey];
}

id objc_msgSend__updateSensorActivityItem(void *a1, const char *a2, ...)
{
  return _[a1 _updateSensorActivityItem];
}

id objc_msgSend__updateSignalStrength(void *a1, const char *a2, ...)
{
  return _[a1 _updateSignalStrength];
}

id objc_msgSend__updateSignalStrengthFromRawRSSI_andScaledRSSI_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateSignalStrengthFromRawRSSI:andScaledRSSI:");
}

id objc_msgSend__updateSystemApertureElementAssertion(void *a1, const char *a2, ...)
{
  return _[a1 _updateSystemApertureElementAssertion];
}

id objc_msgSend__updateTimeItems(void *a1, const char *a2, ...)
{
  return _[a1 _updateTimeItems];
}

id objc_msgSend__verifyAPTicketDigest_(void *a1, const char *a2, ...)
{
  return [a1 _verifyAPTicketDigest:];
}

id objc_msgSend__welcomeImageForSymbol_(void *a1, const char *a2, ...)
{
  return [a1 _welcomeImageForSymbol:];
}

id objc_msgSend__wifiScanCompleted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_wifiScanCompleted:");
}

id objc_msgSend_accessoryIcons(void *a1, const char *a2, ...)
{
  return _[a1 accessoryIcons];
}

id objc_msgSend_actionWithHandler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithHandler:];
}

id objc_msgSend_actionWithSettingsKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 actionWithSettingsKeyPath:];
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return [a1 activateConstraints:];
}

id objc_msgSend_activeAttributionData(void *a1, const char *a2, ...)
{
  return _[a1 activeAttributionData];
}

id objc_msgSend_activeCameraAndMicrophoneActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 activeCameraAndMicrophoneActivityAttributions];
}

id objc_msgSend_activeEntity(void *a1, const char *a2, ...)
{
  return _[a1 activeEntity];
}

id objc_msgSend_activeKeyboard(void *a1, const char *a2, ...)
{
  return _[a1 activeKeyboard];
}

id objc_msgSend_activeSensorActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 activeSensorActivityAttributions];
}

id objc_msgSend_activityAttribution(void *a1, const char *a2, ...)
{
  return _[a1 activityAttribution];
}

id objc_msgSend_activityDidChangeForSensorActivityDataProvider_(void *a1, const char *a2, ...)
{
  return [a1 activityDidChangeForSensorActivityDataProvider:];
}

id objc_msgSend_activityView(void *a1, const char *a2, ...)
{
  return _[a1 activityView];
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

id objc_msgSend_addBatteryDeviceObserver_queue_(void *a1, const char *a2, ...)
{
  return [a1 addBatteryDeviceObserver:queue:];
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return [a1 addButton:];
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return [a1 addCompletion:];
}

id objc_msgSend_addContentSubView_heightConstraintForLayout_(void *a1, const char *a2, ...)
{
  return [a1 addContentSubView:heightConstraintForLayout:];
}

id objc_msgSend_addElement_(void *a1, const char *a2, ...)
{
  return [a1 addElement:];
}

id objc_msgSend_addGestureRecognizer_toDisplayWithIdentity_(void *a1, const char *a2, ...)
{
  return [a1 addGestureRecognizer:toDisplayWithIdentity:];
}

id objc_msgSend_addInput_(void *a1, const char *a2, ...)
{
  return [a1 addInput:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addObjectsFromArray:];
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:];
}

id objc_msgSend_addObserver_selector_forHostname_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:forHostname:];
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return [a1 addObserver:selector:name:object:];
}

id objc_msgSend_addObserverForName_object_queue_usingBlock_(void *a1, const char *a2, ...)
{
  return [a1 addObserverForName:object:queue:usingBlock:];
}

id objc_msgSend_addOutput_(void *a1, const char *a2, ...)
{
  return [a1 addOutput:];
}

id objc_msgSend_addScene_(void *a1, const char *a2, ...)
{
  return [a1 addScene:];
}

id objc_msgSend_addShutdownTask_forReason_(void *a1, const char *a2, ...)
{
  return [a1 addShutdownTask:forReason:];
}

id objc_msgSend_addSpecifiersFromArray_(void *a1, const char *a2, ...)
{
  return [a1 addSpecifiersFromArray:];
}

id objc_msgSend_addSublayer_(void *a1, const char *a2, ...)
{
  return [a1 addSublayer:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTimer_forMode_(void *a1, const char *a2, ...)
{
  return [a1 addTimer:forMode:];
}

id objc_msgSend_affineTransform(void *a1, const char *a2, ...)
{
  return _[a1 affineTransform];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_alertVisible(void *a1, const char *a2, ...)
{
  return _[a1 alertVisible];
}

id objc_msgSend_aliasDict(void *a1, const char *a2, ...)
{
  return _[a1 aliasDict];
}

id objc_msgSend_allApplicationProcesses(void *a1, const char *a2, ...)
{
  return _[a1 allApplicationProcesses];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allowWiFiSettingsAction(void *a1, const char *a2, ...)
{
  return _[a1 allowWiFiSettingsAction];
}

id objc_msgSend_animationController(void *a1, const char *a2, ...)
{
  return _[a1 animationController];
}

id objc_msgSend_animationController_(void *a1, const char *a2, ...)
{
  return [a1 animationController:];
}

id objc_msgSend_animationController_animatedStates_startAtFirstState_(void *a1, const char *a2, ...)
{
  return [a1 animationController:animatedStates:startAtFirstState:];
}

id objc_msgSend_animationFence(void *a1, const char *a2, ...)
{
  return _[a1 animationFence];
}

id objc_msgSend_animationView(void *a1, const char *a2, ...)
{
  return _[a1 animationView];
}

id objc_msgSend_animationWithKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 animationWithKeyPath:];
}

id objc_msgSend_apTicket(void *a1, const char *a2, ...)
{
  return _[a1 apTicket];
}

id objc_msgSend_appClientSettingsDiffInspector(void *a1, const char *a2, ...)
{
  return _[a1 appClientSettingsDiffInspector];
}

id objc_msgSend_appendBodySectionWithName_multilinePrefix_block_(void *a1, const char *a2, ...)
{
  return [a1 appendBodySectionWithName:multilinePrefix:block:];
}

id objc_msgSend_appendBool_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendBool:withName:];
}

id objc_msgSend_appendHashingBlocks_(void *a1, const char *a2, ...)
{
  return [a1 appendHashingBlocks:];
}

id objc_msgSend_appendInteger_(void *a1, const char *a2, ...)
{
  return [a1 appendInteger:];
}

id objc_msgSend_appendInteger_counterpart_(void *a1, const char *a2, ...)
{
  return [a1 appendInteger:counterpart:];
}

id objc_msgSend_appendObject_(void *a1, const char *a2, ...)
{
  return [a1 appendObject:];
}

id objc_msgSend_appendObject_counterpart_(void *a1, const char *a2, ...)
{
  return [a1 appendObject:counterpart:];
}

id objc_msgSend_appendObject_withName_(void *a1, const char *a2, ...)
{
  return [a1 appendObject:withName:];
}

id objc_msgSend_applicationProcessesForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProcessesForBundleIdentifier:];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 applicationProxyForIdentifier];
}

id objc_msgSend_applyPostUISettingsFromNvramWithNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 applyPostUISettingsFromNvramWithNavigationController:];
}

id objc_msgSend_applyPreUISettingsFromNvram(void *a1, const char *a2, ...)
{
  return _[a1 applyPreUISettingsFromNvram];
}

id objc_msgSend_applyThemeToNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 applyThemeToNavigationController:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithCapacity:];
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObject:];
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_assignProxyServer_(void *a1, const char *a2, ...)
{
  return [a1 assignProxyServer:];
}

id objc_msgSend_associateToEncryptedNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return [a1 associateToEncryptedNetworkWithName:password:];
}

id objc_msgSend_associateToEncryptedNetworkWithScanResult_password_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "associateToEncryptedNetworkWithScanResult:password:");
}

id objc_msgSend_associateToHiddenEncryptedNetworkWithName_password_(void *a1, const char *a2, ...)
{
  return [a1 associateToHiddenEncryptedNetworkWithName:password:];
}

id objc_msgSend_associateToHiddenUnencryptedNetworkWithName_(void *a1, const char *a2, ...)
{
  return [a1 associateToHiddenUnencryptedNetworkWithName:];
}

id objc_msgSend_associateWithParameters_reply_(void *a1, const char *a2, ...)
{
  return [a1 associateWithParameters:reply:];
}

id objc_msgSend_attemptsNetworkReconnect(void *a1, const char *a2, ...)
{
  return _[a1 attemptsNetworkReconnect];
}

id objc_msgSend_attentionAwarenessClient(void *a1, const char *a2, ...)
{
  return _[a1 attentionAwarenessClient];
}

id objc_msgSend_attributedEntity(void *a1, const char *a2, ...)
{
  return _[a1 attributedEntity];
}

id objc_msgSend_audioRecordingActivityAttribution(void *a1, const char *a2, ...)
{
  return _[a1 audioRecordingActivityAttribution];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_autoAdvanceToNextScene(void *a1, const char *a2, ...)
{
  return _[a1 autoAdvanceToNextScene];
}

id objc_msgSend_availableLocaleIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 availableLocaleIdentifiers];
}

id objc_msgSend_availableMetadataObjectTypes(void *a1, const char *a2, ...)
{
  return _[a1 availableMetadataObjectTypes];
}

id objc_msgSend_background(void *a1, const char *a2, ...)
{
  return _[a1 background];
}

id objc_msgSend_backgroundTunnel(void *a1, const char *a2, ...)
{
  return _[a1 backgroundTunnel];
}

id objc_msgSend_backgroundWindow(void *a1, const char *a2, ...)
{
  return _[a1 backgroundWindow];
}

id objc_msgSend_baseLanguageFromLanguage_(void *a1, const char *a2, ...)
{
  return [a1 baseLanguageFromLanguage:];
}

id objc_msgSend_baseSystemLanguages(void *a1, const char *a2, ...)
{
  return _[a1 baseSystemLanguages];
}

id objc_msgSend_basicConfig(void *a1, const char *a2, ...)
{
  return _[a1 basicConfig];
}

id objc_msgSend_batteryDetailString(void *a1, const char *a2, ...)
{
  return _[a1 batteryDetailString];
}

id objc_msgSend_batteryDeviceController(void *a1, const char *a2, ...)
{
  return _[a1 batteryDeviceController];
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return _[a1 batteryLevel];
}

id objc_msgSend_batteryState(void *a1, const char *a2, ...)
{
  return _[a1 batteryState];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 becomeFirstResponder];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return _[a1 begin];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _[a1 boldButton];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return [a1 BOOLForKey:];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bootIntentLocale(void *a1, const char *a2, ...)
{
  return _[a1 bootIntentLocale];
}

id objc_msgSend_bootIntentManager(void *a1, const char *a2, ...)
{
  return _[a1 bootIntentManager];
}

id objc_msgSend_bootIntentSSID(void *a1, const char *a2, ...)
{
  return _[a1 bootIntentSSID];
}

id objc_msgSend_bootIntentWifiPassword(void *a1, const char *a2, ...)
{
  return _[a1 bootIntentWifiPassword];
}

id objc_msgSend_bootIntentWifiSSID(void *a1, const char *a2, ...)
{
  return _[a1 bootIntentWifiSSID];
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

id objc_msgSend_broadcastingForSetup(void *a1, const char *a2, ...)
{
  return _[a1 broadcastingForSetup];
}

id objc_msgSend_bs_map_(void *a1, const char *a2, ...)
{
  return [a1 bs_map:];
}

id objc_msgSend_bs_safeObjectForKey_ofType_(void *a1, const char *a2, ...)
{
  return [a1 bs_safeObjectForKey:ofType:];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return _[a1 build];
}

id objc_msgSend_builder(void *a1, const char *a2, ...)
{
  return _[a1 builder];
}

id objc_msgSend_builderWithObject_(void *a1, const char *a2, ...)
{
  return [a1 builderWithObject:];
}

id objc_msgSend_builderWithObject_ofExpectedClass_(void *a1, const char *a2, ...)
{
  return [a1 builderWithObject:ofExpectedClass:];
}

id objc_msgSend_builtinDisplay(void *a1, const char *a2, ...)
{
  return _[a1 builtinDisplay];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return [a1 bundleForClass:];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundlePath(void *a1, const char *a2, ...)
{
  return _[a1 bundlePath];
}

id objc_msgSend_bundleUrlForPackageName_(void *a1, const char *a2, ...)
{
  return [a1 bundleUrlForPackageName:];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _[a1 buttonTray];
}

id objc_msgSend_buttonWithConfiguration_primaryAction_(void *a1, const char *a2, ...)
{
  return [a1 buttonWithConfiguration:primaryAction:];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return _[a1 bytes];
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 cStringUsingEncoding:];
}

id objc_msgSend_cachedLinkDownStatus(void *a1, const char *a2, ...)
{
  return _[a1 cachedLinkDownStatus];
}

id objc_msgSend_cameraCaptureAttribution(void *a1, const char *a2, ...)
{
  return _[a1 cameraCaptureAttribution];
}

id objc_msgSend_canAddInput_(void *a1, const char *a2, ...)
{
  return [a1 canAddInput:];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:];
}

id objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(void *a1, const char *a2, ...)
{
  return [a1 cancelPreviousPerformRequestsWithTarget:nil selector:nil object:nil];
}

id objc_msgSend_cancelRequestsWithUUID_error_(void *a1, const char *a2, ...)
{
  return [a1 cancelRequestsWithUUID:error:];
}

id objc_msgSend_canonicalLocaleIdentifierFromString_(void *a1, const char *a2, ...)
{
  return [a1 canonicalLocaleIdentifierFromString:];
}

id objc_msgSend_capturePreviewLayer(void *a1, const char *a2, ...)
{
  return _[a1 capturePreviewLayer];
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return _[a1 captureSession];
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 cellForRowAtIndexPath:];
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

id objc_msgSend_cgColor(void *a1, const char *a2, ...)
{
  return _[a1 cgColor];
}

id objc_msgSend_changeDesiredAuthType_(void *a1, const char *a2, ...)
{
  return [a1 changeDesiredAuthType:];
}

id objc_msgSend_characterLimit(void *a1, const char *a2, ...)
{
  return _[a1 characterLimit];
}

id objc_msgSend_characterSetWithCharactersInString_(void *a1, const char *a2, ...)
{
  return [a1 characterSetWithCharactersInString:];
}

id objc_msgSend_checkedInWiFiSettings(void *a1, const char *a2, ...)
{
  return _[a1 checkedInWiFiSettings];
}

id objc_msgSend_checkoutAndReboot_userInitiated_(void *a1, const char *a2, ...)
{
  return [a1 checkoutAndReboot:userInitiated:];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return _[a1 cleanUp];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_clearNVRamVariable_(void *a1, const char *a2, ...)
{
  return [a1 clearNVRamVariable:];
}

id objc_msgSend_clientInterface(void *a1, const char *a2, ...)
{
  return _[a1 clientInterface];
}

id objc_msgSend_clientProcess(void *a1, const char *a2, ...)
{
  return _[a1 clientProcess];
}

id objc_msgSend_clientSettings(void *a1, const char *a2, ...)
{
  return _[a1 clientSettings];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_coldTempToken(void *a1, const char *a2, ...)
{
  return _[a1 coldTempToken];
}

id objc_msgSend_colorWithWhite_alpha_(void *a1, const char *a2, ...)
{
  return [a1 colorWithWhite:alpha:];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 commitConfiguration];
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 componentsFromLocaleIdentifier:];
}

id objc_msgSend_configurationWithAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithAttentionLostTimeout:];
}

id objc_msgSend_configureForRemoteSetup(void *a1, const char *a2, ...)
{
  return _[a1 configureForRemoteSetup];
}

id objc_msgSend_connectToSSID_completion_(void *a1, const char *a2, ...)
{
  return [a1 connectToSSID:completion:];
}

id objc_msgSend_connectToSSID_password_completion_(void *a1, const char *a2, ...)
{
  return [a1 connectToSSID:password:completion:];
}

id objc_msgSend_connectedNetwork_(void *a1, const char *a2, ...)
{
  return [a1 connectedNetwork];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return _[a1 constant];
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

id objc_msgSend_constraintGreaterThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToAnchor:];
}

id objc_msgSend_constraintGreaterThanOrEqualToConstant_(void *a1, const char *a2, ...)
{
  return [a1 constraintGreaterThanOrEqualToConstant:];
}

id objc_msgSend_constraintLessThanOrEqualToAnchor_(void *a1, const char *a2, ...)
{
  return [a1 constraintLessThanOrEqualToAnchor:];
}

id objc_msgSend_containerFooterView(void *a1, const char *a2, ...)
{
  return _[a1 containerFooterView];
}

id objc_msgSend_containerView(void *a1, const char *a2, ...)
{
  return _[a1 containerView];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_continueButton(void *a1, const char *a2, ...)
{
  return _[a1 continueButton];
}

id objc_msgSend_continueTapped(void *a1, const char *a2, ...)
{
  return _[a1 continueTapped];
}

id objc_msgSend_convertPoint_fromView_(void *a1, const char *a2, ...)
{
  return [a1 convertPoint:fromView:];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return [a1 copyPathForPersonalizedData:error:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_countForObject_(void *a1, const char *a2, ...)
{
  return [a1 countForObject:];
}

id objc_msgSend_countryCode(void *a1, const char *a2, ...)
{
  return _[a1 countryCode];
}

id objc_msgSend_createRepresentationWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 createRepresentationWithIdentifier:];
}

id objc_msgSend_createSceneWithDefinition_(void *a1, const char *a2, ...)
{
  return [a1 createSceneWithDefinition:];
}

id objc_msgSend_createSceneWithDefinition_initialParameters_(void *a1, const char *a2, ...)
{
  return [a1 createSceneWithDefinition:initialParameters:];
}

id objc_msgSend_currentBatteryDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentBatteryDevice];
}

id objc_msgSend_currentBootIntentReason(void *a1, const char *a2, ...)
{
  return _[a1 currentBootIntentReason];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return _[a1 currentHandler];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 currentLocaleIdentifier];
}

id objc_msgSend_currentNetwork(void *a1, const char *a2, ...)
{
  return _[a1 currentNetwork];
}

id objc_msgSend_currentNetworkSSID(void *a1, const char *a2, ...)
{
  return _[a1 currentNetworkSSID];
}

id objc_msgSend_currentOpenAppBundleIDs(void *a1, const char *a2, ...)
{
  return _[a1 currentOpenAppBundleIDs];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 currentRunLoop];
}

id objc_msgSend_currentScanResult(void *a1, const char *a2, ...)
{
  return _[a1 currentScanResult];
}

id objc_msgSend_currentSecurityGroup(void *a1, const char *a2, ...)
{
  return _[a1 currentSecurityGroup];
}

id objc_msgSend_currentStyle(void *a1, const char *a2, ...)
{
  return _[a1 currentStyle];
}

id objc_msgSend_currentlyActiveTextField(void *a1, const char *a2, ...)
{
  return _[a1 currentlyActiveTextField];
}

id objc_msgSend_customBackButton(void *a1, const char *a2, ...)
{
  return _[a1 customBackButton];
}

id objc_msgSend_cwInterface(void *a1, const char *a2, ...)
{
  return _[a1 cwInterface];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return _[a1 data];
}

id objc_msgSend_dataAccessAttributions(void *a1, const char *a2, ...)
{
  return _[a1 dataAccessAttributions];
}

id objc_msgSend_dataAccessType(void *a1, const char *a2, ...)
{
  return _[a1 dataAccessType];
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return [a1 dataUsingEncoding:];
}

id objc_msgSend_dataWithContentsOfFile_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithContentsOfFile:options:error:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeInterval_sinceDate_(void *a1, const char *a2, ...)
{
  return [a1 dateWithTimeInterval:sinceDate:];
}

id objc_msgSend_debugInfoVisible(void *a1, const char *a2, ...)
{
  return _[a1 debugInfoVisible];
}

id objc_msgSend_debugInfoWindow(void *a1, const char *a2, ...)
{
  return _[a1 debugInfoWindow];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultDeviceWithDeviceType_mediaType_position_(void *a1, const char *a2, ...)
{
  return [a1 defaultDeviceWithDeviceType:mediaType:position:];
}

id objc_msgSend_defaultFocusPredicate(void *a1, const char *a2, ...)
{
  return _[a1 defaultFocusPredicate];
}

id objc_msgSend_defaultScale(void *a1, const char *a2, ...)
{
  return _[a1 defaultScale];
}

id objc_msgSend_defaultSystemPredicate(void *a1, const char *a2, ...)
{
  return _[a1 defaultSystemPredicate];
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return _[a1 definition];
}

id objc_msgSend_delayBeforeFadeIn180(void *a1, const char *a2, ...)
{
  return _[a1 delayBeforeFadeIn180];
}

id objc_msgSend_delayBeforeFadeIn90(void *a1, const char *a2, ...)
{
  return _[a1 delayBeforeFadeIn90];
}

id objc_msgSend_delayBeforeFadeOut180(void *a1, const char *a2, ...)
{
  return _[a1 delayBeforeFadeOut180];
}

id objc_msgSend_delayBeforeFadeOut90(void *a1, const char *a2, ...)
{
  return _[a1 delayBeforeFadeOut90];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_deleteBootIntentSourceData(void *a1, const char *a2, ...)
{
  return _[a1 deleteBootIntentSourceData];
}

id objc_msgSend_dequeueReusableCellWithIdentifier_forIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 dequeueReusableCellWithIdentifier:forIndexPath:];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_descriptionBuilderWithMultilinePrefix_(void *a1, const char *a2, ...)
{
  return [a1 descriptionBuilderWithMultilinePrefix:];
}

id objc_msgSend_descriptorWithEventType_(void *a1, const char *a2, ...)
{
  return [a1 descriptorWithEventType:];
}

id objc_msgSend_descriptorWithPage_usage_(void *a1, const char *a2, ...)
{
  return [a1 descriptorWithPage:usage:];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return [a1 deselectRowAtIndexPath:animated:];
}

id objc_msgSend_destroyScene_withTransitionContext_(void *a1, const char *a2, ...)
{
  return [a1 destroyScene:withTransitionContext:];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return _[a1 device];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return _[a1 deviceClass];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return _[a1 devices];
}

id objc_msgSend_diagnosticsRunning_(void *a1, const char *a2, ...)
{
  return [a1 diagnosticsRunning:];
}

id objc_msgSend_diagsLaunchDependenciesSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 diagsLaunchDependenciesSemaphore];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithContentsOfFile_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithContentsOfFile:];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didLaunchApp(void *a1, const char *a2, ...)
{
  return _[a1 didLaunchApp];
}

id objc_msgSend_didMoveToEndgame(void *a1, const char *a2, ...)
{
  return _[a1 didMoveToEndgame];
}

id objc_msgSend_didTappedLanguageSelectorButton(void *a1, const char *a2, ...)
{
  return _[a1 didTappedLanguageSelectorButton];
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return _[a1 dimDisplay];
}

id objc_msgSend_disableBackButton(void *a1, const char *a2, ...)
{
  return _[a1 disableBackButton];
}

id objc_msgSend_disableNetworkReconnect(void *a1, const char *a2, ...)
{
  return _[a1 disableNetworkReconnect];
}

id objc_msgSend_disableS2R(void *a1, const char *a2, ...)
{
  return _[a1 disableS2R];
}

id objc_msgSend_disableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return _[a1 disableTouchButtonEvents];
}

id objc_msgSend_discoverySessionWithDeviceTypes_mediaType_position_(void *a1, const char *a2, ...)
{
  return [a1 discoverySessionWithDeviceTypes:mediaType:position:];
}

id objc_msgSend_dismissThermalWarningWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 dismissThermalWarningWithCompletion:];
}

id objc_msgSend_dismissViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:];
}

id objc_msgSend_dismissViewControllerAnimated_completion_(void *a1, const char *a2, ...)
{
  return [a1 dismissViewControllerAnimated:completion:];
}

id objc_msgSend_dismissed(void *a1, const char *a2, ...)
{
  return _[a1 dismissed];
}

id objc_msgSend_dispatchDiscreteEventsForReason_withRules_(void *a1, const char *a2, ...)
{
  return [a1 dispatchDiscreteEventsForReason:withRules:];
}

id objc_msgSend_displayDimmed_(void *a1, const char *a2, ...)
{
  return [a1 displayDimmed:];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentity];
}

id objc_msgSend_displayMode(void *a1, const char *a2, ...)
{
  return _[a1 displayMode];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return _[a1 displayName];
}

id objc_msgSend_elapsedCPUTime(void *a1, const char *a2, ...)
{
  return _[a1 elapsedCPUTime];
}

id objc_msgSend_enableBackButton(void *a1, const char *a2, ...)
{
  return _[a1 enableBackButton];
}

id objc_msgSend_enableContinueButton_(void *a1, const char *a2, ...)
{
  return [a1 enableContinueButton:];
}

id objc_msgSend_enableIdleSleep(void *a1, const char *a2, ...)
{
  return _[a1 enableIdleSleep];
}

id objc_msgSend_enableNetworkReconnect(void *a1, const char *a2, ...)
{
  return _[a1 enableNetworkReconnect];
}

id objc_msgSend_enableTouchButtonEvents(void *a1, const char *a2, ...)
{
  return _[a1 enableTouchButtonEvents];
}

id objc_msgSend_endRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _[a1 endRemoteSetupBroadcast];
}

id objc_msgSend_enumerateScenesWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateScenesWithBlock:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 errorWithDomain:code:userInfo:];
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return _[a1 eventMask];
}

id objc_msgSend_eventType(void *a1, const char *a2, ...)
{
  return _[a1 eventType];
}

id objc_msgSend_eventWithName_handler_(void *a1, const char *a2, ...)
{
  return [a1 eventWithName:handler:];
}

id objc_msgSend_executablePath(void *a1, const char *a2, ...)
{
  return _[a1 executablePath];
}

id objc_msgSend_execute(void *a1, const char *a2, ...)
{
  return _[a1 execute];
}

id objc_msgSend_exitAndRelaunch_(void *a1, const char *a2, ...)
{
  return [a1 exitAndRelaunch:];
}

id objc_msgSend_exitRequestedWithServer_(void *a1, const char *a2, ...)
{
  return [a1 exitRequestedWithServer:];
}

id objc_msgSend_exportedInterface(void *a1, const char *a2, ...)
{
  return _[a1 exportedInterface];
}

id objc_msgSend_fadeInDuration180(void *a1, const char *a2, ...)
{
  return _[a1 fadeInDuration180];
}

id objc_msgSend_fadeInDuration90(void *a1, const char *a2, ...)
{
  return _[a1 fadeInDuration90];
}

id objc_msgSend_fadeOutDuration180(void *a1, const char *a2, ...)
{
  return _[a1 fadeOutDuration180];
}

id objc_msgSend_fadeOutDuration90(void *a1, const char *a2, ...)
{
  return _[a1 fadeOutDuration90];
}

id objc_msgSend_fallbackButton(void *a1, const char *a2, ...)
{
  return _[a1 fallbackButton];
}

id objc_msgSend_fbsSceneWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 fbsSceneWithIdentifier];
}

id objc_msgSend_filterWithName_(void *a1, const char *a2, ...)
{
  return [a1 filterWithName:];
}

id objc_msgSend_filterWithType_(void *a1, const char *a2, ...)
{
  return [a1 filterWithType:];
}

id objc_msgSend_filteredWiFiScanResults(void *a1, const char *a2, ...)
{
  return _[a1 filteredWiFiScanResults];
}

id objc_msgSend_finishedBoot(void *a1, const char *a2, ...)
{
  return _[a1 finishedBoot];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return _[a1 firstResponder];
}

id objc_msgSend_forceUpdateStatusBarData(void *a1, const char *a2, ...)
{
  return _[a1 forceUpdateStatusBarData];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_getCString_maxLength_encoding_(void *a1, const char *a2, ...)
{
  return [a1 getCString:maxLength:encoding:];
}

id objc_msgSend_guessedCountries(void *a1, const char *a2, ...)
{
  return _[a1 guessedCountries];
}

id objc_msgSend_guessedLanguages(void *a1, const char *a2, ...)
{
  return _[a1 guessedLanguages];
}

id objc_msgSend_handleFailureInFunction_file_lineNumber_description_(void *a1, const char *a2, ...)
{
  return [a1 handleFailureInFunction:file:lineNumber:description:];
}

id objc_msgSend_handleSetupEvent_(void *a1, const char *a2, ...)
{
  return [a1 handleSetupEvent:];
}

id objc_msgSend_hasBeenShown(void *a1, const char *a2, ...)
{
  return _[a1 hasBeenShown];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return _[a1 hash];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_height(void *a1, const char *a2, ...)
{
  return _[a1 height];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_heightConstraint(void *a1, const char *a2, ...)
{
  return _[a1 heightConstraint];
}

id objc_msgSend_hiddenLockView(void *a1, const char *a2, ...)
{
  return _[a1 hiddenLockView];
}

id objc_msgSend_hiddenNetworkWithNoPasswordGroup(void *a1, const char *a2, ...)
{
  return _[a1 hiddenNetworkWithNoPasswordGroup];
}

id objc_msgSend_hiddenNetworkWithPasswordGroup(void *a1, const char *a2, ...)
{
  return _[a1 hiddenNetworkWithPasswordGroup];
}

id objc_msgSend_hideBackButton(void *a1, const char *a2, ...)
{
  return _[a1 hideBackButton];
}

id objc_msgSend_hideSceneStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 hideSceneStatusBar];
}

id objc_msgSend_hideStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 hideStatusBar];
}

id objc_msgSend_hidesBusyIndicator(void *a1, const char *a2, ...)
{
  return _[a1 hidesBusyIndicator];
}

id objc_msgSend_homeButtonPressedWithDisplayDim(void *a1, const char *a2, ...)
{
  return _[a1 homeButtonPressedWithDisplayDim];
}

id objc_msgSend_homeButtonType(void *a1, const char *a2, ...)
{
  return _[a1 homeButtonType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_identityForAngelJobLabel_(void *a1, const char *a2, ...)
{
  return [a1 identityForAngelJobLabel:];
}

id objc_msgSend_identityForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 identityForIdentifier:];
}

id objc_msgSend_identityForProcessIdentity_(void *a1, const char *a2, ...)
{
  return [a1 identityForProcessIdentity:];
}

id objc_msgSend_idleTimerDisabled(void *a1, const char *a2, ...)
{
  return _[a1 idleTimerDisabled];
}

id objc_msgSend_idleTimerDisabledReasons(void *a1, const char *a2, ...)
{
  return _[a1 idleTimerDisabledReasons];
}

id objc_msgSend_imageByApplyingTransform_(void *a1, const char *a2, ...)
{
  return [a1 imageByApplyingTransform:];
}

id objc_msgSend_imageForGraphicSymbolDescriptor_(void *a1, const char *a2, ...)
{
  return [a1 imageForGraphicSymbolDescriptor:];
}

id objc_msgSend_imageNamed_(void *a1, const char *a2, ...)
{
  return [a1 imageNamed:];
}

id objc_msgSend_imageWithCGImage_(void *a1, const char *a2, ...)
{
  return [a1 imageWithCGImage:];
}

id objc_msgSend_inactivityTimer(void *a1, const char *a2, ...)
{
  return _[a1 inactivityTimer];
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return [a1 indexForIndexPath:];
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_indexPathForIndex_(void *a1, const char *a2, ...)
{
  return [a1 indexPathForIndex:];
}

id objc_msgSend_indexToSelect(void *a1, const char *a2, ...)
{
  return _[a1 indexToSelect];
}

id objc_msgSend_indicatorContainerView(void *a1, const char *a2, ...)
{
  return _[a1 indicatorContainerView];
}

id objc_msgSend_indicatorState(void *a1, const char *a2, ...)
{
  return _[a1 indicatorState];
}

id objc_msgSend_indicatorType(void *a1, const char *a2, ...)
{
  return _[a1 indicatorType];
}

id objc_msgSend_indicatorView(void *a1, const char *a2, ...)
{
  return _[a1 indicatorView];
}

id objc_msgSend_infoButton(void *a1, const char *a2, ...)
{
  return _[a1 infoButton];
}

id objc_msgSend_initForLocation_(void *a1, const char *a2, ...)
{
  return [a1 initForLocation:];
}

id objc_msgSend_initWithActivityIndicatorStyle_(void *a1, const char *a2, ...)
{
  return [a1 initWithActivityIndicatorStyle:];
}

id objc_msgSend_initWithApplicationBundleID_executionContextProvider_(void *a1, const char *a2, ...)
{
  return [a1 initWithApplicationBundleID:executionContextProvider:];
}

id objc_msgSend_initWithBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return [a1 initWithBackgroundTunnel:];
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithBarButtonSystemItem:target:action:];
}

id objc_msgSend_initWithBootIntentSSID_passwordProtected_(void *a1, const char *a2, ...)
{
  return [a1 initWithBootIntentSSID:passwordProtected:];
}

id objc_msgSend_initWithBundleID_backgrounded_native_(void *a1, const char *a2, ...)
{
  return [a1 initWithBundleID:backgrounded:native:];
}

id objc_msgSend_initWithCADisplay_(void *a1, const char *a2, ...)
{
  return [a1 initWithCADisplay:];
}

id objc_msgSend_initWithCIImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithCIImage:];
}

id objc_msgSend_initWithCalloutQueue_(void *a1, const char *a2, ...)
{
  return [a1 initWithCalloutQueue:];
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return [a1 initWithCapacity:];
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithConfiguration:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:encoding:];
}

id objc_msgSend_initWithDataAccessAttribution_(void *a1, const char *a2, ...)
{
  return [a1 initWithDataAccessAttribution:];
}

id objc_msgSend_initWithDevice_error_(void *a1, const char *a2, ...)
{
  return [a1 initWithDevice:error:];
}

id objc_msgSend_initWithDeviceInfoValues_(void *a1, const char *a2, ...)
{
  return [a1 initWithDeviceInfoValues:];
}

id objc_msgSend_initWithDisplayConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithDisplayConfiguration:];
}

id objc_msgSend_initWithDisplayContext_deviceContext_persistedSceneIdentifiers_supportAppSceneRequests_(void *a1, const char *a2, ...)
{
  return [a1 initWithDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:];
}

id objc_msgSend_initWithDuration_curve_animations_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:curve:animations:];
}

id objc_msgSend_initWithDuration_dampingRatio_animations_(void *a1, const char *a2, ...)
{
  return [a1 initWithDuration:dampingRatio:animations:];
}

id objc_msgSend_initWithFireDate_serviceIdentifier_target_selector_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 initWithFireDate:serviceIdentifier:target:selector:userInfo:];
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:];
}

id objc_msgSend_initWithFrame_showForegroundView_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:showForegroundView:];
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return [a1 initWithFrame:style:];
}

id objc_msgSend_initWithHeight_(void *a1, const char *a2, ...)
{
  return [a1 initWithHeight:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithImage_(void *a1, const char *a2, ...)
{
  return [a1 initWithImage:];
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:];
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return [a1 initWithMachServiceName:options:];
}

id objc_msgSend_initWithMainNavController_(void *a1, const char *a2, ...)
{
  return [a1 initWithMainNavController:];
}

id objc_msgSend_initWithPassword_(void *a1, const char *a2, ...)
{
  return [a1 initWithPassword:];
}

id objc_msgSend_initWithPriority_displayConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 initWithPriority:displayConfiguration:];
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return [a1 initWithReason:];
}

id objc_msgSend_initWithRect_(void *a1, const char *a2, ...)
{
  return [a1 initWithRect:];
}

id objc_msgSend_initWithRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 initWithRootViewController:];
}

id objc_msgSend_initWithScanCompletion_(void *a1, const char *a2, ...)
{
  return [a1 initWithScanCompletion:];
}

id objc_msgSend_initWithScanResult_(void *a1, const char *a2, ...)
{
  return [a1 initWithScanResult:];
}

id objc_msgSend_initWithScanResult_prepopulatedPassword_prepopulatedSSID_(void *a1, const char *a2, ...)
{
  return [a1 initWithScanResult:prepopulatedPassword:prepopulatedSSID:];
}

id objc_msgSend_initWithServerHandle_(void *a1, const char *a2, ...)
{
  return [a1 initWithServerHandle:];
}

id objc_msgSend_initWithSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithSession:];
}

id objc_msgSend_initWithSetupPresentationTheme_(void *a1, const char *a2, ...)
{
  return [a1 initWithSetupPresentationTheme:];
}

id objc_msgSend_initWithSourceView_(void *a1, const char *a2, ...)
{
  return [a1 initWithSourceView:];
}

id objc_msgSend_initWithStateName_darkStateName_transitionDuration_transitionSpeed_(void *a1, const char *a2, ...)
{
  return [a1 initWithStateName:darkStateName:transitionDuration:transitionSpeed:];
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return [a1 initWithString:attributes:];
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return [a1 initWithSuiteName:];
}

id objc_msgSend_initWithSymbolName_bundleURL_(void *a1, const char *a2, ...)
{
  return [a1 initWithSymbolName:bundleURL:];
}

id objc_msgSend_initWithSystemColor_(void *a1, const char *a2, ...)
{
  return [a1 initWithSystemColor:];
}

id objc_msgSend_initWithSystemStatusServer_(void *a1, const char *a2, ...)
{
  return [a1 initWithSystemStatusServer:];
}

id objc_msgSend_initWithTarget_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTarget:action:];
}

id objc_msgSend_initWithTitle_detailText_icon_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:detailText:icon:];
}

id objc_msgSend_initWithTitle_detailText_icon_remoteSetupManager_captureSession_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:detailText:icon:remoteSetupManager:captureSession:];
}

id objc_msgSend_initWithTitle_style_target_action_(void *a1, const char *a2, ...)
{
  return [a1 initWithTitle:style:target:action:];
}

id objc_msgSend_initWithTop_left_bottom_right_(void *a1, const char *a2, ...)
{
  return [a1 initWithTop:left:bottom:right:];
}

id objc_msgSend_initWithUrlToPackage_animationView_animatedStates_startAtFirstState_(void *a1, const char *a2, ...)
{
  return [a1 initWithUrlToPackage:animationView:animatedStates:startAtFirstState:];
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:];
}

id objc_msgSend_initWithWindowScene_debugName_(void *a1, const char *a2, ...)
{
  return [a1 initWithWindowScene:debugName:];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return [a1 insertObject:atIndex:];
}

id objc_msgSend_inspectDiff_withContext_(void *a1, const char *a2, ...)
{
  return [a1 inspectDiff:withContext:];
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

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return [a1 interfaceWithProtocol:];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateAllTimelinesForReason_(void *a1, const char *a2, ...)
{
  return [a1 invalidateAllTimelinesForReason:];
}

id objc_msgSend_invertedSet(void *a1, const char *a2, ...)
{
  return _[a1 invertedSet];
}

id objc_msgSend_isApplicationProcess(void *a1, const char *a2, ...)
{
  return _[a1 isApplicationProcess];
}

id objc_msgSend_isAssociatedToNetwork(void *a1, const char *a2, ...)
{
  return _[a1 isAssociatedToNetwork];
}

id objc_msgSend_isBootIntentRecord(void *a1, const char *a2, ...)
{
  return _[a1 isBootIntentRecord];
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return _[a1 isCharging];
}

id objc_msgSend_isCurrentProcessFirstToReadIntent(void *a1, const char *a2, ...)
{
  return _[a1 isCurrentProcessFirstToReadIntent];
}

id objc_msgSend_isDisplayDim(void *a1, const char *a2, ...)
{
  return _[a1 isDisplayDim];
}

id objc_msgSend_isEAP(void *a1, const char *a2, ...)
{
  return _[a1 isEAP];
}

id objc_msgSend_isEntitledForTag_(void *a1, const char *a2, ...)
{
  return [a1 isEntitledForTag:];
}

id objc_msgSend_isEqual(void *a1, const char *a2, ...)
{
  return _[a1 isEqual];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return [a1 isEqual:];
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToNumber:];
}

id objc_msgSend_isEqualToSet_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToSet:];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isEqualToValue_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToValue:];
}

id objc_msgSend_isEquivalentRecord_(void *a1, const char *a2, ...)
{
  return [a1 isEquivalentRecord:];
}

id objc_msgSend_isForeground(void *a1, const char *a2, ...)
{
  return _[a1 isForeground];
}

id objc_msgSend_isHidden(void *a1, const char *a2, ...)
{
  return _[a1 isHidden];
}

id objc_msgSend_isInHardwareKeyboardMode(void *a1, const char *a2, ...)
{
  return _[a1 isInHardwareKeyboardMode];
}

id objc_msgSend_isInSunlight(void *a1, const char *a2, ...)
{
  return _[a1 isInSunlight];
}

id objc_msgSend_isIndicatorVisible(void *a1, const char *a2, ...)
{
  return _[a1 isIndicatorVisible];
}

id objc_msgSend_isIndicatorVisibleAtStatusBarLocation(void *a1, const char *a2, ...)
{
  return _[a1 isIndicatorVisibleAtStatusBarLocation];
}

id objc_msgSend_isInternal(void *a1, const char *a2, ...)
{
  return _[a1 isInternal];
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return _[a1 isInternalInstall];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return _[a1 isMainThread];
}

id objc_msgSend_isMinimized(void *a1, const char *a2, ...)
{
  return _[a1 isMinimized];
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingFromParentViewController];
}

id objc_msgSend_isMovingToParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingToParentViewController];
}

id objc_msgSend_isNetworkReachable(void *a1, const char *a2, ...)
{
  return _[a1 isNetworkReachable];
}

id objc_msgSend_isPersonalHotspot(void *a1, const char *a2, ...)
{
  return _[a1 isPersonalHotspot];
}

id objc_msgSend_isPresentedForSetupFlow(void *a1, const char *a2, ...)
{
  return _[a1 isPresentedForSetupFlow];
}

id objc_msgSend_isRecent(void *a1, const char *a2, ...)
{
  return _[a1 isRecent];
}

id objc_msgSend_isRunningOnPhysicalHardware(void *a1, const char *a2, ...)
{
  return _[a1 isRunningOnPhysicalHardware];
}

id objc_msgSend_isSecure(void *a1, const char *a2, ...)
{
  return _[a1 isSecure];
}

id objc_msgSend_isSystemApplicationProcess(void *a1, const char *a2, ...)
{
  return _[a1 isSystemApplicationProcess];
}

id objc_msgSend_isSystemService(void *a1, const char *a2, ...)
{
  return _[a1 isSystemService];
}

id objc_msgSend_isThermalBlocked(void *a1, const char *a2, ...)
{
  return _[a1 isThermalBlocked];
}

id objc_msgSend_isUISubclass(void *a1, const char *a2, ...)
{
  return _[a1 isUISubclass];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return _[a1 isValid];
}

id objc_msgSend_isWAPI(void *a1, const char *a2, ...)
{
  return _[a1 isWAPI];
}

id objc_msgSend_isWEP(void *a1, const char *a2, ...)
{
  return _[a1 isWEP];
}

id objc_msgSend_isWPA(void *a1, const char *a2, ...)
{
  return _[a1 isWPA];
}

id objc_msgSend_isWPA2(void *a1, const char *a2, ...)
{
  return _[a1 isWPA2];
}

id objc_msgSend_isWPA3(void *a1, const char *a2, ...)
{
  return _[a1 isWPA3];
}

id objc_msgSend_isWiFiPoweredOn(void *a1, const char *a2, ...)
{
  return _[a1 isWiFiPoweredOn];
}

id objc_msgSend_joinTapped_(void *a1, const char *a2, ...)
{
  return [a1 joinTapped:];
}

id objc_msgSend_joinTimer(void *a1, const char *a2, ...)
{
  return _[a1 joinTimer];
}

id objc_msgSend_joining(void *a1, const char *a2, ...)
{
  return _[a1 joining];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return _[a1 keyWindow];
}

id objc_msgSend_keyboardFocusTarget(void *a1, const char *a2, ...)
{
  return _[a1 keyboardFocusTarget];
}

id objc_msgSend_keyboardScene(void *a1, const char *a2, ...)
{
  return _[a1 keyboardScene];
}

id objc_msgSend_killForReason_andReport_withDescription_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "killForReason:andReport:withDescription:completion:");
}

id objc_msgSend_languageButton(void *a1, const char *a2, ...)
{
  return _[a1 languageButton];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_languageCodes(void *a1, const char *a2, ...)
{
  return _[a1 languageCodes];
}

id objc_msgSend_languageComposite(void *a1, const char *a2, ...)
{
  return _[a1 languageComposite];
}

id objc_msgSend_languageFromLanguage_byReplacingRegion_(void *a1, const char *a2, ...)
{
  return [a1 languageFromLanguage:byReplacingRegion:];
}

id objc_msgSend_languageStrings(void *a1, const char *a2, ...)
{
  return _[a1 languageStrings];
}

id objc_msgSend_languageTableView(void *a1, const char *a2, ...)
{
  return _[a1 languageTableView];
}

id objc_msgSend_lastBaselineAnchor(void *a1, const char *a2, ...)
{
  return _[a1 lastBaselineAnchor];
}

id objc_msgSend_lastGoodNetwork(void *a1, const char *a2, ...)
{
  return _[a1 lastGoodNetwork];
}

id objc_msgSend_lastLockState(void *a1, const char *a2, ...)
{
  return _[a1 lastLockState];
}

id objc_msgSend_lastLockStateSet(void *a1, const char *a2, ...)
{
  return _[a1 lastLockStateSet];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_launch(void *a1, const char *a2, ...)
{
  return _[a1 launch];
}

id objc_msgSend_launchAdvisorWithOmniscientDelegate_sceneDelegate_(void *a1, const char *a2, ...)
{
  return [a1 launchAdvisorWithOmniscientDelegate:sceneDelegate:];
}

id objc_msgSend_launchAppWithBundleID_suspended_native_completion_(void *a1, const char *a2, ...)
{
  return [a1 launchAppWithBundleID:suspended:native:completion:];
}

id objc_msgSend_launchDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 launchDiagnostics];
}

id objc_msgSend_launchDiagnosticsApp(void *a1, const char *a2, ...)
{
  return _[a1 launchDiagnosticsApp];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layers(void *a1, const char *a2, ...)
{
  return _[a1 layers];
}

id objc_msgSend_layoutElementInvalidator(void *a1, const char *a2, ...)
{
  return _[a1 layoutElementInvalidator];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 leftBarButtonItem];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return _[a1 level];
}

id objc_msgSend_lightGrayColor(void *a1, const char *a2, ...)
{
  return _[a1 lightGrayColor];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _[a1 linkButton];
}

id objc_msgSend_listener(void *a1, const char *a2, ...)
{
  return _[a1 listener];
}

id objc_msgSend_localIdentity(void *a1, const char *a2, ...)
{
  return _[a1 localIdentity];
}

id objc_msgSend_localServiceClient(void *a1, const char *a2, ...)
{
  return _[a1 localServiceClient];
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 localeWithLocaleIdentifier:];
}

id objc_msgSend_locales(void *a1, const char *a2, ...)
{
  return _[a1 locales];
}

id objc_msgSend_localizedCaseInsensitiveCompare_(void *a1, const char *a2, ...)
{
  return [a1 localizedCaseInsensitiveCompare:];
}

id objc_msgSend_localizedDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 localizedDisplayName];
}

id objc_msgSend_localizedExecutableDisplayName(void *a1, const char *a2, ...)
{
  return _[a1 localizedExecutableDisplayName];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_localizedStringForLanguage_context_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForLanguage:context:];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationAttribution(void *a1, const char *a2, ...)
{
  return _[a1 locationAttribution];
}

id objc_msgSend_lockButtonLongPressed(void *a1, const char *a2, ...)
{
  return _[a1 lockButtonLongPressed];
}

id objc_msgSend_lockButtonPressedWithDisplayDim(void *a1, const char *a2, ...)
{
  return _[a1 lockButtonPressedWithDisplayDim];
}

id objc_msgSend_lockButtonTimer(void *a1, const char *a2, ...)
{
  return _[a1 lockButtonTimer];
}

id objc_msgSend_lockView(void *a1, const char *a2, ...)
{
  return _[a1 lockView];
}

id objc_msgSend_loseFocus(void *a1, const char *a2, ...)
{
  return _[a1 loseFocus];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 mainConfiguration];
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 mainDisplay];
}

id objc_msgSend_mainNavController(void *a1, const char *a2, ...)
{
  return _[a1 mainNavController];
}

id objc_msgSend_mainNavigationController(void *a1, const char *a2, ...)
{
  return _[a1 mainNavigationController];
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

id objc_msgSend_makeKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyWindow];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return [a1 modelSpecificLocalizedStringKeyForKey:];
}

id objc_msgSend_moduleWithTitle_contents_(void *a1, const char *a2, ...)
{
  return [a1 moduleWithTitle:contents:];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_nativeScale(void *a1, const char *a2, ...)
{
  return _[a1 nativeScale];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_networkConnectionInProgress(void *a1, const char *a2, ...)
{
  return _[a1 networkConnectionInProgress];
}

id objc_msgSend_networkListViewController_didTapRecord_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "networkListViewController:didTapRecord:");
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return _[a1 networkName];
}

id objc_msgSend_networkNameCell(void *a1, const char *a2, ...)
{
  return _[a1 networkNameCell];
}

id objc_msgSend_networkPassword(void *a1, const char *a2, ...)
{
  return _[a1 networkPassword];
}

id objc_msgSend_networkReachable(void *a1, const char *a2, ...)
{
  return _[a1 networkReachable];
}

id objc_msgSend_networkReconnectEnabled_(void *a1, const char *a2, ...)
{
  return [a1 networkReconnectEnabled:];
}

id objc_msgSend_networkRequiresPassword(void *a1, const char *a2, ...)
{
  return _[a1 networkRequiresPassword];
}

id objc_msgSend_networkScaledRSSIStrength(void *a1, const char *a2, ...)
{
  return _[a1 networkScaledRSSIStrength];
}

id objc_msgSend_networkScanSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 networkScanSemaphore];
}

id objc_msgSend_networkScanWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 networkScanWithCompletion:];
}

id objc_msgSend_networkStateChanged(void *a1, const char *a2, ...)
{
  return _[a1 networkStateChanged];
}

id objc_msgSend_networkViewControllerVisible(void *a1, const char *a2, ...)
{
  return _[a1 networkViewControllerVisible];
}

id objc_msgSend_newPowerDownViewController(void *a1, const char *a2, ...)
{
  return _[a1 newPowerDownViewController];
}

id objc_msgSend_newSceneIdentityTokenForIdentity_(void *a1, const char *a2, ...)
{
  return [a1 newSceneIdentityTokenForIdentity];
}

id objc_msgSend_notificationFeedbackGenerator(void *a1, const char *a2, ...)
{
  return _[a1 notificationFeedbackGenerator];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_nullDisplay(void *a1, const char *a2, ...)
{
  return _[a1 nullDisplay];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return [a1 numberWithBool:];
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

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
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

id objc_msgSend_objectsPassingTest_(void *a1, const char *a2, ...)
{
  return [a1 objectsPassingTest:];
}

id objc_msgSend_observeDataWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 observeDataWithBlock:];
}

id objc_msgSend_observeIdleTimerDisabledWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 observeIdleTimerDisabledWithBlock:];
}

id objc_msgSend_observers(void *a1, const char *a2, ...)
{
  return _[a1 observers];
}

id objc_msgSend_onExit(void *a1, const char *a2, ...)
{
  return _[a1 onExit];
}

id objc_msgSend_onLaunch(void *a1, const char *a2, ...)
{
  return _[a1 onLaunch];
}

id objc_msgSend_openApps(void *a1, const char *a2, ...)
{
  return _[a1 openApps];
}

id objc_msgSend_openingViewControllerForBootIntent(void *a1, const char *a2, ...)
{
  return _[a1 openingViewControllerForBootIntent];
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_otherNetworkViewActive(void *a1, const char *a2, ...)
{
  return _[a1 otherNetworkViewActive];
}

id objc_msgSend_otherNetworkWindow(void *a1, const char *a2, ...)
{
  return _[a1 otherNetworkWindow];
}

id objc_msgSend_outputImage(void *a1, const char *a2, ...)
{
  return _[a1 outputImage];
}

id objc_msgSend_overridePin(void *a1, const char *a2, ...)
{
  return _[a1 overridePin];
}

id objc_msgSend_pairingCode(void *a1, const char *a2, ...)
{
  return _[a1 pairingCode];
}

id objc_msgSend_parametersForSpecification_(void *a1, const char *a2, ...)
{
  return [a1 parametersForSpecification:];
}

id objc_msgSend_password(void *a1, const char *a2, ...)
{
  return _[a1 password];
}

id objc_msgSend_passwordCell(void *a1, const char *a2, ...)
{
  return _[a1 passwordCell];
}

id objc_msgSend_passwordType(void *a1, const char *a2, ...)
{
  return _[a1 passwordType];
}

id objc_msgSend_pathForResource_ofType_(void *a1, const char *a2, ...)
{
  return [a1 pathForResource:ofType:];
}

id objc_msgSend_pendingLastGoodNetwork(void *a1, const char *a2, ...)
{
  return _[a1 pendingLastGoodNetwork];
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return _[a1 percentCharge];
}

id objc_msgSend_performScanWithParameters_reply_(void *a1, const char *a2, ...)
{
  return [a1 performScanWithParameters:reply:];
}

id objc_msgSend_performSelector_withObject_afterDelay_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:];
}

id objc_msgSend_performSelector_withObject_afterDelay_inModes_(void *a1, const char *a2, ...)
{
  return [a1 performSelector:withObject:afterDelay:inModes:];
}

id objc_msgSend_performUpdate_(void *a1, const char *a2, ...)
{
  return [a1 performUpdate:];
}

id objc_msgSend_pinCodeLabel(void *a1, const char *a2, ...)
{
  return _[a1 pinCodeLabel];
}

id objc_msgSend_ping_(void *a1, const char *a2, ...)
{
  return [a1 ping:];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 plainButtonConfiguration];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popToRootViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popToRootViewControllerAnimated:];
}

id objc_msgSend_popViewControllerAnimated_(void *a1, const char *a2, ...)
{
  return [a1 popViewControllerAnimated:];
}

id objc_msgSend_possibleValues_titles_(void *a1, const char *a2, ...)
{
  return [a1 possibleValues:titles:];
}

id objc_msgSend_postEvent_(void *a1, const char *a2, ...)
{
  return [a1 postEvent:];
}

id objc_msgSend_postNotificationName_object_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:];
}

id objc_msgSend_postNotificationName_object_userInfo_(void *a1, const char *a2, ...)
{
  return [a1 postNotificationName:object:userInfo:];
}

id objc_msgSend_postStatusBarData_withActions_(void *a1, const char *a2, ...)
{
  return [a1 postStatusBarData:withActions:];
}

id objc_msgSend_powerDownResponse(void *a1, const char *a2, ...)
{
  return _[a1 powerDownResponse];
}

id objc_msgSend_powerDownVisible(void *a1, const char *a2, ...)
{
  return _[a1 powerDownVisible];
}

id objc_msgSend_powerDownWindow(void *a1, const char *a2, ...)
{
  return _[a1 powerDownWindow];
}

id objc_msgSend_powerOn(void *a1, const char *a2, ...)
{
  return _[a1 powerOn];
}

id objc_msgSend_powerSourceState(void *a1, const char *a2, ...)
{
  return _[a1 powerSourceState];
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return [a1 preferredFontForTextStyle:];
}

id objc_msgSend_preferredLanguagesForRegion_(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguagesForRegion:];
}

id objc_msgSend_preferredLevel(void *a1, const char *a2, ...)
{
  return _[a1 preferredLevel];
}

id objc_msgSend_preferredPasswordType(void *a1, const char *a2, ...)
{
  return _[a1 preferredPasswordType];
}

id objc_msgSend_preferredSceneHostIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 preferredSceneHostIdentifier];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_presentViewController_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:completion:];
}

id objc_msgSend_presentViewController_onLayer_backgroundTunnel_statusBarVisible_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:onLayer:backgroundTunnel:statusBarVisible:animated:completion:");
}

id objc_msgSend_presentedView(void *a1, const char *a2, ...)
{
  return _[a1 presentedView];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_previewView(void *a1, const char *a2, ...)
{
  return _[a1 previewView];
}

id objc_msgSend_privacyIndicatorType(void *a1, const char *a2, ...)
{
  return _[a1 privacyIndicatorType];
}

id objc_msgSend_privateConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 privateConfiguration];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return [a1 propertyForKey:];
}

id objc_msgSend_proxyServer(void *a1, const char *a2, ...)
{
  return _[a1 proxyServer];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_qrCodeView(void *a1, const char *a2, ...)
{
  return _[a1 qrCodeView];
}

id objc_msgSend_queueWithDispatchQueue_(void *a1, const char *a2, ...)
{
  return [a1 queueWithDispatchQueue:];
}

id objc_msgSend_rangeOfCharacterFromSet_(void *a1, const char *a2, ...)
{
  return [a1 rangeOfCharacterFromSet:];
}

id objc_msgSend_reachabilityFlags(void *a1, const char *a2, ...)
{
  return _[a1 reachabilityFlags];
}

id objc_msgSend_readNVRamVariable_value_(void *a1, const char *a2, ...)
{
  return [a1 readNVRamVariable:value:];
}

id objc_msgSend_recentAttributionData(void *a1, const char *a2, ...)
{
  return _[a1 recentAttributionData];
}

id objc_msgSend_recentSensorActivityAttributions(void *a1, const char *a2, ...)
{
  return _[a1 recentSensorActivityAttributions];
}

id objc_msgSend_reconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 reconnectTimer];
}

id objc_msgSend_reconnecting(void *a1, const char *a2, ...)
{
  return _[a1 reconnecting];
}

id objc_msgSend_recordingIndicatorManager(void *a1, const char *a2, ...)
{
  return _[a1 recordingIndicatorManager];
}

id objc_msgSend_recordingIndicatorViewController_didUpdateIndicatorState_(void *a1, const char *a2, ...)
{
  return [a1 recordingIndicatorViewController:didUpdateIndicatorState:];
}

id objc_msgSend_reevaluateNetworkList(void *a1, const char *a2, ...)
{
  return _[a1 reevaluateNetworkList];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return _[a1 refresh];
}

id objc_msgSend_registerClass_forCellReuseIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 registerClass:forCellReuseIdentifier:];
}

id objc_msgSend_registerSensorActivityIndicator_forScreen_(void *a1, const char *a2, ...)
{
  return [a1 registerSensorActivityIndicator:forScreen:];
}

id objc_msgSend_relaunchToDiagnosticsApp(void *a1, const char *a2, ...)
{
  return _[a1 relaunchToDiagnosticsApp];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadNetworkList(void *a1, const char *a2, ...)
{
  return _[a1 reloadNetworkList];
}

id objc_msgSend_remoteAlertsDelegate(void *a1, const char *a2, ...)
{
  return _[a1 remoteAlertsDelegate];
}

id objc_msgSend_remoteContextWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 remoteContextWithOptions:];
}

id objc_msgSend_remoteLocaleCode(void *a1, const char *a2, ...)
{
  return _[a1 remoteLocaleCode];
}

id objc_msgSend_remoteSetupAuthController(void *a1, const char *a2, ...)
{
  return _[a1 remoteSetupAuthController];
}

id objc_msgSend_remoteSetupConfiguringController(void *a1, const char *a2, ...)
{
  return _[a1 remoteSetupConfiguringController];
}

id objc_msgSend_remoteSetupManager(void *a1, const char *a2, ...)
{
  return _[a1 remoteSetupManager];
}

id objc_msgSend_remoteSetupQRCodeScanner(void *a1, const char *a2, ...)
{
  return _[a1 remoteSetupQRCodeScanner];
}

id objc_msgSend_remoteSetupQRCodeScannerController(void *a1, const char *a2, ...)
{
  return _[a1 remoteSetupQRCodeScannerController];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeBatteryDeviceObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeBatteryDeviceObserver];
}

id objc_msgSend_removeContiguousSpecifiers_(void *a1, const char *a2, ...)
{
  return [a1 removeContiguousSpecifiers];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeLastObject(void *a1, const char *a2, ...)
{
  return _[a1 removeLastObject];
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return [a1 removeObject:];
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectForKey:];
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver];
}

id objc_msgSend_removeObserver_forHostname_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:forHostname:];
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return [a1 removeObserver:name:object:];
}

id objc_msgSend_removeShutdownTask_(void *a1, const char *a2, ...)
{
  return [a1 removeShutdownTask:];
}

id objc_msgSend_replaceObjectsInRange_withObjectsFromArray_(void *a1, const char *a2, ...)
{
  return [a1 replaceObjectsInRange:withObjectsFromArray:];
}

id objc_msgSend_requestParameters(void *a1, const char *a2, ...)
{
  return _[a1 requestParameters];
}

id objc_msgSend_requiresPassword(void *a1, const char *a2, ...)
{
  return _[a1 requiresPassword];
}

id objc_msgSend_resetIdleTimerAndUndim_(void *a1, const char *a2, ...)
{
  return [a1 resetIdleTimerAndUndim:];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return _[a1 resignFirstResponder];
}

id objc_msgSend_restartRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _[a1 restartRemoteSetupBroadcast];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_resumeWithError_(void *a1, const char *a2, ...)
{
  return [a1 resumeWithError:];
}

id objc_msgSend_retryJoinAttemptCount(void *a1, const char *a2, ...)
{
  return _[a1 retryJoinAttemptCount];
}

id objc_msgSend_returnKeyType(void *a1, const char *a2, ...)
{
  return _[a1 returnKeyType];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 rightBarButtonItem];
}

id objc_msgSend_rootSettings(void *a1, const char *a2, ...)
{
  return _[a1 rootSettings];
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rootViewController_(void *a1, const char *a2, ...)
{
  return [a1 rootViewController:];
}

id objc_msgSend_rootWindowRecordingIndicatorManager(void *a1, const char *a2, ...)
{
  return _[a1 rootWindowRecordingIndicatorManager];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_rowWithTitle_action_(void *a1, const char *a2, ...)
{
  return [a1 rowWithTitle:action:];
}

id objc_msgSend_rowWithTitle_valueKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 rowWithTitle:valueKeyPath:];
}

id objc_msgSend_rssiBarImages(void *a1, const char *a2, ...)
{
  return _[a1 rssiBarImages];
}

id objc_msgSend_rssiBarsView(void *a1, const char *a2, ...)
{
  return _[a1 rssiBarsView];
}

id objc_msgSend_ruleForDispatchingDiscreteEventsMatchingPredicate_toTarget_(void *a1, const char *a2, ...)
{
  return [a1 ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:];
}

id objc_msgSend_sampling(void *a1, const char *a2, ...)
{
  return _[a1 sampling];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scanCompleted(void *a1, const char *a2, ...)
{
  return _[a1 scanCompleted];
}

id objc_msgSend_scanCompletion(void *a1, const char *a2, ...)
{
  return _[a1 scanCompletion];
}

id objc_msgSend_scanHexInt_(void *a1, const char *a2, ...)
{
  return [a1 scanHexInt:];
}

id objc_msgSend_scanParametersWithSSID_isHidden_(void *a1, const char *a2, ...)
{
  return [a1 scanParametersWithSSID:isHidden:];
}

id objc_msgSend_scanRecord(void *a1, const char *a2, ...)
{
  return _[a1 scanRecord];
}

id objc_msgSend_scanResult(void *a1, const char *a2, ...)
{
  return _[a1 scanResult];
}

id objc_msgSend_scanTimer(void *a1, const char *a2, ...)
{
  return _[a1 scanTimer];
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return [a1 scannerWithString:];
}

id objc_msgSend_scanning(void *a1, const char *a2, ...)
{
  return _[a1 scanning];
}

id objc_msgSend_scene(void *a1, const char *a2, ...)
{
  return _[a1 scene];
}

id objc_msgSend_sceneIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 sceneIdentifier];
}

id objc_msgSend_sceneTransaction(void *a1, const char *a2, ...)
{
  return _[a1 sceneTransaction];
}

id objc_msgSend_sceneWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 sceneWithIdentifier:];
}

id objc_msgSend_scheduleInRunLoop_(void *a1, const char *a2, ...)
{
  return [a1 scheduleInRunLoop:];
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

id objc_msgSend_scriptCode(void *a1, const char *a2, ...)
{
  return _[a1 scriptCode];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return _[a1 secondarySystemBackgroundColor];
}

id objc_msgSend_sectionWithRows_(void *a1, const char *a2, ...)
{
  return [a1 sectionWithRows:];
}

id objc_msgSend_sectionWithRows_title_(void *a1, const char *a2, ...)
{
  return [a1 sectionWithRows:title:];
}

id objc_msgSend_selectLanguage_restartAfterCompletion_(void *a1, const char *a2, ...)
{
  return [a1 selectLanguage:restartAfterCompletion:];
}

id objc_msgSend_sendAuthPassword_(void *a1, const char *a2, ...)
{
  return [a1 sendAuthPassword:];
}

id objc_msgSend_sensor(void *a1, const char *a2, ...)
{
  return _[a1 sensor];
}

id objc_msgSend_sensorActivityDataProvider(void *a1, const char *a2, ...)
{
  return _[a1 sensorActivityDataProvider];
}

id objc_msgSend_sensorType(void *a1, const char *a2, ...)
{
  return _[a1 sensorType];
}

id objc_msgSend_sentinelWithQueue_signalCount_completion_(void *a1, const char *a2, ...)
{
  return [a1 sentinelWithQueue:nil signalCount:0 completion:nil];
}

id objc_msgSend_server_createAlert_timeout_completion_(void *a1, const char *a2, ...)
{
  return [a1 server:createAlert:timeout:completion:];
}

id objc_msgSend_server_receiveResponseFromAlertWithIdentifier_timeout_completion_(void *a1, const char *a2, ...)
{
  return [a1 server:receiveResponseFromAlertWithIdentifier:timeout:completion:];
}

id objc_msgSend_serverInterface(void *a1, const char *a2, ...)
{
  return _[a1 serverInterface];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setAccessibilityIdentifier:];
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryType:];
}

id objc_msgSend_setAccessoryView_(void *a1, const char *a2, ...)
{
  return [a1 setAccessoryView:];
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return [a1 setActive:];
}

id objc_msgSend_setActiveSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return [a1 setActiveSensorActivityAttributions:];
}

id objc_msgSend_setActivityView_(void *a1, const char *a2, ...)
{
  return [a1 setActivityView:];
}

id objc_msgSend_setAdditionalSafeAreaInsets_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalSafeAreaInsets:];
}

id objc_msgSend_setAdditionalScaleForAnimation_headerView_(void *a1, const char *a2, ...)
{
  return [a1 setAdditionalScaleForAnimation:headerView:];
}

id objc_msgSend_setAdjustsFontSizeToFitWidth_(void *a1, const char *a2, ...)
{
  return [a1 setAdjustsFontSizeToFitWidth:];
}

id objc_msgSend_setAffineTransform_(void *a1, const char *a2, ...)
{
  return [a1 setAffineTransform:];
}

id objc_msgSend_setAlertVisible_(void *a1, const char *a2, ...)
{
  return [a1 setAlertVisible:];
}

id objc_msgSend_setAlignment_(void *a1, const char *a2, ...)
{
  return [a1 setAlignment:];
}

id objc_msgSend_setAllowWiFiSettingsAction_(void *a1, const char *a2, ...)
{
  return [a1 setAllowWiFiSettingsAction:];
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setAlpha:];
}

id objc_msgSend_setAnimationController_(void *a1, const char *a2, ...)
{
  return [a1 setAnimationController:];
}

id objc_msgSend_setAppClientSettingsDiffInspector_(void *a1, const char *a2, ...)
{
  return [a1 setAppClientSettingsDiffInspector:];
}

id objc_msgSend_setArtworkSubtype_(void *a1, const char *a2, ...)
{
  return [a1 setArtworkSubtype:];
}

id objc_msgSend_setAttemptsNetworkReconnect_(void *a1, const char *a2, ...)
{
  return [a1 setAttemptsNetworkReconnect:];
}

id objc_msgSend_setAttentionLostTimeout_(void *a1, const char *a2, ...)
{
  return [a1 setAttentionLostTimeout:];
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return [a1 setAttributedText:];
}

id objc_msgSend_setAutocapitalizationType_(void *a1, const char *a2, ...)
{
  return [a1 setAutocapitalizationType:];
}

id objc_msgSend_setAutocorrectionType_(void *a1, const char *a2, ...)
{
  return [a1 setAutocorrectionType:];
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return [a1 setAutoresizingMask:];
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundColor:];
}

id objc_msgSend_setBackgroundImage_forBarMetrics_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundImage:forBarMetrics:];
}

id objc_msgSend_setBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return [a1 setBackgroundTunnel:];
}

id objc_msgSend_setBatteryDetailString_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryDetailString:];
}

id objc_msgSend_setBatteryDeviceController_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryDeviceController:];
}

id objc_msgSend_setBatteryMonitoringEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setBatteryMonitoringEnabled:];
}

id objc_msgSend_setBeginTime_(void *a1, const char *a2, ...)
{
  return [a1 setBeginTime:];
}

id objc_msgSend_setBool_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setBool:forKey:];
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return [a1 setBounds:];
}

id objc_msgSend_setBroadcastingForSetup_(void *a1, const char *a2, ...)
{
  return [a1 setBroadcastingForSetup:];
}

id objc_msgSend_setButtonTray_(void *a1, const char *a2, ...)
{
  return [a1 setButtonTray:];
}

id objc_msgSend_setByAddingEmergencyCallAppToSet_(void *a1, const char *a2, ...)
{
  return [a1 setByAddingEmergencyCallAppToSet];
}

id objc_msgSend_setCaptionText_style_(void *a1, const char *a2, ...)
{
  return [a1 setCaptionText:style:];
}

id objc_msgSend_setCapturePreviewLayer_(void *a1, const char *a2, ...)
{
  return [a1 setCapturePreviewLayer:];
}

id objc_msgSend_setCellAction_(void *a1, const char *a2, ...)
{
  return [a1 setCellAction:];
}

id objc_msgSend_setCellTarget_(void *a1, const char *a2, ...)
{
  return [a1 setCellTarget:];
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return [a1 setCenter:];
}

id objc_msgSend_setCharacterLimit_(void *a1, const char *a2, ...)
{
  return [a1 setCharacterLimit:];
}

id objc_msgSend_setCheckedInWiFiSettings_(void *a1, const char *a2, ...)
{
  return [a1 setCheckedInWiFiSettings:];
}

id objc_msgSend_setClasses_forSelector_argumentIndex_ofReply_(void *a1, const char *a2, ...)
{
  return [a1 setClasses:forSelector:argumentIndex:ofReply:];
}

id objc_msgSend_setClientIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setClientIdentity:];
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return [a1 setCompletionBlock:];
}

id objc_msgSend_setConfiguration_shouldReset_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:shouldReset:];
}

id objc_msgSend_setConfiguration_shouldReset_error_(void *a1, const char *a2, ...)
{
  return [a1 setConfiguration:shouldReset:error:];
}

id objc_msgSend_setContainerFooterView_(void *a1, const char *a2, ...)
{
  return [a1 setContainerFooterView:];
}

id objc_msgSend_setContainerView_(void *a1, const char *a2, ...)
{
  return [a1 setContainerView:];
}

id objc_msgSend_setContentHuggingPriority_forAxis_(void *a1, const char *a2, ...)
{
  return [a1 setContentHuggingPriority:forAxis:];
}

id objc_msgSend_setContentInsets_(void *a1, const char *a2, ...)
{
  return [a1 setContentInsets:];
}

id objc_msgSend_setContentMode_(void *a1, const char *a2, ...)
{
  return [a1 setContentMode:];
}

id objc_msgSend_setContinueButton_(void *a1, const char *a2, ...)
{
  return [a1 setContinueButton:];
}

id objc_msgSend_setContinueButtonAvailable(void *a1, const char *a2, ...)
{
  return _[a1 setContinueButtonAvailable];
}

id objc_msgSend_setContinueButtonBusy(void *a1, const char *a2, ...)
{
  return _[a1 setContinueButtonBusy];
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return [a1 setCornerRadius:];
}

id objc_msgSend_setCurrentBatteryDevice_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentBatteryDevice:];
}

id objc_msgSend_setCurrentNetwork_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentNetwork];
}

id objc_msgSend_setCurrentNetworkState_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentNetworkState:];
}

id objc_msgSend_setCurrentSecurityGroup_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentSecurityGroup:];
}

id objc_msgSend_setCurrentlyActiveTextField_(void *a1, const char *a2, ...)
{
  return [a1 setCurrentlyActiveTextField:];
}

id objc_msgSend_setCustomBackButton_(void *a1, const char *a2, ...)
{
  return [a1 setCustomBackButton:];
}

id objc_msgSend_setCwInterface_(void *a1, const char *a2, ...)
{
  return [a1 setCwInterface:];
}

id objc_msgSend_setDamping_(void *a1, const char *a2, ...)
{
  return [a1 setDamping:];
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return [a1 setDataSource:];
}

id objc_msgSend_setDateStyle_(void *a1, const char *a2, ...)
{
  return [a1 setDateStyle:];
}

id objc_msgSend_setDebugInfoVisible_(void *a1, const char *a2, ...)
{
  return [a1 setDebugInfoVisible:];
}

id objc_msgSend_setDebugInfoWindow_(void *a1, const char *a2, ...)
{
  return [a1 setDebugInfoWindow:];
}

id objc_msgSend_setDefaultSceneToken_(void *a1, const char *a2, ...)
{
  return [a1 setDefaultSceneToken:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setDescriptors:];
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return [a1 setDevice];
}

id objc_msgSend_setDeviceInfoValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceInfoValue:forKey:];
}

id objc_msgSend_setDeviceOrientationEventsEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setDeviceOrientationEventsEnabled:];
}

id objc_msgSend_setDiagsLaunchDependenciesSemaphore_(void *a1, const char *a2, ...)
{
  return [a1 setDiagsLaunchDependenciesSemaphore:];
}

id objc_msgSend_setDidMoveToEndgame_(void *a1, const char *a2, ...)
{
  return [a1 setDidMoveToEndgame:];
}

id objc_msgSend_setDirectionalLayoutMargins_(void *a1, const char *a2, ...)
{
  return [a1 setDirectionalLayoutMargins:];
}

id objc_msgSend_setDisableActions_(void *a1, const char *a2, ...)
{
  return [a1 setDisableActions:];
}

id objc_msgSend_setDismissed_(void *a1, const char *a2, ...)
{
  return [a1 setDismissed:];
}

id objc_msgSend_setDisplayConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayConfiguration:];
}

id objc_msgSend_setDisplayDim_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayDim:];
}

id objc_msgSend_setDisplayEdgeInfo_(void *a1, const char *a2, ...)
{
  return [a1 setDisplayEdgeInfo:];
}

id objc_msgSend_setDisplays_(void *a1, const char *a2, ...)
{
  return [a1 setDisplays:];
}

id objc_msgSend_setDistribution_(void *a1, const char *a2, ...)
{
  return [a1 setDistribution:];
}

id objc_msgSend_setDuration_(void *a1, const char *a2, ...)
{
  return [a1 setDuration:];
}

id objc_msgSend_setEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setEnabled:];
}

id objc_msgSend_setEnclosureColors_(void *a1, const char *a2, ...)
{
  return [a1 setEnclosureColors:];
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return [a1 setEstimatedRowHeight:];
}

id objc_msgSend_setEventHandler_(void *a1, const char *a2, ...)
{
  return [a1 setEventHandler:];
}

id objc_msgSend_setEventHandlerWithQueue_block_(void *a1, const char *a2, ...)
{
  return [a1 setEventHandlerWithQueue:block:];
}

id objc_msgSend_setEventMask_(void *a1, const char *a2, ...)
{
  return [a1 setEventMask:];
}

id objc_msgSend_setExclusionArea_(void *a1, const char *a2, ...)
{
  return [a1 setExclusionArea:];
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return [a1 setExportedInterface:];
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return [a1 setExportedObject:];
}

id objc_msgSend_setFallbackButton_(void *a1, const char *a2, ...)
{
  return [a1 setFallbackButton:];
}

id objc_msgSend_setFillMode_(void *a1, const char *a2, ...)
{
  return [a1 setFillMode:];
}

id objc_msgSend_setFilteredWiFiScanResults_(void *a1, const char *a2, ...)
{
  return [a1 setFilteredWiFiScanResults:];
}

id objc_msgSend_setFilters_(void *a1, const char *a2, ...)
{
  return [a1 setFilters:];
}

id objc_msgSend_setFinishedBoot_(void *a1, const char *a2, ...)
{
  return [a1 setFinishedBoot:];
}

id objc_msgSend_setFirstGuessedLanguages_(void *a1, const char *a2, ...)
{
  return [a1 setFirstGuessedLanguages:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setForeground_(void *a1, const char *a2, ...)
{
  return [a1 setForeground:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setFromValue_(void *a1, const char *a2, ...)
{
  return [a1 setFromValue:];
}

id objc_msgSend_setGuessedCountries_(void *a1, const char *a2, ...)
{
  return [a1 setGuessedCountries:];
}

id objc_msgSend_setHasBeenShown_(void *a1, const char *a2, ...)
{
  return [a1 setHasBeenShown:];
}

id objc_msgSend_setHeightConstraint_(void *a1, const char *a2, ...)
{
  return [a1 setHeightConstraint:];
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return [a1 setHidden:];
}

id objc_msgSend_setHiddenNetworkWithNoPasswordGroup_(void *a1, const char *a2, ...)
{
  return [a1 setHiddenNetworkWithNoPasswordGroup];
}

id objc_msgSend_setHiddenNetworkWithPasswordGroup_(void *a1, const char *a2, ...)
{
  return [a1 setHiddenNetworkWithPasswordGroup:];
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return [a1 setHidesBackButton:];
}

id objc_msgSend_setHomeAffordanceOverlayAllowance_(void *a1, const char *a2, ...)
{
  return [a1 setHomeAffordanceOverlayAllowance:];
}

id objc_msgSend_setHomeButtonPressedWithDisplayDim_(void *a1, const char *a2, ...)
{
  return [a1 setHomeButtonPressedWithDisplayDim:];
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setIdentifier];
}

id objc_msgSend_setIdentity_(void *a1, const char *a2, ...)
{
  return [a1 setIdentity:];
}

id objc_msgSend_setIdleTimerDisabled_forReason_(void *a1, const char *a2, ...)
{
  return [a1 setIdleTimerDisabled:forReason:];
}

id objc_msgSend_setImage_(void *a1, const char *a2, ...)
{
  return [a1 setImage:];
}

id objc_msgSend_setInSunlight_(void *a1, const char *a2, ...)
{
  return [a1 setInSunlight:];
}

id objc_msgSend_setInactivityTimer_(void *a1, const char *a2, ...)
{
  return [a1 setInactivityTimer:];
}

id objc_msgSend_setIncludeHiddenNetworks_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeHiddenNetworks:];
}

id objc_msgSend_setIncludeProperties_(void *a1, const char *a2, ...)
{
  return [a1 setIncludeProperties:];
}

id objc_msgSend_setIndexToSelect_(void *a1, const char *a2, ...)
{
  return [a1 setIndexToSelect:];
}

id objc_msgSend_setIndicatorColor_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorColor:];
}

id objc_msgSend_setIndicatorType_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorType:];
}

id objc_msgSend_setIndicatorVisible_(void *a1, const char *a2, ...)
{
  return [a1 setIndicatorVisible:];
}

id objc_msgSend_setInterfaceOrientation_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceOrientation:];
}

id objc_msgSend_setInterfaceOrientationMode_(void *a1, const char *a2, ...)
{
  return [a1 setInterfaceOrientationMode:];
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInterruptionHandler:];
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return [a1 setInvalidationHandler:];
}

id objc_msgSend_setIsHidden_(void *a1, const char *a2, ...)
{
  return [a1 setIsHidden:];
}

id objc_msgSend_setJoinTimer_(void *a1, const char *a2, ...)
{
  return [a1 setJoinTimer:];
}

id objc_msgSend_setJoining_(void *a1, const char *a2, ...)
{
  return [a1 setJoining:];
}

id objc_msgSend_setLanguageButton_(void *a1, const char *a2, ...)
{
  return [a1 setLanguageButton:];
}

id objc_msgSend_setLanguageCodes_(void *a1, const char *a2, ...)
{
  return [a1 setLanguageCodes:];
}

id objc_msgSend_setLanguageComposite_(void *a1, const char *a2, ...)
{
  return [a1 setLanguageComposite:];
}

id objc_msgSend_setLanguageStrings_(void *a1, const char *a2, ...)
{
  return [a1 setLanguageStrings:];
}

id objc_msgSend_setLastGoodNetwork_(void *a1, const char *a2, ...)
{
  return [a1 setLastGoodNetwork:];
}

id objc_msgSend_setLastLockState_(void *a1, const char *a2, ...)
{
  return [a1 setLastLockState:];
}

id objc_msgSend_setLastLockStateSet_(void *a1, const char *a2, ...)
{
  return [a1 setLastLockStateSet:];
}

id objc_msgSend_setLaunchIntent_(void *a1, const char *a2, ...)
{
  return [a1 setLaunchIntent:];
}

id objc_msgSend_setLayer_(void *a1, const char *a2, ...)
{
  return [a1 setLayer:];
}

id objc_msgSend_setLayoutElementInvalidator_(void *a1, const char *a2, ...)
{
  return [a1 setLayoutElementInvalidator:];
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setLeftBarButtonItem:];
}

id objc_msgSend_setLevel_(void *a1, const char *a2, ...)
{
  return [a1 setLevel:];
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return [a1 setLineBreakMode:];
}

id objc_msgSend_setListDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setListDelegate:];
}

id objc_msgSend_setLocalServiceClient_(void *a1, const char *a2, ...)
{
  return [a1 setLocalServiceClient:];
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return [a1 setLocale:];
}

id objc_msgSend_setLocaleAfterLanguageChange_(void *a1, const char *a2, ...)
{
  return [a1 setLocaleAfterLanguageChange:];
}

id objc_msgSend_setLocaleIdentifier_completion_(void *a1, const char *a2, ...)
{
  return [a1 setLocaleIdentifier:completion:];
}

id objc_msgSend_setLocales_(void *a1, const char *a2, ...)
{
  return [a1 setLocales:];
}

id objc_msgSend_setLockButtonLongPressed_(void *a1, const char *a2, ...)
{
  return [a1 setLockButtonLongPressed:];
}

id objc_msgSend_setLockButtonPressedWithDisplayDim_(void *a1, const char *a2, ...)
{
  return [a1 setLockButtonPressedWithDisplayDim:];
}

id objc_msgSend_setLockButtonTimer_(void *a1, const char *a2, ...)
{
  return [a1 setLockButtonTimer:];
}

id objc_msgSend_setMainNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setMainNavigationController:];
}

id objc_msgSend_setMasksToBounds_(void *a1, const char *a2, ...)
{
  return [a1 setMasksToBounds:];
}

id objc_msgSend_setMass_(void *a1, const char *a2, ...)
{
  return [a1 setMass:];
}

id objc_msgSend_setMatchesAlpha_(void *a1, const char *a2, ...)
{
  return [a1 setMatchesAlpha:];
}

id objc_msgSend_setMergeScanResults_(void *a1, const char *a2, ...)
{
  return [a1 setMergeScanResults:];
}

id objc_msgSend_setMetadataObjectTypes_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataObjectTypes:];
}

id objc_msgSend_setMetadataObjectsDelegate_queue_(void *a1, const char *a2, ...)
{
  return [a1 setMetadataObjectsDelegate:queue:];
}

id objc_msgSend_setMinimized_(void *a1, const char *a2, ...)
{
  return [a1 setMinimized:];
}

id objc_msgSend_setMinimumEarlyFireProportion_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumEarlyFireProportion:];
}

id objc_msgSend_setMinimumHeight_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumHeight:];
}

id objc_msgSend_setMinimumRSSI_(void *a1, const char *a2, ...)
{
  return [a1 setMinimumRSSI:];
}

id objc_msgSend_setModalInPresentation_(void *a1, const char *a2, ...)
{
  return [a1 setModalInPresentation:];
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalPresentationStyle:];
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return [a1 setModalTransitionStyle:];
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return [a1 setName:];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNetworkConnectionInProgress_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkConnectionInProgress:];
}

id objc_msgSend_setNetworkNameCell_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkNameCell];
}

id objc_msgSend_setNetworkReachable_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkReachable:];
}

id objc_msgSend_setNetworkReconnectEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkReconnectEnabled:];
}

id objc_msgSend_setNetworkRequiresPassword_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkRequiresPassword:];
}

id objc_msgSend_setNetworkStateChanged_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkStateChanged:];
}

id objc_msgSend_setNetworkViewControllerVisible_(void *a1, const char *a2, ...)
{
  return [a1 setNetworkViewControllerVisible:];
}

id objc_msgSend_setNetworks_(void *a1, const char *a2, ...)
{
  return [a1 setNetworks:];
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return [a1 setNumberOfLines:];
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return [a1 setNumberStyle:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setOldClientSettings_(void *a1, const char *a2, ...)
{
  return [a1 setOldClientSettings:];
}

id objc_msgSend_setOnExit_(void *a1, const char *a2, ...)
{
  return [a1 setOnExit:];
}

id objc_msgSend_setOnLaunch_(void *a1, const char *a2, ...)
{
  return [a1 setOnLaunch:];
}

id objc_msgSend_setOpacity_(void *a1, const char *a2, ...)
{
  return [a1 setOpacity:];
}

id objc_msgSend_setOtherNetworkWindow_(void *a1, const char *a2, ...)
{
  return [a1 setOtherNetworkWindow:];
}

id objc_msgSend_setOverrideAuthPin_(void *a1, const char *a2, ...)
{
  return [a1 setOverrideAuthPin:];
}

id objc_msgSend_setOverridePin_(void *a1, const char *a2, ...)
{
  return [a1 setOverridePin:];
}

id objc_msgSend_setPairingCode_(void *a1, const char *a2, ...)
{
  return [a1 setPairingCode:];
}

id objc_msgSend_setPassword_(void *a1, const char *a2, ...)
{
  return [a1 setPassword:];
}

id objc_msgSend_setPasswordCell_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordCell:];
}

id objc_msgSend_setPasswordType_(void *a1, const char *a2, ...)
{
  return [a1 setPasswordType:];
}

id objc_msgSend_setPendingLastGoodNetwork_(void *a1, const char *a2, ...)
{
  return [a1 setPendingLastGoodNetwork];
}

id objc_msgSend_setPeripheryInsets_(void *a1, const char *a2, ...)
{
  return [a1 setPeripheryInsets:];
}

id objc_msgSend_setPinCodeLabel_(void *a1, const char *a2, ...)
{
  return [a1 setPinCodeLabel:];
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return [a1 setPlaceholder:];
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return [a1 setPosition:];
}

id objc_msgSend_setPower_error_(void *a1, const char *a2, ...)
{
  return [a1 setPower:error:];
}

id objc_msgSend_setPowerDownDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setPowerDownDelegate:];
}

id objc_msgSend_setPowerDownResponse_(void *a1, const char *a2, ...)
{
  return [a1 setPowerDownResponse:];
}

id objc_msgSend_setPowerDownVisible_(void *a1, const char *a2, ...)
{
  return [a1 setPowerDownVisible:];
}

id objc_msgSend_setPowerDownWindow_(void *a1, const char *a2, ...)
{
  return [a1 setPowerDownWindow:];
}

id objc_msgSend_setPowered_(void *a1, const char *a2, ...)
{
  return [a1 setPowered:];
}

id objc_msgSend_setPreferencesValue_key_domain_(void *a1, const char *a2, ...)
{
  return [a1 setPreferencesValue:key:domain:];
}

id objc_msgSend_setPreferredLanguageAndUpdateLocale_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredLanguageAndUpdateLocale:];
}

id objc_msgSend_setPreferredPasswordType_(void *a1, const char *a2, ...)
{
  return [a1 setPreferredPasswordType:];
}

id objc_msgSend_setPresentViewControllerWithStatusBarShown_(void *a1, const char *a2, ...)
{
  return [a1 setPresentViewControllerWithStatusBarShown:];
}

id objc_msgSend_setPresentedView_(void *a1, const char *a2, ...)
{
  return [a1 setPresentedView:];
}

id objc_msgSend_setPreventIdleSleep_forReason_(void *a1, const char *a2, ...)
{
  return [a1 setPreventIdleSleep:forReason:];
}

id objc_msgSend_setPreviewView_(void *a1, const char *a2, ...)
{
  return [a1 setPreviewView:];
}

id objc_msgSend_setPreviousScanFilteredWiFiScanResults_(void *a1, const char *a2, ...)
{
  return [a1 setPreviousScanFilteredWiFiScanResults:];
}

id objc_msgSend_setPrivacyIndicatorType_(void *a1, const char *a2, ...)
{
  return [a1 setPrivacyIndicatorType:];
}

id objc_msgSend_setPrompt_(void *a1, const char *a2, ...)
{
  return [a1 setPrompt:];
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setProperty:forKey:];
}

id objc_msgSend_setProxyServer_(void *a1, const char *a2, ...)
{
  return [a1 setProxyServer:];
}

id objc_msgSend_setQrCodeView_(void *a1, const char *a2, ...)
{
  return [a1 setQrCodeView:];
}

id objc_msgSend_setRebootType_(void *a1, const char *a2, ...)
{
  return [a1 setRebootType:];
}

id objc_msgSend_setRecentSensorActivityAttributions_(void *a1, const char *a2, ...)
{
  return [a1 setRecentSensorActivityAttributions:];
}

id objc_msgSend_setReconnectTimer_(void *a1, const char *a2, ...)
{
  return [a1 setReconnectTimer:];
}

id objc_msgSend_setReconnecting_(void *a1, const char *a2, ...)
{
  return [a1 setReconnecting:];
}

id objc_msgSend_setRecordingIndicatorManager_(void *a1, const char *a2, ...)
{
  return [a1 setRecordingIndicatorManager:];
}

id objc_msgSend_setReferenceFrame_(void *a1, const char *a2, ...)
{
  return [a1 setReferenceFrame:];
}

id objc_msgSend_setRegisterAdditionalServicesBlock_(void *a1, const char *a2, ...)
{
  return [a1 setRegisterAdditionalServicesBlock:];
}

id objc_msgSend_setRememberUponSuccessfulAssociation_(void *a1, const char *a2, ...)
{
  return [a1 setRememberUponSuccessfulAssociation];
}

id objc_msgSend_setRemoteLocaleCode_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteLocaleCode:];
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteObjectInterface:];
}

id objc_msgSend_setRemoteSetupAuthController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteSetupAuthController:];
}

id objc_msgSend_setRemoteSetupConfiguringController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteSetupConfiguringController:];
}

id objc_msgSend_setRemoteSetupManager_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteSetupManager:];
}

id objc_msgSend_setRemoteSetupQRCodeScanner_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteSetupQRCodeScanner];
}

id objc_msgSend_setRemoteSetupQRCodeScannerController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteSetupQRCodeScannerController:];
}

id objc_msgSend_setRenderingMode_(void *a1, const char *a2, ...)
{
  return [a1 setRenderingMode:];
}

id objc_msgSend_setRequiresPassword_(void *a1, const char *a2, ...)
{
  return [a1 setRequiresPassword:];
}

id objc_msgSend_setRetryJoinAttemptCount_(void *a1, const char *a2, ...)
{
  return [a1 setRetryJoinAttemptCount:];
}

id objc_msgSend_setReturnKeyEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setReturnKeyEnabled:];
}

id objc_msgSend_setReturnKeyType_(void *a1, const char *a2, ...)
{
  return [a1 setReturnKeyType:];
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return [a1 setRightBarButtonItem:];
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return [a1 setRootViewController:];
}

id objc_msgSend_setSSID_(void *a1, const char *a2, ...)
{
  return [a1 setSSID];
}

id objc_msgSend_setSafeAreaInsetsPortrait_(void *a1, const char *a2, ...)
{
  return [a1 setSafeAreaInsetsPortrait:];
}

id objc_msgSend_setSampling_(void *a1, const char *a2, ...)
{
  return [a1 setSampling:];
}

id objc_msgSend_setScale_(void *a1, const char *a2, ...)
{
  return [a1 setScale:];
}

id objc_msgSend_setScanCompleted_(void *a1, const char *a2, ...)
{
  return [a1 setScanCompleted:];
}

id objc_msgSend_setScanResult_(void *a1, const char *a2, ...)
{
  return [a1 setScanResult:];
}

id objc_msgSend_setScanTimer_(void *a1, const char *a2, ...)
{
  return [a1 setScanTimer:];
}

id objc_msgSend_setScanning_(void *a1, const char *a2, ...)
{
  return [a1 setScanning:];
}

id objc_msgSend_setScene_(void *a1, const char *a2, ...)
{
  return [a1 setScene:];
}

id objc_msgSend_setScrollEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollEnabled:];
}

id objc_msgSend_setSecure_(void *a1, const char *a2, ...)
{
  return [a1 setSecure:];
}

id objc_msgSend_setSenderDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 setSenderDescriptors:];
}

id objc_msgSend_setSensorType_(void *a1, const char *a2, ...)
{
  return [a1 setSensorType:];
}

id objc_msgSend_setSessionPreset_(void *a1, const char *a2, ...)
{
  return [a1 setSessionPreset:];
}

id objc_msgSend_setSettings_(void *a1, const char *a2, ...)
{
  return [a1 setSettings:];
}

id objc_msgSend_setSetupAssistantHeaderView_(void *a1, const char *a2, ...)
{
  return [a1 setSetupAssistantHeaderView:];
}

id objc_msgSend_setSetupServer_(void *a1, const char *a2, ...)
{
  return [a1 setSetupServer:];
}

id objc_msgSend_setSetupState_(void *a1, const char *a2, ...)
{
  return [a1 setSetupState:];
}

id objc_msgSend_setShouldWaitForMigrator_(void *a1, const char *a2, ...)
{
  return [a1 setShouldWaitForMigrator:];
}

id objc_msgSend_setShowLockIcon_(void *a1, const char *a2, ...)
{
  return [a1 setShowLockIcon:];
}

id objc_msgSend_setShowNetworkSettings_(void *a1, const char *a2, ...)
{
  return [a1 setShowNetworkSettings:];
}

id objc_msgSend_setShowOtherNetwork_(void *a1, const char *a2, ...)
{
  return [a1 setShowOtherNetwork:];
}

id objc_msgSend_setShowingDeviceInformation_(void *a1, const char *a2, ...)
{
  return [a1 setShowingDeviceInformation:];
}

id objc_msgSend_setShutdownTasksPendingSemaphore_(void *a1, const char *a2, ...)
{
  return [a1 setShutdownTasksPendingSemaphore:];
}

id objc_msgSend_setSignalStrengthBars_(void *a1, const char *a2, ...)
{
  return [a1 setSignalStrengthBars];
}

id objc_msgSend_setSignalStrengthRSSI_(void *a1, const char *a2, ...)
{
  return [a1 setSignalStrengthRSSI:];
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return [a1 setSize:];
}

id objc_msgSend_setSpacing_(void *a1, const char *a2, ...)
{
  return [a1 setSpacing:];
}

id objc_msgSend_setSpecification_(void *a1, const char *a2, ...)
{
  return [a1 setSpecification:];
}

id objc_msgSend_setStandardScaleForAnimation(void *a1, const char *a2, ...)
{
  return _[a1 setStandardScaleForAnimation];
}

id objc_msgSend_setStatusBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarStyle:];
}

id objc_msgSend_setStatusBarView_(void *a1, const char *a2, ...)
{
  return [a1 setStatusBarView:];
}

id objc_msgSend_setStiffness_(void *a1, const char *a2, ...)
{
  return [a1 setStiffness:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSupportsCellularActivation_(void *a1, const char *a2, ...)
{
  return [a1 setSupportsCellularActivation:];
}

id objc_msgSend_setSymbolColors_(void *a1, const char *a2, ...)
{
  return [a1 setSymbolColors:];
}

id objc_msgSend_setSystem_(void *a1, const char *a2, ...)
{
  return [a1 setSystem:];
}

id objc_msgSend_setSystemMinimumMargin_(void *a1, const char *a2, ...)
{
  return [a1 setSystemMinimumMargin:];
}

id objc_msgSend_setSystemServicesDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setSystemServicesDelegate:];
}

id objc_msgSend_setTableView_(void *a1, const char *a2, ...)
{
  return [a1 setTableView:];
}

id objc_msgSend_setTag_(void *a1, const char *a2, ...)
{
  return [a1 setTag:];
}

id objc_msgSend_setTargetNetworkForBootIntent_(void *a1, const char *a2, ...)
{
  return [a1 setTargetNetworkForBootIntent:];
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

id objc_msgSend_setThermalWarningVisible_(void *a1, const char *a2, ...)
{
  return [a1 setThermalWarningVisible:];
}

id objc_msgSend_setThermalWarningWindow_(void *a1, const char *a2, ...)
{
  return [a1 setThermalWarningWindow:];
}

id objc_msgSend_setTimeItemShortTimeString_(void *a1, const char *a2, ...)
{
  return [a1 setTimeItemShortTimeString];
}

id objc_msgSend_setTimeItemTimeString_(void *a1, const char *a2, ...)
{
  return [a1 setTimeItemTimeString:];
}

id objc_msgSend_setTimeItemTimer_(void *a1, const char *a2, ...)
{
  return [a1 setTimeItemTimer:];
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTitleHyphenationFactor_(void *a1, const char *a2, ...)
{
  return [a1 setTitleHyphenationFactor:];
}

id objc_msgSend_setTitleLabel_(void *a1, const char *a2, ...)
{
  return [a1 setTitleLabel:];
}

id objc_msgSend_setToValue_(void *a1, const char *a2, ...)
{
  return [a1 setToValue:];
}

id objc_msgSend_setTouchSensitiveButtonEnabledAssertion_(void *a1, const char *a2, ...)
{
  return [a1 setTouchSensitiveButtonEnabledAssertion];
}

id objc_msgSend_setTransition_(void *a1, const char *a2, ...)
{
  return [a1 setTransition:];
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:];
}

id objc_msgSend_setUpdatedClientSettings_(void *a1, const char *a2, ...)
{
  return [a1 setUpdatedClientSettings:];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return [a1 setUserInteractionEnabled:];
}

id objc_msgSend_setUserInterfaceStyle_(void *a1, const char *a2, ...)
{
  return [a1 setUserInterfaceStyle:];
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKey:];
}

id objc_msgSend_setValue_forKeyPath_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forKeyPath:];
}

id objc_msgSend_setVideoGravity_(void *a1, const char *a2, ...)
{
  return [a1 setVideoGravity:];
}

id objc_msgSend_setWiFiPickerVisible_(void *a1, const char *a2, ...)
{
  return [a1 setWiFiPickerVisible:];
}

id objc_msgSend_setWiFiPickerWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWiFiPickerWindow:];
}

id objc_msgSend_setWifiJoinAttemptCount_(void *a1, const char *a2, ...)
{
  return [a1 setWifiJoinAttemptCount:];
}

id objc_msgSend_setWifiManager_(void *a1, const char *a2, ...)
{
  return [a1 setWifiManager:];
}

id objc_msgSend_setWifiPasswordFromNvram_(void *a1, const char *a2, ...)
{
  return [a1 setWifiPasswordFromNvram];
}

id objc_msgSend_setWifiPowerStateOn_(void *a1, const char *a2, ...)
{
  return [a1 setWifiPowerStateOn:];
}

id objc_msgSend_setWifiPoweredOn_(void *a1, const char *a2, ...)
{
  return [a1 setWifiPoweredOn:];
}

id objc_msgSend_setWifiReconnectTimer_(void *a1, const char *a2, ...)
{
  return [a1 setWifiReconnectTimer:];
}

id objc_msgSend_setWifiRequiresPassword_(void *a1, const char *a2, ...)
{
  return [a1 setWifiRequiresPassword:];
}

id objc_msgSend_setWifiSSIDFromNvram_(void *a1, const char *a2, ...)
{
  return [a1 setWifiSSIDFromNvram];
}

id objc_msgSend_setWifiTimeoutTimer_(void *a1, const char *a2, ...)
{
  return [a1 setWifiTimeoutTimer:];
}

id objc_msgSend_setWindow_(void *a1, const char *a2, ...)
{
  return [a1 setWindow:];
}

id objc_msgSend_setWindowLevel_(void *a1, const char *a2, ...)
{
  return [a1 setWindowLevel:];
}

id objc_msgSend_setWindowManager_(void *a1, const char *a2, ...)
{
  return [a1 setWindowManager:];
}

id objc_msgSend_setWindowManagerLayer_(void *a1, const char *a2, ...)
{
  return [a1 setWindowManagerLayer:];
}

id objc_msgSend_setWindowScene_(void *a1, const char *a2, ...)
{
  return [a1 setWindowScene:];
}

id objc_msgSend_setWirelessScanStartDate_(void *a1, const char *a2, ...)
{
  return [a1 setWirelessScanStartDate:];
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return [a1 setWithArray:];
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return [a1 setWithObject:];
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return [a1 setWithObjects:];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupAssistantHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 setupAssistantHeaderView];
}

id objc_msgSend_setupFailed(void *a1, const char *a2, ...)
{
  return _[a1 setupFailed];
}

id objc_msgSend_setupHeaderView(void *a1, const char *a2, ...)
{
  return _[a1 setupHeaderView];
}

id objc_msgSend_setupInfoButton(void *a1, const char *a2, ...)
{
  return _[a1 setupInfoButton];
}

id objc_msgSend_setupQRCodeScanner(void *a1, const char *a2, ...)
{
  return _[a1 setupQRCodeScanner];
}

id objc_msgSend_setupServer(void *a1, const char *a2, ...)
{
  return _[a1 setupServer];
}

id objc_msgSend_setupState(void *a1, const char *a2, ...)
{
  return _[a1 setupState];
}

id objc_msgSend_setupTableView(void *a1, const char *a2, ...)
{
  return _[a1 setupTableView];
}

id objc_msgSend_setupView(void *a1, const char *a2, ...)
{
  return _[a1 setupView];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return _[a1 sharedDataAccessor];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedLocationController(void *a1, const char *a2, ...)
{
  return _[a1 sharedLocationController];
}

id objc_msgSend_sharedNetworkObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedNetworkObserver];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_sharedStyle(void *a1, const char *a2, ...)
{
  return _[a1 sharedStyle];
}

id objc_msgSend_shouldShowInfoPane(void *a1, const char *a2, ...)
{
  return _[a1 shouldShowInfoPane];
}

id objc_msgSend_showBackButton(void *a1, const char *a2, ...)
{
  return _[a1 showBackButton];
}

id objc_msgSend_showDebugInfoWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showDebugInfoWithCompletion:];
}

id objc_msgSend_showDiagnostics(void *a1, const char *a2, ...)
{
  return _[a1 showDiagnostics];
}

id objc_msgSend_showExitConfirmationWithCompletion_response_(void *a1, const char *a2, ...)
{
  return [a1 showExitConfirmationWithCompletion:response:];
}

id objc_msgSend_showLockIcon(void *a1, const char *a2, ...)
{
  return _[a1 showLockIcon];
}

id objc_msgSend_showMenuSheetWithOptions_completion_response_(void *a1, const char *a2, ...)
{
  return [a1 showMenuSheetWithOptions:completion:response:];
}

id objc_msgSend_showPowerDownWithCompletion_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showPowerDownWithCompletion:response:");
}

id objc_msgSend_showSceneStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 showSceneStatusBar];
}

id objc_msgSend_showStatusBar(void *a1, const char *a2, ...)
{
  return _[a1 showStatusBar];
}

id objc_msgSend_showThermalWarningWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showThermalWarningWithCompletion:];
}

id objc_msgSend_showWiFiPickerWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 showWiFiPickerWithCompletion:];
}

id objc_msgSend_showsBusyIndicator(void *a1, const char *a2, ...)
{
  return _[a1 showsBusyIndicator];
}

id objc_msgSend_shutdownTasks(void *a1, const char *a2, ...)
{
  return _[a1 shutdownTasks];
}

id objc_msgSend_shutdownTasksPendingSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 shutdownTasksPendingSemaphore];
}

id objc_msgSend_shutdownWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 shutdownWithOptions:];
}

id objc_msgSend_shutdownWithOptions_forSource_(void *a1, const char *a2, ...)
{
  return [a1 shutdownWithOptions:forSource:];
}

id objc_msgSend_signal(void *a1, const char *a2, ...)
{
  return _[a1 signal];
}

id objc_msgSend_signalStrengthBars(void *a1, const char *a2, ...)
{
  return _[a1 signalStrengthBars];
}

id objc_msgSend_signalStrengthRSSI(void *a1, const char *a2, ...)
{
  return _[a1 signalStrengthRSSI];
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return [a1 sizeThatFits:];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortWithOptions_usingComparator_(void *a1, const char *a2, ...)
{
  return [a1 sortWithOptions:];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return _[a1 specification];
}

id objc_msgSend_ssid(void *a1, const char *a2, ...)
{
  return _[a1 ssid];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return _[a1 start];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return _[a1 startAnimating];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startAnimationAfterDelay_(void *a1, const char *a2, ...)
{
  return [a1 startAnimationAfterDelay:];
}

id objc_msgSend_startListeningForThermalEvents(void *a1, const char *a2, ...)
{
  return _[a1 startListeningForThermalEvents];
}

id objc_msgSend_startMonitoringEventType_error_(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringEventType:error:];
}

id objc_msgSend_startRemoteSetupBroadcast(void *a1, const char *a2, ...)
{
  return _[a1 startRemoteSetupBroadcast];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return _[a1 startRunning];
}

id objc_msgSend_startScan(void *a1, const char *a2, ...)
{
  return _[a1 startScan];
}

id objc_msgSend_startWiFiNetworkScanRequestFrom_(void *a1, const char *a2, ...)
{
  return [a1 startWiFiNetworkScanRequestFrom];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_statusBar(void *a1, const char *a2, ...)
{
  return _[a1 statusBar];
}

id objc_msgSend_statusBarFrame(void *a1, const char *a2, ...)
{
  return _[a1 statusBarFrame];
}

id objc_msgSend_statusBarManager(void *a1, const char *a2, ...)
{
  return _[a1 statusBarManager];
}

id objc_msgSend_statusBarStyle_(void *a1, const char *a2, ...)
{
  return [a1 statusBarStyle:];
}

id objc_msgSend_statusBarView(void *a1, const char *a2, ...)
{
  return _[a1 statusBarView];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return _[a1 stopAnimating];
}

id objc_msgSend_stopAnimation_(void *a1, const char *a2, ...)
{
  return [a1 stopAnimation:];
}

id objc_msgSend_stopMonitoringAllEvents(void *a1, const char *a2, ...)
{
  return _[a1 stopMonitoringAllEvents];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return _[a1 stopRunning];
}

id objc_msgSend_stopScan(void *a1, const char *a2, ...)
{
  return _[a1 stopScan];
}

id objc_msgSend_stopWiFiNetworkScanRequestFrom_(void *a1, const char *a2, ...)
{
  return [a1 stopWiFiNetworkScanRequestFrom:];
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return [a1 stringFromDate:];
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return [a1 stringFromNumber:];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return _[a1 stringValue];
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return [a1 stringWithCString:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}

id objc_msgSend_succinctDescriptionBuilder(void *a1, const char *a2, ...)
{
  return _[a1 succinctDescriptionBuilder];
}

id objc_msgSend_sunlightStateToken(void *a1, const char *a2, ...)
{
  return _[a1 sunlightStateToken];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportedEAPTypes(void *a1, const char *a2, ...)
{
  return _[a1 supportedEAPTypes];
}

id objc_msgSend_suspendWithError_(void *a1, const char *a2, ...)
{
  return [a1 suspendWithError:];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return [a1 synchronousRemoteObjectProxyWithErrorHandler:];
}

id objc_msgSend_system(void *a1, const char *a2, ...)
{
  return _[a1 system];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return _[a1 systemGreenColor];
}

id objc_msgSend_systemName(void *a1, const char *a2, ...)
{
  return _[a1 systemName];
}

id objc_msgSend_systemOrangeColor(void *a1, const char *a2, ...)
{
  return _[a1 systemOrangeColor];
}

id objc_msgSend_systemServicesDelegate(void *a1, const char *a2, ...)
{
  return _[a1 systemServicesDelegate];
}

id objc_msgSend_systemTarget(void *a1, const char *a2, ...)
{
  return _[a1 systemTarget];
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return _[a1 systemVersion];
}

id objc_msgSend_systemWhiteColor(void *a1, const char *a2, ...)
{
  return _[a1 systemWhiteColor];
}

id objc_msgSend_tableView(void *a1, const char *a2, ...)
{
  return _[a1 tableView];
}

id objc_msgSend_tapToWakeGestureRecognizer(void *a1, const char *a2, ...)
{
  return _[a1 tapToWakeGestureRecognizer];
}

id objc_msgSend_tapToWakeSupported(void *a1, const char *a2, ...)
{
  return _[a1 tapToWakeSupported];
}

id objc_msgSend_targetForDeferringEnvironment_(void *a1, const char *a2, ...)
{
  return [a1 targetForDeferringEnvironment:];
}

id objc_msgSend_targetNetworkForBootIntent(void *a1, const char *a2, ...)
{
  return _[a1 targetNetworkForBootIntent];
}

id objc_msgSend_terminateAppWithBundleID_reason_reportCrash_description_completion_(void *a1, const char *a2, ...)
{
  return [a1 terminateAppWithBundleID:reason:reportCrash:description:completion:];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textField(void *a1, const char *a2, ...)
{
  return _[a1 textField];
}

id objc_msgSend_textInputTraits(void *a1, const char *a2, ...)
{
  return _[a1 textInputTraits];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_thermalWarningVisible(void *a1, const char *a2, ...)
{
  return _[a1 thermalWarningVisible];
}

id objc_msgSend_thermalWarningWindow(void *a1, const char *a2, ...)
{
  return _[a1 thermalWarningWindow];
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceDate:];
}

id objc_msgSend_timeItemShortTimeString(void *a1, const char *a2, ...)
{
  return _[a1 timeItemShortTimeString];
}

id objc_msgSend_timeItemTimeString(void *a1, const char *a2, ...)
{
  return _[a1 timeItemTimeString];
}

id objc_msgSend_timeItemTimer(void *a1, const char *a2, ...)
{
  return _[a1 timeItemTimer];
}

id objc_msgSend_timerWithTimeInterval_target_selector_userInfo_repeats_(void *a1, const char *a2, ...)
{
  return [a1 timerWithTimeInterval:target:selector:userInfo:repeats:];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return _[a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return _[a1 topViewController];
}

id objc_msgSend_touchSensitiveButtonEnabledAssertion(void *a1, const char *a2, ...)
{
  return _[a1 touchSensitiveButtonEnabledAssertion];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return _[a1 traitCollection];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_ui_cameraCaptureButtonEnvironment(void *a1, const char *a2, ...)
{
  return [a1 ui_cameraCaptureButtonEnvironment];
}

id objc_msgSend_unConfigureForRemoteSetup(void *a1, const char *a2, ...)
{
  return _[a1 unConfigureForRemoteSetup];
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return _[a1 undimDisplay];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return [a1 unionSet:];
}

id objc_msgSend_updateClientSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 updateClientSettingsWithBlock:];
}

id objc_msgSend_updateIndicatorType_(void *a1, const char *a2, ...)
{
  return [a1 updateIndicatorType:];
}

id objc_msgSend_updateIndicatorVisibilityWithFastFadeAnimation_(void *a1, const char *a2, ...)
{
  return [a1 updateIndicatorVisibilityWithFastFadeAnimation:];
}

id objc_msgSend_updateLanguageComposite(void *a1, const char *a2, ...)
{
  return _[a1 updateLanguageComposite];
}

id objc_msgSend_updateNetworkList(void *a1, const char *a2, ...)
{
  return _[a1 updateNetworkList];
}

id objc_msgSend_updateRecordingIndicatorForStatusBarChanges(void *a1, const char *a2, ...)
{
  return _[a1 updateRecordingIndicatorForStatusBarChanges];
}

id objc_msgSend_updateSceneWithIdentifier_parameters_transitionContext_(void *a1, const char *a2, ...)
{
  return [a1 updateSceneWithIdentifier:parameters:transitionContext:];
}

id objc_msgSend_updateSettingsWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 updateSettingsWithBlock:];
}

id objc_msgSend_updateStatusBarItem_(void *a1, const char *a2, ...)
{
  return [a1 updateStatusBarItem:];
}

id objc_msgSend_updateWiFiState(void *a1, const char *a2, ...)
{
  return _[a1 updateWiFiState];
}

id objc_msgSend_updatedClientSettings(void *a1, const char *a2, ...)
{
  return _[a1 updatedClientSettings];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return _[a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceIdiom];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllerDidDismiss(void *a1, const char *a2, ...)
{
  return _[a1 viewControllerDidDismiss];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_viewIfLoaded(void *a1, const char *a2, ...)
{
  return _[a1 viewIfLoaded];
}

id objc_msgSend_wasRemoteSetupPerformed(void *a1, const char *a2, ...)
{
  return _[a1 wasRemoteSetupPerformed];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_website(void *a1, const char *a2, ...)
{
  return _[a1 website];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_whitelist(void *a1, const char *a2, ...)
{
  return _[a1 whitelist];
}

id objc_msgSend_wiFiPickerVisible(void *a1, const char *a2, ...)
{
  return _[a1 wiFiPickerVisible];
}

id objc_msgSend_wiFiPickerWindow(void *a1, const char *a2, ...)
{
  return _[a1 wiFiPickerWindow];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return _[a1 widthAnchor];
}

id objc_msgSend_wifiJoinAttemptCount(void *a1, const char *a2, ...)
{
  return _[a1 wifiJoinAttemptCount];
}

id objc_msgSend_wifiManager(void *a1, const char *a2, ...)
{
  return _[a1 wifiManager];
}

id objc_msgSend_wifiPasswordFromNvram(void *a1, const char *a2, ...)
{
  return _[a1 wifiPasswordFromNvram];
}

id objc_msgSend_wifiPowerStateOn(void *a1, const char *a2, ...)
{
  return _[a1 wifiPowerStateOn];
}

id objc_msgSend_wifiReconnectTimer(void *a1, const char *a2, ...)
{
  return _[a1 wifiReconnectTimer];
}

id objc_msgSend_wifiRequiresPassword(void *a1, const char *a2, ...)
{
  return _[a1 wifiRequiresPassword];
}

id objc_msgSend_wifiSSIDFromNvram(void *a1, const char *a2, ...)
{
  return _[a1 wifiSSIDFromNvram];
}

id objc_msgSend_wifiScanRequestors(void *a1, const char *a2, ...)
{
  return _[a1 wifiScanRequestors];
}

id objc_msgSend_wifiTimeoutTimer(void *a1, const char *a2, ...)
{
  return _[a1 wifiTimeoutTimer];
}

id objc_msgSend_willLaunchApp(void *a1, const char *a2, ...)
{
  return _[a1 willLaunchApp];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_window_changedBackgroundTunnel_(void *a1, const char *a2, ...)
{
  return [a1 window:changedBackgroundTunnel:];
}

id objc_msgSend_windowDict(void *a1, const char *a2, ...)
{
  return _[a1 windowDict];
}

id objc_msgSend_windowDidAppear_(void *a1, const char *a2, ...)
{
  return [a1 windowDidAppear:];
}

id objc_msgSend_windowDidDismiss_(void *a1, const char *a2, ...)
{
  return [a1 windowDidDismiss:];
}

id objc_msgSend_windowLevel(void *a1, const char *a2, ...)
{
  return _[a1 windowLevel];
}

id objc_msgSend_windowLevel_(void *a1, const char *a2, ...)
{
  return [a1 windowLevel:];
}

id objc_msgSend_windowManager(void *a1, const char *a2, ...)
{
  return _[a1 windowManager];
}

id objc_msgSend_windowManagerLayer(void *a1, const char *a2, ...)
{
  return _[a1 windowManagerLayer];
}

id objc_msgSend_windowRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 windowRepresentation];
}

id objc_msgSend_windowRepresentationForIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 windowRepresentationForIdentifier:];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_windowWillAppear_(void *a1, const char *a2, ...)
{
  return [a1 windowWillAppear:];
}

id objc_msgSend_windowWillDismiss_(void *a1, const char *a2, ...)
{
  return [a1 windowWillDismiss:];
}

id objc_msgSend_windows(void *a1, const char *a2, ...)
{
  return _[a1 windows];
}