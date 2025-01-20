@interface OSLaunchdJob
+ (BOOL)disableLogging_4watchdogd;
+ (BOOL)submitAll:(id)a3 error:(id *)a4;
+ (id)_createJobFromReplyHandle:(id)a3;
+ (id)copyJobWithHandle:(id)a3;
+ (id)copyJobWithLabel:(id)a3 domain:(id)a4;
+ (id)copyJobWithPid:(int)a3;
+ (id)copyJobsManagedBy:(id)a3 error:(id *)a4;
+ (id)jobInfoFromMessage:(id)a3;
+ (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6;
+ (int)_monitorNormalizeError:(int)a3;
+ (int64_t)jobStateFromMessage:(id)a3;
+ (void)setDisableLogging_4watchdogd:(BOOL)a3;
- (BOOL)remove:(id *)a3;
- (BOOL)submit:(id *)a3;
- (NSUUID)handle;
- (OSLaunchdJob)initWithPlist:(id)a3;
- (OSLaunchdJob)initWithPlist:(id)a3 domain:(id)a4;
- (id)_initWithHandle:(id)a3;
- (id)_newCreateInstanceRequest:(unsigned __int8)a3[16] properties:(id)a4;
- (id)_newRequest;
- (id)_newSubmitRequest;
- (id)createInstance:(unsigned __int8)a3[16] error:(id *)a4;
- (id)createInstance:(unsigned __int8)a3[16] properties:(id)a4 error:(id *)a5;
- (id)description;
- (id)getCurrentJobInfo;
- (id)start:(id *)a3;
- (id)submitAndStart:(id *)a3;
- (void)_newSubmitRequest;
- (void)_populateHandle:(id)a3;
- (void)_setupMonitorSourceWithPort:(unsigned int)a3 onQueue:(id)a4 withHandler:(id)a5;
- (void)_startMonitoringAfterSubmit:(id)a3;
- (void)cancelMonitor;
- (void)monitorOnQueue:(id)a3 withHandler:(id)a4;
- (void)processSubmitReply:(id)a3;
- (void)setupMonitorOnQueue:(id)a3 withHandler:(id)a4 reply:(id)a5;
@end

@implementation OSLaunchdJob

- (void)cancelMonitor
{
  monitor_source = self->_monitor_source;
  if (monitor_source)
  {
    dispatch_source_cancel(monitor_source);
    v4 = self->_monitor_source;
    self->_monitor_source = 0;
  }
  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = 0;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0;
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30(uint64_t a1)
{
  *(void *)&v19[13] = *MEMORY[0x263EF8340];
  uint64_t v2 = xpc_pipe_receive();
  int64_t int64 = v2;
  if ((v2 | 0x20) != 0x20)
  {
    _os_assumes_log();
LABEL_4:
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      v4 = _os_launch_job_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v5;
        __int16 v18 = 1024;
        *(_DWORD *)v19 = int64;
        v19[2] = 2080;
        *(void *)&v19[3] = xpc_strerror();
        _os_log_impl(&dword_21E925000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: got error %d: %s", buf, 0x1Cu);
      }
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, +[OSLaunchdJob _monitorNormalizeError:int64]);
    goto LABEL_9;
  }
  if (v2) {
    goto LABEL_4;
  }
  int64_t int64 = xpc_dictionary_get_int64(0, "error");
  if (int64) {
    goto LABEL_4;
  }
  v6 = +[OSLaunchdJob jobInfoFromMessage:0];
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    v7 = _os_launch_job_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      uint64_t v17 = v8;
      __int16 v18 = 2114;
      *(void *)v19 = v6;
      _os_log_impl(&dword_21E925000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: got an update with info %{public}@", buf, 0x16u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v9 = (void *)[*(id *)(a1 + 40) _newRequest];
  v10 = (void *)xpc_mach_send_create_with_disposition();
  xpc_dictionary_set_value(v9, "client-port", v10);
  uint64_t v11 = MEMORY[0x223C356D0](1002, v9, *(unsigned int *)(a1 + 56));
  if (v11)
  {
    uint64_t v12 = v11;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      v13 = _os_launch_job_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        uint64_t v15 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v14;
        __int16 v18 = 1024;
        *(_DWORD *)v19 = v12;
        v19[2] = 2080;
        *(void *)&v19[3] = v15;
        _os_log_impl(&dword_21E925000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ monitor: failed to re-arm monitor poll, error %d: %s", buf, 0x1Cu);
      }
    }
    (*(void (**)(void, void, void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), 0, +[OSLaunchdJob _monitorNormalizeError:v12]);
  }

LABEL_9:
}

+ (id)copyJobWithPid:(int)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (a3 <= 0) {
    +[OSLaunchdJob copyJobWithPid:](&v11, buf);
  }
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v5, "pid", a3);
  id v11 = 0;
  int v6 = _launch_job_routine();
  if (!v6)
  {
    uint64_t v8 = [a1 _createJobFromReplyHandle:v11];
    if (+[OSLaunchdJob disableLogging_4watchdogd]) {
      goto LABEL_12;
    }
    v9 = _os_launch_job_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)v13 = v8;
      *(_WORD *)&v13[8] = 1024;
      v14[0] = a3;
      _os_log_impl(&dword_21E925000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithPid:%d created a job", buf, 0x12u);
    }
LABEL_11:

    goto LABEL_12;
  }
  int v7 = v6;
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    v9 = _os_launch_job_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v13 = a3;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v7;
      LOWORD(v14[0]) = 2080;
      *(void *)((char *)v14 + 2) = xpc_strerror();
      _os_log_impl(&dword_21E925000, v9, OS_LOG_TYPE_DEFAULT, "copyJobWithPid:%d failed with error %d: %s", buf, 0x18u);
    }
    uint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v8 = 0;
