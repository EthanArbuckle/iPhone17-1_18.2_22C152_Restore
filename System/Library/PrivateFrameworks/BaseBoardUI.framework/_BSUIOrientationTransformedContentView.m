@interface _BSUIOrientationTransformedContentView
- (_BSUIOrientationTransformedContentView)initWithFrame:(CGRect)a3;
- (id)description;
- (int64_t)contentOrientation;
- (void)setContentOrientation:(int64_t)a3;
@end

@implementation _BSUIOrientationTransformedContentView

- (_BSUIOrientationTransformedContentView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_BSUIOrientationTransformedContentView;
  result = -[_BSUIOrientationTransformedContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_contentOrientation = 1;
  }
  return result;
}

- (id)description
{
  v2 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v3 = BSInterfaceOrientationDescription();
  id v4 = (id)[v2 appendObject:v3 withName:@"content"];

  id v5 = (id)[v2 appendSuper];
  v6 = [v2 build];

  return v6;
}

- (int64_t)contentOrientation
{
  return self->_contentOrientation;
}

- (void)setContentOrientation:(int64_t)a3
{
  self->_contentOrientation = a3;
}

@end