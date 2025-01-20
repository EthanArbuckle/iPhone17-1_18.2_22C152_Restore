@interface GLKViewController
- (BOOL)displayLinkPaused;
- (BOOL)firstResumeOccurred;
- (BOOL)isPaused;
- (BOOL)lastDrawOccurred;
- (BOOL)lastResumeOccurred;
- (BOOL)lastUpdateOccurred;
- (BOOL)pauseOnWillResignActive;
- (BOOL)resumeOnDidBecomeActive;
- (BOOL)viewIsVisible;
- (CADisplayLink)displayLink;
- (GLKDisplayLinkMessenger)displayLinkMessenger;
- (GLKViewController)init;
- (GLKViewController)initWithCoder:(id)a3;
- (GLKViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (NSInteger)framesDisplayed;
- (NSInteger)framesPerSecond;
- (NSInteger)preferredFramesPerSecond;
- (NSTimeInterval)timeSinceFirstResume;
- (NSTimeInterval)timeSinceLastDraw;
- (NSTimeInterval)timeSinceLastResume;
- (NSTimeInterval)timeSinceLastUpdate;
- (UIScreen)screen;
- (double)timeSinceFirstResumeStartTime;
- (double)timeSinceLastDrawPreviousTime;
- (double)timeSinceLastResumeStartTime;
- (double)timeSinceLastUpdatePreviousTime;
- (id)delegate;
- (int64_t)_calculateScreenFramesPerSecond:(id)a3;
- (int64_t)screenFramesPerSecond;
- (void)_configureNotifications;
- (void)_createDisplayLinkForScreen:(id)a3;
- (void)_initCommon;
- (void)_pauseByNotification;
- (void)_resumeByNotification;
- (void)_updateAndDraw;
- (void)_updateScreenIfChanged;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)delegate;
- (void)setDisplayLink:(id)a3;
- (void)setDisplayLinkMessenger:(id)a3;
- (void)setDisplayLinkPaused:(BOOL)a3;
- (void)setFirstResumeOccurred:(BOOL)a3;
- (void)setLastDrawOccurred:(BOOL)a3;
- (void)setLastResumeOccurred:(BOOL)a3;
- (void)setLastUpdateOccurred:(BOOL)a3;
- (void)setPauseOnWillResignActive:(BOOL)pauseOnWillResignActive;
- (void)setPaused:(BOOL)paused;
- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond;
- (void)setResumeOnDidBecomeActive:(BOOL)resumeOnDidBecomeActive;
- (void)setScreen:(id)a3;
- (void)setScreenFramesPerSecond:(int64_t)a3;
- (void)setTimeSinceFirstResumeStartTime:(double)a3;
- (void)setTimeSinceLastDrawPreviousTime:(double)a3;
- (void)setTimeSinceLastResumeStartTime:(double)a3;
- (void)setTimeSinceLastUpdatePreviousTime:(double)a3;
- (void)setUpdateIMP:(void *)a3;
- (void)setView:(id)a3;
- (void)setViewIsVisible:(BOOL)a3;
- (void)updateIMP;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewDidUnload;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation GLKViewController

- (void)_initCommon
{
  v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateScreenIfChanged name:*MEMORY[0x263F1D7F8] object:0];
  v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel__updateScreenIfChanged name:*MEMORY[0x263F1D5B8] object:0];
  self->_pauseOnWillResignActive = 1;
  self->_resumeOnDidBecomeActive = 1;
  self->_screenFramesPerSecond = -[GLKViewController _calculateScreenFramesPerSecond:](self, "_calculateScreenFramesPerSecond:", [MEMORY[0x263F1C920] mainScreen]);
  [(GLKViewController *)self setPreferredFramesPerSecond:30];
  self->_displayLinkPaused = 1;
  [(GLKViewController *)self setDisplayLinkMessenger:objc_alloc_init(GLKDisplayLinkMessenger)];
  [(GLKDisplayLinkMessenger *)self->_displayLinkMessenger setTarget:self];
  if (objc_opt_respondsToSelector()) {
    self->_updateIMP = (void *)[(GLKViewController *)self methodForSelector:sel_update];
  }
}

