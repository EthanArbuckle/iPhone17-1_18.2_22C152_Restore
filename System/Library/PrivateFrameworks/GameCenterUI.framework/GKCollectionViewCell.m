@interface GKCollectionViewCell
+ (void)registerCellClassesWithCollectionView:(id)a3;
- (BOOL)doesAbutLeftEdge;
- (BOOL)touchWithinEditActions:(id)a3;
- (BOOL)userInteractionEnabledForEditing;
- (CALayer)leftGradientMask;
- (CGRect)alignmentRectForText;
- (GKCollectionViewCell)initWithFrame:(CGRect)a3;
- (GKEditActionsView)editActionsView;
- (GKHairlineView)bottomHairline;
- (GKHairlineView)topHairline;
- (GKStaticRenderContentView)contentRenderView;
- (NSArray)editActions;
- (NSArray)editActionsConstraints;
- (NSArray)hairlineConstraints;
- (NSLayoutConstraint)contentLeftConstraint;
- (UIView)interactiveContentView;
- (UIView)staticContentView;
- (double)contentViewOriginXWhileEditing;
- (double)editActionsVisibleWidth;
- (double)editingContentOriginX;
- (double)leadingMargin;
- (double)trailingMargin;
- (id)popoverSourceView;
- (id)representedItem;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_gkEnumerateSubviewsUsingBlock:(id)a3;
- (void)alignmentRectForText;
- (void)animateOutSwipeToEditAccessories;
- (void)applyGradientMaskIfNeeded;
- (void)applyLayoutAttributes:(id)a3;
- (void)beginEditing;
- (void)closeForDelete;
- (void)finishEditing;
- (void)layoutSubviews;
- (void)prepareEditActionsConstraintsIfNeeded;
- (void)prepareForReuse;
- (void)prepareHairlineConstraintsIfNeeded;
- (void)resetEditingContentOrigin;
- (void)setBottomHairline:(id)a3;
- (void)setContentLeftConstraint:(id)a3;
- (void)setContentRenderView:(id)a3;
- (void)setDoesAbutLeftEdge:(BOOL)a3;
- (void)setEditActions:(id)a3;
- (void)setEditActionsConstraints:(id)a3;
- (void)setEditActionsVisibleWidth:(double)a3;
- (void)setEditingContentOriginX:(double)a3;
- (void)setHairlineConstraints:(id)a3;
- (void)setLeadingMargin:(double)a3;
- (void)setLeftGradientMask:(id)a3;
- (void)setNeedsDisplay;
- (void)setRepresentedItem:(id)a3;
- (void)setShouldDisplaySwipeToEditAccessories:(BOOL)a3;
- (void)setStaticContentView:(id)a3;
- (void)setTopHairline:(id)a3;
- (void)setTrailingMargin:(double)a3;
- (void)setUserInteractionEnabledForEditing:(BOOL)a3;
- (void)shutActionPaneAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateConstraints;
@end

@implementation GKCollectionViewCell

