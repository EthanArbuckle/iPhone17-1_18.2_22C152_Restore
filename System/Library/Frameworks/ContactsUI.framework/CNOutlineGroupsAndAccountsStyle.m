@interface CNOutlineGroupsAndAccountsStyle
- (BOOL)isInset;
- (id)backgroundColor;
- (id)cellConfigurationUpdateHandler;
- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3;
- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6;
- (int64_t)buttonBehavior;
@end

@implementation CNOutlineGroupsAndAccountsStyle

- (id)cellConfigurationUpdateHandler
{
  return &__block_literal_global_17677;
}

void __65__CNOutlineGroupsAndAccountsStyle_cellConfigurationUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v16 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v16;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1948] accompaniedSidebarCellConfiguration];
    v9 = [v8 updatedConfigurationForState:v5];

    v10 = [v9 textProperties];
    v11 = [v10 color];
    [v7 applyTextColor:v11];

    v12 = [v9 imageProperties];
    v13 = [v12 tintColor];
    [v7 applyTextViewTintColor:v13];

    v14 = [v9 imageProperties];
    v15 = [v14 tintColor];
    [v7 applyAccessoryTintColor:v15];
  }
}

- (int64_t)buttonBehavior
{
  return 1;
}

- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __80__CNOutlineGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke;
  aBlock[3] = &unk_1E5497BB8;
  id v8 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);

  return v5;
}

void __80__CNOutlineGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  v6 = [a3 traitCollection];
  uint64_t v7 = [v6 _splitViewControllerContext];

  if (v7) {
    [MEMORY[0x1E4FB1948] headerConfiguration];
  }
  else {
  id v8 = [MEMORY[0x1E4FB1948] prominentInsetGroupedHeaderConfiguration];
  }
  [v8 setText:*(void *)(a1 + 32)];
  [v5 setContentConfiguration:v8];
}

- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6
{
  id v8 = (objc_class *)MEMORY[0x1E4FB2050];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  v12 = (void *)[[v8 alloc] initWithAppearanceStyle:3 layoutEnvironment:v11];
  [v12 setSeparatorStyle:0];
  [v12 setLeadingSwipeActionsConfigurationProvider:v10];

  [v12 setTrailingSwipeActionsConfigurationProvider:v9];
  v13 = (void *)[objc_alloc(MEMORY[0x1E4FB2048]) initWithConfiguration:v12 layoutEnvironment:v11];

  return v13;
}

- (id)backgroundColor
{
  return +[CNUIColorRepository groupsOutlineBackgroundColor];
}

- (BOOL)isInset
{
  return 0;
}

@end