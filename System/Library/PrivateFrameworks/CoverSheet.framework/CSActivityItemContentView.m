@interface CSActivityItemContentView
- (CGSize)sizeThatFits:(CGSize)a3;
- (CSActivityItemContentViewSizeProviding)sizeProvider;
- (void)setSizeProvider:(id)a3;
@end

@implementation CSActivityItemContentView

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = [(CSActivityItemContentView *)self sizeProvider];
  [v5 contentSizeForContentView:self];
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.height = v9;
  result.CGFloat width = v8;
  return result;
}

- (CSActivityItemContentViewSizeProviding)sizeProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sizeProvider);

  return (CSActivityItemContentViewSizeProviding *)WeakRetained;
}

- (void)setSizeProvider:(id)a3
{
}

- (void).cxx_destruct
{
}

@end