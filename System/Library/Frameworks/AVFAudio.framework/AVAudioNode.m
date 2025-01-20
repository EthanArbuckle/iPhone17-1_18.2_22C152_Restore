@interface AVAudioNode
- (AUAudioUnit)AUAudioUnit;
- (AVAudio3DPoint)position;
- (AVAudioEngine)engine;
- (AVAudioFormat)inputFormatForBus:(AVAudioNodeBus)bus;
- (AVAudioFormat)outputFormatForBus:(AVAudioNodeBus)bus;
- (AVAudioNode)init;
- (AVAudioNode)initWithImpl:(void *)a3;
- (AVAudioTime)lastRenderTime;
- (BOOL)resetImpl:(void *)a3;
- (BOOL)setInputFormat:(id)a3 forBus:(unint64_t)a4;
- (BOOL)setOutputFormat:(id)a3 forBus:(unint64_t)a4;
- (NSString)nameForInputBus:(AVAudioNodeBus)bus;
- (NSString)nameForOutputBus:(AVAudioNodeBus)bus;
- (NSTimeInterval)latency;
- (NSTimeInterval)outputPresentationLatency;
- (NSUInteger)numberOfInputs;
- (NSUInteger)numberOfOutputs;
- (OpaqueAudioComponentInstance)audioUnit;
- (float)obstruction;
- (float)occlusion;
- (float)pan;
- (float)rate;
- (float)reverbBlend;
- (float)volume;
- (id)clock;
- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4;
- (int64_t)pointSourceInHeadMode;
- (int64_t)renderingAlgorithm;
- (int64_t)sourceMode;
- (void)dealloc;
- (void)didAttachToEngine:(id)a3;
- (void)didDetachFromEngine:(id)a3 error:(id *)a4;
- (void)impl;
- (void)installTapOnBus:(AVAudioNodeBus)bus bufferSize:(AVAudioFrameCount)bufferSize format:(AVAudioFormat *)format block:(AVAudioNodeTapBlock)tapBlock;
- (void)removeTapOnBus:(AVAudioNodeBus)bus;
- (void)reset;
- (void)setNumberOfInputs:(unsigned int)a3;
- (void)setNumberOfOutputs:(unsigned int)a3;
- (void)setObstruction:(float)a3;
- (void)setOcclusion:(float)a3;
- (void)setPan:(float)a3;
- (void)setPointSourceInHeadMode:(int64_t)a3;
- (void)setPosition:(AVAudio3DPoint)a3;
- (void)setRate:(float)a3;
- (void)setRenderingAlgorithm:(int64_t)a3;
- (void)setReverbBlend:(float)a3;
- (void)setSourceMode:(int64_t)a3;
- (void)setVolume:(float)a3;
@end

@implementation AVAudioNode

- (float)occlusion
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 60);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setOcclusion:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 104))(MixingImpl, a3);
  v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    v10 = (void *)*v7;
    char v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setOcclusion:v6];
        v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (float)obstruction
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 56);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setObstruction:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 96))(MixingImpl, a3);
  v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    v10 = (void *)*v7;
    char v8 = v7 + 1;
    v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setObstruction:v6];
        v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            v9 = v12;
          }
          while (!v13);
        }
        v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (AVAudio3DPoint)position
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, (uint64_t)self->_impl);
  uint64_t MixingImpl = (float *)AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  float v4 = MixingImpl[11];
  float v5 = MixingImpl[12];
  float v6 = MixingImpl[13];
  if (v13) {
    std::recursive_mutex::unlock(v12);
  }
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  float v7 = v4;
  float v8 = v5;
  float v9 = v6;
  result.z = v9;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setPosition:(AVAudio3DPoint)a3
{
  float z = a3.z;
  float y = a3.y;
  float x = a3.x;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v19, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float, float, float))(*(void *)MixingImpl + 88))(MixingImpl, x, y, z);
  char v11 = (void *)*((void *)self->_impl + 8);
  if (v11)
  {
    v14 = (void *)*v11;
    v12 = v11 + 1;
    char v13 = v14;
    if (v14 != v12)
    {
      do
      {
        *(float *)&double v8 = x;
        *(float *)&double v9 = y;
        *(float *)&double v10 = z;
        objc_msgSend((id)v13[6], "setPosition:", v8, v9, v10);
        v15 = (void *)v13[1];
        if (v15)
        {
          do
          {
            char v16 = v15;
            v15 = (void *)*v15;
          }
          while (v15);
        }
        else
        {
          do
          {
            char v16 = (void *)v13[2];
            BOOL v17 = *v16 == (void)v13;
            char v13 = v16;
          }
          while (!v17);
        }
        char v13 = v16;
      }
      while (v16 != v12);
    }
  }
  if (v22) {
    std::recursive_mutex::unlock(v21);
  }
  if (v20)
  {
    char v18 = v19;
    std::recursive_mutex::unlock(v18);
  }
}

