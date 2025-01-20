@interface VCConnectionStatisticsCollector
- (VCConnectionStatisticsCollector)init;
- (id)connectionBasedTopPacketCountsWithUpdateTickCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4;
- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 mapLinkIDToLinkUUID:(id)a5 isOutgoing:(BOOL)a6;
- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 reportingTickCounts:(unsigned int)a5 mapLinkIDToLinkUUID:(id)a6 packetCountsPerConnection:(id)a7;
- (void)copyCopyPacketCountCallbackForOutgoing:(BOOL)a3 withCallback:(id)a4;
- (void)dealloc;
- (void)deallocCopyPacketCountCallBack:(BOOL)a3;
- (void)startPeriodicUpdateHistory:(BOOL)a3 withCopyPacketCountCallback:(id)a4;
- (void)startUpdateHistoryTimerForOutgoing:(BOOL)a3;
- (void)stopPeriodicHistoryUpdate;
- (void)updateHistory:(BOOL)a3;
@end

@implementation VCConnectionStatisticsCollector

- (void)updateHistory:(BOOL)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = 1048;
  if (a3)
  {
    uint64_t v4 = 24;
    uint64_t v5 = 2072;
  }
  else
  {
    uint64_t v5 = 2076;
  }
  uint64_t v6 = 16;
  if (a3) {
    uint64_t v6 = 8;
  }
  uint64_t v7 = 2104;
  if (a3) {
    uint64_t v7 = 2096;
  }
  uint64_t v8 = *(uint64_t *)((char *)&self->super.isa + v7);
  if (v8)
  {
    uint64_t v18 = v5;
    v9 = (char *)self + v4;
    v10 = *(Class *)((char *)&self->super.isa + v6);
    (*(void (**)(uint64_t, char *))(v8 + 16))(v8, (char *)self + v4);
    pthread_rwlock_wrlock(&self->_historyStateRWlock);
    for (uint64_t i = 0; i != 256; ++i)
    {
      uint64_t v12 = *(unsigned int *)&v9[4 * i];
      if (v12)
      {
        v13 = objc_msgSend(v10, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)i));
        if (v13)
        {
          v14 = v13;
          if ([v13 count] == 8) {
            [v14 removeFirstObject];
          }
          objc_msgSend(v14, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
        }
        else
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend(v15, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v12));
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, objc_msgSend(NSNumber, "numberWithUnsignedShort:", (unsigned __int16)i));
        }
      }
    }
    ++*(_DWORD *)((char *)&self->super.isa + v18);
    pthread_rwlock_unlock(&self->_historyStateRWlock);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = v16;
      __int16 v21 = 2080;
      v22 = "-[VCConnectionStatisticsCollector updateHistory:]";
      __int16 v23 = 1024;
      int v24 = 63;
      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callback not set", buf, 0x1Cu);
    }
  }
}

- (void)copyCopyPacketCountCallbackForOutgoing:(BOOL)a3 withCallback:(id)a4
{
  if (a3) {
    uint64_t v6 = 2096;
  }
  else {
    uint64_t v6 = 2104;
  }
  _Block_release(*(const void **)((char *)&self->super.isa + v6));
  *(Class *)((char *)&self->super.isa + v6) = (Class)_Block_copy(a4);
}

- (void)deallocCopyPacketCountCallBack:(BOOL)a3
{
  if (a3)
  {
    id copyPacketCountCallbackSend = self->_copyPacketCountCallbackSend;
    if (!copyPacketCountCallbackSend) {
      return;
    }
    p_id copyPacketCountCallbackSend = &self->_copyPacketCountCallbackSend;
  }
  else
  {
    id copyPacketCountCallbackSend = self->_copyPacketCountCallbackRecv;
    if (!copyPacketCountCallbackSend) {
      return;
    }
    p_id copyPacketCountCallbackSend = &self->_copyPacketCountCallbackRecv;
  }
  _Block_release(copyPacketCountCallbackSend);
  *p_id copyPacketCountCallbackSend = 0;
}

- (void)startUpdateHistoryTimerForOutgoing:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3) {
    uint64_t v5 = 2080;
  }
  else {
    uint64_t v5 = 2088;
  }
  global_queue = dispatch_get_global_queue(0, 0);
  uint64_t v7 = (objc_class *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, global_queue);
  *(Class *)((char *)&self->super.isa + v5) = v7;
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 5000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)((char *)&self->super.isa + v5), v8, 0x12A05F200uLL, 0);
    v9 = *(NSObject **)((char *)&self->super.isa + v5);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke;
    handler[3] = &unk_1E6DB3DF0;
    handler[4] = self;
    BOOL v14 = a3;
    dispatch_source_set_event_handler(v9, handler);
    v10 = *(NSObject **)((char *)&self->super.isa + v5);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke_2;
    v11[3] = &unk_1E6DB3DF0;
    v11[4] = self;
    BOOL v12 = a3;
    dispatch_source_set_cancel_handler(v10, v11);
    dispatch_resume(*(dispatch_object_t *)((char *)&self->super.isa + v5));
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionStatisticsCollector startUpdateHistoryTimerForOutgoing:]();
    }
  }
}

