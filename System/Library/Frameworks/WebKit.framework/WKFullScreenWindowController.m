@interface WKFullScreenWindowController
- ($2667638D102C4679293AE17DAA90F085)logChannel;
- (BOOL)_isSecure;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isFullScreen;
- (UIView)webViewPlaceholder;
- (WKFullScreenViewController)fullScreenViewController;
- (WKFullScreenWindowController)initWithWebView:(id)a3;
- (WKWebView)_webView;
- (__SecTrust)_serverTrust;
- (const)logIdentifier;
- (const)loggerPtr;
- (id).cxx_construct;
- (id)_EVOrganizationName;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)interactionControllerForDismissal:(id)a3;
- (uint64_t)_completedExitFullScreen;
- (uint64_t)beganExitFullScreenWithInitialFrame:(WTF *)this finalFrame:(void *)a2;
- (uint64_t)didExitPictureInPicture;
- (uint64_t)enterFullScreen:(id *)a1;
- (uint64_t)enterFullScreen:(uint64_t)a1;
- (uint64_t)placeholderWillMoveToSuperview:(WTF *)this;
- (void)_applicationDidBecomeActive:(id)a3;
- (void)_completedExitFullScreen;
- (void)_dismissFullscreenViewController;
- (void)_enterFullScreen:(CGSize)a3 windowScene:(id)a4;
- (void)_exitFullscreenImmediately;
- (void)_interactiveDismissChanged:(id)a3;
- (void)_invalidateEVOrganizationName;
- (void)_manager;
- (void)_reinsertWebViewUnderPlaceholder;
- (void)_startToDismissFullscreenChanged:(id)a3;
- (void)_updateLocationInfo;
- (void)_videoPresentationManager;
- (void)beganEnterFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4;
- (void)beganExitFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4;
- (void)beganExitFullScreenWithInitialFrame:(uint64_t)a1 finalFrame:;
- (void)beganExitFullScreenWithInitialFrame:(void *)a1 finalFrame:;
- (void)close;
- (void)dealloc;
- (void)didEnterPictureInPicture;
- (void)didExitPictureInPicture;
- (void)enterFullScreen:(CGSize)a3;
- (void)enterFullScreen:(void *)a3;
- (void)exitFullScreen;
- (void)placeholderWillMoveToSuperview:(id)a3;
- (void)placeholderWillMoveToSuperview:(uint64_t)a1;
- (void)placeholderWillMoveToSuperview:(void *)a1;
- (void)requestExitFullScreen;
- (void)requestRestoreFullScreen:(void *)a3;
- (void)resetSupportedOrientations;
- (void)setSupportedOrientations:(unint64_t)a3;
- (void)set_webView:(id)a3;
- (void)videoControlsManagerDidChange;
- (void)webViewDidRemoveFromSuperviewWhileInFullscreen;
@end

@implementation WKFullScreenWindowController

- (WKFullScreenWindowController)initWithWebView:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)WKFullScreenWindowController;
  v4 = [(WKFullScreenWindowController *)&v14 init];
  v5 = v4;
  if (v4)
  {
    [(WKFullScreenWindowController *)v4 set_webView:a3];
    if (a3)
    {
      [a3 _page];
      if (v13)
      {
        CFRetain(*(CFTypeRef *)(v13 + 8));
        uint64_t v6 = WebKit::WebPageProxy::logger((WebKit::WebPageProxy *)v13);
        atomic_fetch_add((atomic_uint *volatile)(v6 + 8), 1u);
        m_ptr = (unsigned int *)v5->_logger.m_ptr;
        v5->_logger.m_ptr = (Logger *)v6;
        if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
        {
          atomic_store(1u, m_ptr + 2);
          (*(void (**)(unsigned int *))(*(void *)m_ptr + 8))(m_ptr);
        }
        unint64_t v8 = *(void *)(*(void *)(v13 + 32) + 760) + ~(*(void *)(*(void *)(v13 + 32) + 760) << 32);
        unint64_t v9 = 9
           * (((v8 ^ (v8 >> 22)) + ~((v8 ^ (v8 >> 22)) << 13)) ^ (((v8 ^ (v8 >> 22)) + ~((v8 ^ (v8 >> 22)) << 13)) >> 8));
        unint64_t v10 = (v9 ^ (v9 >> 15)) + ~((v9 ^ (v9 >> 15)) << 27);
        v5->_logIdentifier = (const void *)((v10 >> 31) ^ v10);
        CFRelease(*(CFTypeRef *)(v13 + 8));
      }
    }
    v11 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    objc_msgSend(v11, "addObserver:selector:name:object:", v5, sel__applicationDidBecomeActive_, *MEMORY[0x1E4F43648], objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"));
  }
  return v5;
}

- (void)dealloc
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenWindowController;
  [(WKFullScreenWindowController *)&v3 dealloc];
}

- (BOOL)isFullScreen
{
  return (unint64_t)(self->_fullScreenState - 1) < 5;
}

- (UIView)webViewPlaceholder
{
  return (UIView *)self->_webViewPlaceholder.m_ptr;
}

- (WKFullScreenViewController)fullScreenViewController
{
  return (WKFullScreenViewController *)self->_fullscreenViewController.m_ptr;
}

- (void)setSupportedOrientations:(unint64_t)a3
{
}

- (void)resetSupportedOrientations
{
}

- (void)enterFullScreen:(CGSize)a3
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  if (![(WKFullScreenWindowController *)self isFullScreen])
  {
    uint64_t v6 = [(WKFullScreenWindowController *)self _webView];
    if (v6)
    {
      [(WKWebView *)v6 _page];
      if (v10)
      {
        CFRetain(*(CFTypeRef *)(v10 + 8));
        self->_fullScreenState = 1;
        id location = 0;
        objc_initWeak(&location, self);
        uint64_t v7 = *(void *)(v10 + 416);
        *(void *)&long long v11 = "-[WKFullScreenWindowController enterFullScreen:]";
        *((void *)&v11 + 1) = [(WKFullScreenWindowController *)self logIdentifier];
        v12 = self;
        id v13 = 0;
        objc_moveWeak(&v13, &location);
        *(CGFloat *)&long long v14 = width;
        *((CGFloat *)&v14 + 1) = height;
        uint64_t v8 = WTF::fastMalloc((WTF *)0x48);
        *(void *)uint64_t v8 = &unk_1EE9D5258;
        *(void *)(v8 + 40) = v12;
        *(_OWORD *)(v8 + 24) = v11;
        *(_OWORD *)(v8 + 8) = 0uLL;
        *(void *)(v8 + 48) = 0;
        objc_moveWeak((id *)(v8 + 48), &v13);
        *(_OWORD *)(v8 + 56) = v14;
        uint64_t v15 = v8;
        (*(void (**)(uint64_t, uint64_t *))(*(void *)v7 + 56))(v7, &v15);
        uint64_t v9 = v15;
        uint64_t v15 = 0;
        if (v9) {
          (*(void (**)(uint64_t))(*(void *)v9 + 8))(v9);
        }
        objc_destroyWeak(&v13);
        objc_destroyWeak(&location);
        CFRelease(*(CFTypeRef *)(v10 + 8));
      }
    }
  }
}

- (void)_enterFullScreen:(CGSize)a3 windowScene:(id)a4
{
  CGSize v77 = a3;
  uint64_t v6 = [(WKFullScreenWindowController *)self _webView];
  uint64_t v7 = v6;
  if (v6)
  {
    CFRetain(v6);
    [(WKWebView *)v7 _page];
  }
  else
  {
    v76 = 0;
  }
  uint64_t v8 = [(WKFullScreenWindowController *)self _manager];
  if (v76)
  {
    uint64_t v9 = v8;
    if (v8)
    {
      if ([(WKFullScreenWindowController *)self loggerPtr])
      {
        if ([(WKFullScreenWindowController *)self logChannel])
        {
          uint64_t v10 = [(WKFullScreenWindowController *)self loggerPtr];
          long long v11 = [(WKFullScreenWindowController *)self logChannel];
          uint64_t v65 = 0;
          v66 = 0;
          uint64_t v67 = (uint64_t)"-[WKFullScreenWindowController _enterFullScreen:windowScene:]";
          v68 = [(WKFullScreenWindowController *)self logIdentifier];
          WebCore::FloatSize::FloatSize((WebCore::FloatSize *)v75, &v77);
          if (v10[12]) {
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatSize>((uint64_t)v11, 0, (WTF::Logger::LogSiteIdentifier *)&v65, (WebCore::FloatSize *)v75);
          }
        }
      }
      [(WKFullScreenWindowController *)self _invalidateEVOrganizationName];
      self->_blocksReturnToFullscreenFromPictureInPicture = v9[41];
      objc_msgSend((id)-[WKWebView window](v7, "window"), "frame");
      self->_originalWindowSize.CGFloat width = v12;
      self->_originalWindowSize.CGFloat height = v13;
      long long v14 = (void *)[objc_alloc(MEMORY[0x1E4F43058]) initWithWindowScene:a4];
      m_ptr = self->_window.m_ptr;
      self->_window.m_ptr = v14;
      if (m_ptr)
      {
        CFRelease(m_ptr);
        long long v14 = self->_window.m_ptr;
      }
      objc_msgSend(v14, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
      [self->_window.m_ptr setWindowLevel:*MEMORY[0x1E4F43F20] + -1.0];
      [self->_window.m_ptr setHidden:0];
      id v16 = objc_alloc_init(MEMORY[0x1E4F42FF8]);
      v17 = self->_rootViewController.m_ptr;
      self->_rootViewController.m_ptr = v16;
      if (v17) {
        CFRelease(v17);
      }
      id v18 = objc_alloc(MEMORY[0x1E4F42FF0]);
      [self->_window.m_ptr bounds];
      v19 = (const void *)objc_msgSend(v18, "initWithFrame:");
      [self->_rootViewController.m_ptr setView:v19];
      if (v19) {
        CFRelease(v19);
      }
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "setAutoresizingMask:", 18);
      [self->_rootViewController.m_ptr setModalPresentationStyle:4];
      [self->_rootViewController.m_ptr setTransitioningDelegate:self];
      [self->_window.m_ptr setRootViewController:self->_rootViewController.m_ptr];
      v20 = [[WKFullScreenViewController alloc] initWithWebView:v7];
      v21 = self->_fullscreenViewController.m_ptr;
      self->_fullscreenViewController.m_ptr = v20;
      if (v21)
      {
        CFRelease(v21);
        v20 = (WKFullScreenViewController *)self->_fullscreenViewController.m_ptr;
      }
      [(WKFullScreenViewController *)v20 setModalPresentationStyle:4];
      [self->_fullscreenViewController.m_ptr setTransitioningDelegate:self];
      [self->_fullscreenViewController.m_ptr setModalPresentationCapturesStatusBarAppearance:1];
      [self->_fullscreenViewController.m_ptr setDelegate:self];
      objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "bounds");
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "setFrame:", v22, v23, v24, v25);
      [(WKFullScreenWindowController *)self _updateLocationInfo];
      v26 = (void *)[objc_alloc(MEMORY[0x1E4F42E70]) initWithTarget:self action:sel__startToDismissFullscreenChanged_];
      v27 = self->_startDismissGestureRecognizer.m_ptr;
      self->_startDismissGestureRecognizer.m_ptr = v26;
      if (v27)
      {
        CFRelease(v27);
        v26 = self->_startDismissGestureRecognizer.m_ptr;
      }
      [v26 setDelegate:self];
      [self->_startDismissGestureRecognizer.m_ptr setCancelsTouchesInView:1];
      [self->_startDismissGestureRecognizer.m_ptr setNumberOfTouchesRequired:1];
      [self->_startDismissGestureRecognizer.m_ptr setDirection:8];
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "addGestureRecognizer:", self->_startDismissGestureRecognizer.m_ptr);
      v28 = (void *)[objc_alloc(MEMORY[0x1E4F42C38]) initWithTarget:self action:sel__interactiveDismissChanged_];
      v29 = self->_interactivePanDismissGestureRecognizer.m_ptr;
      self->_interactivePanDismissGestureRecognizer.m_ptr = v28;
      if (v29)
      {
        CFRelease(v29);
        v28 = self->_interactivePanDismissGestureRecognizer.m_ptr;
      }
      [v28 setDelegate:self];
      [self->_interactivePanDismissGestureRecognizer.m_ptr setCancelsTouchesInView:0];
      objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "addGestureRecognizer:", self->_interactivePanDismissGestureRecognizer.m_ptr);
      uint64_t v30 = *((void *)v9 + 3);
      uint64_t v31 = *(void *)(v30 + 256);
      LOBYTE(v65) = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SaveScrollPosition>(v31, (uint64_t)&v65, *(void *)(*(void *)(v30 + 32) + 1928), 0);
      WebKit::WebPageProxy::setSuppressVisibilityUpdates(v76, 1);
      id v32 = [(WKWebView *)v7 _wkScrollView];
      [(WKWebView *)v7 _pageScale];
      self->_viewState._savedPageScale = v33;
      self->_viewState._savedHaveSetObscuredInsets = [(WKWebView *)v7 _haveSetObscuredInsets];
      [(WKWebView *)v7 _obscuredInsets];
      self->_viewState._savedObscuredInsets.top = v34;
      self->_viewState._savedObscuredInsets.left = v35;
      self->_viewState._savedObscuredInsets.bottom = v36;
      self->_viewState._savedObscuredInsets.right = v37;
      self->_viewState._savedObscuredInsetEdgesAffectedBySafeArea = [(WKWebView *)v7 _obscuredInsetEdgesAffectedBySafeArea];
      self->_viewState._savedContentInsetWasExternallyOverridden = [v32 _contentInsetWasExternallyOverridden];
      [v32 contentInset];
      self->_viewState._savedEdgeInset.top = v38;
      self->_viewState._savedEdgeInset.left = v39;
      self->_viewState._savedEdgeInset.bottom = v40;
      self->_viewState._savedEdgeInset.right = v41;
      [v32 contentOffset];
      self->_viewState._savedContentOffset.x = v42;
      self->_viewState._savedContentOffset.y = v43;
      [v32 scrollIndicatorInsets];
      self->_viewState._savedScrollIndicatorInsets.top = v44;
      self->_viewState._savedScrollIndicatorInsets.left = v45;
      self->_viewState._savedScrollIndicatorInsets.bottom = v46;
      self->_viewState._savedScrollIndicatorInsets.right = v47;
      self->_viewState._savedContentInsetAdjustmentBehaviorWasExternallyOverridden = [v32 _contentInsetAdjustmentBehaviorWasExternallyOverridden];
      if (v7)
      {
        [(WKWebView *)v7 _page];
        uint64_t v48 = v65;
        if (v65)
        {
          self->_viewState._savedTopContentInset = *(float *)(v65 + 772);
          self->_viewState._savedForceAlwaysUserScalable = *(unsigned char *)(v48 + 1077);
        }
      }
      [(WKWebView *)v7 _viewScale];
      self->_viewState._savedViewScale = v49;
      [v32 zoomScale];
      self->_viewState._savedZoomScale = v50;
      [(WKWebView *)v7 _contentZoomScale];
      self->_viewState._savedContentZoomScale = v51;
      self->_viewState._savedBouncesZoom = [v32 bouncesZoom];
      [(WKWebView *)v7 _minimumEffectiveDeviceWidth];
      self->_viewState._savedMinimumEffectiveDeviceWidth = v52;
      self->_viewState._savedHaveSetUnobscuredSafeAreaInsets = [(WKWebView *)v7 _haveSetUnobscuredSafeAreaInsets];
      [(WKWebView *)v7 _unobscuredSafeAreaInsets];
      self->_viewState._savedUnobscuredSafeAreaInsets.top = v53;
      self->_viewState._savedUnobscuredSafeAreaInsets.left = v54;
      self->_viewState._savedUnobscuredSafeAreaInsets.bottom = v55;
      self->_viewState._savedUnobscuredSafeAreaInsets.right = v56;
      self->_viewState._savedHasOverriddenLayoutParameters = [(WKWebView *)v7 _hasOverriddenLayoutParameters];
      [(WKWebView *)v7 _maximumUnobscuredSizeOverride];
      self->_viewState._savedMaximumUnobscuredSizeOverride.CGFloat width = v57;
      self->_viewState._savedMaximumUnobscuredSizeOverride.CGFloat height = v58;
      [(WKWebView *)v7 _minimumUnobscuredSizeOverride];
      self->_viewState._savedMinimumUnobscuredSizeOverride.CGFloat width = v59;
      self->_viewState._savedMinimumUnobscuredSizeOverride.CGFloat height = v60;
      v61 = objc_alloc_init(WKFullScreenPlaceholderView);
      v62 = self->_webViewPlaceholder.m_ptr;
      self->_webViewPlaceholder.m_ptr = v61;
      if (v62)
      {
        CFRelease(v62);
        v61 = (WKFullScreenPlaceholderView *)self->_webViewPlaceholder.m_ptr;
      }
      [(WKFullScreenPlaceholderView *)v61 setParent:self];
      objc_msgSend((id)objc_msgSend(self->_webViewPlaceholder.m_ptr, "layer"), "setName:", @"Fullscreen Placeholder View");
      uint64_t v65 = 0;
      v66 = &v65;
      uint64_t v67 = 0x5012000000;
      v68 = __Block_byref_object_copy__10;
      v69 = __Block_byref_object_dispose__10;
      v70 = &unk_19964AFC1;
      v63 = [(WKFullScreenWindowController *)self logIdentifier];
      uint64_t v71 = 0;
      uint64_t v72 = 0;
      v73 = "-[WKFullScreenWindowController _enterFullScreen:windowScene:]";
      v74 = v63;
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __61__WKFullScreenWindowController__enterFullScreen_windowScene___block_invoke;
      v64[3] = &unk_1E58138D8;
      v64[4] = self;
      v64[5] = &v65;
      [(WKWebView *)v7 takeSnapshotWithConfiguration:0 completionHandler:v64];
      _Block_object_dispose(&v65, 8);
    }
  }
  if (v7) {
    CFRelease(v7);
  }
}

