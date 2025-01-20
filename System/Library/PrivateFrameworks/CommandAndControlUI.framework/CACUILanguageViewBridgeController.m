@interface CACUILanguageViewBridgeController
- (CACLanguageViewBridgeDelegate)delegate;
- (CACUILanguageViewBridgeController)init;
- (NSDictionary)installationStatus;
- (UIViewController)trueViewController;
- (_TtC19CommandAndControlUI21CACLanguageViewBridge)viewBridge;
- (id)createLanguageViewController;
- (id)createLanguageViewControllerWithLocales:(id)a3;
- (void)cancelDownloadWithIdentifier:(id)a3;
- (void)downloadLanguageWithIdentifier:(id)a3;
- (void)selectedLanguageWithIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSelectedLanguageIdentifier:(id)a3;
- (void)setTrueViewController:(id)a3;
- (void)setViewBridge:(id)a3;
- (void)updateDownloadStatus:(id)a3;
- (void)updateInstallationStatus:(id)a3;
@end

@implementation CACUILanguageViewBridgeController

- (CACUILanguageViewBridgeController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CACUILanguageViewBridgeController;
  v2 = [(CACUILanguageViewBridgeController *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC19CommandAndControlUI21CACLanguageViewBridge);
    viewBridge = v2->_viewBridge;
    v2->_viewBridge = v3;

    [(CACLanguageViewBridge *)v2->_viewBridge setDelegate:v2];
  }
  return v2;
}

- (id)createLanguageViewController
{
  return [(CACUILanguageViewBridgeController *)self createLanguageViewControllerWithLocales:0];
}

- (id)createLanguageViewControllerWithLocales:(id)a3
{
  if (!self->_trueViewController)
  {
    v4 = [(CACLanguageViewBridge *)self->_viewBridge makeLanguageUIWithLocales:a3];
    trueViewController = self->_trueViewController;
    self->_trueViewController = v4;
  }

  return [(CACUILanguageViewBridgeController *)self trueViewController];
}

- (void)updateInstallationStatus:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__CACUILanguageViewBridgeController_updateInstallationStatus___block_invoke;
  v6[3] = &unk_264DC66D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __62__CACUILanguageViewBridgeController_updateInstallationStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewBridge];
  [v2 updateInstallationStatusWith:*(void *)(a1 + 40)];
}

- (void)updateDownloadStatus:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __58__CACUILanguageViewBridgeController_updateDownloadStatus___block_invoke;
  v6[3] = &unk_264DC66D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __58__CACUILanguageViewBridgeController_updateDownloadStatus___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewBridge];
  [v2 updateDownloadStatusWith:*(void *)(a1 + 40)];
}

- (void)setSelectedLanguageIdentifier:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__CACUILanguageViewBridgeController_setSelectedLanguageIdentifier___block_invoke;
  v6[3] = &unk_264DC66D8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __67__CACUILanguageViewBridgeController_setSelectedLanguageIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) viewBridge];
  [v2 setSelectedWithLanguageIdentifier:*(void *)(a1 + 40)];
}

- (void)downloadLanguageWithIdentifier:(id)a3
{
}

- (void)cancelDownloadWithIdentifier:(id)a3
{
}

- (void)selectedLanguageWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CACUILanguageViewBridgeController *)self delegate];
  [v5 selectedLanguageWithIdentifier:v4];
}

- (CACLanguageViewBridgeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CACLanguageViewBridgeDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSDictionary)installationStatus
{
  return self->_installationStatus;
}

- (_TtC19CommandAndControlUI21CACLanguageViewBridge)viewBridge
{
  return self->_viewBridge;
}

- (void)setViewBridge:(id)a3
{
}

- (UIViewController)trueViewController
{
  return self->_trueViewController;
}

- (void)setTrueViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trueViewController, 0);
  objc_storeStrong((id *)&self->_viewBridge, 0);
  objc_storeStrong((id *)&self->_installationStatus, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end