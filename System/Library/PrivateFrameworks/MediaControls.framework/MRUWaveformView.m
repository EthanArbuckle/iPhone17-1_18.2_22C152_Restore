@interface MRUWaveformView
- (BOOL)isDimmed;
- (CALayer)artworkDimLayer;
- (CALayer)artworkLayer;
- (CALayer)artworkLightenLayer;
- (CALayer)contentLayer;
- (CALayer)fallbackLayer;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUWaveformData)waveformData;
- (MRUWaveformSettings)settings;
- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4;
- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4 settings:(id)a5;
- (NSArray)bars;
- (NSTimer)transitionTimer;
- (UIColor)fillColor;
- (UIImage)artworkImage;
- (UIView)barsContainerView;
- (UIView)barsView;
- (unint64_t)context;
- (void)applyContext:(unint64_t)a3;
- (void)layoutSubviews;
- (void)setArtworkDimLayer:(id)a3;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkLayer:(id)a3;
- (void)setArtworkLightenLayer:(id)a3;
- (void)setBars:(id)a3;
- (void)setBarsContainerView:(id)a3;
- (void)setBarsView:(id)a3;
- (void)setContentLayer:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setFallbackLayer:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setSettings:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTransitionTimer:(id)a3;
- (void)setWaveformData:(id)a3;
- (void)updateArtworkFilters;
- (void)updateLayers;
- (void)updateVisualStyle;
@end

@implementation MRUWaveformView

- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4 settings:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v64[2] = *MEMORY[0x1E4F143B8];
  id v12 = a5;
  v63.receiver = self;
  v63.super_class = (Class)MRUWaveformView;
  v13 = -[MRUWaveformView initWithFrame:](&v63, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_context = a4;
    uint64_t v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
    fillColor = v14->_fillColor;
    v14->_fillColor = (UIColor *)v15;

    objc_storeStrong((id *)&v14->_settings, a5);
    uint64_t v17 = +[MRUWaveformData zero];
    waveformData = v14->_waveformData;
    v14->_waveformData = (MRUWaveformData *)v17;

    v19 = [(MRUWaveformView *)v14 layer];
    [v19 setMasksToBounds:1];

    id v20 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v21 = (void *)[v20 initWithType:*MEMORY[0x1E4F3A048]];
    v22 = NSNumber;
    [(MRUWaveformSettings *)v14->_settings artworkSaturation];
    v23 = objc_msgSend(v22, "numberWithFloat:");
    [v21 setValue:v23 forKeyPath:*MEMORY[0x1E4F3A100]];

    id v24 = objc_alloc(MEMORY[0x1E4F39BC0]);
    v25 = (void *)[v24 initWithType:*MEMORY[0x1E4F3A0D0]];
    v26 = NSNumber;
    [(MRUWaveformSettings *)v14->_settings artworkBlur];
    v27 = objc_msgSend(v26, "numberWithFloat:");
    [v25 setValue:v27 forKeyPath:*MEMORY[0x1E4F3A1D8]];

    [v25 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1B8]];
    v28 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    artworkLightenLayer = v14->_artworkLightenLayer;
    v14->_artworkLightenLayer = v28;

    id v30 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
    -[CALayer setBackgroundColor:](v14->_artworkLightenLayer, "setBackgroundColor:", [v30 CGColor]);

    [(CALayer *)v14->_artworkLightenLayer setOpacity:0.0];
    [(CALayer *)v14->_artworkLightenLayer setName:@"lighten"];
    v31 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    artworkDimLayer = v14->_artworkDimLayer;
    v14->_artworkDimLayer = v31;

    id v33 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
    -[CALayer setBackgroundColor:](v14->_artworkDimLayer, "setBackgroundColor:", [v33 CGColor]);

    [(CALayer *)v14->_artworkDimLayer setOpacity:0.0];
    [(CALayer *)v14->_artworkDimLayer setName:@"dim"];
    v34 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    artworkLayer = v14->_artworkLayer;
    v14->_artworkLayer = v34;

    [(CALayer *)v14->_artworkLayer addSublayer:v14->_artworkLightenLayer];
    [(CALayer *)v14->_artworkLayer addSublayer:v14->_artworkDimLayer];
    v61 = v25;
    v64[0] = v21;
    v64[1] = v25;
    v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:2];
    [(CALayer *)v14->_artworkLayer setFilters:v36];

    [(CALayer *)v14->_artworkLayer setName:@"artwork"];
    v37 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    fallbackLayer = v14->_fallbackLayer;
    v14->_fallbackLayer = v37;

    [(CALayer *)v14->_fallbackLayer setBackgroundColor:[(UIColor *)v14->_fillColor CGColor]];
    [(CALayer *)v14->_fallbackLayer setCompositingFilter:*MEMORY[0x1E4F3A2A0]];
    [(CALayer *)v14->_fallbackLayer setName:@"fallback"];
    v39 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    contentLayer = v14->_contentLayer;
    v14->_contentLayer = v39;

    [(CALayer *)v14->_contentLayer setShouldRasterize:1];
    [(CALayer *)v14->_contentLayer setRasterizationScale:1.0];
    [(CALayer *)v14->_contentLayer addSublayer:v14->_artworkLayer];
    [(CALayer *)v14->_contentLayer addSublayer:v14->_fallbackLayer];
    v41 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    barsContainerView = v14->_barsContainerView;
    v14->_barsContainerView = v41;

    v43 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    barsView = v14->_barsView;
    v14->_barsView = v43;

    id v62 = v12;
    v45 = [v12 stops];
    uint64_t v46 = [v45 count] - 1;

    v47 = (NSArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v46];
    if (v46 >= 1)
    {
      double v48 = *MEMORY[0x1E4F1DB28];
      double v49 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v50 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v51 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      uint64_t v52 = *MEMORY[0x1E4F39EA8];
      do
      {
        v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v48, v49, v50, v51);
        v54 = [v53 layer];
        [v54 setCornerCurve:v52];

        v55 = [v53 layer];
        [v55 setAllowsEdgeAntialiasing:1];

        v56 = [MEMORY[0x1E4FB1618] whiteColor];
        [v53 setBackgroundColor:v56];

        [(NSArray *)v47 addObject:v53];
        [(UIView *)v14->_barsView addSubview:v53];

        --v46;
      }
      while (v46);
    }
    bars = v14->_bars;
    v14->_bars = v47;
    v58 = v47;

    v59 = [(UIView *)v14->_barsContainerView layer];
    [v59 addSublayer:v14->_contentLayer];

    [(UIView *)v14->_barsContainerView addSubview:v14->_barsView];
    [(MRUWaveformView *)v14 addSubview:v14->_barsContainerView];

    [(MRUWaveformView *)v14 applyContext:v14->_context];
    id v12 = v62;
  }

  return v14;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MRUWaveformView;
  [(MRUWaveformView *)&v11 layoutSubviews];
  [(MRUWaveformView *)self bounds];
  -[UIView setFrame:](self->_barsContainerView, "setFrame:");
  [(MRUWaveformView *)self bounds];
  -[UIView setFrame:](self->_barsView, "setFrame:");
  [(MRUWaveformView *)self bounds];
  CGRect v13 = CGRectInset(v12, -1.0, -1.0);
  -[CALayer setFrame:](self->_artworkLayer, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  [(CALayer *)self->_artworkLayer frame];
  -[CALayer setFrame:](self->_artworkLightenLayer, "setFrame:");
  [(CALayer *)self->_artworkLayer frame];
  -[CALayer setFrame:](self->_artworkDimLayer, "setFrame:");
  [(CALayer *)self->_artworkLayer frame];
  -[CALayer setFrame:](self->_fallbackLayer, "setFrame:");
  [(MRUWaveformView *)self bounds];
  double v4 = v3;
  unint64_t v5 = [(NSArray *)self->_bars count];
  if ([(NSArray *)self->_bars count])
  {
    unint64_t v6 = 0;
    float v7 = v4 / (double)v5;
    float v8 = (float)(v7 * 0.5) * 0.5;
    do
    {
      v9 = [(NSArray *)self->_bars objectAtIndexedSubscript:v6];
      v10 = [v9 layer];
      [v10 setCornerRadius:v8];

      [(MRUWaveformView *)self bounds];
      objc_msgSend(v9, "setCenter:", (float)((float)((float)(v7 - (float)(v7 * 0.5)) * 0.5) + (float)(v8 + (float)((float)(int)v6 * v7))), CGRectGetMidY(v14));
      [v9 bounds];
      objc_msgSend(v9, "setBounds:", 0.0, 0.0, (float)(v7 * 0.5));

      ++v6;
    }
    while ([(NSArray *)self->_bars count] > v6);
  }
  [(MRUWaveformView *)self setWaveformData:self->_waveformData];
}

- (MRUWaveformView)initWithFrame:(CGRect)a3 context:(unint64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10 = +[MRUWaveformSettings currentSettings];
  objc_super v11 = -[MRUWaveformView initWithFrame:context:settings:](self, "initWithFrame:context:settings:", a4, v10, x, y, width, height);

  return v11;
}

