@interface VCNWConnectionMonitor
@end

@implementation VCNWConnectionMonitor

void __VCNWConnectionMonitor_Create_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v2 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v2);
  v3 = malloc_type_calloc(1uLL, 0x5E68uLL, 0x10A0040E7F0E380uLL);
  if (!v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __VCNWConnectionMonitor_Create_block_invoke_cold_1();
      }
    }
    goto LABEL_12;
  }
  v4 = v3;
  uint64_t interface_status_monitor = nw_connection_create_interface_status_monitor();
  *(void *)v4 = interface_status_monitor;
  if (!interface_status_monitor)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __VCNWConnectionMonitor_Create_block_invoke_cold_2();
      }
    }
    free(v4);
LABEL_12:
    v4 = 0;
    goto LABEL_13;
  }
  v4[6041] = 5000;
  Boolean keyExistsAndHasValidFormat = 0;
  int AppIntegerValue = CFPreferencesGetAppIntegerValue(@"ReportingFrequency", @"com.apple.VideoConference", &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat) {
    v4[6041] = 1000 * AppIntegerValue;
  }
LABEL_13:
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v4;
}

void __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke(uint64_t a1)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(const char **)(a1 + 48);
  v5 = *(NSObject **)(a1 + 56);
  v6 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v6);
  v7 = malloc_type_calloc(1uLL, 0x5E68uLL, 0x10A0040E7F0E380uLL);
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v7)
  {
    v9 = (os_log_t *)MEMORY[0x1E4F47A50];
    if (ErrorLogLevelForModule >= 7)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v43) = 106;
        WORD2(v43) = 2048;
        *(void *)((char *)&v43 + 6) = v7;
        HIWORD(v43) = 2080;
        v44 = v4;
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Creating monitor=%p with interfaceName=%s", buf, 0x30u);
      }
    }
    memset(v41, 170, 22);
    *(void *)__str = 0xAAAAAAAAAAAAAAAALL;
    snprintf(__str, 0x1EuLL, "%p-%s", v7, v4);
    v12 = LogDump_OpenLog((uint64_t)__str, (uint64_t)"VCNWConnectionMonitor", (uint64_t)".nwmonitordump", (char)", 9, (char)");
    *((void *)v7 + 2) = v12;
    VRLogfilePrintSync(v12, "STime\tTimestamp\tVersion\tDirection\tByteCount\tQSize1\tQSize2\tDelay\tThroughput\tTxRate\tRateTrend\tFrequencyBand\tIntermittentState\tIntermittentPeriod\tSingleOutagePeriod\tBtCoex\tRadioCoex\tScoreDelayTx\tScoreDelayRx\tScoreLossTx\tScoreLossRx\tScoreChannel\tOffChannelRatio\tWlanDutyCycle\tWifiObservedTxBitrate(BE)\tWifiObservedTxBitrate(BK)\tWifiObservedTxBitrate(VI)\tWifiObservedTxBitrate(VO)\tWifiObservedTxBitrate(LLW0)\tWifiObservedTxBitrate(LLW1)\n", v13, v14, v15, v16, v17, v18, v29);
    secure_udp = nw_parameters_create_secure_udp((nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C90], (nw_parameters_configure_protocol_block_t)*MEMORY[0x1E4F38C88]);
    VTP_NWConnectionContext();
    nw_parameters_set_context();
    v20 = nw_interface_create_with_name();
    nw_parameters_require_interface(secure_udp, v20);
    if (v2) {
      v21 = "1234::1234";
    }
    else {
      v21 = "120.0.0.1";
    }
    host = nw_endpoint_create_host(v21, "1234");
    nw_connection_t v23 = nw_connection_create(host, secure_udp);
    *((void *)v7 + 1) = v23;
    if (v5)
    {
      *((void *)v7 + 3017) = v5;
      dispatch_retain(v5);
      v24 = *((void *)v7 + 1);
    }
    else
    {
      v24 = v23;
    }
    v25 = VTP_NWConnectionQueue();
    nw_connection_set_queue(v24, v25);
    v26 = *((void *)v7 + 1);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 0x40000000;
    *(void *)&buf[16] = ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke;
    *(void *)&long long v43 = &unk_1E6DB55C0;
    *((void *)&v43 + 1) = v3;
    v44 = (const char *)v7;
    nw_connection_set_state_changed_handler(v26, buf);
    nw_connection_start(*((nw_connection_t *)v7 + 1));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *v9;
      if (os_log_type_enabled(*v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v30 = 136316162;
        uint64_t v31 = v27;
        __int16 v32 = 2080;
        v33 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName";
        __int16 v34 = 1024;
        int v35 = 161;
        __int16 v36 = 2048;
        v37 = v7;
        __int16 v38 = 2080;
        v39 = v4;
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting NWConnection for monitor=%p with interfaceName=%s", v30, 0x30u);
      }
    }
    nw_release(v20);
    nw_release(secure_udp);
    nw_release(host);
  }
  else if (ErrorLogLevelForModule >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke_cold_1();
    }
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
}

