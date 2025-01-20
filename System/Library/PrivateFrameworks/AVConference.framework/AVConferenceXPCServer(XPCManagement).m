@interface AVConferenceXPCServer(XPCManagement)
@end

@implementation AVConferenceXPCServer(XPCManagement)

- (void)_xpc_handle_incoming_request:()XPCManagement .cold.1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v2 = 942;
  _os_log_error_impl(&dword_1E1EA4000, v0, OS_LOG_TYPE_ERROR, "AVConferenceXPCServer [%s] %s:%d VCXPCServer: XPC Error, IGNORING INCOMING REQUEST", v1, 0x1Cu);
}

@end