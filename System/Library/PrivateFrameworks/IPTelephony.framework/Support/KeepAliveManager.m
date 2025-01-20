@interface KeepAliveManager
- (BOOL)isNextKeepAliveWithinThreshold:(double)a3;
- (KeepAliveManager)initWithIdentifier:(KeepAliveManager *)self minInterval:(SEL)a2 maxInterval:()basic_string<char enableWakeUp:()std:(std::allocator<char>> *)a3 :char_traits<char> delegate:;
- (id).cxx_construct;
- (void)connectionManager:(id)a3 handleEvent:(int)a4;
- (void)dealloc;
- (void)growKeepAliveInterval;
- (void)shrinkKeepAliveInterval;
- (void)startKeepAlive;
- (void)startWakeUpOnWifi;
- (void)stopKeepAlive;
- (void)stopWakeUpOnWifi;
@end

@implementation KeepAliveManager

- (KeepAliveManager)initWithIdentifier:(KeepAliveManager *)self minInterval:(SEL)a2 maxInterval:()basic_string<char enableWakeUp:()std:(std::allocator<char>> *)a3 :char_traits<char> delegate:
{
  v7 = v4;
  char v8 = v3;
  double v9 = v6;
  double v10 = v5;
  v30.receiver = self;
  v30.super_class = (Class)KeepAliveManager;
  v11 = [(KeepAliveManager *)&v30 init];
  if (!v11)
  {
LABEL_18:
    v23 = v11;
    goto LABEL_24;
  }
  std::operator+<char>();
  v12 = (void **)(v11 + 16);
  if (v11[39] < 0) {
    operator delete(*v12);
  }
  uint64_t v13 = v29;
  *(_OWORD *)v12 = *(_OWORD *)v28;
  *((void *)v11 + 4) = v13;
  v11[72] = v8;
  v11[73] = 0;
  uint64_t v15 = *v7;
  uint64_t v14 = v7[1];
  if (v14) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v14 + 16), 1uLL, memory_order_relaxed);
  }
  v16 = (std::__shared_weak_count *)*((void *)v11 + 6);
  *((void *)v11 + 5) = v15;
  *((void *)v11 + 6) = v14;
  if (v16) {
    std::__shared_weak_count::__release_weak(v16);
  }
  *((void *)v11 + 10) = dispatch_queue_create("com.apple.ipTelephony.keepAliveQueue", 0);
  v17 = v11 + 16;
  if (v11[39] < 0) {
    v17 = *v12;
  }
  v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", v17);
  uint64_t v19 = [objc_alloc(MEMORY[0x1E4F89D28]) initWithConnectionClass:0 delegate:v11 delegateQueue:*((void *)v11 + 10) serviceIdentifier:v18];
  v20 = (void *)*((void *)v11 + 1);
  *((void *)v11 + 1) = v19;

  v21 = (void *)*((void *)v11 + 1);
  if (v21)
  {
    [v21 setOnlyAllowedStyle:0];
    if (v10 != 0.0) {
      [*((id *)v11 + 1) setMinimumKeepAliveInterval:v10];
    }
    [*((id *)v11 + 1) setMaximumKeepAliveInterval:v9];
    [*((id *)v11 + 1) setEnableNonCellularConnections:1];
    std::string::basic_string[abi:ne180100]<0>(v28, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v22 = ims::debug((uint64_t)v28, (uint64_t)__p);
    (*(void (**)(uint64_t, char *))(*(void *)v22 + 32))(v22, v11 + 16);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v22 + 8), (uint64_t)": PCConnectionManager created with delegate ", 44);
    *(unsigned char *)(v22 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v22 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v22 + 8), (uint64_t)" maxInterval(seconds) = ", 24);
    *(unsigned char *)(v22 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v22 + 17) = 0;
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v22 + 8), (uint64_t)" wakeUpOnWifi = ", 16);
    *(unsigned char *)(v22 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v22 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v22 + 64))(v22, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v22 + 17) = 0;
    if (v27 < 0) {
      operator delete(__p[0]);
    }
    if (SHIBYTE(v29) < 0) {
      operator delete(v28[0]);
    }

    goto LABEL_18;
  }
  std::string::basic_string[abi:ne180100]<0>(v28, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v24 = ims::debug((uint64_t)v28, (uint64_t)__p);
  (*(void (**)(uint64_t, char *))(*(void *)v24 + 32))(v24, v11 + 16);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v24 + 8), (uint64_t)": PCConnectionManager creation failed", 37);
  *(unsigned char *)(v24 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v24 + 64))(v24, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v24 + 17) = 0;
  if (v27 < 0) {
    operator delete(__p[0]);
  }
  if (SHIBYTE(v29) < 0) {
    operator delete(v28[0]);
  }

  v23 = 0;
