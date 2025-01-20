@interface PKPaletteErasingToolView
- (BOOL)isBitmapEraser;
- (NSString)toolIdentifier;
- (PKPaletteErasingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5;
- (double)weight;
- (id)attributeViewController;
- (void)_updateAttributesViewController;
- (void)_updateAttributesViewControllerWeight;
- (void)erasingAttributesViewControllerDidChangeErasingType:(id)a3;
- (void)erasingAttributesViewControllerDidChangeInkThickness:(id)a3;
- (void)setBitmapEraser:(BOOL)a3;
- (void)setToolProperties:(id)a3;
- (void)setToolProperties:(id)a3 updateUI:(BOOL)a4;
@end

@implementation PKPaletteErasingToolView

- (PKPaletteErasingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  id v8 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPaletteErasingToolView;
  v9 = [(PKPaletteToolView *)&v11 initWithToolIdentifier:v8 variant:a4 configuration:a5];
  if (v9) {
    -[PKPaletteErasingToolView setBitmapEraser:](v9, "setBitmapEraser:", [v8 isEqualToString:@"com.apple.ink.eraser"]);
  }

  return v9;
}

- (NSString)toolIdentifier
{
  BOOL v2 = [(PKPaletteErasingToolView *)self isBitmapEraser];
  v3 = PKInkIdentifierEraser;
  if (!v2) {
    v3 = PKInkIdentifierObjectEraser;
  }
  v4 = *v3;

  return (NSString *)v4;
}

- (void)setBitmapEraser:(BOOL)a3
{
  if (self->_bitmapEraser != a3)
  {
    self->_bitmapEraser = a3;
    id v8 = [(PKPaletteErasingToolView *)self toolIdentifier];
    uint64_t v4 = [(PKPaletteToolView *)self configuration];
    v5 = (void *)v4;
    if (v4) {
      uint64_t v6 = *(void *)(v4 + 152);
    }
    else {
      uint64_t v6 = 0;
    }
    v7 = +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:inkVersion:]((uint64_t)PKToolConfiguration, v8, v6);
    [(PKPaletteToolView *)self setConfiguration:v7];
  }
}

- (double)weight
{
  v3 = [(PKPaletteToolView *)self configuration];
  if (v3)
  {
    uint64_t v4 = v3[19];

    if (v4 == 3) {
      return NAN;
    }
  }
  attributeViewController = self->_attributeViewController;

  [(PKPaletteAttributeViewController *)attributeViewController weight];
  return result;
}

- (void)setToolProperties:(id)a3
{
}

- (void)setToolProperties:(id)a3 updateUI:(BOOL)a4
{
  BOOL v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteErasingToolView;
  [(PKPaletteToolView *)&v6 setToolProperties:a3];
  if (v4) {
    [(PKPaletteErasingToolView *)self _updateAttributesViewController];
  }
}

- (id)attributeViewController
{
  if (!self->_attributeViewController)
  {
    v3 = objc_alloc_init(PKPaletteErasingAttributesViewController);
    [(PKPaletteErasingAttributesViewController *)v3 setDelegate:self];
    attributeViewController = self->_attributeViewController;
    self->_attributeViewController = &v3->super;
  }
  [(PKPaletteErasingToolView *)self _updateAttributesViewController];
  v5 = self->_attributeViewController;

  return v5;
}

- (void)_updateAttributesViewController
{
  v3 = self->_attributeViewController;
  [(PKPaletteAttributeViewController *)v3 setEraserType:[(PKPaletteErasingToolView *)self isBitmapEraser] ^ 1];
  uint64_t v4 = [(PKPaletteToolView *)self configuration];
  v5 = (void *)v4;
  if (v4) {
    BOOL v6 = *(void *)(v4 + 152) == 3;
  }
  else {
    BOOL v6 = 0;
  }
  [(PKPaletteAttributeViewController *)v3 setHideWeightPicker:v6];

  [(PKPaletteErasingToolView *)self _updateAttributesViewControllerWeight];
}

- (void)_updateAttributesViewControllerWeight
{
  v5 = self->_attributeViewController;
  if ([(PKPaletteErasingToolView *)self isBitmapEraser])
  {
    v3 = [(PKPaletteToolView *)self toolProperties];
    uint64_t v4 = [v3 objectForKeyedSubscript:@"PKInkWeightProperty"];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [(PKPaletteErasingToolView *)self isBitmapEraser])
    {
      [v4 doubleValue];
      -[PKPaletteAttributeViewController setWeight:](v5, "setWeight:");
    }
  }
  else
  {
    [(PKPaletteAttributeViewController *)v5 setWeight:0.0];
  }
}

- (void)erasingAttributesViewControllerDidChangeErasingType:(id)a3
{
  id v4 = a3;
  -[PKPaletteErasingToolView setBitmapEraser:](self, "setBitmapEraser:", [v4 eraserType] == 0);
  [(PKPaletteErasingToolView *)self _updateAttributesViewControllerWeight];
  [(PKPaletteErasingToolView *)self sendActionsForControlEvents:4096];
  +[PKStatisticsManager sharedStatisticsManager]();
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 eraserType];

  -[PKStatisticsManager recordPixelObjectEraseModeChange:]((uint64_t)v6, v5);
}

- (void)erasingAttributesViewControllerDidChangeInkThickness:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaletteToolView *)self toolProperties];
  id v11 = (id)[v5 mutableCopy];

  id v6 = NSNumber;
  [v4 weight];
  double v8 = v7;

  v9 = [v6 numberWithDouble:v8];
  [v11 setObject:v9 forKeyedSubscript:@"PKInkWeightProperty"];

  v10 = (void *)[v11 copy];
  [(PKPaletteErasingToolView *)self setToolProperties:v10 updateUI:0];

  [(PKPaletteErasingToolView *)self sendActionsForControlEvents:4096];
}

- (BOOL)isBitmapEraser
{
  return self->_bitmapEraser;
}

- (void).cxx_destruct
{
}

@end