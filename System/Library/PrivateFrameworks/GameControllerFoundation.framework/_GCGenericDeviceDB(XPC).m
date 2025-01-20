@interface _GCGenericDeviceDB(XPC)
@end

@implementation _GCGenericDeviceDB(XPC)

- (void)preparedModelForDevice:()XPC reply:.cold.1(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_20AD04000, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v1, 0xCu);
}

@end