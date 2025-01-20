@interface MRUHapticView
- (BOOL)artworkIsHapticsUnavailableImage;
- (BOOL)isDimmed;
- (CALayer)contentLayer;
- (CALayer)fallbackLayer;
- (CALayer)hapticDimLayer;
- (CALayer)hapticLayer;
- (CALayer)hapticLightenLayer;
- (MAMusicHapticsManager)musicHapticsManager;
- (MRUHapticView)initWithContext:(unint64_t)a3 frame:(CGRect)a4;
- (MRUVisualStylingProvider)stylingProvider;
- (NSCopying)musicHapticsToken;
- (NSTimer)transitionTimer;
- (UIColor)fillColor;
- (UIImage)artworkImage;
- (UIImageView)hapticImageView;
- (UIView)hapticContainerView;
- (UIView)hapticImageViewHolder;
- (unint64_t)context;
- (void)_hapticImageTap:(id)a3;
- (void)applyContext:(unint64_t)a3;
- (void)handleDarkenSystemColorsNotification:(id)a3;
- (void)initializeSubviews;
- (void)layoutSubviews;
- (void)registerHapticObserver;
- (void)registerSystemColorsObserver;
- (void)setArtworkImage:(id)a3;
- (void)setArtworkIsHapticsUnavailableImage:(BOOL)a3;
- (void)setContentLayer:(id)a3;
- (void)setContext:(unint64_t)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setFallbackLayer:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setHapticContainerView:(id)a3;
- (void)setHapticDimLayer:(id)a3;
- (void)setHapticImageView:(id)a3;
- (void)setHapticImageViewHolder:(id)a3;
- (void)setHapticLayer:(id)a3;
- (void)setHapticLightenLayer:(id)a3;
- (void)setMusicHapticsManager:(id)a3;
- (void)setMusicHapticsToken:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setTransitionTimer:(id)a3;
- (void)updateArtworkFilters;
- (void)updateArtworkImageForHapticStatus:(unsigned int)a3;
- (void)updateLayers;
- (void)updateMusicHapticsStatus;
- (void)updateVisualStyle;
@end

@implementation MRUHapticView

- (MRUHapticView)initWithContext:(unint64_t)a3 frame:(CGRect)a4
{
  v18.receiver = self;
  v18.super_class = (Class)MRUHapticView;
  v5 = -[MRUHapticView initWithFrame:](&v18, sel_initWithFrame_, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_context = a3;
    [(MRUHapticView *)v5 initializeSubviews];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v6 action:sel__hapticImageTap_];
    [(MRUHapticView *)v6 addGestureRecognizer:v7];
    [(MRUHapticView *)v6 setUserInteractionEnabled:1];
    uint64_t v8 = [MEMORY[0x1E4F31208] sharedManager];
    musicHapticsManager = v6->_musicHapticsManager;
    v6->_musicHapticsManager = (MAMusicHapticsManager *)v8;

    v6->_artworkIsHapticsUnavailableImage = 0;
    objc_initWeak(&location, v6);
    v10 = [MEMORY[0x1E4F49458] sharedInstance];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    v14 = __39__MRUHapticView_initWithContext_frame___block_invoke;
    v15 = &unk_1E5F0DA00;
    objc_copyWeak(&v16, &location);
    [v10 registerUpdateBlock:&v12 forRetrieveSelector:sel_hapticMusicActive withListener:v6];

    objc_destroyWeak(&v16);
    [(MRUHapticView *)v6 registerHapticObserver];
    [(MRUHapticView *)v6 registerSystemColorsObserver];
    [(MRUHapticView *)v6 updateMusicHapticsStatus];
    objc_destroyWeak(&location);
  }
  return v6;
}

void __39__MRUHapticView_initWithContext_frame___block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = [WeakRetained musicHapticsManager];
  int v4 = [v3 isActive];

  id v5 = objc_loadWeakRetained(v1);
  [v5 updateArtworkImageForHapticStatus:v4 ^ 1u];
}

- (void)registerHapticObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleHapticEnabledStatusChangedNotification_ name:*MEMORY[0x1E4F311F8] object:0];
}

