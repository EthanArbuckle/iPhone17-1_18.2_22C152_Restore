@interface GKEditActionsView
- (CALayer)maskLayer;
- (GKCollectionViewCell)cell;
- (GKEditActionsView)initWithFrame:(CGRect)a3 cell:(id)a4;
- (NSArray)actionButtons;
- (NSArray)editActionConstraints;
- (double)visibleWidth;
- (void)didTouchEditAction:(id)a3;
- (void)didTouchMoreEditAction:(id)a3;
- (void)prepareActionButtons;
- (void)setActionButtons:(id)a3;
- (void)setCell:(id)a3;
- (void)setEditActionConstraints:(id)a3;
- (void)setMaskLayer:(id)a3;
- (void)setVisibleWidth:(double)a3;
@end

@implementation GKEditActionsView

- (GKEditActionsView)initWithFrame:(CGRect)a3 cell:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9 = (GKCollectionViewCell *)a4;
  v20.receiver = self;
  v20.super_class = (Class)GKEditActionsView;
  v10 = -[GKEditActionsView initWithFrame:](&v20, sel_initWithFrame_, x, y, width, height);
  v12 = v10;
  if (v10)
  {
    LODWORD(v11) = 1148846080;
    [(GKEditActionsView *)v10 setContentHuggingPriority:0 forAxis:v11];
    LODWORD(v13) = 1148846080;
    [(GKEditActionsView *)v12 setContentCompressionResistancePriority:0 forAxis:v13];
    v12->_cell = v9;
    v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskLayer = v12->_maskLayer;
    v12->_maskLayer = v14;

    id v16 = [MEMORY[0x1E4FB1618] blackColor];
    -[CALayer setBackgroundColor:](v12->_maskLayer, "setBackgroundColor:", [v16 CGColor]);

    [(CALayer *)v12->_maskLayer setDelegate:v12];
    v17 = v12->_maskLayer;
    v18 = [(GKEditActionsView *)v12 layer];
    [v18 setMask:v17];

    [(GKEditActionsView *)v12 setVisibleWidth:0.0];
    [(GKEditActionsView *)v12 setUserInteractionEnabled:0];
  }

  return v12;
}

- (void)setVisibleWidth:(double)a3
{
  double v3 = a3;
  if (self->_visibleWidth != a3)
  {
    self->_visibleWidth = a3;
    [(GKEditActionsView *)self bounds];
    CGFloat x = v14.origin.x;
    CGFloat y = v14.origin.y;
    CGFloat width = v14.size.width;
    CGFloat height = v14.size.height;
    double v9 = CGRectGetWidth(v14);
    if (v9 < v3) {
      double v3 = v9;
    }
    v15.origin.CGFloat x = x;
    v15.origin.CGFloat y = y;
    v15.size.CGFloat width = width;
    v15.size.CGFloat height = height;
    double v10 = CGRectGetWidth(v15) - v3;
    v16.origin.CGFloat x = x;
    v16.origin.CGFloat y = y;
    v16.size.CGFloat width = width;
    v16.size.CGFloat height = height;
    double v11 = CGRectGetHeight(v16);
    maskLayer = self->_maskLayer;
    -[CALayer setFrame:](maskLayer, "setFrame:", v10, 0.0, v3, v11);
  }
}

