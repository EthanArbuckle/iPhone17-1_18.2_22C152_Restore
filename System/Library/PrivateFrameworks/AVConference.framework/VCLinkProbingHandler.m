@interface VCLinkProbingHandler
- (BOOL)isDuplicationEnabled;
- (BOOL)isLinkProbingActive;
- (BOOL)isValidProbingResult:(id)a3;
- (NSSet)activelyProbingLinkIDs;
- (VCLinkProbingHandler)initWithDelegate:(id)a3;
- (VCLinkProbingHandlerDelegate)linkProbingHandlerDelegate;
- (id)getProbingResultsForLinkID:(id)a3;
- (unsigned)linkProbingCapabilityVersion;
- (void)dealloc;
- (void)dispatchedUpdateProbingResults:(id)a3;
- (void)dispatchedUpdateQRProbingResult:(id)a3;
- (void)flushProbingResults:(id)a3;
- (void)loadStorebagValues;
- (void)probingLockdownEnded;
- (void)queryProbingResults;
- (void)removeProbingResultsForLinks:(id)a3;
- (void)requestStats;
- (void)resetAggregatedProbingResults;
- (void)setIsDuplicationEnabled:(BOOL)a3;
- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3;
- (void)setLinkProbingHandlerDelegate:(id)a3;
- (void)setLinkProbingResultConfig;
- (void)setQRLinkID:(id)a3;
- (void)startActiveProbingOnLinks:(id)a3;
- (void)startActiveProbingQRLink;
- (void)stopActiveProbingOnLinks:(id)a3 resetStats:(BOOL)a4;
- (void)stopActiveProbingQRLink;
- (void)updateLinkPreferenceOrder;
- (void)updateProbingResults:(id)a3;
- (void)updateQRProbingResult:(id)a3;
@end

@implementation VCLinkProbingHandler

- (VCLinkProbingHandler)initWithDelegate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCLinkProbingHandler;
  v4 = [(VCLinkProbingHandler *)&v18 init];
  v5 = v4;
  if (v4)
  {
    [(VCLinkProbingHandler *)v4 loadStorebagValues];
    [(VCLinkProbingHandler *)v5 setLinkProbingHandlerDelegate:a3];
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v5->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcLinkProbing.delegateQueue", 0, CustomRootQueue);
    v5->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.vcLinkProbing.serialQueue", 0, CustomRootQueue);
    uint64_t v7 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v5];
    v8 = [VCDispatchTimer alloc];
    uint64_t linkProbingQueryResultsInterval = v5->_linkProbingQueryResultsInterval;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke;
    v17[3] = &unk_1E6DB3DC8;
    v17[4] = v7;
    v5->_queryProbingResultsTimer = [(VCDispatchTimer *)v8 initWithIntervalSeconds:linkProbingQueryResultsInterval callbackBlock:v17 clientQueue:v5->_serialQueue];
    v10 = [VCDispatchTimer alloc];
    uint64_t linkProbingLockdownPeriod = v5->_linkProbingLockdownPeriod;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke_2;
    v16[3] = &unk_1E6DB3DC8;
    v16[4] = v7;
    v5->_probingLockdownTimer = [(VCDispatchTimer *)v10 initWithIntervalSeconds:linkProbingLockdownPeriod callbackBlock:v16 clientQueue:v5->_serialQueue];
    v5->_aggregatedProbingResults = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    v5->_activelyProbingLinkIDs = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v12 = [VCDispatchTimer alloc];
    uint64_t linkProbingQRStatFrequency = v5->_linkProbingQRStatFrequency;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __41__VCLinkProbingHandler_initWithDelegate___block_invoke_3;
    v15[3] = &unk_1E6DB3DC8;
    v15[4] = v7;
    v5->_requestStatsTimer = [(VCDispatchTimer *)v12 initWithIntervalMilliseconds:linkProbingQRStatFrequency callbackBlock:v15 clientQueue:v5->_serialQueue];
    v5->_activeQRStatRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  return v5;
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 queryProbingResults];
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke_2(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 probingLockdownEnded];
}

uint64_t __41__VCLinkProbingHandler_initWithDelegate___block_invoke_3(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) strong];

  return [v1 requestStats];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(VCDispatchTimer *)self->_queryProbingResultsTimer stop];
  [(VCDispatchTimer *)self->_probingLockdownTimer stop];

  objc_storeWeak((id *)&self->_linkProbingHandlerDelegate, 0);
  dispatch_release((dispatch_object_t)self->_delegateQueue);
  self->_delegateQueue = 0;
  dispatch_release((dispatch_object_t)self->_serialQueue);
  self->_serialQueue = 0;

  [(VCDispatchTimer *)self->_requestStatsTimer stop];
  v3.receiver = self;
  v3.super_class = (Class)VCLinkProbingHandler;
  [(VCLinkProbingHandler *)&v3 dealloc];
}

- (VCLinkProbingHandlerDelegate)linkProbingHandlerDelegate
{
  return (VCLinkProbingHandlerDelegate *)objc_loadWeak((id *)&self->_linkProbingHandlerDelegate);
}

