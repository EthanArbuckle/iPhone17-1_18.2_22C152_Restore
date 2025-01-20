@interface EXPlaceholderViewController
- (EXPlaceholderViewController)init;
- (EXPlaceholderViewController)initWithCoder:(id)a3;
- (NSTimer)timer;
- (UIActivityIndicatorView)activityView;
- (UIImageView)completeIcon;
- (unint64_t)state;
- (void)hostViewController:(id)a3 didBeginHosting:(id)a4;
- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5;
- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4;
- (void)loadView;
- (void)setActivityView:(id)a3;
- (void)setCompleteIcon:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTimer:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation EXPlaceholderViewController

- (EXPlaceholderViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)EXPlaceholderViewController;
  v2 = [(EXPlaceholderViewController *)&v5 initWithNibName:0 bundle:0];
  v3 = v2;
  if (v2) {
    [(EXPlaceholderViewController *)v2 setState:0];
  }
  return v3;
}

- (EXPlaceholderViewController)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)EXPlaceholderViewController;
  v3 = [(EXPlaceholderViewController *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(EXPlaceholderViewController *)v3 setState:0];
  }
  return v4;
}

- (void)loadView
{
  v32[2] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  v4 = [MEMORY[0x263F04DB8] sharedInstance];
  int v5 = [v4 defaultPlaceholderViewControllerShowsState];

  if (v5)
  {
    objc_super v6 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v6 setHidesWhenStopped:1];
    [(EXPlaceholderViewController *)self setActivityView:v6];
    [v3 addSubview:v6];
    v29 = (void *)MEMORY[0x263F08938];
    v7 = [v6 centerXAnchor];
    v8 = [v3 centerXAnchor];
    v9 = [v7 constraintEqualToAnchor:v8];
    v32[0] = v9;
    v10 = [v6 centerYAnchor];
    v11 = [v3 centerYAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v32[1] = v12;
    v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v32 count:2];
    [v29 activateConstraints:v13];

    v30 = [MEMORY[0x263F827E8] systemImageNamed:@"puzzlepiece"];
    v14 = (UIImageView *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v30];
    completeIcon = self->_completeIcon;
    self->_completeIcon = v14;

    [(UIImageView *)self->_completeIcon setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_completeIcon setHidden:1];
    [v3 addSubview:self->_completeIcon];
    v24 = (void *)MEMORY[0x263F08938];
    v28 = [(UIImageView *)self->_completeIcon heightAnchor];
    v27 = [v28 constraintEqualToConstant:64.0];
    v31[0] = v27;
    v26 = [(UIImageView *)self->_completeIcon widthAnchor];
    v25 = [(UIImageView *)self->_completeIcon heightAnchor];
    v16 = [v26 constraintEqualToAnchor:v25];
    v31[1] = v16;
    v17 = [(UIImageView *)self->_completeIcon centerXAnchor];
    v18 = [v3 centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v31[2] = v19;
    v20 = [(UIImageView *)self->_completeIcon centerYAnchor];
    v21 = [v3 centerYAnchor];
    v22 = [v20 constraintEqualToAnchor:v21];
    v31[3] = v22;
    v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
    [v24 activateConstraints:v23];
  }
  [(EXPlaceholderViewController *)self setView:v3];
}