- (GLKViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  v2 = [(GLKViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(GLKViewController *)v2 _initCommon];
    [(GLKViewController *)v3 _configureNotifications];
  }
  return v3;
}

- (GLKViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)GLKViewController;
  v4 = [(GLKViewController *)&v7 initWithNibName:a3 bundle:a4];
  objc_super v5 = v4;
  if (v4)
  {
    [(GLKViewController *)v4 _initCommon];
    [(GLKViewController *)v5 _configureNotifications];
  }
  return v5;
}

- (GLKViewController)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)GLKViewController;
  v4 = -[GLKViewController initWithCoder:](&v7, sel_initWithCoder_);
  objc_super v5 = v4;
  if (v4)
  {
    [(GLKViewController *)v4 _initCommon];
    if ([a3 containsValueForKey:@"GLKViewControllerPreferredFramesPerSecondCoderKey"])-[GLKViewController setPreferredFramesPerSecond:](v5, "setPreferredFramesPerSecond:", objc_msgSend(a3, "decodeIntegerForKey:", @"GLKViewControllerPreferredFramesPerSecondCoderKey")); {
    if ([a3 containsValueForKey:@"GLKViewControllerPauseOnWillResignActiveCoderKey"])v5->_pauseOnWillResignActive = objc_msgSend(a3, "decodeBoolForKey:", @"GLKViewControllerPauseOnWillResignActiveCoderKey");
    }
    if ([a3 containsValueForKey:@"GLKViewControllerResumeOnDidBecomeActiveCoderKey"])v5->_resumeOnDidBecomeActive = objc_msgSend(a3, "decodeBoolForKey:", @"GLKViewControllerResumeOnDidBecomeActiveCoderKey"); {
    [(GLKViewController *)v5 _configureNotifications];
    }
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  -[GLKViewController encodeWithCoder:](&v5, sel_encodeWithCoder_);
  [a3 encodeInteger:self->_preferredFramesPerSecond forKey:@"GLKViewControllerPreferredFramesPerSecondCoderKey"];
  [a3 encodeBool:self->_pauseOnWillResignActive forKey:@"GLKViewControllerPauseOnWillResignActiveCoderKey"];
  [a3 encodeBool:self->_resumeOnDidBecomeActive forKey:@"GLKViewControllerResumeOnDidBecomeActiveCoderKey"];
}

- (void)dealloc
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x263F08A00], "defaultCenter"), "removeObserver:", self);
  self->_pauseOnWillResignActive = 0;
  self->_resumeOnDidBecomeActive = 0;
  [(GLKViewController *)self _configureNotifications];
  [(CADisplayLink *)self->_displayLink invalidate];

  self->_displayLink = 0;
  [(GLKViewController *)self setDisplayLinkMessenger:0];
  [(GLKViewController *)self setScreen:0];
  v3.receiver = self;
  v3.super_class = (Class)GLKViewController;
  [(GLKViewController *)&v3 dealloc];
}

- (void)_configureNotifications
{
  objc_super v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  v4 = v3;
  if (self->_pauseOnWillResignActive) {
    [v3 addObserver:self selector:sel__pauseByNotification name:*MEMORY[0x263F1D0D8] object:0];
  }
  else {
    [v3 removeObserver:self name:*MEMORY[0x263F1D0D8] object:0];
  }
  if (self->_resumeOnDidBecomeActive)
  {
    uint64_t v5 = *MEMORY[0x263F1D038];
    [v4 addObserver:self selector:sel__resumeByNotification name:v5 object:0];
  }
  else
  {
    uint64_t v6 = *MEMORY[0x263F1D038];
    [v4 removeObserver:self name:v6 object:0];
  }
}

- (int64_t)_calculateScreenFramesPerSecond:(id)a3
{
  [a3 _refreshRate];
  if (v3 == 0.0) {
    return 60;
  }
  else {
    return llround(1.0 / v3);
  }
}

