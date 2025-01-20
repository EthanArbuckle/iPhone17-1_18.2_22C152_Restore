@interface CDRichComplicationImageView
- (BOOL)_isSymbolImageProvider;
- (BOOL)_isSymbolImageProviderWithoutSpecificSize;
- (BOOL)isHostingOverrideView;
- (BOOL)isPaused;
- (BOOL)prefersFilterOverTransition;
- (BOOL)useAccentColor;
- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3;
- (CDRichComplicationImageView)initWithDevice:(id)a3 useAccentColor:(BOOL)a4;
- (CDStackedImagesComplicationImageView)monochromeImageView;
- (CLKDevice)device;
- (CLKFullColorImageProvider)imageProvider;
- (CLKMonochromeFilterProvider)filterProvider;
- (NSNumber)tritiumUpdateMode;
- (UIFontDescriptor)fontDescriptor;
- (UIView)richComplicationImageView;
- (double)fontSizeFactor;
- (double)inMonochromeModeFraction;
- (id)_createMonochromeImageView;
- (id)backgroundColorForView:(id)a3;
- (id)colorForView:(id)a3 accented:(BOOL)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4;
- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)filtersForView:(id)a3 style:(int64_t)a4;
- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5;
- (id)interpolatedColorForView:(id)a3;
- (int64_t)_filterStyle;
- (int64_t)monochromeFilterType;
- (void)layoutSubviews;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setFilterProvider:(id)a3;
- (void)setFontDescriptor:(id)a3;
- (void)setFontSizeFactor:(double)a3;
- (void)setHostingOverrideView:(BOOL)a3;
- (void)setImageProvider:(id)a3;
- (void)setImageProvider:(id)a3 reason:(int64_t)a4;
- (void)setInMonochromeModeFraction:(double)a3;
- (void)setMonochromeFilterType:(int64_t)a3;
- (void)setMonochromeImageView:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setPrefersFilterOverTransition:(BOOL)a3;
- (void)setRichComplicationImageView:(id)a3;
- (void)setTintedFraction:(double)a3;
- (void)setTintedPlatterColor:(id)a3;
- (void)transitionToMonochromeWithFraction:(double)a3;
- (void)updateMonochromeColor;
@end

@implementation CDRichComplicationImageView

- (CDRichComplicationImageView)initWithDevice:(id)a3 useAccentColor:(BOOL)a4
{
  id v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CDRichComplicationImageView;
  v8 = -[CDRichComplicationImageView initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_device, a3);
    v9->_useAccentColor = a4;
    v10 = [MEMORY[0x263F825C8] clearColor];
    [(CDRichComplicationImageView *)v9 setBackgroundColor:v10];

    [(CDRichComplicationImageView *)v9 setOpaque:0];
  }

  return v9;
}

- (id)_createMonochromeImageView
{
  if (self->_useAccentColor) {
    v2 = off_2644A4F40;
  }
  else {
    v2 = &off_2644A4F48;
  }
  id v3 = objc_alloc_init(*v2);
  return v3;
}

