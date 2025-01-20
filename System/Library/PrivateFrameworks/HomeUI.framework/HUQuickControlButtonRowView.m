@interface HUQuickControlButtonRowView
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)hasCenteredContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (HUQuickControlButtonRowView)initWithButtonViews:(id)a3;
- (NSArray)buttonConstraints;
- (NSMutableArray)mutableButtonViews;
- (UIScrollView)scrollView;
- (int64_t)preferredContentAlignment;
- (void)_clearButtonConstraints;
- (void)addButtonView:(id)a3;
- (void)insertButtonView:(id)a3 atIndex:(unint64_t)a4;
- (void)removeButtonView:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setButtonConstraints:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setMutableButtonViews:(id)a3;
- (void)setPreferredContentAlignment:(int64_t)a3;
- (void)setScrollView:(id)a3;
- (void)updateConstraints;
@end

@implementation HUQuickControlButtonRowView

- (void)setPreferredContentAlignment:(int64_t)a3
{
  if (self->_preferredContentAlignment != a3)
  {
    self->_preferredContentAlignment = a3;
    v4 = [(HUQuickControlButtonRowView *)self buttonViews];
    uint64_t v5 = [v4 count];

    if (v5 == 1)
    {
      [(HUQuickControlButtonRowView *)self _clearButtonConstraints];
    }
  }
}

- (HUQuickControlButtonRowView)initWithButtonViews:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlButtonRowView;
  uint64_t v5 = [(HUQuickControlButtonRowView *)&v21 init];
  v6 = v5;
  if (v5)
  {
    v5->_preferredContentAlignment = 3;
    v7 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4F42DB0]);
    scrollView = v6->_scrollView;
    v6->_scrollView = v7;

    [(UIScrollView *)v6->_scrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIScrollView *)v6->_scrollView setAlwaysBounceHorizontal:1];
    [(UIScrollView *)v6->_scrollView setShowsHorizontalScrollIndicator:0];
    [(UIScrollView *)v6->_scrollView setShowsVerticalScrollIndicator:0];
    [(UIScrollView *)v6->_scrollView setDelaysContentTouches:1];
    [(HUQuickControlButtonRowView *)v6 addSubview:v6->_scrollView];
    v9 = objc_opt_new();
    [(HUQuickControlButtonRowView *)v6 setMutableButtonViews:v9];

    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v4;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          -[HUQuickControlButtonRowView addButtonView:](v6, "addButtonView:", *(void *)(*((void *)&v17 + 1) + 8 * v14++), (void)v17);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v12);
    }

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v6 selector:sel__contentSizeCategoryDidChange name:*MEMORY[0x1E4F43788] object:0];
  }
  return v6;
}

- (void)addButtonView:(id)a3
{
  id v4 = a3;
  id v5 = [(HUQuickControlButtonRowView *)self mutableButtonViews];
  -[HUQuickControlButtonRowView insertButtonView:atIndex:](self, "insertButtonView:atIndex:", v4, [v5 count]);
}

- (void)insertButtonView:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  v7 = [(HUQuickControlButtonRowView *)self mutableButtonViews];
  [v7 insertObject:v6 atIndex:a4];

  v8 = [(HUQuickControlButtonRowView *)self scrollView];
  [v8 addSubview:v6];

  [(HUQuickControlButtonRowView *)self _clearButtonConstraints];
}

- (void)removeButtonView:(id)a3
{
  id v4 = a3;
  [v4 removeFromSuperview];
  id v5 = [(HUQuickControlButtonRowView *)self mutableButtonViews];
  [v5 removeObject:v4];

  [(HUQuickControlButtonRowView *)self _clearButtonConstraints];
}

