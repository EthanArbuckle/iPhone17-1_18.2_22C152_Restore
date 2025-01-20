@interface AXGestureRecorderViewController
- (AXGestureRecorderFingerPathCollection)dynamicFingerPathCollection;
- (AXGestureRecorderFingerPathCollection)fingerPathCollection;
- (AXGestureRecorderStyleProvider)styleProvider;
- (AXGestureRecorderViewControllerDelegate)delegate;
- (BOOL)canToggleChromeForGestureRecorderView:(id)a3;
- (BOOL)isChromeVisibleForGestureRecorderView:(id)a3;
- (BOOL)isEmpty;
- (BOOL)isInReplayMode;
- (BOOL)isTrackingTouches;
- (BOOL)shouldPreventFurtherRecording;
- (NSMutableArray)replayDynamicFingerPaths;
- (NSMutableDictionary)instantReplayPartialFingerPaths;
- (NSMutableDictionary)instantReplayTimestampIndexes;
- (double)_maximumDurationOfRecordedGesture;
- (double)trackingTouchesDidStartTimeInterval;
- (id)gestureRecorderView:(id)a3 dynamicFingerPathAtIndex:(unint64_t)a4;
- (id)recordedGesturePropertyListRepresentationWithName:(id)a3;
- (id)recordedReplayableGestureRepresentation;
- (int64_t)recorderType;
- (unint64_t)numberOfDynamicFingerPathsInGestureRecorderView:(id)a3;
- (unint64_t)replayTimestampIndex;
- (unint64_t)replayTimestampsCount;
- (void)_advanceInstantReplayForStaticFingerAtIndex:(id)a3;
- (void)_advanceReplay;
- (void)_clearWeakReferencesWithOutlets;
- (void)_didFinishReplayingRecordedGesture;
- (void)_didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a3;
- (void)_didStopRecordingAtomicFingerPath;
- (void)_endInstantReplay;
- (void)_endInstantReplayForStaticFingerAtIndex:(unint64_t)a3;
- (void)_exitReplayMode;
- (void)_freezeAllDynamicFingerPaths;
- (void)_startInstantReplayForStaticFingerAtIndex:(unint64_t)a3;
- (void)_updateDynamicFingerPathsWithTouches:(id)a3 touchesDidEnd:(BOOL)a4;
- (void)dealloc;
- (void)deleteAllFingerPaths;
- (void)gestureRecorderFingerPathCollection:(id)a3 didInsertFingerPathAtIndex:(unint64_t)a4;
- (void)gestureRecorderFingerPathCollection:(id)a3 didUpdateFingerPathAtIndex:(unint64_t)a4;
- (void)gestureRecorderView:(id)a3 setChromeVisible:(BOOL)a4;
- (void)hideStaticView;
- (void)loadView;
- (void)preventFurtherRecording;
- (void)reloadAllFingerPaths;
- (void)replayRecordedGesture;
- (void)setDelegate:(id)a3;
- (void)setDynamicFingerPathCollection:(id)a3;
- (void)setFingerPathCollection:(id)a3;
- (void)setInReplayMode:(BOOL)a3;
- (void)setInstantReplayPartialFingerPaths:(id)a3;
- (void)setInstantReplayTimestampIndexes:(id)a3;
- (void)setRecorderType:(int64_t)a3;
- (void)setReplayDynamicFingerPaths:(id)a3;
- (void)setReplayTimestampIndex:(unint64_t)a3;
- (void)setReplayTimestampsCount:(unint64_t)a3;
- (void)setShouldPreventFurtherRecording:(BOOL)a3;
- (void)setStyleProvider:(id)a3;
- (void)setTrackingTouches:(BOOL)a3;
- (void)setTrackingTouchesDidStartTimeInterval:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AXGestureRecorderViewController

- (void)dealloc
{
  [(AXGestureRecorderViewController *)self _releaseOutlets];
  v3.receiver = self;
  v3.super_class = (Class)AXGestureRecorderViewController;
  [(AXGestureRecorderViewController *)&v3 dealloc];
}

