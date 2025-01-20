void sub_100003C98(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;

  v2 = sub_100006A90();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_1000120B4();
  }

  v3 = +[NSError errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void sub_100003D34(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = sub_100006A90();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_10001211C();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "playSoundForAccessory sound started", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

void sub_100003F88(uint64_t a1)
{
  v2 = sub_100006668();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100012184();
  }

  id v3 = +[NSError errorWithDomain:kFMDErrorDomain code:13 userInfo:0];
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
  }
}

void sub_100004024(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = sub_100006668();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000121EC();
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "stopSoundForAccessory sound did stop", v7, 2u);
  }

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);
  }
  [*(id *)(a1 + 32) invalidate];
}

void sub_100004304(uint64_t a1)
{
  double v2 = *(double *)(a1 + 64);
  double v3 = 5.0;
  if (v2 >= 5.0) {
    double v3 = *(double *)(a1 + 64);
  }
  if (v2 >= 0.0) {
    double v4 = v3;
  }
  else {
    double v4 = 0.0;
  }
  v5 = [*(id *)(a1 + 32) accessoryAudioController];
  [v5 setRampUpDuration:v4];

  uint64_t v6 = [*(id *)(a1 + 32) accessoryAudioController];
  v7 = *(void **)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 48);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000441C;
  v9[3] = &unk_100020550;
  v9[4] = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 72);
  id v10 = v7;
  id v11 = *(id *)(a1 + 56);
  [v6 startPlayingSoundForAccessory:v10 channels:v8 completion:v9];
}

void sub_10000441C(void *a1, void *a2)
{
  id v3 = a2;
  if (!v3)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000044E0;
    block[3] = &unk_100020528;
    double v4 = (void *)a1[5];
    block[4] = a1[4];
    uint64_t v8 = a1[7];
    id v7 = v4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
  uint64_t v5 = a1[6];
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

id sub_1000044E0(uint64_t a1)
{
  [*(id *)(a1 + 32) setTimeoutForDuration:*(double *)(a1 + 48)];
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 setCurrentAccessory:v3];
}

void sub_100004708(uint64_t a1)
{
  if (*(double *)(a1 + 56) >= 0.0) {
    double v2 = *(double *)(a1 + 56);
  }
  else {
    double v2 = 0.0;
  }
  uint64_t v3 = [*(id *)(a1 + 32) accessoryAudioController];
  [v3 setRampDownDuration:v2];

  double v4 = [*(id *)(a1 + 32) accessoryAudioController];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000047F0;
  v6[3] = &unk_1000205A0;
  uint64_t v5 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 48);
  [v4 stopPlayingForAccessory:v5 completion:v6];
}

void sub_1000047F0(uint64_t a1, void *a2)
{
  id v4 = a2;
  [*(id *)(a1 + 32) invalidateStopSoundTimer];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
  }
}

void sub_100004AC4(id a1, NSError *a2)
{
  double v2 = a2;
  if (v2)
  {
    uint64_t v3 = sub_1000069F8();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100012254();
    }
  }
}

void sub_100004C34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004E50(id a1)
{
  qword_10002D6A0 = (uint64_t)dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothManagerDelegateQueue", 0);

  _objc_release_x1();
}

void sub_100004EE4(id a1)
{
  qword_10002D6B0 = (uint64_t)dispatch_queue_create("com.apple.icloud.FindMyDevice.FindMyExtensionContainer.FindMyDeviceBluetoothExtension.bluetoothManagerSerialQueue", 0);

  _objc_release_x1();
}

void sub_100005180(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000051B0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000051C0(uint64_t a1)
{
}

void sub_1000051C8(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pairedDevices];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v5);
}

void sub_100005878(id a1)
{
  qword_10002D6B8 = objc_alloc_init(FMDAutomationHelperFactory);

  _objc_release_x1();
}

void sub_100005B8C(id a1)
{
  id v1 = objc_alloc((Class)FMSharedFileContainer);
  id v2 = [v1 initWithIdentifier:off_10002D118];
  uint64_t v3 = [v2 url];
  [v3 fm_preferencesPathURLForDomain:@"FMDAutomationAVRouteController"];
  id v8 = (id)objc_claimAutoreleasedReturnValue();

  id v4 = [objc_alloc((Class)FMDataArchiver) initWithFileURL:v8];
  uint64_t v5 = +[NSSet setWithObject:objc_opt_class()];
  uint64_t v6 = [v4 readDictionaryAndClasses:v5 error:0];

  id v7 = [v6 objectForKeyedSubscript:@"FMDAutomationAVRouteControllerAutomationActiveKey"];
  byte_10002D6C8 = [v7 BOOLValue];
}

uint64_t sub_100005DE8(uint64_t a1)
{
  qword_10002D6D8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

id sub_100006668()
{
  if (qword_10002D6E8 != -1) {
    dispatch_once(&qword_10002D6E8, &stru_100021128);
  }
  v0 = (void *)qword_10002D6F0;

  return v0;
}

void sub_1000066BC(id a1)
{
  qword_10002D6F0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "_");

  _objc_release_x1();
}

id sub_100006700()
{
  if (qword_10002D6F8 != -1) {
    dispatch_once(&qword_10002D6F8, &stru_100021148);
  }
  v0 = (void *)qword_10002D700;

  return v0;
}

