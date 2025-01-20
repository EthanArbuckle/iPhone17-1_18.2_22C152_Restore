@interface VCSessionMessageTopic
- (BOOL)attemptToSendOrBufferReliableMessage:(id)a3 participantID:(unint64_t)a4 sequenceNumber:(int64_t)a5 retryNumber:(int64_t)a6;
- (BOOL)isDuplicateMessageID:(id)a3 messageHistory:(id)a4 participantID:(id)a5;
- (BOOL)isPayloadAssociated:(id)a3;
- (BOOL)isSendingEnabled;
- (BOOL)sendReliableMessage:(id)a3 participantID:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6;
- (NSString)topicKey;
- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 controlChannel:(id)a6 sendCompletionHandler:(id)a7 receiveHandler:(id)a8;
- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendCompletionHandler:(id)a8 receiveHandler:(id)aBlock sendMessageDataCompletionHandler:(id)a10 receiveMessageDictionaryHandler:(id)a11;
- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendMessageDataCompletionHandler:(id)a8 receiveMessageDictionaryHandler:(id)a9;
- (id)messageForCommand:(id)a3;
- (int)expectedMessageType;
- (void)clearTransactionCacheForParticipant:(id)a3;
- (void)dealloc;
- (void)dispatchedCompletionHandlerForSendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 result:(BOOL)a6 sequenceNumber:(int64_t)a7 retryNumber:(int64_t)a8;
- (void)dispatchedSendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6;
- (void)handleSendMessageDidSucceed:(BOOL)a3 message:(id)a4 participantID:(id)a5;
- (void)passMessage:(id)a3 sequence:(int)a4 fromParticipant:(id)a5;
- (void)purgeExpiredEntries:(double)a3 messageHistory:(id)a4 participantID:(id)a5;
- (void)sendBufferedReliableMessagesForParticipantID:(unint64_t)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 participantID:(unint64_t)a4;
- (void)sendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6;
- (void)setIsSendingEnabled:(BOOL)a3;
@end

@implementation VCSessionMessageTopic

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 controlChannel:(id)a6 sendCompletionHandler:(id)a7 receiveHandler:(id)a8
{
  return [(VCSessionMessageTopic *)self initWithTopicKey:a3 strings:a4 allowConcurrent:a5 requireReliable:1 controlChannel:a6 sendCompletionHandler:a7 receiveHandler:a8 sendMessageDataCompletionHandler:0 receiveMessageDictionaryHandler:0];
}

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendMessageDataCompletionHandler:(id)a8 receiveMessageDictionaryHandler:(id)a9
{
  return [(VCSessionMessageTopic *)self initWithTopicKey:a3 strings:a4 allowConcurrent:a5 requireReliable:a6 controlChannel:a7 sendCompletionHandler:0 receiveHandler:0 sendMessageDataCompletionHandler:a8 receiveMessageDictionaryHandler:a9];
}

- (VCSessionMessageTopic)initWithTopicKey:(id)a3 strings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 controlChannel:(id)a7 sendCompletionHandler:(id)a8 receiveHandler:(id)aBlock sendMessageDataCompletionHandler:(id)a10 receiveMessageDictionaryHandler:(id)a11
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)VCSessionMessageTopic;
  v17 = [(VCSessionMessageTopic *)&v21 init];
  v17->topicKey = (NSString *)[a3 copy];
  v17->controlChannel = (VCControlChannel *)a7;
  if (a4)
  {
    v17->associatedStrings = (NSArray *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithArray:a4];
    v17->shouldEncodeTopicKeyInMessage = 0;
    [(VCControlChannel *)v17->controlChannel addOptionalTopic:v17->topicKey];
  }
  else
  {
    v17->associatedStrings = 0;
    v17->shouldEncodeTopicKeyInMessage = 1;
  }
  v17->allowConcurrent = a5;
  v17->requireReliable = a6;
  if (a8) {
    v17->sendMessageCompletionBlock = _Block_copy(a8);
  }
  if (aBlock) {
    v17->receiveMessageBlock = _Block_copy(aBlock);
  }
  if (a10) {
    v17->sendMessageDataCompletionBlock = _Block_copy(a10);
  }
  if (a11) {
    v17->receiveMessageDictionaryBlock = _Block_copy(a11);
  }
  v17->transactionCache = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17->_sendMessageBuffers = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v17->latestOutgoingMessageIndex = 0;
  v17->isSendingEnabled = 1;
  CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
  if (v17->allowConcurrent) {
    v19 = MEMORY[0x1E4F14430];
  }
  else {
    v19 = 0;
  }
  v17->_outMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionMessageTopic.outMessageQueue", v19, CustomRootQueue);
  return v17;
}

- (int)expectedMessageType
{
  return self->receiveMessageDictionaryBlock != 0;
}

