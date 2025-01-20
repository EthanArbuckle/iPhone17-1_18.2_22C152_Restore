@interface SFBrowserContentViewController
@end

@implementation SFBrowserContentViewController

id __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke(uint64_t a1)
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && (SFDebugMenuEnabled() & 1) != 0)
  {
    v2 = (void *)MEMORY[0x1E4FB13F0];
    v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"trash"];
    v4 = [v2 actionWithTitle:@"Kill View Service" image:v3 identifier:0 handler:&__block_literal_global_46];

    [v4 setAttributes:2];
    v5 = NSString;
    v6 = [MEMORY[0x1E4F28F80] processInfo];
    v7 = objc_msgSend(v5, "stringWithFormat:", @"PID %d", objc_msgSend(v6, "processIdentifier"));
    [v4 setSubtitle:v7];

    v8 = (void *)MEMORY[0x1E4FB13F0];
    v9 = [WeakRetained webView];
    v10 = objc_msgSend(v8, "_sf_debugKillWebProcessActionForWebView:", v9);
    v13[0] = v10;
    v13[1] = v4;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  }
  else
  {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __58___SFBrowserContentViewController_initWithNibName_bundle___block_invoke_2()
{
  return [(id)*MEMORY[0x1E4FB2608] terminateWithSuccess];
}

void __82___SFBrowserContentViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F78940]])
  {
    objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1880), "setJavaScriptEnabled:", objc_msgSend(v6, "safari_isJavaScriptEnabled"));
  }
  else
  {
    uint64_t v2 = *MEMORY[0x1E4F78898];
    if ([*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4F78898]])
    {
      objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1880), "_setApplePayCapabilityDisclosureAllowed:", objc_msgSend(v6, "BOOLForKey:", v2));
    }
    else
    {
      if (![*(id *)(a1 + 32) isEqualToString:*MEMORY[0x1E4FB6F30]]) {
        return;
      }
      v3 = *(void **)(a1 + 40);
      id v6 = [v3 webView];
      v4 = [v6 configuration];
      v5 = [v4 websiteDataStore];
      [v3 _setUpCookieStoragePolicyForDataStore:v5];
    }
  }
}

uint64_t __50___SFBrowserContentViewController_setDisplayMode___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpTopBarAndBottomBar];
  [*(id *)(a1 + 32) _updateUI];
  [*(id *)(a1 + 32) _layOutBrowserViewForSizeTransition];
  [*(id *)(a1 + 32) _didCompleteViewSizeTransition];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 setNeedsStatusBarAppearanceUpdate];
}

uint64_t __50___SFBrowserContentViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setUpInterfaceIfNeeded];
}

uint64_t __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setUpWebViewControllerIfNeeded];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __93___SFBrowserContentViewController_decideDataSharingModeAndSetUpWebViewWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(a1 + 32) + 1960) = a2;
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __58___SFBrowserContentViewController__setUpInterfaceIfNeeded__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSuppressingPreviewProgressAnimation:0];
}

uint64_t __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layOutBrowserViewForSizeTransition];
}

uint64_t __86___SFBrowserContentViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _didCompleteViewSizeTransition];
}

void __60___SFBrowserContentViewController__updateDynamicBarGeometry__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1016) navigationBar];
  v3 = *(void **)(*(void *)(a1 + 32) + 1128);
  id v16 = v2;
  [v2 defaultHeight];
  objc_msgSend(v3, "setTopBarHeight:forState:", 1);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 1128);
  int v6 = *(unsigned __int8 *)(v4 + 1201);
  if (*(unsigned char *)(v4 + 1201))
  {
    v3 = [(id)v4 view];
    [v3 safeAreaInsets];
    double v8 = -v7;
  }
  else
  {
    [v16 minimumHeight];
  }
  [v5 setTopBarHeight:0 forState:v8];
  if (v6) {

  }
  [*(id *)(*(void *)(a1 + 32) + 1128) setBottomBarOffset:1 forState:0.0];
  v9 = *(void **)(a1 + 32);
  v10 = (void *)v9[141];
  [v9 _maximumHeightObscuredByBottomBar];
  double v12 = v11;
  _SFOnePixel();
  [v10 setBottomBarOffset:0 forState:v12 + v13];
  v14 = *(void **)(a1 + 32);
  uint64_t v15 = v14[141];
  [v14 _offsetForDynamicBarAnimator];
  objc_msgSend(v14, "dynamicBarAnimator:minimumTopBarHeightForOffset:", v15);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1128), "setMinimumTopBarHeight:");
}

void __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setUserInteractionEnabled:1];
  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 64) + 8) + 72));
  v3 = [MEMORY[0x1E4FB1618] blackColor];
  [v2 setBackgroundColor:v3];

  double v4 = 0.300000012;
  if (*(unsigned char *)(*(void *)(a1 + 40) + 1032)) {
    double v4 = 0.0;
  }
  [v2 setAlpha:v4];
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v5 + 1032))
  {
    [*(id *)(a1 + 48) addSubview:v2];
  }
  else
  {
    int v6 = [*(id *)(v5 + 1016) contentContainerView];
    [v6 insertSubview:v2 belowSubview:*(void *)(a1 + 48)];
  }
  double v7 = (void *)MEMORY[0x1E4FB1EB0];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_2;
  v33[3] = &unk_1E5C72628;
  id v8 = v2;
  uint64_t v9 = *(void *)(a1 + 40);
  id v34 = v8;
  uint64_t v35 = v9;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_3;
  v30[3] = &unk_1E5C76FF8;
  id v10 = v8;
  id v31 = v10;
  id v32 = *(id *)(a1 + 48);
  [v7 animateWithDuration:0 delay:v33 options:v30 animations:0.3 completion:0.0];
  double v11 = (void *)MEMORY[0x1E4FB1EB0];
  int v12 = *(unsigned __int8 *)(*(void *)(a1 + 40) + 1032);
  CAFrameRateRange v36 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v36.minimum;
  float maximum = v36.maximum;
  float preferred = v36.preferred;
  if (v12) {
    double v16 = 0.15;
  }
  else {
    double v16 = 0.0;
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_4;
  v25[3] = &unk_1E5C77020;
  id v17 = *(id *)(a1 + 56);
  uint64_t v29 = *(void *)(a1 + 64);
  uint64_t v18 = *(void *)(a1 + 40);
  v19 = *(void **)(a1 + 48);
  id v26 = v17;
  uint64_t v27 = v18;
  id v28 = v19;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_5;
  v23[3] = &unk_1E5C77048;
  id v24 = *(id *)(a1 + 48);
  *(float *)&double v20 = minimum;
  *(float *)&double v21 = maximum;
  *(float *)&double v22 = preferred;
  objc_msgSend(v11, "sf_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:preferredFrameRateRange:animations:completion:", 0, v25, v23, v16, 0.0, v20, v21, v22);
}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_2(uint64_t a1)
{
  double v1 = 0.300000012;
  if (!*(unsigned char *)(*(void *)(a1 + 40) + 1032)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) superview];
  v3 = *(void **)(a1 + 40);

  if (v2 != v3)
  {
    double v4 = *(void **)(a1 + 32);
    [v4 removeFromSuperview];
  }
}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) frame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  double v10 = *(double *)(v9 + 72);
  double v11 = *(double *)(v9 + 56);
  if (*(unsigned char *)(*(void *)(a1 + 40) + 1032))
  {
    *(double *)(v9 + 56) = v10 + v11;
    double v12 = v2 - v10;
  }
  else
  {
    *(double *)(v9 + 56) = v11 - v10;
    double v12 = v2 + v10;
  }
  objc_msgSend(*(id *)(a1 + 48), "setFrame:", *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 56), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 64), *(double *)(*(void *)(*(void *)(a1 + 56) + 8) + 72));
  double v13 = *(void **)(a1 + 32);

  return objc_msgSend(v13, "setFrame:", v4, v12, v6, v8);
}

