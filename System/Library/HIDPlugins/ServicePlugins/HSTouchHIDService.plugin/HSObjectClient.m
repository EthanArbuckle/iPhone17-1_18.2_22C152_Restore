@interface HSObjectClient
+ (id)clientWithAddress:(id)a3 port:(unsigned __int16)a4 config:(const HSObjectClientConfig *)a5;
- (HSObjectClient)initWithSocket:(FileDescriptor *)a3 config:(const HSObjectClientConfig *)a4;
- (_UNKNOWN)initWithSocket:config:;
- (id).cxx_construct;
- (id)initWithSocket:(uint64_t)a3 config:;
- (id)initWithSocket:config:;
- (id)rootObjectProxy;
- (uint64_t)initWithSocket:config:;
- (void)_close;
- (void)_handleConnectionClosed:(shared_ptr<HSMapper>)a3;
- (void)close;
- (void)dealloc;
- (void)initWithSocket:config:;
@end

@implementation HSObjectClient

- (HSObjectClient)initWithSocket:(FileDescriptor *)a3 config:(const HSObjectClientConfig *)a4
{
  id location = self;
  SEL v16 = a2;
  v15 = a3;
  v14 = a4;
  if (!HSUtil::FileDescriptor::operator BOOL((uint64_t)a3))
  {
    v8 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v8 handleFailureInMethod:v16, location, @"HSRemoteObject.mm", 629, @"Invalid parameter not satisfying: %@", @"socket" object file lineNumber description];
  }
  if (!v14->handlerQueue)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v16, location, @"HSRemoteObject.mm", 630, @"Invalid parameter not satisfying: %@", @"config.handlerQueue" object file lineNumber description];
  }
  id v4 = location;
  id location = 0;
  v13.receiver = v4;
  v13.super_class = (Class)HSObjectClient;
  obj = [(HSObjectClient *)&v13 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    HSObjectClientConfig::operator=((uint64_t)location + 8, (uint64_t)v14);
    objc_initWeak(&from, location);
    id v19 = 0;
    char v20 = *((unsigned char *)location + 16) & 1;
    objc_copyWeak(&to, &from);
    std::function<void ()(std::shared_ptr<HSMapper>)>::function<-[HSObjectClient initWithSocket:config:]::$_2,void>((uint64_t)&v21, &to);
    HSMapper::New((uint64_t)v15, *((void **)location + 1), &v19, (uint64_t)v9);
  }
  v18 = 0;
  int v12 = 1;
  objc_storeStrong(&location, 0);
  return v18;
}

- (uint64_t)initWithSocket:config:
{
  std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
  return std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<-[HSObjectClient initWithSocket:config:]::$_2 &,std::shared_ptr<HSMapper>>(v2, a2);
}

- (void)dealloc
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = &_os_log_default;
  char v6 = 2;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEBUG))
  {
    log = location[0];
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_debug_impl(&def_411C8, log, type, "~HSObjectClient", v5, 2u);
  }
  objc_storeStrong(location, 0);
  [(HSObjectClient *)v8 _close];
  v4.receiver = v8;
  v4.super_class = (Class)HSObjectClient;
  [(HSObjectClient *)&v4 dealloc];
}

- (id)rootObjectProxy
{
  v2 = (HSMapper *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&self->_mapper);
  return HSMapper::send(v2, 0, (objc_selector *)"self", 0, 0, 0);
}

- (void)close
{
}

- (void)_close
{
  v2 = (HSMapper *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)&self->_mapper);
  HSMapper::close(v2);
}

- (void)_handleConnectionClosed:(shared_ptr<HSMapper>)a3
{
  if (self->_config.connectionClosed) {
    (*((void (**)(void))self->_config.connectionClosed + 2))();
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (id)initWithSocket:config:
{
  return std::__function::__alloc_func<-[HSObjectServer addClient:config:]::$_0,std::allocator<-[HSObjectServer addClient:config:]::$_0>,void ()(std::shared_ptr<HSMapper>)>::destroy[abi:ne180100]((id *)(a1 + 8));
}

- (void)initWithSocket:config:
{
  v4[3] = a1;
  v4[2] = a2;
  id WeakRetained = objc_loadWeakRetained(a1);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v4, a2);
  [WeakRetained _handleConnectionClosed:v4];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
}

- (_UNKNOWN)initWithSocket:config:
{
}

- (id)initWithSocket:(uint64_t)a3 config:
{
  return a1;
}

{
  std::__compressed_pair_elem<-[HSObjectServer addClient:config:]::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<-[HSObjectServer addClient:config:]::$_0 const&,0ul>(a1, a2);
  std::__compressed_pair_elem<std::allocator<BOOL (*)(HSUtil::Encoder &,objc_object *)>,1,true>::__compressed_pair_elem[abi:ne180100]<std::allocator<BOOL (*)(HSUtil::Encoder &,objc_object *)>&&,0ul>((uint64_t)a1, a3);
  return a1;
}

+ (id)clientWithAddress:(id)a3 port:(unsigned __int16)a4 config:(const HSObjectClientConfig *)a5
{
  id v25 = a1;
  SEL v24 = a2;
  *(void *)&v23[1] = 0;
  objc_storeStrong((id *)&v23[1], a3);
  v23[0] = a4;
  v22 = a5;
  if (!*(void *)&v23[1])
  {
    v9 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v9 handleFailureInMethod:v24, v25, @"HSRemoteObject+Additions.mm", 56, @"Invalid parameter not satisfying: %@", @"addr" object file lineNumber description];
  }
  if (!v23[0])
  {
    v8 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v8 handleFailureInMethod:v24, v25, @"HSRemoteObject+Additions.mm", 57, @"Invalid parameter not satisfying: %@", @"port > 0" object file lineNumber description];
  }
  HSUtil::CreateClientSocket((HSUtil *)[*(id *)&v23[1] UTF8String], (const char *)v23[0], (HSUtil::FileDescriptor *)v21);
  if (HSUtil::FileDescriptor::operator BOOL((uint64_t)v21))
  {
    v7 = [HSObjectClient alloc];
    id v15 = [(HSObjectClient *)v7 initWithSocket:v21 config:v22];
    BOOL v14 = v15 != 0;
    if (v15)
    {
      id v26 = v15;
      int v16 = 1;
    }
    else
    {
      objc_super v13 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject+Additions.mm", v28);
      os_log_t v12 = &_os_log_default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v27, (uint64_t)"+[HSObjectClient(Additions) clientWithAddress:port:config:]", (uint64_t)v13, 64, (uint64_t)"client");
        _os_log_error_impl(&def_411C8, v12, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v27, 0x2Au);
      }
      objc_storeStrong((id *)&v12, 0);
      id v26 = 0;
      int v16 = 1;
    }
    objc_storeStrong(&v15, 0);
  }
  else
  {
    id v19 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject+Additions.mm", v30);
    os_log_t oslog = &_os_log_default;
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v29, (uint64_t)"+[HSObjectClient(Additions) clientWithAddress:port:config:]", (uint64_t)v19, 60, (uint64_t)"socket");
      _os_log_error_impl(&def_411C8, oslog, type, "Assertion failed (%s @ %s:%ju): %s", v29, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    id v26 = 0;
    int v16 = 1;
  }
  HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v21);
  objc_storeStrong((id *)&v23[1], 0);
  v5 = v26;

  return v5;
}

@end