- (void)setLinkProbingHandlerDelegate:(id)a3
{
}

- (BOOL)isLinkProbingActive
{
  return self->_linkProbingState == 1;
}

- (void)startActiveProbingOnLinks:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_linkProbingCapabilityVersion)
  {
    if (a3 && [a3 count])
    {
      delegateQueue = self->_delegateQueue;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__VCLinkProbingHandler_startActiveProbingOnLinks___block_invoke;
      v9[3] = &unk_1E6DB3E40;
      v9[4] = self;
      v9[5] = a3;
      dispatch_async(delegateQueue, v9);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCLinkProbingHandler startActiveProbingOnLinks:]();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    uint64_t v7 = *MEMORY[0x1E4F47A50];
    v8 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v11 = v6;
        __int16 v12 = 2080;
        v13 = "-[VCLinkProbingHandler startActiveProbingOnLinks:]";
        __int16 v14 = 1024;
        int v15 = 158;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: startActiveProbing failed: Link probing not enabled", buf, 0x1Cu);
      }
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      -[VCLinkProbingHandler startActiveProbingOnLinks:]();
    }
  }
}

void __50__VCLinkProbingHandler_startActiveProbingOnLinks___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 184) count]) {
    *(double *)(*(void *)(a1 + 32) + 200) = micro();
  }
  [*(id *)(*(void *)(a1 + 32) + 184) addObjectsFromArray:*(void *)(a1 + 40)];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 184) allObjects];
  [v6 setObject:v2 forKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
  uint64_t v3 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 76)];
  [v6 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F6A7C8]];
  uint64_t v4 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(*(void *)(a1 + 32) + 80)];
  [v6 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F6A7E0]];
  if ([*(id *)(a1 + 32) linkProbingHandlerDelegate]) {
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "startActiveProbingWithOptions:", v6);
  }
  [*(id *)(a1 + 32) setLinkProbingResultConfig];
  uint64_t v5 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v5 + 92))
  {
    [*(id *)(v5 + 16) start];
    *(unsigned char *)(*(void *)(a1 + 32) + 92) = 1;
  }
}

- (void)stopActiveProbingOnLinks:(id)a3 resetStats:(BOOL)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_linkProbingCapabilityVersion)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke;
    block[3] = &unk_1E6DB3E18;
    block[4] = self;
    block[5] = a3;
    BOOL v8 = a4;
    dispatch_async(delegateQueue, block);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    id v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      __int16 v12 = "-[VCLinkProbingHandler stopActiveProbingOnLinks:resetStats:]";
      __int16 v13 = 1024;
      int v14 = 191;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Link probing not enabled", buf, 0x1Cu);
    }
  }
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 92) == 1)
  {
    uint64_t v2 = *(void **)(a1 + 40);
    if (v2
      && [v2 count]
      && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(a1 + 40)), "isSubsetOfSet:", *(void *)(*(void *)(a1 + 32) + 184)) & 1) != 0)
    {
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "minusSet:", objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:", *(void *)(a1 + 40)));
      id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 184) count];
      uint64_t v5 = *MEMORY[0x1E4F6A7D0];
      if (v4)
      {
        [v3 setObject:*(void *)(a1 + 40) forKeyedSubscript:v5];
        [*(id *)(a1 + 32) removeProbingResultsForLinks:*(void *)(a1 + 40)];
      }
      else
      {
        [v3 setObject:*MEMORY[0x1E4F6A7C0] forKeyedSubscript:v5];
        if (*(unsigned char *)(a1 + 48)) {
          [*(id *)(a1 + 32) resetAggregatedProbingResults];
        }
        [*(id *)(*(void *)(a1 + 32) + 16) stop];
        *(unsigned char *)(*(void *)(a1 + 32) + 92) = 0;
      }
      if ([*(id *)(a1 + 32) linkProbingHandlerDelegate]) {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "stopActiveProbingWithOptions:", v3);
      }

      *(void *)(*(void *)(a1 + 32) + 200) = 0;
      *(_DWORD *)(*(void *)(a1 + 32) + 232) = 0;
      id v6 = *(void **)(a1 + 32);
      uint64_t v7 = *(void *)(a1 + 40);
      [v6 flushProbingResults:v7];
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_2();
    }
  }
}

- (void)updateProbingResults:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__VCLinkProbingHandler_updateProbingResults___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __45__VCLinkProbingHandler_updateProbingResults___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedUpdateProbingResults:*(void *)(a1 + 40)];
}

