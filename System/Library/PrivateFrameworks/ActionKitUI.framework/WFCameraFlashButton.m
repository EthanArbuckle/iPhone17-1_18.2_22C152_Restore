@interface WFCameraFlashButton
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)expanded;
- (BOOL)needsHiding;
- (CGSize)intrinsicContentSize;
- (NSArray)labels;
- (UIImageView)flashView;
- (UILabel)selectedLabel;
- (WFCameraFlashButton)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)flashMode;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setFlashMode:(int64_t)a3;
- (void)setFlashView:(id)a3;
- (void)setLabels:(id)a3;
- (void)setNeedsHiding:(BOOL)a3;
- (void)setSelectedLabel:(id)a3;
@end

@implementation WFCameraFlashButton

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_flashView);
  objc_storeStrong((id *)&self->_selectedLabel, 0);
  objc_storeStrong((id *)&self->_labels, 0);
}

- (void)setNeedsHiding:(BOOL)a3
{
  self->_needsHiding = a3;
}

- (BOOL)needsHiding
{
  return self->_needsHiding;
}

- (BOOL)expanded
{
  return self->_expanded;
}

- (void)setFlashView:(id)a3
{
}

- (UIImageView)flashView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flashView);
  return (UIImageView *)WeakRetained;
}

- (void)setSelectedLabel:(id)a3
{
}

- (UILabel)selectedLabel
{
  return self->_selectedLabel;
}

- (void)setLabels:(id)a3
{
}

- (NSArray)labels
{
  return self->_labels;
}

- (int64_t)flashMode
{
  v2 = [(WFCameraFlashButton *)self selectedLabel];
  int64_t v3 = [v2 tag];

  return v3;
}

- (void)setFlashMode:(int64_t)a3
{
  v5 = [(WFCameraFlashButton *)self labels];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __36__WFCameraFlashButton_setFlashMode___block_invoke;
  v9[3] = &__block_descriptor_40_e23_B32__0__UIView_8Q16_B24l;
  v9[4] = a3;
  uint64_t v6 = [v5 indexOfObjectPassingTest:v9];

  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = [(WFCameraFlashButton *)self labels];
    v8 = [v7 objectAtIndexedSubscript:v6];
    [(WFCameraFlashButton *)self setSelectedLabel:v8];
  }
}

BOOL __36__WFCameraFlashButton_setFlashMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 tag] == *(void *)(a1 + 32);
}

- (void)setExpanded:(BOOL)a3
{
  if (self->_expanded != a3)
  {
    if (a3)
    {
      v5 = (void *)MEMORY[0x263F82E00];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __35__WFCameraFlashButton_setExpanded___block_invoke;
      v10[3] = &unk_264900E20;
      v10[4] = self;
      uint64_t v6 = v10;
    }
    else
    {
      v7 = [(WFCameraFlashButton *)self flashView];
      [v7 frame];
      CGFloat v8 = CGRectGetMaxX(v11) + 5.0;

      v5 = (void *)MEMORY[0x263F82E00];
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __35__WFCameraFlashButton_setExpanded___block_invoke_2;
      v9[3] = &unk_264900DA8;
      v9[4] = self;
      *(CGFloat *)&void v9[5] = v8;
      uint64_t v6 = v9;
    }
    [v5 animateWithDuration:v6 animations:0.200000003];
  }
  self->_expanded = a3;
}

void __35__WFCameraFlashButton_setExpanded___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [*(id *)(a1 + 32) labels];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    long long v12 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    long long v13 = *MEMORY[0x263F000D0];
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        v14[0] = v13;
        v14[1] = v12;
        v14[2] = v11;
        objc_msgSend(v7, "setTransform:", v14, v11, v12, v13);
        [v7 setAlpha:1.0];
        CGFloat v8 = [*(id *)(a1 + 32) selectedLabel];
        int v9 = [v8 isEqual:v7];

        if (v9) {
          [*(id *)(a1 + 32) tintColor];
        }
        else {
        v10 = [MEMORY[0x263F825C8] whiteColor];
        }
        [v7 setTextColor:v10];

        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

