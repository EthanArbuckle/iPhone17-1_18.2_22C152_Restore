@interface RCAVWaveformViewController
- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)nextPreviewTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange;
- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange;
- (BOOL)_canShowWhileLocked;
- (BOOL)autocenterCurrentTimeIndicatorAlways;
- (BOOL)clipsTimeMarkersToDuration;
- (BOOL)currentTimeTracksCapturedEndPoint;
- (BOOL)isEditMode;
- (BOOL)isOverview;
- (BOOL)isSelectionOverlayVisible;
- (BOOL)isUserInteractionEnabled;
- (CGRect)waveformRectForLayoutBounds:(CGRect)a3;
- (RCAVWaveformViewController)initWithCoder:(id)a3;
- (RCAVWaveformViewController)initWithWaveformDataSource:(id)a3 isOverview:(BOOL)a4 isLockScreen:(BOOL)a5 delegate:(id)a6;
- (RCAVWaveformViewControllerDelegate)delegate;
- (RCTimeController)activeTimeController;
- (RCWaveformDataSource)waveformDataSource;
- (RCWaveformViewController)waveformViewController;
- (double)currentTime;
- (double)currentTimeIndicatorCoordinate;
- (double)duration;
- (double)maximumSelectionDuration;
- (double)nextPreviewStartTime;
- (double)waveformBottomLineInset;
- (id)_selectionOverlay;
- (unint64_t)_currentTimeDisplayOptions;
- (unint64_t)_currentTimeDisplayOptionsIgnoringSelectionOverlayState:(BOOL)a3;
- (void)_beginShowingSelectionOverlayAndEnableInsertMode:(BOOL)a3;
- (void)_didUpdateDisplayableTime;
- (void)_endShowingSelectionOverlayWithCompletionBlock:(id)a3;
- (void)_setSelectionOverlayEnabled:(BOOL)a3;
- (void)_setWaveformDataSource:(id)a3 initialTime:(double)a4;
- (void)_updateCurrentTimeForCapturedInputAtTime:(double)a3;
- (void)_updateDisplayableTimesWithBlock:(id)a3;
- (void)_updateInterfaceForTimeControllerState:(int64_t)a3;
- (void)dealloc;
- (void)hidSelectionOverlayWithCompletionBlock:(id)a3;
- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4;
- (void)resetSelectedTimeRangeToFullDuration;
- (void)setActiveTimeController:(id)a3;
- (void)setAutocenterCurrentTimeIndicatorAlways:(BOOL)a3;
- (void)setClipsTimeMarkersToDuration:(BOOL)a3;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeTracksCapturedEndPoint:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDuration:(double)a3;
- (void)setHighlightTimeRange:(id)a3;
- (void)setIsEditMode:(BOOL)a3;
- (void)setIsOverview:(BOOL)a3;
- (void)setMaximumSelectionDuration:(double)a3;
- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setVisibleTimeRange:(id)a3;
- (void)setWaveformDataSource:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)showSelectionOverlayAndEnableInsertMode:(BOOL)a3;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5;
- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didJumpTime:(BOOL)a5;
- (void)timeController:(id)a3 didChangeState:(int64_t)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)waveformViewController:(id)a3 didScrubToTime:(double)a4 finished:(BOOL)a5;
- (void)waveformViewControllerDidEndEditingSelectedTimeRange:(id)a3;
- (void)willMoveToParentViewController:(id)a3;
@end

@implementation RCAVWaveformViewController

- (RCAVWaveformViewController)initWithCoder:(id)a3
{
  return [(RCAVWaveformViewController *)self init];
}

