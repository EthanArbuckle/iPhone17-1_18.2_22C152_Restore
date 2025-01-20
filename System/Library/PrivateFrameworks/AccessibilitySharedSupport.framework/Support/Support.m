void sub_100005414(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t vars8;

  v2 = +[NSMutableArray array];
  objc_msgSend(*(id *)(a1 + 32), "set_xpcConnections:", v2);

  v3 = +[NSMutableArray array];
  objc_msgSend(*(id *)(a1 + 32), "set_trackingXPCConnections:", v3);
}

void sub_100005914(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_10000594C(uint64_t a1)
{
  v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXMTDaemon: connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) _handleConnectionClosedOnBackgroundThread:WeakRetained];
  }
}

void sub_1000059DC(uint64_t a1)
{
  v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXMTDaemon: connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained) {
    [*(id *)(a1 + 32) _handleConnectionClosedOnBackgroundThread:WeakRetained];
  }
}

void sub_100005A6C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _xpcConnections];
  [v2 addObject:*(void *)(a1 + 40)];
}

void sub_100005C20(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _trackingXPCConnections];
  unsigned __int8 v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) _trackingXPCConnections];
    [v4 addObject:*(void *)(a1 + 40)];
  }
}

id sub_100005CB4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startOrUpdateTrackerIfNeeded];
}

void sub_100005E5C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _trackingXPCConnections];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _trackingXPCConnections];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
}

id sub_100005EF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopTrackerIfNoLongerNeeded];
}

void sub_100006000(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _lookAtPointTracker];
  [v1 recalibrateFace];
}

BOOL sub_100006188(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _lookAtPointTracker];
  BOOL v2 = v1 != 0;

  return v2;
}

uint64_t sub_1000061C0(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void sub_1000062C4(uint64_t a1)
{
  if (([*(id *)(a1 + 32) _showDebugOverlay] & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "set_showDebugOverlay:", 1);
    id v2 = [*(id *)(a1 + 32) _lookAtPointTracker];
    [v2 setDebugOverlayEnabled:1];
  }
}

void sub_100006408(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _showDebugOverlay])
  {
    objc_msgSend(*(id *)(a1 + 32), "set_showDebugOverlay:", 0);
    id v2 = [*(id *)(a1 + 32) _lookAtPointTracker];
    [v2 setDebugOverlayEnabled:0];
  }
}

void sub_10000658C(uint64_t a1)
{
  if ([*(id *)(a1 + 32) _motionTrackingMode] != *(id *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "set_motionTrackingMode:");
    uint64_t v2 = *(void *)(a1 + 40);
    id v3 = [*(id *)(a1 + 32) _lookAtPointTracker];
    [v3 setMotionTrackingMode:v2];
  }
}

void sub_100006718(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_sensitivity:", *(double *)(a1 + 40));
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _lookAtPointTracker];
  [v3 setSensitivity:v2];
}

id sub_1000068A4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_inputConfiguration:", *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _inputManager];
  [v3 setConfiguration:v2];

  id v4 = *(void **)(a1 + 32);

  return [v4 _startOrUpdateTrackerIfNeeded];
}

void sub_100006A38(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_expressionConfiguration:", *(void *)(a1 + 40));
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _lookAtPointTracker];
  [v3 setExpressionConfiguration:v2];
}

void sub_100006BA0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "set_joystickModeMovementThreshold:", *(double *)(a1 + 40));
  double v2 = *(double *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) _lookAtPointTracker];
  [v3 setJoystickModeMovementThreshold:v2];
}

void sub_100006C7C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _state];
  if (v2)
  {
    id v3 = (void *)v2;
    id v4 = [*(id *)(a1 + 32) _state];
    v5 = [v4 error];

    if (!v5)
    {
      v6 = [*(id *)(a1 + 32) _state];
      id v7 = [v6 copy];

      objc_msgSend(v7, "setLookAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
      [*(id *)(a1 + 32) _updateState:v7];
    }
  }
  v8 = AXSSLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = NSStringFromPoint(*(NSPoint *)(a1 + 40));
    int v12 = 136315394;
    v13 = "-[AXMTDaemon setLookAtPoint:]_block_invoke";
    __int16 v14 = 2112;
    v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "AXMTDaemon: %s: %@", (uint8_t *)&v12, 0x16u);
  }
  v10 = [*(id *)(a1 + 32) _lookAtPointTracker];

  if (v10)
  {
    v11 = [*(id *)(a1 + 32) _lookAtPointTracker];
    objc_msgSend(v11, "updateTrackedOnScreenPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  }
}

void sub_100006FB0(uint64_t a1)
{
  uint64_t v2 = +[AXMTVideoFilePlayManager shared];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100007068;
  v5[3] = &unk_100048A30;
  id v6 = *(id *)(a1 + 48);
  [v2 playVideoAtURL:v3 onMotionTrackingVideoFileInput:v4 completionHandler:v5];
}

uint64_t sub_100007068(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_100007128(uint64_t a1, void *a2)
{
  return [a2 motionTrackingDaemonUpdatedState:*(void *)(a1 + 32)];
}

void sub_1000072A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000072B8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000072C8(uint64_t a1)
{
}

void sub_1000072D0(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  uint64_t v3 = *(void **)(a1 + 32);
  if (v2) {
    [v3 _trackingXPCConnections];
  }
  else {
  id v5 = [v3 _xpcConnections];
  }
  id v4 = [v5 copy];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v4);
}

uint64_t sub_100007350(uint64_t a1, void *a2)
{
  [a2 remoteObjectProxyWithErrorHandler:&stru_100048AE8];
  objc_claimAutoreleasedReturnValue();
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(void))(v3 + 16))();
  }

  return _objc_release_x1();
}

void sub_1000073BC(id a1, NSError *a2)
{
  int v2 = a2;
  uint64_t v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10002C6F0((uint64_t)v2, v3);
  }
}

void sub_1000075AC(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _trackingXPCConnections];
  unsigned int v3 = [v2 containsObject:*(void *)(a1 + 40)];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) _trackingXPCConnections];
    [v4 removeObject:*(void *)(a1 + 40)];
  }
  id v5 = [*(id *)(a1 + 32) _xpcConnections];
  unsigned int v6 = [v5 containsObject:*(void *)(a1 + 40)];

  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) _xpcConnections];
    [v7 removeObject:*(void *)(a1 + 40)];
  }
}

id sub_100007680(uint64_t a1)
{
  return [*(id *)(a1 + 32) _stopTrackerIfNoLongerNeeded];
}

void sub_100007780(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100007798(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _trackingXPCConnections];
  id v3 = [v2 count];

  if (!v3) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

uint64_t sub_1000080A0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void *sub_100008358(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100054D78)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100008498;
    void v5[4] = &unk_100048BC0;
    v5[5] = v5;
    long long v6 = off_100048BA8;
    uint64_t v7 = 0;
    qword_100054D78 = _sl_dlopen();
    id v3 = (void *)v5[0];
    int v2 = (void *)qword_100054D78;
    if (qword_100054D78)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  int v2 = (void *)qword_100054D78;
LABEL_5:
  uint64_t result = dlsym(v2, "AXDevicePrimeDisplayManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054D70 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100008498()
{
  uint64_t result = _sl_dlopen();
  qword_100054D78 = result;
  return result;
}

uint64_t start()
{
  v0 = AXSSLogForCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    sub_10002C92C(v0);
  }

  id v1 = objc_opt_new();
  [v1 startDaemon];
  int v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10002C8E8(v2);
  }

  return 0;
}

id sub_100008B98()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100054D80;
  uint64_t v7 = qword_100054D80;
  if (!qword_100054D80)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000BFCC;
    v3[3] = &unk_100048B88;
    v3[4] = &v4;
    sub_10000BFCC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_100008C64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100008E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_10000A41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_10000BD60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
}

Class sub_10000BFCC(uint64_t a1)
{
  sub_10000C024();
  Class result = objc_getClass("ARFaceTrackingConfiguration");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100054D80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000C750();
    return (Class)sub_10000C024();
  }
  return result;
}

uint64_t sub_10000C024()
{
  v3[0] = 0;
  if (!qword_100054D88)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10000C124;
    v3[4] = &unk_100048BC0;
    void v3[5] = v3;
    long long v4 = off_100048BE0;
    uint64_t v5 = 0;
    qword_100054D88 = _sl_dlopen();
  }
  uint64_t v0 = qword_100054D88;
  id v1 = (void *)v3[0];
  if (!qword_100054D88)
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

uint64_t sub_10000C124()
{
  uint64_t result = _sl_dlopen();
  qword_100054D88 = result;
  return result;
}

Class sub_10000C198(uint64_t a1)
{
  sub_10000C024();
  Class result = objc_getClass("ARSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100054D90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000C778();
    return (Class)sub_10000C1F0(v3);
  }
  return result;
}

Class sub_10000C1F0(uint64_t a1)
{
  sub_10000C024();
  Class result = objc_getClass("ARFaceAnchor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100054D98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000C7A0();
    return (Class)sub_10000C248(v3);
  }
  return result;
}

void *sub_10000C248(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARNoseRidgeTip");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C298(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationTongueOut");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C2E8(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationMouthSmileLeft");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C338(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationMouthSmileRight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C388(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationJawOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C3D8(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationMouthClose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C428(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationBrowOuterUpLeft");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C478(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationBrowOuterUpRight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C4C8(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationMouthPucker");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C518(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationEyeBlinkLeft");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DE8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10000C568(uint64_t a1)
{
  int v2 = (void *)sub_10000C024();
  Class result = dlsym(v2, "ARBlendShapeLocationEyeBlinkRight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054DF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10000C5CC()
{
  sub_10000C5B8();
  uint64_t v3 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "ARKitCameraInputSource:_captureSessionRuntimeErrorNotification: userInfo: %@, error: %@", v2, 0x16u);
}

void sub_10000C648(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 _avCaptureSessionInterruptionReason];
  sub_10000C5B8();
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "ARKitCameraInputSource:_captureSessionWasInterruptedNotification: sessionInterruptionReason: %ld, systemPressureState: %@", v5, 0x16u);
}

void sub_10000C6D8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "ARKitCameraInputSource:session:didFailWithError: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_10000C750()
{
  uint64_t v0 = abort_report_np();
  return sub_10000C778(v0);
}

uint64_t sub_10000C778()
{
  uint64_t v0 = abort_report_np();
  return sub_10000C7A0(v0);
}

AXMTFixedCountQueue *sub_10000C7A0()
{
  uint64_t v0 = (AXMTFixedCountQueue *)abort_report_np();
  return [(AXMTFixedCountQueue *)v0 initWithMaxCount:v2];
}

void sub_10000D728(uint64_t a1)
{
  unint64_t v2 = +[AXMTUtilities sharedInstance];
  [v2 screenBoundsAccountingForInterfaceOrientation];
  double v6 = AXMTConstrainPointWithinBounds(*(double *)(a1 + 40), *(double *)(a1 + 48), v3, v4, v5);
  double v8 = v7;

  v9 = AXSSLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v11 = 134218240;
    double v12 = v6;
    __int16 v13 = 2048;
    double v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "arKitCameraInputSource: didReceivePoint: point is (%f, %f)", (uint8_t *)&v11, 0x16u);
  }

  v10 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v10, "lookAtPointTracker:trackedOnScreenPoint:", *(void *)(a1 + 32), v6, v8);
}

void sub_10000D8C8(uint64_t a1)
{
  unint64_t v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
    int v5 = 138412290;
    double v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "arKitCameraInputSource: didReceiveExpressionStart: called for expression: %@", (uint8_t *)&v5, 0xCu);
  }
  double v4 = [*(id *)(a1 + 32) delegate];
  [v4 lookAtPointTracker:*(void *)(a1 + 32) expressionStarted:*(void *)(a1 + 40)];
}

void sub_10000DA1C(uint64_t a1)
{
  unint64_t v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
    int v5 = 138412290;
    double v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "arKitCameraInputSource:didReceiveExpressionEnd: called for expression: %@", (uint8_t *)&v5, 0xCu);
  }
  double v4 = [*(id *)(a1 + 32) delegate];
  [v4 lookAtPointTracker:*(void *)(a1 + 32) expressionEnded:*(void *)(a1 + 40)];
}

void sub_10000DB70(uint64_t a1)
{
  unint64_t v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000DF20(v2);
  }

  double v3 = [*(id *)(a1 + 32) delegate];
  [v3 lookAtPointTrackerWasInterrupted:*(void *)(a1 + 32)];
}

void sub_10000DBEC(id a1)
{
  SEL v1 = AXSSLogForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_10000DF64(v1);
  }
}

void sub_10000DCCC(uint64_t a1)
{
  unint64_t v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10000DFA8(a1, v2);
  }

  double v3 = [*(id *)(a1 + 40) delegate];
  [v3 lookAtPointTracker:*(void *)(a1 + 40) didFailToTrackFaceWithError:*(void *)(a1 + 32)];
}

void sub_10000DF20(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "arKitCameraInputSourceWasInterrupted", v1, 2u);
}

void sub_10000DF64(os_log_t log)
{
  *(_WORD *)SEL v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "arKitCameraInputSourceInterruptionEnded", v1, 2u);
}

void sub_10000DFA8(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "arKitCameraInputSource: didFailToTrackFaceWithError: %@", (uint8_t *)&v3, 0xCu);
}

id sub_10000E80C(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) _videoPreviewBounds];
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  if (v3 != CGSizeZero.width || v4 != CGSizeZero.height)
  {
    double v10 = v3;
    double v11 = v4;
    +[CATransaction begin];
    +[CATransaction setValue:&__kCFBooleanTrue forKey:kCATransactionDisableActions];
    v40.origin.x = NSZeroRect.origin.x;
    v40.origin.y = NSZeroRect.origin.y;
    v40.size.width = NSZeroRect.size.width;
    v40.size.height = NSZeroRect.size.height;
    if (NSEqualRects(*(NSRect *)(a1 + 40), v40))
    {
      double v12 = [*(id *)(a1 + 32) _trackingAreaShapeLayer];
      [v12 setPath:0];
    }
    else
    {
      CGRect v39 = VNImageRectForNormalizedRect(*(CGRect *)(a1 + 40), (unint64_t)v10, (unint64_t)v11);
      CGPathRef v13 = CGPathCreateWithRect(v39, 0);
      if (v13)
      {
        CGPathRef v14 = v13;
        v15 = [*(id *)(a1 + 32) _trackingAreaShapeLayer];
        [v15 setPath:v14];

        CFRelease(v14);
      }
    }
    v16 = [*(id *)(a1 + 32) _multiPointsOfInterest];
    [v16 removeAllObjects];

    v17 = [*(id *)(a1 + 32) _multiPointsOfInterestShapeLayers];
    [v17 makeObjectsPerformSelector:"removeFromSuperlayer"];

    v18 = [*(id *)(a1 + 32) _multiPointsOfInterestShapeLayers];
    [v18 removeAllObjects];

    v38.x = NSZeroPoint.x;
    v38.y = NSZeroPoint.y;
    BOOL v19 = NSEqualPoints(*(NSPoint *)(a1 + 72), v38);
    v20 = *(void **)(a1 + 32);
    if (v19)
    {
      v21 = [v20 _previousPointsOfInterest];
      [v21 removeAllObjects];

      v22 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
      [v22 makeObjectsPerformSelector:"removeFromSuperlayer"];

      v23 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
      [v23 removeAllObjects];

      v24 = [*(id *)(a1 + 32) _pointOfInterestShapeLayer];
      [v24 setHidden:1];
    }
    else
    {
      v25 = [v20 _pointOfInterestShapeLayer];
      [v25 setHidden:0];

      double v26 = v10 * *(double *)(a1 + 72);
      double v27 = v11 * *(double *)(a1 + 80);
      v28 = [*(id *)(a1 + 32) _pointOfInterestShapeLayer];
      objc_msgSend(v28, "setPosition:", v26, v27);

      v29 = [*(id *)(a1 + 32) _previousPointsOfInterest];
      id v30 = [v29 count];

      if (v30 == (id)20)
      {
        v31 = [*(id *)(a1 + 32) _previousPointsOfInterest];
        [v31 removeObjectAtIndex:0];
      }
      v32 = [*(id *)(a1 + 32) _previousPointsOfInterest];
      v33 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", *(double *)(a1 + 72), *(double *)(a1 + 80));
      [v32 addObject:v33];

      v34 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
      [v34 makeObjectsPerformSelector:"removeFromSuperlayer"];

      v35 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
      [v35 removeAllObjects];

      v36 = [*(id *)(a1 + 32) _previousPointsOfInterest];
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_10000EB84;
      v37[3] = &unk_100048C40;
      v37[4] = *(void *)(a1 + 32);
      v37[5] = v6;
      v37[6] = v8;
      *(double *)&v37[7] = v10;
      *(double *)&v37[8] = v11;
      [v36 enumerateObjectsUsingBlock:v37];
    }
    return +[CATransaction commit];
  }
  return result;
}

