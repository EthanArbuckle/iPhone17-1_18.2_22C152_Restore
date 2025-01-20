@interface AirPlayReceiverUI
@end

@implementation AirPlayReceiverUI

void __AirPlayReceiverUI_GetShared_block_invoke()
{
  v0 = (dispatch_queue_t *)malloc_type_calloc(1uLL, 0xC8uLL, 0x10E00403FEE3558uLL);
  v1 = dispatch_queue_create("AirPlayReceiverUI", 0);
  dispatch_queue_t *v0 = v1;
  dispatch_set_context(v1, v0);
  IsAppleTV();
  int v2 = APSSettingsGetIntWithDefault() != 0;
  *((unsigned char *)v0 + 40) = v2;
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    int v2 = *((unsigned __int8 *)v0 + 40);
  }
  if (v2)
  {
    if (!v0[2])
    {
      mach_service = xpc_connection_create_mach_service("com.apple.airplay.receiver", *v0, 1uLL);
      v0[2] = (dispatch_queue_t)mach_service;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = ___AirPlayReceiverUI_StartServer_block_invoke;
      handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
      handler[4] = v0;
      xpc_connection_set_event_handler(mach_service, handler);
      xpc_connection_resume((xpc_connection_t)v0[2]);
      if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
        && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
  }
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  AirPlayReceiverUI_GetShared_ui = (uint64_t)v0;
}

void ___AirPlayReceiverUI_StartServer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (!*(void *)(v3 + 16))
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 90
      || gLogCategory_AirPlayReceiverUIXPCServerCore == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    goto LABEL_25;
  }
  uint64_t v4 = MEMORY[0x230F49300](a2);
  if (v4 != MEMORY[0x263EF86F0])
  {
    if (v4 != MEMORY[0x263EF8720])
    {
      if (a2 == (void *)MEMORY[0x263EF86A0] || a2 == (void *)MEMORY[0x263EF86A8])
      {
        if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
          && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        xpc_connection_cancel(*(xpc_connection_t *)(v3 + 32));
        xpc_release(*(xpc_object_t *)(v3 + 32));
        *(void *)(v3 + 32) = 0;
        _AirPlayReceiverUI_HandleServerReset(v3);
      }
      return;
    }
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 60
      || gLogCategory_AirPlayReceiverUIXPCServerCore == -1 && !_LogCategory_Initialize())
    {
      return;
    }
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x263EF86B0]);
LABEL_25:
    LogPrintF();
    return;
  }
  v5 = *(_xpc_connection_s **)(v3 + 32);
  if (v5)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore > 90) {
      goto LABEL_22;
    }
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()) {
      LogPrintF();
    }
    v5 = *(_xpc_connection_s **)(v3 + 32);
    if (v5)
    {
LABEL_22:
      xpc_connection_cancel(v5);
      xpc_release(v5);
      *(void *)(v3 + 32) = 0;
    }
  }
  xpc_retain(a2);
  *(void *)(v3 + 32) = a2;
  xpc_connection_set_target_queue((xpc_connection_t)a2, *(dispatch_queue_t *)v3);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = ___AirPlayReceiverUI_XPCListenerEventHandler_block_invoke;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = v3;
  xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
  xpc_connection_resume((xpc_connection_t)a2);
  *(unsigned char *)(v3 + 24) = 1;
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 40
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_25;
  }
}

void ___AirPlayReceiverUI_XPCListenerEventHandler_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
    && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  {
    v52 = a2;
    LogPrintF();
  }
  if (!*(void *)(v3 + 32)) {
    return;
  }
  if (a2 == (void *)MEMORY[0x263EF86A0])
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_61;
  }
  if (a2 == (void *)MEMORY[0x263EF86A8])
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    xpc_connection_cancel(*(xpc_connection_t *)(v3 + 32));
    xpc_release(*(xpc_object_t *)(v3 + 32));
    *(void *)(v3 + 32) = 0;
