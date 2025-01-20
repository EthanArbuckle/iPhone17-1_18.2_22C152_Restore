@interface SFBrowserRemoteViewController
+ (BOOL)shouldPropagateAppearanceCustomizations;
+ (id)exportedInterface;
+ (id)requestViewControllerWithConnectionHandler:(id)a3;
+ (id)serviceViewControllerInterface;
- (BOOL)isOnScreenForVolumeDisplay;
- (NSString)volumeAudioCategory;
- (SFBrowserRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SFBrowserRemoteViewControllerDelegate)delegate;
- (UIWindowScene)windowSceneForVolumeDisplay;
- (void)_determineVisibilityIfNeeded;
- (void)_sf_sceneDidEnterBackground:(id)a3;
- (void)_sf_sceneWillEnterForeground:(id)a3;
- (void)destroyScene;
- (void)didChangeFullScreen:(BOOL)a3;
- (void)didDecideCookieSharingForURL:(id)a3 shouldCancel:(BOOL)a4 withError:(id)a5;
- (void)didDecideShouldShowLinkPreviews:(BOOL)a3;
- (void)didFinishInitialLoad:(BOOL)a3;
- (void)didLoadWebView;
- (void)didMoveToParentViewController:(id)a3;
- (void)didResolveRedirectionWithURL:(id)a3 appLink:(id)a4;
- (void)executeCustomActivityProxyID:(id)a3;
- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4;
- (void)initialLoadDidRedirectToURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRemoteSwipeGestureEnabled:(BOOL)a3;
- (void)suspendApplication;
- (void)viewDidLayoutSubviews;
- (void)viewServiceDidTerminateWithError:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)willDismissServiceViewController;
- (void)willMoveToParentViewController:(id)a3;
- (void)willOpenCurrentPageInBrowser;
- (void)willOpenURLInHostApplication:(id)a3;
@end

@implementation SFBrowserRemoteViewController

+ (id)requestViewControllerWithConnectionHandler:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() requestViewController:@"SFBrowserServiceViewController" fromServiceWithBundleIdentifier:@"com.apple.SafariViewService" connectionHandler:v3];

  return v4;
}

+ (BOOL)shouldPropagateAppearanceCustomizations
{
  return 0;
}

+ (id)serviceViewControllerInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC3D740];
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_requestPrewarmingWithTokens_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1EFC4F428];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFBrowserRemoteViewController;
  [(_UIRemoteViewController *)&v4 viewWillAppear:a3];
  self->_shouldDetermineVisibilityOnNextLayout = !self->_hasBeenDisplayedAtLeastOnce;
  self->_hasBeenDisplayedAtLeastOnce = 1;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)SFBrowserRemoteViewController;
  [(SFBrowserRemoteViewController *)&v3 viewDidLayoutSubviews];
  if (self->_shouldDetermineVisibilityOnNextLayout) {
    [(SFBrowserRemoteViewController *)self _determineVisibilityIfNeeded];
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SFBrowserRemoteViewController;
  -[SFBrowserRemoteViewController willMoveToParentViewController:](&v6, sel_willMoveToParentViewController_);
  if (a3)
  {
    v5 = [MEMORY[0x1E4F31A90] sharedInstance];
    [v5 addVolumeDisplay:self];
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v5 = [MEMORY[0x1E4F31A90] sharedInstance];
    [v5 removeVolumeDisplay:self];
  }
  v6.receiver = self;
  v6.super_class = (Class)SFBrowserRemoteViewController;
  [(_UIRemoteViewController *)&v6 didMoveToParentViewController:v4];
}

- (void)didLoadWebView
{
  self->_didLoadWebView = 1;
  [(SFBrowserRemoteViewController *)self _determineVisibilityIfNeeded];
}

- (void)_determineVisibilityIfNeeded
{
  if (self->_didLoadWebView && self->_hasBeenDisplayedAtLeastOnce)
  {
    self->_shouldDetermineVisibilityOnNextLayout = 0;
    char v5 = 0;
    if (SFViewControllerViewIsVisible(self, &v5))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained remoteViewControllerDidLoadWebView:self];

      if (!v5) {
        return;
      }
      id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
      [v4 didDetectUserInteractionFromHostApp];
    }
    else
    {
      id v4 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
      [v4 didDetectRemoteViewControllerViewIsHidden];
    }
  }
}