- (BOOL)isEmpty
{
  objc_super v3 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  uint64_t v4 = [v3 fingerPathsCount];
  v5 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
  LOBYTE(v4) = v4 + [v5 fingerPathsCount] == 0;

  return v4;
}

- (void)loadView
{
  objc_super v3 = [AXGestureRecorderView alloc];
  uint64_t v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v4 bounds];
  v6 = -[AXGestureRecorderView initWithFrame:](v3, "initWithFrame:");

  [(AXGestureRecorderView *)v6 setAutoresizingMask:18];
  v5 = [(AXGestureRecorderViewController *)self styleProvider];
  [(AXGestureRecorderView *)v6 setStyleProvider:v5];

  [(AXGestureRecorderView *)v6 setDataSource:self];
  [(AXGestureRecorderViewController *)self setView:v6];
}

- (void)hideStaticView
{
  id v2 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v2 hideStaticView];
}

- (id)recordedGesturePropertyListRepresentationWithName:(id)a3
{
  id v4 = a3;
  v5 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  v6 = [v5 propertyListRepresentationWithName:v4];

  return v6;
}

- (id)recordedReplayableGestureRepresentation
{
  id v2 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  objc_super v3 = [v2 replayableGestureRepresentation];

  return v3;
}

- (void)deleteAllFingerPaths
{
  [(AXGestureRecorderViewController *)self setFingerPathCollection:0];
  [(AXGestureRecorderViewController *)self setDynamicFingerPathCollection:0];
  objc_super v3 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v3 deleteAllFingerPaths];

  [(AXGestureRecorderViewController *)self setShouldPreventFurtherRecording:0];
  [(AXGestureRecorderViewController *)self setTrackingTouches:0];
  [(AXGestureRecorderViewController *)self _endInstantReplay];
}

- (void)preventFurtherRecording
{
}

- (void)replayRecordedGesture
{
  objc_super v3 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  uint64_t v4 = [v3 timestampsCount];

  if (v4
    && ([(AXGestureRecorderViewController *)self fingerPathCollection],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 fingerPathsCount],
        v5,
        v6))
  {
    [(AXGestureRecorderViewController *)self _endInstantReplay];
    [(AXGestureRecorderViewController *)self setInReplayMode:1];
    [(AXGestureRecorderViewController *)self setReplayTimestampIndex:0];
    [(AXGestureRecorderViewController *)self setReplayTimestampsCount:v4];
    [(AXGestureRecorderViewController *)self _advanceReplay];
  }
  else
  {
    [(AXGestureRecorderViewController *)self _exitReplayMode];
  }
}

- (void)reloadAllFingerPaths
{
  objc_super v3 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  uint64_t v4 = [(AXGestureRecorderViewController *)self numberOfDynamicFingerPathsInGestureRecorderView:v3];

  if (v4 >= 1)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      uint64_t v6 = [(AXGestureRecorderViewController *)self gestureRecorderView];
      [v6 reloadDynamicFingerPathAtIndex:i];
    }
  }
}

