@interface CUNANPublisher
- (BOOL)dataPathEnabled;
- (CUNANEndpoint)mockEndpoint;
- (CUNANPublisher)init;
- (NSArray)dataSessions;
- (NSData)customData;
- (NSDictionary)textInfo;
- (NSString)description;
- (NSString)label;
- (NSString)mockID;
- (NSString)mockPeerEndpointString;
- (NSString)name;
- (NSString)serviceType;
- (OS_dispatch_queue)dispatchQueue;
- (id)dataSessionEndedHandler;
- (id)dataSessionStartedHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)receiveHandler;
- (int)port;
- (unsigned)controlFlags;
- (unsigned)trafficFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)_updateServiceSpecificInfo;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)generateStatisticsReportWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6;
- (void)publisher:(id)a3 dataIndicatedForHandle:(id)a4 serviceSpecificInfo:(id)a5;
- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5;
- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6;
- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)publisherStarted:(id)a3;
- (void)reportIssue:(id)a3;
- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5;
- (void)setControlFlags:(unsigned int)a3;
- (void)setCustomData:(id)a3;
- (void)setDataPathEnabled:(BOOL)a3;
- (void)setDataSessionEndedHandler:(id)a3;
- (void)setDataSessionStartedHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setMockEndpoint:(id)a3;
- (void)setMockID:(id)a3;
- (void)setMockPeerEndpointString:(id)a3;
- (void)setName:(id)a3;
- (void)setPort:(int)a3;
- (void)setReceiveHandler:(id)a3;
- (void)setServiceType:(id)a3;
- (void)setTextInfo:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)updateLinkStatus:(int)a3;
@end

@implementation CUNANPublisher

