@interface TKSmartCard
+ (BOOL)decodeResponse:(id)a3 sw:(unsigned __int16 *)a4 appendTo:(id)a5 error:(id *)a6;
+ (id)_localizedString:(id)a3;
- (BOOL)beginSessionWithError:(id *)a3;
- (BOOL)checkAPDUResponse:(id)a3 error:(id *)a4;
- (BOOL)inSessionWithError:(NSError *)error executeBlock:(void *)block;
- (BOOL)revalidate;
- (BOOL)selectApplication:(id)a3 error:(id *)a4;
- (BOOL)sensitive;
- (BOOL)synchronous;
- (BOOL)useCommandChaining;
- (BOOL)useExtendedLength;
- (BOOL)valid;
- (NSData)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le sw:(UInt16 *)sw error:(NSError *)error;
- (TKSmartCard)initWithSlot:(id)a3;
- (TKSmartCardProtocol)allowedProtocols;
- (TKSmartCardProtocol)currentProtocol;
- (TKSmartCardSlot)slot;
- (TKSmartCardUserInteractionForSecurePINChange)userInteractionForSecurePINChangeWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU currentPINByteOffset:(NSInteger)currentPINByteOffset newPINByteOffset:(NSInteger)newPINByteOffset;
- (TKSmartCardUserInteractionForSecurePINVerification)userInteractionForSecurePINVerificationWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU PINByteOffset:(NSInteger)PINByteOffset;
- (UInt8)cla;
- (id)buildIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 range:(_NSRange)a7 le:(id)a8 protocol:(unint64_t)a9 chained:(BOOL)a10 extended:(BOOL *)a11 realLe:(unint64_t *)a12;
- (id)context;
- (id)contextForKey:(id)a3;
- (id)remoteSessionWithErrorHandler:(id)a3;
- (int64_t)sessionEndPolicy;
- (void)beginSessionWithReply:(void *)reply;
- (void)dealloc;
- (void)encodeLength:(unint64_t)a3 into:(id)a4 sized:(int64_t)a5;
- (void)endSession;
- (void)endSessionWithReply:(id)a3;
- (void)handleApduResponse:(id)a3 body:(id)a4 le:(unint64_t)a5 isCase4:(BOOL)a6 error:(id)a7 reply:(id)a8;
- (void)inSlotQueueExecuteBlock:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)querySessionWithReply:(id)a3;
- (void)releaseSessionWithReply:(id)a3;
- (void)reserveExclusive:(BOOL)a3 reply:(id)a4;
- (void)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le reply:(void *)reply;
- (void)sessionRequested;
- (void)setAllowedProtocols:(TKSmartCardProtocol)allowedProtocols;
- (void)setCla:(UInt8)cla;
- (void)setContext:(id)a3 forKey:(id)a4;
- (void)setContext:(id)context;
- (void)setCurrentProtocol:(unint64_t)a3;
- (void)setSensitive:(BOOL)sensitive;
- (void)setSessionEndPolicy:(int64_t)a3;
- (void)setSynchronous:(BOOL)a3;
- (void)setUseCommandChaining:(BOOL)useCommandChaining;
- (void)setUseExtendedLength:(BOOL)useExtendedLength;
- (void)setValid:(BOOL)a3;
- (void)transmitChunkedIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 fromOffset:(unint64_t)a7 realLe:(unint64_t)a8 chained:(BOOL)a9 isCase4:(BOOL)a10 reply:(id)a11;
- (void)transmitRequest:(NSData *)request reply:(void *)reply;
- (void)unreserve;
@end

@implementation TKSmartCard

+ (id)_localizedString:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  v5 = [v3 bundleWithIdentifier:@"com.apple.CryptoTokenKit"];
  v6 = [v5 localizedStringForKey:v4 value:&stru_1F19EDBB0 table:0];

  return v6;
}

- (TKSmartCard)initWithSlot:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)TKSmartCard;
  v6 = [(TKSmartCard *)&v27 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_slot, a3);
    v7->_valid = 1;
    v8 = NSStringFromSelector(sel_state);
    [v5 addObserver:v7 forKeyPath:v8 options:1 context:0];

    v9 = TK_LOG_smartcard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCard initWithSlot:]((uint64_t)v7);
    }

    v7->_allowedProtocols = 0;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v10 = [(TKSmartCardSlot *)v7->_slot ATR];
    v11 = [v10 protocols];

    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v24;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          v7->_allowedProtocols |= [*(id *)(*((void *)&v23 + 1) + 8 * v15++) unsignedIntegerValue];
        }
        while (v13 != v15);
        uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v13);
    }

    v7->_currentProtocol = 0;
    v7->_sensitive = 0;
    dispatch_queue_t v16 = dispatch_queue_create("beginSessionQueue", 0);
    beginSessionQueue = v7->_beginSessionQueue;
    v7->_beginSessionQueue = (OS_dispatch_queue *)v16;

    v18 = v7->_beginSessionQueue;
    v19 = [(TKSmartCardSlot *)v7->_slot queue];
    dispatch_set_target_queue(v18, v19);

    v20 = objc_alloc_init(MEMORY[0x1E4FBA8A8]);
    syncObject = v7->_syncObject;
    v7->_syncObject = v20;
  }
  return v7;
}

- (id)remoteSessionWithErrorHandler:(id)a3
{
  BOOL synchronous = self->_synchronous;
  id session = self->_session;
  if (synchronous) {
    [session synchronousRemoteObjectProxyWithErrorHandler:a3];
  }
  else {
  id v5 = [session remoteObjectProxyWithErrorHandler:a3];
  }

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (self->_valid)
  {
    uint64_t v12 = NSStringFromSelector(sel_state);
    int v13 = [v9 isEqualToString:v12];

    if (v13)
    {
      uint64_t v14 = [v11 objectForKey:*MEMORY[0x1E4F284C8]];
      uint64_t v15 = [v14 integerValue];

      if (v15 != 2 && v15 != 4)
      {
        v17 = TK_LOG_smartcard();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[TKSmartCard observeValueForKeyPath:ofObject:change:context:]();
        }

        [(TKSmartCard *)self setContext:0 forKey:0];
        v18 = self->_syncObject;
        objc_sync_enter(v18);
        [(TKSmartCard *)self setValid:0];
        [(TKSmartCard *)self setCurrentProtocol:0];
        objc_sync_exit(v18);
      }
    }
  }
}

