@interface ISIcon(LIIconVariant)
@end

@implementation ISIcon(LIIconVariant)

+ (void)variantInfoForSet:()LIIconVariant count:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1AE771000, a2, OS_LOG_TYPE_FAULT, "Unknown variant set %d", (uint8_t *)v2, 8u);
}

@end