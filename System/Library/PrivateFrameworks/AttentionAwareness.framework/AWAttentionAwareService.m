@interface AWAttentionAwareService
+ (id)sharedAttentionService;
- (AWAttentionAwareService)init;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (id)getFaceDetectScheduler;
- (id)getMotionDetectScheduler;
- (unint64_t)clientCount;
- (void)LockScreenStateChanging:(BOOL)a3;
- (void)MotionStateChanging:(BOOL)a3;
- (void)_createUnitTestScheduler;
- (void)addClient:(id)a3 clientConfig:(id)a4 clientIndex:(int)a5 clientId:(id)a6 unitTestMode:(BOOL)a7 reply:(id)a8 subscribeForStreamingEvents:(BOOL)a9;
- (void)carPlayStateChanging:(BOOL)a3;
- (void)clientCountChangedFrom:(unint64_t)a3 to:(unint64_t)a4 forScheduler:(id)a5;
- (void)crashWithReply:(id)a3;
- (void)dealloc;
- (void)getDebugPreferences:(id)a3;
- (void)getSupportedEventsWithReply:(id)a3;
- (void)getUnitTestSamplerWithReply:(id)a3;
- (void)outputPowerLogWithReply:(id)a3;
- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6;
- (void)screenStateChanging:(BOOL)a3;
- (void)setClientCount:(unint64_t)a3;
- (void)setDebugPreference:(id)a3 reply:(id)a4;
- (void)setSmartCoverClosed:(BOOL)a3;
@end

@implementation AWAttentionAwareService

void __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke_69(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 allowHIDEvents]) {
    [v4 processHIDEvent:a1[5] mask:a1[6] timestamp:a1[7] senderID:a1[8] displayUUID:a1[4]];
  }
}

- (unint64_t)clientCount
{
  return self->_clientCount;
}

- (void)processHIDEvent:(__IOHIDEvent *)a3 mask:(unint64_t)a4 timestamp:(unint64_t)a5 senderID:(unint64_t)a6
{
  unint64_t v7 = a5;
  if (!a5) {
    unint64_t v7 = absTimeNS();
  }
  CFRetain(a3);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke;
  block[3] = &unk_1E606A1D0;
  block[6] = a4;
  block[7] = a6;
  block[4] = self;
  block[5] = v7;
  block[8] = a3;
  dispatch_async(queue, block);
}

void __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (currentLogLevel < 7) {
    goto LABEL_17;
  }
  v2 = _AALog();
  if (!os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_16;
  }
  v3 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
  for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
        *(i - 1) == 47;
        ++i)
  {
    v3 = i;
LABEL_8:
    ;
  }
  if (*(i - 1)) {
    goto LABEL_8;
  }
  unint64_t v5 = absTimeNS();
  if (v5 == -1) {
    double v6 = INFINITY;
  }
  else {
    double v6 = (double)v5 / 1000000000.0;
  }
  unint64_t v7 = *(void *)(a1 + 40);
  if (v7 == -1) {
    double v8 = INFINITY;
  }
  else {
    double v8 = (double)v7 / 1000000000.0;
  }
  v9 = getEventMaskDescription(*(void *)(a1 + 48));
  *(_DWORD *)buf = 136316162;
  v28 = v3;
  __int16 v29 = 1024;
  int v30 = 294;
  __int16 v31 = 2048;
  double v32 = v6;
  __int16 v33 = 2048;
  double v34 = v8;
  __int16 v35 = 2112;
  v36 = v9;
  _os_log_impl(&dword_1B3B4B000, v2, OS_LOG_TYPE_DEFAULT, "%30s:%-4d: %13.5f: received event %13.5f: %@", buf, 0x30u);

LABEL_16:
LABEL_17:
  unint64_t v10 = *(void *)(a1 + 48);
  BOOL v11 = v10 > 8;
  uint64_t v12 = (1 << v10) & 0x114;
  if (v11 || v12 == 0) {
    goto LABEL_28;
  }
  CFTypeID v14 = *(void *)(a1 + 56) ? CFGetTypeID(*(CFTypeRef *)(a1 + 56)) : -1;
  if (v14 != IOHIDServiceGetTypeID()) {
    goto LABEL_28;
  }
  id Property = (id)IOHIDServiceGetProperty();
  if (Property)
  {
    v16 = Property;
    CFTypeID v17 = CFGetTypeID(Property);
    if (v17 == CFStringGetTypeID())
    {
      id Property = v16;
      goto LABEL_29;
    }
LABEL_28:
    id Property = 0;
  }