LABEL_61:
    _AirPlayReceiverUI_HandleServerReset(v3);
    return;
  }
  if (MEMORY[0x230F49300](a2) != MEMORY[0x263EF8708])
  {
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 90
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_53;
    }
    return;
  }
  string = xpc_dictionary_get_string(a2, "function");
  if (!string)
  {
    goto LABEL_121;
  }
  v5 = string;
  if (!strcmp(string, "postEvent"))
  {
    v6 = xpc_dictionary_get_string(a2, "eventType");
    if (!strcmp(v6, "ended")) {
      goto LABEL_54;
    }
    if (!strcmp(v6, "error"))
    {
      if (AirPlayReceiverUI_GetShared_once != -1) {
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
      }
      uint64_t v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
      [v18 setObject:@"video" forKey:@"category"];
      CFDictionaryRef v19 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v19) {
        goto LABEL_121;
      }
      CFDictionaryRef v20 = v19;
      CFTypeID v21 = CFGetTypeID(v19);
      if (v21 != CFDictionaryGetTypeID()) {
        goto LABEL_162;
      }
      [v18 setObject:v20 forKey:@"error"];
      Value = CFDictionaryGetValue(v20, @"sessionID");
      if (Value) {
        [v18 setObject:Value forKey:@"sessionID"];
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleErrorEvent_block_invoke;
    }
    else if (!strcmp(v6, "failedURLRequest"))
    {
      if (AirPlayReceiverUI_GetShared_once != -1) {
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
      }
      uint64_t v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
      [v18 setObject:@"unhandledURLRequest" forKey:@"type"];
      CFDictionaryRef v24 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v24) {
        goto LABEL_121;
      }
      CFDictionaryRef v20 = v24;
      CFTypeID v25 = CFGetTypeID(v24);
      if (v25 != CFDictionaryGetTypeID()) {
        goto LABEL_162;
      }
      [v18 setObject:v20 forKey:@"request"];
      v26 = CFDictionaryGetValue(v20, @"sessionID");
      if (v26) {
        [v18 setObject:v26 forKey:@"sessionID"];
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleFailedURLRequest_block_invoke;
    }
    else
    {
      if (!strcmp(v6, "loading")) {
        goto LABEL_54;
      }
      if (strcmp(v6, "metaDataChanged"))
      {
        if (strcmp(v6, "paused") && strcmp(v6, "playing"))
        {
          if (!strcmp(v6, "stopAudio"))
          {
            CFDictionaryRef v30 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
            if (!v30) {
              goto LABEL_121;
            }
            CFDictionaryRef v20 = v30;
            CFTypeID v31 = CFGetTypeID(v30);
            if (v31 != CFDictionaryGetTypeID()) {
              goto LABEL_162;
            }
            int Int64 = CFDictionaryGetInt64();
            dispatch_retain(*(dispatch_object_t *)v3);
            uint64_t block = MEMORY[0x263EF8330];
            uint64_t v55 = 3221225472;
            v56 = ___AirPlayReceiverUI_HandleAudioStop_block_invoke;
            v57 = &__block_descriptor_44_e5_v8__0l;
            uint64_t v58 = v3;
            LODWORD(v59) = Int64;
LABEL_90:
            dispatch_async(MEMORY[0x263EF83A0], &block);
LABEL_91:
            CFRelease(v20);
            return;
          }
          if (strcmp(v6, "stopped"))
          {
            if (strcmp_prefix())
            {
              if (!strcmp(v6, "currentItemChanged")) {
                goto LABEL_96;
              }
              if (strcmp(v6, "dateRange"))
              {
                if (strcmp(v6, "itemPlayedToEnd") && strcmp(v6, "itemRemoved"))
                {
                  if (strcmp(v6, "fpsSecureStopGenerated"))
                  {
                    if (AirPlayReceiverUI_GetShared_once != -1) {
                      dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
                    }
                    uint64_t v7 = AirPlayReceiverUI_GetShared_ui;
                    v8 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
                    v9 = xpc_dictionary_get_string(a2, "eventType");
                    if (v9)
                    {
                      uint64_t v10 = [NSString stringWithUTF8String:v9];
                      if (v10) {
                        [v8 setObject:v10 forKey:@"type"];
                      }
                    }
                    CFDictionaryRef v11 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                    if (v11 && (CFDictionaryRef v12 = v11, v13 = CFGetTypeID(v11), v13 == CFDictionaryGetTypeID()))
                    {
                      v14 = CFDictionaryGetValue(v12, @"sessionID");
                      if (v14) {
                        [v8 setObject:v14 forKey:@"sessionID"];
                      }
                      MutableCopy = CFDictionaryCreateMutableCopy(0, 0, v12);
                      if (MutableCopy)
                      {
                        CFDictionaryRef v16 = MutableCopy;
                        CFDictionaryRemoveValue(MutableCopy, @"sessionID");
                        if (CFDictionaryGetCount(v16) >= 1) {
                          [v8 setObject:v16 forKey:@"params"];
                        }
                        CFRelease(v16);
                      }
                      CFRelease(v12);
                    }
                    else
                    {
                      APSLogErrorAt();
                    }
                    uint64_t block = MEMORY[0x263EF8330];
                    uint64_t v55 = 3221225472;
                    v56 = ___AirPlayReceiverUI_HandleOtherEvent_block_invoke;
                    v57 = &unk_264896140;
                    uint64_t v58 = (uint64_t)v8;
                    uint64_t v59 = v7;
                    dispatch_async(MEMORY[0x263EF83A0], &block);
                    return;
                  }
                  CFDictionaryRef v45 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                  if (v45)
                  {
                    CFDictionaryRef v20 = v45;
                    CFTypeID v46 = CFGetTypeID(v45);
                    if (v46 == CFDictionaryGetTypeID())
                    {
                      CFRetain(v20);
                      uint64_t block = MEMORY[0x263EF8330];
                      uint64_t v55 = 3221225472;
                      v56 = ___AirPlayReceiverUI_HandleFPSSecureStopGenerated_block_invoke;
                      v57 = &__block_descriptor_40_e5_v8__0l;
                      uint64_t v58 = (uint64_t)v20;
                      goto LABEL_90;
                    }
LABEL_162:
                    APSLogErrorAt();
                    goto LABEL_91;
                  }
                  goto LABEL_121;
                }
LABEL_96:
                _AirPlayReceiverUI_HandlePlaylistEvent(a2);
                return;
              }
              if (AirPlayReceiverUI_GetShared_once != -1) {
                dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
              }
              uint64_t v17 = AirPlayReceiverUI_GetShared_ui;
              v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
              [v18 setObject:@"video" forKey:@"category"];
              [v18 setObject:@"dateRange" forKey:@"type"];
              CFDictionaryRef v37 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
              if (!v37) {
                goto LABEL_121;
              }
              CFDictionaryRef v20 = v37;
              CFTypeID v38 = CFGetTypeID(v37);
              if (v38 != CFDictionaryGetTypeID()) {
                goto LABEL_162;
              }
              v39 = CFDictionaryGetValue(v20, @"dateRangeArray");
              if (v39) {
                [v18 setObject:v39 forKey:@"dateRangeArray"];
              }
              v40 = CFDictionaryGetValue(v20, @"uuid");
              if (v40) {
                [v18 setObject:v40 forKey:@"uuid"];
              }
              v41 = CFDictionaryGetValue(v20, @"sessionID");
              if (v41) {
                [v18 setObject:v41 forKey:@"sessionID"];
              }
              uint64_t block = MEMORY[0x263EF8330];
              uint64_t v55 = 3221225472;
              v23 = ___AirPlayReceiverUI_HandleDateRangeEvent_block_invoke;
              goto LABEL_89;
            }
            if (AirPlayReceiverUI_GetShared_once != -1) {
              dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
            }
            uint64_t v33 = AirPlayReceiverUI_GetShared_ui;
            v34 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
            v35 = xpc_dictionary_get_string(a2, "eventType");
            if (!v35) {
              goto LABEL_121;
            }
            v36 = v35;
            if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 40
              && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
            {
              v53 = v36;
              LogPrintF();
            }
            if (!strcmp(v36, "userNext"))
            {
              [v34 setObject:@"next" forKey:@"action"];
              char v42 = 0;
              v43 = @"kAirPlaySlideshowNotification_UserNext";
              goto LABEL_147;
            }
            if (!strcmp(v36, "userPrevious"))
            {
              [v34 setObject:@"previous" forKey:@"action"];
              char v42 = 0;
              v43 = @"kAirPlaySlideshowNotification_UserPrevious";
              goto LABEL_147;
            }
            if (!strcmp(v36, "userUp"))
            {
              v44 = @"up";
            }
            else
            {
              if (strcmp(v36, "userDown"))
              {
                if (!strcmp(v36, "userSelect"))
                {
                  v47 = @"select";
                }
                else
                {
                  if (strcmp(v36, "userPlayPause"))
                  {
                    if (strcmp(v36, "userStop"))
                    {
                      if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50
                        && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
                      {
                        LogPrintF();
                      }
                      goto LABEL_141;
                    }
                    [v34 setObject:@"stopped" forKey:@"state"];
                    [v34 setObject:@"photo" forKey:@"category"];
                    char v42 = 1;
                    v43 = @"kAirPlaySlideshowNotification_UserStop";
LABEL_147:
                    CFDictionaryRef v48 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
                    if (v48)
                    {
                      CFDictionaryRef v20 = v48;
                      CFTypeID v49 = CFGetTypeID(v48);
                      if (v49 == CFDictionaryGetTypeID())
                      {
                        v50 = CFDictionaryGetValue(v20, @"sessionID");
                        if (v50) {
                          [v34 setObject:v50 forKey:@"sessionID"];
                        }
                        v51 = CFDictionaryGetValue(v20, @"userExit");
                        if (v51) {
                          [v34 setObject:v51 forKey:@"userExit"];
                        }
                        uint64_t block = MEMORY[0x263EF8330];
                        uint64_t v55 = 3221225472;
                        v56 = ___AirPlayReceiverUI_HandleUserEvent_block_invoke;
                        v57 = &unk_264895700;
                        uint64_t v58 = (uint64_t)v43;
                        uint64_t v59 = (uint64_t)v34;
                        uint64_t v60 = v33;
                        char v61 = v42;
                        goto LABEL_90;
                      }
                      goto LABEL_162;
                    }
LABEL_121:
                    APSLogErrorAt();
                    return;
                  }
                  v47 = @"play";
                }
                objc_msgSend(v34, "setObject:forKey:", v47, @"action", v53);
                char v42 = 0;
                v43 = @"kAirPlaySlideshowNotification_UserPlayPause";
                goto LABEL_147;
              }
              v44 = @"down";
            }
            objc_msgSend(v34, "setObject:forKey:", v44, @"action", v53);
LABEL_141:
            v43 = 0;
            char v42 = 0;
            goto LABEL_147;
          }
        }
LABEL_54:
        _AirPlayReceiverUI_HandleStateEvent(a2);
        return;
      }
      if (AirPlayReceiverUI_GetShared_once != -1) {
        dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
      }
      uint64_t v17 = AirPlayReceiverUI_GetShared_ui;
      v18 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v52);
      [v18 setObject:@"video" forKey:@"category"];
      [v18 setObject:@"timedMetadata" forKey:@"type"];
      CFDictionaryRef v27 = (const __CFDictionary *)xpc_dictionary_copy_cf_object();
      if (!v27) {
        goto LABEL_121;
      }
      CFDictionaryRef v20 = v27;
      CFTypeID v28 = CFGetTypeID(v27);
      if (v28 != CFDictionaryGetTypeID()) {
        goto LABEL_162;
      }
      v29 = CFDictionaryGetValue(v20, @"sessionID");
      if (v29) {
        [v18 setObject:v29 forKey:@"sessionID"];
      }
      uint64_t block = MEMORY[0x263EF8330];
      uint64_t v55 = 3221225472;
      v23 = ___AirPlayReceiverUI_HandleMetaDataEvent_block_invoke;
    }
