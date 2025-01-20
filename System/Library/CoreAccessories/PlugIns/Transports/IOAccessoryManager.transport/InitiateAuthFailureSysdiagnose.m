@interface InitiateAuthFailureSysdiagnose
@end

@implementation InitiateAuthFailureSysdiagnose

void __acc_sysdiagnose_InitiateAuthFailureSysdiagnose_block_invoke()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v0 = 136315394;
    v1 = "acc_sysdiagnose_InitiateAuthFailureSysdiagnose_block_invoke";
    __int16 v2 = 1024;
    int v3 = 57;
    _os_log_impl(&dword_222CE3000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s:%d", (uint8_t *)&v0, 0x12u);
  }
  _acc_sysdiagnose_authFailure(0);
  _isSysdiagnosePending = 0;
}

@end