@interface NTKAlaskanDiverStyleController
- (BOOL)_cancelPreCountUp;
- (BOOL)_cancelPreCountUpWithCompletionBlock:(id)a3 animated:(BOOL)a4;
- (BOOL)animationInProgress;
- (BOOL)crownInputHandlerCanChangeProgress:(id)a3;
- (BOOL)crownInputHandlerDidPressCrown:(id)a3;
- (BOOL)crownInputHandlerDidPressSideButton:(id)a3;
- (BOOL)trackSeconds;
- (BOOL)wantsStatusBarHidden;
- (CLKClockTimerToken)clockTimerToken;
- (NTKAlaskanDiverStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4 storage:(id)a5;
- (NTKAlaskanDiverStyleView)diverView;
- (NTKAlaskanPersistenceStorage)storage;
- (NTKCrownInputHandler)crownInputHandler;
- (NTKTroutFaceView)faceView;
- (double)alphaValueForAngle:(double)a3;
- (double)previousProgress;
- (void)_startClockUpdates;
- (void)_stopClockUpdates;
- (void)alaskanDiverStyleView:(id)a3 didRotateDialToMinuteOffset:(int64_t)a4;
- (void)alaskanDiverStyleViewDidCancelPreCountUpWithCompletionBlock:(id)a3 animated:(BOOL)a4;
- (void)alaskanDiverStyleViewDidStartCountUpWithDate:(id)a3;
- (void)alaskanDiverStyleViewDidStartPreCountUp;
- (void)alaskanDiverStyleViewWantsToShowAlert:(id)a3;
- (void)crownInputHandler:(id)a3 didChangeProgress:(double)a4;
- (void)crownInputHandlerDidBecomeIdle:(id)a3;
- (void)dealloc;
- (void)handleExitingEditModeAnimated:(BOOL)a3;
- (void)rotateToMinuteHand;
- (void)setAnimationInProgress:(BOOL)a3;
- (void)setClockTimerToken:(id)a3;
- (void)setCrownInputHandler:(id)a3;
- (void)setDatamode:(int64_t)a3;
- (void)setDiverView:(id)a3;
- (void)setFaceView:(id)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPreviousProgress:(double)a3;
- (void)setStorage:(id)a3;
- (void)setTimeOffset:(double)a3;
- (void)setTrackSeconds:(BOOL)a3;
- (void)updateCrownInputHandlerProgress:(double)a3;
- (void)updateTimeViewHandsVisibility;
@end

@implementation NTKAlaskanDiverStyleController

- (NTKAlaskanDiverStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4 storage:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)NTKAlaskanDiverStyleController;
  v11 = [(NTKAlaskanDiverStyleController *)&v20 init];
  v12 = v11;
  if (v11)
  {
    [(NTKAlaskanDiverStyleController *)v11 setStorage:v10];
    id v13 = objc_storeWeak((id *)&v12->_diverView, v8);
    [v8 setDelegate:v12];

    v14 = [(NTKAlaskanDiverStyleController *)v12 storage];
    v15 = [v14 diverCountUpStartDate];

    if (v15)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&v12->_diverView);
      [WeakRetained setCurrentMode:2];
    }
    id v17 = objc_loadWeakRetained((id *)&v12->_diverView);
    [v17 setStartDate:v15];

    objc_storeStrong((id *)&v12->_crownInputHandler, a4);
    [(NTKCrownInputHandler *)v12->_crownInputHandler setDelegate:v12];
    id v18 = objc_loadWeakRetained((id *)&v12->_diverView);
    -[NTKAlaskanDiverStyleController updateCrownInputHandlerProgress:](v12, "updateCrownInputHandlerProgress:", (double)(unint64_t)[v18 angleOffset] / 360.0);

    [(NTKCrownInputHandler *)v12->_crownInputHandler setOffsetPerRevolution:NTKCrownInputHandlerDefaultOffsetPerRevolution * 0.5];
    [(NTKCrownInputHandler *)v12->_crownInputHandler setUseWideIdleCheck:0];
  }
  return v12;
}

