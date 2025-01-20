@interface AVPictureInPictureViewController
- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView;
- (AVPictureInPictureViewController)contentViewController;
- (AVPictureInPictureViewController)init;
- (AVPictureInPictureViewController)initWithCoder:(id)a3;
- (AVPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (AVPictureInPictureViewController)initWithPictureInPicturePlayerLayerView:(id)a3;
- (AVPictureInPictureViewControllerDelegate)delegate;
- (AVPlayerController)playerController;
- (BOOL)shouldShowAlternateActionButtonImage;
- (void)dealloc;
- (void)didAnimatePictureInPictureStop;
- (void)loadView;
- (void)setContentViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setShouldShowAlternateActionButtonImage:(BOOL)a3;
- (void)willAnimatePictureInPictureStart;
@end

@implementation AVPictureInPictureViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerController, 0);

  objc_storeStrong((id *)&self->_pictureInPicturePlayerLayerView, 0);
}

- (AVPictureInPictureViewController)contentViewController
{
  return self->_contentViewController;
}

- (void)setDelegate:(id)a3
{
}

- (AVPictureInPictureViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVPictureInPictureViewControllerDelegate *)WeakRetained;
}

- (void)setShouldShowAlternateActionButtonImage:(BOOL)a3
{
  self->_shouldShowAlternateActionButtonImage = a3;
}

- (BOOL)shouldShowAlternateActionButtonImage
{
  return self->_shouldShowAlternateActionButtonImage;
}

- (void)setPlayerController:(id)a3
{
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setContentViewController:(id)a3
{
  v13 = (AVPictureInPictureViewController *)a3;
  v5 = self->_contentViewController;
  if (v5 != v13)
  {
    objc_storeStrong((id *)&self->_contentViewController, a3);
    if (v13)
    {
      [(AVPictureInPictureViewController *)self addChildViewController:v13];
      v6 = [(AVPictureInPictureViewController *)v13 view];
      [v6 setTranslatesAutoresizingMaskIntoConstraints:1];

      v7 = [(AVPictureInPictureViewController *)v13 view];
      [v7 setAutoresizingMask:18];

      v8 = [(AVPictureInPictureViewController *)v13 view];
      v9 = [(AVPictureInPictureViewController *)self view];
      [v9 bounds];
      objc_msgSend(v8, "setFrame:");

      v10 = [(AVPictureInPictureViewController *)self view];
      v11 = [(AVPictureInPictureViewController *)v13 view];
      [v10 addSubview:v11];

      [(AVPictureInPictureViewController *)v13 didMoveToParentViewController:self];
    }
    if (v5)
    {
      [(AVPictureInPictureViewController *)v5 willMoveToParentViewController:0];
      v12 = [(AVPictureInPictureViewController *)v5 view];
      [v12 removeFromSuperview];

      [(AVPictureInPictureViewController *)v5 removeFromParentViewController];
    }
  }
}

- (AVPictureInPicturePlayerLayerView)pictureInPicturePlayerLayerView
{
  v3 = [(AVPictureInPictureViewController *)self contentViewController];
  pictureInPicturePlayerLayerView = [v3 pictureInPicturePlayerLayerView];
  v5 = pictureInPicturePlayerLayerView;
  if (!pictureInPicturePlayerLayerView) {
    pictureInPicturePlayerLayerView = self->_pictureInPicturePlayerLayerView;
  }
  v6 = pictureInPicturePlayerLayerView;

  return v6;
}

- (void)loadView
{
}

- (AVPictureInPictureViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v5 = *MEMORY[0x1E4F1C3B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 raise:v5, @"%@ does not support unarchiving from a nib.", v7 format];

  return [(AVPictureInPictureViewController *)self initWithPictureInPicturePlayerLayerView:0];
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v6 = "-[AVPictureInPictureViewController dealloc]";
    __int16 v7 = 1024;
    int v8 = 49;
    __int16 v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPictureViewController;
  [(AVPictureInPictureViewController *)&v4 dealloc];
}

- (AVPictureInPictureViewController)initWithPictureInPicturePlayerLayerView:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_super v4 = (AVPictureInPicturePlayerLayerView *)a3;
  uint64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v11 = "-[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:]";
    __int16 v12 = 1024;
    int v13 = 35;
    __int16 v14 = 2048;
    v15 = self;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d %p", buf, 0x1Cu);
  }

  v9.receiver = self;
  v9.super_class = (Class)AVPictureInPictureViewController;
  v6 = [(AVPictureInPictureViewController *)&v9 initWithNibName:0 bundle:0];
  if (v6)
  {
    __int16 v7 = v4;
    if (!v4) {
      __int16 v7 = objc_alloc_init(AVPictureInPicturePlayerLayerView);
    }
    objc_storeStrong((id *)&v6->_pictureInPicturePlayerLayerView, v7);
    if (!v4) {
  }
    }
  return v6;
}

- (AVPictureInPictureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return -[AVPictureInPictureViewController initWithPictureInPicturePlayerLayerView:](self, "initWithPictureInPicturePlayerLayerView:", 0, a4);
}

- (AVPictureInPictureViewController)init
{
  return [(AVPictureInPictureViewController *)self initWithPictureInPicturePlayerLayerView:0];
}

- (void)didAnimatePictureInPictureStop
{
  id v3 = [(AVPictureInPictureViewController *)self delegate];
  [v3 pictureInPictureViewControllerViewWillDisappear:self];
}

- (void)willAnimatePictureInPictureStart
{
  id v3 = [(AVPictureInPictureViewController *)self delegate];
  [v3 pictureInPictureViewControllerViewDidAppear:self];
}

@end