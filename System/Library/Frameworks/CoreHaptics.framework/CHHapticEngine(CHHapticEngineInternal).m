@interface CHHapticEngine(CHHapticEngineInternal)
@end

@implementation CHHapticEngine(CHHapticEngineInternal)

- (void)dispatchOnLocal:()CHHapticEngineInternal .cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0(&dword_1BA902000, MEMORY[0x1E4F14500], v0, "%25s:%-5d ASSERTION FAILURE [(!in_dispatch_sync) != 0 is false]: ", v1, v2, v3, v4, 2u);
  }
  __break(1u);
}

+ (void)doRegisterAudioResource:()CHHapticEngineInternal options:fromPattern:player:error:.cold.1()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0(&dword_1BA902000, MEMORY[0x1E4F14500], v0, "%25s:%-5d ASSERTION FAILURE [(_sResourceEntries->emplace(resourceID, ResourceEntry(resource, options, 1)).second == true) != 0 is false]: ", v1, v2, v3, v4, 2u);
  }
  __break(1u);
}

+ (void)doRegisterAudioResource:()CHHapticEngineInternal options:fromPattern:player:error:.cold.2()
{
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    OUTLINED_FUNCTION_0(&dword_1BA902000, MEMORY[0x1E4F14500], v0, "%25s:%-5d ASSERTION FAILURE [(_sResourceEntries->emplace(copiedResourceID, ResourceEntry(resource, options, 1)).second == true) != 0 is false]: ", v1, v2, v3, v4, 2u);
  }
  __break(1u);
}

@end