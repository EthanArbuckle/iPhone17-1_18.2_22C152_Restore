@interface TouchSensitiveButtonHIDServicePlugin
+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5;
- (BOOL)createUserDevice;
- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5;
- (TouchSensitiveButtonHIDServicePlugin)initWithService:(unsigned int)a3;
- (id)eventMatching:(id)a3 forClient:(id)a4;
- (id)propertyForKey:(id)a3 client:(id)a4;
- (void)activate;
- (void)cancel;
- (void)createUserDevice;
- (void)dealloc;
- (void)setCancelHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setEventDispatcher:(id)a3;
@end

@implementation TouchSensitiveButtonHIDServicePlugin

+ (BOOL)matchService:(unsigned int)a3 options:(id)a4 score:(int64_t *)a5
{
  id v7 = a4;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "matched", v18, 2u);
  }
  BOOLean_t v8 = IOObjectConformsTo(a3, "IOHIDDevice");
  if (v8)
  {
    *a5 = 500;
  }
  else
  {
    BOOL v9 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v9) {
      +[TouchSensitiveButtonHIDServicePlugin matchService:options:score:](v9, v10, v11, v12, v13, v14, v15, v16);
    }
  }

  return v8 != 0;
}

- (TouchSensitiveButtonHIDServicePlugin)initWithService:(unsigned int)a3
{
  v42.receiver = self;
  v42.super_class = (Class)TouchSensitiveButtonHIDServicePlugin;
  v5 = [(TouchSensitiveButtonHIDServicePlugin *)&v42 init];
  if (!v5) {
    goto LABEL_13;
  }
  id NumberProperty = TouchSensitiveButtonGetNumberProperty(a3, @"PrimaryUsagePage");
  id v7 = TouchSensitiveButtonGetNumberProperty(a3, @"PrimaryUsage");
  if (!NumberProperty || (id v8 = v7, !v7))
  {
    log = v5->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR)) {
      -[TouchSensitiveButtonHIDServicePlugin initWithService:](log, v22, v23, v24, v25, v26, v27, v28);
    }
    goto LABEL_13;
  }
  uint64_t v9 = MTLoggingTouchSensitiveButtonHIDService();
  uint64_t v10 = v5->_log;
  v5->_log = (OS_os_log *)v9;

  uint64_t v11 = v5->_log;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = v11;
    uint64_t v13 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138543362;
    *(void *)&buf[4] = v13;
    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "%{public}@", buf, 0xCu);
  }
  IOHIDDeviceRef v14 = IOHIDDeviceCreate(kCFAllocatorDefault, a3);
  if (!v14)
  {
    v29 = v5->_log;
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[TouchSensitiveButtonHIDServicePlugin initWithService:](v29, v30, v31, v32, v33, v34, v35, v36);
    }
    goto LABEL_13;
  }
  hidDevice = v5->_hidDevice;
  v5->_hidDevice = v14;

  if (![(TouchSensitiveButtonHIDServicePlugin *)v5 createUserDevice])
  {
LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, v5);
  uint64_t v16 = [TouchSensitiveButtonHIDService alloc];
  v17 = v5->_log;
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke;
  v40[3] = &unk_8298;
  objc_copyWeak(&v41, (id *)buf);
  v18 = [(TouchSensitiveButtonHIDService *)v16 initWithLog:v17 usagePage:NumberProperty usage:v8 streamCallback:v40];
  hidService = v5->_hidService;
  v5->_hidService = v18;

  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_11;
  v38[3] = &unk_82C0;
  objc_copyWeak(&v39, (id *)buf);
  [(TouchSensitiveButtonHIDService *)v5->_hidService setConfigurationCallback:v38];
  v5->_service = a3;
  IOObjectRetain(a3);
  v20 = v5;
  objc_destroyWeak(&v39);
  objc_destroyWeak(&v41);
  objc_destroyWeak((id *)buf);
LABEL_14:

  return v20;
}

void __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = (void *)WeakRetained[3];
  if (v5)
  {
    id v9 = 0;
    unsigned __int8 v6 = [v5 handleReport:v3 error:&v9];
    id v7 = v9;
    if ((v6 & 1) == 0)
    {
      id v8 = WeakRetained[4];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_cold_1(v8);
      }
    }
  }
}

id __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_11(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = *((id *)WeakRetained + 2);
  uint64_t v9 = *a2;
  id v14 = 0;
  id v10 = [v8 setReport:a2 reportLength:a3 withIdentifier:v9 forType:a4 error:&v14];
  id v11 = v14;
  if ((v10 & 1) == 0)
  {
    uint64_t v12 = *((void *)WeakRetained + 4);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_11_cold_1(v12);
    }
  }

  return v10;
}

- (void)dealloc
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_2();
  v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_0, v5, v6, "%{public}@", v7, v8, v9, v10, v11);
}

- (BOOL)createUserDevice
{
  if (!MGGetBoolAnswer()) {
    return 1;
  }
  char v25 = -64;
  v24[0] = xmmword_6668;
  v24[1] = unk_6678;
  id v3 = +[NSData dataWithBytes:v24 length:33];
  id v4 = objc_alloc((Class)HIDUserDevice);
  CFStringRef v22 = @"ReportDescriptor";
  uint64_t v23 = v3;
  uint64_t v5 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  uint64_t v6 = (HIDUserDevice *)[v4 initWithProperties:v5];
  userDevice = self->_userDevice;
  self->_userDevice = v6;

  uint64_t v8 = self->_userDevice;
  BOOL v9 = v8 != 0;
  if (v8)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = __56__TouchSensitiveButtonHIDServicePlugin_createUserDevice__block_invoke;
    v19[3] = &unk_82E8;
    objc_copyWeak(&v20, &location);
    [(HIDUserDevice *)self->_userDevice setSetReportHandler:v19];
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled((os_log_t)log, OS_LOG_TYPE_ERROR)) {
      [(TouchSensitiveButtonHIDServicePlugin *)log createUserDevice];
    }
  }

  return v9;
}

