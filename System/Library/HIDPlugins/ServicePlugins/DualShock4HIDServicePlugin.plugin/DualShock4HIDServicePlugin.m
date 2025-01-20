NSXPCInterface *sub_383C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_3850()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

NSXPCInterface *sub_3864()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_3878()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

uint64_t sub_388C()
{
  if (qword_1B3A8 != -1) {
    dispatch_once(&qword_1B3A8, &stru_143E8);
  }
  return byte_1B3A0;
}

void sub_38D0(id a1)
{
  byte_1B3A0 = os_variant_has_internal_diagnostics();
}

id sub_38F8()
{
  if (qword_1B3B8 != -1) {
    dispatch_once(&qword_1B3B8, &stru_14408);
  }
  v0 = (void *)qword_1B3B0;

  return v0;
}

void sub_394C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_1B3B0;
  qword_1B3B0 = (uint64_t)v1;
}

id sub_3990()
{
  if (qword_1B3C8 != -1) {
    dispatch_once(&qword_1B3C8, &stru_14428);
  }
  v0 = (void *)qword_1B3C0;

  return v0;
}

void sub_39E4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_1B3C0;
  qword_1B3C0 = (uint64_t)v1;
}

id sub_3A28()
{
  if (qword_1B3D8 != -1) {
    dispatch_once(&qword_1B3D8, &stru_14448);
  }
  v0 = (void *)qword_1B3D0;

  return v0;
}

void sub_3A7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_1B3D0;
  qword_1B3D0 = (uint64_t)v1;
}

id sub_3AC0()
{
  if (qword_1B3E8 != -1) {
    dispatch_once(&qword_1B3E8, &stru_14468);
  }
  v0 = (void *)qword_1B3E0;

  return v0;
}

void sub_3B14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_1B3E0;
  qword_1B3E0 = (uint64_t)v1;
}

id sub_3B58()
{
  if (qword_1B3F8 != -1) {
    dispatch_once(&qword_1B3F8, &stru_14488);
  }
  v0 = (void *)qword_1B3F0;

  return v0;
}

void sub_3BAC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_1B3F0;
  qword_1B3F0 = (uint64_t)v1;
}

void sub_3BF0(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_1B400;
  qword_1B400 = (uint64_t)v1;
}

id sub_3C30()
{
  if (qword_1B408 != -1) {
    dispatch_once(&qword_1B408, &stru_144A8);
  }
  v0 = (void *)qword_1B400;

  return v0;
}

void sub_3C84(id a1)
{
  if (!qword_1B400) {
    objc_storeStrong((id *)&qword_1B400, &_os_log_default);
  }
}

id sub_3CA8()
{
  if (qword_1B418 != -1) {
    dispatch_once(&qword_1B418, &stru_144C8);
  }
  v0 = (void *)qword_1B410;

  return v0;
}

void sub_3CFC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_1B410;
  qword_1B410 = (uint64_t)v1;
}

id sub_3D40()
{
  if (qword_1B428 != -1) {
    dispatch_once(&qword_1B428, &stru_144E8);
  }
  v0 = (void *)qword_1B420;

  return v0;
}

void sub_3D94(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_1B420;
  qword_1B420 = (uint64_t)v1;
}

id sub_3DD8()
{
  if (qword_1B438 != -1) {
    dispatch_once(&qword_1B438, &stru_14508);
  }
  v0 = (void *)qword_1B430;

  return v0;
}

void sub_3E2C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_1B430;
  qword_1B430 = (uint64_t)v1;
}

id sub_3E70()
{
  if (qword_1B448 != -1) {
    dispatch_once(&qword_1B448, &stru_14528);
  }
  v0 = (void *)qword_1B440;

  return v0;
}

void sub_3EC4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_1B440;
  qword_1B440 = (uint64_t)v1;
}

id sub_3F08()
{
  return +[NSData dataWithBytes:&unk_12C00 length:37];
}

