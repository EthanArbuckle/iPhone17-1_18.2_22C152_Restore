@interface CKBrowserTransitionCoordinator
- (BOOL)_shouldRestrictToPortraitOrientationForPlugin:(id)a3;
- (BOOL)expandedAppViewControllerShouldDismissOnDragSuccess:(id)a3;
- (BOOL)isExpanded;
- (BOOL)isHostingRemoteKeyboardView;
- (BOOL)isPresentingFullScreenModal;
- (BOOL)shouldAlwaysShowAppTitle;
- (BOOL)shouldPresentModalFromPresentingViewController;
- (BOOL)underTest;
- (BOOL)updateBrowserSessionForPlugin:(id)a3 datasource:(id)a4;
- (BOOL)usePresentationWindowDuringTransition;
- (BOOL)wasCurrentBrowserExpanded;
- (CGRect)cachedCompactFrame;
- (CGSize)_clampedModalContentSizeForSize:(CGSize)result;
- (CKBrowserTransitionCoordinatorDelegate)delegate;
- (CKBrowserViewControllerProtocol)currentBrowser;
- (CKBrowserViewControllerProtocol)currentModalBrowser;
- (CKBrowserViewControllerSendDelegate)sendDelegate;
- (CKConversation)conversation;
- (CKExpandedAppViewController)expandedAppViewController;
- (UINavigationController)presentedModalBrowserNavigationController;
- (UIViewController)presentingViewController;
- (UIWindow)appWindow;
- (UIWindow)modalAppWindow;
- (UIWindow)preModalKeyWindow;
- (UIWindow)previousKeyWindow;
- (double)expandedAppViewControllerCollapsedContentHeight:(id)a3;
- (id)appIconOverride;
- (id)appTitleOverride;
- (id)modalPresentationViewController;
- (id)requestOwnershipOfBrowserForConsumer:(int64_t)a3;
- (id)transitionViewController;
- (int64_t)currentConsumer;
- (int64_t)lastTransitionReason;
- (void)dismissCurrentExpandedBrowserAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissCurrentFullScreenModalAnimated:(BOOL)a3 completion:(id)a4;
- (void)expandedAppViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4;
- (void)expandedAppViewController:(id)a3 wantsToSwitchToPlugin:(id)a4 datasource:(id)a5;
- (void)expandedAppViewControllerDidTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4;
- (void)expandedAppViewControllerSwitcherDidSelectAppManager:(id)a3;
- (void)expandedAppViewControllerSwitcherDidSelectAppStore:(id)a3;
- (void)expandedAppViewControllerWantsToCollapse:(id)a3;
- (void)presentPluginFullScreenModal:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5 animated:(BOOL)a6 completion:(id)a7;
- (void)presentPluginFullScreenModal:(id)a3 preferredContentSize:(CGSize)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)releaseOwnershipOfBrowserForConsumer:(int64_t)a3;
- (void)setAppWindow:(id)a3;
- (void)setCachedCompactFrame:(CGRect)a3;
- (void)setConversation:(id)a3;
- (void)setCurrentBrowser:(id)a3;
- (void)setCurrentConsumer:(int64_t)a3;
- (void)setCurrentModalBrowser:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setExpanded:(BOOL)a3;
- (void)setExpanded:(BOOL)a3 withReason:(int64_t)a4;
- (void)setExpandedAppViewController:(id)a3;
- (void)setLastTransitionReason:(int64_t)a3;
- (void)setModalAppWindow:(id)a3;
- (void)setPreModalKeyWindow:(id)a3;
- (void)setPresentedModalBrowserNavigationController:(id)a3;
- (void)setPresentingViewController:(id)a3;
- (void)setPreviousKeyWindow:(id)a3;
- (void)setSendDelegate:(id)a3;
- (void)setUnderTest:(BOOL)a3;
- (void)transitionCurrentBrowserToCollapsedPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)transitionCurrentBrowserToExpandedPresentationAnimated:(BOOL)a3 completion:(id)a4;
- (void)updateBrowser:(id)a3;
- (void)updateSupportedInterfaceOrientationsOfAppWindow:(id)a3 forPlugin:(id)a4;
@end

@implementation CKBrowserTransitionCoordinator

void __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_4(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) previousKeyWindow];
  [v2 makeKeyWindow];

  [*(id *)(a1 + 32) setPreviousKeyWindow:0];
  v3 = [*(id *)(a1 + 32) delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [*(id *)(a1 + 32) delegate];
    [v5 browserTransitionCoordinatorWillCollapseOrDismiss:*(void *)(a1 + 32) withReason:1];
  }
  v6 = [*(id *)(a1 + 32) delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) delegate];
    id v13 = [v8 appGrabberForBrowserTransitionCoordinator:*(void *)(a1 + 32)];
  }
  else
  {
    id v13 = 0;
  }
  v9 = [*(id *)(a1 + 32) expandedAppViewController];
  [*(id *)(a1 + 32) cachedCompactFrame];
  objc_msgSend(v9, "animateBrowserViewToTargetRect:grabberView:completion:", v13, *(void *)(a1 + 40));

  if (*(unsigned char *)(a1 + 48))
  {
    v10 = [*(id *)(a1 + 32) appWindow];
    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 presentationControllerWindowLevel];
    objc_msgSend(v10, "setWindowLevel:");
  }
  v12 = [*(id *)(a1 + 32) presentingViewController];
  [v12 reloadInputViews];
}

- (BOOL)isHostingRemoteKeyboardView
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v2 = objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", 0);
  v3 = [v2 windows];

  id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        char v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v8 = [v4 firstResponder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __83__CKBrowserTransitionCoordinator_dismissCurrentExpandedBrowserAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  [*(id *)(a1 + 40) setExpanded:0 withReason:3];
  if (*(unsigned char *)(a1 + 56))
  {
    v3 = [*(id *)(a1 + 40) appWindow];
    [v3 setHidden:1];

    id v4 = [*(id *)(a1 + 40) appWindow];
    uint64_t v5 = [v4 rootViewController];
    [v5 dismissViewControllerAnimated:0 completion:0];

    v6 = [*(id *)(a1 + 40) appWindow];
    [v6 setRootViewController:0];
  }
  [*(id *)(a1 + 40) setAppWindow:0];
  char v7 = [*(id *)(a1 + 40) delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    v9 = [*(id *)(a1 + 40) delegate];
    [v9 browserTransitionCoordinatorDidCollapseOrDismiss:*(void *)(a1 + 40) withReason:3];
  }
  objc_msgSend(*(id *)(a1 + 40), "setCachedCompactFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v10 = [*(id *)(a1 + 40) delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    long long v12 = [*(id *)(a1 + 40) delegate];
    [v12 reinsertAppGrabberViewForBrowserTransitionCoordinator:*(void *)(a1 + 40)];
  }
  uint64_t v13 = *(void *)(a1 + 48);
  if (v13) {
    (*(void (**)(void))(v13 + 16))();
  }
  char v14 = objc_opt_respondsToSelector();
  v15 = *(void **)(a1 + 32);
  if (v14)
  {
    return [v15 deferredForceTearDownRemoteView];
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      v17 = *(void **)(a1 + 32);
      return [v17 forceTearDownRemoteView];
    }
  }
  return result;
}

