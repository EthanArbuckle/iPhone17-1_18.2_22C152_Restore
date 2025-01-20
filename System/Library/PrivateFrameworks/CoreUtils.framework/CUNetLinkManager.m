@interface CUNetLinkManager
- (CUNetLinkManager)init;
- (NSString)label;
- (OS_dispatch_queue)dispatchQueue;
- (id)description;
- (id)descriptionWithLevel:(int)a3;
- (id)invalidationHandler;
- (void)_invalidate;
- (void)_invalidated;
- (void)_monitorEnsureStarted;
- (void)_monitorEnsureStopped;
- (void)_monitorReadPacket:(int)a3;
- (void)_monitorSendPacketToEndpoint:(id)a3;
- (void)_monitorSetupSocket:(int)a3;
- (void)_update;
- (void)_updateARP;
- (void)_updateEndpoint:(id)a3 state:(int)a4;
- (void)_updateEndpoints;
- (void)_updateNDP;
- (void)activate;
- (void)addEndpoint:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeEndpoint:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation CUNetLinkManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_probeSourceV6, 0);
  objc_storeStrong((id *)&self->_probeSourceV4, 0);
  objc_storeStrong((id *)&self->_pollTimer, 0);
  objc_storeStrong((id *)&self->_endpoints, 0);
}

- (NSString)label
{
  return self->_label;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)_monitorSendPacketToEndpoint:(id)a3
{
  v4 = (char *)a3;
  int v5 = *((_DWORD *)v4 + 17) + 1;
  *((_DWORD *)v4 + 17) = v5;
  int v18 = v5;
  v6 = (const sockaddr *)(v4 + 8);
  int v7 = v4[9];
  if (v7 == 30) {
    int v8 = 28;
  }
  else {
    int v8 = 0;
  }
  BOOL v9 = v7 == 2;
  uint64_t v10 = 48;
  if (v9)
  {
    uint64_t v10 = 32;
    socklen_t v11 = 16;
  }
  else
  {
    socklen_t v11 = v8;
  }
  if (sendto(*(_DWORD *)((char *)&self->super.isa + v10), &v18, 4uLL, 0, v6, v11) == 4 || *__error() && !*__error())
  {
    ++self->_txCount;
    ucat = self->_ucat;
    if (ucat->var0 <= 9)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 9u)) {
          goto LABEL_19;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]", 9u, (uint64_t)"Probe sent: %##a, S# %u, T# %u, E# %u\n", v12, v13, v14, v15, (uint64_t)v6);
    }
  }
  else
  {
    ++self->_txErrors;
    v17 = self->_ucat;
    if (v17->var0 <= 20)
    {
      if (v17->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v17, 0x14u)) {
          goto LABEL_19;
        }
        v17 = self->_ucat;
      }
      LogPrintF((uint64_t)v17, (uint64_t)"-[CUNetLinkManager _monitorSendPacketToEndpoint:]", 0x14u, (uint64_t)"### Probe send failed: %##a, S# %u, T# %u, E# %u, %#m\n", v12, v13, v14, v15, (uint64_t)v6);
    }
  }
LABEL_19:
}

- (void)_monitorReadPacket:(int)a3
{
  int v13 = 0;
  ssize_t v12 = 0;
  memset(v10, 0, sizeof(v10));
  int v11 = 0;
  if (!SocketRecvFrom(a3, (uint64_t)&v13, 4, &v12, v10, 0x1Cu, 0, 0, 0, 0))
  {
    ++self->_rxCount;
    ucat = self->_ucat;
    if (ucat->var0 > 9) {
      return;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 9u)) {
        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]", 9u, (uint64_t)"Probe recv: %##a, %zu bytes, R# %u, S# %u\n", v4, v5, v6, v7, (uint64_t)v10);
    return;
  }
  int v8 = self->_ucat;
  if (v8->var0 <= 90)
  {
    if (v8->var0 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)v8, (uint64_t)"-[CUNetLinkManager _monitorReadPacket:]", 0x5Au, (uint64_t)"### Probe recv failed: R# %u, %#m\n", v4, v5, v6, v7, self->_rxCount);
      return;
    }
    if (_LogCategory_Initialize((uint64_t)v8, 0x5Au))
    {
      int v8 = self->_ucat;
      goto LABEL_4;
    }
  }
}

