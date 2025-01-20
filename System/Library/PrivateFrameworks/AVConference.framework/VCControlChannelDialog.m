@interface VCControlChannelDialog
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 timeout:(id)a5 withOptions:(id)a6;
- (BOOL)sendReliableMessageInternal:(id)a3 withTopic:(id)a4 timeout:(id)a5 useFastRetries:(BOOL)a6 withOptions:(id)a7;
- (BOOL)sendUnreliableMessage:(id)a3 withTopic:(id)a4 sessionID:(unsigned int)a5 participantID:(id)a6 transactionDelegate:(id)a7;
- (NSDictionary)transactions;
- (VCControlChannelDialog)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7;
- (id)handshakeOperationQueue;
- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7;
- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8;
- (void)cacheOutgoingMessage:(id)a3 topic:(id)a4 timeout:(id)a5 withOptions:(id)a6;
- (void)checkForSignificantHandshakeDelayWithDelegate:(id)a3;
- (void)confirmTransaction:(id)a3;
- (void)dealloc;
- (void)doHandshakeWithMessage:(id)a3 topic:(id)a4 afterDelay:(double)a5 withOptions:(id)a6;
- (void)flushActiveTransactions;
- (void)removeTransactionForTransactionID:(int)a3;
- (void)resetHandshake;
- (void)sendAllCachedMessagesAndDisableHandshakeWhenDone;
- (void)startHandshakeWithMessage:(id)a3 topic:(id)a4 withOptions:(id)a5;
@end

@implementation VCControlChannelDialog

- (VCControlChannelDialog)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)VCControlChannelDialog;
  v12 = [(VCObject *)&v31 init];
  v13 = v12;
  if (v12)
  {
    v12->_sessionID = a3;
    uint64_t v14 = [a4 copy];
    p_participantID = &v13->_participantID;
    v13->_participantID = (NSNumber *)v14;
    v13->_participantUUID = (NSString *)[a5 copy];
    v13->_weakTransactionDelegate = (VCControlChannelTransactionDelegate *)objc_storeWeak((id *)&v13->_weakTransactionDelegate, a7);
    v13->_transactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v13->_cachedMessages = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v16 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v13->_handshakeOperationQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.AVConference.VCControlChannelDialog.handshakeOperationQueue", v16);
    v13->_handshakeEnabled = a6->var5;
    v13->_handshakeStartTime = NAN;
    [(VCControlChannelDialog *)v13 resetHandshake];
    if ((VCControlChannelDialog *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        v19 = *MEMORY[0x1E4F47A50];
        v20 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = (__CFString *)*p_participantID;
            *(_DWORD *)buf = 136315906;
            uint64_t v33 = v18;
            __int16 v34 = 2080;
            v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
            __int16 v36 = 1024;
            int v37 = 65;
            __int16 v38 = 2112;
            v39 = v21;
            v22 = " [%s] %s:%d Created VCControlChannelDialog object with remoteParticipantID='%@'";
            v23 = v19;
            uint32_t v24 = 38;
LABEL_14:
            _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v22, buf, v24);
          }
        }
        else if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          -[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v17 = (__CFString *)[(VCControlChannelDialog *)v13 performSelector:sel_logPrefix];
      }
      else {
        v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        uint64_t v25 = VRTraceErrorLogLevelToCSTR();
        v26 = *MEMORY[0x1E4F47A50];
        v27 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            v28 = *p_participantID;
            *(_DWORD *)buf = 136316418;
            uint64_t v33 = v25;
            __int16 v34 = 2080;
            v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
            __int16 v36 = 1024;
            int v37 = 65;
            __int16 v38 = 2112;
            v39 = v17;
            __int16 v40 = 2048;
            v41 = v13;
            __int16 v42 = 2112;
            v43 = v28;
            v22 = " [%s] %s:%d %@(%p) Created VCControlChannelDialog object with remoteParticipantID='%@'";
            v23 = v26;
            uint32_t v24 = 58;
            goto LABEL_14;
          }
        }
        else if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          v29 = *p_participantID;
          *(_DWORD *)buf = 136316418;
          uint64_t v33 = v25;
          __int16 v34 = 2080;
          v35 = "-[VCControlChannelDialog initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          __int16 v36 = 1024;
          int v37 = 65;
          __int16 v38 = 2112;
          v39 = v17;
          __int16 v40 = 2048;
          v41 = v13;
          __int16 v42 = 2112;
          v43 = v29;
          _os_log_debug_impl(&dword_1E1EA4000, v26, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) Created VCControlChannelDialog object with remoteParticipantID='%@'", buf, 0x3Au);
        }
      }
    }
  }
  return v13;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Dealloc VCControlChannelDialog object with remoteParticipantID='%@'");
}

- (id)handshakeOperationQueue
{
  v2 = self->_handshakeOperationQueue;

  return v2;
}

- (void)resetHandshake
{
  objc_sync_enter(self);
  BOOL handshakeEnabled = self->_handshakeEnabled;
  self->_isHandshakeMode = handshakeEnabled;
  self->_isHandshakeCommenced = !handshakeEnabled;
  self->_shouldFinishHandshake = !handshakeEnabled;
  [(NSMutableArray *)self->_cachedMessages removeAllObjects];

  objc_sync_exit(self);
}

- (void)flushActiveTransactions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  self->_shouldFinishHandshake = 1;
  transactions = self->_transactions;
  self->_transactions = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_sync_exit(self);
  if (transactions)
  {
    v4 = (void *)[(NSMutableDictionary *)transactions allKeys];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](transactions, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7++)), "flushTransaction");
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
      }
      while (v5);
    }
  }
}