- (void).cxx_destruct
{
  objc_storeStrong(&self->_receiveHandler, 0);
  objc_storeStrong(&self->_dataSessionEndedHandler, 0);
  objc_storeStrong(&self->_dataSessionStartedHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_textInfo, 0);
  objc_storeStrong((id *)&self->_serviceType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_mockPeerEndpointString, 0);
  objc_storeStrong((id *)&self->_mockID, 0);
  objc_storeStrong((id *)&self->_mockEndpoint, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_customData, 0);
  objc_storeStrong((id *)&self->_wfaPublisher, 0);
  objc_storeStrong((id *)&self->_sessions, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setReceiveHandler:(id)a3
{
}

- (id)receiveHandler
{
  return self->_receiveHandler;
}

- (void)setDataSessionEndedHandler:(id)a3
{
}

- (id)dataSessionEndedHandler
{
  return self->_dataSessionEndedHandler;
}

- (void)setDataSessionStartedHandler:(id)a3
{
}

- (id)dataSessionStartedHandler
{
  return self->_dataSessionStartedHandler;
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

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (NSDictionary)textInfo
{
  return self->_textInfo;
}

- (void)setServiceType:(id)a3
{
}

- (NSString)serviceType
{
  return self->_serviceType;
}

- (void)setPort:(int)a3
{
  self->_port = a3;
}

- (int)port
{
  return self->_port;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setMockPeerEndpointString:(id)a3
{
}

- (NSString)mockPeerEndpointString
{
  return self->_mockPeerEndpointString;
}

- (void)setMockID:(id)a3
{
}

- (NSString)mockID
{
  return self->_mockID;
}

- (void)setMockEndpoint:(id)a3
{
}

- (CUNANEndpoint)mockEndpoint
{
  return self->_mockEndpoint;
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

- (void)setDataPathEnabled:(BOOL)a3
{
  self->_dataPathEnabled = a3;
}

- (BOOL)dataPathEnabled
{
  return self->_dataPathEnabled;
}

- (void)setCustomData:(id)a3
{
}

- (NSData)customData
{
  return self->_customData;
}

- (void)setControlFlags:(unsigned int)a3
{
  self->_controlFlags = a3;
}

- (unsigned)controlFlags
{
  return self->_controlFlags;
}

- (void)publisher:(id)a3 dataTerminatedForHandle:(id)a4 reason:(int64_t)a5
{
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke;
  block[3] = &unk_1E55BEE28;
  block[4] = self;
  id v11 = v7;
  int64_t v12 = a5;
  id v9 = v7;
  dispatch_async(dispatchQueue, block);
}

uint64_t __59__CUNANPublisher_publisher_dataTerminatedForHandle_reason___block_invoke(uint64_t result)
{
  if (!*(void *)(*(void *)(result + 32) + 40)) {
    return result;
  }
  uint64_t v1 = result;
  v2 = [*(id *)(result + 40) initiatorDataAddress];
  v3 = [v2 data];
  [*(id *)(v1 + 40) datapathID];
  uint64_t v38 = _WiFiAwareCreateEndpointIdentifier(v3);

  uint64_t v8 = (*(_DWORD *)(v1 + 48) + 312370);
  uint64_t v9 = *(void *)(v1 + 32);
  v10 = *(int **)(v9 + 32);
  if (*v10 <= 30)
  {
    if (*v10 != -1) {
      goto LABEL_4;
    }
    BOOL v12 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(v1 + 32);
    if (v12)
    {
      v10 = *(int **)(v9 + 32);
LABEL_4:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession terminated: '%@', %@, %#m\n", v4, v5, v6, v7, *(void *)(v9 + 120));
      uint64_t v9 = *(void *)(v1 + 32);
      if (!v38) {
        goto LABEL_5;
      }
LABEL_11:
      v17 = objc_msgSend(*(id *)(v9 + 24), "objectForKeyedSubscript:");
      v18 = *(void **)(v1 + 32);
      if (v17)
      {
        v19 = v18;
        objc_sync_enter(v19);
        [*(id *)(*(void *)(v1 + 32) + 24) setObject:0 forKeyedSubscript:v38];
        objc_sync_exit(v19);

        v26 = *(uint64_t **)(v1 + 32);
        v27 = (int *)v26[4];
        if (*v27 <= 30)
        {
          if (*v27 == -1)
          {
            BOOL v34 = _LogCategory_Initialize(v26[4], 0x1Eu);
            v26 = *(uint64_t **)(v1 + 32);
            if (!v34) {
              goto LABEL_19;
            }
            v27 = (int *)v26[4];
          }
          v28 = CUDescriptionWithLevel(v17, 50);
          LogPrintF((uint64_t)v27, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x1Eu, (uint64_t)"DataSession ended: %@\n", v29, v30, v31, v32, (uint64_t)v28);

          v26 = *(uint64_t **)(v1 + 32);
        }
LABEL_19:
        uint64_t v35 = v26[20];
        if (v35)
        {
          v36 = NSErrorWithOSStatusF(v8, (uint64_t)"DataSession terminated", v20, v21, v22, v23, v24, v25, v37);
          (*(void (**)(uint64_t, void *, void *))(v35 + 16))(v35, v17, v36);

          v26 = *(uint64_t **)(v1 + 32);
        }
        [v26 _invalidated];
        goto LABEL_22;
      }
      v33 = (int *)v18[4];
      if (*v33 <= 60)
      {
        if (*v33 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v33, 0x3Cu)) {
            goto LABEL_22;
          }
          v18 = *(void **)(v1 + 32);
          v33 = (int *)v18[4];
        }
        LogPrintF((uint64_t)v33, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x3Cu, (uint64_t)"### WFA DataSession terminated untracked: '%@', %@, %#m\n", v13, v14, v15, v16, v18[15]);
      }
LABEL_22:

      goto LABEL_23;
    }
  }
  if (v38) {
    goto LABEL_11;
  }
LABEL_5:
  uint64_t v11 = *(void *)(v9 + 32);
  if (*(int *)v11 <= 90)
  {
    if (*(_DWORD *)v11 == -1)
    {
      uint64_t v11 = _LogCategory_Initialize(v11, 0x5Au);
      if (!v11) {
        goto LABEL_23;
      }
      uint64_t v11 = *(void *)(*(void *)(v1 + 32) + 32);
    }
    uint64_t v11 = LogPrintF(v11, (uint64_t)"-[CUNANPublisher publisher:dataTerminatedForHandle:reason:]_block_invoke", 0x5Au, (uint64_t)"### WFA DataSession terminated missing identifier: %#m\n", v4, v5, v6, v7, v8);
  }
LABEL_23:
  return MEMORY[0x1F4181820](v11);
}

- (void)_publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v39 = a3;
  id v10 = a4;
  id v11 = a6;
  BOOL v12 = [v10 initiatorDataAddress];
  uint64_t v13 = [v12 data];
  [v10 datapathID];
  uint64_t v14 = _WiFiAwareCreateEndpointIdentifier(v13);

  if (v14)
  {
    v19 = [(NSMutableDictionary *)self->_sessions objectForKeyedSubscript:v14];

    if (v19)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        goto LABEL_25;
      }
      if (ucat->var0 != -1) {
        goto LABEL_5;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
      {
        ucat = self->_ucat;
LABEL_5:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x5Au, (uint64_t)"### WFA DataSession confirmed for existing session: %@\n", v20, v21, v22, v23, (uint64_t)v14);
        goto LABEL_25;
      }
      goto LABEL_25;
    }
    v26 = objc_alloc_init(CUNANEndpoint);
    [(CUNANEndpoint *)v26 setIdentifier:v14];
    [(CUNANEndpoint *)v26 setServiceType:self->_serviceType];
    v27 = objc_alloc_init(CUNANDataSession);
    [(CUNANDataSession *)v27 setDispatchQueue:self->_dispatchQueue];
    [(CUNANDataSession *)v27 setIdentifier:v14];
    if (self->_label) {
      -[CUNANDataSession setLabel:](v27, "setLabel:");
    }
    [(CUNANDataSession *)v27 setLocalInterfaceIndex:v7];
    [(CUNANDataSession *)v27 setPeerEndpoint:v26];
    [(CUNANDataSession *)v27 setTrafficFlags:self->_trafficFlags];
    [(CUNANDataSession *)v27 setWfaDataSessionServer:v10];
    uint64_t v32 = self->_ucat;
    if (v32->var0 <= 30)
    {
      if (v32->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v32, 0x1Eu)) {
          goto LABEL_20;
        }
        uint64_t v32 = self->_ucat;
      }
      LogPrintF((uint64_t)v32, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x1Eu, (uint64_t)"DataSession started: %@\n", v28, v29, v30, v31, (uint64_t)v27);
    }
