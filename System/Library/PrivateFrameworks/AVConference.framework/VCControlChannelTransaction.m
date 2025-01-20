@interface VCControlChannelTransaction
+ (BOOL)sendUnreliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 transactionID:(id)a6 transactionDelegate:(id)a7 withOptions:(id)a8;
- (BOOL)sendReliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 timeout:(id)a6 useFastRetries:(BOOL)a7 withOptions:(id)a8;
- (VCControlChannelTransaction)initWithTransportSessionID:(unsigned int)a3 participantID:(id)a4 transactionID:(unint64_t)a5 transactionDelegate:(id)a6;
- (float)retryTimeoutForRetryAttempt:(unsigned int)a3 usingFastRetries:(BOOL)a4;
- (unsigned)retryCountUsingFastRetries:(BOOL)a3;
- (void)confirmedTransactionByParticipantID:(id)a3 sessionID:(unsigned int)a4;
- (void)dealloc;
- (void)flushTransaction;
@end

@implementation VCControlChannelTransaction

- (VCControlChannelTransaction)initWithTransportSessionID:(unsigned int)a3 participantID:(id)a4 transactionID:(unint64_t)a5 transactionDelegate:(id)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)VCControlChannelTransaction;
  v10 = [(VCObject *)&v34 init];
  v11 = v10;
  if (!v10) {
    return v11;
  }
  v10->_unsigned int sessionID = a3;
  v10->_participantID = (NSNumber *)[a4 copy];
  v11->_transactionID = a5;
  v11->_weakTransactionDelegate = (VCControlChannelTransactionDelegate *)objc_storeWeak((id *)&v11->_weakTransactionDelegate, a6);
  pthread_mutex_init(&v11->_transactionLock, 0);
  pthread_cond_init(&v11->_transactionDone, 0);
  v11->_isConfirmed = 0;
  if ((VCControlChannelTransaction *)objc_opt_class() != v11)
  {
    if (objc_opt_respondsToSelector()) {
      v12 = (__CFString *)[(VCControlChannelTransaction *)v11 performSelector:sel_logPrefix];
    }
    else {
      v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      return v11;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    v23 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sessionID = v11->_sessionID;
        participantID = v11->_participantID;
        *(_DWORD *)buf = 136316674;
        uint64_t v36 = v21;
        __int16 v37 = 2080;
        v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
        __int16 v39 = 1024;
        int v40 = 55;
        __int16 v41 = 2112;
        *(void *)v42 = v12;
        *(_WORD *)&v42[8] = 2048;
        *(void *)&v42[10] = v11;
        __int16 v43 = 1024;
        unsigned int v44 = sessionID;
        __int16 v45 = 2112;
        v46 = participantID;
        v18 = " [%s] %s:%d %@(%p) Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
        v19 = v22;
        uint32_t v20 = 64;
        goto LABEL_14;
      }
      return v11;
    }
    if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
      return v11;
    }
    unsigned int v26 = v11->_sessionID;
    v27 = v11->_participantID;
    *(_DWORD *)buf = 136316674;
    uint64_t v36 = v21;
    __int16 v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    __int16 v39 = 1024;
    int v40 = 55;
    __int16 v41 = 2112;
    *(void *)v42 = v12;
    *(_WORD *)&v42[8] = 2048;
    *(void *)&v42[10] = v11;
    __int16 v43 = 1024;
    unsigned int v44 = v26;
    __int16 v45 = 2112;
    v46 = v27;
    v28 = " [%s] %s:%d %@(%p) Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v29 = v22;
    uint32_t v30 = 64;
