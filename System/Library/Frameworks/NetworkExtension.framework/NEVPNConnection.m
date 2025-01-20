@interface NEVPNConnection
+ (id)createConnectionForEnabledEnterpriseConfiguration;
+ (id)createConnectionForEnabledEnterpriseConfigurationWithName:(id)a3;
+ (id)createDisconnectErrorWithDomain:(id)a3 code:(unsigned int)a4;
- (BOOL)installNotify;
- (BOOL)installed;
- (BOOL)startVPNTunnelAndReturnError:(NSError *)error;
- (BOOL)startVPNTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error;
- (NEVPNManager)manager;
- (NEVPNStatus)status;
- (NSDate)connectedDate;
- (NSError)lastDisconnectError;
- (id)initWithType:(void *)a1;
- (uint64_t)reload;
- (void)createSessionWithConfigurationIdentifier:(uint64_t)a3 forceInfoFetch:(void *)a4 completionHandler:;
- (void)dealloc;
- (void)destroySession;
- (void)fetchExtendedStatusWithCompletionHandler:(id)a3;
- (void)fetchLastDisconnectErrorWithCompletionHandler:(void *)handler;
- (void)fetchStatisticsWithCompletionHandler:(id)a3;
- (void)notifyStatusChanged;
- (void)resetLastDisconnectError:(void *)a1;
- (void)setInstallNotify:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)stopVPNTunnel;
- (void)updateSessionInfoForce:(uint64_t)a3 notify:(void *)a4 withCompletionHandler:;
@end

@implementation NEVPNConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastDisconnectError, 0);
  objc_destroyWeak((id *)&self->_weakmanager);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configurationName, 0);
  objc_storeStrong((id *)&self->_configManager, 0);

  objc_storeStrong((id *)&self->_connectedDate, 0);
}

- (NSError)lastDisconnectError
{
  return (NSError *)objc_getProperty(self, a2, 72, 1);
}

- (void)setInstallNotify:(BOOL)a3
{
  self->_installNotify = a3;
}

- (BOOL)installNotify
{
  return self->_installNotify;
}

- (void)setInstalled:(BOOL)a3
{
  self->_installed = a3;
}

- (BOOL)installed
{
  return self->_installed;
}

- (NSDate)connectedDate
{
  return (NSDate *)objc_getProperty(self, a2, 24, 1);
}

- (NEVPNStatus)status
{
  return self->_status;
}

- (void)fetchStatisticsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  ne_session_get_info();
}

void __56__NEVPNConnection_fetchStatisticsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4 && MEMORY[0x19F3B92C0]() == MEMORY[0x1E4F14590]) {
    id v3 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  }
  else {
    id v3 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchExtendedStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E5993228;
  id v7 = v4;
  id v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1, 0, v6);
}

uint64_t __60__NEVPNConnection_fetchExtendedStatusWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateSessionInfoForce:(uint64_t)a3 notify:(void *)a4 withCompletionHandler:
{
  id v5 = a4;
  v6 = (void (**)(void, void, void))v5;
  if (a1)
  {
    if (*(void *)(a1 + 56))
    {
      id v9 = v5;
      ne_session_get_info2();
    }
    else
    {
      id v7 = ne_log_obj();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_DEFAULT, "No ne_session available, cannot update session info", buf, 2u);
      }

      v8 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
      ((void (**)(void, void *, void))v6)[2](v6, v8, 0);
    }
  }
}

void __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (!v3 || (uint64_t v5 = MEMORY[0x19F3B92C0](v3), v6 = MEMORY[0x1E4F14590], v5 != MEMORY[0x1E4F14590]))
  {
    long long v44 = *(_OWORD *)(a1 + 40);
    id v7 = (id)v44;
    ne_session_get_status();

    goto LABEL_36;
  }
  int64_t int64 = xpc_dictionary_get_int64(v4, "NEStatus");
  id v9 = xpc_dictionary_get_value(v4, "IPv4");
  v10 = xpc_dictionary_get_value(v4, "IPv6");
  if (v9 && MEMORY[0x19F3B92C0](v9) == v6)
  {
    BOOL v11 = 1;
    goto LABEL_10;
  }
  if (v10)
  {
    BOOL v11 = MEMORY[0x19F3B92C0](v10) == v6;
LABEL_10:
    LODWORD(v43) = v11;
    goto LABEL_11;
  }
  LODWORD(v43) = 0;
