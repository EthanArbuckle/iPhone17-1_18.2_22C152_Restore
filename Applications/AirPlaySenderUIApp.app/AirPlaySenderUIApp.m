void sub_100002F3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002F54(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002F64(uint64_t a1)
{
}

void sub_100002F6C(uint64_t a1)
{
  id v36 = objc_alloc_init((Class)NSMutableSet);
  if (dword_10001E9D8 <= 30 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v2 = *(void *)(a1 + 32);
    [*(id *)(a1 + 40) availableOutputDevices];
    v34 = uint64_t v32 = v2;
    LogPrintF();
  }
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  [*(id *)(a1 + 40) availableOutputDevices:v32, v34];
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v45;
    CFStringRef v6 = @"IsDiscoveredWithBroker";
    do
    {
      v7 = 0;
      id v37 = v4;
      do
      {
        if (*(void *)v45 != v5) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v44 + 1) + 8 * (void)v7);
        v9 = [v8 deviceID:v33, v35];
        unsigned int v10 = [v9 isEqualToString:*(void *)(a1 + 48)];

        v11 = [v8 airPlayProperties];
        v12 = [v11 objectForKeyedSubscript:v6];

        if (v12)
        {
          if (*(void *)(*(void *)(a1 + 32) + 48))
          {
            id v13 = objc_alloc((Class)IRCandidate);
            [v8 deviceID];
            uint64_t v14 = v5;
            v16 = CFStringRef v15 = v6;
            id v17 = [v13 initWithCandidateIdentifier:v16];

            id v18 = objc_alloc_init((Class)IRNode);
            v19 = [v8 deviceID];
            [v18 setAvOutpuDeviceIdentifier:v19];

            v20 = +[NSSet setWithObject:v18];
            [v17 updateNodes:v20];

            id v21 = objc_alloc((Class)IRMediaEvent);
            if (v10) {
              uint64_t v22 = 9;
            }
            else {
              uint64_t v22 = 10;
            }
            id v23 = [v21 initWithEventType:v22 eventSubType:0];
            uint64_t v24 = *(void *)(a1 + 32);
            v25 = *(NSObject **)(v24 + 24);
            block[0] = _NSConcreteStackBlock;
            block[1] = 3221225472;
            block[2] = sub_100003400;
            block[3] = &unk_1000184D0;
            block[4] = v24;
            id v42 = v23;
            id v43 = v17;
            id v26 = v17;
            id v27 = v23;
            dispatch_async(v25, block);
            [v36 addObject:v26];

            CFStringRef v6 = v15;
            uint64_t v5 = v14;
            id v4 = v37;
          }
          if (v10 && !*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
          {
            if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
            {
              uint64_t v28 = *(void *)(a1 + 32);
              CFStringRef v29 = *(const __CFString **)(a1 + 48);
              if (v29)
              {
                if (IsAppleInternalBuild()) {
                  CFStringRef v29 = *(const __CFString **)(a1 + 48);
                }
                else {
                  CFStringRef v29 = @"#Redacted#";
                }
              }
              uint64_t v33 = v28;
              CFStringRef v35 = v29;
              LogPrintF();
            }
            objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v8);
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 56));
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v4 != v7);
      id v4 = [obj countByEnumeratingWithState:&v44 objects:v48 count:16];
    }
    while (v4);
  }

  if ([v36 count])
  {
    uint64_t v30 = *(void *)(a1 + 32);
    v31 = *(NSObject **)(v30 + 24);
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1000034D0;
    v39[3] = &unk_1000184F8;
    v39[4] = v30;
    id v40 = v36;
    dispatch_async(v31, v39);
  }
}

void *sub_100003400(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = result;
    if (dword_10001E9D8 <= 30)
    {
      if (dword_10001E9D8 != -1 || (int v3 = _LogCategory_Initialize(), v1 = v2[4], v3))
      {
        LogPrintF();
        uint64_t v1 = v2[4];
      }
    }
    id v4 = *(void **)(v1 + 48);
    uint64_t v5 = v2[5];
    uint64_t v6 = v2[6];
    return [v4 addEvent:v5 forCandidate:v6];
  }
  return result;
}

void *sub_1000034D0(void *result)
{
  uint64_t v1 = result[4];
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = result;
    if (dword_10001E9D8 <= 30)
    {
      if (dword_10001E9D8 != -1 || (int v3 = _LogCategory_Initialize(), v1 = v2[4], v3))
      {
        [(id)v2[5] count];
        LogPrintF();
        uint64_t v1 = v2[4];
      }
    }
    id v4 = *(void **)(v1 + 48);
    uint64_t v5 = v2[5];
    return [v4 updateCandidates:v5];
  }
  return result;
}

void sub_1000035B0(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6727 userInfo:0];
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

id sub_1000037B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pickRouteWithID:*(void *)(a1 + 40) authString:*(void *)(a1 + 48) useRemoteControl:*(unsigned __int8 *)(a1 + 64) completion:*(void *)(a1 + 56)];
}

void sub_1000039E0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 status];
  if (v4 == (id)2)
  {
    if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = [*(id *)(a1 + 40) deviceID];
      if (v5 && !IsAppleInternalBuild())
      {
        LogPrintF();
      }
      else
      {
        id v18 = [*(id *)(a1 + 40) deviceID];
        LogPrintF();
      }
    }
    int v10 = 0;
  }
  else
  {
    if (dword_10001E9D8 <= 90 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      v7 = [*(id *)(a1 + 40) deviceID];
      if (v7 && !IsAppleInternalBuild())
      {
        int v9 = 0;
        v8 = @"#Redacted#";
      }
      else
      {
        v8 = [*(id *)(a1 + 40) deviceID];
        int v9 = 1;
      }
      id v11 = [v3 status];
      [v3 cancellationReason];
      v20 = id v19 = v11;
      uint64_t v16 = v6;
      id v17 = v8;
      LogPrintF();

      if (v9) {
    }
      }
    v12 = [v3 cancellationReason:v16, v17, v19, v20];
    unsigned int v13 = [v12 isEqualToString:AVOutputContextDestinationChangeCancellationReasonAuthorizationSkipped];

    if (v13) {
      int v10 = -6754;
    }
    else {
      int v10 = -6700;
    }
  }
  uint64_t v14 = *(void **)(a1 + 48);
  if (v14)
  {
    CFStringRef v15 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100003C8C;
    block[3] = &unk_100018598;
    id v22 = v14;
    BOOL v24 = v4 == (id)2;
    int v23 = v10;
    dispatch_async(v15, block);
  }
}