- (void)setSensitive:(BOOL)sensitive
{
  self->_sensitive = sensitive;
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSynchronous:(BOOL)a3
{
  self->_BOOL synchronous = a3;
}

- (BOOL)synchronous
{
  return self->_synchronous;
}

- (void)releaseSessionWithReply:(id)a3
{
  id v4 = a3;
  id v5 = TK_LOG_smartcard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard releaseSessionWithReply:]();
  }

  [(TKSmartCard *)self setContext:0 forKey:0];
  if (self->_sensitiveRequired)
  {
    [(TKSmartCard *)self setSessionEndPolicy:1];
    self->_sensitiveRequired = 0;
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke;
  v16[3] = &unk_1E63C8380;
  v16[4] = self;
  id v17 = v4;
  id v6 = v4;
  v7 = (void *)MEMORY[0x1C189CA40](v16);
  dispatch_suspend((dispatch_object_t)self->_beginSessionQueue);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_212;
  v14[3] = &unk_1E63C8298;
  id v8 = v7;
  id v15 = v8;
  id v9 = [(TKSmartCard *)self remoteSessionWithErrorHandler:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_213;
  v12[3] = &unk_1E63C8358;
  id v13 = v8;
  id v10 = v8;
  [v9 terminateWithReply:v12];

  id session = self->_session;
  self->_id session = 0;
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) queue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_2;
  v4[3] = &unk_1E63C8380;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async(v2, v4);
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) proxy];
  v3 = [v2 cards];
  [v3 removeObject:*(void *)(a1 + 32)];

  dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 16));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 8);
  uint64_t v6 = *(unsigned __int8 *)(v4 + 26);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_3;
  v10[3] = &unk_1E63C8330;
  v10[4] = v4;
  id v11 = *(id *)(a1 + 40);
  v7 = [v5 synchronous:v6 remoteSlotWithErrorHandler:v10];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__TKSmartCard_releaseSessionWithReply___block_invoke_211;
  v8[3] = &unk_1E63C8358;
  id v9 = *(id *)(a1 + 40);
  [v7 waitForStateFlushedWithReply:v8];
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_211(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_2_212(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_213(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sessionRequested
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, v0, v1, "%{public}@: got request for unused session, releasing it", v2);
}

- (void)inSlotQueueExecuteBlock:(id)a3
{
  if (self->_synchronous)
  {
    slot = self->_slot;
    id v4 = a3;
    uint64_t v6 = [(TKSmartCardSlot *)slot queue];
    dispatch_sync(v6, v4);
  }
  else
  {
    id v5 = (void (*)(void))*((void *)a3 + 2);
    uint64_t v6 = a3;
    v5();
  }
}

- (void)querySessionWithReply:(id)a3
{
  v22[3] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t allowedProtocols = self->_allowedProtocols;
  self->_sessionEndPolicy = 0;
  self->_someoneWantsSession = 0;
  v21[0] = @"protocol";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:allowedProtocols];
  v22[0] = v6;
  v21[1] = @"sensitive";
  v7 = [NSNumber numberWithBool:self->_sensitive];
  v22[1] = v7;
  v21[2] = @"endpolicy";
  id v8 = [NSNumber numberWithInteger:self->_sessionEndPolicy];
  v22[2] = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:3];

  id v10 = TK_LOG_smartcard();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard querySessionWithReply:]();
  }

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __37__TKSmartCard_querySessionWithReply___block_invoke;
  v20[3] = &unk_1E63C80E0;
  v20[4] = self;
  [(TKSmartCard *)self inSlotQueueExecuteBlock:v20];
  slot = self->_slot;
  BOOL synchronous = self->_synchronous;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2;
  v18[3] = &unk_1E63C8330;
  v18[4] = self;
  id v13 = v4;
  id v19 = v13;
  uint64_t v14 = [(TKSmartCardSlot *)slot synchronous:synchronous remoteSlotWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_220;
  v16[3] = &unk_1E63C83F0;
  v16[4] = self;
  id v17 = v13;
  id v15 = v13;
  [v14 sessionWithParameters:v9 reply:v16];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) proxy];
  v2 = [v3 cards];
  [v2 addObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1();
  }

  id v5 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_218;
  v8[3] = &unk_1E63C80E0;
  void v8[4] = v5;
  [v5 inSlotQueueExecuteBlock:v8];
  uint64_t v6 = *(void *)(a1 + 40);
  v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_218(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) proxy];
  v2 = [v3 cards];
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_220(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v7)
  {
    id v10 = *(void **)(a1 + 32);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_222;
    void v21[3] = &unk_1E63C83C8;
    v21[4] = v10;
    id v22 = v7;
    id v23 = v8;
    [v10 inSlotQueueExecuteBlock:v21];
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = *(void **)(v11 + 8);
    uint64_t v13 = *(unsigned __int8 *)(v11 + 26);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_2_227;
    v19[3] = &unk_1E63C8330;
    v19[4] = v11;
    id v20 = *(id *)(a1 + 40);
    uint64_t v14 = [v12 synchronous:v13 remoteSlotWithErrorHandler:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_228;
    v17[3] = &unk_1E63C8358;
    id v18 = *(id *)(a1 + 40);
    [v14 waitForStateFlushedWithReply:v17];
  }
  else
  {
    id v15 = TK_LOG_smartcard();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      __37__TKSmartCard_querySessionWithReply___block_invoke_2_220_cold_1(a1);
    }

    dispatch_queue_t v16 = *(void **)(a1 + 32);
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __37__TKSmartCard_querySessionWithReply___block_invoke_221;
    v24[3] = &unk_1E63C80E0;
    v24[4] = v16;
    [v16 inSlotQueueExecuteBlock:v24];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_221(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) proxy];
  v2 = [v3 cards];
  [v2 removeObject:*(void *)(a1 + 32)];
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_222(uint64_t a1)
{
  uint64_t v1 = a1 + 40;
  v2 = (id *)(a1 + 32);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  id v3 = [*(id *)(v1 + 8) objectForKey:@"protocol"];
  *((void *)*v2 + 14) = [v3 unsignedIntegerValue];

  ++*((void *)*v2 + 5);
  id v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __37__TKSmartCard_querySessionWithReply___block_invoke_2_222_cold_1();
  }

  id v5 = [*((id *)*v2 + 1) ATR];
  uint64_t v6 = [v5 historicalRecords];

  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_226];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = 0;
  }
  else
  {
    id v8 = [v6 objectAtIndexedSubscript:v7];
  }
  id v9 = [v8 value];
  uint64_t v10 = [v9 length];

  if (v10 != 3)
  {
    BOOL v13 = 0;
LABEL_11:
    uint64_t v14 = 0;
    goto LABEL_12;
  }
  id v11 = [v8 value];
  uint64_t v12 = [v11 bytes];

  BOOL v13 = *(char *)(v12 + 2) < 0;
  if (*((void *)*v2 + 14) != 2 || [*((id *)*v2 + 1) maxInputLength] < 262) {
    goto LABEL_11;
  }
  uint64_t v14 = (*(unsigned __int8 *)(v12 + 2) >> 6) & 1;
LABEL_12:
  [*v2 setUseExtendedLength:v14];
  [*v2 setUseCommandChaining:v13];
}

BOOL __37__TKSmartCard_querySessionWithReply___block_invoke_223(uint64_t a1, void *a2)
{
  return [a2 tag] == 7;
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_227(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = TK_LOG_smartcard();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __37__TKSmartCard_querySessionWithReply___block_invoke_228(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)beginSessionWithReply:(void *)reply
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = reply;
  id v5 = TK_LOG_smartcard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard beginSessionWithReply:](self, v5);
  }

  if ([(TKSmartCard *)self valid])
  {
    beginSessionQueue = self->_beginSessionQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke;
    v11[3] = &unk_1E63C8380;
    v11[4] = self;
    id v12 = v4;
    dispatch_async(beginSessionQueue, v11);
  }
  else
  {
    uint64_t v7 = TK_LOG_smartcard();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(TKSmartCard *)self slot];
      id v9 = [v8 name];
      *(_DWORD *)buf = 138543362;
      uint64_t v14 = v9;
      _os_log_impl(&dword_1BED55000, v7, OS_LOG_TYPE_INFO, "%{public}@: an attempt to begin session with invalidated (removed) card", buf, 0xCu);
    }
    uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    (*((void (**)(void *, void, void *))v4 + 2))(v4, 0, v10);
  }
}