void __61__WKFullScreenWindowController__enterFullScreen_windowScene___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v4 = (WKWebView *)[*(id *)(a1 + 32) _webView];
  v5 = v4;
  if (v4) {
    CFRetain(v4);
  }
  uint64_t v6 = (void *)[*(id *)(a1 + 32) _webView];
  if (v6)
  {
    [v6 _page];
    if (v50)
    {
      if ([*(id *)(a1 + 32) loggerPtr])
      {
        if ([*(id *)(a1 + 32) logChannel])
        {
          uint64_t v7 = [*(id *)(a1 + 32) loggerPtr];
          uint64_t v49 = [*(id *)(a1 + 32) logChannel];
          if (*(unsigned char *)(v7 + 12))
          {
            uint64_t v48 = (WTF::Logger::LogSiteIdentifier *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v53, v48);
            WTF::String::String((WTF::String *)&v52, "snapshot completed");
            *(void *)buf = v53;
            v51[0] = v52;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v51, &v54);
            if (!v54)
            {
              __break(0xC471u);
              return;
            }
            uint64_t v9 = v52;
            double v52 = 0;
            if (v9)
            {
              if (*(_DWORD *)v9 == 2) {
                WTF::StringImpl::destroy(v9, v8);
              }
              else {
                *(_DWORD *)v9 -= 2;
              }
            }
            uint64_t v10 = v53;
            CGFloat v53 = 0;
            if (v10)
            {
              if (*(_DWORD *)v10 == 2) {
                WTF::StringImpl::destroy(v10, v8);
              }
              else {
                *(_DWORD *)v10 -= 2;
              }
            }
            long long v11 = *(NSObject **)(v49 + 32);
            CGFloat v12 = (WTF *)os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
            if (v12)
            {
              WTF::String::utf8();
              long long v14 = v51[0] ? (char *)v51[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v14;
              _os_log_impl(&dword_1985F2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              CGFloat v12 = v51[0];
              v51[0] = 0;
              if (v12)
              {
                if (*(_DWORD *)v12 == 1) {
                  CGFloat v12 = (WTF *)WTF::fastFree(v12, v13);
                }
                else {
                  --*(_DWORD *)v12;
                }
              }
            }
            if (*(unsigned char *)v49)
            {
              uint64_t v15 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v16 = *v15;
                if (v16) {
                  break;
                }
                int v17 = *v15;
                atomic_compare_exchange_strong_explicit(v15, (unsigned __int8 *)&v17, v16 | 1, memory_order_acquire, memory_order_acquire);
                if (v17 == v16)
                {
                  uint64_t v18 = WTF::Logger::observers(v12);
                  uint64_t v19 = *(unsigned int *)(v18 + 12);
                  if (v19)
                  {
                    v20 = *(uint64_t **)v18;
                    uint64_t v21 = *(void *)v18 + 8 * v19;
                    do
                    {
                      uint64_t v22 = *v20;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v48);
                      *(_DWORD *)&buf[16] = 0;
                      WTF::String::String((WTF::String *)&buf[24], "snapshot completed");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v51, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v22 + 16))(v22, v49, 0, v51);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v51, v23);
                      for (uint64_t i = 24; i != -8; i -= 16)
                      {
                        double v25 = *(WTF::StringImpl **)&buf[i];
                        *(void *)&buf[i] = 0;
                        if (v25)
                        {
                          if (*(_DWORD *)v25 == 2) {
                            WTF::StringImpl::destroy(v25, (WTF::StringImpl *)v13);
                          }
                          else {
                            *(_DWORD *)v25 -= 2;
                          }
                        }
                      }
                      ++v20;
                    }
                    while (v20 != (uint64_t *)v21);
                  }
                  int v26 = 1;
                  atomic_compare_exchange_strong_explicit(v15, (unsigned __int8 *)&v26, 0, memory_order_release, memory_order_relaxed);
                  if (v26 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            v27 = v54;
            CGFloat v54 = 0;
            if (v27)
            {
              if (*(_DWORD *)v27 == 2) {
                WTF::StringImpl::destroy(v27, (WTF::StringImpl *)v13);
              }
              else {
                *(_DWORD *)v27 -= 2;
              }
            }
          }
        }
      }
      objc_msgSend(MEMORY[0x1E4F39CF8], "begin", v48);
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "layer"), "setContents:", objc_msgSend(a2, "CGImage"));
      v28 = *(void **)(*(void *)(a1 + 32) + 8);
      [MEMORY[0x1E4F39CF8] begin];
      [MEMORY[0x1E4F39CF8] setDisableActions:1];
      [(WKWebView *)v5 frame];
      objc_msgSend(v28, "setFrame:");
      objc_msgSend(v28, "setAutoresizingMask:", -[WKWebView autoresizingMask](v5, "autoresizingMask"));
      objc_msgSend((id)-[WKWebView superview](v5, "superview"), "insertSubview:aboveSubview:", v28, v5);
      [(WKWebView *)v5 removeFromSuperview];
      [MEMORY[0x1E4F39CF8] commit];
      [(WKWebView *)v5 setAutoresizingMask:18];
      [*(id *)(*(void *)(a1 + 32) + 312) bounds];
      -[WKWebView setFrame:](v5, "setFrame:");
      [(WKWebView *)v5 _setMinimumEffectiveDeviceWidth:0.0];
      [(WKWebView *)v5 _setViewScale:1.0];
      [(WKWebView *)v5 _overrideZoomScaleParametersWithMinimumZoomScale:0 maximumZoomScale:1.0 allowUserScaling:1.0];
      [(WKWebView *)v5 _resetContentOffset];
      [*(id *)(*(void *)(a1 + 32) + 312) insertSubview:v5 atIndex:0];
      memset(buf, 0, 32);
      long long v29 = *MEMORY[0x1E4F1DB30];
      memset(&v65[1], 0, 32);
      v65[0] = 0u;
      long long v30 = *MEMORY[0x1E4F1DAD8];
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      *(_OWORD *)&v59[32] = 0u;
      long long v60 = 0u;
      *(_OWORD *)&v59[16] = 0u;
      uint64_t v56 = 0;
      long long v57 = 0u;
      long long v58 = 0u;
      *(_OWORD *)CGFloat v59 = 0u;
      __asm { FMOV            V4.2D, #1.0 }
      *(_OWORD *)&buf[8] = _Q4;
      *(_OWORD *)&buf[24] = _Q4;
      long long v36 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      long long v57 = *MEMORY[0x1E4F437F8];
      long long v58 = v36;
      long long v37 = *MEMORY[0x1E4F437F8];
      *(_OWORD *)&v59[24] = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      *(_OWORD *)&v59[8] = v37;
      long long v38 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      long long v60 = *MEMORY[0x1E4F437F8];
      long long v61 = v38;
      long long v63 = v30;
      *(_OWORD *)((char *)&v65[1] + 8) = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
      *(void *)&v59[40] = 15;
      *(_OWORD *)((char *)v65 + 8) = v37;
      long long v39 = *MEMORY[0x1E4F1DB30];
      v65[3] = v29;
      v65[4] = v39;
      WebKit::WKWebViewState::applyTo((WebKit::WKWebViewState *)buf, v5);
      [(WKWebView *)v5 setNeedsLayout];
      [(WKWebView *)v5 layoutIfNeeded];
      uint64_t v40 = [*(id *)(a1 + 32) _manager];
      if (v40)
      {
        uint64_t v41 = *(void *)(v40 + 24);
        uint64_t v42 = *(void *)(v41 + 256);
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v42, (char *)buf, *(void *)(*(void *)(v41 + 32) + 1928), 0);
      }
      uint64_t v43 = *(void *)(a1 + 32);
      if (v43)
      {
        CFRetain(*(CFTypeRef *)(a1 + 32));
        uint64_t v44 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v44 = 0;
      }
      uint64_t v45 = *(void *)(*(void *)(a1 + 40) + 8);
      long long v46 = *(_OWORD *)(v45 + 64);
      *(_OWORD *)buf = *(_OWORD *)(v45 + 48);
      *(_OWORD *)&buf[16] = v46;
      uint64_t v47 = WTF::fastMalloc((WTF *)0x38);
      *(void *)uint64_t v47 = &unk_1EE9D5280;
      *(void *)(v47 + 8) = v43;
      *(void *)(v47 + 16) = v44;
      *(_OWORD *)(v47 + 24) = *(_OWORD *)buf;
      *(_OWORD *)(v47 + 40) = *(_OWORD *)&buf[16];
      v51[0] = (WTF *)v47;
      WebKit::WebPageProxy::updateRenderingWithForcedRepaint(v50, (uint64_t *)v51);
      if (v51[0]) {
        (*(void (**)(WTF *))(*(void *)v51[0] + 8))(v51[0]);
      }
      [MEMORY[0x1E4F39CF8] commit];
    }
  }
  if (v5) {
    CFRelease(v5);
  }
}

- (void)beganEnterFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4
{
  BOOL returnToFullscreenFromPictureInPicture;
  const void *v26;
  void *m_ptr;
  void *v28;
  unsigned char *v29;
  WTF::StringImpl *v30;
  WTF::StringImpl *v31;
  WTF::StringImpl *v32;
  WTF::StringImpl *v33;
  NSObject *var4;
  WTF *v35;
  void *v36;
  char *v37;
  atomic_uchar *v38;
  int v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  uint64_t i;
  WTF::StringImpl *v48;
  int v49;
  WTF::StringImpl *v50;
  CGSize v51;
  $2667638D102C4679293AE17DAA90F085 *v52;
  void v53[6];
  void v54[4];
  CGRect v55;
  CGRect v56;
  WTF *v57[2];
  WTF::StringImpl *v58;
  WTF::StringImpl *v59;
  WTF::StringImpl *v60;
  WTF::StringImpl *v61;
  uint8_t buf[16];
  uint64_t v63;
  __n128 (*v64)(uint64_t, uint64_t);
  uint64_t (*v65)();
  void v66[7];

  v66[5] = *MEMORY[0x1E4F143B8];
  uint64_t v56 = a3;
  CGFloat v55 = a4;
  int64_t fullScreenState = self->_fullScreenState;
  uint64_t v6 = [(WKFullScreenWindowController *)self loggerPtr];
  if (fullScreenState == 1)
  {
    if (v6)
    {
      if ([(WKFullScreenWindowController *)self logChannel])
      {
        uint64_t v7 = [(WKFullScreenWindowController *)self loggerPtr];
        uint64_t v8 = [(WKFullScreenWindowController *)self logChannel];
        *(_OWORD *)buf = 0uLL;
        long long v63 = (uint64_t)"-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
        long long v64 = [(WKFullScreenWindowController *)self logIdentifier];
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v54, &v56);
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v57, &v55);
        if (v7[12]) {
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatRect,char [3],WebCore::FloatRect>((uint64_t)v8, (WTF::Logger::LogSiteIdentifier *)buf, (WebCore::FloatRect *)v54, (WebCore::FloatRect *)v57);
        }
      }
    }
    self->_int64_t fullScreenState = 2;
    CGSize size = v56.size;
    self->_initialFrame.origin = v56.origin;
    self->_initialFrame.CGSize size = size;
    CGSize v10 = v55.size;
    self->_finalFrame.origin = v55.origin;
    self->_finalFrame.CGSize size = v10;
    __asm { FMOV            V2.2D, #1.0 }
    double v51 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_initialFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_initialFrame.size);
    self->_initialFrame.CGSize size = v51;
    self->_finalFrame.CGSize size = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_finalFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_finalFrame.size);
    double x = self->_initialFrame.origin.x;
    double y = self->_initialFrame.origin.y;
    objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "frame");
    CGFloat width = v51.width;
    if (y > v18
      || ((CGFloat height = v51.height, y >= -v51.height) ? (v21 = x <= v17) : (v21 = 0),
          v21 ? (_NF = x < -v51.width) : (_NF = 1),
          _NF))
    {
      double x = v17 * 0.5;
      double y = v18 * 0.5;
      CGFloat width = 1.0;
      CGFloat height = 1.0;
    }
    self->_initialFrame.origin.double x = x;
    self->_initialFrame.origin.double y = y;
    self->_initialFrame.size.CGFloat width = width;
    self->_initialFrame.size.CGFloat height = height;
    [MEMORY[0x1E4F39CF8] begin];
    [MEMORY[0x1E4F39CF8] setDisableActions:1];
    double v23 = [(WKFullScreenWindowController *)self _webView];
    double v24 = v23;
    if (v23) {
      CFRetain(v23);
    }
    [(WKWebView *)v24 removeFromSuperview];
    [self->_window.m_ptr setWindowLevel:*MEMORY[0x1E4F43F20]];
    [self->_window.m_ptr makeKeyAndVisible];
    [self->_fullscreenViewController.m_ptr setPrefersStatusBarHidden:0];
    [self->_fullscreenViewController.m_ptr showUI];
    [MEMORY[0x1E4F39CF8] commit];
    returnToFullscreenFromPictureInPicture = self->_returnToFullscreenFromPictureInPicture;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    long long v63 = 0x5012000000;
    long long v64 = __Block_byref_object_copy__10;
    uint64_t v65 = __Block_byref_object_dispose__10;
    v66[0] = &unk_19964AFC1;
    int v26 = [(WKFullScreenWindowController *)self logIdentifier];
    v66[1] = 0;
    v66[2] = 0;
    v66[3] = "-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
    v66[4] = v26;
    m_ptr = self->_rootViewController.m_ptr;
    v28 = self->_fullscreenViewController.m_ptr;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __80__WKFullScreenWindowController_beganEnterFullScreenWithInitialFrame_finalFrame___block_invoke;
    v53[3] = &unk_1E5813900;
    v53[4] = self;
    v53[5] = buf;
    [m_ptr presentViewController:v28 animated:!returnToFullscreenFromPictureInPicture completion:v53];
    _Block_object_dispose(buf, 8);
    if (v24) {
      CFRelease(v24);
    }
  }
  else if (v6)
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      long long v29 = [(WKFullScreenWindowController *)self loggerPtr];
      double v52 = [(WKFullScreenWindowController *)self logChannel];
      v54[0] = 0;
      v54[1] = 0;
      v54[2] = "-[WKFullScreenWindowController beganEnterFullScreenWithInitialFrame:finalFrame:]";
      v54[3] = [(WKFullScreenWindowController *)self logIdentifier];
      if (v29[12])
      {
        WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v60, (WTF::Logger::LogSiteIdentifier *)v54);
        WTF::LogArgument<WebKit::FullScreenState>::toString(&v59);
        WTF::String::String((WTF::String *)&v58, " != WaitingToEnterFullScreen, dropping");
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v60, (uint64_t *)&v59, (uint64_t *)&v58, &v61);
        uint64_t v31 = v58;
        long long v58 = 0;
        if (v31)
        {
          if (*(_DWORD *)v31 == 2) {
            WTF::StringImpl::destroy(v31, v30);
          }
          else {
            *(_DWORD *)v31 -= 2;
          }
        }
        id v32 = v59;
        CGFloat v59 = 0;
        if (v32)
        {
          if (*(_DWORD *)v32 == 2) {
            WTF::StringImpl::destroy(v32, v30);
          }
          else {
            *(_DWORD *)v32 -= 2;
          }
        }
        double v33 = v60;
        long long v60 = 0;
        if (v33)
        {
          if (*(_DWORD *)v33 == 2) {
            WTF::StringImpl::destroy(v33, v30);
          }
          else {
            *(_DWORD *)v33 -= 2;
          }
        }
        var4 = v52->var4;
        CGFloat v35 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if (v35)
        {
          WTF::String::utf8();
          long long v37 = v57[0] ? (char *)v57[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = v37;
          _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          CGFloat v35 = v57[0];
          v57[0] = 0;
          if (v35)
          {
            if (*(_DWORD *)v35 == 1) {
              CGFloat v35 = (WTF *)WTF::fastFree(v35, v36);
            }
            else {
              --*(_DWORD *)v35;
            }
          }
        }
        if (v52->var0 && v52->var2)
        {
          long long v38 = (atomic_uchar *)MEMORY[0x1E4F30998];
          while (1)
          {
            long long v39 = *v38;
            if (v39) {
              break;
            }
            uint64_t v40 = *v38;
            atomic_compare_exchange_strong_explicit(v38, (unsigned __int8 *)&v40, v39 | 1, memory_order_acquire, memory_order_acquire);
            if (v40 == v39)
            {
              uint64_t v41 = WTF::Logger::observers(v35);
              uint64_t v42 = *(unsigned int *)(v41 + 12);
              if (v42)
              {
                uint64_t v43 = *(uint64_t **)v41;
                uint64_t v44 = *(void *)v41 + 8 * v42;
                do
                {
                  uint64_t v45 = *v43;
                  *(_DWORD *)buf = 0;
                  WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v54);
                  LODWORD(v63) = 0;
                  WTF::LogArgument<WebKit::FullScreenState>::toString(&v64);
                  LODWORD(v65) = 0;
                  WTF::String::String((WTF::String *)v66, " != WaitingToEnterFullScreen, dropping");
                  WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v57, (uint64_t)buf, 3uLL);
                  (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, uint64_t, WTF **))(*(void *)v45 + 16))(v45, v52, 1, v57);
                  WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v57, v46);
                  for (uint64_t i = 40; i != -8; i -= 16)
                  {
                    uint64_t v48 = *(WTF::StringImpl **)&buf[i];
                    *(void *)&buf[i] = 0;
                    if (v48)
                    {
                      if (*(_DWORD *)v48 == 2) {
                        WTF::StringImpl::destroy(v48, (WTF::StringImpl *)v36);
                      }
                      else {
                        *(_DWORD *)v48 -= 2;
                      }
                    }
                  }
                  ++v43;
                }
                while (v43 != (uint64_t *)v44);
              }
              uint64_t v49 = 1;
              atomic_compare_exchange_strong_explicit(v38, (unsigned __int8 *)&v49, 0, memory_order_release, memory_order_relaxed);
              if (v49 != 1) {
                WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
              }
              break;
            }
          }
        }
        uint64_t v50 = v61;
        long long v61 = 0;
        if (v50)
        {
          if (*(_DWORD *)v50 == 2) {
            WTF::StringImpl::destroy(v50, (WTF::StringImpl *)v36);
          }
          else {
            *(_DWORD *)v50 -= 2;
          }
        }
      }
    }
  }
}

