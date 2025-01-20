@interface FMFixedSizeView
- (CGSize)fixedIntrinsicSize;
- (FMFixedSizeView)initWithFrame:(CGRect)a3;
- (void)setFixedIntrinsicSize:(CGSize)a3;
- (void)setIntrinsicContentSize:(CGSize)a3;
@end

@implementation FMFixedSizeView

- (FMFixedSizeView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)FMFixedSizeView;
  v5 = -[FMFixedSizeView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5) {
    -[FMFixedSizeView setFixedIntrinsicSize:](v5, "setFixedIntrinsicSize:", width, height);
  }
  return v6;
}

- (void)setIntrinsicContentSize:(CGSize)a3
{
  self->_fixedIntrinsicSize = a3;
  [(FMFixedSizeView *)self invalidateIntrinsicContentSize];
}

- (CGSize)fixedIntrinsicSize
{
  double width = self->_fixedIntrinsicSize.width;
  double height = self->_fixedIntrinsicSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setFixedIntrinsicSize:(CGSize)a3
{
  self->_fixedIntrinsicSize = a3;
}

@end