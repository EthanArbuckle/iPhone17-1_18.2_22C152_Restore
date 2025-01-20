@interface CSRemoteVADCircularBuffer
- (CSRemoteVADCircularBuffer)initWithRecordingDuration:(float)a3 audioSamplesPerRemoteVAD:(int)a4 audioSampleRate:(float)a5;
- (id).cxx_construct;
- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4;
- (id)copySamplesFromAudioSampleCount:(unint64_t)a3 toAudioSampleCount:(unint64_t)a4;
- (unint64_t)beginSampleCount;
- (unint64_t)capacity;
- (unint64_t)remoteVADSampleCount;
- (unint64_t)size;
- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4;
- (void)reset;
@end

@implementation CSRemoteVADCircularBuffer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  self->_remoteVADCircularBufferImpl.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<corespeech::CSAudioCircularBufferImpl<unsigned char>>::operator()[abi:ne180100](value);
  }
}

- (unint64_t)beginSampleCount
{
  return self->_beginSampleCount;
}

- (unint64_t)size
{
  return self->_size;
}

- (unint64_t)capacity
{
  return self->_capacity;
}

- (id)copySamplesFrom:(unint64_t)a3 to:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  value = self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  unint64_t v7 = value[2];
  unint64_t v8 = value[4];
  if (v8 >= v7) {
    unint64_t v9 = v8 - v7;
  }
  else {
    unint64_t v9 = 0;
  }
  if (v9 <= a3 && a4 > a3 && v8 >= a4 && v8 > a3 && v9 < a4) {
    operator new[]();
  }
  v14 = (os_log_t *)MEMORY[0x1E4F5D158];
  v15 = *MEMORY[0x1E4F5D158];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F5D158], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316162;
    v19 = "copySamples";
    __int16 v20 = 2050;
    unint64_t v21 = a3;
    __int16 v22 = 2050;
    unint64_t v23 = a4;
    __int16 v24 = 2050;
    unint64_t v25 = v9;
    __int16 v26 = 2050;
    unint64_t v27 = v8;
    _os_log_impl(&dword_1C9338000, v15, OS_LOG_TYPE_DEFAULT, "%s Invalid request: reqStartSample=%{public}lu, reqEndSample=%{public}lu, oldestSampleInBuffer: %{public}lu, latestSampleInBuffer=%{public}lu", buf, 0x34u);
  }
  v16 = *v14;
  if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v19 = "-[CSRemoteVADCircularBuffer copySamplesFrom:to:]";
    __int16 v20 = 2050;
    unint64_t v21 = a3;
    __int16 v22 = 2050;
    unint64_t v23 = a4;
    __int16 v24 = 2050;
    unint64_t v25 = 0;
    _os_log_impl(&dword_1C9338000, v16, OS_LOG_TYPE_DEFAULT, "%s Could NOT copyFrom: %{public}lu to: %{public}lu, retSampleCount: %{public}lu", buf, 0x2Au);
  }
  return 0;
}

- (id)copySamplesFromAudioSampleCount:(unint64_t)a3 toAudioSampleCount:(unint64_t)a4
{
  return [(CSRemoteVADCircularBuffer *)self copySamplesFrom:a3 / self->_audioSamplesPerRemoteVAD to:a4 / self->_audioSamplesPerRemoteVAD];
}

- (unint64_t)remoteVADSampleCount
{
  return *((void *)self->_remoteVADCircularBufferImpl.__ptr_.__value_ + 4);
}

- (void)addSamples:(const void *)a3 numSamples:(unint64_t)a4
{
  value = (unint64_t *)self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  unint64_t v6 = value[2];
  if (*value)
  {
    unint64_t v7 = 0;
    unint64_t v8 = a4 - v6;
    unint64_t v9 = (char *)a3;
    do
    {
      unint64_t v10 = value[3];
      v11 = *(char **)(value[6] + 8 * v7);
      size_t v12 = a4 - (v6 - v10);
      if (a4 <= v6 - v10)
      {
        memcpy(&v11[v10], v9, a4);
        size_t v12 = v10 + a4;
      }
      else
      {
        if (a4 >= v6)
        {
          size_t v12 = (v10 + v8) % v6;
          memcpy(&v11[v12], &v9[v8], v6 - v12);
          v13 = (char *)a3 + v7 * a4 + v8 + v6 - v12;
        }
        else
        {
          memcpy(&v11[v10], v9, v6 - v10);
          v13 = &v9[v6 - v10];
        }
        memcpy(v11, v13, v12);
      }
      ++v7;
      v9 += a4;
    }
    while (v7 < *value);
  }
  else
  {
    size_t v12 = value[3];
  }
  unint64_t v14 = value[4] + a4;
  value[3] = v12 % v6;
  value[4] = v14;
}

- (void)reset
{
  value = self->_remoteVADCircularBufferImpl.__ptr_.__value_;
  value[3] = 0;
  value[4] = 0;
}

- (CSRemoteVADCircularBuffer)initWithRecordingDuration:(float)a3 audioSamplesPerRemoteVAD:(int)a4 audioSampleRate:(float)a5
{
  v6.receiver = self;
  v6.super_class = (Class)CSRemoteVADCircularBuffer;
  if ([(CSRemoteVADCircularBuffer *)&v6 init]) {
    operator new();
  }
  return 0;
}

@end