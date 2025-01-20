void sub_1000036D0(id a1)
{
  operator new();
}

uint64_t sub_10000372C(uint64_t a1, int a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  *(unsigned char *)a1 = 0;
  *(void *)(a1 + 16) = 0;
  *(double *)(a1 + 24) = a4;
  *(void *)(a1 + 40) = 0;
  *(double *)(a1 + 72) = a3;
  *(unsigned char *)(a1 + 80) = 0;
  double v11 = fmax(a6, 1.0);
  double v12 = fmin(a8, v11);
  double v13 = 0.0;
  if (v12 != 0.0) {
    double v13 = a3 / (1000.0 / v12);
  }
  *(double *)(a1 + 64) = v13;
  if (a2) {
    int v14 = a2;
  }
  else {
    int v14 = -1;
  }
  *(_DWORD *)(a1 + 52) = v14;
  *(_DWORD *)(a1 + 56) = (int)(a3 / (1000.0 / v11));
  if (a7 == 0.0) {
    int v15 = 0;
  }
  else {
    int v15 = (int)(a3 / (1000.0 / a7));
  }
  *(_DWORD *)(a1 + 60) = v15;
  double v16 = fmax(a9, 0.0);
  if (v16 == 0.0) {
    int v17 = 0;
  }
  else {
    int v17 = (int)(a3 / (-1000.0 / v16));
  }
  *(_DWORD *)(a1 + 48) = v17;
  float v18 = a5 * 0.05;
  float v19 = __exp10f(v18);
  double v20 = v19;
  if (v19 > 1.0)
  {
    if (qword_1000260B8 != -1) {
      dispatch_once(&qword_1000260B8, &stru_1000204C8);
    }
    v21 = *(id *)qword_1000260C0;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      int v23 = 136315650;
      v24 = "PulseTone.mm";
      __int16 v25 = 1024;
      int v26 = 142;
      __int16 v27 = 2048;
      double v28 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%25s:%-5d Playing tone above amplitude of 1.0. { amplitude=%f }", (uint8_t *)&v23, 0x1Cu);
    }
  }
  *(double *)(a1 + 32) = v20;
  *(double *)(a1 + 8) = (*(double *)(a1 + 64) + (double)*(int *)(a1 + 56)) / a3;
  return a1;
}

void sub_100003920(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100003934(void *a1)
{
}

uint64_t start()
{
  v0 = objc_opt_new();
  uint64_t v1 = +[NSXPCListener serviceListener];
  [v1 setDelegate:v0];
  [v1 resume];

  return 0;
}

void sub_10000482C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t *sub_100004960(uint64_t *result, uint64_t a2)
{
  uint64_t v2 = *result;
  *result = a2;
  if (v2)
  {

    operator delete();
  }
  return result;
}

void sub_100004B78(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004E28(_Unwind_Exception *a1)
{
  v3 = v1;

  _Unwind_Resume(a1);
}

void sub_100004E50(id a1)
{
}

void sub_10000520C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000057A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  _Unwind_Resume(a1);
}

void sub_1000058D0(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
  id v6 = [v5 unsignedIntegerValue];

  v7 = [*(id *)(a1 + 32) stringForRouteChangeReason:v6];
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  v8 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v3 userInfo];
    int v11 = 136315906;
    double v12 = "AVAudioDeviceTestService.mm";
    __int16 v13 = 1024;
    int v14 = 1731;
    __int16 v15 = 2112;
    double v16 = v7;
    __int16 v17 = 2112;
    float v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@) - %@", (uint8_t *)&v11, 0x26u);
  }
  v10 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-2 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100005A90(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005AE8(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  v5 = [v4 objectForKeyedSubscript:AVAudioSessionInterruptionTypeKey];

  if (v5)
  {
    id v6 = [v5 unsignedIntegerValue];
    v7 = [v3 userInfo];
    v8 = [v7 objectForKeyedSubscript:AVAudioSessionInterruptionReasonKey];
    id v9 = [v8 unsignedIntegerValue];

    v10 = [*(id *)(a1 + 32) stringForInterruptionReason:v9];
    if (v6)
    {
      if (v6 == (id)1)
      {
        if (qword_1000260C8 != -1) {
          dispatch_once(&qword_1000260C8, &stru_100020508);
        }
        int v11 = *(id *)qword_1000260D0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          double v12 = [v3 userInfo];
          int v18 = 136315906;
          float v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1765;
          __int16 v22 = 2114;
          id v23 = v10;
          __int16 v24 = 2114;
          __int16 v25 = v12;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption began (%{public}@) - %{public}@", (uint8_t *)&v18, 0x26u);
        }
        __int16 v13 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-16 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
      else
      {
        if (qword_1000260C8 != -1) {
          dispatch_once(&qword_1000260C8, &stru_100020508);
        }
        __int16 v17 = *(id *)qword_1000260D0;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          int v18 = 136315394;
          float v19 = "AVAudioDeviceTestService.mm";
          __int16 v20 = 1024;
          int v21 = 1784;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Unhandled interruption type", (uint8_t *)&v18, 0x12u);
        }
        __int16 v13 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-3 userInfo:0];
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (qword_1000260C8 != -1) {
        dispatch_once(&qword_1000260C8, &stru_100020508);
      }
      __int16 v15 = *(id *)qword_1000260D0;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        double v16 = [v3 userInfo];
        int v18 = 136315906;
        float v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1775;
        __int16 v22 = 2114;
        id v23 = v10;
        __int16 v24 = 2114;
        __int16 v25 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption ended (%{public}@) - %{public}@", (uint8_t *)&v18, 0x26u);
      }
      __int16 v13 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-17 userInfo:0];
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v14 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      int v18 = 136315650;
      float v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1749;
      __int16 v22 = 2112;
      id v23 = v3;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No AVAudioSessionInterruptionTypeKey. note: %@", (uint8_t *)&v18, 0x1Cu);
    }
    v10 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-3 userInfo:0];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100005FA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000604C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  v4 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 userInfo];
    id v6 = sub_1000063FC(-4);
    int v8 = 136315906;
    id v9 = "AVAudioDeviceTestService.mm";
    __int16 v10 = 1024;
    int v11 = 1799;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    id v15 = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd died (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);
  }
  v7 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-4 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000061DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100006224(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  v4 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [v3 userInfo];
    id v6 = sub_1000063FC(-5);
    int v8 = 136315906;
    id v9 = "AVAudioDeviceTestService.mm";
    __int16 v10 = 1024;
    int v11 = 1810;
    __int16 v12 = 2112;
    __int16 v13 = v5;
    __int16 v14 = 2048;
    id v15 = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd/audiomxd was reset (%@) with test error (%li)", (uint8_t *)&v8, 0x26u);
  }
  v7 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-5 userInfo:0];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_1000063B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_1000063FC(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315650;
    id v6 = "AVAudioDeviceTestService.mm";
    __int16 v7 = 1024;
    int v8 = 163;
    __int16 v9 = 2048;
    uint64_t v10 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%25s:%-5d error code %li", (uint8_t *)&v5, 0x1Cu);
  }
  id v3 = +[NSError errorWithDomain:NSCocoaErrorDomain code:a1 userInfo:0];

  return v3;
}

void sub_10000671C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p) {
    operator delete(__p);
  }
  _Unwind_Resume(exception_object);
}

void *sub_10000677C(void *a1, uint64_t a2, int *a3)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    uint64_t v6 = 4 * a2;
    __int16 v7 = operator new(4 * a2);
    *a1 = v7;
    a1[1] = v7;
    int v8 = &v7[a2];
    a1[2] = v8;
    int v9 = *a3;
    do
    {
      *v7++ = v9;
      v6 -= 4;
    }
    while (v6);
    a1[1] = v8;
  }
  return a1;
}