void sub_100003C8C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    BOOL v3 = v2 != 0;
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, id))(v1 + 16))(v1, v3, v6);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, BOOL, void))(v1 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, v2 != 0, 0);
  }
}

void sub_100003E8C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      id v11 = [*(id *)(a1 + 40) deviceID];
      if (v11 && !IsAppleInternalBuild())
      {
        uint64_t v17 = v10;
        id v18 = @"#Redacted#";
        LogPrintF();
      }
      else
      {
        [*(id *)(a1 + 40) deviceID];
        uint64_t v17 = v10;
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }
    int v14 = 0;
  }
  else
  {
    if (dword_10001E9D8 <= 90 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      unsigned int v13 = [*(id *)(a1 + 40) deviceID];
      if (v13 && !IsAppleInternalBuild())
      {
        id v19 = v8;
        id v20 = v9;
        uint64_t v17 = v12;
        id v18 = @"#Redacted#";
        LogPrintF();
      }
      else
      {
        [*(id *)(a1 + 40) deviceID];
        id v19 = v8;
        id v20 = v9;
        uint64_t v17 = v12;
        id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }
    if ([v9 isEqualToString:AVOutputDeviceCommunicationChannelOpenCancellationReasonAuthorizationSkipped v17, v18, v19, v20])int v14 = -6754; {
    else
    }
      int v14 = -6700;
  }
  [v7 close:v17, v18];
  CFStringRef v15 = *(void **)(a1 + 48);
  if (v15)
  {
    uint64_t v16 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004134;
    block[3] = &unk_100018598;
    id v22 = v15;
    BOOL v24 = v7 != 0;
    int v23 = v14;
    dispatch_async(v16, block);
  }
}

void sub_100004134(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = *(unsigned __int8 *)(a1 + 44);
  if (*(_DWORD *)(a1 + 40))
  {
    BOOL v3 = v2 != 0;
    +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSOSStatusErrorDomain);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, BOOL, id))(v1 + 16))(v1, v3, v6);
  }
  else
  {
    id v4 = *(void (**)(uint64_t, BOOL, void))(v1 + 16);
    uint64_t v5 = *(void *)(a1 + 32);
    v4(v5, v2 != 0, 0);
  }
}

void sub_1000045A8(uint64_t a1)
{
  int v2 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v3 = dispatch_time(0, 30000000000);
  intptr_t v4 = dispatch_semaphore_wait(v2, v3);
  id v14 = *(id *)(a1 + 32);
  objc_sync_enter(v14);
  if (dword_10001E9D8 <= 50 && (dword_10001E9D8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = "timed out waiting for";
    if (!v4) {
      id v6 = "received";
    }
    uint64_t v12 = v6;
    uint64_t v13 = *(void *)(v5 + 40);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(v5 + 48);
    LogPrintF();
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v4 || *(void *)(v7 + 40))
  {
    [*(id *)(v7 + 48) setDelegate:0 v10, v11, v12, v13];
    [*(id *)(*(void *)(a1 + 32) + 48) invalidate];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 48);
    *(void *)(v8 + 48) = 0;
  }
  objc_sync_exit(v14);
}

void sub_1000046E0(_Unwind_Exception *a1)
{
  objc_sync_exit(*(id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_100004B98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 48);
  if (v3)
  {
    id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v3 userInfo:0];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v7, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v6 = *(void *)(a1 + 40);
    v5(v6, 0, v4);
  }
}

void sub_100004D18(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  uint64_t v3 = v2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4) {
    [v2 setObject:v4 forKeyedSubscript:@"BrokerGroupID"];
  }
  uint64_t v5 = *(void **)(a1 + 40);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100004DF4;
  v6[3] = &unk_100018660;
  v6[4] = v5;
  id v7 = *(id *)(a1 + 48);
  [v5 _sendBrokerRequest:@"GetInfo" params:v3 timeout:4 completion:v6];
}

id sub_100004DF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleGetInfoResponse:a4 requestUUID:a2 error:a3 completion:*(void *)(a1 + 40)];
}

void sub_100005080(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(int *)(a1 + 48);
  if (v3)
  {
    id v7 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v3 userInfo:0];
    (*(void (**)(uint64_t, id, void))(v2 + 16))(v2, v7, *(void *)(a1 + 32));
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void (**)(uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v6 = *(void *)(a1 + 40);
    v5(v6, 0, v4);
  }
}

void sub_100005220(uint64_t a1)
{
  uint64_t v2 = +[NSMutableDictionary dictionary];
  [v2 setObject:*(void *)(a1 + 32) forKeyedSubscript:@"BrokerAuthString"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    [v2 setObject:v3 forKeyedSubscript:@"BrokerGroupID"];
  }
  uint64_t v4 = *(void **)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000530C;
  v5[3] = &unk_100018660;
  v5[4] = v4;
  id v6 = *(id *)(a1 + 56);
  [v4 _sendBrokerRequest:@"Authenticate" params:v2 timeout:25 completion:v5];
}

id sub_10000530C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return [*(id *)(a1 + 32) _handleAuthenticationResponse:a4 requestUUID:a2 error:a3 completion:*(void *)(a1 + 40)];
}

