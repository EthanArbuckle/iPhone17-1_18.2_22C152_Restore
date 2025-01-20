@interface AVAudioTimeObserverImpl
- (AVAudioTimeInterval)currentLatency;
- (AVAudioTimeObserverImpl)initWithDeviceTimeClient:(shared_ptr<as::client::DeviceTimeClient>)a3;
- (AudioPresentationTimeStamp)currentPresentationTime;
- (AudioTimeStamp)currentTime;
- (BOOL)isLatencyDynamic;
- (id).cxx_construct;
- (shared_ptr<as::client::DeviceTimeClient>)deviceTimeClient;
@end

@implementation AVAudioTimeObserverImpl

- (AudioPresentationTimeStamp)currentPresentationTime
{
  as::client::DeviceTimeClient::currentPresentationTime((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  return self;
}

- (AVAudioTimeObserverImpl)initWithDeviceTimeClient:(shared_ptr<as::client::DeviceTimeClient>)a3
{
  ptr = a3.__ptr_;
  v10.receiver = self;
  v10.super_class = (Class)AVAudioTimeObserverImpl;
  v4 = [(AVAudioTimeObserverImpl *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v7 = *(DeviceTimeClient **)ptr;
    uint64_t v6 = *((void *)ptr + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_deviceTimeClient.__cntrl_;
    v5->_deviceTimeClient.__ptr_ = v7;
    v5->_deviceTimeClient.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl) {
      std::__shared_weak_count::__release_shared[abi:ne180100](cntrl);
    }
  }
  return v5;
}

- (AudioTimeStamp)currentTime
{
  as::client::DeviceTimeClient::currentTime((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (AVAudioTimeInterval)currentLatency
{
  as::client::DeviceTimeClient::currentLatency((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_, (uint64_t)retstr);
  return result;
}

- (BOOL)isLatencyDynamic
{
  return as::client::DeviceTimeClient::isLatencyDynamic((as::client::DeviceTimeClient *)self->_deviceTimeClient.__ptr_);
}

- (shared_ptr<as::client::DeviceTimeClient>)deviceTimeClient
{
  cntrl = self->_deviceTimeClient.__cntrl_;
  *v2 = self->_deviceTimeClient.__ptr_;
  v2[1] = (DeviceTimeClient *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (DeviceTimeClient *)self;
  return result;
}

- (void).cxx_destruct
{
  cntrl = self->_deviceTimeClient.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

@end