- (GKCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v30.receiver = self;
  v30.super_class = (Class)GKCollectionViewCell;
  v7 = -[GKFocusHighlightingCollectionViewCell initWithFrame:](&v30, sel_initWithFrame_);
  if (v7)
  {
    v8 = -[GKCellSelectedBackgroundView initWithFrame:]([GKCellSelectedBackgroundView alloc], "initWithFrame:", x, y, width, height);
    v9 = [MEMORY[0x1E4F639B0] sharedPalette];
    v10 = [v9 selectedCellBackgroundColor];
    [(GKCellSelectedBackgroundView *)v8 setBackgroundColor:v10];

    [(GKCollectionViewCell *)v7 setSelectedBackgroundView:v8];
    v11 = [(GKCollectionViewCell *)v7 contentView];
    v12 = [GKDetachedContentView alloc];
    [v11 bounds];
    v13 = -[GKDetachedContentView initWithFrame:](v12, "initWithFrame:");
    [(GKDetachedContentView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKDetachedContentView *)v13 setBackgroundColor:0];
    [(GKDetachedContentView *)v13 setOpaque:0];
    v14 = [GKEditActionsView alloc];
    uint64_t v15 = -[GKEditActionsView initWithFrame:cell:](v14, "initWithFrame:cell:", v7, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    editActionsView = v7->_editActionsView;
    v7->_editActionsView = (GKEditActionsView *)v15;

    [(GKEditActionsView *)v7->_editActionsView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = objc_alloc_init(GKStaticRenderContentView);
    contentRenderView = v7->_contentRenderView;
    v7->_contentRenderView = v17;

    [(GKStaticRenderContentView *)v7->_contentRenderView setOpaque:0];
    [(GKStaticRenderContentView *)v7->_contentRenderView setBackgroundColor:0];
    [(GKStaticRenderContentView *)v7->_contentRenderView setContentView:v13];
    [(GKStaticRenderContentView *)v7->_contentRenderView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKDetachedContentView *)v13 setRenderView:v7->_contentRenderView];
    staticContentView = v7->_staticContentView;
    v7->_staticContentView = &v13->super;
    v20 = v13;

    v21 = [(GKCollectionViewCell *)v7 contentView];
    [v21 addSubview:v7->_contentRenderView];

    v22 = [(GKCollectionViewCell *)v7 contentView];
    v23 = (void *)MEMORY[0x1E4F28DC8];
    v24 = v7->_contentRenderView;
    v25 = [(GKCollectionViewCell *)v7 contentView];
    v26 = objc_msgSend(v23, "_gkConstraintsForView:withinView:insets:", v24, v25, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    [v22 addConstraints:v26];

    v27 = +[GKHairlineView hairlineViewForAlignment:0];
    [(GKCollectionViewCell *)v7 setTopHairline:v27];

    [(GKHairlineView *)v7->_topHairline setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKHairlineView *)v7->_topHairline setAlpha:0.0];
    v28 = +[GKHairlineView hairlineViewForAlignment:0];
    [(GKCollectionViewCell *)v7 setBottomHairline:v28];

    [(GKHairlineView *)v7->_bottomHairline setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKHairlineView *)v7->_bottomHairline setAlpha:0.0];

    [v11 setClipsToBounds:1];
  }
  return v7;
}

+ (void)registerCellClassesWithCollectionView:(id)a3
{
}

- (void)_gkEnumerateSubviewsUsingBlock:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKCollectionViewCell;
  id v4 = a3;
  [(GKCollectionViewCell *)&v5 _gkEnumerateSubviewsUsingBlock:v4];
  -[UIView _gkEnumerateSubviewsUsingBlock:](self->_staticContentView, "_gkEnumerateSubviewsUsingBlock:", v4, v5.receiver, v5.super_class);
}

- (id)popoverSourceView
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  id v5 = [MEMORY[0x1E4F639B0] sharedPalette];
  v3 = [v5 selectedCellBackgroundColor];
  id v4 = [(GKCollectionViewCell *)self selectedBackgroundView];
  [v4 setBackgroundColor:v3];
}

- (CGRect)alignmentRectForText
{
  v3 = (NSObject **)MEMORY[0x1E4F63860];
  id v4 = *MEMORY[0x1E4F63860];
  if (!*MEMORY[0x1E4F63860])
  {
    id v5 = (id)GKOSLoggers();
    id v4 = *v3;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(GKCollectionViewCell *)v4 alignmentRectForText];
  }
  double v6 = *MEMORY[0x1E4F1DB28];
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  result.size.double height = v9;
  result.size.double width = v8;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (UIView)interactiveContentView
{
  return (UIView *)self->_contentRenderView;
}

- (double)contentViewOriginXWhileEditing
{
  [(GKEditActionsView *)self->_editActionsView frame];
  double MinX = CGRectGetMinX(v8);
  id v4 = [(GKCollectionViewCell *)self contentView];
  [v4 frame];
  double v6 = MinX - v5;

  return v6;
}

