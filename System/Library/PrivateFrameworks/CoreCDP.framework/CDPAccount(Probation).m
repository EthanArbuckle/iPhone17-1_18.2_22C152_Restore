@interface CDPAccount(Probation)
- (void)rpdProbationFirstSeenDate;
@end

@implementation CDPAccount(Probation)

- (void)rpdProbationFirstSeenDate
{
}

- (void)setRpdProbationFirstSeenDate:()Probation .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to set RPD Probation date: %@", (uint8_t *)&v2, 0xCu);
}

- (void)setRpdProbationFirstSeenDate:()Probation .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)rpdProbationIsInEffectForDuration:()Probation context:.cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)rpdProbationIsInEffectForDuration:()Probation context:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end