LABEL_24:

  return v23;
}

- (void)dealloc
{
  [(PCConnectionManager *)self->_manager stopManager];
  [(PCConnectionManager *)self->_manager setDelegate:0];
  manager = self->_manager;
  self->_manager = 0;

  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  *(void *)&self->_keepAliveId.__r_.var0 = 0;
  self->_keepAliveId.var0 = 0;
  if (var0) {
    std::__shared_weak_count::__release_weak(var0);
  }
  dispatch_release((dispatch_object_t)self->_wowAssertion.__cntrl_);
  self->_wowAssertion.__cntrl_ = 0;
  std::string::basic_string[abi:ne180100]<0>(v9, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v5 = ims::debug((uint64_t)v9, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v5 + 32))(v5, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v5 + 8), (uint64_t)": PCConnectionManager destroyed", 31);
  *(unsigned char *)(v5 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v5 + 64))(v5, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v5 + 17) = 0;
  if (v8 < 0) {
    operator delete(__p[0]);
  }
  if (v10 < 0) {
    operator delete(v9[0]);
  }
  v6.receiver = self;
  v6.super_class = (Class)KeepAliveManager;
  [(KeepAliveManager *)&v6 dealloc];
}

- (void)startKeepAlive
{
  if (BYTE1(self->_wowAssertion.__ptr_))
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v3 = ims::debug((uint64_t)v7, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v3 + 32))(v3, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v3 + 8), (uint64_t)": PCConnectionManager already started", 37);
    *(unsigned char *)(v3 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v3 + 17) = 0;
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    if (v8 < 0) {
      operator delete(v7[0]);
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v4 = ims::debug((uint64_t)v7, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v4 + 32))(v4, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v4 + 8), (uint64_t)": Starting PCConnectionManager with minimum interval (ActionReset)", 66);
    *(unsigned char *)(v4 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v4 + 17) = 0;
    if (v6 < 0) {
      operator delete(__p[0]);
    }
    if (v8 < 0) {
      operator delete(v7[0]);
    }
    [(PCConnectionManager *)self->_manager resumeManagerWithAction:3];
    [(KeepAliveManager *)self startWakeUpOnWifi];
    BYTE1(self->_wowAssertion.__ptr_) = 1;
  }
}

- (void)startWakeUpOnWifi
{
  WakeOnWifiAssertion::get((WakeOnWifiAssertion *)self, (char **)&v5);
  weak_ptr<ImsKeepAliveDelegate> v3 = v5;
  weak_ptr<ImsKeepAliveDelegate> v5 = (weak_ptr<ImsKeepAliveDelegate>)0;
  cntrl = self->_delegate.__cntrl_;
  self->_delegate = v3;
  if (cntrl)
  {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
    if (v5.__cntrl_) {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v5.__cntrl_);
    }
  }
}

- (void)stopKeepAlive
{
  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  *(void *)&self->_keepAliveId.__r_.var0 = 0;
  self->_keepAliveId.var0 = 0;
  if (var0) {
    std::__shared_weak_count::__release_weak(var0);
  }
  [(PCConnectionManager *)self->_manager stopManager];
  std::string::basic_string[abi:ne180100]<0>(v7, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v4 = ims::debug((uint64_t)v7, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v4 + 32))(v4, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v4 + 8), (uint64_t)": PCConnectionManager Stopped", 29);
  *(unsigned char *)(v4 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v4 + 64))(v4, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v4 + 17) = 0;
  if (v6 < 0) {
    operator delete(__p[0]);
  }
  if (v8 < 0) {
    operator delete(v7[0]);
  }
  [(KeepAliveManager *)self stopWakeUpOnWifi];
  BYTE1(self->_wowAssertion.__ptr_) = 0;
}

- (void)stopWakeUpOnWifi
{
  cntrl = self->_delegate.__cntrl_;
  self->_delegate.__ptr_ = 0;
  self->_delegate.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (void)growKeepAliveInterval
{
  std::string::basic_string[abi:ne180100]<0>(v6, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v3 = ims::debug((uint64_t)v6, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v3 + 32))(v3, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v3 + 8), (uint64_t)": Enlarge keep alive interval", 29);
  *(unsigned char *)(v3 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v3 + 17) = 0;
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  [(PCConnectionManager *)self->_manager resumeManagerWithAction:0];
}

- (void)shrinkKeepAliveInterval
{
  std::string::basic_string[abi:ne180100]<0>(v6, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v3 = ims::debug((uint64_t)v6, (uint64_t)__p);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v3 + 32))(v3, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v3 + 8), (uint64_t)": Shrink keep alive interval", 28);
  *(unsigned char *)(v3 + 17) = 0;
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v3 + 64))(v3, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v3 + 17) = 0;
  if (v5 < 0) {
    operator delete(__p[0]);
  }
  if (v7 < 0) {
    operator delete(v6[0]);
  }
  [(PCConnectionManager *)self->_manager resumeManagerWithAction:1];
}

