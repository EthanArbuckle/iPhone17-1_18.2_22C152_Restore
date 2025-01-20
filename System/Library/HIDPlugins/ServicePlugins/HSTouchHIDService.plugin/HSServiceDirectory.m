@interface HSServiceDirectory
- (BOOL)_addClient:(FileDescriptor *)a3;
- (BOOL)_removeClient:(shared_ptr<Client>)a3;
- (BOOL)addClient:(FileDescriptor *)a3;
- (BOOL)addService:(id)a3;
- (BOOL)removeService:(id)a3;
- (HSServiceDirectory)init;
- (HSServiceDirectory)initWithReceiveRight:(ReceiveRight *)a3 authorizer:(id)a4;
- (SendRight)_handleNewClient:(__SecTask *)a3;
- (id).cxx_construct;
- (void)_handleDataFromClient:(shared_ptr<Client>)a3;
- (void)_handleMessage:(void *)a3 fromClient:(shared_ptr<Client>)a4;
- (void)setRemoteAccessSocket:(FileDescriptor *)a3;
@end

@implementation HSServiceDirectory

- (HSServiceDirectory)initWithReceiveRight:(ReceiveRight *)a3 authorizer:(id)a4
{
  id v30 = self;
  SEL v29 = a2;
  v28 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  if (!HSUtil::PortRight::operator BOOL((uint64_t)v28))
  {
    v17 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v17 handleFailureInMethod:v29, v30, @"HSServiceDirectory.mm", 103, @"Invalid parameter not satisfying: %@", @"receiveRight" object file lineNumber description];
  }
  if (!location)
  {
    v16 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v16 handleFailureInMethod:v29, v30, @"HSServiceDirectory.mm", 104, @"Invalid parameter not satisfying: %@", @"authorizer" object file lineNumber description];
  }
  id v4 = v30;
  id v30 = 0;
  v26.receiver = v4;
  v26.super_class = (Class)HSServiceDirectory;
  obj = [(HSServiceDirectory *)&v26 init];
  id v30 = obj;
  objc_storeStrong(&v30, obj);
  if (obj)
  {
    dispatch_queue_t v5 = dispatch_queue_create("HSServiceDirectory queue", 0);
    v6 = (void *)*((void *)v30 + 1);
    *((void *)v30 + 1) = v5;

    id v7 = objc_retainBlock(location);
    v8 = (void *)*((void *)v30 + 2);
    *((void *)v30 + 2) = v7;

    objc_initWeak(&from, v30);
    v14 = [HSMachPortListener alloc];
    v11 = v28;
    uint64_t v12 = *((void *)v30 + 1);
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = __54__HSServiceDirectory_initWithReceiveRight_authorizer___block_invoke;
    v22 = &unk_142A68;
    objc_copyWeak(&v23, &from);
    v13 = [(HSMachPortListener *)v14 initWithReceiveRight:v11 queue:v12 clientHandler:&v18];
    v9 = (void *)*((void *)v30 + 3);
    *((void *)v30 + 3) = v13;

    v31 = (HSServiceDirectory *)v30;
    int v25 = 1;
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
  }
  else
  {
    v31 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v30, 0);
  return v31;
}

void __54__HSServiceDirectory_initWithReceiveRight_authorizer___block_invoke(id *a1@<X0>, uint64_t a2@<X1>, HSUtil::SendRight *a3@<X8>)
{
  v8 = a3;
  id v7 = a1;
  uint64_t v6 = a2;
  location[1] = a1;
  location[0] = objc_loadWeakRetained(a1 + 4);
  if (location[0])
  {
    [location[0] _handleNewClient:v6];
    int v4 = 1;
  }
  else
  {
    int v4 = 0;
  }
  objc_storeStrong(location, 0);
  if (!v4) {
    HSUtil::SendRight::SendRight(a3);
  }
}

- (HSServiceDirectory)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)HSServiceDirectory;
  obj = [(HSServiceDirectory *)&v6 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    dispatch_queue_t v2 = dispatch_queue_create("HSServiceDirectory queue", 0);
    v3 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v2;

    v9 = (HSServiceDirectory *)location;
  }
  else
  {
    v9 = 0;
  }
  objc_storeStrong(&location, 0);
  return v9;
}

