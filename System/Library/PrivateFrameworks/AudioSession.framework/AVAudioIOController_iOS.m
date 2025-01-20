@interface AVAudioIOController_iOS
- (AVAudioIOController_iOS)initWithSession:(id)a3 xpcConnection:(shared_ptr<as:(shared_ptr<as:(unsigned int)a6 :(BOOL)a7 client::DeviceTimeClient>)a5 :client::XPCConnection>)a4 deviceTimeClient:timingSlot:isDecoupledInput:;
- (AVAudioIOPeriod)IOPeriod;
- (AVAudioTimeInterval)dynamicLatency;
- (AudioPresentationTimeStamp)presentationTime;
- (AudioTimeStamp)currentTime;
- (BOOL)isRunning;
- (BOOL)supportsDynamicLatency;
- (__n128)isRunning;
- (id).cxx_construct;
- (int64_t)createIOEventBlock:(id)a3;
- (void)destroyIOEventBlock:(int64_t)a3;
- (void)isRunning;
- (void)privateDispatchIOControllerEvent:(unint64_t)a3;
- (void)setTimingSlot:(unsigned int)a3;
@end

@implementation AVAudioIOController_iOS

- (AVAudioIOController_iOS)initWithSession:(id)a3 xpcConnection:(shared_ptr<as:(shared_ptr<as:(unsigned int)a6 :(BOOL)a7 client::DeviceTimeClient>)a5 :client::XPCConnection>)a4 deviceTimeClient:timingSlot:isDecoupledInput:
{
  char cntrl = (char)a5.__cntrl_;
  int ptr = (int)a5.__ptr_;
  var1 = a4.var1;
  var0 = a4.var0;
  id v12 = a3;
  v23.receiver = self;
  v23.super_class = (Class)AVAudioIOController_iOS;
  v13 = [(AVAudioIOController_iOS *)&v23 init];
  v14 = v13;
  if (v13)
  {
    v15 = v13 + 8;
    if (v13[88])
    {
      v24 = (void **)(v13 + 64);
      std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::__destroy_vector::operator()[abi:ne180100](&v24);
      v16 = (std::__shared_weak_count *)*((void *)v14 + 4);
      if (v16) {
        std::__shared_weak_count::__release_weak(v16);
      }
      objc_destroyWeak((id *)v14 + 1);
      v14[88] = 0;
    }
    uint64_t v18 = *(void *)var0;
    v17 = (std::__shared_weak_count *)*((void *)var0 + 1);
    if (v17)
    {
      atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
      objc_initWeak((id *)v14 + 1, v12);
      v14[16] = cntrl;
      *((void *)v14 + 3) = v18;
      *((void *)v14 + 4) = v17;
      atomic_fetch_add_explicit(&v17->__shared_weak_owners_, 1uLL, memory_order_relaxed);
      *((_DWORD *)v14 + 10) = ptr;
      *((_DWORD *)v14 + 12) = 0;
      *((void *)v14 + 7) = v15;
      *((void *)v14 + 8) = 0;
      *((void *)v14 + 9) = 0;
      *((void *)v14 + 10) = 0;
      std::__shared_weak_count::__release_shared[abi:ne180100](v17);
    }
    else
    {
      objc_initWeak((id *)v14 + 1, v12);
      v14[16] = cntrl;
      *((void *)v14 + 3) = v18;
      *((void *)v14 + 4) = 0;
      *((_DWORD *)v14 + 10) = ptr;
      *((_DWORD *)v14 + 12) = 0;
      *((void *)v14 + 7) = v15;
      *((void *)v14 + 8) = 0;
      *((void *)v14 + 9) = 0;
      *((void *)v14 + 10) = 0;
    }
    v14[88] = 1;
    uint64_t v20 = *(void *)var1;
    uint64_t v19 = *((void *)var1 + 1);
    if (v19) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
    }
    v21 = (std::__shared_weak_count *)*((void *)v14 + 13);
    *((void *)v14 + 12) = v20;
    *((void *)v14 + 13) = v19;
    if (v21) {
      std::__shared_weak_count::__release_shared[abi:ne180100](v21);
    }
  }

  return (AVAudioIOController_iOS *)v14;
}

