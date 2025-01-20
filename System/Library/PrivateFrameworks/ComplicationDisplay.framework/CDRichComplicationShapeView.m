@interface CDRichComplicationShapeView
- (BOOL)_shouldReverseGradient;
- (CGPath)_generatePath;
- (CGPoint)_pointAtProgress:(float)a3;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSArray)gradientColors;
- (double)_shapeLineWidth;
- (double)progress;
- (id)_normalizeGradientLocations:(id)a3;
- (id)_shapeStrokeColor;
- (id)device;
- (id)gradientLayer;
- (id)initForDevice:(id)a3 withFilterStyle:(int64_t)a4;
- (id)shapeLayer;
- (int64_t)filterStyle;
- (void)_setupGradientLayer:(id)a3;
- (void)_updateGradient;
- (void)_updatePath;
- (void)layoutSubviews;
- (void)setFilterProvider:(id)a3;
- (void)setGradientColors:(id)a3;
- (void)setGradientColors:(id)a3 locations:(id)a4;
- (void)setProgress:(double)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)unfreezeForTransaction;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationShapeView

- (id)initForDevice:(id)a3 withFilterStyle:(int64_t)a4
{
  id v7 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CDRichComplicationShapeView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[CDRichComplicationShapeView initWithFrame:](&v23, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_device, a3);
    v13->_progress = 1.0;
    v14 = (CAGradientLayer *)objc_alloc_init(MEMORY[0x263F157D0]);
    gradientLayer = v13->_gradientLayer;
    v13->_gradientLayer = v14;

    [(CDRichComplicationShapeView *)v13 _setupGradientLayer:v13->_gradientLayer];
    v16 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D80]];
    [(CAGradientLayer *)v13->_gradientLayer setCompositingFilter:v16];

    v17 = (CALayer *)objc_alloc_init(MEMORY[0x263F157E8]);
    freezeLayer = v13->_freezeLayer;
    v13->_freezeLayer = v17;

    [(CALayer *)v13->_freezeLayer setShouldRasterize:1];
    [(CLKDevice *)v13->_device screenScale];
    -[CALayer setRasterizationScale:](v13->_freezeLayer, "setRasterizationScale:");
    [(CALayer *)v13->_freezeLayer addSublayer:v13->_gradientLayer];
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    filterView = v13->_filterView;
    v13->_filterView = (UIView *)v19;

    v21 = [(UIView *)v13->_filterView layer];
    [v21 addSublayer:v13->_freezeLayer];

    [(CDRichComplicationShapeView *)v13 addSubview:v13->_filterView];
    v13->_filterStyle = a4;
  }

  return v13;
}

- (void)setProgress:(double)a3
{
  double v3 = fmin(a3, 1.0);
  if (v3 < 0.0) {
    double v3 = 0.0;
  }
  if (v3 != self->_progress)
  {
    self->_progress = v3;
    [MEMORY[0x263F158F8] begin];
    [MEMORY[0x263F158F8] setDisableActions:1];
    [(CDRichComplicationShapeView *)self unfreezeForTransaction];
    [(CAShapeLayer *)self->_shapeLayer setStrokeEnd:self->_progress];
    v5 = (void *)MEMORY[0x263F158F8];
    [v5 commit];
  }
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CDRichComplicationShapeView;
  [(CDRichComplicationShapeView *)&v14 layoutSubviews];
  [(CDRichComplicationShapeView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  if (!CGRectEqualToRect(self->_previousBounds, v15))
  {
    [(CDRichComplicationShapeView *)self unfreezeForTransaction];
    self->_previousBounds.origin.x = v4;
    self->_previousBounds.origin.y = v6;
    self->_previousBounds.size.width = v8;
    self->_previousBounds.size.height = v10;
    [(CAShapeLayer *)self->_shapeLayer removeFromSuperlayer];
    double v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x263F15880]);
    shapeLayer = self->_shapeLayer;
    self->_shapeLayer = v11;

    -[CAShapeLayer setFrame:](self->_shapeLayer, "setFrame:", v4, v6, v8, v10);
    [(CAShapeLayer *)self->_shapeLayer setPath:[(CDRichComplicationShapeView *)self _generatePath]];
    [(CDRichComplicationShapeView *)self _shapeLineWidth];
    -[CAShapeLayer setLineWidth:](self->_shapeLayer, "setLineWidth:");
    id v13 = [MEMORY[0x263F825C8] clearColor];
    -[CAShapeLayer setFillColor:](self->_shapeLayer, "setFillColor:", [v13 CGColor]);

    [(CAShapeLayer *)self->_shapeLayer setStrokeStart:0.0];
    [(CAShapeLayer *)self->_shapeLayer setStrokeEnd:self->_progress];
    [(CAShapeLayer *)self->_shapeLayer setLineCap:*MEMORY[0x263F15E70]];
    [(CALayer *)self->_freezeLayer insertSublayer:self->_shapeLayer below:self->_gradientLayer];
    -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:", v4, v6, v8, v10);
    [(CDRichComplicationShapeView *)self _updateGradient];
    [(CDRichComplicationShapeView *)self _setupShapeLayer:self->_shapeLayer];
  }
}