LABEL_12:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_monitor_queue, 0);
  objc_storeStrong(&self->_monitor_handler, 0);
  objc_storeStrong((id *)&self->_monitor_source, 0);
  objc_storeStrong((id *)&self->_domain, 0);

  objc_storeStrong((id *)&self->_plist, 0);
}

- (id)description
{
  if (self->_handle)
  {
    id v3 = [NSString alloc];
    v4 = [(id)objc_opt_class() description];
    xpc_object_t v5 = (void *)[v3 initWithFormat:@"<%@ | handle=%@>", v4, self->_handle];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)OSLaunchdJob;
    xpc_object_t v5 = [(OSLaunchdJob *)&v7 description];
  }

  return v5;
}

- (OSLaunchdJob)initWithPlist:(id)a3
{
  id v4 = a3;
  xpc_object_t v5 = +[OSLaunchdDomain currentDomain];
  int v6 = [(OSLaunchdJob *)self initWithPlist:v4 domain:v5];

  return v6;
}

- (OSLaunchdJob)initWithPlist:(id)a3 domain:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    -[OSLaunchdJob initWithPlist:domain:](&v15, v16);
  }
  v9 = v8;
  if (MEMORY[0x223C35BA0](v7) != MEMORY[0x263EF8708]) {
    -[OSLaunchdJob initWithPlist:domain:](&v15, v16);
  }
  v14.receiver = self;
  v14.super_class = (Class)OSLaunchdJob;
  v10 = [(OSLaunchdJob *)&v14 init];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_plist, a3);
    objc_storeStrong((id *)&v11->_domain, a4);
    uint64_t v12 = v11;
  }

  return v11;
}

+ (id)jobInfoFromMessage:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = a3;
  int64_t v27 = +[OSLaunchdJob jobStateFromMessage:v3];
  int64_t int64 = xpc_dictionary_get_int64(v3, "pid");
  int64_t v5 = xpc_dictionary_get_int64(v3, "spawn-error");
  int v6 = xpc_dictionary_get_value(v3, "wait4-status");
  id v7 = xpc_dictionary_get_value(v3, "os-reason-ns");
  id v8 = xpc_dictionary_get_value(v3, "os-reason-code");
  xpc_dictionary_get_value(v3, "os-reason-flags");
  v9 = (OSLaunchdJobExitStatus *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = xpc_dictionary_get_value(v3, "additional-properties");
  BOOL v28 = xpc_dictionary_get_BOOL(v3, "removing");
  uuid = xpc_dictionary_get_uuid(v3, "instance");
  v29 = (void *)v10;
  v30 = v9;
  if (v6 || v7 || v8 || v9)
  {
    if (!v6) {
      +[OSLaunchdJob jobInfoFromMessage:].cold.4(&v31, v32);
    }
    if (!v7) {
      +[OSLaunchdJob jobInfoFromMessage:](&v31, v32);
    }
    if (!v8) {
      +[OSLaunchdJob jobInfoFromMessage:](&v31, v32);
    }
    if (!v9) {
      +[OSLaunchdJob jobInfoFromMessage:](&v31, v32);
    }
    v26 = [OSLaunchdJobExitStatus alloc];
    int64_t value = xpc_int64_get_value(v6);
    int64_t v12 = v5;
    uint64_t v13 = xpc_uint64_get_value(v7);
    uint64_t v14 = xpc_uint64_get_value(v8);
    unsigned int v15 = xpc_uint64_get_value(v9);
    uint64_t v16 = v13;
    int64_t v5 = v12;
    v9 = [(OSLaunchdJobExitStatus *)v26 initWithWait4Status:value os_reason_namespace:v16 os_reason_code:v14 os_reason_flags:v15];
  }
  uint64_t v17 = [OSLaunchdJobInfo alloc];
  __int16 v18 = v17;
  if (uuid)
  {
    v19 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
    int64_t v20 = int64;
    v21 = v29;
    v22 = [(OSLaunchdJobInfo *)v18 initWithState:v27 pid:v20 lastSpawnError:v5 lastExitStatus:v9 additionalPropertiesDict:v29 removing:v28 instance:v19];
  }
  else
  {
    int64_t v23 = int64;
    v21 = v29;
    v22 = [(OSLaunchdJobInfo *)v17 initWithState:v27 pid:v23 lastSpawnError:v5 lastExitStatus:v9 additionalPropertiesDict:v29 removing:v28 instance:0];
  }

  return v22;
}

