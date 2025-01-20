@interface ARUIRingGroup(Activity)
@end

@implementation ARUIRingGroup(Activity)

- (void)setIsStandalonePhoneFitnessMode:()Activity animated:completion:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 rings];
  int v4 = 134217984;
  uint64_t v5 = [v3 count];
  _os_log_fault_impl(&dword_21E162000, a2, OS_LOG_TYPE_FAULT, "-[ARUIRingGroup configureForIsStandalonePhoneFitnessMode:animated:completion:] unexpectedly called for ARUIRingGroup with %lu rings", (uint8_t *)&v4, 0xCu);
}

@end