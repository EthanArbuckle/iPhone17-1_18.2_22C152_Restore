@interface ISiosmacDocumentRecipe
- (id)hintedBadgeRect;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
@end

@implementation ISiosmacDocumentRecipe

- (id)hintedBadgeRect
{
  if (hintedBadgeRect_onceToken_1 != -1) {
    dispatch_once(&hintedBadgeRect_onceToken_1, &__block_literal_global_36);
  }
  v2 = (void *)hintedBadgeRect_rect_1;
  return v2;
}

uint64_t __41__ISiosmacDocumentRecipe_hintedBadgeRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)hintedBadgeRect_rect_1;
  hintedBadgeRect_rect_1 = (uint64_t)v0;

  v2 = (void *)hintedBadgeRect_rect_1;
  return objc_msgSend(v2, "addHintedRect:forSize:", 112.0, 112.0, 288.0, 288.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v6 = [(ISiosmacDocumentRecipe *)self hintedBadgeRect];
  objc_msgSend(v6, "hintedRectForSize:", width, height);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  v15 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v15, "setSize:", width, height);
  [(ISLayer *)v15 setName:@"layer"];
  v16 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v16 setName:@"Background layer"];
  -[ISLayer setSize:](v16, "setSize:", width, height);
  v17 = (void *)MEMORY[0x1E4F6F1F0];
  v18 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v19 = [v17 imageBagWithResourcesNamed:@"GenericBackground" fromBundle:v18];

  [(ISContentLayer *)v16 setContent:v19];
  [(ISLayer *)v15 addSublayer:v16];

  v20 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v20 setName:@"masked layer"];
  -[ISLayer setSize:](v20, "setSize:", width, height);
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:1.0];
  [(ISContentLayer *)v20 setContent:v21];

  v22 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v22 setName:@"masked badge layer"];
  -[ISLayer setFrame:](v22, "setFrame:", v8, v10, v12, v14);
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(ISContentLayer *)v22 setBackgroundColor:v23];

  [(ISContentLayer *)v22 setContent:@"kISPrimaryResourceKey"];
  v24 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v24, "setSize:", v12, v14);
  [(ISLayer *)v24 setName:@"mask layer"];
  v25 = +[ISShapeCompositorResource continuousRoundedRectShape];
  [(ISContentLayer *)v24 setContent:v25];

  [(ISLayer *)v22 setMask:v24];
  [(ISLayer *)v20 addSublayer:v22];

  v26 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v26, "setSize:", width, height);
  [(ISLayer *)v26 setName:@"mask layer"];
  v27 = (void *)MEMORY[0x1E4F6F1F0];
  v28 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v29 = [v27 imageBagWithResourcesNamed:@"GenericFullDocumentMask" fromBundle:v28];

  if (v29)
  {
    [(ISContentLayer *)v26 setContent:v29];
    [(ISLayer *)v20 setMask:v26];
  }

  [(ISLayer *)v15 addSublayer:v20];
  v30 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v30 setName:@"Forground layer"];
  -[ISLayer setSize:](v30, "setSize:", width, height);
  v31 = (void *)MEMORY[0x1E4F6F1F0];
  v32 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v33 = [v31 imageBagWithResourcesNamed:@"GenericForeground" fromBundle:v32];

  [(ISContentLayer *)v30 setContent:v33];
  [(ISLayer *)v15 addSublayer:v30];

  return v15;
}

@end