- (void)dispatchedUpdateProbingResults:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (self->_linkProbingState == 1)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v5 = (void *)[a3 allKeys];
    uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
    if (v22)
    {
      uint64_t v21 = *(void *)v30;
      v20 = v5;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v30 != v21) {
            objc_enumerationMutation(v5);
          }
          uint64_t v7 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          BOOL v8 = -[VCLinkProbingHandler isValidProbingResult:](self, "isValidProbingResult:", [a3 objectForKeyedSubscript:v7]);
          uint64_t v9 = [(NSMutableDictionary *)self->_aggregatedProbingResults objectForKeyedSubscript:v7];
          if (v8)
          {
            if (v9)
            {
              objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7), "mergeProbingResults:", objc_msgSend(a3, "objectForKeyedSubscript:", v7));
            }
            else
            {
              uint64_t v10 = [VCLinkProbingResult alloc];
              uint64_t v11 = [a3 objectForKeyedSubscript:v7];
              long long v12 = *(_OWORD *)&self->_linkProbingResultConfig.envelopeAttackFactor;
              *(_OWORD *)buf = *(_OWORD *)&self->_linkProbingResultConfig.linkProbingCapabilityVersion;
              *(_OWORD *)&buf[16] = v12;
              *(void *)&buf[32] = self->_linkProbingResultConfig.plrBuckets;
              [(NSMutableDictionary *)self->_aggregatedProbingResults setObject:[(VCLinkProbingResult *)v10 initWithProbingResults:v11 linkProbingResultConfig:buf] forKeyedSubscript:v7];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
            {
              __str = 0;
              int v13 = [v7 intValue];
              if ([(NSMutableDictionary *)self->_aggregatedProbingResults objectForKeyedSubscript:v7])
              {
                int v14 = (const char *)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregatedProbingResults, "objectForKeyedSubscript:", v7), "description"), "UTF8String");
              }
              else
              {
                int v14 = "<nil>";
              }
              asprintf(&__str, "LinkProbing: Updated probing results for linkID: %d -> %s", v13, v14);
              if (__str)
              {
                __lasts = 0;
                uint64_t v15 = strtok_r(__str, "\n", &__lasts);
                do
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
                  {
                    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
                    v17 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 136316162;
                      *(void *)&uint8_t buf[4] = v16;
                      *(_WORD *)&buf[12] = 2080;
                      *(void *)&buf[14] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
                      *(_WORD *)&buf[22] = 1024;
                      *(_DWORD *)&buf[24] = 255;
                      *(_WORD *)&buf[28] = 2080;
                      *(void *)&buf[30] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
                      *(_WORD *)&buf[38] = 2080;
                      v26 = v15;
                      _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
                    }
                  }
                  uint64_t v15 = strtok_r(0, "\n", &__lasts);
                }
                while (v15);
                free(__str);
              }
              uint64_t v5 = v20;
            }
          }
          else if (v9)
          {
            v27 = v7;
            -[VCLinkProbingHandler removeProbingResultsForLinks:](self, "removeProbingResultsForLinks:", [MEMORY[0x1E4F1C978] arrayWithObjects:&v27 count:1]);
          }
        }
        uint64_t v22 = [v5 countByEnumeratingWithState:&v29 objects:v28 count:16];
      }
      while (v22);
    }
    [(VCLinkProbingHandler *)self updateLinkPreferenceOrder];
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    uint64_t v19 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "-[VCLinkProbingHandler dispatchedUpdateProbingResults:]";
      *(_WORD *)&buf[22] = 1024;
      *(_DWORD *)&buf[24] = 238;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: updateProbingResults failed: Link probing not in progress", buf, 0x1Cu);
    }
  }
}

- (void)flushProbingResults:(id)a3
{
  if ([(VCLinkProbingHandler *)self linkProbingHandlerDelegate])
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([(NSMutableSet *)self->_activelyProbingLinkIDs count]) {
      id v5 = a3;
    }
    else {
      id v5 = (id)*MEMORY[0x1E4F6A7C0];
    }
    [v6 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
    [(VCLinkProbingHandlerDelegate *)[(VCLinkProbingHandler *)self linkProbingHandlerDelegate] flushLinkProbingStatusWithOptions:v6];
  }
}

- (BOOL)isValidProbingResult:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F6A750];
  uint64_t v6 = [a3 objectForKey:*MEMORY[0x1E4F6A750]];
  if (v6) {
    LOBYTE(v6) = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v5), "unsignedIntValue") >= self->_minSentRequestCountThreshold;
  }
  return v6;
}

- (void)removeProbingResultsForLinks:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(a3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        if ([(NSMutableDictionary *)self->_aggregatedProbingResults objectForKeyedSubscript:v9])
        {
          [(NSMutableDictionary *)self->_aggregatedProbingResults removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [a3 countByEnumeratingWithState:&v11 objects:v10 count:16];
    }
    while (v6);
  }
}

- (id)getProbingResultsForLinkID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = 0;
  BOOL v8 = &v7;
  uint64_t v9 = 0x3052000000;
  uint64_t v10 = __Block_byref_object_copy__35;
  long long v11 = __Block_byref_object_dispose__35;
  uint64_t v12 = 0;
  delegateQueue = self->_delegateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__VCLinkProbingHandler_getProbingResultsForLinkID___block_invoke;
  v6[3] = &unk_1E6DB6928;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = &v7;
  dispatch_sync(delegateQueue, v6);
  uint64_t v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void *__51__VCLinkProbingHandler_getProbingResultsForLinkID___block_invoke(void *a1)
{
  result = *(void **)(a1[4] + 56);
  if (result)
  {
    result = (void *)[result objectForKeyedSubscript:a1[5]];
    if (result)
    {
      result = (void *)[*(id *)(a1[4] + 56) objectForKeyedSubscript:a1[5]];
      *(void *)(*(void *)(a1[6] + 8) + 40) = result;
    }
  }
  return result;
}

