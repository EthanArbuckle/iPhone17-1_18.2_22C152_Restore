@interface _BMXPCTransportContext
- (NSDictionary)remoteUserInfo;
- (NSMutableDictionary)exportedUserInfo;
- (OS_dispatch_queue)queue;
- (id)errorHandler;
- (id)messageHandler;
- (void)setErrorHandler:(id)a3;
- (void)setExportedUserInfo:(id)a3;
- (void)setMessageHandler:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteUserInfo:(id)a3;
@end

@implementation _BMXPCTransportContext

- (NSDictionary)remoteUserInfo
{
  return (NSDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setRemoteUserInfo:(id)a3
{
}

- (id)messageHandler
{
  return objc_getProperty(self, a2, 16, 1);
}

- (void)setQueue:(id)a3
{
}

- (id)errorHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setExportedUserInfo:(id)a3
{
}

- (void)setMessageHandler:(id)a3
{
}

- (void)setErrorHandler:(id)a3
{
}

- (NSMutableDictionary)exportedUserInfo
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUserInfo, 0);
  objc_storeStrong((id *)&self->_exportedUserInfo, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_messageHandler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end