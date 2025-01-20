@interface CSAudioCircularBuffer
- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5;
- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5 audioTimeConverter:(id)a6;
- (CSAudioTimeConverter)audioTimeConverter;
- (float)inputRecordingDuration;
- (id).cxx_construct;
- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3;
- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5;
- (id)copySamplesFromHostTime:(unint64_t)a3;
- (id)copybufferFrom:(unint64_t)a3 to:(unint64_t)a4;
- (unint64_t)bufferLength;
- (unint64_t)numInputChannels;
- (unint64_t)sampleCount;
- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4;
- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4 atHostTime:(unint64_t)a5;
- (void)reset;
- (void)setAudioTimeConverter:(id)a3;
- (void)setBufferLength:(unint64_t)a3;
- (void)setInputRecordingDuration:(float)a3;
- (void)setNumInputChannels:(unint64_t)a3;
@end

@implementation CSAudioCircularBuffer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioTimeConverter, 0);
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  self->_csAudioCircularBufferImpl.__ptr_.__value_ = 0;
  if (value)
  {
    std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned short>>::operator()[abi:ne180100](value);
  }
}

- (void)setInputRecordingDuration:(float)a3
{
  self->_inputRecordingDuration = a3;
}

- (void)setNumInputChannels:(unint64_t)a3
{
  self->_numInputChannels = a3;
}

- (void)setAudioTimeConverter:(id)a3
{
}

- (CSAudioTimeConverter)audioTimeConverter
{
  return self->_audioTimeConverter;
}

- (void)setBufferLength:(unint64_t)a3
{
  self->_bufferLength = a3;
}

- (unint64_t)bufferLength
{
  return self->_bufferLength;
}

- (unint64_t)sampleCount
{
  return *((void *)self->_csAudioCircularBufferImpl.__ptr_.__value_ + 4);
}

- (void)reset
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[CSAudioCircularBuffer reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s CSAudioCircularBuffer.reset", (uint8_t *)&v5, 0xCu);
  }
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  value[3] = 0;
  value[4] = 0;
}

- (id)copyBufferWithNumSamplesCopiedIn:(unint64_t *)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  unint64_t v6 = value[4];
  unint64_t v7 = value[2];
  BOOL v8 = v6 >= v7;
  uint64_t v9 = v6 - v7;
  if (v8) {
    uint64_t v10 = v9;
  }
  else {
    uint64_t v10 = 0;
  }
  v11 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v12 = *a3;
    int v17 = 136315906;
    v18 = "-[CSAudioCircularBuffer copyBufferWithNumSamplesCopiedIn:]";
    __int16 v19 = 2050;
    uint64_t v20 = v10;
    __int16 v21 = 2050;
    unint64_t v22 = v6;
    __int16 v23 = 2050;
    unint64_t v24 = v12;
    _os_log_impl(&dword_1BA1A5000, v11, OS_LOG_TYPE_DEFAULT, "%s copyBuffer: oldestSample: %{public}lu latestSample: %{public}lu, numSamplesCopied: %{public}lu", (uint8_t *)&v17, 0x2Au);
  }
  id v13 = [(CSAudioCircularBuffer *)self copySamplesFrom:v10 to:v6];
  v14 = v13;
  if (v13)
  {
    *a3 = [v13 numSamples];
    v15 = [v14 data];
  }
  else
  {
    v15 = 0;
    *a3 = 0;
  }

  return v15;
}

- (id)copybufferFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(&v11, (uint64_t)self->_csAudioCircularBufferImpl.__ptr_.__value_, a3, a4);
  uint64_t v7 = v11;
  if (v11)
  {
    BOOL v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v11 length:2 * (a4 - a3) * *(void *)self->_csAudioCircularBufferImpl.__ptr_.__value_];
    MEMORY[0x1BA9E6B20](v7, 0x1000C80BDFB0063);
  }
  else
  {
    uint64_t v9 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      id v13 = "-[CSAudioCircularBuffer copybufferFrom:to:]";
      __int16 v14 = 2050;
      unint64_t v15 = a3;
      __int16 v16 = 2050;
      unint64_t v17 = a4;
      __int16 v18 = 2050;
      uint64_t v19 = 0;
      _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    BOOL v8 = 0;
  }
  return v8;
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4 channelIdx:(unint64_t)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  value = self->_csAudioCircularBufferImpl.__ptr_.__value_;
  unint64_t v8 = value[2];
  unint64_t v9 = value[4];
  if (v9 >= v8) {
    unint64_t v10 = v9 - v8;
  }
  else {
    unint64_t v10 = 0;
  }
  if (v10 <= a3 && a4 > a3 && v9 >= a4 && v9 > a3 && v10 < a4) {
    operator new[]();
  }
  unint64_t v15 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v19 = "copySamples";
    __int16 v20 = 2050;
    unint64_t v21 = a3;
    __int16 v22 = 2050;
    unint64_t v23 = a4;
    __int16 v24 = 2050;
    unint64_t v25 = v10;
    __int16 v26 = 2050;
    unint64_t v27 = v9;
    _os_log_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
  }
  __int16 v16 = CSLogCategoryAudio;
  if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    uint64_t v19 = "-[CSAudioCircularBuffer copySamplesFrom:to:channelIdx:]";
    __int16 v20 = 2050;
    unint64_t v21 = a3;
    __int16 v22 = 2050;
    unint64_t v23 = a4;
    __int16 v24 = 2050;
    unint64_t v25 = 0;
    _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
  }
  return 0;
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  corespeech::CSAudioCircularBufferImpl<unsigned short>::copySamples(&v19, (uint64_t)self->_csAudioCircularBufferImpl.__ptr_.__value_, a3, a4);
  uint64_t v7 = v19;
  if (v19)
  {
    uint64_t v8 = *(void *)self->_csAudioCircularBufferImpl.__ptr_.__value_;
    unint64_t v9 = a4 - a3;
    unint64_t v10 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v19 length:2 * (a4 - a3) * v8];
    audioTimeConverter = self->_audioTimeConverter;
    if (audioTimeConverter) {
      uint64_t v12 = [(CSAudioTimeConverter *)audioTimeConverter hostTimeFromSampleCount:a3];
    }
    else {
      uint64_t v12 = 0;
    }
    unint64_t v15 = [CSAudioChunk alloc];
    LOBYTE(v18) = +[CSConfig inputRecordingIsFloat];
    LOBYTE(v17) = 1;
    __int16 v14 = [(CSAudioChunk *)v15 initWithData:v10 numChannels:v8 numSamples:v9 sampleByteDepth:2 startSampleCount:a3 hostTime:v12 arrivalHostTimeToAudioRecorder:0 wasBuffered:v17 remoteVAD:0 isFloat:v18];

    MEMORY[0x1BA9E6B20](v7, 0x1000C80BDFB0063);
  }
  else
  {
    id v13 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      unint64_t v21 = "-[CSAudioCircularBuffer copySamplesFrom:to:]";
      __int16 v22 = 2050;
      unint64_t v23 = a3;
      __int16 v24 = 2050;
      unint64_t v25 = a4;
      __int16 v26 = 2050;
      uint64_t v27 = 0;
      _os_log_impl(&dword_1BA1A5000, v13, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
    }
    return 0;
  }
  return v14;
}

