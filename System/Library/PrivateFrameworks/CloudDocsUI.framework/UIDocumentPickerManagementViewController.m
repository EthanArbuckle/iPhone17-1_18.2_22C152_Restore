@interface UIDocumentPickerManagementViewController
@end

@implementation UIDocumentPickerManagementViewController

void __63___UIDocumentPickerManagementViewController__updateContentSize__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) tableView];
  v3 = [v2 visibleCells];
  id v11 = [v3 firstObject];

  [v11 size];
  objc_msgSend(v11, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:");
  double v5 = v4;
  v6 = [*(id *)(a1 + 32) tableView];
  [v6 setEstimatedRowHeight:v5];

  [v11 size];
  double v8 = v7;
  v9 = [*(id *)(a1 + 32) allPickers];
  double v10 = v8 * (double)(unint64_t)[v9 count];

  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", 500.0, v10);
}

uint64_t __77___UIDocumentPickerManagementViewController_tableView_canMoveRowAtIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F1D878]];

  return v3;
}

uint64_t __116___UIDocumentPickerManagementViewController_tableView_targetIndexPathForMoveFromRowAtIndexPath_toProposedIndexPath___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F1D878]];

  return v3;
}

@end