@interface HandleVerify
@end

@implementation HandleVerify

uint64_t __coreUtilsPairing_HandleVerify_block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F0BE98](a3, a4, a5);
}

uint64_t __coreUtilsPairing_HandleVerify_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x270F0BE90](a3, a4, a5);
}

@end