@interface VCSessionUplinkBandwidthAllocatorOneToOne
+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4;
- (BOOL)isCamera1080pAvailable;
- (BOOL)isEnabledStreamToken:(int64_t)a3;
- (BOOL)isRedundancyEnabled;
- (BOOL)isRedundancyEnabledFor720Stream;
- (BOOL)isStreamGroupEnabled:(unsigned int)a3;
- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4;
- (BOOL)shouldUseMinMicBitrate:(unint64_t)a3 streamToken:(int64_t)a4 remainderBitrate:(int64_t)a5;
- (BOOL)shouldUseMultipleStreamGroupAlgorithm;
- (VCSessionUplinkBandwidthAllocatorOneToOne)init;
- (id)baseNetworkBitrateSplitForTargetBitrate:(unsigned int)a3 baseNetworkBitrate:(unint64_t *)a4;
- (id)findBitrateSplitForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4;
- (id)repairStreamIDsForStreamToken:(int64_t)a3;
- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4;
- (id)streamIDsIfStreamTokenIsEnabled:(int64_t)a3;
- (id)streamIDsIfStreamTokenIsPresent:(int64_t)a3;
- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5;
- (unint64_t)findAndSplitExtraBitrateFromCappedStreams:(id)a3 remainderBitrate:(int64_t)a4 currentStreamGroupBitrate:(unint64_t)a5 streamToken:(int64_t)a6 totalRemainderBitrateWeight:(unint64_t)a7;
- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4;
- (void)dealloc;
- (void)generateBandwidthAllocationTableWithTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5;
- (void)getCurrentEnabledTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5;
- (void)init;
- (void)recomputeAllocationTableIfRequired;
- (void)setRedundancyEnabled:(BOOL)a3;
- (void)streamToken:(int64_t)a3 enabled:(BOOL)a4;
@end

@implementation VCSessionUplinkBandwidthAllocatorOneToOne

- (VCSessionUplinkBandwidthAllocatorOneToOne)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCSessionUplinkBandwidthAllocatorOneToOne;
  v2 = [(VCObject *)&v13 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_streamTokenToEnableMap = v3;
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_streamTokenToTableEntryMap = v4;
      if (v4)
      {
        v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v2->_bandwithAllocationTable = v5;
        if (v5) {
          return v2;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionUplinkBandwidthAllocatorOneToOne init]();
          }
        }
        goto LABEL_28;
      }
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionUplinkBandwidthAllocatorOneToOne init]();
          }
        }
        goto LABEL_28;
      }
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)v2 performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3
        || (uint64_t v12 = VRTraceErrorLogLevelToCSTR(),
            v10 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)))
      {
LABEL_28:

        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v12;
      __int16 v16 = 2080;
      v17 = "-[VCSessionUplinkBandwidthAllocatorOneToOne init]";
      __int16 v18 = 1024;
      int v19 = 34;
      __int16 v20 = 2112;
      v21 = v8;
      __int16 v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate stream token to table entry map";
    }
    else
    {
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSessionUplinkBandwidthAllocatorOneToOne init]();
          }
        }
        goto LABEL_28;
      }
      if (objc_opt_respondsToSelector()) {
        v7 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)v2 performSelector:sel_logPrefix];
      }
      else {
        v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_28;
      }
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        goto LABEL_28;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v15 = v9;
      __int16 v16 = 2080;
      v17 = "-[VCSessionUplinkBandwidthAllocatorOneToOne init]";
      __int16 v18 = 1024;
      int v19 = 31;
      __int16 v20 = 2112;
      v21 = v7;
      __int16 v22 = 2048;
      v23 = v2;
      v11 = " [%s] %s:%d %@(%p) Failed to allocate stream token to enable map";
    }
    _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, v11, buf, 0x30u);
    goto LABEL_28;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionUplinkBandwidthAllocatorOneToOne;
  [(VCObject *)&v3 dealloc];
}

- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4
{
  BOOL v4 = a4;
  [(VCObject *)self lock];
  if (a3)
  {
    uint64_t v7 = [a3 streamToken];
    [(NSMutableDictionary *)self->_streamTokenToEnableMap setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v7];
    [(NSMutableDictionary *)self->_streamTokenToTableEntryMap setObject:a3 forKeyedSubscript:v7];
  }
  if (v4) {
    [(VCSessionUplinkBandwidthAllocatorOneToOne *)self recomputeAllocationTableIfRequired];
  }

  [(VCObject *)self unlock];
}

- (void)streamToken:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  [(VCObject *)self lock];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  v8 = (void *)[(NSMutableDictionary *)self->_streamTokenToEnableMap objectForKeyedSubscript:v7];
  if (v8 && [v8 BOOLValue] != v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenToEnableMap, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v4], v7);
    [(VCSessionUplinkBandwidthAllocatorOneToOne *)self recomputeAllocationTableIfRequired];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isEnabledStreamToken:(int64_t)a3
{
  LOBYTE(a3) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "BOOLValue");
  [(VCObject *)self unlock];
  return a3;
}

- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4
{
  return 0;
}

- (void)getCurrentEnabledTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = (id)[(NSMutableDictionary *)self->_streamTokenToEnableMap allKeys];
  uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:v47 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v49;
    v6 = "";
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v49 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = v7;
        v8 = *(void **)(*((void *)&v48 + 1) + 8 * v7);
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v8), "BOOLValue"))
        {
          v27 = (void *)[(NSMutableDictionary *)self->_streamTokenToTableEntryMap objectForKeyedSubscript:v8];
          v28 = v8;
          objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v27, "uplinkClient"), "qualityTierTableForStreamToken:", objc_msgSend(v8, "unsignedIntValue")), v8);
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v8), "allKeys");
          uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v42 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v44;
            do
            {
              for (uint64_t i = 0; i != v11; ++i)
              {
                if (*(void *)v44 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
                [a4 addObject:v14];
                if ([a5 objectForKeyedSubscript:v14])
                {
                  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
                  {
                    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
                    __int16 v16 = *MEMORY[0x1E4F47A50];
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
                    {
                      v17 = v6;
                      int v18 = [v14 unsignedIntValue];
                      int v19 = FourccToCStr(objc_msgSend((id)objc_msgSend(a5, "objectForKeyedSubscript:", v14), "unsignedIntValue"));
                      __int16 v20 = FourccToCStr([v27 streamGroupID]);
                      *(_DWORD *)buf = 136316418;
                      uint64_t v31 = v15;
                      __int16 v32 = 2080;
                      v33 = "-[VCSessionUplinkBandwidthAllocatorOneToOne getCurrentEnabledTierTables:qualityIndices:quali"
                            "tyIndexToStreamToken:]";
                      __int16 v34 = 1024;
                      int v35 = 110;
                      __int16 v36 = 1024;
                      int v37 = v18;
                      v6 = v17;
                      v8 = v28;
                      __int16 v38 = 2080;
                      v39 = v19;
                      __int16 v40 = 2080;
                      v41 = v20;
                      _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Quality Index collision for index=%u existing streamGroupID=%s other streamGroupID=%s", buf, 0x36u);
                    }
                  }
                }
                else
                {
                  [a5 setObject:v8 forKeyedSubscript:v14];
                }
              }
              uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v42 count:16];
            }
            while (v11);
          }
        }
        uint64_t v7 = v26 + 1;
      }
      while (v26 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v48 objects:v47 count:16];
    }
    while (v24);
  }
}