LABEL_20:
    v33 = self;
    objc_sync_enter(v33);
    sessions = self->_sessions;
    if (!sessions)
    {
      uint64_t v35 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v36 = self->_sessions;
      self->_sessions = v35;

      sessions = self->_sessions;
    }
    [(NSMutableDictionary *)sessions setObject:v27 forKeyedSubscript:v14];
    objc_sync_exit(v33);

    dataSessionStartedHandler = (void (**)(id, CUNANDataSession *))v33->_dataSessionStartedHandler;
    if (dataSessionStartedHandler) {
      dataSessionStartedHandler[2](dataSessionStartedHandler, v27);
    }

    goto LABEL_25;
  }
  uint64_t v25 = self->_ucat;
  if (v25->var0 > 90) {
    goto LABEL_25;
  }
  if (v25->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)v25, 0x5Au)) {
      goto LABEL_25;
    }
    uint64_t v25 = self->_ucat;
  }
  LogPrintF((uint64_t)v25, (uint64_t)"-[CUNANPublisher _publisher:dataConfirmedForHandle:localInterfaceIndex:serviceSpecificInfo:]", 0x5Au, (uint64_t)"### WFA DataSession confirmed missing identifier\n", v15, v16, v17, v18, v38);
LABEL_25:
}

- (void)publisher:(id)a3 dataConfirmedForHandle:(id)a4 localInterfaceIndex:(unsigned int)a5 serviceSpecificInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke;
  block[3] = &unk_1E55BE460;
  block[4] = self;
  id v18 = v10;
  unsigned int v21 = a5;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_async(dispatchQueue, block);
}

void *__91__CUNANPublisher_publisher_dataConfirmedForHandle_localInterfaceIndex_serviceSpecificInfo___block_invoke(uint64_t a1)
{
  result = *(void **)(a1 + 32);
  if (result[5]) {
    return (void *)[result _publisher:*(void *)(a1 + 40) dataConfirmedForHandle:*(void *)(a1 + 48) localInterfaceIndex:*(unsigned int *)(a1 + 64) serviceSpecificInfo:*(void *)(a1 + 56)];
  }
  return result;
}

- (void)publisher:(id)a3 dataIndicatedForHandle:(id)a4 serviceSpecificInfo:(id)a5
{
  id v6 = a4;
  uint64_t v7 = [v6 initiatorDataAddress];
  uint64_t v8 = [v7 data];
  [v6 datapathID];

  _WiFiAwareCreateEndpointIdentifier(v8);
  id v14 = (id)objc_claimAutoreleasedReturnValue();

  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher publisher:dataIndicatedForHandle:serviceSpecificInfo:]", 0x1Eu, (uint64_t)"WFA DataSession indicated: '%@', %@\n", v9, v10, v11, v12, (uint64_t)self->_serviceType);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
}

- (void)publisher:(id)a3 receivedMessage:(id)a4 fromSubscriberID:(unsigned __int8)a5 subscriberAddress:(id)a6
{
  id v9 = a4;
  id v10 = a6;
  dispatchQueue = self->_dispatchQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke;
  v14[3] = &unk_1E55BEE78;
  v14[4] = self;
  id v15 = v10;
  unsigned __int8 v17 = a5;
  id v16 = v9;
  id v12 = v9;
  id v13 = v10;
  dispatch_async(dispatchQueue, v14);
}

void __79__CUNANPublisher_publisher_receivedMessage_fromSubscriberID_subscriberAddress___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 16)) {
    return;
  }
  v3 = (void (**)(id, void, CUNANEndpoint *))_Block_copy(*(const void **)(v1 + 168));
  if (v3)
  {
    id v12 = v3;
    uint64_t v4 = objc_alloc_init(CUNANEndpoint);
    uint64_t v5 = [*(id *)(a1 + 40) data];
    id v6 = _WiFiAwareCreateEndpointIdentifier(v5);
    [(CUNANEndpoint *)v4 setIdentifier:v6];

    [(CUNANEndpoint *)v4 setInstanceID:*(unsigned __int8 *)(a1 + 56)];
    [(CUNANEndpoint *)v4 setMacAddress:*(void *)(a1 + 40)];
    uint64_t v11 = *(int **)(*(void *)(a1 + 32) + 32);
    if (*v11 <= 30)
    {
      if (*v11 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v11, 0x1Eu)) {
          goto LABEL_7;
        }
        uint64_t v11 = *(int **)(*(void *)(a1 + 32) + 32);
      }
      LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANPublisher publisher:receivedMessage:fromSubscriberID:subscriberAddress:]_block_invoke", 0x1Eu, (uint64_t)"Received message: EP %@, Data %@", v7, v8, v9, v10, (uint64_t)v4);
    }
LABEL_7:
    v12[2](v12, *(void *)(a1 + 48), v4);

    v3 = v12;
  }
}

- (void)publisher:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __49__CUNANPublisher_publisher_terminatedWithReason___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40)) {
    return;
  }
  uint64_t v10 = *(int **)(v8 + 32);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisher:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher terminated: '%@', %s\n", a5, a6, a7, a8, *(void *)(v8 + 120));
      uint64_t v8 = *(void *)(a1 + 32);
      goto LABEL_8;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = *(int **)(v8 + 32);
      goto LABEL_4;
    }
  }