- (BOOL)addService:(id)a3
{
  v14 = self;
  SEL v13 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    SEL v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v13, v14, @"HSServiceDirectory.mm", 129, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v11, (uint64_t)v14 + 32);
  uint64_t v6 = (uint64_t)v14 + 96;
  id v8 = [location serviceName];
  std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>::pair[abi:ne180100]<NSString * {__strong},objc_object {__strong}&,0>((uint64_t)v9, (uint64_t *)&v8, &location);
  v10[0] = std::map<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak},HSUtil::ObjectLess<NSString>,std::allocator<std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}*>>>::insert[abi:ne180100](v6, v9);
  v10[1] = v3;
  std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>::~pair(v9);
  objc_storeStrong(&v8, 0);
  std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
  char v5 = *(unsigned char *)std::get[abi:ne180100]<1ul,std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>,BOOL>((uint64_t)v10);
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v11);
  objc_storeStrong(&location, 0);
  return v5 & 1;
}

- (BOOL)removeService:(id)a3
{
  v16 = self;
  SEL v15 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    uint64_t v6 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v6 handleFailureInMethod:v15, v16, @"HSServiceDirectory.mm", 136, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v13, (uint64_t)v16 + 32);
  uint64_t v5 = (uint64_t)v16 + 96;
  id v11 = [location serviceName];
  uint64_t v12 = std::map<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak},HSUtil::ObjectLess<NSString>,std::allocator<std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}*>>>::find[abi:ne180100](v5, &v11);
  objc_storeStrong(&v11, 0);
  BOOL v10 = 0;
  uint64_t v9 = std::set<std::shared_ptr<HSMapper>>::end[abi:ne180100]();
  BOOL v10 = std::operator!=[abi:ne180100](&v12, &v9);
  if (v10)
  {
    std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>::operator->[abi:ne180100]((uint64_t)&v12);
    objc_storeWeak((id *)(v3 + 8), 0);
    char v17 = 1;
  }
  else
  {
    id v8 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v19);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v18, (uint64_t)"-[HSServiceDirectory removeService:]", (uint64_t)v8, 139, (uint64_t)"find != _state.services.end()");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v18, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v17 = 0;
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v13);
  objc_storeStrong(&location, 0);
  return v17 & 1;
}

- (BOOL)addClient:(FileDescriptor *)a3
{
  id v8 = self;
  SEL v7 = a2;
  uint64_t v6 = a3;
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v5, (uint64_t)self + 32);
  unsigned __int8 v4 = [(HSServiceDirectory *)v8 _addClient:v6];
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v5);
  return v4 & 1;
}

- (void)setRemoteAccessSocket:(FileDescriptor *)a3
{
  id val = self;
  SEL v20 = a2;
  int v19 = a3;
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v18, (uint64_t)self + 32);
  [*((id *)val + 18) close];
  objc_storeStrong((id *)val + 18, 0);
  if (HSUtil::FileDescriptor::operator BOOL((uint64_t)v19))
  {
    objc_initWeak(&location, val);
    SEL v7 = [HSSocketListener alloc];
    uint64_t v5 = v19;
    uint64_t v6 = *((void *)val + 1);
    id v11 = _NSConcreteStackBlock;
    int v12 = -1073741824;
    int v13 = 0;
    v14 = __44__HSServiceDirectory_setRemoteAccessSocket___block_invoke;
    SEL v15 = &unk_142678;
    objc_copyWeak(&v16, &location);
    unsigned __int8 v4 = [(HSSocketListener *)v7 initWithSocket:v5 queue:v6 clientHandler:&v11];
    uint64_t v3 = (void *)*((void *)val + 18);
    *((void *)val + 18) = v4;

    BOOL v10 = 0;
    BOOL v10 = *((void *)val + 18) != 0;
    if (!v10)
    {
      uint64_t v9 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v23);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v22, (uint64_t)"-[HSServiceDirectory setRemoteAccessSocket:]", (uint64_t)v9, 161, (uint64_t)"_state.socketListener");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v22, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v18);
}

void __44__HSServiceDirectory_setRemoteAccessSocket___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained addClient:a2];
}

