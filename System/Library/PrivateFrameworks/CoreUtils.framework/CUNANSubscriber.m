@interface CUNANSubscriber
- (CUNANSubscriber)init;
- (NSArray)discoveredEndpoints;
- (NSString)description;
- (NSString)label;
- (NSString)mockID;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)descriptionWithLevel:(int)a3;
- (id)endpointChangedHandler;
- (id)endpointFoundHandler;
- (id)endpointLostHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)receiveHandler;
- (unsigned)changeFlags;
- (unsigned)controlFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_lostAllEndpoints;
- (void)_subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)_subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)reportMockEndpointFound:(id)a3;
- (void)reportMockEndpointLost:(id)a3;
- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)setChangeFlags:(unsigned int)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEndpointChangedHandler:(id)a3;
- (void)setEndpointFoundHandler:(id)a3;
- (void)setEndpointLostHandler:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockID:(id)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5;
- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4;
- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6;
- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)subscriberStarted:(id)a3;
@end

@implementation CUNANSubscriber

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong(&self->_endpointChangedHandler, 0);
  objc_storeStrong(&self->_endpointLostHandler, 0);
  objc_storeStrong(&self->_endpointFoundHandler, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_wfaSubscriber, 0);
  objc_storeStrong((id *)&self->_wfaEndpoints, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setReceiveHandler:(id)a3
{
}

- (id)receiveHandler
{
  return self->_receiveHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setEndpointChangedHandler:(id)a3
{
}

- (id)endpointChangedHandler
{
  return self->_endpointChangedHandler;
}

- (void)setEndpointLostHandler:(id)a3
{
}

- (id)endpointLostHandler
{
  return self->_endpointLostHandler;
}

- (void)setEndpointFoundHandler:(id)a3
{
}

- (id)endpointFoundHandler
{
  return self->_endpointFoundHandler;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setMockID:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (NSString)label
{
  return self->_label;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)setChangeFlags:(unsigned int)a3
{
  self->_changeFlags = a3;
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (void)subscriber:(id)a3 receivedMessage:(id)a4 fromPublishID:(unsigned __int8)a5 address:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke;
  v14[3] = &unk_1E55BEE78;
  v14[4] = self;
  id v15 = v10;
  unsigned __int8 v17 = a5;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(dispatchQueue, v14);
}

void __68__CUNANSubscriber_subscriber_receivedMessage_fromPublishID_address___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 16)) {
    return;
  }
  v3 = (void (**)(id, void, CUNANEndpoint *))_Block_copy(*(const void **)(v1 + 200));
  if (v3)
  {
    id v12 = v3;
    v4 = objc_alloc_init(CUNANEndpoint);
    v5 = [*(id *)(a1 + 40) data];
    v6 = _WiFiAwareCreateEndpointIdentifier(v5);
    [(CUNANEndpoint *)v4 setIdentifier:v6];

    [(CUNANEndpoint *)v4 setInstanceID:*(unsigned __int8 *)(a1 + 56)];
    [(CUNANEndpoint *)v4 setMacAddress:*(void *)(a1 + 40)];
    v11 = *(int **)(*(void *)(a1 + 32) + 96);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu)) {
          goto LABEL_7;
        }
        v11 = *(int **)(*(void *)(a1 + 32) + 96);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANSubscriber subscriber:receivedMessage:fromPublishID:address:]_block_invoke", 0x1Eu, (uint64_t)"Received message: EP %@, Data %@", v7, v8, v9, v10, (uint64_t)v4);
    }
LABEL_7:
    v12[2](v12, *(void *)(a1 + 48), v4);

    v3 = v12;
  }
}

