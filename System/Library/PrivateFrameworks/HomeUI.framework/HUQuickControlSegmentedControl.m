@interface HUQuickControlSegmentedControl
- (BOOL)hasCenteredContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)preferVerticalLayout;
- (HUQuickControlSegmentedControl)initWithSegments:(id)a3;
- (NSArray)segmentViews;
- (NSArray)segments;
- (NSNumber)selectedSegmentIndex;
- (NSNumber)trackingSegmentIndex;
- (UILongPressGestureRecognizer)gestureRecognizer;
- (UIStackView)segmentStackView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)selectionChangeHandler;
- (void)_handleGesture:(id)a3;
- (void)_setupConstraints;
- (void)_updateSegmentSelectionStateAnimated:(BOOL)a3;
- (void)_updateSegmentViewsForUILayoutDirection;
- (void)ensureCorrectHeaderViewOrientation;
- (void)layoutSubviews;
- (void)setGestureRecognizer:(id)a3;
- (void)setSegmentStackView:(id)a3;
- (void)setSegmentViews:(id)a3;
- (void)setSelectedSegmentIndex:(id)a3;
- (void)setSelectionChangeHandler:(id)a3;
- (void)setTrackingSegmentIndex:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HUQuickControlSegmentedControl

- (HUQuickControlSegmentedControl)initWithSegments:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HUQuickControlSegmentedControl;
  v5 = [(HUQuickControlSegmentedControl *)&v28 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    segments = v5->_segments;
    v5->_segments = (NSArray *)v6;

    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke;
    v26[3] = &unk_1E6389478;
    v26[4] = v27;
    v8 = objc_msgSend(v4, "na_map:", v26);
    [(HUQuickControlSegmentedControl *)v5 setSegmentViews:v8];

    [(HUQuickControlSegmentedControl *)v5 _updateSegmentViewsForUILayoutDirection];
    id v9 = objc_alloc(MEMORY[0x1E4F42E20]);
    v10 = [(HUQuickControlSegmentedControl *)v5 segmentViews];
    v11 = (void *)[v9 initWithArrangedSubviews:v10];
    [(HUQuickControlSegmentedControl *)v5 setSegmentStackView:v11];

    v12 = [(HUQuickControlSegmentedControl *)v5 segmentStackView];
    [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

    v13 = [(HUQuickControlSegmentedControl *)v5 segmentStackView];
    [v13 setAxis:0];

    v14 = [(HUQuickControlSegmentedControl *)v5 segmentStackView];
    [v14 setDistribution:1];

    v15 = [(HUQuickControlSegmentedControl *)v5 segmentStackView];
    [(HUQuickControlSegmentedControl *)v5 addSubview:v15];

    v16 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:v5 action:sel__handleGesture_];
    [(HUQuickControlSegmentedControl *)v5 setGestureRecognizer:v16];

    v17 = [(HUQuickControlSegmentedControl *)v5 gestureRecognizer];
    [v17 setMinimumPressDuration:0.0];

    v18 = [(HUQuickControlSegmentedControl *)v5 gestureRecognizer];
    [(HUQuickControlSegmentedControl *)v5 addGestureRecognizer:v18];

    +[HUQuickControlSegmentedControlSegment borderInset];
    double v20 = v19;
    v21 = [(HUQuickControlSegmentedControl *)v5 layer];
    [v21 setBorderWidth:v20];

    id v22 = +[HUQuickControlSegmentedControlSegment selectedColor];
    uint64_t v23 = [v22 CGColor];
    v24 = [(HUQuickControlSegmentedControl *)v5 layer];
    [v24 setBorderColor:v23];

    [(HUQuickControlSegmentedControl *)v5 setClipsToBounds:1];
    [(HUQuickControlSegmentedControl *)v5 _setupConstraints];
    _Block_object_dispose(v27, 8);
  }

  return v5;
}

HUQuickControlSegmentedControlSegment *__51__HUQuickControlSegmentedControl_initWithSegments___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke_2;
  aBlock[3] = &unk_1E63852F0;
  aBlock[4] = *(void *)(a1 + 32);
  id v4 = (void (**)(void))_Block_copy(aBlock);
  v5 = objc_alloc_init(HUQuickControlSegmentedControlSegment);
  [(HUQuickControlSegmentedControlSegment *)v5 setTitle:v3];
  [(HUQuickControlSegmentedControlSegment *)v5 setTag:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)];
  if (v4) {
    v4[2](v4);
  }

  return v5;
}

uint64_t __51__HUQuickControlSegmentedControl_initWithSegments___block_invoke_2(uint64_t result)
{
  return result;
}