LABEL_29:
  v18 = *(void **)(*(void *)(a1 + 32) + 16);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __67__AWAttentionAwareService_processHIDEvent_mask_timestamp_senderID___block_invoke_69;
  v22[3] = &unk_1E606A1A8;
  int8x16_t v25 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  uint64_t v19 = *(void *)(a1 + 64);
  uint64_t v26 = *(void *)(a1 + 56);
  id v23 = Property;
  uint64_t v24 = v19;
  id v20 = Property;
  [v18 enumerateKeysAndObjectsUsingBlock:v22];
  CFRelease(*(CFTypeRef *)(a1 + 64));
  v21 = +[AWEventStatistics sharedStatistics];
  [v21 logEvent:*(void *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockScreenStateObserver, 0);
  objc_storeStrong((id *)&self->_motionActivityObserver, 0);
  objc_storeStrong((id *)&self->_carPlayStateObserver, 0);
  objc_storeStrong((id *)&self->_screenStateObserver, 0);
  objc_storeStrong((id *)&self->_schedulers, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)setClientCount:(unint64_t)a3
{
  self->_clientCount = a3;
}

- (void)LockScreenStateChanging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    unint64_t v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      uint64_t v12 = "IS NOT";
      if (v3) {
        uint64_t v12 = "IS";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)id v23 = v12;
      v13 = "%13.5f: Device %s on lock screen";
      CFTypeID v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    double v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        double v8 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        v16 = "IS NOT";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          v16 = "IS";
        }
        *(_DWORD *)id v23 = 522;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        int8x16_t v25 = v16;
        v13 = "%30s:%-4d: %13.5f: Device %s on lock screen";
        CFTypeID v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  schedulers = self->_schedulers;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__AWAttentionAwareService_LockScreenStateChanging___block_invoke;
  v18[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  BOOL v19 = v3;
  [(NSMutableDictionary *)schedulers enumerateKeysAndObjectsUsingBlock:v18];
}

uint64_t __51__AWAttentionAwareService_LockScreenStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 lockScreenStateChanging:*(unsigned __int8 *)(a1 + 32)];
}

- (void)MotionStateChanging:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (currentLogLevel == 5)
  {
    unint64_t v5 = _AALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v6 = absTimeNS();
      if (v6 == -1) {
        double v7 = INFINITY;
      }
      else {
        double v7 = (double)v6 / 1000000000.0;
      }
      uint64_t v12 = "IS NOT";
      if (v3) {
        uint64_t v12 = "IS";
      }
      *(_DWORD *)buf = 134218242;
      double v21 = v7;
      __int16 v22 = 2080;
      *(void *)id v23 = v12;
      v13 = "%13.5f: Device %s stationary";
      CFTypeID v14 = v5;
      uint32_t v15 = 22;
      goto LABEL_23;
    }
    goto LABEL_24;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v5 = _AALog();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_24;
    }
    double v8 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
    for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
          ;
          ++i)
    {
      if (*(i - 1) == 47)
      {
        double v8 = i;
      }
      else if (!*(i - 1))
      {
        unint64_t v10 = absTimeNS();
        if (v10 == -1) {
          double v11 = INFINITY;
        }
        else {
          double v11 = (double)v10 / 1000000000.0;
        }
        v16 = "IS NOT";
        *(_DWORD *)buf = 136315906;
        double v21 = *(double *)&v8;
        __int16 v22 = 1024;
        if (v3) {
          v16 = "IS";
        }
        *(_DWORD *)id v23 = 514;
        *(_WORD *)&v23[4] = 2048;
        *(double *)&v23[6] = v11;
        __int16 v24 = 2080;
        int8x16_t v25 = v16;
        v13 = "%30s:%-4d: %13.5f: Device %s stationary";
        CFTypeID v14 = v5;
        uint32_t v15 = 38;
LABEL_23:
        _os_log_impl(&dword_1B3B4B000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_24:

        break;
      }
    }
  }
  schedulers = self->_schedulers;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__AWAttentionAwareService_MotionStateChanging___block_invoke;
  v18[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  BOOL v19 = v3;
  [(NSMutableDictionary *)schedulers enumerateKeysAndObjectsUsingBlock:v18];
}

