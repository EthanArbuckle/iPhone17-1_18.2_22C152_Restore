@interface CSAudioSpectralMeter
- (BOOL)enable;
- (CSAudioSpectralMeter)initWithSampleRate:(float)a3 windowSize:(unint64_t)a4;
- (id).cxx_construct;
- (id)getFrequencyMagnitudesResult;
- (void)dealloc;
- (void)processAudioChunk:(id)a3;
- (void)reset;
- (void)setEnable:(BOOL)a3;
- (void)setOutputFrequencyBandsInHz:(id)a3;
@end

@implementation CSAudioSpectralMeter

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
}

- (void)setEnable:(BOOL)a3
{
  self->_enable = a3;
}

- (BOOL)enable
{
  return self->_enable;
}

- (void)dealloc
{
  std::unique_ptr<CSAudioSpectralMeterImpl>::reset[abi:ne180100](&self->_spectralMeterImpl.__ptr_.__value_, 0);
  v3.receiver = self;
  v3.super_class = (Class)CSAudioSpectralMeter;
  [(CSAudioSpectralMeter *)&v3 dealloc];
}

- (id)getFrequencyMagnitudesResult
{
  FrequencyMagnitudesResult = (void *)CSAudioSpectralMeterImpl::getFrequencyMagnitudesResult(self->_spectralMeterImpl.__ptr_.__value_);
  if (FrequencyMagnitudesResult)
  {
    objc_super v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:(uint64_t)(FrequencyMagnitudesResult[1] - *FrequencyMagnitudesResult) >> 2];
    v5 = (_DWORD *)*FrequencyMagnitudesResult;
    v6 = (_DWORD *)FrequencyMagnitudesResult[1];
    if ((_DWORD *)*FrequencyMagnitudesResult != v6)
    {
      do
      {
        LODWORD(v4) = *v5;
        v7 = [NSNumber numberWithFloat:v4];
        [v3 addObject:v7];

        ++v5;
      }
      while (v5 != v6);
    }
    FrequencyMagnitudesResult = [MEMORY[0x1E4F1C978] arrayWithArray:v3];
  }
  return FrequencyMagnitudesResult;
}

- (void)processAudioChunk:(id)a3
{
  id v4 = a3;
  if (self->_enable)
  {
    id v7 = v4;
    v5 = [v4 dataForChannel:0];
    id v6 = +[CSFLPCMTypeConverter convertToFloatLPCMBufFromShortLPCMBuf:v5];
    CSAudioSpectralMeterImpl::processFloatBuffer(self->_spectralMeterImpl.__ptr_.__value_, (float *)[v6 bytes], objc_msgSend(v7, "numSamples"));

    id v4 = v7;
  }
}

- (void)setOutputFrequencyBandsInHz:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    std::vector<float>::vector(&buf, [v4 count]);
    for (unint64_t i = 0; i < [v4 count]; ++i)
    {
      id v6 = [v4 objectAtIndexedSubscript:i];
      [v6 floatValue];
      *(_DWORD *)(buf + 4 * i) = v7;
    }
    value = self->_spectralMeterImpl.__ptr_.__value_;
    memset(__p, 0, sizeof(__p));
    std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(__p, (const void *)buf, *((uint64_t *)&buf + 1), (uint64_t)(*((void *)&buf + 1) - buf) >> 2);
    CSAudioSpectralMeterImpl::setOutputFrequencyBandsInHz((std::vector<unsigned int> *)value, (uint64_t *)__p);
    if (__p[0]) {
      operator delete(__p[0]);
    }
    if ((void)buf)
    {
      *((void *)&buf + 1) = buf;
      operator delete((void *)buf);
    }
  }
  else
  {
    v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 136315138;
      *(void *)((char *)&buf + 4) = "-[CSAudioSpectralMeter setOutputFrequencyBandsInHz:]";
      _os_log_fault_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_FAULT, "%s setOutputBands array count must be greater than 0. Bail.", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (void)reset
{
  value = self->_spectralMeterImpl.__ptr_.__value_;
  *((void *)value + 14) = 0;
  *((void *)value + 5) = 0;
  uint64_t v3 = *((void *)value + 13);
  *(void *)(v3 + 24) = 0;
  *(void *)(v3 + 32) = 0;
}

- (CSAudioSpectralMeter)initWithSampleRate:(float)a3 windowSize:(unint64_t)a4
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CSAudioSpectralMeter;
  if ([(CSAudioSpectralMeter *)&v6 init]) {
    operator new();
  }
  id v4 = (CSAudioSpectralMeter *)0;

  return v4;
}

@end