atomic_uchar *__80__WKFullScreenWindowController_beganEnterFullScreenWithInitialFrame_finalFrame___block_invoke(uint64_t a1)
{
  v104[2] = *MEMORY[0x1E4F143B8];
  *(void *)(*(void *)(a1 + 32) + 16) = 3;
  v2 = *(unsigned char **)(a1 + 32);
  if (!v2[474])
  {
    uint64_t v9 = (void *)[v2 _webView];
    if (v9) {
      [v9 _page];
    }
    else {
      v97 = 0;
    }
    uint64_t v10 = [*(id *)(a1 + 32) _manager];
    long long v11 = (WebKit::WebFullScreenManagerProxy *)v10;
    if (v97) {
      BOOL v12 = v10 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    int v13 = !v12;
    uint64_t v14 = [*(id *)(a1 + 32) loggerPtr];
    if (!v13)
    {
      if (v14)
      {
        if ([*(id *)(a1 + 32) logChannel])
        {
          uint64_t v20 = [*(id *)(a1 + 32) loggerPtr];
          uint64_t v21 = [*(id *)(a1 + 32) logChannel];
          if (*(unsigned char *)(v20 + 12))
          {
            uint64_t v22 = v21;
            double v23 = (WTF::Logger::LogSiteIdentifier *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v100, v23);
            WTF::String::String((WTF::String *)&v99, "presentation completed, but page or manager missing");
            *(void *)buf = v100;
            v98[0] = v99;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v98, &v101);
            if (!v101) {
              goto LABEL_162;
            }
            double v25 = v99;
            v99 = 0;
            if (v25)
            {
              if (*(_DWORD *)v25 == 2) {
                WTF::StringImpl::destroy(v25, v24);
              }
              else {
                *(_DWORD *)v25 -= 2;
              }
            }
            uint64_t v47 = v100;
            v100 = 0;
            if (v47)
            {
              if (*(_DWORD *)v47 == 2) {
                WTF::StringImpl::destroy(v47, v24);
              }
              else {
                *(_DWORD *)v47 -= 2;
              }
            }
            double v52 = *(NSObject **)(v22 + 32);
            CGFloat v53 = (WTF *)os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT);
            if (v53)
            {
              WTF::String::utf8();
              CGFloat v55 = v98[0] ? (char *)v98[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v55;
              _os_log_impl(&dword_1985F2000, v52, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              CGFloat v53 = v98[0];
              v98[0] = 0;
              if (v53)
              {
                if (*(_DWORD *)v53 == 1) {
                  CGFloat v53 = (WTF *)WTF::fastFree(v53, v54);
                }
                else {
                  --*(_DWORD *)v53;
                }
              }
            }
            if (*(unsigned char *)v22 && *(unsigned char *)(v22 + 16))
            {
              v81 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v82 = *v81;
                if (v82) {
                  break;
                }
                int v83 = *v81;
                atomic_compare_exchange_strong_explicit(v81, (unsigned __int8 *)&v83, v82 | 1, memory_order_acquire, memory_order_acquire);
                if (v83 == v82)
                {
                  uint64_t v84 = WTF::Logger::observers(v53);
                  uint64_t v85 = *(unsigned int *)(v84 + 12);
                  if (v85)
                  {
                    v86 = *(uint64_t **)v84;
                    uint64_t v87 = *(void *)v84 + 8 * v85;
                    do
                    {
                      uint64_t v88 = *v86;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v23);
                      int v103 = 0;
                      WTF::String::String((WTF::String *)v104, "presentation completed, but page or manager missing");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v98, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(void *)v88 + 16))(v88, v22, 1, v98);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v98, v89);
                      for (uint64_t i = 24; i != -8; i -= 16)
                      {
                        v91 = *(WTF::StringImpl **)&buf[i];
                        *(void *)&buf[i] = 0;
                        if (v91)
                        {
                          if (*(_DWORD *)v91 == 2) {
                            WTF::StringImpl::destroy(v91, (WTF::StringImpl *)v54);
                          }
                          else {
                            *(_DWORD *)v91 -= 2;
                          }
                        }
                      }
                      ++v86;
                    }
                    while (v86 != (uint64_t *)v87);
                  }
                  int v92 = 1;
                  atomic_compare_exchange_strong_explicit(v81, (unsigned __int8 *)&v92, 0, memory_order_release, memory_order_relaxed);
                  if (v92 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            v93 = v101;
            v101 = 0;
            if (v93)
            {
              if (*(_DWORD *)v93 == 2) {
                WTF::StringImpl::destroy(v93, (WTF::StringImpl *)v54);
              }
              else {
                *(_DWORD *)v93 -= 2;
              }
            }
          }
        }
      }
      return (atomic_uchar *)[*(id *)(a1 + 32) _exitFullscreenImmediately];
    }
    if (v14)
    {
      if ([*(id *)(a1 + 32) logChannel])
      {
        uint64_t v15 = [*(id *)(a1 + 32) loggerPtr];
        uint64_t v16 = [*(id *)(a1 + 32) logChannel];
        if (*(unsigned char *)(v15 + 12))
        {
          uint64_t v17 = v16;
          v96 = (WTF::Logger::LogSiteIdentifier *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
          WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v100, v96);
          WTF::String::String((WTF::String *)&v99, "presentation completed");
          *(void *)buf = v100;
          v98[0] = v99;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v98, &v101);
          if (!v101)
          {
            __break(0xC471u);
            JUMPOUT(0x198DE0374);
          }
          uint64_t v19 = v99;
          v99 = 0;
          if (v19)
          {
            if (*(_DWORD *)v19 == 2) {
              WTF::StringImpl::destroy(v19, v18);
            }
            else {
              *(_DWORD *)v19 -= 2;
            }
          }
          long long v46 = v100;
          v100 = 0;
          if (v46)
          {
            if (*(_DWORD *)v46 == 2) {
              WTF::StringImpl::destroy(v46, v18);
            }
            else {
              *(_DWORD *)v46 -= 2;
            }
          }
          uint64_t v48 = *(NSObject **)(v17 + 32);
          uint64_t v49 = (WTF *)os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
          if (v49)
          {
            WTF::String::utf8();
            double v51 = v98[0] ? (char *)v98[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v51;
            _os_log_impl(&dword_1985F2000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            uint64_t v49 = v98[0];
            v98[0] = 0;
            if (v49)
            {
              if (*(_DWORD *)v49 == 1) {
                uint64_t v49 = (WTF *)WTF::fastFree(v49, v50);
              }
              else {
                --*(_DWORD *)v49;
              }
            }
          }
          if (*(unsigned char *)v17)
          {
            uint64_t v56 = (atomic_uchar *)MEMORY[0x1E4F30998];
            while (1)
            {
              int v57 = *v56;
              if (v57) {
                break;
              }
              int v58 = *v56;
              atomic_compare_exchange_strong_explicit(v56, (unsigned __int8 *)&v58, v57 | 1, memory_order_acquire, memory_order_acquire);
              if (v58 == v57)
              {
                uint64_t v59 = WTF::Logger::observers(v49);
                uint64_t v60 = *(unsigned int *)(v59 + 12);
                if (v60)
                {
                  long long v61 = *(uint64_t **)v59;
                  uint64_t v62 = *(void *)v59 + 8 * v60;
                  do
                  {
                    uint64_t v63 = *v61;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v96);
                    int v103 = 0;
                    WTF::String::String((WTF::String *)v104, "presentation completed");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v98, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v63 + 16))(v63, v17, 0, v98);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v98, v64);
                    for (uint64_t j = 24; j != -8; j -= 16)
                    {
                      uint64_t v66 = *(WTF::StringImpl **)&buf[j];
                      *(void *)&buf[j] = 0;
                      if (v66)
                      {
                        if (*(_DWORD *)v66 == 2) {
                          WTF::StringImpl::destroy(v66, (WTF::StringImpl *)v50);
                        }
                        else {
                          *(_DWORD *)v66 -= 2;
                        }
                      }
                    }
                    ++v61;
                  }
                  while (v61 != (uint64_t *)v62);
                }
                int v67 = 1;
                atomic_compare_exchange_strong_explicit(v56, (unsigned __int8 *)&v67, 0, memory_order_release, memory_order_relaxed);
                if (v67 != 1) {
                  WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                }
                break;
              }
            }
          }
          v68 = v101;
          v101 = 0;
          if (v68)
          {
            if (*(_DWORD *)v68 == 2) {
              WTF::StringImpl::destroy(v68, (WTF::StringImpl *)v50);
            }
            else {
              *(_DWORD *)v68 -= 2;
            }
          }
        }
      }
    }
    objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_webView"), "becomeFirstResponder");
    WebKit::WebFullScreenManagerProxy::didEnterFullScreen(v11);
    uint64_t v69 = *((void *)v11 + 3);
    uint64_t v70 = *(void *)(v69 + 256);
    buf[0] = 0;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v70, buf, *(void *)(*(void *)(v69 + 32) + 1928), 0);
    WebKit::WebPageProxy::setSuppressVisibilityUpdates(v97, 0);
    [*(id *)(*(void *)(a1 + 32) + 336) showBanner];
    result = (atomic_uchar *)[*(id *)(a1 + 32) _videoPresentationManager];
    uint64_t v71 = (uint64_t)result;
    uint64_t v72 = *(void *)(a1 + 32);
    if (!result)
    {
LABEL_124:
      *(unsigned char *)(v72 + 378) = 0;
      return result;
    }
    if (!*(void *)(v72 + 368))
    {
      v73 = (void *)WTF::fastMalloc((WTF *)0x10);
      v74 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v74 = &unk_1EE9D51B8;
      v74[1] = v72;
      void *v73 = 0;
      v73[1] = v74;
      uint64_t v76 = *(void *)(a1 + 32);
      CGSize v77 = *(WTF **)(v76 + 368);
      *(void *)(v76 + 368) = v73;
      if (v77) {
        std::default_delete<WTF::Observer<void ()(BOOL)>>::operator()[abi:sn180100](v77, v75);
      }
      WTF::WeakHashSet<WTF::Observer<void ()(BOOL)>,WTF::DefaultWeakPtrImpl,(WTF::EnableWeakPtrThreadingAssertions)1>::add<WTF::Observer<void ()(BOOL)>>(v71 + 96, *(void **)(*(void *)(a1 + 32) + 368), (uint64_t)buf);
    }
    WebKit::VideoPresentationManagerProxy::returningToStandbyInterface(v71, buf);
    result = *(atomic_uchar **)buf;
    if (!*(void *)buf)
    {
LABEL_123:
      uint64_t v72 = *(void *)(a1 + 32);
      goto LABEL_124;
    }
    if (*(unsigned char *)(*(void *)(a1 + 32) + 378))
    {
      result = (atomic_uchar *)WebCore::VideoPresentationInterfaceIOS::preparedToReturnToStandby(*(WebCore::VideoPresentationInterfaceIOS **)buf);
      goto LABEL_121;
    }
    if (*(unsigned char *)(*(void *)buf + 160) || (*(unsigned char *)(*(void *)buf + 156) & 2) != 0)
    {
      uint64_t v78 = *(void *)(*(void *)buf + 136);
      if (v78)
      {
        char v79 = 0;
        v80 = *(atomic_uchar ***)(*(void *)buf + 144);
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v78, (unsigned __int8 *)&v79, 1u, memory_order_acquire, memory_order_acquire);
        if (v79) {
          result = (atomic_uchar *)MEMORY[0x19972E8D0](v78);
        }
        if (*(void *)(v78 + 24)) {
          ++*(void *)(v78 + 8);
        }
        else {
          v80 = 0;
        }
        int v94 = 1;
        atomic_compare_exchange_strong_explicit((atomic_uchar *volatile)v78, (unsigned __int8 *)&v94, 0, memory_order_release, memory_order_relaxed);
        if (v94 == 1)
        {
          if (!v80) {
            goto LABEL_121;
          }
          goto LABEL_157;
        }
        result = (atomic_uchar *)WTF::Lock::unlockSlow((WTF::Lock *)v78);
        if (v80)
        {
LABEL_157:
          *(unsigned char *)(*(void *)(a1 + 32) + 377) = 1;
          (*((void (**)(atomic_uchar **, void, void))*v80 + 4))(v80, 0, 0);
          result = WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationModel,(WTF::DestructionThread)0>(v80[1], v95);
        }
      }
    }
LABEL_121:
    if (*(void *)buf) {
      result = WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(atomic_uchar **)(*(void *)buf + 64));
    }
    goto LABEL_123;
  }
  v2[474] = 0;
  if ([*(id *)(a1 + 32) loggerPtr])
  {
    if ([*(id *)(a1 + 32) logChannel])
    {
      uint64_t v3 = [*(id *)(a1 + 32) loggerPtr];
      uint64_t v4 = [*(id *)(a1 + 32) logChannel];
      if (*(unsigned char *)(v3 + 12))
      {
        uint64_t v5 = v4;
        uint64_t v6 = (WTF::Logger::LogSiteIdentifier *)(*(void *)(*(void *)(a1 + 40) + 8) + 48);
        WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v100, v6);
        WTF::String::String((WTF::String *)&v99, "presentation completed, but exit requested");
        *(void *)buf = v100;
        v98[0] = v99;
        WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v98, &v101);
        if (v101)
        {
          uint64_t v8 = v99;
          v99 = 0;
          if (v8)
          {
            if (*(_DWORD *)v8 == 2) {
              WTF::StringImpl::destroy(v8, v7);
            }
            else {
              *(_DWORD *)v8 -= 2;
            }
          }
          int v26 = v100;
          v100 = 0;
          if (v26)
          {
            if (*(_DWORD *)v26 == 2) {
              WTF::StringImpl::destroy(v26, v7);
            }
            else {
              *(_DWORD *)v26 -= 2;
            }
          }
          v27 = *(NSObject **)(v5 + 32);
          v28 = (WTF *)os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
          if (v28)
          {
            WTF::String::utf8();
            long long v30 = v98[0] ? (char *)v98[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v30;
            _os_log_impl(&dword_1985F2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            v28 = v98[0];
            v98[0] = 0;
            if (v28)
            {
              if (*(_DWORD *)v28 == 1) {
                v28 = (WTF *)WTF::fastFree(v28, v29);
              }
              else {
                --*(_DWORD *)v28;
              }
            }
          }
          if (*(unsigned char *)v5 && *(unsigned char *)(v5 + 16))
          {
            uint64_t v31 = (atomic_uchar *)MEMORY[0x1E4F30998];
            while (1)
            {
              int v32 = *v31;
              if (v32) {
                break;
              }
              int v33 = *v31;
              atomic_compare_exchange_strong_explicit(v31, (unsigned __int8 *)&v33, v32 | 1, memory_order_acquire, memory_order_acquire);
              if (v33 == v32)
              {
                uint64_t v34 = WTF::Logger::observers(v28);
                uint64_t v35 = *(unsigned int *)(v34 + 12);
                if (v35)
                {
                  long long v36 = *(uint64_t **)v34;
                  uint64_t v37 = *(void *)v34 + 8 * v35;
                  do
                  {
                    uint64_t v38 = *v36;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v6);
                    int v103 = 0;
                    WTF::String::String((WTF::String *)v104, "presentation completed, but exit requested");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v98, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(void *)v38 + 16))(v38, v5, 1, v98);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v98, v39);
                    for (uint64_t k = 24; k != -8; k -= 16)
                    {
                      uint64_t v41 = *(WTF::StringImpl **)&buf[k];
                      *(void *)&buf[k] = 0;
                      if (v41)
                      {
                        if (*(_DWORD *)v41 == 2) {
                          WTF::StringImpl::destroy(v41, (WTF::StringImpl *)v29);
                        }
                        else {
                          *(_DWORD *)v41 -= 2;
                        }
                      }
                    }
                    ++v36;
                  }
                  while (v36 != (uint64_t *)v37);
                }
                int v42 = 1;
                atomic_compare_exchange_strong_explicit(v31, (unsigned __int8 *)&v42, 0, memory_order_release, memory_order_relaxed);
                if (v42 != 1) {
                  WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                }
                break;
              }
            }
          }
          uint64_t v43 = v101;
          v101 = 0;
          if (v43)
          {
            if (*(_DWORD *)v43 == 2) {
              WTF::StringImpl::destroy(v43, (WTF::StringImpl *)v29);
            }
            else {
              *(_DWORD *)v43 -= 2;
            }
          }
          goto LABEL_66;
        }
LABEL_162:
        __break(0xC471u);
        JUMPOUT(0x198DE036CLL);
      }
    }
  }
LABEL_66:
  uint64_t v44 = *(void **)(a1 + 32);

  return (atomic_uchar *)[v44 _exitFullscreenImmediately];
}

