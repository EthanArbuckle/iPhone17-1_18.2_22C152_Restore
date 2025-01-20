@interface DNDSRequestRadar
@end

@implementation DNDSRequestRadar

void ___DNDSRequestRadar_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [MEMORY[0x1E4F290C8] queryItemWithName:a2 value:a3];
  [v3 addObject:v4];
}

void ___DNDSRequestRadar_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = DNDSLogSysdiagnose;
  if (os_log_type_enabled((os_log_t)DNDSLogSysdiagnose, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1D3052000, v3, OS_LOG_TYPE_DEFAULT, "Requested notification for TTR. %@", (uint8_t *)&v4, 0xCu);
  }
}

@end