- (void)presentPluginFullScreenModal:(id)a3 datasource:(id)a4 preferredContentSize:(CGSize)a5 animated:(BOOL)a6 completion:(id)a7
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v64 = a4;
  id v63 = a7;
  BOOL v14 = [(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition];
  if ([(CKBrowserTransitionCoordinator *)self isPresentingFullScreenModal])
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Already presenting extension in full screen modal.", buf, 2u);
      }
    }
    goto LABEL_52;
  }
  if (v13)
  {
    BOOL v60 = a6;
    BOOL v61 = v14;
    uint64_t v16 = objc_msgSend(objc_alloc((Class)objc_msgSend(v13, "browserClass")), "initWithBalloonPlugin:dataSource:", v13, v64);
    [v16 setIsPrimaryViewController:0];
    if (CKIsRunningInMacCatalyst())
    {
      v17 = [v13 identifier];
      v18 = IMBalloonExtensionIDWithSuffix();
      int v62 = [v17 isEqualToString:v18];
    }
    else
    {
      int v62 = 0;
    }
    if (+[CKUtilities isIpad])
    {
      v21 = [v13 identifier];
      v22 = IMBalloonExtensionIDWithSuffix();
      int v23 = [v21 isEqualToString:v22];
    }
    else
    {
      int v23 = 0;
    }
    v24 = [v13 identifier];
    v25 = IMBalloonExtensionIDWithSuffix();
    int v59 = [v24 isEqualToString:v25];

    if (v62) {
      objc_msgSend(v16, "setPreferredContentSize:", 580.0, 548.0);
    }
    if (objc_opt_respondsToSelector()) {
      [v16 loadRemoteViewWithCompletion:0];
    }
    if (objc_opt_respondsToSelector()) {
      [v16 setCurrentBrowserConsumer:3];
    }
    [(CKBrowserTransitionCoordinator *)self setCurrentModalBrowser:v16];
    v26 = [[CKFullscreenBrowserNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
    [(CKFullscreenBrowserNavigationController *)v26 setModalInPresentation:v23 ^ 1u];
    v27 = [CKFullScreenCardAppViewController alloc];
    v28 = [(CKBrowserTransitionCoordinator *)self conversation];
    v29 = [(CKFullScreenCardAppViewController *)v27 initWithConversation:v28 plugin:v13];

    [(CKFullScreenCardAppViewController *)v29 setContentViewController:v16];
    [(CKFullScreenCardAppViewController *)v29 setDelegate:self];
    v30 = [(CKBrowserTransitionCoordinator *)self sendDelegate];
    [(CKFullScreenCardAppViewController *)v29 setSendDelegate:v30];

    v72 = v29;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
    [(CKFullscreenBrowserNavigationController *)v26 setViewControllers:v31];

    if ([(CKFullScreenCardAppViewController *)v29 conformsToProtocol:&unk_1EDF4B668])
    {
      v32 = [(CKFullscreenBrowserNavigationController *)v26 presentationController];
      [v32 setDelegate:v29];

      if (v62)
      {
        double v33 = 548.0;
        double v34 = 580.0;
      }
      else if (v59 && (IMSharedHelperDeviceIsiPad() & 1) != 0)
      {
        double v34 = 640.0;
        double v33 = 640.0;
      }
      else
      {
        -[CKBrowserTransitionCoordinator _clampedModalContentSizeForSize:](self, "_clampedModalContentSizeForSize:", width, height);
      }
      -[CKFullscreenBrowserNavigationController setPreferredContentSize:](v26, "setPreferredContentSize:", v34, v33);
    }
    if (objc_opt_respondsToSelector())
    {
      v35 = [(CKFullScreenCardAppViewController *)v29 parentTransitioningDelegate];
      [(CKFullscreenBrowserNavigationController *)v26 setTransitioningDelegate:v35];
    }
    v36 = [(CKBrowserTransitionCoordinator *)self modalAppWindow];
    if (v36) {
      BOOL v37 = 0;
    }
    else {
      BOOL v37 = v61;
    }

    if (v37)
    {
      v38 = [v16 balloonPlugin];
      BOOL v39 = [(CKBrowserTransitionCoordinator *)self _shouldRestrictToPortraitOrientationForPlugin:v38];

      int v40 = IMSharedHelperDeviceIsiPad();
      v41 = [CKPresentationControllerWindow alloc];
      v42 = [MEMORY[0x1E4F42738] sharedApplication];
      v43 = [v42 keyWindow];
      [v43 bounds];
      v44 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v41, "initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", 0, v59 & ~v40, v39);

      v45 = [MEMORY[0x1E4F42D90] mainScreen];
      [(CKPresentationControllerWindow *)v44 setScreen:v45];

      [(CKBrowserTransitionCoordinator *)self setModalAppWindow:v44];
    }
    else
    {
      if (!v61)
      {
        [(CKBrowserTransitionCoordinator *)self setPresentedModalBrowserNavigationController:v26];
        goto LABEL_45;
      }
      if (IMOSLoggingEnabled())
      {
        v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_18EF18000, v46, OS_LOG_TYPE_INFO, "CKBrowserTransitionCoordinator: FullScreenModal presentation: appWindow unexpected not nil. We didn't cleanup correctly.", buf, 2u);
        }
      }
    }
    [(CKBrowserTransitionCoordinator *)self setPresentedModalBrowserNavigationController:v26];
    v47 = [(CKBrowserTransitionCoordinator *)self modalAppWindow];
    [v47 setWindowLevel:*MEMORY[0x1E4F43F20]];

    v48 = [MEMORY[0x1E4F43058] keyWindow];
    [(CKBrowserTransitionCoordinator *)self setPreModalKeyWindow:v48];

    v49 = [(CKBrowserTransitionCoordinator *)self modalAppWindow];
    [v49 makeKeyAndVisible];

LABEL_45:
    v50 = [(CKBrowserTransitionCoordinator *)self modalPresentationViewController];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke;
    aBlock[3] = &unk_1E562B100;
    id v51 = v50;
    id v66 = v51;
    v52 = v26;
    v67 = v52;
    BOOL v70 = v60;
    char v71 = v62;
    long long v69 = xmmword_18F81D8E0;
    id v53 = v16;
    id v68 = v53;
    v54 = (void (**)(void))_Block_copy(aBlock);
    v55 = [(CKBrowserTransitionCoordinator *)self delegate];
    char v56 = objc_opt_respondsToSelector();

    if (v56)
    {
      v57 = [(CKBrowserTransitionCoordinator *)self delegate];
      [v57 browserTransitionCoordinator:self willPresentBrowserModally:v53];
    }
    if (v61
      || ([v51 presentedViewController],
          v58 = objc_claimAutoreleasedReturnValue(),
          v58,
          !v58))
    {
      v54[2](v54);
    }
    else
    {
      [v51 dismissViewControllerAnimated:1 completion:v54];
    }

    goto LABEL_52;
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v74 = (id)objc_opt_class();
      id v20 = v74;
      _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%@: No plugin provided!", buf, 0xCu);
    }
  }
