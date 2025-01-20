@interface HSRecordingStage
- (BOOL)_copyDataTo:(Writable *)a3;
- (BOOL)_encodeFrame:(Frame *)a3;
- (BOOL)_enumerateEncoders:(id)a3;
- (BOOL)copyDataTo:(Writable *)a3;
- (BOOL)recording;
- (HSRecordingStage)init;
- (id).cxx_construct;
- (id)data;
- (uint64_t)_stopRecording;
- (unint64_t)_size;
- (unint64_t)_stopRecording;
- (unint64_t)size;
- (void)_encodeHeaderFrames:(void *)a3;
- (void)_recordConsumeFrame:(id)a3;
- (void)_recordStateFrame;
- (void)_reset;
- (void)_rotateEncoders:(void *)a3;
- (void)_startRecording;
- (void)_stopRecording;
- (void)dealloc;
- (void)handleConsume:(id)a3;
- (void)reset;
- (void)setDestination:(shared_ptr<HSUtil:(unint64_t)a4 :IO::Writable>)a3 maxSize:;
- (void)setRecording:(BOOL)a3;
@end

@implementation HSRecordingStage

- (void)handleConsume:(id)a3
{
  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  if (v5->_state.recording) {
    [(HSRecordingStage *)v5 _recordConsumeFrame:location[0]];
  }
  v3.receiver = v5;
  v3.super_class = (Class)HSRecordingStage;
  [(HSStage *)&v3 handleConsume:location[0]];
  objc_storeStrong(location, 0);
}

- (HSRecordingStage)init
{
  SEL v8 = a2;
  id location = 0;
  v7.receiver = self;
  v7.super_class = (Class)HSRecordingStage;
  obj = [(HSStage *)&v7 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    id v3 = location;
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v5);
    [v3 setDestination:v5 maxSize:0];
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v5);
    v10 = (HSRecordingStage *)location;
  }
  else
  {
    v10 = 0;
  }
  int v6 = 1;
  objc_storeStrong(&location, 0);
  return v10;
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  NSLog(@"~HSRecordingStage");
  v2.receiver = v4;
  v2.super_class = (Class)HSRecordingStage;
  [(HSStage *)&v2 dealloc];
}

- (void)setDestination:(shared_ptr<HSUtil:(unint64_t)a4 :IO::Writable>)a3 maxSize:
{
  ptr = a3.__ptr_;
  v13 = self;
  SEL v12 = a2;
  v11 = a3.__ptr_;
  cntrl = a3.__cntrl_;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v9, self);
  BOOL recording = 0;
  BOOL recording = v13->_state.recording;
  [(HSRecordingStage *)v13 _reset];
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)ptr))
  {
    std::shared_ptr<HSUtil::FileDescriptor>::operator=[abi:ne180100]((uint64_t *)&v13->_state, ptr);
  }
  else
  {
    _ZNSt3__111make_sharedB8ne180100IN6HSUtil6BufferEJEvEENS_10shared_ptrIT_EEDpOT0_(v7);
    std::shared_ptr<HSUtil::IO::Writable>::operator=[abi:ne180100]<HSUtil::Buffer,void>((uint64_t *)&v13->_state, v7);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v7);
  }
  std::dynamic_pointer_cast[abi:ne180100]<HSUtil::IO::Readable,HSUtil::IO::Writable>((uint64_t)&v13->_state, v6);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)&v13->_state.src, v6);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v6);
  v13->_state.maxSize = (unint64_t)cntrl;
  BOOL v4 = 1;
  if (!std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)&v13->_state.src)) {
    BOOL v4 = v13->_state.maxSize == 0;
  }
  if (!v4) {
    __assert_rtn("-[HSRecordingStage setDestination:maxSize:]", "HSRecordingStage.mm", 195, "_state.src || _state.maxSize==0");
  }
  if (recording) {
    [(HSRecordingStage *)v13 _startRecording];
  }
  HSUtil::ObjectLock::~ObjectLock(v9);
}

- (BOOL)recording
{
  v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  BOOL recording = v5->_state.recording;
  HSUtil::ObjectLock::~ObjectLock(v4);
  return recording;
}

- (void)setRecording:(BOOL)a3
{
  int v6 = self;
  SEL v5 = a2;
  BOOL v4 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v3, self);
  if (!v4 || v6->_state.recording)
  {
    if (!v4 && v6->_state.recording) {
      [(HSRecordingStage *)v6 _stopRecording];
    }
  }
  else
  {
    [(HSRecordingStage *)v6 _startRecording];
  }
  HSUtil::ObjectLock::~ObjectLock(v3);
}