void sub_407C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4128(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_4298(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4398(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4518(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_45E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_4ACC(uint64_t a1, int a2)
{
  v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_14950;
      }
      else {
        CFStringRef v6 = @":";
      }
      v7 = +[NSString stringWithFormat:@"%02x%@", *(unsigned __int8 *)(a1 + (v5 - 2)), v6];
      [v4 appendString:v7];

      --v5;
    }
    while (v5 > 1);
  }
  v8 = +[NSString stringWithString:v4];
  v9 = [v8 uppercaseString];

  return v9;
}

uint64_t sub_4BD4()
{
  if (qword_1B450 != -1) {
    dispatch_once(&qword_1B450, &stru_14548);
  }
  return byte_1B458;
}

void sub_4C18(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_1B458 = [v1 BOOLForKey:@"GCPartnersEnable"];
  v2 = sub_3C30();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_1B458;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

id sub_4CF8()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  id v1 = sub_383C();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v2 = sub_3850();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v3 = sub_87D4();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v4 = sub_87E8();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_4FC8();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  CFStringRef v6 = sub_4FDC();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v7 = sub_87AC();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v8 = sub_87C0();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v9 = sub_C8A0();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v10 = sub_C8B4();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v11 = sub_3864();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v12 = sub_3878();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_4FB4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

NSXPCInterface *sub_4FC8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_4FDC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

void sub_4FF0()
{
}

void sub_576C(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  kdebug_trace();
  if (a2)
  {
    v8 = sub_3C30();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_C934();
    }
  }
  else
  {
    if (a4 >= 0x35) {
      size_t v9 = 53;
    }
    else {
      size_t v9 = a4;
    }
    memcpy((void *)(*(void *)(a1 + 32) + 857), a3, v9);
    *(unsigned char *)(*(void *)(a1 + 32) + 873) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 889) = 0;
    v8 = sub_3C30();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = *(_OWORD *)(*(void *)(a1 + 32) + 857);
      long long v11 = *(_OWORD *)(*(void *)(a1 + 32) + 873);
      long long v12 = *(_OWORD *)(*(void *)(a1 + 32) + 889);
      *(void *)&v15[13] = *(void *)(*(void *)(a1 + 32) + 902);
      v14[1] = v11;
      *(_OWORD *)v15 = v12;
      v14[0] = v10;
      v13 = sub_58EC((uint64_t)v14);
      LODWORD(v14[0]) = 138412290;
      *(void *)((char *)v14 + 4) = v13;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "(Async) Firmware Info = %@", (uint8_t *)v14, 0xCu);
    }
  }

  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_58EC(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    v18[0] = @"ReportID";
    v17 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
    v19[0] = v17;
    v18[1] = @"Build Date";
    uint64_t v2 = +[NSString stringWithUTF8String:a1 + 1];
    v3 = (void *)v2;
    if (v2) {
      CFStringRef v4 = (const __CFString *)v2;
    }
    else {
      CFStringRef v4 = @"<invalid>";
    }
    v19[1] = v4;
    v18[2] = @"Build Time";
    uint64_t v5 = +[NSString stringWithUTF8String:a1 + 17];
    CFStringRef v6 = (void *)v5;
    if (v5) {
      CFStringRef v7 = (const __CFString *)v5;
    }
    else {
      CFStringRef v7 = @"<invalid>";
    }
    v19[2] = v7;
    v18[3] = @"Device Revision";
    v8 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 33)];
    v19[3] = v8;
    v18[4] = @"Hardware Version";
    size_t v9 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 35)];
    v19[4] = v9;
    v18[5] = @"Software Version";
    long long v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 37)];
    v19[5] = v10;
    v18[6] = @"Software Subversion";
    long long v11 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 41)];
    v19[6] = v11;
    v18[7] = @"Software Series Info";
    long long v12 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 43)];
    v19[7] = v12;
    v18[8] = @"Code Size";
    v13 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 45)];
    v19[8] = v13;
    v18[9] = @"CRC 32";
    v14 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 49)];
    v19[9] = v14;
    v15 = +[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:10];
  }
  else
  {
    v15 = +[NSDictionary dictionary];
  }

  return v15;
}

void sub_5D20(uint64_t a1, int a2, const void *a3, unint64_t a4)
{
  kdebug_trace();
  if (a2)
  {
    v8 = sub_3C30();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_CA08();
    }
LABEL_4:

    goto LABEL_18;
  }
  if (a4 >= 0x29) {
    size_t v9 = 41;
  }
  else {
    size_t v9 = a4;
  }
  memcpy((void *)(*(void *)(a1 + 32) + 816), a3, v9);
  if (sub_388C())
  {
    v14 = sub_3C30();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = (_OWORD *)(*(void *)(a1 + 32) + 816);
      *(_OWORD *)buf = *v15;
      v35[0] = v15[1];
      *(_OWORD *)((char *)v35 + 9) = *(_OWORD *)((char *)v15 + 25);
      v16 = sub_6450((uint64_t)buf);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v16;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "(Async) Sensor Calibration Info = %@", buf, 0xCu);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  double v11 = (double)(*(__int16 *)(v10 + 837) + *(__int16 *)(v10 + 835)) * 0.5;
  *(double *)(v10 + 736) = v11
                         / ((fabs((double)(*(__int16 *)(v10 + 823) - *(__int16 *)(v10 + 817)))
                           + fabs((double)(*(__int16 *)(v10 + 825) - *(__int16 *)(v10 + 817))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 736) = *(double *)(*(void *)(a1 + 32) + 736) * 0.0174532925;
  uint64_t v12 = *(void *)(a1 + 32);
  *(double *)(v12 + 744) = v11
                         / ((fabs((double)(*(__int16 *)(v12 + 827) - *(__int16 *)(v12 + 819)))
                           + fabs((double)(*(__int16 *)(v12 + 829) - *(__int16 *)(v12 + 819))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 744) = *(double *)(*(void *)(a1 + 32) + 744) * 0.0174532925;
  uint64_t v13 = *(void *)(a1 + 32);
  *(double *)(v13 + 752) = v11
                         / ((fabs((double)(*(__int16 *)(v13 + 831) - *(__int16 *)(v13 + 821)))
                           + fabs((double)(*(__int16 *)(v13 + 833) - *(__int16 *)(v13 + 821))))
                          * 0.5);
  *(double *)(*(void *)(a1 + 32) + 752) = *(double *)(*(void *)(a1 + 32) + 752) * 0.0174532925;
  *(double *)(*(void *)(a1 + 32) + 760) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 841)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 839))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 768) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 845)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 843))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 776) = (double)(*(__int16 *)(*(void *)(a1 + 32) + 849)
                                                     + *(__int16 *)(*(void *)(a1 + 32) + 847))
                                            * 0.5;
  *(double *)(*(void *)(a1 + 32) + 784) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 839)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 841));
  *(double *)(*(void *)(a1 + 32) + 792) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 843)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 845));
  *(double *)(*(void *)(a1 + 32) + 800) = 2.0
                                            / (double)(*(__int16 *)(*(void *)(a1 + 32) + 847)
                                                     - *(__int16 *)(*(void *)(a1 + 32) + 849));
  if (sub_388C())
  {
    log = sub_3C30();
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = *(void *)(*(void *)(a1 + 32) + 736);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v17;
      _os_log_impl(&dword_0, log, OS_LOG_TYPE_INFO, "(Async) Gyro Pitch Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v18 = sub_3C30();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 32) + 744);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "(Async) Gyro Yaw Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v20 = sub_3C30();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = *(void *)(*(void *)(a1 + 32) + 752);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "(Async) Gyro Roll Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v22 = sub_3C30();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = *(void *)(*(void *)(a1 + 32) + 760);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Bias = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v24 = sub_3C30();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = *(void *)(*(void *)(a1 + 32) + 768);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v25;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Bias = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v26 = sub_3C30();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = *(void *)(*(void *)(a1 + 32) + 776);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v27;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Bias = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v28 = sub_3C30();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = *(void *)(*(void *)(a1 + 32) + 784);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v29;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "(Async) Accelerometer X Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v30 = sub_3C30();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 792);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "(Async) Accelerometer Y Sensitivity = %f", buf, 0xCu);
    }
  }
  if (sub_388C())
  {
    v8 = sub_3C30();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = *(void *)(*(void *)(a1 + 32) + 800);
      *(_DWORD *)buf = 134217984;
      *(void *)&buf[4] = v32;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "(Async) Accelerometer Z Sensitivity = %f", buf, 0xCu);
    }
    goto LABEL_4;
  }
