@interface SFSafariViewController
+ (BOOL)_eligibleForPlatformConventions;
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)_supportsPrewarming;
+ (SFSafariViewControllerPrewarmingToken)prewarmConnectionsToURLs:(NSArray *)URLs;
- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu;
- (BOOL)_showingLinkPreview;
- (BOOL)_showingLinkPreviewWithMinimalUI;
- (BOOL)defersAddingRemoteViewController;
- (NSArray)_previewActions;
- (NSURL)initialURL;
- (SFSafariViewController)initWithCoder:(NSCoder *)aDecoder;
- (SFSafariViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
- (SFSafariViewController)initWithURL:(NSURL *)URL;
- (SFSafariViewController)initWithURL:(NSURL *)URL configuration:(SFSafariViewControllerConfiguration *)configuration;
- (SFSafariViewController)initWithURL:(NSURL *)URL entersReaderIfAvailable:(BOOL)entersReaderIfAvailable;
- (SFSafariViewControllerConfiguration)configuration;
- (SFSafariViewControllerDismissButtonStyle)dismissButtonStyle;
- (SFServiceViewControllerProtocol)serviceProxy;
- (UIColor)preferredBarTintColor;
- (UIColor)preferredControlTintColor;
- (_UIRemoteViewController)_containedRemoteViewController;
- (_WKActivatedElementInfo)_activatedElementInfo;
- (id)_defaultPreviewActionItems;
- (id)_fetchCustomActivitiesForURL:(void *)a3 title:;
- (id)_fetchExcludedActivityTypesForURL:(id)a3 title:(id)a4;
- (id)childViewControllerForHomeIndicatorAutoHidden;
- (id)childViewControllerForStatusBarStyle;
- (id)delegate;
- (id)previewActionItems;
- (uint64_t)_removeRemoteViewController;
- (uint64_t)_updatePreviewViewControllerWithLinkPreviewEnabled:(int)a3 animated:;
- (void)_addLaunchPlaceholderView;
- (void)_addRemoteView;
- (void)_addRemoteViewControllerIfNeeded;
- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4;
- (void)_connectToService;
- (void)_determinePlatformConventions;
- (void)_didLoadRemoteViewController:(uint64_t)a1;
- (void)_dismiss;
- (void)_forwardNotificationToViewService:(id)a3;
- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(uint64_t)a1;
- (void)_initializeViewService;
- (void)_notifyServiceOfUpdatedTintColors;
- (void)_removeLaunchPlaceholderView;
- (void)_restartServiceViewController;
- (void)_setActivatedElementInfo:(id)a3;
- (void)_setEdgeSwipeDismissalEnabled:(id *)a1;
- (void)_setPreviewActions:(id)a3;
- (void)_setShowingLinkPreview:(BOOL)a3;
- (void)_setShowingLinkPreviewWithMinimalUI:(BOOL)a3;
- (void)_setUpWithURL:(void *)a3 configuration:;
- (void)_updateLinkPreviewHitTestView;
- (void)_updateScrollViewIndicatorInsets;
- (void)dealloc;
- (void)interactiveDismissControllerDidBegin:(id)a3;
- (void)interactiveDismissControllerDidCancel:(id)a3;
- (void)interactiveDismissControllerDidEnd:(id)a3;
- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4;
- (void)loadView;
- (void)remoteViewController:(id)a3 didDecideShouldShowLinkPreviews:(BOOL)a4;
- (void)remoteViewController:(id)a3 didFinishInitialLoad:(BOOL)a4;
- (void)remoteViewController:(id)a3 executeCustomActivityProxyID:(id)a4;
- (void)remoteViewController:(id)a3 fetchActivityViewControllerInfoForURL:(id)a4 title:(id)a5;
- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4;
- (void)remoteViewController:(id)a3 initialLoadDidRedirectToURL:(id)a4;
- (void)remoteViewController:(id)a3 setSwipeGestureEnabled:(BOOL)a4;
- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4;
- (void)remoteViewControllerDidLoadWebView:(id)a3;
- (void)remoteViewControllerWillDismiss:(id)a3;
- (void)remoteViewControllerWillOpenCurrentPageInBrowser:(id)a3;
- (void)serviceProxyWillQueueInvocation:(id)a3;
- (void)setDefersAddingRemoteViewController:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setDismissButtonStyle:(SFSafariViewControllerDismissButtonStyle)dismissButtonStyle;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)setPreferredBarTintColor:(UIColor *)preferredBarTintColor;
- (void)setPreferredControlTintColor:(UIColor *)preferredControlTintColor;
- (void)setTransitioningDelegate:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillAppearImpl;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SFSafariViewController