uint64_t __47__AWAttentionAwareService_MotionStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 motionActivityChanging:*(unsigned __int8 *)(a1 + 32)];
}

- (void)carPlayStateChanging:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  schedulers = self->_schedulers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__AWAttentionAwareService_carPlayStateChanging___block_invoke;
  v6[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  BOOL v7 = a3;
  [(NSMutableDictionary *)schedulers enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __48__AWAttentionAwareService_carPlayStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 carPlayStateChanging:*(unsigned __int8 *)(a1 + 32)];
}

- (void)screenStateChanging:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  schedulers = self->_schedulers;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__AWAttentionAwareService_screenStateChanging___block_invoke;
  v6[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  BOOL v7 = a3;
  [(NSMutableDictionary *)schedulers enumerateKeysAndObjectsUsingBlock:v6];
}

uint64_t __47__AWAttentionAwareService_screenStateChanging___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 screenStateChanging:*(unsigned __int8 *)(a1 + 32)];
}

- (id)getFaceDetectScheduler
{
  return (id)[(NSMutableDictionary *)self->_schedulers objectForKey:@"Face detect scheduler"];
}

- (id)getMotionDetectScheduler
{
  return (id)[(NSMutableDictionary *)self->_schedulers objectForKey:@"Motion detect scheduler"];
}

- (void)crashWithReply:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void (**)(id, void *))a3;
  id v4 = [MEMORY[0x1E4F29268] currentConnection];
  int HasEntitlement = connectionHasEntitlement(v4, @"com.apple.private.attentionawareness.unittest");

  if (HasEntitlement)
  {
    if (MGGetBoolAnswer()) {
      abort();
    }
    unint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F28798];
    uint64_t v25 = *MEMORY[0x1E4F28568];
    v26[0] = @" Client not allowed to crash the process";
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
    v9 = v6;
    uint64_t v10 = v7;
    uint64_t v11 = 22;
  }
  else
  {
    if (currentLogLevel >= 3)
    {
      uint64_t v12 = _AALog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        unint64_t v16 = absTimeNS();
        if (v16 == -1) {
          double v17 = INFINITY;
        }
        else {
          double v17 = (double)v16 / 1000000000.0;
        }
        v18 = [MEMORY[0x1E4F29268] currentConnection];
        *(_DWORD *)buf = 134218240;
        double v22 = v17;
        __int16 v23 = 1024;
        int v24 = [v18 processIdentifier];
        _os_log_error_impl(&dword_1B3B4B000, v12, OS_LOG_TYPE_ERROR, "%13.5f: process %d not entitled to use unit test sampling", buf, 0x12u);
      }
    }
    v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = *MEMORY[0x1E4F28798];
    uint64_t v19 = *MEMORY[0x1E4F28568];
    id v20 = @" Client not entitled to use crash the process";
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    v9 = v13;
    uint64_t v10 = v14;
    uint64_t v11 = 1;
  }
  uint32_t v15 = [v9 errorWithDomain:v10 code:v11 userInfo:v8];

  v3[2](v3, v15);
}

- (void)getUnitTestSamplerWithReply:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  uint64_t v14 = 0;
  uint32_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  double v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  unint64_t v5 = [MEMORY[0x1E4F29268] currentConnection];
  int HasEntitlement = connectionHasEntitlement(v5, @"com.apple.private.attentionawareness.unittest");

  if (HasEntitlement)
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __55__AWAttentionAwareService_getUnitTestSamplerWithReply___block_invoke;
    v13[3] = &unk_1E606AB38;
    v13[4] = self;
    v13[5] = &v14;
    dispatch_sync(queue, v13);
  }
  else if (currentLogLevel >= 3)
  {
    double v8 = _AALog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      unint64_t v9 = absTimeNS();
      if (v9 == -1) {
        double v10 = INFINITY;
      }
      else {
        double v10 = (double)v9 / 1000000000.0;
      }
      uint64_t v11 = [MEMORY[0x1E4F29268] currentConnection];
      int v12 = [v11 processIdentifier];
      *(_DWORD *)buf = 134218240;
      double v21 = v10;
      __int16 v22 = 1024;
      int v23 = v12;
      _os_log_error_impl(&dword_1B3B4B000, v8, OS_LOG_TYPE_ERROR, "%13.5f: process %d not entitled to use unit test sampling", buf, 0x12u);
    }
  }
  v4[2](v4, v15[5]);
  _Block_object_dispose(&v14, 8);
}