LABEL_11:
  uint64_t v12 = xpc_dictionary_get_value(v4, "IPSec");
  v13 = (void *)v12;
  if ((v12 && MEMORY[0x19F3B92C0](v12) == v6
     || (xpc_dictionary_get_value(v4, "PPP"),
         uint64_t v14 = objc_claimAutoreleasedReturnValue(),
         v13,
         (v13 = (void *)v14) != 0))
    && MEMORY[0x19F3B92C0](v13) == v6)
  {
    unsigned int v18 = xpc_dictionary_get_int64(v4, "Status") + 1;
    if (v18 <= 4) {
      int64_t int64 = qword_19DF9D368[v18];
    }
    int64_t v17 = xpc_dictionary_get_int64(v13, "ConnectTime");
  }
  else
  {
    uint64_t v15 = xpc_dictionary_get_value(v4, "VPN");
    v16 = (void *)v15;
    if (v15 && MEMORY[0x19F3B92C0](v15) == v6) {
      int64_t v17 = xpc_dictionary_get_int64(v16, "ConnectTime");
    }
    else {
      int64_t v17 = 0;
    }
  }
  size_t length = 0;
  data = xpc_dictionary_get_data(v4, "LastDisconnectError", &length);
  if (data)
  {
    v20 = data;
    id v21 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v22 = (void *)[v21 initWithBytesNoCopy:v20 length:length freeWhenDone:0];
    uint64_t v46 = 0;
    v23 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v22 error:&v46];
    if (v46)
    {
      v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "Failed to decode the last disconnect error", buf, 2u);
      }
    }
  }
  else
  {
    v23 = 0;
  }
  v25 = *(void **)(a1 + 32);
  if (v25) {
    uint64_t v26 = v25[7];
  }
  else {
    uint64_t v26 = 0;
  }
  if (v26 != *(void *)(a1 + 48)) {
    goto LABEL_33;
  }
  -[NEVPNConnection resetLastDisconnectError:](v25, v23);
  uint64_t v28 = [*(id *)(a1 + 32) status];
  v29 = *(void **)(a1 + 32);
  if (v28 == int64)
  {
    if (v43 == [v29 installed]) {
      goto LABEL_33;
    }
    goto LABEL_49;
  }
  v29[2] = int64;
  v30 = [*(id *)(a1 + 32) connectedDate];
  if (v30)
  {
    uint64_t v31 = *(void *)(*(void *)(a1 + 32) + 16);

    if (v31 == 1)
    {
      uint64_t v32 = *(void *)(a1 + 32);
      v33 = *(void **)(v32 + 24);
      *(void *)(v32 + 24) = 0;
LABEL_47:

      v34 = *(void **)(a1 + 32);
      goto LABEL_48;
    }
  }
  v34 = *(void **)(a1 + 32);
  if (!v34[3] && v34[2] == 3 && v17 >= 1)
  {
    v35 = [MEMORY[0x1E4F28F80] processInfo];
    [v35 systemUptime];
    double v37 = v36;

    v33 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v38 = [v33 dateByAddingTimeInterval:(double)v17 - v37];
    uint64_t v39 = *(void *)(a1 + 32);
    v40 = *(void **)(v39 + 24);
    *(void *)(v39 + 24) = v38;

    goto LABEL_47;
  }
LABEL_48:
  int v41 = objc_msgSend(v34, "installed", v43);
  if (v43 == v41) {
    goto LABEL_51;
  }
LABEL_49:
  objc_msgSend(*(id *)(a1 + 32), "setInstalled:", v43, v43);
  int v42 = [*(id *)(a1 + 32) installNotify];
  if (v28 != int64 || v42)
  {
LABEL_51:
    if (*(unsigned char *)(a1 + 56)) {
      -[NEVPNConnection notifyStatusChanged](*(void *)(a1 + 32));
    }
  }