- (void)_monitorSetupSocket:(int)a3
{
  uint64_t v7 = *(void *)&a3;
  memset(v68, 0, 28);
  if (a3 == 2)
  {
    BOOL v9 = "IPv4";
    uint64_t v10 = 40;
    uint64_t v11 = 32;
  }
  else
  {
    if (a3 != 30)
    {
      ucat = self->_ucat;
      if (ucat->var0 > 90) {
        return;
      }
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
          return;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket bad family: %d\n", v3, v4, v5, v6, v7);
      return;
    }
    BOOL v9 = "IPv6";
    uint64_t v10 = 56;
    uint64_t v11 = 48;
  }
  ssize_t v12 = self->_ucat;
  if (v12->var0 <= 30)
  {
    if (v12->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v12, 0x1Eu)) {
        goto LABEL_12;
      }
      ssize_t v12 = self->_ucat;
    }
    LogPrintF((uint64_t)v12, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x1Eu, (uint64_t)"Monitor setup socket %s\n", v3, v4, v5, v6, (uint64_t)v9);
  }
LABEL_12:
  int v14 = socket(v7, 2, 17);
  if (v14 < 0 && (!*__error() || *__error()))
  {
    v24 = self->_ucat;
    if (v24->var0 > 90) {
      return;
    }
    if (v24->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v24, 0x5Au)) {
        return;
      }
      v24 = self->_ucat;
    }
    LogPrintF((uint64_t)v24, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket create failed (%s): %#m\n", v15, v16, v17, v18, (uint64_t)v9);
    return;
  }
  if (SocketSetNonBlocking(v14, 1))
  {
    v23 = self->_ucat;
    if (v23->var0 <= 90)
    {
      if (v23->var0 != -1)
      {
LABEL_18:
        LogPrintF((uint64_t)v23, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket NonBlock failed (%s): %#m\n", v19, v20, v21, v22, (uint64_t)v9);
        goto LABEL_23;
      }
      if (_LogCategory_Initialize((uint64_t)v23, 0x5Au))
      {
        v23 = self->_ucat;
        goto LABEL_18;
      }
    }
  }
LABEL_23:
  int v67 = 1;
  if (setsockopt(v14, 0xFFFF, 4130, &v67, 4u) && (!*__error() || *__error()))
  {
    v29 = self->_ucat;
    if (v29->var0 <= 90)
    {
      if (v29->var0 != -1)
      {
LABEL_28:
        LogPrintF((uint64_t)v29, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_NOSIGPIPE failed (%s): %#m\n", v25, v26, v27, v28, (uint64_t)v9);
        goto LABEL_30;
      }
      if (_LogCategory_Initialize((uint64_t)v29, 0x5Au))
      {
        v29 = self->_ucat;
        goto LABEL_28;
      }
    }
  }
LABEL_30:
  int v66 = 1;
  if (setsockopt(v14, 0xFFFF, 0x10000, &v66, 4u) && (!*__error() || *__error()))
  {
    v34 = self->_ucat;
    if (v34->var0 <= 90)
    {
      if (v34->var0 != -1)
      {
LABEL_35:
        LogPrintF((uint64_t)v34, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_NOWAKEFROMSLEEP failed (%s): %#m\n", v30, v31, v32, v33, (uint64_t)v9);
        goto LABEL_37;
      }
      if (_LogCategory_Initialize((uint64_t)v34, 0x5Au))
      {
        v34 = self->_ucat;
        goto LABEL_35;
      }
    }
  }
LABEL_37:
  int v65 = 1;
  if (setsockopt(v14, 0xFFFF, 512, &v65, 4u) && (!*__error() || *__error()))
  {
    v39 = self->_ucat;
    if (v39->var0 <= 90)
    {
      if (v39->var0 != -1)
      {
LABEL_44:
        LogPrintF((uint64_t)v39, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket SO_REUSEPORT failed (%s): %#m\n", v35, v36, v37, v38, (uint64_t)v9);
        goto LABEL_46;
      }
      if (_LogCategory_Initialize((uint64_t)v39, 0x5Au))
      {
        v39 = self->_ucat;
        goto LABEL_44;
      }
    }
  }
LABEL_46:
  if (v7 == 2)
  {
    *(void *)&v68[0].sa_len = 2316173840;
    *(void *)&v68[0].sa_data[6] = 0;
    int v40 = v14;
    socklen_t v41 = 16;
    goto LABEL_62;
  }
  if (v7 != 30) {
    goto LABEL_71;
  }
  int v64 = 1;
  if (setsockopt(v14, 41, 27, &v64, 4u) && (!*__error() || *__error()))
  {
    v46 = self->_ucat;
    if (v46->var0 <= 90)
    {
      if (v46->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v46, 0x5Au)) {
          goto LABEL_61;
        }
        v46 = self->_ucat;
      }
      LogPrintF((uint64_t)v46, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket IPV6_V6ONLY failed (%s): %#m\n", v42, v43, v44, v45, (uint64_t)v9);
    }
  }
LABEL_61:
  *(_OWORD *)&v68[0].sa_data[10] = 0uLL;
  *(void *)&v68[0].sa_data[2] = 0;
  *(_DWORD *)&v68[0].sa_len = -1978786276;
  *(sockaddr *)&v68[0].sa_data[6] = *(sockaddr *)MEMORY[0x1E4F148B8];
  int v40 = v14;
  socklen_t v41 = 28;
LABEL_62:
  if (bind(v40, v68, v41) && (!*__error() || *__error()))
  {
    v51 = self->_ucat;
    if (v51->var0 <= 90)
    {
      if (v51->var0 != -1)
      {
LABEL_69:
        LogPrintF((uint64_t)v51, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket bind failed (%s): %#m\n", v47, v48, v49, v50, (uint64_t)v9);
        goto LABEL_71;
      }
      if (_LogCategory_Initialize((uint64_t)v51, 0x5Au))
      {
        v51 = self->_ucat;
        goto LABEL_69;
      }
    }
  }
LABEL_71:
  v52 = dispatch_source_create(MEMORY[0x1E4F14478], v14, 0, (dispatch_queue_t)self->_dispatchQueue);
  if (v52)
  {
    v57 = v52;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __40__CUNetLinkManager__monitorSetupSocket___block_invoke;
    handler[3] = &unk_1E55BF088;
    handler[4] = self;
    int v63 = v14;
    dispatch_source_set_event_handler(v52, handler);
    v61[0] = MEMORY[0x1E4F143A8];
    v61[1] = 3221225472;
    v61[2] = __40__CUNetLinkManager__monitorSetupSocket___block_invoke_2;
    v61[3] = &unk_1E55BEDB0;
    v61[5] = (char *)self + v11;
    v61[6] = (char *)self + v10;
    v61[4] = self;
    dispatch_source_set_cancel_handler(v57, v61);
    dispatch_activate(v57);
    *(_DWORD *)((char *)&self->super.isa + v11) = v14;
    v58 = *(Class *)((char *)&self->super.isa + v10);
    *(Class *)((char *)&self->super.isa + v10) = (Class)v57;
    v59 = v57;

    return;
  }
  v60 = self->_ucat;
  if (v60->var0 <= 90)
  {
    if (v60->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)v60, 0x5Au)) {
        goto LABEL_79;
      }
      v60 = self->_ucat;
    }
    LogPrintF((uint64_t)v60, (uint64_t)"-[CUNetLinkManager _monitorSetupSocket:]", 0x5Au, (uint64_t)"### Probe socket create read source failed (%s): %#m\n", v53, v54, v55, v56, (uint64_t)v9);
  }
LABEL_79:
  if ((v14 & 0x80000000) == 0 && close(v14))
  {
    if (*__error()) {
      __error();
    }
  }
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _monitorReadPacket:*(unsigned int *)(a1 + 40)];
}