- (BOOL)_addClient:(FileDescriptor *)a3
{
  v41 = self;
  v40[3] = a2;
  v40[2] = a3;
  HSUtil::FileDescriptor::FileDescriptor((uint64_t)v37, (uint64_t)a3);
  uint64_t v38 = 0;
  HSUtil::Buffer::Buffer((HSUtil::Buffer *)&v39);
  std::make_shared[abi:ne180100]<Client,Client,void>((uint64_t)v37, v40);
  Client::~Client((Client *)v37);
  uint64_t v3 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40);
  int v14 = HSUtil::FileDescriptor::fd(v3);
  dispatch_source_t v13 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, v14, 0, *((dispatch_queue_t *)v41 + 1));
  uint64_t v4 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40);
  uint64_t v5 = *(void **)(v4 + 24);
  *(void *)(v4 + 24) = v13;

  BOOL v36 = 0;
  BOOL v36 = *(void *)(std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40)
                  + 24) != 0;
  if (v36)
  {
    objc_initWeak(&from, v41);
    std::weak_ptr<HSMapper>::weak_ptr<HSMapper,0>(v30, v40);
    source = *(NSObject **)(std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40)
                          + 24);
    handler = _NSConcreteStackBlock;
    int v24 = -973078528;
    int v25 = 0;
    objc_super v26 = __33__HSServiceDirectory__addClient___block_invoke;
    v27 = &unk_142A90;
    std::weak_ptr<HSMapper>::weak_ptr<HSMapper,0>(v29, v30);
    objc_copyWeak(&v28, &from);
    dispatch_source_set_event_handler(source, &handler);
    id v11 = (char *)v41 + 120;
    uint64_t v6 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40);
    int v20 = HSUtil::FileDescriptor::fd(v6);
    std::pair<int const,std::shared_ptr<Client>>::pair[abi:ne180100]<int,std::shared_ptr<Client>&,0>((uint64_t)v21, &v20, v40);
    v22[0] = std::map<int,std::shared_ptr<Client>>::insert[abi:ne180100]((uint64_t)v11, (uint64_t)v21);
    v22[1] = v7;
    std::pair<int const,std::shared_ptr<Client>>::~pair((uint64_t)v21);
    std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
    uint64_t v19 = v8;
    v18 = (unsigned char *)std::get[abi:ne180100]<1ul,std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>,BOOL>((uint64_t)v22);
    char v17 = 0;
    char v17 = *v18 & 1;
    if (v17)
    {
      uint64_t v9 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v40);
      dispatch_resume(*(dispatch_object_t *)(v9 + 24));
      char v42 = 1;
      int v32 = 1;
    }
    else
    {
      id v16 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v44);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v43, (uint64_t)"-[HSServiceDirectory _addClient:]", (uint64_t)v16, 183, (uint64_t)"br");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v43, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      char v42 = 0;
      int v32 = 1;
    }
    objc_destroyWeak(&v28);
    std::weak_ptr<HSMapper>::~weak_ptr((uint64_t)v29);
    std::weak_ptr<HSMapper>::~weak_ptr((uint64_t)v30);
    objc_destroyWeak(&from);
  }
  else
  {
    v35 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v46);
    id location = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v45, (uint64_t)"-[HSServiceDirectory _addClient:]", (uint64_t)v35, 172, (uint64_t)"client->source");
      _os_log_error_impl(&def_411C8, (os_log_t)location, type, "Assertion failed (%s @ %s:%ju): %s", v45, 0x2Au);
    }
    objc_storeStrong(&location, 0);
    char v42 = 0;
    int v32 = 1;
  }
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v40);
  return v42 & 1;
}

uint64_t __33__HSServiceDirectory__addClient___block_invoke(uint64_t a1)
{
  v5[3] = a1;
  v5[2] = a1;
  std::weak_ptr<HSMapper>::lock(a1 + 40, v5);
  if (std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::operator BOOL[abi:ne180100]((uint64_t)v5))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v4, v5);
    [WeakRetained _handleDataFromClient:v4];
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
  }
  return std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v5);
}