- (void)requestRestoreFullScreen:(void *)a3
{
  v65[1] = *MEMORY[0x1E4F143B8];
  if (self->_fullScreenState)
  {
    if (![(WKFullScreenWindowController *)self loggerPtr]) {
      return;
    }
    if (![(WKFullScreenWindowController *)self logChannel]) {
      return;
    }
    uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
    double v51 = [(WKFullScreenWindowController *)self logChannel];
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    CGFloat v54 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
    CGFloat v55 = [(WKFullScreenWindowController *)self logIdentifier];
    if (!v4[12]) {
      return;
    }
    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v59, (WTF::Logger::LogSiteIdentifier *)&v52);
    WTF::LogArgument<WebKit::FullScreenState>::toString(&v58);
    WTF::String::String((WTF::String *)&v56, " != NotInFullScreen, dropping");
    WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v59, (uint64_t *)&v58, (uint64_t *)&v56, &v60);
    uint64_t v6 = v56;
    uint64_t v56 = 0;
    if (v6)
    {
      if (*(_DWORD *)v6 == 2) {
        WTF::StringImpl::destroy(v6, v5);
      }
      else {
        *(_DWORD *)v6 -= 2;
      }
    }
    uint64_t v17 = v58;
    int v58 = 0;
    if (v17)
    {
      if (*(_DWORD *)v17 == 2) {
        WTF::StringImpl::destroy(v17, v5);
      }
      else {
        *(_DWORD *)v17 -= 2;
      }
    }
    double v18 = v59;
    uint64_t v59 = 0;
    if (v18)
    {
      if (*(_DWORD *)v18 == 2) {
        WTF::StringImpl::destroy(v18, v5);
      }
      else {
        *(_DWORD *)v18 -= 2;
      }
    }
    var4 = v51->var4;
    uint64_t v20 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
    if (v20)
    {
      WTF::String::utf8();
      uint64_t v22 = v57[0] ? (char *)v57[0] + 16 : 0;
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v22;
      _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      uint64_t v20 = v57[0];
      v57[0] = 0;
      if (v20)
      {
        if (*(_DWORD *)v20 == 1) {
          uint64_t v20 = (WTF *)WTF::fastFree(v20, v21);
        }
        else {
          --*(_DWORD *)v20;
        }
      }
    }
    if (v51->var0)
    {
      double v23 = (atomic_uchar *)MEMORY[0x1E4F30998];
      while (1)
      {
        int v24 = *v23;
        if (v24) {
          break;
        }
        int v25 = *v23;
        atomic_compare_exchange_strong_explicit(v23, (unsigned __int8 *)&v25, v24 | 1, memory_order_acquire, memory_order_acquire);
        if (v25 == v24)
        {
          uint64_t v26 = WTF::Logger::observers(v20);
          uint64_t v27 = *(unsigned int *)(v26 + 12);
          if (v27)
          {
            v28 = *(uint64_t **)v26;
            uint64_t v29 = *(void *)v26 + 8 * v27;
            do
            {
              uint64_t v30 = *v28;
              *(_DWORD *)buf = 0;
              WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)&v52);
              LODWORD(v62) = 0;
              WTF::LogArgument<WebKit::FullScreenState>::toString(&v63);
              int v64 = 0;
              WTF::String::String((WTF::String *)v65, " != NotInFullScreen, dropping");
              WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v57, (uint64_t)buf, 3uLL);
              (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, void, WTF **))(*(void *)v30 + 16))(v30, v51, 0, v57);
              WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v57, v31);
              for (uint64_t i = 40; i != -8; i -= 16)
              {
                int v33 = *(WTF::StringImpl **)&buf[i];
                *(void *)&buf[i] = 0;
                if (v33)
                {
                  if (*(_DWORD *)v33 == 2) {
                    WTF::StringImpl::destroy(v33, (WTF::StringImpl *)v21);
                  }
                  else {
                    *(_DWORD *)v33 -= 2;
                  }
                }
              }
              ++v28;
            }
            while (v28 != (uint64_t *)v29);
          }
          int v34 = 1;
          atomic_compare_exchange_strong_explicit(v23, (unsigned __int8 *)&v34, 0, memory_order_release, memory_order_relaxed);
          goto LABEL_55;
        }
      }
    }
LABEL_57:
    uint64_t v35 = v60;
    uint64_t v60 = 0;
    if (v35)
    {
      if (*(_DWORD *)v35 == 2) {
        WTF::StringImpl::destroy(v35, (WTF::StringImpl *)v21);
      }
      else {
        *(_DWORD *)v35 -= 2;
      }
    }
    return;
  }
  uint64_t v8 = [(WKFullScreenWindowController *)self _webView];
  if (v8)
  {
    [(WKWebView *)v8 _page];
    if (*(void *)buf) {
      (*(void (**)(void))(**(void **)(*(void *)buf + 104) + 32))(*(void *)(*(void *)buf + 104));
    }
  }
  uint64_t v9 = [(WKFullScreenWindowController *)self _manager];
  uint64_t v10 = [(WKFullScreenWindowController *)self loggerPtr];
  if (!v9)
  {
    if (!v10) {
      return;
    }
    if (![(WKFullScreenWindowController *)self logChannel]) {
      return;
    }
    int v13 = [(WKFullScreenWindowController *)self loggerPtr];
    uint64_t v14 = [(WKFullScreenWindowController *)self logChannel];
    uint64_t v52 = 0;
    uint64_t v53 = 0;
    CGFloat v54 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
    CGFloat v55 = [(WKFullScreenWindowController *)self logIdentifier];
    if (!v13[12]) {
      return;
    }
    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v59, (WTF::Logger::LogSiteIdentifier *)&v52);
    WTF::String::String((WTF::String *)&v58, "manager missing, dropping");
    *(void *)buf = v59;
    v57[0] = v58;
    WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v57, &v60);
    if (!v60)
    {
      __break(0xC471u);
      return;
    }
    uint64_t v16 = v58;
    int v58 = 0;
    if (v16)
    {
      if (*(_DWORD *)v16 == 2) {
        WTF::StringImpl::destroy(v16, v15);
      }
      else {
        *(_DWORD *)v16 -= 2;
      }
    }
    long long v36 = v59;
    uint64_t v59 = 0;
    if (v36)
    {
      if (*(_DWORD *)v36 == 2) {
        WTF::StringImpl::destroy(v36, v15);
      }
      else {
        *(_DWORD *)v36 -= 2;
      }
    }
    uint64_t v37 = v14->var4;
    uint64_t v38 = (WTF *)os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT);
    if (v38)
    {
      WTF::String::utf8();
      long long v39 = v57[0] ? (char *)v57[0] + 16 : 0;
      *(_DWORD *)buf = 136446210;
      *(void *)&buf[4] = v39;
      _os_log_impl(&dword_1985F2000, v37, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
      uint64_t v38 = v57[0];
      v57[0] = 0;
      if (v38)
      {
        if (*(_DWORD *)v38 == 1) {
          uint64_t v38 = (WTF *)WTF::fastFree(v38, v21);
        }
        else {
          --*(_DWORD *)v38;
        }
      }
    }
    if (v14->var0 && v14->var2)
    {
      uint64_t v40 = (atomic_uchar *)MEMORY[0x1E4F30998];
      while (1)
      {
        int v41 = *v40;
        if (v41) {
          break;
        }
        int v42 = *v40;
        atomic_compare_exchange_strong_explicit(v40, (unsigned __int8 *)&v42, v41 | 1, memory_order_acquire, memory_order_acquire);
        if (v42 == v41)
        {
          uint64_t v43 = WTF::Logger::observers(v38);
          uint64_t v44 = *(unsigned int *)(v43 + 12);
          if (v44)
          {
            uint64_t v45 = *(uint64_t **)v43;
            uint64_t v46 = *(void *)v43 + 8 * v44;
            do
            {
              uint64_t v47 = *v45;
              *(_DWORD *)buf = 0;
              WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)&v52);
              LODWORD(v62) = 0;
              WTF::String::String((WTF::String *)&v63, "manager missing, dropping");
              WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v57, (uint64_t)buf, 2uLL);
              (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, uint64_t, WTF **))(*(void *)v47 + 16))(v47, v14, 1, v57);
              WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v57, v48);
              for (uint64_t j = 24; j != -8; j -= 16)
              {
                uint64_t v50 = *(WTF::StringImpl **)&buf[j];
                *(void *)&buf[j] = 0;
                if (v50)
                {
                  if (*(_DWORD *)v50 == 2) {
                    WTF::StringImpl::destroy(v50, (WTF::StringImpl *)v21);
                  }
                  else {
                    *(_DWORD *)v50 -= 2;
                  }
                }
              }
              ++v45;
            }
            while (v45 != (uint64_t *)v46);
          }
          int v34 = 1;
          atomic_compare_exchange_strong_explicit(v40, (unsigned __int8 *)&v34, 0, memory_order_release, memory_order_relaxed);
LABEL_55:
          if (v34 != 1) {
            WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
          }
          goto LABEL_57;
        }
      }
    }
    goto LABEL_57;
  }
  if (v10)
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      long long v11 = [(WKFullScreenWindowController *)self loggerPtr];
      BOOL v12 = [(WKFullScreenWindowController *)self logChannel];
      *(_OWORD *)buf = 0uLL;
      uint64_t v62 = "-[WKFullScreenWindowController requestRestoreFullScreen:]";
      uint64_t v63 = [(WKFullScreenWindowController *)self logIdentifier];
      if (v11[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v12, 0, (WTF::Logger::LogSiteIdentifier *)buf);
      }
    }
  }
  WebKit::WebFullScreenManagerProxy::requestRestoreFullScreen(v9, (uint64_t *)a3);
}

- (void)requestExitFullScreen
{
  v42[1] = *MEMORY[0x1E4F143B8];
  if (self->_fullScreenState == 3)
  {
    uint64_t v3 = [(WKFullScreenWindowController *)self _manager];
    uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
    if (v3)
    {
      if (v4 && [(WKFullScreenWindowController *)self logChannel])
      {
        uint64_t v5 = [(WKFullScreenWindowController *)self loggerPtr];
        uint64_t v6 = [(WKFullScreenWindowController *)self logChannel];
        *(_OWORD *)buf = 0uLL;
        long long v39 = "-[WKFullScreenWindowController requestExitFullScreen]";
        uint64_t v40 = [(WKFullScreenWindowController *)self logIdentifier];
        if (v5[12]) {
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)buf);
        }
      }
      WebKit::WebFullScreenManagerProxy::requestExitFullScreen(v3);
      self->_exitingFullScreen = 1;
    }
    else
    {
      if (v4)
      {
        if ([(WKFullScreenWindowController *)self logChannel])
        {
          uint64_t v10 = [(WKFullScreenWindowController *)self loggerPtr];
          long long v11 = [(WKFullScreenWindowController *)self logChannel];
          *(_OWORD *)buf = 0uLL;
          long long v39 = "-[WKFullScreenWindowController requestExitFullScreen]";
          uint64_t v40 = [(WKFullScreenWindowController *)self logIdentifier];
          if (v10[12]) {
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [16]>((uint64_t)v11, (WTF::Logger::LogSiteIdentifier *)buf);
          }
        }
      }
      [(WKFullScreenWindowController *)self _exitFullscreenImmediately];
    }
  }
  else
  {
    if ([(WKFullScreenWindowController *)self loggerPtr])
    {
      if ([(WKFullScreenWindowController *)self logChannel])
      {
        uint64_t v7 = [(WKFullScreenWindowController *)self loggerPtr];
        uint64_t v31 = [(WKFullScreenWindowController *)self logChannel];
        v32[0] = 0;
        v32[1] = 0;
        v32[2] = "-[WKFullScreenWindowController requestExitFullScreen]";
        v32[3] = [(WKFullScreenWindowController *)self logIdentifier];
        if (v7[12])
        {
          WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v36, (WTF::Logger::LogSiteIdentifier *)v32);
          WTF::LogArgument<WebKit::FullScreenState>::toString(&v35);
          WTF::String::String((WTF::String *)&v34, " != InFullScreen");
          WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v36, (uint64_t *)&v35, (uint64_t *)&v34, &v37);
          uint64_t v9 = v34;
          int v34 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2) {
              WTF::StringImpl::destroy(v9, v8);
            }
            else {
              *(_DWORD *)v9 -= 2;
            }
          }
          BOOL v12 = v35;
          uint64_t v35 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2) {
              WTF::StringImpl::destroy(v12, v8);
            }
            else {
              *(_DWORD *)v12 -= 2;
            }
          }
          int v13 = v36;
          long long v36 = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2) {
              WTF::StringImpl::destroy(v13, v8);
            }
            else {
              *(_DWORD *)v13 -= 2;
            }
          }
          var4 = v31->var4;
          uint64_t v15 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            WTF::String::utf8();
            uint64_t v17 = v33[0] ? (char *)v33[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v17;
            _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            uint64_t v15 = v33[0];
            v33[0] = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 1) {
                uint64_t v15 = (WTF *)WTF::fastFree(v15, v16);
              }
              else {
                --*(_DWORD *)v15;
              }
            }
          }
          if (v31->var0)
          {
            double v18 = (atomic_uchar *)MEMORY[0x1E4F30998];
            while (1)
            {
              int v19 = *v18;
              if (v19) {
                break;
              }
              int v20 = *v18;
              atomic_compare_exchange_strong_explicit(v18, (unsigned __int8 *)&v20, v19 | 1, memory_order_acquire, memory_order_acquire);
              if (v20 == v19)
              {
                uint64_t v21 = WTF::Logger::observers(v15);
                uint64_t v22 = *(unsigned int *)(v21 + 12);
                if (v22)
                {
                  double v23 = *(uint64_t **)v21;
                  uint64_t v24 = *(void *)v21 + 8 * v22;
                  do
                  {
                    uint64_t v25 = *v23;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v32);
                    LODWORD(v39) = 0;
                    WTF::LogArgument<WebKit::FullScreenState>::toString(&v40);
                    int v41 = 0;
                    WTF::String::String((WTF::String *)v42, " != InFullScreen");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v33, (uint64_t)buf, 3uLL);
                    (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, void, WTF **))(*(void *)v25 + 16))(v25, v31, 0, v33);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v33, v26);
                    for (uint64_t i = 40; i != -8; i -= 16)
                    {
                      v28 = *(WTF::StringImpl **)&buf[i];
                      *(void *)&buf[i] = 0;
                      if (v28)
                      {
                        if (*(_DWORD *)v28 == 2) {
                          WTF::StringImpl::destroy(v28, (WTF::StringImpl *)v16);
                        }
                        else {
                          *(_DWORD *)v28 -= 2;
                        }
                      }
                    }
                    ++v23;
                  }
                  while (v23 != (uint64_t *)v24);
                }
                int v29 = 1;
                atomic_compare_exchange_strong_explicit(v18, (unsigned __int8 *)&v29, 0, memory_order_release, memory_order_relaxed);
                if (v29 != 1) {
                  WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                }
                break;
              }
            }
          }
          uint64_t v30 = v37;
          uint64_t v37 = 0;
          if (v30)
          {
            if (*(_DWORD *)v30 == 2) {
              WTF::StringImpl::destroy(v30, (WTF::StringImpl *)v16);
            }
            else {
              *(_DWORD *)v30 -= 2;
            }
          }
        }
      }
    }
    self->_exitRequested = 1;
  }
}

- (void)exitFullScreen
{
  v47[1] = *MEMORY[0x1E4F143B8];
  int64_t fullScreenState = self->_fullScreenState;
  if (fullScreenState)
  {
    if (fullScreenState > 2)
    {
      [(WKWebView *)[(WKFullScreenWindowController *)self _webView] _beginAnimatedFullScreenExit];
      self->_int64_t fullScreenState = 4;
      self->_exitingFullScreen = 1;
      uint64_t v9 = [(WKFullScreenWindowController *)self _manager];
      uint64_t v10 = [(WKFullScreenWindowController *)self loggerPtr];
      if (v9)
      {
        if (v10)
        {
          if ([(WKFullScreenWindowController *)self logChannel])
          {
            long long v11 = [(WKFullScreenWindowController *)self loggerPtr];
            BOOL v12 = [(WKFullScreenWindowController *)self logChannel];
            *(_OWORD *)buf = 0uLL;
            uint64_t v44 = "-[WKFullScreenWindowController exitFullScreen]";
            uint64_t v45 = [(WKFullScreenWindowController *)self logIdentifier];
            if (v11[12]) {
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v12, 0, (WTF::Logger::LogSiteIdentifier *)buf);
            }
          }
        }
        uint64_t v13 = v9[3];
        uint64_t v14 = *(void *)(v13 + 256);
        buf[0] = 1;
        WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v14, (char *)buf, *(void *)(*(void *)(v13 + 32) + 1928), 0);
        WebKit::WebFullScreenManagerProxy::willExitFullScreen((WebKit::WebFullScreenManagerProxy *)v9);
      }
      else
      {
        if (v10)
        {
          if ([(WKFullScreenWindowController *)self logChannel])
          {
            uint64_t v15 = [(WKFullScreenWindowController *)self loggerPtr];
            uint64_t v16 = [(WKFullScreenWindowController *)self logChannel];
            *(_OWORD *)buf = 0uLL;
            uint64_t v44 = "-[WKFullScreenWindowController exitFullScreen]";
            uint64_t v45 = [(WKFullScreenWindowController *)self logIdentifier];
            if (v15[12]) {
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [16]>((uint64_t)v16, (WTF::Logger::LogSiteIdentifier *)buf);
            }
          }
        }
        [(WKFullScreenWindowController *)self _exitFullscreenImmediately];
      }
    }
    else
    {
      if ([(WKFullScreenWindowController *)self loggerPtr])
      {
        if ([(WKFullScreenWindowController *)self logChannel])
        {
          uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
          long long v36 = [(WKFullScreenWindowController *)self logChannel];
          v37[0] = 0;
          v37[1] = 0;
          v37[2] = "-[WKFullScreenWindowController exitFullScreen]";
          v37[3] = [(WKFullScreenWindowController *)self logIdentifier];
          if (v4[12])
          {
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v41, (WTF::Logger::LogSiteIdentifier *)v37);
            WTF::LogArgument<WebKit::FullScreenState>::toString(&v40);
            WTF::String::String((WTF::String *)&v39, " < InFullScreen");
            WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v41, (uint64_t *)&v40, (uint64_t *)&v39, &v42);
            uint64_t v6 = v39;
            long long v39 = 0;
            if (v6)
            {
              if (*(_DWORD *)v6 == 2) {
                WTF::StringImpl::destroy(v6, v5);
              }
              else {
                *(_DWORD *)v6 -= 2;
              }
            }
            uint64_t v17 = v40;
            uint64_t v40 = 0;
            if (v17)
            {
              if (*(_DWORD *)v17 == 2) {
                WTF::StringImpl::destroy(v17, v5);
              }
              else {
                *(_DWORD *)v17 -= 2;
              }
            }
            double v18 = v41;
            int v41 = 0;
            if (v18)
            {
              if (*(_DWORD *)v18 == 2) {
                WTF::StringImpl::destroy(v18, v5);
              }
              else {
                *(_DWORD *)v18 -= 2;
              }
            }
            var4 = v36->var4;
            int v20 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
            if (v20)
            {
              WTF::String::utf8();
              uint64_t v22 = v38[0] ? (char *)v38[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v22;
              _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              int v20 = v38[0];
              v38[0] = 0;
              if (v20)
              {
                if (*(_DWORD *)v20 == 1) {
                  int v20 = (WTF *)WTF::fastFree(v20, v21);
                }
                else {
                  --*(_DWORD *)v20;
                }
              }
            }
            if (v36->var0)
            {
              double v23 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v24 = *v23;
                if (v24) {
                  break;
                }
                int v25 = *v23;
                atomic_compare_exchange_strong_explicit(v23, (unsigned __int8 *)&v25, v24 | 1, memory_order_acquire, memory_order_acquire);
                if (v25 == v24)
                {
                  uint64_t v26 = WTF::Logger::observers(v20);
                  uint64_t v27 = *(unsigned int *)(v26 + 12);
                  if (v27)
                  {
                    v28 = *(uint64_t **)v26;
                    uint64_t v29 = *(void *)v26 + 8 * v27;
                    do
                    {
                      uint64_t v30 = *v28;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v37);
                      LODWORD(v44) = 0;
                      WTF::LogArgument<WebKit::FullScreenState>::toString(&v45);
                      int v46 = 0;
                      WTF::String::String((WTF::String *)v47, " < InFullScreen");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v38, (uint64_t)buf, 3uLL);
                      (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, void, WTF **))(*(void *)v30 + 16))(v30, v36, 0, v38);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v38, v31);
                      for (uint64_t i = 40; i != -8; i -= 16)
                      {
                        int v33 = *(WTF::StringImpl **)&buf[i];
                        *(void *)&buf[i] = 0;
                        if (v33)
                        {
                          if (*(_DWORD *)v33 == 2) {
                            WTF::StringImpl::destroy(v33, (WTF::StringImpl *)v21);
                          }
                          else {
                            *(_DWORD *)v33 -= 2;
                          }
                        }
                      }
                      ++v28;
                    }
                    while (v28 != (uint64_t *)v29);
                  }
                  int v34 = 1;
                  atomic_compare_exchange_strong_explicit(MEMORY[0x1E4F30998], (unsigned __int8 *)&v34, 0, memory_order_release, memory_order_relaxed);
                  if (v34 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            uint64_t v35 = v42;
            int v42 = 0;
            if (v35)
            {
              if (*(_DWORD *)v35 == 2) {
                WTF::StringImpl::destroy(v35, (WTF::StringImpl *)v21);
              }
              else {
                *(_DWORD *)v35 -= 2;
              }
            }
          }
        }
      }
      self->_exitRequested = 1;
    }
  }
  else if ([(WKFullScreenWindowController *)self loggerPtr])
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v7 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v8 = [(WKFullScreenWindowController *)self logChannel];
      *(_OWORD *)buf = 0uLL;
      uint64_t v44 = "-[WKFullScreenWindowController exitFullScreen]";
      uint64_t v45 = [(WKFullScreenWindowController *)self logIdentifier];
      if (v7[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState,char [11]>((uint64_t)v8, (WTF::Logger::LogSiteIdentifier *)buf);
      }
    }
  }
}