- (void)registerSystemColorsObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleDarkenSystemColorsNotification_ name:*MEMORY[0x1E4FB9108] object:0];
}

- (void)handleDarkenSystemColorsNotification:(id)a3
{
  if (self->_artworkIsHapticsUnavailableImage)
  {
    int v4 = _AXDarkenSystemColors();
    double v5 = 0.9;
    if (!v4) {
      double v5 = 0.5;
    }
    hapticContainerView = self->_hapticContainerView;
    [(UIView *)hapticContainerView setAlpha:v5];
  }
}

- (void)updateMusicHapticsStatus
{
  if ([(MAMusicHapticsManager *)self->_musicHapticsManager musicHapticsEnabled])
  {
    objc_initWeak(&location, self);
    musicHapticsManager = self->_musicHapticsManager;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __41__MRUHapticView_updateMusicHapticsStatus__block_invoke;
    v7[3] = &unk_1E5F0DE28;
    objc_copyWeak(&v8, &location);
    int v4 = [(MAMusicHapticsManager *)musicHapticsManager addStatusObserver:v7];
    musicHapticsToken = self->_musicHapticsToken;
    self->_musicHapticsToken = v4;

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  else
  {
    [(MAMusicHapticsManager *)self->_musicHapticsManager removeStatusObserver:self->_musicHapticsToken];
    v6 = self->_musicHapticsToken;
    self->_musicHapticsToken = 0;
  }
}

void __41__MRUHapticView_updateMusicHapticsStatus__block_invoke(uint64_t a1, void *a2, int a3)
{
  if (([a2 isEqualToString:&stru_1F06524E0] & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    id v7 = WeakRetained;
    if (a3) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = 2;
    }
    [WeakRetained updateArtworkImageForHapticStatus:v6];
  }
}

- (void)initializeSubviews
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4FB1618] colorWithWhite:0.392156863 alpha:1.0];
  fillColor = self->_fillColor;
  self->_fillColor = v3;

  double v5 = [(MRUHapticView *)self layer];
  [v5 setMasksToBounds:1];

  id v6 = objc_alloc(MEMORY[0x1E4F39BC0]);
  id v7 = (void *)[v6 initWithType:*MEMORY[0x1E4F3A048]];
  [v7 setValue:&unk_1F069F378 forKeyPath:*MEMORY[0x1E4F3A100]];
  id v8 = objc_alloc(MEMORY[0x1E4F39BC0]);
  v9 = (void *)[v8 initWithType:*MEMORY[0x1E4F3A0D0]];
  [v9 setValue:&unk_1F069F110 forKeyPath:*MEMORY[0x1E4F3A1D8]];
  [v9 setValue:MEMORY[0x1E4F1CC38] forKeyPath:*MEMORY[0x1E4F3A1B8]];
  v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  hapticLightenLayer = self->_hapticLightenLayer;
  self->_hapticLightenLayer = v10;

  id v12 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:1.0];
  -[CALayer setBackgroundColor:](self->_hapticLightenLayer, "setBackgroundColor:", [v12 CGColor]);

  [(CALayer *)self->_hapticLightenLayer setOpacity:0.0];
  [(CALayer *)self->_hapticLightenLayer setName:@"lighten"];
  uint64_t v13 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  hapticDimLayer = self->_hapticDimLayer;
  self->_hapticDimLayer = v13;

  id v15 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:1.0];
  -[CALayer setBackgroundColor:](self->_hapticDimLayer, "setBackgroundColor:", [v15 CGColor]);

  [(CALayer *)self->_hapticDimLayer setOpacity:0.0];
  [(CALayer *)self->_hapticDimLayer setName:@"dim"];
  id v16 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  hapticLayer = self->_hapticLayer;
  self->_hapticLayer = v16;

  [(CALayer *)self->_hapticLayer addSublayer:self->_hapticLightenLayer];
  [(CALayer *)self->_hapticLayer addSublayer:self->_hapticDimLayer];
  v33[0] = v7;
  v33[1] = v9;
  objc_super v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
  [(CALayer *)self->_hapticLayer setFilters:v18];

  [(CALayer *)self->_hapticLayer setName:@"artwork"];
  v19 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  fallbackLayer = self->_fallbackLayer;
  self->_fallbackLayer = v19;

  [(CALayer *)self->_fallbackLayer setBackgroundColor:[(UIColor *)self->_fillColor CGColor]];
  [(CALayer *)self->_fallbackLayer setCompositingFilter:*MEMORY[0x1E4F3A2A0]];
  [(CALayer *)self->_fallbackLayer setName:@"fallback"];
  v21 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
  contentLayer = self->_contentLayer;
  self->_contentLayer = v21;

  [(CALayer *)self->_contentLayer setShouldRasterize:1];
  [(CALayer *)self->_contentLayer setRasterizationScale:1.0];
  [(CALayer *)self->_contentLayer addSublayer:self->_hapticLayer];
  [(CALayer *)self->_contentLayer addSublayer:self->_fallbackLayer];
  v23 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  hapticContainerView = self->_hapticContainerView;
  self->_hapticContainerView = v23;

  v25 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  hapticImageViewHolder = self->_hapticImageViewHolder;
  self->_hapticImageViewHolder = v25;

  [(MRUHapticView *)self updateArtworkImageForHapticStatus:[(MAMusicHapticsManager *)self->_musicHapticsManager isActive] ^ 1];
  v27 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:self->_artworkImage];
  hapticImageView = self->_hapticImageView;
  self->_hapticImageView = v27;

  v29 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UIImageView *)self->_hapticImageView setTintColor:v29];

  v30 = [MEMORY[0x1E4FB1618] clearColor];
  [(UIImageView *)self->_hapticImageView setBackgroundColor:v30];

  [(UIImageView *)self->_hapticImageView setContentMode:1];
  v31 = [(UIImageView *)self->_hapticImageView layer];
  [v31 setAllowsEdgeAntialiasing:1];

  [(UIView *)self->_hapticImageViewHolder addSubview:self->_hapticImageView];
  v32 = [(UIView *)self->_hapticContainerView layer];
  [v32 addSublayer:self->_contentLayer];

  [(UIView *)self->_hapticContainerView addSubview:self->_hapticImageViewHolder];
  [(MRUHapticView *)self addSubview:self->_hapticContainerView];
  [(MRUHapticView *)self applyContext:self->_context];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUHapticView;
  [(MRUHapticView *)&v3 layoutSubviews];
  [(MRUHapticView *)self bounds];
  -[UIImageView setFrame:](self->_hapticImageView, "setFrame:");
  [(MRUHapticView *)self bounds];
  -[UIView setFrame:](self->_hapticImageViewHolder, "setFrame:");
  [(MRUHapticView *)self bounds];
  -[UIView setFrame:](self->_hapticContainerView, "setFrame:");
  [(MRUHapticView *)self bounds];
  CGRect v5 = CGRectInset(v4, -1.0, -1.0);
  -[CALayer setFrame:](self->_hapticLayer, "setFrame:", v5.origin.x, v5.origin.y, v5.size.width, v5.size.height);
  [(CALayer *)self->_hapticLayer frame];
  -[CALayer setFrame:](self->_hapticLightenLayer, "setFrame:");
  [(CALayer *)self->_hapticLayer frame];
  -[CALayer setFrame:](self->_hapticDimLayer, "setFrame:");
  [(CALayer *)self->_hapticLayer frame];
  -[CALayer setFrame:](self->_fallbackLayer, "setFrame:");
}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    double v3 = 1.0;
    if (a3) {
      double v3 = 0.5;
    }
    [(UIImageView *)self->_hapticImageView setAlpha:v3];
  }
}