- (void)generateBandwidthAllocationTableWithTierTables:(id)a3 qualityIndices:(id)a4 qualityIndexToStreamToken:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = (id)[a4 sortedArrayUsingSelector:sel_compare_];
  uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v20)
  {
    uint64_t v8 = 0;
    uint64_t v17 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v24 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v11 = (void *)[a5 objectForKeyedSubscript:v10];
        uint64_t v12 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v11), "objectForKeyedSubscript:", v10);
        unsigned int v21 = 0;
        if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v11), "uplinkClient"), "shouldCapStream:cappedBitrate:", objc_msgSend(v11, "unsignedIntValue"), &v21))
        {
          unsigned int v13 = [v12 unsignedIntValue];
          if (v13 > v21) {
            continue;
          }
        }
        id v14 = (id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_bandwithAllocationTable, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v8)), "mutableCopy");
        if (!v14) {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }
        int v15 = v8 - objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", v11), "unsignedIntValue");
        uint64_t v8 = v15 + [v12 unsignedIntValue];
        [v14 setObject:v12 forKeyedSubscript:v11];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bandwithAllocationTable, "setObject:forKeyedSubscript:", v14, [NSNumber numberWithUnsignedInt:v8]);
        [v7 setObject:v12 forKeyedSubscript:v11];
      }
      uint64_t v20 = [obj countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v20);
  }
}

- (void)recomputeAllocationTableIfRequired
{
  if ([(VCSessionUplinkBandwidthAllocatorOneToOne *)self shouldUseMultipleStreamGroupAlgorithm])
  {
    [(NSMutableDictionary *)self->_bandwithAllocationTable removeAllObjects];
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(VCSessionUplinkBandwidthAllocatorOneToOne *)self getCurrentEnabledTierTables:v3 qualityIndices:v4 qualityIndexToStreamToken:v5];
    [(VCSessionUplinkBandwidthAllocatorOneToOne *)self generateBandwidthAllocationTableWithTierTables:v3 qualityIndices:v4 qualityIndexToStreamToken:v5];
  }
}

- (id)streamIDsIfStreamTokenIsPresent:(int64_t)a3
{
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VCObject *)self lock];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3]))
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamID")));
    id v6 = v5;
  }
  else
  {

    id v5 = 0;
  }
  [(VCObject *)self unlock];
  return v5;
}

- (id)repairStreamIDsForStreamToken:(int64_t)a3
{
  return 0;
}

- (void)setRedundancyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(VCObject *)self lock];
  if (self->_redundancyEnabled != v3)
  {
    self->_redundancyEnabled = v3;
    [(VCSessionUplinkBandwidthAllocatorOneToOne *)self recomputeAllocationTableIfRequired];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isRedundancyEnabled
{
  [(VCObject *)self lock];
  BOOL redundancyEnabled = self->_redundancyEnabled;
  [(VCObject *)self unlock];
  return redundancyEnabled;
}

- (BOOL)isRedundancyEnabledFor720Stream
{
  return 0;
}

- (id)findBitrateSplitForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v26 = 0;
  id v7 = [(VCSessionUplinkBandwidthAllocatorOneToOne *)self baseNetworkBitrateSplitForTargetBitrate:*(void *)&a4 baseNetworkBitrate:&v26];
  unint64_t v8 = 0x1E4F28000uLL;
  unsigned int v9 = objc_msgSend((id)objc_msgSend(v7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "unsignedIntValue");
  uint64_t v10 = a4 - v26;
  BOOL v11 = -[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMinMicBitrate:streamToken:remainderBitrate:](self, "shouldUseMinMicBitrate:streamToken:remainderBitrate:");
  if (a4 <= 0x2710) {
    unsigned int v12 = 10000;
  }
  else {
    unsigned int v12 = a4;
  }
  if (v11) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v9;
  }
  if (v10 >= 1 && v13)
  {
    uint64_t v24 = v10 & ~(v10 >> 63);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = (void *)[v7 allKeys];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      id v21 = v7;
      unint64_t v22 = v13;
      int64_t v23 = a3;
      uint64_t v17 = *(void *)v29;
      float v18 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          float v18 = v18
              + (float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", *(void *)(*((void *)&v28 + 1) + 8 * i), v21, v22, v23), "uplinkClient"), "remainderBitrateSplitForStreamToken:", objc_msgSend(*(id *)(*((void *)&v28 + 1) + 8 * i), "unsignedIntValue"));
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }
      while (v16);
      unint64_t v8 = 0x1E4F28000;
      LODWORD(v13) = v22;
      a3 = v23;
      id v7 = v21;
    }
    else
    {
      float v18 = 0.0;
    }
    if (v18 <= 0.0) {
      float v18 = 1.0;
    }
    unint64_t v13 = -[VCSessionUplinkBandwidthAllocatorOneToOne findAndSplitExtraBitrateFromCappedStreams:remainderBitrate:currentStreamGroupBitrate:streamToken:totalRemainderBitrateWeight:](self, "findAndSplitExtraBitrateFromCappedStreams:remainderBitrate:currentStreamGroupBitrate:streamToken:totalRemainderBitrateWeight:", v7, v24, (unint64_t)(float)((float)v13+ (float)((float)v24* (float)((float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v8 + 3792), "numberWithInteger:", a3)), "uplinkClient"), "remainderBitrateSplitForStreamToken:", a3)
                                                    / v18))),
            a3,
            (unint64_t)v18);
    unsigned int v25 = 0;
    if (objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(*(id *)(v8 + 3792), "numberWithInteger:", a3)), "uplinkClient"), "shouldCapStream:cappedBitrate:", a3, &v25)&& v13 >= v25)
    {
      unint64_t v13 = v25;
    }
  }
  return (id)[*(id *)(v8 + 3792) numberWithUnsignedInteger:v13];
}