- (void)_advanceReplay
{
  unint64_t v4 = [(AXGestureRecorderViewController *)self replayTimestampIndex];
  if (v4 >= [(AXGestureRecorderViewController *)self replayTimestampsCount]) {
    _AXAssert();
  }
  if (v4 < [(AXGestureRecorderViewController *)self replayTimestampsCount])
  {
    id v17 = [(AXGestureRecorderViewController *)self gestureRecorderView];
    [v17 setReplayMode:1];
    if (!v4) {
      [v17 deleteAllFingerPaths];
    }
    v5 = [(AXGestureRecorderViewController *)self replayDynamicFingerPaths];
    unint64_t v6 = [v5 count];
    v7 = [(AXGestureRecorderViewController *)self fingerPathCollection];
    uint64_t v8 = [v7 fingerPathsCount];
    if (v8)
    {
      uint64_t v9 = v8;
      for (unint64_t i = 0; i != v9; ++i)
      {
        if (!v5)
        {
          v5 = objc_opt_new();
          [(AXGestureRecorderViewController *)self setReplayDynamicFingerPaths:v5];
        }
        v11 = [v7 fingerPathToAppendForIndex:i forTimestampAtIndex:v4];
        if (v11)
        {
          if (i >= v6)
          {
            [v5 addObject:v11];
            [v17 insertDynamicFingerPathAtIndex:v6++];
          }
          else
          {
            v12 = [v5 objectAtIndexedSubscript:i];
            [v12 appendPath:v11];
            [v17 reloadDynamicFingerPathAtIndex:i];
          }
        }
      }
    }
    [(AXGestureRecorderViewController *)self setReplayTimestampIndex:v4 + 1];
    if (v4 + 1 >= [(AXGestureRecorderViewController *)self replayTimestampsCount])
    {
      [(AXGestureRecorderViewController *)self _exitReplayMode];
    }
    else
    {
      [v7 timestampAtIndex:v4 + 1];
      double v14 = v13;
      [v7 timestampAtIndex:v4];
      [(AXGestureRecorderViewController *)self performSelector:v16 withObject:0 afterDelay:v14 - v15];
    }
  }
}

- (void)_exitReplayMode
{
  [(AXGestureRecorderViewController *)self setInReplayMode:0];
  [(AXGestureRecorderViewController *)self setReplayTimestampIndex:0];
  [(AXGestureRecorderViewController *)self setReplayTimestampsCount:0];
  [(AXGestureRecorderViewController *)self setReplayDynamicFingerPaths:0];
  objc_super v3 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v3 freezeAllDynamicFingerPaths];

  [(AXGestureRecorderViewController *)self _didFinishReplayingRecordedGesture];
  id v4 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v4 setReplayMode:0];
}

- (void)_advanceInstantReplayForStaticFingerAtIndex:(id)a3
{
  id v32 = a3;
  id v4 = [(AXGestureRecorderViewController *)self instantReplayTimestampIndexes];

  if (!v4)
  {
    v5 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXGestureRecorderViewController *)self setInstantReplayTimestampIndexes:v5];
  }
  unint64_t v6 = [(AXGestureRecorderViewController *)self instantReplayPartialFingerPaths];

  if (!v6)
  {
    v7 = [MEMORY[0x1E4F1CA60] dictionary];
    [(AXGestureRecorderViewController *)self setInstantReplayPartialFingerPaths:v7];
  }
  uint64_t v8 = [(AXGestureRecorderViewController *)self instantReplayTimestampIndexes];
  uint64_t v9 = [v8 objectForKeyedSubscript:v32];
  unint64_t v10 = [v9 unsignedIntegerValue];

  v11 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  unint64_t v12 = [v11 timestampsCount];

  uint64_t v13 = [v32 unsignedIntegerValue];
  if (v10 >= v12)
  {
    v20 = [(AXGestureRecorderViewController *)self fingerPathCollection];
    uint64_t v21 = [v20 timestampsCount];

    if (v10 != v21) {
      _AXAssert();
    }
    [(AXGestureRecorderViewController *)self _endInstantReplayForStaticFingerAtIndex:v13];
  }
  else
  {
    if (v10)
    {
      double v14 = [(AXGestureRecorderViewController *)self fingerPathCollection];
      double v15 = [v14 fingerPathToAppendForIndex:v13 forTimestampAtIndex:v10];

      ++v10;
    }
    else
    {
      double v15 = 0;
      while (v10 < v12)
      {
        while (1)
        {
          v22 = [(AXGestureRecorderViewController *)self fingerPathCollection];
          v23 = [v22 fingerPathToAppendForIndex:v13 forTimestampAtIndex:v10];

          ++v10;
          double v15 = v23;
          if (!v23) {
            break;
          }
          if (![v23 isEmpty] || v10 >= v12) {
            goto LABEL_8;
          }
        }
      }
      double v15 = 0;
    }
LABEL_8:
    uint64_t v16 = [NSNumber numberWithUnsignedInteger:v10];
    id v17 = [(AXGestureRecorderViewController *)self instantReplayTimestampIndexes];
    [v17 setObject:v16 forKeyedSubscript:v32];

    if (v15)
    {
      v18 = [(AXGestureRecorderViewController *)self instantReplayPartialFingerPaths];
      id v19 = [v18 objectForKeyedSubscript:v32];

      if (v19) {
        [v19 appendBezierPath:v15];
      }
      else {
        id v19 = v15;
      }
      v24 = [(AXGestureRecorderViewController *)self instantReplayPartialFingerPaths];
      [v24 setObject:v19 forKeyedSubscript:v32];

      v25 = [(AXGestureRecorderViewController *)self gestureRecorderView];
      [v25 updateInstantReplayAtIndex:v13 withPartialPath:v19];

      if (v10 >= v12)
      {
        double v31 = 0.3;
      }
      else
      {
        v26 = [(AXGestureRecorderViewController *)self fingerPathCollection];
        [v26 timestampAtIndex:v10];
        double v28 = v27;
        v29 = [(AXGestureRecorderViewController *)self fingerPathCollection];
        [v29 timestampAtIndex:v10 - 1];
        double v31 = v28 - v30;
      }
      [(AXGestureRecorderViewController *)self performSelector:sel__advanceInstantReplayForStaticFingerAtIndex_ withObject:v32 afterDelay:v31];
    }
    else
    {
      [(AXGestureRecorderViewController *)self _endInstantReplayForStaticFingerAtIndex:v13];
    }
  }
}

