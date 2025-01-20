@interface VCSessionMessaging
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7;
- (VCSessionMessaging)initWithControlChannel:(id)a3 remoteVersion:(id)a4;
- (id)allocMessageFromPayload:(id)a3 forTopic:(id)a4 participantID:(id)a5;
- (id)newDictionaryFromUnpackedMessage:(id)a3;
- (id)newDictionaryFromUnpackedMessage:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5;
- (id)newDictionaryFromUnpackedMessageV2:(id)a3;
- (id)newDictionaryFromUnpackedMomentsMessage:(id)a3;
- (id)newPackedMessageFromDictionary:(id)a3;
- (id)newPackedMessageFromDictionary:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5;
- (id)newPackedMessageFromDictionaryV2:(id)a3;
- (id)newPackedMessageFromMomentsDictionary:(id)a3;
- (void)addParticipant:(id)a3 controlChannelProtocolVersion:(int)a4;
- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 receiveHandler:(id)a6;
- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 sendMessageDictionaryCompletionHandler:(id)a7 receiveMessageDictionaryHandler:(id)a8;
- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendCompletionHandler:(id)a6 receiveHandler:(id)a7;
- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendMessageDictionaryCompletionHandler:(id)a6 receiveMessageDictionaryHandler:(id)a7;
- (void)controlChannel:(id)a3 clearTransactionCacheForParticipant:(id)a4;
- (void)controlChannel:(id)a3 receivedMessage:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6;
- (void)controlChannel:(id)a3 sendReliableMessage:(id)a4 didSucceed:(BOOL)a5 toParticipant:(id)a6;
- (void)controlChannel:(id)a3 topic:(id)a4 payload:(id)a5 transactionID:(unsigned int)a6 fromParticipant:(id)a7;
- (void)dealloc;
- (void)searchMatchingTopic:(id)a3 payload:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6;
- (void)sendMessage:(id)a3 withTopic:(id)a4;
- (void)sendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)sendMessageDictionary:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)startMessaging;
- (void)stopMessaging;
@end

@implementation VCSessionMessaging

- (VCSessionMessaging)initWithControlChannel:(id)a3 remoteVersion:(id)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionMessaging;
  v5 = [(VCSessionMessaging *)&v7 init];
  if (v5)
  {
    v5->topics = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:0];
    v5->participants = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    objc_storeWeak(&v5->controlChannelWeak, a3);
    [a3 setMessageReceivedDelegate:v5];
  }
  return v5;
}

- (void)addParticipant:(id)a3 controlChannelProtocolVersion:(int)a4
{
  uint64_t v6 = [NSNumber numberWithUnsignedInt:*(void *)&a4];
  participants = self->participants;

  [(NSMutableDictionary *)participants setObject:v6 forKeyedSubscript:a3];
}

- (void)startMessaging
{
  v4[5] = *MEMORY[0x1E4F143B8];
  global_queue = dispatch_get_global_queue(0, 0);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__VCSessionMessaging_startMessaging__block_invoke;
  v4[3] = &unk_1E6DB3DC8;
  v4[4] = self;
  dispatch_async(global_queue, v4);
}

void __36__VCSessionMessaging_startMessaging__block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4E589F0]();
  [objc_loadWeak((id *)(*(void *)(a1 + 32) + 16)) setMessageReceivedDelegate:*(void *)(a1 + 32)];
  v3 = *(void **)(a1 + 32);
  objc_sync_enter(v3);
  v4 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) objectEnumerator];
  while (1)
  {
    v5 = (void *)[v4 nextObject];
    if (!v5) {
      break;
    }
    [v5 setIsSendingEnabled:1];
  }
  objc_sync_exit(v3);
}

- (void)stopMessaging
{
  v3 = (void *)MEMORY[0x1E4E589F0](self, a2);
  [objc_loadWeak(&self->controlChannelWeak) setMessageReceivedDelegate:0];
  objc_sync_enter(self);
  v4 = (void *)[(NSMutableDictionary *)self->topics objectEnumerator];
  while (1)
  {
    v5 = (void *)[v4 nextObject];
    if (!v5) {
      break;
    }
    [v5 setIsSendingEnabled:0];
  }

  self->topics = 0;
  objc_sync_exit(self);
}

