@interface HSRecordingPlaybackStage
+ (Class)hsProxyClass;
- (BOOL)recordingCopyDataTo:(Writable *)a3;
- (HSRecordingPlaybackStage)init;
- (HSRecordingPlaybackStage)initWithPlaybackQueue:(id)a3;
- (float)playbackProgress;
- (id).cxx_construct;
- (id)HSRecordingPlaybackStageProxy_0mode;
- (id)HSRecordingPlaybackStageProxy_0playbackProgress;
- (id)HSRecordingPlaybackStageProxy_0recordingSize;
- (id)HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent:(id)a3;
- (id)HSRecordingPlaybackStageProxy_recordingSetMaxSize:(id)a3;
- (id)HSRecordingPlaybackStageProxy_setMode:(id)a3;
- (id)data;
- (int)_mode;
- (int)mode;
- (unint64_t)recordingSize;
- (void)_createRecordingBuffer;
- (void)_destroyRecordingBuffer;
- (void)_playbackHeartbeatTimerFired;
- (void)_setPlaybackTimerEnabled:(BOOL)a3;
- (void)clear;
- (void)handleConsume:(id)a3;
- (void)playbackLoadFromData:(id)a3;
- (void)playbackSetProgress:(float)a3 dispatchEvent:(BOOL)a4;
- (void)recordingSetMaxSize:(unint64_t)a3;
- (void)setConsumers:(id)a3;
- (void)setMode:(int)a3;
@end

@implementation HSRecordingPlaybackStage

- (void)handleConsume:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(HSStage *)v4->_state.recording consume:location[0]];
  objc_storeStrong(location, 0);
}

- (HSRecordingPlaybackStage)init
{
  v4 = [(HSRecordingPlaybackStage *)self initWithPlaybackQueue:0];
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (HSRecordingPlaybackStage)initWithPlaybackQueue:(id)a3
{
  id v24 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v24;
  id v24 = 0;
  v22.receiver = v3;
  v22.super_class = (Class)HSRecordingPlaybackStage;
  obj = [(HSStage *)&v22 init];
  id v24 = obj;
  objc_storeStrong(&v24, obj);
  if (obj)
  {
    HSUtil::ObjectLock::ObjectLock((uint64_t)v20, v24);
    uint64_t v11 = objc_opt_new();
    v4 = (void *)*((void *)v24 + 19);
    *((void *)v24 + 19) = v11;

    uint64_t v10 = objc_opt_new();
    v5 = (void *)*((void *)v24 + 20);
    *((void *)v24 + 20) = v10;

    objc_initWeak(&v19, v24);
    v9 = dispatch_get_global_queue(21, 0);
    v13 = _NSConcreteStackBlock;
    int v14 = -1073741824;
    int v15 = 0;
    v16 = __50__HSRecordingPlaybackStage_initWithPlaybackQueue___block_invoke;
    v17 = &unk_141240;
    objc_copyWeak(&v18, &v19);
    v6 = createPausedTimer(v9, &v13);
    v7 = (void *)*((void *)v24 + 18);
    *((void *)v24 + 18) = v6;

    v25 = (HSRecordingPlaybackStage *)v24;
    int v21 = 1;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v19);
    HSUtil::ObjectLock::~ObjectLock(v20);
  }
  else
  {
    v25 = 0;
    int v21 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v24, 0);
  return v25;
}

void __50__HSRecordingPlaybackStage_initWithPlaybackQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playbackHeartbeatTimerFired];
}

- (id)data
{
  v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  if ([(HSRecordingPlaybackStage *)v5 _mode] == 1) {
    id v6 = [(HSRecordingStage *)v5->_state.recording data];
  }
  else {
    id v6 = [(HSPlaybackStage *)v5->_state.playback data];
  }
  HSUtil::ObjectLock::~ObjectLock(v4);
  v2 = v6;

  return v2;
}

- (void)clear
{
  v4 = self;
  v3[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, self);
  unsigned int v2 = [(HSRecordingPlaybackStage *)v4 _mode];
  [(HSRecordingStage *)v4->_state.recording reset];
  [(HSPlaybackStage *)v4->_state.playback reset];
  if (v2 == 1) {
    [(HSRecordingStage *)v4->_state.recording setRecording:1];
  }
  else {
    [(HSRecordingPlaybackStage *)v4 _destroyRecordingBuffer];
  }
  HSUtil::ObjectLock::unlock(v3);
  [(HSStage *)v4 postNotification:HSRecordingPlaybackStageDataChanged];
  HSUtil::ObjectLock::~ObjectLock(v3);
}

