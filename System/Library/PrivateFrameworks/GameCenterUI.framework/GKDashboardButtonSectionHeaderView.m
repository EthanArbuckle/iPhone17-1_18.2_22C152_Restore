@interface GKDashboardButtonSectionHeaderView
+ (CGSize)platformSizeForTitle:(id)a3;
+ (CGSize)platformSizeForTitle:(id)a3 buttonTitle:(id)a4;
+ (double)defaultHeight;
+ (double)widthForTitle:(id)a3;
+ (double)widthForTitle:(id)a3 buttonTitle:(id)a4;
- (BOOL)isButtonHidden;
- (CGSize)intrinsicContentSize;
- (NSAttributedString)attributedButtonTitle;
- (NSLayoutConstraint)rightMarginConstraint;
- (NSString)buttonTitle;
- (SEL)buttonAction;
- (UIButton)button;
- (UIFocusGuide)focusGuide;
- (UIMenu)buttonMenu;
- (UIStackView)stackView;
- (UIView)backgroundPlatterView;
- (id)buttonTarget;
- (void)awakeFromNib;
- (void)buttonPressed:(id)a3;
- (void)prepareForReuse;
- (void)setAttributedButtonTitle:(id)a3;
- (void)setBackgroundPlatterView:(id)a3;
- (void)setButton:(id)a3;
- (void)setButtonAction:(SEL)a3;
- (void)setButtonHidden:(BOOL)a3;
- (void)setButtonMenu:(id)a3;
- (void)setButtonTarget:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setFocusGuide:(id)a3;
- (void)setRightMarginConstraint:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation GKDashboardButtonSectionHeaderView

+ (double)defaultHeight
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___GKDashboardButtonSectionHeaderView;
  objc_msgSendSuper2(&v8, sel_defaultHeight);
  double v3 = v2;
  v4 = [MEMORY[0x1E4FB1E20] currentTraitCollection];
  v5 = [v4 preferredContentSizeCategory];

  if (UIContentSizeCategoryIsAccessibilityCategory((UIContentSizeCategory)v5))
  {
    if ([v5 isEqualToString:*MEMORY[0x1E4FB2778]])
    {
      double v6 = 3.1;
LABEL_10:
      double v3 = v3 * v6;
      goto LABEL_11;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FB2780]])
    {
      double v6 = 2.75;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FB2788]])
    {
      double v6 = 2.35;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FB2790]])
    {
      double v6 = 1.9;
      goto LABEL_10;
    }
    if ([v5 isEqualToString:*MEMORY[0x1E4FB2798]]) {
      double v3 = v3 * 1.6;
    }
  }
LABEL_11:

  return v3;
}

+ (double)widthForTitle:(id)a3
{
  [a1 widthForTitle:a3 buttonTitle:0];
  return result;
}

+ (CGSize)platformSizeForTitle:(id)a3
{
  [a1 platformSizeForTitle:a3 buttonTitle:0];
  result.height = v4;
  result.width = v3;
  return result;
}

+ (double)widthForTitle:(id)a3 buttonTitle:(id)a4
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__GKDashboardButtonSectionHeaderView_widthForTitle_buttonTitle___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  uint64_t v5 = widthForTitle_buttonTitle__onceToken;
  double v6 = (__CFString *)a4;
  id v7 = a3;
  if (v5 != -1) {
    dispatch_once(&widthForTitle_buttonTitle__onceToken, block);
  }
  [(id)widthForTitle_buttonTitle__sSectionHeaderView setTitle:v7];

  if (v6) {
    objc_super v8 = v6;
  }
  else {
    objc_super v8 = &stru_1F07B2408;
  }
  [(id)widthForTitle_buttonTitle__sSectionHeaderView setButtonTitle:v8];

  [(id)widthForTitle_buttonTitle__sSectionHeaderView intrinsicContentSize];
  return result;
}

uint64_t __64__GKDashboardButtonSectionHeaderView_widthForTitle_buttonTitle___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _gkViewFromNib];
  uint64_t v2 = widthForTitle_buttonTitle__sSectionHeaderView;
  widthForTitle_buttonTitle__sSectionHeaderView = v1;

  return MEMORY[0x1F41817F8](v1, v2);
}

+ (CGSize)platformSizeForTitle:(id)a3 buttonTitle:(id)a4
{
  double v4 = *MEMORY[0x1E4F1DB30];
  objc_msgSend(a1, "defaultHeight", a3, a4);
  double v6 = v5;
  double v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)awakeFromNib
{
  v11[1] = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)GKDashboardButtonSectionHeaderView;
  [(GKDashboardSectionHeaderView *)&v10 awakeFromNib];
  [(UIButton *)self->_button addTarget:self action:sel_buttonPressed_ forControlEvents:0x2000];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1780]);
  [(GKDashboardButtonSectionHeaderView *)self setFocusGuide:v3];

  double v4 = [(GKDashboardButtonSectionHeaderView *)self focusGuide];
  [(GKDashboardButtonSectionHeaderView *)self addLayoutGuide:v4];

  double v5 = [(GKDashboardButtonSectionHeaderView *)self button];
  v11[0] = v5;
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  double v7 = [(GKDashboardButtonSectionHeaderView *)self focusGuide];
  [v7 setPreferredFocusEnvironments:v6];

  objc_super v8 = (void *)MEMORY[0x1E4F28DC8];
  v9 = [(GKDashboardButtonSectionHeaderView *)self focusGuide];
  [v8 _gkInstallEdgeConstraintsForLayoutGuide:v9 containedWithinParentView:self];
}

