@interface AAUIMetalBadgeRendererDisplayLinkTarget
- (AAUIMetalBadgeRenderer)target;
- (id)_initWithTarget:(id)a3;
- (void)_drawBadgeFrameCallback;
- (void)setTarget:(id)a3;
@end

@implementation AAUIMetalBadgeRendererDisplayLinkTarget

- (id)_initWithTarget:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIMetalBadgeRendererDisplayLinkTarget;
  v5 = [(AAUIMetalBadgeRendererDisplayLinkTarget *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(AAUIMetalBadgeRendererDisplayLinkTarget *)v5 setTarget:v4];
    v7 = v6;
  }

  return v6;
}

- (void)_drawBadgeFrameCallback
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  [WeakRetained _drawBadgeFrameCallback];
}

- (AAUIMetalBadgeRenderer)target
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_target);
  return (AAUIMetalBadgeRenderer *)WeakRetained;
}

- (void)setTarget:(id)a3
{
}

- (void).cxx_destruct
{
}

@end