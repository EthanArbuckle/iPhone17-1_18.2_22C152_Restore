@interface CPSLayoutHelperView
- (CPSLayoutHelperView)init;
- (CPSLayoutHelperViewDelegate)layoutDelegate;
- (void)layoutSubviews;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation CPSLayoutHelperView

- (CPSLayoutHelperView)init
{
  SEL v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)CPSLayoutHelperView;
  v6 = [(CPSLayoutHelperView *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6) {
    [(CPSLayoutHelperView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)layoutSubviews
{
  v9 = self;
  SEL v8 = a2;
  v7.receiver = self;
  v7.super_class = (Class)CPSLayoutHelperView;
  [(CPSLayoutHelperView *)&v7 layoutSubviews];
  v3 = [(CPSLayoutHelperView *)v9 layoutDelegate];
  char v5 = 0;
  char v4 = 0;
  if (v3)
  {
    v6 = [(CPSLayoutHelperView *)v9 layoutDelegate];
    char v5 = 1;
    char v4 = objc_opt_respondsToSelector();
  }
  if (v5) {

  }
  if (v4)
  {
    v2 = [(CPSLayoutHelperView *)v9 layoutDelegate];
    [(CPSLayoutHelperViewDelegate *)v2 didChangeLayout:v9];
  }
}

- (CPSLayoutHelperViewDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);

  return (CPSLayoutHelperViewDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end