- (void)setImageProvider:(id)a3 reason:(int64_t)a4
{
  id v25 = a3;
  objc_storeStrong((id *)&self->_imageProvider, a3);
  if ((unint64_t)(a4 - 1) >= 3) {
    a4 = 0;
  }
  id v7 = (objc_class *)[v25 ImageViewClass];
  if (!v7) {
    id v7 = (objc_class *)objc_opt_class();
  }
  v8 = [(CDRichComplicationImageView *)self richComplicationImageView];
  uint64_t v9 = objc_opt_class();

  if (v7 != (objc_class *)v9)
  {
    v10 = [(CDRichComplicationImageView *)self layer];
    [v10 setFilters:MEMORY[0x263EFFA68]];

    [(CDRichComplicationImageView *)self setHostingOverrideView:v7 != (objc_class *)objc_opt_class()];
    v11 = [(CDRichComplicationImageView *)self richComplicationImageView];
    [v11 removeFromSuperview];

    objc_super v12 = [(CDRichComplicationImageView *)self monochromeImageView];
    [v12 removeFromSuperview];

    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      id v13 = [v7 alloc];
      v14 = [(CDRichComplicationImageView *)self device];
      v15 = (void *)[v13 initFullColorImageViewWithDevice:v14];
    }
    else
    {
      id v16 = objc_alloc(MEMORY[0x263F82828]);
      v15 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      v14 = [(CDRichComplicationImageView *)self _createMonochromeImageView];
      [v14 setAutoresizingMask:0];
      [v14 setHidden:1];
      [v14 setFilterProvider:self];
      [v14 setMulticolorAlpha:1.0];
      [(CDRichComplicationImageView *)self addSubview:v14];
      [(CDRichComplicationImageView *)self setMonochromeImageView:v14];
    }

    [(CDRichComplicationImageView *)self addSubview:v15];
    [(CDRichComplicationImageView *)self setRichComplicationImageView:v15];
    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      if (objc_opt_respondsToSelector()) {
        [v15 setFilterProvider:self];
      }
      if ([(CDRichComplicationImageView *)self isPaused]) {
        [v15 pauseLiveFullColorImageView];
      }
      else {
        [v15 resumeLiveFullColorImageView];
      }
    }
  }
  self->_monochromeFilterType = [v25 monochromeFilterType];
  if (v25)
  {
    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      v17 = [(CDRichComplicationImageView *)self richComplicationImageView];
      if (objc_opt_respondsToSelector())
      {
        v18 = [(CDRichComplicationImageView *)self fontDescriptor];
        [v17 setFontDescriptor:v18];
      }
      if (objc_opt_respondsToSelector())
      {
        [(CDRichComplicationImageView *)self fontSizeFactor];
        objc_msgSend(v17, "setFontSizeFactor:");
      }
      [v17 configureWithImageProvider:v25 reason:a4];
    }
    else
    {
      -[CDRichComplicationImageView setPrefersFilterOverTransition:](self, "setPrefersFilterOverTransition:", [v25 prefersFilterOverTransition]);
      v17 = [(CDRichComplicationImageView *)self richComplicationImageView];
      if ([(CDRichComplicationImageView *)self _isSymbolImageProvider]) {
        [v25 createSymbolImage];
      }
      else {
      v21 = [v25 image];
      }
      [v17 setImage:v21];

      v22 = [v25 tintColor];
      [v17 setTintColor:v22];

      [v17 setHidden:0];
      v23 = [v25 tintedImageProvider];
      if (v23)
      {
        v24 = [(CDRichComplicationImageView *)self monochromeImageView];
        [v24 setImageProvider:v23];
      }
    }

    if (self->_inMonochromeModeFraction == 1.0) {
      [(CDRichComplicationImageView *)self updateMonochromeColor];
    }
    else {
      -[CDRichComplicationImageView transitionToMonochromeWithFraction:](self, "transitionToMonochromeWithFraction:");
    }
    [(CDRichComplicationImageView *)self setNeedsLayout];
  }
  else
  {
    v19 = [(CDRichComplicationImageView *)self richComplicationImageView];
    [v19 setHidden:1];

    v20 = [(CDRichComplicationImageView *)self monochromeImageView];
    [v20 setHidden:1];
  }
}

- (void)layoutSubviews
{
  v19.receiver = self;
  v19.super_class = (Class)CDRichComplicationImageView;
  [(CDRichComplicationImageView *)&v19 layoutSubviews];
  id v3 = [(CDRichComplicationImageView *)self richComplicationImageView];
  [(CDRichComplicationImageView *)self bounds];
  double Width = CGRectGetWidth(v20);
  [(CDRichComplicationImageView *)self bounds];
  objc_msgSend(v3, "setBounds:", 0.0, 0.0, Width, CGRectGetHeight(v21));
  [(CDRichComplicationImageView *)self bounds];
  double MidX = CGRectGetMidX(v22);
  [(CDRichComplicationImageView *)self bounds];
  objc_msgSend(v3, "setCenter:", MidX, CGRectGetMidY(v23));
  v6 = [(CDRichComplicationImageView *)self monochromeImageView];
  [(CDRichComplicationImageView *)self bounds];
  double v7 = CGRectGetMidX(v24);
  [(CDRichComplicationImageView *)self bounds];
  objc_msgSend(v6, "setCenter:", v7, CGRectGetMidY(v25));

  v8 = [(CDRichComplicationImageView *)self richComplicationImageView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v10 = [(CDRichComplicationImageView *)self richComplicationImageView];
    v11 = [v10 image];
    [v11 size];
    double v13 = v12;
    [(CDRichComplicationImageView *)self bounds];
    if (v13 <= v14
      && ([v11 size], double v16 = v15, -[CDRichComplicationImageView bounds](self, "bounds"), v16 <= v17))
    {
      uint64_t v18 = 4;
    }
    else
    {
      uint64_t v18 = 2;
    }
    [v10 setContentMode:v18];
  }
}

