@interface AFPowerContextClient
- (AFPowerContextClient)init;
- (BOOL)_isNotificationTokenRegistered;
- (BOOL)updateCurrentPowerPolicy:(id)a3 withError:(id *)a4;
- (id)currentPowerPolicyWithError:(id *)a3;
- (unint64_t)currentEncodedPowerPolicyWithError:(id *)a3;
- (void)_registerForDarwinNotificationIfNeeded;
@end

@implementation AFPowerContextClient

- (id)currentPowerPolicyWithError:(id *)a3
{
  v3 = [[AFPowerContextPolicy alloc] initWithEncodedPolicy:[(AFPowerContextClient *)self currentEncodedPowerPolicyWithError:a3]];
  return v3;
}

- (unint64_t)currentEncodedPowerPolicyWithError:(id *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  [(AFPowerContextClient *)self _registerForDarwinNotificationIfNeeded];
  if (![(AFPowerContextClient *)self _isNotificationTokenRegistered])
  {
    v10 = AFSiriLogContextPower;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
      _os_log_error_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error retrieving current power policy - unregistered token", buf, 0xCu);
      if (a3) {
        goto LABEL_8;
      }
    }
    else if (a3)
    {
LABEL_8:
      id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v9 = 7100;
      goto LABEL_9;
    }
    return 0;
  }
  uint64_t state64 = 0;
  uint32_t state = notify_get_state(self->_notificationToken, &state64);
  v6 = AFSiriLogContextPower;
  if (state)
  {
    uint32_t v7 = state;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
      __int16 v16 = 1024;
      LODWORD(v17) = v7;
      _os_log_error_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error retrieving current power policy - failed to get state with status code: %u", buf, 0x12u);
      if (a3) {
        goto LABEL_5;
      }
    }
    else if (a3)
    {
LABEL_5:
      id v8 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v9 = 7101;
LABEL_9:
      id v11 = (id)[v8 initWithDomain:@"kAFAssistantErrorDomain" code:v9 userInfo:0];
      unint64_t result = 0;
      *a3 = v11;
      return result;
    }
    return 0;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v15 = "-[AFPowerContextClient currentEncodedPowerPolicyWithError:]";
    __int16 v16 = 2048;
    uint64_t v17 = state64;
    __int16 v18 = 2048;
    uint64_t v19 = state64;
    _os_log_debug_impl(&dword_19CF1D000, v6, OS_LOG_TYPE_DEBUG, "%s PowerContextClient: Retrieved current power policy: %llu -> 0x%llx", buf, 0x20u);
  }
  return state64;
}

- (BOOL)_isNotificationTokenRegistered
{
  return self->_registrationStatus == 0;
}

- (void)_registerForDarwinNotificationIfNeeded
{
  if (![(AFPowerContextClient *)self _isNotificationTokenRegistered]) {
    self->_registrationStatus = notify_register_check("com.apple.siri.power.PowerContextPolicy.updated", &self->_notificationToken);
  }
}

- (AFPowerContextClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)AFPowerContextClient;
  v2 = [(AFPowerContextClient *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_registrationStatus = -1;
    [(AFPowerContextClient *)v2 _registerForDarwinNotificationIfNeeded];
  }
  return v3;
}

- (BOOL)updateCurrentPowerPolicy:(id)a3 withError:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(AFPowerContextClient *)self _registerForDarwinNotificationIfNeeded];
  if (![(AFPowerContextClient *)self _isNotificationTokenRegistered])
  {
    v13 = AFSiriLogContextPower;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      uint64_t v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
      _os_log_error_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error updating current power policy - unregistered token", (uint8_t *)&v16, 0xCu);
      if (!a4) {
        goto LABEL_16;
      }
    }
    else if (!a4)
    {
      goto LABEL_16;
    }
    id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v12 = 7100;
    goto LABEL_9;
  }
  uint64_t v7 = [v6 encodePolicy];
  uint32_t v8 = notify_set_state(self->_notificationToken, v7);
  uint64_t v9 = AFSiriLogContextPower;
  if (v8)
  {
    uint32_t v10 = v8;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315394;
      uint64_t v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
      __int16 v18 = 1024;
      LODWORD(v19) = v10;
      _os_log_error_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_ERROR, "%s PowerContextClient: Error updating current power policy - failed to set state with status code: %u", (uint8_t *)&v16, 0x12u);
      if (a4) {
        goto LABEL_5;
      }
    }
    else if (a4)
    {
LABEL_5:
      id v11 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v12 = 7102;
LABEL_9:
      BOOL v14 = 0;
      *a4 = (id)[v11 initWithDomain:@"kAFAssistantErrorDomain" code:v12 userInfo:0];
      goto LABEL_17;
    }
LABEL_16:
    BOOL v14 = 0;
    goto LABEL_17;
  }
  if (os_log_type_enabled((os_log_t)AFSiriLogContextPower, OS_LOG_TYPE_DEBUG))
  {
    int v16 = 136315650;
    uint64_t v17 = "-[AFPowerContextClient(PolicyProvider) updateCurrentPowerPolicy:withError:]";
    __int16 v18 = 2048;
    uint64_t v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = v7;
    _os_log_debug_impl(&dword_19CF1D000, v9, OS_LOG_TYPE_DEBUG, "%s PowerContextClient: Updated current power policy: %llu -> 0x%llx", (uint8_t *)&v16, 0x20u);
  }
  notify_post("com.apple.siri.power.PowerContextPolicy.updated");
  BOOL v14 = 1;
LABEL_17:

  return v14;
}

@end