- (void)setStylingProvider:(id)a3
{
  CGRect v4 = (MRUVisualStylingProvider *)a3;
  [(MRUVisualStylingProvider *)v4 removeObserver:self];
  stylingProvider = self->_stylingProvider;
  self->_stylingProvider = v4;
  id v6 = v4;

  [(MRUHapticView *)self updateVisualStyle];
  [(MRUVisualStylingProvider *)v6 addObserver:self];
}

- (void)setArtworkImage:(id)a3
{
  objc_storeStrong((id *)&self->_artworkImage, a3);

  [(MRUHapticView *)self updateLayers];
}

- (void)updateArtworkImageForHapticStatus:(unsigned int)a3
{
  if (!a3)
  {
    v10 = (void *)MEMORY[0x1E4FB1818];
    v11 = @"apple.haptics.and.music.note";
LABEL_9:
    id v12 = [v10 _systemImageNamed:v11];
    artworkImage = self->_artworkImage;
    self->_artworkImage = v12;

    [(UIView *)self->_hapticContainerView setAlpha:1.0];
    self->_artworkIsHapticsUnavailableImage = 0;
    id v8 = self;
    uint64_t v9 = 1;
    goto LABEL_10;
  }
  if (a3 == 1)
  {
    v10 = (void *)MEMORY[0x1E4FB1818];
    v11 = @"apple.haptics.and.music.note.slash";
    goto LABEL_9;
  }
  if (a3 != 2) {
    goto LABEL_11;
  }
  CGRect v4 = [MEMORY[0x1E4FB1818] _systemImageNamed:@"apple.haptics.and.exclamationmark.triangle"];
  CGRect v5 = self->_artworkImage;
  self->_artworkImage = v4;

  int v6 = _AXDarkenSystemColors();
  double v7 = 0.9;
  if (!v6) {
    double v7 = 0.5;
  }
  [(UIView *)self->_hapticContainerView setAlpha:v7];
  self->_artworkIsHapticsUnavailableImage = 1;
  id v8 = self;
  uint64_t v9 = 0;
LABEL_10:
  [(MRUHapticView *)v8 setUserInteractionEnabled:v9];
LABEL_11:
  [(UIImageView *)self->_hapticImageView setImage:self->_artworkImage];

  [(MRUHapticView *)self updateVisualStyle];
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
  [(CALayer *)self->_hapticLayer setOpacity:v6];
  [(NSTimer *)self->_transitionTimer invalidate];
  transitionTimer = self->_transitionTimer;
  self->_transitionTimer = 0;

  if (artworkImage)
  {
    [(CALayer *)self->_hapticLayer setContents:[(UIImage *)self->_artworkImage CGImage]];
    [(MRUHapticView *)self updateArtworkFilters];
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __29__MRUHapticView_updateLayers__block_invoke;
    v10[3] = &unk_1E5F0DE50;
    v10[4] = self;
    id v8 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v10 block:0.5];
    uint64_t v9 = self->_transitionTimer;
    self->_transitionTimer = v8;
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __29__MRUHapticView_updateLayers__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 488) setContents:0];
  uint64_t v2 = *(void *)(a1 + 32);
  double v3 = *(void **)(v2 + 512);
  *(void *)(v2 + 512) = 0;
}