LABEL_89:
    v56 = v23;
    v57 = &unk_264896140;
    uint64_t v58 = (uint64_t)v18;
    uint64_t v59 = v17;
    goto LABEL_90;
  }
  if (!strcmp(v5, "ping"))
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 10
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_53;
    }
  }
  else if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 60 {
         && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
  }
  {
LABEL_53:
    LogPrintF();
  }
}

void ___AirPlayReceiverUI_HandleServerReset_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 128);
  if (!*(_DWORD *)(v2 + 112))
  {
    if (!v3)
    {
      if (!*(_DWORD *)(v2 + 160)) {
        goto LABEL_29;
      }
      goto LABEL_17;
    }
LABEL_5:
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
        || (v4 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v4))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    _AirPlayReceiverUI_CleanupPresentation(v2, 0, 0);
    uint64_t v2 = *(void *)(a1 + 32);
    if (!*(_DWORD *)(v2 + 112)) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  if (v3) {
    goto LABEL_5;
  }
LABEL_12:
  if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
      || (v5 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v5))
    {
      LogPrintF();
      uint64_t v2 = *(void *)(a1 + 32);
    }
  }
  *(void *)(v2 + 104) = 0;
  *(_DWORD *)(v2 + 112) = 0;
LABEL_17:
  if (*(_DWORD *)(v2 + 160))
  {
    if (*(unsigned char *)(v2 + 176))
    {
      v6 = *(uint64_t ***)(v2 + 48);
      if (v6)
      {
        do
        {
          ((void (*)(const char *, void, uint64_t *))v6[2])("stopPlayingOverP2P", 0, v6[3]);
          v6 = (uint64_t **)*v6;
        }
        while (v6);
        uint64_t v2 = *(void *)(a1 + 32);
      }
      *(unsigned char *)(v2 + 176) = 0;
    }
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50)
    {
      if (gLogCategory_AirPlayReceiverUIXPCServerCore != -1
        || (v7 = _LogCategory_Initialize(), uint64_t v2 = *(void *)(a1 + 32), v7))
      {
        LogPrintF();
        uint64_t v2 = *(void *)(a1 + 32);
      }
    }
    *(void *)(v2 + 152) = 0;
    *(_DWORD *)(v2 + 160) = 0;
    *(unsigned char *)(v2 + 164) = 0;
    *(void *)(v2 + 168) = 0;
    uint64_t v2 = *(void *)(a1 + 32);
  }
  _AirPlayReceiverUI_ActiveSessionsStopped(v2);
  uint64_t v2 = *(void *)(a1 + 32);