- (void)setQRLinkID:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__VCLinkProbingHandler_setQRLinkID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = a3;
  block[5] = self;
  dispatch_async(delegateQueue, block);
}

void __36__VCLinkProbingHandler_setQRLinkID___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {

    *(void *)(*(void *)(a1 + 40) + 264) = [*(id *)(a1 + 32) copy];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      id v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 264);
        int v5 = 136315906;
        uint64_t v6 = v2;
        __int16 v7 = 2080;
        BOOL v8 = "-[VCLinkProbingHandler setQRLinkID:]_block_invoke";
        __int16 v9 = 1024;
        int v10 = 303;
        __int16 v11 = 2112;
        uint64_t v12 = v4;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: QR link ID=%@", (uint8_t *)&v5, 0x26u);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __36__VCLinkProbingHandler_setQRLinkID___block_invoke_cold_1();
    }
  }
}

- (void)startActiveProbingQRLink
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

void __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 256) == 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      id v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 136315650;
        uint64_t v12 = v2;
        __int16 v13 = 2080;
        long long v14 = "-[VCLinkProbingHandler startActiveProbingQRLink]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 310;
        uint64_t v4 = " [%s] %s:%d LinkProbing: startActiveProbingQRLink failed: QR link probing already in progress";
        int v5 = v3;
        uint32_t v6 = 28;
LABEL_9:
        _os_log_impl(&dword_1E1EA4000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v11, v6);
      }
    }
  }
  else if (*(void *)(v1 + 264))
  {
    *(unsigned char *)(v1 + 256) = 1;
    [*(id *)(*(void *)(a1 + 32) + 280) removeAllObjects];
    [*(id *)(*(void *)(a1 + 32) + 32) start];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v10 = *(void *)(*(void *)(a1 + 32) + 264);
        int v11 = 136315906;
        uint64_t v12 = v8;
        __int16 v13 = 2080;
        long long v14 = "-[VCLinkProbingHandler startActiveProbingQRLink]_block_invoke";
        __int16 v15 = 1024;
        int v16 = 320;
        __int16 v17 = 2112;
        uint64_t v18 = v10;
        uint64_t v4 = " [%s] %s:%d LinkProbing: startActiveProbingQRLink success: QR link probing started on linkID=%@";
        int v5 = v9;
        uint32_t v6 = 38;
        goto LABEL_9;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke_cold_1();
    }
  }
}

- (void)stopActiveProbingQRLink
{
  v3[5] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(delegateQueue, v3);
}

void __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 256) == 1)
  {
    *(unsigned char *)(v1 + 256) = 0;
    [*(id *)(*(void *)(a1 + 32) + 32) stop];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v2 = VRTraceErrorLogLevelToCSTR();
      id v3 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v4 = 136315650;
        uint64_t v5 = v2;
        __int16 v6 = 2080;
        __int16 v7 = "-[VCLinkProbingHandler stopActiveProbingQRLink]_block_invoke";
        __int16 v8 = 1024;
        int v9 = 332;
        _os_log_impl(&dword_1E1EA4000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: stopActiveProbingQRLink success: QR link probing stopped", (uint8_t *)&v4, 0x1Cu);
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke_cold_1();
    }
  }
}

- (void)updateQRProbingResult:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__VCLinkProbingHandler_updateQRProbingResult___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(delegateQueue, block);
}

uint64_t __46__VCLinkProbingHandler_updateQRProbingResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dispatchedUpdateQRProbingResult:*(void *)(a1 + 40)];
}