LABEL_33:
  if (*(void *)(a1 + 40))
  {
    v27 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
LABEL_36:
}

- (void)resetLastDisconnectError:(void *)a1
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (a1)
  {
    uint64_t v5 = a1;
    objc_sync_enter(v5);
    id v7 = v5 + 9;
    id v6 = v5[9];
    if (v6 == v4 || ([v6 isEqual:v4] & 1) != 0)
    {
      objc_sync_exit(v5);

      goto LABEL_29;
    }
    v8 = (__CFString *)v5[5];
    id v9 = [v5 manager];

    if (v9)
    {
      v10 = [v5 manager];
      BOOL v11 = [v10 configuration];
      uint64_t v12 = [v11 name];

      v8 = (__CFString *)v12;
    }
    if (v8)
    {
      v13 = ne_log_obj();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = *v7;
        if (*v7)
        {
          uint64_t v15 = [*v7 localizedDescription];
          if (v4)
          {
LABEL_11:
            v16 = [v4 localizedDescription];
            goto LABEL_18;
          }
        }
        else
        {
          uint64_t v15 = @"none";
          if (v4) {
            goto LABEL_11;
          }
        }
        v16 = @"none";
LABEL_18:
        int v19 = 138412802;
        v20 = v8;
        __int16 v21 = 2112;
        v22 = v15;
        __int16 v23 = 2112;
        v24 = v16;
        _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEFAULT, "Last disconnect error for %@ changed from \"%@\" to \"%@\"", (uint8_t *)&v19, 0x20u);
        if (v4) {

        }
        if (!v14) {
          goto LABEL_28;
        }
        goto LABEL_27;
      }
LABEL_28:

      [v5 willChangeValueForKey:@"lastDisconnectError"];
      objc_storeStrong(v5 + 9, a2);

      objc_sync_exit(v5);
      [v5 didChangeValueForKey:@"lastDisconnectError"];
      goto LABEL_29;
    }
    v13 = ne_log_obj();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    id v17 = *v7;
    if (*v7)
    {
      uint64_t v15 = [*v7 localizedDescription];
      if (v4)
      {
LABEL_15:
        unsigned int v18 = [v4 localizedDescription];
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v15 = @"none";
      if (v4) {
        goto LABEL_15;
      }
    }
    unsigned int v18 = @"none";
LABEL_24:
    int v19 = 138412546;
    v20 = v15;
    __int16 v21 = 2112;
    v22 = v18;
    _os_log_impl(&dword_19DDAF000, v13, OS_LOG_TYPE_DEFAULT, "Last disconnect error changed from \"%@\" to \"%@\"", (uint8_t *)&v19, 0x16u);
    if (v4) {

    }
    if (!v17) {
      goto LABEL_28;
    }
LABEL_27:

    goto LABEL_28;
  }
LABEL_29:
}

- (void)notifyStatusChanged
{
  if (a1)
  {
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 postNotificationName:@"com.apple.networkextension.statuschanged" object:a1];
  }
}

uint64_t __71__NEVPNConnection_updateSessionInfoForce_notify_withCompletionHandler___block_invoke_26(uint64_t *a1, int a2)
{
  id v4 = (void *)a1[4];
  if (v4) {
    uint64_t v5 = v4[7];
  }
  else {
    uint64_t v5 = 0;
  }
  if (v5 == a1[6] && [v4 status] != a2)
  {
    *(void *)(a1[4] + 16) = a2;
    -[NEVPNConnection notifyStatusChanged](a1[4]);
  }
  uint64_t result = a1[5];
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

- (void)fetchLastDisconnectErrorWithCompletionHandler:(void *)handler
{
  id v4 = handler;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E59932E8;
  void v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)self, 1, 1, v6);
}