- (void)updateConstraints
{
  id v4 = objc_opt_new();
  id v5 = [(HUQuickControlButtonRowView *)self scrollView];
  id v6 = [v5 topAnchor];
  v7 = [(HUQuickControlButtonRowView *)self topAnchor];
  v8 = [v6 constraintEqualToAnchor:v7];
  [v4 addObject:v8];

  v9 = [(HUQuickControlButtonRowView *)self scrollView];
  id v10 = [v9 bottomAnchor];
  uint64_t v11 = [(HUQuickControlButtonRowView *)self bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  [v4 addObject:v12];

  uint64_t v13 = [(HUQuickControlButtonRowView *)self scrollView];
  uint64_t v14 = [v13 leadingAnchor];
  v15 = [(HUQuickControlButtonRowView *)self leadingAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v4 addObject:v16];

  long long v17 = [(HUQuickControlButtonRowView *)self scrollView];
  long long v18 = [v17 trailingAnchor];
  long long v19 = [(HUQuickControlButtonRowView *)self trailingAnchor];
  long long v20 = [v18 constraintEqualToAnchor:v19];
  [v4 addObject:v20];

  objc_super v21 = [(HUQuickControlButtonRowView *)self buttonViews];
  uint64_t v22 = [v21 count];

  uint64_t v23 = [(HUQuickControlButtonRowView *)self buttonViews];
  v24 = v23;
  if (v22 == 1)
  {
    v25 = [v23 firstObject];

    v26 = [v25 widthAnchor];
    v27 = [(HUQuickControlButtonRowView *)self widthAnchor];
    v28 = [v26 constraintLessThanOrEqualToAnchor:v27];
    [v4 addObject:v28];

    v29 = [v25 topAnchor];
    v30 = [(HUQuickControlButtonRowView *)self topAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    [v4 addObject:v31];

    v32 = [v25 bottomAnchor];
    v33 = [(HUQuickControlButtonRowView *)self bottomAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    [v4 addObject:v34];

    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __48__HUQuickControlButtonRowView_updateConstraints__block_invoke;
    v44[3] = &unk_1E638D438;
    v44[4] = self;
    id v45 = v25;
    SEL v46 = a2;
    id v35 = v25;
    v36 = __48__HUQuickControlButtonRowView_updateConstraints__block_invoke((uint64_t)v44);
    [v4 addObject:v36];
  }
  else
  {
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __48__HUQuickControlButtonRowView_updateConstraints__block_invoke_2;
    v41[3] = &unk_1E638D460;
    id v42 = v4;
    v43 = self;
    [v24 enumerateObjectsUsingBlock:v41];

    id v35 = v42;
  }

  v37 = [(HUQuickControlButtonRowView *)self scrollView];
  v38 = [v37 heightAnchor];
  v39 = [v38 constraintEqualToConstant:30.0];
  [v4 addObject:v39];

  [MEMORY[0x1E4F28DC8] activateConstraints:v4];
  [(HUQuickControlButtonRowView *)self setButtonConstraints:v4];
  v40.receiver = self;
  v40.super_class = (Class)HUQuickControlButtonRowView;
  [(HUQuickControlButtonRowView *)&v40 updateConstraints];
}

id __48__HUQuickControlButtonRowView_updateConstraints__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) preferredContentAlignment];
  if (v2 == 4)
  {
    v3 = [*(id *)(a1 + 40) trailingAnchor];
    uint64_t v4 = [*(id *)(a1 + 32) trailingAnchor];
  }
  else
  {
    if (v2 != 3)
    {
      if (v2 == 1)
      {
        v3 = [*(id *)(a1 + 40) leadingAnchor];
        uint64_t v4 = [*(id *)(a1 + 32) leadingAnchor];
        goto LABEL_8;
      }
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      uint64_t v6 = *(void *)(a1 + 48);
      v7 = *(void **)(a1 + 32);
      v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "preferredContentAlignment"));
      [v5 handleFailureInMethod:v6, v7, @"HUQuickControlButtonRowView.m", 116, @"Unsupported alignment %@", v8 object file lineNumber description];
    }
    v3 = [*(id *)(a1 + 40) centerXAnchor];
    uint64_t v4 = [*(id *)(a1 + 32) centerXAnchor];
  }
LABEL_8:
  v9 = (void *)v4;
  id v10 = [v3 constraintEqualToAnchor:v4];

  return v10;
}

