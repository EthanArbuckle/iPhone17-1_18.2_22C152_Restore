@interface ISiosDocumentRecipe
- (CGSize)backgroundSizeForSize:(CGSize)a3 scale:(double)a4;
- (CGSize)badgeSizeForSize:(CGSize)a3 scale:(double)a4;
- (IFIconSpecification)iconSpecification;
- (ISiosDocumentRecipe)init;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)options;
- (void)setOptions:(unint64_t)a3;
@end

@implementation ISiosDocumentRecipe

- (ISiosDocumentRecipe)init
{
  v3.receiver = self;
  v3.super_class = (Class)ISiosDocumentRecipe;
  result = [(ISiosDocumentRecipe *)&v3 init];
  if (result) {
    result->_options = 0;
  }
  return result;
}

- (CGSize)badgeSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if (badgeSizeForSize_scale__onceToken != -1) {
    dispatch_once(&badgeSizeForSize_scale__onceToken, &__block_literal_global_183);
  }
  objc_msgSend((id)badgeSizeForSize_scale__rect, "hintedRectForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  result.double height = v9;
  result.double width = v7;
  return result;
}

uint64_t __46__ISiosDocumentRecipe_badgeSizeForSize_scale___block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)badgeSizeForSize_scale__rect;
  badgeSizeForSize_scale__rect = (uint64_t)v0;

  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 40.0, 40.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 44.0, 44.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 20.0, 20.0, 64.0, 64.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 38.0, 38.0, 84.0, 84.0);
  objc_msgSend((id)badgeSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 58.0, 58.0, 128.0, 128.0);
  v2 = (void *)badgeSizeForSize_scale__rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 0.0, 0.0, 145.0, 145.0, 320.0, 320.0);
}

- (CGSize)backgroundSizeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  if (backgroundSizeForSize_scale__onceToken != -1) {
    dispatch_once(&backgroundSizeForSize_scale__onceToken, &__block_literal_global_185);
  }
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "hintedRectForSize:", width, height);
  double v7 = v6;
  double v9 = v8;
  result.double height = v9;
  result.double width = v7;
  return result;
}

uint64_t __51__ISiosDocumentRecipe_backgroundSizeForSize_scale___block_invoke()
{
  v0 = [(ISHintedValue *)[ISHintedRect alloc] initWithOptions:3];
  v1 = (void *)backgroundSizeForSize_scale__rect;
  backgroundSizeForSize_scale__rect = (uint64_t)v0;

  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 30.0, 40.0, 40.0, 40.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 34.0, 44.0, 44.0, 44.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 37.0, 48.0, 48.0, 48.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 64.0, 84.0, 84.0, 84.0);
  objc_msgSend((id)backgroundSizeForSize_scale__rect, "addHintedRect:forSize:", 0.0, 0.0, 96.0, 128.0, 128.0, 128.0);
  v2 = (void *)backgroundSizeForSize_scale__rect;
  return objc_msgSend(v2, "addHintedRect:forSize:", 0.0, 0.0, 240.0, 320.0, 320.0, 320.0);
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  -[ISiosDocumentRecipe badgeSizeForSize:scale:](self, "badgeSizeForSize:scale:", a3.width, a3.height, a4);
  double v8 = v7;
  double v10 = v9;
  v11 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v11, "setSize:", width, height);
  [(ISLayer *)v11 setName:@"layer"];
  unint64_t options = self->_options;
  unint64_t v13 = [(ISiosDocumentRecipe *)self options] & 9;
  v14 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v14 setName:@"Background layer"];
  -[ISLayer setSize:](v14, "setSize:", width, height);
  if ((options & 6) != 0) {
    v15 = @"DocumentBaseNoPageCurl";
  }
  else {
    v15 = @"DocumentBase";
  }
  v16 = (void *)MEMORY[0x1E4F6F1F0];
  v17 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
  v18 = [v16 imageBagWithResourcesNamed:v15 fromBundle:v17];

  [(ISContentLayer *)v14 setContent:v18];
  [(ISLayer *)v11 addSublayer:v14];

  v19 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v19 setName:@"masked layer"];
  -[ISLayer setSize:](v19, "setSize:", width, height);
  v20 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
  [(ISContentLayer *)v19 setContent:v20];

  v21 = objc_alloc_init(ISLayer);
  [(ISLayer *)v21 setName:@"badge layer"];
  [(ISLayer *)v19 bounds];
  CGFloat v22 = CGRectGetMidX(v36) - v8 * 0.5;
  [(ISLayer *)v19 bounds];
  -[ISLayer setPosition:](v21, "setPosition:", v22, CGRectGetMidY(v37) - v10 * 0.5);
  -[ISLayer setSize:](v21, "setSize:", v8, v10);
  if ((options & 1) == 0)
  {
    v23 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v23 setName:@"Badge background"];
    -[ISLayer setSize:](v23, "setSize:", v8, v10);
    v24 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:1.0 green:1.0 blue:1.0 alpha:0.0];
    [(ISContentLayer *)v23 setContent:v24];

    [(ISLayer *)v21 addSublayer:v23];
  }
  v25 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v25 setName:@"Badge image"];
  -[ISLayer setSize:](v25, "setSize:", v8, v10);
  [(ISContentLayer *)v25 setContent:@"kISPrimaryResourceKey"];
  if (v13 == 9)
  {
    [(ISLayer *)v21 setMask:v25];
    v26 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v26 setName:@"Tint layer"];
    -[ISLayer setSize:](v26, "setSize:", v8, v10);
    v27 = [MEMORY[0x1E4F6F1C8] white];
    [(ISContentLayer *)v26 setContent:v27];

    [(ISLayer *)v21 addSublayer:v26];
  }
  else
  {
    [(ISLayer *)v21 addSublayer:v25];
  }

  if ((options & 1) == 0)
  {
    v28 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v28, "setSize:", v8, v10);
    [(ISLayer *)v28 setName:@"badge mask layer"];
    v29 = +[ISShapeCompositorResource continuousRoundedRectShape];
    [(ISContentLayer *)v28 setContent:v29];

    [(ISLayer *)v21 setMask:v28];
  }
  [(ISLayer *)v19 addSublayer:v21];
  if ((options & 2) == 0)
  {
    v30 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v30, "setSize:", width, height);
    [(ISLayer *)v30 setName:@"mask layer"];
    v31 = (void *)MEMORY[0x1E4F6F1F0];
    v32 = [MEMORY[0x1E4F6F1C0] iconsetResourceBundle];
    v33 = [v31 imageBagWithResourcesNamed:@"DocumentMask" fromBundle:v32];

    if (v33)
    {
      [(ISContentLayer *)v30 setContent:v33];
      [(ISLayer *)v19 setMask:v30];
    }
  }
  [(ISLayer *)v11 addSublayer:v19];

  return v11;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)[MEMORY[0x1E4F6F1E0] iosDocumentIconSpecification];
}

- (unint64_t)options
{
  return self->_options;
}

- (void)setOptions:(unint64_t)a3
{
  self->_unint64_t options = a3;
}

@end