void __55__AWAttentionAwareService_getUnitTestSamplerWithReply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _createUnitTestScheduler];
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"Unit test scheduler"];
  id v6 = [v2 attentionSampler];

  uint64_t v3 = [v6 unitTestSampler];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void)_createUnitTestScheduler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v3 = [(NSMutableDictionary *)self->_schedulers valueForKey:@"Unit test scheduler"];

  if (!v3)
  {
    schedulers = self->_schedulers;
    unint64_t v5 = +[AWScheduler sharedUnitTestScheduler];
    [(NSMutableDictionary *)schedulers setObject:v5 forKey:@"Unit test scheduler"];

    id v6 = [(NSMutableDictionary *)self->_schedulers objectForKeyedSubscript:@"Unit test scheduler"];
    [v6 setObserver:self];
  }
}

- (void)outputPowerLogWithReply:(id)a3
{
  uint64_t v7 = (void (**)(id, __CFString *))a3;
  uint64_t v3 = [MEMORY[0x1E4F29268] currentConnection];
  int HasEntitlement = connectionHasEntitlement(v3, @"com.apple.private.attentionawareness.configuration");

  if (HasEntitlement)
  {
    unint64_t v5 = +[AWSampleLogger sharedLogger];
    [v5 outputPowerLog];

    id v6 = @"success";
  }
  else
  {
    id v6 = @"Not entitled";
  }
  v7[2](v7, v6);
}

- (void)setDebugPreference:(id)a3 reply:(id)a4
{
  id v17 = a3;
  unint64_t v5 = (void (**)(id, __CFString *))a4;
  id v6 = [MEMORY[0x1E4F29268] currentConnection];
  int HasEntitlement = connectionHasEntitlement(v6, @"com.apple.private.attentionawareness.configuration");

  if (!HasEntitlement)
  {
    unint64_t v9 = @"Not entitled";
    goto LABEL_19;
  }
  uint64_t v8 = [v17 rangeOfString:@"="];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v9 = [NSString stringWithFormat:@"no value specified for key %@", v17];
    goto LABEL_19;
  }
  uint64_t v10 = v8;
  uint64_t v11 = [v17 substringToIndex:v8];
  int v12 = [v17 substringFromIndex:v10 + 1];
  if (![(__CFString *)v11 isEqualToString:@"LogLevel"])
  {
    if (![(__CFString *)v11 isEqualToString:@"PearlDisabled"])
    {
      unint64_t v9 = [NSString stringWithFormat:@"invalid key %@", v11];
      goto LABEL_18;
    }
    if ([v12 BOOLValue])
    {
      uint64_t v15 = [NSNumber numberWithBool:1];
      goto LABEL_14;
    }
LABEL_15:
    uint64_t v16 = 0;
    goto LABEL_16;
  }
  int v13 = [v12 intValue];
  if ((v13 & ~(v13 >> 31)) >= 7) {
    int v14 = 7;
  }
  else {
    int v14 = v13 & ~(v13 >> 31);
  }
  currentLogLevel = v14;
  if (v14 == 5) {
    goto LABEL_15;
  }
  uint64_t v15 = objc_msgSend(NSNumber, "numberWithInt:");
LABEL_14:
  uint64_t v16 = (void *)v15;
LABEL_16:
  CFPreferencesSetAppValue(v11, v16, @"com.apple.AttentionAwareness");
  CFPreferencesAppSynchronize(@"com.apple.AttentionAwareness");
  notify_post("com.apple.AttentionAwareness.PreferencesChanged");
  unint64_t v9 = [NSString stringWithFormat:@"set %@ to %@", v11, v16];