void __65__NEVPNConnection_fetchLastDisconnectErrorWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 lastDisconnectError];
  id v4 = v3;
  if (v2)
  {
    id v15 = v3;
    id v5 = [v15 domain];
    int v6 = [v5 isEqualToString:@"NEVPNConnectionErrorDomainPlugin"];

    if (v6)
    {
      int v7 = [v15 code];
      uint64_t v8 = 1;
      switch(v7)
      {
        case 2:
          goto LABEL_21;
        case 3:
        case 5:
        case 8:
        case 9:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 18:
        case 19:
        case 21:
        case 24:
        case 27:
        case 28:
        case 29:
          goto LABEL_22;
        case 4:
          uint64_t v8 = 2;
          goto LABEL_21;
        case 6:
          uint64_t v8 = 14;
          goto LABEL_21;
        case 7:
          uint64_t v8 = 12;
          goto LABEL_21;
        case 10:
          uint64_t v8 = 4;
          goto LABEL_21;
        case 17:
          uint64_t v8 = 5;
          goto LABEL_21;
        case 20:
          uint64_t v8 = 6;
          goto LABEL_21;
        case 22:
          uint64_t v8 = 7;
          goto LABEL_21;
        case 23:
          uint64_t v8 = 8;
          goto LABEL_21;
        case 25:
          uint64_t v8 = 9;
          goto LABEL_21;
        case 26:
          uint64_t v8 = 10;
          goto LABEL_21;
        case 30:
          uint64_t v8 = 11;
          goto LABEL_21;
        default:
          if (v7 != 38) {
            goto LABEL_22;
          }
          uint64_t v8 = 13;
          break;
      }
      goto LABEL_21;
    }
    id v9 = [v15 domain];
    int v10 = [v9 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"];

    if (v10)
    {
      unsigned int v11 = [v15 code] - 2;
      if (v11 <= 0x16 && ((0x7DFFBFu >> v11) & 1) != 0)
      {
        uint64_t v8 = qword_19DF9D390[v11];
LABEL_21:
        id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
        v13 = [v15 userInfo];
        uint64_t v14 = [v12 initWithDomain:@"NEVPNConnectionErrorDomain" code:v8 userInfo:v13];

        id v15 = (id)v14;
      }
    }
  }
  else
  {
    id v15 = 0;
  }
LABEL_22:

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NEVPNManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_weakmanager);

  return (NEVPNManager *)WeakRetained;
}

- (void)stopVPNTunnel
{
  id v2 = self;
  objc_sync_enter(v2);
  if (+[NEProvider isRunningInProvider])
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v4 = 0;
      _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "VPN tunnels cannot be stopped from Network Extension providers", v4, 2u);
    }
  }
  else if (v2 && v2->_session)
  {
    ne_session_stop();
  }
  objc_sync_exit(v2);
}

