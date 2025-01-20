@interface ISClippingRecipe
- (IFColor)badgeTintColor;
- (id)hintedBadgeRect;
- (id)hintedCornerSize;
- (id)hintedFontSize;
- (id)hintedPageCurlSize;
- (id)hintedPaperRect;
- (id)hintedShadowBlur;
- (id)hintedShadowOffset;
- (id)hintedTextRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (void)setBadgeTintColor:(id)a3;
@end

@implementation ISClippingRecipe

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken_263 != -1) {
    dispatch_once(&hintedPaperRect_onceToken_263, &__block_literal_global_265);
  }
  v2 = (void *)hintedPaperRect_rect_262;
  return v2;
}

uint64_t __35__ISClippingRecipe_hintedPaperRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedPaperRect_rect_262;
  hintedPaperRect_rect_262 = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect_262, "addHintedRect:forSize:", 1.0, 1.0, 14.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect_262, "addHintedRect:forSize:", 2.0, 2.0, 28.0, 28.0, 32.0, 32.0);
  objc_msgSend((id)hintedPaperRect_rect_262, "addHintedRect:forSize:", 7.0, 7.0, 114.0, 114.0, 128.0, 128.0);
  objc_msgSend((id)hintedPaperRect_rect_262, "addHintedRect:forSize:", 14.0, 14.0, 228.0, 228.0, 256.0, 256.0);
  v2 = (void *)hintedPaperRect_rect_262;
  return objc_msgSend(v2, "addHintedRect:forSize:", 29.0, 29.0, 454.0, 454.0, 512.0, 512.0);
}

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_267 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_267, &__block_literal_global_269);
  }
  v2 = (void *)hintedBadgeRect_rect_266;
  return v2;
}

uint64_t __35__ISClippingRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedBadgeRect_rect_266;
  hintedBadgeRect_rect_266 = (uint64_t)v0;

  objc_msgSend((id)hintedBadgeRect_rect_266, "addHintedRect:forSize:", 3.0, 3.0, 8.0, 8.0, 16.0, 16.0);
  objc_msgSend((id)hintedBadgeRect_rect_266, "addHintedRect:forSize:", 6.0, 6.0, 16.0, 16.0, 32.0, 32.0);
  v2 = (void *)hintedBadgeRect_rect_266;
  return objc_msgSend(v2, "addHintedRect:forSize:", 96.0, 96.0, 256.0, 256.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken_271 != -1) {
    dispatch_once(&hintedPageCurlSize_onceToken_271, &__block_literal_global_273);
  }
  v2 = (void *)hintedPageCurlSize_size_270;
  return v2;
}

uint64_t __38__ISClippingRecipe_hintedPageCurlSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedPageCurlSize_size_270;
  hintedPageCurlSize_size_270 = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size_270, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size_270, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size_270, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size_270, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  v2 = (void *)hintedPageCurlSize_size_270;
  return objc_msgSend(v2, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken_275 != -1) {
    dispatch_once(&hintedCornerSize_onceToken_275, &__block_literal_global_277);
  }
  v2 = (void *)hintedCornerSize_size_274;
  return v2;
}

uint64_t __36__ISClippingRecipe_hintedCornerSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedCornerSize_size_274;
  hintedCornerSize_size_274 = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size_274, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size_274, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size_274, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size_274, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  v2 = (void *)hintedCornerSize_size_274;
  return objc_msgSend(v2, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedTextRect
{
  if (hintedTextRect_onceToken_279 != -1) {
    dispatch_once(&hintedTextRect_onceToken_279, &__block_literal_global_281);
  }
  v2 = (void *)hintedTextRect_rect_278;
  return v2;
}

uint64_t __34__ISClippingRecipe_hintedTextRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedTextRect_rect_278;
  hintedTextRect_rect_278 = (uint64_t)v0;

  objc_msgSend((id)hintedTextRect_rect_278, "addHintedRect:forSize:", 1.0, 1.0, 20.0, 5.0, 32.0, 32.0);
  v2 = (void *)hintedTextRect_rect_278;
  return objc_msgSend(v2, "addHintedRect:forSize:", 30.0, 24.0, 284.0, 65.0, 512.0, 512.0);
}

