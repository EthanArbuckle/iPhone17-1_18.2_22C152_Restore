@interface CAFMedia(Utilties)
@end

@implementation CAFMedia(Utilties)

- (void)tuneToMediaItem:()Utilties inSource:completion:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_249710000, log, OS_LOG_TYPE_DEBUG, "Tuning to mediaItem %@ in source %@", (uint8_t *)&v3, 0x16u);
}

- (void)tuneToFrequency:()Utilties inSourceWithIdentifier:completion:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)tuneToFrequency:()Utilties inSourceWithIdentifier:completion:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end