uint64_t __40__CUNetLinkManager__monitorSetupSocket___block_invoke_2(uint64_t a1)
{
  int v2 = **(_DWORD **)(a1 + 40);
  if ((v2 & 0x80000000) == 0)
  {
    if (close(v2) && *__error()) {
      __error();
    }
    **(_DWORD **)(a1 + 40) = -1;
  }
  uint64_t v3 = *(void ***)(a1 + 48);
  uint64_t v4 = *v3;
  *uint64_t v3 = 0;

  uint64_t v5 = *(void **)(a1 + 32);
  return [v5 _invalidated];
}

- (void)_monitorEnsureStopped
{
  if (!self->_pollTimer) {
    goto LABEL_8;
  }
  ucat = self->_ucat;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_4:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorEnsureStopped]", 0x1Eu, (uint64_t)"Monitor stop\n", v2, v3, v4, v5, v13);
      goto LABEL_6;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
    {
      ucat = self->_ucat;
      goto LABEL_4;
    }
  }
LABEL_6:
  pollTimer = self->_pollTimer;
  if (pollTimer)
  {
    BOOL v9 = pollTimer;
    dispatch_source_cancel(v9);
    uint64_t v10 = self->_pollTimer;
    self->_pollTimer = 0;
  }
LABEL_8:
  probeSourceV4 = self->_probeSourceV4;
  if (probeSourceV4) {
    dispatch_source_cancel(probeSourceV4);
  }
  probeSourceV6 = self->_probeSourceV6;
  if (probeSourceV6)
  {
    dispatch_source_cancel(probeSourceV6);
  }
}

