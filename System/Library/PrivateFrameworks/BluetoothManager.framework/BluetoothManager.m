void _btSessionEventCallback(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  void *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  const char *v12;
  uint8_t *v13;
  NSObject *v14;
  NSObject *v15;
  uint8_t v16[16];
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[16];

  v8 = (void *)MEMORY[0x216689470]();
  if (!(a3 | a2))
  {
    v9 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_DEFAULT, "Got a session, lets continue with setup", buf, 2u);
    }
    v10 = [a4 _setup:a1];
    if (v10)
    {
      v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 0;
        v12 = "Sending attached posting BluetoothAvailabilityChangedNotification with availability set to YES";
        v13 = (uint8_t *)&v17;
LABEL_21:
        _os_log_impl(&dword_2129B4000, v11, OS_LOG_TYPE_DEFAULT, v12, v13, 2u);
      }
    }
    else
    {
      [a4 _cleanup:1];
      v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v18 = 0;
        v12 = "Session attached posting BluetoothAvailabilityChangedNotification with availability set to NO";
        v13 = v18;
        goto LABEL_21;
      }
    }
    objc_msgSend(a4, "postNotificationName:object:", @"BluetoothAvailabilityChangedNotification", objc_msgSend(NSNumber, "numberWithBool:", v10));
    [a4 _updateBluetoothState];
    goto LABEL_23;
  }
  if (a2 >= 4) {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", a2);
  }
  v14 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
    _btSessionEventCallback_cold_1();
  }
  if ([a4 available])
  {
    if (!a2) {
      [a4 _updateBluetoothState];
    }
    v15 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_2129B4000, v15, OS_LOG_TYPE_DEFAULT, "Sending BluetoothAvailabilityChangedNotification with availability set to NO", v16, 2u);
    }
    objc_msgSend(a4, "postNotificationName:object:", @"BluetoothAvailabilityChangedNotification", objc_msgSend(NSNumber, "numberWithBool:", 0));
  }
  [a4 _cleanup:0];
  [a4 _attach];
LABEL_23:
}

uint64_t sharedBluetoothManagerLogComponent()
{
  if (sharedBluetoothManagerLogComponent_onceToken != -1) {
    dispatch_once(&sharedBluetoothManagerLogComponent_onceToken, &__block_literal_global);
  }
  return sharedBluetoothManagerLogComponent_sharedBTMLog;
}

Class ___bluetoothIsBeingManaged_block_invoke()
{
  Class result = NSClassFromString(&cfstr_Mcprofileconne.isa);
  if (result)
  {
    Class result = (Class)objc_msgSend((id)-[objc_class sharedConnection](result, "sharedConnection"), "isBluetoothModificationAllowed");
    _bluetoothIsBeingManaged_isManaged = result ^ 1;
  }
  return result;
}

os_log_t __sharedBluetoothManagerLogComponent_block_invoke()
{
  os_log_t result = os_log_create("com.apple.bluetooth", "BluetoothManager");
  sharedBluetoothManagerLogComponent_sharedBTMLog = (uint64_t)result;
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t AddressForBTDevice()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t v3 = 0;
  memset(v2, 0, sizeof(v2));
  if (!BTDeviceGetAddressString()) {
    return [NSString stringWithUTF8String:v2];
  }
  v0 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    AddressForBTDevice_cold_1();
  }
  return 0;
}

void _btServiceEventCallback(uint64_t a1, int a2, int a3, int a4, uint64_t a5)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  v10 = (void *)MEMORY[0x216689470]();
  v11 = +[BluetoothManager sharedInstance];
  id v12 = [(BluetoothManager *)v11 addDeviceIfNeeded:a1];
  v13 = v12;
  if (a2 != -1 && (a2 & 0x40) != 0) {
    goto LABEL_66;
  }
  if (a3 == 2)
  {
    switch(a2)
    {
      case -1:
        if (a4 != 701 || a5) {
          goto LABEL_66;
        }
        [v12 _clearName];
        v24 = @"BluetoothDeviceUpdatedNotification";
        goto LABEL_65;
      case 16:
        if (a4 == 201 && !a5)
        {
          v26 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_10();
          }
        }
        goto LABEL_66;
      case 2:
        if (a4 != 303 || a5) {
          goto LABEL_66;
        }
        v27 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_9();
        }
        break;
      case 1:
        v16 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_8();
        }
        if (a4 == 101 && !a5)
        {
          v17 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_1();
          }
          v18 = v11;
          uint64_t v19 = 1;
