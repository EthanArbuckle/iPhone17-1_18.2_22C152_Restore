@interface CNAccountsAndGroupsStyle
+ (id)styleForTraitCollection:(id)a3;
- (BOOL)isInset;
- (BOOL)shouldShowCellSelection;
- (id)backgroundColor;
- (id)cellAccessoriesForContextMenuPreviewForItem:(id)a3;
- (id)cellAccessoriesForItem:(id)a3;
- (id)cellConfigurationUpdateHandler;
- (id)parentCellAccessories;
- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3;
- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6;
- (int64_t)buttonBehavior;
@end

@implementation CNAccountsAndGroupsStyle

+ (id)styleForTraitCollection:(id)a3
{
  if ([a3 _splitViewControllerContext] == 2)
  {
    v3 = &styleForTraitCollection__outlineStyle;
    v4 = (void *)styleForTraitCollection__outlineStyle;
    if (styleForTraitCollection__outlineStyle) {
      goto LABEL_6;
    }
  }
  else
  {
    v3 = &styleForTraitCollection__insetStyle;
    v4 = (void *)styleForTraitCollection__insetStyle;
    if (styleForTraitCollection__insetStyle) {
      goto LABEL_6;
    }
  }
  uint64_t v5 = objc_opt_new();
  v6 = (void *)*v3;
  uint64_t *v3 = v5;

  v4 = (void *)*v3;
LABEL_6:

  return v4;
}

- (id)cellAccessoriesForContextMenuPreviewForItem:(id)a3
{
  v3 = [(CNAccountsAndGroupsStyle *)self cellAccessoriesForItem:a3];
  v4 = objc_msgSend(v3, "_cn_map:", &__block_literal_global_37_17692);

  return v4;
}

id __72__CNAccountsAndGroupsStyle_cellAccessoriesForContextMenuPreviewForItem___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [v2 setHidden:1];
  }

  return v2;
}

- (id)cellAccessoriesForItem:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 contactCountString];
  if (v5)
  {
    v6 = (void *)[objc_alloc(MEMORY[0x1E4FB1528]) initWithText:v5];
    [v4 addObject:v6];
  }
  v7 = [v3 groupSymbol];
  if (v7)
  {
    v8 = (void *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v7];
    v9 = (void *)[objc_alloc(MEMORY[0x1E4FB1500]) initWithCustomView:v8 placement:0];
    [v4 addObject:v9];
  }
  if ([v3 canDelete])
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4FB1508]);
    [v4 addObject:v10];
  }

  return v4;
}

- (int64_t)buttonBehavior
{
  return 0;
}

- (BOOL)shouldShowCellSelection
{
  return 1;
}

- (id)cellConfigurationUpdateHandler
{
  return 0;
}

- (id)parentCellConfigurationUpdateHandlerWithText:(id)a3
{
  return 0;
}

- (id)sectionConfigurationForLayoutEnvironment:(id)a3 withLeadingActionsProvider:(id)a4 withTrailingActionsProvider:(id)a5 hasHeader:(BOOL)a6
{
  return 0;
}

- (id)parentCellAccessories
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1538]);
  [v2 setStyle:1];
  v5[0] = v2;
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)backgroundColor
{
  return 0;
}

- (BOOL)isInset
{
  return 0;
}

@end