@interface EKUITableViewCell
+ (BOOL)vibrant;
+ (double)rowSeparatorThickness;
+ (id)reuseIdentifier;
- (BOOL)disableSelectedBackground;
- (BOOL)drawsOwnRowSeparators;
- (BOOL)usesInsetMargin;
- (EKUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIColor)rowSeparatorColor;
- (UIVisualEffect)rowSeparatorVisualEffect;
- (id)separatorParentView;
- (id)separatorView;
- (unint64_t)separatorEdges;
- (void)_layoutSeparator;
- (void)_setMarginExtendsToFullWidth:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDisableSelectedBackground:(BOOL)a3;
- (void)setDrawsOwnRowSeparators:(BOOL)a3;
- (void)setRowSeparatorColor:(id)a3;
- (void)setRowSeparatorVisualEffect:(id)a3;
- (void)setSeparatorEdges:(unint64_t)a3;
- (void)setUsesInsetMargin:(BOOL)a3;
- (void)updateConfigurationUsingState:(id)a3;
- (void)updateRowSeparators;
@end

@implementation EKUITableViewCell

+ (id)reuseIdentifier
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__EKUITableViewCell_reuseIdentifier__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (reuseIdentifier_onceToken_1 != -1) {
    dispatch_once(&reuseIdentifier_onceToken_1, block);
  }
  v2 = (void *)reuseIdentifier_reuseIdentifier_1;

  return v2;
}

void __36__EKUITableViewCell_reuseIdentifier__block_invoke()
{
  v0 = (objc_class *)objc_opt_class();
  uint64_t v1 = NSStringFromClass(v0);
  v2 = (void *)reuseIdentifier_reuseIdentifier_1;
  reuseIdentifier_reuseIdentifier_1 = v1;
}

+ (double)rowSeparatorThickness
{
  return 1.0 / EKUIScaleFactor();
}

+ (BOOL)vibrant
{
  return 0;
}

- (EKUITableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)EKUITableViewCell;
  v4 = [(EKUITableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(EKUITableViewCell *)v4 setSeparatorEdges:4];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)EKUITableViewCell;
  [(EKUITableViewCell *)&v3 layoutSubviews];
  [(EKUITableViewCell *)self _layoutSeparator];
}

- (void)_layoutSeparator
{
  if (self->_bottomSeparatorViewForNonOpaqueTables)
  {
    [(id)objc_opt_class() rowSeparatorThickness];
    double v4 = v3;
    [(EKUITableViewCell *)self bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    BOOL v11 = [(EKUITableViewCell *)self usesInsetMargin];
    double v12 = 15.0;
    if (!v11)
    {
      [(EKUITableViewCell *)self separatorInset];
      if (v13 > 0.0)
      {
        if (CalInterfaceIsLeftToRight())
        {
          [(EKUITableViewCell *)self separatorInset];
          double v6 = v6 + v14;
        }
        [(EKUITableViewCell *)self separatorInset];
        double v8 = v8 - v15;
      }
      [(EKUITableViewCell *)self separatorInset];
      if (v16 > 0.0)
      {
        if ((CalInterfaceIsLeftToRight() & 1) == 0)
        {
          [(EKUITableViewCell *)self separatorInset];
          double v6 = v6 + v17;
        }
        [(EKUITableViewCell *)self separatorInset];
        double v8 = v8 - v18;
      }
      double v12 = v6;
    }
    -[RowSeparatorView setFrame:](self->_bottomSeparatorViewForNonOpaqueTables, "setFrame:", v12, v10 - v4, v8, v4);
  }
  if (self->_topSeparatorViewForNonOpaqueTables)
  {
    [(EKUITableViewCell *)self bounds];
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    [(id)objc_opt_class() rowSeparatorThickness];
    double v26 = v25;
    if (CalInterfaceIsLeftToRight())
    {
      [(EKUITableViewCell *)self safeAreaInsets];
      double v28 = v27;
      [(EKUITableViewCell *)self _contentMargin];
      double v20 = v28 + v29;
    }
    else
    {
      [(EKUITableViewCell *)self safeAreaInsets];
      double v31 = v30;
      [(EKUITableViewCell *)self _contentMargin];
      double v24 = v24 - (v31 + v32);
    }
    topSeparatorViewForNonOpaqueTables = self->_topSeparatorViewForNonOpaqueTables;
    -[RowSeparatorView setFrame:](topSeparatorViewForNonOpaqueTables, "setFrame:", v20, v22, v24, v26);
  }
}

- (void)setUsesInsetMargin:(BOOL)a3
{
  self->_usesInsetMargin = a3;
  [(EKUITableViewCell *)self _setMarginExtendsToFullWidth:!a3];
}

- (void)setRowSeparatorColor:(id)a3
{
  id v8 = a3;
  p_rowSeparatorColor = &self->_rowSeparatorColor;
  objc_storeStrong((id *)&self->_rowSeparatorColor, a3);
  bottomSeparatorViewForNonOpaqueTables = self->_bottomSeparatorViewForNonOpaqueTables;
  if (bottomSeparatorViewForNonOpaqueTables) {
    [(RowSeparatorView *)bottomSeparatorViewForNonOpaqueTables setBackgroundColor:*p_rowSeparatorColor];
  }
  topSeparatorViewForNonOpaqueTables = self->_topSeparatorViewForNonOpaqueTables;
  if (topSeparatorViewForNonOpaqueTables) {
    [(RowSeparatorView *)topSeparatorViewForNonOpaqueTables setBackgroundColor:*p_rowSeparatorColor];
  }
}

- (void)setRowSeparatorVisualEffect:(id)a3
{
  p_rowSeparatorVisualEffect = &self->_rowSeparatorVisualEffect;
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, a3);
  id v6 = a3;
  [(UIVisualEffectView *)self->_bottomRowSeparatorParentView setEffect:*p_rowSeparatorVisualEffect];
  [(UIVisualEffectView *)self->_topRowSeparatorParentView setEffect:*p_rowSeparatorVisualEffect];
}