- (void)dealloc
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      v5 = [(NSString *)self->topicKey UTF8String];
      *(_DWORD *)buf = 136315906;
      uint64_t v14 = v3;
      __int16 v15 = 2080;
      v16 = "-[VCSessionMessageTopic dealloc]";
      __int16 v17 = 1024;
      int v18 = 126;
      __int16 v19 = 2080;
      v20 = v5;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessageTopic with topic %s dealloc", buf, 0x26u);
    }
  }

  id sendMessageCompletionBlock = self->sendMessageCompletionBlock;
  if (sendMessageCompletionBlock) {
    _Block_release(sendMessageCompletionBlock);
  }
  id sendMessageDataCompletionBlock = self->sendMessageDataCompletionBlock;
  if (sendMessageDataCompletionBlock) {
    _Block_release(sendMessageDataCompletionBlock);
  }
  id receiveMessageBlock = self->receiveMessageBlock;
  if (receiveMessageBlock) {
    _Block_release(receiveMessageBlock);
  }
  id receiveMessageDictionaryBlock = self->receiveMessageDictionaryBlock;
  if (receiveMessageDictionaryBlock) {
    _Block_release(receiveMessageDictionaryBlock);
  }
  outMessageQueue = self->_outMessageQueue;
  if (outMessageQueue) {
    dispatch_release(outMessageQueue);
  }
  inMessageQueue = self->inMessageQueue;
  if (inMessageQueue) {
    dispatch_release(inMessageQueue);
  }

  v12.receiver = self;
  v12.super_class = (Class)VCSessionMessageTopic;
  [(VCSessionMessageTopic *)&v12 dealloc];
}

- (BOOL)isPayloadAssociated:(id)a3
{
  objc_sync_enter(self);
  BOOL shouldEncodeTopicKeyInMessage = self->shouldEncodeTopicKeyInMessage;
  if (self->shouldEncodeTopicKeyInMessage)
  {
    LOBYTE(a3) = [a3 hasPrefix:self->topicKey];
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = [(NSArray *)self->associatedStrings containsObject:a3];
  }
  objc_sync_exit(self);
  if (shouldEncodeTopicKeyInMessage) {
    char v7 = (char)a3;
  }
  else {
    char v7 = v6;
  }
  return v7 & 1;
}

- (void)setIsSendingEnabled:(BOOL)a3
{
  objc_sync_enter(self);
  self->isSendingEnabled = a3;

  objc_sync_exit(self);
}

- (void)sendMessage:(id)a3
{
}

- (id)messageForCommand:(id)a3
{
  if (self->shouldEncodeTopicKeyInMessage) {
    return (id)[NSString stringWithFormat:@"%@:%@", self->topicKey, a3];
  }
  else {
    return a3;
  }
}

- (void)sendMessage:(id)a3 participantID:(unint64_t)a4
{
  objc_sync_enter(self);
  int64_t latestOutgoingMessageIndex = self->latestOutgoingMessageIndex;
  self->int64_t latestOutgoingMessageIndex = latestOutgoingMessageIndex + 1;
  objc_sync_exit(self);

  [(VCSessionMessageTopic *)self sendMessage:a3 participantID:a4 withSequence:(int)latestOutgoingMessageIndex numRetries:0];
}

- (void)handleSendMessageDidSucceed:(BOOL)a3 message:(id)a4 participantID:(id)a5
{
  id sendMessageCompletionBlock = (void (**)(id, id, BOOL, id))self->sendMessageCompletionBlock;
  if (sendMessageCompletionBlock
    || (id sendMessageCompletionBlock = (void (**)(id, id, BOOL, id))self->sendMessageDataCompletionBlock) != 0)
  {
    sendMessageCompletionBlock[2](sendMessageCompletionBlock, a4, a3, a5);
  }
}

- (BOOL)sendReliableMessage:(id)a3 participantID:(unint64_t)a4 withOptions:(id)a5 completion:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    objc_super v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v19 = v11;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCSessionMessageTopic sendReliableMessage:participantID:withOptions:completion:]";
      __int16 v22 = 1024;
      int v23 = 207;
      __int16 v24 = 2112;
      v25 = [(VCSessionMessageTopic *)self topicKey];
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendReliableMessage topic=%@", buf, 0x26u);
    }
  }
  controlChannel = self->controlChannel;
  uint64_t v14 = [(VCSessionMessageTopic *)self topicKey];
  uint64_t v15 = [(VCControlChannel *)self->controlChannel reliableMessageResendInterval];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __82__VCSessionMessageTopic_sendReliableMessage_participantID_withOptions_completion___block_invoke;
  v17[3] = &unk_1E6DB9460;
  v17[4] = a6;
  return [(VCControlChannel *)controlChannel sendReliableMessage:a3 withTopic:v14 participantID:a4 timeout:v15 withOptions:a5 completion:v17];
}

