@interface HSPlaybackStage
- (BOOL)_decodePlayFrame:(const PlayFrame *)a3 toFrame:(Frame *)a4;
- (BOOL)playing;
- (HSPlaybackStage)init;
- (HSPlaybackStage)initWithQueue:(id)a3;
- (float)progress;
- (id).cxx_construct;
- (id)data;
- (void)_load:(shared_ptr<HSUtil::IO::Readable>)a3;
- (void)_playConsumeFrame:(const PlayFrame *)a3;
- (void)_playNextFrame;
- (void)_playStateFrame:(const PlayFrame *)a3;
- (void)_setPlaying:(BOOL)a3;
- (void)_updatePlaybackTime:(int64_t)a3;
- (void)loadFromData:(id)a3;
- (void)loadFromSource:(shared_ptr<HSUtil::IO::Readable>)a3;
- (void)reset;
- (void)setPlaying:(BOOL)a3;
- (void)setProgress:(float)a3 dispatchEvent:(BOOL)a4;
@end

@implementation HSPlaybackStage

- (HSPlaybackStage)init
{
  v4 = [(HSPlaybackStage *)self initWithQueue:0];
  v3 = v4;
  objc_storeStrong((id *)&v4, 0);
  return v3;
}

- (HSPlaybackStage)initWithQueue:(id)a3
{
  id val = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = val;
  id val = 0;
  v25.receiver = v3;
  v25.super_class = (Class)HSPlaybackStage;
  obj = [(HSStage *)&v25 init];
  id val = obj;
  objc_storeStrong(&val, obj);
  if (obj)
  {
    objc_storeStrong((id *)val + 15, location[0]);
    if (*((void *)val + 15)) {
      goto LABEL_10;
    }
    dispatch_queue_attr_t attr = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -15);
    dispatch_queue_t v4 = dispatch_queue_create("HSRecordingStage playback queue", attr);
    v5 = (void *)*((void *)val + 15);
    *((void *)val + 15) = v4;

    BOOL v22 = 0;
    BOOL v22 = *((void *)val + 15) != 0;
    if (v22)
    {
      int v24 = 0;
    }
    else
    {
      v21 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v30);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v29, (uint64_t)"-[HSPlaybackStage initWithQueue:]", (uint64_t)v21, 136, (uint64_t)"_queue");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v29, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v28 = 0;
      int v24 = 1;
    }
    objc_storeStrong((id *)&attr, 0);
    if (!v24)
    {
LABEL_10:
      HSUtil::ObjectLock::ObjectLock((uint64_t)v18, val);
      objc_initWeak(&from, val);
      v9 = (void *)*((void *)val + 15);
      v11 = _NSConcreteStackBlock;
      int v12 = -1073741824;
      int v13 = 0;
      v14 = __33__HSPlaybackStage_initWithQueue___block_invoke;
      v15 = &unk_141240;
      objc_copyWeak(&v16, &from);
      v6 = createPausedTimer(v9, &v11);
      v7 = (void *)*((void *)val + 16);
      *((void *)val + 16) = v6;

      v28 = (HSPlaybackStage *)val;
      int v24 = 1;
      objc_destroyWeak(&v16);
      objc_destroyWeak(&from);
      HSUtil::ObjectLock::~ObjectLock(v18);
    }
  }
  else
  {
    v28 = 0;
    int v24 = 1;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&val, 0);
  return v28;
}

void __33__HSPlaybackStage_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _playNextFrame];
}

- (BOOL)playing
{
  v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  BOOL playing = v5->_state.play.playing;
  HSUtil::ObjectLock::~ObjectLock(v4);
  return playing;
}

- (void)setPlaying:(BOOL)a3
{
  v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, self);
  [(HSPlaybackStage *)v6 _setPlaying:v4];
  HSUtil::ObjectLock::~ObjectLock(v3);
}

