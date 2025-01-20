@interface HMDDataStreamBulkSendPendingSessionContext
- (BOOL)shouldCloseSessionWithTimeoutReason;
- (HMDDataStreamBulkSendPendingSessionContext)initWithSessionStartCallback:(id)a3 handleOpenRequestResponseTimer:(id)a4 sendCloseEventTimer:(id)a5;
- (HMFTimer)handleOpenRequestResponseTimer;
- (HMFTimer)sendCloseEventTimer;
- (id)sessionStartCallback;
- (void)setHandleOpenRequestResponseTimer:(id)a3;
- (void)setSendCloseEventTimer:(id)a3;
@end

@implementation HMDDataStreamBulkSendPendingSessionContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendCloseEventTimer, 0);
  objc_storeStrong((id *)&self->_handleOpenRequestResponseTimer, 0);
  objc_storeStrong(&self->_sessionStartCallback, 0);
}

- (void)setSendCloseEventTimer:(id)a3
{
}

- (HMFTimer)sendCloseEventTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setHandleOpenRequestResponseTimer:(id)a3
{
}

- (HMFTimer)handleOpenRequestResponseTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 16, 1);
}

- (id)sessionStartCallback
{
  return objc_getProperty(self, a2, 8, 1);
}

- (BOOL)shouldCloseSessionWithTimeoutReason
{
  v3 = [(HMDDataStreamBulkSendPendingSessionContext *)self handleOpenRequestResponseTimer];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(HMDDataStreamBulkSendPendingSessionContext *)self sendCloseEventTimer];
    BOOL v4 = v5 != 0;
  }
  return v4;
}

- (HMDDataStreamBulkSendPendingSessionContext)initWithSessionStartCallback:(id)a3 handleOpenRequestResponseTimer:(id)a4 sendCloseEventTimer:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HMDDataStreamBulkSendPendingSessionContext;
  v11 = [(HMDDataStreamBulkSendPendingSessionContext *)&v15 init];
  if (v11)
  {
    v12 = _Block_copy(v8);
    id sessionStartCallback = v11->_sessionStartCallback;
    v11->_id sessionStartCallback = v12;

    objc_storeStrong((id *)&v11->_handleOpenRequestResponseTimer, a4);
    objc_storeStrong((id *)&v11->_sendCloseEventTimer, a5);
  }

  return v11;
}

@end