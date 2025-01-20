@interface FSBlockDeviceResource(Project)
@end

@implementation FSBlockDeviceResource(Project)

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_24DDB2000, v0, v1, "%s: failed to get IOKit media for %@", v2, v3, v4, v5, 2u);
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.5()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 136315650;
  OUTLINED_FUNCTION_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_24DDB2000, v1, OS_LOG_TYPE_ERROR, "%s: failed to get IOKit notification for %@ err (%d)", (uint8_t *)v2, 0x1Cu);
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.6()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s: Setting dispatch queue (%@) for notification port", (uint8_t *)v2);
}

+ (void)openWithBSDName:()Project writable:auditToken:replyHandler:.cold.7()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s:bsdName:%@", (uint8_t *)v2);
}

- (void)startUsingResource:()Project .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a1 getResourceID];
  uint64_t v6 = *a2;
  int v7 = 136315650;
  v8 = "-[FSBlockDeviceResource(Project) startUsingResource:]";
  __int16 v9 = 2112;
  v10 = v5;
  __int16 v11 = 2112;
  uint64_t v12 = v6;
  _os_log_debug_impl(&dword_24DDB2000, a3, OS_LOG_TYPE_DEBUG, "%s: started using %@ purpose %@", (uint8_t *)&v7, 0x20u);
}

- (void)startUsingResource:()Project .cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: failed to register fd with kernel. status: %d.", v2, v3, v4, v5, 2u);
}

- (void)startUsingResource:()Project .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)startUsingResource:()Project .cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 136315394;
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_24DDB2000, v0, v1, "%s: resource already in use by (%@)", (uint8_t *)v2);
}

- (void)stopUsingResource:()Project .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stopUsingResource:()Project .cold.2(void *a1)
{
  uint64_t v1 = [a1 getResourceID];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_5(&dword_24DDB2000, v2, v3, "%s: stopped using %@", v4, v5, v6, v7, 2u);
}

- (void)stopUsingResource:()Project .cold.3()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_4_0(&dword_24DDB2000, v0, v1, "%s: failed to unregister fd with kernel. status: %d.", v2, v3, v4, v5, 2u);
}

- (void)stopUsingResource:()Project .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stopUsingResource:()Project .cold.5()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 136315650;
  OUTLINED_FUNCTION_16();
  __int16 v4 = v0;
  uint64_t v5 = v1;
  _os_log_error_impl(&dword_24DDB2000, v2, OS_LOG_TYPE_ERROR, "%s: resource used by purpose (%@) can't stop using resource with given purpose (%@)", (uint8_t *)v3, 0x20u);
}

@end