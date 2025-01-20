void sub_234C0F2DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_234C0FF1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_234C108C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C10BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id VPNSettingsCopyLog()
{
  if (VPNSettingsCopyLog_onceToken != -1) {
    dispatch_once(&VPNSettingsCopyLog_onceToken, &__block_literal_global);
  }
  v0 = (void *)VPNSettingsCopyLog_logger;

  return v0;
}

uint64_t __VPNSettingsCopyLog_block_invoke()
{
  VPNSettingsCopyLog_logger = (uint64_t)os_log_create("com.apple.networkextension", "VPN Settings");

  return MEMORY[0x270F9A758]();
}

void updateNEStatus(void *a1)
{
  id v1 = a1;
  v2 = v1;
  if (v1)
  {
    [v1 session];
    v3 = [v2 queue];
    id v4 = v2;
    ne_session_get_status();
  }
}

void __updateNEStatus_block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) timerSource];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) timerSource];
    dispatch_source_cancel(v3);

    [*(id *)(a1 + 32) setTimerSource:0];
  }
  [*(id *)(a1 + 32) session];
  id v4 = [*(id *)(a1 + 32) queue];
  id v5 = *(id *)(a1 + 32);
  ne_session_get_info();
}

void __updateNEStatus_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = xpc_dictionary_get_value(v3, "VPN");
    v6 = v5;
    if (v5) {
      int64_t int64 = xpc_dictionary_get_int64(v5, "OnDemandAction");
    }
    else {
      int64_t int64 = 0;
    }
  }
  else
  {
    int64_t int64 = 0;
  }
  uint64_t v8 = [*(id *)(a1 + 32) onDemandAction];
  if (v8 != int64) {
    [*(id *)(a1 + 32) setOnDemandAction:int64];
  }
  switch(*(_DWORD *)(a1 + 40))
  {
    case 1:
      v9 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v10;
        _os_log_impl(&dword_234C0A000, v9, OS_LOG_TYPE_DEFAULT, "%@ state is now Disconnected", buf, 0xCu);
      }

      if (v4)
      {
        v11 = xpc_dictionary_get_value(v4, "VPN");
        uint64_t v12 = v11;
        if (v11)
        {
          int64_t v13 = xpc_dictionary_get_int64(v11, "LastCause");
        }
        else
        {
          v32 = xpc_dictionary_get_value(v4, "IPSec");
          v33 = xpc_dictionary_get_value(v4, "PPP");
          v34 = v32;
          if (v32 || (v34 = v33) != 0) {
            int64_t v13 = xpc_dictionary_get_int64(v34, "LastCause");
          }
          else {
            int64_t v13 = 0;
          }
        }
      }
      else
      {
        int64_t v13 = 0;
      }
      uint64_t v14 = [NSNumber numberWithLongLong:v13];
      [*(id *)(a1 + 32) setLastStopCause:v14];
      goto LABEL_39;
    case 2:
      uint64_t v14 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v15;
      uint64_t v16 = "%@ state is now Connecting";
      break;
    case 3:
      v17 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v18;
        _os_log_impl(&dword_234C0A000, v17, OS_LOG_TYPE_DEFAULT, "%@ state is now Connected", buf, 0xCu);
      }

      dispatch_source_t v19 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
      [*(id *)(a1 + 32) setTimerSource:v19];

      v20 = [*(id *)(a1 + 32) timerSource];
      dispatch_source_set_timer(v20, 0, 0x3B9ACA00uLL, 0x3B9ACA00uLL);

      v21 = [*(id *)(a1 + 32) timerSource];
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __updateNEStatus_block_invoke_21;
      handler[3] = &unk_264C065A8;
      v49 = *(id *)(a1 + 32);
      dispatch_source_set_event_handler(v21, handler);

      v22 = [*(id *)(a1 + 32) timerSource];
      dispatch_resume(v22);

      if ([*(id *)(a1 + 32) grade] == 3)
      {
        v23 = [*(id *)(a1 + 32) subConnections];
        [v23 removeAllObjects];

        if (v4)
        {
          applier[0] = MEMORY[0x263EF8330];
          applier[1] = 3221225472;
          applier[2] = __updateNEStatus_block_invoke_2_22;
          applier[3] = &unk_264C065D0;
          id v47 = *(id *)(a1 + 32);
          xpc_dictionary_apply(v4, applier);
        }
      }
      else
      {
        *(void *)buf = &stru_26E7C6230;
        v44 = 0;
        v45 = &stru_26E7C6230;
        v43 = 0;
        BOOL v42 = 0;
        int64_t v41 = 0;
        getExtendedStatusValues(v4, (void **)buf, (void **)&v45, &v44, &v43, &v42, &v41);
        [*(id *)(a1 + 32) setLastStopCause:&unk_26E7CB868];
        v26 = [NSNumber numberWithLongLong:v41];
        [*(id *)(a1 + 32) setSessionConnectTime:v26];

        v27 = *(void **)buf;
        v28 = v45;
        v50[0] = *(void *)buf;
        v50[1] = v45;
        v29 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:2];
        [*(id *)(a1 + 32) setSessionIPAddresses:v29];

        v30 = v44;
        [*(id *)(a1 + 32) setSessionRemoteAddress:v44];
        [*(id *)(a1 + 32) setMatchDomains:v43];
        [*(id *)(a1 + 32) setIsPrimary:v42];
      }
      if ([*(id *)(a1 + 32) grade] == 7 || objc_msgSend(*(id *)(a1 + 32), "grade") == 8)
      {
        v31 = xpc_dictionary_get_array(v4, "SortedRelayErrors");
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __updateNEStatus_block_invoke_33;
        v39[3] = &unk_264C065F8;
        id v40 = *(id *)(a1 + 32);
        xpc_array_apply(v31, v39);
      }
      uint64_t v14 = v49;
      goto LABEL_39;
    case 4:
      uint64_t v14 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v24 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v24;
      uint64_t v16 = "%@ state is now Reasserting";
      break;
    case 5:
      uint64_t v14 = VPNSettingsCopyLog();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_39;
      }
      uint64_t v25 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v25;
      uint64_t v16 = "%@ state is now Disconnecting";
      break;
    default:
      goto LABEL_40;
  }
  _os_log_impl(&dword_234C0A000, v14, OS_LOG_TYPE_DEFAULT, v16, buf, 0xCu);
