@interface ISiOSAppRecipe
- (BOOL)allowDarkAndTintable;
- (BOOL)generic;
- (BOOL)segment;
- (BOOL)shouldApplyMask;
- (BOOL)shouldDrawBorder;
- (BOOL)templateVariant;
- (IFColor)tintColor;
- (IFIconSpecification)iconSpecification;
- (ISiOSAppRecipe)init;
- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4;
- (id)primaryResourceEffectReturningBackgroundContentOverride:(id *)a3;
- (int64_t)appearance;
- (unint64_t)background;
- (void)setAllowDarkAndTintable:(BOOL)a3;
- (void)setAppearance:(int64_t)a3;
- (void)setBackground:(unint64_t)a3;
- (void)setGeneric:(BOOL)a3;
- (void)setSegment:(BOOL)a3;
- (void)setShouldApplyMask:(BOOL)a3;
- (void)setShouldDrawBorder:(BOOL)a3;
- (void)setTemplateVariant:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)updateRecipeWithImageDescriptor:(id)a3;
@end

@implementation ISiOSAppRecipe

- (ISiOSAppRecipe)init
{
  v5.receiver = self;
  v5.super_class = (Class)ISiOSAppRecipe;
  v2 = [(ISiOSAppRecipe *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(ISiOSAppRecipe *)v2 setShouldApplyMask:1];
    [(ISiOSAppRecipe *)v3 setShouldDrawBorder:0];
    [(ISiOSAppRecipe *)v3 setTintColor:0];
    [(ISiOSAppRecipe *)v3 setAllowDarkAndTintable:0];
    [(ISiOSAppRecipe *)v3 setSegment:0];
  }
  return v3;
}

- (void)updateRecipeWithImageDescriptor:(id)a3
{
  id v4 = a3;
  -[ISiOSAppRecipe setShouldApplyMask:](self, "setShouldApplyMask:", [v4 shouldApplyMask]);
  -[ISiOSAppRecipe setShouldDrawBorder:](self, "setShouldDrawBorder:", [v4 drawBorder]);
  uint64_t v5 = [v4 tintColor];
  [(ISiOSAppRecipe *)self setTintColor:v5];

  -[ISiOSAppRecipe setAppearance:](self, "setAppearance:", [v4 appearance]);
  -[ISiOSAppRecipe setBackground:](self, "setBackground:", [v4 background]);
  -[ISiOSAppRecipe setTemplateVariant:](self, "setTemplateVariant:", [v4 templateVariant]);
  LOBYTE(v5) = [v4 specialIconOptions];

  if ((v5 & 2) != 0)
  {
    [(ISiOSAppRecipe *)self setAllowDarkAndTintable:1];
  }
}

