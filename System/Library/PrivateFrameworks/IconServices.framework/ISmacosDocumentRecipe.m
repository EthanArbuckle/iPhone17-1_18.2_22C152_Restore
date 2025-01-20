@interface ISmacosDocumentRecipe
- (id)hintedBadgeRect;
- (id)hintedFontSize;
- (id)hintedTextRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISmacosDocumentRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_79 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_79, &__block_literal_global_81);
  }
  v2 = (void *)hintedBadgeRect_rect_78;
  return v2;
}

uint64_t __40__ISmacosDocumentRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedBadgeRect_rect_78;
  hintedBadgeRect_rect_78 = (uint64_t)v0;

  v2 = (void *)hintedBadgeRect_rect_78;
  return objc_msgSend(v2, "addHintedRect:forSize:", 112.0, 112.0, 288.0, 288.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken != -1) {
    dispatch_once(&hintedTextRect_onceToken, &__block_literal_global_83);
  }
  v2 = (void *)hintedTextRect_rect;
  return v2;
}

uint64_t __39__ISmacosDocumentRecipe_hintedTextRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedTextRect_rect;
  hintedTextRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect, "addHintedRect:forSize:", 7.0, 5.0, 18.0, 6.0, 32.0, 32.0);
  v2 = (void *)hintedTextRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 90.0, 62.0, 332.0, 80.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_0 != -1) {
    dispatch_once(&hintedFontSize_onceToken_0, &__block_literal_global_85);
  }
  v2 = (void *)hintedFontSize_value_0;
  return v2;
}

uint64_t __39__ISmacosDocumentRecipe_hintedFontSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:3];
  v1 = (void *)hintedFontSize_value_0;
  hintedFontSize_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 6.75, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 18.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_0, "addHintedFloat:forSize:", 36.0, 256.0, 256.0);
  v2 = (void *)hintedFontSize_value_0;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 72.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [(ISmacosDocumentRecipe *)self hintedBadgeRect];
  objc_msgSend(v7, "hintedRectForSize:", width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(ISmacosDocumentRecipe *)self hintedTextRect];
  objc_msgSend(v16, "hintedRectForSize:", width, height);
  double v45 = v18;
  double v46 = v17;
  double v20 = v19;
  double v22 = v21;

  v23 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v23, "setSize:", width, height);
  [(ISLayer *)v23 setName:@"layer"];
  v24 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v24 setName:@"Background layer"];
  -[ISLayer setSize:](v24, "setSize:", width, height);
  v25 = (void *)MEMORY[0x1E4F6F1F0];
  v26 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v27 = [v25 imageBagWithResourcesNamed:@"GenericBackground" fromBundle:v26];

  [(ISContentLayer *)v24 setContent:v27];
  [(ISLayer *)v23 addSublayer:v24];

  v28 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v28 setName:@"masked layer"];
  -[ISLayer setSize:](v28, "setSize:", width, height);
  v29 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v28 setContent:v29];

  v30 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v30 setName:@"background layer"];
  -[ISLayer setSize:](v30, "setSize:", width, height);
  [(ISContentLayer *)v30 setContent:@"kISBackgroundResourceKey"];
  [(ISLayer *)v28 addSublayer:v30];

  v31 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v31 setName:@"badge layer"];
  -[ISLayer setFrame:](v31, "setFrame:", v9, v11, v13, v15);
  [(ISContentLayer *)v31 setContent:@"kISBadgeResourceKey"];
  [(ISLayer *)v28 addSublayer:v31];

  if (width > 16.0)
  {
    v32 = objc_alloc_init(ISTextLayer);
    [(ISLayer *)v32 setName:@"text layer"];
    -[ISLayer setFrame:](v32, "setFrame:", v46, v45, v20, v22);
    [(ISTextLayer *)v32 setText:@"kISTextResourceKey"];
    v33 = [(ISmacosDocumentRecipe *)self hintedFontSize];
    objc_msgSend(v33, "hintedFloatForSize:", width, height);
    -[ISTextLayer setFontSize:](v32, "setFontSize:");

    if (width * 0.001953125 >= 0.125)
    {
      double v34 = 0.33;
    }
    else if ((0.125 - width * 0.001953125) * 0.3 / -0.09375 + 0.3 >= 0.0)
    {
      double v34 = (0.125 - width * 0.001953125) * 0.3 / -0.09375 + 0.3;
    }
    else
    {
      double v34 = 0.0;
    }
    v35 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:v34 alpha:1.0];
    [(ISTextLayer *)v32 setColor:v35];

    [(ISLayer *)v28 addSublayer:v32];
  }
  v36 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v36, "setSize:", width, height);
  [(ISLayer *)v36 setName:@"mask layer"];
  v37 = (void *)MEMORY[0x1E4F6F1F0];
  v38 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v39 = [v37 imageBagWithResourcesNamed:@"GenericFullDocumentMask" fromBundle:v38];

  if (v39)
  {
    [(ISContentLayer *)v36 setContent:v39];
    [(ISLayer *)v28 setMask:v36];
  }

  [(ISLayer *)v23 addSublayer:v28];
  v40 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v40 setName:@"Forground layer"];
  -[ISLayer setSize:](v40, "setSize:", width, height);
  v41 = (void *)MEMORY[0x1E4F6F1F0];
  v42 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v43 = [v41 imageBagWithResourcesNamed:@"GenericForeground" fromBundle:v42];

  [(ISContentLayer *)v40 setContent:v43];
  [(ISLayer *)v23 addSublayer:v40];

  return v23;
}

@end