LABEL_52:
}

- (void)dismissCurrentExpandedBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  v6 = (void (**)(void))a4;
  if ([(CKBrowserTransitionCoordinator *)self isExpanded])
  {
    char v7 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
    [(CKBrowserTransitionCoordinator *)self releaseOwnershipOfBrowserForConsumer:2];
    BOOL v8 = [(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKBrowserTransitionCoordinator_dismissCurrentExpandedBrowserAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E56231C0;
    id v9 = v7;
    id v23 = v9;
    v24 = self;
    BOOL v26 = v8;
    v25 = v6;
    v10 = _Block_copy(aBlock);
    if (v8)
    {
      char v11 = [(CKBrowserTransitionCoordinator *)self appWindow];
      long long v12 = +[CKUIBehavior sharedBehaviors];
      [v12 presentationControllerWindowLevel];
      objc_msgSend(v11, "setWindowLevel:");
    }
    id v13 = [(CKBrowserTransitionCoordinator *)self delegate];
    char v14 = objc_opt_respondsToSelector();

    if (v14)
    {
      v15 = [(CKBrowserTransitionCoordinator *)self delegate];
      [v15 browserTransitionCoordinatorWillCollapseOrDismiss:self withReason:3];
    }
    uint64_t v16 = [(CKBrowserTransitionCoordinator *)self expandedAppViewController];
    [v16 hideDimmingView];

    v17 = [(CKBrowserTransitionCoordinator *)self previousKeyWindow];
    [v17 makeKeyWindow];

    [(CKBrowserTransitionCoordinator *)self setPreviousKeyWindow:0];
    v18 = [(CKBrowserTransitionCoordinator *)self transitionViewController];
    [v18 dismissViewControllerAnimated:v4 completion:v10];

    [(CKBrowserTransitionCoordinator *)self setExpandedAppViewController:0];
    v19 = [(CKBrowserTransitionCoordinator *)self presentingViewController];
    [v19 reloadInputViews];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Collapse transition did not occur, already collapsed", v21, 2u);
      }
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

void __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke(uint64_t a1)
{
  v3 = *(void **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 72);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke_2;
  v5[3] = &unk_1E562B0D8;
  char v9 = *(unsigned char *)(a1 + 73);
  id v6 = v2;
  long long v8 = *(_OWORD *)(a1 + 56);
  id v7 = *(id *)(a1 + 48);
  [v3 presentViewController:v6 animated:v4 completion:v5];
}

- (BOOL)wasCurrentBrowserExpanded
{
  v3 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  uint64_t v5 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
  char v6 = [v5 wasExpandedPresentation];

  return v6;
}

- (BOOL)usePresentationWindowDuringTransition
{
  return !CKIsRunningInMacCatalyst()
      && !IMIsRunningIniMessageAppsViewService()
      && !IMIsRunningIniMessageAppExtension()
      && CKIsRunningInInCallService() == 0;
}

- (BOOL)shouldPresentModalFromPresentingViewController
{
  return CKIsRunningInMacCatalyst() != 0;
}

- (id)modalPresentationViewController
{
  v3 = [(CKBrowserTransitionCoordinator *)self transitionViewController];
  if ([(CKBrowserTransitionCoordinator *)self shouldPresentModalFromPresentingViewController])
  {
    uint64_t v4 = [(CKBrowserTransitionCoordinator *)self presentingViewController];
  }
  else
  {
    if (![(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition])goto LABEL_6; {
    uint64_t v5 = [(CKBrowserTransitionCoordinator *)self modalAppWindow];
    }
    uint64_t v4 = [v5 rootViewController];

    v3 = v5;
  }

  v3 = (void *)v4;
LABEL_6:

  return v3;
}

- (id)transitionViewController
{
  if ([(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition])
  {
    goto LABEL_11;
  }
  v3 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v5 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v6 = [v5 transitionsPresentationViewController];
  id v7 = objc_msgSend(v6, "__ck_topViewController");

  if (!v7)
  {
LABEL_11:
    long long v8 = [(CKBrowserTransitionCoordinator *)self appWindow];
    id v7 = [v8 rootViewController];

    if (!v7)
    {
      char v9 = [MEMORY[0x1E4F43058] keyWindow];
      id v7 = [v9 rootViewController];
    }
  }

  return v7;
}

- (BOOL)updateBrowserSessionForPlugin:(id)a3 datasource:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v8 = [v6 identifier];
  char v9 = [v8 isEqualToString:*MEMORY[0x1E4F6CBA0]];

  v10 = [(CKBrowserTransitionCoordinator *)self appWindow];
  [(CKBrowserTransitionCoordinator *)self updateSupportedInterfaceOrientationsOfAppWindow:v10 forPlugin:v6];

  if (IMOSLoggingEnabled())
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v6 identifier];
      int v25 = 138412290;
      id v26 = v12;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "updateBrowserSessionForPlugin - %@", (uint8_t *)&v25, 0xCu);
    }
  }
  id v13 = [(CKBrowserTransitionCoordinator *)self conversation];
  char v14 = [v13 recipientStrings];
  int v15 = [v6 shouldShowForRecipients:v14];

  if (!v15) {
    goto LABEL_18;
  }
  if ((v9 & 1) == 0)
  {
    if (![(CKBrowserTransitionCoordinator *)self currentConsumer])
    {
      -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      uint64_t v16 = +[CKBalloonPluginManager sharedInstance];
      v22 = [v6 identifier];
      v17 = [v16 viewControllerForPluginIdentifier:v22 dataSource:v7];

      goto LABEL_14;
    }
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [v6 identifier];
        unint64_t v20 = [(CKBrowserTransitionCoordinator *)self currentConsumer];
        if (v20 > 3) {
          v21 = 0;
        }
        else {
          v21 = off_1E562B120[v20];
        }
        int v25 = 138412546;
        id v26 = v19;
        __int16 v27 = 2112;
        v28 = v21;
        _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "Request to update browser session for plugin %@ denied as %@ currently has lock on browser", (uint8_t *)&v25, 0x16u);
      }
    }
LABEL_18:
    BOOL v23 = 0;
    goto LABEL_19;
  }
  -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v16 = +[CKBalloonPluginManager sharedInstance];
  v17 = [v16 digitalTouchViewControllerWithDataSource:v7];
LABEL_14:

  [(CKBrowserTransitionCoordinator *)self updateBrowser:v17];
  BOOL v23 = 1;
LABEL_19:

  return v23;
}

