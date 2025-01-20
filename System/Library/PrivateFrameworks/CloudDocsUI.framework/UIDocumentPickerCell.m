@interface UIDocumentPickerCell
@end

@implementation UIDocumentPickerCell

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) setAlpha:1.0];
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) setAlpha:0.0];
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 904) removeFromSuperview];
}

id __47___UIDocumentPickerCell__updateSelectionState___block_invoke_4(uint64_t a1)
{
  v2 = (void *)MEMORY[0x263F1C6B0];
  v3 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v4 = [*(id *)(a1 + 32) traitCollection];
  v5 = [v2 imageNamed:@"UITintedCircularButtonCheckmark" inBundle:v3 compatibleWithTraitCollection:v4];

  v6 = (void *)MEMORY[0x263F1C6B0];
  v7 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.CloudDocsUI"];
  v8 = [*(id *)(a1 + 32) traitCollection];
  v9 = [v6 imageNamed:@"DocumentSelectionCheckmarkBackground" inBundle:v7 compatibleWithTraitCollection:v8];

  [v5 size];
  [v5 scale];
  v18 = v5;
  id v10 = v5;
  v11 = _UIGraphicsDrawIntoImageContextWithOptions();
  [v9 size];
  [v10 scale];
  v16 = v9;
  v17 = v11;
  id v12 = v11;
  id v13 = v9;
  v14 = _UIGraphicsDrawIntoImageContextWithOptions();

  return v14;
}

void __47___UIDocumentPickerCell__updateSelectionState___block_invoke_5(uint64_t a1)
{
  CurrentContext = UIGraphicsGetCurrentContext();
  uint64_t v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], v4);
  CGContextSetCompositeOperation();
  id v5 = [*(id *)(a1 + 40) tintColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);

  [*(id *)(a1 + 32) size];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v10 = v3;
  double v11 = v4;

  CGContextFillRect(CurrentContext, *(CGRect *)&v10);
}

uint64_t __47___UIDocumentPickerCell__updateSelectionState___block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "drawAtPoint:", *MEMORY[0x263F00148], *(double *)(MEMORY[0x263F00148] + 8));
  [*(id *)(a1 + 40) size];
  [*(id *)(a1 + 32) size];
  UIRectCenteredIntegralRect();
  v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "drawAtPoint:");
}

uint64_t __47___UIDocumentPickerCell_updateForEditingState___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateSeparatorInset];
  v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

void __41___UIDocumentPickerCell_availableActions__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v10 = [*(id *)(a1 + 32) collectionView];
  uint64_t v6 = [v10 serviceViewController];
  if ([v6 shouldShowAction:a2])
  {
    uint64_t v7 = [*(id *)(a1 + 32) item];
    int v8 = [v7 isActionApplicableForItem:a2];

    if (!v8) {
      return;
    }
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = [*(id *)(a1 + 32) actions];
    uint64_t v6 = [v10 objectAtIndex:a3];
    [v9 addObject:v6];
  }
}

@end