uint64_t __79___SFBrowserContentViewController__setShowingReader_deactivationMode_animated___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

void __47___SFBrowserContentViewController_loadRequest___block_invoke(uint64_t a1, void *a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __47___SFBrowserContentViewController_loadRequest___block_invoke_2;
  block[3] = &unk_1E5C77098;
  objc_copyWeak(v6, (id *)(a1 + 40));
  v6[1] = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v6);
}

void __47___SFBrowserContentViewController_loadRequest___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 48);
    if ((unint64_t)(v2 - 1) >= 2)
    {
      if (v2) {
        goto LABEL_7;
      }
      id v5 = (void *)MEMORY[0x1E4F18DA8];
      double v3 = [WeakRetained _fallbackURLForWellKnownChangePasswordURL:WeakRetained[187]];
      double v6 = objc_msgSend(v5, "safari_nonAppInitiatedRequestWithURL:", v3);
      [WeakRetained loadRequest:v6];
    }
    else
    {
      double v3 = [WeakRetained webView];
      id v4 = (id)[v3 loadRequest:*(void *)(a1 + 32)];
    }
  }
LABEL_7:
}

void __50___SFBrowserContentViewController__updateBarItems__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setBarItem:enabled:", 0, objc_msgSend(*(id *)(a1 + 40), "canGoBack"));
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1104), "setBarItem:enabled:", 1, objc_msgSend(*(id *)(a1 + 40), "canGoForward"));
  uint64_t v2 = [*(id *)(a1 + 40) URL];

  [*(id *)(*(void *)(a1 + 32) + 1104) setBarItem:6 enabled:v2 != 0];
  double v3 = *(void **)(a1 + 32);
  id v4 = (void *)v3[138];
  if (v2) {
    uint64_t v5 = [v3 isSafariRestricted] ^ 1;
  }
  else {
    uint64_t v5 = 0;
  }
  [v4 setBarItem:9 enabled:v5];
  [*(id *)(*(void *)(a1 + 32) + 1104) setBarItem:10 hidden:*(unsigned __int8 *)(*(void *)(a1 + 32) + 1568) == 0];
  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v6 + 1568))
  {
    id v13 = [*(id *)(v6 + 1936) activityButton];
    double v7 = [v13 accessibilityLabel];
    double v8 = v7;
    if (v7)
    {
      id v9 = v7;
    }
    else
    {
      id v9 = [*(id *)(*(void *)(a1 + 32) + 1560) activityTitle];
    }
    double v10 = v9;

    double v11 = *(void **)(*(void *)(a1 + 32) + 1104);
    double v12 = [v13 templateImage];
    [v11 setCustomActivityImage:v12 accessibilityLabel:v10];

    uint64_t v6 = *(void *)(a1 + 32);
  }
  id v14 = [*(id *)(v6 + 1160) overlayConfiguration];
  [*(id *)(*(void *)(a1 + 32) + 1104) setAllBarItemsAreDisabled:v14 != 0];
}

void __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateCurrentScrollViewInsets];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1016) currentWebView];
  id v9 = [v2 scrollView];

  [v9 contentOffset];
  double v4 = v3;
  double v6 = v5;
  [v9 adjustedContentInset];
  if (v6 <= -v7) {
    double v8 = -v7;
  }
  else {
    double v8 = v6;
  }
  objc_msgSend(v9, "setContentOffset:", v4, v8);
}

uint64_t __70___SFBrowserContentViewController__setShowingPinnableBanner_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1016) setPinnableBanner:0];
}

void __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _currentWebView];
  id v10 = [v2 scrollView];

  [*(id *)(a1 + 40) center];
  double v4 = v3;
  [*(id *)(a1 + 32) _updateCrashBannerOffset];
  [*(id *)(*(void *)(a1 + 32) + 1016) layoutIfNeeded];
  [v10 contentOffset];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 40) center];
  objc_msgSend(v10, "setContentOffset:", v6, v8 - (v9 - v4));
}

uint64_t __61___SFBrowserContentViewController__showCrashBanner_animated___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 1232))
  {
    [*(id *)(v2 + 1016) setCrashBanner:0];
    uint64_t v2 = *(void *)(a1 + 32);
  }

  return [(id)v2 _updateCurrentScrollViewInsets];
}

void __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke(uint64_t a1, double a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke_2;
  v3[3] = &unk_1E5C770C0;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = *(id *)&a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __64___SFBrowserContentViewController__updatePageZoomWithPreference__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained webView];
  [v2 _setViewScale:v1];
}

void __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    double v5 = [MEMORY[0x1E4F98948] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v6[2] = __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E5C770C0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __59___SFBrowserContentViewController__increasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained webView];
  [v2 _setViewScale:v1];
}

void __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    double v5 = [MEMORY[0x1E4F98948] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:0 method:3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v6[2] = __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E5C770C0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __59___SFBrowserContentViewController__decreasePageZoomSetting__block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained webView];
  [v2 _setViewScale:v1];
}

void __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke(uint64_t a1, int a2, double a3)
{
  if (a2)
  {
    double v5 = [MEMORY[0x1E4F98948] sharedLogger];
    [v5 didModifyPerSitePreferencesWithPreferenceIdentifier:*MEMORY[0x1E4F997D8] modificationLevel:1 type:1 method:3];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    id v6[2] = __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke_2;
    v6[3] = &unk_1E5C770C0;
    objc_copyWeak(v7, (id *)(a1 + 32));
    v7[1] = *(id *)&a3;
    dispatch_async(MEMORY[0x1E4F14428], v6);
    objc_destroyWeak(v7);
  }
}

