@interface SOConfigurationVersion
+ (void)reset;
- (SOConfigurationVersion)initWithMode:(int64_t)a3;
- (int64_t)checkVersion;
- (int64_t)version;
- (unint64_t)_state;
- (void)_setStateAndNotify:(unint64_t)a3;
- (void)_state;
- (void)dealloc;
- (void)increaseVersionWithMessage:(id)a3;
- (void)setAppSSOUnavailable;
@end

@implementation SOConfigurationVersion

- (SOConfigurationVersion)initWithMode:(int64_t)a3
{
  v5 = SO_LOG_SOConfigurationVersion();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    [(SOConfigurationVersion *)a3 initWithMode:v5];
  }

  v10.receiver = self;
  v10.super_class = (Class)SOConfigurationVersion;
  v6 = [(SOConfigurationVersion *)&v10 init];
  v7 = v6;
  if (v6)
  {
    v6->_token = -1;
    v6->_mode = a3;
    v6->_version = 0;
    if (notify_register_check("/com.apple.AppSSO.version", &v6->_token))
    {
      v8 = SO_LOG_SOConfigurationVersion();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationVersion initWithMode:]();
      }
    }
  }
  return v7;
}

- (int64_t)checkVersion
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  uint64_t v3 = [(SOConfigurationVersion *)v2 _state];
  unint64_t v4 = v3;
  if (v3 == -1)
  {
    v2->_unint64_t version = -1;
    int64_t v5 = 2;
    goto LABEL_10;
  }
  if (!v3)
  {
LABEL_9:
    int64_t v5 = 1;
    goto LABEL_10;
  }
  if (v3 != v2->_version)
  {
    v6 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t version = v2->_version;
      int v9 = 136315906;
      objc_super v10 = "-[SOConfigurationVersion checkVersion]";
      __int16 v11 = 2048;
      unint64_t v12 = version;
      __int16 v13 = 2048;
      unint64_t v14 = v4;
      __int16 v15 = 2112;
      v16 = v2;
      _os_log_impl(&dword_1D7206000, v6, OS_LOG_TYPE_DEFAULT, "%s config version changed from from 0x%016llX to 0x%016llX on %@", (uint8_t *)&v9, 0x2Au);
    }

    v2->_unint64_t version = v4;
    goto LABEL_9;
  }
  int64_t v5 = 0;
LABEL_10:
  objc_sync_exit(v2);

  return v5;
}

- (unint64_t)_state
{
  uint64_t state64 = -1;
  int token = self->_token;
  if (token == -1)
  {
    uint64_t v3 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      [(SOConfigurationVersion *)v3 _state];
    }
    goto LABEL_7;
  }
  if (notify_get_state(token, &state64))
  {
    uint64_t v3 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationVersion _state]();
    }
LABEL_7:
  }
  return state64;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7206000, v0, v1, "notify_cancel() failed with %u", v2, v3, v4, v5, v6);
}

- (void)increaseVersionWithMessage:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_mode)
  {
    SO_LOG_SOConfigurationVersion();
    uint64_t v5 = (SOConfigurationVersion *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v5->super, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationVersion increaseVersionWithMessage:](&v5->super, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  else
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    __int16 v13 = [MEMORY[0x1E4F1C9C8] date];
    [v13 timeIntervalSince1970];
    v5->_unint64_t version = (unint64_t)(v14 * 1000.0);

    __int16 v15 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(SOConfigurationVersion *)v5 _state];
      unint64_t version = v5->_version;
      int v18 = 136316162;
      v19 = "-[SOConfigurationVersion increaseVersionWithMessage:]";
      __int16 v20 = 2048;
      uint64_t v21 = v16;
      __int16 v22 = 2048;
      unint64_t v23 = version;
      __int16 v24 = 2114;
      id v25 = v4;
      __int16 v26 = 2112;
      v27 = v5;
      _os_log_impl(&dword_1D7206000, v15, OS_LOG_TYPE_DEFAULT, "%s config version increased from 0x%016llX to 0x%016llX (%{public}@) on %@", (uint8_t *)&v18, 0x34u);
    }

    [(SOConfigurationVersion *)v5 _setStateAndNotify:v5->_version];
    objc_sync_exit(v5);
  }
}

- (void)setAppSSOUnavailable
{
}

- (int64_t)version
{
  return self->_version;
}

+ (void)reset
{
  out_int token = 0;
  uint64_t v2 = notify_register_check("/com.apple.AppSSO.version", &out_token);
  if (v2)
  {
    NSLog(&cfstr_NotifyRegister.isa, v2);
  }
  else
  {
    uint64_t v3 = notify_set_state(out_token, 0);
    if (v3)
    {
      NSLog(&cfstr_NotifySetState.isa, v3);
      notify_cancel(out_token);
    }
    else
    {
      uint64_t v4 = notify_cancel(out_token);
      if (v4) {
        NSLog(&cfstr_NotifyCancelFa.isa, v4);
      }
    }
  }
}

- (void)_setStateAndNotify:(unint64_t)a3
{
  if (notify_set_state(self->_token, a3))
  {
    uint64_t v3 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationVersion _setStateAndNotify:]();
    }
  }
  if (notify_post("/com.apple.AppSSO.version"))
  {
    uint64_t v4 = SO_LOG_SOConfigurationVersion();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationVersion _setStateAndNotify:]();
    }
  }
}

- (void)initWithMode:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7206000, v0, v1, "notify_register_check() failed with %u", v2, v3, v4, v5, v6);
}

- (void)initWithMode:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = "NO";
  uint64_t v5 = "-[SOConfigurationVersion initWithMode:]";
  int v4 = 136315650;
  if (!a1) {
    uint64_t v3 = "YES";
  }
  __int16 v6 = 2080;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D7206000, log, OS_LOG_TYPE_DEBUG, "%s host = %s on %@", (uint8_t *)&v4, 0x20u);
}

- (void)increaseVersionWithMessage:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_state
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7206000, v0, v1, "notify_get_state() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)_setStateAndNotify:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7206000, v0, v1, "notify_post() failed with error %u", v2, v3, v4, v5, v6);
}

- (void)_setStateAndNotify:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1D7206000, v0, v1, "notify_set_state() failed with error %u", v2, v3, v4, v5, v6);
}

@end