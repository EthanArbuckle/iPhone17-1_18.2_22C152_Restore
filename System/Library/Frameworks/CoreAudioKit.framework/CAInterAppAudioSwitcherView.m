@interface CAInterAppAudioSwitcherView
- (BOOL)isHostConnected;
- (BOOL)isShowingAppNames;
- (CAInterAppAudioSwitcherView)initWithCoder:(id)a3;
- (CAInterAppAudioSwitcherView)initWithFrame:(CGRect)a3;
- (CGFloat)contentWidth;
- (void)appHasGoneForeground;
- (void)appHasGoneInBackground;
- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7;
- (void)changePage:(id)a3;
- (void)didMoveToSuperview;
- (void)initialize;
- (void)layoutSubviews;
- (void)nodePressed:(id)a3;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)removeFromSuperview;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)setOutputAudioUnit:(AudioUnit)au;
- (void)setShowingAppNames:(BOOL)showingAppNames;
- (void)startTimer;
- (void)updateInfo;
- (void)updateNodeList;
@end

@implementation CAInterAppAudioSwitcherView

- (void)initialize
{
  v3 = [CAIAANodeContainer alloc];
  [(CAInterAppAudioSwitcherView *)self frame];
  double v5 = v4;
  [(CAInterAppAudioSwitcherView *)self frame];
  v6 = -[CAIAANodeContainer initWithFrame:](v3, "initWithFrame:", 0.0, 0.0, v5);
  self->nodeView = v6;
  [(CAIAANodeContainer *)v6 setAutoresizingMask:18];
  -[CAInterAppAudioSwitcherView setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x263F825C8] clearColor]);
  [(CAInterAppAudioSwitcherView *)self addSubview:self->nodeView];
  [(CAIAANodeContainer *)self->nodeView addObserver:self forKeyPath:@"numPages" options:1 context:0];
  [(CAIAANodeContainer *)self->nodeView setDelegate:self];
  v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel_appHasGoneInBackground name:*MEMORY[0x263F83330] object:0];
  v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  uint64_t v9 = *MEMORY[0x263F833B8];

  [v8 addObserver:self selector:sel_appHasGoneForeground name:v9 object:0];
}

- (CAInterAppAudioSwitcherView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioSwitcherView;
  v3 = -[CAInterAppAudioSwitcherView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v4 = v3;
  if (v3) {
    [(CAInterAppAudioSwitcherView *)v3 initialize];
  }
  return v4;
}

- (CAInterAppAudioSwitcherView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CAInterAppAudioSwitcherView;
  v3 = [(CAInterAppAudioSwitcherView *)&v6 initWithCoder:a3];
  double v4 = v3;
  if (v3) {
    [(CAInterAppAudioSwitcherView *)v3 initialize];
  }
  return v4;
}

- (void)removeFromSuperview
{
  [(NSTimer *)self->refreshTimer invalidate];
  self->refreshTimer = 0;
  [(CAIAANodeContainer *)self->nodeView removeObserver:self forKeyPath:@"numPages"];
  [(CAIAANodeContainer *)self->nodeView setDelegate:0];
  [(CAIAANodeContainer *)self->nodeView removeFromSuperview];
  v3.receiver = self;
  v3.super_class = (Class)CAInterAppAudioSwitcherView;
  [(CAInterAppAudioSwitcherView *)&v3 removeFromSuperview];
}

- (void)startTimer
{
  refreshTimer = self->refreshTimer;
  if (!refreshTimer)
  {
    refreshTimer = (NSTimer *)[MEMORY[0x263EFFA20] scheduledTimerWithTimeInterval:self target:sel_updateInfo selector:0 userInfo:1 repeats:2.0];
    self->refreshTimer = refreshTimer;
  }

  [(NSTimer *)refreshTimer setTolerance:0.5];
}

- (void)didMoveToSuperview
{
  v3.receiver = self;
  v3.super_class = (Class)CAInterAppAudioSwitcherView;
  [(CAInterAppAudioSwitcherView *)&v3 didMoveToSuperview];
  [(CAInterAppAudioSwitcherView *)self startTimer];
}

- (void)setOutputAudioUnit:(AudioUnit)au
{
  outputUnit = self->outputUnit;
  if (outputUnit != au)
  {
    if (outputUnit)
    {
      uint64_t v6 = AudioUnitRemovePropertyListenerWithUserData(outputUnit, 0x65u, (AudioUnitPropertyListenerProc)AudioUnitIAASwitcherPropertyChangeDispatcher, self);
      if (v6) {
        NSLog(&cfstr_ErrorRemovingP.isa, v6);
      }
    }
    self->outputUnit = au;
    if (au)
    {
      uint64_t v7 = AudioUnitAddPropertyListener(au, 0x65u, (AudioUnitPropertyListenerProc)AudioUnitIAASwitcherPropertyChangeDispatcher, self);
      if (v7)
      {
        NSLog(&cfstr_ErrorAddingPro.isa, v7);
        return;
      }
    }
    else
    {
      self->isHostConnected = 1;
    }
    [(CAInterAppAudioSwitcherView *)self updateInfo];
  }
}

- (BOOL)isShowingAppNames
{
  return self->showingAppNames;
}

- (void)setShowingAppNames:(BOOL)showingAppNames
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->showingAppNames != showingAppNames)
  {
    BOOL v3 = showingAppNames;
    self->showingAppNames = showingAppNames;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    double v5 = (void *)[(CAIAANodeContainer *)self->nodeView subviews];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v10 setHasLabel:v3];
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [(CAIAANodeContainer *)self->nodeView setNeedsLayout];
  }
}

