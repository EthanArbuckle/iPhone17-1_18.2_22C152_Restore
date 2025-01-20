@interface CUNANDataSession
- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddress;
- (BOOL)_dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5 error:(id *)a6;
- (CUNANDataSession)init;
- (CUNANEndpoint)peerEndpoint;
- (NSString)description;
- (NSString)identifier;
- (NSString)label;
- (NSString)peerAddressString;
- (NSString)peerEndpointString;
- (OS_dispatch_queue)dispatchQueue;
- (WiFiAwareDataSession)wfaDataSessionClient;
- (WiFiAwarePublisher)publisher;
- (WiFiAwarePublisherDataSessionHandle)wfaDataSessionServer;
- (id)descriptionWithLevel:(int)a3;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)terminationHandler;
- (unsigned)controlFlags;
- (unsigned)localInterfaceIndex;
- (unsigned)trafficFlags;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)_invalidated;
- (void)_terminateServerDataSession;
- (void)activateWithCompletion:(id)a3;
- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5;
- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4;
- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4;
- (void)dataSessionRequestStarted:(id)a3;
- (void)dealloc;
- (void)generateStatisticsReportWithCompletionHandler:(id)a3;
- (void)invalidate;
- (void)reportIssue:(id)a3;
- (void)setControlFlags:(unsigned int)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setLocalInterfaceIndex:(unsigned int)a3;
- (void)setPeerAddress:(id *)a3;
- (void)setPeerEndpoint:(id)a3;
- (void)setPublisher:(id)a3;
- (void)setTerminationHandler:(id)a3;
- (void)setTrafficFlags:(unsigned int)a3;
- (void)setWfaDataSessionServer:(id)a3;
- (void)updateLinkStatus:(int)a3;
@end

@implementation CUNANDataSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wfaDataSessionServer, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_wfaDataSessionClient, 0);
  objc_storeStrong(&self->_terminationHandler, 0);
  objc_storeStrong((id *)&self->_peerEndpoint, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_activateCompletion, 0);
}

- (void)setWfaDataSessionServer:(id)a3
{
}

- (WiFiAwarePublisherDataSessionHandle)wfaDataSessionServer
{
  return self->_wfaDataSessionServer;
}

- (void)setPublisher:(id)a3
{
}

- (WiFiAwarePublisher)publisher
{
  return self->_publisher;
}

- (WiFiAwareDataSession)wfaDataSessionClient
{
  return self->_wfaDataSessionClient;
}

- (void)setTrafficFlags:(unsigned int)a3
{
  self->_trafficFlags = a3;
}

- (unsigned)trafficFlags
{
  return self->_trafficFlags;
}

- (void)setTerminationHandler:(id)a3
{
}

- (id)terminationHandler
{
  return self->_terminationHandler;
}

- (CUNANEndpoint)peerEndpoint
{
  return self->_peerEndpoint;
}

- (void)setPeerAddress:(id *)a3
{
  sockaddr var0 = a3->var0;
  *(in6_addr *)((char *)&self->_peerAddress.v6.sin6_addr + 4) = *(in6_addr *)((char *)&a3->var2.sin6_addr + 4);
  self->_peerAddress.sa = var0;
}

- ($9D4F243E34B80324A1B90A38B57CFE16)peerAddress
{
  retstr->sockaddr var0 = *(sockaddr *)((char *)&self[4].var2.sin6_addr + 8);
  *(in6_addr *)((char *)&retstr->var2.sin6_addr + 4) = (in6_addr)self[5].var0;
  return self;
}

- (void)setLocalInterfaceIndex:(unsigned int)a3
{
  self->_localInterfaceIndex = a3;
}

- (unsigned)localInterfaceIndex
{
  return self->_localInterfaceIndex;
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

- (NSString)label
{
  return self->_label;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
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

- (void)dataSession:(id)a3 terminatedWithReason:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __53__CUNANDataSession_dataSession_terminatedWithReason___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104)) {
    return;
  }
  uint64_t v3 = (*(_DWORD *)(a1 + 40) + 312370);
  v4 = *(int **)(v1 + 24);
  if (*v4 <= 30)
  {
    if (*v4 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(*(void *)(v1 + 24), 0x1Eu);
      uint64_t v1 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      v4 = *(int **)(v1 + 24);
    }
    v5 = [*(id *)(v1 + 88) identifier];
    LogPrintF((uint64_t)v4, (uint64_t)"-[CUNANDataSession dataSession:terminatedWithReason:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession terminated: %@, %#m\n", v6, v7, v8, v9, (uint64_t)v5);

    uint64_t v1 = *(void *)(a1 + 32);
  }
