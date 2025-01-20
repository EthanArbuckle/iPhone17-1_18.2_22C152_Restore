void sub_1000044A8(id a1)
{
  uint64_t vars8;

  qword_100026140 = objc_alloc_init(PBAHIDEventController);

  _objc_release_x1();
}

uint64_t start(int a1, char **a2)
{
  id v5 = (id)FBSystemShellInitialize();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = UIApplicationMain(a1, a2, v7, v9);

  return v10;
}

void sub_100004844(id a1, FBMutableSystemShellInitializationOptions *a2)
{
  v2 = a2;
  [(FBMutableSystemShellInitializationOptions *)v2 setShouldWaitForMigrator:0];
  [(FBMutableSystemShellInitializationOptions *)v2 setRegisterAdditionalServicesBlock:&stru_10001C6A8];
}

void sub_100004894(id a1)
{
  id v3 = +[NSBundle mainBundle];
  v1 = [v3 bundleIdentifier];
  id v2 = +[LSApplicationProxy applicationProxyForIdentifier:v1];
}

void sub_100005100(uint64_t a1, float a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005194;
  v3[3] = &unk_10001C6D0;
  id v4 = *(id *)(a1 + 32);
  float v5 = a2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v3);
}

id sub_100005194(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProgress:*(float *)(a1 + 40)];
}

void sub_1000051A8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10000526C;
  v6[3] = &unk_10001C770;
  id v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v3;
  id v8 = v4;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_10000526C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) resetIdleTimerAndUndim:1];
  v26 = _NSConcreteStackBlock;
  uint64_t v27 = 3221225472;
  v28 = sub_100005650;
  v29 = &unk_10001C720;
  id v2 = *(id *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  id v30 = v2;
  uint64_t v31 = v3;
  AnalyticsSendEventLazy();
  if (!*(void *)(a1 + 40))
  {
    id v9 = +[SBFMobileKeyBag sharedInstance];
    uint64_t v10 = dispatch_group_create();
    dispatch_group_enter(v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005750;
    block[3] = &unk_10001C748;
    id v25 = v9;
    v11 = v9;
    dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, block);
    dispatch_group_enter(v10);
    id v12 = [objc_alloc((Class)SBFMobileKeyBagUnlockOptions) initWithPasscode:*(void *)(a1 + 48) skipSEKeepUserDataOperation:1];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000057C0;
    v22[3] = &unk_10001C748;
    v13 = v10;
    v23 = v13;
    [(PBADataRecoveryErrorViewController *)v11 createStashBagWithOptions:v12 completion:v22];
    v14 = objc_alloc_init(PBAAppleLogoViewController);
    v15 = *(void **)(*(void *)(a1 + 32) + 16);
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000057C8;
    v20[3] = &unk_10001C748;
    v21 = v13;
    v16 = v13;
    [v15 pushViewController:v14 animated:1 completion:v20];

LABEL_8:
    goto LABEL_9;
  }
  id v4 = sub_1000085D4();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000FDD0((uint64_t *)(a1 + 40), v4);
  }

  if (![*(id *)(*(void *)(a1 + 32) + 8) dataRecoveryPossible])
  {
    v11 = objc_alloc_init(PBADataRecoveryErrorViewController);
    v17 = *(void **)(*(void *)(a1 + 32) + 16);
    v32 = v11;
    v18 = +[NSArray arrayWithObjects:&v32 count:1];
    [v17 setViewControllers:v18 animated:1];

    goto LABEL_8;
  }
  id v5 = *(void **)(a1 + 56);
  v6 = +[NSBundle mainBundle];
  id v7 = [v6 localizedStringForKey:@"PREBOARD_RECOVERY_FAILED" value:&stru_10001CD78 table:@"PreBoard"];
  [v5 setStatusText:v7];

  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000057D0;
  v19[3] = &unk_10001C748;
  v19[4] = *(void *)(a1 + 32);
  dispatch_after(v8, (dispatch_queue_t)&_dispatch_main_q, v19);
LABEL_9:
}

