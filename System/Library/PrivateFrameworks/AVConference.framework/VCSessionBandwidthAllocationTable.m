@interface VCSessionBandwidthAllocationTable
- (BOOL)shouldAddBackupEntry:(id)a3 referenceTable:(id)a4 referenceQualityIndices:(id)a5;
- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4;
- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4 is1080pCameraAvailable:(BOOL)a5;
- (BOOL)shouldUseRepairBitrateForEntry:(id)a3 isRedundancyEnabled:(BOOL)a4 isRedundancyEnabledFor720Stream:(BOOL)a5;
- (NSDictionary)audioOnlyBitrateToStreamIDsTable;
- (NSDictionary)audioVideoBitrateToStreamIDsTable;
- (NSDictionary)videoOnlyBitrateToStreamIDsTable;
- (NSDictionary)videoStreamIdToRepairStreamIdMap;
- (VCSessionBandwidthAllocationTable)initWithType:(unsigned __int8)a3;
- (id)entryForStreamID:(id)a3;
- (id)newAggregatedBandwidthTableWithRedundancy:(BOOL)a3 redundancyEnabledFor720Stream:(BOOL)a4 enableMap:(id)a5 is1080pCameraAvailable:(BOOL)a6;
- (id)tableEntriesForStreamToken:(int64_t)a3;
- (void)addBandwidthAllocationTableEntry:(id)a3;
- (void)appendEntry:(id)a3 streamTokenEntries:(id)a4 currentNetworkBitrate:(unsigned int *)a5 shouldUseRepairBitrate:(BOOL)a6 appendedVideoEncoderGroups:(id)a7;
- (void)cleanupStreamTokenEntries:(id)a3 currentNetworkBitrate:(unsigned int *)a4 isRedundancyEnabled:(BOOL)a5 appendedVideoEncoderGroups:(id)a6;
- (void)dealloc;
- (void)printTable:(id)a3;
@end

@implementation VCSessionBandwidthAllocationTable

- (VCSessionBandwidthAllocationTable)initWithType:(unsigned __int8)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionBandwidthAllocationTable;
  v4 = [(VCObject *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_type = a3;
    v4->_streamTokenEntries = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_streamIDToEntryTable = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5->_maxActiveScreenEncoders = +[VCHardwareSettings maxActiveScreenEncoders];
    v5->_maxActiveCameraEncoders = +[VCHardwareSettings maxActiveVideoEncoders];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBandwidthAllocationTable;
  [(VCObject *)&v3 dealloc];
}

- (id)entryForStreamID:(id)a3
{
  if (a3) {
    return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamIDToEntryTable, "objectForKeyedSubscript:");
  }
  else {
    return 0;
  }
}

- (void)addBandwidthAllocationTableEntry:(id)a3
{
  v5 = (VCSessionBandwidthAllocationTableStreamInfo *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenEntries, "objectForKeyedSubscript:", [a3 streamToken]);
  if (!v5)
  {
    v5 = objc_alloc_init(VCSessionBandwidthAllocationTableStreamInfo);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenEntries, "setObject:forKeyedSubscript:", v5, [a3 streamToken]);
  }
  [(VCSessionBandwidthAllocationTableStreamInfo *)v5 addTableEntry:a3];
  streamIDToEntryTable = self->_streamIDToEntryTable;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamID"));

  [(NSMutableDictionary *)streamIDToEntryTable setObject:a3 forKeyedSubscript:v7];
}

- (id)tableEntriesForStreamToken:(int64_t)a3
{
  objc_super v3 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenEntries, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3]);

  return (id)[v3 sortedEntries];
}