- (void)beganExitFullScreenWithInitialFrame:(CGRect)a3 finalFrame:(CGRect)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  CGRect v53 = a3;
  CGRect v52 = a4;
  int64_t fullScreenState = self->_fullScreenState;
  uint64_t v6 = [(WKFullScreenWindowController *)self loggerPtr];
  if (fullScreenState == 4)
  {
    if (v6)
    {
      if ([(WKFullScreenWindowController *)self logChannel])
      {
        uint64_t v7 = [(WKFullScreenWindowController *)self loggerPtr];
        uint64_t v8 = [(WKFullScreenWindowController *)self logChannel];
        *(_OWORD *)buf = 0uLL;
        uint64_t v60 = "-[WKFullScreenWindowController beganExitFullScreenWithInitialFrame:finalFrame:]";
        long long v61 = [(WKFullScreenWindowController *)self logIdentifier];
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v51, &v53);
        WebCore::FloatRect::FloatRect((WebCore::FloatRect *)v54, &v52);
        if (v7[12]) {
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebCore::FloatRect,char [3],WebCore::FloatRect>((uint64_t)v8, (WTF::Logger::LogSiteIdentifier *)buf, (WebCore::FloatRect *)v51, (WebCore::FloatRect *)v54);
        }
      }
    }
    CGSize size = v53.size;
    self->_initialFrame.origin = v53.origin;
    self->_initialFrame.CGSize size = size;
    CGSize v10 = v52.size;
    self->_finalFrame.origin = v52.origin;
    self->_finalFrame.CGSize size = v10;
    __asm { FMOV            V2.2D, #1.0 }
    CGSize v15 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_initialFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_initialFrame.size);
    self->_int64_t fullScreenState = 5;
    self->_initialFrame.CGSize size = v15;
    CGSize v49 = (CGSize)vbslq_s8((int8x16_t)vcgtq_f64(_Q2, (float64x2_t)self->_finalFrame.size), (int8x16_t)_Q2, (int8x16_t)self->_finalFrame.size);
    self->_finalFrame.CGSize size = v49;
    double x = self->_finalFrame.origin.x;
    double y = self->_finalFrame.origin.y;
    objc_msgSend((id)objc_msgSend(self->_rootViewController.m_ptr, "view"), "frame");
    CGFloat width = v49.width;
    if (y > v19
      || ((CGFloat height = v49.height, y >= -v49.height) ? (v22 = x <= v18) : (v22 = 0),
          v22 ? (_NF = x < -v49.width) : (_NF = 1),
          _NF))
    {
      double x = v18 * 0.5;
      double y = v19 * 0.5;
      CGFloat width = 1.0;
      CGFloat height = 1.0;
    }
    self->_finalFrame.origin.double x = x;
    self->_finalFrame.origin.double y = y;
    self->_finalFrame.size.CGFloat width = width;
    self->_finalFrame.size.CGFloat height = height;
    int v24 = [(WKFullScreenWindowController *)self _webView];
    if (v24)
    {
      [(WKWebView *)v24 _page];
      if (*(void *)buf) {
        WebKit::WebPageProxy::setSuppressVisibilityUpdates(*(WebKit::WebPageProxy **)buf, 1);
      }
    }
    CFRetain(self);
    int v25 = (void *)WTF::fastMalloc((WTF *)0x18);
    *int v25 = &unk_1EE9D52C8;
    v25[1] = self;
    v25[2] = self;
    *(void *)buf = v25;
    WTF::CompletionHandler<void ()(void)>::operator()((uint64_t *)buf);
    uint64_t v26 = *(void *)buf;
    *(void *)buf = 0;
    if (v26) {
      (*(void (**)(uint64_t))(*(void *)v26 + 8))(v26);
    }
  }
  else if (v6)
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v27 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v50 = [(WKFullScreenWindowController *)self logChannel];
      v51[0] = 0;
      v51[1] = 0;
      v51[2] = "-[WKFullScreenWindowController beganExitFullScreenWithInitialFrame:finalFrame:]";
      v51[3] = [(WKFullScreenWindowController *)self logIdentifier];
      if (v27[12])
      {
        WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v57, (WTF::Logger::LogSiteIdentifier *)v51);
        WTF::LogArgument<WebKit::FullScreenState>::toString(&v56);
        WTF::String::String((WTF::String *)&v55, " != WaitingToExitFullScreen, dropping");
        WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v57, (uint64_t *)&v56, (uint64_t *)&v55, &v58);
        uint64_t v29 = v55;
        CGFloat v55 = 0;
        if (v29)
        {
          if (*(_DWORD *)v29 == 2) {
            WTF::StringImpl::destroy(v29, v28);
          }
          else {
            *(_DWORD *)v29 -= 2;
          }
        }
        uint64_t v30 = v56;
        uint64_t v56 = 0;
        if (v30)
        {
          if (*(_DWORD *)v30 == 2) {
            WTF::StringImpl::destroy(v30, v28);
          }
          else {
            *(_DWORD *)v30 -= 2;
          }
        }
        uint64_t v31 = v57;
        int v57 = 0;
        if (v31)
        {
          if (*(_DWORD *)v31 == 2) {
            WTF::StringImpl::destroy(v31, v28);
          }
          else {
            *(_DWORD *)v31 -= 2;
          }
        }
        var4 = v50->var4;
        int v33 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
        if (v33)
        {
          WTF::String::utf8();
          uint64_t v35 = v54[0] ? (char *)v54[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = v35;
          _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          int v33 = v54[0];
          v54[0] = 0;
          if (v33)
          {
            if (*(_DWORD *)v33 == 1) {
              int v33 = (WTF *)WTF::fastFree(v33, v34);
            }
            else {
              --*(_DWORD *)v33;
            }
          }
        }
        if (v50->var0)
        {
          long long v36 = (atomic_uchar *)MEMORY[0x1E4F30998];
          while (1)
          {
            int v37 = *v36;
            if (v37) {
              break;
            }
            int v38 = *v36;
            atomic_compare_exchange_strong_explicit(v36, (unsigned __int8 *)&v38, v37 | 1, memory_order_acquire, memory_order_acquire);
            if (v38 == v37)
            {
              uint64_t v39 = WTF::Logger::observers(v33);
              uint64_t v40 = *(unsigned int *)(v39 + 12);
              if (v40)
              {
                int v41 = *(uint64_t **)v39;
                uint64_t v42 = *(void *)v39 + 8 * v40;
                do
                {
                  uint64_t v43 = *v41;
                  *(_DWORD *)buf = 0;
                  WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v51);
                  LODWORD(v60) = 0;
                  WTF::LogArgument<WebKit::FullScreenState>::toString(&v61);
                  int v62 = 0;
                  WTF::String::String((WTF::String *)v63, " != WaitingToExitFullScreen, dropping");
                  WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v54, (uint64_t)buf, 3uLL);
                  (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, void, WTF **))(*(void *)v43 + 16))(v43, v50, 0, v54);
                  WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v54, v44);
                  for (uint64_t i = 40; i != -8; i -= 16)
                  {
                    int v46 = *(WTF::StringImpl **)&buf[i];
                    *(void *)&buf[i] = 0;
                    if (v46)
                    {
                      if (*(_DWORD *)v46 == 2) {
                        WTF::StringImpl::destroy(v46, (WTF::StringImpl *)v34);
                      }
                      else {
                        *(_DWORD *)v46 -= 2;
                      }
                    }
                  }
                  ++v41;
                }
                while (v41 != (uint64_t *)v42);
              }
              int v47 = 1;
              atomic_compare_exchange_strong_explicit(v36, (unsigned __int8 *)&v47, 0, memory_order_release, memory_order_relaxed);
              if (v47 != 1) {
                WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
              }
              break;
            }
          }
        }
        uint64_t v48 = v58;
        int v58 = 0;
        if (v48)
        {
          if (*(_DWORD *)v48 == 2) {
            WTF::StringImpl::destroy(v48, (WTF::StringImpl *)v34);
          }
          else {
            *(_DWORD *)v48 -= 2;
          }
        }
      }
    }
  }
}

- (void)_reinsertWebViewUnderPlaceholder
{
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setDisableActions:1];
  uint64_t v3 = [(WKFullScreenWindowController *)self _webView];
  uint64_t v4 = v3;
  if (v3) {
    CFRetain(v3);
  }
  objc_msgSend((id)objc_msgSend(self->_webViewPlaceholder.m_ptr, "superview"), "insertSubview:belowSubview:", v4, self->_webViewPlaceholder.m_ptr);
  [self->_webViewPlaceholder.m_ptr frame];
  -[WKWebView setFrame:](v4, "setFrame:");
  -[WKWebView setAutoresizingMask:](v4, "setAutoresizingMask:", [self->_webViewPlaceholder.m_ptr autoresizingMask]);
  [(WKWebView *)v4 becomeFirstResponder];
  [(WKWebView *)v4 _clearOverrideZoomScaleParameters];
  WebKit::WKWebViewState::applyTo((WebKit::WKWebViewState *)&self->_viewState, v4);
  if (v4)
  {
    [(WKWebView *)v4 _page];
    if (v6)
    {
      v5[0] = 0;
      v5[40] = 0;
      WebKit::WebPageProxy::setOverrideViewportArguments(v6, (uint64_t)v5);
    }
  }
  [(WKWebView *)v4 setNeedsLayout];
  [(WKWebView *)v4 layoutIfNeeded];
  [(WKWebView *)v4 _endAnimatedFullScreenExit];
  [MEMORY[0x1E4F39CF8] commit];
  if (v4) {
    CFRelease(v4);
  }
}

- (void)_completedExitFullScreen
{
  v2 = (const void *)a1[1];
  *a1 = &unk_1EE9D52F0;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (void)close
{
  if ([(WKFullScreenWindowController *)self loggerPtr])
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v3 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v4 = [(WKFullScreenWindowController *)self logChannel];
      uint64_t v5 = 0;
      uint64_t v6 = 0;
      uint64_t v7 = "-[WKFullScreenWindowController close]";
      uint64_t v8 = [(WKFullScreenWindowController *)self logIdentifier];
      if (v3[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v4, 0, (WTF::Logger::LogSiteIdentifier *)&v5);
      }
    }
  }
  [(WKFullScreenWindowController *)self _exitFullscreenImmediately];
  [(WKFullScreenWindowController *)self set_webView:0];
}

- (void)webViewDidRemoveFromSuperviewWhileInFullscreen
{
  if ([(WKFullScreenWindowController *)self loggerPtr])
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v3 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v4 = [(WKFullScreenWindowController *)self logChannel];
      v5[0] = 0;
      v5[1] = 0;
      v5[2] = "-[WKFullScreenWindowController webViewDidRemoveFromSuperviewWhileInFullscreen]";
      v5[3] = [(WKFullScreenWindowController *)self logIdentifier];
      if (v3[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState>((uint64_t)v4, (WTF::Logger::LogSiteIdentifier *)v5);
      }
    }
  }
  if (self->_fullScreenState == 3
    && (void *)[(WKWebView *)[(WKFullScreenWindowController *)self _webView] window] != self->_window.m_ptr)
  {
    [(WKFullScreenWindowController *)self _exitFullscreenImmediately];
  }
}

- (void)videoControlsManagerDidChange
{
  m_ptr = self->_fullscreenViewController.m_ptr;
  if (m_ptr) {
    [m_ptr videoControlsManagerDidChange];
  }
}

- (void)placeholderWillMoveToSuperview:(id)a3
{
  if (!a3)
  {
    WTF::RunLoop::main((WTF::RunLoop *)self);
    if (self) {
      CFRetain(self);
    }
    uint64_t v4 = (void *)WTF::fastMalloc((WTF *)0x18);
    void *v4 = &unk_1EE9D5318;
    v4[1] = self;
    v4[2] = self;
    uint64_t v5 = v4;
    WTF::RunLoop::dispatch();
    if (v5) {
      (*(void (**)(void *))(*v5 + 8))(v5);
    }
  }
}

- (void)didEnterPictureInPicture
{
  if ([(WKFullScreenWindowController *)self loggerPtr])
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v3 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v4 = [(WKFullScreenWindowController *)self logChannel];
      v5[0] = 0;
      v5[1] = 0;
      v5[2] = "-[WKFullScreenWindowController didEnterPictureInPicture]";
      v5[3] = [(WKFullScreenWindowController *)self logIdentifier];
      if (v3[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState>((uint64_t)v4, (WTF::Logger::LogSiteIdentifier *)v5);
      }
    }
  }
  self->_shouldReturnToFullscreenFromPictureInPicture = !self->_blocksReturnToFullscreenFromPictureInPicture;
  if (self->_fullScreenState == 3) {
    [(WKFullScreenWindowController *)self requestExitFullScreen];
  }
}

- (void)didExitPictureInPicture
{
  uint64_t v2 = a1[1];
  *a1 = &unk_1EE9D5340;
  a1[1] = 0;
  if (v2) {
    WTF::ThreadSafeWeakPtrControlBlock::strongDeref<WebCore::VideoPresentationInterfaceIOS,(WTF::DestructionThread)2>(*(atomic_uchar **)(v2 + 64));
  }
  return a1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  uint64_t v7 = objc_alloc_init(WKFullscreenAnimationController);
  [(WKFullscreenAnimationController *)v7 setViewController:a3];
  -[WKFullscreenAnimationController setInitialFrame:](v7, "setInitialFrame:", self->_initialFrame.origin.x, self->_initialFrame.origin.y, self->_initialFrame.size.width, self->_initialFrame.size.height);
  -[WKFullscreenAnimationController setFinalFrame:](v7, "setFinalFrame:", self->_finalFrame.origin.x, self->_finalFrame.origin.y, self->_finalFrame.size.width, self->_finalFrame.size.height);
  [(WKFullscreenAnimationController *)v7 setAnimatingIn:1];
  uint64_t v8 = (void *)CFMakeCollectable(v7);

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (self->_inInteractiveDismiss) {
    double height = self->_finalFrame.size.height;
  }
  else {
    double height = self->_initialFrame.size.height;
  }
  if (self->_inInteractiveDismiss) {
    double width = self->_finalFrame.size.width;
  }
  else {
    double width = self->_initialFrame.size.width;
  }
  if (self->_inInteractiveDismiss) {
    double y = self->_finalFrame.origin.y;
  }
  else {
    double y = self->_initialFrame.origin.y;
  }
  if (self->_inInteractiveDismiss) {
    double x = self->_finalFrame.origin.x;
  }
  else {
    double x = self->_initialFrame.origin.x;
  }
  if (self->_inInteractiveDismiss) {
    double v8 = self->_initialFrame.size.height;
  }
  else {
    double v8 = self->_finalFrame.size.height;
  }
  if (self->_inInteractiveDismiss) {
    double v9 = self->_initialFrame.size.width;
  }
  else {
    double v9 = self->_finalFrame.size.width;
  }
  if (self->_inInteractiveDismiss) {
    double v10 = self->_initialFrame.origin.y;
  }
  else {
    double v10 = self->_finalFrame.origin.y;
  }
  if (self->_inInteractiveDismiss) {
    double v11 = self->_initialFrame.origin.x;
  }
  else {
    double v11 = self->_finalFrame.origin.x;
  }
  BOOL v12 = objc_alloc_init(WKFullscreenAnimationController);
  [(WKFullscreenAnimationController *)v12 setViewController:a3];
  -[WKFullscreenAnimationController setInitialFrame:](v12, "setInitialFrame:", x, y, width, height);
  -[WKFullscreenAnimationController setFinalFrame:](v12, "setFinalFrame:", v11, v10, v9, v8);
  [(WKFullscreenAnimationController *)v12 setAnimatingIn:0];
  uint64_t v13 = (void *)CFMakeCollectable(v12);

  return v13;
}

