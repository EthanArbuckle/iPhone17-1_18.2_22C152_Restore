@interface CNActionsView
+ (int64_t)axisWithTitlesPresent:(BOOL)a3;
- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3;
- (BOOL)enableVisualEffectViewCaptureView;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CNActionsView)initWithFrame:(CGRect)a3;
- (CNActionsViewProtocol)actionsDelegate;
- (NSArray)sortedActionTypes;
- (NSMutableDictionary)actionItemsByType;
- (NSMutableDictionary)actionViewsByType;
- (NUIContainerStackView)containerView;
- (UIColor)posterTintColor;
- (UIFont)titleFont;
- (_UIVisualEffectBackdropView)visualEffectViewCaptureView;
- (double)spacing;
- (id)actionViewForType:(id)a3;
- (int64_t)style;
- (unint64_t)insertionIndexForType:(id)a3;
- (void)addActionItem:(id)a3;
- (void)didPressActionView:(id)a3 longPress:(BOOL)a4;
- (void)removeActionItem:(id)a3;
- (void)resetActions;
- (void)setActionItemsByType:(id)a3;
- (void)setActionViewsByType:(id)a3;
- (void)setActionsDelegate:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setEnableVisualEffectViewCaptureView:(BOOL)a3;
- (void)setPosterTintColor:(id)a3;
- (void)setSortedActionTypes:(id)a3;
- (void)setSpacing:(double)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitleFont:(id)a3;
- (void)setVisualEffectViewCaptureView:(id)a3;
- (void)updateActionItem:(id)a3;
- (void)updateAxis;
@end

@implementation CNActionsView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectViewCaptureView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_posterTintColor, 0);
  objc_storeStrong((id *)&self->_titleFont, 0);
  objc_storeStrong((id *)&self->_actionViewsByType, 0);
  objc_storeStrong((id *)&self->_actionItemsByType, 0);
  objc_storeStrong((id *)&self->_sortedActionTypes, 0);

  objc_destroyWeak((id *)&self->_actionsDelegate);
}

- (void)setEnableVisualEffectViewCaptureView:(BOOL)a3
{
  self->_enableVisualEffectViewCaptureView = a3;
}

- (BOOL)enableVisualEffectViewCaptureView
{
  return self->_enableVisualEffectViewCaptureView;
}

- (_UIVisualEffectBackdropView)visualEffectViewCaptureView
{
  return self->_visualEffectViewCaptureView;
}

- (void)setContainerView:(id)a3
{
}

- (NUIContainerStackView)containerView
{
  return self->_containerView;
}

- (UIColor)posterTintColor
{
  return self->_posterTintColor;
}

- (void)setTitleFont:(id)a3
{
}

- (UIFont)titleFont
{
  return self->_titleFont;
}

- (void)setActionViewsByType:(id)a3
{
}

- (NSMutableDictionary)actionViewsByType
{
  return self->_actionViewsByType;
}

- (void)setActionItemsByType:(id)a3
{
}

- (NSMutableDictionary)actionItemsByType
{
  return self->_actionItemsByType;
}

- (int64_t)style
{
  return self->_style;
}

- (double)spacing
{
  return self->_spacing;
}

- (NSArray)sortedActionTypes
{
  return self->_sortedActionTypes;
}

- (void)setActionsDelegate:(id)a3
{
}

- (CNActionsViewProtocol)actionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionsDelegate);

  return (CNActionsViewProtocol *)WeakRetained;
}

- (BOOL)actionViewShouldPresentDisambiguationUI:(id)a3
{
  id v4 = a3;
  v5 = [(CNActionsView *)self actionItemsByType];
  uint64_t v6 = [v4 type];

  v7 = [v5 objectForKeyedSubscript:v6];

  v8 = [(CNActionsView *)self actionsDelegate];
  LOBYTE(v6) = objc_opt_respondsToSelector();

  if (v6)
  {
    v9 = [(CNActionsView *)self actionsDelegate];
    char v10 = [v9 actionsView:self shouldPresentDisambiguationUIForAction:v7];
  }
  else
  {
    char v10 = 1;
  }

  return v10;
}

- (void)didPressActionView:(id)a3 longPress:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  uint64_t v6 = [(CNActionsView *)self actionItemsByType];
  uint64_t v7 = [v11 type];
  v8 = [v6 objectForKeyedSubscript:v7];

  v9 = [(CNActionsView *)self actionsDelegate];
  LOBYTE(v7) = objc_opt_respondsToSelector();

  if (v7)
  {
    char v10 = [(CNActionsView *)self actionsDelegate];
    [v10 didSelectAction:v8 withSourceView:v11 longPress:v4];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(CNActionsView *)self containerView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v2 = [(CNActionsView *)self containerView];
  objc_msgSend(v2, "effectiveLayoutSizeFittingSize:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setVisualEffectViewCaptureView:(id)a3
{
  double v5 = (_UIVisualEffectBackdropView *)a3;
  if (self->_visualEffectViewCaptureView != v5)
  {
    objc_storeStrong((id *)&self->_visualEffectViewCaptureView, a3);
    double v6 = [(CNActionsView *)self containerView];
    double v7 = [v6 arrangedSubviews];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__CNActionsView_setVisualEffectViewCaptureView___block_invoke;
    v8[3] = &unk_1E549B248;
    double v9 = v5;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __48__CNActionsView_setVisualEffectViewCaptureView___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVisualEffectViewCaptureView:*(void *)(a1 + 32)];
}

- (void)setPosterTintColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_posterTintColor != v5)
  {
    objc_storeStrong((id *)&self->_posterTintColor, a3);
    double v6 = [(CNActionsView *)self containerView];
    double v7 = [v6 arrangedSubviews];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __36__CNActionsView_setPosterTintColor___block_invoke;
    v8[3] = &unk_1E549B248;
    double v9 = v5;
    [v7 enumerateObjectsUsingBlock:v8];
  }
}