- (void)prepareActionButtons
{
  if (!self->_actionButtons)
  {
    double v3 = [MEMORY[0x1E4F1CA48] array];
    v4 = [(GKCollectionViewCell *)self->_cell editActions];
    uint64_t v16 = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    v18 = __41__GKEditActionsView_prepareActionButtons__block_invoke;
    v19 = &unk_1E5F630F8;
    objc_super v20 = self;
    id v5 = v3;
    id v21 = v5;
    [v4 enumerateObjectsUsingBlock:&v16];

    v6 = [(GKCollectionViewCell *)self->_cell editActions];
    unint64_t v7 = [v6 count];

    if (v7 >= 3)
    {
      v8 = +[GKButton buttonWithType:0];
      double v9 = GKGameCenterUIFrameworkBundle();
      double v10 = GKGetLocalizedStringFromTableInBundle();
      [v8 setTitle:v10 forState:0];

      double v11 = [v8 titleLabel];
      [v11 setNumberOfLines:0];

      v12 = [MEMORY[0x1E4F639F8] textStyle];
      double v13 = [v12 cellActionItem];
      [v8 applyTextStyle:v13];

      CGRect v14 = [MEMORY[0x1E4F639B0] sharedPalette];
      CGRect v15 = [v14 cellActionColor];
      [v8 setBackgroundColor:v15];

      [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      objc_msgSend(v8, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
      [v8 addTarget:self action:sel_didTouchMoreEditAction_ forControlEvents:64];
      [v5 addObject:v8];
    }
    [(GKEditActionsView *)self setActionButtons:v5];
  }
}

void __41__GKEditActionsView_prepareActionButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id v7 = a2;
  id v19 = +[GKButton buttonWithType:0];
  v8 = [v7 name];
  [v19 setTitle:v8 forState:0];

  double v9 = [v19 titleLabel];
  [v9 setNumberOfLines:0];

  double v10 = [MEMORY[0x1E4F639F8] textStyle];
  double v11 = [v10 cellActionItem];
  [v19 applyTextStyle:v11];

  LODWORD(v10) = [v7 destructive];
  v12 = [MEMORY[0x1E4F639B0] sharedPalette];
  double v13 = v12;
  if (v10) {
    [v12 cellActionDestructiveColor];
  }
  else {
  CGRect v14 = [v12 cellActionColor];
  }
  [v19 setBackgroundColor:v14];

  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  objc_msgSend(v19, "setContentEdgeInsets:", 0.0, 9.0, 0.0, 9.0);
  [v19 addTarget:*(void *)(a1 + 32) action:sel_didTouchEditAction_ forControlEvents:64];
  [*(id *)(a1 + 40) addObject:v19];
  CGRect v15 = [*(id *)(*(void *)(a1 + 32) + 424) editActions];
  unint64_t v16 = [v15 count];
  if (a3) {
    BOOL v17 = 0;
  }
  else {
    BOOL v17 = v16 > 2;
  }
  char v18 = v17;
  *a4 = v18;
}

- (void)setActionButtons:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = (NSArray *)a3;
  p_actionButtons = &self->_actionButtons;
  actionButtons = self->_actionButtons;
  if (actionButtons != v5)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    v8 = actionButtons;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          [*(id *)(*((void *)&v31 + 1) + 8 * v12++) removeFromSuperview];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_actionButtons, a3);
    if (self->_editActionConstraints) {
      -[GKEditActionsView removeConstraints:](self, "removeConstraints:");
    }
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    double v13 = *p_actionButtons;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v28;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v28 != v16) {
            objc_enumerationMutation(v13);
          }
          [(GKEditActionsView *)self addSubview:*(void *)(*((void *)&v27 + 1) + 8 * v17++)];
        }
        while (v15 != v17);
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v15);
    }

    char v18 = [MEMORY[0x1E4F1CA48] array];
    id v19 = *p_actionButtons;
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __38__GKEditActionsView_setActionButtons___block_invoke;
    v24 = &unk_1E5F63120;
    id v25 = v18;
    v26 = self;
    id v20 = v18;
    [(NSArray *)v19 enumerateObjectsUsingBlock:&v21];
    -[GKEditActionsView setEditActionConstraints:](self, "setEditActionConstraints:", v20, v21, v22, v23, v24);
    [(GKEditActionsView *)self addConstraints:self->_editActionConstraints];
  }
}

void __38__GKEditActionsView_setActionButtons___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v20 = a2;
  id v5 = *(void **)(a1 + 32);
  v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:8 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:8 multiplier:1.0 constant:0.0];
  [v5 addObject:v6];

  id v7 = *(void **)(a1 + 32);
  v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:3 relatedBy:0 toItem:*(void *)(a1 + 40) attribute:3 multiplier:1.0 constant:0.0];
  [v7 addObject:v8];

  uint64_t v9 = (void *)MEMORY[0x1E4F28DC8];
  uint64_t v11 = *(void **)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  if (a3)
  {
    uint64_t v12 = [*(id *)(v10 + 440) objectAtIndexedSubscript:a3 - 1];
    double v13 = [v9 constraintWithItem:v20 attribute:2 relatedBy:0 toItem:v12 attribute:1 multiplier:1.0 constant:0.0];
    [v11 addObject:v13];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:2 relatedBy:0 toItem:v10 attribute:2 multiplier:1.0 constant:0.0];
    [v11 addObject:v14];
  }
  if ([*(id *)(*(void *)(a1 + 40) + 440) count] - 1 == a3)
  {
    uint64_t v15 = *(void **)(a1 + 32);
    uint64_t v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:*(void *)(a1 + 40) attribute:1 relatedBy:0 toItem:v20 attribute:1 multiplier:1.0 constant:0.0];
    [v15 addObject:v16];
  }
  uint64_t v17 = *(void **)(a1 + 32);
  char v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v20 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:1.0 constant:72.0];
  [v17 addObject:v18];

  LODWORD(v19) = 1148846080;
  [v20 setContentCompressionResistancePriority:0 forAxis:v19];
}