- (void)reset
{
  SEL v3 = self;
  v2[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v2, self);
  [(HSRecordingStage *)v3 _reset];
  HSUtil::ObjectLock::~ObjectLock(v2);
}

- (unint64_t)size
{
  SEL v5 = self;
  v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  unint64_t v3 = [(HSRecordingStage *)v5 _size];
  HSUtil::ObjectLock::~ObjectLock(v4);
  return v3;
}

- (id)data
{
  v11 = self;
  v10[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v10, self);
  HSUtil::Buffer::Buffer((HSUtil::Buffer *)v8);
  char v7 = [(HSRecordingStage *)v11 _copyDataTo:&v9];
  char v6 = v7;
  if (v7)
  {
    SEL v12 = HSUtil::Buffer::getNSData((HSUtil::Buffer *)v8);
  }
  else
  {
    SEL v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRecordingStage.mm", v14);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v13, (uint64_t)"-[HSRecordingStage data]", (uint64_t)v5, 227, (uint64_t)"br");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v13, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    SEL v12 = 0;
  }
  HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v8);
  HSUtil::ObjectLock::~ObjectLock(v10);
  objc_super v2 = v12;

  return v2;
}

- (BOOL)copyDataTo:(Writable *)a3
{
  v11 = self;
  SEL v10 = a2;
  uint64_t v9 = a3;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v8, self);
  char v7 = [(HSRecordingStage *)v11 _copyDataTo:v9];
  char v6 = v7;
  if (v7)
  {
    char v12 = 1;
  }
  else
  {
    SEL v5 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRecordingStage.mm", v14);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v13, (uint64_t)"-[HSRecordingStage copyDataTo:]", (uint64_t)v5, 234, (uint64_t)"br");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v13, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v12 = 0;
  }
  HSUtil::ObjectLock::~ObjectLock(v8);
  return v12 & 1;
}

