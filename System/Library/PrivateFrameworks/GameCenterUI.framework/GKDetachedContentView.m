@interface GKDetachedContentView
- (GKStaticRenderContentView)renderView;
- (void)setRenderView:(id)a3;
@end

@implementation GKDetachedContentView

- (GKStaticRenderContentView)renderView
{
  return self->_renderView;
}

- (void)setRenderView:(id)a3
{
  self->_renderView = (GKStaticRenderContentView *)a3;
}

@end