+ (int64_t)jobStateFromMessage:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t int64 = xpc_dictionary_get_uint64(v3, "job-state");
  if (uint64 >= 4) {
    +[OSLaunchdJob jobStateFromMessage:](&v6, v7);
  }

  return uint64 + 1;
}

- (id)_newCreateInstanceRequest:(unsigned __int8)a3[16] properties:(id)a4
{
  id v6 = a4;
  id v7 = [(OSLaunchdJob *)self _newRequest];
  xpc_dictionary_set_uuid(v7, "instance-uuid", a3);
  uint64_t v8 = [v6 sandboxProfile];

  if (v8)
  {
    id v9 = [v6 sandboxProfile];
    xpc_dictionary_set_string(v7, "sandbox-profile", (const char *)[v9 UTF8String]);
  }
  uint64_t v10 = [v6 environmentVariables];

  if (v10)
  {
    id v11 = [v6 environmentVariables];
    int64_t v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();

    xpc_dictionary_set_value(v7, "envvars", v12);
  }

  return v7;
}

- (id)createInstance:(unsigned __int8)a3[16] properties:(id)a4 error:(id *)a5
{
  *(void *)&v17[13] = *MEMORY[0x263EF8340];
  if (self->_handle)
  {
    id v7 = [(OSLaunchdJob *)self _newCreateInstanceRequest:a3 properties:a4];
    uint64_t v8 = _launch_job_routine();
    if (v8)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd])
      {
        id v9 = _os_launch_job_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          unsigned int v15 = self;
          __int16 v16 = 1024;
          *(_DWORD *)uint64_t v17 = v8;
          v17[2] = 2080;
          *(void *)&v17[3] = xpc_strerror();
          _os_log_impl(&dword_21E925000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance failed with error %d: %s", buf, 0x1Cu);
        }
      }
      if (a5)
      {
        +[OSLaunchdError createXPCError:v8];
        uint64_t v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        uint64_t v10 = 0;
      }
    }
    else
    {
      uint64_t v10 = +[OSLaunchdJob _createJobFromReplyHandle:0];
      if (!+[OSLaunchdJob disableLogging_4watchdogd])
      {
        int64_t v12 = _os_launch_job_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          unsigned int v15 = self;
          __int16 v16 = 2114;
          *(void *)uint64_t v17 = v10;
          _os_log_impl(&dword_21E925000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance created a job %{public}@", buf, 0x16u);
        }
      }
    }
  }
  else
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      id v11 = _os_launch_job_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        unsigned int v15 = self;
        _os_log_impl(&dword_21E925000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: createInstance on a job with no handle (ESRCH)", buf, 0xCu);
      }
    }
    if (a5)
    {
      +[OSLaunchdError createXPCError:3];
      uint64_t v10 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = 0;
    }
  }

  return v10;
}

+ (id)submitExtension:(id)a3 overlay:(id)a4 domain:(id)a5 error:(id *)a6
{
  *(void *)&v24[21] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  int64_t v12 = a5;
  if (!v10) {
    +[OSLaunchdJob submitExtension:overlay:domain:error:](&v22, buf);
  }
  uint64_t v13 = v12;
  if (!v12) {
    +[OSLaunchdJob submitExtension:overlay:domain:error:](&v22, buf);
  }
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v14, "type", *((int *)v13 + 2));
  xpc_dictionary_set_uint64(v14, "handle", v13[2]);
  id v15 = v10;
  xpc_dictionary_set_string(v14, "path", (const char *)[v15 UTF8String]);
  xpc_dictionary_set_value(v14, "overlay", v11);
  id v22 = 0;
  uint64_t v16 = _launch_job_routine();
  if (v16)
  {
    uint64_t v17 = v16;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      __int16 v18 = _os_launch_job_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        v24[0] = v17;
        LOWORD(v24[1]) = 2080;
        *(void *)((char *)&v24[1] + 2) = xpc_strerror();
        _os_log_impl(&dword_21E925000, v18, OS_LOG_TYPE_DEFAULT, "submitExtension failed with error %d: %s", buf, 0x12u);
      }
    }
    if (a6)
    {
      +[OSLaunchdError createXPCError:v17];
      v19 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = [a1 _createJobFromReplyHandle:v22];
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      int64_t v20 = _os_launch_job_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)v24 = v19;
        _os_log_impl(&dword_21E925000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: submitExtension created a job", buf, 0xCu);
      }
    }
  }

  return v19;
}

+ (id)_createJobFromReplyHandle:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uuid = xpc_dictionary_get_uuid(v3, "job-handle");
  if (!uuid) {
    -[OSLaunchdJob _populateHandle:](&v8, v9);
  }
  int64_t v5 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
  id v6 = [[OSLaunchdJob alloc] _initWithHandle:v5];

  return v6;
}

- (id)_initWithHandle:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5) {
    -[OSLaunchdJob _initWithHandle:](&v12, v13);
  }
  id v6 = v5;
  v11.receiver = self;
  v11.super_class = (Class)OSLaunchdJob;
  id v7 = [(OSLaunchdJob *)&v11 init];
  uint64_t v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_handle, a3);
    id v9 = v8;
  }

  return v8;
}

