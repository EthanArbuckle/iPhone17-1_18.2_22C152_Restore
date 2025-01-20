@interface VCSessionDownlinkBandwidthAllocator
+ (id)sortMediaEntriesGroupIds:(id)a3;
- (BOOL)forceFullBandwidth;
- (VCSessionDownlinkBandwidthAllocator)initWithReportingAgent:(opaqueRTCReporting *)a3;
- (id)distributeBitrate:(unsigned int)a3;
- (unint64_t)simultaneousTalkers;
- (unsigned)requiredAudioBitrate:(unsigned int)a3 highestAudioBitrates:(id)a4;
- (void)client:(id)a3 didActualNetworkBitrateChangeForStreamGroupID:(unsigned int)a4;
- (void)dealloc;
- (void)deregisterForBandwidthAllocationWithClient:(id)a3;
- (void)registerForBandwidthAllocationWithClient:(id)a3;
- (void)reportingSessionParticipantEventBitrateChanged:(id)a3 optedInNetworkBitrate:(unsigned int)a4 actualNetworkBitrate:(unsigned int)a5 optedInStreamID:(id)a6 actualStreamID:(id)a7;
- (void)reset;
- (void)setForceFullBandwidth:(BOOL)a3;
- (void)sortMediaEntries;
- (void)updateHighestAudioBitrates:(id)a3 bitrate:(unsigned int)a4;
- (void)updateSelectedMediaEntriesForClientWithUUID:(id)a3;
@end

@implementation VCSessionDownlinkBandwidthAllocator

- (VCSessionDownlinkBandwidthAllocator)initWithReportingAgent:(opaqueRTCReporting *)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCSessionDownlinkBandwidthAllocator;
  v4 = [(VCSessionDownlinkBandwidthAllocator *)&v7 init];
  if (v4)
  {
    v4->_clients = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_reportingAgent = a3;
    if (a3) {
      CFRetain(a3);
    }
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v4->_clientQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.DOWN.VCBandwidth.clientQueue", 0, CustomRootQueue);
    v4->_sortedMediaEntries = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_allocatedMediaEntriesForClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_selectedMediaEntriesForClients = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v4->_maxConcurrentVideoClients = [+[VCHardwareSettingsEmbedded sharedInstance] maxActiveVideoDecoders];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];

  dispatch_release((dispatch_object_t)self->_clientQueue);
  reportingAgent = self->_reportingAgent;
  if (reportingAgent) {
    CFRelease(reportingAgent);
  }
  v4.receiver = self;
  v4.super_class = (Class)VCSessionDownlinkBandwidthAllocator;
  [(VCSessionDownlinkBandwidthAllocator *)&v4 dealloc];
}

+ (id)sortMediaEntriesGroupIds:(id)a3
{
  objc_super v4 = (void *)[MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = (void *)[MEMORY[0x1E4F1CA48] arrayWithArray:a3];
  if ([a3 containsObject:&unk_1F3DC5B38]) {
    [v4 addObject:&unk_1F3DC5B38];
  }
  if ([a3 containsObject:&unk_1F3DC5B50]) {
    [v4 addObject:&unk_1F3DC5B50];
  }
  if ([a3 containsObject:&unk_1F3DC5B68]) {
    [v4 addObject:&unk_1F3DC5B68];
  }
  if ([a3 containsObject:&unk_1F3DC5B80]) {
    [v4 addObject:&unk_1F3DC5B80];
  }
  [v5 removeObjectsInArray:v4];
  [v5 sortUsingSelector:sel_compare_];
  [v4 addObjectsFromArray:v5];
  return v4;
}

- (void)sortMediaEntries
{
  v2 = self;
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  [(VCSessionDownlinkBandwidthAllocator *)self reset];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  obuint64_t j = v2->_clients;
  uint64_t v51 = [(NSMutableArray *)obj countByEnumeratingWithState:&v80 objects:v79 count:16];
  v52 = v2;
  if (!v51)
  {
    unsigned int v49 = 0;
    goto LABEL_31;
  }
  unsigned int v49 = 0;
  uint64_t v50 = *(void *)v81;
  *(void *)&long long v4 = 136316162;
  long long v47 = v4;
  do
  {
    for (uint64_t i = 0; i != v51; ++i)
    {
      if (*(void *)v81 != v50) {
        objc_enumerationMutation(obj);
      }
      v6 = *(void **)(*((void *)&v80 + 1) + 8 * i);
      long long v75 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      v53 = v6;
      objc_super v7 = objc_msgSend(v6, "mediaEntries", v47);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v75 objects:v74 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v54 = i;
        char v10 = 0;
        uint64_t v11 = *(void *)v76;
        do
        {
          for (uint64_t j = 0; j != v9; ++j)
          {
            if (*(void *)v76 != v11) {
              objc_enumerationMutation(v7);
            }
            v13 = *(void **)(*((void *)&v75 + 1) + 8 * j);
            uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v13, "streamGroupID"));
            id v15 = (id)[v3 objectForKeyedSubscript:v14];
            if (!v15)
            {
              id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
              [v3 setObject:v15 forKeyedSubscript:v14];
            }
            v10 |= [v13 type] == 1;
            [v15 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v75 objects:v74 count:16];
        }
        while (v9);
        uint64_t i = v54;
        if (v10)
        {
          ++v49;
          v2 = v52;
          continue;
        }
      }
      v2 = v52;
      if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == v52)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          v25 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v26 = [v53 uuid];
            uint64_t v27 = [v53 mediaEntries];
            *(_DWORD *)buf = v47;
            uint64_t v61 = v24;
            __int16 v62 = 2080;
            v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
            __int16 v64 = 1024;
            int v65 = 122;
            __int16 v66 = 2112;
            uint64_t v67 = v26;
            __int16 v68 = 2112;
            v69 = (VCSessionDownlinkBandwidthAllocator *)v27;
            v21 = v25;
            v22 = "VCBandwidth [%s] %s:%d No audio entry for client=%@ mediaEntries=%@";
            uint32_t v23 = 48;
            goto LABEL_26;
          }
        }
      }
      else
      {
        v16 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v16 = (__CFString *)[(VCSessionDownlinkBandwidthAllocator *)v52 performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v19 = [v53 uuid];
            uint64_t v20 = [v53 mediaEntries];
            *(_DWORD *)buf = 136316674;
            uint64_t v61 = v17;
            __int16 v62 = 2080;
            v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
            __int16 v64 = 1024;
            int v65 = 122;
            __int16 v66 = 2112;
            uint64_t v67 = (uint64_t)v16;
            __int16 v68 = 2048;
            v69 = v52;
            __int16 v70 = 2112;
            uint64_t v71 = v19;
            __int16 v72 = 2112;
            uint64_t v73 = v20;
            v21 = v18;
            v22 = "VCBandwidth [%s] %s:%d %@(%p) No audio entry for client=%@ mediaEntries=%@";
            uint32_t v23 = 68;
LABEL_26:
            _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v22, buf, v23);
            continue;
          }
        }
      }
    }
    uint64_t v51 = [(NSMutableArray *)obj countByEnumeratingWithState:&v80 objects:v79 count:16];
  }
  while (v51);