void __37__TKSmartCard_beginSessionWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 32))
  {
    ++*(void *)(v2 + 40);
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v2 + 16));
    id v4 = *(void **)(a1 + 32);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __37__TKSmartCard_beginSessionWithReply___block_invoke_2;
    v5[3] = &unk_1E63C8090;
    v5[4] = v4;
    id v6 = *(id *)(a1 + 40);
    [v4 querySessionWithReply:v5];
  }
}

void __37__TKSmartCard_beginSessionWithReply___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  id v5 = a3;
  dispatch_resume(v4);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)beginSessionWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 1;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  id v5 = TK_LOG_smartcard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = [(TKSmartCard *)self slot];
    uint64_t v7 = [v6 name];
    -[TKSmartCard beginSessionWithError:](v7, (uint64_t)v30, v5, v6);
  }

  if ([(TKSmartCard *)self valid])
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x2020000000;
    char v29 = 0;
    beginSessionQueue = self->_beginSessionQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__TKSmartCard_beginSessionWithError___block_invoke;
    block[3] = &unk_1E63C81D0;
    block[4] = self;
    block[5] = &buf;
    dispatch_sync(beginSessionQueue, block);
    if (*(unsigned char *)(*((void *)&buf + 1) + 24))
    {
      self->_BOOL synchronous = 1;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __37__TKSmartCard_beginSessionWithError___block_invoke_2;
      v15[3] = &unk_1E63C8418;
      v15[4] = self;
      v15[5] = &v23;
      v15[6] = &v17;
      [(TKSmartCard *)self querySessionWithReply:v15];
      self->_BOOL synchronous = 0;
    }
    int v9 = *((unsigned __int8 *)v24 + 24);
    if (a3 && !*((unsigned char *)v24 + 24))
    {
      *a3 = (id) v18[5];
      int v9 = *((unsigned __int8 *)v24 + 24);
    }
    BOOL v10 = v9 != 0;
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v11 = TK_LOG_smartcard();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(TKSmartCard *)self slot];
      BOOL v13 = [v12 name];
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v13;
      _os_log_impl(&dword_1BED55000, v11, OS_LOG_TYPE_INFO, "%{public}@: an attempt to begin session with invalidated (removed) card", (uint8_t *)&buf, 0xCu);
    }
    if (a3)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
      BOOL v10 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  _Block_object_dispose(&v17, 8);

  _Block_object_dispose(&v23, 8);
  return v10;
}

void __37__TKSmartCard_beginSessionWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 32))
  {
    ++*(void *)(v1 + 40);
  }
  else
  {
    dispatch_suspend(*(dispatch_object_t *)(v1 + 16));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void __37__TKSmartCard_beginSessionWithError___block_invoke_2(void *a1, char a2, void *a3)
{
  id v6 = a3;
  dispatch_resume(*(dispatch_object_t *)(a1[4] + 16));
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  if ((a2 & 1) == 0) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a3);
  }
}

- (BOOL)inSessionWithError:(NSError *)error executeBlock:(void *)block
{
  id v6 = block;
  if ([(TKSmartCard *)self beginSessionWithError:error])
  {
    char v7 = v6[2](v6, error);
    [(TKSmartCard *)self endSession];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (int64_t)sessionEndPolicy
{
  return 0;
}

- (void)setSessionEndPolicy:(int64_t)a3
{
  self->_sessionEndPolicy = a3;
  id session = self->_session;
  if (session) {
    objc_msgSend(session, "setEndPolicy:");
  }
}

- (void)endSessionWithReply:(id)a3
{
  id v5 = a3;
  id v6 = TK_LOG_smartcard();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[TKSmartCard endSessionWithReply:]();
  }

  beginSessionQueue = self->_beginSessionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__TKSmartCard_endSessionWithReply___block_invoke;
  block[3] = &unk_1E63C8440;
  id v10 = v5;
  SEL v11 = a2;
  block[4] = self;
  id v8 = v5;
  dispatch_async(beginSessionQueue, block);
}

uint64_t __35__TKSmartCard_endSessionWithReply___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  if (*(unsigned char *)(v2 + 25)) {
    BOOL v3 = 1;
  }
  else {
    BOOL v3 = *(unsigned char *)(v2 + 24) != 0;
  }
  *(unsigned char *)(v2 + 25) = v3;
  uint64_t v4 = a1[4];
  if (!*(void *)(v4 + 32) || (uint64_t v5 = *(void *)(v4 + 40), v5 <= 0))
  {
    SEL v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a1[6] object:a1[4] file:@"TKSmartCard.m" lineNumber:794 description:@"bad endSession"];

    uint64_t v4 = a1[4];
    uint64_t v5 = *(void *)(v4 + 40);
  }
  uint64_t v6 = v5 - 1;
  *(void *)(v4 + 40) = v6;
  if (!v6 && ((uint64_t v9 = a1[4], *(unsigned char *)(v9 + 48)) || *(void *)(v9 + 56)))
  {
    uint64_t v10 = a1[5];
    return [(id)v9 releaseSessionWithReply:v10];
  }
  else
  {
    char v7 = *(uint64_t (**)(void))(a1[5] + 16);
    return v7();
  }
}

- (void)endSession
{
}

