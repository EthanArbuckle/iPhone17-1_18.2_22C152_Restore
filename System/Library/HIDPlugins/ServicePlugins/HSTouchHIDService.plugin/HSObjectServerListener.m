@interface HSObjectServerListener
- (HSObjectServerListener)initWithSocket:(FileDescriptor *)a3 config:(const HSObjectServerConfig *)a4;
@end

@implementation HSObjectServerListener

- (HSObjectServerListener)initWithSocket:(FileDescriptor *)a3 config:(const HSObjectServerConfig *)a4
{
  id location = self;
  SEL v29 = a2;
  v28 = a3;
  v27 = a4;
  if (!HSUtil::FileDescriptor::operator BOOL((uint64_t)a3))
  {
    v14 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v14 handleFailureInMethod:v29, location, @"HSRemoteObject+Additions.mm", 19, @"Invalid parameter not satisfying: %@", @"socket" object file lineNumber description];
  }
  id v4 = location;
  id location = 0;
  v26.receiver = v4;
  v26.super_class = (Class)HSObjectServerListener;
  obj = [(HSObjectServer *)&v26 initWithConfig:v27];
  id location = obj;
  objc_storeStrong(&location, obj);
  if (obj)
  {
    dispatch_queue_t v5 = dispatch_queue_create("HSObjectServerListener queue", 0);
    v6 = (void *)*((void *)location + 16);
    *((void *)location + 16) = v5;

    objc_initWeak(&from, location);
    v12 = [HSSocketListener alloc];
    v10 = v28;
    uint64_t v11 = *((void *)location + 16);
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = __48__HSObjectServerListener_initWithSocket_config___block_invoke;
    v22 = &unk_142678;
    objc_copyWeak(&v23, &from);
    v9 = [(HSSocketListener *)v12 initWithSocket:v10 queue:v11 clientHandler:&v18];
    v7 = (void *)*((void *)location + 17);
    *((void *)location + 17) = v9;

    BOOL v17 = 0;
    BOOL v17 = *((void *)location + 17) != 0;
    if (v17)
    {
      v31 = (HSObjectServerListener *)location;
      int v25 = 1;
    }
    else
    {
      v16 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSRemoteObject+Additions.mm", v33);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v32, (uint64_t)"-[HSObjectServerListener initWithSocket:config:]", (uint64_t)v16, 30, (uint64_t)"_listener");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v32, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v31 = 0;
      int v25 = 1;
    }
    objc_destroyWeak(&v23);
    objc_destroyWeak(&from);
  }
  else
  {
    v31 = 0;
    int v25 = 1;
  }
  objc_storeStrong(&location, 0);
  return v31;
}

void __48__HSObjectServerListener_initWithSocket_config___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = a1;
  uint64_t v5 = a2;
  uint64_t v4 = a1;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = 0;
  [WeakRetained addClient:v5 config:&v3];
}

- (void).cxx_destruct
{
}

@end