- (void)removeTransactionForTransactionID:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  -[NSMutableDictionary removeObjectForKey:](self->_transactions, "removeObjectForKey:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", v3), "stringValue"));
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      v8 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136315906;
          uint64_t v16 = v6;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
          __int16 v19 = 1024;
          int v20 = 125;
          __int16 v21 = 1024;
          LODWORD(v22) = v3;
          long long v9 = " [%s] %s:%d removeTransactionForTransactionID: transactionID='%d' removed from list of transactions";
          long long v10 = v7;
          uint32_t v11 = 34;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        -[VCControlChannelDialog removeTransactionForTransactionID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 136316418;
          uint64_t v16 = v12;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
          __int16 v19 = 1024;
          int v20 = 125;
          __int16 v21 = 2112;
          v22 = v5;
          __int16 v23 = 2048;
          uint32_t v24 = self;
          __int16 v25 = 1024;
          int v26 = v3;
          long long v9 = " [%s] %s:%d %@(%p) removeTransactionForTransactionID: transactionID='%d' removed from list of transactions";
          long long v10 = v13;
          uint32_t v11 = 54;
          goto LABEL_13;
        }
      }
      else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
        __int16 v19 = 1024;
        int v20 = 125;
        __int16 v21 = 2112;
        v22 = v5;
        __int16 v23 = 2048;
        uint32_t v24 = self;
        __int16 v25 = 1024;
        int v26 = v3;
        _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, " [%s] %s:%d %@(%p) removeTransactionForTransactionID: transactionID='%d' removed from list of transactions", (uint8_t *)&v15, 0x36u);
      }
    }
  }
  objc_sync_exit(self);
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
}

- (void)doHandshakeWithMessage:(id)a3 topic:(id)a4 afterDelay:(double)a5 withOptions:(id)a6
{
  block[8] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
  handshakeOperationQueue = self->_handshakeOperationQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke;
  block[3] = &unk_1E6DB6740;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  block[7] = a6;
  dispatch_after(v10, handshakeOperationQueue, block);
}

void __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4E56580](*(void *)(a1 + 32) + 176);
  char v3 = objc_msgSend(v2, "isParticipantActive:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 208), "unsignedLongLongValue"));
  v4 = *(unsigned char **)(a1 + 32);
  if (v3)
  {
    if (!v4[192])
    {
      if (![v4 sendReliableMessageInternal:*(void *)(a1 + 40) withTopic:*(void *)(a1 + 48) timeout:&unk_1F3DC43B0 useFastRetries:1 withOptions:*(void *)(a1 + 56)])
      {
        [*(id *)(a1 + 32) checkForSignificantHandshakeDelayWithDelegate:v2];
        [*(id *)(a1 + 32) doHandshakeWithMessage:*(void *)(a1 + 40) topic:*(void *)(a1 + 48) afterDelay:*(void *)(a1 + 56) withOptions:0.25];
        goto LABEL_17;
      }
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_16;
        }
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        uint64_t v7 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        v8 = *(__CFString **)(*(void *)(a1 + 32) + 208);
        int v34 = 136315906;
        uint64_t v35 = v6;
        __int16 v36 = 2080;
        int v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        __int16 v38 = 1024;
        int v39 = 149;
        __int16 v40 = 2112;
        v41 = v8;
        long long v9 = " [%s] %s:%d Handshake acknowledged from '%@'";
        dispatch_time_t v10 = v7;
        uint32_t v11 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        else {
          uint64_t v5 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_16;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_16;
        }
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(v14 + 208);
        int v34 = 136316418;
        uint64_t v35 = v12;
        __int16 v36 = 2080;
        int v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        __int16 v38 = 1024;
        int v39 = 149;
        __int16 v40 = 2112;
        v41 = v5;
        __int16 v42 = 2048;
        uint64_t v43 = v14;
        __int16 v44 = 2112;
        uint64_t v45 = v15;
        long long v9 = " [%s] %s:%d %@(%p) Handshake acknowledged from '%@'";
        dispatch_time_t v10 = v13;
        uint32_t v11 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v34, v11);
LABEL_16:
      uint64_t v16 = *(void **)(a1 + 32);
      objc_sync_enter(v16);
      [*(id *)(a1 + 32) sendAllCachedMessagesAndDisableHandshakeWhenDone];
      objc_sync_exit(v16);
      goto LABEL_17;
    }
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke_cold_1();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v18 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        uint64_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        v32 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          uint64_t v33 = *(void *)(a1 + 32);
          int v34 = 136316162;
          uint64_t v35 = v31;
          __int16 v36 = 2080;
          int v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
          __int16 v38 = 1024;
          int v39 = 142;
          __int16 v40 = 2112;
          v41 = v18;
          __int16 v42 = 2048;
          uint64_t v43 = v33;
          __int16 v23 = " [%s] %s:%d %@(%p) Dialog was flushed. Cancelling handshake...";
          uint32_t v24 = v32;
          uint32_t v25 = 48;
          goto LABEL_40;
        }
      }
    }
  }
  else
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_17;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      int v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      uint64_t v21 = *(void *)(a1 + 32);
      v22 = *(__CFString **)(v21 + 208);
      LODWORD(v21) = *(_DWORD *)(v21 + 172);
      int v34 = 136316162;
      uint64_t v35 = v19;
      __int16 v36 = 2080;
      int v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
      __int16 v38 = 1024;
      int v39 = 140;
      __int16 v40 = 2112;
      v41 = v22;
      __int16 v42 = 1024;
      LODWORD(v43) = v21;
      __int16 v23 = " [%s] %s:%d Participant '%@' removed from the session '%d'. Cancelling handshake...";
      uint32_t v24 = v20;
      uint32_t v25 = 44;
      goto LABEL_40;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v17 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      __int16 v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(a1 + 32);
        uint64_t v29 = *(void *)(v28 + 208);
        int v30 = *(_DWORD *)(v28 + 172);
        int v34 = 136316674;
        uint64_t v35 = v26;
        __int16 v36 = 2080;
        int v37 = "-[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:]_block_invoke";
        __int16 v38 = 1024;
        int v39 = 140;
        __int16 v40 = 2112;
        v41 = v17;
        __int16 v42 = 2048;
        uint64_t v43 = v28;
        __int16 v44 = 2112;
        uint64_t v45 = v29;
        __int16 v46 = 1024;
        int v47 = v30;
        __int16 v23 = " [%s] %s:%d %@(%p) Participant '%@' removed from the session '%d'. Cancelling handshake...";
        uint32_t v24 = v27;
        uint32_t v25 = 64;
