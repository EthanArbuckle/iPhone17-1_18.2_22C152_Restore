@interface VCPacketBundler
- (BOOL)_copyInputBytes:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6;
- (BOOL)allocateBundleBuffer:(unsigned int)a3;
- (BOOL)allowLargePackets;
- (BOOL)bundleAudioLegacy:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6;
- (BOOL)bundleAudioRFC3640:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6;
- (BOOL)isFull;
- (BOOL)isTalkSpurtStart;
- (BOOL)reallocateBufferWithMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4;
- (BOOL)setPacketsPerBundle:(unsigned int)a3;
- (VCPacketBundler)initWithOperatingMode:(int)a3 bundlingScheme:(int)a4;
- (char)accessUnitDataSectionHead;
- (char)encodedBuffer;
- (char)encodedBufferForRFC3640;
- (int)bundlingScheme;
- (int)payload;
- (unsigned)accessUnitHeaderSectionSize;
- (unsigned)accessUnitHeaderSectionSizeMaximum;
- (unsigned)bundleBufferSizeWidthMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4;
- (unsigned)bundledPackets;
- (unsigned)encodedBufferSize;
- (unsigned)encodedBufferSizeForRFC3640;
- (unsigned)maxPacketSize;
- (unsigned)packetsPerBundle;
- (unsigned)priority;
- (unsigned)timestamp;
- (void)dealloc;
- (void)initLock;
- (void)lock;
- (void)resetBuffer;
- (void)setAllowLargePackets:(BOOL)a3;
- (void)setBundlingScheme:(int)a3;
- (void)setMaxPacketSize:(unsigned int)a3;
- (void)setPayload:(int)a3;
- (void)setTimestamp:(unsigned int)a3;
- (void)unlock;
@end

@implementation VCPacketBundler

- (VCPacketBundler)initWithOperatingMode:(int)a3 bundlingScheme:(int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCPacketBundler;
  v6 = [(VCPacketBundler *)&v13 init];
  v7 = v6;
  if (!v6)
  {
LABEL_10:

    return 0;
  }
  v6->_cdrxBundleInfoRef = 0;
  p_cdrxBundleInfoRef = &v6->_cdrxBundleInfoRef;
  v6->_maxPacketSize = 512;
  int v9 = 1;
  v6->_allowLargePackets = 1;
  *(void *)&v6->_packetsPerBundle = 0x8000000001;
  v6->_operatingMode = a3;
  v6->_bundlingScheme = a4;
  if (a4 == 3)
  {
    v10 = (CMSimpleQueueRef *)malloc_type_calloc(1uLL, 0x58uLL, 0x10200404CEB7EB2uLL);
    void *p_cdrxBundleInfoRef = v10;
    if (v10)
    {
      if (!CMSimpleQueueCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 8, v10 + 10)) {
        goto LABEL_5;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCPacketBundler initWithOperatingMode:bundlingScheme:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCPacketBundler initWithOperatingMode:bundlingScheme:]();
      }
    }
    if (*p_cdrxBundleInfoRef) {
      _VCPacketBundler_CleanupCDRXInfo((void ***)&v7->_cdrxBundleInfoRef);
    }
    int v9 = 0;
  }
LABEL_5:
  [(VCPacketBundler *)v7 initLock];
  BOOL v11 = [(VCPacketBundler *)v7 reallocateBufferWithMaxPacketSize:v7->_maxPacketSize maxPacketCount:v7->_packetsPerBundle];
  if (!v9 || !v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCPacketBundler initWithOperatingMode:bundlingScheme:]();
      }
    }
    goto LABEL_10;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  buffer = self->_buffer;
  if (buffer)
  {
    free(buffer);
    self->_buffer = 0;
  }
  if (self->_cdrxBundleInfoRef) {
    _VCPacketBundler_CleanupCDRXInfo((void ***)&self->_cdrxBundleInfoRef);
  }
  pthread_mutex_destroy(&self->_mutex);
  v4.receiver = self;
  v4.super_class = (Class)VCPacketBundler;
  [(VCPacketBundler *)&v4 dealloc];
}

- (unsigned)bundleBufferSizeWidthMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4
{
  return (a3 + 2) * a4 + 2;
}

- (BOOL)allocateBundleBuffer:(unsigned int)a3
{
  return self->_maxPacketSize == a3
      || -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](self, "reallocateBufferWithMaxPacketSize:maxPacketCount:");
}