- (void)dealloc
{
  [(NTKAlaskanDiverStyleController *)self _stopClockUpdates];
  v3.receiver = self;
  v3.super_class = (Class)NTKAlaskanDiverStyleController;
  [(NTKAlaskanDiverStyleController *)&v3 dealloc];
}

- (BOOL)wantsStatusBarHidden
{
  return 0;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
  id v6 = [(NTKAlaskanDiverStyleController *)self storage];
  v4 = [v6 diverCountUpStartDate];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
  [WeakRetained setStartDate:v4];
}

- (void)setFaceView:(id)a3
{
  objc_storeWeak((id *)&self->_faceView, a3);

  [(NTKAlaskanDiverStyleController *)self updateTimeViewHandsVisibility];
}

- (void)setDatamode:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return;
  }
  if (((1 << a3) & 0x35) != 0)
  {
    v4 = [(NTKAlaskanPersistenceStorage *)self->_storage diverCountUpStartDate];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
    [WeakRetained setStartDate:v4];

    p_diverView = &self->_diverView;
LABEL_4:
    id v7 = objc_loadWeakRetained((id *)p_diverView);
    [v7 setUserInteractionEnabled:0];

    [(NTKAlaskanDiverStyleController *)self _stopClockUpdates];
    [(NTKAlaskanDiverStyleController *)self _cancelPreCountUp];
    return;
  }
  if (a3 != 1)
  {
    id v15 = objc_loadWeakRetained((id *)&self->_diverView);
    [v15 setStartDate:0];

    p_diverView = &self->_diverView;
    goto LABEL_4;
  }
  id v16 = [(NTKAlaskanPersistenceStorage *)self->_storage diverCountUpStartDate];
  if (v16)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_diverView);
    [v8 setCurrentMode:2];

    id v9 = [(NTKAlaskanDiverStyleController *)self faceView];
    [v9 updateTimeViewColor];

    id v10 = [(NTKAlaskanDiverStyleController *)self faceView];
    v11 = [v10 timeView];
    v12 = [v11 secondHandView];
    [v12 setAlpha:0.0];
  }
  id v13 = objc_loadWeakRetained((id *)&self->_diverView);
  [v13 setStartDate:v16];

  id v14 = objc_loadWeakRetained((id *)&self->_diverView);
  [v14 setUserInteractionEnabled:1];

  [(NTKAlaskanDiverStyleController *)self _startClockUpdates];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  id v5 = a3;
  id v6 = [(NTKAlaskanDiverStyleController *)self diverView];
  [v6 setOverrideDate:v5];
}

- (void)setTimeOffset:(double)a3
{
  id v4 = [(NTKAlaskanDiverStyleController *)self diverView];
  [v4 setTimeOffset:a3];
}

- (void)crownInputHandler:(id)a3 didChangeProgress:(double)a4
{
  if (!self->_animationInProgress)
  {
    p_diverView = &self->_diverView;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
    id v8 = (char *)[WeakRetained currentMode];

    if (v8 == (unsigned char *)&dword_0 + 1)
    {
      self->_previousProgress = a4;
      id v9 = objc_loadWeakRetained((id *)p_diverView);
      [v9 setAngleOffset:(unint64_t)(a4 * 360.0)];

      id v10 = objc_loadWeakRetained((id *)p_diverView);
      [v10 setSyncMarkerWithMinuteHand:1];
    }
  }
}

- (BOOL)crownInputHandlerCanChangeProgress:(id)a3
{
  id v4 = [(NTKAlaskanDiverStyleController *)self faceView];
  BOOL v5 = [v4 dataMode] == (char *)&dword_0 + 1 && !self->_animationInProgress;

  return v5;
}

- (void)crownInputHandlerDidBecomeIdle:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
  id v6 = (char *)[WeakRetained currentMode];

  if (v6 == (unsigned char *)&dword_0 + 1)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_diverView);
    [v7 setSyncMarkerWithMinuteHand:0];

    [v4 progress];
    double v9 = v8 * 360.0;
    id v10 = objc_loadWeakRetained((id *)&self->_diverView);
    [v10 targetAngleOffsetForOffset:v9];
    double v12 = v11;

    id v13 = objc_loadWeakRetained((id *)&self->_diverView);
    [v13 angleOffset];
    char v14 = CLKFloatEqualsFloat();

    if ((v14 & 1) == 0)
    {
      objc_initWeak(&location, self);
      id v15 = objc_loadWeakRetained((id *)&self->_diverView);
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_9E68;
      v17[3] = &unk_38A70;
      objc_copyWeak(&v18, &location);
      [v15 setAngleOffset:1 animated:v17 progressCallback:0 completionBlock:v12];

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [v4 progress];
    self->_previousProgress = v16;
  }
}