- (void)setButtonHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(GKDashboardButtonSectionHeaderView *)self button];
  [v4 setHidden:v3];
}

- (void)setButtonTitle:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__GKDashboardButtonSectionHeaderView_setButtonTitle___block_invoke;
  v7[3] = &unk_1E5F63350;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:v7];
}

void __53__GKDashboardButtonSectionHeaderView_setButtonTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) button];
  [v2 setTitle:*(void *)(a1 + 40) forState:0];

  id v3 = [*(id *)(a1 + 32) button];
  [v3 layoutIfNeeded];
}

- (void)setAttributedButtonTitle:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  objc_super v10 = __63__GKDashboardButtonSectionHeaderView_setAttributedButtonTitle___block_invoke;
  v11 = &unk_1E5F63350;
  v12 = self;
  id v13 = v4;
  id v6 = v4;
  [v5 performWithoutAnimation:&v8];
  double v7 = [(GKDashboardButtonSectionHeaderView *)self button];
  [v7 setAccessibilityIdentifier:@"GKDashBoardButtonSectionHeaderView.ButtonTitle"];
}

void __63__GKDashboardButtonSectionHeaderView_setAttributedButtonTitle___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) button];
  [v2 setAttributedTitle:*(void *)(a1 + 40) forState:0];

  id v3 = [*(id *)(a1 + 32) button];
  [v3 layoutIfNeeded];
}

- (void)setButtonMenu:(id)a3
{
  id v4 = a3;
  double v5 = [(GKDashboardButtonSectionHeaderView *)self button];
  [v5 setMenu:v4];

  id v6 = [(GKDashboardButtonSectionHeaderView *)self button];
  [v6 setContextMenuIsPrimary:v4 != 0];
}

- (UIMenu)buttonMenu
{
  uint64_t v2 = [(GKDashboardButtonSectionHeaderView *)self button];
  id v3 = [v2 menu];

  return (UIMenu *)v3;
}

- (NSString)buttonTitle
{
  return [(UIButton *)self->_button titleForState:0];
}

- (CGSize)intrinsicContentSize
{
  v18.receiver = self;
  v18.super_class = (Class)GKDashboardButtonSectionHeaderView;
  [(GKDashboardSectionHeaderView *)&v18 intrinsicContentSize];
  double v4 = v3;
  double v6 = v5;
  [(UIButton *)self->_button intrinsicContentSize];
  double v8 = v7;
  double v10 = v9;
  v11 = [(GKDashboardButtonSectionHeaderView *)self stackView];
  [v11 spacing];
  double v13 = v8 + v12;
  [(NSLayoutConstraint *)self->_rightMarginConstraint constant];
  double v15 = v4 + v13 + v14;

  if (v6 >= v10) {
    double v16 = v6;
  }
  else {
    double v16 = v10;
  }
  double v17 = v15;
  result.height = v16;
  result.width = v17;
  return result;
}

- (void)buttonPressed:(id)a3
{
  id v4 = a3;
  id buttonTarget = self->_buttonTarget;
  if (buttonTarget)
  {
    SEL buttonAction = self->_buttonAction;
    if (buttonAction)
    {
      id v7 = v4;
      id buttonTarget = (id)[buttonTarget performSelector:buttonAction withObject:v4];
      id v4 = v7;
    }
  }

  MEMORY[0x1F41817F8](buttonTarget, v4);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKDashboardButtonSectionHeaderView;
  [(GKDashboardButtonSectionHeaderView *)&v3 prepareForReuse];
  [(GKDashboardButtonSectionHeaderView *)self setButtonTarget:0];
  [(GKDashboardButtonSectionHeaderView *)self setButtonAction:0];
  [(GKDashboardButtonSectionHeaderView *)self setButtonMenu:0];
}

- (NSAttributedString)attributedButtonTitle
{
  return self->_attributedButtonTitle;
}

- (id)buttonTarget
{
  return self->_buttonTarget;
}

- (void)setButtonTarget:(id)a3
{
  self->_id buttonTarget = a3;
}

- (SEL)buttonAction
{
  return self->_buttonAction;
}

- (void)setButtonAction:(SEL)a3
{
  self->_SEL buttonAction = a3;
}

- (BOOL)isButtonHidden
{
  return self->_buttonHidden;
}

- (UIView)backgroundPlatterView
{
  return self->_backgroundPlatterView;
}

- (void)setBackgroundPlatterView:(id)a3
{
  self->_backgroundPlatterView = (UIView *)a3;
}

- (UIButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
  self->_button = (UIButton *)a3;
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  self->_stackView = (UIStackView *)a3;
}

- (NSLayoutConstraint)rightMarginConstraint
{
  return self->_rightMarginConstraint;
}

- (void)setRightMarginConstraint:(id)a3
{
  self->_rightMarginConstraint = (NSLayoutConstraint *)a3;
}

- (UIFocusGuide)focusGuide
{
  return self->_focusGuide;
}

- (void)setFocusGuide:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusGuide, 0);

  objc_storeStrong((id *)&self->_attributedButtonTitle, 0);
}

@end