- (double)editActionsVisibleWidth
{
  [(GKEditActionsView *)self->_editActionsView visibleWidth];
  return result;
}

- (void)prepareHairlineConstraintsIfNeeded
{
  if (!self->_hairlineConstraints)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v11 = [(GKCollectionViewCell *)self contentView];
    id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_topHairline attribute:7 relatedBy:0 toItem:v11 attribute:7 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v4];

    double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_topHairline attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v5];

    double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_topHairline attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v6];

    double v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bottomHairline attribute:7 relatedBy:0 toItem:v11 attribute:7 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v7];

    CGRect v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bottomHairline attribute:4 relatedBy:0 toItem:v11 attribute:4 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v8];

    double v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_bottomHairline attribute:5 relatedBy:0 toItem:v11 attribute:5 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v9];

    hairlineConstraints = self->_hairlineConstraints;
    self->_hairlineConstraints = v3;
  }
}

- (void)prepareEditActionsConstraintsIfNeeded
{
  if (!self->_editActionsConstraints)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = [(GKCollectionViewCell *)self contentView];
    id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_editActionsView attribute:10 relatedBy:0 toItem:v9 attribute:10 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v4];

    double v5 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_editActionsView attribute:2 relatedBy:0 toItem:v9 attribute:2 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v5];

    double v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_editActionsView attribute:3 relatedBy:0 toItem:v9 attribute:3 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v6];

    double v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_editActionsView attribute:8 relatedBy:0 toItem:v9 attribute:8 multiplier:1.0 constant:0.0];
    [(NSArray *)v3 addObject:v7];

    editActionsConstraints = self->_editActionsConstraints;
    self->_editActionsConstraints = v3;
  }
}

- (void)setEditActionsVisibleWidth:(double)a3
{
}

- (void)beginEditing
{
  v3 = [(GKCollectionViewCell *)self contentView];
  [v3 addSubview:self->_editActionsView];

  [(GKCollectionViewCell *)self prepareEditActionsConstraintsIfNeeded];
  id v4 = [(GKCollectionViewCell *)self contentView];
  [v4 addConstraints:self->_editActionsConstraints];

  [(GKEditActionsView *)self->_editActionsView prepareActionButtons];

  [(GKCollectionViewCell *)self setShouldDisplaySwipeToEditAccessories:1];
}

- (void)finishEditing
{
  v3 = [(GKCollectionViewCell *)self contentView];
  [v3 removeConstraints:self->_editActionsConstraints];

  [(GKEditActionsView *)self->_editActionsView removeFromSuperview];

  [(GKCollectionViewCell *)self setShouldDisplaySwipeToEditAccessories:0];
}

- (void)animateOutSwipeToEditAccessories
{
}

- (void)setUserInteractionEnabledForEditing:(BOOL)a3
{
}

- (BOOL)userInteractionEnabledForEditing
{
  return [(GKEditActionsView *)self->_editActionsView isUserInteractionEnabled];
}

- (BOOL)touchWithinEditActions:(id)a3
{
  [a3 locationInView:self->_editActionsView];
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  [(GKEditActionsView *)self->_editActionsView bounds];
  uint64_t v12 = v5;
  uint64_t v13 = v7;

  return CGRectContainsPoint(*(CGRect *)&v8, *(CGPoint *)&v12);
}