- (BOOL)crownInputHandlerDidPressCrown:(id)a3
{
  return [(NTKAlaskanDiverStyleController *)self _cancelPreCountUp];
}

- (BOOL)crownInputHandlerDidPressSideButton:(id)a3
{
  return 0;
}

- (void)_startClockUpdates
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
  if ([WeakRetained currentMode])
  {
    clockTimerToken = self->_clockTimerToken;

    if (!clockTimerToken)
    {
      objc_initWeak(&location, self);
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_A050;
      v9[3] = &unk_38A98;
      objc_copyWeak(&v10, &location);
      id v4 = objc_retainBlock(v9);
      if (self->_trackSeconds)
      {
        BOOL v5 = +[CLKClockTimer sharedInstance];
        [v5 startUpdatesWithUpdateFrequency:1 withHandler:v4 identificationLog:&stru_38AF8];
      }
      else
      {
        BOOL v5 = +[CLKClockTimer sharedInstance];
        [v5 startUpdatesWithUpdateFrequency:0 withHandler:v4 identificationLog:&stru_38AD8];
      }
      id v6 = (CLKClockTimerToken *)objc_claimAutoreleasedReturnValue();
      id v7 = self->_clockTimerToken;
      self->_clockTimerToken = v6;

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

- (void)_stopClockUpdates
{
  if (self->_clockTimerToken)
  {
    objc_super v3 = +[CLKClockTimer sharedInstance];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)updateTimeViewHandsVisibility
{
  objc_super v3 = [(NTKAlaskanDiverStyleController *)self faceView];
  id v4 = [v3 currentDisplayDate];
  +[NTKAnalogHandsView minuteHandAngleForDate:v4];
  -[NTKAlaskanDiverStyleController alphaValueForAngle:](self, "alphaValueForAngle:");
  double v6 = v5;
  id v7 = [(NTKAlaskanDiverStyleController *)self faceView];
  double v8 = [v7 timeView];
  double v9 = [v8 minuteHandView];
  [v9 setAlpha:v6];

  id v16 = [(NTKAlaskanDiverStyleController *)self faceView];
  id v10 = [v16 currentDisplayDate];
  +[NTKAnalogHandsView hourHandAngleForDate:v10];
  -[NTKAlaskanDiverStyleController alphaValueForAngle:](self, "alphaValueForAngle:");
  double v12 = v11;
  id v13 = [(NTKAlaskanDiverStyleController *)self faceView];
  char v14 = [v13 timeView];
  id v15 = [v14 hourHandView];
  [v15 setAlpha:v12];
}

- (double)alphaValueForAngle:(double)a3
{
  id v4 = [(NTKAlaskanDiverStyleController *)self diverView];
  if (![v4 currentMode])
  {

    return 1.0;
  }
  if (a3 >= 0.0 && a3 <= 55.0)
  {

    return 0.5;
  }

  if (a3 < 305.0) {
    return 1.0;
  }
  double result = 0.5;
  if (a3 > 360.0) {
    return 1.0;
  }
  return result;
}

- (BOOL)_cancelPreCountUp
{
  return [(NTKAlaskanDiverStyleController *)self _cancelPreCountUpWithCompletionBlock:0 animated:1];
}

- (BOOL)_cancelPreCountUpWithCompletionBlock:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
  double v8 = (char *)[WeakRetained currentMode];

  if (v8 == (unsigned char *)&dword_0 + 1)
  {
    double v9 = [(NTKAlaskanDiverStyleController *)self faceView];
    [v9 disableCrownEventReception];

    id v10 = objc_loadWeakRetained((id *)&self->_diverView);
    [v10 setCurrentMode:0];

    double v11 = [(NTKAlaskanDiverStyleController *)self diverView];
    [v11 angleOffsetForDate:0];
    double v13 = v12;

    objc_initWeak(&location, self);
    id v14 = objc_loadWeakRetained((id *)&self->_diverView);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_A570;
    v22[3] = &unk_38A70;
    objc_copyWeak(&v23, &location);
    id v16 = _NSConcreteStackBlock;
    uint64_t v17 = 3221225472;
    id v18 = sub_A5C8;
    v19 = &unk_38B20;
    objc_copyWeak(&v21, &location);
    id v20 = v6;
    [v14 setAngleOffset:v4 animated:v22 progressCallback:&v16 completionBlock:v13 animationDuration:0.2];

    -[NTKAlaskanDiverStyleController handleExitingEditModeAnimated:](self, "handleExitingEditModeAnimated:", v4, v16, v17, v18, v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);
  }

  return v8 == (unsigned char *)&dword_0 + 1;
}

- (void)alaskanDiverStyleViewDidStartPreCountUp
{
  objc_super v3 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v3 enableCrownEventReception];

  [(NTKCrownInputHandler *)self->_crownInputHandler generateMajorDetents];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);
  [WeakRetained setSyncMarkerWithMinuteHand:0];

  [(NTKAlaskanDiverStyleController *)self _stopClockUpdates];
  self->_trackSeconds = 1;
  [(NTKAlaskanDiverStyleController *)self _startClockUpdates];
  [(NTKAlaskanDiverStyleController *)self rotateToMinuteHand];
  double v5 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v5 enumerateComplicationDisplayWrappersWithBlock:&stru_38B40];

  id v6 = [(NTKAlaskanDiverStyleController *)self faceView];
  id v7 = [v6 delegate];
  [v7 faceViewWantsStatusBarHidden:1 animated:1];

  objc_initWeak(&location, self);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_A8E4;
  v17[3] = &unk_38B68;
  objc_copyWeak(&v18, &location);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_A9DC;
  v15[3] = &unk_38B90;
  objc_copyWeak(&v16, &location);
  +[UIView animateWithDuration:v17 animations:v15 completion:0.3];
  double v8 = [(NTKAlaskanDiverStyleController *)self faceView];
  double v9 = [(NTKAlaskanDiverStyleController *)self diverView];
  id v10 = [v9 palette];
  double v11 = [v8 colorForDateComplicationPalette:v10];
  double v12 = [(NTKAlaskanDiverStyleController *)self faceView];
  double v13 = [v12 dateComplicationView];
  [v13 setForegroundColor:v11];

  id v14 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v14 updateTimeViewColor];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

