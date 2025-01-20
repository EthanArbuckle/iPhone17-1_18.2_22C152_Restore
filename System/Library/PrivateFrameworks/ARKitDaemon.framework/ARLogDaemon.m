@interface ARLogDaemon
@end

@implementation ARLogDaemon

uint64_t ___ARLogDaemon_block_invoke()
{
  _ARLogDaemon_logObj = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_0()
{
  _ARLogDaemon_logObj_0 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_1()
{
  _ARLogDaemon_logObj_1 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_2()
{
  _ARLogDaemon_logObj_2 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_3()
{
  _ARLogDaemon_logObj_3 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_4()
{
  _ARLogDaemon_logObj_4 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_5()
{
  _ARLogDaemon_logObj_5 = (uint64_t)os_log_create("com.apple.ARKit", "Daemon");
  return MEMORY[0x270F9A758]();
}

uint64_t ___ARLogDaemon_block_invoke_6()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Daemon");
  uint64_t v1 = _ARLogDaemon_logObj_6;
  _ARLogDaemon_logObj_6 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t ___ARLogDaemon_block_invoke_7()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Daemon");
  uint64_t v1 = _ARLogDaemon_logObj_7;
  _ARLogDaemon_logObj_7 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

uint64_t ___ARLogDaemon_block_invoke_8()
{
  os_log_t v0 = os_log_create("com.apple.ARKit", "Daemon");
  uint64_t v1 = _ARLogDaemon_logObj_8;
  _ARLogDaemon_logObj_8 = (uint64_t)v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end