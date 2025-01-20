@interface AXMotionCuesLearnMorePageController
+ (id)fetchTitleForPage:(int64_t)a3;
- (AXMotionCuesLearnMorePageController)initWithPage:(int64_t)a3;
- (OBTrayButton)mainButton;
- (id)fetchMainButtonTitle;
- (id)fetchMovieName;
- (id)setupAssetReader;
- (opaqueCMSampleBuffer)copyNextSampleBuffer;
- (void)cancelButtonTapped:(id)a3;
- (void)configureTimebase;
- (void)loadMovie;
- (void)mainButtonTapped;
- (void)playMovie;
- (void)setMainButton:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AXMotionCuesLearnMorePageController

+ (id)fetchTitleForPage:(int64_t)a3
{
  if (a3 == 1)
  {
    v4 = @"MotionCuesLearnMorePageSideMotionTitle";
  }
  else
  {
    if (a3 != 2) {
      goto LABEL_6;
    }
    v4 = @"MotionCuesLearnMorePageForwardBackwardMotionTitle";
  }
  settingsLocString(v4, @"Accessibility-MotionCues");
  a1 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  return a1;
}

- (AXMotionCuesLearnMorePageController)initWithPage:(int64_t)a3
{
  v5 = +[AXMotionCuesLearnMorePageController fetchTitleForPage:](AXMotionCuesLearnMorePageController, "fetchTitleForPage:");
  v17.receiver = self;
  v17.super_class = (Class)AXMotionCuesLearnMorePageController;
  v6 = [(AXMotionCuesLearnMorePageController *)&v17 initWithTitle:v5 detailText:0 symbolName:0 contentLayout:1];

  *((void *)v6 + 12) = a3;
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v6 fetchMovieName];
  v9 = [v7 URLForResource:v8 withExtension:@"mov"];

  uint64_t v10 = +[AVURLAsset assetWithURL:v9];
  v11 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v10;

  *(_OWORD *)(v6 + 56) = *(_OWORD *)&kCMTimeZero.value;
  *((void *)v6 + 9) = kCMTimeZero.epoch;
  dispatch_queue_t v12 = dispatch_queue_create("AXMotionCuesLearnMorePageHelperQueue", 0);
  v13 = (void *)*((void *)v6 + 10);
  *((void *)v6 + 10) = v12;

  dispatch_queue_t v14 = dispatch_queue_create("AXMotionCuesLearnMorePageAvsbdlEnqueueQueue", 0);
  v15 = (void *)*((void *)v6 + 11);
  *((void *)v6 + 11) = v14;

  return (AXMotionCuesLearnMorePageController *)v6;
}

- (void)viewDidLayoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)AXMotionCuesLearnMorePageController;
  [(AXMotionCuesLearnMorePageController *)&v11 viewDidLayoutSubviews];
  int IsPad = AXDeviceIsPad();
  v4 = [(AXMotionCuesLearnMorePageController *)self contentView];
  [v4 frame];
  double v6 = v5;
  [(AXMotionCuesLearnMorePageController *)self contentView];
  if (IsPad) {
    v7 = {;
  }
    [v7 frame];
    double v9 = v8 * 0.8;
    uint64_t v10 = [(AXMotionCuesLearnMorePageController *)self contentView];
    [v10 frame];
    -[AVSampleBufferDisplayLayer setFrame:](self->_avsbdl, "setFrame:", v6 * 0.1, 10.0, v9);
  }
  else {
    v7 = {;
  }
    [v7 frame];
    -[AVSampleBufferDisplayLayer setFrame:](self->_avsbdl, "setFrame:", 0.0, 0.0, v6);
  }
}

