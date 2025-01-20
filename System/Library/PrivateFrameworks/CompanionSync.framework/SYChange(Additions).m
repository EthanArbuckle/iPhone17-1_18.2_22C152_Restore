@interface SYChange(Additions)
@end

@implementation SYChange(Additions)

+ (void)changeWithObject:()Additions updateType:store:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_FAULT, "SYObject %p does not provide the required syncId!", (uint8_t *)&v2, 0xCu);
}

- (void)objectForStore:()Additions .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end