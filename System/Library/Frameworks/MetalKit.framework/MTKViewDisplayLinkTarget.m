@interface MTKViewDisplayLinkTarget
- (MTKView)target;
- (MTKViewDisplayLinkTarget)initWithTarget:(id)a3;
- (void)draw;
- (void)setTarget:(id)a3;
@end

@implementation MTKViewDisplayLinkTarget

- (void)draw
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained draw];
}

- (MTKViewDisplayLinkTarget)initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MTKViewDisplayLinkTarget;
  v5 = [(MTKViewDisplayLinkTarget *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(MTKViewDisplayLinkTarget *)v5 setTarget:v4];
    v7 = v6;
  }

  return v6;
}

- (void)setTarget:(id)a3
{
}

- (MTKView)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);

  return (MTKView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end