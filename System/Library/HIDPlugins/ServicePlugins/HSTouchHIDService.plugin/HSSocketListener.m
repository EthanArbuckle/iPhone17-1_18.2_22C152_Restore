@interface HSSocketListener
- (HSSocketListener)initWithSocket:(FileDescriptor *)a3 queue:(id)a4 clientHandler:(id)a5;
- (id).cxx_construct;
- (void)_handleNewClient;
- (void)close;
- (void)dealloc;
@end

@implementation HSSocketListener

- (HSSocketListener)initWithSocket:(FileDescriptor *)a3 queue:(id)a4 clientHandler:(id)a5
{
  id val = self;
  SEL v64 = a2;
  v63 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v61 = 0;
  objc_storeStrong(&v61, a5);
  if (!HSUtil::FileDescriptor::operator BOOL((uint64_t)v63))
  {
    v18 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v18 handleFailureInMethod:v64, val, @"HSSocketListener.mm", 21, @"Invalid parameter not satisfying: %@", @"socket" object file lineNumber description];
  }
  if (!location)
  {
    v17 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v17 handleFailureInMethod:v64, val, @"HSSocketListener.mm", 22, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  if (!v61)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v16 handleFailureInMethod:v64, val, @"HSSocketListener.mm", 23, @"Invalid parameter not satisfying: %@", @"clientHandler" object file lineNumber description];
  }
  id v5 = val;
  id val = 0;
  v60.receiver = v5;
  v60.super_class = (Class)HSSocketListener;
  v15 = [(HSSocketListener *)&v60 init];
  id val = v15;
  objc_storeStrong(&val, v15);
  if (v15)
  {
    objc_storeStrong((id *)val + 1, location);
    id v14 = objc_retainBlock(v61);
    v6 = (void *)*((void *)val + 2);
    *((void *)val + 2) = v14;

    std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v58, (uint64_t)val + 24);
    std::make_shared[abi:ne180100]<HSUtil::FileDescriptor,HSUtil::FileDescriptor,void>((uint64_t)v63, v57);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)val + 11, v57);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v57);
    char v56 = 0;
    std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)val + 88);
    char v52 = 0;
    char v53 = 0;
    int v50 = -1;
    std::chrono::duration<long long,std::ratio<1l,1l>>::duration[abi:ne180100]<int,0>(&v51, &v50);
    std::chrono::duration<long long,std::ratio<1l,1000000l>>::duration[abi:ne180100]<long long,std::ratio<1l,1l>,0>(&v54, (uint64_t)&v51);
    int v48 = -1;
    std::chrono::duration<long long,std::ratio<1l,1l>>::duration[abi:ne180100]<int,0>(&v49, &v48);
    std::chrono::duration<long long,std::ratio<1l,1000000l>>::duration[abi:ne180100]<long long,std::ratio<1l,1l>,0>(&v55, (uint64_t)&v49);
    char v56 = HSUtil::ConfigureSocket() & 1;
    char v47 = v56;
    if (v56)
    {
      v7 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)val + 88);
      int v13 = HSUtil::FileDescriptor::fd(v7);
      dispatch_source_t v8 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v13, 0, *((dispatch_queue_t *)val + 1));
      v9 = (void *)*((void *)val + 13);
      *((void *)val + 13) = v8;

      BOOL v43 = 0;
      BOOL v43 = *((void *)val + 13) != 0;
      if (v43)
      {
        objc_initWeak(&from, val);
        source = *((void *)val + 13);
        handler = _NSConcreteStackBlock;
        int v34 = -1073741824;
        int v35 = 0;
        v36 = __55__HSSocketListener_initWithSocket_queue_clientHandler___block_invoke;
        v37 = &unk_141240;
        objc_copyWeak(&v38, &from);
        dispatch_source_set_event_handler(source, &handler);
        v26[0] = 0;
        v26[1] = v26;
        int v27 = 301989888;
        int v28 = 64;
        v29 = __Block_byref_object_copy__2;
        v30 = __Block_byref_object_dispose__2;
        v31 = "";
        std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v32, (void *)val + 11);
        v10 = *((void *)val + 13);
        v20 = _NSConcreteStackBlock;
        int v21 = -1073741824;
        int v22 = 0;
        v23 = __55__HSSocketListener_initWithSocket_queue_clientHandler___block_invoke_28;
        v24 = &unk_142B68;
        v25 = v26;
        dispatch_source_set_cancel_handler(v10, &v20);
        dispatch_resume(*((dispatch_object_t *)val + 13));
        v66 = (HSSocketListener *)val;
        int v59 = 1;
        _Block_object_dispose(v26, 8);
        std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v32);
        objc_destroyWeak(&v38);
        objc_destroyWeak(&from);
      }
      else
      {
        v42 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSSocketListener.mm", v68);
        os_log_t v41 = &_os_log_default;
        os_log_type_t v40 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v67, (uint64_t)"-[HSSocketListener initWithSocket:queue:clientHandler:]", (uint64_t)v42, 39, (uint64_t)"_state.source");
          _os_log_error_impl(&def_411C8, v41, v40, "Assertion failed (%s @ %s:%ju): %s", v67, 0x2Au);
        }
        objc_storeStrong((id *)&v41, 0);
        v66 = 0;
        int v59 = 1;
      }
    }
    else
    {
      v46 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSSocketListener.mm", v70);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v69, (uint64_t)"-[HSSocketListener initWithSocket:queue:clientHandler:]", (uint64_t)v46, 36, (uint64_t)"br");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v69, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v66 = 0;
      int v59 = 1;
    }
    std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v58);
  }
  else
  {
    v66 = 0;
    int v59 = 1;
  }
  objc_storeStrong(&v61, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&val, 0);
  return v66;
}

