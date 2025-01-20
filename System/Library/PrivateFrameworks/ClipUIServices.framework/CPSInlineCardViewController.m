@interface CPSInlineCardViewController
- (CPSInlineCardViewController)initWithURL:(id)a3;
- (CPSInlineCardViewControllerDelegate)delegate;
- (NSURL)url;
- (void)_setupInlineCardViewWithProxCardKit;
- (void)didTapBackgroundView:(id)a3;
- (void)launchContentViewController:(id)a3 didTapCloseButton:(BOOL)a4;
- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CPSInlineCardViewController

- (CPSInlineCardViewController)initWithURL:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CPSInlineCardViewController;
  v5 = [(CPSInlineCardViewController *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = v5;
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPSInlineCardViewController;
  [(CPSInlineCardViewController *)&v8 viewWillAppear:a3];
  if (!self->_launchContentViewController)
  {
    id v4 = [[CPSLaunchContentViewController alloc] initWithURL:self->_url displayMode:1];
    launchContentViewController = self->_launchContentViewController;
    self->_launchContentViewController = v4;

    [(CPSLaunchContentViewController *)self->_launchContentViewController setDelegate:self];
    uint64_t v6 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.6];
    v7 = [(CPSInlineCardViewController *)self view];
    [v7 setBackgroundColor:v6];

    [(CPSInlineCardViewController *)self _setupInlineCardViewWithProxCardKit];
  }
}

- (void)_setupInlineCardViewWithProxCardKit
{
  v64[8] = *MEMORY[0x1E4F143B8];
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2050000000;
  v3 = (void *)getPRXFlowConfigurationClass_softClass;
  uint64_t v63 = getPRXFlowConfigurationClass_softClass;
  if (!getPRXFlowConfigurationClass_softClass)
  {
    uint64_t v55 = MEMORY[0x1E4F143A8];
    uint64_t v56 = 3221225472;
    v57 = __getPRXFlowConfigurationClass_block_invoke;
    v58 = &unk_1E6AE9048;
    v59 = &v60;
    __getPRXFlowConfigurationClass_block_invoke((uint64_t)&v55);
    v3 = (void *)v61[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v60, 8);
  v52 = [v4 defaultConfiguration];
  [v52 setSupportsDarkMode:1];
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x2050000000;
  v5 = (void *)getPRXCardContainerViewControllerClass_softClass;
  uint64_t v63 = getPRXCardContainerViewControllerClass_softClass;
  if (!getPRXCardContainerViewControllerClass_softClass)
  {
    uint64_t v55 = MEMORY[0x1E4F143A8];
    uint64_t v56 = 3221225472;
    v57 = __getPRXCardContainerViewControllerClass_block_invoke;
    v58 = &unk_1E6AE9048;
    v59 = &v60;
    __getPRXCardContainerViewControllerClass_block_invoke((uint64_t)&v55);
    v5 = (void *)v61[3];
  }
  uint64_t v6 = v5;
  _Block_object_dispose(&v60, 8);
  v7 = (PRXCardContainerViewController *)[[v6 alloc] initWithConfiguration:v52];
  proxController = self->_proxController;
  self->_proxController = v7;

  v9 = [(PRXCardContainerViewController *)self->_proxController mainNavigationController];
  [v9 pushViewController:self->_launchContentViewController animated:0];

  objc_super v10 = [(PRXCardContainerViewController *)self->_proxController view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSInlineCardViewController *)self addChildViewController:self->_proxController];
  v11 = [(CPSInlineCardViewController *)self view];
  [v11 addSubview:v10];

  [(PRXCardContainerViewController *)self->_proxController didMoveToParentViewController:self];
  id v53 = v10;
  v51 = [v53 backgroundView];
  [v51 _setContinuousCornerRadius:13.0];
  v12 = [CPSInlineCardContainerView alloc];
  v54 = -[CPSInlineCardContainerView initWithFrame:](v12, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CPSInlineCardContainerView *)v54 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CPSInlineCardContainerView *)v54 setDelegate:self];
  v13 = [(CPSLaunchContentViewController *)self->_launchContentViewController view];
  [(CPSInlineCardContainerView *)v54 setContentView:v13];

  v14 = [(CPSInlineCardViewController *)self view];
  [v14 addSubview:v54];

  v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v15 removeObserver:v53 name:*MEMORY[0x1E4F43B88] object:0];

  v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v16 removeObserver:v53 name:*MEMORY[0x1E4F43B80] object:0];

  v27 = (void *)MEMORY[0x1E4F28DC8];
  v49 = [v53 topAnchor];
  v50 = [(CPSInlineCardViewController *)self view];
  v48 = [v50 topAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v64[0] = v47;
  v45 = [v53 bottomAnchor];
  v46 = [(CPSInlineCardViewController *)self view];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v64[1] = v43;
  v41 = [v53 leadingAnchor];
  v42 = [(CPSInlineCardViewController *)self view];
  v40 = [v42 leadingAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v64[2] = v39;
  v38 = [v53 trailingAnchor];

  v37 = [(CPSInlineCardViewController *)self view];
  v36 = [v37 trailingAnchor];
  v35 = [v38 constraintEqualToAnchor:v36];
  v64[3] = v35;
  v33 = [(CPSInlineCardContainerView *)v54 centerXAnchor];
  v34 = [(CPSInlineCardViewController *)self view];
  v32 = [v34 centerXAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v64[4] = v31;
  v29 = [(CPSInlineCardContainerView *)v54 centerYAnchor];
  v30 = [(CPSInlineCardViewController *)self view];
  v28 = [v30 centerYAnchor];
  v17 = [v29 constraintEqualToAnchor:v28];
  v64[5] = v17;
  v18 = [(CPSInlineCardContainerView *)v54 widthAnchor];
  v19 = [(CPSInlineCardViewController *)self view];
  v20 = [v19 widthAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  v64[6] = v21;
  v22 = [(CPSInlineCardContainerView *)v54 heightAnchor];
  v23 = [(CPSInlineCardViewController *)self view];
  v24 = [v23 heightAnchor];
  v25 = [v22 constraintEqualToAnchor:v24];
  v64[7] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v64 count:8];
  [v27 activateConstraints:v26];
}

- (void)launchContentViewControllerDidDisappear:(id)a3 didOpenClip:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  if (!v4) {
    [(CPSLaunchContentViewController *)self->_launchContentViewController cancelSession];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    [v8 cardViewControllerDidDisappear:self clipDidOpen:v4 persistUserSettings:0];
  }
}

- (void)launchContentViewController:(id)a3 didTapCloseButton:(BOOL)a4
{
  [(CPSLaunchContentViewController *)self->_launchContentViewController cancelSession];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 cardViewControllerDidDisappear:self clipDidOpen:0 persistUserSettings:1];
  }
}

- (void)didTapBackgroundView:(id)a3
{
  [(CPSLaunchContentViewController *)self->_launchContentViewController cancelSession];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 cardViewControllerDidDisappear:self clipDidOpen:0 persistUserSettings:0];
  }
}

- (NSURL)url
{
  return self->_url;
}

- (CPSInlineCardViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSInlineCardViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_proxController, 0);

  objc_storeStrong((id *)&self->_launchContentViewController, 0);
}

@end