LABEL_20:
    _os_log_debug_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEBUG, v28, buf, v30);
    return v11;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    return v11;
  }
  uint64_t v13 = VRTraceErrorLogLevelToCSTR();
  v14 = *MEMORY[0x1E4F47A50];
  v15 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      return v11;
    }
    unsigned int v32 = v11->_sessionID;
    v33 = v11->_participantID;
    *(_DWORD *)buf = 136316162;
    uint64_t v36 = v13;
    __int16 v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    __int16 v39 = 1024;
    int v40 = 55;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v32;
    *(_WORD *)&v42[4] = 2112;
    *(void *)&v42[6] = v33;
    v28 = " [%s] %s:%d Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v29 = v14;
    uint32_t v30 = 44;
    goto LABEL_20;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v16 = v11->_sessionID;
    v17 = v11->_participantID;
    *(_DWORD *)buf = 136316162;
    uint64_t v36 = v13;
    __int16 v37 = 2080;
    v38 = "-[VCControlChannelTransaction initWithTransportSessionID:participantID:transactionID:transactionDelegate:]";
    __int16 v39 = 1024;
    int v40 = 55;
    __int16 v41 = 1024;
    *(_DWORD *)v42 = v16;
    *(_WORD *)&v42[4] = 2112;
    *(void *)&v42[6] = v17;
    v18 = " [%s] %s:%d Created VCControlChannelTransaction object for sessionID='%d', participantID='%@'";
    v19 = v14;
    uint32_t v20 = 44;
LABEL_14:
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
  }
  return v11;
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = *(_DWORD *)(a2 + 168);
  uint64_t v4 = *(void *)(a2 + 176);
  int v5 = 136316162;
  uint64_t v6 = a1;
  __int16 v7 = 2080;
  v8 = "-[VCControlChannelTransaction dealloc]";
  __int16 v9 = 1024;
  int v10 = 62;
  __int16 v11 = 1024;
  int v12 = v3;
  __int16 v13 = 2112;
  uint64_t v14 = v4;
  _os_log_debug_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Dealloc VCControlChannelTransaction object for sessionID='%d', participantID='%@'", (uint8_t *)&v5, 0x2Cu);
}

- (void)flushTransaction
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  p_transactionLock = &self->_transactionLock;
  pthread_mutex_lock(&self->_transactionLock);
  self->_isFlushed = 1;
  pthread_cond_signal(&self->_transactionDone);
  pthread_mutex_unlock(p_transactionLock);
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v5 = VRTraceErrorLogLevelToCSTR();
      uint64_t v6 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sessionID = self->_sessionID;
        participantID = self->_participantID;
        int v16 = 136316162;
        uint64_t v17 = v5;
        __int16 v18 = 2080;
        v19 = "-[VCControlChannelTransaction flushTransaction]";
        __int16 v20 = 1024;
        int v21 = 75;
        __int16 v22 = 1024;
        *(_DWORD *)v23 = sessionID;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = participantID;
        __int16 v9 = " [%s] %s:%d flushTransaction: transaction has been flushed for sessionID='%d', participantID='%@'";
        int v10 = v6;
        uint32_t v11 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v4 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v4 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      __int16 v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v14 = self->_sessionID;
        uint64_t v15 = self->_participantID;
        int v16 = 136316674;
        uint64_t v17 = v12;
        __int16 v18 = 2080;
        v19 = "-[VCControlChannelTransaction flushTransaction]";
        __int16 v20 = 1024;
        int v21 = 75;
        __int16 v22 = 2112;
        *(void *)v23 = v4;
        *(_WORD *)&v23[8] = 2048;
        *(void *)&v23[10] = self;
        __int16 v24 = 1024;
        unsigned int v25 = v14;
        __int16 v26 = 2112;
        v27 = v15;
        __int16 v9 = " [%s] %s:%d %@(%p) flushTransaction: transaction has been flushed for sessionID='%d', participantID='%@'";
        int v10 = v13;
        uint32_t v11 = 64;
        goto LABEL_11;
      }
    }
  }
}