void sub_10000EB84(uint64_t a1, void *a2)
{
  [a2 pointValue];
  objc_msgSend((id)objc_opt_class(), "_layerForPointOfInterestAtPosition:previous:bounds:", 1, v3, v4, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
  [v5 addObject:v7];

  uint64_t v6 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
  [v6 addSublayer:v7];
}

id sub_10000ECCC(uint64_t a1)
{
  uint64_t v2 = &AXDeviceIsPad_ptr;
  +[CATransaction begin];
  +[CATransaction setValue:&__kCFBooleanTrue forKey:kCATransactionDisableActions];
  double v3 = [*(id *)(a1 + 32) _previousPointsOfInterest];
  [v3 removeAllObjects];

  double v4 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
  [v4 makeObjectsPerformSelector:"removeFromSuperlayer"];

  uint64_t v5 = [*(id *)(a1 + 32) _previousPointOfInterestShapeLayers];
  [v5 removeAllObjects];

  uint64_t v6 = [*(id *)(a1 + 32) _multiPointsOfInterestShapeLayers];
  [v6 makeObjectsPerformSelector:"removeFromSuperlayer"];

  id v7 = [*(id *)(a1 + 32) _multiPointsOfInterestShapeLayers];
  [v7 removeAllObjects];

  uint64_t v8 = [*(id *)(a1 + 32) _multiPointsOfInterest];
  [v8 removeAllObjects];

  v9 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    [v9 _videoPreviewBounds];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

    Mutable = CGPathCreateMutable();
    [*(id *)(a1 + 40) imageSize];
    double v21 = v20;
    double v23 = v22;
    [*(id *)(a1 + 40) boundingBoxInImageCoordinates];
    double v25 = v24 / v21;
    double v27 = v26 / v23;
    double v29 = v28 / v21;
    double v31 = v30 / v23;
    [*(id *)(a1 + 32) _videoPreviewBounds];
    v106.origin.x = v25 * v32;
    v106.origin.y = v27 * v33;
    v106.size.width = v29 * v32;
    v106.size.height = v31 * v33;
    CGPathAddRect(Mutable, 0, v106);
    v34 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    [v34 setPath:Mutable];

    CFRelease(Mutable);
    v35 = [*(id *)(a1 + 40) landmarkPointsInImageCoordinates];
    v100[0] = _NSConcreteStackBlock;
    v100[1] = 3221225472;
    v100[2] = sub_10000F2CC;
    v100[3] = &unk_100048C90;
    double v103 = v21;
    double v104 = v23;
    id v36 = *(id *)(a1 + 40);
    uint64_t v37 = *(void *)(a1 + 32);
    id v101 = v36;
    uint64_t v102 = v37;
    [v35 enumerateObjectsUsingBlock:v100];

    [*(id *)(a1 + 40) pose];
    LODWORD(v21) = AXMTYawUsingPose(v38, v39, v40);
    [*(id *)(a1 + 40) pose];
    LODWORD(v23) = AXMTPitchUsingPose(v41, v42, v43);
    [*(id *)(a1 + 40) pose];
    LODWORD(v25) = AXMTRollUsingPose(v44, v45);
    v46 = [*(id *)(a1 + 32) _yawPitchRollTextLayer];
    v47 = +[NSString stringWithFormat:@"Yaw: %.05f, Pitch: %.05f, Roll: %.05f", *(float *)&v21, *(float *)&v23, *(float *)&v25];
    [v46 setString:v47];

    v48 = +[NSMutableString string];
    v49 = [*(id *)(a1 + 40) expressions];
    v50 = [v49 allKeys];
    v51 = [v50 sortedArrayUsingSelector:"compare:"];

    long long v98 = 0u;
    long long v99 = 0u;
    long long v96 = 0u;
    long long v97 = 0u;
    id v52 = v51;
    id v53 = [v52 countByEnumeratingWithState:&v96 objects:v105 count:16];
    if (v53)
    {
      id v54 = v53;
      uint64_t v55 = *(void *)v97;
      do
      {
        v56 = 0;
        do
        {
          if (*(void *)v97 != v55) {
            objc_enumerationMutation(v52);
          }
          uint64_t v57 = *(void *)(*((void *)&v96 + 1) + 8 * (void)v56);
          [*(id *)(a1 + 40) expressions];
          v59 = uint64_t v58 = a1;
          v60 = [v59 objectForKeyedSubscript:v57];
          [v60 floatValue];
          float v62 = v61;

          a1 = v58;
          v63 = +[NSString stringWithFormat:@"%@: %.05f\n", v57, v62];
          [v48 appendString:v63];

          v56 = (char *)v56 + 1;
        }
        while (v54 != v56);
        id v54 = [v52 countByEnumeratingWithState:&v96 objects:v105 count:16];
      }
      while (v54);
    }

    v64 = [*(id *)(a1 + 32) _expressionValuesTextLayer];
    [v64 setString:v48];

    v65 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    [v65 frame];
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [*(id *)(a1 + 32) _expressionValuesTextLayer];
    objc_msgSend(v74, "setFrame:", v67, v69, v71, v73);

    v75 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    [v75 frame];
    double v77 = v76;
    v78 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    [v78 frame];
    double v80 = v79 + -50.0;
    v81 = [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    [v81 frame];
    double v83 = v82;
    [*(id *)(a1 + 32) _detectedFaceRectangleShapeLayer];
    v85 = uint64_t v84 = a1;
    [v85 frame];
    double v87 = v86;
    v88 = [*(id *)(v84 + 32) _yawPitchRollTextLayer];
    objc_msgSend(v88, "setFrame:", v77, v80, v83, v87);

    v89 = [*(id *)(v84 + 32) _detectedFaceRectangleShapeLayer];
    [v89 bounds];
    double MidX = CGRectGetMidX(v107);
    v91 = [*(id *)(v84 + 32) _detectedFaceRectangleShapeLayer];
    [v91 bounds];
    double MinY = CGRectGetMinY(v108);
    v93 = [*(id *)(v84 + 32) _expressionValuesTextLayer];
    objc_msgSend(v93, "setPosition:", MidX, MinY);

    [*(id *)(v84 + 32) _updateLayerGeometry];
    uint64_t v2 = &AXDeviceIsPad_ptr;
  }
  else
  {
    v94 = [v9 _detectedFaceRectangleShapeLayer];
    [v94 setPath:0];
  }
  return [v2[227] commit];
}

void sub_10000F2CC(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 pointValue];
  double v5 = v4 / *(double *)(a1 + 48);
  double v7 = 1.0 - v6 / *(double *)(a1 + 56);
  uint64_t v8 = [*(id *)(a1 + 32) pointForLandmark:@"NoseBaseCenter"];
  unsigned int v9 = [v3 isEqualToValue:v8];

  double v10 = objc_opt_class();
  [*(id *)(a1 + 40) _videoPreviewBounds];
  objc_msgSend(v10, "_layerForPointOfInterestAtPosition:previous:bounds:", v9 ^ 1, v5, v7, v11, v12, v13, v14);
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    double v15 = [*(id *)(a1 + 40) _multiPointsOfInterest];
    double v16 = +[NSValue valueWithPoint:](NSValue, "valueWithPoint:", v5, v7);
    [v15 addObject:v16];

    double v17 = [*(id *)(a1 + 40) _multiPointsOfInterestShapeLayers];
    [v17 addObject:v19];

    v18 = [*(id *)(a1 + 40) _detectedFaceRectangleShapeLayer];
    [v18 addSublayer:v19];
  }
}

uint64_t sub_10000F700(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000FB18(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[AXMTVideoPreviewLayer drawSample:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: invalid sample! test: %@", (uint8_t *)&v2, 0x16u);
}

uint64_t AXMTConvertFromDeviceToInterfaceOrientation(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 4) {
    return 0;
  }
  return result;
}

double AXMTConstrainPointWithinBounds(double result, double a2, double a3, double a4, double a5)
{
  if (result < a3) {
    id result = a3;
  }
  double v5 = a3 + a5;
  if (result >= v5) {
    return v5;
  }
  return result;
}

float AXMTYawUsingPose(double a1, double a2, float a3)
{
  return -asinf(a3);
}

float AXMTPitchUsingPose(double a1, double a2, float32x4_t a3)
{
  return atanf(COERCE_FLOAT(vdivq_f32(a3, (float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&a3, 2)).i32[1]));
}

float AXMTRollUsingPose(float32x4_t a1, float32x4_t a2)
{
  return atanf(vdivq_f32(a2, a1).f32[0]);
}

__n128 AXMTVector3FromArray(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectAtIndexedSubscript:0];
  [v2 floatValue];
  unsigned __int32 v11 = v3;
  __int16 v4 = [v1 objectAtIndexedSubscript:1];
  [v4 floatValue];
  unsigned __int32 v10 = v5;
  double v6 = [v1 objectAtIndexedSubscript:2];

  [v6 floatValue];
  unsigned __int32 v9 = v7;

  result.n128_u32[0] = v11;
  result.n128_u32[1] = v10;
  result.n128_u32[2] = v9;
  return result;
}

__n128 AXMTMatrix3x3FromArray(void *a1)
{
  id v1 = a1;
  int v2 = [v1 objectAtIndexedSubscript:0];
  __n128 v8 = AXMTVector3FromArray(v2);
  unsigned __int32 v3 = [v1 objectAtIndexedSubscript:1];
  __n128 v7 = AXMTVector3FromArray(v3);
  __int16 v4 = [v1 objectAtIndexedSubscript:2];

  unsigned __int32 v6 = AXMTVector3FromArray(v4).n128_u32[0];
  result.n128_u64[0] = vzip1q_s32((int32x4_t)v8, (int32x4_t)v7).u64[0];
  result.n128_u32[2] = v6;
  return result;
}

double AXMTEulerAnglesFromMatrix(__n128 a1, __n128 a2, __n128 a3)
{
  if (a3.n128_f32[1] >= 1.0)
  {
    atan2f(-a1.n128_f32[2], -a2.n128_f32[2]);
    LODWORD(v3) = -1077342245;
LABEL_6:
    HIDWORD(v3) = 0;
    return v3;
  }
  if (a3.n128_f32[1] <= -1.0)
  {
    atan2f(a1.n128_f32[2], a2.n128_f32[2]);
    LODWORD(v3) = 1070141403;
    goto LABEL_6;
  }
  __n128 v6 = a3;
  float v7 = a2.n128_f32[1];
  float v5 = a1.n128_f32[1];
  float v8 = asinf(-a3.n128_f32[1]);
  v6.n128_u32[0] = atan2f(v6.n128_f32[0], v6.n128_f32[2]);
  atan2f(v5, v7);
  return COERCE_DOUBLE(__PAIR64__(v6.n128_u32[0], LODWORD(v8)));
}

float AXMTAdjustIntrinsicsForViewportSize(float result, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if (fabs(a7) >= 2.22044605e-16)
  {
    double v7 = fabs(a5);
    double v8 = fabs(a4);
    double v9 = fabs(a6);
    BOOL v10 = a5 == a7 && a4 == a6;
    BOOL v11 = v10 || v7 < 2.22044605e-16;
    BOOL v12 = v11 || v8 < 2.22044605e-16;
    if (!v12 && v9 >= 2.22044605e-16)
    {
      double v14 = result;
      BOOL v11 = a6 / a7 < a4 / a5;
      double v15 = a6 / a4;
      if (v11) {
        double v15 = a7 / a5;
      }
      return v15 * v14;
    }
  }
  return result;
}

id AXMTLookAtPointTrackerClass(void *a1)
{
  id v1 = a1;
  int v2 = v1;
  if (v1)
  {
    if (([v1 isCamera] & 1) != 0 || objc_msgSend(v2, "isVideoFile"))
    {
      double v3 = AXSSLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "AXMTLookAtPointTrackerClass: using AXMTCameraBasedLookAtPointTracker", v7, 2u);
      }
    }
    else if (![v2 isHIDDevice])
    {
      __int16 v4 = 0;
      goto LABEL_8;
    }
    __int16 v4 = objc_opt_class();
LABEL_8:
    id v5 = v4;
    goto LABEL_10;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

id AXMTCreateLookAtPointTracker(void *a1, uint64_t a2)
{
  id v3 = a1;
  if ((v3 || _AXSMossdeepEnabled()) && (__int16 v4 = (objc_class *)AXMTLookAtPointTrackerClass(v3)) != 0) {
    id v5 = [[v4 alloc] initWithInput:v3 trackingType:a2];
  }
  else {
    id v5 = 0;
  }

  return v5;
}

CGFloat AXMTScreenPointForHIDPoint(uint64_t a1, uint64_t a2, void *a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  if (a1 == 0x7FFFFFFF && a2 == 0x7FFFFFFF)
  {
    if (a3)
    {
      *a3 = +[NSError errorWithDomain:AXSSMotionTrackingErrorDomain code:1 userInfo:0];
    }
    return NSZeroPoint.x;
  }
  else
  {
    double v11 = fmin(fmax(a4, 0.0), 1.0);
    if (a1 == 0x7FFFFFFF) {
      double v11 = a6;
    }
    return a10 * v11;
  }
}

void AXMTLogFPS()
{
  if (qword_100054E08 != -1) {
    dispatch_once(&qword_100054E08, &stru_100048CC8);
  }
  id v1 = +[NSString stringWithFormat:@"AXMTLogFPS: recorded FPS: %ld", qword_100054E00];
  if ([(id)qword_100054DF8 logString:v1]) {
    uint64_t v0 = 0;
  }
  else {
    uint64_t v0 = qword_100054E00 + 1;
  }
  qword_100054E00 = v0;
}

void sub_100010834(id a1)
{
  id v1 = objc_alloc((Class)AXSSRateLimitingLogger);
  AXSSLogForCategory();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [v1 initWithLogLevel:1 categoryLog:v4 timeInterval:1.0];
  id v3 = (void *)qword_100054DF8;
  qword_100054DF8 = (uint64_t)v2;
}

void sub_100010904(id a1)
{
  id v1 = objc_alloc((Class)NSUserDefaults);
  qword_100054E10 = (uint64_t)[v1 initWithSuiteName:AXSSMotionTrackingPreferenceDomain];

  _objc_release_x1();
}

uint64_t sub_1000109F0()
{
  qword_100054E28 = objc_opt_new();

  return _objc_release_x1();
}

void sub_100010D30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100010D50()
{
  dispatch_time_t v0 = dispatch_time(0, 3000000000);

  dispatch_after(v0, (dispatch_queue_t)&_dispatch_main_q, &stru_100048E08);
}

void sub_100011584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000115A0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (v5)
  {
    __n128 v6 = AXSSLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10001384C();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _handleAccelerometerDataUpdate:a2];
  }
}

void sub_10001161C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000116C8;
  v6[3] = &unk_100048928;
  v6[4] = WeakRetained;
  id v7 = v3;
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

id sub_1000116C8(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) orientation];

  return [v1 _interfaceOrientationChanged:v2];
}

id sub_1000119E0(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deviceOrientationChanged:*(void *)(a1 + 40)];
}

id sub_1000119EC(uint64_t a1)
{
  return [*(id *)(a1 + 32) _accelerometerDataUpdated:*(void *)(a1 + 40)];
}