void sub_100006754(id a1)
{
  qword_10002D700 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "locations");

  _objc_release_x1();
}

id sub_100006798()
{
  if (qword_10002D708 != -1) {
    dispatch_once(&qword_10002D708, &stru_100021168);
  }
  v0 = (void *)qword_10002D710;

  return v0;
}

void sub_1000067EC(id a1)
{
  qword_10002D710 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accessory");

  _objc_release_x1();
}

id sub_100006830()
{
  if (qword_10002D718 != -1) {
    dispatch_once(&qword_10002D718, &stru_100021188);
  }
  v0 = (void *)qword_10002D720;

  return v0;
}

void sub_100006884(id a1)
{
  qword_10002D720 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "traffic");

  _objc_release_x1();
}

id sub_1000068C8()
{
  if (qword_10002D728 != -1) {
    dispatch_once(&qword_10002D728, &stru_1000211A8);
  }
  v0 = (void *)qword_10002D730;

  return v0;
}

void sub_10000691C(id a1)
{
  qword_10002D730 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "encoder");

  _objc_release_x1();
}

id sub_100006960()
{
  if (qword_10002D738 != -1) {
    dispatch_once(&qword_10002D738, &stru_1000211C8);
  }
  v0 = (void *)qword_10002D740;

  return v0;
}

void sub_1000069B4(id a1)
{
  qword_10002D740 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "bluetoothsession");

  _objc_release_x1();
}

id sub_1000069F8()
{
  if (qword_10002D748 != -1) {
    dispatch_once(&qword_10002D748, &stru_1000211E8);
  }
  v0 = (void *)qword_10002D750;

  return v0;
}

void sub_100006A4C(id a1)
{
  qword_10002D750 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions");

  _objc_release_x1();
}

id sub_100006A90()
{
  if (qword_10002D758 != -1) {
    dispatch_once(&qword_10002D758, &stru_100021208);
  }
  v0 = (void *)qword_10002D760;

  return v0;
}

void sub_100006AE4(id a1)
{
  qword_10002D760 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "extensions_playSound");

  _objc_release_x1();
}

id sub_100006B28()
{
  if (qword_10002D768 != -1) {
    dispatch_once(&qword_10002D768, &stru_100021228);
  }
  v0 = (void *)qword_10002D770;

  return v0;
}

void sub_100006B7C(id a1)
{
  qword_10002D770 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "secureLocations");

  _objc_release_x1();
}

id sub_100006BC0()
{
  if (qword_10002D778 != -1) {
    dispatch_once(&qword_10002D778, &stru_100021248);
  }
  v0 = (void *)qword_10002D780;

  return v0;
}

void sub_100006C14(id a1)
{
  qword_10002D780 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "healUCRT");

  _objc_release_x1();
}

id sub_100006C58()
{
  if (qword_10002D788 != -1) {
    dispatch_once(&qword_10002D788, &stru_100021268);
  }
  v0 = (void *)qword_10002D790;

  return v0;
}

void sub_100006CAC(id a1)
{
  qword_10002D790 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "repairDevice");

  _objc_release_x1();
}

id sub_100006CF0()
{
  if (qword_10002D798 != -1) {
    dispatch_once(&qword_10002D798, &stru_100021288);
  }
  v0 = (void *)qword_10002D7A0;

  return v0;
}

void sub_100006D44(id a1)
{
  qword_10002D7A0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ALFailureAnalytics");

  _objc_release_x1();
}

id sub_100006D88()
{
  if (qword_10002D7A8 != -1) {
    dispatch_once(&qword_10002D7A8, &stru_1000212A8);
  }
  v0 = (void *)qword_10002D7B0;

  return v0;
}

void sub_100006DDC(id a1)
{
  qword_10002D7B0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "disableLocationDisplay");

  _objc_release_x1();
}

id sub_100006E20()
{
  if (qword_10002D7B8 != -1) {
    dispatch_once(&qword_10002D7B8, &stru_1000212C8);
  }
  v0 = (void *)qword_10002D7C0;

  return v0;
}

void sub_100006E74(id a1)
{
  qword_10002D7C0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "accountRatchet");

  _objc_release_x1();
}

id sub_100006EB8()
{
  if (qword_10002D7C8 != -1) {
    dispatch_once(&qword_10002D7C8, &stru_1000212E8);
  }
  v0 = (void *)qword_10002D7D0;

  return v0;
}

void sub_100006F0C(id a1)
{
  qword_10002D7D0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "ownerAuthentication");

  _objc_release_x1();
}

id sub_100006F50()
{
  if (qword_10002D7D8 != -1) {
    dispatch_once(&qword_10002D7D8, &stru_100021308);
  }
  v0 = (void *)qword_10002D7E0;

  return v0;
}

void sub_100006FA4(id a1)
{
  if (+[FMPreferencesUtil BOOLForKey:@"ShowAutomationLogs" inDomain:@"com.apple.icloud.findmydeviced.notbackedup"])
  {
    qword_10002D7E0 = (uint64_t)os_log_create("com.apple.icloud.findmydeviced", "automation");
    _objc_release_x1();
  }
}

void sub_10000713C(id a1)
{
  id v1 = sub_100006960();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Session started by client. [warmup complete]", v2, 2u);
  }
}