LABEL_18:
LABEL_19:
  v5[2](v5, v9);
}

- (void)getDebugPreferences:(id)a3
{
  uint64_t v3 = (void (**)(id, CFDictionaryRef))a3;
  CFPreferencesAppSynchronize(@"com.apple.AttentionAwareness");
  CFDictionaryRef v4 = CFPreferencesCopyMultiple(0, @"com.apple.AttentionAwareness", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  v3[2](v3, v4);
}

- (void)getSupportedEventsWithReply:(id)a3
{
  id v6 = a3;
  if (deviceSupportsPearl()) {
    uint64_t v4 = 207;
  }
  else {
    uint64_t v4 = 79;
  }
  if (MGGetBoolAnswer()) {
    uint64_t v5 = v4 | 0x200;
  }
  else {
    uint64_t v5 = v4;
  }
  (*((void (**)(id, uint64_t))a3 + 2))(v6, v5);
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke;
  v4[3] = &unk_1E606AC00;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(queue, v4);
}

uint64_t __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke_2;
  v3[3] = &__block_descriptor_33_e38_v32__0__NSString_8__AWScheduler_16_B24l;
  char v4 = *(unsigned char *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __47__AWAttentionAwareService_setSmartCoverClosed___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 setSmartCoverClosed:*(unsigned __int8 *)(a1 + 32)];
}

- (void)addClient:(id)a3 clientConfig:(id)a4 clientIndex:(int)a5 clientId:(id)a6 unitTestMode:(BOOL)a7 reply:(id)a8 subscribeForStreamingEvents:(BOOL)a9
{
  BOOL v10 = a7;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  v18 = (void (**)(id, void, uint64_t, void *))a8;
  if (v10
    && ([MEMORY[0x1E4F29268] currentConnection],
        id v19 = objc_claimAutoreleasedReturnValue(),
        char HasEntitlement = connectionHasEntitlement(v19, @"com.apple.private.attentionawareness.unittest"),
        v19,
        (HasEntitlement & 1) == 0))
  {
    if (currentLogLevel >= 3)
    {
      __int16 v22 = _AALog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        unint64_t v27 = absTimeNS();
        if (v27 == -1) {
          double v28 = INFINITY;
        }
        else {
          double v28 = (double)v27 / 1000000000.0;
        }
        __int16 v29 = [v16 identifier];
        *(_DWORD *)buf = 134218242;
        double v41 = v28;
        __int16 v42 = 2112;
        v43 = v29;
        _os_log_error_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_ERROR, "%13.5f: client %@ not entitled for unit test access", buf, 0x16u);
      }
    }
    int v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28798];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    v39 = @" Client not entitled to unit test access";
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v26 = [v23 errorWithDomain:v24 code:1 userInfo:v25];

    v18[2](v18, 0, 0xFFFFFFFFLL, v26);
  }
  else
  {
    queue = self->_queue;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke;
    v30[3] = &unk_1E606A180;
    BOOL v36 = v10;
    v30[4] = self;
    id v31 = v16;
    double v34 = v18;
    BOOL v37 = a9;
    id v32 = v17;
    id v33 = v15;
    int v35 = a5;
    dispatch_sync(queue, v30);
  }
}