- (void)viewDidLoad
{
  if (self->_page != 2)
  {
    id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"cancelButtonTapped:"];
    v4 = [(AXMotionCuesLearnMorePageController *)self navigationItem];
    [v4 setRightBarButtonItem:v3];
  }
  id v22 = +[OBBoldTrayButton boldButton];
  [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v5 = [(AXMotionCuesLearnMorePageController *)self fetchMainButtonTitle];
  [v22 setTitle:v5 forState:0];

  [v22 addTarget:self action:"mainButtonTapped" forControlEvents:64];
  [(AXMotionCuesLearnMorePageController *)self setMainButton:v22];
  double v6 = [(AXMotionCuesLearnMorePageController *)self buttonTray];
  [v6 addButton:v22];

  v7 = +[UIColor clearColor];
  double v8 = [(AXMotionCuesLearnMorePageController *)self navigationController];
  double v9 = [v8 navigationBar];
  [v9 setBackgroundColor:v7];

  uint64_t v10 = (AVSampleBufferDisplayLayer *)objc_alloc_init((Class)AVSampleBufferDisplayLayer);
  avsbdl = self->_avsbdl;
  self->_avsbdl = v10;

  [(AVSampleBufferDisplayLayer *)self->_avsbdl setVideoGravity:AVLayerVideoGravityResizeAspect];
  [(AVSampleBufferDisplayLayer *)self->_avsbdl setMasksToBounds:0];
  LODWORD(v12) = 0.5;
  [(AVSampleBufferDisplayLayer *)self->_avsbdl setShadowOpacity:v12];
  v13 = +[UIScreen mainScreen];
  [v13 scale];
  [(AVSampleBufferDisplayLayer *)self->_avsbdl setShadowRadius:50.0 / v14];

  -[AVSampleBufferDisplayLayer setShadowOffset:](self->_avsbdl, "setShadowOffset:", 0.0, 20.0);
  [(AVSampleBufferDisplayLayer *)self->_avsbdl bounds];
  CGRect v25 = CGRectInset(v24, 10.0, 10.0);
  +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:", v25.origin.x, v25.origin.y, v25.size.width, v25.size.height);
  id v15 = objc_claimAutoreleasedReturnValue();
  -[AVSampleBufferDisplayLayer setShadowPath:](self->_avsbdl, "setShadowPath:", [v15 CGPath]);

  v16 = +[UIColor clearColor];
  -[AVSampleBufferDisplayLayer setBackgroundColor:](self->_avsbdl, "setBackgroundColor:", [v16 cgColor]);

  objc_super v17 = [(AXMotionCuesLearnMorePageController *)self contentView];
  v18 = [v17 layer];
  [v18 addSublayer:self->_avsbdl];

  v19 = [(AXMotionCuesLearnMorePageController *)self contentView];
  [v19 setClipsToBounds:1];

  v20 = +[UIColor systemGroupedBackgroundColor];
  v21 = [(AXMotionCuesLearnMorePageController *)self contentView];
  [v21 setBackgroundColor:v20];

  [(AXMotionCuesLearnMorePageController *)self configureTimebase];
}

- (void)loadMovie
{
  objc_initWeak(&location, self);
  asset = self->_asset;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke;
  v4[3] = &unk_20A700;
  v4[4] = self;
  objc_copyWeak(&v5, &location);
  [(AVAsset *)asset loadTracksWithMediaType:AVMediaTypeVideo completionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = *(NSObject **)(*(void *)(a1 + 32) + 80);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2;
  block[3] = &unk_20A6D8;
  objc_copyWeak(&v13, (id *)(a1 + 40));
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);

  objc_destroyWeak(&v13);
}

void __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *(void **)(a1 + 32);
    if (v3 && ![v3 count])
    {
      id v15 = AXLogMotionCues();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2_cold_2(a1, v15);
      }
    }
    else
    {
      uint64_t v4 = [WeakRetained setupAssetReader];
      id v5 = WeakRetained[2];
      WeakRetained[2] = (id)v4;

      id v6 = [WeakRetained[2] outputs];
      uint64_t v7 = [v6 objectAtIndexedSubscript:0];
      id v8 = WeakRetained[3];
      WeakRetained[3] = (id)v7;

      uint64_t v9 = [WeakRetained setupAssetReader];
      id v10 = WeakRetained[4];
      WeakRetained[4] = (id)v9;

      id v11 = [WeakRetained[4] outputs];
      uint64_t v12 = [v11 objectAtIndexedSubscript:0];
      id v13 = WeakRetained[5];
      WeakRetained[5] = (id)v12;

      [WeakRetained playMovie];
    }
  }
  else
  {
    double v14 = AXLogMotionCues();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2_cold_1(v14);
    }
  }
}