- (void)_subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v35 = a3;
  id v7 = a5;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      uint64_t v9 = [v7 data];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 9u, (uint64_t)"WFA lost result: PA <%@>, PI %u\n", v10, v11, v12, v13, (uint64_t)v9);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  v14 = [v7 data];
  id v15 = _WiFiAwareCreateEndpointIdentifier(v14);

  if (v15)
  {
    v24 = [(NSMutableDictionary *)self->_wfaEndpoints objectForKeyedSubscript:v15];
    if (v24)
    {
      pthread_mutex_lock(&self->_mutex);
      [(NSMutableDictionary *)self->_wfaEndpoints setObject:0 forKeyedSubscript:v15];
      pthread_mutex_unlock(&self->_mutex);
      v25 = self->_ucat;
      if (v25->var0 > 10) {
        goto LABEL_17;
      }
      if (v25->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
        {
LABEL_17:
          endpointLostHandler = (void (**)(id, void *))self->_endpointLostHandler;
          if (endpointLostHandler) {
            endpointLostHandler[2](endpointLostHandler, v24);
          }
          goto LABEL_19;
        }
        v25 = self->_ucat;
      }
      v26 = CUDescriptionWithLevel(v24, 50);
      LogPrintF((uint64_t)v25, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0xAu, (uint64_t)"Endpoint lost: %@\n", v27, v28, v29, v30, (uint64_t)v26);

      goto LABEL_17;
    }
    v32 = self->_ucat;
    if (v32->var0 <= 30)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x1Eu)) {
          goto LABEL_19;
        }
        v32 = self->_ucat;
      }
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0x1Eu, (uint64_t)"WFA lost result missing not found: %@\n", v20, v21, v22, v23, (uint64_t)v15);
    }
LABEL_19:

    goto LABEL_20;
  }
  v31 = self->_ucat;
  if (v31->var0 > 90) {
    goto LABEL_20;
  }
  if (v31->var0 != -1)
  {
LABEL_12:
    LogPrintF((uint64_t)v31, (uint64_t)"-[CUNANSubscriber _subscriber:lostDiscoveryResultForPublishID:address:]", 0x5Au, (uint64_t)"### WFA lost result missing identifier\n", v16, v17, v18, v19, v34);
    goto LABEL_20;
  }
  if (_LogCategory_Initialize((uint64_t)v31, 0x5Au))
  {
    v31 = self->_ucat;
    goto LABEL_12;
  }
LABEL_20:
}

- (void)subscriber:(id)a3 lostDiscoveryResultForPublishID:(unsigned __int8)a4 address:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke;
  v13[3] = &unk_1E55BEE78;
  v13[4] = self;
  id v14 = v8;
  unsigned __int8 v16 = a4;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_async(dispatchQueue, v13);
}

void *__70__CUNANSubscriber_subscriber_lostDiscoveryResultForPublishID_address___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[14]) {
    return (void *)[result _subscriber:*(void *)(a1 + 40) lostDiscoveryResultForPublishID:*(unsigned __int8 *)(a1 + 56) address:*(void *)(a1 + 48)];
  }
  return result;
}

