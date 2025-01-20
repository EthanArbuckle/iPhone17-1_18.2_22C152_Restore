@interface ISAppNotificationBadgeRecipe
- (id)hintedBadgeRect;
- (id)hintedMaskRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISAppNotificationBadgeRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_105 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_105, &__block_literal_global_107);
  }
  v2 = (void *)hintedBadgeRect_rect_104;
  return v2;
}

uint64_t __47__ISAppNotificationBadgeRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedBadgeRect_rect_104;
  hintedBadgeRect_rect_104 = (uint64_t)v0;

  v2 = (void *)hintedBadgeRect_rect_104;
  return objc_msgSend(v2, "addHintedRect:forSize:", 70.5, 0.0, 56.0, 56.0, 128.0, 128.0);
}

- (id)hintedMaskRect
{
  if (hintedMaskRect_onceToken != -1) {
    dispatch_once(&hintedMaskRect_onceToken, &__block_literal_global_109);
  }
  v2 = (void *)hintedMaskRect_rect;
  return v2;
}

uint64_t __46__ISAppNotificationBadgeRecipe_hintedMaskRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedMaskRect_rect;
  hintedMaskRect_rect = (uint64_t)v0;

  v2 = (void *)hintedMaskRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 12.0, 12.0, 104.0, 104.0, 128.0, 128.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(ISAppNotificationBadgeRecipe *)self hintedBadgeRect];
  objc_msgSend(v8, "hintedRectForSize:", width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v17, "setSize:", width, height);
  [(ISLayer *)v17 setName:@"root"];
  v18 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v18, "setSize:", width, height);
  [(ISLayer *)v18 setName:@"shadow background"];
  v19 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v19, "setSize:", width, height);
  [(ISLayer *)v19 setName:@"shadow"];
  v20 = objc_opt_new();
  objc_msgSend(v20, "setOffset:", 0.0, -3.0);
  [v20 setBlur:8.0];
  [v20 setSpread:9.0];
  [v20 setScale:a4];
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.2];
  [v20 setColor:v21];

  [(ISLayer *)v19 setEffect:v20];
  v22 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v22 setName:@"shadow badge"];
  -[ISLayer setFrame:](v22, "setFrame:", v10 + 1.0, v12, v14 + -2.0, v16);
  [(ISContentLayer *)v22 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v19 addSublayer:v22];

  [(ISLayer *)v18 addSublayer:v19];
  v23 = objc_alloc_init(ISContentLayer);
  v24 = [(ISAppNotificationBadgeRecipe *)self hintedMaskRect];
  objc_msgSend(v24, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v23, "setFrame:");

  [(ISLayer *)v23 setName:@"mask layer"];
  v25 = +[ISShapeCompositorResource continuousRoundedRectShape];
  [(ISContentLayer *)v23 setContent:v25];

  [(ISLayer *)v18 setMask:v23];
  [(ISLayer *)v17 addSublayer:v18];

  v26 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v26 setName:@"Center badge"];
  -[ISLayer setFrame:](v26, "setFrame:", v10, v12, v14, v16);
  [(ISContentLayer *)v26 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v17 addSublayer:v26];

  return v17;
}

@end