- (BOOL)startVPNTunnelWithOptions:(NSDictionary *)options andReturnError:(NSError *)error
{
  int v6 = options;
  int v7 = self;
  objc_sync_enter(v7);
  if (+[NEProvider isRunningInProvider])
  {
    uint64_t v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "VPN tunnels cannot be started from Network Extension providers", buf, 2u);
    }

    if (error)
    {
      uint64_t v9 = 3;
LABEL_17:
      [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:v9 userInfo:0];
      id v15 = 0;
      BOOL v16 = 0;
      *error = (NSError *)(id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    goto LABEL_27;
  }
  if (error) {
    *error = 0;
  }
  uint64_t v10 = [(NEVPNConnection *)v7 status];
  if (!v7 || !v10 || !v7->_session)
  {
    if (error)
    {
      uint64_t v9 = 1;
      goto LABEL_17;
    }
LABEL_27:
    id v15 = 0;
    BOOL v16 = 0;
    goto LABEL_28;
  }
  if ([(NEVPNConnection *)v7 status] == NEVPNStatusDisconnected)
  {
    unsigned int v11 = [(NEVPNConnection *)v7 manager];
    if (v11)
    {
      id v12 = [(NEVPNConnection *)v7 manager];
      v13 = [v12 configuration];
      uint64_t v14 = [v13 VPN];
      if ([v14 isEnabled])
      {
      }
      else
      {
        id v17 = [(NEVPNConnection *)v7 manager];
        unsigned int v18 = [v17 configuration];
        int v19 = [v18 appVPN];
        char v22 = [v19 isEnabled];

        if ((v22 & 1) == 0)
        {
          if (error)
          {
            uint64_t v9 = 2;
            goto LABEL_17;
          }
          goto LABEL_27;
        }
      }
    }
  }
  if (v6
    || ([(NEVPNConnection *)v7 manager],
        int v6 = (NSDictionary *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6)
    && ([(NEVPNConnection *)v7 manager],
        v20 = objc_claimAutoreleasedReturnValue(),
        int v6 = (NSDictionary *)[v20 copyCurrentUserStartOptions],
        v20,
        v6))
  {
    id v15 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  }
  else
  {
    id v15 = 0;
  }
  ne_session_start_with_options();
  BOOL v16 = 1;
LABEL_28:

  objc_sync_exit(v7);
  return v16;
}

- (BOOL)startVPNTunnelAndReturnError:(NSError *)error
{
  return [(NEVPNConnection *)self startVPNTunnelWithOptions:0 andReturnError:error];
}

- (void)dealloc
{
  if (self && self->_session)
  {
    ne_session_cancel();
    self->_session = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)NEVPNConnection;
  [(NEVPNConnection *)&v3 dealloc];
}

+ (id)createConnectionForEnabledEnterpriseConfigurationWithName:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke;
  block[3] = &unk_1E59932C0;
  id v9 = v3;
  uint64_t v4 = createConnectionForEnabledEnterpriseConfigurationWithName__onceToken;
  id v5 = v3;
  if (v4 != -1) {
    dispatch_once(&createConnectionForEnabledEnterpriseConfigurationWithName__onceToken, block);
  }
  id v6 = (id)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;

  return v6;
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke(uint64_t a1)
{
  id v2 = [NEVPNConnection alloc];
  id v3 = *(void **)(a1 + 32);
  id v4 = v3;
  if (v2)
  {
    id v2 = (NEVPNConnection *)-[NEVPNConnection initWithType:](v2, 1);
    if (v2)
    {
      id v5 = [[NEConfigurationManager alloc] initForAllUsers];
      configManager = v2->_configManager;
      v2->_configManager = v5;

      objc_storeStrong((id *)&v2->_configurationName, v3);
      int v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v8 = dispatch_queue_create("NEVPNConnection queue", v7);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v8;
    }
  }

  uint64_t v10 = (void *)createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;
  createConnectionForEnabledEnterpriseConfigurationWithName__g_headless = (uint64_t)v2;

  if (createConnectionForEnabledEnterpriseConfigurationWithName__g_headless)
  {
    unsigned int v11 = *(void **)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 32);
    uint64_t v12 = *(void *)(createConnectionForEnabledEnterpriseConfigurationWithName__g_headless + 48);
  }
  else
  {
    unsigned int v11 = 0;
    uint64_t v12 = 0;
  }
  id v13 = v11;
  [v13 setChangedQueue:v12 andHandler:&__block_literal_global_25686];

  uint64_t v14 = createConnectionForEnabledEnterpriseConfigurationWithName__g_headless;

  return -[NEVPNConnection reload](v14);
}

- (uint64_t)reload
{
  if (result)
  {
    v1 = (void *)result;
    *(void *)(result + 16) = 0;
    if (*(void *)(result + 56))
    {
      ne_session_cancel();
      v1[7] = 0;
    }
    id v2 = (void *)v1[4];
    uint64_t v3 = v1[6];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __25__NEVPNConnection_reload__block_invoke;
    v4[3] = &unk_1E5993278;
    v4[4] = v1;
    return [v2 loadConfigurationsWithCompletionQueue:v3 handler:v4];
  }
  return result;
}

