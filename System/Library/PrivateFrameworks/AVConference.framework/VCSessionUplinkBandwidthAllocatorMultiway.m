@interface VCSessionUplinkBandwidthAllocatorMultiway
- (BOOL)isCamera1080pAvailable;
- (BOOL)isEnabledStreamToken:(int64_t)a3;
- (BOOL)isRedundancyEnabled;
- (BOOL)isRedundancyEnabledFor720Stream;
- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4;
- (VCSessionUplinkBandwidthAllocatorMultiway)init;
- (id)getBitrateToStreamTable;
- (id)repairStreamIDsForStreamToken:(int64_t)a3;
- (id)streamIDsForStreamToken:(int64_t)a3;
- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4;
- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrateCap:(unsigned int)a4;
- (id)tableEntriesForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4 remainingBitrate:(unsigned int *)a5 isLastEntryForStreamToken:(BOOL *)a6;
- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5;
- (void)_recomputeCurrentTable;
- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4;
- (void)dealloc;
- (void)init;
- (void)setCamera1080pAvailable:(BOOL)a3;
- (void)setRedundancyEnabled:(BOOL)a3;
- (void)setRedundancyEnabledFor720Stream:(BOOL)a3;
- (void)streamToken:(int64_t)a3 enabled:(BOOL)a4;
@end

@implementation VCSessionUplinkBandwidthAllocatorMultiway

- (VCSessionUplinkBandwidthAllocatorMultiway)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCSessionUplinkBandwidthAllocatorMultiway;
  v2 = [(VCObject *)&v8 init];
  if (v2)
  {
    v3 = [[VCSessionBandwidthAllocationTable alloc] initWithType:1];
    v2->_table = v3;
    if (v3)
    {
      v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v2->_streamTokenToEnableMap = v4;
      if (v4)
      {
        v2->_camera1080pAvailable = objc_msgSend(+[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton"), "is1080pCameraAvailable");
        return v2;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSessionUplinkBandwidthAllocatorMultiway init](v7);
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionUplinkBandwidthAllocatorMultiway init](v6);
      }
    }

    return 0;
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionUplinkBandwidthAllocatorMultiway;
  [(VCObject *)&v3 dealloc];
}

- (void)addBandwidthAllocationTableEntry:(id)a3 updateNow:(BOOL)a4
{
  BOOL v4 = a4;
  [(VCObject *)self lock];
  if (a3)
  {
    [(VCSessionBandwidthAllocationTable *)self->_table addBandwidthAllocationTableEntry:a3];
    streamTokenToEnableMap = self->_streamTokenToEnableMap;
    uint64_t v8 = [a3 streamToken];
    [(NSMutableDictionary *)streamTokenToEnableMap setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v8];
  }
  if (v4) {
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
  }

  [(VCObject *)self unlock];
}

- (void)streamToken:(int64_t)a3 enabled:(BOOL)a4
{
  BOOL v4 = a4;
  [(VCObject *)self lock];
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  uint64_t v8 = (void *)[(NSMutableDictionary *)self->_streamTokenToEnableMap objectForKeyedSubscript:v7];
  if (v8 && [v8 BOOLValue] != v4)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_streamTokenToEnableMap, "setObject:forKeyedSubscript:", [NSNumber numberWithBool:v4], v7);
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isEnabledStreamToken:(int64_t)a3
{
  objc_super v3 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_streamTokenToEnableMap, "objectForKeyedSubscript:", [NSNumber numberWithInteger:a3]);

  return [v3 BOOLValue];
}