uint64_t __82__VCSessionMessageTopic_sendReliableMessage_participantID_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (self->isSendingEnabled)
  {
    if (a6 < 8)
    {
      objc_sync_enter(self);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          topicKey = self->topicKey;
          BOOL requireReliable = self->requireReliable;
          BOOL allowConcurrent = self->allowConcurrent;
          int64_t latestOutgoingMessageIndex = self->latestOutgoingMessageIndex;
          *(_DWORD *)buf = 136317186;
          uint64_t v21 = v12;
          __int16 v22 = 2080;
          int v23 = "-[VCSessionMessageTopic sendMessage:participantID:withSequence:numRetries:]";
          __int16 v24 = 1024;
          int v25 = 227;
          __int16 v26 = 2112;
          v27 = topicKey;
          __int16 v28 = 1024;
          BOOL v29 = requireReliable;
          __int16 v30 = 1024;
          BOOL v31 = allowConcurrent;
          __int16 v32 = 1024;
          int v33 = a5;
          __int16 v34 = 1024;
          int v35 = latestOutgoingMessageIndex;
          __int16 v36 = 1024;
          int v37 = a6;
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d sendMessage topic=%@ reliable=%d, concurent=%d, outgoingIndex=%d, lastOutgoingIndex=%d, retries=%d", buf, 0x44u);
        }
      }
      if (self->requireReliable)
      {
        if (!a6 || self->latestOutgoingMessageIndex - 1 <= a5)
        {
          outMessageQueue = self->_outMessageQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __75__VCSessionMessageTopic_sendMessage_participantID_withSequence_numRetries___block_invoke;
          block[3] = &unk_1E6DB9528;
          block[4] = self;
          block[5] = a3;
          block[6] = a4;
          block[7] = a5;
          block[8] = a6;
          dispatch_async(outMessageQueue, block);
        }
      }
      else
      {
        [(VCControlChannel *)self->controlChannel sendUnreliableMessage:a3 withTopic:self->topicKey participantID:a4];
      }
      objc_sync_exit(self);
    }
    else
    {
      uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a4, a4, a5);
      [(VCSessionMessageTopic *)self handleSendMessageDidSucceed:0 message:a3 participantID:v10];
    }
  }
}

uint64_t __75__VCSessionMessageTopic_sendMessage_participantID_withSequence_numRetries___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedSendMessage:*(void *)(a1 + 40) participantID:*(void *)(a1 + 48) withSequence:*(void *)(a1 + 56) numRetries:*(void *)(a1 + 64)];
}

- (void)dispatchedSendMessage:(id)a3 participantID:(unint64_t)a4 withSequence:(int64_t)a5 numRetries:(int64_t)a6
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  if (!self->isSendingEnabled) {
    return;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v11 = [(VCControlChannel *)self->controlChannel sendReliableMessageAndWait:[(VCSessionMessageTopic *)self messageForCommand:a3] withTopic:self->topicKey];
    if ((VCSessionMessageTopic *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_37;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      int v18 = "FAILURE";
      uint64_t v47 = v16;
      *(_DWORD *)buf = 136315906;
      v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
      __int16 v48 = 2080;
      if (v11) {
        int v18 = "SUCCESS";
      }
      __int16 v50 = 1024;
      int v51 = 268;
      __int16 v52 = 2080;
      v53 = (void *)v18;
      uint64_t v19 = " [%s] %s:%d sendReliableMessageAndWait result=%s";
      __int16 v20 = v17;
      uint32_t v21 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_37;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      int v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_37;
      }
      __int16 v24 = "FAILURE";
      uint64_t v47 = v22;
      *(_DWORD *)buf = 136316418;
      v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
      __int16 v48 = 2080;
      if (v11) {
        __int16 v24 = "SUCCESS";
      }
      __int16 v50 = 1024;
      int v51 = 268;
      __int16 v52 = 2112;
      v53 = v13;
      __int16 v54 = 2048;
      unint64_t v55 = (unint64_t)self;
      __int16 v56 = 2080;
      unint64_t v57 = (unint64_t)v24;
      uint64_t v19 = " [%s] %s:%d %@(%p) sendReliableMessageAndWait result=%s";
      __int16 v20 = v23;
      uint32_t v21 = 58;
    }
    goto LABEL_35;
  }
  if (self->allowConcurrent)
  {
    BOOL v11 = [(VCControlChannel *)self->controlChannel sendReliableMessageAndWait:a3 withTopic:self->topicKey participantID:a4];
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        BOOL v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          __int16 v30 = "FAILURE";
          *(_DWORD *)buf = 136317442;
          uint64_t v47 = v28;
          v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
          __int16 v48 = 2080;
          if (v11) {
            __int16 v30 = "SUCCESS";
          }
          __int16 v50 = 1024;
          int v51 = 257;
          __int16 v52 = 2112;
          v53 = v12;
          __int16 v54 = 2048;
          unint64_t v55 = (unint64_t)self;
          __int16 v56 = 2080;
          unint64_t v57 = (unint64_t)v30;
          __int16 v58 = 2048;
          unint64_t v59 = a4;
          __int16 v60 = 2048;
          unint64_t v61 = a5;
          __int16 v62 = 2048;
          int64_t v63 = a6;
          __int16 v64 = 2112;
          int64_t v65 = (int64_t)a3;
          uint64_t v19 = " [%s] %s:%d %@(%p) sendReliableMessageAndWait result=%s, participantID=%llu, index=%ld, retry=%ld, payload=%@";
          __int16 v20 = v29;
          uint32_t v21 = 98;
          goto LABEL_35;
        }
      }