- (BOOL)_removeClient:(shared_ptr<Client>)a3
{
  var0 = a3.var0;
  SEL v15 = self;
  SEL v14 = a2;
  dispatch_source_t v13 = a3.var0;
  *(_DWORD *)&v12[8] = 0;
  uint64_t v3 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)a3.var0);
  *(void *)int v12 = HSUtil::FileDescriptor::fd(v3);
  *(void *)&v12[4] = std::map<int,std::shared_ptr<Client>>::erase[abi:ne180100]((uint64_t)self + 120, v12);
  BOOL v11 = *(void *)&v12[4] == 1;
  if (*(void *)&v12[4] == 1)
  {
    uint64_t v4 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0);
    dispatch_source_cancel(*(dispatch_source_t *)(v4 + 24));
    uint64_t v5 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0);
    objc_storeStrong((id *)(v5 + 24), 0);
    char v16 = 1;
  }
  else
  {
    BOOL v10 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v18);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v17, (uint64_t)"-[HSServiceDirectory _removeClient:]", (uint64_t)v10, 192, (uint64_t)"n==1");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v17, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v16 = 0;
  }
  return v16 & 1;
}

- (SendRight)_handleNewClient:(__SecTask *)a3
{
  uint64_t v6 = v3;
  int v24 = v3;
  id v23 = self;
  SEL v22 = a2;
  v21 = a3;
  char v20 = 0;
  char v20 = (*(uint64_t (**)(void))(*((void *)self + 2) + 16))() & 1;
  if (v20)
  {
    int v19 = socketpair(1, 1, 0, v29);
    BOOL v18 = v19 == 0;
    if (v19)
    {
      char v17 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v28);
      os_log_t oslog = &_os_log_default;
      os_log_type_t type = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v27, (uint64_t)"-[HSServiceDirectory _handleNewClient:]", (uint64_t)v17, 208, (uint64_t)"!ir");
        _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v27, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      uint64_t v4 = (void **)HSUtil::SendRight::SendRight(v6);
    }
    else
    {
      HSUtil::FileDescriptor::FileDescriptor((HSUtil::FileDescriptor *)v14, v29[0]);
      HSUtil::FileDescriptor::FileDescriptor((HSUtil::FileDescriptor *)v13, v29[1]);
      v12[4] = 0;
      HSUtil::FileDescriptor::fd((HSUtil::FileDescriptor *)v13);
      int v19 = fileport_makeport();
      *(_DWORD *)int v12 = v19 == 0;
      if (v19)
      {
        BOOL v11 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServiceDirectory.mm", v26);
        os_log_t v10 = &_os_log_default;
        os_log_type_t v9 = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v25, (uint64_t)"-[HSServiceDirectory _handleNewClient:]", (uint64_t)v11, 215, (uint64_t)"!ir");
          _os_log_error_impl(&def_411C8, v10, v9, "Assertion failed (%s @ %s:%ju): %s", v25, 0x2Au);
        }
        objc_storeStrong((id *)&v10, 0);
        HSUtil::SendRight::SendRight(v6);
        int v8 = 1;
      }
      else
      {
        std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v7, (uint64_t)v23 + 32);
        [(HSServiceDirectory *)v23 _addClient:v14];
        HSUtil::SendRight::SendRight(v6, *(int *)&v12[1]);
        int v8 = 1;
        std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v7);
      }
      HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v13);
      HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v14);
    }
  }
  else
  {
    uint64_t v4 = (void **)HSUtil::SendRight::SendRight(v6);
  }
  result._mp = v5;
  result._vptr$PortRight = v4;
  return result;
}