- (void)_rotateEncoders:(void *)a3
{
  v13 = self;
  SEL v12 = a2;
  v11 = a3;
  id location = &_os_log_default;
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
  {
    log = location;
    os_log_type_t type = v9;
    __os_log_helper_16_0_0(v8);
    _os_log_impl(&def_411C8, log, type, "Rotate encoders", v8, 2u);
  }
  objc_storeStrong(&location, 0);
  unint64_t currentEncoder = v13->_state.currentEncoder;
  if (currentEncoder >= std::vector<std::atomic<HSUtil::CoderKey const*>>::size[abi:ne180100](&v13->_state.encoders.__begin_)
                       - 1)
    uint64_t v3 = 0;
  else {
    uint64_t v3 = v13->_state.currentEncoder + 1;
  }
  v13->_state.unint64_t currentEncoder = v3;
  std::vector<std::unique_ptr<EncoderState>>::operator[][abi:ne180100](&v13->_state.encoders.__begin_, v13->_state.currentEncoder);
  char v7 = (EncoderState *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
  EncoderState::reset(v7);
  [(HSRecordingStage *)v13 _encodeHeaderFrames:v11];
}

- (void)_startRecording
{
  SEL v8 = self;
  SEL v7 = a2;
  std::vector<std::unique_ptr<EncoderState>>::clear[abi:ne180100]((uint64_t *)&self->_state.encoders);
  if (!v8->_state.maxSize)
  {
    objc_super v2 = (HSUtil::IO::Writable *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&v8->_state);
    newEncoderState(v2);
  }
  uint64_t v6 = 5;
  unint64_t v5 = 0;
  unint64_t v5 = v8->_state.maxSize / 5;
  uint64_t v4 = 0;
  uint64_t v3 = (HSUtil::IO::Writable *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&v8->_state);
  newEncoderState(v3);
}

- (void)_stopRecording
{
}

{
  while (a2 != *(void *)(a1 + 16))
  {
    std::__split_buffer<HSUtil::Encoder::ContainerRecord>::__alloc[abi:ne180100](a1);
    *(void *)(a1 + 16) -= 16;
    std::__compressed_pair_elem<unsigned long,0,false>::__get[abi:ne180100]();
    std::allocator_traits<std::allocator<HSUtil::CoderKey const*>>::destroy[abi:ne180100]<HSUtil::CoderKey const*,void>();
  }
}

- (uint64_t)_stopRecording
{
  v3[1] = a1;
  std::vector<HSUtil::CoderKey const*>::__alloc[abi:ne180100]();
  v3[0] = std::allocator_traits<std::allocator<HSUtil::Encoder::ContainerRecord>>::max_size[abi:ne180100]<std::allocator<HSUtil::Encoder::ContainerRecord>,void>();
  uint64_t v2 = std::numeric_limits<long>::max[abi:ne180100]();
  return *std::min[abi:ne180100]<unsigned long>(v3, &v2);
}

- (void)_reset
{
  self->_state.BOOL recording = 0;
  std::vector<std::unique_ptr<EncoderState>>::clear[abi:ne180100]((uint64_t *)&self->_state.encoders);
  self->_state.unint64_t currentEncoder = 0;
}

- (BOOL)_enumerateEncoders:(id)a3
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  for (unint64_t i = v11->_state.currentEncoder + 1;
        i < std::vector<std::atomic<HSUtil::CoderKey const*>>::size[abi:ne180100](&v11->_state.encoders.__begin_);
        ++i)
  {
    SEL v7 = (uint64_t (**)(id, uint64_t))location[0];
    uint64_t v3 = std::vector<std::unique_ptr<EncoderState>>::operator[][abi:ne180100](&v11->_state.encoders.__begin_, i);
    if ((v7[2](v7, v3) & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_12;
    }
  }
  for (unint64_t j = 0; j <= v11->_state.currentEncoder; ++j)
  {
    uint64_t v6 = (uint64_t (**)(id, uint64_t))location[0];
    uint64_t v4 = std::vector<std::unique_ptr<EncoderState>>::operator[][abi:ne180100](&v11->_state.encoders.__begin_, j);
    if ((v6[2](v6, v4) & 1) == 0)
    {
      char v12 = 0;
      goto LABEL_12;
    }
  }
  char v12 = 1;
LABEL_12:
  objc_storeStrong(location, 0);
  return v12 & 1;
}

- (BOOL)_copyDataTo:(Writable *)a3
{
  v16 = (uint64_t *)self;
  SEL v15 = a2;
  v14 = a3;
  if (std::vector<std::unique_ptr<HSUtil::EncoderBuf>>::empty[abi:ne180100](&self->_state.encoders.__begin_))
  {
    char v17 = 0;
  }
  else
  {
    uint64_t v13 = 0;
    v12[1] = v16 + 21;
    v12[0] = std::vector<std::unique_ptr<EncoderState>>::begin[abi:ne180100](v16 + 21);
    uint64_t v11 = std::vector<std::unique_ptr<EncoderState>>::end[abi:ne180100]((uint64_t)(v16 + 21));
    while (std::operator!=[abi:ne180100]<std::unique_ptr<EncoderState> *>((uint64_t)v12, (uint64_t)&v11))
    {
      uint64_t v10 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v12);
      uint64_t v3 = (EncoderState *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
      uint64_t v4 = EncoderState::length(v3);
      v13 += v4;
      std::__wrap_iter<std::unique_ptr<EncoderState> *>::operator++[abi:ne180100](v12);
    }
    v6[0] = 0;
    v6[1] = v6;
    int v7 = 0x20000000;
    int v8 = 32;
    uint64_t v9 = 0;
    char v17 = objc_msgSend(v16, "_enumerateEncoders:") & 1;
    _Block_object_dispose(v6, 8);
  }
  return v17 & 1;
}

uint64_t __32__HSRecordingStage__copyDataTo___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = a1;
  uint64_t v13 = a2;
  uint64_t v12 = a1;
  uint64_t v2 = (EncoderState *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
  unint64_t v11 = EncoderState::length(v2);
  if (v11)
  {
    int v7 = *(HSUtil::IOUtil **)(a1 + 40);
    uint64_t v6 = *(HSUtil::IO::Writable **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v3 = (HSUtil::IO::Readable *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
    uint64_t v9 = HSUtil::IOUtil::Copy(v7, v6, v3, 0, v11);
    uint64_t v10 = v4;
    if (HSUtil::Coder::ok((HSUtil::Coder *)&v9) && v10 == v11)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v11;
      char v15 = 1;
    }
    else
    {
      char v15 = 0;
    }
  }
  else
  {
    char v15 = 1;
  }
  return v15 & 1;
}

- (unint64_t)_size
{
  uint64_t v10 = self;
  SEL v9 = a2;
  unint64_t v8 = 0;
  p_encoders = &self->_state.encoders;
  uint64_t v6 = std::vector<std::unique_ptr<EncoderState>>::begin[abi:ne180100]((uint64_t *)&self->_state.encoders);
  uint64_t v5 = std::vector<std::unique_ptr<EncoderState>>::end[abi:ne180100]((uint64_t)p_encoders);
  while (std::operator!=[abi:ne180100]<std::unique_ptr<EncoderState> *>((uint64_t)&v6, (uint64_t)&v5))
  {
    std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&v6);
    uint64_t v2 = (EncoderState *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
    uint64_t v3 = EncoderState::length(v2);
    v8 += v3;
    std::__wrap_iter<std::unique_ptr<EncoderState> *>::operator++[abi:ne180100](&v6);
  }
  return v8;
}

- (void)_recordStateFrame
{
  uint64_t v4 = self;
  SEL v3 = a2;
  HSRecordingTypes::StateFrame::StateFrame((HSRecordingTypes::StateFrame *)v2, &self->super);
  if (![(HSRecordingStage *)v4 _encodeFrame:v2]) {
    [(HSRecordingStage *)v4 _rotateEncoders:v2];
  }
  HSRecordingTypes::StateFrame::~StateFrame((HSRecordingTypes::StateFrame *)v2);
}

- (void)_recordConsumeFrame:(id)a3
{
  uint64_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  HSRecordingTypes::ConsumeFrame::ConsumeFrame((HSRecordingTypes::ConsumeFrame *)v4, (objc_object *)location[0]);
  if (![(HSRecordingStage *)v6 _encodeFrame:v4])
  {
    [(HSRecordingStage *)v6 _rotateEncoders:0];
    if (![(HSRecordingStage *)v6 _encodeFrame:v4])
    {
      exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(exception, "failed to encode consume frame after rotating encoders");
    }
  }
  HSRecordingTypes::ConsumeFrame::~ConsumeFrame(v4);
  objc_storeStrong(location, 0);
}

- (void)_encodeHeaderFrames:(void *)a3
{
  unint64_t v11 = self;
  SEL v10 = a2;
  SEL v9 = a3;
  HSRecordingTypes::HeaderFrame::HeaderFrame((HSRecordingTypes::HeaderFrame *)v8);
  char v7 = [(HSRecordingStage *)v11 _encodeFrame:v8];
  if (!v7)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to encode header frame");
  }
  if (v9)
  {
    if (![(HSRecordingStage *)v11 _encodeFrame:v9])
    {
      uint64_t v4 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v4, "failed to encode state frame");
    }
  }
  else
  {
    HSRecordingTypes::StateFrame::StateFrame((HSRecordingTypes::StateFrame *)v6, &v11->super);
    char v7 = [(HSRecordingStage *)v11 _encodeFrame:v6];
    if (!v7)
    {
      SEL v3 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v3, "failed to encode state frame");
    }
    HSRecordingTypes::StateFrame::~StateFrame((HSRecordingTypes::StateFrame *)v6);
  }
}