- (id)start:(id *)a3
{
  *(void *)&v16[37] = *MEMORY[0x263EF8340];
  id v5 = [(OSLaunchdJob *)self _newRequest];
  id v12 = 0;
  uint64_t v6 = _launch_job_routine();
  if (v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      id v7 = _os_launch_job_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        uint64_t v14 = self;
        __int16 v15 = 1024;
        *(_DWORD *)uint64_t v16 = v6;
        v16[2] = 2080;
        *(void *)&v16[3] = xpc_strerror();
        _os_log_impl(&dword_21E925000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: start failed with error %d: %s", buf, 0x1Cu);
      }
    }
    if (a3)
    {
      +[OSLaunchdError createXPCError:v6];
      uint64_t v8 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = +[OSLaunchdJob jobInfoFromMessage:v12];
    if ((unint64_t)([v8 state] - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
      -[OSLaunchdJob start:](&v11, buf);
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      id v9 = _os_launch_job_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        uint64_t v14 = self;
        __int16 v15 = 2114;
        *(void *)uint64_t v16 = v8;
        _os_log_impl(&dword_21E925000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: start succeeded, info=%{public}@", buf, 0x16u);
      }
    }
  }

  return v8;
}

- (id)submitAndStart:(id *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:](&v17, buf);
  }
  if (!self->_plist) {
    [(OSLaunchdJob *)&v17 _newSubmitRequest];
  }
  if (!self->_domain) {
    [(OSLaunchdJob *)&v17 _newSubmitRequest];
  }
  id v5 = [(OSLaunchdJob *)self _newSubmitRequest];
  id v17 = 0;
  uint64_t v6 = _launch_job_routine();
  if (v6)
  {
    uint64_t v7 = v6;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v8 = _os_launch_job_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v19 = v7;
        *(_WORD *)&v19[4] = 2080;
        *(void *)&v19[6] = xpc_strerror();
        _os_log_impl(&dword_21E925000, v8, OS_LOG_TYPE_DEFAULT, "submitAndStart failed with error %d: %s", buf, 0x12u);
      }
    }
    if (a3)
    {
      +[OSLaunchdError createXPCError:v7];
      id v9 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = 0;
    }
  }
  else
  {
    [(OSLaunchdJob *)self processSubmitReply:v17];
    id v9 = +[OSLaunchdJob jobInfoFromMessage:v17];
    uint64_t v10 = [v9 state];
    if ((unint64_t)(v10 - 4) <= 0xFFFFFFFFFFFFFFFDLL) {
      -[OSLaunchdJob submitAndStart:](&v16, buf);
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v11 = _os_launch_job_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        *(void *)v19 = self;
        *(_WORD *)&v19[8] = 2114;
        *(void *)&v19[10] = v9;
        _os_log_impl(&dword_21E925000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: submitAndStart completed, info=%{public}@", buf, 0x16u);
      }
    }
    if (v10 == 3)
    {
      id v12 = (void *)xpc_copy_short_description();
      if (!+[OSLaunchdJob disableLogging_4watchdogd])
      {
        uint64_t v13 = _os_launch_job_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          [(OSLaunchdJob *)(uint64_t)self submitAndStart:v13];
        }
      }
      free(v12);
    }
    plist = self->_plist;
    self->_plist = 0;
  }

  return v9;
}

- (void)_setupMonitorSourceWithPort:(unsigned int)a3 onQueue:(id)a4 withHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  uint64_t v8 = a4;
  id v9 = a5;
  if (!a3) {
    -[OSLaunchdJob _setupMonitorSourceWithPort:onQueue:withHandler:](&v28, buf);
  }
  uint64_t v10 = v9;
  if (!v9) {
    -[OSLaunchdJob monitorOnQueue:withHandler:](&v28, buf);
  }
  if (self->_monitor_source) {
    -[OSLaunchdJob monitorOnQueue:withHandler:](&v28, buf);
  }
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    uint64_t v11 = _os_launch_job_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&uint8_t buf[4] = self;
      _os_log_impl(&dword_21E925000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: starting monitoring", buf, 0xCu);
    }
  }
  id v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF83C8], a3, 0, v8);
  monitor_source = self->_monitor_source;
  self->_monitor_source = v12;

  uint64_t v23 = MEMORY[0x263EF8330];
  uint64_t v24 = 3221225472;
  v25 = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke;
  v26 = &__block_descriptor_36_e5_v8__0l;
  unsigned int v27 = a3;
  dispatch_source_set_mandatory_cancel_handler();
  uint64_t v14 = [(OSLaunchdJob *)self handle];
  __int16 v15 = self->_monitor_source;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_30;
  v18[3] = &unk_2644D0540;
  unsigned int v22 = a3;
  uint64_t v20 = self;
  id v21 = v10;
  id v19 = v14;
  id v16 = v10;
  id v17 = v14;
  dispatch_source_set_event_handler(v15, v18);
  dispatch_activate((dispatch_object_t)self->_monitor_source);
}

