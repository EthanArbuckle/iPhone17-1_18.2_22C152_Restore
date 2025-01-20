@interface SIMCreateAuthResponse
@end

@implementation SIMCreateAuthResponse

void ___SIMCreateAuthResponse_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v5)
  {
    v6 = EAPLogGetLogHandle();
    os_log_type_t v7 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v6, v7))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_2106D5000, v6, v7, "CoreTelephonyClient.generateAuthenticationInfoUsingSim failed with error: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [a2 data];
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

@end