- (BOOL)reallocateBufferWithMaxPacketSize:(unsigned int)a3 maxPacketCount:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v5 = *(void *)&a3;
  [(VCPacketBundler *)self lock];
  unsigned int v7 = [(VCPacketBundler *)self bundleBufferSizeWidthMaxPacketSize:v5 maxPacketCount:v4];
  if (v7 > self->_bufferSize)
  {
    unsigned int v8 = v7;
    int v9 = (char *)malloc_type_realloc(self->_buffer, v7, 0x8E49C8CEuLL);
    self->_buffer = v9;
    if (v9) {
      unsigned int v10 = v8;
    }
    else {
      unsigned int v10 = 0;
    }
    self->_bufferSize = v10;
  }
  self->_packetsPerBundle = v4;
  self->_maxPacketSize = v5;
  if (self->_bundledPackets >= v4) {
    self->_isFull = 1;
  }
  BOOL v11 = self->_buffer != 0;
  [(VCPacketBundler *)self unlock];
  return v11;
}

- (unsigned)maxPacketSize
{
  return self->_maxPacketSize;
}

- (void)setMaxPacketSize:(unsigned int)a3
{
  if (self->_maxPacketSize != a3) {
    -[VCPacketBundler reallocateBufferWithMaxPacketSize:maxPacketCount:](self, "reallocateBufferWithMaxPacketSize:maxPacketCount:");
  }
}

- (BOOL)setPacketsPerBundle:(unsigned int)a3
{
  return self->_packetsPerBundle == a3
      || [(VCPacketBundler *)self reallocateBufferWithMaxPacketSize:self->_maxPacketSize maxPacketCount:*(void *)&a3];
}

- (unsigned)packetsPerBundle
{
  return self->_packetsPerBundle;
}

- (char)encodedBuffer
{
  if (self->_bundlingScheme == 2) {
    return [(VCPacketBundler *)self encodedBufferForRFC3640];
  }
  else {
    return self->_buffer;
  }
}

- (unsigned)encodedBufferSize
{
  if (self->_bundlingScheme == 2) {
    return [(VCPacketBundler *)self encodedBufferSizeForRFC3640];
  }
  else {
    return self->_encodedBufferSize;
  }
}

- (BOOL)isTalkSpurtStart
{
  return !self->_lastBundleVoiceActivity && self->_currentBundleVoiceActivity;
}

- (char)encodedBufferForRFC3640
{
  unsigned int v3 = [(VCPacketBundler *)self accessUnitHeaderSectionSize];
  result = [(VCPacketBundler *)self accessUnitDataSectionHead];
  uint64_t v5 = result;
  if (v3)
  {
    result -= v3;
    *(_WORD *)result = bswap32(16 * self->_accessUnitHeaderInfo.accessUnitCount) >> 16;
    if (self->_accessUnitHeaderInfo.accessUnitCount)
    {
      unint64_t v6 = 0;
      uint64_t v7 = (uint64_t)&v5[-v3 + 2];
      do
      {
        *(_WORD *)(v7 + 2 * v6) = bswap32(8 * self->_accessUnitHeaderInfo.accessUnitSize[v6]) >> 16;
        ++v6;
      }
      while (v6 < self->_accessUnitHeaderInfo.accessUnitCount);
    }
  }
  return result;
}

- (unsigned)encodedBufferSizeForRFC3640
{
  return self->_accessUnitDataSectionSize
       + [(VCPacketBundler *)self accessUnitHeaderSectionSize];
}

- (unsigned)accessUnitHeaderSectionSize
{
  if (self->_accessUnitHeaderInfo.accessUnitCount) {
    return 2 * self->_accessUnitHeaderInfo.accessUnitCount + 2;
  }
  else {
    return 0;
  }
}

- (unsigned)accessUnitHeaderSectionSizeMaximum
{
  return 2 * self->_packetsPerBundle + 2;
}

- (char)accessUnitDataSectionHead
{
  buffer = self->_buffer;
  return &buffer[[(VCPacketBundler *)self accessUnitHeaderSectionSizeMaximum]];
}