- (void)confirmedTransactionByParticipantID:(id)a3 sessionID:(unsigned int)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (self->_sessionID == a4 && ![a3 compare:self->_participantID])
  {
    pthread_mutex_lock(&self->_transactionLock);
    self->_isConfirmed = 1;
    pthread_cond_signal(&self->_transactionDone);
    pthread_mutex_unlock(&self->_transactionLock);
    if ((VCControlChannelTransaction *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136316162;
          uint64_t v25 = v20;
          __int16 v26 = 2080;
          v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
          __int16 v28 = 1024;
          int v29 = 84;
          __int16 v30 = 1024;
          *(_DWORD *)v31 = a4;
          *(_WORD *)&v31[4] = 2112;
          *(void *)&v31[6] = a3;
          uint64_t v12 = " [%s] %s:%d transactionConfirmedByParticipantID: message has been ACKed for sessionID='%d', participantID='%@'";
          __int16 v13 = v21;
          uint32_t v14 = 44;
          goto LABEL_13;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v19 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
      }
      else {
        v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v24 = 136316674;
          uint64_t v25 = v22;
          __int16 v26 = 2080;
          v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
          __int16 v28 = 1024;
          int v29 = 84;
          __int16 v30 = 2112;
          *(void *)v31 = v19;
          *(_WORD *)&v31[8] = 2048;
          *(void *)&v31[10] = self;
          *(_WORD *)&v31[18] = 1024;
          *(_DWORD *)unsigned int v32 = a4;
          *(_WORD *)&v32[4] = 2112;
          *(void *)&v32[6] = a3;
          uint64_t v12 = " [%s] %s:%d %@(%p) transactionConfirmedByParticipantID: message has been ACKed for sessionID='%d', participantID='%@'";
          __int16 v13 = v23;
          uint32_t v14 = 64;
          goto LABEL_13;
        }
      }
    }
  }
  else if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sessionID = self->_sessionID;
        participantID = self->_participantID;
        int v24 = 136316674;
        uint64_t v25 = v8;
        __int16 v26 = 2080;
        v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
        __int16 v28 = 1024;
        int v29 = 86;
        __int16 v30 = 1024;
        *(_DWORD *)v31 = sessionID;
        *(_WORD *)&v31[4] = 1024;
        *(_DWORD *)&v31[6] = a4;
        *(_WORD *)&v31[10] = 2112;
        *(void *)&v31[12] = participantID;
        *(_WORD *)unsigned int v32 = 2112;
        *(void *)&v32[2] = a3;
        uint64_t v12 = " [%s] %s:%d transactionConfirmedByParticipantID: confirmation mismatch: sessionID '%d'!='%d', participantID '%@'!='%@'";
        __int16 v13 = v9;
        uint32_t v14 = 60;
LABEL_13:
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v24, v14);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v7 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      int v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v17 = self->_sessionID;
        __int16 v18 = self->_participantID;
        int v24 = 136317186;
        uint64_t v25 = v15;
        __int16 v26 = 2080;
        v27 = "-[VCControlChannelTransaction confirmedTransactionByParticipantID:sessionID:]";
        __int16 v28 = 1024;
        int v29 = 86;
        __int16 v30 = 2112;
        *(void *)v31 = v7;
        *(_WORD *)&v31[8] = 2048;
        *(void *)&v31[10] = self;
        *(_WORD *)&v31[18] = 1024;
        *(_DWORD *)unsigned int v32 = v17;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = a4;
        *(_WORD *)&v32[10] = 2112;
        *(void *)&v32[12] = v18;
        __int16 v33 = 2112;
        id v34 = a3;
        uint64_t v12 = " [%s] %s:%d %@(%p) transactionConfirmedByParticipantID: confirmation mismatch: sessionID '%d'!='%d', parti"
              "cipantID '%@'!='%@'";
        __int16 v13 = v16;
        uint32_t v14 = 80;
        goto LABEL_13;
      }
    }
  }
}

- (unsigned)retryCountUsingFastRetries:(BOOL)a3
{
  if (a3) {
    return 120;
  }
  else {
    return 10;
  }
}

- (float)retryTimeoutForRetryAttempt:(unsigned int)a3 usingFastRetries:(BOOL)a4
{
  LODWORD(v4) = 0.25;
  if (!a4)
  {
    unsigned int v6 = -[VCControlChannelTransaction retryCountUsingFastRetries:](self, "retryCountUsingFastRetries:", 0, v4) - 1;
    if (v6 >= a3) {
      unsigned int v6 = a3;
    }
    LODWORD(v4) = retryTimeout[v6];
  }
  return *(float *)&v4;
}

