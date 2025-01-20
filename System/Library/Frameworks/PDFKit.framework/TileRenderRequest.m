@interface TileRenderRequest
@end

@implementation TileRenderRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->renderingProperties, 0);
  objc_destroyWeak((id *)&self->page);

  objc_destroyWeak((id *)&self->target);
}

@end