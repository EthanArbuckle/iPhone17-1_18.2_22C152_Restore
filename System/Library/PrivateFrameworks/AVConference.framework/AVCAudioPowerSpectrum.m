@interface AVCAudioPowerSpectrum
+ (BOOL)supportsSecureCoding;
- (AVCAudioPowerSpectrum)init;
- (AVCAudioPowerSpectrum)initWithCoder:(id)a3;
- (NSArray)channels;
- (float)maxFrequency;
- (float)minFrequency;
- (int64_t)sourceType;
- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4 channelID:(unsigned __int16)a5;
- (void)checkNumChannels:(unsigned __int16)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVCAudioPowerSpectrum

- (AVCAudioPowerSpectrum)init
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)AVCAudioPowerSpectrum;
  v2 = [(AVCAudioPowerSpectrum *)&v4 init];
  if (v2) {
    v2->_channels = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCAudioPowerSpectrum;
  [(AVCAudioPowerSpectrum *)&v3 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  *(float *)&double v3 = self->_minFrequency;
  [a3 encodeFloat:@"minFrequency" forKey:v3];
  *(float *)&double v6 = self->_maxFrequency;
  [a3 encodeFloat:@"maxFrequency" forKey:v6];
  channels = self->_channels;

  [a3 encodeObject:channels forKey:@"channels"];
}

- (AVCAudioPowerSpectrum)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)AVCAudioPowerSpectrum;
  uint64_t v4 = [(AVCAudioPowerSpectrum *)&v8 init];
  if (v4)
  {
    [a3 decodeFloatForKey:@"minFrequency"];
    v4->_minFrequency = v5;
    [a3 decodeFloatForKey:@"maxFrequency"];
    v4->_maxFrequency = v6;
    v4->_channels = (NSMutableArray *)(id)[a3 decodeObjectForKey:@"channels"];
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (float)minFrequency
{
  return self->_minFrequency;
}

- (float)maxFrequency
{
  return self->_maxFrequency;
}

- (NSArray)channels
{
  return &self->_channels->super;
}

- (int64_t)sourceType
{
  return self->_sourceType;
}

- (void)applyChannelBins:(_VCAudioPowerSpectrumEntry *)a3 binCount:(unsigned int)a4 channelID:(unsigned __int16)a5
{
  unsigned int v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableArray *)self->_channels count] > (unint64_t)a5)
  {
    objc_msgSend((id)-[NSMutableArray objectAtIndexedSubscript:](self->_channels, "objectAtIndexedSubscript:", v5), "applyChannelBins:binCount:", a3, v6);
    if (v6)
    {
      self->_minFrequency = a3->var0.min;
      self->_maxFrequency = a3[(v6 - 1)].var0.max;
    }
    return;
  }
  if ((AVCAudioPowerSpectrum *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return;
    }
    uint64_t v10 = VRTraceErrorLogLevelToCSTR();
    v11 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v12 = [(NSMutableArray *)self->_channels count];
    int v19 = 136316162;
    uint64_t v20 = v10;
    __int16 v21 = 2080;
    v22 = "-[AVCAudioPowerSpectrum(VCPrivateAccess) applyChannelBins:binCount:channelID:]";
    __int16 v23 = 1024;
    int v24 = 73;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = v5;
    *(_WORD *)&v26[4] = 2048;
    *(void *)&v26[6] = v12;
    v13 = " [%s] %s:%d Number of channels is incorrect (%d >= %lu)";
    v14 = v11;
    uint32_t v15 = 44;
LABEL_15:
    _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v19, v15);
    return;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v9 = (__CFString *)[(AVCAudioPowerSpectrum *)self performSelector:sel_logPrefix];
  }
  else {
    uint64_t v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(NSMutableArray *)self->_channels count];
      int v19 = 136316674;
      uint64_t v20 = v16;
      __int16 v21 = 2080;
      v22 = "-[AVCAudioPowerSpectrum(VCPrivateAccess) applyChannelBins:binCount:channelID:]";
      __int16 v23 = 1024;
      int v24 = 73;
      __int16 v25 = 2112;
      *(void *)v26 = v9;
      *(_WORD *)&v26[8] = 2048;
      *(void *)&v26[10] = self;
      __int16 v27 = 1024;
      unsigned int v28 = v5;
      __int16 v29 = 2048;
      uint64_t v30 = v18;
      v13 = " [%s] %s:%d %@(%p) Number of channels is incorrect (%d >= %lu)";
      v14 = v17;
      uint32_t v15 = 64;
      goto LABEL_15;
    }
  }
}

- (void)checkNumChannels:(unsigned __int16)a3
{
  unsigned int v3 = a3;
  for (unsigned int i = (unsigned __int16)[(NSMutableArray *)self->_channels count]; i < v3; ++i)
  {
    uint64_t v6 = objc_alloc_init(AVCAudioPowerSpectrumChannel);
    [(NSMutableArray *)self->_channels addObject:v6];
  }
  if ([(NSMutableArray *)self->_channels count] > (unint64_t)v3)
  {
    uint64_t v7 = [(NSMutableArray *)self->_channels count] - v3;
    channels = self->_channels;
    -[NSMutableArray removeObjectsInRange:](channels, "removeObjectsInRange:", v3, v7);
  }
}

@end