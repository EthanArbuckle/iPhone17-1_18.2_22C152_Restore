uint64_t sub_45DC()
{
  if (qword_16E10 != -1) {
    dispatch_once(&qword_16E10, &stru_103C0);
  }
  return byte_16E08;
}

void sub_4620(id a1)
{
  byte_16E08 = os_variant_has_internal_diagnostics();
}

id sub_4648()
{
  if (qword_16E20 != -1) {
    dispatch_once(&qword_16E20, &stru_103E0);
  }
  v0 = (void *)qword_16E18;

  return v0;
}

void sub_469C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "default");
  v2 = (void *)qword_16E18;
  qword_16E18 = (uint64_t)v1;
}

id sub_46E0()
{
  if (qword_16E30 != -1) {
    dispatch_once(&qword_16E30, &stru_10400);
  }
  v0 = (void *)qword_16E28;

  return v0;
}

void sub_4734(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "monitor");
  v2 = (void *)qword_16E28;
  qword_16E28 = (uint64_t)v1;
}

id sub_4778()
{
  if (qword_16E40 != -1) {
    dispatch_once(&qword_16E40, &stru_10420);
  }
  v0 = (void *)qword_16E38;

  return v0;
}

void sub_47CC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "init");
  v2 = (void *)qword_16E38;
  qword_16E38 = (uint64_t)v1;
}

id sub_4810()
{
  if (qword_16E50 != -1) {
    dispatch_once(&qword_16E50, &stru_10440);
  }
  v0 = (void *)qword_16E48;

  return v0;
}

void sub_4864(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController", "analytics");
  v2 = (void *)qword_16E48;
  qword_16E48 = (uint64_t)v1;
}

id sub_48A8()
{
  if (qword_16E60 != -1) {
    dispatch_once(&qword_16E60, &stru_10460);
  }
  v0 = (void *)qword_16E58;

  return v0;
}

void sub_48FC(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Daemon", "default");
  v2 = (void *)qword_16E58;
  qword_16E58 = (uint64_t)v1;
}

void sub_4940(char *category)
{
  os_log_t v1 = os_log_create("com.apple.GameController.HID", category);
  v2 = (void *)qword_16E68;
  qword_16E68 = (uint64_t)v1;
}

id sub_4980()
{
  if (qword_16E70 != -1) {
    dispatch_once(&qword_16E70, &stru_10480);
  }
  v0 = (void *)qword_16E68;

  return v0;
}

void sub_49D4(id a1)
{
  if (!qword_16E68) {
    objc_storeStrong((id *)&qword_16E68, &_os_log_default);
  }
}

id sub_49F8()
{
  if (qword_16E80 != -1) {
    dispatch_once(&qword_16E80, &stru_104A0);
  }
  v0 = (void *)qword_16E78;

  return v0;
}

void sub_4A4C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Settings", "default");
  v2 = (void *)qword_16E78;
  qword_16E78 = (uint64_t)v1;
}

id sub_4A90()
{
  if (qword_16E90 != -1) {
    dispatch_once(&qword_16E90, &stru_104C0);
  }
  v0 = (void *)qword_16E88;

  return v0;
}

void sub_4AE4(id a1)
{
  os_log_t v1 = os_log_create("com.apple.GameController.Haptics", "default");
  v2 = (void *)qword_16E88;
  qword_16E88 = (uint64_t)v1;
}

id sub_4B28()
{
  if (qword_16EA0 != -1) {
    dispatch_once(&qword_16EA0, &stru_104E0);
  }
  v0 = (void *)qword_16E98;

  return v0;
}

void sub_4B7C(id a1)
{
  os_log_t v1 = os_log_create("com.apple.gamecontroller", "Signposts");
  v2 = (void *)qword_16E98;
  qword_16E98 = (uint64_t)v1;
}

id sub_4BC0()
{
  if (qword_16EB0 != -1) {
    dispatch_once(&qword_16EB0, &stru_10500);
  }
  v0 = (void *)qword_16EA8;

  return v0;
}

void sub_4C14(id a1)
{
  os_log_t v1 = os_log_create("com.apple.runtime-issues", "GameController");
  v2 = (void *)qword_16EA8;
  qword_16EA8 = (uint64_t)v1;
}

NSXPCInterface *sub_4C58()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceClientInterface];
}

NSXPCInterface *sub_4C6C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCGameIntentServiceServerInterface];
}