- (BOOL)sendReliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 timeout:(id)a6 useFastRetries:(BOOL)a7 withOptions:(id)a8
{
  BOOL v8 = a7;
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  uint64_t v12 = (void *)MEMORY[0x1E4E56580](&self->_weakTransactionDelegate, a2);
  unsigned int v89 = [(VCControlChannelTransaction *)self retryCountUsingFastRetries:v8];
  uint64_t v13 = 0;
  if (!v89)
  {
    BOOL v44 = 0;
    float v14 = 0.0;
    goto LABEL_84;
  }
  float v14 = 0.0;
  uint64_t v88 = 136316418;
  while (1)
  {
    if ((objc_msgSend(v12, "isParticipantActive:", objc_msgSend(a5, "unsignedLongLongValue", v88)) & 1) == 0)
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_68;
        }
        uint64_t v49 = VRTraceErrorLogLevelToCSTR();
        v50 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v49;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 121;
        __int16 v96 = 2112;
        *(void *)v97 = a5;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = a4;
        v51 = " [%s] %s:%d Stop sending message to remote participant '%@' which is not part of session '%d'";
        v52 = v50;
        uint32_t v53 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v45 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
        }
        else {
          __int16 v45 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_68;
        }
        uint64_t v64 = VRTraceErrorLogLevelToCSTR();
        v65 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_68;
        }
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v64;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 121;
        __int16 v96 = 2112;
        *(void *)v97 = v45;
        *(_WORD *)&v97[8] = 2048;
        *(void *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(void *)&v97[20] = a5;
        *(_WORD *)&v97[28] = 1024;
        *(_DWORD *)&v97[30] = a4;
        v51 = " [%s] %s:%d %@(%p) Stop sending message to remote participant '%@' which is not part of session '%d'";
        v52 = v65;
        uint32_t v53 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_DEFAULT, v51, buf, v53);
LABEL_68:
      BOOL v44 = 0;
      goto LABEL_84;
    }
    pthread_mutex_lock(&self->_transactionLock);
    if (self->_isFlushed)
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_67;
        }
        uint64_t v54 = VRTraceErrorLogLevelToCSTR();
        v55 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_67;
        }
        *(_DWORD *)buf = v88;
        *(void *)&uint8_t buf[4] = v54;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 127;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v13 + 1;
        *(_WORD *)&v97[4] = 1024;
        *(_DWORD *)&v97[6] = a4;
        *(_WORD *)&v97[10] = 2112;
        *(void *)&v97[12] = a5;
        v56 = " [%s] %s:%d Transaction flushed. Not sending message on attempt '%d', sessionID='%d', participantID='%@'";
        v57 = v55;
        uint32_t v58 = 50;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v46 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
        }
        else {
          v46 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_67;
        }
        uint64_t v66 = VRTraceErrorLogLevelToCSTR();
        v67 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_67;
        }
        *(_DWORD *)buf = 136316930;
        *(void *)&uint8_t buf[4] = v66;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 127;
        __int16 v96 = 2112;
        *(void *)v97 = v46;
        *(_WORD *)&v97[8] = 2048;
        *(void *)&v97[10] = self;
        *(_WORD *)&v97[18] = 1024;
        *(_DWORD *)&v97[20] = v13 + 1;
        *(_WORD *)&v97[24] = 1024;
        *(_DWORD *)&v97[26] = a4;
        *(_WORD *)&v97[30] = 2112;
        *(void *)&v97[32] = a5;
        v56 = " [%s] %s:%d %@(%p) Transaction flushed. Not sending message on attempt '%d', sessionID='%d', participantID='%@'";
        v57 = v67;
        uint32_t v58 = 70;
      }
      _os_log_impl(&dword_1E1EA4000, v57, OS_LOG_TYPE_DEFAULT, v56, buf, v58);
