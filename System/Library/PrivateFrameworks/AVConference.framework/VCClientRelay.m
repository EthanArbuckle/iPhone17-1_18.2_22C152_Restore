@interface VCClientRelay
- (BOOL)relayIDSPacket;
- (BOOL)relayVTPPacket;
- (BOOL)stopVTPReceiveThread;
- (VCClientRelay)initWithIDSSocket:(int)a3;
- (int)setupVTPSocket;
- (int)startRelay;
- (int)stopRelay;
- (void)dealloc;
- (void)relayIDSPacket;
- (void)relayVTPPacket;
- (void)setConnectionResult:(tagCONNRESULT *)a3;
- (void)setupVTPSocket;
- (void)startRelay;
@end

@implementation VCClientRelay

- (VCClientRelay)initWithIDSSocket:(int)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCClientRelay;
  result = [(VCClientRelay *)&v5 init];
  if (result)
  {
    result->_vtpSocket = -1;
    result->_vtpReceiveTID = 0;
    if (a3 != -1)
    {
      result->_idsSocket = a3;
      return result;
    }
  }
  else
  {
    close(a3);
  }
  return 0;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int idsSocket = self->_idsSocket;
  if (idsSocket != -1) {
    close(idsSocket);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCClientRelay;
  [(VCClientRelay *)&v4 dealloc];
}

- (void)setConnectionResult:(tagCONNRESULT *)a3
{
  if (a3)
  {
    memcpy(&self->_connectionResult, a3, sizeof(self->_connectionResult));
    self->_isConnectionResultSet = 1;
  }
}

- (int)setupVTPSocket
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v40 = v4;
        __int16 v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        __int16 v43 = 1024;
        int v44 = 69;
        uint64_t v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCClientRelay *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v40 = v9;
        __int16 v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        __int16 v43 = 1024;
        int v44 = 69;
        __int16 v45 = 2112;
        *(void *)v46 = v3;
        *(_WORD *)&v46[8] = 2048;
        *(void *)&v46[10] = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v36 = (addrinfo *)0xAAAAAAAAAAAAAAAALL;
  *(void *)&long long v11 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v49[1] = v11;
  v49[2] = v11;
  v49[0] = v11;
  memset(v38, 170, 6);
  if (self->_isConnectionResultSet)
  {
    BOOL v12 = (self->_connectionResult.mbLocal.iFlags & 1) == 0;
    memset(&v37.ai_socktype, 0, 32);
    if (v12) {
      int ai_family = 2;
    }
    else {
      int ai_family = 30;
    }
    v37.ai_next = 0;
    v37.ai_flags = 1;
    v37.int ai_family = ai_family;
    v37.ai_socktype = 2;
    IPToString();
    __sprintf_chk(v38, 0, 6uLL, "%u", self->_connectionResult.mbLocal.wPort);
    int v14 = getaddrinfo((const char *)v49, v38, &v37, &v36);
    if (v14 || (v15 = v36) == 0)
    {
      unsigned int v17 = v14 | 0xB0270000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316674;
          uint64_t v40 = v20;
          __int16 v41 = 2080;
          v42 = "-[VCClientRelay setupVTPSocket]";
          __int16 v43 = 1024;
          int v44 = 96;
          __int16 v45 = 1024;
          *(_DWORD *)v46 = 96;
          *(_WORD *)&v46[4] = 2080;
          *(void *)&v46[6] = v49;
          *(_WORD *)&v46[14] = 2080;
          *(void *)&v46[16] = v38;
          __int16 v47 = 1024;
          unsigned int v48 = v17;
          v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRela"
                "y.m:%d: getaddrinfo(%s,%s) failed(%08X)";
LABEL_28:
          v23 = v21;
          uint32_t v24 = 60;
LABEL_29:
          _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, v22, buf, v24);
        }
      }
    }
    else
    {
      v16 = v36;
      while (v16->ai_family != ai_family)
      {
        v16 = v16->ai_next;
        if (!v16)
        {
          int ai_family = v36->ai_family;
          goto LABEL_31;
        }
      }
      v15 = v16;
LABEL_31:
      int v25 = VTP_Socket(ai_family, v15->ai_socktype, v15->ai_protocol);
      self->_int vtpSocket = v25;
      if (v25 == -1)
      {
        unsigned int v17 = *__error() | 0xC0270000;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCClientRelay setupVTPSocket]();
          }
        }
        freeaddrinfo(v36);
        goto LABEL_48;
      }
      VTP_SetSocketMode(v25, 2);
      int v26 = VTP_Bind(self->_vtpSocket, (uint64_t)v15->ai_addr, v15->ai_addrlen);
      freeaddrinfo(v36);
      if (v26 != -1)
      {
        char iFlags = self->_connectionResult.mbDst.iFlags;
        memset(&v37, 0, sizeof(v37));
        if (iFlags) {
          int v28 = 30;
        }
        else {
          int v28 = 2;
        }
        v37.int ai_family = v28;
        v37.ai_socktype = 2;
        IPToString();
        __sprintf_chk(v38, 0, 6uLL, "%u", self->_connectionResult.mbDst.wPort);
        int v29 = getaddrinfo((const char *)v49, v38, &v37, &v36);
        if (v29 != -1)
        {
          v30 = v36;
          if (v36)
          {
            memcpy(&self->_vtpDestination, v36->ai_addr, v36->ai_addrlen);
            self->_vtpDestinationLength = v30->ai_addrlen;
            freeaddrinfo(v30);
            return 0;
          }
        }
        unsigned int v17 = v29 | 0xB0270000;
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          goto LABEL_48;
        }
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        v21 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          goto LABEL_48;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v40 = v33;
        __int16 v41 = 2080;
        v42 = "-[VCClientRelay setupVTPSocket]";
        __int16 v43 = 1024;
        int v44 = 137;
        __int16 v45 = 1024;
        *(_DWORD *)v46 = 137;
        *(_WORD *)&v46[4] = 2080;
        *(void *)&v46[6] = v49;
        *(_WORD *)&v46[14] = 2080;
        *(void *)&v46[16] = v38;
        __int16 v47 = 1024;
        unsigned int v48 = v17;
        v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay."
              "m:%d: getaddrinfo(%s,%s) failed(%08X)";
        goto LABEL_28;
      }
      unsigned int v17 = *__error() | 0xC0270000;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v40 = v31;
          __int16 v41 = 2080;
          v42 = "-[VCClientRelay setupVTPSocket]";
          __int16 v43 = 1024;
          int v44 = 124;
          __int16 v45 = 1024;
          *(_DWORD *)v46 = 124;
          *(_WORD *)&v46[4] = 2080;
          *(void *)&v46[6] = v38;
          *(_WORD *)&v46[14] = 1024;
          *(_DWORD *)&v46[16] = v17;
          v22 = " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRela"
                "y.m:%d: bind on %s failed(%08X)";
          v23 = v32;
          uint32_t v24 = 50;
          goto LABEL_29;
        }
      }
    }
