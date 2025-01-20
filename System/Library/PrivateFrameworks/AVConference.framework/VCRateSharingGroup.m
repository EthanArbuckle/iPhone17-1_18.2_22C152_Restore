@interface VCRateSharingGroup
- (BOOL)createMediaQueue;
- (BOOL)deregisterRateSharingClient:(id)a3;
- (BOOL)registerRateSharingClient:(id)a3 forInterfaceType:(unsigned int)a4;
- (VCRateSharingGroup)init;
- (VCRateSharingGroup)initWithIdentifier:(id)a3;
- (tagVCMediaQueue)mediaQueue;
- (unsigned)calculateMaxTargetBitrate;
- (unsigned)countRateControllersForInterfaceType:(id)a3;
- (unsigned)maxBitrate;
- (void)createMediaQueue;
- (void)dealloc;
- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5;
- (void)setTargetBitrate:(unsigned int)a3 fromRateSharingClient:(id)a4;
- (void)setVCMediaQueuePeakBitrateAndMaxTargetBitrate:(unsigned int)a3;
- (void)updateShareProfileForInterfaceType:(id)a3;
@end

@implementation VCRateSharingGroup

- (VCRateSharingGroup)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCRateSharingGroup;
  v2 = [(VCObject *)&v7 init];
  if (v2)
  {
    v2->_rateSharingClientMap = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_shareProfileDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v2->_rateSharingClientTargetBitrateDict = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v3 = objc_alloc_init(VCRateControlShareProfile);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_shareProfileDictionary, "setObject:forKeyedSubscript:", v3, [NSNumber numberWithUnsignedInt:0]);
    v4 = objc_alloc_init(VCRateControlShareProfile);
    -[NSMutableDictionary setObject:forKeyedSubscript:](v2->_shareProfileDictionary, "setObject:forKeyedSubscript:", v4, [NSNumber numberWithUnsignedInt:1]);
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v2->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCRateSharingGroup.delegateQueue", 0, CustomRootQueue);
  }
  return v2;
}

- (VCRateSharingGroup)initWithIdentifier:(id)a3
{
  v3 = self;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v3 = [(VCRateSharingGroup *)self init];
    if (v3)
    {
      v3->_mediaQueueIdentifier = (NSString *)[a3 copy];
      if (![(VCRateSharingGroup *)v3 createMediaQueue])
      {
        VCMediaQueue_SetOneToOne((uint64_t)v3->_mediaQueue, 1);
        VCMediaQueue_Start((uint64_t)v3->_mediaQueue);
        return v3;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    objc_super v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      uint64_t v9 = v6;
      __int16 v10 = 2080;
      v11 = "-[VCRateSharingGroup initWithIdentifier:]";
      __int16 v12 = 1024;
      int v13 = 63;
      _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Sharing group init failed due to nil identifier", (uint8_t *)&v8, 0x1Cu);
    }
  }

  return 0;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];

  delegateQueue = self->_delegateQueue;
  if (delegateQueue)
  {
    dispatch_release(delegateQueue);
    self->_delegateQueue = 0;
  }
  VCMediaQueue_Stop((uint64_t)self->_mediaQueue);
  mediaQueue = self->_mediaQueue;
  if (mediaQueue) {
    CFRelease(mediaQueue);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCRateSharingGroup;
  [(VCObject *)&v5 dealloc];
}

- (void)setVCMediaQueuePeakBitrateAndMaxTargetBitrate:(unsigned int)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (self->_maxBitrate < a3)
  {
    if (!VCMediaQueue_SetPeakBitrate(self->_mediaQueue, a3))
    {
      self->_unsigned int maxBitrate = a3;
      return;
    }
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        objc_super v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          mediaQueue = self->_mediaQueue;
          unsigned int maxBitrate = self->_maxBitrate;
          int v17 = 136316162;
          uint64_t v18 = v6;
          __int16 v19 = 2080;
          v20 = "-[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:]";
          __int16 v21 = 1024;
          int v22 = 94;
          __int16 v23 = 2048;
          v24 = mediaQueue;
          __int16 v25 = 1024;
          LODWORD(v26) = maxBitrate;
          __int16 v10 = " [%s] %s:%d Peak bitrate set for mediaQueue=%p failed and _maxbitrate=%d did not change";
          v11 = v7;
          uint32_t v12 = 44;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v17, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v5 = (__CFString *)[(VCRateSharingGroup *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v15 = self->_mediaQueue;
          unsigned int v16 = self->_maxBitrate;
          int v17 = 136316674;
          uint64_t v18 = v13;
          __int16 v19 = 2080;
          v20 = "-[VCRateSharingGroup setVCMediaQueuePeakBitrateAndMaxTargetBitrate:]";
          __int16 v21 = 1024;
          int v22 = 94;
          __int16 v23 = 2112;
          v24 = v5;
          __int16 v25 = 2048;
          v26 = self;
          __int16 v27 = 2048;
          v28 = v15;
          __int16 v29 = 1024;
          unsigned int v30 = v16;
          __int16 v10 = " [%s] %s:%d %@(%p) Peak bitrate set for mediaQueue=%p failed and _maxbitrate=%d did not change";
          v11 = v14;
          uint32_t v12 = 64;
          goto LABEL_14;
        }
      }
    }
  }
}