- (BOOL)shouldUseRepairBitrateForEntry:(id)a3 isRedundancyEnabled:(BOOL)a4 isRedundancyEnabledFor720Stream:(BOOL)a5
{
  if (a4)
  {
    int v7 = [a3 hasRepairStreamID];
    if (v7) {
      LOBYTE(v7) = [a3 qualityIndex] != 1000 || a5;
    }
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

- (id)newAggregatedBandwidthTableWithRedundancy:(BOOL)a3 redundancyEnabledFor720Stream:(BOOL)a4 enableMap:(id)a5 is1080pCameraAvailable:(BOOL)a6
{
  uint64_t v6 = a6;
  BOOL v42 = a4;
  uint64_t v8 = a3;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  streamTokenEntries = self->_streamTokenEntries;
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __142__VCSessionBandwidthAllocationTable_newAggregatedBandwidthTableWithRedundancy_redundancyEnabledFor720Stream_enableMap_is1080pCameraAvailable___block_invoke;
  v51[3] = &unk_1E6DB9AD8;
  v51[4] = v11;
  v51[5] = a5;
  v51[6] = v10;
  [(NSMutableDictionary *)streamTokenEntries enumerateKeysAndObjectsUsingBlock:v51];
  v13 = objc_msgSend((id)objc_msgSend(v10, "allKeys"), "sortedArrayUsingSelector:", sel_compare_);
  id v43 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  unsigned int v50 = 0;
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id obj = v13;
  uint64_t v48 = [v13 countByEnumeratingWithState:&v70 objects:v69 count:16];
  if (v48)
  {
    uint64_t v47 = *(void *)v71;
    v41 = self;
    unsigned int v39 = v6;
    unsigned int v40 = v8;
    id v37 = v14;
    id v38 = v10;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v71 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v49 = v15;
        uint64_t v16 = *(void *)(*((void *)&v70 + 1) + 8 * v15);
        v17 = (void *)[v10 objectForKeyedSubscript:v16];
        if (![v17 isStartOnDemand]
          || ([v17 isSubscribedTo] & 1) != 0
          || [(VCSessionBandwidthAllocationTable *)self shouldAddBackupEntry:v16 referenceTable:v10 referenceQualityIndices:obj])
        {
          uint64_t v18 = objc_msgSend(v11, "objectForKeyedSubscript:", objc_msgSend(v17, "streamToken"));
          [(VCSessionBandwidthAllocationTable *)self cleanupStreamTokenEntries:v18 currentNetworkBitrate:&v50 isRedundancyEnabled:v8 appendedVideoEncoderGroups:v14];
          if ([(VCSessionBandwidthAllocationTable *)self shouldAppendEntry:v17 appendedVideoEncoderGroups:v14 is1080pCameraAvailable:v6])
          {
            v44 = v17;
            BOOL v46 = [(VCSessionBandwidthAllocationTable *)self shouldUseRepairBitrateForEntry:v17 isRedundancyEnabled:v8 isRedundancyEnabledFor720Stream:v42];
            -[VCSessionBandwidthAllocationTable appendEntry:streamTokenEntries:currentNetworkBitrate:shouldUseRepairBitrate:appendedVideoEncoderGroups:](self, "appendEntry:streamTokenEntries:currentNetworkBitrate:shouldUseRepairBitrate:appendedVideoEncoderGroups:", v17, v18, &v50);
            id v19 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
            long long v65 = 0u;
            long long v66 = 0u;
            long long v67 = 0u;
            long long v68 = 0u;
            v20 = (void *)[(NSMutableDictionary *)self->_streamTokenEntries allKeys];
            uint64_t v21 = [v20 countByEnumeratingWithState:&v65 objects:v64 count:16];
            if (v21)
            {
              uint64_t v22 = v21;
              uint64_t v23 = *(void *)v66;
              do
              {
                for (uint64_t i = 0; i != v22; ++i)
                {
                  if (*(void *)v66 != v23) {
                    objc_enumerationMutation(v20);
                  }
                  objc_msgSend(v19, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithArray:", objc_msgSend(v11, "objectForKeyedSubscript:", *(void *)(*((void *)&v65 + 1) + 8 * i))), *(void *)(*((void *)&v65 + 1) + 8 * i));
                }
                uint64_t v22 = [v20 countByEnumeratingWithState:&v65 objects:v64 count:16];
              }
              while (v22);
            }
            objc_msgSend(v43, "setObject:forKeyedSubscript:", v19, objc_msgSend(NSNumber, "numberWithUnsignedInt:", v50));
            if (!v46)
            {
              int v25 = [v44 maxNetworkBitrate];
              int v26 = [v44 minNetworkBitrate];
              v50 += v25 - v26;
            }

            self = v41;
            uint64_t v6 = v39;
            uint64_t v8 = v40;
            id v14 = v37;
            id v10 = v38;
          }
        }
        uint64_t v15 = v49 + 1;
      }
      while (v49 + 1 != v48);
      uint64_t v48 = [obj countByEnumeratingWithState:&v70 objects:v69 count:16];
    }
    while (v48);
  }

  if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == self)
  {
    v28 = v43;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v53 = v29;
        __int16 v54 = 2080;
        v55 = "-[VCSessionBandwidthAllocationTable newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Strea"
              "m:enableMap:is1080pCameraAvailable:]";
        __int16 v56 = 1024;
        int v57 = 178;
        __int16 v58 = 1024;
        LODWORD(v59) = v8;
        v31 = " [%s] %s:%d Recomputed tier table. isRedundancyEnabled=%d";
        v32 = v30;
        uint32_t v33 = 34;
LABEL_32:
        _os_log_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_DEFAULT, v31, buf, v33);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v27 = (__CFString *)[(VCSessionBandwidthAllocationTable *)self performSelector:sel_logPrefix];
    }
    else {
      v27 = &stru_1F3D3E450;
    }
    v28 = v43;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      v35 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v53 = v34;
        __int16 v54 = 2080;
        v55 = "-[VCSessionBandwidthAllocationTable newAggregatedBandwidthTableWithRedundancy:redundancyEnabledFor720Strea"
              "m:enableMap:is1080pCameraAvailable:]";
        __int16 v56 = 1024;
        int v57 = 178;
        __int16 v58 = 2112;
        v59 = v27;
        __int16 v60 = 2048;
        v61 = self;
        __int16 v62 = 1024;
        int v63 = v8;
        v31 = " [%s] %s:%d %@(%p) Recomputed tier table. isRedundancyEnabled=%d";
        v32 = v35;
        uint32_t v33 = 54;
        goto LABEL_32;
      }
    }
  }
  [(VCSessionBandwidthAllocationTable *)self printTable:v28];
  return v28;
}