void sub_100007440(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000748C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000749C(uint64_t a1)
{
}

void sub_1000074A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = [*(id *)(a1 + 32) audioRoutingIdentifier];
  id v4 = [WeakRetained deviceWithAddress:v3];

  if (v4)
  {
    [WeakRetained accessoryManager];
    int ControlCommand = BTAccessoryManagerGetControlCommand();
    uint64_t v6 = sub_100006960();
    id v7 = v6;
    if (ControlCommand)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_100012410(a1 + 32);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) audioRoutingIdentifier];
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v11 = 138412546;
      uint64_t v12 = v8;
      __int16 v13 = 1024;
      int v14 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Got listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v11, 0x12u);
    }
  }
  else
  {
    id v7 = sub_100006960();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100012384(a1 + 32, v7);
    }
  }

  id v10 = *(NSObject **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v10) {
    dispatch_semaphore_signal(v10);
  }
}

void sub_1000077B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000077D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [*(id *)(a1 + 32) audioRoutingIdentifier];
  id v4 = [WeakRetained deviceWithAddress:v3];

  if (v4)
  {
    [WeakRetained accessoryManager];
    int v5 = BTAccessoryManagerSendControlCommand();
    uint64_t v6 = sub_100006960();
    id v7 = v6;
    if (v5)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_10001252C(a1 + 32);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) audioRoutingIdentifier];
      int v9 = *(_DWORD *)(a1 + 48);
      int v10 = 138412546;
      int v11 = v8;
      __int16 v12 = 1024;
      int v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Set listening mode for accessory address: %@ | mode: %u", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    id v7 = sub_100006960();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1000124A0(a1 + 32, v7);
    }
  }
}

void sub_100007A40(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_100007A54(id *a1)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained attachToSession];
  uint64_t v3 = [WeakRetained futureSession];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100007BFC;
  v11[3] = &unk_1000213A8;
  id v12 = a1[4];
  id v13 = a1[5];
  id v4 = [v3 addSuccessBlock:v11];

  objc_initWeak(&location, WeakRetained);
  int v5 = [WeakRetained futureSession];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100007C80;
  v7[3] = &unk_1000213D0;
  id v8 = a1[4];
  objc_copyWeak(&v9, &location);
  id v6 = [v5 addFailureBlock:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void sub_100007BD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_100007BFC(uint64_t a1)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id v2 = sub_100006960();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Session is active. Executing client request block.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100007C80(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v5 = sub_100006960();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1000125BC();
  }

  [WeakRetained detachFromSession];
}

void sub_100008130(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v5 = sub_100006960();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Callback for BTServiceEvent %u", (uint8_t *)v6, 8u);
  }
}

void sub_100008E0C(uint64_t a1, int a2, int a3, void *a4)
{
  id v7 = a4;
  id v8 = [v7 bluetoothSessionQueue];
  dispatch_assert_queue_V2(v8);

  id v9 = sub_100006960();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v18 = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Callback for BTSessionEvent %u", buf, 8u);
  }

  int v10 = [v7 serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008F64;
  block[3] = &unk_100021460;
  id v13 = v7;
  uint64_t v14 = a1;
  int v15 = a2;
  int v16 = a3;
  id v11 = v7;
  dispatch_sync(v10, block);
}

id *sub_100008F64(id *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v4 = *((_DWORD *)result + 12);
  if (v4 - 2 < 2) {
    return (id *)[result[4] sessionTerminated:result[5] a4];
  }
  if (v4 == 1) {
    return (id *)[result[4] sessionDetached:result[5] a4];
  }
  if (!v4) {
    return (id *)[result[4] sessionAttached:result[5] result:*((unsigned int *)result + 13)];
  }
  return result;
}

void sub_100008FAC(uint64_t a1, int a2)
{
  id v3 = sub_100006960();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Callback for BTAccessoryEvent %u", (uint8_t *)v4, 8u);
  }
}

void sub_100009050(uint64_t a1, int a2)
{
  id v3 = sub_100006960();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Callback for BTLocalDeviceStatusEvent %u", (uint8_t *)v4, 8u);
  }
}

