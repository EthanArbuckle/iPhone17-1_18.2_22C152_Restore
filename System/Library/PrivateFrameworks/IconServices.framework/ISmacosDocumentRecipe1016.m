@interface ISmacosDocumentRecipe1016
- (BOOL)maskBadgeResource;
- (id)hintedBadgeRect;
- (id)hintedCornerSize;
- (id)hintedFontSize;
- (id)hintedPageCurlSize;
- (id)hintedPaperRect;
- (id)hintedShadowBlur;
- (id)hintedShadowOffset;
- (id)hintedShadowSpread;
- (id)hintedTextRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (void)setMaskBadgeResource:(BOOL)a3;
@end

@implementation ISmacosDocumentRecipe1016

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken != -1) {
    dispatch_once(&hintedPaperRect_onceToken, &__block_literal_global_104);
  }
  v2 = (void *)hintedPaperRect_rect;
  return v2;
}

uint64_t __44__ISmacosDocumentRecipe1016_hintedPaperRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:5];
  v1 = (void *)hintedPaperRect_rect;
  hintedPaperRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 2.0, 1.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 5.0, 2.0, 22.0, 28.0, 32.0, 32.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 21.0, 7.0, 86.0, 114.0, 128.0, 128.0);
  objc_msgSend((id)hintedPaperRect_rect, "addHintedRect:forSize:", 42.0, 14.0, 172.0, 228.0, 256.0, 256.0);
  v2 = (void *)hintedPaperRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 84.0, 29.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken != -1) {
    dispatch_once(&hintedPageCurlSize_onceToken, &__block_literal_global_106);
  }
  v2 = (void *)hintedPageCurlSize_size;
  return v2;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedPageCurlSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedPageCurlSize_size;
  hintedPageCurlSize_size = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  v2 = (void *)hintedPageCurlSize_size;
  return objc_msgSend(v2, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken != -1) {
    dispatch_once(&hintedCornerSize_onceToken, &__block_literal_global_109_0);
  }
  v2 = (void *)hintedCornerSize_size;
  return v2;
}

uint64_t __45__ISmacosDocumentRecipe1016_hintedCornerSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedCornerSize_size;
  hintedCornerSize_size = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  v2 = (void *)hintedCornerSize_size;
  return objc_msgSend(v2, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_111 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_111, &__block_literal_global_113);
  }
  v2 = (void *)hintedBadgeRect_rect_110;
  return v2;
}

uint64_t __44__ISmacosDocumentRecipe1016_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:5];
  v1 = (void *)hintedBadgeRect_rect_110;
  hintedBadgeRect_rect_110 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_110, "addHintedRect:forSize:", 1.5, 3.0, 8.0, 8.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_110, "addHintedRect:forSize:", 3.0, 6.0, 16.0, 16.0, 32.0, 32.0);
  v2 = (void *)hintedBadgeRect_rect_110;
  return objc_msgSend(v2, "addHintedRect:forSize:", 44.0, 91.0, 256.0, 256.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken_115 != -1) {
    dispatch_once(&hintedTextRect_onceToken_115, &__block_literal_global_117);
  }
  v2 = (void *)hintedTextRect_rect_114;
  return v2;
}

uint64_t __43__ISmacosDocumentRecipe1016_hintedTextRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedTextRect_rect_114;
  hintedTextRect_rect_114 = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect_114, "addHintedRect:forSize:", 1.0, 1.0, 20.0, 5.0, 32.0, 32.0);
  v2 = (void *)hintedTextRect_rect_114;
  return objc_msgSend(v2, "addHintedRect:forSize:", 30.0, 40.0, 284.0, 65.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_119 != -1) {
    dispatch_once(&hintedFontSize_onceToken_119, &__block_literal_global_121);
  }
  v2 = (void *)hintedFontSize_value_118;
  return v2;
}

uint64_t __43__ISmacosDocumentRecipe1016_hintedFontSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:3];
  v1 = (void *)hintedFontSize_value_118;
  hintedFontSize_value_118 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_118, "addHintedFloat:forSize:", 4.0, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_118, "addHintedFloat:forSize:", 17.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_118, "addHintedFloat:forSize:", 34.0, 256.0, 256.0);
  v2 = (void *)hintedFontSize_value_118;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 67.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_1 != -1) {
    dispatch_once(&hintedShadowBlur_onceToken_1, &__block_literal_global_123);
  }
  v2 = (void *)hintedShadowBlur_value_1;
  return v2;
}

