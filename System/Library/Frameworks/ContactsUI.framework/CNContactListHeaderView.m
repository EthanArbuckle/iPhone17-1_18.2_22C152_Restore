@interface CNContactListHeaderView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)headerView;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)setHeaderView:(id)a3;
@end

@implementation CNContactListHeaderView

- (void)setHeaderView:(id)a3
{
  id v8 = a3;
  v5 = [v8 superview];
  v6 = [(CNContactListHeaderView *)self contentView];

  if (v5 != v6)
  {
    objc_storeStrong((id *)&self->_headerView, a3);
    v7 = [(CNContactListHeaderView *)self contentView];
    [v7 addSubview:self->_headerView];

    [(UIView *)self->_headerView bounds];
    -[CNContactListHeaderView setBounds:](self, "setBounds:");
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)CNContactListHeaderView;
  v4 = [(CNContactListHeaderView *)&v11 preferredLayoutAttributesFittingAttributes:a3];
  [v4 size];
  double v6 = v5;
  v7 = [(CNContactListHeaderView *)self headerView];
  [v7 frame];
  if (v8 == 0.0) {
    double v9 = 0.0;
  }
  else {
    double v9 = v8;
  }

  objc_msgSend(v4, "setSize:", v6, v9);

  return v4;
}

- (UIView)headerView
{
  return self->_headerView;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)CNContactListHeaderView;
  [(CNContactListHeaderView *)&v8 layoutSubviews];
  [(CNContactListHeaderView *)self frame];
  double v4 = *MEMORY[0x1E4F1DAD8];
  double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (v6 != *MEMORY[0x1E4F1DAD8] || v3 != v5)
  {
    [(CNContactListHeaderView *)self frame];
    -[CNContactListHeaderView setFrame:](self, "setFrame:", v4, v5);
  }
}

- (void).cxx_destruct
{
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  objc_super v8 = [(CNContactListHeaderView *)self headerView];
  objc_msgSend(v8, "convertPoint:fromView:", self, x, y);
  double v10 = v9;
  double v12 = v11;

  v13 = [(CNContactListHeaderView *)self headerView];
  LOBYTE(v8) = objc_msgSend(v13, "pointInside:withEvent:", v7, v10, v12);

  return (char)v8;
}

@end