- (void)_monitorEnsureStarted
{
  if (self->_hasIPv4Endpoint && !self->_probeSourceV4) {
    [(CUNetLinkManager *)self _monitorSetupSocket:2];
  }
  if (self->_hasIPv6Endpoint && !self->_probeSourceV6) {
    [(CUNetLinkManager *)self _monitorSetupSocket:30];
  }
  if (!self->_pollTimer)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu)) {
          goto LABEL_12;
        }
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _monitorEnsureStarted]", 0x1Eu, (uint64_t)"Monitor start\n", v2, v3, v4, v5, v13);
    }
LABEL_12:
    int v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    pollTimer = self->_pollTimer;
    self->_pollTimer = v8;

    uint64_t v10 = self->_pollTimer;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __41__CUNetLinkManager__monitorEnsureStarted__block_invoke;
    handler[3] = &unk_1E55BFC18;
    handler[4] = self;
    dispatch_source_set_event_handler(v10, handler);
    uint64_t v11 = self->_pollTimer;
    dispatch_time_t v12 = dispatch_time(0, 13000000000);
    dispatch_source_set_timer(v11, v12, 0x306DC4200uLL, 0xB2D05E00uLL);
    dispatch_activate((dispatch_object_t)self->_pollTimer);
  }
}

uint64_t __41__CUNetLinkManager__monitorEnsureStarted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateEndpoints];
}

- (void)_updateEndpoint:(id)a3 state:(int)a4
{
  uint64_t v6 = (const void **)a3;
  uint64_t v11 = v6;
  if (*((_DWORD *)v6 + 9) == a4) {
    goto LABEL_10;
  }
  ucat = self->_ucat;
  uint64_t v16 = v11;
  if (ucat->var0 <= 30)
  {
    if (ucat->var0 != -1)
    {
LABEL_6:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateEndpoint:state:]", 0x1Eu, (uint64_t)"Endpoint state changed: %##a: %s -> %s\n", v7, v8, v9, v10, (uint64_t)(v11 + 1));
      uint64_t v11 = v16;
      goto LABEL_7;
    }
    BOOL v13 = _LogCategory_Initialize((uint64_t)ucat, 0x1Eu);
    uint64_t v11 = v16;
    if (v13)
    {
      ucat = self->_ucat;
      goto LABEL_6;
    }
  }
LABEL_7:
  *((_DWORD *)v11 + 9) = a4;
  ++*((_DWORD *)v11 + 18);
  int v14 = _Block_copy(v11[5]);
  uint64_t v15 = v14;
  if (v14) {
    (*((void (**)(void *))v14 + 2))(v14);
  }

  uint64_t v11 = v16;
LABEL_10:
  MEMORY[0x1F41817F8](v6, v11);
}