void __VCNWConnectionMonitor_Destroy_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  int v2 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v2);
  if (*(unsigned char *)(v1 + 24128))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __VCNWConnectionMonitor_Destroy_block_invoke_cold_1();
      }
    }
  }
  else
  {
    *(unsigned char *)(v1 + 24128) = 1;
    if (*(void *)v1) {
      nw_interface_status_monitor_cancel();
    }
    uint64_t v3 = *(NSObject **)(v1 + 8);
    if (v3) {
      nw_connection_cancel(v3);
    }
    uint64_t v4 = *(void *)(v1 + 16);
    if (v4)
    {
      LogDump_CloseLog(v4);
      *(void *)(v1 + 16) = 0;
    }
  }
}

uint64_t __VCNWConnectionMonitor_SetNotificationHandler_block_invoke()
{
  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_update_handler();
}

uint64_t __VCNWConnectionMonitor_SetPacketEventHandler_block_invoke()
{
  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_packet_event_handler();
}

uint64_t __VCNWConnectionMonitor_SetStatisticsHandler_block_invoke()
{
  v0 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v0);
  VTP_NWConnectionQueue();
  return nw_interface_status_monitor_set_update_handler();
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke(uint64_t a1, int a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  switch(a2)
  {
    case 5:
      uint64_t v8 = (uint64_t *)(a1 + 40);
      if (*(void *)(*(void *)(a1 + 40) + 8))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v9 = VRTraceErrorLogLevelToCSTR();
          uint64_t v10 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v11 = *v8;
            uint64_t v12 = *(void *)(*v8 + 8);
            *(_DWORD *)buf = 136316162;
            uint64_t v20 = v9;
            __int16 v21 = 2080;
            v22 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke";
            __int16 v23 = 1024;
            int v24 = 150;
            __int16 v25 = 2048;
            uint64_t v26 = v11;
            __int16 v27 = 2048;
            uint64_t v28 = v12;
            _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NWConnection state cancelled! monitor=%p and monitor->NWConnection=%p is released.", buf, 0x30u);
          }
        }
        nw_release(*(void **)(*v8 + 8));
        *(void *)(*v8 + 8) = 0;
      }
      _VCNWConnectionMonitor_CheckAndReleaseNWMonitor((void **)v8);
      break;
    case 4:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_3(v13, a1, v14);
        }
      }
      break;
    case 3:
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v3 = VRTraceErrorLogLevelToCSTR();
        uint64_t v4 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v5 = *(void *)(a1 + 40);
          uint64_t v6 = *(void *)(v5 + 8);
          *(_DWORD *)buf = 136316162;
          uint64_t v20 = v3;
          __int16 v21 = 2080;
          v22 = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke";
          __int16 v23 = 1024;
          int v24 = 131;
          __int16 v25 = 2048;
          uint64_t v26 = v5;
          __int16 v27 = 2048;
          uint64_t v28 = v6;
          _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NWConnection state ready and setting status monitor! monitor=%p, connection=%p", buf, 0x30u);
        }
      }
      v7 = (uint64_t **)(a1 + 40);
      if (*(unsigned char *)(*(void *)(a1 + 40) + 24128))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_2();
          }
        }
      }
      else
      {
        *void *v7 = nw_connection_create_interface_status_monitor();
        uint64_t v15 = *v7;
        if (**v7)
        {
          uint64_t v16 = *(void *)(a1 + 32);
          if (v16 && !*((unsigned char *)v15 + 24128))
          {
            uint64_t v17 = v15[3017];
            block[0] = MEMORY[0x1E4F143A8];
            block[1] = 0x40000000;
            block[2] = ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_20;
            block[3] = &unk_1E6DB5598;
            block[4] = v16;
            dispatch_async(v17, block);
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_1();
          }
        }
      }
      break;
  }
}

