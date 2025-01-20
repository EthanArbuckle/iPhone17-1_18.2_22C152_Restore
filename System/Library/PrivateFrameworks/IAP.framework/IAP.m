_xpc_connection_s *IAPAppConnectedAccessories()
{
  xpc_object_t v0;
  BOOL v1;
  BOOL v2;
  _xpc_connection_s *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const void *data;
  uint64_t v8;
  _xpc_connection_s *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  id v20;
  size_t length;

  v0 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v0, "requestType", "IAPAppConnectedAccessories");
  NSLog(&cfstr_Iapappconnecte.isa, __eaClientHasCheckedForConnectedAccessories, 1);
  __eaClientHasCheckedForConnectedAccessories = 1;
  v1 = IAPDHasLaunched();
  v2 = IAP2DHasLaunched();
  NSLog(&cfstr_Iapappconnecte_0.isa, v1, v2);
  v3 = 0;
  if (IAPDHasLaunched())
  {
    v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    xpc_dictionary_set_uint64(v0, "eaClientID", __eaClientIDiapd);
    if (v3)
    {
      v4 = _IAPSendXPCMessageWithTimeout(v3, v0, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v4)
      {
        v5 = (void *)v4;
        xpc_release(v3);
        v6 = MEMORY[0x1BA9F0E70](v5);
        if (v5 == (void *)MEMORY[0x1E4F14528] && v6 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 637);
        }
        else if (v5 == (void *)MEMORY[0x1E4F14520] && v6 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 641);
        }
        else if (v6 == MEMORY[0x1E4F14590])
        {
          length = 0;
          data = xpc_dictionary_get_data(v5, "plistData", &length);
          v3 = 0;
          if (!data || !length) {
            goto LABEL_21;
          }
          v8 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
          if (v8)
          {
            v20 = 0;
            v3 = (_xpc_connection_s *)[MEMORY[0x1E4F28F98] propertyListWithData:v8 options:0 format:0 error:&v20];
            if (!v3) {
              NSLog(&cfstr_ErrorReceivedB.isa, [v20 description]);
            }
            goto LABEL_21;
          }
        }
        else if (v6 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppConnectedAccessories", 668);
        }
        else
        {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppConnectedAccessories", 672, v6);
        }
        v3 = 0;
LABEL_21:
        xpc_release(v5);
        goto LABEL_22;
      }
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppConnectedAccessories", 628);
      xpc_release(v3);
      v3 = 0;
    }
  }
LABEL_22:
  if (IAP2DHasLaunched())
  {
    v9 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
    xpc_dictionary_set_uint64(v0, "eaClientID", __eaClientIDiap2d);
    if (v9)
    {
      v10 = _IAPSendXPCMessageWithTimeout(v9, v0, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v10)
      {
        v11 = (void *)v10;
        xpc_release(v9);
        v12 = MEMORY[0x1BA9F0E70](v11);
        if (v11 == (void *)MEMORY[0x1E4F14528] && v12 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 699);
        }
        else if (v11 == (void *)MEMORY[0x1E4F14520] && v12 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppConnectedAccessories", 703);
        }
        else if (v12 == MEMORY[0x1E4F14590])
        {
          length = 0;
          v13 = xpc_dictionary_get_data(v11, "plistData", &length);
          if (v13)
          {
            if (length)
            {
              v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v13);
              if (v14)
              {
                v20 = 0;
                v15 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v20];
                if (v15)
                {
                  v16 = v15;
                  if (!v3) {
                    v3 = (_xpc_connection_s *)[MEMORY[0x1E4F1CA48] array];
                  }
                  [(_xpc_connection_s *)v3 addObjectsFromArray:v16];
                }
                else
                {
                  NSLog(&cfstr_ErrorReceivedB_0.isa, [v20 description], v18, v19);
                }
              }
            }
          }
        }
        else if (v12 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppConnectedAccessories", 740, v19);
        }
        else
        {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppConnectedAccessories", 744, v12);
        }
      }
      else
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppConnectedAccessories", 690);
        v11 = v9;
      }
      xpc_release(v11);
    }
  }
  xpc_release(v0);
  return v3;
}

uint64_t IAPAppRegisterClient(uint64_t a1)
{
  int v1 = a1;
  __dst[128] = *MEMORY[0x1E4F143B8];
  NSLog(&cfstr_Iapappregister.isa, a1);
  pthread_mutex_lock(&__eaClientPortLock);
  if ((__eaClientRegisterediapd & 1) == 0)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__iapdServerLaunched, @"kIAPServerLaunchedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    LocalCenter = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(LocalCenter, 0, (CFNotificationCallback)__iapdServerDied, @"kIAPDServerDiedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  if ((__eaClientRegisterediap2d & 1) == 0)
  {
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, 0, (CFNotificationCallback)__iap2dServerLaunched, @"kIAP2ServerLaunchedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = CFNotificationCenterGetLocalCenter();
    CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)__iap2dServerDied, @"kIAP2ServerDiedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  NSLog(&cfstr_Iapappregister_0.isa, __eaClientRegisterediapd, 1);
  __eaClientRegisterediapd = 1;
  NSLog(&cfstr_Iapappregister_1.isa, __eaClientRegisterediap2d, 1);
  __eaClientRegisterediap2d = 1;
  __eaClientCapabilities = v1;
  if ((v1 & 0x200) != 0) {
    uint64_t v6 = [NSString stringWithCString:getprogname() encoding:4];
  }
  else {
    uint64_t v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  }
  v7 = (void *)v6;
  memset((char *)__dst + 1, 170, 0x3FFuLL);
  LOBYTE(__dst[0]) = 0;
  if (v7 && (unint64_t)[v7 lengthOfBytesUsingEncoding:4] <= 0x3FF) {
    strlcpy((char *)__dst, (const char *)[v7 cStringUsingEncoding:4], 0x400uLL);
  }
  uint64_t v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "objectForInfoDictionaryKey:", @"UISupportedExternalAccessoryProtocols");
  if (v8 && (uint64_t v9 = v8, objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    v10 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:v9 format:100 options:0 error:0];
  }
  else {
    v10 = 0;
  }
  xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, "requestType", "IAPAppRegisterClient");
  xpc_dictionary_set_uint64(v11, "eaClientCapabilities", __eaClientCapabilities);
  xpc_dictionary_set_string(v11, "eaClientBundleID", (const char *)__dst);
  xpc_dictionary_set_uint64(v11, "eaClientID", __eaClientIDiapd);
  xpc_dictionary_set_BOOL(v11, "eaClientHasCheckedForConnectedAccessories", __eaClientHasCheckedForConnectedAccessories);
  if (v10) {
    xpc_dictionary_set_data(v11, "eaClientSupportedProtocols", (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  uint64_t v12 = __eaiapdHasClientID;
  BOOL v13 = IAPDHasLaunched();
  NSLog(&cfstr_Iapappregister_2.isa, v12, v13);
  if ((__eaiapdHasClientID & 1) == 0 && IAPDHasLaunched())
  {
    v14 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v14)
    {
      v15 = v14;
      uint64_t v16 = _IAPSendXPCMessageWithTimeout(v14, v11, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v16)
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppRegisterClient", 515);
        uint64_t v19 = 0;
LABEL_51:
        xpc_release(v15);
        goto LABEL_25;
      }
      v17 = (void *)v16;
      uint64_t v18 = MEMORY[0x1BA9F0E70]();
      if (v17 == (void *)MEMORY[0x1E4F14528] && v18 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 491, __dst[0]);
      }
      else if (v17 == (void *)MEMORY[0x1E4F14520] && v18 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 495, __dst[0]);
      }
      else
      {
        if (v18 == MEMORY[0x1E4F14590])
        {
          __eaClientIDiapd = xpc_dictionary_get_uint64(v17, "eaClientID");
          uint64_t v19 = 1;
          __eaiapdHasClientID = 1;
LABEL_50:
          xpc_release(v17);
          goto LABEL_51;
        }
        if (v18 == MEMORY[0x1E4F145A8]) {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppRegisterClient", 505, v28, __dst[0]);
        }
        else {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppRegisterClient", 509, v18, __dst[0]);
        }
      }
      uint64_t v19 = 0;
      goto LABEL_50;
    }
  }
  uint64_t v19 = 0;
LABEL_25:
  uint64_t v20 = __eaiap2dHasClientID;
  BOOL v21 = IAP2DHasLaunched();
  NSLog(&cfstr_Iapappregister_4.isa, v20, v21);
  if ((__eaiap2dHasClientID & 1) == 0 && IAP2DHasLaunched())
  {
    v22 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
    if (v22)
    {
      v23 = v22;
      xpc_dictionary_set_uint64(v11, "eaClientID", __eaClientIDiap2d);
      uint64_t v24 = _IAPSendXPCMessageWithTimeout(v23, v11, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (v24)
      {
        v25 = (void *)v24;
        uint64_t v26 = MEMORY[0x1BA9F0E70]();
        if (v25 == (void *)MEMORY[0x1E4F14528] && v26 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 539);
        }
        else if (v25 == (void *)MEMORY[0x1E4F14520] && v26 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppRegisterClient", 543);
        }
        else if (v26 == MEMORY[0x1E4F14590])
        {
          __eaClientIDiap2d = xpc_dictionary_get_uint64(v25, "eaClientID");
          uint64_t v19 = 1;
          __eaiap2dHasClientID = 1;
        }
        else if (v26 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppRegisterClient", 553, v28);
        }
        else
        {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppRegisterClient", 557, v26);
        }
        xpc_release(v25);
      }
      else
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppRegisterClient", 563);
      }
      xpc_release(v23);
    }
  }
  xpc_release(v11);
  pthread_mutex_unlock(&__eaClientPortLock);
  NSLog(&cfstr_Iapappregister_5.isa, v19);
  return v19;
}

BOOL IAPDHasLaunched()
{
  int out_token = 0;
  uint64_t state64 = 0;
  BOOL v0 = 0;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      uint64_t v1 = IAPDHasLaunched::_oldIapdAvailableState;
      if (IAPDHasLaunched::_oldIapdAvailableState != state64)
      {
        NSLog(&cfstr_Iapdhaslaunche.isa, IAPDHasLaunched::_oldIapdAvailableState, state64);
        uint64_t v1 = state64;
        IAPDHasLaunched::_oldIapdAvailableState = state64;
      }
      BOOL v0 = v1 != 0;
    }
    else
    {
      BOOL v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IAP2DHasLaunched()
{
  int out_token = 0;
  uint64_t state64 = 0;
  BOOL v0 = 0;
  if (!notify_register_check("com.apple.iap2d.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      uint64_t v1 = IAP2DHasLaunched::_oldIap2dAvailableState;
      if (IAP2DHasLaunched::_oldIap2dAvailableState != state64)
      {
        NSLog(&cfstr_Iap2dhaslaunch.isa, IAP2DHasLaunched::_oldIap2dAvailableState, state64);
        uint64_t v1 = state64;
        IAP2DHasLaunched::_oldIap2dAvailableState = state64;
      }
      BOOL v0 = v1 != 0;
    }
    else
    {
      BOOL v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

uint64_t IAPLocationDeactivate()
{
  pthread_mutex_lock(&__isLocationActivatedLock);
  if (__isLocationActivated == 1) {
    __isLocationActivated = 0;
  }
  pthread_mutex_unlock(&__isLocationActivatedLock);
  unsigned int ClientIDForIAPD = IAPAppGetClientIDForIAPD();
  if (ClientIDForIAPD)
  {
    unsigned int v1 = ClientIDForIAPD;
    v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v2)
    {
      v3 = v2;
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "clientID", v1);
      xpc_dictionary_set_string(v4, "requestType", "IAPLocationDeactivate");
      xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = MEMORY[0x1BA9F0E70]();
        if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationIaploc.isa);
        }
        else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationIaploc_0.isa);
        }
        else if (v7 == MEMORY[0x1E4F14590])
        {
          if (!xpc_dictionary_get_BOOL(v6, "result")) {
            NSLog(&cfstr_LocationErrorS.isa, "IAPLocationDeactivate");
          }
        }
        else if (v7 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationDeactivate", 122);
        }
        else
        {
          NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationDeactivate", 126, v7);
        }
        xpc_release(v6);
      }
      else
      {
        NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationDeactivate", 132);
      }
      xpc_release(v4);
      xpc_release(v3);
    }
    else
    {
      NSLog(&cfstr_LocationSkipIa_1.isa);
    }
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_2.isa);
  }
  return 1;
}

uint64_t IAPLocationActivate()
{
  pthread_mutex_lock(&__isLocationActivatedLock);
  if ((__isLocationActivated & 1) == 0) {
    __isLocationActivated = 1;
  }
  pthread_mutex_unlock(&__isLocationActivatedLock);
  unsigned int ClientIDForIAPD = IAPAppGetClientIDForIAPD();
  if (ClientIDForIAPD)
  {
    unsigned int v1 = ClientIDForIAPD;
    v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (v2)
    {
      v3 = v2;
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "clientID", v1);
      xpc_dictionary_set_string(v4, "requestType", "IAPLocationActivate");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
      xpc_release(v3);
    }
    else
    {
      NSLog(&cfstr_LocationSkipIa.isa);
    }
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_0.isa);
  }
  return 1;
}

uint64_t IAPAppGetClientIDForIAPD()
{
  pthread_mutex_lock(&__eaClientPortLock);
  uint64_t v0 = __eaClientIDiapd;
  pthread_mutex_unlock(&__eaClientPortLock);
  return v0;
}

void *IAPRegisterEAAuthGetters(void *result, void *a2)
{
  _eaAuthDataGetter = result;
  _eaAuthSerialStringGetter = a2;
  return result;
}

uint64_t IAPAppSendXPCMessageReplyWithTimeout(_xpc_connection_s *a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  return _IAPSendXPCMessageReplyWithTimeout(a1, a2, a4, a3, a5);
}

uint64_t IAPAppSendDebugCommand(unsigned int a1, void *a2, uint64_t *a3)
{
  size_t length = 0;
  if (a3) {
    *a3 = 0;
  }
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v6, "requestType", "kXPCIAPAppSendDebugCommand");
  xpc_dictionary_set_uint64(v6, "kXPCIAPAppDebugCommandType", a1);
  xpc_dictionary_set_data(v6, "kXPCIAPAppDebugCommandData", (const void *)[a2 bytes], objc_msgSend(a2, "length"));
  uint64_t v7 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = _IAPSendXPCMessageWithTimeout(v7, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppSendDebugCommand", 351);
      uint64_t v12 = 0;
LABEL_23:
      xpc_release(v8);
      goto LABEL_24;
    }
    v10 = (void *)v9;
    uint64_t v11 = MEMORY[0x1BA9F0E70]();
    if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendDebugCommand", 320);
    }
    else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendDebugCommand", 324);
    }
    else
    {
      if (v11 == MEMORY[0x1E4F14590])
      {
        data = xpc_dictionary_get_data(v10, "kXPCIAPAppDebugCommandData", &length);
        uint64_t v12 = 1;
        if (data)
        {
          if (length)
          {
            uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
            if (a3) {
              *a3 = v14;
            }
          }
        }
        goto LABEL_22;
      }
      if (v11 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppSendDebugCommand", 341);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppSendDebugCommand", 345, v11);
      }
    }
    uint64_t v12 = 0;
LABEL_22:
    xpc_release(v10);
    goto LABEL_23;
  }
  NSLog(&cfstr_ErrorSNoConnec.isa, "IAPAppSendDebugCommand");
  uint64_t v12 = 0;
LABEL_24:
  xpc_release(v6);
  return v12;
}

BOOL IAPAppToAppSocketPath(int a1, int a2, char *__str)
{
  if (__str) {
    snprintf(__str, 0x100uLL, "%s/ea.%u.%u", "/var/mobile/Library/ExternalAccessory", a1, a2);
  }
  else {
    NSLog(&cfstr_ErrorSSDErrorP.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppToAppSocketPath", 371);
  }
  return __str != 0;
}

BOOL IAPAppToAppFifoPath(int a1, int a2, char *__str)
{
  if (__str) {
    snprintf(__str, 0x100uLL, "%s/ea.%d.%d.out", "/var/mobile/Library/ExternalAccessory", a1, a2);
  }
  else {
    NSLog(&cfstr_ErrorSSDErrorP.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppToAppFifoPath", 384);
  }
  return __str != 0;
}

BOOL IAPAppFromAppFifoPath(int a1, int a2, char *__str)
{
  if (__str) {
    snprintf(__str, 0x100uLL, "%s/ea.%d.%d.in", "/var/mobile/Library/ExternalAccessory", a1, a2);
  }
  else {
    NSLog(&cfstr_SSDErrorPathIs.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppFromAppFifoPath", 397);
  }
  return __str != 0;
}

uint64_t __iapdServerLaunched(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  if (_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken != -1) {
    dispatch_once(&_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken, &__block_literal_global_346);
  }
  int out_token = 0;
  uint64_t result = notify_register_check("com.apple.iapd.notify.availability", &out_token);
  if (!result)
  {
    uint64_t state64 = 1;
    notify_get_state(out_token, &state64);
    if (!state64)
    {
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.iapd.notify.availability");
    }
    uint64_t result = notify_cancel(out_token);
  }
  if (__eaClientRegisterediapd == 1)
  {
    IAPAppRegisterClient(__eaClientCapabilities);
    char v6 = 0;
    uint64_t result = IAPLocationIsActivated(&v6);
    if (v6) {
      return IAPLocationActivate();
    }
  }
  return result;
}

uint64_t __iapdServerDied(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  pthread_mutex_lock(&__eaClientPortLock);
  __eaiapdHasClientID = 0;
  __eaClientIDiapd = 0;
  pthread_mutex_unlock(&__eaClientPortLock);
  xpc_object_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v5 postNotificationName:@"IAPAppMigServerDiedNotification" object:0 userInfo:0];
}

uint64_t __iap2dServerLaunched(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  if (_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken != -1) {
    dispatch_once(&_InitIAPAppSendXPCMessageDefaultTimeoutMs(void)::onceToken, &__block_literal_global_346);
  }
  int out_token = 0;
  uint64_t result = notify_register_check("com.apple.iap2d.notify.availability", &out_token);
  if (!result)
  {
    uint64_t state64 = 1;
    notify_get_state(out_token, &state64);
    if (!state64)
    {
      notify_set_state(out_token, 1uLL);
      notify_post("com.apple.iapd.notify.availability");
    }
    uint64_t result = notify_cancel(out_token);
  }
  if (__eaClientRegisterediap2d == 1)
  {
    IAPAppRegisterClient(__eaClientCapabilities);
    char v6 = 0;
    uint64_t result = IAPLocationIsActivated(&v6);
    if (v6) {
      return IAPLocationActivate();
    }
  }
  return result;
}

uint64_t __iap2dServerDied(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  pthread_mutex_lock(&__eaClientPortLock);
  __eaiap2dHasClientID = 0;
  __eaClientIDiap2d = 0;
  pthread_mutex_unlock(&__eaClientPortLock);
  xpc_object_t v5 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  return [v5 postNotificationName:@"IAPAppMigServerDiedNotification" object:0 userInfo:0];
}

uint64_t IAPAppGetClientIDForIAP2D()
{
  pthread_mutex_lock(&__eaClientPortLock);
  uint64_t v0 = __eaClientIDiap2d;
  pthread_mutex_unlock(&__eaClientPortLock);
  return v0;
}

BOOL IAPAppCreateSessionForAccessory(unsigned int a1, unsigned int a2, _DWORD *a3)
{
  int v16 = 2;
  char v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v16);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppCreateSessionForAccessory");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    if (v16)
    {
      if (v16 != 1) {
        goto LABEL_8;
      }
      uint64_t v9 = &__eaClientIDiap2d;
    }
    else
    {
      uint64_t v9 = &__eaClientIDiapd;
    }
    xpc_dictionary_set_uint64(v8, "eaClientID", *v9);
LABEL_8:
    uint64_t v11 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v11)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppCreateSessionForAccessory", 810);
      BOOL v10 = 0;
LABEL_23:
      xpc_release(v8);
      xpc_release(v7);
      return v10;
    }
    uint64_t v12 = (void *)v11;
    uint64_t v13 = MEMORY[0x1BA9F0E70]();
    if (v12 == (void *)MEMORY[0x1E4F14528] && v13 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 785);
    }
    else if (v12 == (void *)MEMORY[0x1E4F14520] && v13 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 789);
    }
    else
    {
      if (v13 == MEMORY[0x1E4F14590])
      {
        int uint64 = xpc_dictionary_get_uint64(v12, "eaSessionID");
        *a3 = uint64;
        BOOL v10 = uint64 != 0x10000;
LABEL_22:
        xpc_release(v12);
        goto LABEL_23;
      }
      if (v13 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppCreateSessionForAccessory", 800);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppCreateSessionForAccessory", 804, v13);
      }
    }
    BOOL v10 = 0;
    goto LABEL_22;
  }
  NSLog(&cfstr_SSDConnectionH.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCreateSessionForAccessory", 816, 0);
  return 0;
}

