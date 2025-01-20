@interface MDMAbstractTunnelParser(Commands)
@end

@implementation MDMAbstractTunnelParser(Commands)

- (void)_commandDisconnect:()Commands .cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = "/Library/Caches/com.apple.xbs/Sources/DeviceManagementClientTools/DeviceManagementClientTools/MDM Framework/Parse"
       "rs/MDMAbstractTunnelParser.m";
  __int16 v3 = 2080;
  int v1 = 136315650;
  v4 = "-[MDMAbstractTunnelParser(Commands) _commandDisconnect:]";
  __int16 v5 = 2048;
  uint64_t v6 = 43;
  _os_log_debug_impl(&dword_230A49000, log, OS_LOG_TYPE_DEBUG, "<%s %s:%lu>", (uint8_t *)&v1, 0x20u);
}

@end