LABEL_48:
    int vtpSocket = self->_vtpSocket;
    if (vtpSocket != -1) {
      VTP_Close(vtpSocket);
    }
    return v17;
  }
  unsigned int v17 = -2144927727;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCClientRelay *)v18 setupVTPSocket];
    }
  }
  return v17;
}

- (int)startRelay
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v22 = v4;
        __int16 v23 = 2080;
        uint32_t v24 = "-[VCClientRelay startRelay]";
        __int16 v25 = 1024;
        int v26 = 157;
        uint64_t v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCClientRelay *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v22 = v9;
        __int16 v23 = 2080;
        uint32_t v24 = "-[VCClientRelay startRelay]";
        __int16 v25 = 1024;
        int v26 = 157;
        __int16 v27 = 2112;
        int v28 = v3;
        __int16 v29 = 2048;
        v30 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  int v11 = [(VCClientRelay *)self setupVTPSocket];
  if (v11 < 0)
  {
    unsigned int v14 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCClientRelay startRelay]();
      }
    }
  }
  else
  {
    self->_stopVTPReceiveThread = 0;
    values = @"com.apple.videoconference.VCClientRelayVTPReceiveProc";
    CFDictionaryRef v12 = CFDictionaryCreate(0, MEMORY[0x1E4F21EA8], (const void **)&values, 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    int v13 = FigThreadCreate();
    if (v12) {
      CFRelease(v12);
    }
    if (v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCClientRelay startRelay].cold.5();
        }
      }
      unsigned int v14 = v13 | 0xA0270000;
    }
    else
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(58);
      v16 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCClientRelay.idsReadQueue", 0, CustomRootQueue);
      self->_idsReadQueue = v16;
      if (v16)
      {
        unsigned int v17 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14478], self->_idsSocket, 0, (dispatch_queue_t)v16);
        self->_idsReadSource = v17;
        if (v17)
        {
          v19[0] = MEMORY[0x1E4F143A8];
          v19[1] = 3221225472;
          v19[2] = __27__VCClientRelay_startRelay__block_invoke;
          v19[3] = &unk_1E6DB3DC8;
          v19[4] = self;
          dispatch_source_set_event_handler((dispatch_source_t)v17, v19);
          dispatch_resume((dispatch_object_t)self->_idsReadSource);
          if (!VTP_SetClientRelayVFD(self->_connectionResult.dwCallID, self->_vtpSocket)) {
            return 0;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCClientRelay startRelay].cold.4();
            }
          }
          unsigned int v14 = *__error() | 0xC0270000;
        }
        else
        {
          unsigned int v14 = -2144927740;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCClientRelay startRelay]();
            }
          }
        }
      }
      else
      {
        unsigned int v14 = -2144927740;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCClientRelay startRelay]();
          }
        }
      }
    }
  }
  [(VCClientRelay *)self stopRelay];
  return v14;
}