BOOL IAPAppOpenSessionFromAppToAccessory(unsigned int a1, unsigned int a2, unsigned int a3)
{
  int v14 = 2;
  char v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppOpenSessionFromAppToAccessory");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    xpc_dictionary_set_uint64(v8, "eaSessionID", a3);
    uint64_t v9 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppOpenSessionFromAppToAccessory", 865);
      BOOL v12 = 0;
LABEL_18:
      xpc_release(v8);
      xpc_release(v7);
      return v12;
    }
    BOOL v10 = (void *)v9;
    uint64_t v11 = MEMORY[0x1BA9F0E70]();
    if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 843);
    }
    else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 847);
    }
    else
    {
      if (v11 == MEMORY[0x1E4F14590])
      {
        BOOL v12 = xpc_dictionary_get_BOOL(v10, "openWasSuccessful");
LABEL_17:
        xpc_release(v10);
        goto LABEL_18;
      }
      if (v11 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppOpenSessionFromAppToAccessory", 855);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppOpenSessionFromAppToAccessory", 859, v11);
      }
    }
    BOOL v12 = 0;
    goto LABEL_17;
  }
  NSLog(&cfstr_SSDConnectionH.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAppToAccessory", 871, 0);
  return 0;
}

BOOL IAPAppOpenSessionFromAccessoryToApp(unsigned int a1, unsigned int a2, unsigned int a3)
{
  int v14 = 2;
  char v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPAppOpenSessionFromAccessoryToApp");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "eaProtocolID", a2);
    xpc_dictionary_set_uint64(v8, "eaSessionID", a3);
    uint64_t v9 = _IAPSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppOpenSessionFromAccessoryToApp", 920);
      BOOL v12 = 0;
LABEL_18:
      xpc_release(v8);
      xpc_release(v7);
      return v12;
    }
    BOOL v10 = (void *)v9;
    uint64_t v11 = MEMORY[0x1BA9F0E70]();
    if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 898);
    }
    else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 902);
    }
    else
    {
      if (v11 == MEMORY[0x1E4F14590])
      {
        BOOL v12 = xpc_dictionary_get_BOOL(v10, "openWasSuccessful");
LABEL_17:
        xpc_release(v10);
        goto LABEL_18;
      }
      if (v11 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppOpenSessionFromAccessoryToApp", 910);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppOpenSessionFromAccessoryToApp", 914, v11);
      }
    }
    BOOL v12 = 0;
    goto LABEL_17;
  }
  NSLog(&cfstr_SSDConnectionH.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppOpenSessionFromAccessoryToApp", 926, 0);
  return 0;
}

BOOL IAPAppCloseSessionToAccessory(unsigned int a1, unsigned int a2)
{
  int v12 = 2;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v12);
  if (v4)
  {
    xpc_object_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPAppCloseSessionToAccessory");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_uint64(v6, "eaSessionID", a2);
    uint64_t v7 = _IAPSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v7)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppCloseSessionToAccessory", 975);
      BOOL v10 = 0;
LABEL_18:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    xpc_object_t v8 = (void *)v7;
    uint64_t v9 = MEMORY[0x1BA9F0E70]();
    if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 953);
    }
    else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 957);
    }
    else
    {
      if (v9 == MEMORY[0x1E4F14590])
      {
        BOOL v10 = xpc_dictionary_get_BOOL(v8, "closeWasSuccessful");
LABEL_17:
        xpc_release(v8);
        goto LABEL_18;
      }
      if (v9 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppCloseSessionToAccessory", 965);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppCloseSessionToAccessory", 969, v9);
      }
    }
    BOOL v10 = 0;
    goto LABEL_17;
  }
  NSLog(&cfstr_SSDConnectionH.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppCloseSessionToAccessory", 981, 0);
  return 0;
}

void IAPAppStartAccessibility()
{
}

void __IAPAppStartAccessibility_block_invoke()
{
  if ((__eaClientCapabilities & 2) != 0 && !__eaClientListener && __eaClientListenerQueue == 0)
  {
    __eaClientListenerQueue = (uint64_t)dispatch_queue_create("IAPAppListenerQueue", 0);
    unsigned int v1 = (const char *)[@"com.apple.VoiceOverTouch.xpc" UTF8String];
    mach_service = xpc_connection_create_mach_service(v1, (dispatch_queue_t)__eaClientListenerQueue, 1uLL);
    __eaClientListener = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_326);
      v3 = (_xpc_connection_s *)__eaClientListener;
      xpc_connection_resume(v3);
    }
    else
    {
      NSLog(&cfstr_ErrorSSDIapapp.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppStartAccessibility_block_invoke", 1009);
    }
  }
}

void __IAPAppStartAccessibility_block_invoke_2(uint64_t a1, _xpc_connection_s *a2)
{
  v3 = __eaClientListenerQueue;
  if (MEMORY[0x1BA9F0E70](a2) == MEMORY[0x1E4F14578])
  {
    xpc_connection_set_target_queue(a2, v3);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = ___ZL28_xpc_handle_outgoing_requestPU24objcproto13OS_xpc_object8NSObjectPU28objcproto17OS_dispatch_queueS__block_invoke;
    handler[3] = &unk_1E62277A0;
    handler[4] = a2;
    xpc_connection_set_event_handler(a2, handler);
    xpc_connection_resume(a2);
  }
  else
  {
    NSLog(&cfstr_SSDErrorXpcHan.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request", 1378);
  }
}

void IAPAppStopAccessibility()
{
}

void __IAPAppStopAccessibility_block_invoke()
{
  if (__eaClientListener)
  {
    xpc_release((xpc_object_t)__eaClientListener);
    __eaClientListener = 0;
  }
  if (__eaClientListenerQueue)
  {
    dispatch_release((dispatch_object_t)__eaClientListenerQueue);
    __eaClientListenerQueue = 0;
  }
}

BOOL IAPAppSendAccessibilityResponse(unsigned int a1, uint64_t a2)
{
  int v14 = 2;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v14);
  xpc_object_t v5 = v4;
  if (a2 && v4)
  {
    xpc_object_t v6 = (void *)MEMORY[0x1BA9F0A70]();
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v7, "requestType", "IAPAppAccessibilityResponse");
    xpc_dictionary_set_uint64(v7, "connectionID", a1);
    xpc_object_t v8 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];
    if (v8) {
      xpc_dictionary_set_data(v7, "userInfo", (const void *)[v8 bytes], objc_msgSend(v8, "length"));
    }
    uint64_t v9 = _IAPSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v9)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppSendAccessibilityResponse", 1085);
      BOOL v12 = 0;
LABEL_22:
      xpc_release(v7);
      goto LABEL_23;
    }
    BOOL v10 = (void *)v9;
    uint64_t v11 = MEMORY[0x1BA9F0E70]();
    if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendAccessibilityResponse", 1063);
    }
    else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendAccessibilityResponse", 1067);
    }
    else
    {
      if (v11 == MEMORY[0x1E4F14590])
      {
        BOOL v12 = xpc_dictionary_get_BOOL(v10, "sendWasSuccessful");
LABEL_21:
        xpc_release(v10);
        goto LABEL_22;
      }
      if (v11 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppSendAccessibilityResponse", 1075);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppSendAccessibilityResponse", 1079, v11);
      }
    }
    BOOL v12 = 0;
    goto LABEL_21;
  }
  BOOL v12 = 0;
  BOOL result = 0;
  if (v5)
  {
LABEL_23:
    xpc_release(v5);
    return v12;
  }
  return result;
}

BOOL IAPAppSendPointOfInterestInformation(unsigned int a1, void *a2, void *a3)
{
  int v15 = 2;
  xpc_object_t v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v15);
  xpc_object_t v7 = v6;
  if (a2 && a3 && v6)
  {
    xpc_object_t v8 = (void *)MEMORY[0x1BA9F0A70]();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "IAPDestinationtInformation");
    xpc_dictionary_set_uint64(v9, "connectionID", a1);
    xpc_dictionary_set_data(v9, "IAPDestinationtInformationIdentifierStr", (const void *)objc_msgSend((id)objc_msgSend(a3, "dataUsingEncoding:", 4), "bytes"), objc_msgSend(a3, "lengthOfBytesUsingEncoding:", 4));
    xpc_dictionary_set_data(v9, "IAPDestinationInformationParametersStr", (const void *)[a2 bytes], objc_msgSend(a2, "length"));
    uint64_t v10 = _IAPSendXPCMessageWithTimeout(v7, v9, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v10)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppSendPointOfInterestInformation", 1144);
      BOOL v13 = 0;
LABEL_21:
      xpc_release(v9);
      goto LABEL_22;
    }
    uint64_t v11 = (void *)v10;
    uint64_t v12 = MEMORY[0x1BA9F0E70]();
    if (v11 == (void *)MEMORY[0x1E4F14528] && v12 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendPointOfInterestInformation", 1122);
    }
    else if (v11 == (void *)MEMORY[0x1E4F14520] && v12 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppSendPointOfInterestInformation", 1126);
    }
    else
    {
      if (v12 == MEMORY[0x1E4F14590])
      {
        BOOL v13 = xpc_dictionary_get_BOOL(v11, "sendWasSuccessful");
LABEL_20:
        xpc_release(v11);
        goto LABEL_21;
      }
      if (v12 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppSendPointOfInterestInformation", 1134);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppSendPointOfInterestInformation", 1138, v12);
      }
    }
    BOOL v13 = 0;
    goto LABEL_20;
  }
  BOOL v13 = 0;
  BOOL result = 0;
  if (v7)
  {
LABEL_22:
    xpc_release(v7);
    return v13;
  }
  return result;
}

void IAPAppBeginOOBBTPairingForConnection(unsigned int a1)
{
  int v6 = 2;
  v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v6);
  if (v2)
  {
    v3 = v2;
    xpc_object_t v4 = (void *)MEMORY[0x1BA9F0A70]();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPAppBeginOOBPairingStr");
    xpc_dictionary_set_uint64(v5, "connectionID", a1);
    xpc_connection_send_message(v3, v5);
    xpc_release(v5);
    xpc_release(v3);
  }
}

void IAPAppNotifyAppOfSessionClose(int a1, int a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __IAPAppNotifyAppOfSessionClose_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  int v3 = a2;
  int v4 = a1;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __IAPAppNotifyAppOfSessionClose_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1BA9F0A70]();
  EAAccessoryManager = (uint64_t (*)(void))__GetEAAccessoryManager();
  if (EAAccessoryManager) {
    EAAccessoryManager = (uint64_t (*)(void))EAAccessoryManager();
  }
  [EAAccessoryManager endSession:*(unsigned int *)(a1 + 32) forConnectionID:*(unsigned int *)(a1 + 36)];
}

void *__GetEAAccessoryManager(void)
{
  BOOL result = (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
  if (!__GetEAAccessoryManager(void)::_GetEAAccesoryManager)
  {
    unsigned int v1 = (void *)[(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory"];
    v2 = dlopen((const char *)[v1 fileSystemRepresentation], 1);
    __GetEAAccessoryManager(void)::eaHandle = (uint64_t)v2;
    if (v2)
    {
      BOOL result = dlsym(v2, "GetEAAccesoryManager");
      __GetEAAccessoryManager(void)::_GetEAAccesoryManager = (uint64_t)result;
      if (result) {
        return result;
      }
      goto LABEL_4;
    }
    NSLog(&cfstr_ErrorCouldNotL.isa, v1);
    BOOL result = (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
    if (!__GetEAAccessoryManager(void)::_GetEAAccesoryManager)
    {
LABEL_4:
      NSLog(&cfstr_ErrorCouldNotL_0.isa);
      return (void *)__GetEAAccessoryManager(void)::_GetEAAccesoryManager;
    }
  }
  return result;
}

uint64_t IAPAppProcessIDIsUsingAccessory(const __CFString *a1)
{
  if (a1)
  {
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPAppProcessIDIsUsingAccessory");
    CFIndex Length = CFStringGetLength(a1);
    int v4 = (char *)malloc_type_malloc(Length + 1, 0xAB168C1uLL);
    if (v4)
    {
      xpc_object_t v5 = v4;
      CFIndex v6 = CFStringGetLength(a1);
      CFStringGetCString(a1, v5, v6 + 1, 0x8000100u);
      xpc_dictionary_set_string(v2, "displayIdentifier", v5);
      free(v5);
    }
    else
    {
      CStringPtr = CFStringGetCStringPtr(a1, 0x8000100u);
      NSLog(&cfstr_SSDErrorCanTCh.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1401, CStringPtr);
    }
    if (!IAPDHasLaunched()) {
      goto LABEL_24;
    }
    xpc_object_t v9 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
    if (!v9) {
      goto LABEL_24;
    }
    uint64_t v10 = v9;
    uint64_t v11 = _IAPSendXPCMessageWithTimeout(v9, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      uint64_t v13 = MEMORY[0x1BA9F0E70]();
      if (v12 == (void *)MEMORY[0x1E4F14528] && v13 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1416);
      }
      else if (v12 == (void *)MEMORY[0x1E4F14520] && v13 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1420);
      }
      else
      {
        if (v13 == MEMORY[0x1E4F14590])
        {
          BOOL v14 = xpc_dictionary_get_BOOL(v12, "processAllowedByIAPD");
          xpc_release(v12);
          xpc_release(v10);
          if (v14)
          {
            uint64_t v7 = 1;
LABEL_27:
            xpc_release(v2);
            return v7;
          }
LABEL_24:
          int v15 = (uint64_t (*)(const __CFString *))IAPWeakLinkSymbol("ACCDigitalAudioAllowBackgroundAudioForClient", (const void *)6);
          if (v15)
          {
            uint64_t v7 = v15(a1);
            NSLog(&cfstr_BackgroundAudi.isa, v7, a1);
          }
          else
          {
            NSLog(&cfstr_ErrorCouldnTFi.isa);
            uint64_t v7 = 0;
          }
          goto LABEL_27;
        }
        if (v13 == MEMORY[0x1E4F145A8]) {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppProcessIDIsUsingAccessory", 1428, v17);
        }
        else {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppProcessIDIsUsingAccessory", 1432, v13);
        }
      }
      xpc_release(v12);
    }
    else
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppProcessIDIsUsingAccessory", 1438);
    }
    xpc_release(v10);
    goto LABEL_24;
  }
  NSLog(&cfstr_SSDErrorCanTCh_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppProcessIDIsUsingAccessory", 1464);
  return 0;
}

uint64_t IAPAppAuthCertForConnectionID(uint64_t a1)
{
  unsigned int v1 = a1;
  if (!_eaAuthDataGetter || (uint64_t result = _eaAuthDataGetter(a1)) == 0)
  {
    int v13 = 2;
    int v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(v1, &v13);
    int v4 = v3;
    if (v13 != 2 && v3 != 0)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "requestType", "IAPAppAuthCertForConnectionIDStr");
      xpc_dictionary_set_uint64(v7, "connectionID", v1);
      uint64_t v8 = _IAPSendXPCMessageWithTimeout(v4, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v8)
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppAuthCertForConnectionID", 1524);
        uint64_t v6 = 0;
LABEL_27:
        xpc_release(v7);
        goto LABEL_28;
      }
      xpc_object_t v9 = (void *)v8;
      uint64_t v10 = MEMORY[0x1BA9F0E70]();
      if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertForConnectionID", 1496);
      }
      else if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertForConnectionID", 1500);
      }
      else
      {
        if (v10 == MEMORY[0x1E4F14590])
        {
          size_t length = 0;
          data = xpc_dictionary_get_data(v9, "kXPCIAPAppAuthCertDataStr", &length);
          uint64_t v6 = 0;
          if (data && length) {
            uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", data);
          }
          goto LABEL_26;
        }
        if (v10 == MEMORY[0x1E4F145A8]) {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppAuthCertForConnectionID", 1514);
        }
        else {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAppAuthCertForConnectionID", 1518, v10);
        }
      }
      uint64_t v6 = 0;
LABEL_26:
      xpc_release(v9);
      goto LABEL_27;
    }
    uint64_t v6 = 0;
    uint64_t result = 0;
    if (v4)
    {
LABEL_28:
      xpc_release(v4);
      return v6;
    }
  }
  return result;
}

uint64_t IAPAppAuthCertSerialStringForConnectionID(uint64_t a1)
{
  unsigned int v1 = a1;
  if (!_eaAuthSerialStringGetter || (uint64_t result = _eaAuthSerialStringGetter(a1)) == 0)
  {
    int v12 = 2;
    int v3 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(v1, &v12);
    int v4 = v3;
    if (v12 != 2 && v3 != 0)
    {
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v7, "requestType", "IAPAppAuthCertSerialForConnectionIDStr");
      xpc_dictionary_set_uint64(v7, "connectionID", v1);
      uint64_t v8 = _IAPSendXPCMessageWithTimeout(v4, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v8)
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAppAuthCertSerialStringForConnectionID", 1589);
        uint64_t v6 = 0;
LABEL_26:
        xpc_release(v7);
        goto LABEL_27;
      }
      xpc_object_t v9 = (void *)v8;
      uint64_t v10 = MEMORY[0x1BA9F0E70]();
      if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertSerialStringForConnectionID", 1564);
      }
      else if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SSDReceivedAnX_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "IAPAppAuthCertSerialStringForConnectionID", 1568);
      }
      else if (v10 == MEMORY[0x1E4F14590])
      {
        string = xpc_dictionary_get_string(v9, "kXPCIAPAppAuthCertSerialStr");
        if (string)
        {
          uint64_t v6 = [NSString stringWithCString:string encoding:4];
LABEL_25:
          xpc_release(v9);
          goto LABEL_26;
        }
      }
      else if (v10 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAppAuthCertSerialStringForConnectionID", 1579);
      }
      else
      {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAppAuthCertSerialStringForConnectionID", 1583, v10);
      }
      uint64_t v6 = 0;
      goto LABEL_25;
    }
    uint64_t v6 = 0;
    uint64_t result = 0;
    if (v4)
    {
LABEL_27:
      xpc_release(v4);
      return v6;
    }
  }
  return result;
}

void SendDisplayPortStatusToAccessory(BOOL a1)
{
  xpc_object_t v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemon();
  if (v2)
  {
    int v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "kXPCIAPAppSendDisplayPortStatus");
    xpc_dictionary_set_BOOL(v4, "kXPCDisplayPortStatus", a1);
    xpc_connection_send_message(v3, v4);
    xpc_release(v4);
    xpc_release(v3);
  }
}

void ___ZL41_InitIAPAppSendXPCMessageDefaultTimeoutMsv_block_invoke()
{
  uint64_t v0 = (void *)[MEMORY[0x1E4F1CB18] standardUserDefaults];
  [v0 addSuiteNamed:@"com.apple.logging"];
  uint64_t v1 = [v0 integerForKey:@"OverrideIAPXPCTimeoutMs"];
  if (v1 == -1) {
    uint64_t v2 = 0;
  }
  else {
    uint64_t v2 = v1;
  }
  if (v1) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 1000;
  }
  NSLog(&cfstr_LoadingLogging.isa, @"OverrideIAPXPCTimeoutMs", __IAPAppSendXPCMessageDefaultTimeoutMs, v3);
  __IAPAppSendXPCMessageDefaultTimeoutMs = v3;
}