- (void)updateBrowser:(id)a3
{
  id v40 = a3;
  char v4 = [(CKBrowserTransitionCoordinator *)self sendDelegate];
  [v40 setSendDelegate:v4];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [(CKBrowserTransitionCoordinator *)self conversation];
    id v6 = [v5 senderIdentifier];
    [v40 setSender:v6];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = [(CKBrowserTransitionCoordinator *)self conversation];
    long long v8 = [v7 recipientStrings];

    [v40 setRecipients:v8];
  }
  if (objc_opt_respondsToSelector())
  {
    char v9 = [(CKBrowserTransitionCoordinator *)self conversation];
    v10 = [v9 chat];
    char v11 = [v10 guid];
    [v40 setConversationID:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    long long v12 = [(CKBrowserTransitionCoordinator *)self conversation];
    id v13 = [v12 chat];
    char v14 = [v13 engramID];
    [v40 setConversationEngramID:v14];
  }
  if (objc_opt_respondsToSelector()) {
    int v15 = [v40 isLoaded] ^ 1;
  }
  else {
    int v15 = 0;
  }
  id v16 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
  if (v16 == v40) {
    int v17 = v15;
  }
  else {
    int v17 = 1;
  }

  v18 = [(CKBrowserTransitionCoordinator *)self currentBrowser];

  if (v18)
  {
    if (v17)
    {
      id v19 = [(CKBrowserTransitionCoordinator *)self delegate];
      char v20 = objc_opt_respondsToSelector();

      if (v20)
      {
        v21 = [(CKBrowserTransitionCoordinator *)self delegate];
        v22 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
        [v21 browserTransitionCoordinator:self browserWillBecomeInactive:v22];
      }
    }
  }
  BOOL v23 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v24 = objc_opt_respondsToSelector();

  if (v24)
  {
    int v25 = [(CKBrowserTransitionCoordinator *)self delegate];
    [v25 browserTransitionCoordinator:self preferredSizeForBrowser:v40];
    double v27 = v26;
    double v29 = v28;

    v30 = [v40 view];
    [v30 frame];
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    double v38 = v37;

    if ((v27 != *MEMORY[0x1E4F1DB30] || v29 != *(double *)(MEMORY[0x1E4F1DB30] + 8)) && (v27 != v36 || v29 != v38))
    {
      BOOL v39 = [v40 view];
      objc_msgSend(v39, "setFrame:", v32, v34, v27, v29);
    }
  }
  if (v17
    && (objc_opt_respondsToSelector() & 1) != 0
    && ![(CKBrowserTransitionCoordinator *)self underTest])
  {
    [v40 loadRemoteViewWithCompletion:0];
  }
  if (objc_opt_respondsToSelector()) {
    [v40 prepareForDisplay];
  }
  [(CKBrowserTransitionCoordinator *)self setCurrentBrowser:v40];
}

- (id)requestOwnershipOfBrowserForConsumer:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(CKBrowserTransitionCoordinator *)self currentConsumer]
    && [(CKBrowserTransitionCoordinator *)self currentConsumer] != a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        if ((unint64_t)a3 > 3) {
          id v7 = 0;
        }
        else {
          id v7 = off_1E562B120[a3];
        }
        unint64_t v8 = [(CKBrowserTransitionCoordinator *)self currentConsumer];
        if (v8 > 3) {
          char v9 = 0;
        }
        else {
          char v9 = off_1E562B120[v8];
        }
        int v11 = 138412546;
        long long v12 = v7;
        __int16 v13 = 2112;
        char v14 = v9;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "%@ tried to take browser ownership but %@ is the current owner", (uint8_t *)&v11, 0x16u);
      }
    }
    uint64_t v5 = 0;
  }
  else
  {
    [(CKBrowserTransitionCoordinator *)self setCurrentConsumer:a3];
    uint64_t v5 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
  }

  return v5;
}

- (void)releaseOwnershipOfBrowserForConsumer:(int64_t)a3
{
  if ([(CKBrowserTransitionCoordinator *)self currentConsumer] == a3)
  {
    [(CKBrowserTransitionCoordinator *)self setCurrentConsumer:0];
  }
}

- (BOOL)_shouldRestrictToPortraitOrientationForPlugin:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F42948];
  id v4 = a3;
  uint64_t v5 = [v3 currentDevice];
  uint64_t v6 = [v5 userInterfaceIdiom];

  unint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFBLL;
  unint64_t v8 = [v4 identifier];
  char v9 = [v8 isEqualToString:*MEMORY[0x1E4F6CB80]];

  v10 = [v4 identifier];

  char v11 = [v10 isEqualToString:*MEMORY[0x1E4F6CBA0]];
  if (v7 == 1) {
    return 0;
  }
  else {
    return v9 | v11;
  }
}

- (void)updateSupportedInterfaceOrientationsOfAppWindow:(id)a3 forPlugin:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v8;
    objc_msgSend(v7, "setRestrictedToPortraitOrientation:", -[CKBrowserTransitionCoordinator _shouldRestrictToPortraitOrientationForPlugin:](self, "_shouldRestrictToPortraitOrientationForPlugin:", v6));
  }
}

- (void)transitionCurrentBrowserToExpandedPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(CKBrowserTransitionCoordinator *)self isExpanded])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Fullscreen transition did not occur, already fullscreen", buf, 2u);
      }
    }
  }
  else
  {
    v78 = v5;
    id v7 = [(CKBrowserTransitionCoordinator *)self requestOwnershipOfBrowserForConsumer:2];
    if (v7)
    {
      if (objc_opt_respondsToSelector()) {
        [v7 beginSuppressingAppearanceMethods];
      }
      v76 = [v7 view];
      id v8 = [v76 window];

      if (v8)
      {
        char v9 = [v7 view];
        v10 = [v9 window];
        uint64_t v75 = [v10 snapshotViewAfterScreenUpdates:0];

        char v11 = [v7 view];
        long long v12 = [v11 superview];
        __int16 v13 = [v7 view];
        [v13 frame];
        objc_msgSend(v12, "convertRect:toView:", 0);
        CGFloat x = v14;
        CGFloat MaxY = v16;
        CGFloat width = v18;
        CGFloat height = v20;
      }
      else
      {
        [v76 frame];
        CGFloat x = v99.origin.x;
        CGFloat width = v99.size.width;
        CGFloat height = v99.size.height;
        CGFloat MaxY = CGRectGetMaxY(v99);
        uint64_t v75 = 0;
      }
      BOOL v77 = [(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition];
      int v25 = [(CKBrowserTransitionCoordinator *)self delegate];
      char v26 = objc_opt_respondsToSelector();

      double v27 = height;
      double v28 = width;
      double v29 = MaxY;
      double v30 = x;
      if (v26)
      {
        double v31 = [(CKBrowserTransitionCoordinator *)self delegate];
        [v31 cachedCompactFrameInWindowCoordsForBrowserTransitionCoordinator:self];
        double v30 = v32;
        double v29 = v33;
        double v28 = v34;
        double v27 = v35;
      }
      -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", v30, v29, v28, v27);
      if (v77)
      {
        double v36 = [(CKBrowserTransitionCoordinator *)self appWindow];

        if (v36)
        {
          double v37 = [(CKBrowserTransitionCoordinator *)self appWindow];
          [v37 setHidden:1];

          double v38 = [(CKBrowserTransitionCoordinator *)self appWindow];
          BOOL v39 = [v38 rootViewController];
          [v39 dismissViewControllerAnimated:0 completion:0];

          id v40 = [(CKBrowserTransitionCoordinator *)self appWindow];
          [v40 setRootViewController:0];

          [(CKBrowserTransitionCoordinator *)self setAppWindow:0];
        }
      }
      if (objc_opt_respondsToSelector()) {
        [v7 viewWillTransitionToExpandedPresentation];
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke;
      aBlock[3] = &unk_1E5622BA8;
      id v41 = v7;
      id v92 = v41;
      v93 = self;
      id v94 = v78;
      v73 = _Block_copy(aBlock);
      if (IMOSLoggingEnabled())
      {
        v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          v43 = [v41 balloonPlugin];
          v44 = [v43 identifier];
          *(_DWORD *)buf = 138412290;
          v97 = v44;
          _os_log_impl(&dword_18EF18000, v42, OS_LOG_TYPE_INFO, "Fullscreen transition initiated for %@", buf, 0xCu);
        }
      }
      v45 = objc_msgSend(v41, "view", v73);
      v46 = [v45 window];

      if (v77)
      {
        v47 = [(CKBrowserTransitionCoordinator *)self presentingViewController];
        v48 = [v47 view];
        v49 = [v48 window];

        v50 = [v49 windowScene];
        id v51 = [v41 balloonPlugin];
        BOOL v52 = [(CKBrowserTransitionCoordinator *)self _shouldRestrictToPortraitOrientationForPlugin:v51];

        id v53 = [CKPresentationControllerWindow alloc];
        if (v50)
        {
          [v49 bounds];
          v54 = -[CKPresentationControllerWindow initWithWindowScene:frame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v53, "initWithWindowScene:frame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", v50, 0, 0, v52);
        }
        else
        {
          char v56 = [MEMORY[0x1E4F42738] sharedApplication];
          v57 = [v56 keyWindow];
          [v57 bounds];
          v54 = -[CKPresentationControllerWindow initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:](v53, "initWithFrame:allowsRotation:allowsStatusBarChanges:restrictedToPortraitOrientation:", 0, 0, v52);

          v46 = v56;
        }

        [(CKPresentationControllerWindow *)v54 addSubview:v75];
        [(CKPresentationControllerWindow *)v54 bounds];
        objc_msgSend(v75, "setFrame:");
        [(CKPresentationControllerWindow *)v54 setHidden:0];

        uint64_t v55 = 0;
        v46 = v54;
      }
      else
      {
        uint64_t v55 = 5;
      }
      [(CKBrowserTransitionCoordinator *)self setAppWindow:v46];
      [v41 willMoveToParentViewController:0];
      v58 = [v41 view];
      [v58 removeFromSuperview];

      [v41 removeFromParentViewController];
      int v59 = [[CKFullscreenBrowserNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
      BOOL v60 = [CKExpandedAppViewController alloc];
      BOOL v61 = [(CKBrowserTransitionCoordinator *)self conversation];
      int v62 = [v41 balloonPlugin];
      id v63 = [(CKExpandedAppViewController *)v60 initWithConversation:v61 plugin:v62];

      [(CKExpandedAppViewController *)v63 setContentViewController:v41];
      id v64 = [v41 view];
      [v64 setAlpha:1.0];

      [(CKExpandedAppViewController *)v63 setDelegate:self];
      v95 = v63;
      v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v95 count:1];
      [(CKFullscreenBrowserNavigationController *)v59 setViewControllers:v65];

      [(CKFullscreenBrowserNavigationController *)v59 setModalPresentationStyle:v55];
      [(CKBrowserTransitionCoordinator *)self setExpandedAppViewController:v63];
      id v66 = [(CKFullscreenBrowserNavigationController *)v59 view];
      [v66 setHidden:1];

      v67 = [(CKBrowserTransitionCoordinator *)self transitionViewController];
      v79[0] = MEMORY[0x1E4F143A8];
      v79[1] = 3221225472;
      v79[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_81;
      v79[3] = &unk_1E562B0B0;
      BOOL v90 = v77;
      id v80 = v46;
      id v81 = v75;
      v82 = self;
      v83 = v63;
      CGFloat v86 = x;
      CGFloat v87 = MaxY;
      CGFloat v88 = width;
      CGFloat v89 = height;
      v84 = v59;
      id v85 = v74;
      id v68 = v59;
      id v69 = v74;
      BOOL v70 = v63;
      id v71 = v75;
      id v72 = v46;
      [v67 presentViewController:v68 animated:0 completion:v79];
    }
    else if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unint64_t v23 = [(CKBrowserTransitionCoordinator *)self currentConsumer];
        if (v23 > 3) {
          char v24 = 0;
        }
        else {
          char v24 = off_1E562B120[v23];
        }
        *(_DWORD *)buf = 138412290;
        v97 = v24;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Fullscreen transition failed, %@ is current browser owner", buf, 0xCu);
      }
    }
    id v5 = v78;
  }
}

uint64_t __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) viewDidTransitionToExpandedPresentation];
  }
  [*(id *)(a1 + 40) setExpanded:1 withReason:0];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) endSuppressingAppearanceMethods];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) _updateContentOverlayInsetsForSelfAndChildren];
  }
  v2 = [*(id *)(a1 + 40) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 40) delegate];
    [v4 browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:*(void *)(a1 + 40) withReason:0];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2;
  v10[3] = &unk_1E5620C40;
  v10[4] = *(void *)(a1 + 40);
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v10];
  id v5 = [*(id *)(a1 + 32) view];
  [v5 setAlpha:1.0];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [*(id *)(a1 + 32) balloonPlugin];
      id v8 = [v7 identifier];
      *(_DWORD *)buf = 138412290;
      long long v12 = v8;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Fullscreen transition complete for %@", buf, 0xCu);
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) expandedAppViewController];
  [v1 reloadInputViews];
}

void __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_81(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 112)) {
    [*(id *)(a1 + 32) bringSubviewToFront:*(void *)(a1 + 40)];
  }
  v2 = [*(id *)(a1 + 48) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 48) delegate];
    [v4 browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:*(void *)(a1 + 48) withReason:0];
  }
  id v5 = [*(id *)(a1 + 48) delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [*(id *)(a1 + 48) delegate];
    id v8 = [v7 appGrabberForBrowserTransitionCoordinator:*(void *)(a1 + 48)];
  }
  else
  {
    id v8 = 0;
  }
  objc_msgSend(*(id *)(a1 + 56), "animateBrowserViewFromSourceRect:interactive:grabberView:completion:", 0, v8, *(void *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104));
  char v9 = [*(id *)(a1 + 64) view];
  [v9 setHidden:0];

  if (*(unsigned char *)(a1 + 112))
  {
    v10 = (void *)MEMORY[0x1E4F42FF0];
    uint64_t v13 = MEMORY[0x1E4F143A8];
    uint64_t v14 = 3221225472;
    uint64_t v15 = __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2_86;
    double v16 = &unk_1E5620AF8;
    id v11 = *(id *)(a1 + 32);
    uint64_t v12 = *(void *)(a1 + 48);
    id v17 = v11;
    uint64_t v18 = v12;
    [v10 performWithoutAnimation:&v13];
  }
  objc_msgSend(*(id *)(a1 + 40), "removeFromSuperview", v13, v14, v15, v16);
}