void sub_10000910C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_10000912C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100009148(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009184(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t sub_1000091A4(uint64_t a1)
{
  return *(void *)a1;
}

void sub_100009284(id a1)
{
  id v2 = +[FMSystemInfo sharedInstance];
  unsigned int v1 = [v2 isInternalBuild];
  if (v1) {
    LOBYTE(v1) = +[FMPreferencesUtil BOOLForKey:@"FMDAutomationBluetoothManagerAutomationActiveKey" inDomain:kFMDNotBackedUpPrefDomain];
  }
  byte_10002D7E8 = v1;
}

id sub_100009438(uint64_t a1)
{
  return +[BluetoothManager setSharedInstanceQueue:*(void *)(a1 + 32)];
}

void sub_10000944C(id a1)
{
  unsigned int v1 = +[FMDAutomationHelperFactory sharedFactory];
  id v2 = (objc_class *)[v1 automationHelperClassWithName:@"FMDAutomationBluetoothManager"];

  qword_10002D800 = (uint64_t)objc_alloc_init(v2);

  _objc_release_x1();
}

uint64_t sub_10000A2B8(uint64_t a1)
{
  [*(id *)(a1 + 32) setIsSoundPlaying:0];
  [*(id *)(a1 + 32) setVolumeTargetValue:0.0];
  [*(id *)(a1 + 32) rampDownDuration];
  [*(id *)(a1 + 32) setFadeDuration:];
  [*(id *)(a1 + 32) rampDownDuration];
  id v2 = *(void **)(a1 + 32);
  if (v3 <= 0.0) {
    [v2 stopSound];
  }
  else {
    [v2 fade];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_10000BAA4(uint64_t a1)
{
  id v2 = sub_100006668();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001301C(v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained fade];
}

uint64_t sub_10000C224(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = sub_100006668();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_retainBlock(*(id *)(v1 + 32));
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v4, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

uint64_t sub_10000C648(uint64_t result)
{
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = sub_100006668();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = objc_retainBlock(*(id *)(v1 + 32));
      int v4 = 138412290;
      id v5 = v3;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "FMDAccessoryAudioController Calling initial completion block %@", (uint8_t *)&v4, 0xCu);
    }
    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

double sub_10000CCEC(float a1)
{
  return a1;
}

void sub_10000CD08(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000ECC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000F098(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 120));
  _Unwind_Resume(a1);
}

void sub_10000F0FC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = [WeakRetained bluetoothDiscoveryQueue];
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_10000F1BC;
    v6[3] = &unk_1000215F8;
    id v7 = v3;
    id v8 = WeakRetained;
    dispatch_async(v5, v6);
  }
}

id sub_10000F1BC(uint64_t a1)
{
  id v2 = sub_1000069F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BluetoothManager didDiscoverDevice %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) didDiscoverDevice:*(void *)(a1 + 32)];
}

void sub_10000F26C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [WeakRetained bluetoothDiscoveryQueue];
  if (v5)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    _DWORD v6[2] = sub_10000F32C;
    v6[3] = &unk_1000215F8;
    id v7 = v3;
    id v8 = WeakRetained;
    dispatch_async(v5, v6);
  }
}

id sub_10000F32C(uint64_t a1)
{
  id v2 = sub_1000069F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BluetoothManager didLoseDevice %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 40) didLoseDevice:*(void *)(a1 + 32)];
}

void sub_10000F3DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained bluetoothDiscoveryQueue];
  uint64_t v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F478;
    block[3] = &unk_1000214A8;
    void block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

id sub_10000F478(uint64_t a1)
{
  id v2 = sub_1000069F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BluetoothManager discovery ended - setting all channels inactive.", v4, 2u);
  }

  return [*(id *)(a1 + 32) setAllAudioChannelsActive:0];
}

void sub_10000F4F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained bluetoothDiscoveryQueue];
  uint64_t v3 = v2;
  if (v2)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000F58C;
    block[3] = &unk_1000214A8;
    void block[4] = WeakRetained;
    dispatch_async(v2, block);
  }
}

id sub_10000F58C(uint64_t a1)
{
  id v2 = sub_1000069F8();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "BluetoothManager discovery started - setting all channels active.", v4, 2u);
  }

  return [*(id *)(a1 + 32) setAllAudioChannelsActive:1];
}

void sub_10001001C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_100010058(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained didDiscoverDevice];
  int v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void sub_1000100D4(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained didLoseDevice];
  int v5 = (void *)v4;
  if (v4) {
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v6);
  }
}

void sub_100010150(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained didEndDiscoveryWithError:v3];
}

void sub_1000103D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_1000103EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained activeTokens];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 32)];

  uint64_t v4 = [WeakRetained activeTokens];
  [v4 removeObject:*(void *)(a1 + 32)];

  if (v3)
  {
    int v5 = [*(id *)(a1 + 32) tokenDiscoveryEnded];

    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) tokenDiscoveryEnded];
      v6[2]();
    }
  }
  [WeakRetained updateDisccovery];
}

void sub_100010618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100010634(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained activeTokens];
  [v2 fm_safeAddObject:*(void *)(a1 + 32)];

  [WeakRetained updateDisccovery];
}

void sub_1000107F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void sub_100010818(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained activeTokens];
  id v2 = [v1 copy];

  [v2 enumerateObjectsUsingBlock:&stru_100021730];
  unsigned int v3 = [WeakRetained activeTokens];
  [v3 removeAllObjects];
}

void sub_1000108A0(id a1, FMDBluetoothDiscoveryToken *a2, unint64_t a3, BOOL *a4)
{
  id v6 = a2;
  uint64_t v4 = [(FMDBluetoothDiscoveryToken *)v6 tokenDiscoveryEnded];

  if (v4)
  {
    int v5 = [(FMDBluetoothDiscoveryToken *)v6 tokenDiscoveryEnded];
    v5[2]();
  }
}

void sub_100010A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

void sub_100010A8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained scanningTimerFired];
}

void sub_100010BAC(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100010BC0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained activeTokens];
  id v3 = [v2 count];

  if (v3)
  {
    uint64_t v4 = sub_100006668();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = [WeakRetained activeTokens];
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "FMDBluetoothDiscovery unterminated tokens %@.", (uint8_t *)&v6, 0xCu);
    }
  }
  [WeakRetained updateDisccovery];
}

int64_t sub_100011038(id a1, FMDBluetoothDiscoveryToken *a2, FMDBluetoothDiscoveryToken *a3)
{
  uint64_t v4 = a3;
  int v5 = [(FMDBluetoothDiscoveryToken *)a2 endDate];
  int v6 = [(FMDBluetoothDiscoveryToken *)v4 endDate];

  id v7 = [v5 compare:v6];
  return (int64_t)v7;
}