void ___ZL28_xpc_handle_outgoing_requestPU24objcproto13OS_xpc_object8NSObjectPU28objcproto17OS_dispatch_queueS__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1BA9F0E70](a2);
  uint64_t v5 = MEMORY[0x1E4F14590];
  if (v4 != MEMORY[0x1E4F14590])
  {
    if (v4 == MEMORY[0x1E4F145A8])
    {
      xpc_object_t value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x1E4F14530]);
      if (value) {
        string_ptr = xpc_string_get_string_ptr(value);
      }
      else {
        string_ptr = "";
      }
      NSLog(&cfstr_SSDErrorReceiv_2.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1363, string_ptr);
    }
    else
    {
      NSLog(&cfstr_SSDErrorReceiv_3.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1368);
    }
    uint64_t v17 = *(_xpc_connection_s **)(a1 + 32);
    xpc_connection_cancel(v17);
    return;
  }
  string = xpc_dictionary_get_string(a2, "requestType");
  if (!string)
  {
    NSLog(&cfstr_RequesttypeNot.isa);
    string = "<nil>";
  }
  if (!strcmp(string, "VoiceOver"))
  {
    xpc_object_t v7 = (void *)MEMORY[0x1BA9F0A70]();
    id v26 = 0;
    size_t length = 0xAAAAAAAAAAAAAAAALL;
    data = xpc_dictionary_get_data(a2, "userInfo", &length);
    if (data
      && (uint64_t v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length]) != 0
      && (uint64_t v10 = [MEMORY[0x1E4F28F98] propertyListWithData:v9 options:0 format:0 error:&v26]) != 0)
    {
      uint64_t v11 = (void *)v10;
      int v12 = xpc_dictionary_get_string(a2, "VoiceOver");
      EAAccessoryManager = (uint64_t (*)(void))__GetEAAccessoryManager();
      if (EAAccessoryManager) {
        BOOL v14 = (void *)EAAccessoryManager();
      }
      else {
        BOOL v14 = 0;
      }
      if (v12)
      {
        if (!strcmp(v12, "Action"))
        {
          if (__GetEAStringConstant(char const*)::once != -1) {
            dispatch_once(&__GetEAStringConstant(char const*)::once, &__block_literal_global_393);
          }
          if (__GetEAStringConstant(char const*)::eaHandle)
          {
            uint64_t v24 = dlsym((void *)__GetEAStringConstant(char const*)::eaHandle, "EAAccessoryAccessibilityContextKey");
            if (v24)
            {
              if (*v24 && objc_msgSend(v11, "objectForKey:")) {
                [v14 accessibilityContextChange:v11];
              }
            }
          }
          [v14 accessibilityAction:v11];
        }
        else if (!strcmp(v12, "ContextChange"))
        {
          [v14 accessibilityContextChange:v11];
        }
        else if (!strcmp(v12, "ItemPropertyRequest"))
        {
          [v14 accessibilityItemPropertyRequest:v11];
        }
        else if (!strcmp(v12, "SystemPropertyChange"))
        {
          [v14 accessibilitySystemPropertyChange:v11];
        }
        else if (!strcmp(v12, "SystemPropertyRequest"))
        {
          [v14 accessibilitySystemPropertyRequest:v11];
        }
        BOOL v18 = 1;
        goto LABEL_32;
      }
      NSLog(&cfstr_SSDErrorReceiv.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1317);
    }
    else if (v26)
    {
      NSLog(&cfstr_SSDErrorReceiv_0.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1326, [v26 description]);
    }
    else
    {
      NSLog(&cfstr_SSDErrorReceiv_1.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1330);
    }
    BOOL v18 = 0;
LABEL_32:
    xpc_object_t reply = xpc_dictionary_create_reply(a2);
    if (reply)
    {
      uint64_t v20 = reply;
      uint64_t v21 = MEMORY[0x1BA9F0E70]();
      if (v21 == v5)
      {
        xpc_dictionary_set_BOOL(v20, "sendWasSuccessful", v18);
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), v20);
      }
      else if (v21 == MEMORY[0x1E4F145A8])
      {
        xpc_object_t v22 = xpc_dictionary_get_value(v20, (const char *)*MEMORY[0x1E4F14530]);
        if (v22) {
          v23 = xpc_string_get_string_ptr(v22);
        }
        else {
          v23 = "";
        }
        NSLog(&cfstr_SSDErrorReceiv_2.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1348, v23);
      }
      else
      {
        NSLog(&cfstr_SSDErrorReceiv_3.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "_xpc_handle_outgoing_request_block_invoke", 1352, v25);
      }
      xpc_release(v20);
    }
  }
}

void ___ZL21__GetEAStringConstantPKc_block_invoke()
{
  uint64_t v0 = (void *)[(id)GSSystemRootDirectory() stringByAppendingPathComponent:@"System/Library/Frameworks/ExternalAccessory.framework/ExternalAccessory"];
  __GetEAStringConstant(char const*)::eaHandle = (uint64_t)dlopen((const char *)[v0 fileSystemRepresentation], 1);
  if (!__GetEAStringConstant(char const*)::eaHandle) {
    NSLog(&cfstr_SSDCouldNotLoa.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAP/IPC_Client/IAPApp.mm", "__GetEAStringConstant_block_invoke", 1215, v0);
  }
}

uint64_t IAPServerPort()
{
  int out_token = 0;
  uint64_t state64 = 0;
  uint64_t v0 = 0;
  if (!notify_register_check("com.apple.iapd.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check && (notify_get_state(out_token, &state64), state64))
    {
      if (!__iapdServerPort)
      {
        pthread_mutex_lock(&__iapdServerPortLock);
        if (bootstrap_look_up(*MEMORY[0x1E4F14638], __iapdServerPortName, (mach_port_t *)&__iapdServerPort)) {
          BOOL v1 = 0;
        }
        else {
          BOOL v1 = (__iapdServerPort + 1) >= 2;
        }
        if (v1) {
          __iapdServerMachPort = (uint64_t)CFMachPortCreateWithPort((CFAllocatorRef)*MEMORY[0x1E4F1CF80], __iapdServerPort, 0, 0, 0);
        }
        pthread_mutex_unlock(&__iapdServerPortLock);
        if (__iapdServerMachPort) {
          CFMachPortSetInvalidationCallBack((CFMachPortRef)__iapdServerMachPort, (CFMachPortInvalidationCallBack)__invalidateIAPDServerPort);
        }
      }
      uint64_t v0 = __iapdServerPort;
    }
    else
    {
      uint64_t v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IAPCheckIn()
{
  if (IAPDHasLaunched())
  {
    uint64_t v0 = (_xpc_connection_s *)RetainIAPDaemonConnection();
    if (v0)
    {
      BOOL v1 = v0;
      xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v2, "requestType", "IAPCheckIn");
      NSLog(&cfstr_SSendXpcMessag.isa, "IAPCheckIn", "IAPCheckIn");
      uint64_t v3 = _IAPSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v3)
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPCheckIn", 167);
        BOOL v8 = 0;
LABEL_23:
        xpc_release(v2);
        xpc_release(v1);
        return v8;
      }
      uint64_t v4 = (void *)v3;
      uint64_t v5 = MEMORY[0x1BA9F0E70]();
      if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapcheckinRece.isa, v10, v11);
      }
      else if (v4 == (void *)MEMORY[0x1E4F14520] && v5 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapcheckinRece_0.isa, v10, v11);
      }
      else
      {
        if (v5 == MEMORY[0x1E4F14590])
        {
          BOOL v8 = xpc_dictionary_get_BOOL(v4, "result");
          NSLog(&cfstr_IapcheckinResu.isa, v8);
LABEL_22:
          xpc_release(v4);
          goto LABEL_23;
        }
        if (v5 == MEMORY[0x1E4F145A8]) {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPCheckIn", 157);
        }
        else {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPCheckIn", 161, v5);
        }
      }
      BOOL v8 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

void *RetainConnectionToIAPDaemon()
{
  if (!IAPDHasLaunched()) {
    return 0;
  }
  return RetainIAPDaemonConnection();
}

uint64_t _IAPSendXPCMessageWithTimeout(_xpc_connection_s *a1, void *a2, uint64_t a3)
{
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x3052000000;
  int v13 = __Block_byref_object_copy_;
  BOOL v14 = __Block_byref_object_dispose_;
  uint64_t v15 = 0;
  global_queue = dispatch_get_global_queue(0, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = ___IAPSendXPCMessageWithTimeout_block_invoke;
  v9[3] = &unk_1E6227840;
  v9[4] = &v10;
  _IAPSendXPCMessageReplyWithTimeout(a1, a2, a3, global_queue, (uint64_t)v9);
  uint64_t v7 = v11[5];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1BA7FAF18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL iaptransportdHasLaunched()
{
  int out_token = 0;
  uint64_t state64 = 0;
  BOOL v0 = 0;
  if (!notify_register_check("com.apple.iaptransportd.notify.availability", &out_token))
  {
    int check = 0;
    notify_check(out_token, &check);
    if (check)
    {
      notify_get_state(out_token, &state64);
      BOOL v0 = state64 != 0;
    }
    else
    {
      BOOL v0 = 0;
    }
    notify_cancel(out_token);
  }
  return v0;
}

BOOL IsIAPDaemonConnection(uint64_t a1)
{
  if (a1) {
    BOOL v1 = __iapd_connection == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1 && __iapd_connection == a1;
}

BOOL IsIAP2DaemonConnection(uint64_t a1)
{
  if (a1) {
    BOOL v1 = __iap2d_connection == 0;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1 && __iap2d_connection == a1;
}

uint64_t GetIAPTransportDaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPTransportDaemonConnection = _GetIAPTransportDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPTransportDaemonConnection;
}

uint64_t __IAPConnectionMutexLock(void)
{
  return pthread_mutex_lock(&__iapConnectionMutex);
}

uint64_t _GetIAPTransportDaemonConnection(void)
{
  if (!__iaptransportd_connection)
  {
    BOOL v0 = __iaptransportdConnectionQ;
    if (!__iaptransportdConnectionQ)
    {
      BOOL v0 = dispatch_queue_create("iaptransportdConnectionQueue", 0);
      __iaptransportdConnectionQ = (uint64_t)v0;
    }
    mach_service = xpc_connection_create_mach_service("com.apple.iaptransportd.xpc", v0, 0);
    __iaptransportd_connection = (uint64_t)mach_service;
    if (mach_service)
    {
      xpc_connection_set_event_handler(mach_service, &__block_literal_global_131);
      xpc_connection_resume((xpc_connection_t)__iaptransportd_connection);
    }
    else
    {
      NSLog(&cfstr_NoConnectionMa.isa);
      dispatch_release((dispatch_object_t)__iaptransportdConnectionQ);
      __iaptransportdConnectionQ = 0;
    }
  }
  return __iaptransportd_connection;
}

uint64_t __IAPConnectionMutexUnlock(void)
{
  return pthread_mutex_unlock(&__iapConnectionMutex);
}

void *RetainIAPTransportDaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPTransportDaemonConnection = (void *)_GetIAPTransportDaemonConnection();
  BOOL v1 = IAPTransportDaemonConnection;
  if (IAPTransportDaemonConnection) {
    xpc_retain(IAPTransportDaemonConnection);
  }
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

uint64_t GetIAPConnectionQueue(void)
{
  if (GetIAPConnectionQueue(void)::once != -1) {
    dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
  }
  return __iAPConnectionQ;
}

dispatch_queue_t ___Z21GetIAPConnectionQueuev_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("iAPConnectionQueue", 0);
  __iAPConnectionQ = (uint64_t)result;
  return result;
}

uint64_t GetIAPDaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPDaemonConnection = _GetIAPDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPDaemonConnection;
}

uint64_t _GetIAPDaemonConnection(void)
{
  if (!__iapd_connection)
  {
    if (IAPDHasLaunched())
    {
      if (GetIAPConnectionQueue(void)::once != -1) {
        dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.iapd.xpc", (dispatch_queue_t)__iAPConnectionQ, 0);
      __iapd_connection = (uint64_t)mach_service;
      if (mach_service)
      {
        xpc_connection_set_event_handler(mach_service, &__block_literal_global_151);
        xpc_connection_resume((xpc_connection_t)__iapd_connection);
      }
      else
      {
        NSLog(&cfstr_NoConnectionTo.isa);
      }
    }
    else
    {
      NSLog(&cfstr_IapdNotLaunche.isa);
    }
  }
  return __iapd_connection;
}

uint64_t GetIAP2DaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAP2DaemonConnection = _GetIAP2DaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAP2DaemonConnection;
}

uint64_t _GetIAP2DaemonConnection(void)
{
  if (!__iap2d_connection)
  {
    if (IAP2DHasLaunched())
    {
      if (GetIAPConnectionQueue(void)::once != -1) {
        dispatch_once(&GetIAPConnectionQueue(void)::once, &__block_literal_global_0);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.iap2d.xpc", (dispatch_queue_t)__iAPConnectionQ, 0);
      __iap2d_connection = (uint64_t)mach_service;
      if (mach_service)
      {
        xpc_connection_set_event_handler(mach_service, &__block_literal_global_197);
        xpc_connection_resume((xpc_connection_t)__iap2d_connection);
      }
      else
      {
        NSLog(&cfstr_NoConnectionTo_0.isa);
      }
    }
    else
    {
      NSLog(&cfstr_IapdNotLaunche.isa);
    }
  }
  return __iap2d_connection;
}

uint64_t GetConnectionToIAPTransportDaemon()
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPTransportDaemonConnection = _GetIAPTransportDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPTransportDaemonConnection;
}

uint64_t GetConnectionToIAPDaemon()
{
  if (!IAPDHasLaunched()) {
    return 0;
  }
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPDaemonConnection = _GetIAPDaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAPDaemonConnection;
}

uint64_t GetConnectionToIAP2Daemon()
{
  if (!IAP2DHasLaunched()) {
    return 0;
  }
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAP2DaemonConnection = _GetIAP2DaemonConnection();
  pthread_mutex_unlock(&__iapConnectionMutex);
  return IAP2DaemonConnection;
}

_xpc_connection_s *GetConnectionToIAPDaemonOwningPhysicalConnector(_DWORD *a1)
{
  if (a1) {
    *a1 = 2;
  }
  ConnectionToIAPDaemon = (_xpc_connection_s *)GetConnectionToIAPDaemon();
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "requestType", "OwnsPhysicalConnector");
  if (ConnectionToIAPDaemon)
  {
    NSLog(&cfstr_SSendXpcMessag.isa, "GetConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
    uint64_t v4 = _IAPSendXPCMessageWithTimeout(ConnectionToIAPDaemon, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = MEMORY[0x1BA9F0E70]();
      if (v5 == (void *)MEMORY[0x1E4F14528] && v6 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdPhysicalco.isa);
      }
      else if (v5 == (void *)MEMORY[0x1E4F14520] && v6 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdPhysicalco_0.isa);
      }
      else if (v6 == MEMORY[0x1E4F14590] && xpc_dictionary_get_BOOL(v5, "result"))
      {
        xpc_release(v5);
        xpc_release(v3);
        if (a1) {
          *a1 = 0;
        }
        return ConnectionToIAPDaemon;
      }
      xpc_release(v5);
    }
    else
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "GetConnectionToIAPDaemonOwningPhysicalConnector", 980);
    }
  }
  ConnectionToIAPDaemon = (_xpc_connection_s *)GetConnectionToIAP2Daemon();
  if (!ConnectionToIAPDaemon)
  {
LABEL_39:
    xpc_release(v3);
    return ConnectionToIAPDaemon;
  }
  NSLog(&cfstr_SSendXpcMessag_0.isa, "GetConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
  uint64_t v9 = _IAPSendXPCMessageWithTimeout(ConnectionToIAPDaemon, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v9)
  {
    NSLog(&cfstr_SDNoReplyRecei.isa, "GetConnectionToIAPDaemonOwningPhysicalConnector", 1022);
    goto LABEL_39;
  }
  uint64_t v10 = (void *)v9;
  uint64_t v11 = MEMORY[0x1BA9F0E70]();
  if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iap2dPhysicalc.isa);
LABEL_38:
    xpc_release(v10);
    goto LABEL_39;
  }
  if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iap2dPhysicalc_0.isa);
    goto LABEL_38;
  }
  if (v11 != MEMORY[0x1E4F14590] || !xpc_dictionary_get_BOOL(v10, "result")) {
    goto LABEL_38;
  }
  xpc_release(v10);
  xpc_release(v3);
  if (a1) {
    *a1 = 1;
  }
  return ConnectionToIAPDaemon;
}

uint64_t GetConnectionToIAPDaemonWithConnectionID(int a1, int *a2)
{
  if (a2) {
    *a2 = 2;
  }
  if ((~a1 & 0x1000000) == 0)
  {
    uint64_t result = GetConnectionToIAPDaemon();
    if (!a2) {
      return result;
    }
    int v4 = 0;
LABEL_9:
    *a2 = v4;
    return result;
  }
  if ((~a1 & 0x2000000) == 0)
  {
    uint64_t result = GetConnectionToIAP2Daemon();
    if (!a2) {
      return result;
    }
    int v4 = 1;
    goto LABEL_9;
  }
  return 0;
}

_xpc_connection_s *GetConnectionToIAPDaemonByCheckingConnectionID(unsigned int a1, _DWORD *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "requestType", "OwnsConnectionID");
  xpc_dictionary_set_uint64(v4, "connectionID", a1);
  if (a2) {
    *a2 = 2;
  }
  if ((a1 & 0x1000000) == 0x1000000)
  {
    uint64_t ConnectionToIAPDaemon = GetConnectionToIAPDaemon();
  }
  else
  {
    if ((~a1 & 0x2000000) != 0)
    {
      uint64_t v6 = 0;
      goto LABEL_31;
    }
    uint64_t ConnectionToIAPDaemon = GetConnectionToIAP2Daemon();
  }
  uint64_t v6 = (_xpc_connection_s *)ConnectionToIAPDaemon;
  if (ConnectionToIAPDaemon)
  {
    NSLog(&cfstr_SSendXpcMessag.isa, "GetConnectionToIAPDaemonByCheckingConnectionID", "OwnsConnectionID");
    uint64_t v7 = _IAPSendXPCMessageWithTimeout(v6, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v7)
    {
      BOOL v8 = (void *)v7;
      uint64_t v9 = MEMORY[0x1BA9F0E70]();
      if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdGetconnect.isa);
      }
      else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdGetconnect_0.isa);
      }
      else if (v9 == MEMORY[0x1E4F14590])
      {
        BOOL v12 = xpc_dictionary_get_BOOL(v8, "result");
        if (v12) {
          int v13 = v6;
        }
        else {
          int v13 = 0;
        }
        if (!a2 || !v12) {
          goto LABEL_30;
        }
        if ((a1 & 0x1000000) == 0x1000000)
        {
          *a2 = 0;
        }
        else if ((~a1 & 0x2000000) == 0)
        {
          *a2 = 1;
        }
      }
      int v13 = v6;
LABEL_30:
      xpc_release(v8);
      uint64_t v6 = v13;
      goto LABEL_31;
    }
    NSLog(&cfstr_SDNoReplyRecei.isa, "GetConnectionToIAPDaemonByCheckingConnectionID", 1129);
  }
LABEL_31:
  xpc_release(v4);
  return v6;
}

void *RetainIAPDaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAPDaemonConnection = (void *)_GetIAPDaemonConnection();
  BOOL v1 = IAPDaemonConnection;
  if (IAPDaemonConnection) {
    xpc_retain(IAPDaemonConnection);
  }
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

void *RetainIAP2DaemonConnection(void)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  uint64_t IAP2DaemonConnection = (void *)_GetIAP2DaemonConnection();
  BOOL v1 = IAP2DaemonConnection;
  if (IAP2DaemonConnection) {
    xpc_retain(IAP2DaemonConnection);
  }
  pthread_mutex_unlock(&__iapConnectionMutex);
  return v1;
}

void *RetainConnectionToIAP2Daemon()
{
  if (!IAP2DHasLaunched()) {
    return 0;
  }
  return RetainIAP2DaemonConnection();
}