- (void)_handleDataFromClient:(shared_ptr<Client>)a3
{
  var0 = a3.var0;
  int v32 = self;
  SEL v31 = a2;
  id v30 = a3.var0;
  std::unique_lock<std::mutex>::unique_lock[abi:ne180100]((uint64_t)v29, (uint64_t)self + 32);
  id v28 = (HSUtil::Buffer *)(std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0)
                         + 32);
  if ((unint64_t)HSUtil::Buffer::length(v28) < 4)
  {
    uint64_t v27 = 4 - HSUtil::Buffer::length(v28);
    uint64_t v16 = HSUtil::Buffer::length(v28);
    uint64_t v3 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0);
    uint64_t v25 = (*(uint64_t (**)(HSUtil::Buffer *, uint64_t, uint64_t, void, uint64_t))(*(void *)v28 + 32))(v28, v16, v3, 0, v27);
    uint64_t v26 = v4;
    if (v25)
    {
      if (v25 != 35)
      {
        exception = (std::system_error *)__cxa_allocate_exception(0x20uLL);
        uint64_t v5 = std::system_category();
        std::system_error::system_error(exception, v25, v5, "buf.readFrom() failed");
      }
      int v24 = 1;
      goto LABEL_25;
    }
    if (!v26)
    {
      SEL v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v14, "client disconnected");
    }
    if ((unint64_t)HSUtil::Buffer::length(v28) < 4)
    {
      int v24 = 1;
      goto LABEL_25;
    }
  }
  unsigned int v23 = 0;
  unsigned int v33 = *(_DWORD *)HSUtil::Buffer::data(v28);
  unsigned int v23 = v33;
  if (v33 >= 0x10000)
  {
    dispatch_source_t v13 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v13, "msgLen too long");
  }
  uint64_t v12 = HSUtil::Buffer::length(v28);
  uint64_t v6 = std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0);
  uint64_t v21 = (*(uint64_t (**)(HSUtil::Buffer *, uint64_t, uint64_t, void, void))(*(void *)v28 + 32))(v28, v12, v6, 0, v23);
  unint64_t v22 = v7;
  if (v21)
  {
    if (v21 != 35)
    {
      BOOL v11 = (std::system_error *)__cxa_allocate_exception(0x20uLL);
      int v8 = std::system_category();
      std::system_error::system_error(v11, v21, v8, "buf.readFrom() failed");
    }
    int v24 = 1;
  }
  else
  {
    if (!v22)
    {
      os_log_t v10 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v10, "client disconnected");
    }
    if (v22 > v23) {
      __assert_rtn("-[HSServiceDirectory _handleDataFromClient:]", "HSServiceDirectory.mm", 259, "rr.len <= msgLen");
    }
    if (HSUtil::Buffer::length(v28) >= (unint64_t)v23 + 4)
    {
      HSUtil::Buffer::slice<HSUtil::Buffer::RefType>(v28, 4uLL, (uint64_t)v19);
      HSUtil::DecoderBuf::DecoderBuf((uint64_t)v20, (uint64_t)v19);
      HSUtil::Buffer::~Buffer((HSUtil::Buffer *)v19);
      HSUtil::Buffer::setLength(v28, 0);
      os_log_type_t v9 = v32;
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v18, var0);
      [(HSServiceDirectory *)v9 _handleMessage:v20 fromClient:v18];
      std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v18);
      HSUtil::DecoderBuf::~DecoderBuf((HSUtil::DecoderBuf *)v20);
      int v24 = 0;
    }
    else
    {
      int v24 = 1;
    }
  }
LABEL_25:
  std::unique_lock<std::mutex>::~unique_lock[abi:ne180100]((uint64_t)v29);
}