- (float)reverbBlend
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 40);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setReverbBlend:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 80))(MixingImpl, a3);
  float v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    double v10 = (void *)*v7;
    char v8 = v7 + 1;
    double v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setReverbBlend:v6];
        char v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            char v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            double v9 = v12;
          }
          while (!v13);
        }
        double v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (float)rate
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 36);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setRate:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 72))(MixingImpl, a3);
  float v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    double v10 = (void *)*v7;
    char v8 = v7 + 1;
    double v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setRate:v6];
        char v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            v12 = v11;
            char v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            double v9 = v12;
          }
          while (!v13);
        }
        double v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (int64_t)pointSourceInHeadMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  int64_t v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 32);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setPointSourceInHeadMode:(int64_t)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(void *)MixingImpl + 64))(MixingImpl, a3);
  char v6 = (void *)*((void *)self->_impl + 8);
  if (v6)
  {
    double v9 = (void *)*v6;
    float v7 = v6 + 1;
    char v8 = v9;
    if (v9 != v7)
    {
      do
      {
        [(id)v8[6] setPointSourceInHeadMode:a3];
        double v10 = (void *)v8[1];
        if (v10)
        {
          do
          {
            char v11 = v10;
            double v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            char v11 = (void *)v8[2];
            BOOL v12 = *v11 == (void)v8;
            char v8 = v11;
          }
          while (!v12);
        }
        char v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15)
  {
    BOOL v13 = v14;
    std::recursive_mutex::unlock(v13);
  }
}

- (int64_t)sourceMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  int64_t v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 28);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setSourceMode:(int64_t)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(void *)MixingImpl + 56))(MixingImpl, a3);
  char v6 = (void *)*((void *)self->_impl + 8);
  if (v6)
  {
    double v9 = (void *)*v6;
    float v7 = v6 + 1;
    char v8 = v9;
    if (v9 != v7)
    {
      do
      {
        [(id)v8[6] setSourceMode:a3];
        double v10 = (void *)v8[1];
        if (v10)
        {
          do
          {
            char v11 = v10;
            double v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            char v11 = (void *)v8[2];
            BOOL v12 = *v11 == (void)v8;
            char v8 = v11;
          }
          while (!v12);
        }
        char v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15)
  {
    BOOL v13 = v14;
    std::recursive_mutex::unlock(v13);
  }
}

- (int64_t)renderingAlgorithm
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  int64_t v3 = *(unsigned int *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 24);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setRenderingAlgorithm:(int64_t)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, int64_t))(*(void *)MixingImpl + 48))(MixingImpl, a3);
  char v6 = (void *)*((void *)self->_impl + 8);
  if (v6)
  {
    double v9 = (void *)*v6;
    float v7 = v6 + 1;
    char v8 = v9;
    if (v9 != v7)
    {
      do
      {
        [(id)v8[6] setRenderingAlgorithm:a3];
        double v10 = (void *)v8[1];
        if (v10)
        {
          do
          {
            char v11 = v10;
            double v10 = (void *)*v10;
          }
          while (v10);
        }
        else
        {
          do
          {
            char v11 = (void *)v8[2];
            BOOL v12 = *v11 == (void)v8;
            char v8 = v11;
          }
          while (!v12);
        }
        char v8 = v11;
      }
      while (v11 != v7);
    }
  }
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15)
  {
    BOOL v13 = v14;
    std::recursive_mutex::unlock(v13);
  }
}