LABEL_67:
      pthread_mutex_unlock(&self->_transactionLock);
      goto LABEL_68;
    }
    pthread_mutex_unlock(&self->_transactionLock);
    uint64_t v15 = [NSNumber numberWithUnsignedLongLong:self->_transactionID];
    id v16 = a5;
    id v17 = a5;
    __int16 v18 = v12;
    if (!+[VCControlChannelTransaction sendUnreliableMessage:a3 sessionID:a4 participantID:v17 transactionID:v15 transactionDelegate:v12 withOptions:a8])
    {
      if ((VCControlChannelTransaction *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_16;
        }
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        __int16 v26 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        *(_DWORD *)buf = v88;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 138;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = v13 + 1;
        *(_WORD *)&v97[4] = 1024;
        *(_DWORD *)&v97[6] = a4;
        *(_WORD *)&v97[10] = 2112;
        *(void *)&v97[12] = v16;
        uint64_t v22 = v26;
        v23 = " [%s] %s:%d Network failed to send message on attempt '%d', sessionID='%d', participantID='%@'";
        uint32_t v24 = 50;
        goto LABEL_15;
      }
      v19 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        v19 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v20 = VRTraceErrorLogLevelToCSTR();
        int v21 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          *(void *)&uint8_t buf[4] = v20;
          *(_WORD *)&buf[12] = 2080;
          *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFas"
                                "tRetries:withOptions:]";
          __int16 v94 = 1024;
          int v95 = 138;
          __int16 v96 = 2112;
          *(void *)v97 = v19;
          *(_WORD *)&v97[8] = 2048;
          *(void *)&v97[10] = self;
          *(_WORD *)&v97[18] = 1024;
          *(_DWORD *)&v97[20] = v13 + 1;
          *(_WORD *)&v97[24] = 1024;
          *(_DWORD *)&v97[26] = a4;
          *(_WORD *)&v97[30] = 2112;
          *(void *)&v97[32] = v16;
          uint64_t v22 = v21;
          v23 = " [%s] %s:%d %@(%p) Network failed to send message on attempt '%d', sessionID='%d', participantID='%@'";
          uint32_t v24 = 70;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, v24);
        }
      }
    }
LABEL_16:
    [(VCControlChannelTransaction *)self retryTimeoutForRetryAttempt:v13 usingFastRetries:v8];
    float v28 = v27;
    float v29 = v14 + v27;
    if (a6)
    {
      [a6 floatValue];
      if (v29 > v30)
      {
        [a6 floatValue];
        float v28 = v31 - v14;
        float v29 = v14 + (float)(v31 - v14);
      }
      if (v28 <= 0.0) {
        break;
      }
    }
    float v14 = v29;
    uint64_t v12 = v18;
    pthread_mutex_lock(&self->_transactionLock);
    a5 = v16;
    if (!self->_isConfirmed)
    {
      memset(buf, 170, 16);
      convertTimeoutToRelativeTimespec(v28);
      *(void *)buf = v32;
      *(void *)&buf[8] = v33;
      pthread_cond_timedwait_relative_np(&self->_transactionDone, &self->_transactionLock, (const timespec *)buf);
    }
    pthread_mutex_unlock(&self->_transactionLock);
    BOOL isConfirmed = self->_isConfirmed;
    uint64_t v35 = (VCControlChannelTransaction *)objc_opt_class();
    if (isConfirmed)
    {
      if (v35 == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_74;
        }
        uint64_t v59 = VRTraceErrorLogLevelToCSTR();
        v60 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_74;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v59;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 167;
        __int16 v96 = 1024;
        *(_DWORD *)v97 = a4;
        *(_WORD *)&v97[4] = 2112;
        *(void *)&v97[6] = a5;
        v61 = " [%s] %s:%d Message has been confirmed for sessionID='%d' by remote participant participantID='%@'";
        v62 = v60;
        uint32_t v63 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v47 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v47 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_74;
        }
        uint64_t v68 = VRTraceErrorLogLevelToCSTR();
        v69 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_74;
        }
        *(_DWORD *)buf = 136316674;
        *(void *)&uint8_t buf[4] = v68;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 167;
        __int16 v96 = 2112;
        *(void *)v97 = v47;
        *(_WORD *)&v97[8] = 2048;
        *(void *)&v97[10] = self;
        *(_WORD *)&v97[18] = 1024;
        *(_DWORD *)&v97[20] = a4;
        *(_WORD *)&v97[24] = 2112;
        *(void *)&v97[26] = a5;
        v61 = " [%s] %s:%d %@(%p) Message has been confirmed for sessionID='%d' by remote participant participantID='%@'";
        v62 = v69;
        uint32_t v63 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_DEFAULT, v61, buf, v63);