void sub_100011884(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000118AC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained completion];
  id v2 = (void *)v1;
  if (v1) {
    (*(void (**)(uint64_t))(v1 + 16))(v1);
  }
}

void sub_100011B68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011B88(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    uint64_t v4 = sub_100006668();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000136C0((uint64_t)a2, v4);
    }

    uint64_t v5 = kFMDErrorDomain;
    NSErrorUserInfoKey v8 = NSUnderlyingErrorKey;
    int v6 = +[NSError errorWithDomain:@"NSXPCError" code:a2 userInfo:0];
    uint64_t v9 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v9 forKeys:&v8 count:1];
    a2 = +[NSError errorWithDomain:v5 code:13 userInfo:v7];
  }
  [WeakRetained setConnection:0];
  [WeakRetained _didEndDiscoveryWithError:a2];
}

void sub_1000120B4()
{
  sub_100004C50();
  sub_100004C34((void *)&_mh_execute_header, v0, v1, "XPC error for startPlayingSoundForAccessory:duration:rampUpDuration:channels:completion: %li", v2, v3, v4, v5, v6);
}

void sub_10001211C()
{
  sub_100004C50();
  sub_100004C34((void *)&_mh_execute_header, v0, v1, "playSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
}

void sub_100012184()
{
  sub_100004C50();
  sub_100004C34((void *)&_mh_execute_header, v0, v1, "XPC error for stopPlayingSoundForAccessory:rampDownDuration:completion %li", v2, v3, v4, v5, v6);
}

void sub_1000121EC()
{
  sub_100004C50();
  sub_100004C34((void *)&_mh_execute_header, v0, v1, "stopSoundForAccessory encountered an error : %@", v2, v3, v4, v5, v6);
}

void sub_100012254()
{
  sub_100004C50();
  sub_100004C34((void *)&_mh_execute_header, v0, v1, "stop sound with error %@", v2, v3, v4, v5, v6);
}

void sub_1000122BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not find class %@ in the automation bundle", (uint8_t *)&v2, 0xCu);
}

void sub_100012334(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  sub_100009148((void *)&_mh_execute_header, a3, (uint64_t)a3, "Timeout getting listening mode for accessory address: %@", (uint8_t *)a2);
}

void sub_100012384(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_1000091A4(a1) audioRoutingIdentifier];
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, a2, v4, "Failed to get btdevice for listening mode using accessory address: %@", v5);
}

void sub_100012410(uint64_t a1)
{
  uint64_t v1 = [(id)sub_1000091A4(a1) audioRoutingIdentifier];
  sub_100009160();
  sub_100009184((void *)&_mh_execute_header, v2, v3, "Failed to get listening mode for accessory address: %@ | result: %d", v4, v5, v6, v7, v8);
}

void sub_1000124A0(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = [(id)sub_1000091A4(a1) audioRoutingIdentifier];
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, a2, v4, "Failed to update btdevice listening mode on accessory address: %@", v5);
}

void sub_10001252C(uint64_t a1)
{
  uint64_t v1 = [(id)sub_1000091A4(a1) audioRoutingIdentifier];
  sub_100009160();
  sub_100009184((void *)&_mh_execute_header, v2, v3, "Failed to set listening mode for accessory address: %@ | result: %d", v4, v5, v6, v7, v8);
}

void sub_1000125BC()
{
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, v0, v1, "Error in bluetooth session interface, detaching. Pending actions have been discarded. %@", v2);
}

void sub_100012628()
{
  sub_100009178();
  sub_10000912C((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from nil / empty address string.", v2, v3, v4, v5, v6);
}

void sub_10001265C()
{
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, v0, v1, "Cannot get BTDevice: No session. Address: %@", v2);
}

void sub_1000126C8()
{
  sub_1000090F4();
  sub_10000910C((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice from BTDeviceAddress %@ %d");
}

void sub_100012730()
{
  sub_1000090F4();
  sub_10000910C((void *)&_mh_execute_header, v0, v1, "Failed getting BTDevice address from address string %@ %d");
}

void sub_100012798(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session failed to attach: %u", (uint8_t *)v2, 8u);
}

void sub_100012810()
{
  sub_100009178();
  sub_10000912C((void *)&_mh_execute_header, v0, v1, "Detached session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_100012844()
{
  sub_100009178();
  sub_10000912C((void *)&_mh_execute_header, v0, v1, "Terminated session is not the active session. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_100012878(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed attaching to session %d", (uint8_t *)v2, 8u);
}

void sub_1000128F0()
{
  sub_100009178();
  sub_10000912C((void *)&_mh_execute_header, v0, v1, "Failed to set up accessory manager. Missing session.", v2, v3, v4, v5, v6);
}

void sub_100012924()
{
  sub_1000090F4();
  sub_10000910C((void *)&_mh_execute_header, v0, v1, "Failed getting default accessory manager from session: %p, result: %d", v2, v3);
}

void sub_10001298C()
{
  sub_100009178();
  sub_10000912C((void *)&_mh_execute_header, v0, v1, "Failed to set up local device. Missing session.", v2, v3, v4, v5, v6);
}

void sub_1000129C0()
{
  sub_1000090F4();
  sub_10000910C((void *)&_mh_execute_header, v0, v1, "Failed getting default local device from session %p. Result: %d.", v2, v3);
}

void sub_100012A28(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#PARSING invalid or no pattern in maskInfo %@", (uint8_t *)&v2, 0xCu);
}

void sub_100012AA0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "#PARSING invalid or no mask in maskInfo %@", (uint8_t *)&v2, 0xCu);
}

void sub_100012B18()
{
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot pick route to accessory. Aborting, %@", v2);
}

void sub_100012B84()
{
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, v0, v1, "FMDAccessoryAudioController cannot route audio to accessory %@", v2);
}

void sub_100012BF0(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 routeID];
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to set maximum volume, please file a bug to Core Audio %@", v5);
}

void sub_100012C7C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 routeID];
  sub_100004C50();
  sub_100009148((void *)&_mh_execute_header, a2, v4, "AccessoryAudioController unable to get original volume %@", v5);
}

