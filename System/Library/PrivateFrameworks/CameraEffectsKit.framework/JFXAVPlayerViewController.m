@interface JFXAVPlayerViewController
- (BOOL)showAVControls;
- (CGSize)displaySize;
- (void)configureDisplayAttributesForColorSpace:(id)a3;
- (void)setShowAVControls:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation JFXAVPlayerViewController

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)JFXAVPlayerViewController;
  [(JFXAVPlayerViewController *)&v4 viewWillAppear:a3];
  [(JFXAVPlayerViewController *)self setShowAVControls:0];
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)JFXAVPlayerViewController;
  [(JFXAVPlayerViewController *)&v6 viewDidLoad];
  BOOL v3 = [(JFXAVPlayerViewController *)self showAVControls];
  objc_super v4 = [(JFXAVPlayerViewController *)self view];
  [v4 setUserInteractionEnabled:v3];

  [(JFXAVPlayerViewController *)self setShowsPlaybackControls:[(JFXAVPlayerViewController *)self showAVControls]];
  [(JFXAVPlayerViewController *)self setAllowsPictureInPicturePlayback:[(JFXAVPlayerViewController *)self showAVControls]];
  v5 = [(JFXAVPlayerViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(JFXAVPlayerViewController *)self setAllowsVideoFrameAnalysis:0];
}

- (CGSize)displaySize
{
  v2 = [(JFXAVPlayerViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)configureDisplayAttributesForColorSpace:(id)a3
{
  v7[1] = *MEMORY[0x263EF8340];
  if (a3)
  {
    uint64_t v6 = *MEMORY[0x263F04180];
    double v4 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "jfx_getCVPixelFormatForExport"));
    v7[0] = v4;
    double v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [(JFXAVPlayerViewController *)self setPixelBufferAttributes:v5];
  }
  else
  {
    [(JFXAVPlayerViewController *)self setPixelBufferAttributes:0];
  }
}

- (BOOL)showAVControls
{
  return self->showAVControls;
}

- (void)setShowAVControls:(BOOL)a3
{
  self->showAVControls = a3;
}

@end