- (float)pan
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 20);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setPan:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 40))(MixingImpl, a3);
  float v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    double v10 = (void *)*v7;
    char v8 = v7 + 1;
    double v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setPan:v6];
        char v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            BOOL v12 = v11;
            char v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            BOOL v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            double v9 = v12;
          }
          while (!v13);
        }
        double v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (float)volume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = *(float *)(AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl) + 16);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)setVolume:(float)a3
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v15, (uint64_t)self->_impl);
  uint64_t MixingImpl = AVAudioNodeImplBase::GetMixingImpl((AVAudioNodeImplBase *)self->_impl);
  (*(void (**)(uint64_t, float))(*(void *)MixingImpl + 32))(MixingImpl, a3);
  float v7 = (void *)*((void *)self->_impl + 8);
  if (v7)
  {
    double v10 = (void *)*v7;
    char v8 = v7 + 1;
    double v9 = v10;
    if (v10 != v8)
    {
      do
      {
        *(float *)&double v6 = a3;
        [(id)v9[6] setVolume:v6];
        char v11 = (void *)v9[1];
        if (v11)
        {
          do
          {
            BOOL v12 = v11;
            char v11 = (void *)*v11;
          }
          while (v11);
        }
        else
        {
          do
          {
            BOOL v12 = (void *)v9[2];
            BOOL v13 = *v12 == (void)v9;
            double v9 = v12;
          }
          while (!v13);
        }
        double v9 = v12;
      }
      while (v12 != v8);
    }
  }
  if (v18) {
    std::recursive_mutex::unlock(v17);
  }
  if (v16)
  {
    v14 = v15;
    std::recursive_mutex::unlock(v14);
  }
}

- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, (uint64_t)self->_impl);
  if (!a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    float v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      char v18 = "AVAEInternal.h";
      __int16 v19 = 1024;
      int v20 = 71;
      __int16 v21 = 2080;
      char v22 = "AVAudioNode.mm";
      __int16 v23 = 1024;
      int v24 = 230;
      __int16 v25 = 2080;
      v26 = "-[AVAudioNode destinationForMixer:bus:]";
      __int16 v27 = 2080;
      v28 = "mixer";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "mixer");
  }
  impl = (AVAudioNodeImplBase *)self->_impl;
  uint64_t v9 = [a3 impl];
  unsigned int v10 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v9 + 240))(v9, a4);
  MixingDestination = (void *)AVAudioNodeImplBase::GetMixingDestination(impl, (AVAudioNode *)a3, v10);
  if (v16) {
    std::recursive_mutex::unlock(v15);
  }
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  return MixingDestination;
}

- (AUAudioUnit)AUAudioUnit
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = (AUAudioUnit *)(*(uint64_t (**)(void *))(*(void *)self->_impl + 232))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (OpaqueAudioComponentInstance)audioUnit
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  float v3 = (OpaqueAudioComponentInstance *)(*(uint64_t (**)(void *))(*(void *)self->_impl + 224))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)impl
{
  return self->_impl;
}

- (void)removeTapOnBus:(AVAudioNodeBus)bus
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  float v5 = [(AVAudioNode *)self engine];
  if (!v5)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v6 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      BOOL v12 = "AVAEInternal.h";
      __int16 v13 = 1024;
      int v14 = 71;
      __int16 v15 = 2080;
      char v16 = "AVAudioNode.mm";
      __int16 v17 = 1024;
      int v18 = 194;
      __int16 v19 = 2080;
      int v20 = "-[AVAudioNode removeTapOnBus:]";
      __int16 v21 = 2080;
      char v22 = "NULL != engine";
      _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "NULL != engine");
  }
  AVAudioEngineImpl::RemoveTapOnNode((AVAudioEngineImpl *)[(AVAudioEngine *)v5 implementation], self, bus);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
}