LABEL_18:
  free(*(void **)(a1 + 48));
  free(*(void **)(a1 + 56));
}

id sub_6450(uint64_t a1)
{
  if (*(unsigned char *)a1)
  {
    v24[0] = @"ReportID";
    uint64_t v23 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:");
    v25[0] = v23;
    v24[1] = @"gyroPitchBias";
    v22 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 1)];
    v25[1] = v22;
    v24[2] = @"gyroYawBias";
    uint64_t v21 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 3)];
    v25[2] = v21;
    v24[3] = @"gyroRollBias";
    v20 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 5)];
    v25[3] = v20;
    v24[4] = @"gyroRefPitchPlus";
    uint64_t v19 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 7)];
    v25[4] = v19;
    v24[5] = @"gyroRefPitchMinus";
    v18 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 9)];
    v25[5] = v18;
    v24[6] = @"gyroRefYawPlus";
    uint64_t v17 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 11)];
    v25[6] = v17;
    v24[7] = @"gyroRefYawMinus";
    v16 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 13)];
    v25[7] = v16;
    v24[8] = @"gyroRefRollPlus";
    v15 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 15)];
    v25[8] = v15;
    v24[9] = @"gyroRefRollMinus";
    v14 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 17)];
    v25[9] = v14;
    v24[10] = @"gyroRefSpeedPlus";
    uint64_t v13 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 19)];
    v25[10] = v13;
    v24[11] = @"gyroRefSpeedMinus";
    uint64_t v2 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 21)];
    v25[11] = v2;
    v24[12] = @"accelRefXPlus";
    v3 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 23)];
    v25[12] = v3;
    v24[13] = @"accelRefXMinus";
    CFStringRef v4 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 25)];
    v25[13] = v4;
    v24[14] = @"accelRefYPlus";
    uint64_t v5 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 27)];
    v25[14] = v5;
    v24[15] = @"accelRefYMinus";
    CFStringRef v6 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 29)];
    v25[15] = v6;
    v24[16] = @"accelRefZPlus";
    CFStringRef v7 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 31)];
    v25[16] = v7;
    v24[17] = @"accelRefZMinus";
    v8 = +[NSNumber numberWithShort:*(__int16 *)(a1 + 33)];
    v25[17] = v8;
    v24[18] = @"calibrationTemp";
    size_t v9 = +[NSNumber numberWithUnsignedShort:*(unsigned __int16 *)(a1 + 35)];
    v25[18] = v9;
    v24[19] = @"CRC 32";
    uint64_t v10 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 37)];
    v25[19] = v10;
    double v11 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:20];
  }
  else
  {
    double v11 = +[NSDictionary dictionary];
  }

  return v11;
}