- (void)setTargetBitrate:(unsigned int)a3 fromRateSharingClient:(id)a4
{
  if (a4)
  {
    uint64_t v5 = *(void *)&a3;
    [(VCObject *)self lock];
    uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a4);
    -[NSMutableDictionary setObject:forKey:](self->_rateSharingClientTargetBitrateDict, "setObject:forKey:", [NSNumber numberWithInt:v5], v7);
    if (self->_maxBitrate != v5) {
      [(VCRateSharingGroup *)self setVCMediaQueuePeakBitrateAndMaxTargetBitrate:[(VCRateSharingGroup *)self calculateMaxTargetBitrate]];
    }
    [(VCObject *)self unlock];
  }
}

- (BOOL)createMediaQueue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 170, sizeof(v11));
  long long v7 = xmmword_1E259C160;
  long long v8 = unk_1E259C170;
  long long v9 = xmmword_1E259C180;
  long long v10 = unk_1E259C190;
  *(void *)&v11[24] = [(NSString *)self->_mediaQueueIdentifier UTF8String];
  v11[32] = [+[VCDefaults sharedInstance] mediaQueueDumpEnabled];
  v5[4] = *(_OWORD *)v11;
  v5[5] = *(_OWORD *)&v11[16];
  v5[6] = *(_OWORD *)&v11[32];
  uint64_t v6 = *(void *)&v11[48];
  v5[0] = v7;
  v5[1] = v8;
  v5[2] = v9;
  v5[3] = v10;
  int v3 = VCMediaQueue_Create((unint64_t *)&self->_mediaQueue, (unsigned int *)v5);
  if (v3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCRateSharingGroup createMediaQueue]();
      }
    }
  }
  else
  {
    VCMediaQueue_SetMediaQueueSizeThresholdExceededBlock((uint64_t)self->_mediaQueue, (uint64_t)self, &__block_literal_global_8);
  }
  return v3 != 0;
}

uint64_t __38__VCRateSharingGroup_createMediaQueue__block_invoke(uint64_t a1, void *a2)
{
  if (a2) {
    return objc_msgSend(a2, "handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:");
  }
  return result;
}

- (void)handleMediaQueueSizeExceedThresholdWithQueueSize:(double)a3 mediaQueueStreamId:(unsigned int)a4 type:(int)a5
{
  v36[2] = *MEMORY[0x1E4F143B8];
  long long v9 = (VCRateSharingGroup *)objc_opt_class();
  if (a5 == 1)
  {
    if (v9 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      uint64_t v13 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v26 = 136316162;
      uint64_t v27 = v12;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      __int16 v30 = 1024;
      int v31 = 140;
      __int16 v32 = 1024;
      *(_DWORD *)v33 = a4;
      *(_WORD *)&v33[4] = 2048;
      *(double *)&v33[6] = a3;
      uint64_t v14 = " [%s] %s:%d VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v15 = v13;
      uint32_t v16 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v10 = (__CFString *)[(VCRateSharingGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_19;
      }
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      __int16 v23 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v26 = 136316674;
      uint64_t v27 = v22;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      __int16 v30 = 1024;
      int v31 = 140;
      __int16 v32 = 2112;
      *(void *)v33 = v10;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = self;
      *(_WORD *)&v33[18] = 1024;
      unsigned int v34 = a4;
      __int16 v35 = 2048;
      *(double *)v36 = a3;
      uint64_t v14 = " [%s] %s:%d %@(%p) VCMediaQueue size threshold exceeded for mediaQueueStreamId=%u queueSizeInSecond=%f - FLUSHING!";
      v15 = v23;
      uint32_t v16 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, v14, (uint8_t *)&v26, v16);
LABEL_19:
    VCMediaQueue_FlushPacketsInStream((uint64_t)self->_mediaQueue, a4, 1u);
    return;
  }
  if (v9 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v17 = VRTraceErrorLogLevelToCSTR();
    uint64_t v18 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    int v26 = 136316418;
    uint64_t v27 = v17;
    __int16 v28 = 2080;
    __int16 v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
    __int16 v30 = 1024;
    int v31 = 144;
    __int16 v32 = 1024;
    *(_DWORD *)v33 = a5;
    *(_WORD *)&v33[4] = 1024;
    *(_DWORD *)&v33[6] = a4;
    *(_WORD *)&v33[10] = 2048;
    *(double *)&v33[12] = a3;
    __int16 v19 = " [%s] %s:%d Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
    v20 = v18;
    uint32_t v21 = 50;
LABEL_25:
    _os_log_error_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v26, v21);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    v11 = (__CFString *)[(VCRateSharingGroup *)self performSelector:sel_logPrefix];
  }
  else {
    v11 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    __int16 v25 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v26 = 136316930;
      uint64_t v27 = v24;
      __int16 v28 = 2080;
      __int16 v29 = "-[VCRateSharingGroup handleMediaQueueSizeExceedThresholdWithQueueSize:mediaQueueStreamId:type:]";
      __int16 v30 = 1024;
      int v31 = 144;
      __int16 v32 = 2112;
      *(void *)v33 = v11;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = self;
      *(_WORD *)&v33[18] = 1024;
      unsigned int v34 = a5;
      __int16 v35 = 1024;
      LODWORD(v36[0]) = a4;
      WORD2(v36[0]) = 2048;
      *(double *)((char *)v36 + 6) = a3;
      __int16 v19 = " [%s] %s:%d %@(%p) Should not handle media queue threshold exceeded with type=%d for mediaQueueStreamId=%u queueSize=%f!";
      v20 = v25;
      uint32_t v21 = 70;
      goto LABEL_25;
    }
  }
}

