@interface WKFullScreenViewController
+ (id)keyPathsForValuesAffectingAdditionalSafeAreaInsets;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)isAnimating;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPlaying;
- (BOOL)isinWindowFullscreenActive;
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (NSString)location;
- (RectEdges<float>)_effectiveFullscreenInsets;
- (RefPtr<WebCore::PlaybackSessionInterfaceAVKit,)_playbackSessionInterface;
- (UIEdgeInsets)additionalSafeAreaInsets;
- (WKFullScreenViewController)initWithWebView:(id)a3;
- (WKFullScreenViewControllerDelegate)delegate;
- (WKWebView)_webView;
- (id).cxx_construct;
- (id)_createButtonWithExtrinsicContentSize:(CGSize)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_bannerDismissalRecognized:(id)a3;
- (void)_cancelAction:(id)a3;
- (void)_enterVideoFullscreenAction:(id)a3;
- (void)_manager;
- (void)_pauseIfNeeded;
- (void)_setupButton:(id)a3;
- (void)_showPhishingAlert;
- (void)_statusBarFrameDidChange:(id)a3;
- (void)_togglePiPAction:(id)a3;
- (void)_touchDetected:(id)a3;
- (void)_updateWebViewFullscreenInsets;
- (void)dealloc;
- (void)hideBanner;
- (void)hideUI;
- (void)invalidate;
- (void)loadView;
- (void)resetSupportedOrientations;
- (void)setAnimating:(BOOL)a3;
- (void)setAnimatingViewAlpha:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setInWindowFullscreenActive:(BOOL)a3;
- (void)setLocation:(id)a3;
- (void)setPictureInPictureActive:(BOOL)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setPrefersHomeIndicatorAutoHidden:(BOOL)a3;
- (void)setPrefersStatusBarHidden:(BOOL)a3;
- (void)setSupportedOrientations:(unint64_t)a3;
- (void)set_webView:(id)a3;
- (void)showBanner;
- (void)showUI;
- (void)videoControlsManagerDidChange;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)wkExtrinsicButtonWillDismissMenu:(id)a3;
- (void)wkExtrinsicButtonWillDisplayMenu:(id)a3;
@end

@implementation WKFullScreenViewController

- (WKFullScreenViewController)initWithWebView:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WKFullScreenViewController;
  v4 = [(WKFullScreenViewController *)&v8 init];
  if (v4)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarFrame");
    v4->_nonZeroStatusBarHeight = v5;
    v6 = (void *)[MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 addObserver:v4 selector:sel__statusBarFrameDidChange_ name:*MEMORY[0x1E4F43650] object:0];
    *(_OWORD *)&v4->_secheuristic.m_parameters.rampUpSpeed.m_value = xmmword_1994F5D80;
    *(_OWORD *)&v4->_secheuristic.m_parameters.xWeight = xmmword_1994F5D90;
    *(_OWORD *)&v4->_secheuristic.m_parameters.gamma = xmmword_1994F5DA0;
    v4->_secheuristic.m_parameters.requiredScore = 0.1;
    [(WKFullScreenViewController *)v4 set_webView:a3];
    objc_storeWeak(&v4->_playbackClient.m_parent.m_weakReference, v4);
    v4->_valid = 1;
    v4->_isShowingMenu = 0;
  }
  return v4;
}

- (void)invalidate
{
  if (self->_valid)
  {
    self->_valid = 0;
    [(WKFullScreenViewController *)self _pauseIfNeeded];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideBanner object:0];
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter"), "removeObserver:", self);
    p_playbackClient = &self->_playbackClient;
    objc_storeWeak(&p_playbackClient->m_parent.m_weakReference, 0);
    WKFullScreenViewControllerPlaybackSessionModelClient::setInterface(p_playbackClient, 0);
  }
}

- (void)dealloc
{
  [(WKFullScreenViewController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenViewController;
  [(WKFullScreenViewController *)&v3 dealloc];
}

- (WKFullScreenViewControllerDelegate)delegate
{
  WeakRetained = (WKFullScreenViewControllerDelegate *)objc_loadWeakRetained(&self->_delegate.m_weakReference);
  objc_super v3 = WeakRetained;
  if (WeakRetained) {
    CFRelease(WeakRetained);
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
}

- (void)setSupportedOrientations:(unint64_t)a3
{
  self->_supportedOrientations.var0.__val_ = a3;
  self->_supportedOrientations.__engaged_ = 1;
  [(WKFullScreenViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (void)resetSupportedOrientations
{
  if (self->_supportedOrientations.__engaged_) {
    self->_supportedOrientations.__engaged_ = 0;
  }
  [(WKFullScreenViewController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_supportedOrientations.__engaged_) {
    return self->_supportedOrientations.var0.__val_;
  }
  v3.receiver = self;
  v3.super_class = (Class)WKFullScreenViewController;
  return [(WKFullScreenViewController *)&v3 supportedInterfaceOrientations];
}

- (void)showUI
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
  if (self->_playing) {
    [(WKFullScreenViewController *)self performSelector:sel_hideUI withObject:0 afterDelay:4.0];
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__WKFullScreenViewController_showUI__block_invoke;
  v3[3] = &unk_1E5812158;
  v3[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.1];
}

uint64_t __36__WKFullScreenViewController_showUI__block_invoke(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "showUI");
  [*(id *)(*(void *)(a1 + 32) + 1008) setHidden:0];
  [*(id *)(*(void *)(a1 + 32) + 1008) setAlpha:1.0];
  [*(id *)(a1 + 32) setPrefersStatusBarHidden:0];
  [*(id *)(a1 + 32) setPrefersHomeIndicatorAutoHidden:0];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1080))
  {
    v8[0] = *(void *)(v2 + 1080);
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v8, 1));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v3 = (const void *)objc_msgSend((id)objc_msgSend(*(id *)(v2 + 1072), "topAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "safeAreaLayoutGuide"), "topAnchor"));
  v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  if (v3) {
    CFRetain(v3);
  }
  v6 = *(const void **)(v5 + 1080);
  *(void *)(v5 + 1080) = v4;
  if (v6) {
    CFRelease(v6);
  }
  return [*(id *)(*(void *)(a1 + 32) + 1080) setActive:1];
}

- (void)hideUI
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
  if (!self->_isShowingMenu)
  {
    v3[4] = self;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __36__WKFullScreenViewController_hideUI__block_invoke;
    v4[3] = &unk_1E5812158;
    v4[4] = self;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __36__WKFullScreenViewController_hideUI__block_invoke_2;
    v3[3] = &unk_1E5813860;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3 completion:0.1];
  }
}

uint64_t __36__WKFullScreenViewController_hideUI__block_invoke(uint64_t a1)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "hideUI");
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 1080))
  {
    v12[0] = *(void *)(v2 + 1080);
    objc_msgSend(MEMORY[0x1E4F28DC8], "deactivateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v12, 1));
    uint64_t v2 = *(void *)(a1 + 32);
  }
  objc_super v3 = (void *)[*(id *)(v2 + 1072) topAnchor];
  uint64_t v4 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "topAnchor");
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "view"), "safeAreaInsets");
  uint64_t v5 = (const void *)objc_msgSend(v3, "constraintEqualToAnchor:constant:", v4);
  v6 = v5;
  uint64_t v7 = *(void *)(a1 + 32);
  if (v5) {
    CFRetain(v5);
  }
  objc_super v8 = *(const void **)(v7 + 1080);
  *(void *)(v7 + 1080) = v6;
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v10 = *(void *)(a1 + 32);
  v9 = (id *)(a1 + 32);
  [*(id *)(v10 + 1080) setActive:1];
  [*((id *)*v9 + 126) setAlpha:0.0];
  [*v9 setPrefersStatusBarHidden:1];
  return [*v9 setPrefersHomeIndicatorAutoHidden:1];
}