uint64_t __27__VCClientRelay_startRelay__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) relayIDSPacket];
}

- (int)stopRelay
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((VCClientRelay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      uint64_t v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 136315650;
        *(void *)&v16[4] = v4;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCClientRelay stopRelay]";
        __int16 v19 = 1024;
        int v20 = 218;
        uint64_t v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, v16, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCClientRelay *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v16 = 136316162;
        *(void *)&v16[4] = v9;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCClientRelay stopRelay]";
        __int16 v19 = 1024;
        int v20 = 218;
        __int16 v21 = 2112;
        uint64_t v22 = v3;
        __int16 v23 = 2048;
        uint32_t v24 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  *(void *)v16 = 0xAAAAAAAAAAAAAAAALL;
  if (self->_isConnectionResultSet) {
    VTP_SetClientRelayVFD(self->_connectionResult.dwCallID, -1);
  }
  int vtpSocket = self->_vtpSocket;
  if (vtpSocket != -1)
  {
    VTP_Close(vtpSocket);
    self->_int vtpSocket = -1;
  }
  self->_stopVTPReceiveThread = 1;
  if (self->_vtpReceiveTID)
  {
    FigThreadJoin();
    self->_vtpReceiveTID = 0;
  }
  idsReadSource = self->_idsReadSource;
  if (idsReadSource)
  {
    dispatch_source_cancel(idsReadSource);
    int v13 = self->_idsReadSource;
    if (v13)
    {
      dispatch_release(v13);
      self->_idsReadSource = 0;
    }
  }
  idsReadQueue = self->_idsReadQueue;
  if (idsReadQueue)
  {
    dispatch_release(idsReadQueue);
    self->_idsReadQueue = 0;
  }
  return 0;
}

- (BOOL)relayIDSPacket
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  memset(__b, 170, sizeof(__b));
  int v3 = recv(self->_idsSocket, __b, 0x5C0uLL, 0);
  if (v3 == -1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCClientRelay relayIDSPacket]();
      }
    }
    return 0;
  }
  else
  {
    uint64_t v46 = 0;
    memset(v45, 0, sizeof(v45));
    int v4 = VTP_Sendto(self->_vtpSocket, __b, v3, 0, (uint64_t)&self->_vtpDestination, self->_vtpDestinationLength, (int *)v45);
    BOOL v5 = v4 == v3;
    if (v4 != v3)
    {
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCClientRelay relayIDSPacket]();
        }
      }
      return v5;
    }
    if ((VCClientRelay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        return v5;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      v10 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        int vtpSocket = self->_vtpSocket;
        int idsSocket = self->_idsSocket;
        int v29 = 136316674;
        uint64_t v30 = v8;
        __int16 v31 = 2080;
        v32 = "-[VCClientRelay relayIDSPacket]";
        __int16 v33 = 1024;
        int v34 = 265;
        __int16 v35 = 1024;
        *(_DWORD *)v36 = idsSocket;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = v3;
        LOWORD(v37) = 1024;
        *(_DWORD *)((char *)&v37 + 2) = vtpSocket;
        HIWORD(v37) = 1024;
        *(_DWORD *)v38 = v3;
        int v13 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
        unsigned int v14 = v9;
        uint32_t v15 = 52;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v29, v15);
        return v5;
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        return v5;
      }
      int v28 = self->_vtpSocket;
      int v27 = self->_idsSocket;
      int v29 = 136316674;
      uint64_t v30 = v8;
      __int16 v31 = 2080;
      v32 = "-[VCClientRelay relayIDSPacket]";
      __int16 v33 = 1024;
      int v34 = 265;
      __int16 v35 = 1024;
      *(_DWORD *)v36 = v27;
      *(_WORD *)&v36[4] = 1024;
      *(_DWORD *)&v36[6] = v3;
      LOWORD(v37) = 1024;
      *(_DWORD *)((char *)&v37 + 2) = v28;
      HIWORD(v37) = 1024;
      *(_DWORD *)v38 = v3;
      __int16 v23 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
      uint32_t v24 = v9;
      uint32_t v25 = 52;