uint64_t __56__TouchSensitiveButtonHIDServicePlugin_createUserDevice__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = +[NSData dataWithBytesNoCopy:a4 length:a5 freeWhenDone:0];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[5] parseInputReport:v6];

  return 0;
}

- (id)propertyForKey:(id)a3 client:(id)a4
{
  uint64_t v5 = (__CFString *)a3;
  CFProperty = [(TouchSensitiveButtonHIDService *)self->_hidService propertyForKey:v5];
  if (!CFProperty) {
    CFProperty = (void *)IORegistryEntryCreateCFProperty(self->_service, v5, 0, 0);
  }
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin propertyForKey:client:]();
  }

  return CFProperty;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4 client:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin setProperty:forKey:client:]();
  }
  BOOL v9 = [(TouchSensitiveButtonHIDService *)self->_hidService setProperty:v7 forKey:v8];

  return v9;
}

- (id)eventMatching:(id)a3 forClient:(id)a4
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  return 0;
}

- (void)setEventDispatcher:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  [(TouchSensitiveButtonHIDService *)self->_hidService setEventDispatcher:v4];
}

- (void)setCancelHandler:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  [(HIDDevice *)self->_hidDevice setCancelHandler:v4];
  [(HIDUserDevice *)self->_userDevice setCancelHandler:v4];
}

- (void)activate
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  [(HIDDevice *)self->_hidDevice activate];
  [(HIDUserDevice *)self->_userDevice activate];
}

- (void)cancel
{
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  [(HIDDevice *)self->_hidDevice cancel];
  [(HIDUserDevice *)self->_userDevice cancel];
}

- (void)setDispatchQueue:(id)a3
{
  id v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG)) {
    -[TouchSensitiveButtonHIDServicePlugin eventMatching:forClient:](log);
  }
  uint64_t v6 = self->_log;
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v21 = self;
    __int16 v22 = 2048;
    id v23 = v4;
    _os_log_impl(&dword_0, (os_log_t)v6, OS_LOG_TYPE_DEFAULT, "%p: service dispatch queue: %p", buf, 0x16u);
  }
  [(HIDDevice *)self->_hidDevice setDispatchQueue:v4];
  [(HIDUserDevice *)self->_userDevice setDispatchQueue:v4];
  [(TouchSensitiveButtonHIDService *)self->_hidService setDispatchQueue:v4];
  hidDevice = self->_hidDevice;
  id v19 = 0;
  unsigned __int8 v8 = [(HIDDevice *)hidDevice openWithOptions:0 error:&v19];
  id v9 = v19;
  if (v8)
  {
    IOHIDDeviceSetProperty(self->_hidDevice, @"ReportBufferEntrySize", &off_8720);
    IOHIDDeviceSetProperty(self->_hidDevice, @"MaxReportBufferCount", &off_8708);
    uint64_t v10 = self->_hidService;
    uint64_t v14 = _NSConcreteStackBlock;
    uint64_t v15 = 3221225472;
    uint64_t v16 = __57__TouchSensitiveButtonHIDServicePlugin_setDispatchQueue___block_invoke;
    uint64_t v17 = &unk_8310;
    v18 = v10;
    uint64_t v11 = self->_hidDevice;
    uint64_t v12 = v10;
    [(HIDDevice *)v11 setInputReportHandler:&v14];
    [(TouchSensitiveButtonHIDService *)self->_hidService reset];
  }
  else
  {
    uint64_t v13 = self->_log;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[TouchSensitiveButtonHIDServicePlugin setDispatchQueue:](v13);
    }
    [(HIDDevice *)self->_hidDevice cancel];
    uint64_t v12 = self->_hidDevice;
    self->_hidDevice = 0;
  }
}

id __57__TouchSensitiveButtonHIDServicePlugin_setDispatchQueue___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return [*(id *)(a1 + 32) parseInputReport:a6];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidService, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_userDevice, 0);

  objc_storeStrong((id *)&self->_hidDevice, 0);
}

+ (void)matchService:(uint64_t)a3 options:(uint64_t)a4 score:(uint64_t)a5 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithService:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithService:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_2() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_0, v4, v5, "User device handle report failed: %{public}@", v6, v7, v8, v9, v10);
}

void __56__TouchSensitiveButtonHIDServicePlugin_initWithService___block_invoke_11_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_2() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_0, v4, v5, "Set report failed: %{public}@", v6, v7, v8, v9, v10);
}

- (void)createUserDevice
{
}

- (void)propertyForKey:client:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "getProperty %{public}@ = %{public}@");
}

- (void)setProperty:forKey:client:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_6(&dword_0, v0, v1, "setProperty %{public}@ = %{public}@");
}

- (void)eventMatching:(void *)a1 forClient:.cold.1(void *a1)
{
  id v2 = a1;
  id v3 = (const char *)OUTLINED_FUNCTION_2();
  uint64_t v4 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_0, v5, v6, "%{public}@", v7, v8, v9, v10, v11);
}

- (void)setDispatchQueue:(void *)a1 .cold.1(void *a1)
{
  id v2 = a1;
  id v3 = [(id)OUTLINED_FUNCTION_2() localizedDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_3(&dword_0, v4, v5, "Cannot open HIDDevice: %{public}@", v6, v7, v8, v9, v10);
}

@end