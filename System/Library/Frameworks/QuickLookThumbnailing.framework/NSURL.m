@interface NSURL
@end

@implementation NSURL

uint64_t __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = _log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke_cold_1();
  }

  return 1;
}

void __37__NSURL__QLUtilities___QLUrlFileSize__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_0(&dword_1B281E000, v0, v1, "Failed to enumerate the url(%@) error: %@");
}

@end