void sub_100012D08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Creating fade timer", v1, 2u);
}

void sub_100012D4C(void *a1)
{
  int v2 = [a1 audioPlayer];
  [v2 pan];
  [a1 panTargetValue];
  sub_10000CCEC(v3);
  sub_10000CD08((void *)&_mh_execute_header, v4, v5, "Panning to %f targetValue: %f", v6, v7, v8, v9, v10);
}

void sub_100012DF4(void *a1)
{
  int v2 = [a1 audioPlayer];
  [v2 pan];
  [a1 panTargetValue];
  sub_10000CCEC(v3);
  sub_10000CD08((void *)&_mh_execute_header, v4, v5, "Stopping pan at %f target: %f", v6, v7, v8, v9, v10);
}

void sub_100012E9C(void *a1, NSObject *a2, double a3)
{
  uint64_t v6 = [a1 audioPlayer];
  [v6 volume];
  double v8 = v7;
  [a1 volumeTargetValue];
  int v10 = 134218496;
  double v11 = v8;
  __int16 v12 = 2048;
  double v13 = v9;
  __int16 v14 = 2048;
  double v15 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Fading to %f targetValue: %f interval: %f", (uint8_t *)&v10, 0x20u);
}

void sub_100012F74(void *a1)
{
  int v2 = [a1 audioPlayer];
  [v2 volume];
  [a1 volumeTargetValue];
  sub_10000CCEC(v3);
  sub_10000CD08((void *)&_mh_execute_header, v4, v5, "Stopping fade at %f target: %f", v6, v7, v8, v9, v10);
}

void sub_10001301C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Fade timer fired", v1, 2u);
}

void sub_100013060(uint64_t a1, NSObject *a2)
{
  v2[0] = 67109378;
  v2[1] = 0;
  __int16 v3 = 2112;
  uint64_t v4 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDAccessoryAudioController unable to restore unknown listening mode %u for accessory %@", (uint8_t *)v2, 0x12u);
}

void sub_1000130E4(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "invalid host received %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001315C()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_1000131D0()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_100013244()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_1000132B8()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s parsing failed %@", v2, v3, v4, v5, 2u);
}

void sub_10001332C()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_1000133A0()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_100013414(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 discoveryFactory];
  uint64_t v6 = [v5 accessoryId];
  int v7 = 138412546;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint8_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "got stop command for discover for different accessory %@ != %@", (uint8_t *)&v7, 0x16u);
}

void sub_1000134D8()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_10001354C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "soundFile %@.wav does not exist", (uint8_t *)&v2, 0xCu);
}

void sub_1000135C4()
{
  sub_10000ECAC();
  sub_10000ECC0((void *)&_mh_execute_header, v0, v1, "%s failed with error %@", v2, v3, v4, v5, 2u);
}

void sub_100013638(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FMDBluetoothDiscovery Scanning timer fired.", v1, 2u);
}

void sub_10001367C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "FMDBluetoothDiscoveryCoordinator discovery terminating - no active tokens", v1, 2u);
}

void sub_1000136C0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDBluetoothDiscoveryXPCProxy service terminated with error : %li", (uint8_t *)&v2, 0xCu);
}

void sub_100013738(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "FMDBluetoothDiscoveryXPCProxy didEndDiscoveryWithError : %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return _BTAccessoryManagerAddCallbacks();
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return _BTAccessoryManagerGetControlCommand();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return _BTAccessoryManagerGetDefault();
}

uint64_t BTAccessoryManagerGetDeviceColor()
{
  return _BTAccessoryManagerGetDeviceColor();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return _BTAccessoryManagerRemoveCallbacks();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return _BTAccessoryManagerSendControlCommand();
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return _BTLocalDeviceRemoveCallbacks();
}

uint64_t BTServiceAddCallbacks()
{
  return _BTServiceAddCallbacks();
}