- (void)transmitRequest:(NSData *)request reply:(void *)reply
{
  uint64_t v6 = request;
  char v7 = reply;
  if ([(TKSmartCard *)self valid])
  {
    if (!self->_sessionCounter)
    {
      id v8 = TK_LOG_smartcard();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[TKSmartCard transmitRequest:reply:](self);
      }

      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"attempt to transmitRequest out of card session"];
    }
    uint64_t v9 = TK_LOG_smartcard();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[TKSmartCard transmitRequest:reply:]();
    }

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke;
    v16[3] = &unk_1E63C8330;
    v16[4] = self;
    id v10 = v7;
    id v17 = v10;
    SEL v11 = [(TKSmartCard *)self remoteSessionWithErrorHandler:v16];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __37__TKSmartCard_transmitRequest_reply___block_invoke_244;
    v14[3] = &unk_1E63C8468;
    void v14[4] = self;
    id v15 = v10;
    [v11 transmit:v6 reply:v14];
  }
  else
  {
    id v12 = TK_LOG_smartcard();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[TKSmartCard transmitRequest:reply:](self);
    }

    BOOL v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    (*((void (**)(void *, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = TK_LOG_smartcard();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(a1);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_244(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  char v7 = TK_LOG_smartcard();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    int v9 = 138543874;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_debug_impl(&dword_1BED55000, v7, OS_LOG_TYPE_DEBUG, "%{public}@: transmitRequest got reply %@ (err=%{public}@)", (uint8_t *)&v9, 0x20u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)context
{
  uint64_t v3 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v4 = [(TKSmartCard *)self contextForKey:v3];

  return v4;
}

- (void)setContext:(id)context
{
  uint64_t v4 = (void *)MEMORY[0x1E4F1CA98];
  id v5 = context;
  id v6 = [v4 null];
  [(TKSmartCard *)self setContext:v5 forKey:v6];
}

- (id)contextForKey:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_contexts objectForKey:a3];
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  if (!v6)
  {
    __int16 v13 = NSStringFromSelector(sel_context);
    [(TKSmartCard *)self willChangeValueForKey:v13];

    contexts = self->_contexts;
    self->_contexts = 0;

    goto LABEL_10;
  }
  char v7 = [MEMORY[0x1E4F1CA98] null];
  int v8 = [v6 isEqual:v7];

  if (v8)
  {
    int v9 = NSStringFromSelector(sel_context);
    [(TKSmartCard *)self willChangeValueForKey:v9];
  }
  uint64_t v10 = self->_contexts;
  if (v16 && !v10)
  {
    __int16 v11 = [MEMORY[0x1E4F1CA60] dictionary];
    id v12 = self->_contexts;
    self->_contexts = v11;

    uint64_t v10 = self->_contexts;
    goto LABEL_9;
  }
  if (v16)
  {
LABEL_9:
    [(NSMutableDictionary *)v10 setObject:v16 forKey:v6];
    if ((v8 & 1) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  [(NSMutableDictionary *)v10 removeObjectForKey:v6];
  if (v8)
  {
LABEL_10:
    uint64_t v15 = NSStringFromSelector(sel_context);
    [(TKSmartCard *)self didChangeValueForKey:v15];
  }
LABEL_11:
}

- (TKSmartCardUserInteractionForSecurePINVerification)userInteractionForSecurePINVerificationWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU PINByteOffset:(NSInteger)PINByteOffset
{
  int v8 = PINFormat;
  int v9 = APDU;
  uint64_t v10 = [(TKSmartCard *)self slot];
  __int16 v11 = [v10 slotParameters];
  int v12 = [v11 securePINVerificationSupported];

  if (v12)
  {
    __int16 v13 = objc_alloc_init(TKSmartCardUserInteractionForSecurePINVerification);
    id v14 = [(TKSmartCard *)self slot];
    [(TKSmartCardUserInteractionForSecurePINVerification *)v13 setSlot:v14 PINFormat:v8 APDU:v9 PINByteOffset:PINByteOffset];
  }
  else
  {
    __int16 v13 = 0;
  }

  return v13;
}

- (TKSmartCardUserInteractionForSecurePINChange)userInteractionForSecurePINChangeWithPINFormat:(TKSmartCardPINFormat *)PINFormat APDU:(NSData *)APDU currentPINByteOffset:(NSInteger)currentPINByteOffset newPINByteOffset:(NSInteger)newPINByteOffset
{
  uint64_t v10 = PINFormat;
  __int16 v11 = APDU;
  int v12 = [(TKSmartCard *)self slot];
  __int16 v13 = [v12 slotParameters];
  int v14 = [v13 securePINChangeSupported];

  if (v14)
  {
    uint64_t v15 = objc_alloc_init(TKSmartCardUserInteractionForSecurePINChange);
    id v16 = [(TKSmartCard *)self slot];
    [(TKSmartCardUserInteractionForSecurePINChange *)v15 setSlot:v16 PINFormat:v10 APDU:v11 currentPINByteOffset:currentPINByteOffset newPINByteOffset:newPINByteOffset];
  }
  else
  {
    uint64_t v15 = 0;
  }

  return v15;
}

- (void)dealloc
{
  id session = self->_session;
  if (session)
  {
    if (self->_sensitiveRequired || self->_sensitive)
    {
      [(TKSmartCard *)self setSessionEndPolicy:1];
      self->_sensitiveRequired = 0;
      id session = self->_session;
    }
    [session terminateWithReply:&__block_literal_global_252];
  }
  [(TKSmartCard *)self unreserve];
  uint64_t v4 = self->_slot;
  objc_sync_enter(v4);
  slot = self->_slot;
  id v6 = NSStringFromSelector(sel_state);
  [(TKSmartCardSlot *)slot removeObserver:self forKeyPath:v6];

  objc_sync_exit(v4);
  v7.receiver = self;
  v7.super_class = (Class)TKSmartCard;
  [(TKSmartCard *)&v7 dealloc];
}

- (void)reserveExclusive:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  objc_super v7 = v6;
  if (self->_allowedProtocols)
  {
    slot = self->_slot;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke;
    v15[3] = &unk_1E63C8298;
    id v9 = v6;
    id v16 = v9;
    uint64_t v10 = [(TKSmartCardSlot *)slot synchronous:0 remoteSlotWithErrorHandler:v15];
    __int16 v11 = [NSNumber numberWithUnsignedInteger:self->_allowedProtocols];
    reservationId = self->_reservationId;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __38__TKSmartCard_reserveExclusive_reply___block_invoke_2;
    v13[3] = &unk_1E63C8490;
    v13[4] = self;
    id v14 = v9;
    [v10 reserveProtocols:v11 reservationId:reservationId exclusive:v4 reply:v13];
  }
  else
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

uint64_t __38__TKSmartCard_reserveExclusive_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __38__TKSmartCard_reserveExclusive_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = a3;
  if (!a4)
  {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), a3);
    if ([v8 unsignedIntegerValue]) {
      objc_msgSend(*(id *)(a1 + 32), "setAllowedProtocols:", objc_msgSend(v8, "unsignedIntegerValue"));
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)unreserve
{
  if (self->_reservationId)
  {
    uint64_t v3 = [(TKSmartCardSlot *)self->_slot synchronous:0 remoteSlotWithErrorHandler:&__block_literal_global_255_0];
    [v3 reserveProtocols:0 reservationId:self->_reservationId exclusive:0 reply:&__block_literal_global_257];

    reservationId = self->_reservationId;
    self->_reservationId = 0;
  }
}

- (BOOL)revalidate
{
  if ([(TKSmartCardSlot *)self->_slot state] == TKSmartCardSlotStateValidCard) {
    [(TKSmartCard *)self setValid:1];
  }

  return [(TKSmartCard *)self valid];
}

- (UInt8)cla
{
  return self->_cla;
}

- (void)setCla:(UInt8)cla
{
  self->_cla = cla;
}

- (BOOL)useExtendedLength
{
  return self->_useExtendedLength;
}

- (void)setUseExtendedLength:(BOOL)useExtendedLength
{
  self->_useExtendedLength = useExtendedLength;
}

- (BOOL)useCommandChaining
{
  return self->_useCommandChaining;
}

- (void)setUseCommandChaining:(BOOL)useCommandChaining
{
  self->_useCommandChaining = useCommandChaining;
}

+ (BOOL)decodeResponse:(id)a3 sw:(unsigned __int16 *)a4 appendTo:(id)a5 error:(id *)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  *a4 = 0;
  if (!v9) {
    goto LABEL_5;
  }
  if ((unint64_t)[v9 length] <= 1)
  {
    if (a6)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:0];
      BOOL v11 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
LABEL_5:
    BOOL v11 = 0;
    goto LABEL_6;
  }
  id v13 = v9;
  uint64_t v14 = [v13 bytes];
  uint64_t v15 = [v13 length];
  *a4 = bswap32(*(unsigned __int16 *)(v14 + v15 - 2)) >> 16;
  [v10 appendBytes:v14 length:v15 - 2];
  int v16 = *a4;
  BOOL v11 = 1;
  if (v16 != 36864 && (v16 & 0xFF00) != 0x6100)
  {
    int v17 = v16 & 0xFFC0;
    unsigned int v18 = v16 & 0x3F;
    if (v16 == 27011) {
      unsigned int v19 = 0;
    }
    else {
      unsigned int v19 = -1;
    }
    if (v17 == 25536) {
      uint64_t v20 = v18;
    }
    else {
      uint64_t v20 = v19;
    }
    v21 = TK_LOG_smartcard();
    id v22 = v21;
    if ((v20 & 0x80000000) != 0)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        +[TKSmartCard decodeResponse:sw:appendTo:error:](a4, v22);
      }

      if (a6)
      {
        v30 = objc_msgSend(NSString, "stringWithFormat:", @"SmartCard returned error %04hx", *a4);
        uint64_t v31 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v33 = *MEMORY[0x1E4F28568];
        v34 = v30;
        BOOL v11 = 1;
        v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
        *a6 = [v31 errorWithDomain:@"CryptoTokenKit" code:-3 userInfo:v32];

        goto LABEL_6;
      }
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = *a4;
        *(_DWORD *)long long buf = 67109376;
        int v38 = v23;
        __int16 v39 = 1024;
        int v40 = v20;
        _os_log_impl(&dword_1BED55000, v22, OS_LOG_TYPE_INFO, "Failed to verify PIN. sw=0x%04hx, retries: %d", buf, 0xEu);
      }

      if (a6)
      {
        long long v24 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CryptoTokenKit"];
        uint64_t v25 = [v24 localizedStringForKey:@"VERIFY_TRY_LEFT" value:&stru_1F19EDBB0 table:0];

        char v26 = objc_msgSend(NSString, "localizedStringWithFormat:", v25, v20);
        objc_super v27 = (void *)MEMORY[0x1E4F28C58];
        v35[0] = *MEMORY[0x1E4F28568];
        v35[1] = @"userSecretTriesLeft";
        v36[0] = v26;
        uint64_t v28 = [NSNumber numberWithInt:v20];
        v36[1] = v28;
        char v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
        *a6 = [v27 errorWithDomain:@"CryptoTokenKit" code:-5 userInfo:v29];
      }
    }
    BOOL v11 = 1;
  }