void sub_100011FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011FD0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  unsigned int v2 = [WeakRetained orientationLocked];
  [WeakRetained _checkBackboardOrientationLockStatus];
  if (v2 && ([WeakRetained orientationLocked] & 1) == 0)
  {
    id v3 = AXSSLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      sub_100013A90(v3, v4, v5, v6, v7, v8, v9, v10);
    }

    double v11 = [WeakRetained _motionManager];
    BOOL v12 = [v11 accelerometerData];
    [WeakRetained _handleAccelerometerDataUpdate:v12];
  }
}

void sub_1000122E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100012304(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _checkBackboardEffectiveDeviceOrientation];
}

id sub_100012644(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateScreenBounds];
}

void sub_100012C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_100012C80(id a1)
{
  id v1 = (void *)qword_100054E30;
  qword_100054E30 = (uint64_t)&off_100049EA0;
}

void sub_100012C98(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  uint64_t v6 = [v10 objectForKeyedSubscript:sub_100012D84()];

  if (!v6)
  {
    *a4 = 1;
LABEL_7:
    uint64_t v9 = v10;
    goto LABEL_8;
  }
  uint64_t v7 = [v10 objectForKeyedSubscript:sub_100012D84()];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v7 intValue];

  int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  if (v8 == 4)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 2;
    goto LABEL_7;
  }
  uint64_t v9 = v10;
  if (v8 == 2) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_8:
}

uint64_t sub_100012D84()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054E78;
  uint64_t v7 = qword_100054E78;
  if (!qword_100054E78)
  {
    id v1 = (void *)sub_100013278();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_FailureType");
    qword_100054E78 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    id v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

id sub_100012E7C(uint64_t a1, void *a2)
{
  id v3 = *(id *)(a1 + 40);
  id result = [a2 integerValue];
  if (v3 == result) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *(void *)(a1 + 40);
  }
  return result;
}

void *sub_100013010(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100054E48)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100013150;
    void v5[4] = &unk_100048BC0;
    v5[5] = v5;
    long long v6 = off_100048DF0;
    uint64_t v7 = 0;
    qword_100054E48 = _sl_dlopen();
    id v3 = (void *)v5[0];
    unsigned int v2 = (void *)qword_100054E48;
    if (qword_100054E48)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  unsigned int v2 = (void *)qword_100054E48;
LABEL_5:
  id result = dlsym(v2, "AXDeviceGetMainScreenBounds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054E40 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100013150()
{
  uint64_t result = _sl_dlopen();
  qword_100054E48 = result;
  return result;
}

void sub_1000131C4(id a1)
{
  id v1 = AXSSLogForCategory();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100013C54(v1, v2, v3, v4, v5, v6, v7, v8);
  }

  uint64_t v9 = +[AXMTUtilities sharedInstance];
  [v9 _updateScreenBounds];
}

void *sub_100013228(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100013278();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DataFailure");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054E50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100013278()
{
  v3[0] = 0;
  if (!qword_100054E58)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_100013378;
    v3[4] = &unk_100048BC0;
    void v3[5] = v3;
    long long v4 = off_100048E28;
    uint64_t v5 = 0;
    qword_100054E58 = _sl_dlopen();
  }
  uint64_t v0 = qword_100054E58;
  id v1 = (void *)v3[0];
  if (!qword_100054E58)
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

uint64_t sub_100013378()
{
  uint64_t result = _sl_dlopen();
  qword_100054E58 = result;
  return result;
}

void *sub_1000133EC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100013278();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DataFailureImageTooDark");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054E60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10001343C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100013278();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DataFailureSensorCovered");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054E68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10001348C(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100013278();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_TrackedFacesArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054E70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_1000134DC(uint64_t a1)
{
  uint64_t v2 = (void *)sub_100013278();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_FailureType");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054E78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10001352C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100013554(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100013588(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 88);
  int v3 = 136315394;
  long long v4 = "-[AXMTUtilities init]";
  __int16 v5 = 2048;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: overriding _currentDeviceOrientation to effective orientation: %ld", (uint8_t *)&v3, 0x16u);
}

void sub_100013618(void *a1, NSObject *a2)
{
  id v4 = [a1 bksEffectiveOrientation];
  __int16 v5 = [a1 _motionManager];
  uint64_t v6 = [v5 accelerometerData];
  unsigned int v7 = [a1 orientationLocked];
  CFStringRef v8 = @"NO";
  uint64_t v10 = "-[AXMTUtilities registerListener:needsPhysicalOrientationEvents:]";
  __int16 v11 = 2048;
  int v9 = 136315906;
  id v12 = v4;
  if (v7) {
    CFStringRef v8 = @"YES";
  }
  __int16 v13 = 2112;
  double v14 = v6;
  __int16 v15 = 2112;
  CFStringRef v16 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: overriding device orientation with effective orientation: %ld, accel data: %@, orientation locked: %@", (uint8_t *)&v9, 0x2Au);
}

void sub_10001372C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AXMTUtilities registerListener:needsPhysicalOrientationEvents:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: CMMotionManager's accelerometer is not available!", (uint8_t *)&v1, 0xCu);
}

void sub_1000137B0()
{
  sub_100013548();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEBUG, "AXMTUtilities:registerListener: %@, needsPhysicalOrientationEvents: %@", v2, 0x16u);
}

void sub_10001384C()
{
  v1[0] = 136315394;
  sub_100013574();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: acceleromter update error: %@", (uint8_t *)v1, 0x16u);
}

void sub_1000138CC()
{
  sub_100013548();
  sub_10001352C((void *)&_mh_execute_header, v0, v1, "AXMTUtilities:unregisterListener: %@", v2, v3, v4, v5, v6);
}

void sub_100013934(void *a1)
{
  [a1 currentDeviceOrientation];
  sub_100013554((void *)&_mh_execute_header, v1, v2, "%s: %ld", v3, v4, v5, v6, 2u);
}

void sub_1000139C4(void *a1, NSObject *a2)
{
  [a1 currentInterfaceOrientation];
  sub_100013548();
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "AXMTUtilities:_interfaceOrientationChanged: %ld", v3, 0xCu);
}

void sub_100013A4C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register for orientation lock notification", v1, 2u);
}

void sub_100013A90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013B08(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to register for backboard orientation notification", v1, 2u);
}

void sub_100013B4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100013BC4(double a1, double a2, double a3, double a4)
{
  uint64_t v4 = NSStringFromCGRect(*(CGRect *)&a1);
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v5, v6, "%s: updating to new screen bounds: %@", v7, v8, v9, v10, 2u);
}

void sub_100013C54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

double AXMTGeometryCentroidOfPoints(void *a1)
{
  id v1 = a1;
  id v2 = [v1 count];
  double x = CGPointZero.x;
  double y = CGPointZero.y;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v1;
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * (void)v9), "pointValue", (void)v13);
        double x = x + v10;
        double y = y + v11;
        uint64_t v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return x / (double)(unint64_t)v2;
}

double AXMTGeometryStandardDeviationOfPointsWithPrecalculatedCentroid(void *a1, double a2, double a3)
{
  id v5 = a1;
  id v6 = [v5 count];
  if (v6)
  {
    unint64_t v7 = (unint64_t)v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v19;
      double v12 = 0.0;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "pointValue", (void)v18);
          double v12 = v12 + (a3 - v15) * (a3 - v15) + (a2 - v14) * (a2 - v14);
        }
        id v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }
    else
    {
      double v12 = 0.0;
    }

    double v16 = sqrt(v12 / (double)v7);
  }
  else
  {
    double v16 = 0.0;
  }

  return v16;
}

id sub_100015B80(uint64_t a1)
{
  return [*(id *)(a1 + 32) _readTimerFired];
}

uint64_t sub_100015FDC(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 nextTimedMetadataGroup];
  if (v3) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return _objc_release_x1();
}

void sub_10001603C(uint64_t a1)
{
  id v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100016504(a1);
  }

  [*(id *)(a1 + 32) _playbackFinished];
  [*(id *)(a1 + 32) _tearDown];
  uint64_t v3 = +[AXMTVideoFilePlayManager shared];
  uint64_t v4 = [*(id *)(a1 + 32) input];
  [v3 videoPlayedWithInput:v4 success:1 error:0];
}

void sub_100016284(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1000162A0()
{
  sub_100013574();
  sub_100016284((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void sub_100016314(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 _fileURL];
  uint64_t v5 = [a1 _assetReader];
  int v6 = 136315650;
  unint64_t v7 = "-[AXMTVideoFileReader _bringUp]";
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: Reading asset %@ %@", (uint8_t *)&v6, 0x20u);
}

void sub_1000163E8(void *a1)
{
  uint64_t v1 = [a1 _fileURL];
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "%s: Playing %@", v4, v5, v6, v7, 2u);
}

void sub_100016478()
{
  v3[0] = 136315650;
  sub_100013574();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: Stopping playing because one of these is nil: sampleBufferRef: %@, timedMetadataGroups:%@", (uint8_t *)v3, 0x20u);
}

void sub_100016504(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _fileURL];
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "%s: Done playing %@", v4, v5, v6, v7, 2u);
}

void sub_100017D98(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    if ([v2 hasFace])
    {
      objc_msgSend(*(id *)(a1 + 40), "set_hasFace:", 1);
      uint64_t v3 = +[AXMTUtilities sharedInstance];
      id v4 = [v3 currentInterfaceOrientation];

      [*(id *)(a1 + 32) projectedPoint];
      double v7 = v5;
      switch((unint64_t)v4)
      {
        case 0uLL:
        case 1uLL:
        case 5uLL:
        case 6uLL:
          double v8 = -v5;
          double v7 = -v6;
          double v9 = 0.00271;
          double v10 = -157.7;
          double v11 = 0.228648;
          double v12 = 786.2;
          break;
        case 2uLL:
          double v9 = 0.05365;
          double v10 = -1162.523;
          double v11 = 3.61744;
          double v12 = -2517.86;
          double v8 = v5;
          double v7 = v6;
          break;
        case 3uLL:
          double v7 = -v5;
          double v9 = -0.453;
          double v10 = 422.247;
          double v11 = 1.26958;
          double v12 = -957.091;
          double v8 = v6;
          break;
        case 4uLL:
          double v8 = -v6;
          double v9 = 0.11439;
          double v10 = -1271.67;
          double v11 = 1.596754;
          double v12 = -290.996;
          break;
        default:
          double v12 = 0.0;
          double v11 = 0.0;
          double v10 = 0.0;
          double v8 = v6;
          double v9 = 0.0;
          break;
      }
      long long v13 = +[AXMTUtilities sharedInstance];
      [v13 screenBoundsAccountingForInterfaceOrientation];
      double v15 = v14;
      double v17 = v16;

      long long v18 = *(void **)(a1 + 40);
      [*(id *)(a1 + 32) pose];
      double v60 = v20;
      double v61 = v19;
      double v58 = v22;
      double v59 = v21;
      [*(id *)(a1 + 32) poseTranslation];
      objc_msgSend(v18, "_handleDetectedFaceWithProjectedPoint:pose:poseTranslation:", v7 + v10 + v15 * v9, v8 + v12 + v17 * v11, v61, v60, v59, v58, v23);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v24 = *(id *)(a1 + 32);
        double v25 = [v24 expressions];
        double v26 = [*(id *)(a1 + 40) _previousExpressions];
        double v27 = [*(id *)(a1 + 40) expressionConfiguration];
        id v74 = 0;
        id v75 = 0;
        double v28 = +[AXSSMotionTrackingExpressionConfiguration processIncomingExpressions:v25 previousExpressions:v26 expressionConfiguration:v27 startExpressionsOutSet:&v75 endExpressionsOutSet:&v74];
        id v29 = v75;
        id v30 = v74;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          id v29 = 0;
          id v30 = 0;
          double v28 = 0;
LABEL_25:
          long long v68 = 0u;
          long long v69 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v31 = v29;
          id v43 = [v31 countByEnumeratingWithState:&v66 objects:v77 count:16];
          if (v43)
          {
            id v44 = v43;
            uint64_t v45 = *(void *)v67;
            do
            {
              for (i = 0; i != v44; i = (char *)i + 1)
              {
                if (*(void *)v67 != v45) {
                  objc_enumerationMutation(v31);
                }
                v47 = *(void **)(*((void *)&v66 + 1) + 8 * i);
                v48 = [*(id *)(a1 + 40) delegate];
                objc_msgSend(v48, "lookAtPointTracker:expressionStarted:", *(void *)(a1 + 40), objc_msgSend(v47, "unsignedIntegerValue"));
              }
              id v44 = [v31 countByEnumeratingWithState:&v66 objects:v77 count:16];
            }
            while (v44);
          }

          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v49 = v30;
          id v50 = [v49 countByEnumeratingWithState:&v62 objects:v76 count:16];
          if (v50)
          {
            id v51 = v50;
            uint64_t v52 = *(void *)v63;
            do
            {
              for (j = 0; j != v51; j = (char *)j + 1)
              {
                if (*(void *)v63 != v52) {
                  objc_enumerationMutation(v49);
                }
                id v54 = *(void **)(*((void *)&v62 + 1) + 8 * (void)j);
                uint64_t v55 = [*(id *)(a1 + 40) delegate];
                objc_msgSend(v55, "lookAtPointTracker:expressionEnded:", *(void *)(a1 + 40), objc_msgSend(v54, "unsignedIntegerValue"));
              }
              id v51 = [v49 countByEnumeratingWithState:&v62 objects:v76 count:16];
            }
            while (v51);
          }

          id v56 = [v28 copy];
          objc_msgSend(*(id *)(a1 + 40), "set_previousExpressions:", v56);

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v57 = [*(id *)(a1 + 40) _videoPreviewLayer];
            [v57 renderFaceKitResult:*(void *)(a1 + 32)];
          }
          goto LABEL_42;
        }
        id v39 = *(id *)(a1 + 32);
        double v25 = v39;
        if (v39)
        {
          [v39 expressions];
        }
        else
        {
          uint64_t v73 = 0;
          memset(v72, 0, sizeof(v72));
        }
        double v26 = [*(id *)(a1 + 40) _previousExpressions];
        double v27 = [*(id *)(a1 + 40) expressionConfiguration];
        id v70 = 0;
        id v71 = 0;
        double v28 = +[AXSSMotionTrackingExpressionConfiguration processExclaveDetectedExpressions:v72 previousExpressions:v26 expressionConfiguration:v27 startExpressionsOutSet:&v71 endExpressionsOutSet:&v70];
        id v29 = v71;
        id v30 = v70;
      }

      goto LABEL_25;
    }
    id v31 = [*(id *)(a1 + 32) error];
    if ([*(id *)(a1 + 40) _hasFace])
    {
      double v32 = AXSSLogForCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        sub_10001A890((uint64_t)v31, v32, v33, v34, v35, v36, v37, v38);
      }

      objc_msgSend(*(id *)(a1 + 40), "set_hasFace:", 0);
    }
    else
    {
      float v40 = [*(id *)(a1 + 40) _error];
      unsigned __int8 v41 = [v40 isEqual:v31];

      if (v41)
      {
LABEL_16:
        [*(id *)(a1 + 40) _clearVideoPreviewLayer];
LABEL_42:

        return;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "set_error:", v31);
    double v42 = [*(id *)(a1 + 40) delegate];
    [v42 lookAtPointTrackerLostFace:*(void *)(a1 + 40) error:v31];

    goto LABEL_16;
  }
}

void sub_1000184F8(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_10001850C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:error:", 0, *(void *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void sub_100018860(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_100018874(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalTrackedImageRelativePoint:inBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_100018DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
}

void sub_100018DE4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_1000190F0(_Unwind_Exception *a1)
{
  objc_destroyWeak((id *)(v1 - 136));
  _Unwind_Resume(a1);
}

void sub_100019104(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_100019510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_10001952C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_100019E04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100019E18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = AXSSLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10001A97C(a1);
  }

  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_100019F70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void sub_100019F84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_signalTrackedUnboundedOnScreenPoint:boundPoint:", 1, *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void sub_10001A408(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10001A438(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A4B0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A5A0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A5D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A610(void *a1)
{
  [a1 floatValue];
  sub_10001A424();
  sub_100013554((void *)&_mh_execute_header, v1, v2, "%s: using pitch: %f", v3, v4, v5, v6, 2u);
}