void sub_100005418(uint64_t a1)
{
  uint64_t v2 = +[NSUUID UUID];
  uint64_t v3 = [v2 UUIDString];

  uint64_t v4 = objc_opt_new();
  id v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  [*(id *)(*(void *)(a1 + 32) + 24) setObject:v4 forKeyedSubscript:v3];
  objc_sync_exit(v5);

  id v6 = *(void **)(a1 + 40);
  if (v6)
  {
    id v7 = [v6 mutableCopy];
  }
  else
  {
    id v7 = +[NSMutableDictionary dictionary];
  }
  uint64_t v8 = v7;
  [v7 setObject:*(void *)(a1 + 48) forKeyedSubscript:@"RequestType"];
  [v8 setObject:v3 forKeyedSubscript:@"RequestUUID"];
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(a1 + 48);
    uint64_t v23 = IsAppleInternalBuild() == 0;
    BOOL v24 = v8;
    uint64_t v20 = v9;
    id v21 = v10;
    id v22 = v3;
    LogPrintF();
  }
  uint64_t v11 = APSXPCClientSendCommandCreatingReply();
  if (dword_10001EB68 <= 50 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
  {
    id v21 = *(void **)(a1 + 48);
    id v22 = (void *)v11;
    uint64_t v20 = *(void *)(a1 + 32);
    LogPrintF();
  }
  if (v11)
  {
    APSLogErrorAt();
  }
  else
  {
    uint64_t v12 = [v4 semaphore];
    dispatch_time_t v13 = dispatch_time(0, 1000000000 * *(void *)(a1 + 64));
    intptr_t v14 = dispatch_semaphore_wait(v12, v13);

    if (v14)
    {
      if (dword_10001EB68 <= 90 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
      {
        id v22 = v3;
        uint64_t v23 = *(void *)(a1 + 64);
        uint64_t v20 = *(void *)(a1 + 32);
        id v21 = *(void **)(a1 + 48);
        LogPrintF();
      }
      uint64_t v11 = 4294960574;
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  id v15 = *(id *)(a1 + 32);
  objc_sync_enter(v15);
  if (v11 || !v4)
  {
    if (dword_10001EB68 <= 90 && (dword_10001EB68 != -1 || _LogCategory_Initialize()))
    {
      id v21 = v3;
      id v22 = (void *)v11;
      uint64_t v20 = *(void *)(a1 + 32);
      LogPrintF();
    }
    uint64_t v17 = 0;
  }
  else
  {
    id v16 = v4;
    objc_sync_enter(v16);
    LODWORD(v11) = [v16 status];
    uint64_t v17 = [v16 response];
    objc_sync_exit(v16);
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:v3 v20 v21 v22 v23 v24];
  objc_sync_exit(v15);

  id v18 = *(void **)(a1 + 56);
  if (v18)
  {
    id v19 = *(NSObject **)(*(void *)(a1 + 32) + 16);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100005874;
    block[3] = &unk_1000186D8;
    id v28 = v18;
    id v26 = v3;
    int v29 = v11;
    id v27 = v17;
    dispatch_async(v19, block);
  }
}

void sub_10000584C(_Unwind_Exception *a1)
{
  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100005874(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(int *)(a1 + 56);
  if (v4)
  {
    id v8 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:v4 userInfo:0];
    (*(void (**)(uint64_t, uint64_t, id, void))(v2 + 16))(v2, v3, v8, *(void *)(a1 + 40));
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v6 = *(void (**)(uint64_t, uint64_t, void, uint64_t))(v2 + 16);
    uint64_t v7 = *(void *)(a1 + 48);
    v6(v7, v3, 0, v5);
  }
}

void sub_100005C00(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100005CC4()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = (void *)qword_10001F050;
  qword_10001F050 = v0;

  return _APSXPCClientAddEventHandler(@"com.apple.airplay.discoverybroker", @"BrokerResponse", sub_100005D20);
}

uint64_t sub_100005D20(__CFString *a1, uint64_t a2)
{
  uint64_t v4 = +[APUIBrokerHelper sharedInstance];
  uint64_t v5 = (void *)v4;
  uint64_t v7 = (void *)v4;
  if (a1 == @"BrokerResponse" || a1 && (uint64_t v4 = CFEqual(a1, @"BrokerResponse"), v5 = v7, v4))
  {
    uint64_t v4 = (uint64_t)[v5 _handleBrokerResponse:a2];
LABEL_5:
    uint64_t v5 = v7;
    goto LABEL_10;
  }
  if (dword_10001EB68 <= 90)
  {
    if (dword_10001EB68 != -1 || (uint64_t v4 = _LogCategory_Initialize(), v5 = v7, v4))
    {
      uint64_t v4 = LogPrintF();
      goto LABEL_5;
    }
  }
LABEL_10:

  return _objc_release_x1(v4, v5);
}

uint64_t sub_100006304(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1000066B4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

void sub_100007120(id a1)
{
  if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

void sub_100007490(uint64_t a1)
{
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  dispatch_time_t v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  id v15 = sub_10000771C;
  id v16 = &unk_1000187D8;
  objc_copyWeak(&v18, &location);
  uint64_t v4 = v2;
  uint64_t v17 = v4;
  [v3 setEventHandler:&v13];
  dispatch_time_t v5 = dispatch_time(0, 10000000000);
  if (dispatch_semaphore_wait(v4, v5))
  {
    if (dword_10001ED08 <= 90 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = 10;
      LogPrintF();
    }
    NSErrorUserInfoKey v20 = NSLocalizedDescriptionKey;
    uint64_t v7 = +[NSBundle mainBundle];
    id v8 = [v7 localizedStringForKey:@"WiFi has no valid IP" value:&stru_100018E60 table:0];
    id v21 = v8;
    uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v6 = +[NSError errorWithDomain:@"UserErrorDomain" code:301028 userInfo:v9];
  }
  else
  {
    id v6 = 0;
  }
  uint64_t v10 = *(void *)(a1 + 40);
  if (v10) {
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v6);
  }

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void sub_1000076F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10000771C(uint64_t a1, void *a2)
{
  id v36 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = WeakRetained[4];
    id v6 = [v36 type];
    if (v6 == (id)19)
    {
      id v15 = [v5 IPv4Addresses];
      if (![v15 count])
      {

LABEL_43:
        goto LABEL_44;
      }
      id v16 = [v5 IPv4SubnetMasks];
      id v17 = [v16 count];

      if (!v17) {
        goto LABEL_43;
      }
      id v18 = [v5 IPv4Addresses];
      id v19 = [v18 objectAtIndexedSubscript:0];
      NSErrorUserInfoKey v20 = [v5 IPv4SubnetMasks];
      id v21 = [v20 objectAtIndexedSubscript:0];
      unsigned int v22 = [v19 isValidIPv4AddressWithSubnetMask:v21];

      if (!v22) {
        goto LABEL_43;
      }
      if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = [v5 IPv4Addresses];
        BOOL v24 = [v23 objectAtIndexedSubscript:0];
        if (v24 && !IsAppleInternalBuild())
        {
          int v25 = 0;
          CFStringRef v35 = @"#Redacted#";
        }
        else
        {
          v34 = [v5 IPv4Addresses];
          CFStringRef v35 = [v34 objectAtIndexedSubscript:0];
          int v25 = 1;
        }
        int v29 = [v5 IPv4SubnetMasks];
        uint64_t v30 = [v29 objectAtIndexedSubscript:0];
        if (v30 && !IsAppleInternalBuild())
        {
          LogPrintF();
        }
        else
        {
          v31 = [v5 IPv4SubnetMasks];
          uint64_t v33 = [v31 objectAtIndexedSubscript:0];
          LogPrintF();
        }
        if (v25)
        {
        }
      }
    }
    else
    {
      if (v6 != (id)20) {
        goto LABEL_43;
      }
      uint64_t v7 = [v5 IPv6Addresses];
      id v8 = [v7 count];

      if (!v8) {
        goto LABEL_43;
      }
      unint64_t v9 = 0;
      while (1)
      {
        uint64_t v10 = [v5 IPv6Addresses];
        uint64_t v11 = [v10 objectAtIndexedSubscript:v9];
        unsigned int v12 = [v11 isValidIPv6Address];

        if (v12) {
          break;
        }
        ++v9;
        dispatch_time_t v13 = [v5 IPv6Addresses];
        id v14 = [v13 count];

        if (v9 >= (unint64_t)v14) {
          goto LABEL_43;
        }
      }
      if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
      {
        id v26 = [v5 IPv6Addresses];
        id v27 = [v26 objectAtIndexedSubscript:v9];
        if (v27 && !IsAppleInternalBuild())
        {
          LogPrintF();
        }
        else
        {
          id v28 = [v5 IPv6Addresses];
          uint64_t v32 = [v28 objectAtIndexedSubscript:v9];
          LogPrintF();
        }
      }
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    goto LABEL_43;
  }
  if (dword_10001ED08 <= 60 && (dword_10001ED08 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_44:
}

void sub_100008100(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ([(__CFString *)v6 count])
  {
    if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = a1[4];
      id v8 = [(__CFString *)v6 count];
      if (v6 && !IsAppleInternalBuild()) {
        CFStringRef v9 = @"#Redacted#";
      }
      else {
        CFStringRef v9 = v6;
      }
      id v20 = v8;
      CFStringRef v21 = v9;
      uint64_t v19 = v7;
      LogPrintF();
    }
    id v15 = (void *)a1[4];
    uint64_t v16 = a1[5];
    uint64_t v17 = a1[6];
    id v18 = -[__CFString objectAtIndexedSubscript:](v6, "objectAtIndexedSubscript:", 0, v19, v20, v21);
    [v15 _associateWithNetworkWithPassPhrase:v16 captivePortalAuthToken:v17 scanResults:v18 completion:a1[7]];

    id v10 = 0;
  }
  else
  {
    if (v5)
    {
      id v10 = v5;
    }
    else
    {
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      uint64_t v11 = +[NSBundle mainBundle];
      unsigned int v12 = [v11 localizedStringForKey:@"No results found in WiFi scan" value:&stru_100018E60 table:0];
      uint64_t v23 = v12;
      dispatch_time_t v13 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      id v10 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-6700 userInfo:v13];
    }
    uint64_t v14 = a1[7];
    if (v14) {
      (*(void (**)(uint64_t, void, id))(v14 + 16))(v14, 0, v10);
    }
  }
}

void sub_100008494(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = [v3 localizedDescription];
      LogPrintF();
    }
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, void, id))(v10 + 16))(v10, 0, v3);
    }
  }
  else
  {
    uint64_t v4 = *(void **)(a1 + 32);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008730;
    v16[3] = &unk_100018850;
    v16[4] = v4;
    id v17 = *(id *)(a1 + 40);
    [v4 _monitorWiFiIPAddressConfigurationWithCompletion:v16];
    [*(id *)(a1 + 32) _startMonitoringWiFiEvents];
    id v5 = [*(id *)(*(void *)(a1 + 32) + 32) currentKnownNetworkProfile];
    if (dword_10001ED08 <= 50 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      uint64_t v7 = [v5 networkName];
      if (v7 && !IsAppleInternalBuild())
      {
        int v9 = 0;
        id v8 = @"#Redacted#";
      }
      else
      {
        id v8 = [v5 networkName];
        int v9 = 1;
      }
      uint64_t v11 = [v5 captiveProfile];
      if (v11 && !IsAppleInternalBuild())
      {
        dispatch_time_t v13 = v8;
        id v15 = @"#Redacted#";
        uint64_t v12 = v6;
        LogPrintF();
      }
      else
      {
        [v5 captiveProfile];
        dispatch_time_t v13 = v8;
        id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
        uint64_t v12 = v6;
        LogPrintF();
      }
      if (v9) {
    }
      }
    [*(id *)(a1 + 32) tagAirPlayNetwork:v12, v13, v15];
  }
}