- (int)mode
{
  v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  int v3 = [(HSRecordingPlaybackStage *)v5 _mode];
  HSUtil::ObjectLock::~ObjectLock(v4);
  return v3;
}

- (void)setMode:(int)a3
{
  uint64_t v11 = self;
  SEL v10 = a2;
  int v9 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v8, self);
  unsigned int v7 = [(HSRecordingPlaybackStage *)v11 _mode];
  if (v9 == v7)
  {
    int v6 = 1;
  }
  else
  {
    [(HSRecordingStage *)v11->_state.recording setRecording:0];
    [(HSPlaybackStage *)v11->_state.playback setPlaying:0];
    if (v7 == 1)
    {
      playback = v11->_state.playback;
      v4 = v5;
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v5, &v11->_state.recordingBuffer.__ptr_);
      [(HSPlaybackStage *)playback loadFromSource:v5];
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v5);
    }
    if (v9 == 1)
    {
      [(HSPlaybackStage *)v11->_state.playback reset];
      if (!std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)&v11->_state.recordingBuffer)) {
        [(HSRecordingPlaybackStage *)v11 _createRecordingBuffer];
      }
      -[HSRecordingStage setRecording:](v11->_state.recording, "setRecording:", 1, playback, v4);
    }
    else if (v9 == 2)
    {
      [(HSPlaybackStage *)v11->_state.playback setPlaying:1];
      [(HSRecordingPlaybackStage *)v11 _setPlaybackTimerEnabled:1];
    }
    HSUtil::ObjectLock::unlock(v8);
    [(HSStage *)v11 postNotification:HSRecordingPlaybackStageDataChanged];
    int v6 = 0;
  }
  HSUtil::ObjectLock::~ObjectLock(v8);
}

- (void)recordingSetMaxSize:(unint64_t)a3
{
  int v6 = self;
  SEL v5 = a2;
  unint64_t v4 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, self);
  v6->_state.recordingMaxSize = v4;
  if ([(HSRecordingPlaybackStage *)v6 _mode] == 1) {
    [(HSRecordingPlaybackStage *)v6 _createRecordingBuffer];
  }
  else {
    [(HSRecordingPlaybackStage *)v6 _destroyRecordingBuffer];
  }
  HSUtil::ObjectLock::unlock(v3);
  [(HSStage *)v6 postNotification:HSRecordingPlaybackStageDataChanged];
  HSUtil::ObjectLock::~ObjectLock(v3);
}

- (unint64_t)recordingSize
{
  SEL v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  unint64_t v3 = [(HSRecordingStage *)v5->_state.recording size];
  HSUtil::ObjectLock::~ObjectLock(v4);
  return v3;
}

- (BOOL)recordingCopyDataTo:(Writable *)a3
{
  v8 = self;
  SEL v7 = a2;
  int v6 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  unsigned __int8 v4 = [(HSRecordingStage *)v8->_state.recording copyDataTo:v6];
  HSUtil::ObjectLock::~ObjectLock(v5);
  return v4 & 1;
}

- (void)playbackLoadFromData:(id)a3
{
  SEL v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, v5);
  [(HSPlaybackStage *)v5->_state.playback reset];
  [(HSRecordingStage *)v5->_state.recording reset];
  [(HSRecordingPlaybackStage *)v5 _destroyRecordingBuffer];
  [(HSPlaybackStage *)v5->_state.playback loadFromData:location[0]];
  HSUtil::ObjectLock::unlock(v3);
  [(HSStage *)v5 postNotification:HSRecordingPlaybackStageDataChanged];
  HSUtil::ObjectLock::~ObjectLock(v3);
  objc_storeStrong(location, 0);
}

- (float)playbackProgress
{
  int v6 = self;
  id v5[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  unsigned int v4 = [(HSRecordingPlaybackStage *)v6 _mode];
  if (v4 && v4 != 2)
  {
    float v7 = 0.0;
  }
  else
  {
    [(HSPlaybackStage *)v6->_state.playback progress];
    float v7 = v2;
  }
  HSUtil::ObjectLock::~ObjectLock(v5);
  return v7;
}

- (void)playbackSetProgress:(float)a3 dispatchEvent:(BOOL)a4
{
  int v9 = self;
  SEL v8 = a2;
  float v7 = a3;
  BOOL v6 = a4;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  *(float *)&double v4 = v7;
  [(HSPlaybackStage *)v9->_state.playback setProgress:v6 dispatchEvent:v4];
  HSUtil::ObjectLock::unlock(v5);
  [(HSStage *)v9 postNotification:HSRecordingPlaybackStageChanged];
  HSUtil::ObjectLock::~ObjectLock(v5);
}

- (void)setConsumers:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, v6);
  v3.receiver = v6;
  v3.super_class = (Class)HSRecordingPlaybackStage;
  [(HSStage *)&v3 setConsumers:location[0]];
  [(HSStage *)v6->_state.recording setConsumers:location[0]];
  [(HSStage *)v6->_state.playback setConsumers:location[0]];
  HSUtil::ObjectLock::~ObjectLock(v4);
  objc_storeStrong(location, 0);
}

