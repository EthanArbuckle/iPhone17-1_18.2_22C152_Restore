@interface CNMaskingTableView
- (UIView)tableMaskView;
- (double)maskingInset;
- (void)didMoveToWindow;
- (void)setMaskingInset:(double)a3;
- (void)setTableMaskView:(id)a3;
- (void)tlk_updateForAppearance:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CNMaskingTableView

- (void).cxx_destruct
{
}

- (void)setTableMaskView:(id)a3
{
}

- (double)maskingInset
{
  return self->_maskingInset;
}

- (UIView)tableMaskView
{
  tableMaskView = self->_tableMaskView;
  if (!tableMaskView)
  {
    v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v5 = self->_tableMaskView;
    self->_tableMaskView = v4;

    [(UIView *)self->_tableMaskView setUserInteractionEnabled:0];
    v6 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)self->_tableMaskView setBackgroundColor:v6];

    tableMaskView = self->_tableMaskView;
  }

  return tableMaskView;
}

- (void)tlk_updateForAppearance:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)CNMaskingTableView;
  [(CNMaskingTableView *)&v7 tlk_updateForAppearance:a3];
  v4 = [(UIView *)self _cnui_contactStyle];
  if (([v4 usesOpaqueBackground] & 1) == 0)
  {
    v5 = [(CNMaskingTableView *)self backgroundView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass) {
      return;
    }
    v4 = objc_opt_new();
    [(CNMaskingTableView *)self setBackgroundView:v4];
  }
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)CNMaskingTableView;
  [(CNMaskingTableView *)&v3 didMoveToWindow];
  [(CNMaskingTableView *)self tlk_updateWithCurrentAppearance];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNMaskingTableView;
  [(CNMaskingTableView *)&v9 traitCollectionDidChange:v4];
  v5 = [(CNMaskingTableView *)self traitCollection];
  if ([v5 hasDifferentColorAppearanceComparedToTraitCollection:v4])
  {

LABEL_4:
    [(CNMaskingTableView *)self tlk_updateWithCurrentAppearance];
    goto LABEL_5;
  }
  v6 = [(CNMaskingTableView *)self traitCollection];
  uint64_t v7 = [v6 _vibrancy];
  uint64_t v8 = [v4 _vibrancy];

  if (v7 != v8) {
    goto LABEL_4;
  }
LABEL_5:
}

- (void)setMaskingInset:(double)a3
{
  v5 = +[CNContactStyle currentStyle];
  v6 = [v5 backgroundColor];
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(CNMaskingTableView *)self backgroundColor];
  }
  objc_super v9 = v8;

  id v25 = v9;
  if (CGColorGetAlpha((CGColorRef)[v25 CGColor]) != 1.0)
  {
    self->_maskingInset = a3;
    [(CNMaskingTableView *)self frame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    [(CNMaskingTableView *)self contentOffset];
    double v17 = v16 + a3;
    double v18 = vabdd_f64(v15, a3);
    v27.origin.x = v11;
    v27.origin.y = v17;
    v27.size.width = v13;
    v27.size.height = v18;
    double MinY = CGRectGetMinY(v27);
    v20 = [(CNMaskingTableView *)self maskView];
    v21 = v20;
    if (MinY <= 0.0)
    {

      if (v21) {
        [(CNMaskingTableView *)self setMaskView:0];
      }
    }
    else
    {
      v22 = [(CNMaskingTableView *)self tableMaskView];

      if (v21 != v22)
      {
        v23 = [(CNMaskingTableView *)self tableMaskView];
        [(CNMaskingTableView *)self setMaskView:v23];
      }
      v24 = [(CNMaskingTableView *)self tableMaskView];
      objc_msgSend(v24, "setFrame:", v11, v17, v13, v18);
    }
  }
}

@end