- (void)_createDisplayLinkForScreen:(id)a3
{
  [(CADisplayLink *)self->_displayLink invalidate];

  uint64_t v5 = (CADisplayLink *)(id)[a3 displayLinkWithTarget:self->_displayLinkMessenger selector:sel_message];
  self->_displayLink = v5;
  [(CADisplayLink *)v5 setPaused:self->_displayLinkPaused];
  [(CADisplayLink *)self->_displayLink setPreferredFramesPerSecond:self->_preferredFramesPerSecond];
  LODWORD(a3) = glkLinkedOSVersion();
  displayLink = self->_displayLink;
  uint64_t v7 = [MEMORY[0x263EFF9F0] currentRunLoop];
  v8 = (uint64_t *)MEMORY[0x263EFF588];
  if (a3 <= 0x90000) {
    v8 = (uint64_t *)MEMORY[0x263EFF478];
  }
  uint64_t v9 = *v8;

  [(CADisplayLink *)displayLink addToRunLoop:v7 forMode:v9];
}

- (void)_updateAndDraw
{
  [(GLKViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend((id)-[GLKViewController view](self, "view"), "setEnableSetNeedsDisplay:", 0);
  }
  if (self->_updateIMP)
  {
    if (self->_lastUpdateOccurred)
    {
      double v3 = CACurrentMediaTime();
      self->_timeSinceLastUpdate = v3 - self->_timeSinceLastUpdatePreviousTime;
      self->_timeSinceLastUpdatePreviousTime = v3;
    }
    else
    {
      self->_timeSinceLastUpdate = 0.0;
      self->_timeSinceLastUpdatePreviousTime = CACurrentMediaTime();
      self->_lastUpdateOccurred = 1;
    }
    ((void (*)(GLKViewController *, char *))self->_updateIMP)(self, sel_update);
  }
  else if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (self->_lastUpdateOccurred)
    {
      double v4 = CACurrentMediaTime();
      self->_timeSinceLastUpdate = v4 - self->_timeSinceLastUpdatePreviousTime;
      self->_timeSinceLastUpdatePreviousTime = v4;
    }
    else
    {
      self->_timeSinceLastUpdate = 0.0;
      self->_timeSinceLastUpdatePreviousTime = CACurrentMediaTime();
      self->_lastUpdateOccurred = 1;
    }
    [(GLKViewControllerDelegate *)self->_delegate glkViewControllerUpdate:self];
  }
  [(GLKViewController *)self view];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self->_lastDrawOccurred)
    {
      double v5 = CACurrentMediaTime();
      self->_timeSinceLastDraw = v5 - self->_timeSinceLastDrawPreviousTime;
      self->_timeSinceLastDrawPreviousTime = v5;
    }
    else
    {
      self->_timeSinceLastDraw = 0.0;
      self->_timeSinceLastDrawPreviousTime = CACurrentMediaTime();
      self->_lastDrawOccurred = 1;
    }
    objc_msgSend((id)-[GLKViewController view](self, "view"), "display");
    ++self->_framesDisplayed;
  }
}

- (void)_pauseByNotification
{
  [(GLKViewController *)self setPaused:1];
  double v3 = (void *)[(GLKViewController *)self _existingView];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v3 deleteDrawable];
  }
}

- (void)_resumeByNotification
{
  if (self->_viewIsVisible) {
    [(GLKViewController *)self setPaused:0];
  }
}

- (void)_updateScreenIfChanged
{
  if (objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen"))
  {
    double v3 = (UIScreen *)objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen");
    if (v3 == self->_screen)
    {
      self->_screenFramesPerSecond = [(GLKViewController *)self _calculateScreenFramesPerSecond:v3];
      int64_t preferredFramesPerSecond = self->_preferredFramesPerSecond;
      [(GLKViewController *)self setPreferredFramesPerSecond:preferredFramesPerSecond];
    }
    else
    {
      -[GLKViewController setScreen:](self, "setScreen:", objc_msgSend((id)objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "window"), "screen"));
      self->_screenFramesPerSecond = [(GLKViewController *)self _calculateScreenFramesPerSecond:self->_screen];
      [(GLKViewController *)self setPreferredFramesPerSecond:self->_preferredFramesPerSecond];
      screen = self->_screen;
      [(GLKViewController *)self _createDisplayLinkForScreen:screen];
    }
  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  [(GLKViewController *)&v5 viewDidMoveToWindow:a3 shouldAppearOrDisappear:a4];
  [(GLKViewController *)self _updateScreenIfChanged];
}

- (void)setView:(id)a3
{
  if ((id)[(GLKViewController *)self _existingView] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)GLKViewController;
    [(GLKViewController *)&v5 setView:a3];
    [(GLKViewController *)self _existingView];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && !objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "delegate"))
    {
      objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "setDelegate:", self);
    }
    [(GLKViewController *)self _updateScreenIfChanged];
  }
}