LABEL_54:
          [(BluetoothManager *)v18 setAudioConnected:v19];
          goto LABEL_66;
        }
        if (a4 == 102 && !a5)
        {
          v28 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_2();
          }
          v18 = v11;
          uint64_t v19 = 0;
          goto LABEL_54;
        }
        if (a4 == 103 && !a5)
        {
          v30 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_3();
          }
          v24 = @"BluetoothHandsfreeInitiatedVoiceCommand";
          goto LABEL_65;
        }
        if (a4 == 104 && !a5)
        {
          v31 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            _btServiceEventCallback_cold_4();
          }
          v24 = @"BluetoothHandsfreeEndedVoiceCommand";
          goto LABEL_65;
        }
        if (a4 != 303 || a5)
        {
          if (a4 != 702 || a5)
          {
            if (a4 != 703 || a5) {
              goto LABEL_66;
            }
            v34 = sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
              _btServiceEventCallback_cold_7();
            }
            v24 = @"BluetoothHighPowerDisabled";
          }
          else
          {
            v33 = sharedBluetoothManagerLogComponent();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
              _btServiceEventCallback_cold_6();
            }
            v24 = @"BluetoothHighPowerEnabled";
          }
          goto LABEL_65;
        }
        v32 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
          _btServiceEventCallback_cold_5();
        }
        break;
      default:
        goto LABEL_66;
    }
    v24 = @"BluetoothDeviceSupportsContactSyncNotification";
    goto LABEL_65;
  }
  if (a3 == 1)
  {
    uint64_t v20 = [v12 connectedServicesCount];
    if (a4 == 12)
    {
      uint64_t v21 = v20;
      v22 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        if (a5) {
          v23 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"failed with error %d", a5);
        }
        else {
          v23 = @"succeeded";
        }
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v23;
        _os_log_impl(&dword_2129B4000, v22, OS_LOG_TYPE_INFO, "disconnection to service 0x%08x on device %@ %@", buf, 0x1Cu);
      }
      if (!v21)
      {
        if (a5)
        {
          -[BluetoothManager postNotificationName:object:error:](v11, "postNotificationName:object:error:", @"BluetoothDeviceDisconnectFailedNotification", v13, [NSNumber numberWithInt:a5]);
          goto LABEL_66;
        }
        v24 = @"BluetoothDeviceDisconnectSuccessNotification";
        goto LABEL_65;
      }
    }
  }
  else
  {
    if (a3) {
      goto LABEL_66;
    }
    if (([v12 _isNameCached] & 1) == 0)
    {
      uint64_t v49 = 0;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      long long v36 = 0u;
      memset(buf, 0, sizeof(buf));
      if (!BTDeviceGetName()) {
        [(BluetoothManager *)v11 postNotificationName:@"BluetoothDeviceUpdatedNotification" object:v13];
      }
    }
    if (a4 != 1)
    {
      if (a4 != 11) {
        goto LABEL_66;
      }
      v14 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        if (a5) {
          v15 = (__CFString *)objc_msgSend(NSString, "stringWithFormat:", @"failed with error %d", a5);
        }
        else {
          v15 = @"succeeded";
        }
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)&buf[4] = a2;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v13;
        *(_WORD *)&buf[18] = 2112;
        *(void *)&buf[20] = v15;
        _os_log_impl(&dword_2129B4000, v14, OS_LOG_TYPE_INFO, "connection to service 0x%08x on device %@ %@", buf, 0x1Cu);
      }
      if (a2 == 512) {
        [(BluetoothManager *)v11 postNotificationName:@"BluetoothDeviceSupportsMAPClientNotification" object:v13];
      }
      uint64_t v29 = [v13 getConnectingServiceMask] & ~a2;
      [v13 setConnectingServicemask:v29];
      if (a5)
      {
        if (!v29 && ![v13 connectedServicesCount])
        {
          -[BluetoothManager postNotificationName:object:error:](v11, "postNotificationName:object:error:", @"BluetoothDeviceConnectFailedNotification", v13, [NSNumber numberWithInt:a5]);
          [(BluetoothManager *)v11 _updateBluetoothState];
        }
        goto LABEL_66;
      }
      v24 = @"BluetoothDeviceConnectSuccessNotification";
LABEL_65:
      [(BluetoothManager *)v11 postNotificationName:v24 object:v13];
      goto LABEL_66;
    }
    v25 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = a2;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v13;
      _os_log_impl(&dword_2129B4000, v25, OS_LOG_TYPE_INFO, "attempting to connect to service 0x%08x on device %@", buf, 0x12u);
    }
    objc_msgSend(v13, "setConnectingServicemask:", objc_msgSend(v13, "getConnectingServiceMask") | a2);
  }
LABEL_66:
}

float getFloatFromLittleEndianByteStream(uint64_t a1)
{
  return *(float *)a1;
}