_xpc_connection_s *RetainConnectionToIAPDaemonOwningPhysicalConnector(_DWORD *a1)
{
  if (a1) {
    *a1 = 2;
  }
  if (IAPDHasLaunched()) {
    xpc_object_t v2 = (_xpc_connection_s *)RetainIAPDaemonConnection();
  }
  else {
    xpc_object_t v2 = 0;
  }
  NSLog(&cfstr_SIapdConnectio.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", v2 != 0);
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v3, "requestType", "OwnsPhysicalConnector");
  if (v2)
  {
    NSLog(&cfstr_SSendXpcMessag.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
    uint64_t v4 = _IAPSendXPCMessageWithTimeout(v2, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      uint64_t v6 = MEMORY[0x1BA9F0E70]();
      if (v5 == (void *)MEMORY[0x1E4F14528] && v6 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdPhysicalco.isa, v13, v15);
      }
      else if (v5 == (void *)MEMORY[0x1E4F14520] && v6 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_IapdPhysicalco_0.isa, v13, v15);
      }
      else if (v6 == MEMORY[0x1E4F14590])
      {
        if (xpc_dictionary_get_BOOL(v5, "result"))
        {
          xpc_release(v5);
          xpc_release(v3);
          if (a1)
          {
            uint64_t v11 = 0;
            *a1 = 0;
LABEL_50:
            NSLog(&cfstr_SDaemontypeDCo.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", v11, 1);
            return v2;
          }
LABEL_49:
          uint64_t v11 = 0xFFFFFFFFLL;
          goto LABEL_50;
        }
      }
      else if (v6 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SDUnhandledRep.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1251);
      }
      else
      {
        NSLog(&cfstr_SDUnknownReply.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1255, v6);
      }
      xpc_release(v5);
    }
    else
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1261);
    }
  }
  else
  {
    NSLog(&cfstr_SDNoConnection.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1266);
  }
  if (!IAP2DHasLaunched())
  {
    NSLog(&cfstr_SIap2dConnecti.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 0);
    goto LABEL_27;
  }
  xpc_object_t v2 = (_xpc_connection_s *)RetainIAP2DaemonConnection();
  NSLog(&cfstr_SIap2dConnecti.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", v2 != 0);
  if (!v2)
  {
LABEL_27:
    NSLog(&cfstr_SDNoConnection_0.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1324);
    xpc_object_t v2 = 0;
    goto LABEL_47;
  }
  NSLog(&cfstr_SSendXpcMessag_0.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", "OwnsPhysicalConnector");
  uint64_t v8 = _IAPSendXPCMessageWithTimeout(v2, v3, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    uint64_t v10 = MEMORY[0x1BA9F0E70]();
    if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iap2dPhysicalc.isa, v14, v16, v17);
      goto LABEL_46;
    }
    if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iap2dPhysicalc_0.isa, v14, v16, v17);
      goto LABEL_46;
    }
    if (v10 != MEMORY[0x1E4F14590])
    {
      if (v10 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1309, v17);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1313, v10);
      }
      goto LABEL_46;
    }
    if (!xpc_dictionary_get_BOOL(v9, "result"))
    {
LABEL_46:
      xpc_release(v9);
      goto LABEL_47;
    }
    xpc_release(v9);
    xpc_release(v3);
    if (a1)
    {
      uint64_t v11 = 1;
      *a1 = 1;
      goto LABEL_50;
    }
    goto LABEL_49;
  }
  NSLog(&cfstr_SDNoReplyRecei.isa, "RetainConnectionToIAPDaemonOwningPhysicalConnector", 1319);
LABEL_47:
  xpc_release(v3);
  return v2;
}

void *RetainConnectionToIAPDaemonWithConnectionID(int a1, int *a2)
{
  if (a2) {
    *a2 = 2;
  }
  if ((~a1 & 0x1000000) == 0)
  {
    if (IAPDHasLaunched())
    {
      uint64_t result = RetainIAPDaemonConnection();
      if (!a2) {
        return result;
      }
    }
    else
    {
      uint64_t result = 0;
      if (!a2) {
        return result;
      }
    }
    int v4 = 0;
LABEL_16:
    *a2 = v4;
    return result;
  }
  if ((~a1 & 0x2000000) != 0) {
    return 0;
  }
  if (!IAP2DHasLaunched())
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
    goto LABEL_15;
  }
  uint64_t result = RetainIAP2DaemonConnection();
  if (a2)
  {
LABEL_15:
    int v4 = 1;
    goto LABEL_16;
  }
  return result;
}

void *RetainConnectionToIAPDOnlyWithConnectionID(int a1, _DWORD *a2)
{
  if (a2) {
    *a2 = 2;
  }
  if ((~a1 & 0x1000000) != 0) {
    return 0;
  }
  if (!IAPDHasLaunched())
  {
    uint64_t result = 0;
    if (!a2) {
      return result;
    }
    goto LABEL_9;
  }
  uint64_t result = RetainIAPDaemonConnection();
  if (a2) {
LABEL_9:
  }
    *a2 = 0;
  return result;
}

_xpc_connection_s *RetainConnectionToIAPDaemonByCheckingConnectionID(uint64_t a1, _DWORD *a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v4, "requestType", "OwnsConnectionID");
  xpc_dictionary_set_uint64(v4, "connectionID", a1);
  if (a2) {
    *a2 = 2;
  }
  if ((a1 & 0x1000000) == 0x1000000)
  {
    if (IAPDHasLaunched())
    {
      uint64_t v5 = (_xpc_connection_s *)RetainIAPDaemonConnection();
LABEL_9:
      uint64_t v6 = v5;
      goto LABEL_11;
    }
  }
  else if ((~a1 & 0x2000000) == 0 && IAP2DHasLaunched())
  {
    uint64_t v5 = (_xpc_connection_s *)RetainIAP2DaemonConnection();
    goto LABEL_9;
  }
  uint64_t v6 = 0;
LABEL_11:
  NSLog(&cfstr_SConnectionidX.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", a1, a1, 0x1000000, 0x2000000, v6 != 0);
  if (!v6) {
    goto LABEL_33;
  }
  NSLog(&cfstr_SSendXpcMessag.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", "OwnsConnectionID");
  uint64_t v7 = _IAPSendXPCMessageWithTimeout(v6, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v7)
  {
    NSLog(&cfstr_SDNoReplyRecei.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", 1462);
    goto LABEL_33;
  }
  uint64_t v8 = (void *)v7;
  uint64_t v9 = MEMORY[0x1BA9F0E70]();
  if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_IapdRetainconn.isa, v14, v15, v16);
  }
  else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_IapdRetainconn_0.isa, v14, v15, v16);
  }
  else if (v9 == MEMORY[0x1E4F14590])
  {
    BOOL v10 = xpc_dictionary_get_BOOL(v8, "result");
    if (v10) {
      uint64_t v11 = v6;
    }
    else {
      uint64_t v11 = 0;
    }
    if (!a2 || !v10) {
      goto LABEL_32;
    }
    if ((a1 & 0x1000000) == 0x1000000)
    {
      *a2 = 0;
    }
    else if ((~a1 & 0x2000000) == 0)
    {
      *a2 = 1;
    }
  }
  else if (v9 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_SDUnhandledRep.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", 1452, v16);
  }
  else
  {
    NSLog(&cfstr_SDUnknownReply.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", 1456, v9);
  }
  uint64_t v11 = v6;
LABEL_32:
  xpc_release(v8);
  uint64_t v6 = v11;
LABEL_33:
  xpc_release(v4);
  if (a2) {
    uint64_t v12 = *a2;
  }
  else {
    uint64_t v12 = 0xFFFFFFFFLL;
  }
  NSLog(&cfstr_SConnectionidD.isa, "RetainConnectionToIAPDaemonByCheckingConnectionID", a1, v6 != 0, v12);
  return v6;
}

uint64_t _IAPSendXPCMessageReplyWithTimeout(_xpc_connection_s *a1, void *a2, uint64_t a3, NSObject *a4, uint64_t a5)
{
  pthread_mutex_lock(&__iapConnectionMutex);
  if (a5)
  {
    if (!a1)
    {
LABEL_25:
      syslog(3, "%s: connection does not match one of the existing ones!!!", "_IAPSendXPCMessageReplyWithTimeout");
LABEL_26:
      (*(void (**)(uint64_t, void))(a5 + 16))(a5, 0);
      return pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else
  {
    string = xpc_dictionary_get_string(a2, "requestType");
    uint64_t v11 = "unknown";
    if (string) {
      uint64_t v11 = string;
    }
    syslog(3, "%s: replyHandler not provided for '%s'!", "_IAPSendXPCMessageReplyWithTimeout", v11);
    if (!a1) {
      goto LABEL_25;
    }
  }
  if ((_xpc_connection_s *)__iapd_connection != a1
    && __iap2d_connection != (void)a1
    && __iaptransportd_connection != (void)a1)
  {
    goto LABEL_25;
  }
  if (!a2 || !a5)
  {
    NSLog(&cfstr_SOneOfConnecti.isa, "_IAPSendXPCMessageReplyWithTimeout", 1, a2 != 0, a5 != 0);
    if (!a5) {
      return pthread_mutex_unlock(&__iapConnectionMutex);
    }
    goto LABEL_26;
  }
  uint64_t v14 = dispatch_semaphore_create(0);
  uint64_t v15 = xpc_dictionary_get_string(a2, "requestType");
  uint64_t v16 = "unknown";
  if (v15) {
    uint64_t v17 = v15;
  }
  else {
    uint64_t v17 = "unknown";
  }
  if ((_xpc_connection_s *)__iapd_connection == a1)
  {
    uint64_t v16 = "iapd";
  }
  else if ((_xpc_connection_s *)__iap2d_connection == a1)
  {
    uint64_t v16 = "iap2d";
  }
  else if ((_xpc_connection_s *)__iaptransportd_connection == a1)
  {
    uint64_t v16 = "iaptransportd";
  }
  NSLog(&cfstr_SSendXpcMessag_1.isa, "_IAPSendXPCMessageReplyWithTimeout", v17, v16, 0);
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = ___IAPSendXPCMessageReplyWithTimeout_block_invoke;
  handler[3] = &unk_1E6227818;
  handler[4] = a2;
  void handler[5] = a1;
  handler[6] = v14;
  handler[7] = a5;
  xpc_connection_send_message_with_reply(a1, a2, a4, handler);
  uint64_t v19 = (void *)[MEMORY[0x1E4F1C9C8] date];
  if (a3) {
    dispatch_time_t v20 = dispatch_time(0, 1000000 * a3);
  }
  else {
    dispatch_time_t v20 = -1;
  }
  if (dispatch_semaphore_wait(v14, v20))
  {
    syslog(3, "%s: xpc_connection_send_message_with_reply did not reply within %d ms. Timeout has occurred, tryLeft %d", "_IAPSendXPCMessageReplyWithTimeout", a3, 0);
    (*(void (**)(uint64_t, void))(a5 + 16))(a5, 0);
  }
  else
  {
    [v19 timeIntervalSinceNow];
    syslog(6, "%s: xpc_connection_send_message_with_reply reply in %lu ms.", "_IAPSendXPCMessageReplyWithTimeout", (v21 * 1000.0));
  }
  dispatch_release(v14);
  return pthread_mutex_unlock(&__iapConnectionMutex);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __invalidateIAPDServerPort(__CFMachPort *a1, void *a2)
{
  pthread_mutex_lock(&__iapdServerPortLock);
  mach_port_deallocate(*MEMORY[0x1E4F14960], __iapdServerPort);
  __iapdServerPort = 0;
  CFRelease((CFTypeRef)__iapdServerMachPort);
  __iapdServerMachPort = 0;
  pthread_mutex_unlock(&__iapdServerPortLock);
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"kIAPDServerDiedNotification", 0, 0, 1u);
}

void ___ZL32_GetIAPTransportDaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1BA9F0E70](a2) == MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14520] || a2 == (void *)MEMORY[0x1E4F14528])
    {
      pthread_mutex_lock(&__iapConnectionMutex);
      if (__iaptransportd_connection)
      {
        NSLog(&cfstr_SCleanupConnec.isa, "_xpc_iaptransportd_handle_message");
        xpc_connection_cancel((xpc_connection_t)__iaptransportd_connection);
        xpc_release((xpc_object_t)__iaptransportd_connection);
        __iaptransportd_connection = 0;
        NSLog(&cfstr_SNotifyIaptran.isa, "_xpc_iaptransportd_handle_message");
        LocalCenter = CFNotificationCenterGetLocalCenter();
        CFNotificationCenterPostNotification(LocalCenter, @"kIAPTransportServerDiedNotification", 0, 0, 1u);
      }
      pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else if (MEMORY[0x1BA9F0E70](a2) == MEMORY[0x1E4F14590])
  {
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(&cfstr_RequesttypeNot.isa);
      string = "<nil>";
    }
    if (!strcmp(string, "transmitData"))
    {
      size_t length = 0;
      data = xpc_dictionary_get_data(a2, "data", &length);
      uint64_t v5 = xpc_dictionary_get_string(a2, "IAPClientPortUUIDStr");
      if (v5 && data)
      {
        uint64_t v6 = v5;
        uint64_t v7 = +[IAPClientPortManager sharedInstance];
        uint64_t v8 = [NSString stringWithUTF8String:v6];
        [(IAPClientPortManager *)v7 sendData:v8 data:data length:(unsigned __int16)length];
      }
      else
      {
        NSLog(&cfstr_XpcIaptranspor_0.isa);
      }
    }
  }
}

void ___ZL23_GetIAPDaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1BA9F0E70](a2) == MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14520] || a2 == (void *)MEMORY[0x1E4F14528])
    {
      if (a2 == (void *)MEMORY[0x1E4F14520])
      {
        NSLog(&cfstr_SConnectionInt.isa, "_xpc_iapd_handle_message");
        LODWORD(length) = 0;
        if (!notify_register_check("com.apple.iapd.notify.availability", (int *)&length))
        {
          uint64_t state64 = 0;
          notify_get_state(length, &state64);
          if (state64 == 1)
          {
            notify_set_state(length, 0);
            notify_post("com.apple.iapd.notify.availability");
          }
          notify_cancel(length);
        }
      }
      else
      {
        NSLog(&cfstr_SConnectionInv.isa, "_xpc_iapd_handle_message");
      }
      pthread_mutex_lock(&__iapConnectionMutex);
      if (__iapd_connection)
      {
        NSLog(&cfstr_SCleanupConnec.isa, "_xpc_iapd_handle_message");
        xpc_connection_cancel((xpc_connection_t)__iapd_connection);
        xpc_release((xpc_object_t)__iapd_connection);
        __iapd_connection = 0;
        dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_162);
      }
      pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else
  {
    if (MEMORY[0x1BA9F0E70](a2) != MEMORY[0x1E4F14590]) {
      return;
    }
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(&cfstr_RequesttypeNot.isa);
      string = "<nil>";
    }
    if (strcmp(string, "eaNotifyAppOfSessionClose"))
    {
      if (!strcmp(string, "EAProtocolAccessoryConnected"))
      {
        id v32 = 0;
        size_t length = 0;
        data = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
      }
      else if (!strcmp(string, "EAProtocolAccessoryDisconnected"))
      {
        id v32 = 0;
        size_t length = 0;
        uint64_t v13 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3;
      }
      else if (!strcmp(string, "EAProtocolAccessoryReconnected"))
      {
        id v32 = 0;
        size_t length = 0;
        uint64_t v15 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4;
      }
      else
      {
        if (!strcmp(string, "kXPCACCNotificationKey"))
        {
          NSLog(&cfstr_SHandlingKxpca.isa, "_xpc_iapd_handle_message");
          uint64_t v17 = xpc_dictionary_get_string(a2, "kXPCACCNotificationNameKey");
          if (!v17)
          {
            NSLog(&cfstr_SReceivedNilAr.isa, "_xpc_iapd_handle_message", 0);
            return;
          }
          uint64_t v18 = [NSString stringWithUTF8String:v17];
          if (!v18)
          {
            NSLog(&cfstr_SErrorWhenConv.isa, "_xpc_iapd_handle_message");
            return;
          }
          uint64_t v19 = v18;
          NSLog(&cfstr_SReceivedNotif.isa, "_xpc_iapd_handle_message", v18);
          size_t length = 0;
          dispatch_time_t v20 = xpc_dictionary_get_data(a2, "kXPCACCNotificationPlistData", &length);
          if (v20)
          {
            uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:length];
            if (!v21)
            {
              NSLog(&cfstr_SErrorWhenCrea_0.isa, "_xpc_iapd_handle_message", v25);
              return;
            }
            id v32 = 0;
            uint64_t v22 = [MEMORY[0x1E4F28F98] propertyListWithData:v21 options:0 format:0 error:&v32];
            if (!v22)
            {
              NSLog(&cfstr_SErrorWhenCrea.isa, "_xpc_iapd_handle_message", [v32 localizedDescription]);
              return;
            }
            uint64_t state64 = MEMORY[0x1E4F143A8];
            uint64_t v27 = 3221225472;
            uint64_t v28 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5;
            v29 = &unk_1E6227890;
            uint64_t v30 = v19;
            uint64_t v31 = v22;
          }
          else
          {
            uint64_t state64 = MEMORY[0x1E4F143A8];
            uint64_t v27 = 3221225472;
            uint64_t v28 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6;
            v29 = &unk_1E6227868;
            uint64_t v30 = v19;
          }
          goto LABEL_41;
        }
        if (!strcmp(string, "EAProtocolAccessoryUpdated"))
        {
          id v32 = 0;
          size_t length = 0;
          v23 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
          uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:length];
          uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v24 options:0 format:0 error:&v32];
          uint64_t state64 = MEMORY[0x1E4F143A8];
          uint64_t v27 = 3221225472;
          uint64_t v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7;
        }
        else
        {
          if (strcmp(string, "EAProtocolAccessoryPortPropertyChanged")) {
            return;
          }
          id v32 = 0;
          size_t length = 0;
          xpc_object_t v4 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
          uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:length];
          uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v32];
          uint64_t state64 = MEMORY[0x1E4F143A8];
          uint64_t v27 = 3221225472;
          uint64_t v7 = ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8;
        }
      }
      uint64_t v28 = v7;
      v29 = &unk_1E6227868;
      uint64_t v30 = v6;
LABEL_41:
      dispatch_async(MEMORY[0x1E4F14428], &state64);
      return;
    }
    int uint64 = xpc_dictionary_get_uint64(a2, "connectionID");
    int v10 = xpc_dictionary_get_uint64(a2, "eaSessionID");
    IAPAppNotifyAppOfSessionClose(uint64, v10);
  }
}

void ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke()
{
  NSLog(&cfstr_SNotifyIapdSer.isa, "_xpc_iapd_handle_message_block_invoke");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"kIAPDServerDiedNotification", 0, 0, 1u);
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryDidConnectNotification" object:0 userInfo:v3];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryDidDisconnectNotification" object:0 userInfo:v3];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppReconnectAccessory" object:0 userInfo:v3];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5(uint64_t a1)
{
  NSLog(&cfstr_PostingNotific.isa, *(void *)(a1 + 32), *(void *)(a1 + 40));
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 postNotificationName:v3 object:0 userInfo:v4];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6(uint64_t a1)
{
  NSLog(&cfstr_PostingNotific_0.isa, *(void *)(a1 + 32));
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:v3 object:0 userInfo:0];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryUpdatedNotification" object:0 userInfo:v3];
}

uint64_t ___ZL24_xpc_iapd_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryPortPropertyChangedNotification" object:0 userInfo:v3];
}