- (int)_mode
{
  if ([(HSRecordingStage *)self->_state.recording recording]) {
    return 1;
  }
  if ([(HSPlaybackStage *)self->_state.playback playing]) {
    return 2;
  }
  return 0;
}

- (void)_destroyRecordingBuffer
{
  SEL v5 = self;
  id v4[2] = a2;
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v4);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)&v5->_state.recordingBuffer, v4);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
  recording = v5->_state.recording;
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v3);
  [(HSRecordingStage *)recording setDestination:v3 maxSize:0];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v3);
}

- (void)_createRecordingBuffer
{
  SEL v10 = self;
  v9[2] = a2;
  [(HSRecordingPlaybackStage *)self _destroyRecordingBuffer];
  createRecordingBuffer(v10->_state.recordingMaxSize, v9);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)&v10->_state.recordingBuffer, v9);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v9);
  id location = &_os_log_default;
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    float v2 = (HSUtil::Buffer *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&v10->_state.recordingBuffer);
    uint64_t v5 = HSUtil::Buffer::capacity(v2);
    __os_log_helper_16_0_1_8_0((uint64_t)v11, v5);
    _os_log_impl(&def_411C8, (os_log_t)location, v7, "Created recording buffer with size 0x%zx", v11, 0xCu);
  }
  objc_storeStrong(&location, 0);
  recording = v10->_state.recording;
  std::shared_ptr<HSUtil::IO::Writable>::shared_ptr[abi:ne180100]<HSUtil::Buffer,void>(v6, &v10->_state.recordingBuffer.__ptr_);
  objc_super v3 = (HSUtil::Buffer *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&v10->_state.recordingBuffer);
  [(HSRecordingStage *)recording setDestination:v6 maxSize:HSUtil::Buffer::capacity(v3)];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v6);
}

- (void)_setPlaybackTimerEnabled:(BOOL)a3
{
  if (a3) {
    dispatch_source_set_timer((dispatch_source_t)self->_state.playbackHeartbeatTimer, 0, 0x5F5E100uLL, 0);
  }
  else {
    dispatch_source_set_timer((dispatch_source_t)self->_state.playbackHeartbeatTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  }
}

- (void)_playbackHeartbeatTimerFired
{
  objc_super v3 = self;
  v2[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v2, self);
  if ([(HSRecordingPlaybackStage *)v3 _mode] != 2) {
    [(HSRecordingPlaybackStage *)v3 _setPlaybackTimerEnabled:0];
  }
  HSUtil::ObjectLock::unlock(v2);
  [(HSStage *)v3 postNotification:HSRecordingPlaybackStageChanged];
  HSUtil::ObjectLock::~ObjectLock(v2);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

+ (Class)hsProxyClass
{
  return (Class)objc_opt_class();
}

- (id)HSRecordingPlaybackStageProxy_0mode
{
  return HSProxySynth::HSRecordingPlaybackStageProxy_0mode_call0<HSRecordingPlaybackStageMode>(self);
}

- (id)HSRecordingPlaybackStageProxy_setMode:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)HSProxySynth::HSRecordingPlaybackStageProxy_setMode_call1<void>(v6, location[0]);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)HSRecordingPlaybackStageProxy_recordingSetMaxSize:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)HSProxySynth::HSRecordingPlaybackStageProxy_recordingSetMaxSize_call1<void>(v6, location[0]);
  objc_storeStrong(location, 0);

  return v4;
}

- (id)HSRecordingPlaybackStageProxy_0recordingSize
{
  return HSProxySynth::HSRecordingPlaybackStageProxy_0recordingSize_call0<unsigned long>(self);
}

- (id)HSRecordingPlaybackStageProxy_0playbackProgress
{
  return HSProxySynth::HSRecordingPlaybackStageProxy_0playbackProgress_call0<float>(self);
}

- (id)HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent:(id)a3
{
  BOOL v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)HSProxySynth::HSRecordingPlaybackStageProxy_playbackSetProgressdispatchEvent_call2<void>(v6, location[0]);
  objc_storeStrong(location, 0);

  return v4;
}

@end