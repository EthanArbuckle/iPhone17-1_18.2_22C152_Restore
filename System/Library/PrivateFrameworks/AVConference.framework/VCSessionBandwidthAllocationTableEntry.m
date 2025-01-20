@interface VCSessionBandwidthAllocationTableEntry
+ (int64_t)compareAudioEntry:(id)a3 audioEntry:(id)a4;
+ (int64_t)compareAudioEntry:(id)a3 videoEntry:(id)a4;
+ (int64_t)compareVideoEntry:(id)a3 videoEntry:(id)a4;
+ (unsigned)entryTypeForMediaType:(unsigned int)a3;
- (BOOL)hasRepairStreamID;
- (BOOL)isLowestQuality;
- (BOOL)isStartOnDemand;
- (BOOL)isSubscribedTo;
- (NSNumber)streamToken;
- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 minNetworkBitrate:(unsigned int)a6 maxNetworkBitrate:(unsigned int)a7 mediaBitrate:(unsigned int)a8 qualityIndex:(unsigned int)a9 streamID:(unsigned int)a10 hasRepairStreamID:(BOOL)a11 repairStreamID:(unsigned int)a12 repairMaxNetworkBitrate:(unsigned int)a13 subscribedTo:(BOOL)a14 startOnDemand:(BOOL)a15 streamGroupID:(unsigned int)a16 encoderGroupID:(unsigned int)a17 v2StreamID:(unsigned int)a18;
- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 networkBitrate:(unsigned int)a6 mediaBitrate:(unsigned int)a7 qualityIndex:(unsigned int)a8 streamID:(unsigned int)a9 streamGroupID:(unsigned int)a10 v2StreamID:(unsigned int)a11;
- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 streamID:(unsigned int)a6 streamGroupID:(unsigned int)a7;
- (VCSessionDownlinkBandwidthAllocatorClient)client;
- (VCSessionUplinkBandwidthAllocatorClient)uplinkClient;
- (id)description;
- (int64_t)compare:(id)a3;
- (unsigned)actualNetworkBitrate;
- (unsigned)encoderGroupID;
- (unsigned)maxMediaBitrate;
- (unsigned)maxNetworkBitrate;
- (unsigned)minNetworkBitrate;
- (unsigned)qualityIndex;
- (unsigned)repairMaxNetworkBitrate;
- (unsigned)repairStreamID;
- (unsigned)streamGroupID;
- (unsigned)streamID;
- (unsigned)type;
- (unsigned)v2StreamID;
- (void)dealloc;
- (void)setActualNetworkBitrate:(unsigned int)a3;
- (void)setIsLowestQuality:(BOOL)a3;
- (void)setSubscribedTo:(BOOL)a3;
@end

@implementation VCSessionBandwidthAllocationTableEntry

- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 networkBitrate:(unsigned int)a6 mediaBitrate:(unsigned int)a7 qualityIndex:(unsigned int)a8 streamID:(unsigned int)a9 streamGroupID:(unsigned int)a10 v2StreamID:(unsigned int)a11
{
  LODWORD(v14) = a11;
  WORD2(v13) = 1;
  LODWORD(v13) = 0;
  LOBYTE(v12) = 0;
  return -[VCSessionBandwidthAllocationTableEntry initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:](self, "initWithClient:type:streamToken:minNetworkBitrate:maxNetworkBitrate:mediaBitrate:qualityIndex:streamID:hasRepairStreamID:repairStreamID:repairMaxNetworkBitrate:subscribedTo:startOnDemand:streamGroupID:encoderGroupID:v2StreamID:", a3, a4, a5, *(void *)&a6, *(void *)&a6, *(void *)&a7, __PAIR64__(a9, a8), v12, v13, a10, v14);
}

- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 minNetworkBitrate:(unsigned int)a6 maxNetworkBitrate:(unsigned int)a7 mediaBitrate:(unsigned int)a8 qualityIndex:(unsigned int)a9 streamID:(unsigned int)a10 hasRepairStreamID:(BOOL)a11 repairStreamID:(unsigned int)a12 repairMaxNetworkBitrate:(unsigned int)a13 subscribedTo:(BOOL)a14 startOnDemand:(BOOL)a15 streamGroupID:(unsigned int)a16 encoderGroupID:(unsigned int)a17 v2StreamID:(unsigned int)a18
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v27.receiver = self;
  v27.super_class = (Class)VCSessionBandwidthAllocationTableEntry;
  v24 = [(VCSessionBandwidthAllocationTableEntry *)&v27 init];
  v25 = v24;
  if (v24)
  {
    v24->_client = (VCSessionDownlinkBandwidthAllocatorClient *)a3;
    v24->_minNetworkBitrate = a6;
    v24->_maxNetworkBitrate = a7;
    v24->_maxMediaBitrate = a8;
    v24->_qualityIndex = a9;
    v24->_type = a4;
    v24->_streamToken = (NSNumber *)(id)[NSNumber numberWithInteger:a5];
    v25->_streamID = a10;
    v25->_v2StreamID = a18;
    v25->_actualNetworkBitrate = a7;
    v25->_hasRepairStreamID = a11;
    v25->_repairStreamID = a12;
    v25->_repairMaxNetworkBitrate = a13;
    v25->_subscribedTo = a14;
    v25->_startOnDemand = a15;
    v25->_streamGroupID = a16;
    v25->_encoderGroupID = a17;
  }
  return v25;
}

- (VCSessionBandwidthAllocationTableEntry)initWithClient:(id)a3 type:(unsigned __int8)a4 streamToken:(int64_t)a5 streamID:(unsigned int)a6 streamGroupID:(unsigned int)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCSessionBandwidthAllocationTableEntry;
  unsigned int v12 = [(VCSessionBandwidthAllocationTableEntry *)&v15 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_uplinkClient = (VCSessionUplinkBandwidthAllocatorClient *)a3;
    v12->_type = a4;
    v12->_streamToken = (NSNumber *)[objc_alloc(NSNumber) initWithInteger:a5];
    v13->_streamID = a6;
    v13->_streamGroupID = a7;
  }
  return v13;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionBandwidthAllocationTableEntry;
  [(VCSessionBandwidthAllocationTableEntry *)&v3 dealloc];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"{ %@ streamGroupID=%s bitrate [minNetwork=%u maxNetwork=%u maxMedia=%u repairNetwork=%u] qualityIndex=%u videoQuality=%u visibilityIndex=%u prominenceIndex=%u streamID=%u repairStreamID=%u  isLowestQuality=%d v2StreamID=%d}", -[VCSessionDownlinkBandwidthAllocatorClient uuid](self->_client, "uuid"), FourccToCStr(self->_streamGroupID), self->_minNetworkBitrate, self->_maxNetworkBitrate, self->_maxMediaBitrate, self->_repairMaxNetworkBitrate, self->_qualityIndex, -[VCSessionDownlinkBandwidthAllocatorClient videoQuality](self->_client, "videoQuality"), -[VCSessionDownlinkBandwidthAllocatorClient visibilityIndex](self->_client, "visibilityIndex"), -[VCSessionDownlinkBandwidthAllocatorClient prominenceIndex](self->_client, "prominenceIndex"), self->_streamID, self->_repairStreamID, self->_isLowestQuality, self->_v2StreamID];
}

+ (unsigned)entryTypeForMediaType:(unsigned int)a3
{
  if (a3 == 1835365473) {
    return 3;
  }
  if (a3 == 1936684398) {
    return 1;
  }
  if (a3 != 1986618469 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      +[VCSessionBandwidthAllocationTableEntry entryTypeForMediaType:v5];
    }
  }
  return 2;
}