- (void)_subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v47 = a3;
  id v6 = a4;
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      id v8 = [v6 publisherAddress];
      id v9 = [v8 data];
      [v6 publishID];
      uint64_t v10 = [v6 serviceName];
      v46 = [v6 serviceSpecificInfo];
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 9u, (uint64_t)"WFA discovery result: PA <%@>, PI %u, SV '%@', SI <%@>\n", v11, v12, v13, v14, (uint64_t)v9);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id v15 = [v6 publisherAddress];
  unsigned __int8 v16 = [v15 data];
  [v6 publishID];
  uint64_t v17 = _WiFiAwareCreateEndpointIdentifier(v16);

  if (!v17)
  {
    v33 = self->_ucat;
    if (v33->var0 > 90) {
      goto LABEL_28;
    }
    if (v33->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v33, 0x5Au)) {
        goto LABEL_28;
      }
      v33 = self->_ucat;
    }
    LogPrintF((uint64_t)v33, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0x5Au, (uint64_t)"### WFA discovery result missing identifier\n", v18, v19, v20, v21, v45);
    goto LABEL_28;
  }
  uint64_t v22 = [(NSMutableDictionary *)self->_wfaEndpoints objectForKeyedSubscript:v17];
  if (!v22)
  {
    uint64_t v23 = objc_alloc_init(CUNANEndpoint);
    [(CUNANEndpoint *)v23 setIdentifier:v17];
    [(CUNANEndpoint *)v23 updateWithDiscoveryResult:v6];
    pthread_mutex_lock(&self->_mutex);
    wfaEndpoints = self->_wfaEndpoints;
    if (!wfaEndpoints)
    {
      id v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v36 = self->_wfaEndpoints;
      self->_wfaEndpoints = v35;

      wfaEndpoints = self->_wfaEndpoints;
    }
    [(NSMutableDictionary *)wfaEndpoints setObject:v23 forKeyedSubscript:v17];
    pthread_mutex_unlock(&self->_mutex);
    v37 = self->_ucat;
    if (v37->var0 > 10) {
      goto LABEL_25;
    }
    if (v37->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
      {
LABEL_25:
        endpointFoundHandler = (void (**)(id, CUNANEndpoint *))self->_endpointFoundHandler;
        if (endpointFoundHandler) {
          endpointFoundHandler[2](endpointFoundHandler, v23);
        }
        goto LABEL_27;
      }
      v37 = self->_ucat;
    }
    v38 = CUDescriptionWithLevel(v23, 50);
    LogPrintF((uint64_t)v37, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0xAu, (uint64_t)"Endpoint found: %@\n", v39, v40, v41, v42, (uint64_t)v38);

    goto LABEL_25;
  }
  uint64_t v23 = v22;
  unsigned int v24 = [(CUNANEndpoint *)v22 updateWithDiscoveryResult:v6];
  unsigned int changeFlags = self->_changeFlags;
  uint64_t v26 = (v24 | 4) & changeFlags;
  if (((v24 | 4) & changeFlags) != 0)
  {
    uint64_t v27 = self->_ucat;
    if (v27->var0 > 10) {
      goto LABEL_22;
    }
    if (v27->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0xAu))
      {
LABEL_22:
        endpointChangedHandler = (void (**)(id, CUNANEndpoint *, void))self->_endpointChangedHandler;
        if (endpointChangedHandler) {
          endpointChangedHandler[2](endpointChangedHandler, v23, v26);
        }
        goto LABEL_27;
      }
      uint64_t v27 = self->_ucat;
    }
    uint64_t v28 = CUDescriptionWithLevel(v23, 50);
    LogPrintF((uint64_t)v27, (uint64_t)"-[CUNANSubscriber _subscriber:receivedDiscoveryResult:]", 0xAu, (uint64_t)"Endpoint changed: %@, %#{flags}\n", v29, v30, v31, v32, (uint64_t)v28);

    goto LABEL_22;
  }
LABEL_27:

LABEL_28:
}

- (void)subscriber:(id)a3 receivedDiscoveryResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke;
  block[3] = &unk_1E55BE528;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(dispatchQueue, block);
}

void *__54__CUNANSubscriber_subscriber_receivedDiscoveryResult___block_invoke(void *a1)
{
  result = (void *)a1[4];
  if (result[14]) {
    return (void *)[result _subscriber:a1[5] receivedDiscoveryResult:a1[6]];
  }
  return result;
}

- (void)subscriber:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __51__CUNANSubscriber_subscriber_terminatedWithReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 112)) {
    return;
  }
  id v10 = *(int **)(v8 + 96);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber subscriber:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber terminated: '%@', %s\n", a5, a6, a7, a8, *(void *)(v8 + 152));
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_8;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v11)
    {
      id v10 = *(int **)(v8 + 96);
      goto LABEL_4;
    }
  }
LABEL_8:
  uint64_t v34 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;

  uint64_t v20 = *(void *)(a1 + 40);
  if (!v34)
  {
    if (v20 == 2) {
      goto LABEL_15;
    }
LABEL_14:
    uint64_t v22 = *(unsigned char **)(a1 + 32);
    if (v22[16]) {
      goto LABEL_15;
    }
    [v22 _lostAllEndpoints];
    uint64_t v29 = *(void *)(a1 + 32);
    uint64_t v30 = *(void *)(v29 + 184);
    if (v30)
    {
      (*(void (**)(void))(v30 + 16))();
      uint64_t v29 = *(void *)(a1 + 32);
    }
    uint64_t v31 = *(int **)(v29 + 96);
    if (*v31 <= 30)
    {
      if (*v31 == -1)
      {
        BOOL v32 = _LogCategory_Initialize((uint64_t)v31, 0x1Eu);
        uint64_t v29 = *(void *)(a1 + 32);
        if (!v32) {
          goto LABEL_25;
        }
        uint64_t v31 = *(int **)(v29 + 96);
      }
      LogPrintF((uint64_t)v31, (uint64_t)"-[CUNANSubscriber subscriber:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber restarting after unexpected termination\n", v25, v26, v27, v28, v33);
      uint64_t v29 = *(void *)(a1 + 32);
    }
LABEL_25:
    [*(id *)(v29 + 112) start];
    goto LABEL_16;
  }
  if (v20 != 2)
  {
    uint64_t v21 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Unexpected terminate", v14, v15, v16, v17, v18, v19, v33);
    v34[2](v34, v21);

    goto LABEL_14;
  }
  ((void (*)(void))v34[2])();
