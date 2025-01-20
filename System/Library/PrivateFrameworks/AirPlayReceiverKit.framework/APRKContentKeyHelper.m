@interface APRKContentKeyHelper
- (APRKContentKeyHelper)init;
- (APRKContentKeyHelperDelegate)delegate;
- (BOOL)forwardsFPSSecureStopData;
- (BOOL)isHandlingContentKeyRequestWithURLString:(id)a3;
- (void)_performContentKeyRequest:(id)a3 isRenewalRequest:(BOOL)a4;
- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4;
- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4;
- (void)contentKeySessionDidGenerateExpiredSessionReport:(id)a3;
- (void)forgetAllActiveContentKeyRequests;
- (void)processStreamingKeyRequestWithDictionary:(id)a3 withCompletionBlock:(id)a4;
- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4;
- (void)registerAVURLAsset:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForwardsFPSSecureStopData:(BOOL)a3;
- (void)unregisterAVURLAsset:(id)a3;
@end

@implementation APRKContentKeyHelper

- (APRKContentKeyHelper)init
{
  v12.receiver = self;
  v12.super_class = (Class)APRKContentKeyHelper;
  v2 = [(APRKContentKeyHelper *)&v12 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.APRKMediaPlayer.contentKeySessionQueue", 0);
    contentKeySessionQueue = v2->_contentKeySessionQueue;
    v2->_contentKeySessionQueue = (OS_dispatch_queue *)v3;

    v5 = +[APRKUtilities secureStopURL];
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v11 = v5;
      LogPrintF();
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x263EFA6E0], "contentKeySessionWithKeySystem:storageDirectoryAtURL:", *MEMORY[0x263EF97F8], v5, v11);
    contentKeySession = v2->_contentKeySession;
    v2->_contentKeySession = (AVContentKeySession *)v6;

    [(AVContentKeySession *)v2->_contentKeySession setDelegate:v2 queue:v2->_contentKeySessionQueue];
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeContentKeyRequests = v2->_activeContentKeyRequests;
    v2->_activeContentKeyRequests = v8;

    v2->_forwardsFPSSecureStopData = 0;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v2;
}

- (BOOL)isHandlingContentKeyRequestWithURLString:(id)a3
{
  activeContentKeyRequests = self->_activeContentKeyRequests;
  id v4 = a3;
  v5 = [(NSMutableDictionary *)activeContentKeyRequests allKeys];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (void)registerAVURLAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v9 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (int v6 = _LogCategory_Initialize(), v5 = v9, v6))
      {
        id v7 = v5;
        v8 = self;
        LogPrintF();
      }
    }
    -[AVContentKeySession addContentKeyRecipient:](self->_contentKeySession, "addContentKeyRecipient:", v9, v7, v8);
  }
  MEMORY[0x270F9A758]();
}

- (void)unregisterAVURLAsset:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v9 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (int v6 = _LogCategory_Initialize(), v5 = v9, v6))
      {
        id v7 = v5;
        v8 = self;
        LogPrintF();
      }
    }
    -[AVContentKeySession removeContentKeyRecipient:](self->_contentKeySession, "removeContentKeyRecipient:", v9, v7, v8);
  }
  MEMORY[0x270F9A758]();
}

- (void)forgetAllActiveContentKeyRequests
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  activeContentKeyRequests = self->_activeContentKeyRequests;
  [(NSMutableDictionary *)activeContentKeyRequests removeAllObjects];
}

- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4
{
  id v13 = a3;
  if (v13 || !a4)
  {
    id v6 = [v13 objectForKey:*MEMORY[0x263F01158]];
    id v7 = [v13 objectForKey:*MEMORY[0x263F01120]];
    v8 = [(NSMutableDictionary *)self->_activeContentKeyRequests objectForKey:v6];
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_super v12 = [v8 identifier];
      LogPrintF();
    }
    v10 = objc_msgSend(v13, "objectForKey:", *MEMORY[0x263F01128], v12);
    if (v10)
    {
      v11 = [MEMORY[0x263EFA6D8] contentKeyResponseWithFairPlayStreamingKeyResponseData:v10 renewalDate:v7];
      [v8 processContentKeyResponse:v11];
    }
    [(NSMutableDictionary *)self->_activeContentKeyRequests removeObjectForKey:v6];
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    id v9 = objc_alloc(MEMORY[0x263F087E8]);
    id v6 = (id) [v9 initWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    *a4 = v6;
  }
}