- (id)separatorParentView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  [(EKUITableViewCell *)self bounds];
  double v4 = objc_msgSend(v3, "initWithFrame:");
  [v4 setAutoresizingMask:18];
  double v5 = [MEMORY[0x1E4FB1618] clearColor];
  [v4 setBackgroundColor:v5];

  return v4;
}

- (id)separatorView
{
  id v3 = objc_alloc_init(RowSeparatorView);
  -[RowSeparatorView setVibrant:](v3, "setVibrant:", [(id)objc_opt_class() vibrant]);
  if ([(id)objc_opt_class() vibrant])
  {
    double v4 = [(UIVisualEffectView *)self->_bottomRowSeparatorParentView contentView];
    uint64_t v5 = [v4 tintColor];
  }
  else
  {
    double v4 = [(EKUITableViewCell *)self rowSeparatorColor];
    if (v4) {
      [(EKUITableViewCell *)self rowSeparatorColor];
    }
    else {
    uint64_t v5 = [MEMORY[0x1E4FB1618] separatorColor];
    }
  }
  id v6 = (void *)v5;
  [(RowSeparatorView *)v3 setBackgroundColor:v5];

  return v3;
}

- (void)updateRowSeparators
{
  if (self->_drawsOwnRowSeparators)
  {
    unint64_t v2 = (self->_separatorEdges >> 2) & 1;
    unint64_t v3 = self->_separatorEdges & 1;
  }
  else
  {
    LODWORD(v2) = 0;
    LODWORD(v3) = 0;
  }
  double v4 = self;
  id v24 = v4;
  uint64_t v5 = v4;
  if ([(id)objc_opt_class() vibrant])
  {
    id v24 = v4;
    if (v2 && (id v24 = v4, !v4->_bottomRowSeparatorParentView))
    {
      uint64_t v8 = [(EKUITableViewCell *)v4 separatorParentView];
      bottomRowSeparatorParentView = v4->_bottomRowSeparatorParentView;
      v4->_bottomRowSeparatorParentView = (UIVisualEffectView *)v8;

      uint64_t v10 = [(EKUITableViewCell *)v4 rowSeparatorVisualEffect];
      rowSeparatorVisualEffect = v4->_rowSeparatorVisualEffect;
      v4->_rowSeparatorVisualEffect = (UIVisualEffect *)v10;

      id v24 = [(UIVisualEffectView *)v4->_bottomRowSeparatorParentView contentView];

      [(EKUITableViewCell *)v4 addSubview:v4->_bottomRowSeparatorParentView];
      if (v3)
      {
LABEL_8:
        if (!v4->_topRowSeparatorParentView)
        {
          uint64_t v6 = [(EKUITableViewCell *)v4 separatorParentView];
          topRowSeparatorParentView = v4->_topRowSeparatorParentView;
          v4->_topRowSeparatorParentView = (UIVisualEffectView *)v6;

          uint64_t v5 = [(UIVisualEffectView *)v4->_topRowSeparatorParentView contentView];

          [(EKUITableViewCell *)v4 addSubview:v4->_topRowSeparatorParentView];
          goto LABEL_12;
        }
      }
    }
    else if (v3)
    {
      goto LABEL_8;
    }
    uint64_t v5 = v4;
  }
LABEL_12:
  bottomSeparatorViewForNonOpaqueTables = v4->_bottomSeparatorViewForNonOpaqueTables;
  if (v2)
  {
    if (!bottomSeparatorViewForNonOpaqueTables)
    {
      uint64_t v13 = [(EKUITableViewCell *)v4 separatorView];
      double v14 = v4->_bottomSeparatorViewForNonOpaqueTables;
      v4->_bottomSeparatorViewForNonOpaqueTables = (RowSeparatorView *)v13;

      [v24 addSubview:v4->_bottomSeparatorViewForNonOpaqueTables];
    }
  }
  else if (bottomSeparatorViewForNonOpaqueTables)
  {
    [(RowSeparatorView *)bottomSeparatorViewForNonOpaqueTables removeFromSuperview];
    double v15 = v4->_bottomSeparatorViewForNonOpaqueTables;
    v4->_bottomSeparatorViewForNonOpaqueTables = 0;
  }
  topSeparatorViewForNonOpaqueTables = v4->_topSeparatorViewForNonOpaqueTables;
  if (v3)
  {
    if (!topSeparatorViewForNonOpaqueTables)
    {
      uint64_t v17 = [(EKUITableViewCell *)v4 separatorView];
      double v18 = v4->_topSeparatorViewForNonOpaqueTables;
      v4->_topSeparatorViewForNonOpaqueTables = (RowSeparatorView *)v17;

      [v5 addSubview:v4->_topSeparatorViewForNonOpaqueTables];
    }
  }
  else if (topSeparatorViewForNonOpaqueTables)
  {
    [(RowSeparatorView *)topSeparatorViewForNonOpaqueTables removeFromSuperview];
    double v19 = v4->_topSeparatorViewForNonOpaqueTables;
    v4->_topSeparatorViewForNonOpaqueTables = 0;
  }
  if ([(id)objc_opt_class() vibrant])
  {
    if ((v2 & 1) == 0)
    {
      double v20 = v4->_bottomRowSeparatorParentView;
      if (v20)
      {
        [(UIVisualEffectView *)v20 removeFromSuperview];
        double v21 = v4->_bottomRowSeparatorParentView;
        v4->_bottomRowSeparatorParentView = 0;
      }
    }
    if ((v3 & 1) == 0)
    {
      double v22 = v4->_topRowSeparatorParentView;
      if (v22)
      {
        [(UIVisualEffectView *)v22 removeFromSuperview];
        double v23 = v4->_topRowSeparatorParentView;
        v4->_topRowSeparatorParentView = 0;
      }
    }
  }
}

