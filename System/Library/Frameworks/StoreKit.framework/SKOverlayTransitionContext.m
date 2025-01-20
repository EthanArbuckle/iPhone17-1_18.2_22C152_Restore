@interface SKOverlayTransitionContext
- (ASOOverlayTransitionContext)backing;
- (CGRect)endFrame;
- (CGRect)startFrame;
- (SKOverlayTransitionContext)initWithASOOverlayTransitionContext:(id)a3;
- (void)addAnimationBlock:(void *)block;
- (void)setBacking:(id)a3;
@end

@implementation SKOverlayTransitionContext

- (SKOverlayTransitionContext)initWithASOOverlayTransitionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKOverlayTransitionContext;
  v6 = [(SKOverlayTransitionContext *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_backing, a3);
  }

  return v7;
}

- (CGRect)startFrame
{
  v2 = [(SKOverlayTransitionContext *)self backing];
  [v2 startFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)endFrame
{
  v2 = [(SKOverlayTransitionContext *)self backing];
  [v2 endFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)addAnimationBlock:(void *)block
{
  double v4 = block;
  id v5 = [(SKOverlayTransitionContext *)self backing];
  [v5 addAnimationBlock:v4];
}

- (ASOOverlayTransitionContext)backing
{
  return self->_backing;
}

- (void)setBacking:(id)a3
{
}

- (void).cxx_destruct
{
}

@end