void __56___SFBrowserContentViewController__resetPageZoomSetting__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v11 = WeakRetained;
    double v3 = [WeakRetained webView];
    [v3 _setViewScale:*(double *)(a1 + 40)];
    double v4 = [v11 view];
    [v3 _minimumEffectiveDeviceWidth];
    if (v5 == 0.0)
    {
      double v9 = 1.0;
    }
    else
    {
      [v4 bounds];
      double v7 = v6;
      [v3 _minimumEffectiveDeviceWidth];
      double v9 = v7 / v8;
    }
    id v10 = [v3 scrollView];
    [v10 setZoomScale:v9];

    id WeakRetained = v11;
  }
}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) webViewController];
  double v5 = [v4 webView];

  double v6 = *(void **)(a1 + 32);
  if (!v6[162])
  {
    double v7 = [[_SFSafariSharingExtensionController alloc] initWithWebView:v5];
    uint64_t v8 = *(void *)(a1 + 32);
    double v9 = *(void **)(v8 + 1296);
    *(void *)(v8 + 1296) = v7;

    double v6 = *(void **)(a1 + 32);
  }
  id v24 = [v6 _hostAppBundleId];
  id v10 = *(unsigned char **)(a1 + 32);
  if (v10[1568])
  {
    id v11 = [v5 title];
    double v12 = [v10 _itemProviderCollectionForSharingURL:v3 title:v11];

    id v13 = [_SFActivityViewController alloc];
    id v14 = [v5 URL];
    uint64_t v15 = [(_SFActivityViewController *)v13 initWithActivityItemProviderCollection:v12 applicationActivities:0 sharingURL:v3 sourceURL:v14];

    [(_SFActivityViewController *)v15 setSharingExtensionController:*(void *)(*(void *)(a1 + 32) + 1296)];
    objc_initWeak((id *)location, v15);
    double v16 = [*(id *)(*(void *)(a1 + 32) + 1936) activityButton];
    id v17 = [v16 extensionIdentifier];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_265;
    v25[3] = &unk_1E5C77138;
    objc_copyWeak(&v27, (id *)location);
    id v18 = v17;
    id v26 = v18;
    [*(id *)(*(void *)(a1 + 32) + 1560) setCustomCompletionHandler:v25];
    [(_SFActivityViewController *)v15 prepareJavaScriptExtensionItemForActivity:*(void *)(*(void *)(a1 + 32) + 1560)];
    v19 = *(void **)(*(void *)(a1 + 32) + 1560);
    double v20 = [(_SFActivityViewController *)v15 activityItemProviders];
    [v19 prepareWithActivityItems:v20];

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1560), "_presentActivityOnViewController:animated:completion:");
    objc_destroyWeak(&v27);

    objc_destroyWeak((id *)location);
  }
  else
  {
    double v21 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      double v22 = [*(id *)(*(void *)(a1 + 32) + 1936) activityButton];
      v23 = [v22 extensionIdentifier];
      *(_DWORD *)location = 138543618;
      *(void *)&location[4] = v23;
      __int16 v29 = 2114;
      v30 = v24;
      _os_log_error_impl(&dword_1A690B000, v21, OS_LOG_TYPE_ERROR, "Can't run extension '%{public}@' because it isn't part of the app '%{public}@'", location, 0x16u);
    }
    [*(id *)(a1 + 32) _updateUI];
  }
}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_265(uint64_t a1, unsigned int a2, void *a3, uint64_t a4)
{
  double v7 = (id *)(a1 + 40);
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained(v7);
  if (a4) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = a2;
  }
  id v11 = WeakRetained;
  [WeakRetained activityDidComplete:*(void *)(a1 + 32) withReturnedItems:v8 success:v10];
}

void __56___SFBrowserContentViewController__invokeCustomActivity__block_invoke_2(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id)WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 1936) activityButton];
    double v4 = [v3 extensionIdentifier];
    int v5 = 138543362;
    double v6 = v4;
    _os_log_impl(&dword_1A690B000, v2, OS_LOG_TYPE_INFO, "Presented extension '%{public}@' from a custom toolbar button", (uint8_t *)&v5, 0xCu);
  }
}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke(uint64_t a1, void *a2)
{
  double v4 = [*(id *)(a1 + 32) synchronousTargetApplicationProxy];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  id v7[2] = __51___SFBrowserContentViewController__checkForAppLink__block_invoke_2;
  v7[3] = &unk_1E5C771B0;
  objc_copyWeak(v11, (id *)(a1 + 48));
  id v5 = *(id *)(a1 + 40);
  v11[1] = a2;
  id v8 = v5;
  id v9 = v4;
  id v10 = *(id *)(a1 + 32);
  char v12 = *(unsigned char *)(a1 + 56);
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);

  objc_destroyWeak(v11);
}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke_2(uint64_t a1)
{
  v23[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    double v4 = [*(id *)(a1 + 32) backForwardList];
    id v5 = [v4 currentItem];
    id v6 = (void *)*((void *)WeakRetained + 207);

    if (v5 == v6)
    {
      uint64_t v7 = [*((id *)WeakRetained + 127) pinnableBanner];
      uint64_t v8 = *(void *)(a1 + 64);
      if ((atomic_load_explicit((atomic_uchar *volatile)&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers, memory_order_acquire) & 1) == 0&& __cxa_guard_acquire(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers))
      {
        uint64_t v17 = *MEMORY[0x1E4F99068];
        v23[0] = *MEMORY[0x1E4F990A8];
        v23[1] = v17;
        _ZZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
        __cxa_guard_release(&_ZGVZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers);
      }
      if ((unint64_t)(v8 - 1) > 2
        || (uint64_t v9 = _ZZZZ51___SFBrowserContentViewController__checkForAppLink_EUb0_EUb1_E24systemServiceIdentifiers,
            [*(id *)(a1 + 40) bundleIdentifier],
            id v10 = objc_claimAutoreleasedReturnValue(),
            LOBYTE(v9) = [(id)v9 containsObject:v10],
            v10,
            (v9 & 1) != 0))
      {
        id v11 = v7;
      }
      else
      {
        id v12 = objc_alloc(MEMORY[0x1E4F781C0]);
        uint64_t v13 = *(void *)(a1 + 48);
        uint64_t v18 = MEMORY[0x1E4F143A8];
        uint64_t v19 = 3221225472;
        double v20 = __51___SFBrowserContentViewController__checkForAppLink__block_invoke_3;
        double v21 = &unk_1E5C77188;
        objc_copyWeak(&v22, v2);
        id v11 = (id)[v12 initWithAppLink:v13 openActionHandler:&v18];
        objc_msgSend(v11, "setInitiallyBehindNavigationBar:", *(unsigned char *)(a1 + 72) == 0, v18, v19, v20, v21);
        objc_destroyWeak(&v22);
      }
      id v14 = (void *)*((void *)WeakRetained + 207);
      *((void *)WeakRetained + 207) = 0;

      if (v11)
      {
        uint64_t v15 = [WeakRetained webViewController];
        int v16 = [v15 didFirstPaint];

        if (v16) {
          [WeakRetained _setShowingPinnableBanner:v11 animated:0];
        }
        else {
          objc_storeStrong((id *)WeakRetained + 158, v11);
        }
      }
      else
      {
        [WeakRetained _setShowingPinnableBanner:0 animated:0];
      }
    }
  }
}

