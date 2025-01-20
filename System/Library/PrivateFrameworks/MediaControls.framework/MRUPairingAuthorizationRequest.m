@interface MRUPairingAuthorizationRequest
- (AVOutputDevice)outputDevice;
- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3;
- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3 inputType:(int64_t)a4;
- (int64_t)inputType;
- (void)cancel;
- (void)completeWithPasscode:(id)a3;
@end

@implementation MRUPairingAuthorizationRequest

- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3 inputType:(int64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUPairingAuthorizationRequest;
  v8 = [(MRUPairingAuthorizationRequest *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_outputDevice, a3);
    v9->_inputType = a4;
  }

  return v9;
}

- (MRUPairingAuthorizationRequest)initWithOutputDevice:(id)a3
{
  return [(MRUPairingAuthorizationRequest *)self initWithOutputDevice:a3 inputType:0];
}

- (void)completeWithPasscode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _MPAVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    outputDevice = self->_outputDevice;
    int v9 = 138543618;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    v12 = outputDevice;
    _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ complete authorization request for device: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = [(AVOutputDevice *)self->_outputDevice deviceID];
  MRMediaRemoteCompletePairingHandler();
}

- (void)cancel
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _MPAVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = objc_opt_class();
    outputDevice = self->_outputDevice;
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = outputDevice;
    _os_log_impl(&dword_1AE7DF000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ cancel authorization request for device: %{public}@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v6 = [(AVOutputDevice *)self->_outputDevice deviceID];
  MRMediaRemoteCompletePairingHandler();
}

- (AVOutputDevice)outputDevice
{
  return self->_outputDevice;
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void).cxx_destruct
{
}

@end