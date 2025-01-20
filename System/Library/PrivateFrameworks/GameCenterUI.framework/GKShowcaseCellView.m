@interface GKShowcaseCellView
+ (BOOL)requiresConstraintBasedLayout;
- (CGRect)alignmentRectForText;
- (GKHairlineView)underlineView;
- (GKShowcaseCellView)initWithFrame:(CGRect)a3;
- (SEL)touchedShowcaseCellAction;
- (UICollectionViewCell)cell;
- (void)prepareForReuse;
- (void)setCell:(id)a3;
- (void)setTouchedShowcaseCellAction:(SEL)a3;
- (void)setUnderlineView:(id)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation GKShowcaseCellView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (GKShowcaseCellView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)GKShowcaseCellView;
  v3 = -[GKShowcaseCellView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(GKHairlineView);
    underlineView = v3->_underlineView;
    v3->_underlineView = v4;

    [(GKHairlineView *)v3->_underlineView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(GKShowcaseCellView *)v3 addSubview:v3->_underlineView];
    v6 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3->_underlineView attribute:4 relatedBy:0 toItem:v3 attribute:4 multiplier:1.0 constant:0.0];
    [(GKShowcaseCellView *)v3 addConstraint:v6];

    v7 = (void *)MEMORY[0x1E4F28DC8];
    v8 = _NSDictionaryOfVariableBindings(&cfstr_Underlineview.isa, v3->_underlineView, 0);
    v9 = [v7 constraintsWithVisualFormat:@"|-(15)-[_underlineView]|" options:0 metrics:0 views:v8];
    [(GKShowcaseCellView *)v3 addConstraints:v9];
  }
  return v3;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GKShowcaseCellView;
  [(GKShowcaseCellView *)&v17 touchesEnded:v6 withEvent:v7];
  p_touchedShowcaseCellAction = &self->_touchedShowcaseCellAction;
  if (self->_touchedShowcaseCellAction)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v9 = v6;
    if ([v9 countByEnumeratingWithState:&v13 objects:v18 count:16])
    {
      v10 = objc_msgSend(MEMORY[0x1E4FB1438], "sharedApplication", v13, v14, v15, v16);
      objc_super v11 = v10;
      if (*p_touchedShowcaseCellAction) {
        SEL v12 = *p_touchedShowcaseCellAction;
      }
      else {
        SEL v12 = 0;
      }
      [v10 _gkSendAction:v12 viaResponder:self withObject:self];
    }
  }
}

- (void)setCell:(id)a3
{
  v5 = (UICollectionViewCell *)a3;
  cell = self->_cell;
  if (cell != v5)
  {
    id v7 = v5;
    [(UICollectionViewCell *)cell removeFromSuperview];
    objc_storeStrong((id *)&self->_cell, a3);
    v5 = v7;
    if (v7)
    {
      cell = (UICollectionViewCell *)[(GKShowcaseCellView *)self addSubview:self->_cell];
      v5 = v7;
    }
  }

  MEMORY[0x1F41817F8](cell, v5);
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)GKShowcaseCellView;
  [(GKShowcaseCellView *)&v3 prepareForReuse];
  [(GKShowcaseCellView *)self setCell:0];
}

- (CGRect)alignmentRectForText
{
  if (objc_opt_respondsToSelector())
  {
    [(UICollectionViewCell *)self->_cell alignmentRectForText];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (UICollectionViewCell)cell
{
  return self->_cell;
}

- (SEL)touchedShowcaseCellAction
{
  if (self->_touchedShowcaseCellAction) {
    return self->_touchedShowcaseCellAction;
  }
  else {
    return 0;
  }
}

- (void)setTouchedShowcaseCellAction:(SEL)a3
{
  if (a3) {
    double v3 = a3;
  }
  else {
    double v3 = 0;
  }
  self->_touchedShowcaseCellAction = v3;
}

- (GKHairlineView)underlineView
{
  return self->_underlineView;
}

- (void)setUnderlineView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlineView, 0);

  objc_storeStrong((id *)&self->_cell, 0);
}

@end