id sub_100005650(uint64_t a1)
{
  v6[0] = @"successful";
  id v2 = +[NSNumber numberWithInt:*(void *)(a1 + 32) == 0];
  v6[1] = @"recoverable";
  v7[0] = v2;
  uint64_t v3 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [*(id *)(*(void *)(a1 + 40) + 8) dataRecoveryPossible]);
  v7[1] = v3;
  id v4 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void sub_100005750(uint64_t a1)
{
  id v2 = sub_1000085D4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v3, 2u);
  }

  [*(id *)(a1 + 32) lockSkippingGracePeriod:0];
  exit(0);
}

void sub_1000057C0(uint64_t a1)
{
}

void sub_1000057C8(uint64_t a1)
{
}

id sub_1000057D0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) popToRootViewControllerAnimated:1];
  id v2 = *(void **)(a1 + 32);

  return [v2 _evaluateDeviceBlockState];
}

id sub_1000065B8(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    CFStringRef v1 = @"LAPreboard";
  }
  else
  {
    unsigned int v2 = [*(id *)(*(void *)(a1 + 32) + 72) requiresDataRecovery];
    CFStringRef v1 = @"unlock";
    if (v2) {
      CFStringRef v1 = @"recovery";
    }
  }
  CFStringRef v5 = @"reason";
  CFStringRef v6 = v1;
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:&v6 forKeys:&v5 count:1];

  return v3;
}

void sub_100006678(id a1)
{
}

void sub_100006690(id a1)
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  CFStringRef v1 = +[BKSDisplayRenderOverlay dismissActions];
  id v2 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v12;
    do
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v12 != v4) {
          objc_enumerationMutation(v1);
        }
        CFStringRef v6 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v7 = [v6 overlayDescriptor];
        unsigned int v8 = [v7 isInterstitial];

        if (v8)
        {
          id v9 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
          uint64_t v10 = +[BSAnimationSettings settingsWithDuration:v9 timingFunction:0.75];
          [v6 dismissWithAnimation:v10];
        }
        else
        {
          [v6 dismissWithAnimation:0];
        }
      }
      id v3 = [v1 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v3);
  }
}

void sub_10000758C(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = +[FBDisplayManager mainConfiguration];
  [v6 setDisplayConfiguration:v3];

  uint64_t v4 = +[UIScreen mainScreen];
  [v4 _referenceBounds];
  [v6 setFrame:];

  [v6 setLevel:0.0];
  [v6 setForeground:1];
  [v6 setInterfaceOrientation:[*(id *)(a1 + 32) _computeBootOrientation]];
  if ([v6 isUISubclass]) {
    [v6 setDeviceOrientationEventsEnabled:1];
  }
  CFStringRef v5 = [v6 ignoreOcclusionReasons];
  [v5 addObject:@"SystemApp"];
}

void sub_10000767C(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isUISubclass])
  {
    id v3 = [*(id *)(a1 + 32) settings];
    [v4 setInterfaceOrientation:[v3 interfaceOrientation]];

    [v4 setStatusBarStyle:0];
  }
}

void sub_100007920(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDisplayConfiguration:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) bounds];
  [v3 setFrame:];
  [v3 setForeground:1];
  [v3 setLevel:1.0];
  [v3 setInterfaceOrientation:[*(id *)(a1 + 40) _computeBootOrientation]];
  if ([v3 isUISubclass]) {
    [v3 setInterfaceOrientationMode:2];
  }
}

id sub_100007AF8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) addScene:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);

  return [v2 updateSettingsWithBlock:&stru_10001C8B8];
}

void sub_100007B48(id a1, FBSMutableSceneSettings *a2)
{
}

id sub_1000085D4()
{
  if (qword_100026158 != -1) {
    dispatch_once(&qword_100026158, &stru_10001C900);
  }
  v0 = (void *)qword_100026150;

  return v0;
}

void sub_100008628(id a1)
{
  qword_100026150 = (uint64_t)os_log_create("com.apple.PreBoard", "common");

  _objc_release_x1();
}

void sub_100008810(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 recoveryRequired];
}