- (void)unfreezeForTransaction
{
  if (!self->_willUnfreezeForTransaction)
  {
    self->_willUnfreezeForTransaction = 1;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke;
    v4[3] = &unk_2644A5280;
    v4[4] = self;
    [MEMORY[0x263F158F8] addCommitHandler:v4 forPhase:1];
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke_2;
    v3[3] = &unk_2644A5280;
    v3[4] = self;
    [MEMORY[0x263F158F8] addCommitHandler:v3 forPhase:2];
  }
}

uint64_t __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 448) = 0;
  return [*(id *)(*(void *)(a1 + 32) + 464) setFrozen:0];
}

uint64_t __53__CDRichComplicationShapeView_unfreezeForTransaction__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setFrozen:1];
}

- (void)setGradientColors:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    double v4 = [MEMORY[0x263EFF980] array];
    if ([v7 count])
    {
      unint64_t v5 = 0;
      do
      {
        double v6 = objc_msgSend(NSNumber, "numberWithDouble:", (double)(int)v5 / (double)(unint64_t)objc_msgSend(v7, "count"));
        [v4 addObject:v6];

        ++v5;
      }
      while ([v7 count] > v5);
    }
    [(CDRichComplicationShapeView *)self setGradientColors:v7 locations:v4];
  }
}

- (void)setGradientColors:(id)a3 locations:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  uint64_t v7 = (uint64_t)a3;
  unint64_t v8 = (unint64_t)a4;
  objc_storeStrong((id *)&self->_gradientColors, a3);
  if (self->_monochromeFraction == 1.0)
  {
    id v9 = [MEMORY[0x263F825C8] whiteColor];
    v25[0] = v9;
    double v10 = (id *)v25;
  }
  else
  {
    if ((unint64_t)[(id)v7 count] < 2) {
      goto LABEL_5;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v9 = (id)v7;
    uint64_t v13 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(v9);
          }
          v17 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          v18 = objc_msgSend(v9, "firstObject", (void)v19);
          LODWORD(v17) = [v17 isEqual:v18];

          if (!v17)
          {
            uint64_t v11 = (uint64_t)v9;
            goto LABEL_4;
          }
        }
        uint64_t v14 = [v9 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v9 = [v9 firstObject];
    id v23 = v9;
    double v10 = &v23;
  }
  uint64_t v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v10, 1, (void)v19);

LABEL_4:
  uint64_t v7 = v11;
LABEL_5:
  if (v7 | (uint64_t)self->_filteredGradientColors && !objc_msgSend((id)v7, "isEqualToArray:")
    || (gradientLocations = self->_gradientLocations, v8 | (unint64_t)gradientLocations)
    && ![(NSArray *)gradientLocations isEqualToArray:v8])
  {
    objc_storeStrong((id *)&self->_filteredGradientColors, (id)v7);
    objc_storeStrong((id *)&self->_gradientLocations, a4);
    [(CDRichComplicationShapeView *)self _updateGradient];
  }
}

- (void)_updatePath
{
  CGFloat v3 = [(CDRichComplicationShapeView *)self _generatePath];
  if ((unint64_t)[(CAShapeLayer *)self->_shapeLayer path] | (unint64_t)v3
    && !CGPathEqualToPath([(CAShapeLayer *)self->_shapeLayer path], v3))
  {
    [(CDRichComplicationShapeView *)self unfreezeForTransaction];
    double v4 = [(CDRichComplicationShapeView *)self _generatePath];
    shapeLayer = self->_shapeLayer;
    [(CAShapeLayer *)shapeLayer setPath:v4];
  }
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  unint64_t v5 = [(CDRichComplicationShapeView *)self filterProvider];
  objc_msgSend(v5, "filtersForView:style:fraction:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"), a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    double v6 = [(UIView *)self->_filterView layer];
    [v6 setFilters:v7];
  }
  self->_monochromeFraction = a3;
  [(CDRichComplicationShapeView *)self setGradientColors:self->_gradientColors locations:self->_gradientLocations];
}