- (CALayer)leftGradientMask
{
  v21[3] = *MEMORY[0x1E4F143B8];
  v3 = [(GKCollectionViewCell *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  leftGradientMask = self->_leftGradientMask;
  if (!leftGradientMask
    || ([(CALayer *)leftGradientMask frame],
        v24.origin.double x = v5,
        v24.origin.double y = v7,
        v24.size.double width = v9,
        v24.size.double height = v11,
        !CGRectEqualToRect(v23, v24)))
  {
    uint64_t v13 = [MEMORY[0x1E4F39BD0] layer];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);
    id v14 = [MEMORY[0x1E4FB1618] clearColor];
    uint64_t v15 = [v14 CGColor];
    objc_msgSend(MEMORY[0x1E4FB1618], "clearColor", v15);
    id v16 = objc_claimAutoreleasedReturnValue();
    v21[1] = [v16 CGColor];
    id v17 = [MEMORY[0x1E4FB1618] blackColor];
    v21[2] = [v17 CGColor];
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:3];
    [v13 setColors:v18];

    [v13 setLocations:&unk_1F0812628];
    objc_msgSend(v13, "setStartPoint:", 0.0, 0.5);
    objc_msgSend(v13, "setEndPoint:", 0.025, 0.5);
    [(GKCollectionViewCell *)self setLeftGradientMask:v13];
  }
  v19 = self->_leftGradientMask;

  return v19;
}

- (void)applyGradientMaskIfNeeded
{
  BOOL v3 = self->_shouldDisplaySwipeToEditAccessories && !self->_doesAbutLeftEdge;
  double v4 = [(GKCollectionViewCell *)self contentView];
  id v6 = [v4 layer];

  if (v3)
  {
    double v5 = [(GKCollectionViewCell *)self leftGradientMask];
    [v6 setMask:v5];
  }
  else
  {
    [v6 setMask:0];
    [(GKCollectionViewCell *)self setLeftGradientMask:0];
  }
}

- (void)setShouldDisplaySwipeToEditAccessories:(BOOL)a3
{
  if (self->_shouldDisplaySwipeToEditAccessories != a3)
  {
    self->_shouldDisplaySwipeToEditAccessories = a3;
    if (a3)
    {
      double v4 = [(GKCollectionViewCell *)self contentView];
      [v4 addSubview:self->_topHairline];
      [v4 addSubview:self->_bottomHairline];
      [(GKCollectionViewCell *)self prepareHairlineConstraintsIfNeeded];
      [(GKCollectionViewCell *)self addConstraints:self->_hairlineConstraints];
    }
    [(GKCollectionViewCell *)self applyGradientMaskIfNeeded];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke;
    v6[3] = &unk_1E5F62EB0;
    v6[4] = self;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke_2;
    v5[3] = &unk_1E5F63198;
    v5[4] = self;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:v6 animations:v5 completion:0.5];
  }
}

void __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke(uint64_t a1, double a2)
{
  BOOL v3 = *(unsigned char **)(a1 + 32);
  LOBYTE(a2) = v3[688];
  double v4 = (double)*(unint64_t *)&a2;
  double v5 = [v3 topHairline];
  [v5 setAlpha:v4];

  id v6 = *(unsigned char **)(a1 + 32);
  LOBYTE(v7) = v6[688];
  double v8 = (double)v7;
  id v9 = [v6 bottomHairline];
  [v9 setAlpha:v8];
}

uint64_t __63__GKCollectionViewCell_setShouldDisplaySwipeToEditAccessories___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (!*(unsigned char *)(result + 688))
  {
    [(id)result removeConstraints:*(void *)(result + 784)];
    [*(id *)(*(void *)(a1 + 32) + 760) removeFromSuperview];
    BOOL v3 = *(void **)(*(void *)(a1 + 32) + 768);
    return [v3 removeFromSuperview];
  }
  return result;
}

- (void)setDoesAbutLeftEdge:(BOOL)a3
{
  if (self->_doesAbutLeftEdge != a3)
  {
    self->_doesAbutLeftEdge = a3;
    [(GKCollectionViewCell *)self applyGradientMaskIfNeeded];
  }
}

- (void)prepareForReuse
{
  v12.receiver = self;
  v12.super_class = (Class)GKCollectionViewCell;
  [(GKCollectionViewCell *)&v12 prepareForReuse];
  [(GKCollectionViewCell *)self resetEditingContentOrigin];
  id representedItem = self->_representedItem;
  self->_id representedItem = 0;

  double v4 = [(GKCollectionViewCell *)self staticContentView];
  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = [(GKCollectionViewCell *)self staticContentView];
  objc_msgSend(v11, "setFrame:", 0.0, v6, v8, v10);
}

