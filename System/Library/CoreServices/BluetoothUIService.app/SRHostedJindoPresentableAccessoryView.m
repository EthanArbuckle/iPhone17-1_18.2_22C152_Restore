@interface SRHostedJindoPresentableAccessoryView
- (CGSize)compactSize;
- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4;
- (void)setCompactSize:(CGSize)a3;
- (void)setFrame:(CGRect)a3;
@end

@implementation SRHostedJindoPresentableAccessoryView

- (void)setFrame:(CGRect)a3
{
  v3.receiver = self;
  v3.super_class = (Class)SRHostedJindoPresentableAccessoryView;
  -[SRHostedJindoPresentableAccessoryView setFrame:](&v3, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)sizeThatFits:(CGSize)a3 forLayoutMode:(int64_t)a4
{
  [(SRHostedJindoPresentableAccessoryView *)self compactSize];
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)compactSize
{
  double width = self->_compactSize.width;
  double height = self->_compactSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setCompactSize:(CGSize)a3
{
  self->_compactSize = a3;
}

@end