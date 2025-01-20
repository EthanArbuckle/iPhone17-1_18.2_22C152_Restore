@interface FEFocusGroup
@end

@implementation FEFocusGroup

uint64_t __46___FEFocusGroup__validateItemOrderIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _FEFocusItemCompare(a2, a3);
}

uint64_t __52___FEFocusGroup__validateChildGroupOrderIfNecessary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  return _FEFocusGroupCompare(a2, a3);
}

@end