LABEL_7:
  v31 = (void (**)(id, void *))_Block_copy(*(const void **)(v1 + 96));
  if (v31)
  {
    v17 = NSErrorWithOSStatusF(v3, (uint64_t)"DataSession terminated", v11, v12, v13, v14, v15, v16, v30);
    v31[2](v31, v17);
  }
  v18 = (void (**)(void *, void *))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 8));
  uint64_t v19 = *(void *)(a1 + 32);
  v20 = *(void **)(v19 + 8);
  *(void *)(v19 + 8) = 0;

  if (v18)
  {
    v27 = NSErrorWithOSStatusF(v3, (uint64_t)"DataSession terminated", v21, v22, v23, v24, v25, v26, v30);
    v18[2](v18, v27);
  }
  uint64_t v28 = *(void *)(a1 + 32);
  v29 = *(void **)(v28 + 104);
  *(void *)(v28 + 104) = 0;

  [*(id *)(a1 + 32) _invalidated];
}

- (BOOL)_dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = [a4 ipv6LinkLocalAddress];
  uint64_t v13 = [v12 length];
  if (v13 == 16)
  {
    *(void *)&self->_peerAddress.v6.sin6_addr.__u6_addr16[1] = 0;
    *(void *)&self->_peerAddress.v4.sin_port = 0;
    HIWORD(self->_peerAddress.v6.sin6_scope_id) = 0;
    *(void *)((char *)&self->_peerAddress.v6.sin6_addr.__u6_addr32[2] + 2) = 0;
    *(_WORD *)&self->_peerAddress.sa.sa_len = 7708;
    self->_peerAddress.v6.sin6_addr = *(in6_addr *)[v12 bytes];
    self->_peerAddress.v6.sin6_scope_id = [v10 localInterfaceIndex];
    self->_peerAddress.v4.sin_port = __rev16([v11 servicePort]);
    self->_localInterfaceIndex = [v10 localInterfaceIndex];
  }
  else if (a6)
  {
    uint64_t v14 = [v12 length];
    NSErrorWithOSStatusF(4294960553, (uint64_t)"Bad IPv6 length (%d bytes)", v15, v16, v17, v18, v19, v20, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v13 == 16;
}

- (void)dataSession:(id)a3 confirmedForPeerDataAddress:(id)a4 serviceSpecificInfo:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke;
  v15[3] = &unk_1E55BEEC8;
  v15[4] = self;
  id v16 = v9;
  id v17 = v10;
  id v18 = v8;
  id v12 = v8;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(dispatchQueue, v15);
}

void __80__CUNANDataSession_dataSession_confirmedForPeerDataAddress_serviceSpecificInfo___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 104)) {
    return;
  }
  uint64_t v3 = *(int **)(v2 + 24);
  if (*v3 <= 30)
  {
    if (*v3 == -1)
    {
      BOOL v9 = _LogCategory_Initialize(*(void *)(v2 + 24), 0x1Eu);
      uint64_t v2 = *(void *)(a1 + 32);
      if (!v9) {
        goto LABEL_6;
      }
      uint64_t v3 = *(int **)(v2 + 24);
    }
    v4 = [*(id *)(v2 + 88) identifier];
    [*(id *)(a1 + 48) servicePort];
    [*(id *)(a1 + 56) localInterfaceIndex];
    LogPrintF_safe((uint64_t)v3, (uint64_t)"-[CUNANDataSession dataSession:confirmedForPeerDataAddress:serviceSpecificInfo:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession confirmed: id=%@, mac=%@, port=%d, ifindex=%u", v5, v6, v7, v8, (uint64_t)v4);

    uint64_t v2 = *(void *)(a1 + 32);
  }