- (void)updateArtworkFilters
{
  [(CALayer *)self->_hapticLightenLayer setOpacity:0.0];
  [(CALayer *)self->_hapticDimLayer setOpacity:0.0];
  luminanceForHapticImage(self->_artworkImage);
  if (v3 >= 0.4)
  {
    double v5 = 1.25;
    if (v3 > 0.5)
    {
      double v6 = v3 + -0.5;
      *(float *)&double v6 = v6;
      [(CALayer *)self->_hapticDimLayer setOpacity:v6];
    }
  }
  else
  {
    double v4 = 0.4 - v3;
    *(float *)&double v3 = 0.4 - v3;
    [(CALayer *)self->_hapticLightenLayer setOpacity:v3];
    double v5 = v4 * 4.0 + 1.25;
  }
  hapticLayer = self->_hapticLayer;
  id v8 = [NSNumber numberWithDouble:v5];
  [(CALayer *)hapticLayer setValue:v8 forKeyPath:@"filters.colorSaturate.inputAmount"];
}

- (void)applyContext:(unint64_t)a3
{
  if (a3 == 2)
  {
    uint64_t v5 = *MEMORY[0x1E4F3A090];
    uint64_t v6 = 456;
LABEL_6:
    double v7 = [*(id *)((char *)&self->super.super.super.isa + v6) layer];
    [v7 setCompositingFilter:v5];

    [(UIView *)self->_hapticContainerView setAlpha:1.0];
    LODWORD(v8) = 1.0;
    [(CALayer *)self->_contentLayer setOpacity:v8];
    [(MRUHapticView *)self updateLayers];
    return;
  }
  if (a3 != 1)
  {
    if (a3) {
      return;
    }
    double v4 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)self->_hapticImageViewHolder setBackgroundColor:v4];

    uint64_t v5 = *MEMORY[0x1E4F3A098];
    uint64_t v6 = 448;
    goto LABEL_6;
  }
  [(UIView *)self->_hapticContainerView setAlpha:1.0];
  contentLayer = self->_contentLayer;

  [(CALayer *)contentLayer setOpacity:0.0];
}