- (unint64_t)findAndSplitExtraBitrateFromCappedStreams:(id)a3 remainderBitrate:(int64_t)a4 currentStreamGroupBitrate:(unint64_t)a5 streamToken:(int64_t)a6 totalRemainderBitrateWeight:(unint64_t)a7
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = (id)[a3 allKeys];
  uint64_t v10 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    int64_t v24 = a6;
    unint64_t v25 = a5;
    uint64_t v28 = 0;
    uint64_t v12 = *(void *)v34;
    float v13 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v34 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v15, v24, v25), "uplinkClient");
        unsigned int v17 = objc_msgSend(v16, "remainderBitrateSplitForStreamToken:", objc_msgSend(v15, "unsignedIntValue"));
        int v18 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", v15), "unsignedIntValue");
        unsigned int v31 = 0;
        if (objc_msgSend(v16, "shouldCapStream:cappedBitrate:", objc_msgSend(v15, "unsignedIntValue"), &v31)&& (unsigned int v19 = v18 + (unint64_t)v17 * a4 / a7, v20 = v19 >= v31, v21 = v19 - v31, v21 != 0 && v20))
        {
          v28 += v21;
        }
        else
        {
          float v13 = v13 + (float)v17;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v32 count:16];
    }
    while (v11);
    a6 = v24;
    a5 = v25;
    uint64_t v22 = v28;
  }
  else
  {
    uint64_t v22 = 0;
    float v13 = 0.0;
  }
  if (v13 <= 0.0) {
    float v13 = 1.0;
  }
  return (unint64_t)(float)((float)a5
                                 + (float)((float)v22
                                         * (float)((float)objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a6)), "uplinkClient"), "remainderBitrateSplitForStreamToken:", a6)/ v13)));
}

- (BOOL)isStreamGroupEnabled:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)[(NSMutableDictionary *)self->_streamTokenToEnableMap allKeys];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        int v11 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v10), "streamGroupID");
        if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v10), "BOOLValue"))BOOL v12 = v11 == a3; {
        else
        }
          BOOL v12 = 0;
        if (v12)
        {
          LOBYTE(v6) = 1;
          return v6;
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v14 count:16];
      uint64_t v7 = v6;
      if (v6) {
        continue;
      }
      break;
    }
  }
  return v6;
}