void sub_10001A698(void *a1)
{
  [a1 floatValue];
  sub_10001A424();
  sub_100013554((void *)&_mh_execute_header, v1, v2, "%s: using yaw: %f", v3, v4, v5, v6, 2u);
}

void sub_10001A720(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AXMTCameraBasedLookAtPointTracker _storeCalibrationValuesToDefaults]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: uniqueIdentifier was nil, could not store calibration values", (uint8_t *)&v1, 0xCu);
}

void sub_10001A7A4(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 _calibratedYaw];
  [v4 floatValue];
  double v6 = v5;
  double v7 = [a1 _calibratedPitch];
  [v7 floatValue];
  int v9 = 136315650;
  double v10 = "-[AXMTCameraBasedLookAtPointTracker _storeCalibrationValuesToDefaults]";
  __int16 v11 = 2048;
  double v12 = v6;
  __int16 v13 = 2048;
  double v14 = v8;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: storing yaw: %f, pitch: %f", (uint8_t *)&v9, 0x20u);
}

void sub_10001A890(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001A8FC()
{
  v1[0] = 136315394;
  sub_100013574();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: AXMTCameraBasedLookAtPointTracker: lost face %@", (uint8_t *)v1, 0x16u);
}

void sub_10001A97C(uint64_t a1)
{
  int v1 = NSStringFromPoint(*(NSPoint *)(a1 + 40));
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "%s: %@", v4, v5, v6, v7, 2u);
}

double AXMTMathStandardDeviationOfValuesWithPrecalculatedMean(void *a1, double a2)
{
  id v3 = a1;
  double v4 = 0.0;
  if ((unint64_t)[v3 count] >= 2)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        int v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * (void)v9), "doubleValue", (void)v12);
          double v4 = v4 + (v10 - a2) * (v10 - a2);
          int v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    double v4 = sqrt(v4 / (double)(unint64_t)[v5 count]);
  }

  return v4;
}

id sub_10001AD94(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLookAtPoint:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 _stateUpdated];
}

id sub_10001AE80(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateLookAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (*(void *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "set_error:");
    uint64_t v2 = AXSSLogForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_10001BD80((uint64_t *)(a1 + 40), v2);
    }
  }
  return [*(id *)(a1 + 32) _stateUpdated];
}

void sub_10001B02C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _expressions];
  id v6 = [v2 mutableCopy];

  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v6 addObject:v3];

  double v4 = *(void **)(a1 + 32);
  id v5 = [v6 copy];
  [v4 _updateExpressions:v5];

  [*(id *)(a1 + 32) _stateUpdated];
}

void sub_10001B208(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _expressions];
  id v6 = [v2 mutableCopy];

  id v3 = +[NSNumber numberWithUnsignedInteger:*(void *)(a1 + 40)];
  [v6 removeObject:v3];

  double v4 = *(void **)(a1 + 32);
  id v5 = [v6 copy];
  [v4 _updateExpressions:v5];

  [*(id *)(a1 + 32) _stateUpdated];
}

void sub_10001B3D4(uint64_t a1)
{
  id v8 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_updateLookAtPoint:", AXSSMotionTrackingInvalidPoint[0], AXSSMotionTrackingInvalidPoint[1]);
  id v2 = v8;
  if (!v8)
  {
    id v3 = objc_alloc((Class)NSError);
    id v2 = [v3 initWithDomain:AXSSMotionTrackingErrorDomain code:0 userInfo:0];
  }
  id v9 = v2;
  uint64_t v4 = [*(id *)(a1 + 40) _error];
  if (!v4
    || (id v5 = (void *)v4,
        [*(id *)(a1 + 40) _error],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 isEqual:v9],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    [*(id *)(a1 + 40) _updateError:v9];
  }
  [*(id *)(a1 + 40) _stateUpdated];
}

id sub_10001B58C(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateError:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 32);

  return [v2 _stateUpdated];
}

void sub_10001B678(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _error];

  if (!v2)
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = objc_alloc((Class)NSError);
    id v5 = [v4 initWithDomain:AXSSMotionTrackingErrorDomain code:10 userInfo:0];
    [v3 _updateError:v5];

    id v6 = *(void **)(a1 + 32);
    [v6 _stateUpdated];
  }
}

void sub_10001BD80(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  id v4 = "-[AXMTLookAtPointTrackerObserver lookAtPointTracker:trackedOnScreenPoint:error:]_block_invoke";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s: error: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001BE10(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTLookAtPointTrackerObserver: Found Face!", v1, 2u);
}

void sub_10001BE54(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "AXMTLookAtPointTrackerObserver: Lost Face! %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001BECC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "AXMTLookAtPointTrackerObserver: Failed to track face! %@", (uint8_t *)&v2, 0xCu);
}

void sub_10001BF44(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTLookAtPointTrackerDelegate: Interrupted!", v1, 2u);
}

void sub_10001C4D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001C52C(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _deviceNotification:v5 added:a3];
}

void sub_10001C598(uint64_t a1, void *a2, void *a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a3;
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  [WeakRetained _elementUpdated:v5 forDevice:v6];
}

void sub_10001C95C(uint64_t a1)
{
  id v2 = +[NSNumber numberWithInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  [*(id *)(a1 + 32) _setCurrentFrequency:v2];
}

void sub_10001CADC(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  id v3 = [*(id *)(a1 + 32) _currentStatus];
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 4uLL && v2 != v3)
  {
    id v5 = AXSSLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [*(id *)(a1 + 32) _currentStatus];
      uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v16 = 136315650;
      double v17 = "-[AXMTHIDBasedLookAtPointTracker _statusHIDElementUpdated:forDevice:]_block_invoke";
      __int16 v18 = 2048;
      id v19 = v6;
      __int16 v20 = 2048;
      uint64_t v21 = v7;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%s: changing status from %lu to %lu", (uint8_t *)&v16, 0x20u);
    }

    [*(id *)(a1 + 32) _setCurrentStatus:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    if (v8 == 2)
    {
      id v9 = [*(id *)(a1 + 32) _initializationTimer];
      unsigned int v10 = [v9 isValid];

      if (!v10)
      {
        uint64_t v13 = AXSSMotionTrackingErrorDomain;
        uint64_t v14 = 14;
LABEL_17:
        long long v15 = +[NSError errorWithDomain:v13 code:v14 userInfo:0];
        [*(id *)(a1 + 32) _failedToTrackFaceWithErrorOnBackgroundThread:v15];

        return;
      }
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if (v8 == 1)
    {
      __int16 v11 = [*(id *)(a1 + 32) _initializationTimer];

      if (v11)
      {
        long long v12 = [*(id *)(a1 + 32) _initializationTimer];
        [v12 invalidate];

        objc_msgSend(*(id *)(a1 + 32), "set_initializationTimer:", 0);
        return;
      }
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    }
    if (!v8)
    {
      uint64_t v13 = AXSSMotionTrackingErrorDomain;
      uint64_t v14 = 15;
      goto LABEL_17;
    }
  }
}

id sub_10001D094(uint64_t a1)
{
  id v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    CFStringRef v4 = @"YES";
    if (!*(unsigned char *)(a1 + 48)) {
      CFStringRef v4 = @"NO";
    }
    int v7 = 138412546;
    uint64_t v8 = v3;
    __int16 v9 = 2112;
    CFStringRef v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AXMTHIDBasedLookAtPointTracker:_deviceNotification: %@, added: %@", (uint8_t *)&v7, 0x16u);
  }

  if (!*(unsigned char *)(a1 + 48)) {
    return [*(id *)(a1 + 40) _inputSourceWasInterruptedOnMainThread];
  }
  id v5 = +[NSTimer scheduledTimerWithTimeInterval:*(void *)(a1 + 40) target:"_initializationTimerFired:" selector:0 userInfo:0 repeats:5.0];
  objc_msgSend(*(id *)(a1 + 40), "set_initializationTimer:", v5);

  return [*(id *)(a1 + 40) _setUpPowerAssertionIfNecessary];
}

void sub_10001D5CC(uint64_t a1)
{
  id v2 = +[AXMTUtilities sharedInstance];
  [v2 screenBoundsAccountingForInterfaceOrientation];
  double v6 = AXMTConstrainPointWithinBounds(*(double *)(a1 + 40), *(double *)(a1 + 48), v3, v4, v5);
  double v8 = v7;

  id v9 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v9, "lookAtPointTracker:trackedOnScreenPoint:", *(void *)(a1 + 32), v6, v8);
}

void sub_10001D77C(uint64_t a1)
{
  id v2 = AXSSLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_10001DEF4(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  id v9 = [*(id *)(a1 + 40) delegate];
  [v9 lookAtPointTracker:*(void *)(a1 + 40) didFailToTrackFaceWithError:*(void *)(a1 + 32)];
}

void *sub_10001DA08(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100054E88)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_10001DB48;
    void v5[4] = &unk_100048BC0;
    v5[5] = v5;
    long long v6 = off_100048FA8;
    uint64_t v7 = 0;
    qword_100054E88 = _sl_dlopen();
    uint64_t v3 = (void *)v5[0];
    id v2 = (void *)qword_100054E88;
    if (qword_100054E88)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      uint64_t v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)qword_100054E88;
LABEL_5:
  uint64_t result = dlsym(v2, "AXMachTimeToNanoseconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054E80 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10001DB48()
{
  uint64_t result = _sl_dlopen();
  qword_100054E88 = result;
  return result;
}

void sub_10001DBBC(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXMTHIDBasedLookAtPointTracker: initWithInput: %@ is not MFi authenticated!", (uint8_t *)&v2, 0xCu);
}

void sub_10001DC34(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXMTHIDBasedLookAtPointTracker: initWithInput: %@ is not of type HID!", (uint8_t *)&v2, 0xCu);
}

void sub_10001DCAC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AXMTHIDBasedLookAtPointTracker:_elementUpdated:forDevice: HIDElement %@ was nil for device %@", (uint8_t *)&v3, 0x16u);
}

void sub_10001DD34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001DDAC(int a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[AXMTHIDBasedLookAtPointTracker _setUpPowerAssertionIfNecessary]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to create PM Assertion with error = 0x%i", (uint8_t *)&v2, 0x12u);
}

void sub_10001DE38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10001DEB0(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTHIDBasedLookAtPointTracker:_inputSourceWasInterrupted", v1, 2u);
}

void sub_10001DEF4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

id sub_10001E930(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  [v2 resolution];

  return objc_msgSend(v1, "videoCapturer:didUpdateVideoResolution:", v2);
}

id sub_10001E970(uint64_t a1)
{
  int v1 = *(void **)(a1 + 32);
  int v2 = *(void **)(a1 + 40);
  [v2 fieldOfView];

  return objc_msgSend(v1, "videoCapturer:didUpdateFieldOfView:", v2);
}

void sub_10001EED4(uint64_t a1)
{
  [*(id *)(a1 + 32) _configureCaptureSession];
  int v2 = [*(id *)(a1 + 32) captureSession];

  if (v2)
  {
    +[STDynamicActivityAttributionPublisher setCurrentAttributionKey:0 andApp:AXUIServerAngelProcessIdentifier];
    int v3 = +[NSNotificationCenter defaultCenter];
    [v3 addObserver:*(void *)(a1 + 32) selector:"_avCaptureSessionDidStopRunningNotification:" name:AVCaptureSessionDidStopRunningNotification object:0];

    __int16 v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:*(void *)(a1 + 32) selector:"_avCaptureSessionRuntimeErrorNotification:" name:AVCaptureSessionRuntimeErrorNotification object:0];

    int v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:*(void *)(a1 + 32) selector:"_avCaptureSessionWasInterruptedNotification:" name:AVCaptureSessionWasInterruptedNotification object:0];

    uint64_t v6 = [*(id *)(a1 + 32) captureSession];
    [v6 startRunning];

    uint64_t v7 = AXSSLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [*(id *)(a1 + 32) captureSession];
      int v9 = 136315394;
      CFStringRef v10 = "-[AXMTVideoCapturer start]_block_invoke";
      __int16 v11 = 2112;
      long long v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s: capture session started: %@", (uint8_t *)&v9, 0x16u);
    }
  }
}

id sub_10001F5F4(uint64_t a1)
{
  return [*(id *)(a1 + 32) videoCapturer:*(void *)(a1 + 40) didCaptureTrackedFacesMetadataResult:*(void *)(a1 + 48)];
}

void sub_10001F710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10001F728(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10001F738(uint64_t a1)
{
}

void sub_10001F740(uint64_t a1, void *a2)
{
  id v9 = a2;
  [v9 maxFrameRate];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  if (v6)
  {
    double v7 = v4;
    [v6 maxFrameRate];
    if (v7 <= v8) {
      goto LABEL_5;
    }
    uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(v5 + 40), a2);
LABEL_5:
}

void sub_10001F8B4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isVideoBinned]) {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

id sub_100020560(uint64_t a1)
{
  return [*(id *)(a1 + 32) videoCapturer:*(void *)(a1 + 40) wasInterruptedWithError:*(void *)(a1 + 48)];
}

void sub_100020710(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100020748(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100020764(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

void sub_100020784(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1000207B0(void *a1)
{
  int v1 = [a1 activeFormat];
  sub_100013548();
  sub_100020784((void *)&_mh_execute_header, v2, v3, "AXMTVideoCapturer: _configureCaptureDevice: activeFormat %@", v4, v5, v6, v7, v8);
}

void sub_100020834()
{
  sub_100013548();
  sub_100020748((void *)&_mh_execute_header, v0, v1, "AXMTVideoCapturer: _configureCaptureDevice: Failed to lock device for configuration! %@", v2, v3, v4, v5, v6);
}

void sub_10002089C(void *a1)
{
  uint64_t v1 = [a1 formats];
  sub_100013548();
  sub_100020784((void *)&_mh_execute_header, v2, v3, "AXMTVideoCapturer: _configureCaptureDevice: formats %@", v4, v5, v6, v7, v8);
}

void sub_100020920()
{
  sub_1000207A4();
  sub_100020710((void *)&_mh_execute_header, v0, v1, "AXMTVideoCapturer: _updateCaptureDeviceIfNeeded no change", v2, v3, v4, v5, v6);
}

void sub_100020954(void *a1)
{
  uint64_t v1 = [a1 _captureDevice];
  sub_100013548();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "AXMTVideoCapturer: _updateCaptureDeviceIfNeeded reconfiguring %@ -> %@", v4, v5, v6, v7, v8);
}

void sub_1000209F0()
{
  sub_1000207A4();
  sub_100020710((void *)&_mh_execute_header, v0, v1, "AXMTVideoCapturer: _updateCaptureDeviceIfNeeded start", v2, v3, v4, v5, v6);
}

void sub_100020A24()
{
  sub_100013548();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "AXMTVideoCapturer: setInput %@", v1, 0xCu);
}

void sub_100020A98(void *a1)
{
  uint64_t v1 = [a1 captureSession];
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "%s: stopping the AVCaptureSession: %@", v4, v5, v6, v7, 2u);
}

void sub_100020B28(void *a1)
{
  uint64_t v1 = [a1 _captureDevice];
  uint64_t v2 = [v1 activeFormat];
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v3, v4, "%s: final activeFormat %@", v5, v6, v7, v8, 2u);
}

void sub_100020BD0()
{
  v1[0] = 136315394;
  sub_100013574();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Couldn't lock capture device: %@", (uint8_t *)v1, 0x16u);
}

void sub_100020C50()
{
  int v2 = 136315650;
  sub_10002072C();
  sub_100020764((void *)&_mh_execute_header, v0, v1, "%s: Failed to add AVCaptureDeviceInput instance %@ to capture session %@", v2);
}

void sub_100020CC4()
{
  sub_100013548();
  sub_100020748((void *)&_mh_execute_header, v0, v1, "ERROR: Unable to create AVCaptureDeviceInput: %@", v2, v3, v4, v5, v6);
}

void sub_100020D2C()
{
  sub_1000207A4();
  sub_100020710((void *)&_mh_execute_header, v0, v1, "enabling camera intrinsics delivery", v2, v3, v4, v5, v6);
}

void sub_100020D60()
{
  sub_1000207A4();
  sub_100020710((void *)&_mh_execute_header, v0, v1, "not enabling camera intrinsics delivery", v2, v3, v4, v5, v6);
}

void sub_100020D94()
{
  int v2 = 136315650;
  sub_10002072C();
  sub_100020764((void *)&_mh_execute_header, v0, v1, "%s: Failed to add AVCaptureVideoDataOutput instance %@ to capture session %@", v2);
}

void sub_100020E08(void *a1)
{
  os_log_t v1 = [a1 metadataObjectTypes];
  sub_100013574();
  sub_100013554((void *)&_mh_execute_header, v2, v3, "%s: configured metadata output for type: %@", v4, v5, v6, v7, 2u);
}

void sub_100020E98(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 availableMetadataObjectTypes];
  int v6 = 136315650;
  uint64_t v7 = "-[AXMTVideoCapturer _configureMetadataOutputWithObjectType:forCaptureSession:addFaceTracking:]";
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  __int16 v11 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: metadataOutput's available metadata types does not contain: %@, availableMetadataObjectTypes: %@", (uint8_t *)&v6, 0x20u);
}