LABEL_6:
  uint64_t v11 = *(void *)(a1 + 48);
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v12 = *(void *)(a1 + 40);
  id v17 = 0;
  [(id)v2 _dataSession:v10 confirmedForPeerDataAddress:v12 serviceSpecificInfo:v11 error:&v17];
  id v13 = v17;
  id v14 = (void (**)(void *, id))_Block_copy(*(const void **)(*(void *)(a1 + 32) + 8));
  uint64_t v15 = *(void *)(a1 + 32);
  id v16 = *(void **)(v15 + 8);
  *(void *)(v15 + 8) = 0;

  if (v14) {
    v14[2](v14, v13);
  }
}

- (void)dataSession:(id)a3 failedToStartWithError:(int64_t)a4
{
  dispatchQueue = self->_dispatchQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke;
  v5[3] = &unk_1E55BE748;
  v5[4] = self;
  v5[5] = a4;
  dispatch_async(dispatchQueue, v5);
}

void __55__CUNANDataSession_dataSession_failedToStartWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(void *)(v1 + 104)) {
    return;
  }
  uint64_t v3 = (*(_DWORD *)(a1 + 40) + 312300);
  v4 = *(int **)(v1 + 24);
  if (*v4 <= 90)
  {
    if (*v4 == -1)
    {
      BOOL v10 = _LogCategory_Initialize(*(void *)(v1 + 24), 0x5Au);
      uint64_t v1 = *(void *)(a1 + 32);
      if (!v10) {
        goto LABEL_7;
      }
      v4 = *(int **)(v1 + 24);
    }
    uint64_t v5 = [*(id *)(v1 + 88) identifier];
    LogPrintF((uint64_t)v4, (uint64_t)"-[CUNANDataSession dataSession:failedToStartWithError:]_block_invoke", 0x5Au, (uint64_t)"### WFA DataSession start failed: %@, %#m\n", v6, v7, v8, v9, (uint64_t)v5);

    uint64_t v1 = *(void *)(a1 + 32);
  }
LABEL_7:
  uint64_t v21 = (void (**)(id, void *))_Block_copy(*(const void **)(v1 + 8));
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void **)(v11 + 8);
  *(void *)(v11 + 8) = 0;

  if (v21)
  {
    uint64_t v19 = NSErrorWithOSStatusF(v3, (uint64_t)"DataSession start failed", v13, v14, v15, v16, v17, v18, v20);
    v21[2](v21, v19);
  }
}

- (void)dataSessionRequestStarted:(id)a3
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__CUNANDataSession_dataSessionRequestStarted___block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __46__CUNANDataSession_dataSessionRequestStarted___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 104))
  {
    uint64_t v2 = *(int **)(v1 + 24);
    if (*v2 <= 30)
    {
      if (*v2 == -1)
      {
        if (!_LogCategory_Initialize(*(void *)(v1 + 24), 0x1Eu)) {
          return;
        }
        uint64_t v1 = *(void *)(a1 + 32);
        uint64_t v2 = *(int **)(v1 + 24);
      }
      id v8 = [*(id *)(v1 + 88) identifier];
      LogPrintF((uint64_t)v2, (uint64_t)"-[CUNANDataSession dataSessionRequestStarted:]_block_invoke", 0x1Eu, (uint64_t)"WFA DataSession request started: %@\n", v3, v4, v5, v6, (uint64_t)v8);
    }
  }
}

- (void)_terminateServerDataSession
{
  uint64_t v7 = self->_wfaDataSessionServer;
  if (v7)
  {
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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _terminateServerDataSession]", 0x1Eu, (uint64_t)"WFA DataSession terminate start\n", v3, v4, v5, v6, v10);
    }
LABEL_6:
    publisher = self->_publisher;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__CUNANDataSession__terminateServerDataSession__block_invoke;
    v11[3] = &unk_1E55BE438;
    v11[4] = self;
    [(WiFiAwarePublisher *)publisher terminateDataSession:v7 completionHandler:v11];
  }
}