LABEL_6:

  return v11;
}

- (BOOL)checkAPDUResponse:(id)a3 error:(id *)a4
{
  __int16 v8 = 0;
  id v5 = a3;
  char v6 = [(id)objc_opt_class() decodeResponse:v5 sw:&v8 appendTo:0 error:a4];

  if (v8 == -28672) {
    return v6;
  }
  else {
    return 0;
  }
}

- (void)handleApduResponse:(id)a3 body:(id)a4 le:(unint64_t)a5 isCase4:(BOOL)a6 error:(id)a7 reply:(id)a8
{
  BOOL v10 = a6;
  id v14 = a4;
  id v15 = a8;
  unsigned __int16 v31 = 0;
  id v16 = a7;
  id v17 = a3;
  id v30 = v16;
  LOBYTE(a3) = [(id)objc_opt_class() decodeResponse:v17 sw:&v31 appendTo:v14 error:&v30];

  id v18 = v30;
  if ((a3 & 1) == 0)
  {
    (*((void (**)(id, void, void, id))v15 + 2))(v15, 0, 0, v18);
    goto LABEL_25;
  }
  unsigned __int16 v19 = v31;
  if (v31 == 36864 && v10)
  {
    if (self->_currentProtocol != 1) {
      goto LABEL_13;
    }
    if (![v14 length])
    {
      unsigned __int16 v31 = 24832;
LABEL_11:
      if ([v14 length] >= a5)
      {
        unsigned __int16 v31 = -28672;

        id v18 = 0;
      }
      goto LABEL_13;
    }
    unsigned __int16 v19 = v31;
  }
  if ((v19 & 0xFF00) == 0x6100) {
    goto LABEL_11;
  }
LABEL_13:
  if ((v31 & 0xFF00) == 0x6100)
  {
    if ((_BYTE)v31) {
      unint64_t v20 = v31;
    }
    else {
      unint64_t v20 = 256;
    }
    if ([v14 length] + v20 > a5) {
      unint64_t v20 = a5 - [v14 length];
    }
    if (v20 > [(TKSmartCardSlot *)self->_slot maxOutputLength] - 2) {
      LOBYTE(v20) = [(TKSmartCardSlot *)self->_slot maxOutputLength] - 2;
    }
    unsigned __int8 cla = self->_cla;
    __int16 v27 = 192;
    char v28 = 0;
    char v29 = v20;
    v21 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&cla length:5];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke;
    v22[3] = &unk_1E63C84D8;
    void v22[4] = self;
    id v23 = v14;
    unint64_t v25 = a5;
    id v24 = v15;
    [(TKSmartCard *)self transmitRequest:v21 reply:v22];
  }
  else
  {
    if ([v14 length] > a5) {
      [v14 setLength:a5];
    }
    (*((void (**)(id, id, void, id))v15 + 2))(v15, v14, v31, v18);
  }
LABEL_25:
}

uint64_t __62__TKSmartCard_handleApduResponse_body_le_isCase4_error_reply___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) handleApduResponse:a2 body:*(void *)(a1 + 40) le:*(void *)(a1 + 56) isCase4:0 error:a3 reply:*(void *)(a1 + 48)];
}

- (void)encodeLength:(unint64_t)a3 into:(id)a4 sized:(int64_t)a5
{
  id v7 = a4;
  __int16 v8 = v7;
  switch(a5)
  {
    case 3:
      v12[0] = 0;
      v12[1] = BYTE1(a3);
      v12[2] = a3;
      BOOL v10 = (__int16 *)v12;
      uint64_t v11 = 3;
LABEL_9:
      [v7 appendBytes:v10 length:v11];
      break;
    case 2:
      __int16 v13 = bswap32(a3) >> 16;
      BOOL v10 = &v13;
      uint64_t v11 = 2;
      goto LABEL_9;
    case 1:
      char v9 = 0;
      if (a3 < 0x100) {
        char v9 = a3;
      }
      char v14 = v9;
      BOOL v10 = (__int16 *)&v14;
      uint64_t v11 = 1;
      goto LABEL_9;
  }
}