void __51___SFBrowserContentViewController__checkForAppLink__block_invoke_3(uint64_t a1, void *a2)
{
  id v6 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v4 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:*MEMORY[0x1E4FA6E90]];
    id v5 = [v6 appLink];
    [v5 openExternallyWithWebBrowserState:v4 referrerURL:0 completionHandler:0];
  }
}

void __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setDelegate:*(void *)(a1 + 32)];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke_2;
  id v12 = &unk_1E5C72628;
  uint64_t v13 = *(void *)(a1 + 32);
  id v4 = v3;
  id v14 = v4;
  id v5 = (void (**)(void))MEMORY[0x1AD0C36A0](&v9);
  id v6 = objc_msgSend(v4, "overlayProvider", v9, v10, v11, v12, v13);

  if (v6)
  {
    uint64_t v7 = [v4 overlayProvider];
    uint64_t v8 = [*(id *)(a1 + 32) perSitePreferencesVendor];
    [v7 requestOverlayWithPreferencesVendor:v8 completion:v5];
  }
  else
  {
    v5[2](v5);
  }
}

void __81___SFBrowserContentViewController_webViewController_didFindAppBannerWithContent___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) webViewController];
  int v3 = [v2 didFirstPaint];

  if (v3)
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 40);
    [v4 _setShowingPinnableBanner:v5 animated:0];
  }
  else
  {
    id v6 = *(void **)(a1 + 40);
    uint64_t v7 = (id *)(*(void *)(a1 + 32) + 1264);
    objc_storeStrong(v7, v6);
  }
}

void __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke(uint64_t a1, char a2)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke_2;
  block[3] = &unk_1E5C77228;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  char v7 = a2;
  id v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __89___SFBrowserContentViewController_webViewControllerDidDetermineReaderAvailability_dueTo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (!WeakRetained) {
    goto LABEL_10;
  }
  if (!*(unsigned char *)(a1 + 48))
  {
    [WeakRetained[145] setShowsReaderButton:1 showsAvailabilityText:1];
    uint64_t v2 = [WeakRetained assistantController];
    int v3 = [*(id *)(a1 + 32) url];
    [v2 didFindLocalContentWithOptions:32 forURL:v3];
    goto LABEL_8;
  }
  uint64_t v2 = [WeakRetained webViewController];
  int v3 = [v2 readerController];
  if (![v3 isReaderAvailable])
  {
LABEL_8:

    goto LABEL_9;
  }
  int v4 = *((unsigned __int8 *)WeakRetained + 1032);

  if (!v4)
  {
    [WeakRetained[145] setShowsReaderButton:1 showsAvailabilityText:0];
    [WeakRetained _showReaderAnimated:WeakRetained[233] == 0];
    if (([WeakRetained isBlockedByScreenTime] & 1) == 0)
    {
      uint64_t v2 = [MEMORY[0x1E4F98948] sharedLogger];
      [v2 didActivateReaderWithTrigger:1];
LABEL_9:
    }
  }
LABEL_10:
}

void __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke_2;
  block[3] = &unk_1E5C73FB8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __89___SFBrowserContentViewController_webViewController_didExtractTextSamplesForTranslation___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v9 = WeakRetained;
    id v4 = [MEMORY[0x1E4F98948] sharedLogger];
    objc_msgSend(v4, "didVisitWebpageSBAWithUserOptedIn:", objc_msgSend(MEMORY[0x1E4F989E8], "userConsentState") == 1);

    id v3 = v9;
    if (*(void *)(a1 + 32))
    {
      int v5 = [v9 allowsBrowsingAssistant];
      id v3 = v9;
      if (v5)
      {
        id v6 = [v9 assistantController];
        id v7 = [*(id *)(a1 + 40) webView];
        id v8 = [v7 URL];
        [v6 checkForAssistantContentFromPegasusForURL:v8 locale:*(void *)(a1 + 32)];

        id v3 = v9;
      }
    }
  }
}

void __140___SFBrowserContentViewController__queueAlertForRedirectToExternalNavigationResult_fromOriginalRequest_isMainFrame_promptPolicy_userAction___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v4 = *(void **)(a1 + 32);
    if (a2)
    {
      if (![v4 appliesOneTimeUserInitiatedActionPolicy]
        || [*(id *)(a1 + 32) externalApplicationCategory] == 2)
      {
        WeakRetained[137] &= ~8uLL;
      }
      [WeakRetained _completeRedirectToExternalNavigationResult:*(void *)(a1 + 32) fromOriginalRequest:*(void *)(a1 + 40) dialogResult:a2];
    }
    else
    {
      if (![v4 appliesOneTimeUserInitiatedActionPolicy]
        || [*(id *)(a1 + 32) externalApplicationCategory] == 2)
      {
        WeakRetained[137] = 0;
      }
      [WeakRetained _redirectToExternalNavigationResult:*(void *)(a1 + 32) fromOriginalRequest:*(void *)(a1 + 40) promptPolicy:0 isMainFrame:*(unsigned __int8 *)(a1 + 64) userAction:*(void *)(a1 + 48)];
    }
    uint64_t v5 = MEMORY[0x1AD0C36A0](WeakRetained[205]);
    id v6 = (void *)v5;
    if (v5) {
      (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, 1);
    }
  }
}

void __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke(uint64_t a1, char a2)
{
  id v3 = *(unsigned char **)(a1 + 32);
  if (a2)
  {
    id v4 = [v3 view];
    uint64_t v5 = [v4 window];
    id v6 = [v5 windowScene];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_2;
    v10[3] = &unk_1E5C74810;
    uint64_t v7 = *(void *)(a1 + 40);
    v10[4] = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 48);
    id v12 = *(id *)(a1 + 56);
    objc_msgSend(v6, "_sf_openTelURL:completionHandler:", v7, v10);
  }
  else
  {
    v3[1320] = 0;
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 1640);
    if (v8)
    {
      uint64_t v9 = *(void (**)(void))(v8 + 16);
      v9();
    }
  }
}

uint64_t __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_2(uint64_t a1, int a2)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1320) = 0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 1328);
  if (a2)
  {
    [v3 userAcceptedCallPrompt];
    [*(id *)(a1 + 32) _completeRedirectToExternalNavigationResult:*(void *)(a1 + 40) fromOriginalRequest:*(void *)(a1 + 48) dialogResult:0];
  }
  else
  {
    [v3 userDeclinedCallPrompt];
  }
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 1640);
  if (result)
  {
    uint64_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __127___SFBrowserContentViewController__redirectToExternalNavigationResult_fromOriginalRequest_promptPolicy_isMainFrame_userAction___block_invoke_3(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) _completeRedirectToExternalNavigationResult:*(void *)(result + 40) fromOriginalRequest:*(void *)(result + 48) dialogResult:0];
  }
  return result;
}

uint64_t __101___SFBrowserContentViewController_resultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v5 = [*(id *)(a1 + 32) URL];
  id v6 = [*(id *)(a1 + 40) webView];
  uint64_t v7 = [v6 _committedURL];
  uint64_t v8 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, v7, objc_msgSend(*(id *)(*(void *)(a1 + 40) + 1872), "loadedUsingDesktopUserAgent"));

  return v8;
}