- (void)dealloc
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v7 = v3;
      __int16 v8 = 2080;
      v9 = "-[VCSessionMessaging dealloc]";
      __int16 v10 = 1024;
      int v11 = 77;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging dealloc", buf, 0x1Cu);
    }
  }

  objc_storeWeak(&self->controlChannelWeak, 0);
  v5.receiver = self;
  v5.super_class = (Class)VCSessionMessaging;
  [(VCSessionMessaging *)&v5 dealloc];
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 receiveHandler:(id)a6
{
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendMessageDictionaryCompletionHandler:(id)a6 receiveMessageDictionaryHandler:(id)a7
{
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 requireReliable:(BOOL)a6 sendMessageDictionaryCompletionHandler:(id)a7 receiveMessageDictionaryHandler:(id)a8
{
  v11[7] = *MEMORY[0x1E4F143B8];
  if (a7)
  {
    v9 = v11;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __152__VCSessionMessaging_addTopic_associatedStrings_allowConcurrent_requireReliable_sendMessageDictionaryCompletionHandler_receiveMessageDictionaryHandler___block_invoke;
    v11[3] = &unk_1E6DB9438;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = a7;
  }
  else
  {
    v9 = 0;
  }
  __int16 v10 = [[VCSessionMessageTopic alloc] initWithTopicKey:a3 strings:a4 allowConcurrent:a5 requireReliable:a6 controlChannel:objc_loadWeak(&self->controlChannelWeak) sendMessageDataCompletionHandler:v9 receiveMessageDictionaryHandler:a8];
  objc_sync_enter(self);
  [(NSMutableDictionary *)self->topics setObject:v10 forKeyedSubscript:[(VCSessionMessageTopic *)v10 topicKey]];
  objc_sync_exit(self);
}

void __152__VCSessionMessaging_addTopic_associatedStrings_allowConcurrent_requireReliable_sendMessageDictionaryCompletionHandler_receiveMessageDictionaryHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if ([*(id *)(*(void *)(a1 + 32) + 24) objectForKeyedSubscript:a4]) {
    uint64_t v7 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "objectForKeyedSubscript:", a4), "intValue");
  }
  else {
    uint64_t v7 = 1;
  }
  id v8 = (id)[*(id *)(a1 + 32) newDictionaryFromUnpackedMessage:a2 forTopic:*(void *)(a1 + 40) controlChannelVersion:v7];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)addTopic:(id)a3 associatedStrings:(id)a4 allowConcurrent:(BOOL)a5 sendCompletionHandler:(id)a6 receiveHandler:(id)a7
{
  id v8 = [[VCSessionMessageTopic alloc] initWithTopicKey:a3 strings:a4 allowConcurrent:a5 controlChannel:objc_loadWeak(&self->controlChannelWeak) sendCompletionHandler:a6 receiveHandler:a7];
  objc_sync_enter(self);
  [(NSMutableDictionary *)self->topics setObject:v8 forKeyedSubscript:[(VCSessionMessageTopic *)v8 topicKey]];
  objc_sync_exit(self);
}

- (void)sendMessage:(id)a3 withTopic:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  uint64_t v7 = (void *)[(NSMutableDictionary *)self->topics objectForKeyedSubscript:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    v9 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136316418;
      uint64_t v11 = v8;
      __int16 v12 = 2080;
      v13 = "-[VCSessionMessaging sendMessage:withTopic:]";
      __int16 v14 = 1024;
      int v15 = 166;
      __int16 v16 = 2112;
      id v17 = a3;
      __int16 v18 = 2112;
      id v19 = a4;
      __int16 v20 = 2112;
      v21 = v7;
      _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage:%@, %@, %@", (uint8_t *)&v10, 0x3Au);
    }
  }
  [v7 sendMessage:a3];
  objc_sync_exit(self);
}

