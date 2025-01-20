@interface VTP
@end

@implementation VTP

uint64_t __VTP_NWConnectionContext_block_invoke()
{
  VTP_NWConnectionContext_context = nw_context_create();
  nw_context_set_isolate_protocol_stack();
  nw_context_set_scheduling_mode();
  uint64_t v0 = VTP_NWConnectionContext_context;

  return MEMORY[0x1F40F2D48](v0);
}

void __VTP_NWConnectionQueue_block_invoke()
{
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
  initially_inactive = dispatch_queue_attr_make_initially_inactive(0);
  VTP_NWConnectionQueue_queue = (uint64_t)dispatch_queue_create_with_target_V2("VTP Receive Proc", initially_inactive, CustomRootQueue);
  if (VTP_NWConnectionContext_once != -1) {
    dispatch_once(&VTP_NWConnectionContext_once, &__block_literal_global_48);
  }
  nw_queue_context_target_dispatch_queue();
  v2 = VTP_NWConnectionQueue_queue;

  dispatch_activate(v2);
}

void *__VTP_DuplicateVFD_block_invoke(uint64_t a1, uint64_t a2, void *__src)
{
  result = memcpy((void *)(*(void *)(*(void *)(a1 + 32) + 8) + 32), __src, 0x208uLL);
  uint64_t v6 = *(int *)(*(void *)(*(void *)(a1 + 32) + 8) + 52);
  if (v6 != -1) {
    ++*(_DWORD *)(a2 + 4 * v6 + 128);
  }
  return result;
}

void __VTP_ScheduleReceiveForNWConnection_block_invoke(uint64_t a1, NSObject *a2, NSObject *a3, int a4, nw_error_t error)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if (error)
  {
    int error_code = nw_error_get_error_code(error);
    if (error_code) {
      goto LABEL_7;
    }
  }
  else
  {
    int error_code = 0;
  }
  if (a4)
  {
    uint64_t v10 = *(void *)(a1 + 32);
    char v11 = *(unsigned char *)(a1 + 40);
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __VTP_ScheduleReceiveForNWConnection_block_invoke;
    *(void *)&buf[24] = &unk_1E6DB78E0;
    *(void *)&buf[32] = v10;
    buf[40] = v11;
    nw_connection_receive_multiple();
    goto LABEL_14;
  }
LABEL_7:
  if (error_code)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = *(void *)(a1 + 32);
        int v28 = *(unsigned __int8 *)(a1 + 40);
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "VTP_ScheduleReceiveForNWConnection_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 5441;
        *(_WORD *)&buf[28] = 1024;
        *(_DWORD *)&buf[30] = error_code;
        *(_WORD *)&buf[34] = 2112;
        *(void *)&buf[36] = v27;
        *(_WORD *)&buf[44] = 1024;
        *(_DWORD *)&buf[46] = v28;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d NWConnection failed to receive data with error=%d connection=%@ shouldIgnoreConnectionRefusedError=%d", buf, 0x32u);
      }
    }
    if (error_code == 61 && *(unsigned char *)(a1 + 40))
    {
      uint64_t v14 = *(void *)(a1 + 32);
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __VTP_ScheduleReceiveForNWConnection_block_invoke;
      *(void *)&buf[24] = &unk_1E6DB78E0;
      *(void *)&buf[32] = v14;
      buf[40] = 1;
      nw_connection_receive_multiple();
    }
  }
