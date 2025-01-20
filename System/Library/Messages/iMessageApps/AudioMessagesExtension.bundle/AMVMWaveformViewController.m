@interface AMVMWaveformViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)allowedTimeRange;
- (AMWaveformDataSource)waveformDataSource;
- (NSHashTable)timeObservers;
- (RCAVWaveformViewController)waveformViewController;
- (RCTimeController)activeTimeController;
- (double)currentDuration;
- (double)currentTime;
- (double)targetTime;
- (float)currentRate;
- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4;
- (int64_t)timeControllerState;
- (void)_configureWaveformViewWithDataSource:(id)a3;
- (void)_syncWaveformCompactness;
- (void)addTimeObserver:(id)a3;
- (void)removeTimeObserver:(id)a3;
- (void)reset;
- (void)setActiveTimeController:(id)a3;
- (void)setAllowedTimeRange:(id)a3;
- (void)setCurrentDuration:(double)a3;
- (void)setCurrentRate:(float)a3;
- (void)setCurrentTime:(double)a3;
- (void)setTargetTime:(double)a3;
- (void)setTimeControllerState:(int64_t)a3;
- (void)setTimeObservers:(id)a3;
- (void)setWaveformDataSource:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)updatePowerLevel:(float)a3 startTime:(double)a4 endTime:(double)a5;
- (void)updatePowerLevels:(id)a3 startTime:(double)a4 endTime:(double)a5;
- (void)viewDidLoad;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation AMVMWaveformViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)AMVMWaveformViewController;
  [(AMVMWaveformViewController *)&v6 viewDidLoad];
  v3 = [[RCWaveformGenerator alloc] initWithSegmentFlushInterval:30.0];
  v4 = [[AMWaveformDataSource alloc] initWithWaveformGenerator:v3];
  waveformDataSource = self->_waveformDataSource;
  self->_waveformDataSource = v4;

  [(AMVMWaveformViewController *)self _configureWaveformViewWithDataSource:self->_waveformDataSource];
}

- (void)updatePowerLevels:(id)a3 startTime:(double)a4 endTime:(double)a5
{
  id v19 = a3;
  +[NSMutableData dataWithLength:](NSMutableData, "dataWithLength:", 4 * (void)[v19 count]);
  id v8 = objc_claimAutoreleasedReturnValue();
  v9 = [v8 mutableBytes];
  id v10 = [v19 count];
  if ((uint64_t)v10 >= 1)
  {
    id v11 = v10;
    for (i = 0; i != v11; i = (char *)i + 1)
    {
      v13 = [v19 objectAtIndexedSubscript:i];
      [v13 floatValue];
      v9[(void)i] = v14;
    }
  }
  double v15 = RCTimeRangeMake(a4, a5);
  v17 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v8, v15, v16);
  v18 = [(AMVMWaveformViewController *)self waveformDataSource];
  [v18 appendAveragePowerLevelsByDigestingWaveformSegment:v17];

  [(AMVMWaveformViewController *)self setCurrentTime:0.0];
}

- (void)updatePowerLevel:(float)a3 startTime:(double)a4 endTime:(double)a5
{
  float v14 = a3 + 3.0;
  id v8 = +[NSMutableData data];
  int v9 = 8;
  do
  {
    [v8 appendBytes:&v14 length:4];
    --v9;
  }
  while (v9);
  double v10 = RCTimeRangeMake(a4, a5);
  v12 = -[RCWaveformSegment initWithTimeRange:averagePowerLevelData:]([RCWaveformSegment alloc], "initWithTimeRange:averagePowerLevelData:", v8, v10, v11);
  v13 = [(AMVMWaveformViewController *)self waveformDataSource];
  [v13 appendAveragePowerLevelsByDigestingWaveformSegment:v12];

  [(AMVMWaveformViewController *)self setCurrentTime:a5];
}

- (int64_t)timeControllerState
{
  return self->_timeControllerState;
}

- (void)reset
{
  [(AMVMWaveformViewController *)self setCurrentTime:0.0];
  id v4 = [(AMVMWaveformViewController *)self waveformViewController];
  v3 = [v4 waveformViewController];
  [v3 setDataSource:0];
}

- (void)setTimeControllerState:(int64_t)a3
{
  self->_timeControllerState = a3;
  if (a3 == 2)
  {
    id v4 = [[RCWaveformGenerator alloc] initWithSegmentFlushInterval:30.0];
    v5 = [[AMWaveformDataSource alloc] initWithWaveformGenerator:v4];
    [(AMVMWaveformViewController *)self setWaveformDataSource:v5];

    objc_super v6 = [(AMVMWaveformViewController *)self waveformDataSource];
    [v6 beginLoading];

    v7 = [(AMVMWaveformViewController *)self waveformViewController];
    id v8 = [v7 waveformViewController];
    int v9 = [(AMVMWaveformViewController *)self waveformDataSource];
    [v8 setDataSource:v9];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  double v10 = [(NSHashTable *)self->_timeObservers allObjects];
  id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      float v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * (void)v14) timeController:self didChangeState:self->_timeControllerState];
        float v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (self->_timeControllerState <= 1uLL)
  {
    double v15 = [(AMVMWaveformViewController *)self waveformViewController];
    double v16 = [v15 waveformViewController];
    [v16 setScrubbingEnabled:0];
  }
}

