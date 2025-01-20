@interface ISMultipleFilesRecipe
- (id)documentLayerWithRect:(CGRect)a3 withPageFold:(BOOL)a4 iconSize:(CGSize)a5 scale:(double)a6;
- (id)hintedCornerSize;
- (id)hintedPageCurlSize;
- (id)hintedPaperRect;
- (id)hintedShadowBlur;
- (id)hintedShadowOffset;
- (id)hintedUnderPaperRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISMultipleFilesRecipe

- (id)hintedPaperRect
{
  if (hintedPaperRect_onceToken_231 != -1) {
    dispatch_once(&hintedPaperRect_onceToken_231, &__block_literal_global_233);
  }
  v2 = (void *)hintedPaperRect_rect_230;
  return v2;
}

uint64_t __40__ISMultipleFilesRecipe_hintedPaperRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedPaperRect_rect_230;
  hintedPaperRect_rect_230 = (uint64_t)v0;

  objc_msgSend((id)hintedPaperRect_rect_230, "addHintedRect:forSize:", 4.0, 2.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedPaperRect_rect_230, "addHintedRect:forSize:", 7.0, 4.0, 22.0, 28.0, 32.0, 32.0);
  v2 = (void *)hintedPaperRect_rect_230;
  return objc_msgSend(v2, "addHintedRect:forSize:", 104.0, 58.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedUnderPaperRect
{
  if (hintedUnderPaperRect_onceToken != -1) {
    dispatch_once(&hintedUnderPaperRect_onceToken, &__block_literal_global_235);
  }
  v2 = (void *)hintedUnderPaperRect_rect;
  return v2;
}

uint64_t __45__ISMultipleFilesRecipe_hintedUnderPaperRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedUnderPaperRect_rect;
  hintedUnderPaperRect_rect = (uint64_t)v0;

  objc_msgSend((id)hintedUnderPaperRect_rect, "addHintedRect:forSize:", 2.0, 1.0, 12.0, 14.0, 16.0, 16.0);
  objc_msgSend((id)hintedUnderPaperRect_rect, "addHintedRect:forSize:", 3.0, 1.0, 22.0, 28.0, 32.0, 32.0);
  v2 = (void *)hintedUnderPaperRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 68.0, 22.0, 344.0, 454.0, 512.0, 512.0);
}

- (id)hintedPageCurlSize
{
  if (hintedPageCurlSize_onceToken_237 != -1) {
    dispatch_once(&hintedPageCurlSize_onceToken_237, &__block_literal_global_239);
  }
  v2 = (void *)hintedPageCurlSize_size_236;
  return v2;
}

uint64_t __43__ISMultipleFilesRecipe_hintedPageCurlSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedPageCurlSize_size_236;
  hintedPageCurlSize_size_236 = (uint64_t)v0;

  objc_msgSend((id)hintedPageCurlSize_size_236, "addHintedSize:forSize:", 6.0, 6.0, 16.0, 16.0);
  objc_msgSend((id)hintedPageCurlSize_size_236, "addHintedSize:forSize:", 12.0, 12.0, 32.0, 32.0);
  objc_msgSend((id)hintedPageCurlSize_size_236, "addHintedSize:forSize:", 48.0, 48.0, 128.0, 128.0);
  objc_msgSend((id)hintedPageCurlSize_size_236, "addHintedSize:forSize:", 95.0, 95.0, 256.0, 256.0);
  v2 = (void *)hintedPageCurlSize_size_236;
  return objc_msgSend(v2, "addHintedSize:forSize:", 190.0, 190.0, 512.0, 512.0);
}

- (id)hintedCornerSize
{
  if (hintedCornerSize_onceToken_241 != -1) {
    dispatch_once(&hintedCornerSize_onceToken_241, &__block_literal_global_243);
  }
  v2 = (void *)hintedCornerSize_size_240;
  return v2;
}

uint64_t __41__ISMultipleFilesRecipe_hintedCornerSize__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:3];
  v1 = (void *)hintedCornerSize_size_240;
  hintedCornerSize_size_240 = (uint64_t)v0;

  objc_msgSend((id)hintedCornerSize_size_240, "addHintedSize:forSize:", 1.0, 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedCornerSize_size_240, "addHintedSize:forSize:", 2.0, 2.0, 32.0, 32.0);
  objc_msgSend((id)hintedCornerSize_size_240, "addHintedSize:forSize:", 5.0, 5.0, 128.0, 128.0);
  objc_msgSend((id)hintedCornerSize_size_240, "addHintedSize:forSize:", 9.0, 9.0, 256.0, 256.0);
  v2 = (void *)hintedCornerSize_size_240;
  return objc_msgSend(v2, "addHintedSize:forSize:", 18.0, 18.0, 512.0, 512.0);
}

