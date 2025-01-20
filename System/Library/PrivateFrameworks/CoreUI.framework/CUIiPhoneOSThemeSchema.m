@interface CUIiPhoneOSThemeSchema
@end

@implementation CUIiPhoneOSThemeSchema

void __52___CUIiPhoneOSThemeSchema__sortedElementDefinitions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) elementDefinitionCount];
  v2 = malloc_type_malloc(0x1BC0uLL, 0x10500404E17A541uLL);
  _sortedElementDefinitions__sortedElements = (uint64_t)v2;
  memcpy(v2, gElementDefinitionsEmbedded, 0x1BC0uLL);
  qsort_b(v2, (size_t)v1, 0xDE0uLL, &__block_literal_global_15);
}

uint64_t __52___CUIiPhoneOSThemeSchema__sortedElementDefinitions__block_invoke_2(uint64_t a1, const char **a2, const char **a3)
{
  return strncmp(*a2, *a3, 0x64uLL);
}

void __51___CUIiPhoneOSThemeSchema__sortedEffectDefinitions__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) effectDefinitionCount];
  v2 = malloc_type_malloc(0x1BC0uLL, 0x10500404E17A541uLL);
  _sortedEffectDefinitions__sortedEffects = (uint64_t)v2;
  memcpy(v2, gEffectDefinitionsEmbedded, 0x1BC0uLL);
  qsort_b(v2, (size_t)v1, 0xDE0uLL, &__block_literal_global_512);
}

uint64_t __51___CUIiPhoneOSThemeSchema__sortedEffectDefinitions__block_invoke_2(uint64_t a1, const char **a2, const char **a3)
{
  return strncmp(*a2, *a3, 0x64uLL);
}

@end