- (id)copySamplesFromHostTime:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (*((void *)self->_csAudioCircularBufferImpl.__ptr_.__value_ + 4))
  {
    audioTimeConverter = self->_audioTimeConverter;
    if (audioTimeConverter) {
      uint64_t v5 = [(CSAudioTimeConverter *)audioTimeConverter sampleCountFromHostTime:a3];
    }
    else {
      uint64_t v5 = 0;
    }
    unint64_t v8 = [(CSAudioCircularBuffer *)self sampleCount];
    return [(CSAudioCircularBuffer *)self copySamplesFrom:v5 to:v8];
  }
  else
  {
    unint64_t v6 = CSLogCategoryAudio;
    if (os_log_type_enabled((os_log_t)CSLogCategoryAudio, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136315138;
      unint64_t v10 = "-[CSAudioCircularBuffer copySamplesFromHostTime:]";
      _os_log_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_DEFAULT, "%s Cannot copy samples since this is empty", (uint8_t *)&v9, 0xCu);
    }
    return 0;
  }
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4 atHostTime:(unint64_t)a5
{
  value = (unint64_t *)self->_csAudioCircularBufferImpl.__ptr_.__value_;
  unint64_t v7 = value[2];
  if (*value)
  {
    unint64_t v9 = 0;
    unint64_t v20 = a4 - v7;
    unint64_t __n = 2 * a4;
    do
    {
      unint64_t v10 = value[3];
      uint64_t v11 = *(char **)(value[6] + 8 * v9);
      uint64_t v12 = (char *)a3 + 2 * v9 * a4;
      unint64_t v13 = v7 - v10;
      unint64_t v14 = a4 - (v7 - v10);
      if (a4 <= v7 - v10)
      {
        memcpy(&v11[2 * v10], (char *)a3 + 2 * v9 * a4, __n);
        unint64_t v14 = v10 + a4;
      }
      else
      {
        if (a4 >= v7)
        {
          unint64_t v14 = (v10 + v20) % v7;
          uint64_t v18 = &v12[2 * v20];
          memcpy(&v11[2 * v14], v18, 2 * (v7 - v14));
          __int16 v16 = &v18[2 * (v7 - v14)];
          uint64_t v17 = v11;
          size_t v15 = 2 * v14;
        }
        else
        {
          memcpy(&v11[2 * v10], (char *)a3 + 2 * v9 * a4, 2 * v13);
          size_t v15 = 2 * v14;
          __int16 v16 = &v12[2 * v13];
          uint64_t v17 = v11;
        }
        memcpy(v17, v16, v15);
      }
      ++v9;
    }
    while (v9 < *value);
  }
  else
  {
    unint64_t v14 = value[3];
  }
  unint64_t v19 = value[4] + a4;
  value[3] = v14 % v7;
  value[4] = v19;
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4
{
  uint64_t v7 = mach_absolute_time();
  [(CSAudioCircularBuffer *)self addSamples:a3 numSamples:a4 atHostTime:v7];
}

- (float)inputRecordingDuration
{
  return self->_inputRecordingDuration;
}

- (unint64_t)numInputChannels
{
  return self->_numInputChannels;
}

- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5 audioTimeConverter:(id)a6
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v7 = a6;
  v9.receiver = self;
  v9.super_class = (Class)CSAudioCircularBuffer;
  if ([(CSAudioCircularBuffer *)&v9 init]) {
    operator new();
  }

  return 0;
}

- (CSAudioCircularBuffer)initWithNumChannels:(unint64_t)a3 recordingDuration:(float)a4 samplingRate:(float)a5
{
  return -[CSAudioCircularBuffer initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:](self, "initWithNumChannels:recordingDuration:samplingRate:audioTimeConverter:", a3, 0);
}

@end