- (id)setupAssetReader
{
  id v3 = [(AVAsset *)self->_asset tracks];
  uint64_t v4 = [v3 objectAtIndex:0];

  id v5 = +[NSNumber numberWithUnsignedInt:32];
  CFStringRef v6 = kCVPixelBufferPixelFormatTypeKey;
  uint64_t v7 = +[NSDictionary dictionary];
  id v8 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, v6, v7, kCVPixelBufferIOSurfacePropertiesKey, 0);

  uint64_t v9 = +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:v4 outputSettings:v8];
  id v10 = +[AVAssetReader assetReaderWithAsset:self->_asset error:0];
  if ([v10 canAddOutput:v9]) {
    [v10 addOutput:v9];
  }

  return v10;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AXMotionCuesLearnMorePageController;
  [(AXMotionCuesLearnMorePageController *)&v5 viewWillDisappear:a3];
  uint64_t v4 = [(AVSampleBufferDisplayLayer *)self->_avsbdl sampleBufferRenderer];
  [v4 stopRequestingMediaData];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AXMotionCuesLearnMorePageController;
  [(AXMotionCuesLearnMorePageController *)&v4 viewWillAppear:a3];
  [(AXMotionCuesLearnMorePageController *)self loadMovie];
}

- (void)playMovie
{
  objc_initWeak(&location, self);
  [(AVAssetReader *)self->_primaryReader startReading];
  id v3 = [(AVSampleBufferDisplayLayer *)self->_avsbdl sampleBufferRenderer];
  avsbdlQueue = self->_avsbdlQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = __48__AXMotionCuesLearnMorePageController_playMovie__block_invoke;
  v5[3] = &unk_208798;
  objc_copyWeak(&v6, &location);
  [v3 requestMediaDataWhenReadyOnQueue:avsbdlQueue usingBlock:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__AXMotionCuesLearnMorePageController_playMovie__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained[6] sampleBufferRenderer];
  unsigned int v2 = [v1 isReadyForMoreMediaData];

  if (v2)
  {
    while (1)
    {
      id v3 = [WeakRetained copyNextSampleBuffer];
      objc_super v4 = [WeakRetained[6] sampleBufferRenderer];
      objc_super v5 = v4;
      if (!v3) {
        break;
      }
      [v4 enqueueSampleBuffer:v3];

      CFRelease(v3);
      id v6 = [WeakRetained[6] sampleBufferRenderer];
      unsigned __int8 v7 = [v6 isReadyForMoreMediaData];

      if ((v7 & 1) == 0) {
        goto LABEL_6;
      }
    }
    [v4 stopRequestingMediaData];
  }
LABEL_6:
}

- (void)configureTimebase
{
  CMTimebaseRef timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  CMTimebaseCreateWithSourceClock(kCFAllocatorDefault, HostTimeClock, &timebaseOut);
  [(AVSampleBufferDisplayLayer *)self->_avsbdl setControlTimebase:timebaseOut];
  CMTimebaseSetRate(timebaseOut, 1.0);
}

- (opaqueCMSampleBuffer)copyNextSampleBuffer
{
  p_primaryOutput = &self->_primaryOutput;
  objc_super v4 = [(AVAssetReaderOutput *)self->_primaryOutput copyNextSampleBuffer];
  if (v4)
  {
    objc_super v5 = v4;
    if ((char *)[(AVAssetReader *)self->_primaryReader status] != (char *)&dword_0 + 2) {
      goto LABEL_4;
    }
  }
  objc_storeStrong((id *)&self->_primaryReader, self->_backupReader);
  objc_storeStrong((id *)p_primaryOutput, self->_backupOutput);
  id v6 = [(AXMotionCuesLearnMorePageController *)self setupAssetReader];
  backupReader = self->_backupReader;
  self->_backupReader = v6;

  id v8 = [(AVAssetReader *)self->_backupReader outputs];
  uint64_t v9 = [v8 objectAtIndexedSubscript:0];
  backupOutput = self->_backupOutput;
  self->_backupOutput = v9;

  [(AVAssetReader *)self->_primaryReader startReading];
  id v11 = [(AVSampleBufferDisplayLayer *)self->_avsbdl sampleBufferRenderer];
  [v11 flush];

  [(AXMotionCuesLearnMorePageController *)self configureTimebase];
  CMTimeMake(&rhs, 1, 1);
  CMTime lhs = (CMTime)self->_nextSampleOffset;
  CMTimeAdd(&outputPresentationTimeStamp, &lhs, &rhs);
  self->_nextSampleOffset = ($95D729B680665BEAEFA1D6FCA8238556)outputPresentationTimeStamp;
  objc_super v5 = [(AVAssetReaderOutput *)*p_primaryOutput copyNextSampleBuffer];
  if (v5)
  {
LABEL_4:
    p_nextSampleOffset = (CMTime *)&self->_nextSampleOffset;
    CMTime outputPresentationTimeStamp = *p_nextSampleOffset;
    CMSampleBufferSetOutputPresentationTimeStamp(v5, &outputPresentationTimeStamp);
    memset(&outputPresentationTimeStamp, 0, sizeof(outputPresentationTimeStamp));
    CMSampleBufferGetOutputDuration(&outputPresentationTimeStamp, v5);
    CMTime v15 = *p_nextSampleOffset;
    CMTime v14 = outputPresentationTimeStamp;
    CMTimeAdd(&lhs, &v15, &v14);
    CMTime *p_nextSampleOffset = lhs;
  }
  return v5;
}