LABEL_40:
        _os_log_error_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_ERROR, v23, (uint8_t *)&v34, v25);
      }
    }
  }
LABEL_17:
  if (v2) {
    CFRelease(v2);
  }
}

- (void)checkForSignificantHandshakeDelayWithDelegate:(id)a3
{
  if (self->_isHandshakeCommenced && micro() - self->_handshakeStartTime > 30.0)
  {
    [a3 reportSignificantHandshakeDelaySymptomForParticipantID:self->_participantID];
    self->_handshakeStartTime = NAN;
  }
}

- (void)sendAllCachedMessagesAndDisableHandshakeWhenDone
{
  v55[1] = *MEMORY[0x1E4F143B8];
  if (![(NSMutableArray *)self->_cachedMessages count])
  {
    self->_isHandshakeMode = 0;
    [(VCObject *)self reportingAgent];
    participantUUID = self->_participantUUID;
    v54 = @"VCSPUUID";
    v55[0] = participantUUID;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v55 forKeys:&v54 count:1];
    reportingGenericEvent();
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      unsigned int sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316162;
      uint64_t v41 = v26;
      __int16 v42 = 2080;
      uint64_t v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
      __int16 v44 = 1024;
      int v45 = 183;
      __int16 v46 = 1024;
      *(_DWORD *)int v47 = sessionID;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = participantID;
      int v30 = " [%s] %s:%d sendAllCachedMessagesAndDisableHandshakeWhenDone: Handshake turned off for _sessionID='%d', _participantID='%@'";
      uint64_t v31 = v27;
      uint32_t v32 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v25 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        return;
      }
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      int v34 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      unsigned int v35 = self->_sessionID;
      __int16 v36 = self->_participantID;
      *(_DWORD *)buf = 136316674;
      uint64_t v41 = v33;
      __int16 v42 = 2080;
      uint64_t v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
      __int16 v44 = 1024;
      int v45 = 183;
      __int16 v46 = 2112;
      *(void *)int v47 = v25;
      *(_WORD *)&v47[8] = 2048;
      *(void *)&v47[10] = self;
      *(_WORD *)&v47[18] = 1024;
      *(_DWORD *)&v47[20] = v35;
      __int16 v48 = 2112;
      uint64_t v49 = (uint64_t)v36;
      int v30 = " [%s] %s:%d %@(%p) sendAllCachedMessagesAndDisableHandshakeWhenDone: Handshake turned off for _sessionID='%d"
            "', _participantID='%@'";
      uint64_t v31 = v34;
      uint32_t v32 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
    return;
  }
  if ([(NSMutableArray *)self->_cachedMessages count])
  {
    unint64_t v4 = 0;
    *(void *)&long long v3 = 136316674;
    long long v37 = v3;
    do
    {
      uint64_t v5 = (void *)-[NSMutableArray objectAtIndexedSubscript:](self->_cachedMessages, "objectAtIndexedSubscript:", v4, v37);
      uint64_t v6 = [v5 objectForKeyedSubscript:@"CachedTopic"];
      uint64_t v7 = [v5 objectForKeyedSubscript:@"CachedMessage"];
      uint64_t v8 = [v5 objectForKeyedSubscript:@"CachedOptions"];
      uint64_t v9 = [v5 objectForKeyedSubscript:@"Temeout"];
      handshakeOperationQueue = self->_handshakeOperationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke;
      block[3] = &unk_1E6DB6768;
      block[4] = self;
      block[5] = v7;
      block[6] = v6;
      block[7] = v9;
      block[8] = v8;
      dispatch_async(handshakeOperationQueue, block);
      if ((VCControlChannelDialog *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_14;
        }
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        int v20 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        unsigned int v21 = self->_sessionID;
        v22 = self->_participantID;
        *(_DWORD *)buf = v37;
        uint64_t v41 = v19;
        __int16 v42 = 2080;
        uint64_t v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
        __int16 v44 = 1024;
        int v45 = 195;
        __int16 v46 = 1024;
        *(_DWORD *)int v47 = v21;
        *(_WORD *)&v47[4] = 2112;
        *(void *)&v47[6] = v22;
        *(_WORD *)&v47[14] = 2112;
        *(void *)&v47[16] = v6;
        __int16 v48 = 2112;
        uint64_t v49 = v7;
        uint64_t v16 = v20;
        __int16 v17 = " [%s] %s:%d sendAllCachedMessagesAndDisableHandshakeWhenDone: Sent cached message for _sessionID='%d', _pa"
              "rticipantID='%@', topic='%@', reliable message='%@' ";
        uint32_t v18 = 64;
      }
      else
      {
        uint32_t v11 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint32_t v11 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_14;
        }
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        uint64_t v13 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_14;
        }
        unsigned int v14 = self->_sessionID;
        uint64_t v15 = self->_participantID;
        *(_DWORD *)buf = 136317186;
        uint64_t v41 = v12;
        __int16 v42 = 2080;
        uint64_t v43 = "-[VCControlChannelDialog sendAllCachedMessagesAndDisableHandshakeWhenDone]";
        __int16 v44 = 1024;
        int v45 = 195;
        __int16 v46 = 2112;
        *(void *)int v47 = v11;
        *(_WORD *)&v47[8] = 2048;
        *(void *)&v47[10] = self;
        *(_WORD *)&v47[18] = 1024;
        *(_DWORD *)&v47[20] = v14;
        __int16 v48 = 2112;
        uint64_t v49 = (uint64_t)v15;
        __int16 v50 = 2112;
        uint64_t v51 = v6;
        __int16 v52 = 2112;
        uint64_t v53 = v7;
        uint64_t v16 = v13;
        __int16 v17 = " [%s] %s:%d %@(%p) sendAllCachedMessagesAndDisableHandshakeWhenDone: Sent cached message for _sessionID='%"
              "d', _participantID='%@', topic='%@', reliable message='%@' ";
        uint32_t v18 = 84;
      }
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
LABEL_14:
      ++v4;
    }
    while (v4 < [(NSMutableArray *)self->_cachedMessages count]);
  }
  [(NSMutableArray *)self->_cachedMessages removeAllObjects];
  __int16 v23 = self->_handshakeOperationQueue;
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke_32;
  v38[3] = &unk_1E6DB3DC8;
  v38[4] = self;
  dispatch_async(v23, v38);
}

