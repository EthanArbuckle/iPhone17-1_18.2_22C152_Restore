@interface VCMediaRecorderHistoryBuffer
- (VCMediaRecorderHistoryBuffer)initWithDelegate:(id)a3 bufferLength:(int)a4;
- (id)delegate;
- (int)getCount;
- (opaqueCMSampleBuffer)getClosestSampleForTimestamp:(unsigned int)a3;
- (void)dealloc;
- (void)flushBuffer;
@end

@implementation VCMediaRecorderHistoryBuffer

- (VCMediaRecorderHistoryBuffer)initWithDelegate:(id)a3 bufferLength:(int)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)VCMediaRecorderHistoryBuffer;
  v6 = [(VCMediaRecorderHistoryBuffer *)&v12 init];
  v7 = v6;
  if (v6)
  {
    if (a3)
    {
      objc_storeWeak(&v6->_delegate, a3);
      CFAllocatorRef v8 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      CFMutableArrayRef Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
      v7->_timestampQueue = Mutable;
      if (Mutable)
      {
        CFMutableDictionaryRef v10 = CFDictionaryCreateMutable(v8, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        v7->_sampleMap = v10;
        if (v10)
        {
          VCAllocatorFirstCome_Create(v8, (uint64_t)"VCMediaRecorderHistoryBufferTimestampAllocator", &v7->_timestampAllocator);
          if (v7->_timestampAllocator)
          {
            v7->_bufferLength = a4;
            return v7;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaRecorderHistoryBuffer initWithDelegate:bufferLength:]();
      }
    }

    return 0;
  }
  return v7;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [(VCMediaRecorderHistoryBuffer *)self flushBuffer];
  objc_storeWeak(&self->_delegate, 0);
  timestampQueue = self->_timestampQueue;
  if (timestampQueue) {
    CFRelease(timestampQueue);
  }
  sampleMap = self->_sampleMap;
  if (sampleMap) {
    CFRelease(sampleMap);
  }
  timestampAllocator = self->_timestampAllocator;
  if (timestampAllocator) {
    CFRelease(timestampAllocator);
  }
  v6.receiver = self;
  v6.super_class = (Class)VCMediaRecorderHistoryBuffer;
  [(VCMediaRecorderHistoryBuffer *)&v6 dealloc];
}

- (opaqueCMSampleBuffer)getClosestSampleForTimestamp:(unsigned int)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned int Count = CFDictionaryGetCount(self->_sampleMap);
  if (!Count) {
    return 0;
  }
  unsigned int valuePtr = 480 * (a3 / 0x1E0);
  CFAllocatorRef v6 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  int v7 = 31;
  while (1)
  {
    CFNumberRef v8 = CFNumberCreate(v6, kCFNumberIntType, &valuePtr);
    if (v8)
    {
      CFNumberRef v9 = v8;
      Value = (opaqueCMSampleBuffer *)CFDictionaryGetValue(self->_sampleMap, v8);
      CFRelease(v9);
      if (Value) {
        break;
      }
    }
    valuePtr -= 480;
    if (--v7 <= 1)
    {
      timestampQueue = self->_timestampQueue;
      CFIndex v12 = CFArrayGetCount(timestampQueue);
      CFNumberRef ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(timestampQueue, v12 - 1);
      unsigned int valuePtr = CFNumberGetValue(ValueAtIndex, kCFNumberIntType, &valuePtr);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v23 = v14;
          __int16 v24 = 2080;
          v25 = "-[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:]";
          __int16 v26 = 1024;
          int v27 = 107;
          __int16 v28 = 1024;
          unsigned int v29 = a3;
          __int16 v30 = 1024;
          unsigned int v31 = valuePtr;
          __int16 v32 = 1024;
          unsigned int v33 = Count;
          _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Image not found in the buffer for timestamp=%u, retrieving the latest one for currentTS=%u, _sampleMap contains=%u", buf, 0x2Eu);
        }
      }
      Value = (opaqueCMSampleBuffer *)CFDictionaryGetValue(self->_sampleMap, ValueAtIndex);
      if (!Value)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
        {
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          v17 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315650;
            uint64_t v23 = v16;
            __int16 v24 = 2080;
            v25 = "-[VCMediaRecorderHistoryBuffer getClosestSampleForTimestamp:]";
            __int16 v26 = 1024;
            int v27 = 112;
            _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Can't find last object in timestamp queue, get last object in the image buffer", buf, 0x1Cu);
          }
        }
        v18 = (char *)&v20 - ((8 * Count + 15) & 0xFFFFFFFF0);
        memset(v18, 170, 8 * Count);
        memset(v18, 170, 8 * Count);
        CFDictionaryGetKeysAndValues(self->_sampleMap, (const void **)v18, (const void **)v18);
        return *(opaqueCMSampleBuffer **)&v18[8 * Count - 8];
      }
      return Value;
    }
  }
  return Value;
}

- (void)flushBuffer
{
  while (CFArrayGetCount(self->_timestampQueue))
    VCMediaRecorderHistoryBuffer_DequeueOneFrame((CFIndex)self);
}

- (int)getCount
{
  return CFArrayGetCount(self->_timestampQueue);
}

- (id)delegate
{
  return objc_loadWeak(&self->_delegate);
}

- (void)initWithDelegate:bufferLength:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer Delegate parameter is nil", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:bufferLength:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the timestamp queue", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:bufferLength:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the sample dictionary", v2, v3, v4, v5, v6);
}

- (void)initWithDelegate:bufferLength:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaRecorderHistoryBuffer failed to create the allocator", v2, v3, v4, v5, v6);
}

@end