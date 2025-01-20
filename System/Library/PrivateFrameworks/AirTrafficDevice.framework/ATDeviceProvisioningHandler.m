@interface ATDeviceProvisioningHandler
- (ATDeviceProvisioningHandler)init;
- (id)_getEndpointInfo;
- (void)_handleBeginSessionRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleCreateSessionRequest:(id)a3 onMessageLink:(id)a4;
- (void)_handleRegisterEndpointRequest:(id)a3 onMessageLink:(id)a4;
- (void)_processBeginSessionResponse:(id)a3 onMessageLink:(id)a4;
- (void)_processCreateSessionResponse:(id)a3 onMessageLink:(id)a4;
- (void)_processRegisterEndpointResponse:(id)a3 onMessageLink:(id)a4;
- (void)_sendBeginSessionRequestOnMessageLink:(id)a3;
- (void)_sendCreateSessionRequestWithData:(id)a3 onMessageLink:(id)a4;
- (void)_sendRegisterEndpointRequestOnMessageLink:(id)a3;
- (void)_setMessageLinkAsInitialized:(id)a3;
- (void)messageLink:(id)a3 didReceiveRequest:(id)a4;
- (void)messageLinkWasOpened:(id)a3;
@end

@implementation ATDeviceProvisioningHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grappaSession, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_setMessageLinkAsInitialized:(id)a3
{
  id v6 = a3;
  if ([(ATDeviceSettings *)self->_settings grappaEnabled]) {
    v4 = [[ATGrappaSignatureProvider alloc] initWithGrappaSession:self->_grappaSession];
  }
  else {
    v4 = objc_alloc_init(ATMD5SignatureProvider);
  }
  v5 = v4;
  [v6 setSignatureProvider:v4];

  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  ATReportEventAddDoubleToScalarKey();
  [v6 setInitialized:1];
}

- (id)_getEndpointInfo
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = [(ATDeviceSettings *)self->_settings libraryIdentifier];
  [v3 setObject:v4 forKey:@"_ProvisioningLibraryIdentifier"];

  v5 = (void *)MGCopyAnswer();
  if (v5) {
    [v3 setObject:v5 forKey:@"_ProvisioningHostOSVersion"];
  }
  [v3 setObject:@"iOS" forKey:@"_ProvisioningHostOSType"];
  id v6 = (void *)MGCopyAnswer();
  if (v6) {
    [v3 setObject:v6 forKey:@"_ProvisioningHostModel"];
  }
  v7 = [MEMORY[0x1E4F1CA80] set];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v8 = +[ATClientController sharedInstance];
  v9 = [v8 allClients];

  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v14 conformsToProtocol:&unk_1F33F0650])
        {
          v15 = [v14 syncDataClass];
          [v7 addObject:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v11);
  }

  v16 = [v7 allObjects];
  [v3 setObject:v16 forKey:@"_ProvisioningEnabledDataClasses"];

  v17 = [MEMORY[0x1E4FB86D0] sharedMonitor];
  v18 = [v17 pairedDevicePairingID];

  if (v18)
  {
    v19 = [v18 UUIDString];
    [v3 setObject:v19 forKey:@"_ProvisioningDevicePairingId"];
  }
  v20 = [MEMORY[0x1E4FB8608] currentDeviceInfo];
  v21 = [v20 deviceGUID];

  if (v21) {
    [v3 setObject:v21 forKey:@"_ProvisioningDeviceGUID"];
  }

  return v3;
}

- (void)_processBeginSessionResponse:(id)a3 onMessageLink:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isPartial] & 1) == 0)
  {
    v8 = [v6 error];

    if (v8)
    {
      v9 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = [v6 error];
        int v11 = 138543362;
        uint64_t v12 = v10;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_ERROR, "Failed to process BeginSession response: %{public}@", (uint8_t *)&v11, 0xCu);
      }
      [v7 close];
    }
    else
    {
      [(ATDeviceProvisioningHandler *)self _setMessageLinkAsInitialized:v7];
    }
  }
}