void sub_6C10(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_6C38(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v14 = a2;
  id v15 = a6;
  v16 = (id *)(a1 + 32);
  WeakRetained = (dispatch_once_t *)objc_loadWeakRetained((id *)(a1 + 32));
  v18 = WeakRetained;
  if (!WeakRetained) {
    goto LABEL_32;
  }
  sub_AC6C((uint64_t)WeakRetained);
  kdebug_trace();
  memset(v108, 0, 43);
  long long v106 = 0u;
  long long v107 = 0u;
  if (a5 == 17)
  {
    id v20 = v15;
    [v20 bytes];
    if (!*((unsigned char *)v18 + 944)) {
      [(dispatch_once_t *)v18 setExtendedSupportEnabled:1];
    }
    [v20 length];
    __memcpy_chk();
  }
  else
  {
    if (a5 != 1) {
      goto LABEL_32;
    }
    id v19 = v15;
    [v19 bytes];
    if ([(dispatch_once_t *)v18 isBluetoothClassic])
    {
      if ([v19 length] != (char *)&dword_8 + 2) {
        goto LABEL_32;
      }
    }
    if (([(dispatch_once_t *)v18 isBluetoothClassic] & 1) == 0
      && [v19 length] != &stru_20.vmsize)
    {
      goto LABEL_32;
    }
    [v19 length];
    __memcpy_chk();
    if ([(dispatch_once_t *)v18 isBluetoothClassic]
      && [v19 length] == (char *)&dword_8 + 2)
    {
      BYTE13(v107) = BYTE13(v107) & 0xF0 | 0xA;
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_744C;
  block[3] = &unk_145C0;
  uint64_t v21 = v18;
  v104 = v21;
  objc_copyWeak(&v105, v16);
  if (v18[101] != -1) {
    dispatch_once(v18 + 101, block);
  }
  [(dispatch_once_t *)v21 updateBatteryLevel:BYTE13(v107) & 0xF isPowerSupplyConnected:(BYTE13(v107) >> 4) & 1];
  if (*((unsigned char *)v21 + 728))
  {
    double v71 = *((double *)v21 + 94) * (double)(*(__int16 *)((char *)v21 + 821) - (__int16)v107);
    double v72 = *((double *)v21 + 92) * (double)(SWORD6(v106) - *(__int16 *)((char *)v21 + 817));
    double v69 = -(((double)SWORD1(v107) - *((double *)v21 + 95)) * *((double *)v21 + 98));
    double v70 = *((double *)v21 + 93) * (double)(SHIWORD(v106) - *(__int16 *)((char *)v21 + 819));
    double v22 = -(((double)SWORD2(v107) - *((double *)v21 + 96)) * *((double *)v21 + 99));
    double v65 = v22;
    double v67 = ((double)SWORD3(v107) - *((double *)v21 + 97)) * *((double *)v21 + 100);
    char v23 = 1;
  }
  else
  {
    char v23 = 0;
    double v22 = 0.0;
    double v71 = 0.0;
    double v72 = 0.0;
    double v69 = 0.0;
    double v70 = 0.0;
    double v65 = 0.0;
    double v67 = 0.0;
  }
  LOBYTE(v22) = BYTE1(v106);
  *(double *)&unint64_t v24 = ((double)*(unint64_t *)&v22 + -127.5) / -127.5;
  float v25 = *(double *)&v24;
  LOBYTE(v24) = BYTE3(v106);
  float v26 = ((double)v24 + -127.5) / -127.5;
  float v27 = 0.0;
  float v28 = 0.0;
  float v29 = 0.0;
  float v30 = 0.0;
  int8x8_t v31 = 0;
  int8x8_t v32 = 0;
  if (LOBYTE(v108[0]))
  {
    uint64_t v33 = LOBYTE(v108[0]) - 1;
    if ((*((char *)v108 + 9 * v33 + 2) & 0x80000000) == 0)
    {
      unsigned int v34 = *(_WORD *)((unsigned char *)v108 + 9 * v33 + 3) & 0xFFF;
      unsigned int v35 = (*(unsigned __int16 *)((char *)v108 + 9 * v33 + 3) | (*((unsigned __int8 *)v108 + 9 * v33 + 5) << 16)) >> 12;
      float v36 = (float)((float)((float)v35 / 941.0) + (float)((float)v35 / 941.0)) + -1.0;
      float v27 = fmaxf(-v36, 0.0);
      float v28 = fmaxf(v36, 0.0);
      *(float *)v37.i32 = -(float)((float)((float)((float)v34 / 1919.0) + (float)((float)v34 / 1919.0)) + -1.0);
      v38.i32[0] = 0;
      v38.f32[1] = (float)((float)((float)v34 / 1919.0) + (float)((float)v34 / 1919.0)) + -1.0;
      *(float *)&v37.i32[1] = v38.f32[1];
      int8x8_t v31 = vand_s8(v37, (int8x8_t)vcgt_f32(v38, (float32x2_t)v38.u32[1]));
    }
    uint64_t v39 = 9 * v33;
    if ((*((char *)v108 + v39 + 6) & 0x80000000) == 0)
    {
      unsigned int v40 = *(unsigned __int16 *)((char *)v108 + v39 + 7) | (*((unsigned __int8 *)v108 + v39 + 9) << 16);
      *(float *)&unsigned int v41 = (float)((float)((float)(v40 & 0xFFF) / 1919.0) + (float)((float)(v40 & 0xFFF) / 1919.0)) + -1.0;
      float v42 = (float)((float)((float)(v40 >> 12) / 941.0) + (float)((float)(v40 >> 12) / 941.0)) + -1.0;
      float v29 = fmaxf(-v42, 0.0);
      float v30 = fmaxf(v42, 0.0);
      *(float *)v43.i32 = -*(float *)&v41;
      v44.i32[0] = 0;
      v44.f32[1] = *(float *)&v41;
      v43.i32[1] = v41;
      int8x8_t v32 = vand_s8(v43, (int8x8_t)vcgt_f32(v44, (float32x2_t)v41));
    }
  }
  int8x8_t v75 = v31;
  int8x8_t v76 = v32;
  float v77 = v28;
  float v78 = v27;
  float v79 = v29;
  LOBYTE(v6) = v106;
  LOBYTE(v7) = BYTE2(v106);
  unsigned int v45 = BYTE6(v106);
  unsigned int v46 = WORD2(v106);
  if (v25 >= 0.0) {
    float v47 = 0.0;
  }
  else {
    float v47 = -v25;
  }
  float v48 = -v26;
  if (v26 >= 0.0) {
    float v48 = 0.0;
  }
  float v73 = v48;
  float v74 = v30;
  LOBYTE(v8) = BYTE8(v106);
  LOBYTE(v9) = BYTE7(v106);
  -[dispatch_once_t dispatchHomeButtonEventWithValue:timestamp:](v21, "dispatchHomeButtonEventWithValue:timestamp:", BYTE6(v106) & 1, a3, *(void *)&v65, *(void *)&v67);
  [(dispatch_once_t *)v21 dispatchMenuButtonEventWithValue:(WORD2(v106) >> 13) & 1 timestamp:a3];
  [(dispatch_once_t *)v21 dispatchOptionsButtonEventWithValue:(WORD2(v106) >> 12) & 1 timestamp:a3];
  unsigned int v49 = v46 | (v45 << 16);
  int32x2_t v50 = vdup_n_s32(v46 & 0xF);
  int8x8_t v51 = (int8x8_t)vdup_n_s32(v49);
  *(float *)&unsigned int v52 = ((double)v6 + -127.5) / 127.5;
  *(float *)&unsigned int v53 = ((double)v7 + -127.5) / 127.5;
  __asm { FMOV            V16.2S, #1.0 }
  float32x2_t v59 = vcvt_f32_u32((uint32x2_t)(*(void *)&vshl_u32((uint32x2_t)vand_s8(v51, (int8x8_t)0xFF000000FFLL), (uint32x2_t)0xFFFFFFFAFFFFFFFBLL) & 0xFFFFFFF1FFFFFFF1));
  *(void *)&v51 &= 0xFFFFFF00FFFFFFuLL;
  v60.i32[0] = 0;
  v60.i32[1] = v52;
  *(float *)v61.i32 = -*(float *)&v52;
  v61.i32[1] = v52;
  int8x8_t v62 = vand_s8(v61, (int8x8_t)vcgt_f32(v60, (float32x2_t)v52));
  v63.i32[0] = 0;
  v63.i32[1] = v53;
  int8x8_t v64 = (int8x8_t)vcgt_f32(v63, (float32x2_t)v53);
  v63.f32[0] = -*(float *)&v53;
  v63.i32[1] = v53;
  uint64_t v80 = 0;
  int8x8_t v81 = vbsl_s8((int8x8_t)vceq_s32(v50, (int32x2_t)0x400000000), _D16, (int8x8_t)vcvt_f32_u32((uint32x2_t)vand_s8(vorr_s8((int8x8_t)vceq_s32(v50, (int32x2_t)0x500000001), (int8x8_t)vceq_s32(v50, (int32x2_t)0x300000007)), (int8x8_t)0x100000001)));
  int8x8_t v82 = vbsl_s8((int8x8_t)vceq_s32(v50, (int32x2_t)0x200000006), _D16, vand_s8((int8x8_t)vceq_s32(vdup_n_s32(v46 & 0xD), (int32x2_t)0x100000005), _D16));
  double v83 = *(double *)&v59;
  *(float *)&uint64_t v84 = (float)((v46 >> 4) & 1);
  *((float *)&v84 + 1) = (float)((v49 >> 7) & 1);
  float32x2_t v85 = vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)v51, (uint32x2_t)0xFFFFFFF7FFFFFFF8), (int8x8_t)0x100000001));
  unint64_t v86 = __PAIR64__(LODWORD(v47), COERCE_UNSIGNED_INT(fmaxf(v25, 0.0)));
  int8x8_t v87 = v62;
  *(void *)&long long v88 = __PAIR64__(LODWORD(v73), COERCE_UNSIGNED_INT(fmaxf(v26, 0.0)));
  *((int8x8_t *)&v88 + 1) = vand_s8((int8x8_t)v63, v64);
  *(float *)&long long v89 = (float)v9 / 255.0;
  *((float *)&v89 + 1) = (float)v8 / 255.0;
  *((float32x2_t *)&v89 + 1) = vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)v51, (uint32x2_t)0xFFFFFFF1FFFFFFF2), (int8x8_t)0x100000001));
  uint64_t v90 = 0;
  int v91 = 0;
  float v92 = v78;
  float v93 = v77;
  int8x8_t v94 = v75;
  float v95 = v79;
  float v96 = v74;
  int8x8_t v97 = v76;
  float v98 = (float)((v45 >> 1) & 1);
  uint64_t v102 = 0;
  long long v101 = 0u;
  long long v100 = 0u;
  long long v99 = 0u;
  [(dispatch_once_t *)v21 dispatchGameControllerExtendedEventWithState:&v80 timestamp:a3];
  if (*((unsigned char *)v21 + 728))
  {
    LOBYTE(v80) = v23;
    *(_DWORD *)((char *)&v80 + 1) = 0;
    HIDWORD(v80) = 0;
    int8x8_t v81 = *(int8x8_t *)&v72;
    int8x8_t v82 = *(int8x8_t *)&v71;
    double v83 = v70;
    LOBYTE(v84) = v23;
    *(_DWORD *)((char *)&v84 + 1) = 0;
    HIDWORD(v84) = 0;
    float32x2_t v85 = *(float32x2_t *)&v69;
    unint64_t v86 = v68;
    int8x8_t v87 = v66;
    long long v88 = 0u;
    long long v89 = 0u;
    uint64_t v90 = 0;
    [(dispatch_once_t *)v21 dispatchMotionEventWithState:&v80 timestamp:a3];
  }
  objc_destroyWeak(&v105);

