@interface MKFModel
@end

@implementation MKFModel

void __21___MKFModel_willSave__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];

  if (v6)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

uint64_t __27___MKFModel_deleteObjects___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

@end