LABEL_29:
      _os_log_debug_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEBUG, v23, (uint8_t *)&v29, v25);
      return v5;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCClientRelay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT)) {
          return v5;
        }
        int v20 = self->_vtpSocket;
        int v19 = self->_idsSocket;
        int v29 = 136317186;
        uint64_t v30 = v16;
        __int16 v31 = 2080;
        v32 = "-[VCClientRelay relayIDSPacket]";
        __int16 v33 = 1024;
        int v34 = 265;
        __int16 v35 = 2112;
        *(void *)v36 = v6;
        *(_WORD *)&v36[8] = 2048;
        addrinfo v37 = self;
        *(_WORD *)v38 = 1024;
        *(_DWORD *)&v38[2] = v19;
        __int16 v39 = 1024;
        int v40 = v3;
        __int16 v41 = 1024;
        int v42 = v20;
        __int16 v43 = 1024;
        int v44 = v3;
        int v13 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
        unsigned int v14 = v17;
        uint32_t v15 = 72;
        goto LABEL_23;
      }
      if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        return v5;
      }
      int v22 = self->_vtpSocket;
      int v21 = self->_idsSocket;
      int v29 = 136317186;
      uint64_t v30 = v16;
      __int16 v31 = 2080;
      v32 = "-[VCClientRelay relayIDSPacket]";
      __int16 v33 = 1024;
      int v34 = 265;
      __int16 v35 = 2112;
      *(void *)v36 = v6;
      *(_WORD *)&v36[8] = 2048;
      addrinfo v37 = self;
      *(_WORD *)v38 = 1024;
      *(_DWORD *)&v38[2] = v21;
      __int16 v39 = 1024;
      int v40 = v3;
      __int16 v41 = 1024;
      int v42 = v22;
      __int16 v43 = 1024;
      int v44 = v3;
      __int16 v23 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
      uint32_t v24 = v17;
      uint32_t v25 = 72;
      goto LABEL_29;
    }
  }
  return v5;
}

