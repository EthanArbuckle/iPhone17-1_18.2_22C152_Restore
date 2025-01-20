@interface DBLayoutHelperView
- (DBLayoutHelperView)init;
- (DBLayoutHelperViewDelegate)layoutDelegate;
- (void)layoutSubviews;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation DBLayoutHelperView

- (DBLayoutHelperView)init
{
  v5.receiver = self;
  v5.super_class = (Class)DBLayoutHelperView;
  v2 = [(DBLayoutHelperView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(DBLayoutHelperView *)v2 setAutoresizingMask:18];
  }
  return v3;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)DBLayoutHelperView;
  [(DBLayoutHelperView *)&v8 layoutSubviews];
  uint64_t v3 = [(DBLayoutHelperView *)self layoutDelegate];
  if (v3)
  {
    v4 = (void *)v3;
    objc_super v5 = [(DBLayoutHelperView *)self layoutDelegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      v7 = [(DBLayoutHelperView *)self layoutDelegate];
      [v7 didChangeLayout:self];
    }
  }
}

- (DBLayoutHelperViewDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (DBLayoutHelperViewDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end