- (BOOL)registerRateSharingClient:(id)a3 forInterfaceType:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a4 >= 2)
  {
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateSharingGroup registerRateSharingClient:forInterfaceType:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v7 = (__CFString *)[(VCRateSharingGroup *)self performSelector:sel_logPrefix];
      }
      else {
        long long v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        uint64_t v12 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v15 = v11;
          __int16 v16 = 2080;
          uint64_t v17 = "-[VCRateSharingGroup registerRateSharingClient:forInterfaceType:]";
          __int16 v18 = 1024;
          int v19 = 151;
          __int16 v20 = 2112;
          id v21 = v7;
          __int16 v22 = 2048;
          __int16 v23 = self;
          __int16 v24 = 1024;
          int v25 = v4;
          _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Registering with an invalid interface type=%u", buf, 0x36u);
        }
      }
    }
  }
  else
  {
    [(VCObject *)self lock];
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedInt:v4]))
    {
      objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", v4)), "addObject:", a3);
    }
    else
    {
      uint64_t v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", a3, 0);
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_rateSharingClientMap, "setObject:forKeyedSubscript:", v8, [NSNumber numberWithUnsignedInt:v4]);
    }
    -[VCRateSharingGroup updateShareProfileForInterfaceType:](self, "updateShareProfileForInterfaceType:", [NSNumber numberWithUnsignedInt:v4]);
    [(VCObject *)self unlock];
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      long long v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v9;
        __int16 v16 = 2080;
        uint64_t v17 = "-[VCRateSharingGroup registerRateSharingClient:forInterfaceType:]";
        __int16 v18 = 1024;
        int v19 = 163;
        __int16 v20 = 2048;
        id v21 = a3;
        __int16 v22 = 1024;
        LODWORD(v23) = v4;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Registered rateSharingClient=%p for interface type=%u", buf, 0x2Cu);
      }
    }
  }
  return v4 < 2;
}

- (void)updateShareProfileForInterfaceType:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v5 = -[VCRateSharingGroup countRateControllersForInterfaceType:](self, "countRateControllersForInterfaceType:");
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_shareProfileDictionary objectForKeyedSubscript:a3];
  long long v7 = v6;
  if (v5 <= 1) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = v5;
  }
  [v6 setRateSharingCount:v8];
  [v7 setReservedBitrate:0];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v9 = (void *)[(NSMutableDictionary *)self->_rateSharingClientMap objectForKeyedSubscript:a3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * v13);
        delegateQueue = self->_delegateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__VCRateSharingGroup_updateShareProfileForInterfaceType___block_invoke;
        block[3] = &unk_1E6DB43D8;
        block[4] = v14;
        block[5] = self;
        block[6] = a3;
        dispatch_async(delegateQueue, block);
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v17 count:16];
    }
    while (v11);
  }
}