- (void)loadView
{
  if ([(GLKViewController *)self nibName] && [(GLKViewController *)self nibBundle])
  {
    v10.receiver = self;
    v10.super_class = (Class)GLKViewController;
    [(GLKViewController *)&v10 loadView];
    [(GLKViewController *)self _existingView];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      double v4 = NSString;
      objc_super v5 = (objc_class *)self;
      uint64_t v6 = NSStringFromClass(v5);
      [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"%@ loaded the \"%@\" nib but didn't get a GLKView.", objc_msgSend(v4, "stringWithFormat:", @"-[%@ %@]", v6, NSStringFromSelector(a2)), -[GLKViewController nibName](self, "nibName") format];
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)GLKViewController;
    [(GLKViewController *)&v9 loadView];
    uint64_t v7 = [GLKView alloc];
    objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "frame");
    v8 = -[GLKView initWithFrame:](v7, "initWithFrame:");
    [(GLKView *)v8 setAutoresizingMask:18];
    [(GLKViewController *)self setView:v8];
  }
}

- (void)viewDidUnload
{
  [(CADisplayLink *)self->_displayLink invalidate];

  self->_displayLink = 0;

  [(GLKViewController *)self setScreen:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(GLKViewController *)self setPaused:0];
  self->_viewIsVisible = 1;
  v5.receiver = self;
  v5.super_class = (Class)GLKViewController;
  [(GLKViewController *)&v5 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GLKViewController;
  [(GLKViewController *)&v4 viewWillDisappear:a3];
  self->_viewIsVisible = 0;
  [(GLKViewController *)self setPaused:1];
}

- (NSInteger)preferredFramesPerSecond
{
  return self->_preferredFramesPerSecond;
}

- (void)setPreferredFramesPerSecond:(NSInteger)preferredFramesPerSecond
{
  if (preferredFramesPerSecond <= 1) {
    int64_t preferredFramesPerSecond = 1;
  }
  self->_int64_t preferredFramesPerSecond = preferredFramesPerSecond;
  -[CADisplayLink setPreferredFramesPerSecond:](self->_displayLink, "setPreferredFramesPerSecond:");
  self->_framesPerSecond = self->_preferredFramesPerSecond;
}

- (void)setPaused:(BOOL)paused
{
  self->_displayLinkPaused = paused;
  if (self->_displayLink)
  {
    BOOL v3 = paused;
    if (!self->_firstResumeOccurred && !paused)
    {
      self->_timeSinceFirstResumeStartTime = CACurrentMediaTime();
      self->_firstResumeOccurred = 1;
    }
    if (!self->_lastResumeOccurred && !v3)
    {
      self->_timeSinceLastResumeStartTime = CACurrentMediaTime();
      self->_lastResumeOccurred = 1;
    }
    if (v3)
    {
      self->_lastResumeOccurred = 0;
      self->_lastUpdateOccurred = 0;
      self->_lastDrawOccurred = 0;
    }
    if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0) {
      [(GLKViewControllerDelegate *)self->_delegate glkViewController:self willPause:v3];
    }
    if (v3) {
      objc_msgSend((id)-[GLKViewController _existingView](self, "_existingView"), "setEnableSetNeedsDisplay:", 1);
    }
    displayLink = self->_displayLink;
    [(CADisplayLink *)displayLink setPaused:v3];
  }
}

- (BOOL)isPaused
{
  return [(CADisplayLink *)self->_displayLink isPaused];
}

- (NSTimeInterval)timeSinceFirstResume
{
  if (self->_firstResumeOccurred) {
    return CACurrentMediaTime() - self->_timeSinceFirstResumeStartTime;
  }
  else {
    return 0.0;
  }
}

- (NSTimeInterval)timeSinceLastResume
{
  if (self->_lastResumeOccurred) {
    return CACurrentMediaTime() - self->_timeSinceLastResumeStartTime;
  }
  else {
    return 0.0;
  }
}