- (void)installTapOnBus:(AVAudioNodeBus)bus bufferSize:(AVAudioFrameCount)bufferSize format:(AVAudioFormat *)format block:(AVAudioNodeTapBlock)tapBlock
{
  uint64_t v8 = *(void *)&bufferSize;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (!tapBlock)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v11 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v19 = "AVAEInternal.h";
      __int16 v20 = 1024;
      int v21 = 71;
      __int16 v22 = 2080;
      uint64_t v23 = "AVAudioNode.mm";
      __int16 v24 = 1024;
      int v25 = 180;
      __int16 v26 = 2080;
      __int16 v27 = "-[AVAudioNode installTapOnBus:bufferSize:format:block:]";
      __int16 v28 = 2080;
      uint64_t v29 = "tapBlock";
      _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "tapBlock");
  }
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v14, (uint64_t)self->_impl);
  BOOL v12 = [(AVAudioNode *)self engine];
  if (!v12)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    __int16 v13 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      __int16 v19 = "AVAEInternal.h";
      __int16 v20 = 1024;
      int v21 = 71;
      __int16 v22 = 2080;
      uint64_t v23 = "AVAudioNode.mm";
      __int16 v24 = 1024;
      int v25 = 185;
      __int16 v26 = 2080;
      __int16 v27 = "-[AVAudioNode installTapOnBus:bufferSize:format:block:]";
      __int16 v28 = 2080;
      uint64_t v29 = "NULL != engine";
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "NULL != engine");
  }
  AVAudioEngineImpl::InstallTapOnNode((char **)[(AVAudioEngine *)v12 implementation], self, bus, v8, format, (uint64_t)tapBlock);
  if (v17) {
    std::recursive_mutex::unlock(v16);
  }
  if (v15) {
    std::recursive_mutex::unlock(v14);
  }
}

- (void)setNumberOfOutputs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  (*(void (**)(void *, uint64_t))(*(void *)self->_impl + 120))(self->_impl, v3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (void)setNumberOfInputs:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, (uint64_t)self->_impl);
  (*(void (**)(void *, uint64_t))(*(void *)self->_impl + 112))(self->_impl, v3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (NSUInteger)numberOfOutputs
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  unsigned int v3 = (*(uint64_t (**)(void *))(*(void *)self->_impl + 104))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (NSUInteger)numberOfInputs
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  unsigned int v3 = (*(uint64_t (**)(void *))(*(void *)self->_impl + 96))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioEngine)engine
{
  v2 = (AVAudioEngine **)*((void *)self->_impl + 1);
  if (v2) {
    return *v2;
  }
  else {
    return 0;
  }
}

- (NSTimeInterval)outputPresentationLatency
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  double v3 = (*(double (**)(void *))(*(void *)self->_impl + 400))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (NSTimeInterval)latency
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  double v3 = (*(double (**)(void *))(*(void *)self->_impl + 384))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (AVAudioTime)lastRenderTime
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  double v3 = (AVAudioTime *)(*(uint64_t (**)(void *))(*(void *)self->_impl + 360))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (id)clock
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, (uint64_t)self->_impl);
  double v3 = (void *)(*(uint64_t (**)(void *))(*(void *)self->_impl + 352))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (void)reset
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v4, (uint64_t)self->_impl);
  (*(void (**)(void *))(*(void *)self->_impl + 88))(self->_impl);
  if (v7) {
    std::recursive_mutex::unlock(v6);
  }
  if (v5)
  {
    double v3 = v4;
    std::recursive_mutex::unlock(v3);
  }
}