- (void)_startInstantReplayForStaticFingerAtIndex:(unint64_t)a3
{
  id v4 = [NSNumber numberWithUnsignedInteger:a3];
  [(AXGestureRecorderViewController *)self _advanceInstantReplayForStaticFingerAtIndex:v4];
}

- (void)_endInstantReplayForStaticFingerAtIndex:(unint64_t)a3
{
  v5 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v5 finishInstantReplayAtIndex:a3];

  unint64_t v6 = [(AXGestureRecorderViewController *)self instantReplayTimestampIndexes];
  v7 = [NSNumber numberWithUnsignedInteger:a3];
  [v6 removeObjectForKey:v7];

  id v9 = [(AXGestureRecorderViewController *)self instantReplayPartialFingerPaths];
  uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
  [v9 removeObjectForKey:v8];
}

- (void)_endInstantReplay
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(AXGestureRecorderViewController *)self instantReplayTimestampIndexes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__advanceInstantReplayForStaticFingerAtIndex_ object:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  uint64_t v8 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v8 clearInstantReplayFingerPaths];

  [(AXGestureRecorderViewController *)self setInstantReplayTimestampIndexes:0];
  [(AXGestureRecorderViewController *)self setInstantReplayPartialFingerPaths:0];
}

- (void)_clearWeakReferencesWithOutlets
{
  if ([(AXGestureRecorderViewController *)self isViewLoaded])
  {
    id v3 = [(AXGestureRecorderViewController *)self gestureRecorderView];
    [v3 setDataSource:0];
  }
}

- (double)_maximumDurationOfRecordedGesture
{
  id v3 = [(AXGestureRecorderViewController *)self delegate];
  double v4 = 0.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 maximumDurationOfRecordedGestureForGestureRecorderViewController:self];
    double v4 = v5;
  }

  return v4;
}

- (void)_didStartRecordingAtomicFingerPathAtPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v6 = [(AXGestureRecorderViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v6, "gestureRecorderViewController:didStartRecordingAtomicFingerPathAtPoint:", self, x, y);
  }
}

- (void)_didStopRecordingAtomicFingerPath
{
  id v3 = [(AXGestureRecorderViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 gestureRecorderViewControllerDidStopRecordingAtomicFingerPath:self];
  }
}

- (void)_didFinishReplayingRecordedGesture
{
  id v3 = [(AXGestureRecorderViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 gestureRecorderViewControllerDidFinishReplayingRecordedGesture:self];
  }
}

