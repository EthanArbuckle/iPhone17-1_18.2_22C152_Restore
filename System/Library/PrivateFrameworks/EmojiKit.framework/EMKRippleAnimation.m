@interface EMKRippleAnimation
- (EMKRippleAnimation)initWithGlimmerFilterAnimation:(id)a3 scaleRippleAnimation:(id)a4;
- (_NSTextAnimation)glimmerFilterAnimation;
- (_NSTextAnimation)scaleRippleAnimation;
- (void)setGlimmerFilterAnimation:(id)a3;
- (void)setScaleRippleAnimation:(id)a3;
@end

@implementation EMKRippleAnimation

- (EMKRippleAnimation)initWithGlimmerFilterAnimation:(id)a3 scaleRippleAnimation:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)EMKRippleAnimation;
  id v5 = a4;
  id v6 = a3;
  v7 = [(EMKRippleAnimation *)&v9 init];
  -[EMKRippleAnimation setGlimmerFilterAnimation:](v7, "setGlimmerFilterAnimation:", v6, v9.receiver, v9.super_class);

  [(EMKRippleAnimation *)v7 setScaleRippleAnimation:v5];
  return v7;
}

- (_NSTextAnimation)scaleRippleAnimation
{
  return self->_scaleRippleAnimation;
}

- (void)setScaleRippleAnimation:(id)a3
{
}

- (_NSTextAnimation)glimmerFilterAnimation
{
  return self->_glimmerFilterAnimation;
}

- (void)setGlimmerFilterAnimation:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_glimmerFilterAnimation, 0);
  objc_storeStrong((id *)&self->_scaleRippleAnimation, 0);
}

@end