uint64_t __142__VCSessionBandwidthAllocationTable_newAggregatedBandwidthTableWithRedundancy_redundancyEnabledFor720Stream_enableMap_is1080pCameraAvailable___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (![*(id *)(a1 + 32) objectForKeyedSubscript:a2]) {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E4F1CA48], "array"), a2);
  }
  uint64_t result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", a2), "BOOLValue");
  if (result)
  {
    int v7 = *(void **)(a1 + 48);
    uint64_t v8 = [a3 qualityIndexToTableEntry];
    return [v7 addEntriesFromDictionary:v8];
  }
  return result;
}

- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
  uint64_t v7 = [v6 countByEnumeratingWithState:&v42 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    unsigned int v9 = 0;
    uint64_t v10 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v43 != v10) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))), "objectForKeyedSubscript:", *(void *)(*((void *)&v42 + 1) + 8 * i)), "count"))
        {
          ++v9;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v42 objects:v41 count:16];
    }
    while (v8);
  }
  else
  {
    unsigned int v9 = 0;
  }
  if ([a3 streamGroupID] == 1935897189)
  {
    v12 = &OBJC_IVAR___VCSessionBandwidthAllocationTable__maxActiveScreenEncoders;
    v13 = self;
  }
  else
  {
    v13 = self;
    if ([a3 streamGroupID] != 1667329381)
    {
      unsigned int v14 = -1;
      goto LABEL_18;
    }
    v12 = &OBJC_IVAR___VCSessionBandwidthAllocationTable__maxActiveCameraEncoders;
  }
  unsigned int v14 = *(_DWORD *)((char *)&v13->super.super.isa + *v12);
LABEL_18:
  if (v9 < v14) {
    return 1;
  }
  uint64_t v15 = objc_msgSend(a4, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
  if (objc_msgSend((id)objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID"))), "count"))
  {
    return 1;
  }
  if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v18 = VRTraceErrorLogLevelToCSTR();
    id v19 = *MEMORY[0x1E4F47A50];
    BOOL v20 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v20)
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v29 = v18;
      __int16 v30 = 2080;
      v31 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:]";
      __int16 v32 = 1024;
      int v33 = 205;
      __int16 v34 = 1024;
      *(_DWORD *)v35 = v9;
      *(_WORD *)&v35[4] = 1024;
      *(_DWORD *)&v35[6] = [a3 qualityIndex];
      uint64_t v21 = " [%s] %s:%d Reached max screen encoders=%d Not adding streamQualityIndex=%d";
      uint64_t v22 = v19;
      uint32_t v23 = 40;
LABEL_32:
      _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
      return 0;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v17 = (__CFString *)[(VCSessionBandwidthAllocationTable *)v13 performSelector:sel_logPrefix];
    }
    else {
      v17 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      return 0;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    int v25 = *MEMORY[0x1E4F47A50];
    BOOL v26 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT);
    BOOL result = 0;
    if (v26)
    {
      *(_DWORD *)buf = 136316674;
      uint64_t v29 = v24;
      __int16 v30 = 2080;
      v31 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:]";
      __int16 v32 = 1024;
      int v33 = 205;
      __int16 v34 = 2112;
      *(void *)v35 = v17;
      *(_WORD *)&v35[8] = 2048;
      v36 = v13;
      __int16 v37 = 1024;
      unsigned int v38 = v9;
      __int16 v39 = 1024;
      int v40 = [a3 qualityIndex];
      uint64_t v21 = " [%s] %s:%d %@(%p) Reached max screen encoders=%d Not adding streamQualityIndex=%d";
      uint64_t v22 = v25;
      uint32_t v23 = 60;
      goto LABEL_32;
    }
  }
  return result;
}