uint64_t __36__CNActionsView_setPosterTintColor___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPosterTintColor:*(void *)(a1 + 32)];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  unint64_t v5 = (a3 - 6) & 0xFFFFFFFFFFFFFFFALL;
  double v6 = [(CNActionsView *)self containerView];
  double v7 = [v6 arrangedSubviews];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __26__CNActionsView_setStyle___block_invoke;
  v26[3] = &__block_descriptor_40_e29_v32__0__CNActionView_8Q16_B24l;
  v26[4] = a3;
  [v7 enumerateObjectsUsingBlock:v26];

  +[CNActionView minimumSizeForStyle:a3];
  double v9 = v8;
  double v11 = v10;
  v12 = [(CNActionsView *)self containerView];
  objc_msgSend(v12, "setMinimumLayoutSize:", v9, v11);

  if (v5) {
    [(CNActionsView *)self spacing];
  }
  else {
    double v13 = 8.0;
  }
  [(CNActionsView *)self setSpacing:v13];
  if (a3 == 10)
  {
    v14 = [(CNActionsView *)self visualEffectViewCaptureView];
    if (!v14)
    {
      if (![(CNActionsView *)self enableVisualEffectViewCaptureView])
      {
LABEL_9:
        [(CNActionsView *)self bounds];
        double v18 = v17;
        double v20 = v19;
        double v22 = v21;
        double v24 = v23;
        v25 = [(CNActionsView *)self visualEffectViewCaptureView];
        objc_msgSend(v25, "setBounds:", v18, v20, v22, v24);

        return;
      }
      id v15 = objc_alloc(MEMORY[0x1E4FB23F0]);
      [(CNActionsView *)self bounds];
      v14 = objc_msgSend(v15, "initWithFrame:");
      [v14 setAutoresizingMask:18];
      [(CNActionsView *)self insertSubview:v14 atIndex:0];
      [v14 setRenderMode:1];
      v16 = [v14 captureGroup];
      [v16 setGroupName:@"CNQuickActionsCaptureGroup"];

      [(CNActionsView *)self setVisualEffectViewCaptureView:v14];
    }

    goto LABEL_9;
  }
  [(CNActionsView *)self setVisualEffectViewCaptureView:0];
}

uint64_t __26__CNActionsView_setStyle___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setStyle:*(void *)(a1 + 32)];
}

- (void)setSpacing:(double)a3
{
  if (self->_spacing != a3)
  {
    if (a3 >= 0.0)
    {
      self->_spacing = a3;
      id v8 = [(CNActionsView *)self containerView];
      [v8 setSpacing:a3];
    }
    else
    {
      _CNUILog((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ContactsUI/Framework/CNActionsView.m", 184, 3, @"CNActionView: Spacing specified is < 0, would result in overlapping views. Leaving unchanged.", v3, v4, v5, v6, v10);
    }
  }
}

- (void)resetActions
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(CNActionsView *)self containerView];
  uint64_t v3 = [v2 arrangedSubviews];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) setHidden:1];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)updateAxis
{
  uint64_t v3 = [(CNActionsView *)self containerView];
  uint64_t v4 = [v3 arrangedSubviews];
  uint64_t v5 = objc_msgSend(v4, "_cn_any:", &__block_literal_global_11_62685);

  uint64_t v6 = [(id)objc_opt_class() axisWithTitlesPresent:v5];
  uint64_t v7 = [(CNActionsView *)self containerView];
  uint64_t v8 = [v7 axis];

  if (v6 != v8)
  {
    id v9 = [(CNActionsView *)self containerView];
    [v9 setAxis:v6];
  }
}

BOOL __27__CNActionsView_updateAxis__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isHidden])
  {
    BOOL v3 = 0;
  }
  else
  {
    uint64_t v4 = [v2 title];
    BOOL v3 = v4 != 0;
  }
  return v3;
}

- (void)updateActionItem:(id)a3
{
  id v8 = a3;
  uint64_t v5 = [v8 type];
  uint64_t v6 = [(CNActionsView *)self actionViewForType:v5];

  if ([v6 isHidden])
  {
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"CNActionsView.m", 156, @"If updating an existing action item, the action view can't be hidden" object file lineNumber description];
  }
  sUpdateActionViewWithItem_block_invoke((uint64_t)&__block_literal_global_62691, v6, v8);
}