- (void)setPauseOnWillResignActive:(BOOL)pauseOnWillResignActive
{
  self->_pauseOnWillResignActive = pauseOnWillResignActive;
  [(GLKViewController *)self _configureNotifications];
}

- (BOOL)pauseOnWillResignActive
{
  return self->_pauseOnWillResignActive;
}

- (void)setResumeOnDidBecomeActive:(BOOL)resumeOnDidBecomeActive
{
  self->_resumeOnDidBecomeActive = resumeOnDidBecomeActive;
  [(GLKViewController *)self _configureNotifications];
}

- (BOOL)resumeOnDidBecomeActive
{
  return self->_resumeOnDidBecomeActive;
}

- (UIScreen)screen
{
  return self->_screen;
}

- (void)setScreen:(id)a3
{
}

- (CADisplayLink)displayLink
{
  return self->_displayLink;
}

- (void)setDisplayLink:(id)a3
{
}

- (BOOL)displayLinkPaused
{
  return self->_displayLinkPaused;
}

- (void)setDisplayLinkPaused:(BOOL)a3
{
  self->_displayLinkPaused = a3;
}

- (GLKDisplayLinkMessenger)displayLinkMessenger
{
  return self->_displayLinkMessenger;
}

- (void)setDisplayLinkMessenger:(id)a3
{
}

- (BOOL)viewIsVisible
{
  return self->_viewIsVisible;
}

- (void)setViewIsVisible:(BOOL)a3
{
  self->_viewIsVisible = a3;
}

- (BOOL)firstResumeOccurred
{
  return self->_firstResumeOccurred;
}

- (void)setFirstResumeOccurred:(BOOL)a3
{
  self->_firstResumeOccurred = a3;
}

- (double)timeSinceFirstResumeStartTime
{
  return self->_timeSinceFirstResumeStartTime;
}

- (void)setTimeSinceFirstResumeStartTime:(double)a3
{
  self->_timeSinceFirstResumeStartTime = a3;
}

- (BOOL)lastResumeOccurred
{
  return self->_lastResumeOccurred;
}

- (void)setLastResumeOccurred:(BOOL)a3
{
  self->_lastResumeOccurred = a3;
}

- (double)timeSinceLastResumeStartTime
{
  return self->_timeSinceLastResumeStartTime;
}

- (void)setTimeSinceLastResumeStartTime:(double)a3
{
  self->_timeSinceLastResumeStartTime = a3;
}

- (BOOL)lastUpdateOccurred
{
  return self->_lastUpdateOccurred;
}

- (void)setLastUpdateOccurred:(BOOL)a3
{
  self->_lastUpdateOccurred = a3;
}

- (double)timeSinceLastUpdatePreviousTime
{
  return self->_timeSinceLastUpdatePreviousTime;
}

- (void)setTimeSinceLastUpdatePreviousTime:(double)a3
{
  self->_timeSinceLastUpdatePreviousTime = a3;
}

- (BOOL)lastDrawOccurred
{
  return self->_lastDrawOccurred;
}

- (void)setLastDrawOccurred:(BOOL)a3
{
  self->_lastDrawOccurred = a3;
}

- (double)timeSinceLastDrawPreviousTime
{
  return self->_timeSinceLastDrawPreviousTime;
}

- (void)setTimeSinceLastDrawPreviousTime:(double)a3
{
  self->_timeSinceLastDrawPreviousTime = a3;
}

- (void)updateIMP
{
  return self->_updateIMP;
}

- (void)setUpdateIMP:(void *)a3
{
  self->_updateIMP = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)delegate
{
  self->_delegate = (GLKViewControllerDelegate *)delegate;
}

- (int64_t)screenFramesPerSecond
{
  return self->_screenFramesPerSecond;
}

- (void)setScreenFramesPerSecond:(int64_t)a3
{
  self->_screenFramesPerSecond = a3;
}

- (NSInteger)framesPerSecond
{
  return self->_framesPerSecond;
}

- (NSInteger)framesDisplayed
{
  return self->_framesDisplayed;
}

- (NSTimeInterval)timeSinceLastUpdate
{
  return self->_timeSinceLastUpdate;
}

- (NSTimeInterval)timeSinceLastDraw
{
  return self->_timeSinceLastDraw;
}

@end