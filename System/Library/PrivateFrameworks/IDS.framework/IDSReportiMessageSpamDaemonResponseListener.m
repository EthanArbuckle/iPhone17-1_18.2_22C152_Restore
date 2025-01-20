@interface IDSReportiMessageSpamDaemonResponseListener
- (IDSReportiMessageSpamDaemonResponseListener)initWithRequestTimer:(id)a3;
- (void)iMessageReportSpamCheckUnknownResponseForRequestID:(id)a3 status:(int64_t)a4 abusive:(BOOL)a5 delay:(double)a6 withError:(id)a7;
@end

@implementation IDSReportiMessageSpamDaemonResponseListener

- (IDSReportiMessageSpamDaemonResponseListener)initWithRequestTimer:(id)a3
{
  id v5 = a3;
  if (_IDSRunningInDaemon())
  {
    v6 = +[IDSTransportLog IDSReportSpam];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_191A2A590((uint64_t)self, v6);
    }

    v7 = 0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)IDSReportiMessageSpamDaemonResponseListener;
    v8 = [(IDSReportiMessageSpamDaemonResponseListener *)&v11 init];
    v9 = v8;
    if (v8) {
      objc_storeStrong((id *)&v8->_requestTimer, a3);
    }
    self = v9;
    v7 = self;
  }

  return v7;
}

- (void)iMessageReportSpamCheckUnknownResponseForRequestID:(id)a3 status:(int64_t)a4 abusive:(BOOL)a5 delay:(double)a6 withError:(id)a7
{
  id v11 = a7;
  v12 = [(IDSDaemonRequestTimer *)self->_requestTimer invalidateTimeoutAndReturnHandlerForRequestID:a3];
  v13 = [v12 block];
  uint64_t v14 = [v12 queue];
  v15 = v14;
  if (v13) {
    BOOL v16 = v14 == 0;
  }
  else {
    BOOL v16 = 1;
  }
  if (!v16)
  {
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = sub_19199F21C;
    v17[3] = &unk_1E572BAA8;
    id v18 = v11;
    id v19 = v13;
    BOOL v21 = a5;
    double v20 = a6;
    dispatch_async(v15, v17);
  }
}

- (void).cxx_destruct
{
}

@end