LABEL_14:
  uint64_t v15 = CheckInHandleDebug();
  uint64_t v16 = v15;
  if (v15)
  {
    if (a2)
    {
      uint64_t v17 = *(void *)(a1 + 32);
      int v39 = 1;
      uint64_t v35 = 0;
      v36 = (void **)&v35;
      uint64_t v37 = 0x2020000000;
      uint64_t v38 = 0;
      applier[0] = MEMORY[0x1E4F143A8];
      applier[1] = 3221225472;
      applier[2] = ___VTP_HandleReceiveForNWConnection_block_invoke;
      applier[3] = &unk_1E6DB7950;
      applier[4] = &v35;
      applier[5] = v15;
      dispatch_data_apply(a2, applier);
      *((double *)v36[3] + 23) = micro();
      unint64_t v44 = 0xAAAAAAAAAAAAAAAALL;
      *(void *)&long long v18 = 0xAAAAAAAAAAAAAAAALL;
      *((void *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
      long long v42 = v18;
      long long v43 = v18;
      *(_OWORD *)&buf[48] = v18;
      long long v41 = v18;
      *(_OWORD *)&buf[16] = v18;
      *(_OWORD *)&buf[32] = v18;
      *(_OWORD *)buf = v18;
      VCSDInfoConstructWithNWConnection(v17, (uint64_t)buf);
      VTP_SetConnectionFlagsForPacket(v16, 0, (uint64_t)v36[3], (int *)buf);
      if ((VTP_ProcessPacketType(v16, 0, -1, (uint64_t)v36[3]) & 0x80000000) != 0)
      {
        _VTP_ReleasePacket(v16, v36 + 3);
      }
      else
      {
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x2020000000;
        char v33 = 0;
        if (a3)
        {
          v29[0] = MEMORY[0x1E4F143A8];
          v29[1] = 3221225472;
          v29[2] = ___VTP_HandleReceiveForNWConnection_block_invoke_56;
          v29[3] = &unk_1E6DB7978;
          v29[4] = &v30;
          nw_content_context_foreach_protocol_metadata(a3, v29);
          v19 = v31;
        }
        else
        {
          v19 = &v30;
        }
        v20 = v36;
        v21 = (char *)v36[3];
        long long v22 = *(_OWORD *)&buf[16];
        *(_OWORD *)(v21 + 232) = *(_OWORD *)buf;
        *(_OWORD *)(v21 + 248) = v22;
        long long v23 = v42;
        *(_OWORD *)(v21 + 296) = v41;
        *(_OWORD *)(v21 + 312) = v23;
        *(_OWORD *)(v21 + 328) = v43;
        long long v24 = *(_OWORD *)&buf[48];
        *(_OWORD *)(v21 + 264) = *(_OWORD *)&buf[32];
        *((void *)v21 + 43) = v44;
        *(_OWORD *)(v21 + 280) = v24;
        v25 = (unsigned int *)v20[3];
        *((unsigned char *)v25 + 516) = a4;
        *((unsigned char *)v25 + 352) = *((unsigned char *)v19 + 24);
        unsigned int v26 = v25[56];
        VTP_UpdateReceivedBytes(v25[54], v25[138], (*v25 & 0xF0) != 0, *((unsigned __int8 *)v25 + 223), (uint64_t)buf, *((unsigned __int8 *)v25 + 413), *((unsigned __int8 *)v25 + 408), *((unsigned char *)v25 + 412) != 0);
        if (v26 != -1) {
          _VTP_HealthPrint(v16, *((void *)v36[3] + 69), v26, 0, 0);
        }
        pthread_rwlock_rdlock((pthread_rwlock_t *)(v16 + 5376));
        VTP_DemuxPacketsToVFDList(v16, v36[3], &v39);
        pthread_rwlock_unlock((pthread_rwlock_t *)(v16 + 5376));
        _Block_object_dispose(&v30, 8);
      }
      _Block_object_dispose(&v35, 8);
    }
    CheckOutHandleDebug();
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __VTP_ScheduleReceiveForNWConnection_block_invoke_cold_1();
    }
  }
}

uint64_t __VTP_GetPktType_block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  **(_DWORD **)(result + 40) = *(_DWORD *)(a3 + 28);
  *(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
  return result;
}

