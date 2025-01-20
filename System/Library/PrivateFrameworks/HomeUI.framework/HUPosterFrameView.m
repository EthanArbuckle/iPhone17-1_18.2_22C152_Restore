@interface HUPosterFrameView
+ (id)posterFrameViewForWidth:(double)a3;
- (BOOL)loadingHeroFrame;
- (BOOL)loadingPosterFrame;
- (BOOL)shouldShowLineSeparator;
- (CALayer)lineSeparator;
- (CALayer)posterFrameLayer;
- (HMCameraClip)clip;
- (HUPosterFrameView)initWithFrame:(CGRect)a3;
- (double)timeOffset;
- (unint64_t)posterFrameLoadingState;
- (void)didFindPosterFrame:(id)a3 atOffset:(double)a4 forClip:(id)a5;
- (void)displayImage:(id)a3 opacity:(double)a4;
- (void)displayImageForClip:(id)a3 atTimeOffset:(double)a4;
- (void)failedToFindPosterFrameAtOffset:(double)a3 forClip:(id)a4;
- (void)loadPlaceholderHeroFrameImageForClip:(id)a3;
- (void)loadPosterFrameImageForClip:(id)a3 atOffset:(double)a4;
- (void)manager:(id)a3 didFindHeroFrame:(id)a4 forClip:(id)a5;
- (void)manager:(id)a3 didFindImage:(id)a4 atTimeOffset:(double)a5 forClip:(id)a6;
- (void)manager:(id)a3 didGenerateImage:(id)a4 atOffset:(double)a5 forClip:(id)a6;
- (void)manager:(id)a3 failedToFindHeroFrameforClip:(id)a4;
- (void)manager:(id)a3 failedToGenerateImageAtOffset:(double)a4 forClip:(id)a5;
- (void)prepareForReuse;
- (void)setClip:(id)a3;
- (void)setLineSeparator:(id)a3;
- (void)setLoadingHeroFrame:(BOOL)a3;
- (void)setLoadingPosterFrame:(BOOL)a3;
- (void)setPosterFrameLayer:(id)a3;
- (void)setPosterFrameLoadingState:(unint64_t)a3;
- (void)setShouldShowLineSeparator:(BOOL)a3;
- (void)setTimeOffset:(double)a3;
@end

@implementation HUPosterFrameView

+ (id)posterFrameViewForWidth:(double)a3
{
  v3 = -[HUPosterFrameView initWithFrame:]([HUPosterFrameView alloc], "initWithFrame:", 0.0, 0.0, a3, 33.0);

  return v3;
}

- (HUPosterFrameView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)HUPosterFrameView;
  v3 = -[HUPosterFrameView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    posterFrameLayer = v3->_posterFrameLayer;
    v3->_posterFrameLayer = v4;

    [(HUPosterFrameView *)v3 bounds];
    -[CALayer setFrame:](v3->_posterFrameLayer, "setFrame:");
    v6 = [(HUPosterFrameView *)v3 layer];
    [v6 insertSublayer:v3->_posterFrameLayer atIndex:0];

    [(HUPosterFrameView *)v3 bounds];
    double y = v16.origin.y;
    double height = v16.size.height;
    CGFloat v9 = CGRectGetMaxX(v16) + -1.0;
    v10 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    lineSeparator = v3->_lineSeparator;
    v3->_lineSeparator = v10;

    -[CALayer setFrame:](v3->_lineSeparator, "setFrame:", v9, y, 1.0, height);
    id v12 = [MEMORY[0x1E4F428B8] systemBlackColor];
    -[CALayer setBackgroundColor:](v3->_lineSeparator, "setBackgroundColor:", [v12 CGColor]);

    [(CALayer *)v3->_lineSeparator setHidden:1];
    v13 = [(HUPosterFrameView *)v3 layer];
    [v13 addSublayer:v3->_lineSeparator];
  }
  return v3;
}