uint64_t sub_100008730(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6 && dword_10001ED08 <= 90 && (dword_10001ED08 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    LogPrintF();
  }
  [*(id *)(a1 + 32) _stopMonitoringWiFiEvents];
  uint64_t v3 = *(void *)(a1 + 40);
  if (v3) {
    (*(void (**)(uint64_t, BOOL, id))(v3 + 16))(v3, v6 == 0, v6);
  }

  return _objc_release_x2();
}

void sub_100008960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008AE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_100008B8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008C30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008D7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
}

void sub_100008EE4(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (a2 == 3)
  {
    id v7 = v6;
    [v6 handleWiFiInterfaceChangedWithEventInfo:a3];
  }
  else
  {
    if (a2 != 4) {
      goto LABEL_6;
    }
    id v7 = v6;
    [v6 handleUSBInterfaceChangedWithEventInfo:a3];
  }
  id v6 = v7;
LABEL_6:
}

uint64_t sub_100009058()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = qword_10001F060;
  qword_10001F060 = v0;

  return _objc_release_x1(v0, v1);
}

id sub_100009B80(uint64_t a1)
{
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    LogPrintF();
  }
  dispatch_semaphore_t v2 = *(void **)(a1 + 32);

  return [v2 setDiscoveryMode:0];
}