void ___ZL24_GetIAP2DaemonConnectionv_block_invoke(uint64_t a1, void *a2)
{
  if (MEMORY[0x1BA9F0E70](a2) == MEMORY[0x1E4F145A8])
  {
    if (a2 == (void *)MEMORY[0x1E4F14520] || a2 == (void *)MEMORY[0x1E4F14528])
    {
      if (a2 == (void *)MEMORY[0x1E4F14520])
      {
        NSLog(&cfstr_SConnectionInt.isa, "_xpc_iap2d_handle_message");
        LODWORD(length) = 0;
        if (!notify_register_check("com.apple.iap2d.notify.availability", (int *)&length))
        {
          uint64_t state64 = 0;
          notify_get_state(length, &state64);
          if (state64 == 1)
          {
            notify_set_state(length, 0);
            notify_post("com.apple.iap2d.notify.availability");
          }
          notify_cancel(length);
        }
      }
      else
      {
        NSLog(&cfstr_SConnectionInv.isa, "_xpc_iap2d_handle_message");
      }
      pthread_mutex_lock(&__iapConnectionMutex);
      if (__iap2d_connection)
      {
        NSLog(&cfstr_SCleanupConnec.isa, "_xpc_iap2d_handle_message");
        xpc_connection_cancel((xpc_connection_t)__iap2d_connection);
        xpc_release((xpc_object_t)__iap2d_connection);
        __iap2d_connection = 0;
        dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_199);
      }
      pthread_mutex_unlock(&__iapConnectionMutex);
    }
  }
  else
  {
    if (MEMORY[0x1BA9F0E70](a2) != MEMORY[0x1E4F14590]) {
      return;
    }
    string = xpc_dictionary_get_string(a2, "requestType");
    if (!string)
    {
      NSLog(&cfstr_RequesttypeNot.isa);
      string = "<nil>";
    }
    if (strcmp(string, "eaNotifyAppOfSessionClose"))
    {
      if (!strcmp(string, "EAProtocolAccessoryConnected"))
      {
        id v32 = 0;
        size_t length = 0;
        data = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v12 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v12 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2;
      }
      else if (!strcmp(string, "EAProtocolAccessoryDisconnected"))
      {
        id v32 = 0;
        size_t length = 0;
        uint64_t v13 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v14 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v13 length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v14 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3;
      }
      else if (!strcmp(string, "EAProtocolAccessoryReconnected"))
      {
        id v32 = 0;
        size_t length = 0;
        uint64_t v15 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
        uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v15 length:length];
        uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v16 options:0 format:0 error:&v32];
        uint64_t state64 = MEMORY[0x1E4F143A8];
        uint64_t v27 = 3221225472;
        uint64_t v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4;
      }
      else
      {
        if (!strcmp(string, "kXPCACCNotificationKey"))
        {
          NSLog(&cfstr_SHandlingKxpca.isa, "_xpc_iap2d_handle_message");
          uint64_t v17 = xpc_dictionary_get_string(a2, "kXPCACCNotificationNameKey");
          if (!v17)
          {
            NSLog(&cfstr_SReceivedNilAr.isa, "_xpc_iap2d_handle_message", 0);
            return;
          }
          uint64_t v18 = [NSString stringWithUTF8String:v17];
          if (!v18)
          {
            NSLog(&cfstr_SErrorWhenConv.isa, "_xpc_iap2d_handle_message");
            return;
          }
          uint64_t v19 = v18;
          NSLog(&cfstr_SReceivedNotif.isa, "_xpc_iap2d_handle_message", v18);
          size_t length = 0;
          dispatch_time_t v20 = xpc_dictionary_get_data(a2, "kXPCACCNotificationPlistData", &length);
          if (v20)
          {
            uint64_t v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v20 length:length];
            if (!v21)
            {
              NSLog(&cfstr_SErrorWhenCrea_0.isa, "_xpc_iap2d_handle_message", v25);
              return;
            }
            id v32 = 0;
            uint64_t v22 = [MEMORY[0x1E4F28F98] propertyListWithData:v21 options:0 format:0 error:&v32];
            if (!v22)
            {
              NSLog(&cfstr_SErrorWhenCrea.isa, "_xpc_iap2d_handle_message", [v32 localizedDescription]);
              return;
            }
            uint64_t state64 = MEMORY[0x1E4F143A8];
            uint64_t v27 = 3221225472;
            uint64_t v28 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5;
            v29 = &unk_1E6227890;
            uint64_t v30 = v19;
            uint64_t v31 = v22;
          }
          else
          {
            uint64_t state64 = MEMORY[0x1E4F143A8];
            uint64_t v27 = 3221225472;
            uint64_t v28 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6;
            v29 = &unk_1E6227868;
            uint64_t v30 = v19;
          }
          goto LABEL_41;
        }
        if (!strcmp(string, "EAProtocolAccessoryUpdated"))
        {
          id v32 = 0;
          size_t length = 0;
          v23 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
          uint64_t v24 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v23 length:length];
          uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v24 options:0 format:0 error:&v32];
          uint64_t state64 = MEMORY[0x1E4F143A8];
          uint64_t v27 = 3221225472;
          uint64_t v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7;
        }
        else
        {
          if (strcmp(string, "EAProtocolAccessoryPortPropertyChanged")) {
            return;
          }
          id v32 = 0;
          size_t length = 0;
          uint64_t v4 = xpc_dictionary_get_data(a2, "EAProtocolAccessoryPlistData", &length);
          uint64_t v5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v4 length:length];
          uint64_t v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v5 options:0 format:0 error:&v32];
          uint64_t state64 = MEMORY[0x1E4F143A8];
          uint64_t v27 = 3221225472;
          uint64_t v7 = ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8;
        }
      }
      uint64_t v28 = v7;
      v29 = &unk_1E6227868;
      uint64_t v30 = v6;
LABEL_41:
      dispatch_async(MEMORY[0x1E4F14428], &state64);
      return;
    }
    int uint64 = xpc_dictionary_get_uint64(a2, "connectionID");
    int v10 = xpc_dictionary_get_uint64(a2, "eaSessionID");
    IAPAppNotifyAppOfSessionClose(uint64, v10);
  }
}

void ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke()
{
  NSLog(&cfstr_SNotifyIap2dSe.isa, "_xpc_iap2d_handle_message_block_invoke");
  LocalCenter = CFNotificationCenterGetLocalCenter();
  CFNotificationCenterPostNotification(LocalCenter, @"kIAP2ServerDiedNotification", 0, 0, 1u);
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_2(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryDidConnectNotification" object:0 userInfo:v3];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_3(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryDidDisconnectNotification" object:0 userInfo:v3];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_4(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppReconnectAccessory" object:0 userInfo:v3];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_5(uint64_t a1)
{
  NSLog(&cfstr_PostingNotific.isa, *(void *)(a1 + 32), *(void *)(a1 + 40));
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  return [v2 postNotificationName:v3 object:0 userInfo:v4];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_6(uint64_t a1)
{
  NSLog(&cfstr_PostingNotific_0.isa, *(void *)(a1 + 32));
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:v3 object:0 userInfo:0];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_7(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryUpdatedNotification" object:0 userInfo:v3];
}

uint64_t ___ZL25_xpc_iap2d_handle_messagePU24objcproto13OS_xpc_object8NSObject_block_invoke_8(uint64_t a1)
{
  xpc_object_t v2 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  return [v2 postNotificationName:@"IAPAppAccessoryPortPropertyChangedNotification" object:0 userInfo:v3];
}

void IAPTimeSyncSetParams(unsigned int a1, uint64_t a2, unsigned int a3)
{
  uint64_t v6 = RetainConnectionToIAPDaemonWithConnectionID(a1, 0);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "timeSyncOffsetUncertaintyThresholdStr", a2);
    xpc_dictionary_set_uint64(v8, "timeSyncOffsetMeasurementIntervalStr", a3);
    xpc_dictionary_set_string(v8, "requestType", "timeSyncParamStr");
    uint64_t v9 = IAPAppSendXPCMessageWithTimeout(v7, v8, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v9)
    {
      int v10 = (void *)v9;
      uint64_t v11 = MEMORY[0x1BA9F0E70]();
      if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iaptimesyncset.isa);
      }
      else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iaptimesyncset_0.isa);
      }
      else if (v11 == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_BOOL(v10, "result")) {
          NSLog(&cfstr_ErrorSFailed.isa, "IAPTimeSyncSetParams");
        }
      }
      else if (v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPTimeSyncSetParams", 50);
      }
      else
      {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPTimeSyncSetParams", 54, v11);
      }
      xpc_release(v10);
    }
    else
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPTimeSyncSetParams", 60);
    }
    xpc_release(v8);
    xpc_release(v7);
  }
}

void IAPTimeSyncGetInfo(unsigned int a1, NSObject *a2, uint64_t a3)
{
  uint64_t v6 = (_xpc_connection_s *)RetainConnectionToIAP2Daemon();
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "timeSyncInfoStr");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    dispatch_retain(a2);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __IAPTimeSyncGetInfo_block_invoke;
    v9[3] = &unk_1E62278E0;
    v9[4] = a2;
    void v9[5] = a3;
    IAPAppSendXPCMessageReplyWithTimeout(v7, v8, a2, __IAPAppSendXPCMessageDefaultTimeoutMs, (uint64_t)v9);
    xpc_release(v8);
    xpc_release(v7);
  }
}

void __IAPTimeSyncGetInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = MEMORY[0x1BA9F0E70](a2);
  if (a2 == (void *)MEMORY[0x1E4F14528] && v4 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iaptimesyncget.isa);
  }
  else if (a2 == (void *)MEMORY[0x1E4F14520] && v4 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iaptimesyncget_0.isa);
  }
  else if (v4 == MEMORY[0x1E4F14590])
  {
    if (xpc_dictionary_get_BOOL(a2, "result"))
    {
      xpc_retain(a2);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __IAPTimeSyncGetInfo_block_invoke_2;
      block[3] = &unk_1E62278B8;
      void block[4] = a2;
      dispatch_async(*(dispatch_queue_t *)(a1 + 32), block);
    }
  }
  else if (v4 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_SDUnhandledRep.isa, "IAPTimeSyncGetInfo_block_invoke", 113);
  }
  else
  {
    NSLog(&cfstr_SDUnknownReply.isa, "IAPTimeSyncGetInfo_block_invoke", 117, v4);
  }
}

void __IAPTimeSyncGetInfo_block_invoke_2(uint64_t a1)
{
  xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 32), "timeSyncInfoDictionaryStr");
  xpc_object_t v2 = (const void *)_CFXPCCreateCFObjectFromXPCMessage();
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, const void *))(v3 + 16))(v3, v2);
  }
  if (v2) {
    CFRelease(v2);
  }
  xpc_release(*(xpc_object_t *)(a1 + 32));
  uint64_t v4 = *(NSObject **)(a1 + 40);
  dispatch_release(v4);
}

void IAPTimeSyncResetKalmanFilter(unsigned int a1)
{
  xpc_object_t v2 = RetainConnectionToIAPDaemonWithConnectionID(a1, 0);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    xpc_dictionary_set_string(v4, "requestType", "timeSyncResetKalmanFilterStr");
    uint64_t v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = MEMORY[0x1BA9F0E70]();
      if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iaptimesyncres.isa);
      }
      else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iaptimesyncres_0.isa);
      }
      else if (v7 == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_BOOL(v6, "result")) {
          NSLog(&cfstr_ErrorSFailed.isa, "IAPTimeSyncResetKalmanFilter");
        }
      }
      else if (v7 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPTimeSyncResetKalmanFilter", 156);
      }
      else
      {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPTimeSyncResetKalmanFilter", 160, v7);
      }
      xpc_release(v6);
    }
    else
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPTimeSyncResetKalmanFilter", 166);
    }
    xpc_release(v4);
    xpc_release(v3);
  }
}

uint64_t IAPCameraSendCameraControlMessage(unsigned int a1, uint64_t a2, unsigned int a3)
{
  int v12 = 2;
  uint64_t v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v12);
  if (v6)
  {
    uint64_t v7 = v6;
    if (a3 <= 4)
    {
      xpc_object_t v8 = off_1E6227940[a3];
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_string(v9, "requestType", v8);
      xpc_dictionary_set_uint64(v9, "connectionID", a1);
      int v10 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];
      xpc_dictionary_set_data(v9, "IAPCameraIds", (const void *)[v10 bytes], objc_msgSend(v10, "length"));
      xpc_connection_send_message(v7, v9);
      xpc_release(v9);
    }
    xpc_release(v7);
  }
  return 0;
}

uint64_t IAPCameraSendStartLivePreview(unsigned int a1, uint64_t a2, unsigned int a3)
{
  int v11 = 2;
  uint64_t v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v11);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPCameraSendStartLivePreview");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_object_t v9 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];
    xpc_dictionary_set_data(v8, "IAPCameraIds", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    xpc_dictionary_set_uint64(v8, "IAPCameraLivePreviewFormatIndexStr", a3);
    xpc_connection_send_message(v7, v8);
    xpc_release(v8);
    xpc_release(v7);
  }
  return 0;
}

uint64_t IAPCameraSendStartCameraUpdates(unsigned int a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v15 = 2;
  xpc_object_t v8 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v15);
  if (v8)
  {
    xpc_object_t v9 = v8;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "requestType", "IAPCameraSendStartCameraUpdates");
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    int v11 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0];
    xpc_dictionary_set_data(v10, "IAPCameraIds", (const void *)[v11 bytes], objc_msgSend(v11, "length"));
    int v12 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:0];
    xpc_dictionary_set_data(v10, "IAPCameraProperties", (const void *)[v12 bytes], objc_msgSend(v12, "length"));
    uint64_t v13 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a4 format:200 options:0 error:0];
    xpc_dictionary_set_data(v10, "IAPCameraCapabilities", (const void *)[v13 bytes], objc_msgSend(v13, "length"));
    xpc_connection_send_message(v9, v10);
    xpc_release(v10);
    xpc_release(v9);
  }
  return 0;
}

uint64_t IAPCameraSendSetCameraProperties(unsigned int a1, unsigned int a2, uint64_t a3)
{
  int v11 = 2;
  uint64_t v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v11);
  if (v6)
  {
    uint64_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "requestType", "IAPCameraSendSetCameraProperties");
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "IAPCameraId", a2);
    xpc_object_t v9 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:0];
    xpc_dictionary_set_data(v8, "IAPCameraProperties", (const void *)[v9 bytes], objc_msgSend(v9, "length"));
    xpc_connection_send_message(v7, v8);
    xpc_release(v8);
    xpc_release(v7);
  }
  return 0;
}

BOOL IAPAccessoryEQSelectEqualizerAtIndex(unsigned int a1, unsigned int a2)
{
  if (IAPDHasLaunched())
  {
    xpc_object_t v4 = RetainConnectionToIAPDaemon();
    if (v4)
    {
      uint64_t v5 = v4;
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v6, "connectionID", a1);
      xpc_dictionary_set_uint64(v6, "eqIndex", a2);
      xpc_dictionary_set_string(v6, "requestType", "IAPAccessoryEQSelectEqualizerAtIndex");
      uint64_t v7 = IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
      if (!v7)
      {
        NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAccessoryEQSelectEqualizerAtIndex", 60);
        BOOL v12 = 0;
LABEL_23:
        xpc_release(v6);
        xpc_release(v5);
        return v12;
      }
      xpc_object_t v8 = (void *)v7;
      uint64_t v9 = MEMORY[0x1BA9F0E70]();
      if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iapaccessoryeq.isa);
      }
      else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_Iapaccessoryeq_0.isa);
      }
      else
      {
        if (v9 == MEMORY[0x1E4F14590])
        {
          BOOL v12 = xpc_dictionary_get_BOOL(v8, "result");
          NSLog(&cfstr_Iapaccessoryeq_1.isa, v12);
LABEL_22:
          xpc_release(v8);
          goto LABEL_23;
        }
        if (v9 == MEMORY[0x1E4F145A8]) {
          NSLog(&cfstr_SDUnhandledRep.isa, "IAPAccessoryEQSelectEqualizerAtIndex", 50);
        }
        else {
          NSLog(&cfstr_SDUnknownReply.isa, "IAPAccessoryEQSelectEqualizerAtIndex", 54, v9);
        }
      }
      BOOL v12 = 0;
      goto LABEL_22;
    }
  }
  return 0;
}

uint64_t IAPAudioDeviceStateChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t v5 = +[IAPAudioCallbackInfo sharedInstance];
  return [(IAPAudioCallbackInfo *)v5 _deviceStateChanged:0];
}

uint64_t AccessoryDigitalAudioNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t v5 = +[IAPAudioCallbackInfo sharedInstance];
  return [(IAPAudioCallbackInfo *)v5 _deviceStateChanged:0];
}

uint64_t IAPAudioVolumeChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t v5 = +[IAPAudioCallbackInfo sharedInstance];
  return [(IAPAudioCallbackInfo *)v5 _volumeChanged:0];
}

uint64_t IAPAudioShouldPauseOnHeadphoneDisconnectChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t v5 = +[IAPAudioCallbackInfo sharedInstance];
  return [(IAPAudioCallbackInfo *)v5 _pauseOnHeadphoneDisconnectChanged:0];
}

uint64_t IAPAudioVolumeControlSupportChangedNotificationCallBack(__CFNotificationCenter *a1, void *a2, const __CFString *a3, const void *a4, const __CFDictionary *a5)
{
  uint64_t v5 = +[IAPAudioCallbackInfo sharedInstance];
  return [(IAPAudioCallbackInfo *)v5 _volumeControlSupportChanged:0];
}

uint64_t IAPAudioNotifyOfPlaybackStateChanged()
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"IAPAudioPlaybackStateChangedNotification", 0, 0, 0);
  return 1;
}

uint64_t IAPAudioRegisterDeviceStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] setupDeviceStateChangedCallback:a1 withContext:a2 andRunLoop:a3];

  return 1;
}

uint64_t IAPAudioUnregisterDeviceStateChangedCallback()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] clearDeviceStateChangedCallback];

  return 1;
}

id IAPAudioCopyDeviceStates()
{
  size_t length = 0;
  id v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v0)
  {
    BOOL v1 = v0;
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPAudioCopyDeviceStates");
    uint64_t v3 = IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v3)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioCopyDeviceStates", 378);
      id v8 = 0;
      goto LABEL_19;
    }
    xpc_object_t v4 = (void *)v3;
    uint64_t v5 = MEMORY[0x1BA9F0E70]();
    if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiocopyde.isa);
    }
    else if (v4 == (void *)MEMORY[0x1E4F14520] && v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiocopyde_0.isa);
    }
    else if (v5 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v4, "result"))
      {
        id v11 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        data = xpc_dictionary_get_data(v4, "deviceStates", &length);
        if (data && (uint64_t v13 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length]) != 0)
        {
          id v14 = 0;
          id v8 = (id)[MEMORY[0x1E4F28F98] propertyListWithData:v13 options:0 format:0 error:&v14];
          if (!v8) {
            NSLog(&cfstr_ErrorReceivedB_1.isa, length, [v14 description]);
          }
        }
        else
        {
          id v8 = 0;
        }

        goto LABEL_18;
      }
    }
    else if (v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioCopyDeviceStates", 368);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioCopyDeviceStates", 372, v5);
    }
    id v8 = 0;
LABEL_18:
    xpc_release(v4);
LABEL_19:
    xpc_release(v2);
    xpc_release(v1);
    if (v8) {
      return v8;
    }
  }
  uint64_t v9 = (uint64_t (*)(void))IAPWeakLinkSymbol("ACCAudioCopyDeviceStates", (const void *)6);
  if (!v9 || (id v8 = (id)v9()) == 0)
  {
    NSLog(&cfstr_Iapaudiocopyde_2.isa);
    return 0;
  }
  return v8;
}

uint64_t IAPAudioRegisterVolumeChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] setupVolumeChangedCallback:a1 withContext:a2 andRunLoop:a3];

  return 1;
}

uint64_t IAPAudioUnregisterVolumeChangedCallback()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] clearVolumeChangedCallback];

  return 1;
}

_xpc_connection_s *IAPAudioSetVolume(float a1)
{
  return IAPAudioSetVolumeForTransport(1u, a1);
}

_xpc_connection_s *IAPAudioSetVolumeForTransport(unsigned int a1, float a2)
{
  int v7 = 2;
  uint64_t result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v7);
  if (result)
  {
    uint64_t v5 = result;
    if (!v7)
    {
      xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v6, "transport", a1);
      xpc_dictionary_set_double(v6, "volume", a2);
      xpc_dictionary_set_string(v6, "requestType", "IAPAudioSetVolumeForTransport");
      xpc_connection_send_message(v5, v6);
      xpc_release(v6);
    }
    xpc_release(v5);
    return (_xpc_connection_s *)1;
  }
  return result;
}

uint64_t IAPAudioGetVolume(float *a1)
{
  return IAPAudioGetVolumeForTransport(1u, a1);
}

uint64_t IAPAudioGetVolumeForTransport(unsigned int a1, float *a2)
{
  *a2 = 0.0;
  int v15 = 2;
  xpc_object_t v4 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v15);
  if (v4)
  {
    uint64_t v5 = v4;
    if (v15)
    {
      uint64_t v6 = 1;
LABEL_23:
      xpc_release(v5);
      return v6;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "transport", a1);
    xpc_dictionary_set_string(v7, "requestType", "IAPAudioGetVolumeForTransport");
    uint64_t v8 = IAPAppSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v8)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioGetVolumeForTransport", 510);
      uint64_t v6 = 0;
LABEL_22:
      xpc_release(v7);
      goto LABEL_23;
    }
    uint64_t v9 = (void *)v8;
    uint64_t v10 = MEMORY[0x1BA9F0E70]();
    if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiogetvol.isa);
    }
    else if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiogetvol_0.isa);
    }
    else if (v10 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v9, "result"))
      {
        float v14 = xpc_dictionary_get_double(v9, "volume");
        *a2 = v14;
        uint64_t v6 = 1;
        goto LABEL_21;
      }
    }
    else if (v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioGetVolumeForTransport", 500);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioGetVolumeForTransport", 504, v10);
    }
    uint64_t v6 = 0;
LABEL_21:
    xpc_release(v9);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IAPAudioRegisterShouldPauseAudioOnHeadsetDisconnectChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] setupPauseOnHeadphoneDisconnectChangedCallback:a1 withContext:a2 andRunLoop:a3];

  return 1;
}