- (id)hintedFontSize
{
  if (hintedFontSize_onceToken_283 != -1) {
    dispatch_once(&hintedFontSize_onceToken_283, &__block_literal_global_285);
  }
  v2 = (void *)hintedFontSize_value_282;
  return v2;
}

uint64_t __34__ISClippingRecipe_hintedFontSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:3];
  v1 = (void *)hintedFontSize_value_282;
  hintedFontSize_value_282 = (uint64_t)v0;

  objc_msgSend((id)hintedFontSize_value_282, "addHintedFloat:forSize:", 4.0, 32.0, 32.0);
  objc_msgSend((id)hintedFontSize_value_282, "addHintedFloat:forSize:", 17.0, 128.0, 128.0);
  objc_msgSend((id)hintedFontSize_value_282, "addHintedFloat:forSize:", 34.0, 256.0, 256.0);
  v2 = (void *)hintedFontSize_value_282;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 67.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_287 != -1) {
    dispatch_once(&hintedShadowBlur_onceToken_287, &__block_literal_global_289);
  }
  v2 = (void *)hintedShadowBlur_value_286;
  return v2;
}

uint64_t __36__ISClippingRecipe_hintedShadowBlur__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedShadowBlur_value_286;
  hintedShadowBlur_value_286 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_286, "addHintedFloat:forSize:", 0.25, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_286, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_286, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_286, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  v2 = (void *)hintedShadowBlur_value_286;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_291 != -1) {
    dispatch_once(&hintedShadowOffset_onceToken_291, &__block_literal_global_293);
  }
  v2 = (void *)hintedShadowOffset_value_290;
  return v2;
}