- (BOOL)_encodeFrame:(Frame *)a3
{
  uint64_t v13 = self;
  SEL v12 = a2;
  unint64_t v11 = a3;
  std::vector<std::unique_ptr<EncoderState>>::operator[][abi:ne180100](&self->_state.encoders.__begin_, self->_state.currentEncoder);
  SEL v10 = (EncoderState *)std::__bucket_list_deallocator<std::allocator<std::__hash_node_base<std::__hash_node<HSStage * {__strong},void *> *> *>>::size[abi:ne180100]();
  uint64_t v9 = EncoderState::length(v10);
  HSUtil::Encoder::encodeCodable<HSRecordingTypes::Frame>((EncoderState *)((char *)v10 + 16), (HSRecordingTypes::Frame *)v11);
  HSUtil::Encoder::flush((EncoderState *)((char *)v10 + 16));
  if (HSUtil::Coder::ok((EncoderState *)((char *)v10 + 16))) {
    return 1;
  }
  if (!v13->_state.maxSize)
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "failed to encode with unbounded recording");
  }
  if (*((_DWORD *)v10 + 4) != 7)
  {
    uint64_t v6 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v6, "write failure");
  }
  v8[0] = (*(uint64_t (**)(EncoderState *, uint64_t))(*(void *)v10 + 40))(v10, v9);
  v8[1] = v3;
  if (!HSUtil::Coder::ok((HSUtil::Coder *)v8))
  {
    uint64_t v5 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v5, "writeLength failed");
  }
  return 0;
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (unint64_t)_stopRecording
{
  v7[1] = a1;
  v7[0] = a2;
  unint64_t v6 = std::vector<-[HSRecordingStage _stopRecording]::Region>::max_size((uint64_t)a1);
  if (v7[0] > v6) {
    std::vector<std::unique_ptr<HSUtil::EncoderBuf>>::__throw_length_error[abi:ne180100]();
  }
  unint64_t v5 = std::vector<HSUtil::Encoder::ContainerRecord>::capacity[abi:ne180100](a1);
  if (v5 >= v6 / 2) {
    return v6;
  }
  uint64_t v4 = 2 * v5;
  return *std::max[abi:ne180100]<unsigned long>(&v4, v7);
}

@end