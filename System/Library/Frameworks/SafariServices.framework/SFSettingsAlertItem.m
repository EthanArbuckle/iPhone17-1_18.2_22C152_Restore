@interface SFSettingsAlertItem
@end

@implementation SFSettingsAlertItem

id __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) attributedStringForValue:v3];
  v5 = [*(id *)(a1 + 32) textStyleForValue:v3];
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 48);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_2;
  v18[3] = &unk_1E5C760F8;
  id v19 = *(id *)(a1 + 32);
  id v8 = v3;
  id v20 = v8;
  v9 = +[_SFSettingsAlertItem optionGroupOptionWithAttributedTitle:v4 textStyle:v5 icon:v6 action:v7 handler:v18];

  [v9 setTintColor:0];
  if (objc_opt_respondsToSelector())
  {
    v10 = [*(id *)(a1 + 32) accessibilityIdentifierForValue:v8];
    [v9 setAccessibilityIdentifier:v10];
  }
  objc_initWeak(&location, v9);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_3;
  v13[3] = &unk_1E5C76120;
  objc_copyWeak(&v16, &location);
  id v14 = *(id *)(a1 + 32);
  id v11 = v8;
  id v15 = v11;
  [v9 setViewConfigurationBlock:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v9;
}

void __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 group];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [*(id *)(a1 + 32) shouldSelectValue:*(void *)(a1 + 40) forItem:v4 groupItem:v5])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v6 = objc_msgSend(v5, "subItems", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v12;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v12 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v11 + 1) + 8 * v10) setSelected:*(void *)(*((void *)&v11 + 1) + 8 * v10) == (void)v4];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v8);
    }

    [*(id *)(a1 + 32) setSelectedValue:*(void *)(a1 + 40)];
  }
  [v5 updateOptionsGroupDetailLabel];
}

void __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_3(uint64_t a1, void *a2)
{
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setSelected:", objc_msgSend(*(id *)(a1 + 32), "isSelectedValue:", *(void *)(a1 + 40)));
    [*(id *)(a1 + 32) prepareView:v4 forItem:WeakRetained value:*(void *)(a1 + 40)];
  }
}

uint64_t __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_pushSubItemsForGroup:");
}

uint64_t __78___SFSettingsAlertItem_optionsGroupWithTitle_action_subItemAction_controller___block_invoke_5(uint64_t a1, void *a2)
{
  return [a2 setComponentsArrangement:&unk_1EFBDF928];
}

uint64_t __53___SFSettingsAlertItem_updateOptionsGroupDetailLabel__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) isSelectedValue:a2];
}

void __72___SFSettingsAlertItem_setUpSelectionHandlerIfNeededWithViewController___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      id v4 = [v6 handler];
      v5 = [MEMORY[0x1E4F1CA98] null];
      ((void (**)(void, id, void *))v4)[2](v4, v3, v5);
    }
    id WeakRetained = v6;
  }
}

@end