void __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(a1 + 76))
  {
    [*(id *)(a1 + 32) _createUnitTestScheduler];
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) valueForKey:@"Unit test scheduler"];
  }
  else
  {
    int v3 = [*(id *)(a1 + 40) activateMotionDetect];
    char v4 = *(void **)(a1 + 32);
    if (v3) {
      [v4 getMotionDetectScheduler];
    }
    else {
    uint64_t v2 = [v4 getFaceDetectScheduler];
    }
  }
  BOOL v5 = (void *)v2;
  if (([*(id *)(a1 + 40) eventMask] & 0x80) != 0
    && (block[0] = MEMORY[0x1E4F143A8],
        block[1] = 3221225472,
        block[2] = __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke_2,
        block[3] = &unk_1E606AC70,
        block[4] = *(void *)(a1 + 32),
        CARColorFilterIntensityBlueYellowKey_block_invoke_onceToken != -1))
  {
    dispatch_once(&CARColorFilterIntensityBlueYellowKey_block_invoke_onceToken, block);
    if (v5) {
      goto LABEL_10;
    }
  }
  else if (v5)
  {
LABEL_10:
    if (*(unsigned char *)(a1 + 77)
      && ([v5 resetInterruptedStreamingClientWithIdentifier:*(void *)(a1 + 48)],
          (id v6 = (AWRemoteClient *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v7 = v6;
      if ([(AWRemoteClient *)v6 invalid]) {
        __assert_rtn("-[AWAttentionAwareService addClient:clientConfig:clientIndex:clientId:unitTestMode:reply:subscribeForStreamingEvents:]_block_invoke", "AttentionAwareService.m", 250, "!client.invalid");
      }
      id v8 = 0;
    }
    else
    {
      unint64_t v9 = [AWRemoteClient alloc];
      uint64_t v10 = *(void *)(a1 + 56);
      uint64_t v11 = [MEMORY[0x1E4F29268] currentConnection];
      uint64_t v12 = *(unsigned int *)(a1 + 72);
      uint64_t v13 = *(void *)(a1 + 40);
      uint64_t v14 = *(void *)(a1 + 48);
      id v29 = 0;
      uint64_t v7 = [(AWRemoteClient *)v9 initWithProxy:v10 connection:v11 clientConfig:v13 clientIndex:v12 clientId:v14 scheduler:v5 error:&v29];
      id v8 = v29;

      if (!v7)
      {
        if (currentLogLevel >= 3)
        {
          id v17 = _AALog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            unint64_t v20 = absTimeNS();
            if (v20 == -1) {
              double v21 = INFINITY;
            }
            else {
              double v21 = (double)v20 / 1000000000.0;
            }
            *(_DWORD *)buf = 134218242;
            double v34 = v21;
            __int16 v35 = 2112;
            id v36 = v8;
            _os_log_error_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_ERROR, "%13.5f: addClient failed: %@", buf, 0x16u);
          }
        }
        uint64_t v7 = 0;
        uint64_t v18 = *(void *)(a1 + 64);
        uint64_t v19 = 0xFFFFFFFFLL;
        goto LABEL_23;
      }
      if (*(unsigned char *)(a1 + 77))
      {
        id v15 = [(AWRemoteClient *)v7 clientId];
        uint64_t v16 = [v5 addStreamingClient:v7 withIdentifier:v15];

        id v8 = (id)v16;
      }
      else
      {
        [v5 addClient:v7];
      }
    }
    uint64_t v18 = *(void *)(a1 + 64);
    uint64_t v19 = [(AWRemoteClient *)v7 clientIndex];
LABEL_23:
    (*(void (**)(uint64_t, AWRemoteClient *, uint64_t, id))(v18 + 16))(v18, v7, v19, v8);

    goto LABEL_33;
  }
  if (currentLogLevel >= 3)
  {
    __int16 v22 = _AALog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      unint64_t v26 = absTimeNS();
      if (v26 == -1) {
        double v27 = INFINITY;
      }
      else {
        double v27 = (double)v26 / 1000000000.0;
      }
      double v28 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 134218242;
      double v34 = v27;
      __int16 v35 = 2112;
      id v36 = v28;
      _os_log_error_impl(&dword_1B3B4B000, v22, OS_LOG_TYPE_ERROR, "%13.5f: Unable to get a scheduler for client %@", buf, 0x16u);
    }
  }
  int v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v24 = *MEMORY[0x1E4F28798];
  uint64_t v31 = *MEMORY[0x1E4F28568];
  id v32 = @" Unable to get a suitable scheduler for client";
  uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
  id v8 = [v23 errorWithDomain:v24 code:42 userInfo:v25];

  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
LABEL_33:
}

uint64_t __118__AWAttentionAwareService_addClient_clientConfig_clientIndex_clientId_unitTestMode_reply_subscribeForStreamingEvents___block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 64) = -[LockScreenStateObserver initWithCallbackQueue:observer:]([LockScreenStateObserver alloc], "initWithCallbackQueue:observer:", *(void *)(*(void *)(a1 + 32) + 8));

  return MEMORY[0x1F41817F8]();
}