uint64_t ___VTP_SendOnePacketWithNWConnection_block_invoke(uint64_t result, void *a2)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    uint64_t v3 = result;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = *(void *)(v3 + 32);
        uint64_t v7 = *(void *)(v3 + 40);
        uint64_t v8 = *(void *)(v3 + 48);
        uint64_t v9 = objc_msgSend((id)objc_msgSend(a2, "description"), "UTF8String");
        int v10 = *(_DWORD *)(v3 + 344);
        int v11 = 136316930;
        uint64_t v12 = v4;
        __int16 v13 = 2080;
        uint64_t v14 = "_VTP_SendOnePacketWithNWConnection_block_invoke";
        __int16 v15 = 1024;
        int v16 = 5348;
        __int16 v17 = 2048;
        uint64_t v18 = v6;
        __int16 v19 = 2048;
        uint64_t v20 = v7;
        __int16 v21 = 2048;
        uint64_t v22 = v8;
        __int16 v23 = 2080;
        uint64_t v24 = v9;
        __int16 v25 = 1024;
        int v26 = v10;
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d nw_connection_send(%llx, %llx, %llx) failed with error=%s, expiration time=%dms", (uint8_t *)&v11, 0x4Au);
      }
    }
    kdebug_trace();
    return VTP_NotifySendFailed(v3 + 348);
  }
  return result;
}

BOOL ___VTP_HandleReceiveForNWConnection_block_invoke(uint64_t a1, dispatch_object_t object, uint64_t a3, void *a4, size_t a5)
{
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        ___VTP_HandleReceiveForNWConnection_block_invoke_cold_1();
      }
    }
  }
  else
  {
    dispatch_retain(object);
    if ((_VTP_AllocatePacketWithBufferFreeCallback(*(void *)(a1 + 40), a4, a5, (void (__cdecl *)(void *, void *, size_t))_VTP_DispathDataFreeCallback, object, (CMBlockBufferRef **)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          ___VTP_HandleReceiveForNWConnection_block_invoke_cold_2();
        }
      }
      dispatch_release(object);
    }
  }
  return a3 != 0;
}

uint64_t ___VTP_HandleReceiveForNWConnection_block_invoke_56(uint64_t a1, int a2, nw_protocol_metadata_t metadata)
{
  uint64_t result = nw_protocol_metadata_is_ip(metadata);
  if (result)
  {
    uint64_t result = nw_ip_metadata_get_hop_limit();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

void __VTP_SetIDSReadHandler_block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, __int16 a6, unsigned __int8 *a7, void *a8)
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  if (a8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      int v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(void *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "VTP_SetIDSReadHandler_block_invoke";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 6342;
        *(_WORD *)&buf[28] = 2048;
        *(void *)&buf[30] = a2;
        *(_WORD *)&buf[38] = 2080;
        *(void *)&buf[40] = objc_msgSend((id)objc_msgSend(a8, "description"), "UTF8String");
        _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d Datagram channel [%p] failed to read with error=%s", buf, 0x30u);
      }
    }
    return;
  }
  if (a7)
  {
    int v17 = (*a7 >> 6) & 1;
    if (a4) {
      goto LABEL_13;
    }
  }
  else
  {
    LOBYTE(v17) = 0;
    if (a4) {
      goto LABEL_13;
    }
  }
  if ((v17 & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __VTP_SetIDSReadHandler_block_invoke_cold_9();
      }
    }
    return;
  }