uint64_t __36__WKFullScreenViewController_hideUI__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1008) setHidden:1];
  }
  return result;
}

- (void)showBanner
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideBanner object:0];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__WKFullScreenViewController_showBanner__block_invoke;
  v4[3] = &unk_1E5812158;
  v4[4] = self;
  WTF::MonotonicTime::now((WTF::MonotonicTime *)[MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.1]);
  self->_bannerMinimumHideDelayTime.m_value = v3 + 1.0;
  [(WKFullScreenViewController *)self performSelector:sel_hideBanner withObject:0 afterDelay:4.0];
}

uint64_t __40__WKFullScreenViewController_showBanner__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setHidden:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1016);

  return [v2 setAlpha:1.0];
}

- (void)hideBanner
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideBanner object:0];
  v3[4] = self;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__WKFullScreenViewController_hideBanner__block_invoke;
  v4[3] = &unk_1E5812158;
  v4[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __40__WKFullScreenViewController_hideBanner__block_invoke_2;
  v3[3] = &unk_1E5813860;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3 completion:0.1];
}

uint64_t __40__WKFullScreenViewController_hideBanner__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:0.0];
}

uint64_t __40__WKFullScreenViewController_hideBanner__block_invoke_2(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(*(void *)(result + 32) + 1016) setHidden:1];
  }
  return result;
}

- (void)_bannerDismissalRecognized:(id)a3
{
  WTF::MonotonicTime::now((WTF::MonotonicTime *)self);
  if (self->_bannerMinimumHideDelayTime.m_value - v4 <= 0.0)
  {
    [(WKFullScreenViewController *)self hideBanner];
  }
  else
  {
    -[WKFullScreenViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_hideBanner, 0);
  }
}

- (void)videoControlsManagerDidChange
{
  if (self)
  {
    [(WKFullScreenViewController *)self _playbackSessionInterface];
    double v3 = (PlaybackSessionInterfaceIOS *)v16;
  }
  else
  {
    double v3 = 0;
    v16 = 0;
  }
  WKFullScreenViewControllerPlaybackSessionModelClient::setInterface(&self->_playbackClient, v3);
  if (v16)
  {
    uint64_t v4 = WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel(v16);
    uint64_t v5 = v4;
    if (v4)
    {
      uint64_t v6 = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 312))(v4);
      char v7 = 0;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  uint64_t v6 = 0;
  char v7 = 1;
LABEL_9:
  [(WKFullScreenViewController *)self setPlaying:v6];
  objc_super v8 = [(WKFullScreenViewController *)self _webView];
  if (!v8) {
    goto LABEL_18;
  }
  [(WKWebView *)v8 _page];
  if (!v15) {
    goto LABEL_18;
  }
  uint64_t v10 = *(void *)(v15 + 272);
  {
    WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  if (WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v10 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::pictureInPictureAPIEnabledKey(void)::key, v9))
  {
    uint64_t v12 = *(void *)(v15 + 272);
    {
      WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::$_0::operator() const(void)::impl;
    }
    int BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v12 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::allowsPictureInPictureMediaPlaybackKey(void)::key, v11);
    if ((v7 & 1) == 0) {
      goto LABEL_17;
    }
  }
  else
  {
LABEL_18:
    int BoolValueForKey = 0;
    if ((v7 & 1) == 0)
    {
LABEL_17:
      int v14 = (*(uint64_t (**)(uint64_t))(*(void *)v5 + 464))(v5);
      goto LABEL_20;
    }
  }
  int v14 = 0;
LABEL_20:
  [self->_pipButton.m_ptr setHidden:BoolValueForKey & v14 ^ 1u];
  if (v16)
  {
    if (*((_DWORD *)v16 + 4) == 1) {
      (*(void (**)(WebCore::PlaybackSessionInterfaceIOS *))(*(void *)v16 + 8))(v16);
    }
    else {
      --*((_DWORD *)v16 + 4);
    }
  }
}

- (void)setAnimatingViewAlpha:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__WKFullScreenViewController_setAnimatingViewAlpha___block_invoke;
  v3[3] = &unk_1E5813620;
  v3[4] = self;
  *(double *)&void v3[5] = a3;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:0.2];
}

uint64_t __52__WKFullScreenViewController_setAnimatingViewAlpha___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:*(double *)(a1 + 40)];
}

+ (id)keyPathsForValuesAffectingAdditionalSafeAreaInsets
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"prefersStatusBarHidden", @"view.window.windowScene.statusBarManager.statusBarHidden", @"view.window.safeAreaInsets", 0);
}