- (BOOL)shouldUseMinMicBitrate:(unint64_t)a3 streamToken:(int64_t)a4 remainderBitrate:(int64_t)a5
{
  if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a4)), "streamGroupID") != 1835623282)return 0; {
  uint64_t v9 = objc_msgSend((id)objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a4)), "uplinkClient"), "qualityTierTableForStreamToken:", a4);
  }
  unint64_t v10 = objc_msgSend((id)objc_msgSend(v9, "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "allKeys"), "sortedArrayUsingSelector:", sel_compare_), "firstObject")), "unsignedIntegerValue");
  return !a5 && v10 >= a3;
}

- (BOOL)shouldUseMultipleStreamGroupAlgorithm
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)[(NSMutableDictionary *)self->_streamTokenToEnableMap allKeys];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  BOOL v6 = 0;
  uint64_t v7 = *(void *)v17;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * i);
      int v10 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", v9), "streamGroupID");
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", v9), "BOOLValue"))
      {
        if (v10 > 1935897188)
        {
          BOOL v11 = v10 == 1937339233;
          int v12 = 1935897189;
        }
        else
        {
          BOOL v11 = v10 == 1650745716;
          int v12 = 1718909044;
        }
        if (v11 || v10 == v12) {
          BOOL v6 = 1;
        }
      }
    }
    uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v15 count:16];
  }
  while (v5);
  return v6;
}

- (id)baseNetworkBitrateSplitForTargetBitrate:(unsigned int)a3 baseNetworkBitrate:(unint64_t *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_bandwithAllocationTable, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  unint64_t v8 = objc_msgSend((id)objc_msgSend(v7, "firstObject"), "unsignedIntegerValue");
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
LABEL_3:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v17 != v11) {
        objc_enumerationMutation(v7);
      }
      float v13 = *(void **)(*((void *)&v16 + 1) + 8 * v12);
      if ([v13 unsignedIntValue] > a3) {
        break;
      }
      unint64_t v8 = [v13 unsignedIntegerValue];
      if (v10 == ++v12)
      {
        uint64_t v10 = [v7 countByEnumeratingWithState:&v16 objects:v15 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  *a4 = v8;
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_bandwithAllocationTable, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInteger:v8]);
}

