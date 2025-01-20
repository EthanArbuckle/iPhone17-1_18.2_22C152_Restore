@interface MPMediaControlsViewController
- (BOOL)prefersStatusBarHidden;
- (MPMediaControls)mediaControls;
- (MPMediaControlsConfiguration)configuration;
- (MPMediaControlsViewController)init;
- (MPMediaControlsViewController)initWithConfiguration:(id)a3;
- (MPMediaControlsViewControllerDelegate)delegate;
- (double)transitionDuration:(id)a3;
- (id)didDismissHandler;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (void)_createMediaControlsIfNeeded;
- (void)_present;
- (void)animateTransition:(id)a3;
- (void)dismiss;
- (void)setDelegate:(id)a3;
- (void)setDidDismissHandler:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4;
- (void)startPrewarming;
- (void)stopPrewarming;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MPMediaControlsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_didDismissHandler, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setDelegate:(id)a3
{
}

- (MPMediaControlsViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MPMediaControlsViewControllerDelegate *)WeakRetained;
}

- (void)setDidDismissHandler:(id)a3
{
}

- (id)didDismissHandler
{
  return self->_didDismissHandler;
}

- (void)animateTransition:(id)a3
{
}

- (double)transitionDuration:(id)a3
{
  return 0.0;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  v8 = [[_MPMediaControlsPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (void)setOverrideRouteSharingPolicy:(unint64_t)a3 routingContextUID:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134349314;
    unint64_t v10 = a3;
    __int16 v11 = 2114;
    id v12 = v6;
    _os_log_impl(&dword_1952E8000, v7, OS_LOG_TYPE_DEFAULT, "Creating override MediaControls configuration with routeSharingPolicy=%{public}lu routingContextUID=%{public}@", (uint8_t *)&v9, 0x16u);
  }

  v8 = [[MPMediaControls alloc] initWithRouteSharingPolicy:a3 routingContextUID:v6];
  [(MPMediaControlsViewController *)self setMediaControls:v8];
}

- (void)dismiss
{
}

- (void)stopPrewarming
{
}

- (void)startPrewarming
{
}

- (void)_present
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = os_log_create("com.apple.amp.mediaplayer", "RemoteControl");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v6 = 138412290;
    id v7 = (id)objc_opt_class();
    id v4 = v7;
    _os_log_impl(&dword_1952E8000, v3, OS_LOG_TYPE_INFO, "Attempting to present media controls using a deprecated class: %@", (uint8_t *)&v6, 0xCu);
  }
  v5 = [(MPMediaControlsViewController *)self mediaControls];
  [v5 present];
}

- (void)_createMediaControlsIfNeeded
{
  if (!self->_mediaControls)
  {
    if (self->_configuration)
    {
      v3 = [MPMediaControls alloc];
      v5 = [(MPMediaControlsViewController *)self configuration];
      id v4 = -[MPMediaControls initWithConfiguration:](v3, "initWithConfiguration:");
      [(MPMediaControlsViewController *)self setMediaControls:v4];
    }
    else
    {
      v5 = objc_alloc_init(MPMediaControls);
      -[MPMediaControlsViewController setMediaControls:](self, "setMediaControls:");
    }
  }
}

- (void)setMediaControls:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_mediaControls, a3);
  configuration = self->_configuration;
  if (configuration)
  {
    uint64_t v7 = [(MPMediaControlsConfiguration *)configuration sortByIsVideoRoute];
    uint64_t v8 = [v5 configuration];
    [v8 setSortByIsVideoRoute:v7];
  }
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MPMediaControlsViewController_setMediaControls___block_invoke;
  v9[3] = &unk_1E57F6EF0;
  objc_copyWeak(&v10, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:v9];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __50__MPMediaControlsViewController_setMediaControls___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:0 completion:0];
  v1 = [WeakRetained didDismissHandler];

  if (v1)
  {
    v2 = [WeakRetained didDismissHandler];
    v2[2]();
  }
}

- (MPMediaControlsConfiguration)configuration
{
  [(MPMediaControlsViewController *)self _createMediaControlsIfNeeded];
  mediaControls = self->_mediaControls;

  return [(MPMediaControls *)mediaControls configuration];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MPMediaControlsViewController;
  [(MPMediaControlsViewController *)&v4 viewWillAppear:a3];
  [(MPMediaControlsViewController *)self _present];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)MPMediaControlsViewController;
  [(MPMediaControlsViewController *)&v3 viewDidLoad];
  [(MPMediaControlsViewController *)self _createMediaControlsIfNeeded];
}

- (MPMediaControlsViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPMediaControlsViewController;
  int v6 = [(MPMediaControlsViewController *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    [(MPMediaControlsViewController *)v7 setTransitioningDelegate:v7];
    [(MPMediaControlsViewController *)v7 setModalPresentationStyle:4];
  }

  return v7;
}

- (MPMediaControlsViewController)init
{
  return [(MPMediaControlsViewController *)self initWithConfiguration:0];
}

@end