uint64_t __100__CKBrowserTransitionCoordinator_transitionCurrentBrowserToExpandedPresentationAnimated_completion___block_invoke_2_86(uint64_t a1)
{
  [*(id *)(a1 + 32) setWindowLevel:*MEMORY[0x1E4F43F20]];
  v2 = *(void **)(a1 + 40);
  char v3 = [MEMORY[0x1E4F43058] keyWindow];
  [v2 setPreviousKeyWindow:v3];

  id v4 = *(void **)(a1 + 32);

  return [v4 makeKeyWindow];
}

- (void)transitionCurrentBrowserToCollapsedPresentationAnimated:(BOOL)a3 completion:(id)a4
{
  id v5 = (void (**)(void))a4;
  if ([(CKBrowserTransitionCoordinator *)self isExpanded])
  {
    [(CKBrowserTransitionCoordinator *)self releaseOwnershipOfBrowserForConsumer:2];
    char v6 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
    id v7 = [v6 balloonPlugin];
    id v8 = [v7 identifier];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6CBA0]];

    if (v9) {
      [v6 setBalloonPluginDataSource:0];
    }
    if (objc_opt_respondsToSelector()) {
      [v6 beginSuppressingAppearanceMethods];
    }
    if (objc_opt_respondsToSelector()) {
      [v6 viewWillTransitionToCompactPresentation];
    }
    BOOL v10 = [(CKBrowserTransitionCoordinator *)self usePresentationWindowDuringTransition];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E56231C0;
    id v21 = v6;
    v22 = self;
    unint64_t v23 = v5;
    BOOL v24 = v10;
    id v11 = v6;
    uint64_t v12 = _Block_copy(aBlock);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_4;
    v17[3] = &unk_1E5628248;
    v17[4] = self;
    id v18 = v12;
    BOOL v19 = v10;
    id v13 = v12;
    uint64_t v14 = (void (**)(void))_Block_copy(v17);
    v14[2]();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v16 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Collapse transition did not occur, already collapsed", v16, 2u);
      }
    }
    if (v5) {
      v5[2](v5);
    }
  }
}

void __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  [*(id *)(a1 + 40) setExpanded:0 withReason:1];
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) viewDidTransitionToCompactPresentation];
  }
  char v3 = [*(id *)(a1 + 40) expandedAppViewController];
  id v4 = [v3 view];
  id v5 = [v4 window];
  char v6 = [v5 snapshotViewAfterScreenUpdates:0];

  id v7 = [*(id *)(a1 + 40) appWindow];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(v6, "setFrame:", v9, v11, v13, v15);
  double v16 = [*(id *)(a1 + 40) appWindow];
  [v16 addSubview:v6];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) _updateContentOverlayInsetsForSelfAndChildren];
  }
  id v17 = [*(id *)(a1 + 40) appWindow];
  [v17 bringSubviewToFront:v6];

  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) endSuppressingAppearanceMethods];
  }
  id v18 = [*(id *)(a1 + 40) delegate];
  char v19 = objc_opt_respondsToSelector();

  if (v19)
  {
    double v20 = [*(id *)(a1 + 40) delegate];
    [v20 browserTransitionCoordinatorDidCollapseOrDismiss:*(void *)(a1 + 40) withReason:1];
  }
  id v21 = [*(id *)(a1 + 40) delegate];
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    unint64_t v23 = [*(id *)(a1 + 40) delegate];
    [v23 reinsertAppGrabberViewForBrowserTransitionCoordinator:*(void *)(a1 + 40)];
  }
  uint64_t v24 = *(void *)(a1 + 48);
  if (v24) {
    (*(void (**)(void))(v24 + 16))();
  }
  int v25 = (void *)MEMORY[0x1E4F42FF0];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_2;
  v30[3] = &unk_1E5620C40;
  id v31 = v6;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_3;
  v28[3] = &unk_1E56287B0;
  char v29 = *(unsigned char *)(a1 + 56);
  v28[4] = *(void *)(a1 + 40);
  id v26 = v6;
  [v25 animateWithDuration:0 delay:v30 options:v28 animations:0.3 completion:0.1];
  objc_msgSend(*(id *)(a1 + 40), "setCachedCompactFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [*(id *)(a1 + 40) setExpandedAppViewController:0];
  double v27 = [*(id *)(a1 + 40) presentingViewController];
  [v27 reloadInputViews];
}

uint64_t __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __101__CKBrowserTransitionCoordinator_transitionCurrentBrowserToCollapsedPresentationAnimated_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = [*(id *)(a1 + 32) appWindow];
    [v2 setHidden:1];
  }
  [*(id *)(a1 + 32) setExpandedAppViewController:0];
  char v3 = [*(id *)(a1 + 32) transitionViewController];
  [v3 dismissViewControllerAnimated:0 completion:0];

  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = [*(id *)(a1 + 32) appWindow];
    [v4 setRootViewController:0];
  }
  id v5 = *(void **)(a1 + 32);

  return [v5 setAppWindow:0];
}

- (CGSize)_clampedModalContentSizeForSize:(CGSize)result
{
  if (result.width == 0.0) {
    result.CGFloat width = 624.0;
  }
  if (result.height == 0.0) {
    result.CGFloat height = 746.0;
  }
  return result;
}

- (void)presentPluginFullScreenModal:(id)a3 preferredContentSize:(CGSize)a4 animated:(BOOL)a5 completion:(id)a6
{
}

void __115__CKBrowserTransitionCoordinator_presentPluginFullScreenModal_datasource_preferredContentSize_animated_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    double v2 = *(double *)(a1 + 48);
    double v3 = *(double *)(a1 + 56);
    id v4 = [*(id *)(a1 + 32) view];
    id v5 = [v4 window];
    char v6 = [v5 windowScene];
    id v7 = [v6 sizeRestrictions];
    objc_msgSend(v7, "setMaximumSize:", v2, v3);

    double v8 = *(double *)(a1 + 48);
    double v9 = *(double *)(a1 + 56);
    double v10 = [*(id *)(a1 + 32) view];
    double v11 = [v10 window];
    double v12 = [v11 windowScene];
    double v13 = [v12 sizeRestrictions];
    objc_msgSend(v13, "setMinimumSize:", v8, v9);
  }
  id v14 = [*(id *)(a1 + 40) view];
  [v14 setAlpha:1.0];
}