uint64_t __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateHistory:*(unsigned __int8 *)(a1 + 40)];
}

uint64_t __70__VCConnectionStatisticsCollector_startUpdateHistoryTimerForOutgoing___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) deallocCopyPacketCountCallBack:*(unsigned __int8 *)(a1 + 40)];
}

- (VCConnectionStatisticsCollector)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)VCConnectionStatisticsCollector;
  v2 = [(VCConnectionStatisticsCollector *)&v4 init];
  if (v2)
  {
    v2->_packetCountsHistorySent = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_packetCountsHistoryRecv = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pthread_rwlock_init(&v2->_historyStateRWlock, 0);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  pthread_rwlock_destroy(&self->_historyStateRWlock);
  v3.receiver = self;
  v3.super_class = (Class)VCConnectionStatisticsCollector;
  [(VCConnectionStatisticsCollector *)&v3 dealloc];
}

- (void)startPeriodicUpdateHistory:(BOOL)a3 withCopyPacketCountCallback:(id)a4
{
  if (a4)
  {
    if (a3)
    {
      if (self->_periodicHistoryUpdateSentTimer) {
        return;
      }
      -[VCConnectionStatisticsCollector copyCopyPacketCountCallbackForOutgoing:withCallback:](self, "copyCopyPacketCountCallbackForOutgoing:withCallback:", 1);
      uint64_t v5 = self;
      uint64_t v6 = 1;
    }
    else
    {
      if (self->_periodicHistoryUpdateRecvTimer) {
        return;
      }
      -[VCConnectionStatisticsCollector copyCopyPacketCountCallbackForOutgoing:withCallback:](self, "copyCopyPacketCountCallbackForOutgoing:withCallback:", 0);
      uint64_t v5 = self;
      uint64_t v6 = 0;
    }
    [(VCConnectionStatisticsCollector *)v5 startUpdateHistoryTimerForOutgoing:v6];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCConnectionStatisticsCollector startPeriodicUpdateHistory:withCopyPacketCountCallback:]();
    }
  }
}

- (void)stopPeriodicHistoryUpdate
{
  periodicHistoryUpdateSentTimer = self->_periodicHistoryUpdateSentTimer;
  if (periodicHistoryUpdateSentTimer)
  {
    dispatch_source_cancel(periodicHistoryUpdateSentTimer);
    uint64_t v4 = self->_periodicHistoryUpdateSentTimer;
    if (v4)
    {
      dispatch_release(v4);
      self->_periodicHistoryUpdateSentTimer = 0;
    }
  }
  periodicHistoryUpdateRecvTimer = self->_periodicHistoryUpdateRecvTimer;
  if (periodicHistoryUpdateRecvTimer)
  {
    dispatch_source_cancel(periodicHistoryUpdateRecvTimer);
    uint64_t v6 = self->_periodicHistoryUpdateRecvTimer;
    if (v6)
    {
      dispatch_release(v6);
      self->_periodicHistoryUpdateRecvTimer = 0;
    }
  }
}

- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 mapLinkIDToLinkUUID:(id)a5 isOutgoing:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unsigned int v13 = 0;
  p_historyStateRWlock = &self->_historyStateRWlock;
  pthread_rwlock_wrlock(&self->_historyStateRWlock);
  id v12 = [(VCConnectionStatisticsCollector *)self connectionBasedTopPacketCountsWithUpdateTickCounts:&v13 isOutgoing:v6];
  [(VCConnectionStatisticsCollector *)self addConnectionBasedTopPacketCountsTelemetry:a3 reportingKey:a4 reportingTickCounts:v13 mapLinkIDToLinkUUID:a5 packetCountsPerConnection:v12];
  pthread_rwlock_unlock(p_historyStateRWlock);
}