- (NSUUID)handle
{
  return self->_handle;
}

- (void)setupMonitorOnQueue:(id)a3 withHandler:(id)a4 reply:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void))a4;
  id v10 = a5;
  uint64_t v11 = +[OSLaunchdJob jobInfoFromMessage:v10];
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    id v12 = _os_launch_job_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138543618;
      id v17 = self;
      __int16 v18 = 2114;
      id v19 = v11;
      _os_log_impl(&dword_21E925000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: monitor initial info is %{public}@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v13 = (void *)MEMORY[0x223C35950](v9);
  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = v13;

  v9[2](v9, v11, 0);
  id v15 = self->_monitor_handler;
  if (v15)
  {
    self->_id monitor_handler = 0;

    [(OSLaunchdJob *)self _setupMonitorSourceWithPort:xpc_dictionary_extract_mach_recv() onQueue:v8 withHandler:v9];
  }
}

+ (BOOL)disableLogging_4watchdogd
{
  return _OSLaunchdJobLoggingDisabled;
}

- (void)processSubmitReply:(id)a3
{
  id v4 = a3;
  -[OSLaunchdJob _populateHandle:](self, "_populateHandle:");
  if (self->_monitor_handler) {
    [(OSLaunchdJob *)self _startMonitoringAfterSubmit:v4];
  }
}

- (void)_populateHandle:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:](&v9, v10);
  }
  id v8 = v4;
  uuid = xpc_dictionary_get_uuid(v4, "job-handle");
  if (!uuid) {
    -[OSLaunchdJob _populateHandle:](&v9, v10);
  }
  uint64_t v6 = (NSUUID *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
  handle = self->_handle;
  self->_handle = v6;
}

- (id)_newSubmitRequest
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (!self->_plist) {
    [(OSLaunchdJob *)&v5 _newSubmitRequest];
  }
  if (!self->_domain) {
    [(OSLaunchdJob *)&v5 _newSubmitRequest];
  }
  id v3 = [(OSLaunchdJob *)self _newRequest];
  xpc_dictionary_set_uint64(v3, "type", self->_domain->_type);
  xpc_dictionary_set_uint64(v3, "handle", self->_domain->_handle);
  xpc_dictionary_set_value(v3, "plist", self->_plist);
  xpc_dictionary_set_BOOL(v3, "monitor", self->_monitor_handler != 0);
  return v3;
}

- (void)monitorOnQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (!v7) {
    -[OSLaunchdJob monitorOnQueue:withHandler:](&v17, buf);
  }
  if (self->_monitor_handler) {
    -[OSLaunchdJob monitorOnQueue:withHandler:].cold.4(&v17, buf);
  }
  if (self->_monitor_source) {
    -[OSLaunchdJob monitorOnQueue:withHandler:](&v17, buf);
  }
  id v8 = (void (**)(void, void, void))v7;
  if (self->_handle)
  {
    monitor_queue = [(OSLaunchdJob *)self _newRequest];
    id v17 = 0;
    uint64_t v10 = _launch_job_routine();
    if (v10)
    {
      uint64_t v11 = v10;
      if (!+[OSLaunchdJob disableLogging_4watchdogd])
      {
        id v12 = _os_launch_job_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          id v19 = self;
          __int16 v20 = 1024;
          int v21 = v11;
          __int16 v22 = 2080;
          uint64_t v23 = xpc_strerror();
          _os_log_impl(&dword_21E925000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: error creating monitor %d: %s", buf, 0x1Cu);
        }
      }
      v8[2](v8, 0, +[OSLaunchdJob _monitorNormalizeError:v11]);
    }
    else
    {
      [(OSLaunchdJob *)self setupMonitorOnQueue:v6 withHandler:v8 reply:v17];
    }
  }
  else
  {
    if (!self->_plist) {
      [(OSLaunchdJob *)&v17 _newSubmitRequest];
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v13 = _os_launch_job_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21E925000, v13, OS_LOG_TYPE_DEFAULT, "monitoring will start once the job is submitted", buf, 2u);
      }
    }
    uint64_t v14 = (void *)MEMORY[0x223C35950](v8);
    id monitor_handler = self->_monitor_handler;
    self->_id monitor_handler = v14;

    int v16 = (OS_dispatch_queue *)v6;
    monitor_queue = self->_monitor_queue;
    self->_monitor_queue = v16;
  }
}

- (id)_newRequest
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_dictionary_create(0, 0, 0);
  handle = self->_handle;
  if (handle)
  {
    *(void *)uuid = 0;
    uint64_t v7 = 0;
    [(NSUUID *)handle getUUIDBytes:uuid];
    xpc_dictionary_set_uuid(v3, "job-handle", uuid);
  }
  return v3;
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

uint64_t __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  uint64_t result = _xpc_mach_port_close_recv(*(_DWORD *)(a1 + 32), 0, 0);
  if (result) {
    __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1(&v2, v3);
  }
  return result;
}