void sub_10000A198(uint64_t a1, void *a2)
{
  id v6 = a2;
  [*(id *)(a1 + 32) _setupAirPlayConnectingProxCardManagerWithSetupPayload:*(void *)(a1 + 40) withTitle:*(void *)(a1 + 48) withSubTitle:*(void *)(a1 + 56) withImageName:*(void *)(a1 + 64) andCompletion:*(void *)(a1 + 72)];
  uint64_t v3 = *(void *)(a1 + 72);
  if (v3) {
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v6);
  }
  uint64_t v4 = [*(id *)(a1 + 32) proxCardNavigationController];
  uint64_t v5 = [*(id *)(a1 + 32) connectingProxCardController];
  [v4 pushViewController:v5 animated:0];
}

uint64_t sub_10000A560(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000A8C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000AA10;
  v10[3] = &unk_100018930;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = *(id *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 32);
  id v11 = v5;
  uint64_t v12 = v6;
  id v7 = +[AirPlayAlertViewController alertWithTitle:v2 withMessage:v3 actions:v4 withCompletion:v10];
  [*(id *)(a1 + 32) setAirPlayAlertController:v7];

  [*(id *)(a1 + 32) setShouldSkipInvalidateOnProxCardFlowDidDismiss:1];
  id v8 = [*(id *)(a1 + 32) proxCardNavigationController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000AB70;
  v9[3] = &unk_100018610;
  v9[4] = *(void *)(a1 + 32);
  [v8 dismissViewControllerAnimated:1 completion:v9];
}

id sub_10000AA10(uint64_t a1, void *a2)
{
  if ([a2 isEqualToString:*(void *)(a1 + 32)])
  {
    uint64_t v3 = +[LSApplicationWorkspace defaultWorkspace];
    uint64_t v4 = +[NSURL URLWithString:@"prefs:root=WIFI"];
    [v3 openSensitiveURL:v4 withOptions:0];
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  id v5 = *(void **)(a1 + 40);

  return [v5 invalidate];
}

void sub_10000AB70(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 airPlayAlertController];
  [v1 presentViewController:v2 animated:1 completion:0];
}

void sub_10000ADE8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000AF04;
  v8[3] = &unk_100018980;
  v8[4] = *(void *)(a1 + 32);
  id v5 = +[AirPlayAlertViewController alertWithTitle:v2 withMessage:v3 actions:v4 withCompletion:v8];
  [*(id *)(a1 + 32) setAirPlayAlertController:v5];

  [*(id *)(a1 + 32) setShouldSkipInvalidateOnProxCardFlowDidDismiss:1];
  uint64_t v6 = [*(id *)(a1 + 32) proxCardNavigationController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000AFB0;
  v7[3] = &unk_100018610;
  v7[4] = *(void *)(a1 + 32);
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

void sub_10000AF04(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LogPrintF();
  }
  [*(id *)(a1 + 32) invalidate:v3];
}

void sub_10000AFB0(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 airPlayAlertController];
  [v1 presentViewController:v2 animated:1 completion:0];
}

void sub_10000B1C8(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10000B2E4;
  v8[3] = &unk_100018980;
  v8[4] = *(void *)(a1 + 32);
  id v5 = +[AirPlayAlertViewController alertWithTitle:v2 withMessage:v3 actions:v4 withCompletion:v8];
  [*(id *)(a1 + 32) setAirPlayAlertController:v5];

  [*(id *)(a1 + 32) setShouldSkipInvalidateOnProxCardFlowDidDismiss:1];
  uint64_t v6 = [*(id *)(a1 + 32) proxCardNavigationController];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000B390;
  v7[3] = &unk_100018610;
  v7[4] = *(void *)(a1 + 32);
  [v6 dismissViewControllerAnimated:1 completion:v7];
}

void sub_10000B2E4(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    LogPrintF();
  }
  [*(id *)(a1 + 32) invalidate:v3];
}

void sub_10000B390(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 airPlayAlertController];
  [v1 presentViewController:v2 animated:1 completion:0];
}

void sub_10000B7F0(uint64_t a1, char a2, void *a3)
{
  id v14 = a3;
  if (a2)
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      uint64_t v6 = [*(id *)(a1 + 40) wifiSSID];
      if (v6 && !IsAppleInternalBuild())
      {
        uint64_t v9 = v5;
        id v11 = @"#Redacted#";
        LogPrintF();
      }
      else
      {
        [*(id *)(a1 + 40) wifiSSID];
        uint64_t v9 = v5;
        id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
        LogPrintF();
      }
    }
    if (objc_msgSend(v14, "code", v9, v11) == (id)-71157
      && dword_10001EDE8 <= 50
      && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      dispatch_time_t v13 = [v14 localizedDescription];
      LogPrintF();

      [*(id *)(a1 + 32) _performBrokerAuthenticationWithSetupPayload:*(void *)(a1 + 40) switchWiFiIfFailed:0 v8, v13];
    }
    else
    {
      [*(id *)(a1 + 32) _performBrokerAuthenticationWithSetupPayload:*(void *)(a1 + 40) switchWiFiIfFailed:0 v10 v12];
    }
  }
  else
  {
    if (dword_10001EDE8 <= 90 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      [v14 localizedDescription];
      uint64_t v9 = v7;
      id v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
    [*(id *)(a1 + 32) _presentUnableToConnectToWiFiAlertWithSetupPayload:*(void *)(a1 + 40) v9, v11];
  }
}

void sub_10000BB68(void *a1, void *a2, void *a3)
{
  id v15 = a2;
  uint64_t v5 = a3;
  if (v15)
  {
    if (dword_10001EDE8 <= 90 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = [v15 localizedDescription];
      LogPrintF();
      id v11 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = a1[4];
      if (v5 && !IsAppleInternalBuild()) {
        CFStringRef v7 = @"#Redacted#";
      }
      else {
        CFStringRef v7 = v5;
      }
      uint64_t v13 = v6;
      CFStringRef v14 = v7;
      LogPrintF();
    }
    if ([(__CFString *)v5 count])
    {
      uint64_t v8 = [(__CFString *)v5 allKeys];
      uint64_t v9 = [v8 firstObject];
      uint64_t v10 = [(__CFString *)v5 objectForKeyedSubscript:v9];
      id v11 = [v10 objectForKeyedSubscript:@"supportedWiFiNetworkSSIDs"];

LABEL_13:
      goto LABEL_19;
    }
  }
  id v11 = 0;
LABEL_19:
  uint64_t v12 = a1[6];
  if (v12) {
    (*(void (**)(uint64_t, id))(v12 + 16))(v12, [v11 containsObject:a1[5]]);
  }
}