BOOL isDebugModeEnabled()
{
  Boolean keyExistsAndHasValidFormat = 0;
  CFPreferencesAppSynchronize(@"com.apple.BTServer");
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"FitTestOptions", @"com.apple.BTServer", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    BOOL v1 = AppBooleanValue == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

void _btLocalStatusEventCallback(uint64_t a1, int a2)
{
  uint64_t v3 = (void *)MEMORY[0x216689470]();
  uint64_t v4 = +[BluetoothManager sharedInstance];
  v5 = v4;
  switch(a2)
  {
    case 0:
      v6 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2129B4000, v6, OS_LOG_TYPE_INFO, "local device power state changed", buf, 2u);
      }
      [(BluetoothManager *)v5 _updateDenylistMode];
      [(BluetoothManager *)v5 _powerChanged];
      break;
    case 3:
      [(BluetoothManager *)v4 _connectabilityChanged];
      break;
    case 4:
      [(BluetoothManager *)v4 _pairedStatusChanged];
      break;
    case 5:
      [(BluetoothManager *)v4 _connectedStatusChanged];
      break;
    case 6:
    case 7:
      [(BluetoothManager *)v4 _discoveryStateChanged];
      break;
    case 8:
      [(BluetoothManager *)v4 _advertisingChanged];
      break;
    case 9:
      v7 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_2129B4000, v7, OS_LOG_TYPE_INFO, "local device airplane mode state changed", v8, 2u);
      }
      [(BluetoothManager *)v5 _updateAirplaneModeStatus];
      break;
    case 10:
      [(BluetoothManager *)v4 _updateDenylistMode];
      break;
    case 11:
      [(BluetoothManager *)v4 _notifyFirstDeviceUnlockCompleted];
      break;
    default:
      break;
  }
}

void _btAccessoryEventCallback(uint64_t a1, int a2, uint64_t a3, int a4, uint64_t a5)
{
  v10 = +[BluetoothManager sharedInstanceQueue];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = ___btAccessoryEventCallback_block_invoke;
  v11[3] = &__block_descriptor_64_e5_v8__0l;
  v11[4] = a1;
  v11[5] = a3;
  int v12 = a2;
  int v13 = a4;
  v11[6] = a5;
  dispatch_async(v10, v11);
}

void _btAccessorySetupCommandCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v9 = (void *)MEMORY[0x216689470]();
  v10 = +[BluetoothManager sharedInstance];
  id v11 = [(BluetoothManager *)v10 addDeviceIfNeeded:a2];
  int v12 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    *(_DWORD *)long long v47 = a6;
    *(_WORD *)&v47[4] = 2096;
    *(void *)&v47[6] = a5;
    _os_log_impl(&dword_2129B4000, v12, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Seal received data  %.*P", buf, 0x12u);
  }
  if (a6 == 178)
  {
    float v13 = *(float *)(a5 + 2);
    float v14 = *(float *)(a5 + 6);
    float v15 = *(float *)(a5 + 18);
    float v16 = *(float *)(a5 + 22);
    float v17 = *(float *)(a5 + 26);
    float v18 = *(float *)(a5 + 90);
    float v19 = *(float *)(a5 + 94);
    float v20 = *(float *)(a5 + 106);
    float v21 = *(float *)(a5 + 110);
    float v22 = *(float *)(a5 + 114);
    BOOL v23 = isDebugModeEnabled() || [v11 productId] == 8212;
    if ([v11 productId] == 8228 || v23)
    {
      float v21 = v20;
      float v22 = v20;
      float v16 = v15;
      float v17 = v15;
    }
    v25 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v18;
      _os_log_impl(&dword_2129B4000, v25, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Confidence Left : %.6f", buf, 0xCu);
    }
    v26 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v19;
      _os_log_impl(&dword_2129B4000, v26, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Coherence Left : %.6f", buf, 0xCu);
    }
    v27 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v13;
      _os_log_impl(&dword_2129B4000, v27, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Confidence Right : %.6f", buf, 0xCu);
    }
    v28 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v14;
      _os_log_impl(&dword_2129B4000, v28, OS_LOG_TYPE_DEFAULT, "DebugFitTest : Coherence Right : %.6f", buf, 0xCu);
    }
    uint64_t v29 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)long long v47 = v20;
      *(_WORD *)&v47[8] = 2048;
      *(double *)&v47[10] = v21;
      __int16 v48 = 2048;
      double v49 = v22;
      _os_log_impl(&dword_2129B4000, v29, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricL input : %.6f, %.6f, %.6f", buf, 0x20u);
    }
    v30 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)long long v47 = v15;
      *(_WORD *)&v47[8] = 2048;
      *(double *)&v47[10] = v16;
      __int16 v48 = 2048;
      double v49 = v17;
      _os_log_impl(&dword_2129B4000, v30, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricR input : %.6f, %.6f, %.6f", buf, 0x20u);
    }
    float v31 = log10f(v20);
    float v32 = (float)(log10f(v21) * 10.0) + (float)(v31 * 10.0);
    float v33 = (float)(v32 + (float)(log10f(v22) * 10.0)) * 0.3333;
    float v34 = log10f(v15);
    float v35 = (float)(log10f(v16) * 10.0) + (float)(v34 * 10.0);
    float v36 = v35 + (float)(log10f(v17) * 10.0);
    long long v37 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v33;
      _os_log_impl(&dword_2129B4000, v37, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricL %.6f", buf, 0xCu);
    }
    float v38 = v36 * 0.3333;
    long long v39 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)long long v47 = v38;
      _os_log_impl(&dword_2129B4000, v39, OS_LOG_TYPE_DEFAULT, "DebugFitTest : SealMetricR %.6f", buf, 0xCu);
    }
    v45[0] = v11;
    *(float *)&double v40 = v33;
    v45[1] = objc_msgSend(NSNumber, "numberWithFloat:", v40, @"device", @"sealLeft");
    v44[2] = @"sealRight";
    *(float *)&double v41 = v38;
    v45[2] = [NSNumber numberWithFloat:v41];
    v44[3] = @"confidenceLeft";
    *(float *)&double v42 = v18;
    v45[3] = [NSNumber numberWithFloat:v42];
    v44[4] = @"confidenceRight";
    *(float *)&double v43 = v13;
    v45[4] = [NSNumber numberWithFloat:v43];
    -[BluetoothManager postNotificationName:object:](v10, "postNotificationName:object:", @"BluetoothAccessorySealValueStatusNotification", [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:5]);
  }
}