+ (id)valueForNetworkBitrate:(id)a3 networkBitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  BOOL v6 = objc_msgSend((id)objc_msgSend(a3, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  unint64_t v7 = [v6 count] - 1;
  unint64_t v8 = +[VCArrayUtils insertionIndexForValue:array:](VCArrayUtils, "insertionIndexForValue:array:", [NSNumber numberWithUnsignedInt:v4], v6);
  if (v7 >= v8) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  uint64_t v10 = [v6 objectAtIndexedSubscript:v9];

  return (id)[a3 objectForKeyedSubscript:v10];
}

- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5
{
  uint64_t v5 = *(void *)&a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (!a5)
  {
    if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        uint64_t v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v46 = 136315650;
          *(void *)&v46[4] = v9;
          *(_WORD *)&v46[12] = 2080;
          *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 371;
          uint64_t v11 = " [%s] %s:%d Media bitrate allocation not supported for U+1, calculating network bitrates";
          uint64_t v12 = v10;
          uint32_t v13 = 28;
LABEL_12:
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, v46, v13);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        unint64_t v8 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)self performSelector:sel_logPrefix];
      }
      else {
        unint64_t v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        long long v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v46 = 136316162;
          *(void *)&v46[4] = v14;
          *(_WORD *)&v46[12] = 2080;
          *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 371;
          WORD2(v47) = 2112;
          *(void *)((char *)&v47 + 6) = v8;
          HIWORD(v47) = 2048;
          long long v48 = self;
          uint64_t v11 = " [%s] %s:%d %@(%p) Media bitrate allocation not supported for U+1, calculating network bitrates";
          uint64_t v12 = v15;
          uint32_t v13 = 48;
          goto LABEL_12;
        }
      }
    }
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v16)
  {
    [(VCObject *)self lock];
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3])&& (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "BOOLValue") & 1) != 0)
    {
      if ([(VCSessionUplinkBandwidthAllocatorOneToOne *)self shouldUseMultipleStreamGroupAlgorithm])
      {
        id v17 = [(VCSessionUplinkBandwidthAllocatorOneToOne *)self findBitrateSplitForStreamToken:a3 targetBitrate:v5];
        goto LABEL_36;
      }
      long long v18 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "uplinkClient");
      if ([(VCSessionUplinkBandwidthAllocatorOneToOne *)self isStreamGroupEnabled:1667329381])
      {
        uint64_t v19 = [v18 videoCallMicrophoneBandwidthTable];
      }
      else
      {
        uint64_t v19 = [v18 microphoneOnlyBandwidthTable];
      }
      id v20 = +[VCSessionUplinkBandwidthAllocatorOneToOne valueForNetworkBitrate:networkBitrate:](VCSessionUplinkBandwidthAllocatorOneToOne, "valueForNetworkBitrate:networkBitrate:", v19, v5, *(_OWORD *)v46, *(void *)&v46[16], v47, v48);
      int v21 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamGroupID");
      if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_32;
        }
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        int64_t v24 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        unint64_t v25 = FourccToCStr(v21);
        *(_DWORD *)long long v46 = 136315906;
        *(void *)&v46[4] = v23;
        *(_WORD *)&v46[12] = 2080;
        *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 391;
        WORD2(v47) = 2080;
        *(void *)((char *)&v47 + 6) = v25;
        uint64_t v26 = " [%s] %s:%d Calculate bitrate for streamGroup=%s";
        uint64_t v27 = v24;
        uint32_t v28 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v22 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v22 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_32;
        }
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        long long v30 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_32;
        }
        unsigned int v31 = FourccToCStr(v21);
        *(_DWORD *)long long v46 = 136316418;
        *(void *)&v46[4] = v29;
        *(_WORD *)&v46[12] = 2080;
        *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 391;
        WORD2(v47) = 2112;
        *(void *)((char *)&v47 + 6) = v22;
        HIWORD(v47) = 2048;
        long long v48 = self;
        LOWORD(v49) = 2080;
        *(void *)((char *)&v49 + 2) = v31;
        uint64_t v26 = " [%s] %s:%d %@(%p) Calculate bitrate for streamGroup=%s";
        uint64_t v27 = v30;
        uint32_t v28 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, v46, v28);
LABEL_32:
      if (v21 == 1835623282)
      {
        uint64_t v32 = v16;
        long long v33 = v20;
LABEL_38:
        objc_msgSend(v32, "addObject:", v33, *(void *)v46, *(_OWORD *)&v46[8], v47, v48, v49);
        goto LABEL_39;
      }
      if ([v20 unsignedIntValue] >= v5)
      {
        long long v33 = &unk_1F3DC4788;
        goto LABEL_37;
      }
      id v17 = (id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", v5 - objc_msgSend(v20, "unsignedIntValue"));
LABEL_36:
      long long v33 = v17;
LABEL_37:
      uint64_t v32 = v16;
      goto LABEL_38;
    }
    if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v37 = VRTraceErrorLogLevelToCSTR();
        __int16 v38 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v46 = 136315906;
          *(void *)&v46[4] = v37;
          *(_WORD *)&v46[12] = 2080;
          *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 381;
          WORD2(v47) = 2048;
          *(void *)((char *)&v47 + 6) = a3;
          v39 = " [%s] %s:%d StreamToken=%ld is disabled";
          __int16 v40 = v38;
          uint32_t v41 = 38;