- (SFSafariViewController)initWithURL:(NSURL *)URL configuration:(SFSafariViewControllerConfiguration *)configuration
{
  v6 = URL;
  v7 = configuration;
  if (([(NSURL *)v6 safari_isHTTPFamilyURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."];
  }
  v12.receiver = self;
  v12.super_class = (Class)SFSafariViewController;
  v8 = [(SFSafariViewController *)&v12 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    -[SFSafariViewController _setUpWithURL:configuration:]((uint64_t)v8, v6, v7);
    v10 = v9;
  }

  return v9;
}

- (void)_setUpWithURL:(void *)a3 configuration:
{
  id v6 = a2;
  if (a1)
  {
    uint64_t v7 = [a3 copy];
    v8 = *(void **)(a1 + 984);
    *(void *)(a1 + 984) = v7;

    objc_storeStrong((id *)(a1 + 1248), a2);
    v9 = [v6 absoluteString];
    *(unsigned char *)(a1 + 1008) = objc_msgSend(v9, "safari_looksLikeWillRedirectToURLStringAfterAuthentication:", 0);

    if ([(id)objc_opt_class() _eligibleForPlatformConventions])
    {
      if (*(unsigned char *)(a1 + 1009)) {
        uint64_t v10 = 2;
      }
      else {
        uint64_t v10 = 5;
      }
      [(id)a1 setModalPresentationStyle:v10];
    }
    else if (__UIApplicationLinkedOnOrAfter())
    {
      [(id)a1 setModalPresentationStyle:0];
      v11 = objc_alloc_init(SFInteractiveDismissController);
      objc_super v12 = *(void **)(a1 + 1080);
      *(void *)(a1 + 1080) = v11;

      [*(id *)(a1 + 1080) setViewControllerToBeDismissed:a1];
      uint64_t v13 = *(void *)(a1 + 1080);
      v18.receiver = (id)a1;
      v18.super_class = (Class)SFSafariViewController;
      objc_msgSendSuper2(&v18, sel_setTransitioningDelegate_, v13);
      [*(id *)(a1 + 1080) setDelegate:a1];
    }
    *(_OWORD *)(a1 + 1104) = invalidScrollViewInsets;
    *(_OWORD *)(a1 + 1120) = unk_1A6A8A820;
    *(_OWORD *)(a1 + 1136) = invalidScrollViewInsets;
    *(_OWORD *)(a1 + 1152) = unk_1A6A8A820;
    v14 = [[SFQueueingServiceViewControllerProxy alloc] initWithProtocol:&unk_1EFC3D740];
    v15 = *(void **)(a1 + 1032);
    *(void *)(a1 + 1032) = v14;

    [*(id *)(a1 + 1032) setDelegate:a1];
    if ([*(id *)(a1 + 984) _isPerformingAccountSecurityUpgrade]) {
      [(id)a1 setModalInPresentation:1];
    }
    [*(id *)(a1 + 1032) setConfiguration:*(void *)(a1 + 984)];
    v16 = [MEMORY[0x1E4FB1E20] systemTraitsAffectingColorAppearance];
    id v17 = (id)[(id)a1 registerForTraitChanges:v16 withTarget:a1 action:sel__notifyServiceOfUpdatedTintColors];
  }
}

- (SFSafariViewController)initWithURL:(NSURL *)URL entersReaderIfAvailable:(BOOL)entersReaderIfAvailable
{
  BOOL v4 = entersReaderIfAvailable;
  id v6 = URL;
  if (([(NSURL *)v6 safari_isHTTPFamilyURL] & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."];
  }
  v11.receiver = self;
  v11.super_class = (Class)SFSafariViewController;
  uint64_t v7 = [(SFSafariViewController *)&v11 initWithNibName:0 bundle:0];
  if (v7)
  {
    v8 = objc_alloc_init(SFSafariViewControllerConfiguration);
    [(SFSafariViewControllerConfiguration *)v8 setEntersReaderIfAvailable:v4];
    -[SFSafariViewController _setUpWithURL:configuration:]((uint64_t)v7, v6, v8);
    v9 = v7;
  }
  return v7;
}

- (SFSafariViewController)initWithURL:(NSURL *)URL
{
  BOOL v4 = URL;
  v5 = objc_alloc_init(SFSafariViewControllerConfiguration);
  id v6 = [(SFSafariViewController *)self initWithURL:v4 configuration:v5];

  return v6;
}

- (SFSafariViewController)initWithCoder:(NSCoder *)aDecoder
{
  return 0;
}

- (SFSafariViewController)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  return 0;
}

- (void)dealloc
{
  v3 = [(SFSafariViewController *)self view];
  [v3 _removeBoundingPathChangeObserver:self];

  [(SFSafariViewController *)self removeChildViewController:self->_remoteViewController];
  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v4 dealloc];
}

- (void)_initializeViewService
{
  if (a1 && !*(unsigned char *)(a1 + 1168))
  {
    *(unsigned char *)(a1 + 1168) = 1;
    id v5 = +[_SFSafariViewControllerPrewarmingSession sharedSessionIfExists];
    if ([(id)objc_opt_class() _supportsPrewarming]
      && ([*(id *)(a1 + 984) _isEphemeral] & 1) == 0
      && ([v5 remoteViewController],
          v2 = objc_claimAutoreleasedReturnValue(),
          v2,
          v2))
    {
      v3 = [v5 remoteViewController];
      -[SFSafariViewController _didLoadRemoteViewController:](a1, v3);

      uint64_t v4 = [v5 restart];
    }
    else
    {
      -[SFSafariViewController _connectToService](a1);
    }
    MEMORY[0x1AD0C2480](v4);
  }
}

- (void)_didLoadRemoteViewController:(uint64_t)a1
{
  id v4 = a2;
  if (a1)
  {
    objc_storeStrong((id *)(a1 + 1016), a2);
    id v5 = [v4 serviceViewControllerProxy];
    [*(id *)(a1 + 1032) setTarget:v5];

    [v4 setDelegate:a1];
    id v6 = *(void **)(a1 + 1032);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__SFSafariViewController__didLoadRemoteViewController___block_invoke;
    v7[3] = &unk_1E5C724D8;
    v7[4] = a1;
    [v6 prepareForDisplayWithCompletionHandler:v7];
  }
}

- (void)_connectToService
{
  if (a1)
  {
    id v2 = (id)[*(id *)(a1 + 1024) invoke];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__SFSafariViewController__connectToService__block_invoke;
    v5[3] = &unk_1E5C751F0;
    v5[4] = a1;
    uint64_t v3 = +[SFBrowserRemoteViewController requestViewControllerWithConnectionHandler:v5];
    id v4 = *(void **)(a1 + 1024);
    *(void *)(a1 + 1024) = v3;
  }
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(SFSafariView);
  [(SFSafariView *)v3 _addBoundingPathChangeObserver:self];
  [(SFSafariViewController *)self setView:v3];
  if (performViewWillAppearInLoadView())
  {
    -[SFSafariViewController viewWillAppearImpl]((uint64_t)self);
    if (self) {
      -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)self, 0);
    }
  }
  [(SFSafariViewController *)self setHidesBottomBarWhenPushed:1];
}

- (void)viewWillAppearImpl
{
  if (a1)
  {
    -[SFSafariViewController _determinePlatformConventions](a1);
    if ([*(id *)(a1 + 976) BOOLValue])
    {
      if (!*(unsigned char *)(a1 + 1009)) {
        goto LABEL_8;
      }
      -[SFSafariViewController _removeRemoteViewController](a1);
    }
    else if (*(void *)(a1 + 1016))
    {
      [(id)a1 _addRemoteViewControllerIfNeeded];
      goto LABEL_8;
    }
    -[SFSafariViewController _addLaunchPlaceholderView](a1);
LABEL_8:
    if ([*(id *)(a1 + 976) BOOLValue])
    {
LABEL_17:
      *(unsigned char *)(a1 + 993) = 1;
      return;
    }
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v2 addObserver:a1 selector:sel__forwardNotificationToViewService_ name:*MEMORY[0x1E4FB2738] object:0];
    [v2 addObserver:a1 selector:sel__forwardNotificationToViewService_ name:*MEMORY[0x1E4FB2628] object:0];
    if ((([(id)a1 isBeingPresented] & 1) != 0
       || [(id)a1 isMovingToParentViewController])
      && SFViewControllerViewEmbeddedByPreviewController((void *)a1))
    {
      [(id)a1 _setShowingLinkPreview:1];
      char v3 = _SFShouldShowLinkPreviews();
    }
    else
    {
      if (!*(void *)(a1 + 1176))
      {
LABEL_16:
        -[SFSafariViewController _updateScrollViewIndicatorInsets](a1);

        goto LABEL_17;
      }
      char v3 = 0;
    }
    -[SFSafariViewController _updatePreviewViewControllerWithLinkPreviewEnabled:animated:](a1, v3, 0);
    goto LABEL_16;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v4 viewWillAppear:a3];
  if ((performViewWillAppearInLoadView() & 1) == 0) {
    -[SFSafariViewController viewWillAppearImpl]((uint64_t)self);
  }
}

