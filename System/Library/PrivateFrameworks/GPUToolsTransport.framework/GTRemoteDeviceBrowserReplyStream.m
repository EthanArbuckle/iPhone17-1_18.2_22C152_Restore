@interface GTRemoteDeviceBrowserReplyStream
- (GTRemoteDeviceBrowserReplyStream)initWithObserver:(id)a3;
- (void)notifyDeviceListChanged_:(id)a3 replyConnection:(id)a4;
@end

@implementation GTRemoteDeviceBrowserReplyStream

- (GTRemoteDeviceBrowserReplyStream)initWithObserver:(id)a3
{
  id v5 = a3;
  v6 = +[GTServiceProperties protocolMethods:&unk_26EFC2928];
  v9.receiver = self;
  v9.super_class = (Class)GTRemoteDeviceBrowserReplyStream;
  v7 = [(GTXPCDispatcher *)&v9 initWithProtocolMethods:v6];

  if (v7) {
    objc_storeStrong((id *)&v7->_observer, a3);
  }

  return v7;
}

- (void)notifyDeviceListChanged_:(id)a3 replyConnection:(id)a4
{
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  id nsarray = (id)xpc_dictionary_get_nsarray(v5, "deviceList", v6);

  [(GTRemoteDeviceBrowserObserver *)self->_observer notifyDeviceListChanged:nsarray];
}

- (void).cxx_destruct
{
}

@end