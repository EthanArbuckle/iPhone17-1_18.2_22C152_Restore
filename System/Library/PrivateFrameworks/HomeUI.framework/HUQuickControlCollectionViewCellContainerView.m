@interface HUQuickControlCollectionViewCellContainerView
+ (BOOL)requiresConstraintBasedLayout;
+ (double)preferredChromeHeightForTitlePosition:(unint64_t)a3;
+ (id)_titleFont;
- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3;
- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3 titlePosition:(unint64_t)a4;
- (NAUILayoutConstraintSet)constraintSet;
- (NAUILayoutConstraintSet)preferredContentFrameConstraintSet;
- (NSString)title;
- (UIEdgeInsets)preferredContentLayoutFrameInset;
- (UILabel)titleLabel;
- (UILayoutGuide)preferredContentFrameLayoutGuide;
- (UIView)contentView;
- (unint64_t)titlePosition;
- (void)_configureConstraintSets;
- (void)setContentView:(id)a3;
- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3;
- (void)setTitle:(id)a3;
- (void)setTitlePosition:(unint64_t)a3;
- (void)updateConstraints;
@end

@implementation HUQuickControlCollectionViewCellContainerView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

+ (id)_titleFont
{
  v2 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F43880] addingSymbolicTraits:2 options:0];
  v3 = [MEMORY[0x1E4F42A30] fontWithDescriptor:v2 size:0.0];

  return v3;
}

- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3 titlePosition:(unint64_t)a4
{
  result = -[HUQuickControlCollectionViewCellContainerView initWithFrame:](self, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_titlePosition = a4;
  }
  return result;
}

- (HUQuickControlCollectionViewCellContainerView)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)HUQuickControlCollectionViewCellContainerView;
  v3 = -[HUQuickControlCollectionViewCellContainerView initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = v4;

    v6 = [(id)objc_opt_class() _titleFont];
    v7 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v7 setFont:v6];

    v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v9 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v9 setTextColor:v8];

    v10 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v10 setTextAlignment:1];

    v11 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v11 setAdjustsFontSizeToFitWidth:1];

    v12 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v12 setMinimumScaleFactor:0.5];

    v13 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [v13 setAllowsDefaultTighteningForTruncation:1];

    v14 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    LODWORD(v15) = 1148846080;
    [v14 setContentCompressionResistancePriority:1 forAxis:v15];

    v16 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    LODWORD(v17) = 1148846080;
    [v16 setContentHuggingPriority:1 forAxis:v17];

    v18 = [(HUQuickControlCollectionViewCellContainerView *)v3 titleLabel];
    [(HUQuickControlCollectionViewCellContainerView *)v3 naui_addAutoLayoutSubview:v18];

    v19 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
    preferredContentFrameLayoutGuide = v3->_preferredContentFrameLayoutGuide;
    v3->_preferredContentFrameLayoutGuide = v19;

    v21 = [(HUQuickControlCollectionViewCellContainerView *)v3 preferredContentFrameLayoutGuide];
    [(HUQuickControlCollectionViewCellContainerView *)v3 addLayoutGuide:v21];

    [(HUQuickControlCollectionViewCellContainerView *)v3 _configureConstraintSets];
  }
  return v3;
}

- (NSString)title
{
  v2 = [(HUQuickControlCollectionViewCellContainerView *)self titleLabel];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4 = a3;
  v5 = [(HUQuickControlCollectionViewCellContainerView *)self title];
  BOOL v6 = [v5 length] == 0;

  v7 = [(HUQuickControlCollectionViewCellContainerView *)self titleLabel];
  [v7 setText:v4];

  uint64_t v8 = [v4 length];
  if (((v6 ^ (v8 != 0)) & 1) == 0)
  {
    id v9 = [(HUQuickControlCollectionViewCellContainerView *)self constraintSet];
    [v9 invalidate];
  }
}

- (void)setContentView:(id)a3
{
  v5 = (UIView *)a3;
  contentView = self->_contentView;
  id v9 = v5;
  if (contentView != v5)
  {
    [(UIView *)contentView removeFromSuperview];
    objc_storeStrong((id *)&self->_contentView, a3);
    [(HUQuickControlCollectionViewCellContainerView *)self naui_addAutoLayoutSubview:v9];
    [(HUQuickControlCollectionViewCellContainerView *)self bringSubviewToFront:v9];
    v7 = [(HUQuickControlCollectionViewCellContainerView *)self constraintSet];
    [v7 invalidate];

    uint64_t v8 = [(HUQuickControlCollectionViewCellContainerView *)self preferredContentFrameConstraintSet];
    [v8 invalidate];
  }
}

- (void)setPreferredContentLayoutFrameInset:(UIEdgeInsets)a3
{
  if (self->_preferredContentLayoutFrameInset.left != a3.left
    || self->_preferredContentLayoutFrameInset.top != a3.top
    || self->_preferredContentLayoutFrameInset.right != a3.right
    || self->_preferredContentLayoutFrameInset.bottom != a3.bottom)
  {
    self->_preferredContentLayoutFrameInset = a3;
    id v6 = [(HUQuickControlCollectionViewCellContainerView *)self preferredContentFrameConstraintSet];
    [v6 updateConstraintConstants];
  }
}