- (void)_determinePlatformConventions
{
  if (a1)
  {
    if (([(id)a1 _showingLinkPreview] & 1) != 0
      || ([(id)a1 _showingLinkPreviewWithMinimalUI] & 1) != 0
      || SFViewControllerViewEmbeddedByPreviewController((void *)a1))
    {
      int v2 = 0;
      *(unsigned char *)(a1 + 1009) = 0;
    }
    else
    {
      int v2 = 1;
    }
    uint64_t v3 = v2 & [(id)objc_opt_class() _eligibleForPlatformConventions];
    objc_super v4 = *(void **)(a1 + 976);
    if (!v4 || ([v4 BOOLValue] & 1) == 0 && ((v3 ^ 1) & 1) == 0)
    {
      uint64_t v5 = [NSNumber numberWithBool:v3];
      id v6 = *(void **)(a1 + 976);
      *(void *)(a1 + 976) = v5;
    }
    if (([*(id *)(a1 + 976) BOOLValue] & 1) == 0)
    {
      -[SFSafariViewController _initializeViewService](a1);
    }
  }
}

- (uint64_t)_removeRemoteViewController
{
  if (result)
  {
    uint64_t v1 = result;
    if (*(unsigned char *)(result + 1040))
    {
      [(id)result removeChildViewController:*(void *)(result + 1016)];
      int v2 = [*(id *)(v1 + 1016) view];
      [v2 removeFromSuperview];

      result = [*(id *)(v1 + 1016) didMoveToParentViewController:0];
      *(unsigned char *)(v1 + 1040) = 0;
    }
  }
  return result;
}

- (void)_addLaunchPlaceholderView
{
  if (a1)
  {
    int v2 = *(void **)(a1 + 1000);
    if (v2)
    {
      [v2 removeFromSuperview];
      uint64_t v3 = *(void **)(a1 + 1000);
      *(void *)(a1 + 1000) = 0;
    }
    objc_super v4 = [(id)a1 view];
    if ([*(id *)(a1 + 976) BOOLValue] && *(unsigned char *)(a1 + 1009))
    {
      objc_initWeak(&location, (id)a1);
      uint64_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
      id v6 = objc_msgSend(v5, "safari_localizedDisplayName");
      uint64_t v7 = *(void *)(a1 + 1248);
      uint64_t v8 = *(unsigned __int8 *)(a1 + 1008);
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke;
      v15[3] = &unk_1E5C725B8;
      objc_copyWeak(&v16, &location);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke_2;
      v13[3] = &unk_1E5C725B8;
      objc_copyWeak(&v14, &location);
      uint64_t v9 = +[SFSafariLaunchPlaceholderView compatibilityPlaceholderWithAppName:v6 destinationURL:v7 forAuthentication:v8 dismissalHandler:v15 openHandler:v13];
      uint64_t v10 = *(void **)(a1 + 1000);
      *(void *)(a1 + 1000) = v9;

      [*(id *)(a1 + 1000) setClipsToBounds:1];
      if (eligibleForSlideInPresentation()) {
        [v4 setUserInteractionEnabled:1];
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      uint64_t v11 = +[SFSafariLaunchPlaceholderView blankPlaceholder];
      objc_super v12 = *(void **)(a1 + 1000);
      *(void *)(a1 + 1000) = v11;

      if (([(id)a1 _showingLinkPreview] & 1) != 0
        || ([(id)a1 _showingLinkPreviewWithMinimalUI] & 1) != 0
        || [*(id *)(a1 + 976) BOOLValue] && !*(unsigned char *)(a1 + 1009))
      {
        [*(id *)(a1 + 1000) setHidden:1];
      }
    }
    [*(id *)(a1 + 1000) setAutoresizingMask:18];
    [v4 bounds];
    objc_msgSend(*(id *)(a1 + 1000), "setFrame:");
    [*(id *)(a1 + 1000) updateBarTintColor:*(void *)(a1 + 1224)];
    [*(id *)(a1 + 1000) updateControlTintColor:*(void *)(a1 + 1232)];
    [*(id *)(a1 + 1000) updateDismissButtonStyle:*(void *)(a1 + 1240)];
    [v4 addSubview:*(void *)(a1 + 1000)];
  }
}

- (uint64_t)_updatePreviewViewControllerWithLinkPreviewEnabled:(int)a3 animated:
{
  if (result)
  {
    uint64_t v5 = result;
    result = [(id)result _showingLinkPreview];
    if ((result & 1) != 0 || *(void *)(v5 + 1176))
    {
      if (a2)
      {
        result = *(void *)(v5 + 1176);
        if (!result) {
          return result;
        }
        [(id)result removeFromParentViewController];
        id v6 = [*(id *)(v5 + 1176) view];
        [v6 removeFromSuperview];

        [*(id *)(v5 + 1176) didMoveToParentViewController:0];
        uint64_t v7 = *(void **)(v5 + 1176);
        *(void *)(v5 + 1176) = 0;

        if (*(void *)(v5 + 1016))
        {
          [(id)v5 _addRemoteViewControllerIfNeeded];
          [*(id *)(v5 + 1032) loadURL:*(void *)(v5 + 1248)];
        }
        if (a3) {
          goto LABEL_9;
        }
      }
      else
      {
        -[SFSafariViewController _removeRemoteViewController](v5);
        uint64_t v8 = [[_SFURLTextPreviewViewController alloc] initWithURL:*(void *)(v5 + 1248)];
        uint64_t v9 = *(void **)(v5 + 1176);
        *(void *)(v5 + 1176) = v8;

        uint64_t v10 = [(id)v5 view];
        uint64_t v11 = [*(id *)(v5 + 1176) view];
        [v10 addSubview:v11];

        objc_super v12 = [(id)v5 view];
        [v12 bounds];
        double v14 = v13;
        double v16 = v15;
        double v18 = v17;
        double v20 = v19;
        v21 = [*(id *)(v5 + 1176) view];
        objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

        [(id)v5 addChildViewController:*(void *)(v5 + 1176)];
        [*(id *)(v5 + 1176) didMoveToParentViewController:v5];
        v22 = [*(id *)(v5 + 1176) view];
        [v22 layoutIfNeeded];

        v23 = [*(id *)(v5 + 1176) _previewHeader];
        [v23 setDelegate:v5];

        if (a3)
        {
LABEL_9:
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = __86__SFSafariViewController__updatePreviewViewControllerWithLinkPreviewEnabled_animated___block_invoke;
          v24[3] = &unk_1E5C724D8;
          v24[4] = v5;
          return [MEMORY[0x1E4FB1EB0] animateWithDuration:v24 animations:0.25];
        }
      }
      [*(id *)(v5 + 1176) preferredContentSize];
      return objc_msgSend((id)v5, "setPreferredContentSize:");
    }
  }
  return result;
}

- (void)_updateScrollViewIndicatorInsets
{
  if (a1)
  {
    id v21 = [(id)a1 view];
    objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseInsetsForVerticalScrollIndicatorInScrollViewContainerView:", v21);
    double v3 = v2;
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    objc_msgSend(MEMORY[0x1E4FB1BE0], "_sf_baseInsetsForHorizontalScrollIndicatorInScrollViewContainerView:", v21);
    double v14 = (double *)(a1 + 1104);
    BOOL v17 = v5 == *(double *)(a1 + 1112)
       && v3 == *(double *)(a1 + 1104)
       && v9 == *(double *)(a1 + 1128)
       && v7 == *(double *)(a1 + 1120);
    if (!v17
      || (v11 == *(double *)(a1 + 1144) ? (BOOL v18 = v10 == *(double *)(a1 + 1136)) : (BOOL v18 = 0),
          v18 ? (BOOL v19 = v13 == *(double *)(a1 + 1160)) : (BOOL v19 = 0),
          v19 ? (BOOL v20 = v12 == *(double *)(a1 + 1152)) : (BOOL v20 = 0),
          !v20))
    {
      double *v14 = v3;
      *(double *)(a1 + 1112) = v5;
      *(double *)(a1 + 1120) = v7;
      *(double *)(a1 + 1128) = v9;
      *(double *)(a1 + 1136) = v10;
      *(double *)(a1 + 1144) = v11;
      *(double *)(a1 + 1152) = v12;
      *(double *)(a1 + 1160) = v13;
      objc_msgSend(*(id *)(a1 + 1032), "updateScrollViewIndicatorVerticalInsets:horizontalInsets:", *v14, *(double *)(a1 + 1112), *(double *)(a1 + 1120), *(double *)(a1 + 1128));
    }
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v5 viewDidAppear:a3];
  if (self) {
    -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)self, 0);
  }
  if (!self->_didHandlerURLExternally) {
    [(SFSafariLaunchPlaceholderView *)self->_launchPlaceholderView setShowContinueButton:1];
  }
  if ([(NSNumber *)self->_adoptsPlatformConventions BOOLValue] && !self->_usesCompatibilityPlaceholder)
  {
    [(SFSafariViewController *)self dismissViewControllerAnimated:0 completion:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained safariViewControllerDidFinish:self];
    }
  }
}

