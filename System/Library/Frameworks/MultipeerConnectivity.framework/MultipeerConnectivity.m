uint64_t ec_log()
{
  if (ec_log_onceToken != -1) {
    dispatch_once(&ec_log_onceToken, &__block_literal_global);
  }
  return ec_log___logger;
}

os_log_t __ec_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "EventCallback");
  ec_log___logger = (uint64_t)result;
  return result;
}

uint64_t agps_log()
{
  if (agps_log_onceToken != -1) {
    dispatch_once(&agps_log_onceToken, &__block_literal_global_8);
  }
  return agps_log___logger;
}

os_log_t __agps_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "AGPSession");
  agps_log___logger = (uint64_t)result;
  return result;
}

uint64_t gcks_log()
{
  if (gcks_log_onceToken != -1) {
    dispatch_once(&gcks_log_onceToken, &__block_literal_global_11);
  }
  return gcks_log___logger;
}

os_log_t __gcks_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "GCKSession");
  gcks_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcadvertiser_log()
{
  if (mcadvertiser_log_onceToken != -1) {
    dispatch_once(&mcadvertiser_log_onceToken, &__block_literal_global_14);
  }
  return mcadvertiser_log___logger;
}

os_log_t __mcadvertiser_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyServiceAdvertiser");
  mcadvertiser_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcadvertiser_ui_log()
{
  if (mcadvertiser_ui_log_onceToken != -1) {
    dispatch_once(&mcadvertiser_ui_log_onceToken, &__block_literal_global_17);
  }
  return mcadvertiser_ui_log___logger;
}

os_log_t __mcadvertiser_ui_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCAdvertiserAssistant");
  mcadvertiser_ui_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcbrowser_log()
{
  if (mcbrowser_log_onceToken != -1) {
    dispatch_once(&mcbrowser_log_onceToken, &__block_literal_global_20);
  }
  return mcbrowser_log___logger;
}

os_log_t __mcbrowser_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyServiceBrowser");
  mcbrowser_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcbrowser_ui_log()
{
  if (mcbrowser_ui_log_onceToken != -1) {
    dispatch_once(&mcbrowser_ui_log_onceToken, &__block_literal_global_23);
  }
  return mcbrowser_ui_log___logger;
}

os_log_t __mcbrowser_ui_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCBrowserViewController");
  mcbrowser_ui_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcdp_log()
{
  if (mcdp_log_onceToken != -1) {
    dispatch_once(&mcdp_log_onceToken, &__block_literal_global_26);
  }
  return mcdp_log___logger;
}

os_log_t __mcdp_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyDiscoveryPeer");
  mcdp_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcdpc_log()
{
  if (mcdpc_log_onceToken != -1) {
    dispatch_once(&mcdpc_log_onceToken, &__block_literal_global_29);
  }
  return mcdpc_log___logger;
}

os_log_t __mcdpc_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCNearbyDiscoveryPeerConnection");
  mcdpc_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcpid_log()
{
  if (mcpid_log_onceToken != -1) {
    dispatch_once(&mcpid_log_onceToken, &__block_literal_global_32);
  }
  return mcpid_log___logger;
}

os_log_t __mcpid_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCPeerID");
  mcpid_log___logger = (uint64_t)result;
  return result;
}

uint64_t mcs_log()
{
  if (mcs_log_onceToken != -1) {
    dispatch_once(&mcs_log_onceToken, &__block_literal_global_35);
  }
  return mcs_log___logger;
}

os_log_t __mcs_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "MCSession");
  mcs_log___logger = (uint64_t)result;
  return result;
}

uint64_t ospf_log()
{
  if (ospf_log_onceToken != -1) {
    dispatch_once(&ospf_log_onceToken, &__block_literal_global_38);
  }
  return ospf_log___logger;
}

os_log_t __ospf_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "OSPF");
  ospf_log___logger = (uint64_t)result;
  return result;
}

uint64_t MCDashboardLog(char *__format, ...)
{
  va_start(va, __format);
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (MCDashboardClient_onceToken != -1) {
    dispatch_once(&MCDashboardClient_onceToken, &__block_literal_global_52);
  }
  v2 = (void *)MCDashboardClient_client;
  vsnprintf(__str, 0x400uLL, __format, va);
  return objc_msgSend(v2, "logf:", "MC: p=%{pid}; %s", getpid(), __str, va);
}

uint64_t MCDashboardLogJSON(uint64_t a1, __CFString *a2, void *a3)
{
  if (MCDashboardClient_onceToken != -1) {
    dispatch_once(&MCDashboardClient_onceToken, &__block_literal_global_52);
  }
  v6 = (void *)MCDashboardClient_client;
  if (![(__CFString *)a2 length]) {
    a2 = @"MC";
  }
  v7 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithDictionary:a1];
  [v7 setObject:a2 forKey:@"_cat"];
  objc_msgSend(v7, "setObject:forKey:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processName"), @"pid");
  if ([a3 length]) {
    [v7 setObject:a3 forKey:@"_op"];
  }

  return [v6 logJSON:v7];
}

void MCMetricsLog(__CFString *a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if ([(__CFString *)a1 length])
  {
    if (a2)
    {
      if (metrics_log_onceToken != -1) {
        dispatch_once(&metrics_log_onceToken, &__block_literal_global_55);
      }
      v6 = metrics_log___logger;
      if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_DEFAULT))
      {
        int v9 = 138412546;
        v10 = a1;
        __int16 v11 = 2112;
        uint64_t v12 = a2;
        _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "MetricEvent '%@' : %@\n", (uint8_t *)&v9, 0x16u);
      }
      AnalyticsSendEvent();
      if (a3) {
        MCDashboardLogJSON(a2, a1, @"metrics");
      }
    }
    else
    {
      if (metrics_log_onceToken != -1) {
        dispatch_once(&metrics_log_onceToken, &__block_literal_global_55);
      }
      v8 = metrics_log___logger;
      if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_ERROR)) {
        MCMetricsLog_cold_2(v8);
      }
    }
  }
  else
  {
    if (metrics_log_onceToken != -1) {
      dispatch_once(&metrics_log_onceToken, &__block_literal_global_55);
    }
    v7 = metrics_log___logger;
    if (os_log_type_enabled((os_log_t)metrics_log___logger, OS_LOG_TYPE_ERROR)) {
      MCMetricsLog_cold_1((uint64_t)a1, v7);
    }
  }
}

uint64_t __MCDashboardClient_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F38548]);
  MCDashboardClient_client = (uint64_t)v0;

  return [v0 activate];
}

os_log_t __metrics_log_block_invoke()
{
  os_log_t result = os_log_create("com.apple.multipeerconnectivity", "Metrics");
  metrics_log___logger = (uint64_t)result;
  return result;
}

const char *XDataControlTypeName(int a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a1 > 30)
  {
    switch(a1)
    {
      case 31:
        return "XDataStreamCloseFromReceiver";
      case 40:
        return "XDataPeerIDPush";
      case 41:
        return "XDataConnectionBlobPush";
    }
  }
  else
  {
    switch(a1)
    {
      case 20:
        return "XDataStreamOpenRequest";
      case 21:
        return "XDataStreamOpenResponse";
      case 30:
        return "XDataStreamCloseFromSender";
    }
  }
  v3 = mcs_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4[0] = 67109120;
    v4[1] = a1;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Unrecognized type [%d].", (uint8_t *)v4, 8u);
  }
  return "invalid";
}

void sub_21875F8D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void GCKEventListenerForMCSession(void *a1, uint64_t a2, long long *a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v6 = mcs_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(int *)a3;
    if (v8 > 6) {
      int v9 = "?";
    }
    else {
      int v9 = off_264338238[v8];
    }
    int v10 = *((_DWORD *)a3 + 4);
    int v11 = *((_DWORD *)a3 + 5);
    int v12 = 136316162;
    uint64_t v13 = v9;
    __int16 v14 = 1024;
    int v15 = v10;
    __int16 v16 = 1024;
    int v17 = v11;
    __int16 v18 = 2048;
    v19 = a1;
    __int16 v20 = 1024;
    int v21 = a2;
    _os_log_debug_impl(&dword_218756000, v6, OS_LOG_TYPE_DEBUG, "Event %s size=%d status=%d (%p) from pid[%08X].", (uint8_t *)&v12, 0x28u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  AGPSessionEvent([a1 agpSession], a2, a3);
}

void AGPEventListenerForMCSession(void *a1, int a2, int *a3)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v6 = mcs_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *a3;
    if (v15 > 6) {
      __int16 v16 = "?";
    }
    else {
      __int16 v16 = off_264338238[v15];
    }
    int v17 = a3[4];
    int v18 = a3[5];
    *(_DWORD *)buf = 136316162;
    uint64_t v22 = v16;
    __int16 v23 = 1024;
    int v24 = v17;
    __int16 v25 = 1024;
    int v26 = v18;
    __int16 v27 = 2048;
    v28 = a1;
    __int16 v29 = 1024;
    int v30 = a2;
    _os_log_debug_impl(&dword_218756000, v6, OS_LOG_TYPE_DEBUG, "Event %s size=%d status=%d (%p) from pid[%08X].", buf, 0x28u);
  }
  id v7 = objc_alloc_init(MEMORY[0x263F086B0]);
  uint64_t v8 = malloc_type_malloc(a3[4] + 24, 0x31869B4BuLL);
  if (v8)
  {
    int v9 = v8;
    long long v10 = *(_OWORD *)a3;
    v8[2] = *((void *)a3 + 2);
    *(_OWORD *)uint64_t v8 = v10;
    size_t v11 = a3[4];
    if ((int)v11 >= 1)
    {
      int v12 = (const void *)*((void *)a3 + 1);
      if (v12)
      {
        memcpy(v8 + 3, v12, v11);
        v9[1] = v9 + 3;
      }
    }
    uint64_t v13 = [a1 syncQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __AGPEventListenerForMCSession_block_invoke;
    block[3] = &unk_2643381E0;
    block[4] = a1;
    block[5] = v9;
    int v20 = a2;
    dispatch_async(v13, block);
  }
  else
  {
    __int16 v14 = mcs_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      AGPEventListenerForMCSession_cold_1();
    }
  }
}

void sub_218760C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void sub_218761480(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_218762660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

void __AGPEventListenerForMCSession_block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x21D471D60]();
  char v3 = 1;
  [*(id *)(a1 + 32) syncHandleNetworkEvent:*(void *)(a1 + 40) pid:*(unsigned int *)(a1 + 48) freeEventWhenDone:&v3];
  if (v3) {
    free(*(void **)(a1 + 40));
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_16(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xEu);
}

void OUTLINED_FUNCTION_17(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_18(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2_0(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x30u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x2Au);
}

uint64_t UpdateRTO(unsigned int *a1, int a2)
{
  if (a2 >= 1)
  {
    unsigned int v3 = *a1;
    int v2 = a1[1];
    unsigned int v4 = *a1 + 1;
    *a1 = v4;
    if (v3 <= 0x3F)
    {
      int v5 = v2 + a2;
      unsigned int v6 = (v2 + a2) / v4;
      unsigned int v7 = a2 - v6;
      if ((int)(a2 - v6) < 0) {
        unsigned int v7 = v6 - a2;
      }
      unsigned int v8 = a1[2] - ((int)a1[2] >> 5) + v7;
      a1[1] = v5;
      a1[2] = v8;
      goto LABEL_11;
    }
    int v9 = a2 - (v2 >> 6);
    if (v9 >= 0) {
      int v10 = a2 - (v2 >> 6);
    }
    else {
      int v10 = (v2 >> 6) - a2;
    }
    int v11 = a1[2];
    if (v10 < (3 * v11) >> 5)
    {
      int v12 = v9 + v2;
      int v13 = v10 - (v11 >> 5) + v11;
      a1[1] = v12;
      a1[2] = v13;
      unsigned int v6 = (v13 >> 5) + (v12 >> 6);
LABEL_11:
      a1[3] = v6;
    }
  }
  return a1[3];
}

void TracePrintNodes(uint64_t a1, int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  double v9 = micro();
  if (v9 - *(double *)(a1 + 7160) > 1.0)
  {
    *(double *)(a1 + 7160) = v9;
    *(_DWORD *)(a1 + 7152) = 1;
    goto LABEL_6;
  }
  int v10 = *(_DWORD *)(a1 + 7152);
  *(_DWORD *)(a1 + 7152) = v10 + 1;
  if (v10 < 201)
  {
LABEL_6:
    int v12 = gcks_log();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (a4)
    {
      if (!v13) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109120;
      int v36 = a2;
      __int16 v14 = "My routing table: %d nodes.";
      uint64_t v15 = v12;
      uint32_t v16 = 8;
    }
    else
    {
      if (!v13) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 67109376;
      int v36 = a5;
      __int16 v37 = 1024;
      int v38 = a2;
      __int16 v14 = "Participant %08X routing table: %d nodes.";
      uint64_t v15 = v12;
      uint32_t v16 = 14;
    }
    _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
LABEL_12:
    if (a2 >= 1)
    {
      uint64_t v17 = 0;
      int v18 = (int *)(a3 + 292);
      do
      {
        v19 = gcks_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = a3 + 416 * v17;
          int v21 = *(_DWORD *)v20;
          int v22 = *(_DWORD *)(v20 + 4);
          int v23 = *(unsigned __int16 *)(v20 + 272);
          int v24 = *(unsigned __int16 *)(v20 + 274);
          int v25 = *(_DWORD *)(v20 + 276);
          int v26 = *(_DWORD *)(v20 + 280);
          LODWORD(v20) = *(_DWORD *)(v20 + 284);
          *(_DWORD *)buf = 67110912;
          int v36 = v17;
          __int16 v37 = 1024;
          int v38 = v21;
          __int16 v39 = 1024;
          int v40 = v22;
          __int16 v41 = 1024;
          int v42 = v23;
          __int16 v43 = 1024;
          int v44 = v24;
          __int16 v45 = 1024;
          int v46 = v25;
          __int16 v47 = 1024;
          int v48 = v26;
          __int16 v49 = 1024;
          int v50 = v20;
          _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "Node %d [%08X]: NextHop[%08X], SN[%u], LSASN [%u], New flag[%d], From[%08X], # of neighbors [%d]", buf, 0x32u);
        }
        uint64_t v27 = a3 + 416 * v17;
        if (*(int *)(v27 + 284) >= 1)
        {
          uint64_t v28 = 0;
          __int16 v29 = (int *)(v27 + 284);
          int v30 = v18;
          do
          {
            uint64_t v31 = gcks_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              int v32 = *(v30 - 1);
              int v33 = *v30;
              *(_DWORD *)buf = 67109632;
              int v36 = v28;
              __int16 v37 = 1024;
              int v38 = v32;
              __int16 v39 = 1024;
              int v40 = v33;
              _os_log_impl(&dword_218756000, v31, OS_LOG_TYPE_DEFAULT, "\tneighbor %d: %08X - RTT[%u]", buf, 0x14u);
            }
            ++v28;
            v30 += 2;
          }
          while (v28 < *v29);
        }
        ++v17;
        v18 += 104;
      }
      while (v17 != a2);
    }
    return;
  }
  int v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    TracePrintNodes_cold_1((int *)(a1 + 7152), v11);
  }
}

void gckSessionUpdateRoutingTable(uint64_t a1, uint64_t a2)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(int *)(a1 + 420);
  uint64_t v4 = a1 + 424;
  uint64_t v5 = *(unsigned int *)(a1 + 420);
  uint64_t v6 = MEMORY[0x270FA5388](a1, a2);
  unsigned int v8 = &buf[-((v7 + 15) & 0x7FFFFFFF0)];
  uint64_t v10 = MEMORY[0x270FA5388](v6, v9);
  int v12 = &buf[-v11];
  uint64_t v14 = MEMORY[0x270FA5388](v10, v13);
  uint32_t v16 = &buf[-v15];
  TracePrintNodes(v14, v3, v4, 1, *(_DWORD *)(v14 + 416));
  memset(v8, 255, 4 * v3);
  memset(v12, 255, 4 * v3);
  bzero(v16, 4 * v3);
  *(_DWORD *)unsigned int v8 = 0;
  if ((int)v3 >= 1)
  {
    uint64_t v17 = 0;
    unsigned int v18 = -1;
    int v19 = -1;
    do
    {
      do
      {
        if (!*(_DWORD *)&v16[4 * v17] && *(_DWORD *)&v8[4 * v17] < v18)
        {
          int v19 = v17;
          unsigned int v18 = *(_DWORD *)&v8[4 * v17];
        }
        ++v17;
      }
      while (v17 != v5);
      if (v19 == -1) {
        break;
      }
      *(_DWORD *)&v16[4 * v19] = 1;
      uint64_t v20 = v4 + 416 * v19;
      uint64_t v21 = *(unsigned int *)(v20 + 284);
      if ((int)v21 >= 1)
      {
        uint64_t v22 = 0;
        uint64_t v23 = v20 + 288;
        do
        {
          if ((int)v5 < 1)
          {
            LODWORD(v24) = 0;
          }
          else
          {
            uint64_t v24 = 0;
            int v25 = (_DWORD *)v4;
            while (*v25 != *(_DWORD *)(v23 + 8 * v22))
            {
              v25 += 104;
              if (v5 == ++v24) {
                goto LABEL_18;
              }
            }
          }
          if (v24 != v5 && !*(_DWORD *)&v16[4 * v24])
          {
            int v26 = *(_DWORD *)(v23 + 8 * v22 + 4);
            if (v26 != -1)
            {
              unsigned int v27 = v26 + v18;
              if (v27 < *(_DWORD *)&v8[4 * v24])
              {
                *(_DWORD *)&v8[4 * v24] = v27;
                *(_DWORD *)&v12[4 * v24] = v19;
              }
            }
          }
LABEL_18:
          ++v22;
        }
        while (v22 != v21);
      }
      uint64_t v17 = 0;
      unsigned int v18 = -1;
      int v19 = -1;
    }
    while ((int)v5 >= 1);
  }
  uint64_t v28 = *(unsigned int *)(a1 + 708);
  if ((int)v28 >= 1)
  {
    uint64_t v29 = 0;
    uint64_t v30 = a1 + 712;
    do
    {
      if ((int)v5 < 1)
      {
        LODWORD(v31) = 0;
      }
      else
      {
        uint64_t v31 = 0;
        int v32 = (_DWORD *)v4;
        while (*v32 != *(_DWORD *)(v30 + 8 * v29))
        {
          v32 += 104;
          if (v5 == ++v31) {
            goto LABEL_35;
          }
        }
      }
      if (v31 != v5 && *(_DWORD *)(v30 + 8 * v29 + 4) != -1) {
        *(_DWORD *)&v12[4 * v31] = 0;
      }
LABEL_35:
      ++v29;
    }
    while (v29 != v28);
  }
  if ((int)v5 > 1)
  {
    for (uint64_t i = 1; i != v5; ++i)
    {
      int v34 = i;
      while (1)
      {
        int v35 = v34;
        int v34 = *(_DWORD *)&v12[4 * v34];
        if (v34 == -1) {
          break;
        }
        if (!v34)
        {
          *(_DWORD *)(v4 + 416 * i + 4) = *(_DWORD *)(v4 + 416 * v35);
          int v36 = *(_DWORD *)&v8[4 * i];
          goto LABEL_43;
        }
      }
      int v36 = -1;
      *(_DWORD *)(v4 + 416 * i + 4) = -1;
LABEL_43:
      *(_DWORD *)(v4 + 416 * i + 268) = v36;
    }
  }
  __int16 v37 = gcks_log();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218756000, v37, OS_LOG_TYPE_DEFAULT, "Updated routing table.", buf, 2u);
  }
  TracePrintNodes(a1, *(_DWORD *)(a1 + 420), v4, 1, *(_DWORD *)(a1 + 416));
}

const char *GCKSessionInterfaceNameForPriority(int a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = a1 - 1;
  if (a1 - 1) < 7 && ((0x7Du >> v2)) {
    return off_264338448[v2];
  }
  uint64_t v3 = gcks_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = a1;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "Unrecognized interface priority type [%d].", (uint8_t *)v5, 8u);
  }
  return "UNKNOWN";
}

uint64_t GCKSessionCreate(int a1, const void *a2, uint64_t a3, uint64_t a4, const void *a5, void *a6)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  if ((GCKSessionCreate_s_fInit & 1) == 0) {
    GCKSessionCreate_s_fInit = 1;
  }
  int v12 = (char *)malloc_type_calloc(1uLL, 0x1D80uLL, 0x10E0040C953D487uLL);
  if (!v12)
  {
    uint64_t v14 = 2149187587;
    uint64_t v21 = gcks_log();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      return v14;
    }
LABEL_14:
    GCKSessionCreate_cold_1(v21, v22, v23, v24, v25, v26, v27, v28);
    return v14;
  }
  uint64_t v13 = v12;
  uint64_t v14 = 2149187587;
  uint64_t v15 = malloc_type_calloc(1uLL, 0x138uLL, 0x10A00406F2D52ADuLL);
  *((void *)v13 + 51) = v15;
  if (!v15)
  {
    free(v13);
    uint64_t v21 = gcks_log();
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    goto LABEL_14;
  }
  uint64_t Handle = CreateHandle();
  if (Handle == 0xFFFFFFFFLL)
  {
    free(v13);
    return 2149187589;
  }
  uint64_t v17 = (void *)Handle;
  *((_DWORD *)v13 + 104) = a1;
  unsigned int v18 = (void *)*((void *)v13 + 51);
  v18[1] = a3;
  v18[2] = a4;
  v18[3] = 0;
  v18[4] = 0;
  *((_DWORD *)v13 + 4) = -1;
  *((void *)v13 + 9) = 0xFFFFFFFFLL;
  *((_DWORD *)v13 + 100) = 0;
  *((_OWORD *)v13 + 3) = xmmword_21878BAB0;
  *((_DWORD *)v13 + 16) = 1;
  *(_OWORD *)(v13 + 24) = xmmword_21878BAC0;
  *((_DWORD *)v13 + 10) = 1;
  *((_DWORD *)v13 + 1884) = 0;
  pthread_mutex_init((pthread_mutex_t *)(v13 + 80), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 7080), 0);
  pthread_rwlock_init((pthread_rwlock_t *)(v13 + 7192), 0);
  pthread_mutex_init((pthread_mutex_t *)(v13 + 7400), 0);
  pthread_cond_init((pthread_cond_t *)(v13 + 7464), 0);
  pthread_cond_init((pthread_cond_t *)(*((void *)v13 + 51) + 112), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((void *)v13 + 51) + 48), 0);
  pthread_mutex_init((pthread_mutex_t *)(*((void *)v13 + 51) + 248), 0);
  __sprintf_chk(v13 + 433, 0, 0x100uLL, "%08X", a1);
  v13[432] = 8;
  *((_DWORD *)v13 + 106) = a1;
  *((_DWORD *)v13 + 107) = a1;
  *((_DWORD *)v13 + 173) = 0;
  *((_WORD *)v13 + 348) = 0;
  *((_DWORD *)v13 + 175) = 0;
  *((_DWORD *)v13 + 176) = a1;
  *((_DWORD *)v13 + 177) = 0;
  *((_DWORD *)v13 + 105) = 1;
  *((_DWORD *)v13 + 1788) = 0;
  *((double *)v13 + 895) = micro();
  *((void *)v13 + 940) = a2;
  if (a2) {
    CFRetain(a2);
  }
  if (!CheckInHandleDebug())
  {
    uint64_t v14 = 2149187586;
LABEL_19:
    uint64_t v29 = gcks_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      GCKSessionCreate_cold_3();
    }
    goto LABEL_21;
  }
  qword_267BD9660 = 0x404E000000000000;
  uint64_t v39 = 0;
  uint64_t v36 = 0;
  long long v38 = 0u;
  *(void *)buf = gckSessionSendICEPacket;
  *(void *)&uint8_t buf[8] = gckSessionRecvICEPacketWithTimeout;
  *(void *)&buf[16] = gckSessionConnectedCallback;
  int v35 = gckSessionCancelRecvUDP;
  __int16 v37 = gckSessionICEListRemoveCallback;
  uint64_t v14 = ICECreateHandleWithCallback();
  ICEDisableCandidatePairFilter();
  CheckOutHandleDebug();
  if ((v14 & 0x80000000) != 0) {
    goto LABEL_19;
  }
  int v19 = pthread_create((pthread_t *)v13 + 896, 0, (void *(__cdecl *)(void *))gckSessionRecvProc, v17);
  if (v19)
  {
    uint64_t v14 = v19 | 0xC01A0000;
    uint64_t v20 = gcks_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      GCKSessionCreate_cold_5();
    }
LABEL_21:
    GCKSessionRelease();
    return v14;
  }
  int v31 = pthread_create((pthread_t *)v13 + 897, 0, (void *(__cdecl *)(void *))gckSessionSendProc, v17);
  if (v31)
  {
    uint64_t v14 = v31 | 0xC01A0000;
    int v32 = gcks_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
      GCKSessionCreate_cold_4();
    }
    goto LABEL_21;
  }
  *((_DWORD *)v13 + 1886) = 0;
  *((void *)v13 + 941) = a5;
  if (a5) {
    CFRetain(a5);
  }
  *a6 = v17;
  int v33 = gcks_log();
  uint64_t v14 = 0;
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "Nov 10 2024";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "21:13:41";
    _os_log_impl(&dword_218756000, v33, OS_LOG_TYPE_DEFAULT, "GCKSessionCreate: [GKS: %s - %s].", buf, 0x16u);
    return 0;
  }
  return v14;
}

double micro()
{
  if ((micro_did_init & 1) == 0)
  {
    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    LODWORD(v3) = info.denom;
    LODWORD(v2) = info.numer;
    *(double *)&micro_rate = (double)v2 / (double)v3 / 1000000000.0;
    __dmb(0xBu);
    micro_did_init = 1;
  }
  double v0 = *(double *)&micro_rate;
  return v0 * (double)(uint64_t)mach_absolute_time();
}

uint64_t GCKSessionRelease()
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  v21.tv_sec = 0;
  *(void *)&v21.tv_usec = 50000;
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 2149187586;
  }
  uint64_t v1 = v0;
  unint64_t v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "Nov 10 2024";
    __int16 v23 = 2080;
    uint64_t v24 = "21:13:41";
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "GCKSessionRelease: Disposing all connections [GKS: %s - %s].", buf, 0x16u);
  }
  gckSessionDisposeAllConnections(v1);
  double v3 = micro() + 1.0;
  while (1)
  {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
    uint64_t v4 = *(void *)(v1 + 7184);
    if (!v4) {
      break;
    }
    while (1)
    {
      pthread_mutex_lock((pthread_mutex_t *)(v4 + 768));
      uint64_t v5 = *(void *)(v4 + 600);
      if (v5) {
        break;
      }
LABEL_9:
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 768));
      uint64_t v4 = *(void *)(v4 + 832);
      if (!v4) {
        goto LABEL_13;
      }
    }
    while (*(unsigned char *)v5 != 4)
    {
      uint64_t v5 = *(void *)(v5 + 64);
      if (!v5) {
        goto LABEL_9;
      }
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v4 + 768));
    pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
    select(0, 0, 0, 0, &v21);
    if (micro() >= v3) {
      goto LABEL_14;
    }
  }
LABEL_13:
  pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
LABEL_14:
  uint64_t v6 = gcks_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "Nov 10 2024";
    __int16 v23 = 2080;
    uint64_t v24 = "21:13:41";
    _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Stop ICE connectionchecks [GKS: %s - %s].", buf, 0x16u);
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
  for (uint64_t i = *(void *)(v1 + 7184); i; uint64_t i = *(void *)(i + 832))
    ICEStopConnectivityCheck();
  *(void *)uint64_t v1 = 0x100000001;
  int v8 = *(_DWORD *)(v1 + 16);
  if (v8 != -1)
  {
    *(_DWORD *)(v1 + 16) = -1;
    close(v8);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v1 + 7192));
  do
  {
    do
      select(0, 0, 0, 0, &v21);
    while (*(void *)(v1 + 7176) && !*(_DWORD *)(v1 + 7516));
  }
  while (*(void *)(v1 + 7168) && !*(_DWORD *)(v1 + 7512));
  CheckOutHandleDebug();
  uint64_t v9 = CheckInHandleDebug();
  uint64_t v10 = (pthread_rwlock_t *)(v9 + 7192);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(v9 + 7192));
  for (uint64_t j = *(void *)(v9 + 7184); j; uint64_t j = *(void *)(j + 832))
    *(_DWORD *)uint64_t j = -1;
  pthread_rwlock_unlock(v10);
  int v12 = *(_opaque_pthread_t **)(v9 + 7168);
  if (v12)
  {
    *(void *)buf = 0;
    pthread_join(v12, (void **)buf);
  }
  uint64_t v13 = *(_opaque_pthread_t **)(v9 + 7176);
  if (v13)
  {
    *(void *)buf = 0;
    pthread_join(v13, (void **)buf);
  }
  CheckOutHandleDebug();
  StopEventCallbackThread(*(char **)(v9 + 408));
  *(void *)(v9 + 408) = 0;
  ICECloseHandle();
  pthread_rwlock_wrlock(v10);
  uint64_t v14 = *(void *)(v9 + 7184);
  if (v14)
  {
    do
    {
      uint64_t v15 = *(void *)(v14 + 832);
      gckSessionFreeCList(v14);
      uint64_t v14 = v15;
    }
    while (v15);
  }
  pthread_rwlock_unlock(v10);
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 7400));
  uint32_t v16 = *(void **)(v9 + 7392);
  if (v16)
  {
    do
    {
      uint64_t v17 = (void *)v16[525];
      free(v16);
      uint32_t v16 = v17;
    }
    while (v17);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7400));
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 80));
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 7080));
  pthread_rwlock_destroy(v10);
  pthread_mutex_destroy((pthread_mutex_t *)(v9 + 7400));
  pthread_cond_destroy((pthread_cond_t *)(v9 + 7464));
  unsigned int v18 = *(const void **)(v9 + 7520);
  if (v18) {
    CFRelease(v18);
  }
  int v19 = *(const void **)(v9 + 7528);
  if (v19) {
    CFRelease(v19);
  }
  free((void *)v9);
  return 0;
}

uint64_t gckSessionRecvProc()
{
  uint64_t v214 = *MEMORY[0x263EF8340];
  uint64_t v0 = -2145779708;
  v202.tv_sec = 0;
  *(void *)&v202.tv_usec = 0;
  pthread_setname_np("com.apple.multipeerconnectivity.gcksession.recvproc");
  uint64_t v1 = CheckInHandleDebug();
  if (!v1) {
    return -2145779710;
  }
  uint64_t v2 = v1;
  memset(&v204, 0, sizeof(v204));
  v203.tv_sec = 0;
  *(void *)&v203.tv_usec = 0;
  global_queue = dispatch_get_global_queue(2, 0);
  uint64_t v4 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, global_queue);
  if (!v4)
  {
    v177 = gcks_log();
    if (os_log_type_enabled(v177, OS_LOG_TYPE_ERROR)) {
      gckSessionRecvProc_cold_1(v177, v178, v179, v180, v181, v182, v183, v184);
    }
    return v0;
  }
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 0x40000000;
  handler[2] = __gckSessionRecvProc_block_invoke;
  handler[3] = &__block_descriptor_tmp_91;
  handler[4] = v2;
  source = v4;
  dispatch_source_set_event_handler(v4, handler);
  int v5 = 0;
  v191 = (pthread_mutex_t *)(v2 + 7080);
  double v193 = micro() + 30.0;
  v194 = (pthread_rwlock_t *)(v2 + 7192);
  v195 = (uint64_t *)(v2 + 7184);
  while (1)
  {
    double v6 = micro();
    if (v6 - *(double *)(v2 + 7144) > 15.0)
    {
      pthread_mutex_lock(v191);
      *(double *)(v2 + 7144) = v6;
      TracePrintNodes(v2, *(_DWORD *)(v2 + 420), v2 + 424, 1, *(_DWORD *)(v2 + 416));
      pthread_mutex_unlock(v191);
    }
    memset(&v204, 0, sizeof(v204));
    uint64_t v7 = *(void *)(v2 + 408);
    double v8 = micro();
    ServiceWaitEventCallbacks(v7, v8);
    pthread_rwlock_wrlock(v194);
    if (*(_DWORD *)v2)
    {
      pthread_rwlock_unlock(v194);
LABEL_294:
      v187 = source;
      goto LABEL_298;
    }
    if (*(_DWORD *)(v2 + 16) == -1)
    {
      int v9 = socket(2, 1, 6);
      *(_DWORD *)(v2 + 16) = v9;
      if (v9 == -1) {
        break;
      }
    }
    double v10 = micro();
    if (v10 >= v193)
    {
      double v193 = v10 + 30.0;
      goto LABEL_261;
    }
    int v11 = *(_DWORD *)(v2 + 16);
    if (__darwin_check_fd_set_overflow(v11, &v204, 0)) {
      *(__int32_t *)((char *)v204.fds_bits + (((unint64_t)v11 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v11;
    }
    int v196 = *(_DWORD *)(v2 + 16);
    uint64_t v12 = *(void *)(v2 + 7184);
    if (v12)
    {
      double v13 = v10 + 0.015;
      double v198 = v10 + 0.5;
      uint64_t v14 = (uint64_t *)(v2 + 7184);
      double v15 = v193;
      while (1)
      {
        v199 = v14;
        v200 = (pthread_mutex_t *)(v12 + 768);
        pthread_mutex_lock((pthread_mutex_t *)(v12 + 768));
        if ((*(unsigned char *)(v12 + 40) & 2) != 0 && (*(_DWORD *)(v12 + 80) & 0x80000000) == 0)
        {
          uint64_t v16 = *(void *)(v12 + 600);
          if (!v16) {
            goto LABEL_28;
          }
          uint64_t v17 = 0;
          unsigned int v18 = (void *)(v12 + 600);
          do
          {
            if (*(unsigned char *)v16 == 8)
            {
              if (v17)
              {
                int v19 = gcks_log();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "Removing duplicate heartbeat.", buf, 2u);
                }
                free(*(void **)(v17 + 40));
                free((void *)v17);
              }
              uint64_t v20 = *(void *)(v16 + 64);
              *unsigned int v18 = v20;
              uint64_t v17 = v16;
            }
            else
            {
              uint64_t v20 = *(void *)(v16 + 64);
              unsigned int v18 = (void *)(v16 + 64);
            }
            uint64_t v16 = v20;
          }
          while (v20);
          if (v17)
          {
            *unsigned int v18 = v17;
            *(void *)(v17 + 64) = 0;
          }
          else
          {
LABEL_28:
            timeval v21 = gcks_log();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              int v162 = *(_DWORD *)(v12 + 88);
              int v163 = *(_DWORD *)(v12 + 72);
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)v212 = v162;
              *(_WORD *)&v212[4] = 1024;
              *(_DWORD *)&v212[6] = v163;
              _os_log_error_impl(&dword_218756000, v21, OS_LOG_TYPE_ERROR, "Expected heartbeat in the retry list not found for participant [%08X] channel [%d].", buf, 0xEu);
            }
            for (uint64_t i = *v195; i; uint64_t i = *(void *)(i + 832))
            {
              __int16 v23 = gcks_log();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                int v24 = *(_DWORD *)(i + 88);
                int v26 = *(_DWORD *)(i + 60);
                int v25 = *(_DWORD *)(i + 64);
                uint64_t v27 = IPPORTToString();
                *(_DWORD *)v205 = 67109890;
                *(_DWORD *)v206 = v24;
                *(_WORD *)&v206[4] = 1024;
                *(_DWORD *)&v206[6] = v26;
                LOWORD(v207) = 1024;
                *(_DWORD *)((char *)&v207 + 2) = v25;
                HIWORD(v207) = 2080;
                *(void *)v208 = v27;
                _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Participant %08X: sentDD [%d], receivedDD [%d] address [%s].", v205, 0x1Eu);
              }
              for (uint64_t j = *(unsigned __int8 **)(i + 600); j; uint64_t j = (unsigned __int8 *)*((void *)j + 8))
              {
                uint64_t v29 = gcks_log();
                if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v30 = gckWaitForString(*j);
                  double v31 = *((double *)j + 1);
                  double v32 = *((double *)j + 2);
                  if (v31 == 0.0) {
                    double v33 = 0.0;
                  }
                  else {
                    double v33 = v10 - v31;
                  }
                  if (v32 == 0.0) {
                    double v34 = 0.0;
                  }
                  else {
                    double v34 = v32 - v10;
                  }
                  double v35 = *((double *)j + 4);
                  *(_DWORD *)v205 = 136315906;
                  *(void *)v206 = v30;
                  if (v35 == 0.0) {
                    double v36 = 0.0;
                  }
                  else {
                    double v36 = v35 - v10;
                  }
                  *(_WORD *)&v206[8] = 2048;
                  double v207 = v33;
                  *(_WORD *)v208 = 2048;
                  *(double *)&v208[2] = v34;
                  __int16 v209 = 2048;
                  double v210 = v36;
                  _os_log_impl(&dword_218756000, v29, OS_LOG_TYPE_DEFAULT, "    WaitFor [%s] timerAdd [%.1lf] nextFire [%.1lf] waitUntil [%.1lf].", v205, 0x2Au);
                }
              }
            }
          }
        }
        __int16 v37 = (void *)(v12 + 600);
        long long v38 = *(unsigned char **)(v12 + 600);
        v197 = (unsigned __int8 **)(v12 + 600);
        if (v38)
        {
          while (1)
          {
            if (*((double *)v38 + 2) != 0.0) {
              goto LABEL_73;
            }
            uint64_t v39 = *((void *)v38 + 5);
            if (v39) {
              break;
            }
            int v44 = *v38;
            if (v44 == 12) {
              goto LABEL_61;
            }
            if (v44 == 11)
            {
              int v45 = gckSessionPerformDTLSHandshake(v2, v12);
              int v5 = v45;
              if (*(_DWORD *)(v12 + 640) == 1) {
                goto LABEL_157;
              }
              if (v45 < 0)
              {
                *__int16 v37 = *((void *)v38 + 8);
                free(v38);
                v121 = gcks_log();
                if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_213;
                }
LABEL_162:
                int v131 = *(_DWORD *)(v12 + 88);
                int v132 = *(_DWORD *)(v12 + 72);
                *(_DWORD *)buf = 67109632;
                *(_DWORD *)v212 = v131;
                *(_WORD *)&v212[4] = 1024;
                *(_DWORD *)&v212[6] = v132;
                *(_WORD *)&v212[10] = 2048;
                *(void *)&v212[12] = v5;
                v118 = v121;
                v119 = "Perform DTLS Handshake for participant [%08X] on channel [%d] failed with hResult [%ld].";
                uint32_t v120 = 24;
                goto LABEL_212;
              }
              int v5 = 0;
LABEL_61:
              *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
              *((double *)v38 + 2) = v10 + *((double *)v38 + 1);
LABEL_73:
              int v44 = *v38;
            }
            int v54 = v44 - 1;
            if (v44 == 1 && !*((void *)v38 + 5) && v10 >= *((double *)v38 + 4))
            {
              double v55 = *(double *)(v12 + 16);
              double v56 = *(double *)(v12 + 352);
              if (v10 - v55 < v56)
              {
                *((void *)v38 + 1) = 0x3FB0A3D70A3D70A4;
                double v57 = v55 + v56;
                *((double *)v38 + 4) = v57;
                *((double *)v38 + 2) = v57;
              }
            }
            if (v10 >= *((double *)v38 + 4))
            {
              *__int16 v37 = *((void *)v38 + 8);
              v65 = (void *)*((void *)v38 + 5);
              if (v65) {
                free(v65);
              }
              free(v38);
              switch(v54)
              {
                case 0:
                  v66 = gcks_log();
                  if (!os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_223;
                  }
                  int v67 = *(_DWORD *)(v12 + 88);
                  int v68 = *(_DWORD *)(v12 + 72);
                  int v69 = *(_DWORD *)(v12 + 376);
                  v70 = "Created";
                  switch(v69)
                  {
                    case 0:
                      break;
                    case 1:
                      v70 = "ICE";
                      break;
                    case 2:
                      v70 = "Connecting";
                      break;
                    case 3:
                      v70 = "Connected";
                      break;
                    case 4:
                      v70 = "Disconnected";
                      break;
                    default:
                      if (v69 == 255) {
                        v70 = "Invalid";
                      }
                      else {
                        v70 = "?";
                      }
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v212 = v67;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v68;
                  *(_WORD *)&v212[10] = 2080;
                  *(void *)&v212[12] = v70;
                  v135 = v66;
                  v136 = "Hello timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_222;
                case 1:
                  v81 = gcks_log();
                  if (!os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_223;
                  }
                  int v82 = *(_DWORD *)(v12 + 88);
                  int v83 = *(_DWORD *)(v12 + 72);
                  int v84 = *(_DWORD *)(v12 + 376);
                  v85 = "Created";
                  switch(v84)
                  {
                    case 0:
                      break;
                    case 1:
                      v85 = "ICE";
                      break;
                    case 2:
                      v85 = "Connecting";
                      break;
                    case 3:
                      v85 = "Connected";
                      break;
                    case 4:
                      v85 = "Disconnected";
                      break;
                    default:
                      if (v84 == 255) {
                        v85 = "Invalid";
                      }
                      else {
                        v85 = "?";
                      }
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v212 = v82;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v83;
                  *(_WORD *)&v212[10] = 2080;
                  *(void *)&v212[12] = v85;
                  v135 = v81;
                  v136 = "DD timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_222;
                case 3:
                  v71 = gcks_log();
                  if (!os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_223;
                  }
                  int v72 = *(_DWORD *)(v12 + 88);
                  int v73 = *(_DWORD *)(v12 + 72);
                  int v74 = *(_DWORD *)(v12 + 376);
                  v75 = "Created";
                  switch(v74)
                  {
                    case 0:
                      break;
                    case 1:
                      v75 = "ICE";
                      break;
                    case 2:
                      v75 = "Connecting";
                      break;
                    case 3:
                      v75 = "Connected";
                      break;
                    case 4:
                      v75 = "Disconnected";
                      break;
                    default:
                      if (v74 == 255) {
                        v75 = "Invalid";
                      }
                      else {
                        v75 = "?";
                      }
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v212 = v72;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v73;
                  *(_WORD *)&v212[10] = 2080;
                  *(void *)&v212[12] = v75;
                  v135 = v71;
                  v136 = "LSAACK timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_222;
                case 7:
                  v91 = gcks_log();
                  if (!os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_223;
                  }
                  int v92 = *(_DWORD *)(v12 + 88);
                  int v93 = *(_DWORD *)(v12 + 72);
                  int v94 = *(_DWORD *)(v12 + 376);
                  v95 = "Created";
                  switch(v94)
                  {
                    case 0:
                      break;
                    case 1:
                      v95 = "ICE";
                      break;
                    case 2:
                      v95 = "Connecting";
                      break;
                    case 3:
                      v95 = "Connected";
                      break;
                    case 4:
                      v95 = "Disconnected";
                      break;
                    default:
                      if (v94 == 255) {
                        v95 = "Invalid";
                      }
                      else {
                        v95 = "?";
                      }
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v212 = v92;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v93;
                  *(_WORD *)&v212[10] = 2080;
                  *(void *)&v212[12] = v95;
                  v135 = v91;
                  v136 = "Heartbeat timeout expired for participant [%08X] on channel [%d] state [%s].";
                  goto LABEL_222;
                case 10:
                  v96 = gcks_log();
                  if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
                  {
                    int v97 = *(_DWORD *)(v12 + 88);
                    int v98 = *(_DWORD *)(v12 + 72);
                    int v99 = *(_DWORD *)(v12 + 640);
                    v100 = "?";
                    if (!v99) {
                      v100 = "DTLSNotConnected";
                    }
                    BOOL v150 = v99 == 1;
                    v101 = "DTLSConnected";
                    if (!v150) {
                      v101 = v100;
                    }
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v212 = v97;
                    *(_WORD *)&v212[4] = 1024;
                    *(_DWORD *)&v212[6] = v98;
                    *(_WORD *)&v212[10] = 2080;
                    *(void *)&v212[12] = v101;
                    _os_log_impl(&dword_218756000, v96, OS_LOG_TYPE_DEFAULT, "DTLS Handshake timeout expired for participant [%08X] on channel [%d] DTLS state [%s].", buf, 0x18u);
                  }
                  int v102 = *(_DWORD *)(v12 + 640);
                  v103 = gcks_log();
                  v104 = v103;
                  if (v102 == 1)
                  {
                    if (!os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT)) {
                      goto LABEL_224;
                    }
                    goto LABEL_209;
                  }
                  if (!os_log_type_enabled(v103, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_213;
                  }
                  goto LABEL_211;
                case 11:
                  v76 = gcks_log();
                  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
                  {
                    int v77 = *(_DWORD *)(v12 + 88);
                    int v78 = *(_DWORD *)(v12 + 72);
                    int v79 = *(_DWORD *)(v12 + 376);
                    v80 = "Created";
                    switch(v79)
                    {
                      case 0:
                        break;
                      case 1:
                        v80 = "ICE";
                        break;
                      case 2:
                        v80 = "Connecting";
                        break;
                      case 3:
                        v80 = "Connected";
                        break;
                      case 4:
                        v80 = "Disconnected";
                        break;
                      default:
                        if (v79 == 255) {
                          v80 = "Invalid";
                        }
                        else {
                          v80 = "?";
                        }
                        break;
                    }
                    *(_DWORD *)buf = 67109634;
                    *(_DWORD *)v212 = v77;
                    *(_WORD *)&v212[4] = 1024;
                    *(_DWORD *)&v212[6] = v78;
                    *(_WORD *)&v212[10] = 2080;
                    *(void *)&v212[12] = v80;
                    _os_log_impl(&dword_218756000, v76, OS_LOG_TYPE_DEFAULT, "ICE timeout expired for participant [%08X] on channel [%d] state [%s].", buf, 0x18u);
                  }
                  int v137 = *(_DWORD *)(v12 + 376);
                  v138 = gcks_log();
                  v104 = v138;
                  if (v137 == 3)
                  {
                    if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                    {
LABEL_209:
                      int v139 = *(_DWORD *)(v12 + 88);
                      int v140 = *(_DWORD *)(v12 + 72);
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)v212 = v139;
                      *(_WORD *)&v212[4] = 1024;
                      *(_DWORD *)&v212[6] = v140;
                      _os_log_impl(&dword_218756000, v104, OS_LOG_TYPE_DEFAULT, "Participant [%08X] on channel [%d] already connected, ignore this timeout.", buf, 0xEu);
                    }
                    goto LABEL_224;
                  }
                  if (!os_log_type_enabled(v138, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_213;
                  }
LABEL_211:
                  int v141 = *(_DWORD *)(v12 + 88);
                  int v142 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109376;
                  *(_DWORD *)v212 = v141;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v142;
                  v118 = v104;
                  v119 = "Not in connected state, so giving up for participant [%08X] on channel [%d].";
                  uint32_t v120 = 14;
                  break;
                default:
                  v86 = gcks_log();
                  if (!os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_223;
                  }
                  int v87 = *(_DWORD *)(v12 + 88);
                  int v88 = *(_DWORD *)(v12 + 72);
                  int v89 = *(_DWORD *)(v12 + 376);
                  v90 = "Created";
                  switch(v89)
                  {
                    case 0:
                      break;
                    case 1:
                      v90 = "ICE";
                      break;
                    case 2:
                      v90 = "Connecting";
                      break;
                    case 3:
                      v90 = "Connected";
                      break;
                    case 4:
                      v90 = "Disconnected";
                      break;
                    default:
                      if (v89 == 255) {
                        v90 = "Invalid";
                      }
                      else {
                        v90 = "?";
                      }
                      break;
                  }
                  *(_DWORD *)buf = 67109634;
                  *(_DWORD *)v212 = v87;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v88;
                  *(_WORD *)&v212[10] = 2080;
                  *(void *)&v212[12] = v90;
                  v135 = v86;
                  v136 = "Unknown timeout expired for participant [%08X] on channel [%d] state [%s].";
LABEL_222:
                  _os_log_impl(&dword_218756000, v135, OS_LOG_TYPE_DEFAULT, v136, buf, 0x18u);
                  goto LABEL_223;
              }
LABEL_212:
              _os_log_error_impl(&dword_218756000, v118, OS_LOG_TYPE_ERROR, v119, buf, v120);
LABEL_213:
              gckSessionChangeStateCList(v2, v12);
              goto LABEL_224;
            }
            double v58 = *((double *)v38 + 2);
            if (v10 >= v58 && *((void *)v38 + 5))
            {
              switch(v44)
              {
                case 1:
                  v59 = gcks_log();
                  if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_137;
                  }
                  int v60 = *((unsigned __int16 *)v38 + 28);
                  int v61 = *(_DWORD *)(v12 + 88);
                  int v62 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v212 = v60;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v61;
                  *(_WORD *)&v212[10] = 1024;
                  *(_DWORD *)&v212[12] = v62;
                  v63 = v59;
                  v64 = "Retransmitting Hello with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 2:
                  v109 = gcks_log();
                  if (!os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_137;
                  }
                  int v110 = *((unsigned __int16 *)v38 + 28);
                  int v111 = *(_DWORD *)(v12 + 88);
                  int v112 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v212 = v110;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v111;
                  *(_WORD *)&v212[10] = 1024;
                  *(_DWORD *)&v212[12] = v112;
                  v63 = v109;
                  v64 = "Retransmitting DD with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 4:
                  v105 = gcks_log();
                  if (!os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_137;
                  }
                  int v106 = *((unsigned __int16 *)v38 + 28);
                  int v107 = *(_DWORD *)(v12 + 88);
                  int v108 = *(_DWORD *)(v12 + 72);
                  *(_DWORD *)buf = 67109632;
                  *(_DWORD *)v212 = v106;
                  *(_WORD *)&v212[4] = 1024;
                  *(_DWORD *)&v212[6] = v107;
                  *(_WORD *)&v212[10] = 1024;
                  *(_DWORD *)&v212[12] = v108;
                  v63 = v105;
                  v64 = "Retransmitting LSA with SN [%d] to participant [%08X] over channel [%d].";
                  goto LABEL_136;
                case 8:
                  double v113 = *(double *)(v12 + 360);
                  double v114 = *(double *)(v12 + 48) + v113 * 0.5;
                  if (v114 >= *(double *)(v12 + 16) + v113 * 0.5) {
                    double v114 = *(double *)(v12 + 16) + v113 * 0.5;
                  }
                  *((double *)v38 + 2) = v114;
                  *((double *)v38 + 4) = v114 + v113 * 0.5;
                  v115 = gcks_log();
                  if (os_log_type_enabled(v115, OS_LOG_TYPE_DEBUG))
                  {
                    int v143 = *(_DWORD *)(v12 + 88);
                    uint64_t v144 = *((void *)v38 + 2);
                    uint64_t v145 = *((void *)v38 + 4);
                    *(_DWORD *)buf = 67109888;
                    *(_DWORD *)v212 = v143;
                    *(_WORD *)&v212[4] = 2048;
                    *(double *)&v212[6] = v10;
                    *(_WORD *)&v212[14] = 2048;
                    *(void *)&v212[16] = v144;
                    *(_WORD *)&v212[24] = 2048;
                    uint64_t v213 = v145;
                    _os_log_debug_impl(&dword_218756000, v115, OS_LOG_TYPE_DEBUG, "Heartbeat state for [%08X]: Now [%.3lf] NextFire [%.3lf] WaitUntil [%.3lf].", buf, 0x26u);
                  }
                  double v116 = *((double *)v38 + 2);
                  if (v10 < v116)
                  {
                    __int16 v37 = v38 + 64;
                    if (v15 > v116) {
                      double v15 = *((double *)v38 + 2);
                    }
                    goto LABEL_224;
                  }
                  v122 = gcks_log();
                  if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                  {
                    int v123 = *((unsigned __int16 *)v38 + 28);
                    int v124 = *(_DWORD *)(v12 + 88);
                    int v125 = *(_DWORD *)(v12 + 72);
                    *(_DWORD *)buf = 67109632;
                    *(_DWORD *)v212 = v123;
                    *(_WORD *)&v212[4] = 1024;
                    *(_DWORD *)&v212[6] = v124;
                    *(_WORD *)&v212[10] = 1024;
                    *(_DWORD *)&v212[12] = v125;
                    v63 = v122;
                    v64 = "Retransmitting Heartbeat with SN [%d] to participant [%08X] over channel [%d].";
LABEL_136:
                    _os_log_impl(&dword_218756000, v63, OS_LOG_TYPE_DEFAULT, v64, buf, 0x14u);
                  }
LABEL_137:
                  int v126 = SendUDPPacketCList(v12, *((void *)v38 + 5), *((_DWORD *)v38 + 12), 0, 1);
                  int v5 = v126;
                  if ((v126 & 0x80000000) == 0)
                  {
                    int v127 = *v38;
LABEL_139:
                    if (v127 == 1 && *((_DWORD *)v38 + 6))
                    {
                      double v58 = v13 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
                      *((double *)v38 + 2) = v58;
                      --*((_DWORD *)v38 + 6);
                    }
                    else
                    {
                      *((_DWORD *)v38 + 6) = 0;
                      double v128 = v10 + *((double *)v38 + 1);
                      double v58 = v128 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
                      double v129 = *((double *)v38 + 1) + *((double *)v38 + 1);
                      *((double *)v38 + 1) = v129;
                      *((double *)v38 + 2) = v58;
                      if (v129 > 1.0)
                      {
                        *((double *)v38 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
                        double v58 = *((double *)v38 + 2);
                      }
                    }
                    goto LABEL_149;
                  }
                  if (v126 == -1072037876 || v126 == -1072037833)
                  {
                    int v127 = *v38;
                    if (v126 == -1072037876 && v127 != 8)
                    {
                      *((double *)v38 + 4) = v10 + *((double *)v38 + 4) - *((double *)v38 + 2) + 0.5;
                      double v58 = v10 + 0.5;
                      *((double *)v38 + 2) = v198;
                      int v5 = -1072037876;
                      goto LABEL_149;
                    }
                    goto LABEL_139;
                  }
                  int v127 = *v38;
                  if ((v127 == 8 || v127 == 1) && *(_DWORD *)(v12 + 80))
                  {
                    *(_DWORD *)(v12 + 80) = -1;
                    goto LABEL_139;
                  }
                  *__int16 v37 = *((void *)v38 + 8);
                  v133 = (void *)*((void *)v38 + 5);
                  if (v133) {
                    free(v133);
                  }
                  free(v38);
                  if (v127 == 8)
                  {
LABEL_223:
                    attempt_failover(v2, (_DWORD *)v12);
                    goto LABEL_224;
                  }
                  v134 = gcks_log();
                  if (!os_log_type_enabled(v134, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_213;
                  }
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)v212 = v5;
                  v118 = v134;
                  v119 = "SendUDPPacketCList failed with error (%X).";
                  break;
                default:
                  goto LABEL_137;
              }
              goto LABEL_131;
            }
LABEL_149:
            if (v10 < v58 || *v38 != 11) {
              goto LABEL_154;
            }
            int v130 = gckSessionPerformDTLSHandshake(v2, v12);
            int v5 = v130;
            if (*(_DWORD *)(v12 + 640) != 1)
            {
              if (v130 < 0)
              {
                *__int16 v37 = *((void *)v38 + 8);
                free(v38);
                v121 = gcks_log();
                if (!os_log_type_enabled(v121, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_213;
                }
                goto LABEL_162;
              }
              int v5 = 0;
              double v58 = v10 + *((double *)v38 + 1);
              *((double *)v38 + 2) = v58;
LABEL_154:
              if (v10 < v58 || *v38 != 12) {
                goto LABEL_159;
              }
              if (*(_DWORD *)(v12 + 376) != 3)
              {
                double v58 = v10 + *((double *)v38 + 1);
                *((double *)v38 + 2) = v58;
LABEL_159:
                __int16 v37 = v38 + 64;
                if (v15 > v58) {
                  double v15 = v58;
                }
                goto LABEL_224;
              }
            }
LABEL_157:
            *__int16 v37 = *((void *)v38 + 8);
            free(v38);
LABEL_224:
            long long v38 = (unsigned char *)*v37;
            if (!*v37) {
              goto LABEL_225;
            }
          }
          int v5 = SendUDPPacketCList(v12, v39, *((_DWORD *)v38 + 12), 0, 1);
          uint64_t v40 = gcks_log();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v41 = gckWaitForString(*v38);
            int v42 = *(_DWORD *)(v12 + 88);
            int v43 = *(_DWORD *)(v12 + 72);
            *(_DWORD *)buf = 136315906;
            *(void *)v212 = v41;
            *(_WORD *)&v212[8] = 1024;
            *(_DWORD *)&v212[10] = v42;
            *(_WORD *)&v212[14] = 1024;
            *(_DWORD *)&v212[16] = v43;
            *(_WORD *)&v212[20] = 1024;
            *(_DWORD *)&v212[22] = v5;
            _os_log_impl(&dword_218756000, v40, OS_LOG_TYPE_DEFAULT, "Sent %s packet to participant %08X on channel %d with error %d.", buf, 0x1Eu);
          }
          if (v5 < 0)
          {
            if (v5 == -1072037876)
            {
              *((double *)v38 + 4) = v10 + *((double *)v38 + 4) - *((double *)v38 + 2) + 0.5;
              *((double *)v38 + 2) = v198;
              int v5 = -1072037876;
              goto LABEL_73;
            }
            if (v5 != -1072037833)
            {
              int v49 = *v38;
              if (v49 != 8 && v49 != 1 || !*(_DWORD *)(v12 + 80))
              {
                *__int16 v37 = *((void *)v38 + 8);
                free(*((void **)v38 + 5));
                free(v38);
                v117 = gcks_log();
                if (!os_log_type_enabled(v117, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_213;
                }
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)v212 = v5;
                v118 = v117;
                v119 = "Send UDP packet failed with error (%X).";
LABEL_131:
                uint32_t v120 = 8;
                goto LABEL_212;
              }
              int v50 = gcks_log();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v51 = gckWaitForString(*v38);
                int v52 = *(_DWORD *)(v12 + 88);
                int v53 = *(_DWORD *)(v12 + 72);
                *(_DWORD *)buf = 136315650;
                *(void *)v212 = v51;
                *(_WORD *)&v212[8] = 1024;
                *(_DWORD *)&v212[10] = v52;
                *(_WORD *)&v212[14] = 1024;
                *(_DWORD *)&v212[16] = v53;
                _os_log_impl(&dword_218756000, v50, OS_LOG_TYPE_DEFAULT, "Failed to send %s packet to participant %08X. Will mark channel %d as invalid.", buf, 0x18u);
              }
              *(_DWORD *)(v12 + 80) = -1;
            }
          }
          if (*v38 == 1 && *((_DWORD *)v38 + 6))
          {
            *((double *)v38 + 2) = v13 + (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.005;
            *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
            --*((_DWORD *)v38 + 6);
          }
          else
          {
            *((_DWORD *)v38 + 6) = 0;
            double v46 = v10 + *((double *)v38 + 1);
            uint32_t v47 = arc4random();
            *((double *)v38 + 4) = v10 + *((double *)v38 + 4);
            double v48 = *((double *)v38 + 1) + *((double *)v38 + 1);
            *((double *)v38 + 1) = v48;
            *((double *)v38 + 2) = v46 + (double)(v47 & 0x7FFFFFFF) * 4.65661287e-10 * 0.02;
            if (v48 > 1.0) {
              *((double *)v38 + 1) = (double)(arc4random() & 0x7FFFFFFF) * 4.65661287e-10 * 0.02 + 1.0;
            }
          }
          goto LABEL_73;
        }
LABEL_225:
        double v146 = *(double *)(v12 + 8);
        if (*(_DWORD *)(v12 + 56) && v146 == 0.0)
        {
          v147 = *v197;
          if (!*v197)
          {
LABEL_239:
            *(void *)(v12 + 600) = 0;
            pthread_mutex_unlock(v200);
            goto LABEL_240;
          }
          v148 = *v197;
          while (1)
          {
            int v149 = *v148;
            BOOL v150 = v149 == 8 || v149 == 1;
            if (!v150) {
              break;
            }
            v148 = (unsigned __int8 *)*((void *)v148 + 8);
            if (!v148)
            {
              if (v147)
              {
                do
                {
                  v151 = (unsigned __int8 *)*((void *)v147 + 8);
                  v152 = (void *)*((void *)v147 + 5);
                  if (v152) {
                    free(v152);
                  }
                  free(v147);
                  v147 = v151;
                }
                while (v151);
              }
              goto LABEL_239;
            }
          }
        }
        if (v146 == 0.0 || v146 > micro())
        {
          pthread_mutex_unlock(v200);
          if (*(_DWORD *)(v12 + 376) == 4)
          {
            v153 = gcks_log();
            if (os_log_type_enabled(v153, OS_LOG_TYPE_DEFAULT))
            {
              int v154 = *(_DWORD *)v12;
              int v155 = *(_DWORD *)(v12 + 72);
              int v156 = *(_DWORD *)(v12 + 88);
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)v212 = v154;
              *(_WORD *)&v212[4] = 1024;
              *(_DWORD *)&v212[6] = v155;
              *(_WORD *)&v212[10] = 1024;
              *(_DWORD *)&v212[12] = v156;
              _os_log_impl(&dword_218756000, v153, OS_LOG_TYPE_DEFAULT, "Don't read from socket %d channel %d for disconnected participant %08X.", buf, 0x14u);
            }
          }
          else
          {
            int v157 = *(_DWORD *)v12;
            if (__darwin_check_fd_set_overflow(*(_DWORD *)v12, &v204, 0)) {
              *(__int32_t *)((char *)v204.fds_bits + (((unint64_t)v157 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << v157;
            }
          }
          uint64_t v14 = (uint64_t *)(v12 + 832);
          int v158 = v196;
          if (*(_DWORD *)v12 > v196) {
            int v158 = *(_DWORD *)v12;
          }
          int v196 = v158;
          goto LABEL_251;
        }
        pthread_mutex_unlock(v200);
        v159 = gcks_log();
        if (os_log_type_enabled(v159, OS_LOG_TYPE_DEFAULT))
        {
          int v160 = *(_DWORD *)(v12 + 88);
          int v161 = *(_DWORD *)(v12 + 72);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)v212 = v160;
          *(_WORD *)&v212[4] = 1024;
          *(_DWORD *)&v212[6] = v161;
          _os_log_impl(&dword_218756000, v159, OS_LOG_TYPE_DEFAULT, "Closing connection to participant [%08X] on channel [%d].", buf, 0xEu);
        }
LABEL_240:
        uint64_t v14 = v199;
        uint64_t *v199 = *(void *)(v12 + 832);
        gckSessionFreeCList(v12);
LABEL_251:
        uint64_t v12 = *v14;
        if (!*v14) {
          goto LABEL_256;
        }
      }
    }
    double v15 = v193;
LABEL_256:
    pthread_rwlock_unlock(v194);
    double v164 = v15 - v10;
    if (v164 > 0.0)
    {
      dispatch_time_t v165 = dispatch_time(0, (uint64_t)(v164 * 1000000000.0));
      dispatch_source_set_timer(source, v165, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(v164 / 10.0 * 1000000000.0));
      dispatch_resume(source);
      v203.tv_sec = (int)v164;
      v203.tv_usec = (int)((v164 - (double)(int)v164) * 1000000.0);
      int v166 = select(v196 + 1, &v204, 0, 0, &v203);
      dispatch_suspend(source);
      double v167 = micro();
      if (v166 == -1)
      {
        if (*__error() != 9)
        {
          int v5 = *__error() | 0xC01A0000;
          v185 = gcks_log();
          if (os_log_type_enabled(v185, OS_LOG_TYPE_ERROR)) {
            gckSessionRecvProc_cold_3();
          }
          goto LABEL_294;
        }
      }
      else
      {
        double v168 = v167;
        if (v166) {
          gettimeofday(&v202, 0);
        }
        if (v168 > v15) {
          double v193 = micro() + 30.0;
        }
        if (v166)
        {
          unint64_t v169 = *(int *)(v2 + 16);
          if (v169 != -1)
          {
            if (__darwin_check_fd_set_overflow(*(_DWORD *)(v2 + 16), &v204, 0))
            {
              if ((*(unsigned int *)((char *)v204.fds_bits + ((v169 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v169))
              {
                close(*(_DWORD *)(v2 + 16));
                *(_DWORD *)(v2 + 16) = -1;
                v170 = gcks_log();
                if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_218756000, v170, OS_LOG_TYPE_DEFAULT, "Read condition for pGCKSession->sReset.", buf, 2u);
                }
              }
            }
          }
          pthread_rwlock_rdlock(v194);
          for (uint64_t k = *v195; k; uint64_t k = *(void *)(k + 832))
          {
            int v172 = *(_DWORD *)k;
            if (__darwin_check_fd_set_overflow(*(_DWORD *)k, &v204, 0)
              && ((*(unsigned int *)((char *)v204.fds_bits + (((unint64_t)v172 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v172) & 1) != 0)
            {
              v203.tv_sec = 0;
              v203.tv_usec = 0;
              do
              {
                int v173 = *(_DWORD *)k;
                if (!__darwin_check_fd_set_overflow(*(_DWORD *)k, &v204, 0)
                  || ((*(unsigned int *)((char *)v204.fds_bits + (((unint64_t)v173 >> 3) & 0x1FFFFFFFFFFFFFFCLL)) >> v173) & 1) == 0)
                {
                  break;
                }
                micro();
                int v174 = gckSessionRecvMessage(v2, k);
                if (v174 < 0 && (v174 == -1072037831 || v174 == -2145779679))
                {
                  v175 = gcks_log();
                  if (os_log_type_enabled(v175, OS_LOG_TYPE_DEFAULT))
                  {
                    int v176 = *(_DWORD *)k;
                    *(_DWORD *)buf = 67109120;
                    *(_DWORD *)v212 = v176;
                    _os_log_impl(&dword_218756000, v175, OS_LOG_TYPE_DEFAULT, "Socket %d is no longer connected.", buf, 8u);
                  }
                  pthread_mutex_lock((pthread_mutex_t *)(k + 768));
                  gckSessionChangeStateCList(v2, k);
                  pthread_mutex_unlock((pthread_mutex_t *)(k + 768));
                  break;
                }
              }
              while (select(v196 + 1, &v204, 0, 0, &v203) > 0);
            }
          }
LABEL_261:
          pthread_rwlock_unlock(v194);
        }
      }
    }
  }
  int v5 = *__error() | 0xC01A0000;
  v188 = gcks_log();
  v187 = source;
  if (os_log_type_enabled(v188, OS_LOG_TYPE_ERROR)) {
    gckSessionRecvProc_cold_2();
  }
  pthread_rwlock_unlock(v194);
LABEL_298:
  v189 = gcks_log();
  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v212 = v5;
    _os_log_impl(&dword_218756000, v189, OS_LOG_TYPE_DEFAULT, "RecvProc thread end (%X).", buf, 8u);
  }
  *(_DWORD *)(v2 + 7512) = 1;
  dispatch_resume(v187);
  dispatch_source_cancel(v187);
  dispatch_release(v187);
  CheckOutHandleDebug();
  return v5;
}

uint64_t gckSessionSendProc()
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  pthread_setname_np("com.apple.multipeerconnectivity.gcksession.sendproc");
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return -2145779710;
  }
  uint64_t v1 = v0;
  v12.tv_sec = 0;
  *(void *)&v12.tv_usec = 0;
  while (!*(_DWORD *)(v1 + 4))
  {
    uint64_t v2 = *(void *)(v1 + 408);
    if (v2 && *(void *)(v2 + 24))
    {
      pthread_mutex_lock((pthread_mutex_t *)(v1 + 7080));
      uint64_t v3 = *(void *)(v1 + 408);
      int v4 = *(_DWORD *)(v3 + 168);
      if (v4 < 1)
      {
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7080));
      }
      else
      {
        int v5 = 0;
        do
        {
          if (v4 <= 0x10)
          {
            *(_DWORD *)&buf[4 * v5++] = *(_DWORD *)(v3 + 4 * (v4 - 1) + 172);
            int v4 = *(_DWORD *)(v3 + 168);
          }
          BOOL v6 = __OFSUB__(v4--, 1);
          *(_DWORD *)(v3 + 168) = v4;
        }
        while (!((v4 < 0) ^ v6 | (v4 == 0)));
        pthread_mutex_unlock((pthread_mutex_t *)(v1 + 7080));
        if (v5 >= 1)
        {
          uint64_t v7 = v5;
          double v8 = buf;
          do
          {
            HIDWORD(v11) = 1;
            BYTE2(v11) = 0;
            LOWORD(v11) = 0;
            (*(void (**)(void, uint8_t *, uint64_t, void, void, void, void, void, uint64_t))(*(void *)(v1 + 408) + 24))(*(void *)(*(void *)(v1 + 408) + 32), v8, 0xFFFFFFFFLL, 0, 0, 0, 0, 0, v11);
            v8 += 4;
            --v7;
          }
          while (v7);
        }
      }
      HIDWORD(v11) = 1;
      BYTE2(v11) = 0;
      LOWORD(v11) = 0;
      (*(void (**)(void, void, void, void, void, void, void, void, uint64_t))(*(void *)(v1 + 408) + 24))(*(void *)(*(void *)(v1 + 408) + 32), 0, 0, 0, 0, 0, 0, 0, v11);
    }
    v12.tv_sec = 0;
    v12.tv_usec = 25000;
    select(0, 0, 0, 0, &v12);
  }
  int v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v14 = 0;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "SendProc thread end (%X).", buf, 8u);
  }
  *(_DWORD *)(v1 + 7516) = 1;
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionDisposeAllConnections(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  double v13 = (pthread_rwlock_t *)(a1 + 7192);
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1 + 7192));
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  uint64_t v2 = *(unsigned int *)(a1 + 708);
  if ((int)v2 >= 1)
  {
    uint64_t v3 = 0;
    uint64_t v4 = a1 + 712;
    do
    {
      int v5 = gcks_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = *(_DWORD *)(v4 + 8 * v3);
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v6;
        _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Disposing connection to participant %08X. Stop ICE check.", buf, 8u);
      }
      ICEStopConnectivityCheck();
      int v7 = *(_DWORD *)(v4 + 8 * v3);
      uint64_t v8 = *(unsigned int *)(a1 + 420);
      int v9 = (_DWORD *)(a1 + 424);
      if ((int)v8 < 1)
      {
LABEL_8:
        gckSessionDisconnectParticipant(a1, v7, 0, 0, 1);
      }
      else
      {
        while (*v9 != v7)
        {
          v9 += 104;
          if (!--v8) {
            goto LABEL_8;
          }
        }
      }
      ++v3;
    }
    while (v3 != v2);
  }
  if (v2) {
    gckSessionCancelRecvUDPInternal(a1);
  }
  memcpy(buf, (const void *)(a1 + 424), sizeof(buf));
  *(_DWORD *)&buf[284] = 0;
  gckSessionRequestLSAUpdateForNode((int *)buf);
  gckSessionSendLSA(a1, 1u, (uint64_t)buf, -1, 1);
  while (1)
  {
    int v11 = *(_DWORD *)(a1 + 708);
    if (!v11) {
      break;
    }
    gckSessionDeleteNeighbor(a1, (int *)(a1 + 8 * v11 + 704));
  }
  *(_WORD *)(a1 + 696) = *(_WORD *)&buf[272];
  gckSessionUpdateRoutingTable(a1, v10);
  gckSessionHandleRemainingDisconnectedNodes(a1, 1);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  return pthread_rwlock_unlock(v13);
}

void gckSessionFreeCList(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 88);
    int v4 = *(_DWORD *)(a1 + 72);
    v12[0] = 67109376;
    v12[1] = v3;
    __int16 v13 = 1024;
    int v14 = v4;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Closing clist for participant [%08X] channel [%d].", (uint8_t *)v12, 0xEu);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 768));
  int v5 = *(SSLContext **)(a1 + 632);
  if (v5)
  {
    SSLClose(v5);
    CFRelease(*(CFTypeRef *)(a1 + 632));
    *(void *)(a1 + 632) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 768));
  int v6 = *(const void **)(a1 + 648);
  if (v6)
  {
    _Block_release(v6);
    *(void *)(a1 + 648) = 0;
  }
  int v7 = *(void **)(a1 + 656);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[525];
      free(v7);
      int v7 = v8;
    }
    while (v8);
  }
  int v9 = *(void **)(a1 + 600);
  if (v9)
  {
    do
    {
      uint64_t v10 = (void *)v9[8];
      int v11 = (void *)v9[5];
      if (v11) {
        free(v11);
      }
      free(v9);
      int v9 = v10;
    }
    while (v10);
  }
  close(*(_DWORD *)a1);
  pthread_mutex_destroy((pthread_mutex_t *)(a1 + 768));
  free(*(void **)(a1 + 688));
  free((void *)a1);
}

uint64_t GCKSessionPrepareConnection(uint64_t a1, int a2)
{
  uint64_t v129 = *MEMORY[0x263EF8340];
  uint64_t v3 = 2149187606;
  uint64_t v4 = CheckInHandleDebug();
  if (!v4) {
    return 2149187586;
  }
  uint64_t v5 = v4;
  uint64_t v105 = 0;
  *(_DWORD *)(v4 + 64) = 0;
  double v6 = micro();
  int v7 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 0x40000000;
  aBlock[2] = __GCKSessionPrepareConnection_block_invoke;
  aBlock[3] = &__block_descriptor_tmp;
  aBlock[4] = v7;
  uint64_t v8 = _Block_copy(aBlock);
  pthread_mutex_lock((pthread_mutex_t *)(v5 + 80));
  uint64_t v9 = 0;
  uint64_t v10 = (void *)(v5 + 152);
  int v11 = 16;
  do
  {
    if (*((_DWORD *)v10 - 2) == a2 && *v10)
    {
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 80));
      dispatch_release(v7);
      timeval v12 = gcks_log();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_132;
      }
      *(_DWORD *)&buf[0].sa_len = 67109120;
      *(_DWORD *)&buf[0].sa_data[2] = a2;
      __int16 v13 = "Another PrepareConnection is already waiting for participant [%08X], bailing.";
      goto LABEL_16;
    }
    if (v11 == 16)
    {
      if (*v10) {
        int v11 = 16;
      }
      else {
        int v11 = v9;
      }
    }
    v10 += 2;
    ++v9;
  }
  while (v9 != 16);
  if (v11 == 16)
  {
    pthread_mutex_unlock((pthread_mutex_t *)(v5 + 80));
    dispatch_release(v7);
    timeval v12 = gcks_log();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_132;
    }
    *(_DWORD *)&buf[0].sa_len = 67109120;
    *(_DWORD *)&buf[0].sa_data[2] = a2;
    __int16 v13 = "No empty signal block slot for participant [%08X].";
LABEL_16:
    _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, v13, &buf[0].sa_len, 8u);
    goto LABEL_132;
  }
  int v14 = gcks_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = a2;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = v11;
    _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Insert signal block for participant [%08X] at slot %d.", &buf[0].sa_len, 0xEu);
  }
  uint64_t v15 = v5 + 16 * v11;
  *(_DWORD *)(v15 + 144) = a2;
  *(void *)(v15 + 152) = v8;
  pthread_mutex_unlock((pthread_mutex_t *)(v5 + 80));
  if (ICEStopConnectivityCheck() == -2146107370)
  {
    gckCallICEListRemoveSignalBlock(v5, a2);
    uint64_t v16 = 0;
  }
  else
  {
    gckSessionCancelRecvUDPInternal(v5);
    pthread_rwlock_wrlock((pthread_rwlock_t *)(v5 + 7192));
    uint64_t v17 = *(void *)(v5 + 7184);
    if (v17)
    {
      unsigned int v18 = (uint64_t *)(v5 + 7184);
      do
      {
        if (*(_DWORD *)(v17 + 88) == a2)
        {
          *unsigned int v18 = *(void *)(v17 + 832);
          gckSessionFreeCList(v17);
        }
        else
        {
          unsigned int v18 = (uint64_t *)(v17 + 832);
        }
        uint64_t v17 = *v18;
      }
      while (*v18);
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v5 + 7192));
    global_queue = dispatch_get_global_queue(2, 0);
    uint64_t v20 = dispatch_source_create(MEMORY[0x263EF8400], 0, 1uLL, global_queue);
    uint64_t v16 = v20;
    if (v20)
    {
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 0x40000000;
      handler[2] = __GCKSessionPrepareConnection_block_invoke_11;
      handler[3] = &__block_descriptor_tmp_12;
      int v103 = a2;
      handler[4] = v5;
      dispatch_source_set_event_handler(v20, handler);
      dispatch_time_t v21 = dispatch_time(0, 10000000000);
      dispatch_source_set_timer(v16, v21, 0xFFFFFFFFFFFFFFFFLL, 0);
      dispatch_resume(v16);
    }
  }
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v7);
  if (v16)
  {
    dispatch_source_cancel(v16);
    dispatch_release(v16);
  }
  double v22 = micro();
  __int16 v23 = gcks_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 134218240;
    *(double *)&buf[0].sa_data[2] = v22 - v6;
    *(_WORD *)&buf[0].sa_data[10] = 1024;
    *(_DWORD *)&buf[0].sa_data[12] = a2;
    _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "ICE StopConnectivityCheck took (%0.6f seconds) for participant [%08X].", &buf[0].sa_len, 0x12u);
  }
  int LocalInterfaceListWithOptions = GetLocalInterfaceListWithOptions();
  if (!LocalInterfaceListWithOptions)
  {
    FreeLocalInterfaceList();
    int v84 = gcks_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_ERROR)) {
      GCKSessionPrepareConnection_cold_1(v84, v85, v86, v87, v88, v89, v90, v91);
    }
    goto LABEL_132;
  }
  int v25 = LocalInterfaceListWithOptions;
  int v26 = gcks_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = v25;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = a2;
    _os_log_impl(&dword_218756000, v26, OS_LOG_TYPE_DEFAULT, "%d interfaces found for participant [%08X].", &buf[0].sa_len, 0xEu);
  }
  if (v25 < 1)
  {
    int v99 = 0;
    goto LABEL_125;
  }
  uint64_t v27 = 0;
  int v98 = 0;
  int v99 = 0;
  int v97 = (pthread_rwlock_t *)(v5 + 7192);
  v96 = (int **)(v5 + 7184);
  uint64_t v28 = v25;
  uint64_t v100 = v5;
  uint64_t v101 = v25;
  do
  {
    if ((*(unsigned char *)(v105 + 40 * v27 + 1) & 1) != 0 && *(_DWORD *)(v5 + 7536))
    {
      uint64_t v29 = gcks_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v30 = IPPORTToString();
        *(_DWORD *)int v127 = 136315138;
        uint64_t v128 = v30;
        _os_log_impl(&dword_218756000, v29, OS_LOG_TYPE_DEFAULT, "AWDL is disabled. Will not create socket for %s.", v127, 0xCu);
      }
      goto LABEL_61;
    }
    unsigned int v31 = if_nametoindex((const char *)(v105 + 40 * v27 + 4));
    uint64_t v32 = v105;
    int v33 = *(_DWORD *)(v5 + 400);
    uint64_t v126 = 0;
    socklen_t v113 = 0;
    memset(&v112, 0, sizeof(v112));
    int v111 = 0;
    memset(buf, 0, sizeof(buf));
    double v34 = (int *)malloc_type_calloc(1uLL, 0x348uLL, 0x10B0040FFDF9BCEuLL);
    if (!v34)
    {
      int v43 = gcks_log();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR)) {
        GCKSessionPrepareConnection_cold_3(v123, v124, v43);
      }
      goto LABEL_61;
    }
    double v35 = v34;
    double v36 = (long long *)(v32 + 40 * v27);
    v34[22] = a2;
    v34[18] = v33;
    *((void *)v34 + 10) = -1;
    v34[94] = 0;
    long long v37 = *v36;
    long long v38 = v36[1];
    *((void *)v34 + 52) = *((void *)v36 + 4);
    *((_OWORD *)v34 + 24) = v37;
    *((_OWORD *)v34 + 25) = v38;
    int v39 = *(_DWORD *)v36;
    if (*(_DWORD *)v36) {
      int ai_family = 30;
    }
    else {
      int ai_family = 2;
    }
    memset(&v112.ai_socktype, 0, 40);
    v112.ai_flags = 5;
    v112.int ai_family = ai_family;
    v112.ai_socktype = 2;
    __int16 v41 = (void *)(v32 + 40 * v27 + 20);
    if (v39)
    {
      if (*v41 == *MEMORY[0x263EF88F0] && *(void *)(v32 + 40 * v27 + 28) == *(void *)(MEMORY[0x263EF88F0] + 8))
      {
LABEL_56:
        int v42 = 0;
        goto LABEL_57;
      }
    }
    else if (!*(_DWORD *)v41)
    {
      goto LABEL_56;
    }
    int v42 = (const char *)IPToString();
LABEL_57:
    __sprintf_chk(v114, 0, 6uLL, "%u", *(unsigned __int16 *)(v32 + 40 * v27 + 36));
    int v45 = getaddrinfo(v42, v114, &v112, &v111);
    if (v45)
    {
      int v46 = v45;
      uint32_t v47 = gcks_log();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v117 = 67109120;
        *(_DWORD *)&v117[4] = v46 | 0xB01A0000;
        _os_log_error_impl(&dword_218756000, v47, OS_LOG_TYPE_ERROR, "Getaddrinfo failed (%X).", v117, 8u);
      }
LABEL_60:
      free(v35);
      uint64_t v5 = v100;
      uint64_t v28 = v101;
      goto LABEL_61;
    }
    double v48 = v111;
    if (!v111)
    {
      int v50 = gcks_log();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
        GCKSessionPrepareConnection_cold_4(&v109, v110, v50);
      }
      goto LABEL_60;
    }
    int v49 = v111;
    while (v49->ai_family != ai_family)
    {
      int v49 = v49->ai_next;
      if (!v49)
      {
        int ai_family = v111->ai_family;
        goto LABEL_71;
      }
    }
    double v48 = v49;
LABEL_71:
    int v51 = socket(ai_family, v48->ai_socktype, v48->ai_protocol);
    *double v35 = v51;
    if (v51 == -1)
    {
      int v55 = *__error();
      double v56 = gcks_log();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v117 = 67109120;
        *(_DWORD *)&v117[4] = v55 | 0xC00F0000;
        _os_log_error_impl(&dword_218756000, v56, OS_LOG_TYPE_ERROR, "Socket failed (%X).", v117, 8u);
      }
      freeaddrinfo(v111);
      goto LABEL_60;
    }
    int v108 = 1;
    if (v39)
    {
      setsockopt(v51, 41, 27, &v108, 4u);
      if (*((unsigned char *)v36 + 1))
      {
        *(_DWORD *)v117 = 1;
        setsockopt(*v35, 0xFFFF, 4356, v117, 4u);
      }
      int v52 = *v35;
      int v53 = 41;
      int v54 = 61;
    }
    else
    {
      *(_DWORD *)v117 = if_nametoindex((const char *)(v32 + 40 * v27 + 4));
      setsockopt(*v35, 0, 25, v117, 4u);
      setsockopt(*v35, 0, 7, &v108, 4u);
      int v52 = *v35;
      int v53 = 0;
      int v54 = 20;
    }
    setsockopt(v52, v53, v54, &v108, 4u);
    int v107 = 1;
    setsockopt(*v35, 0xFFFF, 4130, &v107, 4u);
    int v106 = 500;
    setsockopt(*v35, 0xFFFF, 4230, &v106, 4u);
    ai_addr = v48->ai_addr;
    unsigned int v58 = 16402;
    do
    {
      *(_WORD *)ai_addr->sa_data = bswap32(v58) >> 16;
      if (!bind(*v35, v48->ai_addr, v48->ai_addrlen))
      {
        freeaddrinfo(v111);
        goto LABEL_87;
      }
      --v58;
    }
    while ((unsigned __int16)v58 >= 0x4000u);
    *(_WORD *)ai_addr->sa_data = 0;
    int v59 = bind(*v35, v48->ai_addr, v48->ai_addrlen);
    freeaddrinfo(v111);
    if (v59)
    {
      int v60 = *__error();
      int v61 = gcks_log();
      uint64_t v28 = v101;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v117 = 67109120;
        *(_DWORD *)&v117[4] = v60 | 0xC00F0000;
        int v62 = v61;
        v63 = "Bind failed (%X) for all ports in range.";
        goto LABEL_117;
      }
      goto LABEL_94;
    }
LABEL_87:
    socklen_t v113 = 128;
    uint64_t v28 = v101;
    if (getsockname(*v35, buf, &v113) == -1)
    {
      int v68 = *__error();
      int v69 = gcks_log();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v117 = 67109120;
        *(_DWORD *)&v117[4] = v68 | 0xC01A0000;
        int v62 = v69;
        v63 = "Getsockname failed (%X).";
LABEL_117:
        _os_log_error_impl(&dword_218756000, v62, OS_LOG_TYPE_ERROR, v63, v117, 8u);
      }
LABEL_94:
      close(*v35);
      free(v35);
      uint64_t v5 = v100;
      goto LABEL_61;
    }
    SAToIPPORT();
    *((_WORD *)v35 + 210) = WORD2(v126);
    v64 = gcks_log();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v65 = IPPORTToString();
      int v66 = *v35;
      *(_DWORD *)v117 = 67109890;
      *(_DWORD *)&v117[4] = a2;
      *(_WORD *)v118 = 2080;
      *(void *)&v118[2] = v65;
      __int16 v119 = 2080;
      uint32_t v120 = v35 + 97;
      __int16 v121 = 1024;
      int v122 = v66;
      _os_log_impl(&dword_218756000, v64, OS_LOG_TYPE_DEFAULT, "For remoteID[%08X]: Start listening on %s (%s) sock %d.", v117, 0x22u);
    }
    *((void *)v35 + 46) = 0;
    *(void *)v117 = 0;
    *(void *)v118 = 0;
    if (pthread_mutexattr_init((pthread_mutexattr_t *)v117))
    {
      int v67 = gcks_log();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR)) {
        GCKSessionPrepareConnection_cold_5(v115, v116, v67);
      }
      goto LABEL_94;
    }
    pthread_mutexattr_settype((pthread_mutexattr_t *)v117, 2);
    pthread_mutex_init((pthread_mutex_t *)v35 + 12, (const pthread_mutexattr_t *)v117);
    pthread_mutexattr_destroy((pthread_mutexattr_t *)v117);
    *((void *)v35 + 86) = malloc_type_calloc(0x10uLL, 0x1A0uLL, 0x10000405F3595DEuLL);
    *((void *)v35 + 45) = 0x404DFEB851EB851FLL;
    *((void *)v35 + 44) = *(void *)(v100 + 24);
    v35[19] = v31;
    uint64_t v5 = v100;
    if ((ICEAddOneInterface() & 0x80000000) != 0)
    {
      gckSessionFreeCList((uint64_t)v35);
    }
    else
    {
      v70 = gcks_log();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)&buf[0].sa_len = 67109376;
        *(_DWORD *)&buf[0].sa_data[2] = a2;
        *(_WORD *)&buf[0].sa_data[6] = 1024;
        *(_DWORD *)&buf[0].sa_data[8] = 6;
        _os_log_impl(&dword_218756000, v70, OS_LOG_TYPE_DEFAULT, "Added interface for participant [%08X]: proto %d.", &buf[0].sa_len, 0xEu);
      }
      pthread_rwlock_wrlock(v97);
      v71 = v96;
      do
      {
        int v72 = v71;
        int v73 = *v71;
        v71 = (int **)(*v71 + 208);
      }
      while (v73);
      *int v72 = v35;
      pthread_mutex_lock((pthread_mutex_t *)v35 + 12);
      if (*(_DWORD *)(v100 + 7544)) {
        double v74 = 13.0;
      }
      else {
        double v74 = 1.0;
      }
      uint64_t v75 = *((void *)v35 + 75);
      if (v75)
      {
        while (1)
        {
          uint64_t v76 = v75;
          if (*(unsigned char *)v75 == 12) {
            break;
          }
          uint64_t v75 = *(void *)(v75 + 64);
          if (!v75)
          {
            int v77 = (double **)(v76 + 64);
            goto LABEL_109;
          }
        }
        *(double *)(v75 + 8) = v74;
        *(void *)(v75 + 16) = 0;
        *(void *)(v75 + 32) = 0x4024000000000000;
        *(_DWORD *)(v75 + 52) = v35[22];
      }
      else
      {
        int v77 = (double **)(v35 + 150);
LABEL_109:
        int v78 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(unsigned char *)int v78 = 12;
        v78[1] = v74;
        v78[2] = 0.0;
        v78[4] = 10.0;
        *((_DWORD *)v78 + 13) = v35[22];
        *int v77 = v78;
      }
      int v79 = gcks_log();
      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
      {
        int v80 = v35[22];
        int v81 = v35[18];
        *(_DWORD *)&buf[0].sa_len = 67109376;
        *(_DWORD *)&buf[0].sa_data[2] = v80;
        *(_WORD *)&buf[0].sa_data[6] = 1024;
        *(_DWORD *)&buf[0].sa_data[8] = v81;
        _os_log_impl(&dword_218756000, v79, OS_LOG_TYPE_DEFAULT, "Scheduling ICE connection timeout for participant [%08X] on channel [%d].", &buf[0].sa_len, 0xEu);
      }
      pthread_mutex_unlock((pthread_mutex_t *)v35 + 12);
      int v82 = *(_DWORD *)(v100 + 16);
      if (v82 != -1)
      {
        *(_DWORD *)(v100 + 16) = -1;
        close(v82);
      }
      pthread_rwlock_unlock(v97);
      ++*(_DWORD *)(v100 + 400);
      ++v99;
      int v98 = 1;
    }
LABEL_61:
    ++v27;
  }
  while (v27 != v28);
  uint64_t v3 = 2149187606;
  if (v98)
  {
    pthread_rwlock_rdlock(v97);
    int v83 = *(_DWORD *)(v5 + 16);
    if (v83 != -1)
    {
      *(_DWORD *)(v5 + 16) = -1;
      close(v83);
    }
    pthread_rwlock_unlock(v97);
  }
LABEL_125:
  FreeLocalInterfaceList();
  int v92 = gcks_log();
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)&buf[0].sa_len = 67109376;
    *(_DWORD *)&buf[0].sa_data[2] = v99;
    *(_WORD *)&buf[0].sa_data[6] = 1024;
    *(_DWORD *)&buf[0].sa_data[8] = a2;
    _os_log_impl(&dword_218756000, v92, OS_LOG_TYPE_DEFAULT, "%d valid interfaces found for participant [%08X].", &buf[0].sa_len, 0xEu);
  }
  if (v99)
  {
    uint64_t v93 = ICEGetCandidates();
    if ((v93 & 0x80000000) != 0)
    {
      uint64_t v3 = v93;
      int v94 = gcks_log();
      if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
        GCKSessionPrepareConnection_cold_2(v3, v94);
      }
    }
    else
    {
      uint64_t v3 = 0;
    }
  }
LABEL_132:
  CheckOutHandleDebug();
  return v3;
}

intptr_t __GCKSessionPrepareConnection_block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void gckCallICEListRemoveSignalBlock(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = (pthread_mutex_t *)(a1 + 80);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 80));
  uint64_t v5 = 0;
  double v6 = (void *)(a1 + 152);
  while (*((_DWORD *)v6 - 2) != a2 || !*v6)
  {
    ++v5;
    v6 += 2;
    if (v5 == 16)
    {
      pthread_mutex_unlock(v4);
      goto LABEL_6;
    }
  }
  uint64_t v8 = gcks_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109376;
    int v11 = a2;
    __int16 v12 = 1024;
    int v13 = v5;
    _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "Remove signal block for participant [%08X] at slot %d.", (uint8_t *)&v10, 0xEu);
  }
  uint64_t v9 = (void (**)(void))*v6;
  void *v6 = 0;
  *((_DWORD *)v6 - 2) = -1;
  pthread_mutex_unlock(v4);
  if (v9)
  {
    v9[2](v9);
    _Block_release(v9);
    return;
  }
LABEL_6:
  int v7 = gcks_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 67109120;
    int v11 = a2;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "No signal block found for participant [%08X].", (uint8_t *)&v10, 8u);
  }
}

uint64_t gckSessionCancelRecvUDPInternal(uint64_t a1)
{
  if (!a1) {
    return 2149187588;
  }
  uint64_t v2 = (pthread_mutex_t *)(a1 + 7400);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7400));
  *(_DWORD *)(a1 + 8) = 1;
  pthread_cond_broadcast((pthread_cond_t *)(a1 + 7464));
  pthread_mutex_unlock(v2);
  return 0;
}

void __GCKSessionPrepareConnection_block_invoke_11(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(_DWORD *)(a1 + 40);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "ICE connectivity check failsafe timer for participant [%08X] fired!", (uint8_t *)v4, 8u);
  }
  gckCallICEListRemoveSignalBlock(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40));
}

uint64_t GCKSessionCertificateDecision(uint64_t a1, int a2, int a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v5 = CheckInHandleDebug();
  if (!v5) {
    return 2149187586;
  }
  uint64_t v6 = v5;
  int v7 = (pthread_rwlock_t *)(v5 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v5 + 7192));
  uint64_t v8 = *(void *)(v6 + 7184);
  if (v8)
  {
    int v9 = 0;
    uint64_t v10 = *(void *)(v6 + 7184);
    do
    {
      if (*(_DWORD *)(v10 + 88) == a2)
      {
        int v11 = *(_DWORD *)(v10 + 80);
        if (v11 >= v9) {
          int v9 = v11 + 1;
        }
      }
      uint64_t v10 = *(void *)(v10 + 832);
    }
    while (v10);
    int v12 = 0;
    do
    {
      if (*(_DWORD *)(v8 + 88) == a2)
      {
        pthread_mutex_lock((pthread_mutex_t *)(v8 + 768));
        if (*(_DWORD *)(v8 + 628) == 1 && *(void *)(v8 + 648))
        {
          if (a3)
          {
            int v13 = gcks_log();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              int v14 = *(_DWORD *)(v8 + 88);
              int v15 = *(_DWORD *)(v8 + 72);
              uint64_t v16 = *(void *)(v8 + 632);
              v19[0] = 67109888;
              v19[1] = v14;
              __int16 v20 = 1024;
              int v21 = v15;
              __int16 v22 = 2048;
              uint64_t v23 = v16;
              __int16 v24 = 2048;
              uint64_t v25 = v8;
              _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Starting OSPF Hello protocol with participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", (uint8_t *)v19, 0x22u);
            }
            *(_DWORD *)(v8 + 80) = v9;
            *(_DWORD *)(v8 + 84) = v9++;
            uint64_t v17 = (void (**)(void))_Block_copy(*(const void **)(v8 + 648));
            int v12 = 1;
          }
          else
          {
            gckSessionChangeStateCList(v6, v8);
            uint64_t v17 = 0;
          }
          *(_DWORD *)(v8 + 628) = 0;
          _Block_release(*(const void **)(v8 + 648));
          *(void *)(v8 + 648) = 0;
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 768));
          if (v17)
          {
            v17[2](v17);
            _Block_release(v17);
          }
        }
        else
        {
          if (!a3) {
            gckSessionChangeStateCList(v6, v8);
          }
          pthread_mutex_unlock((pthread_mutex_t *)(v8 + 768));
        }
      }
      uint64_t v8 = *(void *)(v8 + 832);
    }
    while (v8);
    if (v12) {
      gckSessionReconcileChannelPriority(v6, a2);
    }
  }
  pthread_rwlock_unlock(v7);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionChangeStateCList(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  unsigned int v5 = v4;
  uint64_t v6 = (_DWORD *)v3;
  uint64_t v7 = v2;
  uint64_t v106 = *MEMORY[0x263EF8340];
  uint64_t result = 2149187628;
  unsigned int v9 = *(_DWORD *)(v3 + 376);
  switch(v4)
  {
    case 0u:
      if (!v9)
      {
        *(double *)(v3 + 696) = micro();
        int v10 = 1;
        goto LABEL_18;
      }
      return result;
    case 1u:
    case 2u:
      if (v9 == 1) {
        int v10 = 2;
      }
      else {
        int v10 = *(_DWORD *)(v3 + 376);
      }
      goto LABEL_11;
    case 3u:
      if (v9 <= 3) {
        int v10 = 3;
      }
      else {
        int v10 = *(_DWORD *)(v3 + 376);
      }
      goto LABEL_11;
    case 4u:
      if (v9 > 3 || v9 == 1) {
        return result;
      }
      int v10 = 4;
      goto LABEL_18;
    default:
      int v10 = 4;
LABEL_11:
      if (v9 == v10) {
        return result;
      }
LABEL_18:
      int v12 = gcks_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        if (v5 > 5) {
          int v13 = "?";
        }
        else {
          int v13 = off_264338480[v5];
        }
        int v14 = v6[22];
        int v15 = v6[18];
        uint64_t v16 = "Created";
        switch(v9)
        {
          case 0u:
            break;
          case 1u:
            uint64_t v16 = "ICE";
            break;
          case 2u:
            uint64_t v16 = "Connecting";
            break;
          case 3u:
            uint64_t v16 = "Connected";
            break;
          case 4u:
            uint64_t v16 = "Disconnected";
            break;
          default:
            if (v9 == 255) {
              uint64_t v16 = "Invalid";
            }
            else {
              uint64_t v16 = "?";
            }
            break;
        }
        uint64_t v17 = "Created";
        switch(v10)
        {
          case 0:
            break;
          case 1:
            uint64_t v17 = "ICE";
            break;
          case 2:
            uint64_t v17 = "Connecting";
            break;
          case 3:
            uint64_t v17 = "Connected";
            break;
          case 4:
            uint64_t v17 = "Disconnected";
            break;
          default:
            if (v10 == 255) {
              uint64_t v17 = "Invalid";
            }
            else {
              uint64_t v17 = "?";
            }
            break;
        }
        *(_DWORD *)buf = 67110146;
        *(_DWORD *)uint64_t v100 = v14;
        *(_WORD *)&v100[4] = 1024;
        *(_DWORD *)&v100[6] = v15;
        *(_WORD *)uint64_t v101 = 2080;
        *(void *)&v101[2] = v13;
        __int16 v102 = 2080;
        int v103 = v16;
        __int16 v104 = 2080;
        uint64_t v105 = v17;
        _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Participant %08X, channel [%d]: State Change with event %s: %s -> %s.", buf, 0x2Cu);
      }
      v6[94] = v10;
      if (v10 != 3)
      {
        if (v10 != 4) {
          return 0;
        }
        pthread_mutex_lock((pthread_mutex_t *)(v7 + 7080));
        if ((v9 & 0xFFFFFFFE) == 2 && !v6[20])
        {
          int v43 = gcks_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            int v44 = v6[18];
            int v45 = v6[22];
            *(_DWORD *)buf = 67109376;
            *(_DWORD *)uint64_t v100 = v44;
            *(_WORD *)&v100[4] = 1024;
            *(_DWORD *)&v100[6] = v45;
            _os_log_impl(&dword_218756000, v43, OS_LOG_TYPE_DEFAULT, "The disconnected channel [%d] was the active channel for participant [%08X].", buf, 0xEu);
          }
          int v97 = 1;
        }
        else
        {
          int v97 = 0;
        }
        v95 = (pthread_mutex_t *)(v7 + 7080);
        v6[20] = -1;
        gckSessionReconcileChannelPriority(v7, v6[22]);
        uint64_t v19 = *(void *)(v7 + 7184);
        if (v19)
        {
          int v96 = 0;
          int v20 = 0;
          int v21 = 0;
          do
          {
            if ((_DWORD *)v19 != v6 && *(_DWORD *)(v19 + 88) == v6[22])
            {
              int v22 = *(_DWORD *)(v19 + 376);
              switch(v22)
              {
                case 3:
                  if (!*(_DWORD *)(v19 + 80))
                  {
                    uint64_t v26 = gcks_log();
                    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                    {
                      int v27 = *(_DWORD *)(v19 + 72);
                      int v28 = *(_DWORD *)(v19 + 88);
                      *(_DWORD *)buf = 67109376;
                      *(_DWORD *)uint64_t v100 = v27;
                      *(_WORD *)&v100[4] = 1024;
                      *(_DWORD *)&v100[6] = v28;
                      _os_log_impl(&dword_218756000, v26, OS_LOG_TYPE_DEFAULT, "Channel [%d] is active and connected for participant [%08X].", buf, 0xEu);
                    }
                    int v97 = 0;
                    int v96 = 1;
                  }
                  break;
                case 2:
                  uint64_t v29 = gcks_log();
                  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
                  {
                    int v30 = *(_DWORD *)(v19 + 72);
                    int v31 = *(_DWORD *)(v19 + 88);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)uint64_t v100 = v30;
                    *(_WORD *)&v100[4] = 1024;
                    *(_DWORD *)&v100[6] = v31;
                    _os_log_impl(&dword_218756000, v29, OS_LOG_TYPE_DEFAULT, "Connection attempt in progress on channel [%d] for participant [%08X].", buf, 0xEu);
                  }
                  int v20 = 1;
                  break;
                case 1:
                  uint64_t v23 = gcks_log();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
                  {
                    int v24 = *(_DWORD *)(v19 + 72);
                    int v25 = *(_DWORD *)(v19 + 88);
                    *(_DWORD *)buf = 67109376;
                    *(_DWORD *)uint64_t v100 = v24;
                    *(_WORD *)&v100[4] = 1024;
                    *(_DWORD *)&v100[6] = v25;
                    _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "ICE is still in progress on channel [%d] for participant [%08X].", buf, 0xEu);
                  }
                  int v21 = 1;
                  break;
              }
            }
            uint64_t v19 = *(void *)(v19 + 832);
          }
          while (v19);
        }
        else
        {
          int v21 = 0;
          int v20 = 0;
          int v96 = 0;
        }
        int v37 = 0;
        if (!v21 && !v20 && !v96)
        {
          uint64_t v38 = *(unsigned int *)(v7 + 708);
          int v39 = gcks_log();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            int v40 = v6[22];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v100 = v40;
            _os_log_impl(&dword_218756000, v39, OS_LOG_TYPE_DEFAULT, "No connected or connecting cList to [%08X].", buf, 8u);
          }
          if ((int)v38 < 1)
          {
LABEL_78:
            int v37 = 0;
          }
          else
          {
            uint64_t v41 = 0;
            uint64_t v42 = v7 + 712;
            while (*(_DWORD *)(v42 + v41) != v6[22])
            {
              v41 += 8;
              if (8 * v38 == v41) {
                goto LABEL_78;
              }
            }
            gckSessionDeleteNeighbor(v7, (int *)(v42 + v41));
            gckSessionUpdateRoutingTable(v7, v46);
            gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
            int v37 = 1;
          }
        }
        uint64_t v47 = *(unsigned int *)(v7 + 420);
        if ((int)v47 < 1)
        {
LABEL_87:
          BOOL v51 = 0;
          int v52 = 1;
        }
        else
        {
          int v48 = v6[22];
          int v49 = (_DWORD *)(v7 + 424);
          uint64_t v50 = *(unsigned int *)(v7 + 420);
          while (*v49 != v48)
          {
            v49 += 104;
            if (!--v50) {
              goto LABEL_87;
            }
          }
          int v53 = (_DWORD *)(v7 + 428);
          while (*(v53 - 1) != v48)
          {
            v53 += 104;
            if (!--v47)
            {
              BOOL v51 = 0;
              goto LABEL_93;
            }
          }
          BOOL v51 = *v53 != -1;
LABEL_93:
          int v54 = gcks_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
          {
            int v55 = "a";
            int v56 = v6[22];
            if (!v51) {
              int v55 = "NO";
            }
            *(_DWORD *)buf = 136315394;
            *(void *)uint64_t v100 = v55;
            *(_WORD *)&v100[8] = 1024;
            *(_DWORD *)uint64_t v101 = v56;
            _os_log_impl(&dword_218756000, v54, OS_LOG_TYPE_DEFAULT, "There is %s valid route to participant [%08X].", buf, 0x12u);
          }
          int v52 = 0;
        }
        if ((v5 & 0xFFFFFFFE) == 4 && v97 && v9 == 3)
        {
          uint64_t v57 = *(unsigned int *)(v7 + 708);
          if ((int)v57 < 1)
          {
            LODWORD(v58) = 0;
          }
          else
          {
            uint64_t v58 = 0;
            int v59 = (int *)(v7 + 712);
            while (1)
            {
              int v60 = *v59;
              v59 += 2;
              if (v60 == v6[22]) {
                break;
              }
              if (v57 == ++v58) {
                goto LABEL_114;
              }
            }
          }
          if (v58 == v57
            || (uint64_t v61 = v7 + 712 + 8 * v58,
                int v63 = *(_DWORD *)(v61 + 4),
                int v62 = (_DWORD *)(v61 + 4),
                v63 == -1))
          {
LABEL_114:
            if (!v51) {
              goto LABEL_134;
            }
          }
          else
          {
            *int v62 = -1;
            gckSessionUpdateRoutingTable(v7, v18);
            uint64_t v64 = *(unsigned int *)(v7 + 420);
            if ((int)v64 < 1) {
              goto LABEL_134;
            }
            uint64_t v65 = (_DWORD *)(v7 + 428);
            while (*(v65 - 1) != v6[22])
            {
              v65 += 104;
              if (!--v64) {
                goto LABEL_134;
              }
            }
            if (*v65 == -1) {
              goto LABEL_134;
            }
          }
          int v66 = gcks_log();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
          {
            int v67 = v6[22];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)uint64_t v100 = v67;
            _os_log_impl(&dword_218756000, v66, OS_LOG_TYPE_DEFAULT, "Remain (indirectly) connected to participant %08X.", buf, 8u);
          }
          gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
          gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
          int v98 = 0;
          gckSessionFindAndRemoveDisconnectedNodes((_DWORD *)v7, (uint64_t)buf, &v98);
          BOOL v68 = v5 == 4;
          uint64_t v69 = v98;
          if (v98 >= 1)
          {
            uint64_t v70 = 0;
            do
            {
              v71 = &buf[416 * v70];
              int v72 = *(_DWORD *)v71;
              int v73 = *(_DWORD *)v71 == v6[22] && v68;
              gckSessionDisconnectParticipant(v7, *(_DWORD *)v71, v71 + 9, v71[8], v73);
              for (uint64_t i = *(void *)(v7 + 7184); i; uint64_t i = *(void *)(i + 832))
              {
                if (*(_DWORD *)(i + 88) == v72) {
                  gckSessionScheduleCListClose(i, v73);
                }
              }
              ++v70;
            }
            while (v70 != v69);
          }
          uint64_t v75 = *(void *)(v7 + 7184);
          uint64_t v76 = v95;
          if (v75)
          {
            int v77 = v6[22];
            do
            {
              if (*(_DWORD *)(v75 + 88) == v77) {
                gckSessionScheduleCListClose(v75, v68);
              }
              uint64_t v75 = *(void *)(v75 + 832);
            }
            while (v75);
          }
          goto LABEL_174;
        }
LABEL_134:
        if (v97)
        {
          if (!v51 || v9 != 2)
          {
LABEL_154:
            int v84 = gcks_log();
            if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
            {
              int v85 = v6[22];
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)uint64_t v100 = v85;
              _os_log_impl(&dword_218756000, v84, OS_LOG_TYPE_DEFAULT, "Disconnected from a participant %08X. Stop ICE check.", buf, 8u);
            }
            ICEStopConnectivityCheck();
            if (v52)
            {
              uint64_t v86 = *(unsigned int *)(v7 + 708);
              int v87 = v6[22];
              if ((int)v86 < 1)
              {
                uint64_t v76 = (pthread_mutex_t *)(v7 + 7080);
              }
              else
              {
                uint64_t v88 = 0;
                uint64_t v89 = v7 + 712;
                uint64_t v90 = 8 * v86;
                uint64_t v76 = (pthread_mutex_t *)(v7 + 7080);
                while (*(_DWORD *)(v89 + v88) != v87)
                {
                  v88 += 8;
                  if (v90 == v88) {
                    goto LABEL_171;
                  }
                }
                gckSessionDeleteNeighbor(v7, (int *)(v89 + v88));
                gckSessionRequestLSAUpdateForNode((int *)(v7 + 424));
                int v87 = v6[22];
                int v37 = 1;
              }
LABEL_171:
              gckSessionDisconnectParticipant(v7, v87, 0, 0, 1);
              goto LABEL_172;
            }
            int v91 = gckSessionHandleDeletedNode((_DWORD *)v7, v6[22], (v5 & 0xFFFFFFFE) == 4);
            gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
            gckSessionHandleRemainingDisconnectedNodes(v7, 0);
            uint64_t v76 = (pthread_mutex_t *)(v7 + 7080);
            if (v5 == 4 && v91 == -2145779690)
            {
              int v92 = *(_DWORD *)(v7 + 420);
              if (v92 >= 1)
              {
                uint64_t v93 = 0;
                uint64_t v94 = 416 * v92;
                while (*(_DWORD *)(v7 + 424 + v93) != v6[22])
                {
                  v93 += 416;
                  if (v94 == v93) {
                    goto LABEL_174;
                  }
                }
                gckSessionDeleteDisconnectedNode(v7, (int *)(v7 + v93 + 424));
              }
            }
LABEL_174:
            pthread_mutex_unlock(v76);
            return 0;
          }
        }
        else if (!v96 && !(v20 | v21) && !v51)
        {
          if (v9 == 3)
          {
            int v78 = gcks_log();
            if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
            {
              int v79 = v6[18];
              int v80 = v6[22];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v100 = v79;
              *(_WORD *)&v100[4] = 1024;
              *(_DWORD *)&v100[6] = v80;
              _os_log_impl(&dword_218756000, v78, OS_LOG_TYPE_DEFAULT, "Channel [%d] wasn't active for participant [%08X]. Keeping connection open.", buf, 0xEu);
            }
            uint64_t v76 = (pthread_mutex_t *)(v7 + 7080);
LABEL_172:
            if (v37) {
              gckSessionSendLSA(v7, *(_DWORD *)(v7 + 420), v7 + 424, v6[22], 0);
            }
            goto LABEL_174;
          }
          goto LABEL_154;
        }
        if (!v21 && ICEStopConnectivityCheck() != -2146107370) {
          gckSessionCancelRecvUDPInternal(v7);
        }
        uint64_t v76 = (pthread_mutex_t *)(v7 + 7080);
        if (v97)
        {
          if (v51 && v9 == 2)
          {
            int v81 = gcks_log();
            if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
            {
              int v82 = v6[18];
              int v83 = v6[22];
              *(_DWORD *)buf = 67109376;
              *(_DWORD *)uint64_t v100 = v82;
              *(_WORD *)&v100[4] = 1024;
              *(_DWORD *)&v100[6] = v83;
              _os_log_impl(&dword_218756000, v81, OS_LOG_TYPE_DEFAULT, "Last channel [%d] closed for participant [%08X], but we are still indirectly connected.", buf, 0xEu);
            }
          }
        }
        gckSessionScheduleCListClose((uint64_t)v6, 1);
        goto LABEL_174;
      }
      int InterfacePriorityForCList = gckSessionGetInterfacePriorityForCList(v7, (uint64_t)v6);
      if ((InterfacePriorityForCList - 3) >= 5)
      {
        int v34 = InterfacePriorityForCList;
        double v35 = gcks_log();
        BOOL v36 = os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        int v33 = 0;
        if (v36)
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)uint64_t v100 = v34;
          _os_log_impl(&dword_218756000, v35, OS_LOG_TYPE_DEFAULT, "Unexpected interface interface priority [%d].", buf, 8u);
          int v33 = 0;
        }
      }
      else
      {
        int v33 = dword_21878BB68[InterfacePriorityForCList - 3];
      }
      v6[95] = v33;
      gckSessionReconcileChannelPriority(v7, v6[22]);
      return 0;
  }
}

void gckSessionReconcileChannelPriority(uint64_t a1, int a2)
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  unsigned int v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v52 = a2;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Reconcile Channel Priority for participant [%08X].", buf, 8u);
  }
  uint64_t v5 = *(void *)(a1 + 7184);
  if (!v5) {
    goto LABEL_60;
  }
  int v6 = 0;
  int InterfacePriorityForCList = 0;
  int v8 = 0;
  uint64_t v9 = 0;
  do
  {
    if (*(_DWORD *)(v5 + 88) == a2)
    {
      int v10 = *(_DWORD *)(v5 + 80);
      if (*(_DWORD *)(v5 + 376) == 3 && v10 >= 0) {
        ++v8;
      }
      if (v10)
      {
        int v6 = 1;
      }
      else
      {
        int InterfacePriorityForCList = gckSessionGetInterfacePriorityForCList(a1, v5);
        int v6 = 1;
        uint64_t v9 = v5;
      }
    }
    uint64_t v5 = *(void *)(v5 + 832);
  }
  while (v5);
  uint64_t v47 = v9;
  uint64_t v12 = *(void *)(a1 + 7184);
  if (!v12)
  {
    if (v6) {
      goto LABEL_58;
    }
LABEL_60:
    int v45 = gcks_log();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v52 = a2;
    uint64_t v42 = "Couldn't find a clist for participant [%08X].";
    goto LABEL_62;
  }
  int v48 = v6;
  int v46 = InterfacePriorityForCList;
  int v13 = 0;
  int v14 = 0;
  uint64_t v49 = a1;
  do
  {
    if (*(_DWORD *)(v12 + 88) == a2)
    {
      int v15 = gcks_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = *(_DWORD *)(v12 + 72);
        int v17 = *(_DWORD *)(v12 + 80);
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v52 = v16;
        *(_WORD *)&v52[4] = 1024;
        *(_DWORD *)&v52[6] = v17;
        _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "Channel [%d] priority [%d].", buf, 0xEu);
      }
      if (v8 && *(_DWORD *)(v12 + 376) != 3)
      {
        int v27 = gcks_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v28 = *(_DWORD *)(v12 + 376);
          uint64_t v29 = "Created";
          switch(v28)
          {
            case 0:
              break;
            case 1:
              uint64_t v29 = "ICE";
              break;
            case 2:
              uint64_t v29 = "Connecting";
              break;
            case 3:
              uint64_t v29 = "Connected";
              break;
            case 4:
              uint64_t v29 = "Disconnected";
              break;
            default:
              if (v28 == 255) {
                uint64_t v29 = "Invalid";
              }
              else {
                uint64_t v29 = "?";
              }
              break;
          }
          *(_DWORD *)buf = 136315138;
          *(void *)int v52 = v29;
          _os_log_impl(&dword_218756000, v27, OS_LOG_TYPE_DEFAULT, "Not in connected state, currently %s. Skipping.", buf, 0xCu);
        }
      }
      else if ((*(_DWORD *)(v12 + 80) & 0x80000000) == 0)
      {
        int v18 = gckSessionGetInterfacePriorityForCList(a1, v12);
        if (!v18)
        {
          uint64_t v19 = gcks_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            int v20 = *(_DWORD *)(v12 + 384);
            *(_DWORD *)buf = 136315394;
            *(void *)int v52 = v12 + 388;
            *(_WORD *)&v52[8] = 1024;
            *(_DWORD *)&v52[10] = v20;
            _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "Failed to find a valid priority for interface [%s] flags [%08X].", buf, 0x12u);
          }
        }
        int v21 = gcks_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v50 = v13;
          int v22 = v14;
          int v23 = *(_DWORD *)(v12 + 72);
          int v24 = *(_DWORD *)(v12 + 80);
          int v25 = *(_DWORD *)(v12 + 384);
          uint64_t v26 = GCKSessionInterfaceNameForPriority(v18);
          *(_DWORD *)buf = 136316418;
          *(void *)int v52 = v12 + 388;
          *(_WORD *)&v52[8] = 1024;
          *(_DWORD *)&v52[10] = v23;
          int v14 = v22;
          int v13 = v50;
          *(_WORD *)&v52[14] = 1024;
          *(_DWORD *)&v52[16] = v24;
          *(_WORD *)&v52[20] = 1024;
          *(_DWORD *)&v52[22] = v25;
          a1 = v49;
          *(_WORD *)&v52[26] = 1024;
          *(_DWORD *)&v52[28] = v18;
          __int16 v53 = 2080;
          int v54 = v26;
          _os_log_impl(&dword_218756000, v21, OS_LOG_TYPE_DEFAULT, "Checking pCList if[%s] chan[%d] cList priority [%d] flags[%08X] interface priority [%d-%s].", buf, 0x2Eu);
        }
        if (v13 < v18) {
          int v14 = (_DWORD *)v12;
        }
        if (v13 <= v18) {
          int v13 = v18;
        }
      }
    }
    uint64_t v12 = *(void *)(v12 + 832);
  }
  while (v12);
  if (!v48) {
    goto LABEL_60;
  }
  if (!v13)
  {
LABEL_58:
    int v45 = gcks_log();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v52 = a2;
    uint64_t v42 = "Unknown interface for participant [%08X].";
LABEL_62:
    int v43 = v45;
    goto LABEL_63;
  }
  int v30 = gcks_log();
  BOOL v31 = os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT);
  if (!v14)
  {
    if (!v31) {
      return;
    }
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)int v52 = a2;
    uint64_t v42 = "No clist with iPriority >= 0 and interface priority < GCK_IF_PRIORITY_NONE for participant [%08X].";
    int v43 = v30;
LABEL_63:
    uint32_t v44 = 8;
    goto LABEL_64;
  }
  if (v31)
  {
    uint64_t v32 = GCKSessionInterfaceNameForPriority(v46);
    int v33 = GCKSessionInterfaceNameForPriority(v13);
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)int v52 = v46;
    *(_WORD *)&v52[4] = 2080;
    *(void *)&v52[6] = v32;
    *(_WORD *)&v52[14] = 1024;
    *(_DWORD *)&v52[16] = v13;
    *(_WORD *)&v52[20] = 2080;
    *(void *)&v52[22] = v33;
    _os_log_impl(&dword_218756000, v30, OS_LOG_TYPE_DEFAULT, "Currently active clist priority %d-%s; highest interface priority %d-%s.",
      buf,
      0x22u);
  }
  if (v13 > v46)
  {
    if (v14[20])
    {
      if (v47)
      {
        int v34 = gcks_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          int v35 = v14[18];
          int v36 = *(_DWORD *)(v47 + 72);
          int v37 = v14[20];
          *(_DWORD *)buf = 67109888;
          *(_DWORD *)int v52 = v35;
          *(_WORD *)&v52[4] = 1024;
          *(_DWORD *)&v52[6] = 0;
          *(_WORD *)&v52[10] = 1024;
          *(_DWORD *)&v52[12] = v36;
          *(_WORD *)&v52[16] = 1024;
          *(_DWORD *)&v52[18] = v37;
          _os_log_impl(&dword_218756000, v34, OS_LOG_TYPE_DEFAULT, "Interface Switch! Setting priority of channel [%d] to [%d] and [%d] to [%d].", buf, 0x1Au);
        }
        *(_DWORD *)(v47 + 80) = v14[20];
      }
      v14[20] = 0;
    }
    uint64_t v38 = gcks_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      int v39 = GCKSessionInterfaceNameForPriority(v13);
      int v40 = v14[18];
      int v41 = v14[96];
      *(_DWORD *)buf = 136315906;
      *(void *)int v52 = v39;
      *(_WORD *)&v52[8] = 2080;
      *(void *)&v52[10] = v14 + 97;
      *(_WORD *)&v52[18] = 1024;
      *(_DWORD *)&v52[20] = v40;
      *(_WORD *)&v52[24] = 1024;
      *(_DWORD *)&v52[26] = v41;
      uint64_t v42 = "Now connected over interface [%s]; Active pCList: if[%s] chan[%d] flags[%08X].";
      int v43 = v38;
      uint32_t v44 = 34;
LABEL_64:
      _os_log_impl(&dword_218756000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
    }
  }
}

uint64_t GCKSessionEstablishConnection(uint64_t a1, int a2, int a3, int a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  uint64_t v7 = 2149187603;
  uint64_t v8 = CheckInHandleDebug();
  if (!v8) {
    return 2149187586;
  }
  uint64_t v9 = v8;
  uint64_t v10 = ICEGetCallInfoForConnectionData();
  if ((v10 & 0x80000000) != 0) {
    goto LABEL_34;
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v9 + 7192));
  for (uint64_t i = *(void *)(v9 + 7184); i; uint64_t i = *(void *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 768));
      *(_DWORD *)(i + 612) = a4;
      *(_DWORD *)(i + 620) = a3;
      if (a3) {
        BOOL v12 = 1;
      }
      else {
        BOOL v12 = *(void *)(v9 + 7520) != 0;
      }
      *(_DWORD *)(i + 616) = v12;
      if (a4) {
        BOOL v12 = 1;
      }
      *(_DWORD *)(i + 624) = v12;
      pthread_mutex_unlock((pthread_mutex_t *)(i + 768));
    }
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)(v9 + 7192));
  if (*(_DWORD *)(v9 + 416))
  {
    int v23 = gcks_log();
    uint64_t v7 = 2149187616;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
      GCKSessionEstablishConnection_cold_2();
    }
    goto LABEL_35;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v9 + 7080));
  uint64_t v13 = *(unsigned int *)(v9 + 708);
  if ((int)v13 > 15)
  {
    int v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Max number of nodes reached.", buf, 2u);
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7080));
    int v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      GCKSessionEstablishConnection_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    goto LABEL_35;
  }
  if ((int)v13 < 1)
  {
    LODWORD(v24) = 0;
  }
  else
  {
    uint64_t v24 = 0;
    int v25 = (int *)(v9 + 712);
    while (1)
    {
      int v26 = *v25;
      v25 += 2;
      if (v26 == a2) {
        break;
      }
      if (v13 == ++v24) {
        goto LABEL_28;
      }
    }
  }
  if (v24 == v13)
  {
LABEL_28:
    uint64_t v27 = v9 + 8 * v13;
    *(_DWORD *)(v27 + 712) = a2;
    *(_DWORD *)(v27 + 716) = -1;
    *(_DWORD *)(v9 + 708) = v13 + 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(v9 + 7080));
  int v28 = gcks_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v32 = a2;
    _os_log_impl(&dword_218756000, v28, OS_LOG_TYPE_DEFAULT, "Update ICE role for participant %08X.", buf, 8u);
  }
  ICEUpdateRole();
  uint64_t v10 = ICEStartConnectivityCheck();
  if ((v10 & 0x80000000) != 0)
  {
LABEL_34:
    uint64_t v7 = v10;
LABEL_35:
    CheckOutHandleDebug();
    return v7;
  }
  gckSessionChangeState(v9, a2);
  CheckOutHandleDebug();
  uint64_t v29 = gcks_log();
  uint64_t v7 = 0;
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    int v32 = a2;
    _os_log_impl(&dword_218756000, v29, OS_LOG_TYPE_DEFAULT, "ICE started with participant %08X.", buf, 8u);
    return 0;
  }
  return v7;
}

uint64_t gckSessionChangeState(uint64_t a1, int a2)
{
  uint64_t v4 = 2149187606;
  uint64_t v5 = (pthread_rwlock_t *)(a1 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
  for (uint64_t i = *(void *)(a1 + 7184); i; uint64_t i = *(void *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2)
    {
      pthread_mutex_lock((pthread_mutex_t *)(i + 768));
      uint64_t v4 = gckSessionChangeStateCList(a1, i);
      pthread_mutex_unlock((pthread_mutex_t *)(i + 768));
    }
  }
  pthread_rwlock_unlock(v5);
  return v4;
}

uint64_t GCKSessionDisposeConnection(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  uint64_t v4 = gckSessionChangeState(v3, a2);
  if ((v4 & 0x80000000) != 0)
  {
    uint64_t v5 = gcks_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      GCKSessionDisposeConnection_cold_1();
    }
  }
  CheckOutHandleDebug();
  return v4;
}

uint64_t GCKSessionDisposeAllConnections()
{
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 2149187586;
  }
  gckSessionDisposeAllConnections(v0);
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSendTo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, unsigned __int8 a9, unsigned int a10, int a11)
{
  uint64_t v11 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  int v73 = v12;
  int v74 = v13;
  int v15 = v14;
  int v17 = v16;
  uint64_t v19 = v18;
  int v21 = v20;
  uint64_t v75 = v22;
  uint64_t v23 = v11;
  uint64_t v82 = *MEMORY[0x263EF8340];
  memset(v79, 0, sizeof(v79));
  ((void (*)(void))MEMORY[0x270FA5388])();
  int v77 = (char *)v63 - v24;
  uint64_t v76 = CheckInHandleDebug();
  if (!v76) {
    return 2149187586;
  }
  v63[0] = v23;
  v63[1] = v63;
  *(void *)&v79[0] = v19;
  DWORD2(v79[0]) = v17;
  if (v21 < 1)
  {
    unsigned int v68 = -2145779666;
  }
  else
  {
    int v71 = a11;
    unsigned int v70 = a10;
    int v69 = a9;
    uint64_t v26 = v21;
    *(void *)&long long v25 = 67109120;
    long long v66 = v25;
    uint64_t v72 = v21;
    uint64_t v27 = v75;
    uint64_t v28 = v76;
    uint64_t v29 = v77;
    int v30 = v15;
    do
    {
      uint64_t NextHop = gckSessionFindNextHop(v28, *v27);
      *uint64_t v29 = NextHop;
      if (NextHop == -1)
      {
        uint64_t v33 = gcks_log();
        uint64_t NextHop = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT);
        if (NextHop)
        {
          int v34 = *v27;
          v81[0] = v66;
          v81[1] = v34;
          _os_log_impl(&dword_218756000, v33, OS_LOG_TYPE_DEFAULT, "No next hop for participant [%08X] in the routing table.", (uint8_t *)v81, 8u);
        }
        if (v15) {
          *int v30 = -2145779666;
        }
      }
      ++v30;
      ++v29;
      ++v27;
      --v26;
    }
    while (v26);
    uint64_t v35 = 0;
    int v67 = (pthread_mutex_t *)(v28 + 7080);
    int v36 = v15 + 1;
    int v37 = (unsigned int *)(v75 + 1);
    uint64_t v38 = v77 + 4;
    uint64_t v64 = (char *)(v28 + 433);
    uint64_t v39 = 1;
    unsigned int v68 = -2145779666;
    uint64_t v40 = v72;
    do
    {
      int v41 = *(_DWORD *)&v77[4 * v35];
      if (v41 == -1)
      {
        ++v35;
      }
      else
      {
        int v78 = v63;
        MEMORY[0x270FA5388](NextHop, v32);
        int v45 = (unsigned int *)((char *)v63 - ((v44 + 15) & 0x7FFFFFFF0));
        *int v45 = v75[v35];
        if (v15) {
          v15[v35] = v43;
        }
        ++v35;
        int v46 = v71;
        if (v35 >= v42)
        {
          uint64_t v52 = 1;
        }
        else
        {
          uint64_t v47 = 1;
          uint64_t v48 = v42;
          uint64_t v49 = v38;
          int v50 = v37;
          BOOL v51 = v36;
          do
          {
            if (*(_DWORD *)v49 == v41)
            {
              uint64_t v52 = (v47 + 1);
              v45[(int)v47] = *v50;
              *(_DWORD *)uint64_t v49 = v43;
              if (v15) {
                *BOOL v51 = v43;
              }
            }
            else
            {
              uint64_t v52 = v47;
            }
            ++v51;
            ++v50;
            v49 += 4;
            --v48;
            uint64_t v47 = v52;
          }
          while (v39 != v48);
        }
        uint64_t v53 = v76;
        uint64_t NextHop = OSPFMakeData((char *)v81, 4096, (uint64_t)v79, 0, v70, *(_DWORD *)(v76 + 416), v45, v52, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, void, uint64_t, void, void, int))(*(void *)(v76 + 408) + 24), *(void *)(*(void *)(v76 + 408) + 32), v73, v74, v69);
        if ((int)NextHop < 1)
        {
          int v54 = -2145779698;
        }
        else
        {
          uint64_t NextHop = SendUDPPacketToParticipantChannelID(v53, (uint64_t)v81, NextHop, v41, v46, -1, 1);
          int v54 = -2145779670;
          if (NextHop == -2145779670)
          {
            os_log_t v65 = (os_log_t)gcks_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              v80[0] = v66;
              v80[1] = v41;
              _os_log_impl(&dword_218756000, v65, OS_LOG_TYPE_DEFAULT, "SendUDPPacket failed with error GCK_E_INVALIDSOCKET (nextHop == %08X).", (uint8_t *)v80, 8u);
            }
            pthread_mutex_lock(v67);
            uint64_t v55 = *(void *)(v76 + 408);
            uint64_t v56 = *(unsigned int *)(v55 + 168);
            if ((int)v56 < 1)
            {
              LODWORD(v57) = 0;
            }
            else
            {
              uint64_t v57 = 0;
              while (*(_DWORD *)(v55 + 172 + 4 * v57) != v41)
              {
                if (v56 == ++v57)
                {
                  LODWORD(v57) = *(_DWORD *)(v55 + 168);
                  break;
                }
              }
            }
            if (v57 <= 0xF && v57 == v56)
            {
              *(_DWORD *)(v55 + 4 * v56 + 172) = v41;
              *(_DWORD *)(v55 + 168) = v56 + 1;
            }
            uint64_t v58 = *(unsigned int *)(v76 + 420);
            int v59 = v64;
            if ((int)v58 >= 1)
            {
              while (*(_DWORD *)(v59 - 9) != v41)
              {
                v59 += 416;
                if (!--v58) {
                  goto LABEL_44;
                }
              }
              PostEventCallback(v55, v41, 2, v59, *(v59 - 1), 0);
            }
LABEL_44:
            uint64_t NextHop = pthread_mutex_unlock(v67);
          }
          else
          {
            v68 &= (int)NextHop >> 31;
            int v54 = NextHop;
          }
        }
        uint64_t v40 = v72;
        uint64_t v60 = v72;
        uint64_t v61 = v15;
        do
        {
          if (v15)
          {
            if (*v61 == -1) {
              *uint64_t v61 = v54;
            }
          }
          ++v61;
          --v60;
        }
        while (v60);
      }
      ++v39;
      ++v36;
      ++v37;
      v38 += 4;
    }
    while (v35 != v40);
  }
  CheckOutHandleDebug();
  return v68;
}

uint64_t gckSessionFindNextHop(uint64_t a1, int a2)
{
  uint64_t v4 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  uint64_t v5 = *(unsigned int *)(a1 + 420);
  if ((int)v5 < 1)
  {
LABEL_5:
    uint64_t v7 = 0xFFFFFFFFLL;
  }
  else
  {
    int v6 = (unsigned int *)(a1 + 428);
    while (*(v6 - 1) != a2)
    {
      v6 += 104;
      if (!--v5) {
        goto LABEL_5;
      }
    }
    uint64_t v7 = *v6;
  }
  pthread_mutex_unlock(v4);
  return v7;
}

uint64_t GCKSessionRegisterReliableTransportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = CheckInHandleDebug();
  if (!v5) {
    return 2149187586;
  }
  uint64_t v6 = *(void *)(v5 + 408);
  *(void *)(v6 + 24) = a2;
  *(void *)(v6 + 32) = a3;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionStartEventCallbacks()
{
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 2149187586;
  }
  uint64_t started = StartEventCallbackThread(*(_DWORD **)(v0 + 408));
  if ((started & 0x80000000) != 0)
  {
    uint64_t v2 = gcks_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      GCKSessionStartEventCallbacks_cold_1();
    }
  }
  CheckOutHandleDebug();
  return started;
}

uint64_t GCKSessionGetInterfacesForParticipant(uint64_t a1, int a2, _DWORD *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = CheckInHandleDebug();
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = a2;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Getting interfaces for participant %08X.", buf, 8u);
    }
    pthread_rwlock_rdlock((pthread_rwlock_t *)(v6 + 7192));
    uint64_t v8 = *(void *)(v6 + 7184);
    if (v8)
    {
      int v9 = 0;
      do
      {
        if (*(_DWORD *)(v8 + 88) == a2)
        {
          v9 |= *(_DWORD *)(v8 + 380);
          uint64_t v10 = gcks_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            int v11 = *(_DWORD *)(v8 + 380);
            *(_DWORD *)buf = 67109120;
            int v15 = v11;
            _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Available interface type: %d.", buf, 8u);
          }
        }
        uint64_t v8 = *(void *)(v8 + 832);
      }
      while (v8);
    }
    else
    {
      int v9 = 0;
    }
    pthread_rwlock_unlock((pthread_rwlock_t *)(v6 + 7192));
    CheckOutHandleDebug();
    int v12 = gcks_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v15 = v9;
      _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "All available interface types: %d.", buf, 8u);
    }
    *a3 = v9;
  }
  return 0;
}

uint64_t GCKSessionSetHeartbeatTimeout(uint64_t a1, unsigned int a2)
{
  uint64_t v3 = 2149187586;
  uint64_t v4 = CheckInHandleDebug();
  if (v4)
  {
    if (*(_DWORD *)(v4 + 64))
    {
      *(double *)(v4 + 48) = (double)a2 / 55.0;
      *(double *)(v4 + 56) = (double)a2;
      CheckOutHandleDebug();
      return 0;
    }
    else
    {
      return 2149187588;
    }
  }
  return v3;
}

CFMutableStringRef gckSessionPListCopyDetailedDescription(pthread_mutex_t *a1)
{
  uint64_t v1 = a1 + 12;
  pthread_mutex_lock(a1 + 12);
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  IPPORTToString();
  IPPORTToString();
  CFStringAppendF();
  pthread_mutex_unlock(v1);
  return Mutable;
}

CFMutableStringRef GCKSessionCopyDetailedDescription()
{
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 0;
  }
  uint64_t v1 = v0;
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFStringAppendF();
  CFStringAppendF();
  CFStringAppendF();
  CFArrayRef v3 = *(const __CFArray **)(v1 + 7520);
  if (v3) {
    CFArrayGetCount(v3);
  }
  CFStringAppendF();
  CFStringAppendF();
  uint64_t v4 = (pthread_rwlock_t *)(v1 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v1 + 7192));
  if (*(void *)(v1 + 7184))
  {
    CFStringAppendF();
    for (uint64_t i = *(pthread_mutex_t **)(v1 + 7184); i; uint64_t i = (pthread_mutex_t *)i[13].__sig)
    {
      CFMutableStringRef v6 = gckSessionPListCopyDetailedDescription(i);
      if (v6)
      {
        CFMutableStringRef v7 = v6;
        CFStringAppendF();
        CFRelease(v7);
      }
    }
  }
  pthread_rwlock_unlock(v4);
  CheckOutHandleDebug();
  return Mutable;
}

uint64_t GCKSessionSetAWDLDisabled(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  *(_DWORD *)(v3 + 7536) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetPreferNCMOverEthernet(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  *(_DWORD *)(v3 + 7540) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionSetICETimeoutForced(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  *(_DWORD *)(v3 + 7544) = a2;
  CheckOutHandleDebug();
  return 0;
}

uint64_t GCKSessionCloseDirectConnectionsWithPeer(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  uint64_t v4 = gckSessionChangeState(v3, a2);
  CheckOutHandleDebug();
  return v4;
}

uint64_t gckSessionSendICEPacket(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, long long *a6)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v10 = 2149187606;
  uint64_t v11 = CheckInHandleDebug();
  if (!v11) {
    return 2149187586;
  }
  uint64_t v12 = v11;
  if (a5)
  {
    if (a6)
    {
      int v13 = gcks_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315394;
        uint64_t v23 = IPPORTToString();
        __int16 v24 = 2080;
        uint64_t v25 = IPPORTToString();
        _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Send ICE packet from %s to %s.", (uint8_t *)&v22, 0x16u);
      }
    }
  }
  uint64_t v14 = 2149187585;
  if (!a5) {
    goto LABEL_37;
  }
  if (!a6) {
    goto LABEL_37;
  }
  uint64_t v14 = 0;
  if (!a3 || !a4) {
    goto LABEL_37;
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v12 + 7192));
  uint64_t v15 = *(void *)(v12 + 7184);
  if (!v15) {
    goto LABEL_36;
  }
  int v16 = *(_DWORD *)a5 & 1;
  while ((*(_DWORD *)(v15 + 384) & 1) != v16)
  {
LABEL_23:
    if (*(_DWORD *)(v15 + 384)) {
      goto LABEL_26;
    }
    if (!*(_DWORD *)(v15 + 404)) {
      goto LABEL_31;
    }
LABEL_32:
    uint64_t v15 = *(void *)(v15 + 832);
    if (!v15) {
      goto LABEL_36;
    }
  }
  int v17 = (int *)(v15 + 404);
  if (!v16)
  {
    int v18 = *v17;
    if (v18 != *(_DWORD *)(a5 + 20))
    {
      if (!v18) {
        goto LABEL_31;
      }
      goto LABEL_32;
    }
    goto LABEL_22;
  }
  if (*(void *)v17 == *(void *)(a5 + 20) && *(void *)(v15 + 412) == *(void *)(a5 + 28))
  {
LABEL_22:
    if (*(unsigned __int16 *)(v15 + 420) == *(unsigned __int16 *)(a5 + 36)) {
      goto LABEL_35;
    }
    goto LABEL_23;
  }
LABEL_26:
  if (*(void *)(v15 + 404) != *MEMORY[0x263EF88F0]
    || *(void *)(v15 + 412) != *(void *)(MEMORY[0x263EF88F0] + 8))
  {
    goto LABEL_32;
  }
LABEL_31:
  if (*(unsigned __int16 *)(v15 + 420) != *(unsigned __int16 *)(a5 + 36)) {
    goto LABEL_32;
  }
LABEL_35:
  uint64_t v10 = SendUDPPacketCList(v15, a3, a4, a6, 0);
LABEL_36:
  pthread_rwlock_unlock((pthread_rwlock_t *)(v12 + 7192));
  uint64_t v14 = v10;
LABEL_37:
  CheckOutHandleDebug();
  return v14;
}

uint64_t gckSessionRecvICEPacketWithTimeout(uint64_t a1, int a2, void *a3, _DWORD *a4, uint64_t a5, uint64_t a6, void *a7, int a8)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  uint64_t v15 = 2149187614;
  uint64_t v16 = CheckInHandleDebug();
  if (!v16) {
    return 2149187586;
  }
  uint64_t v17 = v16;
  __dst = a3;
  double v18 = micro();
  uint64_t v19 = (pthread_mutex_t *)(v17 + 7400);
  pthread_mutex_lock((pthread_mutex_t *)(v17 + 7400));
  if (*(_DWORD *)(v17 + 8))
  {
LABEL_3:
    if (!*(_DWORD *)(v17 + 12)) {
      *(_DWORD *)(v17 + 8) = 0;
    }
    pthread_mutex_unlock((pthread_mutex_t *)(v17 + 7400));
    CheckOutHandleDebug();
  }
  else
  {
    int v20 = (void *)(v17 + 7392);
    double v21 = (double)a8 / 1000.0;
    while (1)
    {
      v41.tv_sec = 0;
      v41.tv_nsec = 0;
      uint64_t v22 = *v20;
      if (*v20) {
        break;
      }
LABEL_13:
      uint64_t v25 = v20;
      double v26 = v21 - (micro() - v18);
      if (v26 < 0.0)
      {
        unsigned int v39 = 0;
LABEL_33:
        if (*(_DWORD *)(v17 + 8)) {
          uint64_t v15 = 2149187614;
        }
        else {
          uint64_t v15 = v39;
        }
        goto LABEL_3;
      }
      v41.tv_sec = (int)v26;
      v41.tv_nsec = (uint64_t)((v26 - (double)(int)v26) * 1000000000.0);
      ++*(_DWORD *)(v17 + 12);
      int v27 = pthread_cond_timedwait_relative_np((pthread_cond_t *)(v17 + 7464), (pthread_mutex_t *)(v17 + 7400), &v41);
      --*(_DWORD *)(v17 + 12);
      if (v27)
      {
        unsigned int v39 = v27 | 0xC01A0000;
        if (v27 == 60) {
          unsigned int v39 = -2145779689;
        }
        goto LABEL_33;
      }
      int v28 = *(_DWORD *)(v17 + 8);
      if (*(_DWORD *)v17)
      {
        if (v28) {
          unsigned int v39 = -2145779682;
        }
        else {
          unsigned int v39 = 0;
        }
        goto LABEL_33;
      }
      int v20 = v25;
      if (v28) {
        goto LABEL_3;
      }
    }
    uint64_t v23 = v20;
    uint64_t v24 = *v20;
    if (a2)
    {
      while (*(_DWORD *)(v24 + 4108) != a2)
      {
        if (!*(void *)(v24 + 4200)) {
          goto LABEL_13;
        }
        uint64_t v23 = (void *)(v24 + 4200);
        uint64_t v24 = *(void *)(v24 + 4200);
      }
      uint64_t v22 = v24;
      uint64_t v29 = v23;
    }
    else
    {
      uint64_t v29 = v20;
    }
    size_t v30 = *(int *)(v22 + 4104);
    *a4 = v30;
    memcpy(__dst, (const void *)v22, v30);
    uint64_t v31 = *(void *)(v22 + 4144);
    long long v32 = *(_OWORD *)(v22 + 4128);
    *(_OWORD *)a5 = *(_OWORD *)(v22 + 4112);
    *(_OWORD *)(a5 + 16) = v32;
    *(void *)(a5 + 32) = v31;
    long long v34 = *(_OWORD *)(v22 + 4152);
    long long v33 = *(_OWORD *)(v22 + 4168);
    *(void *)(a6 + 32) = *(void *)(v22 + 4184);
    *(_OWORD *)a6 = v34;
    *(_OWORD *)(a6 + 16) = v33;
    if (a7) {
      *a7 = *(void *)(v22 + 4192);
    }
    uint64_t v35 = gcks_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = IPPORTToString();
      uint64_t v37 = IPPORTToString();
      *(_DWORD *)buf = 136315394;
      uint64_t v43 = v36;
      __int16 v44 = 2080;
      uint64_t v45 = v37;
      _os_log_impl(&dword_218756000, v35, OS_LOG_TYPE_DEFAULT, "Received ICE packet from %s to %s.", buf, 0x16u);
    }
    *uint64_t v29 = *(void *)(v22 + 4200);
    free((void *)v22);
    pthread_mutex_unlock(v19);
    CheckOutHandleDebug();
    return 0;
  }
  return v15;
}

uint64_t gckSessionConnectedCallback(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v150 = *MEMORY[0x263EF8340];
  uint64_t v4 = CheckInHandleDebug();
  if (!v4) {
    return 2149187586;
  }
  uint64_t v5 = v4;
  __int16 v121 = (pthread_rwlock_t *)(v4 + 7192);
  pthread_rwlock_rdlock((pthread_rwlock_t *)(v4 + 7192));
  uint64_t v6 = *(void *)(v5 + 7184);
  for (i = 1; v6; uint64_t v6 = *(void *)(v6 + 832))
  {
    if (*(_DWORD *)(v6 + 88) == a2)
    {
      int v8 = 0;
      atomic_compare_exchange_strong_explicit((atomic_uint *volatile)(v6 + 68), (unsigned int *)&v8, 1u, memory_order_relaxed, memory_order_relaxed);
      BOOL i = v8 == 0;
    }
  }
  pthread_rwlock_unlock(v121);
  if (a3)
  {
    uint64_t v119 = v5;
    uint64_t v9 = 0;
    do
    {
      uint64_t v10 = gcks_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = *(_DWORD *)(a3 + 16);
        uint64_t v12 = IPPORTToString();
        uint64_t v13 = IPPORTToString();
        uint64_t v14 = IPPORTToString();
        uint64_t v15 = IPPORTToString();
        *(_DWORD *)buf = 67110914;
        *(_DWORD *)&uint8_t buf[4] = a2;
        LOWORD(v124) = 1024;
        *(_DWORD *)((char *)&v124 + 2) = v11;
        HIWORD(v124) = 2080;
        int v125 = (uint64_t (*)(uint64_t))v12;
        *(_WORD *)uint64_t v126 = 2080;
        *(void *)&v126[2] = v13;
        *(_WORD *)&v126[10] = 2080;
        *(void *)&v126[12] = v14;
        *(_WORD *)int v127 = 2080;
        *(void *)&v127[2] = v15;
        *(_WORD *)&v127[10] = 2080;
        uint64_t v128 = a3 + 32;
        __int16 v129 = 1024;
        BOOL v130 = i;
        _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "ICE check succeeded with participant %08X: proto %d local[%s], src[%s] <-> dst[%s], remote[%s] (on interface[%s]), first ICE result [%d].", buf, 0x46u);
      }
      if (*(_DWORD *)(a3 + 16) == 6)
      {
        uint64_t v16 = gcks_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, "Proto GCK found.", buf, 2u);
        }
        if (!v9) {
          uint64_t v9 = a3;
        }
      }
      a3 = *(void *)(a3 + 304);
    }
    while (a3);
    uint64_t v5 = v119;
    if (v9)
    {
      uint64_t v17 = gcks_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = *(_DWORD *)(v119 + 416);
        uint64_t v19 = IPPORTToString();
        uint64_t v20 = IPPORTToString();
        uint64_t v21 = IPPORTToString();
        uint64_t v22 = IPPORTToString();
        *(_DWORD *)buf = 67110402;
        *(_DWORD *)&uint8_t buf[4] = a2;
        LOWORD(v124) = 1024;
        *(_DWORD *)((char *)&v124 + 2) = v18;
        HIWORD(v124) = 2080;
        int v125 = (uint64_t (*)(uint64_t))v19;
        *(_WORD *)uint64_t v126 = 2080;
        *(void *)&v126[2] = v20;
        *(_WORD *)&v126[10] = 2080;
        *(void *)&v126[12] = v21;
        *(_WORD *)int v127 = 2080;
        *(void *)&v127[2] = v22;
        _os_log_impl(&dword_218756000, v17, OS_LOG_TYPE_DEFAULT, "ICE completed with participant %08X (I am %08X): local[%s], src[%s] <-> dst[%s], remote[%s].", buf, 0x36u);
      }
      uint64_t v23 = v9;
      do
      {
        if (*(_DWORD *)(v23 + 16) != 6) {
          goto LABEL_39;
        }
        uint64_t v24 = (_DWORD *)(v23 + 28);
        pthread_rwlock_wrlock(v121);
        uint64_t v25 = *(void *)(v5 + 7184);
        if (!v25)
        {
LABEL_35:
          pthread_rwlock_unlock(v121);
          int v27 = gcks_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v28 = IPPORTToString();
            uint64_t v29 = IPPORTToString();
            uint64_t v30 = IPPORTToString();
            uint64_t v31 = IPPORTToString();
            *(_DWORD *)int v131 = 67110402;
            int v132 = -1;
            __int16 v133 = 1024;
            int v134 = a2;
            __int16 v135 = 2080;
            uint64_t v136 = v28;
            __int16 v137 = 2080;
            uint64_t v138 = v29;
            __int16 v139 = 2080;
            uint64_t v140 = v30;
            __int16 v141 = 2080;
            uint64_t v142 = v31;
            _os_log_impl(&dword_218756000, v27, OS_LOG_TYPE_DEFAULT, "Failed to setup channel %d with participant %08X: local[%s], src[%s] <-> dst[%s], remote[%s].", v131, 0x36u);
          }
          *(_DWORD *)uint64_t v23 = -1;
          goto LABEL_38;
        }
        while (1)
        {
          if ((*(_DWORD *)(v25 + 84) & 0x80000000) == 0
            || *(_DWORD *)(v25 + 88) != a2
            || (*v24 & 1) != (*(_DWORD *)(v25 + 384) & 1))
          {
            goto LABEL_34;
          }
          if (*v24)
          {
            if (*(void *)(v23 + 48) != *(void *)(v25 + 404) || *(void *)(v23 + 56) != *(void *)(v25 + 412)) {
              goto LABEL_34;
            }
          }
          else if (*(_DWORD *)(v23 + 48) != *(_DWORD *)(v25 + 404))
          {
            goto LABEL_34;
          }
          if (*(unsigned __int16 *)(v23 + 64) == *(unsigned __int16 *)(v25 + 420)) {
            break;
          }
LABEL_34:
          uint64_t v25 = *(void *)(v25 + 832);
          if (!v25) {
            goto LABEL_35;
          }
        }
        long long v32 = gcks_log();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v118 = *(_DWORD *)(v25 + 72);
          uint64_t v33 = IPPORTToString();
          uint64_t v34 = IPPORTToString();
          uint64_t v35 = IPPORTToString();
          uint64_t v36 = IPPORTToString();
          *(_DWORD *)int v131 = 67110402;
          int v132 = v118;
          __int16 v133 = 1024;
          int v134 = a2;
          __int16 v135 = 2080;
          uint64_t v136 = v33;
          __int16 v137 = 2080;
          uint64_t v138 = v34;
          __int16 v139 = 2080;
          uint64_t v140 = v35;
          __int16 v141 = 2080;
          uint64_t v142 = v36;
          _os_log_impl(&dword_218756000, v32, OS_LOG_TYPE_DEFAULT, "Setup channel %d with participant %08X: local[%s], src[%s] <-> dst[%s], remote[%s].", v131, 0x36u);
        }
        gckSessionUpdateDstIPPortAndSockAddrForCList(v25, (long long *)(v23 + 148));
        *(_DWORD *)(v25 + 84) = 0;
        *(_DWORD *)(v25 + 608) = *(_DWORD *)(v23 + 268);
        *(double *)(v25 + 704) = micro();
        *(_DWORD *)(v25 + 712) = 1;
        *(_DWORD *)uint64_t v23 = *(_DWORD *)(v25 + 72);
        if (!*(_DWORD *)(v25 + 68)) {
          *(_DWORD *)(v25 + 68) = 1;
        }
        pthread_rwlock_unlock(v121);
LABEL_38:
        uint64_t v5 = v119;
LABEL_39:
        uint64_t v23 = *(void *)(v23 + 304);
      }
      while (v23);
      gckSessionUpdateNode(v5, a2, *(_DWORD *)(v9 + 268), 0);
      if (i) {
        gckSessionChangeState(v5, a2);
      }
      CFAllocatorRef alloc = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CFStringRef theString = (const __CFString *)*MEMORY[0x263F16E50];
      CFStringRef config = (const __CFString *)*MEMORY[0x263F16E58];
      while (1)
      {
        if (*(_DWORD *)(v9 + 16) == 6)
        {
          BOOL v38 = (*(unsigned char *)(v9 + 28) & 4) == 0 && ((*(_DWORD *)(v9 + 68) >> 2) & 1) == 0;
          int v39 = *(_DWORD *)v9;
          pthread_rwlock_rdlock(v121);
          uint64_t CListFromParticipantChanId = FindCListFromParticipantChanId(v5, a2, v39);
          if (!CListFromParticipantChanId)
          {
            int v63 = gcks_log();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)uint64_t v144 = 67109376;
              *(_DWORD *)uint64_t v145 = a2;
              *(_WORD *)&v145[4] = 1024;
              *(_DWORD *)&v145[6] = v39;
              _os_log_error_impl(&dword_218756000, v63, OS_LOG_TYPE_ERROR, "Something is terribly wrong; no clist for remoteID [%d] channelID [%d].",
                v144,
                0xEu);
            }
            goto LABEL_92;
          }
          uint64_t v41 = CListFromParticipantChanId;
          if ((v39 & 0x80000000) == 0)
          {
            uint64_t v42 = gcks_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)uint64_t v144 = 67109376;
              *(_DWORD *)uint64_t v145 = a2;
              *(_WORD *)&v145[4] = 1024;
              *(_DWORD *)&v145[6] = v39;
              _os_log_impl(&dword_218756000, v42, OS_LOG_TYPE_DEFAULT, "Connected to participant %08X on channel %d.", v144, 0xEu);
            }
            if (v38)
            {
              uint64_t v43 = gcks_log();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)uint64_t v144 = 67109120;
                *(_DWORD *)uint64_t v145 = v39;
                _os_log_impl(&dword_218756000, v43, OS_LOG_TYPE_DEFAULT, "Quick disconnect enabled on channel %d.", v144, 8u);
              }
              *(void *)(v41 + 360) = *(void *)(v5 + 56);
            }
          }
          int v44 = *(_DWORD *)(v5 + 416);
          int v45 = *(_DWORD *)(v41 + 88);
          *(void *)buf = MEMORY[0x263EF8330];
          uint64_t v124 = 0x40000000;
          int v125 = __gckSessionSetupChannelWithDTLS_block_invoke;
          *(void *)uint64_t v126 = &__block_descriptor_tmp_87;
          *(void *)&v126[8] = v5;
          *(_DWORD *)&v126[16] = a2;
          *(_DWORD *)int v127 = v39;
          *(_DWORD *)&uint8_t v127[4] = v44;
          *(_DWORD *)&v127[8] = v45;
          if (*(_DWORD *)(v41 + 624))
          {
            uint64_t v46 = gcks_log();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)uint64_t v144 = 0;
              _os_log_impl(&dword_218756000, v46, OS_LOG_TYPE_DEFAULT, "Initialization. Changing state to DTLSNotConnected.", v144, 2u);
            }
            *(_DWORD *)(v41 + 640) = 0;
            int v47 = *(void *)(v5 + 7520) != 0;
            BOOL v48 = v47;
            if (*(_DWORD *)(v41 + 620) == v47) {
              BOOL v48 = *(_DWORD *)(v41 + 88) < *(_DWORD *)(v5 + 416);
            }
            uint64_t v49 = gcks_log();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              int v50 = *(_DWORD *)(v41 + 88);
              int v51 = *(_DWORD *)(v41 + 616);
              int v52 = *(_DWORD *)(v41 + 612);
              int v53 = *(_DWORD *)(v41 + 620);
              *(_DWORD *)uint64_t v144 = 67110400;
              *(_DWORD *)uint64_t v145 = v50;
              *(_WORD *)&v145[4] = 1024;
              *(_DWORD *)&v145[6] = v51;
              __int16 v146 = 1024;
              *(_DWORD *)v147 = v52;
              *(_WORD *)&v147[4] = 1024;
              *(_DWORD *)&v147[6] = v47;
              LOWORD(v148) = 1024;
              *(_DWORD *)((char *)&v148 + 2) = v53;
              HIWORD(v148) = 1024;
              BOOL v149 = v48;
              _os_log_impl(&dword_218756000, v49, OS_LOG_TYPE_DEFAULT, "DTLS Settings for participant [%08X]: authentication [%d] encryption [%d] localIdentitySet [%d] remoteIdentitySet [%d], isServer [%d].", v144, 0x26u);
            }
            CFArrayRef v54 = *(const __CFArray **)(v5 + 7520);
            pthread_mutex_lock((pthread_mutex_t *)(v41 + 768));
            SSLContextRef v55 = SSLCreateContext(alloc, (SSLProtocolSide)!v48, kSSLDatagramType);
            if (v55)
            {
              uint64_t v56 = v55;
              *(void *)(v41 + 632) = v55;
              *(void *)(v41 + 648) = _Block_copy(buf);
              OSStatus v57 = SSLSetMaxDatagramRecordSize(v56, 0x4C7uLL);
              if (v57)
              {
                OSStatus v58 = v57;
                int v59 = gcks_log();
                if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
                {
                  int v60 = *(_DWORD *)(v41 + 88);
                  *(_DWORD *)uint64_t v144 = 67109376;
                  *(_DWORD *)uint64_t v145 = v60;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v58;
                  uint64_t v61 = v59;
                  int v62 = "Failed to set maximum datagram size for participant [%08X] with error %d.";
                  goto LABEL_87;
                }
LABEL_89:
                pthread_mutex_unlock((pthread_mutex_t *)(v41 + 768));
                uint64_t v75 = gcks_log();
                if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                {
                  int v76 = *(_DWORD *)(v41 + 88);
                  int v77 = *(_DWORD *)(v41 + 72);
                  uint64_t v78 = *(void *)(v41 + 632);
                  *(_DWORD *)uint64_t v144 = 67109888;
                  *(_DWORD *)uint64_t v145 = v76;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v77;
                  __int16 v146 = 2048;
                  *(void *)v147 = v78;
                  *(_WORD *)&v147[8] = 2048;
                  uint64_t v148 = v41;
                  _os_log_error_impl(&dword_218756000, v75, OS_LOG_TYPE_ERROR, "SetupDTLSContext failed for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", v144, 0x22u);
                }
                pthread_mutex_lock((pthread_mutex_t *)(v41 + 768));
                uint64_t v5 = v119;
                gckSessionChangeStateCList(v119, v41);
                pthread_mutex_unlock((pthread_mutex_t *)(v41 + 768));
LABEL_92:
                pthread_rwlock_unlock(v121);
                goto LABEL_93;
              }
              OSStatus v67 = SSLSetIOFuncs(v56, (SSLReadFunc)DTLS_SocketRead, (SSLWriteFunc)DTLS_SocketWrite);
              if (v67)
              {
                OSStatus v68 = v67;
                int v69 = gcks_log();
                if (!os_log_type_enabled(v69, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_89;
                }
                int v70 = *(_DWORD *)(v41 + 88);
                *(_DWORD *)uint64_t v144 = 67109376;
                *(_DWORD *)uint64_t v145 = v70;
                *(_WORD *)&v145[4] = 1024;
                *(_DWORD *)&v145[6] = v68;
                uint64_t v61 = v69;
                int v62 = "Failed to set IO functions for participant [%08X] with error %d.";
                goto LABEL_87;
              }
              OSStatus v71 = SSLSetConnection(v56, (SSLConnectionRef)v41);
              if (v71)
              {
                OSStatus v72 = v71;
                int v73 = gcks_log();
                if (!os_log_type_enabled(v73, OS_LOG_TYPE_ERROR)) {
                  goto LABEL_89;
                }
                int v74 = *(_DWORD *)(v41 + 88);
                *(_DWORD *)uint64_t v144 = 67109376;
                *(_DWORD *)uint64_t v145 = v74;
                *(_WORD *)&v145[4] = 1024;
                *(_DWORD *)&v145[6] = v72;
                uint64_t v61 = v73;
                int v62 = "Failed to set connection for participant [%08X] with error %d.";
                goto LABEL_87;
              }
              if (v54)
              {
                int v79 = gcks_log();
                if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                {
                  int v80 = *(_DWORD *)(v41 + 88);
                  *(_DWORD *)uint64_t v144 = 67109120;
                  *(_DWORD *)uint64_t v145 = v80;
                  _os_log_impl(&dword_218756000, v79, OS_LOG_TYPE_DEFAULT, "Setting certificate for participant [%08X].", v144, 8u);
                }
                OSStatus v81 = SSLSetCertificate(v56, v54);
                if (v81)
                {
                  OSStatus v82 = v81;
                  int v83 = gcks_log();
                  if (!os_log_type_enabled(v83, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_89;
                  }
                  int v84 = *(_DWORD *)(v41 + 88);
                  *(_DWORD *)uint64_t v144 = 67109376;
                  *(_DWORD *)uint64_t v145 = v84;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v82;
                  uint64_t v61 = v83;
                  int v62 = "Failed to set certificate for participant [%08X] with error %d.";
                  goto LABEL_87;
                }
              }
              if (*(_DWORD *)(v41 + 620))
              {
                if (v48)
                {
                  int v85 = gcks_log();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
                  {
                    int v86 = *(_DWORD *)(v41 + 88);
                    *(_DWORD *)uint64_t v144 = 67109120;
                    *(_DWORD *)uint64_t v145 = v86;
                    _os_log_impl(&dword_218756000, v85, OS_LOG_TYPE_DEFAULT, "Setting client side authentication for participant [%08X].", v144, 8u);
                  }
                  OSStatus v87 = SSLSetClientSideAuthenticate(v56, kAlwaysAuthenticate);
                  if (v87)
                  {
                    OSStatus v88 = v87;
                    uint64_t v89 = gcks_log();
                    if (!os_log_type_enabled(v89, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_89;
                    }
                    int v90 = *(_DWORD *)(v41 + 88);
                    *(_DWORD *)uint64_t v144 = 67109376;
                    *(_DWORD *)uint64_t v145 = v90;
                    *(_WORD *)&v145[4] = 1024;
                    *(_DWORD *)&v145[6] = v88;
                    uint64_t v61 = v89;
                    int v62 = "Failed to set client side authentication for participant [%08X] with error %d.";
                    goto LABEL_87;
                  }
                  SSLSessionOption v91 = kSSLSessionOptionBreakOnClientAuth;
                }
                else
                {
                  SSLSessionOption v91 = kSSLSessionOptionBreakOnServerAuth;
                }
                OSStatus v92 = SSLSetSessionOption(v56, v91, 1u);
                if (v92)
                {
                  OSStatus v93 = v92;
                  uint64_t v94 = gcks_log();
                  if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_89;
                  }
                  int v95 = *(_DWORD *)(v41 + 88);
                  *(_DWORD *)uint64_t v144 = 67109376;
                  *(_DWORD *)uint64_t v145 = v95;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v93;
                  uint64_t v61 = v94;
                  int v62 = "Failed to set session option for participant [%08X] with error %d.";
                  goto LABEL_87;
                }
              }
              int v96 = *(_DWORD *)(v41 + 612);
              if (!*(_DWORD *)(v41 + 616))
              {
                if (v96)
                {
                  __int16 v104 = gcks_log();
                  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
                  {
                    CStringPtr = CFStringGetCStringPtr(config, 0x8000100u);
                    *(_DWORD *)uint64_t v144 = 136315138;
                    *(void *)uint64_t v145 = CStringPtr;
                    _os_log_impl(&dword_218756000, v104, OS_LOG_TYPE_DEFAULT, "Auth=yes, encryption=no: setting session config to %s.", v144, 0xCu);
                  }
                  OSStatus v106 = SSLSetSessionConfig(v56, config);
                  if (v106)
                  {
                    OSStatus v101 = v106;
                    __int16 v102 = gcks_log();
                    if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_89;
                    }
                    goto LABEL_119;
                  }
                }
LABEL_131:
                pthread_mutex_unlock((pthread_mutex_t *)(v41 + 768));
                addrinfo v112 = gcks_log();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
                {
                  int v113 = *(_DWORD *)(v41 + 88);
                  int v114 = *(_DWORD *)(v41 + 72);
                  uint64_t v115 = *(void *)(v41 + 632);
                  *(_DWORD *)uint64_t v144 = 67109888;
                  *(_DWORD *)uint64_t v145 = v113;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v114;
                  __int16 v146 = 2048;
                  *(void *)v147 = v115;
                  *(_WORD *)&v147[8] = 2048;
                  uint64_t v148 = v41;
                  _os_log_impl(&dword_218756000, v112, OS_LOG_TYPE_DEFAULT, "DTLSContext has been set up for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", v144, 0x22u);
                }
                *(double *)(v41 + 720) = micro();
                uint64_t v5 = v119;
                gckSessionScheduleDTLSHandshake(v119, v41);
                goto LABEL_92;
              }
              int v97 = gcks_log();
              BOOL v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT);
              if (v96)
              {
                if (v98)
                {
                  int v99 = CFStringGetCStringPtr(theString, 0x8000100u);
                  *(_DWORD *)uint64_t v144 = 136315138;
                  *(void *)uint64_t v145 = v99;
                  _os_log_impl(&dword_218756000, v97, OS_LOG_TYPE_DEFAULT, "Auth=yes, encryption=yes: setting session config to %s.", v144, 0xCu);
                }
                OSStatus v100 = SSLSetSessionConfig(v56, theString);
                if (v100)
                {
                  OSStatus v101 = v100;
                  __int16 v102 = gcks_log();
                  if (!os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_89;
                  }
LABEL_119:
                  int v103 = *(_DWORD *)(v41 + 88);
                  *(_DWORD *)uint64_t v144 = 67109376;
                  *(_DWORD *)uint64_t v145 = v103;
                  *(_WORD *)&v145[4] = 1024;
                  *(_DWORD *)&v145[6] = v101;
                  uint64_t v61 = v102;
                  int v62 = "Failed to set session config for participant [%08X] with error %d.";
                  goto LABEL_87;
                }
                goto LABEL_131;
              }
              if (v98)
              {
                int v107 = *(_DWORD *)(v41 + 88);
                *(_DWORD *)uint64_t v144 = 67109120;
                *(_DWORD *)uint64_t v145 = v107;
                _os_log_impl(&dword_218756000, v97, OS_LOG_TYPE_DEFAULT, "Setting ciphers for: Authentication YES, encryption NO for participant [%08X].", v144, 8u);
              }
              *(_DWORD *)ciphers = 131131;
              OSStatus v108 = SSLSetEnabledCiphers(v56, ciphers, 2uLL);
              if (!v108) {
                goto LABEL_131;
              }
              OSStatus v109 = v108;
              int v110 = gcks_log();
              if (!os_log_type_enabled(v110, OS_LOG_TYPE_ERROR)) {
                goto LABEL_89;
              }
              int v111 = *(_DWORD *)(v41 + 88);
              *(_DWORD *)uint64_t v144 = 67109376;
              *(_DWORD *)uint64_t v145 = v111;
              *(_WORD *)&v145[4] = 1024;
              *(_DWORD *)&v145[6] = v109;
              uint64_t v61 = v110;
              int v62 = "Failed to set enabled ciphers for participant [%08X] with error %d.";
LABEL_87:
              uint32_t v66 = 14;
            }
            else
            {
              uint64_t v64 = gcks_log();
              if (!os_log_type_enabled(v64, OS_LOG_TYPE_ERROR)) {
                goto LABEL_89;
              }
              int v65 = *(_DWORD *)(v41 + 88);
              *(_DWORD *)uint64_t v144 = 67109120;
              *(_DWORD *)uint64_t v145 = v65;
              uint64_t v61 = v64;
              int v62 = "Failed to create context for participant [%08X].";
              uint32_t v66 = 8;
            }
            _os_log_error_impl(&dword_218756000, v61, OS_LOG_TYPE_ERROR, v62, v144, v66);
            goto LABEL_89;
          }
          *(void *)(v41 + 648) = _Block_copy(buf);
          pthread_mutex_lock((pthread_mutex_t *)(v41 + 768));
          *(_DWORD *)(v41 + 628) = 1;
          pthread_mutex_unlock((pthread_mutex_t *)(v41 + 768));
          pthread_rwlock_unlock(v121);
          PostEventCallback(*(void *)(v5 + 408), a2, 6, 0, 0, 0);
        }
LABEL_93:
        uint64_t v9 = *(void *)(v9 + 304);
        if (!v9) {
          goto LABEL_47;
        }
      }
    }
  }
  *(_DWORD *)buf = 0;
  gckSessionUpdateNode(v5, a2, -1, (int *)buf);
  gckSessionChangeState(v5, a2);
LABEL_47:
  gckSessionCheckPendingConnections(v5, 1);
  CheckOutHandleDebug();
  return 0;
}

uint64_t gckSessionCancelRecvUDP()
{
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 2149187586;
  }
  uint64_t v1 = gckSessionCancelRecvUDPInternal(v0);
  CheckOutHandleDebug();
  return v1;
}

uint64_t gckSessionICEListRemoveCallback(uint64_t a1, int a2)
{
  uint64_t v3 = CheckInHandleDebug();
  if (!v3) {
    return 2149187586;
  }
  gckCallICEListRemoveSignalBlock(v3, a2);
  CheckOutHandleDebug();
  return 0;
}

uint64_t SendUDPPacketCList(uint64_t a1, uint64_t a2, int a3, long long *a4, int a5)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v25 = 0;
  double v26 = &v25;
  uint64_t v27 = 0x2000000000;
  int v28 = -2145779690;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2000000000;
  v24[3] = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = 0;
  int v22 = 0;
  uint64_t v21 = 0;
  if (!a4)
  {
    a4 = (long long *)(a1 + 424);
    uint64_t v10 = (void *)(a1 + 444);
    if (*(unsigned char *)(a1 + 424))
    {
      if (*v10 != *MEMORY[0x263EF88F0] || *(void *)(a1 + 452) != *(void *)(MEMORY[0x263EF88F0] + 8)) {
        goto LABEL_2;
      }
    }
    else if (*(_DWORD *)v10)
    {
      goto LABEL_2;
    }
    uint64_t v12 = 0;
    goto LABEL_21;
  }
LABEL_2:
  if (a5)
  {
    gckSessionUpdateDstIPPortAndSockAddrForCList(a1, a4);
    int v23 = *(_DWORD *)(a1 + 592);
    uint64_t v9 = a1 + 464;
  }
  else if (*(unsigned char *)(a1 + 384))
  {
    int v23 = 28;
    uint64_t v9 = IPPORTToSA6();
  }
  else
  {
    int v23 = 16;
    uint64_t v9 = IPPORTToSA();
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 0x40000000;
  v16[2] = __SendUDPPacketCList_block_invoke;
  v16[3] = &unk_2643383E8;
  v16[6] = a1;
  v16[7] = v9;
  int v17 = a5;
  int v18 = v23;
  v16[4] = &v25;
  v16[5] = v24;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 768));
  uint64_t v13 = OSPFAddDynamicOptions(a2, a3, (uint64_t)v16);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 768));
  if (v13)
  {
    do
    {
      uint64_t v14 = *(void *)(v13 + 8);
      if (*(void *)v13) {
        free(*(void **)v13);
      }
      free((void *)v13);
      uint64_t v13 = v14;
    }
    while (v14);
  }
  uint64_t v12 = *((unsigned int *)v26 + 6);
LABEL_21:
  _Block_object_dispose(v24, 8);
  _Block_object_dispose(&v25, 8);
  return v12;
}

void gckSessionUpdateDstIPPortAndSockAddrForCList(uint64_t a1, long long *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v4 = a1 + 424;
    if ((*(_DWORD *)a2 & 1) == (*(_DWORD *)(a1 + 424) & 1))
    {
      if (*(_DWORD *)a2)
      {
        if (*(void *)((char *)a2 + 20) != *(void *)(a1 + 444)
          || *(void *)((char *)a2 + 28) != *(void *)(a1 + 452))
        {
          goto LABEL_12;
        }
      }
      else if (*((_DWORD *)a2 + 5) != *(_DWORD *)(a1 + 444))
      {
        goto LABEL_12;
      }
      if (*((unsigned __int16 *)a2 + 18) == *(unsigned __int16 *)(a1 + 460)) {
        return;
      }
    }
LABEL_12:
    uint64_t v6 = gcks_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 88);
      int v8 = *(_DWORD *)(a1 + 72);
      v12[0] = 67109890;
      v12[1] = v7;
      __int16 v13 = 1024;
      int v14 = v8;
      __int16 v15 = 2080;
      uint64_t v16 = IPPORTToString();
      __int16 v17 = 2080;
      uint64_t v18 = IPPORTToString();
      _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Update destination IPPort for participant %08X, channel %d from %s to %s.", (uint8_t *)v12, 0x22u);
    }
    long long v9 = *a2;
    long long v10 = a2[1];
    *(void *)(v4 + 32) = *((void *)a2 + 4);
    *(_OWORD *)uint64_t v4 = v9;
    *(_OWORD *)(v4 + 16) = v10;
    if (*(unsigned char *)(a1 + 384))
    {
      v12[0] = 28;
      IPPORTToSA6();
    }
    else
    {
      v12[0] = 16;
      IPPORTToSA();
    }
    *(_DWORD *)(a1 + 592) = v12[0];
    return;
  }
  int v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v12[0]) = 0;
    _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Invalid parameter.", (uint8_t *)v12, 2u);
  }
}

BOOL __SendUDPPacketCList_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  if (!*(_DWORD *)(a1 + 64) || (uint64_t v3 = *(void *)(a1 + 48), !*(_DWORD *)(v3 + 624)))
  {
    memset(&data.msg_namelen, 0, 40);
    *(_OWORD *)processed = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v8 = *(unsigned int *)(a2 + 24);
    if ((int)v8 >= 1)
    {
      uint64_t v9 = 0;
      long long v10 = (size_t *)(*(void *)(a2 + 16) + 8);
      int v11 = &processed[1];
      do
      {
        *(v11 - 1) = *(v10 - 1);
        size_t v12 = *v10;
        v10 += 2;
        *int v11 = v12;
        v11 += 2;
        ++v9;
      }
      while (v8 != v9);
      data.msg_iovlen = v9;
    }
    data.msg_iov = (iovec *)processed;
    __int16 v13 = *(int **)(a1 + 48);
    data.msg_name = *(void **)(a1 + 56);
    data.msg_namelen = *(_DWORD *)(a1 + 68);
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = sendmsg(*v13, &data, 0);
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) == -1)
    {
      int v14 = gcks_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v15 = __error();
        uint64_t v16 = strerror(*v15);
        int v17 = *__error();
        int v22 = 136315394;
        int v23 = v16;
        __int16 v24 = 1024;
        int v25 = v17;
        _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Sendmsg failed with error %s (%d).", (uint8_t *)&v22, 0x12u);
      }
      goto LABEL_18;
    }
LABEL_19:
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    *(double *)(*(void *)(a1 + 48) + 48) = micro();
    return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 0;
  }
  uint64_t v4 = *(unsigned int *)(a2 + 24);
  if ((int)v4 < 1)
  {
    size_t v5 = 0;
  }
  else
  {
    size_t v5 = 0;
    uint64_t v6 = (size_t *)(*(void *)(a2 + 16) + 8);
    do
    {
      memcpy((char *)&data + v5, (const void *)*(v6 - 1), *v6);
      size_t v7 = *v6;
      v6 += 2;
      v5 += v7;
      --v4;
    }
    while (v4);
  }
  processed[0] = 0;
  OSStatus v18 = SSLWrite(*(SSLContextRef *)(v3 + 632), &data, v5, processed);
  if (!v18) {
    goto LABEL_19;
  }
  int v19 = v18;
  uint64_t v20 = gcks_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    __SendUDPPacketCList_block_invoke_cold_1((uint64_t *)(a1 + 48), v19, v20);
  }
LABEL_18:
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = *__error() | 0xC01A0000;
  return *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) >= 0;
}

const char *DTLSErrorName(int a1)
{
  if ((a1 + 9851) > 0x33) {
    return "?";
  }
  else {
    return off_264338510[a1 + 9851];
  }
}

uint64_t gckSessionUpdateNode(uint64_t a1, int a2, int a3, int *a4)
{
  uint64_t v8 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  uint64_t v9 = *(unsigned int *)(a1 + 708);
  if ((int)v9 >= 1)
  {
    uint64_t v10 = 0;
    int v11 = (_DWORD *)(a1 + 716);
    while (*(v11 - 1) != a2)
    {
      ++v10;
      v11 += 2;
      if (v9 == v10)
      {
        BOOL v12 = 0;
        LODWORD(v10) = *(_DWORD *)(a1 + 708);
        if (a4) {
          goto LABEL_10;
        }
        goto LABEL_17;
      }
    }
    *int v11 = a3;
    BOOL v12 = (int)v9 > 1;
    if (!a4) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  LODWORD(v10) = 0;
  BOOL v12 = 0;
  if (a4)
  {
LABEL_10:
    int v14 = v10 == v9 && (int)v9 > 0 || v12;
    *a4 = v14;
  }
LABEL_17:

  return pthread_mutex_unlock(v8);
}

void gckSessionCheckPendingConnections(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (a2) {
    pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  uint64_t v4 = *(unsigned int *)(a1 + 420);
  if ((int)v4 < 1)
  {
    int v5 = 0;
  }
  else
  {
    int v5 = 0;
    uint64_t v6 = (_DWORD *)(a1 + 428);
    do
    {
      if (*v6 == -1) {
        ++v5;
      }
      v6 += 104;
      --v4;
    }
    while (v4);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  uint64_t v7 = *(void *)(a1 + 7184);
  if (v7)
  {
    int v8 = 0;
    uint64_t v9 = *(void *)(a1 + 7184);
    do
    {
      if (!*(_DWORD *)(v9 + 68)) {
        ++v8;
      }
      uint64_t v9 = *(void *)(v9 + 832);
    }
    while (v9);
    int v10 = 0;
    do
    {
      if (!*(_DWORD *)(v7 + 64)) {
        ++v10;
      }
      uint64_t v7 = *(void *)(v7 + 832);
    }
    while (v7);
  }
  else
  {
    int v8 = 0;
    int v10 = 0;
  }
  int v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12[0] = 67109632;
    v12[1] = v8;
    __int16 v13 = 1024;
    int v14 = v5;
    __int16 v15 = 1024;
    int v16 = v10;
    _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Pending connections state: iICEChecksLeft=%d, iUnconnectedNodeCount=%d, iDDsExpected=%d.", (uint8_t *)v12, 0x14u);
  }
  if (!v8 && !v5 && !v10) {
    PostEventCallback(*(void *)(a1 + 408), 0, 4, 0, 0, 0);
  }
  if (a2) {
    pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7192));
  }
}

uint64_t FindCListFromParticipantChanId(uint64_t a1, int a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t result = *(void *)(a1 + 7184);
  if (result)
  {
    while (*(_DWORD *)(result + 88) != a2 || *(_DWORD *)(result + 72) != a3)
    {
      uint64_t result = *(void *)(result + 832);
      if (!result) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = gcks_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7[0] = 67109376;
      v7[1] = a2;
      __int16 v8 = 1024;
      int v9 = a3;
      _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "No CList for participant [%08X] and channel [%d]", (uint8_t *)v7, 0xEu);
    }
    return 0;
  }
  return result;
}

uint64_t __gckSessionSetupChannelWithDTLS_block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t CListFromParticipantChanId = FindCListFromParticipantChanId(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
  if (CListFromParticipantChanId) {
    *(double *)(CListFromParticipantChanId + 744) = micro();
  }
  unsigned int v3 = *(_DWORD *)(a1 + 48);
  unsigned int v4 = *(_DWORD *)(a1 + 52);
  int v5 = gcks_log();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3 <= v4)
  {
    if (v6)
    {
      int v24 = *(_DWORD *)(a1 + 40);
      int v25 = *(_DWORD *)(a1 + 44);
      int v36 = 67109376;
      int v37 = v24;
      __int16 v38 = 1024;
      int v39 = v25;
      _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Sending first Hello to participant %08X on channel %d.", (uint8_t *)&v36, 0xEu);
    }
    uint64_t v23 = gckSessionSendHello(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40), 1, (int)*(double *)(*(void *)(a1 + 32) + 24), *(_DWORD *)(a1 + 44));
    if ((v23 & 0x80000000) != 0)
    {
      double v26 = gcks_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        __gckSessionSetupChannelWithDTLS_block_invoke_cold_3();
      }
      gckSessionChangeStateForParticipantAndChannel(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    }
    return v23;
  }
  if (v6)
  {
    int v7 = *(_DWORD *)(a1 + 40);
    int v8 = *(_DWORD *)(a1 + 44);
    int v36 = 67109376;
    int v37 = v7;
    __int16 v38 = 1024;
    int v39 = v8;
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Waiting for first Hello from participant %08X on channel %d.", (uint8_t *)&v36, 0xEu);
  }
  uint64_t v9 = *(void *)(a1 + 32);
  int v10 = *(_DWORD *)(a1 + 40);
  int v11 = *(_DWORD *)(a1 + 44);
  BOOL v12 = gcks_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v36 = 67109376;
    int v37 = v10;
    __int16 v38 = 1024;
    int v39 = 60;
    _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Waiting for Hello from participant %08X for %d seconds.", (uint8_t *)&v36, 0xEu);
  }
  uint64_t v13 = *(void *)(v9 + 7184);
  if (!v13)
  {
LABEL_15:
    int v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_2();
    }
    __int16 v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
    gckSessionChangeStateForParticipantAndChannel(*(void *)(a1 + 32), *(_DWORD *)(a1 + 40), *(_DWORD *)(a1 + 44));
    return 2149187606;
  }
  while (1)
  {
    if (*(_DWORD *)(v13 + 88) != v10) {
      goto LABEL_14;
    }
    if (v11 < 0) {
      break;
    }
    if (*(_DWORD *)(v13 + 72) == v11) {
      goto LABEL_26;
    }
LABEL_14:
    uint64_t v13 = *(void *)(v13 + 832);
    if (!v13) {
      goto LABEL_15;
    }
  }
  if (*(_DWORD *)(v13 + 80)) {
    goto LABEL_14;
  }
LABEL_26:
  long long v27 = (pthread_mutex_t *)(v13 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v13 + 768));
  if ((*(void *)(v13 + 40) & 0x8000000000000000) != 0)
  {
    long long v32 = gcks_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      int v36 = 67109120;
      int v37 = v10;
      _os_log_impl(&dword_218756000, v32, OS_LOG_TYPE_DEFAULT, "Hello already received from participant %08X, no need to schedule a Hello timeout.", (uint8_t *)&v36, 8u);
    }
  }
  else
  {
    double v28 = micro();
    uint64_t v29 = *(void *)(v13 + 600);
    if (v29)
    {
      while (1)
      {
        uint64_t v30 = v29;
        if (*(unsigned char *)v29 == 1) {
          break;
        }
        uint64_t v29 = *(void *)(v29 + 64);
        if (!v29)
        {
          uint64_t v31 = (double **)(v30 + 64);
          goto LABEL_34;
        }
      }
    }
    else
    {
      uint64_t v31 = (double **)(v13 + 600);
LABEL_34:
      uint64_t v33 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
      *(unsigned char *)uint64_t v33 = 1;
      v33[1] = 0.065;
      v33[2] = v28 + 60.0;
      v33[4] = v28 + 60.0;
      v33[5] = 0.0;
      *((_DWORD *)v33 + 12) = 0;
      *((_DWORD *)v33 + 13) = v10;
      *uint64_t v31 = v33;
      int v34 = *(_DWORD *)(v9 + 16);
      if (v34 != -1)
      {
        *(_DWORD *)(v9 + 16) = -1;
        close(v34);
      }
    }
  }
  pthread_mutex_unlock(v27);
  return 0;
}

pthread_mutex_t *gckSessionChangeStateForParticipantAndChannel(uint64_t a1, int a2, int a3)
{
  uint64_t result = (pthread_mutex_t *)FindCListFromParticipantChanId(a1, a2, a3);
  if (result)
  {
    uint64_t v5 = (uint64_t)result;
    BOOL v6 = result + 12;
    pthread_mutex_lock(result + 12);
    gckSessionChangeStateCList(a1, v5);
    return (pthread_mutex_t *)pthread_mutex_unlock(v6);
  }
  return result;
}

uint64_t gckSessionSendHello(uint64_t a1, unsigned int a2, int a3, __int16 a4, int a5)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  v31[0] = 0u;
  uint64_t v30 = 0;
  WORD6(v31[0]) = a4;
  v31[1] = 0x8000000000000002;
  uint64_t v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = "";
    *(_DWORD *)buf = 136315906;
    if (!a3) {
      int v10 = " back";
    }
    *(void *)uint64_t v33 = v10;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = 0x8000000000000002;
    *(_WORD *)&v33[18] = 1024;
    *(_DWORD *)&v33[20] = a2;
    __int16 v34 = 1024;
    int v35 = a5;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Sending Hello%s with flags [%llX] to participant %08X over channel %d.", buf, 0x22u);
  }
  int v11 = OSPFMakeHello(&v30, (uint64_t)v31, *(_DWORD *)(a1 + 416), a2);
  if (v11 < 0)
  {
    uint64_t v15 = 2149187618;
    uint64_t v16 = gcks_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      gckSessionSendHello_cold_1();
    }
    return v15;
  }
  int v12 = v11;
  if (!a3)
  {
    uint64_t v15 = SendUDPPacketToParticipantChannelID(a1, (uint64_t)v30, v11, a2, 0, a5, 0);
    free(v30);
    return v15;
  }
  uint64_t v13 = *(void *)(a1 + 7184);
  if (!v13)
  {
LABEL_14:
    int v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __gckSessionSetupChannelWithDTLS_block_invoke_cold_2();
    }
    free(v30);
    return 2149187606;
  }
  while (1)
  {
    if (*(_DWORD *)(v13 + 88) != a2) {
      goto LABEL_13;
    }
    if (a5 < 0) {
      break;
    }
    if (*(_DWORD *)(v13 + 72) == a5) {
      goto LABEL_20;
    }
LABEL_13:
    uint64_t v13 = *(void *)(v13 + 832);
    if (!v13) {
      goto LABEL_14;
    }
  }
  if (*(_DWORD *)(v13 + 80)) {
    goto LABEL_13;
  }
LABEL_20:
  uint64_t v17 = (pthread_mutex_t *)(v13 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v13 + 768));
  uint64_t v18 = *(unsigned char **)(v13 + 600);
  if (v18)
  {
    while (1)
    {
      uint64_t v19 = v18;
      if (*v18 == 1) {
        break;
      }
      uint64_t v18 = (unsigned char *)*((void *)v18 + 8);
      if (!v18)
      {
        uint64_t v20 = v19 + 64;
        goto LABEL_25;
      }
    }
    *(_OWORD *)(v18 + 8) = xmmword_21878BAD0;
    *((void *)v18 + 4) = *(void *)(a1 + 32);
    *((_DWORD *)v18 + 6) = 1;
    uint64_t v22 = (void *)*((void *)v18 + 5);
    if (v22) {
      free(v22);
    }
    int v21 = 0;
    *((void *)v19 + 5) = v30;
    *((_DWORD *)v19 + 12) = v12;
    *((_DWORD *)v19 + 13) = a2;
  }
  else
  {
    uint64_t v20 = (void *)(v13 + 600);
LABEL_25:
    int v21 = 1;
    uint64_t v19 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    char *v19 = 1;
    *(_OWORD *)(v19 + 8) = xmmword_21878BAD0;
    *((void *)v19 + 4) = *(void *)(a1 + 32);
    *((void *)v19 + 5) = v30;
    *((_DWORD *)v19 + 12) = v12;
    *((_DWORD *)v19 + 13) = a2;
    *uint64_t v20 = v19;
  }
  uint64_t v23 = gcks_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = *((_DWORD *)v19 + 12);
    uint64_t v25 = *((void *)v19 + 2);
    uint64_t v26 = *((void *)v19 + 4);
    int v27 = *((_DWORD *)v19 + 6);
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)uint64_t v33 = v24;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = v25;
    *(_WORD *)&v33[14] = 2048;
    *(void *)&v33[16] = v26;
    __int16 v34 = 1024;
    int v35 = v27;
    __int16 v36 = 1024;
    int v37 = v21;
    _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Scheduled OSPF Hello packet: length=%d nextFire=%g waitUntil=%g rapidFireCount=%d newItem=%d.", buf, 0x28u);
  }
  pthread_mutex_unlock(v17);
  int v28 = *(_DWORD *)(a1 + 16);
  if (v28 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v28);
  }
  return 0;
}

uint64_t gckSessionScheduleDTLSHandshake(uint64_t a1, uint64_t a2)
{
  unsigned int v4 = (pthread_mutex_t *)(a2 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  uint64_t v5 = *(void *)(a2 + 600);
  if (v5)
  {
    while (1)
    {
      uint64_t v6 = v5;
      if (*(unsigned char *)v5 == 11) {
        break;
      }
      uint64_t v5 = *(void *)(v5 + 64);
      if (!v5)
      {
        int v7 = (void *)(v6 + 64);
        goto LABEL_6;
      }
    }
    *(_OWORD *)(v5 + 8) = xmmword_21878BAD0;
    *(void *)(v5 + 32) = 0x404E000000000000;
    *(_DWORD *)(v5 + 52) = *(_DWORD *)(a2 + 88);
  }
  else
  {
    int v7 = (void *)(a2 + 600);
LABEL_6:
    int v8 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    char *v8 = 11;
    *(_OWORD *)(v8 + 8) = xmmword_21878BAD0;
    *((void *)v8 + 4) = 0x404E000000000000;
    *((_DWORD *)v8 + 13) = *(_DWORD *)(a2 + 88);
    void *v7 = v8;
  }
  pthread_mutex_unlock(v4);
  uint64_t result = *(unsigned int *)(a1 + 16);
  if (result != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    return close(result);
  }
  return result;
}

uint64_t SendUDPPacketToParticipantChannelID(uint64_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int a7)
{
  uint64_t v7 = 0;
  uint64_t v22 = *MEMORY[0x263EF8340];
  if (a2 && a3)
  {
    if (a5) {
      pthread_rwlock_rdlock((pthread_rwlock_t *)(a1 + 7192));
    }
    uint64_t v7 = 2149187606;
    for (uint64_t i = *(void *)(a1 + 7184); i; uint64_t i = *(void *)(i + 832))
    {
      if (*(_DWORD *)(i + 88) == a4)
      {
        if (a6 < 0)
        {
          if (*(_DWORD *)(i + 80)) {
            continue;
          }
        }
        else if (*(_DWORD *)(i + 72) != a6)
        {
          continue;
        }
        if ((*(_DWORD *)(i + 376) & 0xFFFFFFFE) == 2)
        {
          uint64_t v17 = gcks_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            SendUDPPacketToParticipantChannelID_cold_1(i, a6, v17);
          }
          double v18 = micro();
          if (a7 && v18 <= *(double *)(i + 24))
          {
            uint64_t v20 = gcks_log();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              v21[0] = 67109120;
              v21[1] = a4;
              _os_log_impl(&dword_218756000, v20, OS_LOG_TYPE_DEFAULT, "Dropped packet for participant %08X.", (uint8_t *)v21, 8u);
            }
          }
          else
          {
            unsigned int v19 = SendUDPPacketCList(i, a2, a3, 0, 1);
            if (v19 == -1072037876) {
              *(double *)(i + 24) = v18 + 3.0;
            }
            if (v19 == -1072037856) {
              uint64_t v7 = 2149187626;
            }
            else {
              uint64_t v7 = v19;
            }
          }
          break;
        }
      }
    }
    if (a5) {
      pthread_rwlock_unlock((pthread_rwlock_t *)(a1 + 7192));
    }
  }
  return v7;
}

uint64_t DTLS_SocketRead(uint64_t a1, void *__dst, int *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v5 = *(void *)(a1 + 656);
  if (v5)
  {
    uint64_t v6 = *(int *)(v5 + 4100);
    if (*(_DWORD *)(v5 + 4104) - (int)v6 >= *a3) {
      int v7 = *a3;
    }
    else {
      int v7 = *(_DWORD *)(v5 + 4104) - v6;
    }
    memcpy(__dst, (const void *)(v5 + v6), v7);
    *(void *)a3 = v7;
    int v8 = *(_DWORD *)(v5 + 4100) + v7;
    *(_DWORD *)(v5 + 4100) = v8;
    if (v8 == *(_DWORD *)(v5 + 4104))
    {
      *(void *)(a1 + 656) = *(void *)(v5 + 4200);
      free((void *)v5);
    }
    return 0;
  }
  else
  {
    int v10 = gcks_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)a3;
      int v12 = *(_DWORD *)(a1 + 88);
      int v13 = *(_DWORD *)(a1 + 72);
      uint64_t v14 = *(void *)(a1 + 632);
      v15[0] = 67110144;
      v15[1] = v11;
      __int16 v16 = 1024;
      int v17 = v12;
      __int16 v18 = 1024;
      int v19 = v13;
      __int16 v20 = 2048;
      uint64_t v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = a1;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "No packets available (%d bytes requested) for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]. Have to wait for more data.", (uint8_t *)v15, 0x28u);
    }
    *(void *)a3 = 0;
    return 4294957493;
  }
}

uint64_t DTLS_SocketWrite(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  v12[6] = *MEMORY[0x263EF8340];
  uint64_t v6 = *a3;
  gckSessionUpdateDstIPPortAndSockAddrForCList(a1, (long long *)(a1 + 424));
  memset(&v11.msg_namelen, 0, 40);
  v12[4] = 0;
  v12[5] = 0;
  v11.msg_name = (void *)(a1 + 464);
  v11.msg_namelen = *(_DWORD *)(a1 + 592);
  char v10 = -48;
  v12[0] = &v10;
  v12[1] = 1;
  _DWORD v12[2] = a2;
  v12[3] = (int)v6;
  v11.msg_iovlen = 2;
  v11.msg_iov = (iovec *)v12;
  if (sendmsg(*(_DWORD *)a1, &v11, 0) == -1)
  {
    uint64_t v9 = gcks_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      DTLS_SocketWrite_cold_1(v6 + 1, v9);
    }
    __error();
    *a3 = 0;
    return 4294957493;
  }
  else
  {
    double v7 = micro();
    uint64_t result = 0;
    *(double *)(a1 + 48) = v7;
  }
  return result;
}

uint64_t __gckSessionRecvProc_block_invoke(uint64_t a1)
{
  pthread_rwlock_rdlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 7192));
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 16);
  if (v3 != -1)
  {
    *(_DWORD *)(v2 + 16) = -1;
    close(v3);
    uint64_t v2 = *(void *)(a1 + 32);
  }

  return pthread_rwlock_unlock((pthread_rwlock_t *)(v2 + 7192));
}

const char *gckWaitForString(int a1)
{
  if ((a1 - 1) > 0xB) {
    return "UNHANDLED WAIT FOR TYPE";
  }
  else {
    return off_2643384B0[(char)(a1 - 1)];
  }
}

uint64_t gckSessionPerformDTLSHandshake(uint64_t a1, uint64_t a2)
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  OSStatus v4 = SSLHandshake(*(SSLContextRef *)(a2 + 632));
  uint64_t v5 = gcks_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = *(_DWORD *)(a2 + 88);
    int v7 = *(_DWORD *)(a2 + 72);
    uint64_t v8 = *(void *)(a2 + 632);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = v6;
    __int16 v41 = 1024;
    int v42 = v7;
    __int16 v43 = 2048;
    uint64_t v44 = v8;
    __int16 v45 = 1024;
    LODWORD(v46) = v4;
    _os_log_impl(&dword_218756000, v5, OS_LOG_TYPE_DEFAULT, "Perform handshake with participant [%08X] channelID [%d] DTLS context [%p] completed with error %d.", buf, 0x1Eu);
  }
  switch(v4)
  {
    case -9841:
      uint64_t v21 = gcks_log();
      uint64_t v20 = 0;
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT)) {
        return v20;
      }
      int v22 = *(_DWORD *)(a2 + 88);
      int v23 = *(_DWORD *)(a2 + 72);
      uint64_t v24 = *(void *)(a2 + 632);
      *(_DWORD *)buf = 67109888;
      *(_DWORD *)&uint8_t buf[4] = v22;
      __int16 v41 = 1024;
      int v42 = v23;
      __int16 v43 = 2048;
      uint64_t v44 = v24;
      __int16 v45 = 2048;
      uint64_t v46 = a2;
      _os_log_impl(&dword_218756000, v21, OS_LOG_TYPE_DEFAULT, "Peer Authentication Completed for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p].", buf, 0x22u);
      return 0;
    case -9803:
      return 0;
    case 0:
      uint64_t v9 = gcks_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v10 = *(_DWORD *)(a2 + 88);
        int v11 = *(_DWORD *)(a2 + 72);
        uint64_t v12 = *(void *)(a2 + 632);
        *(_DWORD *)buf = 67109888;
        *(_DWORD *)&uint8_t buf[4] = v10;
        __int16 v41 = 1024;
        int v42 = v11;
        __int16 v43 = 2048;
        uint64_t v44 = v12;
        __int16 v45 = 2048;
        uint64_t v46 = a2;
        _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Completed handshake with participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]. Changing status to DTLSCONNECTED.", buf, 0x22u);
      }
      *(_DWORD *)(a2 + 640) = 1;
      *(double *)(a2 + 728) = micro();
      *(_DWORD *)(a2 + 736) = 1;
      if (*(_DWORD *)(a2 + 620))
      {
        *(void *)buf = 0;
        if (SSLCopyPeerTrust(*(SSLContextRef *)(a2 + 632), (SecTrustRef *)buf))
        {
          int v13 = gcks_log();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            gckSessionPerformDTLSHandshake_cold_3(a2, v13, v14, v15, v16, v17, v18, v19);
          }
          return 2149777412;
        }
        if (!*(void *)buf)
        {
          long long v32 = gcks_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
            gckSessionPerformDTLSHandshake_cold_2(a2, v32, v33, v34, v35, v36, v37, v38);
          }
          return 2149777412;
        }
        uint64_t CertificateCount = SecTrustGetCertificateCount(*(SecTrustRef *)buf);
        CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], CertificateCount, MEMORY[0x263EFFF70]);
        CFMutableArrayRef v39 = Mutable;
        if (CertificateCount >= 1)
        {
          int v28 = Mutable;
          for (CFIndex i = 0; i != CertificateCount; ++i)
          {
            SecCertificateRef CertificateAtIndex = SecTrustGetCertificateAtIndex(*(SecTrustRef *)buf, i);
            CFArrayAppendValue(v28, CertificateAtIndex);
          }
        }
        *(_DWORD *)(a2 + 628) = 1;
        PostEventCallback(*(void *)(a1 + 408), *(_DWORD *)(a2 + 88), 6, &v39, 8, 0);
        CFRelease(*(CFTypeRef *)buf);
      }
      else
      {
        *(_DWORD *)(a2 + 628) = 1;
        PostEventCallback(*(void *)(a1 + 408), *(_DWORD *)(a2 + 88), 6, 0, 0, 0);
      }
      return 0;
  }
  uint64_t v20 = 2149777412;
  uint64_t v25 = gcks_log();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
    gckSessionPerformDTLSHandshake_cold_1(v4, v25);
  }
  return v20;
}

void attempt_failover(uint64_t a1, _DWORD *a2)
{
  *(void *)&v23[7] = *MEMORY[0x263EF8340];
  OSStatus v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = a2[22];
    int v20 = 67109120;
    int v21 = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Attempting failover for participant %08X.", (uint8_t *)&v20, 8u);
  }
  if (a2[20]) {
    goto LABEL_4;
  }
  uint64_t v10 = *(void *)(a1 + 7184);
  if (v10)
  {
    int v11 = 0;
    do
    {
      if ((_DWORD *)v10 != a2 && *(_DWORD *)(v10 + 88) == a2[22] && *(int *)(v10 + 80) >= 0) {
        int v11 = (_DWORD *)v10;
      }
      uint64_t v10 = *(void *)(v10 + 832);
    }
    while (v10);
    if (v11)
    {
      if (v11 != a2)
      {
        v11[20] = 0;
        gckSessionUpdateNode(a1, v11[22], v11[152], 0);
        uint64_t v12 = gcks_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = v11[18];
          int v15 = v11[21];
          int v14 = v11[22];
          int v20 = 67109632;
          int v21 = v13;
          __int16 v22 = 1024;
          *(_DWORD *)int v23 = v14;
          v23[2] = 1024;
          *(_DWORD *)&v23[3] = v15;
          _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Promoted channel %d for participant %08X to active status: original priority %d.", (uint8_t *)&v20, 0x14u);
        }
      }
LABEL_4:
      a2[20] = -1;
      int v6 = gcks_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v7 = a2[18];
        int v9 = a2[21];
        int v8 = a2[22];
        int v20 = 67109632;
        int v21 = v7;
        __int16 v22 = 1024;
        *(_DWORD *)int v23 = v8;
        v23[2] = 1024;
        *(_DWORD *)&v23[3] = v9;
        _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Demoted channel %d for participant %08X to inactive status: original priority %d.", (uint8_t *)&v20, 0x14u);
      }
      gckSessionReconcileChannelPriority(a1, a2[22]);
      return;
    }
  }
  uint64_t v16 = gcks_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = a2[22];
    int v18 = a2[94];
    uint64_t v19 = "Created";
    switch(v18)
    {
      case 0:
        break;
      case 1:
        uint64_t v19 = "ICE";
        break;
      case 2:
        uint64_t v19 = "Connecting";
        break;
      case 3:
        uint64_t v19 = "Connected";
        break;
      case 4:
        uint64_t v19 = "Disconnected";
        break;
      default:
        uint64_t v19 = "Invalid";
        if (v18 != 255) {
          uint64_t v19 = "?";
        }
        break;
    }
    int v20 = 67109378;
    int v21 = v17;
    __int16 v22 = 2080;
    *(void *)int v23 = v19;
    _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, "Connection timed out for participant [%08X] (%s).", (uint8_t *)&v20, 0x12u);
  }
  gckSessionChangeStateCList(a1, (uint64_t)a2);
}

uint64_t gckSessionRecvMessage(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = MEMORY[0x270FA5388](a1, a2);
  uint64_t v4 = v3;
  uint64_t v6 = (uint64_t)v5;
  uint64_t v163 = v2;
  uint64_t v188 = *MEMORY[0x263EF8340];
  long long v185 = 0u;
  memset(v186, 0, 24);
  uint64_t v184 = 0;
  long long v182 = 0u;
  long long v183 = 0u;
  memset(v181, 0, sizeof(v181));
  *(void *)&v167.msg_iovlen = 1;
  memset(v180, 0, sizeof(v180));
  v179[0] = v187;
  v179[1] = 4096;
  v167.msg_name = v181;
  *(void *)&v167.msg_namelen = 128;
  v167.msg_iov = (iovec *)v179;
  v167.msg_control = v180;
  *(void *)&v167.msg_controllen = 32;
  ssize_t v7 = recvmsg(*v5, &v167, 0);
  if (v7 == -1)
  {
    uint64_t v10 = *__error() | 0xC01A0000;
    int v15 = gcks_log();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      return v10;
    }
    int v16 = *(_DWORD *)v6;
    int v175 = 67109376;
    int v176 = v16;
    __int16 v177 = 1024;
    int v178 = v10;
    int v17 = "Recvmsg on socket %d failed (%X).";
    int v18 = &v175;
    uint64_t v19 = v15;
LABEL_8:
    uint32_t v20 = 14;
LABEL_9:
    _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)v18, v20);
    return v10;
  }
  unint64_t v8 = v7;
  if (!v7)
  {
    int v9 = gcks_log();
    uint64_t v10 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v11 = *(_DWORD *)v6;
      int v175 = 67109120;
      int v176 = v11;
      uint64_t v12 = "Recvmsg on socket %d returned 0 (empty message).";
      int v13 = v9;
      uint32_t v14 = 8;
LABEL_5:
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v175, v14);
      return 0;
    }
    return v10;
  }
  long long v21 = *(_OWORD *)(v6 + 400);
  long long v185 = *(_OWORD *)(v6 + 384);
  v186[0] = v21;
  *(void *)&v186[1] = *(void *)(v6 + 416);
  if (v167.msg_controllen >= 0xC)
  {
    msg_control = (unsigned int *)v167.msg_control;
    if (v167.msg_control)
    {
      while (msg_control[1] != 41 || msg_control[2] != 46)
      {
        msg_control = (unsigned int *)((char *)msg_control + ((*msg_control + 3) & 0x1FFFFFFFCLL));
        if ((char *)(msg_control + 3) > (char *)v167.msg_control + v167.msg_controllen) {
          goto LABEL_21;
        }
      }
      if (msg_control[3] || msg_control[4] || msg_control[5] != -65536)
      {
        LODWORD(v185) = 1;
        *(_OWORD *)((char *)v186 + 4) = *(_OWORD *)(msg_control + 3);
      }
      else
      {
        unsigned int v23 = bswap32(msg_control[6]);
        LODWORD(v185) = v185 & 0xFFFFFFFE;
        DWORD1(v186[0]) = v23;
      }
    }
  }
LABEL_21:
  if (SockAddrCompareAddr())
  {
    SAToIPPORT();
  }
  else
  {
    uint64_t v184 = *(void *)(v6 + 456);
    long long v24 = *(_OWORD *)(v6 + 440);
    long long v182 = *(_OWORD *)(v6 + 424);
    long long v183 = v24;
  }
  uint64_t v165 = 0;
  uint64_t v166 = 0;
  if (v187[0] != 208)
  {
    int v42 = v187;
LABEL_35:
    int v164 = 0;
    int v43 = OSPFParse(&v166, &v165, v42, v8, 0, 0, &v164);
    if (v43 >= 1)
    {
      uint64_t v44 = v166;
      int v45 = *(unsigned __int8 *)(v166 + 1);
      *(void *)(v6 + 16) = v4;
      int v160 = v45;
      if (v45 == 1 && (*(_WORD *)(v44 + 4) & 1) != 0) {
        *(_DWORD *)(v6 + 32) = 1;
      }
      uint64_t v158 = v6;
      uint64_t v46 = gcks_log();
      BOOL v47 = os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG);
      uint64_t v49 = v163;
      if (v47)
      {
        uint64_t v106 = IPPORTToString();
        int v107 = *(_DWORD *)(v166 + 12);
        uint64_t v108 = IPPORTToString();
        int v109 = *(_DWORD *)(v166 + 8);
        int v169 = 136316418;
        *(void *)v170 = v106;
        *(_WORD *)&v170[8] = 1024;
        v171[0] = v107;
        LOWORD(v171[1]) = 2080;
        *(void *)((char *)&v171[1] + 2) = v108;
        HIWORD(v171[3]) = 1024;
        v171[4] = v109;
        __int16 v172 = 1024;
        LODWORD(v173[0]) = v8;
        WORD2(v173[0]) = 1024;
        *(_DWORD *)((char *)v173 + 6) = v160;
        _os_log_debug_impl(&dword_218756000, v46, OS_LOG_TYPE_DEBUG, "[%s] %08X <= [%s] %08X: %d bytes(%d).", (uint8_t *)&v169, 0x2Eu);
      }
      uint64_t v50 = v166;
      int v51 = (unsigned int *)(v166 + 12);
      unint64_t v52 = *(unsigned char *)v166 & 0xF;
      uint64_t v161 = 4 * v52;
      MEMORY[0x270FA5388](v47, v48);
      CFArrayRef v54 = &v155[-v53];
      if (v52)
      {
        int v157 = v155;
        int v55 = 0;
        unint64_t v56 = v52;
        OSStatus v57 = v51;
        OSStatus v58 = (int *)&v155[-v53];
        do
        {
          unsigned int v60 = *v57++;
          uint64_t v59 = v60;
          if (v60 == *(_DWORD *)(v49 + 416))
          {
            int v55 = 1;
            int NextHop = -1;
          }
          else
          {
            int NextHop = gckSessionFindNextHop(v49, v59);
          }
          *v58++ = NextHop;
          --v56;
        }
        while (v56);
        int v156 = v55;
        int v62 = (unsigned int *)(v50 + 16);
        int v63 = v54 + 4;
        uint64_t v64 = 1;
        v159 = v54;
        do
        {
          int v65 = *(_DWORD *)&v54[4 * v56];
          if (v65 == -1)
          {
            ++v56;
          }
          else
          {
            uint64_t v66 = MEMORY[0x270FA5388](v155, v59);
            int v69 = (unsigned int *)&v155[-v68];
            *(_DWORD *)&v155[-v68] = v51[v56++];
            uint64_t v70 = 1;
            if (v56 < v52)
            {
              unint64_t v71 = v52;
              OSStatus v72 = v63;
              int v73 = v62;
              do
              {
                if (*v72 == v65)
                {
                  v69[(int)v70] = *v73;
                  uint64_t v70 = (v70 + 1);
                  *OSStatus v72 = -1;
                }
                ++v73;
                ++v72;
                --v71;
              }
              while (v64 != v71);
            }
            if (v67 == 10 || v67 == 5)
            {
              uint64_t v162 = v66;
              unint64_t v74 = v52;
              uint64_t v75 = v51;
              uint64_t v76 = v163;
              int v77 = OSPFMakeData((char *)&v169, 4096, v165, 0, v67, *(_DWORD *)(v166 + 8), v69, v70, *(uint64_t (**)(uint64_t, unsigned int *, uint64_t, char *, void, uint64_t, void, void, int))(*(void *)(v163 + 408) + 24), *(void *)(*(void *)(v163 + 408) + 32), 64, 0, 0);
              if (v77 >= 1) {
                SendUDPPacketToParticipantChannelID(v76, (uint64_t)&v169, v77, v65, 0, -1, 1);
              }
              int v51 = v75;
              unint64_t v52 = v74;
              CFArrayRef v54 = v159;
            }
          }
          ++v64;
          ++v62;
          ++v63;
        }
        while (v56 != v52);
        uint64_t v78 = v163;
        if (v156)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v163 + 7080));
          unint64_t v79 = *(unsigned int *)(v78 + 420);
          if ((int)v79 < 1)
          {
            BOOL v82 = 0;
            uint64_t v81 = v158;
          }
          else
          {
            int v80 = *(_DWORD *)(v166 + 8);
            uint64_t v81 = v158;
            if (*(_DWORD *)(v78 + 424) == v80)
            {
              BOOL v82 = 1;
            }
            else
            {
              BOOL v98 = (int *)(v78 + 840);
              uint64_t v99 = 1;
              do
              {
                unint64_t v100 = v99;
                if (v79 == v99) {
                  break;
                }
                int v101 = *v98;
                ++v99;
                v98 += 104;
              }
              while (v101 != v80);
              BOOL v82 = v100 < v79;
            }
          }
          pthread_mutex_unlock((pthread_mutex_t *)(v78 + 7080));
          if (v160 == 10 || v160 == 5)
          {
            if (v82)
            {
              if (v160 == 10) {
                int v102 = 5;
              }
              else {
                int v102 = 3;
              }
              PostEventCallback(*(void *)(v78 + 408), *(_DWORD *)(v166 + 8), v102, *(const void **)v165, *(_DWORD *)(v165 + 8), 0);
            }
            else
            {
              __int16 v104 = gcks_log();
              if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
              {
                int v105 = *(_DWORD *)(v166 + 8);
                int v169 = 67109120;
                *(_DWORD *)v170 = v105;
                _os_log_impl(&dword_218756000, v104, OS_LOG_TYPE_DEFAULT, "Skipping data from unroutable peer (OSPF source ID [%08X]).", (uint8_t *)&v169, 8u);
              }
            }
          }
          else
          {
            int v103 = (unsigned __int16 *)v165;
            switch(*(unsigned char *)(v166 + 1))
            {
              case 1:
                gckSessionProcessHello(v78, v81, v165, 1);
                goto LABEL_167;
              case 2:
                gckSessionProcessDD(v78, v81, v165);
                goto LABEL_167;
              case 3:
                gckSessionProcessLSA(v78, v81, v165);
                goto LABEL_167;
              case 4:
                int v127 = gcks_log();
                if (os_log_type_enabled(v127, OS_LOG_TYPE_DEFAULT))
                {
                  int v128 = *(_DWORD *)(v78 + 416);
                  int v129 = *(_DWORD *)(v81 + 88);
                  int v130 = v103[6];
                  int v131 = *(_DWORD *)(v81 + 72);
                  int v132 = *(_DWORD *)(v81 + 80);
                  int v169 = 67110144;
                  *(_DWORD *)v170 = v128;
                  *(_WORD *)&v170[4] = 1024;
                  *(_DWORD *)&v170[6] = v129;
                  LOWORD(v171[0]) = 1024;
                  *(_DWORD *)((char *)v171 + 2) = v130;
                  HIWORD(v171[1]) = 1024;
                  v171[2] = v131;
                  LOWORD(v171[3]) = 1024;
                  *(_DWORD *)((char *)&v171[3] + 2) = v132;
                  _os_log_impl(&dword_218756000, v127, OS_LOG_TYPE_DEFAULT, "I am %08X. Received LSAACK from particpant %08X with SN [%d] channel [%d] priority [%d].", (uint8_t *)&v169, 0x20u);
                }
                pthread_mutex_lock((pthread_mutex_t *)(v81 + 768));
                __int16 v133 = *(unsigned char **)(v81 + 600);
                if (v133)
                {
                  int v134 = (void *)(v81 + 600);
                  do
                  {
                    if (*v133 == 4 && *((unsigned __int16 *)v133 + 28) == v103[6])
                    {
                      void *v134 = *((void *)v133 + 8);
                      __int16 v135 = (void *)*((void *)v133 + 5);
                      if (v135) {
                        free(v135);
                      }
                      free(v133);
                    }
                    else
                    {
                      int v134 = v133 + 64;
                    }
                    __int16 v133 = (unsigned char *)*v134;
                  }
                  while (*v134);
                }
                uint64_t v136 = (pthread_mutex_t *)(v81 + 768);
                goto LABEL_166;
              case 8:
                double v137 = micro();
                uint64_t v138 = gcks_log();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                {
                  if ((v103[6] & 2) != 0) {
                    __int16 v139 = "request";
                  }
                  else {
                    __int16 v139 = "response";
                  }
                  int v140 = v103[7];
                  int v141 = *(_DWORD *)(v81 + 88);
                  int v142 = *(_DWORD *)(v81 + 72);
                  int v169 = 136315906;
                  *(void *)v170 = v139;
                  *(_WORD *)&v170[8] = 1024;
                  v171[0] = v140;
                  LOWORD(v171[1]) = 1024;
                  *(_DWORD *)((char *)&v171[1] + 2) = v141;
                  HIWORD(v171[2]) = 1024;
                  v171[3] = v142;
                  _os_log_impl(&dword_218756000, v138, OS_LOG_TYPE_DEFAULT, "Received Heartbeat (%s) with SN [%d] from participant [%08X] over channel [%d].", (uint8_t *)&v169, 0x1Eu);
                }
                if ((v103[6] & 2) != 0)
                {
                  unsigned int v144 = *(_DWORD *)(v81 + 88);
                  unsigned int v145 = v103[7];
                  int v146 = *(_DWORD *)(v81 + 72);
                  double v168 = 0;
                  int v147 = OSPFMakeHeartbeat(&v168, *(_DWORD *)(v78 + 416), v144, 0, v145);
                  uint64_t v148 = gcks_log();
                  BOOL v149 = v148;
                  if (v147 < 0)
                  {
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_ERROR))
                    {
                      int v169 = 67109632;
                      *(_DWORD *)v170 = v144;
                      *(_WORD *)&v170[4] = 1024;
                      *(_DWORD *)&v170[6] = v145;
                      LOWORD(v171[0]) = 1024;
                      *(_DWORD *)((char *)v171 + 2) = v146;
                      _os_log_error_impl(&dword_218756000, v149, OS_LOG_TYPE_ERROR, "OSPFMakeHeartbeat failed for participant %08X, SN [%d], channel [%d].", (uint8_t *)&v169, 0x14u);
                    }
                  }
                  else
                  {
                    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEFAULT))
                    {
                      int v169 = 136315906;
                      *(void *)v170 = "response";
                      *(_WORD *)&v170[8] = 1024;
                      v171[0] = v145;
                      LOWORD(v171[1]) = 1024;
                      *(_DWORD *)((char *)&v171[1] + 2) = v144;
                      HIWORD(v171[2]) = 1024;
                      v171[3] = v146;
                      _os_log_impl(&dword_218756000, v149, OS_LOG_TYPE_DEFAULT, "Sending Heartbeat (%s) with SN [%d] to participant [%08X] over channel [%d].", (uint8_t *)&v169, 0x1Eu);
                    }
                    SendUDPPacketToParticipantChannelID(v78, (uint64_t)v168, v147, v144, 0, v146, 0);
                    free(v168);
                  }
                  goto LABEL_167;
                }
                pthread_mutex_lock((pthread_mutex_t *)(v81 + 768));
                uint64_t v143 = *(void *)(v81 + 600);
                if (!v143) {
                  goto LABEL_165;
                }
                break;
              default:
                goto LABEL_168;
            }
            while (*(unsigned char *)v143 != 8)
            {
              uint64_t v143 = *(void *)(v143 + 64);
              if (!v143) {
                goto LABEL_165;
              }
            }
            if (*(unsigned __int16 *)(v143 + 56) == v103[7])
            {
              *(void *)(v143 + 8) = *(void *)(v78 + 48);
              double v150 = *(double *)(v81 + 360);
              *(double *)(v143 + 32) = v137 + v150;
              *(double *)(v143 + 16) = v137 + v150 * 0.5;
            }
            else
            {
              v151 = gcks_log();
              if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
              {
                int v152 = v103[7];
                int v153 = *(unsigned __int16 *)(v143 + 56);
                int v169 = 67109376;
                *(_DWORD *)v170 = v152;
                *(_WORD *)&v170[4] = 1024;
                *(_DWORD *)&v170[6] = v153;
                _os_log_impl(&dword_218756000, v151, OS_LOG_TYPE_DEFAULT, "Received SN [%u] doesn't match the expected SN [%u].", (uint8_t *)&v169, 0xEu);
              }
            }
LABEL_165:
            uint64_t v136 = (pthread_mutex_t *)(v81 + 768);
LABEL_166:
            pthread_mutex_unlock(v136);
          }
        }
      }
LABEL_167:
      int v103 = (unsigned __int16 *)v165;
LABEL_168:
      if (v103) {
        free(v103);
      }
      return 0;
    }
    if (!v43)
    {
      if (*(unsigned char *)(v166 + 1) == 1) {
        gckSessionProcessHello(v163, v6, v165, 0);
      }
      if (v165) {
        free((void *)v165);
      }
      return 0;
    }
    int v83 = "?";
    if ((v164 + 3010) <= 9) {
      int v83 = off_2643386B0[v164 + 3010];
    }
    int v84 = gcks_log();
    if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
    {
      int v85 = *(_DWORD *)(v6 + 88);
      int v86 = *(_DWORD *)(v6 + 72);
      int v87 = *(_DWORD *)(v6 + 376);
      OSStatus v88 = "Created";
      switch(v87)
      {
        case 0:
          break;
        case 1:
          OSStatus v88 = "ICE";
          break;
        case 2:
          OSStatus v88 = "Connecting";
          break;
        case 3:
          OSStatus v88 = "Connected";
          break;
        case 4:
          OSStatus v88 = "Disconnected";
          break;
        default:
          if (v87 == 255) {
            OSStatus v88 = "Invalid";
          }
          else {
            OSStatus v88 = "?";
          }
          break;
      }
      int v114 = *(_DWORD *)(v6 + 640);
      uint64_t v115 = "DTLSNotConnected";
      if (v114) {
        uint64_t v115 = "?";
      }
      int v169 = 67110146;
      *(_DWORD *)v170 = v85;
      *(_WORD *)&v170[4] = 1024;
      if (v114 == 1) {
        double v116 = "DTLSConnected";
      }
      else {
        double v116 = v115;
      }
      *(_DWORD *)&v170[6] = v86;
      LOWORD(v171[0]) = 2080;
      *(void *)((char *)v171 + 2) = v88;
      HIWORD(v171[2]) = 2080;
      *(void *)&v171[3] = v116;
      __int16 v172 = 2080;
      v173[0] = v83;
      _os_log_impl(&dword_218756000, v84, OS_LOG_TYPE_DEFAULT, "Non-OSPF packet received from participant %08X on channel %d. State=%s DTLSState=%s OSPFParse err=%s.", (uint8_t *)&v169, 0x2Cu);
    }
    v117 = malloc_type_calloc(1uLL, 0x1070uLL, 0x1020040E1A74566uLL);
    if (v117)
    {
      int v118 = v117;
      v117[1027] = *(_DWORD *)(v6 + 88);
      if (v8 >> 1 >= 0x801)
      {
        uint64_t v119 = gcks_log();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_ERROR)) {
          gckSessionRecvMessage_cold_1();
        }
        MCDashboardLog("MC: iLenClearText=%ld (out of bounds) OSPFParse err=%s - <rdar://problem/26050877>.", v8, v83);
        LODWORD(v8) = 0;
      }
      __memcpy_chk();
      v118[1026] = v8;
      long long v120 = v186[0];
      *((_OWORD *)v118 + 257) = v185;
      *((_OWORD *)v118 + 258) = v120;
      *((void *)v118 + 518) = *(void *)&v186[1];
      long long v121 = v183;
      *(_OWORD *)(v118 + 1038) = v182;
      *(_OWORD *)(v118 + 1042) = v121;
      *((void *)v118 + 523) = v184;
      uint64_t v122 = v163;
      *((void *)v118 + 524) = v4;
      pthread_mutex_lock((pthread_mutex_t *)(v122 + 7400));
      int v123 = (void *)(v122 + 7392);
      do
      {
        uint64_t v124 = v123;
        uint64_t v125 = *v123;
        int v123 = (void *)(*v123 + 4200);
      }
      while (v125);
      *uint64_t v124 = v118;
      pthread_cond_broadcast((pthread_cond_t *)(v122 + 7464));
      pthread_mutex_unlock((pthread_mutex_t *)(v122 + 7400));
      return 0;
    }
    uint64_t v10 = 2149187587;
    uint64_t v126 = gcks_log();
    if (!os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT)) {
      return v10;
    }
    int v169 = 67109376;
    *(_DWORD *)v170 = 4208;
    *(_WORD *)&v170[4] = 1024;
    *(_DWORD *)&v170[6] = -2145779709;
    int v17 = "Calloc (%d bytes) failed with error (%X).";
    int v18 = &v169;
    uint64_t v19 = v126;
    goto LABEL_8;
  }
  v174[0] = 0;
  uint64_t v25 = malloc_type_calloc(1uLL, 0x1070uLL, 0x1020040E1A74566uLL);
  if (!v25)
  {
    uint64_t v10 = 2149187587;
    uint64_t v89 = gcks_log();
    if (!os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
    {
LABEL_75:
      uint64_t v94 = gcks_log();
      if (!os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT)) {
        return v10;
      }
      int v169 = 134217984;
      *(void *)v170 = (int)v10;
      int v17 = "Failed to process DTLS packet with error %ld.";
      int v18 = &v169;
      uint64_t v19 = v94;
      uint32_t v20 = 12;
      goto LABEL_9;
    }
    int v175 = 67109376;
    int v176 = 4208;
    __int16 v177 = 1024;
    int v178 = -2145779709;
    int v90 = "Calloc (%d bytes) failed (%X).";
    SSLSessionOption v91 = &v175;
    OSStatus v92 = v89;
    uint32_t v93 = 14;
LABEL_74:
    _os_log_impl(&dword_218756000, v92, OS_LOG_TYPE_DEFAULT, v90, (uint8_t *)v91, v93);
    goto LABEL_75;
  }
  uint64_t v26 = v25;
  size_t v27 = v8 - 1;
  v25[1027] = *(_DWORD *)(v6 + 88);
  __memcpy_chk();
  v26[1025] = 0;
  v26[1026] = v27;
  uint64_t v28 = *(void *)(v6 + 416);
  long long v29 = *(_OWORD *)(v6 + 400);
  *((_OWORD *)v26 + 257) = *(_OWORD *)(v6 + 384);
  *((_OWORD *)v26 + 258) = v29;
  *((void *)v26 + 518) = v28;
  long long v31 = *(_OWORD *)(v6 + 424);
  long long v30 = *(_OWORD *)(v6 + 440);
  *((void *)v26 + 523) = *(void *)(v6 + 456);
  *(_OWORD *)(v26 + 1038) = v31;
  *(_OWORD *)(v26 + 1042) = v30;
  *((void *)v26 + 524) = v4;
  pthread_mutex_lock((pthread_mutex_t *)(v6 + 768));
  long long v32 = (void *)(v6 + 656);
  do
  {
    uint64_t v33 = v32;
    uint64_t v34 = *v32;
    long long v32 = (void *)(*v32 + 4200);
  }
  while (v34);
  *uint64_t v33 = v26;
  int v35 = *(_DWORD *)(v6 + 640);
  uint64_t v10 = *(void *)(v6 + 632);
  pthread_mutex_unlock((pthread_mutex_t *)(v6 + 768));
  if (v10)
  {
    if (v35 != 1)
    {
      gckSessionScheduleDTLSHandshake(v163, v6);
      return 0;
    }
    pthread_mutex_lock((pthread_mutex_t *)(v6 + 768));
    OSStatus v36 = SSLRead(*(SSLContextRef *)(v6 + 632), &v175, v27, v174);
    pthread_mutex_unlock((pthread_mutex_t *)(v6 + 768));
    if (v36)
    {
      uint64_t v37 = gcks_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        int v38 = *(_DWORD *)(v6 + 88);
        int v39 = *(_DWORD *)(v6 + 72);
        uint64_t v40 = *(void *)(v6 + 632);
        if ((v36 + 9851) > 0x33) {
          __int16 v41 = "?";
        }
        else {
          __int16 v41 = off_264338510[v36 + 9851];
        }
        int v169 = 67110146;
        *(_DWORD *)v170 = v38;
        *(_WORD *)&v170[4] = 1024;
        *(_DWORD *)&v170[6] = v39;
        LOWORD(v171[0]) = 2048;
        *(void *)((char *)v171 + 2) = v40;
        HIWORD(v171[2]) = 2080;
        *(void *)&v171[3] = v41;
        __int16 v172 = 2048;
        v173[0] = v36;
        _os_log_impl(&dword_218756000, v37, OS_LOG_TYPE_DEFAULT, "SSLRead for participant [%08X] channelID [%d] DTLS context [%p] returned with error %s (%ld).", (uint8_t *)&v169, 0x2Cu);
      }
      uint64_t v10 = 2149187618;
      if ((v36 + 9816) > 0xB) {
        goto LABEL_75;
      }
      if (((1 << (v36 + 88)) & 0xC01) == 0) {
        goto LABEL_75;
      }
      int v110 = gcks_log();
      uint64_t v10 = 2149187617;
      if (!os_log_type_enabled(v110, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_75;
      }
      int v111 = *(_DWORD *)(v6 + 88);
      int v112 = *(_DWORD *)(v6 + 72);
      uint64_t v113 = *(void *)(v6 + 632);
      int v169 = 67109632;
      *(_DWORD *)v170 = v111;
      *(_WORD *)&v170[4] = 1024;
      *(_DWORD *)&v170[6] = v112;
      LOWORD(v171[0]) = 2048;
      *(void *)((char *)v171 + 2) = v113;
      int v90 = "DTLS connection closed gracefully for participant [%08X] channelID [%d] DTLS context [%p].";
      SSLSessionOption v91 = &v169;
      OSStatus v92 = v110;
      uint32_t v93 = 24;
      goto LABEL_74;
    }
    if (!v174[0]) {
      return 0;
    }
    unint64_t v8 = SLODWORD(v174[0]);
    int v42 = (unsigned __int8 *)&v175;
    goto LABEL_35;
  }
  int v95 = gcks_log();
  if (os_log_type_enabled(v95, OS_LOG_TYPE_DEFAULT))
  {
    int v96 = *(_DWORD *)(v6 + 88);
    int v97 = *(_DWORD *)(v6 + 72);
    int v175 = 67109376;
    int v176 = v96;
    __int16 v177 = 1024;
    int v178 = v97;
    uint64_t v12 = "DTLS context isn't set up yet for participant [%08X] on channel [%d]. Drop this packet.";
    int v13 = v95;
    uint32_t v14 = 14;
    goto LABEL_5;
  }
  return v10;
}

void gckSessionProcessHello(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  *(void *)&v51[5] = *MEMORY[0x263EF8340];
  int v8 = *(_DWORD *)(a2 + 376);
  int v9 = gcks_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = *(_DWORD *)(a2 + 88);
    int v11 = *(_DWORD *)(a2 + 72);
    uint64_t v12 = *(void *)(a3 + 16);
    *(_DWORD *)buf = 67109632;
    *(_DWORD *)uint64_t v50 = v10;
    *(_WORD *)&v50[4] = 1024;
    *(_DWORD *)&v50[6] = v11;
    v51[0] = 2048;
    *(void *)&v51[1] = v12;
    _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Received Hello from participant [%08X] over channel [%d]. Hello Flags [%llX].", buf, 0x18u);
  }
  double v13 = micro();
  if (a4)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
    int v14 = gckSessionChangeStateCList(a1, a2);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
    unsigned int v15 = *(unsigned __int16 *)(a3 + 12);
    double v16 = *(double *)(a1 + 24);
    if (v16 < (double)v15) {
      unsigned int v15 = (int)v16;
    }
    if (v15 <= 5) {
      unsigned int v17 = 5;
    }
    else {
      unsigned int v17 = v15;
    }
  }
  else
  {
    int v14 = 0;
    unsigned int v17 = 0;
  }
  unsigned int v18 = *(_DWORD *)(a2 + 88);
  if (*(_DWORD *)(a1 + 416) <= v18
    || (int v19 = gckSessionSendHello(a1, v18, 0, v17, *(_DWORD *)(a2 + 72)), (v19 & 0x80000000) == 0)
    || v19 == -1072037876)
  {
    if (!a4) {
      return;
    }
  }
  else
  {
    uint32_t v20 = gcks_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      gckSessionProcessHello_cold_1();
      if (!a4) {
        return;
      }
    }
    else if (!a4)
    {
      return;
    }
    pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
    gckSessionChangeStateCList(a1, a2);
    pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  }
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  uint64_t v21 = *(void *)(a3 + 16);
  *(void *)(a2 + 40) = v21;
  __int16 v22 = (double **)(a2 + 600);
  unsigned int v23 = *(double **)(a2 + 600);
  if ((v21 & 2) != 0)
  {
    if (!v23)
    {
LABEL_33:
      uint64_t v48 = 0;
      int v32 = OSPFMakeHeartbeat(&v48, *(_DWORD *)(a1 + 416), *(_DWORD *)(a2 + 88), 1, 1u);
      if ((v32 & 0x80000000) == 0)
      {
        int v33 = v32;
        uint64_t v34 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
        *(unsigned char *)uint64_t v34 = 8;
        v34[1] = *(double *)(a1 + 48);
        double v35 = *(double *)(a2 + 360);
        v34[4] = v13 + v35;
        v34[2] = v13 + v35 * 0.5;
        *((void *)v34 + 5) = v48;
        *((_DWORD *)v34 + 12) = v33;
        *((_WORD *)v34 + 28) = 1;
        *((_DWORD *)v34 + 13) = *(_DWORD *)(a2 + 88);
        *__int16 v22 = v34;
        OSStatus v36 = gcks_log();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          int v37 = *((unsigned __int16 *)v34 + 28);
          int v38 = *(_DWORD *)(a2 + 88);
          int v39 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 67109632;
          *(_DWORD *)uint64_t v50 = v37;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v38;
          v51[0] = 1024;
          *(_DWORD *)&v51[1] = v39;
          _os_log_impl(&dword_218756000, v36, OS_LOG_TYPE_DEFAULT, "Schedule a Heartbeat with SN [%d] for participant [%08X] over channel [%d].", buf, 0x14u);
        }
      }
      goto LABEL_43;
    }
    while (1)
    {
      int v27 = *(unsigned __int8 *)v23;
      if (v27 == 1)
      {
        uint64_t v28 = gcks_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          int v29 = *(_DWORD *)(a2 + 88);
          int v30 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)uint64_t v50 = v29;
          *(_WORD *)&v50[4] = 1024;
          *(_DWORD *)&v50[6] = v30;
          _os_log_impl(&dword_218756000, v28, OS_LOG_TYPE_DEFAULT, "Remove Hello from the retry list for participant [%08X] channel [%d].", buf, 0xEu);
        }
        *__int16 v22 = (double *)*((void *)v23 + 8);
        long long v31 = (void *)*((void *)v23 + 5);
        if (v31) {
          free(v31);
        }
        free(v23);
      }
      else
      {
        if (v27 == 8)
        {
          v23[1] = *(double *)(a1 + 48);
          double v42 = *(double *)(a2 + 360);
          v23[4] = v13 + v42;
          v23[2] = v13 + v42 * 0.5;
          int v43 = gcks_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v44 = *((void *)v23 + 2);
            uint64_t v45 = *((void *)v23 + 4);
            *(_DWORD *)buf = 134218240;
            *(void *)uint64_t v50 = v44;
            *(_WORD *)&v50[8] = 2048;
            *(void *)int v51 = v45;
            _os_log_impl(&dword_218756000, v43, OS_LOG_TYPE_DEFAULT, "Heartbeat queued. Updated state to: nextFire [%.1lf] waitUntil [%.1lf].", buf, 0x16u);
          }
          goto LABEL_43;
        }
        __int16 v22 = (double **)(v23 + 8);
      }
      unsigned int v23 = *v22;
      if (!*v22) {
        goto LABEL_33;
      }
    }
  }
  if (v23)
  {
    while (1)
    {
      long long v24 = v23;
      if (*(unsigned char *)v23 == 1) {
        break;
      }
      unsigned int v23 = (double *)*((void *)v23 + 8);
      if (!v23)
      {
        __int16 v22 = (double **)(v24 + 8);
        goto LABEL_22;
      }
    }
    v23[1] = 0.065;
    double v40 = v13 + (double)v17;
    v23[4] = v40;
    if (*((void *)v23 + 5)) {
      double v41 = *(double *)(a1 + 32);
    }
    else {
      double v41 = 0.0;
    }
    v23[2] = v40 - v41;
  }
  else
  {
LABEL_22:
    uint64_t v25 = (double *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *(unsigned char *)uint64_t v25 = 1;
    v25[1] = 0.065;
    double v26 = v13 + (double)v17;
    v25[4] = v26;
    v25[2] = v26;
    v25[5] = 0.0;
    *((_DWORD *)v25 + 12) = 0;
    *((_DWORD *)v25 + 13) = *(_DWORD *)(a2 + 88);
    *__int16 v22 = v25;
  }
LABEL_43:
  int v46 = *(_DWORD *)(a1 + 16);
  if (v46 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v46);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  if ((v14 & 0x80000000) == 0 && v8 != 3)
  {
    unsigned int v47 = *(_DWORD *)(a2 + 88);
    if (*(_DWORD *)(a1 + 416) < v47) {
      gckSessionSendDD(a1, v47, -1, 1);
    }
  }
}

void gckSessionProcessDD(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  uint64_t v6 = a1 + 424;
  BOOL IsNewInformationAvailableForParticipant = gckIsNewInformationAvailableForParticipant(*(_DWORD *)(a1 + 420), a1 + 424, *(_DWORD *)(a2 + 88));
  ssize_t v7 = gcks_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *(_DWORD *)(a1 + 416);
    int v9 = *(_DWORD *)(a2 + 88);
    int v10 = *(_DWORD *)(a2 + 72);
    int v11 = *(_DWORD *)(a2 + 80);
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)&uint8_t buf[4] = v8;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&sockaddr buf[10] = v9;
    LOWORD(v68) = 1024;
    *(_DWORD *)((char *)&v68 + 2) = v10;
    HIWORD(v68) = 1024;
    int v69 = v11;
    _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "I am %08X. Received DD from participant %08X on channel [%d] priority [%d].", buf, 0x1Au);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  TracePrintNodes(a1, *(_DWORD *)(a3 + 12), *(void *)(a3 + 16), 0, *(_DWORD *)(a2 + 88));
  uint64_t v61 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 7080));
  unsigned int v12 = *(_DWORD *)(a2 + 88);
  if (*(_DWORD *)(a1 + 416) > v12) {
    gckSessionSendDD(a1, v12, *(_DWORD *)(a2 + 72), 0);
  }
  pthread_mutex_lock((pthread_mutex_t *)(a2 + 768));
  if (*(double *)(a2 + 752) == 0.0)
  {
    *(double *)(a2 + 752) = micro();
    double v13 = gcks_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = *(double *)(a2 + 752);
      double v15 = v14 - *(double *)(a2 + 744);
      double v16 = v14 - *(double *)(a2 + 696);
      *(_DWORD *)buf = 134218240;
      *(double *)&uint8_t buf[4] = v15;
      *(_WORD *)&unsigned char buf[12] = 2048;
      double v68 = v16;
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "OSPF setup took %g seconds. Overall connection establishment took %g.", buf, 0x16u);
    }
    *(void *)buf = 0;
    if (CFPropertyListCreateFormatted())
    {
      unsigned int v17 = gcks_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        gckSessionProcessDD_cold_1();
      }
    }
    else
    {
      MCMetricsLog(@"com.apple.multipeerconnectivity.gcksession.connectivityinfo", *(uint64_t *)buf, 0);
      MCDashboardLogJSON(*(uint64_t *)buf, 0, @"ConnectivityInfo");
      if (*(void *)buf) {
        CFRelease(*(CFTypeRef *)buf);
      }
    }
  }
  unsigned int v18 = *(void **)(a2 + 600);
  if (v18)
  {
    int v19 = (void *)(a2 + 600);
    do
    {
      if (*(unsigned char *)v18 == 2)
      {
        void *v19 = v18[8];
        uint32_t v20 = (void *)v18[5];
        if (v20) {
          free(v20);
        }
        free(v18);
      }
      else
      {
        int v19 = v18 + 8;
      }
      unsigned int v18 = (void *)*v19;
    }
    while (*v19);
  }
  uint64_t v21 = pthread_mutex_unlock((pthread_mutex_t *)(a2 + 768));
  uint64_t v22 = *(unsigned int *)(a3 + 12);
  *(void *)&long long v66 = *(void *)(a3 + 16);
  MEMORY[0x270FA5388](v21, v23);
  uint64_t v25 = (char *)&v58 - ((v24 + 15) & 0x7FFFFFFF0);
  pthread_mutex_lock(v61);
  uint64_t v65 = v22;
  if ((int)v22 < 1)
  {
    LODWORD(v29) = 0;
  }
  else
  {
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    *(void *)&long long v27 = 67109632;
    long long v60 = v27;
    *(void *)&long long v27 = 67109120;
    long long v64 = v27;
    uint64_t v62 = a1 + 424;
    do
    {
      uint64_t v30 = *(unsigned int *)(a1 + 420);
      if ((int)v30 < 1)
      {
        LODWORD(v31) = 0;
      }
      else
      {
        uint64_t v31 = 0;
        int v32 = (_DWORD *)(v66 + 416 * v28);
        int v33 = (unsigned __int16 *)v6;
        while (*v32 != *(_DWORD *)v33)
        {
          ++v31;
          v33 += 208;
          if (v30 == v31) {
            goto LABEL_35;
          }
        }
        uint64_t v34 = v6;
        uint64_t v35 = v29;
        uint64_t v36 = v66 + 416 * v28;
        if (*(unsigned __int16 *)(v36 + 272) <= v33[136])
        {
          uint64_t v29 = v35;
          uint64_t v6 = v34;
        }
        else
        {
          os_log_t v63 = (os_log_t)gcks_log();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
          {
            int v37 = *(unsigned __int16 *)(v36 + 272);
            int v38 = v33[136];
            int v39 = *(_DWORD *)v33;
            *(_DWORD *)buf = v60;
            *(_DWORD *)&uint8_t buf[4] = v37;
            *(_WORD *)&uint8_t buf[8] = 1024;
            *(_DWORD *)&sockaddr buf[10] = v38;
            LOWORD(v68) = 1024;
            *(_DWORD *)((char *)&v68 + 2) = v39;
            _os_log_impl(&dword_218756000, v63, OS_LOG_TYPE_DEFAULT, "DD has newer information (DD SN [%d]/our SN [%d]) about participant [%08X]. Updating the routing table.", buf, 0x14u);
          }
          memcpy(v33, v32, 0x1A0uLL);
          uint64_t v29 = v35;
          uint64_t v6 = v62;
        }
      }
      if (v31 == v30)
      {
LABEL_35:
        int v40 = *(_DWORD *)(a1 + 420);
        double v41 = gcks_log();
        BOOL v42 = os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT);
        if (v40 > 15)
        {
          if (v42)
          {
            int v45 = *(_DWORD *)(v66 + 416 * v28);
            *(_DWORD *)buf = v64;
            *(_DWORD *)&uint8_t buf[4] = v45;
            _os_log_impl(&dword_218756000, v41, OS_LOG_TYPE_DEFAULT, "Maximum number of nodes reached. Ignoring node for participant [%08X].", buf, 8u);
          }
        }
        else
        {
          if (v42)
          {
            int v43 = *(_DWORD *)(v66 + 416 * v28);
            *(_DWORD *)buf = v64;
            *(_DWORD *)&uint8_t buf[4] = v43;
            _os_log_impl(&dword_218756000, v41, OS_LOG_TYPE_DEFAULT, "Adding participant [%08X] to the routing table.", buf, 8u);
          }
          uint64_t v44 = (_DWORD *)(v66 + 416 * v28);
          memcpy((void *)(v6 + 416 * *(int *)(a1 + 420)), v44, 0x1A0uLL);
          ++*(_DWORD *)(a1 + 420);
          *(_DWORD *)&v25[4 * (int)v29] = *v44;
          uint64_t v29 = (v29 + 1);
        }
      }
      ++v28;
    }
    while (v28 != v65);
  }
  gckSessionUpdateRoutingTable(a1, v26);
  gckPreemptivelyClearFlagsForTransientNodes(a1, (uint64_t)v25, v29);
  if (IsNewInformationAvailableForParticipant) {
    int v46 = -1;
  }
  else {
    int v46 = *(_DWORD *)(a2 + 88);
  }
  gckSessionSendLSA(a1, *(_DWORD *)(a1 + 420), v6, v46, 0);
  gckSessionHandleRemainingDisconnectedNodes(a1, 0);
  uint64_t v65 = *(unsigned int *)(a1 + 420);
  unsigned int v47 = gcks_log();
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&uint8_t buf[4] = v65;
    *(_WORD *)&uint8_t buf[8] = 1024;
    *(_DWORD *)&sockaddr buf[10] = v29;
    _os_log_impl(&dword_218756000, v47, OS_LOG_TYPE_DEFAULT, "Number of nodes in the routing table [%d]. New nodes [%d].", buf, 0xEu);
  }
  if ((int)v29 >= 1)
  {
    uint64_t v49 = 0;
    os_log_t v63 = (os_log_t)(a1 + 433);
    *(void *)&long long v64 = v29;
    *(void *)&long long v48 = 136315138;
    long long v66 = v48;
    while ((int)v65 < 1)
    {
LABEL_64:
      if (++v49 == (void)v64) {
        goto LABEL_65;
      }
    }
    uint64_t v50 = v65;
    os_log_t v51 = v63;
    os_log_t v52 = v63;
    while (1)
    {
      int v53 = *(_DWORD *)&v25[4 * v49];
      if (v53 != *(_DWORD *)((char *)&v51[-2].isa + 7) || *(_DWORD *)((char *)&v51[-1].isa + 3) == -1) {
        goto LABEL_63;
      }
      if (*(_DWORD *)(a2 + 80) || *(_DWORD *)(a2 + 88) != v53)
      {
        OSStatus v57 = gcks_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v66;
          *(void *)&uint8_t buf[4] = v52;
          int v55 = v57;
          unint64_t v56 = "DD: Connected to participant %s (new connection).";
          goto LABEL_61;
        }
      }
      else
      {
        CFArrayRef v54 = gcks_log();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v66;
          *(void *)&uint8_t buf[4] = v52;
          int v55 = v54;
          unint64_t v56 = "DD: Connected to participant %s (direct connection).";
LABEL_61:
          _os_log_impl(&dword_218756000, v55, OS_LOG_TYPE_DEFAULT, v56, buf, 0xCu);
        }
      }
      PostEventCallback(*(void *)(a1 + 408), *(_DWORD *)((char *)&v51[-2].isa + 7), 0, v51, HIBYTE(v51[-1].isa), 0);
LABEL_63:
      v51 += 52;
      v52 += 52;
      if (!--v50) {
        goto LABEL_64;
      }
    }
  }
LABEL_65:
  *(_DWORD *)(a2 + 64) = 1;
  pthread_mutex_unlock(v61);
  gckSessionCheckPendingConnections(a1, 0);
}

void gckSessionProcessLSA(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v117 = *MEMORY[0x263EF8340];
  uint64_t v6 = *(unsigned int *)(a3 + 16);
  int v105 = *(unsigned int **)(a3 + 24);
  uint64_t v7 = MEMORY[0x270FA5388](a1, a2);
  int v9 = (char *)&v97 - ((v8 + 15) & 0x7FFFFFFF0);
  int v10 = (pthread_mutex_t *)(v7 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(v7 + 7080));
  int v11 = gcks_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = *(_DWORD *)(a1 + 416);
    unsigned int v13 = *(_DWORD *)(a2 + 88);
    int v14 = *(unsigned __int16 *)(a3 + 12);
    int v15 = *(_DWORD *)(a2 + 72);
    int v16 = *(_DWORD *)(a2 + 80);
    *(_DWORD *)buf = 67110144;
    int v108 = v12;
    __int16 v109 = 1024;
    unsigned int v110 = v13;
    __int16 v111 = 1024;
    int v112 = v14;
    __int16 v113 = 1024;
    int v114 = v15;
    __int16 v115 = 1024;
    int v116 = v16;
    _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "I am %08X. Received LSA from particpant %08X with SN [%d] channel [%d] priority [%d].", buf, 0x20u);
  }
  unsigned int v17 = gcks_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218756000, v17, OS_LOG_TYPE_DEFAULT, "My nodes:", buf, 2u);
  }
  int v18 = *(_DWORD *)(a1 + 420);
  int v19 = *(_DWORD *)(a1 + 416);
  *(void *)&long long v106 = a1 + 424;
  TracePrintNodes(a1, v18, a1 + 424, 1, v19);
  uint32_t v20 = gcks_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_218756000, v20, OS_LOG_TYPE_DEFAULT, "LSA nodes:", buf, 2u);
  }
  TracePrintNodes(a1, *(_DWORD *)(a3 + 16), *(void *)(a3 + 24), 0, *(_DWORD *)(a2 + 88));
  unint64_t v23 = *(unsigned int *)(a3 + 16);
  if (v23 == *(_DWORD *)(a2 + 680))
  {
    if ((int)v23 < 1) {
      goto LABEL_20;
    }
    unint64_t v24 = 0;
    BOOL v25 = 0;
    uint64_t v26 = *(void *)(a3 + 24);
    uint64_t v27 = *(void *)(a2 + 688);
    uint64_t v28 = (_DWORD *)(v26 + 292);
    uint64_t v29 = (_DWORD *)(v27 + 292);
    do
    {
      if (*(_DWORD *)(v26 + 416 * v24) != *(_DWORD *)(v27 + 416 * v24)) {
        break;
      }
      if (*(_DWORD *)(v26 + 416 * v24 + 4) != *(_DWORD *)(v27 + 416 * v24 + 4)) {
        break;
      }
      if (*(_DWORD *)(v26 + 416 * v24 + 280) != *(_DWORD *)(v27 + 416 * v24 + 280)) {
        break;
      }
      uint64_t v30 = *(unsigned int *)(v26 + 416 * v24 + 284);
      if (v30 != *(_DWORD *)(v27 + 416 * v24 + 284)) {
        break;
      }
      uint64_t v31 = v29;
      int v32 = v28;
      if ((int)v30 >= 1)
      {
        do
        {
          uint64_t v21 = (uint64_t)(v31 + 2);
          if (*v32 != *v31 || *(v32 - 1) != *(v31 - 1)) {
            goto LABEL_19;
          }
          v32 += 2;
          v31 += 2;
        }
        while (--v30);
      }
      ++v24;
      v28 += 104;
      v29 += 104;
      BOOL v25 = v24 >= v23;
    }
    while (v24 != v23);
LABEL_19:
    if (v25)
    {
LABEL_20:
      gckSessionSendLSAACK(a1, *(_DWORD *)(a2 + 88), *(_DWORD *)(a2 + 72), *(unsigned __int16 *)(a3 + 12));
      int v33 = gcks_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        int v34 = *(_DWORD *)(a2 + 88);
        *(_DWORD *)buf = 67109120;
        int v108 = v34;
        _os_log_impl(&dword_218756000, v33, OS_LOG_TYPE_DEFAULT, "Duplicate LSA from participant %08X: ignoring.", buf, 8u);
      }
      uint64_t v35 = v10;
LABEL_117:
      pthread_mutex_unlock(v35);
      return;
    }
  }
  *(_DWORD *)(a2 + 680) = v23;
  int v36 = *(_DWORD *)(a3 + 16);
  if (v36 < 1)
  {
    int v40 = v105;
  }
  else
  {
    uint64_t v37 = 0;
    uint64_t v38 = *(void *)(a3 + 24);
    uint64_t v39 = 288;
    int v40 = v105;
    do
    {
      uint64_t v41 = v38 + 416 * v37;
      BOOL v42 = (void *)(*(void *)(a2 + 688) + 416 * v37);
      *BOOL v42 = *(void *)v41;
      v42[35] = *(void *)(v41 + 280);
      if (*(int *)(v41 + 284) >= 1)
      {
        uint64_t v43 = 0;
        do
        {
          *(void *)(*(void *)(a2 + 688) + v39 + 8 * v43) = *(void *)(v38 + v39 + 8 * v43);
          ++v43;
          uint64_t v38 = *(void *)(a3 + 24);
        }
        while (v43 < *(int *)(v38 + 416 * v37 + 284));
        int v36 = *(_DWORD *)(a3 + 16);
      }
      ++v37;
      v39 += 416;
    }
    while (v37 < v36);
  }
  if ((int)v6 < 1)
  {
    char v45 = 0;
  }
  else
  {
    uint64_t v44 = 0;
    char v45 = 0;
    int v46 = v40 + 72;
    do
    {
      uint64_t v47 = v40[104 * v44 + 71];
      long long v48 = v46;
      if ((int)v47 >= 1)
      {
        while (1)
        {
          int v49 = *v48;
          v48 += 2;
          if (v49 == *(_DWORD *)(a1 + 416)) {
            break;
          }
          if (!--v47) {
            goto LABEL_39;
          }
        }
        char v45 = 1;
      }
LABEL_39:
      ++v44;
      v46 += 104;
    }
    while (v44 != v6);
  }
  if (v36 == 1 && !((*v40 != *(_DWORD *)(a2 + 88)) | v45 & 1))
  {
    os_log_t v52 = gcks_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v52, OS_LOG_TYPE_DEFAULT, "Got declining LSA.", buf, 2u);
    }
    unint64_t v53 = *(unsigned int *)(a1 + 420);
    int v40 = v105;
    uint64_t v21 = *v105;
    if ((int)v53 < 1) {
      goto LABEL_55;
    }
    if (*(_DWORD *)v106 != v21)
    {
      CFArrayRef v54 = (int *)(a1 + 840);
      uint64_t v55 = 1;
      do
      {
        unint64_t v56 = v55;
        if (v53 == v55) {
          break;
        }
        int v57 = *v54;
        ++v55;
        v54 += 104;
      }
      while (v57 != v21);
      if (v56 >= v53)
      {
LABEL_55:
        PostEventCallback(*(void *)(a1 + 408), v21, 2, (char *)v105 + 9, *((unsigned __int8 *)v105 + 8), 0);
        int v40 = v105;
      }
    }
    *(_DWORD *)(a2 + 56) = 1;
    int v58 = *(_DWORD *)(a1 + 16);
    if (v58 != -1)
    {
      *(_DWORD *)(a1 + 16) = -1;
      close(v58);
      int v40 = v105;
    }
    goto LABEL_58;
  }
  if (*(_DWORD *)(a2 + 64))
  {
LABEL_58:
    BOOL v98 = v10;
    if ((int)v6 < 1)
    {
      unsigned int v103 = 0;
LABEL_100:
      gckSessionUpdateRoutingTable(a1, v21);
      gckSessionSendLSAACK(a1, *(_DWORD *)(a2 + 88), *(_DWORD *)(a2 + 72), *(unsigned __int16 *)(a3 + 12));
      BOOL IsNewInformationAvailableForParticipant = gckIsNewInformationAvailableForParticipant(*(_DWORD *)(a1 + 420), v106, *(_DWORD *)(a2 + 88));
      gckPreemptivelyClearFlagsForTransientNodes(a1, (uint64_t)v9, v103);
      if (IsNewInformationAvailableForParticipant) {
        int v86 = -1;
      }
      else {
        int v86 = *(_DWORD *)(a2 + 88);
      }
      gckSessionSendLSA(a1, *(_DWORD *)(a1 + 420), v106, v86, 0);
      int v87 = v103;
      gckSessionHandleRemainingDisconnectedNodes(a1, 0);
      uint64_t v89 = *(unsigned int *)(a1 + 420);
      if (v87 >= 1)
      {
        uint64_t v90 = 0;
        uint64_t v91 = v103;
        int v105 = (unsigned int *)(a1 + 433);
        *(void *)&long long v88 = 67109120;
        long long v106 = v88;
        do
        {
          if ((int)v89 >= 1)
          {
            uint64_t v92 = v89;
            uint32_t v93 = (char *)v105;
            do
            {
              if (*(_DWORD *)&v9[4 * v90] == *(_DWORD *)(v93 - 9) && *(_DWORD *)(v93 - 5) != -1)
              {
                uint64_t v94 = gcks_log();
                if (os_log_type_enabled(v94, OS_LOG_TYPE_DEFAULT))
                {
                  int v95 = *(_DWORD *)(v93 - 9);
                  *(_DWORD *)buf = v106;
                  int v108 = v95;
                  _os_log_impl(&dword_218756000, v94, OS_LOG_TYPE_DEFAULT, "Connected to participant [%08X] (new connection).", buf, 8u);
                }
                PostEventCallback(*(void *)(a1 + 408), *(_DWORD *)(v93 - 9), 0, v93, *(v93 - 1), 0);
              }
              v93 += 416;
              --v92;
            }
            while (v92);
          }
          ++v90;
        }
        while (v90 != v91);
      }
      int v96 = gcks_log();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        int v108 = v89;
        __int16 v109 = 1024;
        unsigned int v110 = v103;
        _os_log_impl(&dword_218756000, v96, OS_LOG_TYPE_DEFAULT, "Number of nodes in the routing table [%d] -- New nodes [%d].", buf, 0xEu);
      }
      uint64_t v35 = v98;
      goto LABEL_117;
    }
    uint64_t v59 = 0;
    unsigned int v103 = 0;
    uint64_t v60 = a1 + 712;
    *(void *)&long long v22 = 67109632;
    long long v99 = v22;
    *(void *)&long long v22 = 67109120;
    long long v101 = v22;
    uint64_t v104 = a1 + 712;
    uint64_t v102 = v6;
    while (1)
    {
      uint64_t v61 = *(unsigned int *)(a1 + 420);
      if ((int)v61 < 1)
      {
        LODWORD(v62) = 0;
      }
      else
      {
        uint64_t v62 = 0;
        os_log_t v63 = &v40[104 * v59];
        long long v64 = (int *)v106;
        while (*v63 != *v64)
        {
          ++v62;
          v64 += 104;
          if (v61 == v62) {
            goto LABEL_74;
          }
        }
        uint64_t v65 = &v40[104 * v59];
        if (*((unsigned __int16 *)v65 + 136) <= *((unsigned __int16 *)v64 + 136))
        {
          uint64_t v6 = v102;
        }
        else
        {
          os_log_t v100 = (os_log_t)gcks_log();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEFAULT))
          {
            int v66 = *((unsigned __int16 *)v65 + 136);
            unsigned int v67 = *((unsigned __int16 *)v64 + 136);
            int v68 = *v64;
            *(_DWORD *)buf = v99;
            int v108 = v66;
            __int16 v109 = 1024;
            unsigned int v110 = v67;
            __int16 v111 = 1024;
            int v112 = v68;
            _os_log_impl(&dword_218756000, v100, OS_LOG_TYPE_DEFAULT, "LSA has newer information (LSA SN [%d]/our SN [%d]) about participant [%08X]. Updating the routing table.", buf, 0x14u);
          }
          memcpy(v64, v63, 0x1A0uLL);
          if (v64[71])
          {
            uint64_t v6 = v102;
            int v40 = v105;
          }
          else
          {
            unint64_t v79 = gcks_log();
            BOOL v80 = os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT);
            uint64_t v6 = v102;
            if (v80)
            {
              int v81 = *v64;
              *(_DWORD *)buf = v101;
              int v108 = v81;
              _os_log_impl(&dword_218756000, v79, OS_LOG_TYPE_DEFAULT, "Participant [%08X] is disconnected.", buf, 8u);
            }
            uint64_t v82 = *(unsigned int *)(a1 + 708);
            int v40 = v105;
            if ((int)v82 > 0)
            {
              uint64_t v83 = 0;
              uint64_t v84 = 8 * v82;
              uint64_t v60 = v104;
              while (*(_DWORD *)(v104 + v83) != *v64)
              {
                v83 += 8;
                if (v84 == v83) {
                  goto LABEL_73;
                }
              }
              gckSessionDeleteNeighbor(a1, (int *)(v104 + v83));
              gckSessionRequestLSAUpdateForNode((int *)v106);
              uint64_t v60 = v104;
              int v40 = v105;
              goto LABEL_73;
            }
          }
          uint64_t v60 = v104;
        }
      }
LABEL_73:
      if (v62 == v61)
      {
LABEL_74:
        int v69 = &v40[104 * v59];
        if (v69[71])
        {
          int v70 = *(_DWORD *)(a1 + 420);
          unint64_t v71 = gcks_log();
          BOOL v72 = os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT);
          if (v70 > 15)
          {
            if (v72)
            {
              int v78 = *v69;
              *(_DWORD *)buf = v101;
              int v108 = v78;
              _os_log_impl(&dword_218756000, v71, OS_LOG_TYPE_DEFAULT, "Maximum number of nodes reached. Ignoring node [%08X].", buf, 8u);
            }
          }
          else
          {
            if (v72)
            {
              int v73 = *v69;
              *(_DWORD *)buf = v101;
              int v108 = v73;
              _os_log_impl(&dword_218756000, v71, OS_LOG_TYPE_DEFAULT, "Adding participant [%08X] to the routing table.", buf, 8u);
            }
            memcpy((void *)(v106 + 416 * *(int *)(a1 + 420)), v69, 0x1A0uLL);
            ++*(_DWORD *)(a1 + 420);
            unsigned int v74 = v103;
            *(_DWORD *)&v9[4 * v103] = *v69;
            unsigned int v103 = v74 + 1;
          }
          uint64_t v60 = v104;
          int v40 = v105;
        }
        else
        {
          uint64_t v75 = *(unsigned int *)(a1 + 708);
          if ((int)v75 >= 1)
          {
            uint64_t v76 = 0;
            uint64_t v77 = 8 * v75;
            while (*(_DWORD *)(v60 + v76) != *v69)
            {
              v76 += 8;
              if (v77 == v76) {
                goto LABEL_88;
              }
            }
            gckSessionDeleteNeighbor(a1, (int *)(v60 + v76));
            gckSessionRequestLSAUpdateForNode((int *)v106);
            uint64_t v60 = v104;
LABEL_88:
            int v40 = v105;
          }
        }
      }
      if (++v59 == v6) {
        goto LABEL_100;
      }
    }
  }
  pthread_mutex_unlock(v10);
  uint64_t v50 = gcks_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    int v51 = *(_DWORD *)(a2 + 88);
    *(_DWORD *)buf = 67109120;
    int v108 = v51;
    _os_log_impl(&dword_218756000, v50, OS_LOG_TYPE_DEFAULT, "Premature LSA from participant %08X: ignoring.", buf, 8u);
  }
}

BOOL gckIsNewInformationAvailableForParticipant(int a1, uint64_t a2, int a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 < 1)
  {
    return 0;
  }
  else
  {
    uint64_t v4 = 0;
    int v5 = (_DWORD *)(a2 + 280);
    BOOL v6 = 1;
    while (!*(v5 - 1) || *v5 == a3)
    {
      v5 += 104;
      BOOL v6 = ++v4 < (unint64_t)a1;
      if (a1 == v4) {
        return v6;
      }
    }
    uint64_t v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "New information is available for participant [%08X].", (uint8_t *)v9, 8u);
    }
  }
  return v6;
}

void gckSessionSendDD(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  long long v25 = 0u;
  long long v26 = 0u;
  unint64_t v24 = 0;
  uint64_t v8 = (pthread_mutex_t *)(a1 + 7080);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 7080));
  HIDWORD(v25) = *(_DWORD *)(a1 + 420);
  *(void *)&long long v26 = a1 + 424;
  uint64_t v9 = *(void *)(a1 + 7184);
  if (!v9)
  {
LABEL_5:
    uint64_t v10 = gcks_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = a2;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Couldn't find cList with iPriority == 0 for participant [%08X].", buf, 8u);
    }
    pthread_mutex_unlock(v8);
    return;
  }
  while (*(_DWORD *)(v9 + 88) != a2 || *(_DWORD *)(v9 + 80))
  {
    uint64_t v9 = *(void *)(v9 + 832);
    if (!v9) {
      goto LABEL_5;
    }
  }
  if (!*(_DWORD *)(v9 + 60)) {
    gckSessionRequestLSAUpdateForNode((int *)(a1 + 424));
  }
  int v11 = OSPFMakeDD(&v24, (uint64_t)&v25, 0, *(_DWORD *)(a1 + 416), a2, *(_DWORD *)(v9 + 32));
  *(_DWORD *)(v9 + 60) = 1;
  pthread_mutex_unlock(v8);
  if (v11 < 0)
  {
    int v14 = gcks_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      gckSessionSendDD_cold_1();
    }
    return;
  }
  if (!a4)
  {
    int v15 = gcks_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v28 = " back";
      __int16 v29 = 1024;
      int v30 = v11;
      __int16 v31 = 1024;
      unsigned int v32 = a2;
      _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "Sending DD%s with %d bytes to participant %08X.", buf, 0x18u);
    }
    pthread_mutex_lock(v8);
    TracePrintNodes(a1, *(_DWORD *)(a1 + 420), a1 + 424, 1, *(_DWORD *)(a1 + 416));
    pthread_mutex_unlock(v8);
    SendUDPPacketToParticipantChannelID(a1, (uint64_t)v24, v11, a2, 0, a3, 0);
    goto LABEL_24;
  }
  uint64_t v12 = *(void *)(a1 + 7184);
  if (!v12)
  {
LABEL_17:
    unsigned int v13 = gcks_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v28) = a2;
      _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "Couldn't find cList with iPriority == 0 for participant [%08X].", buf, 8u);
    }
LABEL_24:
    free(v24);
    return;
  }
  while (*(_DWORD *)(v12 + 88) != a2 || *(_DWORD *)(v12 + 80))
  {
    uint64_t v12 = *(void *)(v12 + 832);
    if (!v12) {
      goto LABEL_17;
    }
  }
  int v16 = (pthread_mutex_t *)(v12 + 768);
  pthread_mutex_lock((pthread_mutex_t *)(v12 + 768));
  uint64_t v17 = *(void *)(v12 + 600);
  if (v17)
  {
    while (1)
    {
      uint64_t v18 = v17;
      if (*(unsigned char *)v17 == 2) {
        break;
      }
      uint64_t v17 = *(void *)(v17 + 64);
      if (!v17)
      {
        int v19 = (void *)(v18 + 64);
        goto LABEL_30;
      }
    }
    *(_OWORD *)(v17 + 8) = xmmword_21878BAE0;
    *(void *)(v17 + 32) = 0x4082BFEB851EB852;
    long long v22 = *(void **)(v17 + 40);
    if (v22) {
      free(v22);
    }
    *(void *)(v18 + 40) = v24;
    *(_DWORD *)(v18 + 48) = v11;
    *(_DWORD *)(v18 + 52) = a2;
  }
  else
  {
    int v19 = (void *)(v12 + 600);
LABEL_30:
    uint32_t v20 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
    *uint32_t v20 = 2;
    *(_OWORD *)(v20 + 8) = xmmword_21878BAE0;
    uint64_t v21 = v24;
    *((void *)v20 + 4) = 0x4082BFEB851EB852;
    *((void *)v20 + 5) = v21;
    *((_DWORD *)v20 + 12) = v11;
    *((_DWORD *)v20 + 13) = a2;
    void *v19 = v20;
  }
  pthread_mutex_unlock(v16);
  int v23 = *(_DWORD *)(a1 + 16);
  if (v23 != -1)
  {
    *(_DWORD *)(a1 + 16) = -1;
    close(v23);
  }
}

void gckPreemptivelyClearFlagsForTransientNodes(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  if (a2 && a3 >= 1)
  {
    uint64_t v4 = 0;
    int v5 = (int *)(a1 + 424);
    uint64_t v6 = a3;
    do
    {
      uint64_t v7 = v6;
      uint64_t v8 = v5;
      do
      {
        if (*(_DWORD *)(a2 + 4 * v4) == *v8 && v8[1] == -1)
        {
          uint64_t v9 = gcks_log();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            int v10 = *v8;
            *(_DWORD *)buf = 67109120;
            int v12 = v10;
            _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Received LSA with no route to previously unknown participant [%08X] (no old connection).", buf, 8u);
          }
          v8[69] = 0;
        }
        v8 += 104;
        --v7;
      }
      while (v7);
      ++v4;
    }
    while (v4 != v6);
  }
}

__n128 gckSessionSendLSA(uint64_t a1, unsigned int a2, uint64_t a3, int a4, int a5)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v31 = 0;
  uint64_t v32 = 0;
  uint64_t v34 = a3;
  uint64_t v33 = a2;
  if (*(int *)(a1 + 708) >= 1)
  {
    uint64_t v9 = 0;
    unsigned int v10 = 0;
    int v30 = 0;
    result.n128_u64[0] = 67109376;
    do
    {
      unsigned int v12 = *(_DWORD *)(a1 + 8 * v9 + 712);
      if (v12 != a4)
      {
        __int16 v13 = *(_WORD *)(a1 + 20);
        *(_WORD *)(a1 + 20) = v13 + 1;
        WORD2(v32) = v13;
        int v14 = OSPFMakeLSA(&v30, (uint64_t)&v31, 0, *(_DWORD *)(a1 + 416), v12, 0);
        if (v14 < 0)
        {
          uint64_t v17 = gcks_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_218756000, v17, OS_LOG_TYPE_DEFAULT, "OSPFMakeLSA failed.", buf, 2u);
          }
        }
        else
        {
          uint64_t v15 = *(void *)(a1 + 7184);
          if (!v15) {
            goto LABEL_24;
          }
          int v16 = v14;
          while (v12 != *(_DWORD *)(v15 + 88) || *(_DWORD *)(v15 + 80))
          {
            uint64_t v15 = *(void *)(v15 + 832);
            if (!v15) {
              goto LABEL_24;
            }
          }
          if (!*(_DWORD *)(v15 + 60) && a5 == 0)
          {
LABEL_24:
            free(v30);
          }
          else
          {
            int v19 = (pthread_mutex_t *)(v15 + 768);
            pthread_mutex_lock((pthread_mutex_t *)(v15 + 768));
            uint32_t v20 = (void *)(v15 + 600);
            do
            {
              uint64_t v21 = v20;
              uint64_t v22 = *v20;
              uint32_t v20 = (void *)(*v20 + 64);
            }
            while (v22);
            int v23 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x10200409EACE7F9uLL);
            *int v23 = 4;
            *(_OWORD *)(v23 + 8) = xmmword_21878BAE0;
            unint64_t v24 = v30;
            *((void *)v23 + 4) = 0x4082BFEB851EB852;
            *((void *)v23 + 5) = v24;
            *((_DWORD *)v23 + 12) = v16;
            *((_DWORD *)v23 + 13) = v12;
            *((_WORD *)v23 + 28) = WORD2(v32);
            *uint64_t v21 = v23;
            pthread_mutex_unlock(v19);
            long long v25 = gcks_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109376;
              int v36 = WORD2(v32);
              __int16 v37 = 1024;
              unsigned int v38 = v12;
              _os_log_impl(&dword_218756000, v25, OS_LOG_TYPE_DEFAULT, "Sending LSA with SN [%d] to participant [%08X].", buf, 0xEu);
            }
            int v26 = *(_DWORD *)(a1 + 16);
            if (v26 != -1)
            {
              *(_DWORD *)(a1 + 16) = -1;
              close(v26);
            }
            ++v10;
          }
        }
      }
      ++v9;
    }
    while (v9 < *(int *)(a1 + 708));
    if (v10)
    {
      TracePrintNodes(a1, a2, a3, 1, *(_DWORD *)(a1 + 416));
      uint64_t v27 = gcks_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v28 = *(_DWORD *)(a1 + 416);
        *(_DWORD *)buf = 67109376;
        int v36 = v28;
        __int16 v37 = 1024;
        unsigned int v38 = v10;
        _os_log_impl(&dword_218756000, v27, OS_LOG_TYPE_DEFAULT, "I am participant %08X. Just sent LSAs to %d participants.", buf, 0xEu);
      }
    }
  }
  return result;
}

void gckSessionHandleRemainingDisconnectedNodes(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = (_DWORD *)MEMORY[0x270FA5388](a1, a2);
  int v4 = v3;
  uint64_t v6 = v5;
  int v8 = v7;
  uint64_t v9 = (uint64_t)v2;
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v17 = 0;
  gckSessionFindAndRemoveDisconnectedNodes(v2, (uint64_t)v18, &v17);
  uint64_t v10 = v17;
  if (v17 >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      int v12 = v18[104 * v11];
      uint64_t v13 = v4;
      int v14 = v6;
      if (v4 < 1)
      {
LABEL_6:
        gckSessionDisconnectParticipant(v9, v18[104 * v11], (char *)&v18[104 * v11 + 2] + 1, LOBYTE(v18[104 * v11 + 2]), v8);
        for (uint64_t i = *(void *)(v9 + 7184); i; uint64_t i = *(void *)(i + 832))
        {
          if (*(_DWORD *)(i + 88) == v12) {
            gckSessionScheduleCListClose(i, v8);
          }
        }
      }
      else
      {
        while (1)
        {
          int v15 = *v14++;
          if (v15 == v12) {
            break;
          }
          if (!--v13) {
            goto LABEL_6;
          }
        }
      }
      ++v11;
    }
    while (v11 != v10);
  }
}

void gckSessionRequestLSAUpdateForNode(int *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  ++*((_WORD *)a1 + 136);
  a1[69] = 1;
  uint64_t v2 = gcks_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *a1;
    int v4 = *((unsigned __int16 *)a1 + 136);
    v5[0] = 67109376;
    v5[1] = v3;
    __int16 v6 = 1024;
    int v7 = v4;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Requesting LSA update for node with ID [%08X] serial number [%d].", (uint8_t *)v5, 0xEu);
  }
}

_DWORD *gckSessionFindAndRemoveDisconnectedNodes(_DWORD *result, uint64_t a2, _DWORD *a3)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v3 = result[105];
  if (v3 < 1)
  {
    int v7 = 0;
  }
  else
  {
    uint64_t v5 = (uint64_t)result;
    int v6 = 0;
    int v7 = 0;
    do
    {
      uint64_t v8 = (_DWORD *)(v5 + 416 * v6);
      v8[175] = 0;
      if (v8[107] == -1)
      {
        uint64_t v9 = v8 + 106;
        uint64_t v10 = gcks_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          int v11 = *v9;
          *(_DWORD *)buf = 136315394;
          uint64_t v17 = v5 + 416 * v6 + 433;
          __int16 v18 = 1024;
          int v19 = v11;
          _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "No route to participant \"%s\"[%08X] -- disconnected.", buf, 0x12u);
        }
        int v12 = *(_DWORD *)(v5 + 708);
        if (v12 >= 1)
        {
          for (int i = 0; i < v12; ++i)
          {
            uint64_t v14 = v5 + 8 * i;
            if (*(_DWORD *)(v14 + 712) == *v9)
            {
              gckSessionDeleteNeighbor(v5, (int *)(v14 + 712));
              --i;
              int v12 = *(_DWORD *)(v5 + 708);
            }
          }
        }
        memcpy((void *)(a2 + 416 * v7), v9, 0x1A0uLL);
        __n128 result = gckSessionDeleteDisconnectedNode(v5, v9);
        --v6;
        int v3 = *(_DWORD *)(v5 + 420);
        ++v7;
      }
      ++v6;
    }
    while (v6 < v3);
  }
  *a3 = v7;
  return result;
}

void gckSessionDeleteNeighbor(uint64_t a1, int *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  int v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    v8[0] = 67109120;
    v8[1] = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Deleting neighbor representing participant %08X.", (uint8_t *)v8, 8u);
  }
  uint64_t v6 = *(int *)(a1 + 708) - 1;
  int v7 = (int *)(a1 + 8 * v6 + 712);
  if (v7 != a2)
  {
    *(void *)a2 = *(void *)v7;
    LODWORD(v6) = *(_DWORD *)(a1 + 708) - 1;
  }
  *(_DWORD *)(a1 + 708) = v6;
}

void *gckSessionDeleteDisconnectedNode(uint64_t a1, int *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *a2;
    v7[0] = 67109120;
    v7[1] = v5;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Deleting node for participant %08X.", (uint8_t *)v7, 8u);
  }
  __n128 result = memmove(a2, (const void *)(a1 + 416 * *(int *)(a1 + 420) + 8), 0x1A0uLL);
  --*(_DWORD *)(a1 + 420);
  return result;
}

void gckSessionDisconnectParticipant(uint64_t a1, int a2, const void *a3, int a4, int a5)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v10 = gcks_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16[0] = 67109120;
    v16[1] = a2;
    _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Disconnecting participant [%08X].", (uint8_t *)v16, 8u);
  }
  uint64_t v11 = *(void *)(a1 + 408);
  uint64_t v12 = *(unsigned int *)(v11 + 168);
  if ((int)v12 < 1)
  {
    LODWORD(v13) = 0;
  }
  else
  {
    uint64_t v13 = 0;
    while (*(_DWORD *)(v11 + 172 + 4 * v13) != a2)
    {
      if (v12 == ++v13)
      {
        LODWORD(v13) = *(_DWORD *)(v11 + 168);
        break;
      }
    }
  }
  if (v13 <= 0xF && v13 == v12)
  {
    *(_DWORD *)(v11 + 4 * v12 + 172) = a2;
    *(_DWORD *)(v11 + 168) = v12 + 1;
  }
  if (a5) {
    int v14 = -2145779689;
  }
  else {
    int v14 = 0;
  }
  PostEventCallback(v11, a2, 2, a3, a4, v14);
  for (uint64_t i = *(void *)(a1 + 7184); i; uint64_t i = *(void *)(i + 832))
  {
    if (*(_DWORD *)(i + 88) == a2) {
      gckSessionScheduleCListClose(i, a5);
    }
  }
}

void gckSessionScheduleCListClose(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v4 = gcks_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = *(_DWORD *)(a1 + 88);
    int v6 = *(_DWORD *)(a1 + 72);
    v8[0] = 67109376;
    v8[1] = v5;
    __int16 v9 = 1024;
    int v10 = v6;
    _os_log_impl(&dword_218756000, v4, OS_LOG_TYPE_DEFAULT, "Scheduling to close CList corresponding to participant (%08X), channel %d.", (uint8_t *)v8, 0xEu);
  }
  *(_DWORD *)(a1 + 56) = 1;
  if (a2)
  {
    *(double *)(a1 + 8) = micro();
    int v7 = gcks_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8[0]) = 0;
      _os_log_impl(&dword_218756000, v7, OS_LOG_TYPE_DEFAULT, "Timed out, enforcing clean up.", (uint8_t *)v8, 2u);
    }
  }
}

void gckSessionSendLSAACK(uint64_t a1, unsigned int a2, int a3, int a4)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  memset(v12, 0, sizeof(v12));
  uint64_t v11 = 0;
  WORD6(v12[0]) = a4;
  int v8 = OSPFMakeLSAACK(&v11, (uint64_t)v12, 0, *(_DWORD *)(a1 + 416), a2);
  __int16 v9 = gcks_log();
  int v10 = v9;
  if (v8 < 0)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      gckSessionSendLSAACK_cold_1();
    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      int v14 = a4;
      __int16 v15 = 1024;
      unsigned int v16 = a2;
      _os_log_impl(&dword_218756000, v10, OS_LOG_TYPE_DEFAULT, "Sending LSAACK with SN [%d] to participant [%08X].", buf, 0xEu);
    }
    SendUDPPacketToParticipantChannelID(a1, (uint64_t)v11, v8, a2, 0, a3, 0);
    free(v11);
  }
}

uint64_t gckSessionHandleDeletedNode(_DWORD *a1, int a2, int a3)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v6 = a1[177];
  if ((int)v6 < 1)
  {
    LODWORD(v7) = 0;
  }
  else
  {
    uint64_t v7 = 0;
    int v8 = a1 + 178;
    while (1)
    {
      int v9 = *v8;
      v8 += 2;
      if (v9 == a2) {
        break;
      }
      if (v6 == ++v7) {
        goto LABEL_8;
      }
    }
  }
  if (v7 == v6)
  {
LABEL_8:
    uint64_t v10 = 2149187606;
    uint64_t v11 = gcks_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v21[0] = 67109120;
      v21[1] = a2;
      _os_log_impl(&dword_218756000, v11, OS_LOG_TYPE_DEFAULT, "Participant %08X not found.", (uint8_t *)v21, 8u);
    }
  }
  else
  {
    uint64_t v12 = &a1[2 * v7 + 178];
    int v13 = v12[1];
    gckSessionDeleteNeighbor((uint64_t)a1, v12);
    if (v13 != -1 || a3 != 0)
    {
      gckSessionRequestLSAUpdateForNode(a1 + 106);
      if (a3)
      {
        int v16 = a1[105];
        if (v16 >= 1)
        {
          unint64_t v17 = 0;
          uint64_t v18 = 416 * v16;
          while (1)
          {
            int v19 = &a1[v17 / 4];
            if (a1[v17 / 4 + 106] == a2) {
              break;
            }
            v17 += 416;
            if (v18 == v17) {
              goto LABEL_21;
            }
          }
          gckSessionDisconnectParticipant((uint64_t)a1, a2, (char *)v19 + 433, *((unsigned __int8 *)v19 + 432), 1);
          gckSessionDeleteDisconnectedNode((uint64_t)a1, v19 + 106);
        }
      }
LABEL_21:
      gckSessionUpdateRoutingTable((uint64_t)a1, v15);
    }
    return 0;
  }
  return v10;
}

uint64_t gckSessionGetInterfacePriorityForCList(uint64_t a1, uint64_t a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  int v2 = *(_DWORD *)(a2 + 384);
  if ((v2 & 0x100) != 0) {
    return 4;
  }
  if ((v2 & 4) != 0) {
    return 1;
  }
  CFArrayRef v5 = SCNetworkInterfaceCopyAll();
  if (!v5)
  {
    uint64_t v21 = gcks_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      gckSessionGetInterfacePriorityForCList_cold_1();
    }
    return 0;
  }
  CFArrayRef v6 = v5;
  CFIndex Count = CFArrayGetCount(v5);
  if (Count < 1) {
    goto LABEL_19;
  }
  CFIndex v8 = Count;
  CFIndex v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __SCNetworkInterface *)CFArrayGetValueAtIndex(v6, v9);
    if (ValueAtIndex)
    {
      uint64_t v11 = ValueAtIndex;
      CFStringRef InterfaceType = SCNetworkInterfaceGetInterfaceType(ValueAtIndex);
      CFStringRef BSDName = SCNetworkInterfaceGetBSDName(v11);
      CStringPtr = CFStringGetCStringPtr(BSDName, 0x8000100u);
      if (!CStringPtr)
      {
        if (CFStringGetCString(BSDName, buffer, 256, 0x8000100u)) {
          CStringPtr = buffer;
        }
        else {
          CStringPtr = 0;
        }
      }
      if (!InterfaceType || !BSDName || !CStringPtr)
      {
        uint64_t v15 = gcks_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v16 = CFStringGetCStringPtr(InterfaceType, 0x8000100u);
          unint64_t v17 = CFStringGetCStringPtr(BSDName, 0x8000100u);
          int v18 = *(_DWORD *)(a2 + 88);
          int v19 = *(_DWORD *)(a2 + 72);
          *(_DWORD *)buf = 136315906;
          uint64_t v35 = v16;
          __int16 v36 = 2080;
          __int16 v37 = v17;
          __int16 v38 = 1024;
          int v39 = v18;
          __int16 v40 = 1024;
          int v41 = v19;
          _os_log_impl(&dword_218756000, v15, OS_LOG_TYPE_DEFAULT, "Invalid type [%s] or bsd name [%s] for participant [%08X] channelID [%d].", buf, 0x22u);
        }
        goto LABEL_18;
      }
      if (!strcmp((const char *)(a2 + 388), CStringPtr)) {
        break;
      }
    }
LABEL_18:
    if (v8 == ++v9) {
      goto LABEL_19;
    }
  }
  if (CFEqual(InterfaceType, (CFStringRef)*MEMORY[0x263F1BCA8]))
  {
    uint64_t v20 = 3;
    goto LABEL_20;
  }
  if (CFEqual(InterfaceType, (CFStringRef)*MEMORY[0x263F1BCA0]))
  {
    *(_DWORD *)buf = 0;
    *(void *)existing = 0;
    uint64_t IORegistryEntryID = _SCNetworkInterfaceGetIORegistryEntryID();
    if (!IORegistryEntryID)
    {
      mach_port_t v29 = 0;
LABEL_44:
      if (*(_DWORD *)buf) {
        mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)buf);
      }
      if (v29)
      {
        if (*(_DWORD *)(a1 + 7540)) {
          uint64_t v20 = 7;
        }
        else {
          uint64_t v20 = 5;
        }
      }
      else
      {
        uint64_t v20 = 6;
      }
      goto LABEL_20;
    }
    uint64_t v28 = IORegistryEntryID;
    IOMasterPort(*MEMORY[0x263EF87F0], (mach_port_t *)buf);
    mach_port_t v29 = *(_DWORD *)buf;
    if (*(_DWORD *)buf)
    {
      CFDictionaryRef v30 = IORegistryEntryIDMatching(v28);
      IOServiceGetMatchingServices(v29, v30, &existing[1]);
      if (!existing[1])
      {
        mach_port_t v29 = 0;
LABEL_42:
        if (existing[0]) {
          IOObjectRelease(existing[0]);
        }
        goto LABEL_44;
      }
      io_registry_entry_t v31 = IOIteratorNext(existing[1]);
      io_object_t v32 = v31;
      if (v31 && (IORegistryEntryGetParentEntry(v31, "IOService", existing), existing[0])) {
        mach_port_t v29 = IOObjectConformsTo(existing[0], "AppleUSBDeviceNCMData");
      }
      else {
        mach_port_t v29 = 0;
      }
    }
    else
    {
      io_object_t v32 = 0;
    }
    if (existing[1]) {
      IOObjectRelease(existing[1]);
    }
    if (v32) {
      IOObjectRelease(v32);
    }
    goto LABEL_42;
  }
  int v23 = gcks_log();
  uint64_t v20 = 0;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v24 = CFStringGetCStringPtr(InterfaceType, 0x8000100u);
    int v25 = *(_DWORD *)(a2 + 88);
    int v26 = *(_DWORD *)(a2 + 72);
    *(_DWORD *)buf = 136315906;
    uint64_t v35 = v24;
    __int16 v36 = 2080;
    __int16 v37 = CStringPtr;
    __int16 v38 = 1024;
    int v39 = v25;
    __int16 v40 = 1024;
    int v41 = v26;
    _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Unexpected type [%s] for bsd name [%s] of participant [%08X] channelID [%d].", buf, 0x22u);
LABEL_19:
    uint64_t v20 = 0;
  }
LABEL_20:
  CFRelease(v6);
  return v20;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t OUTLINED_FUNCTION_7_0()
{
  return [v0 displayNameAndPID];
}

void OUTLINED_FUNCTION_4_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t AGPSendingSetElement::buffer(CAGP **this, unsigned __int8 *a2, unsigned int a3, int a4, unsigned int a5, unsigned int a6, char a7)
{
  int v14 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  BOOL can_buffer = AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
  uint64_t v16 = 0xFFFFFFFFLL;
  if (a5 <= a6 && a2 && a3 - 1 <= 0x5DB && can_buffer)
  {
    unsigned int v17 = *((unsigned __int8 *)this + 699);
    if (v17 > 0x3F)
    {
      uint64_t v16 = 0xFFFFFFFFLL;
    }
    else
    {
      *((unsigned char *)this + 699) = v17 + 1;
      uint64_t v16 = *((unsigned __int8 *)this + 697);
      *((unsigned char *)this + 697) = (v16 + 1) & 0x3F;
      int v18 = &this[v16];
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFFFFE | !AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)this, 1);
      *((_DWORD *)v18[15] + 2) |= 2u;
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFC0FF | ((v16 & 0x3F) << 8);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFFF03 | (4 * (*((unsigned char *)this + 698) & 0x3F));
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0x3FFFFFF | (*((unsigned __int8 *)this + 697) << 26);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFFFC0FF | ((v16 & 0x3F) << 8);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFFF03FFF | ((a5 & 0x3F) << 14);
      *((_DWORD *)v18[15] + 2) = *((_DWORD *)v18[15] + 2) & 0xFC0FFFFF | ((a6 & 0x3F) << 20);
      int v19 = *((_DWORD *)this + 27);
      *((_DWORD *)this + 27) = v19 + 1;
      *(_DWORD *)v18[15] = v19;
      int v20 = CAGP::current_timestamp(this[1]);
      uint64_t v21 = v18[15];
      *((_DWORD *)v21 + 1) = v20;
      *((_DWORD *)v21 + 3) = a3;
      *((_DWORD *)v21 + 379) = a4;
      *((unsigned char *)this + v16 + 632) = a7;
      memcpy((char *)v18[15] + 16, a2, a3);
      this[12] = (CAGP *)((unint64_t)this[12] | (1 << v16));
      uint64_t v22 = this[1];
      ++*((_DWORD *)v22 + 92);
      *((_DWORD *)v22 + 93) += a3;
    }
  }
  pthread_mutex_unlock(v14);
  return v16;
}

BOOL AGPAssociationSetElement::can_buffer(AGPAssociationSetElement *this, BOOL a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  int v5 = *((unsigned __int8 *)this + 698);
  int v6 = *((unsigned __int8 *)this + 696);
  if (v5 == v6)
  {
    int v7 = 0;
    if (!a2) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  int v7 = ((((v6 - v5) & ~((v6 - v5) >> 31)) + v5 - v6 + 63) & 0xFFFFFFC0) + v6 - v5;
  if (a2) {
LABEL_5:
  }
    a2 = 64 - v7 - *((unsigned __int8 *)this + 699) >= a2;
LABEL_6:
  pthread_mutex_unlock(v4);
  return a2;
}

uint64_t CAGP::current_timestamp(CAGP *this)
{
  uint64_t v2 = *((unsigned int *)this + 52);
  if (!gettimeofday(&v6, 0))
  {
    uint64_t v3 = (v6.tv_usec / 1000 + 1000 * (SLODWORD(v6.tv_sec) % 604800)) % 0x240C8400u;
    uint64_t v2 = *((unsigned int *)this + 52);
    if (v2 == -1
      || (v2 > v3 ? (BOOL v4 = (v2 - v3) >= 0x12064201) : (BOOL v4 = 1), v4))
    {
      *((_DWORD *)this + 52) = v3;
      return v3;
    }
  }
  return v2;
}

uint64_t AGPSendingSetElement::search(AGPSendingSetElement *this, int a2)
{
  BOOL v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  int v5 = *((unsigned __int8 *)this + 699);
  if (*((unsigned char *)this + 699))
  {
    uint64_t v6 = *((unsigned __int8 *)this + 696);
    while (**((_DWORD **)this + v6 + 15) != a2)
    {
      uint64_t v6 = ((int)v6 + 1) & 0x3FLL;
      if (!--v5) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = 0xFFFFFFFFLL;
  }
  pthread_mutex_unlock(v4);
  return v6;
}

uint64_t AGPSendingSetElement::remove(AGPSendingSetElement *this, unsigned int a2)
{
  BOOL v4 = (pthread_mutex_t *)((char *)this + 32);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  if (a2 <= 0x3F
    && (int v5 = (char *)this + 8 * a2, v8 = (_DWORD *)*((void *)v5 + 15), v7 = v5 + 120, v6 = v8, (v9 = v8[3]) != 0))
  {
    uint64_t v10 = a2;
    int v11 = v6[380];
    uint64_t v12 = (CAGP *)*((void *)this + 1);
    *((_DWORD *)v12 + 94) += v11;
    *((_DWORD *)v12 + 95) += v11 * v9;
    v6[3] = 0;
    if (v6[1] != -1)
    {
      int v13 = CAGP::current_timestamp(v12);
      uint64_t v6 = *(_DWORD **)v7;
      int v14 = v13 - *(_DWORD *)(*(void *)v7 + 4);
      int v15 = v14 <= -302400000 ? v14 + 604800000 : v13 - *(_DWORD *)(*(void *)v7 + 4);
      if (v15 >= 1)
      {
        pthread_mutex_lock(v4);
        UpdateRTO((unsigned int *)this + 175, v15);
        pthread_mutex_unlock(v4);
        uint64_t v6 = *(_DWORD **)v7;
      }
    }
    v6[380] = 0;
    *((unsigned char *)this + v10 + 632) = 0x80;
    *(_DWORD *)(*(void *)v7 + 4) = -1;
    uint64_t v16 = 1;
    *((void *)this + 12) &= ~(1 << v10);
    if (*((unsigned char *)this + 699))
    {
      unsigned __int8 v17 = *((unsigned char *)this + 696);
LABEL_11:
      uint64_t v18 = *((void *)this + v17 + 15);
      if (!*(_DWORD *)(v18 + 12))
      {
        int v19 = ((*(_DWORD *)(v18 + 8) >> 20) & 0x3F) + 1;
        int v20 = v19;
        unsigned __int8 v21 = v17;
        while (1)
        {
          uint64_t v22 = *((void *)this + v21 + 15);
          if (*(_DWORD *)(v22 + 12) || (*(unsigned char *)(v22 + 8) & 2) == 0) {
            break;
          }
          unsigned __int8 v21 = (v21 + 1) & 0x3F;
          if (!(_BYTE)--v20)
          {
            do
            {
              --v19;
              --*((unsigned char *)this + 699);
              uint64_t v23 = *((void *)this + v17 + 15);
              *(_DWORD *)(v23 + 8) &= ~2u;
              unsigned __int8 v17 = (*((unsigned char *)this + 696) + 1) & 0x3F;
              *((unsigned char *)this + 696) = v17;
            }
            while ((_BYTE)v19);
            uint64_t v16 = 1;
            if (*((unsigned char *)this + 699)) {
              goto LABEL_11;
            }
            goto LABEL_21;
          }
        }
      }
      uint64_t v16 = 1;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
LABEL_21:
  pthread_mutex_unlock(v4);
  return v16;
}

BOOL associationSetElementEqual(_DWORD *a1, _DWORD *a2)
{
  return a1[26] == a2[26];
}

uint64_t associationSetElementHashCode(unsigned int *a1)
{
  return a1[26];
}

const void *retainAssociationSetElement(const __CFAllocator *a1, const void *a2)
{
  return a2;
}

void releaseAssociationSetElement(const __CFAllocator *a1, void *a2)
{
  uint64_t v2 = a2[1];
  a2[2] = *(void *)(v2 + 200);
  *(void *)(v2 + 200) = a2;
}

uint64_t checkSendingSet(char *a1, _DWORD *a2)
{
  v20[185] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)a2;
  int v4 = a2[2];
  int v5 = (pthread_mutex_t *)(*(void *)a2 + 64);
  pthread_mutex_lock(v5);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 32));
  for (unsigned int i = 0; ; ++i)
  {
    uint64_t v7 = ((_BYTE)i + a1[698]) & 0x3F;
    CFIndex v8 = *(__int16 **)&a1[8 * v7 + 120];
    if (v8)
    {
      if (*((_DWORD *)v8 + 3) && (v8[4] & 2) != 0 && *((_DWORD *)v8 + 1) != -1)
      {
        int v9 = CAGP::current_timestamp((CAGP *)v3);
        int v10 = v9 - *((_DWORD *)v8 + 1);
        if (v10 <= -302400000) {
          v10 += 604800000;
        }
        int v11 = *((_DWORD *)a1 + 178);
        if (v11)
        {
          if (v10 > 3 * v11) {
            break;
          }
        }
      }
    }
    if (i > 0x3E) {
      goto LABEL_15;
    }
LABEL_14:
    ;
  }
  v14[0] = 5;
  v14[1] = a1[v7 + 632];
  __int16 checksum = 0;
  int v12 = *((_DWORD *)a1 + 26);
  int v16 = *(_DWORD *)(v3 + 16);
  int v17 = v12;
  int v18 = *(_DWORD *)v8;
  int v19 = *((_DWORD *)v8 + 2) & 0x3FFFF03 | (4 * (a1[698] & 0x3F)) | (a1[697] << 26);
  *((_DWORD *)v8 + 1) = v9;
  ++*((_DWORD *)v8 + 380);
  memcpy(v20, v8 + 8, *((unsigned int *)v8 + 3));
  __int16 checksum = agp_control::generate_checksum((agp_control *)v14, v8 + 8, *((_DWORD *)v8 + 3));
  if (GCKSessionSendTo(*(void *)(v3 + 24), (uint64_t)(a1 + 104), 1, (uint64_t)v14, (*((_DWORD *)v8 + 3) + 20), 0, 64, 0, 0, *((_DWORD *)v8 + 379), v4) != -1072037833&& i < 0x3F)
  {
    goto LABEL_14;
  }
LABEL_15:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 32));
  return pthread_mutex_unlock(v5);
}

uint64_t agp_control::generate_checksum(agp_control *this, __int16 *a2, int a3)
{
  if (*(unsigned char *)this)
  {
    __int16 v3 = 0;
    int v4 = 2 * *(unsigned __int8 *)this;
    do
    {
      __int16 v5 = *(_WORD *)this;
      this = (agp_control *)((char *)this + 2);
      v3 += v5;
      --v4;
    }
    while (v4);
    if (!a2) {
      return (unsigned __int16)~v3;
    }
  }
  else
  {
    __int16 v3 = 0;
    if (!a2) {
      return (unsigned __int16)~v3;
    }
  }
  if (a3 >= 2)
  {
    unsigned int v6 = a3 >> 1;
    do
    {
      __int16 v7 = *a2++;
      v3 += v7;
      --v6;
    }
    while (v6);
  }
  if (a3) {
    v3 += *(unsigned __int8 *)a2;
  }
  return (unsigned __int16)~v3;
}

uint64_t AGPTransportCallback(uint64_t a1, unsigned int *a2, int a3, unsigned __int8 *a4, int a5, uint64_t a6, unsigned __int8 *a7, uint64_t a8, unsigned __int8 a9, unsigned __int8 a10, unsigned __int8 a11, int a12)
{
  uint64_t v19 = CheckInHandleDebug();
  if (v19)
  {
    uint64_t v20 = v19;
    if (a3 < 1)
    {
      if (a3)
      {
        uint64_t v41 = -a3;
        AGPDataQueue::disconnect((uint64_t **)(v19 + 216), a2, -a3);
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 64));
        uint64_t v42 = v41;
        uint64_t v43 = a2;
        do
        {
          int v44 = *v43++;
          char v45 = *(_DWORD **)(v20 + 48);
          v45[26] = v44;
          value = 0;
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v20 + 40), v45, (const void **)&value)) {
            CFSetRemoveValue(*(CFMutableSetRef *)(v20 + 40), value);
          }
          --v42;
        }
        while (v42);
        while (1)
        {
          int v46 = *(void **)(v20 + 200);
          if (!v46) {
            break;
          }
          *(void *)(v20 + 200) = v46[2];
          (*(void (**)(void *))(*v46 + 8))(v46);
        }
        pthread_mutex_unlock((pthread_mutex_t *)(v20 + 64));
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 128));
        do
        {
          int v47 = *a2++;
          long long v48 = *(_DWORD **)(v20 + 56);
          v48[26] = v47;
          value = 0;
          if (CFSetGetValueIfPresent(*(CFSetRef *)(v20 + 32), v48, (const void **)&value)) {
            CFSetRemoveValue(*(CFMutableSetRef *)(v20 + 32), value);
          }
          --v41;
        }
        while (v41);
        while (1)
        {
          int v49 = *(void **)(v20 + 200);
          if (!v49) {
            break;
          }
          *(void *)(v20 + 200) = v49[2];
          (*(void (**)(void *))(*v49 + 8))(v49);
        }
        uint64_t v50 = (pthread_mutex_t *)(v20 + 128);
      }
      else
      {
        pthread_mutex_lock((pthread_mutex_t *)(v19 + 224));
        while (1)
        {
          pthread_mutex_lock((pthread_mutex_t *)(v20 + 224));
          uint64_t v51 = *(void *)(v20 + 216);
          pthread_mutex_unlock((pthread_mutex_t *)(v20 + 224));
          if (!v51) {
            break;
          }
          CFDataRef v52 = *(const __CFData **)(v51 + 80);
          if (v52)
          {
            uint64_t v53 = *(unsigned int *)(v51 + 72);
            BytePtr = CFDataGetBytePtr(v52);
            int Length = CFDataGetLength(*(CFDataRef *)(v51 + 80));
            if (AGPSessionSendTo(a1, (int *)(v51 + 8), v53, (uint64_t)BytePtr, Length, 0, 2, *(_DWORD *)(v51 + 88), a12, 0))break; {
          }
            }
          unint64_t v56 = *(void **)(v51 + 96);
          if (v56)
          {
            global_queue = dispatch_get_global_queue(0, 0);
            dispatch_async(global_queue, v56);
          }
          pthread_mutex_lock((pthread_mutex_t *)(v20 + 224));
          int v58 = *(CFTypeRef **)(v20 + 216);
          *(void *)(v20 + 216) = *v58;
          pthread_mutex_unlock((pthread_mutex_t *)(v20 + 224));
          AGPDataQueueNode::~AGPDataQueueNode(v58);
          MEMORY[0x21D471970](v58, 0x10E0C40923426B4);
        }
        pthread_mutex_lock((pthread_mutex_t *)(v20 + 64));
        value = (void *)v20;
        int v63 = a12;
        CFSetApplyFunction(*(CFSetRef *)(v20 + 40), (CFSetApplierFunction)checkSendingSet, &value);
        pthread_mutex_unlock((pthread_mutex_t *)(v20 + 64));
        uint64_t v50 = (pthread_mutex_t *)(v20 + 224);
      }
      pthread_mutex_unlock(v50);
    }
    else
    {
      uint64_t v21 = a9;
      if ((a9 & 0x40) == 0)
      {
        uint64_t v60 = (agp_control *)a4;
        *a4 = 0;
        a4[1] = a9;
        *((_WORD *)a4 + 1) = 0;
        if ((a9 & 2) != 0)
        {
          LODWORD(v24) = a4 + 4;
        }
        else
        {
          *((_DWORD *)a4 + 1) = *(_DWORD *)(v19 + 16);
          uint64_t v22 = a4 + 8;
          uint64_t v23 = a3;
          unint64_t v24 = v22;
          do
          {
            int v25 = (CAGP **)CAGP::sendingSetElement((pthread_mutex_t *)v20, *a2);
            int v26 = AGPSendingSetElement::buffer(v25, a7, a8, a6, a10, a11, v21);
            if (v26 < 0)
            {
              __int16 v38 = agps_log();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
                AGPTransportCallback(&value, (unsigned char *)&value + 1);
              }
            }
            else
            {
              *(_DWORD *)uint64_t v22 = *a2;
              uint64_t v61 = v24;
              uint64_t v27 = v21;
              uint64_t v28 = a6;
              mach_port_t v29 = a7;
              uint64_t v30 = a8;
              io_registry_entry_t v31 = &v25[v26];
              *((_DWORD *)v22 + 1) = *(_DWORD *)v31[15];
              unsigned int v32 = *((_DWORD *)v22 + 2) & 0xFFFFFFFC | !AGPAssociationSetElement::can_buffer((AGPAssociationSetElement *)v25, 1) | 2;
              *((_DWORD *)v22 + 2) = v32;
              unsigned int v33 = v32 & 0xFFFFFF03 | (4 * ((*((_DWORD *)v31[15] + 2) >> 2) & 0x3F));
              *((_DWORD *)v22 + 2) = v33;
              unsigned int v34 = v33 & 0xFFFFC0FF | (((*((_DWORD *)v31[15] + 2) >> 8) & 0x3F) << 8);
              *((_DWORD *)v22 + 2) = v34;
              unsigned int v35 = v34 & 0xFFF03FFF | (((*((_DWORD *)v31[15] + 2) >> 14) & 0x3F) << 14);
              *((_DWORD *)v22 + 2) = v35;
              unsigned int v36 = v35 & 0xFC0FFFFF | (((*((_DWORD *)v31[15] + 2) >> 20) & 0x3F) << 20);
              *((_DWORD *)v22 + 2) = v36;
              __int16 v37 = v31[15];
              a8 = v30;
              a7 = v29;
              a6 = v28;
              uint64_t v21 = v27;
              *((_DWORD *)v22 + 2) = *((_DWORD *)v37 + 2) & 0xFC000000 | v36 & 0x3FFFFFF;
              unint64_t v24 = v61 + 12;
              v22 += 12;
            }
            ++a2;
            --v23;
          }
          while (v23);
        }
        *(unsigned char *)uint64_t v60 = (v24 - v60 + 3) >> 2;
        *((_WORD *)v60 + 1) = agp_control::generate_checksum(v60, (__int16 *)a7, a8);
        uint64_t v40 = 4 * *(unsigned __int8 *)v60;
        goto LABEL_43;
      }
    }
    uint64_t v40 = 0;
LABEL_43:
    CheckOutHandleDebug();
    return v40;
  }
  int v39 = agps_log();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
    AGPTransportCallback(a3, v39);
  }
  return 0xFFFFFFFFLL;
}

void sub_21877FE20(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void *CAGP::sendingSetElement(pthread_mutex_t *this, int a2)
{
  int v4 = this + 1;
  pthread_mutex_lock(this + 1);
  CFSetRef v5 = *(const __CFSet **)&this->__opaque[32];
  unsigned int v6 = *(_DWORD **)&this->__opaque[40];
  v6[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(v5, v6, (const void **)&value)) {
    operator new();
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_21877FEFC(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::disconnect(uint64_t **this, unsigned int *a2, int a3)
{
  unsigned int v6 = (pthread_mutex_t *)(this + 1);
  pthread_mutex_lock((pthread_mutex_t *)(this + 1));
  if (a3 >= 1)
  {
    uint64_t v7 = 0;
    CFIndex v8 = *this;
    do
    {
      if (v8)
      {
        unsigned int v9 = a2[v7];
        int v10 = v8;
        do
        {
          int v11 = *((_DWORD *)v10 + 18);
          int v12 = v11 - 1;
          if (v11 >= 1)
          {
            uint64_t v13 = 0;
            int v14 = (_DWORD *)v10 + 3;
            int v15 = v11 - 1;
            while (*((_DWORD *)v10 + v13 + 2) != v9)
            {
              ++v13;
              ++v14;
              --v15;
              if ((int)v13 >= v11) {
                goto LABEL_14;
              }
            }
            if ((int)v13 < v12)
            {
              do
              {
                *(v14 - 1) = *v14;
                ++v14;
                --v15;
              }
              while (v15);
              int v12 = *((_DWORD *)v10 + 18) - 1;
            }
            *((_DWORD *)v10 + 18) = v12;
          }
LABEL_14:
          int v10 = (uint64_t *)*v10;
        }
        while (v10);
      }
      ++v7;
    }
    while (v7 != a3);
  }

  return pthread_mutex_unlock(v6);
}

uint64_t AGPSessionSendTo(uint64_t a1, int *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, unsigned int a8, int a9, void *a10)
{
  uint64_t v10 = 0;
  uint64_t v62 = *MEMORY[0x263EF8340];
  if ((int)a3 < 1) {
    return v10;
  }
  uint64_t v11 = a4;
  if (!a4) {
    return v10;
  }
  int v12 = a5;
  if (a5 < 1) {
    return v10;
  }
  uint64_t v15 = CheckInHandleDebug();
  if (!v15)
  {
    uint64_t v10 = 2149187586;
    int v39 = agps_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      AGPSessionSendTo_cold_1(v39);
    }
    return v10;
  }
  unsigned int v57 = a8;
  unsigned int v48 = 0;
  int v49 = (uint64_t *)(v15 + 216);
  char v45 = (pthread_mutex_t *)(v15 + 224);
  int v47 = 1115 - 16 * a3;
  int v17 = (pthread_mutex_t *)v15;
  uint64_t v44 = v15;
  while (1)
  {
    memset(v61, 0, sizeof(v61));
    if (v47 < 0)
    {
      uint64_t v40 = agps_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        AGPSessionSendTo_cold_2(&v59, v60);
      }
      goto LABEL_62;
    }
    int v18 = a10;
    unint64_t v19 = 0;
    int v20 = 0;
    char v21 = 1;
    do
    {
      unint64_t v22 = v19;
      *((void *)v61 + v19) = v11;
      if (v12 >= v47) {
        int v23 = 1115 - 16 * a3;
      }
      else {
        int v23 = v12;
      }
      *(_DWORD *)&v60[4 * v19 + 15] = v23;
      unsigned __int8 v24 = v21;
      v20 += v23;
      v12 -= v23;
      v11 += v23;
      ++v19;
      if (v22 > 6) {
        break;
      }
      ++v21;
    }
    while (v12 > 0);
    unsigned __int8 v55 = v19 - 1;
    if ((_BYTE)v19 != 1 && a7 == 1) {
      a7 = 0;
    }
    CFArrayRef v54 = v18;
    int v53 = a7;
    if (!a7)
    {
      char v27 = 0;
      int v28 = v12 > 0;
      goto LABEL_24;
    }
    if (a7 != 1) {
      break;
    }
    char v27 = 1;
    int v28 = 2;
LABEL_24:
    unsigned int v52 = v28;
    pthread_mutex_lock(v45);
    uint64_t v29 = *v49;
    pthread_mutex_unlock(v45);
    BOOL v30 = v29 != 0;
    if ((v27 & 1) == 0 && v29)
    {
      unsigned __int8 v24 = 0;
      unsigned int v31 = 0;
      a10 = v54;
      a7 = v53;
      goto LABEL_42;
    }
    int v26 = a2 + 1;
    char v51 = v27;
    BOOL v50 = v29 != 0;
    if (v52 > 1)
    {
      unsigned int v52 = 2;
LABEL_37:
      uint64_t v36 = 0;
      int v17 = (pthread_mutex_t *)v44;
      do
      {
        ++*(_DWORD *)(v44 + 360);
        uint64_t v37 = *(unsigned int *)&v60[4 * v36 + 15];
        *(_DWORD *)(v44 + 364) += v37;
        GCKSessionSendTo(*(void *)(v44 + 24), (uint64_t)a2, a3, *((void *)v61 + v36), v37, a6, v52, v36, v55, v57, a9);
        ++v36;
      }
      while (v22 + 1 != v36);
      a7 = v53;
      unsigned int v31 = v48;
      a10 = v54;
      goto LABEL_40;
    }
    int v18 = v54;
    a7 = v53;
LABEL_29:
    unsigned int v32 = (AGPAssociationSetElement *)CAGP::sendingSetElement(v17, *a2);
    if (AGPAssociationSetElement::can_buffer(v32, v19))
    {
      unint64_t v33 = 0;
      char v34 = v51;
      while (a3 - 1 != v33)
      {
        unsigned int v35 = (AGPAssociationSetElement *)CAGP::sendingSetElement(v17, v26[v33++]);
        if (!AGPAssociationSetElement::can_buffer(v35, v19))
        {
          if (v33 >= a3) {
            goto LABEL_37;
          }
          unsigned __int8 v24 = 0;
          unsigned int v31 = -2145648639;
          a10 = v54;
          a7 = v53;
          goto LABEL_41;
        }
      }
      goto LABEL_37;
    }
    unsigned __int8 v24 = 0;
    unsigned int v31 = -2145648639;
    a10 = v18;
LABEL_40:
    char v34 = v51;
LABEL_41:
    unsigned int v48 = v31;
    BOOL v30 = v50;
    if (v34) {
      goto LABEL_63;
    }
LABEL_42:
    if (v30) {
      uint64_t v10 = v31;
    }
    else {
      uint64_t v10 = 0;
    }
    if (v31) {
      int v38 = 1;
    }
    else {
      int v38 = v30;
    }
    if (v12 > 0) {
      int v38 = 1;
    }
    if (v24 <= v55 && v38) {
      operator new();
    }
    if (v12 < 1 || v10) {
      goto LABEL_64;
    }
  }
  if (a7 == 2)
  {
    BOOL v50 = 0;
    char v51 = 1;
    unsigned int v52 = v12 > 0;
    int v26 = a2 + 1;
    goto LABEL_29;
  }
  uint64_t v41 = agps_log();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    AGPSessionSendTo_cold_3(&v59, v60);
    a10 = v18;
LABEL_62:
    unsigned int v48 = -2145648639;
    goto LABEL_63;
  }
  unsigned int v48 = -2145648639;
  a10 = v18;
LABEL_63:
  uint64_t v10 = v48;
LABEL_64:
  if (a10)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    dispatch_async(global_queue, a10);
  }
  CheckOutHandleDebug();
  return v10;
}

uint64_t AGPSessionCreate()
{
  if (CheckInHandleDebug())
  {
    CheckOutHandleDebug();
    operator new();
  }
  return 2149187586;
}

void sub_218780698(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPSessionRelease()
{
  uint64_t v0 = CheckInHandleDebug();
  if (!v0) {
    return 2149187586;
  }
  uint64_t v1 = (pthread_mutex_t *)v0;
  CheckOutHandleDebug();
  CAGP::~CAGP(v1);
  MEMORY[0x21D471970](v1, 0x10A0C40A2D6C30DLL);
  return 0;
}

void sub_21878074C(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A0C40A2D6C30DLL);
  _Unwind_Resume(a1);
}

uint64_t AGPDataQueue::add_tail(uint64_t a1, void *a2)
{
  __int16 v3 = (void **)a1;
  int v4 = (pthread_mutex_t *)(a1 + 8);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 8));
  for (unsigned int i = *v3; i; unsigned int i = (void *)*i)
  {
    __int16 v3 = (void **)i;
    if (i == a2) {
      a2 = 0;
    }
  }
  NSObject *v3 = a2;

  return pthread_mutex_unlock(v4);
}

uint64_t AGPSessionRecvFrom(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  int v5 = a2;
  uint64_t v111 = *MEMORY[0x263EF8340];
  unsigned int v109 = a2;
  if (!a1 || !a3 || !*(void *)(a3 + 8) || (*(_DWORD *)(a3 + 16) - 1) > 0x5DB)
  {
    uint64_t v15 = agps_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      if (a3)
      {
        uint64_t v20 = *(void *)(a3 + 8);
        int v21 = *(_DWORD *)(a3 + 16);
      }
      else
      {
        uint64_t v20 = 0;
        int v21 = 0;
      }
      *(_DWORD *)unsigned int v110 = 67109632;
      *(_DWORD *)&v110[4] = v5;
      *(_WORD *)&v110[8] = 2048;
      *(void *)&v110[10] = v20;
      *(_WORD *)&v110[18] = 1024;
      *(_DWORD *)&v110[20] = v21;
      _os_log_error_impl(&dword_218756000, v15, OS_LOG_TYPE_ERROR, "Could not process a packet for participant [%08X], event-buffer [%p], event->size [%d].", v110, 0x18u);
    }
    return 0;
  }
  CFIndex v8 = (pthread_mutex_t *)(a1 + 128);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 128));
  unsigned int v9 = (pthread_mutex_t *)CAGP::receiveSetElement((CAGP *)a1, v5);
  uint64_t v10 = *(unsigned __int8 **)(a3 + 8);
  uint64_t v11 = 4 * *v10;
  int v12 = *(_DWORD *)(a3 + 16);
  if (v12 < (int)v11 || v9 == 0) {
    goto LABEL_10;
  }
  long long v106 = v9;
  int v17 = *((unsigned __int16 *)v10 + 1);
  *((_WORD *)v10 + 1) = 0;
  int checksum = agp_control::generate_checksum((agp_control *)v10, (__int16 *)&v10[v11], v12 - (int)v11);
  if (v17 != checksum)
  {
    int v22 = checksum;
    int v23 = agps_log();
    uint64_t v14 = 0;
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    *(_DWORD *)unsigned int v110 = 67109376;
    *(_DWORD *)&v110[4] = v17;
    *(_WORD *)&v110[8] = 1024;
    *(_DWORD *)&v110[10] = v22;
    _os_log_impl(&dword_218756000, v23, OS_LOG_TYPE_DEFAULT, "Incoming packet for participant (%08X) failed checksum check -> given (%04x) calculated (04x).", v110, 0xEu);
    goto LABEL_10;
  }
  unsigned int v19 = v10[1];
  if (v19 >= 2 && v19 != 11)
  {
    if (v19 == 2)
    {
      *(void *)(a3 + 8) += v11;
      *(_DWORD *)(a3 + 16) -= v11;
      uint64_t v14 = 1;
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  uint64_t v24 = 0;
  int v25 = v106;
  do
  {
    if (v24 + 20 > v11) {
      goto LABEL_10;
    }
    int v26 = *(_DWORD *)&v10[v24 + 8];
    v24 += 12;
  }
  while (v26 != *(_DWORD *)(a1 + 16));
  *(void *)(a3 + 8) += v11;
  *(_DWORD *)(a3 + 16) -= v11;
  if (v19 < 2)
  {
    unsigned int v47 = *(_DWORD *)&v10[v24];
    unsigned int v48 = *(_DWORD *)&v25[1].__opaque[36];
    if (v47 >= v48 || *(_DWORD *)&v25[1].__opaque[40] == -1)
    {
      BOOL v51 = 0;
      uint64_t v14 = 1;
    }
    else
    {
      int v49 = CAGP::current_timestamp((CAGP *)a1);
      unsigned int v48 = *(_DWORD *)&v25[1].__opaque[36];
      int v50 = v49 - *(_DWORD *)&v25[1].__opaque[40];
      if (v50 <= -302400000) {
        v50 += 604800000;
      }
      BOOL v51 = v50 > 1000;
      uint64_t v14 = v50 < 1001;
      unsigned int v47 = *(_DWORD *)&v10[v24];
    }
    if (v47 >= v48 || v51)
    {
      if (v51) {
        goto LABEL_76;
      }
      int v66 = v25;
      unsigned int v67 = &v10[v24];
      unint64_t v68 = ((unint64_t)*(unsigned int *)&v10[v24 + 4] >> 8) & 0x3F;
      uint64_t v14 = *(void *)&v66[1].__opaque[8 * v68 + 48];
      if (!v14)
      {
LABEL_11:
        pthread_mutex_unlock(v8);
        return v14;
      }
      if (!*(_DWORD *)(v14 + 12))
      {
        v106[9].__opaque[v68 + 48] = v10[1];
        memcpy((void *)(v14 + 16), *(const void **)(a3 + 8), *(int *)(a3 + 16));
        *(_DWORD *)uint64_t v14 = *(_DWORD *)&v10[v24];
        *(_DWORD *)(v14 + 8) = *((_DWORD *)v67 + 1);
        *(_DWORD *)(v14 + 12) = *(_DWORD *)(a3 + 16);
        *(_DWORD *)(v14 + 1516) = a4;
        unsigned int v69 = *((_DWORD *)v67 + 1);
        int v70 = (v69 >> 14) & 0x3F;
        LODWORD(v100) = *(_DWORD *)&v10[v24] - v70;
        unint64_t v105 = ((v69 >> 8) & 0x3F) - v70;
        uint64_t v97 = a1 + 296;
        BOOL v98 = (AGPDataQueue *)(a1 + 288);
        while (1)
        {
          int v71 = 0;
          LODWORD(v101) = (v69 >> 20) & 0x3F;
          LODWORD(v102) = v101 + 1;
          LODWORD(v104) = 1;
          int v25 = v106;
          do
          {
            *(void *)&long long v103 = ((_BYTE)v105 + (_BYTE)v71) & 0x3F;
            BOOL v72 = *(int **)&v25[1].__opaque[8 * v103 + 48];
            if (!v72)
            {
              uint64_t v90 = agps_log();
              if (!os_log_type_enabled(v90, OS_LOG_TYPE_ERROR)) {
                goto LABEL_135;
              }
              *(_DWORD *)unsigned int v110 = 67109120;
              *(_DWORD *)&v110[4] = v103;
              uint64_t v91 = "No buffer pointer for message fragment @index %d.";
              uint64_t v92 = v90;
              uint32_t v93 = 8;
LABEL_140:
              _os_log_error_impl(&dword_218756000, v92, OS_LOG_TYPE_ERROR, v91, v110, v93);
              goto LABEL_135;
            }
            if (!v72[3]) {
              goto LABEL_136;
            }
            unsigned int v73 = v72[2];
            if (((v73 >> 20) & 0x3F) != v101)
            {
              uint64_t v94 = agps_log();
              if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
              {
                int v95 = (v72[2] >> 20) & 0x3F;
                *(_DWORD *)unsigned int v110 = 67109632;
                *(_DWORD *)&v110[4] = v103;
                *(_WORD *)&v110[8] = 1024;
                *(_DWORD *)&v110[10] = v95;
                *(_WORD *)&v110[14] = 1024;
                *(_DWORD *)&v110[16] = v101;
                uint64_t v91 = "Fragment @index %d has incorrect maximum segment count: %d should be %d.";
                goto LABEL_139;
              }
LABEL_135:
              int v25 = v106;
LABEL_136:
              uint64_t v14 = 0;
              int v5 = v109;
LABEL_76:
              *(void *)&v110[20] = 0;
              int v53 = *(_DWORD *)(a1 + 16);
              *(_DWORD *)unsigned int v110 = 2823;
              *(_DWORD *)&v110[4] = v53;
              *(_DWORD *)&v110[8] = v5;
              *(_DWORD *)&v110[12] = *(_DWORD *)&v10[v24];
              int v54 = v25[10].__opaque[48];
              *(_DWORD *)&v110[16] = *(_DWORD *)&v10[v24 + 4] & 0xFFFFFF03 | (4 * (v54 & 0x3F));
              unsigned int v55 = *(_DWORD *)&v10[v24 + 4];
              unsigned int v56 = v55 >> 2;
              unsigned int v57 = v55 >> 26;
              if ((v55 & 1) != 0 || v56 != v57)
              {
                uint64_t v58 = 0;
                int v59 = 0;
                BOOL v61 = (v55 & 1) == 0 || v56 != v57;
                do
                {
                  v59 |= v61 && v56 == v54;
                  if (v59)
                  {
                    uint64_t v62 = *(void *)&v25[1].__opaque[8 * v56 + 48];
                    if (v62)
                    {
                      if (*(_DWORD *)(v62 + 12) || (*(unsigned char *)(v62 + 8) & 2) != 0) {
                        v58 &= ~(1 << v56);
                      }
                      else {
                        v58 |= 1 << v56;
                      }
                      *(void *)&v110[20] = v58;
                    }
                  }
                  unsigned int v56 = ((_BYTE)v56 + 1) & 0x3F;
                  BOOL v61 = 1;
                }
                while (v56 != v57);
              }
              uint64_t v63 = 0;
              __int16 v64 = 0;
              do
              {
                v64 += *(_WORD *)&v110[v63];
                v63 += 2;
              }
              while (v63 != 28);
              *(_WORD *)&v110[2] = ~v64;
              *(int32x2_t *)(a1 + 384) = vadd_s32(*(int32x2_t *)(a1 + 384), (int32x2_t)0x1C00000001);
              int v65 = CAGP::current_timestamp((CAGP *)a1);
              *(_DWORD *)&v106[1].__opaque[40] = v65;
              pthread_mutex_unlock(v8);
              GCKSessionSendTo(*(void *)(a1 + 24), (uint64_t)&v109, 1, (uint64_t)v110, 28, 0, 64, 0, 0, a4, 1);
              return v14;
            }
            if (v100 + v71 != *v72)
            {
              uint64_t v94 = agps_log();
              if (!os_log_type_enabled(v94, OS_LOG_TYPE_ERROR)) {
                goto LABEL_135;
              }
              int v96 = *v72;
              *(_DWORD *)unsigned int v110 = 67109632;
              *(_DWORD *)&v110[4] = v103;
              *(_WORD *)&v110[8] = 1024;
              *(_DWORD *)&v110[10] = v96;
              *(_WORD *)&v110[14] = 1024;
              *(_DWORD *)&v110[16] = v100 + v71;
              uint64_t v91 = "Fragment @index %d has incorrect serial number: is %08X should be %08X.";
LABEL_139:
              uint64_t v92 = v94;
              uint32_t v93 = 20;
              goto LABEL_140;
            }
            if (v71 != ((v73 >> 14) & 0x3F))
            {
              os_log_t v99 = (os_log_t)agps_log();
              BOOL v74 = os_log_type_enabled(v99, OS_LOG_TYPE_ERROR);
              int v25 = v106;
              if (v74)
              {
                int v75 = *v72;
                int v76 = (v72[2] >> 14) & 0x3F;
                *(_DWORD *)unsigned int v110 = 67109888;
                *(_DWORD *)&v110[4] = v103;
                *(_WORD *)&v110[8] = 1024;
                *(_DWORD *)&v110[10] = v75;
                *(_WORD *)&v110[14] = 1024;
                *(_DWORD *)&v110[16] = v76;
                *(_WORD *)&v110[20] = 1024;
                *(_DWORD *)&v110[22] = v71;
                _os_log_error_impl(&dword_218756000, v99, OS_LOG_TYPE_ERROR, "Message fragment @index %d serial number %08X seg_idx %d should be %d.", v110, 0x1Au);
              }
            }
            LODWORD(v104) = (v25[9].__opaque[v103 + 48] != 1) & v104;
            ++v71;
          }
          while (v102 != v71);
          if (v100 != *(_DWORD *)&v25[1].__opaque[36]) {
            goto LABEL_136;
          }
          uint64_t v77 = AGPDataQueue::peek_head_for_participant(v98, v109);
          os_log_t v99 = (os_log_t)&v97;
          *(_OWORD *)unsigned int v110 = *(_OWORD *)a3;
          *(void *)&v110[16] = *(void *)(a3 + 16);
          MEMORY[0x270FA5388](v77, v78);
          int v80 = 0;
          uint64_t v82 = (char *)&v97 - v81;
          os_log_t v100 = (os_log_t)((char *)&v97 - v81);
          *(void *)&long long v103 = (char *)&v97 - v81;
          LODWORD(v101) = v79;
          do
          {
            uint64_t v83 = v106;
            uint64_t v84 = *(void *)&v106[1].__opaque[8 * (((_BYTE)v105 + (_BYTE)v80) & 0x3F) + 48];
            v106[10].__opaque[48] = (v106[10].__opaque[48] + 1) & 0x3F;
            ++*(_DWORD *)&v83[1].__opaque[36];
            if (v79)
            {
              memcpy(v82, (const void *)(v84 + 16), *(unsigned int *)(v84 + 12));
              int v79 = (int)v101;
            }
            else
            {
              *(void *)&long long v103 = v84 + 16;
            }
            v82 += *(unsigned int *)(v84 + 12);
            a4 = *(_DWORD *)(v84 + 1516);
            *(_DWORD *)uint64_t v84 = 0;
            *(void *)(v84 + 8) = 0;
            ++v80;
          }
          while (v102 != v80);
          *(void *)&v110[8] = v103;
          *(_DWORD *)&v110[16] = v82 - v100;
          if (v79) {
            operator new();
          }
          if (v104)
          {
            int v85 = a4 == 10 ? 5 : 3;
            *(_DWORD *)unsigned int v110 = v85;
            (*(void (**)(void, void, unsigned char *))a1)(*(void *)(a1 + 8), v109, v110);
            if (v101) {
              CFRelease(0);
            }
          }
          unint64_t v105 = v106[10].__opaque[48];
          int v86 = *(_DWORD **)&v106[1].__opaque[8 * v105 + 48];
          if (!v86) {
            goto LABEL_135;
          }
          if (!v86[3]) {
            goto LABEL_135;
          }
          int v87 = *(_DWORD *)&v106[1].__opaque[36];
          LODWORD(v100) = *v86;
          if (v100 != v87) {
            goto LABEL_135;
          }
          unsigned int v69 = v86[2];
        }
      }
    }
LABEL_10:
    uint64_t v14 = 0;
    goto LABEL_11;
  }
  pthread_mutex_unlock(v8);
  unint64_t v105 = a1 + 64;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 64));
  char v27 = (char *)CAGP::sendingSetElement((pthread_mutex_t *)a1, v5);
  long long v106 = (pthread_mutex_t *)(v27 + 32);
  pthread_mutex_lock((pthread_mutex_t *)(v27 + 32));
  if (!v27[699] || *(_DWORD *)&v10[v24] < **(_DWORD **)&v27[8 * v27[696] + 120]) {
    goto LABEL_129;
  }
  if (*(void *)&v10[v24 + 8])
  {
    int v29 = 0;
    long long v101 = v108;
    uint64_t v102 = &v110[20];
    while (1)
    {
      if (((unint64_t)*(unsigned int *)&v10[v24 + 8] >> (v29 + v27[698])))
      {
        uint64_t v30 = ((_BYTE)v29 + v27[698]) & 0x3F;
        uint64_t v31 = *(void *)&v27[8 * v30 + 120];
        if (v31)
        {
          if (*(_DWORD *)(v31 + 12) && (*(unsigned char *)(v31 + 8) & 2) != 0 && *(_DWORD *)(v31 + 4) != -1) {
            break;
          }
        }
      }
LABEL_47:
      if (++v29 == 64) {
        goto LABEL_48;
      }
    }
    int v32 = CAGP::current_timestamp((CAGP *)a1);
    int v33 = *(_DWORD *)(v31 + 4);
    LODWORD(v103) = v32;
    unsigned int v34 = v32 - v33;
    if (v32 - v33 < 0)
    {
      if (v34 > 0xEDF9BE00)
      {
        LODWORD(v104) = v32 - v33;
        os_log_t v100 = (os_log_t)agps_log();
        if (os_log_type_enabled(v100, OS_LOG_TYPE_ERROR)) {
          AGPSessionRecvFrom(&v107, v101);
        }
        goto LABEL_45;
      }
      v34 += 604800000;
    }
    LODWORD(v104) = v34;
LABEL_45:
    if ((int)v104 > *((_DWORD *)v27 + 178))
    {
      v110[0] = 5;
      v110[1] = v27[v30 + 632];
      *(_WORD *)&v110[2] = 0;
      *(_DWORD *)&v110[4] = *(_DWORD *)(a1 + 16);
      *(_DWORD *)&v110[8] = v109;
      *(_DWORD *)&v110[12] = *(_DWORD *)v31;
      *(_DWORD *)&v110[16] = *(_DWORD *)(v31 + 8) & 0x3FFFF03 | (4 * (v27[698] & 0x3F)) | (v27[697] << 26);
      *(_DWORD *)(v31 + 4) = v103;
      ++*(_DWORD *)(v31 + 1520);
      memcpy(v102, (const void *)(v31 + 16), *(unsigned int *)(v31 + 12));
      *(_WORD *)&v110[2] = agp_control::generate_checksum((agp_control *)v110, (__int16 *)(v31 + 16), *(_DWORD *)(v31 + 12));
      GCKSessionSendTo(*(void *)(a1 + 24), (uint64_t)&v109, 1, (uint64_t)v110, (*(_DWORD *)(v31 + 12) + 20), 0, 64, 0, 0, a4, 1);
    }
    goto LABEL_47;
  }
LABEL_48:
  int v35 = *(_DWORD *)&v10[v24 + 4] >> 2;
  int v36 = v27[698];
  if (v35 == v36) {
    goto LABEL_127;
  }
  *(void *)&long long v28 = 67109632;
  long long v104 = v28;
  *(void *)&long long v28 = 67109376;
  long long v103 = v28;
  while (1)
  {
    uint64_t v37 = *(void *)&v27[8 * v36 + 120];
    if (!v37) {
      break;
    }
    if (!*(_DWORD *)(v37 + 12) || (*(unsigned char *)(v37 + 8) & 2) == 0) {
      goto LABEL_61;
    }
    int v38 = AGPSendingSetElement::search((AGPSendingSetElement *)v27, *(_DWORD *)v37);
    if (v38 != v27[698] && (int v39 = agps_log(), os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)))
    {
      int v44 = v27[698];
      *(_DWORD *)unsigned int v110 = v103;
      *(_DWORD *)&v110[4] = v38;
      *(_WORD *)&v110[8] = 1024;
      *(_DWORD *)&v110[10] = v44;
      _os_log_error_impl(&dword_218756000, v39, OS_LOG_TYPE_ERROR, "SACK buf_idx [%d] != base [%d].", v110, 0xEu);
      if ((v38 & 0x80000000) == 0)
      {
LABEL_56:
        if (AGPSendingSetElement::remove((AGPSendingSetElement *)v27, v38)) {
          goto LABEL_61;
        }
        uint64_t v40 = agps_log();
        if (!os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          goto LABEL_61;
        }
        int v41 = *(_DWORD *)v37;
        *(_DWORD *)unsigned int v110 = v104;
        *(_DWORD *)&v110[4] = v38;
        *(_WORD *)&v110[8] = 1024;
        *(_DWORD *)&v110[10] = v41;
        *(_WORD *)&v110[14] = 1024;
        *(_DWORD *)&v110[16] = v109;
        uint64_t v42 = v40;
        uint64_t v43 = "Failed to remove index (%02d) packet serial number (%08X) from (%08X).";
        goto LABEL_64;
      }
    }
    else if ((v38 & 0x80000000) == 0)
    {
      goto LABEL_56;
    }
    char v45 = agps_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
    {
      int v46 = *(_DWORD *)v37;
      *(_DWORD *)unsigned int v110 = v104;
      *(_DWORD *)&v110[4] = -1;
      *(_WORD *)&v110[8] = 1024;
      *(_DWORD *)&v110[10] = v46;
      *(_WORD *)&v110[14] = 1024;
      *(_DWORD *)&v110[16] = v109;
      uint64_t v42 = v45;
      uint64_t v43 = "Index (%02d) packet serial number (%08X) from (%08X) was not found in sending set.";
LABEL_64:
      _os_log_error_impl(&dword_218756000, v42, OS_LOG_TYPE_ERROR, v43, v110, 0x14u);
    }
LABEL_61:
    int v36 = (v27[698] + 1) & 0x3F;
    v27[698] = v36;
    if (v35 == v36) {
      goto LABEL_127;
    }
  }
  long long v88 = agps_log();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR)) {
    AGPSessionRecvFrom(v88);
  }
LABEL_127:
  int v89 = AGPSendingSetElement::search((AGPSendingSetElement *)v27, *(_DWORD *)&v10[v24]);
  if ((v89 & 0x80000000) == 0) {
    AGPSendingSetElement::remove((AGPSendingSetElement *)v27, v89);
  }
LABEL_129:
  pthread_mutex_unlock(v106);
  pthread_mutex_unlock((pthread_mutex_t *)v105);
  return 0;
}

void sub_218781658(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void *CAGP::receiveSetElement(CAGP *this, int a2)
{
  int v4 = (pthread_mutex_t *)((char *)this + 128);
  pthread_mutex_lock((pthread_mutex_t *)this + 2);
  int v5 = (_DWORD *)*((void *)this + 7);
  v5[26] = a2;
  value = 0;
  if (!CFSetGetValueIfPresent(*((CFSetRef *)this + 4), v5, (const void **)&value)) {
    operator new();
  }
  pthread_mutex_unlock(v4);
  return value;
}

void sub_218781740(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

AGPDataQueue *AGPDataQueue::peek_head_for_participant(AGPDataQueue *this, int a2)
{
  __int16 v3 = this;
  int v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  do
    __int16 v3 = *(AGPDataQueue **)v3;
  while (v3 && (*((_DWORD *)v3 + 18) != 1 || *((_DWORD *)v3 + 2) != a2));
  pthread_mutex_unlock(v4);
  return v3;
}

AGPDataQueue **AGPDataQueue::pop_head_for_participant(AGPDataQueue *this, int a2)
{
  __int16 v3 = this;
  int v4 = (pthread_mutex_t *)((char *)this + 8);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 8));
  int v5 = *(AGPDataQueue **)v3;
  if (*(void *)v3)
  {
    unsigned int v6 = 0;
    uint64_t v7 = *(AGPDataQueue **)v3;
    CFIndex v8 = (AGPDataQueue **)v3;
    while (1)
    {
      unsigned int v9 = (AGPDataQueue **)v7;
      if (*((_DWORD *)v7 + 18) == 1 && *((_DWORD *)v7 + 2) == a2) {
        break;
      }
      uint64_t v7 = *(AGPDataQueue **)v7;
      unsigned int v6 = v8;
      CFIndex v8 = v9;
      if (!*v9) {
        goto LABEL_6;
      }
    }
    if (v6)
    {
      __int16 v3 = *v6;
      int v5 = v7;
    }
    *(void *)__int16 v3 = *(void *)v5;
  }
  else
  {
LABEL_6:
    unsigned int v9 = 0;
  }
  pthread_mutex_unlock(v4);
  return v9;
}

uint64_t AGPSessionEvent(uint64_t a1, uint64_t a2, long long *a3)
{
  uint64_t result = CheckInHandleDebug();
  if (result)
  {
    unsigned int v6 = (void (**)(uint64_t, uint64_t, long long *))result;
    uint64_t v7 = *(void (**)(uint64_t, uint64_t, long long *))result;
    if (!*(void *)result) {
      return CheckOutHandleDebug();
    }
    if (!a3) {
      return CheckOutHandleDebug();
    }
    CFIndex v8 = *(void (**)(uint64_t, uint64_t, long long *))(result + 8);
    if (!v8) {
      return CheckOutHandleDebug();
    }
    long long v10 = *a3;
    uint64_t v11 = *((void *)a3 + 2);
    if (v10 == 3)
    {
      unsigned int v9 = 5;
    }
    else
    {
      if (v10 != 5) {
        goto LABEL_11;
      }
      unsigned int v9 = 10;
    }
    if (!AGPSessionRecvFrom((uint64_t)v6, a2, (uint64_t)&v10, v9)) {
      return CheckOutHandleDebug();
    }
    uint64_t v7 = *v6;
    CFIndex v8 = v6[1];
LABEL_11:
    v7((uint64_t)v8, a2, &v10);
    return CheckOutHandleDebug();
  }
  return result;
}

uint64_t AGPSessionMaximumSegmentSize(int a1)
{
  return (1115 - 16 * a1);
}

CFMutableStringRef AGPSessionCopyDetailedDescription()
{
  uint64_t v0 = CheckInHandleDebug();
  CFMutableStringRef Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0);
  CFMutableStringRef v2 = Mutable;
  if (v0)
  {
    CFStringAppendF();
    CFStringAppendF();
    CheckOutHandleDebug();
  }
  else
  {
    CFRelease(Mutable);
    return 0;
  }
  return v2;
}

void AGPAssociationSetElement::AGPAssociationSetElement(AGPAssociationSetElement *this, CAGP *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  *((void *)this + 12) = 0;
  *(void *)this = &unk_26C9D9FE8;
  *((void *)this + 1) = a2;
  *((_DWORD *)this + 27) = 0;
  *(_OWORD *)((char *)this + 696) = 0u;
  *((_DWORD *)this + 178) = 0;
  if (!pthread_mutexattr_init(&v3))
  {
    pthread_mutexattr_settype(&v3, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 32), &v3);
    pthread_mutexattr_destroy(&v3);
  }
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  UpdateRTO((unsigned int *)this + 175, 250);
  pthread_mutex_unlock((pthread_mutex_t *)((char *)this + 32));
  *((_DWORD *)this + 28) = -1;
  operator new();
}

void AGPSendingSetElement::~AGPSendingSetElement(AGPSendingSetElement *this)
{
  *(void *)this = &unk_26C9D9F88;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9D9F88;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);

  JUMPOUT(0x21D471970);
}

void sub_218781BCC(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void AGPAssociationSetElement::~AGPAssociationSetElement(AGPAssociationSetElement *this)
{
  AGPAssociationSetElement::~AGPAssociationSetElement(this);

  JUMPOUT(0x21D471970);
}

{
  uint64_t v2;
  uint64_t v3;

  CFMutableStringRef v2 = 0;
  *(void *)this = &unk_26C9D9FE8;
  do
  {
    *((unsigned char *)this + v2 + 632) = 0x80;
    pthread_mutexattr_t v3 = *((void *)this + v2 + 15);
    if (v3) {
      MEMORY[0x21D471970](v3, 0x1000C40049130BCLL);
    }
    ++v2;
  }
  while (v2 != 64);
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 32));
}

void sub_218781C50(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void AGPDataQueueNode::~AGPDataQueueNode(CFTypeRef *this)
{
  CFRelease(this[10]);
  this[10] = 0;
  *((_DWORD *)this + 18) = 0;
  CFTypeRef v2 = this[12];
  if (v2) {
    _Block_release(v2);
  }
}

void CAGP::CAGP(CAGP *this)
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 216));
  AGPDataQueue::AGPDataQueue((CAGP *)((char *)this + 288));
  *((void *)this + 24) = 0;
  *((void *)this + 25) = 0;
  *((void *)this + 4) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  *((void *)this + 5) = CFSetCreateMutable(0, 0, &associationSetCallBacks);
  operator new();
}

void sub_218781EC4(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v3, 0x10A1C404616C3E8);
  AGPDataQueue::~AGPDataQueue(v2);
  AGPDataQueue::~AGPDataQueue(v1);
  _Unwind_Resume(a1);
}

void AGPDataQueue::AGPDataQueue(AGPDataQueue *this)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  *(void *)this = 0;
  if (!pthread_mutexattr_init(&v2))
  {
    pthread_mutexattr_settype(&v2, 2);
    pthread_mutex_init((pthread_mutex_t *)((char *)this + 8), &v2);
    pthread_mutexattr_destroy(&v2);
  }
}

void AGPReceiveSetElement::~AGPReceiveSetElement(AGPReceiveSetElement *this)
{
  *(void *)this = &unk_26C9DA008;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26C9DA008;
  AGPAssociationSetElement::~AGPAssociationSetElement(this);

  JUMPOUT(0x21D471970);
}

void sub_218782030(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10A1C404616C3E8);
  _Unwind_Resume(a1);
}

void AGPDataQueue::~AGPDataQueue(AGPDataQueue *this)
{
  for (unsigned int i = *(CFTypeRef **)this; *(void *)this; unsigned int i = *(CFTypeRef **)this)
  {
    *(void *)this = *i;
    AGPDataQueueNode::~AGPDataQueueNode(i);
    MEMORY[0x21D471970](i, 0x10E0C40923426B4);
  }
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 8));
}

void sub_2187820B8(_Unwind_Exception *a1)
{
  MEMORY[0x21D471970](v1, 0x10E0C40923426B4);
  _Unwind_Resume(a1);
}

void CAGP::~CAGP(pthread_mutex_t *this)
{
  pthread_mutexattr_t v2 = *(const void **)&this->__opaque[32];
  if (v2)
  {
    CFRelease(v2);
    *(void *)&this->__opaque[32] = 0;
  }
  uint64_t v3 = *(const void **)&this->__opaque[24];
  if (v3)
  {
    CFRelease(v3);
    *(void *)&this->__opaque[24] = 0;
  }
  while (1)
  {
    sig = (void *)this[3].__sig;
    if (!sig) {
      break;
    }
    int v5 = (__CFSet *)sig[3];
    this[3].__sig = sig[2];
    CFSetRemoveValue(v5, sig);
  }
  while (1)
  {
    unsigned int v6 = *(void **)this[3].__opaque;
    if (!v6) {
      break;
    }
    *(void *)this[3].__opaque = v6[2];
    (*(void (**)(void *))(*v6 + 8))(v6);
  }
  pthread_mutex_destroy(this + 1);
  pthread_mutex_destroy(this + 2);
  uint64_t v7 = *(void *)&this->__opaque[40];
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 8))(v7);
  }
  uint64_t v8 = *(void *)&this->__opaque[48];
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 8))(v8);
  }
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[4].__opaque[24]);
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)&this[3].__opaque[16]);
}

void sub_2187821E4(_Unwind_Exception *a1)
{
  AGPDataQueue::~AGPDataQueue((AGPDataQueue *)(v1 + 216));
  _Unwind_Resume(a1);
}

unsigned char *OUTLINED_FUNCTION_0_2(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = 0;
  *a2 = 0;
  return result;
}

void OUTLINED_FUNCTION_1_3(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t PostEventCallback(uint64_t a1, int a2, int a3, const void *a4, int a5, int a6)
{
  uint64_t v6 = 2149187587;
  if (!a1) {
    return 2149187585;
  }
  if (*(_DWORD *)(a1 + 4)) {
    return 2149187606;
  }
  if (a4 && a5)
  {
    uint64_t v13 = malloc_type_malloc(a5 + 48, 0xD8761618uLL);
    if (!v13) {
      return v6;
    }
    uint64_t v14 = v13;
    *uint64_t v13 = a2;
    v13[2] = a3;
    uint64_t v15 = v13 + 12;
    *((void *)v14 + 2) = v15;
    v14[6] = a5;
    v14[7] = a6;
    memcpy(v15, a4, a5);
  }
  else
  {
    int v16 = malloc_type_malloc(0x30uLL, 0x103004055E16862uLL);
    if (!v16) {
      return v6;
    }
    uint64_t v14 = v16;
    *int v16 = a2;
    _DWORD v16[2] = a3;
    *((void *)v16 + 2) = 0;
    v16[6] = 0;
    v16[7] = a6;
  }
  *((void *)v14 + 5) = 0;
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
  int v17 = (void *)(a1 + 40);
  do
  {
    int v18 = v17;
    uint64_t v19 = *v17;
    int v17 = (void *)(*v17 + 40);
  }
  while (v19);
  *int v18 = v14;
  pthread_cond_signal((pthread_cond_t *)(a1 + 112));
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  return 0;
}

uint64_t ServiceWaitEventCallbacks(uint64_t a1, double a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t result = 2149187585;
  if (a1)
  {
    if (*(_DWORD *)(a1 + 4))
    {
      return 2149187606;
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
      uint64_t v6 = (uint64_t *)(a1 + 240);
      uint64_t v5 = *(void *)(a1 + 240);
      if (v5)
      {
        do
        {
          uint64_t v7 = (uint64_t *)(v5 + 40);
          if (*(double *)(v5 + 32) <= a2)
          {
            uint64_t *v6 = *v7;
            uint64_t *v7 = 0;
            uint64_t v8 = ec_log();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              int v9 = *(_DWORD *)(v5 + 8);
              int v10 = *(_DWORD *)v5;
              *(_DWORD *)buf = 67109376;
              int v12 = v9;
              __int16 v13 = 1024;
              int v14 = v10;
              _os_log_impl(&dword_218756000, v8, OS_LOG_TYPE_DEFAULT, "ServiceWaitEventCallbacks: post delayed event of type %d to participant %08X.", buf, 0xEu);
            }
            PostEventCallback(a1, *(_DWORD *)v5, *(_DWORD *)(v5 + 8), *(const void **)(v5 + 16), *(_DWORD *)(v5 + 24), *(_DWORD *)(v5 + 28));
            free((void *)v5);
          }
          else
          {
            uint64_t v6 = (uint64_t *)(v5 + 40);
          }
          uint64_t v5 = *v6;
        }
        while (*v6);
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
      return 0;
    }
  }
  return result;
}

uint64_t CleanupWaitEventCallbacks(uint64_t a1)
{
  pthread_mutexattr_t v2 = ec_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_218756000, v2, OS_LOG_TYPE_DEFAULT, "Start cleanup.", v5, 2u);
  }
  if (!a1) {
    return 2149187585;
  }
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 248));
  while (1)
  {
    uint64_t v3 = *(void **)(a1 + 240);
    if (!v3) {
      break;
    }
    *(void *)(a1 + 240) = v3[5];
    free(v3);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 248));
  return 0;
}

uint64_t StartEventCallbackThread(_DWORD *a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 2149187585;
  }
  memset(&v5, 0, sizeof(v5));
  pthread_mutexattr_t v2 = (pthread_mutex_t *)(a1 + 12);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 12));
  pthread_attr_init(&v5);
  pthread_attr_setdetachstate(&v5, 2);
  uint64_t v3 = pthread_create((pthread_t *)a1 + 20, 0, (void *(__cdecl *)(void *))EventCBProc, a1);
  pthread_attr_destroy(&v5);
  if (v3) {
    uint64_t v3 = v3 | 0xC01A0000;
  }
  else {
    *a1 = 1;
  }
  pthread_mutex_unlock(v2);
  return v3;
}

uint64_t EventCBProc(uint64_t a1)
{
  pthread_setname_np("com.apple.multipeerconnectivity.eventcallback.eventcbproc");
  while (1)
  {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    while (1)
    {
      pthread_mutexattr_t v2 = *(void **)(a1 + 40);
      if (v2) {
        break;
      }
      if (*(_DWORD *)(a1 + 4)) {
        goto LABEL_8;
      }
      pthread_cond_wait((pthread_cond_t *)(a1 + 112), (pthread_mutex_t *)(a1 + 48));
    }
    if (*(_DWORD *)(a1 + 4)) {
      break;
    }
    *(void *)(a1 + 40) = v2[5];
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
    (*(void (**)(void, void, void *))(a1 + 8))(*(void *)(a1 + 16), *(unsigned int *)v2, v2 + 1);
    free(v2);
  }
LABEL_8:
  pthread_mutex_unlock((pthread_mutex_t *)(a1 + 48));
  uint64_t v3 = ec_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)pthread_attr_t v5 = 0;
    _os_log_impl(&dword_218756000, v3, OS_LOG_TYPE_DEFAULT, "EventCallbackThread ends.", v5, 2u);
  }
  return 0;
}

uint64_t StopEventCallbackThread(char *a1)
{
  uint64_t v1 = 2149187585;
  if (a1)
  {
    uint64_t v3 = (pthread_mutex_t *)(a1 + 48);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 48));
    int v4 = *(_DWORD *)a1;
    if (*(_DWORD *)a1)
    {
      *((_DWORD *)a1 + 1) = 1;
      pthread_cond_signal((pthread_cond_t *)(a1 + 112));
    }
    pthread_attr_t v5 = (void *)*((void *)a1 + 5);
    if (v5)
    {
      do
      {
        uint64_t v6 = (void *)v5[5];
        free(v5);
        pthread_attr_t v5 = v6;
      }
      while (v6);
    }
    *((void *)a1 + 5) = 0;
    pthread_mutex_unlock(v3);
    pthread_join(*((pthread_t *)a1 + 20), 0);
    CleanupWaitEventCallbacks((uint64_t)a1);
    pthread_mutex_destroy(v3);
    pthread_mutex_destroy((pthread_mutex_t *)(a1 + 248));
    pthread_cond_destroy((pthread_cond_t *)(a1 + 112));
    free(a1);
    if (v4) {
      return 0;
    }
    else {
      return 2149187606;
    }
  }
  return v1;
}

uint64_t OSPFMakeHello(void *a1, uint64_t a2, unsigned int a3, unsigned int a4)
{
  uint64_t v8 = (char *)malloc_type_calloc(1uLL, 0x22uLL, 0x24E525CuLL);
  if (!v8) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v9 = 0;
  LOWORD(v10) = 0;
  *(_WORD *)uint64_t v8 = 449;
  *(_DWORD *)(v8 + 2) = 50340352;
  *((_DWORD *)v8 + 2) = bswap32(a3);
  *((_DWORD *)v8 + 3) = bswap32(a4);
  *((_WORD *)v8 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
  *(_DWORD *)(v8 + 18) = 268435960;
  *(_DWORD *)(v8 + 22) = 523;
  *(void *)(v8 + 26) = bswap64(*(void *)(a2 + 16));
  do
    unsigned int v10 = CRC16Table[(v8[v9++] ^ v10)] ^ ((unsigned __int16)(v10 & 0xFF00) >> 8);
  while (v9 != 34);
  *((_WORD *)v8 + 3) = bswap32(v10) >> 16;
  *a1 = v8;
  return 34;
}

uint64_t OSPFMakeHeartbeat(void *a1, unsigned int a2, unsigned int a3, int a4, unsigned int a5)
{
  unsigned int v10 = malloc_type_calloc(1uLL, 0x14uLL, 0xFE56355EuLL);
  if (!v10) {
    return 0xFFFFFFFFLL;
  }
  uint64_t v11 = 0;
  LOWORD(v12) = 0;
  *(_WORD *)unsigned int v10 = 2241;
  *(_DWORD *)((char *)v10 + 2) = 5120;
  v10[2] = bswap32(a2);
  v10[3] = bswap32(a3);
  *((_WORD *)v10 + 8) = (a4 != 0) << 9;
  *((_WORD *)v10 + 9) = __rev16(a5);
  do
    unsigned int v12 = CRC16Table[(*((unsigned char *)v10 + v11++) ^ v12)] ^ ((unsigned __int16)(v12 & 0xFF00) >> 8);
  while (v11 != 20);
  *((_WORD *)v10 + 3) = bswap32(v12) >> 16;
  *a1 = v10;
  return 20;
}

uint64_t OSPFMakeDD(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v10 = *(unsigned int *)(a2 + 12);
  uint64_t v11 = *(void *)(a2 + 16);
  if ((int)v10 < 1)
  {
    unsigned int v12 = 0;
    int v13 = 2;
  }
  else
  {
    unsigned int v12 = 0;
    int v13 = 2;
    uint64_t v14 = *(unsigned int *)(a2 + 12);
    uint64_t v15 = *(void *)(a2 + 16);
    do
    {
      if (*(_DWORD *)v15 != a5)
      {
        v13 += *(unsigned __int8 *)(v15 + 8) + 8 * *(_DWORD *)(v15 + 284) + 9;
        ++v12;
      }
      v15 += 416;
      --v14;
    }
    while (v14);
  }
  uint64_t v16 = (v13 + 16);
  int v17 = malloc_type_calloc(1uLL, (int)v16, 0xED2242E1uLL);
  if (!v17) {
    return 0xFFFFFFFFLL;
  }
  int v18 = v17;
  int v38 = a6;
  uint64_t v36 = v16;
  uint64_t v37 = a1;
  *int v17 = 705;
  v17[1] = bswap32(v16) >> 16;
  *((_DWORD *)v17 + 2) = bswap32(a4);
  *((_DWORD *)v17 + 3) = bswap32(a5);
  v17[8] = bswap32(v12) >> 16;
  if ((int)v10 >= 1)
  {
    uint64_t v19 = 0;
    uint64_t v20 = v17 + 9;
    int v21 = (unsigned int *)(v11 + 292);
    do
    {
      unsigned int v22 = *(_DWORD *)(v11 + 416 * v19);
      if (v22 != a5)
      {
        uint64_t v23 = v11 + 416 * v19;
        uint64_t v24 = *(unsigned int *)(v23 + 284);
        *(_DWORD *)uint64_t v20 = bswap32(v22);
        v20[2] = bswap32(*(unsigned __int16 *)(v23 + 272)) >> 16;
        *((unsigned char *)v20 + 6) = *(unsigned char *)(v23 + 8);
        int v25 = (char *)v20 + 7;
        memcpy((char *)v20 + 7, (const void *)(v23 + 9), *(unsigned __int8 *)(v23 + 8));
        int v26 = &v25[*(unsigned __int8 *)(v23 + 8)];
        *(_WORD *)int v26 = bswap32(v24) >> 16;
        uint64_t v20 = v26 + 2;
        if ((int)v24 >= 1)
        {
          char v27 = v21;
          do
          {
            *(_DWORD *)uint64_t v20 = bswap32(*(v27 - 1));
            unsigned int v28 = *v27;
            v27 += 2;
            *((_DWORD *)v20 + 1) = bswap32(v28);
            v20 += 4;
            --v24;
          }
          while (v24);
        }
      }
      ++v19;
      v21 += 104;
    }
    while (v19 != v10);
  }
  if (v38)
  {
    uint64_t v40 = 0;
    unsigned int v39 = 0;
    uint64_t v29 = v36;
    if (!ospfTryCompressPacket(&v40, &v39, (uint64_t)v18, v36))
    {
      free(v18);
      int v18 = v40;
      uint64_t v29 = v39;
    }
    uint64_t v30 = v37;
  }
  else
  {
    uint64_t v29 = v36;
    uint64_t v30 = v37;
  }
  if ((int)v29 < 1)
  {
    unsigned int v31 = 0;
  }
  else
  {
    LOWORD(v31) = 0;
    uint64_t v32 = v29;
    int v33 = (char *)v18;
    do
    {
      char v34 = *v33++;
      unsigned int v31 = CRC16Table[(v34 ^ v31)] ^ ((unsigned __int16)(v31 & 0xFF00) >> 8);
      --v32;
    }
    while (v32);
  }
  v18[3] = bswap32(v31) >> 16;
  *uint64_t v30 = v18;
  return v29;
}

uint64_t ospfTryCompressPacket(void *a1, unsigned int *a2, uint64_t a3, int a4)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  signed int v8 = a4 - 16;
  uLongf destLen = compressBound(a4 - 16);
  uint64_t v9 = malloc_type_malloc(destLen + 18, 0x51194D10uLL);
  if (!v9) {
    return 1;
  }
  uint64_t v10 = v9;
  if (compress2((Bytef *)v9 + 18, &destLen, (const Bytef *)(a3 + 16), v8, 9) || (unsigned __int16 v11 = destLen, (int)destLen + 2 >= v8))
  {
    uint64_t v19 = ospf_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = *(unsigned __int8 *)(a3 + 1);
      int v21 = "OSPF";
      if (v20 == 3) {
        int v21 = "LSA";
      }
      *(_DWORD *)buf = 136315650;
      if (v20 == 2) {
        int v21 = "DD";
      }
      uint64_t v24 = v21;
      __int16 v25 = 1024;
      signed int v26 = v8;
      __int16 v27 = 1024;
      int v28 = destLen;
      _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "%s compressed body %u => %u+2 (not performed).", buf, 0x18u);
    }
    free(v10);
    return 1;
  }
  *(_OWORD *)uint64_t v10 = *(_OWORD *)a3;
  v10[8] = bswap32(v8) >> 16;
  v10[2] = 256;
  unsigned int v12 = v11 + 18;
  v10[1] = bswap32(v12) >> 16;
  *a1 = v10;
  *a2 = v12;
  int v13 = ospf_log();
  BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  uint64_t result = 0;
  if (v14)
  {
    uint64_t v16 = "OSPF";
    int v17 = *(unsigned __int8 *)(a3 + 1);
    unsigned int v18 = *a2;
    if (v17 == 3) {
      uint64_t v16 = "LSA";
    }
    *(_DWORD *)buf = 136316162;
    if (v17 == 2) {
      uint64_t v16 = "DD";
    }
    uint64_t v24 = v16;
    __int16 v25 = 1024;
    signed int v26 = v8;
    __int16 v27 = 1024;
    int v28 = v11;
    __int16 v29 = 1024;
    int v30 = a4;
    __int16 v31 = 1024;
    unsigned int v32 = v18;
    _os_log_impl(&dword_218756000, v13, OS_LOG_TYPE_DEFAULT, "%s compressed body %u => %u+2, total size: %d => %d.", buf, 0x24u);
    return 0;
  }
  return result;
}

uint64_t OSPFMakeLSA(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, int a6)
{
  uint64_t v6 = *(unsigned int *)(a2 + 16);
  if ((int)v6 < 1) {
    goto LABEL_21;
  }
  unsigned int v11 = 0;
  unsigned int v12 = *(unsigned __int16 *)(a2 + 12);
  uint64_t v13 = *(void *)(a2 + 24);
  int v14 = 4;
  uint64_t v15 = *(unsigned int *)(a2 + 16);
  uint64_t v16 = v13;
  do
  {
    if (*(_DWORD *)v16 != a5 && *(_DWORD *)(v16 + 276) && *(_DWORD *)(v16 + 280) != a5)
    {
      v14 += *(unsigned __int8 *)(v16 + 8) + 8 * *(_DWORD *)(v16 + 284) + 9;
      ++v11;
    }
    v16 += 416;
    --v15;
  }
  while (v15);
  if (!(_WORD)v11)
  {
LABEL_21:
    unsigned int v32 = ospf_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v32, OS_LOG_TYPE_DEFAULT, "No eligible nodes.", buf, 2u);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v17 = (v14 + 16);
  unsigned int v18 = malloc_type_calloc(1uLL, (int)v17, 0xA469801EuLL);
  if (!v18)
  {
    uint64_t v33 = ospf_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
      OSPFMakeLSA_cold_1(v33);
    }
    return 0xFFFFFFFFLL;
  }
  uint64_t v19 = v18;
  int v39 = a6;
  uint64_t v40 = v17;
  int v41 = a1;
  uint64_t v20 = 0;
  *unsigned int v18 = 961;
  v18[1] = bswap32(v17) >> 16;
  *((_DWORD *)v18 + 2) = bswap32(a4);
  *((_DWORD *)v18 + 3) = bswap32(a5);
  v18[8] = __rev16(v12);
  v18[9] = bswap32(v11) >> 16;
  int v21 = v18 + 10;
  unsigned int v22 = (unsigned int *)(v13 + 292);
  do
  {
    unsigned int v23 = *(_DWORD *)(v13 + 416 * v20);
    if (v23 != a5)
    {
      if (*(_DWORD *)(v13 + 416 * v20 + 276))
      {
        if (*(_DWORD *)(v13 + 416 * v20 + 280) != a5)
        {
          uint64_t v24 = v13 + 416 * v20;
          uint64_t v25 = *(unsigned int *)(v24 + 284);
          *(_DWORD *)int v21 = bswap32(v23);
          _DWORD v21[2] = bswap32(*(unsigned __int16 *)(v24 + 272)) >> 16;
          *((unsigned char *)v21 + 6) = *(unsigned char *)(v24 + 8);
          signed int v26 = (char *)v21 + 7;
          memcpy((char *)v21 + 7, (const void *)(v24 + 9), *(unsigned __int8 *)(v24 + 8));
          __int16 v27 = &v26[*(unsigned __int8 *)(v24 + 8)];
          *(_WORD *)__int16 v27 = bswap32(v25) >> 16;
          int v21 = v27 + 2;
          if ((int)v25 >= 1)
          {
            int v28 = v22;
            do
            {
              *(_DWORD *)int v21 = bswap32(*(v28 - 1));
              unsigned int v29 = *v28;
              v28 += 2;
              *((_DWORD *)v21 + 1) = bswap32(v29);
              v21 += 4;
              --v25;
            }
            while (v25);
          }
        }
      }
    }
    ++v20;
    v22 += 104;
  }
  while (v20 != v6);
  if (v39)
  {
    uint64_t v43 = 0;
    unsigned int v42 = 0;
    uint64_t v30 = v40;
    __int16 v31 = v41;
    if (!ospfTryCompressPacket(&v43, &v42, (uint64_t)v19, v40))
    {
      free(v19);
      uint64_t v19 = v43;
      uint64_t v30 = v42;
    }
  }
  else
  {
    uint64_t v30 = v40;
    __int16 v31 = v41;
  }
  if ((int)v30 < 1)
  {
    unsigned int v34 = 0;
  }
  else
  {
    LOWORD(v34) = 0;
    uint64_t v35 = v30;
    uint64_t v36 = (char *)v19;
    do
    {
      char v37 = *v36++;
      unsigned int v34 = CRC16Table[(v37 ^ v34)] ^ ((unsigned __int16)(v34 & 0xFF00) >> 8);
      --v35;
    }
    while (v35);
  }
  v19[3] = bswap32(v34) >> 16;
  *__int16 v31 = v19;
  return v30;
}

uint64_t OSPFMakeLSAACK(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v9 = malloc_type_calloc(1uLL, 0x12uLL, 0xD528DFCFuLL);
  if (v9)
  {
    uint64_t v10 = 0;
    LOWORD(v11) = 0;
    *uint64_t v9 = 301991105;
    _DWORD v9[2] = bswap32(a4);
    v9[3] = bswap32(a5);
    *((_WORD *)v9 + 8) = bswap32(*(unsigned __int16 *)(a2 + 12)) >> 16;
    do
      unsigned int v11 = CRC16Table[(*((unsigned char *)v9 + v10++) ^ v11)] ^ ((unsigned __int16)(v11 & 0xFF00) >> 8);
    while (v10 != 18);
    *((_WORD *)v9 + 3) = bswap32(v11) >> 16;
    *a1 = v9;
    return 18;
  }
  else
  {
    uint64_t v13 = ospf_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      OSPFMakeLSAACK_cold_1(a5, v13);
    }
    return 0xFFFFFFFFLL;
  }
}

uint64_t OSPFMakeData(char *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6, unsigned int *a7, uint64_t a8, uint64_t (*a9)(uint64_t, unsigned int *, uint64_t, char *, void, uint64_t, void, void, int), uint64_t a10, char a11, unsigned __int8 a12, unsigned __int8 a13)
{
  int v13 = a8;
  int v14 = a7;
  char v16 = a5;
  uint64_t v19 = a1;
  uint64_t v20 = &a1[4 * (int)a8];
  if (a9)
  {
    *(_WORD *)((char *)&v31 + 1) = __PAIR16__(a13, a12);
    LOBYTE(v31) = a11;
    int v21 = a9(a10, a7, a8, v20 + 12, (1488 - 4 * a8), a5, *(void *)a3, *(unsigned int *)(a3 + 8), v31);
    if (v21 < 0)
    {
      uint64_t v22 = 0;
      unsigned int v23 = 0;
      *((_WORD *)v19 + 2) = 0;
      uint64_t v24 = v19 + 6;
LABEL_15:
      *uint64_t v24 = bswap32(v23) >> 16;
      return v22;
    }
  }
  else
  {
    int v21 = 0;
  }
  uint64_t v22 = (4 * v13 + v21 + *(_DWORD *)(a3 + 8) + 12);
  if ((int)v22 <= a2)
  {
    char *v19 = v13 & 0xF | 0xC0;
    v19[1] = v16;
    *((_WORD *)v19 + 1) = bswap32(v22) >> 16;
    *((_DWORD *)v19 + 2) = bswap32(a6);
    if (v13 >= 1)
    {
      uint64_t v25 = v13;
      signed int v26 = v19 + 12;
      do
      {
        unsigned int v27 = *v14++;
        *v26++ = bswap32(v27);
        --v25;
      }
      while (v25);
    }
    memcpy(&v20[v21 + 12], *(const void **)a3, *(int *)(a3 + 8));
    *((_DWORD *)v19 + 1) = 0;
    uint64_t v24 = v19 + 6;
    if ((int)v22 < 1)
    {
      unsigned int v23 = 0;
    }
    else
    {
      LOWORD(v23) = 0;
      uint64_t v28 = v22;
      do
      {
        char v29 = *v19++;
        unsigned int v23 = CRC16Table[(v29 ^ v23)] ^ ((unsigned __int16)(v23 & 0xFF00) >> 8);
        --v28;
      }
      while (v28);
    }
    goto LABEL_15;
  }
  return 0xFFFFFFFFLL;
}

uint64_t ospfParseOption(uint64_t a1, uint64_t a2, int *a3, _DWORD *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  if ((*(_WORD *)(a1 + 4) & 2) == 0) {
    return 0;
  }
  int v7 = *a3;
  if (!*a3) {
    goto LABEL_7;
  }
  if (v7 <= 3)
  {
    uint64_t v9 = ospf_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = *(unsigned __int8 *)(a1 + 1);
      int v11 = *a3;
      int v22 = 67109376;
      int v23 = v10;
      __int16 v24 = 1024;
      int v25 = v11;
      _os_log_impl(&dword_218756000, v9, OS_LOG_TYPE_DEFAULT, "Msg: %d: option too small: %d.", (uint8_t *)&v22, 0xEu);
    }
LABEL_7:
    uint64_t result = 0;
    *a4 = 0;
    return result;
  }
  int v13 = *(unsigned char **)a2;
  uint64_t v14 = 4 * *(unsigned __int8 *)(*(void *)a2 + 1);
  uint64_t v15 = v14 + 4;
  if ((int)v14 + 4 <= v7)
  {
    if (*v13)
    {
      if ((char)*v13 < 0)
      {
        uint64_t v19 = ospf_log();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = *(unsigned __int8 *)(a1 + 1);
          int v21 = *v13;
          int v22 = 67109376;
          int v23 = v20;
          __int16 v24 = 1024;
          int v25 = v21;
          _os_log_impl(&dword_218756000, v19, OS_LOG_TYPE_DEFAULT, "Msg: %d: unsupported required option: %d", (uint8_t *)&v22, 0xEu);
        }
        *a4 = 1;
        int v13 = *(unsigned char **)a2;
      }
      else
      {
        *a4 = 0;
      }
    }
    else
    {
      *a4 = 1;
    }
    *(void *)a2 = &v13[v15];
    *a3 -= v15;
    return 1;
  }
  else
  {
    char v16 = ospf_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = *(unsigned __int8 *)(a1 + 1);
      int v18 = *a3;
      int v22 = 67109632;
      int v23 = v17;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      int v27 = v18;
      _os_log_impl(&dword_218756000, v16, OS_LOG_TYPE_DEFAULT, "Msg: %d: incorrect option size: %d > %d.", (uint8_t *)&v22, 0x14u);
    }
    uint64_t result = 1;
    *a4 = 1;
  }
  return result;
}

uint64_t ospfVerifyOptions(uint64_t a1, unsigned __int8 *a2, int a3, int *a4, _DWORD *a5)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  if (a3 > 3)
  {
    if (*a2 == 248)
    {
      uint64_t v11 = __rev16(*((unsigned __int16 *)a2 + 1));
      if (v11 <= a3)
      {
        int v17 = a2[1];
        int v18 = a2 + 4;
        if (a2[1])
        {
          int v19 = 0;
          while (1)
          {
            int v20 = v18 - a2;
            uint64_t v21 = v11 - (v18 - a2);
            if (v21 <= 3) {
              break;
            }
            unint64_t v22 = 4 * v18[1] + 4;
            if (v21 < v22)
            {
              uint64_t v28 = ospf_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
              {
                int v29 = *(unsigned __int8 *)(a1 + 1);
                int v30 = 67110400;
                int v31 = v29;
                __int16 v32 = 1024;
                int v33 = v19;
                __int16 v34 = 1024;
                int v35 = v17;
                __int16 v36 = 1024;
                int v37 = v20;
                __int16 v38 = 1024;
                int v39 = v11;
                __int16 v40 = 1024;
                int v41 = v22;
                _os_log_impl(&dword_218756000, v28, OS_LOG_TYPE_DEFAULT, "Msg: %d: option %d of %d: @%d/%d, size=%d.", (uint8_t *)&v30, 0x26u);
              }
              return 5;
            }
            v18 += v22;
            if (v17 == ++v19) {
              goto LABEL_19;
            }
          }
          __int16 v26 = ospf_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = *(unsigned __int8 *)(a1 + 1);
            int v30 = 67109632;
            int v31 = v27;
            __int16 v32 = 1024;
            int v33 = v19;
            __int16 v34 = 1024;
            int v35 = v17;
            _os_log_impl(&dword_218756000, v26, OS_LOG_TYPE_DEFAULT, "Msg: %d: option %d of %d: not enough option header.", (uint8_t *)&v30, 0x14u);
          }
          return 4;
        }
        else
        {
LABEL_19:
          int v23 = v18 - a2;
          if (v18 - a2 == v11)
          {
            uint64_t result = 0;
            *a4 = v17;
            *a5 = v11;
          }
          else
          {
            __int16 v24 = ospf_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              int v25 = *(unsigned __int8 *)(a1 + 1);
              int v30 = 67109888;
              int v31 = v25;
              __int16 v32 = 1024;
              int v33 = v17;
              __int16 v34 = 1024;
              int v35 = v23;
              __int16 v36 = 1024;
              int v37 = v11;
              _os_log_impl(&dword_218756000, v24, OS_LOG_TYPE_DEFAULT, "Msg: %d: %d options used %d bytes != %d offset.", (uint8_t *)&v30, 0x1Au);
            }
            return 6;
          }
        }
      }
      else
      {
        unsigned int v12 = ospf_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          int v13 = *(unsigned __int8 *)(a1 + 1);
          int v30 = 67109632;
          int v31 = v13;
          __int16 v32 = 1024;
          int v33 = v11;
          __int16 v34 = 1024;
          int v35 = a3;
          _os_log_impl(&dword_218756000, v12, OS_LOG_TYPE_DEFAULT, "Msg: %d: body offset %d > %d.", (uint8_t *)&v30, 0x14u);
        }
        return 3;
      }
    }
    else
    {
      uint64_t v14 = ospf_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *(unsigned __int8 *)(a1 + 1);
        int v16 = *a2;
        int v30 = 67109376;
        int v31 = v15;
        __int16 v32 = 1024;
        int v33 = v16;
        _os_log_impl(&dword_218756000, v14, OS_LOG_TYPE_DEFAULT, "Msg: %d: expecting options info, got %d.", (uint8_t *)&v30, 0xEu);
      }
      return 2;
    }
  }
  else
  {
    uint64_t v6 = ospf_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(unsigned __int8 *)(a1 + 1);
      int v30 = 67109120;
      int v31 = v7;
      _os_log_impl(&dword_218756000, v6, OS_LOG_TYPE_DEFAULT, "Msg: %d: missing options info.", (uint8_t *)&v30, 8u);
    }
    return 1;
  }
  return result;
}

uint64_t OSPFParse(void *a1, void *a2, unsigned __int8 *a3, uint64_t a4, uint64_t a5, unsigned __int8 **a6, int *a7)
{
  uint64_t v10 = a4;
  uint64_t v135 = *MEMORY[0x263EF8340];
  uint64_t v127 = 0;
  if ((*a3 & 0xF0) != 0xC0 && a3[1] != 1)
  {
    int v21 = -3001;
    goto LABEL_134;
  }
  uint64_t v14 = *a3 & 0xF;
  if ((*a3 & 0xF) == 0)
  {
    int v21 = -3002;
LABEL_134:
    long long v103 = ospf_log();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)int v129 = v21;
      _os_log_impl(&dword_218756000, v103, OS_LOG_TYPE_DEFAULT, "OSPFParse failed with error %d.", buf, 8u);
    }
    uint64_t v10 = 0xFFFFFFFFLL;
    goto LABEL_137;
  }
  int v15 = a3[1];
  if ((v15 - 1) > 9)
  {
    int v21 = -3003;
    goto LABEL_134;
  }
  int v16 = *((unsigned __int16 *)a3 + 3);
  *((_WORD *)a3 + 3) = 0;
  if ((int)a4 < 1)
  {
    unsigned int v17 = 0;
  }
  else
  {
    LOWORD(v17) = 0;
    uint64_t v18 = a4;
    int v19 = (char *)a3;
    do
    {
      char v20 = *v19++;
      unsigned int v17 = CRC16Table[(v20 ^ v17)] ^ ((unsigned __int16)(v17 & 0xFF00) >> 8);
      --v18;
    }
    while (v18);
  }
  unsigned int v22 = bswap32(v17) >> 16;
  *((_WORD *)a3 + 3) = v22;
  if (v22 != v16)
  {
    *((_WORD *)a3 + 3) = v16;
    int v21 = -3004;
    goto LABEL_134;
  }
  unsigned int v23 = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  *((_WORD *)a3 + 1) = v23;
  if (v23 != a4)
  {
    int v21 = -3005;
    goto LABEL_134;
  }
  uint64_t v24 = 0;
  unsigned int v25 = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
  *((_WORD *)a3 + 2) = v25;
  *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
  __int16 v26 = (unsigned int *)(a3 + 12);
  if (v14 <= 1) {
    uint64_t v27 = 1;
  }
  else {
    uint64_t v27 = v14;
  }
  do
  {
    *(_DWORD *)&a3[v24 + 12] = bswap32(*(_DWORD *)&a3[v24 + 12]);
    v24 += 4;
  }
  while (4 * v27 != v24);
  int v28 = a4 - 4 * v14;
  uint64_t v29 = (v28 - 12);
  if (v28 - 12 < 0)
  {
    int v21 = -3006;
    goto LABEL_134;
  }
  int v30 = v25 & 1;
  if (!a2 && v30)
  {
    int v31 = ospf_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_218756000, v31, OS_LOG_TYPE_DEFAULT, "Cannot pre-parse compressed packet.", buf, 2u);
    }
    *((_WORD *)a3 + 2) = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
    *((_WORD *)a3 + 1) = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
    *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
    int v21 = -3007;
    do
    {
      *__int16 v26 = bswap32(*v26);
      ++v26;
      --v27;
    }
    while (v27);
    goto LABEL_134;
  }
  __int16 v32 = 0;
  int v33 = (unsigned __int8 *)&v26[v14];
  if ((v15 & 0xFE) == 2 && v29 >= 3 && v30)
  {
    uLongf destLen = bswap32(*(unsigned __int16 *)v33) >> 16;
    uint64_t v114 = v29;
    uLongf v120 = destLen;
    __int16 v34 = &v26[v14];
    __int16 v32 = (Bytef *)malloc_type_malloc(destLen, 0x31A5B947uLL);
    if (v32)
    {
      uint64_t v122 = v32;
      int v107 = v114 - 2;
      int v35 = uncompress(v32, &destLen, (const Bytef *)v34 + 2, v114 - 2);
      uLongf v115 = destLen;
      log = ospf_log();
      BOOL v36 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
      if (!v35 && v115 == v120)
      {
        if (v36)
        {
          int v37 = a3[1];
          __int16 v38 = "OSPF";
          if (v37 == 3) {
            __int16 v38 = "LSA";
          }
          BOOL v39 = v37 == 2;
          *(_DWORD *)buf = 136315906;
          __int16 v40 = "DD";
          if (!v39) {
            __int16 v40 = v38;
          }
          *(void *)int v129 = v40;
          *(_WORD *)&v129[8] = 1024;
          int v130 = v107;
          __int16 v131 = 1024;
          int v132 = destLen;
          __int16 v133 = 1024;
          int v134 = v120;
          _os_log_impl(&dword_218756000, log, OS_LOG_TYPE_DEFAULT, "%s uncompressed body %u+2 => %u (stated %u).", buf, 0x1Eu);
        }
        LODWORD(v29) = destLen;
        int v15 = a3[1];
        __int16 v32 = v122;
        int v33 = v122;
        goto LABEL_43;
      }
      if (v36)
      {
        int v54 = a3[1];
        unsigned int v55 = "OSPF";
        if (v54 == 3) {
          unsigned int v55 = "LSA";
        }
        BOOL v39 = v54 == 2;
        *(_DWORD *)buf = 136315906;
        unsigned int v56 = "DD";
        if (!v39) {
          unsigned int v56 = v55;
        }
        *(void *)int v129 = v56;
        *(_WORD *)&v129[8] = 1024;
        int v130 = destLen;
        __int16 v131 = 1024;
        int v132 = v120;
        __int16 v133 = 1024;
        int v134 = v35;
        _os_log_impl(&dword_218756000, log, OS_LOG_TYPE_DEFAULT, "%s uncompressed body (real %u =? %u) failed (%d).", buf, 0x1Eu);
      }
      int v21 = -3008;
      __int16 v32 = v122;
    }
    else
    {
      int v21 = -6728;
    }
    int v44 = 0;
    if (!v32) {
      goto LABEL_131;
    }
    goto LABEL_130;
  }
LABEL_43:
  if (v15 == 1)
  {
    unsigned int v41 = *(unsigned __int16 *)v33;
    v33 += 2;
    unsigned int loga = bswap32(v41) >> 16;
    LODWORD(v29) = v29 - 2;
  }
  else
  {
    LOWORD(loga) = 0;
  }
  int v123 = v32;
  if ((*((_WORD *)a3 + 2) & 2) != 0)
  {
    uLongf destLen = 0;
    int v125 = 0;
    int v108 = v33;
    int v50 = ospfVerifyOptions((uint64_t)a3, v33, v29, (int *)&v127 + 1, &v127);
    if (v50)
    {
      int v51 = v50;
      unsigned int v52 = ospf_log();
      if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
      {
        int v53 = a3[1];
        *(_DWORD *)buf = 67109376;
        *(_DWORD *)int v129 = v53;
        *(_WORD *)&v129[4] = 1024;
        *(_DWORD *)&v129[6] = v51;
        _os_log_impl(&dword_218756000, v52, OS_LOG_TYPE_DEFAULT, "Msg: %d: options verification failed (%d).", buf, 0xEu);
      }
      int v44 = 0;
      int v21 = -3009;
      goto LABEL_128;
    }
    unsigned int v57 = v108;
    uLongf destLen = (uLongf)(v108 + 4);
    int v125 = v29 - 4;
    uint64_t v42 = HIDWORD(v127);
    if (HIDWORD(v127))
    {
      int v116 = v29;
      uint64_t v58 = HIDWORD(v127);
      long long v121 = malloc_type_malloc(8 * SHIDWORD(v127), 0x2004093837F09uLL);
      if (!v121)
      {
        uint64_t v102 = ospf_log();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR)) {
          OSPFParse_cold_1(v102);
        }
        int v44 = 0;
        int v21 = -6728;
        goto LABEL_128;
      }
      int v124 = 0;
      uint64_t v42 = v58;
      if ((int)v58 >= 1)
      {
        uint64_t v59 = 0;
        uint64_t v106 = v42;
        while (1)
        {
          v121[v59] = destLen;
          if (!ospfParseOption((uint64_t)a3, (uint64_t)&destLen, &v125, &v124)) {
            break;
          }
          if (v124) {
            goto LABEL_143;
          }
          ++v59;
          uint64_t v42 = v106;
          if (v106 == v59) {
            goto LABEL_81;
          }
        }
        unint64_t v105 = ospf_log();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          *(_DWORD *)int v129 = v59;
          *(_WORD *)&v129[4] = 1024;
          *(_DWORD *)&v129[6] = v106;
          _os_log_impl(&dword_218756000, v105, OS_LOG_TYPE_DEFAULT, "Expecting option %d of %d.", buf, 0xEu);
        }
LABEL_143:
        int v21 = -3009;
        int v44 = v121;
        __int16 v32 = v123;
        if (!v123) {
          goto LABEL_131;
        }
LABEL_130:
        free(v32);
        goto LABEL_131;
      }
LABEL_81:
      unsigned int v57 = v108;
      LODWORD(v29) = v116;
    }
    else
    {
      long long v121 = 0;
    }
    int v33 = &v57[(int)v127];
    LODWORD(v29) = v29 - v127;
    __int16 v32 = v123;
    if (!a6) {
      goto LABEL_52;
    }
    goto LABEL_48;
  }
  uint64_t v42 = 0;
  long long v121 = 0;
  if (!a6) {
    goto LABEL_52;
  }
LABEL_48:
  if (*((_WORD *)a3 + 2)) {
    uint64_t v43 = 0;
  }
  else {
    uint64_t v43 = v33;
  }
  *a6 = v43;
LABEL_52:
  int v44 = v121;
  if (a5)
  {
    char v45 = *(void (**)(uint64_t, void *, uint64_t))(a5 + 16);
    uint64_t v46 = a5;
    unsigned int v47 = v33;
    v45(v46, v121, v42);
    int v33 = v47;
    __int16 v32 = v123;
  }
  if (a2)
  {
    switch(a3[1])
    {
      case 1u:
        uint64_t v60 = malloc_type_calloc(1uLL, 0x20uLL, 0x1032040E8FB2772uLL);
        int v49 = v60;
        *uint64_t v60 = 0;
        *((_DWORD *)v60 + 2) = 0;
        *((_WORD *)v60 + 6) = loga;
        uint64_t v61 = HIDWORD(v127);
        if (SHIDWORD(v127) >= 1)
        {
          uint64_t v62 = v121;
          do
          {
            if (*(unsigned char *)*v62 == 11) {
              v60[2] = bswap64(*(void *)(*v62 + 4));
            }
            ++v62;
            --v61;
          }
          while (v61);
        }
        int v63 = *a3 >> 4;
        if (v63 != 12)
        {
          fprintf((FILE *)*MEMORY[0x263EF8348], "OSPF version mismatch: expected %d, got %d\n", 12, v63);
          uint64_t v10 = 0;
        }
        goto LABEL_117;
      case 2u:
        __int16 v64 = v33;
        unsigned int v65 = *(unsigned __int16 *)v33;
        int v66 = __rev16(v65);
        unsigned int v67 = (char *)malloc_type_malloc((416 * v66) | 0x18, 0x945627E2uLL);
        int v49 = v67;
        *(void *)unsigned int v67 = 0;
        *((_DWORD *)v67 + 2) = 0;
        *((_DWORD *)v67 + 3) = v66;
        os_log_t logb = v66;
        unint64_t v68 = v67 + 24;
        *((void *)v67 + 2) = v67 + 24;
        if (!v65) {
          goto LABEL_117;
        }
        os_log_t v69 = 0;
        uint64_t v70 = (uint64_t)(v64 + 2);
        unsigned int v109 = v67;
        int v71 = v67 + 316;
        while (1)
        {
          uint64_t v117 = v71;
          BOOL v72 = &v68[416 * (void)v69];
          *(_DWORD *)BOOL v72 = bswap32(*(_DWORD *)v70);
          *((_DWORD *)v72 + 1) = -1;
          *((_DWORD *)v72 + 67) = -1;
          *((_WORD *)v72 + 136) = bswap32(*(unsigned __int16 *)(v70 + 4)) >> 16;
          *((_DWORD *)v72 + 69) = 1;
          *((_DWORD *)v72 + 70) = *((_DWORD *)a3 + 2);
          size_t v73 = *(unsigned __int8 *)(v70 + 6);
          v72[8] = v73;
          uint64_t v74 = v70 + 7;
          int v75 = v72 + 9;
          int v76 = v68;
          memcpy(v72 + 9, (const void *)(v70 + 7), v73);
          v75[v73] = 0;
          unsigned int v77 = *(unsigned __int16 *)(v74 + v73);
          uint64_t v78 = __rev16(v77);
          if (v78 > 0x10) {
            goto LABEL_140;
          }
          uint64_t v70 = v74 + v73 + 2;
          *(_DWORD *)&v76[416 * (void)v69 + 284] = v78;
          unint64_t v68 = v76;
          if (v77)
          {
            int v79 = v117;
            int v80 = v117;
            do
            {
              *(v80 - 1) = bswap32(*(_DWORD *)v70);
              _DWORD *v80 = bswap32(*(_DWORD *)(v70 + 4));
              v80 += 2;
              v70 += 8;
              --v78;
            }
            while (v78);
          }
          else
          {
            int v79 = v117;
          }
          os_log_t v69 = (os_log_t)((char *)v69 + 1);
          int v71 = (char *)(v79 + 104);
          if (v69 == logb) {
            goto LABEL_111;
          }
        }
      case 3u:
        uint64_t v81 = v33;
        unsigned int v118 = bswap32(*(unsigned __int16 *)v33) >> 16;
        unsigned int v82 = *((unsigned __int16 *)v33 + 1);
        uint64_t v83 = __rev16(v82);
        uint64_t v84 = (char *)malloc_type_malloc(416 * v83 + 32, 0xAC0E56CAuLL);
        int v49 = v84;
        *(void *)uint64_t v84 = 0;
        *((_DWORD *)v84 + 2) = 0;
        *((_WORD *)v84 + 6) = v118;
        os_log_t logc = v83;
        *((_DWORD *)v84 + 4) = v83;
        int v85 = v84 + 32;
        *((void *)v84 + 3) = v84 + 32;
        if (!v82) {
          goto LABEL_117;
        }
        os_log_t v86 = 0;
        uint64_t v87 = (uint64_t)(v81 + 4);
        unsigned int v109 = v84;
        long long v88 = v84 + 324;
        break;
      case 4u:
        BOOL v98 = v33;
        int v49 = malloc_type_malloc(0x20uLL, 0x1032040E8FB2772uLL);
        *(void *)int v49 = 0;
        v49[2] = 0;
        *((_WORD *)v49 + 6) = bswap32(*(unsigned __int16 *)v98) >> 16;
        goto LABEL_117;
      case 5u:
      case 0xAu:
        unsigned int v48 = v33;
        int v49 = malloc_type_malloc(0x20uLL, 0x1032040E8FB2772uLL);
        *(void *)int v49 = v48;
        v49[2] = v29;
        goto LABEL_117;
      case 8u:
        long long v101 = v33;
        int v49 = malloc_type_calloc(1uLL, 0x20uLL, 0x1032040E8FB2772uLL);
        *(void *)int v49 = 0;
        v49[2] = 0;
        *((_WORD *)v49 + 6) = bswap32(*(unsigned __int16 *)v101) >> 16;
        *((_WORD *)v49 + 7) = bswap32(*((unsigned __int16 *)v101 + 1)) >> 16;
LABEL_117:
        __int16 v32 = v123;
        goto LABEL_118;
      default:
        os_log_t v99 = ospf_log();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_DEFAULT))
        {
          int v100 = a3[1];
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)int v129 = v100;
          _os_log_impl(&dword_218756000, v99, OS_LOG_TYPE_DEFAULT, "Unknown OSPF type %d.", buf, 8u);
        }
        int v21 = -3003;
        goto LABEL_128;
    }
    while (1)
    {
      uint64_t v119 = v88;
      int v89 = &v85[416 * (void)v86];
      *(_DWORD *)int v89 = bswap32(*(_DWORD *)v87);
      *((_DWORD *)v89 + 1) = -1;
      *((_DWORD *)v89 + 67) = -1;
      *((_WORD *)v89 + 136) = bswap32(*(unsigned __int16 *)(v87 + 4)) >> 16;
      *((_DWORD *)v89 + 69) = 1;
      *((_DWORD *)v89 + 70) = *((_DWORD *)a3 + 2);
      size_t v90 = *(unsigned __int8 *)(v87 + 6);
      v89[8] = v90;
      uint64_t v91 = v87 + 7;
      uint64_t v92 = v89 + 9;
      uint32_t v93 = v85;
      memcpy(v89 + 9, (const void *)(v87 + 7), v90);
      v92[v90] = 0;
      unsigned int v94 = *(unsigned __int16 *)(v91 + v90);
      uint64_t v95 = __rev16(v94);
      if (v95 > 0x10) {
        break;
      }
      uint64_t v87 = v91 + v90 + 2;
      *(_DWORD *)&v93[416 * (void)v86 + 284] = v95;
      int v85 = v93;
      if (v94)
      {
        int v96 = v119;
        uint64_t v97 = v119;
        do
        {
          *(v97 - 1) = bswap32(*(_DWORD *)v87);
          *uint64_t v97 = bswap32(*(_DWORD *)(v87 + 4));
          v97 += 2;
          v87 += 8;
          --v95;
        }
        while (v95);
      }
      else
      {
        int v96 = v119;
      }
      os_log_t v86 = (os_log_t)((char *)v86 + 1);
      long long v88 = (char *)(v96 + 104);
      if (v86 == logc)
      {
LABEL_111:
        int v44 = v121;
        __int16 v32 = v123;
        int v49 = v109;
        goto LABEL_118;
      }
    }
LABEL_140:
    int v21 = -3010;
    int v44 = v121;
    int v49 = v109;
LABEL_124:
    free(v49);
LABEL_128:
    __int16 v32 = v123;
LABEL_129:
    if (!v32) {
      goto LABEL_131;
    }
    goto LABEL_130;
  }
  *((_WORD *)a3 + 2) = bswap32(*((unsigned __int16 *)a3 + 2)) >> 16;
  *((_WORD *)a3 + 1) = bswap32(*((unsigned __int16 *)a3 + 1)) >> 16;
  *((_DWORD *)a3 + 2) = bswap32(*((_DWORD *)a3 + 2));
  do
  {
    *__int16 v26 = bswap32(*v26);
    ++v26;
    --v27;
  }
  while (v27);
  int v49 = 0;
LABEL_118:
  if (a1) {
    *a1 = a3;
  }
  int v21 = 0;
  if (!a2)
  {
    if (!v49) {
      goto LABEL_129;
    }
    goto LABEL_124;
  }
  *a2 = v49;
  if (v32) {
    goto LABEL_130;
  }
LABEL_131:
  if (v44) {
    free(v44);
  }
  if (v21) {
    goto LABEL_134;
  }
LABEL_137:
  if (a7) {
    *a7 = v21;
  }
  return v10;
}

uint64_t OSPFAddDynamicOptions(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v4 = 0u;
  long long v7 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v8[0] = a1;
  v8[1] = a2;
  uint64_t v6 = 1;
  pthread_attr_t v5 = v8;
  if (a3) {
    (*(void (**)(uint64_t, long long *))(a3 + 16))(a3, &v4);
  }
  return 0;
}

char *makebase36string(unint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  __s1[13] = 0;
  uint64_t v1 = 12;
  do
  {
    __s1[v1] = MCPeerIDBase36Digits[a1 % 0x24];
    unint64_t v2 = v1-- + 1;
    a1 /= 0x24uLL;
  }
  while (v2 > 1);
  return strdup(__s1);
}

void MCMetricsLog_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Invalid name %@", (uint8_t *)&v2, 0xCu);
}

void MCMetricsLog_cold_2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Payload is nil", v1, 2u);
}

void AGPEventListenerForMCSession_cold_1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_218756000, v0, v1, "Malloc failed.", v2, v3, v4, v5, v6);
}

void TracePrintNodes_cold_1(int *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_218756000, a2, OS_LOG_TYPE_DEBUG, "TracePrintNodes throttled (last second count %d)\n", (uint8_t *)v3, 8u);
}

void GCKSessionCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GCKSessionCreate_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to create global with error (%X).", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to create SendProc thread with error (%X).", v2, v3, v4, v5, v6);
}

void GCKSessionCreate_cold_5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to create RecvProc thread with error (%X).", v2, v3, v4, v5, v6);
}

void gckSessionRecvProc_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void gckSessionRecvProc_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to create socket with error (%X).", v2, v3, v4, v5, v6);
}

void gckSessionRecvProc_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Select call failed with error (%X).", v2, v3, v4, v5, v6);
}

void GCKSessionPrepareConnection_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GCKSessionPrepareConnection_cold_2(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "ICEGetCandidates failed with hResult [%ld].", (uint8_t *)&v2, 0xCu);
}

void GCKSessionPrepareConnection_cold_3(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = 840;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Calloc (%d bytes) failed.", buf, 8u);
}

void GCKSessionPrepareConnection_cold_4(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Getaddrinfo returned NULL.", buf, 2u);
}

void GCKSessionPrepareConnection_cold_5(uint8_t *buf, _DWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 67109120;
  *a2 = -2145779708;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Failed to initialize mutex attr with error (%X).", buf, 8u);
}

void GCKSessionEstablishConnection_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void GCKSessionEstablishConnection_cold_2()
{
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0xEu);
}

void GCKSessionDisposeConnection_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
}

void GCKSessionStartEventCallbacks_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to start event callback thread with error (%X).", v2, v3, v4, v5, v6);
}

void __SendUDPPacketCList_block_invoke_cold_1(uint64_t *a1, int a2, NSObject *a3)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v5 = *a1;
  int v6 = *(_DWORD *)(*a1 + 88);
  int v7 = *(_DWORD *)(*a1 + 72);
  uint64_t v8 = *(void *)(*a1 + 632);
  long long v9 = DTLSErrorName(a2);
  uint64_t v10 = a2;
  uint64_t v11 = __error();
  unsigned int v12 = strerror(*v11);
  int v13 = *__error();
  v14[0] = 67110914;
  v14[1] = v6;
  __int16 v15 = 1024;
  int v16 = v7;
  __int16 v17 = 2048;
  uint64_t v18 = v8;
  __int16 v19 = 2048;
  uint64_t v20 = v5;
  __int16 v21 = 2080;
  unsigned int v22 = v9;
  __int16 v23 = 2048;
  uint64_t v24 = v10;
  __int16 v25 = 2080;
  __int16 v26 = v12;
  __int16 v27 = 1024;
  int v28 = v13;
  _os_log_error_impl(&dword_218756000, a3, OS_LOG_TYPE_ERROR, "SSLWrite failed, packet was not sent for participant [%08X] channelID [%d] DTLS context [%p] pCList [%p]; SSLError ="
    " %s (%ld): errno = %s (%d).",
    (uint8_t *)v14,
    0x46u);
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Couldn't find pCList for participant %08X.", v2, v3, v4, v5, v6);
}

void __gckSessionSetupChannelWithDTLS_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "SendHello failed with error (%X).", v2, v3, v4, v5, v6);
}

void gckSessionSendHello_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "OSPFMakeHello failed for participant %08X.", v2, v3, v4, v5, v6);
}

void SendUDPPacketToParticipantChannelID_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = *(_DWORD *)(a1 + 72);
  v4[0] = 67109376;
  v4[1] = a2;
  __int16 v5 = 1024;
  int v6 = v3;
  _os_log_debug_impl(&dword_218756000, log, OS_LOG_TYPE_DEBUG, "Channel ID %d resolved to %d.", (uint8_t *)v4, 0xEu);
}

void DTLS_SocketWrite_cold_1(unsigned __int16 a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  int v3 = a1;
  uint64_t v4 = __error();
  __int16 v5 = strerror(*v4);
  int v6 = *__error();
  v7[0] = 67109634;
  v7[1] = v3;
  __int16 v8 = 2080;
  long long v9 = v5;
  __int16 v10 = 1024;
  int v11 = v6;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Failed to send a DTLS packet with %d bytes; sendmsg error: %s (%d).",
    (uint8_t *)v7,
    0x18u);
}

void gckSessionPerformDTLSHandshake_cold_1(int a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "SSLHandshake returned with error [%ld].", (uint8_t *)&v2, 0xCu);
}

void gckSessionPerformDTLSHandshake_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_218756000, a2, a3, "Trust for participant [%08X] is expected but SSLCopyPeerTrust returned NULL.", a5, a6, a7, a8, 0);
}

void gckSessionPerformDTLSHandshake_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void gckSessionRecvMessage_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x16u);
}

void gckSessionProcessHello_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to send Hello with error %X.", v2, v3, v4, v5, v6);
}

void gckSessionProcessDD_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "Failed to create dashboard data with error=%d.", v2, v3, v4, v5, v6);
}

void gckSessionSendDD_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "OSPFMakeDD for participant [%08X].", v2, v3, v4, v5, v6);
}

void gckSessionSendLSAACK_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0(&dword_218756000, v0, v1, "OSPFMakeLSAACK for participant [%08X] failed.", v2, v3, v4, v5, v6);
}

void gckSessionGetInterfacePriorityForCList_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_4_1();
  _os_log_error_impl(&dword_218756000, v0, OS_LOG_TYPE_ERROR, "SCNetworkInterfaceCopyAll() failed!: participant [%08X] channelID [%d].", v1, 0xEu);
}

void AGPTransportCallback(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Couldn't check in handle iDstIDs (%d).", (uint8_t *)v2, 8u);
}

void AGPTransportCallback(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_3(&dword_218756000, v2, v3, "Error (bad): failed to buffer a reliable packet.", v4);
}

void AGPSessionSendTo_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Unable to check-in a session handle.", v1, 2u);
}

void AGPSessionSendTo_cold_2(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_3(&dword_218756000, v2, v3, "Maximum segment size < 0.", v4);
}

void AGPSessionSendTo_cold_3(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_3(&dword_218756000, v2, v3, "Invalid mode!", v4);
}

void AGPSessionRecvFrom(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "No packet buffer at base - this shouldn't happen!", v1, 2u);
}

void AGPSessionRecvFrom(unsigned char *a1, unsigned char *a2)
{
  OUTLINED_FUNCTION_0_2(a1, a2);
  OUTLINED_FUNCTION_1_3(&dword_218756000, v2, v3, "Can't resend (bad timestamp)!", v4);
}

void OSPFMakeLSA_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Calloc failed.", v1, 2u);
}

void OSPFMakeLSAACK_cold_1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_218756000, a2, OS_LOG_TYPE_ERROR, "Calloc failed for participant [%08X].", (uint8_t *)v2, 8u);
}

void OSPFParse_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_218756000, log, OS_LOG_TYPE_ERROR, "Malloc failed.", v1, 2u);
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x270F18A38]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x270ED7AD0](data, *(void *)&len, md);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x270EE47E0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x270EE4808](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x270EE4820](theData);
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x270F23D70]();
}

uint64_t CFPropertyListCreateFormatted()
{
  return MEMORY[0x270F23EB8]();
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

Boolean CFSetGetValueIfPresent(CFSetRef theSet, const void *candidate, const void **value)
{
  return MEMORY[0x270EE4F88](theSet, candidate, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

uint64_t CFStringAppendF()
{
  return MEMORY[0x270F23ED0]();
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x270EE5048](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x270EE50B0](alloc, maxLength);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x270EE5178](theString, buffer, bufferSize, *(void *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x270EE5470](alloc);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1 = MEMORY[0x270EE54A8](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
}

uint64_t CheckInHandleDebug()
{
  return MEMORY[0x270F08EF0]();
}

uint64_t CheckOutHandleDebug()
{
  return MEMORY[0x270F08EF8]();
}

uint64_t CreateHandle()
{
  return MEMORY[0x270F08F00]();
}

uint64_t FreeLocalInterfaceList()
{
  return MEMORY[0x270F08E28]();
}

uint64_t GetLocalInterfaceListWithOptions()
{
  return MEMORY[0x270F08E38]();
}

uint64_t ICEAddOneInterface()
{
  return MEMORY[0x270F08E40]();
}

uint64_t ICECloseHandle()
{
  return MEMORY[0x270F08E48]();
}

uint64_t ICECreateHandleWithCallback()
{
  return MEMORY[0x270F08E58]();
}

uint64_t ICEDisableCandidatePairFilter()
{
  return MEMORY[0x270F08E60]();
}

uint64_t ICEGetCallInfoForConnectionData()
{
  return MEMORY[0x270F08E70]();
}

uint64_t ICEGetCandidates()
{
  return MEMORY[0x270F08E78]();
}

uint64_t ICEStartConnectivityCheck()
{
  return MEMORY[0x270F08E90]();
}

uint64_t ICEStopConnectivityCheck()
{
  return MEMORY[0x270F08EA0]();
}

uint64_t ICEUpdateRole()
{
  return MEMORY[0x270F08EB0]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47B0](*(void *)&bootstrapPort, mainPort);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x270EF4A18](*(void *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4A40](entryID);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

uint64_t IPPORTToSA()
{
  return MEMORY[0x270F08EB8]();
}

uint64_t IPPORTToSA6()
{
  return MEMORY[0x270F08EC0]();
}

uint64_t IPPORTToString()
{
  return MEMORY[0x270F08EC8]();
}

uint64_t IPToString()
{
  return MEMORY[0x270F08ED8]();
}

uint64_t NSAppendPrintF()
{
  return MEMORY[0x270F24450]();
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2C48]();
}

uint64_t SAToIPPORT()
{
  return MEMORY[0x270F08EE8]();
}

CFArrayRef SCNetworkInterfaceCopyAll(void)
{
  return (CFArrayRef)MEMORY[0x270F05598]();
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055A8](interface);
}

CFStringRef SCNetworkInterfaceGetInterfaceType(SCNetworkInterfaceRef interface)
{
  return (CFStringRef)MEMORY[0x270F055C0](interface);
}

OSStatus SSLClose(SSLContextRef context)
{
  return MEMORY[0x270EFD500](context);
}

OSStatus SSLCopyPeerTrust(SSLContextRef context, SecTrustRef *trust)
{
  return MEMORY[0x270EFD508](context, trust);
}

SSLContextRef SSLCreateContext(CFAllocatorRef alloc, SSLProtocolSide protocolSide, SSLConnectionType connectionType)
{
  return (SSLContextRef)MEMORY[0x270EFD510](alloc, *(void *)&protocolSide, *(void *)&connectionType);
}

OSStatus SSLHandshake(SSLContextRef context)
{
  return MEMORY[0x270EFD550](context);
}

OSStatus SSLRead(SSLContextRef context, void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD588](context, data, dataLength, processed);
}

OSStatus SSLSetCertificate(SSLContextRef context, CFArrayRef certRefs)
{
  return MEMORY[0x270EFD590](context, certRefs);
}

OSStatus SSLSetClientSideAuthenticate(SSLContextRef context, SSLAuthenticate auth)
{
  return MEMORY[0x270EFD598](context, *(void *)&auth);
}

OSStatus SSLSetConnection(SSLContextRef context, SSLConnectionRef connection)
{
  return MEMORY[0x270EFD5A0](context, connection);
}

OSStatus SSLSetEnabledCiphers(SSLContextRef context, const SSLCipherSuite *ciphers, size_t numCiphers)
{
  return MEMORY[0x270EFD5A8](context, ciphers, numCiphers);
}

OSStatus SSLSetIOFuncs(SSLContextRef context, SSLReadFunc readFunc, SSLWriteFunc writeFunc)
{
  return MEMORY[0x270EFD5B0](context, readFunc, writeFunc);
}

OSStatus SSLSetMaxDatagramRecordSize(SSLContextRef dtlsContext, size_t maxSize)
{
  return MEMORY[0x270EFD5B8](dtlsContext, maxSize);
}

OSStatus SSLSetSessionConfig(SSLContextRef context, CFStringRef config)
{
  return MEMORY[0x270EFD5E8](context, config);
}

OSStatus SSLSetSessionOption(SSLContextRef context, SSLSessionOption option, Boolean value)
{
  return MEMORY[0x270EFD5F0](context, *(void *)&option, value);
}

OSStatus SSLWrite(SSLContextRef context, const void *data, size_t dataLength, size_t *processed)
{
  return MEMORY[0x270EFD5F8](context, data, dataLength, processed);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x270EFDD70](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x270EFDD78](trust);
}

uint64_t SockAddrCompareAddr()
{
  return MEMORY[0x270F246B0]();
}

uint64_t SocketGetInterfaceInfo()
{
  return MEMORY[0x270F246F8]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
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

uint64_t _CFReadStreamCreateFromFileDescriptor()
{
  return MEMORY[0x270EE56D8]();
}

uint64_t _CFWriteStreamCreateFromFileDescriptor()
{
  return MEMORY[0x270EE5788]();
}

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x270EF2C98](commaSeparatedKeysString, firstValue);
}

uint64_t _SCNetworkInterfaceGetIORegistryEntryID()
{
  return MEMORY[0x270F05788]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void std::terminate(void)
{
}

void operator delete()
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

int __darwin_check_fd_set_overflow(int a1, const void *a2, int a3)
{
  return MEMORY[0x270ED7DA8](*(void *)&a1, a2, *(void *)&a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x270ED7EB0](a1, *(void *)&a2, a3, a4);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x270ED7EE0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint32_t arc4random(void)
{
  return MEMORY[0x270ED85E0]();
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x270ED8758](*(void *)&a1, a2, *(void *)&a3);
}

void bzero(void *a1, size_t a2)
{
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int compress2(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen, int level)
{
  return MEMORY[0x270F9C680](dest, destLen, source, sourceLen, *(void *)&level);
}

uLong compressBound(uLong sourceLen)
{
  return MEMORY[0x270F9C688](sourceLen);
}

uLong crc32(uLong crc, const Bytef *buf, uInt len)
{
  return MEMORY[0x270F9C690](crc, buf, *(void *)&len);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

void freeaddrinfo(addrinfo *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x270ED9AF0](*(void *)&a1, a2);
}

int getaddrinfo(const char *a1, const char *a2, const addrinfo *a3, addrinfo **a4)
{
  return MEMORY[0x270ED9B98](a1, a2, a3, a4);
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

int getsockname(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x270ED9D88](*(void *)&a1, a2, a3);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x270ED9D98](a1, a2);
}

unsigned int if_nametoindex(const char *a1)
{
  return MEMORY[0x270ED9E80](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x270EDA560](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x270EDAA78]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x270EDAA80]();
}

int pipe(int a1[2])
{
  return MEMORY[0x270EDAC38](a1);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x270EDADF8](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x270EDAE10](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x270EDAE20](a1, *(void *)&a2);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE58](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x270EDAE60](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE68](a1);
}

int pthread_cond_timedwait_relative_np(pthread_cond_t *a1, pthread_mutex_t *a2, const timespec *a3)
{
  return MEMORY[0x270EDAE80](a1, a2, a3);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x270EDAEA0](a1, a2, a3, a4);
}

int pthread_join(pthread_t a1, void **a2)
{
  return MEMORY[0x270EDAF10](a1, a2);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF50](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x270EDAF58](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF78](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x270EDAF80](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x270EDAF98](a1, *(void *)&a2);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x270EDB038](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

ssize_t recvmsg(int a1, msghdr *a2, int a3)
{
  return MEMORY[0x270EDB1A0](*(void *)&a1, a2, *(void *)&a3);
}

int select(int a1, fd_set *a2, fd_set *a3, fd_set *a4, timeval *a5)
{
  return MEMORY[0x270EDB328](*(void *)&a1, a2, a3, a4, a5);
}

ssize_t sendmsg(int a1, const msghdr *a2, int a3)
{
  return MEMORY[0x270EDB3B8](*(void *)&a1, a2, *(void *)&a3);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x270EDB440](*(void *)&a1, *(void *)&a2, *(void *)&a3, a4, *(void *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x270EDB520](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x270EDB5D0](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

char *__cdecl strpbrk(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB668](__s1, __s2);
}

size_t strspn(const char *__s, const char *__charset)
{
  return MEMORY[0x270EDB698](__s, __charset);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x270EDB6A0](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB718](__str, __endptr, *(void *)&__base);
}

int uncompress(Bytef *dest, uLongf *destLen, const Bytef *source, uLong sourceLen)
{
  return MEMORY[0x270F9C770](dest, destLen, source, sourceLen);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x270EDBB18](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x270EDBC30](*(void *)&__fd, __buf, __nbyte);
}