- (void)_startMonitoringAfterSubmit:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_monitor_handler) {
    -[OSLaunchdJob _startMonitoringAfterSubmit:](&v8, v9);
  }
  id v7 = v4;
  [(OSLaunchdJob *)self _setupMonitorSourceWithPort:xpc_dictionary_extract_mach_recv() onQueue:self->_monitor_queue withHandler:self->_monitor_handler];
  id monitor_handler = self->_monitor_handler;
  self->_id monitor_handler = 0;

  monitor_queue = self->_monitor_queue;
  self->_monitor_queue = 0;
}

- (BOOL)submit:(id *)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_handle) {
    -[OSLaunchdJob _populateHandle:](&v10, buf);
  }
  if (!self->_plist) {
    [(OSLaunchdJob *)&v10 _newSubmitRequest];
  }
  if (!self->_domain) {
    [(OSLaunchdJob *)&v10 _newSubmitRequest];
  }
  id v5 = [(OSLaunchdJob *)self _newSubmitRequest];
  id v10 = 0;
  uint64_t v6 = _launch_job_routine();
  if (v6)
  {
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      id v7 = _os_launch_job_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v12 = v6;
        __int16 v13 = 2080;
        uint64_t v14 = xpc_strerror();
        _os_log_impl(&dword_21E925000, v7, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }
    }
    if (a3)
    {
      *a3 = +[OSLaunchdError createXPCError:v6];
    }
  }
  else
  {
    plist = self->_plist;
    self->_plist = 0;

    [(OSLaunchdJob *)self processSubmitReply:v10];
  }

  return v6 == 0;
}

+ (BOOL)submitAll:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v5 = a3;
  xpc_object_t empty = xpc_array_create_empty();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v7);
        }
        int v12 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * i) _newSubmitRequest];
        xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v9);
  }

  xpc_object_t v13 = xpc_dictionary_create_empty();
  xpc_dictionary_set_value(v13, "all-jobs", empty);
  xpc_object_t xdict = 0;
  uint64_t v14 = _launch_job_routine();
  if (v14)
  {
    uint64_t v15 = v14;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      int v16 = _os_launch_job_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v17 = xpc_strerror();
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v42 = v15;
        *(_WORD *)&v42[4] = 2080;
        *(void *)&v42[6] = v17;
        _os_log_impl(&dword_21E925000, v16, OS_LOG_TYPE_DEFAULT, "submit failed with error %d: %s", buf, 0x12u);
      }
    }
    if (a4)
    {
      +[OSLaunchdError createXPCError:v15];
      BOOL v18 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v18 = 0;
    }
  }
  else
  {
    id v19 = xpc_dictionary_get_array(xdict, "results");
    size_t count = xpc_array_get_count(v19);
    if (count != [v7 count]) {
      +[OSLaunchdJob submitAll:error:](&v35, buf);
    }
    if (xpc_array_get_count(v19))
    {
      xpc_object_t v33 = v13;
      v34 = a4;
      size_t v21 = 0;
      id v22 = 0;
      unint64_t v23 = 0x2644D0000uLL;
      do
      {
        uint64_t v24 = xpc_array_get_dictionary(v19, v21);
        int64_t int64 = xpc_dictionary_get_int64(v24, "error");
        if (int64)
        {
          if ((objc_msgSend(*(id *)(v23 + 1224), "disableLogging_4watchdogd") & 1) == 0)
          {
            v26 = _os_launch_job_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
            {
              [v7 objectAtIndexedSubscript:v21];
              v28 = unint64_t v27 = v23;
              uint64_t v29 = xpc_strerror();
              *(_DWORD *)buf = 138412802;
              *(void *)v42 = v28;
              *(_WORD *)&v42[8] = 1024;
              *(_DWORD *)&v42[10] = int64;
              __int16 v43 = 2080;
              uint64_t v44 = v29;
              _os_log_impl(&dword_21E925000, v26, OS_LOG_TYPE_DEFAULT, "submit (%@) failed with error %d: %s", buf, 0x1Cu);

              unint64_t v23 = v27;
            }
          }
          if (v22)
          {
            uint64_t v30 = +[OSLaunchdError createXPCError:133];

            id v22 = (id)v30;
          }
          else
          {
            id v22 = +[OSLaunchdError createXPCError:int64];
          }
        }
        else
        {
          uint64_t v31 = [v7 objectAtIndexedSubscript:v21];
          [v31 processSubmitReply:v24];
        }
        ++v21;
      }
      while (v21 < xpc_array_get_count(v19));
      xpc_object_t v13 = v33;
      if (v34 && v22)
      {
        id v22 = v22;
        id *v34 = v22;
      }
    }
    else
    {
      id v22 = 0;
    }
    BOOL v18 = v22 == 0;
  }
  return v18;
}