- (void)_dismiss
{
  if (a1)
  {
    [a1 dismissViewControllerAnimated:1 completion:0];
    id WeakRetained = objc_loadWeakRetained(a1 + 152);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained safariViewControllerDidFinish:a1];
    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v5 viewWillDisappear:a3];
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self];

  if ((([(SFSafariViewController *)self isBeingDismissed] & 1) != 0
     || [(SFSafariViewController *)self isMovingFromParentViewController])&& SFViewControllerViewEmbeddedByPreviewController(self))
  {
    if (self->_textPreviewViewController) {
      -[SFSafariViewController _updatePreviewViewControllerWithLinkPreviewEnabled:animated:]((uint64_t)self, 1, 0);
    }
    [(SFSafariViewController *)self _setShowingLinkPreview:0];
  }
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  if (a3)
  {
    objc_super v5 = [(SFSafariViewController *)self transitioningDelegate];
    interactiveDismissController = self->_interactiveDismissController;

    if (v5 == interactiveDismissController)
    {
      [(SFSafariViewController *)self setTransitioningDelegate:0];
      double v7 = self->_interactiveDismissController;
      self->_interactiveDismissController = 0;
    }
  }
  [(SFServiceViewControllerProtocol *)self->_serviceProxy setHostAppModalPresentationStyle:a3];
  v8.receiver = self;
  v8.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v8 setModalPresentationStyle:a3];
}

- (void)setTransitioningDelegate:(id)a3
{
  if (a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)SFSafariViewController;
    -[SFSafariViewController setTransitioningDelegate:](&v5, sel_setTransitioningDelegate_);
    interactiveDismissController = self->_interactiveDismissController;
    self->_interactiveDismissController = 0;
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)SFSafariViewController;
  id v7 = a4;
  -[SFSafariViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  self->_viewSizeIsTransitioning = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__SFSafariViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5C72528;
  v8[4] = self;
  [v7 animateAlongsideTransition:&__block_literal_global_39 completion:v8];
}

void __77__SFSafariViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1096) = 0;
  -[SFSafariViewController _updateScrollViewIndicatorInsets](*(void *)(a1 + 32));
}

- (void)_notifyServiceOfUpdatedTintColors
{
  id v5 = [(SFSafariViewController *)self traitCollection];
  double v3 = [(UIColor *)self->_preferredBarTintColor resolvedColorWithTraitCollection:v5];
  double v4 = [(UIColor *)self->_preferredControlTintColor resolvedColorWithTraitCollection:v5];
  [(SFServiceViewControllerProtocol *)self->_serviceProxy setPreferredBarTintColor:v3 controlTintColor:v4];
}

- (id)childViewControllerForHomeIndicatorAutoHidden
{
  return self->_remoteViewController;
}

- (id)childViewControllerForStatusBarStyle
{
  return self->_remoteViewController;
}

- (void)_addRemoteView
{
  if (a1 && *(void *)(a1 + 1016) && !*(unsigned char *)(a1 + 1040))
  {
    if ((__UIApplicationLinkedOnOrAfter() & 1) == 0)
    {
      double v2 = *(void **)(a1 + 1032);
      double v3 = [(id)a1 view];
      double v4 = [v3 tintColor];
      [v2 setPreferredControlTintColor:v4];
    }
    id v9 = [*(id *)(a1 + 1016) view];
    uint64_t v5 = *(void *)(a1 + 1184);
    double v6 = [(id)a1 view];
    id v7 = v6;
    if (v5) {
      [v6 insertSubview:v9 belowSubview:*(void *)(a1 + 1184)];
    }
    else {
      [v6 addSubview:v9];
    }

    objc_super v8 = [(id)a1 view];
    [v8 bounds];
    objc_msgSend(v9, "setFrame:");

    [v9 setAutoresizingMask:18];
    *(unsigned char *)(a1 + 1040) = 1;
  }
}

