void sub_100002F84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002FA4(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002FB4(uint64_t a1)
{
}

void sub_100002FBC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (([*(id *)(a1 + 32) isCancelled] & 1) == 0)
  {
    v7 = DiagnosticLogHandleForCategory();
    v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100005A84((uint64_t)v6, v8);
      }

      uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
      uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
      v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 138412290;
        id v14 = v5;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Bluetooth scan completed successfully. Devices: %@", (uint8_t *)&v13, 0xCu);
      }

      uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
      v11 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = &off_100008548;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100003368(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  if (qword_10000C820)
  {
    [(id)qword_10000C820 setSession:0];
    if (a2 == 1)
    {
      if (a3)
      {
        v8 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100005C6C(a3, v8, v16, v17, v18, v19, v20, v21);
        }
        goto LABEL_12;
      }
      v26 = DiagnosticLogHandleForCategory();
      v23 = v26;
      if (a4)
      {
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v27) = 0;
          v24 = "Successfully detached from BT.";
          v25 = (uint8_t *)&v27;
          goto LABEL_21;
        }
LABEL_22:

        [(id)qword_10000C820 setSession:a1];
        goto LABEL_28;
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_100005C38();
      }
LABEL_27:

      goto LABEL_28;
    }
    if (!a2)
    {
      if (a3)
      {
        v8 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          sub_100005BCC(a3, v8, v9, v10, v11, v12, v13, v14);
        }
LABEL_12:

LABEL_28:
        v15 = [qword_10000C820 statusSema:v27];
        dispatch_semaphore_signal(v15);
        goto LABEL_29;
      }
      v22 = DiagnosticLogHandleForCategory();
      v23 = v22;
      if (a4)
      {
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v28 = 0;
          v24 = "Successfully attached to BT.";
          v25 = (uint8_t *)&v28;
LABEL_21:
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, v24, v25, 2u);
          goto LABEL_22;
        }
        goto LABEL_22;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        sub_100005B98();
      }
      goto LABEL_27;
    }
    v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100005B30();
    }
  }
  else
  {
    v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100005AFC();
    }
  }
LABEL_29:
}

void sub_100003560(uint64_t a1, int a2)
{
  if (!qword_10000C820)
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005AFC();
    }
    goto LABEL_12;
  }
  if (a2 == 1)
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received discovery status update: BT_DISCOVERY_SCAN_STOPPED.", v6, 2u);
    }

    [(id)qword_10000C820 setStopped:1];
    v3 = [(id)qword_10000C820 statusSema];
    dispatch_semaphore_signal(v3);
LABEL_12:

    return;
  }
  if (a2)
  {
    id v5 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100005CD8();
    }
  }
  else
  {
    v2 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Received discovery status update: BT_DISCOVERY_SCAN_STARTED.", buf, 2u);
    }

    [(id)qword_10000C820 setStarted:1];
  }
}

void sub_1000036D0(uint64_t a1, int a2)
{
  if (qword_10000C820)
  {
    v3 = [(id)qword_10000C820 devices];
    memset(v11, 0, sizeof(v11));
    if (a2)
    {
      v4 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        sub_100005D74();
      }
    }
    else
    {
      BTDeviceGetAddressString();
      v4 = +[NSString stringWithUTF8String:v11];
      BTDeviceGetName();
      id v5 = +[NSString stringWithUTF8String:v11];
      BTDeviceGetDefaultName();
      id v6 = +[NSString stringWithUTF8String:v11];
      BTDeviceGetDeviceType();
      BTDeviceGetDeviceClass();
      if (v4 && v5 && v6)
      {
        v7 = objc_alloc_init(OSDBluetoothDevice);
        [(OSDBluetoothDevice *)v7 setAddress:v4];
        [(OSDBluetoothDevice *)v7 setName:v5];
        [(OSDBluetoothDevice *)v7 setDefaultName:v6];
        [(OSDBluetoothDevice *)v7 setDeviceType:0];
        [(OSDBluetoothDevice *)v7 setDeviceClass:0];
        [v3 addObject:v7];
        v8 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v10 = v7;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Discovered a BT device: %@", buf, 0xCu);
        }
      }
      else
      {
        DiagnosticLogHandleForCategory();
        v7 = (OSDBluetoothDevice *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR)) {
          sub_100005D40();
        }
      }
    }
  }
  else
  {
    v3 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005AFC();
    }
  }
}