void __25__NEVPNConnection_reload__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    int v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v6;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "reloadWithCompletionHandler: failed to load configurations: %@", buf, 0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v6);
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8) {
      *(unsigned char *)(v8 + 10) = 1;
    }
  }
  else
  {
    if (v5
      && (v17[0] = MEMORY[0x1E4F143A8],
          v17[1] = 3221225472,
          v17[2] = __25__NEVPNConnection_reload__block_invoke_118,
          v17[3] = &unk_1E5993250,
          v17[4] = *(void *)(a1 + 32),
          uint64_t v9 = [v5 indexOfObjectPassingTest:v17],
          v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      id v10 = [v5 objectAtIndexedSubscript:v9];
      uint64_t v12 = [v10 name];
      uint64_t v13 = *(void *)(a1 + 32);
      if (v13) {
        objc_storeStrong((id *)(v13 + 40), v12);
      }

      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = [v10 identifier];
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __25__NEVPNConnection_reload__block_invoke_2;
      v16[3] = &unk_1E5993618;
      v16[4] = *(void *)(a1 + 32);
      -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v14, v15, 1, v16);
    }
    else
    {
      id v10 = +[NEVPNConnection createDisconnectErrorWithDomain:@"NEVPNConnectionErrorDomainPlugin" code:38];
      -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v10);
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11) {
        *(unsigned char *)(v11 + 10) = 1;
      }
    }
  }
}

uint64_t __25__NEVPNConnection_reload__block_invoke_118(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 grade] == 1)
  {
    int v7 = [v6 VPN];
    if ([v7 isEnabled])
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (!v8 || (id v9 = *(id *)(v8 + 40)) == 0)
      {

LABEL_13:
        uint64_t v15 = 1;
        *a4 = 1;
        goto LABEL_11;
      }
      id v10 = v9;
      uint64_t v11 = *(void **)(a1 + 32);
      if (v11) {
        uint64_t v11 = (void *)v11[5];
      }
      uint64_t v12 = v11;
      uint64_t v13 = [v6 name];
      int v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_13;
      }
    }
    else
    {
    }
  }
  uint64_t v15 = 0;
LABEL_11:

  return v15;
}

void __25__NEVPNConnection_reload__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    *(unsigned char *)(v5 + 10) = 1;
  }
  if (v3)
  {
    id v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      uint64_t v8 = v4;
      _os_log_error_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_ERROR, "Failed to create a connection for the current enterprise configuration: %@", (uint8_t *)&v7, 0xCu);
    }

    -[NEVPNConnection resetLastDisconnectError:](*(void **)(a1 + 32), v4);
  }
}

- (void)createSessionWithConfigurationIdentifier:(uint64_t)a3 forceInfoFetch:(void *)a4 completionHandler:
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  if (a1)
  {
    uint64_t v9 = a1;
    objc_sync_enter(v9);
    v36[0] = 0;
    v36[1] = 0;
    if (v7)
    {
      if (v9[7])
      {
        ne_session_cancel();
        v9[7] = 0;
      }
      [v7 getUUIDBytes:v36];
      uint64_t v10 = ne_session_create();
      if (v10)
      {
        id v11 = MEMORY[0x1E4F14428];
        uint64_t v20 = MEMORY[0x1E4F143A8];
        uint64_t v21 = 3221225472;
        char v22 = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2;
        __int16 v23 = &unk_1E5993200;
        v24 = v9;
        uint64_t v25 = v10;
        ne_session_set_event_handler();

        v9[7] = v10;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3;
        v18[3] = &unk_1E5993228;
        id v19 = v8;
        -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:]((uint64_t)v9, a3, 1, v18);
      }
      else
      {
        uint64_t v15 = ne_log_obj();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315394;
          v33 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
          __int16 v34 = 2112;
          id v35 = v7;
          _os_log_error_impl(&dword_19DDAF000, v15, OS_LOG_TYPE_ERROR, "%s: Cannot create ne_session for configID: %@", buf, 0x16u);
        }

        if (v8)
        {
          BOOL v16 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_30;
          v26[3] = &unk_1E59936F8;
          id v27 = v16;
          id v28 = v8;
          id v17 = v16;
          dispatch_async(MEMORY[0x1E4F14428], v26);
        }
      }
    }
    else
    {
      uint64_t v12 = ne_log_obj();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315138;
        v33 = "-[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:]";
        _os_log_error_impl(&dword_19DDAF000, v12, OS_LOG_TYPE_ERROR, "%s: Cannot create ne_session for nil configID", buf, 0xCu);
      }

      if (v8)
      {
        uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEVPNErrorDomain" code:1 userInfo:0];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke;
        block[3] = &unk_1E59936F8;
        id v30 = v13;
        id v31 = v8;
        id v14 = v13;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
    }
    objc_sync_exit(v9);
  }
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_30(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_2(uint64_t a1, int a2)
{
  if (a2 == 2)
  {
    ne_session_release();
  }
  else if (a2 == 1)
  {
    id obj = *(id *)(a1 + 32);
    objc_sync_enter(obj);
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      uint64_t v4 = *(void *)(v3 + 56);
    }
    else {
      uint64_t v4 = 0;
    }
    if (v4 == *(void *)(a1 + 40)) {
      -[NEVPNConnection updateSessionInfoForce:notify:withCompletionHandler:](v3, 0, 1, 0);
    }
    objc_sync_exit(obj);
  }
}