uint64_t __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendReliableMessageInternal:*(void *)(a1 + 40) withTopic:*(void *)(a1 + 48) timeout:*(void *)(a1 + 56) useFastRetries:0 withOptions:*(void *)(a1 + 64)];
}

uint64_t __74__VCControlChannelDialog_sendAllCachedMessagesAndDisableHandshakeWhenDone__block_invoke_32(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  objc_sync_enter(v2);
  [*(id *)(a1 + 32) sendAllCachedMessagesAndDisableHandshakeWhenDone];

  return objc_sync_exit(v2);
}

- (void)startHandshakeWithMessage:(id)a3 topic:(id)a4 withOptions:(id)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  self->_isHandshakeCommenced = 1;
  self->_handshakeStartTime = micro();
  [(VCObject *)self reportingAgent];
  uint32_t v25 = @"VCSPUUID";
  v26[0] = self->_participantUUID;
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  reportingGenericEvent();
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint32_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sessionID = self->_sessionID;
        participantID = self->_participantID;
        *(_DWORD *)unsigned int v21 = 136316674;
        *(void *)&v21[4] = v10;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCControlChannelDialog startHandshakeWithMessage:topic:withOptions:]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 217;
        *(_WORD *)&v22[4] = 1024;
        *(_DWORD *)&v22[6] = sessionID;
        *(_WORD *)&v22[10] = 2112;
        *(void *)&v22[12] = participantID;
        *(_WORD *)&v22[20] = 2112;
        *(void *)&v22[22] = a4;
        *(_WORD *)&v22[30] = 2112;
        id v23 = a3;
        unsigned int v14 = " [%s] %s:%d Started handshake for session '%d' with participant '%@' using topic '%@', message '%@'";
        uint64_t v15 = v11;
        uint32_t v16 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, v21, v16);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      uint32_t v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v19 = self->_sessionID;
        int v20 = self->_participantID;
        *(_DWORD *)unsigned int v21 = 136317186;
        *(void *)&v21[4] = v17;
        *(_WORD *)&v21[12] = 2080;
        *(void *)&v21[14] = "-[VCControlChannelDialog startHandshakeWithMessage:topic:withOptions:]";
        *(_WORD *)&v21[22] = 1024;
        *(_DWORD *)v22 = 217;
        *(_WORD *)&v22[4] = 2112;
        *(void *)&v22[6] = v9;
        *(_WORD *)&v22[14] = 2048;
        *(void *)&v22[16] = self;
        *(_WORD *)&v22[24] = 1024;
        *(_DWORD *)&v22[26] = v19;
        *(_WORD *)&v22[30] = 2112;
        id v23 = v20;
        *(_WORD *)uint32_t v24 = 2112;
        *(void *)&v24[2] = a4;
        *(_WORD *)&v24[10] = 2112;
        *(void *)&v24[12] = a3;
        unsigned int v14 = " [%s] %s:%d %@(%p) Started handshake for session '%d' with participant '%@' using topic '%@', message '%@'";
        uint64_t v15 = v18;
        uint32_t v16 = 84;
        goto LABEL_11;
      }
    }
  }
  -[VCControlChannelDialog doHandshakeWithMessage:topic:afterDelay:withOptions:](self, "doHandshakeWithMessage:topic:afterDelay:withOptions:", a3, a4, a5, 0.0, *(_OWORD *)v21, *(void *)&v21[16], *(_OWORD *)v22, *(_OWORD *)&v22[16], v23, *(_OWORD *)v24, *(void *)&v24[16]);
}