- (int64_t)compare:(id)a3
{
  if ([(VCSessionBandwidthAllocationTableEntry *)self type] == 1)
  {
    if ([a3 type] == 1)
    {
      int64_t result = +[VCSessionBandwidthAllocationTableEntry compareAudioEntry:self audioEntry:a3];
      if (result) {
        return result;
      }
    }
    else if ([a3 type] == 2 || objc_msgSend(a3, "type") == 3)
    {
      int64_t result = +[VCSessionBandwidthAllocationTableEntry compareAudioEntry:self videoEntry:a3];
      if (result) {
        return result;
      }
    }
  }
  else if ([(VCSessionBandwidthAllocationTableEntry *)self type] == 2 {
         || [(VCSessionBandwidthAllocationTableEntry *)self type] == 3)
  }
  {
    if ([a3 type] == 1)
    {
      int64_t result = -(uint64_t)(int)+[VCSessionBandwidthAllocationTableEntry compareAudioEntry:a3 videoEntry:self];
      if (result) {
        return result;
      }
    }
    else if ([a3 type] == 2 || objc_msgSend(a3, "type") == 3)
    {
      int64_t result = +[VCSessionBandwidthAllocationTableEntry compareVideoEntry:self videoEntry:a3];
      if (result) {
        return result;
      }
    }
  }
  int64_t result = objc_msgSend((id)-[VCSessionDownlinkBandwidthAllocatorClient uuid](-[VCSessionBandwidthAllocationTableEntry client](self, "client"), "uuid"), "compare:", objc_msgSend((id)objc_msgSend(a3, "client"), "uuid"));
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSessionBandwidthAllocationTableEntry compare:](v6, v7);
      }
    }
    return 0;
  }
  return result;
}

+ (int64_t)compareAudioEntry:(id)a3 audioEntry:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([a3 isLowestQuality] && !objc_msgSend(a4, "isLowestQuality"))
  {
    int64_t v6 = -1;
  }
  else if (([a3 isLowestQuality] & 1) != 0 || (objc_msgSend(a4, "isLowestQuality") & 1) == 0)
  {
    int v7 = [a3 qualityIndex];
    if (v7 == [a4 qualityIndex])
    {
      int64_t v6 = 0;
    }
    else
    {
      unsigned int v8 = [a3 qualityIndex];
      if (v8 < [a4 qualityIndex]) {
        int64_t v6 = -1;
      }
      else {
        int64_t v6 = 1;
      }
    }
  }
  else
  {
    int64_t v6 = 1;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = "+[VCSessionBandwidthAllocationTableEntry compareAudioEntry:audioEntry:]";
        __int16 v17 = 1024;
        int v18 = 155;
        __int16 v19 = 1024;
        int v20 = v6;
        __int16 v21 = 2112;
        id v22 = a3;
        __int16 v23 = 2112;
        id v24 = a4;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v13, 0x36u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316418;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "+[VCSessionBandwidthAllocationTableEntry compareAudioEntry:audioEntry:]";
      __int16 v17 = 1024;
      int v18 = 155;
      __int16 v19 = 1024;
      int v20 = v6;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v13, 0x36u);
    }
  }
  return v6;
}