uint64_t __129___SFBrowserContentViewController__determineResultOfLoadingRequest_inMainFrame_disallowRedirectToExternalApps_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v5 = [*(id *)(a1 + 32) URL];
  uint64_t v6 = objc_msgSend(v4, "_sf_shouldOverrideiCloudSharingURL:withAppRedirectURL:referrerURL:loadedUsingDesktopUserAgent:", v5, v3, *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  return v6;
}

void __108___SFBrowserContentViewController__redirectToNewsIfNeededForRequest_isMainFrame_userAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  if ((unint64_t)(a2 + 1) <= 4)
  {
    if (((1 << (a2 + 1)) & 0xB) != 0)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v3 = *(void **)(a1 + 32);
      id v6 = [*(id *)(a1 + 40) URL];
      objc_msgSend(v3, "_didResolveDestinationURL:pendingAppLinkCheck:");
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v4 = *(void **)(a1 + 32);
      id v7 = [*(id *)(a1 + 48) url];
      objc_msgSend(v4, "_didResolveDestinationURL:pendingAppLinkCheck:");

      uint64_t v5 = *(void **)(a1 + 32);
      id v6 = +[_SFNavigationResult resultWithAppLink:*(void *)(a1 + 48)];
      objc_msgSend(v5, "_redirectToExternalNavigationResult:fromOriginalRequest:promptPolicy:isMainFrame:userAction:");
    }
  }
}

void __101___SFBrowserContentViewController_webViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _didDecideNavigationPolicy:a2 forNavigationAction:*(void *)(a1 + 32)];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  if (WeakRetained)
  {
    if (*(unsigned char *)(a1 + 56))
    {
      --WeakRetained[203];
      id v7 = WBS_LOG_CHANNEL_PREFIXPageLoading();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v8 = WeakRetained[203];
        int v9 = 134218240;
        uint64_t v10 = WeakRetained;
        __int16 v11 = 2048;
        uint64_t v12 = v8;
        _os_log_impl(&dword_1A690B000, v7, OS_LOG_TYPE_INFO, "(%p) Concurrent navigation action policy decisions: %zd", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v8 = WeakRetained;
  if (WeakRetained)
  {
    (id)MEMORY[0x1AD0C36A0](WeakRetained[205]);
    id v5 = (void *)v8[205];
    v8[205] = 0;

    id WeakRetained = v8;
  }
  if (a2
    && ([WeakRetained webViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isLoading],
        v6,
        !v7))
  {
    [v8 webViewController:*(void *)(a1 + 32) decidePolicyForNavigationAction:*(void *)(a1 + 40) decisionHandler:*(void *)(a1 + 48)];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained || a2 && objc_msgSend(*(id *)(a1 + 32), "_sf_shouldPerformDownload"))
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v6 = [WeakRetained _navigationUtilitiesManager];
    uint64_t v7 = *(void *)(a1 + 40);
    uint64_t v8 = *(unsigned __int8 *)(a1 + 72);
    uint64_t v9 = *(void *)(a1 + 64);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    id v11[2] = __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_3;
    v11[3] = &unk_1E5C773B8;
    objc_copyWeak(v14, v4);
    id v13 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    char v15 = *(unsigned char *)(a1 + 72);
    id v12 = v10;
    v14[1] = a2;
    [v6 websitePoliciesForURL:v7 isForMainFrameNavigation:v8 navigationType:v9 completionHandler:v11];

    objc_destroyWeak(v14);
  }
}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v37 = a2;
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  if (!WeakRetained) {
    goto LABEL_46;
  }
  id v4 = (id *)(WeakRetained + 1368);
  if ([*(id *)(a1 + 32) isEqual:*((void *)WeakRetained + 171)])
  {
    WeakRetained[1377] = WeakRetained[1376] ^ 1;
    BOOL v5 = WeakRetained[1376] == 0;
LABEL_7:
    [v37 _setContentBlockersEnabled:v5];
    goto LABEL_8;
  }
  id v6 = [*(id *)(a1 + 32) host];
  uint64_t v7 = objc_msgSend(v6, "safari_highLevelDomainFromHost");
  uint64_t v8 = [*v4 host];
  uint64_t v9 = objc_msgSend(v8, "safari_highLevelDomainFromHost");
  int v10 = [v7 isEqualToString:v9];

  if (v10)
  {
    objc_storeStrong((id *)WeakRetained + 171, *(id *)(a1 + 32));
    BOOL v5 = WeakRetained[1377] != 0;
    goto LABEL_7;
  }
  if (*(unsigned char *)(a1 + 64))
  {
    id v17 = *v4;
    id *v4 = 0;

    uint64_t v18 = [WeakRetained _navigationUtilitiesManager];
    WeakRetained[1360] = [v18 isContentBlockersPerSiteSettingEnabled];
  }
LABEL_8:
  char v11 = objc_msgSend(*(id *)(a1 + 32), "safari_isSafariWebExtensionURL");
  unsigned int v12 = [WeakRetained supportsAdvancedPrivacyProtectionsForURL:*(void *)(a1 + 32)];
  if ((v11 & 1) == 0)
  {
    unsigned int v13 = v12;
    uint64_t v14 = [WeakRetained isPrivateBrowsingEnabled];
    char v15 = (id *)(WeakRetained + 1736);
    if ([*(id *)(a1 + 32) isEqual:*((void *)WeakRetained + 217)])
    {
      WeakRetained[1745] = WeakRetained[1744] ^ 1;
      unsigned int v16 = WeakRetained[1744] == 0;
    }
    else
    {
      uint64_t v19 = [*(id *)(a1 + 32) host];
      double v20 = objc_msgSend(v19, "safari_highLevelDomainFromHost");
      double v21 = [*v15 host];
      id v22 = objc_msgSend(v21, "safari_highLevelDomainFromHost");
      int v23 = [v20 isEqualToString:v22];

      if (v23)
      {
        objc_storeStrong((id *)WeakRetained + 217, *(id *)(a1 + 32));
        unsigned int v16 = WeakRetained[1745] != 0;
      }
      else
      {
        unsigned int v16 = *(unsigned __int8 *)(a1 + 64);
        if (*(unsigned char *)(a1 + 64))
        {
          id v24 = *v15;
          *char v15 = 0;

          unsigned int v16 = v13;
        }
      }
    }
    if (WeakRetained[1746] == v13) {
      uint64_t v25 = v16;
    }
    else {
      uint64_t v25 = v13;
    }
    WeakRetained[1746] = v13;
    objc_msgSend(v37, "safari_setAdvancedPrivacyProtectionsEnabled:privateBrowsing:", v25, v14);
  }
  int v26 = objc_opt_respondsToSelector();
  int v27 = objc_msgSend(*(id *)(a1 + 32), "safari_hasSameSiteAsURL:", *((void *)WeakRetained + 173));
  if ((!v27 || WeakRetained[1408])
    && *(unsigned char *)(a1 + 64)
    && ([WeakRetained isShowingErrorPage] & 1) == 0)
  {
    id v28 = (void *)*((void *)WeakRetained + 173);
    *((void *)WeakRetained + 173) = 0;

    WeakRetained[1825] = 0;
    WeakRetained[1408] = 0;
  }
  else if (([*(id *)(a1 + 32) isEqual:*((void *)WeakRetained + 173)] & v26) == 1)
  {
    [v37 _setAllowPrivacyProxy:WeakRetained[1392] == 0];
    WeakRetained[1393] = WeakRetained[1392] ^ 1;
  }
  else if ((v27 & v26) == 1)
  {
    [v37 _setAllowPrivacyProxy:WeakRetained[1393]];
  }
  if (*(unsigned char *)(a1 + 64))
  {
    if ([WeakRetained supportsAdvancedPrivacyProtectionsForURL:*(void *)(a1 + 32)]) {
      objc_msgSend(v37, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v37, "_networkConnectionIntegrityPolicy") | 0x10);
    }
    if (*(unsigned char *)(a1 + 64))
    {
      __int16 v29 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
      int v30 = objc_msgSend(v29, "safari_BOOLForKey:defaultValue:", *MEMORY[0x1E4F99748], 0);

      if (v30)
      {
        objc_msgSend(v37, "_setNetworkConnectionIntegrityPolicy:", objc_msgSend(v37, "_networkConnectionIntegrityPolicy") | 4);
        uint64_t v31 = [*(id *)(a1 + 32) host];
        id v32 = objc_msgSend(v31, "safari_highLevelDomainFromHost");
        int v33 = WBSIsEqual();

        if (!v33)
        {
          uint64_t v35 = (void *)*((void *)WeakRetained + 175);
          *((void *)WeakRetained + 175) = 0;

LABEL_40:
          if (*(unsigned char *)(a1 + 64))
          {
            WeakRetained[1360] = [v37 _contentBlockersEnabled];
            if (v26) {
              WeakRetained[1824] = [v37 _allowPrivacyProxy];
            }
            uint64_t v36 = objc_msgSend(v37, "safari_areAdvancedPrivacyProtectionsEnabled");
            WeakRetained[1826] = v36;
            [MEMORY[0x1E4F98A78] determineContentRuleListStateForWebpagePreferences:v37 wasLoadedWithContentBlockersEnabled:WeakRetained[1360] wasLoadedWithAdvancedPrivacyProtectionsEnabled:v36];
            if ([MEMORY[0x1E4F98F60] isLockdownModeEnabledForSafari]
              && (objc_opt_respondsToSelector() & 1) != 0)
            {
              WeakRetained[1713] = [v37 _captivePortalModeEnabled];
            }
          }
          goto LABEL_46;
        }
        uint64_t v34 = [v37 _networkConnectionIntegrityPolicy] | 8;
      }
      else
      {
        uint64_t v34 = [v37 _networkConnectionIntegrityPolicy] | 2;
      }
      [v37 _setNetworkConnectionIntegrityPolicy:v34];
      goto LABEL_40;
    }
  }
