@interface PFBatchFaultingArray
@end

@implementation PFBatchFaultingArray

uint64_t __68___PFBatchFaultingArray_indexOfObjectAtIndexes_options_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
  return result;
}

uint64_t __71___PFBatchFaultingArray_indexesOfObjectsAtIndexes_options_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v6)
    {
      *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [MEMORY[0x1E4F28E60] indexSet];
      v6 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    return [v6 addIndex:a3];
  }
  return result;
}

@end