void __48__HUQuickControlButtonRowView_updateConstraints__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v30 = v5;
  if (a3)
  {
    uint64_t v6 = [*(id *)(a1 + 40) buttonViews];
    uint64_t v7 = [v6 count] - 1;

    v8 = [*(id *)(a1 + 40) buttonViews];
    v9 = [v8 objectAtIndexedSubscript:a3 - 1];

    id v10 = *(void **)(a1 + 32);
    uint64_t v11 = [v30 leadingAnchor];
    uint64_t v12 = [v9 trailingAnchor];
    uint64_t v13 = [v11 constraintGreaterThanOrEqualToAnchor:v12 constant:16.0];
    [v10 addObject:v13];

    if (v7 != a3) {
      goto LABEL_6;
    }
    uint64_t v14 = *(void **)(a1 + 32);
    v15 = [v30 trailingAnchor];
    v16 = [*(id *)(a1 + 40) scrollView];
    long long v17 = [v16 trailingAnchor];
    long long v18 = [v15 constraintGreaterThanOrEqualToAnchor:v17 constant:-16.0];
    [v14 addObject:v18];
  }
  else
  {
    long long v19 = *(void **)(a1 + 32);
    v9 = [v5 leadingAnchor];
    v15 = [*(id *)(a1 + 40) scrollView];
    v16 = [v15 leadingAnchor];
    long long v17 = [v9 constraintEqualToAnchor:v16 constant:16.0];
    [v19 addObject:v17];
  }

LABEL_6:
  long long v20 = *(void **)(a1 + 32);
  objc_super v21 = [v30 topAnchor];
  uint64_t v22 = [*(id *)(a1 + 40) scrollView];
  uint64_t v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v20 addObject:v24];

  v25 = *(void **)(a1 + 32);
  v26 = [v30 bottomAnchor];
  v27 = [*(id *)(a1 + 40) scrollView];
  v28 = [v27 bottomAnchor];
  v29 = [v26 constraintEqualToAnchor:v28];
  [v25 addObject:v29];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  uint64_t v6 = self;
  uint64_t v7 = [(HUQuickControlButtonRowView *)self buttonViews];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __53__HUQuickControlButtonRowView_pointInside_withEvent___block_invoke;
  v9[3] = &unk_1E638D488;
  v9[4] = v6;
  *(CGFloat *)&v9[5] = x;
  *(CGFloat *)&v9[6] = y;
  LOBYTE(v6) = objc_msgSend(v7, "na_any:", v9);

  return (char)v6;
}

uint64_t __53__HUQuickControlButtonRowView_pointInside_withEvent___block_invoke(double *a1, void *a2)
{
  uint64_t v2 = (void *)*((void *)a1 + 4);
  double v3 = a1[5];
  double v4 = a1[6];
  id v5 = a2;
  objc_msgSend(v2, "convertPoint:toView:", v5, v3, v4);
  uint64_t v6 = objc_msgSend(v5, "pointInside:withEvent:", 0);

  return v6;
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlButtonRowView;
  -[HUQuickControlButtonRowView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HUQuickControlButtonRowView *)self _updateLayoutIfNecessary];
}

- (void)setBounds:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlButtonRowView;
  -[HUQuickControlButtonRowView setBounds:](&v4, sel_setBounds_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(HUQuickControlButtonRowView *)self _updateLayoutIfNecessary];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (BOOL)hasCenteredContent
{
  double v3 = [(HUQuickControlButtonRowView *)self buttonViews];
  uint64_t v4 = [v3 count];

  if (v4 == 1) {
    return [(HUQuickControlButtonRowView *)self preferredContentAlignment] == 3;
  }
  uint64_t v6 = [(HUQuickControlButtonRowView *)self buttonViews];
  BOOL v5 = (unint64_t)[v6 count] > 2;

  return v5;
}

- (void)_clearButtonConstraints
{
  double v3 = [(HUQuickControlButtonRowView *)self buttonConstraints];

  if (v3)
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v5 = [(HUQuickControlButtonRowView *)self buttonConstraints];
    [v4 deactivateConstraints:v5];

    [(HUQuickControlButtonRowView *)self setButtonConstraints:0];
  }

  [(HUQuickControlButtonRowView *)self setNeedsUpdateConstraints];
}

- (int64_t)preferredContentAlignment
{
  return self->_preferredContentAlignment;
}

- (NSMutableArray)mutableButtonViews
{
  return self->_mutableButtonViews;
}

- (void)setMutableButtonViews:(id)a3
{
}

- (NSArray)buttonConstraints
{
  return self->_buttonConstraints;
}

- (void)setButtonConstraints:(id)a3
{
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (void)setScrollView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_buttonConstraints, 0);

  objc_storeStrong((id *)&self->_mutableButtonViews, 0);
}

@end