LABEL_74:
      BOOL v44 = 1;
      goto LABEL_84;
    }
    if (v35 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_33;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      __int16 v43 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = v88;
      *(void *)&uint8_t buf[4] = v42;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastRet"
                            "ries:withOptions:]";
      __int16 v94 = 1024;
      int v95 = 164;
      __int16 v96 = 1024;
      *(_DWORD *)v97 = v13 + 1;
      *(_WORD *)&v97[4] = 2048;
      *(double *)&v97[6] = v29;
      *(_WORD *)&v97[14] = 1024;
      *(_DWORD *)&v97[16] = v8;
      __int16 v39 = v43;
      int v40 = " [%s] %s:%d Attempt '%d' timed out. Aggregated wait is '%f', useFastRetries=%d";
      uint32_t v41 = 50;
    }
    else
    {
      uint64_t v36 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        uint64_t v36 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_33;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_33;
      }
      *(_DWORD *)buf = 136316930;
      *(void *)&uint8_t buf[4] = v37;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastRet"
                            "ries:withOptions:]";
      __int16 v94 = 1024;
      int v95 = 164;
      __int16 v96 = 2112;
      *(void *)v97 = v36;
      *(_WORD *)&v97[8] = 2048;
      *(void *)&v97[10] = self;
      *(_WORD *)&v97[18] = 1024;
      *(_DWORD *)&v97[20] = v13 + 1;
      *(_WORD *)&v97[24] = 2048;
      *(double *)&v97[26] = v29;
      *(_WORD *)&v97[34] = 1024;
      *(_DWORD *)&v97[36] = v8;
      __int16 v39 = v38;
      int v40 = " [%s] %s:%d %@(%p) Attempt '%d' timed out. Aggregated wait is '%f', useFastRetries=%d";
      uint32_t v41 = 70;
    }
    _os_log_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_DEFAULT, v40, buf, v41);
LABEL_33:
    uint64_t v13 = (v13 + 1);
    if (v89 == v13)
    {
      BOOL v44 = 0;
      LODWORD(v13) = v89;
      goto LABEL_84;
    }
  }
  uint64_t v12 = v18;
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    a5 = v16;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v70 = VRTraceErrorLogLevelToCSTR();
      v71 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v70;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 148;
        __int16 v96 = 2112;
        *(void *)v97 = a6;
        v72 = " [%s] %s:%d User-specified timeout '%@' has expired. Aborting confirmation wait";
        v73 = v71;
        uint32_t v74 = 38;
        goto LABEL_82;
      }
    }
  }
  else
  {
    a5 = v16;
    if (objc_opt_respondsToSelector()) {
      v48 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
    }
    else {
      v48 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v75 = VRTraceErrorLogLevelToCSTR();
      v76 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = v88;
        *(void *)&uint8_t buf[4] = v75;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        __int16 v94 = 1024;
        int v95 = 148;
        __int16 v96 = 2112;
        *(void *)v97 = v48;
        *(_WORD *)&v97[8] = 2048;
        *(void *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(void *)&v97[20] = a6;
        v72 = " [%s] %s:%d %@(%p) User-specified timeout '%@' has expired. Aborting confirmation wait";
        v73 = v76;
        uint32_t v74 = 58;
LABEL_82:
        _os_log_impl(&dword_1E1EA4000, v73, OS_LOG_TYPE_DEFAULT, v72, buf, v74);
      }
    }
  }
  BOOL v44 = 0;
  float v14 = v29;
LABEL_84:
  if ((VCControlChannelTransaction *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v80 = "FAILURE";
        *(_DWORD *)buf = 136316930;
        *(void *)&uint8_t buf[4] = v78;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        if (v44) {
          v80 = "SUCCESS";
        }
        __int16 v94 = 1024;
        int v95 = 171;
        __int16 v96 = 2112;
        *(void *)v97 = a5;
        *(_WORD *)&v97[8] = 1024;
        *(_DWORD *)&v97[10] = a4;
        *(_WORD *)&v97[14] = 2080;
        *(void *)&v97[16] = v80;
        *(_WORD *)&v97[24] = 1024;
        *(_DWORD *)&v97[26] = v13 + 1;
        *(_WORD *)&v97[30] = 2048;
        *(double *)&v97[32] = v14;
        v81 = " [%s] %s:%d Finished sending message to participantID='%@' for sessionID='%d', result='%s', attempt='%d', "
              "aggregated wait='%f'";
        v82 = v79;
        uint32_t v83 = 70;
LABEL_98:
        _os_log_impl(&dword_1E1EA4000, v82, OS_LOG_TYPE_DEFAULT, v81, buf, v83);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v77 = (__CFString *)[(VCControlChannelTransaction *)self performSelector:sel_logPrefix];
    }
    else {
      v77 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v84 = VRTraceErrorLogLevelToCSTR();
      v85 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v86 = "FAILURE";
        *(_DWORD *)buf = 136317442;
        *(void *)&uint8_t buf[4] = v84;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelTransaction sendReliableMessage:sessionID:participantID:timeout:useFastR"
                              "etries:withOptions:]";
        if (v44) {
          v86 = "SUCCESS";
        }
        __int16 v94 = 1024;
        int v95 = 171;
        __int16 v96 = 2112;
        *(void *)v97 = v77;
        *(_WORD *)&v97[8] = 2048;
        *(void *)&v97[10] = self;
        *(_WORD *)&v97[18] = 2112;
        *(void *)&v97[20] = a5;
        *(_WORD *)&v97[28] = 1024;
        *(_DWORD *)&v97[30] = a4;
        *(_WORD *)&v97[34] = 2080;
        *(void *)&v97[36] = v86;
        __int16 v98 = 1024;
        int v99 = v13 + 1;
        __int16 v100 = 2048;
        double v101 = v14;
        v81 = " [%s] %s:%d %@(%p) Finished sending message to participantID='%@' for sessionID='%d', result='%s', attempt"
              "='%d', aggregated wait='%f'";
        v82 = v85;
        uint32_t v83 = 90;
        goto LABEL_98;
      }
    }
  }
  if (v12) {
    CFRelease(v12);
  }
  return v44;
}