- (RCAVWaveformViewController)initWithWaveformDataSource:(id)a3 isOverview:(BOOL)a4 isLockScreen:(BOOL)a5 delegate:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a6;
  v26.receiver = self;
  v26.super_class = (Class)RCAVWaveformViewController;
  v12 = [(RCAVWaveformViewController *)&v26 initWithNibName:0 bundle:0];
  v13 = v12;
  if (v12)
  {
    v12->_isOverview = v8;
    v12->_userInteractionEnabled = 1;
    v12->_autocenterCurrentTimeIndicatorAlways = !v12->_isOverview;
    v12->_clipsTimeMarkersToDuration = 1;
    v12->_currentTimeTracksCapturedEndPoint = 1;
    [v10 duration];
    v13->_duration = v14;
    v15 = [[RCWaveformViewController alloc] initWithOverviewWaveform:v8 duration:v13->_duration];
    waveformViewController = v13->_waveformViewController;
    v13->_waveformViewController = v15;

    [(RCWaveformViewController *)v13->_waveformViewController setCurrentTime:0.0];
    [(RCWaveformViewController *)v13->_waveformViewController setCurrentTimeDisplayOptions:v13->_duration > 0.0];
    [(RCWaveformViewController *)v13->_waveformViewController setDelegate:v13];
    [(RCAVWaveformViewController *)v13 addChildViewController:v13->_waveformViewController];
    [(RCAVWaveformViewController *)v13 _setWaveformDataSource:v10 initialTime:0.0];
    [(RCWaveformViewController *)v13->_waveformViewController didMoveToParentViewController:v13];
    objc_storeWeak((id *)&v13->_delegate, v11);
    if (v13->_isOverview && !a5)
    {
      v17 = [RCHitTestForwardingView alloc];
      double y = CGRectZero.origin.y;
      double width = CGRectZero.size.width;
      double height = CGRectZero.size.height;
      v21 = -[RCHitTestForwardingView initWithFrame:](v17, "initWithFrame:", CGRectZero.origin.x, y, width, height);
      leftForwardingView = v13->_leftForwardingView;
      v13->_leftForwardingView = v21;

      v23 = -[RCHitTestForwardingView initWithFrame:]([RCHitTestForwardingView alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
      rightForwardingView = v13->_rightForwardingView;
      v13->_rightForwardingView = v23;
    }
  }

  return v13;
}

- (void)dealloc
{
  [(RCTimeController *)self->_activeTimeController removeTimeObserver:self];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v4 dealloc];
}

- (void)willMoveToParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)RCAVWaveformViewController;
  -[RCAVWaveformViewController willMoveToParentViewController:](&v7, "willMoveToParentViewController:");
  if (!a3)
  {
    [(RCWaveformViewController *)self->_waveformViewController willMoveToParentViewController:0];
    v5 = [(RCWaveformViewController *)self->_waveformViewController view];
    [v5 removeFromSuperview];

    [(RCWaveformViewController *)self->_waveformViewController removeFromParentViewController];
    waveformViewController = self->_waveformViewController;
    self->_waveformViewController = 0;
  }
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v8 viewDidLoad];
  v3 = [(RCAVWaveformViewController *)self view];
  objc_super v4 = [(RCAVWaveformViewController *)self waveformViewController];
  v5 = [v4 view];
  [v3 addSubview:v5];

  if (self->_isOverview)
  {
    [(RCHitTestForwardingView *)self->_leftForwardingView setUserInteractionEnabled:1];
    v6 = [(RCAVWaveformViewController *)self _selectionOverlay];
    [(RCHitTestForwardingView *)self->_leftForwardingView setTargetView:v6];

    [(RCHitTestForwardingView *)self->_rightForwardingView setUserInteractionEnabled:1];
    objc_super v7 = [(RCAVWaveformViewController *)self _selectionOverlay];
    [(RCHitTestForwardingView *)self->_rightForwardingView setTargetView:v7];
  }
}