- (BOOL)relayVTPPacket
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  __int16 v33 = 0;
  memset(v50, 0, sizeof(v50));
  int vtpSocket = self->_vtpSocket;
  if (__darwin_check_fd_set_overflow(vtpSocket, v50, 0)) {
    *(_DWORD *)((char *)v50 + (((unint64_t)vtpSocket >> 3) & 0x1FFFFFFFFFFFFFFCLL)) |= 1 << vtpSocket;
  }
  int v4 = VTP_Select((self->_vtpSocket + 1), v50, 0, 0, 0);
  if (v4 != -1)
  {
    if (VTP_Recvfrom(self->_vtpSocket, &v33))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCClientRelay relayVTPPacket]();
        }
      }
      return v4 != -1;
    }
    ssize_t v5 = send(self->_idsSocket, *((const void **)v33 + 66), *((void *)v33 + 65), 0);
    int v6 = v5;
    if (v5 != *((void *)v33 + 65) && (int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCClientRelay relayVTPPacket]();
      }
    }
    if ((VCClientRelay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_31;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      uint64_t v9 = *MEMORY[0x1E4F47A50];
      v10 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v11 = *((void *)v33 + 65);
          int v12 = self->_vtpSocket;
          int idsSocket = self->_idsSocket;
          *(_DWORD *)buf = 136316674;
          uint64_t v35 = v8;
          __int16 v36 = 2080;
          addrinfo v37 = "-[VCClientRelay relayVTPPacket]";
          __int16 v38 = 1024;
          int v39 = 297;
          __int16 v40 = 1024;
          *(_DWORD *)__int16 v41 = v12;
          *(_WORD *)&v41[4] = 1024;
          *(_DWORD *)&v41[6] = v11;
          LOWORD(v42) = 1024;
          *(_DWORD *)((char *)&v42 + 2) = idsSocket;
          HIWORD(v42) = 1024;
          *(_DWORD *)__int16 v43 = v6;
          unsigned int v14 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
          uint32_t v15 = v9;
          uint32_t v16 = 52;
LABEL_27:
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
        }
LABEL_31:
        VTP_ReleasePacket(&v33);
        return v4 != -1;
      }
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      uint64_t v30 = *((void *)v33 + 65);
      int v31 = self->_vtpSocket;
      int v32 = self->_idsSocket;
      *(_DWORD *)buf = 136316674;
      uint64_t v35 = v8;
      __int16 v36 = 2080;
      addrinfo v37 = "-[VCClientRelay relayVTPPacket]";
      __int16 v38 = 1024;
      int v39 = 297;
      __int16 v40 = 1024;
      *(_DWORD *)__int16 v41 = v31;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = v30;
      LOWORD(v42) = 1024;
      *(_DWORD *)((char *)&v42 + 2) = v32;
      HIWORD(v42) = 1024;
      *(_DWORD *)__int16 v43 = v6;
      int v26 = " [%s] %s:%d recv(%d) = %d, sent(%d) = (%d)";
      int v27 = v9;
      uint32_t v28 = 52;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCClientRelay *)self performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_31;
      }
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint64_t v18 = *MEMORY[0x1E4F47A50];
      int v19 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = *((void *)v33 + 65);
          int v21 = self->_vtpSocket;
          int v22 = self->_idsSocket;
          *(_DWORD *)buf = 136317186;
          uint64_t v35 = v17;
          __int16 v36 = 2080;
          addrinfo v37 = "-[VCClientRelay relayVTPPacket]";
          __int16 v38 = 1024;
          int v39 = 297;
          __int16 v40 = 2112;
          *(void *)__int16 v41 = v7;
          *(_WORD *)&v41[8] = 2048;
          int v42 = self;
          *(_WORD *)__int16 v43 = 1024;
          *(_DWORD *)&v43[2] = v21;
          __int16 v44 = 1024;
          int v45 = v20;
          __int16 v46 = 1024;
          int v47 = v22;
          __int16 v48 = 1024;
          int v49 = v6;
          unsigned int v14 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
          uint32_t v15 = v18;
          uint32_t v16 = 72;
          goto LABEL_27;
        }
        goto LABEL_31;
      }
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_31;
      }
      uint64_t v23 = *((void *)v33 + 65);
      int v24 = self->_vtpSocket;
      int v25 = self->_idsSocket;
      *(_DWORD *)buf = 136317186;
      uint64_t v35 = v17;
      __int16 v36 = 2080;
      addrinfo v37 = "-[VCClientRelay relayVTPPacket]";
      __int16 v38 = 1024;
      int v39 = 297;
      __int16 v40 = 2112;
      *(void *)__int16 v41 = v7;
      *(_WORD *)&v41[8] = 2048;
      int v42 = self;
      *(_WORD *)__int16 v43 = 1024;
      *(_DWORD *)&v43[2] = v24;
      __int16 v44 = 1024;
      int v45 = v23;
      __int16 v46 = 1024;
      int v47 = v25;
      __int16 v48 = 1024;
      int v49 = v6;
      int v26 = " [%s] %s:%d %@(%p) recv(%d) = %d, sent(%d) = (%d)";
      int v27 = v18;
      uint32_t v28 = 72;
    }
    _os_log_debug_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEBUG, v26, buf, v28);
    goto LABEL_31;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCClientRelay relayVTPPacket]();
    }
  }
  return v4 != -1;
}

- (BOOL)stopVTPReceiveThread
{
  return self->_stopVTPReceiveThread;
}

- (void)setupVTPSocket
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: socket failed(%08X)", v2, v3, v4, v5, v6);
}

- (void)startRelay
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3_4();
  OUTLINED_FUNCTION_2_3(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: VTPRecvProcVCCR thread create failed(%d)", v2, v3, v4, v5, v6);
}

- (void)relayIDSPacket
{
  __error();
  OUTLINED_FUNCTION_27_0();
  OUTLINED_FUNCTION_16_0();
  OUTLINED_FUNCTION_9_12(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: relayIDSPacket: VTP_Sendto: sentBytes = %d, errno = %d", v2, v3, v4, v5, 2u);
}

- (void)relayVTPPacket
{
  __error();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_6_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d /Library/Caches/com.apple.xbs/Sources/AVConference/AVConference.subproj/Sources/VCClientRelay.m:%d: VCClientRelayVTPReceiveProc: VTP_Select failed(%d)", v2, v3, v4, v5, v6);
}

@end