void sub_10000891C(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) state];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 recoveryPossible];
}

id sub_100008A60(uint64_t a1)
{
  return [*(id *)(a1 + 32) _queue_performDataRecoveryWithPasscode:*(void *)(a1 + 40) progressHandler:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

uint64_t sub_100008D48(void *a1)
{
  return (*(uint64_t (**)(float))(a1[4] + 16))((float)(uint64_t)(a1[5] - a1[6]) / (float)(uint64_t)a1[5]);
}

uint64_t sub_100008D6C(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10000907C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_100009098(uint64_t a1)
{
  uint64_t v2 = +[LAPreboard sharedInstance];
  id v3 = [*(id *)(a1 + 32) passcode];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100009174;
  v4[3] = &unk_10001C9F0;
  objc_copyWeak(&v5, (id *)(a1 + 40));
  [v2 enableCurrentUseCaseWithPasscode:v3 completion:v4];

  objc_destroyWeak(&v5);
}

void sub_100009160(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_100009174(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    exit(0);
  }
  id v4 = v3;
  id v5 = sub_1000085D4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    unsigned int v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Unable to set ACM variable with error: %@", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _finish];
}

void sub_100009730(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100009754(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000976C(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _finish];
}

void sub_100009870(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  exit(0);
}

id sub_10000A16C(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

id sub_10000A178(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

id *sub_10000A184(id *result)
{
  if (*((unsigned char *)result + 40)) {
    return (id *)[result[4] removeFromParentViewController];
  }
  return result;
}

id *sub_10000A198(id *result)
{
  if (*((unsigned char *)result + 48)) {
    return (id *)[result[4] didMoveToParentViewController:result[5]];
  }
  return result;
}

uint64_t sub_10000A1B4(void *a1)
{
  (*(void (**)(void))(a1[4] + 16))();
  (*(void (**)(void))(a1[5] + 16))();
  uint64_t result = a1[6];
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_10000A220(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000A230(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t sub_10000A294(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_10000A2A4(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

id sub_10000ADA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleBlockedDevice];
}

void sub_10000AF74(id a1)
{
  CFStringRef v1 = sub_1000085D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exiting as a result of external unlock while we're running", v2, 2u);
  }

  exit(0);
}

void sub_10000B288(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000B2A4(uint64_t a1, int a2, uint64_t a3)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && a2)
  {
    unsigned int v8 = WeakRetained;
    if ([WeakRetained[10] hasPasscodeSet])
    {
      id v6 = [[PBAPasscodeEntryViewController alloc] initWithLightBackground:a3];
      id v7 = v8[4];
      v8[4] = v6;

      [v8[4] setDelegate:];
      [v8[1] pushViewController:v8[4] animated:1 completion:0];
      [v8 _configurePasscodeEntryViewController:v8[4]];
    }
    else
    {
      [v8 _authenticateWithEmptyPasscode];
    }
    id WeakRetained = v8;
  }
}

id sub_10000B5F8(uint64_t a1)
{
  [*(id *)(a1 + 32) successfulAuthHandler:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) resetPasscodeEntryFieldForFailure:0];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _resetStateAfterHandlingAuthenticationResult];
}

id sub_10000B644(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) failedAuthHandler:*(void *)(a1 + 40) error:a2];
  [*(id *)(a1 + 48) resetPasscodeEntryFieldForFailure:1];
  id v3 = *(void **)(a1 + 32);

  return [v3 _resetStateAfterHandlingAuthenticationResult];
}

id sub_10000B694(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidAuthHandler:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) resetPasscodeEntryFieldForFailure:1];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _resetStateAfterHandlingAuthenticationResult];
}

void sub_10000B8FC(id a1)
{
  CFStringRef v1 = sub_1000085D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v2, 2u);
  }

  exit(0);
}