LABEL_32:
}

void sub_7434(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_744C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dispatchQueue];
  if (v2)
  {
    dispatch_time_t v3 = dispatch_time(0, 2500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_752C;
    block[3] = &unk_14598;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    dispatch_after(v3, v2, block);
    objc_destroyWeak(&v5);
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 707) = 1;
  }
}

void sub_752C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    dispatch_time_t v3 = objc_loadWeakRetained(v1);
    v3[707] = 1;
    [v3 sendBatteryReport];
  }
}

void sub_7970(uint64_t a1, int a2)
{
  kdebug_trace();
  if (a2)
  {
    dispatch_time_t v3 = sub_3C30();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_CB20();
    }
  }
}

void sub_79DC(uint64_t a1, int a2)
{
  kdebug_trace();
  if (a2)
  {
    dispatch_time_t v3 = sub_3C30();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_CB88();
    }
  }
}

id sub_8210(uint64_t a1)
{
  uint64_t v2 = sub_3C30();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    double v3 = *(float *)(a1 + 40);
    double v4 = *(float *)(a1 + 44);
    double v5 = *(float *)(a1 + 48);
    int v8 = 134218496;
    double v9 = v3;
    __int16 v10 = 2048;
    double v11 = v4;
    __int16 v12 = 2048;
    double v13 = v5;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "updateLightWithRed:%f green:%f blue:%f", (uint8_t *)&v8, 0x20u);
  }

  unint64_t v6 = *(unsigned char **)(a1 + 32);
  if (!v6[944])
  {
    [v6 setExtendedSupportEnabled:1];
    unint64_t v6 = *(unsigned char **)(a1 + 32);
  }
  v6[729] = (int)(float)(*(float *)(a1 + 40) * 255.0);
  *(unsigned char *)(*(void *)(a1 + 32) + 730) = (int)(float)(*(float *)(a1 + 44) * 255.0);
  *(unsigned char *)(*(void *)(a1 + 32) + 731) = (int)(float)(*(float *)(a1 + 48) * 255.0);
  id result = [*(id *)(a1 + 32) isHapticsActive];
  if ((result & 1) == 0) {
    return [*(id *)(a1 + 32) dispatchOutputReport];
  }
  return result;
}

