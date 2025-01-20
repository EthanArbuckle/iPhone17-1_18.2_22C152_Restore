@interface NSArray
@end

@implementation NSArray

void __41__NSArray_FIAdditions__fi_mapUsingBlock___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v1 addObject:v2];
}

uint64_t __45__NSArray_FIAdditions__fi_flatMapUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v2) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v2];
  }
  return MEMORY[0x270F9A758]();
}

void __51__NSArray_FIAdditions__fi_filteredArrayUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v3];
  }
}

void __53__NSArray_FIAdditions__fi_reduceWithReduction_block___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = +[FIReduction reductionWithObject:v5];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

@end