- (id)hintedShadowBlur
{
  if (hintedShadowBlur_onceToken_245 != -1) {
    dispatch_once(&hintedShadowBlur_onceToken_245, &__block_literal_global_247);
  }
  v2 = (void *)hintedShadowBlur_value_244;
  return v2;
}

uint64_t __41__ISMultipleFilesRecipe_hintedShadowBlur__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:1];
  v1 = (void *)hintedShadowBlur_value_244;
  hintedShadowBlur_value_244 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowBlur_value_244, "addHintedFloat:forSize:", 1.0, 16.0, 16.0);
  objc_msgSend((id)hintedShadowBlur_value_244, "addHintedFloat:forSize:", 1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowBlur_value_244, "addHintedFloat:forSize:", 3.0, 128.0, 128.0);
  objc_msgSend((id)hintedShadowBlur_value_244, "addHintedFloat:forSize:", 6.0, 256.0, 256.0);
  v2 = (void *)hintedShadowBlur_value_244;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 11.5, 512.0, 512.0);
}

- (id)hintedShadowOffset
{
  if (hintedShadowOffset_onceToken_249 != -1) {
    dispatch_once(&hintedShadowOffset_onceToken_249, &__block_literal_global_251);
  }
  v2 = (void *)hintedShadowOffset_value_248;
  return v2;
}

uint64_t __43__ISMultipleFilesRecipe_hintedShadowOffset__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedSize alloc] initWithOptions:1];
  v1 = (void *)hintedShadowOffset_value_248;
  hintedShadowOffset_value_248 = (uint64_t)v0;

  objc_msgSend((id)hintedShadowOffset_value_248, "addHintedSize:forSize:", 0.0, -0.5, 16.0, 16.0);
  objc_msgSend((id)hintedShadowOffset_value_248, "addHintedSize:forSize:", 0.0, -1.0, 32.0, 32.0);
  objc_msgSend((id)hintedShadowOffset_value_248, "addHintedSize:forSize:", 0.0, -2.5, 128.0, 128.0);
  objc_msgSend((id)hintedShadowOffset_value_248, "addHintedSize:forSize:", 0.0, -5.0, 256.0, 256.0);
  v2 = (void *)hintedShadowOffset_value_248;
  return objc_msgSend(v2, "addHintedSize:forSize:", 0.0, -10.0, 512.0, 512.0);
}