- (id)buildIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 range:(_NSRange)a7 le:(id)a8 protocol:(unint64_t)a9 chained:(BOOL)a10 extended:(BOOL *)a11 realLe:(unint64_t *)a12
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  id v17 = a6;
  id v18 = a8;
  unsigned __int16 v19 = (void *)MEMORY[0x1E4F1CA58];
  if (v17) {
    uint64_t v20 = [v17 length] + 10;
  }
  else {
    uint64_t v20 = 10;
  }
  v21 = [v19 dataWithCapacity:v20];
  id v22 = v21;
  unsigned __int8 cla = self->_cla;
  v38[0] = cla;
  v38[1] = a3;
  v38[2] = a4;
  v38[3] = a5;
  if (a10) {
    v38[0] = cla | 0x10;
  }
  [v21 appendBytes:v38 length:4];
  if (v17)
  {
    if (length >= 0x10000) {
      objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", *MEMORY[0x1E4F1C3C8], @"Attempt to send APDU with Lc=%lu", length);
    }
    BOOL v24 = length > 0xFF;
  }
  else
  {
    BOOL v24 = 0;
  }
  *a12 = 0;
  if (!v18)
  {
    __int16 v27 = a11;
    if (!v17) {
      goto LABEL_26;
    }
    goto LABEL_22;
  }
  if ((unint64_t)[v18 unsignedIntegerValue] > 0x10000) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"Attempt to send APDU with Le=%@", v18 format];
  }
  uint64_t v25 = [v18 unsignedIntegerValue];
  unint64_t v26 = 0x10000;
  if (v25) {
    unint64_t v26 = v25;
  }
  *a12 = v26;
  __int16 v27 = a11;
  int v28 = v26 > 0x100 || v24;
  if (*a11) {
    BOOL v24 = v28;
  }
  if (v17)
  {
LABEL_22:
    if (v24) {
      uint64_t v29 = 3;
    }
    else {
      uint64_t v29 = 1;
    }
    [(TKSmartCard *)self encodeLength:length into:v22 sized:v29];
    objc_msgSend(v22, "appendBytes:length:", objc_msgSend(v17, "bytes") + location, length);
  }
LABEL_26:
  if (v18)
  {
    if (!v17 || a9 == 2)
    {
      uint64_t v30 = 2;
      if (!v17) {
        uint64_t v30 = 3;
      }
      if (v24) {
        uint64_t v31 = v30;
      }
      else {
        uint64_t v31 = 1;
      }
      uint64_t v32 = [v18 unsignedIntegerValue];
      uint64_t v33 = self;
      v34 = v22;
      uint64_t v35 = v31;
      goto LABEL_40;
    }
  }
  else if (!v17 && a9 == 1)
  {
    uint64_t v33 = self;
    uint64_t v32 = 0;
    v34 = v22;
    uint64_t v35 = 1;
LABEL_40:
    [(TKSmartCard *)v33 encodeLength:v32 into:v34 sized:v35];
  }
  *__int16 v27 = v24;

  return v22;
}

- (void)transmitChunkedIns:(unsigned __int8)a3 p1:(unsigned __int8)a4 p2:(unsigned __int8)a5 data:(id)a6 fromOffset:(unint64_t)a7 realLe:(unint64_t)a8 chained:(BOOL)a9 isCase4:(BOOL)a10 reply:(id)a11
{
  unsigned int v13 = a5;
  unsigned int v39 = a3;
  unsigned int v40 = a4;
  id v15 = a6;
  id v16 = a11;
  uint64_t v17 = [v15 length];
  if (v17 - a7 > 0xFF && !self->_useExtendedLength) {
    unint64_t v19 = 255;
  }
  else {
    unint64_t v19 = v17 - a7;
  }
  if (v19 <= 0xFF) {
    uint64_t v20 = 5;
  }
  else {
    uint64_t v20 = 7;
  }
  unsigned int v41 = v13;
  if (a9 && v19 + a7 == [v15 length])
  {
    uint64_t v21 = 6;
    if (v19 > 0xFF) {
      uint64_t v21 = 9;
    }
    if (self->_currentProtocol == 2 || v15 == 0) {
      uint64_t v20 = v21;
    }
    int v23 = 1;
  }
  else
  {
    int v23 = 0;
  }
  if (v20 + v19 > [(TKSmartCardSlot *)self->_slot maxInputLength])
  {
    if (v23)
    {
      uint64_t v24 = -2;
      if (v19 <= 0xFF) {
        uint64_t v24 = -1;
      }
      if (self->_currentProtocol == 2 || v15 == 0) {
        uint64_t v26 = v24;
      }
      else {
        uint64_t v26 = 0;
      }
      v20 += v26;
    }
    LOBYTE(v23) = 0;
    unint64_t v19 = [(TKSmartCardSlot *)self->_slot maxInputLength] - v20;
  }
  v64[0] = self->_useExtendedLength;
  uint64_t v63 = 0;
  if (v19)
  {
    char v27 = v23 ^ 1;
    if ((v23 & a10) == 1)
    {
      uint64_t v28 = [NSNumber numberWithUnsignedInteger:a8];
    }
    else
    {
      uint64_t v28 = 0;
    }
    LOBYTE(v35) = v27 & a9;
    v36 = (void *)v28;
    -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v39, v40, v13, v15, a7, v19, v28, self->_currentProtocol, v35, v64, &v63);
    v30 = unint64_t v38 = a7;
    uint64_t v59 = 0;
    v60 = &v59;
    uint64_t v61 = 0x2020000000;
    char v62 = 0;
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke;
    v46[3] = &unk_1E63C8500;
    char v53 = v23;
    v46[4] = self;
    unint64_t v50 = a8;
    BOOL v54 = a10;
    id v31 = v16;
    id v48 = v31;
    char v55 = v39;
    char v56 = v40;
    char v57 = v13;
    id v37 = v15;
    id v32 = v15;
    unint64_t v51 = v38;
    unint64_t v52 = v19;
    BOOL v58 = a9;
    id v47 = v32;
    v49 = &v59;
    [(TKSmartCard *)self transmitRequest:v30 reply:v46];
    if (*((unsigned char *)v60 + 24))
    {
      BYTE1(v34) = a10;
      LOBYTE(v34) = v27 & a9;
      -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", v39, v40, v13, v32, v19 + v38, a8, v34, v31);
    }

    _Block_object_dispose(&v59, 8);
    uint64_t v33 = v36;
    id v15 = v37;
  }
  else
  {
    if (a10)
    {
      uint64_t v29 = [NSNumber numberWithUnsignedInteger:a8];
    }
    else
    {
      uint64_t v29 = 0;
    }
    LOBYTE(v35) = a9 & ~(_BYTE)v23;
    uint64_t v33 = -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v39, v40, v41, 0, 0, 0, v29, self->_currentProtocol, v35, v64, &v63);
    if (a10) {

    }
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2;
    v42[3] = &unk_1E63C8528;
    v42[4] = self;
    unint64_t v44 = a8;
    BOOL v45 = a10;
    id v43 = v16;
    [(TKSmartCard *)self transmitRequest:v33 reply:v42];
  }
}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (*(unsigned char *)(a1 + 88))
  {
    char v6 = *(void **)(a1 + 32);
    id v7 = (void *)MEMORY[0x1E4F1CA58];
    id v8 = a2;
    char v9 = [v7 data];
    [v6 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 64) isCase4:*(unsigned __int8 *)(a1 + 89) error:v5 reply:*(void *)(a1 + 48)];

    id v10 = v5;
  }
  else
  {
    unsigned __int16 v18 = 0;
    id v11 = a2;
    id v17 = v5;
    int v12 = [(id)objc_opt_class() decodeResponse:v11 sw:&v18 appendTo:0 error:&v17];

    id v10 = v17;
    if (v12 && v18 == 36864)
    {
      if ([*(id *)(a1 + 32) synchronous])
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      }
      else
      {
        char v15 = *(unsigned char *)(a1 + 93);
        if (v15) {
          char v15 = *(unsigned char *)(a1 + 88) == 0;
        }
        BYTE1(v16) = *(unsigned char *)(a1 + 89);
        LOBYTE(v16) = v15;
        objc_msgSend(*(id *)(a1 + 32), "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", *(unsigned __int8 *)(a1 + 90), *(unsigned __int8 *)(a1 + 91), *(unsigned __int8 *)(a1 + 92), *(void *)(a1 + 40), *(void *)(a1 + 80) + *(void *)(a1 + 72), *(void *)(a1 + 64), v16, *(void *)(a1 + 48));
      }
    }
    else
    {
      uint64_t v13 = *(void *)(a1 + 48);
      if (v12)
      {
        char v14 = objc_msgSend(MEMORY[0x1E4F1C9B8], "data", v18);
        (*(void (**)(uint64_t, void *, void, id))(v13 + 16))(v13, v14, v18, v10);
      }
      else
      {
        (*(void (**)(uint64_t, void, void, id))(v13 + 16))(v13, 0, v18, v10);
      }
    }
  }
}