LABEL_8:
  uint64_t v28 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  uint64_t v12 = *(void *)(a1 + 32);
  id v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;

  uint64_t v19 = *(void *)(a1 + 40);
  if (!v28)
  {
    if (v19 == 2) {
      goto LABEL_12;
    }
LABEL_14:
    uint64_t v23 = *(void *)(a1 + 32);
    uint64_t v24 = *(void *)(v23 + 136);
    if (v24)
    {
      (*(void (**)(void))(v24 + 16))();
      uint64_t v23 = *(void *)(a1 + 32);
    }
    if (*(unsigned char *)(v23 + 16)) {
      goto LABEL_22;
    }
    uint64_t v25 = *(int **)(v23 + 32);
    if (*v25 > 30) {
      goto LABEL_21;
    }
    if (*v25 == -1)
    {
      BOOL v26 = _LogCategory_Initialize((uint64_t)v25, 0x1Eu);
      uint64_t v23 = *(void *)(a1 + 32);
      if (!v26) {
        goto LABEL_21;
      }
      uint64_t v25 = *(int **)(v23 + 32);
    }
    LogPrintF((uint64_t)v25, (uint64_t)"-[CUNANPublisher publisher:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher restarting after unexpected termination\n", v15, v16, v17, v18, v27);
    uint64_t v23 = *(void *)(a1 + 32);
LABEL_21:
    [*(id *)(v23 + 40) start];
    goto LABEL_22;
  }
  if (v19 != 2)
  {
    uint64_t v22 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Publisher start failed", (uint64_t)v28, v14, v15, v16, v17, v18, v27);
    v28[2](v28, v22);

    goto LABEL_14;
  }
  v28[2](v28, 0);
LABEL_12:
  uint64_t v20 = *(void *)(a1 + 32);
  unsigned int v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;

  [*(id *)(a1 + 32) _invalidated];
LABEL_22:
}

- (void)publisher:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __51__CUNANPublisher_publisher_failedToStartWithError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40)) {
    return;
  }
  uint64_t v10 = (*(_DWORD *)(a1 + 40) + 312300);
  BOOL v11 = *(int **)(v8 + 32);
  if (*v11 <= 90)
  {
    if (*v11 == -1)
    {
      BOOL v12 = _LogCategory_Initialize((uint64_t)v11, 0x5Au);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v12) {
        goto LABEL_7;
      }
      BOOL v11 = *(int **)(v8 + 32);
    }
    LogPrintF((uint64_t)v11, (uint64_t)"-[CUNANPublisher publisher:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFAPublisher start failed: '%@', %#m\n", a5, a6, a7, a8, *(void *)(v8 + 120));
    uint64_t v8 = *(void *)(a1 + 32);
  }
LABEL_7:
  uint64_t v23 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(void **)(v13 + 8);
  *(void *)(v13 + 8) = 0;

  if (v23)
  {
    unsigned int v21 = NSErrorWithOSStatusF(v10, (uint64_t)"Publisher start failed", v15, v16, v17, v18, v19, v20, v22);
    v23[2](v23, v21);
  }
}

- (void)publisherStarted:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CUNANPublisher_publisherStarted___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __35__CUNANPublisher_publisherStarted___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 40)) {
    return;
  }
  uint64_t v10 = *(int **)(v8 + 32);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v8 + 32);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher publisherStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFAPublisher started: '%@'\n", a5, a6, a7, a8, *(void *)(v8 + 120));
    uint64_t v8 = *(void *)(a1 + 32);
  }
LABEL_7:
  uint64_t v15 = _Block_copy(*(const void **)(v8 + 8));
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;

  uint64_t v14 = v15;
  if (v15)
  {
    (*((void (**)(void *, void))v15 + 2))(v15, 0);
    uint64_t v14 = v15;
  }
}

- (void)_updateServiceSpecificInfo
{
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      name = self->_name;
      BOOL v34 = NSPrintF((uint64_t)"%##@", (uint64_t)a2, v2, v3, v4, v5, v6, v7, (uint64_t)self->_textInfo);
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]", 0x1Eu, (uint64_t)"Update SSI: name=%@, customData=%@, textInfo=%@", v11, v12, v13, v14, (uint64_t)name);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id v15 = objc_alloc_init((Class)getWiFiAwarePublishServiceSpecificInfoClass[0]());
  [v15 setInstanceName:self->_name];
  if (self->_customData) {
    objc_msgSend(v15, "setBlob:");
  }
  textInfo = self->_textInfo;
  if (textInfo)
  {
    id v36 = 0;
    uint64_t v18 = (void *)CUTXTDataCreateWithDictionary(textInfo, v16, &v36);
    id v26 = v36;
    if (v18)
    {
      [v15 setTxtRecordData:v18];
    }
    else
    {
      uint64_t v27 = self->_ucat;
      if (v27->var0 <= 90)
      {
        if (v27->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x5Au)) {
            goto LABEL_14;
          }
          uint64_t v27 = self->_ucat;
        }
        uint64_t v28 = NSPrintF((uint64_t)"%{error}", v19, v20, v21, v22, v23, v24, v25, (uint64_t)v26);
        LogPrintF_safe((uint64_t)v27, (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]", 0x5Au, (uint64_t)"### Update textInfo failed: error=%@", v29, v30, v31, v32, (uint64_t)v28);
      }
    }