void sub_10000BE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000BEA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    uint64_t v2 = [WeakRetained blockStatusProvider];
    unsigned int v3 = [v2 isBlocked];

    if (v3)
    {
      id v4 = [v8 overlayView];
      id v5 = [v4 subtitleLabel];
      id v6 = [v8 blockTimer];
      id v7 = [v6 subtitleText];
      [v5 setText:v7];
    }
    else
    {
      id v4 = [v8 delegate];
      [v4 deviceBlockOverlayViewControllerDidChangeBlockState:v8];
    }

    id WeakRetained = v8;
  }
}

void sub_10000C338(id a1)
{
  CFStringRef v1 = sub_1000085D4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "exiting as result of successful unlock", v2, 2u);
  }

  exit(0);
}

void sub_10000C398(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidate];
  uint64_t v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

void sub_10000C3D4(uint64_t a1)
{
}

void sub_10000E594(id a1)
{
  qword_100026160 = objc_alloc_init(PBAIdleSleepController);

  _objc_release_x1();
}

void sub_10000E7A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000E7C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned __int8 v5 = [v3 eventMask];
  id v6 = sub_1000085D4();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      LOWORD(v8) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "dimming for idle", (uint8_t *)&v8, 2u);
    }

    [WeakRetained dimDisplay];
  }
  else
  {
    if (v7)
    {
      int v8 = 138543362;
      id v9 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "reset idle for event %{public}@", (uint8_t *)&v8, 0xCu);
    }

    [WeakRetained resetIdleTimerAndUndim:1];
  }
}

void sub_10000F1F0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_10000FDD0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Data recovery failed with error %{public}@", (uint8_t *)&v3, 0xCu);
}