- (void)didTouchEditAction:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_actionButtons indexOfObject:a3];
  id v5 = [(GKCollectionViewCell *)self->_cell editActions];
  v6 = [v5 objectAtIndexedSubscript:v4];
  uint64_t v7 = [v6 selector];

  if (v7)
  {
    [(GKEditActionsView *)self setUserInteractionEnabled:0];
    id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    [v8 _gkSendAction:v7 viaResponder:self withObject:self->_cell];
  }
}

- (void)didTouchMoreEditAction:(id)a3
{
  NSUInteger v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:0];
  id v5 = [(GKCollectionViewCell *)self->_cell editActions];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke;
  v18[3] = &unk_1E5F630F8;
  id v6 = v4;
  id v19 = v6;
  id v20 = self;
  [v5 enumerateObjectsUsingBlock:v18];

  uint64_t v7 = (void *)MEMORY[0x1E4FB1410];
  id v8 = GKGameCenterUIFrameworkBundle();
  uint64_t v9 = GKGetLocalizedStringFromTableInBundle();
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_3;
  v17[3] = &unk_1E5F63170;
  v17[4] = self;
  uint64_t v10 = [v7 actionWithTitle:v9 style:1 handler:v17];
  [v6 addAction:v10];

  uint64_t v11 = [MEMORY[0x1E4FB1438] sharedApplication];
  uint64_t v12 = [v11 delegate];
  double v13 = [v12 window];
  uint64_t v14 = [v13 rootViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v15 = [v14 viewControllers];
    uint64_t v16 = [v15 objectAtIndex:0];

    uint64_t v14 = (void *)v16;
  }
  [v14 presentViewController:v6 animated:1 completion:0];
}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (a3)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    id v8 = (void *)MEMORY[0x1E4FB1410];
    uint64_t v9 = [v5 name];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_2;
    uint64_t v16 = &unk_1E5F63148;
    id v10 = v6;
    uint64_t v11 = *(void *)(a1 + 40);
    id v17 = v10;
    uint64_t v18 = v11;
    uint64_t v12 = [v8 actionWithTitle:v9 style:0 handler:&v13];
    objc_msgSend(v7, "addAction:", v12, v13, v14, v15, v16);
  }
}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_msgSend(v2, "_gkSendAction:viaResponder:withObject:", objc_msgSend(*(id *)(a1 + 32), "selector"), *(void *)(a1 + 40), *(void *)(*(void *)(a1 + 40) + 424));
}

void __44__GKEditActionsView_didTouchMoreEditAction___block_invoke_3(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 _gkSendAction:sel_willDismissActionSheetFromCell_ viaResponder:*(void *)(a1 + 32) withObject:*(void *)(*(void *)(a1 + 32) + 424)];
}

- (double)visibleWidth
{
  return self->_visibleWidth;
}

- (CALayer)maskLayer
{
  return self->_maskLayer;
}

- (void)setMaskLayer:(id)a3
{
}

- (GKCollectionViewCell)cell
{
  return self->_cell;
}

- (void)setCell:(id)a3
{
  self->_cell = (GKCollectionViewCell *)a3;
}

- (NSArray)editActionConstraints
{
  return self->_editActionConstraints;
}

- (void)setEditActionConstraints:(id)a3
{
}

- (NSArray)actionButtons
{
  return self->_actionButtons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionButtons, 0);
  objc_storeStrong((id *)&self->_editActionConstraints, 0);

  objc_storeStrong((id *)&self->_maskLayer, 0);
}

@end