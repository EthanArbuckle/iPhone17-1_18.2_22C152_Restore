@interface UIDocumentPickerURLContainerModel
@end

@implementation UIDocumentPickerURLContainerModel

uint64_t __52___UIDocumentPickerURLContainerModel_tagColorsByTag__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *MEMORY[0x263F085E8];
  v5 = [MEMORY[0x263F08C40] defaultStore];
  [v2 addObserver:v3 selector:sel__tagColorsDidChange name:v4 object:v5];

  v6 = *(void **)(a1 + 32);

  return [v6 _tagColorsDidChange];
}

void __52___UIDocumentPickerURLContainerModel__tagBlipColors__block_invoke()
{
  v11[8] = *MEMORY[0x263EF8340];
  v0 = [MEMORY[0x263F1C550] colorWithWhite:0.8 alpha:1.0];
  v11[0] = v0;
  v1 = [MEMORY[0x263F1C550] systemGrayColor];
  v11[1] = v1;
  v2 = [MEMORY[0x263F1C550] systemGreenColor];
  v11[2] = v2;
  uint64_t v3 = [MEMORY[0x263F1C550] systemPurpleColor];
  v11[3] = v3;
  uint64_t v4 = [MEMORY[0x263F1C550] systemBlueColor];
  v11[4] = v4;
  v5 = [MEMORY[0x263F1C550] systemYellowColor];
  v11[5] = v5;
  v6 = [MEMORY[0x263F1C550] systemRedColor];
  v11[6] = v6;
  v7 = [MEMORY[0x263F1C550] systemOrangeColor];
  v11[7] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:8];
  uint64_t v9 = [v8 copy];
  v10 = (void *)_tagBlipColors_colors;
  _tagBlipColors_colors = v9;
}

void __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke_2;
  v5[3] = &unk_26492CF28;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __69___UIDocumentPickerURLContainerModel_initWithURL_pickableTypes_mode___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained updateObserverForURL:*(void *)(a1 + 32)];
}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  uint64_t v7 = objc_msgSend(v6, "compare:options:range:locale:", v5, 833, 0, objc_msgSend(v6, "length"), *(void *)(a1 + 32));

  return v7;
}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 type];
  uint64_t v7 = [v5 type];
  if (v6 && v7)
  {
    uint64_t v8 = 0;
  }
  else if (!v6 || v7)
  {
    if (v6 || !v7)
    {
      uint64_t v9 = [v4 modificationDate];
      v10 = [v5 modificationDate];
      uint64_t v8 = [v9 compare:v10];
    }
    else
    {
      uint64_t v8 = -1;
    }
  }
  else
  {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t __59___UIDocumentPickerURLContainerModel_updateSortDescriptors__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 sortedArrayUsingSelector:sel_localizedStandardCompare_];
  uint64_t v7 = [v6 componentsJoinedByString:&stru_26E0221C0];

  uint64_t v8 = [v5 sortedArrayUsingSelector:sel_localizedStandardCompare_];

  uint64_t v9 = [v8 componentsJoinedByString:&stru_26E0221C0];

  uint64_t v10 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  return v10;
}

void __79___UIDocumentPickerURLContainerModel_arrayController_modelChanged_differences___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observer];

  if (v2)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 callUpdateHandlerWithNewItems:v4 diff:v5];
  }
}

void __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke(uint64_t a1)
{
  v2 = cdui_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke_cold_1(v2);
  }

  [*(id *)(a1 + 32) callUpdateHandlerWithNewItems:MEMORY[0x263EFFA68] diff:0];
  id v3 = [*(id *)(a1 + 32) _createObserver];
  [*(id *)(a1 + 32) setObserver:v3];
}

void __59___UIDocumentPickerURLContainerModel_updateObserverForURL___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_22CA47000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] move: calling update handler and recreating observer", v1, 2u);
}

@end