- (void)clientCountChangedFrom:(unint64_t)a3 to:(unint64_t)a4 forScheduler:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(AWAttentionAwareService *)self setClientCount:a4 - a3 + [(AWAttentionAwareService *)self clientCount]];
  if (currentLogLevel == 5)
  {
    unint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = absTimeNS();
      if (v10 == -1) {
        double v11 = INFINITY;
      }
      else {
        double v11 = (double)v10 / 1000000000.0;
      }
      int v23 = 134218240;
      double v24 = v11;
      __int16 v25 = 2048;
      *(void *)unint64_t v26 = [(AWAttentionAwareService *)self clientCount];
      uint64_t v16 = "%13.5f: %lu total attention aware service clients";
      id v17 = v9;
      uint32_t v18 = 22;
LABEL_19:
      _os_log_impl(&dword_1B3B4B000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v23, v18);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (currentLogLevel >= 6)
  {
    unint64_t v9 = _AALog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = "/Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
      for (i = "Library/Caches/com.apple.xbs/Sources/AttentionAwareness/Framework/XPCService/CoreService/AttentionAwareService.m";
            ;
            ++i)
      {
        if (*(i - 1) == 47)
        {
          uint64_t v12 = i;
        }
        else if (!*(i - 1))
        {
          unint64_t v14 = absTimeNS();
          if (v14 == -1) {
            double v15 = INFINITY;
          }
          else {
            double v15 = (double)v14 / 1000000000.0;
          }
          int v23 = 136315906;
          double v24 = *(double *)&v12;
          __int16 v25 = 1024;
          *(_DWORD *)unint64_t v26 = 169;
          *(_WORD *)&v26[4] = 2048;
          *(double *)&v26[6] = v15;
          __int16 v27 = 2048;
          unint64_t v28 = [(AWAttentionAwareService *)self clientCount];
          uint64_t v16 = "%30s:%-4d: %13.5f: %lu total attention aware service clients";
          id v17 = v9;
          uint32_t v18 = 38;
          goto LABEL_19;
        }
      }
    }
    goto LABEL_20;
  }
LABEL_21:
  if (!a4)
  {
    uint64_t v19 = [(NSMutableDictionary *)self->_schedulers valueForKey:@"Unit test scheduler"];
    if (v19)
    {
      unint64_t v20 = (void *)v19;
      id v21 = [(NSMutableDictionary *)self->_schedulers objectForKeyedSubscript:@"Unit test scheduler"];

      if (v21 == v8)
      {
        __int16 v22 = [(NSMutableDictionary *)self->_schedulers objectForKeyedSubscript:@"Unit test scheduler"];
        [v22 setObserver:0];

        [(NSMutableDictionary *)self->_schedulers removeObjectForKey:@"Unit test scheduler"];
      }
    }
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int HasEntitlement = connectionHasEntitlement(v7, @"com.apple.private.attentionawareness");
  if (HasEntitlement)
  {
    unint64_t v9 = xpcInterfaceForScheduler();
    [v7 setExportedInterface:v9];

    [v7 setExportedObject:self];
    objc_initWeak(&location, v7);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke;
    v11[3] = &unk_1E606A548;
    v11[4] = self;
    objc_copyWeak(&v12, &location);
    [v7 setInvalidationHandler:v11];
    [v7 resume];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

  return HasEntitlement;
}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_2;
  v3[3] = &unk_1E606A548;
  void v3[4] = v1;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, v3);
  objc_destroyWeak(&v4);
}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 16);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_3;
  v2[3] = &unk_1E606A158;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 enumerateKeysAndObjectsUsingBlock:v2];
  objc_destroyWeak(&v3);
}

void __62__AWAttentionAwareService_listener_shouldAcceptNewConnection___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [v4 removeInvalidClientsWithConnection:WeakRetained];
}

- (void)dealloc
{
  int supportedEventsNotify = self->_supportedEventsNotify;
  if (supportedEventsNotify != -1) {
    notify_cancel(supportedEventsNotify);
  }
  v4.receiver = self;
  v4.super_class = (Class)AWAttentionAwareService;
  [(AWAttentionAwareService *)&v4 dealloc];
}