LABEL_31:
  id v28 = +[VCSessionDownlinkBandwidthAllocator sortMediaEntriesGroupIds:](VCSessionDownlinkBandwidthAllocator, "sortMediaEntriesGroupIds:", [v3 allKeys]);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v56 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v57;
    unsigned int v32 = v49;
    do
    {
      for (uint64_t k = 0; k != v30; ++k)
      {
        if (*(void *)v57 != v31) {
          objc_enumerationMutation(v28);
        }
        v34 = (void *)[v3 objectForKeyedSubscript:*(void *)(*((void *)&v56 + 1) + 8 * k)];
        [v34 sortUsingSelector:sel_compare_];
        [(NSMutableArray *)v2->_sortedMediaEntries addObjectsFromArray:v34];
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v56 objects:v55 count:16];
    }
    while (v30);
  }
  else
  {
    unsigned int v32 = v49;
  }
  [(NSMutableArray *)v2->_sortedMediaEntries sortUsingSelector:sel_compare_];
  if (v32)
  {
    uint64_t v35 = 0;
    uint64_t v36 = v32;
    do
    {
      if (objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](v2->_sortedMediaEntries, "objectAtIndexedSubscript:", v35), "type") != 1)
      {
        if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == v52)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
            goto LABEL_53;
          }
          uint64_t v44 = VRTraceErrorLogLevelToCSTR();
          v45 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_53;
          }
          sortedMediaEntries = v52->_sortedMediaEntries;
          *(_DWORD *)buf = 136315906;
          uint64_t v61 = v44;
          __int16 v62 = 2080;
          v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
          __int16 v64 = 1024;
          int v65 = 140;
          __int16 v66 = 2112;
          uint64_t v67 = (uint64_t)sortedMediaEntries;
          v41 = v45;
          v42 = "VCBandwidth [%s] %s:%d Missing audio entries in sortedMediaEntries=%@";
          uint32_t v43 = 38;
        }
        else
        {
          v37 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            v37 = (__CFString *)[(VCSessionDownlinkBandwidthAllocator *)v52 performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
            goto LABEL_53;
          }
          uint64_t v38 = VRTraceErrorLogLevelToCSTR();
          v39 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_53;
          }
          v40 = v52->_sortedMediaEntries;
          *(_DWORD *)buf = 136316418;
          uint64_t v61 = v38;
          __int16 v62 = 2080;
          v63 = "-[VCSessionDownlinkBandwidthAllocator sortMediaEntries]";
          __int16 v64 = 1024;
          int v65 = 140;
          __int16 v66 = 2112;
          uint64_t v67 = (uint64_t)v37;
          __int16 v68 = 2048;
          v69 = v52;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v40;
          v41 = v39;
          v42 = "VCBandwidth [%s] %s:%d %@(%p) Missing audio entries in sortedMediaEntries=%@";
          uint32_t v43 = 58;
        }
        _os_log_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEFAULT, v42, buf, v43);
      }
LABEL_53:
      ++v35;
      v2 = v52;
    }
    while (v36 != v35);
  }
}

- (unsigned)requiredAudioBitrate:(unsigned int)a3 highestAudioBitrates:(id)a4
{
  uint64_t v6 = [a4 count];
  if (v6)
  {
    if (objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "unsignedIntValue") >= a3) {
      LODWORD(v6) = 0;
    }
    else {
      LODWORD(v6) = a3 - objc_msgSend((id)objc_msgSend(a4, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
    }
  }
  return v6;
}

- (void)updateHighestAudioBitrates:(id)a3 bitrate:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  if ([(VCSessionDownlinkBandwidthAllocator *)self requiredAudioBitrate:*(void *)&a4 highestAudioBitrates:a3])
  {
    objc_msgSend(a3, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4), 0);
    [a3 sortUsingSelector:sel_compare_];
  }
}

- (unint64_t)simultaneousTalkers
{
  unint64_t v3 = [(NSMutableArray *)self->_clients count];
  unsigned int v4 = [+[VCDefaults sharedInstance] minParticipantCountSendVoiceActiveOnly];
  unint64_t result = [(NSMutableArray *)self->_clients count];
  unint64_t v6 = (result + 1) >> 1;
  if ((int)v6 >= 4) {
    LODWORD(v6) = 4;
  }
  if (v3 >= v4) {
    return (int)v6;
  }
  return result;
}

