@interface ISrOSAppRecipe
- (BOOL)shouldApplyMask;
- (BOOL)templateVariant;
- (IFIconSpecification)iconSpecification;
- (ISrOSAppRecipe)init;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (void)setShouldApplyMask:(BOOL)a3;
- (void)setTemplateVariant:(BOOL)a3;
@end

@implementation ISrOSAppRecipe

- (ISrOSAppRecipe)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISrOSAppRecipe;
  v2 = [(ISrOSAppRecipe *)&v5 init];
  v3 = v2;
  if (v2) {
    [(ISrOSAppRecipe *)v2 setShouldApplyMask:1];
  }
  return v3;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  [(ISLayer *)v7 setName:@"layer"];
  v8 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v8 setName:@"Background"];
  -[ISLayer setSize:](v8, "setSize:", width, height);
  if (![(ISrOSAppRecipe *)self templateVariant])
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
    [(ISContentLayer *)v8 setContent:v9];
  }
  [(ISLayer *)v7 addSublayer:v8];

  v10 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v10 setName:@"Image"];
  -[ISLayer setSize:](v10, "setSize:", width, height);
  [(ISContentLayer *)v10 setContent:@"kISPrimaryResourceKey"];
  if ([(ISrOSAppRecipe *)self templateVariant])
  {
    v11 = objc_opt_new();
    [(ISLayer *)v10 setEffect:v11];
  }
  [(ISLayer *)v7 addSublayer:v10];

  if ([(ISrOSAppRecipe *)self shouldApplyMask]
    && ![(ISrOSAppRecipe *)self templateVariant])
  {
    v12 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v12, "setSize:", width, height);
    [(ISLayer *)v12 setName:@"mask layer"];
    v13 = +[ISShapeCompositorResource circleShape];
    [(ISContentLayer *)v12 setContent:v13];

    [(ISLayer *)v7 setMask:v12];
  }
  return v7;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)[MEMORY[0x1E4F6F1E0] rOSAppIconSpecification];
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

@end