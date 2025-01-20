@interface ISiOSMacAppRecipe
- (id)badgeRect;
- (id)hintedShadowBlur;
- (id)hintedShadowOffset;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISiOSMacAppRecipe

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken != -1) {
    dispatch_once(&hintedShadowBlur_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)hintedShadowBlur_value;
  return v2;
}

uint64_t __37__ISiOSMacAppRecipe_hintedShadowBlur__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedShadowBlur_value;
  hintedShadowBlur_value = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 0.25, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  v2 = (void *)hintedShadowBlur_value;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken != -1) {
    dispatch_once(&hintedShadowOffset_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)hintedShadowOffset_value;
  return v2;
}

uint64_t __39__ISiOSMacAppRecipe_hintedShadowOffset__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:1];
  v1 = (void *)hintedShadowOffset_value;
  hintedShadowOffset_value = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  v2 = (void *)hintedShadowOffset_value;
  return objc_msgSend(v2, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)badgeRect
{
  if (badgeRect_onceToken != -1) {
    dispatch_once(&badgeRect_onceToken, &__block_literal_global_5);
  }
  v2 = (void *)badgeRect_rect;
  return v2;
}

uint64_t __30__ISiOSMacAppRecipe_badgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)badgeRect_rect;
  badgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 1.0, 1.0, 14.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 3.0, 3.0, 26.0, 26.0, 32.0, 32.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 12.0, 12.0, 104.0, 104.0, 128.0, 128.0);
  objc_msgSend((id)badgeRect_rect, "addHintedRect:forSize:", 25.0, 25.0, 206.0, 206.0, 256.0, 256.0);
  v2 = (void *)badgeRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 50.0, 50.0, 412.0, 412.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISLayer *)v8 setName:@"Root layer"];
  v9 = [(ISiOSMacAppRecipe *)self badgeRect];
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v18 setName:@"masked layer"];
  -[ISLayer setFrame:](v18, "setFrame:", v11, v13, v15, v17);
  v19 = [MEMORY[0x1E4F6F1C8] black];
  [(ISContentLayer *)v18 setContent:v19];

  v20 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v20 setName:@"Image"];
  -[ISLayer setSize:](v20, "setSize:", v15, v17);
  [(ISContentLayer *)v20 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v18 addSublayer:v20];

  v21 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v21, "setSize:", v15, v17);
  [(ISLayer *)v21 setName:@"mask layer"];
  v22 = +[ISShapeCompositorResource continuousRoundedRectShape];
  [(ISContentLayer *)v21 setContent:v22];

  [(ISLayer *)v18 setMask:v21];
  v23 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v23 setName:@"shadow background layer"];
  -[ISLayer setSize:](v23, "setSize:", width, height);
  v24 = objc_opt_new();
  v25 = [(ISiOSMacAppRecipe *)self hintedShadowBlur];
  objc_msgSend(v25, "hintedFloatForSize:", width, height);
  objc_msgSend(v24, "setBlur:");

  v26 = [(ISiOSMacAppRecipe *)self hintedShadowOffset];
  objc_msgSend(v26, "hintedSizeForSize:", width, height);
  objc_msgSend(v24, "setOffset:");

  v27 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.28];
  [v24 setColor:v27];

  [v24 setScale:a4];
  [(ISLayer *)v23 setEffect:v24];
  [(ISLayer *)v8 addSublayer:v23];
  [(ISLayer *)v23 addSublayer:v18];

  return v8;
}

@end