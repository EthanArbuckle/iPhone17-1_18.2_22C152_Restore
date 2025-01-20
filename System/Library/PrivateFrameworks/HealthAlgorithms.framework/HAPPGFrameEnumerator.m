@interface HAPPGFrameEnumerator
- (HAPPGFrameEnumerator)initWithBinaryRepresentation:(id)a3;
- (id).cxx_construct;
- (id)initWithBinaryRepresentation:;
- (id)nextObject;
- (uint64_t)initWithBinaryRepresentation:;
- (void)handleMetadata:(const void *)a3;
- (void)handlePacket:(const void *)a3 bootTime:(double)a4;
- (void)initWithBinaryRepresentation:;
@end

@implementation HAPPGFrameEnumerator

- (HAPPGFrameEnumerator)initWithBinaryRepresentation:(id)a3
{
  v21[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HAPPGFrameEnumerator;
  v5 = [(HAPPGFrameEnumerator *)&v14 init];
  uint64_t v6 = [v4 copy];
  mimosaData = v5->_mimosaData;
  v5->_mimosaData = (NSData *)v6;

  uint64_t v8 = [(NSData *)v5->_mimosaData bytes];
  uint64_t v9 = [(NSData *)v5->_mimosaData length];
  v5->_undecodedBytes.__data_ = (unsigned __int8 *)v8;
  v5->_undecodedBytes.__size_ = v9;
  objc_initWeak(&location, v5);
  v21[0] = &unk_26D4E3C80;
  v21[3] = v21;
  objc_copyWeak(&to, &location);
  v20 = 0;
  v18 = &unk_26D4E3D10;
  objc_moveWeak(&v19, &to);
  v20 = &v18;
  objc_destroyWeak(&to);
  objc_copyWeak(&from, &location);
  v17 = 0;
  v15 = &unk_26D4E3DA0;
  objc_moveWeak(&v16, &from);
  v17 = &v15;
  objc_destroyWeak(&from);
  std::make_unique[abi:ne180100]<mimosa::Decoder,std::function<BOOL ()(mimosa::CodecVersion const&)> &,std::function<BOOL ()(mimosa::Metadata const&)> &,std::function<BOOL ()(std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const&,double)> &>();
}

- (id)nextObject
{
  p_decoder = (mimosa::Decoder **)&self->_decoder;
  if (!self->_decoder.__ptr_.__value_)
  {
LABEL_20:
    v13 = 0;
    goto LABEL_21;
  }
  p_packetToProcess = &self->_packetToProcess;
  ptr = self->_packetToProcess.__ptr_;
  if (!ptr)
  {
    p_undecodedBytes = &self->_undecodedBytes;
    data = self->_undecodedBytes.__data_;
    unint64_t size = self->_undecodedBytes.__size_;
    while (1)
    {
      uint64_t v9 = mimosa::Decoder::decode(*p_decoder, data, size);
      if (!v9) {
        break;
      }
      unint64_t size = self->_undecodedBytes.__size_ - v9;
      data = &p_undecodedBytes->__data_[v9];
      p_undecodedBytes->__data_ = data;
      self->_undecodedBytes.__size_ = size;
      ptr = p_packetToProcess->__ptr_;
      if (p_packetToProcess->__ptr_) {
        goto LABEL_6;
      }
    }
    v15 = *p_decoder;
    *p_decoder = 0;
    if (v15) {
      std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)p_decoder, (uint64_t)v15);
    }
    goto LABEL_20;
  }