uint64_t ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_20(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke(uint64_t a1, long long *a2, uint64_t a3, int a4)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v8);
  uint64_t v10 = (void ***)(a1 + 32);
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9)
  {
    if (a4)
    {
      if (a4 == 89)
      {
        if (*(void *)v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            uint64_t v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *v10;
              uint64_t v14 = **v10;
              int v25 = 136316162;
              uint64_t v26 = v11;
              __int16 v27 = 2080;
              uint64_t v28 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
              __int16 v29 = 1024;
              int v30 = 245;
              __int16 v31 = 2048;
              *(void *)__int16 v32 = v14;
              *(_WORD *)&v32[8] = 2048;
              *(void *)&v32[10] = v13;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d monitor->nwMonitor=%p is released, monitor=%p", (uint8_t *)&v25, 0x30u);
            }
          }
          nw_release(**v10);
          **uint64_t v10 = 0;
        }
        _VCNWConnectionMonitor_CheckAndReleaseNWMonitor((void **)(a1 + 32));
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v24 = *v10;
      int v25 = 136316162;
      uint64_t v26 = v15;
      __int16 v27 = 2080;
      uint64_t v28 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
      __int16 v29 = 1024;
      int v30 = 251;
      __int16 v31 = 1024;
      *(_DWORD *)__int16 v32 = a4;
      *(_WORD *)&v32[4] = 2048;
      *(void *)&v32[6] = v24;
      __int16 v21 = " [%s] %s:%d NWConnection notification returns error %d, monitor=%p";
      v22 = v16;
      uint32_t v23 = 44;
LABEL_29:
      _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v25, v23);
      return;
    }
    if (*(unsigned char *)(v9 + 24128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_2();
        }
      }
    }
    else
    {
      if (!a2 || a3 != 96)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return;
        }
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return;
        }
        int v25 = 136316418;
        uint64_t v26 = v19;
        __int16 v27 = 2080;
        uint64_t v28 = "_VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke";
        __int16 v29 = 1024;
        int v30 = 261;
        __int16 v31 = 1024;
        *(_DWORD *)__int16 v32 = 96;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = a3;
        *(_WORD *)&v32[10] = 2048;
        *(void *)&v32[12] = a2;
        __int16 v21 = " [%s] %s:%d NWConnection notification size mismatch. (expected size: %u, actual size: %u) status_data: %p";
        v22 = v20;
        uint32_t v23 = 50;
        goto LABEL_29;
      }
      uint64_t v17 = *(void *)(a1 + 40);
      uint64_t v18 = *(void (**)(uint64_t, void *))(a1 + 48);
      _VCNWConnectionMonitor_DispatchedProcessInterfaceAdvisoryNotification(v17, v18, a2);
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_1();
    }
  }
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke(void *a1, int a2, uint64_t a3, unint64_t a4, int a5)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v10);
  if (a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_2();
      }
    }
    return;
  }
  if (a2 == 1)
  {
    if (!a4) {
      return;
    }
    unint64_t v11 = 0;
    unsigned int v12 = 1;
    while (1)
    {
      if (a1[4])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2000000000;
        v21[0] = 0xAAAAAAAAAAAAAAAALL;
        v21[0] = malloc_type_calloc(1uLL, 0x10uLL, 0x1000040451B5BE8uLL);
        uint64_t v13 = *(_OWORD **)(*(void *)&buf[8] + 24);
        if (!v13)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_1();
            }
          }
          _Block_object_dispose(buf, 8);
          return;
        }
        *uint64_t v13 = *(_OWORD *)(a3 + 16 * v11);
        uint64_t v15 = a1[4];
        uint64_t v14 = a1[5];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 0x40000000;
        block[2] = ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_27;
        block[3] = &unk_1E6DB5608;
        uint64_t v16 = a1[6];
        void block[5] = v15;
        block[6] = v16;
        block[4] = buf;
        dispatch_async(v14, block);
        _Block_object_dispose(buf, 8);
      }
      unint64_t v11 = v12++;
      if (v11 >= a4) {
        return;
      }
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v17;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_2";
      *(_WORD *)&buf[22] = 1024;
      LODWORD(v21[0]) = 307;
      WORD2(v21[0]) = 1024;
      *(_DWORD *)((char *)v21 + 6) = a2;
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Receive other unknown event type %d", buf, 0x22u);
    }
  }
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_27(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke(void *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = VTP_NWConnectionQueue();
  dispatch_assert_queue_V2(v8);
  uint64_t v10 = (void ***)(a1 + 4);
  uint64_t v9 = a1[4];
  if (v9)
  {
    if (a4)
    {
      if (a4 == 89)
      {
        if (*(void *)v9)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            unsigned int v12 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v13 = *v10;
              uint64_t v14 = **v10;
              *(_DWORD *)buf = 136316162;
              *(void *)&uint8_t buf[4] = v11;
              *(_WORD *)&buf[12] = 2080;
              *(void *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
              *(_WORD *)&buf[22] = 1024;
              *(_DWORD *)&unsigned char buf[24] = 539;
              *(_WORD *)&buf[28] = 2048;
              *(void *)&buf[30] = v14;
              *(_WORD *)&buf[38] = 2048;
              *(void *)&buf[40] = v13;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d monitor->nwMonitor=%p is released, monitor=%p", buf, 0x30u);
            }
          }
          nw_release(**v10);
          **uint64_t v10 = 0;
        }
        _VCNWConnectionMonitor_CheckAndReleaseNWMonitor(v10);
        return;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint64_t v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return;
      }
      int v25 = *v10;
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&unsigned char buf[24] = 545;
      *(_WORD *)&buf[28] = 1024;
      *(_DWORD *)&buf[30] = a4;
      *(_WORD *)&buf[34] = 2048;
      *(void *)&buf[36] = v25;
      v22 = " [%s] %s:%d NWConnection notification returns error %d, monitor=%p";
      uint32_t v23 = v16;
      uint32_t v24 = 44;
LABEL_29:
      _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
      return;
    }
    if (*(unsigned char *)(v9 + 24128))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_2();
        }
      }
    }
    else
    {
      if (!a2 || a3 != 96)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return;
        }
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        __int16 v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return;
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "_VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&unsigned char buf[24] = 555;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = 96;
        *(_WORD *)&buf[34] = 1024;
        *(_DWORD *)&buf[36] = a3;
        *(_WORD *)&buf[40] = 2048;
        *(void *)&buf[42] = a2;
        v22 = " [%s] %s:%d NWConnection notification size mismatch. (expected size: %u, actual size: %u) status_data: %p";
        uint32_t v23 = v21;
        uint32_t v24 = 50;
        goto LABEL_29;
      }
      memset(v39, 170, sizeof(v39));
      long long v40 = xmmword_1E259DC20;
      long long v41 = unk_1E259DC30;
      long long v38 = unk_1E259DBF0;
      memset(buf, 170, sizeof(buf));
      _VCNWConnectionMonitor_ProcessNotification(v9, a2, (uint64_t)buf);
      uint64_t v17 = a1[5];
      if (v17 && *(void *)&buf[8])
      {
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 0x40000000;
        v26[2] = ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_32;
        v26[3] = &__block_descriptor_tmp_33;
        uint64_t v18 = a1[6];
        uint64_t v19 = a1[7];
        v26[4] = v17;
        v26[5] = v19;
        long long v33 = v39[0];
        long long v34 = v39[1];
        long long v35 = v40;
        long long v36 = v41;
        long long v29 = *(_OWORD *)&buf[32];
        long long v30 = *(_OWORD *)&buf[48];
        long long v31 = *(_OWORD *)&buf[64];
        long long v32 = v38;
        long long v27 = *(_OWORD *)buf;
        long long v28 = *(_OWORD *)&buf[16];
        dispatch_async(v18, v26);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_1();
    }
  }
}