- (void)loadStorebagValues
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  self->_unsigned int linkProbingInterval = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-interval", @"linkProbingInterval", &unk_1F3DC6330, 0), "unsignedIntValue");
  self->_unsigned int linkProbingTimeout = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-timeout", @"linkProbingTimeout", &unk_1F3DC6348, 0), "unsignedIntValue");
  self->_unsigned int linkProbingQueryResultsInterval = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-query-results-interval", @"linkProbingQueryResultsInterval", &unk_1F3DC6360, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-connection-lockdown-period", @"linkProbingConnectionLockdownPeriod", &unk_1F3DC6378, 1), "doubleValue");
  self->_linkProbingConnectionLockdownPeriod = v3;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-exponential-moving-mean-factor", @"linkProbingExponentialMovingMeanFactor", &unk_1F3DC8BD0, 1), "doubleValue");
  self->_double expMovMeanFactor = v4;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-envelope-attack-factor", @"linkProbingEnvelopeAttackFactor", &unk_1F3DC8BD0, 1), "doubleValue");
  self->_double plrEnvelopeAttackFactor = v5;
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-envelope-decay-factor", @"linkProbingEnvelopeDecayFactor", &unk_1F3DC8BE0, 1), "doubleValue");
  self->_double plrEnvelopeDecayFactor = v6;
  __int16 v7 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithArray:", objc_msgSend(+[GKSConnectivitySettings getStorebagValueStorebagKey:defaultValue:](GKSConnectivitySettings, "getStorebagValueStorebagKey:defaultValue:", @"vc-link-probing-plr-buckets", @"0.25,2.5,10,20,30,100"), "componentsSeparatedByString:", @","));
  unsigned int v8 = llround((double)(1000 * self->_linkProbingQueryResultsInterval / self->_linkProbingInterval) * 0.25);
  self->_plrBuckets = v7;
  self->_unsigned int minSentRequestCountThreshold = v8;
  self->_unsigned int linkProbingDuplicationWaitTimeout = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-duplication-wait-timeout", @"linkProbingDuplicationWaitTimeout", &unk_1F3DC6390, 0), "unsignedIntValue");
  self->_unsigned int consecutiveIdenticalQueryResultMax = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-identical-query-result-max", @"linkProbingIdenticalQueryResultMax", &unk_1F3DC6378, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-lockdown-period", @"linkProbingLockdownPeriod", &unk_1F3DC63A8, 1), "doubleValue");
  self->_double linkProbingLockdownPeriod = v9;
  self->_unsigned int linkProbingQRStatFrequency = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-qr-stat-request-frequency", @"linkProbingQRStatRequestFrequency", &unk_1F3DC63C0, 0), "unsignedIntValue");
  self->_unsigned int linkProbingQRStatRequestMaxCount = objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-qr-stat-request-max-count", @"linkProbingQRStatRequestMaxCount", &unk_1F3DC63D8, 0), "unsignedIntValue");
  objc_msgSend(+[GKSConnectivitySettings getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:](GKSConnectivitySettings, "getStorebagValueForStorebagKey:userDefaultKey:defaultValue:isDoubleType:", @"vc-link-probing-qr-stat-request-max-rtt", @"linkProbingQRStatRequestMaxRTT", &unk_1F3DC63F0, 1), "doubleValue");
  self->_double inkProbingQRStatRequestMaxRTT = v10;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    uint64_t v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      unsigned int linkProbingInterval = self->_linkProbingInterval;
      unsigned int linkProbingTimeout = self->_linkProbingTimeout;
      unsigned int linkProbingQueryResultsInterval = self->_linkProbingQueryResultsInterval;
      double expMovMeanFactor = self->_expMovMeanFactor;
      double plrEnvelopeAttackFactor = self->_plrEnvelopeAttackFactor;
      double plrEnvelopeDecayFactor = self->_plrEnvelopeDecayFactor;
      uint64_t v19 = [(NSArray *)self->_plrBuckets componentsJoinedByString:@","];
      unsigned int minSentRequestCountThreshold = self->_minSentRequestCountThreshold;
      unsigned int linkProbingDuplicationWaitTimeout = self->_linkProbingDuplicationWaitTimeout;
      unsigned int consecutiveIdenticalQueryResultMax = self->_consecutiveIdenticalQueryResultMax;
      double linkProbingLockdownPeriod = self->_linkProbingLockdownPeriod;
      unsigned int linkProbingQRStatFrequency = self->_linkProbingQRStatFrequency;
      unsigned int linkProbingQRStatRequestMaxCount = self->_linkProbingQRStatRequestMaxCount;
      double inkProbingQRStatRequestMaxRTT = self->_inkProbingQRStatRequestMaxRTT;
      int v27 = 136319234;
      uint64_t v28 = v11;
      __int16 v29 = 2080;
      long long v30 = "-[VCLinkProbingHandler loadStorebagValues]";
      __int16 v31 = 1024;
      int v32 = 375;
      __int16 v33 = 1024;
      unsigned int v34 = linkProbingInterval;
      __int16 v35 = 1024;
      unsigned int v36 = linkProbingTimeout;
      __int16 v37 = 1024;
      unsigned int v38 = linkProbingQueryResultsInterval;
      __int16 v39 = 2048;
      double v40 = expMovMeanFactor;
      __int16 v41 = 2048;
      double v42 = plrEnvelopeAttackFactor;
      __int16 v43 = 2048;
      double v44 = plrEnvelopeDecayFactor;
      __int16 v45 = 2112;
      v46 = v19;
      __int16 v47 = 1024;
      unsigned int v48 = minSentRequestCountThreshold;
      __int16 v49 = 1024;
      unsigned int v50 = linkProbingDuplicationWaitTimeout;
      __int16 v51 = 1024;
      unsigned int v52 = consecutiveIdenticalQueryResultMax;
      __int16 v53 = 2048;
      double v54 = linkProbingLockdownPeriod;
      __int16 v55 = 1024;
      unsigned int v56 = linkProbingQRStatFrequency;
      __int16 v57 = 1024;
      unsigned int v58 = linkProbingQRStatRequestMaxCount;
      __int16 v59 = 2048;
      double v60 = inkProbingQRStatRequestMaxRTT;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Loaded storebag values linkProbingInterval=%d linkProbingTimeout=%d linkProbingQueryResultsInterval=%d exponentialMovingMeanFactor=%f plrEnvelopeAttackFactor=%f plrEnvelopeDecayFactor=%f plrBuckets=%@ minSentRequestCountThreshold=%d _linkProbingDuplicationWaitTimeout=%d _consecutiveIdenticalQueryResultMax=%d _linkProbingLockdownPeriod=%f _linkProbingQRStatFrequency=%d _linkProbingQRStatRequestMaxCount=%d _inkProbingQRStatRequestMaxRTT=%f", (uint8_t *)&v27, 0x88u);
    }
  }
}