- (void)reset
{
  SEL v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  v2 = v5;
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v3);
  [(HSPlaybackStage *)v2 _load:v3];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v3);
  HSUtil::ObjectLock::~ObjectLock(v4);
}

- (float)progress
{
  v6 = self;
  v5[2] = (id)a2;
  v2 = (HSUtil *)HSUtil::ObjectLock::ObjectLock((uint64_t)v5, self);
  if (v6->_state.play.playing) {
    [(HSPlaybackStage *)v6 _updatePlaybackTime:HSUtil::GetMonotonicTime(v2)];
  }
  float PlaybackProgress = getPlaybackProgress(&v6->_state.play.playback);
  HSUtil::ObjectLock::~ObjectLock(v5);
  return PlaybackProgress;
}

- (void)setProgress:(float)a3 dispatchEvent:(BOOL)a4
{
  id v35 = self;
  SEL v34 = a2;
  BOOL v32 = a4;
  v31[2] = (id)5000000;
  double v4 = std::__math::fmin[abi:ne180100]<int,float,0>(1, a3);
  float v5 = std::__math::fmax[abi:ne180100]<int,double,0>(0, v4);
  float v33 = v5;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v31, v35);
  v30 = (Playback *)((char *)v35 + 144);
  [v35 _setPlaying:0];
  if (v33 == 0.0)
  {
    Playback::resetTime(v30, 0);
  }
  else if (v33 == 1.0)
  {
    int64_t Duration = HSRecordingTypes::PlaybackDecoder::getDuration((HSRecordingTypes::PlaybackDecoder *)v30);
    Playback::resetTime(v30, Duration);
  }
  else
  {
    float v9 = v33;
    uint64_t v10 = HSRecordingTypes::PlaybackDecoder::getDuration((HSRecordingTypes::PlaybackDecoder *)v30);
    Playback::resetTime(v30, (uint64_t)(float)(v9 * (float)v10));
  }
  if (!v32) {
    goto LABEL_21;
  }
  NextConsumeFrame = findNextConsumeFrame(v30);
  uint64_t v28 = 0;
  uint64_t v8 = HSRecordingTypes::PlaybackDecoder::iteratorEnd((uint64_t)v30, (uint64_t)&NextConsumeFrame)
     ? 0
     : std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&NextConsumeFrame);
  uint64_t v28 = v8;
  if (!v8 || v28 == *((void *)v35 + 38)) {
    goto LABEL_21;
  }
  std::vector<objc_object * {__strong}>::vector[abi:ne180100](v27);
  if (!v28) {
    goto LABEL_19;
  }
  objc_super v25 = NextConsumeFrame;
  decodeConsumeFrameDatas((HSUtil::Coder *)v30, (uint64_t)NextConsumeFrame, 5000000, v26);
  if (std::optional<std::vector<objc_object * {__strong}>>::operator BOOL[abi:ne180100]((uint64_t)v26) & 1)
  {
    std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
    std::vector<objc_object * {__strong}>::operator=[abi:ne180100](v27, v6);
    int v20 = 0;
  }
  else
  {
    v23 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v37);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v36, (uint64_t)"-[HSPlaybackStage setProgress:dispatchEvent:]", (uint64_t)v23, 252, (uint64_t)"datasOpt");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v36, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v20 = 1;
  }
  std::optional<std::vector<objc_object * {__strong}>>::~optional((uint64_t)v26);
  if (!v20)
  {
LABEL_19:
    *((void *)v35 + 38) = v28;
    id v19 = (id)objc_opt_new();
    std::vector<objc_object * {__strong}>::operator=[abi:ne180100]((uint64_t *)v19 + 1, v27);
    queue = *((void *)v35 + 15);
    int v12 = _NSConcreteStackBlock;
    int v13 = -1073741824;
    int v14 = 0;
    v15 = __45__HSPlaybackStage_setProgress_dispatchEvent___block_invoke;
    id v16 = &unk_1412A8;
    id v17 = v35;
    id v18 = v19;
    dispatch_async(queue, &v12);
    objc_storeStrong(&v18, 0);
    objc_storeStrong(&v17, 0);
    objc_storeStrong(&v19, 0);
    int v20 = 0;
  }
  std::vector<objc_object * {__strong}>::~vector[abi:ne180100](v27);
  if (!v20) {
LABEL_21:
  }
    int v20 = 0;
  HSUtil::ObjectLock::~ObjectLock(v31);
}

