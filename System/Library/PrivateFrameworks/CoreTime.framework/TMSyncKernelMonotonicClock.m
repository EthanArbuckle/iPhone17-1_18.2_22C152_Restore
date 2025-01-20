@interface TMSyncKernelMonotonicClock
@end

@implementation TMSyncKernelMonotonicClock

double ___TMSyncKernelMonotonicClock_block_invoke()
{
  _TMSyncKernelMonotonicClock_miblen = 2;
  if (sysctlnametomib("kern.monotonicclock_usecs", (int *)&_TMSyncKernelMonotonicClock_mib, (size_t *)&_TMSyncKernelMonotonicClock_miblen))
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v0) {
      ___TMSyncKernelMonotonicClock_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
    _TMSyncKernelMonotonicClock_miblen = 0;
  }
  if (TMGetKernelMonotonicClockResolution_onceToken != -1) {
    dispatch_once(&TMGetKernelMonotonicClockResolution_onceToken, &__block_literal_global_267);
  }
  double result = *(double *)&TMGetKernelMonotonicClockResolution_sInterval * 0.5;
  *(double *)&_TMSyncKernelMonotonicClock_halfResolution = *(double *)&TMGetKernelMonotonicClockResolution_sInterval
                                                         * 0.5;
  return result;
}

void ___TMSyncKernelMonotonicClock_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end