- (void)sendMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  v9 = (void *)[(NSMutableDictionary *)self->topics objectForKeyedSubscript:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 136316674;
      uint64_t v13 = v10;
      __int16 v14 = 2080;
      int v15 = "-[VCSessionMessaging sendMessage:withTopic:participantID:]";
      __int16 v16 = 1024;
      int v17 = 176;
      __int16 v18 = 2112;
      id v19 = a3;
      __int16 v20 = 2048;
      unint64_t v21 = a5;
      __int16 v22 = 2112;
      id v23 = a4;
      __int16 v24 = 2112;
      v25 = v9;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage:%@ for participantID:%llu, %@, %@", (uint8_t *)&v12, 0x44u);
    }
  }
  [v9 sendMessage:a3 participantID:a5];
  objc_sync_exit(self);
}

- (void)sendMessageDictionary:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  v9 = (void *)[(NSMutableDictionary *)self->topics objectForKeyedSubscript:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136316674;
      uint64_t v15 = v10;
      __int16 v16 = 2080;
      int v17 = "-[VCSessionMessaging sendMessageDictionary:withTopic:participantID:]";
      __int16 v18 = 1024;
      int v19 = 186;
      __int16 v20 = 2112;
      id v21 = a3;
      __int16 v22 = 2048;
      unint64_t v23 = a5;
      __int16 v24 = 2112;
      id v25 = a4;
      __int16 v26 = 2112;
      v27 = v9;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessageDictionary=%@ for participantID=%llu, topicKey=%@, topic=%@", (uint8_t *)&v14, 0x44u);
    }
  }
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a5]))
  {
    uint64_t v12 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5)), "intValue");
  }
  else
  {
    uint64_t v12 = 1;
  }
  id v13 = [(VCSessionMessaging *)self newPackedMessageFromDictionary:a3 forTopic:a4 controlChannelVersion:v12];
  [v9 sendMessage:v13 participantID:a5];

  objc_sync_exit(self);
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 withOptions:(id)a6 completion:(id)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  id v13 = (void *)[(NSMutableDictionary *)self->topics objectForKeyedSubscript:a4];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v20 = v14;
      __int16 v21 = 2080;
      __int16 v22 = "-[VCSessionMessaging sendReliableMessage:withTopic:participantID:withOptions:completion:]";
      __int16 v23 = 1024;
      int v24 = 204;
      __int16 v25 = 2112;
      id v26 = a3;
      __int16 v27 = 2048;
      unint64_t v28 = a5;
      __int16 v29 = 2112;
      id v30 = a4;
      __int16 v31 = 2112;
      v32 = v13;
      _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCSessionMessaging: sendMessage=%@ for participantID=%llu, topicKey=%@, topic=%@", buf, 0x44u);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__VCSessionMessaging_sendReliableMessage_withTopic_participantID_withOptions_completion___block_invoke;
  v18[3] = &unk_1E6DB9460;
  v18[4] = a7;
  char v16 = [v13 sendReliableMessage:a3 participantID:a5 withOptions:a6 completion:v18];
  objc_sync_exit(self);
  return v16;
}

uint64_t __89__VCSessionMessaging_sendReliableMessage_withTopic_participantID_withOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)newPackedMessageFromDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v4 = (void *)[a3 allKeys];
  if ([v4 count]
    && (long long v19 = 0u,
        long long v20 = 0u,
        long long v17 = 0u,
        long long v18 = 0u,
        (uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v16 count:16]) != 0))
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v11 = [a3 objectForKeyedSubscript:v10];
        if (v10) {
          BOOL v12 = v11 == 0;
        }
        else {
          BOOL v12 = 1;
        }
        if (!v12)
        {
          if (v7) {
            uint64_t v13 = [NSString stringWithFormat:@"%@%@=%@:", v7, v10, v11];
          }
          else {
            uint64_t v13 = [NSString stringWithFormat:@"%@=%@:", v10, v11, v15];
          }
          uint64_t v7 = (void *)v13;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (id)newDictionaryFromUnpackedMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v3 = (void *)[a3 componentsSeparatedByString:@":"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      uint64_t v10 = objc_msgSend(v9, "rangeOfCharacterFromSet:", objc_msgSend(MEMORY[0x1E4F28B88], "characterSetWithCharactersInString:", @"="));
      if (v10 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v16[1] = objc_msgSend(v9, "substringFromIndex:", v10 + 1, objc_msgSend(v9, "substringToIndex:", v10));
        uint64_t v11 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v16 count:2];
        uint64_t v12 = [v11 objectAtIndexedSubscript:0];
        uint64_t v13 = [v11 objectAtIndexedSubscript:1];
        if (v12)
        {
          uint64_t v14 = v13;
          if (v13)
          {
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            }
            [v6 setObject:v14 forKeyedSubscript:v12];
          }
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v17 count:16];
  }
  while (v5);
  return v6;
}

- (id)newPackedMessageFromMomentsDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v4 = (void *)[a3 allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = v5;
  id v7 = 0;
  uint64_t v8 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v17 != v8) {
        objc_enumerationMutation(v4);
      }
      uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
      uint64_t v11 = [a3 objectForKeyedSubscript:v10];
      if (v10) {
        BOOL v12 = v11 == 0;
      }
      else {
        BOOL v12 = 1;
      }
      if (!v12)
      {
        uint64_t v13 = v11;
        if (!v7) {
          id v7 = objc_alloc_init(MEMORY[0x1E4F28E78]);
        }
        [v7 appendFormat:@"%@=%@?", v10, v13];
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v15 count:16];
  }
  while (v6);
  return v7;
}

- (id)newDictionaryFromUnpackedMomentsMessage:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  uint64_t v3 = (void *)[a3 componentsSeparatedByString:@"?"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  id v6 = 0;
  uint64_t v7 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v3);
      }
      v9 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) componentsSeparatedByString:@"="];
      if ((unint64_t)[v9 count] >= 2)
      {
        uint64_t v10 = [v9 objectAtIndexedSubscript:0];
        uint64_t v11 = [v9 objectAtIndexedSubscript:1];
        if (!v6) {
          id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        [v6 setObject:v11 forKeyedSubscript:v10];
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v13 count:16];
  }
  while (v5);
  return v6;
}

- (id)newPackedMessageFromDictionaryV2:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMessaging newPackedMessageFromDictionaryV2:]();
      }
    }
    goto LABEL_14;
  }
  if (([MEMORY[0x1E4F28F98] propertyList:a3 isValidForFormat:200] & 1) == 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMessaging newPackedMessageFromDictionaryV2:]();
      }
    }
    goto LABEL_14;
  }
  uint64_t v8 = 0;
  uint64_t v4 = (void *)[MEMORY[0x1E4F28F98] dataWithPropertyList:a3 format:200 options:0 error:&v8];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        BOOL v12 = "-[VCSessionMessaging newPackedMessageFromDictionaryV2:]";
        __int16 v13 = 1024;
        int v14 = 316;
        __int16 v15 = 2112;
        id v16 = a3;
        __int16 v17 = 2112;
        uint64_t v18 = v8;
        _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d newPackedMessageFromDictionaryV2 failed to create binary plist for dictionary=%@ with error=%@", buf, 0x30u);
      }
    }
LABEL_14:
    uint64_t v4 = 0;
  }
  return v4;
}

- (id)newDictionaryFromUnpackedMessageV2:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v12 = 0;
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionMessaging newDictionaryFromUnpackedMessageV2:]();
      }
    }
    goto LABEL_11;
  }
  __int16 v11 = 0;
  uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:a3 options:0 format:&v12 error:&v11];
  if (!v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v14 = v7;
        __int16 v15 = 2080;
        id v16 = "-[VCSessionMessaging newDictionaryFromUnpackedMessageV2:]";
        __int16 v17 = 1024;
        int v18 = 331;
        __int16 v19 = 2112;
        id v20 = a3;
        __int16 v21 = 2112;
        id v22 = v11;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 failed to create property list from message=%@ with error=%@", buf, 0x30u);
      }
    }