LABEL_54:
          _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, v39, v46, v41);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v35 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)self performSelector:sel_logPrefix];
      }
      else {
        long long v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v42 = VRTraceErrorLogLevelToCSTR();
        long long v43 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long v46 = 136316418;
          *(void *)&v46[4] = v42;
          *(_WORD *)&v46[12] = 2080;
          *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBi"
                                "trate:preferNetworkBitrates:]";
          *(_WORD *)&v46[22] = 1024;
          LODWORD(v47) = 381;
          WORD2(v47) = 2112;
          *(void *)((char *)&v47 + 6) = v35;
          HIWORD(v47) = 2048;
          long long v48 = self;
          LOWORD(v49) = 2048;
          *(void *)((char *)&v49 + 2) = a3;
          v39 = " [%s] %s:%d %@(%p) StreamToken=%ld is disabled";
          __int16 v40 = v43;
          uint32_t v41 = 58;
          goto LABEL_54;
        }
      }
    }
  }
  else if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      long long v36 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)self performSelector:sel_logPrefix];
    }
    else {
      long long v36 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v44 = VRTraceErrorLogLevelToCSTR();
      long long v45 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long v46 = 136316162;
        *(void *)&v46[4] = v44;
        *(_WORD *)&v46[12] = 2080;
        *(void *)&v46[14] = "-[VCSessionUplinkBandwidthAllocatorOneToOne targetBitratesForStreamToken:targetNetworkBitr"
                              "ate:preferNetworkBitrates:]";
        *(_WORD *)&v46[22] = 1024;
        LODWORD(v47) = 377;
        WORD2(v47) = 2112;
        *(void *)((char *)&v47 + 6) = v36;
        HIWORD(v47) = 2048;
        long long v48 = self;
        _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to allocate media bitrate array", v46, 0x30u);
      }
    }
  }
LABEL_39:
  [(VCObject *)self unlock];
  return v16;
}

- (id)streamIDsIfStreamTokenIsEnabled:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] array];
  if (-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3])&& objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "BOOLValue"))
  {
    objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToTableEntryMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3)), "streamID")));
    return v5;
  }
  if ((VCSessionUplinkBandwidthAllocatorOneToOne *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      unint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136315906;
        uint64_t v16 = v7;
        __int16 v17 = 2080;
        long long v18 = "-[VCSessionUplinkBandwidthAllocatorOneToOne streamIDsIfStreamTokenIsEnabled:]";
        __int16 v19 = 1024;
        int v20 = 413;
        __int16 v21 = 2048;
        int64_t v22 = a3;
        uint64_t v9 = " [%s] %s:%d StreamToken=%ld is disabled";
        uint64_t v10 = v8;
        uint32_t v11 = 38;
LABEL_14:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v15, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v6 = (__CFString *)[(VCSessionUplinkBandwidthAllocatorOneToOne *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint32_t v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = 136316418;
        uint64_t v16 = v12;
        __int16 v17 = 2080;
        long long v18 = "-[VCSessionUplinkBandwidthAllocatorOneToOne streamIDsIfStreamTokenIsEnabled:]";
        __int16 v19 = 1024;
        int v20 = 413;
        __int16 v21 = 2112;
        int64_t v22 = (int64_t)v6;
        __int16 v23 = 2048;
        int64_t v24 = self;
        __int16 v25 = 2048;
        int64_t v26 = a3;
        uint64_t v9 = " [%s] %s:%d %@(%p) StreamToken=%ld is disabled";
        uint64_t v10 = v13;
        uint32_t v11 = 58;
        goto LABEL_14;
      }
    }
  }
  return v5;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  [(VCObject *)self lock];
  if (-[VCSessionUplinkBandwidthAllocatorOneToOne shouldUseMultipleStreamGroupAlgorithm](self, "shouldUseMultipleStreamGroupAlgorithm")&& !objc_msgSend(-[VCSessionUplinkBandwidthAllocatorOneToOne findBitrateSplitForStreamToken:targetBitrate:](self, "findBitrateSplitForStreamToken:targetBitrate:", a3, v4), "intValue"))
  {
    [(VCObject *)self unlock];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA48];
    return (id)[v9 array];
  }
  else
  {
    id v7 = [(VCSessionUplinkBandwidthAllocatorOneToOne *)self streamIDsIfStreamTokenIsEnabled:a3];
    [(VCObject *)self unlock];
    return v7;
  }
}

- (BOOL)isCamera1080pAvailable
{
  return 1;
}

- (void)init
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate bandwith allocation map", v2, v3, v4, v5, v6);
}

- (void)targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate media bitrate array", v2, v3, v4, v5, v6);
}

@end