void sub_100006B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14)
{
  _Unwind_Resume(a1);
}

void sub_100006E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  uint64_t v10 = v9;

  a9.super_class = (Class)AVAudioDeviceTestService;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_10000721C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  _Unwind_Resume(a1);
}

id sub_100007310(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

void sub_1000073A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000787C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000083B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000885C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008A60(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008D98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100008DEC(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 userInfo];
  int v5 = [v4 objectForKey:AVSystemController_AudioVolumeNotificationParameter];

  [v5 floatValue];
  float v6 = *(float *)(a1 + 32);
  float v8 = vabds_f32(v7, v6);
  float v9 = fabsf(v7 + v6);
  float v10 = (float)(v9 * 0.00000011921) + (float)(v9 * 0.00000011921);
  if (v8 >= 1.1755e-38 && v8 > v10)
  {
    __int16 v12 = +[AVSystemController sharedAVSystemController];
    LODWORD(v13) = *(_DWORD *)(a1 + 32);
    [v12 setActiveCategoryVolumeTo:v13];

    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v14 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      [v5 floatValue];
      double v15 = *(float *)(a1 + 32);
      int v17 = 136315906;
      int v18 = "AVAudioDeviceTestService.mm";
      __int16 v19 = 1024;
      int v20 = 1445;
      __int16 v21 = 2048;
      double v22 = v16;
      __int16 v23 = 2048;
      double v24 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Volume not as expected, updating volume. { current=%f, expected=%f }", (uint8_t *)&v17, 0x26u);
    }
  }
}

void sub_100008FA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009148(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009158(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v19 = "AVAudioDeviceTestService.mm";
    __int16 v20 = 1024;
    int v21 = 1378;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Attempting to stop audio session for HearingTest.", buf, 0x12u);
  }
  id v3 = [*(id *)(a1 + 32) hearingTestSession];
  if (!v3) {
    goto LABEL_8;
  }
  v4 = [*(id *)(a1 + 32) hearingTestSession];
  if (v4)
  {
    int v5 = [*(id *)(a1 + 32) hearingTestSession];
    unsigned __int8 v6 = [v5 isActive];

    if ((v6 & 1) == 0)
    {
LABEL_8:
      if (qword_1000260C8 != -1) {
        dispatch_once(&qword_1000260C8, &stru_100020508);
      }
      float v7 = *(id *)qword_1000260D0;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        __int16 v19 = "AVAudioDeviceTestService.mm";
        __int16 v20 = 1024;
        int v21 = 1383;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Hearing test audio session is not active, cannot de-activate it.", buf, 0x12u);
      }
      float v8 = 0;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_26;
    }
  }
  else
  {
  }
  float v9 = [*(id *)(a1 + 32) hearingTestSession];
  id v17 = 0;
  [v9 setActive:0 error:&v17];
  id v10 = v17;

  if (v10)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v11 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      __int16 v12 = [v10 localizedDescription];
      *(_DWORD *)buf = 136315650;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1390;
      __int16 v22 = 2114;
      __int16 v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed de-activate audio session. { error=%{public}@ }", buf, 0x1Cu);
    }
    uint64_t v13 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-14 userInfo:0];

    float v8 = (void *)v13;
  }
  else
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v14 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      __int16 v19 = "AVAudioDeviceTestService.mm";
      __int16 v20 = 1024;
      int v21 = 1393;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d De-activated audio session.", buf, 0x12u);
    }
    float v8 = 0;
  }
  double v15 = *(void **)(a1 + 32);
  float v16 = [v15 userVolumeBeforeHearingTest];
  [v16 floatValue];
  objc_msgSend(v15, "resetVolume:");

  [*(id *)(a1 + 32) cleanUpObservers];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
}

void sub_100009544(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009688(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "AVAudioDeviceTestService.mm";
    __int16 v36 = 1024;
    int v37 = 1327;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  id v3 = +[AVAudioSession sharedInstance];
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  v4 = [*(id *)(a1 + 32) hearingTestSession];
  id v33 = 0;
  unsigned __int8 v5 = [v4 setCategory:AVAudioSessionCategoryPlayback error:&v33];
  id v6 = v33;

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v5;
  }
  if (v7)
  {
    float v8 = [*(id *)(a1 + 32) hearingTestSession];
    id v32 = 0;
    unsigned __int8 v9 = [v8 setMode:AVAudioSessionModeRaw error:&v32];
    id v10 = v32;

    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    if (v11)
    {
      __int16 v12 = [*(id *)(a1 + 32) hearingTestSession];
      id v31 = 0;
      unsigned __int8 v13 = [v12 setEligibleForBTSmartRoutingConsideration:0 error:&v31];
      id v14 = v31;

      if (v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if (v15)
      {
        float v16 = [*(id *)(a1 + 32) hearingTestSession];
        id v30 = 0;
        unsigned __int8 v17 = [v16 setActive:1 error:&v30];
        id v18 = v30;

        if (v18) {
          unsigned __int8 v19 = 0;
        }
        else {
          unsigned __int8 v19 = v17;
        }
        if (v19)
        {
          if (qword_1000260C8 != -1) {
            dispatch_once(&qword_1000260C8, &stru_100020508);
          }
          __int16 v20 = *(id *)qword_1000260D0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "AVAudioDeviceTestService.mm";
            __int16 v36 = 1024;
            int v37 = 1367;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
          }
          [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
          int v21 = 0;
        }
        else
        {
          if (qword_1000260C8 != -1) {
            dispatch_once(&qword_1000260C8, &stru_100020508);
          }
          double v28 = *(id *)qword_1000260D0;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = [v18 localizedDescription];
            *(_DWORD *)buf = 136315650;
            v35 = "AVAudioDeviceTestService.mm";
            __int16 v36 = 1024;
            int v37 = 1361;
            __int16 v38 = 2114;
            v39 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);
          }
          int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        if (qword_1000260C8 != -1) {
          dispatch_once(&qword_1000260C8, &stru_100020508);
        }
        int v26 = *(id *)qword_1000260D0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          __int16 v27 = [v14 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v35 = "AVAudioDeviceTestService.mm";
          __int16 v36 = 1024;
          int v37 = 1352;
          __int16 v38 = 2114;
          v39 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to disable smart routing. { error=%{public}@ }", buf, 0x1Cu);
        }
        int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (qword_1000260C8 != -1) {
        dispatch_once(&qword_1000260C8, &stru_100020508);
      }
      double v24 = *(id *)qword_1000260D0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v35 = "AVAudioDeviceTestService.mm";
        __int16 v36 = 1024;
        int v37 = 1343;
        __int16 v38 = 2114;
        v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);
      }
      int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v22 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v35 = "AVAudioDeviceTestService.mm";
      __int16 v36 = 1024;
      int v37 = 1335;
      __int16 v38 = 2114;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);
    }
    int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100009D64(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009E88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100009E98(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v35 = "AVAudioDeviceTestService.mm";
    __int16 v36 = 1024;
    int v37 = 1277;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setting up audio session with Playback category for HearingTest.", buf, 0x12u);
  }
  id v3 = +[AVAudioSession sharedInstance];
  [*(id *)(a1 + 32) setHearingTestSession:v3];

  v4 = [*(id *)(a1 + 32) hearingTestSession];
  id v33 = 0;
  unsigned __int8 v5 = [v4 setCategory:AVAudioSessionCategoryPlayback error:&v33];
  id v6 = v33;

  if (v6) {
    unsigned __int8 v7 = 0;
  }
  else {
    unsigned __int8 v7 = v5;
  }
  if (v7)
  {
    float v8 = [*(id *)(a1 + 32) hearingTestSession];
    id v32 = 0;
    unsigned __int8 v9 = [v8 setMode:AVAudioSessionModeRaw error:&v32];
    id v10 = v32;

    if (v10) {
      unsigned __int8 v11 = 0;
    }
    else {
      unsigned __int8 v11 = v9;
    }
    if (v11)
    {
      __int16 v12 = [*(id *)(a1 + 32) hearingTestSession];
      id v31 = 0;
      unsigned __int8 v13 = [v12 setEligibleForBTSmartRoutingConsideration:0 error:&v31];
      id v14 = v31;

      if (v14) {
        unsigned __int8 v15 = 0;
      }
      else {
        unsigned __int8 v15 = v13;
      }
      if (v15)
      {
        float v16 = [*(id *)(a1 + 32) hearingTestSession];
        id v30 = 0;
        unsigned __int8 v17 = [v16 setActive:1 error:&v30];
        id v18 = v30;

        if (v18) {
          unsigned __int8 v19 = 0;
        }
        else {
          unsigned __int8 v19 = v17;
        }
        if (v19)
        {
          if (qword_1000260C8 != -1) {
            dispatch_once(&qword_1000260C8, &stru_100020508);
          }
          __int16 v20 = *(id *)qword_1000260D0;
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315394;
            v35 = "AVAudioDeviceTestService.mm";
            __int16 v36 = 1024;
            int v37 = 1317;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Setup and activated audio session for HearingTest.", buf, 0x12u);
          }
          [*(id *)(a1 + 32) setupObservers:*(void *)(a1 + 40)];
          int v21 = 0;
        }
        else
        {
          if (qword_1000260C8 != -1) {
            dispatch_once(&qword_1000260C8, &stru_100020508);
          }
          double v28 = *(id *)qword_1000260D0;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v29 = [v18 localizedDescription];
            *(_DWORD *)buf = 136315650;
            v35 = "AVAudioDeviceTestService.mm";
            __int16 v36 = 1024;
            int v37 = 1311;
            __int16 v38 = 2114;
            v39 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set active. { error=%{public}@ }", buf, 0x1Cu);
          }
          int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

          (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        }
      }
      else
      {
        if (qword_1000260C8 != -1) {
          dispatch_once(&qword_1000260C8, &stru_100020508);
        }
        int v26 = *(id *)qword_1000260D0;
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          __int16 v27 = [v14 localizedDescription];
          *(_DWORD *)buf = 136315650;
          v35 = "AVAudioDeviceTestService.mm";
          __int16 v36 = 1024;
          int v37 = 1302;
          __int16 v38 = 2114;
          v39 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to disable smart routing. { error=%{public}@ }", buf, 0x1Cu);
        }
        int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
      if (qword_1000260C8 != -1) {
        dispatch_once(&qword_1000260C8, &stru_100020508);
      }
      double v24 = *(id *)qword_1000260D0;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        __int16 v25 = [v10 localizedDescription];
        *(_DWORD *)buf = 136315650;
        v35 = "AVAudioDeviceTestService.mm";
        __int16 v36 = 1024;
        int v37 = 1293;
        __int16 v38 = 2114;
        v39 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set mode. { error=%{public}@ }", buf, 0x1Cu);
      }
      int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v22 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      __int16 v23 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315650;
      v35 = "AVAudioDeviceTestService.mm";
      __int16 v36 = 1024;
      int v37 = 1285;
      __int16 v38 = 2114;
      v39 = v23;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to set category. { error=%{public}@ }", buf, 0x1Cu);
    }
    int v21 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-1 userInfo:0];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000A55C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000AAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000ABA0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