- (void)_handleBeginSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a4;
  id v7 = [a3 responseWithError:0 parameters:0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __72__ATDeviceProvisioningHandler__handleBeginSessionRequest_onMessageLink___block_invoke;
  v9[3] = &unk_1E6B88BE0;
  id v10 = v6;
  int v11 = self;
  id v8 = v6;
  [v8 sendResponse:v7 withCompletion:v9];
}

void __72__ATDeviceProvisioningHandler__handleBeginSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "Failed to handle BeginSession request: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) close];
  }
  else
  {
    [*(id *)(a1 + 40) _setMessageLinkAsInitialized:*(void *)(a1 + 32)];
  }
}

- (void)_sendBeginSessionRequestOnMessageLink:(id)a3
{
  id v4 = a3;
  int v5 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"ProvisioningBeginSession" dataClass:@"Provisioning" parameters:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__ATDeviceProvisioningHandler__sendBeginSessionRequestOnMessageLink___block_invoke;
  v7[3] = &unk_1E6B882E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v6 sendRequest:v5 withCompletion:v7];
}

void __69__ATDeviceProvisioningHandler__sendBeginSessionRequestOnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isPartial] & 1) == 0)
  {
    if (v6)
    {
      uint64_t v7 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138543362;
        id v9 = v6;
        _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "Failed to send BeginSession request: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(a1 + 40) close];
    }
    else
    {
      [*(id *)(a1 + 32) _processBeginSessionResponse:v5 onMessageLink:*(void *)(a1 + 40)];
    }
  }
}

- (void)_processCreateSessionResponse:(id)a3 onMessageLink:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isPartial] & 1) == 0)
  {
    int v8 = [v6 error];
    if (v8) {
      goto LABEL_3;
    }
    if (![(ATDeviceSettings *)self->_settings grappaEnabled]) {
      goto LABEL_8;
    }
    uint64_t v10 = [v6 parameters];
    int v11 = [v10 objectForKey:@"_ProvisioningSessionResposneData"];

    int v8 = [(ATGrappaSession *)self->_grappaSession beginHostSessionWithDeviceResponseData:v11];

    if (v8)
    {
LABEL_3:
      id v9 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        int v12 = 138543362;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1D9A2D000, v9, OS_LOG_TYPE_ERROR, "Failed to process CreateSession response: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      [v7 close];
    }
    else
    {
LABEL_8:
      [(ATDeviceProvisioningHandler *)self _sendBeginSessionRequestOnMessageLink:v7];
    }
  }
}

- (void)_handleCreateSessionRequest:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(ATDeviceSettings *)self->_settings grappaEnabled])
  {
    id v9 = [v6 parameters];
    uint64_t v10 = [v9 objectForKey:@"_ProvisioningSessionRequestData"];

    grappaSession = self->_grappaSession;
    id v19 = 0;
    int v12 = [(ATGrappaSession *)grappaSession establishDeviceSessionWithRequestData:v10 responseData:&v19];
    id v13 = v19;
    uint64_t v14 = v13;
    if (!v12 && v13) {
      [v8 setObject:v13 forKey:@"_ProvisioningSessionResposneData"];
    }
  }
  else
  {
    int v12 = 0;
  }
  v15 = [v6 responseWithError:v12 parameters:v8];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__ATDeviceProvisioningHandler__handleCreateSessionRequest_onMessageLink___block_invoke;
  v17[3] = &unk_1E6B88AF0;
  id v18 = v7;
  id v16 = v7;
  [v16 sendResponse:v15 withCompletion:v17];
}

void __73__ATDeviceProvisioningHandler__handleCreateSessionRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "Failed to send CreateSession response: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) close];
  }
}