- (void)setStylingProvider:(id)a3
{
  double v4 = (MRUVisualStylingProvider *)a3;
  [(MRUVisualStylingProvider *)v4 removeObserver:self];
  stylingProvider = self->_stylingProvider;
  self->_stylingProvider = v4;
  unint64_t v6 = v4;

  [(MRUWaveformView *)self updateVisualStyle];
  [(MRUVisualStylingProvider *)v6 addObserver:self];
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);

  [(MRUWaveformView *)self updateLayers];
}

- (void)setDimmed:(BOOL)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_dimmed != a3)
  {
    BOOL v3 = a3;
    self->_dimmed = a3;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v4 = self->_bars;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v11;
      double v8 = (double)!v3;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setAlpha:", v8, (void)v10);
        }
        while (v6 != v9);
        uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v6);
    }
  }
}

- (void)setFillColor:(id)a3
{
  p_fillColor = &self->_fillColor;
  id v6 = a3;
  if ((-[UIColor isEqual:](*p_fillColor, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fillColor, a3);
    [(CALayer *)self->_fallbackLayer setBackgroundColor:[(UIColor *)*p_fillColor CGColor]];
  }
}

- (void)updateLayers
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:0.5];
  artworkImage = self->_artworkImage;
  if (artworkImage) {
    *(float *)&double v3 = 0.0;
  }
  else {
    *(float *)&double v3 = 1.0;
  }
  if (artworkImage) {
    float v5 = 1.0;
  }
  else {
    float v5 = 0.0;
  }
  [(CALayer *)self->_fallbackLayer setOpacity:v3];
  *(float *)&double v6 = v5;
  [(CALayer *)self->_artworkLayer setOpacity:v6];
  [(NSTimer *)self->_transitionTimer invalidate];
  transitionTimer = self->_transitionTimer;
  self->_transitionTimer = 0;

  if (artworkImage)
  {
    [(CALayer *)self->_artworkLayer setContents:[(UIImage *)self->_artworkImage CGImage]];
    [(MRUWaveformView *)self updateArtworkFilters];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __31__MRUWaveformView_updateLayers__block_invoke;
    v10[3] = &unk_1E5F0DE50;
    v10[4] = self;
    double v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v10 block:0.5];
    uint64_t v9 = self->_transitionTimer;
    self->_transitionTimer = v8;
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __31__MRUWaveformView_updateLayers__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 480) setContents:0];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 528);
  *(void *)(v2 + 528) = 0;
}

- (void)updateArtworkFilters
{
  [(CALayer *)self->_artworkLightenLayer setOpacity:0.0];
  [(CALayer *)self->_artworkDimLayer setOpacity:0.0];
  luminanceForImage(self->_artworkImage);
  double v4 = v3;
  [(MRUWaveformSettings *)self->_settings artworkSaturation];
  double v6 = v5;
  [(MRUWaveformSettings *)self->_settings minArtworkLuminance];
  settings = self->_settings;
  if (v4 >= v7)
  {
    [(MRUWaveformSettings *)settings maxArtworkLuminance];
    if (v4 > v12)
    {
      [(MRUWaveformSettings *)self->_settings maxArtworkLuminance];
      double v14 = v4 - v13;
      *(float *)&double v14 = v14;
      [(CALayer *)self->_artworkDimLayer setOpacity:v14];
    }
  }
  else
  {
    [(MRUWaveformSettings *)settings minArtworkLuminance];
    double v10 = v9;
    double v11 = v10 - v4;
    *(float *)&double v10 = v11;
    [(CALayer *)self->_artworkLightenLayer setOpacity:v10];
    double v6 = v6 + v11 * 4.0;
  }
  artworkLayer = self->_artworkLayer;
  id v16 = [NSNumber numberWithDouble:v6];
  [(CALayer *)artworkLayer setValue:v16 forKeyPath:@"filters.colorSaturate.inputAmount"];
}