- (void)cacheOutgoingMessage:(id)a3 topic:(id)a4 timeout:(id)a5 withOptions:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v11 setObject:a4 forKeyedSubscript:@"CachedTopic"];
  [v11 setObject:a3 forKeyedSubscript:@"CachedMessage"];
  [v11 setObject:a6 forKeyedSubscript:@"CachedOptions"];
  [v11 setObject:a5 forKeyedSubscript:@"Temeout"];
  [(NSMutableArray *)self->_cachedMessages addObject:v11];

  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      unsigned int v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int sessionID = self->_sessionID;
        participantID = self->_participantID;
        int v24 = 136316674;
        uint64_t v25 = v13;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCControlChannelDialog cacheOutgoingMessage:topic:timeout:withOptions:]";
        __int16 v28 = 1024;
        int v29 = 237;
        __int16 v30 = 1024;
        *(_DWORD *)uint64_t v31 = sessionID;
        *(_WORD *)&v31[4] = 2112;
        *(void *)&v31[6] = participantID;
        *(_WORD *)&v31[14] = 2112;
        *(void *)&v31[16] = a4;
        __int16 v32 = 2112;
        id v33 = a3;
        uint64_t v17 = " [%s] %s:%d cacheOutgoingMessage: Cached a new message for sessionID='%d', _participantID='%@', topic='%@'"
              ", reliable message='%@' ";
        uint32_t v18 = v14;
        uint32_t v19 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v24, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      unsigned int v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = self->_sessionID;
        id v23 = self->_participantID;
        int v24 = 136317186;
        uint64_t v25 = v20;
        __int16 v26 = 2080;
        uint64_t v27 = "-[VCControlChannelDialog cacheOutgoingMessage:topic:timeout:withOptions:]";
        __int16 v28 = 1024;
        int v29 = 237;
        __int16 v30 = 2112;
        *(void *)uint64_t v31 = v12;
        *(_WORD *)&v31[8] = 2048;
        *(void *)&v31[10] = self;
        *(_WORD *)&v31[18] = 1024;
        *(_DWORD *)&v31[20] = v22;
        __int16 v32 = 2112;
        id v33 = v23;
        __int16 v34 = 2112;
        id v35 = a4;
        __int16 v36 = 2112;
        id v37 = a3;
        uint64_t v17 = " [%s] %s:%d %@(%p) cacheOutgoingMessage: Cached a new message for sessionID='%d', _participantID='%@', top"
              "ic='%@', reliable message='%@' ";
        uint32_t v18 = v21;
        uint32_t v19 = 84;
        goto LABEL_11;
      }
    }
  }
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 timeout:(id)a5 withOptions:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((VCControlChannelDialog *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      BOOL v21 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v21) {
        return result;
      }
      int v28 = 136316162;
      uint64_t v29 = v19;
      __int16 v30 = 2080;
      uint64_t v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      __int16 v32 = 1024;
      int v33 = 245;
      __int16 v34 = 2112;
      id v35 = v13;
      __int16 v36 = 2048;
      id v37 = self;
      uint32_t v18 = " [%s] %s:%d %@(%p) topic must not be nil";
LABEL_34:
      int v24 = v20;
      uint32_t v25 = 48;
      goto LABEL_35;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      uint32_t v16 = *MEMORY[0x1E4F47A50];
      BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v17) {
        return result;
      }
      int v28 = 136315650;
      uint64_t v29 = v15;
      __int16 v30 = 2080;
      uint64_t v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      __int16 v32 = 1024;
      int v33 = 245;
      uint32_t v18 = " [%s] %s:%d topic must not be nil";
LABEL_29:
      int v24 = v16;
      uint32_t v25 = 28;
LABEL_35:
      _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v28, v25);
    }
    return 0;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (!a3 && (isKindOfClass & 1) != 0)
  {
    if ((VCControlChannelDialog *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        unsigned int v14 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        unsigned int v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v27) {
        return result;
      }
      int v28 = 136316162;
      uint64_t v29 = v26;
      __int16 v30 = 2080;
      uint64_t v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      __int16 v32 = 1024;
      int v33 = 247;
      __int16 v34 = 2112;
      id v35 = v14;
      __int16 v36 = 2048;
      id v37 = self;
      uint32_t v18 = " [%s] %s:%d %@(%p) message must not be nil";
      goto LABEL_34;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint32_t v16 = *MEMORY[0x1E4F47A50];
      BOOL v23 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
      BOOL result = 0;
      if (!v23) {
        return result;
      }
      int v28 = 136315650;
      uint64_t v29 = v22;
      __int16 v30 = 2080;
      uint64_t v31 = "-[VCControlChannelDialog sendReliableMessage:withTopic:timeout:withOptions:]";
      __int16 v32 = 1024;
      int v33 = 247;
      uint32_t v18 = " [%s] %s:%d message must not be nil";
      goto LABEL_29;
    }
    return 0;
  }
  objc_sync_enter(self);
  if (self->_isHandshakeMode)
  {
    if (self->_isHandshakeCommenced) {
      [(VCControlChannelDialog *)self cacheOutgoingMessage:a3 topic:a4 timeout:a5 withOptions:a6];
    }
    else {
      [(VCControlChannelDialog *)self startHandshakeWithMessage:a3 topic:a4 withOptions:a6];
    }
    objc_sync_exit(self);
    return 1;
  }
  else
  {
    objc_sync_exit(self);
    return [(VCControlChannelDialog *)self sendReliableMessageInternal:a3 withTopic:a4 timeout:a5 useFastRetries:0 withOptions:a6];
  }
}