- (void)setLinkProbingResultConfig
{
  self->_linkProbingResultConfig.linkProbingCapabilityVersion = self->_linkProbingCapabilityVersion;
  self->_linkProbingResultConfig.unsigned int linkProbingQueryResultsInterval = self->_linkProbingInterval;
  *(_OWORD *)&self->_linkProbingResultConfig.double expMovMeanFactor = *(_OWORD *)&self->_expMovMeanFactor;
  self->_linkProbingResultConfig.envelopeDecayFactor = self->_plrEnvelopeDecayFactor;
  self->_linkProbingResultConfig.plrBuckets = self->_plrBuckets;
}

- (void)queryProbingResults
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  double v3 = micro();
  if (self->_linkProbingState == 1)
  {
    double v5 = v3;
    LODWORD(v4) = self->_linkProbingDuplicationWaitTimeout;
    if (v3 - self->_probingStartTime > (double)v4 && !self->_isDuplicationEnabled)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        __int16 v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          double v8 = v5 - self->_probingStartTime;
          *(_DWORD *)buf = 136315906;
          uint64_t v12 = v6;
          __int16 v13 = 2080;
          long long v14 = "-[VCLinkProbingHandler queryProbingResults]";
          __int16 v15 = 1024;
          int v16 = 391;
          __int16 v17 = 2048;
          double v18 = v8;
          _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Stop active probing because duplication did not start in %f seconds after starting probing.", buf, 0x26u);
        }
      }
      [(VCLinkProbingHandler *)self stopActiveProbingOnLinks:[(NSMutableSet *)self->_activelyProbingLinkIDs allObjects] resetStats:0];
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VCLinkProbingHandler_queryProbingResults__block_invoke;
  block[3] = &unk_1E6DB3DC8;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 92) == 1)
  {
    double v3 = *(void **)(v1 + 184);
    if (v3 && [v3 count])
    {
      id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 184) allObjects];
      [v5 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F6A7D0]];
      if ([*(id *)(a1 + 32) linkProbingHandlerDelegate]) {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "queryProbingResultsWithOptions:", v5);
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_2();
    }
  }
}

- (void)updateLinkPreferenceOrder
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  double v3 = micro();
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_aggregatedProbingResults keysSortedByValueUsingComparator:&__block_literal_global_93];
  if ([v4 count]
    && [(NSArray *)self->_linkPreferenceOrder count]
    && objc_msgSend((id)objc_msgSend(v4, "objectAtIndexedSubscript:", 0), "isEqualToNumber:", -[NSArray objectAtIndexedSubscript:](self->_linkPreferenceOrder, "objectAtIndexedSubscript:", 0)))
  {
    unsigned int v5 = self->_consecutiveIdenticalQueryResultCount + 1;
    self->_consecutiveIdenticalQueryResultCount = v5;
  }
  else
  {
    unsigned int v5 = 0;
    self->_consecutiveIdenticalQueryResultCount = 0;
  }
  if (v5 == self->_consecutiveIdenticalQueryResultMax - 1 && self->_linkProbingState == 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      __int16 v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v8 = self->_consecutiveIdenticalQueryResultCount + 1;
        int v9 = 136315906;
        uint64_t v10 = v6;
        __int16 v11 = 2080;
        uint64_t v12 = "-[VCLinkProbingHandler updateLinkPreferenceOrder]";
        __int16 v13 = 1024;
        int v14 = 438;
        __int16 v15 = 1024;
        unsigned int v16 = v8;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Stop active probing because the same connection chosen for duplication after %d consecutive queries", (uint8_t *)&v9, 0x22u);
      }
    }
    [(VCLinkProbingHandler *)self stopActiveProbingOnLinks:[(NSMutableSet *)self->_activelyProbingLinkIDs allObjects] resetStats:0];
    [(VCDispatchTimer *)self->_probingLockdownTimer start];
  }
  if (v3 - self->_lastLinkPreferenceUpdateNotificationTime >= self->_linkProbingConnectionLockdownPeriod)
  {
    self->_lastLinkPreferenceUpdateNotificationTime = v3;
    if (([v4 isEqualToArray:self->_linkPreferenceOrder] & 1) == 0)
    {
      if ([(VCLinkProbingHandler *)self linkProbingHandlerDelegate])
      {

        self->_linkPreferenceOrder = (NSArray *)[v4 copy];
        [(VCLinkProbingHandlerDelegate *)[(VCLinkProbingHandler *)self linkProbingHandlerDelegate] didUpdateLinkPreferenceOrder:self->_linkPreferenceOrder];
      }
    }
  }
}

