@interface ASDEventServiceExtensionRemoteContext
- (ASDEventServiceExtension)extensionInstance;
- (void)didReceiveInstallationEvent:(id)a3;
- (void)setExtensionInstance:(id)a3;
@end

@implementation ASDEventServiceExtensionRemoteContext

- (void)didReceiveInstallationEvent:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = ASDLogHandleForCategory(16);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [v4 bundleID];
    int v11 = 138543874;
    v12 = v6;
    __int16 v13 = 2048;
    uint64_t v14 = [v4 phase];
    __int16 v15 = 2048;
    uint64_t v16 = [v4 terminalPhase];
    _os_log_impl(&dword_19BF6A000, v5, OS_LOG_TYPE_DEFAULT, "didReceiveInstallationEvent: %{public}@ %ld/%ld", (uint8_t *)&v11, 0x20u);
  }
  int64_t v7 = [(ASDEventServiceExtension *)self->_extensionInstance didReceiveInstallationEvent:v4];
  uint64_t v8 = [v4 phase];
  if (v8 == [v4 terminalPhase])
  {
    [(ASDEventServiceExtensionRemoteContext *)self completeRequestReturningItems:0 completionHandler:0];
  }
  else if (!v7)
  {
    v9 = ASDLogHandleForCategory(13);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_19BF6A000, v9, OS_LOG_TYPE_INFO, "Canceling request", (uint8_t *)&v11, 2u);
    }

    v10 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"ASDErrorDomain" code:908 userInfo:0];
    [(ASDEventServiceExtensionRemoteContext *)self cancelRequestWithError:v10];
  }
}

- (ASDEventServiceExtension)extensionInstance
{
  return self->_extensionInstance;
}

- (void)setExtensionInstance:(id)a3
{
}

- (void).cxx_destruct
{
}

@end