void ___btAccessoryEventCallback_block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v1 = *(_DWORD *)(a1 + 56);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = (void *)MEMORY[0x216689470]();
  uint64_t v4 = +[BluetoothManager sharedInstance];
  id v5 = [(BluetoothManager *)v4 addDeviceIfNeeded:v2];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    switch(v1)
    {
      case 1:
        buf[0] = 0;
        if (!BTAccessoryManagerGetDeviceBatteryLevel())
        {
          v6 = @"BluetoothDeviceBatteryChangedNotification";
          goto LABEL_30;
        }
        break;
      case 2:
      case 3:
      case 7:
      case 8:
      case 9:
      case 10:
      case 11:
      case 12:
      case 13:
        break;
      case 4:
        if ((objc_opt_respondsToSelector() & 1) != 0 && [v5 pairedDeviceNameUpdated])
        {
          v6 = @"BluetoothMagicPairedDeviceNameChangedNotification";
          goto LABEL_30;
        }
        break;
      case 5:
        uint64_t v9 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_SETTINGS_CHANGED", buf, 2u);
        }
        v6 = @"BluetoothAccessorySettingsChanged";
        goto LABEL_30;
      case 6:
        [+[BluetoothManager sharedInstance] _accessoryManager];
        int v10 = BTAccessoryManagerGetInEarStatus();
        id v11 = sharedBluetoothManagerLogComponent();
        int v12 = v11;
        if (v10)
        {
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
            ___btAccessoryEventCallback_block_invoke_cold_1();
          }
          break;
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)&uint8_t buf[4] = v5;
          *(_WORD *)&buf[12] = 1024;
          *(_DWORD *)&buf[14] = 3;
          *(_WORD *)&buf[18] = 1024;
          *(_DWORD *)&buf[20] = 3;
          _os_log_impl(&dword_2129B4000, v12, OS_LOG_TYPE_DEFAULT, "received 'AACP In Ear Status Changed' event from device %@ inEarStatus Primary : %u, Secondary : %u", buf, 0x18u);
        }
        *(void *)buf = v5;
        v18[0] = @"device";
        v18[1] = @"primaryInEarStatus";
        *(void *)&buf[8] = [NSNumber numberWithUnsignedInteger:3];
        v18[2] = @"secondaryInEarStatus";
        *(void *)&uint8_t buf[16] = [NSNumber numberWithUnsignedInteger:3];
        uint64_t v17 = [NSDictionary dictionaryWithObjects:buf forKeys:v18 count:3];
        v6 = @"BluetoothAccessoryInEarStatusNotification";
        float v16 = v4;
        goto LABEL_31;
      case 14:
        float v13 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2129B4000, v13, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_HEADTRACKING_CHANGED", buf, 2u);
        }
        v6 = @"BluetoothAccessibilityHeadTrackChanged";
        goto LABEL_30;
      case 15:
        float v14 = sharedBluetoothManagerLogComponent();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2129B4000, v14, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_HEADTRACKING_AVAILABILITY_CHANGED", buf, 2u);
        }
        v6 = @"BluetoothHeadTrackingAvailable";
        goto LABEL_30;
      default:
        if (v1 == 22)
        {
          float v15 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2129B4000, v15, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_AACP_CAPABILITIES_RECEIVED", buf, 2u);
          }
          v6 = @"BluetoothAccessoryAACPCapabilitiesReceived";
        }
        else
        {
          if (v1 != 23) {
            break;
          }
          v8 = sharedBluetoothManagerLogComponent();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2129B4000, v8, OS_LOG_TYPE_DEFAULT, "BT_ACCESSORY_SENSOR_STREAMING_FREQUENCY_CHANGED", buf, 2u);
          }
          v6 = @"BluetoothAccessorySensorStreamingFrequencyChanged";
        }
LABEL_30:
        float v16 = v4;
        uint64_t v17 = (uint64_t)v5;
LABEL_31:
        [(BluetoothManager *)v16 postNotificationName:v6 object:v17];
        break;
    }
  }
  else
  {
    v7 = sharedBluetoothManagerLogComponent();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      ___btAccessoryEventCallback_block_invoke_cold_2();
    }
  }
}

void _btDiscoveryStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  v7 = (void *)MEMORY[0x216689470]();
  [a5 _setScanState:a2];
  if (a2 == 1) {
    [a5 _restartScan];
  }
}

