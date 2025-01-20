@interface IDSRegistrationControlDaemonResponseListener
- (IDSRegistrationControlDaemonResponseListener)initWithRequestTimer:(id)a3;
- (void)registrationControlResponseForRequestID:(id)a3 withError:(id)a4;
- (void)registrationControlStatusResponseForRequestID:(int64_t)a3 requestID:(id)a4 withError:(id)a5;
@end

@implementation IDSRegistrationControlDaemonResponseListener

- (IDSRegistrationControlDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5 = a3;
  if (_IDSRunningInDaemon())
  {
    v6 = +[IDSLogging general];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v6);
    }

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSRegistrationControlDaemonResponseListener;
    v8 = [(IDSRegistrationControlDaemonResponseListener *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    }
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)registrationControlResponseForRequestID:(id)a3 withError:(id)a4
{
  id v6 = a4;
  v7 = [(IDSDaemonRequestTimer *)self->_requestTimer invalidateTimeoutAndReturnHandlerForRequestID:a3];
  v8 = [v7 block];
  uint64_t v9 = [v7 queue];
  v10 = v9;
  if (v8) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (!v11)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1919644D4;
    v12[3] = &unk_1E5729230;
    id v13 = v6;
    id v14 = v8;
    dispatch_async(v10, v12);
  }
}

- (void)registrationControlStatusResponseForRequestID:(int64_t)a3 requestID:(id)a4 withError:(id)a5
{
  id v8 = a5;
  uint64_t v9 = [(IDSDaemonRequestTimer *)self->_requestTimer invalidateTimeoutAndReturnHandlerForRequestID:a4];
  v10 = [v9 block];
  BOOL v11 = [v9 queue];
  int v12 = [v9 isSync];
  if (v10)
  {
    int v13 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_191964628;
    v16[3] = &unk_1E572A1E0;
    id v17 = v8;
    id v18 = v10;
    int64_t v19 = a3;
    id v14 = (void (**)(void))MEMORY[0x192FE03B0](v16);
    v15 = v14;
    if (v13)
    {
      v14[2](v14);
    }
    else if (v11)
    {
      dispatch_async(v11, v14);
    }
  }
}

- (void).cxx_destruct
{
}

@end