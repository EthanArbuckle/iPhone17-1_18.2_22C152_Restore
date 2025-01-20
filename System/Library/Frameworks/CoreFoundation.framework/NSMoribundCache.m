@interface NSMoribundCache
@end

@implementation NSMoribundCache

void __NSMoribundCache_invalidAccess_block_invoke()
{
  v0 = _CFFoundationRuntimeIssuesLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT)) {
    __NSMoribundCache_invalidAccess_block_invoke_cold_1(v0);
  }
}

void __NSMoribundCache_invalidAccess_block_invoke_cold_1(os_log_t log)
{
  uint64_t v2 = *(void *)off_1ECE0A5B0;
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_182B90000, log, OS_LOG_TYPE_FAULT, "Attempting to interact with NSCache instance that is being deallocated. Break on \"NSMoribundCache_invalidAccess\" to debug.", v1, 2u);
}

@end