- (void)_updateDynamicFingerPathsWithTouches:(id)a3 touchesDidEnd:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  id v6 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
  if (!v6)
  {
    id v6 = [[AXGestureRecorderFingerPathCollection alloc] initWithMaximumFingerPathsCount:10];
    [(AXGestureRecorderFingerPathCollection *)v6 setShouldRecordRealTimeGesture:([(AXGestureRecorderViewController *)self recorderType] & 0xFFFFFFFFFFFFFFFDLL) == 1];
    v7 = [(AXGestureRecorderViewController *)self styleProvider];
    [v7 minimumFingerLineWidth];
    -[AXGestureRecorderFingerPathCollection setMinimumFingerLineWidth:](v6, "setMinimumFingerLineWidth:");

    uint64_t v8 = [(AXGestureRecorderViewController *)self styleProvider];
    [v8 maximumFingerLineWidth];
    -[AXGestureRecorderFingerPathCollection setMaximumFingerLineWidth:](v6, "setMaximumFingerLineWidth:");

    [(AXGestureRecorderFingerPathCollection *)v6 setDelegate:self];
    [(AXGestureRecorderViewController *)self setDynamicFingerPathCollection:v6];
  }
  long long v9 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  double Current = CFAbsoluteTimeGetCurrent();
  if (v4) {
    [(AXGestureRecorderFingerPathCollection *)v6 handleLiftForTouches:v11 referenceView:v9 time:Current];
  }
  else {
    [(AXGestureRecorderFingerPathCollection *)v6 appendPointsForTouches:v11 referenceView:v9 time:Current];
  }

  [(AXGestureRecorderViewController *)self reloadAllFingerPaths];
}