- (void)_sendCreateSessionRequestWithData:(id)a3 onMessageLink:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = v8;
  if (v6) {
    [v8 setObject:v6 forKey:@"_ProvisioningSessionRequestData"];
  }
  uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"ProvisioningCreateSession" dataClass:@"Provisioning" parameters:v9];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__ATDeviceProvisioningHandler__sendCreateSessionRequestWithData_onMessageLink___block_invoke;
  v12[3] = &unk_1E6B882E0;
  v12[4] = self;
  id v13 = v7;
  id v11 = v7;
  [v11 sendRequest:v10 withCompletion:v12];
}

void __79__ATDeviceProvisioningHandler__sendCreateSessionRequestWithData_onMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isPartial] & 1) == 0)
  {
    if (v6)
    {
      id v7 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138543362;
        id v9 = v6;
        _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "Failed to send create session request: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(a1 + 40) close];
    }
    else
    {
      [*(id *)(a1 + 32) _processCreateSessionResponse:v5 onMessageLink:*(void *)(a1 + 40)];
    }
  }
}

- (void)_processRegisterEndpointResponse:(id)a3 onMessageLink:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isPartial] & 1) == 0)
  {
    uint64_t v8 = [v6 error];
    if (v8)
    {
      id v9 = (void *)v8;
      id v10 = 0;
    }
    else
    {
      id v11 = [v6 parameters];
      int v12 = [v11 objectForKey:@"_ProvisioningLibraryIdentifier"];
      [v7 setIdentifier:v12];
      id v13 = [(ATDeviceSettings *)self->_settings hostInfoForLibrary:v12];
      uint64_t v14 = [v11 objectForKey:@"_ProvisioningHostModel"];
      [v13 setModel:v14];

      v15 = [v11 objectForKey:@"_ProvisioningHostOSType"];
      [v13 setOsType:v15];

      id v16 = [v11 objectForKey:@"_ProvisioningHostOSVersion"];
      [v13 setOsVersion:v16];

      v17 = [v11 objectForKey:@"_ProvisioningDeviceInfo"];
      [v13 setGrappaInfo:v17];

      id v18 = [v11 objectForKey:@"_ProvisioningEnabledDataClasses"];
      [v13 setEnabledDataClasses:v18];

      id v19 = [v11 objectForKey:@"_ProvisioningDeviceGUID"];
      [v13 setDeviceGUID:v19];

      v20 = [v11 objectForKey:@"_ProvisioningDevicePairingId"];
      if (v20) {
        goto LABEL_5;
      }
      v27 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v32 = v12;
        _os_log_impl(&dword_1D9A2D000, v27, OS_LOG_TYPE_DEFAULT, "No pairing ID provided from endpoint %{public}@ - assuming active paired device", buf, 0xCu);
      }

      uint64_t v28 = [MEMORY[0x1E4FB86D0] sharedMonitor];
      v29 = [v28 activePairedDevicePairingID];

      if (v29)
      {
        v20 = [v29 UUIDString];

        if (v20)
        {
LABEL_5:
          [v13 setDevicePairingId:v20];
        }
      }
      [(ATDeviceSettings *)self->_settings setHostInfo:v13 forLibrary:v12];
      v21 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v32 = v12;
        __int16 v33 = 2114;
        v34 = v13;
        _os_log_impl(&dword_1D9A2D000, v21, OS_LOG_TYPE_DEFAULT, "Registered with endpoint %{public}@ hostInfo=%{public}@", buf, 0x16u);
      }

      if ([(ATDeviceSettings *)self->_settings grappaEnabled])
      {
        v22 = [[ATGrappaSession alloc] initWithType:1];
        grappaSession = self->_grappaSession;
        self->_grappaSession = v22;

        long long v24 = self->_grappaSession;
        long long v25 = [v13 grappaInfo];
        id v30 = 0;
        id v9 = [(ATGrappaSession *)v24 establishHostSessionWithDeviceInfo:v25 clientRequestData:&v30];
        id v10 = v30;
      }
      else
      {
        id v10 = 0;
        id v9 = 0;
      }

      if (!v9)
      {
        [(ATDeviceProvisioningHandler *)self _sendCreateSessionRequestWithData:v10 onMessageLink:v7];
LABEL_15:

        goto LABEL_16;
      }
    }
    long long v26 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v32 = v9;
      _os_log_impl(&dword_1D9A2D000, v26, OS_LOG_TYPE_ERROR, "Failed to register endpoint: %{public}@", buf, 0xCu);
    }

    [v7 close];
    goto LABEL_15;
  }
