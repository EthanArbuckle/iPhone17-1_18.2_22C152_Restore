@interface DNDSGlobalConfigurationManager
- (BOOL)getModesCanImpactAvailabilityReturningError:(id *)a3;
- (BOOL)getPreventAutoReplyReturningError:(id *)a3;
- (BOOL)setConfiguration:(id)a3 withError:(id *)a4;
- (BOOL)setModesCanImpactAvailability:(BOOL)a3 withError:(id *)a4;
- (BOOL)setPreventAutoReply:(BOOL)a3 withError:(id *)a4;
- (DNDSGlobalConfigurationManager)initWithBackingStore:(id)a3;
- (DNDSGlobalConfigurationManagerDelegate)delegate;
- (NSString)sysdiagnoseDataIdentifier;
- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6;
- (id)fallbackConfiguration;
- (id)getConfigurationReturningError:(id *)a3;
- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4;
- (unint64_t)_writeConfiguration:(id)a3 error:(id *)a4;
- (void)dealloc;
- (void)globalConfigurationStore:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4;
- (void)setDelegate:(id)a3;
@end

@implementation DNDSGlobalConfigurationManager

- (DNDSGlobalConfigurationManager)initWithBackingStore:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DNDSGlobalConfigurationManager;
  v6 = [(DNDSGlobalConfigurationManager *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_backingStore, a3);
    [(DNDSGlobalConfigurationStoring *)v7->_backingStore setDelegate:v7];
    DNDSRegisterSysdiagnoseDataProvider(v7);
  }

  return v7;
}

- (void)dealloc
{
  DNDSUnregisterSysdiagnoseDataProvider(self);
  v3.receiver = self;
  v3.super_class = (Class)DNDSGlobalConfigurationManager;
  [(DNDSGlobalConfigurationManager *)&v3 dealloc];
}

- (id)getConfigurationReturningError:(id *)a3
{
  objc_super v3 = [(DNDSGlobalConfigurationStoring *)self->_backingStore readRecordWithError:a3];
  if (!v3)
  {
    objc_super v3 = objc_alloc_init(DNDSMutableGlobalConfiguration);
    [(DNDSMutableGlobalConfiguration *)v3 setAutomaticallyGenerated:1];
  }
  v4 = (void *)[(DNDSMutableGlobalConfiguration *)v3 copy];

  return v4;
}

- (BOOL)setConfiguration:(id)a3 withError:(id *)a4
{
  id v6 = a3;
  v7 = [(DNDSGlobalConfigurationStoring *)self->_backingStore readRecordWithError:a4];
  unint64_t v8 = [(DNDSGlobalConfigurationManager *)self _writeConfiguration:v6 error:a4];
  if (v8 != 2)
  {
    BOOL v9 = v8 == 1;
    goto LABEL_18;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v11 = [v7 preventAutoReply];
  if (v11 != [v6 preventAutoReply]) {
    objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdatePreventAutoReplySetting:", self, DNDResolvedPreventAutoReplySetting(objc_msgSend(v6, "preventAutoReply")) == 2);
  }
  v12 = [v7 bypassSettings];
  uint64_t v13 = [v6 bypassSettings];
  if (v12 != (void *)v13)
  {
    v14 = (void *)v13;
    uint64_t v15 = [v7 bypassSettings];
    if (v15)
    {
      v16 = (void *)v15;
      uint64_t v17 = [v6 bypassSettings];
      if (v17)
      {
        v18 = (void *)v17;
        v19 = [v7 bypassSettings];
        v20 = [v6 bypassSettings];
        char v23 = [v19 isEqual:v20];

        if (v23) {
          goto LABEL_15;
        }
        goto LABEL_13;
      }
    }
LABEL_13:
    v12 = [v6 bypassSettings];
    [WeakRetained globalConfigurationManager:self didUpdatePhoneCallBypassSettings:v12];
    goto LABEL_14;
  }

LABEL_14:
LABEL_15:
  uint64_t v21 = [v7 modesCanImpactAvailability];
  if (v21 != [v6 modesCanImpactAvailability]) {
    objc_msgSend(WeakRetained, "globalConfigurationManager:didUpdateModesCanImpactAvailabilitySetting:", self, DNDResolvedModesCanImpactAvailabilitySetting(objc_msgSend(v6, "modesCanImpactAvailability")) == 2);
  }

  BOOL v9 = 1;
LABEL_18:

  return v9;
}

- (BOOL)getPreventAutoReplyReturningError:(id *)a3
{
  objc_super v3 = [(DNDSGlobalConfigurationStoring *)self->_backingStore readRecordWithError:a3];
  BOOL v4 = DNDResolvedPreventAutoReplySetting([v3 preventAutoReply]) == 2;

  return v4;
}

- (BOOL)setPreventAutoReply:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = "allow";
    if (v5) {
      unint64_t v8 = "prevent";
    }
    *(_DWORD *)buf = 136315138;
    v19 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Setting auto reply to %s", buf, 0xCu);
  }
  backingStore = self->_backingStore;
  id v17 = 0;
  v10 = [(DNDSGlobalConfigurationStoring *)backingStore readRecordWithError:&v17];
  id v11 = v17;
  v12 = (void *)[v10 mutableCopy];

  BOOL v13 = v11 == 0;
  if (v11)
  {
    v14 = DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationManager setPreventAutoReply:withError:]((uint64_t)v11, v14);
    }
  }
  else
  {
    if (v5) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    if ([v12 preventAutoReply] != v15)
    {
      [v12 setPreventAutoReply:v15];
      BOOL v13 = [(DNDSGlobalConfigurationManager *)self setConfiguration:v12 withError:a4];
      goto LABEL_15;
    }
  }
  if (a4) {
    *a4 = v11;
  }