- (void)viewDidLayoutSubviews
{
  v3 = [(RCAVWaveformViewController *)self waveformViewController];
  objc_super v4 = [v3 view];
  v5 = [(RCAVWaveformViewController *)self view];
  [v5 bounds];
  [(RCAVWaveformViewController *)self annotatedWaveformRectForLayoutBounds:"annotatedWaveformRectForLayoutBounds:"];
  objc_msgSend(v4, "setFrame:");

  v20.receiver = self;
  v20.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v20 viewDidLayoutSubviews];
  if (self->_isOverview)
  {
    v6 = [(RCAVWaveformViewController *)self view];
    [v6 frame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;

    v15 = [(RCAVWaveformViewController *)self view];
    v16 = [v15 superview];
    [v16 frame];
    double v18 = v17;

    double v19 = (v18 - v12) * 0.5;
    -[RCHitTestForwardingView setFrame:](self->_leftForwardingView, "setFrame:", v8 - v19, v10, v19, v14);
    -[RCHitTestForwardingView setFrame:](self->_rightForwardingView, "setFrame:", v8 + v12, v10, v19, v14);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v5 viewWillAppear:a3];
  [(RCTimeController *)self->_activeTimeController currentTime];
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:");
  [(RCAVWaveformViewController *)self _updateCurrentTimeForCapturedInputAtTime:self->_currentTime];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22FD0;
  v4[3] = &unk_6D490;
  v4[4] = self;
  [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v4];
  [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:[(RCTimeController *)self->_activeTimeController timeControllerState]];
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v8 viewDidAppear:a3];
  [(RCTimeController *)self->_activeTimeController addTimeObserver:self];
  if (self->_isOverview)
  {
    objc_super v4 = [(RCAVWaveformViewController *)self view];
    objc_super v5 = [v4 superview];
    [v5 addSubview:self->_leftForwardingView];

    v6 = [(RCAVWaveformViewController *)self view];
    double v7 = [v6 superview];
    [v7 addSubview:self->_rightForwardingView];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v4 viewWillDisappear:a3];
  if (self->_isOverview)
  {
    [(RCHitTestForwardingView *)self->_leftForwardingView removeFromSuperview];
    [(RCHitTestForwardingView *)self->_rightForwardingView removeFromSuperview];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)RCAVWaveformViewController;
  [(RCAVWaveformViewController *)&v3 viewDidDisappear:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadWaveformDataSource:(id)a3 withActiveTimeController:(id)a4
{
  id v7 = a4;
  id v6 = a3;
  [v7 currentTime];
  -[RCAVWaveformViewController _setWaveformDataSource:initialTime:](self, "_setWaveformDataSource:initialTime:", v6);

  [(RCAVWaveformViewController *)self setActiveTimeController:v7];
}

- (void)setActiveTimeController:(id)a3
{
  objc_super v5 = (RCTimeController *)a3;
  p_activeTimeController = &self->_activeTimeController;
  activeTimeController = self->_activeTimeController;
  if (activeTimeController != v5)
  {
    double v11 = v5;
    [(RCTimeController *)activeTimeController removeTimeObserver:self];
    objc_storeStrong((id *)&self->_activeTimeController, a3);
    [(RCTimeController *)*p_activeTimeController addTimeObserver:self];
    objc_super v5 = v11;
    if (v11)
    {
      [(RCTimeController *)v11 currentTime];
      double v9 = v8;
      [(RCAVWaveformViewController *)self currentTime];
      if (v9 != v10) {
        [(RCAVWaveformViewController *)self setCurrentTime:v9];
      }
      [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:[(RCTimeController *)*p_activeTimeController timeControllerState]];
      objc_super v5 = v11;
    }
  }
}

- (void)setIsEditMode:(BOOL)a3
{
  if (self->_isEditMode != a3)
  {
    BOOL v3 = a3;
    self->_isEditMode = a3;
    id v4 = [(RCAVWaveformViewController *)self waveformViewController];
    [v4 setEditing:v3];
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)nextPreviewTimeRange
{
  if (self->_selectionOverlayVisible)
  {
    [(RCAVWaveformViewController *)self selectedTimeRange];
  }
  else
  {
    double v2 = -1.79769313e308;
    double v3 = 1.79769313e308;
  }
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setVisibleTimeRange:(id)a3
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)visibleTimeRange
{
  [(RCWaveformViewController *)self->_waveformViewController visibleTimeRange];
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (void)setHighlightTimeRange:(id)a3
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  p_highlightTimeRange = &self->_highlightTimeRange;
  if (!RCTimeRangeEqualToTimeRange(self->_highlightTimeRange.beginTime, self->_highlightTimeRange.endTime, a3.var0, a3.var1))
  {
    p_highlightTimeRange->beginTime = var0;
    p_highlightTimeRange->endTime = var1;
    waveformViewController = self->_waveformViewController;
    -[RCWaveformViewController setHighlightTimeRange:](waveformViewController, "setHighlightTimeRange:", var0, var1);
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)setHighlightTimeRange
{
  if (self->_waveformViewController)
  {
    [(RCWaveformViewController *)self->_waveformViewController highlightTimeRange];
  }
  else
  {
    double beginTime = self->_highlightTimeRange.beginTime;
    double endTime = self->_highlightTimeRange.endTime;
  }
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (void)setCurrentTime:(double)a3
{
  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    self->_nextPreviewStartTime = a3;
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
    if (self->_didJumpTime)
    {
      [(RCTimeController *)self->_activeTimeController currentRate];
      if (v4 > 0.0) {
        self->_didJumpTime = 0;
      }
    }
  }
}

- (void)setDuration:(double)a3
{
  if (self->_duration != a3)
  {
    self->_duration = a3;
    -[RCWaveformViewController setDuration:](self->_waveformViewController, "setDuration:");
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (CGRect)waveformRectForLayoutBounds:(CGRect)a3
{
  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.x = v3;
  return result;
}

- (double)waveformBottomLineInset
{
  -[RCWaveformViewController waveformRectForLayoutBounds:](self->_waveformViewController, "waveformRectForLayoutBounds:", 0.0, 0.0, 320.0, 1000.0);
  return 1000.0 - CGRectGetMaxY(v3);
}

- (double)currentTimeIndicatorCoordinate
{
  if ([(RCAVWaveformViewController *)self _currentTimeDisplayOptionsIgnoringSelectionOverlayState:1])
  {
    double v5 = [(RCAVWaveformViewController *)self view];
    [v5 bounds];
    double MidX = CGRectGetMidX(v8);

    return MidX;
  }
  else
  {
    waveformViewController = self->_waveformViewController;
    [(RCWaveformViewController *)waveformViewController currentTimeIndicatorCoordinate];
  }
  return result;
}

- (void)setAutocenterCurrentTimeIndicatorAlways:(BOOL)a3
{
  if (self->_autocenterCurrentTimeIndicatorAlways != a3)
  {
    self->_autocenterCurrentTimeIndicatorAlways = a3;
    waveformViewController = self->_waveformViewController;
    unint64_t v4 = [(RCAVWaveformViewController *)self _currentTimeDisplayOptions];
    [(RCWaveformViewController *)waveformViewController setCurrentTimeDisplayOptions:v4];
  }
}

- (void)setClipsTimeMarkersToDuration:(BOOL)a3
{
  if (self->_clipsTimeMarkersToDuration != a3)
  {
    self->_clipsTimeMarkersToDuration = a3;
    -[RCWaveformViewController setClipTimeMarkersToDuration:](self->_waveformViewController, "setClipTimeMarkersToDuration:");
  }
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void)showSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
}

- (void)hidSelectionOverlayWithCompletionBlock:(id)a3
{
}

- (void)setSelectedTimeRange:(id)a3 animationDuration:(double)a4
{
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)selectedTimeRange
{
  [(RCWaveformViewController *)self->_waveformViewController selectedTimeRange];
  result.double var1 = v3;
  result.double var0 = v2;
  return result;
}

- (void)resetSelectedTimeRangeToFullDuration
{
  [(RCAVWaveformViewController *)self maximumSelectionDuration];
  double v4 = v3;
  if (v3 == 0.0)
  {
    [(RCAVWaveformViewController *)self duration];
    double v4 = v5;
  }
  if (v4 >= 0.0)
  {
    if ([(RCAVWaveformViewController *)self isViewLoaded])
    {
      double v6 = [(RCAVWaveformViewController *)self view];
      [v6 window];
    }
    id v9 = [(RCAVWaveformViewController *)self waveformViewController];
    [v9 duration];
    if (v4 >= v7) {
      double v8 = v7;
    }
    else {
      double v8 = v4;
    }
    [v9 setSelectedTimeRange:RCTimeRangeMake(0.0 animationDuration:v8)];
  }
}

- (void)setMaximumSelectionDuration:(double)a3
{
  if (self->_maximumSelectionDuration != a3)
  {
    self->_maximumSelectionDuration = a3;
    -[RCWaveformViewController setMaximumSelectionDuration:](self->_waveformViewController, "setMaximumSelectionDuration:");
  }
}

- (void)waveformViewController:(id)a3 didScrubToTime:(double)a4 finished:(BOOL)a5
{
  BOOL v5 = a5;
  if (UIAccessibilityIsVoiceOverRunning() && (CFAbsoluteTimeGetCurrent() - *(double *)&qword_82EB0 > 2.0 || v5))
  {
    UIAccessibilityNotifications v9 = UIAccessibilityAnnouncementNotification;
    double v10 = UIAXTimeStringForDuration();
    UIAccessibilityPostNotification(v9, v10);

    qword_82EB0 = CFAbsoluteTimeGetCurrent();
  }
  activeTimeController = self->_activeTimeController;

  [(RCTimeController *)activeTimeController setTargetTime:a4];
}

- (void)waveformViewControllerDidEndEditingSelectedTimeRange:(id)a3
{
  [(RCAVWaveformViewController *)self selectedTimeRange];
  double v5 = v4;
  double v7 = v6;
  [(RCTimeController *)self->_activeTimeController currentTime];
  double v9 = v8;
  if (!RCTimeRangeContainsTime(v5, v7, v8))
  {
    double v9 = RCTimeRangeConstrainTime(v5, v7, v9);
    -[RCTimeController setTargetTime:](self->_activeTimeController, "setTargetTime:");
  }
  self->_nextPreviewStartTime = v9;
  activeTimeController = self->_activeTimeController;

  -[RCTimeController setAllowedTimeRange:](activeTimeController, "setAllowedTimeRange:", v5, v7);
}

- (void)timeController:(id)a3 didChangeState:(int64_t)a4
{
  if (!a4)
  {
    [a3 currentTime];
    self->_nextPreviewStartTime = v6;
  }

  [(RCAVWaveformViewController *)self _updateInterfaceForTimeControllerState:a4];
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didJumpTime:(BOOL)a5
{
  self->_didJumpTime = a5;
  -[RCAVWaveformViewController setCurrentTime:](self, "setCurrentTime:", a3, a4);
}

- (void)timeController:(id)a3 didChangeCurrentTime:(double)a4 didChangeDuration:(double)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_23A9C;
  v5[3] = &unk_6D7D8;
  v5[4] = self;
  *(double *)&v5[5] = a5;
  *(double *)&v5[6] = a4;
  [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v5];
}

- (void)_setWaveformDataSource:(id)a3 initialTime:(double)a4
{
  double v7 = (RCWaveformDataSource *)a3;
  p_waveformDataSource = &self->_waveformDataSource;
  if (self->_waveformDataSource != v7)
  {
    objc_storeStrong((id *)&self->_waveformDataSource, a3);
    if (*p_waveformDataSource) {
      [(RCWaveformDataSource *)*p_waveformDataSource beginLoading];
    }
    [(RCWaveformViewController *)self->_waveformViewController setDataSource:v7];
    [(RCWaveformViewController *)self->_waveformViewController setCurrentTime:a4];
    waveformViewController = self->_waveformViewController;
    [(RCWaveformDataSource *)v7 duration];
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_23C14;
    v11[3] = &unk_6D800;
    v11[4] = self;
    *(double *)&v11[5] = a4;
    [(RCAVWaveformViewController *)self _updateDisplayableTimesWithBlock:v11];
    self->_nextPreviewStartTime = a4;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioWaveformControllerDidChangeWaveformDataSource:self];
  }
}

- (void)_updateCurrentTimeForCapturedInputAtTime:(double)a3
{
  if (self->_currentTimeTracksCapturedEndPoint) {
    [(RCAVWaveformViewController *)self setCurrentTime:a3];
  }
}

- (void)_didUpdateDisplayableTime
{
  if (self->_batchUpdatingDisplayableTimesCount < 1)
  {
    [(RCAVWaveformViewController *)self currentTime];
    double v4 = v3;
    [(RCAVWaveformViewController *)self visibleTimeRange];
    if (v4 > RCTimeRangeGetMidTime(v5, v6)) {
      [(RCWaveformViewController *)self->_waveformViewController setCurrentTimeDisplayOptions:[(RCAVWaveformViewController *)self _currentTimeDisplayOptions]];
    }
    [(RCWaveformViewController *)self->_waveformViewController setCurrentTime:v4];
    waveformViewController = self->_waveformViewController;
    [(RCAVWaveformViewController *)self duration];
    -[RCWaveformViewController setDuration:](waveformViewController, "setDuration:");
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained audioWaveformControllerDidChangeAVTimes:self];

    if (self->_isOverview)
    {
      double v9 = self->_waveformViewController;
      [(RCWaveformViewController *)v9 updateVisibleTimeRangeToFullDuration];
    }
  }
  else
  {
    self->_needsUpdateDisplayableTime = 1;
  }
}

- (void)_updateDisplayableTimesWithBlock:(id)a3
{
  ++self->_batchUpdatingDisplayableTimesCount;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  int64_t v4 = self->_batchUpdatingDisplayableTimesCount - 1;
  self->_batchUpdatingDisplayableTimesCount = v4;
  if (!v4 && self->_needsUpdateDisplayableTime)
  {
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (void)_setSelectionOverlayEnabled:(BOOL)a3
{
  if (self->_showingSelectionOverlayEnabled != a3)
  {
    self->_showingSelectionOverlayEnabled = a3;
    [(RCAVWaveformViewController *)self _didUpdateDisplayableTime];
  }
}

- (unint64_t)_currentTimeDisplayOptions
{
  return [(RCAVWaveformViewController *)self _currentTimeDisplayOptionsIgnoringSelectionOverlayState:0];
}

- (unint64_t)_currentTimeDisplayOptionsIgnoringSelectionOverlayState:(BOOL)a3
{
  if (self->_selectionOverlayVisible && !a3) {
    return 2;
  }
  else {
    return self->_autocenterCurrentTimeIndicatorAlways;
  }
}

- (void)_updateInterfaceForTimeControllerState:(int64_t)a3
{
  BOOL v4 = a3 == 1;
  BOOL v5 = a3 == 2;
  BOOL v6 = (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
  double v7 = [(RCAVWaveformViewController *)self waveformViewController];
  [v7 setPlaying:v4];

  double v8 = [(RCAVWaveformViewController *)self waveformViewController];
  [v8 setCapturing:v5];

  BOOL selectionOverlayVisible = self->_selectionOverlayVisible;
  double v10 = [(RCAVWaveformViewController *)self waveformViewController];
  [v10 setSelectedTimeRangeEditingEnabled:selectionOverlayVisible];

  double v11 = [(RCAVWaveformViewController *)self waveformViewController];
  [v11 setScrubbingEnabled:v6];

  double v12 = [(RCAVWaveformViewController *)self waveformViewController];
  -[RCAVWaveformViewController _setSelectionOverlayEnabled:](self, "_setSelectionOverlayEnabled:", [v12 showPlayBarOnly]);

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained audioWaveformControllerDidChangeAVState:self];
}

- (void)_beginShowingSelectionOverlayAndEnableInsertMode:(BOOL)a3
{
  [(RCAVWaveformViewController *)self maximumSelectionDuration];
  if (v5 == 0.0) {
    [(RCAVWaveformViewController *)self duration];
  }
  if (v5 >= 0.0)
  {
    [(RCAVWaveformViewController *)self resetSelectedTimeRangeToFullDuration];
    double v6 = 0.0;
    if ([(RCAVWaveformViewController *)self isViewLoaded])
    {
      double v7 = [(RCAVWaveformViewController *)self view];
      double v8 = [v7 window];
      if (v8) {
        double v6 = 0.5;
      }
      else {
        double v6 = 0.0;
      }
    }
    double v9 = [(RCAVWaveformViewController *)self waveformViewController];
    self->_BOOL selectionOverlayVisible = 1;
    [(RCAVWaveformViewController *)self currentTime];
    self->_nextPreviewStartTime = v10;
    [v9 visibleTimeRange];
    self->_defaultVisibleDuration = RCTimeRangeDeltaWithUIPrecision(v11, v12);
    objc_msgSend(v9, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_2414C;
    v15[3] = &unk_6D828;
    id v16 = v9;
    BOOL v17 = a3;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_24190;
    v14[3] = &unk_6D850;
    v14[4] = self;
    id v13 = v9;
    +[UIView animateWithDuration:0x20000 delay:v15 options:v14 animations:v6 completion:0.0];
  }
}

- (void)_endShowingSelectionOverlayWithCompletionBlock:(id)a3
{
  id v4 = a3;
  double v5 = 0.0;
  if ([(RCAVWaveformViewController *)self isViewLoaded])
  {
    double v6 = [(RCAVWaveformViewController *)self view];
    double v7 = [v6 window];
    if (v7) {
      double v5 = 0.5;
    }
    else {
      double v5 = 0.0;
    }
  }
  double v8 = [(RCAVWaveformViewController *)self waveformViewController];
  [(RCAVWaveformViewController *)self nextPreviewStartTime];
  uint64_t v10 = v9;
  self->_BOOL selectionOverlayVisible = 0;
  objc_msgSend(v8, "setCurrentTimeDisplayOptions:", -[RCAVWaveformViewController _currentTimeDisplayOptions](self, "_currentTimeDisplayOptions"));
  [v8 setSelectionOverlayShouldUseInsertMode:0];
  [v8 setSelectedTimeRangeEditingEnabled:0];
  [v8 setScrubbingEnabled:1];
  double v11 = [(RCAVWaveformViewController *)self activeTimeController];
  [v11 currentDuration];
  objc_msgSend(v11, "setAllowedTimeRange:", RCTimeRangeMake(0.0, v12));
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_24404;
  v17[3] = &unk_6D7D8;
  id v18 = v8;
  uint64_t v19 = v10;
  double v20 = v5;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_24460;
  v15[3] = &unk_6D878;
  id v16 = v4;
  id v13 = v4;
  id v14 = v8;
  +[UIView animateWithDuration:0x20000 delay:v17 options:v15 animations:v5 completion:0.0];
}

- (id)_selectionOverlay
{
  double v2 = [(RCAVWaveformViewController *)self waveformViewController];
  double v3 = [v2 valueForKey:@"_selectionOverlay"];

  return v3;
}

- (RCWaveformDataSource)waveformDataSource
{
  return self->_waveformDataSource;
}

- (void)setWaveformDataSource:(id)a3
{
}

- (RCAVWaveformViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RCAVWaveformViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (RCWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (RCTimeController)activeTimeController
{
  return self->_activeTimeController;
}

- (double)nextPreviewStartTime
{
  return self->_nextPreviewStartTime;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)highlightTimeRange
{
  double beginTime = self->_highlightTimeRange.beginTime;
  double endTime = self->_highlightTimeRange.endTime;
  result.double var1 = endTime;
  result.double var0 = beginTime;
  return result;
}

- (double)currentTime
{
  return self->_currentTime;
}

- (BOOL)currentTimeTracksCapturedEndPoint
{
  return self->_currentTimeTracksCapturedEndPoint;
}

- (void)setCurrentTimeTracksCapturedEndPoint:(BOOL)a3
{
  self->_currentTimeTracksCapturedEndPoint = a3;
}

- (double)duration
{
  return self->_duration;
}

- (BOOL)autocenterCurrentTimeIndicatorAlways
{
  return self->_autocenterCurrentTimeIndicatorAlways;
}

- (BOOL)clipsTimeMarkersToDuration
{
  return self->_clipsTimeMarkersToDuration;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (BOOL)isSelectionOverlayVisible
{
  return self->_selectionOverlayVisible;
}

- (double)maximumSelectionDuration
{
  return self->_maximumSelectionDuration;
}

- (BOOL)isEditMode
{
  return self->_isEditMode;
}

- (BOOL)isOverview
{
  return self->_isOverview;
}

- (void)setIsOverview:(BOOL)a3
{
  self->_isOverview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_waveformDataSource, 0);
  objc_storeStrong((id *)&self->_rightForwardingView, 0);
  objc_storeStrong((id *)&self->_leftForwardingView, 0);

  objc_storeStrong((id *)&self->_activeTimeController, 0);
}

@end