uint64_t __38__ISClippingRecipe_hintedShadowOffset__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:1];
  v1 = (void *)hintedShadowOffset_value_290;
  hintedShadowOffset_value_290 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_290, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_290, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_290, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_290, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  v2 = (void *)hintedShadowOffset_value_290;
  return objc_msgSend(v2, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = [(ISClippingRecipe *)self hintedBadgeRect];
  objc_msgSend(v8, "hintedRectForSize:", width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v17 = [(ISClippingRecipe *)self hintedTextRect];
  objc_msgSend(v17, "hintedRectForSize:", width, height);

  v18 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v18, "setSize:", width, height);
  v70 = v18;
  [(ISLayer *)v18 setName:@"layer"];
  v19 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v19 setName:@"masked layer"];
  v69 = v19;
  -[ISLayer setSize:](v19, "setSize:", width, height);
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v19 setContent:v20];

  v21 = objc_alloc_init(ISContentLayer);
  v22 = [(ISClippingRecipe *)self hintedPaperRect];
  objc_msgSend(v22, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v21, "setFrame:");

  [(ISLayer *)v21 setName:@"mask shape layer"];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(ISContentLayer *)v21 setContent:v23];

  v24 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v24 setCoordinateSystem:0];
  [(ISLayer *)v24 setBlendMode:19];
  [(ISLayer *)v24 setName:@"bottomLeft"];
  v25 = [(ISClippingRecipe *)self hintedCornerSize];
  objc_msgSend(v25, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v24, "setSize:");

  v26 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v27 = [v26 assetCatalogURL];
  v28 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v27 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v24 setContent:v28];

  [(ISLayer *)v21 addSublayer:v24];
  v29 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v29 setCoordinateSystem:3];
  [(ISLayer *)v29 setBlendMode:19];
  [(ISLayer *)v29 setName:@"topRight"];
  v30 = [(ISClippingRecipe *)self hintedPageCurlSize];
  objc_msgSend(v30, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v29, "setSize:");

  v31 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v32 = [v31 assetCatalogURL];
  v33 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v32 imageName:@"document/top-right-mask" error:0];
  [(ISContentLayer *)v29 setContent:v33];

  [(ISLayer *)v21 addSublayer:v29];
  v34 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v34 setCoordinateSystem:2];
  [(ISLayer *)v34 setFlipped:2];
  [(ISLayer *)v34 setBlendMode:19];
  [(ISLayer *)v34 setName:@"bottomRight"];
  v35 = [(ISClippingRecipe *)self hintedCornerSize];
  objc_msgSend(v35, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v34, "setSize:");

  v36 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v37 = [v36 assetCatalogURL];
  v38 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v37 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v34 setContent:v38];

  [(ISLayer *)v21 addSublayer:v34];
  v39 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v39 setCoordinateSystem:1];
  [(ISLayer *)v39 setFlipped:1];
  [(ISLayer *)v39 setBlendMode:19];
  [(ISLayer *)v39 setName:@"topLeft"];
  v40 = [(ISClippingRecipe *)self hintedCornerSize];
  objc_msgSend(v40, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v39, "setSize:");

  v41 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v42 = [v41 assetCatalogURL];
  v43 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v42 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v39 setContent:v43];

  [(ISLayer *)v21 addSublayer:v39];
  v44 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v44, "setSize:", width, height);
  [(ISLayer *)v44 setName:@"mask layer"];
  v45 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(ISContentLayer *)v44 setContent:v45];

  [(ISLayer *)v44 addSublayer:v21];
  [(ISLayer *)v69 setMask:v44];

  v46 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v46 setName:@"background layer"];
  -[ISLayer setSize:](v46, "setSize:", width, height);
  v47 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v46 setBackgroundColor:v47];

  [(ISContentLayer *)v46 setContent:@"kISBackgroundResourceKey"];
  [(ISLayer *)v69 addSublayer:v46];

  v48 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v48 setName:@"gradient layer"];
  -[ISLayer setSize:](v48, "setSize:", width, height);
  v49 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v50 = [v49 assetCatalogURL];
  v51 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v50 imageName:@"document/gradient" error:0];
  [(ISContentLayer *)v48 setContent:v51];

  [(ISLayer *)v69 addSublayer:v48];
  v52 = objc_alloc_init(ISContentLayer);
  v53 = [(ISClippingRecipe *)self hintedPaperRect];
  objc_msgSend(v53, "hintedRectForSize:", width, height);
  -[ISLayer setFrame:](v52, "setFrame:");

  [(ISLayer *)v69 addSublayer:v52];
  v54 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v54 setName:@"badge layer"];
  [(ISContentLayer *)v54 setContent:@"kISBadgeResourceKey"];
  v55 = [(ISClippingRecipe *)self badgeTintColor];

  if (v55)
  {
    -[ISLayer setSize:](v54, "setSize:", v14, v16);
    v56 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v56 setName:@"Tint layer"];
    -[ISLayer setFrame:](v56, "setFrame:", v10, v12, v14, v16);
    v57 = [(ISClippingRecipe *)self badgeTintColor];
    [(ISContentLayer *)v56 setContent:v57];

    [(ISLayer *)v56 setMask:v54];
    [(ISLayer *)v56 setCoordinateSystem:1];
    [(ISLayer *)v52 addSublayer:v56];
  }
  else
  {
    [(ISLayer *)v54 setCoordinateSystem:1];
    -[ISLayer setFrame:](v54, "setFrame:", v10, v12, v14, v16);
    [(ISLayer *)v52 addSublayer:v54];
  }

  v58 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v58 setName:@"Forground layer"];
  [(ISLayer *)v58 setCoordinateSystem:3];
  v59 = [(ISClippingRecipe *)self hintedPageCurlSize];
  objc_msgSend(v59, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v58, "setSize:");

  -[ISLayer setPosition:](v58, "setPosition:", 0.0, 0.0);
  v60 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v61 = [v60 assetCatalogURL];
  v62 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v61 imageName:@"document/page-fold" error:0];
  [(ISContentLayer *)v58 setContent:v62];

  [(ISLayer *)v52 addSublayer:v58];
  v63 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v63 setName:@"shadow background layer"];
  -[ISLayer setSize:](v63, "setSize:", width, height);
  v64 = objc_opt_new();
  v65 = [(ISClippingRecipe *)self hintedShadowBlur];
  objc_msgSend(v65, "hintedFloatForSize:", width, height);
  objc_msgSend(v64, "setBlur:");

  v66 = [(ISClippingRecipe *)self hintedShadowOffset];
  objc_msgSend(v66, "hintedSizeForSize:", width, height);
  objc_msgSend(v64, "setOffset:");

  v67 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.28];
  [v64 setColor:v67];

  [v64 setScale:a4];
  [(ISLayer *)v63 setEffect:v64];
  [(ISLayer *)v70 addSublayer:v63];
  [(ISLayer *)v63 addSublayer:v69];

  return v70;
}

- (IFColor)badgeTintColor
{
  return (IFColor *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBadgeTintColor:(id)a3
{
}

- (void).cxx_destruct
{
}

@end