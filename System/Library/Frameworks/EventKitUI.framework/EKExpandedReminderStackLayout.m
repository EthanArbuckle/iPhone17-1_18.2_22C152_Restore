@interface EKExpandedReminderStackLayout
+ (CGSize)itemFittingSizeForCell:(id)a3 withLayoutEnvironment:(id)a4;
+ (double)verticalCellPaddingForPopover;
+ (double)verticalCollectionViewPaddingForPopover;
- (EKExpandedReminderStackLayout)initWithDelegate:(id)a3;
- (EKExpandedReminderStackLayoutDelegate)delegate;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareCellAnimationWithLayoutAttributes:(id)a3 indexPath:(id)a4;
- (void)prepareHeaderAnimationWithLayoutAttributes:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation EKExpandedReminderStackLayout

- (EKExpandedReminderStackLayout)initWithDelegate:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id v6 = objc_storeWeak((id *)p_delegate, v5);
  LOBYTE(p_delegate) = [v5 expandedReminderStackShouldDoCompactLayout];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__EKExpandedReminderStackLayout_initWithDelegate___block_invoke;
  aBlock[3] = &__block_descriptor_33_e71___NSCollectionLayoutSection_24__0q8___NSCollectionLayoutEnvironment__16l;
  char v12 = (char)p_delegate;
  v7 = _Block_copy(aBlock);
  v10.receiver = self;
  v10.super_class = (Class)EKExpandedReminderStackLayout;
  v8 = [(EKExpandedReminderStackLayout *)&v10 initWithSectionProvider:v7];

  return v8;
}

id __50__EKExpandedReminderStackLayout_initWithDelegate___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v29 = +[EKExpandedReminderStackCell exampleCell];
  +[EKExpandedReminderStackLayout itemFittingSizeForCell:withLayoutEnvironment:](EKExpandedReminderStackLayout, "itemFittingSizeForCell:withLayoutEnvironment:");
  uint64_t v6 = [MEMORY[0x1E4FB1308] absoluteDimension:v5];
  v27 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
  v28 = (void *)v6;
  v7 = objc_msgSend(MEMORY[0x1E4FB1338], "sizeWithWidthDimension:heightDimension:");
  uint64_t v8 = [MEMORY[0x1E4FB1328] itemWithLayoutSize:v7];
  v9 = (void *)MEMORY[0x1E4FB1318];
  v26 = (void *)v8;
  v31[0] = v8;
  objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  v11 = [v9 verticalGroupWithLayoutSize:v7 subitems:v10];

  char v12 = [MEMORY[0x1E4FB1330] sectionWithGroup:v11];
  [v12 setInterGroupSpacing:8.0];
  if (*(unsigned char *)(a1 + 32))
  {
    v13 = [v4 container];
    [v13 contentSize];
    double v15 = v14;
    double v17 = v16;

    v18 = +[EKExpandedReminderDateView exampleHeader];
    +[EKExpandedReminderStackLayout itemFittingSizeForCell:v18 withLayoutEnvironment:v4];
    v20 = [MEMORY[0x1E4FB1308] absoluteDimension:v19];
    v21 = [MEMORY[0x1E4FB1308] fractionalWidthDimension:1.0];
    v22 = [MEMORY[0x1E4FB1338] sizeWithWidthDimension:v21 heightDimension:v20];
    v23 = [MEMORY[0x1E4FB12F8] boundarySupplementaryItemWithLayoutSize:v22 elementKind:*MEMORY[0x1E4FB2770] alignment:1];
    v30 = v23;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v30 count:1];
    [v12 setBoundarySupplementaryItems:v24];

    objc_msgSend(v23, "setContentInsets:", v17 * -0.07, 0.0, 0.0, 0.0);
    objc_msgSend(v12, "setContentInsets:", v17 * 0.035, v15 * 0.106, 0.0, v15 * 0.106);
  }
  else
  {
    objc_msgSend(v12, "setContentInsets:", 16.0, 13.0, 16.0, 13.0);
  }

  return v12;
}

+ (CGSize)itemFittingSizeForCell:(id)a3 withLayoutEnvironment:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [a4 container];
  [v6 contentSize];
  double v8 = v7;

  LODWORD(v9) = 1148846080;
  LODWORD(v10) = 1112014848;
  objc_msgSend(v5, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v8, 3.40282347e38, v9, v10);
  double v12 = v11;
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.height = v16;
  result.width = v15;
  return result;
}