id sub_4C80()
{
  return +[NSData dataWithBytes:&unk_F610 length:37];
}

void sub_4DF4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_4EA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  _Unwind_Resume(a1);
}

void sub_5010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_535C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

NSXPCInterface *sub_5370()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceClientInterface];
}

NSXPCInterface *sub_5384()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCNintendoJoyConFusionGestureServiceServerInterface];
}

id sub_586C(uint64_t a1, int a2)
{
  v4 = +[NSMutableString stringWithCapacity:2 * a2];
  if (a2 >= 1)
  {
    unint64_t v5 = a2 + 1;
    do
    {
      if (v5 == 2) {
        CFStringRef v6 = &stru_10868;
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

uint64_t sub_5974()
{
  if (qword_16EB8 != -1) {
    dispatch_once(&qword_16EB8, &stru_10520);
  }
  return byte_16EC0;
}

void sub_59B8(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.GameController"];
  byte_16EC0 = [v1 BOOLForKey:@"GCPartnersEnable"];
  v2 = sub_4980();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3[0] = 67109120;
    v3[1] = byte_16EC0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Partners mode enabled? %d", (uint8_t *)v3, 8u);
  }
}

void sub_5A98()
{
}

void sub_5C9C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_5CC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v9 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    sub_87B4((uint64_t)WeakRetained);
    kdebug_trace();
    id v12 = v9;
    [v12 bytes];
    if (a5 == 2)
    {
      LOWORD(v42) = 0;
      [v12 length];
      __memcpy_chk();
      [v11 dispatchHomeButtonEventWithValue:0 timestamp:a3];
    }
    else if (a5 == 1)
    {
      memset(v67, 0, 17);
      [v12 length];
      __memcpy_chk();
      float32x2_t v15 = (float32x2_t)vdup_n_s32(0x477E0000u);
      int32x2_t v16 = (int32x2_t)vmul_f32(vadd_f32(vdiv_f32(vcvt_f32_u32(0), v15), (float32x2_t)0xBF000000BF000000), (float32x2_t)0xC000000040000000);
      v17.i32[0] = 0;
      v17.i32[1] = *(unsigned __int16 *)((char *)v67 + 7);
      float32x2_t v18 = (float32x2_t)vrev64_s32(v16);
      int32x2_t v19 = (int32x2_t)vmul_f32(vadd_f32(vdiv_f32(vcvt_f32_u32(v17), v15), (float32x2_t)0xBF000000BF000000), (float32x2_t)0xC000000040000000);
      float32x2_t v20 = (float32x2_t)vrev64_s32(v19);
      unint64_t v21 = *(void *)((char *)&v67[1] + 1);
      uint64_t v22 = HIDWORD(*(void *)((char *)&v67[1] + 1)) & 0xFLL;
      float v23 = 1.0;
      float v24 = 1.0;
      if (v22 != 1 && v22 != 8)
      {
        if (v22 == 2) {
          float v24 = 1.0;
        }
        else {
          float v24 = 0.0;
        }
      }
      unsigned int v25 = BYTE5(v67[1]) & 0xE;
      if (v22 == 4) {
        float v26 = 1.0;
      }
      else {
        float v26 = 0.0;
      }
      if (v25 != 2) {
        float v23 = v26;
      }
      float v41 = v23;
      int8x8_t v40 = (int8x8_t)vceq_s32(vdup_n_s32(v22), (int32x2_t)0x800000006);
      float v27 = fmaxf(*(float *)&v16.i32[1], 0.0);
      int8x8_t v28 = (int8x8_t)vcltz_f32(v18);
      int8x8_t v29 = (int8x8_t)vneg_f32(v18);
      int8x8_t v39 = (int8x8_t)vcltz_f32(v20);
      int8x8_t v30 = (int8x8_t)vneg_f32(v20);
      float v31 = fmaxf(*(float *)v19.i32, 0.0);
      objc_msgSend(v11, "dispatchMenuButtonEventWithValue:timestamp:", (*(void *)((char *)&v67[1] + 1) >> 51) & 1, a3, *(void *)&v16, v13, *(void *)&v19, v14);
      [v11 dispatchOptionsButtonEventWithValue:HIBYTE(*(void *)((char *)&v67[1] + 1)) & 1 timestamp:a3];
      uint64_t v42 = 0;
      float v43 = v24;
      __asm { FMOV            V1.2S, #1.0 }
      int8x8_t v44 = vbsl_s8((int8x8_t)vceq_s32(vdup_n_s32(v25), (int32x2_t)0x600000004), _D1, vand_s8(v40, _D1));
      float v45 = v41;
      float v46 = (float)((v21 >> 40) & 1);
      float v47 = (float)((v21 >> 41) & 1);
      float v48 = (float)((v21 >> 43) & 1);
      float v49 = (float)((v21 >> 44) & 1);
      float v50 = (float)((v21 >> 46) & 1);
      float v51 = (float)((v21 >> 47) & 1);
      float v52 = v27;
      int8x8_t v53 = vand_s8(v29, v28);
      float32x2_t v54 = vmaxnm_f32((float32x2_t)__PAIR64__(v38, v37), 0);
      int8x8_t v55 = vand_s8(v30, v39);
      float v56 = v31;
      float32x2_t v57 = vdiv_f32(vcvt_f32_s32((int32x2_t)vand_s8((int8x8_t)__PAIR64__(WORD1(v21), v21), (int8x8_t)0x300000003)), (float32x2_t)vdup_n_s32(0x447FC000u));
      float v58 = (float)((v21 >> 53) & 1);
      float v59 = (float)((v21 >> 54) & 1);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      uint64_t v66 = 0;
      [v11 dispatchGameControllerExtendedEventWithState:&v42 timestamp:a3];
    }
  }
}

NSXPCInterface *sub_604C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceClientInterface];
}