void sub_10000BE30(uint64_t a1, void *a2, void *a3)
{
  id v15 = a2;
  uint64_t v5 = a3;
  if (v15)
  {
    if (dword_10001EDE8 <= 90 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v6 = *(void *)(a1 + 32);
      [v15 localizedDescription];
      uint64_t v13 = v6;
      CFStringRef v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
    if (*(unsigned char *)(a1 + 48))
    {
      if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        uint64_t v10 = [*(id *)(a1 + 40) wifiSSID:v13, v14];
        if (v10 && !IsAppleInternalBuild())
        {
          uint64_t v13 = v9;
          CFStringRef v14 = @"#Redacted#";
          LogPrintF();
        }
        else
        {
          [*(id *)(a1 + 40) wifiSSID];
          uint64_t v13 = v9;
          CFStringRef v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
          LogPrintF();
        }
      }
      [*(id *)(a1 + 32) _joinWiFiAndConnectToReceiverWithSetupPayload:*(void *)(a1 + 40) v13, v14];
    }
    else if ([*(id *)(a1 + 40) routeToReceiver])
    {
      if ([v15 code] == (id)-6754)
      {
        if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v11 = *(void *)(a1 + 32);
          uint64_t v12 = [*(id *)(a1 + 40) brokerToken:v13 v14];
          if (v12 && !IsAppleInternalBuild())
          {
            uint64_t v13 = v11;
            CFStringRef v14 = @"#Redacted#";
            LogPrintF();
          }
          else
          {
            [*(id *)(a1 + 40) brokerToken];
            uint64_t v13 = v11;
            CFStringRef v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
            LogPrintF();
          }
        }
        [*(id *)(a1 + 32) _presentInvalidCodeAlertWithSetupPayload:*(void *)(a1 + 40) v13, v14];
      }
      else
      {
        [*(id *)(a1 + 32) _presentUnableToConnectToDeviceAlertWithSetupPayload:*(void *)(a1 + 40)];
      }
    }
    else
    {
      [*(id *)(a1 + 32) _presentSetupCompletedProxCard:*(void *)(a1 + 40) isAirPlaySetUp:0];
    }
  }
  else
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      if (v5 && !IsAppleInternalBuild()) {
        CFStringRef v8 = @"#Redacted#";
      }
      else {
        CFStringRef v8 = v5;
      }
      uint64_t v13 = v7;
      CFStringRef v14 = (__CFString *)v8;
      LogPrintF();
    }
    [*(id *)(a1 + 32) _connectToAirPlayReceiverWithDeviceID:v5 andSetupPayload:*(void *)(a1 + 40) v13, v14];
  }
}

void sub_10000C25C(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v17 = v5;
  if (a2)
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v15 = *(void *)(a1 + 32);
      LogPrintF();
    }
    CFStringRef v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    uint64_t v10 = 1;
LABEL_20:
    [v8 _presentSetupCompletedProxCard:v9 isAirPlaySetUp:v10];
    goto LABEL_26;
  }
  uint64_t v6 = v5;
  if (dword_10001EDE8 <= 90)
  {
    if (dword_10001EDE8 != -1 || (v11 = _LogCategory_Initialize(), uint64_t v6 = v17, v11))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      [v6 localizedDescription];
      uint64_t v15 = v7;
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
  if (NSErrorToOSStatus() != -6754)
  {
    unsigned int v14 = [*(id *)(a1 + 40) routeToReceiver];
    CFStringRef v8 = *(void **)(a1 + 32);
    uint64_t v9 = *(void *)(a1 + 40);
    if (v14)
    {
      [v8 _presentUnableToConnectToDeviceAlertWithSetupPayload:v9];
      goto LABEL_26;
    }
    uint64_t v10 = 0;
    goto LABEL_20;
  }
  if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    uint64_t v13 = [*(id *)(a1 + 40) receiverToken:v15, v16];
    if (v13 && !IsAppleInternalBuild())
    {
      uint64_t v15 = v12;
      uint64_t v16 = @"#Redacted#";
      LogPrintF();
    }
    else
    {
      [*(id *)(a1 + 40) receiverToken];
      uint64_t v15 = v12;
      uint64_t v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
  [*(id *)(a1 + 32) _presentInvalidCodeAlertWithSetupPayload:*(void *)(a1 + 40) v15, v16];
LABEL_26:
}

void sub_10000C618(uint64_t a1)
{
  id v2 = +[APUIConnectivityManager sharedInstance];
  uint64_t v3 = [v2 currentNetworkSSID];

  id v4 = [*(id *)(a1 + 32) wifiSSID];
  unsigned __int8 v5 = [v4 isEqualToString:v3];

  if ([(id)objc_opt_class() isMultipleWifiFeatureEnabled])
  {
    uint64_t v7 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(a1 + 40);
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000C868;
    v15[3] = &unk_100018A48;
    v15[4] = v6;
    uint64_t v16 = v3;
    id v17 = *(id *)(a1 + 32);
    [v6 _getSupportedNetworks:v16 withSetupPayload:v7 completion:v15];
  }
  else if (v5)
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      if (v3 && !IsAppleInternalBuild()) {
        CFStringRef v9 = @"#Redacted#";
      }
      else {
        CFStringRef v9 = v3;
      }
      uint64_t v13 = v8;
      CFStringRef v14 = v9;
      LogPrintF();
    }
    uint64_t v12 = +[APUIConnectivityManager sharedInstance];
    [v12 tagAirPlayNetwork];

    [*(id *)(a1 + 40) _performBrokerAuthenticationWithSetupPayload:*(void *)(a1 + 32) switchWiFiIfFailed:0];
  }
  else
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v10 = *(void *)(a1 + 40);
      if (v3 && !IsAppleInternalBuild()) {
        CFStringRef v11 = @"#Redacted#";
      }
      else {
        CFStringRef v11 = v3;
      }
      uint64_t v13 = v10;
      CFStringRef v14 = v11;
      LogPrintF();
    }
    [*(id *)(a1 + 40) _joinWiFiAndConnectToReceiverWithSetupPayload:*(void *)(a1 + 32) v13, v14];
  }
  [*(id *)(*(void *)(a1 + 40) + 16) startIntelligentRoutingLocationSensing];
}

