@interface ISTrailingStatusBadgeRecipe
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (id)trailingBottomBadgeRect;
@end

@implementation ISTrailingStatusBadgeRecipe

- (id)trailingBottomBadgeRect
{
  if (trailingBottomBadgeRect_onceToken != -1) {
    dispatch_once(&trailingBottomBadgeRect_onceToken, &__block_literal_global_21);
  }
  v2 = (void *)trailingBottomBadgeRect_rect;
  return v2;
}

uint64_t __54__ISTrailingStatusBadgeRecipe_trailingBottomBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)trailingBottomBadgeRect_rect;
  trailingBottomBadgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)trailingBottomBadgeRect_rect, "addHintedRect:forSize:", 9.0, 1.0, 7.0, 7.0, 16.0, 16.0);
  objc_msgSend((id)trailingBottomBadgeRect_rect, "addHintedRect:forSize:", 24.0, 3.0, 7.0, 7.0, 32.0, 32.0);
  objc_msgSend((id)trailingBottomBadgeRect_rect, "addHintedRect:forSize:", 101.0, 14.0, 24.0, 24.0, 128.0, 128.0);
  objc_msgSend((id)trailingBottomBadgeRect_rect, "addHintedRect:forSize:", 201.0, 28.0, 50.0, 50.0, 256.0, 256.0);
  v2 = (void *)trailingBottomBadgeRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 403.0, 55.0, 100.0, 100.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISLayer *)v8 setName:@"layer"];
  v9 = objc_opt_new();
  v10 = hintedShadowBlur();
  objc_msgSend(v10, "hintedFloatForSize:", width, height);
  objc_msgSend(v9, "setBlur:");

  v11 = hintedShadowSpread();
  objc_msgSend(v11, "hintedFloatForSize:", width, height);
  objc_msgSend(v9, "setSpread:");

  [v9 setScale:a4];
  [(ISLayer *)v8 setEffect:v9];
  v12 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v12 setName:@"Trailing bottom badge"];
  [(ISContentLayer *)v12 setContent:@"kISPrimaryResourceKey"];
  v13 = [(ISTrailingStatusBadgeRecipe *)self trailingBottomBadgeRect];
  objc_msgSend(v13, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v12, "setFrame:");

  [(ISLayer *)v8 addSublayer:v12];
  return v8;
}

@end