void sub_100020F5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020FD4(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:AVCaptureSessionErrorKey];
  v5[0] = 136315394;
  sub_100013574();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: AVCaptureSession runtime error %@", (uint8_t *)v5, 0x16u);
}

void sub_100021A9C(double a1, double a2)
{
  uint64_t v2 = NSStringFromPoint(*(NSPoint *)&a1);
  int v3 = 136315394;
  uint64_t v4 = "-[AXMTVelocityBasedPointMapper resetToPoint:]";
  __int16 v5 = 2112;
  int v6 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)&v3, 0x16u);
}

void sub_100021E24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021E58(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100021E68(uint64_t a1)
{
}

void sub_100021E70(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v11);
        if ([v6 isEqual:VNComputeStageMain])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v12);
          }
        }
        uint64_t v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

void sub_100022718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
}

void sub_100022798(uint64_t a1, void *a2)
{
  id v9 = a2;
  AVMetadataObjectType v4 = [v9 type];

  if (v4 == AVMetadataObjectTypeFace)
  {
    [v9 bounds];
    double v6 = v5;
    [v9 bounds];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    if (v6 * v7 > *(double *)(v8 + 24))
    {
      *(double *)(v8 + 24) = v6 * v7;
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    }
  }
}

void sub_100023278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void *sub_100023A5C(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_100054E98)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_100023B9C;
    void v5[4] = &unk_100048BC0;
    v5[5] = v5;
    long long v6 = off_100049088;
    uint64_t v7 = 0;
    qword_100054E98 = _sl_dlopen();
    int v3 = (void *)v5[0];
    uint64_t v2 = (void *)qword_100054E98;
    if (qword_100054E98)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      int v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  uint64_t v2 = (void *)qword_100054E98;
LABEL_5:
  uint64_t result = dlsym(v2, "AXMachTimeToNanoseconds");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054E90 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100023B9C()
{
  uint64_t result = _sl_dlopen();
  qword_100054E98 = result;
  return result;
}

void sub_100023C10(void *a1, NSObject *a2)
{
  [a1 _cameraOffsetInCM];
  uint64_t v5 = v4;
  [a1 _cameraOffsetInCM];
  uint64_t v7 = v6;
  [a1 _screenSizeInCM];
  uint64_t v9 = v8;
  [a1 _screenSizeInCM];
  int v11 = 136316162;
  uint64_t v12 = "-[AXMTVisionKitEyeTracker _computeScreenAndCameraPositions]";
  __int16 v13 = 2048;
  uint64_t v14 = v5;
  __int16 v15 = 2048;
  uint64_t v16 = v7;
  __int16 v17 = 2048;
  uint64_t v18 = v9;
  __int16 v19 = 2048;
  uint64_t v20 = v10;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%s offset %f, %f; screen size: %f * %f",
    (uint8_t *)&v11,
    0x34u);
}

void sub_100023D00(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023D78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023DF0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023E68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023EE0(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[AXMTVisionKitEyeTracker processSampleBuffer:metadata:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to process screen gaze request %@!", (uint8_t *)&v2, 0x16u);
}

void sub_1000240E4(id a1)
{
  qword_100054EA0 = objc_alloc_init(AXMTVideoFilePlayManager);

  _objc_release_x1();
}

void sub_10002498C()
{
  v3[0] = 136315650;
  sub_100013574();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "%s: Starting play %@ %@", (uint8_t *)v3, 0x20u);
}

void sub_100024A18()
{
  v1[0] = 136315394;
  sub_100013574();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: Cancelling existing play %@!", (uint8_t *)v1, 0x16u);
}

void sub_100024A98(os_log_t log)
{
  int v1 = 136315138;
  os_log_t v2 = "-[AXMTVideoFilePlayManager pausePlaybackForCurrentVideo]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s: Pausing current video", (uint8_t *)&v1, 0xCu);
}

void sub_10002547C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100025494(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1000254A4(uint64_t a1)
{
}

void sub_1000254AC(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  AVMetadataObjectType v7 = [v8 type];

  if (v7 == AVMetadataObjectTypeFace)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

void sub_100025650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100025668(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  AVMetadataObjectType v7 = [v9 type];
  id v8 = (void *)AVMetadataObjectTypeTrackedFaces;

  if (v7 == v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

intptr_t sub_100025AAC(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _processFaceKitResults:a2 withSampleBuffer:*(void *)(a1 + 48)];
  int v3 = *(NSObject **)(a1 + 40);

  return dispatch_semaphore_signal(v3);
}

void sub_100025FC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_100025FE8(id a1)
{
  uint64_t v28 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  int v1 = (uint64_t (*)(void, uint64_t *))off_100054F38;
  uint64_t v37 = off_100054F38;
  if (!off_100054F38)
  {
    id v29 = _NSConcreteStackBlock;
    uint64_t v30 = 3221225472;
    id v31 = sub_10002B310;
    double v32 = &unk_100048B88;
    uint64_t v33 = &v34;
    os_log_t v2 = (void *)sub_10002B0FC();
    v35[3] = (uint64_t)dlsym(v2, "CVAFaceTrackingCopySemantics");
    off_100054F38 = *(_UNKNOWN **)(v33[1] + 24);
    int v1 = (uint64_t (*)(void, uint64_t *))v35[3];
  }
  _Block_object_dispose(&v34, 8);
  if (!v1)
  {
    sub_10002C8C4();
    goto LABEL_18;
  }
  uint64_t v3 = v1(0, &v28);
  if (v3) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = v28 == 0;
  }
  if (!v4)
  {
    uint64_t v12 = (void *)qword_100054EB0;
    qword_100054EB0 = v28;

    __int16 v13 = (void *)qword_100054EB0;
    uint64_t v34 = 0;
    uint64_t v35 = &v34;
    uint64_t v36 = 0x2020000000;
    uint64_t v14 = (void *)qword_100054F40;
    uint64_t v37 = (void *)qword_100054F40;
    if (!qword_100054F40)
    {
      id v29 = _NSConcreteStackBlock;
      uint64_t v30 = 3221225472;
      id v31 = sub_10002B360;
      double v32 = &unk_100048B88;
      uint64_t v33 = &v34;
      __int16 v15 = (void *)sub_10002B0FC();
      uint64_t v16 = dlsym(v15, "kCVAFaceTracking_BlendshapeNames");
      *(void *)(v33[1] + 24) = v16;
      qword_100054F40 = *(void *)(v33[1] + 24);
      uint64_t v14 = (void *)v35[3];
    }
    _Block_object_dispose(&v34, 8);
    if (v14)
    {
      uint64_t v5 = [v13 objectForKeyedSubscript:*v14];
      v38[0] = @"mouthSmile_L";
      v38[1] = @"mouthSmile_R";
      v38[2] = @"mouthClose";
      v38[3] = @"jawOpen";
      v38[4] = @"browOuterUp_L";
      v38[5] = @"browOuterUp_R";
      v38[6] = @"eyeBlink_R";
      v38[7] = @"eyeBlink_L";
      v38[8] = @"noseSneer_R";
      v38[9] = @"noseSneer_L";
      v38[10] = @"mouthRight";
      v38[11] = @"mouthLeft";
      v38[12] = @"mouthPucker";
      __int16 v17 = +[NSArray arrayWithObjects:v38 count:13];
      +[NSMutableDictionary dictionary];
      double v22 = _NSConcreteStackBlock;
      uint64_t v23 = 3221225472;
      id v24 = sub_1000263A8;
      double v25 = &unk_100049170;
      id v26 = v17;
      id v27 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = v27;
      id v19 = v17;
      [v5 enumerateObjectsUsingBlock:&v22];
      id v20 = objc_msgSend(v18, "copy", v22, v23, v24, v25);
      uint64_t v21 = (void *)qword_100054EB8;
      qword_100054EB8 = (uint64_t)v20;

      goto LABEL_15;
    }
    sub_10002C8C4();
LABEL_18:
    __break(1u);
  }
  uint64_t v5 = AXSSLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_10002C36C(v3, v5, v6, v7, v8, v9, v10, v11);
  }
LABEL_15:
}

void sub_100026384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000263A8(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    uint64_t v5 = +[NSNumber numberWithUnsignedInteger:a3];
    [*(id *)(a1 + 40) setObject:v5 forKeyedSubscript:v6];
  }
}

uint64_t sub_10002642C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054F48;
  uint64_t v7 = qword_100054F48;
  if (!qword_100054F48)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_TrackedFacesArray");
    qword_100054F48 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_100026524()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054F50;
  uint64_t v7 = qword_100054F50;
  if (!qword_100054F50)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_SmoothData");
    qword_100054F50 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

void sub_100026D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026D88()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054F68;
  uint64_t v7 = qword_100054F68;
  if (!qword_100054F68)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTrackingLiteFilter_SharedData");
    qword_100054F68 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_100027434()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054FC8;
  uint64_t v7 = qword_100054FC8;
  if (!qword_100054FC8)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerCenter");
    qword_100054FC8 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_10002752C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054FD0;
  uint64_t v7 = qword_100054FD0;
  if (!qword_100054FD0)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerRight");
    qword_100054FD0 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_100027624()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054FD8;
  uint64_t v7 = qword_100054FD8;
  if (!qword_100054FD8)
  {
    int v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerLeft");
    qword_100054FD8 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

void sub_100027E04(id a1)
{
  v3[0] = @"tongue_out";
  v3[1] = @"mouthSmile_L";
  v4[0] = AXMTBlendShapeTongueOut;
  v4[1] = AXMTBlendShapeMouthSmileLeft;
  v3[2] = @"mouthSmile_R";
  v3[3] = @"jawOpen";
  v4[2] = AXMTBlendShapeMouthSmileRight;
  v4[3] = AXMTBlendShapeJawOpen;
  v3[4] = @"mouthClose";
  int v3[5] = @"browOuterUp_L";
  v4[4] = AXMTBlendShapeMouthClose;
  v4[5] = AXMTBlendShapeBrowOuterUpLeft;
  void v3[6] = @"browOuterUp_R";
  v3[7] = @"eyeBlink_R";
  v4[6] = AXMTBlendShapeBrowOuterUpRight;
  v4[7] = AXMTBlendShapeEyeBlinkRight;
  v3[8] = @"eyeBlink_L";
  v3[9] = @"noseSneer_R";
  v4[8] = AXMTBlendShapeEyeBlinkLeft;
  v4[9] = AXMTBlendShapeNoseSneerRight;
  v3[10] = @"noseSneer_L";
  v3[11] = @"mouthRight";
  v4[10] = AXMTBlendShapeNoseSneerLeft;
  v4[11] = AXMTBlendShapeMouthRight;
  v3[12] = @"mouthLeft";
  v3[13] = @"mouthPucker";
  v4[12] = AXMTBlendShapeMouthLeft;
  v4[13] = AXMTBlendShapeMouthPucker;
  uint64_t v1 = +[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:14];
  os_log_t v2 = (void *)qword_100054EC8;
  qword_100054EC8 = v1;
}

void sub_100028ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100028F08()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100054FF8;
  uint64_t v7 = qword_100054FF8;
  if (!qword_100054FF8)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_Rotation");
    qword_100054FF8 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_100029000()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055000;
  uint64_t v7 = qword_100055000;
  if (!qword_100055000)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_Translation");
    qword_100055000 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_1000290F8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055008;
  uint64_t v7 = qword_100055008;
  if (!qword_100055008)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_Extrinsics");
    qword_100055008 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_1000291F0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055010;
  uint64_t v7 = qword_100055010;
  if (!qword_100055010)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_Intrinsics");
    qword_100055010 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_1000292E8()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055018;
  uint64_t v7 = qword_100055018;
  if (!qword_100055018)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_CameraColor");
    qword_100055018 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

uint64_t sub_1000293E0()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055028;
  uint64_t v7 = qword_100055028;
  if (!qword_100055028)
  {
    uint64_t v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_DetectedFaceRect");
    qword_100055028 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    uint64_t v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

void sub_1000298F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100029978(id a1)
{
  uint64_t v1 = (void *)qword_100054ED8;
  qword_100054ED8 = (uint64_t)&off_100049F78;
}

__n64 sub_100029E60(float32x4_t _Q0)
{
  _Q2 = _Q0;
  _S3 = _Q0.u32[1];
  _S4 = _Q0.u32[2];
  __asm { FMLS            S0, S4, V2.S[2] }
  _S6 = _Q2.i32[3];
  __asm { FMLA            S0, S6, V2.S[3] }
  float v9 = vmlas_n_f32(vmuls_lane_f32(_Q0.f32[2], _Q2, 3), _Q0.f32[1], _Q2.f32[0]);
  __asm
  {
    FMLA            S5, S3, V2.S[1]
    FMLA            S5, S6, V2.S[3]
    FMLS            S5, S2, V2.S[0]
    FMLA            S18, S4, V2.S[1]
    FMLA            S6, S4, V2.S[2]
    FMLS            S6, S2, V2.S[0]
    FMLS            S6, S3, V2.S[1]
  }
  result.n64_f32[1] = v9 + v9;
  return result;
}

void sub_10002A124(id a1)
{
  id v1 = objc_alloc((Class)NSUserDefaults);
  id v3 = [v1 initWithSuiteName:AXSSMotionTrackingPreferenceDomain];
  unsigned int v2 = [v3 BOOLForKey:@"ShouldLogIntrinsics"];
  if (v2) {
    LOBYTE(v2) = AXSSIsAppleInternalBuild();
  }
  byte_100054EE8 = v2;
}

uint64_t sub_10002A7C4()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2020000000;
  uint64_t v0 = qword_100055080;
  uint64_t v7 = qword_100055080;
  if (!qword_100055080)
  {
    id v1 = (void *)sub_10002B0FC();
    v5[3] = (uint64_t)dlsym(v1, "kCVAFaceTracking_Pose");
    qword_100055080 = v5[3];
    uint64_t v0 = v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    id v3 = (_Unwind_Exception *)sub_10002C8C4();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *(void *)v0;
}

void sub_10002A8BC(id a1)
{
  byte_100054EF8 = AXSSDeviceFrontCameraPhysicallyMountedUpsideDown();
}

void sub_10002AFA0(id a1)
{
  byte_100054F08 = AXSSDeviceFrontCameraPhysicallyMountedUpsideDown();
}

void *sub_10002B0AC(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  __n64 result = dlsym(v2, "CVAFaceTrackingCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054F18 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_10002B0FC()
{
  v3[0] = 0;
  if (!qword_100054F20)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_10002B1FC;
    v3[4] = &unk_100048BC0;
    int v3[5] = v3;
    long long v4 = off_100049230;
    uint64_t v5 = 0;
    qword_100054F20 = _sl_dlopen();
  }
  uint64_t v0 = qword_100054F20;
  id v1 = (void *)v3[0];
  if (!qword_100054F20)
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

uint64_t sub_10002B1FC()
{
  uint64_t result = _sl_dlopen();
  qword_100054F20 = result;
  return result;
}

void *sub_10002B270(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingLiteFilterCreate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054F28 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B2C0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingProcess");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054F30 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B310(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingCopySemantics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054F38 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B360(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_BlendshapeNames");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B3B0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_TrackedFacesArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F48 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B400(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_SmoothData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F50 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B450(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Animation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F58 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B4A0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_AnimationBlendshapes");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F60 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B4F0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilter_SharedData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B540(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilter_ClientData");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F70 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B590(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilter_ClientDataAccessibility");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B5E0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_Expressions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F80 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B630(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_Landmarks");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B680(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_LandmarkNoseBaseCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B6D0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionBrowsUp");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054F98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B720(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionJawOpen");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B770(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionSmile");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FA8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B7C0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionTongueOut");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B810(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionEyeBlink");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FB8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B860(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionNoseSneer");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B8B0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerCenter");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B900(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerRight");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FD0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B950(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTrackingLiteFilterClientAccessibility_ExpressionMouthPuckerLeft");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FD8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B9A0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingLiteFilterProcessVanilla");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054FE0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002B9F0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingLiteFilterCopyDecodedOutput");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054FE8 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BA40(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "CVAFaceTrackingLiteFilterGetOutput");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_100054FF0 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BA90(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Rotation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100054FF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BAE0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Translation");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055000 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BB30(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Extrinsics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055008 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BB80(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Intrinsics");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055010 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BBD0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_CameraColor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055018 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BC20(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DetectedFaceFaceID");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055020 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BC70(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DetectedFaceRect");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055028 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BCC0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DetectedFaceAngleInfoRoll");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055030 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BD10(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_DetectedFacesArray");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055038 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BD60(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Color");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055040 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BDB0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Timestamp");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055048 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BE00(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Callback");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055050 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BE50(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_AddMesh");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055058 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BEA0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_ColorOnly");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055060 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BEF0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_NumTrackedFaces");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055068 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BF40(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_UseRecognition");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055070 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BF90(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_NetworkFailureThresholdMultiplier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055078 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002BFE0(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_Pose");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055080 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void *sub_10002C030(uint64_t a1)
{
  unsigned int v2 = (void *)sub_10002B0FC();
  uint64_t result = dlsym(v2, "kCVAFaceTracking_LandmarkNames");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_100055088 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_10002C080(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_10002C09C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C108(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "AXMTFaceKitFaceTracker: FaceKit ready @ %p", (uint8_t *)&v3, 0xCu);
}

void sub_10002C184(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C1F0(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTFaceKitFaceTracker: initing without facekit pipeline", v1, 2u);
}

void sub_10002C234(uint64_t a1, void *a2, NSObject *a3)
{
  int v4 = 136315650;
  uint64_t v5 = "-[AXMTFaceKitFaceTracker _videoFrameisValidForProcessing:]";
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = [a2 _faceKitRef];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "%s: one of these is NULL! sampleBuffer: %@, self._faceKitRef: %@", (uint8_t *)&v4, 0x20u);
}

void sub_10002C2E4(uint64_t a1, int a2, os_log_t log)
{
  int v3 = 134218240;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "AXMTFaceKitFaceTracker: FaceKit processing failure on %p: %d!", (uint8_t *)&v3, 0x12u);
}

void sub_10002C36C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C3D8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C450(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C4C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C540(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C5B8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002C630(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Task not allowed to connect to motion tracking!", v1, 2u);
}

void sub_10002C674(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to get entitlements for host task. Error: %@", (uint8_t *)&v3, 0xCu);
}

void sub_10002C6F0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AXMTDaemon: remoteObjectProxy returned error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_10002C768(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTDaemon: checking termination", v1, 2u);
}

void sub_10002C7AC(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 _inputConfiguration];
  __int16 v5 = [a1 _inputManager];
  int v6 = [v5 inputToUse];
  int v7 = 138412546;
  __int16 v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Can't find a tracker class for inputConfiguration %@, inputToUse %@", (uint8_t *)&v7, 0x16u);
}

void sub_10002C880(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "AXMTDaemon: _stopTrackerIfRunning", v1, 2u);
}

uint64_t sub_10002C8C4()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return sub_10002C8E8(v0);
}

void sub_10002C8E8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "MotionTrackingDaemon:main:   finished service", v1, 2u);
}

void sub_10002C92C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "MotionTrackingDaemon:main: started", v1, 2u);
}