void __47__CUNANDataSession__terminateServerDataSession__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(NSObject **)(v2 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__CUNANDataSession__terminateServerDataSession__block_invoke_2;
  v4[3] = &unk_1E55BE748;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

void __47__CUNANDataSession__terminateServerDataSession__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  if (!*(void *)(v8 + 120)) {
    return;
  }
  uint64_t v10 = *(int **)(v8 + 24);
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v11) {
        goto LABEL_7;
      }
      uint64_t v10 = *(int **)(v8 + 24);
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUNANDataSession _terminateServerDataSession]_block_invoke_2", 0x1Eu, (uint64_t)"WFA DataSession terminate completed: %#m\n", a5, a6, a7, a8, *(void *)(a1 + 40));
    uint64_t v8 = *(void *)(a1 + 32);
  }
LABEL_7:
  uint64_t v24 = (void (**)(id, void *))_Block_copy(*(const void **)(v8 + 8));
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v13 = *(void **)(v12 + 8);
  *(void *)(v12 + 8) = 0;

  if (v24)
  {
    uint64_t v20 = NSErrorWithOSStatusF(*(unsigned int *)(a1 + 40), (uint64_t)"DataSession terminate failed", v14, v15, v16, v17, v18, v19, v23);
    v24[2](v24, v20);
  }
  uint64_t v21 = *(void *)(a1 + 32);
  uint64_t v22 = *(void **)(v21 + 120);
  *(void *)(v21 + 120) = 0;

  [*(id *)(a1 + 32) _invalidated];
}

- (void)updateLinkStatus:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__CUNANDataSession_updateLinkStatus___block_invoke;
  v4[3] = &unk_1E55BF088;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __37__CUNANDataSession_updateLinkStatus___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  if (v2)
  {
    id v11 = v2;
    [v2 updateLinkStatus:*(_DWORD *)(a1 + 40) == 1];
    goto LABEL_12;
  }
  id v11 = *(id *)(*(void *)(a1 + 32) + 112);
  id v7 = *(id *)(*(void *)(a1 + 32) + 120);
  if (v11) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24);
    if (*v9 <= 90)
    {
      if (*v9 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au)) {
          goto LABEL_11;
        }
        uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24);
      }
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUNANDataSession updateLinkStatus:]_block_invoke", 0x5Au, (uint64_t)"### Update link status without underlying data session", v3, v4, v5, v6, v10);
    }
  }
  else
  {
    [v11 updateLinkStatus:*(_DWORD *)(a1 + 40) == 1 forDataSession:v7];
  }
LABEL_11:

LABEL_12:
}

- (void)reportIssue:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CUNANDataSession_reportIssue___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __32__CUNANDataSession_reportIssue___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  if (v2)
  {
    id v11 = v2;
    [v2 reportIssue:*(void *)(a1 + 40)];
    goto LABEL_12;
  }
  id v11 = *(id *)(*(void *)(a1 + 32) + 112);
  id v7 = *(id *)(*(void *)(a1 + 32) + 120);
  if (v11) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8)
  {
    uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24);
    if (*v9 <= 90)
    {
      if (*v9 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v9, 0x5Au)) {
          goto LABEL_11;
        }
        uint64_t v9 = *(int **)(*(void *)(a1 + 32) + 24);
      }
      LogPrintF((uint64_t)v9, (uint64_t)"-[CUNANDataSession reportIssue:]_block_invoke", 0x5Au, (uint64_t)"### Report issue without underlying data session", v3, v4, v5, v6, v10);
    }
  }
  else
  {
    [v11 reportIssue:*(void *)(a1 + 40) forDataSession:v7];
  }
LABEL_11:

LABEL_12:
}