- (void)_setEdgeSwipeDismissalEnabled:(id *)a1
{
  v23[4] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    id v3 = a1[135];
    if (v3)
    {
      id v22 = [v3 edgeSwipeView];
      if (a2)
      {
        if (!v22)
        {
          id v22 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
          uint64_t v5 = [v22 layer];
          [v5 setHitTestsAsOpaque:1];

          [a1[135] setEdgeSwipeView:v22];
        }
        double v6 = [a1 view];
        id v7 = [a1[127] view];
        [v6 insertSubview:v22 aboveSubview:v7];

        [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
        id v21 = (void *)MEMORY[0x1E4F28DC8];
        if (objc_msgSend(v6, "_sf_usesLeftToRightLayout"))
        {
          objc_super v8 = [v22 leftAnchor];
          [v6 leftAnchor];
        }
        else
        {
          objc_super v8 = [v22 rightAnchor];
          [v6 rightAnchor];
        }
        BOOL v19 = v8;
        BOOL v20 = [v8 constraintEqualToAnchor:objc_claimAutoreleasedReturnValue()];
        v23[0] = v20;
        id v9 = [v22 topAnchor];
        double v10 = [v6 topAnchor];
        double v11 = [v9 constraintEqualToAnchor:v10 constant:64.0];
        v23[1] = v11;
        double v12 = [v22 bottomAnchor];
        double v13 = [v6 bottomAnchor];
        double v14 = [v12 constraintEqualToAnchor:v13];
        v23[2] = v14;
        double v15 = [v22 widthAnchor];
        double v16 = [v15 constraintEqualToConstant:24.0];
        v23[3] = v16;
        BOOL v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
        [v21 activateConstraints:v17];
      }
      else
      {
        [v22 removeFromSuperview];
      }
    }
  }
}

void __43__SFSafariViewController__connectToService__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  objc_super v8 = *(void **)(v7 + 1024);
  *(void *)(v7 + 1024) = 0;

  if (v5)
  {
    -[SFSafariViewController _didLoadRemoteViewController:](*(void *)(a1 + 32), v5);
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXViewService();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __61___SFSafariViewControllerPrewarmingSession__connectToService__block_invoke_cold_1(v9, v6);
    }
  }
}

- (SFServiceViewControllerProtocol)serviceProxy
{
  -[SFSafariViewController _initializeViewService]((uint64_t)self);
  serviceProxy = self->_serviceProxy;

  return serviceProxy;
}

uint64_t __55__SFSafariViewController__didLoadRemoteViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addRemoteViewControllerIfNeeded];
}

- (void)_addRemoteViewControllerIfNeeded
{
  textPreviewViewController = self->_textPreviewViewController;
  adoptsPlatformConventions = self->_adoptsPlatformConventions;
  if (adoptsPlatformConventions) {
    char v5 = [(NSNumber *)adoptsPlatformConventions BOOLValue];
  }
  else {
    char v5 = 1;
  }
  if (self->_remoteViewController
    && ![(SFSafariViewController *)self defersAddingRemoteViewController])
  {
    BOOL v6 = !self->_remoteViewControllerHasBeenAdded && textPreviewViewController == 0;
    char v7 = v6 ? v5 : 1;
    if ((v7 & 1) == 0)
    {
      [(SFSafariViewController *)self addChildViewController:self->_remoteViewController];
      -[SFSafariViewController _addRemoteView]((uint64_t)self);
      -[SFSafariViewController _removeLaunchPlaceholderView]((uint64_t)self);
      remoteViewController = self->_remoteViewController;
      [(SFBrowserRemoteViewController *)remoteViewController didMoveToParentViewController:self];
    }
  }
}

- (void)_removeLaunchPlaceholderView
{
  if (a1)
  {
    [*(id *)(a1 + 1000) removeFromSuperview];
    double v2 = *(void **)(a1 + 1000);
    *(void *)(a1 + 1000) = 0;
  }
}

void __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  -[SFSafariViewController _dismiss](WeakRetained);
}

void __51__SFSafariViewController__addLaunchPlaceholderView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:]((uint64_t)WeakRetained, 1);
}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(uint64_t)a1
{
  if (a1 && !*(unsigned char *)(a1 + 992) && [*(id *)(a1 + 976) BOOLValue])
  {
    double v4 = [(id)a1 view];
    char v5 = [v4 window];
    BOOL v6 = [v5 windowScene];
    char v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v9 = [(id)a1 presentingViewController];
      double v10 = [v9 view];
      double v11 = [v10 window];
      id v8 = [v11 windowScene];
    }
    if (v8)
    {
      if ((a2 & 1) != 0
        || (performViewWillAppearInLoadView() & 1) != 0
        || (eligibleForSlideInPresentation() & 1) != 0
        || SFViewControllerViewIsVisible((void *)a1, 0))
      {
        *(unsigned char *)(a1 + 992) = 1;
        uint64_t v12 = *(void *)(a1 + 1248);
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __83__SFSafariViewController__handleURLExternallyIfApplicableBypassingVisibilityCheck___block_invoke;
        v15[3] = &unk_1E5C72678;
        void v15[4] = a1;
        [v8 openURL:v12 options:0 completionHandler:v15];
      }
      else
      {
        double v14 = WBS_LOG_CHANNEL_PREFIXViewService();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:](v14);
        }
      }
    }
    else
    {
      double v13 = WBS_LOG_CHANNEL_PREFIXViewService();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[SFSafariViewController _handleURLExternallyIfApplicableBypassingVisibilityCheck:](v13);
      }
    }
  }
}

- (SFSafariViewControllerConfiguration)configuration
{
  double v2 = (void *)[(SFSafariViewControllerConfiguration *)self->_configuration copy];

  return (SFSafariViewControllerConfiguration *)v2;
}

- (void)setPreferredBarTintColor:(UIColor *)preferredBarTintColor
{
  char v5 = preferredBarTintColor;
  BOOL v6 = self->_preferredBarTintColor;
  if (v6 != v5)
  {
    double v11 = v5;
    char v7 = [(UIColor *)v6 isEqual:v5];
    char v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredBarTintColor, preferredBarTintColor);
      char v5 = v11;
      if (!self->_hasBeenDisplayedAtLeastOnce)
      {
        id v8 = [(SFSafariViewController *)self traitCollection];
        serviceProxy = self->_serviceProxy;
        double v10 = [(UIColor *)v11 resolvedColorWithTraitCollection:v8];
        [(SFServiceViewControllerProtocol *)serviceProxy setPreferredBarTintColor:v10];

        [(SFSafariLaunchPlaceholderView *)self->_launchPlaceholderView updateBarTintColor:v11];
        char v5 = v11;
      }
    }
  }
}

- (void)setPreferredControlTintColor:(UIColor *)preferredControlTintColor
{
  char v5 = preferredControlTintColor;
  BOOL v6 = self->_preferredControlTintColor;
  if (v6 != v5)
  {
    double v11 = v5;
    char v7 = [(UIColor *)v6 isEqual:v5];
    char v5 = v11;
    if ((v7 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredControlTintColor, preferredControlTintColor);
      char v5 = v11;
      if (!self->_hasBeenDisplayedAtLeastOnce)
      {
        serviceProxy = self->_serviceProxy;
        id v9 = [(SFSafariViewController *)self traitCollection];
        double v10 = [(UIColor *)v11 resolvedColorWithTraitCollection:v9];
        [(SFServiceViewControllerProtocol *)serviceProxy setPreferredControlTintColor:v10];

        char v5 = v11;
      }
    }
  }
}