- (UIEdgeInsets)additionalSafeAreaInsets
{
  if ((objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "window"), "windowScene"), "statusBarManager"), "isStatusBarHidden") & 1) != 0&& -[WKFullScreenViewController prefersStatusBarHidden](self, "prefersStatusBarHidden")&& (objc_msgSend((id)objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "window"), "safeAreaInsets"), v3 <= 0.0))
  {
    p_nonZeroStatusBarHeight = &self->_nonZeroStatusBarHeight;
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }
  else
  {
    p_nonZeroStatusBarHeight = (double *)MEMORY[0x1E4F437F8];
    double v5 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v6 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v7 = *(double *)(MEMORY[0x1E4F437F8] + 24);
  }
  double v8 = *p_nonZeroStatusBarHeight;
  result.right = v7;
  result.bottom = v6;
  result.left = v5;
  result.top = v8;
  return result;
}

- (void)setPrefersStatusBarHidden:(BOOL)a3
{
  self->_prefersStatusBarHidden = a3;
  [(WKFullScreenViewController *)self setNeedsStatusBarAppearanceUpdate];

  [(WKFullScreenViewController *)self _updateWebViewFullscreenInsets];
}

- (void)setPrefersHomeIndicatorAutoHidden:(BOOL)a3
{
  self->_prefersHomeIndicatorAutoHidden = a3;
  [(WKFullScreenViewController *)self setNeedsUpdateOfHomeIndicatorAutoHidden];
}

- (void)setPlaying:(BOOL)a3
{
  if (self->_playing != a3)
  {
    self->_playing = a3;
    if ([(WKFullScreenViewController *)self viewIfLoaded])
    {
      if (self->_playing)
      {
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
        [(WKFullScreenViewController *)self performSelector:sel_hideUI withObject:0 afterDelay:4.0];
      }
      else
      {
        [(WKFullScreenViewController *)self showUI];
      }
    }
  }
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  if (self->_pictureInPictureActive != a3)
  {
    self->_pictureInPictureActive = a3;
    objc_msgSend(self->_pipButton.m_ptr, "setSelected:");
  }
}

- (void)setAnimating:(BOOL)a3
{
  if (self->_animating != a3)
  {
    self->_animating = a3;
    if ([(WKFullScreenViewController *)self viewIfLoaded])
    {
      if (self->_animating)
      {
        [(WKFullScreenViewController *)self hideUI];
      }
      else
      {
        [(WKFullScreenViewController *)self showUI];
      }
    }
    else
    {
      [(WKFullScreenViewController *)self setNeedsStatusBarAppearanceUpdate];
    }
  }
}

- (NSString)location
{
  if (self->_location.m_impl.m_ptr) {
    return (NSString *)WTF::StringImpl::operator NSString *();
  }
  else {
    return (NSString *)&stru_1EEA10550;
  }
}

- (void)setLocation:(id)a3
{
  MEMORY[0x19972EAD0](&arg, a3);
  double v5 = (StringImpl *)arg;
  CFTypeRef arg = 0;
  m_ptr = (WTF::StringImpl *)self->_location.m_impl.m_ptr;
  self->_location.m_impl.m_ptr = v5;
  if (!m_ptr) {
    goto LABEL_6;
  }
  int v7 = *(_DWORD *)m_ptr - 2;
  if (*(_DWORD *)m_ptr != 2) {
    goto LABEL_5;
  }
  WTF::StringImpl::destroy(m_ptr, v4);
  m_ptr = (WTF::StringImpl *)arg;
  CFTypeRef arg = 0;
  if (!m_ptr) {
    goto LABEL_6;
  }
  int v7 = *(_DWORD *)m_ptr - 2;
  if (*(_DWORD *)m_ptr == 2) {
    WTF::StringImpl::destroy(m_ptr, v4);
  }
  else {
LABEL_5:
  }
    *(_DWORD *)m_ptr = v7;
LABEL_6:
  double v8 = self->_bannerLabel.m_ptr;
  v9 = NSString;
  WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"”%@” is in full screen.\nSwipe down to exit.", (const __CFString *)v4);
  if (arg)
  {
    CFAutorelease(arg);
    CFTypeRef v10 = arg;
  }
  else
  {
    CFTypeRef v10 = 0;
  }
  [v8 setText:objc_msgSend(v9, "stringWithFormat:", v10, -[WKFullScreenViewController location](self, "location"))];
  [self->_bannerLabel.m_ptr sizeToFit];
}