- (BOOL)bundleAudioRFC3640:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  BOOL v11 = [(VCPacketBundler *)self accessUnitDataSectionHead];
  uint64_t accessUnitDataSectionSize = self->_accessUnitDataSectionSize;
  BOOL v13 = +[VCPayloadUtils canBundleExternallyForPayload:v7 forBundlingScheme:2 operatingMode:self->_operatingMode];
  unsigned int v14 = self->_accessUnitDataSectionSize + a4;
  if (v13)
  {
    if (v14 + [(VCPacketBundler *)self accessUnitHeaderSectionSizeMaximum] > self->_bufferSize)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        v16 = *MEMORY[0x1E4F47A50];
        BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (v17)
        {
          unsigned int bufferSize = self->_bufferSize;
          unsigned int v19 = self->_accessUnitDataSectionSize;
          unsigned int bundledPackets = self->_bundledPackets;
          int v31 = 136316674;
          uint64_t v32 = v15;
          __int16 v33 = 2080;
          v34 = "-[VCPacketBundler bundleAudioRFC3640:numInputBytes:payloadType:timestamp:]";
          __int16 v35 = 1024;
          int v36 = 263;
          __int16 v37 = 1024;
          unsigned int v38 = a4;
          __int16 v39 = 1024;
          unsigned int v40 = bufferSize;
          __int16 v41 = 1024;
          unsigned int v42 = v19;
          __int16 v43 = 1024;
          unsigned int v44 = bundledPackets;
          v21 = " [%s] %s:%d RFC3640 bundling encountered an error: inputBytes=%u bufferSize=%u accessUnitDataSectionSize"
                "=%u bundledCount=%u";
LABEL_10:
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, v21, (uint8_t *)&v31, 0x34u);
          goto LABEL_11;
        }
        return v17;
      }
LABEL_11:
      LOBYTE(v17) = 0;
      return v17;
    }
    uint64_t accessUnitCount = self->_accessUnitHeaderInfo.accessUnitCount;
    self->_accessUnitHeaderInfo.accessUnitSize[accessUnitCount] = a4;
    self->_accessUnitHeaderInfo.uint64_t accessUnitCount = accessUnitCount + 1;
LABEL_13:
    memcpy(&v11[accessUnitDataSectionSize], a3, a4);
    unsigned int v27 = self->_bundledPackets;
    self->_accessUnitDataSectionSize += a4;
    if (!v27)
    {
      self->_payload = v7;
      self->_timestamp = a6;
    }
    unsigned int v28 = v27 + 1;
    self->_unsigned int bundledPackets = v28;
    BOOL v29 = !v13 || v28 == self->_packetsPerBundle;
    self->_isFull = v29;
    LOBYTE(v17) = 1;
    return v17;
  }
  if (v14 <= self->_bufferSize) {
    goto LABEL_13;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_11;
  }
  uint64_t v22 = VRTraceErrorLogLevelToCSTR();
  v16 = *MEMORY[0x1E4F47A50];
  BOOL v17 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v17)
  {
    unsigned int v23 = self->_bufferSize;
    unsigned int v24 = self->_accessUnitDataSectionSize;
    unsigned int v25 = self->_bundledPackets;
    int v31 = 136316674;
    uint64_t v32 = v22;
    __int16 v33 = 2080;
    v34 = "-[VCPacketBundler bundleAudioRFC3640:numInputBytes:payloadType:timestamp:]";
    __int16 v35 = 1024;
    int v36 = 270;
    __int16 v37 = 1024;
    unsigned int v38 = a4;
    __int16 v39 = 1024;
    unsigned int v40 = v23;
    __int16 v41 = 1024;
    unsigned int v42 = v24;
    __int16 v43 = 1024;
    unsigned int v44 = v25;
    v21 = " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u accessUnitDataSectionSize=%u bundledCount=%u";
    goto LABEL_10;
  }
  return v17;
}

