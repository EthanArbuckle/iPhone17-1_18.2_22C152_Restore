@interface ISiOSAppClipRecipe
- (BOOL)shouldOnlyDrawBorder;
- (id)appRect;
- (id)blurRadius;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (void)setShouldOnlyDrawBorder:(BOOL)a3;
@end

@implementation ISiOSAppClipRecipe

- (id)appRect
{
  if (appRect_onceToken != -1) {
    dispatch_once(&appRect_onceToken, &__block_literal_global_171);
  }
  v2 = (void *)appRect_rect;
  return v2;
}

uint64_t __29__ISiOSAppClipRecipe_appRect__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)appRect_rect;
  appRect_rect = (uint64_t)v0;

  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 2.0, 2.0, 16.0, 16.0, 20.0, 20.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 3.0, 3.0, 23.0, 23.0, 29.0, 29.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 4.0, 4.0, 28.0, 28.0, 36.0, 36.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 4.0, 4.0, 32.0, 32.0, 40.0, 40.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 6.0, 6.0, 44.0, 44.0, 56.0, 56.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 6.0, 6.0, 47.0, 47.0, 60.0, 60.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 7.0, 7.0, 50.0, 50.0, 64.0, 64.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 9.0, 9.0, 58.0, 58.0, 76.0, 76.0);
  objc_msgSend((id)appRect_rect, "addHintedRect:forSize:", 10.0, 10.0, 63.5, 63.5, 83.5, 83.5);
  v2 = (void *)appRect_rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 51.0, 51.0, 410.0, 410.0, 512.0, 512.0);
}

- (id)blurRadius
{
  if (blurRadius_onceToken != -1) {
    dispatch_once(&blurRadius_onceToken, &__block_literal_global_173);
  }
  v2 = (void *)blurRadius_value;
  return v2;
}

uint64_t __32__ISiOSAppClipRecipe_blurRadius__block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedFloat alloc] initWithOptions:3];
  v1 = (void *)blurRadius_value;
  blurRadius_value = (uint64_t)v0;

  objc_msgSend((id)blurRadius_value, "addHintedFloat:forSize:", 2.0, 20.0, 20.0);
  v2 = (void *)blurRadius_value;
  return objc_msgSend(v2, "addHintedFloat:forSize:", 50.0, 512.0, 512.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v39[2] = *MEMORY[0x1E4F143B8];
  id v38 = 0;
  uint64_t v7 = -[ISiOSAppRecipe primaryResourceEffectReturningBackgroundContentOverride:](self, "primaryResourceEffectReturningBackgroundContentOverride:", &v38, a3.width, a3.height, a4);
  id v8 = v38;
  v9 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v9, "setSize:", width, height);
  [(ISLayer *)v9 setName:@"root layer"];
  v10 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v10 setName:@"Base layer"];
  -[ISLayer setSize:](v10, "setSize:", width, height);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:0.0];
  [(ISContentLayer *)v10 setContent:v11];

  v12 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v12 setName:@"Background layer"];
  -[ISLayer setSize:](v12, "setSize:", width, height);
  v36 = v8;
  [(ISContentLayer *)v12 setContent:v8];
  v13 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v13 setName:@"Blur layer"];
  -[ISLayer setSize:](v13, "setSize:", width, height);
  [(ISContentLayer *)v13 setContent:@"kISPrimaryResourceKey"];
  v37 = (void *)v7;
  if (v7)
  {
    v14 = [ISStackedEffects alloc];
    v39[0] = v7;
    v15 = [ISBlurEffect alloc];
    v16 = [(ISiOSAppClipRecipe *)self blurRadius];
    objc_msgSend(v16, "hintedFloatForSize:", width, height);
    v17 = -[ISBlurEffect initWithRadius:](v15, "initWithRadius:");
    v39[1] = v17;
    v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    v19 = [(ISStackedEffects *)v14 initWithEffects:v18];
    [(ISLayer *)v13 setEffect:v19];
  }
  else
  {
    v20 = [ISBlurEffect alloc];
    v16 = [(ISiOSAppClipRecipe *)self blurRadius];
    objc_msgSend(v16, "hintedFloatForSize:", width, height);
    v17 = -[ISBlurEffect initWithRadius:](v20, "initWithRadius:");
    [(ISLayer *)v13 setEffect:v17];
  }

  [(ISLayer *)v12 addSublayer:v13];
  unint64_t v21 = 0x1E4F6F000;
  unint64_t v22 = 0x1E4F6F000;
  if (!self->_shouldOnlyDrawBorder)
  {
    v23 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v23 setName:@"Center Image Background"];
    -[ISLayer setSize:](v23, "setSize:", width, height);
    if (v37)
    {
      [(ISContentLayer *)v23 setContent:v36];
    }
    else
    {
      v24 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
      [(ISContentLayer *)v23 setContent:v24];
    }
    v25 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v25 setName:@"Center Image"];
    v26 = [(ISiOSAppClipRecipe *)self appRect];
    objc_msgSend(v26, "hintedRectForSize:", width, height);
    -[ISLayer setFrame:](v25, "setFrame:");

    [(ISContentLayer *)v25 setContent:@"kISPrimaryResourceKey"];
    [(ISLayer *)v25 setEffect:v37];
    [(ISLayer *)v23 addSublayer:v25];
    v27 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v27 setName:@"Center Image mask"];
    [(ISLayer *)v23 bounds];
    -[ISLayer setFrame:](v27, "setFrame:");
    v28 = (void *)MEMORY[0x1E4F6F1F0];
    v29 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
    v30 = [v28 imageBagWithResourcesNamed:@"AppClipCenterMask" fromBundle:v29];
    [(ISContentLayer *)v27 setContent:v30];

    unint64_t v21 = 0x1E4F6F000uLL;
    unint64_t v22 = 0x1E4F6F000uLL;
    [(ISLayer *)v23 setMask:v27];
    [(ISLayer *)v10 addSublayer:v23];
  }
  [(ISLayer *)v10 addSublayer:v12];
  v31 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v31, "setSize:", width, height);
  [(ISLayer *)v31 setName:@"mask layer"];
  v32 = *(void **)(v21 + 496);
  v33 = [*(id *)(v22 + 448) iconsetResourceBundle];
  v34 = [v32 imageBagWithResourcesNamed:@"AppClipMask" fromBundle:v33];
  [(ISContentLayer *)v31 setContent:v34];

  [(ISLayer *)v12 setMask:v31];
  [(ISLayer *)v9 addSublayer:v10];

  return v9;
}

- (BOOL)shouldOnlyDrawBorder
{
  return self->_shouldOnlyDrawBorder;
}

- (void)setShouldOnlyDrawBorder:(BOOL)a3
{
  self->_shouldOnlyDrawBorder = a3;
}

@end