void __35__WFCameraFlashButton_setExpanded___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v2 = [*(id *)(a1 + 32) labels];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        CGFloat v8 = [MEMORY[0x263F825C8] whiteColor];
        [v7 setTextColor:v8];

        double v9 = *(double *)(a1 + 40);
        [v7 frame];
        CGFloat MinX = CGRectGetMinX(v21);
        CGAffineTransformMakeTranslation(&v14, v9 - MinX, 0.0);
        CGAffineTransform v13 = v14;
        [v7 setTransform:&v13];
        long long v11 = [*(id *)(a1 + 32) selectedLabel];
        char v12 = [v11 isEqual:v7];

        if ((v12 & 1) == 0) {
          [v7 setAlpha:0.0];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v4);
  }
}

- (CGSize)intrinsicContentSize
{
  double v2 = *MEMORY[0x263F83C20];
  double v3 = 40.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)WFCameraFlashButton;
  BOOL v8 = [(WFCameraFlashButton *)&v21 beginTrackingWithTouch:v6 withEvent:v7];
  if (v8)
  {
    if ([(WFCameraFlashButton *)self expanded])
    {
      [v6 locationInView:self];
      v20.receiver = self;
      v20.super_class = (Class)WFCameraFlashButton;
      -[WFCameraFlashButton hitTest:withEvent:](&v20, sel_hitTest_withEvent_, v7);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        v10 = [(WFCameraFlashButton *)self labels];
        int v11 = [v10 containsObject:v9];

        char v12 = v9;
        if (v11)
        {
          CGAffineTransform v13 = [MEMORY[0x263F825C8] whiteColor];
          CGAffineTransform v14 = [(WFCameraFlashButton *)self selectedLabel];
          [v14 setTextColor:v13];

          [(WFCameraFlashButton *)self setSelectedLabel:v9];
          long long v15 = [(WFCameraFlashButton *)self tintColor];
          long long v16 = [(WFCameraFlashButton *)self selectedLabel];
          [v16 setTextColor:v15];

          [(WFCameraFlashButton *)self setExpanded:0];
          [(WFCameraFlashButton *)self sendActionsForControlEvents:4096];
          char v12 = v9;
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {

        char v12 = 0;
      }
      long long v17 = [(WFCameraFlashButton *)self flashView];
      int v18 = [v9 isEqual:v17];

      if (v18) {
        [(WFCameraFlashButton *)self setExpanded:0];
      }
      goto LABEL_11;
    }
    [(WFCameraFlashButton *)self setExpanded:1];
  }
LABEL_12:

  return v8;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)WFCameraFlashButton;
  -[WFCameraFlashButton hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  uint64_t v5 = (WFCameraFlashButton *)objc_claimAutoreleasedReturnValue();
  if ([(WFCameraFlashButton *)v5 isDescendantOfView:self]) {
    id v6 = self;
  }
  else {
    id v6 = v5;
  }
  id v7 = v6;

  return v7;
}

- (void)didMoveToWindow
{
  v4.receiver = self;
  v4.super_class = (Class)WFCameraFlashButton;
  [(WFCameraFlashButton *)&v4 didMoveToWindow];
  double v3 = [(WFCameraFlashButton *)self window];

  if (v3) {
    [(WFCameraFlashButton *)self setNeedsHiding:1];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)WFCameraFlashButton;
  [(WFCameraFlashButton *)&v4 layoutSubviews];
  if ([(WFCameraFlashButton *)self needsHiding])
  {
    [(WFCameraFlashButton *)self setNeedsHiding:0];
    [(WFCameraFlashButton *)self setExpanded:0];
    v3.receiver = self;
    v3.super_class = (Class)WFCameraFlashButton;
    [(WFCameraFlashButton *)&v3 layoutSubviews];
  }
}

