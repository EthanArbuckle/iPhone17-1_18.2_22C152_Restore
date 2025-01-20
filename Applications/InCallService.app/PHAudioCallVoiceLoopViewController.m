@interface PHAudioCallVoiceLoopViewController
- (BOOL)_canShowWhileLocked;
- (PHAudioCallVoiceLoopView)voiceLoopView;
- (PHAudioCallVoiceLoopViewControllerDelegate)delegate;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setVoiceLoopView:(id)a3;
- (void)stopVoiceLoopButtonPressed;
@end

@implementation PHAudioCallVoiceLoopViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  if (!self->_voiceLoopView)
  {
    v3 = objc_alloc_init(PHAudioCallVoiceLoopView);
    voiceLoopView = self->_voiceLoopView;
    self->_voiceLoopView = v3;

    [(PHAudioCallVoiceLoopView *)self->_voiceLoopView setDelegate:self];
    v5 = self->_voiceLoopView;
    [(PHAudioCallVoiceLoopViewController *)self setView:v5];
  }
}

- (void)stopVoiceLoopButtonPressed
{
  v3 = sub_1000D5130();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHAudioCallVoiceLoopViewController,stop voice loop button pressed", v9, 2u);
  }

  uint64_t v4 = [(PHAudioCallVoiceLoopViewController *)self delegate];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [(PHAudioCallVoiceLoopViewController *)self delegate];
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      v8 = [(PHAudioCallVoiceLoopViewController *)self delegate];
      [v8 audioCallVoiceLoopViewControllerRequestedButtonPresentation];
    }
  }
}

- (PHAudioCallVoiceLoopViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHAudioCallVoiceLoopViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PHAudioCallVoiceLoopView)voiceLoopView
{
  return (PHAudioCallVoiceLoopView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setVoiceLoopView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceLoopView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end