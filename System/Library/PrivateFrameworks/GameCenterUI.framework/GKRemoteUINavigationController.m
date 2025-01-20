@interface GKRemoteUINavigationController
- (GKRemoteUIController)remoteUIController;
- (GKRemoteUINavigationController)initWithRemoteUIController:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)loadView;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation GKRemoteUINavigationController

- (GKRemoteUINavigationController)initWithRemoteUIController:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GKRemoteUINavigationController;
  v6 = [(GKRemoteUINavigationController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_remoteUIController, a3);
    [(GKRemoteUIController *)v7->_remoteUIController presentInParentNavigationController:v7 animated:0];
    v8 = v7;
  }

  return v7;
}

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)GKRemoteUINavigationController;
  [(GKRemoteUINavigationController *)&v6 loadView];
  v3 = [MEMORY[0x1E4F639B0] sharedPalette];
  v4 = [v3 windowBackgroundColor];
  id v5 = [(GKRemoteUINavigationController *)self view];
  [v5 setBackgroundColor:v4];
}

- (unint64_t)supportedInterfaceOrientations
{
  v2 = (unsigned char *)MEMORY[0x1E4F63830];
  if (*MEMORY[0x1E4F63830]) {
    return 30;
  }
  v4 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 1 && (!*v2 || *MEMORY[0x1E4F63A38] != 0)) {
    return 30;
  }
  v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v8) {
    return 2;
  }
  v9 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v9 bounds];
  double v11 = v10;
  double v13 = v12;

  BOOL v14 = v11 < 414.0 || v13 < 736.0;
  if (v14 && (v13 >= 414.0 ? (BOOL v15 = v11 < 736.0) : (BOOL v15 = 1), v15)) {
    return 2;
  }
  else {
    return 30;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKRemoteUINavigationController;
  [(GKRemoteUINavigationController *)&v5 viewDidAppear:a3];
  v4 = [(GKRemoteUINavigationController *)self navigationBar];
  [(GKRemoteUINavigationController *)self _gkConfigureFocusGuidesForNavigationBar:v4];
}

- (GKRemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void).cxx_destruct
{
}

@end