void sub_100003964(uint64_t a1, uint64_t a2)
{
  if (qword_10000C820)
  {
    switch((int)a2)
    {
      case 0:
        v3 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 0;
          _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Received a BT_LOCAL_DEVICE_POWER_STATE_CHANGED callback: %d", (uint8_t *)&v12, 8u);
        }

        v4 = [(id)qword_10000C820 statusSema];
        dispatch_semaphore_signal(v4);
        break;
      case 1:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 1;
          id v5 = "Received a BT_LOCAL_DEVICE_NAME_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 2:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 2;
          id v5 = "Received a BT_LOCAL_DEVICE_DISCOVERABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 3:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 3;
          id v5 = "Received a BT_LOCAL_DEVICE_CONNECTABILITY_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 4:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 4;
          id v5 = "Received a BT_LOCAL_DEVICE_PAIRING_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 5:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 5;
          id v5 = "Received a BT_LOCAL_DEVICE_CONNECTION_STATUS_CHANGED callback: %d";
          goto LABEL_26;
        }
        break;
      case 6:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 6;
          id v5 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STARTED callback: %d";
          goto LABEL_26;
        }
        break;
      case 7:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 7;
          id v5 = "Received a BT_LOCAL_DEVICE_DISCOVERY_STOPPED callback: %d";
          goto LABEL_26;
        }
        break;
      case 8:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          int v12 = 67109120;
          int v13 = 8;
          id v5 = "Received a BT_LOCAL_DEVICE_ADVERTISING_STATUS_CHANGED callback: %d";
LABEL_26:
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v12, 8u);
        }
        break;
      default:
        v4 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          sub_100005DDC(a2, v4, v6, v7, v8, v9, v10, v11);
        }
        break;
    }
  }
  else
  {
    v4 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100005AFC();
    }
  }
}

void sub_100003E70(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTLocalDeviceGetModulePower();
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
    {
      v3 = DiagnosticLogHandleForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
LABEL_6:

        goto LABEL_17;
      }
      LOWORD(v14) = 0;
      v4 = "Error while trying to get the BT module power.";
LABEL_5:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v14, 2u);
      goto LABEL_6;
    }
    int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v6 = DiagnosticLogHandleForCategory();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 != -889275714)
    {
      if (v7)
      {
        CFStringRef v11 = @"OFF";
        int v12 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        if (v12 == -1) {
          CFStringRef v11 = @"ON";
        }
        int v14 = 138412546;
        CFStringRef v15 = v11;
        __int16 v16 = 1024;
        int v17 = v12;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Read BT module power: %@. Powerstate: %x", (uint8_t *)&v14, 0x12u);
      }

      int v13 = *(BOOL **)(a1 + 64);
      if (v13)
      {
        *int v13 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -1;
        goto LABEL_17;
      }
      *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
      v3 = DiagnosticLogHandleForCategory();
      if (!os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_6;
      }
      LOWORD(v14) = 0;
      v4 = "Callback pointer passed to isEnabled was NULL";
      goto LABEL_5;
    }
    if (v7)
    {
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      int v14 = 67109120;
      LODWORD(v15) = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Read BT module powerstate: %x. Starting runloop", (uint8_t *)&v14, 8u);
    }

    uint64_t v9 = WeakRetained[12];
    dispatch_time_t v10 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v9, v10);
  }
LABEL_17:
}

void sub_100004334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004364(uint64_t a1)
{
  uint64_t result = BTLocalDeviceSetModulePower();
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void sub_10000472C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v4);
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v5 - 136));
  _Block_object_dispose((const void *)(v5 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100004784(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v2 = +[NSProcessInfo processInfo];
    id v3 = [v2 processName];
    [v3 UTF8String];
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTSessionAttachWithQueue();
  }
}

uint64_t sub_100004824(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTLocalDeviceGetDefault();
  }

  return _objc_release_x1();
}