- (void)removeActionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v8 = [(CNActionsView *)self actionViewForType:v5];

  uint64_t v6 = [(CNActionsView *)self actionItemsByType];
  uint64_t v7 = [v4 type];

  [v6 removeObjectForKey:v7];
  [v8 setHidden:1];
  [(CNActionsView *)self updateAxis];
}

- (void)addActionItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 type];
  id v8 = [(CNActionsView *)self actionViewForType:v5];

  [v8 setActionDelegate:self];
  objc_msgSend(v8, "setStyle:", -[CNActionsView style](self, "style"));
  sUpdateActionViewWithItem_block_invoke((uint64_t)&__block_literal_global_62691, v8, v4);
  uint64_t v6 = [(CNActionsView *)self actionItemsByType];
  uint64_t v7 = [v4 type];
  [v6 setObject:v4 forKeyedSubscript:v7];

  [(CNActionsView *)self updateAxis];
}

- (id)actionViewForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CNActionsView *)self actionViewsByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  if (!v6)
  {
    unint64_t v7 = [(CNActionsView *)self insertionIndexForType:v4];
    id v8 = [(CNActionsView *)self actionViewsByType];
    id v9 = (void *)[v8 mutableCopy];

    uint64_t v6 = objc_alloc_init(CNActionView);
    [(CNActionView *)v6 setHidden:1];
    [v9 setObject:v6 forKeyedSubscript:v4];
    long long v10 = [(CNActionsView *)self titleFont];
    [(CNActionView *)v6 setTitleFont:v10];

    [(CNActionsView *)self setActionViewsByType:v9];
    long long v11 = [(CNActionsView *)self containerView];
    [v11 insertArrangedSubview:v6 atIndex:v7];
  }

  return v6;
}

- (unint64_t)insertionIndexForType:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(CNActionsView *)self sortedActionTypes];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v9 = *(void *)v16;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v5);
      }
      id v11 = *(id *)(*((void *)&v15 + 1) + 8 * v10);
      v12 = [(CNActionsView *)self actionViewsByType];
      uint64_t v13 = [v12 objectForKeyedSubscript:v11];

      if (v13) {
        ++v8;
      }

      if (v11 == v4) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v8 = 0;
  }

  return v8;
}

- (void)setSortedActionTypes:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = (unint64_t)a3;
  sortedActionTypes = self->_sortedActionTypes;
  if (v4 | (unint64_t)sortedActionTypes && ([(NSArray *)sortedActionTypes isEqual:v4] & 1) == 0)
  {
    uint64_t v6 = (NSArray *)[(id)v4 copy];
    uint64_t v7 = self->_sortedActionTypes;
    self->_sortedActionTypes = v6;

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v8 = (id)v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v21;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v20 + 1) + 8 * v12);
          v14 = [(CNActionsView *)self actionViewsByType];
          long long v15 = [v14 objectForKeyedSubscript:v13];

          if (v15)
          {
            long long v16 = [(CNActionsView *)self actionViewsByType];
            [v16 setObject:0 forKeyedSubscript:v13];

            long long v17 = [(CNActionsView *)self containerView];
            [v17 removeArrangedSubview:v15];

            long long v18 = [(CNActionsView *)self containerView];
            objc_msgSend(v18, "insertArrangedSubview:atIndex:", v15, -[CNActionsView insertionIndexForType:](self, "insertionIndexForType:", v13));

            double v19 = [(CNActionsView *)self actionViewsByType];
            [v19 setObject:v15 forKeyedSubscript:v13];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
  }
}

- (CNActionsView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)CNActionsView;
  BOOL v3 = -[CNActionsView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    int v4 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionItemsByType = v3->_actionItemsByType;
    v3->_actionItemsByType = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    actionViewsByType = v3->_actionViewsByType;
    v3->_actionViewsByType = v7;

    double v9 = 8.0;
    if (v4) {
      double v9 = 16.0;
    }
    v3->_spacing = v9;
    id v10 = objc_alloc(MEMORY[0x1E4F4BF00]);
    [(CNActionsView *)v3 bounds];
    uint64_t v11 = objc_msgSend(v10, "initWithFrame:");
    [v11 setAutoresizingMask:18];
    objc_msgSend(v11, "setAxis:", objc_msgSend((id)objc_opt_class(), "axisWithTitlesPresent:", 1));
    [v11 setDistribution:v4 ^ 1u];
    [v11 setSpacing:v3->_spacing];
    [v11 setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview:1];
    +[CNActionView minimumSizeForStyle:[(CNActionsView *)v3 style]];
    objc_msgSend(v11, "setMinimumLayoutSize:");
    [v11 setDelegate:v3];
    containerView = v3->_containerView;
    v3->_containerView = (NUIContainerStackView *)v11;
    id v13 = v11;

    [(CNActionsView *)v3 setInsetsLayoutMarginsFromSafeArea:0];
    [v13 setInsetsLayoutMarginsFromSafeArea:0];
    [(CNActionsView *)v3 addSubview:v13];
  }
  return v3;
}

+ (int64_t)axisWithTitlesPresent:(BOOL)a3
{
  if (a3) {
    return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  }
  else {
    return 0;
  }
}

@end