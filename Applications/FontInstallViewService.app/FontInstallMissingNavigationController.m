@interface FontInstallMissingNavigationController
- (FontInstallMissingController)remoteController;
- (void)setRemoteController:(id)a3;
@end

@implementation FontInstallMissingNavigationController

- (FontInstallMissingController)remoteController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_remoteController);

  return (FontInstallMissingController *)WeakRetained;
}

- (void)setRemoteController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end