LABEL_39:

LABEL_40:
  v35[0] = MEMORY[0x263EF8330];
  v35[1] = 3221225472;
  v35[2] = __updateNEStatus_block_invoke_40;
  v35[3] = &unk_264C06620;
  id v36 = *(id *)(a1 + 32);
  int v37 = *(_DWORD *)(a1 + 40);
  BOOL v38 = v8 != int64;
  dispatch_async(MEMORY[0x263EF83A0], v35);
}

void __updateNEStatus_block_invoke_21(uint64_t a1)
{
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:kNotificationVPNConnectionTimerFired object:*(void *)(a1 + 32)];
}

uint64_t __updateNEStatus_block_invoke_2_22(uint64_t a1, uint64_t a2, void *a3)
{
  v21[4] = *MEMORY[0x263EF8340];
  v17 = &stru_26E7C6230;
  uint64_t v18 = &stru_26E7C6230;
  int64_t v15 = 0;
  uint64_t v16 = &stru_26E7C6230;
  getExtendedStatusValues(a3, (void **)&v18, (void **)&v17, (void **)&v16, 0, 0, &v15);
  int64_t v5 = v15;
  if (v15 <= 0)
  {
    v11 = v16;
    v9 = v17;
    uint64_t v8 = v18;
  }
  else
  {
    v6 = [*(id *)(a1 + 32) subConnections];
    v20[0] = kVPNSubConnectionInterfaceName;
    v7 = [NSString stringWithUTF8String:a2];
    v21[0] = v7;
    v20[1] = kVPNSubConnectionIPAddress;
    v9 = v17;
    uint64_t v8 = v18;
    v19[0] = v18;
    v19[1] = v17;
    uint64_t v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:2];
    v11 = v16;
    v21[1] = v10;
    v21[2] = v16;
    v20[2] = kVPNSubConnectionRemoteAddress;
    v20[3] = kVPNSubConnectionConnectTime;
    uint64_t v12 = [NSNumber numberWithLongLong:v5];
    v21[3] = v12;
    int64_t v13 = [NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:4];
    [v6 addObject:v13];
  }
  return 1;
}