- (BOOL)shouldAppendEntry:(id)a3 appendedVideoEncoderGroups:(id)a4 is1080pCameraAvailable:(BOOL)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ([a3 streamGroupID] == 1667329381
    && [a3 qualityIndex] == 1800
    && !a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315906;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCSessionBandwidthAllocationTable shouldAppendEntry:appendedVideoEncoderGroups:is1080pCameraAvailable:]";
        __int16 v16 = 1024;
        int v17 = 219;
        __int16 v18 = 1024;
        int v19 = [a3 qualityIndex];
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Skipping stream [1080x1080] with qualityIndex=%d as camera doesn't support", (uint8_t *)&v12, 0x22u);
      }
    }
    return 0;
  }
  else
  {
    return [(VCSessionBandwidthAllocationTable *)self shouldAppendEntry:a3 appendedVideoEncoderGroups:a4];
  }
}

- (void)cleanupStreamTokenEntries:(id)a3 currentNetworkBitrate:(unsigned int *)a4 isRedundancyEnabled:(BOOL)a5 appendedVideoEncoderGroups:(id)a6
{
  BOOL v7 = a5;
  uint64_t v10 = (void *)[a3 lastObject];
  if ([v10 isStartOnDemand] && (objc_msgSend(v10, "isSubscribedTo") & 1) == 0)
  {
    if (v7 && [v10 hasRepairStreamID]) {
      int v11 = [v10 repairMaxNetworkBitrate];
    }
    else {
      int v11 = [v10 maxNetworkBitrate];
    }
    *a4 -= v11;
    if ([v10 streamGroupID] == 1935897189
      || [v10 streamGroupID] == 1667329381)
    {
      int v12 = objc_msgSend(a6, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "streamGroupID")));
      uint64_t v13 = objc_msgSend(v12, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "encoderGroupID")));
      objc_msgSend(v13, "removeObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v10, "streamID")));
    }
    [a3 removeLastObject];
  }
}

- (void)appendEntry:(id)a3 streamTokenEntries:(id)a4 currentNetworkBitrate:(unsigned int *)a5 shouldUseRepairBitrate:(BOOL)a6 appendedVideoEncoderGroups:(id)a7
{
  BOOL v8 = a6;
  objc_msgSend(a4, "addObject:");
  if (v8) {
    int v11 = [a3 repairMaxNetworkBitrate];
  }
  else {
    int v11 = [a3 minNetworkBitrate];
  }
  *a5 += v11;
  if ([a3 streamGroupID] == 1935897189
    || [a3 streamGroupID] == 1667329381)
  {
    if (!objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID"))))
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA60] dictionary];
      objc_msgSend(a7, "setObject:forKeyedSubscript:", v12, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    }
    uint64_t v13 = objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    if (!objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID"))))
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v15 = objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
      objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID")));
    }
    __int16 v16 = objc_msgSend(a7, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamGroupID")));
    int v17 = objc_msgSend(v16, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "encoderGroupID")));
    uint64_t v18 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "streamID"));
    [v17 addObject:v18];
  }
}

- (BOOL)shouldAddBackupEntry:(id)a3 referenceTable:(id)a4 referenceQualityIndices:(id)a5
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [a5 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    uint64_t v11 = *(void *)v19;
    char v12 = 1;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(a5);
        }
        uint64_t v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
        uint64_t v15 = (void *)[a4 objectForKeyedSubscript:v14];
        if ([v14 isEqualToNumber:a3])
        {
          uint64_t v10 = [v15 streamToken];
LABEL_8:
          char v12 = 0;
          goto LABEL_11;
        }
        if ((v12 & 1) == 0)
        {
          if (objc_msgSend((id)objc_msgSend(v15, "streamToken"), "isEqualToNumber:", v10)
            && (![v15 isStartOnDemand] || (objc_msgSend(v15, "isSubscribedTo") & 1) != 0))
          {
            LOBYTE(v8) = 1;
            return v8;
          }
          goto LABEL_8;
        }
        char v12 = 1;