LABEL_37:
      char v31 = 0;
      if (v11) {
        goto LABEL_38;
      }
      goto LABEL_54;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_37;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    __int16 v26 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_37;
    }
    v27 = "FAILURE";
    *(_DWORD *)buf = 136316930;
    uint64_t v47 = v25;
    v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
    __int16 v48 = 2080;
    if (v11) {
      v27 = "SUCCESS";
    }
    __int16 v50 = 1024;
    int v51 = 257;
    __int16 v52 = 2080;
    v53 = (void *)v27;
    __int16 v54 = 2048;
    unint64_t v55 = a4;
    __int16 v56 = 2048;
    unint64_t v57 = a5;
    __int16 v58 = 2048;
    unint64_t v59 = a6;
    __int16 v60 = 2112;
    unint64_t v61 = (unint64_t)a3;
    uint64_t v19 = " [%s] %s:%d sendReliableMessageAndWait result=%s, participantID=%llu, index=%ld, retry=%ld, payload=%@";
    __int16 v20 = v26;
    uint32_t v21 = 78;
LABEL_35:
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    if (!v11) {
      goto LABEL_54;
    }
LABEL_39:
    -[VCSessionMessageTopic handleSendMessageDidSucceed:message:participantID:](self, "handleSendMessageDidSucceed:message:participantID:", 1, a3, [NSNumber numberWithUnsignedLongLong:a4]);
    return;
  }
  BOOL v14 = [(VCSessionMessageTopic *)self attemptToSendOrBufferReliableMessage:a3 participantID:a4 sequenceNumber:a5 retryNumber:a6];
  if ((VCSessionMessageTopic *)objc_opt_class() != self)
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v15 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v15 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v39 = VRTraceErrorLogLevelToCSTR();
      v40 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        v41 = "FAILURE";
        topicKey = self->topicKey;
        *(_DWORD *)buf = 136317698;
        if (v14) {
          v41 = "SUCCESS";
        }
        uint64_t v47 = v39;
        __int16 v48 = 2080;
        v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
        __int16 v50 = 1024;
        int v51 = 263;
        __int16 v52 = 2112;
        v53 = v15;
        __int16 v54 = 2048;
        unint64_t v55 = (unint64_t)self;
        __int16 v56 = 2080;
        unint64_t v57 = (unint64_t)v41;
        __int16 v58 = 2112;
        unint64_t v59 = (unint64_t)topicKey;
        __int16 v60 = 2048;
        unint64_t v61 = a4;
        __int16 v62 = 2048;
        int64_t v63 = a5;
        __int16 v64 = 2048;
        int64_t v65 = a6;
        __int16 v66 = 2112;
        id v67 = a3;
        __int16 v36 = " [%s] %s:%d %@(%p) attemptToSendOrBufferReliableMessage result=%s, topic=%@ participantID=%llu, index=%ld,"
              " retry=%ld, payload=%@";
        int v37 = v40;
        uint32_t v38 = 108;
        goto LABEL_51;
      }
    }
LABEL_53:
    char v31 = 1;
    if (v14)
    {
LABEL_38:
      if (v31) {
        return;
      }
      goto LABEL_39;
    }
LABEL_54:
    dispatch_time_t v43 = dispatch_time(0, 2000000000);
    outMessageQueue = self->_outMessageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__VCSessionMessageTopic_dispatchedSendMessage_participantID_withSequence_numRetries___block_invoke;
    block[3] = &unk_1E6DB9528;
    block[4] = self;
    block[5] = a3;
    block[6] = a4;
    block[7] = a5;
    block[8] = a6;
    dispatch_after(v43, outMessageQueue, block);
    return;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
    goto LABEL_53;
  }
  uint64_t v32 = VRTraceErrorLogLevelToCSTR();
  int v33 = *MEMORY[0x1E4F47A50];
  if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_53;
  }
  __int16 v34 = self->topicKey;
  int v35 = "FAILURE";
  *(_DWORD *)buf = 136317186;
  if (v14) {
    int v35 = "SUCCESS";
  }
  uint64_t v47 = v32;
  __int16 v48 = 2080;
  v49 = "-[VCSessionMessageTopic dispatchedSendMessage:participantID:withSequence:numRetries:]";
  __int16 v50 = 1024;
  int v51 = 263;
  __int16 v52 = 2080;
  v53 = (void *)v35;
  __int16 v54 = 2112;
  unint64_t v55 = (unint64_t)v34;
  __int16 v56 = 2048;
  unint64_t v57 = a4;
  __int16 v58 = 2048;
  unint64_t v59 = a5;
  __int16 v60 = 2048;
  unint64_t v61 = a6;
  __int16 v62 = 2112;
  int64_t v63 = (int64_t)a3;
  __int16 v36 = " [%s] %s:%d attemptToSendOrBufferReliableMessage result=%s, topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
  int v37 = v33;
  uint32_t v38 = 88;
LABEL_51:
  _os_log_impl(&dword_1E1EA4000, v37, OS_LOG_TYPE_DEFAULT, v36, buf, v38);
  if (!v14) {
    goto LABEL_54;
  }
}

uint64_t __85__VCSessionMessageTopic_dispatchedSendMessage_participantID_withSequence_numRetries___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessage:*(void *)(a1 + 40) participantID:*(void *)(a1 + 48) withSequence:*(void *)(a1 + 56) numRetries:*(void *)(a1 + 64) + 1];
}

