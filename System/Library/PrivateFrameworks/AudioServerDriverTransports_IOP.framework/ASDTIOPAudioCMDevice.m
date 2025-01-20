@interface ASDTIOPAudioCMDevice
+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (BOOL)disableInDirection:(unsigned int)a3;
- (BOOL)enableInDirection:(unsigned int)a3;
- (BOOL)getCurrentPowerState:(unsigned int *)a3;
- (BOOL)getEnableState:(BOOL *)a3;
- (BOOL)getNodeProperty:(unsigned int)a3 withValue:(id)a4;
- (BOOL)makePowerRequestForState:(unsigned int)a3 andDirection:(unsigned int)a4;
- (BOOL)open;
- (BOOL)setNodeProperty:(unsigned int)a3 withValue:(id)a4;
- (id).cxx_construct;
- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (void)close;
- (void)open;
@end

@implementation ASDTIOPAudioCMDevice

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initForIOObject:v4 andIDValue:v6];

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a4;
  operator new();
}

- (BOOL)open
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice open]();
  }
  id v4 = [(ASDTIOService *)self idValue];
  [v4 clientType];
  char v5 = ASDT::IOUserClient::OpenConnection((ASDT::IOUserClient *)value);

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice open]();
    }
  }
  return v5;
}

- (void)close
{
}

- (BOOL)enableInDirection:(unsigned int)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice enableInDirection:]();
  }
  BOOL v5 = ASDT::IOPAudio::ClientManager::UserClient::Enable((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!v5)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice enableInDirection:]();
    }
  }
  return v5;
}

- (BOOL)disableInDirection:(unsigned int)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice disableInDirection:]();
  }
  BOOL v5 = ASDT::IOPAudio::ClientManager::UserClient::Disable((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!v5)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice disableInDirection:]();
    }
  }
  return v5;
}

- (BOOL)getEnableState:(BOOL *)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice getEnableState:]();
  }
  if (!a3) {
    -[ASDTIOPAudioCMDevice getEnableState:]();
  }
  BOOL EnableState = ASDT::IOPAudio::ClientManager::UserClient::GetEnableState((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!EnableState)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice getEnableState:]();
    }
  }
  return EnableState;
}

- (BOOL)getCurrentPowerState:(unsigned int *)a3
{
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice getCurrentPowerState:]();
  }
  if (!a3) {
    -[ASDTIOPAudioCMDevice getCurrentPowerState:]();
  }
  BOOL CurrentPowerState = ASDT::IOPAudio::ClientManager::UserClient::GetCurrentPowerState((ASDT::IOPAudio::ClientManager::UserClient *)value, a3);
  if (!CurrentPowerState)
  {
    uint64_t v6 = ASDTIOPLogType();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice getCurrentPowerState:]();
    }
  }
  return CurrentPowerState;
}

- (BOOL)makePowerRequestForState:(unsigned int)a3 andDirection:(unsigned int)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    -[ASDTIOPAudioCMDevice makePowerRequestForState:andDirection:]();
  }
  v17[0] = a3;
  v17[1] = a4;
  BOOL PowerRequest = ASDT::IOPAudio::ClientManager::UserClient::MakePowerRequest((ASDT::IOUserClient *)value, v17);
  if (!PowerRequest)
  {
    v9 = ASDTIOPLogType();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [(ASDTIOService *)self idValue];
      v12 = (void *)v11;
      unsigned int v13 = HIBYTE(a3);
      if ((a3 - 0x20000000) >> 24 >= 0x5F) {
        unsigned int v13 = 32;
      }
      int v14 = BYTE2(a3);
      if (BYTE2(a3) - 32 >= 0x5F) {
        int v14 = 32;
      }
      *(_DWORD *)buf = 138413570;
      uint64_t v19 = v11;
      int v15 = BYTE1(a3);
      if (BYTE1(a3) - 32 >= 0x5F) {
        int v15 = 32;
      }
      __int16 v20 = 1024;
      unsigned int v21 = v13;
      int v16 = a3;
      __int16 v22 = 1024;
      int v23 = v14;
      __int16 v24 = 1024;
      int v25 = v15;
      __int16 v26 = 1024;
      if (a3 - 32 >= 0x5F) {
        int v16 = 32;
      }
      int v27 = v16;
      __int16 v28 = 1024;
      unsigned int v29 = a4;
      _os_log_error_impl(&dword_248A68000, v9, OS_LOG_TYPE_ERROR, "%@: Failed to make power request to state '%c%c%c%c' with direction %x", buf, 0x2Au);
    }
  }
  return PowerRequest;
}