- (id)distributeBitrate:(unsigned int)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (self->_forceFullBandwidth) {
    a3 = 2000000;
  }
  if (!a3) {
    return 0;
  }
  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3052000000;
  id v28 = __Block_byref_object_copy__32;
  uint64_t v29 = __Block_byref_object_dispose__32;
  uint64_t v30 = 0;
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke;
  block[3] = &unk_1E6DB6790;
  unsigned int v24 = a3;
  block[4] = self;
  block[5] = &v25;
  dispatch_sync(clientQueue, block);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    unint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v32 = v5;
      __int16 v33 = 2080;
      v34 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]";
      __int16 v35 = 1024;
      int v36 = 310;
      __int16 v37 = 1024;
      LODWORD(v38) = a3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d bitrate=%d, selectedMediaEntries", buf, 0x22u);
    }
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  obuint64_t j = (id)v26[5];
  uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
  if (v7)
  {
    uint64_t v20 = *(void *)v46;
    do
    {
      uint64_t v8 = 0;
      uint64_t v21 = v7;
      do
      {
        if (*(void *)v46 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v45 + 1) + 8 * v8);
        char v10 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@" %@", v9];
        uint64_t v22 = v8;
        uint64_t v11 = (void *)[(id)v26[5] objectForKey:v9];
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v39 count:16];
        if (v12)
        {
          uint64_t v13 = *(void *)v41;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v11);
              }
              [v10 appendFormat:@" [streamGroupID=%s, qualityIndex=%u, maxNetworkBitrate=%u, streamID=%u]", FourccToCStr(objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "streamGroupID")), objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "qualityIndex"), objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "maxNetworkBitrate"), objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * i), "streamID")];
            }
            uint64_t v12 = [v11 countByEnumeratingWithState:&v40 objects:v39 count:16];
          }
          while (v12);
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v15 = VRTraceErrorLogLevelToCSTR();
          v16 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315906;
            uint64_t v32 = v15;
            __int16 v33 = 2080;
            v34 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]";
            __int16 v35 = 1024;
            int v36 = 317;
            __int16 v37 = 2112;
            uint64_t v38 = v10;
            _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d %@", buf, 0x26u);
          }
        }
        ++v8;
      }
      while (v22 + 1 != v21);
      uint64_t v7 = [obj countByEnumeratingWithState:&v45 objects:v44 count:16];
    }
    while (v7);
  }
  uint64_t v17 = (void *)v26[5];
  _Block_object_dispose(&v25, 8);
  return v17;
}

id __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke(uint64_t a1)
{
  uint64_t v182 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) sortMediaEntries];
  uint64_t v2 = [*(id *)(a1 + 32) simultaneousTalkers];
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
      [v3 setObject:&unk_1F3DC5B98 atIndexedSubscript:i];
  }
  v154 = v3;
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      uint64_t v7 = *MEMORY[0x1E4F47A50];
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_2(v6);
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v168 = v6;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 199;
        uint64_t v9 = "VCBandwidth [%s] %s:%d Sorted media entries:";
        char v10 = v7;
        uint32_t v11 = 28;
LABEL_16:
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, v9, buf, v11);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v16 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v168 = v12;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 199;
          __int16 v173 = 2112;
          *(void *)v174 = v5;
          *(_WORD *)&v174[8] = 2048;
          *(void *)&v174[10] = v16;
          _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d %@(%p) Sorted media entries:", buf, 0x30u);
        }
        goto LABEL_21;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v168 = v12;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 199;
        __int16 v173 = 2112;
        *(void *)v174 = v5;
        *(_WORD *)&v174[8] = 2048;
        *(void *)&v174[10] = v15;
        uint64_t v9 = "VCBandwidth [%s] %s:%d %@(%p) Sorted media entries:";
        char v10 = v13;
        uint32_t v11 = 48;
        goto LABEL_16;
      }
    }
  }
LABEL_21:
  long long v180 = 0u;
  long long v181 = 0u;
  long long v178 = 0u;
  long long v179 = 0u;
  uint64_t v17 = *(void **)(*(void *)(a1 + 32) + 48);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v178 objects:v177 count:16];
  if (!v18) {
    goto LABEL_46;
  }
  uint64_t v19 = v18;
  uint64_t v20 = *(void *)v179;
  do
  {
    uint64_t v21 = 0;
    do
    {
      if (*(void *)v179 != v20) {
        objc_enumerationMutation(v17);
      }
      uint64_t v22 = *(void *)(*((void *)&v178 + 1) + 8 * v21);
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_41;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        uint64_t v32 = *MEMORY[0x1E4F47A50];
        __int16 v33 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_41;
          }
          *(_DWORD *)buf = 136315906;
          uint64_t v168 = v31;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 201;
          __int16 v173 = 2112;
          *(void *)v174 = v22;
          id v28 = v32;
          uint64_t v29 = "VCBandwidth [%s] %s:%d %@";
          uint32_t v30 = 38;
          goto LABEL_37;
        }
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v168 = v31;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 201;
          __int16 v173 = 2112;
          *(void *)v174 = v22;
          __int16 v35 = v32;
          int v36 = "VCBandwidth [%s] %s:%d %@";
          uint32_t v37 = 38;
          goto LABEL_44;
        }
      }
      else
      {
        uint32_t v23 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint32_t v23 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v24 = VRTraceErrorLogLevelToCSTR();
          uint64_t v25 = *MEMORY[0x1E4F47A50];
          uint64_t v26 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_41;
            }
            uint64_t v27 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136316418;
            uint64_t v168 = v24;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 201;
            __int16 v173 = 2112;
            *(void *)v174 = v23;
            *(_WORD *)&v174[8] = 2048;
            *(void *)&v174[10] = v27;
            *(_WORD *)&v174[18] = 2112;
            *(void *)&v174[20] = v22;
            id v28 = v25;
            uint64_t v29 = "VCBandwidth [%s] %s:%d %@(%p) %@";
            uint32_t v30 = 58;
LABEL_37:
            _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v29, buf, v30);
            goto LABEL_41;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v34 = *(void *)(a1 + 32);
            *(_DWORD *)buf = 136316418;
            uint64_t v168 = v24;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 201;
            __int16 v173 = 2112;
            *(void *)v174 = v23;
            *(_WORD *)&v174[8] = 2048;
            *(void *)&v174[10] = v34;
            *(_WORD *)&v174[18] = 2112;
            *(void *)&v174[20] = v22;
            __int16 v35 = v25;
            int v36 = "VCBandwidth [%s] %s:%d %@(%p) %@";
            uint32_t v37 = 58;
LABEL_44:
            _os_log_debug_impl(&dword_1E1EA4000, v35, OS_LOG_TYPE_DEBUG, v36, buf, v37);
          }
        }
      }
LABEL_41:
      ++v21;
    }
    while (v19 != v21);
    uint64_t v38 = [v17 countByEnumeratingWithState:&v178 objects:v177 count:16];
    uint64_t v19 = v38;
  }
  while (v38);