- (void)setTitlePosition:(unint64_t)a3
{
  BOOL v5 = a3 == 2;
  id v6 = [(HUQuickControlCollectionViewCellContainerView *)self titleLabel];
  [v6 setHidden:v5];

  if (self->_titlePosition != a3)
  {
    self->_titlePosition = a3;
    id v7 = [(HUQuickControlCollectionViewCellContainerView *)self constraintSet];
    [v7 invalidate];
  }
}

- (void)updateConstraints
{
  v3 = [(HUQuickControlCollectionViewCellContainerView *)self constraintSet];
  [v3 activateIfNeeded];

  id v4 = [(HUQuickControlCollectionViewCellContainerView *)self preferredContentFrameConstraintSet];
  [v4 activateIfNeeded];

  v5.receiver = self;
  v5.super_class = (Class)HUQuickControlCollectionViewCellContainerView;
  [(HUQuickControlCollectionViewCellContainerView *)&v5 updateConstraints];
}

- (void)_configureConstraintSets
{
  v3 = (NAUILayoutConstraintSet *)[objc_alloc(MEMORY[0x1E4F7A100]) initWithOwningView:self constraintBuilder:&__block_literal_global_208];
  preferredContentFrameConstraintSet = self->_preferredContentFrameConstraintSet;
  self->_preferredContentFrameConstraintSet = v3;

  objc_super v5 = (NAUILayoutConstraintSet *)[objc_alloc(MEMORY[0x1E4F7A100]) initWithOwningView:self constraintBuilder:&__block_literal_global_57_1];
  constraintSet = self->_constraintSet;
  self->_constraintSet = v5;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke(uint64_t a1, void *a2)
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 contentView];

  if (v3)
  {
    [v2 preferredContentLayoutFrameInset];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v31 = [v2 preferredContentFrameLayoutGuide];
    v30 = [v31 leadingAnchor];
    v29 = [v2 leadingAnchor];
    v28 = [v30 constraintEqualToAnchor:v29 constant:v7];
    v32[0] = v28;
    v27 = [v2 preferredContentFrameLayoutGuide];
    v26 = [v27 trailingAnchor];
    v25 = [v2 trailingAnchor];
    v24 = [v26 constraintEqualToAnchor:v25 constant:-v11];
    v32[1] = v24;
    objc_super v23 = [v2 preferredContentFrameLayoutGuide];
    v22 = [v23 topAnchor];
    v12 = [v2 contentView];
    v13 = [v12 topAnchor];
    v14 = [v22 constraintEqualToAnchor:v13 constant:v5];
    v32[2] = v14;
    double v15 = [v2 preferredContentFrameLayoutGuide];
    v16 = [v15 bottomAnchor];
    double v17 = [v2 contentView];
    v18 = [v17 bottomAnchor];
    v19 = [v16 constraintEqualToAnchor:v18 constant:-v9];
    v32[3] = v19;
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v20;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_2(uint64_t a1, void *a2)
{
  v64[7] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 contentView];

  if (v3)
  {
    double v4 = [v2 title];
    if ([v4 length]) {
      BOOL v47 = [v2 titlePosition] != 2;
    }
    else {
      BOOL v47 = 0;
    }

    double v6 = [v2 contentView];
    double v7 = [v6 leadingAnchor];
    double v8 = [v2 leadingAnchor];
    v48 = [v7 constraintEqualToAnchor:v8];

    double v9 = [v2 contentView];
    double v10 = [v9 trailingAnchor];
    double v11 = [v2 trailingAnchor];
    v45 = [v10 constraintEqualToAnchor:v11];

    v44 = [v2 titleLabel];
    v43 = [v44 leadingAnchor];
    v42 = [v2 leadingAnchor];
    v41 = [v43 constraintEqualToAnchor:v42];
    v64[0] = v41;
    v40 = [v2 titleLabel];
    v39 = [v40 trailingAnchor];
    v38 = [v2 trailingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38];
    v64[1] = v37;
    v64[2] = v48;
    v64[3] = v45;
    v36 = [v2 contentView];
    v35 = [v36 leadingAnchor];
    v34 = [v2 leadingAnchor];
    v12 = [v35 constraintGreaterThanOrEqualToAnchor:v34];
    v64[4] = v12;
    v13 = [v2 contentView];
    v14 = [v13 trailingAnchor];
    double v15 = [v2 trailingAnchor];
    v16 = [v14 constraintLessThanOrEqualToAnchor:v15];
    v64[5] = v16;
    double v17 = [v2 contentView];
    v18 = [v17 centerXAnchor];
    v19 = [v2 centerXAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    v64[6] = v20;
    v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:7];

    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3;
    v59[3] = &unk_1E638F010;
    BOOL v61 = v47;
    id v21 = v2;
    id v60 = v21;
    v22 = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3((uint64_t)v59);
    objc_super v23 = (void *)[v22 mutableCopy];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4;
    v56[3] = &unk_1E638F038;
    BOOL v58 = v47;
    id v24 = v21;
    id v57 = v24;
    v25 = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4((uint64_t)v56);
    [v23 addObject:v25];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5;
    v53[3] = &unk_1E638F038;
    BOOL v55 = v47;
    id v54 = v24;
    v26 = __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5((uint64_t)v53);
    [v23 addObject:v26];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    v62[0] = v48;
    v62[1] = v45;
    v62[2] = v25;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:3];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v49 objects:v63 count:16];
    if (v28)
    {
      uint64_t v30 = v28;
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v30; ++i)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v27);
          }
          LODWORD(v29) = 1111752704;
          [*(id *)(*((void *)&v49 + 1) + 8 * i) setPriority:v29];
        }
        uint64_t v30 = [v27 countByEnumeratingWithState:&v49 objects:v63 count:16];
      }
      while (v30);
    }

    double v5 = [v46 arrayByAddingObjectsFromArray:v23];
  }
  else
  {
    double v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_3(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = [v3 titlePosition];
    double v5 = *(void **)(a1 + 32);
    if (v4 == 1)
    {
      double v6 = [v5 contentView];
      double v7 = [v6 topAnchor];
      double v8 = [*(id *)(a1 + 32) topAnchor];
      double v9 = [v7 constraintEqualToAnchor:v8];
      v20[0] = v9;
      double v10 = [*(id *)(a1 + 32) titleLabel];
      double v11 = [v10 firstBaselineAnchor];
      v12 = [*(id *)(a1 + 32) contentView];
      v13 = [v12 bottomAnchor];
      v14 = [v11 constraintEqualToAnchor:v13 constant:19.0];
      v20[1] = v14;
      double v15 = (void *)MEMORY[0x1E4F1C978];
      v16 = v20;
    }
    else
    {
      double v6 = [v5 titleLabel];
      double v7 = [v6 topAnchor];
      double v8 = [*(id *)(a1 + 32) topAnchor];
      double v9 = [v7 constraintEqualToAnchor:v8];
      double v10 = objc_msgSend(*(id *)(a1 + 32), "contentView", v9);
      double v11 = [v10 topAnchor];
      v12 = [*(id *)(a1 + 32) titleLabel];
      v13 = [v12 lastBaselineAnchor];
      v14 = [v11 constraintEqualToAnchor:v13 constant:12.0];
      v19[1] = v14;
      double v15 = (void *)MEMORY[0x1E4F1C978];
      v16 = v19;
    }
    double v17 = [v15 arrayWithObjects:v16 count:2];
  }
  else
  {
    double v6 = [v3 contentView];
    double v7 = [v6 topAnchor];
    double v8 = [*(id *)(a1 + 32) topAnchor];
    double v9 = [v7 constraintEqualToAnchor:v8];
    v21[0] = v9;
    double v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
  }

  return v17;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) titlePosition])
  {
    int v2 = [*(id *)(a1 + 32) titleLabel];
    uint64_t v3 = [v2 lastBaselineAnchor];
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) contentView];
    uint64_t v3 = [v2 bottomAnchor];
  }
  uint64_t v4 = (void *)v3;
  double v5 = [*(id *)(a1 + 32) bottomAnchor];
  double v6 = [v4 constraintEqualToAnchor:v5];

  return v6;
}

