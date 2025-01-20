@interface MPVolumeSettingsController
- (MPVolumeSettingsController)initWithAudioCategory:(id)a3;
- (UIWindow)hostingWindow;
- (UIWindow)previousWindow;
- (void)_flip;
- (void)_keyWindowDidChange:(id)a3;
- (void)dealloc;
- (void)dismissAlertController;
- (void)presentAlertControllerInWindow:(id)a3;
- (void)setHostingWindow:(id)a3;
- (void)setPreviousWindow:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation MPVolumeSettingsController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_previousWindow);
  objc_destroyWeak((id *)&self->_hostingWindow);
  objc_storeStrong((id *)&self->_alertController, 0);

  objc_storeStrong((id *)&self->_audioCategory, 0);
}

- (void)setPreviousWindow:(id)a3
{
}

- (UIWindow)previousWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setHostingWindow:(id)a3
{
}

- (UIWindow)hostingWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingWindow);

  return (UIWindow *)WeakRetained;
}

- (void)_flip
{
  v7 = [[MPAVRoutingViewController alloc] initWithStyle:2];
  v3 = [(MPAVRoutingViewController *)v7 view];
  v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  v5 = [(MPAVRoutingViewController *)v7 _tableView];
  v6 = [MEMORY[0x1E4FB1618] clearColor];
  [v5 setBackgroundColor:v6];

  [(UIAlertController *)self->_alertController setContentViewController:v7];
}

- (void)_keyWindowDidChange:(id)a3
{
  id obj = [a3 object];
  p_previousWindow = &self->_previousWindow;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousWindow);
  if (WeakRetained == obj)
  {
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)&self->_hostingWindow);
    if (v6 == obj)
    {
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        objc_storeWeak((id *)p_previousWindow, obj);
      }
    }
  }
}

- (void)dismissAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingWindow);
  id v3 = objc_loadWeakRetained((id *)&self->_previousWindow);
  [WeakRetained resignKeyWindow];
  [v3 makeKeyAndVisible];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MPVolumeSettingsController;
  -[MPVolumeSettingsController viewDidAppear:](&v16, sel_viewDidAppear_);
  v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:0 message:0 preferredStyle:1];
  alertController = self->_alertController;
  self->_alertController = v5;

  v7 = objc_alloc_init(MPVolumeViewController);
  v8 = [(MPVolumeViewController *)v7 volumeView];
  v9 = [v8 _routeButton];
  [v9 removeTarget:v8 action:0 forControlEvents:64];

  v10 = [v8 _routeButton];
  [v10 addTarget:self action:sel__flip forControlEvents:64];

  [(UIAlertController *)self->_alertController setContentViewController:v7];
  v11 = self->_alertController;
  v12 = (void *)MEMORY[0x1E4FB1410];
  v13 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MediaPlayer"];
  v14 = [v13 localizedStringForKey:@"DONE" value:&stru_1EE680640 table:@"MediaPlayer"];
  v15 = [v12 actionWithTitle:v14 style:0 handler:&__block_literal_global_7776];
  [(UIAlertController *)v11 addAction:v15];

  [(MPVolumeSettingsController *)self presentViewController:self->_alertController animated:v3 completion:0];
}

- (void)presentAlertControllerInWindow:(id)a3
{
  p_hostingWindow = &self->_hostingWindow;
  id v5 = a3;
  objc_storeWeak((id *)p_hostingWindow, v5);
  [v5 setRootViewController:self];
  [v5 makeKeyAndVisible];
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MPVolumeSettingsController;
  [(MPVolumeSettingsController *)&v4 dealloc];
}

- (MPVolumeSettingsController)initWithAudioCategory:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPVolumeSettingsController;
  id v6 = [(MPVolumeSettingsController *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_audioCategory, a3);
    v8 = [MEMORY[0x1E4FB1F48] _applicationKeyWindow];
    objc_storeWeak((id *)&v7->_previousWindow, v8);

    v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v7 selector:sel__keyWindowDidChange_ name:*MEMORY[0x1E4FB30E8] object:0];
  }
  return v7;
}

@end