LABEL_13:
  uint64_t v18 = CheckInHandleDebug();
  if (v18)
  {
    uint64_t v19 = v18;
    v63 = 0;
    v64 = 0;
    int v20 = a4;
    if ((_VTP_AllocatePacketWithBufferFreeCallback(v18, a3, a4, 0, 0, (CMBlockBufferRef **)&v63) & 0x80000000) != 0)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __VTP_SetIDSReadHandler_block_invoke_cold_2();
        }
      }
      goto LABEL_95;
    }
    double v21 = micro();
    uint64_t v22 = v63;
    *((double *)v63 + 23) = v21;
    if ((a5 & 0xFF00000000) != 0) {
      v22[519] = BYTE4(a5);
    }
    unint64_t v71 = 0xAAAAAAAAAAAAAAAALL;
    *(void *)&long long v23 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
    long long v69 = v23;
    long long v70 = v23;
    long long v67 = v23;
    long long v68 = v23;
    *(_OWORD *)&buf[16] = v23;
    *(_OWORD *)&buf[32] = v23;
    *(_OWORD *)buf = v23;
    VCSDInfoConstructWithDatagramChannel((uint64_t)a2, a5, a6, 0, (uint64_t)buf);
    VTP_SetConnectionFlagsForPacket(v19, 0, (uint64_t)v63, (int *)buf);
    uint64_t v24 = v63;
    v65 = 0;
    if (!a7) {
      goto LABEL_77;
    }
    int v25 = *(_DWORD *)a7;
    if (!*(_DWORD *)a7)
    {
LABEL_66:
      if (*(unsigned char *)(v19 + 5897))
      {
        if (v24[408])
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v45 = VRTraceErrorLogLevelToCSTR();
            v46 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              int v47 = v24[408];
              int v48 = *((unsigned __int16 *)v24 + 192);
              *(_DWORD *)v72 = 136316162;
              uint64_t v73 = v45;
              __int16 v74 = 2080;
              v75 = "_VTP_ProcessDatagramOptions";
              __int16 v76 = 1024;
              int v77 = 6264;
              __int16 v78 = 1024;
              *(_DWORD *)v79 = v47;
              *(_WORD *)&v79[4] = 1024;
              *(_DWORD *)&v79[6] = v48;
              _os_log_impl(&dword_1E1EA4000, v46, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d datagram readHandler received packet with numOfStreamIDs=%d and streamID[0]=%u", v72, 0x28u);
            }
          }
        }
      }
      double v49 = *((double *)a7 + 8);
      if (v49 > 0.0)
      {
        double v50 = v21 - v49;
        if (*(double *)(v19 + 21872) > v50) {
          double v50 = *(double *)(v19 + 21872);
        }
        *(double *)(v19 + 21872) = v50;
        int v52 = *(_DWORD *)(v19 + 21864);
        unsigned int v51 = *(_DWORD *)(v19 + 21868);
        if (v51 <= v52 + 1) {
          unsigned int v51 = v52 + 1;
        }
        *(_DWORD *)(v19 + 21868) = v51;
      }
LABEL_77:
      _VTP_ReleasePacket(v19, (void **)&v65);
      if ((VTP_ProcessPacketType(v19, 0, -2, (uint64_t)v63) & 0x80000000) == 0)
      {
        v53 = v63;
        int v54 = *(_DWORD *)v63;
        if (*(_DWORD *)v63 == 0x10000) {
          goto LABEL_81;
        }
        if (v54 == 48)
        {
LABEL_82:
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 21960), 1uLL, memory_order_relaxed);
          goto LABEL_83;
        }
        if (v54 == 2)
        {
LABEL_81:
          long long v55 = *(_OWORD *)&buf[16];
          *(_OWORD *)(v63 + 232) = *(_OWORD *)buf;
          *(_OWORD *)(v53 + 248) = v55;
          long long v56 = v69;
          *(_OWORD *)(v53 + 296) = v68;
          *(_OWORD *)(v53 + 312) = v56;
          *(_OWORD *)(v53 + 328) = v70;
          long long v57 = v67;
          *(_OWORD *)(v53 + 264) = *(_OWORD *)&buf[32];
          *((void *)v53 + 43) = v71;
          *(_OWORD *)(v53 + 280) = v57;
          if (v54 == 48) {
            goto LABEL_82;
          }
        }
LABEL_83:
        int v58 = *((_DWORD *)v53 + 54);
        pthread_rwlock_rdlock((pthread_rwlock_t *)(v19 + 21648));
        _VTP_ReportIDSOnTheWireBytesLocked(v19, v58, a4, (uint64_t)a7, 0);
        pthread_rwlock_unlock((pthread_rwlock_t *)(v19 + 21648));
        unsigned int v59 = *((_DWORD *)v63 + 56);
        VTP_UpdateReceivedBytes(*((_DWORD *)v63 + 54), a4, (*(_DWORD *)v63 & 0xF0) != 0, v63[223], (uint64_t)buf, v63[413], v63[408], v63[412] != 0);
        int v60 = [a2 dataPath];
        if (v60)
        {
          if (v60 == 1)
          {
            _VTP_ProcessPacketForDirectIDSDataPath(v19, v63, v64);
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            uint64_t v61 = VRTraceErrorLogLevelToCSTR();
            v62 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __VTP_SetIDSReadHandler_block_invoke_cold_4(v61, a2, v62);
            }
          }
        }
        else
        {
          _VTP_ProcessPacketForSharedIDSDataPath(v19, (uint64_t)v63, v64);
        }
        _VTP_HealthPrint(v19, v20, v59, 0, 0);
        goto LABEL_95;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __VTP_SetIDSReadHandler_block_invoke_cold_3();
        }
      }