- (void)setPaused:(BOOL)a3
{
  if (self->_paused != a3)
  {
    BOOL v3 = a3;
    self->_paused = a3;
    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      v5 = [(CDRichComplicationImageView *)self richComplicationImageView];
      id v8 = v5;
      if (v3) {
        [v5 pauseLiveFullColorImageView];
      }
      else {
        [v5 resumeLiveFullColorImageView];
      }
    }
    else
    {
      BOOL v6 = [(CDRichComplicationImageView *)self isPaused];
      id v8 = [(CDRichComplicationImageView *)self richComplicationImageView];
      double v7 = [v8 layer];
      [v7 setShouldRasterize:v6];
    }
  }
}

- (void)setFontDescriptor:(id)a3
{
  if (self->_fontDescriptor != a3)
  {
    objc_storeStrong((id *)&self->_fontDescriptor, a3);
    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      v5 = [(CDRichComplicationImageView *)self richComplicationImageView];
      if (objc_opt_respondsToSelector())
      {
        BOOL v6 = [(CDRichComplicationImageView *)self fontDescriptor];
        [v5 setFontDescriptor:v6];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (void)setFontSizeFactor:(double)a3
{
  if (self->_fontSizeFactor != a3)
  {
    self->_fontSizeFactor = a3;
    if ([(CDRichComplicationImageView *)self isHostingOverrideView])
    {
      id v4 = [(CDRichComplicationImageView *)self richComplicationImageView];
      if (objc_opt_respondsToSelector())
      {
        [(CDRichComplicationImageView *)self fontSizeFactor];
        objc_msgSend(v4, "setFontSizeFactor:");
      }
    }
  }
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
  BOOL v4 = a3;
  id v7 = a4;
  BOOL v6 = [(CDRichComplicationImageView *)self richComplicationImageView];
  if (objc_opt_respondsToSelector()) {
    [v6 renderSynchronouslyWithImageQueueDiscard:v4 inGroup:v7];
  }
}

- (BOOL)_isSymbolImageProvider
{
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)_isSymbolImageProviderWithoutSpecificSize
{
  if (![(CDRichComplicationImageView *)self _isSymbolImageProvider]) {
    return 0;
  }
  BOOL v3 = [(CLKFullColorImageProvider *)self->_imageProvider pointSize];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [(CLKFullColorImageProvider *)self->_imageProvider overridePointSize];
    BOOL v4 = v5 == 0;
  }
  return v4;
}

- (void)transitionToMonochromeWithFraction:(double)a3
{
  self->_inMonochromeModeFraction = a3;
  if ([(CDRichComplicationImageView *)self isHostingOverrideView])
  {
    v5 = [(CDRichComplicationImageView *)self richComplicationImageView];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(CDRichComplicationImageView *)self richComplicationImageView];
LABEL_12:
      id v45 = v7;
      double v22 = a3;
LABEL_13:
      [v7 transitionToMonochromeWithFraction:v22];
      goto LABEL_14;
    }
  }
  id v8 = [(CDRichComplicationImageView *)self monochromeImageView];
  uint64_t v9 = [v8 imageProvider];

  if (!v9)
  {
    double v15 = [(CDRichComplicationImageView *)self filterProvider];
    objc_msgSend(v15, "filtersForView:style:fraction:", self, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"), a3);
    id v45 = (id)objc_claimAutoreleasedReturnValue();

    double v16 = v45;
    if (!v45) {
      goto LABEL_15;
    }
    double v13 = [(CDRichComplicationImageView *)self layer];
    [v13 setFilters:v45];
    goto LABEL_9;
  }
  v10 = [(CDRichComplicationImageView *)self layer];
  [v10 setFilters:MEMORY[0x263EFFA68]];

  if (fabs(a3) < 0.00000011920929)
  {
    v11 = [(CDRichComplicationImageView *)self monochromeImageView];
    [v11 setHidden:1];

    double v12 = [(CDRichComplicationImageView *)self richComplicationImageView];
    [v12 setHidden:0];

    id v45 = [(CDRichComplicationImageView *)self richComplicationImageView];
    double v13 = [v45 layer];
    LODWORD(v14) = 1.0;
    [v13 setOpacity:v14];
LABEL_9:

LABEL_14:
    double v16 = v45;
    goto LABEL_15;
  }
  if (fabs(a3 + -1.0) < 0.00000011920929)
  {
    double v17 = [(CDRichComplicationImageView *)self richComplicationImageView];
    [v17 setHidden:1];

    uint64_t v18 = [(CDRichComplicationImageView *)self monochromeImageView];
    [v18 setHidden:0];

    objc_super v19 = [(CDRichComplicationImageView *)self monochromeImageView];
    CGRect v20 = [v19 layer];
    LODWORD(v21) = 1.0;
    [v20 setOpacity:v21];

    id v7 = [(CDRichComplicationImageView *)self monochromeImageView];
    goto LABEL_12;
  }
  BOOL v23 = [(CDRichComplicationImageView *)self prefersFilterOverTransition];
  CGRect v24 = [(CDRichComplicationImageView *)self richComplicationImageView];
  CGRect v25 = v24;
  if (!v23)
  {
    [v24 setHidden:0];

    v37 = [(CDRichComplicationImageView *)self richComplicationImageView];
    v38 = [v37 layer];
    float v36 = 1.0 - a3;
    *(float *)&double v39 = v36;
    [v38 setOpacity:v39];

    v40 = [(CDRichComplicationImageView *)self monochromeImageView];
    [v40 setHidden:0];

    v42 = [(CDRichComplicationImageView *)self monochromeImageView];
    v43 = [v42 layer];
    float v41 = a3;
    *(float *)&double v44 = v41;
    [v43 setOpacity:v44];

    id v7 = [(CDRichComplicationImageView *)self monochromeImageView];
    id v45 = v7;
    double v22 = 1.0;
    goto LABEL_13;
  }
  [v24 setHidden:1];

  v26 = [(CDRichComplicationImageView *)self richComplicationImageView];
  v27 = [v26 layer];
  LODWORD(v28) = 1.0;
  [v27 setOpacity:v28];

  v29 = [(CDRichComplicationImageView *)self monochromeImageView];
  [v29 setHidden:0];

  v30 = [(CDRichComplicationImageView *)self monochromeImageView];
  v31 = [v30 layer];
  LODWORD(v32) = 1.0;
  [v31 setOpacity:v32];

  v33 = [(CDRichComplicationImageView *)self filterProvider];
  v34 = [(CDRichComplicationImageView *)self monochromeImageView];
  objc_msgSend(v33, "filtersForView:style:fraction:", v34, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"), a3);
  id v45 = (id)objc_claimAutoreleasedReturnValue();

  double v16 = v45;
  if (v45)
  {
    double v13 = [(CDRichComplicationImageView *)self monochromeImageView];
    v35 = [v13 layer];
    [v35 setFilters:v45];

    goto LABEL_9;
  }
LABEL_15:
}

- (void)updateMonochromeColor
{
  self->_inMonochromeModeFraction = 1.0;
  if ([(CDRichComplicationImageView *)self isHostingOverrideView]
    && ([(CDRichComplicationImageView *)self richComplicationImageView],
        BOOL v3 = objc_claimAutoreleasedReturnValue(),
        char v4 = objc_opt_respondsToSelector(),
        v3,
        (v4 & 1) != 0))
  {
    id v16 = [(CDRichComplicationImageView *)self richComplicationImageView];
    [v16 updateMonochromeColor];
  }
  else
  {
    v5 = [(CDRichComplicationImageView *)self monochromeImageView];
    char v6 = [v5 imageProvider];

    if (v6)
    {
      id v7 = [(CDRichComplicationImageView *)self layer];
      [v7 setFilters:MEMORY[0x263EFFA68]];

      id v8 = [(CDRichComplicationImageView *)self monochromeImageView];
      [v8 setHidden:0];

      uint64_t v9 = [(CDRichComplicationImageView *)self monochromeImageView];
      v10 = [v9 layer];
      LODWORD(v11) = 1.0;
      [v10 setOpacity:v11];

      double v12 = [(CDRichComplicationImageView *)self monochromeImageView];
      [v12 updateMonochromeColor];

      id v16 = [(CDRichComplicationImageView *)self richComplicationImageView];
      [v16 setHidden:1];
    }
    else
    {
      double v13 = [(CDRichComplicationImageView *)self filterProvider];
      objc_msgSend(v13, "filtersForView:style:", self, -[CDRichComplicationImageView _filterStyle](self, "_filterStyle"));
      id v16 = (id)objc_claimAutoreleasedReturnValue();

      double v14 = v16;
      if (!v16) {
        goto LABEL_9;
      }
      double v15 = [(CDRichComplicationImageView *)self layer];
      [v15 setFilters:v16];
    }
  }
  double v14 = v16;
LABEL_9:
}

- (int64_t)_filterStyle
{
  int64_t v2 = 3;
  if (!self->_useAccentColor) {
    int64_t v2 = 1;
  }
  if (self->_monochromeFilterType) {
    return 2 * self->_useAccentColor;
  }
  else {
    return v2;
  }
}

- (id)filtersForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = [(CDRichComplicationImageView *)self filterProvider];
  uint64_t v9 = [v8 filtersForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filtersForView:(id)a3 style:(int64_t)a4
{
  char v6 = [(CDRichComplicationImageView *)self filterProvider];
  id v7 = [v6 filtersForView:self style:a4];

  return v7;
}

- (id)filterForView:(id)a3 style:(int64_t)a4 fraction:(double)a5
{
  id v8 = [(CDRichComplicationImageView *)self filterProvider];
  uint64_t v9 = [v8 filterForView:self style:a4 fraction:a5];

  return v9;
}

- (id)filterForView:(id)a3 style:(int64_t)a4
{
  char v6 = [(CDRichComplicationImageView *)self filterProvider];
  id v7 = [v6 filterForView:self style:a4];

  return v7;
}

- (id)colorForView:(id)a3 accented:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(CDRichComplicationImageView *)self filterProvider];
  id v8 = [v7 colorForView:v6 accented:v4];

  return v8;
}

- (id)interpolatedColorForView:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationImageView *)self filterProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CDRichComplicationImageView *)self filterProvider];
    id v8 = [v7 interpolatedColorForView:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)backgroundColorForView:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationImageView *)self filterProvider];
  char v6 = [v5 backgroundColorForView:v4];

  return v6;
}

