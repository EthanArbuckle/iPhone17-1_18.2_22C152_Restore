@interface ISCenterEmbossRecipe
- (id)hintedBadgeRect;
- (id)hintedFontSize;
- (id)hintedImageBadgeRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)variant;
- (void)setVariant:(unint64_t)a3;
@end

@implementation ISCenterEmbossRecipe

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken != -1) {
    dispatch_once(&hintedFontSize_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)hintedFontSize_value;
  return v2;
}

uint64_t __38__ISCenterEmbossRecipe_hintedFontSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedFontSize_value;
  hintedFontSize_value = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value, "addHintedFloat:forSize:", 6.0, 16.0, 16.0);
  v2 = (void *)hintedFontSize_value;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 180.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_0 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_0, &__block_literal_global_67_0);
  }
  v2 = (void *)hintedBadgeRect_rect_0;
  return v2;
}

uint64_t __39__ISCenterEmbossRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:5];
  v1 = (void *)hintedBadgeRect_rect_0;
  hintedBadgeRect_rect_0 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_0, "addHintedRect:forSize:", 2.0, 5.5, 12.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_0, "addHintedRect:forSize:", 4.0, 11.0, 24.0, 12.0, 32.0, 32.0);
  v2 = (void *)hintedBadgeRect_rect_0;
  return objc_msgSend(v2, "addHintedRect:forSize:", 73.0, 165.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)hintedImageBadgeRect
{
  if (hintedImageBadgeRect_onceToken != -1) {
    dispatch_once(&hintedImageBadgeRect_onceToken, &__block_literal_global_69);
  }
  v2 = (void *)hintedImageBadgeRect_rect;
  return v2;
}

uint64_t __44__ISCenterEmbossRecipe_hintedImageBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedImageBadgeRect_rect;
  hintedImageBadgeRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedImageBadgeRect_rect, "addHintedRect:forSize:", 2.0, 4.0, 12.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedImageBadgeRect_rect, "addHintedRect:forSize:", 4.0, 8.0, 24.0, 12.0, 32.0, 32.0);
  v2 = (void *)hintedImageBadgeRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 73.0, 135.0, 366.0, 190.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  [(ISLayer *)v7 setName:@"layer"];
  v8 = objc_opt_new();
  [v8 setVariant:self->_variant];
  [(ISLayer *)v7 setEffect:v8];
  v9 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v9 setName:@"Center Emboss"];
  v10 = [(ISCenterEmbossRecipe *)self hintedImageBadgeRect];
  objc_msgSend(v10, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v9, "setFrame:");

  [(ISContentLayer *)v9 setContent:@"kISPrimaryResourceKey"];
  [(ISContentLayer *)v9 setAcceptSymbol:0];
  [(ISLayer *)v7 addSublayer:v9];

  v11 = [(ISCenterEmbossRecipe *)self hintedBadgeRect];
  objc_msgSend(v11, "hintedRectForSize:", width, height);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  v20 = objc_alloc_init(ISTextLayer);
  [(ISLayer *)v20 setName:@"Center Emboss Text"];
  -[ISLayer setFrame:](v20, "setFrame:", v13, v15, v17, v19);
  [(ISTextLayer *)v20 setText:@"kISPrimaryResourceKey"];
  v21 = [(ISCenterEmbossRecipe *)self hintedFontSize];
  objc_msgSend(v21, "hintedFloatForSize:", width, height);
  -[ISTextLayer setFontSize:](v20, "setFontSize:");

  [(ISLayer *)v7 addSublayer:v20];
  v22 = objc_alloc_init(ISSymbolLayer);
  [(ISLayer *)v22 setName:@"Center Emboss"];
  -[ISLayer setFrame:](v22, "setFrame:", v13, v15, v17, v19);
  [(ISSymbolLayer *)v22 setSymbol:@"kISPrimaryResourceKey"];
  v23 = [(ISCenterEmbossRecipe *)self hintedFontSize];
  objc_msgSend(v23, "hintedFloatForSize:", width, height);
  -[ISSymbolLayer setFontSize:](v22, "setFontSize:");

  [(ISLayer *)v7 addSublayer:v22];
  return v7;
}

- (unint64_t)variant
{
  return self->_variant;
}

- (void)setVariant:(unint64_t)a3
{
  self->_variant = a3;
}

@end