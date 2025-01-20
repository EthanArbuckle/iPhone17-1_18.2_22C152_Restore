@interface APRKResourceLoaderHelper
- (APRKResourceLoaderHelper)init;
- (APRKResourceLoaderHelperDelegate)delegate;
- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4;
- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4;
- (void)forgetAllActiveResourceLoadingRequests;
- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4;
- (void)registerAVURLAsset:(id)a3;
- (void)resourceLoader:(id)a3 didCancelAuthenticationChallenge:(id)a4;
- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4;
- (void)setDelegate:(id)a3;
- (void)unregisterAVURLAsset:(id)a3;
@end

@implementation APRKResourceLoaderHelper

- (APRKResourceLoaderHelper)init
{
  v13[2] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)APRKResourceLoaderHelper;
  v2 = [(APRKResourceLoaderHelper *)&v11 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    activeResourceLoadingRequests = v2->_activeResourceLoadingRequests;
    v2->_activeResourceLoadingRequests = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.APRKMediaPlayer.resourceLoaderQueue", 0);
    resourceLoaderQueue = v2->_resourceLoaderQueue;
    v2->_resourceLoaderQueue = (OS_dispatch_queue *)v5;

    v12[0] = @"Accept-Encoding";
    v12[1] = @"User-Agent";
    v13[0] = @"gzip";
    objc_msgSend(NSString, "stringWithFormat:", @"AppleCoreMedia/1.0.0.%.*s (Apple TV; U; CPU OS 12_0 like Mac OS X; en_us)",
      APSVersionUtilsGetShortVersionLength(),
    v7 = "835.19.1.1");
    v13[1] = v7;
    uint64_t v8 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
    headersDictionary = v2->_headersDictionary;
    v2->_headersDictionary = (NSDictionary *)v8;

    v2->_requestIDCnt = 0;
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  return v2;
}

- (void)registerAVURLAsset:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    id v10 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), dispatch_queue_t v5 = v10, v6))
      {
        uint64_t v8 = v5;
        v9 = self;
        LogPrintF();
        dispatch_queue_t v5 = v10;
      }
    }
    v7 = objc_msgSend(v5, "resourceLoader", v8, v9);
    [v7 setDelegate:self queue:self->_resourceLoaderQueue];
  }
  MEMORY[0x270F9A758]();
}

- (void)unregisterAVURLAsset:(id)a3
{
  id v4 = a3;
  dispatch_queue_t v5 = v4;
  if (v4)
  {
    id v10 = v4;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v6 = _LogCategory_Initialize(), dispatch_queue_t v5 = v10, v6))
      {
        uint64_t v8 = v5;
        v9 = self;
        LogPrintF();
        dispatch_queue_t v5 = v10;
      }
    }
    v7 = objc_msgSend(v5, "resourceLoader", v8, v9);
    [v7 setDelegate:0 queue:self->_resourceLoaderQueue];
  }
  MEMORY[0x270F9A758]();
}

- (void)forgetAllActiveResourceLoadingRequests
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  obj = self;
  objc_sync_enter(obj);
  [(NSMutableDictionary *)obj->_activeResourceLoadingRequests removeAllObjects];
  objc_sync_exit(obj);
}

- (void)processUnhandledURLResponseWithDictionary:(id)a3 error:(id *)a4
{
  id v45 = a3;
  int v6 = [v45 objectForKey:*MEMORY[0x263F01148]];
  v7 = [v45 objectForKey:*MEMORY[0x263F01150]];
  uint64_t v8 = [v7 integerValue];

  v9 = [v45 objectForKey:*MEMORY[0x263F01158]];
  id v10 = [v45 objectForKey:*MEMORY[0x263F01130]];
  objc_super v11 = [v45 objectForKey:*MEMORY[0x263F01120]];
  v12 = [v45 objectForKey:*MEMORY[0x263F01128]];
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v41 = v6;
    LogPrintF();
  }
  if (v6)
  {
    if (v12) {
      BOOL v13 = 0;
    }
    else {
      BOOL v13 = v8 == 0;
    }
    if (v13)
    {
      v19 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:-1 userInfo:0];
      goto LABEL_15;
    }
    v14 = self;
    objc_sync_enter(v14);
    v15 = [(NSMutableDictionary *)v14->_activeResourceLoadingRequests objectForKey:v6];
    objc_sync_exit(v14);

    if (v15) {
      goto LABEL_19;
    }
    id v16 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6727;
  }
  else
  {
    id v16 = objc_alloc(MEMORY[0x263F087E8]);
    uint64_t v17 = *MEMORY[0x263F08410];
    uint64_t v18 = -6708;
  }
  v19 = objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, v18, 0, v41);
LABEL_15:
  id v20 = v19;
  if (v19)
  {
    if (a4)
    {
      id v20 = v19;
      v15 = 0;
      *a4 = v20;
    }
    else
    {
      v15 = 0;
    }
    goto LABEL_31;
  }
  v15 = 0;