id sub_10000C868(void *a1, char a2)
{
  if (a2)
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v4 = a1[4];
      CFStringRef v3 = (const __CFString *)a1[5];
      if (v3)
      {
        if (IsAppleInternalBuild()) {
          CFStringRef v3 = (const __CFString *)a1[5];
        }
        else {
          CFStringRef v3 = @"#Redacted#";
        }
      }
      uint64_t v11 = v4;
      CFStringRef v12 = v3;
      LogPrintF();
    }
    unsigned __int8 v5 = +[APUIConnectivityManager sharedInstance];
    [v5 tagAirPlayNetwork];

    uint64_t v6 = (void *)a1[4];
    uint64_t v7 = a1[6];
    return [v6 _performBrokerAuthenticationWithSetupPayload:v7 switchWiFiIfFailed:0];
  }
  else
  {
    if (dword_10001EDE8 <= 50 && (dword_10001EDE8 != -1 || _LogCategory_Initialize()))
    {
      if (a1[5]) {
        IsAppleInternalBuild();
      }
      LogPrintF();
    }
    CFStringRef v9 = (void *)a1[4];
    uint64_t v10 = a1[6];
    return [v9 _joinWiFiAndConnectToReceiverWithSetupPayload:v10];
  }
}

void sub_10000CB00(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 48);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000CBBC;
  v7[3] = &unk_100018A98;
  v7[4] = v2;
  [v2 _initializeSetupCompletionProxCardManagerWithSetupPayload:v3 isAirPlaySetUp:v4 andCompletion:v7];
  unsigned __int8 v5 = [*(id *)(a1 + 32) proxCardNavigationController];
  uint64_t v6 = [*(id *)(a1 + 32) completedProxCardController];
  [v5 pushViewController:v6 animated:0];
}

void sub_10000CBBC(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) proxCardNavigationController];
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000CC50;
  v3[3] = &unk_100018610;
  v3[4] = *(void *)(a1 + 32);
  [v2 dismissViewControllerAnimated:1 completion:v3];
}

uint64_t sub_10000CC50()
{
  if (dword_10001EDE8 <= 50)
  {
    if (dword_10001EDE8 != -1) {
      return LogPrintF();
    }
    uint64_t result = _LogCategory_Initialize();
    if (result) {
      return LogPrintF();
    }
  }
  return result;
}

