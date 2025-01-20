@interface BTServiceCallback
@end

@implementation BTServiceCallback

void ___BTServiceCallback_block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _btDeviceGetMACAddress:*(void *)(a1 + 40)];
  if ([*(id *)(a1 + 32) pairingStarted])
  {
    v3 = [*(id *)(a1 + 32) macAddr];
    v4 = v3;
    if (v3) {
      BOOL v5 = v2 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5)
    {
    }
    else
    {
      v6 = [*(id *)(a1 + 32) macAddr];
      unsigned int v7 = [v6 isEqualToData:v2];

      if (v7)
      {
        [*(id *)(a1 + 32) setPairingStarted:0];
        [*(id *)(a1 + 32) setPairingResult:*(_DWORD *)(a1 + 48) == 0];
        [*(id *)(a1 + 32) setPairingResultValid:1];
        [*(id *)(a1 + 32) setMacAddr:0];
        if (gLogObjects && gNumLogObjects >= 6)
        {
          v8 = *(id *)(gLogObjects + 40);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[ServiceDelegate listener:shouldAcceptNewConnection:]();
          }
          v8 = &_os_log_default;
          id v13 = &_os_log_default;
        }
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          unsigned int v14 = [*(id *)(a1 + 32) pairingResult];
          int v21 = 67109120;
          LODWORD(v22) = v14;
          _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "_BTServiceCallback: BT_SERVICE_CONNECT: pairing started, result=%d, call completionHandler if available", (uint8_t *)&v21, 8u);
        }

        v15 = [*(id *)(a1 + 32) pairingCompletionHandler];

        if (v15)
        {
          v16 = [*(id *)(a1 + 32) pairingCompletionHandler];
          ((void (**)(void, id))v16)[2](v16, [*(id *)(a1 + 32) pairingResult]);

          [*(id *)(a1 + 32) setPairingCompletionHandler:0];
        }
        if (gLogObjects && gNumLogObjects >= 6)
        {
          v17 = *(id *)(gLogObjects + 40);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
            -[ServiceDelegate listener:shouldAcceptNewConnection:]();
          }
          v17 = &_os_log_default;
          id v18 = &_os_log_default;
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          v19 = "fail";
          int v20 = *(_DWORD *)(a1 + 52);
          if (!*(_DWORD *)(a1 + 48)) {
            v19 = "success";
          }
          int v21 = 136315394;
          v22 = v19;
          __int16 v23 = 1024;
          int v24 = v20;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "_BTServiceCallback: Pairing %s! disconnect BT device. service 0x%x", (uint8_t *)&v21, 0x12u);
        }

        BTDeviceDisconnect();
        goto LABEL_23;
      }
    }
  }
  if (gLogObjects) {
    BOOL v9 = gNumLogObjects < 6;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      -[ServiceDelegate listener:shouldAcceptNewConnection:]();
    }
    v11 = &_os_log_default;
    id v10 = &_os_log_default;
  }
  else
  {
    v11 = *(id *)(gLogObjects + 40);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = *(_DWORD *)(a1 + 52);
    int v21 = 67109120;
    LODWORD(v22) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "_BTServiceCallback: BT_SERVICE_CONNECT: pairing not started or not expected macAddr, ignore. service 0x%x", (uint8_t *)&v21, 8u);
  }

LABEL_23:
}

@end