void sub_10000B0E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_10000B200(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) inputTapFile];
  id v9 = 0;
  unsigned __int8 v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    unsigned __int8 v7 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float v8 = [*(id *)(a1 + 40) localizedDescription];
      *(_DWORD *)buf = 136315650;
      unsigned __int8 v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1224;
      __int16 v14 = 2112;
      unsigned __int8 v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);
    }
  }
}

void sub_10000B36C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000B5EC(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    __int16 v14 = "AVAudioDeviceTestService.mm";
    __int16 v15 = 1024;
    int v16 = 1161;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Stop tone playback requested.", (uint8_t *)&v13, 0x12u);
  }
  id v3 = *(unsigned char **)(*(void *)(a1 + 32) + 8);
  if (v3)
  {
    unsigned char *v3 = 1;
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    v4 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
      int v13 = 136315650;
      __int16 v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 1165;
      __int16 v17 = 2048;
      uint64_t v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone has been stopped. { frequency=%f }", (uint8_t *)&v13, 0x1Cu);
    }
    +[NSThread sleepForTimeInterval:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 8)];
  }
  else
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    id v6 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315394;
      __int16 v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 1168;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Tone stop requested but, pulse tone handler is nil", (uint8_t *)&v13, 0x12u);
    }
  }
  unsigned __int8 v7 = *(void **)(a1 + 32);
  float v8 = [v7 userVolumeBeforeHearingTest];
  [v8 floatValue];
  objc_msgSend(v7, "resetVolume:");

  [*(id *)(a1 + 32) removeSystemVolumeObserver];
  id v9 = sub_10000B8F4();
  uint64_t v10 = sub_10000B974();
  if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      LOWORD(v13) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_END, v11, "AVF tone playback", "user tap", (uint8_t *)&v13, 2u);
    }
  }

  return [*(id *)(a1 + 32) cleanUp];
}

void sub_10000B8D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000B8EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanUp];
}

char *sub_10000B8F4()
{
  p_name = &OBJC_PROTOCOL___NSObject.name;
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_1000260F8, memory_order_acquire) & 1) == 0)
  {
    int v3 = __cxa_guard_acquire(&qword_1000260F8);
    p_name = (char **)(&OBJC_PROTOCOL___NSObject + 8);
    if (v3)
    {
      qword_1000260F0 = (uint64_t)os_log_create("com.apple.avfaudio", "adtssp");
      __cxa_guard_release(&qword_1000260F8);
      p_name = (char **)(&OBJC_PROTOCOL___NSObject + 8);
    }
  }
  uint64_t v1 = p_name[30];

  return v1;
}

uint64_t sub_10000B974()
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_100026108, memory_order_acquire) & 1) == 0
    && __cxa_guard_acquire(&qword_100026108))
  {
    uint64_t v1 = sub_10000B8F4();
    os_signpost_id_t v2 = os_signpost_id_generate(v1);

    qword_100026100 = v2;
    __cxa_guard_release(&qword_100026108);
  }
  return qword_100026100;
}

void sub_10000C8A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14, void *a15)
{
  _Unwind_Resume(a1);
}

intptr_t sub_10000CB94(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  os_signpost_id_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    uint64_t v5 = "AVAudioDeviceTestService.mm";
    __int16 v6 = 1024;
    int v7 = 1112;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v4, 0x12u);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000CC98(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) inputTapFile];
  id v9 = 0;
  unsigned __int8 v5 = [v4 writeFromBuffer:v3 error:&v9];
  id v6 = v9;

  if ((v5 & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v7 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      float v8 = [v6 localizedDescription];
      *(_DWORD *)buf = 136315650;
      os_signpost_id_t v11 = "AVAudioDeviceTestService.mm";
      __int16 v12 = 1024;
      int v13 = 1133;
      __int16 v14 = 2112;
      __int16 v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d error writing debug file %@", buf, 0x1Cu);
    }
  }
}