- (void)_updateNDP
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)uint64_t v36 = xmmword_18E416EE0;
  uint64_t v37 = 0x40000000009;
  uint64_t v34 = 0;
  unsigned int v33 = 0;
  uint64_t v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, (int *)&v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateNDP]", 0x5Au, (uint64_t)"### Get IPv6 route info failed: %#m\n", v3, v4, v5, v6, v33);
    return;
  }
  v32.tv_sec = 0;
  *(void *)&v32.tv_usec = 0;
  gettimeofday(&v32, 0);
  if (v34 >= 1)
  {
    uint64_t v7 = v25;
    unint64_t v8 = (unint64_t)v25 + v34;
    unint64_t v26 = (unint64_t)v25 + v34;
    while (1)
    {
      uint64_t v9 = *((unsigned char *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4;
      uint64_t v10 = (char *)v7 + v9 + 136;
      uint64_t v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6) {
        break;
      }
LABEL_25:
      uint64_t v7 = (unsigned __int16 *)((char *)v7 + v11);
      if ((unint64_t)v7 >= v8) {
        goto LABEL_26;
      }
    }
    uint64_t v27 = *v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    dispatch_time_t v12 = self->_endpoints;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v29;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v29 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * v16);
      if (*(unsigned char *)(v17 + 9) != 30) {
        goto LABEL_20;
      }
      if (SockAddrCompareAddrEx((void *)(v17 + 8), (uint64_t)(v7 + 68), 1)) {
        goto LABEL_20;
      }
      *(void *)(v17 + 48) = *((void *)v7 + 14);
      *(unsigned char *)(v17 + 64) = 1;
      uint64_t v22 = self->_ucat;
      if (v22->var0 > 9) {
        goto LABEL_20;
      }
      if (v22->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v22, 9u)) {
          goto LABEL_20;
        }
        uint64_t v22 = self->_ucat;
      }
      LogPrintF((uint64_t)v22, (uint64_t)"-[CUNetLinkManager _updateNDP]", 9u, (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n", v18, v19, v20, v21, v17 + 8);
LABEL_20:
      if (v14 == ++v16)
      {
        uint64_t v23 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
        uint64_t v14 = v23;
        if (!v23)
        {
LABEL_24:

          unint64_t v8 = v26;
          uint64_t v11 = v27;
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_26:
  free(v25);
}

- (void)_updateARP
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  *(_OWORD *)uint64_t v36 = xmmword_18E416EF0;
  uint64_t v37 = 0x40000000009;
  uint64_t v34 = 0;
  unsigned int v33 = 0;
  uint64_t v25 = (unsigned __int16 *)sysctl_copy(v36, (size_t *)&v34, (int *)&v33);
  if (!v25)
  {
    ucat = self->_ucat;
    if (ucat->var0 > 90) {
      return;
    }
    if (ucat->var0 == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au)) {
        return;
      }
      ucat = self->_ucat;
    }
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateARP]", 0x5Au, (uint64_t)"### Get IPv4 route info failed: %#m\n", v3, v4, v5, v6, v33);
    return;
  }
  v32.tv_sec = 0;
  *(void *)&v32.tv_usec = 0;
  gettimeofday(&v32, 0);
  if (v34 >= 1)
  {
    uint64_t v7 = v25;
    unint64_t v8 = (unint64_t)v25 + v34;
    unint64_t v26 = (unint64_t)v25 + v34;
    while (1)
    {
      uint64_t v9 = *((unsigned char *)v7 + 136) ? (*((unsigned __int8 *)v7 + 136) + 3) & 0x1FC : 4;
      uint64_t v10 = (char *)v7 + v9 + 136;
      uint64_t v11 = *v7;
      if (v10[1] == 18 && v10[6] == 6) {
        break;
      }
LABEL_25:
      uint64_t v7 = (unsigned __int16 *)((char *)v7 + v11);
      if ((unint64_t)v7 >= v8) {
        goto LABEL_26;
      }
    }
    uint64_t v27 = *v7;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    dispatch_time_t v12 = self->_endpoints;
    uint64_t v13 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (!v13) {
      goto LABEL_24;
    }
    uint64_t v18 = v13;
    uint64_t v19 = *(void *)v29;
LABEL_11:
    uint64_t v20 = 0;
    while (1)
    {
      if (*(void *)v29 != v19) {
        objc_enumerationMutation(v12);
      }
      uint64_t v21 = *(void *)(*((void *)&v28 + 1) + 8 * v20);
      if (*(unsigned char *)(v21 + 9) != 2) {
        goto LABEL_20;
      }
      if (*(_DWORD *)(v21 + 12) != *((_DWORD *)v7 + 35)) {
        goto LABEL_20;
      }
      *(void *)(v21 + 48) = *((void *)v7 + 14);
      *(unsigned char *)(v21 + 64) = 1;
      uint64_t v22 = self->_ucat;
      if (v22->var0 > 9) {
        goto LABEL_20;
      }
      if (v22->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v22, 9u)) {
          goto LABEL_20;
        }
        uint64_t v22 = self->_ucat;
      }
      LogPrintF((uint64_t)v22, (uint64_t)"-[CUNetLinkManager _updateARP]", 9u, (uint64_t)"ARP/NDP poll %##a: RxExp %llu (%lld), TxExp %llu, RtExp %d, Now %ld\n", v14, v15, v16, v17, v21 + 8);