LABEL_15:
  uint64_t v23 = *(void *)(a1 + 32);
  unsigned int v24 = *(void **)(v23 + 112);
  *(void *)(v23 + 112) = 0;

  [*(id *)(a1 + 32) _invalidated];
LABEL_16:
}

- (void)subscriber:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __53__CUNANSubscriber_subscriber_failedToStartWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 112)) {
    return;
  }
  uint64_t v10 = (*(_DWORD *)(a1 + 40) + 312300);
  BOOL v11 = *(int **)(v8 + 96);
  if (*v11 <= 90)
  {
    if (*v11 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANSubscriber subscriber:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFASubscriber start failed: '%@', %#m\n", a5, a6, a7, a8, *(void *)(v8 + 152));
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_7;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v12)
    {
      BOOL v11 = *(int **)(v8 + 96);
      goto LABEL_4;
    }
  }
LABEL_7:
  *(unsigned char *)(v8 + 88) = 1;
  uint64_t v26 = (void (**)(id, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 8));
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 8);
  *(void *)(v13 + 8) = 0;

  if (v26)
  {
    uint64_t v21 = NSErrorWithOSStatusF(v10, (uint64_t)"Subscriber start failed", v15, v16, v17, v18, v19, v20, v25);
    v26[2](v26, v21);
  }
  uint64_t v22 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v22 + 16)) {
    goto LABEL_15;
  }
  uint64_t v23 = *(int **)(v22 + 96);
  if (*v23 <= 30)
  {
    if (*v23 == -1)
    {
      BOOL v24 = _LogCategory_Initialize((uint64_t)v23, 0x1Eu);
      uint64_t v22 = *(void *)(a1 + 32);
      if (!v24) {
        goto LABEL_14;
      }
      uint64_t v23 = *(int **)(v22 + 96);
    }
    LogPrintF((uint64_t)v23, (uint64_t)"-[CUNANSubscriber subscriber:failedToStartWithError:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber stop after start completed", v17, v18, v19, v20, v25);
    uint64_t v22 = *(void *)(a1 + 32);
  }
LABEL_14:
  [*(id *)(v22 + 112) stop];
LABEL_15:
}

- (void)subscriberStarted:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CUNANSubscriber_subscriberStarted___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __37__CUNANSubscriber_subscriberStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 112)) {
    return;
  }
  uint64_t v10 = *(int **)(v8 + 96);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber subscriberStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber started: '%@'\n", a5, a6, a7, a8, *(void *)(v8 + 152));
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_7;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v8 + 96);
      goto LABEL_4;
    }
  }
LABEL_7:
  *(unsigned char *)(v8 + 88) = 1;
  id v23 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 8));
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;

  uint64_t v18 = v23;
  if (v23)
  {
    (*((void (**)(id, void))v23 + 2))(v23, 0);
    uint64_t v18 = v23;
  }
  uint64_t v19 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v19 + 16)) {
    goto LABEL_15;
  }
  uint64_t v20 = *(int **)(v19 + 96);
  if (*v20 <= 30)
  {
    if (*v20 == -1)
    {
      BOOL v21 = _LogCategory_Initialize((uint64_t)v20, 0x1Eu);
      uint64_t v19 = *(void *)(a1 + 32);
      if (!v21) {
        goto LABEL_14;
      }
      uint64_t v20 = *(int **)(v19 + 96);
    }
    LogPrintF((uint64_t)v20, (uint64_t)"-[CUNANSubscriber subscriberStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFASubscriber stop after start completed", v14, v15, v16, v17, v22);
    uint64_t v19 = *(void *)(a1 + 32);
  }
