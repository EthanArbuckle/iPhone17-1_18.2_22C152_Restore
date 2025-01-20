@interface AXPutPidOnTimeoutProbation
@end

@implementation AXPutPidOnTimeoutProbation

void ___AXPutPidOnTimeoutProbation_block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(unsigned int *)(a1 + 32);
  uint64_t v2 = *(unsigned int *)(a1 + 36);
  os_unfair_lock_lock(&gAXTimeoutProbationPidsLock);
  v3 = +[AXPidSuspensionInfo shared];
  v4 = [v3 timeoutProbationPidsForDisplay:v2];
  v5 = [NSNumber numberWithInt:v1];
  int v6 = [v4 containsObject:v5];

  if (v6)
  {
    v7 = +[AXPidSuspensionInfo shared];
    v8 = [v7 timeoutProbationPidsForDisplay:v2];
    v9 = [NSNumber numberWithInt:v1];
    [v8 removeObject:v9];

    v10 = AXRuntimeLogPID();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109120;
      v11[1] = v1;
      _os_log_impl(&dword_1BA657000, v10, OS_LOG_TYPE_INFO, "Pid off timeout probation %d", (uint8_t *)v11, 8u);
    }
  }
  os_unfair_lock_unlock(&gAXTimeoutProbationPidsLock);
}

@end