id __45__HSPlaybackStage_setProgress_dispatchEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "consume:", *(void *)(a1 + 40), a1, a1);
}

- (void)loadFromSource:(shared_ptr<HSUtil::IO::Readable>)a3
{
  ptr = a3.__ptr_;
  float v9 = self;
  SEL v8 = a2;
  v7[4] = a3.__ptr_;
  if (!std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)a3.__ptr_))
  {
    double v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:v8, v9, @"HSPlaybackStage.mm", 275, @"Invalid parameter not satisfying: %@", @"source" object file lineNumber description];
  }
  HSUtil::ObjectLock::ObjectLock((uint64_t)v7, v9);
  id v3 = v9;
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v6, ptr);
  [(HSPlaybackStage *)v3 _load:v6];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v6);
  HSUtil::ObjectLock::~ObjectLock(v7);
}

- (void)loadFromData:(id)a3
{
  uint64_t v10 = self;
  SEL v9 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    double v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:v9, v10, @"HSPlaybackStage.mm", 281, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];
  }
  HSUtil::ObjectLock::ObjectLock((uint64_t)v7, v10);
  id v3 = v10;
  std::make_shared[abi:ne180100]<HSUtil::Buffer,HSUtil::Buffer::CopyType const&,NSData * {__strong}&,void>((uint64_t)&HSUtil::Buffer::Copy, &location, v5);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v6, v5);
  [(HSPlaybackStage *)v3 _load:v6];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v6);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v5);
  HSUtil::ObjectLock::~ObjectLock(v7);
  objc_storeStrong(&location, 0);
}

- (id)data
{
  int v12 = self;
  v11[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v11, self);
  HSRecordingTypes::PlaybackDecoder::getSource((HSRecordingTypes::PlaybackDecoder *)&v12->_state.play.playback, v10);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v10))
  {
    v2 = (HSUtil::IOUtil *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v10);
    HSUtil::IOUtil::ReadAll(v2, 0, (uint64_t)v8);
    if (HSUtil::Buffer::operator BOOL((HSUtil::Buffer *)v8))
    {
      int v13 = HSUtil::Buffer::getNSData((HSUtil::Buffer *)v8);
      int v9 = 1;
    }
    else
    {
      v6 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v15);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v14, (uint64_t)"-[HSPlaybackStage data]", (uint64_t)v6, 292, (uint64_t)"buf");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v14, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v13 = 0;
      int v9 = 1;
    }
    HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v8);
  }
  else
  {
    int v13 = 0;
    int v9 = 1;
  }
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v10);
  HSUtil::ObjectLock::~ObjectLock(v11);
  id v3 = v13;

  return v3;
}