- (BOOL)viewShouldIgnoreTwoPieceImage:(id)a3
{
  id v4 = a3;
  v5 = [(CDRichComplicationImageView *)self filterProvider];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CDRichComplicationImageView *)self filterProvider];
    char v8 = [v7 viewShouldIgnoreTwoPieceImage:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (void)setTintedFraction:(double)a3
{
  id v4 = [(CDRichComplicationImageView *)self richComplicationImageView];
  if ([v4 conformsToProtocol:&unk_26CF6C8A0]) {
    [v4 setTintedFraction:a3];
  }
}

- (void)setTintedPlatterColor:(id)a3
{
  id v5 = a3;
  id v4 = [(CDRichComplicationImageView *)self richComplicationImageView];
  if ([v4 conformsToProtocol:&unk_26CF6C8A0]) {
    [v4 setTintedPlatterColor:v5];
  }
}

- (CLKMonochromeFilterProvider)filterProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_filterProvider);
  return (CLKMonochromeFilterProvider *)WeakRetained;
}

- (void)setFilterProvider:(id)a3
{
}

- (CLKDevice)device
{
  return self->_device;
}

- (BOOL)useAccentColor
{
  return self->_useAccentColor;
}

- (NSNumber)tritiumUpdateMode
{
  return self->_tritiumUpdateMode;
}