LABEL_14:
  [*(id *)(v19 + 112) stop];
  uint64_t v18 = v23;
LABEL_15:
}

- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke;
  v15[3] = &unk_1E55BEEF0;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v8;
  id v13 = v9;
  id v14 = v10;
  dispatch_async(dispatchQueue, v15);
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__5275;
  v38 = __Block_byref_object_dispose__5276;
  id v39 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v33 = &v34;
  aBlock[4] = v2;
  id v32 = *(id *)(a1 + 56);
  v3 = (void (**)(void))_Block_copy(aBlock);
  id v9 = *(id *)(*(void *)(a1 + 32) + 112);
  if (!v9)
  {
    uint64_t v23 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960551, (uint64_t)"Subscriber not activated", v4, v5, v6, v7, v8, v26);
    id v18 = (void *)v35[5];
    v35[5] = v23;
    goto LABEL_12;
  }
  id v10 = [*(id *)(a1 + 40) discoveryResult];
  BOOL v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 publishID];
    [v11 publisherAddress];
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 40) instanceID];
    [*(id *)(a1 + 40) macAddress];
  id v18 = };
  if (!v18)
  {
    uint64_t v24 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960591, (uint64_t)"No peer address", v13, v14, v15, v16, v17, v26);
    uint64_t v25 = (void *)v35[5];
    v35[5] = v24;

    goto LABEL_11;
  }
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(int **)(v19 + 96);
  if (*v20 <= 30)
  {
    if (*v20 == -1)
    {
      BOOL v21 = _LogCategory_Initialize((uint64_t)v20, 0x1Eu);
      uint64_t v19 = *(void *)(a1 + 32);
      if (!v21) {
        goto LABEL_10;
      }
      uint64_t v20 = *(int **)(v19 + 96);
    }
    LogPrintF((uint64_t)v20, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke", 0x1Eu, (uint64_t)"SendMessage start: EP %@, Data %.12@", v14, v15, v16, v17, *(void *)(a1 + 40));
    uint64_t v19 = *(void *)(a1 + 32);
  }
LABEL_10:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_3;
  v27[3] = &unk_1E55BE500;
  v27[4] = v19;
  uint64_t v22 = *(void *)(a1 + 48);
  id v28 = *(id *)(a1 + 40);
  id v29 = *(id *)(a1 + 48);
  id v30 = *(id *)(a1 + 56);
  [v9 sendMessage:v22 toPeerAddress:v18 withInstanceID:v12 completionHandler:v27];

LABEL_11:
LABEL_12:

  v3[2](v3);
  _Block_object_dispose(&v34, 8);
}

uint64_t __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  id v9 = (void *)result;
  id v10 = *(int **)(*(void *)(result + 32) + 96);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      id v10 = *(int **)(v9[4] + 96);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_2", 0x5Au, (uint64_t)"### SendMessage failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  BOOL v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 128);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_1E55BE4D8;
  uint64_t v9 = a2;
  block[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

void __62__CUNANSubscriber_sendMessageData_endpoint_completionHandler___block_invoke_4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[8];
  if (v9)
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], (v9 + 312300), (uint64_t)"SendMessage failed", a4, a5, a6, a7, a8, v18);
    uint64_t v15 = *(int **)(a1[4] + 96);
    id v19 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v15, 0x5Au)) {
          goto LABEL_9;
        }
        uint64_t v15 = *(int **)(a1[4] + 96);
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x5Au, (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}", v11, v12, v13, v14, a1[5]);
    }
LABEL_9:
    (*(void (**)(void))(a1[7] + 16))();

    return;
  }
  uint64_t v16 = *(int **)(a1[4] + 96);
  if (*v16 <= 30)
  {
    if (*v16 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu)) {
        goto LABEL_13;
      }
      uint64_t v16 = *(int **)(a1[4] + 96);
    }
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUNANSubscriber sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x1Eu, (uint64_t)"SendMessage completed: EP %@, Data %.12@", a5, a6, a7, a8, a1[5]);
  }
LABEL_13:
  uint64_t v17 = *(void (**)(void))(a1[7] + 16);
  v17();
}