- (BOOL)isNextKeepAliveWithinThreshold:(double)a3
{
  [(PCConnectionManager *)self->_manager lastScheduledIntervalTime];
  double v6 = v5;
  std::string::basic_string[abi:ne180100]<0>(v18, "ims.keepalive");
  std::string::basic_string[abi:ne180100]<0>(v16, "");
  uint64_t v7 = ims::debug((uint64_t)v18, (uint64_t)v16);
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v7 + 32))(v7, &self->_keepAliveId);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v7 + 8), (uint64_t)": next event ", 13);
  *(unsigned char *)(v7 + 17) = 0;
  char v8 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v6];
  KAStringFromDate(v8);
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  ctu::cf::assign();
  *(_OWORD *)uint64_t v14 = v20;
  uint64_t v15 = v21;
  (*(void (**)(uint64_t, void **))(*(void *)v7 + 32))(v7, v14);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v7 + 8), (uint64_t)", next event - cushion ", 23);
  double v9 = v6 - a3;
  *(unsigned char *)(v7 + 17) = 0;
  char v10 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceReferenceDate:v9];
  KAStringFromDate(v10);
  long long v20 = 0uLL;
  uint64_t v21 = 0;
  ctu::cf::assign();
  *(_OWORD *)__p = v20;
  uint64_t v13 = v21;
  (*(void (**)(uint64_t, void **))(*(void *)v7 + 32))(v7, __p);
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v7 + 17) = 0;
  if (SHIBYTE(v13) < 0) {
    operator delete(__p[0]);
  }

  if (SHIBYTE(v15) < 0) {
    operator delete(v14[0]);
  }

  if (v17 < 0) {
    operator delete(v16[0]);
  }
  if (v19 < 0) {
    operator delete(v18[0]);
  }
  return CFAbsoluteTimeGetCurrent() >= v9;
}

- (void)connectionManager:(id)a3 handleEvent:(int)a4
{
  id v6 = a3;
  if (a4 == 2)
  {
    std::string::basic_string[abi:ne180100]<0>(v17, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v7 = ims::debug((uint64_t)v17, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v7 + 32))(v7, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v7 + 8), (uint64_t)": Got PC Push Keep Alive event", 30);
    *(unsigned char *)(v7 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v7 + 64))(v7, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v7 + 17) = 0;
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
    var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
    if (var0)
    {
      double v9 = std::__shared_weak_count::lock(var0);
      if (v9)
      {
        char v10 = v9;
        uint64_t v11 = *(void *)&self->_keepAliveId.__r_.var0;
        if (v11)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3321888768;
          v13[2] = __50__KeepAliveManager_connectionManager_handleEvent___block_invoke;
          v13[3] = &__block_descriptor_48_ea8_32c49_ZTSKNSt3__110shared_ptrI20ImsKeepAliveDelegateEE_e5_v8__0l;
          v13[4] = v11;
          uint64_t v14 = v9;
          atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
          ims::performBlock((IMSClientManager *)v13);
          if (v14) {
            std::__shared_weak_count::__release_shared[abi:ne180100](v14);
          }
        }
        std::__shared_weak_count::__release_shared[abi:ne180100](v10);
      }
    }
  }
  else
  {
    std::string::basic_string[abi:ne180100]<0>(v17, "ims.keepalive");
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    uint64_t v12 = ims::debug((uint64_t)v17, (uint64_t)__p);
    (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v12 + 32))(v12, &self->_keepAliveId);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v12 + 8), (uint64_t)": Got PC event ", 15);
    *(unsigned char *)(v12 + 17) = 0;
    std::ostream::operator<<();
    *(unsigned char *)(v12 + 17) = 0;
    (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v12 + 64))(v12, std::endl[abi:ne180100]<char,std::char_traits<char>>);
    *(unsigned char *)(v12 + 17) = 0;
    if (v16 < 0) {
      operator delete(__p[0]);
    }
    if (v18 < 0) {
      operator delete(v17[0]);
    }
  }
}

uint64_t __50__KeepAliveManager_connectionManager_handleEvent___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  cntrl = self->_delegate.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  var0 = (std::__shared_weak_count *)self->_keepAliveId.var0;
  if (var0) {
    std::__shared_weak_count::__release_weak(var0);
  }
  if (*((char *)&self->_keepAliveId.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_keepAliveId.__r_.__value_.var0.var1.__data_);
  }
  objc_storeStrong((id *)&self->_manager, 0);
}

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 1) = 0u;
  return self;
}

@end