- (id)interactionControllerForDismissal:(id)a3
{
  if (!self->_inInteractiveDismiss) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  id result = self->_interactiveDismissTransitionCoordinator.m_ptr;
  if (!result)
  {
    double v6 = *MEMORY[0x1E4F1DAD8];
    double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    if ([self->_interactivePanDismissGestureRecognizer.m_ptr state] == 1)
    {
      objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "locationInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view"));
      double v6 = v8;
      double v7 = v9;
    }
    id result = -[WKFullScreenInteractiveTransition initWithAnimator:anchor:]([WKFullScreenInteractiveTransition alloc], "initWithAnimator:anchor:", a3, v6, v7);
    m_ptr = self->_interactiveDismissTransitionCoordinator.m_ptr;
    self->_interactiveDismissTransitionCoordinator.m_ptr = result;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      return self->_interactiveDismissTransitionCoordinator.m_ptr;
    }
  }
  return result;
}

- (void)_exitFullscreenImmediately
{
  int64_t fullScreenState = self->_fullScreenState;
  uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
  if (fullScreenState)
  {
    if (v4)
    {
      if ([(WKFullScreenWindowController *)self logChannel])
      {
        uint64_t v5 = [(WKFullScreenWindowController *)self loggerPtr];
        double v6 = [(WKFullScreenWindowController *)self logChannel];
        double v23 = 0;
        uint64_t v24 = 0;
        int v25 = "-[WKFullScreenWindowController _exitFullscreenImmediately]";
        uint64_t v26 = [(WKFullScreenWindowController *)self logIdentifier];
        if (v5[12]) {
          WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)&v23);
        }
      }
    }
    self->_exitRequested = 0;
    self->_exitingFullScreen = 0;
    self->_int64_t fullScreenState = 0;
    self->_shouldReturnToFullscreenFromPictureInPicture = 0;
    double v7 = [(WKFullScreenWindowController *)self _webView];
    if (v7)
    {
      [(WKWebView *)v7 _page];
      double v8 = v23;
      if (v23)
      {
        WebKit::WebPageProxy::setSuppressVisibilityUpdates(v23, 1);
        char v9 = 0;
LABEL_15:
        [(WKFullScreenWindowController *)self _reinsertWebViewUnderPlaceholder];
        BOOL v12 = [(WKFullScreenWindowController *)self _manager];
        if (v12)
        {
          uint64_t v13 = (WebKit::WebFullScreenManagerProxy *)v12;
          WebKit::WebFullScreenManagerProxy::requestExitFullScreen((WebKit::WebFullScreenManagerProxy *)v12);
          uint64_t v14 = *((void *)v13 + 3);
          uint64_t v15 = *(void *)(v14 + 256);
          LOBYTE(v23) = 1;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v15, (char *)&v23, *(void *)(*(void *)(v14 + 32) + 1928), 0);
          WebKit::WebFullScreenManagerProxy::willExitFullScreen(v13);
          uint64_t v16 = *((void *)v13 + 3);
          uint64_t v17 = *(void *)(v16 + 256);
          LOBYTE(v23) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::RestoreScrollPosition>(v17, (uint64_t)&v23, *(void *)(*(void *)(v16 + 32) + 1928), 0);
          uint64_t v18 = *((void *)v13 + 3);
          uint64_t v19 = *(void *)(v18 + 256);
          LOBYTE(v23) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetAnimatingFullScreen>(v19, (char *)&v23, *(void *)(*(void *)(v18 + 32) + 1928), 0);
          WebKit::WebFullScreenManagerProxy::didExitFullScreen(v13);
        }
        [self->_webViewPlaceholder.m_ptr removeFromSuperview];
        m_ptr = self->_webViewPlaceholder.m_ptr;
        self->_webViewPlaceholder.m_ptr = 0;
        if (m_ptr) {
          CFRelease(m_ptr);
        }
        [self->_window.m_ptr setHidden:1];
        uint64_t v21 = self->_window.m_ptr;
        self->_window.m_ptr = 0;
        if (v21) {
          CFRelease(v21);
        }
        if ((v9 & 1) == 0)
        {
          WebKit::WebPageProxy::setSuppressVisibilityUpdates(v8, 0);
          LOBYTE(v23) = 0;
          WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetNeedsDOMWindowResizeEvent>(*((void *)v8 + 32), (uint64_t)&v23, *(void *)(*((void *)v8 + 4) + 1928), 0);
        }
        [self->_fullscreenViewController.m_ptr setPrefersStatusBarHidden:1];
        [self->_fullscreenViewController.m_ptr invalidate];
        BOOL v22 = self->_fullscreenViewController.m_ptr;
        self->_fullscreenViewController.m_ptr = 0;
        if (v22) {
          CFRelease(v22);
        }
        return;
      }
    }
    else
    {
      double v8 = 0;
    }
    char v9 = 1;
    goto LABEL_15;
  }
  if (v4)
  {
    if ([(WKFullScreenWindowController *)self logChannel])
    {
      double v10 = [(WKFullScreenWindowController *)self loggerPtr];
      double v11 = [(WKFullScreenWindowController *)self logChannel];
      double v23 = 0;
      uint64_t v24 = 0;
      int v25 = "-[WKFullScreenWindowController _exitFullscreenImmediately]";
      uint64_t v26 = [(WKFullScreenWindowController *)self logIdentifier];
      if (v10[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,WebKit::FullScreenState,char [11]>((uint64_t)v11, (WTF::Logger::LogSiteIdentifier *)&v23);
      }
    }
  }
}

- (void)_invalidateEVOrganizationName
{
  m_ptr = self->_EVOrganizationName.m_ptr;
  self->_EVOrganizationName.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  self->_EVOrganizationNameIsValid = 0;
}

- (BOOL)_isSecure
{
  uint64_t v2 = [(WKFullScreenWindowController *)self _webView];

  return [(WKWebView *)v2 hasOnlySecureContent];
}

- (__SecTrust)_serverTrust
{
  uint64_t v2 = [(WKFullScreenWindowController *)self _webView];

  return [(WKWebView *)v2 serverTrust];
}

- (id)_EVOrganizationName
{
  if (![(WKFullScreenWindowController *)self _isSecure]) {
    return 0;
  }
  if (self->_EVOrganizationNameIsValid) {
    return self->_EVOrganizationName.m_ptr;
  }
  self->_EVOrganizationNameIsValid = 1;
  uint64_t v4 = [(WKFullScreenWindowController *)self _serverTrust];
  if (!v4) {
    return 0;
  }
  uint64_t v5 = v4;
  double v6 = (void *)SecTrustCopyInfo();
  if (!v6)
  {
    uint64_t v3 = 0;
    if (!SecTrustEvaluateWithError(v5, 0)) {
      return v3;
    }
    double v6 = (void *)SecTrustCopyInfo();
    if (!v6) {
      return 0;
    }
  }
  double v7 = (void *)[v6 objectForKey:*MEMORY[0x1E4F3BCB0]];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v7 BOOLValue] & 1) != 0
    && (double v8 = (void *)[v6 objectForKey:*MEMORY[0x1E4F3BCC8]],
        objc_opt_class(),
        (objc_opt_isKindOfClass() & 1) != 0)
    && ([v8 BOOLValue] & 1) != 0)
  {
    char v9 = (void *)[v6 objectForKey:*MEMORY[0x1E4F3BCA8]];
    uint64_t v3 = v9;
    if (v9) {
      CFRetain(v9);
    }
    m_ptr = self->_EVOrganizationName.m_ptr;
    self->_EVOrganizationName.m_ptr = v3;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      uint64_t v3 = self->_EVOrganizationName.m_ptr;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
  CFRelease(v6);
  return v3;
}

- (void)_updateLocationInfo
{
  uint64_t v3 = [(WKWebView *)[(WKFullScreenWindowController *)self _webView] _committedURL];
  uint64_t v4 = [(WKFullScreenWindowController *)self _EVOrganizationName];
  uint64_t v5 = [(__CFString *)v4 length];
  uint64_t v6 = [(NSURL *)v3 _lp_simplifiedDisplayString];
  uint64_t v7 = [(NSString *)[(NSURL *)v3 scheme] caseInsensitiveCompare:@"data"];
  if (v5) {
    double v8 = v4;
  }
  else {
    double v8 = (__CFString *)v6;
  }
  if (v7) {
    char v9 = v8;
  }
  else {
    char v9 = @"data:";
  }
  m_ptr = self->_fullscreenViewController.m_ptr;

  [m_ptr setLocation:v9];
}

- (void)_manager
{
  id result = [(WKFullScreenWindowController *)self _webView];
  if (result)
  {
    [result _page];
    if (v3) {
      return *(void **)(v3 + 408);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_videoPresentationManager
{
  id result = [(WKFullScreenWindowController *)self _webView];
  if (result)
  {
    [result _page];
    if (v3) {
      return *(void **)(v3 + 432);
    }
    else {
      return 0;
    }
  }
  return result;
}

- (void)_startToDismissFullscreenChanged:(id)a3
{
  if (!self->_inInteractiveDismiss)
  {
    if ([(WKFullScreenWindowController *)self loggerPtr]
      && [(WKFullScreenWindowController *)self logChannel])
    {
      uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
      uint64_t v5 = [(WKFullScreenWindowController *)self logChannel];
      uint64_t v6 = 0;
      uint64_t v7 = 0;
      double v8 = "-[WKFullScreenWindowController _startToDismissFullscreenChanged:]";
      char v9 = [(WKFullScreenWindowController *)self logIdentifier];
      if (v4[12]) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v5, 0, (WTF::Logger::LogSiteIdentifier *)&v6);
      }
    }
    self->_inInteractiveDismiss = 1;
    [(WKFullScreenWindowController *)self _dismissFullscreenViewController];
  }
}

- (void)_dismissFullscreenViewController
{
  v39[7] = *MEMORY[0x1E4F143B8];
  m_ptr = self->_fullscreenViewController.m_ptr;
  uint64_t v4 = [(WKFullScreenWindowController *)self loggerPtr];
  if (!m_ptr)
  {
    if (v4)
    {
      if ([(WKFullScreenWindowController *)self logChannel])
      {
        char v9 = [(WKFullScreenWindowController *)self loggerPtr];
        double v10 = [(WKFullScreenWindowController *)self logChannel];
        v32[0] = 0;
        v32[1] = 0;
        v32[2] = "-[WKFullScreenWindowController _dismissFullscreenViewController]";
        v32[3] = [(WKFullScreenWindowController *)self logIdentifier];
        if (v9[12])
        {
          WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v35, (WTF::Logger::LogSiteIdentifier *)v32);
          WTF::String::String((WTF::String *)&v34, "no fullscreenViewController");
          *(void *)buf = v35;
          v33[0] = v34;
          WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v33, &v36);
          if (!v36)
          {
            __break(0xC471u);
            return;
          }
          BOOL v12 = v34;
          int v34 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2) {
              WTF::StringImpl::destroy(v12, v11);
            }
            else {
              *(_DWORD *)v12 -= 2;
            }
          }
          uint64_t v13 = v35;
          uint64_t v35 = 0;
          if (v13)
          {
            if (*(_DWORD *)v13 == 2) {
              WTF::StringImpl::destroy(v13, v11);
            }
            else {
              *(_DWORD *)v13 -= 2;
            }
          }
          var4 = v10->var4;
          uint64_t v15 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
          if (v15)
          {
            WTF::String::utf8();
            uint64_t v17 = v33[0] ? (char *)v33[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v17;
            _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            uint64_t v15 = v33[0];
            v33[0] = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 1) {
                uint64_t v15 = (WTF *)WTF::fastFree(v15, v16);
              }
              else {
                --*(_DWORD *)v15;
              }
            }
          }
          if (v10->var0 && v10->var2)
          {
            uint64_t v18 = (atomic_uchar *)MEMORY[0x1E4F30998];
            while (1)
            {
              int v19 = *v18;
              if (v19) {
                break;
              }
              int v20 = *v18;
              atomic_compare_exchange_strong_explicit(v18, (unsigned __int8 *)&v20, v19 | 1, memory_order_acquire, memory_order_acquire);
              if (v20 == v19)
              {
                uint64_t v21 = WTF::Logger::observers(v15);
                uint64_t v22 = *(unsigned int *)(v21 + 12);
                if (v22)
                {
                  double v23 = *(uint64_t **)v21;
                  uint64_t v24 = *(void *)v21 + 8 * v22;
                  do
                  {
                    uint64_t v25 = *v23;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v32);
                    LODWORD(v38) = 0;
                    WTF::String::String((WTF::String *)v39, "no fullscreenViewController");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v33, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, uint64_t, WTF **))(*(void *)v25 + 16))(v25, v10, 1, v33);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v33, v26);
                    for (uint64_t i = 24; i != -8; i -= 16)
                    {
                      v28 = *(WTF::StringImpl **)&buf[i];
                      *(void *)&buf[i] = 0;
                      if (v28)
                      {
                        if (*(_DWORD *)v28 == 2) {
                          WTF::StringImpl::destroy(v28, (WTF::StringImpl *)v16);
                        }
                        else {
                          *(_DWORD *)v28 -= 2;
                        }
                      }
                    }
                    ++v23;
                  }
                  while (v23 != (uint64_t *)v24);
                }
                int v29 = 1;
                atomic_compare_exchange_strong_explicit(v18, (unsigned __int8 *)&v29, 0, memory_order_release, memory_order_relaxed);
                if (v29 != 1) {
                  WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                }
                break;
              }
            }
          }
          uint64_t v30 = v36;
          long long v36 = 0;
          if (v30)
          {
            if (*(_DWORD *)v30 == 2) {
              WTF::StringImpl::destroy(v30, (WTF::StringImpl *)v16);
            }
            else {
              *(_DWORD *)v30 -= 2;
            }
          }
        }
      }
    }
    [(WKFullScreenWindowController *)self _completedExitFullScreen];
    return;
  }
  if (v4 && [(WKFullScreenWindowController *)self logChannel])
  {
    uint64_t v5 = [(WKFullScreenWindowController *)self loggerPtr];
    uint64_t v6 = [(WKFullScreenWindowController *)self logChannel];
    *(_OWORD *)buf = 0uLL;
    uint64_t v38 = (uint64_t)"-[WKFullScreenWindowController _dismissFullscreenViewController]";
    v39[0] = [(WKFullScreenWindowController *)self logIdentifier];
    if (v5[12]) {
      WTF::Logger::log<WTF::Logger::LogSiteIdentifier>((uint64_t)v6, 0, (WTF::Logger::LogSiteIdentifier *)buf);
    }
  }
  [self->_fullscreenViewController.m_ptr setAnimating:1];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  uint64_t v38 = 0x5012000000;
  v39[0] = __Block_byref_object_copy__10;
  v39[1] = __Block_byref_object_dispose__10;
  v39[2] = &unk_19964AFC1;
  uint64_t v7 = [(WKFullScreenWindowController *)self logIdentifier];
  v39[3] = 0;
  v39[4] = 0;
  v39[5] = "-[WKFullScreenWindowController _dismissFullscreenViewController]";
  v39[6] = v7;
  double v8 = self->_fullscreenViewController.m_ptr;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __64__WKFullScreenWindowController__dismissFullscreenViewController__block_invoke;
  v31[3] = &unk_1E5813900;
  v31[4] = self;
  v31[5] = buf;
  [v8 dismissViewControllerAnimated:1 completion:v31];
  _Block_object_dispose(buf, 8);
}

void __64__WKFullScreenWindowController__dismissFullscreenViewController__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _webView];
  if (v2)
  {
    [v2 _page];
    if (v9)
    {
      if ([*(id *)(a1 + 32) loggerPtr])
      {
        if ([*(id *)(a1 + 32) logChannel])
        {
          uint64_t v3 = [*(id *)(a1 + 32) loggerPtr];
          uint64_t v4 = [*(id *)(a1 + 32) logChannel];
          if (*(unsigned char *)(v3 + 12)) {
            WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [18]>(v4, (WTF::Logger::LogSiteIdentifier *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), "dismiss completed");
          }
        }
      }
      int v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*(void *)(a1 + 32) + 360), "animator"), "context"), "transitionWasCancelled");
      uint64_t v6 = *(id **)(a1 + 32);
      if (v5) {
        [v6[42] setAnimating:0];
      }
      else {
        [v6 _completedExitFullScreen];
      }
      uint64_t v7 = *(void *)(a1 + 32);
      double v8 = *(const void **)(v7 + 360);
      *(void *)(v7 + 360) = 0;
      if (v8) {
        CFRelease(v8);
      }
    }
  }
}