NSXPCInterface *sub_6060()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCAdaptiveTriggersServiceServerInterface];
}

id sub_6074()
{
  v0 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverClientInterface];
  id v1 = sub_5370();
  [v0 setInterface:v1 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v2 = sub_5384();
  [v0 setInterface:v2 forSelector:"connectToNintendoJoyConFusionGestureServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v3 = sub_A410();
  [v0 setInterface:v3 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v4 = sub_A424();
  [v0 setInterface:v4 forSelector:"connectToLightServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  unint64_t v5 = sub_604C();
  [v0 setInterface:v5 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  CFStringRef v6 = sub_6060();
  [v0 setInterface:v6 forSelector:"connectToAdaptiveTriggersServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v7 = sub_A3E8();
  [v0 setInterface:v7 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v8 = sub_A3FC();
  [v0 setInterface:v8 forSelector:"connectToMotionServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  id v9 = sub_A438();
  [v0 setInterface:v9 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  v10 = sub_A44C();
  [v0 setInterface:v10 forSelector:"connectToBatteryServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  v11 = sub_4C58();
  [v0 setInterface:v11 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  id v12 = sub_4C6C();
  [v0 setInterface:v12 forSelector:"connectToGameIntentServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  uint64_t v13 = GCGenericDeviceDriverConfigurationServiceClientInterface();
  [v0 setInterface:v13 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:0];

  uint64_t v14 = GCGenericDeviceDriverConfigurationServiceServerInterface();
  [v0 setInterface:v14 forSelector:"connectToGenericDeviceDriverConfigurationServiceWithClient:reply:" argumentIndex:0 ofReply:1];

  return v0;
}

NSXPCInterface *sub_6330()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____GCDriverServerInterface];
}

NSObject *sub_6344(uint64_t a1, uint64_t a2, NSObject *a3, void *a4)
{
  id v7 = a4;
  v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, a3);
  if (v8)
  {
    dispatch_time_t v9 = dispatch_walltime(0, 0);
    dispatch_source_set_timer(v8, v9, a1, a2);
    dispatch_source_set_event_handler(v8, v7);
    dispatch_resume(v8);
  }

  return v8;
}

void sub_65CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_65FC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = sub_4980();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver invalidated", v3, 2u);
  }

  [WeakRetained setInterruptionHandler:0];
  [WeakRetained setInvalidationHandler:0];
  [WeakRetained invalidate];
}

void sub_6694(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = sub_4980();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Connection to com.apple.GameController.gamecontrollerd.driver interrupted.  Attempting to re-establish.", v4, 2u);
  }

  v3 = [WeakRetained remoteObjectProxy];
  [v3 driverCheckIn];
}

void sub_6B20(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a3 | a2)
  {
    switch(a2)
    {
      case 3:
        unint64_t v5 = sub_4980();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          CFStringRef v6 = "BTSessionEventCallback: failed session = %p";
LABEL_15:
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0xCu);
        }
        break;
      case 2:
        unint64_t v5 = sub_4980();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          int v9 = 134217984;
          uint64_t v10 = a1;
          CFStringRef v6 = "BTSessionEventCallback: terminated session = %p";
          goto LABEL_15;
        }
        break;
      case 1:
        unint64_t v5 = sub_4980();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
          break;
        }
        int v9 = 134217984;
        uint64_t v10 = a1;
        CFStringRef v6 = "BTSessionEventCallback: detached session = %p";
        goto LABEL_15;
      default:
        return;
    }

    return;
  }
  v8 = sub_4980();
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

void sub_6E64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_6E7C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_6E8C(uint64_t a1)
{
}

void sub_6E94(uint64_t a1)
{
  uint64_t v2 = +[NSString stringWithCString:dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 32)) encoding:4];
  v3 = sub_4980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Freeing HIDDevice on %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = 0;
}

