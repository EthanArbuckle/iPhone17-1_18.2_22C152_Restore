@interface TMKernelMonotonicClockOffset
@end

@implementation TMKernelMonotonicClockOffset

void ___TMKernelMonotonicClockOffset_block_invoke()
{
  _TMKernelMonotonicClockOffset_miblen = 2;
  if (sysctlnametomib("kern.monotoniclock_offset_usecs", (int *)&_TMKernelMonotonicClockOffset_mib, (size_t *)&_TMKernelMonotonicClockOffset_miblen))
  {
    BOOL v0 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    if (v0) {
      ___TMKernelMonotonicClockOffset_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
    _TMKernelMonotonicClockOffset_miblen = 0;
  }
}

void ___TMKernelMonotonicClockOffset_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end