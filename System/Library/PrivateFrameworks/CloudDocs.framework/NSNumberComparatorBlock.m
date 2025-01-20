@interface NSNumberComparatorBlock
@end

@implementation NSNumberComparatorBlock

uint64_t br_NSNumberComparatorBlock_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = brc_bread_crumbs((uint64_t)"br_NSNumberComparatorBlock_block_invoke", 14);
    v9 = brc_default_log(0);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      br_NSNumberComparatorBlock_block_invoke_cold_2((uint64_t)v8, v9);
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = brc_bread_crumbs((uint64_t)"br_NSNumberComparatorBlock_block_invoke", 15);
    v11 = brc_default_log(0);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      br_NSNumberComparatorBlock_block_invoke_cold_1((uint64_t)v10, v11);
    }
  }
  uint64_t v6 = [v4 compare:v5];

  return v6;
}

void br_NSNumberComparatorBlock_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [obj2 isKindOfClass:NSNumber.class]%@", (uint8_t *)&v2, 0xCu);
}

void br_NSNumberComparatorBlock_block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19ED3F000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [obj1 isKindOfClass:NSNumber.class]%@", (uint8_t *)&v2, 0xCu);
}

@end