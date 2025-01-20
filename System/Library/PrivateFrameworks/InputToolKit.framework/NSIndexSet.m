@interface NSIndexSet
@end

@implementation NSIndexSet

void __33__NSIndexSet_ITK__itk_rangeArray__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

uint64_t __34__NSIndexSet_ITK__itk_indexString__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%ld,", a2);
}

@end