- (void)_freezeAllDynamicFingerPaths
{
  long long v9 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  if (!v9)
  {
    long long v9 = [[AXGestureRecorderFingerPathCollection alloc] initWithMaximumFingerPathsCount:10];
    [(AXGestureRecorderFingerPathCollection *)v9 setShouldRecordRealTimeGesture:([(AXGestureRecorderViewController *)self recorderType] & 0xFFFFFFFFFFFFFFFDLL) == 1];
    id v3 = [(AXGestureRecorderViewController *)self styleProvider];
    [v3 minimumFingerLineWidth];
    -[AXGestureRecorderFingerPathCollection setMinimumFingerLineWidth:](v9, "setMinimumFingerLineWidth:");

    BOOL v4 = [(AXGestureRecorderViewController *)self styleProvider];
    [v4 maximumFingerLineWidth];
    -[AXGestureRecorderFingerPathCollection setMaximumFingerLineWidth:](v9, "setMaximumFingerLineWidth:");

    [(AXGestureRecorderFingerPathCollection *)v9 setDelegate:self];
    [(AXGestureRecorderViewController *)self setFingerPathCollection:v9];
  }
  double v5 = [(AXGestureRecorderViewController *)self fingerPathCollection];
  unint64_t v6 = [v5 fingerPathsCount];

  v7 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
  [(AXGestureRecorderFingerPathCollection *)v9 appendFingerPathsFromFingerPathCollection:v7];
  uint64_t v8 = [(AXGestureRecorderViewController *)self gestureRecorderView];
  [v8 freezeAllDynamicFingerPathsWithInstantReplayOffset:v6];

  [v7 reset];
  [(AXGestureRecorderViewController *)self setTrackingTouches:0];
  if (![(AXGestureRecorderViewController *)self isInReplayMode])
  {
    while (v6 < [(AXGestureRecorderFingerPathCollection *)v9 fingerPathsCount])
      [(AXGestureRecorderViewController *)self _startInstantReplayForStaticFingerAtIndex:v6++];
  }
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  if (![(AXGestureRecorderViewController *)self shouldPreventFurtherRecording])
  {
    double v5 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
    uint64_t v6 = [v5 fingerPathsCount];
    v7 = [(AXGestureRecorderViewController *)self fingerPathCollection];
    unint64_t v8 = [v7 fingerPathsCount] + v6;

    if (v8 <= 9)
    {
      if (![(AXGestureRecorderViewController *)self isTrackingTouches])
      {
        if (![(AXGestureRecorderViewController *)self isInReplayMode])
        {
          if (![v12 count]) {
            _AXAssert();
          }
          long long v9 = [v12 anyObject];
          if ([(AXGestureRecorderViewController *)self recorderType] == 2 && v9)
          {
            uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];

            id v12 = (id)v10;
          }
          id v11 = [(AXGestureRecorderViewController *)self gestureRecorderView];
          [v9 locationInView:v11];
          -[AXGestureRecorderViewController _didStartRecordingAtomicFingerPathAtPoint:](self, "_didStartRecordingAtomicFingerPathAtPoint:");
        }
        [(AXGestureRecorderViewController *)self setTrackingTouches:1];
        [(AXGestureRecorderViewController *)self setTrackingTouchesDidStartTimeInterval:CFAbsoluteTimeGetCurrent()];
      }
      [(AXGestureRecorderViewController *)self _updateDynamicFingerPathsWithTouches:v12 touchesDidEnd:0];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  if (![(AXGestureRecorderViewController *)self shouldPreventFurtherRecording]
    && [(AXGestureRecorderViewController *)self isTrackingTouches])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(AXGestureRecorderViewController *)self trackingTouchesDidStartTimeInterval];
    double v7 = Current - v6;
    [(AXGestureRecorderViewController *)self _maximumDurationOfRecordedGesture];
    if (v7 <= v8) {
      [(AXGestureRecorderViewController *)self _updateDynamicFingerPathsWithTouches:v9 touchesDidEnd:0];
    }
    else {
      [(AXGestureRecorderViewController *)self _freezeAllDynamicFingerPaths];
    }
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  if (![(AXGestureRecorderViewController *)self shouldPreventFurtherRecording]
    && [(AXGestureRecorderViewController *)self isTrackingTouches])
  {
    double Current = CFAbsoluteTimeGetCurrent();
    [(AXGestureRecorderViewController *)self trackingTouchesDidStartTimeInterval];
    double v9 = Current - v8;
    [(AXGestureRecorderViewController *)self _maximumDurationOfRecordedGesture];
    if (v9 <= v10) {
      [(AXGestureRecorderViewController *)self _updateDynamicFingerPathsWithTouches:v15 touchesDidEnd:1];
    }
    uint64_t v11 = [v15 count];
    id v12 = [(AXGestureRecorderViewController *)self view];
    uint64_t v13 = [v6 touchesForView:v12];
    uint64_t v14 = [v13 count];

    if (v11 == v14)
    {
      [(AXGestureRecorderViewController *)self _freezeAllDynamicFingerPaths];
      if (![(AXGestureRecorderViewController *)self isInReplayMode]) {
        [(AXGestureRecorderViewController *)self _didStopRecordingAtomicFingerPath];
      }
    }
  }
}

- (unint64_t)numberOfDynamicFingerPathsInGestureRecorderView:(id)a3
{
  if ([(AXGestureRecorderViewController *)self isInReplayMode])
  {
    BOOL v4 = [(AXGestureRecorderViewController *)self replayDynamicFingerPaths];
    uint64_t v5 = [v4 count];
  }
  else
  {
    BOOL v4 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
    uint64_t v5 = [v4 fingerPathsCount];
  }
  unint64_t v6 = v5;

  return v6;
}

- (id)gestureRecorderView:(id)a3 dynamicFingerPathAtIndex:(unint64_t)a4
{
  if ([(AXGestureRecorderViewController *)self isInReplayMode])
  {
    unint64_t v6 = [(AXGestureRecorderViewController *)self replayDynamicFingerPaths];
    [v6 objectAtIndex:a4];
  }
  else
  {
    unint64_t v6 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];
    [v6 fingerPathAtIndex:a4];
  double v7 = };

  return v7;
}

- (BOOL)canToggleChromeForGestureRecorderView:(id)a3
{
  return [(AXGestureRecorderViewController *)self recorderType] != 0;
}