void __85__TKSmartCard_transmitChunkedIns_p1_p2_data_fromOffset_realLe_chained_isCase4_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  char v6 = (void *)MEMORY[0x1E4F1CA58];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 data];
  [v5 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 48) isCase4:*(unsigned __int8 *)(a1 + 56) error:v7 reply:*(void *)(a1 + 40)];
}

- (void)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le reply:(void *)reply
{
  uint64_t v10 = p2;
  uint64_t v11 = p1;
  uint64_t v12 = ins;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  char v14 = requestData;
  char v15 = le;
  uint64_t v16 = reply;
  if (!self->_sessionCounter) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"sendIns: not in active card session"];
  }
  id v17 = self->_syncObject;
  objc_sync_enter(v17);
  if ([(TKSmartCard *)self valid])
  {
    if (self->_currentProtocol - 1 >= 2) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8], @"sendIns: found protocol 0x%04lx, but only T=0 or T=1 protocols are supported", self->_currentProtocol format];
    }
    objc_sync_exit(v17);

    unsigned __int16 v18 = TK_LOG_smartcard();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67110146;
      *(_DWORD *)&uint8_t buf[4] = v12;
      __int16 v41 = 1024;
      int v42 = v11;
      __int16 v43 = 1024;
      int v44 = v10;
      __int16 v45 = 2112;
      v46 = v14;
      __int16 v47 = 2112;
      id v48 = v15;
      _os_log_debug_impl(&dword_1BED55000, v18, OS_LOG_TYPE_DEBUG, "req: %02x %02x%02x %@ le:%@", buf, 0x28u);
    }

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke;
    v38[3] = &unk_1E63C8550;
    unsigned int v39 = v16;
    unint64_t v19 = (void *)MEMORY[0x1C189CA40](v38);
    if (v14) {
      BOOL v20 = v15 == 0;
    }
    else {
      BOOL v20 = 1;
    }
    char v21 = !v20;
    char v32 = v21;
    BOOL useExtendedLength = self->_useExtendedLength;
    *(void *)long long buf = 0;
    LOBYTE(v30) = 0;
    id v22 = -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v12, v11, v10, v14, 0, [(NSData *)v14 length], v15, self->_currentProtocol, v30, &useExtendedLength, buf);
    unint64_t v23 = [v22 length];
    if (v23 > [(TKSmartCardSlot *)self->_slot maxInputLength]
      || useExtendedLength && !self->_useExtendedLength)
    {
      if (self->_useCommandChaining)
      {
        BYTE1(v29) = v32;
        LOBYTE(v29) = 1;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", v12, v11, v10, v14, 0, *(void *)buf, v29, v19);
      }
      else
      {
        if (self->_currentProtocol != 2 || !self->_useExtendedLength)
        {
          BOOL useExtendedLength = 1;
          LOBYTE(v31) = 0;
          uint64_t v28 = -[TKSmartCard buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:](self, "buildIns:p1:p2:data:range:le:protocol:chained:extended:realLe:", v12, v11, v10, v14, 0, [(NSData *)v14 length], v15, 2, v31, &useExtendedLength, buf);

          id v22 = (void *)v28;
        }
        BYTE1(v29) = v32;
        LOBYTE(v29) = 0;
        -[TKSmartCard transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:](self, "transmitChunkedIns:p1:p2:data:fromOffset:realLe:chained:isCase4:reply:", 194, 0, 0, v22, 0, *(void *)buf, v29, v19);
      }
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_279;
      v33[3] = &unk_1E63C8528;
      v33[4] = self;
      uint64_t v35 = *(void *)buf;
      char v36 = v32;
      id v34 = v19;
      [(TKSmartCard *)self transmitRequest:v22 reply:v33];
    }
    id v17 = v39;
  }
  else
  {
    uint64_t v24 = TK_LOG_smartcard();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      uint64_t v25 = [(TKSmartCard *)self slot];
      uint64_t v26 = [v25 name];
      -[TKSmartCard sendIns:p1:p2:data:le:reply:](v26, buf, v24, v25);
    }

    char v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:0];
    (*((void (**)(void *, void, void, void *))v16 + 2))(v16, 0, 0, v27);

    objc_sync_exit(v17);
  }
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a2;
  id v7 = a4;
  if (v6)
  {
    id v8 = TK_LOG_smartcard();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_279(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = (void *)MEMORY[0x1E4F1CA58];
  id v7 = a3;
  id v8 = a2;
  id v9 = [v6 data];
  [v5 handleApduResponse:v8 body:v9 le:*(void *)(a1 + 48) isCase4:*(unsigned __int8 *)(a1 + 56) error:v7 reply:*(void *)(a1 + 40)];
}

- (NSData)sendIns:(UInt8)ins p1:(UInt8)p1 p2:(UInt8)p2 data:(NSData *)requestData le:(NSNumber *)le sw:(UInt16 *)sw error:(NSError *)error
{
  uint64_t v11 = p2;
  uint64_t v12 = p1;
  uint64_t v13 = ins;
  char v15 = requestData;
  uint64_t v16 = le;
  uint64_t v27 = 0;
  uint64_t v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__0;
  uint64_t v31 = __Block_byref_object_dispose__0;
  id v32 = 0;
  self->_BOOL synchronous = 1;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__0;
  uint64_t v25 = __Block_byref_object_dispose__0;
  id v26 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke;
  v20[3] = &unk_1E63C8578;
  void v20[5] = &v21;
  v20[6] = sw;
  v20[4] = &v27;
  [(TKSmartCard *)self sendIns:v13 p1:v12 p2:v11 data:v15 le:v16 reply:v20];
  self->_BOOL synchronous = 0;
  if (error)
  {
    id v17 = (void *)v22[5];
    if (v17) {
      *error = (NSError *)v17;
    }
  }
  id v18 = (id)v28[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&v27, 8);

  return (NSData *)v18;
}

void __46__TKSmartCard_sendIns_p1_p2_data_le_sw_error___block_invoke(uint64_t a1, void *a2, __int16 a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v13 = v7;

  **(_WORD **)(a1 + 48) = a3;
  uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
}

- (BOOL)selectApplication:(id)a3 error:(id *)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(TKSmartCard *)self contextForKey:@"AID"];
  char v8 = [v6 isEqual:v7];

  if (v8) {
    goto LABEL_5;
  }
  unsigned __int16 v16 = 0;
  uint64_t v9 = [(TKSmartCard *)self sendIns:164 p1:4 p2:0 data:v6 le:0 sw:&v16 error:a4];
  int v10 = v16;

  if (v9 && v10 == 36864)
  {
    [(TKSmartCard *)self setContext:v6 forKey:@"AID"];
LABEL_5:
    BOOL v11 = 1;
    goto LABEL_11;
  }
  if (a4)
  {
    uint64_t v17 = *MEMORY[0x1E4F28568];
    uint64_t v12 = [NSString stringWithFormat:@"Unable to select card application AID %@", v6];
    v18[0] = v12;
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    char v14 = (void *)[v13 mutableCopy];

    if (*a4) {
      [v14 setObject:*a4 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    *a4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"CryptoTokenKit" code:-7 userInfo:v14];
  }
  BOOL v11 = 0;
LABEL_11:

  return v11;
}