- (BOOL)isPresentingFullScreenModal
{
  double v2 = [(CKBrowserTransitionCoordinator *)self presentedModalBrowserNavigationController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)dismissCurrentFullScreenModalAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  char v6 = (void (**)(void))a4;
  if ([(CKBrowserTransitionCoordinator *)self isPresentingFullScreenModal])
  {
    id v7 = [(CKBrowserTransitionCoordinator *)self currentModalBrowser];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __83__CKBrowserTransitionCoordinator_dismissCurrentFullScreenModalAnimated_completion___block_invoke;
    aBlock[3] = &unk_1E5622BA8;
    id v8 = v7;
    id v18 = v8;
    char v19 = self;
    double v20 = v6;
    double v9 = _Block_copy(aBlock);
    double v10 = [(CKBrowserTransitionCoordinator *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      double v12 = [(CKBrowserTransitionCoordinator *)self delegate];
      [v12 browserTransitionCoordinatorWillCollapseOrDismiss:self withReason:5];
    }
    double v13 = [(CKBrowserTransitionCoordinator *)self preModalKeyWindow];
    [v13 makeKeyWindow];

    [(CKBrowserTransitionCoordinator *)self setPreModalKeyWindow:0];
    id v14 = [(CKBrowserTransitionCoordinator *)self presentedModalBrowserNavigationController];
    [v14 dismissViewControllerAnimated:v4 completion:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      double v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v16 = 0;
        _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_INFO, "Modal dismissal did not occur, not presenting modal", v16, 2u);
      }
    }
    if (v6) {
      v6[2](v6);
    }
  }
}

uint64_t __83__CKBrowserTransitionCoordinator_dismissCurrentFullScreenModalAnimated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  double v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  BOOL v3 = [*(id *)(a1 + 40) modalAppWindow];
  [v3 setHidden:1];

  BOOL v4 = [*(id *)(a1 + 40) modalAppWindow];
  uint64_t v5 = [v4 rootViewController];
  [(id)v5 dismissViewControllerAnimated:0 completion:0];

  char v6 = [*(id *)(a1 + 40) delegate];
  LOBYTE(v5) = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [*(id *)(a1 + 40) delegate];
    [v7 browserTransitionCoordinatorDidCollapseOrDismiss:*(void *)(a1 + 40) withReason:5];
  }
  id v8 = [*(id *)(a1 + 40) modalAppWindow];
  [v8 setRootViewController:0];

  [*(id *)(a1 + 40) setModalAppWindow:0];
  double v9 = [*(id *)(a1 + 40) currentModalBrowser];
  [v9 unloadRemoteView];

  [*(id *)(a1 + 40) setPresentedModalBrowserNavigationController:0];
  [*(id *)(a1 + 40) setCurrentModalBrowser:0];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    char v11 = *(uint64_t (**)(void))(result + 16);
    return v11();
  }
  return result;
}

- (void)expandedAppViewControllerWantsToCollapse:(id)a3
{
  id v4 = a3;
  if ([(CKBrowserTransitionCoordinator *)self currentConsumer] == 2)
  {
    [(CKBrowserTransitionCoordinator *)self releaseOwnershipOfBrowserForConsumer:2];
    if ([(CKBrowserTransitionCoordinator *)self lastTransitionReason]) {
      [(CKBrowserTransitionCoordinator *)self dismissCurrentExpandedBrowserAnimated:1 completion:0];
    }
    else {
      [(CKBrowserTransitionCoordinator *)self transitionCurrentBrowserToCollapsedPresentationAnimated:1 completion:0];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)char v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Fullscreen requested dismiss/collapse, but it does not currently own the browser", v6, 2u);
    }
  }
}

- (void)expandedAppViewController:(id)a3 wantsToSwitchToPlugin:(id)a4 datasource:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  [(CKBrowserTransitionCoordinator *)self releaseOwnershipOfBrowserForConsumer:2];
  [(CKBrowserTransitionCoordinator *)self cachedCompactFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(CKBrowserTransitionCoordinator *)self updateBrowserSessionForPlugin:v22 datasource:v7];

  -[CKBrowserTransitionCoordinator setCachedCompactFrame:](self, "setCachedCompactFrame:", v9, v11, v13, v15);
  double v16 = [(CKBrowserTransitionCoordinator *)self expandedAppViewController];
  BOOL v17 = [(CKBrowserTransitionCoordinator *)self wasCurrentBrowserExpanded];
  id v18 = [(CKBrowserTransitionCoordinator *)self requestOwnershipOfBrowserForConsumer:2];
  if (!v17 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 viewWillTransitionToExpandedPresentation];
  }
  [v16 setContentViewController:v18];
  char v19 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v20 = objc_opt_respondsToSelector();

  if (v20)
  {
    id v21 = [(CKBrowserTransitionCoordinator *)self delegate];
    [v21 browserTransitionCoordinator:self didSwitchToPlugin:v22];
  }
  if (!v17 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v18 viewDidTransitionToExpandedPresentation];
  }
}

- (void)expandedAppViewController:(id)a3 hasUpdatedLastTouchDate:(id)a4
{
  id v8 = a4;
  uint64_t v5 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(CKBrowserTransitionCoordinator *)self delegate];
    [v7 browserTransitionCoordinator:self hasUpdatedLastTouchDate:v8];
  }
}

- (void)expandedAppViewControllerSwitcherDidSelectAppStore:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __85__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppStore___block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [(CKBrowserTransitionCoordinator *)self dismissCurrentExpandedBrowserAnimated:1 completion:v3];
}

void __85__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppStore___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 browserTransitionCoordinatorWantsPresentationOfAppStore:*(void *)(a1 + 32)];
  }
}

- (void)expandedAppViewControllerSwitcherDidSelectAppManager:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __87__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppManager___block_invoke;
  v3[3] = &unk_1E5620C40;
  v3[4] = self;
  [(CKBrowserTransitionCoordinator *)self dismissCurrentExpandedBrowserAnimated:1 completion:v3];
}

void __87__CKBrowserTransitionCoordinator_expandedAppViewControllerSwitcherDidSelectAppManager___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 browserTransitionCoordinatorWantsPresentationOfAppManager:*(void *)(a1 + 32)];
  }
}

- (void)expandedAppViewControllerDidTransitionFromOrientation:(int64_t)a3 toOrientation:(int64_t)a4
{
  id v7 = [(CKBrowserTransitionCoordinator *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CKBrowserTransitionCoordinator *)self delegate];
    [v9 browserTransitionCoordinator:self didTransitionFromOrientation:a3 toOrientation:a4];
  }
}

- (double)expandedAppViewControllerCollapsedContentHeight:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKBrowserTransitionCoordinator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v5 browserTransitionCoordinatorCollapsedContentHeight:self];
    double v7 = v6;
  }
  else
  {
    double v7 = 0.0;
    if (IMOSLoggingEnabled())
    {
      char v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)double v10 = 0;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "-expandedAppViewControllerCollapsedContentHeight probably shouldn't return 0.0", v10, 2u);
      }
    }
  }

  return v7;
}