uint64_t sub_10000488C(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTLocalDeviceAddCallbacks();
  }

  return _objc_release_x2();
}

uint64_t sub_1000048F4(uint64_t a1)
{
  if (objc_loadWeakRetained((id *)(a1 + 40))) {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTDiscoveryAgentCreate();
  }

  return _objc_release_x2();
}

uint64_t sub_100004A08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    id v3 = WeakRetained + 10;
    uint64_t v6 = WeakRetained;
    if (WeakRetained[10])
    {
      BTDiscoveryAgentDestroy();
      v2 = v6;
      void *v3 = 0;
    }
    if (v2[9])
    {
      BTLocalDeviceRemoveCallbacks();
      v2 = v6;
    }
    v4 = v2 + 8;
    if (v2[8])
    {
      BTSessionDetachWithQueue();
      void *v4 = 0;
    }
  }

  return _objc_release_x1();
}

void sub_100004C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004C44(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004C54(uint64_t a1)
{
}

void sub_100004C5C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  BOOL v7 = DiagnosticLogHandleForCategory();
  int v8 = v7;
  if (!v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Bluetooth scan completed successfully. Devices: %@", buf, 0xCu);
    }

    if (*(void *)(a1 + 32))
    {
      if (![v5 count])
      {
        uint64_t v21 = DiagnosticLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100005F0C();
        }

        uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
        CFStringRef v11 = *(void **)(v19 + 40);
        uint64_t v20 = &off_100008590;
        goto LABEL_21;
      }
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v5;
      id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13)
      {
        id v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          __int16 v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            int v17 = *(void **)(a1 + 32);
            uint64_t v18 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)v16) defaultName:(void)v22];
            [v17 addObject:v18];

            __int16 v16 = (char *)v16 + 1;
          }
          while (v14 != v16);
          id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v14);
      }
    }
    uint64_t v19 = *(void *)(*(void *)(a1 + 48) + 8);
    CFStringRef v11 = *(void **)(v19 + 40);
    uint64_t v20 = &off_100008578;
LABEL_21:
    *(void *)(v19 + 40) = v20;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_100005A84((uint64_t)v6, v8);
  }

  uint64_t v9 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v6 code]);
  uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
  CFStringRef v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