+ (double)verticalCellPaddingForPopover
{
  return 8.0;
}

+ (double)verticalCollectionViewPaddingForPopover
{
  return 16.0;
}

- (void)prepareCellAnimationWithLayoutAttributes:(id)a3 indexPath:(id)a4
{
  p_delegate = &self->_delegate;
  id v6 = a4;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained stackedReminderViewFrame];
  objc_msgSend(v9, "setFrame:");

  uint64_t v8 = [v6 row];
  [v9 setZIndex:-v8];
}

- (void)prepareHeaderAnimationWithLayoutAttributes:(id)a3
{
  id v3 = a3;
  CGAffineTransformMakeScale(&v5, 0.7, 0.7);
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
  [v3 setAlpha:0.0];
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  id v4 = a3;
  CGAffineTransform v5 = [(EKExpandedReminderStackLayout *)&v7 initialLayoutAttributesForAppearingItemAtIndexPath:v4];
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  id v4 = a3;
  CGAffineTransform v5 = [(EKExpandedReminderStackLayout *)&v7 finalLayoutAttributesForDisappearingItemAtIndexPath:v4];
  -[EKExpandedReminderStackLayout prepareCellAnimationWithLayoutAttributes:indexPath:](self, "prepareCellAnimationWithLayoutAttributes:indexPath:", v5, v4, v7.receiver, v7.super_class);

  return v5;
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  CGAffineTransform v5 = [(EKExpandedReminderStackLayout *)&v7 initialLayoutAttributesForAppearingSupplementaryElementOfKind:a3 atIndexPath:a4];
  [(EKExpandedReminderStackLayout *)self prepareHeaderAnimationWithLayoutAttributes:v5];

  return v5;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKExpandedReminderStackLayout;
  CGAffineTransform v5 = [(EKExpandedReminderStackLayout *)&v7 finalLayoutAttributesForDisappearingSupplementaryElementOfKind:a3 atIndexPath:a4];
  [(EKExpandedReminderStackLayout *)self prepareHeaderAnimationWithLayoutAttributes:v5];

  return v5;
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  char v9 = objc_opt_isKindOfClass() & 1;
  double v10 = [(EKExpandedReminderStackLayout *)self delegate];
  char v11 = [v10 viewControllerIsDisappearing];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke;
  aBlock[3] = &unk_1E608A308;
  char v19 = v11;
  char v20 = v9;
  id v17 = v7;
  id v18 = v8;
  id v12 = v8;
  id v13 = v7;
  double v14 = _Block_copy(aBlock);

  return v14;
}

void __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48) || !*(unsigned char *)(a1 + 49))
  {
    uint64_t v4 = [MEMORY[0x1E4FB1ED8] expandingStackedRemindersSpringAnimator];
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4FB1ED8] expandingLayoutAttributesStackedRemindersSpringAnimator];
  }
  CGAffineTransform v5 = (void *)v4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2;
  v12[3] = &unk_1E6088358;
  char v15 = *(unsigned char *)(a1 + 49);
  id v13 = *(id *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v5 addAnimations:v12];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  char v9 = __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3;
  double v10 = &unk_1E608A2E0;
  id v11 = v3;
  id v6 = v3;
  [v5 addCompletion:&v7];
  objc_msgSend(v5, "startAnimation", v7, v8, v9, v10);
}

uint64_t __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_2(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    [v3 frame];
    uint64_t v4 = *(void **)(a1 + 32);
    return objc_msgSend(v4, "setFrame:");
  }
  else
  {
    if (v3)
    {
      [v3 transform];
    }
    else
    {
      long long v9 = 0u;
      long long v10 = 0u;
      long long v8 = 0u;
    }
    id v6 = *(void **)(a1 + 32);
    v7[0] = v8;
    v7[1] = v9;
    v7[2] = v10;
    [v6 setTransform:v7];
    [*(id *)(a1 + 40) alpha];
    return objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  }
}

uint64_t __83__EKExpandedReminderStackLayout__animationForReusableView_toLayoutAttributes_type___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (EKExpandedReminderStackLayoutDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EKExpandedReminderStackLayoutDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end