- (void)reportMockEndpointLost:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CUNANSubscriber_reportMockEndpointLost___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__CUNANSubscriber_reportMockEndpointLost___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = *(int **)(v1 + 96);
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_5:
      id v4 = CUDescriptionWithLevel(*(void **)(v2 + 40), 50);
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUNANSubscriber reportMockEndpointLost:]_block_invoke", 0x1Eu, (uint64_t)"Mock Endpoint Lost: %@", v5, v6, v7, v8, (uint64_t)v4);

      uint64_t v1 = *(void *)(v2 + 32);
      goto LABEL_7;
    }
    BOOL v9 = _LogCategory_Initialize(*(void *)(v1 + 96), 0x1Eu);
    uint64_t v1 = *(void *)(v2 + 32);
    if (v9)
    {
      uint64_t v3 = *(int **)(v1 + 96);
      goto LABEL_5;
    }
  }
LABEL_7:
  result = *(void *)(v1 + 168);
  if (result)
  {
    uint64_t v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)reportMockEndpointFound:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CUNANSubscriber_reportMockEndpointFound___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __43__CUNANSubscriber_reportMockEndpointFound___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 16)) {
    return result;
  }
  uint64_t v2 = result;
  uint64_t v3 = *(int **)(v1 + 96);
  if (*v3 <= 30)
  {
    if (*v3 != -1)
    {
LABEL_5:
      id v4 = CUDescriptionWithLevel(*(void **)(v2 + 40), 50);
      LogPrintF((uint64_t)v3, (uint64_t)"-[CUNANSubscriber reportMockEndpointFound:]_block_invoke", 0x1Eu, (uint64_t)"Mock Endpoint found: %@", v5, v6, v7, v8, (uint64_t)v4);

      uint64_t v1 = *(void *)(v2 + 32);
      goto LABEL_7;
    }
    BOOL v9 = _LogCategory_Initialize(*(void *)(v1 + 96), 0x1Eu);
    uint64_t v1 = *(void *)(v2 + 32);
    if (v9)
    {
      uint64_t v3 = *(int **)(v1 + 96);
      goto LABEL_5;
    }
  }
LABEL_7:
  result = *(void *)(v1 + 160);
  if (result)
  {
    uint64_t v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)_lostAllEndpoints
{
  if (self->_endpointLostHandler)
  {
    wfaEndpoints = self->_wfaEndpoints;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__CUNANSubscriber__lostAllEndpoints__block_invoke;
    v4[3] = &unk_1E55BE4B0;
    v4[4] = self;
    [(NSMutableDictionary *)wfaEndpoints enumerateKeysAndObjectsUsingBlock:v4];
  }
  pthread_mutex_lock(&self->_mutex);
  [(NSMutableDictionary *)self->_wfaEndpoints removeAllObjects];
  pthread_mutex_unlock(&self->_mutex);
}

void __36__CUNANSubscriber__lostAllEndpoints__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v14 = a2;
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  uint64_t v7 = *(int **)(v6 + 96);
  if (*v7 <= 10)
  {
    if (*v7 != -1)
    {
LABEL_3:
      uint64_t v8 = CUDescriptionWithLevel(v5, 50);
      LogPrintF((uint64_t)v7, (uint64_t)"-[CUNANSubscriber _lostAllEndpoints]_block_invoke", 0xAu, (uint64_t)"Endpoint lost: %@\n", v9, v10, v11, v12, (uint64_t)v8);

      uint64_t v6 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v13 = _LogCategory_Initialize(*(void *)(v6 + 96), 0xAu);
    uint64_t v6 = *(void *)(a1 + 32);
    if (v13)
    {
      uint64_t v7 = *(int **)(v6 + 96);
      goto LABEL_3;
    }
  }
LABEL_5:
  (*(void (**)(void))(*(void *)(v6 + 168) + 16))();
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone && !self->_wfaSubscriber)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id endpointFoundHandler = self->_endpointFoundHandler;
    self->_id endpointFoundHandler = 0;

    id endpointLostHandler = self->_endpointLostHandler;
    self->_id endpointLostHandler = 0;

    id endpointChangedHandler = self->_endpointChangedHandler;
    self->_id endpointChangedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id receiveHandler = self->_receiveHandler;
    self->_id receiveHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v10, v11, v12, v13, v16);
    }
  }
}