LABEL_14:
  }
  wfaPublisher = self->_wfaPublisher;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __44__CUNANPublisher__updateServiceSpecificInfo__block_invoke;
  v35[3] = &unk_1E55BE438;
  v35[4] = self;
  [(WiFiAwarePublisher *)wfaPublisher updateServiceSpecificInfo:v15 completionHandler:v35];
}

uint64_t __44__CUNANPublisher__updateServiceSpecificInfo__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a2)
  {
    uint64_t v8 = result;
    result = *(void *)(*(void *)(result + 32) + 32);
    if (*(int *)result <= 90)
    {
      if (*(_DWORD *)result != -1) {
        return LogPrintF_safe(result, (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]_block_invoke", 0x5Au, (uint64_t)"### Update SSI failed: errorCode=%d", a5, a6, a7, a8, a2);
      }
      result = _LogCategory_Initialize(result, 0x5Au);
      if (result)
      {
        result = *(void *)(*(void *)(v8 + 32) + 32);
        return LogPrintF_safe(result, (uint64_t)"-[CUNANPublisher _updateServiceSpecificInfo]_block_invoke", 0x5Au, (uint64_t)"### Update SSI failed: errorCode=%d", a5, a6, a7, a8, a2);
      }
    }
  }
  return result;
}

- (void)updateLinkStatus:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__CUNANPublisher_updateLinkStatus___block_invoke;
  v4[3] = &unk_1E55BF088;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __35__CUNANPublisher_updateLinkStatus___block_invoke(uint64_t a1)
{
  id v12 = *(id *)(*(void *)(a1 + 32) + 40);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 24) allValues];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 wfaDataSessionServer];

  if (v12) {
    BOOL v9 = v4 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    [v12 updateLinkStatus:*(_DWORD *)(a1 + 40) == 1 forDataSession:v4];
    goto LABEL_9;
  }
  uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 32);
  if (*v10 <= 90)
  {
    if (*v10 != -1)
    {
LABEL_8:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher updateLinkStatus:]_block_invoke", 0x5Au, (uint64_t)"### Update link status without underlying data session", v5, v6, v7, v8, v11);
      goto LABEL_9;
    }
    if (_LogCategory_Initialize((uint64_t)v10, 0x5Au))
    {
      uint64_t v10 = *(int **)(*(void *)(a1 + 32) + 32);
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)sendMessageData:(id)a3 endpoint:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke;
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

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__4947;
  uint64_t v38 = __Block_byref_object_dispose__4948;
  id v39 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_25;
  aBlock[3] = &unk_1E55BED88;
  uint64_t v2 = *(void *)(a1 + 32);
  v33 = &v34;
  aBlock[4] = v2;
  id v32 = *(id *)(a1 + 56);
  uint64_t v3 = (void (**)(void))_Block_copy(aBlock);
  id v9 = *(id *)(*(void *)(a1 + 32) + 40);
  if (!v9)
  {
    uint64_t v23 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960551, (uint64_t)"Publisher not activated", v4, v5, v6, v7, v8, v26);
    id v18 = (void *)v35[5];
    void v35[5] = v23;
    goto LABEL_12;
  }
  id v10 = [*(id *)(a1 + 40) discoveryResult];
  uint64_t v11 = v10;
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
    void v35[5] = v24;

    goto LABEL_11;
  }
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(int **)(v19 + 32);
  if (*v20 <= 30)
  {
    if (*v20 == -1)
    {
      BOOL v21 = _LogCategory_Initialize((uint64_t)v20, 0x1Eu);
      uint64_t v19 = *(void *)(a1 + 32);
      if (!v21) {
        goto LABEL_10;
      }
      uint64_t v20 = *(int **)(v19 + 32);
    }
    LogPrintF((uint64_t)v20, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_2", 0x1Eu, (uint64_t)"SendMessage start: EP %@, Data %.12@", v14, v15, v16, v17, *(void *)(a1 + 40));
    uint64_t v19 = *(void *)(a1 + 32);
  }
LABEL_10:
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_3;
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

uint64_t __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_25(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(*(void *)(*(void *)(result + 48) + 8) + 40);
  if (!v8) {
    return result;
  }
  id v9 = (void *)result;
  id v10 = *(int **)(*(void *)(result + 32) + 32);
  if (*v10 <= 90)
  {
    if (*v10 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v10, 0x5Au)) {
        goto LABEL_7;
      }
      id v10 = *(int **)(v9[4] + 32);
      uint64_t v8 = *(void *)(*(void *)(v9[6] + 8) + 40);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke", 0x5Au, (uint64_t)"### SendMessage failed: %{error}", a5, a6, a7, a8, v8);
  }
LABEL_7:
  uint64_t v11 = *(uint64_t (**)(void))(v9[5] + 16);
  return v11();
}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(NSObject **)(v3 + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4;
  block[3] = &unk_1E55BE4D8;
  uint64_t v9 = a2;
  block[4] = v3;
  id v6 = *(id *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  dispatch_async(v4, block);
}

void __61__CUNANPublisher_sendMessageData_endpoint_completionHandler___block_invoke_4(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[8];
  if (v9)
  {
    uint64_t v10 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], (v9 + 312300), (uint64_t)"SendMessage failed", a4, a5, a6, a7, a8, v18);
    uint64_t v15 = *(int **)(a1[4] + 32);
    id v19 = (id)v10;
    if (*v15 <= 90)
    {
      if (*v15 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v15, 0x5Au)) {
          goto LABEL_9;
        }
        uint64_t v15 = *(int **)(a1[4] + 32);
      }
      LogPrintF((uint64_t)v15, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x5Au, (uint64_t)"### SendMessage failed: EP %@, Data %.12@, %{error}", v11, v12, v13, v14, a1[5]);
    }