uint64_t AXDeviceIsPad()
{
  return _AXDeviceIsPad();
}

uint64_t AXSSDeviceFrontCameraPhysicallyMountedUpsideDown()
{
  return _AXSSDeviceFrontCameraPhysicallyMountedUpsideDown();
}

uint64_t AXSSHumanReadableDescriptionForMotionTrackingFacialExpression()
{
  return _AXSSHumanReadableDescriptionForMotionTrackingFacialExpression();
}

uint64_t AXSSIsAppleInternalBuild()
{
  return _AXSSIsAppleInternalBuild();
}

uint64_t AXSSLogForCategory()
{
  return _AXSSLogForCategory();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return _CATransform3DMakeRotation(retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return _CATransform3DMakeScale(retstr, sx, sy, sz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFDataGetTypeID(void)
{
  return _CFDataGetTypeID();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
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

void CFRelease(CFTypeRef cf)
{
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return _CGPathCreateMutable();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithEllipseInRect(rect, transform);
}

CGPathRef CGPathCreateWithRect(CGRect rect, const CGAffineTransform *transform)
{
  return _CGPathCreateWithRect(rect, transform);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return _CGRectCreateDictionaryRepresentation(a1);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return _CGRectEqualToRect(rect1, rect2);
}

CGFloat CGRectGetMidX(CGRect rect)
{
  return _CGRectGetMidX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return _CGRectIsEmpty(rect);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return _CGRectMakeWithDictionaryRepresentation(dict, rect);
}

FourCharCode CMFormatDescriptionGetMediaSubType(CMFormatDescriptionRef desc)
{
  return _CMFormatDescriptionGetMediaSubType(desc);
}

CFTypeRef CMGetAttachment(CMAttachmentBearerRef target, CFStringRef key, CMAttachmentMode *attachmentModeOut)
{
  return _CMGetAttachment(target, key, attachmentModeOut);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetImageBuffer(sbuf);
}

CMTime *__cdecl CMSampleBufferGetPresentationTimeStamp(CMTime *__return_ptr retstr, CMSampleBufferRef sbuf)
{
  return _CMSampleBufferGetPresentationTimeStamp(retstr, sbuf);
}

CFArrayRef CMSampleBufferGetSampleAttachmentsArray(CMSampleBufferRef sbuf, Boolean createIfNecessary)
{
  return _CMSampleBufferGetSampleAttachmentsArray(sbuf, createIfNecessary);
}

Boolean CMSampleBufferIsValid(CMSampleBufferRef sbuf)
{
  return _CMSampleBufferIsValid(sbuf);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return _CMTimeCopyAsDictionary(time, allocator);
}

CFStringRef CMTimeCopyDescription(CFAllocatorRef allocator, CMTime *time)
{
  return _CMTimeCopyDescription(allocator, time);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  return _CMTimeGetSeconds(time);
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return _CMTimeMake(retstr, value, timescale);
}

CMVideoDimensions CMVideoFormatDescriptionGetDimensions(CMVideoFormatDescriptionRef videoDesc)
{
  return _CMVideoFormatDescriptionGetDimensions(videoDesc);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetHeight(pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return _CVPixelBufferGetWidth(pixelBuffer);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return _IOPMAssertionCreateWithDescription(AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, Timeout, TimeoutAction, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return _IOPMAssertionRelease(AssertionID);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

BOOL NSEqualPoints(NSPoint aPoint, NSPoint bPoint)
{
  return _NSEqualPoints(aPoint, bPoint);
}

BOOL NSEqualRects(NSRect aRect, NSRect bRect)
{
  return _NSEqualRects(aRect, bRect);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return _NSStringFromPoint(aPoint);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return _NSStringFromRect(aRect);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return _SecTaskCopyValueForEntitlement(task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return _SecTaskCreateWithAuditToken(allocator, token);
}

uint64_t UIApplicationInstantiateSingleton()
{
  return _UIApplicationInstantiateSingleton();
}

CGRect VNImageRectForNormalizedRect(CGRect normalizedRect, size_t imageWidth, size_t imageHeight)
{
  return _VNImageRectForNormalizedRect(normalizedRect, imageWidth, imageHeight);
}

uint64_t _AXSMossdeepEnabled()
{
  return __AXSMossdeepEnabled();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

__float2 __sincosf_stret(float a1)
{
  __float2 v3 = ___sincosf_stret(a1);
  float cosval = v3.__cosval;
  float sinval = v3.__sinval;
  result.__float cosval = cosval;
  result.__float sinval = sinval;
  return result;
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

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

float asinf(float a1)
{
  return _asinf(a1);
}

float atan2f(float a1, float a2)
{
  return _atan2f(a1, a2);
}

float atanf(float a1)
{
  return _atanf(a1);
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

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
}

long double exp2(long double __x)
{
  return _exp2(__x);
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
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

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

long double pow(long double __x, long double __y)
{
  return _pow(__x, __y);
}

float tanf(float a1)
{
  return _tanf(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return [a1 CGColor];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__XPositionElementUpdated(void *a1, const char *a2, ...)
{
  return [a1 _XPositionElementUpdated];
}

id objc_msgSend__YPositionElementUpdated(void *a1, const char *a2, ...)
{
  return [a1 _YPositionElementUpdated];
}

id objc_msgSend__accelerationCurve(void *a1, const char *a2, ...)
{
  return [a1 _accelerationCurve];
}

id objc_msgSend__arkitCameraInputSource(void *a1, const char *a2, ...)
{
  return [a1 _arkitCameraInputSource];
}

id objc_msgSend__arkitCameraInputSourceWindow(void *a1, const char *a2, ...)
{
  return [a1 _arkitCameraInputSourceWindow];
}

id objc_msgSend__assetReader(void *a1, const char *a2, ...)
{
  return [a1 _assetReader];
}

id objc_msgSend__avCaptureSessionInterruptionReason(void *a1, const char *a2, ...)
{
  return [a1 _avCaptureSessionInterruptionReason];
}

id objc_msgSend__backlightIsOff(void *a1, const char *a2, ...)
{
  return [a1 _backlightIsOff];
}

id objc_msgSend__backupIntrinsicsMatrixForiOS(void *a1, const char *a2, ...)
{
  return [a1 _backupIntrinsicsMatrixForiOS];
}

id objc_msgSend__baselineFaceBounds(void *a1, const char *a2, ...)
{
  return [a1 _baselineFaceBounds];
}

id objc_msgSend__baselinePitch(void *a1, const char *a2, ...)
{
  return [a1 _baselinePitch];
}

id objc_msgSend__baselineYaw(void *a1, const char *a2, ...)
{
  return [a1 _baselineYaw];
}

id objc_msgSend__bringUp(void *a1, const char *a2, ...)
{
  return [a1 _bringUp];
}

id objc_msgSend__calibratedPitch(void *a1, const char *a2, ...)
{
  return [a1 _calibratedPitch];
}

id objc_msgSend__calibratedYaw(void *a1, const char *a2, ...)
{
  return [a1 _calibratedYaw];
}

id objc_msgSend__cameraOffsetInCM(void *a1, const char *a2, ...)
{
  return [a1 _cameraOffsetInCM];
}

id objc_msgSend__cancelDispatchSource(void *a1, const char *a2, ...)
{
  return [a1 _cancelDispatchSource];
}

id objc_msgSend__captureDevice(void *a1, const char *a2, ...)
{
  return [a1 _captureDevice];
}

id objc_msgSend__captureSessionQueue(void *a1, const char *a2, ...)
{
  return [a1 _captureSessionQueue];
}

id objc_msgSend__checkBackboardEffectiveDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _checkBackboardEffectiveDeviceOrientation];
}

id objc_msgSend__checkBackboardOrientationLockStatus(void *a1, const char *a2, ...)
{
  return [a1 _checkBackboardOrientationLockStatus];
}

id objc_msgSend__cleanUpPowerAssertionAndTimer(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpPowerAssertionAndTimer];
}

id objc_msgSend__cleanUpPowerAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpPowerAssertionIfNecessary];
}

id objc_msgSend__clearVideoPreviewLayer(void *a1, const char *a2, ...)
{
  return [a1 _clearVideoPreviewLayer];
}

id objc_msgSend__completionHandlersByInputUniqueID(void *a1, const char *a2, ...)
{
  return [a1 _completionHandlersByInputUniqueID];
}

id objc_msgSend__computeScreenAndCameraPositions(void *a1, const char *a2, ...)
{
  return [a1 _computeScreenAndCameraPositions];
}

id objc_msgSend__configureCaptureSession(void *a1, const char *a2, ...)
{
  return [a1 _configureCaptureSession];
}

id objc_msgSend__controllerQueue(void *a1, const char *a2, ...)
{
  return [a1 _controllerQueue];
}

id objc_msgSend__currentAcceleration(void *a1, const char *a2, ...)
{
  return [a1 _currentAcceleration];
}

id objc_msgSend__currentStatus(void *a1, const char *a2, ...)
{
  return [a1 _currentStatus];
}

id objc_msgSend__currentlyTrackedFaceAnchor(void *a1, const char *a2, ...)
{
  return [a1 _currentlyTrackedFaceAnchor];
}

id objc_msgSend__defaultOnScreenPoint(void *a1, const char *a2, ...)
{
  return [a1 _defaultOnScreenPoint];
}

id objc_msgSend__deltaTimesWindow(void *a1, const char *a2, ...)
{
  return [a1 _deltaTimesWindow];
}

id objc_msgSend__dequeue(void *a1, const char *a2, ...)
{
  return [a1 _dequeue];
}

id objc_msgSend__detectedFaceRectangleShapeLayer(void *a1, const char *a2, ...)
{
  return [a1 _detectedFaceRectangleShapeLayer];
}

id objc_msgSend__deviceOrientedCameraOffset(void *a1, const char *a2, ...)
{
  return [a1 _deviceOrientedCameraOffset];
}

id objc_msgSend__deviceOrientedScreenSize(void *a1, const char *a2, ...)
{
  return [a1 _deviceOrientedScreenSize];
}

id objc_msgSend__droppedFrames(void *a1, const char *a2, ...)
{
  return [a1 _droppedFrames];
}

id objc_msgSend__duration(void *a1, const char *a2, ...)
{
  return [a1 _duration];
}

id objc_msgSend__error(void *a1, const char *a2, ...)
{
  return [a1 _error];
}

id objc_msgSend__expressionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _expressionConfiguration];
}

id objc_msgSend__expressionValuesTextLayer(void *a1, const char *a2, ...)
{
  return [a1 _expressionValuesTextLayer];
}

id objc_msgSend__expressions(void *a1, const char *a2, ...)
{
  return [a1 _expressions];
}

id objc_msgSend__faceKitCreationOptions(void *a1, const char *a2, ...)
{
  return [a1 _faceKitCreationOptions];
}

id objc_msgSend__faceKitFaceTracker(void *a1, const char *a2, ...)
{
  return [a1 _faceKitFaceTracker];
}

id objc_msgSend__faceKitLiteFilterRef(void *a1, const char *a2, ...)
{
  return [a1 _faceKitLiteFilterRef];
}

id objc_msgSend__faceKitRef(void *a1, const char *a2, ...)
{
  return [a1 _faceKitRef];
}

id objc_msgSend__fileURL(void *a1, const char *a2, ...)
{
  return [a1 _fileURL];
}

id objc_msgSend__framerate(void *a1, const char *a2, ...)
{
  return [a1 _framerate];
}

id objc_msgSend__hasFace(void *a1, const char *a2, ...)
{
  return [a1 _hasFace];
}

id objc_msgSend__headTrackingBounds(void *a1, const char *a2, ...)
{
  return [a1 _headTrackingBounds];
}

id objc_msgSend__headTrackingRect(void *a1, const char *a2, ...)
{
  return [a1 _headTrackingRect];
}

id objc_msgSend__hidManager(void *a1, const char *a2, ...)
{
  return [a1 _hidManager];
}

id objc_msgSend__hidManagerDispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 _hidManagerDispatchQueue];
}

id objc_msgSend__horizontalNormalizationFactor(void *a1, const char *a2, ...)
{
  return [a1 _horizontalNormalizationFactor];
}

id objc_msgSend__imageOrientationForGazeRequest(void *a1, const char *a2, ...)
{
  return [a1 _imageOrientationForGazeRequest];
}

id objc_msgSend__initialFaceInfo(void *a1, const char *a2, ...)
{
  return [a1 _initialFaceInfo];
}

id objc_msgSend__initializationTimer(void *a1, const char *a2, ...)
{
  return [a1 _initializationTimer];
}

id objc_msgSend__initializeSystemSettings(void *a1, const char *a2, ...)
{
  return [a1 _initializeSystemSettings];
}

id objc_msgSend__inputConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _inputConfiguration];
}

id objc_msgSend__inputManager(void *a1, const char *a2, ...)
{
  return [a1 _inputManager];
}

id objc_msgSend__inputSourceWasInterruptedOnMainThread(void *a1, const char *a2, ...)
{
  return [a1 _inputSourceWasInterruptedOnMainThread];
}

id objc_msgSend__interrupted(void *a1, const char *a2, ...)
{
  return [a1 _interrupted];
}

id objc_msgSend__isStarted(void *a1, const char *a2, ...)
{
  return [a1 _isStarted];
}

id objc_msgSend__joystickModeMovementThreshold(void *a1, const char *a2, ...)
{
  return [a1 _joystickModeMovementThreshold];
}

id objc_msgSend__lastAccelerationUpdate(void *a1, const char *a2, ...)
{
  return [a1 _lastAccelerationUpdate];
}

id objc_msgSend__lastProcessedPoint(void *a1, const char *a2, ...)
{
  return [a1 _lastProcessedPoint];
}

id objc_msgSend__lastReportedFailure(void *a1, const char *a2, ...)
{
  return [a1 _lastReportedFailure];
}

id objc_msgSend__lastReportedPointFromProcessing(void *a1, const char *a2, ...)
{
  return [a1 _lastReportedPointFromProcessing];
}

id objc_msgSend__lastReportedTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _lastReportedTimestamp];
}

