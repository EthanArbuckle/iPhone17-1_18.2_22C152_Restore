@interface HMDRemoteDeviceConfirmationHandler
- (HMDRemoteDeviceConfirmationHandler)initWithTimeoutTimer:(id)a3 workQueue:(id)a4 handler:(id)a5;
- (HMFTimer)timeoutTimer;
- (OS_dispatch_queue)workQueue;
- (id)handler;
- (void)finishWithError:(void *)a1;
- (void)setHandler:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMDRemoteDeviceConfirmationHandler

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setHandler:(id)a3
{
}

- (id)handler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (HMFTimer)timeoutTimer
{
  return (HMFTimer *)objc_getProperty(self, a2, 8, 1);
}

- (void)timerDidFire:(id)a3
{
  v4 = [(HMDRemoteDeviceConfirmationHandler *)self workQueue];
  dispatch_assert_queue_V2(v4);

  id v5 = [MEMORY[0x263F087E8] hmfErrorWithCode:13];
  -[HMDRemoteDeviceConfirmationHandler finishWithError:](self, v5);
}

- (void)finishWithError:(void *)a1
{
  id v6 = a2;
  if (a1)
  {
    v3 = [a1 workQueue];
    dispatch_assert_queue_V2(v3);

    v4 = [a1 handler];

    if (v4)
    {
      id v5 = [a1 handler];
      [a1 setHandler:0];
      ((void (**)(void, id))v5)[2](v5, v6);
    }
  }
}

- (HMDRemoteDeviceConfirmationHandler)initWithTimeoutTimer:(id)a3 workQueue:(id)a4 handler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    _HMFPreconditionFailure();
    goto LABEL_8;
  }
  if (!v10)
  {
LABEL_8:
    _HMFPreconditionFailure();
    goto LABEL_9;
  }
  v12 = v11;
  if (!v11)
  {
LABEL_9:
    v18 = (HMDRemoteDeviceInformation *)_HMFPreconditionFailure();
    [(HMDRemoteDeviceInformation *)v18 .cxx_destruct];
    return result;
  }
  v20.receiver = self;
  v20.super_class = (Class)HMDRemoteDeviceConfirmationHandler;
  v13 = [(HMDRemoteDeviceConfirmationHandler *)&v20 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_timeoutTimer, a3);
    objc_storeStrong((id *)&v14->_workQueue, a4);
    v15 = _Block_copy(v12);
    id handler = v14->_handler;
    v14->_id handler = v15;
  }
  return v14;
}

@end