- (NSString)nameForOutputBus:(AVAudioNodeBus)bus
{
  return 0;
}

- (NSString)nameForInputBus:(AVAudioNodeBus)bus
{
  return 0;
}

- (void)didDetachFromEngine:(id)a3 error:(id *)a4
{
  uint64_t v7 = [a3 implementation];
  char v8 = (std::recursive_mutex *)((char *)self->_impl + 104);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v8, (std::recursive_mutex *)(v7 + 112));
  uint64_t v9 = AVAudioEngineGraph::RemoveNode(*(uint64_t ****)(v7 + 8), self, (NSError **)a4);
  _AVAE_CheckNoErr("/Library/Caches/com.apple.xbs/Sources/AVFAudio/Source/AVFAudio/AVAudioEngine/AVAudioEngine.mm", 1527, "DestroyGraphNode", "_graph->RemoveNode(inNode, outErr)", v9, (NSError **)a4);
  (*(void (**)(void *, id))(*(void *)self->_impl + 24))(self->_impl, a3);
  std::recursive_mutex::unlock(v8);

  std::recursive_mutex::unlock((std::recursive_mutex *)(v7 + 112));
}

- (void)didAttachToEngine:(id)a3
{
  uint64_t v5 = [a3 implementation];
  char v6 = (std::recursive_mutex *)((char *)self->_impl + 104);
  std::lock[abi:ne180100]<std::recursive_mutex,std::recursive_mutex>(v6, (std::recursive_mutex *)(v5 + 112));
  AVAudioEngineGraph::AddNode(*(AVAudioEngineGraph **)(v5 + 8), self);
  (*(void (**)(void *, id))(*(void *)self->_impl + 16))(self->_impl, a3);
  std::recursive_mutex::unlock(v6);

  std::recursive_mutex::unlock((std::recursive_mutex *)(v5 + 112));
}

- (BOOL)setInputFormat:(id)a3 forBus:(unint64_t)a4
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->_impl);
  char v7 = (*(uint64_t (**)(void *, unint64_t, id))(*(void *)self->_impl + 80))(self->_impl, a4, a3);
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v7;
}

- (AVAudioFormat)inputFormatForBus:(AVAudioNodeBus)bus
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  uint64_t v5 = (AVAudioFormat *)(*(uint64_t (**)(void *, AVAudioNodeBus))(*(void *)self->_impl + 72))(self->_impl, bus);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (BOOL)setOutputFormat:(id)a3 forBus:(unint64_t)a4
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v9, (uint64_t)self->_impl);
  char v7 = (*(uint64_t (**)(void *, unint64_t, id))(*(void *)self->_impl + 64))(self->_impl, a4, a3);
  if (v12) {
    std::recursive_mutex::unlock(v11);
  }
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  return v7;
}

- (AVAudioFormat)outputFormatForBus:(AVAudioNodeBus)bus
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v7, (uint64_t)self->_impl);
  uint64_t v5 = (AVAudioFormat *)(*(uint64_t (**)(void *, AVAudioNodeBus))(*(void *)self->_impl + 48))(self->_impl, bus);
  if (v10) {
    std::recursive_mutex::unlock(v9);
  }
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  return v5;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioNode;
  [(AVAudioNode *)&v4 dealloc];
}

- (BOOL)resetImpl:(void *)a3
{
  if (a3)
  {
    impl = self->_impl;
    if (impl != a3)
    {
      if (impl) {
        (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
      }
      self->_impl = a3;
    }
  }
  return a3 != 0;
}

- (AVAudioNode)init
{
  return [(AVAudioNode *)self initWithImpl:0];
}

- (AVAudioNode)initWithImpl:(void *)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)AVAudioNode;
    AVAudio3DPoint result = [(AVAudioNode *)&v5 init];
    if (result)
    {
      result->_impl = a3;
      return result;
    }
    (*(void (**)(void *))(*(void *)a3 + 8))(a3);
  }
  else
  {
  }
  return 0;
}

@end