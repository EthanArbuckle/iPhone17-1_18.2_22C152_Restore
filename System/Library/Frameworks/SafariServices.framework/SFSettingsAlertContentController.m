@interface SFSettingsAlertContentController
@end

@implementation SFSettingsAlertContentController

void __45___SFSettingsAlertContentController_loadView__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  [v5 _addGroupSeparatorIfNeededBeforeItemAtIndex:a3];
  [*(id *)(a1 + 32) _addViewForItem:v6];
}

void *__52___SFSettingsAlertContentController_setFocusedItem___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) layoutIfNeeded];
  [*(id *)(a1 + 40) _updatePreferredContentSize];
  result = *(void **)(a1 + 40);
  if (!result[134])
  {
    return (void *)[result _scrollToBottomIfNeeded];
  }
  return result;
}

BOOL __54___SFSettingsAlertContentController__updateSeparators__block_invoke(uint64_t a1, void *a2)
{
  return [a2 backgroundMode] == 1;
}

void __54___SFSettingsAlertContentController__updateSeparators__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  v5 = [v20 viewAsUIView];
  id v6 = [*(id *)(*(void *)(a1 + 32) + 976) lastObject];
  if (v6 == v20)
  {

    v8 = 0;
LABEL_7:
    [v5 setHidesSeparator:1];
    goto LABEL_8;
  }
  uint64_t v7 = a3 + 1;
  v8 = [*(id *)(*(void *)(a1 + 32) + 976) objectAtIndexedSubscript:a3 + 1];

  if (!v8 || ((*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))() & 1) != 0) {
    goto LABEL_7;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  v10 = [v8 viewAsUIView];
  if ((*(uint64_t (**)(uint64_t, void *))(v9 + 16))(v9, v10)) {
    uint64_t v11 = 1;
  }
  else {
    uint64_t v11 = [*(id *)(*(void *)(a1 + 32) + 984) containsIndex:v7];
  }
  [v5 setHidesSeparator:v11];

LABEL_8:
  v12 = [v20 group];
  v13 = v12;
  if (v12)
  {
    v14 = [v12 subItems];
    id v15 = [v14 lastObject];
    BOOL v16 = v15 != v20;
  }
  else
  {
    BOOL v16 = 0;
  }
  uint64_t v17 = 4;
  if (!v16) {
    uint64_t v17 = 5;
  }
  uint64_t v18 = 2;
  if (!v16) {
    uint64_t v18 = 3;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1058)) {
    uint64_t v19 = v18;
  }
  else {
    uint64_t v19 = v17;
  }
  [v5 setDefaultBackgroundMode:v19];
}

@end