- (void)applyContext:(unint64_t)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 2uLL:
      uint64_t v15 = *MEMORY[0x1E4F3A090];
      id v16 = [(UIView *)self->_barsView layer];
      [v16 setCompositingFilter:v15];

      [(MRUWaveformSettings *)self->_settings opacity];
      [(UIView *)self->_barsContainerView setAlpha:v17];
      LODWORD(v18) = 1.0;
      [(CALayer *)self->_contentLayer setOpacity:v18];
      [(MRUWaveformView *)self updateLayers];
      break;
    case 1uLL:
      [(UIView *)self->_barsContainerView setAlpha:1.0];
      contentLayer = self->_contentLayer;
      [(CALayer *)contentLayer setOpacity:0.0];
      break;
    case 0uLL:
      double v4 = [MEMORY[0x1E4FB1618] blackColor];
      [(UIView *)self->_barsView setBackgroundColor:v4];

      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      float v5 = self->_bars;
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v6)
      {
        uint64_t v7 = v6;
        uint64_t v8 = *(void *)v20;
        uint64_t v9 = *MEMORY[0x1E4F3A098];
        do
        {
          for (uint64_t i = 0; i != v7; ++i)
          {
            if (*(void *)v20 != v8) {
              objc_enumerationMutation(v5);
            }
            double v11 = objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "layer", (void)v19);
            [v11 setCompositingFilter:v9];
          }
          uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        }
        while (v7);
      }

      [(MRUWaveformSettings *)self->_settings opacity];
      [(UIView *)self->_barsContainerView setAlpha:v12];
      LODWORD(v13) = 1.0;
      [(CALayer *)self->_contentLayer setOpacity:v13];
      [(MRUWaveformView *)self updateLayers];
      break;
  }
}

- (void)setWaveformData:(id)a3
{
  id v24 = a3;
  objc_storeStrong((id *)&self->_waveformData, a3);
  [(MRUWaveformView *)self bounds];
  double v6 = v5;
  unint64_t v7 = [(NSArray *)self->_bars count];
  if ([(NSArray *)self->_bars count])
  {
    unint64_t v8 = 0;
    float v9 = v6 / (double)v7;
    double v10 = (float)(v9 * 0.5);
    do
    {
      double v11 = [(NSArray *)self->_bars objectAtIndexedSubscript:v8];
      float v12 = [v24 amplitudes];
      double v13 = [v12 objectAtIndexedSubscript:v8];
      [v13 floatValue];
      double v15 = v14;

      [(MRUWaveformSettings *)self->_settings xScaleMultiplier];
      double v17 = v10 + v16 * v15;
      [(MRUWaveformView *)self bounds];
      if (v15 <= 1.0) {
        double v19 = v15;
      }
      else {
        double v19 = 1.0;
      }
      double v20 = v19 * v18;
      if (v20 <= v10) {
        double v21 = v10;
      }
      else {
        double v21 = v20;
      }
      long long v22 = [v11 layer];
      objc_msgSend(v22, "setBounds:", 0.0, 0.0, v17, v21);

      v23 = [v11 layer];
      [v23 setCornerRadius:v17 * 0.5];

      ++v8;
    }
    while ([(NSArray *)self->_bars count] > v8);
  }
}

- (void)updateVisualStyle
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  double v3 = self->_bars;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        -[MRUVisualStylingProvider applyStyle:toView:](self->_stylingProvider, "applyStyle:toView:", 2, *(void *)(*((void *)&v8 + 1) + 8 * v7++), (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (MRUWaveformData)waveformData
{
  return self->_waveformData;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (CALayer)artworkLightenLayer
{
  return self->_artworkLightenLayer;
}

- (void)setArtworkLightenLayer:(id)a3
{
}

- (CALayer)artworkDimLayer
{
  return self->_artworkDimLayer;
}

- (void)setArtworkDimLayer:(id)a3
{
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CALayer)artworkLayer
{
  return self->_artworkLayer;
}

- (void)setArtworkLayer:(id)a3
{
}

- (CALayer)fallbackLayer
{
  return self->_fallbackLayer;
}

- (void)setFallbackLayer:(id)a3
{
}

- (UIView)barsView
{
  return self->_barsView;
}

- (void)setBarsView:(id)a3
{
}

- (UIView)barsContainerView
{
  return self->_barsContainerView;
}

- (void)setBarsContainerView:(id)a3
{
}

- (NSArray)bars
{
  return self->_bars;
}

- (void)setBars:(id)a3
{
}

- (MRUWaveformSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_bars, 0);
  objc_storeStrong((id *)&self->_barsContainerView, 0);
  objc_storeStrong((id *)&self->_barsView, 0);
  objc_storeStrong((id *)&self->_fallbackLayer, 0);
  objc_storeStrong((id *)&self->_artworkLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_artworkDimLayer, 0);
  objc_storeStrong((id *)&self->_artworkLightenLayer, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);

  objc_storeStrong((id *)&self->_waveformData, 0);
}

@end