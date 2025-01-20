@interface VCVideoFrameBufferPool
- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4;
- (BOOL)releaseFrameWithTime:(int64_t)a3;
- (VCVideoFrameBufferPool)initWithCapacity:(int)a3;
- (void)dealloc;
@end

@implementation VCVideoFrameBufferPool

- (VCVideoFrameBufferPool)initWithCapacity:(int)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCVideoFrameBufferPool;
  v4 = [(VCVideoFrameBufferPool *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxBufferCount = a3;
    v4->_bufferPool = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCVideoFrameBufferPool;
  [(VCVideoFrameBufferPool *)&v3 dealloc];
}

- (BOOL)addFrame:(__CVBuffer *)a3 time:(int64_t)a4
{
  int v7 = [(NSMutableDictionary *)self->_bufferPool count];
  int maxBufferCount = self->_maxBufferCount;
  if (maxBufferCount == v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCVideoFrameBufferPool addFrame:time:](v9, v10);
      }
    }
  }
  else
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPool, "setObject:forKeyedSubscript:", a3, [NSNumber numberWithLongLong:a4]);
  }
  return maxBufferCount != v7;
}

- (BOOL)releaseFrameWithTime:(int64_t)a3
{
  uint64_t v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_bufferPool, "objectForKeyedSubscript:", objc_msgSend(NSNumber, "numberWithLongLong:"));
  if (v5)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_bufferPool, "setObject:forKeyedSubscript:", 0, [NSNumber numberWithLongLong:a3]);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v6 = VRTraceErrorLogLevelToCSTR();
    int v7 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(VCVideoFrameBufferPool *)v6 releaseFrameWithTime:v7];
    }
  }
  return v5 != 0;
}

- (void)addFrame:(uint64_t)a1 time:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[VCVideoFrameBufferPool addFrame:time:]";
  __int16 v6 = 1024;
  int v7 = 35;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Dropping the frame, Client fell behind. Buffer is full.", (uint8_t *)&v2, 0x1Cu);
}

- (void)releaseFrameWithTime:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  uint64_t v4 = a1;
  __int16 v5 = 2080;
  __int16 v6 = "-[VCVideoFrameBufferPool releaseFrameWithTime:]";
  __int16 v7 = 1024;
  int v8 = 44;
  __int16 v9 = 2048;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Can't release frame with time %lld, doesn't exist", (uint8_t *)&v3, 0x26u);
}

@end