LABEL_11:
    uint64_t v5 = 0;
    return v5;
  }
  uint64_t v5 = (void *)v4;
  if (v12 != (void *)200 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      id v16 = "-[VCSessionMessaging newDictionaryFromUnpackedMessageV2:]";
      __int16 v17 = 1024;
      int v18 = 332;
      __int16 v19 = 2048;
      id v20 = v12;
      __int16 v21 = 2112;
      id v22 = a3;
      _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 unexpected format=%lu received from message=%@", buf, 0x30u);
    }
  }
  return v5;
}

- (id)newPackedMessageFromDictionary:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5
{
  if (a5 == 2)
  {
    return -[VCSessionMessaging newPackedMessageFromDictionaryV2:](self, "newPackedMessageFromDictionaryV2:", a3, a4);
  }
  else if (a5 == 1)
  {
    if ([a4 isEqualToString:@"VCSessionMomentsStateMessageTopic"])
    {
      return [(VCSessionMessaging *)self newPackedMessageFromMomentsDictionary:a3];
    }
    else
    {
      return [(VCSessionMessaging *)self newPackedMessageFromDictionary:a3];
    }
  }
  else
  {
    return 0;
  }
}

- (id)newDictionaryFromUnpackedMessage:(id)a3 forTopic:(id)a4 controlChannelVersion:(int)a5
{
  if (a5 == 2)
  {
    return -[VCSessionMessaging newDictionaryFromUnpackedMessageV2:](self, "newDictionaryFromUnpackedMessageV2:", a3, a4);
  }
  else if (a5 == 1)
  {
    if ([a4 isEqualToString:@"VCSessionMomentsStateMessageTopic"])
    {
      return [(VCSessionMessaging *)self newDictionaryFromUnpackedMomentsMessage:a3];
    }
    else
    {
      return [(VCSessionMessaging *)self newDictionaryFromUnpackedMessage:a3];
    }
  }
  else
  {
    return 0;
  }
}

- (void)searchMatchingTopic:(id)a3 payload:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (a3) {
    __int16 v21 = (__CFString *)[NSString stringWithFormat:@"%@:", a3];
  }
  else {
    __int16 v21 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    __int16 v11 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v23 = v10;
      __int16 v24 = 2080;
      __int16 v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
      __int16 v26 = 1024;
      int v27 = 388;
      __int16 v28 = 2112;
      uint64_t v29 = (uint64_t)v21;
      __int16 v30 = 2112;
      id v31 = a4;
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate receivedMessage callback with message '%@%@'", buf, 0x30u);
    }
  }
  BOOL v12 = (void *)[(NSMutableDictionary *)self->topics objectEnumerator];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  while (1)
  {
    uint64_t v14 = (void *)[v12 nextObject];
    if (!v14) {
      break;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      id v16 = *MEMORY[0x1E4F47A50];
      __int16 v17 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v18 = [v14 topicKey];
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v15;
          __int16 v24 = 2080;
          __int16 v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
          __int16 v26 = 1024;
          int v27 = 393;
          __int16 v28 = 2112;
          uint64_t v29 = v18;
          __int16 v30 = 2112;
          id v31 = v21;
          __int16 v32 = 2112;
          id v33 = a4;
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Is topic '%@' assisiated with incoming message '%@%@' block...", buf, 0x3Au);
        }
      }
      else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v19 = [v14 topicKey];
        *(_DWORD *)buf = 136316418;
        uint64_t v23 = v15;
        __int16 v24 = 2080;
        __int16 v25 = "-[VCSessionMessaging searchMatchingTopic:payload:transactionID:fromParticipant:]";
        __int16 v26 = 1024;
        int v27 = 393;
        __int16 v28 = 2112;
        uint64_t v29 = v19;
        __int16 v30 = 2112;
        id v31 = v21;
        __int16 v32 = 2112;
        id v33 = a4;
        _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Is topic '%@' assisiated with incoming message '%@%@' block...", buf, 0x3Au);
      }
    }
    if ((objc_msgSend((id)objc_msgSend(v14, "topicKey"), "isEqualToString:", a3) & 1) != 0
      || (isKindOfClass & 1) != 0 && [v14 isPayloadAssociated:a4])
    {
      [v14 passMessage:a4 sequence:v7 fromParticipant:a6];
    }
  }
  objc_sync_exit(self);
}