- (void)_handleMessage:(void *)a3 fromClient:(shared_ptr<Client>)a4
{
  var0 = a4.var0;
  v55 = self;
  SEL v54 = a2;
  v53 = (HSUtil::Coder *)a3;
  v52 = a4.var0;
  HSUtil::Decoder::decodeArray((HSUtil::Decoder *)a3, (uint64_t)v51);
  if (!HSUtil::Coder::ok(v53))
  {
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "decoder.decodeArray() failed");
  }
  char v50 = HSUtil::Decoder::decodeUInt((HSUtil::Decoder *)v51);
  if (!HSUtil::Coder::ok((HSUtil::Coder *)v51))
  {
    uint64_t v26 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(v26, "array.decodeUInt() failed");
  }
  if (v50)
  {
    if (v50 != 1)
    {
      SEL v14 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v14, "unknown command");
    }
    id v42 = HSUtil::Decoder::decodeNSString((HSUtil::Decoder *)v51);
    if (!HSUtil::Coder::ok((HSUtil::Coder *)v51))
    {
      int v19 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v19, "array.decodeNSString() failed");
    }
    id v41 = HSUtil::Decoder::decodeNSDictionary((HSUtil::Decoder *)v51);
    if (!HSUtil::Coder::ok((HSUtil::Coder *)v51))
    {
      BOOL v18 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v18, "array.decodeNSDictionary() failed");
    }
    char v17 = v55;
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v40, var0);
    [(HSServiceDirectory *)v17 _removeClient:v40];
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v40);
    uint64_t v39 = std::map<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak},HSUtil::ObjectLess<NSString>,std::allocator<std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}*>>>::find[abi:ne180100]((uint64_t)v55 + 96, &v42);
    uint64_t v38 = std::set<std::shared_ptr<HSMapper>>::end[abi:ne180100]();
    if (std::operator==[abi:ne180100](&v39, &v38))
    {
      uint64_t v16 = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
      std::runtime_error::runtime_error(v16, "invalid service name");
    }
    std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>::operator->[abi:ne180100]((uint64_t)&v39);
    id WeakRetained = objc_loadWeakRetained((id *)(v13 + 8));
    queue = *((void *)v55 + 1);
    SEL v29 = _NSConcreteStackBlock;
    int v30 = -973078528;
    int v31 = 0;
    int v32 = __48__HSServiceDirectory__handleMessage_fromClient___block_invoke;
    unsigned int v33 = &unk_142AC8;
    id v34 = WeakRetained;
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v36, var0);
    id v35 = v41;
    dispatch_async(queue, &v29);
    int v43 = 2;
    objc_storeStrong(&v35, 0);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v36);
    objc_storeStrong(&v34, 0);
    objc_storeStrong(&WeakRetained, 0);
    objc_storeStrong(&v41, 0);
    objc_storeStrong(&v42, 0);
  }
  else
  {
    id v49 = (id)objc_opt_new();
    HSUtil::EncoderBuf::EncoderBuf((HSUtil::EncoderBuf *)v56);
    HSUtil::Encoder::encodeArrayStart((HSUtil::Coder *)v56, 4u);
    v48[1] = (uint64_t)v55 + 96;
    v48[0] = std::set<std::shared_ptr<HSMapper>>::begin[abi:ne180100]();
    uint64_t v47 = std::set<std::shared_ptr<HSMapper>>::end[abi:ne180100]();
    while (std::operator!=[abi:ne180100](v48, &v47))
    {
      std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>::operator*[abi:ne180100]((uint64_t)v48);
      std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>::pair[abi:ne180100]((uint64_t)v46, v4);
      std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
      uint64_t v45 = v5;
      id location = (id *)std::get[abi:ne180100]<1ul,std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>,BOOL>((uint64_t)v46);
      id v25 = objc_loadWeakRetained(location);

      if (v25)
      {
        id v24 = objc_loadWeakRetained(location);
        id v6 = [v24 serviceName];
        unint64_t v7 = (void *)*((void *)v49 + 1);
        *((void *)v49 + 1) = v6;

        id v23 = objc_loadWeakRetained(location);
        id v8 = [v23 serviceDescription];
        os_log_type_t v9 = (void *)*((void *)v49 + 2);
        *((void *)v49 + 2) = v8;

        id v22 = objc_loadWeakRetained(location);
        id v10 = [v22 serviceProtocol];
        BOOL v11 = (void *)*((void *)v49 + 3);
        *((void *)v49 + 3) = v10;

        id v21 = objc_loadWeakRetained(location);
        id v20 = [v21 serviceVersion];
        *((void *)v49 + 4) = v20;

        HSUtil::Encoder::encodeHSCodable((HSUtil::Coder *)v56, v49);
        int v43 = 0;
      }
      else
      {
        int v43 = 4;
      }
      std::pair<NSString * const {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>::~pair(v46);
      std::__map_iterator<std::__tree_iterator<std::__value_type<NSString * {__strong},objc_object  {objcproto22HSServiceDirectoryable}* {__weak}>,std::__tree_node<objc_object  {objcproto22HSServiceDirectoryable}* {__weak},void *> *,long>>::operator++[abi:ne180100](v48);
    }
    HSUtil::Encoder::encodeObjectStop((HSUtil::Encoder *)v56);
    uint64_t v12 = (HSUtil::FileDescriptor *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)var0);
    sendMessage(v12, (HSUtil::EncoderBuf *)v56);
    int v43 = 2;
    HSUtil::EncoderBuf::~EncoderBuf((HSUtil::EncoderBuf *)v56);
    objc_storeStrong(&v49, 0);
  }
  HSUtil::Decoder::~Decoder((HSUtil::Decoder *)v51);
}

id __48__HSServiceDirectory__handleMessage_fromClient___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) addClient:std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100](a1 + 48) config:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end