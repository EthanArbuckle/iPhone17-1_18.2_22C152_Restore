@interface ADDeviceSyncMessageSender
- (ADDeviceSyncMessageSender)initWithDeviceIdentifier:(id)a3 messagingService:(id)a4;
- (NSString)deviceIdentifier;
- (void)sendMessage:(id)a3 completion:(id)a4;
@end

@implementation ADDeviceSyncMessageSender

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_destroyWeak((id *)&self->_messagingService);
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)sendMessage:(id)a3 completion:(id)a4
{
  id v10 = a3;
  v6 = (void (**)(id, void, void *))a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messagingService);
  v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained sendMessage:v10 toDeviceWithIdentifier:self->_deviceIdentifier completion:v6];
  }
  else if (v6)
  {
    v9 = +[AFError errorWithCode:2403 description:@"Messaging service is nil." underlyingError:0];
    v6[2](v6, 0, v9);
  }
}

- (ADDeviceSyncMessageSender)initWithDeviceIdentifier:(id)a3 messagingService:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ADDeviceSyncMessageSender;
  v8 = [(ADDeviceSyncMessageSender *)&v12 init];
  if (v8)
  {
    v9 = (NSString *)[v6 copy];
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = v9;

    objc_storeWeak((id *)&v8->_messagingService, v7);
  }

  return v8;
}

@end