- (void)updateMonochromeColor
{
  CGFloat v3 = [(CDRichComplicationShapeView *)self filterProvider];
  objc_msgSend(v3, "filtersForView:style:", self, -[CDRichComplicationShapeView filterStyle](self, "filterStyle"));
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  double v4 = [(UIView *)self->_filterView layer];
  unint64_t v5 = v4;
  if (v7)
  {
    [v4 setFilters:v7];
    double v6 = 1.0;
  }
  else
  {
    [v4 setFilters:0];
    double v6 = 0.0;
  }

  self->_monochromeFraction = v6;
  [(CDRichComplicationShapeView *)self setGradientColors:self->_gradientColors locations:self->_gradientLocations];
}

- (void)_updateGradient
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(CDRichComplicationShapeView *)self unfreezeForTransaction];
  if ([(NSArray *)self->_filteredGradientColors count] == 1)
  {
    id v3 = [(CDRichComplicationShapeView *)self _shapeStrokeColor];
    -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", [v3 CGColor]);

    [(CAGradientLayer *)self->_gradientLayer setHidden:1];
    [(CAGradientLayer *)self->_gradientLayer setCompositingFilter:0];
  }
  else
  {
    double v4 = [MEMORY[0x263EFF980] array];
    unint64_t v5 = [(CDRichComplicationShapeView *)self _normalizeGradientLocations:self->_gradientLocations];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    double v6 = self->_filteredGradientColors;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          objc_msgSend(v4, "addObject:", objc_msgSend(v11, "CGColor", (void)v21));
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    id v12 = [(CDRichComplicationShapeView *)self _shapeStrokeColor];
    -[CAShapeLayer setStrokeColor:](self->_shapeLayer, "setStrokeColor:", [v12 CGColor]);

    [(CAGradientLayer *)self->_gradientLayer setHidden:0];
    uint64_t v13 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15D80]];
    [(CAGradientLayer *)self->_gradientLayer setCompositingFilter:v13];

    BOOL v14 = [(CDRichComplicationShapeView *)self _shouldReverseGradient];
    gradientLayer = self->_gradientLayer;
    if (v14)
    {
      v16 = [v4 reverseObjectEnumerator];
      v17 = [v16 allObjects];
      [(CAGradientLayer *)gradientLayer setColors:v17];

      v18 = self->_gradientLayer;
      long long v19 = [v5 reverseObjectEnumerator];
      long long v20 = [v19 allObjects];
      [(CAGradientLayer *)v18 setLocations:v20];
    }
    else
    {
      [(CAGradientLayer *)self->_gradientLayer setColors:v4];
      [(CAGradientLayer *)self->_gradientLayer setLocations:v5];
    }
  }
  objc_msgSend(MEMORY[0x263F158F8], "commit", (void)v21);
}

- (id)_shapeStrokeColor
{
  if ([(NSArray *)self->_filteredGradientColors count] == 1) {
    [(NSArray *)self->_filteredGradientColors objectAtIndexedSubscript:0];
  }
  else {
  id v3 = [MEMORY[0x263F825C8] whiteColor];
  }
  return v3;
}

- (id)device
{
  return self->_device;
}

- (id)gradientLayer
{
  return self->_gradientLayer;
}

- (id)shapeLayer
{
  return self->_shapeLayer;
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (NSArray)gradientColors
{
  return self->_gradientColors;
}

- (double)progress
{
  return self->_progress;
}

- (int64_t)filterStyle
{
  return self->_filterStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_filterProvider);
  objc_storeStrong((id *)&self->_gradientLocations, 0);
  objc_storeStrong((id *)&self->_filteredGradientColors, 0);
  objc_storeStrong((id *)&self->_gradientColors, 0);
  objc_storeStrong((id *)&self->_gradientLayer, 0);
  objc_storeStrong((id *)&self->_shapeLayer, 0);
  objc_storeStrong((id *)&self->_freezeLayer, 0);
  objc_storeStrong((id *)&self->_filterView, 0);
  objc_storeStrong((id *)&self->_device, 0);
}

- (void)_setupGradientLayer:(id)a3
{
  OUTLINED_FUNCTION_1();
  NSRequestConcreteImplementation();
}

- (double)_shapeLineWidth
{
  return 0.0;
}

- (CGPoint)_pointAtProgress:(float)a3
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  double v3 = *MEMORY[0x263F00148];
  double v4 = *(double *)(MEMORY[0x263F00148] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (id)_normalizeGradientLocations:(id)a3
{
  return 0;
}

- (CGPath)_generatePath
{
  return 0;
}

- (BOOL)_shouldReverseGradient
{
  return 0;
}

@end