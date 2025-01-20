@interface HMDAccessorySetupCoordinatorStagingRequest
- (HMDAccessorySetupCoordinatorStagingRequest)init;
- (HMFMessage)pendingCancelMessage;
- (HMFMessage)pendingRequestMessage;
- (NSError)error;
- (NSMutableArray)pendingResponsePayloads;
- (NSUUID)UUID;
- (id)cancelHandler;
- (id)confirmDeviceCredentialCompletionHandler;
- (id)selectThreadNetworkHandler;
- (id)selectWiFiNetworkHandler;
- (void)setCancelHandler:(id)a3;
- (void)setConfirmDeviceCredentialCompletionHandler:(id)a3;
- (void)setError:(id)a3;
- (void)setPendingCancelMessage:(id)a3;
- (void)setPendingRequestMessage:(id)a3;
- (void)setPendingResponsePayloads:(id)a3;
- (void)setSelectThreadNetworkHandler:(id)a3;
- (void)setSelectWiFiNetworkHandler:(id)a3;
@end

@implementation HMDAccessorySetupCoordinatorStagingRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_pendingResponsePayloads, 0);
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_selectThreadNetworkHandler, 0);
  objc_storeStrong(&self->_selectWiFiNetworkHandler, 0);
  objc_storeStrong(&self->_confirmDeviceCredentialCompletionHandler, 0);
  objc_storeStrong((id *)&self->_pendingRequestMessage, 0);
  objc_storeStrong((id *)&self->_pendingCancelMessage, 0);
  objc_storeStrong((id *)&self->_UUID, 0);
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setPendingResponsePayloads:(id)a3
{
}

- (NSMutableArray)pendingResponsePayloads
{
  return self->_pendingResponsePayloads;
}

- (void)setCancelHandler:(id)a3
{
}

- (id)cancelHandler
{
  return self->_cancelHandler;
}

- (void)setSelectThreadNetworkHandler:(id)a3
{
}

- (id)selectThreadNetworkHandler
{
  return self->_selectThreadNetworkHandler;
}

- (void)setSelectWiFiNetworkHandler:(id)a3
{
}

- (id)selectWiFiNetworkHandler
{
  return self->_selectWiFiNetworkHandler;
}

- (void)setConfirmDeviceCredentialCompletionHandler:(id)a3
{
}

- (id)confirmDeviceCredentialCompletionHandler
{
  return self->_confirmDeviceCredentialCompletionHandler;
}

- (void)setPendingRequestMessage:(id)a3
{
}

- (HMFMessage)pendingRequestMessage
{
  return self->_pendingRequestMessage;
}

- (void)setPendingCancelMessage:(id)a3
{
}

- (HMFMessage)pendingCancelMessage
{
  return self->_pendingCancelMessage;
}

- (NSUUID)UUID
{
  return (NSUUID *)objc_getProperty(self, a2, 8, 1);
}

- (HMDAccessorySetupCoordinatorStagingRequest)init
{
  v6.receiver = self;
  v6.super_class = (Class)HMDAccessorySetupCoordinatorStagingRequest;
  v2 = [(HMDAccessorySetupCoordinatorStagingRequest *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F08C38] UUID];
    UUID = v2->_UUID;
    v2->_UUID = (NSUUID *)v3;
  }
  return v2;
}

@end