LABEL_6:
  value = self->_ppgProcessor.__ptr_.__value_;
  if (!value) {
    operator new();
  }
  health_algorithms::PPGProcessor::process_packet((uint64_t)value, (uint64_t)ptr, v19);
  v11 = [HAPPGFrame alloc];
  cntrl = (std::__shared_weak_count *)p_packetToProcess->__cntrl_;
  v17 = p_packetToProcess->__ptr_;
  v18 = cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v13 = [(HAPPGFrame *)v11 initWithPPGProcessorOutput:v19 rawPacket:&v17 bootDate:self->_bootDate];
  if (v18) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v18);
  }
  objc_super v14 = (std::__shared_weak_count *)p_packetToProcess->__cntrl_;
  p_packetToProcess->__ptr_ = 0;
  p_packetToProcess->__cntrl_ = 0;
  if (v14) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v14);
  }
  if (__p)
  {
    v21 = __p;
    operator delete(__p);
  }
  if (v19[0])
  {
    v19[1] = v19[0];
    operator delete(v19[0]);
  }
LABEL_21:
  return v13;
}

- (void)handlePacket:(const void *)a3 bootTime:(double)a4
{
  if (!self->_bootDate)
  {
    uint64_t v6 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceReferenceDate:a4];
    bootDate = self->_bootDate;
    self->_bootDate = v6;
  }
  std::allocate_shared[abi:ne180100]<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>,std::allocator<std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7>>,std::variant<mimosa::PacketV1,mimosa::PacketV2,mimosa::PacketV3,mimosa::PacketV4,mimosa::PacketV5,mimosa::PacketV6,mimosa::PacketV7> const&,void>((uint64_t)a3, &v10);
  shared_ptr<const std::variant<mimosa::PacketV1, mimosa::PacketV2, mimosa::PacketV3, mimosa::PacketV4, mimosa::PacketV5, mimosa::PacketV6, mimosa::PacketV7>> v8 = v10;
  shared_ptr<const std::variant<mimosa::PacketV1, mimosa::PacketV2, mimosa::PacketV3, mimosa::PacketV4, mimosa::PacketV5, mimosa::PacketV6, mimosa::PacketV7>> v10 = (shared_ptr<const std::variant<mimosa::PacketV1, mimosa::PacketV2, mimosa::PacketV3, mimosa::PacketV4, mimosa::PacketV5, mimosa::PacketV6, mimosa::PacketV7>>)0;
  cntrl = self->_packetToProcess.__cntrl_;
  self->_packetToProcess = v8;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v10.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10.__cntrl_);
    }
  }
}

- (void)handleMetadata:(const void *)a3
{
  if (!self->_ppgProcessor.__ptr_.__value_)
  {
    std::allocate_shared[abi:ne180100]<mimosa::Metadata const,std::allocator<mimosa::Metadata const>,mimosa::Metadata const&,void>((const mimosa::Metadata *)a3, &v6);
    shared_ptr<const mimosa::Metadata> v4 = v6;
    shared_ptr<const mimosa::Metadata> v6 = (shared_ptr<const mimosa::Metadata>)0;
    cntrl = self->_metadata.__cntrl_;
    self->_metadata = v4;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
      if (v6.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6.__cntrl_);
      }
    }
  }
}

- (void).cxx_destruct
{
  p_ppgProcessor = &self->_ppgProcessor;
  uint64_t value = (uint64_t)p_ppgProcessor->__ptr_.__value_;
  p_ppgProcessor->__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<health_algorithms::PPGProcessor>::operator()[abi:ne180100]((uint64_t)p_ppgProcessor, value);
  }
  cntrl = self->_metadata.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  objc_storeStrong((id *)&self->_bootDate, 0);
  shared_ptr<const mimosa::Metadata> v6 = self->_packetToProcess.__cntrl_;
  if (v6) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v6);
  }
  v7 = self->_decoder.__ptr_.__value_;
  self->_decoder.__ptr_.__value_ = 0;
  if (v7) {
    std::default_delete<mimosa::Decoder>::operator()[abi:ne180100]((uint64_t)&self->_decoder, (uint64_t)v7);
  }
  objc_storeStrong((id *)&self->_mimosaData, 0);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 6) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 10) = 0;
  return self;
}

- (void)initWithBinaryRepresentation:
{
}

- (uint64_t)initWithBinaryRepresentation:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

- (id)initWithBinaryRepresentation:
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_26D4E3DA0;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

@end