- (void)_setPlaying:(BOOL)a3
{
  if (self->_state.play.playing != a3)
  {
    self->_state.play.BOOL playing = a3;
    if (self->_state.play.playing)
    {
      id v3 = (PlayFrame *)Playback::done(&self->_state.play.playback);
      if (v3) {
        id v3 = Playback::resetTime(&self->_state.play.playback, 0);
      }
      self->_state.play.startTime = HSUtil::GetMonotonicTime((HSUtil *)v3);
      self->_state.play.startTimeOffset = Playback::getTime(&self->_state.play.playback);
      self->_state.play.dispatchStartTime = dispatch_time(0, 0);
      dispatch_source_set_timer((dispatch_source_t)self->_state.playTimer, 0, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
    else
    {
      [(HSPlaybackStage *)self _updatePlaybackTime:HSUtil::GetMonotonicTime((HSUtil *)self)];
      dispatch_source_set_timer((dispatch_source_t)self->_state.playTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    }
  }
}

- (void)_load:(shared_ptr<HSUtil::IO::Readable>)a3
{
  ptr = a3.__ptr_;
  id v19 = self;
  SEL v18 = a2;
  id v17 = a3.__ptr_;
  -[HSPlaybackStage _setPlaying:](self, "_setPlaying:", 0, a3.__cntrl_);
  v11[0] = 0;
  Playback::Playback(&v12);
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  $_0::$_1::operator=((uint64_t)&v19->_state.play, (uint64_t)v11);
  $_0::$_1::~$_1(($_0::$_1 *)v11);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)ptr))
  {
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v9, ptr);
    Playback::Playback(&v10, v9);
    Playback::operator=((uint64_t)&v19->_state.play.playback, (uint64_t)&v10);
    Playback::~Playback(&v10);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v9);
    if (!HSUtil::Coder::ok((HSUtil::Coder *)&v19->_state.play.playback))
    {
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        log = oslog;
        os_log_type_t v4 = type;
        __os_log_helper_16_0_0(v6);
        _os_log_error_impl(&def_411C8, log, v4, "Failed to create playback", v6, 2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)_updatePlaybackTime:(int64_t)a3
{
}

- (BOOL)_decodePlayFrame:(const PlayFrame *)a3 toFrame:(Frame *)a4
{
  Playback v10 = self;
  location[3] = (id)a2;
  id location[2] = (id)a3;
  location[1] = a4;
  HSRecordingTypes::PlaybackDecoder::decodeFrame((HSRecordingTypes::PlaybackDecoder *)&self->_state.play.playback, (const HSRecordingTypes::PlayFrame *)a3, (HSRecordingTypes::Frame *)a4);
  if (HSUtil::Coder::ok((HSUtil::Coder *)&v10->_state.play.playback)) {
    return 1;
  }
  location[0] = &_os_log_default;
  char v8 = 16;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_ERROR))
  {
    log = location[0];
    os_log_type_t type = v8;
    __os_log_helper_16_0_0(v7);
    _os_log_error_impl(&def_411C8, log, type, "Failed to decode frame", v7, 2u);
  }
  objc_storeStrong(location, 0);
  [(HSPlaybackStage *)v10 _setPlaying:0];
  return 0;
}

- (void)_playStateFrame:(const PlayFrame *)a3
{
  p_super = &self->super;
  SEL v10 = a2;
  int v9 = a3;
  if (a3->var1 != 2)
  {
    id v3 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v3 handleFailureInMethod:v10, p_super, @"HSPlaybackStage.mm", 362, @"Invalid parameter not satisfying: %@", @"playFrame.type == Frame::Type::State" object file lineNumber description];
  }
  HSRecordingTypes::StateFrame::StateFrame((HSRecordingTypes::StateFrame *)v8, p_super);
  char v7 = [(HSStage *)p_super _decodePlayFrame:v9 toFrame:v8] & 1;
  char v6 = v7;
  if (!v7)
  {
    float v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v13);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v12, (uint64_t)"-[HSPlaybackStage _playStateFrame:]", (uint64_t)v5, 368, (uint64_t)"br");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v12, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  HSRecordingTypes::StateFrame::~StateFrame((HSRecordingTypes::StateFrame *)v8);
}