LABEL_20:
      if (v18 == ++v20)
      {
        uint64_t v23 = [(NSMutableSet *)v12 countByEnumeratingWithState:&v28 objects:v35 count:16];
        uint64_t v18 = v23;
        if (!v23)
        {
LABEL_24:

          unint64_t v8 = v26;
          uint64_t v11 = v27;
          goto LABEL_25;
        }
        goto LABEL_11;
      }
    }
  }
LABEL_26:
  free(v25);
}

- (void)_updateEndpoints
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  ucat = self->_ucat;
  if (ucat->var0 <= 9)
  {
    if (ucat->var0 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _updateEndpoints]", 9u, (uint64_t)"Update endpoints\n", v2, v3, v4, v5, v24);
      goto LABEL_5;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, 9u))
    {
      ucat = self->_ucat;
      goto LABEL_3;
    }
  }
LABEL_5:
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  unint64_t v8 = self->_endpoints;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v30 != v11) {
          objc_enumerationMutation(v8);
        }
        *(unsigned char *)(*(void *)(*((void *)&v29 + 1) + 8 * i) + 64) = 0;
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v10);
  }

  if (self->_hasIPv4Endpoint) {
    [(CUNetLinkManager *)self _updateARP];
  }
  if (self->_hasIPv6Endpoint) {
    [(CUNetLinkManager *)self _updateNDP];
  }
  v28.__darwin_time_t tv_sec = 0;
  *(void *)&v28.tv_usec = 0;
  gettimeofday(&v28, 0);
  uint64_t v13 = mach_absolute_time();
  __darwin_time_t tv_sec = v28.tv_sec;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v15 = self->_endpoints;
  uint64_t v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v24 + 1) + 8 * j);
        int v21 = *(unsigned __int8 *)(v20 + 64);
        if (*(unsigned char *)(v20 + 64)) {
          BOOL v22 = *(void *)(v20 + 48) - tv_sec < -16;
        }
        else {
          BOOL v22 = 1;
        }
        if (v22)
        {
          uint64_t v23 = *(void *)(v20 + 56);
          if (!v23)
          {
            *(void *)(v20 + 56) = v13;
            uint64_t v23 = v13;
          }
          if (*(_DWORD *)(v20 + 36) != 3 && (!v21 || UpTicksToSeconds(v13 - v23) >= 0x1F))
          {
            ++self->_unreachableCount;
            -[CUNetLinkManager _updateEndpoint:state:](self, "_updateEndpoint:state:", v20, 3, (void)v24);
          }
          -[CUNetLinkManager _monitorSendPacketToEndpoint:](self, "_monitorSendPacketToEndpoint:", v20, (void)v24);
        }
        else
        {
          if (*(_DWORD *)(v20 + 36) == 3) {
            ++self->_reReachableCount;
          }
          *(void *)(v20 + 56) = 0;
          -[CUNetLinkManager _updateEndpoint:state:](self, "_updateEndpoint:state:", v20, 2, (void)v24);
        }
      }
      uint64_t v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v17);
  }
}