- (id)primaryResourceEffectReturningBackgroundContentOverride:(id *)a3
{
  if ([(ISiOSAppRecipe *)self templateVariant])
  {
    *a3 = 0;
    uint64_t v5 = (ISBlendledTintEffect *)objc_opt_new();
LABEL_3:
    v6 = (ISSegmentTintEffect *)v5;
    goto LABEL_16;
  }
  if (![(ISiOSAppRecipe *)self allowDarkAndTintable]
    || [(ISiOSAppRecipe *)self appearance] != 2)
  {
    if (![(ISiOSAppRecipe *)self allowDarkAndTintable]
      || [(ISiOSAppRecipe *)self appearance] != 1)
    {
      [MEMORY[0x1E4F6F1C8] white];
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    *a3 = objc_alloc_init(ISDarkBackgroundResource);
    if ([(ISiOSAppRecipe *)self segment])
    {
      v9 = ISSegmentDarkEffect;
    }
    else
    {
      v11 = +[ISDefaults sharedInstance];
      int v12 = [v11 isDarkIconDimmingForDedicatedAssetsEnabled];

      if (!v12)
      {
LABEL_26:
        v6 = 0;
        goto LABEL_16;
      }
      v9 = ISIntelligentDimEffect;
    }
    uint64_t v5 = (ISBlendledTintEffect *)objc_alloc_init(v9);
    goto LABEL_3;
  }
  *a3 = objc_alloc_init(ISDarkBackgroundResource);
  if ([(ISiOSAppRecipe *)self generic]) {
    *a3 = (id)[objc_alloc(MEMORY[0x1E4F6F1C8]) initWithRed:0.0784 green:0.0784 blue:0.0784 alpha:1.0];
  }
  if (![(ISiOSAppRecipe *)self segment])
  {
    if (self->tintColor)
    {
      uint64_t v5 = [[ISBlendledTintEffect alloc] initWithColor:self->tintColor];
      goto LABEL_3;
    }
    goto LABEL_26;
  }
  v7 = [ISSegmentTintEffect alloc];
  v8 = [(ISiOSAppRecipe *)self tintColor];
  if (v8)
  {
    v6 = [(ISSegmentTintEffect *)v7 initWithColor:v8];
  }
  else
  {
    v13 = [MEMORY[0x1E4F6F1C8] white];
    v6 = [(ISSegmentTintEffect *)v7 initWithColor:v13];
  }
LABEL_16:
  if ([(ISiOSAppRecipe *)self background] == 1) {
    *a3 = 0;
  }
  return v6;
}

- (id)layerTreeForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  v8 = objc_alloc_init(ISLayer);
  -[ISLayer setSize:](v8, "setSize:", width, height);
  [(ISLayer *)v8 setName:@"root layer"];
  v9 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v9 setName:@"Background"];
  -[ISLayer setSize:](v9, "setSize:", width, height);
  v10 = objc_alloc_init(ISContentLayer);
  [(ISLayer *)v10 setName:@"primary asset layer"];
  -[ISLayer setSize:](v10, "setSize:", width, height);
  [(ISContentLayer *)v10 setContent:@"kISPrimaryResourceKey"];
  id v19 = 0;
  v11 = [(ISiOSAppRecipe *)self primaryResourceEffectReturningBackgroundContentOverride:&v19];
  id v12 = v19;
  [(ISLayer *)v10 setEffect:v11];

  [(ISContentLayer *)v9 setContent:v12];
  [(ISLayer *)v9 addSublayer:v10];
  if ([(ISiOSAppRecipe *)self shouldApplyMask]
    && ![(ISiOSAppRecipe *)self templateVariant])
  {
    v13 = objc_alloc_init(ISContentLayer);
    -[ISLayer setSize:](v13, "setSize:", width, height);
    [(ISLayer *)v13 setName:@"mask layer"];
    v14 = +[ISShapeCompositorResource continuousRoundedRectShape];
    [(ISContentLayer *)v13 setContent:v14];

    [(ISLayer *)v9 setMask:v13];
  }
  [(ISLayer *)v8 addSublayer:v9];

  if ([(ISiOSAppRecipe *)self shouldDrawBorder])
  {
    v15 = objc_alloc_init(ISContentLayer);
    [(ISLayer *)v15 setName:@"border"];
    -[ISLayer setSize:](v15, "setSize:", width, height);
    v16 = objc_opt_new();
    v17 = objc_msgSend(MEMORY[0x1E4F6F1C8], "borderColorForAppearance:", -[ISiOSAppRecipe appearance](self, "appearance"));
    [v16 setLineColor:v17];

    [v16 setFillColor:0];
    [v16 setLineWidth:1.0 / a4];
    [(ISContentLayer *)v15 setContent:v16];
    [(ISLayer *)v8 addSublayer:v15];
  }
  return v8;
}

- (IFIconSpecification)iconSpecification
{
  return (IFIconSpecification *)[MEMORY[0x1E4F6F1E0] iosAppIconSpecification];
}

- (BOOL)shouldApplyMask
{
  return self->shouldApplyMask;
}

- (void)setShouldApplyMask:(BOOL)a3
{
  self->shouldApplyMask = a3;
}

- (BOOL)shouldDrawBorder
{
  return self->shouldDrawBorder;
}

- (void)setShouldDrawBorder:(BOOL)a3
{
  self->shouldDrawBorder = a3;
}

- (IFColor)tintColor
{
  return (IFColor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setTintColor:(id)a3
{
}

- (int64_t)appearance
{
  return self->appearance;
}

- (void)setAppearance:(int64_t)a3
{
  self->appearance = a3;
}

- (unint64_t)background
{
  return self->background;
}

- (void)setBackground:(unint64_t)a3
{
  self->background = a3;
}

- (BOOL)templateVariant
{
  return self->_templateVariant;
}

- (void)setTemplateVariant:(BOOL)a3
{
  self->_templateVariant = a3;
}

- (BOOL)allowDarkAndTintable
{
  return self->_allowDarkAndTintable;
}

- (void)setAllowDarkAndTintable:(BOOL)a3
{
  self->_allowDarkAndTintable = a3;
}

- (BOOL)segment
{
  return self->_segment;
}

- (void)setSegment:(BOOL)a3
{
  self->_segment = a3;
}

- (BOOL)generic
{
  return self->_generic;
}

- (void)setGeneric:(BOOL)a3
{
  self->_generic = a3;
}

- (void).cxx_destruct
{
}

@end