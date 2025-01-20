@interface NTKAlaskanChronographStyleController
- (BOOL)isEditing;
- (BOOL)isForwardDirection;
- (BOOL)shouldAnimateTimescaleTransition;
- (BOOL)stopwatchIsRunning;
- (BOOL)stopwatchIsStopped;
- (BOOL)tritiumAnimationInProgress;
- (BOOL)wantsStatusBarHidden;
- (NTKAlaskanChronographStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4;
- (NTKAlaskanChronographView)view;
- (NTKAnalogFaceView)faceView;
- (NTKCrownInputHandler)crownInputHandler;
- (double)previousProgress;
- (void)_handleFaceViewWantsStatusBarHidden:(BOOL)a3;
- (void)_handleStopwatchChangedNotification;
- (void)alaskanChronographViewDidEnterChronometerMode:(id)a3 completionBlock:(id)a4;
- (void)alaskanChronographViewDidExitChronometerMode:(id)a3 completionBlock:(id)a4 animated:(BOOL)a5;
- (void)applyVisibilityWithFraction:(double)a3;
- (void)cleanupAfterEditing;
- (void)dealloc;
- (void)prepareForEditing;
- (void)setCrownInputHandler:(id)a3;
- (void)setDatamode:(int64_t)a3;
- (void)setFaceView:(id)a3;
- (void)setIsEditing:(BOOL)a3;
- (void)setIsForwardDirection:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPreviousProgress:(double)a3;
- (void)setTritiumAnimationInProgress:(BOOL)a3;
- (void)setView:(id)a3;
- (void)unregisterForStopwatchNotifications;
@end

@implementation NTKAlaskanChronographStyleController

- (NTKAlaskanChronographStyleController)initWithContentView:(id)a3 crownInputHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)NTKAlaskanChronographStyleController;
  v8 = [(NTKAlaskanChronographStyleController *)&v12 init];
  v9 = v8;
  if (v8)
  {
    id v10 = objc_storeWeak((id *)&v8->_view, v6);
    [v6 setDelegate:v9];

    objc_storeStrong((id *)&v9->_crownInputHandler, a4);
    [(NTKCrownInputHandler *)v9->_crownInputHandler setOffsetPerRevolution:2.4];
    [(NTKCrownInputHandler *)v9->_crownInputHandler setUseWideIdleCheck:0];
  }

  return v9;
}

- (void)dealloc
{
  v3 = [(NTKAlaskanChronographStyleController *)self faceView];
  v4 = [v3 timeView];
  v5 = [v4 secondHandView];
  [v5 setAlpha:1.0];

  v6.receiver = self;
  v6.super_class = (Class)NTKAlaskanChronographStyleController;
  [(NTKAlaskanChronographStyleController *)&v6 dealloc];
}

- (void)setFaceView:(id)a3
{
  v3 = self;
  p_faceView = &self->_faceView;
  id v5 = a3;
  objc_storeWeak((id *)p_faceView, v5);
  objc_super v6 = [v5 currentDisplayDate];

  v3 = (NTKAlaskanChronographStyleController *)((char *)v3 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)&v3->super.isa);
  [WeakRetained setDate:v6];

  id v8 = objc_loadWeakRetained((id *)p_faceView);
  v9 = [v8 timeView];
  id v10 = [v9 secondHandView];
  [v10 setAlpha:0.0];

  id v13 = objc_loadWeakRetained((id *)&v3->super.isa);
  id v11 = objc_loadWeakRetained((id *)p_faceView);
  objc_super v12 = [v11 timeView];
  [v13 setChronometerHandsParentView:v12];
}

- (void)applyVisibilityWithFraction:(double)a3
{
  id v5 = [(NTKAlaskanChronographStyleController *)self view];
  objc_super v6 = [v5 primaryHandView];
  [v6 setAlpha:a3];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);
  id v7 = [WeakRetained timeView];
  id v8 = [v7 secondHandView];
  [v8 setAlpha:1.0 - a3];
}