void __55__HSSocketListener_initWithSocket_queue_clientHandler___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleNewClient];
}

uint64_t __55__HSSocketListener_initWithSocket_queue_clientHandler___block_invoke_28(uint64_t a1)
{
  return std::shared_ptr<HSUtil::ReceiveRight>::reset[abi:ne180100]((uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                              + 48));
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;
  [(HSSocketListener *)self close];
  v2.receiver = v4;
  v2.super_class = (Class)HSSocketListener;
  [(HSSocketListener *)&v2 dealloc];
}

- (void)close
{
  v6 = self;
  SEL v5 = a2;
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v4, (uint64_t)self + 24);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v6 + 88))
  {
    dispatch_source_cancel(*((dispatch_source_t *)v6 + 13));
    objc_storeStrong((id *)v6 + 13, 0);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v2);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator=[abi:ne180100]((uint64_t *)v6 + 11, v2);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v2);
    int v3 = 0;
  }
  else
  {
    int v3 = 1;
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v4);
}

- (void)_handleNewClient
{
  v15 = self;
  SEL v14 = a2;
  dispatch_assert_queue_V2(*((dispatch_queue_t *)self + 1));
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)&v13, (uint64_t)v15 + 24);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v15 + 88))
  {
    int v11 = 0;
    do
    {
      objc_super v2 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v15 + 88);
      int v5 = HSUtil::FileDescriptor::fd(v2);
      int v11 = accept(v5, 0, 0);
      BOOL v4 = 0;
      if (v11 == -1) {
        BOOL v4 = *__error() == 4;
      }
    }
    while (v4);
    BOOL v10 = v11 >= 0;
    if (v11 >= 0)
    {
      std::unique_lock<std::mutex>::unlock(&v13);
      uint64_t v3 = *((void *)v15 + 2);
      HSUtil::FileDescriptor::FileDescriptor((HSUtil::FileDescriptor *)v6, v11);
      (*(void (**)(uint64_t, os_log_type_t *))(v3 + 16))(v3, v6);
      HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v6);
      int v12 = 0;
    }
    else
    {
      v9 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSSocketListener.mm", v17);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v16, (uint64_t)"-[HSSocketListener _handleNewClient]", (uint64_t)v9, 88, (uint64_t)"ir >= 0");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v16, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 1;
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)&v13);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end