LABEL_89:
      _VTP_ReleasePacket(v19, (void **)&v63);
      _VTP_ReleasePacket(v19, (void **)&v64);
LABEL_95:
      CheckOutHandleDebug();
      return;
    }
    v63[376] = 1;
    if (v25)
    {
      v24[414] = 1;
      *((void *)v24 + 52) = *((void *)a7 + 1);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        uint64_t v27 = *MEMORY[0x1E4F47A50];
        int v28 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v29 = *((void *)a7 + 1);
            *(_DWORD *)v72 = 136315906;
            uint64_t v73 = v26;
            __int16 v74 = 2080;
            v75 = "_VTP_ProcessDatagramOptions";
            __int16 v76 = 1024;
            int v77 = 6198;
            __int16 v78 = 2048;
            *(void *)v79 = v29;
            _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d datagram readHandler received packet from participantID=%llu", v72, 0x26u);
          }
        }
        else if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          __VTP_SetIDSReadHandler_block_invoke_cold_8();
        }
      }
    }
    int v30 = *(_DWORD *)a7;
    if ((*(_DWORD *)a7 & 0x10) != 0) {
      *((_WORD *)v24 + 205) = *((_WORD *)a7 + 8);
    }
    if ((v30 & 2) != 0)
    {
      LODWORD(v31) = (char)a7[19];
      v24[408] = a7[19];
      if ((int)v31 >= 1)
      {
        uint64_t v31 = v31;
        uint64_t v32 = v24 + 384;
        char v33 = (__int16 *)(a7 + 20);
        do
        {
          __int16 v34 = *v33++;
          *v32++ = v34;
          --v31;
        }
        while (v31);
      }
    }
    if ((v30 & 8) != 0)
    {
      v24[412] = a7[18];
      if ((v30 & 4) == 0)
      {
LABEL_41:
        if ((v30 & 0x20) == 0) {
          goto LABEL_55;
        }
        goto LABEL_45;
      }
    }
    else if ((v30 & 4) == 0)
    {
      goto LABEL_41;
    }
    v24[413] = 1;
    if ((v30 & 0x20) == 0)
    {
LABEL_55:
      int v40 = *(_DWORD *)a7;
      if ((*(_DWORD *)a7 & 0x10000) != 0) {
        v24[460] = a7[112];
      }
      if ((v40 & 0x40) != 0 || (double v41 = *(double *)(v19 + 22008), v41 > 0.0) && v21 - v41 > 0.2)
      {
        *(double *)(v19 + 22008) = v21;
        if ((_VTP_AllocatePacketWithBufferFreeCallback(v19, 0, 0, 0, 0, (CMBlockBufferRef **)&v65) & 0x80000000) != 0)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __VTP_SetIDSReadHandler_block_invoke_cold_6();
            }
          }
          _VTP_ReleasePacket(v19, (void **)&v65);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              __VTP_SetIDSReadHandler_block_invoke_cold_5();
            }
          }
          goto LABEL_89;
        }
        long long v42 = v65;
        *((_DWORD *)v65 + 57) = *((_DWORD *)v24 + 57);
        *((_DWORD *)v42 + 54) = *((_DWORD *)v24 + 54);
        int v43 = *((_DWORD *)v24 + 1);
        *(_DWORD *)long long v42 = 0x20000;
        *((_DWORD *)v42 + 1) = v43;
        *((void *)v42 + 23) = *((void *)v24 + 23);
        if ((*a7 & 0x40) != 0)
        {
          ++*(_DWORD *)(v19 + 22016);
          v42[426] = 1;
          *((_WORD *)v42 + 214) = *((_WORD *)a7 + 23);
          uint64_t v44 = *((void *)a7 + 6);
          *((_WORD *)v42 + 219) = *((_WORD *)a7 + 28);
          *(void *)(v42 + 430) = v44;
        }
        else
        {
          v42[426] = 0;
        }
        v64 = v42;
        v65 = 0;
      }
      v24[441] = a7[80];
      goto LABEL_66;
    }