- (void)loadView
{
  v53[5] = *MEMORY[0x1E4F143B8];
  [(WKWebView *)[(WKFullScreenViewController *)self _webView] _page];
  uint64_t v4 = *((void *)arg + 34);
  {
    WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::$_0::operator() const(void)::impl += 2;
    WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::key = (uint64_t)&WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::$_0::operator() const(void)::impl;
  }
  int BoolValueForKey = WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v4 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::alternateFullScreenControlDesignEnabledKey(void)::key, v3);
  if (BoolValueForKey)
  {
    double v6 = (void *)[MEMORY[0x1E4F42A80] systemImageNamed:@"arrow.down.right.and.arrow.up.left"];
    int v7 = 0;
    double v8 = 0;
    double v9 = 44.0;
    double v10 = 44.0;
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v6 = (void *)[MEMORY[0x1E4F42A80] imageNamed:@"Done" inBundle:v11 compatibleWithTraitCollection:0];
    double v8 = (void *)[MEMORY[0x1E4F42A80] imageNamed:@"StartPictureInPictureButton" inBundle:v11 compatibleWithTraitCollection:0];
    int v7 = (void *)[MEMORY[0x1E4F42A80] imageNamed:@"StopPictureInPictureButton" inBundle:v11 compatibleWithTraitCollection:0];
    double v10 = 47.0;
    double v9 = 60.0;
  }
  uint64_t v12 = (const void *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  [(WKFullScreenViewController *)self setView:v12];
  if (v12) {
    CFRelease(v12);
  }
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "setAutoresizingMask:", 18);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "blackColor"));
  id v13 = objc_alloc(MEMORY[0x1E4F42FF0]);
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  int v14 = objc_msgSend(v13, "initWithFrame:");
  m_ptr = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = v14;
  if (m_ptr)
  {
    CFRelease(m_ptr);
    int v14 = self->_animatingView.m_ptr;
  }
  [v14 setAutoresizingMask:18];
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addSubview:", self->_animatingView.m_ptr);
  id v16 = -[WKFullScreenViewController _createButtonWithExtrinsicContentSize:](self, "_createButtonWithExtrinsicContentSize:", v9, v10);
  v17 = v16;
  if (v16) {
    CFRetain(v16);
  }
  v18 = self->_cancelButton.m_ptr;
  self->_cancelButton.m_ptr = v17;
  if (v18)
  {
    CFRelease(v18);
    v17 = self->_cancelButton.m_ptr;
  }
  objc_msgSend(v17, "setImage:forState:", objc_msgSend(v6, "imageWithRenderingMode:", 2), 0);
  [self->_cancelButton.m_ptr sizeToFit];
  [self->_cancelButton.m_ptr addTarget:self action:sel__cancelAction_ forControlEvents:64];
  if (BoolValueForKey)
  {
    objc_msgSend(self->_cancelButton.m_ptr, "setConfiguration:", objc_msgSend(MEMORY[0x1E4F427E8], "filledButtonConfiguration"));
    id v19 = objc_alloc_init(MEMORY[0x1E4F42E20]);
    v20 = self->_stackView.m_ptr;
    self->_stackView.m_ptr = v19;
    if (v20)
    {
      CFRelease(v20);
      id v19 = self->_stackView.m_ptr;
    }
    [v19 addArrangedSubview:self->_cancelButton.m_ptr];
    [self->_stackView.m_ptr addArrangedSubview:self->_pipButton.m_ptr];
    [self->_stackView.m_ptr setSpacing:24.0];
  }
  else
  {
    id v21 = -[WKFullScreenViewController _createButtonWithExtrinsicContentSize:](self, "_createButtonWithExtrinsicContentSize:", v9, v10);
    v22 = v21;
    if (v21) {
      CFRetain(v21);
    }
    v23 = self->_pipButton.m_ptr;
    self->_pipButton.m_ptr = v22;
    if (v23)
    {
      CFRelease(v23);
      v22 = self->_pipButton.m_ptr;
    }
    objc_msgSend(v22, "setImage:forState:", objc_msgSend(v8, "imageWithRenderingMode:", 2), 0);
    objc_msgSend(self->_pipButton.m_ptr, "setImage:forState:", objc_msgSend(v7, "imageWithRenderingMode:", 2), 4);
    [self->_pipButton.m_ptr sizeToFit];
    [self->_pipButton.m_ptr addTarget:self action:sel__togglePiPAction_ forControlEvents:64];
    v24 = objc_alloc_init(WKFullscreenStackView);
    [(WKFullscreenStackView *)v24 addArrangedSubview:self->_cancelButton.m_ptr applyingMaterialStyle:1 tintEffectStyle:1];
    [(WKFullscreenStackView *)v24 addArrangedSubview:self->_pipButton.m_ptr applyingMaterialStyle:0 tintEffectStyle:1];
    v25 = self->_stackView.m_ptr;
    self->_stackView.m_ptr = v24;
    if (v25) {
      CFRelease(v25);
    }
  }
  [self->_stackView.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
  [self->_animatingView.m_ptr addSubview:self->_stackView.m_ptr];
  v26 = -[_WKInsetLabel initWithFrame:]([_WKInsetLabel alloc], "initWithFrame:", 0.0, 0.0, 100.0, 100.0);
  v27 = self->_bannerLabel.m_ptr;
  self->_bannerLabel.m_ptr = v26;
  if (v27)
  {
    CFRelease(v27);
    v26 = (_WKInsetLabel *)self->_bannerLabel.m_ptr;
  }
  -[_WKInsetLabel setEdgeInsets:](v26, "setEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
  objc_msgSend(self->_bannerLabel.m_ptr, "setBackgroundColor:", objc_msgSend(MEMORY[0x1E4F428B8], "clearColor"));
  [self->_bannerLabel.m_ptr setNumberOfLines:0];
  [self->_bannerLabel.m_ptr setLineBreakMode:0];
  [self->_bannerLabel.m_ptr setTextAlignment:1];
  v28 = self->_bannerLabel.m_ptr;
  v29 = NSString;
  WebCore::copyLocalizedString((uint64_t *)&arg, (WebCore *)@"”%@” is in full screen.\nSwipe down to exit.", v30);
  if (arg)
  {
    CFAutorelease(arg);
    CFTypeRef v31 = arg;
  }
  else
  {
    CFTypeRef v31 = 0;
  }
  [v28 setText:objc_msgSend(v29, "stringWithFormat:", v31, -[WKFullScreenViewController location](self, "location"))];
  v32 = objc_alloc_init(WKFullscreenStackView);
  [(WKFullscreenStackView *)v32 addArrangedSubview:self->_bannerLabel.m_ptr applyingMaterialStyle:1 tintEffectStyle:1];
  v33 = self->_banner.m_ptr;
  self->_banner.m_ptr = v32;
  if (v33) {
    CFRelease(v33);
  }
  v34 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__bannerDismissalRecognized_];
  v35 = self->_bannerTapToDismissRecognizer.m_ptr;
  self->_bannerTapToDismissRecognizer.m_ptr = v34;
  if (v35)
  {
    CFRelease(v35);
    v34 = self->_bannerTapToDismissRecognizer.m_ptr;
  }
  [v34 setDelegate:self];
  [self->_banner.m_ptr addGestureRecognizer:self->_bannerTapToDismissRecognizer.m_ptr];
  [self->_banner.m_ptr setTranslatesAutoresizingMaskIntoConstraints:0];
  [self->_animatingView.m_ptr addSubview:self->_banner.m_ptr];
  v36 = objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "safeAreaLayoutGuide");
  v37 = objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "layoutMarginsGuide");
  id v38 = objc_alloc_init(MEMORY[0x1E4F42B48]);
  v39 = self->_topGuide.m_ptr;
  self->_topGuide.m_ptr = v38;
  if (v39) {
    CFRelease(v39);
  }
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addLayoutGuide:", self->_topGuide.m_ptr);
  v40 = (void *)[self->_topGuide.m_ptr topAnchor];
  v41 = (void *)[self->_stackView.m_ptr topAnchor];
  if (BoolValueForKey) {
    uint64_t v42 = [v41 constraintEqualToSystemSpacingBelowAnchor:v40 multiplier:3.0];
  }
  else {
    uint64_t v42 = [v41 constraintEqualToAnchor:v40];
  }
  uint64_t v43 = v42;
  v44 = objc_msgSend(v40, "constraintEqualToAnchor:", objc_msgSend(v36, "topAnchor"));
  v45 = v44;
  if (v44) {
    CFRetain(v44);
  }
  v46 = self->_topConstraint.m_ptr;
  self->_topConstraint.m_ptr = v45;
  if (v46)
  {
    CFRelease(v46);
    v45 = self->_topConstraint.m_ptr;
  }
  v47 = (void *)MEMORY[0x1E4F28DC8];
  v53[0] = v45;
  v53[1] = v43;
  v53[2] = objc_msgSend((id)objc_msgSend(self->_banner.m_ptr, "topAnchor"), "constraintEqualToSystemSpacingBelowAnchor:multiplier:", objc_msgSend(self->_stackView.m_ptr, "bottomAnchor"), 3.0);
  v53[3] = objc_msgSend((id)objc_msgSend(self->_banner.m_ptr, "centerXAnchor"), "constraintEqualToAnchor:", objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "centerXAnchor"));
  v53[4] = objc_msgSend((id)objc_msgSend(self->_stackView.m_ptr, "leadingAnchor"), "constraintEqualToAnchor:", objc_msgSend(v37, "leadingAnchor"));
  objc_msgSend(v47, "activateConstraints:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v53, 5));
  [self->_stackView.m_ptr setAlpha:0.0];
  [self->_stackView.m_ptr setHidden:1];
  [(WKFullScreenViewController *)self videoControlsManagerDidChange];
  v48 = self->_bannerLabel.m_ptr;
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  [v48 setPreferredMaxLayoutWidth:v49];
  [self->_banner.m_ptr setAlpha:0.0];
  [self->_banner.m_ptr setHidden:1];
  v50 = (void *)[objc_alloc(MEMORY[0x1E4F42B70]) initWithTarget:self action:sel__touchDetected_];
  v51 = self->_touchGestureRecognizer.m_ptr;
  self->_touchGestureRecognizer.m_ptr = v50;
  if (v51)
  {
    CFRelease(v51);
    v50 = self->_touchGestureRecognizer.m_ptr;
  }
  [v50 setCancelsTouchesInView:0];
  [self->_touchGestureRecognizer.m_ptr setMinimumPressDuration:0.0];
  [self->_touchGestureRecognizer.m_ptr setDelegate:self];
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "addGestureRecognizer:", self->_touchGestureRecognizer.m_ptr);
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  [(WKWebView *)[(WKFullScreenViewController *)self _webView] setAutoresizingMask:18];
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  -[WKWebView setFrame:]([(WKFullScreenViewController *)self _webView], "setFrame:", v5, v6, v7, v8);
  objc_msgSend(self->_animatingView.m_ptr, "insertSubview:atIndex:", -[WKFullScreenViewController _webView](self, "_webView"), 0);
  double v9 = [(WKFullScreenViewController *)self _manager];
  if (v9)
  {
    uint64_t v14 = 0x3FB999999999999ALL;
    uint64_t v10 = v9[3];
    uint64_t v11 = *(void *)(v10 + 256);
    id v13 = (double *)&v14;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetFullscreenAutoHideDuration>(v11, &v13, *(void *)(*(void *)(v10 + 32) + 1928), 0);
  }
  v12.receiver = self;
  v12.super_class = (Class)WKFullScreenViewController;
  [(WKFullScreenViewController *)&v12 viewWillAppear:v3];
}