- (void)willDismissServiceViewController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "SFBrowserRemoteViewControllerDelegate is nil", v1, 2u);
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self viewServiceDidTerminateWithError:v5];
}

- (void)setRemoteSwipeGestureEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteViewController:self setSwipeGestureEnabled:v3];
}

- (void)didFinishInitialLoad:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained remoteViewController:self didFinishInitialLoad:v3];
}

- (void)fetchActivityViewControllerInfoForURL:(id)a3 title:(id)a4
{
  p_delegate = &self->_delegate;
  id v7 = a4;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self fetchActivityViewControllerInfoForURL:v8 title:v7];
}

- (void)executeCustomActivityProxyID:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self executeCustomActivityProxyID:v5];
}

- (void)willOpenURLInHostApplication:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self hostApplicationOpenURL:v5];
}

- (void)didDecideCookieSharingForURL:(id)a3 shouldCancel:(BOOL)a4 withError:(id)a5
{
  BOOL v6 = a4;
  id v10 = a3;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewController:self didDecideCookieSharingForURL:v10 shouldCancel:v6 withError:v8];
  }
}

- (void)initialLoadDidRedirectToURL:(id)a3
{
  p_delegate = &self->_delegate;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained remoteViewController:self initialLoadDidRedirectToURL:v5];
}

- (void)didChangeFullScreen:(BOOL)a3
{
  self->_isInFullScreen = a3;
  id v3 = [MEMORY[0x1E4F31A90] sharedInstance];
  [v3 setNeedsUpdate];
}

- (void)didResolveRedirectionWithURL:(id)a3 appLink:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewController:self didResolveRedirectionWithURL:v8 appLink:v6];
  }
}

- (void)didDecideShouldShowLinkPreviews:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewController:self didDecideShouldShowLinkPreviews:v3];
  }
}

- (void)willOpenCurrentPageInBrowser
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained remoteViewControllerWillOpenCurrentPageInBrowser:self];
  }
}

- (void)_sf_sceneWillEnterForeground:(id)a3
{
  id v4 = a3;
  id v5 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 beginDigitalHealthTracking];
  }
}

- (void)_sf_sceneDidEnterBackground:(id)a3
{
  id v4 = a3;
  id v5 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  id v6 = [v5 window];
  id v7 = [v6 windowScene];
  id v8 = [v4 object];

  if (v7 == v8)
  {
    id v9 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
    [v9 stopDigitalHealthTrackingWithCompletionHandler:&__block_literal_global_32];
  }
}

- (void)suspendApplication
{
  id v8 = (id)[objc_alloc(MEMORY[0x1E4FB16E0]) initWithInfo:0 responder:0];
  BOOL v3 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  id v4 = [v3 window];
  id v5 = [v4 windowScene];
  id v6 = [v5 _FBSScene];
  id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v8];
  [v6 sendActions:v7];
}

- (void)destroyScene
{
  id v4 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  v2 = [v4 window];
  BOOL v3 = [v2 windowScene];
  objc_msgSend(v3, "_sf_destroyScene");
}

- (BOOL)isOnScreenForVolumeDisplay
{
  if (!self->_isInFullScreen) {
    return 0;
  }
  v2 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  BOOL v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (NSString)volumeAudioCategory
{
  return (NSString *)@"Audio/Video";
}

- (UIWindowScene)windowSceneForVolumeDisplay
{
  v2 = [(SFBrowserRemoteViewController *)self viewIfLoaded];
  BOOL v3 = [v2 window];
  BOOL v4 = [v3 windowScene];

  return (UIWindowScene *)v4;
}

- (SFBrowserRemoteViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SFBrowserRemoteViewController;
  BOOL v4 = [(SFBrowserRemoteViewController *)&v8 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__sf_sceneWillEnterForeground_ name:*MEMORY[0x1E4FB2EB0] object:0];
    [v5 addObserver:v4 selector:sel__sf_sceneDidEnterBackground_ name:*MEMORY[0x1E4FB2E90] object:0];
    id v6 = v4;
  }
  return v4;
}

- (SFBrowserRemoteViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFBrowserRemoteViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end