+ (BOOL)sendUnreliableMessage:(id)a3 sessionID:(unsigned int)a4 participantID:(id)a5 transactionID:(id)a6 transactionDelegate:(id)a7 withOptions:(id)a8
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    if ((objc_msgSend(a7, "isParticipantActive:", objc_msgSend(a5, "unsignedLongLongValue")) & 1) == 0)
    {
      if ((id)objc_opt_class() != a1)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v22 = (__CFString *)[a1 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v22 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          return 0;
        }
        uint64_t v35 = VRTraceErrorLogLevelToCSTR();
        uint64_t v36 = *MEMORY[0x1E4F47A50];
        BOOL v37 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        BOOL result = 0;
        if (!v37) {
          return result;
        }
        int v38 = 136316674;
        uint64_t v39 = v35;
        __int16 v40 = 2080;
        uint32_t v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDeleg"
              "ate:withOptions:]";
        __int16 v42 = 1024;
        int v43 = 186;
        __int16 v44 = 2112;
        *(void *)__int16 v45 = v22;
        *(_WORD *)&v45[8] = 2048;
        size_t v46 = (size_t)a1;
        *(_WORD *)uint64_t v47 = 2112;
        *(void *)&v47[2] = a5;
        *(_WORD *)&v47[10] = 1024;
        *(_DWORD *)v48 = a4;
        __int16 v26 = " [%s] %s:%d %@(%p) sendUnreliableMessage: attempt to send message to remote participant '%@' which is not "
              "part of session '%d'";
        float v27 = v36;
        uint32_t v28 = 64;
        goto LABEL_33;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v32 = VRTraceErrorLogLevelToCSTR();
        uint64_t v33 = *MEMORY[0x1E4F47A50];
        BOOL v34 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
        BOOL result = 0;
        if (!v34) {
          return result;
        }
        int v38 = 136316162;
        uint64_t v39 = v32;
        __int16 v40 = 2080;
        uint32_t v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDeleg"
              "ate:withOptions:]";
        __int16 v42 = 1024;
        int v43 = 186;
        __int16 v44 = 2112;
        *(void *)__int16 v45 = a5;
        *(_WORD *)&v45[8] = 1024;
        LODWORD(v46) = a4;
        __int16 v26 = " [%s] %s:%d sendUnreliableMessage: attempt to send message to remote participant '%@' which is not part of session '%d'";
        float v27 = v33;
        uint32_t v28 = 44;
        goto LABEL_33;
      }
      return 0;
    }
    uint64_t v72 = 0;
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    DWORD2(v52) = a4;
    BYTE5(v71) = [a8 duplicateMessageOnServerLink];
    BYTE14(v64) = 1;
    *(void *)&long long v65 = [a5 unsignedLongLongValue];
    if (a6) {
      goto LABEL_4;
    }
  }
  else
  {
    uint64_t v72 = 0;
    long long v71 = 0u;
    long long v70 = 0u;
    long long v69 = 0u;
    long long v68 = 0u;
    long long v67 = 0u;
    long long v66 = 0u;
    long long v65 = 0u;
    long long v64 = 0u;
    long long v63 = 0u;
    long long v62 = 0u;
    long long v61 = 0u;
    long long v60 = 0u;
    long long v59 = 0u;
    long long v58 = 0u;
    long long v57 = 0u;
    long long v56 = 0u;
    long long v55 = 0u;
    long long v54 = 0u;
    long long v53 = 0u;
    long long v52 = 0u;
    DWORD2(v52) = a4;
    BYTE5(v71) = [a8 duplicateMessageOnServerLink];
    if (a6)
    {
LABEL_4:
      BYTE10(v66) = 1;
      *(void *)&long long v67 = [a6 unsignedLongLongValue];
    }
  }
  memset((char *)v51 + 1, 170, 0x7FFuLL);
  uint64_t v15 = [a3 length];
  int v16 = v15;
  LOBYTE(v51[0]) = 64;
  size_t v17 = v15 + 1;
  if ((unint64_t)(v15 + 1) >= 0x801)
  {
    if ((id)objc_opt_class() != a1)
    {
      if (objc_opt_respondsToSelector()) {
        int v21 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        int v21 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      float v30 = *MEMORY[0x1E4F47A50];
      BOOL v31 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v31) {
        return result;
      }
      int v38 = 136317186;
      uint64_t v39 = v29;
      __int16 v40 = 2080;
      uint32_t v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      __int16 v42 = 1024;
      int v43 = 211;
      __int16 v44 = 2112;
      *(void *)__int16 v45 = v21;
      *(_WORD *)&v45[8] = 2048;
      size_t v46 = (size_t)a1;
      *(_WORD *)uint64_t v47 = 1024;
      *(_DWORD *)&v47[2] = 1;
      *(_WORD *)&v47[6] = 1024;
      *(_DWORD *)&v47[8] = v16;
      *(_WORD *)v48 = 1024;
      *(_DWORD *)&v48[2] = a4;
      __int16 v49 = 2112;
      id v50 = a5;
      __int16 v26 = " [%s] %s:%d %@(%p) Message length is too large (header[%d] data[%d]) to be sent. session[%d] particiapnt[%@] ";
      float v27 = v30;
      uint32_t v28 = 76;
      goto LABEL_33;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint32_t v24 = *MEMORY[0x1E4F47A50];
      BOOL v25 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v25) {
        return result;
      }
      int v38 = 136316674;
      uint64_t v39 = v23;
      __int16 v40 = 2080;
      uint32_t v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      __int16 v42 = 1024;
      int v43 = 211;
      __int16 v44 = 1024;
      *(_DWORD *)__int16 v45 = 1;
      *(_WORD *)&v45[4] = 1024;
      *(_DWORD *)&v45[6] = v16;
      LOWORD(v46) = 1024;
      *(_DWORD *)((char *)&v46 + 2) = a4;
      HIWORD(v46) = 2112;
      *(void *)uint64_t v47 = a5;
      __int16 v26 = " [%s] %s:%d Message length is too large (header[%d] data[%d]) to be sent. session[%d] particiapnt[%@] ";
      float v27 = v24;
      uint32_t v28 = 56;
LABEL_33:
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, (uint8_t *)&v38, v28);
      return 0;
    }
    return 0;
  }
  [a3 bytes];
  __memcpy_chk();
  [a7 addToSentStats:v17];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v38 = 136316674;
      uint64_t v39 = v18;
      __int16 v40 = 2080;
      uint32_t v41 = "+[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:]";
      __int16 v42 = 1024;
      int v43 = 221;
      __int16 v44 = 2112;
      *(void *)__int16 v45 = a6;
      *(_WORD *)&v45[8] = 2048;
      size_t v46 = v17;
      *(_WORD *)uint64_t v47 = 2112;
      *(void *)&v47[2] = a5;
      *(_WORD *)&v47[10] = 1024;
      *(_DWORD *)v48 = a4;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendUnreliableMessage: send message with transactionID=%@, size=%lu to remote participant=%@ which is part of session=%d", (uint8_t *)&v38, 0x40u);
    }
  }
  return VTP_Send(-1, v51, v17, 0, (uint64_t)&v52) == v17;
}

@end