uint64_t ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_32(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = *(uint64_t (**)(uint64_t, _OWORD *))(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 40);
  long long v3 = *(_OWORD *)(a1 + 160);
  v9[6] = *(_OWORD *)(a1 + 144);
  v9[7] = v3;
  long long v4 = *(_OWORD *)(a1 + 192);
  v9[8] = *(_OWORD *)(a1 + 176);
  v9[9] = v4;
  long long v5 = *(_OWORD *)(a1 + 96);
  v9[2] = *(_OWORD *)(a1 + 80);
  v9[3] = v5;
  long long v6 = *(_OWORD *)(a1 + 128);
  v9[4] = *(_OWORD *)(a1 + 112);
  v9[5] = v6;
  long long v7 = *(_OWORD *)(a1 + 64);
  v9[0] = *(_OWORD *)(a1 + 48);
  v9[1] = v7;
  return v2(v1, v9);
}

void __VCNWConnectionMonitor_Create_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for monitor", v2, v3, v4, v5, v6);
}

void __VCNWConnectionMonitor_Create_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCNWConnectionMonitor_DispatchedCreate";
  LODWORD(v4) = 78;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create monitor->nwMonitor for monitor=%p!", v2, *(const char **)v3, (unint64_t)"_VCNWConnectionMonitor_DispatchedCreate" >> 16, v4);
}