+ (int64_t)compareVideoEntry:(id)a3 videoEntry:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(a3, "client"), "isVisible")
    && !objc_msgSend((id)objc_msgSend(a4, "client"), "isVisible"))
  {
    int64_t v6 = -1;
    goto LABEL_19;
  }
  if ((objc_msgSend((id)objc_msgSend(a3, "client"), "isVisible") & 1) == 0
    && (objc_msgSend((id)objc_msgSend(a4, "client"), "isVisible") & 1) != 0)
  {
    int64_t v6 = 1;
    goto LABEL_19;
  }
  if (!objc_msgSend((id)objc_msgSend(a3, "client"), "isVisible")
    || !objc_msgSend((id)objc_msgSend(a4, "client"), "isVisible"))
  {
    int v12 = objc_msgSend((id)objc_msgSend(a3, "client"), "visibilityIndex");
    if (v12 == objc_msgSend((id)objc_msgSend(a4, "client"), "visibilityIndex")) {
      goto LABEL_13;
    }
    unsigned int v10 = objc_msgSend((id)objc_msgSend(a3, "client"), "visibilityIndex");
    unsigned int v11 = objc_msgSend((id)objc_msgSend(a4, "client"), "visibilityIndex");
    goto LABEL_16;
  }
  int v7 = objc_msgSend((id)objc_msgSend(a4, "client"), "videoQuality");
  if (v7 == objc_msgSend((id)objc_msgSend(a3, "client"), "videoQuality"))
  {
    int v8 = [a3 qualityIndex];
    if (v8 == [a4 qualityIndex])
    {
      int v9 = objc_msgSend((id)objc_msgSend(a3, "client"), "prominenceIndex");
      if (v9 != objc_msgSend((id)objc_msgSend(a4, "client"), "prominenceIndex"))
      {
        unsigned int v10 = objc_msgSend((id)objc_msgSend(a3, "client"), "prominenceIndex");
        unsigned int v11 = objc_msgSend((id)objc_msgSend(a4, "client"), "prominenceIndex");
        goto LABEL_16;
      }
LABEL_13:
      int64_t v6 = 0;
      goto LABEL_19;
    }
    unsigned int v10 = [a3 qualityIndex];
    unsigned int v11 = [a4 qualityIndex];
LABEL_16:
    if (v10 < v11) {
      int64_t v6 = -1;
    }
    else {
      int64_t v6 = 1;
    }
    goto LABEL_19;
  }
  unsigned int v17 = objc_msgSend((id)objc_msgSend(a4, "client"), "videoQuality");
  unsigned int v18 = objc_msgSend((id)objc_msgSend(a3, "client"), "videoQuality");
  BOOL v19 = v17 >= v18;
  if (v17 < v18) {
    int64_t v6 = -1;
  }
  else {
    int64_t v6 = 1;
  }
  if (v19) {
    id v20 = a4;
  }
  else {
    id v20 = a3;
  }
  if (v19) {
    id v21 = a3;
  }
  else {
    id v21 = a4;
  }
  if (objc_msgSend((id)objc_msgSend(v20, "client"), "videoQuality") == 5
    && !objc_msgSend((id)objc_msgSend(v21, "client"), "videoQuality")
    && [v21 qualityIndex] <= 0x3E)
  {
    unsigned int v22 = [v21 qualityIndex];
    if (v22 < [v20 qualityIndex]) {
      int64_t v6 = -v6;
    }
  }
LABEL_19:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    uint64_t v14 = *MEMORY[0x1E4F47A50];
    __int16 v15 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 136316418;
        uint64_t v24 = v13;
        __int16 v25 = 2080;
        v26 = "+[VCSessionBandwidthAllocationTableEntry compareVideoEntry:videoEntry:]";
        __int16 v27 = 1024;
        int v28 = 195;
        __int16 v29 = 1024;
        int v30 = v6;
        __int16 v31 = 2112;
        id v32 = a3;
        __int16 v33 = 2112;
        id v34 = a4;
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v23, 0x36u);
      }
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 136316418;
      uint64_t v24 = v13;
      __int16 v25 = 2080;
      v26 = "+[VCSessionBandwidthAllocationTableEntry compareVideoEntry:videoEntry:]";
      __int16 v27 = 1024;
      int v28 = 195;
      __int16 v29 = 1024;
      int v30 = v6;
      __int16 v31 = 2112;
      id v32 = a3;
      __int16 v33 = 2112;
      id v34 = a4;
      _os_log_debug_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEBUG, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v23, 0x36u);
    }
  }
  return v6;
}

+ (int64_t)compareAudioEntry:(id)a3 videoEntry:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a4, "client"), "isVisible")) {
    goto LABEL_13;
  }
  int v6 = [a3 qualityIndex];
  if (v6 == [a4 qualityIndex])
  {
    int64_t v7 = 0;
  }
  else
  {
    unsigned int v8 = [a3 qualityIndex];
    if (v8 < [a4 qualityIndex]) {
      int64_t v7 = -1;
    }
    else {
      int64_t v7 = 1;
    }
  }
  if ([a3 qualityIndex] == 200
    && !objc_msgSend((id)objc_msgSend(a4, "client"), "videoQuality"))
  {
    if ([a4 streamGroupID] == 1667329381)
    {
      if ([a4 maxNetworkBitrate] < 0x7D01) {
        int64_t v7 = 1;
      }
      else {
        int64_t v7 = -1;
      }
      goto LABEL_14;
    }
LABEL_13:
    int64_t v7 = -1;
  }