uint64_t __57__VCRateSharingGroup_updateShareProfileForInterfaceType___block_invoke(void *a1)
{
  v1 = (void *)a1[4];
  id v2 = (id)objc_msgSend((id)objc_msgSend(*(id *)(a1[5] + 168), "objectForKeyedSubscript:", a1[6]), "copy");

  return [v1 setShareProfile:v2];
}

- (unsigned)countRateControllersForInterfaceType:(id)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:");
  if (v5) {
    LODWORD(v5) = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", a3), "count");
  }
  return v5;
}

- (unsigned)calculateMaxTargetBitrate
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  rateSharingClientTargetBitrateDict = self->_rateSharingClientTargetBitrateDict;
  uint64_t v4 = [(NSMutableDictionary *)rateSharingClientTargetBitrateDict countByEnumeratingWithState:&v12 objects:v11 count:16];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  unsigned int v6 = 0;
  uint64_t v7 = *(void *)v13;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v13 != v7) {
        objc_enumerationMutation(rateSharingClientTargetBitrateDict);
      }
      unsigned int v9 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientTargetBitrateDict, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i)), "intValue");
      if (v6 <= v9) {
        unsigned int v6 = v9;
      }
    }
    uint64_t v5 = [(NSMutableDictionary *)rateSharingClientTargetBitrateDict countByEnumeratingWithState:&v12 objects:v11 count:16];
  }
  while (v5);
  return v6;
}

- (BOOL)deregisterRateSharingClient:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(VCObject *)self lock];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obj = self->_rateSharingClientMap;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (!v5) {
    goto LABEL_17;
  }
  uint64_t v6 = v5;
  char v7 = 0;
  uint64_t v8 = *(void *)v36;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v36 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
      if (objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", v10), "containsObject:", a3))
      {
        uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%p", a3);
        int v12 = objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientTargetBitrateDict, "objectForKeyedSubscript:", v11), "intValue");
        [(NSMutableDictionary *)self->_rateSharingClientTargetBitrateDict removeObjectForKey:v11];
        objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_rateSharingClientMap, "objectForKeyedSubscript:", v10), "removeObject:", a3);
        if (v12 == self->_maxBitrate) {
          [(VCRateSharingGroup *)self setVCMediaQueuePeakBitrateAndMaxTargetBitrate:[(VCRateSharingGroup *)self calculateMaxTargetBitrate]];
        }
        [(VCRateSharingGroup *)self updateShareProfileForInterfaceType:v10];
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          long long v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v15 = [v10 unsignedIntValue];
            *(_DWORD *)buf = 136316162;
            uint64_t v23 = v13;
            __int16 v24 = 2080;
            int v25 = "-[VCRateSharingGroup deregisterRateSharingClient:]";
            __int16 v26 = 1024;
            int v27 = 215;
            __int16 v28 = 2048;
            id v29 = a3;
            __int16 v30 = 1024;
            LODWORD(v31) = v15;
            _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d De-registered rateSharingClient=%p for interface type=%u", buf, 0x2Cu);
          }
        }
        char v7 = 1;
      }
    }
    uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v35 objects:v34 count:16];
  }
  while (v6);
  if (v7)
  {
    BOOL v16 = 1;
  }
  else
  {
LABEL_17:
    if ((VCRateSharingGroup *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCRateSharingGroup deregisterRateSharingClient:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v17 = (__CFString *)[(VCRateSharingGroup *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v17 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        long long v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v18;
          __int16 v24 = 2080;
          int v25 = "-[VCRateSharingGroup deregisterRateSharingClient:]";
          __int16 v26 = 1024;
          int v27 = 219;
          __int16 v28 = 2112;
          id v29 = v17;
          __int16 v30 = 2048;
          int v31 = self;
          __int16 v32 = 2048;
          id v33 = a3;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) De-registering an unregistered rateSharingClient=%p", buf, 0x3Au);
        }
      }
    }
    BOOL v16 = 0;
  }
  [(VCObject *)self unlock];
  return v16;
}

- (tagVCMediaQueue)mediaQueue
{
  return self->_mediaQueue;
}

- (unsigned)maxBitrate
{
  return self->_maxBitrate;
}

- (void)createMediaQueue
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaQueue failed for VCRateSharingGroup=%p", v2, v3, v4, v5);
}

- (void)registerRateSharingClient:forInterfaceType:.cold.1()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v4 = 151;
  __int16 v5 = v0;
  int v6 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Registering with an invalid interface type=%u", v3, 0x22u);
}

- (void)deregisterRateSharingClient:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d De-registering an unregistered rateSharingClient=%p", v2, v3, v4, v5);
}

@end