- (void)processStreamingKeyRequestWithDictionary:(id)a3 withCompletionBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    v8 = [v6 objectForKey:*MEMORY[0x263F01248]];
    id v9 = [v8 objectForKey:*MEMORY[0x263F012D8]];
    appIDData = self->_appIDData;
    self->_appIDData = v9;

    v11 = [v8 objectForKey:*MEMORY[0x263F012E0]];
    objc_super v12 = [v8 objectForKey:*MEMORY[0x263F01360]];
    id v13 = [v8 objectForKey:*MEMORY[0x263F01330]];
    v14 = [v12 objectForKey:*MEMORY[0x263F01158]];
    if (v14 && self->_appIDData)
    {
      uint64_t v15 = [(NSMutableDictionary *)self->_activeContentKeyRequests objectForKey:v14];
      v16 = (void *)v15;
      if (v15)
      {
        v25 = (void *)v15;
        v17 = [v13 allKeys];
        int v18 = [v17 containsObject:@"CSKRO_RemoteContext"];

        if (v18)
        {
          id v19 = objc_alloc_init(MEMORY[0x263EFF9A0]);
          v20 = [v13 objectForKey:@"CSKRO_RemoteContext"];
          [v19 setObject:v20 forKey:@"CSKRO_RemoteContext"];
        }
        else
        {
          id v19 = 0;
        }
        if (gLogCategory_AirPlayReceiverKit <= 30
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
        v22 = self->_appIDData;
        if (v19) {
          id v23 = v19;
        }
        else {
          id v23 = v13;
        }
        v26[0] = MEMORY[0x263EF8330];
        v26[1] = 3221225472;
        v26[2] = __85__APRKContentKeyHelper_processStreamingKeyRequestWithDictionary_withCompletionBlock___block_invoke;
        v26[3] = &unk_264EA1AC0;
        id v27 = v7;
        id v24 = v23;
        v16 = v25;
        [v25 makeStreamingContentKeyRequestDataForApp:v22 contentIdentifier:v11 options:v24 completionHandler:v26];
      }
      else if (gLogCategory_AirPlayReceiverKit <= 30 {
             && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      }
      {
        LogPrintF();
      }
    }
    goto LABEL_27;
  }
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v7)
  {
    id v21 = objc_alloc(MEMORY[0x263F087E8]);
    v8 = (void *)[v21 initWithDomain:*MEMORY[0x263F08410] code:-6705 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v8);
LABEL_27:
  }
}

void __85__APRKContentKeyHelper_processStreamingKeyRequestWithDictionary_withCompletionBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v5
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);
  }
}

- (void)_performContentKeyRequest:(id)a3 isRenewalRequest:(BOOL)a4
{
  BOOL v4 = a4;
  activeContentKeyRequests = self->_activeContentKeyRequests;
  id v7 = a3;
  v8 = [v7 identifier];
  [(NSMutableDictionary *)activeContentKeyRequests setObject:v7 forKey:v8];

  id v12 = [MEMORY[0x263EFF9A0] dictionary];
  id v9 = [v7 identifier];

  [v12 setObject:v9 forKey:*MEMORY[0x263F01158]];
  [v12 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F01138]];
  v10 = [NSNumber numberWithUnsignedInteger:sMessageID];
  [v12 setObject:v10 forKey:*MEMORY[0x263F01148]];

  if (v4) {
    [v12 setObject:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F01140]];
  }
  ++sMessageID;
  v11 = [(APRKContentKeyHelper *)self delegate];
  [v11 contentKeyHelper:self wantsToPerformContentKeyRequestWithDictionary:v12];
}

- (void)contentKeySession:(id)a3 didProvideRenewingContentKeyRequest:(id)a4
{
}

- (void)contentKeySession:(id)a3 didProvideContentKeyRequest:(id)a4
{
}

- (void)contentKeySessionDidGenerateExpiredSessionReport:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_appIDData)
  {
    id v5 = +[APRKUtilities secureStopURL];
    uint64_t v6 = [MEMORY[0x263EFA6E0] pendingExpiredSessionReportsWithAppIdentifier:self->_appIDData storageDirectoryAtURL:v5];
    id v7 = (void *)v6;
    if (self->_forwardsFPSSecureStopData && v6)
    {
      id v17 = v4;
      if (gLogCategory_AirPlayReceiverKit <= 10
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        v16 = [v7 debugDescription];
        LogPrintF();
      }
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v8 = v7;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v19;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v19 != v11) {
              objc_enumerationMutation(v8);
            }
            uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
            v22 = @"record";
            uint64_t v23 = v13;
            v14 = objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", &v23, &v22, 1, v16);
            uint64_t v15 = [(APRKContentKeyHelper *)self delegate];
            [v15 contentKeyHelper:self didGenerateSecureStopRecordPayload:v14];
          }
          uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
        }
        while (v10);
      }

      id v4 = v17;
    }
    if (v7) {
      [MEMORY[0x263EFA6E0] removePendingExpiredSessionReports:v7 withAppIdentifier:self->_appIDData storageDirectoryAtURL:v5];
    }
  }
  else if (gLogCategory_AirPlayReceiverKit <= 90 {
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  }
  {
    LogPrintF();
  }
}

- (BOOL)forwardsFPSSecureStopData
{
  return self->_forwardsFPSSecureStopData;
}

- (void)setForwardsFPSSecureStopData:(BOOL)a3
{
  self->_forwardsFPSSecureStopData = a3;
}

- (APRKContentKeyHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APRKContentKeyHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appIDData, 0);
  objc_storeStrong((id *)&self->_activeContentKeyRequests, 0);
  objc_storeStrong((id *)&self->_contentKeySession, 0);
  objc_storeStrong((id *)&self->_contentKeySessionQueue, 0);
}

@end