LABEL_46:
  int v39 = *(_DWORD *)(a1 + 48);
  v155 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:*(unsigned int *)(*(void *)(a1 + 32) + 16)];
  long long v40 = v154;
  if ((int)[*(id *)(*(void *)(a1 + 32) + 48) count] >= 1)
  {
    uint64_t v41 = 0;
    char v42 = 0;
    while (1)
    {
      long long v43 = (void *)[*(id *)(*(void *)(a1 + 32) + 48) objectAtIndexedSubscript:v41];
      if (!objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")))
      {
        uint64_t v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "setObject:forKeyedSubscript:", v44, objc_msgSend((id)objc_msgSend(v43, "client"), "uuid"));
      }
      if ([v43 type] != 1) {
        break;
      }
      if ([v43 streamGroupID] == 1835623287
        || [v43 streamGroupID] == 1835623282)
      {
        int v45 = objc_msgSend(*(id *)(a1 + 32), "requiredAudioBitrate:highestAudioBitrates:", objc_msgSend(v43, "maxNetworkBitrate"), v40);
        if (!v45)
        {
          int v47 = 0;
          goto LABEL_100;
        }
        int v46 = [v43 isLowestQuality];
        if (v46) {
          int v47 = v45;
        }
        else {
          int v47 = 0;
        }
        if ((v46 | v42))
        {
          v42 |= v46 ^ 1;
LABEL_100:
          v39 -= v45;
          objc_msgSend(*(id *)(a1 + 32), "updateHighestAudioBitrates:bitrate:", v40, objc_msgSend(v43, "maxNetworkBitrate"));
LABEL_121:
          objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")), "setObject:forKeyedSubscript:", v43, objc_msgSend(v43, "streamToken"));
          if (objc_opt_class() == *(void *)(a1 + 32))
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v85 = VRTraceErrorLogLevelToCSTR();
              v86 = *MEMORY[0x1E4F47A50];
              v87 = *MEMORY[0x1E4F47A50];
              if (*MEMORY[0x1E4F47A40])
              {
                if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
                {
                  uint64_t v88 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                  *(_DWORD *)buf = 136316674;
                  uint64_t v168 = v85;
                  __int16 v169 = 2080;
                  v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                  __int16 v171 = 1024;
                  int v172 = 288;
                  __int16 v173 = 1024;
                  *(_DWORD *)v174 = v47;
                  *(_WORD *)&v174[4] = 2112;
                  *(void *)&v174[6] = v88;
                  *(_WORD *)&v174[14] = 2112;
                  *(void *)&v174[16] = v43;
                  *(_WORD *)&v174[24] = 1024;
                  *(_DWORD *)&v174[26] = v39;
                  long long v56 = v86;
                  long long v57 = "VCBandwidth [%s] %s:%d Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                  uint32_t v58 = 60;
                  goto LABEL_136;
                }
              }
              else if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
              {
                uint64_t v100 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                *(_DWORD *)buf = 136316674;
                uint64_t v168 = v85;
                __int16 v169 = 2080;
                v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                __int16 v171 = 1024;
                int v172 = 288;
                __int16 v173 = 1024;
                *(_DWORD *)v174 = v47;
                *(_WORD *)&v174[4] = 2112;
                *(void *)&v174[6] = v100;
                *(_WORD *)&v174[14] = 2112;
                *(void *)&v174[16] = v43;
                *(_WORD *)&v174[24] = 1024;
                *(_DWORD *)&v174[26] = v39;
                v95 = v86;
                v96 = "VCBandwidth [%s] %s:%d Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                uint32_t v97 = 60;
                goto LABEL_145;
              }
            }
          }
          else
          {
            v79 = &stru_1F3D3E450;
            if (objc_opt_respondsToSelector()) {
              v79 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
            }
            if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
              goto LABEL_149;
            }
            uint64_t v80 = VRTraceErrorLogLevelToCSTR();
            long long v81 = *MEMORY[0x1E4F47A50];
            long long v82 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
              {
                uint64_t v83 = *(void *)(a1 + 32);
                uint64_t v84 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
                *(_DWORD *)buf = 136317186;
                uint64_t v168 = v80;
                __int16 v169 = 2080;
                v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
                __int16 v171 = 1024;
                int v172 = 288;
                __int16 v173 = 2112;
                *(void *)v174 = v79;
                *(_WORD *)&v174[8] = 2048;
                *(void *)&v174[10] = v83;
                long long v40 = v154;
                *(_WORD *)&v174[18] = 1024;
                *(_DWORD *)&v174[20] = v47;
                *(_WORD *)&v174[24] = 2112;
                *(void *)&v174[26] = v84;
                *(_WORD *)&v174[34] = 2112;
                *(void *)&v174[36] = v43;
                __int16 v175 = 1024;
                int v176 = v39;
                long long v56 = v81;
                long long v57 = "VCBandwidth [%s] %s:%d %@(%p) Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
                uint32_t v58 = 80;
                goto LABEL_136;
              }
            }
            else if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v93 = *(void *)(a1 + 32);
              uint64_t v94 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
              *(_DWORD *)buf = 136317186;
              uint64_t v168 = v80;
              __int16 v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              __int16 v171 = 1024;
              int v172 = 288;
              __int16 v173 = 2112;
              *(void *)v174 = v79;
              *(_WORD *)&v174[8] = 2048;
              *(void *)&v174[10] = v93;
              long long v40 = v154;
              *(_WORD *)&v174[18] = 1024;
              *(_DWORD *)&v174[20] = v47;
              *(_WORD *)&v174[24] = 2112;
              *(void *)&v174[26] = v94;
              *(_WORD *)&v174[34] = 2112;
              *(void *)&v174[36] = v43;
              __int16 v175 = 1024;
              int v176 = v39;
              v95 = v81;
              v96 = "VCBandwidth [%s] %s:%d %@(%p) Opt in [%d] to client[%@] to upgrade to stream %@ remaining %d";
              uint32_t v97 = 80;
LABEL_145:
              _os_log_debug_impl(&dword_1E1EA4000, v95, OS_LOG_TYPE_DEBUG, v96, buf, v97);
              goto LABEL_149;
            }
          }
          goto LABEL_149;
        }
        int v47 = v45 * [v40 count];
        if (v47 <= v39)
        {
          char v42 = 1;
          goto LABEL_100;
        }
        char v42 = 0;
      }
      else
      {
        int v47 = [v43 maxMediaBitrate];
        int v67 = [v43 isLowestQuality];
        if (v47 <= v39) {
          int v68 = 1;
        }
        else {
          int v68 = v67;
        }
        if (v68) {
          int v69 = v47;
        }
        else {
          int v69 = 0;
        }
        v39 -= v69;
        if (v68) {
          goto LABEL_121;
        }
      }
