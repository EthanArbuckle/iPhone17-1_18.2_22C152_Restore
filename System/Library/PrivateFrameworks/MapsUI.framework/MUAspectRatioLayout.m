@interface MUAspectRatioLayout
- (MUAspectRatioLayout)initWithItem:(id)a3 aspectRatio:(double)a4;
- (MULayoutItem)item;
- (double)aspectRatio;
- (void)setAspectRatio:(double)a3;
- (void)setItem:(id)a3;
@end

@implementation MUAspectRatioLayout

- (MUAspectRatioLayout)initWithItem:(id)a3 aspectRatio:(double)a4
{
  id v6 = a3;
  v7 = [[MUAspectRatioLayoutInternal alloc] initWithItem:v6 aspectRatio:a4];

  v11.receiver = self;
  v11.super_class = (Class)MUAspectRatioLayout;
  v8 = [(MUConstraintLayout *)&v11 initWithInternal:v7];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_internal, v7);
  }

  return v9;
}

- (MULayoutItem)item
{
  return [(MUAspectRatioLayoutInternal *)self->_internal item];
}

- (void)setItem:(id)a3
{
}

- (double)aspectRatio
{
  [(MUAspectRatioLayoutInternal *)self->_internal aspectRatio];
  return result;
}

- (void)setAspectRatio:(double)a3
{
}

- (void).cxx_destruct
{
}

@end