LABEL_9:
    (*(void (**)(void))(a1[7] + 16))();

    return;
  }
  uint64_t v16 = *(int **)(a1[4] + 32);
  if (*v16 <= 30)
  {
    if (*v16 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v16, 0x1Eu)) {
        goto LABEL_13;
      }
      uint64_t v16 = *(int **)(a1[4] + 32);
    }
    LogPrintF((uint64_t)v16, (uint64_t)"-[CUNANPublisher sendMessageData:endpoint:completionHandler:]_block_invoke_4", 0x1Eu, (uint64_t)"SendMessage completed: EP %@, Data %.12@", a5, a6, a7, a8, a1[5]);
  }
LABEL_13:
  uint64_t v17 = *(void (**)(void))(a1[7] + 16);
  v17();
}

- (void)reportIssue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __30__CUNANPublisher_reportIssue___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __30__CUNANPublisher_reportIssue___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  if (v2)
  {
    uint64_t v3 = *(void **)(v1 + 24);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __30__CUNANPublisher_reportIssue___block_invoke_2;
    v5[3] = &unk_1E55BE410;
    v5[4] = v2;
    id v6 = *(id *)(a1 + 40);
    id v4 = v2;
    [v3 enumerateKeysAndObjectsUsingBlock:v5];
  }
}

uint64_t __30__CUNANPublisher_reportIssue___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 wfaDataSessionServer];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [*(id *)(a1 + 32) reportIssue:*(void *)(a1 + 40) forDataSession:v4];
    uint64_t v5 = v7;
  }
  return MEMORY[0x1F41817F8](v4, v5);
}

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 24);
  id v4 = *(id *)(v2 + 40);
  uint64_t v5 = [v3 allValues];
  id v6 = [v5 firstObject];
  uint64_t v7 = [v6 wfaDataSessionServer];

  if (v4) {
    BOOL v13 = v7 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  if (v13)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    uint64_t v15 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], 4294960596, (uint64_t)"No underlying data session", v8, v9, v10, v11, v12, v17[0]);
    (*(void (**)(uint64_t, void, void *))(v14 + 16))(v14, 0, v15);
  }
  else
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = (uint64_t)__64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v17[3] = (uint64_t)&unk_1E55BE3E8;
    uint64_t v16 = *(void **)(a1 + 40);
    v17[4] = *(void *)(a1 + 32);
    id v18 = v16;
    [v4 generateStatisticsReportForDataSession:v7 completionHandler:v17];
  }
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E55BE630;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __64__CUNANPublisher_generateStatisticsReportWithCompletionHandler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = a1[4];
  uint64_t v8 = a1[5];
  uint64_t v10 = a1[6];
  if (v10)
  {
    NSErrorF_safe((void *)*MEMORY[0x1E4F28760], (v10 + 312300), (uint64_t)"Generate report failed", a4, v8 + 16, a6, a7, a8, (uint64_t)v13);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, uint64_t, id))(v8 + 16))(v8, v9, v14);
  }
  else
  {
    id v11 = *(void (**)(uint64_t, uint64_t, void))(v8 + 16);
    uint64_t v12 = a1[5];
    v11(v12, v9, 0);
  }
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_wfaPublisher
    && ![(NSMutableDictionary *)self->_sessions count])
  {
    invalidationHandler = (void (**)(void))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2]();
    }
    id dataSessionStartedHandler = self->_dataSessionStartedHandler;
    self->_id dataSessionStartedHandler = 0;

    id dataSessionEndedHandler = self->_dataSessionEndedHandler;
    self->_id dataSessionEndedHandler = 0;

    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v7 = self->_invalidationHandler;
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v15);
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
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
        goto LABEL_6;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
  }
LABEL_6:
  uint64_t v9 = self->_mockID;
  if (v9) {
    CUNANMockRemovePublisher(v9, self);
  }
  [(NSMutableDictionary *)self->_sessions enumerateKeysAndObjectsUsingBlock:&__block_literal_global_4962];
  [(WiFiAwarePublisher *)self->_wfaPublisher stop];
  [(CUNANPublisher *)self _invalidated];
}

uint64_t __29__CUNANPublisher__invalidate__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 invalidate];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUNANPublisher_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CUNANPublisher_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu)) {
        goto LABEL_9;
      }
      ucat = self->_ucat;
    }
    serviceType = self->_serviceType;
    id v7 = CUPrintFlags(self->_trafficFlags, byte_18E4179C3, 1);
    if ([(NSDictionary *)self->_textInfo count]) {
      textInfo = self->_textInfo;
    }
    else {
      textInfo = (NSDictionary *)@"no SSI";
    }
    v95 = NSPrintF((uint64_t)"%##@", v8, v9, v10, v11, v12, v13, v14, (uint64_t)textInfo);
    LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate: serviceType=%@, name='%@', port=%d, trafficFlags=%@, customData=%@, textInfo=%@", v16, v17, v18, v19, (uint64_t)serviceType);
  }