void sub_850C(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v2 = *(unsigned char **)(a1 + 32);
    if (!v2[944]) {
      [v2 setExtendedSupportEnabled:1];
    }
  }
  double v3 = sub_3C30();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = *(unsigned __int8 *)(a1 + 40);
    v5[0] = 67109120;
    v5[1] = v4;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "updateSensorsEnabled %d", (uint8_t *)v5, 8u);
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 728) = *(unsigned char *)(a1 + 40);
}

void sub_8768(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_8784(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

NSXPCInterface *sub_87AC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_87C0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_87D4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_87E8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

NSObject *sub_87FC(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  int v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_8A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_8AB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = sub_3C30();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_8B4C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = sub_3C30();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  double v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void sub_8FD8(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        double v5 = sub_3C30();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          unint64_t v6 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
        }
        break;
      case 2:
        double v5 = sub_3C30();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          unint64_t v6 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }
        break;
      case 1:
        double v5 = sub_3C30();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v9 = 134217984;
        uint64_t v10 = a1;
        unint64_t v6 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }
  int v8 = sub_3C30();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    uint64_t v10 = a1;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "BTSessionEventCallback: attached session = %p", (uint8_t *)&v9, 0xCu);
  }

  if (!*(void *)(a4 + 40)) {
    *(void *)(a4 + 40) = a1;
  }
}

void sub_931C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_9334(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_9344(uint64_t a1)
{
}

void sub_934C(uint64_t a1)
{
  uint64_t v2 = +[NSString stringWithCString:dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)) encoding:4];
  double v3 = sub_3C30();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  double v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

BOOL sub_9744(id a1, NSDictionary *a2, NSDictionary *a3)
{
  double v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsagePage"];
    double v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsage"];
    char v6 = (![v4 isEqual:&off_15408]
       || ([v5 isEqual:&off_15420] & 1) == 0)
      && (![v4 isEqual:&off_15408]
       || ([v5 isEqual:&off_15438] & 1) == 0)
      && (![v4 isEqual:&off_15408]
       || ([v5 isEqual:&off_15408] & 1) == 0);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

void sub_9CBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_9CE0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = sub_3C30();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "calling cancel handler", v4, 2u);
    }

    (*(void (**)(void))(WeakRetained[1] + 16))();
    double v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_9ED4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    double v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  char v6 = *(NSObject **)(v2 + 536);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 536);
    *(void *)(v7 + 536) = 0;
  }
}

void sub_A8C0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(NSObject **)(v2 + 560);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_A968;
  v7[3] = &unk_146E8;
  v7[4] = v2;
  uint64_t v4 = sub_87FC(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v7);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