- (BOOL)attemptToSendOrBufferReliableMessage:(id)a3 participantID:(unint64_t)a4 sequenceNumber:(int64_t)a5 retryNumber:(int64_t)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_outMessageQueue);
  if (!-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a4]))
  {
    uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sendMessageBuffers, "setObject:forKeyedSubscript:", v11, [NSNumber numberWithUnsignedLongLong:a4]);
  }
  uint64_t v12 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a4]);
  if (!v12)
  {
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v17 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_29;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      __int16 v20 = *MEMORY[0x1E4F47A50];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      int v29 = 136316418;
      uint64_t v30 = v19;
      __int16 v31 = 2080;
      uint64_t v32 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
      __int16 v33 = 1024;
      int v34 = 297;
      __int16 v35 = 2112;
      __int16 v36 = v17;
      __int16 v37 = 2048;
      uint32_t v38 = self;
      __int16 v39 = 2048;
      unint64_t v40 = a4;
      uint32_t v21 = " [%s] %s:%d %@(%p) Cannot create sendMessageBuffer for participantID=%llu";
      uint64_t v22 = v20;
      uint32_t v23 = 58;
LABEL_28:
      _os_log_error_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v29, v23);
      goto LABEL_29;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      -[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]();
    }
LABEL_29:
    LOBYTE(v16) = 0;
    return v16;
  }
  if (!a3)
  {
    if ((VCSessionMessageTopic *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        int v18 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
      }
      else {
        int v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_29;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      int v29 = 136316162;
      uint64_t v30 = v26;
      __int16 v31 = 2080;
      uint64_t v32 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
      __int16 v33 = 1024;
      int v34 = 299;
      __int16 v35 = 2112;
      __int16 v36 = v18;
      __int16 v37 = 2048;
      uint32_t v38 = self;
      uint32_t v21 = " [%s] %s:%d %@(%p) Cannot send or buffer with a nil message";
      uint64_t v22 = v27;
      uint32_t v23 = 48;
      goto LABEL_28;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v16) {
        return v16;
      }
      -[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:](v24, v25);
    }
    goto LABEL_29;
  }
  v13 = v12;
  uint64_t v14 = [v12 count];
  uint64_t v15 = [[VCSessionMessageBufferElement alloc] initWithMessage:a3 sequenceNumber:a5 retryNumber:a6];
  [v13 addObject:v15];

  if (!v14) {
    [(VCSessionMessageTopic *)self sendBufferedReliableMessagesForParticipantID:a4];
  }
  LOBYTE(v16) = 1;
  return v16;
}

- (void)sendBufferedReliableMessagesForParticipantID:(unint64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_outMessageQueue);
  v5 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a3]);
  if (v5)
  {
    BOOL v6 = (void *)[v5 firstObject];
    if (v6)
    {
      char v7 = v6;
      uint64_t v8 = [v6 message];
      uint64_t v9 = [v7 sequenceNumber];
      uint64_t v10 = [v7 retryNumber];
      controlChannel = self->controlChannel;
      topicKey = self->topicKey;
      uint64_t v13 = [(VCControlChannel *)controlChannel reliableMessageResendInterval];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke;
      v17[3] = &unk_1E6DB9578;
      v17[4] = self;
      void v17[5] = v8;
      v17[6] = a3;
      v17[7] = v9;
      v17[8] = v10;
      [(VCControlChannel *)controlChannel sendReliableMessage:v8 withTopic:topicKey participantID:a3 timeout:v13 completion:v17];
    }
  }
  else if ((VCSessionMessageTopic *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v14 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v14 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      BOOL v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        uint32_t v21 = "-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]";
        __int16 v22 = 1024;
        int v23 = 319;
        __int16 v24 = 2112;
        uint64_t v25 = v14;
        __int16 v26 = 2048;
        v27 = self;
        __int16 v28 = 2048;
        unint64_t v29 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Cannot retrieve sendMessageBuffer for participantID=%llu", buf, 0x3Au);
      }
    }
  }
}

__n128 __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke(uint64_t a1, char a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke_2;
  block[3] = &unk_1E6DB9550;
  long long v2 = *(_OWORD *)(a1 + 32);
  long long v3 = *(_OWORD *)(a1 + 48);
  v4 = *(NSObject **)(*(void *)(a1 + 32) + 32);
  char v10 = a2;
  long long v7 = v2;
  long long v8 = v3;
  uint64_t v9 = *(void *)(a1 + 64);
  dispatch_async(v4, block);
  return result;
}

uint64_t __70__VCSessionMessageTopic_sendBufferedReliableMessagesForParticipantID___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedCompletionHandlerForSendMessage:*(void *)(a1 + 40) withTopic:*(void *)(*(void *)(a1 + 32) + 16) participantID:*(void *)(a1 + 48) result:*(unsigned __int8 *)(a1 + 72) sequenceNumber:*(void *)(a1 + 56) retryNumber:*(void *)(a1 + 64)];
}

- (void)dispatchedCompletionHandlerForSendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 result:(BOOL)a6 sequenceNumber:(int64_t)a7 retryNumber:(int64_t)a8
{
  BOOL v10 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  if ((VCSessionMessageTopic *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_16;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    __int16 v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_16;
    }
    int v18 = "FAILURE";
    uint64_t v43 = v16;
    *(_DWORD *)buf = 136317186;
    v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNumber:retryNumber:]";
    __int16 v44 = 2080;
    if (v10) {
      int v18 = "SUCCESS";
    }
    __int16 v46 = 1024;
    int v47 = 345;
    __int16 v48 = 2080;
    unint64_t v49 = (unint64_t)v18;
    __int16 v50 = 2112;
    uint64_t v51 = (uint64_t)a4;
    __int16 v52 = 2048;
    unint64_t v53 = a5;
    __int16 v54 = 2048;
    int64_t v55 = a7;
    __int16 v56 = 2048;
    unint64_t v57 = a8;
    __int16 v58 = 2112;
    int64_t v59 = (int64_t)a3;
    uint64_t v19 = " [%s] %s:%d sendReliableMessage result=%s topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
    __int16 v20 = v17;
    uint32_t v21 = 88;
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v15 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v15 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      __int16 v24 = "FAILURE";
      *(_DWORD *)buf = 136317698;
      uint64_t v43 = v22;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      __int16 v44 = 2080;
      if (v10) {
        __int16 v24 = "SUCCESS";
      }
      __int16 v46 = 1024;
      int v47 = 345;
      __int16 v48 = 2112;
      unint64_t v49 = (unint64_t)v15;
      __int16 v50 = 2048;
      uint64_t v51 = (uint64_t)self;
      __int16 v52 = 2080;
      unint64_t v53 = (unint64_t)v24;
      __int16 v54 = 2112;
      int64_t v55 = (int64_t)a4;
      __int16 v56 = 2048;
      unint64_t v57 = a5;
      __int16 v58 = 2048;
      int64_t v59 = a7;
      __int16 v60 = 2048;
      int64_t v61 = a8;
      __int16 v62 = 2112;
      id v63 = a3;
      uint64_t v19 = " [%s] %s:%d %@(%p) sendReliableMessage result=%s topic=%@ participantID=%llu, index=%ld, retry=%ld, payload=%@";
      __int16 v20 = v23;
      uint32_t v21 = 108;
LABEL_15:
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, buf, v21);
    }
  }
LABEL_16:
  if (v10)
  {
    -[VCSessionMessageTopic handleSendMessageDidSucceed:message:participantID:](self, "handleSendMessageDidSucceed:message:participantID:", 1, a3, [NSNumber numberWithUnsignedLongLong:a5]);
  }
  else
  {
    dispatch_time_t v25 = dispatch_time(0, 2000000000);
    outMessageQueue = self->_outMessageQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __125__VCSessionMessageTopic_dispatchedCompletionHandlerForSendMessage_withTopic_participantID_result_sequenceNumber_retryNumber___block_invoke;
    block[3] = &unk_1E6DB9528;
    void block[4] = self;
    block[5] = a3;
    block[6] = a5;
    block[7] = a7;
    block[8] = a8;
    dispatch_after(v25, outMessageQueue, block);
  }
  v27 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_sendMessageBuffers, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a5]);
  if ([v27 count])
  {
    __int16 v28 = (void *)[v27 objectAtIndexedSubscript:0];
    if ([v28 sequenceNumber] == a7 && objc_msgSend(v28, "retryNumber") == a8)
    {
      [v27 removeObjectAtIndex:0];
      goto LABEL_32;
    }
    if ((VCSessionMessageTopic *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_32;
      }
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      __int16 v31 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      uint64_t v32 = [v28 sequenceNumber];
      uint64_t v33 = [v28 retryNumber];
      *(_DWORD *)buf = 136316930;
      uint64_t v43 = v30;
      __int16 v44 = 2080;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      __int16 v46 = 1024;
      int v47 = 360;
      __int16 v48 = 2048;
      unint64_t v49 = a5;
      __int16 v50 = 2048;
      uint64_t v51 = v32;
      __int16 v52 = 2048;
      unint64_t v53 = a7;
      __int16 v54 = 2048;
      int64_t v55 = v33;
      __int16 v56 = 2048;
      unint64_t v57 = a8;
      int v34 = " [%s] %s:%d Cannot match element in participantMessageBuffer for participantID=%llu, element index=%ld, inde"
            "x=%ld, element retry=%ld, retry=%ld";
      __int16 v35 = v31;
      uint32_t v36 = 78;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unint64_t v29 = (__CFString *)[(VCSessionMessageTopic *)self performSelector:sel_logPrefix];
      }
      else {
        unint64_t v29 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_32;
      }
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      uint32_t v38 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_32;
      }
      uint64_t v39 = [v28 sequenceNumber];
      uint64_t v40 = [v28 retryNumber];
      *(_DWORD *)buf = 136317442;
      uint64_t v43 = v37;
      __int16 v44 = 2080;
      v45 = "-[VCSessionMessageTopic dispatchedCompletionHandlerForSendMessage:withTopic:participantID:result:sequenceNum"
            "ber:retryNumber:]";
      __int16 v46 = 1024;
      int v47 = 360;
      __int16 v48 = 2112;
      unint64_t v49 = (unint64_t)v29;
      __int16 v50 = 2048;
      uint64_t v51 = (uint64_t)self;
      __int16 v52 = 2048;
      unint64_t v53 = a5;
      __int16 v54 = 2048;
      int64_t v55 = v39;
      __int16 v56 = 2048;
      unint64_t v57 = a7;
      __int16 v58 = 2048;
      int64_t v59 = v40;
      __int16 v60 = 2048;
      int64_t v61 = a8;
      int v34 = " [%s] %s:%d %@(%p) Cannot match element in participantMessageBuffer for participantID=%llu, element index=%l"
            "d, index=%ld, element retry=%ld, retry=%ld";
      __int16 v35 = v38;
      uint32_t v36 = 98;
    }
    _os_log_error_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_ERROR, v34, buf, v36);
  }