- (BOOL)_copyInputBytes:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unsigned int v8 = self->_encodedBufferSize + a4;
  unsigned int bufferSize = self->_bufferSize;
  if (v8 > bufferSize)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      BOOL v13 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int v15 = self->_bufferSize;
        unsigned int encodedBufferSize = self->_encodedBufferSize;
        unsigned int bundledPackets = self->_bundledPackets;
        int v18 = 136316674;
        uint64_t v19 = v12;
        __int16 v20 = 2080;
        v21 = "-[VCPacketBundler _copyInputBytes:numInputBytes:payloadType:timestamp:]";
        __int16 v22 = 1024;
        int v23 = 360;
        __int16 v24 = 1024;
        unsigned int v25 = a4;
        __int16 v26 = 1024;
        unsigned int v27 = v15;
        __int16 v28 = 1024;
        unsigned int v29 = encodedBufferSize;
        __int16 v30 = 1024;
        unsigned int v31 = bundledPackets;
        _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize=%u bundledCount=%u", (uint8_t *)&v18, 0x34u);
      }
    }
  }
  else
  {
    memcpy(self->_buffer, a3, a4);
    self->_timestamp = a6;
    self->_unsigned int encodedBufferSize = a4;
    self->_payload = a5;
    self->_unsigned int bundledPackets = 1;
    self->_isFull = 1;
  }
  return v8 <= bufferSize;
}

- (BOOL)bundleAudioLegacy:(void *)a3 numInputBytes:(unsigned int)a4 payloadType:(int)a5 timestamp:(unsigned int)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  BOOL v11 = &self->_buffer[self->_encodedBufferSize];
  BOOL v12 = +[VCPayloadUtils canBundleExternallyForPayload:*(void *)&a5 forBundlingScheme:1 operatingMode:self->_operatingMode];
  if (v12)
  {
    if (a4 >= 0x100 && self->_allowLargePackets)
    {
      unsigned int maxPacketSize = self->_maxPacketSize;
      if (maxPacketSize >= 0x2FF) {
        unsigned int maxPacketSize = 767;
      }
      if (maxPacketSize < a4 || a4 + self->_encodedBufferSize + 2 > self->_bufferSize)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v14 = VRTraceErrorLogLevelToCSTR();
          unsigned int v15 = *MEMORY[0x1E4F47A50];
          BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v16)
          {
            unsigned int bufferSize = self->_bufferSize;
            unsigned int encodedBufferSize = self->_encodedBufferSize;
            unsigned int bundledPackets = self->_bundledPackets;
            int v38 = 136316674;
            uint64_t v39 = v14;
            __int16 v40 = 2080;
            __int16 v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
            __int16 v42 = 1024;
            int v43 = 383;
            __int16 v44 = 1024;
            unsigned int v45 = a4;
            __int16 v46 = 1024;
            unsigned int v47 = bufferSize;
            __int16 v48 = 1024;
            unsigned int v49 = encodedBufferSize;
            __int16 v50 = 1024;
            unsigned int v51 = bundledPackets;
            __int16 v20 = " [%s] %s:%d : Large packet bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSiz"
                  "e=%u bundledCount=%u";
LABEL_20:
            _os_log_error_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v38, 0x34u);
            goto LABEL_21;
          }
          return v16;
        }
LABEL_21:
        LOBYTE(v16) = 0;
        return v16;
      }
      *BOOL v11 = a4 & 1;
      unsigned int v31 = v11 + 1;
      unsigned int v30 = (a4 + 256) >> 1;
      uint64_t v29 = 2;
    }
    else
    {
      if (a4 - 256 < 0xFFFFFF02 || a4 + self->_encodedBufferSize + 1 > self->_bufferSize)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v25 = VRTraceErrorLogLevelToCSTR();
          unsigned int v15 = *MEMORY[0x1E4F47A50];
          BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
          if (v16)
          {
            unsigned int v26 = self->_bufferSize;
            unsigned int v27 = self->_encodedBufferSize;
            unsigned int v28 = self->_bundledPackets;
            int v38 = 136316674;
            uint64_t v39 = v25;
            __int16 v40 = 2080;
            __int16 v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
            __int16 v42 = 1024;
            int v43 = 391;
            __int16 v44 = 1024;
            unsigned int v45 = a4;
            __int16 v46 = 1024;
            unsigned int v47 = v26;
            __int16 v48 = 1024;
            unsigned int v49 = v27;
            __int16 v50 = 1024;
            unsigned int v51 = v28;
            __int16 v20 = " [%s] %s:%d Small packet bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize="
                  "%u bundledCount=%u";
            goto LABEL_20;
          }
          return v16;
        }
        goto LABEL_21;
      }
      uint64_t v29 = 1;
      LOBYTE(v30) = a4;
      unsigned int v31 = v11;
    }
    v11 += v29;
    *unsigned int v31 = v30;