uint64_t IAPAudioUnregisterShouldPauseAudioOnHeadsetDisconnectChangedCallback()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] clearPauseOnHeadphoneDisconnectChangedCallback];

  return 1;
}

uint64_t IAPAudioShouldPauseAudioOnHeadsetDisconnect(BOOL *a1)
{
  *a1 = 1;
  int v12 = 2;
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v12)
    {
      uint64_t v4 = 0;
LABEL_23:
      xpc_release(v3);
      return v4;
    }
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioShouldPauseAudioOnHeadsetDisconnect");
    uint64_t v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 588);
      uint64_t v4 = 0;
LABEL_22:
      xpc_release(v5);
      goto LABEL_23;
    }
    xpc_object_t v7 = (void *)v6;
    uint64_t v8 = MEMORY[0x1BA9F0E70]();
    if (v7 == (void *)MEMORY[0x1E4F14528] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudioshould_0.isa);
    }
    else if (v7 == (void *)MEMORY[0x1E4F14520] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudioshould_1.isa);
    }
    else if (v8 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v7, "result"))
      {
        *a1 = xpc_dictionary_get_BOOL(v7, "shouldPause");
        uint64_t v4 = 1;
        goto LABEL_21;
      }
    }
    else if (v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 578);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioShouldPauseAudioOnHeadsetDisconnect", 582, v8);
    }
    uint64_t v4 = 0;
LABEL_21:
    xpc_release(v7);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IAPAudioRegisterVolumeControlSupportChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] setupVolumeControlSupportChangedCallback:a1 withContext:a2 andRunLoop:a3];

  return 1;
}

uint64_t IAPAudioUnregisterVolumeControlSupportChangedCallback()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  [+[IAPAudioCallbackInfo sharedInstance] clearVolumeControlSupportChangedCallback];

  return 1;
}

uint64_t IAPAudioIsVolumeControlSupported(BOOL *a1)
{
  return IAPAudioIsVolumeControlSupportedForTransport(1u, a1);
}

uint64_t IAPAudioIsVolumeControlSupportedForTransport(unsigned int a1, BOOL *a2)
{
  *a2 = 0;
  int v14 = 2;
  uint64_t v4 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v14);
  if (v4)
  {
    xpc_object_t v5 = v4;
    if (v14)
    {
      uint64_t v6 = 1;
LABEL_23:
      xpc_release(v5);
      return v6;
    }
    xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v7, "transport", a1);
    xpc_dictionary_set_string(v7, "requestType", "IAPAudioIsVolumeControlSupportedForTransport");
    uint64_t v8 = IAPAppSendXPCMessageWithTimeout(v5, v7, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v8)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioIsVolumeControlSupportedForTransport", 668);
      uint64_t v6 = 0;
LABEL_22:
      xpc_release(v7);
      goto LABEL_23;
    }
    uint64_t v9 = (void *)v8;
    uint64_t v10 = MEMORY[0x1BA9F0E70]();
    if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudioisvolu.isa);
    }
    else if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudioisvolu_0.isa);
    }
    else if (v10 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v9, "result"))
      {
        *a2 = xpc_dictionary_get_BOOL(v9, "isSupported");
        uint64_t v6 = 1;
        goto LABEL_21;
      }
    }
    else if (v10 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioIsVolumeControlSupportedForTransport", 658);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioIsVolumeControlSupportedForTransport", 662, v10);
    }
    uint64_t v6 = 0;
LABEL_21:
    xpc_release(v9);
    goto LABEL_22;
  }
  return 0;
}

_xpc_connection_s *IAPAudioStartPlayback()
{
  return IAPAudioStartPlaybackForTransport(1u);
}

_xpc_connection_s *IAPAudioStartPlaybackForTransport(unsigned int a1)
{
  int v5 = 2;
  uint64_t result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v5);
  if (result)
  {
    uint64_t v3 = result;
    if (!v5)
    {
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "transport", a1);
      xpc_dictionary_set_string(v4, "requestType", "IAPAudioStartPlaybackForTransport");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
    }
    xpc_release(v3);
    return (_xpc_connection_s *)1;
  }
  return result;
}

_xpc_connection_s *IAPAudioStopPlayback()
{
  return IAPAudioStopPlaybackForTransport(1u);
}

_xpc_connection_s *IAPAudioStopPlaybackForTransport(unsigned int a1)
{
  int v5 = 2;
  uint64_t result = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v5);
  if (result)
  {
    uint64_t v3 = result;
    if (!v5)
    {
      xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v4, "transport", a1);
      xpc_dictionary_set_string(v4, "requestType", "IAPAudioStopPlaybackForTransport");
      xpc_connection_send_message(v3, v4);
      xpc_release(v4);
    }
    xpc_release(v3);
    return (_xpc_connection_s *)1;
  }
  return result;
}

BOOL IAPAudioStartRecording()
{
  return IAPAudioStartRecordingForTransport(1u);
}

BOOL IAPAudioStartRecordingForTransport(unsigned int a1)
{
  int v12 = 2;
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v12)
    {
      BOOL v4 = 1;
LABEL_25:
      xpc_release(v3);
      return v4;
    }
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "transport", a1);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioStartRecordingForTransport");
    uint64_t v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioStartRecordingForTransport", 793);
      BOOL v4 = 0;
LABEL_24:
      xpc_release(v5);
      goto LABEL_25;
    }
    xpc_object_t v7 = (void *)v6;
    uint64_t v8 = MEMORY[0x1BA9F0E70]();
    if (v7 == (void *)MEMORY[0x1E4F14528] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiostartr.isa);
    }
    else if (v7 == (void *)MEMORY[0x1E4F14520] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiostartr_0.isa);
    }
    else
    {
      if (v8 == MEMORY[0x1E4F14590])
      {
        BOOL v4 = xpc_dictionary_get_BOOL(v7, "result");
LABEL_23:
        xpc_release(v7);
        goto LABEL_24;
      }
      if (v8 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioStartRecordingForTransport", 783);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioStartRecordingForTransport", 787, v8);
      }
    }
    BOOL v4 = 0;
    goto LABEL_23;
  }
  return 0;
}

BOOL IAPAudioStopRecording()
{
  return IAPAudioStopRecordingForTransport(1u);
}

BOOL IAPAudioStopRecordingForTransport(unsigned int a1)
{
  int v12 = 2;
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(&v12);
  if (v2)
  {
    uint64_t v3 = v2;
    if (v12)
    {
      BOOL v4 = 1;
LABEL_25:
      xpc_release(v3);
      return v4;
    }
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v5, "transport", a1);
    xpc_dictionary_set_string(v5, "requestType", "IAPAudioStopRecordingForTransport");
    uint64_t v6 = IAPAppSendXPCMessageWithTimeout(v3, v5, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v6)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPAudioStopRecordingForTransport", 856);
      BOOL v4 = 0;
LABEL_24:
      xpc_release(v5);
      goto LABEL_25;
    }
    xpc_object_t v7 = (void *)v6;
    uint64_t v8 = MEMORY[0x1BA9F0E70]();
    if (v7 == (void *)MEMORY[0x1E4F14528] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiostopre.isa);
    }
    else if (v7 == (void *)MEMORY[0x1E4F14520] && v8 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapaudiostopre_0.isa);
    }
    else
    {
      if (v8 == MEMORY[0x1E4F14590])
      {
        BOOL v4 = xpc_dictionary_get_BOOL(v7, "result");
LABEL_23:
        xpc_release(v7);
        goto LABEL_24;
      }
      if (v8 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPAudioStopRecordingForTransport", 846);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPAudioStopRecordingForTransport", 850, v8);
      }
    }
    BOOL v4 = 0;
    goto LABEL_23;
  }
  return 0;
}

uint64_t IAPAudioIsVoiceSignalProcessingEnabled(uint64_t a1, unsigned char *a2)
{
  *a2 = 0;
  return 1;
}

uint64_t IAPAudioEnableVoiceSignalProcessing()
{
  return 1;
}

uint64_t IAPAudioDisableVoiceSignalProcessing()
{
  return 1;
}

void __iap2dServerLaunched()
{
  if (__debugLogEnabled___bNavigationDebug != -1)
  {
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid_3.isa);
LABEL_4:
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"iAP2ServerLaunch" object:0];
}

void __iap2dServerDied()
{
  if (__debugLogEnabled___bNavigationDebug != -1)
  {
    if (!__debugLogEnabled___bNavigationDebug) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  __debugLogEnabled___bNavigationDebug = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
  if (__debugLogEnabled___bNavigationDebug) {
LABEL_3:
  }
    NSLog(&cfstr_NavigationVoid_4.isa);
LABEL_4:
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"iAP2ServerDie" object:0];
}

BOOL __debugLogEnabled()
{
  int AppBooleanValue = __debugLogEnabled___bNavigationDebug;
  if (__debugLogEnabled___bNavigationDebug == -1)
  {
    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"iAP2LogNavigation", @"com.apple.iapd", 0);
    __debugLogEnabled___bNavigationDebug = AppBooleanValue;
  }
  return AppBooleanValue != 0;
}

void *IAPWeakLinkSymbol(const char *a1, const void *a2)
{
  uint64_t result = (void *)__HandleForSource(a2);
  if (result)
  {
    return dlsym(result, a1);
  }
  return result;
}

const void *__HandleForSource(const void *a1)
{
  pthread_mutex_lock(&__HandlesLock);
  CFDictionaryRef Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    CFDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    switch((unint64_t)a1)
    {
      case 0uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"UIKit";
        xpc_object_t v7 = @"UIKit.framework";
        goto LABEL_7;
      case 1uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"MobileCoreServices";
        xpc_object_t v7 = @"MobileCoreServices.framework";
LABEL_7:
        uint64_t v8 = @"Frameworks";
        goto LABEL_14;
      case 2uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"SpringBoardServices";
        xpc_object_t v7 = @"SpringBoardServices.framework";
        goto LABEL_13;
      case 3uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"FrontBoardServices";
        xpc_object_t v7 = @"FrontBoardServices.framework";
        goto LABEL_13;
      case 4uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"CarKit";
        xpc_object_t v7 = @"CarKit.framework";
        goto LABEL_13;
      case 5uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"VisualVoicemail";
        xpc_object_t v7 = @"VisualVoicemail.framework";
        goto LABEL_13;
      case 6uLL:
        BOOL v4 = NSString;
        xpc_object_t v5 = (void *)MEMORY[0x1E4F1C978];
        uint64_t v6 = CPSystemRootDirectory();
        int v12 = @"AccessoryAudio";
        xpc_object_t v7 = @"AccessoryAudio.framework";
LABEL_13:
        uint64_t v8 = @"PrivateFrameworks";
LABEL_14:
        uint64_t v9 = objc_msgSend(v4, "pathWithComponents:", objc_msgSend(v5, "arrayWithObjects:", v6, @"System", @"Library", v8, v7, v12, 0));
        if (!v9) {
          goto LABEL_17;
        }
        uint64_t v10 = dlopen((const char *)[v9 UTF8String], 1);
        if (!v10) {
          goto LABEL_17;
        }
        Value = v10;
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, a1, v10);
        break;
      default:
LABEL_17:
        NSLog(&cfstr_CouldNotLoadSo.isa, a1);
        Value = 0;
        break;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

Class IAPWeakLinkClass(NSString *a1, const void *a2)
{
  Class result = (Class)__HandleForSource(a2);
  if (result)
  {
    return NSClassFromString(a1);
  }
  return result;
}

void *IAPWeakLinkStringConstant(const char *a1, const void *a2)
{
  Class result = (void *)__HandleForSource(a2);
  if (result)
  {
    Class result = dlsym(result, a1);
    if (result) {
      return *(void **)result;
    }
  }
  return result;
}

uint64_t Generate32BitConnectionID()
{
  if (Generate32BitConnectionID_onceToken != -1) {
    dispatch_once(&Generate32BitConnectionID_onceToken, &__block_literal_global_2);
  }
  if (((Generate32BitConnectionID_connectionID + 1) & 0xFFFFFF) != 0) {
    int v0 = Generate32BitConnectionID_connectionID + 1;
  }
  else {
    int v0 = Generate32BitConnectionID_connectionID + 2;
  }
  Generate32BitConnectionID_connectionID = v0;
  BOOL v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B50], "mainBundle"), "bundleIdentifier");
  if (![v1 caseInsensitiveCompare:@"com.apple.iapd"])
  {
    int v3 = Generate32BitConnectionID_connectionID;
    int v4 = 0x1000000;
LABEL_11:
    uint64_t result = v4 & 0xFF000000 | v3 & 0xFFFFFF;
    goto LABEL_12;
  }
  if (![v1 caseInsensitiveCompare:@"com.apple.iap2d"])
  {
    int v3 = Generate32BitConnectionID_connectionID;
    int v4 = 0x2000000;
    goto LABEL_11;
  }
  NSLog(&cfstr_SSUnknownDaemo.isa, "/Library/Caches/com.apple.xbs/Sources/IAPFramework/common/SharedFunctions.m", "Generate32BitConnectionID", v1);
  uint64_t result = Generate32BitConnectionID_connectionID | 0xFF000000;
LABEL_12:
  Generate32BitConnectionID_connectionID = result;
  return result;
}

uint64_t __Generate32BitConnectionID_block_invoke()
{
  uint64_t result = arc4random();
  Generate32BitConnectionID_connectionID = result;
  return result;
}

uint64_t IsAppVisibleInCurrentMode(uint64_t a1)
{
  uint64_t v1 = [NSString stringWithUTF8String:a1];
  Class v2 = IAPWeakLinkClass(&cfstr_Lsapplicationp.isa, (const void *)1);
  Class v3 = IAPWeakLinkClass(&cfstr_Lsapplicationw.isa, (const void *)1);
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (objc_msgSend((id)-[objc_class defaultWorkspace](v3, "defaultWorkspace"), "applicationIsInstalled:", v1))
  {
    uint64_t v4 = [(objc_class *)v2 applicationProxyForIdentifier:v1];
    xpc_object_t v5 = (void *)[(objc_class *)v3 defaultWorkspace];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v8[3] = &unk_1E6227A58;
    v8[4] = v4;
    v8[5] = &v9;
    [v5 enumerateBundlesOfType:4 block:v8];
  }
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

void sub_1BA803378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __IsAppVisibleInCurrentMode_block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t result = [a2 isEqual:*(void *)(a1 + 32)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)) {
    *a3 = 1;
  }
  return result;
}

uint64_t IsExistAppMusic()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
}

uint64_t IsExistAppPodcasts()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
}

uint64_t IsExistAppiBooks()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
}

uint64_t IsExistAppiTunesU()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.itunesu");
}

BOOL ShouldAccessoryBeHidden(uint64_t a1)
{
  Class v2 = (void *)MEMORY[0x1BA9F0A70]();
  Class v3 = (void *)[NSString stringWithCString:a1 encoding:4];
  unint64_t v4 = 0;
  do
  {
    uint64_t v5 = [v3 caseInsensitiveCompare:hiddenAccessoryTable[v4]];
    if (v4 > 0xF) {
      break;
    }
    ++v4;
  }
  while (v5);
  BOOL v6 = v5 == 0;
  return v6;
}

BOOL IsDataAggregationEnabled()
{
  return CFPreferencesGetAppBooleanValue(@"GreenValkyrie", @"com.apple.iaptransportd", 0) != 0;
}

uint64_t IAPDigitalAudioCurrentSampleRate()
{
  NSLog(&cfstr_Iapdigitalaudi.isa);
  int v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (!v0)
  {
    NSLog(&cfstr_Iapdigitalaudi_2.isa);
    NSLog(&cfstr_Iapdigitalaudi_3.isa, 0, 0);
    return 0;
  }
  uint64_t v1 = v0;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioCurrentSampleRate");
  uint64_t v3 = IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
  if (!v3)
  {
    NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioCurrentSampleRate", 70);
    uint64_t uint64 = 0;
    BOOL v9 = 0;
    goto LABEL_22;
  }
  unint64_t v4 = (void *)v3;
  uint64_t v5 = MEMORY[0x1BA9F0E70]();
  if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iapdigitalaudi_0.isa);
LABEL_20:
    uint64_t uint64 = 0;
    BOOL v9 = 0;
    goto LABEL_21;
  }
  if (v4 == (void *)MEMORY[0x1E4F14520] && v5 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iapdigitalaudi_1.isa);
    goto LABEL_20;
  }
  if (v5 != MEMORY[0x1E4F14590])
  {
    if (v5 == MEMORY[0x1E4F145A8]) {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioCurrentSampleRate", 60);
    }
    else {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioCurrentSampleRate", 64, v5);
    }
    goto LABEL_20;
  }
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "sampleRate");
  BOOL v9 = xpc_dictionary_get_BOOL(v4, "result");
LABEL_21:
  xpc_release(v4);
LABEL_22:
  xpc_release(v2);
  xpc_release(v1);
  NSLog(&cfstr_Iapdigitalaudi_3.isa, uint64, v9);
  if (!v9) {
    return 0;
  }
  return uint64;
}

uint64_t IAPDigitalAudioSetSampleRate(uint64_t a1)
{
  NSLog(&cfstr_Iapdigitalaudi_4.isa, a1);
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "inputRate", a1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSetSampleRate");
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioSetSampleRate", 138);
      uint64_t v8 = 0;
      goto LABEL_19;
    }
    BOOL v6 = v5;
    uint64_t v7 = MEMORY[0x1BA9F0E70]();
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_5.isa, v11);
    }
    else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_6.isa, v11);
    }
    else if (v7 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        NSLog(&cfstr_Iapdigitalaudi_7.isa);
        uint64_t v8 = 1;
LABEL_18:
        xpc_release(v6);
LABEL_19:
        xpc_release(v4);
        xpc_release(v3);
        if (v8) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
    }
    else if (v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioSetSampleRate", 128);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioSetSampleRate", 132, v7);
    }
    uint64_t v8 = 0;
    goto LABEL_18;
  }
  uint64_t v8 = 0;
LABEL_20:
  BOOL v9 = (uint64_t (*)(uint64_t))IAPWeakLinkSymbol("ACCDigitalAudioSetSampleRate", (const void *)6);
  if (v9) {
    uint64_t v8 = v9(a1);
  }
  else {
    NSLog(&cfstr_Iapdigitalaudi_9.isa);
  }
LABEL_23:
  NSLog(&cfstr_Iapdigitalaudi_10.isa, a1, v8);
  return v8;
}

uint64_t IAPDigitalAudioSupportedSampleRate(uint64_t a1)
{
  NSLog(&cfstr_Iapdigitalaudi_11.isa, a1);
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "inputRate", a1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSupportedSampleRate");
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioSupportedSampleRate", 222);
      uint64_t uint64 = 0;
      unsigned int v8 = 0;
      goto LABEL_19;
    }
    BOOL v6 = v5;
    uint64_t v7 = MEMORY[0x1BA9F0E70]();
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_12.isa, v13);
    }
    else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_13.isa, v13);
    }
    else if (v7 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v6, "outputRate");
        NSLog(&cfstr_Iapdigitalaudi_14.isa);
        unsigned int v8 = 1;
LABEL_18:
        xpc_release(v6);
LABEL_19:
        xpc_release(v4);
        xpc_release(v3);
        if (v8) {
          goto LABEL_23;
        }
        goto LABEL_20;
      }
    }
    else if (v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioSupportedSampleRate", 212);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioSupportedSampleRate", 216, v7);
    }
    uint64_t uint64 = 0;
    unsigned int v8 = 0;
    goto LABEL_18;
  }
  unsigned int v8 = 0;
  uint64_t uint64 = 0;
LABEL_20:
  uint64_t v10 = (uint64_t (*)(uint64_t))IAPWeakLinkSymbol("ACCDigitalAudioSupportedSampleRate", (const void *)6);
  if (v10)
  {
    uint64_t v11 = v10(a1);
    NSLog(&cfstr_Iapdigitalaudi_17.isa, a1, v11, 1);
    return v11;
  }
  NSLog(&cfstr_Iapdigitalaudi_16.isa);
LABEL_23:
  NSLog(&cfstr_Iapdigitalaudi_17.isa, a1, uint64, v8);
  if (v8) {
    return uint64;
  }
  else {
    return 0;
  }
}

BOOL IAPDigitalAudioSetVolumeOffset(uint64_t a1)
{
  unsigned int v1 = a1;
  NSLog(&cfstr_Iapdigitalaudi_18.isa, a1);
  xpc_object_t v2 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v2)
  {
    uint64_t v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v4, "offset", v1);
    xpc_dictionary_set_string(v4, "requestType", "IAPDigitalAudioSetVolumeOffset");
    xpc_object_t v5 = xpc_connection_send_message_with_reply_sync(v3, v4);
    if (!v5)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioSetVolumeOffset", 296);
      BOOL v8 = 0;
