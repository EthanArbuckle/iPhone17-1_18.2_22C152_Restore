@interface _EXExtensionIdentity(Overlay)
@end

@implementation _EXExtensionIdentity(Overlay)

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.1(os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = "sandboxProfileName";
  __int16 v3 = 2080;
  int v1 = 136315650;
  v4 = "/Library/Caches/com.apple.xbs/Sources/ExtensionFoundation/ExtensionFoundation/Source/EXExtension/Extension/EXExtensionIdentity.m";
  __int16 v5 = 1024;
  int v6 = 920;
  _os_log_fault_impl(&dword_191F29000, log, OS_LOG_TYPE_FAULT, "%s - %s:%d: Sandbox profile name required", (uint8_t *)&v1, 0x1Cu);
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8(&dword_191F29000, v0, v1, "%@ XPC overlay: %@");
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.3()
{
  OUTLINED_FUNCTION_3();
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.4()
{
  OUTLINED_FUNCTION_4_0();
}

- (void)xpcOverlayDictionaryOverridingSandboxProfileName:()Overlay multiInstance:arguments:additionalEnvironment:.cold.5()
{
  OUTLINED_FUNCTION_4_0();
}

- (void)_executableURLWithError:()Overlay .cold.1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_191F29000, log, OS_LOG_TYPE_ERROR, "failed to obtain execPath", v1, 2u);
}

@end