- (void)_update
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(_WORD *)&self->_hasIPv4Endpoint = 0;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_endpoints;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = *(unsigned __int8 *)(*(void *)(*((void *)&v9 + 1) + 8 * i) + 9);
        if (v8 == 30)
        {
          self->_hasIPv6Endpoint = 1;
LABEL_10:
          if (!self->_hasIPv4Endpoint) {
            continue;
          }
          goto LABEL_11;
        }
        if (v8 != 2) {
          goto LABEL_10;
        }
        self->_hasIPv4Endpoint = 1;
LABEL_11:
        if (self->_hasIPv6Endpoint) {
          goto LABEL_14;
        }
      }
      uint64_t v5 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
LABEL_14:

  if (self->_hasIPv4Endpoint || self->_hasIPv6Endpoint) {
    [(CUNetLinkManager *)self _monitorEnsureStarted];
  }
  else {
    [(CUNetLinkManager *)self _monitorEnsureStopped];
  }
}

- (void)removeEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CUNetLinkManager_removeEndpoint___block_invoke;
  v7[3] = &unk_1E55BF170;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __35__CUNetLinkManager_removeEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  long long v10 = *(int **)(v9 + 80);
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetLinkManager removeEndpoint:]_block_invoke", 0x1Eu, (uint64_t)"Remove endpoint: %##a\n", a5, a6, a7, a8, *(void *)(a1 + 40) + 8);
      uint64_t v9 = *(void *)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void *)(a1 + 32);
    if (v11)
    {
      long long v10 = *(int **)(v9 + 80);
      goto LABEL_3;
    }
  }
LABEL_5:
  [*(id *)(v9 + 8) removeObject:*(void *)(a1 + 40)];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 16);
  uint64_t v12 = *(void *)(a1 + 40);
  if (*(_DWORD *)(v12 + 36) != 1)
  {
    *(_DWORD *)(v12 + 36) = 1;
    uint64_t v13 = _Block_copy(*(const void **)(*(void *)(a1 + 40) + 40));
    uint64_t v14 = v13;
    if (v13) {
      (*((void (**)(void *))v13 + 2))(v13);
    }
  }
  uint64_t v15 = *(void **)(a1 + 32);
  return [v15 _update];
}

- (void)addEndpoint:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __32__CUNetLinkManager_addEndpoint___block_invoke;
  v7[3] = &unk_1E55BF170;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __32__CUNetLinkManager_addEndpoint___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(unsigned __int8 *)(v9 + 9);
  if (v10 == 30 || v10 == 2) {
    *(_WORD *)(v9 + 10) = -30194;
  }
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(int **)(v12 + 80);
  if (*v13 <= 30)
  {
    if (*v13 != -1)
    {
LABEL_9:
      LogPrintF((uint64_t)v13, (uint64_t)"-[CUNetLinkManager addEndpoint:]_block_invoke", 0x1Eu, (uint64_t)"Add endpoint: %##a\n", a5, a6, a7, a8, *(void *)(a1 + 32) + 8);
      uint64_t v12 = *(void *)(a1 + 40);
      goto LABEL_11;
    }
    BOOL v14 = _LogCategory_Initialize((uint64_t)v13, 0x1Eu);
    uint64_t v12 = *(void *)(a1 + 40);
    if (v14)
    {
      uint64_t v13 = *(int **)(v12 + 80);
      goto LABEL_9;
    }
  }
LABEL_11:
  uint64_t v15 = *(void **)(v12 + 8);
  if (!v15)
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void **)(v17 + 8);
    *(void *)(v17 + 8) = v16;

    uint64_t v15 = *(void **)(*(void *)(a1 + 40) + 8);
  }
  [v15 addObject:*(void *)(a1 + 32)];
  ++*(_DWORD *)(*(void *)(a1 + 40) + 16);
  [*(id *)(a1 + 40) _update];
  uint64_t v19 = *(void **)(a1 + 40);
  return [v19 _updateEndpoints];
}

- (void)_invalidated
{
  if (self->_invalidateCalled
    && !self->_invalidateDone
    && !self->_pollTimer
    && !self->_probeSourceV4
    && !self->_probeSourceV6)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
    {
      invalidationHandler[2](invalidationHandler, a2);
      id v4 = self->_invalidationHandler;
    }
    else
    {
      id v4 = 0;
    }
    self->_invalidationHandler = 0;

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
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v5, v6, v7, v8, v11);
    }
  }
}