- (void)setDismissButtonStyle:(SFSafariViewControllerDismissButtonStyle)dismissButtonStyle
{
  if (self->_dismissButtonStyle != dismissButtonStyle)
  {
    self->_dismissButtonStyle = dismissButtonStyle;
    -[SFServiceViewControllerProtocol setDismissButtonStyle:](self->_serviceProxy, "setDismissButtonStyle:");
  }
}

+ (BOOL)_supportsPrewarming
{
  return 1;
}

+ (SFSafariViewControllerPrewarmingToken)prewarmConnectionsToURLs:(NSArray *)URLs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = URLs;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = *MEMORY[0x1E4F1C3C8];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "safari_isHTTPFamilyURL") & 1) == 0) {
          [MEMORY[0x1E4F1CA00] raise:v7 format:@"The specified URL has an unsupported scheme. Only HTTP and HTTPS URLs are supported."];
        }
      }
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  id v9 = +[_SFSafariViewControllerPrewarmingSession sharedSession];
  double v10 = [v9 prewarmConnectionsToURLs:v3];

  return (SFSafariViewControllerPrewarmingToken *)v10;
}

+ (BOOL)_eligibleForPlatformConventions
{
  if (!os_variant_has_internal_ui()) {
    return 0;
  }
  double v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"DebugSafariViewControllerAdoptsPlatformConventions"];

  if (!v3) {
    return 0;
  }
  uint64_t v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [v4 BOOLForKey:@"DebugSafariViewControllerAdoptsPlatformConventions"];

  return v5;
}

void __83__SFSafariViewController__handleURLExternallyIfApplicableBypassingVisibilityCheck___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 1009))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v2 + 1216));
    if (objc_opt_respondsToSelector()) {
      [WeakRetained safariViewController:*(void *)(a1 + 32) didCompleteInitialLoad:a2];
    }
  }
}

- (BOOL)_showingLinkPreview
{
  return self->_displayMode == 1;
}

- (void)_setShowingLinkPreview:(BOOL)a3
{
  if (self->_displayMode != a3)
  {
    BOOL v3 = a3;
    self->_displayMode = a3;
    -[SFServiceViewControllerProtocol setDisplayMode:](self->_serviceProxy, "setDisplayMode:");
    [(SFSafariLaunchPlaceholderView *)self->_launchPlaceholderView setHidden:v3];
    -[SFSafariViewController _updateLinkPreviewHitTestView]((id *)&self->super.super.super.isa);
  }
}

- (void)_updateLinkPreviewHitTestView
{
  if (a1)
  {
    int v2 = [a1 _showingLinkPreview];
    id v3 = a1[148];
    if (v2)
    {
      if (v3) {
        return;
      }
      id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      char v5 = [a1 view];
      [v5 bounds];
      UIRectInset();
      uint64_t v6 = objc_msgSend(v4, "initWithFrame:");
      id v7 = a1[148];
      a1[148] = (id)v6;

      id v8 = [a1[148] layer];
      [v8 setHitTestsAsOpaque:1];

      double v10 = [a1 view];
      [v10 addSubview:a1[148]];
      id v9 = v10;
    }
    else
    {
      if (!v3) {
        return;
      }
      [v3 removeFromSuperview];
      id v9 = a1[148];
      a1[148] = 0;
    }
  }
}

- (BOOL)_showingLinkPreviewWithMinimalUI
{
  return self->_displayMode == 4;
}

- (void)_setShowingLinkPreviewWithMinimalUI:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    int64_t v4 = 4;
  }
  else {
    int64_t v4 = 0;
  }
  if (self->_displayMode != v4)
  {
    self->_displayMode = v4;
    -[SFServiceViewControllerProtocol setDisplayMode:](self->_serviceProxy, "setDisplayMode:");
    launchPlaceholderView = self->_launchPlaceholderView;
    [(SFSafariLaunchPlaceholderView *)launchPlaceholderView setHidden:v3];
  }
}

- (BOOL)_allowsUserInteractionWhenPreviewedInContextMenu
{
  return 1;
}

uint64_t __86__SFSafariViewController__updatePreviewViewControllerWithLinkPreviewEnabled_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1176) preferredContentSize];
  int v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "setPreferredContentSize:");
}

- (id)previewActionItems
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_previewActions count])
  {
    id v14 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    obj = self->_previewActions;
    uint64_t v3 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v3)
    {
      uint64_t v4 = v3;
      uint64_t v5 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v17 != v5) {
            objc_enumerationMutation(obj);
          }
          id v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          id v8 = (void *)MEMORY[0x1E4FB1B18];
          id v9 = [v7 title];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = __44__SFSafariViewController_previewActionItems__block_invoke;
          v15[3] = &unk_1E5C768F8;
          void v15[4] = v7;
          void v15[5] = self;
          double v10 = [v8 actionWithTitle:v9 style:0 handler:v15];

          if (objc_opt_respondsToSelector())
          {
            double v11 = objc_msgSend(MEMORY[0x1E4F46770], "imageForElementActionType:", objc_msgSend(v7, "type"));
            [v10 setImage:v11];
          }
          [v14 addObject:v10];
        }
        uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v4);
    }
  }
  else
  {
    -[SFSafariViewController _defaultPreviewActionItems]((uint64_t)self);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

- (id)_defaultPreviewActionItems
{
  v19[3] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = (void *)MEMORY[0x1E4FB1B18];
    uint64_t v3 = _WBSLocalizedString();
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke;
    v18[3] = &unk_1E5C76920;
    v18[4] = a1;
    uint64_t v4 = [v2 actionWithTitle:v3 style:0 handler:v18];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [MEMORY[0x1E4F46770] imageForElementActionType:4];
      [v4 setImage:v5];
    }
    uint64_t v6 = (void *)MEMORY[0x1E4FB1B18];
    id v7 = _WBSLocalizedString();
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_2;
    v17[3] = &unk_1E5C76920;
    v17[4] = a1;
    id v8 = [v6 actionWithTitle:v7 style:0 handler:v17];

    if (objc_opt_respondsToSelector())
    {
      id v9 = [MEMORY[0x1E4F46770] imageForElementActionType:2];
      [v8 setImage:v9];
    }
    double v10 = (void *)MEMORY[0x1E4FB1B18];
    double v11 = _WBSLocalizedString();
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_3;
    v16[3] = &unk_1E5C76920;
    v16[4] = a1;
    long long v12 = [v10 actionWithTitle:v11 style:0 handler:v16];

    if (objc_opt_respondsToSelector())
    {
      long long v13 = [MEMORY[0x1E4F46770] imageForElementActionType:5];
      [v12 setImage:v13];
    }
    v19[0] = v4;
    v19[1] = v8;
    v19[2] = v12;
    id v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

uint64_t __44__SFSafariViewController_previewActionItems__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) runActionWithElementInfo:*(void *)(*(void *)(a1 + 40) + 1200)];
}