LABEL_46:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __110___SFBrowserContentViewController__internalWebViewController_decidePolicyForNavigationAction_decisionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _internalWebViewController:*(void *)(a1 + 32) decidePolicyForNavigationAction:*(void *)(a1 + 40) withResult:v5 decisionHandler:*(void *)(a1 + 56)];
  }
  else {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __103___SFBrowserContentViewController_webViewController_decidePolicyForNavigationResponse_decisionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _didDecideNavigationPolicy:a2 forNavigationResponse:*(void *)(a1 + 40)];
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

uint64_t __96___SFBrowserContentViewController__openNewWebViewIfNeededWithConfiguration_forNavigationAction___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

void __122___SFBrowserContentViewController_webViewController_createWebViewWithConfiguration_forNavigationAction_completionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) _openNewWebViewIfNeededWithConfiguration:*(void *)(a1 + 40) forNavigationAction:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v3();
  }
}

uint64_t __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1288) = 1;
  return [*(id *)(a1 + 32) _updateNavigationBar];
}

uint64_t __105___SFBrowserContentViewController_webViewController_didReceiveAuthenticationChallenge_completionHandler___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1288) = 0;
  return [*(id *)(a1 + 32) _updateNavigationBar];
}

uint64_t __76___SFBrowserContentViewController_webViewControllerShouldFillStringForFind___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1728) = 0;
  return result;
}

void __81___SFBrowserContentViewController__willCommitContextMenuForWebView_withAnimator___block_invoke(uint64_t a1)
{
  id v1 = +[_SFLinkPreviewHelper linkPreviewHelperForWebView:*(void *)(a1 + 32)];
  [v1 commitPreviewViewController];
}

void __54___SFBrowserContentViewController__receivedTouchDown___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1792) removeFromSuperview];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 1792);
  *(void *)(v2 + 1792) = 0;
}

uint64_t __74___SFBrowserContentViewController_navigationBarFormatMenuButtonWasTapped___block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) reloadBrowsingAssistantIfNeeded];
  }
  return result;
}

void __69___SFBrowserContentViewController__translationAvailabilityDidChange___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) object];
  id v2 = [*(id *)(a1 + 40) translationContext];

  id v3 = v9;
  if (v9 == v2)
  {
    id v4 = [*(id *)(a1 + 32) userInfo];
    id v5 = objc_msgSend(v4, "safari_numberForKey:", *MEMORY[0x1E4F99730]);

    if ([v5 unsignedIntegerValue])
    {
      [*(id *)(*(void *)(a1 + 40) + 1160) setShowsTranslationButton:1];
      id v6 = [*(id *)(a1 + 40) assistantController];
      uint64_t v7 = [*(id *)(a1 + 40) webViewController];
      uint64_t v8 = [v7 url];
      [v6 didFindLocalContentWithOptions:64 forURL:v8];
    }
    id v3 = v9;
  }
}

void __53___SFBrowserContentViewController_downloadDidFinish___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained) {
    [WeakRetained _showDownload:*(void *)(a1 + 32)];
  }
  else {
    [*(id *)(a1 + 32) removeFromDisk];
  }
}

uint64_t __49___SFBrowserContentViewController__showDownload___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_addObjectUnlessNil:", a2);
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_352(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49___SFBrowserContentViewController__showDownload___block_invoke_352_cold_1();
    }

    [*(id *)(a1 + 32) _showGenericDownloadAlert];
  }
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_355(uint64_t a1, uint64_t a2, void *a3)
{
  block[8] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __49___SFBrowserContentViewController__showDownload___block_invoke_355_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49___SFBrowserContentViewController__showDownload___block_invoke_356;
    block[3] = &unk_1E5C73108;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __49___SFBrowserContentViewController__showDownload___block_invoke_356(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1208) addInvalidProfileAlert];
}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v8[4] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = (id)WBS_LOG_CHANNEL_PREFIXDownloads();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1();
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_359;
    block[3] = &unk_1E5C731C0;
    objc_copyWeak(v8, (id *)(a1 + 40));
    dispatch_async(MEMORY[0x1E4F14428], block);
    objc_destroyWeak(v8);
  }
  uint64_t v6 = *(void *)(a1 + 32);
  if (v6) {
    (*(void (**)(void))(v6 + 16))();
  }
}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_359(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    id v2 = (void *)WeakRetained[151];
    id v3 = _WBSLocalizedString();
    id v4 = _WBSLocalizedString();
    [v2 addAlertWithTitle:v3 bodyText:v4];

    id WeakRetained = v5;
  }
}

