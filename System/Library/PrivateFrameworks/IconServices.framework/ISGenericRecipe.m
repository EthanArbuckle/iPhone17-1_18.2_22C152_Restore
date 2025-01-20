@interface ISGenericRecipe
- (BOOL)selectedVariant;
- (BOOL)templateVariant;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (unint64_t)backgroundStyle;
- (unint64_t)borderWidth;
- (void)setBackgroundStyle:(unint64_t)a3;
- (void)setBorderWidth:(unint64_t)a3;
- (void)setSelectedVariant:(BOOL)a3;
- (void)setTemplateVariant:(BOOL)a3;
@end

@implementation ISGenericRecipe

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(ISContentLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISLayer *)v8 setName:@"layer"];
  v9 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v9 setName:@"Base layer"];
  -[ISLayer setSize:](v9, "setSize:", width, height);
  [(ISContentLayer *)v9 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v8 addSublayer:v9];

  if ([(ISGenericRecipe *)self borderWidth])
  {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithWhite:0.5 alpha:1.0];
    v11 = [[ISBorderEffect alloc] initWithLineWidth:v10 color:(double)[(ISGenericRecipe *)self borderWidth] * a4];
    [(ISLayer *)v8 setEffect:v11];
  }
  return v8;
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (void)setBackgroundStyle:(unint64_t)a3
{
  self->_backgroundStyle = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (unint64_t)borderWidth
{
  return self->_borderWidth;
}

- (void)setBorderWidth:(unint64_t)a3
{
  self->_borderWidth = a3;
}

@end