void sub_10000FE4C(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "tripleClickOptions:%{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000FEC4(os_log_t log)
{
  *(_WORD *)CFStringRef v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create process identity for InputUI", v1, 2u);
}

void sub_10000FF08(os_log_t log)
{
  *(_WORD *)CFStringRef v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not create InputUI scene", v1, 2u);
}

void sub_10000FF4C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000FFB8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100010024(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

uint64_t BKSHIDEventGetSmartCoverStateFromEvent()
{
  return _BKSHIDEventGetSmartCoverStateFromEvent();
}

uint64_t BKSHIDServicesLockOrientation()
{
  return _BKSHIDServicesLockOrientation();
}

uint64_t BKSHIDServicesSetBacklightFactorWithFadeDuration()
{
  return _BKSHIDServicesSetBacklightFactorWithFadeDuration();
}

uint64_t BKSHIDServicesSetHIDUILockedStateWithSource()
{
  return _BKSHIDServicesSetHIDUILockedStateWithSource();
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return _CFArrayGetCount(theArray);
}

void CFRelease(CFTypeRef cf)
{
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

uint64_t FBSystemShellInitialize()
{
  return _FBSystemShellInitialize();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

uint64_t IOHIDEventGetType()
{
  return _IOHIDEventGetType();
}

uint64_t MGGetSInt32Answer()
{
  return _MGGetSInt32Answer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t SBFEffectiveHomeButtonType()
{
  return _SBFEffectiveHomeButtonType();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return _UIAccessibilityIsReduceTransparencyEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return _UIRectCenteredIntegralRectScale();
}

uint64_t _AXSHandleTripleClickHomeButtonPress()
{
  return __AXSHandleTripleClickHomeButtonPress();
}

uint64_t _AXSHomeClickSpeed()
{
  return __AXSHomeClickSpeed();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

uint64_t mach_continuous_time(void)
{
  return _mach_continuous_time();
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

id objc_retainAutoreleaseReturnValue(id a1)
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

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__authenticateWithEmptyPasscode(void *a1, const char *a2, ...)
{
  return [a1 _authenticateWithEmptyPasscode];
}

id objc_msgSend__cancelLockButtonTimer(void *a1, const char *a2, ...)
{
  return [a1 _cancelLockButtonTimer];
}

id objc_msgSend__computeBootOrientation(void *a1, const char *a2, ...)
{
  return [a1 _computeBootOrientation];
}

id objc_msgSend__contentHorizontalInset(void *a1, const char *a2, ...)
{
  return [a1 _contentHorizontalInset];
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return [a1 _contextId];
}

id objc_msgSend__createInitialAppScene(void *a1, const char *a2, ...)
{
  return [a1 _createInitialAppScene];
}

id objc_msgSend__createInputUIScene(void *a1, const char *a2, ...)
{
  return [a1 _createInputUIScene];
}

id objc_msgSend__evaluateDeviceBlockState(void *a1, const char *a2, ...)
{
  return [a1 _evaluateDeviceBlockState];
}

id objc_msgSend__finish(void *a1, const char *a2, ...)
{
  return [a1 _finish];
}

id objc_msgSend__handleBlockedDevice(void *a1, const char *a2, ...)
{
  return [a1 _handleBlockedDevice];
}

id objc_msgSend__hidEvent(void *a1, const char *a2, ...)
{
  return [a1 _hidEvent];
}

id objc_msgSend__layoutCallToActionLabel(void *a1, const char *a2, ...)
{
  return [a1 _layoutCallToActionLabel];
}

id objc_msgSend__layoutHomeAffordance(void *a1, const char *a2, ...)
{
  return [a1 _layoutHomeAffordance];
}

id objc_msgSend__layoutInternalUIWarningLabel(void *a1, const char *a2, ...)
{
  return [a1 _layoutInternalUIWarningLabel];
}

id objc_msgSend__lockButtonDown(void *a1, const char *a2, ...)
{
  return [a1 _lockButtonDown];
}

id objc_msgSend__lockButtonUp(void *a1, const char *a2, ...)
{
  return [a1 _lockButtonUp];
}

id objc_msgSend__noteDeviceLockStateMayHaveChangedForExternalReasons(void *a1, const char *a2, ...)
{
  return [a1 _noteDeviceLockStateMayHaveChangedForExternalReasons];
}

id objc_msgSend__numberPad(void *a1, const char *a2, ...)
{
  return [a1 _numberPad];
}

id objc_msgSend__preventIdleSleep(void *a1, const char *a2, ...)
{
  return [a1 _preventIdleSleep];
}

id objc_msgSend__reconfigureHomeButton(void *a1, const char *a2, ...)
{
  return [a1 _reconfigureHomeButton];
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return [a1 _referenceBounds];
}

id objc_msgSend__setupHomeButtonRecognition(void *a1, const char *a2, ...)
{
  return [a1 _setupHomeButtonRecognition];
}

id objc_msgSend__setupTapToWakeRecognition(void *a1, const char *a2, ...)
{
  return [a1 _setupTapToWakeRecognition];
}

id objc_msgSend__smartCoverClosed(void *a1, const char *a2, ...)
{
  return [a1 _smartCoverClosed];
}

id objc_msgSend__smartCoverOpen(void *a1, const char *a2, ...)
{
  return [a1 _smartCoverOpen];
}

id objc_msgSend__undimDisplayForce(void *a1, const char *a2, ...)
{
  return [a1 _undimDisplayForce];
}

id objc_msgSend__updateContentWidthConstraint(void *a1, const char *a2, ...)
{
  return [a1 _updateContentWidthConstraint];
}

id objc_msgSend__userCancelledEntry(void *a1, const char *a2, ...)
{
  return [a1 _userCancelledEntry];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_areAnimationsEnabled(void *a1, const char *a2, ...)
{
  return [a1 areAnimationsEnabled];
}

id objc_msgSend_arrangedSubviews(void *a1, const char *a2, ...)
{
  return [a1 arrangedSubviews];
}

id objc_msgSend_authenticationController(void *a1, const char *a2, ...)
{
  return [a1 authenticationController];
}

id objc_msgSend_becomeFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 becomeFirstResponder];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blockStatusProvider(void *a1, const char *a2, ...)
{
  return [a1 blockStatusProvider];
}

id objc_msgSend_blockTimer(void *a1, const char *a2, ...)
{
  return [a1 blockTimer];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return [a1 clearColor];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_combinedTintColor(void *a1, const char *a2, ...)
{
  return [a1 combinedTintColor];
}

id objc_msgSend_confirmationActionTitle(void *a1, const char *a2, ...)
{
  return [a1 confirmationActionTitle];
}

id objc_msgSend_confirmationCancelTitle(void *a1, const char *a2, ...)
{
  return [a1 confirmationCancelTitle];
}

id objc_msgSend_confirmationMessage(void *a1, const char *a2, ...)
{
  return [a1 confirmationMessage];
}

id objc_msgSend_confirmationTitle(void *a1, const char *a2, ...)
{
  return [a1 confirmationTitle];
}

id objc_msgSend_constant(void *a1, const char *a2, ...)
{
  return [a1 constant];
}

id objc_msgSend_contentInset(void *a1, const char *a2, ...)
{
  return [a1 contentInset];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_dataRecoveryPossible(void *a1, const char *a2, ...)
{
  return [a1 dataRecoveryPossible];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultContext(void *a1, const char *a2, ...)
{
  return [a1 defaultContext];
}

id objc_msgSend_defaultFocusPredicate(void *a1, const char *a2, ...)
{
  return [a1 defaultFocusPredicate];
}

id objc_msgSend_defaultSystemPredicate(void *a1, const char *a2, ...)
{
  return [a1 defaultSystemPredicate];
}

id objc_msgSend_definition(void *a1, const char *a2, ...)
{
  return [a1 definition];
}

id objc_msgSend_definitionForHomeButton(void *a1, const char *a2, ...)
{
  return [a1 definitionForHomeButton];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_dimDisplay(void *a1, const char *a2, ...)
{
  return [a1 dimDisplay];
}

id objc_msgSend_dismissActions(void *a1, const char *a2, ...)
{
  return [a1 dismissActions];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_escrowCount(void *a1, const char *a2, ...)
{
  return [a1 escrowCount];
}

id objc_msgSend_eventMask(void *a1, const char *a2, ...)
{
  return [a1 eventMask];
}

id objc_msgSend_fadeOut(void *a1, const char *a2, ...)
{
  return [a1 fadeOut];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_hasPasscodeSet(void *a1, const char *a2, ...)
{
  return [a1 hasPasscodeSet];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_iconSystemName(void *a1, const char *a2, ...)
{
  return [a1 iconSystemName];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreOcclusionReasons(void *a1, const char *a2, ...)
{
  return [a1 ignoreOcclusionReasons];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 interfaceOrientation];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isBlocked(void *a1, const char *a2, ...)
{
  return [a1 isBlocked];
}

id objc_msgSend_isDisplayDim(void *a1, const char *a2, ...)
{
  return [a1 isDisplayDim];
}

id objc_msgSend_isInterstitial(void *a1, const char *a2, ...)
{
  return [a1 isInterstitial];
}

id objc_msgSend_isRequired(void *a1, const char *a2, ...)
{
  return [a1 isRequired];
}

id objc_msgSend_isUISubclass(void *a1, const char *a2, ...)
{
  return [a1 isUISubclass];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return [a1 layoutMargins];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lightPasscodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 lightPasscodeLockViewForUsersCurrentStyle];
}

id objc_msgSend_localIdentity(void *a1, const char *a2, ...)
{
  return [a1 localIdentity];
}

id objc_msgSend_lockButtonTimer(void *a1, const char *a2, ...)
{
  return [a1 lockButtonTimer];
}

id objc_msgSend_lockScreenIconSystemName(void *a1, const char *a2, ...)
{
  return [a1 lockScreenIconSystemName];
}

id objc_msgSend_lockScreenMessage(void *a1, const char *a2, ...)
{
  return [a1 lockScreenMessage];
}

id objc_msgSend_lockScreenStackItems(void *a1, const char *a2, ...)
{
  return [a1 lockScreenStackItems];
}

id objc_msgSend_lockScreenTitle(void *a1, const char *a2, ...)
{
  return [a1 lockScreenTitle];
}

id objc_msgSend_lockState(void *a1, const char *a2, ...)
{
  return [a1 lockState];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return [a1 mainConfiguration];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_message(void *a1, const char *a2, ...)
{
  return [a1 message];
}

id objc_msgSend_monitorUsingMainQueue(void *a1, const char *a2, ...)
{
  return [a1 monitorUsingMainQueue];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_overlayDescriptor(void *a1, const char *a2, ...)
{
  return [a1 overlayDescriptor];
}

id objc_msgSend_overlayView(void *a1, const char *a2, ...)
{
  return [a1 overlayView];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_passcode(void *a1, const char *a2, ...)
{
  return [a1 passcode];
}

id objc_msgSend_passcodeEntryScreenSubtitle(void *a1, const char *a2, ...)
{
  return [a1 passcodeEntryScreenSubtitle];
}

id objc_msgSend_passcodeEntryScreenTitle(void *a1, const char *a2, ...)
{
  return [a1 passcodeEntryScreenTitle];
}

id objc_msgSend_passcodeLockView(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockView];
}

id objc_msgSend_passcodeLockViewForUsersCurrentStyle(void *a1, const char *a2, ...)
{
  return [a1 passcodeLockViewForUsersCurrentStyle];
}

id objc_msgSend_passcodeSubtitle(void *a1, const char *a2, ...)
{
  return [a1 passcodeSubtitle];
}

id objc_msgSend_passcodeTitle(void *a1, const char *a2, ...)
{
  return [a1 passcodeTitle];
}

id objc_msgSend_presentDataRecovery(void *a1, const char *a2, ...)
{
  return [a1 presentDataRecovery];
}

id objc_msgSend_presentDeviceUnlock(void *a1, const char *a2, ...)
{
  return [a1 presentDeviceUnlock];
}

id objc_msgSend_presentLAPasscodeVerification(void *a1, const char *a2, ...)
{
  return [a1 presentLAPasscodeVerification];
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return [a1 presentedViewController];
}

id objc_msgSend_quaternaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 quaternaryLabelColor];
}

id objc_msgSend_recoveryPossible(void *a1, const char *a2, ...)
{
  return [a1 recoveryPossible];
}

id objc_msgSend_recoveryRequired(void *a1, const char *a2, ...)
{
  return [a1 recoveryRequired];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
}

id objc_msgSend_registerForUnlockNotification(void *a1, const char *a2, ...)
{
  return [a1 registerForUnlockNotification];
}

id objc_msgSend_removeFromParentViewController(void *a1, const char *a2, ...)
{
  return [a1 removeFromParentViewController];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_requiresDataRecovery(void *a1, const char *a2, ...)
{
  return [a1 requiresDataRecovery];
}

id objc_msgSend_resetForFailedPasscode(void *a1, const char *a2, ...)
{
  return [a1 resetForFailedPasscode];
}

id objc_msgSend_resetForSuccess(void *a1, const char *a2, ...)
{
  return [a1 resetForSuccess];
}

id objc_msgSend_secondarySystemBackgroundColor(void *a1, const char *a2, ...)
{
  return [a1 secondarySystemBackgroundColor];
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return [a1 setNeedsLayout];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specification(void *a1, const char *a2, ...)
{
  return [a1 specification];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startReceivingEvents(void *a1, const char *a2, ...)
{
  return [a1 startReceivingEvents];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_subtitleLabel(void *a1, const char *a2, ...)
{
  return [a1 subtitleLabel];
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return [a1 subtitleText];
}

id objc_msgSend_suggestedEdgeSpacing(void *a1, const char *a2, ...)
{
  return [a1 suggestedEdgeSpacing];
}

id objc_msgSend_systemTarget(void *a1, const char *a2, ...)
{
  return [a1 systemTarget];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return [a1 titleLabel];
}

id objc_msgSend_titleText(void *a1, const char *a2, ...)
{
  return [a1 titleText];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_topViewController(void *a1, const char *a2, ...)
{
  return [a1 topViewController];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_undimDisplay(void *a1, const char *a2, ...)
{
  return [a1 undimDisplay];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_usesInputSystemUI(void *a1, const char *a2, ...)
{
  return [a1 usesInputSystemUI];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
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