LABEL_32:
  [(VCSessionMessageTopic *)self sendBufferedReliableMessagesForParticipantID:a5];
}

uint64_t __125__VCSessionMessageTopic_dispatchedCompletionHandlerForSendMessage_withTopic_participantID_result_sequenceNumber_retryNumber___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) sendMessage:*(void *)(a1 + 40) participantID:*(void *)(a1 + 48) withSequence:*(void *)(a1 + 56) numRetries:*(void *)(a1 + 64) + 1];
}

- (BOOL)isDuplicateMessageID:(id)a3 messageHistory:(id)a4 participantID:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = [a4 objectForKeyedSubscript:@"replayThreshold"];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    unint64_t v10 = [a3 unsignedLongLongValue];
    if (v10 <= [v9 unsignedLongLongValue])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v22 = VRTraceErrorLogLevelToCSTR();
        int v23 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v31 = v22;
          __int16 v32 = 2080;
          uint64_t v33 = "-[VCSessionMessageTopic isDuplicateMessageID:messageHistory:participantID:]";
          __int16 v34 = 1024;
          int v35 = 374;
          __int16 v36 = 2112;
          id v37 = a5;
          __int16 v38 = 2112;
          id v39 = a3;
          __int16 v40 = 2112;
          uint64_t v41 = (uint64_t)v9;
          __int16 v20 = " [%s] %s:%d ParticipantID=%@: Message too old: transactionID=%@, replayProtectionThreshold=%@";
          uint32_t v21 = v23;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, 0x3Au);
        }
      }
LABEL_16:
      LOBYTE(v12) = 1;
      return v12;
    }
  }
  uint64_t v11 = (void *)[a4 objectForKeyedSubscript:@"messageHistory"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v27;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v11);
      }
      uint64_t v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
      if (objc_msgSend(a3, "isEqualToNumber:", objc_msgSend(v16, "objectForKeyedSubscript:", @"messageID")))break; {
      if (v13 == ++v15)
      }
      {
        uint64_t v12 = [v11 countByEnumeratingWithState:&v26 objects:v25 count:16];
        uint64_t v13 = v12;
        if (v12) {
          goto LABEL_5;
        }
        return v12;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v19 = [v16 objectForKeyedSubscript:@"expireTime"];
        *(_DWORD *)buf = 136316418;
        uint64_t v31 = v17;
        __int16 v32 = 2080;
        uint64_t v33 = "-[VCSessionMessageTopic isDuplicateMessageID:messageHistory:participantID:]";
        __int16 v34 = 1024;
        int v35 = 378;
        __int16 v36 = 2112;
        id v37 = a5;
        __int16 v38 = 2112;
        id v39 = a3;
        __int16 v40 = 2112;
        uint64_t v41 = v19;
        __int16 v20 = " [%s] %s:%d ParticipantID=%@: Found duplicate message with transactionID=%@ and expiration time=%@";
        uint32_t v21 = v18;
        goto LABEL_15;
      }
    }
    goto LABEL_16;
  }
  return v12;
}

- (void)purgeExpiredEntries:(double)a3 messageHistory:(id)a4 participantID:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v7 = (void *)[a4 objectForKeyedSubscript:@"messageHistory"];
  unint64_t v8 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", @"replayThreshold"), "unsignedLongLongValue");
  if ([v7 count])
  {
    *(void *)&long long v9 = 136316930;
    long long v17 = v9;
    do
    {
      unint64_t v10 = objc_msgSend(v7, "firstObject", v17);
      objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"expireTime"), "doubleValue");
      double v12 = v11;
      unint64_t v13 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", @"messageID"), "unsignedLongLongValue");
      if (v12 > a3) {
        break;
      }
      unint64_t v14 = v13;
      if (v8 <= v13) {
        unint64_t v8 = v13;
      }
      objc_msgSend(a4, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", v8), @"replayThreshold");
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        uint64_t v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v17;
          uint64_t v20 = v15;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCSessionMessageTopic purgeExpiredEntries:messageHistory:participantID:]";
          __int16 v23 = 1024;
          int v24 = 399;
          __int16 v25 = 2112;
          id v26 = a5;
          __int16 v27 = 2048;
          unint64_t v28 = v14;
          __int16 v29 = 2048;
          double v30 = v12;
          __int16 v31 = 2048;
          double v32 = a3;
          __int16 v33 = 2048;
          unint64_t v34 = v8;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ParticipantID=%@: Purging message with transactionID=%llu and expiration time=%f. Current time=%f, replayProtectionThreshold=%llu", buf, 0x4Eu);
        }
      }
      [v7 removeObjectAtIndex:0];
    }
    while ([v7 count]);
  }
}