id objc_msgSend__lastTimePointReceived(void *a1, const char *a2, ...)
{
  return [a1 _lastTimePointReceived];
}

id objc_msgSend__lastTimePoseRecorded(void *a1, const char *a2, ...)
{
  return [a1 _lastTimePoseRecorded];
}

id objc_msgSend__lastTrackingPointTimestamp(void *a1, const char *a2, ...)
{
  return [a1 _lastTrackingPointTimestamp];
}

id objc_msgSend__lastValidPoint(void *a1, const char *a2, ...)
{
  return [a1 _lastValidPoint];
}

id objc_msgSend__lastVelocitySize(void *a1, const char *a2, ...)
{
  return [a1 _lastVelocitySize];
}

id objc_msgSend__listeners(void *a1, const char *a2, ...)
{
  return [a1 _listeners];
}

id objc_msgSend__listenersForDeviceOrientationEvents(void *a1, const char *a2, ...)
{
  return [a1 _listenersForDeviceOrientationEvents];
}

id objc_msgSend__loadCalibrationValuesFromDefaults(void *a1, const char *a2, ...)
{
  return [a1 _loadCalibrationValuesFromDefaults];
}

id objc_msgSend__lookAtPoint(void *a1, const char *a2, ...)
{
  return [a1 _lookAtPoint];
}

id objc_msgSend__lookAtPointTracker(void *a1, const char *a2, ...)
{
  return [a1 _lookAtPointTracker];
}

id objc_msgSend__lookAtPointTrackerObserver(void *a1, const char *a2, ...)
{
  return [a1 _lookAtPointTrackerObserver];
}

id objc_msgSend__metadataOutput(void *a1, const char *a2, ...)
{
  return [a1 _metadataOutput];
}

id objc_msgSend__metadataOutputAdaptors(void *a1, const char *a2, ...)
{
  return [a1 _metadataOutputAdaptors];
}

id objc_msgSend__motionManager(void *a1, const char *a2, ...)
{
  return [a1 _motionManager];
}

id objc_msgSend__motionManagerCallbackQueue(void *a1, const char *a2, ...)
{
  return [a1 _motionManagerCallbackQueue];
}

id objc_msgSend__motionTrackingMode(void *a1, const char *a2, ...)
{
  return [a1 _motionTrackingMode];
}

id objc_msgSend__multiPointsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 _multiPointsOfInterest];
}

id objc_msgSend__multiPointsOfInterestShapeLayers(void *a1, const char *a2, ...)
{
  return [a1 _multiPointsOfInterestShapeLayers];
}

id objc_msgSend__needsRecalibration(void *a1, const char *a2, ...)
{
  return [a1 _needsRecalibration];
}

id objc_msgSend__nextInitialPoint(void *a1, const char *a2, ...)
{
  return [a1 _nextInitialPoint];
}

id objc_msgSend__notifyDelegateFaceLost(void *a1, const char *a2, ...)
{
  return [a1 _notifyDelegateFaceLost];
}

id objc_msgSend__orientationObserver(void *a1, const char *a2, ...)
{
  return [a1 _orientationObserver];
}

id objc_msgSend__playVideoFile(void *a1, const char *a2, ...)
{
  return [a1 _playVideoFile];
}

id objc_msgSend__playbackFinished(void *a1, const char *a2, ...)
{
  return [a1 _playbackFinished];
}

id objc_msgSend__pointOfInterestShapeLayer(void *a1, const char *a2, ...)
{
  return [a1 _pointOfInterestShapeLayer];
}

id objc_msgSend__pointerMovementMapper(void *a1, const char *a2, ...)
{
  return [a1 _pointerMovementMapper];
}

id objc_msgSend__powerAssertionID(void *a1, const char *a2, ...)
{
  return [a1 _powerAssertionID];
}

id objc_msgSend__powerAssertionTimer(void *a1, const char *a2, ...)
{
  return [a1 _powerAssertionTimer];
}

id objc_msgSend__previousExpressions(void *a1, const char *a2, ...)
{
  return [a1 _previousExpressions];
}

id objc_msgSend__previousPointOfInterestShapeLayers(void *a1, const char *a2, ...)
{
  return [a1 _previousPointOfInterestShapeLayers];
}

id objc_msgSend__previousPointsOfInterest(void *a1, const char *a2, ...)
{
  return [a1 _previousPointsOfInterest];
}

id objc_msgSend__readingQueue(void *a1, const char *a2, ...)
{
  return [a1 _readingQueue];
}

id objc_msgSend__referenceDimensionsValue(void *a1, const char *a2, ...)
{
  return [a1 _referenceDimensionsValue];
}

id objc_msgSend__restartTracking(void *a1, const char *a2, ...)
{
  return [a1 _restartTracking];
}

id objc_msgSend__resumePlayback(void *a1, const char *a2, ...)
{
  return [a1 _resumePlayback];
}

id objc_msgSend__rootView(void *a1, const char *a2, ...)
{
  return [a1 _rootView];
}

id objc_msgSend__sampleBufferDisplayLayer(void *a1, const char *a2, ...)
{
  return [a1 _sampleBufferDisplayLayer];
}

id objc_msgSend__samplesQueue(void *a1, const char *a2, ...)
{
  return [a1 _samplesQueue];
}

id objc_msgSend__screenBounds(void *a1, const char *a2, ...)
{
  return [a1 _screenBounds];
}

id objc_msgSend__screenBoundsFromFrontBoard(void *a1, const char *a2, ...)
{
  return [a1 _screenBoundsFromFrontBoard];
}

id objc_msgSend__screenBoundsUpdateAttempts(void *a1, const char *a2, ...)
{
  return [a1 _screenBoundsUpdateAttempts];
}

id objc_msgSend__screenLookAtPoints(void *a1, const char *a2, ...)
{
  return [a1 _screenLookAtPoints];
}

id objc_msgSend__screenSizeInCM(void *a1, const char *a2, ...)
{
  return [a1 _screenSizeInCM];
}

id objc_msgSend__sensitivity(void *a1, const char *a2, ...)
{
  return [a1 _sensitivity];
}

id objc_msgSend__session(void *a1, const char *a2, ...)
{
  return [a1 _session];
}

id objc_msgSend__setUpPowerAssertionIfNecessary(void *a1, const char *a2, ...)
{
  return [a1 _setUpPowerAssertionIfNecessary];
}

id objc_msgSend__setupDispatchSource(void *a1, const char *a2, ...)
{
  return [a1 _setupDispatchSource];
}

id objc_msgSend__showDebugOverlay(void *a1, const char *a2, ...)
{
  return [a1 _showDebugOverlay];
}

id objc_msgSend__startMonitoringEffectiveDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringEffectiveDeviceOrientation];
}

id objc_msgSend__startMonitoringOrientationLockStatus(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringOrientationLockStatus];
}

id objc_msgSend__state(void *a1, const char *a2, ...)
{
  return [a1 _state];
}

id objc_msgSend__stateUpdated(void *a1, const char *a2, ...)
{
  return [a1 _stateUpdated];
}

id objc_msgSend__stopMonitoringEffectiveDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringEffectiveDeviceOrientation];
}

id objc_msgSend__stopMonitoringOrientationLockStatus(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringOrientationLockStatus];
}

id objc_msgSend__stopTrackerIfRunning(void *a1, const char *a2, ...)
{
  return [a1 _stopTrackerIfRunning];
}

id objc_msgSend__storeCalibrationValuesToDefaults(void *a1, const char *a2, ...)
{
  return [a1 _storeCalibrationValuesToDefaults];
}

id objc_msgSend__tearDown(void *a1, const char *a2, ...)
{
  return [a1 _tearDown];
}

id objc_msgSend__tearDownDebugOverlay(void *a1, const char *a2, ...)
{
  return [a1 _tearDownDebugOverlay];
}

id objc_msgSend__tearDownMotionManager(void *a1, const char *a2, ...)
{
  return [a1 _tearDownMotionManager];
}

id objc_msgSend__timerSource(void *a1, const char *a2, ...)
{
  return [a1 _timerSource];
}

id objc_msgSend__trackOutput(void *a1, const char *a2, ...)
{
  return [a1 _trackOutput];
}

id objc_msgSend__trackedOnScreenPoint(void *a1, const char *a2, ...)
{
  return [a1 _trackedOnScreenPoint];
}

id objc_msgSend__trackingAreaPointMapper(void *a1, const char *a2, ...)
{
  return [a1 _trackingAreaPointMapper];
}

id objc_msgSend__trackingAreaShapeLayer(void *a1, const char *a2, ...)
{
  return [a1 _trackingAreaShapeLayer];
}

id objc_msgSend__trackingTypeSupportsOnDeviceGaze(void *a1, const char *a2, ...)
{
  return [a1 _trackingTypeSupportsOnDeviceGaze];
}

id objc_msgSend__trackingXPCConnections(void *a1, const char *a2, ...)
{
  return [a1 _trackingXPCConnections];
}

id objc_msgSend__trueMovementThresholdX(void *a1, const char *a2, ...)
{
  return [a1 _trueMovementThresholdX];
}

id objc_msgSend__trueMovementThresholdY(void *a1, const char *a2, ...)
{
  return [a1 _trueMovementThresholdY];
}

id objc_msgSend__updateAccelerationCurve(void *a1, const char *a2, ...)
{
  return [a1 _updateAccelerationCurve];
}

id objc_msgSend__updateAccelerationFactorForPointerMovementMapper(void *a1, const char *a2, ...)
{
  return [a1 _updateAccelerationFactorForPointerMovementMapper];
}

id objc_msgSend__updateCaptureDeviceIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 _updateCaptureDeviceIfNeeded];
}

id objc_msgSend__updateDebugOverlay(void *a1, const char *a2, ...)
{
  return [a1 _updateDebugOverlay];
}

id objc_msgSend__updateLayerGeometry(void *a1, const char *a2, ...)
{
  return [a1 _updateLayerGeometry];
}

id objc_msgSend__updateMovementThresholdforPointerMovementMapper(void *a1, const char *a2, ...)
{
  return [a1 _updateMovementThresholdforPointerMovementMapper];
}

id objc_msgSend__updateScreenBounds(void *a1, const char *a2, ...)
{
  return [a1 _updateScreenBounds];
}

id objc_msgSend__updateWindowForDebugOverlay(void *a1, const char *a2, ...)
{
  return [a1 _updateWindowForDebugOverlay];
}

id objc_msgSend__useCustomCenter(void *a1, const char *a2, ...)
{
  return [a1 _useCustomCenter];
}

id objc_msgSend__values(void *a1, const char *a2, ...)
{
  return [a1 _values];
}

id objc_msgSend__valuesWithTimestamps(void *a1, const char *a2, ...)
{
  return [a1 _valuesWithTimestamps];
}

id objc_msgSend__velocityBasedPointMapper(void *a1, const char *a2, ...)
{
  return [a1 _velocityBasedPointMapper];
}

id objc_msgSend__verticalNormalizationFactor(void *a1, const char *a2, ...)
{
  return [a1 _verticalNormalizationFactor];
}

id objc_msgSend__videoCapturer(void *a1, const char *a2, ...)
{
  return [a1 _videoCapturer];
}

id objc_msgSend__videoDataOutput(void *a1, const char *a2, ...)
{
  return [a1 _videoDataOutput];
}

id objc_msgSend__videoFileInputURLsByInputUniqueID(void *a1, const char *a2, ...)
{
  return [a1 _videoFileInputURLsByInputUniqueID];
}

id objc_msgSend__videoFileReader(void *a1, const char *a2, ...)
{
  return [a1 _videoFileReader];
}

id objc_msgSend__videoPreviewBounds(void *a1, const char *a2, ...)
{
  return [a1 _videoPreviewBounds];
}

id objc_msgSend__videoPreviewLayer(void *a1, const char *a2, ...)
{
  return [a1 _videoPreviewLayer];
}

id objc_msgSend__visionKitEyeTracker(void *a1, const char *a2, ...)
{
  return [a1 _visionKitEyeTracker];
}

id objc_msgSend__xpcConnections(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnections];
}

id objc_msgSend__xpcConnectionsQueue(void *a1, const char *a2, ...)
{
  return [a1 _xpcConnectionsQueue];
}

id objc_msgSend__xpcListener(void *a1, const char *a2, ...)
{
  return [a1 _xpcListener];
}

id objc_msgSend__yawPitchRollTextLayer(void *a1, const char *a2, ...)
{
  return [a1 _yawPitchRollTextLayer];
}

id objc_msgSend_acceleration(void *a1, const char *a2, ...)
{
  return [a1 acceleration];
}

id objc_msgSend_accelerationFactor(void *a1, const char *a2, ...)
{
  return [a1 accelerationFactor];
}

id objc_msgSend_accelerometerData(void *a1, const char *a2, ...)
{
  return [a1 accelerometerData];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_activeFormat(void *a1, const char *a2, ...)
{
  return [a1 activeFormat];
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 activeInterfaceOrientation];
}

id objc_msgSend_activeVideoMaxFrameDuration(void *a1, const char *a2, ...)
{
  return [a1 activeVideoMaxFrameDuration];
}