LABEL_114:
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v89 = VRTraceErrorLogLevelToCSTR();
          v90 = *MEMORY[0x1E4F47A50];
          v91 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v91, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v92 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
              *(_DWORD *)buf = 136316418;
              uint64_t v168 = v89;
              __int16 v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              __int16 v171 = 1024;
              int v172 = 290;
              __int16 v173 = 1024;
              *(_DWORD *)v174 = v39;
              *(_WORD *)&v174[4] = 2112;
              *(void *)&v174[6] = v92;
              *(_WORD *)&v174[14] = 2112;
              *(void *)&v174[16] = v43;
              long long v56 = v90;
              long long v57 = "VCBandwidth [%s] %s:%d Bitrate distribution completed; remaining %d (candidate: %@ %@)";
              uint32_t v58 = 54;
              goto LABEL_136;
            }
          }
          else if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v101 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
            *(_DWORD *)buf = 136316418;
            uint64_t v168 = v89;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 290;
            __int16 v173 = 1024;
            *(_DWORD *)v174 = v39;
            *(_WORD *)&v174[4] = 2112;
            *(void *)&v174[6] = v101;
            *(_WORD *)&v174[14] = 2112;
            *(void *)&v174[16] = v43;
            v95 = v90;
            v96 = "VCBandwidth [%s] %s:%d Bitrate distribution completed; remaining %d (candidate: %@ %@)";
            uint32_t v97 = 54;
            goto LABEL_145;
          }
        }
      }
      else
      {
        uint64_t v73 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint64_t v73 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_149;
        }
        uint64_t v74 = VRTraceErrorLogLevelToCSTR();
        long long v75 = *MEMORY[0x1E4F47A50];
        long long v76 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v77 = *(void *)(a1 + 32);
            uint64_t v78 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
            *(_DWORD *)buf = 136316930;
            uint64_t v168 = v74;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 290;
            __int16 v173 = 2112;
            *(void *)v174 = v73;
            *(_WORD *)&v174[8] = 2048;
            *(void *)&v174[10] = v77;
            long long v40 = v154;
            *(_WORD *)&v174[18] = 1024;
            *(_DWORD *)&v174[20] = v39;
            *(_WORD *)&v174[24] = 2112;
            *(void *)&v174[26] = v78;
            *(_WORD *)&v174[34] = 2112;
            *(void *)&v174[36] = v43;
            long long v56 = v75;
            long long v57 = "VCBandwidth [%s] %s:%d %@(%p) Bitrate distribution completed; remaining %d (candidate: %@ %@)";
            uint32_t v58 = 74;
LABEL_136:
            _os_log_impl(&dword_1E1EA4000, v56, OS_LOG_TYPE_DEFAULT, v57, buf, v58);
          }
        }
        else if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v98 = *(void *)(a1 + 32);
          uint64_t v99 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
          *(_DWORD *)buf = 136316930;
          uint64_t v168 = v74;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 290;
          __int16 v173 = 2112;
          *(void *)v174 = v73;
          *(_WORD *)&v174[8] = 2048;
          *(void *)&v174[10] = v98;
          long long v40 = v154;
          *(_WORD *)&v174[18] = 1024;
          *(_DWORD *)&v174[20] = v39;
          *(_WORD *)&v174[24] = 2112;
          *(void *)&v174[26] = v99;
          *(_WORD *)&v174[34] = 2112;
          *(void *)&v174[36] = v43;
          v95 = v75;
          v96 = "VCBandwidth [%s] %s:%d %@(%p) Bitrate distribution completed; remaining %d (candidate: %@ %@)";
          uint32_t v97 = 74;
          goto LABEL_145;
        }
      }
LABEL_149:
      if (++v41 >= (int)[*(id *)(*(void *)(a1 + 32) + 48) count]) {
        goto LABEL_150;
      }
    }
    if ([v43 type] != 2 && objc_msgSend(v43, "type") != 3) {
      goto LABEL_114;
    }
    uint64_t v48 = [v43 streamToken];
    uint64_t v49 = objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "objectForKeyedSubscript:", objc_msgSend((id)objc_msgSend(v43, "client"), "uuid")), "objectForKeyedSubscript:", v48);
    int v50 = [v43 streamGroupID];
    if ([v43 type] == 2
      && [v155 count] >= (unint64_t)*(unsigned int *)(*(void *)(a1 + 32) + 16)
      && ([v155 containsObject:v48] & 1) == 0
      && v50 != 1935897189)
    {
      if (objc_opt_class() == *(void *)(a1 + 32))
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_149;
        }
        uint64_t v102 = VRTraceErrorLogLevelToCSTR();
        v103 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_149;
        }
        int v104 = *(_DWORD *)(*(void *)(a1 + 32) + 16);
        uint64_t v105 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
        *(_DWORD *)buf = 136316162;
        uint64_t v168 = v102;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 256;
        __int16 v173 = 1024;
        *(_DWORD *)v174 = v104;
        *(_WORD *)&v174[4] = 2112;
        *(void *)&v174[6] = v105;
        long long v56 = v103;
        long long v57 = "VCBandwidth [%s] %s:%d Reached max number of decoder streams (%d). Unable to display video for client:%@";
        uint32_t v58 = 44;
      }
      else
      {
        uint64_t v51 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          uint64_t v51 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_149;
        }
        uint64_t v52 = VRTraceErrorLogLevelToCSTR();
        v53 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_149;
        }
        uint64_t v54 = *(void *)(a1 + 32);
        int v153 = *(_DWORD *)(v54 + 16);
        uint64_t v55 = objc_msgSend((id)objc_msgSend(v43, "client"), "uuid");
        *(_DWORD *)buf = 136316674;
        uint64_t v168 = v52;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 256;
        __int16 v173 = 2112;
        *(void *)v174 = v51;
        *(_WORD *)&v174[8] = 2048;
        *(void *)&v174[10] = v54;
        *(_WORD *)&v174[18] = 1024;
        *(_DWORD *)&v174[20] = v153;
        *(_WORD *)&v174[24] = 2112;
        *(void *)&v174[26] = v55;
        long long v56 = v53;
        long long v57 = "VCBandwidth [%s] %s:%d %@(%p) Reached max number of decoder streams (%d). Unable to display video for client:%@";
        uint32_t v58 = 64;
      }
      goto LABEL_136;
    }
    int v59 = [v43 maxNetworkBitrate];
    int v47 = v59 - [v49 maxNetworkBitrate];
    if (v50 <= 1717854579)
    {
      if (v50 != 1650745716 && v50 != 1667329381)
      {
        int v60 = 1667329399;
        goto LABEL_78;
      }
      goto LABEL_79;
    }
    if (v50 == 1717854580 || v50 == 1935897189) {
      goto LABEL_79;
    }
    int v60 = 1718909044;