LABEL_18:
      xpc_release(v4);
      xpc_release(v3);
      goto LABEL_19;
    }
    BOOL v6 = v5;
    uint64_t v7 = MEMORY[0x1BA9F0E70]();
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_19.isa, v10);
    }
    else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_20.isa, v10);
    }
    else
    {
      if (v7 == MEMORY[0x1E4F14590])
      {
        BOOL v8 = xpc_dictionary_get_BOOL(v6, "result");
LABEL_17:
        xpc_release(v6);
        goto LABEL_18;
      }
      if (v7 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioSetVolumeOffset", 286);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioSetVolumeOffset", 290, v7);
      }
    }
    BOOL v8 = 0;
    goto LABEL_17;
  }
  NSLog(&cfstr_Iapdigitalaudi_22.isa);
  BOOL v8 = 0;
LABEL_19:
  NSLog(&cfstr_Iapdigitalaudi_23.isa, v8);
  return v8;
}

uint64_t IAPDigitalAudioGetVideoDelay()
{
  NSLog(&cfstr_Iapdigitalaudi_24.isa);
  int v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (!v0)
  {
    NSLog(&cfstr_Iapdigitalaudi_27.isa);
    NSLog(&cfstr_Iapdigitalaudi_28.isa, 0, 0);
    return 0;
  }
  unsigned int v1 = v0;
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioGetVideoDelay");
  xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v1, v2);
  if (!v3)
  {
    NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioGetVideoDelay", 354);
    uint64_t uint64 = 0;
    unsigned int v7 = 0;
    goto LABEL_19;
  }
  xpc_object_t v4 = v3;
  uint64_t v5 = MEMORY[0x1BA9F0E70]();
  if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iapdigitalaudi_25.isa);
    goto LABEL_17;
  }
  if (v4 == (void *)MEMORY[0x1E4F14520] && v5 == MEMORY[0x1E4F145A8])
  {
    NSLog(&cfstr_Iapdigitalaudi_26.isa);
    goto LABEL_17;
  }
  if (v5 != MEMORY[0x1E4F14590])
  {
    if (v5 == MEMORY[0x1E4F145A8]) {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioGetVideoDelay", 344);
    }
    else {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioGetVideoDelay", 348, v5);
    }
    goto LABEL_17;
  }
  if (!xpc_dictionary_get_BOOL(v4, "result"))
  {
LABEL_17:
    uint64_t uint64 = 0;
    unsigned int v7 = 0;
    goto LABEL_18;
  }
  unsigned int v7 = 1;
  uint64_t uint64 = xpc_dictionary_get_uint64(v4, "videoDelay");
LABEL_18:
  xpc_release(v4);
LABEL_19:
  xpc_release(v2);
  xpc_release(v1);
  NSLog(&cfstr_Iapdigitalaudi_28.isa, uint64, v7);
  if (!v7) {
    return 0;
  }
  return uint64;
}

CFMutableArrayRef IAPDigitalAudioCopySupportSampleRates()
{
  int valuePtr = 0;
  size_t length = 0;
  NSLog(&cfstr_Iapdigitalaudi_29.isa);
  int v0 = RetainConnectionToIAPDaemonOwningPhysicalConnector(0);
  if (v0)
  {
    unsigned int v1 = v0;
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPDigitalAudioCopySupportSampleRates");
    xpc_object_t v3 = xpc_connection_send_message_with_reply_sync(v1, v2);
    if (!v3)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "IAPDigitalAudioCopySupportSampleRates", 443);
      CFMutableArrayRef Mutable = 0;
      goto LABEL_26;
    }
    xpc_object_t v4 = v3;
    uint64_t v5 = MEMORY[0x1BA9F0E70]();
    if (v4 == (void *)MEMORY[0x1E4F14528] && v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_30.isa);
    }
    else if (v4 == (void *)MEMORY[0x1E4F14520] && v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapdigitalaudi_31.isa);
    }
    else if (v5 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v4, "result"))
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        data = xpc_dictionary_get_data(v4, "sampleRates", &length);
        if (data)
        {
          BOOL v9 = (__CFArray *)[MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
          CFMutableArrayRef Mutable = v9;
          if (v9)
          {
            uint64_t v10 = (int *)[(__CFArray *)v9 bytes];
            unint64_t v11 = [(__CFArray *)Mutable length];
            CFAllocatorRef v12 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
            CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v11 >> 2, MEMORY[0x1E4F1D510]);
            if (v11 >= 4)
            {
              if (v11 >> 2 <= 1) {
                uint64_t v13 = 1;
              }
              else {
                uint64_t v13 = v11 >> 2;
              }
              do
              {
                int v14 = *v10++;
                int valuePtr = v14;
                CFNumberRef v15 = CFNumberCreate(v12, kCFNumberIntType, &valuePtr);
                CFArrayAppendValue(Mutable, v15);
                CFRelease(v15);
                --v13;
              }
              while (v13);
            }
          }
        }
        else
        {
          CFMutableArrayRef Mutable = 0;
        }

        goto LABEL_25;
      }
      NSLog(&cfstr_Iapdigitalaudi_32.isa);
    }
    else if (v5 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_SDUnhandledRep.isa, "IAPDigitalAudioCopySupportSampleRates", 433);
    }
    else
    {
      NSLog(&cfstr_SDUnknownReply.isa, "IAPDigitalAudioCopySupportSampleRates", 437, v5);
    }
    CFMutableArrayRef Mutable = 0;
LABEL_25:
    xpc_release(v4);
LABEL_26:
    xpc_release(v2);
    xpc_release(v1);
    if (Mutable) {
      goto LABEL_30;
    }
  }
  uint64_t v16 = (uint64_t (*)(void))IAPWeakLinkSymbol("ACCDigitalAudioCopySupportSampleRates", (const void *)6);
  if (!v16 || (CFMutableArrayRef Mutable = (CFMutableArrayRef)v16()) == 0)
  {
    NSLog(&cfstr_Iapdigitalaudi_33.isa);
    CFMutableArrayRef Mutable = 0;
  }
LABEL_30:
  NSLog(&cfstr_Iapdigitalaudi_34.isa, Mutable);
  return Mutable;
}

uint64_t IAPLocationIsActivated(unsigned char *a1)
{
  *a1 = __isLocationActivated;
  return 1;
}

uint64_t IAPLocationIsNMEADataAvailable(uint64_t a1, BOOL *a2)
{
  *a2 = 0;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationIsNMEADataAvailable");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      BOOL v8 = v7;
      uint64_t v9 = MEMORY[0x1BA9F0E70]();
      if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_1.isa);
      }
      else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_2.isa);
      }
      else if (v9 == MEMORY[0x1E4F14590])
      {
        if (xpc_dictionary_get_BOOL(v8, "result")) {
          *a2 = xpc_dictionary_get_BOOL(v8, "isAvailable");
        }
        else {
          NSLog(&cfstr_LocationErrorS.isa, "IAPLocationIsNMEADataAvailable");
        }
      }
      else if (v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationIsNMEADataAvailable", 193);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationIsNMEADataAvailable", 197, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationIsNMEADataAvailable", 203);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_3.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationCopyNMEAData(uint64_t a1, const char **a2)
{
  if (*a2) {
    [MEMORY[0x1E4F1CA00] raise:@"IAPCopyNMEAException" format:@"nmea must be NULL"];
  }
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationCopyNMEAData");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      BOOL v8 = v7;
      uint64_t v9 = MEMORY[0x1BA9F0E70]();
      if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_3.isa);
      }
      else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_4.isa);
      }
      else if (v9 == MEMORY[0x1E4F14590])
      {
        if (xpc_dictionary_get_BOOL(v8, "result"))
        {
          string = xpc_dictionary_get_string(v8, "sentence");
          if (string)
          {
            unint64_t v11 = string;
            string = (const char *)[[NSString alloc] initWithUTF8String:string];
          }
          else
          {
            unint64_t v11 = "<nil>";
          }
          *a2 = string;
          NSLog(&cfstr_LocationIaploc_5.isa, v11);
        }
        else
        {
          NSLog(&cfstr_LocationErrorS.isa, "IAPLocationCopyNMEAData");
        }
      }
      else if (v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationCopyNMEAData", 260);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationCopyNMEAData", 264, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationCopyNMEAData", 270);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_4.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationCopyEphemerisURL(uint64_t a1, void *a2)
{
  if (*a2) {
    [MEMORY[0x1E4F1CA00] raise:@"IAPCopyEphemerisException" format:@"ephemerisURL must be NULL"];
  }
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationCopyEphemerisURL");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (v7)
    {
      BOOL v8 = v7;
      uint64_t v9 = MEMORY[0x1BA9F0E70]();
      if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_6.isa);
      }
      else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_7.isa);
      }
      else if (v9 == MEMORY[0x1E4F14590])
      {
        if (xpc_dictionary_get_BOOL(v8, "result"))
        {
          string = xpc_dictionary_get_string(v8, "urlString");
          if (string)
          {
            unint64_t v11 = (void *)[[NSString alloc] initWithUTF8String:string];
            CFAllocatorRef v12 = v11;
            if (v11 && [v11 length]) {
              *a2 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v12];
            }
          }
          NSLog(&cfstr_LocationIaploc_8.isa, string);
        }
        else
        {
          NSLog(&cfstr_LocationErrorS.isa, "IAPLocationCopyEphemerisURL");
        }
      }
      else if (v9 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationCopyEphemerisURL", 334);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationCopyEphemerisURL", 338, v9);
      }
      xpc_release(v8);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationCopyEphemerisURL", 344);
    }
    xpc_release(v6);
    xpc_release(v5);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_5.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationGetEphemerisMaxInterval(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationGetEphemerisMaxInterval");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationGetEphemerisMaxInterval", 401);
      uint64_t v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    BOOL v8 = v7;
    uint64_t v9 = MEMORY[0x1BA9F0E70]();
    if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_9.isa);
    }
    else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_10.isa);
    }
    else if (v9 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_uint64(v8, "maxInterval");
        uint64_t v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(&cfstr_LocationErrorS.isa, "IAPLocationGetEphemerisMaxInterval");
    }
    else if (v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationGetEphemerisMaxInterval", 391);
    }
    else
    {
      NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationGetEphemerisMaxInterval", 395, v9);
    }
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  NSLog(&cfstr_LocationSkipIa_6.isa, a1);
  return 0;
}

uint64_t IAPLocationGetEphemerisRecommendedRefreshInterval(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationGetEphemerisRecommendedRefreshInterval");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationGetEphemerisRecommendedRefreshInterval", 458);
      uint64_t v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    BOOL v8 = v7;
    uint64_t v9 = MEMORY[0x1BA9F0E70]();
    if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_11.isa);
    }
    else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_12.isa);
    }
    else if (v9 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_uint64(v8, "refreshInterval");
        uint64_t v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(&cfstr_LocationErrorS.isa, "IAPLocationGetEphemerisRecommendedRefreshInterval");
    }
    else if (v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationGetEphemerisRecommendedRefreshInterval", 448);
    }
    else
    {
      NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationGetEphemerisRecommendedRefreshInterval", 452, v9);
    }
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  NSLog(&cfstr_LocationSkipIa_7.isa, a1);
  return 0;
}

uint64_t IAPLocationIsNMEAFilteringSupported(uint64_t a1, BOOL *a2)
{
  *a2 = 0;
  xpc_object_t v4 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_string(v6, "requestType", "IAPLocationIsNMEAFilteringSupported");
    xpc_object_t v7 = xpc_connection_send_message_with_reply_sync(v5, v6);
    if (!v7)
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationIsNMEAFilteringSupported", 515);
      uint64_t v10 = 0;
LABEL_20:
      xpc_release(v6);
      xpc_release(v5);
      return v10;
    }
    BOOL v8 = v7;
    uint64_t v9 = MEMORY[0x1BA9F0E70]();
    if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_13.isa);
    }
    else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationIaploc_14.isa);
    }
    else if (v9 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v8, "result"))
      {
        *a2 = xpc_dictionary_get_BOOL(v8, "isNMEAFilteringSupported");
        uint64_t v10 = 1;
LABEL_19:
        xpc_release(v8);
        goto LABEL_20;
      }
      NSLog(&cfstr_LocationErrorS.isa, "IAPLocationIsNMEAFilteringSupported");
    }
    else if (v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationIsNMEAFilteringSupported", 505);
    }
    else
    {
      NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationIsNMEAFilteringSupported", 509, v9);
    }
    uint64_t v10 = 0;
    goto LABEL_19;
  }
  NSLog(&cfstr_LocationSkipIa_8.isa, a1);
  return 0;
}

uint64_t IAPlocationSetAccessoryNMEAFilter(uint64_t a1, uint64_t a2)
{
  if (a2
    && (uint64_t v3 = [MEMORY[0x1E4F28F98] dataWithPropertyList:a2 format:200 options:0 error:0]) != 0)
  {
    xpc_object_t v4 = (void *)v3;
    uint64_t v5 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
    if (v5)
    {
      xpc_object_t v6 = v5;
      xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_uint64(v7, "connectionID", a1);
      xpc_dictionary_set_data(v7, "nmeaFilter", (const void *)[v4 bytes], objc_msgSend(v4, "length"));
      xpc_dictionary_set_string(v7, "requestType", "IAPLocationSetAccessoryNMEAFilter");
      xpc_object_t v8 = xpc_connection_send_message_with_reply_sync(v6, v7);
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = MEMORY[0x1BA9F0E70]();
        if (v9 == (void *)MEMORY[0x1E4F14528] && v10 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationIaploc_15.isa);
        }
        else if (v9 == (void *)MEMORY[0x1E4F14520] && v10 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationIaploc_16.isa);
        }
        else if (v10 == MEMORY[0x1E4F14590])
        {
          if (!xpc_dictionary_get_BOOL(v9, "result")) {
            NSLog(&cfstr_LocationErrorS.isa, "IAPlocationSetAccessoryNMEAFilter");
          }
        }
        else if (v10 == MEMORY[0x1E4F145A8])
        {
          NSLog(&cfstr_LocationSDUnha.isa, "IAPlocationSetAccessoryNMEAFilter", 565);
        }
        else
        {
          NSLog(&cfstr_LocationSDUnkn.isa, "IAPlocationSetAccessoryNMEAFilter", 569, v10);
        }
        xpc_release(v9);
      }
      else
      {
        NSLog(&cfstr_LocationSDNoRe.isa, "IAPlocationSetAccessoryNMEAFilter", 575);
      }
      xpc_release(v7);
      xpc_release(v6);
    }
    else
    {
      NSLog(&cfstr_LocationSkipIa_9.isa, a1);
    }
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_10.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationSendGPSTime(uint64_t a1, unsigned int a2, double a3)
{
  xpc_object_t v6 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v6)
  {
    xpc_object_t v7 = v6;
    xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v8, "connectionID", a1);
    xpc_dictionary_set_uint64(v8, "gpsWeek", a2);
    xpc_dictionary_set_double(v8, "gpsTOWInSeconds", a3);
    xpc_dictionary_set_string(v8, "requestType", "IAPLocationSendGPSTime");
    xpc_object_t v9 = xpc_connection_send_message_with_reply_sync(v7, v8);
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = MEMORY[0x1BA9F0E70]();
      if (v10 == (void *)MEMORY[0x1E4F14528] && v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_17.isa);
      }
      else if (v10 == (void *)MEMORY[0x1E4F14520] && v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_18.isa);
      }
      else if (v11 == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_BOOL(v10, "result")) {
          NSLog(&cfstr_LocationErrorS.isa, "IAPLocationSendGPSTime");
        }
      }
      else if (v11 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationSendGPSTime", 624);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationSendGPSTime", 628, v11);
      }
      xpc_release(v10);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationSendGPSTime", 634);
    }
    xpc_release(v8);
    xpc_release(v7);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_11.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationSendEphemerisPointData(uint64_t a1, unsigned int a2, unsigned int a3, double a4, double a5, double a6)
{
  CFAllocatorRef v12 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v12)
  {
    uint64_t v13 = v12;
    xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v14, "connectionID", a1);
    xpc_dictionary_set_uint64(v14, "gpsWeek", a2);
    xpc_dictionary_set_double(v14, "gpsTOWInSeconds", a4);
    xpc_dictionary_set_double(v14, "latitude", a5);
    xpc_dictionary_set_double(v14, "longitude", a6);
    xpc_dictionary_set_uint64(v14, "accuracyInMeters", a3);
    xpc_dictionary_set_string(v14, "requestType", "IAPLocationSendEphemerisPointData");
    xpc_object_t v15 = xpc_connection_send_message_with_reply_sync(v13, v14);
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = MEMORY[0x1BA9F0E70]();
      if (v16 == (void *)MEMORY[0x1E4F14528] && v17 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_19.isa);
      }
      else if (v16 == (void *)MEMORY[0x1E4F14520] && v17 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_20.isa);
      }
      else if (v17 == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_BOOL(v16, "result")) {
          NSLog(&cfstr_LocationErrorS.isa, "IAPLocationSendEphemerisPointData");
        }
      }
      else if (v17 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationSendEphemerisPointData", 681);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationSendEphemerisPointData", 685, v17);
      }
      xpc_release(v16);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationSendEphemerisPointData", 691);
    }
    xpc_release(v14);
    xpc_release(v13);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_12.isa, a1);
  }
  return 1;
}

uint64_t IAPLocationSendEphemeris(uint64_t a1, const void *a2)
{
  if (a2)
  {
    CFDataRef Data = CFPropertyListCreateData(0, a2, kCFPropertyListXMLFormat_v1_0, 0, 0);
    if (Data)
    {
      CFDataRef v4 = Data;
      uint64_t v5 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
      if (v5)
      {
        xpc_object_t v6 = v5;
        xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_uint64(v7, "connectionID", a1);
        BytePtr = CFDataGetBytePtr(v4);
        size_t Length = CFDataGetLength(v4);
        xpc_dictionary_set_data(v7, "ephemerisData", BytePtr, Length);
        xpc_dictionary_set_string(v7, "requestType", "IAPLocationSendEphemeris");
        xpc_object_t v10 = xpc_connection_send_message_with_reply_sync(v6, v7);
        if (v10)
        {
          uint64_t v11 = v10;
          uint64_t v12 = MEMORY[0x1BA9F0E70]();
          if (v11 == (void *)MEMORY[0x1E4F14528] && v12 == MEMORY[0x1E4F145A8])
          {
            NSLog(&cfstr_LocationIaploc_21.isa);
          }
          else if (v11 == (void *)MEMORY[0x1E4F14520] && v12 == MEMORY[0x1E4F145A8])
          {
            NSLog(&cfstr_LocationIaploc_22.isa);
          }
          else if (v12 == MEMORY[0x1E4F14590])
          {
            if (!xpc_dictionary_get_BOOL(v11, "result")) {
              NSLog(&cfstr_LocationErrorS.isa, "IAPLocationSendEphemeris");
            }
          }
          else if (v12 == MEMORY[0x1E4F145A8])
          {
            NSLog(&cfstr_LocationSDUnha.isa, "IAPLocationSendEphemeris", 740);
          }
          else
          {
            NSLog(&cfstr_LocationSDUnkn.isa, "IAPLocationSendEphemeris", 744, v12);
          }
          xpc_release(v11);
        }
        else
        {
          NSLog(&cfstr_LocationSDNoRe.isa, "IAPLocationSendEphemeris", 750);
        }
        xpc_release(v7);
        xpc_release(v6);
      }
      else
      {
        NSLog(&cfstr_LocationSkipIa_13.isa, a1);
      }
      CFRelease(v4);
    }
    else
    {
      NSLog(&cfstr_LocationSkipIa_14.isa, a1);
    }
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_15.isa, a1);
  }
  return 1;
}