- (void)setRedundancyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(VCObject *)self lock];
  if (self->_redundancyEnabled != v3)
  {
    self->_redundancyEnabled = v3;
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isRedundancyEnabled
{
  return self->_redundancyEnabled;
}

- (void)setRedundancyEnabledFor720Stream:(BOOL)a3
{
  BOOL v3 = a3;
  [(VCObject *)self lock];
  if (self->_redundancyEnabledFor720Stream != v3)
  {
    self->_redundancyEnabledFor720Stream = v3;
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isRedundancyEnabledFor720Stream
{
  return self->_redundancyEnabledFor720Stream;
}

- (void)setCamera1080pAvailable:(BOOL)a3
{
  BOOL v3 = a3;
  [(VCObject *)self lock];
  if (self->_camera1080pAvailable != v3)
  {
    self->_camera1080pAvailable = v3;
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
  }

  [(VCObject *)self unlock];
}

- (BOOL)isCamera1080pAvailable
{
  return self->_camera1080pAvailable;
}

- (BOOL)peerSubscription:(BOOL)a3 streamID:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  [(VCObject *)self lock];
  id v7 = -[VCSessionBandwidthAllocationTable entryForStreamID:](self->_table, "entryForStreamID:", [NSNumber numberWithUnsignedShort:v4]);
  if (!v7 || (uint64_t v8 = v7, v9 = [v7 isSubscribedTo], objc_msgSend(v8, "setSubscribedTo:", v5), v9 == v5))
  {
    BOOL v10 = 0;
  }
  else
  {
    [(VCSessionUplinkBandwidthAllocatorMultiway *)self _recomputeCurrentTable];
    BOOL v10 = 1;
  }
  [(VCObject *)self unlock];
  return v10;
}

- (id)tableEntriesForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4 remainingBitrate:(unsigned int *)a5 isLastEntryForStreamToken:(BOOL *)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  obj = [(NSArray *)[(NSDictionary *)self->_currentTable allKeys] sortedArrayUsingSelector:sel_compare_];
  v26 = a6;
  *a6 = 0;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v9 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v28 count:16];
  unsigned int v23 = a4;
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = 0;
    int v12 = 0;
    v13 = 0;
    uint64_t v14 = *(void *)v30;
    unint64_t v15 = a4;
LABEL_3:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v30 != v14) {
        objc_enumerationMutation(obj);
      }
      v17 = *(void **)(*((void *)&v29 + 1) + 8 * v16);
      if ([v17 unsignedIntegerValue] > v15) {
        break;
      }
      id v18 = [(NSDictionary *)self->_currentTable objectForKeyedSubscript:v17];
      v13 = objc_msgSend(v18, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", a3));
      int v11 = [v17 unsignedIntValue];
      v19 = (void *)[v13 lastObject];
      if (v19)
      {
        v20 = v19;
        if (v12 == [v19 streamID])
        {
          char v21 = 0;
        }
        else
        {
          int v12 = [v20 streamID];
          char v21 = 1;
        }
        BOOL *v26 = v21;
      }
      if (v10 == ++v16)
      {
        uint64_t v10 = [(NSArray *)obj countByEnumeratingWithState:&v29 objects:v28 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    int v11 = 0;
    v13 = 0;
  }
  if (a5) {
    *a5 = v23 - v11;
  }
  return v13;
}

- (id)targetBitratesForStreamToken:(int64_t)a3 targetNetworkBitrate:(unsigned int)a4 preferNetworkBitrates:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  int v34 = 0;
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v33 = 0;
  [(VCObject *)self lock];
  id v9 = [(VCSessionUplinkBandwidthAllocatorMultiway *)self tableEntriesForStreamToken:a3 targetBitrate:v6 remainingBitrate:&v34 isLastEntryForStreamToken:&v33];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v50 objects:v49 count:16];
  if (!v10)
  {
    if (!v33) {
      goto LABEL_28;
    }
    v20 = (void *)[obj lastObject];
    goto LABEL_19;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v51;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v51 != v12) {
        objc_enumerationMutation(obj);
      }
      uint64_t v14 = *(void **)(*((void *)&v50 + 1) + 8 * i);
      if (v5) {
        uint64_t v15 = [v14 maxNetworkBitrate];
      }
      else {
        uint64_t v15 = [v14 maxMediaBitrate];
      }
      uint64_t v16 = v15;
      BOOL v17 = [(VCSessionBandwidthAllocationTable *)self->_table shouldUseRepairBitrateForEntry:v14 isRedundancyEnabled:self->_redundancyEnabled isRedundancyEnabledFor720Stream:self->_redundancyEnabledFor720Stream];
      BOOL v18 = v17;
      if (v17)
      {
        unsigned int v19 = [v14 repairMaxNetworkBitrate];
        if (!v5) {
          uint64_t v16 = ((double)v19 / 1.1);
        }
      }
      objc_msgSend(v32, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v16));
    }
    uint64_t v11 = [obj countByEnumeratingWithState:&v50 objects:v49 count:16];
  }
  while (v11);
  if (v33)
  {
    v20 = (void *)[obj lastObject];
    if (!v18)
    {
LABEL_19:
      char v21 = v20;
      int v22 = [v20 minNetworkBitrate];
      if (v22 != [v21 maxNetworkBitrate])
      {
        [v32 removeLastObject];
        unsigned int v23 = [v21 maxNetworkBitrate];
        int v24 = [v21 minNetworkBitrate];
        if (v23 >= v34 + v24) {
          unsigned int v25 = v34 + v24;
        }
        else {
          unsigned int v25 = v23;
        }
        double v26 = (double)v25;
        if (!v5) {
          double v26 = (double)v25 / 1.1;
        }
        unsigned int v27 = v26;
        objc_msgSend(v32, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v26));
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v28 = VRTraceErrorLogLevelToCSTR();
          long long v29 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316674;
            uint64_t v36 = v28;
            __int16 v37 = 2080;
            v38 = "-[VCSessionUplinkBandwidthAllocatorMultiway targetBitratesForStreamToken:targetNetworkBitrate:preferNetworkBitrates:]";
            __int16 v39 = 1024;
            int v40 = 206;
            __int16 v41 = 2112;
            v42 = v21;
            __int16 v43 = 1024;
            int v44 = v34;
            __int16 v45 = 1024;
            unsigned int v46 = v25;
            __int16 v47 = 1024;
            unsigned int v48 = v27;
            _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Last entry=%@ will use remainingBitrate=%d available networkBitrate=%d bitrate=%d", buf, 0x38u);
          }
        }
      }
    }
  }
