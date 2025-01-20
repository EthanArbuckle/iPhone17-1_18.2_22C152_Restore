@interface AVMobileFullscreenController
- (AVMobileFullscreenController)initWithPlayerViewController:(id)a3;
- (AVMobileFullscreenControllerDelegate)delegate;
- (unint64_t)presentationState;
- (void)enterFullscreen:(id)a3;
- (void)exitFullscreen:(id)a3;
- (void)setDelegate:(id)a3;
- (void)updatePresentationStateTo:(unint64_t)a3;
@end

@implementation AVMobileFullscreenController

- (unint64_t)presentationState
{
  return self->_presentationState;
}

- (void)updatePresentationStateTo:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_presentationState != a3)
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t presentationState = self->_presentationState;
      int v10 = 136315650;
      v11 = "-[AVMobileFullscreenController updatePresentationStateTo:]";
      __int16 v12 = 2048;
      unint64_t v13 = presentationState;
      __int16 v14 = 2048;
      unint64_t v15 = a3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s current presentation state: %ld -> new presentation state: %ld", (uint8_t *)&v10, 0x20u);
    }

    self->_unint64_t presentationState = a3;
    v7 = [(AVMobileFullscreenController *)self delegate];
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      v9 = [(AVMobileFullscreenController *)self delegate];
      [v9 fullscreenControllerDidChangePresentationState:self];
    }
  }
}

- (AVMobileFullscreenControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVMobileFullscreenControllerDelegate *)WeakRetained;
}

- (AVMobileFullscreenController)initWithPlayerViewController:(id)a3
{
  if (self) {
    objc_storeWeak((id *)&self->_playerViewController, a3);
  }
  return self;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)enterFullscreen:(id)a3
{
  p_playerViewController = &self->_playerViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_playerViewController);
  [WeakRetained enterFullScreen:v4];
}

- (void)exitFullscreen:(id)a3
{
  p_playerViewController = &self->_playerViewController;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_playerViewController);
  [WeakRetained exitFullscreen:v4];
}

@end