LABEL_45:
    v24[424] = 1;
    int v35 = *((_DWORD *)v24 + 54);
    int v36 = a7[44];
    uint64_t v37 = CheckInHandleDebug();
    if (v37)
    {
      uint64_t v38 = v37;
      if (*(unsigned __int8 *)(v37 + 21644) != v36)
      {
        *(unsigned char *)(v37 + 21644) = v36;
        if (v35)
        {
          pthread_rwlock_rdlock((pthread_rwlock_t *)(v37 + 21648));
          int v39 = VTP_getConnectionManagerForCallID(v38, v35);
          VCConnectionManager_SynchronizeParticipantGenerationCounter((uint64_t)v39);
          pthread_rwlock_unlock((pthread_rwlock_t *)(v38 + 21648));
        }
      }
      CheckOutHandleDebug();
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __VTP_SetIDSReadHandler_block_invoke_cold_7();
        }
      }
      *__error() = 13;
    }
    goto LABEL_55;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __VTP_SetIDSReadHandler_block_invoke_cold_1();
    }
  }
}

void __VTP_ScheduleReceiveForNWConnection_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed due to invalid handle", v2, v3, v4, v5, v6);
}

void ___VTP_HandleReceiveForNWConnection_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Ignore packets with offset", v2, v3, v4, v5, v6);
}

void ___VTP_HandleReceiveForNWConnection_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VTP_HandleReceiveForNWConnection_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  WORD1(v5) = 2048;
  HIDWORD(v5) = v0;
  OUTLINED_FUNCTION_4_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed. Datagram size=%lu", v2, *(const char **)v3, (unint64_t)"_VTP_HandleReceiveForNWConnection_block_invoke" >> 16, v4, v5);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6_3();
  OUTLINED_FUNCTION_5_2(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VCDatagramChannelReadHandler failed due to invalid handle.", v2, v3, v4, v5, v6);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed. Datagram size=%d", v2, *(const char **)v3, (unint64_t)"VTP_SetIDSReadHandler_block_invoke" >> 16, v4, v5);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_3()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d Process packet type failed with error=0x%08X", v1);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_4(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [a2 dataPath];
  int v8 = 136315906;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  int v11 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  int v12 = 6427;
  __int16 v13 = v5;
  int v14 = v6;
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, a3, v7, " [%s] %s:%d Invalid data path value=%d. Ignoring the packet", (uint8_t *)&v8);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_5()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v2 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5_5(&dword_1E1EA4000, v0, (uint64_t)v0, " [%s] %s:%d _VTP_ProcessDatagramOptions failed with error=0x%08X", v1);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_6()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VTP_ProcessDatagramOptions";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: VTP packet allocation failed, result=%d", v2, *(const char **)v3, (unint64_t)"_VTP_ProcessDatagramOptions" >> 16, v4, v5);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_8_3();
  OUTLINED_FUNCTION_13_7(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VTP/VTransport.m:%d: %s: failed due to invalid handle.", v2, v3, v4, v5, v6);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_8()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_5_4();
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d datagram readHandler received packet from participantID=%llu", v1, 0x26u);
}

void __VTP_SetIDSReadHandler_block_invoke_cold_9()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "VTP_SetIDSReadHandler_block_invoke";
  OUTLINED_FUNCTION_3();
  int v4 = 6350;
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Datagram channel [%p] returned empty datagram", v2, 0x26u);
}

@end