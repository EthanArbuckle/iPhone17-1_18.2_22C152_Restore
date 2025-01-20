@interface IDSVMDaemonResponseListener
- (IDSVMDaemonResponseListener)initWithRequestTimer:(id)a3;
- (void)vmDataResponse:(id)a3 forRequestID:(id)a4 withError:(id)a5;
@end

@implementation IDSVMDaemonResponseListener

- (IDSVMDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5 = a3;
  if (_IDSRunningInDaemon())
  {
    v6 = [MEMORY[0x1E4F6C3B8] vm];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v6);
    }

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSVMDaemonResponseListener;
    v8 = [(IDSVMDaemonResponseListener *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    }
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)vmDataResponse:(id)a3 forRequestID:(id)a4 withError:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_super v11 = [(IDSDaemonRequestTimer *)self->_requestTimer invalidateTimeoutAndReturnHandlerForRequestID:v9];
  v12 = [v11 block];
  v13 = [MEMORY[0x1E4F6C3B8] vm];
  v14 = v13;
  if (v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412802;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v10;
      _os_log_impl(&dword_19190B000, v14, OS_LOG_TYPE_DEFAULT, "Calling out to completion block for vm request %@ data %@ error %@", (uint8_t *)&v15, 0x20u);
    }

    ((void (**)(void, id, id))v12)[2](v12, v8, v10);
  }
  else
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_191A2E300((uint64_t)v9, v14);
    }
  }
}

- (void).cxx_destruct
{
}

@end