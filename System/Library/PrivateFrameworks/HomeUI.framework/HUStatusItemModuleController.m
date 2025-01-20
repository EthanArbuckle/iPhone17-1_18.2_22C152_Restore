@interface HUStatusItemModuleController
+ (id)_layoutOptionsForEnvironment:(id)a3;
- (Class)collectionCellClassForItem:(id)a3;
- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3;
- (id)cellLayoutOptions;
- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4;
- (unint64_t)didSelectItem:(id)a3;
- (void)configureCell:(id)a3 forItem:(id)a4;
@end

@implementation HUStatusItemModuleController

- (Class)collectionCellClassForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  objc_opt_isKindOfClass();

  v4 = objc_opt_class();

  return (Class)v4;
}

- (id)collectionLayoutSectionForSectionWithIdentifier:(id)a3 layoutEnvironment:(id)a4
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  v5 = [(id)objc_opt_class() _layoutOptionsForEnvironment:v4];

  v6 = (void *)MEMORY[0x1E4F42628];
  v7 = (void *)MEMORY[0x1E4F42638];
  v8 = (void *)MEMORY[0x1E4F42608];
  v9 = [v5 statusCellOptions];
  [v9 estimatedCellWidth];
  v10 = objc_msgSend(v8, "estimatedDimension:");
  v11 = [MEMORY[0x1E4F42608] fractionalHeightDimension:1.0];
  v12 = [v7 sizeWithWidthDimension:v10 heightDimension:v11];
  v13 = [v6 itemWithLayoutSize:v12];

  v14 = (void *)MEMORY[0x1E4F42638];
  v15 = (void *)MEMORY[0x1E4F42608];
  v16 = [v5 statusCellOptions];
  [v16 estimatedCellWidth];
  v17 = objc_msgSend(v15, "estimatedDimension:");
  v18 = (void *)MEMORY[0x1E4F42608];
  v19 = [v5 statusCellOptions];
  [v19 cellHeight];
  v20 = objc_msgSend(v18, "estimatedDimension:");
  v21 = [v14 sizeWithWidthDimension:v17 heightDimension:v20];

  v22 = (void *)MEMORY[0x1E4F42618];
  v35[0] = v13;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  v24 = [v22 horizontalGroupWithLayoutSize:v21 subitems:v23];

  v25 = [MEMORY[0x1E4F42630] sectionWithGroup:v24];
  v26 = [v5 statusCellOptions];
  [v26 cellSpacing];
  objc_msgSend(v25, "setInterGroupSpacing:");

  [v25 setOrthogonalScrollingBehavior:1];
  [v25 setContentInsetsReference:3];
  [v5 sectionTopMargin];
  double v28 = v27;
  [v5 sectionLeadingMargin];
  double v30 = v29;
  [v5 sectionBottomMargin];
  double v32 = v31;
  [v5 sectionTrailingMargin];
  objc_msgSend(v25, "setContentInsets:", v28, v30, v32, v33);

  return v25;
}

- (id)cellLayoutOptions
{
  return -[HUStatusItemModuleController _defaultCellLayoutOptionsForViewSize:](self, "_defaultCellLayoutOptionsForViewSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
}

- (void)configureCell:(id)a3 forItem:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HUStatusItemModuleController;
  [(HUItemModuleController *)&v10 configureCell:v6 forItem:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = [(HUStatusItemModuleController *)self cellLayoutOptions];
    v8 = [v7 statusCellOptions];
    [v6 setLayoutOptions:v8];
  }
  else
  {
    v9 = [MEMORY[0x1E4F42B58] cellConfiguration];
    [v6 setContentConfiguration:v9];

    v7 = [MEMORY[0x1E4F427B0] clearConfiguration];
    [v6 setBackgroundConfiguration:v7];
  }
}

- (unint64_t)didSelectItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    if ([v5 supportsInvalidation])
    {
      id v6 = [v5 latestResults];
      v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F68BC0]];
      uint64_t v8 = [v7 integerValue];

      v9 = [v5 latestResults];
      objc_super v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F68C20]];
      uint64_t v11 = [v10 integerValue];

      BOOL v13 = v8 == 2 || v11 == 2;
      v14 = [(HUItemModuleController *)self module];
      [v14 updateNeedsInvalidation:v13 forStatusItem:v5];
    }
  }

  return 0;
}

- (id)_defaultCellLayoutOptionsForViewSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v5 = [MEMORY[0x1E4F69758] isAMac];
  if ([MEMORY[0x1E4F69758] useMacIdiom]) {
    id v6 = &unk_1F19B4190;
  }
  else {
    id v6 = 0;
  }
  v7 = +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v6, width, height);
  [v7 setStatusHidden:0];
  uint64_t v8 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:0];
  v9 = [v8 preferredContentSizeCategory];
  [v7 setContentSizeCategory:v9];

  [v7 setEditing:0];

  return v7;
}

+ (id)_layoutOptionsForEnvironment:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F69758];
  id v4 = a3;
  uint64_t v5 = [v3 isAMac];
  int v6 = [MEMORY[0x1E4F69758] useMacIdiom];
  v7 = &unk_1F19B4190;
  if (!v6) {
    v7 = 0;
  }
  id v8 = v7;
  v9 = [v4 container];
  [v9 effectiveContentSize];
  objc_super v10 = +[HUGridLayoutOptions defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:](HUGridLayoutOptions, "defaultOptionsForViewSize:columnStyle:overrideSizeSubclass:", v5, v8);

  uint64_t v11 = [v4 traitCollection];

  v12 = [v11 preferredContentSizeCategory];
  [v10 setContentSizeCategory:v12];

  [v10 setSectionLeadingMargin:0.0];
  [v10 setSectionTrailingMargin:0.0];

  return v10;
}

@end