- (void)generateStatisticsReportWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 104);
  if (v2)
  {
    uint64_t v3 = v2;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2;
    v21[3] = &unk_1E55BE3E8;
    id v4 = *(void **)(a1 + 40);
    v21[4] = *(void *)(a1 + 32);
    id v22 = v4;
    [v3 generateStatisticsReportWithCompletionHandler:v21];
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v3 = *(void **)(v5 + 112);
    id v6 = *(void **)(v5 + 120);
    if (v3) {
      BOOL v7 = v6 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = (void *)*MEMORY[0x1E4F28760];
      id v10 = v6;
      id v11 = v3;
      uint64_t v17 = NSErrorF_safe(v9, 4294960596, (uint64_t)"No underlying data session", v12, v13, v14, v15, v16, v19[0]);
      (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v17);
    }
    else
    {
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = (uint64_t)__66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4;
      v19[3] = (uint64_t)&unk_1E55BE3E8;
      v19[4] = v5;
      id v20 = *(id *)(a1 + 40);
      id v18 = v6;
      [v3 generateStatisticsReportForDataSession:v18 completionHandler:v19];
    }
  }
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3;
  block[3] = &unk_1E55BE630;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E55BE630;
  id v7 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v7;
  uint64_t v12 = a2;
  id v8 = v5;
  dispatch_async(v6, block);
}

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_5(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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

void __66__CUNANDataSession_generateStatisticsReportWithCompletionHandler___block_invoke_3(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
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
  if (!self->_invalidateDone && !self->_wfaDataSessionClient && !self->_wfaDataSessionServer)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler) {
      invalidationHandler[2](invalidationHandler, a2);
    }
    id interruptionHandler = self->_interruptionHandler;
    self->_id interruptionHandler = 0;

    id v5 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    id terminationHandler = self->_terminationHandler;
    self->_id terminationHandler = 0;

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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v7, v8, v9, v10, v13);
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v8);
  }
LABEL_6:
  [(WiFiAwareDataSession *)self->_wfaDataSessionClient stop];
  [(CUNANDataSession *)self _terminateServerDataSession];
  [(CUNANDataSession *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUNANDataSession_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  void block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUNANDataSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_activateWithCompletion:(id)a3
{
  aBlock = (void (**)(void))a3;
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      peerEndpoint = self->_peerEndpoint;
      id v6 = CUPrintFlags(self->_controlFlags, byte_18E4176E4, 1);
      v50 = CUPrintFlags(self->_trafficFlags, byte_18E4179C3, 1);
      LogPrintF_safe((uint64_t)ucat, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x1Eu, (uint64_t)"Activate: endpoint=%@, controlFlags=%@, trafficFlags=%@", v7, v8, v9, v10, (uint64_t)peerEndpoint);

      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)self->_ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  id v11 = [(CUNANEndpoint *)self->_peerEndpoint mockPeerEndpointString];
  uint64_t v12 = v11;
  if (!v11)
  {
    uint64_t v26 = [(CUNANEndpoint *)self->_peerEndpoint discoveryResult];
    if (v26)
    {
      unsigned int trafficFlags = self->_trafficFlags;
      if ((trafficFlags & 0x800) != 0) {
        uint64_t v28 = 2;
      }
      else {
        uint64_t v28 = (trafficFlags & 0x23300) != 0;
      }
      v29 = (WiFiAwareDataSession *)[objc_alloc((Class)getWiFiAwareDataSessionClass[0]()) initWithDiscoveryResult:v26 serviceType:v28 serviceSpecificInfo:0];
      wfaDataSessionClient = self->_wfaDataSessionClient;
      self->_wfaDataSessionClient = v29;

      v31 = self->_wfaDataSessionClient;
      if (v31)
      {
        [(WiFiAwareDataSession *)v31 setDelegate:self];
        if ((self->_controlFlags & 2) == 0)
        {
LABEL_34:
          v47 = _Block_copy(aBlock);
          id activateCompletion = self->_activateCompletion;
          self->_id activateCompletion = v47;

          [(WiFiAwareDataSession *)self->_wfaDataSessionClient start];
LABEL_35:

          goto LABEL_36;
        }
        v36 = [(Class)getWiFiAwareInternetSharingConfigurationClass[0]() automaticallyProvideInternetToResponders];
        if (v36) {
          [(WiFiAwareDataSession *)self->_wfaDataSessionClient setInternetSharingConfiguration:v36];
        }
        v37 = self->_ucat;
        if (v37->var0 <= 30)
        {
          if (v37->var0 != -1)
          {
LABEL_19:
            v38 = "success";
            if (!v36) {
              v38 = "failed";
            }
            LogPrintF((uint64_t)v37, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x1Eu, (uint64_t)"AutomaticInfraRelay: %s", v32, v33, v34, v35, (uint64_t)v38);
            goto LABEL_33;
          }
          if (_LogCategory_Initialize((uint64_t)v37, 0x1Eu))
          {
            v37 = self->_ucat;
            goto LABEL_19;
          }
        }
LABEL_33:

        goto LABEL_34;
      }
      v39 = "Create WFA DataSession failed";
      uint64_t v40 = 4294960596;
    }
    else
    {
      v39 = "No discovery result";
      uint64_t v40 = 4294960591;
    }
    v45 = NSErrorWithOSStatusF(v40, (uint64_t)v39, v20, v21, v22, v23, v24, v25, v49);
    v46 = self->_ucat;
    if (v46->var0 <= 90)
    {
      if (v46->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v46, 0x5Au)) {
          goto LABEL_29;
        }
        v46 = self->_ucat;
      }
      LogPrintF((uint64_t)v46, (uint64_t)"-[CUNANDataSession _activateWithCompletion:]", 0x5Au, (uint64_t)"### Activate failed: %{error}\n", v41, v42, v43, v44, (uint64_t)v45);
    }
LABEL_29:
    if (aBlock) {
      aBlock[2]();
    }

    goto LABEL_35;
  }
  uint64_t v13 = StringToSockAddr((unsigned __int8 *)[v11 UTF8String], (uint64_t)&self->_peerAddress, 0x1CuLL, 0);
  if (aBlock)
  {
    if (v13)
    {
      uint64_t v19 = NSErrorF_safe((void *)*MEMORY[0x1E4F28760], v13, (uint64_t)"Bad mock peer endpoint string", v14, v15, v16, v17, v18, v49);
      ((void (*)(void (**)(void), void *))aBlock[2])(aBlock, v19);
    }
    else
    {
      aBlock[2]();
    }
  }