void __73___SFBrowserContentViewController__fetchSharingURLWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    id v3 = *(id *)(a1 + 32);
  }
  id v4 = v3;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __65___SFBrowserContentViewController__presentActivityViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) title];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65___SFBrowserContentViewController__presentActivityViewController__block_invoke_2;
  v8[3] = &unk_1E5C77548;
  uint64_t v6 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 32);
  id v9 = v6;
  id v7 = v3;
  id v10 = v7;
  id v11 = *(id *)(a1 + 48);
  [v4 _fetchActivityViewControllerInfoForURL:v7 title:v5 completion:v8];
}

void __65___SFBrowserContentViewController__presentActivityViewController__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v35[4] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (!*(void *)(*(void *)(a1 + 32) + 1296))
  {
    id v7 = [[_SFSafariSharingExtensionController alloc] initWithWebView:*(void *)(a1 + 40)];
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = *(void **)(v8 + 1296);
    *(void *)(v8 + 1296) = v7;
  }
  if ([v6 containsObject:@"com.apple.UIKit.activity.AddToHomeScreen"])
  {
    uint64_t v10 = [v6 arrayByAddingObject:@"com.apple.mobilesafari.activity.addToHomeScreen"];

    id v6 = (id)v10;
  }
  id v11 = (void *)MEMORY[0x1E4F1CBF0];
  if (v5) {
    id v11 = v5;
  }
  id v12 = v11;

  unsigned int v13 = [[_SFAddToHomeScreenActivity alloc] initWithWebView:*(void *)(a1 + 40)];
  uint64_t v14 = [v12 arrayByAddingObject:v13];

  uint64_t v15 = *(void *)(a1 + 32);
  unsigned int v16 = *(void **)(v15 + 1584);
  *(void *)(v15 + 1584) = 0;

  uint64_t v17 = *(void *)(a1 + 48);
  uint64_t v18 = *(void **)(a1 + 32);
  uint64_t v19 = [*(id *)(a1 + 40) title];
  double v20 = [v18 _itemProviderCollectionForSharingURL:v17 title:v19];

  double v21 = [_SFActivityViewController alloc];
  uint64_t v22 = *(void *)(a1 + 48);
  int v23 = [*(id *)(a1 + 40) URL];
  id v24 = [(_SFActivityViewController *)v21 initWithActivityItemProviderCollection:v20 applicationActivities:v14 sharingURL:v22 sourceURL:v23];

  [(_SFActivityViewController *)v24 setSharingExtensionController:*(void *)(*(void *)(a1 + 32) + 1296)];
  [(_SFActivityViewController *)v24 setDelegate:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) _isUsedForAuthentication])
  {
    [(_SFActivityViewController *)v24 setExcludedActivityCategories:2];
    uint64_t v25 = *MEMORY[0x1E4F43588];
    v35[0] = *MEMORY[0x1E4F435A0];
    v35[1] = v25;
    v35[2] = *MEMORY[0x1E4F43590];
    v35[3] = @"com.apple.mobilesafari.activity.addToHomeScreen";
    int v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:4];
    [(_SFActivityViewController *)v24 setExcludedActivityTypes:v26];
  }
  else if (objc_msgSend(MEMORY[0x1E4F28B50], "safari_isMobileSafariInstalled"))
  {
    [(_SFActivityViewController *)v24 setExcludedActivityTypes:v6];
  }
  else
  {
    int v27 = (void *)[v6 mutableCopy];
    id v28 = v27;
    if (v27)
    {
      id v29 = v27;
    }
    else
    {
      id v29 = [MEMORY[0x1E4F1CA48] array];
    }
    int v30 = v29;

    [v30 addObject:*MEMORY[0x1E4F43588]];
    [(_SFActivityViewController *)v24 setExcludedActivityTypes:v30];
  }
  [(_SFActivityViewController *)v24 setModalPresentationStyle:7];
  uint64_t v31 = [[_SFPopoverPresentationDelegate alloc] initWithSourceInfo:*(void *)(a1 + 56)];
  id v32 = [(_SFActivityViewController *)v24 popoverPresentationController];
  [(_SFPopoverPresentationDelegate *)v31 attachToPopoverPresentationController:v32];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 1584), v24);
  uint64_t v33 = *(void *)(a1 + 32);
  uint64_t v34 = [*(id *)(v33 + 1584) customizationController];
  [v34 setDelegate:v33];

  [*(id *)(a1 + 32) presentViewController:v24 animated:1 completion:0];
}

void __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _mailContentProvider];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  id v6[2] = __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke_2;
  v6[3] = &unk_1E5C77598;
  uint64_t v5 = *(void *)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  [v4 getMailComposeViewControllerWithMailToURL:0 contentURL:v3 preferredContentType:v5 completionHandler:v6];
}

void __77___SFBrowserContentViewController__emailCurrentPageWithPreferredContentType___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3) {
    [*(id *)(a1 + 32) presentViewController:v3 animated:1 completion:0];
  }
}

void __88___SFBrowserContentViewController__perSiteAutomaticReaderActivationPreferenceDidChange___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) webViewController];
  id v2 = [v9 readerController];
  char v3 = [v2 isReaderAvailable];

  if ((v3 & 1) != 0 && [*(id *)(a1 + 32) _shouldAllowAutomaticReader])
  {
    id v10 = [*(id *)(a1 + 40) userInfo];
    id v4 = objc_msgSend(v10, "safari_stringForKey:", *MEMORY[0x1E4F99178]);
    uint64_t v5 = [*(id *)(a1 + 32) _committedDomainForPreferences];
    if ([v5 isEqualToString:v4])
    {
      uint64_t v6 = objc_msgSend(v10, "safari_BOOLForKey:", *MEMORY[0x1E4F997C8]);
      id v7 = *(unsigned __int8 **)(a1 + 32);
      if (v7[1032] != v6)
      {
        [v7 _setShowingReader:v6 deactivationMode:2 animated:1];
        if (v6)
        {
          uint64_t v8 = [MEMORY[0x1E4F98948] sharedLogger];
          [v8 didActivateReaderWithTrigger:1];
        }
      }
    }
  }
}

