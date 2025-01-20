@interface AUHostingService
+ (BOOL)conformsToProtocol:(id)a3;
+ (BOOL)instancesRespondToSelector:(SEL)a3;
- (AUHostingService)initWithConnection:(id)a3;
- (id).cxx_construct;
- (id)forwardingTargetForSelector:(SEL)a3;
- (void)closeHost:(id)a3;
- (void)dealloc;
- (void)establishConnection:(id)a3;
- (void)loadAudioUnitInRemoteHost:(AudioComponentDescription *)a3 config:(id)a4 reply:(id)a5;
- (void)retrieveAudioUnitInstanceID:(id)a3;
@end

@implementation AUHostingService

- (id).cxx_construct
{
  *((_OWORD *)self + 3) = 0uLL;
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  if (*((char *)&self->_instanceUUID.__r_.__value_.var0.__l + 23) < 0) {
    operator delete(self->_instanceUUID.__r_.__value_.var0.__l.__data_);
  }
  objc_destroyWeak((id *)&self->_connection);
  objc_storeStrong((id *)&self->_host, 0);
}

- (void)dealloc
{
  if (self->_host)
  {
    v3 = +[AUHostingServiceInstanceMap sharedInstance];
    v4 = [(AURemoteHost *)self->_host audioUnitUUID];
    [v3 unregisterInstance:v4];

    host = self->_host;
    self->_host = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)AUHostingService;
  [(AUHostingService *)&v6 dealloc];
}

- (void)closeHost:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  objc_super v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained auditToken];
  }
  else {
    memset(&task_info_out[1], 0, sizeof(audit_token_t));
  }
  task_info_outCnt.val[0] = 8;
  if (task_info(*MEMORY[0x1E4F14960], 0xFu, (task_info_t)task_info_out, task_info_outCnt.val))
  {
    _os_assert_log();
    _os_crash();
    __break(1u);
  }
  else
  {
    audit_token_t task_info_outCnt = task_info_out[1];
    pid_t v7 = audit_token_to_pid(&task_info_outCnt);
    audit_token_t atoken = task_info_out[0];
    if (v7 == audit_token_to_pid(&atoken))
    {
      audit_token_t v20 = task_info_out[1];
      int v8 = audit_token_to_pidversion(&v20);
      audit_token_t v19 = task_info_out[0];
      BOOL v9 = v8 == audit_token_to_pidversion(&v19);
    }
    else
    {
      BOOL v9 = 0;
    }

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __30__AUHostingService_closeHost___block_invoke;
    aBlock[3] = &unk_1E56887F0;
    aBlock[4] = self;
    BOOL v17 = v9;
    id v10 = v4;
    id v16 = v10;
    v11 = _Block_copy(aBlock);
    v12 = (void (**)(void, void))v11;
    uint64_t v13 = atomic_fetch_add(g_number_of_connections, 0xFFFFFFFF) - 1;
    if (v9)
    {
      (*((void (**)(void *, BOOL))v11 + 2))(v11, v13 == 0);
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v14[2]();
    }
    else
    {
      (*((void (**)(id, void, uint64_t))v10 + 2))(v10, 0, v13);
      ((void (**)(void, BOOL))v12)[2](v12, v13 == 0);
      v14 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      dispatch_async(MEMORY[0x1E4F14428], v14);
    }
  }
}

id __30__AUHostingService_closeHost___block_invoke(uint64_t a1, char a2)
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __30__AUHostingService_closeHost___block_invoke_2;
  aBlock[3] = &unk_1E56887C8;
  v3 = *(void **)(a1 + 40);
  aBlock[4] = *(void *)(a1 + 32);
  char v8 = *(unsigned char *)(a1 + 48);
  id v7 = v3;
  char v9 = a2;
  id v4 = _Block_copy(aBlock);

  return v4;
}