LABEL_22:

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_100004FC4(uint64_t a1)
{
  char v44 = 0;
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  int v43 = 1;
  v2 = *(void **)(a1 + 32);
  id v39 = 0;
  [v2 _setupBluetoothSessionAndDevice:&v39];
  id v3 = v39;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  [*(id *)(a1 + 32) setDevices:v4];

  [*(id *)(a1 + 32) setStarted:0];
  [*(id *)(a1 + 32) setStopped:0];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _bluetoothPower:WeakRetained[9] isEnabled:&v44];
    BOOL v7 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v44) {
        CFStringRef v8 = @"ON";
      }
      else {
        CFStringRef v8 = @"OFF";
      }
      *(_DWORD *)buf = 138412290;
      *(void *)v46 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Initial Bluetooth power state is %@", buf, 0xCu);
    }

    uint64_t v9 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Attempting to power on Bluetooth... (if necessary)", buf, 2u);
    }

    if (([v6 _setBluetoothPower:v6[9] enabled:1 timeout:*(double *)(a1 + 56)] & 1) == 0)
    {
      id v38 = v3;
      +[OSDError setError:&v38 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2107 format:@"Error unable to set the bluetooth power state to ON"];
      id v10 = v38;

      id v3 = v10;
    }
    unint64_t v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    id v12 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Attempting to do a Bluetooth scan...", buf, 2u);
    }

    id v13 = v6[1];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005770;
    block[3] = &unk_1000082E8;
    objc_copyWeak(&v37, (id *)(a1 + 48));
    block[4] = &v40;
    dispatch_sync(v13, block);
    if (*((_DWORD *)v41 + 6))
    {
      id v35 = v3;
      +[OSDError setError:&v35 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2108 format:@"Error trying to start a Bluetooth scan"];
      id v14 = v35;

      id v3 = v14;
    }
    else
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v11);
    }
    uint64_t v15 = DiagnosticLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v16 = [*(id *)(a1 + 32) started];
      unsigned int v17 = [*(id *)(a1 + 32) stopped];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v46 = v16;
      *(_WORD *)&v46[4] = 1024;
      *(_DWORD *)&v46[6] = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Scan complete. Started: %d Stopped: %d", buf, 0xEu);
    }

    if ([*(id *)(a1 + 32) started]) {
      unsigned __int8 v18 = [*(id *)(a1 + 32) stopped];
    }
    else {
      unsigned __int8 v18 = 0;
    }
    if ([*(id *)(a1 + 32) started]
      && ([*(id *)(a1 + 32) stopped] & 1) == 0)
    {
      uint64_t v19 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Sending a stop scan command...", buf, 2u);
      }

      uint64_t v20 = v6[1];
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1000057D8;
      v33[3] = &unk_100008310;
      objc_copyWeak(&v34, (id *)(a1 + 48));
      dispatch_sync(v20, v33);
      unint64_t v11 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 64) * 1000000000.0));
      uint64_t v21 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)v46 = 0x4000000000000000;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Adding grace period delay of %.02f sec for stop notification...", buf, 0xCu);
      }

      dispatch_semaphore_wait((dispatch_semaphore_t)v6[12], v11);
      long long v22 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v23 = [*(id *)(a1 + 32) started];
        unsigned int v24 = [*(id *)(a1 + 32) stopped];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)v46 = v23;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Overtime-scan complete. Started: %d Stopped: %d", buf, 0xEu);
      }

      if ([*(id *)(a1 + 32) started]) {
        unsigned __int8 v18 = [*(id *)(a1 + 32) stopped];
      }
      else {
        unsigned __int8 v18 = 0;
      }
      objc_destroyWeak(&v34);
    }
    if (!v44)
    {
      long long v25 = DiagnosticLogHandleForCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Attempting to power off Bluetooth...", buf, 2u);
      }

      unsigned int v26 = [v6 _setBluetoothPower:v6[9] enabled:0 timeout:(double)v11 - CFAbsoluteTimeGetCurrent()];
      if ((([*(id *)(a1 + 32) stopped] | v26 ^ 1) & 1) == 0) {
        [*(id *)(a1 + 32) setStopped:1];
      }
    }
    if (([*(id *)(a1 + 32) started] & 1) == 0)
    {
      id v32 = v3;
      +[OSDError setError:&v32 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2108 format:@"Error trying to start a Bluetooth scan"];
      id v27 = v32;

      id v3 = v27;
    }
    if (([*(id *)(a1 + 32) stopped] & 1) == 0)
    {
      id v31 = v3;
      +[OSDError setError:&v31 withDomain:@"com.apple.Diagnostics.DABluetooth" withCode:2109 format:@"Error trying to stop a Bluetooth scan"];
      id v28 = v31;

      id v3 = v28;
    }
    [*(id *)(a1 + 32) _teardownBluetoothSessionAndDevice];
    if ((v18 & 1) == 0) {
      [*(id *)(a1 + 32) setDevices:0];
    }
    uint64_t v29 = *(void *)(a1 + 40);
    v30 = [*(id *)(a1 + 32) devices];
    (*(void (**)(uint64_t, void *, id))(v29 + 16))(v29, v30, v3);

    [*(id *)(a1 + 32) setDevices:0];
    objc_destroyWeak(&v37);
  }

  _Block_object_dispose(&v40, 8);
}

void sub_100005700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  objc_destroyWeak(v27);
  objc_destroyWeak(v26);
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_100005770(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = BTDiscoveryAgentStartScan();
    id WeakRetained = v3;
  }
}

void sub_1000057D8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    BTDiscoveryAgentStopScan();
    id WeakRetained = v2;
  }
}