- (void)_hapticImageTap:(id)a3
{
  uint64_t v3 = [(MAMusicHapticsManager *)self->_musicHapticsManager isActive] ^ 1;
  id v4 = [MEMORY[0x1E4F49458] sharedInstance];
  [v4 setHapticMusicActive:v3];
}

- (void)updateVisualStyle
{
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (void)setFillColor:(id)a3
{
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (unint64_t)context
{
  return self->_context;
}

- (void)setContext:(unint64_t)a3
{
  self->_context = a3;
}

- (UIImageView)hapticImageView
{
  return self->_hapticImageView;
}

- (void)setHapticImageView:(id)a3
{
}

- (UIView)hapticImageViewHolder
{
  return self->_hapticImageViewHolder;
}

- (void)setHapticImageViewHolder:(id)a3
{
}

- (CALayer)hapticLightenLayer
{
  return self->_hapticLightenLayer;
}

- (void)setHapticLightenLayer:(id)a3
{
}

- (CALayer)hapticDimLayer
{
  return self->_hapticDimLayer;
}

- (void)setHapticDimLayer:(id)a3
{
}

- (CALayer)contentLayer
{
  return self->_contentLayer;
}

- (void)setContentLayer:(id)a3
{
}

- (CALayer)hapticLayer
{
  return self->_hapticLayer;
}

- (void)setHapticLayer:(id)a3
{
}

- (CALayer)fallbackLayer
{
  return self->_fallbackLayer;
}

- (void)setFallbackLayer:(id)a3
{
}

- (UIView)hapticContainerView
{
  return self->_hapticContainerView;
}

- (void)setHapticContainerView:(id)a3
{
}

- (NSTimer)transitionTimer
{
  return self->_transitionTimer;
}

- (void)setTransitionTimer:(id)a3
{
}

- (MAMusicHapticsManager)musicHapticsManager
{
  return self->_musicHapticsManager;
}

- (void)setMusicHapticsManager:(id)a3
{
}

- (NSCopying)musicHapticsToken
{
  return self->_musicHapticsToken;
}

- (void)setMusicHapticsToken:(id)a3
{
}

- (BOOL)artworkIsHapticsUnavailableImage
{
  return self->_artworkIsHapticsUnavailableImage;
}

- (void)setArtworkIsHapticsUnavailableImage:(BOOL)a3
{
  self->_artworkIsHapticsUnavailableImage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_musicHapticsToken, 0);
  objc_storeStrong((id *)&self->_musicHapticsManager, 0);
  objc_storeStrong((id *)&self->_transitionTimer, 0);
  objc_storeStrong((id *)&self->_hapticContainerView, 0);
  objc_storeStrong((id *)&self->_fallbackLayer, 0);
  objc_storeStrong((id *)&self->_hapticLayer, 0);
  objc_storeStrong((id *)&self->_contentLayer, 0);
  objc_storeStrong((id *)&self->_hapticDimLayer, 0);
  objc_storeStrong((id *)&self->_hapticLightenLayer, 0);
  objc_storeStrong((id *)&self->_hapticImageViewHolder, 0);
  objc_storeStrong((id *)&self->_hapticImageView, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_artworkImage, 0);
}

@end