id sub_A968(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_AB4C(id a1)
{
}

void sub_ABBC(uint64_t a1, void *a2, int a3)
{
  id v5 = a2;
  if (a1)
  {
    id v7 = v5;
    if (a3) {
      *(void *)(a1 + 664) = [v5 timestamp];
    }
    [v7 timestamp];
    [v7 type];
    kdebug_trace();
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 624));
    [WeakRetained dispatchEvent:v7];

    id v5 = v7;
  }
}

uint64_t sub_AC6C(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_ADC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_AEFC(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_C054(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    if (!LOBYTE(WeakRetained[30].tv_nsec))
    {
      LOBYTE(WeakRetained[30].tv_nsec) = 1;
      if (!WeakRetained[33].tv_nsec)
      {
        clock_gettime(_CLOCK_MONOTONIC_RAW, WeakRetained + 32);
        tv_sec = v3[35].tv_sec;
        v7[0] = _NSConcreteStackBlock;
        v7[1] = 3221225472;
        v7[2] = sub_C148;
        v7[3] = &unk_14598;
        objc_copyWeak(&v8, v1);
        uint64_t v5 = sub_87FC(0xF4240uLL, 0x186A0uLL, tv_sec, v7);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v5;

        objc_destroyWeak(&v8);
      }
    }
  }
}

void sub_C148(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unsigned long long v5 = 0uLL;
    clock_gettime(_CLOCK_MONOTONIC_RAW, (timespec *)&v5);
    if ((double)(uint64_t)((double)*((uint64_t *)&v5 + 1)
                         + (double)(uint64_t)v5 * 1000000000.0
                         - ((double)*((uint64_t *)WeakRetained + 65)
                          + (double)*((uint64_t *)WeakRetained + 64) * 1000000000.0))
       * 0.000000001 >= *((float *)WeakRetained + 124))
    {
      WeakRetained[32] = v5;
      unsigned __int8 v2 = [WeakRetained isAnyHapticMotorEnabled];
      double v3 = sub_3C30();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        if (v4) {
          sub_CC78(v3);
        }

        *((_DWORD *)WeakRetained + 123) = 0;
        [WeakRetained dispatchHapticEvent];
      }
      else
      {
        if (v4) {
          sub_CCBC(v3);
        }

        [WeakRetained stopHaptics];
      }
    }
  }
}

NSXPCInterface *sub_C8A0()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_C8B4()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

void sub_C8C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_C934()
{
  sub_87A0();
  sub_8768(&dword_0, v0, v1, "(Async) Unable to retrieve firmware info from DualShock 4 - error %d", v2, v3, v4, v5, v6);
}

void sub_C99C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CA08()
{
  sub_87A0();
  sub_8768(&dword_0, v0, v1, "(Async) Unable to retrieve sensor calibration info from DualShock 4 - error %d", v2, v3, v4, v5, v6);
}

void sub_CA70(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to retreive pairing info from DualShock 4.", v1, 2u);
}

void sub_CAB4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_CB20()
{
  sub_87A0();
  sub_8768(&dword_0, v0, v1, "(Async) Unable to send BT output report to DualShock - error %d", v2, v3, v4, v5, v6);
}

void sub_CB88()
{
  sub_87A0();
  sub_8768(&dword_0, v0, v1, "(Async) Unable to send USB output report to DualShock - error %d", v2, v3, v4, v5, v6);
}

void sub_CBF0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_CC78(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Dispatching event...", v1, 2u);
}

void sub_CCBC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Stopping timer...", v1, 2u);
}

uint64_t BTDeviceAddressFromString()
{
  return _BTDeviceAddressFromString();
}

uint64_t BTDeviceDisconnect()
{
  return _BTDeviceDisconnect();
}

uint64_t BTDeviceFromAddress()
{
  return _BTDeviceFromAddress();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t GCGenericDeviceDriverConfigurationServiceClientInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceClientInterface();
}

uint64_t GCGenericDeviceDriverConfigurationServiceServerInterface()
{
  return _GCGenericDeviceDriverConfigurationServiceServerInterface();
}

uint64_t IOHIDEventAppendEvent()
{
  return _IOHIDEventAppendEvent();
}

uint64_t IOHIDEventCreateQuaternionOrientationEvent()
{
  return _IOHIDEventCreateQuaternionOrientationEvent();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return _IOHIDEventCreateVendorDefinedEvent();
}

uint64_t IOHIDEventSetEventFlags()
{
  return _IOHIDEventSetEventFlags();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return _IOObjectRetain(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return _IORegistryEntryGetRegistryEntryID(entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntrySearchCFProperty(entry, plane, key, allocator, options);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __memcpy_chk()
{
  return ___memcpy_chk();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return __os_activity_create(dso, description, activity, flags);
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

int clock_gettime(clockid_t __clock_id, timespec *__tp)
{
  return _clock_gettime(__clock_id, __tp);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return _dispatch_queue_get_label(queue);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return _kdebug_trace();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
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

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_amplitude(void *a1, const char *a2, ...)
{
  return [a1 amplitude];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_batteryReport(void *a1, const char *a2, ...)
{
  return [a1 batteryReport];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return [a1 cancel];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_createVirtualHIDDeviceForBattery(void *a1, const char *a2, ...)
{
  return [a1 createVirtualHIDDeviceForBattery];
}

id objc_msgSend_defaultHapticDispatchFrequency(void *a1, const char *a2, ...)
{
  return [a1 defaultHapticDispatchFrequency];
}

id objc_msgSend_defaultHapticMotors(void *a1, const char *a2, ...)
{
  return [a1 defaultHapticMotors];
}

id objc_msgSend_defaultIdleTimeoutDuration(void *a1, const char *a2, ...)
{
  return [a1 defaultIdleTimeoutDuration];
}

id objc_msgSend_defaultLeftAxisSnapRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftAxisSnapRadius];
}

id objc_msgSend_defaultLeftThumbstickDeadzoneRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftThumbstickDeadzoneRadius];
}

id objc_msgSend_defaultLeftThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 defaultLeftThumbstickNoiseBuffer];
}

id objc_msgSend_defaultRightAxisSnapRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultRightAxisSnapRadius];
}