- (void)_interactiveDismissChanged:(id)a3
{
  v42[2] = *MEMORY[0x1E4F143B8];
  if (self->_inInteractiveDismiss)
  {
    objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "translationInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view", a3));
    double v5 = v4;
    double v7 = v6;
    objc_msgSend(self->_interactivePanDismissGestureRecognizer.m_ptr, "velocityInView:", objc_msgSend(self->_fullscreenViewController.m_ptr, "view"));
    double v9 = v8;
    objc_msgSend((id)objc_msgSend(self->_fullscreenViewController.m_ptr, "view"), "bounds");
    double v11 = fmin(fmax(v7 / (v10 * 0.5), 0.0), 1.0);
    if ([self->_interactivePanDismissGestureRecognizer.m_ptr state] == 3)
    {
      self->_inInteractiveDismiss = 0;
      if ([(WKFullScreenWindowController *)self loggerPtr])
      {
        if ([(WKFullScreenWindowController *)self logChannel])
        {
          BOOL v12 = [(WKFullScreenWindowController *)self loggerPtr];
          uint64_t v13 = [(WKFullScreenWindowController *)self logChannel];
          v35[0] = 0;
          v35[1] = 0;
          v35[2] = "-[WKFullScreenWindowController _interactiveDismissChanged:]";
          v35[3] = [(WKFullScreenWindowController *)self logIdentifier];
          if (v12[12])
          {
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v38, (WTF::Logger::LogSiteIdentifier *)v35);
            WTF::String::String((WTF::String *)&v37, "ended");
            *(void *)buf = v38;
            v36[0] = v37;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v36, &v39);
            if (!v39)
            {
              __break(0xC471u);
              return;
            }
            uint64_t v15 = v37;
            int v37 = 0;
            if (v15)
            {
              if (*(_DWORD *)v15 == 2) {
                WTF::StringImpl::destroy(v15, v14);
              }
              else {
                *(_DWORD *)v15 -= 2;
              }
            }
            uint64_t v17 = v38;
            uint64_t v38 = 0;
            if (v17)
            {
              if (*(_DWORD *)v17 == 2) {
                WTF::StringImpl::destroy(v17, v14);
              }
              else {
                *(_DWORD *)v17 -= 2;
              }
            }
            var4 = v13->var4;
            int v19 = (WTF *)os_log_type_enabled(var4, OS_LOG_TYPE_DEFAULT);
            if (v19)
            {
              WTF::String::utf8();
              uint64_t v21 = v36[0] ? (char *)v36[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v21;
              _os_log_impl(&dword_1985F2000, var4, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              int v19 = v36[0];
              v36[0] = 0;
              if (v19)
              {
                if (*(_DWORD *)v19 == 1) {
                  int v19 = (WTF *)WTF::fastFree(v19, v20);
                }
                else {
                  --*(_DWORD *)v19;
                }
              }
            }
            if (v13->var0)
            {
              uint64_t v22 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v23 = *v22;
                if (v23) {
                  break;
                }
                int v24 = *v22;
                atomic_compare_exchange_strong_explicit(v22, (unsigned __int8 *)&v24, v23 | 1, memory_order_acquire, memory_order_acquire);
                if (v24 == v23)
                {
                  uint64_t v25 = WTF::Logger::observers(v19);
                  uint64_t v26 = *(unsigned int *)(v25 + 12);
                  if (v26)
                  {
                    uint64_t v27 = *(uint64_t **)v25;
                    uint64_t v28 = *(void *)v25 + 8 * v26;
                    do
                    {
                      uint64_t v29 = *v27;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], (WTF::Logger::LogSiteIdentifier *)v35);
                      int v41 = 0;
                      WTF::String::String((WTF::String *)v42, "ended");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v36, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, $2667638D102C4679293AE17DAA90F085 *, void, WTF **))(*(void *)v29 + 16))(v29, v13, 0, v36);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v36, v30);
                      for (uint64_t i = 24; i != -8; i -= 16)
                      {
                        int v32 = *(WTF::StringImpl **)&buf[i];
                        *(void *)&buf[i] = 0;
                        if (v32)
                        {
                          if (*(_DWORD *)v32 == 2) {
                            WTF::StringImpl::destroy(v32, (WTF::StringImpl *)v20);
                          }
                          else {
                            *(_DWORD *)v32 -= 2;
                          }
                        }
                      }
                      ++v27;
                    }
                    while (v27 != (uint64_t *)v28);
                  }
                  int v33 = 1;
                  atomic_compare_exchange_strong_explicit(v22, (unsigned __int8 *)&v33, 0, memory_order_release, memory_order_relaxed);
                  if (v33 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            int v34 = v39;
            uint64_t v39 = 0;
            if (v34)
            {
              if (*(_DWORD *)v34 == 2) {
                WTF::StringImpl::destroy(v34, (WTF::StringImpl *)v20);
              }
              else {
                *(_DWORD *)v34 -= 2;
              }
            }
          }
        }
      }
      if (v11 <= 0.25 && (v11 <= 0.0 || v9 <= 5.0)) {
        [self->_interactiveDismissTransitionCoordinator.m_ptr cancelInteractiveTransition];
      }
      else {
        [(WKFullScreenWindowController *)self requestExitFullScreen];
      }
    }
    else
    {
      m_ptr = self->_interactiveDismissTransitionCoordinator.m_ptr;
      objc_msgSend(m_ptr, "updateInteractiveTransition:withTranslation:", v11, v5, v7);
    }
  }
}

- (void)_applicationDidBecomeActive:(id)a3
{
}

- (WKWebView)_webView
{
  return (WKWebView *)objc_loadWeak((id *)&self->__webView);
}

- (void)set_webView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__webView);
  m_ptr = self->_logger.m_ptr;
  self->_logger.m_ptr = 0;
  if (m_ptr && atomic_fetch_add((atomic_uint *volatile)m_ptr + 2, 0xFFFFFFFF) == 1)
  {
    atomic_store(1u, (unsigned int *)m_ptr + 2);
    (*(void (**)(Logger *))(*(void *)m_ptr + 8))(m_ptr);
  }
  double v5 = self->_notificationListener.m_ptr;
  self->_notificationListener.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }
  double v6 = self->_EVOrganizationName.m_ptr;
  self->_EVOrganizationName.m_ptr = 0;
  if (v6) {
    CFRelease(v6);
  }
  value = (WTF *)self->_pipObserver.__ptr_.__value_;
  self->_pipObserver.__ptr_.__value_ = 0;
  if (value) {
    std::default_delete<WTF::Observer<void ()(BOOL)>>::operator()[abi:sn180100](value, v3);
  }
  double v8 = self->_interactiveDismissTransitionCoordinator.m_ptr;
  self->_interactiveDismissTransitionCoordinator.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  double v9 = self->_interactivePanDismissGestureRecognizer.m_ptr;
  self->_interactivePanDismissGestureRecognizer.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  double v10 = self->_startDismissGestureRecognizer.m_ptr;
  self->_startDismissGestureRecognizer.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  double v11 = self->_fullscreenViewController.m_ptr;
  self->_fullscreenViewController.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  BOOL v12 = self->_viewControllerForPresentation.m_ptr;
  self->_viewControllerForPresentation.m_ptr = 0;
  if (v12) {
    CFRelease(v12);
  }
  uint64_t v13 = self->_rootViewController.m_ptr;
  self->_rootViewController.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  uint64_t v14 = self->_window.m_ptr;
  self->_window.m_ptr = 0;
  if (v14) {
    CFRelease(v14);
  }
  uint64_t v15 = self->_webViewPlaceholder.m_ptr;
  self->_webViewPlaceholder.m_ptr = 0;
  if (v15)
  {
    CFRelease(v15);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((_DWORD *)self + 6) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *((_OWORD *)self + 2) = _Q0;
  *((_OWORD *)self + 3) = _Q0;
  *((unsigned char *)self + 64) = 0;
  double v7 = (_OWORD *)MEMORY[0x1E4F437F8];
  long long v8 = *MEMORY[0x1E4F437F8];
  long long v9 = *(_OWORD *)(MEMORY[0x1E4F437F8] + 16);
  *(_OWORD *)((char *)self + 72) = *MEMORY[0x1E4F437F8];
  *(_OWORD *)((char *)self + 88) = v9;
  *((unsigned char *)self + 104) = 0;
  *(_OWORD *)((char *)self + 152) = v8;
  *((_OWORD *)self + 7) = v8;
  *((_OWORD *)self + 8) = v9;
  *((void *)self + 18) = 15;
  *(_OWORD *)((char *)self + 168) = v9;
  *((unsigned char *)self + 184) = 0;
  *((void *)self + 24) = 0;
  *(_OWORD *)((char *)self + 200) = *MEMORY[0x1E4F1DAD8];
  *((_WORD *)self + 108) = 0;
  *((void *)self + 28) = 0;
  *((unsigned char *)self + 232) = 0;
  long long v10 = v7[1];
  *((_OWORD *)self + 15) = *v7;
  *((_OWORD *)self + 16) = v10;
  *((unsigned char *)self + 272) = 0;
  double v11 = (_OWORD *)MEMORY[0x1E4F1DB30];
  *(_OWORD *)((char *)self + 280) = *MEMORY[0x1E4F1DB30];
  *(_OWORD *)((char *)self + 296) = *v11;
  *((void *)self + 58) = 0;
  *(_OWORD *)((char *)self + 344) = 0u;
  *(_OWORD *)((char *)self + 360) = 0u;
  *(_OWORD *)((char *)self + 312) = 0u;
  *(_OWORD *)((char *)self + 328) = 0u;
  *((void *)self + 60) = 0;
  *((void *)self + 61) = 0;
  return self;
}

- (const)logIdentifier
{
  return self->_logIdentifier;
}

- (const)loggerPtr
{
  return self->_logger.m_ptr;
}

- ($2667638D102C4679293AE17DAA90F085)logChannel
{
  return ($2667638D102C4679293AE17DAA90F085 *)&WebKit2LogFullscreen;
}

- (uint64_t)enterFullScreen:(uint64_t)a1
{
  *(void *)a1 = &unk_1EE9D5258;
  objc_destroyWeak((id *)(a1 + 48));
  return a1;
}

- (uint64_t)enterFullScreen:(id *)a1
{
  *a1 = &unk_1EE9D5258;
  objc_destroyWeak(a1 + 6);

  return WTF::fastFree((WTF *)a1, v2);
}

- (void)enterFullScreen:(void *)a3
{
  v115[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v7 = WeakRetained;
    v106 = (WTF::Logger::LogSiteIdentifier *)(a1 + 8);
    long long v8 = *(unsigned char **)(a1 + 40);
    if (a3)
    {
      if ([v8 loggerPtr])
      {
        if ([*(id *)(a1 + 40) logChannel])
        {
          uint64_t v9 = [*(id *)(a1 + 40) loggerPtr];
          uint64_t v105 = [*(id *)(a1 + 40) logChannel];
          if (*(unsigned char *)(v9 + 12))
          {
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v110, v106);
            WTF::String::String((WTF::String *)&v109, "request for window scene failed with error: ");
            MEMORY[0x19972EAD0](&v107, [a3 localizedDescription]);
            WTF::makeString<WTF::String,WTF::String,WTF::String>((uint64_t *)&v110, (uint64_t *)&v109, (uint64_t *)&v107, &v111);
            double v11 = v107;
            v107 = 0;
            if (v11)
            {
              if (*(_DWORD *)v11 == 2) {
                WTF::StringImpl::destroy(v11, v10);
              }
              else {
                *(_DWORD *)v11 -= 2;
              }
            }
            uint64_t v29 = v109;
            v109 = 0;
            if (v29)
            {
              if (*(_DWORD *)v29 == 2) {
                WTF::StringImpl::destroy(v29, v10);
              }
              else {
                *(_DWORD *)v29 -= 2;
              }
            }
            uint64_t v30 = v110;
            v110 = 0;
            if (v30)
            {
              if (*(_DWORD *)v30 == 2) {
                WTF::StringImpl::destroy(v30, v10);
              }
              else {
                *(_DWORD *)v30 -= 2;
              }
            }
            uint64_t v31 = *(NSObject **)(v105 + 32);
            int v32 = (WTF *)os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);
            if (v32)
            {
              WTF::String::utf8();
              int v34 = v108[0] ? (char *)v108[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v34;
              _os_log_impl(&dword_1985F2000, v31, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              int v32 = v108[0];
              v108[0] = 0;
              if (v32)
              {
                if (*(_DWORD *)v32 == 1) {
                  int v32 = (WTF *)WTF::fastFree(v32, v33);
                }
                else {
                  --*(_DWORD *)v32;
                }
              }
            }
            if (*(unsigned char *)v105 && *(unsigned char *)(v105 + 16))
            {
              uint64_t v35 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v36 = *v35;
                if (v36) {
                  break;
                }
                int v37 = *v35;
                atomic_compare_exchange_strong_explicit(v35, (unsigned __int8 *)&v37, v36 | 1, memory_order_acquire, memory_order_acquire);
                if (v37 == v36)
                {
                  v102 = v7;
                  uint64_t v38 = WTF::Logger::observers(v32);
                  uint64_t v39 = *(unsigned int *)(v38 + 12);
                  if (v39)
                  {
                    uint64_t v40 = *(uint64_t **)v38;
                    uint64_t v41 = *(void *)v38 + 8 * v39;
                    v101 = &v113;
                    do
                    {
                      uint64_t v42 = *v40;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v106);
                      int v113 = 0;
                      WTF::String::String((WTF::String *)v114, "request for window scene failed with error: ");
                      v114[2] = 0;
                      MEMORY[0x19972EAD0](v115, objc_msgSend(a3, "localizedDescription", v101));
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v108, (uint64_t)buf, 3uLL);
                      (*(void (**)(uint64_t, uint64_t, uint64_t, WTF **))(*(void *)v42 + 16))(v42, v105, 1, v108);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v108, v43);
                      for (uint64_t i = 40; i != -8; i -= 16)
                      {
                        uint64_t v45 = *(WTF::StringImpl **)&buf[i];
                        *(void *)&buf[i] = 0;
                        if (v45)
                        {
                          if (*(_DWORD *)v45 == 2) {
                            WTF::StringImpl::destroy(v45, (WTF::StringImpl *)v33);
                          }
                          else {
                            *(_DWORD *)v45 -= 2;
                          }
                        }
                      }
                      ++v40;
                    }
                    while (v40 != (uint64_t *)v41);
                  }
                  int v46 = 1;
                  atomic_compare_exchange_strong_explicit(MEMORY[0x1E4F30998], (unsigned __int8 *)&v46, 0, memory_order_release, memory_order_relaxed);
                  goto LABEL_91;
                }
              }
            }
LABEL_93:
            int v62 = v111;
            v111 = 0;
            if (v62)
            {
              if (*(_DWORD *)v62 == 2) {
                WTF::StringImpl::destroy(v62, (WTF::StringImpl *)v33);
              }
              else {
                *(_DWORD *)v62 -= 2;
              }
            }
          }
        }
      }
LABEL_97:
      [*(id *)(a1 + 40) _exitFullscreenImmediately];
LABEL_98:
      CFRelease(v7);
      return;
    }
    if (v8[474])
    {
      if (![v8 loggerPtr]) {
        goto LABEL_97;
      }
      if (![*(id *)(a1 + 40) logChannel]) {
        goto LABEL_97;
      }
      uint64_t v12 = [*(id *)(a1 + 40) loggerPtr];
      uint64_t v13 = [*(id *)(a1 + 40) logChannel];
      if (!*(unsigned char *)(v12 + 12)) {
        goto LABEL_97;
      }
      uint64_t v14 = v13;
      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v110, v106);
      WTF::String::String((WTF::String *)&v109, "received window scene but exit requested");
      *(void *)buf = v110;
      v108[0] = v109;
      WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v108, &v111);
      if (v111)
      {
        uint64_t v16 = v109;
        v109 = 0;
        if (v16)
        {
          if (*(_DWORD *)v16 == 2) {
            WTF::StringImpl::destroy(v16, v15);
          }
          else {
            *(_DWORD *)v16 -= 2;
          }
        }
        int v47 = v110;
        v110 = 0;
        if (v47)
        {
          if (*(_DWORD *)v47 == 2) {
            WTF::StringImpl::destroy(v47, v15);
          }
          else {
            *(_DWORD *)v47 -= 2;
          }
        }
        uint64_t v48 = *(NSObject **)(v14 + 32);
        CGSize v49 = (WTF *)os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT);
        if (v49)
        {
          WTF::String::utf8();
          uint64_t v50 = v108[0] ? (char *)v108[0] + 16 : 0;
          *(_DWORD *)buf = 136446210;
          *(void *)&buf[4] = v50;
          _os_log_impl(&dword_1985F2000, v48, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
          CGSize v49 = v108[0];
          v108[0] = 0;
          if (v49)
          {
            if (*(_DWORD *)v49 == 1) {
              CGSize v49 = (WTF *)WTF::fastFree(v49, v33);
            }
            else {
              --*(_DWORD *)v49;
            }
          }
        }
        if (*(unsigned char *)v14)
        {
          double v51 = (atomic_uchar *)MEMORY[0x1E4F30998];
          while (1)
          {
            int v52 = *v51;
            if (v52) {
              break;
            }
            int v53 = *v51;
            atomic_compare_exchange_strong_explicit(v51, (unsigned __int8 *)&v53, v52 | 1, memory_order_acquire, memory_order_acquire);
            if (v53 == v52)
            {
              v102 = v7;
              uint64_t v54 = WTF::Logger::observers(v49);
              uint64_t v55 = *(unsigned int *)(v54 + 12);
              if (v55)
              {
                uint64_t v56 = *(uint64_t **)v54;
                uint64_t v57 = *(void *)v54 + 8 * v55;
                do
                {
                  uint64_t v58 = *v56;
                  *(_DWORD *)buf = 0;
                  WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v106);
                  int v113 = 0;
                  WTF::String::String((WTF::String *)v114, "received window scene but exit requested");
                  WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v108, (uint64_t)buf, 2uLL);
                  (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v58 + 16))(v58, v14, 0, v108);
                  WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v108, v59);
                  for (uint64_t j = 24; j != -8; j -= 16)
                  {
                    long long v61 = *(WTF::StringImpl **)&buf[j];
                    *(void *)&buf[j] = 0;
                    if (v61)
                    {
                      if (*(_DWORD *)v61 == 2) {
                        WTF::StringImpl::destroy(v61, (WTF::StringImpl *)v33);
                      }
                      else {
                        *(_DWORD *)v61 -= 2;
                      }
                    }
                  }
                  ++v56;
                }
                while (v56 != (uint64_t *)v57);
              }
              int v46 = 1;
              atomic_compare_exchange_strong_explicit(v51, (unsigned __int8 *)&v46, 0, memory_order_release, memory_order_relaxed);