uint64_t sub_10000CEF8(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (dword_10001EDE8 <= 90)
  {
    id v6 = v2;
    if (dword_10001EDE8 != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
    {
      unsigned __int8 v5 = [v3 localizedDescription];
      LogPrintF();

      uint64_t v3 = v6;
    }
  }

  return _objc_release_x1(v2, v3);
}

uint64_t sub_10000D244(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v3 = v2;
  if (dword_10001EDE8 <= 90)
  {
    id v6 = v2;
    if (dword_10001EDE8 != -1 || (id v2 = (id)_LogCategory_Initialize(), v3 = v6, v2))
    {
      unsigned __int8 v5 = [v3 localizedDescription];
      LogPrintF();

      uint64_t v3 = v6;
    }
  }

  return _objc_release_x1(v2, v3);
}

uint64_t start(int a1, char **a2)
{
  unsigned __int8 v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  id v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = UIApplicationMain(a1, a2, 0, v6);

  return v7;
}

uint64_t APConnectivityHelperDeregisterForEvent()
{
  return _APConnectivityHelperDeregisterForEvent();
}

uint64_t APConnectivityHelperGetSharedHelper()
{
  return _APConnectivityHelperGetSharedHelper();
}

uint64_t APConnectivityHelperRegisterEventHandler()
{
  return _APConnectivityHelperRegisterEventHandler();
}

uint64_t APConnectivityHelperRegisterForEvent()
{
  return _APConnectivityHelperRegisterForEvent();
}

uint64_t APSLogErrorAt()
{
  return _APSLogErrorAt();
}

uint64_t APSRemoteConfigGetBooleanIfPresent()
{
  return _APSRemoteConfigGetBooleanIfPresent();
}

uint64_t APSRemoteConfigGetShared()
{
  return _APSRemoteConfigGetShared();
}

uint64_t APSSettingsGetBooleanIfPresent()
{
  return _APSSettingsGetBooleanIfPresent();
}

uint64_t APSSettingsGetIntWithDefault()
{
  return _APSSettingsGetIntWithDefault();
}

uint64_t APSSettingsIsFeatureEnabled()
{
  return _APSSettingsIsFeatureEnabled();
}

uint64_t APSXPCClientSendCommandCreatingReply()
{
  return _APSXPCClientSendCommandCreatingReply();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return _CFRetain(cf);
}

uint64_t CNEnableWebSheetLaunch()
{
  return _CNEnableWebSheetLaunch();
}

uint64_t CNSetCaptivePortalAuthenticationCredentials()
{
  return _CNSetCaptivePortalAuthenticationCredentials();
}

uint64_t IsAppleInternalBuild()
{
  return _IsAppleInternalBuild();
}

uint64_t LogPrintF()
{
  return _LogPrintF();
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSErrorToOSStatus()
{
  return _NSErrorToOSStatus();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return _SFLocalizableWAPIStringKeyForKey();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _LogCategory_Initialize()
{
  return __LogCategory_Initialize();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

int inet_pton(int a1, const char *a2, void *a3)
{
  return _inet_pton(a1, a2, a3);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return _nw_path_get_status(path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return _nw_path_uses_interface_type(path, interface_type);
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
  return [super a2];
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return _objc_sync_enter(obj);
}

int objc_sync_exit(id obj)
{
  return _objc_sync_exit(obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_IPv4Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv4Addresses];
}

id objc_msgSend_IPv4SubnetMasks(void *a1, const char *a2, ...)
{
  return [a1 IPv4SubnetMasks];
}

id objc_msgSend_IPv6Addresses(void *a1, const char *a2, ...)
{
  return [a1 IPv6Addresses];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return [a1 URL];
}

id objc_msgSend_URLContexts(void *a1, const char *a2, ...)
{
  return [a1 URLContexts];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__initWifiInterface(void *a1, const char *a2, ...)
{
  return [a1 _initWifiInterface];
}

id objc_msgSend__localizedSystemWiFiString(void *a1, const char *a2, ...)
{
  return [a1 _localizedSystemWiFiString];
}

id objc_msgSend__remoteViewControllerProxy(void *a1, const char *a2, ...)
{
  return [a1 _remoteViewControllerProxy];
}

id objc_msgSend__setupAssistantEnabled(void *a1, const char *a2, ...)
{
  return [a1 _setupAssistantEnabled];
}

id objc_msgSend__startMonitoringWiFiEvents(void *a1, const char *a2, ...)
{
  return [a1 _startMonitoringWiFiEvents];
}

id objc_msgSend__stopMonitoringWiFiEvents(void *a1, const char *a2, ...)
{
  return [a1 _stopMonitoringWiFiEvents];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return [a1 activate];
}

id objc_msgSend_airPlayAlertController(void *a1, const char *a2, ...)
{
  return [a1 airPlayAlertController];
}

id objc_msgSend_airPlayProperties(void *a1, const char *a2, ...)
{
  return [a1 airPlayProperties];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_availableOutputDevices(void *a1, const char *a2, ...)
{
  return [a1 availableOutputDevices];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_brokerToken(void *a1, const char *a2, ...)
{
  return [a1 brokerToken];
}

id objc_msgSend_cancellationReason(void *a1, const char *a2, ...)
{
  return [a1 cancellationReason];
}

id objc_msgSend_captivePortalAuthToken(void *a1, const char *a2, ...)
{
  return [a1 captivePortalAuthToken];
}

id objc_msgSend_captiveProfile(void *a1, const char *a2, ...)
{
  return [a1 captiveProfile];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_close(void *a1, const char *a2, ...)
{
  return [a1 close];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completedProxCardController(void *a1, const char *a2, ...)
{
  return [a1 completedProxCardController];
}

id objc_msgSend_connectingProxCardController(void *a1, const char *a2, ...)
{
  return [a1 connectingProxCardController];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentKnownNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 currentKnownNetworkProfile];
}

id objc_msgSend_currentNetworkSSID(void *a1, const char *a2, ...)
{
  return [a1 currentNetworkSSID];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultConfiguration(void *a1, const char *a2, ...)
{
  return [a1 defaultConfiguration];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return [a1 deviceID];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_isCaptivePortalMitigationSupported(void *a1, const char *a2, ...)
{
  return [a1 isCaptivePortalMitigationSupported];
}

id objc_msgSend_isMultipleWifiFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 isMultipleWifiFeatureEnabled];
}

id objc_msgSend_isNetworkHidden(void *a1, const char *a2, ...)
{
  return [a1 isNetworkHidden];
}

id objc_msgSend_isValidIPv4Address(void *a1, const char *a2, ...)
{
  return [a1 isValidIPv4Address];
}

id objc_msgSend_isValidIPv6Address(void *a1, const char *a2, ...)
{
  return [a1 isValidIPv6Address];
}

id objc_msgSend_isValidSubnetMask(void *a1, const char *a2, ...)
{
  return [a1 isValidSubnetMask];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainContentGuide(void *a1, const char *a2, ...)
{
  return [a1 mainContentGuide];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_networkName(void *a1, const char *a2, ...)
{
  return [a1 networkName];
}

id objc_msgSend_proxCardNavigationController(void *a1, const char *a2, ...)
{
  return [a1 proxCardNavigationController];
}

id objc_msgSend_queryItems(void *a1, const char *a2, ...)
{
  return [a1 queryItems];
}

id objc_msgSend_receiverToken(void *a1, const char *a2, ...)
{
  return [a1 receiverToken];
}

id objc_msgSend_response(void *a1, const char *a2, ...)
{
  return [a1 response];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_routeToReceiver(void *a1, const char *a2, ...)
{
  return [a1 routeToReceiver];
}

id objc_msgSend_scaleUpEffect(void *a1, const char *a2, ...)
{
  return [a1 scaleUpEffect];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return [a1 scheme];
}

id objc_msgSend_semaphore(void *a1, const char *a2, ...)
{
  return [a1 semaphore];
}

id objc_msgSend_setupProxCardController(void *a1, const char *a2, ...)
{
  return [a1 setupProxCardController];
}

id objc_msgSend_sharedAudioPresentationOutputContext(void *a1, const char *a2, ...)
{
  return [a1 sharedAudioPresentationOutputContext];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldAnimate(void *a1, const char *a2, ...)
{
  return [a1 shouldAnimate];
}

id objc_msgSend_shouldSkipInvalidateOnProxCardFlowDidDismiss(void *a1, const char *a2, ...)
{
  return [a1 shouldSkipInvalidateOnProxCardFlowDidDismiss];
}

id objc_msgSend_shouldUpdateNetworkProfile(void *a1, const char *a2, ...)
{
  return [a1 shouldUpdateNetworkProfile];
}

id objc_msgSend_startIntelligentRoutingLocationSensing(void *a1, const char *a2, ...)
{
  return [a1 startIntelligentRoutingLocationSensing];
}

id objc_msgSend_startMonitoringWiFiInterfaceChange(void *a1, const char *a2, ...)
{
  return [a1 startMonitoringWiFiInterfaceChange];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}

id objc_msgSend_stopMonitoringWiFiInterfaceChange(void *a1, const char *a2, ...)
{
  return [a1 stopMonitoringWiFiInterfaceChange];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return [a1 subviews];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_systemGreenColor(void *a1, const char *a2, ...)
{
  return [a1 systemGreenColor];
}

id objc_msgSend_tagAirPlayNetwork(void *a1, const char *a2, ...)
{
  return [a1 tagAirPlayNetwork];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}

id objc_msgSend_wifiPassphrase(void *a1, const char *a2, ...)
{
  return [a1 wifiPassphrase];
}

id objc_msgSend_wifiSSID(void *a1, const char *a2, ...)
{
  return [a1 wifiSSID];
}