LABEL_15:

  return v13;
}

- (BOOL)getModesCanImpactAvailabilityReturningError:(id *)a3
{
  objc_super v3 = [(DNDSGlobalConfigurationStoring *)self->_backingStore readRecordWithError:a3];
  BOOL v4 = DNDResolvedModesCanImpactAvailabilitySetting([v3 modesCanImpactAvailability]) == 2;

  return v4;
}

- (BOOL)setModesCanImpactAvailability:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = DNDSLogGlobalConfiguration;
  if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v8 = "NO";
    if (v5) {
      unint64_t v8 = "YES";
    }
    *(_DWORD *)buf = 136315138;
    v19 = v8;
    _os_log_impl(&dword_1D3052000, v7, OS_LOG_TYPE_DEFAULT, "Setting global availability preference to %s", buf, 0xCu);
  }
  backingStore = self->_backingStore;
  id v17 = 0;
  v10 = [(DNDSGlobalConfigurationStoring *)backingStore readRecordWithError:&v17];
  id v11 = v17;
  v12 = (void *)[v10 mutableCopy];

  BOOL v13 = v11 == 0;
  if (v11)
  {
    v14 = DNDSLogGlobalConfiguration;
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationManager setModesCanImpactAvailability:withError:]((uint64_t)v11, v14);
    }
  }
  else
  {
    if (v5) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = 1;
    }
    if ([v12 modesCanImpactAvailability] != v15)
    {
      [v12 setModesCanImpactAvailability:v15];
      BOOL v13 = [(DNDSGlobalConfigurationManager *)self setConfiguration:v12 withError:a4];
      goto LABEL_15;
    }
  }
  if (a4) {
    *a4 = v11;
  }
LABEL_15:

  return v13;
}

- (id)fallbackConfiguration
{
  return (id)[MEMORY[0x1E4F5F6E8] defaultConfiguration];
}

- (void)globalConfigurationStore:(id)a3 didUpdatePreventAutoReplySetting:(BOOL)a4
{
  BOOL v4 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained globalConfigurationManager:self didUpdatePreventAutoReplySetting:v4];
}

- (id)backingStore:(id)a3 migrateDictionaryRepresentation:(id)a4 fromVersionNumber:(unint64_t)a5 toVersionNumber:(unint64_t)a6
{
  id v6 = a4;
  return v6;
}

- (NSString)sysdiagnoseDataIdentifier
{
  return (NSString *)@"com.apple.donotdisturb.GlobalConfigurationManager";
}

- (id)sysdiagnoseDataForDate:(id)a3 redacted:(BOOL)a4
{
  v10[1] = *MEMORY[0x1E4F143B8];
  BOOL v4 = -[DNDSGlobalConfigurationStoring readRecordWithError:](self->_backingStore, "readRecordWithError:", 0, a4);
  BOOL v5 = [[DNDSBackingStoreDictionaryContext alloc] initWithDestination:1 partitionType:1 redactSensitiveData:0 contactProvider:0 applicationIdentifierMapper:0];
  id v6 = [v4 dictionaryRepresentationWithContext:v5];
  BOOL v9 = @"globalConfiguration";
  v10[0] = v6;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];

  return v7;
}

- (unint64_t)_writeConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  backingStore = self->_backingStore;
  id v17 = 0;
  uint64_t v8 = [(DNDSGlobalConfigurationStoring *)backingStore writeRecord:v6 error:&v17];
  id v9 = v17;
  v10 = v9;
  if (v8)
  {
    if (v8 == 1)
    {
      uint64_t v15 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v10;
        _os_log_impl(&dword_1D3052000, v15, OS_LOG_TYPE_DEFAULT, "Failed to save configuration, but error can be ignored; error=%{public}@",
          buf,
          0xCu);
      }
    }
    else if (v8 == 2)
    {
      id v11 = DNDSLogGlobalConfiguration;
      if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v19 = v6;
        _os_log_impl(&dword_1D3052000, v11, OS_LOG_TYPE_DEFAULT, "Saved configuration; configuration=%{public}@",
          buf,
          0xCu);
      }
      unint64_t v12 = 2;
      goto LABEL_20;
    }
    unint64_t v12 = 1;
    goto LABEL_20;
  }
  if (a4 && v9) {
    *a4 = v9;
  }
  BOOL v13 = +[DNDSKeybag sharedInstance];
  int v14 = [v13 hasUnlockedSinceBoot];

  if (v14)
  {
    if (os_log_type_enabled((os_log_t)DNDSLogGlobalConfiguration, OS_LOG_TYPE_ERROR)) {
      -[DNDSGlobalConfigurationManager _writeConfiguration:error:]();
    }
    _DNDSRequestRadar(@"Error saving configuration", v10, 0, @"/Library/Caches/com.apple.xbs/Sources/DoNotDisturbServer/DoNotDisturbServer/DNDSGlobalConfigurationManager.m", 225);
  }
  else if (os_log_type_enabled((os_log_t)DNDSLogSettings, OS_LOG_TYPE_ERROR))
  {
    -[DNDSGlobalConfigurationManager _writeConfiguration:error:]();
  }
  unint64_t v12 = 0;
LABEL_20:

  return v12;
}

- (DNDSGlobalConfigurationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DNDSGlobalConfigurationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backingStore, 0);
}

- (void)setPreventAutoReply:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Error reading auto reply state: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setModesCanImpactAvailability:(uint64_t)a1 withError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D3052000, a2, OS_LOG_TYPE_ERROR, "Error reading global availability state: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_writeConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "Failed to save configuration, will request a radar; configuration=%{public}@, error=%{public}@");
}

- (void)_writeConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D3052000, v0, v1, "Failed to save configuration but device is under first lock; configuration=%{public}@, error=%{public}@");
}

@end