id objc_msgSend_defaultRightThumbstickDeadzoneRadius(void *a1, const char *a2, ...)
{
  return [a1 defaultRightThumbstickDeadzoneRadius];
}

id objc_msgSend_defaultRightThumbstickNoiseBuffer(void *a1, const char *a2, ...)
{
  return [a1 defaultRightThumbstickNoiseBuffer];
}

id objc_msgSend_determineSupportMode(void *a1, const char *a2, ...)
{
  return [a1 determineSupportMode];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return [a1 disconnect];
}

id objc_msgSend_dispatchHapticEvent(void *a1, const char *a2, ...)
{
  return [a1 dispatchHapticEvent];
}

id objc_msgSend_dispatchOutputReport(void *a1, const char *a2, ...)
{
  return [a1 dispatchOutputReport];
}

id objc_msgSend_dispatchQueue(void *a1, const char *a2, ...)
{
  return [a1 dispatchQueue];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_driverCheckIn(void *a1, const char *a2, ...)
{
  return [a1 driverCheckIn];
}

id objc_msgSend_eventID(void *a1, const char *a2, ...)
{
  return [a1 eventID];
}

id objc_msgSend_features(void *a1, const char *a2, ...)
{
  return [a1 features];
}

id objc_msgSend_frequency(void *a1, const char *a2, ...)
{
  return [a1 frequency];
}

id objc_msgSend_hapticMotors(void *a1, const char *a2, ...)
{
  return [a1 hapticMotors];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return [a1 index];
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return [a1 init];
}

id objc_msgSend_initGameControllerDaemonXPC(void *a1, const char *a2, ...)
{
  return [a1 initGameControllerDaemonXPC];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isAnyHapticMotorEnabled(void *a1, const char *a2, ...)
{
  return [a1 isAnyHapticMotorEnabled];
}

id objc_msgSend_isBluetoothClassic(void *a1, const char *a2, ...)
{
  return [a1 isBluetoothClassic];
}

id objc_msgSend_isHapticsActive(void *a1, const char *a2, ...)
{
  return [a1 isHapticsActive];
}

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
}

id objc_msgSend_isVirtualDevice(void *a1, const char *a2, ...)
{
  return [a1 isVirtualDevice];
}

id objc_msgSend_lastEventTime(void *a1, const char *a2, ...)
{
  return [a1 lastEventTime];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_numberOfTimesToSendZeroHapticReport(void *a1, const char *a2, ...)
{
  return [a1 numberOfTimesToSendZeroHapticReport];
}

id objc_msgSend_open(void *a1, const char *a2, ...)
{
  return [a1 open];
}

id objc_msgSend_params(void *a1, const char *a2, ...)
{
  return [a1 params];
}

id objc_msgSend_queuedTransients(void *a1, const char *a2, ...)
{
  return [a1 queuedTransients];
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return [a1 remoteObjectProxy];
}

id objc_msgSend_requestFirmwareInfo(void *a1, const char *a2, ...)
{
  return [a1 requestFirmwareInfo];
}

id objc_msgSend_requestPairingInfo(void *a1, const char *a2, ...)
{
  return [a1 requestPairingInfo];
}

id objc_msgSend_requestSensorCalibrationInfo(void *a1, const char *a2, ...)
{
  return [a1 requestSensorCalibrationInfo];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleIdleTimer];
}

id objc_msgSend_sendBatteryReport(void *a1, const char *a2, ...)
{
  return [a1 sendBatteryReport];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_setupRawReportHandling(void *a1, const char *a2, ...)
{
  return [a1 setupRawReportHandling];
}

id objc_msgSend_shouldCreateBatteryDevice(void *a1, const char *a2, ...)
{
  return [a1 shouldCreateBatteryDevice];
}

id objc_msgSend_shouldDisconnectWhenIdle(void *a1, const char *a2, ...)
{
  return [a1 shouldDisconnectWhenIdle];
}

id objc_msgSend_stopHaptics(void *a1, const char *a2, ...)
{
  return [a1 stopHaptics];
}

id objc_msgSend_time(void *a1, const char *a2, ...)
{
  return [a1 time];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return [a1 token];
}

id objc_msgSend_tokenAndParams(void *a1, const char *a2, ...)
{
  return [a1 tokenAndParams];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntValue];
}

id objc_msgSend_updateClientBattery(void *a1, const char *a2, ...)
{
  return [a1 updateClientBattery];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_valueForNoteParam_inParameters_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForNoteParam:inParameters:");
}