LABEL_78:
    if (v50 == v60)
    {
LABEL_79:
      if ([v43 isLowestQuality])
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v61 = VRTraceErrorLogLevelToCSTR();
          __int16 v62 = *MEMORY[0x1E4F47A50];
          v63 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40])
          {
            if (os_log_type_enabled(v63, OS_LOG_TYPE_DEFAULT))
            {
              int v64 = [v43 qualityIndex];
              *(_DWORD *)buf = 136316418;
              uint64_t v168 = v61;
              __int16 v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              __int16 v171 = 1024;
              int v172 = 266;
              __int16 v173 = 1024;
              *(_DWORD *)v174 = v64;
              *(_WORD *)&v174[4] = 1024;
              *(_DWORD *)&v174[6] = v39;
              *(_WORD *)&v174[10] = 1024;
              *(_DWORD *)&v174[12] = v47;
              _os_log_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d Always opt into Video Stream with Quality Index:%d availableBitrate %d requiredBitrate %d", buf, 0x2Eu);
            }
          }
          else if (os_log_type_enabled(v63, OS_LOG_TYPE_DEBUG))
          {
            int v106 = [v43 qualityIndex];
            *(_DWORD *)buf = 136316418;
            uint64_t v168 = v61;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 266;
            __int16 v173 = 1024;
            *(_DWORD *)v174 = v106;
            *(_WORD *)&v174[4] = 1024;
            *(_DWORD *)&v174[6] = v39;
            *(_WORD *)&v174[10] = 1024;
            *(_DWORD *)&v174[12] = v47;
            _os_log_debug_impl(&dword_1E1EA4000, v62, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d Always opt into Video Stream with Quality Index:%d availableBitrate %d requiredBitrate %d", buf, 0x2Eu);
          }
        }
        BOOL v70 = __OFSUB__(v39, v47);
        v39 -= v47;
        if (v39 < 0 != v70)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
          {
            uint64_t v71 = VRTraceErrorLogLevelToCSTR();
            __int16 v72 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315650;
              uint64_t v168 = v71;
              __int16 v169 = 2080;
              v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
              __int16 v171 = 1024;
              int v172 = 269;
              _os_log_impl(&dword_1E1EA4000, v72, OS_LOG_TYPE_DEFAULT, "VCBandwidth [%s] %s:%d We do not have available bandwidth to support the lowest quality video stream, but we are forcing it on anyways.", buf, 0x1Cu);
            }
          }
          int v39 = 0;
        }
        BOOL v65 = 0;
LABEL_110:
        if ([v43 type] == 2
          && ((v65 | objc_msgSend(v155, "containsObject:", objc_msgSend(v43, "streamToken"))) & 1) == 0)
        {
          objc_msgSend(v155, "addObject:", objc_msgSend(v43, "streamToken"));
        }
        char v42 = 0;
        if (!v65) {
          goto LABEL_121;
        }
        goto LABEL_114;
      }
    }
    BOOL v65 = v39 < v47;
    if (v39 >= v47) {
      int v66 = v47;
    }
    else {
      int v66 = 0;
    }
    v39 -= v66;
    goto LABEL_110;
  }
