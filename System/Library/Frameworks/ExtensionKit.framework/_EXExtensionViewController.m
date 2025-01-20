@interface _EXExtensionViewController
- (BOOL)shouldAcceptXPCConnection:(id)a3;
- (UIViewController)contentViewController;
- (_EXViewControllerSceneConfiguration)sceneConfiguration;
- (id)makeContentViewController;
- (void)loadView;
- (void)setSceneConfiguration:(id)a3;
@end

@implementation _EXExtensionViewController

- (id)makeContentViewController
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [(_EXViewControllerSceneConfiguration *)self->_sceneConfiguration storyboard];
  v4 = v3;
  if (!v3
    || ([v3 instantiateInitialViewController], (id v5 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v6 = [(_EXViewControllerSceneConfiguration *)self->_sceneConfiguration viewControllerClass];
    if (v6) {
      id v5 = objc_alloc_init(v6);
    }
    else {
      id v5 = 0;
    }
  }

  return v5;
}

- (UIViewController)contentViewController
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  contentViewController = self->_contentViewController;
  if (!contentViewController)
  {
    v4 = [(_EXExtensionViewController *)self makeContentViewController];
    id v5 = self->_contentViewController;
    self->_contentViewController = v4;

    contentViewController = self->_contentViewController;
  }

  return contentViewController;
}

- (void)loadView
{
  v27[4] = *MEMORY[0x263EF8340];
  v3 = objc_opt_new();
  [(_EXExtensionViewController *)self setView:v3];

  v4 = [MEMORY[0x263F825C8] clearColor];
  id v5 = [(_EXExtensionViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(_EXExtensionViewController *)self contentViewController];
  v7 = v6;
  if (v6)
  {
    v8 = [v6 view];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    v9 = [(_EXExtensionViewController *)self view];
    [v9 addSubview:v8];

    v10 = [(_EXExtensionViewController *)self view];
    v20 = (void *)MEMORY[0x263F08938];
    v25 = [v8 leftAnchor];
    v24 = [v10 leftAnchor];
    v23 = [v25 constraintEqualToAnchor:v24];
    v27[0] = v23;
    v22 = [v8 topAnchor];
    v21 = [v10 topAnchor];
    v19 = [v22 constraintEqualToAnchor:v21];
    v27[1] = v19;
    v18 = [v8 rightAnchor];
    v11 = [v10 rightAnchor];
    v12 = [v18 constraintEqualToAnchor:v11];
    v27[2] = v12;
    v13 = [v8 bottomAnchor];
    v14 = [v10 bottomAnchor];
    [v13 constraintEqualToAnchor:v14];
    v16 = v15 = v7;
    v27[3] = v16;
    v17 = [MEMORY[0x263EFF8C0] arrayWithObjects:v27 count:4];
    [v20 activateConstraints:v17];

    v7 = v15;
    [(_EXExtensionViewController *)self addChildViewController:v15];
  }
  else
  {
    v8 = _EXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2156DD000, v8, OS_LOG_TYPE_DEFAULT, "Failed to load extension's content view controller", buf, 2u);
    }
  }
}

- (BOOL)shouldAcceptXPCConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(_EXExtensionViewController *)self contentViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(_EXExtensionViewController *)self contentViewController];
    char v8 = [v7 shouldAcceptXPCConnection:v4];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (_EXViewControllerSceneConfiguration)sceneConfiguration
{
  return (_EXViewControllerSceneConfiguration *)objc_getProperty(self, a2, 984, 1);
}

- (void)setSceneConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneConfiguration, 0);

  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end