- (void)viewDidLayoutSubviews
{
  [(WKFullScreenViewController *)self _updateWebViewFullscreenInsets];
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");
  self->_secheuristic.m_size.width = v3;
  self->_secheuristic.m_size.height = v4;
  double v5 = [(WKFullScreenViewController *)self _webView];
  [self->_animatingView.m_ptr bounds];
  -[WKWebView setFrame:](v5, "setFrame:");
  m_ptr = self->_bannerLabel.m_ptr;
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "bounds");

  [m_ptr setPreferredMaxLayoutWidth:v7];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)WKFullScreenViewController;
  [(WKFullScreenViewController *)&v7 viewWillTransitionToSize:a3.width withTransitionCoordinator:a3.height];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__WKFullScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v6[3] = &unk_1E5813888;
  v6[4] = self;
  [a4 animateAlongsideTransition:v6 completion:0];
}

uint64_t __81__WKFullScreenViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v1 = (void *)[*(id *)(a1 + 32) _webView];
  uint64_t v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication"), "statusBarOrientation");

  return [v1 _setInterfaceOrientationOverride:v2];
}

- (int64_t)preferredStatusBarStyle
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return self->_animating || self->_prefersStatusBarHidden;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  if (![(WKFullScreenViewController *)self isAnimating]) {
    [(WKFullScreenViewController *)self showUI];
  }
  return 1;
}

