@interface HSObjectServer
+ (HSObjectServer)serverWithAddress:(id)a3 port:(unsigned __int16)a4 config:(const HSObjectServerConfig *)a5;
- (BOOL)addClient:(FileDescriptor *)a3 config:(const HSObjectServerAddClientConfig *)a4;
- (HSObjectServer)initWithConfig:(const HSObjectServerConfig *)a3;
- (_UNKNOWN)addClient:config:;
- (id).cxx_construct;
- (id)addClient:(id *)a1 config:;
- (id)addClient:(id *)a1 config:(id *)a2;
- (id)addClient:(id *)a1 config:(uint64_t)a2;
- (id)addClient:(uint64_t)a3 config:;
- (id)addClient:config:;
- (uint64_t)addClient:config:;
- (void)_close;
- (void)_handleConnectionClosed:(shared_ptr<HSMapper>)a3;
- (void)addClient:config:;
- (void)close;
- (void)dealloc;
@end

@implementation HSObjectServer

- (HSObjectServer)initWithConfig:(const HSObjectServerConfig *)a3
{
  id location = self;
  SEL v17 = a2;
  v16 = (HSObjectServerConfig *)a3;
  id WeakRetained = objc_loadWeakRetained(&a3->var0);
  BOOL v14 = WeakRetained != 0;

  if (!v14)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v13 handleFailureInMethod:v17, location, @"HSRemoteObject.mm", 547, @"Invalid parameter not satisfying: %@", @"config.rootObject" object file lineNumber description];
  }
  if (!v16->var1)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v12 handleFailureInMethod:v17, location, @"HSRemoteObject.mm", 548, @"Invalid parameter not satisfying: %@", @"config.handlerQueue" object file lineNumber description];
  }
  id v4 = location;
  id location = 0;
  v15.receiver = v4;
  v15.super_class = (Class)HSObjectServer;
  obj = [(HSObjectServer *)&v15 init];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    id v10 = objc_loadWeakRetained(&v16->var0);
    objc_storeWeak((id *)location + 12, v10);

    objc_storeStrong((id *)location + 13, v16->var1);
    id v5 = objc_retainBlock(v16->var2);
    v6 = (void *)*((void *)location + 14);
    *((void *)location + 14) = v5;

    id v7 = objc_retainBlock(v16->var3);
    v8 = (void *)*((void *)location + 15);
    *((void *)location + 15) = v7;

    v19 = (HSObjectServer *)location;
  }
  else
  {
    v19 = 0;
  }
  objc_storeStrong(&location, 0);
  return v19;
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
    _os_log_debug_impl(&def_411C8, log, type, "~HSObjectServer", v5, 2u);
  }
  objc_storeStrong(location, 0);
  [(HSObjectServer *)v8 _close];
  v4.receiver = v8;
  v4.super_class = (Class)HSObjectServer;
  [(HSObjectServer *)&v4 dealloc];
}

- (BOOL)addClient:(FileDescriptor *)a3 config:(const HSObjectServerAddClientConfig *)a4
{
  id val = self;
  SEL v10 = a2;
  v9 = a3;
  v8 = a4;
  if (*((void *)self + 14)) {
    (*(void (**)(void))(*((void *)val + 14) + 16))();
  }
  objc_initWeak(&location, val);
  objc_copyWeak(&to, (id *)val + 12);
  BOOL var0 = v8->var0;
  objc_copyWeak(&v6, &location);
  std::function<void ()(std::shared_ptr<HSMapper>)>::function<-[HSObjectServer addClient:config:]::$_0,void>((uint64_t)&v14, &v6);
  HSMapper::New((uint64_t)v9, *((void **)val + 13), &to, (uint64_t)v5);
}

- (uint64_t)addClient:config:
{
  std::__hash_node_base<std::__hash_node<std::__hash_value_type<char const*,HSUtil::CoderKey const*>,void *> *>::__upcast[abi:ne180100]();
  return std::__invoke_void_return_wrapper<void,true>::__call[abi:ne180100]<-[HSObjectServer addClient:config:]::$_0 &,std::shared_ptr<HSMapper>>(v2, a2);
}

- (void)close
{
}

- (void)_close
{
  v8 = self;
  v7[3] = a2;
  std::mutex::lock((std::mutex *)((char *)self + 8));
  std::set<std::shared_ptr<HSMapper>>::set[abi:ne180100](v7, (void *)v8 + 9);
  std::mutex::unlock((std::mutex *)((char *)v8 + 8));
  v6[1] = (uint64_t)v7;
  v6[0] = std::set<std::shared_ptr<HSMapper>>::begin[abi:ne180100]();
  uint64_t v5 = std::set<std::shared_ptr<HSMapper>>::end[abi:ne180100]();
  while (std::operator!=[abi:ne180100](v6, &v5))
  {
    v3 = (void *)std::__tree_const_iterator<std::shared_ptr<HSMapper>,std::__tree_node<std::shared_ptr<HSMapper>,void *> *,long>::operator*[abi:ne180100]((uint64_t)v6);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v4, v3);
    v2 = (HSMapper *)std::__compressed_pair_elem<std::allocator<HSUtil::Encoder::ContainerRecord> &,1,false>::__get[abi:ne180100]((uint64_t)v4);
    HSMapper::close(v2);
    std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
    std::__tree_const_iterator<std::shared_ptr<HSMapper>,std::__tree_node<std::shared_ptr<HSMapper>,void *> *,long>::operator++[abi:ne180100](v6);
  }
  std::set<std::shared_ptr<HSMapper>>::~set[abi:ne180100]((uint64_t)v7);
}