- (void)alaskanDiverStyleViewDidCancelPreCountUpWithCompletionBlock:(id)a3 animated:(BOOL)a4
{
}

- (void)rotateToMinuteHand
{
  self->_animationInProgress = 1;
  p_diverView = &self->_diverView;
  id v4 = objc_loadWeakRetained((id *)&self->_diverView);
  double v5 = [v4 currentDate];
  [v4 angleOffsetForDate:v5];
  id v7 = v6;

  objc_initWeak(&location, self);
  id WeakRetained = objc_loadWeakRetained((id *)p_diverView);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_ABDC;
  v11[3] = &unk_38A70;
  objc_copyWeak(&v12, &location);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_AC38;
  v9[3] = &unk_38BB8;
  objc_copyWeak(v10, &location);
  v10[1] = v7;
  [WeakRetained setAngleOffset:1 animated:v11 progressCallback:v9 completionBlock:*(double *)&v7 animationDuration:0.3];

  objc_destroyWeak(v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (void)alaskanDiverStyleViewDidStartCountUpWithDate:(id)a3
{
  crownInputHandler = self->_crownInputHandler;
  id v5 = a3;
  [(NTKCrownInputHandler *)crownInputHandler generateMajorDetents];
  id v6 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v6 enableCrownEventReception];

  id v7 = [(NTKAlaskanDiverStyleController *)self storage];
  [v7 setDiverCountUpStartDate:v5];

  if (!v5)
  {
    [(NTKAlaskanDiverStyleController *)self _stopClockUpdates];
    [(NTKAlaskanDiverStyleController *)self updateCrownInputHandlerProgress:0.0];
  }

  [(NTKAlaskanDiverStyleController *)self handleExitingEditModeAnimated:1];
}

- (void)alaskanDiverStyleViewWantsToShowAlert:(id)a3
{
  id v4 = a3;
  id v6 = [(NTKAlaskanDiverStyleController *)self faceView];
  id v5 = [v6 delegate];
  [v5 faceViewWantsToPresentViewController:v4];
}

- (void)handleExitingEditModeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  [(NTKAlaskanDiverStyleController *)self _stopClockUpdates];
  self->_trackSeconds = 0;
  [(NTKAlaskanDiverStyleController *)self _startClockUpdates];
  id v5 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v5 enumerateComplicationDisplayWrappersWithBlock:&stru_38BD8];

  id v6 = [(NTKAlaskanDiverStyleController *)self faceView];
  id v7 = [v6 delegate];
  [v7 faceViewWantsStatusBarHidden:0 animated:1];

  double v8 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v8 disableCrownEventReception];

  objc_initWeak(location, self);
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_B0C0;
  v28[3] = &unk_38B68;
  v19 = &v29;
  objc_copyWeak(&v29, location);
  double v9 = objc_retainBlock(v28);
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_B1BC;
  v26[3] = &unk_38B68;
  objc_copyWeak(&v27, location);
  id v10 = objc_retainBlock(v26);
  double v11 = (void (**)(void))v10;
  if (v3)
  {
    id v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    id v23 = sub_B21C;
    v24 = &unk_38C00;
    v25 = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v9, &v21, 0.3, &v29);
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
    v11[2](v11);
  }
  id v12 = [(NTKAlaskanDiverStyleController *)self faceView];
  double v13 = [(NTKAlaskanDiverStyleController *)self diverView];
  id v14 = [v13 palette];
  id v15 = [v12 colorForDateComplicationPalette:v14];
  id v16 = [(NTKAlaskanDiverStyleController *)self faceView];
  uint64_t v17 = [v16 dateComplicationView];
  [v17 setForegroundColor:v15];

  id v18 = [(NTKAlaskanDiverStyleController *)self faceView];
  [v18 updateTimeViewColor];

  objc_destroyWeak(&v27);
  objc_destroyWeak(v20);
  objc_destroyWeak(location);
}