- (void)setSelectedSegmentIndex:(id)a3
{
  id v5 = a3;
  if (self->_selectedSegmentIndex) {
    selectedSegmentIndex = self->_selectedSegmentIndex;
  }
  else {
    selectedSegmentIndex = (NSNumber *)&unk_1F19B4040;
  }
  id v7 = v5;
  if ((-[NSNumber isEqual:](selectedSegmentIndex, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedSegmentIndex, a3);
    [(HUQuickControlSegmentedControl *)self _updateSegmentSelectionStateAnimated:0];
  }
}

- (void)_handleGesture:(id)a3
{
  id v21 = a3;
  [v21 locationInView:self];
  id v4 = -[HUQuickControlSegmentedControl hitTest:withEvent:](self, "hitTest:withEvent:", 0);
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    uint64_t v6 = v5;
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v7, "tag"));
  }
  else
  {
    v8 = 0;
  }
  uint64_t v9 = [v21 state];
  v10 = v8;
  if ((unint64_t)(v9 - 1) < 2) {
    goto LABEL_21;
  }
  if (v9 != 4)
  {
    if (v9 != 3) {
      goto LABEL_22;
    }
    if (v8)
    {
      id v11 = v8;
    }
    else
    {
      id v11 = [(HUQuickControlSegmentedControl *)self selectedSegmentIndex];
    }
    v12 = v11;
    uint64_t v13 = [(HUQuickControlSegmentedControl *)self selectedSegmentIndex];
    if (v12 == (void *)v13)
    {

      double v20 = v12;
      selectedSegmentIndex = (void (**)(void, void))self->_selectedSegmentIndex;
      self->_selectedSegmentIndex = v20;
    }
    else
    {
      v14 = (void *)v13;
      v15 = [(HUQuickControlSegmentedControl *)self selectedSegmentIndex];
      char v16 = [v12 isEqual:v15];

      objc_storeStrong((id *)&self->_selectedSegmentIndex, v12);
      if (v16) {
        goto LABEL_19;
      }
      v17 = [(HUQuickControlSegmentedControl *)self selectionChangeHandler];

      if (!v17) {
        goto LABEL_19;
      }
      selectedSegmentIndex = [(HUQuickControlSegmentedControl *)self selectionChangeHandler];
      double v19 = [(HUQuickControlSegmentedControl *)self selectedSegmentIndex];
      ((void (**)(void, void *))selectedSegmentIndex)[2](selectedSegmentIndex, v19);
    }
LABEL_19:
  }
  v10 = 0;
LABEL_21:
  [(HUQuickControlSegmentedControl *)self setTrackingSegmentIndex:v10];
  [(HUQuickControlSegmentedControl *)self _updateSegmentSelectionStateAnimated:1];
LABEL_22:
}

- (void)_updateSegmentSelectionStateAnimated:(BOOL)a3
{
  double v3 = 0.15;
  if (!a3) {
    double v3 = 0.0;
  }
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke;
  v4[3] = &unk_1E6386018;
  v4[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3];
}

void __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) segmentViews];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke_2;
  v3[3] = &unk_1E63894A0;
  v3[4] = *(void *)(a1 + 32);
  [v2 enumerateObjectsUsingBlock:v3];
}

void __71__HUQuickControlSegmentedControl__updateSegmentSelectionStateAnimated___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  v8 = [*(id *)(a1 + 32) selectedSegmentIndex];
  objc_msgSend(v6, "setSelected:", objc_msgSend(v7, "isEqual:", v8));

  id v10 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v9 = [*(id *)(a1 + 32) trackingSegmentIndex];
  objc_msgSend(v6, "setHighlighted:", objc_msgSend(v10, "isEqual:", v9));
}

- (void)_updateSegmentViewsForUILayoutDirection
{
  uint64_t v3 = [(HUQuickControlSegmentedControl *)self effectiveUserInterfaceLayoutDirection];
  if (![(HUQuickControlSegmentedControl *)self preferVerticalLayout])
  {
    BOOL v4 = v3 == 1;
    id v5 = [(HUQuickControlSegmentedControl *)self segmentViews];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke;
    v6[3] = &unk_1E63894F0;
    BOOL v7 = v4;
    v6[4] = self;
    [v5 enumerateObjectsUsingBlock:v6];
  }
}

void __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v6 = [*(id *)(a1 + 32) segments];
    a3 = [v6 count] + ~a3;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2;
  v7[3] = &unk_1E63894C8;
  v7[4] = *(void *)(a1 + 32);
  v7[5] = a3;
  [v5 setRoundedCorners:__73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2((uint64_t)v7)];
}

uint64_t __73__HUQuickControlSegmentedControl__updateSegmentViewsForUILayoutDirection__block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (!v1) {
    return 5;
  }
  v2 = [*(id *)(a1 + 32) segments];
  uint64_t v3 = [v2 count] - 1;

  if (v1 == v3) {
    return 10;
  }
  else {
    return 0;
  }
}