- (void)setShouldShowLineSeparator:(BOOL)a3
{
  if (self->_shouldShowLineSeparator != a3)
  {
    BOOL v5 = !a3;
    v6 = [(HUPosterFrameView *)self lineSeparator];
    [v6 setHidden:v5];

    self->_shouldShowLineSeparator = a3;
  }
}

- (void)displayImageForClip:(id)a3 atTimeOffset:(double)a4
{
  id v8 = a3;
  -[HUPosterFrameView setClip:](self, "setClip:");
  [(HUPosterFrameView *)self setTimeOffset:a4];
  v6 = [MEMORY[0x1E4F68F90] sharedManager];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    v7 = [(HUPosterFrameView *)self clip];
    [v6 addDemoPosterFrameImageObserver:self forClip:v7 atOffset:a4];
  }
  else
  {
    v7 = [v6 cachedPosterFrameImageForClip:v8 offset:self requestor:a4];
    if (v7) {
      [(HUPosterFrameView *)self displayImage:v7 opacity:1.0];
    }
    else {
      [(HUPosterFrameView *)self loadPosterFrameImageForClip:v8 atOffset:a4];
    }
  }
}

- (void)prepareForReuse
{
  id v5 = [MEMORY[0x1E4F68F90] sharedManager];
  if ([(HUPosterFrameView *)self loadingHeroFrame])
  {
    v3 = [(HUPosterFrameView *)self clip];
    [v5 removeHeroFrameImageObserver:self forClip:v3];
  }
  if ([(HUPosterFrameView *)self loadingPosterFrame])
  {
    v4 = [(HUPosterFrameView *)self clip];
    [(HUPosterFrameView *)self timeOffset];
    objc_msgSend(v5, "removePosterFrameImageObserver:forClip:atOffset:", self, v4);
  }
  [(HUPosterFrameView *)self setLoadingHeroFrame:0];
  [(HUPosterFrameView *)self setLoadingPosterFrame:0];
  [(HUPosterFrameView *)self setPosterFrameLoadingState:0];
  [(HUPosterFrameView *)self displayImage:0 opacity:1.0];
}

- (void)displayImage:(id)a3 opacity:(double)a4
{
  v6 = (void *)MEMORY[0x1E4F39CF8];
  id v7 = a3;
  [v6 begin];
  [MEMORY[0x1E4F39CF8] setValue:*MEMORY[0x1E4F1CFD0] forKey:*MEMORY[0x1E4F3A5A8]];
  id v8 = v7;
  uint64_t v9 = [v8 CGImage];

  v10 = [(HUPosterFrameView *)self posterFrameLayer];
  [v10 setContents:v9];

  v11 = [(HUPosterFrameView *)self posterFrameLayer];
  *(float *)&a4 = a4;
  LODWORD(v12) = LODWORD(a4);
  [v11 setOpacity:v12];

  v13 = (void *)MEMORY[0x1E4F39CF8];

  [v13 commit];
}

- (void)loadPlaceholderHeroFrameImageForClip:(id)a3
{
  id v6 = a3;
  v4 = [MEMORY[0x1E4F68F90] sharedManager];
  id v5 = [v4 heroFrameImageForClip:v6];
  if (v5)
  {
    [(HUPosterFrameView *)self displayImage:v5 opacity:0.5];
  }
  else
  {
    [(HUPosterFrameView *)self setLoadingHeroFrame:1];
    [v4 addHeroFrameImageObserver:self forClip:v6];
  }
}

- (void)loadPosterFrameImageForClip:(id)a3 atOffset:(double)a4
{
  id v6 = a3;
  [(HUPosterFrameView *)self setLoadingPosterFrame:1];
  [(HUPosterFrameView *)self setPosterFrameLoadingState:1];
  [(HUPosterFrameView *)self loadPlaceholderHeroFrameImageForClip:v6];
  id v7 = [MEMORY[0x1E4F68F90] sharedManager];
  [v7 getPosterFrameImage:self forClip:v6 atOffset:a4];
}