- (BOOL)expandedAppViewControllerShouldDismissOnDragSuccess:(id)a3
{
  id v4 = [(CKBrowserTransitionCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v5 = [v4 browserTransitionCoordinatorShouldDismissOnDragSuccess:self];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldAlwaysShowAppTitle
{
  double v2 = [(CKBrowserTransitionCoordinator *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v3 = [v2 shouldAlwaysShowAppTitle];
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (id)appTitleOverride
{
  double v2 = [(CKBrowserTransitionCoordinator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v3 = [v2 appTitleOverride];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (id)appIconOverride
{
  double v2 = [(CKBrowserTransitionCoordinator *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    char v3 = [v2 appIconOverride];
  }
  else
  {
    char v3 = 0;
  }

  return v3;
}

- (void)setCurrentConsumer:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_currentConsumer != a3)
  {
    if (IMOSLoggingEnabled())
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unint64_t currentConsumer = self->_currentConsumer;
        if (currentConsumer > 3) {
          double v7 = 0;
        }
        else {
          double v7 = off_1E562B120[currentConsumer];
        }
        if ((unint64_t)a3 > 3) {
          char v8 = 0;
        }
        else {
          char v8 = off_1E562B120[a3];
        }
        int v10 = 138412546;
        double v11 = v7;
        __int16 v12 = 2112;
        double v13 = v8;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Browser consumer ownership changing from %@ to %@", (uint8_t *)&v10, 0x16u);
      }
    }
    self->_unint64_t currentConsumer = a3;
    id v9 = [(CKBrowserTransitionCoordinator *)self currentBrowser];
    if (objc_opt_respondsToSelector()) {
      [v9 setCurrentBrowserConsumer:self->_currentConsumer];
    }
  }
}

- (void)setCurrentBrowser:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  char v5 = (CKBrowserViewControllerProtocol *)a3;
  if (self->_currentBrowser != v5)
  {
    if (IMOSLoggingEnabled())
    {
      double v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        double v7 = [(CKBrowserViewControllerProtocol *)self->_currentBrowser balloonPlugin];
        id v8 = [v7 identifier];
        id v9 = [(CKBrowserViewControllerProtocol *)v5 balloonPlugin];
        int v10 = [v9 identifier];
        int v11 = 138412546;
        id v12 = v8;
        __int16 v13 = 2112;
        uint64_t v14 = v10;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Current browser session transitioning from %@ to %@", (uint8_t *)&v11, 0x16u);
      }
    }
    objc_storeStrong((id *)&self->_currentBrowser, a3);
    if (objc_opt_respondsToSelector()) {
      [(CKBrowserViewControllerProtocol *)self->_currentBrowser setCurrentBrowserConsumer:[(CKBrowserTransitionCoordinator *)self currentConsumer]];
    }
  }
}

- (void)setExpanded:(BOOL)a3 withReason:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_expanded != a3)
  {
    BOOL v5 = a3;
    if (IMOSLoggingEnabled())
    {
      double v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        if (self->_expanded) {
          id v8 = @"YES";
        }
        else {
          id v8 = @"NO";
        }
        *(_DWORD *)__int16 v13 = 138412802;
        *(void *)&v13[4] = v8;
        if (v5) {
          id v9 = @"YES";
        }
        else {
          id v9 = @"NO";
        }
        *(_WORD *)&v13[12] = 2112;
        *(void *)&v13[14] = v9;
        __int16 v14 = 2048;
        int64_t v15 = a4;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Browser expanded transitioning from %@ to %@ with reason %lld ", v13, 0x20u);
      }
    }
    -[CKBrowserTransitionCoordinator setLastTransitionReason:](self, "setLastTransitionReason:", a4, *(_OWORD *)v13);
    self->_expanded = v5;
    int v10 = [(CKBrowserTransitionCoordinator *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    if (v11)
    {
      id v12 = [(CKBrowserTransitionCoordinator *)self delegate];
      objc_msgSend(v12, "browserTransitionCoordinator:expandedStateDidChange:withReason:", self, -[CKBrowserTransitionCoordinator isExpanded](self, "isExpanded"), a4);
    }
  }
}

- (CKBrowserTransitionCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CKBrowserTransitionCoordinatorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)currentConsumer
{
  return self->_currentConsumer;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (void)setExpanded:(BOOL)a3
{
  self->_expanded = a3;
}

- (CKExpandedAppViewController)expandedAppViewController
{
  return self->_expandedAppViewController;
}

- (void)setExpandedAppViewController:(id)a3
{
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
}

- (CKBrowserViewControllerSendDelegate)sendDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sendDelegate);

  return (CKBrowserViewControllerSendDelegate *)WeakRetained;
}

- (void)setSendDelegate:(id)a3
{
}

- (BOOL)underTest
{
  return self->_underTest;
}

- (void)setUnderTest:(BOOL)a3
{
  self->_underTest = a3;
}

- (CKBrowserViewControllerProtocol)currentBrowser
{
  return self->_currentBrowser;
}

- (UIWindow)appWindow
{
  return self->_appWindow;
}

- (void)setAppWindow:(id)a3
{
}

- (UIWindow)previousKeyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previousKeyWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setPreviousKeyWindow:(id)a3
{
}

- (UIWindow)preModalKeyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_preModalKeyWindow);

  return (UIWindow *)WeakRetained;
}

- (void)setPreModalKeyWindow:(id)a3
{
}

- (CGRect)cachedCompactFrame
{
  double x = self->_cachedCompactFrame.origin.x;
  double y = self->_cachedCompactFrame.origin.y;
  double width = self->_cachedCompactFrame.size.width;
  double height = self->_cachedCompactFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setCachedCompactFrame:(CGRect)a3
{
  self->_cachedCompactFrame = a3;
}

- (int64_t)lastTransitionReason
{
  return self->_lastTransitionReason;
}

- (void)setLastTransitionReason:(int64_t)a3
{
  self->_lastTransitionReason = a3;
}

- (UIWindow)modalAppWindow
{
  return self->_modalAppWindow;
}

- (void)setModalAppWindow:(id)a3
{
}

- (UINavigationController)presentedModalBrowserNavigationController
{
  return self->_presentedModalBrowserNavigationController;
}

- (void)setPresentedModalBrowserNavigationController:(id)a3
{
}

- (CKBrowserViewControllerProtocol)currentModalBrowser
{
  return self->_currentModalBrowser;
}

- (void)setCurrentModalBrowser:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentModalBrowser, 0);
  objc_storeStrong((id *)&self->_presentedModalBrowserNavigationController, 0);
  objc_storeStrong((id *)&self->_modalAppWindow, 0);
  objc_destroyWeak((id *)&self->_preModalKeyWindow);
  objc_destroyWeak((id *)&self->_previousKeyWindow);
  objc_storeStrong((id *)&self->_appWindow, 0);
  objc_storeStrong((id *)&self->_currentBrowser, 0);
  objc_destroyWeak((id *)&self->_sendDelegate);
  objc_storeStrong((id *)&self->_conversation, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_expandedAppViewController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end