- (void)_invalidate
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self->_invalidateCalled) {
    return;
  }
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
    LogPrintF((uint64_t)ucat, (uint64_t)"-[CUNetLinkManager _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v16);
  }
LABEL_6:
  self->_invalidateCalled = 1;
  [(CUNetLinkManager *)self _monitorEnsureStopped];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = self->_endpoints;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        *(_DWORD *)(v13 + 36) = 1;
        BOOL v14 = _Block_copy(*(const void **)(v13 + 40));
        uint64_t v15 = v14;
        if (*(void *)(v13 + 40)) {
          (*((void (**)(void *))v14 + 2))(v14);
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(CUNetLinkManager *)self _invalidated];
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__CUNetLinkManager_invalidate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __30__CUNetLinkManager_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__CUNetLinkManager_activate__block_invoke;
  block[3] = &unk_1E55BFC18;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__CUNetLinkManager_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9 = *(void **)(a1 + 32);
  uint64_t v10 = (int *)v9[10];
  if (*v10 <= 30)
  {
    if (*v10 != -1)
    {
LABEL_3:
      LogPrintF((uint64_t)v10, (uint64_t)"-[CUNetLinkManager activate]_block_invoke", 0x1Eu, (uint64_t)"Activate: poll %d secs (+/- %d), reach %d secs, unreach %d secs\n", a5, a6, a7, a8, 13);
      uint64_t v9 = *(void **)(a1 + 32);
      goto LABEL_5;
    }
    BOOL v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
    uint64_t v9 = *(void **)(a1 + 32);
    if (v11)
    {
      uint64_t v10 = (int *)v9[10];
      goto LABEL_3;
    }
  }
LABEL_5:
  return [v9 _update];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  uint64_t v7 = qword_1E91CD218;
  id v14 = v5;
  [v14 UTF8String];
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);
}

- (id)descriptionWithLevel:(int)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  CFMutableStringRef v44 = 0;
  uint64_t v5 = [(NSMutableSet *)self->_endpoints count];
  NSAppendPrintF(&v44, (uint64_t)"CUNetLinkManager %d EP(s), EPCh %u, PrRx/Tx/Err %u/%u/%u, Un/Re %u/%u", v6, v7, v8, v9, v10, v11, v5);
  uint64_t v12 = v44;
  long long v19 = v12;
  if (a3 <= 20)
  {
    CFMutableStringRef v43 = v12;
    NSAppendPrintF(&v43, (uint64_t)"\n", v13, v14, v15, v16, v17, v18, v37);
    uint64_t v20 = v43;

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v21 = self->_endpoints;
    uint64_t v22 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      if (a3 >= 11) {
        uint64_t v25 = 50;
      }
      else {
        uint64_t v25 = 30;
      }
      do
      {
        uint64_t v26 = 0;
        long long v27 = v20;
        do
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          timeval v28 = *(void **)(*((void *)&v39 + 1) + 8 * v26);
          CFMutableStringRef v38 = v27;
          long long v29 = CUDescriptionWithLevel(v28, v25);
          NSAppendPrintF(&v38, (uint64_t)"    %@\n", v30, v31, v32, v33, v34, v35, (uint64_t)v29);
          uint64_t v20 = v38;

          ++v26;
          long long v27 = v20;
        }
        while (v23 != v26);
        uint64_t v23 = [(NSMutableSet *)v21 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v23);
    }

    long long v19 = v20;
  }
  return v19;
}

- (id)description
{
  return [(CUNetLinkManager *)self descriptionWithLevel:50];
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
  v4.super_class = (Class)CUNetLinkManager;
  [(CUNetLinkManager *)&v4 dealloc];
}

- (CUNetLinkManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)CUNetLinkManager;
  uint64_t v2 = [(CUNetLinkManager *)&v6 init];
  uint64_t v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v3->_probeSocketV4 = -1;
    v3->_probeSocketV6 = -1;
    v3->_ucat = (LogCategory *)&gLogCategory_CUNetLinkManager;
    objc_super v4 = v3;
  }

  return v3;
}

@end