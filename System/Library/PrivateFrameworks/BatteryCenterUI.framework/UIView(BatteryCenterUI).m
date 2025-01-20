@interface UIView(BatteryCenterUI)
- (void)observeContentSizeCategoryChange:()BatteryCenterUI;
@end

@implementation UIView(BatteryCenterUI)

- (void)observeContentSizeCategoryChange:()BatteryCenterUI
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  v11[0] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__UIView_BatteryCenterUI__observeContentSizeCategoryChange___block_invoke;
  v9[3] = &unk_1E6BE0C00;
  v9[4] = a1;
  id v10 = v4;
  id v7 = v4;
  id v8 = (id)[a1 registerForTraitChanges:v6 withHandler:v9];
}

@end