- (id)connectionBasedTopPacketCountsWithUpdateTickCounts:(unsigned int *)a3 isOutgoing:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 16;
  if (a4) {
    uint64_t v7 = 8;
  }
  dispatch_time_t v8 = *(Class *)((char *)&self->super.isa + v7);
  if ([v8 count])
  {
    uint64_t v9 = 2076;
    if (v4) {
      uint64_t v9 = 2072;
    }
    *a3 = *(_DWORD *)((char *)&self->super.isa + v9);
    CFBinaryHeapCallBacks v28 = *(CFBinaryHeapCallBacks *)byte_1F3D3E250;
    v10 = CFBinaryHeapCreate(0, 256, &v28, 0);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v11 = [v8 countByEnumeratingWithState:&v40 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v8);
          }
          uint64_t v15 = *(void *)(*((void *)&v40 + 1) + 8 * i);
          unsigned int v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", v15), "lastObject"), "unsignedIntValue");
          v37[1] = @"PktCnt";
          v38[0] = v15;
          v37[0] = @"linkID";
          v38[1] = [NSNumber numberWithUnsignedLongLong:v16];
          CFBinaryHeapAddValue(v10, (const void *)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2]);
        }
        uint64_t v12 = [v8 countByEnumeratingWithState:&v40 objects:v39 count:16];
      }
      while (v12);
    }
    id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v18 = 0;
    while (1)
    {
      Minimum = (void *)CFBinaryHeapGetMinimum(v10);
      if (!Minimum) {
        break;
      }
      uint64_t v20 = Minimum;
      CFBinaryHeapRemoveMinimumValue(v10);
      uint64_t v21 = [v20 objectForKeyedSubscript:@"linkID"];
      objc_msgSend(v17, "setObject:forKeyedSubscript:", objc_msgSend(v8, "objectForKeyedSubscript:", v21), v21);
      if (++v18 == 3) {
        goto LABEL_23;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_23;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    __int16 v23 = *MEMORY[0x1E4F47A50];
    int v24 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v30 = v22;
        __int16 v31 = 2080;
        v32 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
        __int16 v33 = 1024;
        int v34 = 217;
        __int16 v35 = 1024;
        int v36 = v18;
        _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Did not get max value for ranked=%d", buf, 0x22u);
        if (!v10) {
          return v17;
        }
        goto LABEL_24;
      }
LABEL_23:
      if (!v10) {
        return v17;
      }
      goto LABEL_24;
    }
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_23;
    }
    -[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]();
    if (v10) {
LABEL_24:
    }
      CFRelease(v10);
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v30 = v26;
        __int16 v31 = 2080;
        v32 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
        __int16 v33 = 1024;
        int v34 = 196;
        _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d History is empty", buf, 0x1Cu);
      }
    }
    id v17 = 0;
  }
  return v17;
}

- (void)addConnectionBasedTopPacketCountsTelemetry:(id)a3 reportingKey:(id)a4 reportingTickCounts:(unsigned int)a5 mapLinkIDToLinkUUID:(id)a6 packetCountsPerConnection:(id)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (a7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v10 = [a7 countByEnumeratingWithState:&v27 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(a7);
          }
          uint64_t v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = [v14 integerValue];
          unsigned int v16 = objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v15));
          id v17 = (void *)[a7 objectForKeyedSubscript:v14];
          [v9 appendString:objc_msgSend(NSString, "stringWithFormat:", @"%@.%@:", objc_msgSend(v16, "UUIDString"), objc_msgSend(v17, "componentsJoinedByString:", @","];
        }
        uint64_t v11 = [a7 countByEnumeratingWithState:&v27 objects:v26 count:16];
      }
      while (v11);
    }
    if ([v9 length]) {
      objc_msgSend(v9, "deleteCharactersInRange:", objc_msgSend(v9, "length") - 1, 1);
    }
    [a3 setObject:v9 forKeyedSubscript:a4];

    int v18 = [a4 isEqual:@"ULPH"];
    uint64_t v19 = [NSNumber numberWithUnsignedInt:a5];
    if (v18) {
      uint64_t v20 = @"ULPI";
    }
    else {
      uint64_t v20 = @"DLPI";
    }
    [a3 setObject:v19 forKeyedSubscript:v20];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    uint64_t v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v32 = v21;
      __int16 v33 = 2080;
      int v34 = "-[VCConnectionStatisticsCollector addConnectionBasedTopPacketCountsTelemetry:reportingKey:reportingTickCount"
            "s:mapLinkIDToLinkUUID:packetCountsPerConnection:]";
      __int16 v35 = 1024;
      int v36 = 235;
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d No ranks received", buf, 0x1Cu);
    }
  }
}

- (void)startUpdateHistoryTimerForOutgoing:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 119;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not create dispatch source", v1, 0x1Cu);
}

- (void)startPeriodicUpdateHistory:withCopyPacketCountCallback:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 153;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, " [%s] %s:%d callback passed is nil", v1, 0x1Cu);
}

- (void)connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCConnectionStatisticsCollector connectionBasedTopPacketCountsWithUpdateTickCounts:isOutgoing:]";
  __int16 v6 = 1024;
  int v7 = 217;
  __int16 v8 = 1024;
  int v9 = v1;
  _os_log_debug_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_DEBUG, " [%s] %s:%d Did not get max value for ranked=%d", v3, 0x22u);
}

@end