@interface HSServerStage
+ (BOOL)matchesService:(id)a3;
+ (id)clientWithService:(id)a3 directory:(id)a4 config:(const HSServerStageClientConfig *)a5;
- (HSServerStage)initWithName:(id)a3 description:(id)a4 queue:(id)a5;
- (id).cxx_construct;
- (id)server;
- (id)serviceDescription;
- (id)serviceName;
- (id)serviceProtocol;
- (id)stages;
- (unint64_t)serviceVersion;
- (void)_handleConnectionClosed;
- (void)_handleConnectionOpened;
- (void)addClient:(FileDescriptor *)a3 config:(id)a4;
- (void)dealloc;
@end

@implementation HSServerStage

+ (BOOL)matchesService:(id)a3
{
  id v10 = a1;
  SEL v9 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  if (!location)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v7 handleFailureInMethod:v9, v10, @"HSServerStage.mm", 23, @"Invalid parameter not satisfying: %@", @"service" object file lineNumber description];
  }
  id v5 = [location serviceProtocol];
  unsigned __int8 v6 = [v5 isEqualToString:HSServerStageProtocol];

  if (v6)
  {
    id v4 = [location serviceVersion];
    BOOL v11 = v4 == (id)HSServerStageVersion;
  }
  else
  {
    BOOL v11 = 0;
  }
  objc_storeStrong(&location, 0);
  return v11;
}

+ (id)clientWithService:(id)a3 directory:(id)a4 config:(const HSServerStageClientConfig *)a5
{
  id v26 = a1;
  SEL v25 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v23 = 0;
  objc_storeStrong(&v23, a4);
  v22 = a5;
  if (!location)
  {
    v13 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v13 handleFailureInMethod:v25, v26, @"HSServerStage.mm", 33, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if (!v23)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v12 handleFailureInMethod:v25, v26, @"HSServerStage.mm", 34, @"Invalid parameter not satisfying: %@", @"directory" object file lineNumber description];
  }
  id v10 = v23;
  id v11 = location;
  BOOL var1 = v22->var1;
  char v19 = 0;
  if (var1)
  {
    v30 = HSServerStageAsync;
    v31 = &__kCFBooleanTrue;
    id v20 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    char v19 = 1;
    id v9 = v20;
  }
  else
  {
    id v9 = 0;
  }
  if (v10) {
    [v10 openService:v11 config:v9];
  }
  else {
    memset(v21, 0, sizeof(v21));
  }
  if (v19) {

  }
  if (HSUtil::FileDescriptor::operator BOOL((uint64_t)v21))
  {
    v8 = [HSObjectClient alloc];
    v27 = [(HSObjectClient *)v8 initWithSocket:v21 config:v22];
  }
  else
  {
    v17 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServerStage.mm", v29);
    os_log_t oslog = &_os_log_default;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v28, (uint64_t)"+[HSServerStage clientWithService:directory:config:]", (uint64_t)v17, 38, (uint64_t)"socket");
      _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v28, 0x2Au);
    }
    objc_storeStrong((id *)&oslog, 0);
    v27 = 0;
  }
  HSUtil::FileDescriptor::~FileDescriptor((HSUtil::FileDescriptor *)v21);
  objc_storeStrong(&v23, 0);
  objc_storeStrong(&location, 0);
  unsigned __int8 v6 = v27;

  return v6;
}

- (HSServerStage)initWithName:(id)a3 description:(id)a4 queue:(id)a5
{
  id v38 = self;
  SEL v37 = a2;
  id location = 0;
  objc_storeStrong(&location, a3);
  id v35 = 0;
  objc_storeStrong(&v35, a4);
  id v34 = 0;
  objc_storeStrong(&v34, a5);
  if (!location)
  {
    v12 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v12 handleFailureInMethod:v37, v38, @"HSServerStage.mm", 46, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  if (!v35)
  {
    id v11 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v11 handleFailureInMethod:v37, v38, @"HSServerStage.mm", 47, @"Invalid parameter not satisfying: %@", @"description" object file lineNumber description];
  }
  if (!v34)
  {
    id v10 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v10 handleFailureInMethod:v37, v38, @"HSServerStage.mm", 48, @"Invalid parameter not satisfying: %@", @"queue" object file lineNumber description];
  }
  objc_storeStrong((id *)v38 + 15, location);
  objc_storeStrong((id *)v38 + 16, v35);
  id v5 = v38;
  id v38 = 0;
  v33.receiver = v5;
  v33.super_class = (Class)HSServerStage;
  id v9 = [(HSStage *)&v33 init];
  id v38 = v9;
  objc_storeStrong(&v38, v9);
  if (v9)
  {
    objc_initWeak(&from, v38);
    objc_initWeak(&v30.var0, v38);
    v30.BOOL var1 = v34;
    v24 = _NSConcreteStackBlock;
    int v25 = -1073741824;
    int v26 = 0;
    v27 = __48__HSServerStage_initWithName_description_queue___block_invoke;
    v28 = &unk_141240;
    objc_copyWeak(&v29, &from);
    v30.var2 = objc_retainBlock(&v24);
    v18 = _NSConcreteStackBlock;
    int v19 = -1073741824;
    int v20 = 0;
    v21 = __48__HSServerStage_initWithName_description_queue___block_invoke_2;
    v22 = &unk_141240;
    objc_copyWeak(&v23, &from);
    v30.var3 = objc_retainBlock(&v18);
    v8 = [[HSObjectServer alloc] initWithConfig:&v30];
    unsigned __int8 v6 = (void *)*((void *)v38 + 17);
    *((void *)v38 + 17) = v8;

    BOOL v17 = 0;
    BOOL v17 = *((void *)v38 + 17) != 0;
    if (v17)
    {
      v39 = (HSServerStage *)v38;
      int v32 = 1;
    }
    else
    {
      v16 = basename_r("/Library/Caches/com.apple.xbs/Sources/HIDSensingPipeline/HIDSensingPipeline/HSServerStage.mm", v41);
      os_log_t oslog = &_os_log_default;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_4_8_32_8_32_8_0_8_32((uint64_t)v40, (uint64_t)"-[HSServerStage initWithName:description:queue:]", (uint64_t)v16, 65, (uint64_t)"_server");
        _os_log_error_impl(&def_411C8, oslog, OS_LOG_TYPE_ERROR, "Assertion failed (%s @ %s:%ju): %s", v40, 0x2Au);
      }
      objc_storeStrong((id *)&oslog, 0);
      v39 = 0;
      int v32 = 1;
    }
    HSObjectServerConfig::~HSObjectServerConfig(&v30);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v29);
    objc_destroyWeak(&from);
  }
  else
  {
    v39 = 0;
    int v32 = 1;
  }
  objc_storeStrong(&v34, 0);
  objc_storeStrong(&v35, 0);
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v38, 0);
  return v39;
}