- (NSHashTable)timeObservers
{
  timeObservers = self->_timeObservers;
  if (!timeObservers)
  {
    id v4 = +[NSHashTable weakObjectsHashTable];
    v5 = self->_timeObservers;
    self->_timeObservers = v4;

    timeObservers = self->_timeObservers;
  }

  return timeObservers;
}

- (void)addTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AMVMWaveformViewController *)self timeObservers];
  [v5 addObject:v4];
}

- (void)removeTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(AMVMWaveformViewController *)self timeObservers];
  [v5 removeObject:v4];
}

- (void)setCurrentTime:(double)a3
{
  self->_currentTime = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(NSHashTable *)self->_timeObservers allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) timeController:self didChangeCurrentTime:a3];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentRate:(float)a3
{
  self->_currentRate = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSHashTable *)self->_timeObservers allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v8 = v6;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        *(float *)&double v7 = a3;
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) timeController:self didChangeRate:v7];
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)setTargetTime:(double)a3
{
  self->_targetTime = a3;
  if ((char *)[(AMVMWaveformViewController *)self timeControllerState] != (char *)&def_3AC7C + 2)
  {
    [(AMVMWaveformViewController *)self setCurrentTime:a3];
  }
}

- (id)createNewWaveformViewControllerWithDataSource:(id)a3 isOverview:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [[RCAVWaveformViewController alloc] initWithWaveformDataSource:v6 isOverview:v4 isLockScreen:0 delegate:self];

  [(AMVMWaveformViewController *)self setCurrentTime:0.0];
  [(AMVMWaveformViewController *)self setCurrentDuration:600.0];
  [(AMVMWaveformViewController *)self setActiveTimeController:self];
  id v8 = [(AMVMWaveformViewController *)self activeTimeController];
  [(RCAVWaveformViewController *)v7 setActiveTimeController:v8];

  uint64_t v9 = [(RCAVWaveformViewController *)v7 waveformViewController];
  [v9 setIsPlayback:1];

  return v7;
}

- (void)_configureWaveformViewWithDataSource:(id)a3
{
  id v11 = a3;
  waveformViewController = self->_waveformViewController;
  if (!waveformViewController)
  {
    id v5 = [(AMVMWaveformViewController *)self createNewWaveformViewControllerWithDataSource:v11 isOverview:0];
    [(AMVMWaveformViewController *)self setWaveformViewController:v5];
    id v6 = [(AMVMWaveformViewController *)self view];
    double v7 = [v5 view];
    [v6 addSubview:v7];

    id v8 = [v5 waveformViewController];
    [v8 setIsOverview:0];

    [(AMVMWaveformViewController *)self addChildViewController:v5];
    [(RCAVWaveformViewController *)self->_waveformViewController didMoveToParentViewController:self];

    waveformViewController = self->_waveformViewController;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);
  [(RCAVWaveformViewController *)waveformViewController reloadWaveformDataSource:v11 withActiveTimeController:WeakRetained];

  long long v10 = [(RCAVWaveformViewController *)self->_waveformViewController waveformViewController];
  [v10 setIsOverview:0];

  [(AMVMWaveformViewController *)self _syncWaveformCompactness];
}

- (void)_syncWaveformCompactness
{
  v3 = [(AMVMWaveformViewController *)self waveformViewController];
  BOOL v4 = [v3 waveformViewController];
  [v4 setShowPlayBarOnly:0];

  id v5 = [(AMVMWaveformViewController *)self waveformViewController];
  id v6 = [v5 waveformViewController];
  [v6 setIsCompactView:0];

  id v7 = [(AMVMWaveformViewController *)self waveformViewController];
  [v7 setUserInteractionEnabled:0];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)AMVMWaveformViewController;
  -[AMVMWaveformViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:");
  if (!a3)
  {
    [(RCAVWaveformViewController *)self->_waveformViewController willMoveToParentViewController:0];
    id v5 = [(RCAVWaveformViewController *)self->_waveformViewController view];
    [v5 removeFromSuperview];

    [(RCAVWaveformViewController *)self->_waveformViewController removeFromParentViewController];
    waveformViewController = self->_waveformViewController;
    self->_waveformViewController = 0;
  }
}

- (double)targetTime
{
  return self->_targetTime;
}

- (double)currentDuration
{
  return self->_currentDuration;
}

- (void)setCurrentDuration:(double)a3
{
  self->_currentDuration = a3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)allowedTimeRange
{
  double beginTime = self->_allowedTimeRange.beginTime;
  double endTime = self->_allowedTimeRange.endTime;
  result.var1 = endTime;
  result.var0 = beginTime;
  return result;
}

- (void)setAllowedTimeRange:(id)a3
{
  self->_allowedTimeRange = ($93AB83F55FD8EAABF5C634313E89AB95)a3;
}

- (float)currentRate
{
  return self->_currentRate;
}

- (AMWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
}

- (RCAVWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (RCTimeController)activeTimeController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTimeController);

  return (RCTimeController *)WeakRetained;
}

- (void)setActiveTimeController:(id)a3
{
}

- (void)setTimeObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeObservers, 0);
  objc_destroyWeak((id *)&self->_activeTimeController);
  objc_storeStrong((id *)&self->_waveformViewController, 0);

  objc_storeStrong((id *)&self->_waveformDataSource, 0);
}

@end