- (void)setTimingSlot:(unsigned int)a3
{
}

- (AudioTimeStamp)currentTime
{
  as::client::DeviceTimeClient::currentTime(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (BOOL)isRunning
{
  v6[4] = *MEMORY[0x1E4F143B8];
  v5 = self;
  BOOL v4 = 0;
  v2 = as::client::DeviceTimeGlobalState::instance((as::client::DeviceTimeGlobalState *)self);
  v6[0] = &unk_1EF4FB360;
  v6[1] = &v5;
  v6[2] = &v4;
  v6[3] = v6;
  (*(void (**)(void *, void *))(*(void *)v2 + 16))(v2, v6);
  std::__function::__value_func<void ()(as::DTSharedBlock const&)>::~__value_func[abi:ne180100](v6);
  return v4;
}

- (AVAudioIOPeriod)IOPeriod
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  if (!WeakRetained) {
    goto LABEL_8;
  }
  v6 = (std::__shared_weak_count *)*((void *)self + 4);
  if (!v6) {
    goto LABEL_8;
  }
  v7 = std::__shared_weak_count::lock(v6);
  if (!v7) {
    goto LABEL_8;
  }
  v8 = v7;
  v9 = (as::client::XPCConnection *)*((void *)self + 3);
  if (!v9)
  {
LABEL_7:
    std::__shared_weak_count::__release_shared[abi:ne180100](v8);
LABEL_8:

    *(_OWORD *)&retstr->var0 = 0u;
    *(_OWORD *)&retstr->var2 = 0u;
    return result;
  }
  as::client::XPCConnection::sync_message<double,unsigned long>(v9, &v19);
  v10 = (void *)MEMORY[0x1A6235350]();
  v11 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},double,unsigned long>::sync_proxy(&v19);
  uint64_t v12 = [WeakRetained opaqueSessionID];
  int v13 = *((unsigned __int8 *)self + 16);
  v14 = caulk::xpc::message<objc_object  {objcproto25SessionManagerXPCProtocol}* {__strong},double,unsigned long>::reply((uint64_t)&v19);
  [v11 getIOControllerPeriod:v12 decoupledInput:v13 != 0 reply:v14];

  if (v21)
  {

    std::__function::__value_func<void ()(NSError *,std::tuple<double,unsigned long> &&)>::~__value_func[abi:ne180100](v20);
    goto LABEL_7;
  }
  double v16 = v22;
  unint64_t v17 = v23;
  retstr->var0 = v22;
  double v18 = 0.0;
  if (v16 > 0.0) {
    double v18 = (double)v17 / v16;
  }
  retstr->var1 = v18;
  retstr->var2 = v17;
  retstr->var3 = 1.0;

  std::__function::__value_func<void ()(NSError *,std::tuple<double,unsigned long> &&)>::~__value_func[abi:ne180100](v20);
  std::__shared_weak_count::__release_shared[abi:ne180100](v8);

  return result;
}

- (int64_t)createIOEventBlock:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)self + 1);
  if (WeakRetained)
  {
    os_unfair_lock_lock((os_unfair_lock_t)self + 12);
    unint64_t add = 0;
    id v9 = v4;
    std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::emplace_back<long const&,void({block_pointer} {__strong}&)(AVAudioIOControllerEvent)>((char **)self + 8, &add, &v9);
    if (*((void *)self + 9) - *((void *)self + 8) == 16) {
    int64_t v6 = add;
    }

    os_unfair_lock_unlock((os_unfair_lock_t)self + 12);
  }
  else
  {
    int64_t v6 = 0;
  }

  return v6;
}