void _btDiscoveryEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  v8 = (void *)MEMORY[0x216689470]();
  uint64_t v9 = [a5 addDeviceIfNeeded:a3];
  if (v9)
  {
    int v10 = (void *)v9;
    if (a2 == 1)
    {
      float v13 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        _btDiscoveryEventCallback_cold_2();
      }
      id v14 = v10;
      [a5 _removeDevice:v10];
      int v12 = @"BluetoothDeviceRemovedNotification";
      goto LABEL_10;
    }
    if (!a2)
    {
      id v11 = sharedBluetoothManagerLogComponent();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        _btDiscoveryEventCallback_cold_1();
      }
      int v12 = @"BluetoothDeviceDiscoveredNotification";
LABEL_10:
      [a5 postNotificationName:v12 object:v10];
    }
  }
}

void pairingAgentStatusEventCallback(uint64_t a1, int a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v9 = (void *)MEMORY[0x216689470]();
  if (a3 == 4294901761) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = [a5 addDeviceIfNeeded:a3];
  }
  if (a2 == 3)
  {
    id v11 = sharedBluetoothManagerLogComponent();
    if (a4)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        pairingAgentStatusEventCallback_cold_2();
      }
      objc_msgSend(a5, "postNotificationName:object:error:", @"BluetoothPairingPINResultFailedNotification", v10, objc_msgSend(NSNumber, "numberWithInt:", a4));
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        pairingAgentStatusEventCallback_cold_1();
      }
      [a5 postNotificationName:@"BluetoothPairingPINResultSuccessNotification" object:v10];
    }
  }
}

void pairingAgentPincodeCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v6 = (void *)MEMORY[0x216689470]();
  uint64_t v7 = [a4 addDeviceIfNeeded:a2];
  v8 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    int v9 = 138412290;
    uint64_t v10 = v7;
    _os_log_impl(&dword_2129B4000, v8, OS_LOG_TYPE_INFO, "received pincode request for device %@", (uint8_t *)&v9, 0xCu);
  }
  [a4 postNotificationName:@"BluetoothPairingPINRequestNotification" object:v7];
}

void pairingAgentUserConfirmationCallback(uint64_t a1, uint64_t a2, uint64_t a3, int a4, void *a5)
{
  *(void *)&v17[5] = *MEMORY[0x263EF8340];
  int v9 = (void *)MEMORY[0x216689470]();
  uint64_t v10 = [a5 addDeviceIfNeeded:a2];
  uint64_t v11 = sharedBluetoothManagerLogComponent();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (a4)
  {
    if (v12)
    {
      *(_DWORD *)buf = 67109378;
      v17[0] = a3;
      LOWORD(v17[1]) = 2112;
      *(void *)((char *)&v17[1] + 2) = v10;
      _os_log_impl(&dword_2129B4000, v11, OS_LOG_TYPE_INFO, "received user confirmation request (numeric comparison to %06u) for device %@", buf, 0x12u);
    }
    uint64_t v13 = objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v10, @"device", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a3), @"value", 0);
    id v14 = @"BluetoothPairingUserNumericComparisionNotification";
    float v15 = a5;
  }
  else
  {
    if (v12)
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v17 = v10;
      _os_log_impl(&dword_2129B4000, v11, OS_LOG_TYPE_INFO, "received user confirmation request for device %@", buf, 0xCu);
    }
    id v14 = @"BluetoothPairingUserConfirmationNotification";
    float v15 = a5;
    uint64_t v13 = v10;
  }
  [v15 postNotificationName:v14 object:v13];
}

void pairingAgentPassKeyDisplayCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v7 = (void *)MEMORY[0x216689470]();
  uint64_t v8 = [a4 addDeviceIfNeeded:a2];
  int v9 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v11 = v8;
    _os_log_impl(&dword_2129B4000, v9, OS_LOG_TYPE_INFO, "received passkey display request for device %@", buf, 0xCu);
  }
  objc_msgSend(a4, "postNotificationName:object:", @"BluetoothPairingPassKeyDisplayNotification", objc_msgSend(NSDictionary, "dictionaryWithObjectsAndKeys:", v8, @"device", objc_msgSend(NSNumber, "numberWithUnsignedInt:", a3), @"value", 0));
}

void pairingAgentLocalOOBDataReadyCallback()
{
  v0 = sharedBluetoothManagerLogComponent();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v1 = 0;
    _os_log_impl(&dword_2129B4000, v0, OS_LOG_TYPE_INFO, "received Local OOB Data Ready callback, unsupported", v1, 2u);
  }
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void AddressForBTDevice_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_2129B4000, v0, v1, "BTDeviceGetAddressString(%p) failed with error %d.", v2, v3);
}

void _btServiceEventCallback_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'audio connected' handsfree event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'audio disconnected' handsfree event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'start voice command' handsfree event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'end voice command' handsfree event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'phonebook supported' handsfree event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'high power enabled' event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_7()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'high power disabled' event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_8()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2129B4000, v0, OS_LOG_TYPE_DEBUG, "received BT_SERVICE_DEPENDENT_EVENT event for BT_SERVICE_HANDSFREE", v1, 2u);
}

void _btServiceEventCallback_cold_9()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'phonebook supported' phonebook event from device %@", v2, v3, v4, v5, v6);
}

