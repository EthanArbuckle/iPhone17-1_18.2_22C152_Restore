@interface _GCAppClientProxy(GCPhotoVideoXPCProxyService)
@end

@implementation _GCAppClientProxy(GCPhotoVideoXPCProxyService)

- (void)generateURLFor:()GCPhotoVideoXPCProxyService withReply:.cold.1()
{
  OUTLINED_FUNCTION_0_23();
  _os_log_error_impl(&dword_220998000, v0, OS_LOG_TYPE_ERROR, "Potentially dangerous filename detected: %@", v1, 0xCu);
}

- (void)generateURLFor:()GCPhotoVideoXPCProxyService withReply:.cold.2()
{
  OUTLINED_FUNCTION_0_23();
  _os_log_error_impl(&dword_220998000, v0, OS_LOG_TYPE_ERROR, "extension token for: %@ has failed to issue", v1, 0xCu);
}

@end