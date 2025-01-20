@interface FSClient(Private)
@end

@implementation FSClient(Private)

- (void)validateVolumeName:()Private usingBundle:volumeID:replyHandler:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_ERROR, "%s:%@", (uint8_t *)v1, 0x16u);
}

- (void)validateVolumeName:()Private usingBundle:volumeID:replyHandler:.cold.2()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_24DDB2000, v0, OS_LOG_TYPE_DEBUG, "%s: Unknown bundle (%@)", (uint8_t *)v1, 0x16u);
}

@end