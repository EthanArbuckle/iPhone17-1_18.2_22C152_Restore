@interface ATXHomeScreenStackState
@end

@implementation ATXHomeScreenStackState

uint64_t __52___ATXHomeScreenStackState_setTopOfStackSuggestion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) widget];
  uint64_t v5 = [v4 widgetUniqueId];
  if (v5)
  {
    v6 = (void *)v5;
    v7 = [v3 widgetUniqueId];

    if (!v7)
    {
      uint64_t v10 = 0;
      goto LABEL_7;
    }
    v4 = [*(id *)(a1 + 32) widget];
    v8 = [v4 widgetUniqueId];
    v9 = [v3 widgetUniqueId];
    uint64_t v10 = [v8 isEqualToString:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

LABEL_7:
  return v10;
}

uint64_t __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) isWidget:a2 showingIdenticalContentOfSuggestion:*(void *)(a1 + 40)];
}

uint64_t __73___ATXHomeScreenStackState_widgetForSuggestion_considerSuggestedWidgets___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 extensionBundleId];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4F4B5F8]];

  return v3;
}

@end