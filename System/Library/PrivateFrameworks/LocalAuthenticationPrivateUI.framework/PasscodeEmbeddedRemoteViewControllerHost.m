@interface PasscodeEmbeddedRemoteViewControllerHost
@end

@implementation PasscodeEmbeddedRemoteViewControllerHost

uint64_t __62___PasscodeEmbeddedRemoteViewControllerHost_exportedInterface__block_invoke()
{
  exportedInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C547188];
  return MEMORY[0x270F9A758]();
}

uint64_t __75___PasscodeEmbeddedRemoteViewControllerHost_serviceViewControllerInterface__block_invoke()
{
  serviceViewControllerInterface_interface = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C547218];
  return MEMORY[0x270F9A758]();
}

void __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
  }
}

void __57___PasscodeEmbeddedRemoteViewControllerHost_startEditing__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
  }
}

void __55___PasscodeEmbeddedRemoteViewControllerHost_endEditing__block_invoke()
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1();
  }
}

void __56___PasscodeEmbeddedRemoteViewControllerHost_setContext___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214463000, &_os_log_internal, v0, "Could not obtain service proxy. Failed setting context (%@).", v1, v2, v3, v4, v5);
}

@end