LABEL_9:
  uint64_t v20 = self->_serviceType;
  if ([(NSString *)v20 length])
  {
    uint64_t v27 = self->_mockID;
    if (v27)
    {
      if (!self->_mockEndpoint)
      {
        id v28 = objc_alloc_init(CUNANEndpoint);
        mockEndpoint = self->_mockEndpoint;
        self->_mockEndpoint = v28;

        [(CUNANEndpoint *)self->_mockEndpoint setCustomData:self->_customData];
        id v30 = objc_msgSend([NSString alloc], "initWithFormat:", @"%llu", CUNextID64());
        [(CUNANEndpoint *)self->_mockEndpoint setIdentifier:v30];

        [(CUNANEndpoint *)self->_mockEndpoint setMockPeerEndpointString:self->_mockPeerEndpointString];
        [(CUNANEndpoint *)self->_mockEndpoint setName:self->_name];
        [(CUNANEndpoint *)self->_mockEndpoint setPort:self->_port];
        [(CUNANEndpoint *)self->_mockEndpoint setServiceType:self->_serviceType];
        [(CUNANEndpoint *)self->_mockEndpoint setTextInfo:self->_textInfo];
      }
      uint64_t v31 = v27;
      id v32 = self;
      os_unfair_lock_lock((os_unfair_lock_t)&gCUNANMockLock);
      v33 = [(id)gCUNANMockPublishers objectForKeyedSubscript:v31];
      if (!v33)
      {
        v33 = (void *)[objc_alloc(MEMORY[0x1E4F28D30]) initWithOptions:517 capacity:0];
        uint64_t v34 = (void *)gCUNANMockPublishers;
        if (!gCUNANMockPublishers)
        {
          id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          uint64_t v36 = (void *)gCUNANMockPublishers;
          gCUNANMockPublishers = (uint64_t)v35;

          uint64_t v34 = (void *)gCUNANMockPublishers;
        }
        [v34 setObject:v33 forKeyedSubscript:v31];
      }
      [v33 addObject:v32];
      uint64_t v37 = [(CUNANPublisher *)v32 mockEndpoint];
      if (v37)
      {
        v96 = v4;
        uint64_t v38 = v20;
        id v39 = v27;
        long long v100 = 0u;
        long long v101 = 0u;
        long long v98 = 0u;
        long long v99 = 0u;
        v40 = [(id)gCUNANMockSubscribers objectForKeyedSubscript:v31];
        uint64_t v41 = [v40 countByEnumeratingWithState:&v98 objects:v102 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          uint64_t v43 = *(void *)v99;
          do
          {
            for (uint64_t i = 0; i != v42; ++i)
            {
              if (*(void *)v99 != v43) {
                objc_enumerationMutation(v40);
              }
              [*(id *)(*((void *)&v98 + 1) + 8 * i) reportMockEndpointFound:v37];
            }
            uint64_t v42 = [v40 countByEnumeratingWithState:&v98 objects:v102 count:16];
          }
          while (v42);
        }

        uint64_t v27 = v39;
        uint64_t v20 = v38;
        uint64_t v4 = v96;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)&gCUNANMockLock);

      if (v4) {
        v4[2](v4, 0);
      }
      goto LABEL_76;
    }
    v50 = (void *)[objc_alloc((Class)getWiFiAwarePublishConfigurationClass[0]()) initWithServiceName:v20];
    v51 = v50;
    unsigned int controlFlags = self->_controlFlags;
    if (controlFlags)
    {
      [v50 setAuthenticationType:0];
      unsigned int controlFlags = self->_controlFlags;
    }
    if ((controlFlags & 2) == 0)
    {
LABEL_47:
      id v60 = objc_alloc_init((Class)getWiFiAwarePublishServiceSpecificInfoClass[0]());
      [v60 setInstanceName:self->_name];
      if (self->_customData) {
        objc_msgSend(v60, "setBlob:");
      }
      v61 = self->_textInfo;
      v63 = v61;
      if (!v61)
      {
LABEL_52:

        [v51 setServiceSpecificInfo:v60];
        if (self->_dataPathEnabled)
        {
          unsigned int trafficFlags = self->_trafficFlags;
          if ((trafficFlags & 0x800) != 0) {
            uint64_t v74 = 2;
          }
          else {
            uint64_t v74 = (trafficFlags & 0x23300) != 0;
          }
          v75 = (void *)[objc_alloc((Class)getWiFiAwarePublishDatapathConfigurationClass[0]()) initWithServiceType:v74 securityConfiguration:0];
          v76 = (void *)[objc_alloc((Class)getWiFiAwarePublishDatapathServiceSpecificInfoClass[0]()) initWithProtocolType:0 servicePort:LOWORD(self->_port)];
          [v75 setServiceSpecificInfo:v76];
          [v51 setDatapathConfiguration:v75];
        }
        v77 = (WiFiAwarePublisher *)[objc_alloc((Class)getWiFiAwarePublisherClass[0]()) initWithConfiguration:v51];
        wfaPublisher = self->_wfaPublisher;
        self->_wfaPublisher = v77;

        v85 = self->_wfaPublisher;
        if (v85)
        {
          [(WiFiAwarePublisher *)v85 setDelegate:self];
          v86 = _Block_copy(v4);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = v86;

          [(WiFiAwarePublisher *)self->_wfaPublisher start];
LABEL_75:

          goto LABEL_76;
        }
        v63 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Create WFAPublisher failed", v79, v80, v81, v82, v83, v84, v94);
        v92 = self->_ucat;
        if (v92->var0 > 90) {
          goto LABEL_68;
        }
        if (v92->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v92, 0x5Au))
          {
LABEL_68:
            if (v4) {
              ((void (**)(id, void *))v4)[2](v4, v63);
            }
LABEL_74:

            goto LABEL_75;
          }
          v92 = self->_ucat;
        }
        LogPrintF((uint64_t)v92, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v88, v89, v90, v91, (uint64_t)v63);
        goto LABEL_68;
      }
      id v97 = 0;
      v64 = (void *)CUTXTDataCreateWithDictionary(v61, v62, &v97);
      id v65 = v97;
      v72 = v65;
      if (v64)
      {
        [v60 setTxtRecordData:v64];

        goto LABEL_52;
      }
      if (!v65)
      {
        v72 = NSErrorWithOSStatusF(4294960596, (uint64_t)"Encode TXT failed", v66, v67, v68, v69, v70, v71, v94);
      }
      v93 = self->_ucat;
      if (v93->var0 <= 90)
      {
        if (v93->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v93, 0x5Au)) {
            goto LABEL_71;
          }
          v93 = self->_ucat;
        }
        LogPrintF((uint64_t)v93, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v68, v69, v70, v71, (uint64_t)v72);
      }
