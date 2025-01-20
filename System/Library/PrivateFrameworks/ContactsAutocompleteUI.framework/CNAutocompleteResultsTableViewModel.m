@interface CNAutocompleteResultsTableViewModel
@end

@implementation CNAutocompleteResultsTableViewModel

uint64_t __64___CNAutocompleteResultsTableViewModel_numberOfNonEmptySections__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = [a3 count];
  if (result) {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return result;
}

void __58___CNAutocompleteResultsTableViewModel_enumerateSections___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  (*(void (**)(uint64_t, uint64_t, id, uint64_t))(v6 + 16))(v6, [a2 unsignedIntegerValue], v7, a4);
}

@end