- (void)_manager
{
  UIEdgeInsets result = [(WKFullScreenViewController *)self _webView];
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

- (RectEdges<float>)_effectiveFullscreenInsets
{
  objc_msgSend((id)-[WKFullScreenViewController view](self, "view"), "safeAreaInsets");
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;
  [self->_cancelButton.m_ptr frame];
  CGFloat x = v20.origin.x;
  CGFloat y = v20.origin.y;
  CGFloat width = v20.size.width;
  CGFloat height = v20.size.height;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  objc_msgSend(self->_cancelButton.m_ptr, "convertPoint:toView:", -[WKFullScreenViewController view](self, "view"), MaxX, CGRectGetMaxY(v21));
  float v15 = v14;
  float v16 = v4;
  float v17 = v6;
  float v18 = v8;
  result.m_sides.__elems_[3] = v18;
  result.m_sides.__elems_[2] = v17;
  result.m_sides.__elems_[1] = v16;
  result.m_sides.__elems_[0] = v15;
  return result;
}

- (RefPtr<WebCore::PlaybackSessionInterfaceAVKit,)_playbackSessionInterface
{
  double v3 = v2;
  float v4 = [(WKFullScreenViewController *)self _webView];
  if (!v4) {
    goto LABEL_6;
  }
  float v4 = (uint64_t *)[v4 _page];
  uint64_t v5 = v7;
  if (v7)
  {
    float v4 = *(uint64_t **)(v7 + 424);
    if (v4)
    {
      uint64_t v6 = v4[6];
      if (v6)
      {
        float v4 = WebKit::PlaybackSessionManagerProxy::ensureModelAndInterface((uint64_t)v4, v6);
        uint64_t v5 = v4[1];
        ++*(_DWORD *)(v5 + 16);
        goto LABEL_7;
      }
    }
LABEL_6:
    uint64_t v5 = 0;
  }
LABEL_7:
  *double v3 = v5;
  return (RefPtr<WebCore::PlaybackSessionInterfaceAVKit, WTF::RawPtrTraits<WebCore::PlaybackSessionInterfaceAVKit>, WTF::DefaultRefDerefTraits<WebCore::PlaybackSessionInterfaceAVKit>>)v4;
}

- (void)_pauseIfNeeded
{
  double v3 = [(WKFullScreenViewController *)self _webView];
  if (v3)
  {
    [(WKWebView *)v3 _page];
    if (v7)
    {
      CFRetain(*((CFTypeRef *)v7 + 1));
      uint64_t v5 = *((void *)v7 + 34);
      {
        WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
        WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
      }
      if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v5 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v4) & 1) == 0&& self)
      {
        [(WKFullScreenViewController *)self _playbackSessionInterface];
        uint64_t v6 = WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel(v7);
        if (v6) {
          (*(void (**)(uint64_t))(*(void *)v6 + 72))(v6);
        }
        if (*((_DWORD *)v7 + 4) == 1) {
          (*(void (**)())(*(void *)v7 + 8))();
        }
        else {
          --*((_DWORD *)v7 + 4);
        }
      }
      CFRelease(*((CFTypeRef *)v7 + 1));
    }
  }
}

- (void)_cancelAction:(id)a3
{
  double v3 = [(WKFullScreenViewController *)self delegate];

  [(WKFullScreenViewControllerDelegate *)v3 requestExitFullScreen];
}

- (void)_togglePiPAction:(id)a3
{
  if (self)
  {
    [(WKFullScreenViewController *)self _playbackSessionInterface];
    if (v4)
    {
      uint64_t v3 = WebCore::PlaybackSessionInterfaceIOS::playbackSessionModel(v4);
      if (v3) {
        (*(void (**)(uint64_t))(*(void *)v3 + 176))(v3);
      }
      if (*((_DWORD *)v4 + 4) == 1) {
        (*(void (**)())(*(void *)v4 + 8))();
      }
      else {
        --*((_DWORD *)v4 + 4);
      }
    }
  }
}

- (void)_enterVideoFullscreenAction:(id)a3
{
  uint64_t v3 = [(WKFullScreenViewController *)self _webView];
  if (v3)
  {
    [(WKWebView *)v3 _page];
    if (v4)
    {
      CFRetain(*(CFTypeRef *)(v4 + 8));
      WebKit::WebPageProxy::enterFullscreen((void *)v4);
      CFRelease(*(CFTypeRef *)(v4 + 8));
    }
  }
}

- (void)_touchDetected:(id)a3
{
  if (objc_msgSend(self->_touchGestureRecognizer.m_ptr, "state", a3) == 3
    && ![(WKWebView *)[(WKFullScreenViewController *)self _webView] _shouldAvoidSecurityHeuristicScoreUpdates])
  {
    objc_msgSend(self->_touchGestureRecognizer.m_ptr, "locationInView:", -[WKFullScreenViewController view](self, "view"));
    WebKit::FullscreenTouchSecheuristic::scoreOfNextTouch((WebKit::FullscreenTouchSecheuristic *)&self->_secheuristic, v6);
    if (v4 > self->_secheuristic.m_parameters.requiredScore) {
      [(WKFullScreenViewController *)self _showPhishingAlert];
    }
  }
  if (![(WKFullScreenViewController *)self isAnimating])
  {
    [(WKFullScreenViewController *)self showUI];
  }
}

- (void)_statusBarFrameDidChange:(id)a3
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F42738], "sharedApplication", a3), "statusBarFrame");
  if (v4 != 0.0 && v4 != self->_nonZeroStatusBarHeight)
  {
    self->_nonZeroStatusBarHeight = v4;
    [(WKFullScreenViewController *)self _updateWebViewFullscreenInsets];
  }
}

- (void)_updateWebViewFullscreenInsets
{
  uint64_t v3 = [(WKFullScreenViewController *)self _manager];
  if (v3)
  {
    double v4 = v3;
    [(WKFullScreenViewController *)self _effectiveFullscreenInsets];
    v11[0] = v5;
    v11[1] = v6;
    v11[2] = v7;
    v11[3] = v8;
    uint64_t v9 = v4[3];
    uint64_t v10 = *(void *)(v9 + 256);
    objc_super v12 = (float *)v11;
    WebKit::AuxiliaryProcessProxy::send<Messages::WebFullScreenManager::SetFullscreenInsets>(v10, &v12, *(void *)(*(void *)(v9 + 32) + 1928), 0);
  }
}