- (void)updateNodeList
{
  objc_msgSend((id)-[CAIAANodeContainer subviews](self->nodeView, "subviews"), "makeObjectsPerformSelector:", sel_removeFromSuperview);
  if ([(CAIAANodeInfo *)self->info numNodes])
  {
    objc_msgSend(-[CAIAANodeInfo nodeAtIndex:](self->info, "nodeAtIndex:", 0), "frame");
    double v4 = v3;
    [(CAIAANodeContainer *)self->nodeView frame];
    double v6 = v5;
    if ([(CAIAANodeInfo *)self->info numNodes])
    {
      unint64_t v7 = 0;
      float v8 = (v6 - v4) * 0.5;
      double v9 = floorf(v8);
      do
      {
        id v10 = [(CAIAANodeInfo *)self->info nodeAtIndex:v7];
        [v10 frame];
        double v12 = v11;
        [v10 frame];
        double v14 = v13 + v9;
        [v10 frame];
        double v16 = v15;
        [v10 frame];
        objc_msgSend(v10, "setFrame:", v12, v14, v16);
        [v10 addTarget:self action:sel_nodePressed_ forControlEvents:64];
        [v10 setHasLabel:self->showingAppNames];
        [(CAIAANodeContainer *)self->nodeView addSubview:v10];
        ++v7;
      }
      while (v7 < [(CAIAANodeInfo *)self->info numNodes]);
    }
  }

  [(CAInterAppAudioSwitcherView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)CAInterAppAudioSwitcherView;
  [(CAInterAppAudioSwitcherView *)&v14 layoutSubviews];
  [(CAIAANodeContainer *)self->nodeView layoutSubviews];
  uint64_t v3 = [(CAIAANodeContainer *)self->nodeView numPages];
  pageControl = self->pageControl;
  if (v3 < 2)
  {
    if (pageControl)
    {
      [(UIPageControl *)pageControl removeFromSuperview];
      self->pageControl = 0;
      [(CAInterAppAudioSwitcherView *)self frame];
      -[CAIAANodeContainer setFrame:](self->nodeView, "setFrame:");
    }
  }
  else if (!pageControl)
  {
    double v5 = (UIPageControl *)objc_alloc_init(MEMORY[0x263F829F0]);
    self->pageControl = v5;
    [(UIPageControl *)v5 sizeForNumberOfPages:[(CAIAANodeContainer *)self->nodeView numPages]];
    double v7 = v6;
    double v9 = v8;
    [(CAInterAppAudioSwitcherView *)self frame];
    float v11 = (v10 - v7) * 0.5;
    double v12 = floorf(v11);
    [(CAInterAppAudioSwitcherView *)self frame];
    -[UIPageControl setFrame:](self->pageControl, "setFrame:", v12, v13 - v9, v7, v9);
    [(UIPageControl *)self->pageControl setNumberOfPages:[(CAIAANodeContainer *)self->nodeView numPages]];
    [(UIPageControl *)self->pageControl setCurrentPage:0];
    [(UIPageControl *)self->pageControl addTarget:self action:sel_changePage_ forControlEvents:4096];
  }
}

- (void)changePage:(id)a3
{
  if (self->nodeView)
  {
    double v4 = (double)[(UIPageControl *)self->pageControl currentPage];
    [(CAIAANodeContainer *)self->nodeView frame];
    nodeView = self->nodeView;
    -[CAIAANodeContainer setContentOffset:animated:](nodeView, "setContentOffset:animated:", 1, v5 * v4, 0.0);
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  if (objc_msgSend(a3, "isEqualToString:", @"numPages", a4, a5, a6) && self->nodeView == a4)
  {
    uint64_t v8 = [a4 numPages];
    pageControl = self->pageControl;
    [(UIPageControl *)pageControl setNumberOfPages:v8];
  }
}

- (void)nodePressed:(id)a3
{
  double v4 = (void *)[MEMORY[0x263F82438] sharedApplication];
  uint64_t v5 = [a3 url];

  [v4 openURL:v5];
}

- (void)appHasGoneForeground
{
  [(CAInterAppAudioSwitcherView *)self updateNodeList];

  [(CAInterAppAudioSwitcherView *)self startTimer];
}

- (void)appHasGoneInBackground
{
  self->refreshTimer = 0;
}

- (BOOL)isHostConnected
{
  outputUnit = self->outputUnit;
  if (outputUnit)
  {
    UInt32 ioDataSize = 4;
    int outData = 0;
    if (!AudioUnitGetProperty(outputUnit, 0x65u, 0, 0, &outData, &ioDataSize))
    {
      BOOL v4 = outData != 0;
      if (self->isHostConnected != v4) {
        self->isHostConnected = v4;
      }
    }
  }
  return self->isHostConnected;
}

- (CGFloat)contentWidth
{
  [(CAIAANodeContainer *)self->nodeView contentWidth];
  return result;
}

- (void)audioUnitPropertyChangedListener:(void *)a3 unit:(OpaqueAudioComponentInstance *)a4 propID:(unsigned int)a5 scope:(unsigned int)a6 element:(unsigned int)a7
{
  if (a5 == 101) {
    [(CAInterAppAudioSwitcherView *)self updateInfo];
  }
}

- (void)updateInfo
{
  BOOL v3 = [(CAInterAppAudioSwitcherView *)self isHostConnected];
  self->isHostConnected = v3;
  info = self->info;
  if (v3)
  {
    if (info)
    {
      [(CAIAANodeInfo *)info refresh];
    }
    else
    {
      self->info = objc_alloc_init(CAIAANodeInfo);
      -[CAIAANodeInfo setLabelColor:](self->info, "setLabelColor:", [MEMORY[0x263F825C8] lightGrayColor]);
    }
  }
  else if (info)
  {

    self->info = 0;
  }

  [(CAInterAppAudioSwitcherView *)self updateNodeList];
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  if (self->pageControl)
  {
    [a3 contentOffset];
    double v6 = v5;
    [a3 contentSize];
    *(float *)&double v7 = v6 / v7;
    unint64_t v8 = llroundf(*(float *)&v7);
    pageControl = self->pageControl;
    [(UIPageControl *)pageControl setCurrentPage:v8];
  }
}

@end