- (void)passMessage:(id)a3 sequence:(int)a4 fromParticipant:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (!a5) {
    a5 = &unk_1F3DC6318;
  }
  uint64_t v9 = [NSNumber numberWithInt:v6];
  double v10 = micro();
  id v11 = (id)[(NSMutableDictionary *)self->transactionCache objectForKeyedSubscript:a5];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->transactionCache setObject:v11 forKeyedSubscript:a5];
  }
  id v12 = (id)[v11 objectForKeyedSubscript:@"messageHistory"];
  if (!v12)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [v11 setObject:v12 forKeyedSubscript:@"messageHistory"];
  }
  [(VCSessionMessageTopic *)self purgeExpiredEntries:v11 messageHistory:a5 participantID:v10];
  if ([(VCSessionMessageTopic *)self isDuplicateMessageID:v9 messageHistory:v11 participantID:a5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      unint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        topicKey = self->topicKey;
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v13;
        __int16 v29 = 2080;
        double v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        __int16 v31 = 1024;
        int v32 = 452;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)a3;
        __int16 v37 = 2112;
        uint64_t v38 = v9;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)topicKey;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: ParticipantID '%@': Ignoring duplicate message '%@' with transactionID '%@' for topic '%@'", buf, 0x44u);
      }
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend(NSNumber, "numberWithDouble:", v10+ (double)-[VCControlChannel reliableMessageResendInterval](self->controlChannel, "reliableMessageResendInterval"));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v17 = VRTraceErrorLogLevelToCSTR();
      int v18 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v17;
        __int16 v29 = 2080;
        double v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        __int16 v31 = 1024;
        int v32 = 432;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v35 = 2112;
        uint64_t v36 = v9;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v12;
        __int16 v39 = 2112;
        uint64_t v40 = v16;
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: Participant '%@': Added message ID '%@' to message history '%@', expireTime '%@'", buf, 0x44u);
      }
    }
    v25[0] = @"messageID";
    v25[1] = @"expireTime";
    v26[0] = v9;
    v26[1] = v16;
    objc_msgSend(v12, "addObject:", objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        __int16 v21 = self->topicKey;
        *(_DWORD *)buf = 136316674;
        uint64_t v28 = v19;
        __int16 v29 = 2080;
        double v30 = "-[VCSessionMessageTopic passMessage:sequence:fromParticipant:]";
        __int16 v31 = 1024;
        int v32 = 438;
        __int16 v33 = 2112;
        id v34 = a5;
        __int16 v35 = 2112;
        uint64_t v36 = (uint64_t)a3;
        __int16 v37 = 2112;
        uint64_t v38 = v9;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v21;
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d passMessage: ParticipantID '%@': Passing message '%@' with transactionID '%@' for topic '%@'", buf, 0x44u);
      }
    }
    inMessageQueue = self->inMessageQueue;
    if (!inMessageQueue)
    {
      CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
      inMessageQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCSessionMessageTopic.inMessageQueue", 0, CustomRootQueue);
      self->inMessageQueue = inMessageQueue;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__VCSessionMessageTopic_passMessage_sequence_fromParticipant___block_invoke;
    block[3] = &unk_1E6DB43D8;
    void block[4] = self;
    block[5] = a3;
    block[6] = a5;
    dispatch_async((dispatch_queue_t)inMessageQueue, block);
  }

  objc_sync_exit(self);
}

void *__62__VCSessionMessageTopic_passMessage_sequence_fromParticipant___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  uint64_t v2 = *(void *)(v1 + 72);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, void, void, void))(v2 + 16))(v2, result[5], 0, result[6]);
  }
  uint64_t v2 = *(void *)(v1 + 80);
  if (v2) {
    return (void *)(*(uint64_t (**)(uint64_t, void, void, void))(v2 + 16))(v2, result[5], 0, result[6]);
  }
  return result;
}

- (void)clearTransactionCacheForParticipant:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315906;
      uint64_t v8 = v5;
      __int16 v9 = 2080;
      double v10 = "-[VCSessionMessageTopic clearTransactionCacheForParticipant:]";
      __int16 v11 = 1024;
      int v12 = 461;
      __int16 v13 = 2112;
      id v14 = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d clearTransactionCacheForParticipant:%@", (uint8_t *)&v7, 0x26u);
    }
  }
  [(NSMutableDictionary *)self->transactionCache removeObjectForKey:a3];
  objc_sync_exit(self);
}

- (NSString)topicKey
{
  return self->topicKey;
}

- (BOOL)isSendingEnabled
{
  return self->isSendingEnabled;
}

- (void)attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot create sendMessageBuffer for participantID=%llu", v2, *(const char **)v3, (unint64_t)"-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]" >> 16, v4);
}

- (void)attemptToSendOrBufferReliableMessage:(uint64_t)a1 participantID:(NSObject *)a2 sequenceNumber:retryNumber:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCSessionMessageTopic attemptToSendOrBufferReliableMessage:participantID:sequenceNumber:retryNumber:]";
  __int16 v6 = 1024;
  int v7 = 299;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Cannot send or buffer with a nil message", (uint8_t *)&v2, 0x1Cu);
}

- (void)sendBufferedReliableMessagesForParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]";
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cannot retrieve sendMessageBuffer for participantID=%llu", v2, *(const char **)v3, (unint64_t)"-[VCSessionMessageTopic sendBufferedReliableMessagesForParticipantID:]" >> 16, v4);
}

@end