@interface IStvOSAppRecipe
- (BOOL)shouldApplyMask;
- (IFIconSpecification)iconSpecification;
- (IStvOSAppRecipe)init;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (void)setShouldApplyMask:(BOOL)a3;
@end

@implementation IStvOSAppRecipe

- (IStvOSAppRecipe)init
{
  v5.receiver = self;
  v5.super_class = (Class)IStvOSAppRecipe;
  v2 = [(IStvOSAppRecipe *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IStvOSAppRecipe *)v2 setShouldApplyMask:1];
  }
  return v3;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v7 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v7, "setSize:", width, height);
  [(ISLayer *)v7 setName:@"root"];
  v8 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v8 setName:@"Background"];
  -[ISLayer setSize:](v8, "setSize:", width, height);
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0 green:0.0 blue:0.0 alpha:1.0];
  [(ISContentLayer *)v8 setContent:v9];

  [(ISLayer *)v7 addSublayer:v8];
  v10 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v8 setName:@"Background"];
  -[ISLayer setSize:](v8, "setSize:", width, height);
  -[ISLayer setFrame:](v8, "setFrame:", 0.0, 0.0, width, height);
  [(ISContentLayer *)v8 setContent:@"kISPrimaryResourceKey"];
  [(ISLayer *)v7 addSublayer:v10];
  if ([(IStvOSAppRecipe *)self shouldApplyMask])
  {
    v11 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v11, "setSize:", width, height);
    -[ISLayer setFrame:](v11, "setFrame:", 0.0, 0.0, width, height);
    [(ISLayer *)v11 setName:@"mask layer"];
    v12 = +[ISShapeCompositorResource tvOSRoundedRectShape];
    [(ISContentLayer *)v11 setContent:v12];

    [(ISLayer *)v7 setMask:v11];
  }

  return v7;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)[MEMORY[0x1E4F6F1E0] tvAppIconSpecification];
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

@end