- (void)_invalidate
{
  if (self->_invalidateCalled) {
    return;
  }
  self->_invalidateCalled = 1;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v13);
      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  id v14 = self->_mockID;
  if (v14) {
    CUNANMockRemoveSubscriber(v14, self);
  }
  if (self->_startedCalled)
  {
    [(WiFiAwareSubscriber *)self->_wfaSubscriber stop];
  }
  else
  {
    uint64_t v12 = self->_ucat;
    if (v12->var0 <= 30)
    {
      if (v12->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v12, 0x1Eu)) {
          goto LABEL_14;
        }
        uint64_t v12 = self->_ucat;
      }
      LogPrintF((uint64_t)v12, (uint64_t)"-[CUNANSubscriber _invalidate]", 0x1Eu, (uint64_t)"Deferring stop until start completes", v8, v9, v10, v11, v13);
    }
  }
LABEL_14:
  [(CUNANSubscriber *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CUNANSubscriber_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __29__CUNANSubscriber_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  aBlock = a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate '%@', %#{flags}\n", v4, v5, v6, v7, (uint64_t)self->_serviceType);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  uint64_t v9 = self->_serviceType;
  if (![(NSString *)v9 length])
  {
    NSErrorWithOSStatusF(4294960591, (uint64_t)"No service name", v10, v11, v12, v13, v14, v15, v54);
    uint64_t v17 = (NSString *)objc_claimAutoreleasedReturnValue();
    uint64_t v34 = self->_ucat;
    if (v34->var0 <= 90)
    {
      if (v34->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v34, 0x5Au)) {
          goto LABEL_33;
        }
        uint64_t v34 = self->_ucat;
      }
      LogPrintF((uint64_t)v34, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v30, v31, v32, v33, (uint64_t)v17);
    }
LABEL_33:
    if (!aBlock) {
      goto LABEL_41;
    }
    id v29 = (void (*)(void))aBlock[2];
    goto LABEL_35;
  }
  uint64_t v16 = self->_mockID;
  if (!v16)
  {
    id v35 = (void *)[objc_alloc((Class)getWiFiAwareSubscribeConfigurationClass[0]()) initWithServiceName:v9];
    uint64_t v36 = v35;
    if (self->_controlFlags) {
      [v35 setAuthenticationType:0];
    }
    v37 = (WiFiAwareSubscriber *)[objc_alloc((Class)getWiFiAwareSubscriberClass[0]()) initWithConfiguration:v36];
    wfaSubscriber = self->_wfaSubscriber;
    self->_wfaSubscriber = v37;

    uint64_t v45 = self->_wfaSubscriber;
    if (v45)
    {
      [(WiFiAwareSubscriber *)v45 setDelegate:self];
      v46 = _Block_copy(aBlock);
      id activateCompletion = self->_activateCompletion;
      self->_id activateCompletion = v46;

      [(WiFiAwareSubscriber *)self->_wfaSubscriber start];
LABEL_40:

      uint64_t v17 = 0;
      goto LABEL_41;
    }
    v52 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Create WFASubscriber failed", v39, v40, v41, v42, v43, v44, v54);
    v53 = self->_ucat;
    if (v53->var0 <= 90)
    {
      if (v53->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v53, 0x5Au)) {
          goto LABEL_37;
        }
        v53 = self->_ucat;
      }
      LogPrintF((uint64_t)v53, (uint64_t)"-[CUNANSubscriber _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v48, v49, v50, v51, (uint64_t)v52);
    }
LABEL_37:
    if (aBlock) {
      ((void (*)(void))aBlock[2])();
    }

    goto LABEL_40;
  }
  uint64_t v17 = v16;
  uint64_t v18 = self;
  os_unfair_lock_lock((os_unfair_lock_t)&gCUNANMockLock);
  id v19 = [(id)gCUNANMockSubscribers objectForKeyedSubscript:v17];
  if (!v19)
  {
    id v19 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
    uint64_t v20 = (void *)gCUNANMockSubscribers;
    if (!gCUNANMockSubscribers)
    {
      id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v22 = (void *)gCUNANMockSubscribers;
      gCUNANMockSubscribers = (uint64_t)v21;

      uint64_t v20 = (void *)gCUNANMockSubscribers;
    }
    [v20 setObject:v19 forKeyedSubscript:v17];
  }
  [v19 addObject:v18];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  uint64_t v23 = [(id)gCUNANMockPublishers objectForKeyedSubscript:v17];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v57 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v56 + 1) + 8 * i) mockEndpoint];
        if (v28) {
          [(CUNANSubscriber *)v18 reportMockEndpointFound:v28];
        }
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v56 objects:v60 count:16];
    }
    while (v25);
  }

  os_unfair_lock_unlock((os_unfair_lock_t)&gCUNANMockLock);
  if (aBlock)
  {
    id v29 = (void (*)(void))aBlock[2];
LABEL_35:
    v29();
  }