LABEL_150:

  [*(id *)(*(void *)(a1 + 32) + 40) removeAllObjects];
  long long v165 = 0u;
  long long v166 = 0u;
  long long v163 = 0u;
  long long v164 = 0u;
  v107 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v108 = [v107 countByEnumeratingWithState:&v163 objects:v162 count:16];
  if (v108)
  {
    uint64_t v109 = v108;
    uint64_t v110 = *(void *)v164;
    do
    {
      for (uint64_t j = 0; j != v109; ++j)
      {
        if (*(void *)v164 != v110) {
          objc_enumerationMutation(v107);
        }
        objc_msgSend(*(id *)(a1 + 32), "updateSelectedMediaEntriesForClientWithUUID:", objc_msgSend(*(id *)(*((void *)&v163 + 1) + 8 * j), "uuid"));
      }
      uint64_t v109 = [v107 countByEnumeratingWithState:&v163 objects:v162 count:16];
    }
    while (v109);
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    v112 = &selRef_isInputAvailable;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v114 = VRTraceErrorLogLevelToCSTR();
      v115 = *MEMORY[0x1E4F47A50];
      v116 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          uint64_t v168 = v114;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 303;
          v117 = "VCBandwidth [%s] %s:%d Allocated media entries for clients:";
          v118 = v115;
          uint32_t v119 = 28;
          goto LABEL_169;
        }
      }
      else if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
      {
        __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_1(v114);
      }
    }
  }
  else
  {
    v112 = &selRef_isInputAvailable;
    if (objc_opt_respondsToSelector()) {
      v113 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      v113 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v120 = VRTraceErrorLogLevelToCSTR();
      v121 = *MEMORY[0x1E4F47A50];
      v122 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v123 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 136316162;
          uint64_t v168 = v120;
          __int16 v169 = 2080;
          v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
          __int16 v171 = 1024;
          int v172 = 303;
          __int16 v173 = 2112;
          *(void *)v174 = v113;
          *(_WORD *)&v174[8] = 2048;
          *(void *)&v174[10] = v123;
          v117 = "VCBandwidth [%s] %s:%d %@(%p) Allocated media entries for clients:";
          v118 = v121;
          uint32_t v119 = 48;
LABEL_169:
          _os_log_impl(&dword_1E1EA4000, v118, OS_LOG_TYPE_DEFAULT, v117, buf, v119);
        }
      }
      else if (os_log_type_enabled(v122, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v124 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136316162;
        uint64_t v168 = v120;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 303;
        __int16 v173 = 2112;
        *(void *)v174 = v113;
        *(_WORD *)&v174[8] = 2048;
        *(void *)&v174[10] = v124;
        _os_log_debug_impl(&dword_1E1EA4000, v121, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d %@(%p) Allocated media entries for clients:", buf, 0x30u);
      }
    }
  }
  long long v160 = 0u;
  long long v161 = 0u;
  long long v158 = 0u;
  long long v159 = 0u;
  v125 = (void *)[*(id *)(*(void *)(a1 + 32) + 8) allKeys];
  uint64_t v126 = [v125 countByEnumeratingWithState:&v158 objects:v157 count:16];
  if (!v126) {
    goto LABEL_199;
  }
  uint64_t v127 = v126;
  uint64_t v128 = *(void *)v159;
  v156 = v125;
  while (2)
  {
    uint64_t v129 = 0;
    v130 = v112[417];
    while (2)
    {
      if (*(void *)v159 != v128) {
        objc_enumerationMutation(v125);
      }
      uint64_t v131 = *(void *)(*((void *)&v158 + 1) + 8 * v129);
      if (objc_opt_class() != *(void *)(a1 + 32))
      {
        v132 = &stru_1F3D3E450;
        if (objc_opt_respondsToSelector()) {
          v132 = (__CFString *)[*(id *)(a1 + 32) performSelector:v130];
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
          goto LABEL_194;
        }
        uint64_t v133 = VRTraceErrorLogLevelToCSTR();
        v134 = *MEMORY[0x1E4F47A50];
        v135 = *MEMORY[0x1E4F47A50];
        if (*MEMORY[0x1E4F47A40])
        {
          if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v136 = *(void *)(a1 + 32);
            uint64_t v137 = [*(id *)(v136 + 8) objectForKeyedSubscript:v131];
            *(_DWORD *)buf = 136316674;
            uint64_t v168 = v133;
            __int16 v169 = 2080;
            v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
            __int16 v171 = 1024;
            int v172 = 305;
            __int16 v173 = 2112;
            *(void *)v174 = v132;
            *(_WORD *)&v174[8] = 2048;
            *(void *)&v174[10] = v136;
            v125 = v156;
            *(_WORD *)&v174[18] = 2112;
            *(void *)&v174[20] = v131;
            *(_WORD *)&v174[28] = 2112;
            *(void *)&v174[30] = v137;
            v138 = v134;
            v139 = "VCBandwidth [%s] %s:%d %@(%p) %@: %@";
            uint32_t v140 = 68;
            goto LABEL_190;
          }
          goto LABEL_194;
        }
        if (!os_log_type_enabled(v135, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_194;
        }
        uint64_t v145 = *(void *)(a1 + 32);
        uint64_t v146 = [*(id *)(v145 + 8) objectForKeyedSubscript:v131];
        *(_DWORD *)buf = 136316674;
        uint64_t v168 = v133;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 305;
        __int16 v173 = 2112;
        *(void *)v174 = v132;
        *(_WORD *)&v174[8] = 2048;
        *(void *)&v174[10] = v145;
        v125 = v156;
        *(_WORD *)&v174[18] = 2112;
        *(void *)&v174[20] = v131;
        *(_WORD *)&v174[28] = 2112;
        *(void *)&v174[30] = v146;
        v147 = v134;
        v148 = "VCBandwidth [%s] %s:%d %@(%p) %@: %@";
        uint32_t v149 = 68;
LABEL_197:
        _os_log_debug_impl(&dword_1E1EA4000, v147, OS_LOG_TYPE_DEBUG, v148, buf, v149);
        goto LABEL_194;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_194;
      }
      uint64_t v141 = VRTraceErrorLogLevelToCSTR();
      v142 = *MEMORY[0x1E4F47A50];
      v143 = *MEMORY[0x1E4F47A50];
      if (!*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v143, OS_LOG_TYPE_DEBUG)) {
          goto LABEL_194;
        }
        uint64_t v150 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v131];
        *(_DWORD *)buf = 136316162;
        uint64_t v168 = v141;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 305;
        __int16 v173 = 2112;
        *(void *)v174 = v131;
        *(_WORD *)&v174[8] = 2112;
        *(void *)&v174[10] = v150;
        v147 = v142;
        v148 = "VCBandwidth [%s] %s:%d %@: %@";
        uint32_t v149 = 48;
        goto LABEL_197;
      }
      if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v144 = [*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v131];
        *(_DWORD *)buf = 136316162;
        uint64_t v168 = v141;
        __int16 v169 = 2080;
        v170 = "-[VCSessionDownlinkBandwidthAllocator distributeBitrate:]_block_invoke";
        __int16 v171 = 1024;
        int v172 = 305;
        __int16 v173 = 2112;
        *(void *)v174 = v131;
        *(_WORD *)&v174[8] = 2112;
        *(void *)&v174[10] = v144;
        v138 = v142;
        v139 = "VCBandwidth [%s] %s:%d %@: %@";
        uint32_t v140 = 48;
LABEL_190:
        _os_log_impl(&dword_1E1EA4000, v138, OS_LOG_TYPE_DEFAULT, v139, buf, v140);
      }
LABEL_194:
      if (v127 != ++v129) {
        continue;
      }
      break;
    }
    uint64_t v151 = [v125 countByEnumeratingWithState:&v158 objects:v157 count:16];
    uint64_t v127 = v151;
    v112 = &selRef_isInputAvailable;
    if (v151) {
      continue;
    }
    break;
  }