void __48__HSServerStage_initWithName_description_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionOpened];
}

void __48__HSServerStage_initWithName_description_queue___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleConnectionClosed];
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
    _os_log_debug_impl(&def_411C8, log, type, "~HSServerStage", v5, 2u);
  }
  objc_storeStrong(location, 0);
  v4.receiver = v8;
  v4.super_class = (Class)HSServerStage;
  [(HSStage *)&v4 dealloc];
}

- (id)server
{
  return self->_server;
}

- (void)_handleConnectionOpened
{
  v7 = self;
  v6[1] = (id)a2;
  v6[0] = (id)objc_opt_new();
  collectStages((NSMutableSet *)v6[0], &v7->super);
  id location = filterProxyStages(v6[0]);
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, v7);
  if (!v7->_state.stages)
  {
    uint64_t v3 = objc_opt_new();
    stages = v7->_state.stages;
    v7->_state.stages = (NSMutableSet *)v3;
  }
  [(NSMutableSet *)v7->_state.stages unionSet:location];
  HSUtil::ObjectLock::~ObjectLock(v4);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v6, 0);
}

- (void)_handleConnectionClosed
{
  v15 = self;
  v14[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v14, self);
  id v13 = [(NSMutableSet *)v15->_state.stages copy];
  HSUtil::ObjectLock::unlock(v14);
  memset(__b, 0, sizeof(__b));
  id obj = v13;
  id v10 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
  if (v10)
  {
    uint64_t v6 = *(void *)__b[2];
    uint64_t v7 = 0;
    id v8 = v10;
    while (1)
    {
      uint64_t v5 = v7;
      if (*(void *)__b[2] != v6) {
        objc_enumerationMutation(obj);
      }
      id location = *(id *)(__b[1] + 8 * v7);
      id v4 = location;
      id v3 = [location consumers];
      id v2 = filterDeadProxyStages(v3);
      objc_msgSend(v4, "setConsumers:");

      objc_storeStrong(&location, 0);
      ++v7;
      if (v5 + 1 >= (unint64_t)v8)
      {
        uint64_t v7 = 0;
        id v8 = [obj countByEnumeratingWithState:__b objects:v16 count:16];
        if (!v8) {
          break;
        }
      }
    }
  }

  objc_storeStrong(&v13, 0);
  HSUtil::ObjectLock::~ObjectLock(v14);
}

- (id)stages
{
  uint64_t v5 = self;
  id v4[2] = (id)a2;
  HSUtil::ObjectLock::ObjectLock((uint64_t)v4, self);
  id v3 = [(NSMutableSet *)v5->_state.stages allObjects];
  HSUtil::ObjectLock::~ObjectLock(v4);

  return v3;
}

- (id)serviceName
{
  return self->_name;
}

- (id)serviceDescription
{
  return self->_description;
}

- (id)serviceProtocol
{
  return HSServerStageProtocol;
}

- (unint64_t)serviceVersion
{
  return HSServerStageVersion;
}

- (void)addClient:(FileDescriptor *)a3 config:(id)a4
{
  id v11 = self;
  SEL v10 = a2;
  id v9 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  server = v11->_server;
  uint64_t v6 = v9;
  id v4 = [location objectForKeyedSubscript:HSServerStageAsync];
  char v7 = [v4 BOOLValue] & 1;
  [(HSObjectServer *)server addClient:v6 config:&v7];

  objc_storeStrong(&location, 0);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  return self;
}

@end