- (BOOL)sendReliableMessageInternal:(id)a3 withTopic:(id)a4 timeout:(id)a5 useFastRetries:(BOOL)a6 withOptions:(id)a7
{
  BOOL v8 = a6;
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = (void *)MEMORY[0x1E4E56580](&self->_weakTransactionDelegate, a2);
  objc_sync_enter(self);
  cf = v13;
  uint64_t v14 = [v13 nextTransactionID];
  uint64_t v15 = [(VCControlChannelDialog *)self newDataFromMessage:a3 topic:a4 transactionID:v14 isReliable:1 transactionDelegate:v13];
  if (!v15)
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]();
        }
      }
      goto LABEL_55;
    }
    if (objc_opt_respondsToSelector()) {
      uint64_t v43 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v43 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3
      || (uint64_t v53 = VRTraceErrorLogLevelToCSTR(),
          v54 = *MEMORY[0x1E4F47A50],
          !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
    {
LABEL_55:
      objc_sync_exit(self);
      BOOL v29 = 0;
      goto LABEL_27;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v65 = v53;
    __int16 v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    __int16 v68 = 1024;
    int v69 = 288;
    __int16 v70 = 2112;
    *(void *)v71 = v43;
    *(_WORD *)&v71[8] = 2048;
    *(void *)&v71[10] = self;
    __int16 v50 = " [%s] %s:%d %@(%p) messageData should not be nil";
    uint64_t v51 = v54;
    uint32_t v52 = 48;
LABEL_62:
    _os_log_error_impl(&dword_1E1EA4000, v51, OS_LOG_TYPE_ERROR, v50, buf, v52);
    goto LABEL_55;
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_transactions, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v14), "stringValue")))
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_55;
      }
      uint64_t v46 = VRTraceErrorLogLevelToCSTR();
      int v47 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      unsigned int sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)buf = 136316418;
      uint64_t v65 = v46;
      __int16 v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      __int16 v68 = 1024;
      int v69 = 290;
      __int16 v70 = 1024;
      *(_DWORD *)v71 = sessionID;
      *(_WORD *)&v71[4] = 2112;
      *(void *)&v71[6] = participantID;
      *(_WORD *)&v71[14] = 2048;
      *(void *)&v71[16] = v14;
      __int16 v50 = " [%s] %s:%d sendReliableMessageInternal: attempt to send duplicate transaction detected for _sessionID='%d',"
            " _participantID='%@', transactionID='%llu'. Aborted send...";
      uint64_t v51 = v47;
      uint32_t v52 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v44 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v44 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_55;
      }
      uint64_t v55 = VRTraceErrorLogLevelToCSTR();
      v56 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_55;
      }
      unsigned int v59 = self->_sessionID;
      v60 = self->_participantID;
      *(_DWORD *)buf = 136316930;
      uint64_t v65 = v55;
      __int16 v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      __int16 v68 = 1024;
      int v69 = 290;
      __int16 v70 = 2112;
      *(void *)v71 = v44;
      *(_WORD *)&v71[8] = 2048;
      *(void *)&v71[10] = self;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v59;
      __int16 v72 = 2112;
      v73 = v60;
      __int16 v74 = 2048;
      uint64_t v75 = v14;
      __int16 v50 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: attempt to send duplicate transaction detected for _sessionI"
            "D='%d', _participantID='%@', transactionID='%llu'. Aborted send...";
      uint64_t v51 = v56;
      uint32_t v52 = 74;
    }
    goto LABEL_62;
  }
  objc_sync_exit(self);
  id v61 = a5;
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_14;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint32_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    unsigned int v19 = self->_sessionID;
    uint64_t v20 = self->_participantID;
    *(_DWORD *)buf = 136316674;
    uint64_t v65 = v17;
    __int16 v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    __int16 v68 = 1024;
    int v69 = 293;
    __int16 v70 = 1024;
    *(_DWORD *)v71 = v19;
    *(_WORD *)&v71[4] = 2112;
    *(void *)&v71[6] = v20;
    *(_WORD *)&v71[14] = 2048;
    *(void *)&v71[16] = v14;
    __int16 v72 = 2112;
    v73 = v15;
    BOOL v21 = " [%s] %s:%d sendReliableMessageInternal: creating a new transaction for _sessionID='%d', _participantID='%@', "
          "transactionID='%llu', data='%@'";
    uint64_t v22 = v18;
    uint32_t v23 = 64;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v16 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      uint32_t v16 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_14;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_14;
    }
    unsigned int v26 = self->_sessionID;
    BOOL v27 = self->_participantID;
    *(_DWORD *)buf = 136317186;
    uint64_t v65 = v24;
    __int16 v66 = 2080;
    v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
    __int16 v68 = 1024;
    int v69 = 293;
    __int16 v70 = 2112;
    *(void *)v71 = v16;
    *(_WORD *)&v71[8] = 2048;
    *(void *)&v71[10] = self;
    *(_WORD *)&v71[18] = 1024;
    *(_DWORD *)&v71[20] = v26;
    __int16 v72 = 2112;
    v73 = v27;
    __int16 v74 = 2048;
    uint64_t v75 = v14;
    __int16 v76 = 2112;
    v77 = v15;
    BOOL v21 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: creating a new transaction for _sessionID='%d', _participantID"
          "='%@', transactionID='%llu', data='%@'";
    uint64_t v22 = v25;
    uint32_t v23 = 84;
  }
  _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