LABEL_28:
  [(VCObject *)self unlock];
  return v32;
}

- (id)streamIDsForStreamToken:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VCObject *)self lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(VCSessionBandwidthAllocationTable *)self->_table tableEntriesForStreamToken:a3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10++), "streamID")));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  [(VCObject *)self unlock];
  return v5;
}

- (id)repairStreamIDsForStreamToken:(int64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(VCObject *)self lock];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = [(VCSessionBandwidthAllocationTable *)self->_table tableEntriesForStreamToken:a3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10++), "repairStreamID")));
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v12 count:16];
    }
    while (v8);
  }
  [(VCObject *)self unlock];
  return v5;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  char v15 = 0;
  [(VCObject *)self lock];
  id v8 = [(VCSessionUplinkBandwidthAllocatorMultiway *)self tableEntriesForStreamToken:a3 targetBitrate:v4 remainingBitrate:0 isLastEntryForStreamToken:&v15];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "streamID")));
        if ([v13 v2StreamID]) {
          objc_msgSend(v7, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "v2StreamID")));
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v16 count:16];
    }
    while (v10);
  }
  [(VCObject *)self unlock];
  return v7;
}

- (id)streamIDsForStreamToken:(int64_t)a3 targetBitrateCap:(unsigned int)a4
{
  int64_t v23 = a3;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(VCObject *)self lock];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v24 = self;
  id v8 = [(NSArray *)[(NSDictionary *)self->_currentTable allKeys] sortedArrayUsingSelector:sel_compare_];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v32;
    unint64_t v12 = a4;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v14, "unsignedIntegerValue", v23) <= v12)
        {
          id v15 = [(NSDictionary *)v24->_currentTable objectForKeyedSubscript:v14];
          objc_msgSend(v7, "addObjectsFromArray:", objc_msgSend(v15, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInteger:", v23)));
        }
      }
      uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v30 count:16];
    }
    while (v10);
  }
  [(VCObject *)v24 unlock];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v16 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v27 != v18) {
          objc_enumerationMutation(v7);
        }
        long long v20 = *(void **)(*((void *)&v26 + 1) + 8 * j);
        objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "streamID")));
        if ([v20 v2StreamID]) {
          objc_msgSend(v6, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v20, "v2StreamID")));
        }
      }
      uint64_t v17 = [v7 countByEnumeratingWithState:&v26 objects:v25 count:16];
    }
    while (v17);
  }

  uint64_t v21 = (void *)[v6 allObjects];
  return v21;
}

- (void)_recomputeCurrentTable
{
  self->_currentTable = (NSDictionary *)[(VCSessionBandwidthAllocationTable *)self->_table newAggregatedBandwidthTableWithRedundancy:self->_redundancyEnabled redundancyEnabledFor720Stream:self->_redundancyEnabledFor720Stream enableMap:self->_streamTokenToEnableMap is1080pCameraAvailable:self->_camera1080pAvailable];
}

- (id)getBitrateToStreamTable
{
  [(VCObject *)self lock];
  id v3 = (id)[(NSDictionary *)self->_currentTable copy];
  [(VCObject *)self unlock];
  return v3;
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 35;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate stream token to enable map", (uint8_t *)&v2, 0x1Cu);
}

@end