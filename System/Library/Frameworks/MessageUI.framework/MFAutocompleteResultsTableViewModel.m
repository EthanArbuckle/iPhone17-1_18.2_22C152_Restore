@interface MFAutocompleteResultsTableViewModel
@end

@implementation MFAutocompleteResultsTableViewModel

uint64_t __64___MFAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

void __58___MFAutocompleteResultsTableViewModel_enumerateSections___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v8 = a2;
  id v7 = a3;
  (*(void (**)(void, uint64_t, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [v8 unsignedIntegerValue], v7, a4);
}

@end