LABEL_29:
  v8 = *(uint64_t ***)(v2 + 48);
  if (v8)
  {
    do
    {
      ((void (*)(const char *, void, uint64_t *))v8[2])("serverDied", 0, v8[3]);
      v8 = (uint64_t **)*v8;
    }
    while (v8);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  v9 = *(NSObject **)v2;

  dispatch_release(v9);
}

void ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke(void *a1)
{
  if (*(unsigned char *)(a1[8] + 24)) {
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
  if (*(_DWORD *)(*(void *)(a1[6] + 8) + 24))
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 50
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v2 = a1[5];
    dispatch_semaphore_signal(v2);
  }
  else
  {
    if (gLogCategory_AirPlayReceiverUIXPCServerCore <= 30
      && (gLogCategory_AirPlayReceiverUIXPCServerCore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v3 = a1[8];
    int v4 = *(_xpc_connection_s **)(v3 + 32);
    int v5 = *(NSObject **)v3;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke_2;
    handler[3] = &unk_264895728;
    uint64_t v6 = a1[7];
    int v7 = (void *)a1[4];
    handler[4] = a1[5];
    void handler[5] = v6;
    xpc_connection_send_message_with_reply(v4, v7, v5, handler);
    *(_DWORD *)(*(void *)(a1[6] + 8) + 24) = 0;
  }
}

intptr_t ___AirPlayReceiverUI_SendMessageWithReplySync_block_invoke_2(uint64_t a1, xpc_object_t object)
{
  xpc_retain(object);
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = object;
  int v4 = *(NSObject **)(a1 + 32);

  return dispatch_semaphore_signal(v4);
}

uint64_t ___AirPlayReceiverUI_HandleErrorEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleFailedURLRequest_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleMetaDataEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

void ___AirPlayReceiverUI_HandleAudioStop_block_invoke(uint64_t a1)
{
  _AirPlayReceiverUI_NotifyObserversF(*(void *)(a1 + 32), (uint64_t)"stopAudio", (uint64_t)"{%kO=%i}");
  uint64_t v2 = **(NSObject ***)(a1 + 32);

  dispatch_release(v2);
}

void ___AirPlayReceiverUI_HandleUserEvent_block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "postNotificationName:object:", *(void *)(a1 + 32), 0);
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = *(void (**)(void, void))(v2 + 184);
    if (v3) {
      v3(*(void *)(v2 + 192), *(void *)(a1 + 40));
    }
  }
  if (*(unsigned char *)(a1 + 56))
  {
    if (AirPlayReceiverUI_GetShared_once != -1) {
      dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
    }
    for (i = *(uint64_t ***)(AirPlayReceiverUI_GetShared_ui + 48); i; i = (uint64_t **)*i)
      ((void (*)(const char *, void, uint64_t *))i[2])("userStop", 0, i[3]);
  }
}