LABEL_14:
  int v28 = [[VCControlChannelTransaction alloc] initWithTransportSessionID:self->_sessionID participantID:self->_participantID transactionID:v14 transactionDelegate:cf];
  if (v28)
  {
    objc_sync_enter(self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_transactions, "setObject:forKeyedSubscript:", v28, objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v14), "stringValue"));
    objc_sync_exit(self);
    BOOL v29 = [(VCControlChannelTransaction *)v28 sendReliableMessage:v15 sessionID:self->_sessionID participantID:self->_participantID timeout:v61 useFastRetries:v8 withOptions:a7];

    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      unsigned int v33 = self->_sessionID;
      __int16 v34 = self->_participantID;
      *(_DWORD *)buf = 136316674;
      uint64_t v65 = v31;
      __int16 v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      __int16 v68 = 1024;
      int v69 = 305;
      __int16 v70 = 1024;
      *(_DWORD *)v71 = v33;
      *(_WORD *)&v71[4] = 2112;
      *(void *)&v71[6] = v34;
      *(_WORD *)&v71[14] = 2048;
      *(void *)&v71[16] = v14;
      __int16 v72 = 2112;
      v73 = v15;
      id v35 = " [%s] %s:%d sendReliableMessageInternal: Remove transaction for _sessionID='%d', _participantID='%@', transa"
            "ctionID='%llu', data='%@'";
      __int16 v36 = v32;
      uint32_t v37 = 64;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v30 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_26;
      }
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      int v39 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_26;
      }
      unsigned int v40 = self->_sessionID;
      uint64_t v41 = self->_participantID;
      *(_DWORD *)buf = 136317186;
      uint64_t v65 = v38;
      __int16 v66 = 2080;
      v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
      __int16 v68 = 1024;
      int v69 = 305;
      __int16 v70 = 2112;
      *(void *)v71 = v30;
      *(_WORD *)&v71[8] = 2048;
      *(void *)&v71[10] = self;
      *(_WORD *)&v71[18] = 1024;
      *(_DWORD *)&v71[20] = v40;
      __int16 v72 = 2112;
      v73 = v41;
      __int16 v74 = 2048;
      uint64_t v75 = v14;
      __int16 v76 = 2112;
      v77 = v15;
      id v35 = " [%s] %s:%d %@(%p) sendReliableMessageInternal: Remove transaction for _sessionID='%d', _participantID='%@',"
            " transactionID='%llu', data='%@'";
      __int16 v36 = v39;
      uint32_t v37 = 84;
    }
    _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v35, buf, v37);
LABEL_26:
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __99__VCControlChannelDialog_sendReliableMessageInternal_withTopic_timeout_useFastRetries_withOptions___block_invoke;
    v63[3] = &unk_1E6DB4568;
    v63[4] = self;
    v63[5] = v14;
    [cf scheduleAfter:4 block:v63];
    goto LABEL_27;
  }
  if ((VCControlChannelDialog *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v45 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      int v45 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v57 = VRTraceErrorLogLevelToCSTR();
      v58 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v65 = v57;
        __int16 v66 = 2080;
        v67 = "-[VCControlChannelDialog sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:]";
        __int16 v68 = 1024;
        int v69 = 296;
        __int16 v70 = 2112;
        *(void *)v71 = v45;
        *(_WORD *)&v71[8] = 2048;
        *(void *)&v71[10] = self;
        _os_log_error_impl(&dword_1E1EA4000, v58, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) failed to create transaction", buf, 0x30u);
      }
    }
  }
  BOOL v29 = 0;
LABEL_27:

  if (cf) {
    CFRelease(cf);
  }
  return v29;
}

uint64_t __99__VCControlChannelDialog_sendReliableMessageInternal_withTopic_timeout_useFastRetries_withOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeTransactionForTransactionID:*(unsigned int *)(a1 + 40)];
}

- (BOOL)sendUnreliableMessage:(id)a3 withTopic:(id)a4 sessionID:(unsigned int)a5 participantID:(id)a6 transactionDelegate:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v13 = [a7 nextTransactionID];
  id v14 = [(VCControlChannelDialog *)self newDataFromMessage:a3 topic:a4 transactionID:v13 isReliable:0 transactionDelegate:a7];
  if (v14)
  {
    BOOL v15 = +[VCControlChannelTransaction sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:](VCControlChannelTransaction, "sendUnreliableMessage:sessionID:participantID:transactionID:transactionDelegate:withOptions:", v14, v9, a6, [NSNumber numberWithUnsignedLongLong:v13], a7, 0);
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        uint32_t v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136316674;
          uint64_t v29 = v17;
          __int16 v30 = 2080;
          uint64_t v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          __int16 v32 = 1024;
          int v33 = 333;
          __int16 v34 = 1024;
          *(_DWORD *)id v35 = v9;
          *(_WORD *)&v35[4] = 2112;
          *(void *)&v35[6] = a6;
          *(_WORD *)&v35[14] = 2048;
          *(void *)&v35[16] = v13;
          __int16 v36 = 2112;
          id v37 = a3;
          unsigned int v19 = " [%s] %s:%d Dialog send unreliable message for sessionID='%d', participantID='%@', transactionID='%llu', message='%@'";
          uint64_t v20 = v18;
          uint32_t v21 = 64;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v28, v21);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v16 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        uint32_t v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v28 = 136317186;
          uint64_t v29 = v22;
          __int16 v30 = 2080;
          uint64_t v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          __int16 v32 = 1024;
          int v33 = 333;
          __int16 v34 = 2112;
          *(void *)id v35 = v16;
          *(_WORD *)&v35[8] = 2048;
          *(void *)&v35[10] = self;
          *(_WORD *)&v35[18] = 1024;
          *(_DWORD *)&v35[20] = v9;
          __int16 v36 = 2112;
          id v37 = a6;
          __int16 v38 = 2048;
          uint64_t v39 = v13;
          __int16 v40 = 2112;
          id v41 = a3;
          unsigned int v19 = " [%s] %s:%d %@(%p) Dialog send unreliable message for sessionID='%d', participantID='%@', transactionID="
                "'%llu', message='%@'";
          uint64_t v20 = v23;
          uint32_t v21 = 84;
          goto LABEL_12;
        }
      }
    }
  }
  else
  {
    if ((VCControlChannelDialog *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v25 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v25 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        BOOL v27 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          int v28 = 136316162;
          uint64_t v29 = v26;
          __int16 v30 = 2080;
          uint64_t v31 = "-[VCControlChannelDialog sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:]";
          __int16 v32 = 1024;
          int v33 = 326;
          __int16 v34 = 2112;
          *(void *)id v35 = v25;
          *(_WORD *)&v35[8] = 2048;
          *(void *)&v35[10] = self;
          _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) messageData should not be nil", (uint8_t *)&v28, 0x30u);
        }
      }
    }
    BOOL v15 = 0;
  }

  return v15;
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
}

