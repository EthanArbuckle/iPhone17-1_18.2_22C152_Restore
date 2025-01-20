@interface VCAudioPowerSpectrum
- (NSString)description;
- (VCAudioPowerSpectrum)initWithBinCount:(unsigned int)a3 streamToken:(int64_t)a4 sinkContext:(void *)a5 sinkCallback:(void *)a6;
- (_VCRange)frequencyRange;
- (int64_t)streamToken;
- (void)dealloc;
- (void)realtimeContext;
@end

@implementation VCAudioPowerSpectrum

- (VCAudioPowerSpectrum)initWithBinCount:(unsigned int)a3 streamToken:(int64_t)a4 sinkContext:(void *)a5 sinkCallback:(void *)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (a3 && a5 && a6)
  {
    v13.receiver = self;
    v13.super_class = (Class)VCAudioPowerSpectrum;
    result = [(VCAudioPowerSpectrum *)&v13 init];
    if (result)
    {
      result->_realtimeContext.outputBinCount = a3;
      result->_streamToken = a4;
      result->_realtimeContext.sinkContext = a5;
      result->_realtimeContext.sinkCallback = a6;
      result->_realtimeContext.averageLevel = -120.0;
      result->_realtimeContext.streamToken = a4;
    }
  }
  else
  {

    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        v17 = "-[VCAudioPowerSpectrum initWithBinCount:streamToken:sinkContext:sinkCallback:]";
        __int16 v18 = 1024;
        int v19 = 35;
        __int16 v20 = 1024;
        unsigned int v21 = a3;
        __int16 v22 = 2048;
        v23 = a5;
        __int16 v24 = 2048;
        v25 = a6;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d Power spectrum initialzed with incorrect arguments: binCount[%d] sinkContext[%p] sinkCallback[%p]!", buf, 0x36u);
      }
    }
    return 0;
  }
  return result;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  _VCAudioPowerSpectrum_CleanUp((uint64_t)&self->_realtimeContext);
  v3.receiver = self;
  v3.super_class = (Class)VCAudioPowerSpectrum;
  [(VCAudioPowerSpectrum *)&v3 dealloc];
}

- (void)realtimeContext
{
  return &self->_realtimeContext;
}

- (_VCRange)frequencyRange
{
  float min = self->_realtimeContext.frequencyRange.min;
  float max = self->_realtimeContext.frequencyRange.max;
  result.float max = max;
  result.float min = min;
  return result;
}

- (NSString)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = objc_msgSend(v3, "initWithFormat:", @"%@: [%f;%f] : ",
                 NSStringFromClass(v4),
                 self->_realtimeContext.frequencyRange.min,
                 self->_realtimeContext.frequencyRange.max);
  if (self->_realtimeContext.format.mChannelsPerFrame)
  {
    unint64_t v6 = 0;
    do
    {
      channels = self->_realtimeContext.channels;
      objc_msgSend(v5, "appendFormat:", @"\n channel[%d] bins:", v6);
      v8 = (char *)channels + 112 * v6;
      int v10 = *((_DWORD *)v8 + 24);
      v9 = (unsigned int *)(v8 + 96);
      if (v10)
      {
        unsigned int v11 = 0;
        v12 = (float *)(*((void *)channels + 14 * v6 + 13) + 8);
        do
        {
          objc_msgSend(v5, "appendFormat:", @"[%f;%f;%f]", *v12, *(v12 - 2), *(v12 - 1));
          ++v11;
          v12 += 3;
        }
        while (v11 < *v9);
      }
      ++v6;
    }
    while (v6 < self->_realtimeContext.format.mChannelsPerFrame);
  }

  return (NSString *)v5;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

@end