LABEL_11:
        ++v13;
      }
      while (v9 != v13);
      uint64_t v8 = [a5 countByEnumeratingWithState:&v18 objects:v17 count:16];
      uint64_t v9 = v8;
    }
    while (v8);
  }
  return v8;
}

- (void)printTable:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = (id)[a3 allKeys];
  uint64_t v4 = [obj countByEnumeratingWithState:&v34 objects:v33 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v35;
    *(void *)&long long v5 = 136315650;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v35 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(a3, "objectForKeyedSubscript:", v9, v19);
        if ((VCSessionBandwidthAllocationTable *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v17 = VRTraceErrorLogLevelToCSTR();
            long long v18 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v19;
              uint64_t v24 = v17;
              __int16 v25 = 2080;
              BOOL v26 = "-[VCSessionBandwidthAllocationTable printTable:]";
              __int16 v27 = 1024;
              int v28 = 299;
              uint64_t v14 = v18;
              uint64_t v15 = " [%s] %s:%d Printing Table ########### ";
              uint32_t v16 = 28;
              goto LABEL_15;
            }
          }
        }
        else
        {
          uint64_t v11 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v11 = (__CFString *)[(VCSessionBandwidthAllocationTable *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
          {
            uint64_t v12 = VRTraceErrorLogLevelToCSTR();
            uint64_t v13 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v24 = v12;
              __int16 v25 = 2080;
              BOOL v26 = "-[VCSessionBandwidthAllocationTable printTable:]";
              __int16 v27 = 1024;
              int v28 = 299;
              __int16 v29 = 2112;
              __int16 v30 = v11;
              __int16 v31 = 2048;
              __int16 v32 = self;
              uint64_t v14 = v13;
              uint64_t v15 = " [%s] %s:%d %@(%p) Printing Table ########### ";
              uint32_t v16 = 48;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, v16);
            }
          }
        }
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __48__VCSessionBandwidthAllocationTable_printTable___block_invoke;
        v22[3] = &unk_1E6DB9B00;
        v22[4] = self;
        v22[5] = v9;
        [v10 enumerateKeysAndObjectsUsingBlock:v22];
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v33 count:16];
    }
    while (v6);
  }
}

void __48__VCSessionBandwidthAllocationTable_printTable___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(__CFString **)(a1 + 40);
        int v17 = 136316418;
        uint64_t v18 = v7;
        __int16 v19 = 2080;
        long long v20 = "-[VCSessionBandwidthAllocationTable printTable:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 301;
        __int16 v23 = 2112;
        uint64_t v24 = v9;
        __int16 v25 = 2112;
        uint64_t v26 = a2;
        __int16 v27 = 2112;
        uint64_t v28 = a3;
        uint64_t v10 = " [%s] %s:%d Bandwidth %@, streamToken:%@, %@";
        uint64_t v11 = v8;
        uint32_t v12 = 58;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        uint64_t v16 = *(void *)(a1 + 40);
        int v17 = 136316930;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        long long v20 = "-[VCSessionBandwidthAllocationTable printTable:]_block_invoke";
        __int16 v21 = 1024;
        int v22 = 301;
        __int16 v23 = 2112;
        uint64_t v24 = v6;
        __int16 v25 = 2048;
        uint64_t v26 = v15;
        __int16 v27 = 2112;
        uint64_t v28 = v16;
        __int16 v29 = 2112;
        uint64_t v30 = a2;
        __int16 v31 = 2112;
        uint64_t v32 = a3;
        uint64_t v10 = " [%s] %s:%d %@(%p) Bandwidth %@, streamToken:%@, %@";
        uint64_t v11 = v14;
        uint32_t v12 = 78;
        goto LABEL_11;
      }
    }
  }
}

- (NSDictionary)audioOnlyBitrateToStreamIDsTable
{
  return self->_audioOnlyBitrateToStreamIDsTable;
}

- (NSDictionary)audioVideoBitrateToStreamIDsTable
{
  return self->_audioVideoBitrateToStreamIDsTable;
}

- (NSDictionary)videoOnlyBitrateToStreamIDsTable
{
  return self->_videoOnlyBitrateToStreamIDsTable;
}

- (NSDictionary)videoStreamIdToRepairStreamIdMap
{
  return self->_videoStreamIdToRepairStreamIdMap;
}

@end