void sub_100005918(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100005958(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void sub_100005978(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100005994(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was nil.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005A0C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "NSError variable was previously assigned.  New unsaved error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005A84(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Bluetooth scan error: %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005AFC()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "Bluetooth callback called without an OSDBluetooth instance!", v2, v3, v4, v5, v6);
}

void sub_100005B30()
{
  sub_100005940();
  sub_100005958((void *)&_mh_execute_header, v0, v1, "Received an unhandled BT session event with event code: %d result code: %d", v2, v3);
}

void sub_100005B98()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "Attached to BT, but the callback data pointer was NULL.", v2, v3, v4, v5, v6);
}

void sub_100005BCC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005C38()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "Detached from BT, but the callback data pointer was NULL.", v2, v3, v4, v5, v6);
}

void sub_100005C6C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005CD8()
{
  sub_100005940();
  sub_100005958((void *)&_mh_execute_header, v0, v1, "Received an unhandled discovery status update: %d result: %d", v2, v3);
}

void sub_100005D40()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "Discovered a BT device but could not find an associated name", v2, v3, v4, v5, v6);
}

void sub_100005D74()
{
  sub_100005940();
  sub_100005958((void *)&_mh_execute_header, v0, v1, "Received an unhandled discovery event: %d flags: %d", v2, v3);
}

void sub_100005DDC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005E48(char a1, NSObject *a2)
{
  CFStringRef v2 = @"OFF";
  if (a1) {
    CFStringRef v2 = @"ON";
  }
  int v3 = 138412290;
  CFStringRef v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not set BT module power: %@", (uint8_t *)&v3, 0xCu);
}

void sub_100005ED8()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "Error while trying to get the BT module power.", v2, v3, v4, v5, v6);
}

void sub_100005F0C()
{
  sub_100005934();
  sub_100005918((void *)&_mh_execute_header, v0, v1, "No Bluetooth devices found; failing.", v2, v3, v4, v5, v6);
}

uint64_t BTDeviceGetAddressString()
{
  return _BTDeviceGetAddressString();
}

uint64_t BTDeviceGetDefaultName()
{
  return _BTDeviceGetDefaultName();
}

uint64_t BTDeviceGetDeviceClass()
{
  return _BTDeviceGetDeviceClass();
}

uint64_t BTDeviceGetDeviceType()
{
  return _BTDeviceGetDeviceType();
}

uint64_t BTDeviceGetName()
{
  return _BTDeviceGetName();
}

uint64_t BTDiscoveryAgentCreate()
{
  return _BTDiscoveryAgentCreate();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return _BTDiscoveryAgentDestroy();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return _BTDiscoveryAgentStartScan();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return _BTDiscoveryAgentStopScan();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return _BTLocalDeviceAddCallbacks();
}

uint64_t BTLocalDeviceGetDefault()
{
  return _BTLocalDeviceGetDefault();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return _BTLocalDeviceGetModulePower();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return _BTLocalDeviceRemoveCallbacks();
}

uint64_t BTLocalDeviceSetModulePower()
{
  return _BTLocalDeviceSetModulePower();
}

uint64_t BTSessionAttachWithQueue()
{
  return _BTSessionAttachWithQueue();
}

uint64_t BTSessionDetachWithQueue()
{
  return _BTSessionDetachWithQueue();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

uint64_t DiagnosticLogHandleForCategory()
{
  return _DiagnosticLogHandleForCategory();
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

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__teardownBluetoothSessionAndDevice(void *a1, const char *a2, ...)
{
  return [a1 _teardownBluetoothSessionAndDevice];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_checkPresence(void *a1, const char *a2, ...)
{
  return [a1 checkPresence];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultName(void *a1, const char *a2, ...)
{
  return [a1 defaultName];
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return [a1 devices];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return [a1 isCancelled];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_started(void *a1, const char *a2, ...)
{
  return [a1 started];
}

id objc_msgSend_statusSema(void *a1, const char *a2, ...)
{
  return [a1 statusSema];
}

id objc_msgSend_stopped(void *a1, const char *a2, ...)
{
  return [a1 stopped];
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return [a1 stringWithUTF8String:];
}