uint64_t __45__ISmacosDocumentRecipe1016_hintedShadowBlur__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedShadowBlur_value_1;
  hintedShadowBlur_value_1 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_1, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  v2 = (void *)hintedShadowBlur_value_1;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_0 != -1) {
    dispatch_once(&hintedShadowOffset_onceToken_0, &__block_literal_global_125);
  }
  v2 = (void *)hintedShadowOffset_value_0;
  return v2;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedShadowOffset__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:1];
  v1 = (void *)hintedShadowOffset_value_0;
  hintedShadowOffset_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_0, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  v2 = (void *)hintedShadowOffset_value_0;
  return objc_msgSend(v2, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)hintedShadowSpread
{
  if (hintedShadowSpread_onceToken_0 != -1) {
    dispatch_once(&hintedShadowSpread_onceToken_0, &__block_literal_global_127);
  }
  v2 = (void *)hintedShadowSpread_value_0;
  return v2;
}

uint64_t __47__ISmacosDocumentRecipe1016_hintedShadowSpread__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedShadowSpread_value_0;
  hintedShadowSpread_value_0 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowSpread_value_0, "addHintedFloat:forSize:", 1.0, 256.0, 256.0);
  v2 = (void *)hintedShadowSpread_value_0;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 1.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = [(ISmacosDocumentRecipe1016 *)self hintedBadgeRect];
  objc_msgSend(v7, "hintedRectForSize:", width, height);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v16 = [(ISmacosDocumentRecipe1016 *)self hintedTextRect];
  objc_msgSend(v16, "hintedRectForSize:", width, height);
  uint64_t v78 = v18;
  uint64_t v80 = v17;
  double v20 = v19;
  double v22 = v21;

  v23 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v23, "setSize:", width, height);
  v82 = v23;
  [(ISLayer *)v23 setName:@"layer"];
  v24 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v24 setName:@"masked layer"];
  -[ISLayer setSize:](v24, "setSize:", width, height);
  v25 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v24 setContent:v25];

  v26 = objc_alloc_init(ISContentLayer);
  v27 = [(ISmacosDocumentRecipe1016 *)self hintedPaperRect];
  objc_msgSend(v27, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v26, "setFrame:");

  [(ISLayer *)v26 setName:@"mask shape layer"];
  v28 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(ISContentLayer *)v26 setContent:v28];

  v29 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v29 setCoordinateSystem:0];
  [(ISLayer *)v29 setBlendMode:19];
  [(ISLayer *)v29 setName:@"bottomLeft"];
  v30 = [(ISmacosDocumentRecipe1016 *)self hintedCornerSize];
  objc_msgSend(v30, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v29, "setSize:");

  v31 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v32 = [v31 assetCatalogURL];
  v33 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v32 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v29 setContent:v33];

  [(ISLayer *)v26 addSublayer:v29];
  v34 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v34 setCoordinateSystem:3];
  [(ISLayer *)v34 setBlendMode:19];
  [(ISLayer *)v34 setName:@"topRight"];
  v35 = [(ISmacosDocumentRecipe1016 *)self hintedPageCurlSize];
  objc_msgSend(v35, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v34, "setSize:");

  v36 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v37 = [v36 assetCatalogURL];
  v38 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v37 imageName:@"document/top-right-mask" error:0];
  [(ISContentLayer *)v34 setContent:v38];

  [(ISLayer *)v26 addSublayer:v34];
  v39 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v39 setCoordinateSystem:2];
  [(ISLayer *)v39 setFlipped:2];
  [(ISLayer *)v39 setBlendMode:19];
  [(ISLayer *)v39 setName:@"bottomRight"];
  v40 = [(ISmacosDocumentRecipe1016 *)self hintedCornerSize];
  objc_msgSend(v40, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v39, "setSize:");

  v41 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v42 = [v41 assetCatalogURL];
  v43 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v42 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v39 setContent:v43];

  [(ISLayer *)v26 addSublayer:v39];
  v44 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v44 setCoordinateSystem:1];
  [(ISLayer *)v44 setFlipped:1];
  [(ISLayer *)v44 setBlendMode:19];
  [(ISLayer *)v44 setName:@"topLeft"];
  v45 = [(ISmacosDocumentRecipe1016 *)self hintedCornerSize];
  objc_msgSend(v45, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v44, "setSize:");

  v46 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v47 = [v46 assetCatalogURL];
  v48 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v47 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v44 setContent:v48];

  [(ISLayer *)v26 addSublayer:v44];
  v49 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v49, "setSize:", width, height);
  [(ISLayer *)v49 setName:@"mask layer"];
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(ISContentLayer *)v49 setContent:v50];

  [(ISLayer *)v49 addSublayer:v26];
  [(ISLayer *)v24 setMask:v49];

  v51 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v51 setName:@"background layer"];
  -[ISLayer setSize:](v51, "setSize:", width, height);
  v52 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v51 setBackgroundColor:v52];

  [(ISContentLayer *)v51 setContent:@"kISBackgroundResourceKey"];
  [(ISLayer *)v24 addSublayer:v51];

  v53 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v53 setName:@"gradient layer"];
  -[ISLayer setSize:](v53, "setSize:", width, height);
  v54 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v55 = [v54 assetCatalogURL];
  v56 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v55 imageName:@"document/gradient" error:0];
  [(ISContentLayer *)v53 setContent:v56];

  [(ISLayer *)v24 addSublayer:v53];
  v57 = objc_alloc_init(ISContentLayer);
  v58 = [(ISmacosDocumentRecipe1016 *)self hintedPaperRect];
  objc_msgSend(v58, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v57, "setFrame:");

  [(ISLayer *)v24 addSublayer:v57];
  v59 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v59 setName:@"badge layer"];
  -[ISLayer setFrame:](v59, "setFrame:", v9, v11, v13, v15);
  [(ISLayer *)v59 setCoordinateSystem:1];
  [(ISContentLayer *)v59 setContent:@"kISBadgeResourceKey"];
  if ([(ISmacosDocumentRecipe1016 *)self maskBadgeResource])
  {
    v60 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v60, "setSize:", v13, v15);
    [(ISLayer *)v60 setName:@"mask layer"];
    v61 = +[ISShapeCompositorResource continuousRoundedRectShape];
    [(ISContentLayer *)v60 setContent:v61];

    [(ISLayer *)v59 setMask:v60];
  }
  -[ISLayer addSublayer:](v57, "addSublayer:", v59, v78, v80);

  if (width >= 32.0)
  {
    v62 = objc_alloc_init(ISTextLayer);
    [(ISLayer *)v62 setName:@"text layer"];
    -[ISLayer setFrame:](v62, "setFrame:", v81, v79, v20, v22);
    [(ISTextLayer *)v62 setText:@"kISTextResourceKey"];
    v63 = [(ISmacosDocumentRecipe1016 *)self hintedFontSize];
    objc_msgSend(v63, "hintedFloatForSize:", width, height);
    -[ISTextLayer setFontSize:](v62, "setFontSize:");

    v64 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:1.0];
    [(ISTextLayer *)v62 setColor:v64];

    v65 = objc_alloc_init(ISLegibilityEffect);
    [(ISLayer *)v62 setEffect:v65];
    [(ISLayer *)v57 addSublayer:v62];
  }
  v66 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v66 setName:@"Forground layer"];
  [(ISLayer *)v66 setCoordinateSystem:3];
  v67 = [(ISmacosDocumentRecipe1016 *)self hintedPageCurlSize];
  objc_msgSend(v67, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v66, "setSize:");

  -[ISLayer setPosition:](v66, "setPosition:", 0.0, 0.0);
  v68 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v69 = [v68 assetCatalogURL];
  v70 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v69 imageName:@"document/page-fold" error:0];
  [(ISContentLayer *)v66 setContent:v70];

  [(ISLayer *)v57 addSublayer:v66];
  v71 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v71 setName:@"shadow background layer"];
  -[ISLayer setSize:](v71, "setSize:", width, height);
  v72 = objc_opt_new();
  v73 = [(ISmacosDocumentRecipe1016 *)self hintedShadowBlur];
  objc_msgSend(v73, "hintedFloatForSize:", width, height);
  objc_msgSend(v72, "setBlur:");

  v74 = [(ISmacosDocumentRecipe1016 *)self hintedShadowOffset];
  objc_msgSend(v74, "hintedSizeForSize:", width, height);
  objc_msgSend(v72, "setOffset:");

  v75 = [(ISmacosDocumentRecipe1016 *)self hintedShadowSpread];
  objc_msgSend(v75, "hintedFloatForSize:", width, height);
  objc_msgSend(v72, "setSpread:");

  v76 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.28];
  [v72 setColor:v76];

  [v72 setScale:a4];
  [(ISLayer *)v71 setEffect:v72];
  [(ISLayer *)v82 addSublayer:v71];
  [(ISLayer *)v71 addSublayer:v24];

  return v82;
}

- (BOOL)maskBadgeResource
{
  return self->_maskBadgeResource;
}

- (void)setMaskBadgeResource:(BOOL)a3
{
  self->_maskBadgeResource = a3;
}

@end