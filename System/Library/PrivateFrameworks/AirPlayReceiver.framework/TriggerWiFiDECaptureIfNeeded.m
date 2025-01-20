@interface TriggerWiFiDECaptureIfNeeded
@end

@implementation TriggerWiFiDECaptureIfNeeded

void ___TriggerWiFiDECaptureIfNeeded_block_invoke(uint64_t a1)
{
  uint64_t v1 = a1;
  v19[3] = *MEMORY[0x263EF8340];
  if (gLogCategory_AirPlayReceiverPlatform <= 50)
  {
    if (gLogCategory_AirPlayReceiverPlatform != -1 || (a1 = _LogCategory_Initialize(), a1))
    {
      uint64_t v15 = *(unsigned int *)(v1 + 40);
      a1 = LogPrintF();
    }
  }
  v2 = (void *)MEMORY[0x230F48DA0](a1);
  uint64_t v3 = *(void *)(*(void *)(v1 + 32) + 16);
  int v4 = *(_DWORD *)(v1 + 40);
  switch(v4)
  {
    case 0:
      uint64_t v11 = *(void *)(v3 + 72) - 1;
      *(void *)(v3 + 72) = v11;
      if (v11) {
        break;
      }
      v10 = @"abort";
LABEL_26:
      v18[0] = @"DEExtensionHostAppKey";
      v18[1] = @"uuid";
      uint64_t v13 = *(void *)(v3 + 64);
      v19[0] = @"AirPlay Transport";
      v19[1] = v13;
      v18[2] = @"trigger";
      v19[2] = v10;
      uint64_t v14 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v19, v18, 3, v15);
      if (gLogCategory_AirPlayReceiverPlatform <= 50
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        uint64_t v17 = *(unsigned int *)(v1 + 40);
        LogPrintF();
        objc_msgSend(*(id *)(v3 + 56), "attachmentsForParameters:andHandler:", v14, 0, v17);
      }
      else
      {
        objc_msgSend(*(id *)(v3 + 56), "attachmentsForParameters:andHandler:", v14, 0, v16);
      }
      break;
    case 2:
      if (!*(void *)(v3 + 72))
      {
        APSLogErrorAt();
        break;
      }
      *(void *)(v3 + 72) = 0;
      v10 = @"post";
      goto LABEL_26;
    case 1:
      uint64_t v5 = *(void *)(v3 + 72);
      *(void *)(v3 + 72) = v5 + 1;
      if (!v5)
      {
        v6 = *(void **)(v3 + 64);
        v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
        id v8 = v7;
        *(void *)(v3 + 64) = v7;

        IsAppleInternalBuild();
        if (IsAppleInternalBuild()) {
          int v9 = 50;
        }
        else {
          int v9 = 30;
        }
        if (v9 >= gLogCategory_AirPlayReceiverPlatform)
        {
          if (gLogCategory_AirPlayReceiverPlatform != -1
            || (IsAppleInternalBuild(), _LogCategory_Initialize()))
          {
            IsAppleInternalBuild();
            uint64_t v15 = *(void *)(v1 + 32);
            LogPrintF();
          }
        }
        DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.airplay.connection.stalled", 0, 0, 1u);
        v10 = @"pre";
        goto LABEL_26;
      }
      break;
    default:
      if (gLogCategory_AirPlayReceiverPlatform <= 60
        && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      break;
  }
  CFRelease(*(CFTypeRef *)(v1 + 32));
  if (gLogCategory_AirPlayReceiverPlatform <= 50
    && (gLogCategory_AirPlayReceiverPlatform != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end