- (void)destroyIOEventBlock:(int64_t)a3
{
  v5 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  v7 = (void *)*((void *)self + 8);
  int64_t v6 = (void *)*((void *)self + 9);
  if (v7 != v6)
  {
    while (*v7 != a3)
    {
      v7 += 2;
      if (v7 == v6) {
        goto LABEL_10;
      }
    }
  }
  if (v7 != v6)
  {
    std::__unwrap_and_dispatch[abi:ne180100]<std::__overload<std::__move_loop<std::_ClassicAlgPolicy>,std::__move_trivial>,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)> *,0>(v7 + 2, v6, v7);
    uint64_t v9 = v8;
    uint64_t v10 = *((void *)self + 9);
    if (v10 != v8)
    {
      do
      {
        uint64_t v11 = v10 - 16;

        uint64_t v10 = v11;
      }
      while (v11 != v9);
    }
    *((void *)self + 9) = v9;
    if (*((void *)self + 8) == v9) {
  }
    }
LABEL_10:
  os_unfair_lock_unlock(v5);
}

- (void)privateDispatchIOControllerEvent:(unint64_t)a3
{
  id v4 = (os_unfair_lock_s *)((char *)self + 48);
  os_unfair_lock_lock((os_unfair_lock_t)self + 12);
  uint64_t v6 = *((void *)self + 8);
  uint64_t v5 = *((void *)self + 9);
  while (v6 != v5)
  {
    (*(void (**)(void))(*(void *)(v6 + 8) + 16))();
    v6 += 16;
  }
  os_unfair_lock_unlock(v4);
}

- (AudioPresentationTimeStamp)presentationTime
{
  as::client::DeviceTimeClient::currentPresentationTime(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (BOOL)supportsDynamicLatency
{
  return as::client::DeviceTimeClient::isLatencyDynamic(*((as::client::DeviceTimeClient **)self + 12));
}

- (AVAudioTimeInterval)dynamicLatency
{
  as::client::DeviceTimeClient::currentLatency(*((as::client::DeviceTimeClient **)self + 12), (uint64_t)retstr);
  return result;
}

- (void).cxx_destruct
{
  v3 = (std::__shared_weak_count *)*((void *)self + 13);
  if (v3) {
    std::__shared_weak_count::__release_shared[abi:ne180100](v3);
  }
  if (*((unsigned char *)self + 88))
  {
    uint64_t v5 = (void **)((char *)self + 64);
    std::vector<std::pair<long,void({block_pointer} {__strong})(AVAudioIOControllerEvent)>>::__destroy_vector::operator()[abi:ne180100](&v5);
    id v4 = (std::__shared_weak_count *)*((void *)self + 4);
    if (v4) {
      std::__shared_weak_count::__release_weak(v4);
    }
    objc_destroyWeak((id *)self + 1);
  }
}

- (id).cxx_construct
{
  *((unsigned char *)self + 8) = 0;
  *((unsigned char *)self + 88) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 13) = 0;
  return self;
}

- (void)isRunning
{
  unsigned int v2 = atomic_load((unsigned int *)(**(void **)(a1 + 8) + 40));
  if (v2 >= 0x21F) {
    goto LABEL_14;
  }
  caulk::concurrent::atomic_value<as::SessionSharedState,2,3>::load(a2 + 104 * v2 + 8, (uint64_t)v8);
  if (*(unsigned char *)(**(void **)(a1 + 8) + 16))
  {
    if (v10 && v8[0] != 255)
    {
      if (v8[0] < 0x42u)
      {
        uint64_t v5 = a2 + 136 * v8[0];
LABEL_12:
        caulk::concurrent::atomic_value<as::MinimalTimeStamp,2,3>::load(v5 + 56480, (uint64_t)v7);
        **(unsigned char **)(a1 + 16) = v7[0];
        return;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unsigned int v6 = v9;
    if (v9 != 255 || !v10 && (unsigned int v6 = v8[0], v8[0] != 255))
    {
      if (v6 < 0x42)
      {
        uint64_t v5 = a2 + 136 * v6;
        goto LABEL_12;
      }
LABEL_14:
      std::__throw_out_of_range[abi:ne180100]("array::at");
    }
  }
}

- (__n128)isRunning
{
  *(void *)a2 = &unk_1EF4FB360;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

@end