LABEL_25:
    memcpy(v11, a3, a4);
    self->_unsigned int encodedBufferSize = v11 + a4 - LODWORD(self->_buffer);
    unsigned int v32 = self->_bundledPackets;
    if (!v32)
    {
      self->_payload = a5;
      self->_timestamp = a6;
    }
    unsigned int v33 = v32 + 1;
    self->_unsigned int bundledPackets = v33;
    BOOL v36 = !v12 || a4 < 7 && a5 == 108 || v33 == self->_packetsPerBundle;
    self->_isFull = v36;
    LOBYTE(v16) = 1;
    return v16;
  }
  if (self->_encodedBufferSize + a4 <= self->_bufferSize) {
    goto LABEL_25;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
    goto LABEL_21;
  }
  uint64_t v21 = VRTraceErrorLogLevelToCSTR();
  unsigned int v15 = *MEMORY[0x1E4F47A50];
  BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v16)
  {
    unsigned int v22 = self->_bufferSize;
    unsigned int v23 = self->_encodedBufferSize;
    unsigned int v24 = self->_bundledPackets;
    int v38 = 136316674;
    uint64_t v39 = v21;
    __int16 v40 = 2080;
    __int16 v41 = "-[VCPacketBundler bundleAudioLegacy:numInputBytes:payloadType:timestamp:]";
    __int16 v42 = 1024;
    int v43 = 397;
    __int16 v44 = 1024;
    unsigned int v45 = a4;
    __int16 v46 = 1024;
    unsigned int v47 = v22;
    __int16 v48 = 1024;
    unsigned int v49 = v23;
    __int16 v50 = 1024;
    unsigned int v51 = v24;
    __int16 v20 = " [%s] %s:%d Bundling encountered an error: inputBytes=%u bufferSize=%u encodedBufferSize=%u bundledCount=%u";
    goto LABEL_20;
  }
  return v16;
}

- (void)resetBuffer
{
  *(void *)&self->_uint64_t accessUnitDataSectionSize = 0;
  self->_unsigned int encodedBufferSize = 0;
  self->_accessUnitHeaderInfo = 0;
  self->_lastBundleVoiceActivity = self->_currentBundleVoiceActivity;
  self->_currentBundleVoiceActivity = 0;
  self->_isFull = 0;
  self->_priority = 0;
  cdrxBundleInfoRef = self->_cdrxBundleInfoRef;
  if (cdrxBundleInfoRef)
  {
    *(void *)&cdrxBundleInfoRef->var0[1].var3 = 0;
    *(_OWORD *)&cdrxBundleInfoRef->var0[0].var0 = 0u;
    *(_OWORD *)&cdrxBundleInfoRef->var0[0].var4 = 0u;
  }
}

- (void)initLock
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.__sig = 0xAAAAAAAAAAAAAAAALL;
  *(void *)v3.__opaque = 0xAAAAAAAAAAAAAAAALL;
  pthread_mutexattr_init(&v3);
  pthread_mutexattr_settype(&v3, 2);
  pthread_mutex_init(&self->_mutex, &v3);
  pthread_mutexattr_destroy(&v3);
}

- (void)lock
{
}

- (void)unlock
{
}

- (BOOL)allowLargePackets
{
  return self->_allowLargePackets;
}

- (void)setAllowLargePackets:(BOOL)a3
{
  self->_allowLargePackets = a3;
}

- (BOOL)isFull
{
  return self->_isFull;
}

- (unsigned)bundledPackets
{
  return self->_bundledPackets;
}

- (int)payload
{
  return self->_payload;
}

- (void)setPayload:(int)a3
{
  self->_payload = a3;
}

- (unsigned)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(unsigned int)a3
{
  self->_timestamp = a3;
}

- (int)bundlingScheme
{
  return self->_bundlingScheme;
}

- (void)setBundlingScheme:(int)a3
{
  self->_bundlingScheme = a3;
}

- (unsigned)priority
{
  return self->_priority;
}

- (void)initWithOperatingMode:bundlingScheme:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bundler init failed", v2, v3, v4, v5, v6);
}

- (void)initWithOperatingMode:bundlingScheme:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate CDRX container", v2, v3, v4, v5, v6);
}

- (void)initWithOperatingMode:bundlingScheme:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "_VCPacketBundler_PrepareCdrxInfo";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Cdrx event queue creation failed with error=%d", v2, *(const char **)v3, (unint64_t)"_VCPacketBundler_PrepareCdrxInfo" >> 16, 81);
}

@end