LABEL_14:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    unsigned int v10 = *MEMORY[0x1E4F47A50];
    unsigned int v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v13 = 136316418;
        uint64_t v14 = v9;
        __int16 v15 = 2080;
        uint64_t v16 = "+[VCSessionBandwidthAllocationTableEntry compareAudioEntry:videoEntry:]";
        __int16 v17 = 1024;
        int v18 = 217;
        __int16 v19 = 1024;
        int v20 = v7;
        __int16 v21 = 2112;
        id v22 = a3;
        __int16 v23 = 2112;
        id v24 = a4;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v13, 0x36u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 136316418;
      uint64_t v14 = v9;
      __int16 v15 = 2080;
      uint64_t v16 = "+[VCSessionBandwidthAllocationTableEntry compareAudioEntry:videoEntry:]";
      __int16 v17 = 1024;
      int v18 = 217;
      __int16 v19 = 1024;
      int v20 = v7;
      __int16 v21 = 2112;
      id v22 = a3;
      __int16 v23 = 2112;
      id v24 = a4;
      _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d result=%d (%@ vs. %@)", (uint8_t *)&v13, 0x36u);
    }
  }
  return v7;
}

- (VCSessionDownlinkBandwidthAllocatorClient)client
{
  return self->_client;
}

- (unsigned)minNetworkBitrate
{
  return self->_minNetworkBitrate;
}

- (unsigned)maxNetworkBitrate
{
  return self->_maxNetworkBitrate;
}

- (unsigned)maxMediaBitrate
{
  return self->_maxMediaBitrate;
}

- (unsigned)qualityIndex
{
  return self->_qualityIndex;
}

- (BOOL)isLowestQuality
{
  return self->_isLowestQuality;
}

- (void)setIsLowestQuality:(BOOL)a3
{
  self->_isLowestQuality = a3;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)streamID
{
  return self->_streamID;
}

- (unsigned)actualNetworkBitrate
{
  return self->_actualNetworkBitrate;
}

- (void)setActualNetworkBitrate:(unsigned int)a3
{
  self->_actualNetworkBitrate = a3;
}

- (unsigned)repairStreamID
{
  return self->_repairStreamID;
}

- (unsigned)repairMaxNetworkBitrate
{
  return self->_repairMaxNetworkBitrate;
}

- (BOOL)hasRepairStreamID
{
  return self->_hasRepairStreamID;
}

- (BOOL)isSubscribedTo
{
  return self->_subscribedTo;
}

- (void)setSubscribedTo:(BOOL)a3
{
  self->_subscribedTo = a3;
}

- (BOOL)isStartOnDemand
{
  return self->_startOnDemand;
}

- (unsigned)streamGroupID
{
  return self->_streamGroupID;
}

- (unsigned)encoderGroupID
{
  return self->_encoderGroupID;
}

- (NSNumber)streamToken
{
  return self->_streamToken;
}

- (VCSessionUplinkBandwidthAllocatorClient)uplinkClient
{
  return self->_uplinkClient;
}

- (unsigned)v2StreamID
{
  return self->_v2StreamID;
}

+ (void)entryTypeForMediaType:(NSObject *)a3 .cold.1(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int64_t v7 = "+[VCSessionBandwidthAllocationTableEntry entryTypeForMediaType:]";
  __int16 v8 = 1024;
  int v9 = 108;
  __int16 v10 = 2080;
  unsigned int v11 = FourccToCStr(a2);
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Unsupported media type:%s", (uint8_t *)&v4, 0x26u);
}

- (void)compare:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCSessionBandwidthAllocationTableEntry compare:]";
  __int16 v6 = 1024;
  int v7 = 139;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d compare method returning NSOrderedSame -- sort result will be indeterministic", (uint8_t *)&v2, 0x1Cu);
}

@end