LABEL_16:
}

- (void)_handleRegisterEndpointRequest:(id)a3 onMessageLink:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [v6 parameters];
  id v10 = [v9 objectForKey:@"_ProvisioningLibraryIdentifier"];
  if (v10)
  {
    [v7 setIdentifier:v10];
    id v11 = [(ATDeviceSettings *)self->_settings hostInfoForLibrary:v10];
    int v12 = [v9 objectForKey:@"_ProvisioningHostModel"];
    [v11 setModel:v12];

    id v13 = [v9 objectForKey:@"_ProvisioningHostOSType"];
    [v11 setOsType:v13];

    uint64_t v14 = [v9 objectForKey:@"_ProvisioningHostOSVersion"];
    [v11 setOsVersion:v14];

    v15 = [v9 objectForKey:@"_ProvisioningDeviceInfo"];
    [v11 setGrappaInfo:v15];

    id v16 = [v9 objectForKey:@"_ProvisioningEnabledDataClasses"];
    [v11 setEnabledDataClasses:v16];

    v17 = [v9 objectForKey:@"_ProvisioningDevicePairingId"];
    [v11 setDevicePairingId:v17];

    id v18 = [v9 objectForKey:@"_ProvisioningDeviceGUID"];
    [v11 setDeviceGUID:v18];

    id v19 = [v9 objectForKey:@"_ProvisioningDevicePairingId"];
    if (v19) {
      goto LABEL_3;
    }
    long long v26 = [MEMORY[0x1E4FB86D0] sharedMonitor];
    v27 = [v26 activePairedDevicePairingID];

    if (v27)
    {
      id v19 = [v27 UUIDString];

      if (v19)
      {
LABEL_3:
        [v11 setDevicePairingId:v19];
      }
    }
    [(ATDeviceSettings *)self->_settings setHostInfo:v11 forLibrary:v10];
    v20 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      __int16 v33 = v10;
      __int16 v34 = 2114;
      uint64_t v35 = v11;
      _os_log_impl(&dword_1D9A2D000, v20, OS_LOG_TYPE_DEFAULT, "Registering with endpoint %{public}@; hostInfo=%{public}@",
        buf,
        0x16u);
    }

    v21 = [(ATDeviceProvisioningHandler *)self _getEndpointInfo];
    [v8 addEntriesFromDictionary:v21];

    v22 = [[ATGrappaSession alloc] initWithType:0];
    grappaSession = self->_grappaSession;
    self->_grappaSession = v22;

    long long v24 = [(ATGrappaSession *)self->_grappaSession deviceInfo];
    if (v24)
    {
      [v8 setObject:v24 forKey:@"_ProvisioningDeviceInfo"];
      long long v25 = 0;
    }
    else
    {
      long long v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:0 userInfo:0];
    }
  }
  else
  {
    long long v25 = [MEMORY[0x1E4F28C58] errorWithDomain:@"ATError" code:21 userInfo:0];
  }
  uint64_t v28 = [v6 responseWithError:v25 parameters:v8];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __76__ATDeviceProvisioningHandler__handleRegisterEndpointRequest_onMessageLink___block_invoke;
  v30[3] = &unk_1E6B88AF0;
  id v31 = v7;
  id v29 = v7;
  [v29 sendResponse:v28 withCompletion:v30];
}

void __76__ATDeviceProvisioningHandler__handleRegisterEndpointRequest_onMessageLink___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v5 = 138543362;
      id v6 = v3;
      _os_log_impl(&dword_1D9A2D000, v4, OS_LOG_TYPE_ERROR, "Failed to send RegisterEndpoint response: %{public}@", (uint8_t *)&v5, 0xCu);
    }

    [*(id *)(a1 + 32) close];
  }
}