- (UIFontDescriptor)fontDescriptor
{
  return self->_fontDescriptor;
}

- (double)fontSizeFactor
{
  return self->_fontSizeFactor;
}

- (CLKFullColorImageProvider)imageProvider
{
  return self->_imageProvider;
}

- (void)setImageProvider:(id)a3
{
}

- (UIView)richComplicationImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_richComplicationImageView);
  return (UIView *)WeakRetained;
}

- (void)setRichComplicationImageView:(id)a3
{
}

- (CDStackedImagesComplicationImageView)monochromeImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_monochromeImageView);
  return (CDStackedImagesComplicationImageView *)WeakRetained;
}

- (void)setMonochromeImageView:(id)a3
{
}

- (BOOL)isHostingOverrideView
{
  return self->_hostingOverrideView;
}

- (void)setHostingOverrideView:(BOOL)a3
{
  self->_hostingOverrideView = a3;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (int64_t)monochromeFilterType
{
  return self->_monochromeFilterType;
}

- (void)setMonochromeFilterType:(int64_t)a3
{
  self->_monochromeFilterType = a3;
}

- (double)inMonochromeModeFraction
{
  return self->_inMonochromeModeFraction;
}

- (void)setInMonochromeModeFraction:(double)a3
{
  self->_inMonochromeModeFraction = a3;
}

- (BOOL)prefersFilterOverTransition
{
  return self->_prefersFilterOverTransition;
}

- (void)setPrefersFilterOverTransition:(BOOL)a3
{
  self->_prefersFilterOverTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_monochromeImageView);
  objc_destroyWeak((id *)&self->_richComplicationImageView);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_fontDescriptor, 0);
  objc_storeStrong((id *)&self->_tritiumUpdateMode, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_destroyWeak((id *)&self->_filterProvider);
}

@end