void __52__SFSafariViewController__defaultPreviewActionItems__block_invoke(uint64_t a1)
{
  id v2 = +[SSReadingList defaultReadingList];
  [v2 addReadingListItemWithURL:*(void *)(*(void *)(a1 + 32) + 1248) title:0 previewText:0 error:0];
}

void __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1A78] generalPasteboard];
  [v2 setURL:*(void *)(*(void *)(a1 + 32) + 1248)];
}

uint64_t __52__SFSafariViewController__defaultPreviewActionItems__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1032) openCurrentURLInSafariFromPreviewAction];
}

- (void)_boundingPathMayHaveChangedForView:(id)a3 relativeToBoundsOriginOnly:(BOOL)a4
{
  id v6 = a3;
  if (!a4)
  {
    *(_OWORD *)&self->_verticalScrollIndicatorBaseInsets.top = invalidScrollViewInsets;
    *(_OWORD *)&self->_verticalScrollIndicatorBaseInsets.bottom = unk_1A6A8A820;
    *(_OWORD *)&self->_horizontalScrollIndicatorBaseInsets.top = invalidScrollViewInsets;
    *(_OWORD *)&self->_horizontalScrollIndicatorBaseInsets.bottom = unk_1A6A8A820;
    if (!self->_viewSizeIsTransitioning)
    {
      id v7 = v6;
      -[SFSafariViewController _updateScrollViewIndicatorInsets]((uint64_t)self);
      id v6 = v7;
    }
  }
}

- (_UIRemoteViewController)_containedRemoteViewController
{
  return (_UIRemoteViewController *)self->_remoteViewController;
}

- (void)linkPreviewHeader:(id)a3 didEnableLinkPreview:(BOOL)a4
{
}

- (void)remoteViewControllerDidLoadWebView:(id)a3
{
  [(SFServiceViewControllerProtocol *)self->_serviceProxy loadURL:self->_initialURL];
  id v5 = [(SFSafariViewControllerConfiguration *)self->_configuration eventAttribution];
  uint64_t v4 = [v5 toUISClickAttribution];
  if (v4 && [(NSURL *)self->_initialURL safari_isHTTPSURL]) {
    [(SFServiceViewControllerProtocol *)self->_serviceProxy addClickAttribution:v4];
  }
}

- (void)remoteViewControllerWillDismiss:(id)a3
{
  [(SFSafariViewController *)self dismissViewControllerAnimated:1 completion:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained safariViewControllerDidFinish:self];
  }
}

- (void)viewWillLayoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SFSafariViewController;
  [(SFSafariViewController *)&v4 viewWillLayoutSubviews];
  uint64_t v3 = [(SFSafariViewController *)self topLayoutGuide];
  [v3 length];
  [(SFSafariLaunchPlaceholderView *)self->_launchPlaceholderView setTopLayoutGuideInset:"setTopLayoutGuideInset:"];
}

- (void)_restartServiceViewController
{
  self->_hasRestartedViewService = 1;
  id v11 = [(SFSafariViewController *)self serviceProxy];
  uint64_t v3 = [(SFSafariViewController *)self initialURL];
  [v11 loadURL:v3];

  [v11 setConfiguration:self->_configuration];
  objc_msgSend(v11, "setHostAppModalPresentationStyle:", -[SFSafariViewController modalPresentationStyle](self, "modalPresentationStyle"));
  preferredBarTintColor = self->_preferredBarTintColor;
  if (preferredBarTintColor)
  {
    id v5 = [(SFSafariViewController *)self traitCollection];
    id v6 = [(UIColor *)preferredBarTintColor resolvedColorWithTraitCollection:v5];
    [v11 setPreferredBarTintColor:v6];
  }
  preferredControlTintColor = self->_preferredControlTintColor;
  if (preferredControlTintColor)
  {
    id v8 = [(SFSafariViewController *)self traitCollection];
    id v9 = [(UIColor *)preferredControlTintColor resolvedColorWithTraitCollection:v8];
    [v11 setPreferredControlTintColor:v9];
  }
  double v10 = v11;
  if (self->_dismissButtonStyle)
  {
    objc_msgSend(v11, "setDismissButtonStyle:");
    double v10 = v11;
  }
}

- (void)remoteViewController:(id)a3 viewServiceDidTerminateWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  [(SFServiceViewControllerProtocol *)self->_serviceProxy setTarget:0];
  -[SFSafariViewController _removeRemoteViewController]((uint64_t)self);
  remoteViewController = self->_remoteViewController;
  self->_remoteViewController = 0;

  -[SFSafariViewController _addLaunchPlaceholderView]((uint64_t)self);
  dispatch_time_t v9 = dispatch_time(0, 1500000000);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__SFSafariViewController_remoteViewController_viewServiceDidTerminateWithError___block_invoke;
  v10[3] = &unk_1E5C725B8;
  objc_copyWeak(&v11, &location);
  dispatch_after(v9, MEMORY[0x1E4F14428], v10);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __80__SFSafariViewController_remoteViewController_viewServiceDidTerminateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _restartServiceViewController];
}

- (void)remoteViewController:(id)a3 fetchActivityViewControllerInfoForURL:(id)a4 title:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  -[SFSafariViewController _fetchCustomActivitiesForURL:title:]((uint64_t)self, v8, v7);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_time_t v9 = [(SFSafariViewController *)self _fetchExcludedActivityTypesForURL:v8 title:v7];

  [(SFServiceViewControllerProtocol *)self->_serviceProxy didFetchCustomActivities:v10 excludedActivityTypes:v9];
}

- (id)_fetchCustomActivitiesForURL:(void *)a3 title:
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    id v7 = *(void **)(a1 + 1056);
    *(void *)(a1 + 1056) = 0;

    id v8 = *(void **)(a1 + 1064);
    *(void *)(a1 + 1064) = 0;

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 1216));
    id v10 = 0;
    if (objc_opt_respondsToSelector())
    {
      id v11 = [WeakRetained safariViewController:a1 activityItemsForURL:v5 title:v6];
      v25[0] = v5;
      v25[1] = v6;
      long long v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke;
      v23[3] = &unk_1E5C76948;
      id v13 = v12;
      id v24 = v13;
      id v14 = [v11 indexesOfObjectsPassingTest:v23];
      long long v15 = [v11 objectsAtIndexes:v14];

      objc_storeStrong((id *)(a1 + 1064), v12);
      if ([v15 count])
      {
        uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
        long long v17 = *(void **)(a1 + 1056);
        *(void *)(a1 + 1056) = v16;

        long long v18 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v15, "count"));
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke_2;
        v20[3] = &unk_1E5C76970;
        id v10 = v18;
        id v21 = v10;
        uint64_t v22 = a1;
        [v15 enumerateObjectsUsingBlock:v20];
      }
      else
      {
        id v10 = 0;
      }
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

uint64_t __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke(uint64_t a1, void *a2)
{
  return [a2 canPerformWithActivityItems:*(void *)(a1 + 32)];
}