void sub_10000CDFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CF08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000CF1C(id *a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  os_signpost_id_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v4 = v3;
    [a1[4] volume];
    float v6 = v5;
    [a1[4] duration];
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 892;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v4;
    *(_WORD *)&buf[28] = 2048;
    *(double *)&buf[30] = v6;
    *(_WORD *)&buf[38] = 2048;
    id v116 = v7;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Playback tone request. { frequency=%f, volume=%f, duration=%f }", buf, 0x30u);
  }

  id v9 = a1[4];
  id v8 = a1[5];
  v105[0] = _NSConcreteStackBlock;
  v105[1] = 3221225472;
  v105[2] = sub_10000E0AC;
  v105[3] = &unk_100020668;
  id v106 = a1[6];
  [v8 checkSequenceValidity:v9 completion:v105];
  uint64_t v10 = [a1[5] hearingTestSession];
  LODWORD(v8) = v10 == 0;

  if (v8)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    os_signpost_id_t v11 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 901;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d HearingTest session not set, falling back to default playback session.", buf, 0x12u);
    }
    id v13 = a1[4];
    id v12 = a1[5];
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_10000E120;
    v103[3] = &unk_100020668;
    id v104 = a1[6];
    [v12 setupAudioSessionFor:v13 playbackOnly:1 completion:v103];
  }
  __int16 v14 = +[AVSystemController sharedAVSystemController];
  float v102 = 0.0;
  if (([v14 getActiveCategoryVolume:&v102 andName:0] & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v15 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 913;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%25s:%-5d Error getting current volume", buf, 0x12u);
    }
  }
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  int v16 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 916;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v102;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] CurrentVolume=%f", buf, 0x1Cu);
  }
  __int16 v17 = [a1[5] userVolumeBeforeHearingTest];
  BOOL v18 = v17 == 0;

  if (v18)
  {
    id v19 = objc_alloc((Class)NSNumber);
    *(float *)&double v20 = v102;
    id v21 = [v19 initWithFloat:v20];
    [a1[5] setUserVolumeBeforeHearingTest:v21];
  }
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  __int16 v22 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = [a1[5] userVolumeBeforeHearingTest];
    [v23 doubleValue];
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 922;
    *(_WORD *)&buf[18] = 2048;
    *(void *)&buf[20] = v24;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] userVolumeBeforeHearingTest=%f", buf, 0x1Cu);
  }
  [a1[4] volume];
  float v26 = vabds_f32(v102, v25);
  if (v26 >= 1.1755e-38)
  {
    float v27 = fabsf(v25 + v102);
    if (v26 > (float)((float)(v27 * 0.00000011921) + (float)(v27 * 0.00000011921)))
    {
      [a1[4] volume];
      if ((objc_msgSend(v14, "setActiveCategoryVolumeTo:") & 1) == 0)
      {
        if (qword_1000260C8 != -1) {
          dispatch_once(&qword_1000260C8, &stru_100020508);
        }
        double v28 = *(id *)qword_1000260D0;
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          [a1[4] volume];
          *(_DWORD *)buf = 136315650;
          *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 925;
          *(_WORD *)&buf[18] = 2048;
          *(double *)&buf[20] = v29;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to set category volume to %f", buf, 0x1Cu);
        }

        id v30 = (void (**)(id, void, void *))a1[6];
        id v31 = sub_1000063FC(-15);
        v30[2](v30, 0, v31);
      }
    }
  }
  id v32 = a1[5];
  [a1[4] volume];
  int v34 = v33;
  v100[0] = _NSConcreteStackBlock;
  v100[1] = 3221225472;
  v100[2] = sub_10000E194;
  v100[3] = &unk_100020668;
  id v101 = a1[6];
  LODWORD(v35) = v34;
  [v32 setupVolumeObserverForVolume:v100 completion:v35];
  if (([a1[5] createAudioEngineAndPulseToneHandlerFor:a1[4]] & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    __int16 v36 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 937;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Failed to create pulse tone handler", buf, 0x12u);
    }
    int v37 = +[NSError errorWithDomain:@"com.apple.avfaudio.devicetest.service" code:-10 userInfo:0];
    (*((void (**)(void))a1[6] + 2))();
  }
  __int16 v38 = [a1[5] hearingTestSession];
  BOOL v39 = v38 == 0;

  if (v39)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    v40 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 943;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%25s:%-5d No session already created.", buf, 0x12u);
    }
    id v41 = a1[5];
    v98[0] = _NSConcreteStackBlock;
    v98[1] = 3221225472;
    v98[2] = sub_10000E208;
    v98[3] = &unk_100020690;
    v98[4] = v41;
    id v99 = a1[6];
    [v41 setupObservers:v98];
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&buf[24] = sub_10000E340;
  *(void *)&buf[32] = sub_10000E350;
  id v116 = [*(id *)(*((void *)a1[5] + 1) + 16) copy];
  id v43 = a1[4];
  id v42 = a1[5];
  v97[0] = _NSConcreteStackBlock;
  v97[1] = 3221225472;
  v97[2] = sub_10000E358;
  v97[3] = &unk_1000206B8;
  v97[4] = v42;
  [v42 setupAudioEngineFor:v43 sourceNodeBlock:v97];
  id v44 = a1[5];
  v45 = [a1[4] micBufferNumbers];
  id v46 = [v45 count];
  if (v46)
  {
    v47 = [a1[4] micBufferNumbers];
  }
  else
  {
    v47 = 0;
  }
  v95[0] = _NSConcreteStackBlock;
  v95[1] = 3221225472;
  v95[2] = sub_10000E514;
  v95[3] = &unk_100020668;
  id v96 = a1[6];
  [v44 setupMultiChannelMixerForOutputChannel:v47 completion:v95];
  if (v46) {

  }
  v48 = sub_10000B8F4();
  uint64_t v49 = sub_10000B974();
  if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v50 = v49;
    if (os_signpost_enabled(v48))
    {
      [a1[4] frequency];
      v52 = v51;
      [a1[4] soundLevel];
      *(_DWORD *)v107 = 134218240;
      v108 = v52;
      __int16 v109 = 2048;
      *(void *)v110 = v53;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v48, OS_SIGNPOST_INTERVAL_BEGIN, v50, "AVF tone playback", "freq=%f, lvl=%f", v107, 0x16u);
    }
  }

  v54 = [a1[5] engine];
  [v54 prepare];

  if ([a1[5] isMixerOutputEnabled])
  {
    v55 = +[NSURL fileURLWithPath:@"/tmp/multichannel_mixer_out.caf"];
    id v56 = objc_alloc((Class)AVAudioFile);
    v57 = [a1[5] engine];
    v58 = [v57 outputNode];
    v59 = [v58 outputFormatForBus:0];
    v60 = [v59 settings];
    id v94 = 0;
    id v61 = [v56 initForWriting:v55 settings:v60 error:&v94];
    id v62 = v94;

    if (v62) {
      (*((void (**)(void))a1[6] + 2))();
    }
    v63 = [a1[5] multichannelMixer];
    v64 = [a1[5] multichannelMixer];
    v65 = [v64 outputFormatForBus:0];
    v92[0] = _NSConcreteStackBlock;
    v92[1] = 3221225472;
    v92[2] = sub_10000E588;
    v92[3] = &unk_1000206E0;
    id v66 = v61;
    id v93 = v66;
    [v63 installTapOnBus:0 bufferSize:1024 format:v65 block:v92];
  }
  else
  {
    id v62 = 0;
  }
  v67 = [a1[5] engine];
  id v91 = v62;
  unsigned __int8 v68 = [v67 startAndReturnError:&v91];
  id v69 = v91;

  if ((v68 & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    v80 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
    {
      v81 = [v69 localizedDescription];
      v82 = sub_1000063FC(-10);
      double v83 = COERCE_DOUBLE([v82 code]);
      *(_DWORD *)v107 = 136315906;
      v108 = "AVAudioDeviceTestService.mm";
      __int16 v109 = 1024;
      *(_DWORD *)v110 = 990;
      *(_WORD *)&v110[4] = 2112;
      *(void *)&v110[6] = v81;
      __int16 v111 = 2048;
      double v112 = v83;
      _os_log_impl((void *)&_mh_execute_header, v80, OS_LOG_TYPE_ERROR, "%25s:%-5d startAndReturnError (%@) with test error (%li)", v107, 0x26u);
    }
    v84 = (void (**)(id, void, void *))a1[6];
    v85 = sub_1000063FC(-10);
    v84[2](v84, 0, v85);

    exit(-1);
  }
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  v70 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
  {
    [a1[4] frequency];
    uint64_t v72 = v71;
    [a1[4] volume];
    float v74 = v73;
    [a1[4] duration];
    *(_DWORD *)v107 = 136316162;
    v108 = "AVAudioDeviceTestService.mm";
    __int16 v109 = 1024;
    *(_DWORD *)v110 = 995;
    *(_WORD *)&v110[4] = 2048;
    *(void *)&v110[6] = v72;
    __int16 v111 = 2048;
    double v112 = v74;
    __int16 v113 = 2048;
    uint64_t v114 = v75;
    _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Started playing back tone. { frequency=%f, volume=%f, duration=%f }", v107, 0x30u);
  }

  [a1[4] duration];
  dispatch_time_t v77 = dispatch_time(0, (uint64_t)(v76 * 1000000000.0));
  v78 = [a1[5] toneQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E668;
  block[3] = &unk_100020708;
  int8x16_t v86 = *((int8x16_t *)a1 + 2);
  id v79 = (id)v86.i64[0];
  int8x16_t v88 = vextq_s8(v86, v86, 8uLL);
  v90 = buf;
  id v89 = a1[6];
  dispatch_after(v77, v78, block);

  _Block_object_dispose(buf, 8);
}

void sub_10000DE78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,void *a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,void *a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,void *a58)
{
  _Block_object_dispose((const void *)(v63 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_10000E0AC(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000E10C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E120(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000E180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E194(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000E1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E208(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    uint64_t v4 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      float v6 = "AVAudioDeviceTestService.mm";
      __int16 v7 = 1024;
      int v8 = 946;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Interruption detected, resetting observers.", (uint8_t *)&v5, 0x12u);
    }
    [*(id *)(a1 + 32) cleanUpObservers];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_10000E328(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_10000E340(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000E350(uint64_t a1)
{
}

uint64_t sub_10000E358(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int *a5)
{
  int v5 = *(unsigned __int8 **)(*(void *)(a1 + 32) + 8);
  if (v5 && a4)
  {
    uint64_t v6 = 0;
    __int16 v7 = a5 + 4;
    uint64_t v8 = *a5;
    uint64_t v9 = *((void *)v5 + 5);
    int v10 = *((_DWORD *)v5 + 12);
    int v11 = v5[80];
    uint64_t v12 = a4;
    double v13 = *((double *)v5 + 3) / *((double *)v5 + 9);
    while (1)
    {
      ++v9;
      int v14 = v10 + 1;
      double v15 = 0.0;
      if (!v11)
      {
        int v20 = *((_DWORD *)v5 + 13);
        if (v20)
        {
          if (v10 < 0)
          {
            int v11 = *v5;
            v5[80] = v11;
          }
          else
          {
            double v21 = sin((v13 * (double)v9 + v13 * (double)v9) * 3.14159265) * *((double *)v5 + 4);
            int v22 = *((_DWORD *)v5 + 14);
            if (v10 >= v22)
            {
              int v25 = *((_DWORD *)v5 + 15);
              if (!v25 && !*v5)
              {
                int v11 = 0;
                int v10 = *((_DWORD *)v5 + 14);
                goto LABEL_26;
              }
              double v26 = *((double *)v5 + 8);
              double v27 = v26 + (double)v22;
              if (v27 <= (double)v14)
              {
                int v10 = (int)-((double)v25 - v26);
                *((_DWORD *)v5 + 13) = (v20 & ~(v20 >> 31)) - 1;
                int v11 = *v5;
                v5[80] = v11;
                goto LABEL_6;
              }
              int v11 = 0;
              double v24 = (v27 - (double)v14) / v26;
            }
            else
            {
              double v23 = *((double *)v5 + 8);
              int v11 = 0;
              if (v23 <= (double)v14)
              {
                ++v10;
LABEL_26:
                double v15 = v21;
                goto LABEL_6;
              }
              double v24 = (double)v14 / v23;
            }
            double v15 = v21 * v24;
          }
        }
        else
        {
          int v11 = 0;
        }
      }
      ++v10;
LABEL_6:
      if (v8)
      {
        __int16 v17 = v7;
        uint64_t v18 = v8;
        do
        {
          uint64_t v19 = *(void *)v17;
          v17 += 4;
          float v16 = v15;
          *(float *)(v19 + 4 * v6) = v16;
          --v18;
        }
        while (v18);
      }
      if (++v6 == v12)
      {
        *((void *)v5 + 5) = v9;
        *((_DWORD *)v5 + 12) = v10;
        return 0;
      }
    }
  }
  return 0;
}

void sub_10000E514(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_10000E574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_10000E588(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  __int16 v7 = *(void **)(a1 + 32);
  id v9 = 0;
  unsigned __int8 v8 = [v7 writeFromBuffer:v5 error:&v9];
  if (v9) {
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke", "AVAudioDeviceTestService.mm", 984, "err == nil");
  }
  if ((v8 & 1) == 0) {
    __assert_rtn("-[AVAudioDeviceTestService playbackTone:completion:]_block_invoke", "AVAudioDeviceTestService.mm", 985, "didWrite");
  }
}

void sub_10000E650(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_10000E668(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  if (!v2)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v10 = *(id *)qword_1000260D0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v14 = v13;
    [*(id *)(a1 + 40) volume];
    float v16 = v15;
    [*(id *)(a1 + 40) duration];
    *(_DWORD *)id v31 = 136316162;
    *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 999;
    *(_WORD *)&v31[18] = 2048;
    *(void *)&v31[20] = v14;
    *(_WORD *)&v31[28] = 2048;
    *(double *)&v31[30] = v16;
    *(_WORD *)&v31[38] = 2048;
    uint64_t v32 = v17;
    uint64_t v18 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone handler is nil { freq"
          "uency=%f, volume=%f, duration=%f }";
    uint64_t v19 = v10;
    uint32_t v20 = 48;
LABEL_20:
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, v18, v31, v20);
LABEL_21:

    goto LABEL_22;
  }
  if (([*(id *)(v2 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)] & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v10 = *(id *)qword_1000260D0;
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_21;
    }
    [*(id *)(a1 + 40) frequency];
    uint64_t v22 = v21;
    [*(id *)(a1 + 40) volume];
    float v24 = v23;
    [*(id *)(a1 + 40) duration];
    uint64_t v25 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
    *(_DWORD *)id v31 = 136316674;
    *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&v31[12] = 1024;
    *(_DWORD *)&v31[14] = 1001;
    *(_WORD *)&v31[18] = 2048;
    *(void *)&v31[20] = v22;
    *(_WORD *)&v31[28] = 2048;
    *(double *)&v31[30] = v24;
    *(_WORD *)&v31[38] = 2048;
    uint64_t v32 = v27;
    *(_WORD *)int v33 = 2112;
    *(void *)&v33[2] = v25;
    *(_WORD *)&v33[10] = 2112;
    *(void *)&v33[12] = v26;
    uint64_t v18 = "%25s:%-5d [AVAT Server] Duration timer called, tone has already been stopped, pulse tone IDs do not match. { f"
          "requency=%f, volume=%f, duration=%f, pulseToneID=%@, currID=%@ }";
    uint64_t v19 = v10;
    uint32_t v20 = 68;
    goto LABEL_20;
  }
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  if (v3
    && [*(id *)(v3 + 16) isEqualToString:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)])
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    uint64_t v4 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      [*(id *)(a1 + 40) frequency];
      uint64_t v6 = v5;
      [*(id *)(a1 + 40) volume];
      float v8 = v7;
      [*(id *)(a1 + 40) duration];
      *(_DWORD *)id v31 = 136316162;
      *(void *)&v31[4] = "AVAudioDeviceTestService.mm";
      *(_WORD *)&v31[12] = 1024;
      *(_DWORD *)&v31[14] = 1003;
      *(_WORD *)&v31[18] = 2048;
      *(void *)&v31[20] = v6;
      *(_WORD *)&v31[28] = 2048;
      *(double *)&v31[30] = v8;
      *(_WORD *)&v31[38] = 2048;
      uint64_t v32 = v9;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d [AVAT Server] Duration timer called, stopping tone. { frequency=%f, volume=%f, duration=%f }", v31, 0x30u);
    }

    **(unsigned char **)(*(void *)(a1 + 32) + 8) = 1;
    +[NSThread sleepForTimeInterval:*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 8)];
    [*(id *)(a1 + 32) cleanUp];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    int v10 = sub_10000B8F4();
    uint64_t v11 = sub_10000B974();
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v12 = v11;
      if (os_signpost_enabled(v10))
      {
        *(_WORD *)id v31 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, v12, "AVF tone playback", "duration timer", v31, 2u);
      }
    }
    goto LABEL_21;
  }
LABEL_22:
  double v28 = *(void **)(a1 + 32);
  float v29 = objc_msgSend(v28, "userVolumeBeforeHearingTest", *(_OWORD *)v31, *(_OWORD *)&v31[16], *(void *)&v31[32], v32, *(_OWORD *)v33, *(void *)&v33[16]);
  [v29 floatValue];
  objc_msgSend(v28, "resetVolume:");

  return [*(id *)(a1 + 32) removeSystemVolumeObserver];
}

void sub_10000EAB8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000EE5C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001139C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *exc_bufa, void *a15, uint64_t a16, void *a17, void *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,void *a35,void *a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60)
{
  if (a2)
  {

    _Block_object_dispose((const void *)(v66 - 224), 8);
    _Block_object_dispose(&a39, 8);

    if (a2 == 2)
    {
      id v68 = objc_begin_catch(a1);
      if (qword_1000260C8 != -1) {
        dispatch_once(&qword_1000260C8, &stru_100020508);
      }
      id v69 = *(id *)qword_1000260D0;
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        v70 = sub_1000063FC(-7);
        id v71 = [v70 code];
        *(_DWORD *)(v66 - 224) = 136315906;
        STACK[0x224] = (unint64_t)"AVAudioDeviceTestService.mm";
        *(_WORD *)(v66 - 212) = 1024;
        LODWORD(STACK[0x22E]) = 838;
        *(_WORD *)(v66 - 206) = 2112;
        STACK[0x234] = (unint64_t)v68;
        *(_WORD *)(v66 - 196) = 2048;
        STACK[0x23E] = (unint64_t)v71;
        _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_ERROR, "%25s:%-5d exception (%@) with test error (%li)", (uint8_t *)(v66 - 224), 0x26u);
      }
      uint64_t v72 = sub_1000063FC(-7);
      (*(void (**)(uint64_t, void, void *))(a19 + 16))(a19, 0, v72);

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x100010D50);
  }
  _Unwind_Resume(a1);
}

