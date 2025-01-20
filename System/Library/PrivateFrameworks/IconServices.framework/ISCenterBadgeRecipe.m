@interface ISCenterBadgeRecipe
- (id)hintedBadgeRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISCenterBadgeRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_94 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_94, &__block_literal_global_96);
  }
  v2 = (void *)hintedBadgeRect_rect_93;
  return v2;
}

uint64_t __38__ISCenterBadgeRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedBadgeRect_rect_93;
  hintedBadgeRect_rect_93 = (uint64_t)v0;

  v2 = (void *)hintedBadgeRect_rect_93;
  return objc_msgSend(v2, "addHintedRect:forSize:", 73.0, 135.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  [(ISLayer *)v7 setName:@"layer"];
  v8 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v8 setName:@"Center badge"];
  v9 = [(ISCenterBadgeRecipe *)self hintedBadgeRect];
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v8, "setFrame:");

  [(ISContentLayer *)v8 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v7 addSublayer:v8];

  return v7;
}

@end