uint64_t __93__NEVPNConnection_createSessionWithConfigurationIdentifier_forceInfoFetch_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__NEVPNConnection_createConnectionForEnabledEnterpriseConfigurationWithName___block_invoke_2()
{
  return -[NEVPNConnection reload](createConnectionForEnabledEnterpriseConfigurationWithName__g_headless);
}

- (id)initWithType:(void *)a1
{
  if (!a1) {
    return 0;
  }
  v7.receiver = a1;
  v7.super_class = (Class)NEVPNConnection;
  uint64_t v3 = (id *)objc_msgSendSuper2(&v7, sel_init);
  uint64_t v4 = v3;
  if (v3)
  {
    v3[2] = 0;
    v3[7] = 0;
    *((_DWORD *)v3 + 3) = a2;
    objc_storeWeak(v3 + 8, 0);
    id v5 = v4[9];
    v4[9] = 0;
  }
  return v4;
}

+ (id)createConnectionForEnabledEnterpriseConfiguration
{
  return +[NEVPNConnection createConnectionForEnabledEnterpriseConfigurationWithName:0];
}

+ (id)createDisconnectErrorWithDomain:(id)a3 code:(unsigned int)a4
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 isEqualToString:@"NEVPNConnectionErrorDomainPlugin"])
  {
    id v6 = 0;
    objc_super v7 = 0;
    switch(a4)
    {
      case 2u:
        id v8 = @"VPN_DISCONNECT_ERROR_OVERSLEPT";
        goto LABEL_32;
      case 3u:
      case 8u:
      case 9u:
      case 0xBu:
      case 0xDu:
      case 0x13u:
      case 0x1Fu:
      case 0x20u:
      case 0x21u:
      case 0x22u:
      case 0x23u:
      case 0x24u:
      case 0x25u:
        break;
      case 4u:
        goto LABEL_6;
      case 5u:
        goto LABEL_16;
      case 6u:
        id v8 = @"VPN_DISCONNECT_ERROR_PLUGIN_NOT_AVAILABLE";
        goto LABEL_32;
      case 7u:
        goto LABEL_13;
      case 0xAu:
        goto LABEL_12;
      case 0xCu:
        id v8 = @"VPN_DISCONNECT_ERROR_CONNECT_TIMEOUT";
        goto LABEL_32;
      case 0xEu:
        id v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_APP_REQUIRED";
        goto LABEL_32;
      case 0xFu:
        goto LABEL_9;
      case 0x10u:
        id v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_INVALID";
        goto LABEL_32;
      case 0x11u:
        goto LABEL_11;
      case 0x12u:
        goto LABEL_14;
      case 0x14u:
        id v8 = @"VPN_DISCONNECT_ERROR_SERVER_NOT_RESPONDING";
        goto LABEL_32;
      case 0x15u:
        goto LABEL_17;
      case 0x16u:
        goto LABEL_18;
      case 0x17u:
        goto LABEL_7;
      case 0x18u:
        goto LABEL_10;
      case 0x19u:
        goto LABEL_15;
      case 0x1Au:
        goto LABEL_19;
      case 0x1Bu:
        goto LABEL_20;
      case 0x1Cu:
        goto LABEL_8;
      case 0x1Du:
        goto LABEL_21;
      case 0x1Eu:
        goto LABEL_22;
      case 0x26u:
        id v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_NOT_FOUND";
        goto LABEL_32;
      default:
        goto LABEL_29;
    }
  }
  else
  {
    id v6 = 0;
    if ([v5 isEqualToString:@"NEVPNConnectionErrorDomainIPSec"])
    {
      objc_super v7 = 0;
      switch(a4)
      {
        case 2u:
LABEL_9:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_MISSING";
          goto LABEL_32;
        case 3u:
          id v8 = @"VPN_DISCONNECT_ERROR_SHARED_SECRET_MISSING";
          goto LABEL_32;
        case 4u:
LABEL_10:
          id v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_MISSING";
          goto LABEL_32;
        case 5u:
LABEL_11:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_ADDRESS_RESOLUTION_FAILED";
          goto LABEL_32;
        case 6u:
        case 0x12u:
LABEL_6:
          id v8 = @"VPN_DISCONNECT_ERROR_NO_NETWORK_AVAILABLE";
          goto LABEL_32;
        case 7u:
LABEL_12:
          id v8 = @"VPN_DISCONNECT_ERROR_CONFIGURATION_FAILED";
          goto LABEL_32;
        case 8u:
LABEL_13:
          id v8 = @"VPN_DISCONNECT_ERROR_INTERNAL_ERROR";
          goto LABEL_32;
        case 9u:
          id v8 = @"VPN_DISCONNECT_ERROR_CONNECTION_ERROR";
          goto LABEL_32;
        case 0xAu:
LABEL_14:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_NEGOTIATION_FAILED";
          goto LABEL_32;
        case 0xBu:
        case 0xEu:
LABEL_7:
          id v8 = @"VPN_DISCONNECT_ERROR_AUTHENTICATION_FAILED";
          goto LABEL_32;
        case 0xCu:
        case 0x18u:
LABEL_8:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_INVALID";
          goto LABEL_32;
        case 0xDu:
LABEL_15:
          id v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_INVALID";
          goto LABEL_32;
        case 0xFu:
LABEL_16:
          id v8 = @"VPN_DISCONNECT_ERROR_NETWORK_CHANGE";
          goto LABEL_32;
        case 0x10u:
LABEL_17:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_DISCONNECTED";
          goto LABEL_32;
        case 0x11u:
LABEL_18:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_DEAD";
          goto LABEL_32;
        case 0x13u:
          break;
        case 0x14u:
LABEL_19:
          id v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_NOT_YET_VALID";
          goto LABEL_32;
        case 0x15u:
LABEL_20:
          id v8 = @"VPN_DISCONNECT_ERROR_CLIENT_CERTIFICATE_EXPIRED";
          goto LABEL_32;
        case 0x16u:
LABEL_21:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_NOT_YET_VALID";
          goto LABEL_32;
        case 0x17u:
LABEL_22:
          id v8 = @"VPN_DISCONNECT_ERROR_SERVER_CERTIFICATE_EXPIRED";
LABEL_32:
          id v6 = NEResourcesCopyLocalizedNSString(v8, v8);
          if (!v6) {
            goto LABEL_34;
          }
          id v9 = objc_alloc(MEMORY[0x1E4F28C58]);
          uint64_t v12 = *MEMORY[0x1E4F28568];
          v13[0] = v6;
          uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
          objc_super v7 = (void *)[v9 initWithDomain:v5 code:a4 userInfo:v10];

          break;
        default:
LABEL_29:
          objc_super v7 = 0;
          break;
      }
    }
    else
    {
LABEL_34:
      objc_super v7 = 0;
    }
  }

  return v7;
}

- (void)destroySession
{
  if (a1)
  {
    id obj = a1;
    objc_sync_enter(obj);
    v1 = obj;
    if (obj[7])
    {
      ne_session_cancel();
      v1 = obj;
      obj[7] = 0;
    }
    id v2 = v1;
    if (v1[2])
    {
      v1[2] = 0;
      uint64_t v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v3 postNotificationName:@"com.apple.networkextension.statuschanged" object:obj];

      id v2 = obj;
    }
    objc_sync_exit(v2);
  }
}

@end