LABEL_199:
  id result = (id)[*(id *)(*(void *)(a1 + 32) + 40) copy];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)updateSelectedMediaEntriesForClientWithUUID:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:2];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_allocatedMediaEntriesForClients, "objectForKeyedSubscript:", a3), "allValues");
  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
  if (!v7) {
    goto LABEL_11;
  }
  uint64_t v8 = v7;
  uint64_t v9 = 0;
  uint64_t v10 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v27 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v12 type] == 1) {
        uint64_t v9 = v12;
      }
      [v5 addObject:v12];
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v26 objects:v25 count:16];
  }
  while (v8);
  if (!v9)
  {
LABEL_11:
    if ((VCSessionDownlinkBandwidthAllocator *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        uint64_t v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v21 = 136315906;
          *(void *)&v21[4] = v14;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[VCSessionDownlinkBandwidthAllocator updateSelectedMediaEntriesForClientWithUUID:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 334;
          WORD2(v22) = 2112;
          *(void *)((char *)&v22 + 6) = a3;
          uint64_t v16 = "VCBandwidth [%s] %s:%d No audio entry for client=%@";
          uint64_t v17 = v15;
          uint32_t v18 = 38;
LABEL_21:
          _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, v21, v18);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v13 = (__CFString *)[(VCSessionDownlinkBandwidthAllocator *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)uint64_t v21 = 136316418;
          *(void *)&v21[4] = v19;
          *(_WORD *)&v21[12] = 2080;
          *(void *)&v21[14] = "-[VCSessionDownlinkBandwidthAllocator updateSelectedMediaEntriesForClientWithUUID:]";
          *(_WORD *)&v21[22] = 1024;
          LODWORD(v22) = 334;
          WORD2(v22) = 2112;
          *(void *)((char *)&v22 + 6) = v13;
          HIWORD(v22) = 2048;
          uint32_t v23 = self;
          LOWORD(v24) = 2112;
          *(void *)((char *)&v24 + 2) = a3;
          uint64_t v16 = "VCBandwidth [%s] %s:%d %@(%p) No audio entry for client=%@";
          uint64_t v17 = v20;
          uint32_t v18 = 58;
          goto LABEL_21;
        }
      }
    }
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_selectedMediaEntriesForClients, "setObject:forKeyedSubscript:", v5, a3, *(_OWORD *)v21, *(void *)&v21[16], v22, v23, v24);
}

- (void)reset
{
  [(NSMutableArray *)self->_sortedMediaEntries removeAllObjects];
  [(NSMutableDictionary *)self->_allocatedMediaEntriesForClients removeAllObjects];
  selectedMediaEntriesForClients = self->_selectedMediaEntriesForClients;

  [(NSMutableDictionary *)selectedMediaEntriesForClients removeAllObjects];
}

- (void)registerForBandwidthAllocationWithClient:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__VCSessionDownlinkBandwidthAllocator_registerForBandwidthAllocationWithClient___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __80__VCSessionDownlinkBandwidthAllocator_registerForBandwidthAllocationWithClient___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  if ((result & 1) == 0)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 reset];
  }
  return result;
}

- (void)reportingSessionParticipantEventBitrateChanged:(id)a3 optedInNetworkBitrate:(unsigned int)a4 actualNetworkBitrate:(unsigned int)a5 optedInStreamID:(id)a6 actualStreamID:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  uint64_t v10 = *(void *)&a4;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  CFDictionaryAddValue(Mutable, @"VCSPUUID", a3);
  CFDictionaryAddValue(Mutable, @"VCSPActualBitrate", (const void *)[NSNumber numberWithUnsignedInt:v9]);
  CFDictionaryAddValue(Mutable, @"VCSPOptedInBitrate", (const void *)[NSNumber numberWithUnsignedInt:v10]);
  if (a7) {
    id v13 = a7;
  }
  else {
    id v13 = &unk_1F3DC5B98;
  }
  CFDictionaryAddValue(Mutable, @"VCSPActiveStreamID", v13);
  if (a6) {
    id v14 = a6;
  }
  else {
    id v14 = &unk_1F3DC5B98;
  }
  CFDictionaryAddValue(Mutable, @"VCSPOptedInStreamID", v14);
  reportingGenericEvent();
  if (Mutable)
  {
    CFRelease(Mutable);
  }
}

- (void)deregisterForBandwidthAllocationWithClient:(id)a3
{
  void block[6] = *MEMORY[0x1E4F143B8];
  clientQueue = self->_clientQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82__VCSessionDownlinkBandwidthAllocator_deregisterForBandwidthAllocationWithClient___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(clientQueue, block);
}

uint64_t __82__VCSessionDownlinkBandwidthAllocator_deregisterForBandwidthAllocationWithClient___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 32) containsObject:*(void *)(a1 + 40)];
  if (result)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) removeObject:*(void *)(a1 + 40)];
    unint64_t v3 = *(void **)(a1 + 32);
    return [v3 reset];
  }
  return result;
}

- (void)client:(id)a3 didActualNetworkBitrateChangeForStreamGroupID:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v7 = [a3 optedInStreamIDForStreamGroupID:*(void *)&a4];
  uint64_t v8 = [a3 activeDownlinkStreamIDForStreamGroupID:v4];
  uint64_t v9 = [a3 actualNetworkBitrateForStreamGroup:v4];
  uint64_t v10 = [a3 optedInNetworkBitrateForStreamGroup:v4];
  uint64_t v11 = [a3 uuid];

  [(VCSessionDownlinkBandwidthAllocator *)self reportingSessionParticipantEventBitrateChanged:v11 optedInNetworkBitrate:v10 actualNetworkBitrate:v9 optedInStreamID:v7 actualStreamID:v8];
}

- (BOOL)forceFullBandwidth
{
  return self->_forceFullBandwidth;
}

- (void)setForceFullBandwidth:(BOOL)a3
{
  self->_forceFullBandwidth = a3;
}

void __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 303;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d Allocated media entries for clients:", (uint8_t *)&v2, 0x1Cu);
}

void __57__VCSessionDownlinkBandwidthAllocator_distributeBitrate___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 199;
  _os_log_debug_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_DEBUG, "VCBandwidth [%s] %s:%d Sorted media entries:", (uint8_t *)&v2, 0x1Cu);
}

@end