void __30__AUHostingService_closeHost___block_invoke_2(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)(a1 + 32);
  CAFormatter::CAFormatter((CAFormatter *)&v13, (const AudioComponentDescription *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *v2;
  id v4 = (void *)(*v2 + 48);
  if (*(char *)(v3 + 71) < 0) {
    id v4 = (void *)*v4;
  }
  {
    caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
  }
  v5 = (id) auhs_log_category(void)::category;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315906;
    v15 = "AUHostingService.mm";
    __int16 v16 = 1024;
    int v17 = 186;
    __int16 v18 = 2080;
    audit_token_t v19 = v13;
    __int16 v20 = 2080;
    v21 = v4;
    _os_log_impl(&dword_18FEC0000, v5, OS_LOG_TYPE_INFO, "%25s:%-5d Releasing Audio Unit %s and disconnecting from Hosting Service %s", buf, 0x26u);
  }
  objc_super v6 = +[AUHostingServiceInstanceMap sharedInstance];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) audioUnitUUID];
  [v6 unregisterInstance:v7];

  uint64_t v8 = *(void *)(a1 + 32);
  char v9 = *(void **)(v8 + 8);
  *(void *)(v8 + 8) = 0;

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [WeakRetained invalidate];

  id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  [v11 setExportedObject:0];

  if (*(unsigned char *)(a1 + 48))
  {
    atomic_load((unsigned int *)&g_number_of_connections);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  if (*(unsigned char *)(a1 + 49))
  {
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v12 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v15 = "AUHostingService.mm";
      __int16 v16 = 1024;
      int v17 = 202;
      __int16 v18 = 2080;
      audit_token_t v19 = v4;
      _os_log_impl(&dword_18FEC0000, v12, OS_LOG_TYPE_INFO, "%25s:%-5d Shutting down Audio Unit Hosting Service %s", buf, 0x1Cu);
    }
    {
      AUHostingService_exit_handler(void)::handler = 0;
      qword_1E9299898 = (uint64_t)&unk_1EDF9E7A0;
      qword_1E92998B0 = (uint64_t)&qword_1E9299898;
    }
    os_unfair_lock_lock((os_unfair_lock_t)&AUHostingService_exit_handler(void)::handler);
    if (!qword_1E92998B0) {
      std::__throw_bad_function_call[abi:ne180100]();
    }
    (*(void (**)(uint64_t))(*(void *)qword_1E92998B0 + 48))(qword_1E92998B0);
    os_unfair_lock_unlock((os_unfair_lock_t)&AUHostingService_exit_handler(void)::handler);
  }
  if (v13) {
    free(v13);
  }
}

- (void)loadAudioUnitInRemoteHost:(AudioComponentDescription *)a3 config:(id)a4 reply:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  char v9 = (void (**)(id, void))a5;
  UInt32 componentFlagsMask = a3->componentFlagsMask;
  *(_OWORD *)&self->_componentDescription.componentType = *(_OWORD *)&a3->componentType;
  self->_componentDescription.UInt32 componentFlagsMask = componentFlagsMask;
  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  v12 = [v8 objectForKeyedSubscript:@"audioUnitInstanceUUID"];
  uint64_t v13 = (void *)[v11 initWithUUIDString:v12];

  if (v13)
  {
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v14 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "AUHostingService.mm";
      __int16 v36 = 1024;
      int v37 = 148;
      __int16 v38 = 2112;
      v39 = v13;
      _os_log_impl(&dword_18FEC0000, v14, OS_LOG_TYPE_INFO, "%25s:%-5d Attempting to retrieve %@", buf, 0x1Cu);
    }
    v15 = +[AUHostingServiceInstanceMap sharedInstance];
    __int16 v16 = [v15 retrieveInstance:v13];
    host = self->_host;
    self->_host = v16;

    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    __int16 v18 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      audit_token_t v19 = [(AURemoteHost *)self->_host audioUnitUUID];
      __int16 v20 = [v19 UUIDString];
      v21 = self->_host;
      *(_DWORD *)buf = 136315906;
      v35 = "AUHostingService.mm";
      __int16 v36 = 1024;
      int v37 = 150;
      __int16 v38 = 2112;
      v39 = v20;
      __int16 v40 = 2112;
      v41 = v21;
      _os_log_impl(&dword_18FEC0000, v18, OS_LOG_TYPE_INFO, "%25s:%-5d Connected to Audio Unit with UUID: %@ host instance: %@", buf, 0x26u);
    }
  }
  else
  {
    uint64_t v22 = [AURemoteHost alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
    v24 = [(AURemoteHost *)v22 initWithConnection:WeakRetained config:v8];
    v25 = self->_host;
    self->_host = v24;

    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v26 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = [(AURemoteHost *)self->_host audioUnitUUID];
      v28 = [v27 UUIDString];
      v29 = self->_host;
      *(_DWORD *)buf = 136315906;
      v35 = "AUHostingService.mm";
      __int16 v36 = 1024;
      int v37 = 153;
      __int16 v38 = 2112;
      v39 = v28;
      __int16 v40 = 2112;
      v41 = v29;
      _os_log_impl(&dword_18FEC0000, v26, OS_LOG_TYPE_INFO, "%25s:%-5d Hosting Audio Unit with UUID: %@ host instance: %@", buf, 0x26u);
    }
    __int16 v18 = +[AUHostingServiceInstanceMap sharedInstance];
    v30 = [(AURemoteHost *)self->_host audioUnitUUID];
    [v18 registerInstance:v30 instance:self->_host];
  }
  if (self->_host)
  {
    CAFormatter::CAFormatter((CAFormatter *)&v33, &self->_componentDescription);
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    v31 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      v35 = "AUHostingService.mm";
      __int16 v36 = 1024;
      int v37 = 164;
      __int16 v38 = 2080;
      v39 = v33;
      _os_log_impl(&dword_18FEC0000, v31, OS_LOG_TYPE_INFO, "%25s:%-5d Hosting Audio Unit: %s", buf, 0x1Cu);
    }
    v9[2](v9, 0);
    if (v33) {
      free(v33);
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10875 userInfo:0];
    ((void (**)(id, void *))v9)[2](v9, v32);
  }
}