void getExtendedStatusValues(void *a1, void **a2, void **a3, void **a4, void **a5, BOOL *a6, int64_t *a7)
{
  id v13 = a1;
  uint64_t v14 = v13;
  if (!v13) {
    goto LABEL_24;
  }
  id v40 = a2;
  int64_t v41 = a3;
  int64_t v15 = xpc_dictionary_get_value(v13, "VPN");
  uint64_t v16 = xpc_dictionary_get_value(v14, "IPv4");
  v17 = xpc_dictionary_get_value(v14, "IPv6");
  uint64_t v18 = xpc_dictionary_get_value(v14, "DNSSupplementalMatchDomains");
  if (!v15)
  {
    v39 = a6;
    v34 = xpc_dictionary_get_value(v14, "IPSec");
    v35 = xpc_dictionary_get_value(v14, "PPP");
    id v36 = v35;
    if (v34)
    {
      *a7 = xpc_dictionary_get_int64(v34, "ConnectTime");
      int v37 = "RemoteAddress";
      BOOL v38 = v34;
    }
    else
    {
      if (!v35)
      {
        string = 0;
LABEL_30:

        a6 = v39;
        if (!string) {
          goto LABEL_5;
        }
        goto LABEL_4;
      }
      *a7 = xpc_dictionary_get_int64(v35, "ConnectTime");
      int v37 = "CommRemoteAddress";
      BOOL v38 = v36;
    }
    string = xpc_dictionary_get_string(v38, v37);
    goto LABEL_30;
  }
  *a7 = xpc_dictionary_get_int64(v15, "ConnectTime");
  string = xpc_dictionary_get_string(v15, "RemoteAddress");
  if (string)
  {
LABEL_4:
    uint64_t v20 = objc_msgSend(NSString, "stringWithUTF8String:", string, v39);
    v21 = *a4;
    *a4 = (void *)v20;
  }
LABEL_5:
  if (v16)
  {
    v22 = xpc_dictionary_get_value(v16, "Addresses");
    v23 = v22;
    if (v22)
    {
      if (xpc_array_get_count(v22))
      {
        uint64_t v24 = xpc_array_get_string(v23, 0);
        if (v24)
        {
          uint64_t v25 = [NSString stringWithUTF8String:v24];
          v26 = *v40;
          *id v40 = (void *)v25;
        }
      }
    }
  }
  if (v17)
  {
    v27 = xpc_dictionary_get_value(v17, "Addresses");
    v28 = v27;
    if (v27)
    {
      if (xpc_array_get_count(v27))
      {
        v29 = xpc_array_get_string(v28, 0);
        if (v29)
        {
          uint64_t v30 = [NSString stringWithUTF8String:v29];
          v31 = *v41;
          *int64_t v41 = (void *)v30;
        }
      }
    }
  }
  if (a5 && v18 && xpc_array_get_count(v18))
  {
    id v32 = objc_alloc_init(MEMORY[0x263EFF980]);
    v33 = *a5;
    *a5 = v32;

    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __getExtendedStatusValues_block_invoke;
    applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
    void applier[4] = a5;
    xpc_array_apply(v18, applier);
  }
  if (a6) {
    *a6 = xpc_dictionary_get_int64(v14, "IsPrimaryInterface") != 0;
  }

LABEL_24:
}

uint64_t __updateNEStatus_block_invoke_33(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x237DCFC70]() == MEMORY[0x263EF8708] && (int64_t int64 = xpc_dictionary_get_int64(v4, "LastCause"), int64 >= 2))
  {
    uint64_t v8 = int64;
    double v9 = xpc_dictionary_get_double(v4, "TimeEpoch");
    uint64_t v10 = [MEMORY[0x263EFF910] now];
    [v10 timeIntervalSince1970];
    double v12 = v11 - v9;

    if (v12 <= 300.0)
    {
      id v13 = (void *)[objc_alloc(NSNumber) initWithDouble:(double)v8];
      [*(id *)(a1 + 32) setLastStopCause:v13];
    }
    uint64_t v6 = 0;
  }
  else
  {
    uint64_t v6 = 1;
  }

  return v6;
}

void __updateNEStatus_block_invoke_40(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setSession_status:", *(unsigned int *)(a1 + 40));
  id v2 = [MEMORY[0x263F08A00] defaultCenter];
  [v2 postNotificationName:kNotificationVPNConnectionStatusChanged object:*(void *)(a1 + 32)];

  if (*(unsigned char *)(a1 + 44))
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"VPNNEConfigurationChangedNotification" object:*(void *)(a1 + 32)];
  }
}

void sub_234C127C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __getExtendedStatusValues_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  int64_t v5 = v4;
  if (v4)
  {
    if (MEMORY[0x237DCFC70](v4) == MEMORY[0x263EF8798])
    {
      string_ptr = xpc_string_get_string_ptr(v5);
      if (string_ptr)
      {
        v7 = **(void ***)(a1 + 32);
        uint64_t v8 = [NSString stringWithUTF8String:string_ptr];
        [v7 addObject:v8];
      }
    }
  }

  return 1;
}

void sub_234C1451C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_234C147F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_234C155E0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