BOOL sub_728C(id a1, NSDictionary *a2, NSDictionary *a3)
{
  v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsagePage"];
    unint64_t v5 = [(NSDictionary *)v3 objectForKeyedSubscript:@"DeviceUsage"];
    char v6 = (![v4 isEqual:&off_10E00]
       || ([v5 isEqual:&off_10E18] & 1) == 0)
      && (![v4 isEqual:&off_10E00]
       || ([v5 isEqual:&off_10E30] & 1) == 0)
      && (![v4 isEqual:&off_10E00]
       || ([v5 isEqual:&off_10E00] & 1) == 0);
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

void sub_7804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_7828(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = sub_4980();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "calling cancel handler", v4, 2u);
    }

    (*(void (**)(void))(WeakRetained[1] + 16))();
    v3 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

void sub_7A1C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 32);
    unint64_t v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  char v6 = *(NSObject **)(v2 + 536);
  if (v6)
  {
    dispatch_source_cancel(v6);
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = *(void **)(v7 + 536);
    *(void *)(v7 + 536) = 0;
  }
}

void sub_8408(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 560);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_84B0;
  v7[3] = &unk_10600;
  v7[4] = v2;
  uint64_t v4 = sub_6344(0x6FC23AC00uLL, 0x3B9ACA00uLL, v3, v7);
  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v4;
}

id sub_84B0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateIdleState];
}

void sub_8694(id a1)
{
}

void sub_8704(uint64_t a1, void *a2, int a3)
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

uint64_t sub_87B4(uint64_t result)
{
  if (result) {
    return *(void *)(result + 656);
  }
  return result;
}

id sub_8908(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchEvent:*(void *)(a1 + 40)];
}

id sub_8A44(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchIdleEvent:*(void *)(a1 + 40)];
}

void sub_9B9C(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = (timespec *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
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
        v7[2] = sub_9C90;
        v7[3] = &unk_10570;
        objc_copyWeak(&v8, v1);
        uint64_t v5 = sub_6344(0xF4240uLL, 0x186A0uLL, tv_sec, v7);
        tv_nsec = (void *)v3[33].tv_nsec;
        v3[33].tv_nsec = v5;

        objc_destroyWeak(&v8);
      }
    }
  }
}

void sub_9C90(uint64_t a1)
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
      v3 = sub_4980();
      BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        if (v4) {
          sub_A4E8(v3);
        }

        *((_DWORD *)WeakRetained + 123) = 0;
        [WeakRetained dispatchHapticEvent];
      }
      else
      {
        if (v4) {
          sub_A52C(v3);
        }

        [WeakRetained stopHaptics];
      }
    }
  }
}

NSXPCInterface *sub_A3E8()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceClientInterface];
}

NSXPCInterface *sub_A3FC()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCMotionServiceServerInterface];
}

NSXPCInterface *sub_A410()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceClientInterface];
}

NSXPCInterface *sub_A424()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCLightServiceServerInterface];
}

NSXPCInterface *sub_A438()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceClientInterface];
}

NSXPCInterface *sub_A44C()
{
  return +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___GCBatteryServiceServerInterface];
}

void sub_A460(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "setProperty: %@ forKey: %@", (uint8_t *)&v3, 0x16u);
}

void sub_A4E8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Dispatching event...", v1, 2u);
}

void sub_A52C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
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

id objc_msgSend_isIdle(void *a1, const char *a2, ...)
{
  return [a1 isIdle];
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

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_scheduleIdleTimer(void *a1, const char *a2, ...)
{
  return [a1 scheduleIdleTimer];
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