- (void)controlChannel:(id)a3 receivedMessage:(id)a4 transactionID:(unsigned int)a5 fromParticipant:(id)a6
{
}

- (id)allocMessageFromPayload:(id)a3 forTopic:(id)a4 participantID:(id)a5
{
  if ([(NSMutableDictionary *)self->participants objectForKeyedSubscript:a5]) {
    uint64_t v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->participants, "objectForKeyedSubscript:", a5), "intValue");
  }
  else {
    uint64_t v9 = 1;
  }
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->topics, "objectForKeyedSubscript:", a4), "expectedMessageType") == 1)
  {
    if (v9 == 1)
    {
      if (!a3)
      {
LABEL_12:
        id v11 = [(VCSessionMessaging *)self newDictionaryFromUnpackedMessage:a3 forTopic:a4 controlChannelVersion:v9];
        goto LABEL_14;
      }
      id v10 = (id)[[NSString alloc] initWithData:a3 encoding:4];
    }
    else
    {
      id v10 = a3;
    }
    a3 = v10;
    goto LABEL_12;
  }
  if (a3)
  {
    id v11 = (id)[[NSString alloc] initWithData:a3 encoding:4];
    a3 = 0;
  }
  else
  {
    id v11 = 0;
  }
LABEL_14:

  return v11;
}

- (void)controlChannel:(id)a3 topic:(id)a4 payload:(id)a5 transactionID:(unsigned int)a6 fromParticipant:(id)a7
{
  uint64_t v8 = *(void *)&a6;
  unint64_t v11 = [(VCSessionMessaging *)self allocMessageFromPayload:a5 forTopic:a4 participantID:a7];
  if ((unint64_t)a4 | v11)
  {
    [(VCSessionMessaging *)self searchMatchingTopic:a4 payload:v11 transactionID:v8 fromParticipant:a7];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSessionMessaging controlChannel:topic:payload:transactionID:fromParticipant:]();
    }
  }
}

- (void)controlChannel:(id)a3 sendReliableMessage:(id)a4 didSucceed:(BOOL)a5 toParticipant:(id)a6
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      unint64_t v11 = "-[VCSessionMessaging controlChannel:sendReliableMessage:didSucceed:toParticipant:]";
      __int16 v12 = 1024;
      int v13 = 443;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate sendReliableMessage callback...", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

- (void)controlChannel:(id)a3 clearTransactionCacheForParticipant:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315650;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      int v13 = "-[VCSessionMessaging controlChannel:clearTransactionCacheForParticipant:]";
      __int16 v14 = 1024;
      int v15 = 448;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d VCControlChannelDelegate clearParticipantTransactionCacheForParticipant callback...", (uint8_t *)&v10, 0x1Cu);
    }
  }
  int v8 = (void *)[(NSMutableDictionary *)self->topics objectEnumerator];
  while (1)
  {
    uint64_t v9 = (void *)[v8 nextObject];
    if (!v9) {
      break;
    }
    [v9 clearTransactionCacheForParticipant:a4];
  }
  objc_sync_exit(self);
}

- (void)newPackedMessageFromDictionaryV2:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newPackedMessageFromDictionaryV2 tuples must not be nil", v2, v3, v4, v5, v6);
}

- (void)newPackedMessageFromDictionaryV2:.cold.2()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCSessionMessaging newPackedMessageFromDictionaryV2:]";
  __int16 v6 = 1024;
  int v7 = 309;
  __int16 v8 = 2112;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d newPackedMessageFromDictionaryV2 can't save as binary dictionary=%@", v3, 0x26u);
}

- (void)newDictionaryFromUnpackedMessageV2:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newDictionaryFromUnpackedMessageV2 message must not be nil", v2, v3, v4, v5, v6);
}

- (void)controlChannel:topic:payload:transactionID:fromParticipant:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Topic and payload can not be both nil", v2, v3, v4, v5, v6);
}

@end