- (void)layoutSubviews
{
  double contentOriginX = self->_contentOriginX;
  [(GKCollectionViewCell *)self bounds];
  double v5 = v4;
  [(GKCollectionViewCell *)self bounds];
  double v7 = v6;
  [(GKCollectionViewCell *)self bounds];
  -[GKStaticRenderContentView setFrame:](self->_contentRenderView, "setFrame:", contentOriginX, v5, v7);
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewCell;
  [(GKCollectionViewCell *)&v8 layoutSubviews];
  [(GKCollectionViewCell *)self applyGradientMaskIfNeeded];
}

- (void)setNeedsDisplay
{
  v3.receiver = self;
  v3.super_class = (Class)GKCollectionViewCell;
  [(GKCollectionViewCell *)&v3 setNeedsDisplay];
  [(GKStaticRenderContentView *)self->_contentRenderView setNeedsDisplay];
}

- (void)setRepresentedItem:(id)a3
{
  id v5 = a3;
  p_id representedItem = &self->_representedItem;
  if (self->_representedItem != v5)
  {
    id v7 = v5;
    objc_storeStrong(p_representedItem, a3);
    [(GKCollectionViewCell *)self didUpdateModel];
    p_id representedItem = (id *)[(GKCollectionViewCell *)self setNeedsDisplay];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_representedItem, v5);
}

- (void)updateConstraints
{
  v13.receiver = self;
  v13.super_class = (Class)GKCollectionViewCell;
  [(GKCollectionViewCell *)&v13 updateConstraints];
  [(GKCollectionViewCell *)self leadingMargin];
  double v4 = v3;
  [(GKCollectionViewCell *)self trailingMargin];
  double v6 = v5;
  id v7 = (void *)MEMORY[0x1E4FB1560];
  objc_super v8 = [(GKCollectionViewCell *)self staticContentView];
  double v9 = [v8 constraints];
  [v7 _gkAdjustConstraintMargins:v9 leading:v4 trailing:v6];

  double v10 = (void *)MEMORY[0x1E4FB1560];
  double v11 = [(GKCollectionViewCell *)self interactiveContentView];
  objc_super v12 = [v11 constraints];
  [v10 _gkAdjustConstraintMargins:v12 leading:v4 trailing:v6];
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKCollectionViewCell;
  [(GKCollectionViewCell *)&v8 applyLayoutAttributes:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    -[GKCollectionViewCell setDoesAbutLeftEdge:](self, "setDoesAbutLeftEdge:", [v5 doesAbutLeftOfCollectionView]);
    [v5 leadingMargin];
    -[GKCollectionViewCell setLeadingMargin:](self, "setLeadingMargin:");
    [v5 trailingMargin];
    double v7 = v6;

    [(GKCollectionViewCell *)self setTrailingMargin:v7];
    [(GKCollectionViewCell *)self setNeedsUpdateConstraints];
  }
}

- (void)closeForDelete
{
  [(UIView *)self->_staticContentView frame];
  [(UIView *)self->_staticContentView setFrame:v3 - v4];
  id v15 = [(GKCollectionViewCell *)self interactiveContentView];
  [v15 frame];
  [v15 setFrame:v5 - v6];
  double v7 = [(GKEditActionsView *)self->_editActionsView maskLayer];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  id v14 = [(GKEditActionsView *)self->_editActionsView maskLayer];
  objc_msgSend(v14, "setFrame:", v9, v11, v13, 0.0);

  [(GKHairlineView *)self->_bottomHairline frame];
  -[GKHairlineView setFrame:](self->_bottomHairline, "setFrame:");
  [(GKCollectionViewCell *)self setAlpha:0.0];
}

