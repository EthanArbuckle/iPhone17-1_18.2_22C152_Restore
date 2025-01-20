@interface DSTableView
- (DSTableView)init;
- (NSLayoutConstraint)heightConstraint;
- (void)constrainTableView;
- (void)setContentSize:(CGSize)a3;
- (void)setHeightConstraint:(id)a3;
@end

@implementation DSTableView

- (DSTableView)init
{
  v10.receiver = self;
  v10.super_class = (Class)DSTableView;
  v2 = -[DSTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, 2, 0.0, 0.0, 0.0, 0.0);
  v3 = v2;
  if (v2)
  {
    v4 = [(DSTableView *)v2 heightAnchor];
    [(DSTableView *)v3 contentSize];
    uint64_t v6 = [v4 constraintEqualToConstant:v5];
    heightConstraint = v3->_heightConstraint;
    v3->_heightConstraint = (NSLayoutConstraint *)v6;

    v8 = [MEMORY[0x263F825C8] clearColor];
    [(DSTableView *)v3 setBackgroundColor:v8];

    [(DSTableView *)v3 setAllowsMultipleSelection:1];
    [(DSTableView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  return v3;
}

- (void)setContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DSTableView;
  -[DSTableView setContentSize:](&v4, sel_setContentSize_, a3.width, a3.height);
  [(DSTableView *)self constrainTableView];
}

- (void)constrainTableView
{
  [(DSTableView *)self contentSize];
  double v4 = v3 + 10.0;
  double v5 = [(DSTableView *)self heightConstraint];
  [v5 setConstant:v4];

  id v6 = [(DSTableView *)self heightConstraint];
  [v6 setActive:1];
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (void)setHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
}

@end