- (void)didFindPosterFrame:(id)a3 atOffset:(double)a4 forClip:(id)a5
{
  id v13 = a3;
  id v8 = [a5 uniqueIdentifier];
  uint64_t v9 = [(HUPosterFrameView *)self clip];
  v10 = [v9 uniqueIdentifier];
  int v11 = objc_msgSend(v8, "hmf_isEqualToUUID:", v10);

  if (v11)
  {
    [(HUPosterFrameView *)self timeOffset];
    if (vabdd_f64(v12, a4) < 0.00000011920929)
    {
      [(HUPosterFrameView *)self setLoadingPosterFrame:0];
      [(HUPosterFrameView *)self setPosterFrameLoadingState:2];
      [(HUPosterFrameView *)self displayImage:v13 opacity:1.0];
    }
  }
}

- (void)failedToFindPosterFrameAtOffset:(double)a3 forClip:(id)a4
{
  -[HUPosterFrameView setLoadingPosterFrame:](self, "setLoadingPosterFrame:", 0, a3);

  [(HUPosterFrameView *)self setPosterFrameLoadingState:3];
}

- (void)manager:(id)a3 didFindImage:(id)a4 atTimeOffset:(double)a5 forClip:(id)a6
{
  id v7 = a4;
  [(HUPosterFrameView *)self setLoadingPosterFrame:0];
  [(HUPosterFrameView *)self displayImage:v7 opacity:1.0];
}

- (void)manager:(id)a3 didGenerateImage:(id)a4 atOffset:(double)a5 forClip:(id)a6
{
  id v7 = a4;
  [(HUPosterFrameView *)self setLoadingPosterFrame:0];
  [(HUPosterFrameView *)self displayImage:v7 opacity:1.0];
}

- (void)manager:(id)a3 failedToGenerateImageAtOffset:(double)a4 forClip:(id)a5
{
}

- (void)manager:(id)a3 didFindHeroFrame:(id)a4 forClip:(id)a5
{
  id v9 = a4;
  [(HUPosterFrameView *)self setLoadingHeroFrame:0];
  if ([(HUPosterFrameView *)self posterFrameLoadingState] != 2)
  {
    [(HUPosterFrameView *)self timeOffset];
    BOOL v7 = v6 < 0.00000011920929;
    double v8 = 0.5;
    if (v7) {
      double v8 = 1.0;
    }
    [(HUPosterFrameView *)self displayImage:v9 opacity:v8];
  }
}

- (void)manager:(id)a3 failedToFindHeroFrameforClip:(id)a4
{
}

- (BOOL)shouldShowLineSeparator
{
  return self->_shouldShowLineSeparator;
}

- (BOOL)loadingHeroFrame
{
  return self->_loadingHeroFrame;
}

- (void)setLoadingHeroFrame:(BOOL)a3
{
  self->_loadingHeroFrame = a3;
}

- (BOOL)loadingPosterFrame
{
  return self->_loadingPosterFrame;
}

- (void)setLoadingPosterFrame:(BOOL)a3
{
  self->_loadingPosterFrame = a3;
}

- (unint64_t)posterFrameLoadingState
{
  return self->_posterFrameLoadingState;
}

- (void)setPosterFrameLoadingState:(unint64_t)a3
{
  self->_posterFrameLoadingState = a3;
}

- (CALayer)posterFrameLayer
{
  return self->_posterFrameLayer;
}

- (void)setPosterFrameLayer:(id)a3
{
}

- (CALayer)lineSeparator
{
  return self->_lineSeparator;
}

- (void)setLineSeparator:(id)a3
{
}

- (HMCameraClip)clip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clip);

  return (HMCameraClip *)WeakRetained;
}

- (void)setClip:(id)a3
{
}

- (double)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(double)a3
{
  self->_timeOffset = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_clip);
  objc_storeStrong((id *)&self->_lineSeparator, 0);

  objc_storeStrong((id *)&self->_posterFrameLayer, 0);
}

@end