- (BOOL)setNodeProperty:(unsigned int)a3 withValue:(id)a4
{
  id v6 = a4;
  v7 = v6;
  value = self->_userClient.__ptr_.__value_;
  if (!value) {
    __assert_rtn("-[ASDTIOPAudioCMDevice setNodeProperty:withValue:]", "ASDTIOPAudioCMDevice.mm", 144, "_userClient");
  }
  unsigned int v9 = [v6 length];
  id v10 = v7;
  BOOL v11 = ASDT::IOPAudio::ClientManager::UserClient::SetNodeProperty((ASDT::IOPAudio::ClientManager::UserClient *)value, a3, v9, (const void *)[v10 bytes]);
  if (!v11)
  {
    v12 = ASDTIOPLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice setNodeProperty:withValue:]();
    }
  }
  return v11;
}

- (BOOL)getNodeProperty:(unsigned int)a3 withValue:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = v6;
  if (!self->_userClient.__ptr_.__value_) {
    __assert_rtn("-[ASDTIOPAudioCMDevice getNodeProperty:withValue:]", "ASDTIOPAudioCMDevice.mm", 157, "_userClient");
  }
  unsigned int v14 = [v6 length];
  value = self->_userClient.__ptr_.__value_;
  id v9 = v7;
  BOOL NodeProperty = ASDT::IOPAudio::ClientManager::UserClient::GetNodeProperty((ASDT::IOPAudio::ClientManager::UserClient *)value, a3, &v14, (void *)[v9 mutableBytes]);
  if (NodeProperty)
  {
    uint64_t v11 = v14;
    if ([v9 length] != v11) {
      [v9 setLength:v14];
    }
  }
  else
  {
    v12 = ASDTIOPLogType();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      [(ASDTIOService *)self idValue];
      objc_claimAutoreleasedReturnValue();
      -[ASDTIOPAudioCMDevice getNodeProperty:withValue:]();
    }
  }
  return NodeProperty;
}

- (void).cxx_destruct
{
  value = self->_userClient.__ptr_.__value_;
  self->_userClient.__ptr_.__value_ = 0;
  if (value) {
    (*(void (**)(void))(*(void *)value + 8))();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  return self;
}

- (void)initForIOObject:(uint64_t)a1 andIDValue:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to create ClientManager user client", (uint8_t *)&v2, 0xCu);
}

- (void)open
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to open connection to ClientManager user client", v5);
}

- (void)enableInDirection:.cold.1()
{
}

- (void)enableInDirection:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to enable.", v5);
}

- (void)disableInDirection:.cold.1()
{
}

- (void)disableInDirection:.cold.2()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to disable.", v5);
}

- (void)getEnableState:.cold.1()
{
}

- (void)getEnableState:.cold.2()
{
}

- (void)getEnableState:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to retrieve the enable state", v5);
}

- (void)getCurrentPowerState:.cold.1()
{
}

- (void)getCurrentPowerState:.cold.2()
{
}

- (void)getCurrentPowerState:.cold.3()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_0(v1, v2, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_248A68000, v3, v4, "%@: Failed to retrieve the power state", v5);
}

- (void)makePowerRequestForState:andDirection:.cold.1()
{
}

- (void)setNodeProperty:withValue:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_248A68000, v5, OS_LOG_TYPE_ERROR, "%@: Set node property '%x'", v4, 0x12u);
}

- (void)getNodeProperty:withValue:.cold.1()
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_3(v1, v2, v3, 5.778e-34);
  _os_log_error_impl(&dword_248A68000, v5, OS_LOG_TYPE_ERROR, "%@: Get node property '%x'", v4, 0x12u);
}

@end