LABEL_41:
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__CUNANSubscriber_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __42__CUNANSubscriber_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD148;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSArray)discoveredEndpoints
{
  p_mutex = &self->_mutex;
  pthread_mutex_lock(&self->_mutex);
  wfaEndpoints = self->_wfaEndpoints;
  if (wfaEndpoints)
  {
    id v5 = [(NSMutableDictionary *)wfaEndpoints allValues];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  pthread_mutex_unlock(p_mutex);
  return (NSArray *)v5;
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v43 = 0;
  uint64_t v44 = (id *)&v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__5275;
  id v47 = __Block_byref_object_dispose__5276;
  id v48 = 0;
  id obj = 0;
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"CUNANSubscriber %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_serviceType);
  objc_storeStrong(&v48, obj);
  uint64_t changeFlags = self->_changeFlags;
  if (changeFlags)
  {
    uint64_t v17 = v44;
    id v41 = v44[5];
    NSAppendPrintF((CFMutableStringRef *)&v41, (uint64_t)", CF %{flags}", v10, v11, v12, v13, v14, v15, changeFlags);
    objc_storeStrong(v17 + 5, v41);
  }
  uint64_t v18 = v44;
  id v40 = v44[5];
  uint64_t v19 = [(NSMutableDictionary *)self->_wfaEndpoints count];
  NSAppendPrintF((CFMutableStringRef *)&v40, (uint64_t)", %d endpoints(s)", v20, v21, v22, v23, v24, v25, v19);
  objc_storeStrong(v18 + 5, v40);
  if (a3 <= 20)
  {
    uint64_t v32 = v44;
    id v39 = v44[5];
    NSAppendPrintF((CFMutableStringRef *)&v39, (uint64_t)"\n", v26, v27, v28, v29, v30, v31, v36);
    objc_storeStrong(v32 + 5, v39);
    wfaEndpoints = self->_wfaEndpoints;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __40__CUNANSubscriber_descriptionWithLevel___block_invoke;
    v37[3] = &unk_1E55BE488;
    int v38 = a3;
    v37[4] = &v43;
    [(NSMutableDictionary *)wfaEndpoints enumerateKeysAndObjectsUsingBlock:v37];
  }
  id v34 = v44[5];
  _Block_object_dispose(&v43, 8);

  return v34;
}

void __40__CUNANSubscriber_descriptionWithLevel___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (*(int *)(a1 + 40) >= 11) {
    uint64_t v3 = 50;
  }
  else {
    uint64_t v3 = 30;
  }
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id obj = *(id *)(v4 + 40);
  CUDescriptionWithLevel(a3, v3);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  NSAppendPrintF((CFMutableStringRef *)&obj, (uint64_t)"    %@\n", v5, v6, v7, v8, v9, v10, (uint64_t)v11);
  objc_storeStrong((id *)(v4 + 40), obj);
}

- (NSString)description
{
  return (NSString *)[(CUNANSubscriber *)self descriptionWithLevel:50];
}

- (void)dealloc
{
  uint64_t v3 = self->_mockID;
  uint64_t v4 = v3;
  if (v3) {
    CUNANMockRemoveSubscriber(v3, self);
  }
  pthread_mutex_destroy(&self->_mutex);
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CUNANSubscriber;
  [(CUNANSubscriber *)&v6 dealloc];
}

- (CUNANSubscriber)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUNANSubscriber;
  uint64_t v2 = [(CUNANSubscriber *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANSubscriber;
    pthread_mutex_init(&v2->_mutex, 0);
    uint64_t v3 = v2;
  }

  return v2;
}

@end