void *sub_100011E14(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E64();
  result = dlsym(v2, "MSNMonitorBeginException");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000260D8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100011E64()
{
  v3[0] = 0;
  if (!qword_1000260E0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100013000;
    v3[4] = &unk_100020878;
    v3[5] = v3;
    long long v4 = off_100020860;
    uint64_t v5 = 0;
    qword_1000260E0 = _sl_dlopen();
    uint64_t v1 = (void *)v3[0];
    uint64_t v0 = qword_1000260E0;
    if (qword_1000260E0)
    {
      if (!v3[0]) {
        return v0;
      }
    }
    else
    {
      uint64_t v1 = (void *)abort_report_np();
    }
    free(v1);
    return v0;
  }
  return qword_1000260E0;
}

void sub_100011F74(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = [v3 userInfo];
  uint64_t v5 = [v4 objectForKeyedSubscript:AVAudioSessionRouteChangeReasonKey];
  id v6 = [v5 unsignedIntegerValue];

  float v7 = [*(id *)(a1 + 32) stringForRouteChangeReason:v6];
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  float v8 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315650;
    int v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 553;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d route change (%@)", (uint8_t *)&v9, 0x1Cu);
  }
}

void sub_1000120D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012104(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  long long v4 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 object];
    id v6 = sub_1000063FC(-3);
    int v9 = 136315906;
    int v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 561;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    id v16 = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d interruption (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = sub_1000063FC(-3);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

  exit(-3);
}