LABEL_19:
  if ((unint64_t)(v8 - 301) > 4 || v8 == 304)
  {
    if (v12)
    {
      v44 = v12;
      v34 = v10;
      v35 = v11;
      id v36 = objc_alloc(MEMORY[0x263EFC5E0]);
      [NSURL URLWithString:v9];
      v37 = self;
      v39 = v38 = v9;
      v22 = (void *)[v36 initWithURL:v39 statusCode:v8 HTTPVersion:@"HTTP/1.1" headerFields:v34];

      v9 = v38;
      self = v37;
      [v15 setResponse:v22];
      v40 = [v15 dataRequest];
      [v40 respondWithData:v44];

      objc_super v11 = v35;
      id v10 = v34;
      v12 = v44;
      [v15 finishLoading];
    }
    else
    {
      v22 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:v8 userInfo:0];
      [v15 finishLoadingWithError:v22];
    }
  }
  else
  {
    v22 = [v10 objectForKey:@"Location"];
    if (v22)
    {
      v23 = (void *)MEMORY[0x263EFC630];
      v43 = v12;
      v24 = v10;
      v25 = v11;
      [NSURL URLWithString:v22];
      v26 = v42 = v9;
      v27 = [v23 requestWithURL:v26];

      id v28 = objc_alloc(MEMORY[0x263EFC5E0]);
      v29 = [NSURL URLWithString:v42];
      v30 = (void *)[v28 initWithURL:v29 statusCode:v8 HTTPVersion:@"HTTP/1.1" headerFields:v24];

      [v15 setResponse:v30];
      [v15 setRedirect:v27];
      v31 = [v15 contentInformationRequest];
      [v31 setRenewalDate:v25];

      v32 = [v15 dataRequest];
      [v32 respondWithData:v43];

      objc_super v11 = v25;
      id v10 = v24;
      v12 = v43;
      [v15 finishLoading];

      v9 = v42;
    }
    else
    {
      v27 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F08570] code:v8 userInfo:0];
      [v15 finishLoadingWithError:v27];
    }
  }
  if (v6)
  {
    v33 = self;
    objc_sync_enter(v33);
    [(NSMutableDictionary *)v33->_activeResourceLoadingRequests removeObjectForKey:v6];
    objc_sync_exit(v33);
  }
  id v20 = 0;
LABEL_31:
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForLoadingOfRequestedResource:(id)a4
{
  v31[4] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 serializableRepresentation];
  uint64_t v9 = *MEMORY[0x263F01138];
  id v10 = [v8 objectForKey:*MEMORY[0x263F01138]];
  int v11 = [v10 BOOLValue];

  if (v11)
  {
    v12 = [v7 contentInformationRequest];
    [v12 setContentType:*MEMORY[0x263EFA1A0]];

    [v7 finishLoading];
  }
  else
  {
    BOOL v13 = NSNumber;
    ++self->_requestIDCnt;
    v14 = objc_msgSend(v13, "numberWithLongLong:");
    v15 = self;
    objc_sync_enter(v15);
    [(NSMutableDictionary *)v15->_activeResourceLoadingRequests setObject:v7 forKey:v14];
    objc_sync_exit(v15);

    v30[0] = *MEMORY[0x263F01158];
    id v16 = [v7 request];
    uint64_t v17 = [v16 URL];
    uint64_t v18 = [v17 absoluteString];
    v31[0] = v18;
    v31[1] = MEMORY[0x263EFFA80];
    uint64_t v19 = *MEMORY[0x263F01148];
    v30[1] = v9;
    v30[2] = v19;
    v30[3] = *MEMORY[0x263F01130];
    headersDictionary = v15->_headersDictionary;
    v31[2] = v14;
    v31[3] = headersDictionary;
    v21 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];

    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v22 = [v8 objectForKey:v19];
      v23 = [v7 request];
      v24 = [v23 URL];
      id v28 = [v24 absoluteString];
      v29 = v14;
      v27 = v22;
      LogPrintF();
    }
    v25 = [(APRKResourceLoaderHelper *)v15 delegate];
    [v25 resourceLoaderHelper:v15 wantsToPerformUnhandledURLRequestWithDictionary:v21 forRequestID:v14];
  }
  return 1;
}

- (void)resourceLoader:(id)a3 didCancelLoadingRequest:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [(NSMutableDictionary *)v7->_activeResourceLoadingRequests allKeysForObject:v6];
  [(NSMutableDictionary *)v7->_activeResourceLoadingRequests removeObjectsForKeys:v8];

  objc_sync_exit(v7);
}

- (BOOL)resourceLoader:(id)a3 shouldWaitForResponseToAuthenticationChallenge:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

  return 0;
}

- (void)resourceLoader:(id)a3 didCancelAuthenticationChallenge:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (APRKResourceLoaderHelperDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (APRKResourceLoaderHelperDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_headersDictionary, 0);
  objc_storeStrong((id *)&self->_resourceLoaderQueue, 0);
  objc_storeStrong((id *)&self->_activeResourceLoadingRequests, 0);
}

@end