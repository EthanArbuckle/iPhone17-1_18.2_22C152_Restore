@interface CNInsetGroupsAndAccountsStyle
- (BOOL)isInset;
- (BOOL)shouldShowCellSelection;
- (id)backgroundColor;
- (id)cellAccessoriesForItem:(id)a3;
- (id)cellConfigurationUpdateHandler;
- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3;
- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6;
- (int64_t)buttonBehavior;
@end

@implementation CNInsetGroupsAndAccountsStyle

- (id)cellConfigurationUpdateHandler
{
  return &__block_literal_global_20_17704;
}

void __63__CNInsetGroupsAndAccountsStyle_cellConfigurationUpdateHandler__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  id v14 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v14;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [MEMORY[0x1E4FB1948] cellConfiguration];
    v9 = [v8 updatedConfigurationForState:v5];

    v10 = [v9 textProperties];
    v11 = [v10 color];
    [v7 applyTextColor:v11];

    v12 = [v9 imageProperties];
    v13 = [v12 tintColor];
    [v7 applyAccessoryTintColor:v13];
  }
}

- (id)cellAccessoriesForItem:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 alloc];
  v12.receiver = self;
  v12.super_class = (Class)CNInsetGroupsAndAccountsStyle;
  id v7 = [(CNAccountsAndGroupsStyle *)&v12 cellAccessoriesForItem:v5];
  v8 = (void *)[v6 initWithArray:v7];

  v9 = [v5 identifier];

  LOBYTE(v5) = [v9 isEqualToString:@"groupPlaceholderIdentifier"];
  if ((v5 & 1) == 0)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1518]);
    [v8 addObject:v10];
  }

  return v8;
}

- (int64_t)buttonBehavior
{
  return 2;
}

- (BOOL)shouldShowCellSelection
{
  return 0;
}

- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3
{
  id v3 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__CNInsetGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke;
  aBlock[3] = &unk_1E5497BB8;
  id v8 = v3;
  id v4 = v3;
  id v5 = _Block_copy(aBlock);

  return v5;
}

void __78__CNInsetGroupsAndAccountsStyle_parentCellConfigurationUpdateHandlerWithText___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = [a3 traitCollection];
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
  BOOL v6 = a6;
  v9 = (objc_class *)MEMORY[0x1E4FB2050];
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[[v9 alloc] initWithAppearanceStyle:2 layoutEnvironment:v12];
  [v13 setStylesFirstItemAsHeader:v6];
  [v13 setLeadingSwipeActionsConfigurationProvider:v11];

  [v13 setTrailingSwipeActionsConfigurationProvider:v10];
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB2048]) initWithConfiguration:v13 layoutEnvironment:v12];

  return v14;
}

- (id)backgroundColor
{
  return +[CNUIColorRepository groupsInsetBackgroundColor];
}

- (BOOL)isInset
{
  return 1;
}

@end