uint64_t __49__VCLinkProbingHandler_updateLinkPreferenceOrder__block_invoke(uint64_t a1, void *a2, void *a3)
{
  unsigned int v5 = objc_msgSend((id)objc_msgSend(a2, "plrTier"), "unsignedIntValue");
  if (v5 > objc_msgSend((id)objc_msgSend(a3, "plrTier"), "unsignedIntValue")) {
    return 1;
  }
  unsigned int v6 = objc_msgSend((id)objc_msgSend(a2, "plrTier"), "unsignedIntValue");
  if (v6 < objc_msgSend((id)objc_msgSend(a3, "plrTier"), "unsignedIntValue")) {
    return -1;
  }
  objc_msgSend((id)objc_msgSend(a2, "expMovMeanRTT"), "doubleValue");
  double v9 = v8;
  objc_msgSend((id)objc_msgSend(a3, "expMovMeanRTT"), "doubleValue");
  if (v9 > v10) {
    return 1;
  }
  objc_msgSend((id)objc_msgSend(a2, "expMovMeanRTT"), "doubleValue");
  double v12 = v11;
  objc_msgSend((id)objc_msgSend(a3, "expMovMeanRTT"), "doubleValue");
  if (v12 >= v13) {
    return 0;
  }
  else {
    return -1;
  }
}

- (void)probingLockdownEnded
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  [(VCDispatchTimer *)self->_probingLockdownTimer stop];
  if (self->_isDuplicationEnabled && !self->_linkProbingState)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        double linkProbingLockdownPeriod = self->_linkProbingLockdownPeriod;
        int v6 = 136315906;
        uint64_t v7 = v3;
        __int16 v8 = 2080;
        double v9 = "-[VCLinkProbingHandler probingLockdownEnded]";
        __int16 v10 = 1024;
        int v11 = 456;
        __int16 v12 = 2048;
        double v13 = linkProbingLockdownPeriod;
        _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Start active probing because connection for duplication was last updated using probing results %f seconds ago, and duplication is still active.", (uint8_t *)&v6, 0x26u);
      }
    }
    [(VCLinkProbingHandlerDelegate *)[(VCLinkProbingHandler *)self linkProbingHandlerDelegate] didLinkProbingLockdownEnd];
  }
}

- (void)resetAggregatedProbingResults
{
  v4[5] = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_linkPreferenceOrder count])
  {

    self->_linkPreferenceOrder = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
    if ([(VCLinkProbingHandler *)self linkProbingHandlerDelegate])
    {
      delegateQueue = self->_delegateQueue;
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __53__VCLinkProbingHandler_resetAggregatedProbingResults__block_invoke;
      v4[3] = &unk_1E6DB3DC8;
      v4[4] = self;
      dispatch_async(delegateQueue, v4);
    }
  }
  [(NSMutableDictionary *)self->_aggregatedProbingResults removeAllObjects];
}

uint64_t __53__VCLinkProbingHandler_resetAggregatedProbingResults__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) linkProbingHandlerDelegate];
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 64);

  return [v2 didUpdateLinkPreferenceOrder:v3];
}

- (void)requestStats
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: requestStats failed: Invalid linkID", v2, v3, v4, v5, v6);
}

void __36__VCLinkProbingHandler_requestStats__block_invoke(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v2 setObject:*(void *)(*(void *)(a1 + 32) + 264) forKeyedSubscript:*MEMORY[0x1E4F6A730]];
  uint64_t v3 = NSNumber;
  ++*(void *)(*(void *)(a1 + 32) + 272);
  uint64_t v4 = objc_msgSend(v3, "numberWithUnsignedLongLong:");
  [v2 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F6A830]];
  if ([*(id *)(a1 + 32) linkProbingHandlerDelegate])
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 280) count];
    uint8_t v6 = *(_DWORD **)(a1 + 32);
    if (v5 == v6[60])
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        __int16 v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 240);
          int v17 = 136315906;
          uint64_t v18 = v7;
          __int16 v19 = 2080;
          v20 = "-[VCLinkProbingHandler requestStats]_block_invoke";
          __int16 v21 = 1024;
          int v22 = 485;
          __int16 v23 = 1024;
          LODWORD(v24) = v9;
          _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Request count reached max=%d", (uint8_t *)&v17, 0x22u);
        }
      }
      objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "didReceiveStatsResponse:", 0);
      uint8_t v6 = *(_DWORD **)(a1 + 32);
    }
    objc_msgSend((id)objc_msgSend(v6, "linkProbingHandlerDelegate"), "requestStatsWithOptions:", v2);
    double v10 = micro();
    uint64_t v11 = objc_msgSend(NSNumber, "numberWithDouble:");
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 280), "setObject:forKeyedSubscript:", v11, objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(*(void *)(a1 + 32) + 272)));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      double v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = *(void *)(v14 + 272);
        uint64_t v16 = [*(id *)(v14 + 280) count];
        int v17 = 136316418;
        uint64_t v18 = v12;
        __int16 v19 = 2080;
        v20 = "-[VCLinkProbingHandler requestStats]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 491;
        __int16 v23 = 2048;
        uint64_t v24 = v15;
        __int16 v25 = 2048;
        double v26 = v10;
        __int16 v27 = 2048;
        uint64_t v28 = v16;
        _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Requesting stats with statsId=%llu at time=%f requestCount=%lu", (uint8_t *)&v17, 0x3Au);
      }
    }
  }
}