- (WFCameraFlashButton)initWithFrame:(CGRect)a3
{
  v34[3] = *MEMORY[0x263EF8340];
  v33.receiver = self;
  v33.super_class = (Class)WFCameraFlashButton;
  objc_super v3 = -[WFCameraFlashButton initWithFrame:](&v33, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_super v4 = [MEMORY[0x263F825C8] colorWithRed:0.945 green:0.804 blue:0.137 alpha:1.0];
    [(WFCameraFlashButton *)v3 setTintColor:v4];

    id v5 = objc_alloc(MEMORY[0x263F82828]);
    id v6 = [MEMORY[0x263F85308] actionKitImageNamed:@"CameraFlash"];
    id v7 = [v6 UIImage];
    BOOL v8 = (void *)[v5 initWithImage:v7];

    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v8 setContentMode:1];
    LODWORD(v9) = 1148846080;
    [v8 setContentHuggingPriority:0 forAxis:v9];
    [(WFCameraFlashButton *)v3 addSubview:v8];
    [(WFCameraFlashButton *)v3 setFlashView:v8];
    v10 = [MEMORY[0x263F08938] constraintWithItem:v8 attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
    [(WFCameraFlashButton *)v3 addConstraint:v10];

    int v11 = [MEMORY[0x263F08938] constraintWithItem:v8 attribute:1 relatedBy:0 toItem:v3 attribute:1 multiplier:1.0 constant:0.0];
    [(WFCameraFlashButton *)v3 addConstraint:v11];

    char v12 = WFLocalizedString(@"Auto");
    v34[0] = v12;
    CGAffineTransform v13 = WFLocalizedStringWithKey(@"Flash On", @"On");
    v34[1] = v13;
    CGAffineTransform v14 = WFLocalizedString(@"Off");
    v34[2] = v14;
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:3];

    long long v16 = [MEMORY[0x263EFF980] array];
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __37__WFCameraFlashButton_initWithFrame___block_invoke;
    v27[3] = &unk_2648FFEA0;
    id v28 = &unk_26DF64F80;
    long long v17 = v3;
    v29 = v17;
    id v30 = v16;
    id v31 = v8;
    id v32 = v15;
    id v18 = v15;
    id v19 = v8;
    id v20 = v16;
    [v18 enumerateObjectsUsingBlock:v27];
    [(WFCameraFlashButton *)v17 setLabels:v20];
    objc_super v21 = [v20 firstObject];
    [(WFCameraFlashButton *)v17 setSelectedLabel:v21];

    [(WFCameraFlashButton *)v17 setExpanded:1];
    LODWORD(v22) = 1144750080;
    [(WFCameraFlashButton *)v17 setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1144750080;
    [(WFCameraFlashButton *)v17 setContentCompressionResistancePriority:1 forAxis:v23];
    LODWORD(v24) = 1132068864;
    [(WFCameraFlashButton *)v17 setContentHuggingPriority:0 forAxis:v24];
    LODWORD(v25) = 1132068864;
    [(WFCameraFlashButton *)v17 setContentHuggingPriority:1 forAxis:v25];
  }
  return v3;
}

void __37__WFCameraFlashButton_initWithFrame___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = (objc_class *)MEMORY[0x263F828E0];
  id v6 = a2;
  id firstValue = objc_alloc_init(v5);
  [firstValue setUserInteractionEnabled:1];
  [firstValue setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
  [firstValue setFont:v7];

  BOOL v8 = [MEMORY[0x263F825C8] whiteColor];
  [firstValue setTextColor:v8];

  double v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:a3];
  objc_msgSend(firstValue, "setTag:", objc_msgSend(v9, "integerValue"));

  [firstValue setText:v6];
  [*(id *)(a1 + 40) addSubview:firstValue];
  [*(id *)(a1 + 48) addObject:firstValue];
  v10 = _NSDictionaryOfVariableBindings(&cfstr_Label.isa, firstValue, 0);
  int v11 = *(void **)(a1 + 40);
  char v12 = [MEMORY[0x263F08938] constraintsWithVisualFormat:@"V:|[label]|" options:0 metrics:0 views:v10];
  [v11 addConstraints:v12];

  CGAffineTransform v13 = *(void **)(a1 + 40);
  CGAffineTransform v14 = (void *)MEMORY[0x263F08938];
  if (a3)
  {
    long long v15 = [*(id *)(a1 + 48) objectAtIndexedSubscript:a3 - 1];
    long long v16 = [v14 constraintWithItem:firstValue attribute:1 relatedBy:0 toItem:v15 attribute:2 multiplier:1.0 constant:20.0];
    [v13 addConstraint:v16];
  }
  else
  {
    long long v15 = [MEMORY[0x263F08938] constraintWithItem:firstValue attribute:1 relatedBy:0 toItem:*(void *)(a1 + 56) attribute:2 multiplier:1.0 constant:20.0];
    [v13 addConstraint:v15];
  }

  if ([*(id *)(a1 + 64) count] - 1 == a3)
  {
    long long v17 = *(void **)(a1 + 40);
    id v18 = [MEMORY[0x263F08938] constraintWithItem:firstValue attribute:2 relatedBy:0 toItem:v17 attribute:2 multiplier:1.0 constant:0.0];
    [v17 addConstraint:v18];
  }
}

@end