- (BOOL)remove:(id *)a3
{
  *(void *)&v17[13] = *MEMORY[0x263EF8340];
  if (self->_handle)
  {
    id v5 = [(OSLaunchdJob *)self _newRequest];
    uint64_t v6 = _launch_job_routine();
    uint64_t v7 = v6;
    if (v6 != 36 && v6)
    {
      if (!+[OSLaunchdJob disableLogging_4watchdogd])
      {
        uint64_t v8 = _os_launch_job_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          uint64_t v15 = self;
          __int16 v16 = 1024;
          *(_DWORD *)uint64_t v17 = v7;
          v17[2] = 2080;
          *(void *)&v17[3] = xpc_strerror();
          uint64_t v10 = "%{public}@: remove failed with error %d %s";
          uint64_t v11 = v8;
          uint32_t v12 = 28;
LABEL_15:
          _os_log_impl(&dword_21E925000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
        }
LABEL_16:
      }
    }
    else if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v8 = _os_launch_job_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = (const char *)&unk_21E92C9B2;
        if (v7 == 36) {
          uint64_t v9 = " (EINPROGRESS)";
        }
        *(_DWORD *)buf = 138543618;
        uint64_t v15 = self;
        __int16 v16 = 2080;
        *(void *)uint64_t v17 = v9;
        uint64_t v10 = "%{public}@: remove succeeded%s";
        uint64_t v11 = v8;
        uint32_t v12 = 22;
        goto LABEL_15;
      }
      goto LABEL_16;
    }

    goto LABEL_21;
  }
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    id v5 = _os_launch_job_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = self;
      _os_log_impl(&dword_21E925000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: remove on a job with no handle (ESRCH)", buf, 0xCu);
    }
    uint64_t v7 = 3;
LABEL_21:

    if (!a3) {
      return v7 == 0;
    }
    goto LABEL_22;
  }
  uint64_t v7 = 3;
  if (!a3) {
    return v7 == 0;
  }
LABEL_22:
  if (v7)
  {
    *a3 = +[OSLaunchdError createXPCError:v7];
  }
  return v7 == 0;
}

- (id)getCurrentJobInfo
{
  id v2 = [(OSLaunchdJob *)self _newRequest];
  uint64_t v3 = 0;
  if (!_launch_job_routine())
  {
    uint64_t v3 = +[OSLaunchdJob jobInfoFromMessage:0];
  }

  return v3;
}

- (id)createInstance:(unsigned __int8)a3[16] error:(id *)a4
{
  uint64_t v7 = objc_opt_new();
  uint64_t v8 = [(OSLaunchdJob *)self createInstance:a3 properties:v7 error:a4];

  return v8;
}

+ (int)_monitorNormalizeError:(int)a3
{
  if (a3 == 3) {
    return 113;
  }
  else {
    return a3;
  }
}

+ (id)copyJobsManagedBy:(id)a3 error:(id *)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!v5) {
    +[OSLaunchdJob copyJobsManagedBy:error:](&xdict, buf);
  }
  uint64_t v6 = v5;
  xpc_object_t v7 = xpc_dictionary_create(0, 0, 0);
  id v8 = v6;
  xpc_dictionary_set_string(v7, "manager", (const char *)[v8 UTF8String]);
  xpc_object_t xdict = 0;
  uint64_t v9 = _launch_job_routine();
  if (v9)
  {
    uint64_t v10 = v9;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v11 = _os_launch_job_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109378;
        int v22 = v10;
        __int16 v23 = 2080;
        uint64_t v24 = xpc_strerror();
        _os_log_impl(&dword_21E925000, v11, OS_LOG_TYPE_DEFAULT, "copyJobsManagedBy failed with error %d: %s", buf, 0x12u);
      }
    }
    if (a4)
    {
      +[OSLaunchdError createXPCError:v10];
      uint32_t v12 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint32_t v12 = 0;
    }
  }
  else
  {
    xpc_object_t v13 = xpc_dictionary_get_array(xdict, "handles");
    uint32_t v12 = [MEMORY[0x263EFF980] arrayWithCapacity:xpc_array_get_count(v13)];
    if (xpc_array_get_count(v13))
    {
      size_t v14 = 0;
      do
      {
        uuid = xpc_array_get_uuid(v13, v14);
        if (!uuid) {
          -[OSLaunchdJob _populateHandle:](&v19, buf);
        }
        __int16 v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];
        id v17 = [[OSLaunchdJob alloc] _initWithHandle:v16];
        [v12 addObject:v17];

        ++v14;
      }
      while (v14 < xpc_array_get_count(v13));
    }
  }
  return v12;
}

+ (id)copyJobWithHandle:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (!v3) {
    +[OSLaunchdJob copyJobWithHandle:](&xdict, buf);
  }
  id v4 = v3;

  id v5 = [[OSLaunchdJob alloc] _initWithHandle:v4];
  uint64_t v6 = (void *)[v5 _newRequest];
  xpc_object_t xdict = 0;
  int v7 = _launch_job_routine();
  if (v7)
  {
    int v8 = v7;
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v9 = _os_launch_job_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        id v20 = v4;
        __int16 v21 = 1024;
        int v22 = v8;
        __int16 v23 = 2080;
        uint64_t v24 = xpc_strerror();
        _os_log_impl(&dword_21E925000, v9, OS_LOG_TYPE_DEFAULT, "copyJobWithHandle:%{public}@ failed with error %d: %s", buf, 0x1Cu);
      }
    }
    id v10 = 0;
  }
  else
  {
    uuid = xpc_dictionary_get_uuid(xdict, "job-handle");
    if (!uuid) {
      -[OSLaunchdJob _populateHandle:](&v17, buf);
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:uuid];

    xpc_object_t v13 = [v5 handle];
    char v14 = [v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      +[OSLaunchdJob copyJobWithHandle:](&v17, buf);
    }
    if (!+[OSLaunchdJob disableLogging_4watchdogd])
    {
      uint64_t v15 = _os_launch_job_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v20 = v5;
        _os_log_impl(&dword_21E925000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithHandle: created a job", buf, 0xCu);
      }
    }
    id v10 = v5;
    id v4 = (void *)v12;
  }

  return v10;
}