- (void)_sendRegisterEndpointRequestOnMessageLink:(id)a3
{
  id v4 = a3;
  int v5 = [(ATDeviceProvisioningHandler *)self _getEndpointInfo];
  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F4A2D0]) initWithCommand:@"ProvisioningRegisterEndpoint" dataClass:@"Provisioning" parameters:v5];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__ATDeviceProvisioningHandler__sendRegisterEndpointRequestOnMessageLink___block_invoke;
  v8[3] = &unk_1E6B882E0;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v7 sendRequest:v6 withCompletion:v8];
}

void __73__ATDeviceProvisioningHandler__sendRegisterEndpointRequestOnMessageLink___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (([v5 isPartial] & 1) == 0)
  {
    if (v6)
    {
      id v7 = _ATLogCategoryFramework();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v8 = 138543362;
        id v9 = v6;
        _os_log_impl(&dword_1D9A2D000, v7, OS_LOG_TYPE_ERROR, "Failed to provision link: %{public}@", (uint8_t *)&v8, 0xCu);
      }

      [*(id *)(a1 + 40) close];
    }
    else
    {
      [*(id *)(a1 + 32) _processRegisterEndpointResponse:v5 onMessageLink:*(void *)(a1 + 40)];
    }
  }
}

- (void)messageLink:(id)a3 didReceiveRequest:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 isInitialized])
  {
    int v8 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v7 command];
      int v19 = 138543362;
      v20 = v9;
      uint64_t v10 = "Received provisioning request on initialized link. command=%{public}@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
LABEL_4:
      _os_log_impl(&dword_1D9A2D000, v11, v12, v10, (uint8_t *)&v19, 0xCu);
    }
  }
  else
  {
    id v13 = [v7 command];
    int v14 = [v13 isEqualToString:@"ProvisioningRegisterEndpoint"];

    if (v14)
    {
      [(ATDeviceProvisioningHandler *)self _handleRegisterEndpointRequest:v7 onMessageLink:v6];
      goto LABEL_12;
    }
    v15 = [v7 command];
    int v16 = [v15 isEqualToString:@"ProvisioningCreateSession"];

    if (v16)
    {
      [(ATDeviceProvisioningHandler *)self _handleCreateSessionRequest:v7 onMessageLink:v6];
      goto LABEL_12;
    }
    v17 = [v7 command];
    int v18 = [v17 isEqualToString:@"ProvisioningBeginSession"];

    if (v18)
    {
      [(ATDeviceProvisioningHandler *)self _handleBeginSessionRequest:v7 onMessageLink:v6];
      goto LABEL_12;
    }
    int v8 = _ATLogCategoryFramework();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v7 command];
      int v19 = 138543362;
      v20 = v9;
      uint64_t v10 = "Received unexpected provisioning request. command=%{public}@";
      id v11 = v8;
      os_log_type_t v12 = OS_LOG_TYPE_INFO;
      goto LABEL_4;
    }
  }

  [v6 close];
LABEL_12:
}

- (void)messageLinkWasOpened:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 endpointType];
  id v6 = _ATLogCategoryFramework();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5 == 1)
  {
    if (v7)
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - starting provisioning", (uint8_t *)&v9, 0xCu);
    }

    [(ATDeviceProvisioningHandler *)self _sendRegisterEndpointRequestOnMessageLink:v4];
  }
  else
  {
    if (v7)
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl(&dword_1D9A2D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ opened - waiting for provisioning message from server", (uint8_t *)&v9, 0xCu);
    }
  }
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  self->_linkOpenTime = v8;
}

- (ATDeviceProvisioningHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)ATDeviceProvisioningHandler;
  v2 = [(ATDeviceProvisioningHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[ATDeviceSettings sharedInstance];
    settings = v2->_settings;
    v2->_settings = (ATDeviceSettings *)v3;
  }
  return v2;
}

@end