LABEL_91:
              double v7 = v102;
              if (v46 != 1) {
                WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
              }
              goto LABEL_93;
            }
          }
        }
        goto LABEL_93;
      }
LABEL_173:
      __break(0xC471u);
      JUMPOUT(0x198DE5C5CLL);
    }
    uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "view"), "window"), "windowScene");
    uint64_t v18 = *(void **)(a1 + 40);
    if (v17)
    {
      if ([v18 loggerPtr])
      {
        if ([*(id *)(a1 + 40) logChannel])
        {
          uint64_t v19 = [*(id *)(a1 + 40) loggerPtr];
          uint64_t v20 = [*(id *)(a1 + 40) logChannel];
          if (*(unsigned char *)(v19 + 12))
          {
            uint64_t v21 = v20;
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v110, v106);
            WTF::String::String((WTF::String *)&v109, "using window scene from presenting view controller");
            *(void *)buf = v110;
            v108[0] = v109;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v108, &v111);
            if (!v111)
            {
              __break(0xC471u);
              JUMPOUT(0x198DE5C64);
            }
            int v23 = v109;
            v109 = 0;
            if (v23)
            {
              if (*(_DWORD *)v23 == 2) {
                WTF::StringImpl::destroy(v23, v22);
              }
              else {
                *(_DWORD *)v23 -= 2;
              }
            }
            uint64_t v63 = v110;
            v110 = 0;
            if (v63)
            {
              if (*(_DWORD *)v63 == 2) {
                WTF::StringImpl::destroy(v63, v22);
              }
              else {
                *(_DWORD *)v63 -= 2;
              }
            }
            int v64 = *(NSObject **)(v21 + 32);
            uint64_t v65 = (WTF *)os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT);
            if (v65)
            {
              WTF::String::utf8();
              int v67 = v108[0] ? (char *)v108[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v67;
              _os_log_impl(&dword_1985F2000, v64, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              uint64_t v65 = v108[0];
              v108[0] = 0;
              if (v65)
              {
                if (*(_DWORD *)v65 == 1) {
                  uint64_t v65 = (WTF *)WTF::fastFree(v65, v66);
                }
                else {
                  --*(_DWORD *)v65;
                }
              }
            }
            if (*(unsigned char *)v21)
            {
              v68 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v69 = *v68;
                if (v69) {
                  break;
                }
                int v70 = *v68;
                atomic_compare_exchange_strong_explicit(v68, (unsigned __int8 *)&v70, v69 | 1, memory_order_acquire, memory_order_acquire);
                if (v70 == v69)
                {
                  int v103 = v7;
                  uint64_t v71 = WTF::Logger::observers(v65);
                  uint64_t v72 = *(unsigned int *)(v71 + 12);
                  if (v72)
                  {
                    v73 = *(uint64_t **)v71;
                    uint64_t v74 = *(void *)v71 + 8 * v72;
                    do
                    {
                      uint64_t v75 = *v73;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v106);
                      int v113 = 0;
                      WTF::String::String((WTF::String *)v114, "using window scene from presenting view controller");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v108, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v75 + 16))(v75, v21, 0, v108);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v108, v76);
                      for (uint64_t k = 24; k != -8; k -= 16)
                      {
                        uint64_t v78 = *(WTF::StringImpl **)&buf[k];
                        *(void *)&buf[k] = 0;
                        if (v78)
                        {
                          if (*(_DWORD *)v78 == 2) {
                            WTF::StringImpl::destroy(v78, (WTF::StringImpl *)v66);
                          }
                          else {
                            *(_DWORD *)v78 -= 2;
                          }
                        }
                      }
                      ++v73;
                    }
                    while (v73 != (uint64_t *)v74);
                  }
                  int v79 = 1;
                  atomic_compare_exchange_strong_explicit(v68, (unsigned __int8 *)&v79, 0, memory_order_release, memory_order_relaxed);
                  double v7 = v103;
                  if (v79 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            v80 = v111;
            v111 = 0;
            if (v80)
            {
              if (*(_DWORD *)v80 == 2) {
                WTF::StringImpl::destroy(v80, (WTF::StringImpl *)v66);
              }
              else {
                *(_DWORD *)v80 -= 2;
              }
            }
          }
        }
      }
    }
    else
    {
      if ([v18 loggerPtr])
      {
        if ([*(id *)(a1 + 40) logChannel])
        {
          uint64_t v24 = [*(id *)(a1 + 40) loggerPtr];
          uint64_t v25 = [*(id *)(a1 + 40) logChannel];
          if (*(unsigned char *)(v24 + 12))
          {
            uint64_t v26 = v25;
            WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v110, v106);
            WTF::String::String((WTF::String *)&v109, "using window scene from web view");
            *(void *)buf = v110;
            v108[0] = v109;
            WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v108, &v111);
            if (!v111) {
              goto LABEL_173;
            }
            uint64_t v28 = v109;
            v109 = 0;
            if (v28)
            {
              if (*(_DWORD *)v28 == 2) {
                WTF::StringImpl::destroy(v28, v27);
              }
              else {
                *(_DWORD *)v28 -= 2;
              }
            }
            v81 = v110;
            v110 = 0;
            if (v81)
            {
              if (*(_DWORD *)v81 == 2) {
                WTF::StringImpl::destroy(v81, v27);
              }
              else {
                *(_DWORD *)v81 -= 2;
              }
            }
            int v82 = *(NSObject **)(v26 + 32);
            int v83 = (WTF *)os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT);
            if (v83)
            {
              WTF::String::utf8();
              uint64_t v85 = v108[0] ? (char *)v108[0] + 16 : 0;
              *(_DWORD *)buf = 136446210;
              *(void *)&buf[4] = v85;
              _os_log_impl(&dword_1985F2000, v82, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
              int v83 = v108[0];
              v108[0] = 0;
              if (v83)
              {
                if (*(_DWORD *)v83 == 1) {
                  int v83 = (WTF *)WTF::fastFree(v83, v84);
                }
                else {
                  --*(_DWORD *)v83;
                }
              }
            }
            if (*(unsigned char *)v26)
            {
              v86 = (atomic_uchar *)MEMORY[0x1E4F30998];
              while (1)
              {
                int v87 = *v86;
                if (v87) {
                  break;
                }
                int v88 = *v86;
                atomic_compare_exchange_strong_explicit(v86, (unsigned __int8 *)&v88, v87 | 1, memory_order_acquire, memory_order_acquire);
                if (v88 == v87)
                {
                  v104 = v7;
                  uint64_t v89 = WTF::Logger::observers(v83);
                  uint64_t v90 = *(unsigned int *)(v89 + 12);
                  if (v90)
                  {
                    v91 = *(uint64_t **)v89;
                    uint64_t v92 = *(void *)v89 + 8 * v90;
                    do
                    {
                      uint64_t v93 = *v91;
                      *(_DWORD *)buf = 0;
                      WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v106);
                      int v113 = 0;
                      WTF::String::String((WTF::String *)v114, "using window scene from web view");
                      WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v108, (uint64_t)buf, 2uLL);
                      (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v93 + 16))(v93, v26, 0, v108);
                      WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v108, v94);
                      for (uint64_t m = 24; m != -8; m -= 16)
                      {
                        v96 = *(WTF::StringImpl **)&buf[m];
                        *(void *)&buf[m] = 0;
                        if (v96)
                        {
                          if (*(_DWORD *)v96 == 2) {
                            WTF::StringImpl::destroy(v96, (WTF::StringImpl *)v84);
                          }
                          else {
                            *(_DWORD *)v96 -= 2;
                          }
                        }
                      }
                      ++v91;
                    }
                    while (v91 != (uint64_t *)v92);
                  }
                  int v97 = 1;
                  atomic_compare_exchange_strong_explicit(v86, (unsigned __int8 *)&v97, 0, memory_order_release, memory_order_relaxed);
                  double v7 = v104;
                  if (v97 != 1) {
                    WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                  }
                  break;
                }
              }
            }
            v98 = v111;
            v111 = 0;
            if (v98)
            {
              if (*(_DWORD *)v98 == 2) {
                WTF::StringImpl::destroy(v98, (WTF::StringImpl *)v84);
              }
              else {
                *(_DWORD *)v98 -= 2;
              }
            }
          }
        }
      }
      uint64_t v17 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "_webView"), "window"), "windowScene");
      if (!v17)
      {
        if ([*(id *)(a1 + 40) loggerPtr])
        {
          if ([*(id *)(a1 + 40) logChannel])
          {
            uint64_t v99 = [*(id *)(a1 + 40) loggerPtr];
            uint64_t v100 = [*(id *)(a1 + 40) logChannel];
            if (*(unsigned char *)(v99 + 12)) {
              WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [32]>(v100, 1u, v106, "failed to find a window scene");
            }
          }
        }
        [*(id *)(a1 + 40) _exitFullscreenImmediately];
        goto LABEL_98;
      }
    }
    objc_msgSend(*(id *)(a1 + 40), "_enterFullScreen:windowScene:", v17, *(double *)(a1 + 56), *(double *)(a1 + 64));
    goto LABEL_98;
  }
}

- (void)beganExitFullScreenWithInitialFrame:(void *)a1 finalFrame:
{
  uint64_t v2 = (const void *)a1[1];
  *a1 = &unk_1EE9D52C8;
  a1[1] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)beganExitFullScreenWithInitialFrame:(WTF *)this finalFrame:(void *)a2
{
  uint64_t v3 = (const void *)*((void *)this + 1);
  *(void *)this = &unk_1EE9D52C8;
  *((void *)this + 1) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (void)beganExitFullScreenWithInitialFrame:(uint64_t)a1 finalFrame:
{
  [*(id *)(*(void *)(a1 + 16) + 336) setPrefersStatusBarHidden:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 16) + 360);
  if (v2)
  {
    [v2 finishInteractiveTransition];
    uint64_t v3 = *(void *)(a1 + 16);
    double v4 = *(const void **)(v3 + 360);
    *(void *)(v3 + 360) = 0;
    if (v4)
    {
      CFRelease(v4);
    }
  }
  else
  {
    double v5 = *(void **)(a1 + 16);
    [v5 _dismissFullscreenViewController];
  }
}

- (uint64_t)_completedExitFullScreen
{
  v39[2] = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 16) + 8) setParent:0];
  [*(id *)(*(void *)(a1 + 16) + 8) removeFromSuperview];
  uint64_t v2 = (void *)[*(id *)(a1 + 16) _webView];
  if (v2)
  {
    [v2 _page];
    if (*(void *)buf)
    {
      WebKit::WebPageProxy::setSuppressVisibilityUpdates(*(WebKit::WebPageProxy **)buf, 0);
      LOBYTE(v33[0]) = 0;
      WebKit::AuxiliaryProcessProxy::send<Messages::WebPage::SetNeedsDOMWindowResizeEvent>(*(void *)(*(void *)buf + 256), (uint64_t)v33, *(void *)(*(void *)(*(void *)buf + 32) + 1928), 0);
    }
  }
  uint64_t v3 = *(unsigned char **)(a1 + 16);
  v3[474] = 0;
  v3[476] = 0;
  if (v3[475])
  {
    v3[475] = 0;
    if ([v3 loggerPtr])
    {
      if ([*(id *)(a1 + 16) logChannel])
      {
        uint64_t v4 = [*(id *)(a1 + 16) loggerPtr];
        uint64_t v5 = [*(id *)(a1 + 16) logChannel];
        if (*(unsigned char *)(v4 + 12))
        {
          uint64_t v6 = v5;
          int v32 = (WTF::Logger::LogSiteIdentifier *)(a1 + 32);
          WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&v35, (WTF::Logger::LogSiteIdentifier *)(a1 + 32));
          WTF::String::String((WTF::String *)&v34, "repaint completed, enter requested");
          *(void *)buf = v35;
          v33[0] = v34;
          uint64_t result = WTF::tryMakeStringFromAdapters<WTF::StringTypeAdapter<WTF::String,void>,WTF::StringTypeAdapter<WTF::String,void>>((uint64_t)buf, (uint64_t *)v33, &v36);
          if (!v36)
          {
            __break(0xC471u);
            return result;
          }
          uint64_t v9 = v34;
          int v34 = 0;
          if (v9)
          {
            if (*(_DWORD *)v9 == 2) {
              WTF::StringImpl::destroy(v9, v8);
            }
            else {
              *(_DWORD *)v9 -= 2;
            }
          }
          uint64_t v12 = v35;
          uint64_t v35 = 0;
          if (v12)
          {
            if (*(_DWORD *)v12 == 2) {
              WTF::StringImpl::destroy(v12, v8);
            }
            else {
              *(_DWORD *)v12 -= 2;
            }
          }
          uint64_t v13 = *(NSObject **)(v6 + 32);
          uint64_t v14 = (WTF *)os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
          if (v14)
          {
            WTF::String::utf8();
            uint64_t v16 = v33[0] ? (char *)v33[0] + 16 : 0;
            *(_DWORD *)buf = 136446210;
            *(void *)&buf[4] = v16;
            _os_log_impl(&dword_1985F2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
            uint64_t v14 = v33[0];
            v33[0] = 0;
            if (v14)
            {
              if (*(_DWORD *)v14 == 1) {
                uint64_t v14 = (WTF *)WTF::fastFree(v14, v15);
              }
              else {
                --*(_DWORD *)v14;
              }
            }
          }
          if (*(unsigned char *)v6)
          {
            uint64_t v17 = (atomic_uchar *)MEMORY[0x1E4F30998];
            while (1)
            {
              int v18 = *v17;
              if (v18) {
                break;
              }
              int v19 = *v17;
              atomic_compare_exchange_strong_explicit(v17, (unsigned __int8 *)&v19, v18 | 1, memory_order_acquire, memory_order_acquire);
              if (v19 == v18)
              {
                uint64_t v20 = WTF::Logger::observers(v14);
                uint64_t v21 = *(unsigned int *)(v20 + 12);
                if (v21)
                {
                  uint64_t v22 = *(uint64_t **)v20;
                  uint64_t v23 = *(void *)v20 + 8 * v21;
                  do
                  {
                    uint64_t v24 = *v22;
                    *(_DWORD *)buf = 0;
                    WTF::Logger::LogSiteIdentifier::toString((uint64_t *)&buf[8], v32);
                    int v38 = 0;
                    WTF::String::String((WTF::String *)v39, "repaint completed, enter requested");
                    WTF::Vector<WTF::JSONLogValue,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::Vector((uint64_t *)v33, (uint64_t)buf, 2uLL);
                    (*(void (**)(uint64_t, uint64_t, void, WTF **))(*(void *)v24 + 16))(v24, v6, 0, v33);
                    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)v33, v25);
                    for (uint64_t i = 24; i != -8; i -= 16)
                    {
                      uint64_t v27 = *(WTF::StringImpl **)&buf[i];
                      *(void *)&buf[i] = 0;
                      if (v27)
                      {
                        if (*(_DWORD *)v27 == 2) {
                          WTF::StringImpl::destroy(v27, (WTF::StringImpl *)v15);
                        }
                        else {
                          *(_DWORD *)v27 -= 2;
                        }
                      }
                    }
                    ++v22;
                  }
                  while (v22 != (uint64_t *)v23);
                }
                int v28 = 1;
                atomic_compare_exchange_strong_explicit(v17, (unsigned __int8 *)&v28, 0, memory_order_release, memory_order_relaxed);
                if (v28 != 1) {
                  WTF::Lock::unlockSlow(MEMORY[0x1E4F30998]);
                }
                break;
              }
            }
          }
          uint64_t v29 = v36;
          int v36 = 0;
          if (v29)
          {
            if (*(_DWORD *)v29 == 2) {
              WTF::StringImpl::destroy(v29, (WTF::StringImpl *)v15);
            }
            else {
              *(_DWORD *)v29 -= 2;
            }
          }
        }
      }
    }
    uint64_t v30 = *(void **)(a1 + 16);
    *(void *)buf = 0;
    objc_msgSend(v30, "requestRestoreFullScreen:", buf, v32, v33[0]);
    uint64_t v31 = *(void *)buf;
    *(void *)buf = 0;
    if (v31) {
      (*(void (**)(uint64_t))(*(void *)v31 + 8))(v31);
    }
  }
  else if ([v3 loggerPtr])
  {
    if ([*(id *)(a1 + 16) logChannel])
    {
      uint64_t v10 = [*(id *)(a1 + 16) loggerPtr];
      uint64_t v11 = [*(id *)(a1 + 16) logChannel];
      if (*(unsigned char *)(v10 + 12)) {
        WTF::Logger::log<WTF::Logger::LogSiteIdentifier,char [18]>(v11, (WTF::Logger::LogSiteIdentifier *)(a1 + 32), "repaint completed");
      }
    }
  }
  if (*(unsigned char *)(a1 + 24)) {
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 16), "_webView"), "window"), "makeKeyWindow");
  }
  return [MEMORY[0x1E4F39CF8] commit];
}

- (void)placeholderWillMoveToSuperview:(void *)a1
{
  *a1 = &unk_1EE9D5318;
  uint64_t v2 = (const void *)a1[2];
  a1[2] = 0;
  if (v2) {
    CFRelease(v2);
  }
  return a1;
}

- (uint64_t)placeholderWillMoveToSuperview:(WTF *)this
{
  *(void *)this = &unk_1EE9D5318;
  uint64_t v3 = (const void *)*((void *)this + 2);
  *((void *)this + 2) = 0;
  if (v3) {
    CFRelease(v3);
  }

  return WTF::fastFree(this, a2);
}

- (void)placeholderWillMoveToSuperview:(uint64_t)a1
{
  uint64_t result = (void *)[*(id *)(*(void *)(a1 + 8) + 8) superview];
  if (!result)
  {
    uint64_t result = (void *)[*(id *)(*(void *)(a1 + 8) + 8) parent];
    if (result == *(void **)(a1 + 8))
    {
      return (void *)[result close];
    }
  }
  return result;
}

- (uint64_t)didExitPictureInPicture
{
  if ((a2 & 1) == 0) {
    return MEMORY[0x1F4171D68](*(void *)(result + 8));
  }
  return result;
}

@end