id __73__HUQuickControlCollectionViewCellContainerView__configureConstraintSets__block_invoke_5(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) && [*(id *)(a1 + 32) titlePosition])
  {
    int v2 = [*(id *)(a1 + 32) titleLabel];
    uint64_t v3 = [v2 lastBaselineAnchor];
  }
  else
  {
    int v2 = [*(id *)(a1 + 32) contentView];
    uint64_t v3 = [v2 bottomAnchor];
  }
  uint64_t v4 = (void *)v3;
  double v5 = [*(id *)(a1 + 32) bottomAnchor];
  double v6 = [v4 constraintLessThanOrEqualToAnchor:v5];

  return v6;
}

+ (double)preferredChromeHeightForTitlePosition:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v4 = [a1 _titleFont];
    [v4 descender];
    double v5 = fabs(v7);
    double v6 = 19.0;
    goto LABEL_5;
  }
  double v3 = 0.0;
  if (!a3)
  {
    uint64_t v4 = [a1 _titleFont];
    [v4 ascender];
    double v6 = 12.0;
LABEL_5:
    double v3 = v6 + HURoundToScreenScale(v5);
  }
  return v3;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (unint64_t)titlePosition
{
  return self->_titlePosition;
}

- (UIEdgeInsets)preferredContentLayoutFrameInset
{
  double top = self->_preferredContentLayoutFrameInset.top;
  double left = self->_preferredContentLayoutFrameInset.left;
  double bottom = self->_preferredContentLayoutFrameInset.bottom;
  double right = self->_preferredContentLayoutFrameInset.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UILayoutGuide)preferredContentFrameLayoutGuide
{
  return self->_preferredContentFrameLayoutGuide;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (NAUILayoutConstraintSet)preferredContentFrameConstraintSet
{
  return self->_preferredContentFrameConstraintSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredContentFrameConstraintSet, 0);
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_preferredContentFrameLayoutGuide, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end