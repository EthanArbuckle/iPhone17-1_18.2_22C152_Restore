@interface BRCSyncOperationThrottle(SchedulingAdditions)
@end

@implementation BRCSyncOperationThrottle(SchedulingAdditions)

- (void)scheduleIfPossibleWithCurrentTimestamp:()SchedulingAdditions signalSourceIfFailed:description:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] No sync required anymore at that time%@", (uint8_t *)&v2, 0xCu);
}

- (void)scheduleIfPossibleWithCurrentTimestamp:()SchedulingAdditions signalSourceIfFailed:description:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  brc_interval_from_nsec();
  int v6 = 134218242;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Not ready to sync yet, sleeping for %.3fs%@", (uint8_t *)&v6, 0x16u);
}

@end