- (void)_playConsumeFrame:(const PlayFrame *)a3
{
  id v17 = self;
  SEL v16 = a2;
  uint64_t v15 = a3;
  if (a3->var1 != 3)
  {
    char v6 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v6 handleFailureInMethod:v16, v17, @"HSPlaybackStage.mm", 373, @"Invalid parameter not satisfying: %@", @"playFrame.type == Frame::Type::Consume" object file lineNumber description];
  }
  HSRecordingTypes::ConsumeFrame::ConsumeFrame((HSRecordingTypes::ConsumeFrame *)v14);
  char v13 = [(HSPlaybackStage *)v17 _decodePlayFrame:v15 toFrame:v14];
  char v12 = v13;
  if (v13)
  {
    id location = v14[4];
    if ([location conformsToProtocol:&OBJC_PROTOCOL___HSTimestampable])
    {
      int64_t startTime = v17->_state.play.startTime;
      float v5 = (char *)[location hsTimestamp];
      uint64_t Frames = HSRecordingTypes::PlaybackDecoder::getFrames((HSRecordingTypes::PlaybackDecoder *)&v17->_state.play.playback);
      [location hsSetTimestamp:&v5[startTime- *(void *)(std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100](Frames)+ 16)]];
    }
    [(HSStage *)v17 consume:location];
    objc_storeStrong(&location, 0);
    int v8 = 0;
  }
  else
  {
    v11 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSPlaybackStage.mm", v19);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v18, (uint64_t)"-[HSPlaybackStage _playConsumeFrame:]", (uint64_t)v11, 377, (uint64_t)"br");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v18, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v8 = 1;
  }
  HSRecordingTypes::ConsumeFrame::~ConsumeFrame(v14);
}

- (void)_playNextFrame
{
  v21 = self;
  v20[2] = (id)a2;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v2 = (HSUtil *)HSUtil::ObjectLock::ObjectLock((uint64_t)v20, v21);
  p_playback = &v21->_state.play.playback;
  if (v21->_state.play.playing)
  {
    [(HSPlaybackStage *)v21 _updatePlaybackTime:HSUtil::GetMonotonicTime(v2)];
    if (Playback::done(p_playback))
    {
      [(HSPlaybackStage *)v21 _setPlaying:0];
      int v18 = 1;
    }
    else
    {
      NextFrame = (uint64_t *)Playback::getNextFrame(p_playback);
      SEL v16 = (const PlayFrame *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)NextFrame);
      BOOL shouldPlayFrame = Playback::shouldPlayFrame(p_playback, v16);
      int64_t var2 = 0;
      int64_t var2 = v16->var2;
      if (shouldPlayFrame)
      {
        uint64_t v13 = std::__wrap_iter<HSRecordingTypes::PlayFrame const*>::operator++[abi:ne180100](NextFrame);
        if (!HSRecordingTypes::PlaybackDecoder::iteratorEnd((uint64_t)p_playback, (uint64_t)NextFrame))
        {
          std::__wrap_iter<HSRecordingTypes::PlayFrame const*>::operator->[abi:ne180100]();
          int64_t var2 = *(void *)(v3 + 16);
        }
      }
      int64_t delta = 0;
      int64_t delta = var2 - v21->_state.play.startTimeOffset;
      source = v21->_state.playTimer;
      dispatch_time_t v4 = dispatch_time(v21->_state.play.dispatchStartTime, delta);
      dispatch_source_set_timer(source, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      if (shouldPlayFrame)
      {
        int var1 = v16->var1;
        if (var1 != 1)
        {
          if (var1 == 2)
          {
            [(HSPlaybackStage *)v21 _playStateFrame:v16];
          }
          else if (var1 == 3)
          {
            [(HSPlaybackStage *)v21 _playConsumeFrame:v16];
          }
          else
          {
            os_log_t oslog = &_os_log_default;
            os_log_type_t type = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              log = oslog;
              os_log_type_t v6 = type;
              __os_log_helper_16_0_0(v9);
              _os_log_error_impl(&def_411C8, log, v6, "Unknown frame type", v9, 2u);
            }
            objc_storeStrong((id *)&oslog, 0);
            [(HSPlaybackStage *)v21 _setPlaying:0];
          }
        }
      }
      int v18 = 0;
    }
  }
  else
  {
    int v18 = 1;
  }
  HSUtil::ObjectLock::~ObjectLock(v20);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end