void sub_10001225C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000122A4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  long long v4 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [v3 object];
    id v6 = sub_1000063FC(-4);
    int v9 = 136315906;
    int v10 = "AVAudioDeviceTestService.mm";
    __int16 v11 = 1024;
    int v12 = 571;
    __int16 v13 = 2112;
    uint64_t v14 = v5;
    __int16 v15 = 2048;
    id v16 = [v6 code];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d mediaserverd died (%@) with test error (%li)", (uint8_t *)&v9, 0x26u);
  }
  uint64_t v7 = *(void *)(a1 + 32);
  float v8 = sub_1000063FC(-4);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);

  exit(-4);
}

void sub_1000123FC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

id sub_100012444(uint64_t a1, uint64_t a2, void *a3)
{
  *a3 = 0;
  return *(id *)(a1 + 32);
}

void sub_100012450(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v7 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    float v8 = [v5 averagePowerPerChannel];
    int v14 = 136315650;
    __int16 v15 = "AVAudioDeviceTestService.mm";
    __int16 v16 = 1024;
    int v17 = 655;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d collecting input tap data %@", (uint8_t *)&v14, 0x1Cu);
  }
  if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) appendDataFromBuffer:v5] & 1) == 0)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    int v9 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = sub_1000063FC(-10);
      id v11 = [v10 code];
      int v14 = 136315650;
      __int16 v15 = "AVAudioDeviceTestService.mm";
      __int16 v16 = 1024;
      int v17 = 658;
      __int16 v18 = 2048;
      id v19 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d failed to read in from buffer - test error %li", (uint8_t *)&v14, 0x1Cu);
    }
    uint64_t v12 = *(void *)(a1 + 40);
    __int16 v13 = sub_1000063FC(-10);
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v13);
  }
  if ([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) frameLength] >= *(_DWORD *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }
}