LABEL_71:
      if (v4) {
        ((void (**)(id, void *))v4)[2](v4, v72);
      }

      goto LABEL_74;
    }
    v57 = [(objc_class *)getWiFiAwareInternetSharingConfigurationClass_4971() automaticallyRequestInternetFromInitiators];
    if (v57) {
      [v51 setInternetSharingConfiguration:v57];
    }
    v58 = self->_ucat;
    if (v58->var0 <= 30)
    {
      if (v58->var0 != -1)
      {
LABEL_38:
        v59 = "success";
        if (!v57) {
          v59 = "failed";
        }
        LogPrintF((uint64_t)v58, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x1Eu, (uint64_t)"AutomaticInfraRelay: %s", v53, v54, v55, v56, (uint64_t)v59);
        goto LABEL_46;
      }
      if (_LogCategory_Initialize((uint64_t)v58, 0x1Eu))
      {
        v58 = self->_ucat;
        goto LABEL_38;
      }
    }
LABEL_46:

    goto LABEL_47;
  }
  NSErrorWithOSStatusF(4294960591, (uint64_t)"No service type", v21, v22, v23, v24, v25, v26, v94);
  uint64_t v27 = (NSString *)objc_claimAutoreleasedReturnValue();
  v49 = self->_ucat;
  if (v49->var0 <= 90)
  {
    if (v49->var0 != -1)
    {
LABEL_30:
      LogPrintF((uint64_t)v49, (uint64_t)"-[CUNANPublisher _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v45, v46, v47, v48, (uint64_t)v27);
      goto LABEL_42;
    }
    if (_LogCategory_Initialize((uint64_t)v49, 0x5Au))
    {
      v49 = self->_ucat;
      goto LABEL_30;
    }
  }
LABEL_42:
  if (v4) {
    ((void (**)(id, NSString *))v4)[2](v4, v27);
  }
LABEL_76:
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__CUNANPublisher_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __41__CUNANPublisher_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setTextInfo:(id)a3
{
  id v5 = a3;
  textInfo = self->_textInfo;
  id v7 = (NSDictionary *)v5;
  id v8 = textInfo;
  if (v8 == v7)
  {
  }
  else
  {
    uint64_t v9 = v8;
    if ((v7 == 0) != (v8 != 0))
    {
      char v10 = [(NSDictionary *)v7 isEqual:v8];

      if (v10) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    objc_storeStrong((id *)&self->_textInfo, a3);
    if (self->_wfaPublisher)
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__CUNANPublisher_setTextInfo___block_invoke;
      block[3] = &unk_1E55BFC18;
      void block[4] = self;
      dispatch_async(dispatchQueue, block);
    }
  }
LABEL_9:
}

uint64_t __30__CUNANPublisher_setTextInfo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateServiceSpecificInfo];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD078;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (NSString)description
{
  serviceType = self->_serviceType;
  CFMutableStringRef v11 = 0;
  NSAppendPrintF(&v11, (uint64_t)"CUNANPublisher '%@'", v2, v3, v4, v5, v6, v7, (uint64_t)serviceType);
  uint64_t v8 = v11;
  return (NSString *)v8;
}

- (NSArray)dataSessions
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = v2->_sessions;
  uint64_t v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(NSMutableDictionary *)v3 allValues];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  objc_sync_exit(v2);
  return (NSArray *)v5;
}

- (void)dealloc
{
  uint64_t v3 = self->_mockID;
  uint64_t v4 = v3;
  if (v3) {
    CUNANMockRemovePublisher(v3, self);
  }
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }

  v6.receiver = self;
  v6.super_class = (Class)CUNANPublisher;
  [(CUNANPublisher *)&v6 dealloc];
}

- (CUNANPublisher)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUNANPublisher;
  uint64_t v2 = [(CUNANPublisher *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    v2->_dataPathEnabled = 1;
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    v3->_ucat = (LogCategory *)&gLogCategory_CUNANPublisher;
    uint64_t v4 = v3;
  }

  return v3;
}

@end