uint64_t IAPlocationSendGPRMCDataStatusValues(uint64_t a1, BOOL a2, BOOL a3, BOOL a4)
{
  xpc_object_t v8 = (_xpc_connection_s *)RetainConnectionToIAPDOnlyWithConnectionID(a1, 0);
  if (v8)
  {
    xpc_object_t v9 = v8;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueA", a2);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueV", a3);
    xpc_dictionary_set_BOOL(v10, "IAPLocationGPRMCDataStatusValueX", a4);
    xpc_dictionary_set_string(v10, "requestType", "IAPLocationSendGPRMCDataStatusValues");
    xpc_object_t v11 = xpc_connection_send_message_with_reply_sync(v9, v10);
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = MEMORY[0x1BA9F0E70]();
      if (v12 == (void *)MEMORY[0x1E4F14528] && v13 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_15.isa);
      }
      else if (v12 == (void *)MEMORY[0x1E4F14520] && v13 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationIaploc_16.isa);
      }
      else if (v13 == MEMORY[0x1E4F14590])
      {
        if (!xpc_dictionary_get_BOOL(v12, "result")) {
          NSLog(&cfstr_LocationErrorS.isa, "IAPlocationSendGPRMCDataStatusValues");
        }
      }
      else if (v13 == MEMORY[0x1E4F145A8])
      {
        NSLog(&cfstr_LocationSDUnha.isa, "IAPlocationSendGPRMCDataStatusValues", 807);
      }
      else
      {
        NSLog(&cfstr_LocationSDUnkn.isa, "IAPlocationSendGPRMCDataStatusValues", 811, v13);
      }
      xpc_release(v12);
    }
    else
    {
      NSLog(&cfstr_LocationSDNoRe.isa, "IAPlocationSendGPRMCDataStatusValues", 817);
    }
    xpc_release(v10);
    xpc_release(v9);
  }
  else
  {
    NSLog(&cfstr_LocationSkipIa_16.isa, a1);
  }
  return 1;
}

uint64_t __iaptransportdDied()
{
  int v0 = +[IAPClientPortManager sharedInstance];
  return [(IAPClientPortManager *)v0 setIaptransportdIsRunning:0];
}

uint64_t __iaptransportdLaunched()
{
  int v0 = +[IAPClientPortManager sharedInstance];
  [(IAPClientPortManager *)v0 setIaptransportdIsRunning:1];
  return [(IAPClientPortManager *)v0 reRegisterHandlers];
}

void sub_1BA806188(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t IAPClientPortRegisterSendDataHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = +[IAPClientPortManager sharedInstance];
  return [(IAPClientPortManager *)v6 registerSendDataHandler:a1 queue:a2 sendBlock:a3];
}

uint64_t IAPClientPortDataReceivedHandler(uint64_t a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v6 = +[IAPClientPortManager sharedInstance];
  return [(IAPClientPortManager *)v6 forwardAccessoryDataToIAP:a1 data:a2 length:a3];
}

uint64_t IAPBluetoothDeviceMode(const __CFData *a1)
{
  xpc_object_t v2 = RetainConnectionToIAPDaemon();
  unsigned int v3 = _IAPBluetoothDeviceMode(a1, (uint64_t)v2);
  if (v2) {
    xpc_release(v2);
  }
  CFDataRef v4 = RetainConnectionToIAP2Daemon();
  unsigned int v5 = _IAPBluetoothDeviceMode(a1, (uint64_t)v4);
  if (v4) {
    xpc_release(v4);
  }
  if (v5) {
    unsigned int v6 = 0;
  }
  else {
    unsigned int v6 = v3;
  }
  if (!v3) {
    unsigned int v6 = v5;
  }
  if (v3 == v5) {
    return v3;
  }
  else {
    return v6;
  }
}

uint64_t _IAPBluetoothDeviceMode(const __CFData *a1, uint64_t a2)
{
  if (a2)
  {
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceMode");
    BytePtr = CFDataGetBytePtr(a1);
    size_t Length = CFDataGetLength(a1);
    xpc_dictionary_set_data(v4, "MACAddress", BytePtr, Length);
    uint64_t v7 = IAPAppSendXPCMessageWithTimeout(a2, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v7)
    {
      NSLog(&cfstr_SDNoReplyRecei.isa, "_IAPBluetoothDeviceMode", 126);
      uint64_t v12 = 0;
LABEL_24:
      xpc_release(v4);
      return v12;
    }
    xpc_object_t v8 = (void *)v7;
    uint64_t v9 = MEMORY[0x1BA9F0E70]();
    if (v8 == (void *)MEMORY[0x1E4F14528] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapbluetoothde_8.isa);
    }
    else if (v8 == (void *)MEMORY[0x1E4F14520] && v9 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Iapbluetoothde_9.isa);
    }
    else
    {
      if (v9 == MEMORY[0x1E4F14590])
      {
        uint64_t uint64 = xpc_dictionary_get_uint64(v8, "result");
        if (uint64 - 1 >= 2) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = uint64;
        }
        goto LABEL_23;
      }
      if (v9 == MEMORY[0x1E4F145A8]) {
        NSLog(&cfstr_SDUnhandledRep.isa, "_IAPBluetoothDeviceMode", 116);
      }
      else {
        NSLog(&cfstr_SDUnknownReply.isa, "_IAPBluetoothDeviceMode", 120, v9);
      }
    }
    uint64_t v12 = 0;
LABEL_23:
    xpc_release(v8);
    goto LABEL_24;
  }
  return 0;
}

void IAPBluetoothDeviceGetAccessoryConnectNotification()
{
  syslog(3, "%s OBSOLETE FUNCTION: Please use IAPAppConnectedAccessories and iterate through array\n of accessory dictionaries looking for one with IAPAppBTPairingIsSupported key", "IAPBluetoothDeviceGetAccessoryConnectNotification");
  int v0 = RetainConnectionToIAP2Daemon();
  if (v0)
  {
    uint64_t v1 = v0;
    xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "requestType", "IAPBluetoothDeviceGetAccessoryConnectNotification");
    unsigned int v3 = (void *)IAPAppSendXPCMessageWithTimeout(v1, v2, __IAPAppSendXPCMessageDefaultTimeoutMs);
    IAPBluetoothXPCHandleReply("IAPBluetoothDeviceGetAccessoryConnectNotification", v3);
    xpc_release(v1);
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceGetAccessoryConnectNotification");
  }
}

uint64_t IAPBluetoothXPCHandleReply(const char *a1, void *a2)
{
  if (a2)
  {
    uint64_t v4 = MEMORY[0x1BA9F0E70](a2);
    if (v4 == MEMORY[0x1E4F14590])
    {
      uint64_t uint64 = xpc_dictionary_get_uint64(a2, "result");
    }
    else
    {
      if (v4 == MEMORY[0x1E4F145A8])
      {
        if (a2 == (void *)MEMORY[0x1E4F14520]) {
          unsigned int v6 = "XPC_ERROR_CONNECTION_INTERRUPTED";
        }
        else {
          unsigned int v6 = "XPC ERROR UNKNOWN";
        }
        if (a2 == (void *)MEMORY[0x1E4F14528]) {
          uint64_t v7 = "XPC_ERROR_CONNECTION_INVALID";
        }
        else {
          uint64_t v7 = v6;
        }
        syslog(4, "%s XPC connection failure cause:[%s]\n", a1, v7);
      }
      else
      {
        NSLog(&cfstr_SDUnknownReply.isa, "IAPBluetoothXPCHandleReply", 579, v4);
      }
      uint64_t uint64 = 0;
    }
    xpc_release(a2);
  }
  else
  {
    syslog(3, "%s ERROR: [%s] pXpcReply = NULL !\n", "IAPBluetoothXPCHandleReply", a1);
    return 0;
  }
  return uint64;
}

uint64_t IAPBluetoothDeviceAllocAccessoryPairingInfo(uint64_t a1)
{
  v22[5] = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    unsigned int v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceGetAccessoryPairingInfo");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    uint64_t v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v5)
    {
      syslog(3, "%s xpc_connection_send_message_with_reply_sync returned pXpcReply = NULL !\n", "IAPBluetoothDeviceAllocAccessoryPairingInfo");
      goto LABEL_7;
    }
    unsigned int v6 = (void *)v5;
    if (MEMORY[0x1BA9F0E70]() != MEMORY[0x1E4F14590])
    {
      IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAllocAccessoryPairingInfo", v6);
LABEL_7:
      uint64_t v7 = 0;
LABEL_14:
      xpc_release(v4);
      xpc_release(v3);
      return v7;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v6, "connectionID");
    string = xpc_dictionary_get_string(v6, "btInfoAccessoryMfg");
    xpc_object_t v10 = xpc_dictionary_get_string(v6, "btInfoAccessoryModel");
    size_t v19 = 0;
    size_t length = 0;
    data = xpc_dictionary_get_data(v6, "btInfoPairUUID", &length);
    uint64_t v12 = xpc_dictionary_get_data(v6, "btInfoPairTypes", &v19);
    uint64_t v13 = [NSNumber numberWithUnsignedInt:uint64];
    if (string)
    {
      xpc_object_t v14 = (__CFString *)[NSString stringWithCString:string encoding:4];
      if (v10)
      {
LABEL_10:
        xpc_object_t v15 = (__CFString *)[NSString stringWithCString:v10 encoding:4];
LABEL_13:
        uint64_t v16 = [MEMORY[0x1E4F1C9B8] dataWithBytes:data length:length];
        uint64_t v17 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v12 length:v19];
        v21[0] = @"IAPAppBTPairingConnectionIDKey";
        v21[1] = @"IAPAppBTPairingAccManufacturer";
        v22[0] = v13;
        v22[1] = v14;
        v21[2] = @"IAPAppBTPairingAccModel";
        v21[3] = @"IAPAppBTPairingUUIDKey";
        v22[2] = v15;
        v22[3] = v16;
        v21[4] = @"IAPAppBTPairingTypesSupportedKey";
        v22[4] = v17;
        uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:5];
        xpc_release(v6);
        goto LABEL_14;
      }
    }
    else
    {
      xpc_object_t v14 = &stru_1F142DC90;
      if (v10) {
        goto LABEL_10;
      }
    }
    xpc_object_t v15 = &stru_1F142DC90;
    goto LABEL_13;
  }
  syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAllocAccessoryPairingInfo");
  return 0;
}

uint64_t IAPBluetoothDeviceStartBLEUpdates(uint64_t a1, unsigned int a2, BOOL a3, BOOL a4)
{
  xpc_object_t v8 = RetainConnectionToIAP2Daemon();
  if (v8)
  {
    uint64_t v9 = v8;
    xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v10, "requestType", "IAPBluetoothDeviceStartBLEUpdates");
    xpc_dictionary_set_uint64(v10, "connectionID", a1);
    xpc_dictionary_set_uint64(v10, "btParmPairType", a2);
    xpc_dictionary_set_BOOL(v10, "btParmUpdatesRadio", a3);
    xpc_dictionary_set_BOOL(v10, "btParmUpdatesPairInfo", a4);
    xpc_object_t v11 = (void *)IAPAppSendXPCMessageWithTimeout(v9, v10, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v12 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStartBLEUpdates", v11);
    xpc_release(v10);
    xpc_release(v9);
    return v12;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStartBLEUpdates");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceStateUpdate(uint64_t a1, BOOL a2, unsigned int a3, BOOL a4, BOOL a5)
{
  xpc_object_t v10 = RetainConnectionToIAP2Daemon();
  if (v10)
  {
    xpc_object_t v11 = v10;
    xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v12, "requestType", "IAPBluetoothDeviceStateUpdate");
    xpc_dictionary_set_uint64(v12, "connectionID", a1);
    xpc_dictionary_set_uint64(v12, "btParmPairStatus", a3);
    xpc_dictionary_set_BOOL(v12, "btParmRadioOn", a2);
    xpc_dictionary_set_BOOL(v12, "btParmPairModeOn", a4);
    xpc_dictionary_set_BOOL(v12, "bParmForceUpdates", a5);
    uint64_t v13 = (void *)IAPAppSendXPCMessageWithTimeout(v11, v12, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v14 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStateUpdate", v13);
    xpc_release(v12);
    xpc_release(v11);
    return v14;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStateUpdate");
    return 19;
  }
}

uint64_t IAPBluetoothDevicePairingData(uint64_t a1, void *a2)
{
  xpc_object_t v4 = RetainConnectionToIAP2Daemon();
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPBluetoothDevicePairingData");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_data(v6, "btParmPairData", (const void *)[a2 bytes], objc_msgSend(a2, "length"));
    uint64_t v7 = (void *)IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v8 = IAPBluetoothXPCHandleReply("IAPBluetoothDevicePairingData", v7);
    xpc_release(v6);
    xpc_release(v5);
    return v8;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDevicePairingData");
    return 19;
  }
}

uint64_t IAPBluetoothDevicePairingInfoUpdate(uint64_t a1, void *a2)
{
  xpc_object_t v4 = RetainConnectionToIAP2Daemon();
  if (v4)
  {
    uint64_t v5 = v4;
    xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v6, "requestType", "IAPBluetoothDevicePairingInfoUpdate");
    xpc_dictionary_set_uint64(v6, "connectionID", a1);
    xpc_dictionary_set_data(v6, "btParmPairInfo", (const void *)[a2 bytes], objc_msgSend(a2, "length"));
    uint64_t v7 = (void *)IAPAppSendXPCMessageWithTimeout(v5, v6, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v8 = IAPBluetoothXPCHandleReply("IAPBluetoothDevicePairingInfoUpdate", v7);
    xpc_release(v6);
    xpc_release(v5);
    return v8;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDevicePairingInfoUpdate");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceStopBLEUpdates(uint64_t a1)
{
  xpc_object_t v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    unsigned int v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPBluetoothDeviceStopBLEUpdates");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    uint64_t v5 = (void *)IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v6 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceStopBLEUpdates", v5);
    xpc_release(v4);
    xpc_release(v3);
    return v6;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceStopBLEUpdates");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceAccessoryAttach(uint64_t a1, const void *a2, const char *a3, const char *a4, const char *a5, const char *a6, const char *a7, const char *a8)
{
  uint64_t v16 = RetainConnectionToIAP2Daemon();
  if (v16)
  {
    uint64_t v17 = v16;
    xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v18, "requestType", "BTAccessoryAttachNotification");
    xpc_dictionary_set_uint64(v18, "BTAccessoryAttachDeviceId", a1);
    xpc_dictionary_set_data(v18, "BTAccessoryAttachMacAddress", a2, 6uLL);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccModel", a3);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccName", a4);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccMfr", a5);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccSerial", a6);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccFwVersion", a7);
    xpc_dictionary_set_string(v18, "BTAccessoryAttachAccHwVersion", a8);
    xpc_dictionary_set_BOOL(v18, "BTAccessoryAttachState", 1);
    size_t v19 = (void *)IAPAppSendXPCMessageWithTimeout(v17, v18, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v20 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAccessoryAttach", v19);
    xpc_release(v18);
    xpc_release(v17);
    return v20;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAccessoryAttach");
    return 19;
  }
}

uint64_t IAPBluetoothDeviceAccessoryDetach(uint64_t a1)
{
  xpc_object_t v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    unsigned int v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "BTAccessoryAttachNotification");
    xpc_dictionary_set_uint64(v4, "BTAccessoryAttachDeviceId", a1);
    xpc_dictionary_set_BOOL(v4, "BTAccessoryAttachState", 0);
    uint64_t v5 = (void *)IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    uint64_t v6 = IAPBluetoothXPCHandleReply("IAPBluetoothDeviceAccessoryDetach", v5);
    xpc_release(v4);
    xpc_release(v3);
    return v6;
  }
  else
  {
    syslog(3, "%s ERROR: piAP2XpcConn = NULL !\n", "IAPBluetoothDeviceAccessoryDetach");
    return 19;
  }
}

void IAPAppRequestAccessoryWiFiCredentials(unsigned int a1)
{
  int v6 = 2;
  xpc_object_t v2 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v6);
  if (v2)
  {
    unsigned int v3 = v2;
    xpc_object_t v4 = (void *)MEMORY[0x1BA9F0A70]();
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v5, "requestType", "IAPRequestAccessoryWiFiCredentials");
    xpc_dictionary_set_uint64(v5, "connectionID", a1);
    xpc_connection_send_message(v3, v5);
    xpc_release(v5);
    xpc_release(v3);
  }
}

void IAPAppSendDeviceIdentifierNotification(unsigned int a1, const char *a2, const char *a3)
{
  int v10 = 2;
  int v6 = (_xpc_connection_s *)RetainConnectionToIAPDaemonWithConnectionID(a1, &v10);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = (void *)MEMORY[0x1BA9F0A70]();
    xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v9, "requestType", "kXPCIAPSendDeviceTransportIdentifier");
    xpc_dictionary_set_uint64(v9, "connectionID", a1);
    xpc_dictionary_set_string(v9, "kXPCDeviceBluetoothTransportIdentifierStr", a2);
    xpc_dictionary_set_string(v9, "kXPCDeviceUSBTransportIdentifier", a3);
    xpc_connection_send_message(v7, v9);
    xpc_release(v9);
    xpc_release(v7);
  }
}

uint64_t IAPGetVehicleStatus(uint64_t a1)
{
  NSLog(&cfstr_Vehicleinfosta.isa, a1);
  xpc_object_t v2 = RetainConnectionToIAP2Daemon();
  if (v2)
  {
    unsigned int v3 = v2;
    xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v4, "requestType", "IAPVehicleStatusGetData");
    xpc_dictionary_set_uint64(v4, "connectionID", a1);
    uint64_t v5 = IAPAppSendXPCMessageWithTimeout(v3, v4, __IAPAppSendXPCMessageDefaultTimeoutMs);
    if (!v5)
    {
      NSLog(&cfstr_Vehicleinfosta_4.isa, "IAPGetVehicleStatus", 69);
      uint64_t v10 = 0;
LABEL_20:
      xpc_release(v4);
      xpc_release(v3);
      return v10;
    }
    int v6 = (void *)v5;
    uint64_t v7 = MEMORY[0x1BA9F0E70]();
    if (v6 == (void *)MEMORY[0x1E4F14528] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Vehicleinfosta_0.isa, v13);
    }
    else if (v6 == (void *)MEMORY[0x1E4F14520] && v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Vehicleinfosta_1.isa, v13);
    }
    else if (v7 == MEMORY[0x1E4F14590])
    {
      if (xpc_dictionary_get_BOOL(v6, "result"))
      {
        id v12 = objc_alloc_init(MEMORY[0x1E4F28B28]);
        xpc_dictionary_get_value(v6, "IAPVehicleStatusDictionary");
        uint64_t v10 = _CFXPCCreateCFObjectFromXPCMessage();

        goto LABEL_19;
      }
    }
    else if (v7 == MEMORY[0x1E4F145A8])
    {
      NSLog(&cfstr_Vehicleinfosta_2.isa, "IAPGetVehicleStatus", 59);
    }
    else
    {
      NSLog(&cfstr_Vehicleinfosta_3.isa, "IAPGetVehicleStatus", 63, v7);
    }
    uint64_t v10 = 0;
LABEL_19:
    xpc_release(v6);
    goto LABEL_20;
  }
  NSLog(&cfstr_Vehicleinfosta_5.isa, a1);
  return 0;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1F40D7190](allocator, capacity, callBacks);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1F40D7830](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1F40D7850](theData);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40D7998](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1F40D7A10](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1F40D7C68](allocator, *(void *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortSetInvalidationCallBack(CFMachPortRef port, CFMachPortInvalidationCallBack callout)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D08]();
}

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1F40D7D20]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1F40D7D80](allocator, theType, valuePtr);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1F40D7EE0](key, applicationID, keyExistsAndHasValidFormat);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1F40D7F18](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1F40D8510](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1F40D8520](theString, *(void *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1F40D8578](theString);
}

uint64_t CPSystemRootDirectory()
{
  return MEMORY[0x1F4109900]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1F411CA28]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1F40E7010](aClassName);
}

void NSLog(NSString *format, ...)
{
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1F40C9A70](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1F40D9428]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x1F40CA3A8]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA548](*(void *)&bp, service_name, sp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1F40CBDB8](__path, *(void *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1F40CBDC8](__handle, __symbol);
}

void free(void *a1)
{
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1F40CC9B8](*(void *)&task, *(void *)&name);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB98](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1F40CCD20](__b, *(void *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1F40CD028](*(void *)&token);
}

uint32_t notify_check(int token, int *check)
{
  return MEMORY[0x1F40CD038](*(void *)&token, check);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1F40CD040](*(void *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1F40CD058](name, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1F40CD088](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1F4181748](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA98](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1F40CE1B0](__dst, __source, __size);
}

void syslog(int a1, const char *a2, ...)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  MEMORY[0x1F40CEEB8](xdict, key);
  return result;
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1F40CF248](object);
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1F40CF2C8](xstring);
}