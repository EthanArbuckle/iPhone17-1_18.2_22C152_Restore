@interface CUIPSDGradientLayer
- (CUIPSDGradient)gradient;
- (CUIPSDGradientLayer)initWithGradient:(id)a3;
- (void)dealloc;
@end

@implementation CUIPSDGradientLayer

- (CUIPSDGradientLayer)initWithGradient:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CUIPSDGradientLayer;
  v4 = [(CUIPSDLayer *)&v6 init];
  if (v4) {
    v4->_gradient = (CUIPSDGradient *)a3;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CUIPSDGradientLayer;
  [(CUIPSDLayer *)&v3 dealloc];
}

- (CUIPSDGradient)gradient
{
  return self->_gradient;
}

@end