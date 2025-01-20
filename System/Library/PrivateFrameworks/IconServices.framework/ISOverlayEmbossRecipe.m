@interface ISOverlayEmbossRecipe
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)variant;
- (void)setVariant:(unint64_t)a3;
@end

@implementation ISOverlayEmbossRecipe

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
  -[ISLayer setSize:](v9, "setSize:", width, height);
  [(ISContentLayer *)v9 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v7 addSublayer:v9];

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