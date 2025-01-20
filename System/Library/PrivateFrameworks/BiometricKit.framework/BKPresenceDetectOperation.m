@interface BKPresenceDetectOperation
- (id)optionsDictionaryWithError:(id *)a3;
- (int64_t)priority;
- (void)setPriority:(int64_t)a3;
- (void)startBioOperation:(BOOL)a3 reply:(id)a4;
@end

@implementation BKPresenceDetectOperation

- (id)optionsDictionaryWithError:(id *)a3
{
  v4 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionary", a3);
  if (self->_priority)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    [v4 setObject:v5 forKey:@"BKOptionPriority"];
  }
  return v4;
}

- (void)startBioOperation:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  kdebug_trace();
  v7 = MEMORY[0x1E4F14500];
  if (__osLogTrace) {
    v8 = __osLogTrace;
  }
  else {
    v8 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    xpcClient = self->super._xpcClient;
    v10 = v8;
    *(_DWORD *)buf = 134217984;
    v20 = [(BiometricKitXPCClient *)xpcClient connectionId];
    _os_log_impl(&dword_1B3AF1000, v10, OS_LOG_TYPE_DEFAULT, "BKPresenceDetectOperation::startOperation (_cid %lu)\n", buf, 0xCu);
  }
  id v18 = 0;
  v11 = [(BKPresenceDetectOperation *)self optionsDictionaryWithError:&v18];
  id v12 = v18;
  if (v11)
  {
    v13 = self->super._xpcClient;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __53__BKPresenceDetectOperation_startBioOperation_reply___block_invoke;
    v16[3] = &unk_1E6067D28;
    id v17 = v6;
    [(BiometricKitXPCClient *)v13 detectPresenceWithOptions:v11 async:v4 withReply:v16];
  }
  else
  {
    if (__osLog) {
      v15 = __osLog;
    }
    else {
      v15 = v7;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v20 = "options";
      __int16 v21 = 2048;
      uint64_t v22 = 0;
      __int16 v23 = 2080;
      v24 = &unk_1B3B370EE;
      __int16 v25 = 2080;
      v26 = "/Library/Caches/com.apple.xbs/Sources/BiometricKit/BiometricKit/BKOperation.m";
      __int16 v27 = 1024;
      int v28 = 1003;
      _os_log_impl(&dword_1B3AF1000, v15, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v12);
  }
  if (__osLogTrace) {
    v14 = __osLogTrace;
  }
  else {
    v14 = v7;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B3AF1000, v14, OS_LOG_TYPE_DEFAULT, "BKPresenceDetectOperation::startBioOperation -> void\n", buf, 2u);
  }
  kdebug_trace();
}

void __53__BKPresenceDetectOperation_startBioOperation_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    id v5 = +[BKErrorHelper errorWithOSStatus:a2];
    (*(void (**)(uint64_t, void, id))(v2 + 16))(v2, 0, v5);
  }
  else
  {
    v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
}

- (int64_t)priority
{
  return self->_priority;
}

- (void)setPriority:(int64_t)a3
{
  self->_priority = a3;
}

@end