void _btServiceEventCallback_cold_10()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "received 'A2DP audio connected' event from device %@", v2, v3, v4, v5, v6);
}

void _btSessionEventCallback_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_2129B4000, v0, v1, "Session attach called back with %@ (%x)");
}

void ___btAccessoryEventCallback_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2129B4000, v0, v1, "Failed to get inEarStatus : %d", v2, v3, v4, v5, v6);
}

void ___btAccessoryEventCallback_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_7(&dword_2129B4000, v0, v1, "Bad device instance: %@", v2, v3, v4, v5, v6);
}

void _btDiscoveryEventCallback_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "found device %@", v2, v3, v4, v5, v6);
}

void _btDiscoveryEventCallback_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "lost device %@", v2, v3, v4, v5, v6);
}

void pairingAgentStatusEventCallback_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_4(&dword_2129B4000, v0, v1, "pairing to device %@ completed successfully", v2, v3, v4, v5, v6);
}

void pairingAgentStatusEventCallback_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_3_0(&dword_2129B4000, v0, v1, "pairing to device %@ failed with result %d");
}

uint64_t BTAccessoryManagerAddCallbacks()
{
  return MEMORY[0x270F4A960]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityBits()
{
  return MEMORY[0x270F4A970]();
}

uint64_t BTAccessoryManagerGetAACPCapabilityInteger()
{
  return MEMORY[0x270F4A978]();
}

uint64_t BTAccessoryManagerGetAccessoryInfo()
{
  return MEMORY[0x270F4A980]();
}

uint64_t BTAccessoryManagerGetCallManagementConfig()
{
  return MEMORY[0x270F4A988]();
}

uint64_t BTAccessoryManagerGetControlCommand()
{
  return MEMORY[0x270F4A990]();
}

uint64_t BTAccessoryManagerGetDefault()
{
  return MEMORY[0x270F4A998]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryLevel()
{
  return MEMORY[0x270F4A9A0]();
}

uint64_t BTAccessoryManagerGetDeviceBatteryStatus()
{
  return MEMORY[0x270F4A9A8]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileAllowed()
{
  return MEMORY[0x270F4A9B8]();
}

uint64_t BTAccessoryManagerGetDeviceSoundProfileSupport()
{
  return MEMORY[0x270F4A9C0]();
}

uint64_t BTAccessoryManagerGetDoubleTapAction()
{
  return MEMORY[0x270F4A9C8]();
}

uint64_t BTAccessoryManagerGetDoubleTapActionEx()
{
  return MEMORY[0x270F4A9D0]();
}

uint64_t BTAccessoryManagerGetDoubleTapCapability()
{
  return MEMORY[0x270F4A9D8]();
}

uint64_t BTAccessoryManagerGetFeatureCapability()
{
  return MEMORY[0x270F4A9E0]();
}

uint64_t BTAccessoryManagerGetFeatureProxCardStatus()
{
  return MEMORY[0x270F4A9E8]();
}

uint64_t BTAccessoryManagerGetGyroInformation()
{
  return MEMORY[0x270F4A9F0]();
}

uint64_t BTAccessoryManagerGetHeadphoneFeatureValue()
{
  return MEMORY[0x270F4A9F8]();
}

uint64_t BTAccessoryManagerGetInEarDetectionEnable()
{
  return MEMORY[0x270F4AA00]();
}

uint64_t BTAccessoryManagerGetInEarStatus()
{
  return MEMORY[0x270F4AA08]();
}

uint64_t BTAccessoryManagerGetMicMode()
{
  return MEMORY[0x270F4AA10]();
}

uint64_t BTAccessoryManagerGetNonAppleHAEPairedDevices()
{
  return MEMORY[0x270F4AA18]();
}

uint64_t BTAccessoryManagerGetSettingFeatureBitMask()
{
  return MEMORY[0x270F4AA28]();
}

uint64_t BTAccessoryManagerGetSmartRouteMode()
{
  return MEMORY[0x270F4AA30]();
}

uint64_t BTAccessoryManagerGetSmartRouteSupport()
{
  return MEMORY[0x270F4AA38]();
}

uint64_t BTAccessoryManagerGetSpatialAudioActive()
{
  return MEMORY[0x270F4AA40]();
}

uint64_t BTAccessoryManagerGetSpatialAudioAllowed()
{
  return MEMORY[0x270F4AA48]();
}

uint64_t BTAccessoryManagerGetSpatialAudioConfig()
{
  return MEMORY[0x270F4AA50]();
}

uint64_t BTAccessoryManagerGetSpatialAudioPlatformSupport()
{
  return MEMORY[0x270F4AA58]();
}

uint64_t BTAccessoryManagerGetStereoHFPSupport()
{
  return MEMORY[0x270F4AA60]();
}

uint64_t BTAccessoryManagerGetWirelessSharingSpatial()
{
  return MEMORY[0x270F4AA70]();
}

uint64_t BTAccessoryManagerIsAccessory()
{
  return MEMORY[0x270F4AA78]();
}

uint64_t BTAccessoryManagerIsGenuineAirPods()
{
  return MEMORY[0x270F4AA80]();
}

uint64_t BTAccessoryManagerRemoveCallbacks()
{
  return MEMORY[0x270F4AAA8]();
}

uint64_t BTAccessoryManagerSendControlCommand()
{
  return MEMORY[0x270F4AAB0]();
}

uint64_t BTAccessoryManagerSetDeviceSoundProfileAllowed()
{
  return MEMORY[0x270F4AAC0]();
}

uint64_t BTAccessoryManagerSetDoubleTapAction()
{
  return MEMORY[0x270F4AAC8]();
}

uint64_t BTAccessoryManagerSetDoubleTapActionEx()
{
  return MEMORY[0x270F4AAD0]();
}

uint64_t BTAccessoryManagerSetFeatureProxCardStatus()
{
  return MEMORY[0x270F4AAD8]();
}

uint64_t BTAccessoryManagerSetHeadphoneFeatureValue()
{
  return MEMORY[0x270F4AAE0]();
}

uint64_t BTAccessoryManagerSetInEarDetectionEnable()
{
  return MEMORY[0x270F4AAE8]();
}

uint64_t BTAccessoryManagerSetIsHidden()
{
  return MEMORY[0x270F4AAF0]();
}

uint64_t BTAccessoryManagerSetMicMode()
{
  return MEMORY[0x270F4AB00]();
}

uint64_t BTAccessoryManagerSetupCommand()
{
  return MEMORY[0x270F4AB08]();
}

uint64_t BTAccessoryManagerSmartRouteMode()
{
  return MEMORY[0x270F4AB10]();
}

uint64_t BTAccessoryManagerSpatialAudioAllowed()
{
  return MEMORY[0x270F4AB18]();
}

uint64_t BTAccessoryManagerSpatialAudioConfig()
{
  return MEMORY[0x270F4AB20]();
}

uint64_t BTDeviceAddressFromString()
{
  return MEMORY[0x270F4AB30]();
}

uint64_t BTDeviceConnectServices()
{
  return MEMORY[0x270F4AB48]();
}

uint64_t BTDeviceDisconnect()
{
  return MEMORY[0x270F4AB50]();
}

uint64_t BTDeviceFromAddress()
{
  return MEMORY[0x270F4AB58]();
}

uint64_t BTDeviceFromIdentifier()
{
  return MEMORY[0x270F4AB60]();
}

uint64_t BTDeviceGetAddressString()
{
  return MEMORY[0x270F4AB68]();
}

uint64_t BTDeviceGetCloudPairingStatus()
{
  return MEMORY[0x270F4AB70]();
}

uint64_t BTDeviceGetConnectedServices()
{
  return MEMORY[0x270F4AB78]();
}

uint64_t BTDeviceGetDefaultName()
{
  return MEMORY[0x270F4AB80]();
}

uint64_t BTDeviceGetDeviceClass()
{
  return MEMORY[0x270F4AB88]();
}

uint64_t BTDeviceGetDeviceId()
{
  return MEMORY[0x270F4AB90]();
}

uint64_t BTDeviceGetDeviceType()
{
  return MEMORY[0x270F4AB98]();
}

uint64_t BTDeviceGetGroups()
{
  return MEMORY[0x270F4ABA0]();
}

uint64_t BTDeviceGetHIDDeviceBehavior()
{
  return MEMORY[0x270F4ABA8]();
}

uint64_t BTDeviceGetLowSecurityStatus()
{
  return MEMORY[0x270F4ABB0]();
}

uint64_t BTDeviceGetMagicPairingStatus()
{
  return MEMORY[0x270F4ABB8]();
}

uint64_t BTDeviceGetName()
{
  return MEMORY[0x270F4ABC0]();
}

uint64_t BTDeviceGetPairingStatus()
{
  return MEMORY[0x270F4ABC8]();
}

uint64_t BTDeviceGetProductName()
{
  return MEMORY[0x270F4ABD0]();
}

uint64_t BTDeviceGetServiceSettings()
{
  return MEMORY[0x270F4ABD8]();
}

uint64_t BTDeviceGetSupportedServices()
{
  return MEMORY[0x270F4ABE0]();
}

uint64_t BTDeviceGetSyncSettings()
{
  return MEMORY[0x270F4ABE8]();
}

uint64_t BTDeviceGetUserSelectedDeviceType()
{
  return MEMORY[0x270F4ABF0]();
}

uint64_t BTDeviceIsAppleAudioDevice()
{
  return MEMORY[0x270F4ABF8]();
}

uint64_t BTDeviceIsProController()
{
  return MEMORY[0x270F4AC00]();
}

uint64_t BTDeviceIsTemporaryPaired()
{
  return MEMORY[0x270F4AC08]();
}

uint64_t BTDevicePhysicalLinkDisconnect()
{
  return MEMORY[0x270F4AC10]();
}

uint64_t BTDeviceSetServiceSettings()
{
  return MEMORY[0x270F4AC20]();
}

uint64_t BTDeviceSetUserName()
{
  return MEMORY[0x270F4AC30]();
}

uint64_t BTDeviceSetUserSelectedDeviceType()
{
  return MEMORY[0x270F4AC38]();
}

uint64_t BTDeviceSupportsHS()
{
  return MEMORY[0x270F4AC40]();
}

uint64_t BTDiscoveryAgentCreate()
{
  return MEMORY[0x270F4AC48]();
}

uint64_t BTDiscoveryAgentDestroy()
{
  return MEMORY[0x270F4AC50]();
}

uint64_t BTDiscoveryAgentGetDevices()
{
  return MEMORY[0x270F4AC58]();
}

uint64_t BTDiscoveryAgentStartScan()
{
  return MEMORY[0x270F4AC60]();
}

uint64_t BTDiscoveryAgentStopScan()
{
  return MEMORY[0x270F4AC68]();
}

uint64_t BTLocalDeviceAddCallbacks()
{
  return MEMORY[0x270F4AC70]();
}

uint64_t BTLocalDeviceEnableDUTMode()
{
  return MEMORY[0x270F4AC78]();
}

uint64_t BTLocalDeviceGetAddressString()
{
  return MEMORY[0x270F4AC80]();
}

uint64_t BTLocalDeviceGetAdvertisingStatus()
{
  return MEMORY[0x270F4AC88]();
}

uint64_t BTLocalDeviceGetAirplaneModeStatus()
{
  return MEMORY[0x270F4AC90]();
}

uint64_t BTLocalDeviceGetConnectable()
{
  return MEMORY[0x270F4AC98]();
}

uint64_t BTLocalDeviceGetConnectedDevices()
{
  return MEMORY[0x270F4ACA0]();
}

uint64_t BTLocalDeviceGetConnectingDevices()
{
  return MEMORY[0x270F4ACA8]();
}

uint64_t BTLocalDeviceGetConnectionStatus()
{
  return MEMORY[0x270F4ACB0]();
}

uint64_t BTLocalDeviceGetDefault()
{
  return MEMORY[0x270F4ACB8]();
}

uint64_t BTLocalDeviceGetDenylistEnabled()
{
  return MEMORY[0x270F4ACC0]();
}

uint64_t BTLocalDeviceGetDeviceNamesThatMayBeDenylisted()
{
  return MEMORY[0x270F4ACC8]();
}

uint64_t BTLocalDeviceGetDiscoverable()
{
  return MEMORY[0x270F4ACD0]();
}

uint64_t BTLocalDeviceGetModulePower()
{
  return MEMORY[0x270F4ACD8]();
}

uint64_t BTLocalDeviceGetPairedDevices()
{
  return MEMORY[0x270F4ACE0]();
}

uint64_t BTLocalDeviceGetScanning()
{
  return MEMORY[0x270F4ACE8]();
}

uint64_t BTLocalDeviceGetSpatialPlatformSupport()
{
  return MEMORY[0x270F4ACF0]();
}

uint64_t BTLocalDeviceRemoveCallbacks()
{
  return MEMORY[0x270F4AD00]();
}

uint64_t BTLocalDeviceSetConnectable()
{
  return MEMORY[0x270F4AD08]();
}

uint64_t BTLocalDeviceSetDiscoverable()
{
  return MEMORY[0x270F4AD18]();
}

uint64_t BTLocalDeviceSetModulePower()
{
  return MEMORY[0x270F4AD20]();
}

uint64_t BTLocalDeviceShowPowerPrompt()
{
  return MEMORY[0x270F4AD28]();
}

uint64_t BTLocalDeviceSupportsService()
{
  return MEMORY[0x270F4AD30]();
}

uint64_t BTPairingAgentAcceptSSP()
{
  return MEMORY[0x270F4AD38]();
}

uint64_t BTPairingAgentCancelPairing()
{
  return MEMORY[0x270F4AD40]();
}

uint64_t BTPairingAgentCreate()
{
  return MEMORY[0x270F4AD48]();
}

uint64_t BTPairingAgentDeletePairedDevice()
{
  return MEMORY[0x270F4AD50]();
}

uint64_t BTPairingAgentDestroy()
{
  return MEMORY[0x270F4AD58]();
}

uint64_t BTPairingAgentSetPincode()
{
  return MEMORY[0x270F4AD60]();
}

uint64_t BTPairingAgentStart()
{
  return MEMORY[0x270F4AD68]();
}

uint64_t BTPairingAgentStop()
{
  return MEMORY[0x270F4AD70]();
}

uint64_t BTServiceAddCallbacks()
{
  return MEMORY[0x270F4AD78]();
}

uint64_t BTServiceRemoveCallbacks()
{
  return MEMORY[0x270F4AD88]();
}

uint64_t BTSessionAttachWithQueue()
{
  return MEMORY[0x270F4AD90]();
}

uint64_t BTSessionDetachWithQueue()
{
  return MEMORY[0x270F4AD98]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x270EE4C90](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FC0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

void bzero(void *a1, size_t a2)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

void free(void *a1)
{
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

float log10f(float a1)
{
  MEMORY[0x270EDA0B8](a1);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x270EDBE58](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

void xpc_release(xpc_object_t object)
{
}