@interface AVCMediaStreamNegotiator(utils)
@end

@implementation AVCMediaStreamNegotiator(utils)

+ (void)clientAccessNetworkType:()utils .cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  v3 = "+[AVCMediaStreamNegotiator(utils) clientAccessNetworkType:]";
  __int16 v4 = 1024;
  int v5 = 89;
  __int16 v6 = 1024;
  int v7 = v0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid connection type=%d", v2, 0x22u);
}

@end