+ (id)copyJobWithLabel:(id)a3 domain:(id)a4
{
  *(void *)&v19[13] = *MEMORY[0x263EF8340];
  id v6 = a3;
  int v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  id v9 = v6;
  xpc_dictionary_set_string(v8, "label", (const char *)[v9 UTF8String]);
  xpc_dictionary_set_uint64(v8, "type", *((int *)v7 + 2));
  uint64_t v10 = v7[2];

  xpc_dictionary_set_uint64(v8, "handle", v10);
  int v11 = _launch_job_routine();
  if (!v11)
  {
    xpc_object_t v13 = [a1 _createJobFromReplyHandle:0];
    if (+[OSLaunchdJob disableLogging_4watchdogd]) {
      goto LABEL_11;
    }
    char v14 = _os_launch_job_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v17 = v13;
      __int16 v18 = 2114;
      *(void *)uint64_t v19 = v9;
      _os_log_impl(&dword_21E925000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: copyJobWithLabel for label %{public}@ created a job", buf, 0x16u);
    }
LABEL_10:

    goto LABEL_11;
  }
  int v12 = v11;
  if (!+[OSLaunchdJob disableLogging_4watchdogd])
  {
    char v14 = _os_launch_job_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      id v17 = v9;
      __int16 v18 = 1024;
      *(_DWORD *)uint64_t v19 = v12;
      v19[2] = 2080;
      *(void *)&v19[3] = xpc_strerror();
      _os_log_impl(&dword_21E925000, v14, OS_LOG_TYPE_DEFAULT, "copyJobWithLabel for label %{public}@ failed with error %d: %s", buf, 0x1Cu);
    }
    xpc_object_t v13 = 0;
    goto LABEL_10;
  }
  xpc_object_t v13 = 0;
LABEL_11:

  return v13;
}

+ (void)setDisableLogging_4watchdogd:(BOOL)a3
{
  _OSLaunchdJobLoggingDisabled = a3;
}

- (void)_newSubmitRequest
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)_populateHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)_populateHandle:(void *)a1 .cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)_startMonitoringAfterSubmit:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)submitAndStart:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  if (OUTLINED_FUNCTION_7()) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = OUTLINED_FUNCTION_6(v5, v2, v3, v4, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_8(v6);
  __break(1u);
}

- (void)submitAndStart:(os_log_t)log .cold.4(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2082;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_21E925000, log, OS_LOG_TYPE_ERROR, "%{public}@: job failed to spawn, plist=%{public}s", (uint8_t *)&v3, 0x16u);
}

+ (void)submitAll:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)start:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  if (OUTLINED_FUNCTION_7()) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = OUTLINED_FUNCTION_6(v5, v2, v3, v4, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_8(v6);
  __break(1u);
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)monitorOnQueue:(void *)a1 withHandler:(_OWORD *)a2 .cold.4(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithPlist:(void *)a1 domain:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)initWithPlist:(void *)a1 domain:(_OWORD *)a2 .cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)_initWithHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)jobStateFromMessage:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  if (OUTLINED_FUNCTION_7()) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = OUTLINED_FUNCTION_6(v5, v2, v3, v4, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_8(v6);
  __break(1u);
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)jobInfoFromMessage:(void *)a1 .cold.4(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

- (void)_setupMonitorSourceWithPort:(void *)a1 onQueue:(_OWORD *)a2 withHandler:.cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

void __64__OSLaunchdJob__setupMonitorSourceWithPort_onQueue_withHandler___block_invoke_cold_1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_3_0(a1, a2);
  if (OUTLINED_FUNCTION_7()) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 2;
  }
  uint64_t v6 = OUTLINED_FUNCTION_6(v5, v2, v3, v4, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_8(v6);
  __break(1u);
}

+ (void)copyJobsManagedBy:(void *)a1 error:(_OWORD *)a2 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)copyJobWithHandle:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)copyJobWithHandle:(void *)a1 .cold.3(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)submitExtension:(void *)a1 overlay:(_OWORD *)a2 domain:error:.cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)submitExtension:(void *)a1 overlay:(_OWORD *)a2 domain:error:.cold.2(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

+ (void)copyJobWithPid:(void *)a1 .cold.1(void *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2();
  uint64_t v6 = OUTLINED_FUNCTION_0(v2, v3, v4, v5, (uint64_t)&dword_21E925000);
  OUTLINED_FUNCTION_3(v6);
  __break(1u);
}

@end