- (void)_showPhishingAlert
{
  uint64_t v3 = [(WKFullScreenViewController *)self _webView];
  if (v3 && ([(WKWebView *)v3 _page], (int v5 = v31) != 0))
  {
    CFRetain(v31[1]);
    int v7 = (char *)v31[34];
    {
      WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl += 2;
      WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::keCGFloat y = (uint64_t)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::$_0::operator() const(void)::impl;
    }
    if ((WebKit::WebPreferencesStore::getBoolValueForKey((WebKit::WebPreferencesStore *)(v7 + 40), (WTF::StringImpl **)&WebKit::WebPreferencesKey::fullScreenEnabledKey(void)::key, v6) & 1) == 0)
    {
      *(_OWORD *)&self->_secheuristic.m_lastTouchTime.m_value = xmmword_1994F6F60;
      *(_OWORD *)&self->_secheuristic.m_lastTouchLocation.CGFloat y = xmmword_1994F6F70;
LABEL_35:
      CFRelease(v5[1]);
      return;
    }
    char v8 = 0;
  }
  else
  {
    int v5 = 0;
    char v8 = 1;
  }
  WebCore::localizedString((uint64_t *)&v31, (WebCore *)@"It looks like you are typing while in full screen", v4);
  if (v31)
  {
    uint64_t v10 = (WebKit *)WTF::StringImpl::operator NSString *();
    uint64_t v11 = (WTF::StringImpl *)v31;
    CFTypeRef v31 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2) {
        WTF::StringImpl::destroy(v11, v9);
      }
      else {
        *(_DWORD *)v11 -= 2;
      }
    }
  }
  else
  {
    uint64_t v10 = (WebKit *)&stru_1EEA10550;
  }
  objc_super v12 = NSString;
  WebCore::copyLocalizedString((uint64_t *)&v31, (WebCore *)@"Typing is not allowed in full screen websites. “%@” may be showing a fake keyboard to trick you into disclosing personal or financial information.", (const __CFString *)v9);
  if (v31)
  {
    CFAutorelease(v31);
    id v13 = v31;
  }
  else
  {
    id v13 = 0;
  }
  WebKit::createUIAlertController(v10, (NSString *)objc_msgSend(v12, "stringWithFormat:", v13, -[WKFullScreenViewController location](self, "location")), &v31);
  if ((v8 & 1) == 0)
  {
    float v15 = (WTF::StringImpl *)WTF::fastMalloc((WTF *)0x10);
    *(void *)float v15 = &unk_1EE9D51E0;
    CFStringRef v30 = v15;
    WebKit::WebPageProxy::suspendAllMediaPlayback((uint64_t)v5, (uint64_t *)&v30);
    uint64_t v16 = (uint64_t)v30;
    CFStringRef v30 = 0;
    if (v16) {
      (*(void (**)(uint64_t))(*(void *)v16 + 8))(v16);
    }
    WebKit::WebPageProxy::suspendActiveDOMObjectsAndAnimations((uint64_t)v5);
  }
  float v17 = (void *)MEMORY[0x1E4F42720];
  WebCore::localizedString((uint64_t *)&v30, (WebCore *)@"Exit Full Screen (Element Full Screen)", v14);
  if (v30) {
    float v18 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    float v18 = &stru_1EEA10550;
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__WKFullScreenViewController__showPhishingAlert__block_invoke;
  v29[3] = &unk_1E5813460;
  v29[4] = self;
  uint64_t v20 = [v17 actionWithTitle:v18 style:1 handler:v29];
  CGRect v21 = v30;
  CFStringRef v30 = 0;
  if (v21)
  {
    if (*(_DWORD *)v21 == 2) {
      WTF::StringImpl::destroy(v21, v19);
    }
    else {
      *(_DWORD *)v21 -= 2;
    }
  }
  v22 = (void *)MEMORY[0x1E4F42720];
  WebCore::localizedString((uint64_t *)&v30, (WebCore *)@"Stay in Full Screen (Element Full Screen)", (const __CFString *)v19);
  if (v30) {
    v23 = (__CFString *)WTF::StringImpl::operator NSString *();
  }
  else {
    v23 = &stru_1EEA10550;
  }
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __48__WKFullScreenViewController__showPhishingAlert__block_invoke_2;
  v28[3] = &unk_1E5813460;
  v28[4] = self;
  uint64_t v25 = [v22 actionWithTitle:v23 style:0 handler:v28];
  v26 = v30;
  CFStringRef v30 = 0;
  if (v26)
  {
    if (*(_DWORD *)v26 == 2) {
      WTF::StringImpl::destroy(v26, v24);
    }
    else {
      *(_DWORD *)v26 -= 2;
    }
  }
  [(CFTypeRef *)v31 addAction:v20];
  [(CFTypeRef *)v31 addAction:v25];
  [(WKFullScreenViewController *)self presentViewController:v31 animated:1 completion:0];
  v27 = v31;
  CFTypeRef v31 = 0;
  if (v27) {
    CFRelease(v27);
  }
  if ((v8 & 1) == 0) {
    goto LABEL_35;
  }
}

void __48__WKFullScreenViewController__showPhishingAlert__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _cancelAction:a2];
  uint64_t v3 = (void *)[*(id *)(a1 + 32) _webView];
  if (v3)
  {
    [v3 _page];
    uint64_t v4 = (uint64_t)v7;
    if (v7)
    {
      CFRetain((CFTypeRef)v7[1]);
      WebKit::WebPageProxy::resumeActiveDOMObjectsAndAnimations(v4);
      int v5 = (void *)WTF::fastMalloc((WTF *)0x10);
      *int v5 = &unk_1EE9D5208;
      int v7 = v5;
      WebKit::WebPageProxy::resumeAllMediaPlayback(v4, (uint64_t *)&v7);
      uint64_t v6 = (uint64_t)v7;
      int v7 = 0;
      if (v6) {
        (*(void (**)(uint64_t))(*(void *)v6 + 8))(v6);
      }
      CFRelease(*(CFTypeRef *)(v4 + 8));
    }
  }
}

double __48__WKFullScreenViewController__showPhishingAlert__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) _webView];
  if (v2)
  {
    [v2 _page];
    uint64_t v3 = (uint64_t)v8;
    if (v8)
    {
      CFRetain((CFTypeRef)v8[1]);
      WebKit::WebPageProxy::resumeActiveDOMObjectsAndAnimations(v3);
      uint64_t v4 = (void *)WTF::fastMalloc((WTF *)0x10);
      void *v4 = &unk_1EE9D5230;
      char v8 = v4;
      WebKit::WebPageProxy::resumeAllMediaPlayback(v3, (uint64_t *)&v8);
      uint64_t v5 = (uint64_t)v8;
      char v8 = 0;
      if (v5) {
        (*(void (**)(uint64_t))(*(void *)v5 + 8))(v5);
      }
      CFRelease(*(CFTypeRef *)(v3 + 8));
    }
  }
  uint64_t v6 = *(void *)(a1 + 32) + 1096;
  double result = 0.0;
  *(_OWORD *)(v6 + 80) = xmmword_1994F6F60;
  *(_OWORD *)(v6 + 96) = xmmword_1994F6F70;
  return result;
}

- (id)_createButtonWithExtrinsicContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v6 = +[WKExtrinsicButton buttonWithType:1];
  [(WKFullScreenViewController *)self _setupButton:v6];
  [(WKExtrinsicButton *)v6 setDelegate:self];
  -[WKExtrinsicButton setExtrinsicContentSize:](v6, "setExtrinsicContentSize:", width, height);
  return v6;
}

- (void)_setupButton:(id)a3
{
  [a3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [a3 setAdjustsImageWhenHighlighted:0];
  uint64_t v4 = [MEMORY[0x1E4F428B8] whiteColor];

  [a3 setTintColor:v4];
}

- (void)wkExtrinsicButtonWillDisplayMenu:(id)a3
{
  self->_isShowingMenu = 1;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
}

- (void)wkExtrinsicButtonWillDismissMenu:(id)a3
{
  self->_isShowingMenu = 0;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_hideUI object:0];
  if (self->_playing)
  {
    [(WKFullScreenViewController *)self performSelector:sel_hideUI withObject:0 afterDelay:4.0];
  }
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return self->_prefersHomeIndicatorAutoHidden;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (BOOL)isinWindowFullscreenActive
{
  return self->_inWindowFullscreenActive;
}

- (void)setInWindowFullscreenActive:(BOOL)a3
{
  self->_inWindowFullscreenActive = a3;
}

- (BOOL)isAnimating
{
  return self->_animating;
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
  m_ptr = self->_playbackClient.m_interface.m_ptr;
  self->_playbackClient.m_interface.m_ptr = 0;
  if (m_ptr)
  {
    if (*((_DWORD *)m_ptr + 4) == 1) {
      (*(void (**)(PlaybackSessionInterfaceIOS *))(*(void *)m_ptr + 8))(m_ptr);
    }
    else {
      --*((_DWORD *)m_ptr + 4);
    }
  }
  objc_destroyWeak(&self->_playbackClient.m_parent.m_weakReference);
  WTF::WeakPtrFactory<WebPushD::PushServiceConnection,WTF::DefaultWeakPtrImpl>::~WeakPtrFactory((unsigned int **)&self->_playbackClient.m_weakPtrFactory, v4);
  uint64_t v6 = self->_location.m_impl.m_ptr;
  self->_location.m_impl.m_ptr = 0;
  if (v6)
  {
    if (*(_DWORD *)v6 == 2) {
      WTF::StringImpl::destroy((WTF::StringImpl *)v6, v5);
    }
    else {
      *(_DWORD *)v6 -= 2;
    }
  }
  int v7 = self->_topConstraint.m_ptr;
  self->_topConstraint.m_ptr = 0;
  if (v7) {
    CFRelease(v7);
  }
  char v8 = self->_topGuide.m_ptr;
  self->_topGuide.m_ptr = 0;
  if (v8) {
    CFRelease(v8);
  }
  uint64_t v9 = self->_locationButton.m_ptr;
  self->_locationButton.m_ptr = 0;
  if (v9) {
    CFRelease(v9);
  }
  uint64_t v10 = self->_pipButton.m_ptr;
  self->_pipButton.m_ptr = 0;
  if (v10) {
    CFRelease(v10);
  }
  uint64_t v11 = self->_cancelButton.m_ptr;
  self->_cancelButton.m_ptr = 0;
  if (v11) {
    CFRelease(v11);
  }
  objc_super v12 = self->_bannerTapToDismissRecognizer.m_ptr;
  self->_bannerTapToDismissRecognizer.m_ptr = 0;
  if (v12) {
    CFRelease(v12);
  }
  id v13 = self->_bannerLabel.m_ptr;
  self->_bannerLabel.m_ptr = 0;
  if (v13) {
    CFRelease(v13);
  }
  CFStringRef v14 = self->_banner.m_ptr;
  self->_banner.m_ptr = 0;
  if (v14) {
    CFRelease(v14);
  }
  float v15 = self->_stackView.m_ptr;
  self->_stackView.m_ptr = 0;
  if (v15) {
    CFRelease(v15);
  }
  uint64_t v16 = self->_animatingView.m_ptr;
  self->_animatingView.m_ptr = 0;
  if (v16) {
    CFRelease(v16);
  }
  float v17 = self->_touchGestureRecognizer.m_ptr;
  self->_touchGestureRecognizer.m_ptr = 0;
  if (v17) {
    CFRelease(v17);
  }

  objc_destroyWeak(&self->_delegate.m_weakReference);
}

- (id).cxx_construct
{
  *((void *)self + 123) = 0;
  *((void *)self + 124) = 0;
  *((void *)self + 125) = 0;
  *((void *)self + 126) = 0;
  *((void *)self + 127) = 0;
  *((void *)self + 128) = 0;
  *((void *)self + 129) = 0;
  *((void *)self + 130) = 0;
  *((void *)self + 131) = 0;
  *((void *)self + 132) = 0;
  *((void *)self + 133) = 0;
  *((void *)self + 134) = 0;
  *((void *)self + 135) = 0;
  *((void *)self + 136) = 0;
  *((void *)self + 138) = 0;
  *((void *)self + 139) = 0;
  *((void *)self + 137) = 0x3FB999999999999ALL;
  *((void *)self + 146) = 0;
  *((void *)self + 147) = 0;
  *((void *)self + 145) = 0;
  __asm { FMOV            V0.2D, #-1.0 }
  *((_OWORD *)self + 74) = _Q0;
  *((void *)self + 150) = 0;
  *((_DWORD *)self + 306) = 0;
  *((void *)self + 151) = &unk_1EE9D50D8;
  *((void *)self + 152) = 0;
  *((void *)self + 154) = 0;
  *((void *)self + 155) = 0;
  *((unsigned char *)self + 1256) = 0;
  *((unsigned char *)self + 1264) = 0;
  return self;
}

@end