- (void)setDrawsOwnRowSeparators:(BOOL)a3
{
  self->_drawsOwnRowSeparators = a3;
  [(EKUITableViewCell *)self updateRowSeparators];
}

- (void)setSeparatorEdges:(unint64_t)a3
{
  self->_separatorEdges = a3;
  [(EKUITableViewCell *)self updateRowSeparators];
}

- (void)setDisableSelectedBackground:(BOOL)a3
{
  self->_disableSelectedBackground = a3;
  if (a3) {
    [(EKUITableViewCell *)self setNeedsUpdateConfiguration];
  }
  else {
    [(EKUITableViewCell *)self setBackgroundConfiguration:0];
  }
}

- (void)updateConfigurationUsingState:(id)a3
{
  id v4 = a3;
  if (self->_disableSelectedBackground)
  {
    id v7 = v4;
    uint64_t v5 = [MEMORY[0x1E4FB1498] listGroupedCellConfiguration];
    if ([v7 isSelected] && (objc_msgSend(v7, "isHighlighted") & 1) == 0)
    {
      uint64_t v6 = [MEMORY[0x1E4FB1618] tableCellGroupedBackgroundColor];
      [v5 setBackgroundColor:v6];
    }
    [(EKUITableViewCell *)self setBackgroundConfiguration:v5];

    id v4 = v7;
  }
}

- (void)_setMarginExtendsToFullWidth:(BOOL)a3
{
  double v3 = 15.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(EKUITableViewCell *)self _setMarginWidth:v3];
}

- (BOOL)drawsOwnRowSeparators
{
  return self->_drawsOwnRowSeparators;
}

- (BOOL)disableSelectedBackground
{
  return self->_disableSelectedBackground;
}

- (UIColor)rowSeparatorColor
{
  return self->_rowSeparatorColor;
}

- (UIVisualEffect)rowSeparatorVisualEffect
{
  return self->_rowSeparatorVisualEffect;
}

- (unint64_t)separatorEdges
{
  return self->_separatorEdges;
}

- (BOOL)usesInsetMargin
{
  return self->_usesInsetMargin;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowSeparatorVisualEffect, 0);
  objc_storeStrong((id *)&self->_rowSeparatorColor, 0);
  objc_storeStrong((id *)&self->_topSeparatorViewForNonOpaqueTables, 0);
  objc_storeStrong((id *)&self->_topRowSeparatorParentView, 0);
  objc_storeStrong((id *)&self->_bottomSeparatorViewForNonOpaqueTables, 0);

  objc_storeStrong((id *)&self->_bottomRowSeparatorParentView, 0);
}

@end