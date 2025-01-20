@interface AVAudioMixingDestination
- (AVAudio3DPoint)position;
- (AVAudioConnectionPoint)connectionPoint;
- (AVAudioMixingDestination)init;
- (AVAudioMixingDestination)initWithImpl:(AVAudioMixingImpl *)a3;
- (AVAudioMixingImpl)implementation;
- (float)obstruction;
- (float)occlusion;
- (float)pan;
- (float)rate;
- (float)reverbBlend;
- (float)volume;
- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4;
- (int64_t)pointSourceInHeadMode;
- (int64_t)renderingAlgorithm;
- (int64_t)sourceMode;
- (void)dealloc;
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

@implementation AVAudioMixingDestination

- (float)occlusion
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 15);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 104))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)obstruction
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 14);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 96))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (AVAudio3DPoint)position
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v10, *((void *)self->_impl + 1));
  impl = (float *)self->_impl;
  float v4 = impl[11];
  float v5 = impl[12];
  float v6 = impl[13];
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v8, *((void *)self->_impl + 1));
  (*(void (**)(void *, float, float, float))(*(void *)self->_impl + 88))(self->_impl, x, y, z);
  if (v11) {
    std::recursive_mutex::unlock(v10);
  }
  if (v9)
  {
    float v7 = v8;
    std::recursive_mutex::unlock(v7);
  }
}

- (float)reverbBlend
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 10);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 80))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)rate
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 9);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 72))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (int64_t)pointSourceInHeadMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  int64_t v3 = *((unsigned int *)self->_impl + 8);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(void *)self->_impl + 64))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (int64_t)sourceMode
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  int64_t v3 = *((unsigned int *)self->_impl + 7);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(void *)self->_impl + 56))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (int64_t)renderingAlgorithm
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  int64_t v3 = *((unsigned int *)self->_impl + 6);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, int64_t))(*(void *)self->_impl + 48))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)pan
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 5);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 40))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (float)volume
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = *((float *)self->_impl + 4);
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
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v6, *((void *)self->_impl + 1));
  (*(void (**)(void *, float))(*(void *)self->_impl + 32))(self->_impl, a3);
  if (v9) {
    std::recursive_mutex::unlock(v8);
  }
  if (v7)
  {
    float v5 = v6;
    std::recursive_mutex::unlock(v5);
  }
}

- (AVAudioConnectionPoint)connectionPoint
{
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v5, *((void *)self->_impl + 1));
  float v3 = (AVAudioConnectionPoint *)(*(uint64_t (**)(void *))(*(void *)self->_impl + 24))(self->_impl);
  if (v8) {
    std::recursive_mutex::unlock(v7);
  }
  if (v6) {
    std::recursive_mutex::unlock(v5);
  }
  return v3;
}

- (id)destinationForMixer:(id)a3 bus:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  AVAudioNodeImplBase::GetAttachAndEngineLock((AVAudioNodeImplBase *)&v13, *((void *)self->_impl + 1));
  if (!a3)
  {
    if (AVAudioEngineLogCategory(void)::once != -1) {
      dispatch_once(&AVAudioEngineLogCategory(void)::once, &__block_literal_global_8600);
    }
    char v7 = *(NSObject **)AVAudioEngineLogCategory(void)::category;
    if (os_log_type_enabled(*(os_log_t *)AVAudioEngineLogCategory(void)::category, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316418;
      v18 = "AVAEInternal.h";
      __int16 v19 = 1024;
      int v20 = 71;
      __int16 v21 = 2080;
      v22 = "AVAudioNode.mm";
      __int16 v23 = 1024;
      int v24 = 492;
      __int16 v25 = 2080;
      v26 = "-[AVAudioMixingDestination destinationForMixer:bus:]";
      __int16 v27 = 2080;
      v28 = "mixer";
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d required condition is false: [%s:%d:%s: (%s)]", buf, 0x36u);
    }
    objc_msgSend(MEMORY[0x1E4F1CA00], "raise:format:", @"com.apple.coreaudio.avfaudio", @"required condition is false: %s", "mixer");
  }
  impl = self->_impl;
  uint64_t v9 = [a3 impl];
  uint64_t v10 = (*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v9 + 240))(v9, a4);
  int v11 = (*(uint64_t (**)(void *, id, uint64_t))(*(void *)impl + 16))(impl, a3, v10);
  if (v16) {
    std::recursive_mutex::unlock(v15);
  }
  if (v14) {
    std::recursive_mutex::unlock(v13);
  }
  if (v11) {
    return self;
  }
  else {
    return 0;
  }
}

- (AVAudioMixingImpl)implementation
{
  return (AVAudioMixingImpl *)self->_impl;
}

- (void)dealloc
{
  impl = self->_impl;
  if (impl) {
    (*(void (**)(void *, SEL))(*(void *)impl + 8))(impl, a2);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAudioMixingDestination;
  [(AVAudioMixingDestination *)&v4 dealloc];
}

- (AVAudioMixingDestination)init
{
  return 0;
}

- (AVAudioMixingDestination)initWithImpl:(AVAudioMixingImpl *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AVAudioMixingDestination;
  objc_super v4 = [(AVAudioMixingDestination *)&v7 init];
  float v5 = v4;
  if (v4)
  {
    v4->_impl = a3;
  }
  else if (a3)
  {
    (*((void (**)(AVAudioMixingImpl *))a3->var0 + 1))(a3);
  }
  return v5;
}

@end