LABEL_36:
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__CUNANDataSession_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E55BF148;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __43__CUNANDataSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CCFA8;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (void)setPeerEndpoint:(id)a3
{
  objc_storeStrong((id *)&self->_peerEndpoint, a3);
  id v7 = a3;
  id v5 = [v7 identifier];
  identifier = self->_identifier;
  self->_identifier = v5;
}

- (NSString)peerEndpointString
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 0, v4);
  uint64_t v2 = [NSString stringWithUTF8String:v4];
  return (NSString *)v2;
}

- (NSString)peerAddressString
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4[0] = 0;
  SockAddrToString((uint64_t)&self->_peerAddress, 1, v4);
  uint64_t v2 = [NSString stringWithUTF8String:v4];
  return (NSString *)v2;
}

- (id)descriptionWithLevel:(int)a3
{
  CFMutableStringRef v24 = 0;
  NSAppendPrintF(&v24, (uint64_t)"CUNANDataSession %@", *(uint64_t *)&a3, v3, v4, v5, v6, v7, (uint64_t)self->_identifier);
  uint64_t v10 = v24;
  uint64_t v17 = v10;
  if (self->_peerAddress.sa.sa_family)
  {
    CFMutableStringRef v23 = v10;
    NSAppendPrintF(&v23, (uint64_t)", IP %##a", v11, v12, v13, v14, v15, v16, (uint64_t)&self->_peerAddress);
    uint64_t v18 = v23;

    uint64_t v17 = v18;
  }
  if (a3 <= 20)
  {
    CFMutableStringRef v22 = v17;
    NSAppendPrintF(&v22, (uint64_t)"\n", v11, v12, v13, v14, v15, v16, v21);
    uint64_t v19 = v22;

    uint64_t v17 = v19;
  }
  return v17;
}

- (NSString)description
{
  return (NSString *)[(CUNANDataSession *)self descriptionWithLevel:50];
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUNANDataSession;
  [(CUNANDataSession *)&v4 dealloc];
}

- (CUNANDataSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)CUNANDataSession;
  uint64_t v2 = [(CUNANDataSession *)&v5 init];
  if (v2)
  {
    if (CUMainQueue_sOnce != -1) {
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_18);
    }
    objc_storeStrong((id *)&v2->_dispatchQueue, (id)CUMainQueue_sQueue);
    v2->_ucat = (LogCategory *)&gLogCategory_CUNANDataSession;
    uint64_t v3 = v2;
  }

  return v2;
}

@end