void __VCNWConnectionMonitor_CreateWithInterfaceName_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for monitor", v2, v3, v4, v5, v6);
}

void __VCNWConnectionMonitor_Destroy_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Monitor is already destroyed!", v2, v3, v4, v5, v6);
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 0x8000000;
  HIDWORD(v6) = v0;
  OUTLINED_FUNCTION_4_2(&dword_1E1EA4000, v1, v2, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCNWConnectionMonitor.c:%d: Failed to create status monitor after state ready! monitor=%p", v3, v4, v5, 138, v6);
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NWConnection state ready but monitor=%p is already destroyed!", v2, v3, v4, v5);
}

void ___VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_cold_3(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136316162;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&unsigned char v3[14] = "_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_2";
  LODWORD(v4) = 146;
  WORD2(v4) = 2048;
  *(void *)((char *)&v4 + 6) = *(void *)(a2 + 40);
  OUTLINED_FUNCTION_4_2(&dword_1E1EA4000, a2, a3, " [%s] %s:%d NWConnection state failed, monitor=%p, state=%d", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"_VCNWConnectionMonitor_DispatchedCreateWithInterfaceName_block_invoke_2" >> 16, (const void *)v4, *(void *)((char *)&v4 + 6) >> 16);
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d monitor is null!", v2, v3, v4, v5, v6);
}

void ___VCNWConnectionMonitor_DispatchedSetNotificationHandler_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d monitor is already destroyed! monitor=%p", v2, v3, v4, v5);
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate memory for packetEvent!", v2, v3, v4, v5, v6);
}

void ___VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d NWConnection packet event returns error %d", v2, *(const char **)v3, (unint64_t)"_VCNWConnectionMonitor_DispatchedSetPacketEventHandler_block_invoke" >> 16, 283);
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d monitor is null!", v2, v3, v4, v5, v6);
}

void ___VCNWConnectionMonitor_DispatchedSetStatisticsHandler_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9_1(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d monitor is already destroyed! monitor=%p", v2, v3, v4, v5);
}

@end