void sub_1000126C8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100012714(uint64_t a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v2 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "AVAudioDeviceTestService.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 771;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%25s:%-5d processing xcorr", buf, 0x12u);
  }
  group = dispatch_group_create();
  id v3 = dispatch_queue_attr_make_with_qos_class((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, QOS_CLASS_USER_INTERACTIVE, -1);
  uint64_t v22 = dispatch_queue_create("com.apple.avfaudio.xcorr_queue", v3);

  uint64_t v26 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) splitIntoSingleChannelBuffers];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v39 = sub_10000E340;
  v40 = sub_10000E350;
  id v41 = (id)objc_opt_new();
  obunint64_t j = objc_alloc_init((Class)NSMutableArray);
  long long v4 = [*(id *)(a1 + 32) micBufferNumbers];
  if (!v4
    || (objc_msgSend(*(id *)(a1 + 32), "micBufferNumbers", v22, group),
        id v5 = objc_claimAutoreleasedReturnValue(),
        BOOL v6 = [v5 count] == 0,
        v5,
        v4,
        v6))
  {
    for (unint64_t i = 0; (unint64_t)objc_msgSend(v26, "count", v22) > i; ++i)
    {
      uint64_t v21 = +[NSNumber numberWithInt:i];
      [obj addObject:v21];
    }
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) micBufferNumbers];
    id v8 = [v7 copy];

    obunint64_t j = v8;
  }
  for (unint64_t j = 0; (unint64_t)[obj count] > j; ++j)
  {
    int v10 = *(void **)(*(void *)&buf[8] + 40);
    id v11 = +[NSNull null];
    [v10 addObject:v11];
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id obja = obj;
  id v12 = [obja countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v34;
    do
    {
      for (k = 0; k != v12; k = (char *)k + 1)
      {
        if (*(void *)v34 != v13) {
          objc_enumerationMutation(obja);
        }
        uint64_t v15 = *(void *)(*((void *)&v33 + 1) + 8 * (void)k);
        v27[0] = _NSConcreteStackBlock;
        v27[1] = 3221225472;
        v27[2] = sub_100012CB0;
        v27[3] = &unk_100020618;
        v27[4] = v15;
        id v28 = v26;
        id v16 = *(id *)(a1 + 32);
        uint64_t v17 = *(void *)(a1 + 40);
        __int16 v18 = *(void **)(a1 + 48);
        id v29 = v16;
        uint64_t v30 = v17;
        id v31 = v18;
        uint64_t v32 = buf;
        id v19 = objc_retainBlock(v27);
        if ([*(id *)(a1 + 32) parallelCrossCorrelationCalculation]) {
          dispatch_group_async(group, v22, v19);
        }
        else {
          ((void (*)(void *))v19[2])(v19);
        }
      }
      id v12 = [obja countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v12);
  }

  if ([*(id *)(a1 + 32) parallelCrossCorrelationCalculation]) {
    dispatch_group_wait(group, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();

  _Block_object_dispose(buf, 8);
}

void sub_100012B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12)
{
  _Block_object_dispose((const void *)(v13 - 176), 8);
  _Unwind_Resume(a1);
}

void *sub_100012C60(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100011E64();
  result = dlsym(v2, "MSNMonitorEndException");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_1000260E8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100012CB0(uint64_t a1)
{
  uint64_t v2 = (int)[*(id *)(a1 + 32) intValue];
  id v3 = [*(id *)(a1 + 40) objectAtIndex:v2];
  long long v4 = +[NSData dataWithBytes:length:](NSData, "dataWithBytes:length:", *((void *)[v3 audioBufferList] + 2), *((unsigned int *)objc_msgSend(v3, "audioBufferList") + 3));
  if ([*(id *)(a1 + 48) calculateCrossCorrelationPeak])
  {
    [*(id *)(a1 + 56) calculateCrossCorrelationPeakRelativeToSource:*(void *)(a1 + 64) capture:v3];
    uint64_t v6 = v5;
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    uint64_t v7 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315650;
      int v14 = "AVAudioDeviceTestService.mm";
      __int16 v15 = 1024;
      int v16 = 802;
      __int16 v17 = 2048;
      uint64_t v18 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d db %f", (uint8_t *)&v13, 0x1Cu);
    }
  }
  id v8 = [AVAudioDeviceTestResult alloc];
  id v9 = [*(id *)(a1 + 48) outputID];
  int v10 = [v3 format];
  [v10 sampleRate];
  id v11 = -[AVAudioDeviceTestResult initWithData:inputID:outputID:sampleRate:correlationValue:](v8, "initWithData:inputID:outputID:sampleRate:correlationValue:", v4, v2, v9);

  id v12 = *(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
  objc_sync_enter(v12);
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) setObject:v11 atIndexedSubscript:v2];
  objc_sync_exit(v12);
}

void sub_100012ED0(_Unwind_Exception *a1)
{
  objc_sync_exit(v4);

  _Unwind_Resume(a1);
}

void sub_100012F1C(id a1)
{
  if (qword_1000260C8 != -1) {
    dispatch_once(&qword_1000260C8, &stru_100020508);
  }
  uint64_t v1 = *(id *)qword_1000260D0;
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136315394;
    id v3 = "AVAudioDeviceTestService.mm";
    __int16 v4 = 1024;
    int v5 = 715;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "%25s:%-5d player finished", (uint8_t *)&v2, 0x12u);
  }
}

uint64_t sub_100013000()
{
  uint64_t result = _sl_dlopen();
  qword_1000260E0 = result;
  return result;
}

void sub_100013104(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10001334C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  _Unwind_Resume(a1);
}

void sub_100013A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{
  _Unwind_Resume(a1);
}

void sub_100013CBC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100013FA8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, void *a11, void *a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  _Unwind_Resume(a1);
}

void sub_100015934(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (qword_1000260C8 != -1) {
      dispatch_once(&qword_1000260C8, &stru_100020508);
    }
    uint64_t v7 = *(id *)qword_1000260D0;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = [v6 localizedDescription];
      int v11 = 136315650;
      id v12 = "AVAudioDeviceTestService.mm";
      __int16 v13 = 1024;
      int v14 = 262;
      __int16 v15 = 2112;
      int v16 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Error instantiating AVAudioUnit: %@", (uint8_t *)&v11, 0x1Cu);
    }
  }
  else
  {
    [*(id *)(a1 + 40) setMultichannelMixer:v5];
    id v9 = [*(id *)(a1 + 40) engine];
    int v10 = [*(id *)(a1 + 40) multichannelMixer];
    [v9 attachNode:v10];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100015AC4(_Unwind_Exception *a1)
{
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v3 + 32));
  _Unwind_Resume(a1);
}

void sub_100015BE0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100015CC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