- (id)documentLayerWithRect:(CGRect)a3 withPageFold:(BOOL)a4 iconSize:(CGSize)a5 scale:(double)a6
{
  double height = a5.height;
  double width = a5.width;
  BOOL v61 = a4;
  double v9 = a3.size.height;
  double v10 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v14 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v14 setName:@"masked layer"];
  -[ISLayer setSize:](v14, "setSize:", width, height);
  v15 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v14 setContent:v15];

  v16 = objc_alloc_init(ISContentLayer);
  -[ISLayer setFrame:](v16, "setFrame:", x, y, v10, v9);
  [(ISLayer *)v16 setName:@"mask shape layer"];
  v17 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(ISContentLayer *)v16 setContent:v17];

  v18 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v18 setCoordinateSystem:0];
  [(ISLayer *)v18 setBlendMode:19];
  [(ISLayer *)v18 setName:@"bottomLeft"];
  v19 = [(ISMultipleFilesRecipe *)self hintedCornerSize];
  objc_msgSend(v19, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v18, "setSize:");

  v20 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v21 = [v20 assetCatalogURL];
  v22 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v21 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v18 setContent:v22];

  [(ISLayer *)v16 addSublayer:v18];
  v23 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v23 setCoordinateSystem:3];
  [(ISLayer *)v23 setBlendMode:19];
  [(ISLayer *)v23 setName:@"topRight"];
  v24 = [(ISMultipleFilesRecipe *)self hintedPageCurlSize];
  objc_msgSend(v24, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v23, "setSize:");

  v25 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v26 = [v25 assetCatalogURL];
  v27 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v26 imageName:@"document/top-right-mask" error:0];
  [(ISContentLayer *)v23 setContent:v27];

  [(ISLayer *)v16 addSublayer:v23];
  v28 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v28 setCoordinateSystem:2];
  [(ISLayer *)v28 setFlipped:2];
  [(ISLayer *)v28 setBlendMode:19];
  [(ISLayer *)v28 setName:@"bottomRight"];
  v29 = [(ISMultipleFilesRecipe *)self hintedCornerSize];
  objc_msgSend(v29, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v28, "setSize:");

  v30 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v31 = [v30 assetCatalogURL];
  v32 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v31 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v28 setContent:v32];

  [(ISLayer *)v16 addSublayer:v28];
  v33 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v33 setCoordinateSystem:1];
  [(ISLayer *)v33 setFlipped:1];
  [(ISLayer *)v33 setBlendMode:19];
  [(ISLayer *)v33 setName:@"topLeft"];
  v34 = [(ISMultipleFilesRecipe *)self hintedCornerSize];
  objc_msgSend(v34, "hintedSizeForSize:", width, height);
  -[ISLayer setSize:](v33, "setSize:");

  v35 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v36 = [v35 assetCatalogURL];
  v37 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v36 imageName:@"document/bottom-right-mask" error:0];
  [(ISContentLayer *)v33 setContent:v37];

  [(ISLayer *)v16 addSublayer:v33];
  v38 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v38, "setSize:", width, height);
  [(ISLayer *)v38 setName:@"mask layer"];
  v39 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(ISContentLayer *)v38 setContent:v39];

  [(ISLayer *)v38 addSublayer:v16];
  [(ISLayer *)v14 setMask:v38];

  v40 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v40 setName:@"background layer"];
  -[ISLayer setSize:](v40, "setSize:", width, height);
  v41 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v40 setBackgroundColor:v41];

  [(ISContentLayer *)v40 setContent:@"kISBackgroundResourceKey"];
  [(ISLayer *)v14 addSublayer:v40];

  v42 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v42 setName:@"gradient layer"];
  -[ISLayer setSize:](v42, "setSize:", width, height);
  v43 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
  v44 = [v43 assetCatalogURL];
  v45 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v44 imageName:@"document/gradient" error:0];
  [(ISContentLayer *)v42 setContent:v45];

  [(ISLayer *)v14 addSublayer:v42];
  if (v61)
  {
    v46 = objc_alloc_init(ISContentLayer);
    v47 = [(ISMultipleFilesRecipe *)self hintedPaperRect];
    objc_msgSend(v47, "hintedRectForSize:", width, height);
    -[ISLayer setFrame:](v46, "setFrame:");

    [(ISLayer *)v14 addSublayer:v46];
    v48 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v48 setName:@"Forground layer"];
    [(ISLayer *)v48 setCoordinateSystem:3];
    v49 = [(ISMultipleFilesRecipe *)self hintedPageCurlSize];
    objc_msgSend(v49, "hintedSizeForSize:", width, height);
    -[ISLayer setSize:](v48, "setSize:");

    -[ISLayer setPosition:](v48, "setPosition:", 0.0, 0.0);
    v50 = [MEMORY[0x1E4F6F1C0] iconFoundationFrameworkBundle];
    v51 = [v50 assetCatalogURL];
    v52 = +[ISAssetCatalogResource assetCatalogResourceWithURL:v51 imageName:@"document/page-fold" error:0];
    [(ISContentLayer *)v48 setContent:v52];

    [(ISLayer *)v46 addSublayer:v48];
  }
  v53 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v53 setName:@"shadow background layer"];
  -[ISLayer setSize:](v53, "setSize:", width, height);
  v54 = objc_opt_new();
  v55 = [(ISMultipleFilesRecipe *)self hintedShadowBlur];
  objc_msgSend(v55, "hintedFloatForSize:", width, height);
  objc_msgSend(v54, "setBlur:");

  v56 = [(ISMultipleFilesRecipe *)self hintedShadowOffset];
  objc_msgSend(v56, "hintedSizeForSize:", width, height);
  objc_msgSend(v54, "setOffset:");

  v57 = [(ISMultipleFilesRecipe *)self hintedShadowBlur];
  objc_msgSend(v57, "hintedFloatForSize:", width, height);
  objc_msgSend(v54, "setSpread:");

  v58 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.0 alpha:0.28];
  [v54 setColor:v58];

  [v54 setScale:a6];
  [(ISLayer *)v53 setEffect:v54];
  [(ISLayer *)v53 addSublayer:v14];
  v59 = objc_opt_new();
  objc_msgSend(v59, "setSize:", width, height);
  [v59 addSublayer:v53];

  return v59;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISLayer *)v8 setName:@"root layer"];
  double v9 = [(ISMultipleFilesRecipe *)self hintedUnderPaperRect];
  objc_msgSend(v9, "hintedRectForSize:", width, height);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  v18 = -[ISMultipleFilesRecipe documentLayerWithRect:withPageFold:iconSize:scale:](self, "documentLayerWithRect:withPageFold:iconSize:scale:", 0, v11, v13, v15, v17, width, height, a4);
  [(ISLayer *)v8 addSublayer:v18];

  v19 = [(ISMultipleFilesRecipe *)self hintedPaperRect];
  objc_msgSend(v19, "hintedRectForSize:", width, height);
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;

  v28 = -[ISMultipleFilesRecipe documentLayerWithRect:withPageFold:iconSize:scale:](self, "documentLayerWithRect:withPageFold:iconSize:scale:", 1, v21, v23, v25, v27, width, height, a4);
  [(ISLayer *)v8 addSublayer:v28];

  return v8;
}

@end