- (void)setDatamode:(int64_t)a3
{
  switch(a3)
  {
    case 0:
    case 4:
      [(NTKAlaskanChronographStyleController *)self unregisterForStopwatchNotifications];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
      [WeakRetained setStopwatchModel:0];
      goto LABEL_3;
    case 1:
    case 5:
      [(NTKAlaskanChronographStyleController *)self registerForStopwatchNotifications];
      uint64_t v4 = [(NTKAlaskanChronographStyleController *)self tritiumAnimationInProgress] ^ 1;
      id v5 = objc_loadWeakRetained((id *)&self->_view);
      [v5 setUserInteractionEnabled:v4];

      [(NTKAlaskanChronographStyleController *)self updateView];
      break;
    case 2:
      [(NTKAlaskanChronographStyleController *)self unregisterForStopwatchNotifications];
      break;
    case 3:
      [(NTKAlaskanChronographStyleController *)self unregisterForStopwatchNotifications];
      id v6 = objc_loadWeakRetained((id *)&self->_view);
      [v6 setStopwatchModel:0];

      id v7 = objc_loadWeakRetained((id *)&self->_view);
      [v7 setUserInteractionEnabled:0];

      if (!self->_isEditing)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
        [WeakRetained setIsChronoMode:0];
LABEL_3:
      }
      break;
    default:
      return;
  }
}

- (void)prepareForEditing
{
  self->_isEditing = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained setIsEditing:1];
}

- (void)cleanupAfterEditing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained setIsEditing:0];

  self->_isEditing = 0;
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  p_view = &self->_view;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_view);
  id v7 = [(NTKAlaskanChronographStyleController *)self faceView];
  objc_msgSend(WeakRetained, "setOverrideDate:animatingAnalogHands:", v6, objc_msgSend(v7, "dataMode") == (char *)&dword_0 + 1);
}

- (void)unregisterForStopwatchNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];
}

- (BOOL)wantsStatusBarHidden
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  unsigned __int8 v3 = [WeakRetained isChronoMode];

  return v3;
}

- (void)setTritiumAnimationInProgress:(BOOL)a3
{
  self->_tritiumAnimationInProgress = a3;
  BOOL v3 = !a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained setUserInteractionEnabled:v3];
}

- (void)alaskanChronographViewDidEnterChronometerMode:(id)a3 completionBlock:(id)a4
{
  id v7 = (uint64_t (**)(id))a4;
  id v5 = [(NTKAlaskanChronographStyleController *)self faceView];
  [v5 enumerateComplicationDisplayWrappersWithBlock:&stru_38A28];

  if (![(NTKAlaskanChronographStyleController *)self isEditing]) {
    [(NTKAlaskanChronographStyleController *)self _handleFaceViewWantsStatusBarHidden:1];
  }
  uint64_t v6 = [(NTKAlaskanChronographStyleController *)self shouldAnimateTimescaleTransition];
  if (v7 && (v6 & 1) == 0) {
    uint64_t v6 = v7[2](v7);
  }

  _objc_release_x1(v6);
}

- (void)_handleFaceViewWantsStatusBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(NTKAlaskanChronographStyleController *)self faceView];
  uint64_t v4 = [v5 delegate];
  [v4 faceViewWantsStatusBarHidden:v3 animated:0];
}

- (BOOL)shouldAnimateTimescaleTransition
{
  return !self->_isEditing;
}

- (void)alaskanChronographViewDidExitChronometerMode:(id)a3 completionBlock:(id)a4 animated:(BOOL)a5
{
  uint64_t v6 = [(NTKAlaskanChronographStyleController *)self faceView];
  [v6 enumerateComplicationDisplayWrappersWithBlock:&stru_38A48];

  if (![(NTKAlaskanChronographStyleController *)self isEditing])
  {
    [(NTKAlaskanChronographStyleController *)self _handleFaceViewWantsStatusBarHidden:0];
  }
}

- (void)_handleStopwatchChangedNotification
{
}

- (NTKAnalogFaceView)faceView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_faceView);

  return (NTKAnalogFaceView *)WeakRetained;
}

- (BOOL)tritiumAnimationInProgress
{
  return self->_tritiumAnimationInProgress;
}

- (BOOL)stopwatchIsRunning
{
  return self->_stopwatchIsRunning;
}

- (BOOL)stopwatchIsStopped
{
  return self->_stopwatchIsStopped;
}

- (NTKAlaskanChronographView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (NTKAlaskanChronographView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (NTKCrownInputHandler)crownInputHandler
{
  return self->_crownInputHandler;
}

- (void)setCrownInputHandler:(id)a3
{
}

- (double)previousProgress
{
  return self->_previousProgress;
}

- (void)setPreviousProgress:(double)a3
{
  self->_previousProgress = a3;
}

- (BOOL)isForwardDirection
{
  return self->_isForwardDirection;
}

- (void)setIsForwardDirection:(BOOL)a3
{
  self->_isForwardDirection = a3;
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void)setIsEditing:(BOOL)a3
{
  self->_isEditing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crownInputHandler, 0);
  objc_destroyWeak((id *)&self->_view);

  objc_destroyWeak((id *)&self->_faceView);
}

@end