id objc_msgSend_activeVideoMinFrameDuration(void *a1, const char *a2, ...)
{
  return [a1 activeVideoMinFrameDuration];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_allowedTrackingTypes(void *a1, const char *a2, ...)
{
  return [a1 allowedTrackingTypes];
}

id objc_msgSend_anchors(void *a1, const char *a2, ...)
{
  return [a1 anchors];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_availableMetadataObjectTypes(void *a1, const char *a2, ...)
{
  return [a1 availableMetadataObjectTypes];
}

id objc_msgSend_backlightState(void *a1, const char *a2, ...)
{
  return [a1 backlightState];
}

id objc_msgSend_begin(void *a1, const char *a2, ...)
{
  return [a1 begin];
}

id objc_msgSend_beginConfiguration(void *a1, const char *a2, ...)
{
  return [a1 beginConfiguration];
}

id objc_msgSend_bksEffectiveOrientation(void *a1, const char *a2, ...)
{
  return [a1 bksEffectiveOrientation];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_blendShapes(void *a1, const char *a2, ...)
{
  return [a1 blendShapes];
}

id objc_msgSend_blueColor(void *a1, const char *a2, ...)
{
  return [a1 blueColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_boundingBox(void *a1, const char *a2, ...)
{
  return [a1 boundingBox];
}

id objc_msgSend_boundingBoxInImageCoordinates(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxInImageCoordinates];
}

id objc_msgSend_boundingBoxInNormalizedCoordinates(void *a1, const char *a2, ...)
{
  return [a1 boundingBoxInNormalizedCoordinates];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buffer(void *a1, const char *a2, ...)
{
  return [a1 buffer];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_camera(void *a1, const char *a2, ...)
{
  return [a1 camera];
}

id objc_msgSend_canPerformReactionEffects(void *a1, const char *a2, ...)
{
  return [a1 canPerformReactionEffects];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_cancelReading(void *a1, const char *a2, ...)
{
  return [a1 cancelReading];
}

id objc_msgSend_captureDeviceUniqueID(void *a1, const char *a2, ...)
{
  return [a1 captureDeviceUniqueID];
}

id objc_msgSend_captureSession(void *a1, const char *a2, ...)
{
  return [a1 captureSession];
}

id objc_msgSend_charValue(void *a1, const char *a2, ...)
{
  return [a1 charValue];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return [a1 commit];
}

id objc_msgSend_commitConfiguration(void *a1, const char *a2, ...)
{
  return [a1 commitConfiguration];
}

id objc_msgSend_compact(void *a1, const char *a2, ...)
{
  return [a1 compact];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_copyNextSampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 copyNextSampleBuffer];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return [a1 currentConnection];
}

id objc_msgSend_currentDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentDeviceOrientation];
}

id objc_msgSend_currentFrame(void *a1, const char *a2, ...)
{
  return [a1 currentFrame];
}

id objc_msgSend_currentInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 currentInterfaceOrientation];
}

id objc_msgSend_currentMode(void *a1, const char *a2, ...)
{
  return [a1 currentMode];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_debugOverlayEnabled(void *a1, const char *a2, ...)
{
  return [a1 debugOverlayEnabled];
}

id objc_msgSend_debugOverlayRootView(void *a1, const char *a2, ...)
{
  return [a1 debugOverlayRootView];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultExpressionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultExpressionConfiguration];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delta(void *a1, const char *a2, ...)
{
  return [a1 delta];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return [a1 distantFuture];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_effectiveOrientationToken(void *a1, const char *a2, ...)
{
  return [a1 effectiveOrientationToken];
}

id objc_msgSend_emptyAccessibilityExpressions(void *a1, const char *a2, ...)
{
  return [a1 emptyAccessibilityExpressions];
}

id objc_msgSend_error(void *a1, const char *a2, ...)
{
  return [a1 error];
}

id objc_msgSend_expressionConfiguration(void *a1, const char *a2, ...)
{
  return [a1 expressionConfiguration];
}

id objc_msgSend_expressions(void *a1, const char *a2, ...)
{
  return [a1 expressions];
}

id objc_msgSend_faceData(void *a1, const char *a2, ...)
{
  return [a1 faceData];
}

id objc_msgSend_faceID(void *a1, const char *a2, ...)
{
  return [a1 faceID];
}

id objc_msgSend_faceMeshPayload(void *a1, const char *a2, ...)
{
  return [a1 faceMeshPayload];
}

id objc_msgSend_faceScreenGaze(void *a1, const char *a2, ...)
{
  return [a1 faceScreenGaze];
}

id objc_msgSend_fieldOfView(void *a1, const char *a2, ...)
{
  return [a1 fieldOfView];
}

id objc_msgSend_filled(void *a1, const char *a2, ...)
{
  return [a1 filled];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_formatDescription(void *a1, const char *a2, ...)
{
  return [a1 formatDescription];
}

id objc_msgSend_formats(void *a1, const char *a2, ...)
{
  return [a1 formats];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_framesPerSecond(void *a1, const char *a2, ...)
{
  return [a1 framesPerSecond];
}

id objc_msgSend_geometricDistortionCorrectedVideoFieldOfView(void *a1, const char *a2, ...)
{
  return [a1 geometricDistortionCorrectedVideoFieldOfView];
}

id objc_msgSend_geometry(void *a1, const char *a2, ...)
{
  return [a1 geometry];
}

id objc_msgSend_greenColor(void *a1, const char *a2, ...)
{
  return [a1 greenColor];
}

id objc_msgSend_hasFace(void *a1, const char *a2, ...)
{
  return [a1 hasFace];
}

id objc_msgSend_hasPitchAngle(void *a1, const char *a2, ...)
{
  return [a1 hasPitchAngle];
}

id objc_msgSend_hasYawAngle(void *a1, const char *a2, ...)
{
  return [a1 hasYawAngle];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return [a1 heightAnchor];
}

id objc_msgSend_hidMatchingDictionary(void *a1, const char *a2, ...)
{
  return [a1 hidMatchingDictionary];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageResolution(void *a1, const char *a2, ...)
{
  return [a1 imageResolution];
}

id objc_msgSend_imageSize(void *a1, const char *a2, ...)
{
  return [a1 imageSize];
}

id objc_msgSend_inflectionPoint(void *a1, const char *a2, ...)
{
  return [a1 inflectionPoint];
}

id objc_msgSend_initWithSampleBufferLayer(void *a1, const char *a2, ...)
{
  return [a1 initWithSampleBufferLayer];
}

id objc_msgSend_input(void *a1, const char *a2, ...)
{
  return [a1 input];
}

id objc_msgSend_inputToUse(void *a1, const char *a2, ...)
{
  return [a1 inputToUse];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAccelerometerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isAccelerometerAvailable];
}

id objc_msgSend_isCamera(void *a1, const char *a2, ...)
{
  return [a1 isCamera];
}

id objc_msgSend_isCameraIntrinsicMatrixDeliverySupported(void *a1, const char *a2, ...)
{
  return [a1 isCameraIntrinsicMatrixDeliverySupported];
}

id objc_msgSend_isFaceTrackingSupported(void *a1, const char *a2, ...)
{
  return [a1 isFaceTrackingSupported];
}

id objc_msgSend_isGeometricDistortionCorrectionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isGeometricDistortionCorrectionEnabled];
}

id objc_msgSend_isHIDDevice(void *a1, const char *a2, ...)
{
  return [a1 isHIDDevice];
}

id objc_msgSend_isMainThread(void *a1, const char *a2, ...)
{
  return [a1 isMainThread];
}

id objc_msgSend_isStarted(void *a1, const char *a2, ...)
{
  return [a1 isStarted];
}

id objc_msgSend_isTracked(void *a1, const char *a2, ...)
{
  return [a1 isTracked];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_isVideoBinned(void *a1, const char *a2, ...)
{
  return [a1 isVideoBinned];
}

id objc_msgSend_isVideoFile(void *a1, const char *a2, ...)
{
  return [a1 isVideoFile];
}

id objc_msgSend_isVideoMirroringSupported(void *a1, const char *a2, ...)
{
  return [a1 isVideoMirroringSupported];
}

id objc_msgSend_isVideoRetainedBufferCountHintSupported(void *a1, const char *a2, ...)
{
  return [a1 isVideoRetainedBufferCountHintSupported];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return [a1 items];
}

id objc_msgSend_joystickModeMovementThreshold(void *a1, const char *a2, ...)
{
  return [a1 joystickModeMovementThreshold];
}

id objc_msgSend_landmarkPointsInImageCoordinates(void *a1, const char *a2, ...)
{
  return [a1 landmarkPointsInImageCoordinates];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return [a1 lastObject];
}

id objc_msgSend_lastReportedPoint(void *a1, const char *a2, ...)
{
  return [a1 lastReportedPoint];
}

id objc_msgSend_lastResult(void *a1, const char *a2, ...)
{
  return [a1 lastResult];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return [a1 layer];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockStatusToken(void *a1, const char *a2, ...)
{
  return [a1 lockStatusToken];
}

id objc_msgSend_mainConfiguration(void *a1, const char *a2, ...)
{
  return [a1 mainConfiguration];
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return [a1 mainRunLoop];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return [a1 makeKeyAndVisible];
}

id objc_msgSend_markConfigurationAsFinal(void *a1, const char *a2, ...)
{
  return [a1 markConfigurationAsFinal];
}

id objc_msgSend_maxCount(void *a1, const char *a2, ...)
{
  return [a1 maxCount];
}

id objc_msgSend_maxFrameRate(void *a1, const char *a2, ...)
{
  return [a1 maxFrameRate];
}

id objc_msgSend_maximumValue(void *a1, const char *a2, ...)
{
  return [a1 maximumValue];
}

id objc_msgSend_mean(void *a1, const char *a2, ...)
{
  return [a1 mean];
}

id objc_msgSend_metadataObjectTypes(void *a1, const char *a2, ...)
{
  return [a1 metadataObjectTypes];
}

id objc_msgSend_metadataObjects(void *a1, const char *a2, ...)
{
  return [a1 metadataObjects];
}

id objc_msgSend_mfiAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 mfiAuthenticated];
}

id objc_msgSend_minFrameDuration(void *a1, const char *a2, ...)
{
  return [a1 minFrameDuration];
}

id objc_msgSend_minFrameRate(void *a1, const char *a2, ...)
{
  return [a1 minFrameRate];
}

id objc_msgSend_minimumValue(void *a1, const char *a2, ...)
{
  return [a1 minimumValue];
}

id objc_msgSend_motionTrackingMode(void *a1, const char *a2, ...)
{
  return [a1 motionTrackingMode];
}

id objc_msgSend_motionTrackingUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 motionTrackingUserDefaults];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nextTimedMetadataGroup(void *a1, const char *a2, ...)
{
  return [a1 nextTimedMetadataGroup];
}

id objc_msgSend_nominalFrameRate(void *a1, const char *a2, ...)
{
  return [a1 nominalFrameRate];
}

id objc_msgSend_normalizedTrackedPoint(void *a1, const char *a2, ...)
{
  return [a1 normalizedTrackedPoint];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return [a1 orientation];
}

id objc_msgSend_orientationLocked(void *a1, const char *a2, ...)
{
  return [a1 orientationLocked];
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return [a1 outputs];
}

id objc_msgSend_pause(void *a1, const char *a2, ...)
{
  return [a1 pause];
}

id objc_msgSend_payload(void *a1, const char *a2, ...)
{
  return [a1 payload];
}

id objc_msgSend_pitchAngle(void *a1, const char *a2, ...)
{
  return [a1 pitchAngle];
}

id objc_msgSend_pixelFormatType(void *a1, const char *a2, ...)
{
  return [a1 pixelFormatType];
}

id objc_msgSend_pointValue(void *a1, const char *a2, ...)
{
  return [a1 pointValue];
}

id objc_msgSend_pose(void *a1, const char *a2, ...)
{
  return [a1 pose];
}

id objc_msgSend_poseTranslation(void *a1, const char *a2, ...)
{
  return [a1 poseTranslation];
}

id objc_msgSend_projectedPoint(void *a1, const char *a2, ...)
{
  return [a1 projectedPoint];
}

id objc_msgSend_recalibrateFace(void *a1, const char *a2, ...)
{
  return [a1 recalibrateFace];
}

id objc_msgSend_rectValue(void *a1, const char *a2, ...)
{
  return [a1 rectValue];
}

id objc_msgSend_redColor(void *a1, const char *a2, ...)
{
  return [a1 redColor];
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

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_resolution(void *a1, const char *a2, ...)
{
  return [a1 resolution];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_roll(void *a1, const char *a2, ...)
{
  return [a1 roll];
}

id objc_msgSend_rollAngle(void *a1, const char *a2, ...)
{
  return [a1 rollAngle];
}

id objc_msgSend_sampleBuffer(void *a1, const char *a2, ...)
{
  return [a1 sampleBuffer];
}

id objc_msgSend_sampleBufferWasDropped(void *a1, const char *a2, ...)
{
  return [a1 sampleBufferWasDropped];
}

id objc_msgSend_screenBounds(void *a1, const char *a2, ...)
{
  return [a1 screenBounds];
}

id objc_msgSend_screenBoundsAccountingForInterfaceOrientation(void *a1, const char *a2, ...)
{
  return [a1 screenBoundsAccountingForInterfaceOrientation];
}

id objc_msgSend_screenBoundsAccountingForPhysicalDeviceOrientation(void *a1, const char *a2, ...)
{
  return [a1 screenBoundsAccountingForPhysicalDeviceOrientation];
}

id objc_msgSend_screenGazeRawOutputInCentimeters(void *a1, const char *a2, ...)
{
  return [a1 screenGazeRawOutputInCentimeters];
}

id objc_msgSend_semanticsDictionary(void *a1, const char *a2, ...)
{
  return [a1 semanticsDictionary];
}

id objc_msgSend_sensitivity(void *a1, const char *a2, ...)
{
  return [a1 sensitivity];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedBacklight(void *a1, const char *a2, ...)
{
  return [a1 sharedBacklight];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_sizeValue(void *a1, const char *a2, ...)
{
  return [a1 sizeValue];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_startDaemon(void *a1, const char *a2, ...)
{
  return [a1 startDaemon];
}

id objc_msgSend_startMonitoring(void *a1, const char *a2, ...)
{
  return [a1 startMonitoring];
}

id objc_msgSend_startReading(void *a1, const char *a2, ...)
{
  return [a1 startReading];
}

id objc_msgSend_startRunning(void *a1, const char *a2, ...)
{
  return [a1 startRunning];
}

id objc_msgSend_startTracking(void *a1, const char *a2, ...)
{
  return [a1 startTracking];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return [a1 state];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopAccelerometerUpdates(void *a1, const char *a2, ...)
{
  return [a1 stopAccelerometerUpdates];
}

id objc_msgSend_stopMonitoring(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoring];
}

id objc_msgSend_stopRunning(void *a1, const char *a2, ...)
{
  return [a1 stopRunning];
}

id objc_msgSend_stopTracking(void *a1, const char *a2, ...)
{
  return [a1 stopTracking];
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return [a1 string];
}

id objc_msgSend_supportedVideoFormats(void *a1, const char *a2, ...)
{
  return [a1 supportedVideoFormats];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trackingAreaCenter(void *a1, const char *a2, ...)
{
  return [a1 trackingAreaCenter];
}

id objc_msgSend_trackingState(void *a1, const char *a2, ...)
{
  return [a1 trackingState];
}

id objc_msgSend_trackingStateReason(void *a1, const char *a2, ...)
{
  return [a1 trackingStateReason];
}

id objc_msgSend_trackingType(void *a1, const char *a2, ...)
{
  return [a1 trackingType];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return [a1 transform];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlockForConfiguration(void *a1, const char *a2, ...)
{
  return [a1 unlockForConfiguration];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_usage(void *a1, const char *a2, ...)
{
  return [a1 usage];
}

id objc_msgSend_useAccelerationCurve(void *a1, const char *a2, ...)
{
  return [a1 useAccelerationCurve];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_values(void *a1, const char *a2, ...)
{
  return [a1 values];
}

id objc_msgSend_vertexCount(void *a1, const char *a2, ...)
{
  return [a1 vertexCount];
}

id objc_msgSend_vertices(void *a1, const char *a2, ...)
{
  return [a1 vertices];
}

id objc_msgSend_videoFieldOfView(void *a1, const char *a2, ...)
{
  return [a1 videoFieldOfView];
}

id objc_msgSend_videoSupportedFrameRateRanges(void *a1, const char *a2, ...)
{
  return [a1 videoSupportedFrameRateRanges];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return [a1 whiteColor];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}

id objc_msgSend_yawAngle(void *a1, const char *a2, ...)
{
  return [a1 yawAngle];
}

id objc_msgSend_yellowColor(void *a1, const char *a2, ...)
{
  return [a1 yellowColor];
}