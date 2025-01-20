@interface CAMScrollViewWithLayoutDelegate
- (CAMScrollViewLayoutDelegate)layoutDelegate;
- (void)layoutSubviews;
- (void)setLayoutDelegate:(id)a3;
@end

@implementation CAMScrollViewWithLayoutDelegate

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)CAMScrollViewWithLayoutDelegate;
  [(CAMScrollViewWithLayoutDelegate *)&v4 layoutSubviews];
  v3 = [(CAMScrollViewWithLayoutDelegate *)self layoutDelegate];
  [v3 scrollViewDidLayoutSubviews:self];
}

- (CAMScrollViewLayoutDelegate)layoutDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layoutDelegate);
  return (CAMScrollViewLayoutDelegate *)WeakRetained;
}

- (void)setLayoutDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end