@interface VCImageConverterBase
- (BOOL)ensureBufferPoolSupportsOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4;
- (BOOL)setUpBufferPoolForOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4;
- (VCImageConverterBase)initWithFormatType:(unsigned int)a3;
- (void)dealloc;
@end

@implementation VCImageConverterBase

- (VCImageConverterBase)initWithFormatType:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v11[1] = *MEMORY[0x1E4F143B8];
  v9.receiver = self;
  v9.super_class = (Class)VCImageConverterBase;
  v4 = [(VCImageConverterBase *)&v9 init];
  if (v4)
  {
    v4->_bufferPoolDictionary = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v5 = [NSNumber numberWithUnsignedInt:v3];
    [(NSMutableDictionary *)v4->_bufferPoolDictionary setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F24D70]];
    v4->_formatType = v3;
    uint64_t v6 = MEMORY[0x1E4F1CC38];
    [(NSMutableDictionary *)v4->_bufferPoolDictionary setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4F24D40]];
    uint64_t v10 = *MEMORY[0x1E4F2F0F8];
    v11[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [(NSMutableDictionary *)v4->_bufferPoolDictionary setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F24D20]];
  }
  return v4;
}

- (BOOL)setUpBufferPoolForOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4
{
  v31[2] = *MEMORY[0x1E4F143B8];
  p_bufferPool = &self->_bufferPool;
  if (self->_bufferPool)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      objc_super v9 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315906;
        uint64_t v19 = v8;
        __int16 v20 = 2080;
        v21 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
        __int16 v22 = 1024;
        int v23 = 53;
        __int16 v24 = 2048;
        v25 = self;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %p, Releasing _bufferPool to create a new one", (uint8_t *)&v18, 0x26u);
      }
    }
    CVPixelBufferPoolRelease(*p_bufferPool);
    *p_bufferPool = 0;
  }
  uint64_t v10 = [NSNumber numberWithUnsignedLong:a3];
  [(NSMutableDictionary *)self->_bufferPoolDictionary setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F24E10]];
  self->_outputWidth = a3;
  uint64_t v11 = [NSNumber numberWithUnsignedLong:a4];
  [(NSMutableDictionary *)self->_bufferPoolDictionary setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F24D08]];
  self->_outputHeight = a4;
  uint64_t v12 = *MEMORY[0x1E4F2F128];
  v30[0] = *MEMORY[0x1E4F2F0F8];
  v30[1] = v12;
  v31[0] = MEMORY[0x1E4F1CC38];
  v31[1] = @"AVConference:ImageConverter";
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:2];
  [(NSMutableDictionary *)self->_bufferPoolDictionary setObject:v13 forKeyedSubscript:*MEMORY[0x1E4F24D20]];
  CVPixelBufferPoolCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFDictionaryRef)self->_bufferPoolDictionary, p_bufferPool);
  bufferPool = self->_bufferPool;
  if (bufferPool)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136316418;
        uint64_t v19 = v15;
        __int16 v20 = 2080;
        v21 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
        __int16 v22 = 1024;
        int v23 = 70;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 1024;
        int v27 = a3;
        __int16 v28 = 1024;
        int v29 = a4;
        _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Frame Transform, %p, create %ux%u _bufferPool", (uint8_t *)&v18, 0x32u);
      }
    }
  }
  else
  {
    self->_outputWidth = 0;
    self->_outputHeight = 0;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]();
      }
    }
  }
  return bufferPool != 0;
}

- (BOOL)ensureBufferPoolSupportsOutputWidth:(unint64_t)a3 outputHeight:(unint64_t)a4
{
  return self->_bufferPool && self->_bufferPoolDictionary && self->_outputWidth == a3 && self->_outputHeight == a4
      || [(VCImageConverterBase *)self setUpBufferPoolForOutputWidth:a3 outputHeight:a4];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  CVPixelBufferPoolRelease(self->_bufferPool);

  v3.receiver = self;
  v3.super_class = (Class)VCImageConverterBase;
  [(VCImageConverterBase *)&v3 dealloc];
}

- (void)setUpBufferPoolForOutputWidth:outputHeight:.cold.1()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v4 = v0;
  uint64_t v5 = "-[VCImageConverterBase setUpBufferPoolForOutputWidth:outputHeight:]";
  __int16 v6 = 1024;
  int v7 = 75;
  __int16 v8 = 2048;
  uint64_t v9 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d %p, CVPixelBufferPoolCreate failed", v3, 0x26u);
}

@end