- (void)setState:(unint64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  objc_initWeak(&location, self);
  int v5 = _EXDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[EXPlaceholderViewController setState:].cold.5(a3, v5, v6, v7, v8, v9, v10, v11);
  }

  v12 = [MEMORY[0x263F04DB8] sharedInstance];
  char v13 = [v12 defaultPlaceholderViewControllerShowsState];

  if (v13)
  {
    if (a3 == 1)
    {
      v14 = (void *)MEMORY[0x263EFFA20];
      v15 = [MEMORY[0x263F04DB8] sharedInstance];
      [v15 defaultPlaceholderDelayBeforeShowingLoadingIndicator];
      double v17 = v16;
      uint64_t v24 = MEMORY[0x263EF8330];
      uint64_t v25 = 3221225472;
      v26 = __40__EXPlaceholderViewController_setState___block_invoke;
      v27 = &unk_264258738;
      objc_copyWeak(&v28, &location);
      v18 = [v14 scheduledTimerWithTimeInterval:0 repeats:&v24 block:v17];
      -[EXPlaceholderViewController setTimer:](self, "setTimer:", v18, v24, v25, v26, v27);

      objc_destroyWeak(&v28);
    }
    else
    {
      v19 = [(EXPlaceholderViewController *)self timer];
      [v19 invalidate];

      if (a3 == 2)
      {
        v20 = _EXDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[EXPlaceholderViewController setState:].cold.4();
        }

        [(UIActivityIndicatorView *)self->_activityView startAnimating];
LABEL_19:
        if (self->_state == 4)
        {
          v23 = _EXDefaultLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[EXPlaceholderViewController setState:]();
          }
        }
        [(UIImageView *)self->_completeIcon setHidden:1];
        goto LABEL_24;
      }
    }
    if (self->_state == 2)
    {
      v21 = _EXDefaultLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[EXPlaceholderViewController setState:]();
      }
    }
    [(UIActivityIndicatorView *)self->_activityView stopAnimating];
    if (a3 - 3 <= 1)
    {
      v22 = _EXDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[EXPlaceholderViewController setState:]();
      }

      [(UIImageView *)self->_completeIcon setHidden:0];
      goto LABEL_24;
    }
    goto LABEL_19;
  }
LABEL_24:
  self->_state = a3;
  objc_destroyWeak(&location);
}

void __40__EXPlaceholderViewController_setState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:2];
}

- (void)viewWillAppear:(BOOL)a3
{
}

- (void)viewDidDisappear:(BOOL)a3
{
}

- (void)hostViewController:(id)a3 didPrepareToHost:(id)a4
{
  v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EXPlaceholderViewController hostViewController:didPrepareToHost:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)hostViewController:(id)a3 didBeginHosting:(id)a4
{
  v4 = _EXDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[EXPlaceholderViewController hostViewController:didBeginHosting:](v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)hostViewController:(id)a3 didEndHosting:(id)a4 error:(id)a5
{
  id v6 = a5;
  uint64_t v7 = _EXDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[EXPlaceholderViewController hostViewController:didEndHosting:error:]((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);
  }

  if (v6) {
    uint64_t v14 = 3;
  }
  else {
    uint64_t v14 = 4;
  }
  [(EXPlaceholderViewController *)self setState:v14];
}

- (UIActivityIndicatorView)activityView
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 976, 1);
}

- (void)setActivityView:(id)a3
{
}

- (NSTimer)timer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_timer);

  return (NSTimer *)WeakRetained;
}

- (void)setTimer:(id)a3
{
}

- (UIImageView)completeIcon
{
  return (UIImageView *)objc_getProperty(self, a2, 992, 1);
}

- (void)setCompleteIcon:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completeIcon, 0);
  objc_destroyWeak((id *)&self->_timer);

  objc_storeStrong((id *)&self->_activityView, 0);
}

- (void)setState:.cold.1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "showing error UI", v2, v3, v4, v5, v6);
}

- (void)setState:.cold.2()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "hideing error UI", v2, v3, v4, v5, v6);
}

- (void)setState:.cold.3()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "stopping loading progress animation", v2, v3, v4, v5, v6);
}

- (void)setState:.cold.4()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_1_1(&dword_2156DD000, v0, v1, "starting loading progress animation", v2, v3, v4, v5, v6);
}

- (void)setState:(uint64_t)a3 .cold.5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hostViewController:(uint64_t)a3 didPrepareToHost:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hostViewController:(uint64_t)a3 didBeginHosting:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)hostViewController:(uint64_t)a3 didEndHosting:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end