- (void)_handleConnectionClosed:(shared_ptr<HSMapper>)a3
{
  ptr = a3.__ptr_;
  std::mutex::lock((std::mutex *)((char *)self + 8));
  std::set<std::shared_ptr<HSMapper>>::erase[abi:ne180100]((uint64_t)self + 72, (uint64_t)ptr);
  std::mutex::unlock((std::mutex *)((char *)self + 8));
  if (*((void *)self + 15)) {
    (*(void (**)(void))(*((void *)self + 15) + 16))();
  }
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

- (id)addClient:(id *)a1 config:
{
  return a1;
}

{
  std::__compressed_pair_elem<-[HSObjectServer addClient:config:]::$_0,0,false>::~__compressed_pair_elem(a1);
  return a1;
}

- (id)addClient:config:
{
  return std::__compressed_pair<-[HSObjectServer addClient:config:]::$_0>::~__compressed_pair(a1);
}

- (void)addClient:config:
{
  v4[3] = a1;
  v4[2] = a2;
  id WeakRetained = objc_loadWeakRetained(a1);
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::shared_ptr[abi:ne180100](v4, a2);
  [WeakRetained _handleConnectionClosed:v4];
  std::shared_ptr<std::vector<std::atomic<HSUtil::CoderKey const*>>>::~shared_ptr[abi:ne180100]((uint64_t)v4);
}

- (_UNKNOWN)addClient:config:
{
}

- (id)addClient:(uint64_t)a3 config:
{
  return a1;
}

{
  std::__compressed_pair_elem<-[HSObjectServer addClient:config:]::$_0,0,false>::__compressed_pair_elem[abi:ne180100]<-[HSObjectServer addClient:config:]::$_0 const&,0ul>(a1, a2);
  std::__compressed_pair_elem<std::allocator<BOOL (*)(HSUtil::Encoder &,objc_object *)>,1,true>::__compressed_pair_elem[abi:ne180100]<std::allocator<BOOL (*)(HSUtil::Encoder &,objc_object *)>&&,0ul>((uint64_t)a1, a3);
  return a1;
}

- (id)addClient:(id *)a1 config:(uint64_t)a2
{
  uint64_t v5 = a2;
  v2 = (id *)std::get[abi:ne180100]<0ul,BOOL (*&&)(HSUtil::Encoder &,objc_object *)>((uint64_t)&v5);
  -[HSObjectServer addClient:config:]::$_0::$_0(a1, v2);
  return a1;
}

- (id)addClient:(id *)a1 config:(id *)a2
{
  return a1;
}

{
  objc_moveWeak(a1, a2);
  return a1;
}

{
  -[HSObjectServer addClient:config:]::$_0::$_0(a1, a2);
  return a1;
}

{
  objc_copyWeak(a1, a2);
  return a1;
}

+ (HSObjectServer)serverWithAddress:(id)a3 port:(unsigned __int16)a4 config:(const HSObjectServerConfig *)a5
{
  id v19 = a1;
  SEL v18 = a2;
  *(void *)&v17[1] = 0;
  objc_storeStrong((id *)&v17[1], a3);
  v17[0] = a4;
  v16 = a5;
  if (!*(void *)&v17[1])
  {
    v9 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v9 handleFailureInMethod:v18, v19, @"HSRemoteObject+Additions.mm", 40, @"Invalid parameter not satisfying: %@", @"addr" object file lineNumber description];
  }
  if (!v17[0])
  {
    v8 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v8 handleFailureInMethod:v18, v19, @"HSRemoteObject+Additions.mm", 41, @"Invalid parameter not satisfying: %@", @"port > 0" object file lineNumber description];
  }
  HSUtil::CreateServerSocket((HSUtil *)[*(id *)&v17[1] UTF8String], (const char *)v17[0]);
  if (HSUtil::FileDescriptor::operator BOOL((uint64_t)v15))
  {
    id v7 = [HSObjectServerListener alloc];
    v20 = [(HSObjectServerListener *)v7 initWithSocket:v15 config:v16];
  }
  else
  {
    v13 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject+Additions.mm", v22);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v21, (uint64_t)"+[HSObjectServer(Additions) serverWithAddress:port:config:]", (uint64_t)v13, 44, (uint64_t)"socket");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v21, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v20 = 0;
  }
  HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v15);
  objc_storeStrong((id *)&v17[1], 0);
  uint64_t v5 = v20;

  return (HSObjectServer *)v5;
}

@end