- (AWAttentionAwareService)init
{
  v29.receiver = self;
  v29.super_class = (Class)AWAttentionAwareService;
  uint64_t v2 = [(AWAttentionAwareService *)&v29 init];
  if (v2)
  {
    uint64_t v3 = awQueue(1);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    if (deviceSupportsPearl()) {
      uint64_t v5 = 207;
    }
    else {
      uint64_t v5 = 79;
    }
    int v6 = MGGetBoolAnswer();
    uint64_t v7 = v5 | 0x200;
    if (!v6) {
      uint64_t v7 = v5;
    }
    v2->_supportedEvents = v7;
    id v8 = v2;
    unint64_t v9 = v2->_queue;
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __31__AWAttentionAwareService_init__block_invoke;
    handler[3] = &unk_1E606A7F8;
    unint64_t v28 = v8;
    notify_register_dispatch("com.apple.AttentionAwareness.SupportedEventsChanged", &v8->_supportedEventsNotify, v9, handler);
    unint64_t v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    schedulers = v8->_schedulers;
    v8->_schedulers = v10;

    id v12 = v8->_schedulers;
    uint64_t v13 = +[AWScheduler sharedScheduler];
    [(NSMutableDictionary *)v12 setObject:v13 forKey:@"Face detect scheduler"];

    unint64_t v14 = [(NSMutableDictionary *)v8->_schedulers objectForKeyedSubscript:@"Face detect scheduler"];
    [v14 setObserver:v8];

    if (MGGetBoolAnswer())
    {
      double v15 = v8->_schedulers;
      uint64_t v16 = +[AWScheduler sharedMotionDetectScheduler];
      [(NSMutableDictionary *)v15 setObject:v16 forKey:@"Motion detect scheduler"];

      id v17 = [(NSMutableDictionary *)v8->_schedulers objectForKeyedSubscript:@"Motion detect scheduler"];
      [v17 setObserver:v8];
    }
    uint32_t v18 = [[ScreenStateObserver alloc] initWithCallbackQueue:v2->_queue observer:v8];
    screenStateObserver = v8->_screenStateObserver;
    v8->_screenStateObserver = v18;

    unint64_t v20 = [[CarPlayStateObserver alloc] initWithCallbackQueue:v2->_queue observer:v8];
    carPlayStateObserver = v8->_carPlayStateObserver;
    v8->_carPlayStateObserver = v20;

    __int16 v22 = [[MotionActivityObserver alloc] initWithCallbackQueue:v2->_queue observer:v8];
    motionActivityObserver = v8->_motionActivityObserver;
    v8->_motionActivityObserver = v22;

    double v24 = +[AWPersistentDataManager sharedManager];
    [v24 loadPersistentData];

    __int16 v25 = (void *)[objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.AttentionAwareness"];
    [v25 setDelegate:v8];
    [v25 resume];
  }
  return v2;
}

uint64_t __31__AWAttentionAwareService_init__block_invoke(uint64_t a1)
{
  if (deviceSupportsPearl()) {
    uint64_t v2 = 207;
  }
  else {
    uint64_t v2 = 79;
  }
  uint64_t result = MGGetBoolAnswer();
  uint64_t v4 = v2 | 0x200;
  if (!result) {
    uint64_t v4 = v2;
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(void *)(v5 + 32) != v4)
  {
    *(void *)(v5 + 32) = v4;
    int v6 = *(void **)(*(void *)(a1 + 32) + 16);
    return [v6 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_23];
  }
  return result;
}

uint64_t __31__AWAttentionAwareService_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 reevaluate];
}

+ (id)sharedAttentionService
{
  if (sharedAttentionService_onceToken != -1) {
    dispatch_once(&sharedAttentionService_onceToken, &__block_literal_global_468);
  }
  uint64_t v2 = (void *)sharedAttentionService_attentionService;

  return v2;
}

uint64_t __49__AWAttentionAwareService_sharedAttentionService__block_invoke()
{
  sharedAttentionService_attentionService = objc_alloc_init(AWAttentionAwareService);

  return MEMORY[0x1F41817F8]();
}

@end