OSStatus AudioUnitSetProperty(AudioUnit inUnit, AudioUnitPropertyID inID, AudioUnitScope inScope, AudioUnitElement inElement, const void *inData, UInt32 inDataSize)
{
  return _AudioUnitSetProperty(inUnit, inID, inScope, inElement, inData, inDataSize);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

void *__cxa_begin_catch(void *a1)
{
  return ___cxa_begin_catch(a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return ___cxa_guard_acquire((uint64_t *)a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int *__error(void)
{
  return ___error();
}

float __exp10f(float a1)
{
  return ___exp10f(a1);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
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

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
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

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

void exit(int a1)
{
}

void free(void *a1)
{
}

float log10f(float a1)
{
  return _log10f(a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_malloc(size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
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

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t sandbox_extension_consume()
{
  return _sandbox_extension_consume();
}

uint64_t sandbox_extension_release()
{
  return _sandbox_extension_release();
}

long double sin(long double __x)
{
  return _sin(__x);
}

void vDSP_conv(const float *__A, vDSP_Stride __IA, const float *__F, vDSP_Stride __IF, float *__C, vDSP_Stride __IC, vDSP_Length __N, vDSP_Length __P)
{
}

void vDSP_maxv(const float *__A, vDSP_Stride __IA, float *__C, vDSP_Length __N)
{
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

id objc_msgSend_allowAllBuiltInDataSources(void *a1, const char *a2, ...)
{
  return [a1 allowAllBuiltInDataSources];
}

id objc_msgSend_audioBufferList(void *a1, const char *a2, ...)
{
  return [a1 audioBufferList];
}

id objc_msgSend_audioUnit(void *a1, const char *a2, ...)
{
  return [a1 audioUnit];
}

id objc_msgSend_availableInputs(void *a1, const char *a2, ...)
{
  return [a1 availableInputs];
}

id objc_msgSend_averagePowerPerChannel(void *a1, const char *a2, ...)
{
  return [a1 averagePowerPerChannel];
}

id objc_msgSend_bands(void *a1, const char *a2, ...)
{
  return [a1 bands];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_calculateCrossCorrelationPeak(void *a1, const char *a2, ...)
{
  return [a1 calculateCrossCorrelationPeak];
}

id objc_msgSend_category(void *a1, const char *a2, ...)
{
  return [a1 category];
}

id objc_msgSend_categoryOptions(void *a1, const char *a2, ...)
{
  return [a1 categoryOptions];
}

id objc_msgSend_channelCount(void *a1, const char *a2, ...)
{
  return [a1 channelCount];
}

id objc_msgSend_cleanUp(void *a1, const char *a2, ...)
{
  return [a1 cleanUp];
}

id objc_msgSend_cleanUpObservers(void *a1, const char *a2, ...)
{
  return [a1 cleanUpObservers];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dataSourceID(void *a1, const char *a2, ...)
{
  return [a1 dataSourceID];
}

id objc_msgSend_dataSources(void *a1, const char *a2, ...)
{
  return [a1 dataSources];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return [a1 duration];
}

id objc_msgSend_engine(void *a1, const char *a2, ...)
{
  return [a1 engine];
}

id objc_msgSend_extensionHandle(void *a1, const char *a2, ...)
{
  return [a1 extensionHandle];
}

id objc_msgSend_fileFormat(void *a1, const char *a2, ...)
{
  return [a1 fileFormat];
}

id objc_msgSend_floatChannelData(void *a1, const char *a2, ...)
{
  return [a1 floatChannelData];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_format(void *a1, const char *a2, ...)
{
  return [a1 format];
}

id objc_msgSend_frameLength(void *a1, const char *a2, ...)
{
  return [a1 frameLength];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_hearingTestSession(void *a1, const char *a2, ...)
{
  return [a1 hearingTestSession];
}

id objc_msgSend_inputFilter(void *a1, const char *a2, ...)
{
  return [a1 inputFilter];
}

id objc_msgSend_inputNode(void *a1, const char *a2, ...)
{
  return [a1 inputNode];
}

id objc_msgSend_inputProcessingChain(void *a1, const char *a2, ...)
{
  return [a1 inputProcessingChain];
}

id objc_msgSend_inputTapFile(void *a1, const char *a2, ...)
{
  return [a1 inputTapFile];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_interruptionObserver(void *a1, const char *a2, ...)
{
  return [a1 interruptionObserver];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isMixerOutputEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMixerOutputEnabled];
}

id objc_msgSend_isRunning(void *a1, const char *a2, ...)
{
  return [a1 isRunning];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mediaservicesLostObserver(void *a1, const char *a2, ...)
{
  return [a1 mediaservicesLostObserver];
}

id objc_msgSend_mediaservicesResetObserver(void *a1, const char *a2, ...)
{
  return [a1 mediaservicesResetObserver];
}

id objc_msgSend_micBufferNumbers(void *a1, const char *a2, ...)
{
  return [a1 micBufferNumbers];
}

id objc_msgSend_microphone(void *a1, const char *a2, ...)
{
  return [a1 microphone];
}

id objc_msgSend_mode(void *a1, const char *a2, ...)
{
  return [a1 mode];
}

id objc_msgSend_multichannelMixer(void *a1, const char *a2, ...)
{
  return [a1 multichannelMixer];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nodeToCaptureData(void *a1, const char *a2, ...)
{
  return [a1 nodeToCaptureData];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_numberOfChannels(void *a1, const char *a2, ...)
{
  return [a1 numberOfChannels];
}

id objc_msgSend_numberOfPulses(void *a1, const char *a2, ...)
{
  return [a1 numberOfPulses];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_opaqueSessionID(void *a1, const char *a2, ...)
{
  return [a1 opaqueSessionID];
}

id objc_msgSend_outputFilter(void *a1, const char *a2, ...)
{
  return [a1 outputFilter];
}

id objc_msgSend_outputID(void *a1, const char *a2, ...)
{
  return [a1 outputID];
}

id objc_msgSend_outputLatency(void *a1, const char *a2, ...)
{
  return [a1 outputLatency];
}

id objc_msgSend_outputMode(void *a1, const char *a2, ...)
{
  return [a1 outputMode];
}

id objc_msgSend_outputNode(void *a1, const char *a2, ...)
{
  return [a1 outputNode];
}

id objc_msgSend_outputProcessingChain(void *a1, const char *a2, ...)
{
  return [a1 outputProcessingChain];
}

id objc_msgSend_outputSampleRate(void *a1, const char *a2, ...)
{
  return [a1 outputSampleRate];
}

id objc_msgSend_parallelCrossCorrelationCalculation(void *a1, const char *a2, ...)
{
  return [a1 parallelCrossCorrelationCalculation];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_pauseDuration(void *a1, const char *a2, ...)
{
  return [a1 pauseDuration];
}

id objc_msgSend_play(void *a1, const char *a2, ...)
{
  return [a1 play];
}

id objc_msgSend_player(void *a1, const char *a2, ...)
{
  return [a1 player];
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return [a1 portType];
}

id objc_msgSend_preferredIOBufferFrameSize(void *a1, const char *a2, ...)
{
  return [a1 preferredIOBufferFrameSize];
}

id objc_msgSend_prepare(void *a1, const char *a2, ...)
{
  return [a1 prepare];
}

id objc_msgSend_priority(void *a1, const char *a2, ...)
{
  return [a1 priority];
}

id objc_msgSend_processSequenceAsynchronously(void *a1, const char *a2, ...)
{
  return [a1 processSequenceAsynchronously];
}

id objc_msgSend_processingFormat(void *a1, const char *a2, ...)
{
  return [a1 processingFormat];
}

id objc_msgSend_pulseDuration(void *a1, const char *a2, ...)
{
  return [a1 pulseDuration];
}

id objc_msgSend_rampDuration(void *a1, const char *a2, ...)
{
  return [a1 rampDuration];
}

id objc_msgSend_removeSystemVolumeObserver(void *a1, const char *a2, ...)
{
  return [a1 removeSystemVolumeObserver];
}

id objc_msgSend_requiresBluetoothOutput(void *a1, const char *a2, ...)
{
  return [a1 requiresBluetoothOutput];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_routeChangeObserver(void *a1, const char *a2, ...)
{
  return [a1 routeChangeObserver];
}

id objc_msgSend_sampleRate(void *a1, const char *a2, ...)
{
  return [a1 sampleRate];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedAVSystemController(void *a1, const char *a2, ...)
{
  return [a1 sharedAVSystemController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_soundLevel(void *a1, const char *a2, ...)
{
  return [a1 soundLevel];
}

id objc_msgSend_sourceNode(void *a1, const char *a2, ...)
{
  return [a1 sourceNode];
}

id objc_msgSend_splitIntoSingleChannelBuffers(void *a1, const char *a2, ...)
{
  return [a1 splitIntoSingleChannelBuffers];
}

id objc_msgSend_startDelay(void *a1, const char *a2, ...)
{
  return [a1 startDelay];
}

id objc_msgSend_stimulusURL(void *a1, const char *a2, ...)
{
  return [a1 stimulusURL];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopPlayback(void *a1, const char *a2, ...)
{
  return [a1 stopPlayback];
}

id objc_msgSend_systemVolumeObserver(void *a1, const char *a2, ...)
{
  return [a1 systemVolumeObserver];
}

id objc_msgSend_toneQueue(void *a1, const char *a2, ...)
{
  return [a1 toneQueue];
}

id objc_msgSend_transaction(void *a1, const char *a2, ...)
{
  return [a1 transaction];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userVolumeBeforeHearingTest(void *a1, const char *a2, ...)
{
  return [a1 userVolumeBeforeHearingTest];
}

id objc_msgSend_volume(void *a1, const char *a2, ...)
{
  return [a1 volume];
}

id objc_msgSend_writeFromBuffer_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeFromBuffer:error:");
}