- (TKSmartCardSlot)slot
{
  return self->_slot;
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

- (TKSmartCardProtocol)allowedProtocols
{
  return self->_allowedProtocols;
}

- (void)setAllowedProtocols:(TKSmartCardProtocol)allowedProtocols
{
  self->_unint64_t allowedProtocols = allowedProtocols;
}

- (TKSmartCardProtocol)currentProtocol
{
  return self->_currentProtocol;
}

- (void)setCurrentProtocol:(unint64_t)a3
{
  self->_currentProtocol = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncObject, 0);
  objc_storeStrong((id *)&self->_reservationId, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
  objc_storeStrong(&self->_session, 0);
  objc_storeStrong((id *)&self->_beginSessionQueue, 0);

  objc_storeStrong((id *)&self->_slot, 0);
}

- (void)initWithSlot:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138543618;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v1, v2, "%{public}@: connected to slot %{public}@", (void)v3, DWORD2(v3));
}

- (void)observeValueForKeyPath:ofObject:change:context:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v0, v1, "%{public}@: invalidating because of state changed to %ld");
}

- (void)releaseSessionWithReply:.cold.1()
{
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_7(&dword_1BED55000, v0, v1, "%{public}@: releasing card session %{public}@", v2, v3, v4, v5, v6);
}

void __39__TKSmartCard_releaseSessionWithReply___block_invoke_3_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_6_0(v0) slot];
  uint64_t v2 = [v1 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_1BED55000, v3, v4, "%{public}@: failed to waitForStateFlushedWithReply: %{public}@", v5, v6, v7, v8, v9);
}

- (void)querySessionWithReply:.cold.1()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_debug_impl(&dword_1BED55000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: querying slot for the session, proto=%04lx, counter=%ld", v3, 0x20u);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_6_0(v0) slot];
  os_log_t v2 = [v1 name];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_0(&dword_1BED55000, v3, v4, "%{public}@: failed to call slot to allocate exclusive session for the card: %{public}@", v5, v6, v7, v8, v9);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_220_cold_1(uint64_t a1)
{
  uint64_t v1 = [(id)OUTLINED_FUNCTION_6_0(a1) slot];
  os_log_t v2 = [v1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v3, v4, "%{public}@: slot refused to allocate exclusive session for the card", v5, v6, v7, v8, v9);
}

void __37__TKSmartCard_querySessionWithReply___block_invoke_2_222_cold_1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_10();
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = v1;
  _os_log_debug_impl(&dword_1BED55000, v2, OS_LOG_TYPE_DEBUG, "%{public}@: slot answered session %{public}@ (protocol=0x%04lx, counter=%ld)", v3, 0x2Au);
}

- (void)beginSessionWithReply:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 slot];
  __int16 v4 = [v3 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_5(&dword_1BED55000, a2, v5, "%{public}@: begin exclusive SmartCard session", v6);
}

- (void)beginSessionWithError:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3, void *a4)
{
  *(_DWORD *)a2 = 138543362;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_1BED55000, a3, (uint64_t)a3, "%{public}@: begin exclusive SmartCard session", (uint8_t *)a2);
}

- (void)endSessionWithReply:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_12();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_debug_impl(&dword_1BED55000, v1, OS_LOG_TYPE_DEBUG, "%{public}@: endSession: counter=%ld, someoneWantsSession=%d", v2, 0x1Cu);
}

- (void)transmitRequest:reply:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_2_0(&dword_1BED55000, v0, v1, "%{public}@: transmitRequest:%@");
}

- (void)transmitRequest:(void *)a1 reply:.cold.2(void *a1)
{
  os_log_t v1 = [a1 slot];
  os_log_t v2 = [v1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v3, v4, "%{public}@: attempted to transmit APDU when no session is opened", v5, v6, v7, v8, v9);
}

- (void)transmitRequest:(void *)a1 reply:.cold.3(void *a1)
{
  os_log_t v1 = [a1 slot];
  os_log_t v2 = [v1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v3, v4, "%{public}@: transmitRequest invoked on card invalid (removed) card", v5, v6, v7, v8, v9);
}

void __37__TKSmartCard_transmitRequest_reply___block_invoke_cold_1(uint64_t a1)
{
  os_log_t v1 = [(id)OUTLINED_FUNCTION_6_0(a1) slot];
  os_log_t v2 = [v1 name];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_1(&dword_1BED55000, v3, v4, "%{public}@: token disappeared while transmitting request", v5, v6, v7, v8, v9);
}

+ (void)decodeResponse:(unsigned __int16 *)a1 sw:(NSObject *)a2 appendTo:error:.cold.1(unsigned __int16 *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_debug_impl(&dword_1BED55000, a2, OS_LOG_TYPE_DEBUG, "SmartCard returned error sw: 0x%04hx", (uint8_t *)v3, 8u);
}

- (void)sendIns:(os_log_t)log p1:(void *)a4 p2:data:le:reply:.cold.1(void *a1, uint8_t *buf, os_log_t log, void *a4)
{
  *(_DWORD *)long long buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BED55000, log, OS_LOG_TYPE_ERROR, "%{public}@: sendIns invoked on invalid (removed) card", buf, 0xCu);
}

void __43__TKSmartCard_sendIns_p1_p2_data_le_reply___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_13();
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4[0] = 67109634;
  v4[1] = v3;
  __int16 v5 = 2048;
  uint64_t v6 = [v2 length];
  __int16 v7 = 2112;
  uint64_t v8 = v1;
  _os_log_debug_impl(&dword_1BED55000, v0, OS_LOG_TYPE_DEBUG, "rsp: %04x len:%lu:%@", (uint8_t *)v4, 0x1Cu);
}

@end