void __61__SFSafariViewController__fetchCustomActivitiesForURL_title___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = [[SFCustomActivityProxy alloc] initWithActivity:v3];
  [*(id *)(a1 + 32) addObject:v6];
  objc_super v4 = *(void **)(*(void *)(a1 + 40) + 1056);
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[SFCustomActivityProxy activityProxyID](v6, "activityProxyID"));
  [v4 setObject:v3 forKey:v5];
}

- (id)_fetchExcludedActivityTypesForURL:(id)a3 title:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v9 = [WeakRetained safariViewController:self excludedActivityTypesForURL:v6 title:v7];
  }
  else
  {
    dispatch_time_t v9 = 0;
  }

  return v9;
}

- (void)remoteViewController:(id)a3 didFinishInitialLoad:(BOOL)a4
{
  if (!self->_hasNotifiedDelegateAboutInitialLoadCompleted)
  {
    BOOL v4 = a4;
    self->_hasNotifiedDelegateAboutInitialLoadCompleted = 1;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained safariViewController:self didCompleteInitialLoad:v4];
    }
  }
}

- (void)remoteViewController:(id)a3 executeCustomActivityProxyID:(id)a4
{
  id v6 = [(NSMutableDictionary *)self->_activitiesMap objectForKey:a4];
  [v6 prepareWithActivityItems:self->_activityItemsForCustomActivities];
  id v5 = [v6 activityViewController];
  if (v5) {
    [(SFSafariViewController *)self presentViewController:v5 animated:1 completion:0];
  }
  else {
    [v6 performActivity];
  }
}

- (void)remoteViewController:(id)a3 setSwipeGestureEnabled:(BOOL)a4
{
}

- (void)remoteViewController:(id)a3 hostApplicationOpenURL:(id)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  int v7 = [v6 _appAdoptsUISceneLifecycle];

  if (v7)
  {
    id v8 = [(SFSafariViewController *)self view];
    dispatch_time_t v9 = [v8 window];
    id v10 = [v9 windowScene];

    id v11 = [v10 delegate];
    uint64_t v18 = *MEMORY[0x1E4FB26A0];
    v19[0] = @"com.apple.SafariViewService";
    long long v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    if (objc_opt_respondsToSelector())
    {
      if (objc_opt_respondsToSelector()) {
        [MEMORY[0x1E4FB1B98] _optionsFromPayload:v12 sourceProcessHandle:0];
      }
      else {
      id v13 = [MEMORY[0x1E4FB1B98] _optionsFromDictionary:v12];
      }
      id v14 = (void *)[objc_alloc(MEMORY[0x1E4FB1A30]) initWithURL:v5 options:v13];
      long long v15 = [MEMORY[0x1E4F1CAD0] setWithObject:v14];
      [v11 scene:v10 openURLContexts:v15];
    }
  }
  else
  {
    uint64_t v16 = *MEMORY[0x1E4FB26A0];
    long long v17 = @"com.apple.SafariViewService";
    id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    id v11 = (void *)[objc_alloc(MEMORY[0x1E4FB1A28]) initWithURL:v5];
    [(id)*MEMORY[0x1E4FB2608] _applicationOpenURLAction:v11 payload:v10 origin:0];
  }
}

- (void)remoteViewController:(id)a3 initialLoadDidRedirectToURL:(id)a4
{
  id v5 = a4;
  if (!self->_hasRestartedViewService)
  {
    id v7 = v5;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained safariViewController:self initialLoadDidRedirectToURL:v7];
    }

    id v5 = v7;
  }
}

- (void)remoteViewController:(id)a3 didDecideShouldShowLinkPreviews:(BOOL)a4
{
}

- (void)remoteViewControllerWillOpenCurrentPageInBrowser:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained safariViewControllerWillOpenInBrowser:self];
  }
}

- (void)_forwardNotificationToViewService:(id)a3
{
  serviceProxy = self->_serviceProxy;
  id v4 = [a3 name];
  [(SFServiceViewControllerProtocol *)serviceProxy repostNotificationInViewService:v4];
}

- (void)interactiveDismissControllerDidBegin:(id)a3
{
}

- (void)interactiveDismissControllerDidEnd:(id)a3
{
  [(SFServiceViewControllerProtocol *)self->_serviceProxy setIsRunningTransitionAnimation:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained safariViewControllerDidFinish:self];
  }
}

- (void)interactiveDismissControllerDidCancel:(id)a3
{
}

- (void)serviceProxyWillQueueInvocation:(id)a3
{
  id v4 = a3;
  if (!self->_cancelViewServiceRequest && self->_adoptsPlatformConventions)
  {
    id v5 = v4;
    -[SFSafariViewController _connectToService]((uint64_t)self);
    id v4 = v5;
  }
}

- (_WKActivatedElementInfo)_activatedElementInfo
{
  return self->_activatedElementInfo;
}

- (void)_setActivatedElementInfo:(id)a3
{
}

- (NSArray)_previewActions
{
  return self->_previewActions;
}

- (void)_setPreviewActions:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (UIColor)preferredBarTintColor
{
  return self->_preferredBarTintColor;
}

- (UIColor)preferredControlTintColor
{
  return self->_preferredControlTintColor;
}

- (SFSafariViewControllerDismissButtonStyle)dismissButtonStyle
{
  return self->_dismissButtonStyle;
}

- (NSURL)initialURL
{
  return self->_initialURL;
}

- (BOOL)defersAddingRemoteViewController
{
  return self->_defersAddingRemoteViewController;
}

- (void)setDefersAddingRemoteViewController:(BOOL)a3
{
  self->_defersAddingRemoteViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialURL, 0);
  objc_storeStrong((id *)&self->_preferredControlTintColor, 0);
  objc_storeStrong((id *)&self->_preferredBarTintColor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previewActions, 0);
  objc_storeStrong((id *)&self->_activatedElementInfo, 0);
  objc_storeStrong((id *)&self->_linkPreviewHitTestView, 0);
  objc_storeStrong((id *)&self->_textPreviewViewController, 0);
  objc_storeStrong((id *)&self->_interactiveDismissController, 0);
  objc_storeStrong((id *)&self->_activityItemsForCustomActivities, 0);
  objc_storeStrong((id *)&self->_activitiesMap, 0);
  objc_storeStrong((id *)&self->_customActivities, 0);
  objc_storeStrong((id *)&self->_serviceProxy, 0);
  objc_storeStrong((id *)&self->_cancelViewServiceRequest, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_launchPlaceholderView, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_adoptsPlatformConventions, 0);
}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Ignoring call to handle URL externally because there was no window to present from.", v1, 2u);
}

- (void)_handleURLExternallyIfApplicableBypassingVisibilityCheck:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1A690B000, log, OS_LOG_TYPE_ERROR, "Ignoring call to handle URL externally because SFSafariViewController is not visible.", v1, 2u);
}

@end