void __71___SFBrowserContentViewController__perSitePageZoomPreferenceDidChange___block_invoke(uint64_t a1)
{
  id v9 = [*(id *)(a1 + 32) userInfo];
  id v2 = objc_msgSend(v9, "safari_stringForKey:", *MEMORY[0x1E4F99170]);
  char v3 = [*(id *)(a1 + 40) webView];
  id v4 = [v3 URL];
  uint64_t v5 = objc_msgSend(v4, "safari_userVisibleHostWithoutWWWSubdomain");

  if ([v5 isEqualToString:v2])
  {
    uint64_t v6 = objc_msgSend(v9, "safari_numberForKey:", *MEMORY[0x1E4F992F0]);
    [v6 doubleValue];
    double v8 = v7;

    [v3 _setViewScale:v8];
  }
}

void __75___SFBrowserContentViewController__perSiteLockdownModePreferenceDidChange___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  id v2 = objc_msgSend(v5, "safari_stringForKey:", *MEMORY[0x1E4F99168]);
  char v3 = [*(id *)(a1 + 40) URLForPerSitePreferences];
  id v4 = objc_msgSend(v3, "safari_userVisibleHostWithoutWWWSubdomain");

  if ([v4 isEqualToString:v2]) {
    [*(id *)(a1 + 40) _reloadFromOrigin:0];
  }
}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  char v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained webViewController];
    id v5 = [v4 webView];
    uint64_t v6 = [v5 URL];

    if (v6)
    {
      double v7 = [v3 _digitalHealthManager];
      if ([v3 _personaShouldUseScreenTime])
      {
        double v8 = v3 + 124;
        if (([v6 isEqual:v3[124]] & 1) == 0)
        {
          id v9 = [v3 _hostAppBundleId];
          uint64_t v10 = *MEMORY[0x1E4F99128];
          [v7 updateUsageTrackingForURL:*v8 withBundleIdentifier:v9 profileIdentifier:*MEMORY[0x1E4F99128] toState:0];
          objc_storeStrong(v3 + 124, v6);
          [v7 updateUsageTrackingForURL:*v8 withBundleIdentifier:v9 profileIdentifier:v10 toState:2];
        }
      }
      v15[0] = v6;
      id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_2;
      v12[3] = &unk_1E5C775E8;
      objc_copyWeak(&v14, v1);
      id v13 = v6;
      [v7 getOverlayStateForURLs:v11 withCompletionHandler:v12];

      objc_destroyWeak(&v14);
    }
  }
}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_3;
  block[3] = &unk_1E5C73FB8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v8);
}

void __63___SFBrowserContentViewController__updateDigitalHealthTracking__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v2 = *(void **)(a1 + 32);
    if (v2)
    {
      id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
      uint64_t v4 = [v3 integerValue];

      if ((unint64_t)(v4 - 1) >= 5)
      {
        if (!v4) {
          [WeakRetained _hideDigitalHealthOverlay];
        }
      }
      else
      {
        [WeakRetained _showDigitalHealthOverlayWithPolicy:v4];
      }
    }
  }
}

uint64_t __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_3;
  v2[3] = &unk_1E5C76F80;
  id v3 = *(id *)(a1 + 32);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __82___SFBrowserContentViewController_stopDigitalHealthTrackingWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopObservingWithCompletionHandler:*(void *)(a1 + 40)];
}

void __68___SFBrowserContentViewController__presentSaveWebpageViewController__block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_canSaveWebpageForURL:"))
  {
    id v3 = *(void **)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) title];
    id v5 = [v3 _itemProviderCollectionForSharingURL:v9 title:v4];

    id v6 = [[_SFSaveToFilesOperation alloc] initWithActivityItemProviderCollection:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    id v8 = *(void **)(v7 + 1576);
    *(void *)(v7 + 1576) = v6;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1576), "setDelegate:");
    [*(id *)(*(void *)(a1 + 32) + 1576) start];
  }
}

uint64_t __82___SFBrowserContentViewController_translationContextReloadPageInOriginalLanguage___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadFromOrigin:0];
}

void __93___SFBrowserContentViewController_translationContext_urlForCurrentPageWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) webView];
  id v2 = [v3 URL];
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);
}

void __97___SFBrowserContentViewController_translationContext_showTranslationErrorAlertWithTitle_message___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F78258]);
  [v2 setMessageType:1];
  [v2 setBannerText:*(void *)(a1 + 32) manuallyWrappedBannerText:0];
  [*(id *)(a1 + 40) _showCrashBanner:v2 animated:1];
}

uint64_t __89___SFBrowserContentViewController_translationContext_shouldReportProgressInUnifiedField___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 1649) = *(unsigned char *)(result + 40);
  return result;
}

void __69___SFBrowserContentViewController__translationContextStateDidChange___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) translationContext];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1160), "setShowsTranslationIcon:", objc_msgSend(v3, "hasStartedTranslating"));

  id v4 = [*(id *)(a1 + 32) webViewController];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1976) webpageLocale];
  [v4 setUpFormTelemetryDataMonitorWithWebpageLocale:v2];
}

void __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__406;
  uint64_t v15 = __Block_byref_object_dispose__407;
  id v16 = objc_alloc_init(MEMORY[0x1E4F98F40]);
  [(id)v12[5] setDelegate:*(void *)(a1 + 32)];
  id v2 = (void *)v12[5];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  uint64_t v7 = __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke_409;
  id v8 = &unk_1E5C77688;
  uint64_t v3 = *(void *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  uint64_t v10 = &v11;
  id v4 = [v2 consentAlertForType:v3 withCompletionHandler:&v5];
  objc_msgSend(*(id *)(a1 + 32), "presentViewController:animated:completion:", v4, 1, 0, v5, v6, v7, v8);

  _Block_object_dispose(&v11, 8);
}

void __93___SFBrowserContentViewController__presentTranslationConsentAlertWithType_completionHandler___block_invoke_409(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;
}

void __93___SFBrowserContentViewController_browsingAssistantController_didUpdateContentOptionsForURL___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v10 = [*(id *)(*(void *)(a1 + 40) + 1784) summary];
  uint64_t v3 = _WBSLocalizedString();
  id v4 = _WBSLocalizedString();
  uint64_t v5 = [*(id *)(a1 + 48) absoluteString];
  uint64_t v6 = [v5 stringByReplacingOccurrencesOfString:@"https://" withString:@"safari-reader://"];
  uint64_t v7 = [*(id *)(*(void *)(a1 + 40) + 1784) tableOfContentsTitles];
  id v8 = [*(id *)(*(void *)(a1 + 40) + 1784) tableOfContentsPaths];
  id v9 = [*(id *)(*(void *)(a1 + 40) + 1784) tableOfContentsTrailingTexts];
  [v2 setArticleSummary:v10 withSummaryHeader:v3 tableOfContentsHeader:v4 readerURLString:v6 titles:v7 paths:v8 trailingText:v9];
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_352_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Greenfield download failed: %{public}@", v5);
}

void __49___SFBrowserContentViewController__showDownload___block_invoke_355_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Profile failed to install: %{public}@", v5);
}

void __97___SFBrowserContentViewController__showFinanceKitOrderPreviewControllerWithURL_dismissalHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_0(&dword_1A690B000, v3, v4, "Failed to save Wallet Order: %{public}@", v5);
}

@end