- (void)setEditingContentOriginX:(double)a3
{
  if (self->_contentOriginX != a3)
  {
    self->_double contentOriginX = a3;
    CGAffineTransformMakeTranslation(&v7, a3, 0.0);
    contentRenderView = self->_contentRenderView;
    CGAffineTransform v6 = v7;
    [(GKStaticRenderContentView *)contentRenderView setTransform:&v6];
    [(GKCollectionViewCell *)self setEditActionsVisibleWidth:(double)((int)-a3 & ~((int)-a3 >> 31))];
  }
}

- (double)editingContentOriginX
{
  return self->_contentOriginX;
}

- (void)resetEditingContentOrigin
{
}

- (void)shutActionPaneAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5F62EB0;
  aBlock[4] = self;
  CGAffineTransform v7 = _Block_copy(aBlock);
  double v8 = v7;
  if (v4)
  {
    double v9 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke_2;
    v10[3] = &unk_1E5F631C0;
    id v11 = v6;
    [v9 animateWithDuration:v8 animations:v10 completion:0.2];
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

uint64_t __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) resetEditingContentOrigin];
}

uint64_t __58__GKCollectionViewCell_shutActionPaneAnimated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)representedItem
{
  return self->_representedItem;
}

- (UIView)staticContentView
{
  return self->_staticContentView;
}

- (void)setStaticContentView:(id)a3
{
}

- (NSArray)editActions
{
  return self->_editActions;
}

- (void)setEditActions:(id)a3
{
}

- (GKEditActionsView)editActionsView
{
  return self->_editActionsView;
}

- (GKStaticRenderContentView)contentRenderView
{
  return self->_contentRenderView;
}

- (void)setContentRenderView:(id)a3
{
}

- (void)setLeftGradientMask:(id)a3
{
}

- (BOOL)doesAbutLeftEdge
{
  return self->_doesAbutLeftEdge;
}

- (GKHairlineView)topHairline
{
  return self->_topHairline;
}

- (void)setTopHairline:(id)a3
{
}

- (GKHairlineView)bottomHairline
{
  return self->_bottomHairline;
}

- (void)setBottomHairline:(id)a3
{
}

- (NSArray)editActionsConstraints
{
  return self->_editActionsConstraints;
}

- (void)setEditActionsConstraints:(id)a3
{
}

- (NSArray)hairlineConstraints
{
  return self->_hairlineConstraints;
}

- (void)setHairlineConstraints:(id)a3
{
}

- (NSLayoutConstraint)contentLeftConstraint
{
  return self->_contentLeftConstraint;
}

- (void)setContentLeftConstraint:(id)a3
{
}

- (double)leadingMargin
{
  return self->_leadingMargin;
}

- (void)setLeadingMargin:(double)a3
{
  self->_leadingMargin = a3;
}

- (double)trailingMargin
{
  return self->_trailingMargin;
}

- (void)setTrailingMargin:(double)a3
{
  self->_trailingMargin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentLeftConstraint, 0);
  objc_storeStrong((id *)&self->_hairlineConstraints, 0);
  objc_storeStrong((id *)&self->_editActionsConstraints, 0);
  objc_storeStrong((id *)&self->_bottomHairline, 0);
  objc_storeStrong((id *)&self->_topHairline, 0);
  objc_storeStrong((id *)&self->_leftGradientMask, 0);
  objc_storeStrong((id *)&self->_contentRenderView, 0);
  objc_storeStrong((id *)&self->_editActionsView, 0);
  objc_storeStrong((id *)&self->_editActions, 0);
  objc_storeStrong((id *)&self->_staticContentView, 0);

  objc_storeStrong(&self->_representedItem, 0);
}

- (void)alignmentRectForText
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  double v3 = a1;
  BOOL v4 = NSStringFromSelector(a2);
  int v6 = 138412546;
  CGAffineTransform v7 = v4;
  __int16 v8 = 2112;
  id v9 = (id)objc_opt_class();
  id v5 = v9;
  _os_log_debug_impl(&dword_1AF250000, v3, OS_LOG_TYPE_DEBUG, "base %@ invoked for %@", (uint8_t *)&v6, 0x16u);
}

@end