- (void)retrieveAudioUnitInstanceID:(id)a3
{
  objc_super v6 = (void (**)(id, void, void *))a3;
  host = self->_host;
  if (host)
  {
    v5 = [(AURemoteHost *)host audioUnitUUID];
    v6[2](v6, 0, v5);
  }
  else
  {
    v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:-10867 userInfo:0];
    ((void (**)(id, void *, void *))v6)[2](v6, v5, 0);
  }
}

- (id)forwardingTargetForSelector:(SEL)a3
{
  host = self->_host;
  if (host)
  {
    if (objc_opt_respondsToSelector()) {
      host = self->_host;
    }
    else {
      host = 0;
    }
  }
  return host;
}

- (void)establishConnection:(id)a3
{
}

- (AUHostingService)initWithConnection:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AUHostingService;
  v5 = [(AUHostingService *)&v17 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_connection, v4);
    unsigned int add = atomic_fetch_add(g_number_of_connections, 1u);
    id v8 = [MEMORY[0x1E4F29290] _UUID];
    char v9 = v8;
    if (v8)
    {
      id v10 = [v8 UUIDString];
      std::string::__assign_external((std::string *)&v6->_instanceUUID, (const std::string::value_type *)[v10 UTF8String]);
    }
    if (!add)
    {
      {
        caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
      }
      id v11 = (id) auhs_log_category(void)::category;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        p_instanceUUID = (__long *)&v6->_instanceUUID;
        if (*((char *)&v6->_instanceUUID.__r_.__value_.var0.__l + 23) < 0) {
          p_instanceUUID = (__long *)p_instanceUUID->__data_;
        }
        *(_DWORD *)buf = 136315650;
        audit_token_t v19 = "AUHostingService.mm";
        __int16 v20 = 1024;
        int v21 = 96;
        __int16 v22 = 2080;
        v23 = p_instanceUUID;
        _os_log_impl(&dword_18FEC0000, v11, OS_LOG_TYPE_INFO, "%25s:%-5d Launched new Audio Unit Hosting Service %s", buf, 0x1Cu);
      }
    }
    {
      caulk::log_category::log_category((caulk::log_category *)&auhs_log_category(void)::category, "com.apple.coreaudio", "AUHostingService");
    }
    uint64_t v13 = (id) auhs_log_category(void)::category;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = (__long *)&v6->_instanceUUID;
      if (*((char *)&v6->_instanceUUID.__r_.__value_.var0.__l + 23) < 0) {
        v14 = (__long *)v14->__data_;
      }
      *(_DWORD *)buf = 136315650;
      audit_token_t v19 = "AUHostingService.mm";
      __int16 v20 = 1024;
      int v21 = 100;
      __int16 v22 = 2080;
      v23 = v14;
      _os_log_impl(&dword_18FEC0000, v13, OS_LOG_TYPE_INFO, "%25s:%-5d New connection with Audio Unit Hosting Service %s", buf, 0x1Cu);
    }
    v15 = v6;
  }

  return v6;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  if (+[AURemoteHost instancesRespondToSelector:](AURemoteHost, "instancesRespondToSelector:")) {
    return 1;
  }
  objc_super v6 = (void *)[a1 superclass];
  return [v6 instancesRespondToSelector:a3];
}

+ (BOOL)conformsToProtocol:(id)a3
{
  id v4 = a3;
  if (+[AURemoteHost conformsToProtocol:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = objc_msgSend((id)objc_msgSend(a1, "superclass"), "conformsToProtocol:", v4);
  }

  return v5;
}

@end