uint64_t compareConfigurationNamesNonLocalized(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 name];
  int64_t v5 = [v3 name];

  uint64_t v6 = [v4 compare:v5];
  return v6;
}

uint64_t compareConfigurationNames(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 name];
  int64_t v5 = [v3 name];

  uint64_t v6 = [v4 localizedCaseInsensitiveCompare:v5];
  return v6;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_234C1BE04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C20950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_234C20C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_234C22534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_234C22810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

void sub_234C239B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_234C26CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
}

CFTypeRef VPNCopyAvailableCertificateIDs()
{
  v10[4] = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v0 = *MEMORY[0x263F171D0];
  uint64_t v1 = *MEMORY[0x263F17528];
  v9[0] = *MEMORY[0x263F171B8];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263EFFB40];
  v10[0] = v0;
  v10[1] = v2;
  uint64_t v3 = *MEMORY[0x263F16E80];
  v9[2] = *MEMORY[0x263F17400];
  v9[3] = v3;
  v10[2] = &unk_26E7CB9E8;
  v10[3] = @"com.apple.identities";
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  OSStatus v5 = SecItemCopyMatching(v4, &cf);
  CFTypeRef v6 = cf;
  if (v5 && cf)
  {
    CFRelease(cf);
    CFTypeRef v6 = 0;
    CFTypeRef cf = 0;
  }

  return v6;
}

CFTypeRef VPNCopyAvailableCertificateObjects()
{
  v10[4] = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  uint64_t v0 = *MEMORY[0x263F171D0];
  uint64_t v1 = *MEMORY[0x263F17530];
  v9[0] = *MEMORY[0x263F171B8];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x263EFFB40];
  v10[0] = v0;
  v10[1] = v2;
  uint64_t v3 = *MEMORY[0x263F16E80];
  v9[2] = *MEMORY[0x263F17400];
  v9[3] = v3;
  v10[2] = &unk_26E7CB9E8;
  v10[3] = @"com.apple.identities";
  CFDictionaryRef v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:4];
  OSStatus v5 = SecItemCopyMatching(v4, &cf);
  CFTypeRef v6 = cf;
  if (v5 && cf)
  {
    CFRelease(cf);
    CFTypeRef v6 = 0;
    CFTypeRef cf = 0;
  }

  return v6;
}

CFStringRef VPNCopyDisplayNameForCertificateWithPersistentID(void *a1)
{
  v13[2] = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = *MEMORY[0x263F17530];
    v12[0] = *MEMORY[0x263F175B0];
    v12[1] = v3;
    uint64_t v4 = *MEMORY[0x263EFFB40];
    v13[0] = v1;
    v13[1] = v4;
    CFDictionaryRef v5 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    SecCertificateRef certificateRef = 0;
    CFTypeRef result = 0;
    OSStatus v6 = SecItemCopyMatching(v5, &result);
    CFStringRef v7 = 0;
    CFTypeRef v8 = result;
    if (!v6 && result)
    {
      CFStringRef v7 = 0;
      if (!SecIdentityCopyCertificate((SecIdentityRef)result, &certificateRef) && certificateRef) {
        CFStringRef v7 = SecCertificateCopySubjectSummary(certificateRef);
      }
      CFTypeRef v8 = result;
    }
    if (v8)
    {
      CFRelease(v8);
      CFTypeRef result = 0;
    }
    if (certificateRef) {
      CFRelease(certificateRef);
    }
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return v7;
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return (CFDictionaryRef)MEMORY[0x270F055E0](protocol);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return (SCNetworkProtocolRef)MEMORY[0x270F05648](service, protocolType);
}

SCPreferencesRef SCPreferencesCreate(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID)
{
  return (SCPreferencesRef)MEMORY[0x270F056F8](allocator, name, prefsID);
}

CFPropertyListRef SCPreferencesGetValue(SCPreferencesRef prefs, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x270F05710](prefs, key);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x270EFD7C0](certificate);
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x270EFD948](identityRef, certificateRef);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x270EFD978](query, result);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

uint64_t ne_session_cancel()
{
  return MEMORY[0x270EDA628]();
}

uint64_t ne_session_create()
{
  return MEMORY[0x270EDA630]();
}

uint64_t ne_session_get_info()
{
  return MEMORY[0x270EDA638]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x270EDA640]();
}

uint64_t ne_session_set_event_handler()
{
  return MEMORY[0x270EDA660]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
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

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x270EDAB48]();
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x270EDBD70](xarray, index);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x270EDBFE8](xdict, applier);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x270EDC080](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC088](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x270EDC0A8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x270EDC3F8](xstring);
}