- (void)confirmTransaction:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  id v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_transactions, "objectForKeyedSubscript:", [a3 stringValue]);
  objc_sync_exit(self);
  uint64_t v6 = (VCControlChannelDialog *)objc_opt_class();
  if (v5)
  {
    if (v6 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_16;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      unsigned int sessionID = self->_sessionID;
      participantID = self->_participantID;
      *(_DWORD *)uint64_t v31 = 136316418;
      *(void *)&v31[4] = v9;
      *(_WORD *)&v31[12] = 2080;
      *(void *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
      *(_WORD *)&v31[22] = 1024;
      *(_DWORD *)__int16 v32 = 350;
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = sessionID;
      *(_WORD *)&v32[10] = 2112;
      *(void *)&v32[12] = participantID;
      *(_WORD *)&v32[20] = 2112;
      *(void *)&v32[22] = a3;
      uint64_t v13 = " [%s] %s:%d confirmTransaction: Found matching transaction for _sessionID='%d', participantID='%@', transactionID='%@'";
      id v14 = v10;
      uint32_t v15 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v7 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_16;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint64_t v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      unsigned int v18 = self->_sessionID;
      unsigned int v19 = self->_participantID;
      *(_DWORD *)uint64_t v31 = 136316930;
      *(void *)&v31[4] = v16;
      *(_WORD *)&v31[12] = 2080;
      *(void *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
      *(_WORD *)&v31[22] = 1024;
      *(_DWORD *)__int16 v32 = 350;
      *(_WORD *)&v32[4] = 2112;
      *(void *)&v32[6] = v7;
      *(_WORD *)&v32[14] = 2048;
      *(void *)&v32[16] = self;
      *(_WORD *)&v32[24] = 1024;
      *(_DWORD *)&v32[26] = v18;
      *(_WORD *)&v32[30] = 2112;
      int v33 = v19;
      LOWORD(v34) = 2112;
      *(void *)((char *)&v34 + 2) = a3;
      uint64_t v13 = " [%s] %s:%d %@(%p) confirmTransaction: Found matching transaction for _sessionID='%d', participantID='%@', t"
            "ransactionID='%@'";
      id v14 = v17;
      uint32_t v15 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v31, v15);
LABEL_16:
    objc_msgSend(v5, "confirmedTransactionByParticipantID:sessionID:", self->_participantID, self->_sessionID, *(_OWORD *)v31, *(void *)&v31[16], *(_OWORD *)v32, *(_OWORD *)&v32[16], v33, v34);

    return;
  }
  if (v6 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint32_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = self->_sessionID;
        uint32_t v23 = self->_participantID;
        *(_DWORD *)uint64_t v31 = 136316418;
        *(void *)&v31[4] = v20;
        *(_WORD *)&v31[12] = 2080;
        *(void *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
        *(_WORD *)&v31[22] = 1024;
        *(_DWORD *)__int16 v32 = 354;
        *(_WORD *)&v32[4] = 1024;
        *(_DWORD *)&v32[6] = v22;
        *(_WORD *)&v32[10] = 2112;
        *(void *)&v32[12] = v23;
        *(_WORD *)&v32[20] = 2112;
        *(void *)&v32[22] = a3;
        uint64_t v24 = " [%s] %s:%d confirmTransaction: Could not find matching transaction for _sessionID='%d', participantID='%@"
              "', transactionID='%@'";
        uint32_t v25 = v21;
        uint32_t v26 = 54;
LABEL_25:
        _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v24, v31, v26);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v8 = (__CFString *)[(VCControlChannelDialog *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v8 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      int v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v29 = self->_sessionID;
        __int16 v30 = self->_participantID;
        *(_DWORD *)uint64_t v31 = 136316930;
        *(void *)&v31[4] = v27;
        *(_WORD *)&v31[12] = 2080;
        *(void *)&v31[14] = "-[VCControlChannelDialog confirmTransaction:]";
        *(_WORD *)&v31[22] = 1024;
        *(_DWORD *)__int16 v32 = 354;
        *(_WORD *)&v32[4] = 2112;
        *(void *)&v32[6] = v8;
        *(_WORD *)&v32[14] = 2048;
        *(void *)&v32[16] = self;
        *(_WORD *)&v32[24] = 1024;
        *(_DWORD *)&v32[26] = v29;
        *(_WORD *)&v32[30] = 2112;
        int v33 = v30;
        LOWORD(v34) = 2112;
        *(void *)((char *)&v34 + 2) = a3;
        uint64_t v24 = " [%s] %s:%d %@(%p) confirmTransaction: Could not find matching transaction for _sessionID='%d', participan"
              "tID='%@', transactionID='%@'";
        uint32_t v25 = v28;
        uint32_t v26 = 74;
        goto LABEL_25;
      }
    }
  }
}

- (NSDictionary)transactions
{
  return &self->_transactions->super;
}

- (void)initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Created VCControlChannelDialog object with remoteParticipantID='%@'");
}

- (void)removeTransactionForTransactionID:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  id v5 = "-[VCControlChannelDialog removeTransactionForTransactionID:]";
  __int16 v6 = 1024;
  int v7 = 125;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d removeTransactionForTransactionID: transactionID='%d' removed from list of transactions", v3, 0x22u);
}

void __78__VCControlChannelDialog_doHandshakeWithMessage_topic_afterDelay_withOptions___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Dialog was flushed. Cancelling handshake...", v2, v3, v4, v5, v6);
}

- (void)sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d messageData should not be nil", v2, v3, v4, v5, v6);
}

- (void)sendReliableMessageInternal:withTopic:timeout:useFastRetries:withOptions:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d failed to create transaction", v2, v3, v4, v5, v6);
}

- (void)sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d messageData should not be nil", v2, v3, v4, v5, v6);
}

@end