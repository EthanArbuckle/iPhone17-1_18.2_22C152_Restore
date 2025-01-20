@interface UTDynamicGetPedigree
@end

@implementation UTDynamicGetPedigree

void ___UTDynamicGetPedigree_block_invoke(uint64_t a1, __CFString *a2)
{
  if (_UTTypeIdentifierIsDynamic(a2))
  {
    uint64_t Pedigree = _UTDynamicGetPedigree(*(void *)(a1 + 40), a2);
LABEL_5:
    v5 = (void *)Pedigree;
    goto LABEL_6;
  }
  int v7 = 0;
  if (_UTGetActiveTypeForCFStringIdentifier(**(void ***)(a1 + 40), a2, &v7))
  {
    uint64_t Pedigree = _UTTypeGetPedigreeInternal(*(uint64_t **)(a1 + 40), v7);
    goto LABEL_5;
  }
  if (_UTTypeIdentifierIsValid(a2))
  {
    id v6 = (id)[(__CFString *)a2 copy];
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:&v6 count:1];
  }
  else
  {
    v5 = 0;
  }
LABEL_6:
  if (v5) {
    [*(id *)(a1 + 32) unionSet:v5];
  }
}

@end