- (void)_setupConstraints
{
  id v23 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v3 = [(HUQuickControlSegmentedControl *)self layer];
  [v3 borderWidth];
  double v5 = v4;

  id v6 = [(HUQuickControlSegmentedControl *)self segmentStackView];
  BOOL v7 = [v6 centerXAnchor];
  v8 = [(HUQuickControlSegmentedControl *)self centerXAnchor];
  uint64_t v9 = [v7 constraintEqualToAnchor:v8];
  [v23 addObject:v9];

  id v10 = [(HUQuickControlSegmentedControl *)self segmentStackView];
  id v11 = [v10 centerYAnchor];
  v12 = [(HUQuickControlSegmentedControl *)self centerYAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  [v23 addObject:v13];

  v14 = [(HUQuickControlSegmentedControl *)self segmentStackView];
  v15 = [v14 widthAnchor];
  char v16 = [(HUQuickControlSegmentedControl *)self widthAnchor];
  double v17 = v5 * -2.0;
  v18 = [v15 constraintEqualToAnchor:v16 constant:v17];
  [v23 addObject:v18];

  double v19 = [(HUQuickControlSegmentedControl *)self segmentStackView];
  double v20 = [v19 heightAnchor];
  id v21 = [(HUQuickControlSegmentedControl *)self heightAnchor];
  id v22 = [v20 constraintEqualToAnchor:v21 constant:v17];
  [v23 addObject:v22];

  [MEMORY[0x1E4F28DC8] activateConstraints:v23];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HUQuickControlSegmentedControl;
  [(HUQuickControlSegmentedControl *)&v4 traitCollectionDidChange:a3];
  [(HUQuickControlSegmentedControl *)self _updateSegmentViewsForUILayoutDirection];
}

- (BOOL)preferVerticalLayout
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v3 = [(HUQuickControlSegmentedControl *)self segmentViews];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = *MEMORY[0x1E4F43B90];
    double v8 = *(double *)(MEMORY[0x1E4F43B90] + 8);
    double v9 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "systemLayoutSizeFittingSize:", v7, v8);
        double v9 = v9 + v11;
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    double v9 = 0.0;
  }

  v12 = [(HUQuickControlSegmentedControl *)self superview];
  [v12 bounds];
  BOOL v13 = v9 > CGRectGetWidth(v21);

  return v13;
}

- (void)ensureCorrectHeaderViewOrientation
{
  id v5 = [(HUQuickControlSegmentedControl *)self segmentStackView];
  BOOL v3 = [(HUQuickControlSegmentedControl *)self preferVerticalLayout];
  BOOL v4 = !v3;
  [v5 setAxis:v3];
  [v5 setDistribution:v4];
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSegmentedControl;
  [(HUQuickControlSegmentedControl *)&v6 layoutSubviews];
  [(HUQuickControlSegmentedControl *)self ensureCorrectHeaderViewOrientation];
  [(HUQuickControlSegmentedControl *)self bounds];
  double v4 = v3 * 0.5;
  id v5 = [(HUQuickControlSegmentedControl *)self layer];
  [v5 setCornerRadius:v4];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(HUQuickControlSegmentedControl *)self bounds];
  CGRect v11 = CGRectInset(v10, 0.0, -10.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (-[HUQuickControlSegmentedControl pointInside:withEvent:](self, "pointInside:withEvent:", v7, x, y))
  {
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    double v8 = [(HUQuickControlSegmentedControl *)self segmentViews];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      CGRect v11 = 0;
      uint64_t v12 = *(void *)v21;
      double v13 = 1.79769313e308;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v8);
          }
          long long v15 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          [v15 center];
          UIDistanceBetweenPoints();
          if (v16 < v13)
          {
            double v17 = v16;
            id v18 = v15;

            double v13 = v17;
            CGRect v11 = v18;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v10);
    }
    else
    {
      CGRect v11 = 0;
    }
  }
  else
  {
    CGRect v11 = 0;
  }

  return v11;
}

- (BOOL)hasCenteredContent
{
  return 1;
}

- (id)selectionChangeHandler
{
  return self->_selectionChangeHandler;
}

- (void)setSelectionChangeHandler:(id)a3
{
}

- (NSNumber)selectedSegmentIndex
{
  return self->_selectedSegmentIndex;
}

- (NSArray)segments
{
  return self->_segments;
}

- (UIStackView)segmentStackView
{
  return self->_segmentStackView;
}

- (void)setSegmentStackView:(id)a3
{
}

- (NSArray)segmentViews
{
  return self->_segmentViews;
}

- (void)setSegmentViews:(id)a3
{
}

- (UILongPressGestureRecognizer)gestureRecognizer
{
  return self->_gestureRecognizer;
}

- (void)setGestureRecognizer:(id)a3
{
}

- (NSNumber)trackingSegmentIndex
{
  return self->_trackingSegmentIndex;
}

- (void)setTrackingSegmentIndex:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingSegmentIndex, 0);
  objc_storeStrong((id *)&self->_gestureRecognizer, 0);
  objc_storeStrong((id *)&self->_segmentViews, 0);
  objc_storeStrong((id *)&self->_segmentStackView, 0);
  objc_storeStrong((id *)&self->_segments, 0);
  objc_storeStrong((id *)&self->_selectedSegmentIndex, 0);

  objc_storeStrong(&self->_selectionChangeHandler, 0);
}

@end