- (id)fetchMovieName
{
  if (AXDeviceIsPad()) {
    CFStringRef v3 = @"pad";
  }
  else {
    CFStringRef v3 = @"phone";
  }
  objc_super v4 = [(AXMotionCuesLearnMorePageController *)self traitCollection];
  if ([v4 userInterfaceStyle] == (char *)&dword_0 + 2) {
    CFStringRef v5 = @"dark";
  }
  else {
    CFStringRef v5 = @"light";
  }
  id v6 = [(AXMotionCuesLearnMorePageController *)self contentView];
  unsigned __int8 v7 = (char *)[v6 effectiveUserInterfaceLayoutDirection];
  CFStringRef v8 = @"ltr";
  if (v7 == (unsigned char *)&dword_0 + 1) {
    CFStringRef v8 = @"rtl";
  }
  if (self->_page == 1) {
    CFStringRef v9 = @"turn";
  }
  else {
    CFStringRef v9 = @"accel";
  }
  id v10 = +[NSString stringWithFormat:@"MotionCues-learnMorePage-%@-%@-%@-%@", v3, v5, v8, v9];

  return v10;
}

- (id)fetchMainButtonTitle
{
  if (self->_page == 2) {
    unsigned int v2 = @"MotionCuesLearnMoreDoneButtonTitle";
  }
  else {
    unsigned int v2 = @"MotionCuesLearnMoreContinueButtonTitle";
  }
  CFStringRef v3 = settingsLocString(v2, @"Accessibility-MotionCues");

  return v3;
}

- (void)mainButtonTapped
{
  int64_t page = self->_page;
  if (page == 2)
  {
    [(AXMotionCuesLearnMorePageController *)self dismissViewControllerAnimated:1 completion:0];
  }
  else if (page == 1)
  {
    CFStringRef v5 = [[AXMotionCuesLearnMorePageController alloc] initWithPage:2];
    objc_super v4 = [(AXMotionCuesLearnMorePageController *)self navigationController];
    [v4 pushViewController:v5 animated:1];
  }
}

- (void)cancelButtonTapped:(id)a3
{
}

- (OBTrayButton)mainButton
{
  return self->_mainButton;
}

- (void)setMainButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainButton, 0);
  objc_storeStrong((id *)&self->_avsbdlQueue, 0);
  objc_storeStrong((id *)&self->_helperQueue, 0);
  objc_storeStrong((id *)&self->_avsbdl, 0);
  objc_storeStrong((id *)&self->_backupOutput, 0);
  objc_storeStrong((id *)&self->_backupReader, 0);
  objc_storeStrong((id *)&self->_primaryOutput, 0);
  objc_storeStrong((id *)&self->_primaryReader, 0);

  objc_storeStrong((id *)&self->_asset, 0);
}

void __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unable to load tracks for learn more page", v1, 2u);
}

void __48__AXMotionCuesLearnMorePageController_loadMovie__block_invoke_2_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Failed to load tracks for learn more page with error: %@", (uint8_t *)&v3, 0xCu);
}

@end