- (void)dispatchedUpdateQRProbingResult:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_qrLinkProbingState != 1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = v13;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    __int16 v25 = 1024;
    int v26 = 499;
    uint64_t v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR link probing not in progress";
LABEL_17:
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v12, buf, 0x1Cu);
    return;
  }
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = v14;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    __int16 v25 = 1024;
    int v26 = 503;
    uint64_t v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR probing result is empty";
    goto LABEL_17;
  }
  uint64_t v5 = *MEMORY[0x1E4F6A830];
  uint64_t v6 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A830]];
  uint64_t v7 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A838]];
  int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    if (ErrorLogLevelForModule < 7) {
      return;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v22 = v10;
    __int16 v23 = 2080;
    uint64_t v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
    __int16 v25 = 1024;
    int v26 = 509;
    uint64_t v12 = " [%s] %s:%d LinkProbing: dispatchedUpdateQRProbingResult failed: QR probing result is invalid";
    goto LABEL_17;
  }
  if (ErrorLogLevelForModule >= 7)
  {
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v17 = [a3 objectForKeyedSubscript:v5];
      uint64_t v18 = [a3 objectForKeyedSubscript:*MEMORY[0x1E4F6A840]];
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v15;
      __int16 v23 = 2080;
      uint64_t v24 = "-[VCLinkProbingHandler dispatchedUpdateQRProbingResult:]";
      __int16 v25 = 1024;
      int v26 = 512;
      __int16 v27 = 2112;
      uint64_t v28 = v17;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d LinkProbing: Received stat response with statsID=%@ at timestamp=%@", buf, 0x30u);
    }
  }
  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__VCLinkProbingHandler_dispatchedUpdateQRProbingResult___block_invoke;
  block[3] = &unk_1E6DB43D8;
  block[4] = self;
  void block[5] = v6;
  void block[6] = v7;
  dispatch_async(delegateQueue, block);
}

double *__56__VCLinkProbingHandler_dispatchedUpdateQRProbingResult___block_invoke(uint64_t a1)
{
  result = (double *)[*(id *)(*(void *)(a1 + 32) + 280) objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (result)
  {
    double v3 = (double)(unint64_t)[*(id *)(a1 + 48) unsignedLongValue];
    result = *(double **)(a1 + 32);
    if (result[31] >= v3)
    {
      if ([result linkProbingHandlerDelegate]) {
        objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "linkProbingHandlerDelegate"), "didReceiveStatsResponse:", 1);
      }
      uint64_t v4 = *(void *)(a1 + 40);
      uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 280);
      return (double *)[v5 removeObjectForKey:v4];
    }
  }
  return result;
}

- (unsigned)linkProbingCapabilityVersion
{
  return self->_linkProbingCapabilityVersion;
}

- (void)setLinkProbingCapabilityVersion:(unsigned __int8)a3
{
  self->_linkProbingCapabilityVersion = a3;
}

- (NSSet)activelyProbingLinkIDs
{
  return &self->_activelyProbingLinkIDs->super;
}

- (BOOL)isDuplicationEnabled
{
  return self->_isDuplicationEnabled;
}

- (void)setIsDuplicationEnabled:(BOOL)a3
{
  self->_isDuplicationEnabled = a3;
}

- (void)startActiveProbingOnLinks:.cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 158;
  _os_log_debug_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_DEBUG, " [%s] %s:%d LinkProbing: startActiveProbing failed: Link probing not enabled", v1, 0x1Cu);
}

- (void)startActiveProbingOnLinks:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: startActiveProbing failed: Invalid linkID list", v2, v3, v4, v5, v6);
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Invalid linkID list", v2, v3, v4, v5, v6);
}

void __60__VCLinkProbingHandler_stopActiveProbingOnLinks_resetStats___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbing failed: Link probing not in progress", v2, v3, v4, v5, v6);
}

void __36__VCLinkProbingHandler_setQRLinkID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: setQRLinkID failed: Invalid linkID", v2, v3, v4, v5, v6);
}

void __48__VCLinkProbingHandler_startActiveProbingQRLink__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: startActiveProbingQRLink failed: linkID is not set", v2, v3, v4, v5, v6);
}

void __47__VCLinkProbingHandler_stopActiveProbingQRLink__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: stopActiveProbingQRLink failed: QR link probing not in progress", v2, v3, v4, v5, v6);
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: queryProbingResults failed: No links are currently being probed", v2, v3, v4, v5, v6);
}

void __43__VCLinkProbingHandler_queryProbingResults__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d LinkProbing: queryProbingResults failed: Link probing not in progress", v2, v3, v4, v5, v6);
}

@end