uint64_t BTServiceRemoveCallbacks()
{
  return _BTServiceRemoveCallbacks();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

unint64_t strtouq(const char *__str, char **__endptr, int __base)
{
  return _strtouq(__str, __endptr, __base);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__audioCategory(void *a1, const char *a2, ...)
{
  return [a1 _audioCategory];
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend_accessoryAudioController(void *a1, const char *a2, ...)
{
  return [a1 accessoryAudioController];
}

id objc_msgSend_accessoryId(void *a1, const char *a2, ...)
{
  return [a1 accessoryId];
}

id objc_msgSend_accessoryIdentifier(void *a1, const char *a2, ...)
{
  return [a1 accessoryIdentifier];
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return [a1 accessoryInfo];
}

id objc_msgSend_accessoryManager(void *a1, const char *a2, ...)
{
  return [a1 accessoryManager];
}

id objc_msgSend_activeTokens(void *a1, const char *a2, ...)
{
  return [a1 activeTokens];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_advertisementFields(void *a1, const char *a2, ...)
{
  return [a1 advertisementFields];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_attachToSession(void *a1, const char *a2, ...)
{
  return [a1 attachToSession];
}

id objc_msgSend_audioPlayer(void *a1, const char *a2, ...)
{
  return [a1 audioPlayer];
}

id objc_msgSend_audioRoutingIdentifier(void *a1, const char *a2, ...)
{
  return [a1 audioRoutingIdentifier];
}

id objc_msgSend_audioURL(void *a1, const char *a2, ...)
{
  return [a1 audioURL];
}

id objc_msgSend_automationHelperBundle(void *a1, const char *a2, ...)
{
  return [a1 automationHelperBundle];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return [a1 bluetoothAddress];
}

id objc_msgSend_bluetoothDiscoveryQueue(void *a1, const char *a2, ...)
{
  return [a1 bluetoothDiscoveryQueue];
}

id objc_msgSend_bluetoothManagerDelegateQueue(void *a1, const char *a2, ...)
{
  return [a1 bluetoothManagerDelegateQueue];
}

id objc_msgSend_bluetoothSessionInterface(void *a1, const char *a2, ...)
{
  return [a1 bluetoothSessionInterface];
}

id objc_msgSend_bluetoothSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 bluetoothSessionQueue];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_btDiscoveryConfiguration(void *a1, const char *a2, ...)
{
  return [a1 btDiscoveryConfiguration];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_completion(void *a1, const char *a2, ...)
{
  return [a1 completion];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return [a1 connection];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentAccessory(void *a1, const char *a2, ...)
{
  return [a1 currentAccessory];
}

id objc_msgSend_currentInstance(void *a1, const char *a2, ...)
{
  return [a1 currentInstance];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_currentThread(void *a1, const char *a2, ...)
{
  return [a1 currentThread];
}

id objc_msgSend_currentlyPicked(void *a1, const char *a2, ...)
{
  return [a1 currentlyPicked];
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

id objc_msgSend_detachFromSession(void *a1, const char *a2, ...)
{
  return [a1 detachFromSession];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_didDiscoverDevice(void *a1, const char *a2, ...)
{
  return [a1 didDiscoverDevice];
}

id objc_msgSend_didEndDiscovery(void *a1, const char *a2, ...)
{
  return [a1 didEndDiscovery];
}

id objc_msgSend_didLoseDevice(void *a1, const char *a2, ...)
{
  return [a1 didLoseDevice];
}

id objc_msgSend_didStartDiscovery(void *a1, const char *a2, ...)
{
  return [a1 didStartDiscovery];
}

id objc_msgSend_discovery(void *a1, const char *a2, ...)
{
  return [a1 discovery];
}

id objc_msgSend_discoveryCoordinator(void *a1, const char *a2, ...)
{
  return [a1 discoveryCoordinator];
}

id objc_msgSend_discoveryEndDate(void *a1, const char *a2, ...)
{
  return [a1 discoveryEndDate];
}

id objc_msgSend_discoveryFactory(void *a1, const char *a2, ...)
{
  return [a1 discoveryFactory];
}

id objc_msgSend_discoveryTimer(void *a1, const char *a2, ...)
{
  return [a1 discoveryTimer];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return [a1 endDate];
}

id objc_msgSend_fade(void *a1, const char *a2, ...)
{
  return [a1 fade];
}

id objc_msgSend_fadeDuration(void *a1, const char *a2, ...)
{
  return [a1 fadeDuration];
}

id objc_msgSend_finishWithNoResult(void *a1, const char *a2, ...)
{
  return [a1 finishWithNoResult];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_futureSession(void *a1, const char *a2, ...)
{
  return [a1 futureSession];
}

id objc_msgSend_getAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 getAccessoryManager];
}

id objc_msgSend_hasAttemptedLoad(void *a1, const char *a2, ...)
{
  return [a1 hasAttemptedLoad];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_helperConfiguration(void *a1, const char *a2, ...)
{
  return [a1 helperConfiguration];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_inEarDetectEnabled(void *a1, const char *a2, ...)
{
  return [a1 inEarDetectEnabled];
}

id objc_msgSend_initializeNotifications(void *a1, const char *a2, ...)
{
  return [a1 initializeNotifications];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidateStopSoundTimer(void *a1, const char *a2, ...)
{
  return [a1 invalidateStopSoundTimer];
}

id objc_msgSend_isAutomationActive(void *a1, const char *a2, ...)
{
  return [a1 isAutomationActive];
}

id objc_msgSend_isDiscoveryActive(void *a1, const char *a2, ...)
{
  return [a1 isDiscoveryActive];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isSoundPlaying(void *a1, const char *a2, ...)
{
  return [a1 isSoundPlaying];
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return [a1 isTemporaryPaired];
}

id objc_msgSend_lastAccessory(void *a1, const char *a2, ...)
{
  return [a1 lastAccessory];
}

id objc_msgSend_leewayTimeInterval(void *a1, const char *a2, ...)
{
  return [a1 leewayTimeInterval];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return [a1 listeningMode];
}

id objc_msgSend_localDevice(void *a1, const char *a2, ...)
{
  return [a1 localDevice];
}

id objc_msgSend_lowercaseString(void *a1, const char *a2, ...)
{
  return [a1 lowercaseString];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_monitoredAccessories(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccessories];
}

id objc_msgSend_monitoredAccessoriesCompletionBlocks(void *a1, const char *a2, ...)
{
  return [a1 monitoredAccessoriesCompletionBlocks];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_newDiscovery(void *a1, const char *a2, ...)
{
  return [a1 newDiscovery];
}

id objc_msgSend_originalRoute(void *a1, const char *a2, ...)
{
  return [a1 originalRoute];
}

id objc_msgSend_originalState(void *a1, const char *a2, ...)
{
  return [a1 originalState];
}

id objc_msgSend_pairedAppleAccessories(void *a1, const char *a2, ...)
{
  return [a1 pairedAppleAccessories];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pan(void *a1, const char *a2, ...)
{
  return [a1 pan];
}

id objc_msgSend_panTargetValue(void *a1, const char *a2, ...)
{
  return [a1 panTargetValue];
}

id objc_msgSend_pickedRoute(void *a1, const char *a2, ...)
{
  return [a1 pickedRoute];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_prepareToPlay(void *a1, const char *a2, ...)
{
  return [a1 prepareToPlay];
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return [a1 productId];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_rampDownDuration(void *a1, const char *a2, ...)
{
  return [a1 rampDownDuration];
}

id objc_msgSend_rampUpDuration(void *a1, const char *a2, ...)
{
  return [a1 rampUpDuration];
}

id objc_msgSend_rawRouteInfo(void *a1, const char *a2, ...)
{
  return [a1 rawRouteInfo];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_routeController(void *a1, const char *a2, ...)
{
  return [a1 routeController];
}

id objc_msgSend_routeID(void *a1, const char *a2, ...)
{
  return [a1 routeID];
}

id objc_msgSend_routeSubType(void *a1, const char *a2, ...)
{
  return [a1 routeSubType];
}

id objc_msgSend_routeType(void *a1, const char *a2, ...)
{
  return [a1 routeType];
}

id objc_msgSend_rssi(void *a1, const char *a2, ...)
{
  return [a1 rssi];
}

id objc_msgSend_scanningTimerFired(void *a1, const char *a2, ...)
{
  return [a1 scanningTimerFired];
}

id objc_msgSend_serialQueue(void *a1, const char *a2, ...)
{
  return [a1 serialQueue];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_setUpAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 setUpAccessoryManager];
}

id objc_msgSend_setUpLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 setUpLocalDevice];
}

id objc_msgSend_setupAudioSession(void *a1, const char *a2, ...)
{
  return [a1 setupAudioSession];
}

id objc_msgSend_setupDiscovery(void *a1, const char *a2, ...)
{
  return [a1 setupDiscovery];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedCache(void *a1, const char *a2, ...)
{
  return [a1 sharedCache];
}

id objc_msgSend_sharedFactory(void *a1, const char *a2, ...)
{
  return [a1 sharedFactory];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundController(void *a1, const char *a2, ...)
{
  return [a1 soundController];
}

id objc_msgSend_soundDidStop(void *a1, const char *a2, ...)
{
  return [a1 soundDidStop];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDiscovery(void *a1, const char *a2, ...)
{
  return [a1 startDiscovery];
}

id objc_msgSend_startSession(void *a1, const char *a2, ...)
{
  return [a1 startSession];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopDiscovery(void *a1, const char *a2, ...)
{
  return [a1 stopDiscovery];
}

id objc_msgSend_stopSound(void *a1, const char *a2, ...)
{
  return [a1 stopSound];
}

id objc_msgSend_stopSoundTimer(void *a1, const char *a2, ...)
{
  return [a1 stopSoundTimer];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_supportsChangingListeningMode(void *a1, const char *a2, ...)
{
  return [a1 supportsChangingListeningMode];
}

id objc_msgSend_tearDownAccessoryManager(void *a1, const char *a2, ...)
{
  return [a1 tearDownAccessoryManager];
}

id objc_msgSend_tearDownLocalDevice(void *a1, const char *a2, ...)
{
  return [a1 tearDownLocalDevice];
}

id objc_msgSend_timeIntervalSinceNow(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceNow];
}

id objc_msgSend_timeout(void *a1, const char *a2, ...)
{
  return [a1 timeout];
}

id objc_msgSend_timerSource(void *a1, const char *a2, ...)
{
  return [a1 timerSource];
}

id objc_msgSend_tokenDiscoveryEnded(void *a1, const char *a2, ...)
{
  return [a1 tokenDiscoveryEnded];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateDisccovery(void *a1, const char *a2, ...)
{
  return [a1 updateDisccovery];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_vendorId(void *a1, const char *a2, ...)
{
  return [a1 vendorId];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_volumeTargetValue(void *a1, const char *a2, ...)
{
  return [a1 volumeTargetValue];
}

id objc_msgSend_wasSoundPlayed(void *a1, const char *a2, ...)
{
  return [a1 wasSoundPlayed];
}