uint64_t ___AirPlayReceiverUI_HandleDateRangeEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

void ___AirPlayReceiverUI_HandleFPSSecureStopGenerated_block_invoke(uint64_t a1)
{
  if (AirPlayReceiverUI_GetShared_once != -1) {
    dispatch_once(&AirPlayReceiverUI_GetShared_once, &__block_literal_global_2818);
  }
  uint64_t v2 = *(const void **)(a1 + 32);
  uint64_t v3 = *(uint64_t ***)(AirPlayReceiverUI_GetShared_ui + 48);
  if (v3)
  {
    do
    {
      ((void (*)(const char *, const void *, uint64_t *))v3[2])("FPSSecureStopGenerated", v2, v3[3]);
      uint64_t v3 = (uint64_t **)*v3;
    }
    while (v3);
    uint64_t v2 = *(const void **)(a1 + 32);
  }
  if (v2)
  {
    CFRelease(v2);
  }
}

uint64_t ___AirPlayReceiverUI_HandleOtherEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

uint64_t ___AirPlayReceiverUI_HandlePlaylistEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

uint64_t ___AirPlayReceiverUI_HandleStateEvent_block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  uint64_t v2 = *(uint64_t (**)(void, void))(v1 + 184);
  if (v2) {
    return v2(*(void *)(v1 + 192), *(void *)(result + 32));
  }
  return result;
}

@end