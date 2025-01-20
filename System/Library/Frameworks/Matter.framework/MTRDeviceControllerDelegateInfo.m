@interface MTRDeviceControllerDelegateInfo
- (MTRDeviceControllerDelegate)delegate;
- (MTRDeviceControllerDelegateInfo)initWithDelegate:(id)a3 queue:(id)a4;
- (OS_dispatch_queue)queue;
@end

@implementation MTRDeviceControllerDelegateInfo

- (MTRDeviceControllerDelegateInfo)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MTRDeviceControllerDelegateInfo;
  v8 = [(MTRDeviceControllerDelegateInfo *)&v12 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_queue, a4);
    v10 = v9;
  }

  return v9;
}

- (MTRDeviceControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTRDeviceControllerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end