- (BOOL)isChromeVisibleForGestureRecorderView:(id)a3
{
  id v3 = self;
  BOOL v4 = [(AXGestureRecorderViewController *)self delegate];
  LOBYTE(v3) = [v4 isChromeVisibleForGestureRecorderViewController:v3];

  return (char)v3;
}

- (void)gestureRecorderView:(id)a3 setChromeVisible:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = [(AXGestureRecorderViewController *)self delegate];
  [v6 gestureRecorderViewController:self setChromeVisible:v4];
}

- (void)gestureRecorderFingerPathCollection:(id)a3 didInsertFingerPathAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];

  if (v7 == v6)
  {
    id v8 = [(AXGestureRecorderViewController *)self gestureRecorderView];
    [v8 insertDynamicFingerPathAtIndex:a4];
  }
}

- (void)gestureRecorderFingerPathCollection:(id)a3 didUpdateFingerPathAtIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(AXGestureRecorderViewController *)self dynamicFingerPathCollection];

  if (v7 == v6)
  {
    id v8 = [(AXGestureRecorderViewController *)self gestureRecorderView];
    [v8 reloadDynamicFingerPathAtIndex:a4];
  }
}

- (AXGestureRecorderStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
}

- (AXGestureRecorderViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AXGestureRecorderViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AXGestureRecorderFingerPathCollection)fingerPathCollection
{
  return self->_fingerPathCollection;
}

- (void)setFingerPathCollection:(id)a3
{
}

- (AXGestureRecorderFingerPathCollection)dynamicFingerPathCollection
{
  return self->_dynamicFingerPathCollection;
}

- (void)setDynamicFingerPathCollection:(id)a3
{
}

- (BOOL)shouldPreventFurtherRecording
{
  return self->_shouldPreventFurtherRecording;
}

- (void)setShouldPreventFurtherRecording:(BOOL)a3
{
  self->_shouldPreventFurtherRecording = a3;
}

- (BOOL)isTrackingTouches
{
  return self->_trackingTouches;
}

- (void)setTrackingTouches:(BOOL)a3
{
  self->_trackingTouches = a3;
}

- (double)trackingTouchesDidStartTimeInterval
{
  return self->_trackingTouchesDidStartTimeInterval;
}

- (void)setTrackingTouchesDidStartTimeInterval:(double)a3
{
  self->_trackingTouchesDidStartTimeInterval = a3;
}

- (BOOL)isInReplayMode
{
  return self->_inReplayMode;
}

- (void)setInReplayMode:(BOOL)a3
{
  self->_inReplayMode = a3;
}

- (unint64_t)replayTimestampIndex
{
  return self->_replayTimestampIndex;
}

- (void)setReplayTimestampIndex:(unint64_t)a3
{
  self->_replayTimestampIndedouble x = a3;
}

- (unint64_t)replayTimestampsCount
{
  return self->_replayTimestampsCount;
}

- (void)setReplayTimestampsCount:(unint64_t)a3
{
  self->_replayTimestampsCount = a3;
}

- (NSMutableArray)replayDynamicFingerPaths
{
  return self->_replayDynamicFingerPaths;
}

- (void)setReplayDynamicFingerPaths:(id)a3
{
}

- (int64_t)recorderType
{
  return self->_recorderType;
}

- (void)setRecorderType:(int64_t)a3
{
  self->_recorderType = a3;
}

- (NSMutableDictionary)instantReplayTimestampIndexes
{
  return self->_instantReplayTimestampIndexes;
}

- (void)setInstantReplayTimestampIndexes:(id)a3
{
}

- (NSMutableDictionary)instantReplayPartialFingerPaths
{
  return self->_instantReplayPartialFingerPaths;
}

- (void)setInstantReplayPartialFingerPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instantReplayPartialFingerPaths, 0);
  objc_storeStrong((id *)&self->_instantReplayTimestampIndexes, 0);
  objc_storeStrong((id *)&self->_replayDynamicFingerPaths, 0);
  objc_storeStrong((id *)&self->_dynamicFingerPathCollection, 0);
  objc_storeStrong((id *)&self->_fingerPathCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end