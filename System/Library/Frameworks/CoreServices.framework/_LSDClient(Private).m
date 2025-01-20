@interface _LSDClient(Private)
@end

@implementation _LSDClient(Private)

- (void)handleXPCInvocation:()Private isReply:.cold.1(uint64_t a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 136446466;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2082;
  *(void *)(buf + 14) = a1;
  _os_log_fault_impl(&dword_182959000, log, OS_LOG_TYPE_FAULT, "Failed to create dispatch_block_t for XPC message -[%{public}s %{public}s], aborting.", buf, 0x16u);
}

@end