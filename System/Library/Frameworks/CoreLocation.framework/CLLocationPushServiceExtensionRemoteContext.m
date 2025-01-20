@interface CLLocationPushServiceExtensionRemoteContext
- (CLLocationPushServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5;
- (void)didReceiveLocationPushPayload:(id)a3 reply:(id)a4;
- (void)serviceExtensionPerformCleanup;
- (void)serviceExtensionWillTerminate;
@end

@implementation CLLocationPushServiceExtensionRemoteContext

- (CLLocationPushServiceExtensionRemoteContext)initWithInputItems:(id)a3 listenerEndpoint:(id)a4 contextUUID:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)CLLocationPushServiceExtensionRemoteContext;
  v5 = [(CLLocationPushServiceExtensionRemoteContext *)&v11 initWithInputItems:a3 listenerEndpoint:a4 contextUUID:a5];
  if (v5)
  {
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
    }
    v6 = qword_1EB2713D0;
    if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [(CLLocationPushServiceExtensionRemoteContext *)v5 _UUID];
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v7;
      _os_log_impl(&dword_1906B8000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location Push Service extension context initialized", buf, 0xCu);
    }
    if (sub_1906CB57C(115, 2))
    {
      bzero(buf, 0x65CuLL);
      if (qword_1EB2713D8 != -1) {
        dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
      }
      uint64_t v9 = [(CLLocationPushServiceExtensionRemoteContext *)v5 _UUID];
      int v12 = 138543362;
      uint64_t v13 = v9;
      v10 = (char *)_os_log_send_and_compose_impl();
      sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext initWithInputItems:listenerEndpoint:contextUUID:]", "CoreLocation: %s\n", v10);
      if (v10 != (char *)buf) {
        free(v10);
      }
    }
  }
  return v5;
}

- (void)didReceiveLocationPushPayload:(id)a3 reply:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [(CLLocationPushServiceExtensionRemoteContext *)self _principalObject];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
  }
  v8 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    _os_log_impl(&dword_1906B8000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] didReceiveLocationPushPayload:reply:", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
    }
    int v11 = 138543362;
    uint64_t v12 = [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    uint64_t v9 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext didReceiveLocationPushPayload:reply:]", "CoreLocation: %s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_190805298;
  block[3] = &unk_1E5696F10;
  block[4] = v7;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)serviceExtensionWillTerminate
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(CLLocationPushServiceExtensionRemoteContext *)self _principalObject];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
  }
  v4 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v10 = [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    _os_log_impl(&dword_1906B8000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}@] Location Push Service extension time will expire", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
    }
    int v7 = 138543362;
    uint64_t v8 = [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    v5 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext serviceExtensionWillTerminate]", "CoreLocation: %s\n", v5);
    if (v5 != (char *)buf) {
      free(v5);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1908054C8;
  block[3] = &unk_1E5696BF0;
  block[4] = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)serviceExtensionPerformCleanup
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (qword_1EB2713D8 != -1) {
    dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
  }
  uint64_t v3 = qword_1EB2713D0;
  if (os_log_type_enabled((os_log_t)qword_1EB2713D0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v6 = [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    _os_log_impl(&dword_1906B8000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Cleaning up extension", buf, 0xCu);
  }
  if (sub_1906CB57C(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EB2713D8 != -1) {
      dispatch_once(&qword_1EB2713D8, &unk_1EE005DC0);
    }
    [(CLLocationPushServiceExtensionRemoteContext *)self _UUID];
    v4 = (char *)_os_log_send_and_compose_impl();
    sub_1906D4A28("Generic", 1, 0, 2, "-[CLLocationPushServiceExtensionRemoteContext serviceExtensionPerformCleanup]", "CoreLocation: %s\n", v4);
    if (v4 != (char *)buf) {
      free(v4);
    }
  }
  [(CLLocationPushServiceExtensionRemoteContext *)self completeRequestReturningItems:0 completionHandler:0];
}

@end