- (void)alaskanDiverStyleView:(id)a3 didRotateDialToMinuteOffset:(int64_t)a4
{
  id v5 = [(NTKAlaskanDiverStyleController *)self crownInputHandler];
  id v6 = v5;
  if (a4) {
    [v5 generateMinorDetents];
  }
  else {
    [v5 generateMajorDetents];
  }
}

- (void)updateCrownInputHandlerProgress:(double)a3
{
  id v5 = [(NTKAlaskanDiverStyleController *)self crownInputHandler];
  [v5 setProgress:a3];

  self->_previousProgress = a3;
}

- (NTKAlaskanPersistenceStorage)storage
{
  return self->_storage;
}

- (NTKTroutFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKTroutFaceView *)WeakRetained;
}

- (NTKAlaskanDiverStyleView)diverView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_diverView);

  return (NTKAlaskanDiverStyleView *)WeakRetained;
}

- (void)setDiverView:(id)a3
{
}

- (NTKCrownInputHandler)crownInputHandler
{
  return self->_crownInputHandler;
}

- (void)setCrownInputHandler:(id)a3
{
}

- (CLKClockTimerToken)clockTimerToken
{
  return self->_clockTimerToken;
}

- (void)setClockTimerToken:(id)a3
{
}

- (BOOL)trackSeconds
{
  return self->_trackSeconds;
}

- (void)setTrackSeconds:(BOOL)a3
{
  self->_trackSeconds = a3;
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (BOOL)animationInProgress
{
  return self->_animationInProgress;
}

- (void)setAnimationInProgress:(BOOL)a3
{
  self->_animationInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_crownInputHandler, 0);
  objc_destroyWeak((id *)&self->_diverView);
  objc_destroyWeak((id *)&self->_faceView);

  objc_storeStrong((id *)&self->_storage, 0);
}

@end